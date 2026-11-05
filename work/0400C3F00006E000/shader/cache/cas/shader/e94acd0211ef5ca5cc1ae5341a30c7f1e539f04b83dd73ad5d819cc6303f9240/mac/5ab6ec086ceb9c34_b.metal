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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
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
    float4 m_82 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_100 [[user(locn3)]];
    float4 m_80 [[user(locn4)]];
    float4 m_86 [[user(locn5)]];
    float4 m_92 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_98 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 m_96 [[user(locn11)]];
    float4 m_102 [[user(locn12)]];
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
    float4 m_84 [[attribute(7)]];
    float4 m_72 [[attribute(8)]];
    float4 m_66 [[attribute(9)]];
    float4 m_70 [[attribute(10)]];
    float4 m_76 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1857 = false;
    bool _355 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_53.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_56.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2202 = as_type<float>(_137);
        out.gl_Position.z = _2202;
    }
    if (!_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_58.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = 0.0;
    if (_151)
    {
        float _159 = float(_121);
        _157 = _159;
    }
    float _161 = _157;
    bool _163 = _155 >= _161;
    bool _165 = !_151;
    bool _167 = _163 || _165;
    if (_167)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _131;
    if (_167)
    {
        out.m_56.x = 0.0;
    }
    if (_167)
    {
        float _171 = _169 * 5.0;
        _139 = as_type<int>(_171);
    }
    int _173 = _139;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2270 = as_type<float>(_173);
        out.gl_Position.z = _2270;
    }
    if (_167)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _175 = in.m_60.x;
    float _177 = in.m_60.y;
    float _179 = in.m_60.z;
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    float _187 = in.m_64.x;
    float _189 = in.m_64.y;
    float _191 = in.m_64.z;
    float _193 = _175 * _175;
    float _195 = _177 * _177;
    float _197 = _179 * _179;
    float _199 = fma(_181, _181, _193);
    float _201 = fma(_183, _183, _195);
    float _203 = fma(_185, _185, _197);
    float _205 = fma(_187, _187, _199);
    float _207 = fma(_189, _189, _201);
    float _209 = fma(_191, _191, _203);
    float _211 = sqrt(_205);
    float _213 = sqrt(_207);
    float _215 = sqrt(_209);
    bool _217 = _211 > 0.0;
    bool _219 = _213 > 0.0;
    float _221 = _213;
    float _223 = _211;
    float _225 = _209;
    if (_217)
    {
        float _227 = rsqrt(_205);
        _221 = _227;
    }
    float _229 = _221;
    float _231 = 0.0;
    if (!_217)
    {
        _231 = 0.0;
    }
    float _233 = _231;
    bool _235 = _215 > 0.0;
    float _237 = 0.0;
    float _239 = _233;
    if (!_217)
    {
        _237 = 0.0;
    }
    float _241 = _237;
    float _243 = _241;
    if (!_217)
    {
        _223 = 0.0;
    }
    float _245 = _223;
    float _247 = 0.0;
    float _249 = _245;
    if (_219)
    {
        float _251 = rsqrt(_207);
        _247 = _251;
    }
    float _253 = _247;
    float _255 = 0.0;
    if (!_219)
    {
        _255 = 0.0;
    }
    float _257 = _255;
    float _259 = 0.0;
    float _261 = _257;
    if (!_219)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    if (!_219)
    {
        _265 = 0.0;
    }
    float _269 = _265;
    float _271 = _215;
    float _273 = _269;
    if (_235)
    {
        float _275 = rsqrt(_209);
        _271 = _275;
    }
    float _277 = _271;
    float _279 = _229;
    if (_217)
    {
        float _281 = _229 * _181;
        _239 = _281;
    }
    float _283 = _239;
    if (_217)
    {
        float _285 = _229 * _175;
        _243 = _285;
    }
    float _287 = _243;
    if (_217)
    {
        float _289 = _229 * _187;
        _249 = _289;
    }
    float _291 = _249;
    bool _293 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _295 = 0.0;
    if (!_235)
    {
        _295 = 0.0;
    }
    float _297 = _295;
    float _299 = _297;
    if (!_235)
    {
        _279 = 0.0;
    }
    float _301 = _279;
    float _303 = _301;
    if (_219)
    {
        float _305 = _253 * _183;
        _261 = _305;
    }
    float _307 = _261;
    if (!_235)
    {
        _225 = 0.0;
    }
    float _309 = _225;
    float _311 = _309;
    if (_219)
    {
        float _313 = _253 * _177;
        _267 = _313;
    }
    float _315 = _267;
    if (_219)
    {
        float _317 = _253 * _189;
        _273 = _317;
    }
    float _319 = _273;
    if (_235)
    {
        float _321 = _277 * _185;
        _299 = _321;
    }
    float _323 = _299;
    if (_235)
    {
        float _325 = _277 * _179;
        _311 = _325;
    }
    float _327 = _311;
    float _329 = _327;
    if (_235)
    {
        float _331 = _277 * _191;
        _303 = _331;
    }
    float _333 = _303;
    bool _335 = !_293;
    float _353;
    if (!_335)
    {
        float _337 = in.m_66.x;
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _341 = _337 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_121);
        float _359 = 1.0 / _357;
        float _361 = _155 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = in.m_68.w;
    float _367 = in.m_53.x;
    float _369 = in.m_53.y;
    float _371 = in.m_53.z;
    float _373 = in.m_70.x;
    float _375 = in.m_70.y;
    float _377 = in.m_70.z;
    float _379 = in.m_72.x;
    float _381 = in.m_72.y;
    float _383 = in.m_72.z;
    float _385 = in.m_64.w;
    float _387 = in.m_62.w;
    float _389 = trunc(_365);
    int _391 = int(_389);
    int _393 = _391 << 5;
    uint _396 = uint(int(uint(_393) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_396)];
    float _398 = as_type<float>(_dmw0.x);
    int _400 = _393 + 4;
    uint _402 = uint(int(uint(_400) >> uint(2)));
    float _404 = as_type<float>(_dmw0.y);
    int _406 = _393 + 8;
    uint _408 = uint(int(uint(_406) >> uint(2)));
    float _410 = as_type<float>(_dmw0.z);
    int _412 = _393 + 12;
    uint _414 = uint(int(uint(_412) >> uint(2)));
    float _416 = as_type<float>(_dmw0.w);
    float _418 = _189 * _369;
    float _420 = _375 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _422 = _373 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _379);
    float _426 = fma(_187, _367, _418);
    float _428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _381);
    float _430 = _420 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _432 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _434 = _377 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _436 = _183 * _369;
    float _438 = _430 * _428;
    float _440 = _432 * _424;
    float _442 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _383);
    float _444 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _446 = _438 * _319;
    float _448 = fma(_181, _367, _436);
    float _450 = _438 * _307;
    float _452 = fma(_191, _371, _426);
    float _454 = _444 * _442;
    float _456 = fma(_440, _291, _446);
    float _458 = fma(_185, _371, _448);
    float _460 = fma(_440, _283, _450);
    float _462 = _452 + _385;
    float _464 = fma(_454, _333, _456);
    float _466 = _458 + _387;
    float _468 = fma(_454, _323, _460);
    float _470 = in.m_60.w;
    float _472 = _462 + _464;
    float _474 = _177 * _369;
    float _476 = _466 + _468;
    float _478 = _438 * _315;
    float _480 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _482 = _472 + _480;
    float _484 = fma(_175, _367, _474);
    float _486 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _488 = _476 + _486;
    float _490 = fma(_440, _287, _478);
    float _492 = _482 * _482;
    float _494 = fma(_179, _371, _484);
    float _496 = fma(_454, _327, _490);
    float _498 = fma(_488, _488, _492);
    bool _500 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _502 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _504 = _500 || _502;
    bool _506 = isnan(0.5);
    bool _508 = _504 || _506;
    float _510 = sqrt(_498);
    bool _512 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _514 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _516 = _512 || _514;
    bool _518 = isnan(0.5);
    bool _520 = _516 || _518;
    float _522 = _494 + _470;
    float _524 = _522 + _496;
    bool _526 = _510 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _528 = _494;
    float _530 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _532 = _454;
    if (!_526)
    {
        _528 = _476;
    }
    float _534 = _528;
    float _536 = _534;
    if (!_526)
    {
        _530 = _524;
    }
    float _538 = _530;
    float _540 = _416 * 2.0;
    float _542 = _398 * 2.0;
    float _544 = _404 * 2.0;
    float _546 = _398 * _398;
    float _548 = _410 * _540;
    float _550 = _404 * _540;
    float _552 = _398 * _540;
    float _554 = -_548;
    float _556 = fma(_404, _542, _554);
    float _558 = fma(_410, _542, _550);
    float _560 = -_552;
    float _562 = fma(_410, _544, _560);
    float _564 = fma(_404, _542, _548);
    float _566 = -_550;
    float _568 = fma(_410, _542, _566);
    float _570 = fma(_410, _544, _552);
    float _572 = _404 * _404;
    float _574 = _410 * _410;
    float _576 = _542;
    float _578 = _538;
    float _580 = _574;
    if (!_526)
    {
        _576 = _472;
    }
    float _582 = _576;
    bool _584 = !_526;
    float _586 = _582;
    if (!_584)
    {
        float _588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _592 = _510 + _590;
        float _594 = rsqrt(_498);
        float _596 = _592 * _588;
        float _598 = _524 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _600 = _596 * 0.15915493667125701904296875;
        float _602 = _600 * 6.283185482025146484375;
        float _604 = sin(_602);
        float _606 = _600 * 6.283185482025146484375;
        float _608 = cos(_606);
        float _610 = fma(_604, _598, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _612 = _594 * _610;
        float _614 = _608 + (-1.0);
        float _616 = _614 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _618 = fma(_488, _612, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _620 = fma(_482, _612, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _622 = fma(_524, _608, _616);
        _578 = _622;
        _536 = _618;
        _586 = _620;
    }
    float _624 = _578;
    float _626 = _536;
    float _628 = _586;
    float _630 = -_522;
    float _632 = _630 + _624;
    float _634 = -_466;
    float _636 = _634 + _626;
    float _638 = -_462;
    float _640 = _638 + _628;
    float _642 = fma(_546, -2.0, 1.0);
    float _644 = _632 * _315;
    float _646 = _632 * _287;
    float _648 = fma(_572, -2.0, 1.0);
    float _650 = _632 * _327;
    float _652 = fma(_636, _307, _644);
    float _654 = fma(_636, _283, _646);
    float _656 = fma(_574, -2.0, _642);
    float _658 = fma(_574, -2.0, _648);
    float _660 = fma(_640, _319, _652);
    float _662 = fma(_636, _323, _650);
    float _664 = fma(_640, _291, _654);
    float _666 = fma(_572, -2.0, _642);
    float _668 = _660 * _556;
    float _670 = _660 * _656;
    float _672 = _660 * _570;
    float _674 = fma(_640, _333, _662);
    float _676 = fma(_664, _658, _668);
    float _678 = fma(_664, _564, _670);
    float _680 = fma(_664, _568, _672);
    float _682 = 0.0;
    float _684 = _654;
    if (_508)
    {
        _682 = 1.0;
    }
    float _686 = _682;
    float _688 = fma(_674, _558, _676);
    float _690 = fma(_674, _562, _678);
    float _692 = fma(_674, _666, _680);
    float _694 = _466 + _688;
    float _696 = _522 + _690;
    float _698 = _462 + _692;
    float _700 = _696;
    float _702 = _694;
    float _704 = _698;
    float _706 = _686;
    float _708 = _690;
    if (!_520)
    {
        float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _712 = _522 + _710;
        float _714 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _716 = _466 + _714;
        float _718 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _720 = _712 * _712;
        float _722 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _724 = _462 + _722;
        float _726 = fma(_716, _716, _720);
        float _728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _730 = fma(_724, _724, _726);
        float _732 = sqrt(_730);
        float _734 = _718 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _736 = precise::min(_732, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _738 = _736 * _728;
        float _740 = _734 * _738;
        float _742 = fma(_688, _740, _466);
        float _744 = fma(_690, _740, _522);
        float _746 = fma(_692, _740, _462);
        _700 = _744;
        _702 = _742;
        _704 = _746;
    }
    float _748 = _700;
    float _750 = _702;
    float _752 = _704;
    if (!_508)
    {
        float _754 = in.m_74.w;
        int _756 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _758 = _756 == 4;
        bool _760 = _756 == 8;
        bool _762 = _756 == 12;
        int _764 = as_type<int>(_754) << 16;
        int _766 = as_type<int>(_754) << 8;
        int _768 = as_type<int>(_754) << 24;
        int _770 = _764 >> 24;
        int _772 = _766 >> 24;
        int _774 = as_type<int>(_754) >> 24;
        int _776 = _768 >> 24;
        float _778 = float(_770);
        float _780 = float(_772);
        float _782 = float(_774);
        float _784 = _778 * 0.0078740157186985015869140625;
        float _786 = float(_776);
        float _788 = _780 * 0.0078740157186985015869140625;
        float _790 = _782 * 0.0078740157186985015869140625;
        float _792 = precise::min(_784, 1.0);
        float _794 = _786 * 0.0078740157186985015869140625;
        float _796 = precise::min(_788, 1.0);
        float _798 = precise::min(_790, 1.0);
        float _800 = precise::min(_794, 1.0);
        float _802 = precise::max(_792, -1.0);
        float _804 = precise::max(_796, -1.0);
        float _806 = precise::max(_798, -1.0);
        float _808 = precise::max(_800, -1.0);
        float _810 = _808;
        _708 = _804;
        _684 = as_type<float>(_756);
        if (_758)
        {
            _810 = _802;
        }
        float _812 = _810;
        float _814 = _812;
        if (_760)
        {
            _814 = _804;
        }
        float _816 = _814;
        float _818 = _816;
        if (_762)
        {
            _818 = _806;
        }
        float _820 = _818;
        float _822 = abs(_820);
        float _824 = (-0.0) + _822;
        _706 = _824;
    }
    float _826 = _706;
    float _828 = _708;
    float _830 = _684;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _834 = _748 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _838 = _750 + _836;
    float _840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _842 = _752 + _840;
    float _844 = _834 * _834;
    bool _846 = _826 != 0.0;
    bool _848 = isnan(_826);
    bool _850 = _846 || _848;
    bool _852 = isnan(0.0);
    bool _854 = _850 || _852;
    float _856 = fma(_838, _838, _844);
    float _858 = fma(_842, _842, _856);
    float _860 = rsqrt(_858);
    float _862 = sqrt(_858);
    float _864 = _838 * _860;
    float _866 = _842 * _860;
    float _868 = _834 * _860;
    float _870 = _864 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _872 = _866 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _874 = _870 * _870;
    float _876 = _872 * _872;
    float _878 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _880 = fma(_862, (*spvDescriptorSet0.vp_c15)._m0[23].w, _878);
    float _882 = precise::clamp(_880, 0.0, 1.0);
    float _884 = _874 + _876;
    float _886 = -_882;
    float _888 = _886 + 1.0;
    float _890 = sqrt(_884);
    float _892 = abs(_888);
    float _894 = log2(_892);
    bool _896 = _890 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _898 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _900 = _890 + _898;
    float _902 = _856;
    float _904 = _884;
    float _906 = _900;
    float _908 = _860;
    float _910 = _830;
    if (_896)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _902 = _912;
    }
    float _914 = _902;
    if (_896)
    {
        float _916 = rsqrt(_884);
        _904 = _916;
    }
    float _918 = _904;
    if (_896)
    {
        float _920 = _900 * _914;
        _906 = _920;
    }
    float _922 = _906;
    if (_896)
    {
        float _924 = _922 * 0.15915493667125701904296875;
        _580 = _924;
    }
    float _926 = _580;
    float _928 = _914;
    float _930 = _926;
    if (_896)
    {
        float _932 = _926 * 6.283185482025146484375;
        float _934 = sin(_932);
        _928 = _934;
    }
    float _936 = _928;
    float _938 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _940 = precise::max(0.0, _938);
    float _942 = _828;
    if (_896)
    {
        float _944 = _926 * 6.283185482025146484375;
        float _946 = cos(_944);
        _942 = _946;
    }
    float _948 = _942;
    float _950 = -_868;
    float _952 = -_940;
    float _954 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[24].y, _952);
    float _956 = _954;
    if (_896)
    {
        float _958 = _954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _908 = _958;
    }
    float _960 = _908;
    if (!_896)
    {
        _930 = _870;
    }
    float _962 = _930;
    float _964 = _936;
    float _966 = _962;
    if (_896)
    {
        float _968 = fma(_936, _960, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _964 = _968;
    }
    float _970 = _964;
    float _972 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_896)
    {
        float _974 = _948 + (-1.0);
        _910 = _974;
    }
    float _976 = _910;
    float _978 = _976;
    if (_896)
    {
        float _980 = _918 * _970;
        _532 = _980;
    }
    float _982 = _532;
    float _984 = fma(_466, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _986 = _748 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _988 = _986;
    if (_896)
    {
        float _990 = _976 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _978 = _990;
    }
    float _992 = _978;
    float _994 = _992;
    if (_896)
    {
        float _996 = _870 * _982;
        _966 = _996;
    }
    float _998 = _966;
    if (!_896)
    {
        _972 = _872;
    }
    float _1000 = _972;
    float _1002 = _1000;
    if (_896)
    {
        float _1004 = _872 * _982;
        _1002 = _1004;
    }
    float _1006 = _1002;
    if (_896)
    {
        float _1008 = fma(_954, _948, _992);
        _956 = _1008;
    }
    float _1010 = _956;
    if (!_896)
    {
        _994 = _874;
    }
    float _1012 = _994;
    float _1014 = _1012;
    if (_896)
    {
        float _1016 = _998 * _998;
        _1014 = _1016;
    }
    float _1018 = _1014;
    float _1020 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[2].x, _986);
    if (!_896)
    {
        _988 = _876;
    }
    float _1022 = _988;
    float _1024 = _1022;
    if (_896)
    {
        float _1026 = _1006 * _1006;
        _1024 = _1026;
    }
    float _1028 = _1024;
    float _1030 = fma(_1010, _1010, _1018);
    float _1032 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1020);
    float _1034 = floor(_984);
    float _1036 = _1030 + _1028;
    float _1038 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1040 = _748 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1042 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1044 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1046 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1040);
    float _1048 = rsqrt(_1036);
    float _1050 = -_1044;
    float _1052 = fma(_1050, _1042, 1.0);
    float _1054 = _748 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1056 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1046);
    float _1058 = fma(_462, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1060 = _748 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1062 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1054);
    float _1064 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1066 = floor(_1058);
    float _1068 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1060);
    float _1070 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1062);
    float _1072 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1074 = -_1034;
    float _1076 = _984 + _1074;
    float _1078 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1068);
    float _1080 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1082 = _1048 * _998;
    float _1084 = _1048 * _1010;
    float _1086 = _1048 * _1006;
    float _1088 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1072);
    float _1090 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1092 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1094 = log2(_1052);
    float _1096 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1088);
    float _1098 = -_1090;
    float _1100 = fma(_1084, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1098);
    float _1102 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1104 = -_1066;
    float _1106 = _1058 + _1104;
    float _1108 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1096);
    float _1110 = -_1086;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1100);
    float _1114 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1102);
    float _1116 = _1084 + 1.0;
    float _1118 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1120 = fma(_1112, -0.5, 0.5);
    float _1122 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1114);
    float _1124 = 1.0 / _1108;
    float _1126 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1118);
    float _1128 = _894 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1130 = fma(_1112, 0.5, 0.5);
    float _1132 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1122);
    float _1134 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1126);
    float _1136 = _1094 * 0.693147182464599609375;
    float _1138 = fma(_1130, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1140 = sqrt(_1120);
    float _1142 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1134);
    float _1144 = _1134;
    float _1146 = _1034;
    float _1148 = _1142;
    if (_854)
    {
        _1144 = _1132;
    }
    float _1150 = _1144;
    float _1152 = fma(_1130, _1138, -0.212114393711090087890625);
    float _1154 = _1150;
    if (!_854)
    {
        _1154 = 0.0;
    }
    float _1156 = _1154;
    if (_854)
    {
        _1146 = _1142;
    }
    float _1158 = _1146;
    float2 _3789 = float2(_1076, _1106);
    float _1160 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3789, float2(0.0), isnan(_3789)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3789, float2(0.0), isnan(_3789)), level(0.0)).x;
    float _1162 = exp2(_1128);
    float _1164 = _1158;
    if (!_854)
    {
        _1164 = 0.0;
    }
    float _1166 = _1164;
    float _1168 = _1124 * _1156;
    float _1170 = fma(_1130, _1152, 1.570728778839111328125);
    float _1172 = _1124 * _1166;
    float _1174 = fma(_1168, 0.5, 0.5);
    float _1176 = _1140 * 0.636619746685028076171875;
    float _1178 = _1136 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1180 = fma(_1172, -0.5, 0.5);
    float _1182 = -_1170;
    float _1184 = fma(_1176, _1182, 1.0);
    float _1186 = -_1084;
    float _1188 = fma(_1162, _1116, _1186);
    float3 _3840 = float3(_1174, _1180, _1178);
    float _1190 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3840, float3(0.0), isnan(_3840)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3840, float3(0.0), isnan(_3840)), level(0.0)).x;
    float _1192 = fma(_1188, 0.5, 0.5);
    float3 _3853 = float3(_1174, _1180, _1178);
    float4 _1195 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3853, float3(0.0), isnan(_3853)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3853, float3(0.0), isnan(_3853)), level(0.0)).xyzw;
    float _1197 = _1195.x;
    float _1199 = _1195.y;
    float _1201 = _1195.z;
    float _1203 = _1195.w;
    float2 _3869 = float2(_1184, _1192);
    float3 _1207 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3869, float2(0.0), isnan(_3869)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3869, float2(0.0), isnan(_3869)), level(0.0)).xyz;
    float _1209 = _1207.x;
    float _1211 = _1207.y;
    float _1213 = _1207.z;
    float _1215 = in.m_66.y;
    float _1217 = _522 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1219 = in.m_76.y;
    int _1221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1223 = _1221 != 0;
    float _1225 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1217);
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1229 = _1227 != 0;
    float _1231 = _894 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1233 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1225);
    out.m_78.x = _750;
    out.m_78.y = _748;
    out.m_78.z = _752;
    float _1235 = _1233 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_80.x = 1.0;
    out.m_80.y = 1.0;
    out.m_80.z = 1.0;
    float _1237 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1241 = _1239 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1245 = _1243 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1247 = exp2(_1231);
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1251 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1249);
    bool _1253 = _1215 > 0.5;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1257 = _1255 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1259 = -_1219;
    float _1261 = _1259 + 1.0;
    float _1263 = _522 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1265 = 1.0 / _1241;
    float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1269 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1267);
    float _1271 = _1219;
    float _1273 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1275 = _1269;
    if (_1223)
    {
        float _1277 = _1253 ? _1261 : _1219;
        _1271 = _1277;
    }
    float _1279 = _1271;
    float _1281 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1263);
    float _1283 = _1263;
    if (_1229)
    {
        float _1285 = in.m_66.x;
        _1283 = _1285;
    }
    float _1287 = _1283;
    float _1289 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1281);
    float _1291 = 1.0 / _1245;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1297 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1299 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1305 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1309 = 1.0 / _1297;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1313 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1311;
    float _1315 = _1235 + _1297;
    float _1317 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1319;
    float _1323 = _1303 * _1265;
    bool _1325 = _381 != 0.0;
    bool _1327 = isnan(_381);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan(0.0);
    bool _1333 = _1329 || _1331;
    float _1335 = _1313 * _1291;
    float _1337 = 1.0 / _1257;
    out.m_82.x = _1299;
    out.m_82.y = _1317;
    out.m_82.z = _1305;
    bool _1339 = _379 == 0.0;
    bool _1341 = !_1333;
    bool _1343 = _1339 && _1341;
    float _1345 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1347 = _363 + _1345;
    bool _1349 = _1287 > 0.5;
    bool _1351 = _1349 && _1229;
    float _1353 = in.m_84.x;
    float _1355 = in.m_84.y;
    float _1357 = in.m_84.z;
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1361 = _363 + _1359;
    bool _1363 = _383 == 0.0;
    bool _1365 = _1363 && _1343;
    float _1367 = _1315 * _1309;
    float _1369 = _1367 * 0.5;
    float _1371 = in.m_76.x;
    float _1373 = fma(_1335, _1361, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1375 = fma(_1323, _1347, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1377 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1379 = isnan(_363);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1385 = _1381 || _1383;
    float _1387 = float(_1385);
    float _1389 = -_1247;
    float _1391 = _1389 + 1.0;
    float _1393 = _1321 * _1337;
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1397 = _363 + _1395;
    bool _1399 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1401 = isnan(_363);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1407 = _1403 || _1405;
    float _1409 = float(_1407);
    float _1411 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1413 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1411);
    bool _1415 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1417 = isnan(_363);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1423 = _1419 || _1421;
    float _1425 = float(_1423);
    float _1427 = fma(_1393, _1397, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1429 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1431 = isnan(_363);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1437 = _1433 || _1435;
    float _1439 = float(_1437);
    float _1441 = -_1387;
    float _1443 = _1441 + 1.0;
    bool _1445 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1447 = isnan(0.0);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1453 = _1449 || _1451;
    float _1455 = 1.0 / _1413;
    float _1457 = -_1409;
    float _1459 = _1457 + 1.0;
    float _1461 = _1391 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1463 = as_type<int>((*spvDescriptorSet0.vp_c8)._m0[30].y);
    float _1465 = _1393;
    if (!_854)
    {
        float _1467 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _1463 = as_type<int>(_1467);
    }
    int _1469 = _1463;
    float _1471 = _1355;
    float _1473 = _1357;
    float _1475 = _1353;
    if (!_1365)
    {
        float _1477 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1355);
        _1471 = _1477;
    }
    float _1479 = _1471;
    float _1481 = _1439 * _1443;
    float _1483 = -_1439;
    float _1485 = _1483 + 1.0;
    if (!_1365)
    {
        float _1487 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1357);
        _1473 = _1487;
    }
    float _1489 = _1473;
    float _1491 = _1371;
    if (_1229)
    {
        _1465 = _1371;
    }
    float _1493 = _1465;
    float _1495 = _1373 * _1481;
    float _1497 = _307 * _1479;
    float _1499 = _315 * _1479;
    float _1501 = _319 * _1479;
    float _1503 = _1493;
    if (_1351)
    {
        float _1505 = -_1493;
        float _1507 = _1505 + 1.0;
        _1503 = _1507;
    }
    float _1509 = _1503;
    float _1511 = fma(_1485, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1495);
    float _1513 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1251);
    float _1515 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1517 = _1455 * _1515;
    float _1519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1229)
    {
        _1491 = _1509;
    }
    float _1521 = _1491;
    float _1523 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1269);
    if (_1453)
    {
        float _1525 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1273 = _1525;
    }
    float _1527 = _1273;
    if (!_1365)
    {
        float _1529 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1353);
        _1475 = _1529;
    }
    float _1531 = _1475;
    float _1533 = _1425 * _1459;
    float _1535 = _466 + _1513;
    float _1537 = _462 + _1523;
    float _1539 = abs(_1517);
    float _1541 = log2(_1539);
    if (_1453)
    {
        float _1543 = precise::min(_1527, 20.0);
        _1275 = _1543;
    }
    float _1545 = _1275;
    float _1547 = -_1425;
    float _1549 = _1547 + 1.0;
    float _1551 = fma(_291, _1531, _1501);
    float _1553 = -_1535;
    float _1555 = _1553 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1557 = -_1537;
    float _1559 = _1557 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1561 = _1387 * _1549;
    float _1563 = fma(_287, _1531, _1499);
    float _1565 = _1545;
    if (_1453)
    {
        float _1567 = 1.0 / _1545;
        _1565 = _1567;
    }
    float _1569 = _1565;
    float _1571 = precise::min(_1535, _1555);
    float _1573 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1575 = precise::min(_1537, _1559);
    float _1577 = fma(_327, _1489, _1563);
    float _1579 = fma(_283, _1531, _1497);
    if (!_1453)
    {
        _329 = 1.0;
    }
    float _1581 = _329;
    float _1583 = fma(_1375, _1561, _1511);
    float _1585 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1587 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1591 = precise::min(_1571, _1575);
    float _1593 = fma(_1427, _1533, _1583);
    float _1595 = _1587 * _1519;
    float _1597 = in.m_74.x;
    float _1599 = _1581;
    if (_1453)
    {
        float _1601 = _1591 * _1569;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        _1599 = _1603;
    }
    float _1605 = _1599;
    float _1607 = exp2(_1585);
    float _1609 = fma(_323, _1489, _1579);
    bool _1611 = _1517 <= 8000.0;
    bool _1613 = isnan(_1517);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(8000.0);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    float _1623 = fma(_333, _1489, _1551);
    float _1625 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1593);
    float _1627 = _1577 * _556;
    float _1629 = _1577 * _656;
    float _1631 = _1573 * _1589;
    float _1633 = _1577 * _570;
    float _1635 = _1625 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1637 = fma(_1609, _658, _1627);
    float _1639 = fma(_1609, _564, _1629);
    out.m_86.x = _1631;
    out.m_86.y = _1595;
    float _1641 = fma(_1609, _568, _1633);
    float _1643 = fma(_1607, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1645 = precise::clamp(_1643, 0.0, 1.0);
    float _1647 = fma(_1623, _558, _1637);
    float _1649 = fma(_1623, _562, _1639);
    float _1651 = fma(_1645, -2.0, 3.0);
    float _1653 = _1645 * _1645;
    float _1655 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1657 = fma(_1623, _666, _1641);
    float _1659 = _1653 * _1651;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1665 = -_1659;
    float _1667 = _1665 + 1.0;
    float _1669 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1655);
    float _1671 = _1661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1675 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1659);
    float _1677 = _1663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1679 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1669);
    float _1681 = _1673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1683 = _1621 * _1675;
    out.m_88.x = _1647;
    out.m_88.y = _1649;
    out.m_88.z = _1657;
    float _1685 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1679);
    bool _1687 = _862 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1689 = isnan(_862);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1695 = _1691 || _1693;
    float _1697 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_90.x = _1677;
    out.m_90.y = _1681;
    out.m_90.z = _1671;
    out.m_90.w = _1635;
    float _1699 = _1605 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1701 = _1685 + _1108;
    out.gl_Position.x = _1132;
    out.gl_Position.y = _1142;
    out.gl_Position.z = _1685;
    out.gl_Position.w = _1108;
    float _1703 = _1699 * _826;
    float _1705 = _1701;
    float _1707 = _1635;
    if (!_854)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4730 = as_type<float>(_1469);
        out.gl_Position.z = _4730;
    }
    float _1709 = _1701 * 0.5;
    float _1711 = _1108;
    float _1713 = _1709;
    float _1715 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (_854)
    {
        _1148 = _1703;
    }
    float _1717 = _1148;
    float _1719 = _1717;
    if (!_854)
    {
        _1719 = 0.0;
    }
    float _1721 = _1719;
    out.m_92.z = _1709;
    out.m_92.w = _1108;
    if (!_1695)
    {
        _1705 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1723 = _1705;
    float _1725 = _1723;
    float _1727 = _1723;
    if (!_1695)
    {
        _1707 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1729 = _1707;
    float _1731 = _1729;
    float _1733 = _1729;
    if (!_1695)
    {
        _1711 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1735 = _1711;
    float _1737 = _1735;
    float _1739 = _1735;
    if (!_1695)
    {
        _1713 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1741 = _1713;
    float _1743 = -_1160;
    float _1745 = _1743 + 1.0;
    float _1747 = _1745 * _1697;
    float _1749 = precise::clamp(_1747, 0.0, 1.0);
    float _1751 = -_1749;
    float _1753 = fma(_1751, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1755 = _1741;
    float _1757 = _1741;
    if (!_1695)
    {
        _1715 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1759 = _1715;
    float _1761 = _1753 * _1597;
    float _1763 = _1761 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1765 = _1461 * _1190;
    float _1767 = -_1461;
    float _1769 = _1767 + 1.0;
    out.m_94.x = _1763;
    float _1771 = _1203 * _1765;
    float _1773 = _1203 * _1769;
    float _1775 = _1213 * _1765;
    float _1777 = fma(_1209, _1771, _1197);
    float _1779 = fma(_1211, _1771, _1199);
    float _1781 = _1765;
    float _1783 = _1759;
    float _1785 = _1759;
    if (!_1695)
    {
        _1781 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1787 = _1781;
    float _1789 = fma(_1203, _1775, _1201);
    out.m_96.x = _1777;
    out.m_96.y = _1779;
    out.m_96.z = _1789;
    out.m_96.w = _1773;
    bool _1791 = !_1695;
    float _1793 = _1787;
    float _1795 = _1787;
    if (!_1791)
    {
        bool _1797 = _862 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1799 = isnan(_862);
        bool _1801 = _1797 || _1799;
        bool _1803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1805 = _1801 || _1803;
        if (!_1805)
        {
            float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1809 = _862 + _1807;
            float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1813 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1811;
            float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1819 = 1.0 / _1813;
            float _1821 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1823 = _1821 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1825 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1827 = _1825 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1829 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1831 = _1829 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1833 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1835 = _1833 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1837 = _1809 * _1819;
            float _1839 = precise::clamp(_1837, 0.0, 1.0);
            float _1841 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1843 = _1841 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1845 = fma(_1839, _1817, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1847 = fma(_1839, _1843, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1849 = fma(_1839, _1823, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1851 = fma(_1839, _1827, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1853 = fma(_1839, _1831, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1855 = fma(_1839, _1835, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1795 = _1849;
            _1739 = _1853;
            _1727 = _1845;
            _1785 = _1851;
            _1733 = _1847;
            _1757 = _1855;
            _1857 = true;
        }
        else
        {
            bool _1859 = _862 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1861 = isnan(_862);
            bool _1863 = _1859 || _1861;
            bool _1865 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1867 = _1863 || _1865;
            if (!_1867)
            {
                _1725 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1869 = _1725;
            _1727 = _1869;
            if (!_1867)
            {
                _1793 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1871 = _1793;
            _1795 = _1871;
            if (!_1867)
            {
                _1731 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1873 = _1731;
            _1733 = _1873;
            if (!_1867)
            {
                _1783 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1875 = _1783;
            _1785 = _1875;
            if (!_1867)
            {
                _1737 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1877 = _1737;
            _1739 = _1877;
            if (!_1867)
            {
                _1755 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1879 = _1755;
            bool _1881 = !_1867;
            _1757 = _1879;
            if (!_1881)
            {
                bool _1883 = _862 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1885 = isnan(_862);
                bool _1887 = _1883 || _1885;
                bool _1889 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1891 = _1887 || _1889;
                if (!_1891)
                {
                    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1895 = _862 + _1893;
                    float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1899 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1897;
                    float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1905 = 1.0 / _1899;
                    float _1907 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1909 = _1907 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1911 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1913 = _1911 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1915 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1917 = _1915 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1919 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1921 = _1919 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1923 = _1895 * _1905;
                    float _1925 = precise::clamp(_1923, 0.0, 1.0);
                    float _1927 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1929 = _1927 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1931 = fma(_1925, _1903, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1933 = fma(_1925, _1929, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1935 = fma(_1925, _1909, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1937 = fma(_1925, _1913, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1939 = fma(_1925, _1917, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1941 = fma(_1925, _1921, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1795 = _1935;
                    _1739 = _1939;
                    _1727 = _1931;
                    _1785 = _1937;
                    _1733 = _1933;
                    _1757 = _1941;
                    _1857 = true;
                }
                else
                {
                    _1795 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1739 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1727 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1785 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1733 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1757 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1857 = false;
    float _1943 = _1795;
    float _1945 = _1739;
    float _1947 = _1727;
    float _1949 = _1785;
    float _1951 = _1733;
    float _1953 = _1757;
    float _1955 = fma(_1649, -0.5, 0.5);
    float _1957 = precise::clamp(_1955, 0.0, 1.0);
    float _1959 = -_1943;
    float _1961 = _1959 + _1945;
    float _1963 = -_1947;
    float _1965 = _1963 + _1949;
    float _1967 = -_1951;
    float _1969 = _1967 + _1953;
    bool _1971 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1973 = fma(_1957, _1961, _1943);
    float _1975 = fma(_1957, _1965, _1947);
    float _1977 = fma(_1957, _1969, _1951);
    float _1979 = _1721 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1981 = _1973 * 0.586610972881317138671875;
    out.m_56.x = 1.0;
    float _1983 = fma(_1975, 0.298911988735198974609375, _1981);
    out.m_94.w = _1979;
    float _1985 = fma(_1977, 0.114477999508380889892578125, _1983);
    out.m_98.x = 0.0;
    float _1987 = -_1985;
    float _1989 = _1975 + _1987;
    float _1991 = -_1985;
    float _1993 = _1973 + _1991;
    float _1995 = -_1985;
    float _1997 = _1977 + _1995;
    float _1999 = fma(_1989, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1985);
    float _2001 = fma(_1993, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1985);
    float _2003 = fma(_1997, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1985);
    out.m_100.x = 0.0;
    out.m_102.x = _1999;
    out.m_102.y = _2001;
    out.m_102.z = _2003;
    if (!_1971)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2005 = -_748;
    float _2007 = _2005 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2009 = -_750;
    float _2011 = _2009 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2013 = -_752;
    float _2015 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2017 = _2007 * _2007;
    float _2019 = fma(_2011, _2011, _2017);
    float _2021 = fma(_2015, _2015, _2019);
    float _2023 = rsqrt(_2021);
    float _2025 = sqrt(_2021);
    float _2027 = _2007 * _2023;
    float _2029 = _2011 * _2023;
    float _2031 = _2015 * _2023;
    float _2033 = -_868;
    float _2035 = _2033 + _2027;
    float _2037 = -_864;
    float _2039 = _2037 + _2029;
    float _2041 = -_866;
    float _2043 = _2041 + _2031;
    float _2045 = _2035 * _2035;
    float _2047 = -_2025;
    float _2049 = _2047 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2051 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2053 = precise::clamp(_2051, 0.0, 1.0);
    float _2055 = fma(_2039, _2039, _2045);
    float _2057 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2059 = precise::clamp(_2057, 0.0, 1.0);
    float _2061 = _2053 * _2053;
    float _2063 = fma(_2043, _2043, _2055);
    float _2065 = _2061 + (-1.0);
    float _2067 = abs(_2059);
    float _2069 = log2(_2067);
    float _2071 = rsqrt(_2063);
    float _2073 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2075 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2077 = exp2(_2073);
    float _2079 = _2035 * _2071;
    float _2081 = _2039 * _2071;
    float _2083 = _2043 * _2071;
    float _2085 = _1649 * _2079;
    float _2087 = fma(_1647, _2081, _2085);
    float _2089 = fma(_1657, _2083, _2087);
    float _2091 = precise::clamp(_2089, 0.0, 1.0);
    float _2093 = _2091 * _2091;
    float _2095 = fma(_2093, _2065, 1.0);
    float _2097 = -_2027;
    float _2099 = -_2075;
    float _2101 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2099);
    float _2103 = _1649 * _2027;
    float _2105 = _2095 * _2095;
    float _2107 = -_2031;
    float _2109 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2101);
    float _2111 = fma(_1647, _2029, _2103);
    float _2113 = 1.0 / _2105;
    float _2115 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2117 = _2109 + _2115;
    float _2119 = fma(_1657, _2031, _2111);
    float _2121 = precise::clamp(_2119, 0.0, 1.0);
    float _2123 = _2117 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2125 = precise::clamp(_2123, 0.0, 1.0);
    float _2127 = _2077 * _2125;
    float _2129 = _2121 * _2127;
    float _2131 = _2061 * _2113;
    float _2133 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2135 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2137 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2139 = _2129 * _2131;
    float _2141 = _2139 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2143 = _2139 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2145 = _2139 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _2133;
    out.m_98.y = _2135;
    out.m_98.z = _2137;
    out.m_100.x = _2141;
    out.m_100.y = _2143;
    out.m_100.z = _2145;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1857 = false;
    bool _355 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_53.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_56.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2202 = as_type<float>(_137);
        out.gl_Position.z = _2202;
    }
    if (!_125)
    {
        return out;
    }
    float _141 = in.m_58.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = 0.0;
    if (_151)
    {
        float _159 = float(_121);
        _157 = _159;
    }
    float _161 = _157;
    bool _163 = _155 >= _161;
    bool _165 = !_151;
    bool _167 = _163 || _165;
    if (_167)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _131;
    if (_167)
    {
        out.m_56.x = 0.0;
    }
    if (_167)
    {
        float _171 = _169 * 5.0;
        _139 = as_type<int>(_171);
    }
    int _173 = _139;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2270 = as_type<float>(_173);
        out.gl_Position.z = _2270;
    }
    if (_167)
    {
        return out;
    }
    float _175 = in.m_60.x;
    float _177 = in.m_60.y;
    float _179 = in.m_60.z;
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    float _187 = in.m_64.x;
    float _189 = in.m_64.y;
    float _191 = in.m_64.z;
    float _193 = _175 * _175;
    float _195 = _177 * _177;
    float _197 = _179 * _179;
    float _199 = fma(_181, _181, _193);
    float _201 = fma(_183, _183, _195);
    float _203 = fma(_185, _185, _197);
    float _205 = fma(_187, _187, _199);
    float _207 = fma(_189, _189, _201);
    float _209 = fma(_191, _191, _203);
    float _211 = sqrt(_205);
    float _213 = sqrt(_207);
    float _215 = sqrt(_209);
    bool _217 = _211 > 0.0;
    bool _219 = _213 > 0.0;
    float _221 = _213;
    float _223 = _211;
    float _225 = _209;
    if (_217)
    {
        float _227 = rsqrt(_205);
        _221 = _227;
    }
    float _229 = _221;
    float _231 = 0.0;
    if (!_217)
    {
        _231 = 0.0;
    }
    float _233 = _231;
    bool _235 = _215 > 0.0;
    float _237 = 0.0;
    float _239 = _233;
    if (!_217)
    {
        _237 = 0.0;
    }
    float _241 = _237;
    float _243 = _241;
    if (!_217)
    {
        _223 = 0.0;
    }
    float _245 = _223;
    float _247 = 0.0;
    float _249 = _245;
    if (_219)
    {
        float _251 = rsqrt(_207);
        _247 = _251;
    }
    float _253 = _247;
    float _255 = 0.0;
    if (!_219)
    {
        _255 = 0.0;
    }
    float _257 = _255;
    float _259 = 0.0;
    float _261 = _257;
    if (!_219)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    if (!_219)
    {
        _265 = 0.0;
    }
    float _269 = _265;
    float _271 = _215;
    float _273 = _269;
    if (_235)
    {
        float _275 = rsqrt(_209);
        _271 = _275;
    }
    float _277 = _271;
    float _279 = _229;
    if (_217)
    {
        float _281 = _229 * _181;
        _239 = _281;
    }
    float _283 = _239;
    if (_217)
    {
        float _285 = _229 * _175;
        _243 = _285;
    }
    float _287 = _243;
    if (_217)
    {
        float _289 = _229 * _187;
        _249 = _289;
    }
    float _291 = _249;
    bool _293 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _295 = 0.0;
    if (!_235)
    {
        _295 = 0.0;
    }
    float _297 = _295;
    float _299 = _297;
    if (!_235)
    {
        _279 = 0.0;
    }
    float _301 = _279;
    float _303 = _301;
    if (_219)
    {
        float _305 = _253 * _183;
        _261 = _305;
    }
    float _307 = _261;
    if (!_235)
    {
        _225 = 0.0;
    }
    float _309 = _225;
    float _311 = _309;
    if (_219)
    {
        float _313 = _253 * _177;
        _267 = _313;
    }
    float _315 = _267;
    if (_219)
    {
        float _317 = _253 * _189;
        _273 = _317;
    }
    float _319 = _273;
    if (_235)
    {
        float _321 = _277 * _185;
        _299 = _321;
    }
    float _323 = _299;
    if (_235)
    {
        float _325 = _277 * _179;
        _311 = _325;
    }
    float _327 = _311;
    float _329 = _327;
    if (_235)
    {
        float _331 = _277 * _191;
        _303 = _331;
    }
    float _333 = _303;
    bool _335 = !_293;
    float _353;
    if (!_335)
    {
        float _337 = in.m_66.x;
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _341 = _337 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_121);
        float _359 = 1.0 / _357;
        float _361 = _155 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = in.m_68.w;
    float _367 = in.m_53.x;
    float _369 = in.m_53.y;
    float _371 = in.m_53.z;
    float _373 = in.m_70.x;
    float _375 = in.m_70.y;
    float _377 = in.m_70.z;
    float _379 = in.m_72.x;
    float _381 = in.m_72.y;
    float _383 = in.m_72.z;
    float _385 = in.m_64.w;
    float _387 = in.m_62.w;
    float _389 = trunc(_365);
    int _391 = int(_389);
    int _393 = _391 << 5;
    uint _396 = uint(int(uint(_393) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_396)];
    float _398 = as_type<float>(_dmw0.x);
    int _400 = _393 + 4;
    uint _402 = uint(int(uint(_400) >> uint(2)));
    float _404 = as_type<float>(_dmw0.y);
    int _406 = _393 + 8;
    uint _408 = uint(int(uint(_406) >> uint(2)));
    float _410 = as_type<float>(_dmw0.z);
    int _412 = _393 + 12;
    uint _414 = uint(int(uint(_412) >> uint(2)));
    float _416 = as_type<float>(_dmw0.w);
    float _418 = _189 * _369;
    float _420 = _375 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _422 = _373 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _379);
    float _426 = fma(_187, _367, _418);
    float _428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _381);
    float _430 = _420 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _432 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _434 = _377 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _436 = _183 * _369;
    float _438 = _430 * _428;
    float _440 = _432 * _424;
    float _442 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _383);
    float _444 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _446 = _438 * _319;
    float _448 = fma(_181, _367, _436);
    float _450 = _438 * _307;
    float _452 = fma(_191, _371, _426);
    float _454 = _444 * _442;
    float _456 = fma(_440, _291, _446);
    float _458 = fma(_185, _371, _448);
    float _460 = fma(_440, _283, _450);
    float _462 = _452 + _385;
    float _464 = fma(_454, _333, _456);
    float _466 = _458 + _387;
    float _468 = fma(_454, _323, _460);
    float _470 = in.m_60.w;
    float _472 = _462 + _464;
    float _474 = _177 * _369;
    float _476 = _466 + _468;
    float _478 = _438 * _315;
    float _480 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _482 = _472 + _480;
    float _484 = fma(_175, _367, _474);
    float _486 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _488 = _476 + _486;
    float _490 = fma(_440, _287, _478);
    float _492 = _482 * _482;
    float _494 = fma(_179, _371, _484);
    float _496 = fma(_454, _327, _490);
    float _498 = fma(_488, _488, _492);
    bool _500 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _502 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _504 = _500 || _502;
    bool _506 = isnan(0.5);
    bool _508 = _504 || _506;
    float _510 = sqrt(_498);
    bool _512 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _514 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _516 = _512 || _514;
    bool _518 = isnan(0.5);
    bool _520 = _516 || _518;
    float _522 = _494 + _470;
    float _524 = _522 + _496;
    bool _526 = _510 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _528 = _494;
    float _530 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _532 = _454;
    if (!_526)
    {
        _528 = _476;
    }
    float _534 = _528;
    float _536 = _534;
    if (!_526)
    {
        _530 = _524;
    }
    float _538 = _530;
    float _540 = _416 * 2.0;
    float _542 = _398 * 2.0;
    float _544 = _404 * 2.0;
    float _546 = _398 * _398;
    float _548 = _410 * _540;
    float _550 = _404 * _540;
    float _552 = _398 * _540;
    float _554 = -_548;
    float _556 = fma(_404, _542, _554);
    float _558 = fma(_410, _542, _550);
    float _560 = -_552;
    float _562 = fma(_410, _544, _560);
    float _564 = fma(_404, _542, _548);
    float _566 = -_550;
    float _568 = fma(_410, _542, _566);
    float _570 = fma(_410, _544, _552);
    float _572 = _404 * _404;
    float _574 = _410 * _410;
    float _576 = _542;
    float _578 = _538;
    float _580 = _574;
    if (!_526)
    {
        _576 = _472;
    }
    float _582 = _576;
    bool _584 = !_526;
    float _586 = _582;
    if (!_584)
    {
        float _588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _592 = _510 + _590;
        float _594 = rsqrt(_498);
        float _596 = _592 * _588;
        float _598 = _524 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _600 = _596 * 0.15915493667125701904296875;
        float _602 = _600 * 6.283185482025146484375;
        float _604 = sin(_602);
        float _606 = _600 * 6.283185482025146484375;
        float _608 = cos(_606);
        float _610 = fma(_604, _598, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _612 = _594 * _610;
        float _614 = _608 + (-1.0);
        float _616 = _614 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _618 = fma(_488, _612, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _620 = fma(_482, _612, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _622 = fma(_524, _608, _616);
        _578 = _622;
        _536 = _618;
        _586 = _620;
    }
    float _624 = _578;
    float _626 = _536;
    float _628 = _586;
    float _630 = -_522;
    float _632 = _630 + _624;
    float _634 = -_466;
    float _636 = _634 + _626;
    float _638 = -_462;
    float _640 = _638 + _628;
    float _642 = fma(_546, -2.0, 1.0);
    float _644 = _632 * _315;
    float _646 = _632 * _287;
    float _648 = fma(_572, -2.0, 1.0);
    float _650 = _632 * _327;
    float _652 = fma(_636, _307, _644);
    float _654 = fma(_636, _283, _646);
    float _656 = fma(_574, -2.0, _642);
    float _658 = fma(_574, -2.0, _648);
    float _660 = fma(_640, _319, _652);
    float _662 = fma(_636, _323, _650);
    float _664 = fma(_640, _291, _654);
    float _666 = fma(_572, -2.0, _642);
    float _668 = _660 * _556;
    float _670 = _660 * _656;
    float _672 = _660 * _570;
    float _674 = fma(_640, _333, _662);
    float _676 = fma(_664, _658, _668);
    float _678 = fma(_664, _564, _670);
    float _680 = fma(_664, _568, _672);
    float _682 = 0.0;
    float _684 = _654;
    if (_508)
    {
        _682 = 1.0;
    }
    float _686 = _682;
    float _688 = fma(_674, _558, _676);
    float _690 = fma(_674, _562, _678);
    float _692 = fma(_674, _666, _680);
    float _694 = _466 + _688;
    float _696 = _522 + _690;
    float _698 = _462 + _692;
    float _700 = _696;
    float _702 = _694;
    float _704 = _698;
    float _706 = _686;
    float _708 = _690;
    if (!_520)
    {
        float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _712 = _522 + _710;
        float _714 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _716 = _466 + _714;
        float _718 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _720 = _712 * _712;
        float _722 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _724 = _462 + _722;
        float _726 = fma(_716, _716, _720);
        float _728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _730 = fma(_724, _724, _726);
        float _732 = sqrt(_730);
        float _734 = _718 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _736 = precise::min(_732, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _738 = _736 * _728;
        float _740 = _734 * _738;
        float _742 = fma(_688, _740, _466);
        float _744 = fma(_690, _740, _522);
        float _746 = fma(_692, _740, _462);
        _700 = _744;
        _702 = _742;
        _704 = _746;
    }
    float _748 = _700;
    float _750 = _702;
    float _752 = _704;
    if (!_508)
    {
        float _754 = in.m_74.w;
        int _756 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _758 = _756 == 4;
        bool _760 = _756 == 8;
        bool _762 = _756 == 12;
        int _764 = as_type<int>(_754) << 16;
        int _766 = as_type<int>(_754) << 8;
        int _768 = as_type<int>(_754) << 24;
        int _770 = _764 >> 24;
        int _772 = _766 >> 24;
        int _774 = as_type<int>(_754) >> 24;
        int _776 = _768 >> 24;
        float _778 = float(_770);
        float _780 = float(_772);
        float _782 = float(_774);
        float _784 = _778 * 0.0078740157186985015869140625;
        float _786 = float(_776);
        float _788 = _780 * 0.0078740157186985015869140625;
        float _790 = _782 * 0.0078740157186985015869140625;
        float _792 = precise::min(_784, 1.0);
        float _794 = _786 * 0.0078740157186985015869140625;
        float _796 = precise::min(_788, 1.0);
        float _798 = precise::min(_790, 1.0);
        float _800 = precise::min(_794, 1.0);
        float _802 = precise::max(_792, -1.0);
        float _804 = precise::max(_796, -1.0);
        float _806 = precise::max(_798, -1.0);
        float _808 = precise::max(_800, -1.0);
        float _810 = _808;
        _708 = _804;
        _684 = as_type<float>(_756);
        if (_758)
        {
            _810 = _802;
        }
        float _812 = _810;
        float _814 = _812;
        if (_760)
        {
            _814 = _804;
        }
        float _816 = _814;
        float _818 = _816;
        if (_762)
        {
            _818 = _806;
        }
        float _820 = _818;
        float _822 = abs(_820);
        float _824 = (-0.0) + _822;
        _706 = _824;
    }
    float _826 = _706;
    float _828 = _708;
    float _830 = _684;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _834 = _748 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _838 = _750 + _836;
    float _840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _842 = _752 + _840;
    float _844 = _834 * _834;
    bool _846 = _826 != 0.0;
    bool _848 = isnan(_826);
    bool _850 = _846 || _848;
    bool _852 = isnan(0.0);
    bool _854 = _850 || _852;
    float _856 = fma(_838, _838, _844);
    float _858 = fma(_842, _842, _856);
    float _860 = rsqrt(_858);
    float _862 = sqrt(_858);
    float _864 = _838 * _860;
    float _866 = _842 * _860;
    float _868 = _834 * _860;
    float _870 = _864 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _872 = _866 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _874 = _870 * _870;
    float _876 = _872 * _872;
    float _878 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _880 = fma(_862, (*spvDescriptorSet0.vp_c15)._m0[23].w, _878);
    float _882 = precise::clamp(_880, 0.0, 1.0);
    float _884 = _874 + _876;
    float _886 = -_882;
    float _888 = _886 + 1.0;
    float _890 = sqrt(_884);
    float _892 = abs(_888);
    float _894 = log2(_892);
    bool _896 = _890 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _898 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _900 = _890 + _898;
    float _902 = _856;
    float _904 = _884;
    float _906 = _900;
    float _908 = _860;
    float _910 = _830;
    if (_896)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _902 = _912;
    }
    float _914 = _902;
    if (_896)
    {
        float _916 = rsqrt(_884);
        _904 = _916;
    }
    float _918 = _904;
    if (_896)
    {
        float _920 = _900 * _914;
        _906 = _920;
    }
    float _922 = _906;
    if (_896)
    {
        float _924 = _922 * 0.15915493667125701904296875;
        _580 = _924;
    }
    float _926 = _580;
    float _928 = _914;
    float _930 = _926;
    if (_896)
    {
        float _932 = _926 * 6.283185482025146484375;
        float _934 = sin(_932);
        _928 = _934;
    }
    float _936 = _928;
    float _938 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _940 = precise::max(0.0, _938);
    float _942 = _828;
    if (_896)
    {
        float _944 = _926 * 6.283185482025146484375;
        float _946 = cos(_944);
        _942 = _946;
    }
    float _948 = _942;
    float _950 = -_868;
    float _952 = -_940;
    float _954 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[24].y, _952);
    float _956 = _954;
    if (_896)
    {
        float _958 = _954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _908 = _958;
    }
    float _960 = _908;
    if (!_896)
    {
        _930 = _870;
    }
    float _962 = _930;
    float _964 = _936;
    float _966 = _962;
    if (_896)
    {
        float _968 = fma(_936, _960, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _964 = _968;
    }
    float _970 = _964;
    float _972 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_896)
    {
        float _974 = _948 + (-1.0);
        _910 = _974;
    }
    float _976 = _910;
    float _978 = _976;
    if (_896)
    {
        float _980 = _918 * _970;
        _532 = _980;
    }
    float _982 = _532;
    float _984 = fma(_466, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _986 = _748 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _988 = _986;
    if (_896)
    {
        float _990 = _976 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _978 = _990;
    }
    float _992 = _978;
    float _994 = _992;
    if (_896)
    {
        float _996 = _870 * _982;
        _966 = _996;
    }
    float _998 = _966;
    if (!_896)
    {
        _972 = _872;
    }
    float _1000 = _972;
    float _1002 = _1000;
    if (_896)
    {
        float _1004 = _872 * _982;
        _1002 = _1004;
    }
    float _1006 = _1002;
    if (_896)
    {
        float _1008 = fma(_954, _948, _992);
        _956 = _1008;
    }
    float _1010 = _956;
    if (!_896)
    {
        _994 = _874;
    }
    float _1012 = _994;
    float _1014 = _1012;
    if (_896)
    {
        float _1016 = _998 * _998;
        _1014 = _1016;
    }
    float _1018 = _1014;
    float _1020 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[2].x, _986);
    if (!_896)
    {
        _988 = _876;
    }
    float _1022 = _988;
    float _1024 = _1022;
    if (_896)
    {
        float _1026 = _1006 * _1006;
        _1024 = _1026;
    }
    float _1028 = _1024;
    float _1030 = fma(_1010, _1010, _1018);
    float _1032 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1020);
    float _1034 = floor(_984);
    float _1036 = _1030 + _1028;
    float _1038 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1040 = _748 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1042 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1044 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1046 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1040);
    float _1048 = rsqrt(_1036);
    float _1050 = -_1044;
    float _1052 = fma(_1050, _1042, 1.0);
    float _1054 = _748 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1056 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1046);
    float _1058 = fma(_462, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1060 = _748 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1062 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1054);
    float _1064 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1066 = floor(_1058);
    float _1068 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1060);
    float _1070 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1062);
    float _1072 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1074 = -_1034;
    float _1076 = _984 + _1074;
    float _1078 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1068);
    float _1080 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1082 = _1048 * _998;
    float _1084 = _1048 * _1010;
    float _1086 = _1048 * _1006;
    float _1088 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1072);
    float _1090 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1092 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1094 = log2(_1052);
    float _1096 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1088);
    float _1098 = -_1090;
    float _1100 = fma(_1084, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1098);
    float _1102 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1104 = -_1066;
    float _1106 = _1058 + _1104;
    float _1108 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1096);
    float _1110 = -_1086;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1100);
    float _1114 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1102);
    float _1116 = _1084 + 1.0;
    float _1118 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1120 = fma(_1112, -0.5, 0.5);
    float _1122 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1114);
    float _1124 = 1.0 / _1108;
    float _1126 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1118);
    float _1128 = _894 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1130 = fma(_1112, 0.5, 0.5);
    float _1132 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1122);
    float _1134 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1126);
    float _1136 = _1094 * 0.693147182464599609375;
    float _1138 = fma(_1130, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1140 = sqrt(_1120);
    float _1142 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1134);
    float _1144 = _1134;
    float _1146 = _1034;
    float _1148 = _1142;
    if (_854)
    {
        _1144 = _1132;
    }
    float _1150 = _1144;
    float _1152 = fma(_1130, _1138, -0.212114393711090087890625);
    float _1154 = _1150;
    if (!_854)
    {
        _1154 = 0.0;
    }
    float _1156 = _1154;
    if (_854)
    {
        _1146 = _1142;
    }
    float _1158 = _1146;
    float2 _3789 = float2(_1076, _1106);
    float _1160 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3789, float2(0.0), isnan(_3789)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3789, float2(0.0), isnan(_3789)), level(0.0)).x;
    float _1162 = exp2(_1128);
    float _1164 = _1158;
    if (!_854)
    {
        _1164 = 0.0;
    }
    float _1166 = _1164;
    float _1168 = _1124 * _1156;
    float _1170 = fma(_1130, _1152, 1.570728778839111328125);
    float _1172 = _1124 * _1166;
    float _1174 = fma(_1168, 0.5, 0.5);
    float _1176 = _1140 * 0.636619746685028076171875;
    float _1178 = _1136 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1180 = fma(_1172, -0.5, 0.5);
    float _1182 = -_1170;
    float _1184 = fma(_1176, _1182, 1.0);
    float _1186 = -_1084;
    float _1188 = fma(_1162, _1116, _1186);
    float3 _3840 = float3(_1174, _1180, _1178);
    float _1190 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3840, float3(0.0), isnan(_3840)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3840, float3(0.0), isnan(_3840)), level(0.0)).x;
    float _1192 = fma(_1188, 0.5, 0.5);
    float3 _3853 = float3(_1174, _1180, _1178);
    float4 _1195 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3853, float3(0.0), isnan(_3853)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3853, float3(0.0), isnan(_3853)), level(0.0)).xyzw;
    float _1197 = _1195.x;
    float _1199 = _1195.y;
    float _1201 = _1195.z;
    float _1203 = _1195.w;
    float2 _3869 = float2(_1184, _1192);
    float3 _1207 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3869, float2(0.0), isnan(_3869)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3869, float2(0.0), isnan(_3869)), level(0.0)).xyz;
    float _1209 = _1207.x;
    float _1211 = _1207.y;
    float _1213 = _1207.z;
    float _1215 = in.m_66.y;
    float _1217 = _522 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1219 = in.m_76.y;
    int _1221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1223 = _1221 != 0;
    float _1225 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1217);
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1229 = _1227 != 0;
    float _1231 = _894 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1233 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1225);
    out.m_78.x = _750;
    out.m_78.y = _748;
    out.m_78.z = _752;
    float _1235 = _1233 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_80.x = 1.0;
    out.m_80.y = 1.0;
    out.m_80.z = 1.0;
    float _1237 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1241 = _1239 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1245 = _1243 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1247 = exp2(_1231);
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1251 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1249);
    bool _1253 = _1215 > 0.5;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1257 = _1255 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1259 = -_1219;
    float _1261 = _1259 + 1.0;
    float _1263 = _522 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1265 = 1.0 / _1241;
    float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1269 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1267);
    float _1271 = _1219;
    float _1273 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1275 = _1269;
    if (_1223)
    {
        float _1277 = _1253 ? _1261 : _1219;
        _1271 = _1277;
    }
    float _1279 = _1271;
    float _1281 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1263);
    float _1283 = _1263;
    if (_1229)
    {
        float _1285 = in.m_66.x;
        _1283 = _1285;
    }
    float _1287 = _1283;
    float _1289 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1281);
    float _1291 = 1.0 / _1245;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1297 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1299 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1305 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1309 = 1.0 / _1297;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1313 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1311;
    float _1315 = _1235 + _1297;
    float _1317 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1319;
    float _1323 = _1303 * _1265;
    bool _1325 = _381 != 0.0;
    bool _1327 = isnan(_381);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan(0.0);
    bool _1333 = _1329 || _1331;
    float _1335 = _1313 * _1291;
    float _1337 = 1.0 / _1257;
    out.m_82.x = _1299;
    out.m_82.y = _1317;
    out.m_82.z = _1305;
    bool _1339 = _379 == 0.0;
    bool _1341 = !_1333;
    bool _1343 = _1339 && _1341;
    float _1345 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1347 = _363 + _1345;
    bool _1349 = _1287 > 0.5;
    bool _1351 = _1349 && _1229;
    float _1353 = in.m_84.x;
    float _1355 = in.m_84.y;
    float _1357 = in.m_84.z;
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1361 = _363 + _1359;
    bool _1363 = _383 == 0.0;
    bool _1365 = _1363 && _1343;
    float _1367 = _1315 * _1309;
    float _1369 = _1367 * 0.5;
    float _1371 = in.m_76.x;
    float _1373 = fma(_1335, _1361, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1375 = fma(_1323, _1347, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1377 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1379 = isnan(_363);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1385 = _1381 || _1383;
    float _1387 = float(_1385);
    float _1389 = -_1247;
    float _1391 = _1389 + 1.0;
    float _1393 = _1321 * _1337;
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1397 = _363 + _1395;
    bool _1399 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1401 = isnan(_363);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1407 = _1403 || _1405;
    float _1409 = float(_1407);
    float _1411 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1413 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1411);
    bool _1415 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1417 = isnan(_363);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1423 = _1419 || _1421;
    float _1425 = float(_1423);
    float _1427 = fma(_1393, _1397, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1429 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1431 = isnan(_363);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1437 = _1433 || _1435;
    float _1439 = float(_1437);
    float _1441 = -_1387;
    float _1443 = _1441 + 1.0;
    bool _1445 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1447 = isnan(0.0);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1453 = _1449 || _1451;
    float _1455 = 1.0 / _1413;
    float _1457 = -_1409;
    float _1459 = _1457 + 1.0;
    float _1461 = _1391 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1463 = as_type<int>((*spvDescriptorSet0.vp_c8)._m0[30].y);
    float _1465 = _1393;
    if (!_854)
    {
        float _1467 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _1463 = as_type<int>(_1467);
    }
    int _1469 = _1463;
    float _1471 = _1355;
    float _1473 = _1357;
    float _1475 = _1353;
    if (!_1365)
    {
        float _1477 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1355);
        _1471 = _1477;
    }
    float _1479 = _1471;
    float _1481 = _1439 * _1443;
    float _1483 = -_1439;
    float _1485 = _1483 + 1.0;
    if (!_1365)
    {
        float _1487 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1357);
        _1473 = _1487;
    }
    float _1489 = _1473;
    float _1491 = _1371;
    if (_1229)
    {
        _1465 = _1371;
    }
    float _1493 = _1465;
    float _1495 = _1373 * _1481;
    float _1497 = _307 * _1479;
    float _1499 = _315 * _1479;
    float _1501 = _319 * _1479;
    float _1503 = _1493;
    if (_1351)
    {
        float _1505 = -_1493;
        float _1507 = _1505 + 1.0;
        _1503 = _1507;
    }
    float _1509 = _1503;
    float _1511 = fma(_1485, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1495);
    float _1513 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1251);
    float _1515 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1517 = _1455 * _1515;
    float _1519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1229)
    {
        _1491 = _1509;
    }
    float _1521 = _1491;
    float _1523 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1269);
    if (_1453)
    {
        float _1525 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1273 = _1525;
    }
    float _1527 = _1273;
    if (!_1365)
    {
        float _1529 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1353);
        _1475 = _1529;
    }
    float _1531 = _1475;
    float _1533 = _1425 * _1459;
    float _1535 = _466 + _1513;
    float _1537 = _462 + _1523;
    float _1539 = abs(_1517);
    float _1541 = log2(_1539);
    if (_1453)
    {
        float _1543 = precise::min(_1527, 20.0);
        _1275 = _1543;
    }
    float _1545 = _1275;
    float _1547 = -_1425;
    float _1549 = _1547 + 1.0;
    float _1551 = fma(_291, _1531, _1501);
    float _1553 = -_1535;
    float _1555 = _1553 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1557 = -_1537;
    float _1559 = _1557 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1561 = _1387 * _1549;
    float _1563 = fma(_287, _1531, _1499);
    float _1565 = _1545;
    if (_1453)
    {
        float _1567 = 1.0 / _1545;
        _1565 = _1567;
    }
    float _1569 = _1565;
    float _1571 = precise::min(_1535, _1555);
    float _1573 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1575 = precise::min(_1537, _1559);
    float _1577 = fma(_327, _1489, _1563);
    float _1579 = fma(_283, _1531, _1497);
    if (!_1453)
    {
        _329 = 1.0;
    }
    float _1581 = _329;
    float _1583 = fma(_1375, _1561, _1511);
    float _1585 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1587 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1591 = precise::min(_1571, _1575);
    float _1593 = fma(_1427, _1533, _1583);
    float _1595 = _1587 * _1519;
    float _1597 = in.m_74.x;
    float _1599 = _1581;
    if (_1453)
    {
        float _1601 = _1591 * _1569;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        _1599 = _1603;
    }
    float _1605 = _1599;
    float _1607 = exp2(_1585);
    float _1609 = fma(_323, _1489, _1579);
    bool _1611 = _1517 <= 8000.0;
    bool _1613 = isnan(_1517);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(8000.0);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    float _1623 = fma(_333, _1489, _1551);
    float _1625 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1593);
    float _1627 = _1577 * _556;
    float _1629 = _1577 * _656;
    float _1631 = _1573 * _1589;
    float _1633 = _1577 * _570;
    float _1635 = _1625 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1637 = fma(_1609, _658, _1627);
    float _1639 = fma(_1609, _564, _1629);
    out.m_86.x = _1631;
    out.m_86.y = _1595;
    float _1641 = fma(_1609, _568, _1633);
    float _1643 = fma(_1607, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1645 = precise::clamp(_1643, 0.0, 1.0);
    float _1647 = fma(_1623, _558, _1637);
    float _1649 = fma(_1623, _562, _1639);
    float _1651 = fma(_1645, -2.0, 3.0);
    float _1653 = _1645 * _1645;
    float _1655 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1657 = fma(_1623, _666, _1641);
    float _1659 = _1653 * _1651;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1665 = -_1659;
    float _1667 = _1665 + 1.0;
    float _1669 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1655);
    float _1671 = _1661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1675 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1659);
    float _1677 = _1663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1679 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1669);
    float _1681 = _1673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1683 = _1621 * _1675;
    out.m_88.x = _1647;
    out.m_88.y = _1649;
    out.m_88.z = _1657;
    float _1685 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1679);
    bool _1687 = _862 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1689 = isnan(_862);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1695 = _1691 || _1693;
    float _1697 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_90.x = _1677;
    out.m_90.y = _1681;
    out.m_90.z = _1671;
    out.m_90.w = _1635;
    float _1699 = _1605 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1701 = _1685 + _1108;
    out.gl_Position.x = _1132;
    out.gl_Position.y = _1142;
    out.gl_Position.z = _1685;
    out.gl_Position.w = _1108;
    float _1703 = _1699 * _826;
    float _1705 = _1701;
    float _1707 = _1635;
    if (!_854)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4730 = as_type<float>(_1469);
        out.gl_Position.z = _4730;
    }
    float _1709 = _1701 * 0.5;
    float _1711 = _1108;
    float _1713 = _1709;
    float _1715 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (_854)
    {
        _1148 = _1703;
    }
    float _1717 = _1148;
    float _1719 = _1717;
    if (!_854)
    {
        _1719 = 0.0;
    }
    float _1721 = _1719;
    out.m_92.z = _1709;
    out.m_92.w = _1108;
    if (!_1695)
    {
        _1705 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1723 = _1705;
    float _1725 = _1723;
    float _1727 = _1723;
    if (!_1695)
    {
        _1707 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1729 = _1707;
    float _1731 = _1729;
    float _1733 = _1729;
    if (!_1695)
    {
        _1711 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1735 = _1711;
    float _1737 = _1735;
    float _1739 = _1735;
    if (!_1695)
    {
        _1713 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1741 = _1713;
    float _1743 = -_1160;
    float _1745 = _1743 + 1.0;
    float _1747 = _1745 * _1697;
    float _1749 = precise::clamp(_1747, 0.0, 1.0);
    float _1751 = -_1749;
    float _1753 = fma(_1751, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1755 = _1741;
    float _1757 = _1741;
    if (!_1695)
    {
        _1715 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1759 = _1715;
    float _1761 = _1753 * _1597;
    float _1763 = _1761 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1765 = _1461 * _1190;
    float _1767 = -_1461;
    float _1769 = _1767 + 1.0;
    out.m_94.x = _1763;
    float _1771 = _1203 * _1765;
    float _1773 = _1203 * _1769;
    float _1775 = _1213 * _1765;
    float _1777 = fma(_1209, _1771, _1197);
    float _1779 = fma(_1211, _1771, _1199);
    float _1781 = _1765;
    float _1783 = _1759;
    float _1785 = _1759;
    if (!_1695)
    {
        _1781 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1787 = _1781;
    float _1789 = fma(_1203, _1775, _1201);
    out.m_96.x = _1777;
    out.m_96.y = _1779;
    out.m_96.z = _1789;
    out.m_96.w = _1773;
    bool _1791 = !_1695;
    float _1793 = _1787;
    float _1795 = _1787;
    if (!_1791)
    {
        bool _1797 = _862 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1799 = isnan(_862);
        bool _1801 = _1797 || _1799;
        bool _1803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1805 = _1801 || _1803;
        if (!_1805)
        {
            float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1809 = _862 + _1807;
            float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1813 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1811;
            float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1819 = 1.0 / _1813;
            float _1821 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1823 = _1821 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1825 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1827 = _1825 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1829 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1831 = _1829 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1833 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1835 = _1833 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1837 = _1809 * _1819;
            float _1839 = precise::clamp(_1837, 0.0, 1.0);
            float _1841 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1843 = _1841 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1845 = fma(_1839, _1817, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1847 = fma(_1839, _1843, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1849 = fma(_1839, _1823, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1851 = fma(_1839, _1827, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1853 = fma(_1839, _1831, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1855 = fma(_1839, _1835, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1795 = _1849;
            _1739 = _1853;
            _1727 = _1845;
            _1785 = _1851;
            _1733 = _1847;
            _1757 = _1855;
            _1857 = true;
        }
        else
        {
            bool _1859 = _862 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1861 = isnan(_862);
            bool _1863 = _1859 || _1861;
            bool _1865 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1867 = _1863 || _1865;
            if (!_1867)
            {
                _1725 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1869 = _1725;
            _1727 = _1869;
            if (!_1867)
            {
                _1793 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1871 = _1793;
            _1795 = _1871;
            if (!_1867)
            {
                _1731 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1873 = _1731;
            _1733 = _1873;
            if (!_1867)
            {
                _1783 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1875 = _1783;
            _1785 = _1875;
            if (!_1867)
            {
                _1737 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1877 = _1737;
            _1739 = _1877;
            if (!_1867)
            {
                _1755 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1879 = _1755;
            bool _1881 = !_1867;
            _1757 = _1879;
            if (!_1881)
            {
                bool _1883 = _862 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1885 = isnan(_862);
                bool _1887 = _1883 || _1885;
                bool _1889 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1891 = _1887 || _1889;
                if (!_1891)
                {
                    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1895 = _862 + _1893;
                    float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1899 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1897;
                    float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1905 = 1.0 / _1899;
                    float _1907 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1909 = _1907 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1911 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1913 = _1911 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1915 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1917 = _1915 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1919 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1921 = _1919 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1923 = _1895 * _1905;
                    float _1925 = precise::clamp(_1923, 0.0, 1.0);
                    float _1927 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1929 = _1927 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1931 = fma(_1925, _1903, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1933 = fma(_1925, _1929, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1935 = fma(_1925, _1909, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1937 = fma(_1925, _1913, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1939 = fma(_1925, _1917, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1941 = fma(_1925, _1921, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1795 = _1935;
                    _1739 = _1939;
                    _1727 = _1931;
                    _1785 = _1937;
                    _1733 = _1933;
                    _1757 = _1941;
                    _1857 = true;
                }
                else
                {
                    _1795 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1739 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1727 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1785 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1733 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1757 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1857 = false;
    float _1943 = _1795;
    float _1945 = _1739;
    float _1947 = _1727;
    float _1949 = _1785;
    float _1951 = _1733;
    float _1953 = _1757;
    float _1955 = fma(_1649, -0.5, 0.5);
    float _1957 = precise::clamp(_1955, 0.0, 1.0);
    float _1959 = -_1943;
    float _1961 = _1959 + _1945;
    float _1963 = -_1947;
    float _1965 = _1963 + _1949;
    float _1967 = -_1951;
    float _1969 = _1967 + _1953;
    bool _1971 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1973 = fma(_1957, _1961, _1943);
    float _1975 = fma(_1957, _1965, _1947);
    float _1977 = fma(_1957, _1969, _1951);
    float _1979 = _1721 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1981 = _1973 * 0.586610972881317138671875;
    out.m_56.x = 1.0;
    float _1983 = fma(_1975, 0.298911988735198974609375, _1981);
    out.m_94.w = _1979;
    float _1985 = fma(_1977, 0.114477999508380889892578125, _1983);
    out.m_98.x = 0.0;
    float _1987 = -_1985;
    float _1989 = _1975 + _1987;
    float _1991 = -_1985;
    float _1993 = _1973 + _1991;
    float _1995 = -_1985;
    float _1997 = _1977 + _1995;
    float _1999 = fma(_1989, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1985);
    float _2001 = fma(_1993, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1985);
    float _2003 = fma(_1997, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1985);
    out.m_100.x = 0.0;
    out.m_102.x = _1999;
    out.m_102.y = _2001;
    out.m_102.z = _2003;
    if (!_1971)
    {
        return out;
    }
    float _2005 = -_748;
    float _2007 = _2005 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2009 = -_750;
    float _2011 = _2009 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2013 = -_752;
    float _2015 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2017 = _2007 * _2007;
    float _2019 = fma(_2011, _2011, _2017);
    float _2021 = fma(_2015, _2015, _2019);
    float _2023 = rsqrt(_2021);
    float _2025 = sqrt(_2021);
    float _2027 = _2007 * _2023;
    float _2029 = _2011 * _2023;
    float _2031 = _2015 * _2023;
    float _2033 = -_868;
    float _2035 = _2033 + _2027;
    float _2037 = -_864;
    float _2039 = _2037 + _2029;
    float _2041 = -_866;
    float _2043 = _2041 + _2031;
    float _2045 = _2035 * _2035;
    float _2047 = -_2025;
    float _2049 = _2047 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2051 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2053 = precise::clamp(_2051, 0.0, 1.0);
    float _2055 = fma(_2039, _2039, _2045);
    float _2057 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2059 = precise::clamp(_2057, 0.0, 1.0);
    float _2061 = _2053 * _2053;
    float _2063 = fma(_2043, _2043, _2055);
    float _2065 = _2061 + (-1.0);
    float _2067 = abs(_2059);
    float _2069 = log2(_2067);
    float _2071 = rsqrt(_2063);
    float _2073 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2075 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2077 = exp2(_2073);
    float _2079 = _2035 * _2071;
    float _2081 = _2039 * _2071;
    float _2083 = _2043 * _2071;
    float _2085 = _1649 * _2079;
    float _2087 = fma(_1647, _2081, _2085);
    float _2089 = fma(_1657, _2083, _2087);
    float _2091 = precise::clamp(_2089, 0.0, 1.0);
    float _2093 = _2091 * _2091;
    float _2095 = fma(_2093, _2065, 1.0);
    float _2097 = -_2027;
    float _2099 = -_2075;
    float _2101 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2099);
    float _2103 = _1649 * _2027;
    float _2105 = _2095 * _2095;
    float _2107 = -_2031;
    float _2109 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2101);
    float _2111 = fma(_1647, _2029, _2103);
    float _2113 = 1.0 / _2105;
    float _2115 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2117 = _2109 + _2115;
    float _2119 = fma(_1657, _2031, _2111);
    float _2121 = precise::clamp(_2119, 0.0, 1.0);
    float _2123 = _2117 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2125 = precise::clamp(_2123, 0.0, 1.0);
    float _2127 = _2077 * _2125;
    float _2129 = _2121 * _2127;
    float _2131 = _2061 * _2113;
    float _2133 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2135 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2137 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2139 = _2129 * _2131;
    float _2141 = _2139 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2143 = _2139 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2145 = _2139 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _2133;
    out.m_98.y = _2135;
    out.m_98.z = _2137;
    out.m_100.x = _2141;
    out.m_100.y = _2143;
    out.m_100.z = _2145;
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
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1857 = false;
    bool _355 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_53.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_56.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2202 = as_type<float>(_137);
        out.gl_Position.z = _2202;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_58.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = 0.0;
    if (_151)
    {
        float _159 = float(_121);
        _157 = _159;
    }
    float _161 = _157;
    bool _163 = _155 >= _161;
    bool _165 = !_151;
    bool _167 = _163 || _165;
    if (_167)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _131;
    if (_167)
    {
        out.m_56.x = 0.0;
    }
    if (_167)
    {
        float _171 = _169 * 5.0;
        _139 = as_type<int>(_171);
    }
    int _173 = _139;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2270 = as_type<float>(_173);
        out.gl_Position.z = _2270;
    }
    if (_167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _175 = in.m_60.x;
    float _177 = in.m_60.y;
    float _179 = in.m_60.z;
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    float _187 = in.m_64.x;
    float _189 = in.m_64.y;
    float _191 = in.m_64.z;
    float _193 = _175 * _175;
    float _195 = _177 * _177;
    float _197 = _179 * _179;
    float _199 = fma(_181, _181, _193);
    float _201 = fma(_183, _183, _195);
    float _203 = fma(_185, _185, _197);
    float _205 = fma(_187, _187, _199);
    float _207 = fma(_189, _189, _201);
    float _209 = fma(_191, _191, _203);
    float _211 = sqrt(_205);
    float _213 = sqrt(_207);
    float _215 = sqrt(_209);
    bool _217 = _211 > 0.0;
    bool _219 = _213 > 0.0;
    float _221 = _213;
    float _223 = _211;
    float _225 = _209;
    if (_217)
    {
        float _227 = rsqrt(_205);
        _221 = _227;
    }
    float _229 = _221;
    float _231 = 0.0;
    if (!_217)
    {
        _231 = 0.0;
    }
    float _233 = _231;
    bool _235 = _215 > 0.0;
    float _237 = 0.0;
    float _239 = _233;
    if (!_217)
    {
        _237 = 0.0;
    }
    float _241 = _237;
    float _243 = _241;
    if (!_217)
    {
        _223 = 0.0;
    }
    float _245 = _223;
    float _247 = 0.0;
    float _249 = _245;
    if (_219)
    {
        float _251 = rsqrt(_207);
        _247 = _251;
    }
    float _253 = _247;
    float _255 = 0.0;
    if (!_219)
    {
        _255 = 0.0;
    }
    float _257 = _255;
    float _259 = 0.0;
    float _261 = _257;
    if (!_219)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    if (!_219)
    {
        _265 = 0.0;
    }
    float _269 = _265;
    float _271 = _215;
    float _273 = _269;
    if (_235)
    {
        float _275 = rsqrt(_209);
        _271 = _275;
    }
    float _277 = _271;
    float _279 = _229;
    if (_217)
    {
        float _281 = _229 * _181;
        _239 = _281;
    }
    float _283 = _239;
    if (_217)
    {
        float _285 = _229 * _175;
        _243 = _285;
    }
    float _287 = _243;
    if (_217)
    {
        float _289 = _229 * _187;
        _249 = _289;
    }
    float _291 = _249;
    bool _293 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _295 = 0.0;
    if (!_235)
    {
        _295 = 0.0;
    }
    float _297 = _295;
    float _299 = _297;
    if (!_235)
    {
        _279 = 0.0;
    }
    float _301 = _279;
    float _303 = _301;
    if (_219)
    {
        float _305 = _253 * _183;
        _261 = _305;
    }
    float _307 = _261;
    if (!_235)
    {
        _225 = 0.0;
    }
    float _309 = _225;
    float _311 = _309;
    if (_219)
    {
        float _313 = _253 * _177;
        _267 = _313;
    }
    float _315 = _267;
    if (_219)
    {
        float _317 = _253 * _189;
        _273 = _317;
    }
    float _319 = _273;
    if (_235)
    {
        float _321 = _277 * _185;
        _299 = _321;
    }
    float _323 = _299;
    if (_235)
    {
        float _325 = _277 * _179;
        _311 = _325;
    }
    float _327 = _311;
    float _329 = _327;
    if (_235)
    {
        float _331 = _277 * _191;
        _303 = _331;
    }
    float _333 = _303;
    bool _335 = !_293;
    float _353;
    if (!_335)
    {
        float _337 = in.m_66.x;
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _341 = _337 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[11].y, _155);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_121);
        float _359 = 1.0 / _357;
        float _361 = _155 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = in.m_68.w;
    float _367 = in.m_53.x;
    float _369 = in.m_53.y;
    float _371 = in.m_53.z;
    float _373 = in.m_70.x;
    float _375 = in.m_70.y;
    float _377 = in.m_70.z;
    float _379 = in.m_72.x;
    float _381 = in.m_72.y;
    float _383 = in.m_72.z;
    float _385 = in.m_64.w;
    float _387 = in.m_62.w;
    float _389 = trunc(_365);
    int _391 = int(_389);
    int _393 = _391 << 5;
    uint _396 = uint(int(uint(_393) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_396)];
    float _398 = as_type<float>(_dmw0.x);
    int _400 = _393 + 4;
    uint _402 = uint(int(uint(_400) >> uint(2)));
    float _404 = as_type<float>(_dmw0.y);
    int _406 = _393 + 8;
    uint _408 = uint(int(uint(_406) >> uint(2)));
    float _410 = as_type<float>(_dmw0.z);
    int _412 = _393 + 12;
    uint _414 = uint(int(uint(_412) >> uint(2)));
    float _416 = as_type<float>(_dmw0.w);
    float _418 = _189 * _369;
    float _420 = _375 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _422 = _373 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _379);
    float _426 = fma(_187, _367, _418);
    float _428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _381);
    float _430 = _420 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _432 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _434 = _377 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _436 = _183 * _369;
    float _438 = _430 * _428;
    float _440 = _432 * _424;
    float _442 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _383);
    float _444 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _446 = _438 * _319;
    float _448 = fma(_181, _367, _436);
    float _450 = _438 * _307;
    float _452 = fma(_191, _371, _426);
    float _454 = _444 * _442;
    float _456 = fma(_440, _291, _446);
    float _458 = fma(_185, _371, _448);
    float _460 = fma(_440, _283, _450);
    float _462 = _452 + _385;
    float _464 = fma(_454, _333, _456);
    float _466 = _458 + _387;
    float _468 = fma(_454, _323, _460);
    float _470 = in.m_60.w;
    float _472 = _462 + _464;
    float _474 = _177 * _369;
    float _476 = _466 + _468;
    float _478 = _438 * _315;
    float _480 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _482 = _472 + _480;
    float _484 = fma(_175, _367, _474);
    float _486 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _488 = _476 + _486;
    float _490 = fma(_440, _287, _478);
    float _492 = _482 * _482;
    float _494 = fma(_179, _371, _484);
    float _496 = fma(_454, _327, _490);
    float _498 = fma(_488, _488, _492);
    bool _500 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _502 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _504 = _500 || _502;
    bool _506 = isnan(0.5);
    bool _508 = _504 || _506;
    float _510 = sqrt(_498);
    bool _512 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _514 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _516 = _512 || _514;
    bool _518 = isnan(0.5);
    bool _520 = _516 || _518;
    float _522 = _494 + _470;
    float _524 = _522 + _496;
    bool _526 = _510 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _528 = _494;
    float _530 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _532 = _454;
    if (!_526)
    {
        _528 = _476;
    }
    float _534 = _528;
    float _536 = _534;
    if (!_526)
    {
        _530 = _524;
    }
    float _538 = _530;
    float _540 = _416 * 2.0;
    float _542 = _398 * 2.0;
    float _544 = _404 * 2.0;
    float _546 = _398 * _398;
    float _548 = _410 * _540;
    float _550 = _404 * _540;
    float _552 = _398 * _540;
    float _554 = -_548;
    float _556 = fma(_404, _542, _554);
    float _558 = fma(_410, _542, _550);
    float _560 = -_552;
    float _562 = fma(_410, _544, _560);
    float _564 = fma(_404, _542, _548);
    float _566 = -_550;
    float _568 = fma(_410, _542, _566);
    float _570 = fma(_410, _544, _552);
    float _572 = _404 * _404;
    float _574 = _410 * _410;
    float _576 = _542;
    float _578 = _538;
    float _580 = _574;
    if (!_526)
    {
        _576 = _472;
    }
    float _582 = _576;
    bool _584 = !_526;
    float _586 = _582;
    if (!_584)
    {
        float _588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _592 = _510 + _590;
        float _594 = rsqrt(_498);
        float _596 = _592 * _588;
        float _598 = _524 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _600 = _596 * 0.15915493667125701904296875;
        float _602 = _600 * 6.283185482025146484375;
        float _604 = sin(_602);
        float _606 = _600 * 6.283185482025146484375;
        float _608 = cos(_606);
        float _610 = fma(_604, _598, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _612 = _594 * _610;
        float _614 = _608 + (-1.0);
        float _616 = _614 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _618 = fma(_488, _612, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _620 = fma(_482, _612, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _622 = fma(_524, _608, _616);
        _578 = _622;
        _536 = _618;
        _586 = _620;
    }
    float _624 = _578;
    float _626 = _536;
    float _628 = _586;
    float _630 = -_522;
    float _632 = _630 + _624;
    float _634 = -_466;
    float _636 = _634 + _626;
    float _638 = -_462;
    float _640 = _638 + _628;
    float _642 = fma(_546, -2.0, 1.0);
    float _644 = _632 * _315;
    float _646 = _632 * _287;
    float _648 = fma(_572, -2.0, 1.0);
    float _650 = _632 * _327;
    float _652 = fma(_636, _307, _644);
    float _654 = fma(_636, _283, _646);
    float _656 = fma(_574, -2.0, _642);
    float _658 = fma(_574, -2.0, _648);
    float _660 = fma(_640, _319, _652);
    float _662 = fma(_636, _323, _650);
    float _664 = fma(_640, _291, _654);
    float _666 = fma(_572, -2.0, _642);
    float _668 = _660 * _556;
    float _670 = _660 * _656;
    float _672 = _660 * _570;
    float _674 = fma(_640, _333, _662);
    float _676 = fma(_664, _658, _668);
    float _678 = fma(_664, _564, _670);
    float _680 = fma(_664, _568, _672);
    float _682 = 0.0;
    float _684 = _654;
    if (_508)
    {
        _682 = 1.0;
    }
    float _686 = _682;
    float _688 = fma(_674, _558, _676);
    float _690 = fma(_674, _562, _678);
    float _692 = fma(_674, _666, _680);
    float _694 = _466 + _688;
    float _696 = _522 + _690;
    float _698 = _462 + _692;
    float _700 = _696;
    float _702 = _694;
    float _704 = _698;
    float _706 = _686;
    float _708 = _690;
    if (!_520)
    {
        float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _712 = _522 + _710;
        float _714 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _716 = _466 + _714;
        float _718 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _720 = _712 * _712;
        float _722 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _724 = _462 + _722;
        float _726 = fma(_716, _716, _720);
        float _728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _730 = fma(_724, _724, _726);
        float _732 = sqrt(_730);
        float _734 = _718 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _736 = precise::min(_732, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _738 = _736 * _728;
        float _740 = _734 * _738;
        float _742 = fma(_688, _740, _466);
        float _744 = fma(_690, _740, _522);
        float _746 = fma(_692, _740, _462);
        _700 = _744;
        _702 = _742;
        _704 = _746;
    }
    float _748 = _700;
    float _750 = _702;
    float _752 = _704;
    if (!_508)
    {
        float _754 = in.m_74.w;
        int _756 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _758 = _756 == 4;
        bool _760 = _756 == 8;
        bool _762 = _756 == 12;
        int _764 = as_type<int>(_754) << 16;
        int _766 = as_type<int>(_754) << 8;
        int _768 = as_type<int>(_754) << 24;
        int _770 = _764 >> 24;
        int _772 = _766 >> 24;
        int _774 = as_type<int>(_754) >> 24;
        int _776 = _768 >> 24;
        float _778 = float(_770);
        float _780 = float(_772);
        float _782 = float(_774);
        float _784 = _778 * 0.0078740157186985015869140625;
        float _786 = float(_776);
        float _788 = _780 * 0.0078740157186985015869140625;
        float _790 = _782 * 0.0078740157186985015869140625;
        float _792 = precise::min(_784, 1.0);
        float _794 = _786 * 0.0078740157186985015869140625;
        float _796 = precise::min(_788, 1.0);
        float _798 = precise::min(_790, 1.0);
        float _800 = precise::min(_794, 1.0);
        float _802 = precise::max(_792, -1.0);
        float _804 = precise::max(_796, -1.0);
        float _806 = precise::max(_798, -1.0);
        float _808 = precise::max(_800, -1.0);
        float _810 = _808;
        _708 = _804;
        _684 = as_type<float>(_756);
        if (_758)
        {
            _810 = _802;
        }
        float _812 = _810;
        float _814 = _812;
        if (_760)
        {
            _814 = _804;
        }
        float _816 = _814;
        float _818 = _816;
        if (_762)
        {
            _818 = _806;
        }
        float _820 = _818;
        float _822 = abs(_820);
        float _824 = (-0.0) + _822;
        _706 = _824;
    }
    float _826 = _706;
    float _828 = _708;
    float _830 = _684;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _834 = _748 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _838 = _750 + _836;
    float _840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _842 = _752 + _840;
    float _844 = _834 * _834;
    bool _846 = _826 != 0.0;
    bool _848 = isnan(_826);
    bool _850 = _846 || _848;
    bool _852 = isnan(0.0);
    bool _854 = _850 || _852;
    float _856 = fma(_838, _838, _844);
    float _858 = fma(_842, _842, _856);
    float _860 = rsqrt(_858);
    float _862 = sqrt(_858);
    float _864 = _838 * _860;
    float _866 = _842 * _860;
    float _868 = _834 * _860;
    float _870 = _864 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _872 = _866 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _874 = _870 * _870;
    float _876 = _872 * _872;
    float _878 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _880 = fma(_862, (*spvDescriptorSet0.vp_c15)._m0[23].w, _878);
    float _882 = precise::clamp(_880, 0.0, 1.0);
    float _884 = _874 + _876;
    float _886 = -_882;
    float _888 = _886 + 1.0;
    float _890 = sqrt(_884);
    float _892 = abs(_888);
    float _894 = log2(_892);
    bool _896 = _890 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _898 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _900 = _890 + _898;
    float _902 = _856;
    float _904 = _884;
    float _906 = _900;
    float _908 = _860;
    float _910 = _830;
    if (_896)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _902 = _912;
    }
    float _914 = _902;
    if (_896)
    {
        float _916 = rsqrt(_884);
        _904 = _916;
    }
    float _918 = _904;
    if (_896)
    {
        float _920 = _900 * _914;
        _906 = _920;
    }
    float _922 = _906;
    if (_896)
    {
        float _924 = _922 * 0.15915493667125701904296875;
        _580 = _924;
    }
    float _926 = _580;
    float _928 = _914;
    float _930 = _926;
    if (_896)
    {
        float _932 = _926 * 6.283185482025146484375;
        float _934 = sin(_932);
        _928 = _934;
    }
    float _936 = _928;
    float _938 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _940 = precise::max(0.0, _938);
    float _942 = _828;
    if (_896)
    {
        float _944 = _926 * 6.283185482025146484375;
        float _946 = cos(_944);
        _942 = _946;
    }
    float _948 = _942;
    float _950 = -_868;
    float _952 = -_940;
    float _954 = fma(_950, (*spvDescriptorSet0.vp_c15)._m0[24].y, _952);
    float _956 = _954;
    if (_896)
    {
        float _958 = _954 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _908 = _958;
    }
    float _960 = _908;
    if (!_896)
    {
        _930 = _870;
    }
    float _962 = _930;
    float _964 = _936;
    float _966 = _962;
    if (_896)
    {
        float _968 = fma(_936, _960, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _964 = _968;
    }
    float _970 = _964;
    float _972 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_896)
    {
        float _974 = _948 + (-1.0);
        _910 = _974;
    }
    float _976 = _910;
    float _978 = _976;
    if (_896)
    {
        float _980 = _918 * _970;
        _532 = _980;
    }
    float _982 = _532;
    float _984 = fma(_466, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _986 = _748 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _988 = _986;
    if (_896)
    {
        float _990 = _976 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _978 = _990;
    }
    float _992 = _978;
    float _994 = _992;
    if (_896)
    {
        float _996 = _870 * _982;
        _966 = _996;
    }
    float _998 = _966;
    if (!_896)
    {
        _972 = _872;
    }
    float _1000 = _972;
    float _1002 = _1000;
    if (_896)
    {
        float _1004 = _872 * _982;
        _1002 = _1004;
    }
    float _1006 = _1002;
    if (_896)
    {
        float _1008 = fma(_954, _948, _992);
        _956 = _1008;
    }
    float _1010 = _956;
    if (!_896)
    {
        _994 = _874;
    }
    float _1012 = _994;
    float _1014 = _1012;
    if (_896)
    {
        float _1016 = _998 * _998;
        _1014 = _1016;
    }
    float _1018 = _1014;
    float _1020 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[2].x, _986);
    if (!_896)
    {
        _988 = _876;
    }
    float _1022 = _988;
    float _1024 = _1022;
    if (_896)
    {
        float _1026 = _1006 * _1006;
        _1024 = _1026;
    }
    float _1028 = _1024;
    float _1030 = fma(_1010, _1010, _1018);
    float _1032 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1020);
    float _1034 = floor(_984);
    float _1036 = _1030 + _1028;
    float _1038 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1040 = _748 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1042 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1044 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1046 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1040);
    float _1048 = rsqrt(_1036);
    float _1050 = -_1044;
    float _1052 = fma(_1050, _1042, 1.0);
    float _1054 = _748 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1056 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1046);
    float _1058 = fma(_462, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1060 = _748 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1062 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1054);
    float _1064 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1066 = floor(_1058);
    float _1068 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1060);
    float _1070 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1062);
    float _1072 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1074 = -_1034;
    float _1076 = _984 + _1074;
    float _1078 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1068);
    float _1080 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1082 = _1048 * _998;
    float _1084 = _1048 * _1010;
    float _1086 = _1048 * _1006;
    float _1088 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1072);
    float _1090 = _1082 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1092 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1094 = log2(_1052);
    float _1096 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1088);
    float _1098 = -_1090;
    float _1100 = fma(_1084, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1098);
    float _1102 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1104 = -_1066;
    float _1106 = _1058 + _1104;
    float _1108 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1096);
    float _1110 = -_1086;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1100);
    float _1114 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1102);
    float _1116 = _1084 + 1.0;
    float _1118 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1120 = fma(_1112, -0.5, 0.5);
    float _1122 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1114);
    float _1124 = 1.0 / _1108;
    float _1126 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1118);
    float _1128 = _894 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1130 = fma(_1112, 0.5, 0.5);
    float _1132 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1122);
    float _1134 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1126);
    float _1136 = _1094 * 0.693147182464599609375;
    float _1138 = fma(_1130, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1140 = sqrt(_1120);
    float _1142 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1134);
    float _1144 = _1134;
    float _1146 = _1034;
    float _1148 = _1142;
    if (_854)
    {
        _1144 = _1132;
    }
    float _1150 = _1144;
    float _1152 = fma(_1130, _1138, -0.212114393711090087890625);
    float _1154 = _1150;
    if (!_854)
    {
        _1154 = 0.0;
    }
    float _1156 = _1154;
    if (_854)
    {
        _1146 = _1142;
    }
    float _1158 = _1146;
    float2 _3789 = float2(_1076, _1106);
    float _1160 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3789, float2(0.0), isnan(_3789)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3789, float2(0.0), isnan(_3789)), level(0.0)).x;
    float _1162 = exp2(_1128);
    float _1164 = _1158;
    if (!_854)
    {
        _1164 = 0.0;
    }
    float _1166 = _1164;
    float _1168 = _1124 * _1156;
    float _1170 = fma(_1130, _1152, 1.570728778839111328125);
    float _1172 = _1124 * _1166;
    float _1174 = fma(_1168, 0.5, 0.5);
    float _1176 = _1140 * 0.636619746685028076171875;
    float _1178 = _1136 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1180 = fma(_1172, -0.5, 0.5);
    float _1182 = -_1170;
    float _1184 = fma(_1176, _1182, 1.0);
    float _1186 = -_1084;
    float _1188 = fma(_1162, _1116, _1186);
    float3 _3840 = float3(_1174, _1180, _1178);
    float _1190 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3840, float3(0.0), isnan(_3840)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3840, float3(0.0), isnan(_3840)), level(0.0)).x;
    float _1192 = fma(_1188, 0.5, 0.5);
    float3 _3853 = float3(_1174, _1180, _1178);
    float4 _1195 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3853, float3(0.0), isnan(_3853)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3853, float3(0.0), isnan(_3853)), level(0.0)).xyzw;
    float _1197 = _1195.x;
    float _1199 = _1195.y;
    float _1201 = _1195.z;
    float _1203 = _1195.w;
    float2 _3869 = float2(_1184, _1192);
    float3 _1207 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3869, float2(0.0), isnan(_3869)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3869, float2(0.0), isnan(_3869)), level(0.0)).xyz;
    float _1209 = _1207.x;
    float _1211 = _1207.y;
    float _1213 = _1207.z;
    float _1215 = in.m_66.y;
    float _1217 = _522 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1219 = in.m_76.y;
    int _1221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1223 = _1221 != 0;
    float _1225 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1217);
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1229 = _1227 != 0;
    float _1231 = _894 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1233 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1225);
    out.m_78.x = _750;
    out.m_78.y = _748;
    out.m_78.z = _752;
    float _1235 = _1233 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_80.x = 1.0;
    out.m_80.y = 1.0;
    out.m_80.z = 1.0;
    float _1237 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1241 = _1239 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1245 = _1243 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1247 = exp2(_1231);
    float _1249 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1251 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1249);
    bool _1253 = _1215 > 0.5;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1257 = _1255 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1259 = -_1219;
    float _1261 = _1259 + 1.0;
    float _1263 = _522 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1265 = 1.0 / _1241;
    float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1269 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1267);
    float _1271 = _1219;
    float _1273 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1275 = _1269;
    if (_1223)
    {
        float _1277 = _1253 ? _1261 : _1219;
        _1271 = _1277;
    }
    float _1279 = _1271;
    float _1281 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1263);
    float _1283 = _1263;
    if (_1229)
    {
        float _1285 = in.m_66.x;
        _1283 = _1285;
    }
    float _1287 = _1283;
    float _1289 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1281);
    float _1291 = 1.0 / _1245;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1297 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1299 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1305 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1309 = 1.0 / _1297;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1313 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1311;
    float _1315 = _1235 + _1297;
    float _1317 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1319;
    float _1323 = _1303 * _1265;
    bool _1325 = _381 != 0.0;
    bool _1327 = isnan(_381);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan(0.0);
    bool _1333 = _1329 || _1331;
    float _1335 = _1313 * _1291;
    float _1337 = 1.0 / _1257;
    out.m_82.x = _1299;
    out.m_82.y = _1317;
    out.m_82.z = _1305;
    bool _1339 = _379 == 0.0;
    bool _1341 = !_1333;
    bool _1343 = _1339 && _1341;
    float _1345 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1347 = _363 + _1345;
    bool _1349 = _1287 > 0.5;
    bool _1351 = _1349 && _1229;
    float _1353 = in.m_84.x;
    float _1355 = in.m_84.y;
    float _1357 = in.m_84.z;
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1361 = _363 + _1359;
    bool _1363 = _383 == 0.0;
    bool _1365 = _1363 && _1343;
    float _1367 = _1315 * _1309;
    float _1369 = _1367 * 0.5;
    float _1371 = in.m_76.x;
    float _1373 = fma(_1335, _1361, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1375 = fma(_1323, _1347, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1377 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1379 = isnan(_363);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1385 = _1381 || _1383;
    float _1387 = float(_1385);
    float _1389 = -_1247;
    float _1391 = _1389 + 1.0;
    float _1393 = _1321 * _1337;
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1397 = _363 + _1395;
    bool _1399 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1401 = isnan(_363);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1407 = _1403 || _1405;
    float _1409 = float(_1407);
    float _1411 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1413 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1411);
    bool _1415 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1417 = isnan(_363);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1423 = _1419 || _1421;
    float _1425 = float(_1423);
    float _1427 = fma(_1393, _1397, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1429 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1431 = isnan(_363);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1437 = _1433 || _1435;
    float _1439 = float(_1437);
    float _1441 = -_1387;
    float _1443 = _1441 + 1.0;
    bool _1445 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1447 = isnan(0.0);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1453 = _1449 || _1451;
    float _1455 = 1.0 / _1413;
    float _1457 = -_1409;
    float _1459 = _1457 + 1.0;
    float _1461 = _1391 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1463 = as_type<int>((*spvDescriptorSet0.vp_c8)._m0[30].y);
    float _1465 = _1393;
    if (!_854)
    {
        float _1467 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _1463 = as_type<int>(_1467);
    }
    int _1469 = _1463;
    float _1471 = _1355;
    float _1473 = _1357;
    float _1475 = _1353;
    if (!_1365)
    {
        float _1477 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1355);
        _1471 = _1477;
    }
    float _1479 = _1471;
    float _1481 = _1439 * _1443;
    float _1483 = -_1439;
    float _1485 = _1483 + 1.0;
    if (!_1365)
    {
        float _1487 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1357);
        _1473 = _1487;
    }
    float _1489 = _1473;
    float _1491 = _1371;
    if (_1229)
    {
        _1465 = _1371;
    }
    float _1493 = _1465;
    float _1495 = _1373 * _1481;
    float _1497 = _307 * _1479;
    float _1499 = _315 * _1479;
    float _1501 = _319 * _1479;
    float _1503 = _1493;
    if (_1351)
    {
        float _1505 = -_1493;
        float _1507 = _1505 + 1.0;
        _1503 = _1507;
    }
    float _1509 = _1503;
    float _1511 = fma(_1485, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1495);
    float _1513 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1251);
    float _1515 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1517 = _1455 * _1515;
    float _1519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1229)
    {
        _1491 = _1509;
    }
    float _1521 = _1491;
    float _1523 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1269);
    if (_1453)
    {
        float _1525 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1273 = _1525;
    }
    float _1527 = _1273;
    if (!_1365)
    {
        float _1529 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1353);
        _1475 = _1529;
    }
    float _1531 = _1475;
    float _1533 = _1425 * _1459;
    float _1535 = _466 + _1513;
    float _1537 = _462 + _1523;
    float _1539 = abs(_1517);
    float _1541 = log2(_1539);
    if (_1453)
    {
        float _1543 = precise::min(_1527, 20.0);
        _1275 = _1543;
    }
    float _1545 = _1275;
    float _1547 = -_1425;
    float _1549 = _1547 + 1.0;
    float _1551 = fma(_291, _1531, _1501);
    float _1553 = -_1535;
    float _1555 = _1553 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1557 = -_1537;
    float _1559 = _1557 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1561 = _1387 * _1549;
    float _1563 = fma(_287, _1531, _1499);
    float _1565 = _1545;
    if (_1453)
    {
        float _1567 = 1.0 / _1545;
        _1565 = _1567;
    }
    float _1569 = _1565;
    float _1571 = precise::min(_1535, _1555);
    float _1573 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1575 = precise::min(_1537, _1559);
    float _1577 = fma(_327, _1489, _1563);
    float _1579 = fma(_283, _1531, _1497);
    if (!_1453)
    {
        _329 = 1.0;
    }
    float _1581 = _329;
    float _1583 = fma(_1375, _1561, _1511);
    float _1585 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1587 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1591 = precise::min(_1571, _1575);
    float _1593 = fma(_1427, _1533, _1583);
    float _1595 = _1587 * _1519;
    float _1597 = in.m_74.x;
    float _1599 = _1581;
    if (_1453)
    {
        float _1601 = _1591 * _1569;
        float _1603 = precise::clamp(_1601, 0.0, 1.0);
        _1599 = _1603;
    }
    float _1605 = _1599;
    float _1607 = exp2(_1585);
    float _1609 = fma(_323, _1489, _1579);
    bool _1611 = _1517 <= 8000.0;
    bool _1613 = isnan(_1517);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan(8000.0);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    float _1623 = fma(_333, _1489, _1551);
    float _1625 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1593);
    float _1627 = _1577 * _556;
    float _1629 = _1577 * _656;
    float _1631 = _1573 * _1589;
    float _1633 = _1577 * _570;
    float _1635 = _1625 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1637 = fma(_1609, _658, _1627);
    float _1639 = fma(_1609, _564, _1629);
    out.m_86.x = _1631;
    out.m_86.y = _1595;
    float _1641 = fma(_1609, _568, _1633);
    float _1643 = fma(_1607, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1645 = precise::clamp(_1643, 0.0, 1.0);
    float _1647 = fma(_1623, _558, _1637);
    float _1649 = fma(_1623, _562, _1639);
    float _1651 = fma(_1645, -2.0, 3.0);
    float _1653 = _1645 * _1645;
    float _1655 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1657 = fma(_1623, _666, _1641);
    float _1659 = _1653 * _1651;
    float _1661 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1665 = -_1659;
    float _1667 = _1665 + 1.0;
    float _1669 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1655);
    float _1671 = _1661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1675 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1659);
    float _1677 = _1663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1679 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1669);
    float _1681 = _1673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1683 = _1621 * _1675;
    out.m_88.x = _1647;
    out.m_88.y = _1649;
    out.m_88.z = _1657;
    float _1685 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1679);
    bool _1687 = _862 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1689 = isnan(_862);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1695 = _1691 || _1693;
    float _1697 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_90.x = _1677;
    out.m_90.y = _1681;
    out.m_90.z = _1671;
    out.m_90.w = _1635;
    float _1699 = _1605 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1701 = _1685 + _1108;
    out.gl_Position.x = _1132;
    out.gl_Position.y = _1142;
    out.gl_Position.z = _1685;
    out.gl_Position.w = _1108;
    float _1703 = _1699 * _826;
    float _1705 = _1701;
    float _1707 = _1635;
    if (!_854)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4730 = as_type<float>(_1469);
        out.gl_Position.z = _4730;
    }
    float _1709 = _1701 * 0.5;
    float _1711 = _1108;
    float _1713 = _1709;
    float _1715 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (_854)
    {
        _1148 = _1703;
    }
    float _1717 = _1148;
    float _1719 = _1717;
    if (!_854)
    {
        _1719 = 0.0;
    }
    float _1721 = _1719;
    out.m_92.z = _1709;
    out.m_92.w = _1108;
    if (!_1695)
    {
        _1705 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1723 = _1705;
    float _1725 = _1723;
    float _1727 = _1723;
    if (!_1695)
    {
        _1707 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1729 = _1707;
    float _1731 = _1729;
    float _1733 = _1729;
    if (!_1695)
    {
        _1711 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1735 = _1711;
    float _1737 = _1735;
    float _1739 = _1735;
    if (!_1695)
    {
        _1713 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1741 = _1713;
    float _1743 = -_1160;
    float _1745 = _1743 + 1.0;
    float _1747 = _1745 * _1697;
    float _1749 = precise::clamp(_1747, 0.0, 1.0);
    float _1751 = -_1749;
    float _1753 = fma(_1751, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1755 = _1741;
    float _1757 = _1741;
    if (!_1695)
    {
        _1715 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1759 = _1715;
    float _1761 = _1753 * _1597;
    float _1763 = _1761 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1765 = _1461 * _1190;
    float _1767 = -_1461;
    float _1769 = _1767 + 1.0;
    out.m_94.x = _1763;
    float _1771 = _1203 * _1765;
    float _1773 = _1203 * _1769;
    float _1775 = _1213 * _1765;
    float _1777 = fma(_1209, _1771, _1197);
    float _1779 = fma(_1211, _1771, _1199);
    float _1781 = _1765;
    float _1783 = _1759;
    float _1785 = _1759;
    if (!_1695)
    {
        _1781 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1787 = _1781;
    float _1789 = fma(_1203, _1775, _1201);
    out.m_96.x = _1777;
    out.m_96.y = _1779;
    out.m_96.z = _1789;
    out.m_96.w = _1773;
    bool _1791 = !_1695;
    float _1793 = _1787;
    float _1795 = _1787;
    if (!_1791)
    {
        bool _1797 = _862 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1799 = isnan(_862);
        bool _1801 = _1797 || _1799;
        bool _1803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1805 = _1801 || _1803;
        if (!_1805)
        {
            float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1809 = _862 + _1807;
            float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1813 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1811;
            float _1815 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1819 = 1.0 / _1813;
            float _1821 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1823 = _1821 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1825 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1827 = _1825 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1829 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1831 = _1829 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1833 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1835 = _1833 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1837 = _1809 * _1819;
            float _1839 = precise::clamp(_1837, 0.0, 1.0);
            float _1841 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1843 = _1841 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1845 = fma(_1839, _1817, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1847 = fma(_1839, _1843, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1849 = fma(_1839, _1823, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1851 = fma(_1839, _1827, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1853 = fma(_1839, _1831, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1855 = fma(_1839, _1835, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1795 = _1849;
            _1739 = _1853;
            _1727 = _1845;
            _1785 = _1851;
            _1733 = _1847;
            _1757 = _1855;
            _1857 = true;
        }
        else
        {
            bool _1859 = _862 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1861 = isnan(_862);
            bool _1863 = _1859 || _1861;
            bool _1865 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1867 = _1863 || _1865;
            if (!_1867)
            {
                _1725 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1869 = _1725;
            _1727 = _1869;
            if (!_1867)
            {
                _1793 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1871 = _1793;
            _1795 = _1871;
            if (!_1867)
            {
                _1731 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1873 = _1731;
            _1733 = _1873;
            if (!_1867)
            {
                _1783 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1875 = _1783;
            _1785 = _1875;
            if (!_1867)
            {
                _1737 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1877 = _1737;
            _1739 = _1877;
            if (!_1867)
            {
                _1755 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1879 = _1755;
            bool _1881 = !_1867;
            _1757 = _1879;
            if (!_1881)
            {
                bool _1883 = _862 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1885 = isnan(_862);
                bool _1887 = _1883 || _1885;
                bool _1889 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1891 = _1887 || _1889;
                if (!_1891)
                {
                    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1895 = _862 + _1893;
                    float _1897 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1899 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1897;
                    float _1901 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1905 = 1.0 / _1899;
                    float _1907 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1909 = _1907 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1911 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1913 = _1911 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1915 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1917 = _1915 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1919 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1921 = _1919 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1923 = _1895 * _1905;
                    float _1925 = precise::clamp(_1923, 0.0, 1.0);
                    float _1927 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1929 = _1927 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1931 = fma(_1925, _1903, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1933 = fma(_1925, _1929, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1935 = fma(_1925, _1909, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1937 = fma(_1925, _1913, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1939 = fma(_1925, _1917, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1941 = fma(_1925, _1921, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1795 = _1935;
                    _1739 = _1939;
                    _1727 = _1931;
                    _1785 = _1937;
                    _1733 = _1933;
                    _1757 = _1941;
                    _1857 = true;
                }
                else
                {
                    _1795 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1739 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1727 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1785 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1733 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1757 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1857 = false;
    float _1943 = _1795;
    float _1945 = _1739;
    float _1947 = _1727;
    float _1949 = _1785;
    float _1951 = _1733;
    float _1953 = _1757;
    float _1955 = fma(_1649, -0.5, 0.5);
    float _1957 = precise::clamp(_1955, 0.0, 1.0);
    float _1959 = -_1943;
    float _1961 = _1959 + _1945;
    float _1963 = -_1947;
    float _1965 = _1963 + _1949;
    float _1967 = -_1951;
    float _1969 = _1967 + _1953;
    bool _1971 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1973 = fma(_1957, _1961, _1943);
    float _1975 = fma(_1957, _1965, _1947);
    float _1977 = fma(_1957, _1969, _1951);
    float _1979 = _1721 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1981 = _1973 * 0.586610972881317138671875;
    out.m_56.x = 1.0;
    float _1983 = fma(_1975, 0.298911988735198974609375, _1981);
    out.m_94.w = _1979;
    float _1985 = fma(_1977, 0.114477999508380889892578125, _1983);
    out.m_98.x = 0.0;
    float _1987 = -_1985;
    float _1989 = _1975 + _1987;
    float _1991 = -_1985;
    float _1993 = _1973 + _1991;
    float _1995 = -_1985;
    float _1997 = _1977 + _1995;
    float _1999 = fma(_1989, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1985);
    float _2001 = fma(_1993, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1985);
    float _2003 = fma(_1997, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1985);
    out.m_100.x = 0.0;
    out.m_102.x = _1999;
    out.m_102.y = _2001;
    out.m_102.z = _2003;
    if (!_1971)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2005 = -_748;
    float _2007 = _2005 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2009 = -_750;
    float _2011 = _2009 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2013 = -_752;
    float _2015 = _2013 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2017 = _2007 * _2007;
    float _2019 = fma(_2011, _2011, _2017);
    float _2021 = fma(_2015, _2015, _2019);
    float _2023 = rsqrt(_2021);
    float _2025 = sqrt(_2021);
    float _2027 = _2007 * _2023;
    float _2029 = _2011 * _2023;
    float _2031 = _2015 * _2023;
    float _2033 = -_868;
    float _2035 = _2033 + _2027;
    float _2037 = -_864;
    float _2039 = _2037 + _2029;
    float _2041 = -_866;
    float _2043 = _2041 + _2031;
    float _2045 = _2035 * _2035;
    float _2047 = -_2025;
    float _2049 = _2047 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2051 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2053 = precise::clamp(_2051, 0.0, 1.0);
    float _2055 = fma(_2039, _2039, _2045);
    float _2057 = _2049 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2059 = precise::clamp(_2057, 0.0, 1.0);
    float _2061 = _2053 * _2053;
    float _2063 = fma(_2043, _2043, _2055);
    float _2065 = _2061 + (-1.0);
    float _2067 = abs(_2059);
    float _2069 = log2(_2067);
    float _2071 = rsqrt(_2063);
    float _2073 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2075 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2077 = exp2(_2073);
    float _2079 = _2035 * _2071;
    float _2081 = _2039 * _2071;
    float _2083 = _2043 * _2071;
    float _2085 = _1649 * _2079;
    float _2087 = fma(_1647, _2081, _2085);
    float _2089 = fma(_1657, _2083, _2087);
    float _2091 = precise::clamp(_2089, 0.0, 1.0);
    float _2093 = _2091 * _2091;
    float _2095 = fma(_2093, _2065, 1.0);
    float _2097 = -_2027;
    float _2099 = -_2075;
    float _2101 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2099);
    float _2103 = _1649 * _2027;
    float _2105 = _2095 * _2095;
    float _2107 = -_2031;
    float _2109 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2101);
    float _2111 = fma(_1647, _2029, _2103);
    float _2113 = 1.0 / _2105;
    float _2115 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2117 = _2109 + _2115;
    float _2119 = fma(_1657, _2031, _2111);
    float _2121 = precise::clamp(_2119, 0.0, 1.0);
    float _2123 = _2117 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2125 = precise::clamp(_2123, 0.0, 1.0);
    float _2127 = _2077 * _2125;
    float _2129 = _2121 * _2127;
    float _2131 = _2061 * _2113;
    float _2133 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2135 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2137 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2139 = _2129 * _2131;
    float _2141 = _2139 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2143 = _2139 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2145 = _2139 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _2133;
    out.m_98.y = _2135;
    out.m_98.z = _2137;
    out.m_100.x = _2141;
    out.m_100.y = _2143;
    out.m_100.z = _2145;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

