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
    float4 m_84 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_80 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_98 [[user(locn4)]];
    float4 m_56 [[user(locn5)]];
    float4 m_90 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_96 [[user(locn8)]];
    float4 m_94 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_100 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
    float4 m_78 [[attribute(7)]];
    float4 m_72 [[attribute(8)]];
    float4 m_66 [[attribute(9)]];
    float4 m_70 [[attribute(10)]];
    float4 m_76 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1925 = false;
    bool _363 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_53.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_56.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2270 = as_type<float>(_135);
        out.gl_Position.z = _2270;
    }
    if (!_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_58.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_149)
    {
        float _155 = float(_119);
        _129 = _155;
    }
    float _157 = _129;
    bool _159 = _153 >= _157;
    bool _161 = !_149;
    bool _163 = _159 || _161;
    float _165 = _157;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_56.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _137 = as_type<int>(_169);
    }
    int _171 = _137;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2339 = as_type<float>(_171);
        out.gl_Position.z = _2339;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _173 = in.m_60.x;
    float _175 = in.m_60.y;
    float _177 = in.m_60.z;
    float _179 = in.m_62.x;
    float _181 = in.m_62.y;
    float _183 = in.m_62.z;
    float _185 = in.m_64.x;
    float _187 = in.m_64.y;
    float _189 = in.m_64.z;
    float _191 = in.m_66.x;
    float _193 = _173 * _173;
    float _195 = _175 * _175;
    float _197 = _177 * _177;
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = fma(_187, _187, _201);
    float _209 = fma(_189, _189, _203);
    float _211 = sqrt(_205);
    float _213 = sqrt(_207);
    float _215 = sqrt(_209);
    bool _217 = _211 > 0.0;
    bool _219 = _213 > 0.0;
    float _221 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _223 = _205;
    if (_217)
    {
        float _225 = rsqrt(_205);
        _223 = _225;
    }
    float _227 = _223;
    float _229 = _221 * _191;
    bool _231 = _215 > 0.0;
    float _233 = 0.0;
    if (!_217)
    {
        _233 = 0.0;
    }
    float _235 = _233;
    float _237 = 0.0;
    float _239 = _235;
    if (!_217)
    {
        _237 = 0.0;
    }
    float _241 = _237;
    float _243 = 0.0;
    float _245 = _241;
    if (!_217)
    {
        _243 = 0.0;
    }
    float _247 = _243;
    float _249 = _215;
    float _251 = _247;
    if (_219)
    {
        float _253 = rsqrt(_207);
        _249 = _253;
    }
    float _255 = _249;
    float _257 = 0.0;
    if (!_219)
    {
        _257 = 0.0;
    }
    float _259 = _257;
    float _261 = 0.0;
    float _263 = _259;
    if (!_219)
    {
        _261 = 0.0;
    }
    float _265 = _261;
    float _267 = 0.0;
    float _269 = _265;
    if (!_219)
    {
        _267 = 0.0;
    }
    float _271 = _267;
    float _273 = _271;
    if (_217)
    {
        float _275 = _227 * _179;
        _239 = _275;
    }
    float _277 = _239;
    float _279 = _211;
    if (_231)
    {
        float _281 = rsqrt(_209);
        _279 = _281;
    }
    float _283 = _279;
    if (_217)
    {
        float _285 = _227 * _173;
        _245 = _285;
    }
    float _287 = _245;
    if (_217)
    {
        float _289 = _227 * _185;
        _251 = _289;
    }
    float _291 = _251;
    bool _293 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _295 = 0.0;
    if (!_231)
    {
        _295 = 0.0;
    }
    float _297 = _295;
    float _299 = 0.0;
    float _301 = _297;
    if (!_231)
    {
        _299 = 0.0;
    }
    float _303 = _299;
    float _305 = trunc(_229);
    int _307 = int(_305);
    float _309 = 0.0;
    float _311 = _303;
    if (!_231)
    {
        _309 = 0.0;
    }
    float _313 = _309;
    float _315 = _313;
    if (_219)
    {
        float _317 = _255 * _181;
        _263 = _317;
    }
    float _319 = _263;
    if (_219)
    {
        float _321 = _255 * _175;
        _269 = _321;
    }
    float _323 = _269;
    if (_219)
    {
        float _325 = _255 * _187;
        _273 = _325;
    }
    float _327 = _273;
    if (_231)
    {
        float _329 = _283 * _183;
        _301 = _329;
    }
    float _331 = _301;
    if (_231)
    {
        float _333 = _283 * _177;
        _311 = _333;
    }
    float _335 = _311;
    if (_231)
    {
        float _337 = _283 * _189;
        _315 = _337;
    }
    float _339 = _315;
    int _341 = _307 << 4;
    int _343 = _341 + 1712;
    bool _345 = !_293;
    float _361;
    if (!_345)
    {
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _349 = _191 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        float _365 = float(_119);
        float _367 = 1.0 / _365;
        float _369 = _153 * _367;
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
    float _426 = _187 * _377;
    float _428 = _383 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _430 = _381 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _432 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _387);
    float _434 = fma(_185, _375, _426);
    float _436 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _389);
    float _438 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _440 = _430 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _442 = _385 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _444 = _181 * _377;
    float _446 = _438 * _436;
    float _448 = _440 * _432;
    float _450 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _391);
    float _452 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _454 = _446 * _327;
    float _456 = fma(_179, _375, _444);
    float _458 = _446 * _319;
    float _460 = fma(_189, _379, _434);
    float _462 = _452 * _450;
    float _464 = fma(_448, _291, _454);
    float _466 = fma(_183, _379, _456);
    float _468 = fma(_448, _277, _458);
    float _470 = _460 + _393;
    float _472 = fma(_462, _339, _464);
    float _474 = _466 + _395;
    float _476 = fma(_462, _331, _468);
    float _478 = in.m_60.w;
    float _480 = _470 + _472;
    float _482 = _175 * _377;
    float _484 = _474 + _476;
    float _486 = _446 * _323;
    float _488 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _490 = _480 + _488;
    float _492 = fma(_173, _375, _482);
    float _494 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _496 = _484 + _494;
    float _498 = fma(_448, _287, _486);
    float _500 = _490 * _490;
    float _502 = fma(_177, _379, _492);
    float _504 = fma(_462, _335, _498);
    float _506 = fma(_496, _496, _500);
    bool _508 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _510 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _512 = _508 || _510;
    bool _514 = isnan(0.5);
    bool _516 = _512 || _514;
    float _518 = sqrt(_506);
    bool _520 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _522 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _524 = _520 || _522;
    bool _526 = isnan(0.5);
    bool _528 = _524 || _526;
    float _530 = _502 + _478;
    float _532 = _530 + _504;
    bool _534 = _518 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _536 = _424 * 2.0;
    float _538 = _406 * 2.0;
    float _540 = _412 * 2.0;
    float _542 = _406 * _406;
    float _544 = _418 * _536;
    float _546 = _412 * _536;
    float _548 = _406 * _536;
    float _550 = _412 * _412;
    float _552 = -_544;
    float _554 = fma(_412, _538, _552);
    float _556 = fma(_412, _538, _544);
    float _558 = fma(_418, _538, _546);
    float _560 = -_548;
    float _562 = fma(_418, _540, _560);
    float _564 = -_546;
    float _566 = fma(_418, _538, _564);
    float _568 = fma(_418, _540, _548);
    float _570 = _418 * _418;
    float _572 = _418;
    float _574 = _406;
    float _576 = _412;
    float _578 = _456;
    if (!_534)
    {
        _572 = _484;
    }
    float _580 = _572;
    float _582 = _580;
    if (!_534)
    {
        _574 = _480;
    }
    float _584 = _574;
    float _586 = _584;
    if (!_534)
    {
        _576 = _532;
    }
    float _588 = _576;
    bool _590 = !_534;
    float _592 = _588;
    if (!_590)
    {
        float _594 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _596 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _598 = _518 + _596;
        float _600 = _532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _602 = rsqrt(_506);
        float _604 = _598 * _594;
        float _606 = _604 * 0.15915493667125701904296875;
        float _608 = _606 * 6.283185482025146484375;
        float _610 = cos(_608);
        float _612 = _606 * 6.283185482025146484375;
        float _614 = sin(_612);
        float _616 = _610 + (-1.0);
        float _618 = _616 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _620 = fma(_614, _600, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _622 = fma(_532, _610, _618);
        float _624 = _602 * _620;
        float _626 = fma(_496, _624, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _628 = fma(_490, _624, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _592 = _622;
        _582 = _626;
        _586 = _628;
    }
    float _630 = _592;
    float _632 = _582;
    float _634 = _586;
    float _636 = -_530;
    float _638 = _636 + _630;
    float _640 = -_474;
    float _642 = _640 + _632;
    float _644 = fma(_542, -2.0, 1.0);
    float _646 = fma(_550, -2.0, 1.0);
    float _648 = _638 * _323;
    float _650 = -_470;
    float _652 = _650 + _634;
    float _654 = _638 * _287;
    float _656 = _638 * _335;
    float _658 = fma(_642, _319, _648);
    float _660 = fma(_570, -2.0, _646);
    float _662 = fma(_642, _277, _654);
    float _664 = fma(_570, -2.0, _644);
    float _666 = fma(_652, _327, _658);
    float _668 = fma(_550, -2.0, _644);
    float _670 = fma(_642, _331, _656);
    float _672 = fma(_652, _291, _662);
    float _674 = _666 * _554;
    float _676 = _666 * _664;
    float _678 = _666 * _568;
    float _680 = fma(_652, _339, _670);
    float _682 = fma(_672, _660, _674);
    float _684 = fma(_672, _556, _676);
    float _686 = fma(_672, _566, _678);
    float _688 = _662;
    if (_528)
    {
        _578 = 1.0;
    }
    float _690 = _578;
    float _692 = fma(_680, _558, _682);
    float _694 = fma(_680, _562, _684);
    float _696 = fma(_680, _668, _686);
    float _698 = _474 + _692;
    float _700 = _530 + _694;
    float _702 = _470 + _696;
    float _704 = _700;
    float _706 = _698;
    float _708 = _702;
    float _710 = _690;
    float _712 = _694;
    float _714 = _692;
    if (!_516)
    {
        float _716 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _718 = _530 + _716;
        float _720 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _722 = _474 + _720;
        float _724 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _726 = _718 * _718;
        float _728 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _730 = _470 + _728;
        float _732 = fma(_722, _722, _726);
        float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _736 = fma(_730, _730, _732);
        float _738 = sqrt(_736);
        float _740 = _724 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _742 = precise::min(_738, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _744 = _742 * _734;
        float _746 = _740 * _744;
        float _748 = fma(_692, _746, _474);
        float _750 = fma(_694, _746, _530);
        float _752 = fma(_696, _746, _470);
        _688 = _734;
        _704 = _750;
        _706 = _748;
        _708 = _752;
    }
    float _754 = _688;
    float _756 = _704;
    float _758 = _706;
    float _760 = _708;
    float _762 = _754;
    if (!_528)
    {
        float _764 = in.m_74.w;
        int _766 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _768 = _766 == 4;
        bool _770 = _766 == 8;
        bool _772 = _766 == 12;
        int _774 = as_type<int>(_764) << 16;
        int _776 = as_type<int>(_764) << 8;
        int _778 = as_type<int>(_764) << 24;
        int _780 = _774 >> 24;
        int _782 = _776 >> 24;
        int _784 = as_type<int>(_764) >> 24;
        int _786 = _778 >> 24;
        float _788 = float(_780);
        float _790 = float(_782);
        float _792 = float(_784);
        float _794 = _788 * 0.0078740157186985015869140625;
        float _796 = float(_786);
        float _798 = _790 * 0.0078740157186985015869140625;
        float _800 = _792 * 0.0078740157186985015869140625;
        float _802 = precise::min(_794, 1.0);
        float _804 = _796 * 0.0078740157186985015869140625;
        float _806 = precise::min(_798, 1.0);
        float _808 = precise::min(_800, 1.0);
        float _810 = precise::min(_804, 1.0);
        float _812 = precise::max(_802, -1.0);
        float _814 = precise::max(_806, -1.0);
        float _816 = precise::max(_808, -1.0);
        float _818 = precise::max(_810, -1.0);
        float _820 = _818;
        _712 = _814;
        _762 = _816;
        if (_768)
        {
            _820 = _812;
        }
        float _822 = _820;
        float _824 = _822;
        if (_770)
        {
            _824 = _814;
        }
        float _826 = _824;
        float _828 = _826;
        if (_772)
        {
            _828 = _816;
        }
        float _830 = _828;
        float _832 = abs(_830);
        float _834 = (-0.0) + _832;
        _710 = _834;
    }
    float _836 = _710;
    float _838 = _712;
    float _840 = _762;
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _844 = _756 + _842;
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _848 = _758 + _846;
    float _850 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _852 = _760 + _850;
    float _854 = _844 * _844;
    bool _856 = _836 != 0.0;
    bool _858 = isnan(_836);
    bool _860 = _856 || _858;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    float _866 = fma(_848, _848, _854);
    float _868 = fma(_852, _852, _866);
    float _870 = rsqrt(_868);
    float _872 = sqrt(_868);
    float _874 = _848 * _870;
    float _876 = _852 * _870;
    float _878 = _844 * _870;
    float _880 = _874 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _882 = _876 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _884 = _880 * _880;
    float _886 = _882 * _882;
    float _888 = _884 + _886;
    float _890 = sqrt(_888);
    bool _892 = _890 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _894 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _896 = _890 + _894;
    float _898 = _838;
    float _900 = _888;
    float _902 = _896;
    float _904 = _870;
    if (_892)
    {
        float _906 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _898 = _906;
    }
    float _908 = _898;
    if (_892)
    {
        float _910 = rsqrt(_888);
        _900 = _910;
    }
    float _912 = _900;
    if (_892)
    {
        float _914 = _896 * _908;
        _902 = _914;
    }
    float _916 = _902;
    if (_892)
    {
        float _918 = _916 * 0.15915493667125701904296875;
        _714 = _918;
    }
    float _920 = _714;
    float _922 = _908;
    float _924 = _920;
    if (_892)
    {
        float _926 = _920 * 6.283185482025146484375;
        float _928 = cos(_926);
        _922 = _928;
    }
    float _930 = _922;
    float _932 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _934 = precise::max(0.0, _932);
    float _936 = _840;
    float _938 = _934;
    if (_892)
    {
        float _940 = _920 * 6.283185482025146484375;
        float _942 = sin(_940);
        _936 = _942;
    }
    float _944 = _936;
    float _946 = -_878;
    float _948 = -_934;
    float _950 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[24].y, _948);
    float _952 = _950;
    if (_892)
    {
        float _954 = _950 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _904 = _954;
    }
    float _956 = _904;
    float _958 = _956;
    if (_892)
    {
        float _960 = _930 + (-1.0);
        _938 = _960;
    }
    float _962 = _938;
    float _964 = _962;
    if (!_892)
    {
        _924 = _884;
    }
    float _966 = _924;
    float _968 = _756 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _970 = _966;
    if (_892)
    {
        float _972 = _962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _964 = _972;
    }
    float _974 = _964;
    float _976 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[3].x, _968);
    float _978 = _944;
    float _980 = _974;
    if (_892)
    {
        float _982 = fma(_944, _956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _978 = _982;
    }
    float _984 = _978;
    if (_892)
    {
        float _986 = fma(_950, _930, _974);
        _952 = _986;
    }
    float _988 = _952;
    float _990 = _756 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _992 = _990;
    if (!_892)
    {
        _958 = _880;
    }
    float _994 = _958;
    float _996 = 0.0;
    float _998 = _994;
    if (_892)
    {
        float _1000 = _912 * _984;
        _996 = _1000;
    }
    float _1002 = _996;
    if (!_892)
    {
        _980 = _882;
    }
    float _1004 = _980;
    float _1006 = fma(_474, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1008 = _1004;
    float _1010 = _1006;
    if (_892)
    {
        float _1012 = _880 * _1002;
        _998 = _1012;
    }
    float _1014 = _998;
    float _1016 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[2].x, _990);
    if (_892)
    {
        float _1018 = _882 * _1002;
        _1008 = _1018;
    }
    float _1020 = _1008;
    if (!_892)
    {
        _992 = _886;
    }
    float _1022 = _992;
    float _1024 = _1022;
    if (_892)
    {
        float _1026 = _1014 * _1014;
        _970 = _1026;
    }
    float _1028 = _970;
    float _1030 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1016);
    if (_892)
    {
        float _1032 = _1020 * _1020;
        _1024 = _1032;
    }
    float _1034 = _1024;
    float _1036 = fma(_988, _988, _1028);
    float _1038 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1040 = _756 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1042 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[3].z, _976);
    float _1044 = _1036 + _1034;
    float _1046 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1048 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1050 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1040);
    float _1052 = rsqrt(_1044);
    float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1056 = fma(_872, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1054);
    float _1058 = precise::clamp(_1056, 0.0, 1.0);
    float _1060 = -_1048;
    float _1062 = fma(_1060, _1046, 1.0);
    float _1064 = _756 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1066 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1050);
    float _1068 = -_1058;
    float _1070 = _1068 + 1.0;
    float _1072 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1074 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1064);
    float _1076 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1078 = floor(_1006);
    float _1080 = fma(_470, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1082 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1074);
    float _1084 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1086 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1088 = _1052 * _1014;
    float _1090 = abs(_1070);
    float _1092 = log2(_1090);
    float _1094 = _1052 * _988;
    float _1096 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1084);
    float _1098 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1100 = _1052 * _1020;
    float _1102 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1096);
    float _1104 = -_1098;
    float _1106 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1104);
    float _1108 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1110 = floor(_1080);
    float _1112 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1102);
    float _1114 = -_1100;
    float _1116 = fma(_1114, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1106);
    float _1118 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1120 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1108);
    float _1122 = fma(_1116, -0.5, 0.5);
    float _1124 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1118);
    float _1126 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1128 = 1.0 / _1112;
    float _1130 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1120);
    float _1132 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1124);
    float _1134 = fma(_1116, 0.5, 0.5);
    float _1136 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1132);
    float _1138 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1130);
    float _1140 = log2(_1062);
    float _1142 = fma(_1134, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1144 = -_1110;
    float _1146 = _1080 + _1144;
    float _1148 = _1094 + 1.0;
    float _1150 = fma(_1134, _1142, -0.212114393711090087890625);
    float _1152 = sqrt(_1122);
    float _1154 = fma(_1134, _1150, 1.570728778839111328125);
    float _1156 = exp2(_1126);
    float _1158 = -_1078;
    float _1160 = _1006 + _1158;
    float _1162 = _1078;
    float _1164 = _1112;
    if (_864)
    {
        _1162 = _1136;
    }
    float _1166 = _1162;
    float _1168 = _1140 * 0.693147182464599609375;
    float _1170 = _1166;
    if (_864)
    {
        _1010 = _1138;
    }
    float _1172 = _1010;
    float _1174 = _1172;
    if (!_864)
    {
        _1170 = 0.0;
        _1174 = 0.0;
    }
    float _1176 = _1170;
    float _1178 = _1174;
    float _1180 = _1168 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1182 = _1152 * 0.636619746685028076171875;
    float _1184 = _1128 * _1176;
    float _1186 = _1128 * _1178;
    float _1188 = -_1154;
    float _1190 = fma(_1182, _1188, 1.0);
    float _1192 = fma(_1184, 0.5, 0.5);
    float _1194 = -_1094;
    float _1196 = fma(_1156, _1148, _1194);
    float _1198 = fma(_1186, -0.5, 0.5);
    float2 _3907 = float2(_1160, _1146);
    float _1200 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3907, float2(0.0), isnan(_3907)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3907, float2(0.0), isnan(_3907)), level(0.0)).x;
    float _1202 = fma(_1196, 0.5, 0.5);
    float3 _3920 = float3(_1192, _1198, _1180);
    float _1204 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3920, float3(0.0), isnan(_3920)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3920, float3(0.0), isnan(_3920)), level(0.0)).x;
    float3 _3931 = float3(_1192, _1198, _1180);
    float4 _1207 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3931, float3(0.0), isnan(_3931)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3931, float3(0.0), isnan(_3931)), level(0.0)).xyzw;
    float _1209 = _1207.x;
    float _1211 = _1207.y;
    float _1213 = _1207.z;
    float _1215 = _1207.w;
    float2 _3947 = float2(_1190, _1202);
    float3 _1219 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3947, float2(0.0), isnan(_3947)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3947, float2(0.0), isnan(_3947)), level(0.0)).xyz;
    float _1221 = _1219.x;
    float _1223 = _1219.y;
    float _1225 = _1219.z;
    float _1227 = in.m_76.y;
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1231 = _371 + _1229;
    float _1233 = in.m_66.y;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1237 = _1235 != 0;
    float _1239 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1243 = _1241 != 0;
    float _1245 = _530 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1249 = _1247 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1251 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1253 = in.m_76.x;
    float _1255 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1245);
    bool _1257 = _191 > 0.5;
    bool _1259 = _1257 && _1243;
    float _1261 = exp2(_1239);
    float _1263 = _1251 * _191;
    float _1265 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1255);
    float _1267 = _530 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1269 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1271 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1273 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1267);
    float _1275 = 1.0 / _1249;
    float _1277 = -_1227;
    float _1279 = _1277 + 1.0;
    float _1281 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1273);
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1285 = _1283 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1289 = _1287 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1291 = _1233 > 0.5;
    float _1293 = trunc(_1263);
    int _1295 = int(_1293);
    float _1297 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1299 = _1227;
    if (_1237)
    {
        float _1301 = _1291 ? _1279 : _1227;
        _1299 = _1301;
    }
    float _1303 = _1299;
    float _1305 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    bool _1307 = _389 != 0.0;
    bool _1309 = isnan(_389);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan(0.0);
    bool _1315 = _1311 || _1313;
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1317;
    float _1321 = _1297 + _1271;
    float _1323 = 1.0 / _1271;
    float _1325 = _1319 * _1275;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1329 = _371 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1335 = _387 == 0.0;
    bool _1337 = !_1315;
    bool _1339 = _1335 && _1337;
    float _1341 = fma(_1325, _1329, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1343 = _1295 << 4;
    int _1345 = _1343 + 1968;
    float _1347 = 1.0 / _1285;
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1351 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1349);
    float _1353 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1355 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1353);
    float _1357 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1269);
    bool _1359 = _391 == 0.0;
    bool _1361 = _1359 && _1339;
    float _1363 = _1321 * _1323;
    float _1365 = _1363 * 0.5;
    float _1367 = 1.0 / _1289;
    float _1369 = in.m_78.x;
    float _1371 = in.m_78.y;
    float _1373 = in.m_78.z;
    bool _1375 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1377 = isnan(_371);
    bool _1379 = _1375 || _1377;
    bool _1381 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1383 = _1379 || _1381;
    float _1385 = float(_1383);
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1389 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1387);
    bool _1391 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1393 = isnan(_371);
    bool _1395 = _1391 || _1393;
    bool _1397 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1399 = _1395 || _1397;
    float _1401 = float(_1399);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1405 = _371 + _1403;
    bool _1407 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1409 = isnan(_371);
    bool _1411 = _1407 || _1409;
    bool _1413 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1415 = _1411 || _1413;
    float _1417 = float(_1415);
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1419;
    bool _1423 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1425 = isnan(_371);
    bool _1427 = _1423 || _1425;
    bool _1429 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1431 = _1427 || _1429;
    float _1433 = float(_1431);
    float _1435 = _1333 * _1347;
    float _1437 = 1.0 / _1389;
    uint _1439 = uint(int(uint(_1345) >> uint(2)));
    uint _1441 = uint(int(uint(int(_1439)) >> uint(2)));
    int _1443 = int(_1439) & 3;
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[int(_1441)][_1443];
    int _1447 = int(_1439) + 1;
    uint _1449 = uint(int(uint(_1447) >> uint(2)));
    int _1451 = _1447 & 3;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[int(_1449)][_1451];
    float _1455 = 0.0;
    float _1457 = _1253;
    float _1459 = _1355;
    if (_1243)
    {
        _1455 = _1253;
    }
    float _1461 = _1455;
    float _1463 = -_1433;
    float _1465 = _1463 + 1.0;
    float _1467 = fma(_1435, _1231, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1469 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1351);
    float _1471 = _1421 * _1367;
    float _1473 = -_1417;
    float _1475 = _1473 + 1.0;
    float _1477 = _1461;
    if (_1259)
    {
        float _1479 = -_1461;
        float _1481 = _1479 + 1.0;
        _1477 = _1481;
    }
    float _1483 = _1477;
    int _1485 = _1345 + 8;
    uint _1487 = uint(int(uint(_1485) >> uint(2)));
    uint _1489 = uint(int(uint(int(_1487)) >> uint(2)));
    int _1491 = int(_1487) & 3;
    float _1493 = (*spvDescriptorSet0.vp_c9)._m0[int(_1489)][_1491];
    float _1495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1497 = _1433 * _1475;
    float _1499 = _1401 * _1465;
    float _1501 = -_1401;
    float _1503 = _1501 + 1.0;
    if (_1243)
    {
        _1457 = _1483;
    }
    float _1505 = _1457;
    float _1507 = _1371;
    float _1509 = _1369;
    float _1511 = _1373;
    if (!_1361)
    {
        float _1513 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1371);
        _1507 = _1513;
    }
    float _1515 = _1507;
    if (!_1361)
    {
        float _1517 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1369);
        _1509 = _1517;
    }
    float _1519 = _1509;
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1523 = _1437 * _1521;
    if (!_1361)
    {
        float _1525 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1373);
        _1511 = _1525;
    }
    float _1527 = _1511;
    float _1529 = _319 * _1515;
    float _1531 = _323 * _1515;
    float _1533 = _327 * _1515;
    float _1535 = _474 + _1469;
    float _1537 = fma(_277, _1519, _1529);
    float _1539 = abs(_1523);
    float _1541 = log2(_1539);
    uint _1543 = uint(int(uint(_343) >> uint(2)));
    uint _1545 = uint(int(uint(int(_1543)) >> uint(2)));
    int _1547 = int(_1543) & 3;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[int(_1545)][_1547];
    int _1551 = int(_1543) + 1;
    uint _1553 = uint(int(uint(_1551) >> uint(2)));
    int _1555 = _1551 & 3;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[int(_1553)][_1555];
    bool _1559 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1561 = isnan(0.0);
    bool _1563 = _1559 || _1561;
    bool _1565 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1567 = _1563 || _1565;
    float _1569 = _1385 * _1503;
    float _1571 = -_1385;
    float _1573 = _1571 + 1.0;
    float _1575 = fma(_287, _1519, _1531);
    float _1577 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1355);
    float _1579 = _1341 * _1569;
    float _1581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1583 = _343 + 8;
    uint _1585 = uint(int(uint(_1583) >> uint(2)));
    uint _1587 = uint(int(uint(int(_1585)) >> uint(2)));
    int _1589 = int(_1585) & 3;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[int(_1587)][_1589];
    float _1593 = _470 + _1577;
    float _1595 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1597 = fma(_1573, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1579);
    float _1599 = fma(_331, _1527, _1537);
    float _1601 = -_1593;
    float _1603 = _1601 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    if (_1567)
    {
        float _1605 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1459 = _1605;
    }
    float _1607 = _1459;
    float _1609 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1611 = fma(_291, _1519, _1533);
    float _1613 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1615 = fma(_335, _1527, _1575);
    float _1617 = _1607;
    if (_1567)
    {
        float _1619 = precise::min(_1607, 20.0);
        _1617 = _1619;
    }
    float _1621 = _1617;
    float _1623 = exp2(_1609);
    float _1625 = _1613 * _1495;
    float _1627 = _1595 * _1581;
    float _1629 = _1445 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1631 = _1453 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1633 = -_1535;
    float _1635 = _1633 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1637 = fma(_339, _1527, _1611);
    float _1639 = fma(_1471, _1405, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1641 = _1445;
    if (_1567)
    {
        float _1643 = 1.0 / _1621;
        _1641 = _1643;
    }
    float _1645 = _1641;
    float _1647 = fma(_1467, _1499, _1597);
    float _1649 = precise::min(_1535, _1635);
    out.m_80.x = _1627;
    out.m_80.y = _1625;
    float _1651 = precise::min(_1593, _1603);
    float _1653 = fma(_1639, _1497, _1647);
    float _1655 = _1493 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1657 = _1615 * _568;
    float _1659 = fma(_1623, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1661 = precise::clamp(_1659, 0.0, 1.0);
    float _1663 = precise::min(_1649, _1651);
    float _1665 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1653);
    float _1667 = _1649;
    if (!_1567)
    {
        _1667 = 1.0;
    }
    float _1669 = _1667;
    float _1671 = fma(_1661, -2.0, 3.0);
    float _1673 = _1615 * _554;
    float _1675 = _1661 * _1661;
    float _1677 = _1665 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1679 = _1669;
    if (_1567)
    {
        float _1681 = _1663 * _1645;
        float _1683 = precise::clamp(_1681, 0.0, 1.0);
        _1679 = _1683;
    }
    float _1685 = _1679;
    float _1687 = fma(_1599, _660, _1673);
    float _1689 = _1675 * _1671;
    float _1691 = _1549 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1693 = _1557 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1695 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1357);
    float _1697 = _1685 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1699 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1701 = _1693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1703 = -_1261;
    float _1705 = _1703 + 1.0;
    float _1707 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1591 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1711 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1713 = _1655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = fma(_1599, _566, _1657);
    float _1717 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1719 = _1615 * _664;
    float _1721 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1695);
    out.m_82.x = _1707;
    out.m_82.y = _1711;
    out.m_82.z = _1713;
    bool _1723 = _1523 <= 8000.0;
    bool _1725 = isnan(_1523);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan(8000.0);
    bool _1731 = _1727 || _1729;
    float _1733 = float(_1731);
    float _1735 = fma(_1599, _556, _1719);
    float _1737 = _1721 + _1112;
    out.m_84.x = _1699;
    out.m_84.y = _1701;
    out.m_84.z = _1717;
    out.m_84.w = _1677;
    float _1739 = _1737 * 0.5;
    float _1741 = in.m_74.x;
    bool _1743 = _872 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1745 = isnan(_872);
    bool _1747 = _1743 || _1745;
    bool _1749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1751 = _1747 || _1749;
    float _1753 = -_1689;
    float _1755 = _1753 + 1.0;
    out.gl_Position.x = _1136;
    out.gl_Position.y = _1138;
    out.gl_Position.z = _1721;
    out.gl_Position.w = _1112;
    int _1757 = as_type<int>(_1713);
    float _1759 = _1721;
    if (!_864)
    {
        float _1761 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _1757 = as_type<int>(_1761);
    }
    int _1763 = _1757;
    float _1765 = fma(_1755, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1689);
    out.m_86.z = _1739;
    out.m_86.w = _1112;
    float _1767 = _1697 * _836;
    float _1769 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1771 = _1733 * _1765;
    float _1773 = fma(_1637, _558, _1687);
    float _1775 = fma(_1637, _562, _1735);
    float _1777 = fma(_1637, _668, _1715);
    float _1779 = _1771 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_88.x = _758;
    out.m_88.y = _756;
    out.m_88.z = _760;
    float _1781 = _1767;
    float _1783 = 0.0;
    if (!_864)
    {
        _1781 = 0.0;
    }
    float _1785 = _1781;
    out.m_90.x = _1773;
    out.m_90.y = _1775;
    out.m_90.z = _1777;
    if (!_1751)
    {
        _1164 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1787 = _1164;
    float _1789 = _1787;
    float _1791 = _1787;
    if (!_1751)
    {
        _1759 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1793 = _1759;
    float _1795 = _1793;
    float _1797 = _1793;
    if (!_864)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4923 = as_type<float>(_1763);
        out.gl_Position.z = _4923;
    }
    if (!_1751)
    {
        _1783 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1799 = _1783;
    float _1801 = -_1200;
    float _1803 = _1801 + 1.0;
    float _1805 = _1769 * _1204;
    float _1807 = -_1769;
    float _1809 = _1807 + 1.0;
    float _1811 = _1803 * _1779;
    float _1813 = precise::clamp(_1811, 0.0, 1.0);
    float _1815 = _1215 * _1805;
    float _1817 = _1225 * _1805;
    float _1819 = _1215 * _1809;
    float _1821 = -_1813;
    float _1823 = fma(_1821, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1825 = fma(_1221, _1815, _1209);
    float _1827 = fma(_1223, _1815, _1211);
    float _1829 = fma(_1215, _1817, _1213);
    float _1831 = _1823 * _1741;
    float _1833 = _1815;
    float _1835 = _1805;
    float _1837 = _1799;
    float _1839 = _1799;
    if (!_1751)
    {
        _1833 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1841 = _1833;
    float _1843 = _1841;
    float _1845 = _1841;
    if (!_1751)
    {
        _1835 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1847 = _1835;
    out.m_92.x = _1825;
    out.m_92.y = _1827;
    out.m_92.z = _1829;
    out.m_92.w = _1819;
    float _1849 = _1831 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_94.x = _1849;
    float _1851 = _1849;
    float _1853 = _1847;
    float _1855 = _1847;
    if (!_1751)
    {
        _1851 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1857 = _1851;
    bool _1859 = !_1751;
    float _1861 = _1857;
    float _1863 = _1857;
    if (!_1859)
    {
        bool _1865 = _872 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1867 = isnan(_872);
        bool _1869 = _1865 || _1867;
        bool _1871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1873 = _1869 || _1871;
        if (!_1873)
        {
            float _1875 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1877 = _872 + _1875;
            float _1879 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1881 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1879;
            float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1887 = 1.0 / _1881;
            float _1889 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1891 = _1889 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1895 = _1893 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1899 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1905 = _1877 * _1887;
            float _1907 = precise::clamp(_1905, 0.0, 1.0);
            float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1913 = fma(_1907, _1885, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1915 = fma(_1907, _1911, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1917 = fma(_1907, _1891, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1919 = fma(_1907, _1895, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1921 = fma(_1907, _1899, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1923 = fma(_1907, _1903, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1791 = _1917;
            _1855 = _1921;
            _1839 = _1913;
            _1845 = _1919;
            _1797 = _1915;
            _1863 = _1923;
            _1925 = true;
        }
        else
        {
            bool _1927 = _872 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1929 = isnan(_872);
            bool _1931 = _1927 || _1929;
            bool _1933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1935 = _1931 || _1933;
            if (!_1935)
            {
                _1837 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1937 = _1837;
            _1839 = _1937;
            if (!_1935)
            {
                _1789 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1939 = _1789;
            _1791 = _1939;
            if (!_1935)
            {
                _1795 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1941 = _1795;
            _1797 = _1941;
            if (!_1935)
            {
                _1843 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1943 = _1843;
            _1845 = _1943;
            if (!_1935)
            {
                _1853 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1945 = _1853;
            _1855 = _1945;
            if (!_1935)
            {
                _1861 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1947 = _1861;
            bool _1949 = !_1935;
            _1863 = _1947;
            if (!_1949)
            {
                bool _1951 = _872 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1953 = isnan(_872);
                bool _1955 = _1951 || _1953;
                bool _1957 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1959 = _1955 || _1957;
                if (!_1959)
                {
                    float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1963 = _872 + _1961;
                    float _1965 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1967 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1965;
                    float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1971 = _1969 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1973 = 1.0 / _1967;
                    float _1975 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1977 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1981 = _1979 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1991 = _1963 * _1973;
                    float _1993 = precise::clamp(_1991, 0.0, 1.0);
                    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1999 = fma(_1993, _1971, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2001 = fma(_1993, _1997, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2003 = fma(_1993, _1977, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2005 = fma(_1993, _1981, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2007 = fma(_1993, _1985, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2009 = fma(_1993, _1989, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1791 = _2003;
                    _1855 = _2007;
                    _1839 = _1999;
                    _1845 = _2005;
                    _1797 = _2001;
                    _1863 = _2009;
                    _1925 = true;
                }
                else
                {
                    _1791 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1855 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1839 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1845 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1797 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1863 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1925 = false;
    float _2011 = _1791;
    float _2013 = _1855;
    float _2015 = _1839;
    float _2017 = _1845;
    float _2019 = _1797;
    float _2021 = _1863;
    float _2023 = fma(_1775, -0.5, 0.5);
    float _2025 = precise::clamp(_2023, 0.0, 1.0);
    float _2027 = -_2011;
    float _2029 = _2027 + _2013;
    float _2031 = -_2015;
    float _2033 = _2031 + _2017;
    float _2035 = -_2019;
    float _2037 = _2035 + _2021;
    bool _2039 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2041 = fma(_2025, _2029, _2011);
    float _2043 = fma(_2025, _2033, _2015);
    float _2045 = fma(_2025, _2037, _2019);
    float _2047 = _1785 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2049 = _2041 * 0.586610972881317138671875;
    out.m_96.x = 0.0;
    float _2051 = fma(_2043, 0.298911988735198974609375, _2049);
    out.m_94.w = _2047;
    float _2053 = fma(_2045, 0.114477999508380889892578125, _2051);
    out.m_56.x = 1.0;
    float _2055 = -_2053;
    float _2057 = _2043 + _2055;
    float _2059 = -_2053;
    float _2061 = _2041 + _2059;
    float _2063 = -_2053;
    float _2065 = _2045 + _2063;
    float _2067 = fma(_2057, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2053);
    float _2069 = fma(_2061, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2053);
    float _2071 = fma(_2065, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2053);
    out.m_98.x = 0.0;
    out.m_100.x = _2067;
    out.m_100.y = _2069;
    out.m_100.z = _2071;
    if (!_2039)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2073 = -_756;
    float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2077 = -_758;
    float _2079 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2081 = -_760;
    float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2085 = _2075 * _2075;
    float _2087 = fma(_2079, _2079, _2085);
    float _2089 = fma(_2083, _2083, _2087);
    float _2091 = rsqrt(_2089);
    float _2093 = _2075 * _2091;
    float _2095 = _2079 * _2091;
    float _2097 = _2083 * _2091;
    float _2099 = sqrt(_2089);
    float _2101 = -_878;
    float _2103 = _2101 + _2093;
    float _2105 = -_874;
    float _2107 = _2105 + _2095;
    float _2109 = -_876;
    float _2111 = _2109 + _2097;
    float _2113 = _2103 * _2103;
    float _2115 = fma(_2107, _2107, _2113);
    float _2117 = fma(_2111, _2111, _2115);
    float _2119 = -_2099;
    float _2121 = _2119 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2123 = rsqrt(_2117);
    float _2125 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2127 = precise::clamp(_2125, 0.0, 1.0);
    float _2129 = abs(_2127);
    float _2131 = log2(_2129);
    float _2133 = _2103 * _2123;
    float _2135 = _2107 * _2123;
    float _2137 = _2111 * _2123;
    float _2139 = _1775 * _2133;
    float _2141 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2143 = precise::clamp(_2141, 0.0, 1.0);
    float _2145 = _1775 * _2093;
    float _2147 = fma(_1773, _2135, _2139);
    float _2149 = _2143 * _2143;
    float _2151 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2153 = fma(_1773, _2095, _2145);
    float _2155 = fma(_1777, _2137, _2147);
    float _2157 = precise::clamp(_2155, 0.0, 1.0);
    float _2159 = _2149 + (-1.0);
    float _2161 = fma(_1777, _2097, _2153);
    float _2163 = precise::clamp(_2161, 0.0, 1.0);
    float _2165 = _2157 * _2157;
    float _2167 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2169 = exp2(_2151);
    float _2171 = fma(_2165, _2159, 1.0);
    float _2173 = -_2093;
    float _2175 = -_2167;
    float _2177 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2175);
    float _2179 = _2171 * _2171;
    float _2181 = -_2097;
    float _2183 = fma(_2181, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2177);
    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2187 = _2183 + _2185;
    float _2189 = 1.0 / _2179;
    float _2191 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2193 = precise::clamp(_2191, 0.0, 1.0);
    float _2195 = _2169 * _2193;
    float _2197 = _2163 * _2195;
    float _2199 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2201 = _2149 * _2189;
    float _2203 = _2197 * _2201;
    float _2205 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2207 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2209 = _2203 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2211 = _2203 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2213 = _2203 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _2199;
    out.m_96.y = _2205;
    out.m_96.z = _2207;
    out.m_98.x = _2209;
    out.m_98.y = _2211;
    out.m_98.z = _2213;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1925 = false;
    bool _363 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_53.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_56.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2270 = as_type<float>(_135);
        out.gl_Position.z = _2270;
    }
    if (!_123)
    {
        return out;
    }
    float _139 = in.m_58.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_149)
    {
        float _155 = float(_119);
        _129 = _155;
    }
    float _157 = _129;
    bool _159 = _153 >= _157;
    bool _161 = !_149;
    bool _163 = _159 || _161;
    float _165 = _157;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_56.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _137 = as_type<int>(_169);
    }
    int _171 = _137;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2339 = as_type<float>(_171);
        out.gl_Position.z = _2339;
    }
    if (_163)
    {
        return out;
    }
    float _173 = in.m_60.x;
    float _175 = in.m_60.y;
    float _177 = in.m_60.z;
    float _179 = in.m_62.x;
    float _181 = in.m_62.y;
    float _183 = in.m_62.z;
    float _185 = in.m_64.x;
    float _187 = in.m_64.y;
    float _189 = in.m_64.z;
    float _191 = in.m_66.x;
    float _193 = _173 * _173;
    float _195 = _175 * _175;
    float _197 = _177 * _177;
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = fma(_187, _187, _201);
    float _209 = fma(_189, _189, _203);
    float _211 = sqrt(_205);
    float _213 = sqrt(_207);
    float _215 = sqrt(_209);
    bool _217 = _211 > 0.0;
    bool _219 = _213 > 0.0;
    float _221 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _223 = _205;
    if (_217)
    {
        float _225 = rsqrt(_205);
        _223 = _225;
    }
    float _227 = _223;
    float _229 = _221 * _191;
    bool _231 = _215 > 0.0;
    float _233 = 0.0;
    if (!_217)
    {
        _233 = 0.0;
    }
    float _235 = _233;
    float _237 = 0.0;
    float _239 = _235;
    if (!_217)
    {
        _237 = 0.0;
    }
    float _241 = _237;
    float _243 = 0.0;
    float _245 = _241;
    if (!_217)
    {
        _243 = 0.0;
    }
    float _247 = _243;
    float _249 = _215;
    float _251 = _247;
    if (_219)
    {
        float _253 = rsqrt(_207);
        _249 = _253;
    }
    float _255 = _249;
    float _257 = 0.0;
    if (!_219)
    {
        _257 = 0.0;
    }
    float _259 = _257;
    float _261 = 0.0;
    float _263 = _259;
    if (!_219)
    {
        _261 = 0.0;
    }
    float _265 = _261;
    float _267 = 0.0;
    float _269 = _265;
    if (!_219)
    {
        _267 = 0.0;
    }
    float _271 = _267;
    float _273 = _271;
    if (_217)
    {
        float _275 = _227 * _179;
        _239 = _275;
    }
    float _277 = _239;
    float _279 = _211;
    if (_231)
    {
        float _281 = rsqrt(_209);
        _279 = _281;
    }
    float _283 = _279;
    if (_217)
    {
        float _285 = _227 * _173;
        _245 = _285;
    }
    float _287 = _245;
    if (_217)
    {
        float _289 = _227 * _185;
        _251 = _289;
    }
    float _291 = _251;
    bool _293 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _295 = 0.0;
    if (!_231)
    {
        _295 = 0.0;
    }
    float _297 = _295;
    float _299 = 0.0;
    float _301 = _297;
    if (!_231)
    {
        _299 = 0.0;
    }
    float _303 = _299;
    float _305 = trunc(_229);
    int _307 = int(_305);
    float _309 = 0.0;
    float _311 = _303;
    if (!_231)
    {
        _309 = 0.0;
    }
    float _313 = _309;
    float _315 = _313;
    if (_219)
    {
        float _317 = _255 * _181;
        _263 = _317;
    }
    float _319 = _263;
    if (_219)
    {
        float _321 = _255 * _175;
        _269 = _321;
    }
    float _323 = _269;
    if (_219)
    {
        float _325 = _255 * _187;
        _273 = _325;
    }
    float _327 = _273;
    if (_231)
    {
        float _329 = _283 * _183;
        _301 = _329;
    }
    float _331 = _301;
    if (_231)
    {
        float _333 = _283 * _177;
        _311 = _333;
    }
    float _335 = _311;
    if (_231)
    {
        float _337 = _283 * _189;
        _315 = _337;
    }
    float _339 = _315;
    int _341 = _307 << 4;
    int _343 = _341 + 1712;
    bool _345 = !_293;
    float _361;
    if (!_345)
    {
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _349 = _191 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        float _365 = float(_119);
        float _367 = 1.0 / _365;
        float _369 = _153 * _367;
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
    float _426 = _187 * _377;
    float _428 = _383 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _430 = _381 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _432 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _387);
    float _434 = fma(_185, _375, _426);
    float _436 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _389);
    float _438 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _440 = _430 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _442 = _385 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _444 = _181 * _377;
    float _446 = _438 * _436;
    float _448 = _440 * _432;
    float _450 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _391);
    float _452 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _454 = _446 * _327;
    float _456 = fma(_179, _375, _444);
    float _458 = _446 * _319;
    float _460 = fma(_189, _379, _434);
    float _462 = _452 * _450;
    float _464 = fma(_448, _291, _454);
    float _466 = fma(_183, _379, _456);
    float _468 = fma(_448, _277, _458);
    float _470 = _460 + _393;
    float _472 = fma(_462, _339, _464);
    float _474 = _466 + _395;
    float _476 = fma(_462, _331, _468);
    float _478 = in.m_60.w;
    float _480 = _470 + _472;
    float _482 = _175 * _377;
    float _484 = _474 + _476;
    float _486 = _446 * _323;
    float _488 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _490 = _480 + _488;
    float _492 = fma(_173, _375, _482);
    float _494 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _496 = _484 + _494;
    float _498 = fma(_448, _287, _486);
    float _500 = _490 * _490;
    float _502 = fma(_177, _379, _492);
    float _504 = fma(_462, _335, _498);
    float _506 = fma(_496, _496, _500);
    bool _508 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _510 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _512 = _508 || _510;
    bool _514 = isnan(0.5);
    bool _516 = _512 || _514;
    float _518 = sqrt(_506);
    bool _520 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _522 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _524 = _520 || _522;
    bool _526 = isnan(0.5);
    bool _528 = _524 || _526;
    float _530 = _502 + _478;
    float _532 = _530 + _504;
    bool _534 = _518 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _536 = _424 * 2.0;
    float _538 = _406 * 2.0;
    float _540 = _412 * 2.0;
    float _542 = _406 * _406;
    float _544 = _418 * _536;
    float _546 = _412 * _536;
    float _548 = _406 * _536;
    float _550 = _412 * _412;
    float _552 = -_544;
    float _554 = fma(_412, _538, _552);
    float _556 = fma(_412, _538, _544);
    float _558 = fma(_418, _538, _546);
    float _560 = -_548;
    float _562 = fma(_418, _540, _560);
    float _564 = -_546;
    float _566 = fma(_418, _538, _564);
    float _568 = fma(_418, _540, _548);
    float _570 = _418 * _418;
    float _572 = _418;
    float _574 = _406;
    float _576 = _412;
    float _578 = _456;
    if (!_534)
    {
        _572 = _484;
    }
    float _580 = _572;
    float _582 = _580;
    if (!_534)
    {
        _574 = _480;
    }
    float _584 = _574;
    float _586 = _584;
    if (!_534)
    {
        _576 = _532;
    }
    float _588 = _576;
    bool _590 = !_534;
    float _592 = _588;
    if (!_590)
    {
        float _594 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _596 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _598 = _518 + _596;
        float _600 = _532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _602 = rsqrt(_506);
        float _604 = _598 * _594;
        float _606 = _604 * 0.15915493667125701904296875;
        float _608 = _606 * 6.283185482025146484375;
        float _610 = cos(_608);
        float _612 = _606 * 6.283185482025146484375;
        float _614 = sin(_612);
        float _616 = _610 + (-1.0);
        float _618 = _616 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _620 = fma(_614, _600, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _622 = fma(_532, _610, _618);
        float _624 = _602 * _620;
        float _626 = fma(_496, _624, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _628 = fma(_490, _624, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _592 = _622;
        _582 = _626;
        _586 = _628;
    }
    float _630 = _592;
    float _632 = _582;
    float _634 = _586;
    float _636 = -_530;
    float _638 = _636 + _630;
    float _640 = -_474;
    float _642 = _640 + _632;
    float _644 = fma(_542, -2.0, 1.0);
    float _646 = fma(_550, -2.0, 1.0);
    float _648 = _638 * _323;
    float _650 = -_470;
    float _652 = _650 + _634;
    float _654 = _638 * _287;
    float _656 = _638 * _335;
    float _658 = fma(_642, _319, _648);
    float _660 = fma(_570, -2.0, _646);
    float _662 = fma(_642, _277, _654);
    float _664 = fma(_570, -2.0, _644);
    float _666 = fma(_652, _327, _658);
    float _668 = fma(_550, -2.0, _644);
    float _670 = fma(_642, _331, _656);
    float _672 = fma(_652, _291, _662);
    float _674 = _666 * _554;
    float _676 = _666 * _664;
    float _678 = _666 * _568;
    float _680 = fma(_652, _339, _670);
    float _682 = fma(_672, _660, _674);
    float _684 = fma(_672, _556, _676);
    float _686 = fma(_672, _566, _678);
    float _688 = _662;
    if (_528)
    {
        _578 = 1.0;
    }
    float _690 = _578;
    float _692 = fma(_680, _558, _682);
    float _694 = fma(_680, _562, _684);
    float _696 = fma(_680, _668, _686);
    float _698 = _474 + _692;
    float _700 = _530 + _694;
    float _702 = _470 + _696;
    float _704 = _700;
    float _706 = _698;
    float _708 = _702;
    float _710 = _690;
    float _712 = _694;
    float _714 = _692;
    if (!_516)
    {
        float _716 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _718 = _530 + _716;
        float _720 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _722 = _474 + _720;
        float _724 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _726 = _718 * _718;
        float _728 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _730 = _470 + _728;
        float _732 = fma(_722, _722, _726);
        float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _736 = fma(_730, _730, _732);
        float _738 = sqrt(_736);
        float _740 = _724 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _742 = precise::min(_738, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _744 = _742 * _734;
        float _746 = _740 * _744;
        float _748 = fma(_692, _746, _474);
        float _750 = fma(_694, _746, _530);
        float _752 = fma(_696, _746, _470);
        _688 = _734;
        _704 = _750;
        _706 = _748;
        _708 = _752;
    }
    float _754 = _688;
    float _756 = _704;
    float _758 = _706;
    float _760 = _708;
    float _762 = _754;
    if (!_528)
    {
        float _764 = in.m_74.w;
        int _766 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _768 = _766 == 4;
        bool _770 = _766 == 8;
        bool _772 = _766 == 12;
        int _774 = as_type<int>(_764) << 16;
        int _776 = as_type<int>(_764) << 8;
        int _778 = as_type<int>(_764) << 24;
        int _780 = _774 >> 24;
        int _782 = _776 >> 24;
        int _784 = as_type<int>(_764) >> 24;
        int _786 = _778 >> 24;
        float _788 = float(_780);
        float _790 = float(_782);
        float _792 = float(_784);
        float _794 = _788 * 0.0078740157186985015869140625;
        float _796 = float(_786);
        float _798 = _790 * 0.0078740157186985015869140625;
        float _800 = _792 * 0.0078740157186985015869140625;
        float _802 = precise::min(_794, 1.0);
        float _804 = _796 * 0.0078740157186985015869140625;
        float _806 = precise::min(_798, 1.0);
        float _808 = precise::min(_800, 1.0);
        float _810 = precise::min(_804, 1.0);
        float _812 = precise::max(_802, -1.0);
        float _814 = precise::max(_806, -1.0);
        float _816 = precise::max(_808, -1.0);
        float _818 = precise::max(_810, -1.0);
        float _820 = _818;
        _712 = _814;
        _762 = _816;
        if (_768)
        {
            _820 = _812;
        }
        float _822 = _820;
        float _824 = _822;
        if (_770)
        {
            _824 = _814;
        }
        float _826 = _824;
        float _828 = _826;
        if (_772)
        {
            _828 = _816;
        }
        float _830 = _828;
        float _832 = abs(_830);
        float _834 = (-0.0) + _832;
        _710 = _834;
    }
    float _836 = _710;
    float _838 = _712;
    float _840 = _762;
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _844 = _756 + _842;
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _848 = _758 + _846;
    float _850 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _852 = _760 + _850;
    float _854 = _844 * _844;
    bool _856 = _836 != 0.0;
    bool _858 = isnan(_836);
    bool _860 = _856 || _858;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    float _866 = fma(_848, _848, _854);
    float _868 = fma(_852, _852, _866);
    float _870 = rsqrt(_868);
    float _872 = sqrt(_868);
    float _874 = _848 * _870;
    float _876 = _852 * _870;
    float _878 = _844 * _870;
    float _880 = _874 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _882 = _876 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _884 = _880 * _880;
    float _886 = _882 * _882;
    float _888 = _884 + _886;
    float _890 = sqrt(_888);
    bool _892 = _890 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _894 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _896 = _890 + _894;
    float _898 = _838;
    float _900 = _888;
    float _902 = _896;
    float _904 = _870;
    if (_892)
    {
        float _906 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _898 = _906;
    }
    float _908 = _898;
    if (_892)
    {
        float _910 = rsqrt(_888);
        _900 = _910;
    }
    float _912 = _900;
    if (_892)
    {
        float _914 = _896 * _908;
        _902 = _914;
    }
    float _916 = _902;
    if (_892)
    {
        float _918 = _916 * 0.15915493667125701904296875;
        _714 = _918;
    }
    float _920 = _714;
    float _922 = _908;
    float _924 = _920;
    if (_892)
    {
        float _926 = _920 * 6.283185482025146484375;
        float _928 = cos(_926);
        _922 = _928;
    }
    float _930 = _922;
    float _932 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _934 = precise::max(0.0, _932);
    float _936 = _840;
    float _938 = _934;
    if (_892)
    {
        float _940 = _920 * 6.283185482025146484375;
        float _942 = sin(_940);
        _936 = _942;
    }
    float _944 = _936;
    float _946 = -_878;
    float _948 = -_934;
    float _950 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[24].y, _948);
    float _952 = _950;
    if (_892)
    {
        float _954 = _950 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _904 = _954;
    }
    float _956 = _904;
    float _958 = _956;
    if (_892)
    {
        float _960 = _930 + (-1.0);
        _938 = _960;
    }
    float _962 = _938;
    float _964 = _962;
    if (!_892)
    {
        _924 = _884;
    }
    float _966 = _924;
    float _968 = _756 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _970 = _966;
    if (_892)
    {
        float _972 = _962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _964 = _972;
    }
    float _974 = _964;
    float _976 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[3].x, _968);
    float _978 = _944;
    float _980 = _974;
    if (_892)
    {
        float _982 = fma(_944, _956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _978 = _982;
    }
    float _984 = _978;
    if (_892)
    {
        float _986 = fma(_950, _930, _974);
        _952 = _986;
    }
    float _988 = _952;
    float _990 = _756 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _992 = _990;
    if (!_892)
    {
        _958 = _880;
    }
    float _994 = _958;
    float _996 = 0.0;
    float _998 = _994;
    if (_892)
    {
        float _1000 = _912 * _984;
        _996 = _1000;
    }
    float _1002 = _996;
    if (!_892)
    {
        _980 = _882;
    }
    float _1004 = _980;
    float _1006 = fma(_474, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1008 = _1004;
    float _1010 = _1006;
    if (_892)
    {
        float _1012 = _880 * _1002;
        _998 = _1012;
    }
    float _1014 = _998;
    float _1016 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[2].x, _990);
    if (_892)
    {
        float _1018 = _882 * _1002;
        _1008 = _1018;
    }
    float _1020 = _1008;
    if (!_892)
    {
        _992 = _886;
    }
    float _1022 = _992;
    float _1024 = _1022;
    if (_892)
    {
        float _1026 = _1014 * _1014;
        _970 = _1026;
    }
    float _1028 = _970;
    float _1030 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1016);
    if (_892)
    {
        float _1032 = _1020 * _1020;
        _1024 = _1032;
    }
    float _1034 = _1024;
    float _1036 = fma(_988, _988, _1028);
    float _1038 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1040 = _756 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1042 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[3].z, _976);
    float _1044 = _1036 + _1034;
    float _1046 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1048 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1050 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1040);
    float _1052 = rsqrt(_1044);
    float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1056 = fma(_872, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1054);
    float _1058 = precise::clamp(_1056, 0.0, 1.0);
    float _1060 = -_1048;
    float _1062 = fma(_1060, _1046, 1.0);
    float _1064 = _756 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1066 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1050);
    float _1068 = -_1058;
    float _1070 = _1068 + 1.0;
    float _1072 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1074 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1064);
    float _1076 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1078 = floor(_1006);
    float _1080 = fma(_470, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1082 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1074);
    float _1084 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1086 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1088 = _1052 * _1014;
    float _1090 = abs(_1070);
    float _1092 = log2(_1090);
    float _1094 = _1052 * _988;
    float _1096 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1084);
    float _1098 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1100 = _1052 * _1020;
    float _1102 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1096);
    float _1104 = -_1098;
    float _1106 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1104);
    float _1108 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1110 = floor(_1080);
    float _1112 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1102);
    float _1114 = -_1100;
    float _1116 = fma(_1114, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1106);
    float _1118 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1120 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1108);
    float _1122 = fma(_1116, -0.5, 0.5);
    float _1124 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1118);
    float _1126 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1128 = 1.0 / _1112;
    float _1130 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1120);
    float _1132 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1124);
    float _1134 = fma(_1116, 0.5, 0.5);
    float _1136 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1132);
    float _1138 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1130);
    float _1140 = log2(_1062);
    float _1142 = fma(_1134, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1144 = -_1110;
    float _1146 = _1080 + _1144;
    float _1148 = _1094 + 1.0;
    float _1150 = fma(_1134, _1142, -0.212114393711090087890625);
    float _1152 = sqrt(_1122);
    float _1154 = fma(_1134, _1150, 1.570728778839111328125);
    float _1156 = exp2(_1126);
    float _1158 = -_1078;
    float _1160 = _1006 + _1158;
    float _1162 = _1078;
    float _1164 = _1112;
    if (_864)
    {
        _1162 = _1136;
    }
    float _1166 = _1162;
    float _1168 = _1140 * 0.693147182464599609375;
    float _1170 = _1166;
    if (_864)
    {
        _1010 = _1138;
    }
    float _1172 = _1010;
    float _1174 = _1172;
    if (!_864)
    {
        _1170 = 0.0;
        _1174 = 0.0;
    }
    float _1176 = _1170;
    float _1178 = _1174;
    float _1180 = _1168 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1182 = _1152 * 0.636619746685028076171875;
    float _1184 = _1128 * _1176;
    float _1186 = _1128 * _1178;
    float _1188 = -_1154;
    float _1190 = fma(_1182, _1188, 1.0);
    float _1192 = fma(_1184, 0.5, 0.5);
    float _1194 = -_1094;
    float _1196 = fma(_1156, _1148, _1194);
    float _1198 = fma(_1186, -0.5, 0.5);
    float2 _3907 = float2(_1160, _1146);
    float _1200 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3907, float2(0.0), isnan(_3907)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3907, float2(0.0), isnan(_3907)), level(0.0)).x;
    float _1202 = fma(_1196, 0.5, 0.5);
    float3 _3920 = float3(_1192, _1198, _1180);
    float _1204 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3920, float3(0.0), isnan(_3920)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3920, float3(0.0), isnan(_3920)), level(0.0)).x;
    float3 _3931 = float3(_1192, _1198, _1180);
    float4 _1207 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3931, float3(0.0), isnan(_3931)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3931, float3(0.0), isnan(_3931)), level(0.0)).xyzw;
    float _1209 = _1207.x;
    float _1211 = _1207.y;
    float _1213 = _1207.z;
    float _1215 = _1207.w;
    float2 _3947 = float2(_1190, _1202);
    float3 _1219 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3947, float2(0.0), isnan(_3947)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3947, float2(0.0), isnan(_3947)), level(0.0)).xyz;
    float _1221 = _1219.x;
    float _1223 = _1219.y;
    float _1225 = _1219.z;
    float _1227 = in.m_76.y;
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1231 = _371 + _1229;
    float _1233 = in.m_66.y;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1237 = _1235 != 0;
    float _1239 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1243 = _1241 != 0;
    float _1245 = _530 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1249 = _1247 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1251 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1253 = in.m_76.x;
    float _1255 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1245);
    bool _1257 = _191 > 0.5;
    bool _1259 = _1257 && _1243;
    float _1261 = exp2(_1239);
    float _1263 = _1251 * _191;
    float _1265 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1255);
    float _1267 = _530 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1269 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1271 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1273 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1267);
    float _1275 = 1.0 / _1249;
    float _1277 = -_1227;
    float _1279 = _1277 + 1.0;
    float _1281 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1273);
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1285 = _1283 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1289 = _1287 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1291 = _1233 > 0.5;
    float _1293 = trunc(_1263);
    int _1295 = int(_1293);
    float _1297 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1299 = _1227;
    if (_1237)
    {
        float _1301 = _1291 ? _1279 : _1227;
        _1299 = _1301;
    }
    float _1303 = _1299;
    float _1305 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    bool _1307 = _389 != 0.0;
    bool _1309 = isnan(_389);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan(0.0);
    bool _1315 = _1311 || _1313;
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1317;
    float _1321 = _1297 + _1271;
    float _1323 = 1.0 / _1271;
    float _1325 = _1319 * _1275;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1329 = _371 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1335 = _387 == 0.0;
    bool _1337 = !_1315;
    bool _1339 = _1335 && _1337;
    float _1341 = fma(_1325, _1329, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1343 = _1295 << 4;
    int _1345 = _1343 + 1968;
    float _1347 = 1.0 / _1285;
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1351 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1349);
    float _1353 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1355 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1353);
    float _1357 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1269);
    bool _1359 = _391 == 0.0;
    bool _1361 = _1359 && _1339;
    float _1363 = _1321 * _1323;
    float _1365 = _1363 * 0.5;
    float _1367 = 1.0 / _1289;
    float _1369 = in.m_78.x;
    float _1371 = in.m_78.y;
    float _1373 = in.m_78.z;
    bool _1375 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1377 = isnan(_371);
    bool _1379 = _1375 || _1377;
    bool _1381 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1383 = _1379 || _1381;
    float _1385 = float(_1383);
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1389 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1387);
    bool _1391 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1393 = isnan(_371);
    bool _1395 = _1391 || _1393;
    bool _1397 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1399 = _1395 || _1397;
    float _1401 = float(_1399);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1405 = _371 + _1403;
    bool _1407 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1409 = isnan(_371);
    bool _1411 = _1407 || _1409;
    bool _1413 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1415 = _1411 || _1413;
    float _1417 = float(_1415);
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1419;
    bool _1423 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1425 = isnan(_371);
    bool _1427 = _1423 || _1425;
    bool _1429 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1431 = _1427 || _1429;
    float _1433 = float(_1431);
    float _1435 = _1333 * _1347;
    float _1437 = 1.0 / _1389;
    uint _1439 = uint(int(uint(_1345) >> uint(2)));
    uint _1441 = uint(int(uint(int(_1439)) >> uint(2)));
    int _1443 = int(_1439) & 3;
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[int(_1441)][_1443];
    int _1447 = int(_1439) + 1;
    uint _1449 = uint(int(uint(_1447) >> uint(2)));
    int _1451 = _1447 & 3;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[int(_1449)][_1451];
    float _1455 = 0.0;
    float _1457 = _1253;
    float _1459 = _1355;
    if (_1243)
    {
        _1455 = _1253;
    }
    float _1461 = _1455;
    float _1463 = -_1433;
    float _1465 = _1463 + 1.0;
    float _1467 = fma(_1435, _1231, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1469 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1351);
    float _1471 = _1421 * _1367;
    float _1473 = -_1417;
    float _1475 = _1473 + 1.0;
    float _1477 = _1461;
    if (_1259)
    {
        float _1479 = -_1461;
        float _1481 = _1479 + 1.0;
        _1477 = _1481;
    }
    float _1483 = _1477;
    int _1485 = _1345 + 8;
    uint _1487 = uint(int(uint(_1485) >> uint(2)));
    uint _1489 = uint(int(uint(int(_1487)) >> uint(2)));
    int _1491 = int(_1487) & 3;
    float _1493 = (*spvDescriptorSet0.vp_c9)._m0[int(_1489)][_1491];
    float _1495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1497 = _1433 * _1475;
    float _1499 = _1401 * _1465;
    float _1501 = -_1401;
    float _1503 = _1501 + 1.0;
    if (_1243)
    {
        _1457 = _1483;
    }
    float _1505 = _1457;
    float _1507 = _1371;
    float _1509 = _1369;
    float _1511 = _1373;
    if (!_1361)
    {
        float _1513 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1371);
        _1507 = _1513;
    }
    float _1515 = _1507;
    if (!_1361)
    {
        float _1517 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1369);
        _1509 = _1517;
    }
    float _1519 = _1509;
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1523 = _1437 * _1521;
    if (!_1361)
    {
        float _1525 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1373);
        _1511 = _1525;
    }
    float _1527 = _1511;
    float _1529 = _319 * _1515;
    float _1531 = _323 * _1515;
    float _1533 = _327 * _1515;
    float _1535 = _474 + _1469;
    float _1537 = fma(_277, _1519, _1529);
    float _1539 = abs(_1523);
    float _1541 = log2(_1539);
    uint _1543 = uint(int(uint(_343) >> uint(2)));
    uint _1545 = uint(int(uint(int(_1543)) >> uint(2)));
    int _1547 = int(_1543) & 3;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[int(_1545)][_1547];
    int _1551 = int(_1543) + 1;
    uint _1553 = uint(int(uint(_1551) >> uint(2)));
    int _1555 = _1551 & 3;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[int(_1553)][_1555];
    bool _1559 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1561 = isnan(0.0);
    bool _1563 = _1559 || _1561;
    bool _1565 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1567 = _1563 || _1565;
    float _1569 = _1385 * _1503;
    float _1571 = -_1385;
    float _1573 = _1571 + 1.0;
    float _1575 = fma(_287, _1519, _1531);
    float _1577 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1355);
    float _1579 = _1341 * _1569;
    float _1581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1583 = _343 + 8;
    uint _1585 = uint(int(uint(_1583) >> uint(2)));
    uint _1587 = uint(int(uint(int(_1585)) >> uint(2)));
    int _1589 = int(_1585) & 3;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[int(_1587)][_1589];
    float _1593 = _470 + _1577;
    float _1595 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1597 = fma(_1573, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1579);
    float _1599 = fma(_331, _1527, _1537);
    float _1601 = -_1593;
    float _1603 = _1601 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    if (_1567)
    {
        float _1605 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1459 = _1605;
    }
    float _1607 = _1459;
    float _1609 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1611 = fma(_291, _1519, _1533);
    float _1613 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1615 = fma(_335, _1527, _1575);
    float _1617 = _1607;
    if (_1567)
    {
        float _1619 = precise::min(_1607, 20.0);
        _1617 = _1619;
    }
    float _1621 = _1617;
    float _1623 = exp2(_1609);
    float _1625 = _1613 * _1495;
    float _1627 = _1595 * _1581;
    float _1629 = _1445 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1631 = _1453 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1633 = -_1535;
    float _1635 = _1633 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1637 = fma(_339, _1527, _1611);
    float _1639 = fma(_1471, _1405, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1641 = _1445;
    if (_1567)
    {
        float _1643 = 1.0 / _1621;
        _1641 = _1643;
    }
    float _1645 = _1641;
    float _1647 = fma(_1467, _1499, _1597);
    float _1649 = precise::min(_1535, _1635);
    out.m_80.x = _1627;
    out.m_80.y = _1625;
    float _1651 = precise::min(_1593, _1603);
    float _1653 = fma(_1639, _1497, _1647);
    float _1655 = _1493 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1657 = _1615 * _568;
    float _1659 = fma(_1623, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1661 = precise::clamp(_1659, 0.0, 1.0);
    float _1663 = precise::min(_1649, _1651);
    float _1665 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1653);
    float _1667 = _1649;
    if (!_1567)
    {
        _1667 = 1.0;
    }
    float _1669 = _1667;
    float _1671 = fma(_1661, -2.0, 3.0);
    float _1673 = _1615 * _554;
    float _1675 = _1661 * _1661;
    float _1677 = _1665 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1679 = _1669;
    if (_1567)
    {
        float _1681 = _1663 * _1645;
        float _1683 = precise::clamp(_1681, 0.0, 1.0);
        _1679 = _1683;
    }
    float _1685 = _1679;
    float _1687 = fma(_1599, _660, _1673);
    float _1689 = _1675 * _1671;
    float _1691 = _1549 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1693 = _1557 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1695 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1357);
    float _1697 = _1685 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1699 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1701 = _1693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1703 = -_1261;
    float _1705 = _1703 + 1.0;
    float _1707 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1591 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1711 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1713 = _1655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = fma(_1599, _566, _1657);
    float _1717 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1719 = _1615 * _664;
    float _1721 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1695);
    out.m_82.x = _1707;
    out.m_82.y = _1711;
    out.m_82.z = _1713;
    bool _1723 = _1523 <= 8000.0;
    bool _1725 = isnan(_1523);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan(8000.0);
    bool _1731 = _1727 || _1729;
    float _1733 = float(_1731);
    float _1735 = fma(_1599, _556, _1719);
    float _1737 = _1721 + _1112;
    out.m_84.x = _1699;
    out.m_84.y = _1701;
    out.m_84.z = _1717;
    out.m_84.w = _1677;
    float _1739 = _1737 * 0.5;
    float _1741 = in.m_74.x;
    bool _1743 = _872 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1745 = isnan(_872);
    bool _1747 = _1743 || _1745;
    bool _1749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1751 = _1747 || _1749;
    float _1753 = -_1689;
    float _1755 = _1753 + 1.0;
    out.gl_Position.x = _1136;
    out.gl_Position.y = _1138;
    out.gl_Position.z = _1721;
    out.gl_Position.w = _1112;
    int _1757 = as_type<int>(_1713);
    float _1759 = _1721;
    if (!_864)
    {
        float _1761 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _1757 = as_type<int>(_1761);
    }
    int _1763 = _1757;
    float _1765 = fma(_1755, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1689);
    out.m_86.z = _1739;
    out.m_86.w = _1112;
    float _1767 = _1697 * _836;
    float _1769 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1771 = _1733 * _1765;
    float _1773 = fma(_1637, _558, _1687);
    float _1775 = fma(_1637, _562, _1735);
    float _1777 = fma(_1637, _668, _1715);
    float _1779 = _1771 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_88.x = _758;
    out.m_88.y = _756;
    out.m_88.z = _760;
    float _1781 = _1767;
    float _1783 = 0.0;
    if (!_864)
    {
        _1781 = 0.0;
    }
    float _1785 = _1781;
    out.m_90.x = _1773;
    out.m_90.y = _1775;
    out.m_90.z = _1777;
    if (!_1751)
    {
        _1164 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1787 = _1164;
    float _1789 = _1787;
    float _1791 = _1787;
    if (!_1751)
    {
        _1759 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1793 = _1759;
    float _1795 = _1793;
    float _1797 = _1793;
    if (!_864)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4923 = as_type<float>(_1763);
        out.gl_Position.z = _4923;
    }
    if (!_1751)
    {
        _1783 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1799 = _1783;
    float _1801 = -_1200;
    float _1803 = _1801 + 1.0;
    float _1805 = _1769 * _1204;
    float _1807 = -_1769;
    float _1809 = _1807 + 1.0;
    float _1811 = _1803 * _1779;
    float _1813 = precise::clamp(_1811, 0.0, 1.0);
    float _1815 = _1215 * _1805;
    float _1817 = _1225 * _1805;
    float _1819 = _1215 * _1809;
    float _1821 = -_1813;
    float _1823 = fma(_1821, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1825 = fma(_1221, _1815, _1209);
    float _1827 = fma(_1223, _1815, _1211);
    float _1829 = fma(_1215, _1817, _1213);
    float _1831 = _1823 * _1741;
    float _1833 = _1815;
    float _1835 = _1805;
    float _1837 = _1799;
    float _1839 = _1799;
    if (!_1751)
    {
        _1833 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1841 = _1833;
    float _1843 = _1841;
    float _1845 = _1841;
    if (!_1751)
    {
        _1835 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1847 = _1835;
    out.m_92.x = _1825;
    out.m_92.y = _1827;
    out.m_92.z = _1829;
    out.m_92.w = _1819;
    float _1849 = _1831 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_94.x = _1849;
    float _1851 = _1849;
    float _1853 = _1847;
    float _1855 = _1847;
    if (!_1751)
    {
        _1851 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1857 = _1851;
    bool _1859 = !_1751;
    float _1861 = _1857;
    float _1863 = _1857;
    if (!_1859)
    {
        bool _1865 = _872 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1867 = isnan(_872);
        bool _1869 = _1865 || _1867;
        bool _1871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1873 = _1869 || _1871;
        if (!_1873)
        {
            float _1875 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1877 = _872 + _1875;
            float _1879 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1881 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1879;
            float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1887 = 1.0 / _1881;
            float _1889 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1891 = _1889 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1895 = _1893 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1899 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1905 = _1877 * _1887;
            float _1907 = precise::clamp(_1905, 0.0, 1.0);
            float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1913 = fma(_1907, _1885, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1915 = fma(_1907, _1911, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1917 = fma(_1907, _1891, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1919 = fma(_1907, _1895, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1921 = fma(_1907, _1899, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1923 = fma(_1907, _1903, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1791 = _1917;
            _1855 = _1921;
            _1839 = _1913;
            _1845 = _1919;
            _1797 = _1915;
            _1863 = _1923;
            _1925 = true;
        }
        else
        {
            bool _1927 = _872 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1929 = isnan(_872);
            bool _1931 = _1927 || _1929;
            bool _1933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1935 = _1931 || _1933;
            if (!_1935)
            {
                _1837 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1937 = _1837;
            _1839 = _1937;
            if (!_1935)
            {
                _1789 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1939 = _1789;
            _1791 = _1939;
            if (!_1935)
            {
                _1795 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1941 = _1795;
            _1797 = _1941;
            if (!_1935)
            {
                _1843 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1943 = _1843;
            _1845 = _1943;
            if (!_1935)
            {
                _1853 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1945 = _1853;
            _1855 = _1945;
            if (!_1935)
            {
                _1861 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1947 = _1861;
            bool _1949 = !_1935;
            _1863 = _1947;
            if (!_1949)
            {
                bool _1951 = _872 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1953 = isnan(_872);
                bool _1955 = _1951 || _1953;
                bool _1957 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1959 = _1955 || _1957;
                if (!_1959)
                {
                    float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1963 = _872 + _1961;
                    float _1965 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1967 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1965;
                    float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1971 = _1969 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1973 = 1.0 / _1967;
                    float _1975 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1977 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1981 = _1979 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1991 = _1963 * _1973;
                    float _1993 = precise::clamp(_1991, 0.0, 1.0);
                    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1999 = fma(_1993, _1971, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2001 = fma(_1993, _1997, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2003 = fma(_1993, _1977, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2005 = fma(_1993, _1981, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2007 = fma(_1993, _1985, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2009 = fma(_1993, _1989, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1791 = _2003;
                    _1855 = _2007;
                    _1839 = _1999;
                    _1845 = _2005;
                    _1797 = _2001;
                    _1863 = _2009;
                    _1925 = true;
                }
                else
                {
                    _1791 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1855 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1839 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1845 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1797 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1863 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1925 = false;
    float _2011 = _1791;
    float _2013 = _1855;
    float _2015 = _1839;
    float _2017 = _1845;
    float _2019 = _1797;
    float _2021 = _1863;
    float _2023 = fma(_1775, -0.5, 0.5);
    float _2025 = precise::clamp(_2023, 0.0, 1.0);
    float _2027 = -_2011;
    float _2029 = _2027 + _2013;
    float _2031 = -_2015;
    float _2033 = _2031 + _2017;
    float _2035 = -_2019;
    float _2037 = _2035 + _2021;
    bool _2039 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2041 = fma(_2025, _2029, _2011);
    float _2043 = fma(_2025, _2033, _2015);
    float _2045 = fma(_2025, _2037, _2019);
    float _2047 = _1785 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2049 = _2041 * 0.586610972881317138671875;
    out.m_96.x = 0.0;
    float _2051 = fma(_2043, 0.298911988735198974609375, _2049);
    out.m_94.w = _2047;
    float _2053 = fma(_2045, 0.114477999508380889892578125, _2051);
    out.m_56.x = 1.0;
    float _2055 = -_2053;
    float _2057 = _2043 + _2055;
    float _2059 = -_2053;
    float _2061 = _2041 + _2059;
    float _2063 = -_2053;
    float _2065 = _2045 + _2063;
    float _2067 = fma(_2057, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2053);
    float _2069 = fma(_2061, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2053);
    float _2071 = fma(_2065, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2053);
    out.m_98.x = 0.0;
    out.m_100.x = _2067;
    out.m_100.y = _2069;
    out.m_100.z = _2071;
    if (!_2039)
    {
        return out;
    }
    float _2073 = -_756;
    float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2077 = -_758;
    float _2079 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2081 = -_760;
    float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2085 = _2075 * _2075;
    float _2087 = fma(_2079, _2079, _2085);
    float _2089 = fma(_2083, _2083, _2087);
    float _2091 = rsqrt(_2089);
    float _2093 = _2075 * _2091;
    float _2095 = _2079 * _2091;
    float _2097 = _2083 * _2091;
    float _2099 = sqrt(_2089);
    float _2101 = -_878;
    float _2103 = _2101 + _2093;
    float _2105 = -_874;
    float _2107 = _2105 + _2095;
    float _2109 = -_876;
    float _2111 = _2109 + _2097;
    float _2113 = _2103 * _2103;
    float _2115 = fma(_2107, _2107, _2113);
    float _2117 = fma(_2111, _2111, _2115);
    float _2119 = -_2099;
    float _2121 = _2119 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2123 = rsqrt(_2117);
    float _2125 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2127 = precise::clamp(_2125, 0.0, 1.0);
    float _2129 = abs(_2127);
    float _2131 = log2(_2129);
    float _2133 = _2103 * _2123;
    float _2135 = _2107 * _2123;
    float _2137 = _2111 * _2123;
    float _2139 = _1775 * _2133;
    float _2141 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2143 = precise::clamp(_2141, 0.0, 1.0);
    float _2145 = _1775 * _2093;
    float _2147 = fma(_1773, _2135, _2139);
    float _2149 = _2143 * _2143;
    float _2151 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2153 = fma(_1773, _2095, _2145);
    float _2155 = fma(_1777, _2137, _2147);
    float _2157 = precise::clamp(_2155, 0.0, 1.0);
    float _2159 = _2149 + (-1.0);
    float _2161 = fma(_1777, _2097, _2153);
    float _2163 = precise::clamp(_2161, 0.0, 1.0);
    float _2165 = _2157 * _2157;
    float _2167 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2169 = exp2(_2151);
    float _2171 = fma(_2165, _2159, 1.0);
    float _2173 = -_2093;
    float _2175 = -_2167;
    float _2177 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2175);
    float _2179 = _2171 * _2171;
    float _2181 = -_2097;
    float _2183 = fma(_2181, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2177);
    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2187 = _2183 + _2185;
    float _2189 = 1.0 / _2179;
    float _2191 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2193 = precise::clamp(_2191, 0.0, 1.0);
    float _2195 = _2169 * _2193;
    float _2197 = _2163 * _2195;
    float _2199 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2201 = _2149 * _2189;
    float _2203 = _2197 * _2201;
    float _2205 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2207 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2209 = _2203 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2211 = _2203 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2213 = _2203 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _2199;
    out.m_96.y = _2205;
    out.m_96.z = _2207;
    out.m_98.x = _2209;
    out.m_98.y = _2211;
    out.m_98.z = _2213;
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
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1925 = false;
    bool _363 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_53.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_56.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2270 = as_type<float>(_135);
        out.gl_Position.z = _2270;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_58.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_149)
    {
        float _155 = float(_119);
        _129 = _155;
    }
    float _157 = _129;
    bool _159 = _153 >= _157;
    bool _161 = !_149;
    bool _163 = _159 || _161;
    float _165 = _157;
    if (_163)
    {
        _165 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _167 = _165;
    if (_163)
    {
        out.m_56.x = 0.0;
    }
    if (_163)
    {
        float _169 = _167 * 5.0;
        _137 = as_type<int>(_169);
    }
    int _171 = _137;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2339 = as_type<float>(_171);
        out.gl_Position.z = _2339;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _173 = in.m_60.x;
    float _175 = in.m_60.y;
    float _177 = in.m_60.z;
    float _179 = in.m_62.x;
    float _181 = in.m_62.y;
    float _183 = in.m_62.z;
    float _185 = in.m_64.x;
    float _187 = in.m_64.y;
    float _189 = in.m_64.z;
    float _191 = in.m_66.x;
    float _193 = _173 * _173;
    float _195 = _175 * _175;
    float _197 = _177 * _177;
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = fma(_187, _187, _201);
    float _209 = fma(_189, _189, _203);
    float _211 = sqrt(_205);
    float _213 = sqrt(_207);
    float _215 = sqrt(_209);
    bool _217 = _211 > 0.0;
    bool _219 = _213 > 0.0;
    float _221 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _223 = _205;
    if (_217)
    {
        float _225 = rsqrt(_205);
        _223 = _225;
    }
    float _227 = _223;
    float _229 = _221 * _191;
    bool _231 = _215 > 0.0;
    float _233 = 0.0;
    if (!_217)
    {
        _233 = 0.0;
    }
    float _235 = _233;
    float _237 = 0.0;
    float _239 = _235;
    if (!_217)
    {
        _237 = 0.0;
    }
    float _241 = _237;
    float _243 = 0.0;
    float _245 = _241;
    if (!_217)
    {
        _243 = 0.0;
    }
    float _247 = _243;
    float _249 = _215;
    float _251 = _247;
    if (_219)
    {
        float _253 = rsqrt(_207);
        _249 = _253;
    }
    float _255 = _249;
    float _257 = 0.0;
    if (!_219)
    {
        _257 = 0.0;
    }
    float _259 = _257;
    float _261 = 0.0;
    float _263 = _259;
    if (!_219)
    {
        _261 = 0.0;
    }
    float _265 = _261;
    float _267 = 0.0;
    float _269 = _265;
    if (!_219)
    {
        _267 = 0.0;
    }
    float _271 = _267;
    float _273 = _271;
    if (_217)
    {
        float _275 = _227 * _179;
        _239 = _275;
    }
    float _277 = _239;
    float _279 = _211;
    if (_231)
    {
        float _281 = rsqrt(_209);
        _279 = _281;
    }
    float _283 = _279;
    if (_217)
    {
        float _285 = _227 * _173;
        _245 = _285;
    }
    float _287 = _245;
    if (_217)
    {
        float _289 = _227 * _185;
        _251 = _289;
    }
    float _291 = _251;
    bool _293 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _295 = 0.0;
    if (!_231)
    {
        _295 = 0.0;
    }
    float _297 = _295;
    float _299 = 0.0;
    float _301 = _297;
    if (!_231)
    {
        _299 = 0.0;
    }
    float _303 = _299;
    float _305 = trunc(_229);
    int _307 = int(_305);
    float _309 = 0.0;
    float _311 = _303;
    if (!_231)
    {
        _309 = 0.0;
    }
    float _313 = _309;
    float _315 = _313;
    if (_219)
    {
        float _317 = _255 * _181;
        _263 = _317;
    }
    float _319 = _263;
    if (_219)
    {
        float _321 = _255 * _175;
        _269 = _321;
    }
    float _323 = _269;
    if (_219)
    {
        float _325 = _255 * _187;
        _273 = _325;
    }
    float _327 = _273;
    if (_231)
    {
        float _329 = _283 * _183;
        _301 = _329;
    }
    float _331 = _301;
    if (_231)
    {
        float _333 = _283 * _177;
        _311 = _333;
    }
    float _335 = _311;
    if (_231)
    {
        float _337 = _283 * _189;
        _315 = _337;
    }
    float _339 = _315;
    int _341 = _307 << 4;
    int _343 = _341 + 1712;
    bool _345 = !_293;
    float _361;
    if (!_345)
    {
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _349 = _191 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        float _365 = float(_119);
        float _367 = 1.0 / _365;
        float _369 = _153 * _367;
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
    float _426 = _187 * _377;
    float _428 = _383 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _430 = _381 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _432 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _387);
    float _434 = fma(_185, _375, _426);
    float _436 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _389);
    float _438 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _440 = _430 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _442 = _385 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _444 = _181 * _377;
    float _446 = _438 * _436;
    float _448 = _440 * _432;
    float _450 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _391);
    float _452 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _454 = _446 * _327;
    float _456 = fma(_179, _375, _444);
    float _458 = _446 * _319;
    float _460 = fma(_189, _379, _434);
    float _462 = _452 * _450;
    float _464 = fma(_448, _291, _454);
    float _466 = fma(_183, _379, _456);
    float _468 = fma(_448, _277, _458);
    float _470 = _460 + _393;
    float _472 = fma(_462, _339, _464);
    float _474 = _466 + _395;
    float _476 = fma(_462, _331, _468);
    float _478 = in.m_60.w;
    float _480 = _470 + _472;
    float _482 = _175 * _377;
    float _484 = _474 + _476;
    float _486 = _446 * _323;
    float _488 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _490 = _480 + _488;
    float _492 = fma(_173, _375, _482);
    float _494 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _496 = _484 + _494;
    float _498 = fma(_448, _287, _486);
    float _500 = _490 * _490;
    float _502 = fma(_177, _379, _492);
    float _504 = fma(_462, _335, _498);
    float _506 = fma(_496, _496, _500);
    bool _508 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _510 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _512 = _508 || _510;
    bool _514 = isnan(0.5);
    bool _516 = _512 || _514;
    float _518 = sqrt(_506);
    bool _520 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _522 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _524 = _520 || _522;
    bool _526 = isnan(0.5);
    bool _528 = _524 || _526;
    float _530 = _502 + _478;
    float _532 = _530 + _504;
    bool _534 = _518 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _536 = _424 * 2.0;
    float _538 = _406 * 2.0;
    float _540 = _412 * 2.0;
    float _542 = _406 * _406;
    float _544 = _418 * _536;
    float _546 = _412 * _536;
    float _548 = _406 * _536;
    float _550 = _412 * _412;
    float _552 = -_544;
    float _554 = fma(_412, _538, _552);
    float _556 = fma(_412, _538, _544);
    float _558 = fma(_418, _538, _546);
    float _560 = -_548;
    float _562 = fma(_418, _540, _560);
    float _564 = -_546;
    float _566 = fma(_418, _538, _564);
    float _568 = fma(_418, _540, _548);
    float _570 = _418 * _418;
    float _572 = _418;
    float _574 = _406;
    float _576 = _412;
    float _578 = _456;
    if (!_534)
    {
        _572 = _484;
    }
    float _580 = _572;
    float _582 = _580;
    if (!_534)
    {
        _574 = _480;
    }
    float _584 = _574;
    float _586 = _584;
    if (!_534)
    {
        _576 = _532;
    }
    float _588 = _576;
    bool _590 = !_534;
    float _592 = _588;
    if (!_590)
    {
        float _594 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _596 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _598 = _518 + _596;
        float _600 = _532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _602 = rsqrt(_506);
        float _604 = _598 * _594;
        float _606 = _604 * 0.15915493667125701904296875;
        float _608 = _606 * 6.283185482025146484375;
        float _610 = cos(_608);
        float _612 = _606 * 6.283185482025146484375;
        float _614 = sin(_612);
        float _616 = _610 + (-1.0);
        float _618 = _616 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _620 = fma(_614, _600, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _622 = fma(_532, _610, _618);
        float _624 = _602 * _620;
        float _626 = fma(_496, _624, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _628 = fma(_490, _624, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _592 = _622;
        _582 = _626;
        _586 = _628;
    }
    float _630 = _592;
    float _632 = _582;
    float _634 = _586;
    float _636 = -_530;
    float _638 = _636 + _630;
    float _640 = -_474;
    float _642 = _640 + _632;
    float _644 = fma(_542, -2.0, 1.0);
    float _646 = fma(_550, -2.0, 1.0);
    float _648 = _638 * _323;
    float _650 = -_470;
    float _652 = _650 + _634;
    float _654 = _638 * _287;
    float _656 = _638 * _335;
    float _658 = fma(_642, _319, _648);
    float _660 = fma(_570, -2.0, _646);
    float _662 = fma(_642, _277, _654);
    float _664 = fma(_570, -2.0, _644);
    float _666 = fma(_652, _327, _658);
    float _668 = fma(_550, -2.0, _644);
    float _670 = fma(_642, _331, _656);
    float _672 = fma(_652, _291, _662);
    float _674 = _666 * _554;
    float _676 = _666 * _664;
    float _678 = _666 * _568;
    float _680 = fma(_652, _339, _670);
    float _682 = fma(_672, _660, _674);
    float _684 = fma(_672, _556, _676);
    float _686 = fma(_672, _566, _678);
    float _688 = _662;
    if (_528)
    {
        _578 = 1.0;
    }
    float _690 = _578;
    float _692 = fma(_680, _558, _682);
    float _694 = fma(_680, _562, _684);
    float _696 = fma(_680, _668, _686);
    float _698 = _474 + _692;
    float _700 = _530 + _694;
    float _702 = _470 + _696;
    float _704 = _700;
    float _706 = _698;
    float _708 = _702;
    float _710 = _690;
    float _712 = _694;
    float _714 = _692;
    if (!_516)
    {
        float _716 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _718 = _530 + _716;
        float _720 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _722 = _474 + _720;
        float _724 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _726 = _718 * _718;
        float _728 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _730 = _470 + _728;
        float _732 = fma(_722, _722, _726);
        float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _736 = fma(_730, _730, _732);
        float _738 = sqrt(_736);
        float _740 = _724 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _742 = precise::min(_738, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _744 = _742 * _734;
        float _746 = _740 * _744;
        float _748 = fma(_692, _746, _474);
        float _750 = fma(_694, _746, _530);
        float _752 = fma(_696, _746, _470);
        _688 = _734;
        _704 = _750;
        _706 = _748;
        _708 = _752;
    }
    float _754 = _688;
    float _756 = _704;
    float _758 = _706;
    float _760 = _708;
    float _762 = _754;
    if (!_528)
    {
        float _764 = in.m_74.w;
        int _766 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _768 = _766 == 4;
        bool _770 = _766 == 8;
        bool _772 = _766 == 12;
        int _774 = as_type<int>(_764) << 16;
        int _776 = as_type<int>(_764) << 8;
        int _778 = as_type<int>(_764) << 24;
        int _780 = _774 >> 24;
        int _782 = _776 >> 24;
        int _784 = as_type<int>(_764) >> 24;
        int _786 = _778 >> 24;
        float _788 = float(_780);
        float _790 = float(_782);
        float _792 = float(_784);
        float _794 = _788 * 0.0078740157186985015869140625;
        float _796 = float(_786);
        float _798 = _790 * 0.0078740157186985015869140625;
        float _800 = _792 * 0.0078740157186985015869140625;
        float _802 = precise::min(_794, 1.0);
        float _804 = _796 * 0.0078740157186985015869140625;
        float _806 = precise::min(_798, 1.0);
        float _808 = precise::min(_800, 1.0);
        float _810 = precise::min(_804, 1.0);
        float _812 = precise::max(_802, -1.0);
        float _814 = precise::max(_806, -1.0);
        float _816 = precise::max(_808, -1.0);
        float _818 = precise::max(_810, -1.0);
        float _820 = _818;
        _712 = _814;
        _762 = _816;
        if (_768)
        {
            _820 = _812;
        }
        float _822 = _820;
        float _824 = _822;
        if (_770)
        {
            _824 = _814;
        }
        float _826 = _824;
        float _828 = _826;
        if (_772)
        {
            _828 = _816;
        }
        float _830 = _828;
        float _832 = abs(_830);
        float _834 = (-0.0) + _832;
        _710 = _834;
    }
    float _836 = _710;
    float _838 = _712;
    float _840 = _762;
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _844 = _756 + _842;
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _848 = _758 + _846;
    float _850 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _852 = _760 + _850;
    float _854 = _844 * _844;
    bool _856 = _836 != 0.0;
    bool _858 = isnan(_836);
    bool _860 = _856 || _858;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    float _866 = fma(_848, _848, _854);
    float _868 = fma(_852, _852, _866);
    float _870 = rsqrt(_868);
    float _872 = sqrt(_868);
    float _874 = _848 * _870;
    float _876 = _852 * _870;
    float _878 = _844 * _870;
    float _880 = _874 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _882 = _876 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _884 = _880 * _880;
    float _886 = _882 * _882;
    float _888 = _884 + _886;
    float _890 = sqrt(_888);
    bool _892 = _890 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _894 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _896 = _890 + _894;
    float _898 = _838;
    float _900 = _888;
    float _902 = _896;
    float _904 = _870;
    if (_892)
    {
        float _906 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _898 = _906;
    }
    float _908 = _898;
    if (_892)
    {
        float _910 = rsqrt(_888);
        _900 = _910;
    }
    float _912 = _900;
    if (_892)
    {
        float _914 = _896 * _908;
        _902 = _914;
    }
    float _916 = _902;
    if (_892)
    {
        float _918 = _916 * 0.15915493667125701904296875;
        _714 = _918;
    }
    float _920 = _714;
    float _922 = _908;
    float _924 = _920;
    if (_892)
    {
        float _926 = _920 * 6.283185482025146484375;
        float _928 = cos(_926);
        _922 = _928;
    }
    float _930 = _922;
    float _932 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _934 = precise::max(0.0, _932);
    float _936 = _840;
    float _938 = _934;
    if (_892)
    {
        float _940 = _920 * 6.283185482025146484375;
        float _942 = sin(_940);
        _936 = _942;
    }
    float _944 = _936;
    float _946 = -_878;
    float _948 = -_934;
    float _950 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[24].y, _948);
    float _952 = _950;
    if (_892)
    {
        float _954 = _950 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _904 = _954;
    }
    float _956 = _904;
    float _958 = _956;
    if (_892)
    {
        float _960 = _930 + (-1.0);
        _938 = _960;
    }
    float _962 = _938;
    float _964 = _962;
    if (!_892)
    {
        _924 = _884;
    }
    float _966 = _924;
    float _968 = _756 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _970 = _966;
    if (_892)
    {
        float _972 = _962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _964 = _972;
    }
    float _974 = _964;
    float _976 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[3].x, _968);
    float _978 = _944;
    float _980 = _974;
    if (_892)
    {
        float _982 = fma(_944, _956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _978 = _982;
    }
    float _984 = _978;
    if (_892)
    {
        float _986 = fma(_950, _930, _974);
        _952 = _986;
    }
    float _988 = _952;
    float _990 = _756 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _992 = _990;
    if (!_892)
    {
        _958 = _880;
    }
    float _994 = _958;
    float _996 = 0.0;
    float _998 = _994;
    if (_892)
    {
        float _1000 = _912 * _984;
        _996 = _1000;
    }
    float _1002 = _996;
    if (!_892)
    {
        _980 = _882;
    }
    float _1004 = _980;
    float _1006 = fma(_474, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1008 = _1004;
    float _1010 = _1006;
    if (_892)
    {
        float _1012 = _880 * _1002;
        _998 = _1012;
    }
    float _1014 = _998;
    float _1016 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[2].x, _990);
    if (_892)
    {
        float _1018 = _882 * _1002;
        _1008 = _1018;
    }
    float _1020 = _1008;
    if (!_892)
    {
        _992 = _886;
    }
    float _1022 = _992;
    float _1024 = _1022;
    if (_892)
    {
        float _1026 = _1014 * _1014;
        _970 = _1026;
    }
    float _1028 = _970;
    float _1030 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1016);
    if (_892)
    {
        float _1032 = _1020 * _1020;
        _1024 = _1032;
    }
    float _1034 = _1024;
    float _1036 = fma(_988, _988, _1028);
    float _1038 = _1030 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1040 = _756 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1042 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[3].z, _976);
    float _1044 = _1036 + _1034;
    float _1046 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1048 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1050 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1040);
    float _1052 = rsqrt(_1044);
    float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1056 = fma(_872, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1054);
    float _1058 = precise::clamp(_1056, 0.0, 1.0);
    float _1060 = -_1048;
    float _1062 = fma(_1060, _1046, 1.0);
    float _1064 = _756 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1066 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1050);
    float _1068 = -_1058;
    float _1070 = _1068 + 1.0;
    float _1072 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1074 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1064);
    float _1076 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1078 = floor(_1006);
    float _1080 = fma(_470, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1082 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1074);
    float _1084 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1086 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1088 = _1052 * _1014;
    float _1090 = abs(_1070);
    float _1092 = log2(_1090);
    float _1094 = _1052 * _988;
    float _1096 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1084);
    float _1098 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1100 = _1052 * _1020;
    float _1102 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1096);
    float _1104 = -_1098;
    float _1106 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1104);
    float _1108 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1110 = floor(_1080);
    float _1112 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1102);
    float _1114 = -_1100;
    float _1116 = fma(_1114, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1106);
    float _1118 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1120 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1108);
    float _1122 = fma(_1116, -0.5, 0.5);
    float _1124 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1118);
    float _1126 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1128 = 1.0 / _1112;
    float _1130 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1120);
    float _1132 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1124);
    float _1134 = fma(_1116, 0.5, 0.5);
    float _1136 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1132);
    float _1138 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1130);
    float _1140 = log2(_1062);
    float _1142 = fma(_1134, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1144 = -_1110;
    float _1146 = _1080 + _1144;
    float _1148 = _1094 + 1.0;
    float _1150 = fma(_1134, _1142, -0.212114393711090087890625);
    float _1152 = sqrt(_1122);
    float _1154 = fma(_1134, _1150, 1.570728778839111328125);
    float _1156 = exp2(_1126);
    float _1158 = -_1078;
    float _1160 = _1006 + _1158;
    float _1162 = _1078;
    float _1164 = _1112;
    if (_864)
    {
        _1162 = _1136;
    }
    float _1166 = _1162;
    float _1168 = _1140 * 0.693147182464599609375;
    float _1170 = _1166;
    if (_864)
    {
        _1010 = _1138;
    }
    float _1172 = _1010;
    float _1174 = _1172;
    if (!_864)
    {
        _1170 = 0.0;
        _1174 = 0.0;
    }
    float _1176 = _1170;
    float _1178 = _1174;
    float _1180 = _1168 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1182 = _1152 * 0.636619746685028076171875;
    float _1184 = _1128 * _1176;
    float _1186 = _1128 * _1178;
    float _1188 = -_1154;
    float _1190 = fma(_1182, _1188, 1.0);
    float _1192 = fma(_1184, 0.5, 0.5);
    float _1194 = -_1094;
    float _1196 = fma(_1156, _1148, _1194);
    float _1198 = fma(_1186, -0.5, 0.5);
    float2 _3907 = float2(_1160, _1146);
    float _1200 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3907, float2(0.0), isnan(_3907)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3907, float2(0.0), isnan(_3907)), level(0.0)).x;
    float _1202 = fma(_1196, 0.5, 0.5);
    float3 _3920 = float3(_1192, _1198, _1180);
    float _1204 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3920, float3(0.0), isnan(_3920)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3920, float3(0.0), isnan(_3920)), level(0.0)).x;
    float3 _3931 = float3(_1192, _1198, _1180);
    float4 _1207 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3931, float3(0.0), isnan(_3931)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3931, float3(0.0), isnan(_3931)), level(0.0)).xyzw;
    float _1209 = _1207.x;
    float _1211 = _1207.y;
    float _1213 = _1207.z;
    float _1215 = _1207.w;
    float2 _3947 = float2(_1190, _1202);
    float3 _1219 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3947, float2(0.0), isnan(_3947)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3947, float2(0.0), isnan(_3947)), level(0.0)).xyz;
    float _1221 = _1219.x;
    float _1223 = _1219.y;
    float _1225 = _1219.z;
    float _1227 = in.m_76.y;
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1231 = _371 + _1229;
    float _1233 = in.m_66.y;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1237 = _1235 != 0;
    float _1239 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1243 = _1241 != 0;
    float _1245 = _530 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1249 = _1247 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1251 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1253 = in.m_76.x;
    float _1255 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1245);
    bool _1257 = _191 > 0.5;
    bool _1259 = _1257 && _1243;
    float _1261 = exp2(_1239);
    float _1263 = _1251 * _191;
    float _1265 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1255);
    float _1267 = _530 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1269 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1271 = _1265 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1273 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1267);
    float _1275 = 1.0 / _1249;
    float _1277 = -_1227;
    float _1279 = _1277 + 1.0;
    float _1281 = fma(_470, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1273);
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1285 = _1283 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1289 = _1287 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1291 = _1233 > 0.5;
    float _1293 = trunc(_1263);
    int _1295 = int(_1293);
    float _1297 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1299 = _1227;
    if (_1237)
    {
        float _1301 = _1291 ? _1279 : _1227;
        _1299 = _1301;
    }
    float _1303 = _1299;
    float _1305 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    bool _1307 = _389 != 0.0;
    bool _1309 = isnan(_389);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan(0.0);
    bool _1315 = _1311 || _1313;
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1317;
    float _1321 = _1297 + _1271;
    float _1323 = 1.0 / _1271;
    float _1325 = _1319 * _1275;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1329 = _371 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1335 = _387 == 0.0;
    bool _1337 = !_1315;
    bool _1339 = _1335 && _1337;
    float _1341 = fma(_1325, _1329, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1343 = _1295 << 4;
    int _1345 = _1343 + 1968;
    float _1347 = 1.0 / _1285;
    float _1349 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1351 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1349);
    float _1353 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1355 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1353);
    float _1357 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1269);
    bool _1359 = _391 == 0.0;
    bool _1361 = _1359 && _1339;
    float _1363 = _1321 * _1323;
    float _1365 = _1363 * 0.5;
    float _1367 = 1.0 / _1289;
    float _1369 = in.m_78.x;
    float _1371 = in.m_78.y;
    float _1373 = in.m_78.z;
    bool _1375 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1377 = isnan(_371);
    bool _1379 = _1375 || _1377;
    bool _1381 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1383 = _1379 || _1381;
    float _1385 = float(_1383);
    float _1387 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1389 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1387);
    bool _1391 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1393 = isnan(_371);
    bool _1395 = _1391 || _1393;
    bool _1397 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1399 = _1395 || _1397;
    float _1401 = float(_1399);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1405 = _371 + _1403;
    bool _1407 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1409 = isnan(_371);
    bool _1411 = _1407 || _1409;
    bool _1413 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1415 = _1411 || _1413;
    float _1417 = float(_1415);
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1419;
    bool _1423 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1425 = isnan(_371);
    bool _1427 = _1423 || _1425;
    bool _1429 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1431 = _1427 || _1429;
    float _1433 = float(_1431);
    float _1435 = _1333 * _1347;
    float _1437 = 1.0 / _1389;
    uint _1439 = uint(int(uint(_1345) >> uint(2)));
    uint _1441 = uint(int(uint(int(_1439)) >> uint(2)));
    int _1443 = int(_1439) & 3;
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[int(_1441)][_1443];
    int _1447 = int(_1439) + 1;
    uint _1449 = uint(int(uint(_1447) >> uint(2)));
    int _1451 = _1447 & 3;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[int(_1449)][_1451];
    float _1455 = 0.0;
    float _1457 = _1253;
    float _1459 = _1355;
    if (_1243)
    {
        _1455 = _1253;
    }
    float _1461 = _1455;
    float _1463 = -_1433;
    float _1465 = _1463 + 1.0;
    float _1467 = fma(_1435, _1231, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1469 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1351);
    float _1471 = _1421 * _1367;
    float _1473 = -_1417;
    float _1475 = _1473 + 1.0;
    float _1477 = _1461;
    if (_1259)
    {
        float _1479 = -_1461;
        float _1481 = _1479 + 1.0;
        _1477 = _1481;
    }
    float _1483 = _1477;
    int _1485 = _1345 + 8;
    uint _1487 = uint(int(uint(_1485) >> uint(2)));
    uint _1489 = uint(int(uint(int(_1487)) >> uint(2)));
    int _1491 = int(_1487) & 3;
    float _1493 = (*spvDescriptorSet0.vp_c9)._m0[int(_1489)][_1491];
    float _1495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1497 = _1433 * _1475;
    float _1499 = _1401 * _1465;
    float _1501 = -_1401;
    float _1503 = _1501 + 1.0;
    if (_1243)
    {
        _1457 = _1483;
    }
    float _1505 = _1457;
    float _1507 = _1371;
    float _1509 = _1369;
    float _1511 = _1373;
    if (!_1361)
    {
        float _1513 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1371);
        _1507 = _1513;
    }
    float _1515 = _1507;
    if (!_1361)
    {
        float _1517 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1369);
        _1509 = _1517;
    }
    float _1519 = _1509;
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1523 = _1437 * _1521;
    if (!_1361)
    {
        float _1525 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1373);
        _1511 = _1525;
    }
    float _1527 = _1511;
    float _1529 = _319 * _1515;
    float _1531 = _323 * _1515;
    float _1533 = _327 * _1515;
    float _1535 = _474 + _1469;
    float _1537 = fma(_277, _1519, _1529);
    float _1539 = abs(_1523);
    float _1541 = log2(_1539);
    uint _1543 = uint(int(uint(_343) >> uint(2)));
    uint _1545 = uint(int(uint(int(_1543)) >> uint(2)));
    int _1547 = int(_1543) & 3;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[int(_1545)][_1547];
    int _1551 = int(_1543) + 1;
    uint _1553 = uint(int(uint(_1551) >> uint(2)));
    int _1555 = _1551 & 3;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[int(_1553)][_1555];
    bool _1559 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1561 = isnan(0.0);
    bool _1563 = _1559 || _1561;
    bool _1565 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1567 = _1563 || _1565;
    float _1569 = _1385 * _1503;
    float _1571 = -_1385;
    float _1573 = _1571 + 1.0;
    float _1575 = fma(_287, _1519, _1531);
    float _1577 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1355);
    float _1579 = _1341 * _1569;
    float _1581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1583 = _343 + 8;
    uint _1585 = uint(int(uint(_1583) >> uint(2)));
    uint _1587 = uint(int(uint(int(_1585)) >> uint(2)));
    int _1589 = int(_1585) & 3;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[int(_1587)][_1589];
    float _1593 = _470 + _1577;
    float _1595 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1597 = fma(_1573, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1579);
    float _1599 = fma(_331, _1527, _1537);
    float _1601 = -_1593;
    float _1603 = _1601 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    if (_1567)
    {
        float _1605 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1459 = _1605;
    }
    float _1607 = _1459;
    float _1609 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1611 = fma(_291, _1519, _1533);
    float _1613 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1615 = fma(_335, _1527, _1575);
    float _1617 = _1607;
    if (_1567)
    {
        float _1619 = precise::min(_1607, 20.0);
        _1617 = _1619;
    }
    float _1621 = _1617;
    float _1623 = exp2(_1609);
    float _1625 = _1613 * _1495;
    float _1627 = _1595 * _1581;
    float _1629 = _1445 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1631 = _1453 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1633 = -_1535;
    float _1635 = _1633 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1637 = fma(_339, _1527, _1611);
    float _1639 = fma(_1471, _1405, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1641 = _1445;
    if (_1567)
    {
        float _1643 = 1.0 / _1621;
        _1641 = _1643;
    }
    float _1645 = _1641;
    float _1647 = fma(_1467, _1499, _1597);
    float _1649 = precise::min(_1535, _1635);
    out.m_80.x = _1627;
    out.m_80.y = _1625;
    float _1651 = precise::min(_1593, _1603);
    float _1653 = fma(_1639, _1497, _1647);
    float _1655 = _1493 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1657 = _1615 * _568;
    float _1659 = fma(_1623, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1661 = precise::clamp(_1659, 0.0, 1.0);
    float _1663 = precise::min(_1649, _1651);
    float _1665 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1653);
    float _1667 = _1649;
    if (!_1567)
    {
        _1667 = 1.0;
    }
    float _1669 = _1667;
    float _1671 = fma(_1661, -2.0, 3.0);
    float _1673 = _1615 * _554;
    float _1675 = _1661 * _1661;
    float _1677 = _1665 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1679 = _1669;
    if (_1567)
    {
        float _1681 = _1663 * _1645;
        float _1683 = precise::clamp(_1681, 0.0, 1.0);
        _1679 = _1683;
    }
    float _1685 = _1679;
    float _1687 = fma(_1599, _660, _1673);
    float _1689 = _1675 * _1671;
    float _1691 = _1549 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1693 = _1557 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1695 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1357);
    float _1697 = _1685 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1699 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1701 = _1693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1703 = -_1261;
    float _1705 = _1703 + 1.0;
    float _1707 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1591 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1711 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1713 = _1655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = fma(_1599, _566, _1657);
    float _1717 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1719 = _1615 * _664;
    float _1721 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1695);
    out.m_82.x = _1707;
    out.m_82.y = _1711;
    out.m_82.z = _1713;
    bool _1723 = _1523 <= 8000.0;
    bool _1725 = isnan(_1523);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan(8000.0);
    bool _1731 = _1727 || _1729;
    float _1733 = float(_1731);
    float _1735 = fma(_1599, _556, _1719);
    float _1737 = _1721 + _1112;
    out.m_84.x = _1699;
    out.m_84.y = _1701;
    out.m_84.z = _1717;
    out.m_84.w = _1677;
    float _1739 = _1737 * 0.5;
    float _1741 = in.m_74.x;
    bool _1743 = _872 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1745 = isnan(_872);
    bool _1747 = _1743 || _1745;
    bool _1749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1751 = _1747 || _1749;
    float _1753 = -_1689;
    float _1755 = _1753 + 1.0;
    out.gl_Position.x = _1136;
    out.gl_Position.y = _1138;
    out.gl_Position.z = _1721;
    out.gl_Position.w = _1112;
    int _1757 = as_type<int>(_1713);
    float _1759 = _1721;
    if (!_864)
    {
        float _1761 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _1757 = as_type<int>(_1761);
    }
    int _1763 = _1757;
    float _1765 = fma(_1755, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1689);
    out.m_86.z = _1739;
    out.m_86.w = _1112;
    float _1767 = _1697 * _836;
    float _1769 = _1705 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1771 = _1733 * _1765;
    float _1773 = fma(_1637, _558, _1687);
    float _1775 = fma(_1637, _562, _1735);
    float _1777 = fma(_1637, _668, _1715);
    float _1779 = _1771 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_88.x = _758;
    out.m_88.y = _756;
    out.m_88.z = _760;
    float _1781 = _1767;
    float _1783 = 0.0;
    if (!_864)
    {
        _1781 = 0.0;
    }
    float _1785 = _1781;
    out.m_90.x = _1773;
    out.m_90.y = _1775;
    out.m_90.z = _1777;
    if (!_1751)
    {
        _1164 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1787 = _1164;
    float _1789 = _1787;
    float _1791 = _1787;
    if (!_1751)
    {
        _1759 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1793 = _1759;
    float _1795 = _1793;
    float _1797 = _1793;
    if (!_864)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4923 = as_type<float>(_1763);
        out.gl_Position.z = _4923;
    }
    if (!_1751)
    {
        _1783 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1799 = _1783;
    float _1801 = -_1200;
    float _1803 = _1801 + 1.0;
    float _1805 = _1769 * _1204;
    float _1807 = -_1769;
    float _1809 = _1807 + 1.0;
    float _1811 = _1803 * _1779;
    float _1813 = precise::clamp(_1811, 0.0, 1.0);
    float _1815 = _1215 * _1805;
    float _1817 = _1225 * _1805;
    float _1819 = _1215 * _1809;
    float _1821 = -_1813;
    float _1823 = fma(_1821, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1825 = fma(_1221, _1815, _1209);
    float _1827 = fma(_1223, _1815, _1211);
    float _1829 = fma(_1215, _1817, _1213);
    float _1831 = _1823 * _1741;
    float _1833 = _1815;
    float _1835 = _1805;
    float _1837 = _1799;
    float _1839 = _1799;
    if (!_1751)
    {
        _1833 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1841 = _1833;
    float _1843 = _1841;
    float _1845 = _1841;
    if (!_1751)
    {
        _1835 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1847 = _1835;
    out.m_92.x = _1825;
    out.m_92.y = _1827;
    out.m_92.z = _1829;
    out.m_92.w = _1819;
    float _1849 = _1831 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_94.x = _1849;
    float _1851 = _1849;
    float _1853 = _1847;
    float _1855 = _1847;
    if (!_1751)
    {
        _1851 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1857 = _1851;
    bool _1859 = !_1751;
    float _1861 = _1857;
    float _1863 = _1857;
    if (!_1859)
    {
        bool _1865 = _872 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1867 = isnan(_872);
        bool _1869 = _1865 || _1867;
        bool _1871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1873 = _1869 || _1871;
        if (!_1873)
        {
            float _1875 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1877 = _872 + _1875;
            float _1879 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1881 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1879;
            float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1887 = 1.0 / _1881;
            float _1889 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1891 = _1889 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1895 = _1893 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1899 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1905 = _1877 * _1887;
            float _1907 = precise::clamp(_1905, 0.0, 1.0);
            float _1909 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1911 = _1909 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1913 = fma(_1907, _1885, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1915 = fma(_1907, _1911, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1917 = fma(_1907, _1891, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1919 = fma(_1907, _1895, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1921 = fma(_1907, _1899, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1923 = fma(_1907, _1903, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1791 = _1917;
            _1855 = _1921;
            _1839 = _1913;
            _1845 = _1919;
            _1797 = _1915;
            _1863 = _1923;
            _1925 = true;
        }
        else
        {
            bool _1927 = _872 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1929 = isnan(_872);
            bool _1931 = _1927 || _1929;
            bool _1933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1935 = _1931 || _1933;
            if (!_1935)
            {
                _1837 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1937 = _1837;
            _1839 = _1937;
            if (!_1935)
            {
                _1789 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1939 = _1789;
            _1791 = _1939;
            if (!_1935)
            {
                _1795 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1941 = _1795;
            _1797 = _1941;
            if (!_1935)
            {
                _1843 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1943 = _1843;
            _1845 = _1943;
            if (!_1935)
            {
                _1853 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1945 = _1853;
            _1855 = _1945;
            if (!_1935)
            {
                _1861 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1947 = _1861;
            bool _1949 = !_1935;
            _1863 = _1947;
            if (!_1949)
            {
                bool _1951 = _872 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1953 = isnan(_872);
                bool _1955 = _1951 || _1953;
                bool _1957 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1959 = _1955 || _1957;
                if (!_1959)
                {
                    float _1961 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1963 = _872 + _1961;
                    float _1965 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1967 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1965;
                    float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1971 = _1969 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1973 = 1.0 / _1967;
                    float _1975 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1977 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1981 = _1979 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1989 = _1987 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1991 = _1963 * _1973;
                    float _1993 = precise::clamp(_1991, 0.0, 1.0);
                    float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1999 = fma(_1993, _1971, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2001 = fma(_1993, _1997, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2003 = fma(_1993, _1977, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2005 = fma(_1993, _1981, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2007 = fma(_1993, _1985, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2009 = fma(_1993, _1989, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1791 = _2003;
                    _1855 = _2007;
                    _1839 = _1999;
                    _1845 = _2005;
                    _1797 = _2001;
                    _1863 = _2009;
                    _1925 = true;
                }
                else
                {
                    _1791 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1855 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1839 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1845 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1797 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1863 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1925 = false;
    float _2011 = _1791;
    float _2013 = _1855;
    float _2015 = _1839;
    float _2017 = _1845;
    float _2019 = _1797;
    float _2021 = _1863;
    float _2023 = fma(_1775, -0.5, 0.5);
    float _2025 = precise::clamp(_2023, 0.0, 1.0);
    float _2027 = -_2011;
    float _2029 = _2027 + _2013;
    float _2031 = -_2015;
    float _2033 = _2031 + _2017;
    float _2035 = -_2019;
    float _2037 = _2035 + _2021;
    bool _2039 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2041 = fma(_2025, _2029, _2011);
    float _2043 = fma(_2025, _2033, _2015);
    float _2045 = fma(_2025, _2037, _2019);
    float _2047 = _1785 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2049 = _2041 * 0.586610972881317138671875;
    out.m_96.x = 0.0;
    float _2051 = fma(_2043, 0.298911988735198974609375, _2049);
    out.m_94.w = _2047;
    float _2053 = fma(_2045, 0.114477999508380889892578125, _2051);
    out.m_56.x = 1.0;
    float _2055 = -_2053;
    float _2057 = _2043 + _2055;
    float _2059 = -_2053;
    float _2061 = _2041 + _2059;
    float _2063 = -_2053;
    float _2065 = _2045 + _2063;
    float _2067 = fma(_2057, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2053);
    float _2069 = fma(_2061, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2053);
    float _2071 = fma(_2065, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2053);
    out.m_98.x = 0.0;
    out.m_100.x = _2067;
    out.m_100.y = _2069;
    out.m_100.z = _2071;
    if (!_2039)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2073 = -_756;
    float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2077 = -_758;
    float _2079 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2081 = -_760;
    float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2085 = _2075 * _2075;
    float _2087 = fma(_2079, _2079, _2085);
    float _2089 = fma(_2083, _2083, _2087);
    float _2091 = rsqrt(_2089);
    float _2093 = _2075 * _2091;
    float _2095 = _2079 * _2091;
    float _2097 = _2083 * _2091;
    float _2099 = sqrt(_2089);
    float _2101 = -_878;
    float _2103 = _2101 + _2093;
    float _2105 = -_874;
    float _2107 = _2105 + _2095;
    float _2109 = -_876;
    float _2111 = _2109 + _2097;
    float _2113 = _2103 * _2103;
    float _2115 = fma(_2107, _2107, _2113);
    float _2117 = fma(_2111, _2111, _2115);
    float _2119 = -_2099;
    float _2121 = _2119 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2123 = rsqrt(_2117);
    float _2125 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2127 = precise::clamp(_2125, 0.0, 1.0);
    float _2129 = abs(_2127);
    float _2131 = log2(_2129);
    float _2133 = _2103 * _2123;
    float _2135 = _2107 * _2123;
    float _2137 = _2111 * _2123;
    float _2139 = _1775 * _2133;
    float _2141 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2143 = precise::clamp(_2141, 0.0, 1.0);
    float _2145 = _1775 * _2093;
    float _2147 = fma(_1773, _2135, _2139);
    float _2149 = _2143 * _2143;
    float _2151 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2153 = fma(_1773, _2095, _2145);
    float _2155 = fma(_1777, _2137, _2147);
    float _2157 = precise::clamp(_2155, 0.0, 1.0);
    float _2159 = _2149 + (-1.0);
    float _2161 = fma(_1777, _2097, _2153);
    float _2163 = precise::clamp(_2161, 0.0, 1.0);
    float _2165 = _2157 * _2157;
    float _2167 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2169 = exp2(_2151);
    float _2171 = fma(_2165, _2159, 1.0);
    float _2173 = -_2093;
    float _2175 = -_2167;
    float _2177 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2175);
    float _2179 = _2171 * _2171;
    float _2181 = -_2097;
    float _2183 = fma(_2181, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2177);
    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2187 = _2183 + _2185;
    float _2189 = 1.0 / _2179;
    float _2191 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2193 = precise::clamp(_2191, 0.0, 1.0);
    float _2195 = _2169 * _2193;
    float _2197 = _2163 * _2195;
    float _2199 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2201 = _2149 * _2189;
    float _2203 = _2197 * _2201;
    float _2205 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2207 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2209 = _2203 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2211 = _2203 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2213 = _2203 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _2199;
    out.m_96.y = _2205;
    out.m_96.z = _2207;
    out.m_98.x = _2209;
    out.m_98.y = _2211;
    out.m_98.z = _2213;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

