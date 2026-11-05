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
    float4 m_86 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_98 [[user(locn3)]];
    float4 m_76 [[user(locn4)]];
    float4 m_84 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_96 [[user(locn8)]];
    float4 m_92 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_82 [[attribute(0)]];
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
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1707 = false;
    bool _363 = false;
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
        float _1940 = as_type<float>(_133);
        out.gl_Position.z = _1940;
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
    float _153 = 0.0;
    if (_147)
    {
        float _155 = float(_117);
        _153 = _155;
    }
    float _157 = _153;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    if (_163)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _127;
    if (_163)
    {
        out.m_56.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _135 = as_type<int>(_167);
    }
    int _169 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2008 = as_type<float>(_169);
        out.gl_Position.z = _2008;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    float _177 = in.m_62.x;
    float _179 = in.m_62.y;
    float _181 = in.m_62.z;
    float _183 = in.m_64.x;
    float _185 = in.m_64.y;
    float _187 = in.m_64.z;
    float _189 = in.m_66.x;
    float _191 = _171 * _171;
    float _193 = _173 * _173;
    float _195 = _175 * _175;
    float _197 = fma(_177, _177, _191);
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = fma(_187, _187, _201);
    float _209 = sqrt(_203);
    float _211 = sqrt(_205);
    float _213 = sqrt(_207);
    bool _215 = _209 > 0.0;
    bool _217 = _211 > 0.0;
    float _219 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _221 = _203;
    float _223 = _219;
    float _225 = _209;
    if (_215)
    {
        float _227 = rsqrt(_203);
        _221 = _227;
    }
    float _229 = _221;
    float _231 = _219 * _189;
    bool _233 = _213 > 0.0;
    float _235 = 0.0;
    float _237 = _213;
    if (!_215)
    {
        _235 = 0.0;
    }
    float _239 = _235;
    float _241 = 0.0;
    float _243 = _239;
    if (!_215)
    {
        _241 = 0.0;
    }
    float _245 = _241;
    float _247 = 0.0;
    float _249 = _245;
    if (!_215)
    {
        _247 = 0.0;
    }
    float _251 = _247;
    float _253 = 0.0;
    float _255 = _251;
    if (_217)
    {
        float _257 = rsqrt(_205);
        _253 = _257;
    }
    float _259 = _253;
    float _261 = 0.0;
    if (!_217)
    {
        _261 = 0.0;
    }
    float _263 = _261;
    float _265 = 0.0;
    float _267 = _263;
    if (!_217)
    {
        _265 = 0.0;
    }
    float _269 = _265;
    float _271 = 0.0;
    float _273 = _269;
    if (!_217)
    {
        _271 = 0.0;
    }
    float _275 = _271;
    float _277 = _275;
    if (_215)
    {
        float _279 = _229 * _177;
        _243 = _279;
    }
    float _281 = _243;
    float _283 = 0.0;
    if (_233)
    {
        float _285 = rsqrt(_207);
        _283 = _285;
    }
    float _287 = _283;
    if (_215)
    {
        float _289 = _229 * _171;
        _249 = _289;
    }
    float _291 = _249;
    float _293 = _291;
    if (_215)
    {
        float _295 = _229 * _183;
        _255 = _295;
    }
    float _297 = _255;
    bool _299 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    if (!_233)
    {
        _237 = 0.0;
    }
    float _301 = _237;
    float _303 = _301;
    if (!_233)
    {
        _223 = 0.0;
    }
    float _305 = _223;
    float _307 = trunc(_231);
    int _309 = int(_307);
    float _311 = _305;
    if (!_233)
    {
        _225 = 0.0;
    }
    float _313 = _225;
    float _315 = _313;
    if (_217)
    {
        float _317 = _259 * _179;
        _267 = _317;
    }
    float _319 = _267;
    if (_217)
    {
        float _321 = _259 * _173;
        _273 = _321;
    }
    float _323 = _273;
    if (_217)
    {
        float _325 = _259 * _185;
        _277 = _325;
    }
    float _327 = _277;
    if (_233)
    {
        float _329 = _287 * _181;
        _303 = _329;
    }
    float _331 = _303;
    if (_233)
    {
        float _333 = _287 * _175;
        _311 = _333;
    }
    float _335 = _311;
    if (_233)
    {
        float _337 = _287 * _187;
        _315 = _337;
    }
    float _339 = _315;
    int _341 = _309 << 4;
    int _343 = _341 + 1712;
    bool _345 = !_299;
    float _361;
    if (!_345)
    {
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _349 = _189 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        float _365 = float(_117);
        float _367 = 1.0 / _365;
        float _369 = _151 * _367;
        _361 = _369;
    }
    _363 = false;
    float _371 = _361;
    float _373 = in.m_68.w;
    float _375 = in.m_53.x;
    float _377 = in.m_53.y;
    float _379 = in.m_53.z;
    float _381 = in.m_70.x;
    float _383 = in.m_70.y;
    float _385 = in.m_70.z;
    float _387 = in.m_72.x;
    float _389 = in.m_72.y;
    float _391 = in.m_72.z;
    float _393 = in.m_64.w;
    float _395 = in.m_62.w;
    float _397 = trunc(_373);
    int _399 = int(_397);
    int _401 = _399 << 5;
    uint _404 = uint(int(uint(_401) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_404)];
    float _406 = as_type<float>(_dmw0.x);
    int _408 = _401 + 4;
    uint _410 = uint(int(uint(_408) >> uint(2)));
    float _412 = as_type<float>(_dmw0.y);
    int _414 = _401 + 8;
    uint _416 = uint(int(uint(_414) >> uint(2)));
    float _418 = as_type<float>(_dmw0.z);
    int _420 = _401 + 12;
    uint _422 = uint(int(uint(_420) >> uint(2)));
    float _424 = as_type<float>(_dmw0.w);
    float _426 = _185 * _377;
    float _428 = _383 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _430 = _381 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _432 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _387);
    float _434 = fma(_183, _375, _426);
    float _436 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _389);
    float _438 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _440 = _430 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _442 = _385 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _444 = _179 * _377;
    float _446 = _438 * _436;
    float _448 = _440 * _432;
    float _450 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _391);
    float _452 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _454 = _446 * _327;
    float _456 = fma(_177, _375, _444);
    float _458 = fma(_187, _379, _434);
    float _460 = _452 * _450;
    float _462 = _446 * _319;
    float _464 = fma(_448, _297, _454);
    float _466 = fma(_181, _379, _456);
    float _468 = _458 + _393;
    float _470 = fma(_448, _281, _462);
    float _472 = fma(_460, _339, _464);
    float _474 = _466 + _395;
    float _476 = in.m_60.w;
    float _478 = fma(_460, _331, _470);
    float _480 = _468 + _472;
    float _482 = _173 * _377;
    float _484 = _446 * _323;
    float _486 = _474 + _478;
    float _488 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _490 = _480 + _488;
    float _492 = fma(_171, _375, _482);
    float _494 = fma(_448, _291, _484);
    float _496 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _498 = _486 + _496;
    float _500 = _490 * _490;
    float _502 = fma(_175, _379, _492);
    float _504 = fma(_460, _335, _494);
    float _506 = fma(_498, _498, _500);
    float _508 = sqrt(_506);
    bool _510 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _512 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _514 = _510 || _512;
    bool _516 = isnan(0.5);
    bool _518 = _514 || _516;
    float _520 = _502 + _476;
    float _522 = _520 + _504;
    bool _524 = _508 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _526 = _492;
    float _528 = _480;
    if (!_524)
    {
        _526 = _480;
    }
    float _530 = _526;
    float _532 = _424 * 2.0;
    float _534 = _406 * 2.0;
    float _536 = _412 * 2.0;
    float _538 = _412 * _412;
    float _540 = _418 * _532;
    float _542 = _412 * _532;
    float _544 = _406 * _532;
    float _546 = _406 * _406;
    float _548 = -_540;
    float _550 = fma(_412, _534, _548);
    float _552 = fma(_412, _534, _540);
    float _554 = fma(_418, _534, _542);
    float _556 = -_544;
    float _558 = fma(_418, _536, _556);
    float _560 = fma(_418, _536, _544);
    float _562 = -_542;
    float _564 = fma(_418, _534, _562);
    float _566 = _418 * _418;
    float _568 = _544;
    float _570 = _412;
    float _572 = _530;
    if (!_524)
    {
        _568 = _486;
    }
    float _574 = _568;
    float _576 = _574;
    if (!_524)
    {
        _570 = _522;
    }
    float _578 = _570;
    bool _580 = !_524;
    float _582 = _578;
    if (!_580)
    {
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _586 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _588 = _508 + _586;
        float _590 = rsqrt(_506);
        float _592 = _588 * _584;
        float _594 = _522 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _596 = _592 * 0.15915493667125701904296875;
        float _598 = _596 * 6.283185482025146484375;
        float _600 = cos(_598);
        float _602 = _596 * 6.283185482025146484375;
        float _604 = sin(_602);
        float _606 = _600 + (-1.0);
        float _608 = _606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _610 = fma(_604, _594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _612 = fma(_522, _600, _608);
        float _614 = _590 * _610;
        float _616 = fma(_498, _614, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _618 = fma(_490, _614, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _582 = _612;
        _576 = _616;
        _572 = _618;
    }
    float _620 = _582;
    float _622 = _576;
    float _624 = _572;
    float _626 = -_520;
    float _628 = _626 + _620;
    float _630 = -_474;
    float _632 = _630 + _622;
    float _634 = fma(_538, -2.0, 1.0);
    float _636 = -_468;
    float _638 = _636 + _624;
    float _640 = _628 * _323;
    float _642 = _628 * _291;
    float _644 = fma(_546, -2.0, 1.0);
    float _646 = fma(_566, -2.0, _634);
    float _648 = fma(_632, _319, _640);
    float _650 = _628 * _335;
    float _652 = fma(_632, _281, _642);
    float _654 = fma(_566, -2.0, _644);
    float _656 = fma(_638, _327, _648);
    float _658 = fma(_632, _331, _650);
    float _660 = fma(_638, _297, _652);
    float _662 = fma(_538, -2.0, _644);
    float _664 = _656 * _550;
    float _666 = _656 * _654;
    float _668 = _656 * _560;
    float _670 = fma(_638, _339, _658);
    float _672 = fma(_660, _646, _664);
    float _674 = fma(_660, _552, _666);
    float _676 = fma(_660, _564, _668);
    float _678 = fma(_670, _554, _672);
    float _680 = fma(_670, _558, _674);
    float _682 = fma(_670, _662, _676);
    float _684 = _474 + _678;
    float _686 = _520 + _680;
    float _688 = _468 + _682;
    float _690 = _686;
    float _692 = _684;
    float _694 = _688;
    float _696 = _666;
    float _698 = _678;
    float _700 = _638;
    if (!_518)
    {
        float _702 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _704 = _520 + _702;
        float _706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _708 = _474 + _706;
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _712 = _704 * _704;
        float _714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _716 = _468 + _714;
        float _718 = fma(_708, _708, _712);
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _722 = fma(_716, _716, _718);
        float _724 = sqrt(_722);
        float _726 = _710 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _728 = precise::min(_724, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _730 = _728 * _720;
        float _732 = _726 * _730;
        float _734 = fma(_678, _732, _474);
        float _736 = fma(_680, _732, _520);
        float _738 = fma(_682, _732, _468);
        _690 = _736;
        _692 = _734;
        _694 = _738;
        _696 = _730;
    }
    float _740 = _690;
    float _742 = _692;
    float _744 = _694;
    float _746 = _696;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _750 = _740 + _748;
    float _752 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _754 = _742 + _752;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _758 = _744 + _756;
    float _760 = _750 * _750;
    float _762 = fma(_754, _754, _760);
    float _764 = fma(_758, _758, _762);
    float _766 = rsqrt(_764);
    float _768 = sqrt(_764);
    float _770 = _766 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _772 = _754 * _770;
    float _774 = _758 * _770;
    float _776 = _772 * _772;
    float _778 = _774 * _774;
    float _780 = _776 + _778;
    float _782 = sqrt(_780);
    bool _784 = _782 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _786 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _788 = _782 + _786;
    float _790 = _766;
    float _792 = _788;
    float _794 = _750;
    if (_784)
    {
        float _796 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _790 = _796;
    }
    float _798 = _790;
    if (_784)
    {
        float _800 = rsqrt(_780);
        _698 = _800;
    }
    float _802 = _698;
    float _804 = _802;
    if (_784)
    {
        float _806 = _788 * _798;
        _792 = _806;
    }
    float _808 = _792;
    float _810 = _740 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_784)
    {
        float _812 = _808 * 0.15915493667125701904296875;
        _700 = _812;
    }
    float _814 = _700;
    float _816 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[2].x, _810);
    float _818 = _758;
    if (_784)
    {
        float _820 = _814 * 6.283185482025146484375;
        float _822 = sin(_820);
        _818 = _822;
    }
    float _824 = _818;
    float _826 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _828 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[2].z, _816);
    float _830 = precise::max(0.0, _826);
    float _832 = _746;
    float _834 = _830;
    float _836 = _826;
    if (_784)
    {
        float _838 = _814 * 6.283185482025146484375;
        float _840 = cos(_838);
        _832 = _840;
    }
    float _842 = _832;
    float _844 = _828 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _846 = -_770;
    float _848 = -_830;
    float _850 = fma(_750, _846, _848);
    if (!_784)
    {
        _794 = _772;
    }
    float _852 = _794;
    float _854 = _852;
    if (_784)
    {
        float _856 = _850 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _834 = _856;
    }
    float _858 = _834;
    float _860 = _858;
    float _862 = _824;
    if (_784)
    {
        float _864 = fma(_824, _858, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _860 = _864;
    }
    float _866 = _860;
    float _868 = _866;
    if (!_784)
    {
        _862 = _850;
    }
    float _870 = _862;
    float _872 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _874 = fma(_768, (*spvDescriptorSet0.vp_c15)._m0[23].w, _872);
    float _876 = precise::clamp(_874, 0.0, 1.0);
    float _878 = _870;
    float _880 = _842;
    if (_784)
    {
        float _882 = _842 + (-1.0);
        _836 = _882;
    }
    float _884 = _836;
    float _886 = _884;
    if (_784)
    {
        float _888 = _802 * _866;
        _528 = _888;
    }
    float _890 = _528;
    if (!_784)
    {
        _868 = _776;
    }
    float _892 = _868;
    float _894 = _740 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _896 = _892;
    if (_784)
    {
        float _898 = _884 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _804 = _898;
    }
    float _900 = _804;
    if (_784)
    {
        float _902 = _772 * _890;
        _854 = _902;
    }
    float _904 = _854;
    if (!_784)
    {
        _886 = _774;
    }
    float _906 = _886;
    float _908 = _906;
    if (_784)
    {
        float _910 = _774 * _890;
        _908 = _910;
    }
    float _912 = _908;
    if (_784)
    {
        float _914 = fma(_850, _842, _900);
        _878 = _914;
    }
    float _916 = _878;
    if (_784)
    {
        float _918 = _904 * _904;
        _896 = _918;
    }
    float _920 = _896;
    if (!_784)
    {
        _880 = _778;
    }
    float _922 = _880;
    float _924 = _922;
    if (_784)
    {
        float _926 = _912 * _912;
        _924 = _926;
    }
    float _928 = _924;
    float _930 = fma(_916, _916, _920);
    float _932 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[1].x, _894);
    float _934 = -_876;
    float _936 = _934 + 1.0;
    float _938 = _740 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _940 = _930 + _928;
    float _942 = fma(_474, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _944 = _740 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _946 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[1].z, _932);
    float _948 = rsqrt(_940);
    float _950 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[3].x, _938);
    float _952 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[0].x, _944);
    float _954 = _946 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _956 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[3].z, _950);
    float _958 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[0].z, _952);
    float _960 = abs(_936);
    float _962 = log2(_960);
    float _964 = fma(_468, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _966 = _958 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _968 = _954 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _970 = _956 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _972 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[7].x, _968);
    float _974 = _948 * _904;
    float _976 = _948 * _916;
    float _978 = floor(_942);
    float _980 = _948 * _912;
    float _982 = _974 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _984 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[7].z, _972);
    float _986 = -_982;
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c15)._m0[21].y, _986);
    float _990 = _962 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _992 = floor(_964);
    float _994 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[7].w, _984);
    float _996 = -_980;
    float _998 = fma(_996, (*spvDescriptorSet0.vp_c15)._m0[21].z, _988);
    float _1000 = _844 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1002 = fma(_998, 0.5, 0.5);
    float _1004 = fma(_998, -0.5, 0.5);
    float _1006 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1008 = exp2(_990);
    float _1010 = -_978;
    float _1012 = _942 + _1010;
    float _1014 = _954 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1016 = -_1000;
    float _1018 = fma(_1016, _1006, 1.0);
    float _1020 = fma(_1002, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1022 = _954 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1024 = -_992;
    float _1026 = _964 + _1024;
    float _1028 = 1.0 / _994;
    float _1030 = fma(_1002, _1020, -0.212114393711090087890625);
    float _1032 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1022);
    float _1034 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1014);
    float _1036 = _976 + 1.0;
    float _1038 = fma(_1002, _1030, 1.570728778839111328125);
    float _1040 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1032);
    float _1042 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1034);
    float _1044 = log2(_1018);
    float _1046 = -_976;
    float _1048 = fma(_1008, _1036, _1046);
    float _1050 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1040);
    float _1052 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1042);
    float _1054 = fma(_1048, 0.5, 0.5);
    float _1056 = sqrt(_1004);
    float _1058 = _1050 * _1028;
    float _1060 = _1052 * _1028;
    float _1062 = fma(_1058, 0.5, 0.5);
    float _1064 = fma(_1060, -0.5, 0.5);
    float _1066 = _1044 * 0.693147182464599609375;
    float2 _3417 = float2(_1012, _1026);
    float _1068 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3417, float2(0.0), isnan(_3417)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3417, float2(0.0), isnan(_3417)), level(0.0)).x;
    float _1070 = _1066 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1072 = _1056 * 0.636619746685028076171875;
    float _1074 = -_1038;
    float _1076 = fma(_1072, _1074, 1.0);
    float3 _3440 = float3(_1062, _1064, _1070);
    float _1078 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3440, float3(0.0), isnan(_3440)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3440, float3(0.0), isnan(_3440)), level(0.0)).x;
    float3 _3451 = float3(_1062, _1064, _1070);
    float4 _1081 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3451, float3(0.0), isnan(_3451)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3451, float3(0.0), isnan(_3451)), level(0.0)).xyzw;
    float _1083 = _1081.x;
    float _1085 = _1081.y;
    float _1087 = _1081.z;
    float _1089 = _1081.w;
    float2 _3467 = float2(_1076, _1054);
    float3 _1093 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3467, float2(0.0), isnan(_3467)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3467, float2(0.0), isnan(_3467)), level(0.0)).xyz;
    float _1095 = _1093.x;
    float _1097 = _1093.y;
    float _1099 = _1093.z;
    float _1101 = in.m_74.y;
    float _1103 = _520 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1105 = in.m_66.y;
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1109 = _1107 != 0;
    float _1111 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1103);
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1115 = _1113 != 0;
    float _1117 = _962 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1119 = _520 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1121 = fma(_468, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1111);
    float _1123 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1119);
    bool _1125 = _189 > 0.5;
    bool _1127 = _1125 && _1115;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1131 = _1129 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1133 = fma(_468, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1123);
    out.m_76.x = 1.0;
    out.m_76.y = 1.0;
    out.m_76.z = 1.0;
    float _1135 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1139 = _1137 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1141 = -_1101;
    float _1143 = _1141 + 1.0;
    float _1145 = 1.0 / _1131;
    bool _1147 = _1105 > 0.5;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1151 = _1149 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1153 = _1101;
    if (_1109)
    {
        float _1155 = _1147 ? _1143 : _1101;
        _1153 = _1155;
    }
    float _1157 = _1153;
    float _1159 = 1.0 / _1139;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1165 = _389 != 0.0;
    bool _1167 = isnan(_389);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan(0.0);
    bool _1173 = _1169 || _1171;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1177 = 1.0 / _1135;
    float _1179 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1181 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1183 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1185 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1187 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1191 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1189);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1195 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1193);
    float _1197 = _1187 + _1135;
    out.m_78.x = _1181;
    out.m_78.y = _1183;
    out.m_78.z = _1185;
    float _1199 = 1.0 / _1151;
    bool _1201 = _387 == 0.0;
    bool _1203 = !_1173;
    bool _1205 = _1201 && _1203;
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1207;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1213 = _1211 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1215 = in.m_80.x;
    float _1217 = in.m_80.y;
    float _1219 = in.m_80.z;
    float _1221 = _1197 * _1177;
    float _1223 = _1221 * 0.5;
    bool _1225 = _391 == 0.0;
    bool _1227 = _1225 && _1205;
    float _1229 = _1213 * _1159;
    float _1231 = in.m_74.x;
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1235 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1233);
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1237;
    float _1241 = _1209 * _1145;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1245 = _371 + _1243;
    bool _1247 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1249 = isnan(_371);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1255 = _1251 || _1253;
    float _1257 = float(_1255);
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1261 = _371 + _1259;
    float _1263 = 1.0 / _1235;
    bool _1265 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1267 = isnan(_371);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = fma(_1241, _1245, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1279 = _1239 * _1199;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1283 = _371 + _1281;
    float _1285 = -_1257;
    float _1287 = _1285 + 1.0;
    bool _1289 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1291 = isnan(_371);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1297 = _1293 || _1295;
    float _1299 = float(_1297);
    float _1301 = -_1275;
    float _1303 = _1301 + 1.0;
    float _1305 = fma(_1229, _1283, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1307 = _1275 * _1287;
    bool _1309 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1311 = isnan(_371);
    bool _1313 = _1309 || _1311;
    bool _1315 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1317 = _1313 || _1315;
    float _1319 = float(_1317);
    float _1321 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1195);
    float _1323 = _1299 * _1303;
    float _1325 = _1215;
    float _1327 = _1217;
    float _1329 = _1219;
    float _1331 = _1287;
    float _1333 = _1157;
    if (!_1227)
    {
        float _1335 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1215);
        _1325 = _1335;
    }
    float _1337 = _1325;
    if (!_1227)
    {
        float _1339 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1217);
        _1327 = _1339;
    }
    float _1341 = _1327;
    if (!_1227)
    {
        float _1343 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1219);
        _1329 = _1343;
    }
    float _1345 = _1329;
    float _1347 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1349 = _1263 * _1347;
    bool _1351 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    bool _1357 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1359 = _1355 || _1357;
    float _1361 = -_1299;
    float _1363 = _1361 + 1.0;
    float _1365 = _327 * _1341;
    float _1367 = abs(_1349);
    float _1369 = log2(_1367);
    float _1371 = _323 * _1341;
    float _1373 = _468 + _1321;
    uint _1375 = uint(int(uint(_343) >> uint(2)));
    uint _1377 = uint(int(uint(int(_1375)) >> uint(2)));
    int _1379 = int(_1375) & 3;
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[int(_1377)][_1379];
    int _1383 = int(_1375) + 1;
    uint _1385 = uint(int(uint(_1383) >> uint(2)));
    int _1387 = _1383 & 3;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[int(_1385)][_1387];
    float _1391 = _1231;
    if (_1115)
    {
        _1331 = _1231;
    }
    float _1393 = _1331;
    float _1395 = _319 * _1341;
    float _1397 = fma(_291, _1337, _1371);
    float _1399 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1191);
    float _1401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1403 = _1393;
    if (_1127)
    {
        float _1405 = -_1393;
        float _1407 = _1405 + 1.0;
        _1403 = _1407;
    }
    float _1409 = _1403;
    if (_1359)
    {
        float _1411 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _293 = _1411;
    }
    float _1413 = _293;
    int _1415 = _343 + 8;
    uint _1417 = uint(int(uint(_1415) >> uint(2)));
    uint _1419 = uint(int(uint(int(_1417)) >> uint(2)));
    int _1421 = int(_1417) & 3;
    float _1423 = (*spvDescriptorSet0.vp_c9)._m0[int(_1419)][_1421];
    float _1425 = fma(_281, _1337, _1395);
    float _1427 = _1319 * _1363;
    if (_1115)
    {
        _1391 = _1409;
    }
    float _1429 = _1391;
    float _1431 = fma(_1279, _1261, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1433 = _1369 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1437 = fma(_297, _1337, _1365);
    float _1439 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1441 = fma(_331, _1345, _1425);
    float _1443 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1445 = fma(_335, _1345, _1397);
    float _1447 = _1439 * _1401;
    float _1449 = exp2(_1433);
    float _1451 = _1277 * _1427;
    float _1453 = -_1319;
    float _1455 = _1453 + 1.0;
    float _1457 = _1445 * _654;
    float _1459 = _1445 * _560;
    float _1461 = in.m_82.x;
    float _1463 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1451);
    float _1465 = _1443 * _1435;
    float _1467 = exp2(_1117);
    float _1469 = fma(_339, _1345, _1437);
    bool _1471 = _1349 <= 8000.0;
    bool _1473 = isnan(_1349);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan(8000.0);
    bool _1479 = _1475 || _1477;
    float _1481 = float(_1479);
    float _1483 = _474 + _1399;
    out.m_84.x = _1465;
    out.m_84.y = _1447;
    if (_1359)
    {
        float _1485 = precise::min(_1413, 20.0);
        _1333 = _1485;
    }
    float _1487 = _1333;
    float _1489 = fma(_1305, _1323, _1463);
    float _1491 = fma(_1449, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1493 = precise::clamp(_1491, 0.0, 1.0);
    float _1495 = -_1483;
    float _1497 = _1495 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1499 = -_1373;
    float _1501 = _1499 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1503 = fma(_1431, _1307, _1489);
    float _1505 = fma(_1493, -2.0, 3.0);
    float _1507 = _1493 * _1493;
    float _1509 = _1487;
    float _1511 = _1449;
    if (_1359)
    {
        float _1513 = 1.0 / _1487;
        _1509 = _1513;
    }
    float _1515 = _1509;
    float _1517 = _954 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1519 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1503);
    float _1521 = _1507 * _1505;
    float _1523 = _1445 * _550;
    float _1525 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1517);
    float _1527 = fma(_1441, _552, _1457);
    float _1529 = -_1521;
    float _1531 = _1529 + 1.0;
    float _1533 = -_1467;
    float _1535 = _1533 + 1.0;
    float _1537 = _1381 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1539 = _1389 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1541 = fma(_1531, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1521);
    float _1543 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1545 = fma(_1469, _558, _1527);
    float _1547 = precise::min(_1483, _1497);
    float _1549 = _1481 * _1541;
    float _1551 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1525);
    float _1553 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1555 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1557 = precise::min(_1373, _1501);
    float _1559 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1561 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1563 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1565 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1567 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1551);
    float _1569 = precise::min(_1547, _1557);
    float _1571 = fma(_1441, _646, _1523);
    float _1573 = fma(_1441, _564, _1459);
    out.m_86.x = _1559;
    out.m_86.y = _1561;
    out.m_86.z = _1563;
    out.m_86.w = _1565;
    float _1575 = _1567 + _994;
    float _1577 = _1563;
    float _1579 = _1561;
    if (!_1359)
    {
        _1511 = 1.0;
    }
    float _1581 = _1511;
    float _1583 = _1581;
    if (_1359)
    {
        float _1585 = _1569 * _1515;
        float _1587 = precise::clamp(_1585, 0.0, 1.0);
        _1583 = _1587;
    }
    float _1589 = _1583;
    float _1591 = _1575 * 0.5;
    float _1593 = fma(_1469, _554, _1571);
    float _1595 = fma(_1469, _662, _1573);
    bool _1597 = _768 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1599 = isnan(_768);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1605 = _1601 || _1603;
    out.m_88.z = _1591;
    out.m_88.w = _994;
    out.m_90.x = _1593;
    out.m_90.y = _1545;
    out.m_90.z = _1595;
    out.gl_Position.x = _1050;
    out.gl_Position.y = _1052;
    out.gl_Position.z = _1567;
    out.gl_Position.w = _994;
    if (!_1605)
    {
        _1577 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1607 = _1577;
    float _1609 = _1607;
    float _1611 = _1607;
    if (!_1605)
    {
        _1579 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1613 = _1579;
    float _1615 = _1589 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1617 = -_1068;
    float _1619 = _1617 + 1.0;
    float _1621 = _1619 * _1555;
    float _1623 = precise::clamp(_1621, 0.0, 1.0);
    float _1625 = -_1623;
    float _1627 = fma(_1625, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1629 = _1627 * _1461;
    float _1631 = _1553 * _1078;
    float _1633 = -_1553;
    float _1635 = _1633 + 1.0;
    float _1637 = _1629 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1639 = _1089 * _1631;
    float _1641 = _1099 * _1631;
    float _1643 = _1089 * _1635;
    float _1645 = fma(_1095, _1639, _1083);
    float _1647 = fma(_1097, _1639, _1085);
    float _1649 = fma(_1089, _1641, _1087);
    out.m_92.x = _1637;
    float _1651 = _1639;
    float _1653 = _1613;
    float _1655 = _1613;
    if (!_1605)
    {
        _1651 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1657 = _1651;
    out.m_94.x = _1645;
    out.m_94.y = _1647;
    out.m_94.z = _1649;
    out.m_94.w = _1643;
    bool _1659 = !_1605;
    float _1661 = _1657;
    float _1663 = _1657;
    if (!_1659)
    {
        bool _1665 = _768 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1667 = isnan(_768);
        bool _1669 = _1665 || _1667;
        bool _1671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1673 = _1669 || _1671;
        if (!_1673)
        {
            float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1677 = _768 + _1675;
            float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1681 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1679;
            float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1691 = 1.0 / _1681;
            float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1697 = _1677 * _1691;
            float _1699 = precise::clamp(_1697, 0.0, 1.0);
            float _1701 = fma(_1699, _1685, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1703 = fma(_1699, _1689, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1705 = fma(_1699, _1695, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1655 = _1703;
            _1611 = _1701;
            _1663 = _1705;
            _1707 = true;
        }
        else
        {
            bool _1709 = _768 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1711 = isnan(_768);
            bool _1713 = _1709 || _1711;
            bool _1715 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1717 = _1713 || _1715;
            if (!_1717)
            {
                _1609 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1719 = _1609;
            _1611 = _1719;
            if (!_1717)
            {
                _1653 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1721 = _1653;
            _1655 = _1721;
            if (!_1717)
            {
                _1661 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1723 = _1661;
            bool _1725 = !_1717;
            _1663 = _1723;
            if (!_1725)
            {
                bool _1727 = _768 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1729 = isnan(_768);
                bool _1731 = _1727 || _1729;
                bool _1733 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1735 = _1731 || _1733;
                if (!_1735)
                {
                    float _1737 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1739 = _768 + _1737;
                    float _1741 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1743 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1741;
                    float _1745 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1747 = _1745 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1749 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1751 = _1749 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1753 = 1.0 / _1743;
                    float _1755 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1757 = _1755 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1759 = _1739 * _1753;
                    float _1761 = precise::clamp(_1759, 0.0, 1.0);
                    float _1763 = fma(_1761, _1747, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1765 = fma(_1761, _1751, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1767 = fma(_1761, _1757, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1655 = _1765;
                    _1611 = _1763;
                    _1663 = _1767;
                    _1707 = true;
                }
                else
                {
                    _1655 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1611 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1663 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1707 = false;
    float _1769 = _1655;
    float _1771 = _1611;
    float _1773 = _1663;
    float _1775 = _1769 * 0.586610972881317138671875;
    bool _1777 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1779 = _1615 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_56.x = 1.0;
    float _1781 = fma(_1771, 0.298911988735198974609375, _1775);
    out.m_92.w = _1779;
    float _1783 = fma(_1773, 0.114477999508380889892578125, _1781);
    out.m_96.x = 0.0;
    float _1785 = -_1783;
    float _1787 = _1785 + _1771;
    float _1789 = -_1783;
    float _1791 = _1789 + _1769;
    float _1793 = -_1783;
    float _1795 = _1793 + _1773;
    float _1797 = fma(_1787, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1783);
    float _1799 = fma(_1791, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1783);
    float _1801 = fma(_1795, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1783);
    out.m_98.x = _1797;
    out.m_98.y = _1799;
    out.m_98.z = _1801;
    if (!_1777)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1803 = -_740;
    float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1807 = -_742;
    float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1811 = -_744;
    float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1815 = _1805 * _1805;
    float _1817 = fma(_1809, _1809, _1815);
    float _1819 = fma(_1813, _1813, _1817);
    float _1821 = sqrt(_1819);
    float _1823 = rsqrt(_1819);
    float _1825 = -_1821;
    float _1827 = _1825 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1829 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1831 = precise::clamp(_1829, 0.0, 1.0);
    float _1833 = _1809 * _1823;
    float _1835 = _1805 * _1823;
    float _1837 = abs(_1831);
    float _1839 = log2(_1837);
    float _1841 = _1813 * _1823;
    float _1843 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1845 = _1545 * _1835;
    float _1847 = -_1835;
    float _1849 = -_1843;
    float _1851 = fma(_1847, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1849);
    float _1853 = fma(_1593, _1833, _1845);
    float _1855 = -_1841;
    float _1857 = fma(_1855, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1851);
    float _1859 = fma(_1595, _1841, _1853);
    float _1861 = precise::clamp(_1859, 0.0, 1.0);
    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1865 = _1857 + _1863;
    float _1867 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1869 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1871 = precise::clamp(_1869, 0.0, 1.0);
    float _1873 = exp2(_1867);
    float _1875 = _1873 * _1871;
    float _1877 = _1861 * _1875;
    float _1879 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1881 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1883 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _1879;
    out.m_96.y = _1881;
    out.m_96.z = _1883;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1707 = false;
    bool _363 = false;
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
        float _1940 = as_type<float>(_133);
        out.gl_Position.z = _1940;
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
    float _153 = 0.0;
    if (_147)
    {
        float _155 = float(_117);
        _153 = _155;
    }
    float _157 = _153;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    if (_163)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _127;
    if (_163)
    {
        out.m_56.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _135 = as_type<int>(_167);
    }
    int _169 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2008 = as_type<float>(_169);
        out.gl_Position.z = _2008;
    }
    if (_163)
    {
        return out;
    }
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    float _177 = in.m_62.x;
    float _179 = in.m_62.y;
    float _181 = in.m_62.z;
    float _183 = in.m_64.x;
    float _185 = in.m_64.y;
    float _187 = in.m_64.z;
    float _189 = in.m_66.x;
    float _191 = _171 * _171;
    float _193 = _173 * _173;
    float _195 = _175 * _175;
    float _197 = fma(_177, _177, _191);
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = fma(_187, _187, _201);
    float _209 = sqrt(_203);
    float _211 = sqrt(_205);
    float _213 = sqrt(_207);
    bool _215 = _209 > 0.0;
    bool _217 = _211 > 0.0;
    float _219 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _221 = _203;
    float _223 = _219;
    float _225 = _209;
    if (_215)
    {
        float _227 = rsqrt(_203);
        _221 = _227;
    }
    float _229 = _221;
    float _231 = _219 * _189;
    bool _233 = _213 > 0.0;
    float _235 = 0.0;
    float _237 = _213;
    if (!_215)
    {
        _235 = 0.0;
    }
    float _239 = _235;
    float _241 = 0.0;
    float _243 = _239;
    if (!_215)
    {
        _241 = 0.0;
    }
    float _245 = _241;
    float _247 = 0.0;
    float _249 = _245;
    if (!_215)
    {
        _247 = 0.0;
    }
    float _251 = _247;
    float _253 = 0.0;
    float _255 = _251;
    if (_217)
    {
        float _257 = rsqrt(_205);
        _253 = _257;
    }
    float _259 = _253;
    float _261 = 0.0;
    if (!_217)
    {
        _261 = 0.0;
    }
    float _263 = _261;
    float _265 = 0.0;
    float _267 = _263;
    if (!_217)
    {
        _265 = 0.0;
    }
    float _269 = _265;
    float _271 = 0.0;
    float _273 = _269;
    if (!_217)
    {
        _271 = 0.0;
    }
    float _275 = _271;
    float _277 = _275;
    if (_215)
    {
        float _279 = _229 * _177;
        _243 = _279;
    }
    float _281 = _243;
    float _283 = 0.0;
    if (_233)
    {
        float _285 = rsqrt(_207);
        _283 = _285;
    }
    float _287 = _283;
    if (_215)
    {
        float _289 = _229 * _171;
        _249 = _289;
    }
    float _291 = _249;
    float _293 = _291;
    if (_215)
    {
        float _295 = _229 * _183;
        _255 = _295;
    }
    float _297 = _255;
    bool _299 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    if (!_233)
    {
        _237 = 0.0;
    }
    float _301 = _237;
    float _303 = _301;
    if (!_233)
    {
        _223 = 0.0;
    }
    float _305 = _223;
    float _307 = trunc(_231);
    int _309 = int(_307);
    float _311 = _305;
    if (!_233)
    {
        _225 = 0.0;
    }
    float _313 = _225;
    float _315 = _313;
    if (_217)
    {
        float _317 = _259 * _179;
        _267 = _317;
    }
    float _319 = _267;
    if (_217)
    {
        float _321 = _259 * _173;
        _273 = _321;
    }
    float _323 = _273;
    if (_217)
    {
        float _325 = _259 * _185;
        _277 = _325;
    }
    float _327 = _277;
    if (_233)
    {
        float _329 = _287 * _181;
        _303 = _329;
    }
    float _331 = _303;
    if (_233)
    {
        float _333 = _287 * _175;
        _311 = _333;
    }
    float _335 = _311;
    if (_233)
    {
        float _337 = _287 * _187;
        _315 = _337;
    }
    float _339 = _315;
    int _341 = _309 << 4;
    int _343 = _341 + 1712;
    bool _345 = !_299;
    float _361;
    if (!_345)
    {
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _349 = _189 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        float _365 = float(_117);
        float _367 = 1.0 / _365;
        float _369 = _151 * _367;
        _361 = _369;
    }
    _363 = false;
    float _371 = _361;
    float _373 = in.m_68.w;
    float _375 = in.m_53.x;
    float _377 = in.m_53.y;
    float _379 = in.m_53.z;
    float _381 = in.m_70.x;
    float _383 = in.m_70.y;
    float _385 = in.m_70.z;
    float _387 = in.m_72.x;
    float _389 = in.m_72.y;
    float _391 = in.m_72.z;
    float _393 = in.m_64.w;
    float _395 = in.m_62.w;
    float _397 = trunc(_373);
    int _399 = int(_397);
    int _401 = _399 << 5;
    uint _404 = uint(int(uint(_401) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_404)];
    float _406 = as_type<float>(_dmw0.x);
    int _408 = _401 + 4;
    uint _410 = uint(int(uint(_408) >> uint(2)));
    float _412 = as_type<float>(_dmw0.y);
    int _414 = _401 + 8;
    uint _416 = uint(int(uint(_414) >> uint(2)));
    float _418 = as_type<float>(_dmw0.z);
    int _420 = _401 + 12;
    uint _422 = uint(int(uint(_420) >> uint(2)));
    float _424 = as_type<float>(_dmw0.w);
    float _426 = _185 * _377;
    float _428 = _383 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _430 = _381 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _432 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _387);
    float _434 = fma(_183, _375, _426);
    float _436 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _389);
    float _438 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _440 = _430 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _442 = _385 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _444 = _179 * _377;
    float _446 = _438 * _436;
    float _448 = _440 * _432;
    float _450 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _391);
    float _452 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _454 = _446 * _327;
    float _456 = fma(_177, _375, _444);
    float _458 = fma(_187, _379, _434);
    float _460 = _452 * _450;
    float _462 = _446 * _319;
    float _464 = fma(_448, _297, _454);
    float _466 = fma(_181, _379, _456);
    float _468 = _458 + _393;
    float _470 = fma(_448, _281, _462);
    float _472 = fma(_460, _339, _464);
    float _474 = _466 + _395;
    float _476 = in.m_60.w;
    float _478 = fma(_460, _331, _470);
    float _480 = _468 + _472;
    float _482 = _173 * _377;
    float _484 = _446 * _323;
    float _486 = _474 + _478;
    float _488 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _490 = _480 + _488;
    float _492 = fma(_171, _375, _482);
    float _494 = fma(_448, _291, _484);
    float _496 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _498 = _486 + _496;
    float _500 = _490 * _490;
    float _502 = fma(_175, _379, _492);
    float _504 = fma(_460, _335, _494);
    float _506 = fma(_498, _498, _500);
    float _508 = sqrt(_506);
    bool _510 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _512 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _514 = _510 || _512;
    bool _516 = isnan(0.5);
    bool _518 = _514 || _516;
    float _520 = _502 + _476;
    float _522 = _520 + _504;
    bool _524 = _508 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _526 = _492;
    float _528 = _480;
    if (!_524)
    {
        _526 = _480;
    }
    float _530 = _526;
    float _532 = _424 * 2.0;
    float _534 = _406 * 2.0;
    float _536 = _412 * 2.0;
    float _538 = _412 * _412;
    float _540 = _418 * _532;
    float _542 = _412 * _532;
    float _544 = _406 * _532;
    float _546 = _406 * _406;
    float _548 = -_540;
    float _550 = fma(_412, _534, _548);
    float _552 = fma(_412, _534, _540);
    float _554 = fma(_418, _534, _542);
    float _556 = -_544;
    float _558 = fma(_418, _536, _556);
    float _560 = fma(_418, _536, _544);
    float _562 = -_542;
    float _564 = fma(_418, _534, _562);
    float _566 = _418 * _418;
    float _568 = _544;
    float _570 = _412;
    float _572 = _530;
    if (!_524)
    {
        _568 = _486;
    }
    float _574 = _568;
    float _576 = _574;
    if (!_524)
    {
        _570 = _522;
    }
    float _578 = _570;
    bool _580 = !_524;
    float _582 = _578;
    if (!_580)
    {
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _586 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _588 = _508 + _586;
        float _590 = rsqrt(_506);
        float _592 = _588 * _584;
        float _594 = _522 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _596 = _592 * 0.15915493667125701904296875;
        float _598 = _596 * 6.283185482025146484375;
        float _600 = cos(_598);
        float _602 = _596 * 6.283185482025146484375;
        float _604 = sin(_602);
        float _606 = _600 + (-1.0);
        float _608 = _606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _610 = fma(_604, _594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _612 = fma(_522, _600, _608);
        float _614 = _590 * _610;
        float _616 = fma(_498, _614, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _618 = fma(_490, _614, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _582 = _612;
        _576 = _616;
        _572 = _618;
    }
    float _620 = _582;
    float _622 = _576;
    float _624 = _572;
    float _626 = -_520;
    float _628 = _626 + _620;
    float _630 = -_474;
    float _632 = _630 + _622;
    float _634 = fma(_538, -2.0, 1.0);
    float _636 = -_468;
    float _638 = _636 + _624;
    float _640 = _628 * _323;
    float _642 = _628 * _291;
    float _644 = fma(_546, -2.0, 1.0);
    float _646 = fma(_566, -2.0, _634);
    float _648 = fma(_632, _319, _640);
    float _650 = _628 * _335;
    float _652 = fma(_632, _281, _642);
    float _654 = fma(_566, -2.0, _644);
    float _656 = fma(_638, _327, _648);
    float _658 = fma(_632, _331, _650);
    float _660 = fma(_638, _297, _652);
    float _662 = fma(_538, -2.0, _644);
    float _664 = _656 * _550;
    float _666 = _656 * _654;
    float _668 = _656 * _560;
    float _670 = fma(_638, _339, _658);
    float _672 = fma(_660, _646, _664);
    float _674 = fma(_660, _552, _666);
    float _676 = fma(_660, _564, _668);
    float _678 = fma(_670, _554, _672);
    float _680 = fma(_670, _558, _674);
    float _682 = fma(_670, _662, _676);
    float _684 = _474 + _678;
    float _686 = _520 + _680;
    float _688 = _468 + _682;
    float _690 = _686;
    float _692 = _684;
    float _694 = _688;
    float _696 = _666;
    float _698 = _678;
    float _700 = _638;
    if (!_518)
    {
        float _702 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _704 = _520 + _702;
        float _706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _708 = _474 + _706;
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _712 = _704 * _704;
        float _714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _716 = _468 + _714;
        float _718 = fma(_708, _708, _712);
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _722 = fma(_716, _716, _718);
        float _724 = sqrt(_722);
        float _726 = _710 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _728 = precise::min(_724, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _730 = _728 * _720;
        float _732 = _726 * _730;
        float _734 = fma(_678, _732, _474);
        float _736 = fma(_680, _732, _520);
        float _738 = fma(_682, _732, _468);
        _690 = _736;
        _692 = _734;
        _694 = _738;
        _696 = _730;
    }
    float _740 = _690;
    float _742 = _692;
    float _744 = _694;
    float _746 = _696;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _750 = _740 + _748;
    float _752 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _754 = _742 + _752;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _758 = _744 + _756;
    float _760 = _750 * _750;
    float _762 = fma(_754, _754, _760);
    float _764 = fma(_758, _758, _762);
    float _766 = rsqrt(_764);
    float _768 = sqrt(_764);
    float _770 = _766 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _772 = _754 * _770;
    float _774 = _758 * _770;
    float _776 = _772 * _772;
    float _778 = _774 * _774;
    float _780 = _776 + _778;
    float _782 = sqrt(_780);
    bool _784 = _782 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _786 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _788 = _782 + _786;
    float _790 = _766;
    float _792 = _788;
    float _794 = _750;
    if (_784)
    {
        float _796 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _790 = _796;
    }
    float _798 = _790;
    if (_784)
    {
        float _800 = rsqrt(_780);
        _698 = _800;
    }
    float _802 = _698;
    float _804 = _802;
    if (_784)
    {
        float _806 = _788 * _798;
        _792 = _806;
    }
    float _808 = _792;
    float _810 = _740 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_784)
    {
        float _812 = _808 * 0.15915493667125701904296875;
        _700 = _812;
    }
    float _814 = _700;
    float _816 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[2].x, _810);
    float _818 = _758;
    if (_784)
    {
        float _820 = _814 * 6.283185482025146484375;
        float _822 = sin(_820);
        _818 = _822;
    }
    float _824 = _818;
    float _826 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _828 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[2].z, _816);
    float _830 = precise::max(0.0, _826);
    float _832 = _746;
    float _834 = _830;
    float _836 = _826;
    if (_784)
    {
        float _838 = _814 * 6.283185482025146484375;
        float _840 = cos(_838);
        _832 = _840;
    }
    float _842 = _832;
    float _844 = _828 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _846 = -_770;
    float _848 = -_830;
    float _850 = fma(_750, _846, _848);
    if (!_784)
    {
        _794 = _772;
    }
    float _852 = _794;
    float _854 = _852;
    if (_784)
    {
        float _856 = _850 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _834 = _856;
    }
    float _858 = _834;
    float _860 = _858;
    float _862 = _824;
    if (_784)
    {
        float _864 = fma(_824, _858, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _860 = _864;
    }
    float _866 = _860;
    float _868 = _866;
    if (!_784)
    {
        _862 = _850;
    }
    float _870 = _862;
    float _872 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _874 = fma(_768, (*spvDescriptorSet0.vp_c15)._m0[23].w, _872);
    float _876 = precise::clamp(_874, 0.0, 1.0);
    float _878 = _870;
    float _880 = _842;
    if (_784)
    {
        float _882 = _842 + (-1.0);
        _836 = _882;
    }
    float _884 = _836;
    float _886 = _884;
    if (_784)
    {
        float _888 = _802 * _866;
        _528 = _888;
    }
    float _890 = _528;
    if (!_784)
    {
        _868 = _776;
    }
    float _892 = _868;
    float _894 = _740 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _896 = _892;
    if (_784)
    {
        float _898 = _884 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _804 = _898;
    }
    float _900 = _804;
    if (_784)
    {
        float _902 = _772 * _890;
        _854 = _902;
    }
    float _904 = _854;
    if (!_784)
    {
        _886 = _774;
    }
    float _906 = _886;
    float _908 = _906;
    if (_784)
    {
        float _910 = _774 * _890;
        _908 = _910;
    }
    float _912 = _908;
    if (_784)
    {
        float _914 = fma(_850, _842, _900);
        _878 = _914;
    }
    float _916 = _878;
    if (_784)
    {
        float _918 = _904 * _904;
        _896 = _918;
    }
    float _920 = _896;
    if (!_784)
    {
        _880 = _778;
    }
    float _922 = _880;
    float _924 = _922;
    if (_784)
    {
        float _926 = _912 * _912;
        _924 = _926;
    }
    float _928 = _924;
    float _930 = fma(_916, _916, _920);
    float _932 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[1].x, _894);
    float _934 = -_876;
    float _936 = _934 + 1.0;
    float _938 = _740 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _940 = _930 + _928;
    float _942 = fma(_474, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _944 = _740 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _946 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[1].z, _932);
    float _948 = rsqrt(_940);
    float _950 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[3].x, _938);
    float _952 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[0].x, _944);
    float _954 = _946 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _956 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[3].z, _950);
    float _958 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[0].z, _952);
    float _960 = abs(_936);
    float _962 = log2(_960);
    float _964 = fma(_468, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _966 = _958 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _968 = _954 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _970 = _956 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _972 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[7].x, _968);
    float _974 = _948 * _904;
    float _976 = _948 * _916;
    float _978 = floor(_942);
    float _980 = _948 * _912;
    float _982 = _974 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _984 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[7].z, _972);
    float _986 = -_982;
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c15)._m0[21].y, _986);
    float _990 = _962 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _992 = floor(_964);
    float _994 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[7].w, _984);
    float _996 = -_980;
    float _998 = fma(_996, (*spvDescriptorSet0.vp_c15)._m0[21].z, _988);
    float _1000 = _844 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1002 = fma(_998, 0.5, 0.5);
    float _1004 = fma(_998, -0.5, 0.5);
    float _1006 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1008 = exp2(_990);
    float _1010 = -_978;
    float _1012 = _942 + _1010;
    float _1014 = _954 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1016 = -_1000;
    float _1018 = fma(_1016, _1006, 1.0);
    float _1020 = fma(_1002, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1022 = _954 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1024 = -_992;
    float _1026 = _964 + _1024;
    float _1028 = 1.0 / _994;
    float _1030 = fma(_1002, _1020, -0.212114393711090087890625);
    float _1032 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1022);
    float _1034 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1014);
    float _1036 = _976 + 1.0;
    float _1038 = fma(_1002, _1030, 1.570728778839111328125);
    float _1040 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1032);
    float _1042 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1034);
    float _1044 = log2(_1018);
    float _1046 = -_976;
    float _1048 = fma(_1008, _1036, _1046);
    float _1050 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1040);
    float _1052 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1042);
    float _1054 = fma(_1048, 0.5, 0.5);
    float _1056 = sqrt(_1004);
    float _1058 = _1050 * _1028;
    float _1060 = _1052 * _1028;
    float _1062 = fma(_1058, 0.5, 0.5);
    float _1064 = fma(_1060, -0.5, 0.5);
    float _1066 = _1044 * 0.693147182464599609375;
    float2 _3417 = float2(_1012, _1026);
    float _1068 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3417, float2(0.0), isnan(_3417)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3417, float2(0.0), isnan(_3417)), level(0.0)).x;
    float _1070 = _1066 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1072 = _1056 * 0.636619746685028076171875;
    float _1074 = -_1038;
    float _1076 = fma(_1072, _1074, 1.0);
    float3 _3440 = float3(_1062, _1064, _1070);
    float _1078 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3440, float3(0.0), isnan(_3440)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3440, float3(0.0), isnan(_3440)), level(0.0)).x;
    float3 _3451 = float3(_1062, _1064, _1070);
    float4 _1081 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3451, float3(0.0), isnan(_3451)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3451, float3(0.0), isnan(_3451)), level(0.0)).xyzw;
    float _1083 = _1081.x;
    float _1085 = _1081.y;
    float _1087 = _1081.z;
    float _1089 = _1081.w;
    float2 _3467 = float2(_1076, _1054);
    float3 _1093 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3467, float2(0.0), isnan(_3467)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3467, float2(0.0), isnan(_3467)), level(0.0)).xyz;
    float _1095 = _1093.x;
    float _1097 = _1093.y;
    float _1099 = _1093.z;
    float _1101 = in.m_74.y;
    float _1103 = _520 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1105 = in.m_66.y;
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1109 = _1107 != 0;
    float _1111 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1103);
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1115 = _1113 != 0;
    float _1117 = _962 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1119 = _520 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1121 = fma(_468, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1111);
    float _1123 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1119);
    bool _1125 = _189 > 0.5;
    bool _1127 = _1125 && _1115;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1131 = _1129 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1133 = fma(_468, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1123);
    out.m_76.x = 1.0;
    out.m_76.y = 1.0;
    out.m_76.z = 1.0;
    float _1135 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1139 = _1137 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1141 = -_1101;
    float _1143 = _1141 + 1.0;
    float _1145 = 1.0 / _1131;
    bool _1147 = _1105 > 0.5;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1151 = _1149 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1153 = _1101;
    if (_1109)
    {
        float _1155 = _1147 ? _1143 : _1101;
        _1153 = _1155;
    }
    float _1157 = _1153;
    float _1159 = 1.0 / _1139;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1165 = _389 != 0.0;
    bool _1167 = isnan(_389);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan(0.0);
    bool _1173 = _1169 || _1171;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1177 = 1.0 / _1135;
    float _1179 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1181 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1183 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1185 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1187 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1191 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1189);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1195 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1193);
    float _1197 = _1187 + _1135;
    out.m_78.x = _1181;
    out.m_78.y = _1183;
    out.m_78.z = _1185;
    float _1199 = 1.0 / _1151;
    bool _1201 = _387 == 0.0;
    bool _1203 = !_1173;
    bool _1205 = _1201 && _1203;
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1207;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1213 = _1211 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1215 = in.m_80.x;
    float _1217 = in.m_80.y;
    float _1219 = in.m_80.z;
    float _1221 = _1197 * _1177;
    float _1223 = _1221 * 0.5;
    bool _1225 = _391 == 0.0;
    bool _1227 = _1225 && _1205;
    float _1229 = _1213 * _1159;
    float _1231 = in.m_74.x;
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1235 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1233);
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1237;
    float _1241 = _1209 * _1145;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1245 = _371 + _1243;
    bool _1247 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1249 = isnan(_371);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1255 = _1251 || _1253;
    float _1257 = float(_1255);
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1261 = _371 + _1259;
    float _1263 = 1.0 / _1235;
    bool _1265 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1267 = isnan(_371);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = fma(_1241, _1245, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1279 = _1239 * _1199;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1283 = _371 + _1281;
    float _1285 = -_1257;
    float _1287 = _1285 + 1.0;
    bool _1289 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1291 = isnan(_371);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1297 = _1293 || _1295;
    float _1299 = float(_1297);
    float _1301 = -_1275;
    float _1303 = _1301 + 1.0;
    float _1305 = fma(_1229, _1283, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1307 = _1275 * _1287;
    bool _1309 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1311 = isnan(_371);
    bool _1313 = _1309 || _1311;
    bool _1315 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1317 = _1313 || _1315;
    float _1319 = float(_1317);
    float _1321 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1195);
    float _1323 = _1299 * _1303;
    float _1325 = _1215;
    float _1327 = _1217;
    float _1329 = _1219;
    float _1331 = _1287;
    float _1333 = _1157;
    if (!_1227)
    {
        float _1335 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1215);
        _1325 = _1335;
    }
    float _1337 = _1325;
    if (!_1227)
    {
        float _1339 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1217);
        _1327 = _1339;
    }
    float _1341 = _1327;
    if (!_1227)
    {
        float _1343 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1219);
        _1329 = _1343;
    }
    float _1345 = _1329;
    float _1347 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1349 = _1263 * _1347;
    bool _1351 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    bool _1357 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1359 = _1355 || _1357;
    float _1361 = -_1299;
    float _1363 = _1361 + 1.0;
    float _1365 = _327 * _1341;
    float _1367 = abs(_1349);
    float _1369 = log2(_1367);
    float _1371 = _323 * _1341;
    float _1373 = _468 + _1321;
    uint _1375 = uint(int(uint(_343) >> uint(2)));
    uint _1377 = uint(int(uint(int(_1375)) >> uint(2)));
    int _1379 = int(_1375) & 3;
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[int(_1377)][_1379];
    int _1383 = int(_1375) + 1;
    uint _1385 = uint(int(uint(_1383) >> uint(2)));
    int _1387 = _1383 & 3;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[int(_1385)][_1387];
    float _1391 = _1231;
    if (_1115)
    {
        _1331 = _1231;
    }
    float _1393 = _1331;
    float _1395 = _319 * _1341;
    float _1397 = fma(_291, _1337, _1371);
    float _1399 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1191);
    float _1401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1403 = _1393;
    if (_1127)
    {
        float _1405 = -_1393;
        float _1407 = _1405 + 1.0;
        _1403 = _1407;
    }
    float _1409 = _1403;
    if (_1359)
    {
        float _1411 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _293 = _1411;
    }
    float _1413 = _293;
    int _1415 = _343 + 8;
    uint _1417 = uint(int(uint(_1415) >> uint(2)));
    uint _1419 = uint(int(uint(int(_1417)) >> uint(2)));
    int _1421 = int(_1417) & 3;
    float _1423 = (*spvDescriptorSet0.vp_c9)._m0[int(_1419)][_1421];
    float _1425 = fma(_281, _1337, _1395);
    float _1427 = _1319 * _1363;
    if (_1115)
    {
        _1391 = _1409;
    }
    float _1429 = _1391;
    float _1431 = fma(_1279, _1261, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1433 = _1369 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1437 = fma(_297, _1337, _1365);
    float _1439 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1441 = fma(_331, _1345, _1425);
    float _1443 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1445 = fma(_335, _1345, _1397);
    float _1447 = _1439 * _1401;
    float _1449 = exp2(_1433);
    float _1451 = _1277 * _1427;
    float _1453 = -_1319;
    float _1455 = _1453 + 1.0;
    float _1457 = _1445 * _654;
    float _1459 = _1445 * _560;
    float _1461 = in.m_82.x;
    float _1463 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1451);
    float _1465 = _1443 * _1435;
    float _1467 = exp2(_1117);
    float _1469 = fma(_339, _1345, _1437);
    bool _1471 = _1349 <= 8000.0;
    bool _1473 = isnan(_1349);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan(8000.0);
    bool _1479 = _1475 || _1477;
    float _1481 = float(_1479);
    float _1483 = _474 + _1399;
    out.m_84.x = _1465;
    out.m_84.y = _1447;
    if (_1359)
    {
        float _1485 = precise::min(_1413, 20.0);
        _1333 = _1485;
    }
    float _1487 = _1333;
    float _1489 = fma(_1305, _1323, _1463);
    float _1491 = fma(_1449, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1493 = precise::clamp(_1491, 0.0, 1.0);
    float _1495 = -_1483;
    float _1497 = _1495 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1499 = -_1373;
    float _1501 = _1499 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1503 = fma(_1431, _1307, _1489);
    float _1505 = fma(_1493, -2.0, 3.0);
    float _1507 = _1493 * _1493;
    float _1509 = _1487;
    float _1511 = _1449;
    if (_1359)
    {
        float _1513 = 1.0 / _1487;
        _1509 = _1513;
    }
    float _1515 = _1509;
    float _1517 = _954 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1519 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1503);
    float _1521 = _1507 * _1505;
    float _1523 = _1445 * _550;
    float _1525 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1517);
    float _1527 = fma(_1441, _552, _1457);
    float _1529 = -_1521;
    float _1531 = _1529 + 1.0;
    float _1533 = -_1467;
    float _1535 = _1533 + 1.0;
    float _1537 = _1381 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1539 = _1389 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1541 = fma(_1531, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1521);
    float _1543 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1545 = fma(_1469, _558, _1527);
    float _1547 = precise::min(_1483, _1497);
    float _1549 = _1481 * _1541;
    float _1551 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1525);
    float _1553 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1555 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1557 = precise::min(_1373, _1501);
    float _1559 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1561 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1563 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1565 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1567 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1551);
    float _1569 = precise::min(_1547, _1557);
    float _1571 = fma(_1441, _646, _1523);
    float _1573 = fma(_1441, _564, _1459);
    out.m_86.x = _1559;
    out.m_86.y = _1561;
    out.m_86.z = _1563;
    out.m_86.w = _1565;
    float _1575 = _1567 + _994;
    float _1577 = _1563;
    float _1579 = _1561;
    if (!_1359)
    {
        _1511 = 1.0;
    }
    float _1581 = _1511;
    float _1583 = _1581;
    if (_1359)
    {
        float _1585 = _1569 * _1515;
        float _1587 = precise::clamp(_1585, 0.0, 1.0);
        _1583 = _1587;
    }
    float _1589 = _1583;
    float _1591 = _1575 * 0.5;
    float _1593 = fma(_1469, _554, _1571);
    float _1595 = fma(_1469, _662, _1573);
    bool _1597 = _768 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1599 = isnan(_768);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1605 = _1601 || _1603;
    out.m_88.z = _1591;
    out.m_88.w = _994;
    out.m_90.x = _1593;
    out.m_90.y = _1545;
    out.m_90.z = _1595;
    out.gl_Position.x = _1050;
    out.gl_Position.y = _1052;
    out.gl_Position.z = _1567;
    out.gl_Position.w = _994;
    if (!_1605)
    {
        _1577 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1607 = _1577;
    float _1609 = _1607;
    float _1611 = _1607;
    if (!_1605)
    {
        _1579 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1613 = _1579;
    float _1615 = _1589 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1617 = -_1068;
    float _1619 = _1617 + 1.0;
    float _1621 = _1619 * _1555;
    float _1623 = precise::clamp(_1621, 0.0, 1.0);
    float _1625 = -_1623;
    float _1627 = fma(_1625, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1629 = _1627 * _1461;
    float _1631 = _1553 * _1078;
    float _1633 = -_1553;
    float _1635 = _1633 + 1.0;
    float _1637 = _1629 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1639 = _1089 * _1631;
    float _1641 = _1099 * _1631;
    float _1643 = _1089 * _1635;
    float _1645 = fma(_1095, _1639, _1083);
    float _1647 = fma(_1097, _1639, _1085);
    float _1649 = fma(_1089, _1641, _1087);
    out.m_92.x = _1637;
    float _1651 = _1639;
    float _1653 = _1613;
    float _1655 = _1613;
    if (!_1605)
    {
        _1651 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1657 = _1651;
    out.m_94.x = _1645;
    out.m_94.y = _1647;
    out.m_94.z = _1649;
    out.m_94.w = _1643;
    bool _1659 = !_1605;
    float _1661 = _1657;
    float _1663 = _1657;
    if (!_1659)
    {
        bool _1665 = _768 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1667 = isnan(_768);
        bool _1669 = _1665 || _1667;
        bool _1671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1673 = _1669 || _1671;
        if (!_1673)
        {
            float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1677 = _768 + _1675;
            float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1681 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1679;
            float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1691 = 1.0 / _1681;
            float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1697 = _1677 * _1691;
            float _1699 = precise::clamp(_1697, 0.0, 1.0);
            float _1701 = fma(_1699, _1685, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1703 = fma(_1699, _1689, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1705 = fma(_1699, _1695, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1655 = _1703;
            _1611 = _1701;
            _1663 = _1705;
            _1707 = true;
        }
        else
        {
            bool _1709 = _768 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1711 = isnan(_768);
            bool _1713 = _1709 || _1711;
            bool _1715 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1717 = _1713 || _1715;
            if (!_1717)
            {
                _1609 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1719 = _1609;
            _1611 = _1719;
            if (!_1717)
            {
                _1653 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1721 = _1653;
            _1655 = _1721;
            if (!_1717)
            {
                _1661 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1723 = _1661;
            bool _1725 = !_1717;
            _1663 = _1723;
            if (!_1725)
            {
                bool _1727 = _768 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1729 = isnan(_768);
                bool _1731 = _1727 || _1729;
                bool _1733 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1735 = _1731 || _1733;
                if (!_1735)
                {
                    float _1737 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1739 = _768 + _1737;
                    float _1741 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1743 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1741;
                    float _1745 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1747 = _1745 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1749 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1751 = _1749 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1753 = 1.0 / _1743;
                    float _1755 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1757 = _1755 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1759 = _1739 * _1753;
                    float _1761 = precise::clamp(_1759, 0.0, 1.0);
                    float _1763 = fma(_1761, _1747, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1765 = fma(_1761, _1751, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1767 = fma(_1761, _1757, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1655 = _1765;
                    _1611 = _1763;
                    _1663 = _1767;
                    _1707 = true;
                }
                else
                {
                    _1655 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1611 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1663 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1707 = false;
    float _1769 = _1655;
    float _1771 = _1611;
    float _1773 = _1663;
    float _1775 = _1769 * 0.586610972881317138671875;
    bool _1777 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1779 = _1615 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_56.x = 1.0;
    float _1781 = fma(_1771, 0.298911988735198974609375, _1775);
    out.m_92.w = _1779;
    float _1783 = fma(_1773, 0.114477999508380889892578125, _1781);
    out.m_96.x = 0.0;
    float _1785 = -_1783;
    float _1787 = _1785 + _1771;
    float _1789 = -_1783;
    float _1791 = _1789 + _1769;
    float _1793 = -_1783;
    float _1795 = _1793 + _1773;
    float _1797 = fma(_1787, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1783);
    float _1799 = fma(_1791, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1783);
    float _1801 = fma(_1795, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1783);
    out.m_98.x = _1797;
    out.m_98.y = _1799;
    out.m_98.z = _1801;
    if (!_1777)
    {
        return out;
    }
    float _1803 = -_740;
    float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1807 = -_742;
    float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1811 = -_744;
    float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1815 = _1805 * _1805;
    float _1817 = fma(_1809, _1809, _1815);
    float _1819 = fma(_1813, _1813, _1817);
    float _1821 = sqrt(_1819);
    float _1823 = rsqrt(_1819);
    float _1825 = -_1821;
    float _1827 = _1825 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1829 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1831 = precise::clamp(_1829, 0.0, 1.0);
    float _1833 = _1809 * _1823;
    float _1835 = _1805 * _1823;
    float _1837 = abs(_1831);
    float _1839 = log2(_1837);
    float _1841 = _1813 * _1823;
    float _1843 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1845 = _1545 * _1835;
    float _1847 = -_1835;
    float _1849 = -_1843;
    float _1851 = fma(_1847, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1849);
    float _1853 = fma(_1593, _1833, _1845);
    float _1855 = -_1841;
    float _1857 = fma(_1855, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1851);
    float _1859 = fma(_1595, _1841, _1853);
    float _1861 = precise::clamp(_1859, 0.0, 1.0);
    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1865 = _1857 + _1863;
    float _1867 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1869 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1871 = precise::clamp(_1869, 0.0, 1.0);
    float _1873 = exp2(_1867);
    float _1875 = _1873 * _1871;
    float _1877 = _1861 * _1875;
    float _1879 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1881 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1883 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _1879;
    out.m_96.y = _1881;
    out.m_96.z = _1883;
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
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1707 = false;
    bool _363 = false;
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
        float _1940 = as_type<float>(_133);
        out.gl_Position.z = _1940;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_58.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    if (_147)
    {
        float _155 = float(_117);
        _153 = _155;
    }
    float _157 = _153;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    if (_163)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _127;
    if (_163)
    {
        out.m_56.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _135 = as_type<int>(_167);
    }
    int _169 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2008 = as_type<float>(_169);
        out.gl_Position.z = _2008;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    float _177 = in.m_62.x;
    float _179 = in.m_62.y;
    float _181 = in.m_62.z;
    float _183 = in.m_64.x;
    float _185 = in.m_64.y;
    float _187 = in.m_64.z;
    float _189 = in.m_66.x;
    float _191 = _171 * _171;
    float _193 = _173 * _173;
    float _195 = _175 * _175;
    float _197 = fma(_177, _177, _191);
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = fma(_187, _187, _201);
    float _209 = sqrt(_203);
    float _211 = sqrt(_205);
    float _213 = sqrt(_207);
    bool _215 = _209 > 0.0;
    bool _217 = _211 > 0.0;
    float _219 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _221 = _203;
    float _223 = _219;
    float _225 = _209;
    if (_215)
    {
        float _227 = rsqrt(_203);
        _221 = _227;
    }
    float _229 = _221;
    float _231 = _219 * _189;
    bool _233 = _213 > 0.0;
    float _235 = 0.0;
    float _237 = _213;
    if (!_215)
    {
        _235 = 0.0;
    }
    float _239 = _235;
    float _241 = 0.0;
    float _243 = _239;
    if (!_215)
    {
        _241 = 0.0;
    }
    float _245 = _241;
    float _247 = 0.0;
    float _249 = _245;
    if (!_215)
    {
        _247 = 0.0;
    }
    float _251 = _247;
    float _253 = 0.0;
    float _255 = _251;
    if (_217)
    {
        float _257 = rsqrt(_205);
        _253 = _257;
    }
    float _259 = _253;
    float _261 = 0.0;
    if (!_217)
    {
        _261 = 0.0;
    }
    float _263 = _261;
    float _265 = 0.0;
    float _267 = _263;
    if (!_217)
    {
        _265 = 0.0;
    }
    float _269 = _265;
    float _271 = 0.0;
    float _273 = _269;
    if (!_217)
    {
        _271 = 0.0;
    }
    float _275 = _271;
    float _277 = _275;
    if (_215)
    {
        float _279 = _229 * _177;
        _243 = _279;
    }
    float _281 = _243;
    float _283 = 0.0;
    if (_233)
    {
        float _285 = rsqrt(_207);
        _283 = _285;
    }
    float _287 = _283;
    if (_215)
    {
        float _289 = _229 * _171;
        _249 = _289;
    }
    float _291 = _249;
    float _293 = _291;
    if (_215)
    {
        float _295 = _229 * _183;
        _255 = _295;
    }
    float _297 = _255;
    bool _299 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    if (!_233)
    {
        _237 = 0.0;
    }
    float _301 = _237;
    float _303 = _301;
    if (!_233)
    {
        _223 = 0.0;
    }
    float _305 = _223;
    float _307 = trunc(_231);
    int _309 = int(_307);
    float _311 = _305;
    if (!_233)
    {
        _225 = 0.0;
    }
    float _313 = _225;
    float _315 = _313;
    if (_217)
    {
        float _317 = _259 * _179;
        _267 = _317;
    }
    float _319 = _267;
    if (_217)
    {
        float _321 = _259 * _173;
        _273 = _321;
    }
    float _323 = _273;
    if (_217)
    {
        float _325 = _259 * _185;
        _277 = _325;
    }
    float _327 = _277;
    if (_233)
    {
        float _329 = _287 * _181;
        _303 = _329;
    }
    float _331 = _303;
    if (_233)
    {
        float _333 = _287 * _175;
        _311 = _333;
    }
    float _335 = _311;
    if (_233)
    {
        float _337 = _287 * _187;
        _315 = _337;
    }
    float _339 = _315;
    int _341 = _309 << 4;
    int _343 = _341 + 1712;
    bool _345 = !_299;
    float _361;
    if (!_345)
    {
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _349 = _189 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        float _365 = float(_117);
        float _367 = 1.0 / _365;
        float _369 = _151 * _367;
        _361 = _369;
    }
    _363 = false;
    float _371 = _361;
    float _373 = in.m_68.w;
    float _375 = in.m_53.x;
    float _377 = in.m_53.y;
    float _379 = in.m_53.z;
    float _381 = in.m_70.x;
    float _383 = in.m_70.y;
    float _385 = in.m_70.z;
    float _387 = in.m_72.x;
    float _389 = in.m_72.y;
    float _391 = in.m_72.z;
    float _393 = in.m_64.w;
    float _395 = in.m_62.w;
    float _397 = trunc(_373);
    int _399 = int(_397);
    int _401 = _399 << 5;
    uint _404 = uint(int(uint(_401) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_404)];
    float _406 = as_type<float>(_dmw0.x);
    int _408 = _401 + 4;
    uint _410 = uint(int(uint(_408) >> uint(2)));
    float _412 = as_type<float>(_dmw0.y);
    int _414 = _401 + 8;
    uint _416 = uint(int(uint(_414) >> uint(2)));
    float _418 = as_type<float>(_dmw0.z);
    int _420 = _401 + 12;
    uint _422 = uint(int(uint(_420) >> uint(2)));
    float _424 = as_type<float>(_dmw0.w);
    float _426 = _185 * _377;
    float _428 = _383 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _430 = _381 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _432 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _387);
    float _434 = fma(_183, _375, _426);
    float _436 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _389);
    float _438 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _440 = _430 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _442 = _385 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _444 = _179 * _377;
    float _446 = _438 * _436;
    float _448 = _440 * _432;
    float _450 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _391);
    float _452 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _454 = _446 * _327;
    float _456 = fma(_177, _375, _444);
    float _458 = fma(_187, _379, _434);
    float _460 = _452 * _450;
    float _462 = _446 * _319;
    float _464 = fma(_448, _297, _454);
    float _466 = fma(_181, _379, _456);
    float _468 = _458 + _393;
    float _470 = fma(_448, _281, _462);
    float _472 = fma(_460, _339, _464);
    float _474 = _466 + _395;
    float _476 = in.m_60.w;
    float _478 = fma(_460, _331, _470);
    float _480 = _468 + _472;
    float _482 = _173 * _377;
    float _484 = _446 * _323;
    float _486 = _474 + _478;
    float _488 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _490 = _480 + _488;
    float _492 = fma(_171, _375, _482);
    float _494 = fma(_448, _291, _484);
    float _496 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _498 = _486 + _496;
    float _500 = _490 * _490;
    float _502 = fma(_175, _379, _492);
    float _504 = fma(_460, _335, _494);
    float _506 = fma(_498, _498, _500);
    float _508 = sqrt(_506);
    bool _510 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _512 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _514 = _510 || _512;
    bool _516 = isnan(0.5);
    bool _518 = _514 || _516;
    float _520 = _502 + _476;
    float _522 = _520 + _504;
    bool _524 = _508 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _526 = _492;
    float _528 = _480;
    if (!_524)
    {
        _526 = _480;
    }
    float _530 = _526;
    float _532 = _424 * 2.0;
    float _534 = _406 * 2.0;
    float _536 = _412 * 2.0;
    float _538 = _412 * _412;
    float _540 = _418 * _532;
    float _542 = _412 * _532;
    float _544 = _406 * _532;
    float _546 = _406 * _406;
    float _548 = -_540;
    float _550 = fma(_412, _534, _548);
    float _552 = fma(_412, _534, _540);
    float _554 = fma(_418, _534, _542);
    float _556 = -_544;
    float _558 = fma(_418, _536, _556);
    float _560 = fma(_418, _536, _544);
    float _562 = -_542;
    float _564 = fma(_418, _534, _562);
    float _566 = _418 * _418;
    float _568 = _544;
    float _570 = _412;
    float _572 = _530;
    if (!_524)
    {
        _568 = _486;
    }
    float _574 = _568;
    float _576 = _574;
    if (!_524)
    {
        _570 = _522;
    }
    float _578 = _570;
    bool _580 = !_524;
    float _582 = _578;
    if (!_580)
    {
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _586 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _588 = _508 + _586;
        float _590 = rsqrt(_506);
        float _592 = _588 * _584;
        float _594 = _522 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _596 = _592 * 0.15915493667125701904296875;
        float _598 = _596 * 6.283185482025146484375;
        float _600 = cos(_598);
        float _602 = _596 * 6.283185482025146484375;
        float _604 = sin(_602);
        float _606 = _600 + (-1.0);
        float _608 = _606 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _610 = fma(_604, _594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _612 = fma(_522, _600, _608);
        float _614 = _590 * _610;
        float _616 = fma(_498, _614, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _618 = fma(_490, _614, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _582 = _612;
        _576 = _616;
        _572 = _618;
    }
    float _620 = _582;
    float _622 = _576;
    float _624 = _572;
    float _626 = -_520;
    float _628 = _626 + _620;
    float _630 = -_474;
    float _632 = _630 + _622;
    float _634 = fma(_538, -2.0, 1.0);
    float _636 = -_468;
    float _638 = _636 + _624;
    float _640 = _628 * _323;
    float _642 = _628 * _291;
    float _644 = fma(_546, -2.0, 1.0);
    float _646 = fma(_566, -2.0, _634);
    float _648 = fma(_632, _319, _640);
    float _650 = _628 * _335;
    float _652 = fma(_632, _281, _642);
    float _654 = fma(_566, -2.0, _644);
    float _656 = fma(_638, _327, _648);
    float _658 = fma(_632, _331, _650);
    float _660 = fma(_638, _297, _652);
    float _662 = fma(_538, -2.0, _644);
    float _664 = _656 * _550;
    float _666 = _656 * _654;
    float _668 = _656 * _560;
    float _670 = fma(_638, _339, _658);
    float _672 = fma(_660, _646, _664);
    float _674 = fma(_660, _552, _666);
    float _676 = fma(_660, _564, _668);
    float _678 = fma(_670, _554, _672);
    float _680 = fma(_670, _558, _674);
    float _682 = fma(_670, _662, _676);
    float _684 = _474 + _678;
    float _686 = _520 + _680;
    float _688 = _468 + _682;
    float _690 = _686;
    float _692 = _684;
    float _694 = _688;
    float _696 = _666;
    float _698 = _678;
    float _700 = _638;
    if (!_518)
    {
        float _702 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _704 = _520 + _702;
        float _706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _708 = _474 + _706;
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _712 = _704 * _704;
        float _714 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _716 = _468 + _714;
        float _718 = fma(_708, _708, _712);
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _722 = fma(_716, _716, _718);
        float _724 = sqrt(_722);
        float _726 = _710 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _728 = precise::min(_724, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _730 = _728 * _720;
        float _732 = _726 * _730;
        float _734 = fma(_678, _732, _474);
        float _736 = fma(_680, _732, _520);
        float _738 = fma(_682, _732, _468);
        _690 = _736;
        _692 = _734;
        _694 = _738;
        _696 = _730;
    }
    float _740 = _690;
    float _742 = _692;
    float _744 = _694;
    float _746 = _696;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _750 = _740 + _748;
    float _752 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _754 = _742 + _752;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _758 = _744 + _756;
    float _760 = _750 * _750;
    float _762 = fma(_754, _754, _760);
    float _764 = fma(_758, _758, _762);
    float _766 = rsqrt(_764);
    float _768 = sqrt(_764);
    float _770 = _766 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _772 = _754 * _770;
    float _774 = _758 * _770;
    float _776 = _772 * _772;
    float _778 = _774 * _774;
    float _780 = _776 + _778;
    float _782 = sqrt(_780);
    bool _784 = _782 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _786 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _788 = _782 + _786;
    float _790 = _766;
    float _792 = _788;
    float _794 = _750;
    if (_784)
    {
        float _796 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _790 = _796;
    }
    float _798 = _790;
    if (_784)
    {
        float _800 = rsqrt(_780);
        _698 = _800;
    }
    float _802 = _698;
    float _804 = _802;
    if (_784)
    {
        float _806 = _788 * _798;
        _792 = _806;
    }
    float _808 = _792;
    float _810 = _740 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_784)
    {
        float _812 = _808 * 0.15915493667125701904296875;
        _700 = _812;
    }
    float _814 = _700;
    float _816 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[2].x, _810);
    float _818 = _758;
    if (_784)
    {
        float _820 = _814 * 6.283185482025146484375;
        float _822 = sin(_820);
        _818 = _822;
    }
    float _824 = _818;
    float _826 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _828 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[2].z, _816);
    float _830 = precise::max(0.0, _826);
    float _832 = _746;
    float _834 = _830;
    float _836 = _826;
    if (_784)
    {
        float _838 = _814 * 6.283185482025146484375;
        float _840 = cos(_838);
        _832 = _840;
    }
    float _842 = _832;
    float _844 = _828 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _846 = -_770;
    float _848 = -_830;
    float _850 = fma(_750, _846, _848);
    if (!_784)
    {
        _794 = _772;
    }
    float _852 = _794;
    float _854 = _852;
    if (_784)
    {
        float _856 = _850 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _834 = _856;
    }
    float _858 = _834;
    float _860 = _858;
    float _862 = _824;
    if (_784)
    {
        float _864 = fma(_824, _858, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _860 = _864;
    }
    float _866 = _860;
    float _868 = _866;
    if (!_784)
    {
        _862 = _850;
    }
    float _870 = _862;
    float _872 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _874 = fma(_768, (*spvDescriptorSet0.vp_c15)._m0[23].w, _872);
    float _876 = precise::clamp(_874, 0.0, 1.0);
    float _878 = _870;
    float _880 = _842;
    if (_784)
    {
        float _882 = _842 + (-1.0);
        _836 = _882;
    }
    float _884 = _836;
    float _886 = _884;
    if (_784)
    {
        float _888 = _802 * _866;
        _528 = _888;
    }
    float _890 = _528;
    if (!_784)
    {
        _868 = _776;
    }
    float _892 = _868;
    float _894 = _740 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _896 = _892;
    if (_784)
    {
        float _898 = _884 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _804 = _898;
    }
    float _900 = _804;
    if (_784)
    {
        float _902 = _772 * _890;
        _854 = _902;
    }
    float _904 = _854;
    if (!_784)
    {
        _886 = _774;
    }
    float _906 = _886;
    float _908 = _906;
    if (_784)
    {
        float _910 = _774 * _890;
        _908 = _910;
    }
    float _912 = _908;
    if (_784)
    {
        float _914 = fma(_850, _842, _900);
        _878 = _914;
    }
    float _916 = _878;
    if (_784)
    {
        float _918 = _904 * _904;
        _896 = _918;
    }
    float _920 = _896;
    if (!_784)
    {
        _880 = _778;
    }
    float _922 = _880;
    float _924 = _922;
    if (_784)
    {
        float _926 = _912 * _912;
        _924 = _926;
    }
    float _928 = _924;
    float _930 = fma(_916, _916, _920);
    float _932 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[1].x, _894);
    float _934 = -_876;
    float _936 = _934 + 1.0;
    float _938 = _740 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _940 = _930 + _928;
    float _942 = fma(_474, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _944 = _740 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _946 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[1].z, _932);
    float _948 = rsqrt(_940);
    float _950 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[3].x, _938);
    float _952 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[0].x, _944);
    float _954 = _946 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _956 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[3].z, _950);
    float _958 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[0].z, _952);
    float _960 = abs(_936);
    float _962 = log2(_960);
    float _964 = fma(_468, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _966 = _958 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _968 = _954 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _970 = _956 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _972 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[7].x, _968);
    float _974 = _948 * _904;
    float _976 = _948 * _916;
    float _978 = floor(_942);
    float _980 = _948 * _912;
    float _982 = _974 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _984 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[7].z, _972);
    float _986 = -_982;
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c15)._m0[21].y, _986);
    float _990 = _962 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _992 = floor(_964);
    float _994 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[7].w, _984);
    float _996 = -_980;
    float _998 = fma(_996, (*spvDescriptorSet0.vp_c15)._m0[21].z, _988);
    float _1000 = _844 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1002 = fma(_998, 0.5, 0.5);
    float _1004 = fma(_998, -0.5, 0.5);
    float _1006 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1008 = exp2(_990);
    float _1010 = -_978;
    float _1012 = _942 + _1010;
    float _1014 = _954 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1016 = -_1000;
    float _1018 = fma(_1016, _1006, 1.0);
    float _1020 = fma(_1002, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1022 = _954 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1024 = -_992;
    float _1026 = _964 + _1024;
    float _1028 = 1.0 / _994;
    float _1030 = fma(_1002, _1020, -0.212114393711090087890625);
    float _1032 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1022);
    float _1034 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1014);
    float _1036 = _976 + 1.0;
    float _1038 = fma(_1002, _1030, 1.570728778839111328125);
    float _1040 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1032);
    float _1042 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1034);
    float _1044 = log2(_1018);
    float _1046 = -_976;
    float _1048 = fma(_1008, _1036, _1046);
    float _1050 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1040);
    float _1052 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1042);
    float _1054 = fma(_1048, 0.5, 0.5);
    float _1056 = sqrt(_1004);
    float _1058 = _1050 * _1028;
    float _1060 = _1052 * _1028;
    float _1062 = fma(_1058, 0.5, 0.5);
    float _1064 = fma(_1060, -0.5, 0.5);
    float _1066 = _1044 * 0.693147182464599609375;
    float2 _3417 = float2(_1012, _1026);
    float _1068 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3417, float2(0.0), isnan(_3417)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3417, float2(0.0), isnan(_3417)), level(0.0)).x;
    float _1070 = _1066 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1072 = _1056 * 0.636619746685028076171875;
    float _1074 = -_1038;
    float _1076 = fma(_1072, _1074, 1.0);
    float3 _3440 = float3(_1062, _1064, _1070);
    float _1078 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3440, float3(0.0), isnan(_3440)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3440, float3(0.0), isnan(_3440)), level(0.0)).x;
    float3 _3451 = float3(_1062, _1064, _1070);
    float4 _1081 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3451, float3(0.0), isnan(_3451)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3451, float3(0.0), isnan(_3451)), level(0.0)).xyzw;
    float _1083 = _1081.x;
    float _1085 = _1081.y;
    float _1087 = _1081.z;
    float _1089 = _1081.w;
    float2 _3467 = float2(_1076, _1054);
    float3 _1093 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3467, float2(0.0), isnan(_3467)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3467, float2(0.0), isnan(_3467)), level(0.0)).xyz;
    float _1095 = _1093.x;
    float _1097 = _1093.y;
    float _1099 = _1093.z;
    float _1101 = in.m_74.y;
    float _1103 = _520 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1105 = in.m_66.y;
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1109 = _1107 != 0;
    float _1111 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1103);
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1115 = _1113 != 0;
    float _1117 = _962 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1119 = _520 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1121 = fma(_468, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1111);
    float _1123 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1119);
    bool _1125 = _189 > 0.5;
    bool _1127 = _1125 && _1115;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1131 = _1129 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1133 = fma(_468, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1123);
    out.m_76.x = 1.0;
    out.m_76.y = 1.0;
    out.m_76.z = 1.0;
    float _1135 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1139 = _1137 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1141 = -_1101;
    float _1143 = _1141 + 1.0;
    float _1145 = 1.0 / _1131;
    bool _1147 = _1105 > 0.5;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1151 = _1149 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1153 = _1101;
    if (_1109)
    {
        float _1155 = _1147 ? _1143 : _1101;
        _1153 = _1155;
    }
    float _1157 = _1153;
    float _1159 = 1.0 / _1139;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1165 = _389 != 0.0;
    bool _1167 = isnan(_389);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan(0.0);
    bool _1173 = _1169 || _1171;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1177 = 1.0 / _1135;
    float _1179 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1181 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1183 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1185 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1187 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1191 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1189);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1195 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1193);
    float _1197 = _1187 + _1135;
    out.m_78.x = _1181;
    out.m_78.y = _1183;
    out.m_78.z = _1185;
    float _1199 = 1.0 / _1151;
    bool _1201 = _387 == 0.0;
    bool _1203 = !_1173;
    bool _1205 = _1201 && _1203;
    float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1207;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1213 = _1211 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1215 = in.m_80.x;
    float _1217 = in.m_80.y;
    float _1219 = in.m_80.z;
    float _1221 = _1197 * _1177;
    float _1223 = _1221 * 0.5;
    bool _1225 = _391 == 0.0;
    bool _1227 = _1225 && _1205;
    float _1229 = _1213 * _1159;
    float _1231 = in.m_74.x;
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1235 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1233);
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1237;
    float _1241 = _1209 * _1145;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1245 = _371 + _1243;
    bool _1247 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1249 = isnan(_371);
    bool _1251 = _1247 || _1249;
    bool _1253 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1255 = _1251 || _1253;
    float _1257 = float(_1255);
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1261 = _371 + _1259;
    float _1263 = 1.0 / _1235;
    bool _1265 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1267 = isnan(_371);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = fma(_1241, _1245, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1279 = _1239 * _1199;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1283 = _371 + _1281;
    float _1285 = -_1257;
    float _1287 = _1285 + 1.0;
    bool _1289 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1291 = isnan(_371);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1297 = _1293 || _1295;
    float _1299 = float(_1297);
    float _1301 = -_1275;
    float _1303 = _1301 + 1.0;
    float _1305 = fma(_1229, _1283, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1307 = _1275 * _1287;
    bool _1309 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1311 = isnan(_371);
    bool _1313 = _1309 || _1311;
    bool _1315 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1317 = _1313 || _1315;
    float _1319 = float(_1317);
    float _1321 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1195);
    float _1323 = _1299 * _1303;
    float _1325 = _1215;
    float _1327 = _1217;
    float _1329 = _1219;
    float _1331 = _1287;
    float _1333 = _1157;
    if (!_1227)
    {
        float _1335 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1215);
        _1325 = _1335;
    }
    float _1337 = _1325;
    if (!_1227)
    {
        float _1339 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1217);
        _1327 = _1339;
    }
    float _1341 = _1327;
    if (!_1227)
    {
        float _1343 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1219);
        _1329 = _1343;
    }
    float _1345 = _1329;
    float _1347 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1349 = _1263 * _1347;
    bool _1351 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    bool _1357 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1359 = _1355 || _1357;
    float _1361 = -_1299;
    float _1363 = _1361 + 1.0;
    float _1365 = _327 * _1341;
    float _1367 = abs(_1349);
    float _1369 = log2(_1367);
    float _1371 = _323 * _1341;
    float _1373 = _468 + _1321;
    uint _1375 = uint(int(uint(_343) >> uint(2)));
    uint _1377 = uint(int(uint(int(_1375)) >> uint(2)));
    int _1379 = int(_1375) & 3;
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[int(_1377)][_1379];
    int _1383 = int(_1375) + 1;
    uint _1385 = uint(int(uint(_1383) >> uint(2)));
    int _1387 = _1383 & 3;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[int(_1385)][_1387];
    float _1391 = _1231;
    if (_1115)
    {
        _1331 = _1231;
    }
    float _1393 = _1331;
    float _1395 = _319 * _1341;
    float _1397 = fma(_291, _1337, _1371);
    float _1399 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1191);
    float _1401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1403 = _1393;
    if (_1127)
    {
        float _1405 = -_1393;
        float _1407 = _1405 + 1.0;
        _1403 = _1407;
    }
    float _1409 = _1403;
    if (_1359)
    {
        float _1411 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _293 = _1411;
    }
    float _1413 = _293;
    int _1415 = _343 + 8;
    uint _1417 = uint(int(uint(_1415) >> uint(2)));
    uint _1419 = uint(int(uint(int(_1417)) >> uint(2)));
    int _1421 = int(_1417) & 3;
    float _1423 = (*spvDescriptorSet0.vp_c9)._m0[int(_1419)][_1421];
    float _1425 = fma(_281, _1337, _1395);
    float _1427 = _1319 * _1363;
    if (_1115)
    {
        _1391 = _1409;
    }
    float _1429 = _1391;
    float _1431 = fma(_1279, _1261, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1433 = _1369 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1437 = fma(_297, _1337, _1365);
    float _1439 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1441 = fma(_331, _1345, _1425);
    float _1443 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1445 = fma(_335, _1345, _1397);
    float _1447 = _1439 * _1401;
    float _1449 = exp2(_1433);
    float _1451 = _1277 * _1427;
    float _1453 = -_1319;
    float _1455 = _1453 + 1.0;
    float _1457 = _1445 * _654;
    float _1459 = _1445 * _560;
    float _1461 = in.m_82.x;
    float _1463 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1451);
    float _1465 = _1443 * _1435;
    float _1467 = exp2(_1117);
    float _1469 = fma(_339, _1345, _1437);
    bool _1471 = _1349 <= 8000.0;
    bool _1473 = isnan(_1349);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan(8000.0);
    bool _1479 = _1475 || _1477;
    float _1481 = float(_1479);
    float _1483 = _474 + _1399;
    out.m_84.x = _1465;
    out.m_84.y = _1447;
    if (_1359)
    {
        float _1485 = precise::min(_1413, 20.0);
        _1333 = _1485;
    }
    float _1487 = _1333;
    float _1489 = fma(_1305, _1323, _1463);
    float _1491 = fma(_1449, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1493 = precise::clamp(_1491, 0.0, 1.0);
    float _1495 = -_1483;
    float _1497 = _1495 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1499 = -_1373;
    float _1501 = _1499 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1503 = fma(_1431, _1307, _1489);
    float _1505 = fma(_1493, -2.0, 3.0);
    float _1507 = _1493 * _1493;
    float _1509 = _1487;
    float _1511 = _1449;
    if (_1359)
    {
        float _1513 = 1.0 / _1487;
        _1509 = _1513;
    }
    float _1515 = _1509;
    float _1517 = _954 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1519 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1503);
    float _1521 = _1507 * _1505;
    float _1523 = _1445 * _550;
    float _1525 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1517);
    float _1527 = fma(_1441, _552, _1457);
    float _1529 = -_1521;
    float _1531 = _1529 + 1.0;
    float _1533 = -_1467;
    float _1535 = _1533 + 1.0;
    float _1537 = _1381 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1539 = _1389 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1541 = fma(_1531, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1521);
    float _1543 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1545 = fma(_1469, _558, _1527);
    float _1547 = precise::min(_1483, _1497);
    float _1549 = _1481 * _1541;
    float _1551 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1525);
    float _1553 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1555 = _1549 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1557 = precise::min(_1373, _1501);
    float _1559 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1561 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1563 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1565 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1567 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1551);
    float _1569 = precise::min(_1547, _1557);
    float _1571 = fma(_1441, _646, _1523);
    float _1573 = fma(_1441, _564, _1459);
    out.m_86.x = _1559;
    out.m_86.y = _1561;
    out.m_86.z = _1563;
    out.m_86.w = _1565;
    float _1575 = _1567 + _994;
    float _1577 = _1563;
    float _1579 = _1561;
    if (!_1359)
    {
        _1511 = 1.0;
    }
    float _1581 = _1511;
    float _1583 = _1581;
    if (_1359)
    {
        float _1585 = _1569 * _1515;
        float _1587 = precise::clamp(_1585, 0.0, 1.0);
        _1583 = _1587;
    }
    float _1589 = _1583;
    float _1591 = _1575 * 0.5;
    float _1593 = fma(_1469, _554, _1571);
    float _1595 = fma(_1469, _662, _1573);
    bool _1597 = _768 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1599 = isnan(_768);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1605 = _1601 || _1603;
    out.m_88.z = _1591;
    out.m_88.w = _994;
    out.m_90.x = _1593;
    out.m_90.y = _1545;
    out.m_90.z = _1595;
    out.gl_Position.x = _1050;
    out.gl_Position.y = _1052;
    out.gl_Position.z = _1567;
    out.gl_Position.w = _994;
    if (!_1605)
    {
        _1577 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1607 = _1577;
    float _1609 = _1607;
    float _1611 = _1607;
    if (!_1605)
    {
        _1579 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1613 = _1579;
    float _1615 = _1589 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1617 = -_1068;
    float _1619 = _1617 + 1.0;
    float _1621 = _1619 * _1555;
    float _1623 = precise::clamp(_1621, 0.0, 1.0);
    float _1625 = -_1623;
    float _1627 = fma(_1625, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1629 = _1627 * _1461;
    float _1631 = _1553 * _1078;
    float _1633 = -_1553;
    float _1635 = _1633 + 1.0;
    float _1637 = _1629 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1639 = _1089 * _1631;
    float _1641 = _1099 * _1631;
    float _1643 = _1089 * _1635;
    float _1645 = fma(_1095, _1639, _1083);
    float _1647 = fma(_1097, _1639, _1085);
    float _1649 = fma(_1089, _1641, _1087);
    out.m_92.x = _1637;
    float _1651 = _1639;
    float _1653 = _1613;
    float _1655 = _1613;
    if (!_1605)
    {
        _1651 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1657 = _1651;
    out.m_94.x = _1645;
    out.m_94.y = _1647;
    out.m_94.z = _1649;
    out.m_94.w = _1643;
    bool _1659 = !_1605;
    float _1661 = _1657;
    float _1663 = _1657;
    if (!_1659)
    {
        bool _1665 = _768 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1667 = isnan(_768);
        bool _1669 = _1665 || _1667;
        bool _1671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1673 = _1669 || _1671;
        if (!_1673)
        {
            float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1677 = _768 + _1675;
            float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1681 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1679;
            float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1691 = 1.0 / _1681;
            float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1697 = _1677 * _1691;
            float _1699 = precise::clamp(_1697, 0.0, 1.0);
            float _1701 = fma(_1699, _1685, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1703 = fma(_1699, _1689, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1705 = fma(_1699, _1695, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1655 = _1703;
            _1611 = _1701;
            _1663 = _1705;
            _1707 = true;
        }
        else
        {
            bool _1709 = _768 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1711 = isnan(_768);
            bool _1713 = _1709 || _1711;
            bool _1715 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1717 = _1713 || _1715;
            if (!_1717)
            {
                _1609 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1719 = _1609;
            _1611 = _1719;
            if (!_1717)
            {
                _1653 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1721 = _1653;
            _1655 = _1721;
            if (!_1717)
            {
                _1661 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1723 = _1661;
            bool _1725 = !_1717;
            _1663 = _1723;
            if (!_1725)
            {
                bool _1727 = _768 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1729 = isnan(_768);
                bool _1731 = _1727 || _1729;
                bool _1733 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1735 = _1731 || _1733;
                if (!_1735)
                {
                    float _1737 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1739 = _768 + _1737;
                    float _1741 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1743 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1741;
                    float _1745 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1747 = _1745 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1749 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1751 = _1749 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1753 = 1.0 / _1743;
                    float _1755 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1757 = _1755 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1759 = _1739 * _1753;
                    float _1761 = precise::clamp(_1759, 0.0, 1.0);
                    float _1763 = fma(_1761, _1747, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1765 = fma(_1761, _1751, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1767 = fma(_1761, _1757, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1655 = _1765;
                    _1611 = _1763;
                    _1663 = _1767;
                    _1707 = true;
                }
                else
                {
                    _1655 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1611 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1663 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1707 = false;
    float _1769 = _1655;
    float _1771 = _1611;
    float _1773 = _1663;
    float _1775 = _1769 * 0.586610972881317138671875;
    bool _1777 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1779 = _1615 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_56.x = 1.0;
    float _1781 = fma(_1771, 0.298911988735198974609375, _1775);
    out.m_92.w = _1779;
    float _1783 = fma(_1773, 0.114477999508380889892578125, _1781);
    out.m_96.x = 0.0;
    float _1785 = -_1783;
    float _1787 = _1785 + _1771;
    float _1789 = -_1783;
    float _1791 = _1789 + _1769;
    float _1793 = -_1783;
    float _1795 = _1793 + _1773;
    float _1797 = fma(_1787, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1783);
    float _1799 = fma(_1791, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1783);
    float _1801 = fma(_1795, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1783);
    out.m_98.x = _1797;
    out.m_98.y = _1799;
    out.m_98.z = _1801;
    if (!_1777)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1803 = -_740;
    float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1807 = -_742;
    float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1811 = -_744;
    float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1815 = _1805 * _1805;
    float _1817 = fma(_1809, _1809, _1815);
    float _1819 = fma(_1813, _1813, _1817);
    float _1821 = sqrt(_1819);
    float _1823 = rsqrt(_1819);
    float _1825 = -_1821;
    float _1827 = _1825 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1829 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1831 = precise::clamp(_1829, 0.0, 1.0);
    float _1833 = _1809 * _1823;
    float _1835 = _1805 * _1823;
    float _1837 = abs(_1831);
    float _1839 = log2(_1837);
    float _1841 = _1813 * _1823;
    float _1843 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1845 = _1545 * _1835;
    float _1847 = -_1835;
    float _1849 = -_1843;
    float _1851 = fma(_1847, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1849);
    float _1853 = fma(_1593, _1833, _1845);
    float _1855 = -_1841;
    float _1857 = fma(_1855, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1851);
    float _1859 = fma(_1595, _1841, _1853);
    float _1861 = precise::clamp(_1859, 0.0, 1.0);
    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1865 = _1857 + _1863;
    float _1867 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1869 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1871 = precise::clamp(_1869, 0.0, 1.0);
    float _1873 = exp2(_1867);
    float _1875 = _1873 * _1871;
    float _1877 = _1861 * _1875;
    float _1879 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1881 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1883 = _1877 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _1879;
    out.m_96.y = _1881;
    out.m_96.z = _1883;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

