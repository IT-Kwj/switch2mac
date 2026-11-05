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
    float4 m_80 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_110 [[user(locn3)]];
    float4 m_76 [[user(locn4)]];
    float4 m_88 [[user(locn5)]];
    float4 m_100 [[user(locn6)]];
    float4 m_92 [[user(locn7)]];
    float4 m_102 [[user(locn8)]];
    float4 m_96 [[user(locn9)]];
    float4 m_98 [[user(locn10)]];
    float4 m_78 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 m_108 [[user(locn13)]];
    float4 m_104 [[user(locn14)]];
    float4 m_106 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_94 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
    float4 m_82 [[attribute(7)]];
    float4 m_72 [[attribute(8)]];
    float4 m_66 [[attribute(9)]];
    float4 m_70 [[attribute(10)]];
    float4 m_84 [[attribute(11)]];
    float4 m_74 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2587 = false;
    bool _361 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _124 = in.m_53.w;
    float _126 = trunc(_124);
    int _129 = int(_126);
    bool _133 = _129 >= 1;
    float _135 = 0.0;
    if (!_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    float _139 = _137;
    if (!_133)
    {
        out.m_56.x = 0.0;
    }
    int _141 = 0;
    if (!_133)
    {
        float _143 = _137 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2872 = as_type<float>(_145);
        out.gl_Position.z = _2872;
    }
    if (!_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _149 = in.m_58.w;
    bool _151 = _149 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _153 = isnan(_149);
    bool _155 = _151 || _153;
    bool _157 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _159 = _155 || _157;
    float _161 = -_149;
    float _163 = _161 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _165 = 0.0;
    if (_159)
    {
        float _167 = float(_129);
        _165 = _167;
    }
    float _169 = _165;
    bool _171 = _163 >= _169;
    bool _173 = !_159;
    bool _175 = _171 || _173;
    if (_175)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _139;
    if (_175)
    {
        out.m_56.x = 0.0;
    }
    if (_175)
    {
        float _179 = _177 * 5.0;
        _147 = as_type<int>(_179);
    }
    int _181 = _147;
    if (_175)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2940 = as_type<float>(_181);
        out.gl_Position.z = _2940;
    }
    if (_175)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _183 = in.m_60.x;
    float _185 = in.m_60.y;
    float _187 = in.m_60.z;
    float _189 = in.m_62.x;
    float _191 = in.m_62.y;
    float _193 = in.m_62.z;
    float _195 = in.m_64.x;
    float _197 = in.m_64.y;
    float _199 = in.m_64.z;
    float _201 = _183 * _183;
    float _203 = _187 * _187;
    float _205 = _185 * _185;
    float _207 = fma(_189, _189, _201);
    float _209 = fma(_193, _193, _203);
    float _211 = fma(_191, _191, _205);
    float _213 = fma(_195, _195, _207);
    float _215 = fma(_199, _199, _209);
    float _217 = fma(_197, _197, _211);
    float _219 = sqrt(_213);
    float _221 = sqrt(_215);
    float _223 = sqrt(_217);
    bool _225 = _219 > 0.0;
    bool _227 = _221 > 0.0;
    float _229 = _221;
    if (_225)
    {
        float _231 = rsqrt(_213);
        _229 = _231;
    }
    float _233 = _229;
    float _235 = 0.0;
    if (!_225)
    {
        _235 = 0.0;
    }
    float _237 = _235;
    bool _239 = _223 > 0.0;
    float _241 = 0.0;
    float _243 = _237;
    if (!_225)
    {
        _241 = 0.0;
    }
    float _245 = _241;
    float _247 = 0.0;
    float _249 = _245;
    if (!_225)
    {
        _247 = 0.0;
    }
    float _251 = _247;
    float _253 = _219;
    float _255 = _251;
    if (_227)
    {
        float _257 = rsqrt(_215);
        _253 = _257;
    }
    float _259 = _253;
    float _261 = 0.0;
    if (!_227)
    {
        _261 = 0.0;
    }
    float _263 = _261;
    float _265 = 0.0;
    float _267 = _263;
    if (!_227)
    {
        _265 = 0.0;
    }
    float _269 = _265;
    float _271 = 0.0;
    float _273 = _269;
    if (!_227)
    {
        _271 = 0.0;
    }
    float _275 = _271;
    float _277 = _223;
    float _279 = _275;
    if (_239)
    {
        float _281 = rsqrt(_217);
        _277 = _281;
    }
    float _283 = _277;
    if (_225)
    {
        float _285 = _233 * _189;
        _243 = _285;
    }
    float _287 = _243;
    if (_225)
    {
        float _289 = _233 * _183;
        _249 = _289;
    }
    float _291 = _249;
    if (_225)
    {
        float _293 = _233 * _195;
        _255 = _293;
    }
    float _295 = _255;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = 0.0;
    if (!_239)
    {
        _299 = 0.0;
    }
    float _301 = _299;
    float _303 = 0.0;
    float _305 = _301;
    if (!_239)
    {
        _303 = 0.0;
    }
    float _307 = _303;
    float _309 = _307;
    if (_227)
    {
        float _311 = _259 * _193;
        _267 = _311;
    }
    float _313 = _267;
    float _315 = 0.0;
    if (!_239)
    {
        _315 = 0.0;
    }
    float _317 = _315;
    float _319 = _317;
    if (_227)
    {
        float _321 = _259 * _187;
        _273 = _321;
    }
    float _323 = _273;
    if (_227)
    {
        float _325 = _259 * _199;
        _279 = _325;
    }
    float _327 = _279;
    if (_239)
    {
        float _329 = _283 * _191;
        _305 = _329;
    }
    float _331 = _305;
    if (_239)
    {
        float _333 = _283 * _185;
        _309 = _333;
    }
    float _335 = _309;
    if (_239)
    {
        float _337 = _283 * _197;
        _319 = _337;
    }
    float _339 = _319;
    bool _341 = !_297;
    float _359;
    if (!_341)
    {
        float _343 = in.m_66.x;
        float _345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _347 = _343 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[11].y, _163);
        float _351 = _349 * _345;
        float _353 = floor(_351);
        float _355 = -_353;
        float _357 = _351 + _355;
        _359 = _357;
        _361 = true;
    }
    else
    {
        float _363 = float(_129);
        float _365 = 1.0 / _363;
        float _367 = _163 * _365;
        _359 = _367;
    }
    _361 = false;
    float _369 = _359;
    float _371 = in.m_68.w;
    float _373 = in.m_53.x;
    float _375 = in.m_53.y;
    float _377 = in.m_53.z;
    float _379 = in.m_70.x;
    float _381 = in.m_70.y;
    float _383 = in.m_70.z;
    float _385 = in.m_72.x;
    float _387 = in.m_72.y;
    float _389 = in.m_72.z;
    float _391 = in.m_64.w;
    float _393 = in.m_62.w;
    float _395 = trunc(_371);
    int _397 = int(_395);
    float _399 = in.m_60.w;
    int _401 = _397 << 5;
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
    float _426 = _191 * _375;
    float _428 = _381 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _430 = _379 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _432 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _385);
    float _434 = fma(_189, _373, _426);
    float _436 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _387);
    float _438 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _440 = _430 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _442 = _197 * _375;
    float _444 = _383 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _446 = _436 * _438;
    float _448 = _432 * _440;
    float _450 = fma(_195, _373, _442);
    float _452 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _389);
    float _454 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _456 = _446 * _339;
    float _458 = fma(_199, _377, _450);
    float _460 = _446 * _331;
    float _462 = _452 * _454;
    float _464 = fma(_448, _295, _456);
    float _466 = fma(_193, _377, _434);
    float _468 = _458 + _391;
    float _470 = fma(_448, _287, _460);
    float _472 = fma(_462, _327, _464);
    float _474 = _466 + _393;
    float _476 = _185 * _375;
    float _478 = fma(_462, _313, _470);
    float _480 = _468 + _472;
    float _482 = _446 * _335;
    float _484 = fma(_183, _373, _476);
    float _486 = _474 + _478;
    float _488 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _490 = _480 + _488;
    float _492 = fma(_448, _291, _482);
    float _494 = fma(_187, _377, _484);
    float _496 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _498 = _486 + _496;
    float _500 = _490 * _490;
    float _502 = fma(_462, _323, _492);
    float _504 = _494 + _399;
    float _506 = fma(_498, _498, _500);
    float _508 = _504 + _502;
    float _510 = sqrt(_506);
    bool _512 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _514 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _516 = _512 || _514;
    bool _518 = isnan(0.5);
    bool _520 = _516 || _518;
    bool _522 = _510 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _530 = _528 != 0;
    bool _532 = !_530;
    int _534 = _532 ? 0 : 1;
    bool _536 = !_526;
    int _538 = _536 ? 0 : 1;
    float _540 = _424 * 2.0;
    float _542 = _406 * 2.0;
    float _544 = _412 * 2.0;
    float _546 = _412 * _412;
    float _548 = _418 * _540;
    float _550 = _406 * _540;
    float _552 = _412 * _540;
    float _554 = _418 * _418;
    float _556 = -_548;
    float _558 = fma(_412, _542, _556);
    float _560 = -_550;
    float _562 = fma(_418, _544, _560);
    float _564 = fma(_412, _542, _548);
    float _566 = fma(_418, _542, _552);
    float _568 = fma(_418, _544, _550);
    float _570 = -_552;
    float _572 = fma(_418, _542, _570);
    float _574 = _406 * _406;
    float _576 = _552;
    float _578 = _406;
    float _580 = _412;
    float _582 = _490;
    float _584 = _391;
    if (!_522)
    {
        _576 = _486;
    }
    float _586 = _576;
    float _588 = _586;
    if (!_522)
    {
        _578 = _480;
    }
    float _590 = _578;
    float _592 = _590;
    if (!_522)
    {
        _580 = _508;
    }
    float _594 = _580;
    bool _596 = !_522;
    float _598 = _594;
    if (!_596)
    {
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _602 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _604 = _510 + _602;
        float _606 = _508 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _608 = rsqrt(_506);
        float _610 = _604 * _600;
        float _612 = _610 * 0.15915493667125701904296875;
        float _614 = _612 * 6.283185482025146484375;
        float _616 = cos(_614);
        float _618 = _612 * 6.283185482025146484375;
        float _620 = sin(_618);
        float _622 = _616 + (-1.0);
        float _624 = _622 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _626 = fma(_620, _606, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _628 = fma(_508, _616, _624);
        float _630 = _608 * _626;
        float _632 = fma(_498, _630, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _634 = fma(_490, _630, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _598 = _628;
        _588 = _632;
        _592 = _634;
    }
    float _636 = _598;
    float _638 = _588;
    float _640 = _592;
    float _642 = -_504;
    float _644 = _642 + _636;
    float _646 = -_474;
    float _648 = _646 + _638;
    float _650 = fma(_546, -2.0, 1.0);
    float _652 = fma(_574, -2.0, 1.0);
    float _654 = _644 * _335;
    float _656 = -_468;
    float _658 = _656 + _640;
    float _660 = _644 * _291;
    float _662 = fma(_554, -2.0, _650);
    float _664 = fma(_648, _331, _654);
    float _666 = _644 * _323;
    float _668 = fma(_554, -2.0, _652);
    float _670 = fma(_648, _287, _660);
    float _672 = fma(_658, _339, _664);
    float _674 = fma(_546, -2.0, _652);
    float _676 = fma(_648, _313, _666);
    float _678 = fma(_658, _295, _670);
    float _680 = _672 * _558;
    float _682 = _672 * _668;
    float _684 = _672 * _568;
    float _686 = fma(_658, _327, _676);
    float _688 = fma(_678, _662, _680);
    float _690 = fma(_678, _564, _682);
    float _692 = fma(_678, _572, _684);
    float _694 = fma(_686, _566, _688);
    float _696 = fma(_686, _562, _690);
    float _698 = fma(_686, _674, _692);
    float _700 = _474 + _694;
    float _702 = _504 + _696;
    float _704 = _468 + _698;
    float _706 = _702;
    float _708 = _700;
    float _710 = _704;
    if (!_520)
    {
        float _712 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _714 = _504 + _712;
        float _716 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _718 = _474 + _716;
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _722 = _714 * _714;
        float _724 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _726 = _468 + _724;
        float _728 = fma(_718, _718, _722);
        float _730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _732 = fma(_726, _726, _728);
        float _734 = sqrt(_732);
        float _736 = _720 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _738 = precise::min(_734, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _740 = _738 * _730;
        float _742 = _736 * _740;
        float _744 = fma(_694, _742, _474);
        float _746 = fma(_696, _742, _504);
        float _748 = fma(_698, _742, _468);
        _706 = _746;
        _708 = _744;
        _710 = _748;
    }
    float _750 = _706;
    float _752 = _708;
    float _754 = _710;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _758 = _750 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _762 = _752 + _760;
    float _764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _766 = _754 + _764;
    float _768 = _758 * _758;
    float _770 = fma(_762, _762, _768);
    float _772 = fma(_766, _766, _770);
    float _774 = rsqrt(_772);
    float _776 = _774 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _778 = _762 * _776;
    float _780 = _766 * _776;
    float _782 = _778 * _778;
    float _784 = _780 * _780;
    float _786 = fma(_474, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _788 = _782 + _784;
    float _790 = sqrt(_788);
    bool _792 = _790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _794 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _796 = _790 + _794;
    float _798 = _770;
    float _800 = _788;
    float _802 = _796;
    float _804 = _758;
    float _806 = _776;
    bool _808 = _792;
    if (_792)
    {
        float _810 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _798 = _810;
    }
    float _812 = _798;
    if (_792)
    {
        float _814 = rsqrt(_788);
        _800 = _814;
    }
    float _816 = _800;
    float _818 = _816;
    if (_792)
    {
        float _820 = _796 * _812;
        _802 = _820;
    }
    float _822 = _802;
    float _824 = floor(_786);
    if (_792)
    {
        float _826 = _822 * 0.15915493667125701904296875;
        _582 = _826;
    }
    float _828 = _582;
    float _830 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _832 = _774;
    float _834 = _828;
    if (_792)
    {
        float _836 = _828 * 6.283185482025146484375;
        float _838 = sin(_836);
        _832 = _838;
    }
    float _840 = _832;
    float _842 = precise::max(0.0, _830);
    float _844 = _506;
    float _846 = _842;
    if (_792)
    {
        float _848 = _828 * 6.283185482025146484375;
        float _850 = cos(_848);
        _844 = _850;
    }
    float _852 = _844;
    float _854 = -_776;
    float _856 = -_842;
    float _858 = fma(_758, _854, _856);
    if (_792)
    {
        float _860 = _858 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _804 = _860;
    }
    float _862 = _804;
    float _864 = _862;
    float _866 = _840;
    if (_792)
    {
        float _868 = fma(_840, _862, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _864 = _868;
    }
    float _870 = _864;
    float _872 = _870;
    if (!_792)
    {
        _866 = _778;
    }
    float _874 = _866;
    float _876 = _874;
    if (!_792)
    {
        _834 = _858;
    }
    float _878 = _834;
    float _880 = _878;
    if (_792)
    {
        float _882 = _816 * _870;
        _584 = _882;
    }
    float _884 = _584;
    if (!_792)
    {
        _818 = _780;
    }
    float _886 = _818;
    float _888 = _886;
    float _890 = _852;
    if (_792)
    {
        float _892 = _852 + (-1.0);
        _846 = _892;
    }
    float _894 = _846;
    if (_792)
    {
        float _896 = _778 * _884;
        _876 = _896;
    }
    float _898 = _876;
    if (!_792)
    {
        _872 = _782;
    }
    float _900 = _872;
    float _902 = _900;
    if (_792)
    {
        float _904 = _780 * _884;
        _888 = _904;
    }
    float _906 = _888;
    if (_792)
    {
        float _908 = _894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _806 = _908;
    }
    float _910 = _806;
    if (_792)
    {
        float _912 = _898 * _898;
        _902 = _912;
    }
    float _914 = _902;
    float _916 = sqrt(_772);
    float _918 = _750 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_792)
    {
        float _920 = fma(_858, _852, _910);
        _880 = _920;
    }
    float _922 = _880;
    if (!_792)
    {
        _890 = _784;
    }
    float _924 = _890;
    float _926 = _924;
    if (_792)
    {
        float _928 = _906 * _906;
        _926 = _928;
    }
    float _930 = _926;
    float _932 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[1].x, _918);
    float _934 = fma(_922, _922, _914);
    float _936 = _750 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _938 = _750 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _940 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[1].z, _932);
    float _942 = _934 + _930;
    float _944 = _750 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _946 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[2].x, _936);
    float _948 = _940 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _950 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[0].x, _944);
    float _952 = rsqrt(_942);
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _956 = fma(_916, (*spvDescriptorSet0.vp_c15)._m0[23].w, _954);
    float _958 = precise::clamp(_956, 0.0, 1.0);
    float _960 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[3].x, _938);
    float _962 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[0].z, _950);
    float _964 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[2].z, _946);
    float _966 = -_958;
    float _968 = _966 + 1.0;
    float _970 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[3].z, _960);
    float _972 = _962 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _974 = _948 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _976 = _964 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _978 = _970 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _980 = abs(_968);
    float _982 = log2(_980);
    float _984 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[7].x, _974);
    float _986 = _976 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[7].z, _984);
    float _990 = _952 * _898;
    float _992 = _952 * _922;
    float _994 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _996 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[7].w, _988);
    float _998 = _990 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1000 = _952 * _906;
    float _1002 = fma(_468, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1004 = -_986;
    float _1006 = fma(_1004, _994, 1.0);
    float _1008 = -_998;
    float _1010 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1008);
    float _1012 = -_824;
    float _1014 = _786 + _1012;
    float _1016 = _982 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1018 = floor(_1002);
    float _1020 = -_1000;
    float _1022 = fma(_1020, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1010);
    float _1024 = _948 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1026 = _948 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1028 = fma(_1022, -0.5, 0.5);
    float _1030 = fma(_1022, 0.5, 0.5);
    float _1032 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1024);
    float _1034 = exp2(_1016);
    float _1036 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1026);
    float _1038 = _992 + 1.0;
    float _1040 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1032);
    float _1042 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1036);
    float _1044 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1040);
    float _1046 = log2(_1006);
    float _1048 = -_1018;
    float _1050 = _1002 + _1048;
    float _1052 = fma(_1030, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1054 = fma(_1030, _1052, -0.212114393711090087890625);
    float _1056 = 1.0 / _996;
    float _1058 = -_992;
    float _1060 = fma(_1034, _1038, _1058);
    float _1062 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1042);
    float _1064 = fma(_1030, _1054, 1.570728778839111328125);
    float _1066 = sqrt(_1028);
    float _1068 = _1046 * 0.693147182464599609375;
    float _1070 = _1068 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1072 = fma(_1060, 0.5, 0.5);
    float _1074 = _1044 * _1056;
    float _1076 = _1062 * _1056;
    float _1078 = fma(_1074, 0.5, 0.5);
    float _1080 = fma(_1076, -0.5, 0.5);
    float _1082 = _1066 * 0.636619746685028076171875;
    float2 _4358 = float2(_1014, _1050);
    float _1084 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4358, float2(0.0), isnan(_4358)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4358, float2(0.0), isnan(_4358)), level(0.0)).x;
    float3 _4369 = float3(_1078, _1080, _1070);
    float _1086 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4369, float3(0.0), isnan(_4369)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4369, float3(0.0), isnan(_4369)), level(0.0)).x;
    float _1088 = -_1064;
    float _1090 = fma(_1082, _1088, 1.0);
    float3 _4385 = float3(_1078, _1080, _1070);
    float4 _1093 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4385, float3(0.0), isnan(_4385)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4385, float3(0.0), isnan(_4385)), level(0.0)).xyzw;
    float _1095 = _1093.x;
    float _1097 = _1093.y;
    float _1099 = _1093.z;
    float _1101 = _1093.w;
    float2 _4401 = float2(_1090, _1072);
    float3 _1105 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4401, float2(0.0), isnan(_4401)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4401, float2(0.0), isnan(_4401)), level(0.0)).xyz;
    float _1107 = _1105.x;
    float _1109 = _1105.y;
    float _1111 = _1105.z;
    float _1113 = in.m_74.x;
    float _1115 = _504 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1117 = in.m_66.x;
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1121 = _1119 != 0;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1125 = _1123 != 0;
    float _1127 = in.m_66.z;
    float _1129 = float(_129);
    float _1131 = in.m_74.y;
    float _1133 = in.m_66.w;
    float _1135 = in.m_66.y;
    float _1137 = 1.0 / _1129;
    int _1139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1141 = _1139 != 0;
    int _1143 = 0;
    float _1145 = _1030;
    float _1147 = _1113;
    float _1149 = _996;
    float _1151 = _1062;
    if (_1121)
    {
        float _1153 = -_1113;
        float _1155 = _1153 + 1.0;
        _1143 = as_type<int>(_1155);
    }
    int _1157 = _1143;
    if (!_1121)
    {
        _1145 = _1113;
    }
    float _1159 = _1145;
    int _1161 = 0;
    float _1163 = _1159;
    if (_1125)
    {
        float _1165 = -_1113;
        float _1167 = _1165 + 1.0;
        _1161 = as_type<int>(_1167);
    }
    int _1169 = _1161;
    float _1171 = 0.0;
    if (!_1125)
    {
        _1171 = _1113;
    }
    float _1173 = _1171;
    out.m_76.x = 1.0;
    out.m_76.y = 1.0;
    out.m_76.z = 1.0;
    float _1175 = _1173;
    float _1177 = _1117;
    if (_1121)
    {
        bool _1179 = _1117 > 0.5;
        _808 = _1179;
    }
    bool _1181 = _808;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    out.m_78.x = _752;
    out.m_78.y = _750;
    out.m_78.z = _754;
    if (_1121)
    {
        float _1187 = _1181 ? as_type<float>(_1157) : _1113;
        _1163 = _1187;
    }
    float _1189 = _1163;
    bool _1191 = _1127 > 0.5;
    float _1193 = -_1131;
    float _1195 = _1193 + 1.0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1199 = _1197 != 0;
    float _1201 = 1.0 / _1185;
    float _1203 = _1131;
    float _1205 = _1127;
    float _1207 = _1135;
    if (_1125)
    {
        float _1209 = _1191 ? as_type<float>(_1169) : _1113;
        _1175 = _1209;
    }
    float _1211 = _1175;
    bool _1213 = _1133 > 0.5;
    int _1215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1217 = _1215 != 0;
    float _1219 = _1135 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1221 = _1135 > 0.5;
    float _1223 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1225 = int(_1223);
    int _1227 = _1213 ? as_type<int>(_1195) : as_type<int>(_1131);
    int _1229 = _1221 ? as_type<int>(_1195) : as_type<int>(_1131);
    float _1231 = _1217 ? as_type<float>(_1227) : _1131;
    float _1233 = _1141 ? as_type<float>(_1229) : _1131;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1237 = _1235 != 0;
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1241 = _1239 != 0;
    int _1243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1245 = _1243 != 0;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1249 = _1247 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    if (_1199)
    {
        float _1251 = _1191 ? _1195 : _1131;
        _1203 = _1251;
    }
    float _1253 = _1203;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1257 = _1255 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1261 = _1259 != 0;
    float _1263 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1265 = int(_1263);
    int _1267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1269 = _1267 != 0;
    int _1271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1273 = _1271 != 0;
    float _1275 = 1.0 / _1249;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1283 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = 1.0 / _1257;
    float _1287 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = float(_1265);
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1295 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_80.x = _1283;
    out.m_80.y = _1287;
    out.m_80.z = _1289;
    float _1297 = _163 * _1291;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1301;
    float _1305 = -_1293;
    float _1307 = fma(_1295, 2.0, _1305);
    float _1309 = _1297 * _1137;
    float _1311 = fma(_1219, -2.0, _1299);
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1315 = _1313 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1317 = _1303 * _1285;
    float _1319 = _1315 * _1275;
    float _1321 = float(_1225);
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1325 = _369 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1329 = _369 + _1327;
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1333 = fma(_1317, _1325, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1335 = 1.0 / _1321;
    float _1337 = float(uint(_1265));
    float _1339 = fma(_1319, _1329, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1341 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _1343 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1345 = isnan(_369);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1351 = _1347 || _1349;
    float _1353 = float(_1351);
    float _1355 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1359 = _369 + _1357;
    bool _1361 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1363 = isnan(_369);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1369 = _1365 || _1367;
    float _1371 = float(_1369);
    float _1373 = 1.0 / _1337;
    float _1375 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1331);
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1379 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1377);
    float _1381 = -_1353;
    float _1383 = _1381 + 1.0;
    float _1385 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1311);
    float _1387 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1375);
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1391 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1389);
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1395 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1393;
    float _1397 = _163 * _1335;
    bool _1399 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1401 = isnan(_369);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1407 = _1403 || _1405;
    float _1409 = float(_1407);
    float _1411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1413 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1415 = isnan(_369);
    bool _1417 = _1413 || _1415;
    bool _1419 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1421 = _1417 || _1419;
    float _1423 = float(_1421);
    float _1425 = _1395 * _1201;
    float _1427 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1379);
    float _1429 = -_1423;
    float _1431 = _1429 + 1.0;
    float _1433 = _1423 * _1383;
    float _1435 = trunc(_1397);
    int _1437 = int(_1435);
    float _1439 = -_1385;
    float _1441 = fma(_1387, _1341, _1439);
    float _1443 = _1371 * _1431;
    int _1445 = as_type<int>(_1373) + (-2);
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1449 = ~_1265;
    int _1451 = _1449 + 1;
    float _1453 = _1333 * _1443;
    bool _1455 = !_1261;
    float _1457 = _1455 ? 7.345489978790283203125 : 1.0;
    float _1459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1461 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1463 = fma(_1425, _1359, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1465 = _1457 * _1117;
    float _1467 = fma(_1461, _1253, -0.5);
    int _1469 = as_type<int>(_1461);
    float _1471 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    float _1473 = _1353;
    float _1475 = _1383;
    if (_1237)
    {
        float _1477 = -_1113;
        float _1479 = _1477 + 1.0;
        _1469 = as_type<int>(_1479);
    }
    int _1481 = _1469;
    float _1483 = -_1409;
    float _1485 = _1483 + 1.0;
    float _1487 = float(uint(_1437));
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (!_1261)
    {
        _1471 = _1135;
    }
    float _1491 = _1471;
    float _1493 = _1353 * _1485;
    float _1495 = _1491;
    if (_1237)
    {
        float _1497 = _1221 ? as_type<float>(_1481) : _1113;
        _1147 = _1497;
    }
    float _1499 = _1147;
    float _1501 = as_type<float>(_1445) * _1487;
    float _1503 = -_1371;
    float _1505 = _1503 + 1.0;
    float _1507 = _1459 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1261)
    {
        _1473 = _1117;
    }
    float _1509 = _1473;
    float _1511 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1489);
    float _1513 = trunc(_1501);
    float _1515 = precise::max(_1513, 0.0);
    uint _1517 = uint(_1515);
    float _1519 = fma(_1231, _1507, -0.5);
    float _1521 = _1509;
    if (!_1261)
    {
        _1521 = _1127;
    }
    float _1523 = _1521;
    float _1525 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1453);
    if (_1261)
    {
        _1495 = _1117;
    }
    float _1527 = _1495;
    float _1529 = _474 + _1427;
    int _1531 = ~_1265;
    int _1533 = _1531 + 1;
    float _1535 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1537 = floor(_1465);
    if (!_1261)
    {
        _1475 = _1127;
    }
    float _1539 = _1475;
    float _1541 = fma(_1339, _1433, _1525);
    float _1543 = -_1447;
    float _1545 = fma(_1535, 2.0, _1543);
    float _1547 = -_163;
    float _1549 = fma(_1547, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1307);
    float _1551 = _1539;
    float _1553 = _1549;
    if (_1261)
    {
        _1205 = _1135;
    }
    float _1555 = _1205;
    float _1557 = -_163;
    float _1559 = fma(_1557, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1545);
    int _1561 = _1451 * int(_1517);
    int _1563 = _1561 + _1437;
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_1261)
    {
        _1551 = _1135;
    }
    float _1567 = _1551;
    float _1569 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1571 = _387 != 0.0;
    bool _1573 = isnan(_387);
    bool _1575 = _1571 || _1573;
    bool _1577 = isnan(0.0);
    bool _1579 = _1575 || _1577;
    float _1581 = trunc(_1309);
    int _1583 = int(_1581);
    float _1585 = float(uint(_1563));
    float _1587 = -_1537;
    float _1589 = _1465 + _1587;
    float _1591 = as_type<float>(_1445) * _1585;
    float _1593 = float(_1437);
    float _1595 = _1291 * _1589;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1599 = trunc(_1591);
    float _1601 = precise::max(_1599, 0.0);
    uint _1603 = uint(_1601);
    float _1605 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1597);
    float _1607 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1609 = _1593 >= _1291;
    bool _1611 = isnan(_1593);
    bool _1613 = _1609 || _1611;
    bool _1615 = isnan(_1291);
    bool _1617 = _1613 || _1615;
    float _1619 = float(_1617);
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (!_1261)
    {
        _1207 = _1117;
    }
    float _1623 = _1207;
    float _1625 = -_1565;
    float _1627 = fma(_1607, 2.0, _1625);
    bool _1629 = _385 == 0.0;
    bool _1631 = !_1579;
    bool _1633 = _1629 && _1631;
    float _1635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1637 = in.m_82.x;
    float _1639 = in.m_82.y;
    float _1641 = in.m_82.z;
    float _1643 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1621);
    bool _1645 = _389 == 0.0;
    bool _1647 = _1645 && _1633;
    float _1649 = -_163;
    float _1651 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1627);
    float _1653 = _1623 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1655 = int(_1517) + int(_1603);
    float _1657 = trunc(_1619);
    int _1659 = int(_1657);
    int _1661 = abs(_534);
    int _1663 = _1533 * _1655;
    int _1665 = _1663 + _1437;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1669 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1671 = uint(_1665) >= uint(_1265);
    float _1673 = _504 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1675 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1115);
    float _1677 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1667);
    bool _1679 = !_1671;
    int _1681 = _1679 ? 0 : (-1);
    float _1683 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1673);
    float _1685 = _1635 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1687 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1689 = ~_1655;
    int _1691 = _1689 + _1681;
    int _1693 = _1691 + 1;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1697 = _1265 == 0;
    float _1699 = trunc(_1595);
    int _1701 = int(_1699);
    float _1703 = as_type<float>(_1603);
    float _1705 = _1643;
    if (_1647)
    {
        _1177 = _1637;
    }
    float _1707 = _1177;
    int _1709 = _1265 * _1693;
    int _1711 = _1709 + _1437;
    int _1713 = ~_1659;
    int _1715 = _1713 + 1;
    int _1717 = _1715 + 1;
    float _1719 = fma(_1685, _1211, -0.5);
    float _1721 = _1669 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1723 = _1707;
    if (!_1647)
    {
        float _1725 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1637);
        _1723 = _1725;
    }
    float _1727 = _1723;
    bool _1729 = !_1697;
    int _1731 = _1729 ? _1711 : (-1);
    float _1733 = fma(_1569, -2.0, _1695);
    int _1735 = _1265 + (-1);
    float _1737 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1739 = !_1245;
    int _1741 = _1739 ? 0 : 1;
    int _1743 = _1731 * _1717;
    float _1745 = _1737;
    if (_1647)
    {
        _1703 = _1639;
    }
    float _1747 = _1703;
    float _1749 = _1747;
    if (!_1647)
    {
        float _1751 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1639);
        _1749 = _1751;
    }
    float _1753 = _1749;
    int _1755 = _1659 * _1735;
    int _1757 = _1755 + _1743;
    int _1759 = abs(_1741);
    float _1761 = fma(_1567, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1737);
    if (_1647)
    {
        _1745 = _1641;
    }
    float _1763 = _1745;
    int _1765 = _1757 * _1661;
    bool _1767 = !_1269;
    int _1769 = _1767 ? 0 : 1;
    int _1771 = _1701 * _1759;
    int _1773 = _1771 + _1437;
    int _1775 = abs(_538);
    float _1777 = _1763;
    if (!_1647)
    {
        float _1779 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1641);
        _1777 = _1779;
    }
    float _1781 = _1777;
    int _1783 = abs(_1769);
    float _1785 = -_1529;
    float _1787 = _1785 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1789 = !_1273;
    int _1791 = _1789 ? 0 : 1;
    int _1793 = _1583 * _1775;
    int _1795 = _1793 + _1765;
    float _1797 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1391);
    float _1799 = fma(_468, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1675);
    int _1801 = abs(_1791);
    int _1803 = _1773 * _1783;
    int _1805 = _1803 + _1795;
    float _1807 = precise::min(_1529, _1787);
    float _1809 = _468 + _1797;
    float _1811 = in.m_84.x;
    float _1813 = in.m_84.y;
    float _1815 = in.m_84.z;
    float _1817 = in.m_84.w;
    float _1819 = fma(_468, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1683);
    int _1821 = _1701 * _1801;
    int _1823 = _1821 + _1805;
    bool _1825 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1827 = isnan(0.0);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1833 = _1829 || _1831;
    float _1835 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1605);
    float _1837 = fma(_1463, _1493, _1541);
    float _1839 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1677);
    float _1841 = float(uint(_1823));
    float _1843 = fma(_1835, _1719, _1651);
    float _1845 = fma(_1721, _1499, -0.5);
    float _1847 = fma(_1839, _1687, _1549);
    float _1849 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1643);
    float _1851 = as_type<float>(_1445) * _1841;
    int _1853 = ~_1265;
    int _1855 = _1853 + 1;
    float _1857 = -_1809;
    float _1859 = _1857 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1861 = fma(_1849, _1845, _1559);
    float _1863 = trunc(_1851);
    float _1865 = precise::max(_1863, 0.0);
    uint _1867 = uint(_1865);
    if (_1833)
    {
        float _1869 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1553 = _1869;
    }
    float _1871 = _1553;
    float _1873 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1733);
    float _1875 = precise::min(_1809, _1859);
    float _1877 = _1799 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1833)
    {
        float _1879 = precise::min(_1871, 20.0);
        _1705 = _1879;
    }
    float _1881 = _1705;
    float _1883 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1885 = _331 * _1813;
    float _1887 = _339 * _1813;
    float _1889 = _335 * _1813;
    float _1891 = _1815 * _1637;
    float _1893 = fma(_287, _1811, _1885);
    float _1895 = fma(_295, _1811, _1887);
    float _1897 = fma(_291, _1811, _1889);
    float _1899 = -_1891;
    float _1901 = fma(_1811, _1641, _1899);
    float _1903 = fma(_313, _1815, _1893);
    int _1905 = _1855 * int(_1867);
    int _1907 = _1905 + _1823;
    float _1909 = _1813 * _1641;
    float _1911 = fma(_323, _1815, _1897);
    float _1913 = fma(_327, _1815, _1895);
    float _1915 = _1811 * _1639;
    float _1917 = float(uint(_1907));
    float _1919 = -_1909;
    float _1921 = fma(_1815, _1639, _1919);
    float _1923 = _1881;
    float _1925 = as_type<float>(_1907);
    if (_1833)
    {
        float _1927 = 1.0 / _1881;
        _1923 = _1927;
    }
    float _1929 = _1923;
    float _1931 = -_1915;
    float _1933 = fma(_1813, _1637, _1931);
    float _1935 = _1819 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1937 = as_type<float>(_1445) * _1917;
    float _1939 = fma(_1653, -2.0, _1883);
    float _1941 = precise::min(_1807, _1875);
    float _1943 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1761);
    float _1945 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1511);
    float _1947 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1939);
    float _1949 = trunc(_1937);
    float _1951 = precise::max(_1949, 0.0);
    uint _1953 = uint(_1951);
    float _1955 = _335 * _1753;
    int _1957 = ~_1265;
    int _1959 = _1957 + 1;
    float _1961 = _1921 * _1817;
    if (!_1833)
    {
        _1925 = 1.0;
    }
    float _1963 = _1925;
    float _1965 = _1877 + _1935;
    float _1967 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1837);
    float _1969 = _1963;
    if (_1833)
    {
        float _1971 = _1941 * _1929;
        float _1973 = precise::clamp(_1971, 0.0, 1.0);
        _1969 = _1973;
    }
    float _1975 = _1969;
    float _1977 = fma(_291, _1727, _1955);
    float _1979 = _1901 * _1817;
    float _1981 = _1933 * _1817;
    float _1983 = _339 * _1753;
    float _1985 = -_1873;
    float _1987 = fma(_1943, _1519, _1985);
    float _1989 = _1979 * _331;
    float _1991 = _1979 * _335;
    float _1993 = _331 * _1753;
    int _1995 = int(_1867) + int(_1953);
    float _1997 = _1979 * _339;
    float _1999 = 1.0 / _1935;
    float _2001 = _1911 * _558;
    float _2003 = _1911 * _668;
    int _2005 = _1959 * _1995;
    int _2007 = _2005 + _1823;
    float _2009 = _1911 * _568;
    float _2011 = fma(_295, _1727, _1983);
    float _2013 = fma(_1903, _662, _2001);
    bool _2015 = uint(_2007) >= uint(_1265);
    float _2017 = fma(_1903, _564, _2003);
    float _2019 = fma(_327, _1781, _2011);
    bool _2021 = !_2015;
    int _2023 = _2021 ? 0 : (-1);
    float _2025 = fma(_287, _1727, _1993);
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2029 = _1965 * _1999;
    float _2031 = _2029 * 0.5;
    float _2033 = -_1947;
    float _2035 = fma(_1945, _1467, _2033);
    int _2037 = ~_1995;
    int _2039 = _2037 + _2023;
    int _2041 = _2039 + 1;
    float _2043 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2047 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2049 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2047);
    float _2051 = _1441 + 0.5;
    float _2053 = float(uint(_1773));
    int _2055 = _1265 * _2041;
    int _2057 = _2055 + _1823;
    float _2059 = _1987 + 0.5;
    float _2061 = fma(_1903, _572, _2009);
    float _2063 = 1.0 / _2049;
    float _2065 = as_type<float>(_1445) * _2053;
    bool _2067 = !_1697;
    int _2069 = _2067 ? _2057 : (-1);
    float _2071 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2073 = _2043 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2075 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2077 = _2069 >> 31;
    float _2079 = _1967 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2081 = trunc(_2065);
    float _2083 = precise::max(_2081, 0.0);
    uint _2085 = uint(_2083);
    int _2087 = ~_1265;
    int _2089 = _2087 + 1;
    float _2091 = fma(_1961, _291, _1991);
    int _2093 = _2077 & 3;
    out.m_86.x = _2071;
    out.m_86.y = _2073;
    out.m_86.z = _2075;
    out.m_86.w = _2079;
    float _2095 = fma(_313, _1781, _2025);
    float _2097 = _1847 + 0.5;
    float _2099 = _1843 + 0.5;
    float _2101 = fma(_1961, _287, _1989);
    float _2103 = fma(_1913, _562, _2017);
    float _2105 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2107 = _2063 * _2105;
    float _2109 = fma(_323, _1781, _1977);
    out.m_88.x = _2097;
    out.m_88.y = _2051;
    out.m_88.z = _2099;
    out.m_88.w = _2059;
    float _2111 = fma(_1961, _295, _1997);
    float _2113 = fma(_1981, _323, _2091);
    int _2115 = _2069 & 3;
    bool _2117 = _2115 != 0;
    float _2119 = fma(_1913, _566, _2013);
    int _2121 = _2069 + _2093;
    int _2123 = _2089 * int(_2085);
    int _2125 = _2123 + _1773;
    float _2127 = abs(_2107);
    float _2129 = log2(_2127);
    float _2131 = _2109 * _568;
    int _2133 = _2121 >> 2;
    float _2135 = fma(_1913, _674, _2061);
    float _2137 = fma(_1981, _313, _2101);
    float _2139 = fma(_1981, _327, _2111);
    float _2141 = _2109 * _558;
    int _2143 = _2133 << 4;
    int _2145 = _2143 + 368;
    out.m_90.x = _2119;
    out.m_90.y = _2103;
    out.m_90.z = _2135;
    float _2147 = float(uint(_2125));
    float _2149 = fma(_2095, _662, _2141);
    uint _2151 = uint(int(uint(_2145) >> uint(2)));
    uint _2153 = uint(int(uint(int(_2151)) >> uint(2)));
    int _2155 = int(_2151) & 3;
    float _2157 = (*spvDescriptorSet0.vp_c9)._m0[int(_2153)][_2155];
    int _2159 = int(_2151) + 1;
    uint _2161 = uint(int(uint(_2159) >> uint(2)));
    int _2163 = _2159 & 3;
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[int(_2161)][_2163];
    float _2167 = _2113 * _568;
    bool _2169 = _2107 <= 8000.0;
    bool _2171 = isnan(_2107);
    bool _2173 = _2169 || _2171;
    bool _2175 = isnan(8000.0);
    bool _2177 = _2173 || _2175;
    float _2179 = float(_2177);
    float _2181 = as_type<float>(_1445) * _2147;
    float _2183 = _2109 * _668;
    float _2185 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2187 = _2113 * _668;
    float _2189 = trunc(_2181);
    float _2191 = precise::max(_2189, 0.0);
    uint _2193 = uint(_2191);
    float _2195 = fma(_2095, _564, _2183);
    float _2197 = fma(_2095, _572, _2131);
    int _2199 = _2069 & 3;
    bool _2201 = _2199 != 0;
    int _2203 = _2145 + 8;
    uint _2205 = uint(int(uint(_2203) >> uint(2)));
    uint _2207 = uint(int(uint(int(_2205)) >> uint(2)));
    int _2209 = int(_2205) & 3;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[int(_2207)][_2209];
    int _2213 = int(_2205) + 1;
    uint _2215 = uint(int(uint(_2213) >> uint(2)));
    int _2217 = _2213 & 3;
    float _2219 = (*spvDescriptorSet0.vp_c9)._m0[int(_2215)][_2217];
    int _2221 = ~_1265;
    int _2223 = _2221 + 1;
    float _2225 = fma(_2137, _564, _2187);
    bool _2227 = uint(_2199) > 1u;
    float _2229 = exp2(_2185);
    int _2231 = _2117 ? 0 : 1;
    float _2233 = _2113 * _558;
    bool _2235 = uint(_2199) >= 2u;
    float _2237 = -_1084;
    float _2239 = _2237 + 1.0;
    int _2241 = ~_2231;
    int _2243 = _2241 + 1;
    int _2245 = _2243 + 1;
    float _2247 = fma(_2137, _662, _2233);
    bool _2249 = !_2201;
    int _2251 = _2249 ? 0 : 1;
    float _2253 = fma(_2137, _572, _2167);
    int _2255 = int(_2085) + int(_2193);
    float _2257 = _1861 + 0.5;
    bool _2259 = _2199 != 3;
    float _2261 = _2035 + 0.5;
    int _2263 = _2245;
    float _2265 = _1975;
    if (!_2227)
    {
        int _2267 = ~_2231;
        int _2269 = _2267 + 1;
        _2263 = _2269;
    }
    int _2271 = _2263;
    int _2273 = _2223 * _2255;
    int _2275 = _2273 + _1773;
    bool _2277 = _2199 != 3;
    float _2279 = fma(_2229, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2281 = precise::clamp(_2279, 0.0, 1.0);
    int _2283 = abs(_2271);
    out.m_92.x = _2257;
    out.m_92.y = _2261;
    int _2285 = _2235 ? 0 : 1;
    int _2287 = ~_2283;
    int _2289 = _2287 + 1;
    int _2291 = _2289 + 1;
    bool _2293 = uint(_2275) >= uint(_1265);
    int _2295 = ~_2285;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    int _2301 = abs(_2251);
    int _2303 = _2299;
    if (_2277)
    {
        int _2305 = ~_2285;
        int _2307 = _2305 + 1;
        _2303 = _2307;
    }
    int _2309 = _2303;
    bool _2311 = !_1241;
    int _2313 = _2311 ? 0 : 1;
    int _2315 = _2291 * as_type<int>(_2165);
    bool _2317 = !_2259;
    int _2319 = _2317 ? 0 : (-1);
    int _2321 = abs(_2309);
    int _2323 = abs(_2319);
    int _2325 = ~_2301;
    int _2327 = _2325 + 1;
    int _2329 = _2327 + 1;
    bool _2331 = !_2293;
    int _2333 = _2331 ? 0 : (-1);
    int _2335 = abs(_2313);
    int _2337 = _2329 * as_type<int>(_2157);
    int _2339 = _2337 + _2315;
    int _2341 = ~_2321;
    int _2343 = _2341 + 1;
    int _2345 = _2343 + 1;
    float _2347 = fma(_2019, _566, _2149);
    int _2349 = ~_2255;
    int _2351 = _2349 + _2333;
    int _2353 = _2351 + 1;
    int _2355 = _2345 * as_type<int>(_2211);
    int _2357 = _2355 + _2339;
    int _2359 = ~_2323;
    int _2361 = _2359 + 1;
    int _2363 = _2361 + 1;
    float _2365 = _948 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2367 = _1265 * _2353;
    int _2369 = _2367 + _1773;
    int _2371 = ~_2335;
    int _2373 = _2371 + 1;
    int _2375 = _2373 + 1;
    float _2377 = in.m_94.x;
    int _2379 = _2363 * as_type<int>(_2219);
    int _2381 = _2379 + _2357;
    float _2383 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2365);
    bool _2385 = !_1697;
    int _2387 = _2385 ? _2369 : (-1);
    float _2389 = fma(_2139, _674, _2253);
    int _2391 = _2381 * _2375;
    float _2393 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2383);
    float _2395 = fma(_2139, _562, _2225);
    int _2397 = _2387 * _2335;
    int _2399 = _2397 + _2391;
    float _2401 = _982 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2403 = fma(_2281, -2.0, 3.0);
    float _2405 = _2281 * _2281;
    float _2407 = fma(_2139, _566, _2247);
    float _2409 = fma(_2019, _562, _2195);
    float _2411 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2393);
    float _2413 = exp2(_2401);
    float _2415 = _2405 * _2403;
    out.m_96.x = _2407;
    out.m_96.y = _2395;
    out.m_96.z = _2389;
    float _2417 = -_2415;
    float _2419 = _2417 + 1.0;
    bool _2421 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2423 = isnan(_916);
    bool _2425 = _2421 || _2423;
    bool _2427 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2429 = _2425 || _2427;
    out.gl_Position.x = _1044;
    out.gl_Position.y = _1062;
    out.gl_Position.z = _2411;
    out.gl_Position.w = _996;
    float _2431 = float(_2399);
    float _2433 = fma(_2419, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2415);
    float _2435 = _2411 + _996;
    float _2437 = fma(_2019, _674, _2197);
    float _2439 = _2179 * _2433;
    float _2441 = _2435 * 0.5;
    float _2443 = -_2413;
    float _2445 = _2443 + 1.0;
    float _2447 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_98.x = _2347;
    out.m_98.y = _2409;
    out.m_98.z = _2437;
    float _2449 = _1975 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2451 = _2445 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2453 = _2239 * _2447;
    float _2455 = precise::clamp(_2453, 0.0, 1.0);
    out.m_100.z = _2441;
    out.m_100.w = _996;
    float _2457 = _2431;
    float _2459 = _2411;
    if (!_2429)
    {
        _2265 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2461 = _2265;
    float _2463 = _2451 * _1086;
    float _2465 = -_2455;
    float _2467 = fma(_2465, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2469 = -_2451;
    float _2471 = _2469 + 1.0;
    out.m_102.x = _2431;
    float _2473 = _1101 * _2463;
    float _2475 = _2467 * _2377;
    float _2477 = _1111 * _2463;
    float _2479 = _1101 * _2471;
    float _2481 = fma(_1107, _2473, _1095);
    float _2483 = fma(_1109, _2473, _1097);
    float _2485 = _2475 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2487 = fma(_1101, _2477, _1099);
    float _2489 = _2463;
    float _2491 = _2461;
    float _2493 = _2461;
    if (!_2429)
    {
        _2457 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2495 = _2457;
    float _2497 = _2495;
    float _2499 = _2495;
    if (!_2429)
    {
        _1149 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2501 = _1149;
    out.m_104.x = _2485;
    float _2503 = _2501;
    float _2505 = _2501;
    if (!_2429)
    {
        _2459 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2507 = _2459;
    float _2509 = _2507;
    float _2511 = _2507;
    if (!_2429)
    {
        _1151 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2513 = _1151;
    out.m_106.x = _2481;
    out.m_106.y = _2483;
    out.m_106.z = _2487;
    out.m_106.w = _2479;
    float _2515 = _2513;
    float _2517 = _2513;
    if (!_2429)
    {
        _2489 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2519 = _2489;
    bool _2521 = !_2429;
    float _2523 = _2519;
    float _2525 = _2519;
    if (!_2521)
    {
        bool _2527 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2529 = isnan(_916);
        bool _2531 = _2527 || _2529;
        bool _2533 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2535 = _2531 || _2533;
        if (!_2535)
        {
            float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2539 = _916 + _2537;
            float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2543 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2541;
            float _2545 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2549 = 1.0 / _2543;
            float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2557 = _2555 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2561 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2567 = _2539 * _2549;
            float _2569 = precise::clamp(_2567, 0.0, 1.0);
            float _2571 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2573 = _2571 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2575 = fma(_2569, _2547, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2577 = fma(_2569, _2573, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2579 = fma(_2569, _2553, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2581 = fma(_2569, _2557, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2583 = fma(_2569, _2561, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2585 = fma(_2569, _2565, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2493 = _2579;
            _2517 = _2583;
            _2499 = _2575;
            _2511 = _2581;
            _2505 = _2577;
            _2525 = _2585;
            _2587 = true;
        }
        else
        {
            bool _2589 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2591 = isnan(_916);
            bool _2593 = _2589 || _2591;
            bool _2595 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2597 = _2593 || _2595;
            if (!_2597)
            {
                _2497 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2599 = _2497;
            _2499 = _2599;
            if (!_2597)
            {
                _2491 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2601 = _2491;
            _2493 = _2601;
            if (!_2597)
            {
                _2503 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2603 = _2503;
            _2505 = _2603;
            if (!_2597)
            {
                _2509 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2605 = _2509;
            _2511 = _2605;
            if (!_2597)
            {
                _2515 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2607 = _2515;
            _2517 = _2607;
            if (!_2597)
            {
                _2523 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2609 = _2523;
            bool _2611 = !_2597;
            _2525 = _2609;
            if (!_2611)
            {
                bool _2613 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2615 = isnan(_916);
                bool _2617 = _2613 || _2615;
                bool _2619 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2621 = _2617 || _2619;
                if (!_2621)
                {
                    float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2625 = _916 + _2623;
                    float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2629 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2627;
                    float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2635 = 1.0 / _2629;
                    float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2645 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2647 = _2645 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2653 = _2625 * _2635;
                    float _2655 = precise::clamp(_2653, 0.0, 1.0);
                    float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2661 = fma(_2655, _2633, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2663 = fma(_2655, _2659, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2665 = fma(_2655, _2639, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2667 = fma(_2655, _2643, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2669 = fma(_2655, _2647, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2671 = fma(_2655, _2651, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2493 = _2665;
                    _2517 = _2669;
                    _2499 = _2661;
                    _2511 = _2667;
                    _2505 = _2663;
                    _2525 = _2671;
                    _2587 = true;
                }
                else
                {
                    _2493 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2517 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2499 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2511 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2505 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2525 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2587 = false;
    float _2673 = _2493;
    float _2675 = _2517;
    float _2677 = _2499;
    float _2679 = _2511;
    float _2681 = _2505;
    float _2683 = _2525;
    float _2685 = fma(_2409, -0.5, 0.5);
    float _2687 = precise::clamp(_2685, 0.0, 1.0);
    float _2689 = -_2673;
    float _2691 = _2689 + _2675;
    float _2693 = -_2677;
    float _2695 = _2693 + _2679;
    float _2697 = -_2681;
    float _2699 = _2697 + _2683;
    bool _2701 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2703 = fma(_2687, _2691, _2673);
    float _2705 = fma(_2687, _2695, _2677);
    float _2707 = fma(_2687, _2699, _2681);
    float _2709 = _2449 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2711 = _2703 * 0.586610972881317138671875;
    out.m_56.x = 1.0;
    float _2713 = fma(_2705, 0.298911988735198974609375, _2711);
    out.m_104.w = _2709;
    float _2715 = fma(_2707, 0.114477999508380889892578125, _2713);
    out.m_108.x = 0.0;
    float _2717 = -_2715;
    float _2719 = _2705 + _2717;
    float _2721 = -_2715;
    float _2723 = _2703 + _2721;
    float _2725 = -_2715;
    float _2727 = _2707 + _2725;
    float _2729 = fma(_2719, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2715);
    float _2731 = fma(_2723, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2715);
    float _2733 = fma(_2727, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2715);
    out.m_110.x = _2729;
    out.m_110.y = _2731;
    out.m_110.z = _2733;
    if (!_2701)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2735 = -_750;
    float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2739 = -_752;
    float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2743 = -_754;
    float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2747 = _2737 * _2737;
    float _2749 = fma(_2741, _2741, _2747);
    float _2751 = fma(_2745, _2745, _2749);
    float _2753 = sqrt(_2751);
    float _2755 = rsqrt(_2751);
    float _2757 = -_2753;
    float _2759 = _2757 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2761 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2763 = precise::clamp(_2761, 0.0, 1.0);
    float _2765 = _2741 * _2755;
    float _2767 = _2737 * _2755;
    float _2769 = abs(_2763);
    float _2771 = log2(_2769);
    float _2773 = _2745 * _2755;
    float _2775 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2777 = _2409 * _2767;
    float _2779 = -_2767;
    float _2781 = -_2775;
    float _2783 = fma(_2779, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2781);
    float _2785 = fma(_2347, _2765, _2777);
    float _2787 = -_2773;
    float _2789 = fma(_2787, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2783);
    float _2791 = fma(_2437, _2773, _2785);
    float _2793 = precise::clamp(_2791, 0.0, 1.0);
    float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2797 = _2789 + _2795;
    float _2799 = _2771 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2801 = _2797 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2803 = precise::clamp(_2801, 0.0, 1.0);
    float _2805 = exp2(_2799);
    float _2807 = _2805 * _2803;
    float _2809 = _2793 * _2807;
    float _2811 = _2809 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2813 = _2809 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2815 = _2809 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_108.x = _2811;
    out.m_108.y = _2813;
    out.m_108.z = _2815;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2587 = false;
    bool _361 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _124 = in.m_53.w;
    float _126 = trunc(_124);
    int _129 = int(_126);
    bool _133 = _129 >= 1;
    float _135 = 0.0;
    if (!_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    float _139 = _137;
    if (!_133)
    {
        out.m_56.x = 0.0;
    }
    int _141 = 0;
    if (!_133)
    {
        float _143 = _137 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2872 = as_type<float>(_145);
        out.gl_Position.z = _2872;
    }
    if (!_133)
    {
        return out;
    }
    float _149 = in.m_58.w;
    bool _151 = _149 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _153 = isnan(_149);
    bool _155 = _151 || _153;
    bool _157 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _159 = _155 || _157;
    float _161 = -_149;
    float _163 = _161 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _165 = 0.0;
    if (_159)
    {
        float _167 = float(_129);
        _165 = _167;
    }
    float _169 = _165;
    bool _171 = _163 >= _169;
    bool _173 = !_159;
    bool _175 = _171 || _173;
    if (_175)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _139;
    if (_175)
    {
        out.m_56.x = 0.0;
    }
    if (_175)
    {
        float _179 = _177 * 5.0;
        _147 = as_type<int>(_179);
    }
    int _181 = _147;
    if (_175)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2940 = as_type<float>(_181);
        out.gl_Position.z = _2940;
    }
    if (_175)
    {
        return out;
    }
    float _183 = in.m_60.x;
    float _185 = in.m_60.y;
    float _187 = in.m_60.z;
    float _189 = in.m_62.x;
    float _191 = in.m_62.y;
    float _193 = in.m_62.z;
    float _195 = in.m_64.x;
    float _197 = in.m_64.y;
    float _199 = in.m_64.z;
    float _201 = _183 * _183;
    float _203 = _187 * _187;
    float _205 = _185 * _185;
    float _207 = fma(_189, _189, _201);
    float _209 = fma(_193, _193, _203);
    float _211 = fma(_191, _191, _205);
    float _213 = fma(_195, _195, _207);
    float _215 = fma(_199, _199, _209);
    float _217 = fma(_197, _197, _211);
    float _219 = sqrt(_213);
    float _221 = sqrt(_215);
    float _223 = sqrt(_217);
    bool _225 = _219 > 0.0;
    bool _227 = _221 > 0.0;
    float _229 = _221;
    if (_225)
    {
        float _231 = rsqrt(_213);
        _229 = _231;
    }
    float _233 = _229;
    float _235 = 0.0;
    if (!_225)
    {
        _235 = 0.0;
    }
    float _237 = _235;
    bool _239 = _223 > 0.0;
    float _241 = 0.0;
    float _243 = _237;
    if (!_225)
    {
        _241 = 0.0;
    }
    float _245 = _241;
    float _247 = 0.0;
    float _249 = _245;
    if (!_225)
    {
        _247 = 0.0;
    }
    float _251 = _247;
    float _253 = _219;
    float _255 = _251;
    if (_227)
    {
        float _257 = rsqrt(_215);
        _253 = _257;
    }
    float _259 = _253;
    float _261 = 0.0;
    if (!_227)
    {
        _261 = 0.0;
    }
    float _263 = _261;
    float _265 = 0.0;
    float _267 = _263;
    if (!_227)
    {
        _265 = 0.0;
    }
    float _269 = _265;
    float _271 = 0.0;
    float _273 = _269;
    if (!_227)
    {
        _271 = 0.0;
    }
    float _275 = _271;
    float _277 = _223;
    float _279 = _275;
    if (_239)
    {
        float _281 = rsqrt(_217);
        _277 = _281;
    }
    float _283 = _277;
    if (_225)
    {
        float _285 = _233 * _189;
        _243 = _285;
    }
    float _287 = _243;
    if (_225)
    {
        float _289 = _233 * _183;
        _249 = _289;
    }
    float _291 = _249;
    if (_225)
    {
        float _293 = _233 * _195;
        _255 = _293;
    }
    float _295 = _255;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = 0.0;
    if (!_239)
    {
        _299 = 0.0;
    }
    float _301 = _299;
    float _303 = 0.0;
    float _305 = _301;
    if (!_239)
    {
        _303 = 0.0;
    }
    float _307 = _303;
    float _309 = _307;
    if (_227)
    {
        float _311 = _259 * _193;
        _267 = _311;
    }
    float _313 = _267;
    float _315 = 0.0;
    if (!_239)
    {
        _315 = 0.0;
    }
    float _317 = _315;
    float _319 = _317;
    if (_227)
    {
        float _321 = _259 * _187;
        _273 = _321;
    }
    float _323 = _273;
    if (_227)
    {
        float _325 = _259 * _199;
        _279 = _325;
    }
    float _327 = _279;
    if (_239)
    {
        float _329 = _283 * _191;
        _305 = _329;
    }
    float _331 = _305;
    if (_239)
    {
        float _333 = _283 * _185;
        _309 = _333;
    }
    float _335 = _309;
    if (_239)
    {
        float _337 = _283 * _197;
        _319 = _337;
    }
    float _339 = _319;
    bool _341 = !_297;
    float _359;
    if (!_341)
    {
        float _343 = in.m_66.x;
        float _345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _347 = _343 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[11].y, _163);
        float _351 = _349 * _345;
        float _353 = floor(_351);
        float _355 = -_353;
        float _357 = _351 + _355;
        _359 = _357;
        _361 = true;
    }
    else
    {
        float _363 = float(_129);
        float _365 = 1.0 / _363;
        float _367 = _163 * _365;
        _359 = _367;
    }
    _361 = false;
    float _369 = _359;
    float _371 = in.m_68.w;
    float _373 = in.m_53.x;
    float _375 = in.m_53.y;
    float _377 = in.m_53.z;
    float _379 = in.m_70.x;
    float _381 = in.m_70.y;
    float _383 = in.m_70.z;
    float _385 = in.m_72.x;
    float _387 = in.m_72.y;
    float _389 = in.m_72.z;
    float _391 = in.m_64.w;
    float _393 = in.m_62.w;
    float _395 = trunc(_371);
    int _397 = int(_395);
    float _399 = in.m_60.w;
    int _401 = _397 << 5;
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
    float _426 = _191 * _375;
    float _428 = _381 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _430 = _379 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _432 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _385);
    float _434 = fma(_189, _373, _426);
    float _436 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _387);
    float _438 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _440 = _430 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _442 = _197 * _375;
    float _444 = _383 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _446 = _436 * _438;
    float _448 = _432 * _440;
    float _450 = fma(_195, _373, _442);
    float _452 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _389);
    float _454 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _456 = _446 * _339;
    float _458 = fma(_199, _377, _450);
    float _460 = _446 * _331;
    float _462 = _452 * _454;
    float _464 = fma(_448, _295, _456);
    float _466 = fma(_193, _377, _434);
    float _468 = _458 + _391;
    float _470 = fma(_448, _287, _460);
    float _472 = fma(_462, _327, _464);
    float _474 = _466 + _393;
    float _476 = _185 * _375;
    float _478 = fma(_462, _313, _470);
    float _480 = _468 + _472;
    float _482 = _446 * _335;
    float _484 = fma(_183, _373, _476);
    float _486 = _474 + _478;
    float _488 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _490 = _480 + _488;
    float _492 = fma(_448, _291, _482);
    float _494 = fma(_187, _377, _484);
    float _496 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _498 = _486 + _496;
    float _500 = _490 * _490;
    float _502 = fma(_462, _323, _492);
    float _504 = _494 + _399;
    float _506 = fma(_498, _498, _500);
    float _508 = _504 + _502;
    float _510 = sqrt(_506);
    bool _512 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _514 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _516 = _512 || _514;
    bool _518 = isnan(0.5);
    bool _520 = _516 || _518;
    bool _522 = _510 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _530 = _528 != 0;
    bool _532 = !_530;
    int _534 = _532 ? 0 : 1;
    bool _536 = !_526;
    int _538 = _536 ? 0 : 1;
    float _540 = _424 * 2.0;
    float _542 = _406 * 2.0;
    float _544 = _412 * 2.0;
    float _546 = _412 * _412;
    float _548 = _418 * _540;
    float _550 = _406 * _540;
    float _552 = _412 * _540;
    float _554 = _418 * _418;
    float _556 = -_548;
    float _558 = fma(_412, _542, _556);
    float _560 = -_550;
    float _562 = fma(_418, _544, _560);
    float _564 = fma(_412, _542, _548);
    float _566 = fma(_418, _542, _552);
    float _568 = fma(_418, _544, _550);
    float _570 = -_552;
    float _572 = fma(_418, _542, _570);
    float _574 = _406 * _406;
    float _576 = _552;
    float _578 = _406;
    float _580 = _412;
    float _582 = _490;
    float _584 = _391;
    if (!_522)
    {
        _576 = _486;
    }
    float _586 = _576;
    float _588 = _586;
    if (!_522)
    {
        _578 = _480;
    }
    float _590 = _578;
    float _592 = _590;
    if (!_522)
    {
        _580 = _508;
    }
    float _594 = _580;
    bool _596 = !_522;
    float _598 = _594;
    if (!_596)
    {
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _602 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _604 = _510 + _602;
        float _606 = _508 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _608 = rsqrt(_506);
        float _610 = _604 * _600;
        float _612 = _610 * 0.15915493667125701904296875;
        float _614 = _612 * 6.283185482025146484375;
        float _616 = cos(_614);
        float _618 = _612 * 6.283185482025146484375;
        float _620 = sin(_618);
        float _622 = _616 + (-1.0);
        float _624 = _622 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _626 = fma(_620, _606, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _628 = fma(_508, _616, _624);
        float _630 = _608 * _626;
        float _632 = fma(_498, _630, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _634 = fma(_490, _630, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _598 = _628;
        _588 = _632;
        _592 = _634;
    }
    float _636 = _598;
    float _638 = _588;
    float _640 = _592;
    float _642 = -_504;
    float _644 = _642 + _636;
    float _646 = -_474;
    float _648 = _646 + _638;
    float _650 = fma(_546, -2.0, 1.0);
    float _652 = fma(_574, -2.0, 1.0);
    float _654 = _644 * _335;
    float _656 = -_468;
    float _658 = _656 + _640;
    float _660 = _644 * _291;
    float _662 = fma(_554, -2.0, _650);
    float _664 = fma(_648, _331, _654);
    float _666 = _644 * _323;
    float _668 = fma(_554, -2.0, _652);
    float _670 = fma(_648, _287, _660);
    float _672 = fma(_658, _339, _664);
    float _674 = fma(_546, -2.0, _652);
    float _676 = fma(_648, _313, _666);
    float _678 = fma(_658, _295, _670);
    float _680 = _672 * _558;
    float _682 = _672 * _668;
    float _684 = _672 * _568;
    float _686 = fma(_658, _327, _676);
    float _688 = fma(_678, _662, _680);
    float _690 = fma(_678, _564, _682);
    float _692 = fma(_678, _572, _684);
    float _694 = fma(_686, _566, _688);
    float _696 = fma(_686, _562, _690);
    float _698 = fma(_686, _674, _692);
    float _700 = _474 + _694;
    float _702 = _504 + _696;
    float _704 = _468 + _698;
    float _706 = _702;
    float _708 = _700;
    float _710 = _704;
    if (!_520)
    {
        float _712 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _714 = _504 + _712;
        float _716 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _718 = _474 + _716;
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _722 = _714 * _714;
        float _724 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _726 = _468 + _724;
        float _728 = fma(_718, _718, _722);
        float _730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _732 = fma(_726, _726, _728);
        float _734 = sqrt(_732);
        float _736 = _720 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _738 = precise::min(_734, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _740 = _738 * _730;
        float _742 = _736 * _740;
        float _744 = fma(_694, _742, _474);
        float _746 = fma(_696, _742, _504);
        float _748 = fma(_698, _742, _468);
        _706 = _746;
        _708 = _744;
        _710 = _748;
    }
    float _750 = _706;
    float _752 = _708;
    float _754 = _710;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _758 = _750 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _762 = _752 + _760;
    float _764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _766 = _754 + _764;
    float _768 = _758 * _758;
    float _770 = fma(_762, _762, _768);
    float _772 = fma(_766, _766, _770);
    float _774 = rsqrt(_772);
    float _776 = _774 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _778 = _762 * _776;
    float _780 = _766 * _776;
    float _782 = _778 * _778;
    float _784 = _780 * _780;
    float _786 = fma(_474, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _788 = _782 + _784;
    float _790 = sqrt(_788);
    bool _792 = _790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _794 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _796 = _790 + _794;
    float _798 = _770;
    float _800 = _788;
    float _802 = _796;
    float _804 = _758;
    float _806 = _776;
    bool _808 = _792;
    if (_792)
    {
        float _810 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _798 = _810;
    }
    float _812 = _798;
    if (_792)
    {
        float _814 = rsqrt(_788);
        _800 = _814;
    }
    float _816 = _800;
    float _818 = _816;
    if (_792)
    {
        float _820 = _796 * _812;
        _802 = _820;
    }
    float _822 = _802;
    float _824 = floor(_786);
    if (_792)
    {
        float _826 = _822 * 0.15915493667125701904296875;
        _582 = _826;
    }
    float _828 = _582;
    float _830 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _832 = _774;
    float _834 = _828;
    if (_792)
    {
        float _836 = _828 * 6.283185482025146484375;
        float _838 = sin(_836);
        _832 = _838;
    }
    float _840 = _832;
    float _842 = precise::max(0.0, _830);
    float _844 = _506;
    float _846 = _842;
    if (_792)
    {
        float _848 = _828 * 6.283185482025146484375;
        float _850 = cos(_848);
        _844 = _850;
    }
    float _852 = _844;
    float _854 = -_776;
    float _856 = -_842;
    float _858 = fma(_758, _854, _856);
    if (_792)
    {
        float _860 = _858 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _804 = _860;
    }
    float _862 = _804;
    float _864 = _862;
    float _866 = _840;
    if (_792)
    {
        float _868 = fma(_840, _862, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _864 = _868;
    }
    float _870 = _864;
    float _872 = _870;
    if (!_792)
    {
        _866 = _778;
    }
    float _874 = _866;
    float _876 = _874;
    if (!_792)
    {
        _834 = _858;
    }
    float _878 = _834;
    float _880 = _878;
    if (_792)
    {
        float _882 = _816 * _870;
        _584 = _882;
    }
    float _884 = _584;
    if (!_792)
    {
        _818 = _780;
    }
    float _886 = _818;
    float _888 = _886;
    float _890 = _852;
    if (_792)
    {
        float _892 = _852 + (-1.0);
        _846 = _892;
    }
    float _894 = _846;
    if (_792)
    {
        float _896 = _778 * _884;
        _876 = _896;
    }
    float _898 = _876;
    if (!_792)
    {
        _872 = _782;
    }
    float _900 = _872;
    float _902 = _900;
    if (_792)
    {
        float _904 = _780 * _884;
        _888 = _904;
    }
    float _906 = _888;
    if (_792)
    {
        float _908 = _894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _806 = _908;
    }
    float _910 = _806;
    if (_792)
    {
        float _912 = _898 * _898;
        _902 = _912;
    }
    float _914 = _902;
    float _916 = sqrt(_772);
    float _918 = _750 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_792)
    {
        float _920 = fma(_858, _852, _910);
        _880 = _920;
    }
    float _922 = _880;
    if (!_792)
    {
        _890 = _784;
    }
    float _924 = _890;
    float _926 = _924;
    if (_792)
    {
        float _928 = _906 * _906;
        _926 = _928;
    }
    float _930 = _926;
    float _932 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[1].x, _918);
    float _934 = fma(_922, _922, _914);
    float _936 = _750 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _938 = _750 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _940 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[1].z, _932);
    float _942 = _934 + _930;
    float _944 = _750 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _946 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[2].x, _936);
    float _948 = _940 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _950 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[0].x, _944);
    float _952 = rsqrt(_942);
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _956 = fma(_916, (*spvDescriptorSet0.vp_c15)._m0[23].w, _954);
    float _958 = precise::clamp(_956, 0.0, 1.0);
    float _960 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[3].x, _938);
    float _962 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[0].z, _950);
    float _964 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[2].z, _946);
    float _966 = -_958;
    float _968 = _966 + 1.0;
    float _970 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[3].z, _960);
    float _972 = _962 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _974 = _948 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _976 = _964 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _978 = _970 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _980 = abs(_968);
    float _982 = log2(_980);
    float _984 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[7].x, _974);
    float _986 = _976 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[7].z, _984);
    float _990 = _952 * _898;
    float _992 = _952 * _922;
    float _994 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _996 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[7].w, _988);
    float _998 = _990 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1000 = _952 * _906;
    float _1002 = fma(_468, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1004 = -_986;
    float _1006 = fma(_1004, _994, 1.0);
    float _1008 = -_998;
    float _1010 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1008);
    float _1012 = -_824;
    float _1014 = _786 + _1012;
    float _1016 = _982 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1018 = floor(_1002);
    float _1020 = -_1000;
    float _1022 = fma(_1020, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1010);
    float _1024 = _948 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1026 = _948 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1028 = fma(_1022, -0.5, 0.5);
    float _1030 = fma(_1022, 0.5, 0.5);
    float _1032 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1024);
    float _1034 = exp2(_1016);
    float _1036 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1026);
    float _1038 = _992 + 1.0;
    float _1040 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1032);
    float _1042 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1036);
    float _1044 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1040);
    float _1046 = log2(_1006);
    float _1048 = -_1018;
    float _1050 = _1002 + _1048;
    float _1052 = fma(_1030, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1054 = fma(_1030, _1052, -0.212114393711090087890625);
    float _1056 = 1.0 / _996;
    float _1058 = -_992;
    float _1060 = fma(_1034, _1038, _1058);
    float _1062 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1042);
    float _1064 = fma(_1030, _1054, 1.570728778839111328125);
    float _1066 = sqrt(_1028);
    float _1068 = _1046 * 0.693147182464599609375;
    float _1070 = _1068 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1072 = fma(_1060, 0.5, 0.5);
    float _1074 = _1044 * _1056;
    float _1076 = _1062 * _1056;
    float _1078 = fma(_1074, 0.5, 0.5);
    float _1080 = fma(_1076, -0.5, 0.5);
    float _1082 = _1066 * 0.636619746685028076171875;
    float2 _4358 = float2(_1014, _1050);
    float _1084 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4358, float2(0.0), isnan(_4358)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4358, float2(0.0), isnan(_4358)), level(0.0)).x;
    float3 _4369 = float3(_1078, _1080, _1070);
    float _1086 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4369, float3(0.0), isnan(_4369)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4369, float3(0.0), isnan(_4369)), level(0.0)).x;
    float _1088 = -_1064;
    float _1090 = fma(_1082, _1088, 1.0);
    float3 _4385 = float3(_1078, _1080, _1070);
    float4 _1093 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4385, float3(0.0), isnan(_4385)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4385, float3(0.0), isnan(_4385)), level(0.0)).xyzw;
    float _1095 = _1093.x;
    float _1097 = _1093.y;
    float _1099 = _1093.z;
    float _1101 = _1093.w;
    float2 _4401 = float2(_1090, _1072);
    float3 _1105 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4401, float2(0.0), isnan(_4401)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4401, float2(0.0), isnan(_4401)), level(0.0)).xyz;
    float _1107 = _1105.x;
    float _1109 = _1105.y;
    float _1111 = _1105.z;
    float _1113 = in.m_74.x;
    float _1115 = _504 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1117 = in.m_66.x;
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1121 = _1119 != 0;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1125 = _1123 != 0;
    float _1127 = in.m_66.z;
    float _1129 = float(_129);
    float _1131 = in.m_74.y;
    float _1133 = in.m_66.w;
    float _1135 = in.m_66.y;
    float _1137 = 1.0 / _1129;
    int _1139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1141 = _1139 != 0;
    int _1143 = 0;
    float _1145 = _1030;
    float _1147 = _1113;
    float _1149 = _996;
    float _1151 = _1062;
    if (_1121)
    {
        float _1153 = -_1113;
        float _1155 = _1153 + 1.0;
        _1143 = as_type<int>(_1155);
    }
    int _1157 = _1143;
    if (!_1121)
    {
        _1145 = _1113;
    }
    float _1159 = _1145;
    int _1161 = 0;
    float _1163 = _1159;
    if (_1125)
    {
        float _1165 = -_1113;
        float _1167 = _1165 + 1.0;
        _1161 = as_type<int>(_1167);
    }
    int _1169 = _1161;
    float _1171 = 0.0;
    if (!_1125)
    {
        _1171 = _1113;
    }
    float _1173 = _1171;
    out.m_76.x = 1.0;
    out.m_76.y = 1.0;
    out.m_76.z = 1.0;
    float _1175 = _1173;
    float _1177 = _1117;
    if (_1121)
    {
        bool _1179 = _1117 > 0.5;
        _808 = _1179;
    }
    bool _1181 = _808;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    out.m_78.x = _752;
    out.m_78.y = _750;
    out.m_78.z = _754;
    if (_1121)
    {
        float _1187 = _1181 ? as_type<float>(_1157) : _1113;
        _1163 = _1187;
    }
    float _1189 = _1163;
    bool _1191 = _1127 > 0.5;
    float _1193 = -_1131;
    float _1195 = _1193 + 1.0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1199 = _1197 != 0;
    float _1201 = 1.0 / _1185;
    float _1203 = _1131;
    float _1205 = _1127;
    float _1207 = _1135;
    if (_1125)
    {
        float _1209 = _1191 ? as_type<float>(_1169) : _1113;
        _1175 = _1209;
    }
    float _1211 = _1175;
    bool _1213 = _1133 > 0.5;
    int _1215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1217 = _1215 != 0;
    float _1219 = _1135 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1221 = _1135 > 0.5;
    float _1223 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1225 = int(_1223);
    int _1227 = _1213 ? as_type<int>(_1195) : as_type<int>(_1131);
    int _1229 = _1221 ? as_type<int>(_1195) : as_type<int>(_1131);
    float _1231 = _1217 ? as_type<float>(_1227) : _1131;
    float _1233 = _1141 ? as_type<float>(_1229) : _1131;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1237 = _1235 != 0;
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1241 = _1239 != 0;
    int _1243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1245 = _1243 != 0;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1249 = _1247 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    if (_1199)
    {
        float _1251 = _1191 ? _1195 : _1131;
        _1203 = _1251;
    }
    float _1253 = _1203;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1257 = _1255 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1261 = _1259 != 0;
    float _1263 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1265 = int(_1263);
    int _1267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1269 = _1267 != 0;
    int _1271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1273 = _1271 != 0;
    float _1275 = 1.0 / _1249;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1283 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = 1.0 / _1257;
    float _1287 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = float(_1265);
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1295 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_80.x = _1283;
    out.m_80.y = _1287;
    out.m_80.z = _1289;
    float _1297 = _163 * _1291;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1301;
    float _1305 = -_1293;
    float _1307 = fma(_1295, 2.0, _1305);
    float _1309 = _1297 * _1137;
    float _1311 = fma(_1219, -2.0, _1299);
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1315 = _1313 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1317 = _1303 * _1285;
    float _1319 = _1315 * _1275;
    float _1321 = float(_1225);
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1325 = _369 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1329 = _369 + _1327;
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1333 = fma(_1317, _1325, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1335 = 1.0 / _1321;
    float _1337 = float(uint(_1265));
    float _1339 = fma(_1319, _1329, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1341 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _1343 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1345 = isnan(_369);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1351 = _1347 || _1349;
    float _1353 = float(_1351);
    float _1355 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1359 = _369 + _1357;
    bool _1361 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1363 = isnan(_369);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1369 = _1365 || _1367;
    float _1371 = float(_1369);
    float _1373 = 1.0 / _1337;
    float _1375 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1331);
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1379 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1377);
    float _1381 = -_1353;
    float _1383 = _1381 + 1.0;
    float _1385 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1311);
    float _1387 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1375);
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1391 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1389);
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1395 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1393;
    float _1397 = _163 * _1335;
    bool _1399 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1401 = isnan(_369);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1407 = _1403 || _1405;
    float _1409 = float(_1407);
    float _1411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1413 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1415 = isnan(_369);
    bool _1417 = _1413 || _1415;
    bool _1419 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1421 = _1417 || _1419;
    float _1423 = float(_1421);
    float _1425 = _1395 * _1201;
    float _1427 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1379);
    float _1429 = -_1423;
    float _1431 = _1429 + 1.0;
    float _1433 = _1423 * _1383;
    float _1435 = trunc(_1397);
    int _1437 = int(_1435);
    float _1439 = -_1385;
    float _1441 = fma(_1387, _1341, _1439);
    float _1443 = _1371 * _1431;
    int _1445 = as_type<int>(_1373) + (-2);
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1449 = ~_1265;
    int _1451 = _1449 + 1;
    float _1453 = _1333 * _1443;
    bool _1455 = !_1261;
    float _1457 = _1455 ? 7.345489978790283203125 : 1.0;
    float _1459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1461 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1463 = fma(_1425, _1359, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1465 = _1457 * _1117;
    float _1467 = fma(_1461, _1253, -0.5);
    int _1469 = as_type<int>(_1461);
    float _1471 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    float _1473 = _1353;
    float _1475 = _1383;
    if (_1237)
    {
        float _1477 = -_1113;
        float _1479 = _1477 + 1.0;
        _1469 = as_type<int>(_1479);
    }
    int _1481 = _1469;
    float _1483 = -_1409;
    float _1485 = _1483 + 1.0;
    float _1487 = float(uint(_1437));
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (!_1261)
    {
        _1471 = _1135;
    }
    float _1491 = _1471;
    float _1493 = _1353 * _1485;
    float _1495 = _1491;
    if (_1237)
    {
        float _1497 = _1221 ? as_type<float>(_1481) : _1113;
        _1147 = _1497;
    }
    float _1499 = _1147;
    float _1501 = as_type<float>(_1445) * _1487;
    float _1503 = -_1371;
    float _1505 = _1503 + 1.0;
    float _1507 = _1459 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1261)
    {
        _1473 = _1117;
    }
    float _1509 = _1473;
    float _1511 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1489);
    float _1513 = trunc(_1501);
    float _1515 = precise::max(_1513, 0.0);
    uint _1517 = uint(_1515);
    float _1519 = fma(_1231, _1507, -0.5);
    float _1521 = _1509;
    if (!_1261)
    {
        _1521 = _1127;
    }
    float _1523 = _1521;
    float _1525 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1453);
    if (_1261)
    {
        _1495 = _1117;
    }
    float _1527 = _1495;
    float _1529 = _474 + _1427;
    int _1531 = ~_1265;
    int _1533 = _1531 + 1;
    float _1535 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1537 = floor(_1465);
    if (!_1261)
    {
        _1475 = _1127;
    }
    float _1539 = _1475;
    float _1541 = fma(_1339, _1433, _1525);
    float _1543 = -_1447;
    float _1545 = fma(_1535, 2.0, _1543);
    float _1547 = -_163;
    float _1549 = fma(_1547, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1307);
    float _1551 = _1539;
    float _1553 = _1549;
    if (_1261)
    {
        _1205 = _1135;
    }
    float _1555 = _1205;
    float _1557 = -_163;
    float _1559 = fma(_1557, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1545);
    int _1561 = _1451 * int(_1517);
    int _1563 = _1561 + _1437;
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_1261)
    {
        _1551 = _1135;
    }
    float _1567 = _1551;
    float _1569 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1571 = _387 != 0.0;
    bool _1573 = isnan(_387);
    bool _1575 = _1571 || _1573;
    bool _1577 = isnan(0.0);
    bool _1579 = _1575 || _1577;
    float _1581 = trunc(_1309);
    int _1583 = int(_1581);
    float _1585 = float(uint(_1563));
    float _1587 = -_1537;
    float _1589 = _1465 + _1587;
    float _1591 = as_type<float>(_1445) * _1585;
    float _1593 = float(_1437);
    float _1595 = _1291 * _1589;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1599 = trunc(_1591);
    float _1601 = precise::max(_1599, 0.0);
    uint _1603 = uint(_1601);
    float _1605 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1597);
    float _1607 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1609 = _1593 >= _1291;
    bool _1611 = isnan(_1593);
    bool _1613 = _1609 || _1611;
    bool _1615 = isnan(_1291);
    bool _1617 = _1613 || _1615;
    float _1619 = float(_1617);
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (!_1261)
    {
        _1207 = _1117;
    }
    float _1623 = _1207;
    float _1625 = -_1565;
    float _1627 = fma(_1607, 2.0, _1625);
    bool _1629 = _385 == 0.0;
    bool _1631 = !_1579;
    bool _1633 = _1629 && _1631;
    float _1635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1637 = in.m_82.x;
    float _1639 = in.m_82.y;
    float _1641 = in.m_82.z;
    float _1643 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1621);
    bool _1645 = _389 == 0.0;
    bool _1647 = _1645 && _1633;
    float _1649 = -_163;
    float _1651 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1627);
    float _1653 = _1623 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1655 = int(_1517) + int(_1603);
    float _1657 = trunc(_1619);
    int _1659 = int(_1657);
    int _1661 = abs(_534);
    int _1663 = _1533 * _1655;
    int _1665 = _1663 + _1437;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1669 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1671 = uint(_1665) >= uint(_1265);
    float _1673 = _504 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1675 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1115);
    float _1677 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1667);
    bool _1679 = !_1671;
    int _1681 = _1679 ? 0 : (-1);
    float _1683 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1673);
    float _1685 = _1635 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1687 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1689 = ~_1655;
    int _1691 = _1689 + _1681;
    int _1693 = _1691 + 1;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1697 = _1265 == 0;
    float _1699 = trunc(_1595);
    int _1701 = int(_1699);
    float _1703 = as_type<float>(_1603);
    float _1705 = _1643;
    if (_1647)
    {
        _1177 = _1637;
    }
    float _1707 = _1177;
    int _1709 = _1265 * _1693;
    int _1711 = _1709 + _1437;
    int _1713 = ~_1659;
    int _1715 = _1713 + 1;
    int _1717 = _1715 + 1;
    float _1719 = fma(_1685, _1211, -0.5);
    float _1721 = _1669 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1723 = _1707;
    if (!_1647)
    {
        float _1725 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1637);
        _1723 = _1725;
    }
    float _1727 = _1723;
    bool _1729 = !_1697;
    int _1731 = _1729 ? _1711 : (-1);
    float _1733 = fma(_1569, -2.0, _1695);
    int _1735 = _1265 + (-1);
    float _1737 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1739 = !_1245;
    int _1741 = _1739 ? 0 : 1;
    int _1743 = _1731 * _1717;
    float _1745 = _1737;
    if (_1647)
    {
        _1703 = _1639;
    }
    float _1747 = _1703;
    float _1749 = _1747;
    if (!_1647)
    {
        float _1751 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1639);
        _1749 = _1751;
    }
    float _1753 = _1749;
    int _1755 = _1659 * _1735;
    int _1757 = _1755 + _1743;
    int _1759 = abs(_1741);
    float _1761 = fma(_1567, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1737);
    if (_1647)
    {
        _1745 = _1641;
    }
    float _1763 = _1745;
    int _1765 = _1757 * _1661;
    bool _1767 = !_1269;
    int _1769 = _1767 ? 0 : 1;
    int _1771 = _1701 * _1759;
    int _1773 = _1771 + _1437;
    int _1775 = abs(_538);
    float _1777 = _1763;
    if (!_1647)
    {
        float _1779 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1641);
        _1777 = _1779;
    }
    float _1781 = _1777;
    int _1783 = abs(_1769);
    float _1785 = -_1529;
    float _1787 = _1785 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1789 = !_1273;
    int _1791 = _1789 ? 0 : 1;
    int _1793 = _1583 * _1775;
    int _1795 = _1793 + _1765;
    float _1797 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1391);
    float _1799 = fma(_468, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1675);
    int _1801 = abs(_1791);
    int _1803 = _1773 * _1783;
    int _1805 = _1803 + _1795;
    float _1807 = precise::min(_1529, _1787);
    float _1809 = _468 + _1797;
    float _1811 = in.m_84.x;
    float _1813 = in.m_84.y;
    float _1815 = in.m_84.z;
    float _1817 = in.m_84.w;
    float _1819 = fma(_468, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1683);
    int _1821 = _1701 * _1801;
    int _1823 = _1821 + _1805;
    bool _1825 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1827 = isnan(0.0);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1833 = _1829 || _1831;
    float _1835 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1605);
    float _1837 = fma(_1463, _1493, _1541);
    float _1839 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1677);
    float _1841 = float(uint(_1823));
    float _1843 = fma(_1835, _1719, _1651);
    float _1845 = fma(_1721, _1499, -0.5);
    float _1847 = fma(_1839, _1687, _1549);
    float _1849 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1643);
    float _1851 = as_type<float>(_1445) * _1841;
    int _1853 = ~_1265;
    int _1855 = _1853 + 1;
    float _1857 = -_1809;
    float _1859 = _1857 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1861 = fma(_1849, _1845, _1559);
    float _1863 = trunc(_1851);
    float _1865 = precise::max(_1863, 0.0);
    uint _1867 = uint(_1865);
    if (_1833)
    {
        float _1869 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1553 = _1869;
    }
    float _1871 = _1553;
    float _1873 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1733);
    float _1875 = precise::min(_1809, _1859);
    float _1877 = _1799 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1833)
    {
        float _1879 = precise::min(_1871, 20.0);
        _1705 = _1879;
    }
    float _1881 = _1705;
    float _1883 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1885 = _331 * _1813;
    float _1887 = _339 * _1813;
    float _1889 = _335 * _1813;
    float _1891 = _1815 * _1637;
    float _1893 = fma(_287, _1811, _1885);
    float _1895 = fma(_295, _1811, _1887);
    float _1897 = fma(_291, _1811, _1889);
    float _1899 = -_1891;
    float _1901 = fma(_1811, _1641, _1899);
    float _1903 = fma(_313, _1815, _1893);
    int _1905 = _1855 * int(_1867);
    int _1907 = _1905 + _1823;
    float _1909 = _1813 * _1641;
    float _1911 = fma(_323, _1815, _1897);
    float _1913 = fma(_327, _1815, _1895);
    float _1915 = _1811 * _1639;
    float _1917 = float(uint(_1907));
    float _1919 = -_1909;
    float _1921 = fma(_1815, _1639, _1919);
    float _1923 = _1881;
    float _1925 = as_type<float>(_1907);
    if (_1833)
    {
        float _1927 = 1.0 / _1881;
        _1923 = _1927;
    }
    float _1929 = _1923;
    float _1931 = -_1915;
    float _1933 = fma(_1813, _1637, _1931);
    float _1935 = _1819 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1937 = as_type<float>(_1445) * _1917;
    float _1939 = fma(_1653, -2.0, _1883);
    float _1941 = precise::min(_1807, _1875);
    float _1943 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1761);
    float _1945 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1511);
    float _1947 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1939);
    float _1949 = trunc(_1937);
    float _1951 = precise::max(_1949, 0.0);
    uint _1953 = uint(_1951);
    float _1955 = _335 * _1753;
    int _1957 = ~_1265;
    int _1959 = _1957 + 1;
    float _1961 = _1921 * _1817;
    if (!_1833)
    {
        _1925 = 1.0;
    }
    float _1963 = _1925;
    float _1965 = _1877 + _1935;
    float _1967 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1837);
    float _1969 = _1963;
    if (_1833)
    {
        float _1971 = _1941 * _1929;
        float _1973 = precise::clamp(_1971, 0.0, 1.0);
        _1969 = _1973;
    }
    float _1975 = _1969;
    float _1977 = fma(_291, _1727, _1955);
    float _1979 = _1901 * _1817;
    float _1981 = _1933 * _1817;
    float _1983 = _339 * _1753;
    float _1985 = -_1873;
    float _1987 = fma(_1943, _1519, _1985);
    float _1989 = _1979 * _331;
    float _1991 = _1979 * _335;
    float _1993 = _331 * _1753;
    int _1995 = int(_1867) + int(_1953);
    float _1997 = _1979 * _339;
    float _1999 = 1.0 / _1935;
    float _2001 = _1911 * _558;
    float _2003 = _1911 * _668;
    int _2005 = _1959 * _1995;
    int _2007 = _2005 + _1823;
    float _2009 = _1911 * _568;
    float _2011 = fma(_295, _1727, _1983);
    float _2013 = fma(_1903, _662, _2001);
    bool _2015 = uint(_2007) >= uint(_1265);
    float _2017 = fma(_1903, _564, _2003);
    float _2019 = fma(_327, _1781, _2011);
    bool _2021 = !_2015;
    int _2023 = _2021 ? 0 : (-1);
    float _2025 = fma(_287, _1727, _1993);
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2029 = _1965 * _1999;
    float _2031 = _2029 * 0.5;
    float _2033 = -_1947;
    float _2035 = fma(_1945, _1467, _2033);
    int _2037 = ~_1995;
    int _2039 = _2037 + _2023;
    int _2041 = _2039 + 1;
    float _2043 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2047 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2049 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2047);
    float _2051 = _1441 + 0.5;
    float _2053 = float(uint(_1773));
    int _2055 = _1265 * _2041;
    int _2057 = _2055 + _1823;
    float _2059 = _1987 + 0.5;
    float _2061 = fma(_1903, _572, _2009);
    float _2063 = 1.0 / _2049;
    float _2065 = as_type<float>(_1445) * _2053;
    bool _2067 = !_1697;
    int _2069 = _2067 ? _2057 : (-1);
    float _2071 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2073 = _2043 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2075 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2077 = _2069 >> 31;
    float _2079 = _1967 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2081 = trunc(_2065);
    float _2083 = precise::max(_2081, 0.0);
    uint _2085 = uint(_2083);
    int _2087 = ~_1265;
    int _2089 = _2087 + 1;
    float _2091 = fma(_1961, _291, _1991);
    int _2093 = _2077 & 3;
    out.m_86.x = _2071;
    out.m_86.y = _2073;
    out.m_86.z = _2075;
    out.m_86.w = _2079;
    float _2095 = fma(_313, _1781, _2025);
    float _2097 = _1847 + 0.5;
    float _2099 = _1843 + 0.5;
    float _2101 = fma(_1961, _287, _1989);
    float _2103 = fma(_1913, _562, _2017);
    float _2105 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2107 = _2063 * _2105;
    float _2109 = fma(_323, _1781, _1977);
    out.m_88.x = _2097;
    out.m_88.y = _2051;
    out.m_88.z = _2099;
    out.m_88.w = _2059;
    float _2111 = fma(_1961, _295, _1997);
    float _2113 = fma(_1981, _323, _2091);
    int _2115 = _2069 & 3;
    bool _2117 = _2115 != 0;
    float _2119 = fma(_1913, _566, _2013);
    int _2121 = _2069 + _2093;
    int _2123 = _2089 * int(_2085);
    int _2125 = _2123 + _1773;
    float _2127 = abs(_2107);
    float _2129 = log2(_2127);
    float _2131 = _2109 * _568;
    int _2133 = _2121 >> 2;
    float _2135 = fma(_1913, _674, _2061);
    float _2137 = fma(_1981, _313, _2101);
    float _2139 = fma(_1981, _327, _2111);
    float _2141 = _2109 * _558;
    int _2143 = _2133 << 4;
    int _2145 = _2143 + 368;
    out.m_90.x = _2119;
    out.m_90.y = _2103;
    out.m_90.z = _2135;
    float _2147 = float(uint(_2125));
    float _2149 = fma(_2095, _662, _2141);
    uint _2151 = uint(int(uint(_2145) >> uint(2)));
    uint _2153 = uint(int(uint(int(_2151)) >> uint(2)));
    int _2155 = int(_2151) & 3;
    float _2157 = (*spvDescriptorSet0.vp_c9)._m0[int(_2153)][_2155];
    int _2159 = int(_2151) + 1;
    uint _2161 = uint(int(uint(_2159) >> uint(2)));
    int _2163 = _2159 & 3;
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[int(_2161)][_2163];
    float _2167 = _2113 * _568;
    bool _2169 = _2107 <= 8000.0;
    bool _2171 = isnan(_2107);
    bool _2173 = _2169 || _2171;
    bool _2175 = isnan(8000.0);
    bool _2177 = _2173 || _2175;
    float _2179 = float(_2177);
    float _2181 = as_type<float>(_1445) * _2147;
    float _2183 = _2109 * _668;
    float _2185 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2187 = _2113 * _668;
    float _2189 = trunc(_2181);
    float _2191 = precise::max(_2189, 0.0);
    uint _2193 = uint(_2191);
    float _2195 = fma(_2095, _564, _2183);
    float _2197 = fma(_2095, _572, _2131);
    int _2199 = _2069 & 3;
    bool _2201 = _2199 != 0;
    int _2203 = _2145 + 8;
    uint _2205 = uint(int(uint(_2203) >> uint(2)));
    uint _2207 = uint(int(uint(int(_2205)) >> uint(2)));
    int _2209 = int(_2205) & 3;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[int(_2207)][_2209];
    int _2213 = int(_2205) + 1;
    uint _2215 = uint(int(uint(_2213) >> uint(2)));
    int _2217 = _2213 & 3;
    float _2219 = (*spvDescriptorSet0.vp_c9)._m0[int(_2215)][_2217];
    int _2221 = ~_1265;
    int _2223 = _2221 + 1;
    float _2225 = fma(_2137, _564, _2187);
    bool _2227 = uint(_2199) > 1u;
    float _2229 = exp2(_2185);
    int _2231 = _2117 ? 0 : 1;
    float _2233 = _2113 * _558;
    bool _2235 = uint(_2199) >= 2u;
    float _2237 = -_1084;
    float _2239 = _2237 + 1.0;
    int _2241 = ~_2231;
    int _2243 = _2241 + 1;
    int _2245 = _2243 + 1;
    float _2247 = fma(_2137, _662, _2233);
    bool _2249 = !_2201;
    int _2251 = _2249 ? 0 : 1;
    float _2253 = fma(_2137, _572, _2167);
    int _2255 = int(_2085) + int(_2193);
    float _2257 = _1861 + 0.5;
    bool _2259 = _2199 != 3;
    float _2261 = _2035 + 0.5;
    int _2263 = _2245;
    float _2265 = _1975;
    if (!_2227)
    {
        int _2267 = ~_2231;
        int _2269 = _2267 + 1;
        _2263 = _2269;
    }
    int _2271 = _2263;
    int _2273 = _2223 * _2255;
    int _2275 = _2273 + _1773;
    bool _2277 = _2199 != 3;
    float _2279 = fma(_2229, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2281 = precise::clamp(_2279, 0.0, 1.0);
    int _2283 = abs(_2271);
    out.m_92.x = _2257;
    out.m_92.y = _2261;
    int _2285 = _2235 ? 0 : 1;
    int _2287 = ~_2283;
    int _2289 = _2287 + 1;
    int _2291 = _2289 + 1;
    bool _2293 = uint(_2275) >= uint(_1265);
    int _2295 = ~_2285;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    int _2301 = abs(_2251);
    int _2303 = _2299;
    if (_2277)
    {
        int _2305 = ~_2285;
        int _2307 = _2305 + 1;
        _2303 = _2307;
    }
    int _2309 = _2303;
    bool _2311 = !_1241;
    int _2313 = _2311 ? 0 : 1;
    int _2315 = _2291 * as_type<int>(_2165);
    bool _2317 = !_2259;
    int _2319 = _2317 ? 0 : (-1);
    int _2321 = abs(_2309);
    int _2323 = abs(_2319);
    int _2325 = ~_2301;
    int _2327 = _2325 + 1;
    int _2329 = _2327 + 1;
    bool _2331 = !_2293;
    int _2333 = _2331 ? 0 : (-1);
    int _2335 = abs(_2313);
    int _2337 = _2329 * as_type<int>(_2157);
    int _2339 = _2337 + _2315;
    int _2341 = ~_2321;
    int _2343 = _2341 + 1;
    int _2345 = _2343 + 1;
    float _2347 = fma(_2019, _566, _2149);
    int _2349 = ~_2255;
    int _2351 = _2349 + _2333;
    int _2353 = _2351 + 1;
    int _2355 = _2345 * as_type<int>(_2211);
    int _2357 = _2355 + _2339;
    int _2359 = ~_2323;
    int _2361 = _2359 + 1;
    int _2363 = _2361 + 1;
    float _2365 = _948 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2367 = _1265 * _2353;
    int _2369 = _2367 + _1773;
    int _2371 = ~_2335;
    int _2373 = _2371 + 1;
    int _2375 = _2373 + 1;
    float _2377 = in.m_94.x;
    int _2379 = _2363 * as_type<int>(_2219);
    int _2381 = _2379 + _2357;
    float _2383 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2365);
    bool _2385 = !_1697;
    int _2387 = _2385 ? _2369 : (-1);
    float _2389 = fma(_2139, _674, _2253);
    int _2391 = _2381 * _2375;
    float _2393 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2383);
    float _2395 = fma(_2139, _562, _2225);
    int _2397 = _2387 * _2335;
    int _2399 = _2397 + _2391;
    float _2401 = _982 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2403 = fma(_2281, -2.0, 3.0);
    float _2405 = _2281 * _2281;
    float _2407 = fma(_2139, _566, _2247);
    float _2409 = fma(_2019, _562, _2195);
    float _2411 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2393);
    float _2413 = exp2(_2401);
    float _2415 = _2405 * _2403;
    out.m_96.x = _2407;
    out.m_96.y = _2395;
    out.m_96.z = _2389;
    float _2417 = -_2415;
    float _2419 = _2417 + 1.0;
    bool _2421 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2423 = isnan(_916);
    bool _2425 = _2421 || _2423;
    bool _2427 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2429 = _2425 || _2427;
    out.gl_Position.x = _1044;
    out.gl_Position.y = _1062;
    out.gl_Position.z = _2411;
    out.gl_Position.w = _996;
    float _2431 = float(_2399);
    float _2433 = fma(_2419, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2415);
    float _2435 = _2411 + _996;
    float _2437 = fma(_2019, _674, _2197);
    float _2439 = _2179 * _2433;
    float _2441 = _2435 * 0.5;
    float _2443 = -_2413;
    float _2445 = _2443 + 1.0;
    float _2447 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_98.x = _2347;
    out.m_98.y = _2409;
    out.m_98.z = _2437;
    float _2449 = _1975 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2451 = _2445 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2453 = _2239 * _2447;
    float _2455 = precise::clamp(_2453, 0.0, 1.0);
    out.m_100.z = _2441;
    out.m_100.w = _996;
    float _2457 = _2431;
    float _2459 = _2411;
    if (!_2429)
    {
        _2265 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2461 = _2265;
    float _2463 = _2451 * _1086;
    float _2465 = -_2455;
    float _2467 = fma(_2465, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2469 = -_2451;
    float _2471 = _2469 + 1.0;
    out.m_102.x = _2431;
    float _2473 = _1101 * _2463;
    float _2475 = _2467 * _2377;
    float _2477 = _1111 * _2463;
    float _2479 = _1101 * _2471;
    float _2481 = fma(_1107, _2473, _1095);
    float _2483 = fma(_1109, _2473, _1097);
    float _2485 = _2475 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2487 = fma(_1101, _2477, _1099);
    float _2489 = _2463;
    float _2491 = _2461;
    float _2493 = _2461;
    if (!_2429)
    {
        _2457 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2495 = _2457;
    float _2497 = _2495;
    float _2499 = _2495;
    if (!_2429)
    {
        _1149 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2501 = _1149;
    out.m_104.x = _2485;
    float _2503 = _2501;
    float _2505 = _2501;
    if (!_2429)
    {
        _2459 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2507 = _2459;
    float _2509 = _2507;
    float _2511 = _2507;
    if (!_2429)
    {
        _1151 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2513 = _1151;
    out.m_106.x = _2481;
    out.m_106.y = _2483;
    out.m_106.z = _2487;
    out.m_106.w = _2479;
    float _2515 = _2513;
    float _2517 = _2513;
    if (!_2429)
    {
        _2489 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2519 = _2489;
    bool _2521 = !_2429;
    float _2523 = _2519;
    float _2525 = _2519;
    if (!_2521)
    {
        bool _2527 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2529 = isnan(_916);
        bool _2531 = _2527 || _2529;
        bool _2533 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2535 = _2531 || _2533;
        if (!_2535)
        {
            float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2539 = _916 + _2537;
            float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2543 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2541;
            float _2545 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2549 = 1.0 / _2543;
            float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2557 = _2555 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2561 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2567 = _2539 * _2549;
            float _2569 = precise::clamp(_2567, 0.0, 1.0);
            float _2571 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2573 = _2571 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2575 = fma(_2569, _2547, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2577 = fma(_2569, _2573, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2579 = fma(_2569, _2553, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2581 = fma(_2569, _2557, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2583 = fma(_2569, _2561, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2585 = fma(_2569, _2565, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2493 = _2579;
            _2517 = _2583;
            _2499 = _2575;
            _2511 = _2581;
            _2505 = _2577;
            _2525 = _2585;
            _2587 = true;
        }
        else
        {
            bool _2589 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2591 = isnan(_916);
            bool _2593 = _2589 || _2591;
            bool _2595 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2597 = _2593 || _2595;
            if (!_2597)
            {
                _2497 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2599 = _2497;
            _2499 = _2599;
            if (!_2597)
            {
                _2491 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2601 = _2491;
            _2493 = _2601;
            if (!_2597)
            {
                _2503 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2603 = _2503;
            _2505 = _2603;
            if (!_2597)
            {
                _2509 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2605 = _2509;
            _2511 = _2605;
            if (!_2597)
            {
                _2515 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2607 = _2515;
            _2517 = _2607;
            if (!_2597)
            {
                _2523 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2609 = _2523;
            bool _2611 = !_2597;
            _2525 = _2609;
            if (!_2611)
            {
                bool _2613 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2615 = isnan(_916);
                bool _2617 = _2613 || _2615;
                bool _2619 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2621 = _2617 || _2619;
                if (!_2621)
                {
                    float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2625 = _916 + _2623;
                    float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2629 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2627;
                    float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2635 = 1.0 / _2629;
                    float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2645 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2647 = _2645 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2653 = _2625 * _2635;
                    float _2655 = precise::clamp(_2653, 0.0, 1.0);
                    float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2661 = fma(_2655, _2633, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2663 = fma(_2655, _2659, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2665 = fma(_2655, _2639, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2667 = fma(_2655, _2643, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2669 = fma(_2655, _2647, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2671 = fma(_2655, _2651, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2493 = _2665;
                    _2517 = _2669;
                    _2499 = _2661;
                    _2511 = _2667;
                    _2505 = _2663;
                    _2525 = _2671;
                    _2587 = true;
                }
                else
                {
                    _2493 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2517 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2499 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2511 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2505 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2525 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2587 = false;
    float _2673 = _2493;
    float _2675 = _2517;
    float _2677 = _2499;
    float _2679 = _2511;
    float _2681 = _2505;
    float _2683 = _2525;
    float _2685 = fma(_2409, -0.5, 0.5);
    float _2687 = precise::clamp(_2685, 0.0, 1.0);
    float _2689 = -_2673;
    float _2691 = _2689 + _2675;
    float _2693 = -_2677;
    float _2695 = _2693 + _2679;
    float _2697 = -_2681;
    float _2699 = _2697 + _2683;
    bool _2701 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2703 = fma(_2687, _2691, _2673);
    float _2705 = fma(_2687, _2695, _2677);
    float _2707 = fma(_2687, _2699, _2681);
    float _2709 = _2449 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2711 = _2703 * 0.586610972881317138671875;
    out.m_56.x = 1.0;
    float _2713 = fma(_2705, 0.298911988735198974609375, _2711);
    out.m_104.w = _2709;
    float _2715 = fma(_2707, 0.114477999508380889892578125, _2713);
    out.m_108.x = 0.0;
    float _2717 = -_2715;
    float _2719 = _2705 + _2717;
    float _2721 = -_2715;
    float _2723 = _2703 + _2721;
    float _2725 = -_2715;
    float _2727 = _2707 + _2725;
    float _2729 = fma(_2719, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2715);
    float _2731 = fma(_2723, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2715);
    float _2733 = fma(_2727, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2715);
    out.m_110.x = _2729;
    out.m_110.y = _2731;
    out.m_110.z = _2733;
    if (!_2701)
    {
        return out;
    }
    float _2735 = -_750;
    float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2739 = -_752;
    float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2743 = -_754;
    float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2747 = _2737 * _2737;
    float _2749 = fma(_2741, _2741, _2747);
    float _2751 = fma(_2745, _2745, _2749);
    float _2753 = sqrt(_2751);
    float _2755 = rsqrt(_2751);
    float _2757 = -_2753;
    float _2759 = _2757 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2761 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2763 = precise::clamp(_2761, 0.0, 1.0);
    float _2765 = _2741 * _2755;
    float _2767 = _2737 * _2755;
    float _2769 = abs(_2763);
    float _2771 = log2(_2769);
    float _2773 = _2745 * _2755;
    float _2775 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2777 = _2409 * _2767;
    float _2779 = -_2767;
    float _2781 = -_2775;
    float _2783 = fma(_2779, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2781);
    float _2785 = fma(_2347, _2765, _2777);
    float _2787 = -_2773;
    float _2789 = fma(_2787, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2783);
    float _2791 = fma(_2437, _2773, _2785);
    float _2793 = precise::clamp(_2791, 0.0, 1.0);
    float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2797 = _2789 + _2795;
    float _2799 = _2771 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2801 = _2797 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2803 = precise::clamp(_2801, 0.0, 1.0);
    float _2805 = exp2(_2799);
    float _2807 = _2805 * _2803;
    float _2809 = _2793 * _2807;
    float _2811 = _2809 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2813 = _2809 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2815 = _2809 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_108.x = _2811;
    out.m_108.y = _2813;
    out.m_108.z = _2815;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2587 = false;
    bool _361 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _124 = in.m_53.w;
    float _126 = trunc(_124);
    int _129 = int(_126);
    bool _133 = _129 >= 1;
    float _135 = 0.0;
    if (!_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    float _139 = _137;
    if (!_133)
    {
        out.m_56.x = 0.0;
    }
    int _141 = 0;
    if (!_133)
    {
        float _143 = _137 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2872 = as_type<float>(_145);
        out.gl_Position.z = _2872;
    }
    if (!_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _149 = in.m_58.w;
    bool _151 = _149 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _153 = isnan(_149);
    bool _155 = _151 || _153;
    bool _157 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _159 = _155 || _157;
    float _161 = -_149;
    float _163 = _161 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _165 = 0.0;
    if (_159)
    {
        float _167 = float(_129);
        _165 = _167;
    }
    float _169 = _165;
    bool _171 = _163 >= _169;
    bool _173 = !_159;
    bool _175 = _171 || _173;
    if (_175)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _177 = _139;
    if (_175)
    {
        out.m_56.x = 0.0;
    }
    if (_175)
    {
        float _179 = _177 * 5.0;
        _147 = as_type<int>(_179);
    }
    int _181 = _147;
    if (_175)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2940 = as_type<float>(_181);
        out.gl_Position.z = _2940;
    }
    if (_175)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _183 = in.m_60.x;
    float _185 = in.m_60.y;
    float _187 = in.m_60.z;
    float _189 = in.m_62.x;
    float _191 = in.m_62.y;
    float _193 = in.m_62.z;
    float _195 = in.m_64.x;
    float _197 = in.m_64.y;
    float _199 = in.m_64.z;
    float _201 = _183 * _183;
    float _203 = _187 * _187;
    float _205 = _185 * _185;
    float _207 = fma(_189, _189, _201);
    float _209 = fma(_193, _193, _203);
    float _211 = fma(_191, _191, _205);
    float _213 = fma(_195, _195, _207);
    float _215 = fma(_199, _199, _209);
    float _217 = fma(_197, _197, _211);
    float _219 = sqrt(_213);
    float _221 = sqrt(_215);
    float _223 = sqrt(_217);
    bool _225 = _219 > 0.0;
    bool _227 = _221 > 0.0;
    float _229 = _221;
    if (_225)
    {
        float _231 = rsqrt(_213);
        _229 = _231;
    }
    float _233 = _229;
    float _235 = 0.0;
    if (!_225)
    {
        _235 = 0.0;
    }
    float _237 = _235;
    bool _239 = _223 > 0.0;
    float _241 = 0.0;
    float _243 = _237;
    if (!_225)
    {
        _241 = 0.0;
    }
    float _245 = _241;
    float _247 = 0.0;
    float _249 = _245;
    if (!_225)
    {
        _247 = 0.0;
    }
    float _251 = _247;
    float _253 = _219;
    float _255 = _251;
    if (_227)
    {
        float _257 = rsqrt(_215);
        _253 = _257;
    }
    float _259 = _253;
    float _261 = 0.0;
    if (!_227)
    {
        _261 = 0.0;
    }
    float _263 = _261;
    float _265 = 0.0;
    float _267 = _263;
    if (!_227)
    {
        _265 = 0.0;
    }
    float _269 = _265;
    float _271 = 0.0;
    float _273 = _269;
    if (!_227)
    {
        _271 = 0.0;
    }
    float _275 = _271;
    float _277 = _223;
    float _279 = _275;
    if (_239)
    {
        float _281 = rsqrt(_217);
        _277 = _281;
    }
    float _283 = _277;
    if (_225)
    {
        float _285 = _233 * _189;
        _243 = _285;
    }
    float _287 = _243;
    if (_225)
    {
        float _289 = _233 * _183;
        _249 = _289;
    }
    float _291 = _249;
    if (_225)
    {
        float _293 = _233 * _195;
        _255 = _293;
    }
    float _295 = _255;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = 0.0;
    if (!_239)
    {
        _299 = 0.0;
    }
    float _301 = _299;
    float _303 = 0.0;
    float _305 = _301;
    if (!_239)
    {
        _303 = 0.0;
    }
    float _307 = _303;
    float _309 = _307;
    if (_227)
    {
        float _311 = _259 * _193;
        _267 = _311;
    }
    float _313 = _267;
    float _315 = 0.0;
    if (!_239)
    {
        _315 = 0.0;
    }
    float _317 = _315;
    float _319 = _317;
    if (_227)
    {
        float _321 = _259 * _187;
        _273 = _321;
    }
    float _323 = _273;
    if (_227)
    {
        float _325 = _259 * _199;
        _279 = _325;
    }
    float _327 = _279;
    if (_239)
    {
        float _329 = _283 * _191;
        _305 = _329;
    }
    float _331 = _305;
    if (_239)
    {
        float _333 = _283 * _185;
        _309 = _333;
    }
    float _335 = _309;
    if (_239)
    {
        float _337 = _283 * _197;
        _319 = _337;
    }
    float _339 = _319;
    bool _341 = !_297;
    float _359;
    if (!_341)
    {
        float _343 = in.m_66.x;
        float _345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _347 = _343 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[11].y, _163);
        float _351 = _349 * _345;
        float _353 = floor(_351);
        float _355 = -_353;
        float _357 = _351 + _355;
        _359 = _357;
        _361 = true;
    }
    else
    {
        float _363 = float(_129);
        float _365 = 1.0 / _363;
        float _367 = _163 * _365;
        _359 = _367;
    }
    _361 = false;
    float _369 = _359;
    float _371 = in.m_68.w;
    float _373 = in.m_53.x;
    float _375 = in.m_53.y;
    float _377 = in.m_53.z;
    float _379 = in.m_70.x;
    float _381 = in.m_70.y;
    float _383 = in.m_70.z;
    float _385 = in.m_72.x;
    float _387 = in.m_72.y;
    float _389 = in.m_72.z;
    float _391 = in.m_64.w;
    float _393 = in.m_62.w;
    float _395 = trunc(_371);
    int _397 = int(_395);
    float _399 = in.m_60.w;
    int _401 = _397 << 5;
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
    float _426 = _191 * _375;
    float _428 = _381 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _430 = _379 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _432 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _385);
    float _434 = fma(_189, _373, _426);
    float _436 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _387);
    float _438 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _440 = _430 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _442 = _197 * _375;
    float _444 = _383 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _446 = _436 * _438;
    float _448 = _432 * _440;
    float _450 = fma(_195, _373, _442);
    float _452 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _389);
    float _454 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _456 = _446 * _339;
    float _458 = fma(_199, _377, _450);
    float _460 = _446 * _331;
    float _462 = _452 * _454;
    float _464 = fma(_448, _295, _456);
    float _466 = fma(_193, _377, _434);
    float _468 = _458 + _391;
    float _470 = fma(_448, _287, _460);
    float _472 = fma(_462, _327, _464);
    float _474 = _466 + _393;
    float _476 = _185 * _375;
    float _478 = fma(_462, _313, _470);
    float _480 = _468 + _472;
    float _482 = _446 * _335;
    float _484 = fma(_183, _373, _476);
    float _486 = _474 + _478;
    float _488 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _490 = _480 + _488;
    float _492 = fma(_448, _291, _482);
    float _494 = fma(_187, _377, _484);
    float _496 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _498 = _486 + _496;
    float _500 = _490 * _490;
    float _502 = fma(_462, _323, _492);
    float _504 = _494 + _399;
    float _506 = fma(_498, _498, _500);
    float _508 = _504 + _502;
    float _510 = sqrt(_506);
    bool _512 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _514 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _516 = _512 || _514;
    bool _518 = isnan(0.5);
    bool _520 = _516 || _518;
    bool _522 = _510 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _530 = _528 != 0;
    bool _532 = !_530;
    int _534 = _532 ? 0 : 1;
    bool _536 = !_526;
    int _538 = _536 ? 0 : 1;
    float _540 = _424 * 2.0;
    float _542 = _406 * 2.0;
    float _544 = _412 * 2.0;
    float _546 = _412 * _412;
    float _548 = _418 * _540;
    float _550 = _406 * _540;
    float _552 = _412 * _540;
    float _554 = _418 * _418;
    float _556 = -_548;
    float _558 = fma(_412, _542, _556);
    float _560 = -_550;
    float _562 = fma(_418, _544, _560);
    float _564 = fma(_412, _542, _548);
    float _566 = fma(_418, _542, _552);
    float _568 = fma(_418, _544, _550);
    float _570 = -_552;
    float _572 = fma(_418, _542, _570);
    float _574 = _406 * _406;
    float _576 = _552;
    float _578 = _406;
    float _580 = _412;
    float _582 = _490;
    float _584 = _391;
    if (!_522)
    {
        _576 = _486;
    }
    float _586 = _576;
    float _588 = _586;
    if (!_522)
    {
        _578 = _480;
    }
    float _590 = _578;
    float _592 = _590;
    if (!_522)
    {
        _580 = _508;
    }
    float _594 = _580;
    bool _596 = !_522;
    float _598 = _594;
    if (!_596)
    {
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _602 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _604 = _510 + _602;
        float _606 = _508 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _608 = rsqrt(_506);
        float _610 = _604 * _600;
        float _612 = _610 * 0.15915493667125701904296875;
        float _614 = _612 * 6.283185482025146484375;
        float _616 = cos(_614);
        float _618 = _612 * 6.283185482025146484375;
        float _620 = sin(_618);
        float _622 = _616 + (-1.0);
        float _624 = _622 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _626 = fma(_620, _606, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _628 = fma(_508, _616, _624);
        float _630 = _608 * _626;
        float _632 = fma(_498, _630, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _634 = fma(_490, _630, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _598 = _628;
        _588 = _632;
        _592 = _634;
    }
    float _636 = _598;
    float _638 = _588;
    float _640 = _592;
    float _642 = -_504;
    float _644 = _642 + _636;
    float _646 = -_474;
    float _648 = _646 + _638;
    float _650 = fma(_546, -2.0, 1.0);
    float _652 = fma(_574, -2.0, 1.0);
    float _654 = _644 * _335;
    float _656 = -_468;
    float _658 = _656 + _640;
    float _660 = _644 * _291;
    float _662 = fma(_554, -2.0, _650);
    float _664 = fma(_648, _331, _654);
    float _666 = _644 * _323;
    float _668 = fma(_554, -2.0, _652);
    float _670 = fma(_648, _287, _660);
    float _672 = fma(_658, _339, _664);
    float _674 = fma(_546, -2.0, _652);
    float _676 = fma(_648, _313, _666);
    float _678 = fma(_658, _295, _670);
    float _680 = _672 * _558;
    float _682 = _672 * _668;
    float _684 = _672 * _568;
    float _686 = fma(_658, _327, _676);
    float _688 = fma(_678, _662, _680);
    float _690 = fma(_678, _564, _682);
    float _692 = fma(_678, _572, _684);
    float _694 = fma(_686, _566, _688);
    float _696 = fma(_686, _562, _690);
    float _698 = fma(_686, _674, _692);
    float _700 = _474 + _694;
    float _702 = _504 + _696;
    float _704 = _468 + _698;
    float _706 = _702;
    float _708 = _700;
    float _710 = _704;
    if (!_520)
    {
        float _712 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _714 = _504 + _712;
        float _716 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _718 = _474 + _716;
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _722 = _714 * _714;
        float _724 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _726 = _468 + _724;
        float _728 = fma(_718, _718, _722);
        float _730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _732 = fma(_726, _726, _728);
        float _734 = sqrt(_732);
        float _736 = _720 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _738 = precise::min(_734, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _740 = _738 * _730;
        float _742 = _736 * _740;
        float _744 = fma(_694, _742, _474);
        float _746 = fma(_696, _742, _504);
        float _748 = fma(_698, _742, _468);
        _706 = _746;
        _708 = _744;
        _710 = _748;
    }
    float _750 = _706;
    float _752 = _708;
    float _754 = _710;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _758 = _750 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _762 = _752 + _760;
    float _764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _766 = _754 + _764;
    float _768 = _758 * _758;
    float _770 = fma(_762, _762, _768);
    float _772 = fma(_766, _766, _770);
    float _774 = rsqrt(_772);
    float _776 = _774 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _778 = _762 * _776;
    float _780 = _766 * _776;
    float _782 = _778 * _778;
    float _784 = _780 * _780;
    float _786 = fma(_474, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _788 = _782 + _784;
    float _790 = sqrt(_788);
    bool _792 = _790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _794 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _796 = _790 + _794;
    float _798 = _770;
    float _800 = _788;
    float _802 = _796;
    float _804 = _758;
    float _806 = _776;
    bool _808 = _792;
    if (_792)
    {
        float _810 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _798 = _810;
    }
    float _812 = _798;
    if (_792)
    {
        float _814 = rsqrt(_788);
        _800 = _814;
    }
    float _816 = _800;
    float _818 = _816;
    if (_792)
    {
        float _820 = _796 * _812;
        _802 = _820;
    }
    float _822 = _802;
    float _824 = floor(_786);
    if (_792)
    {
        float _826 = _822 * 0.15915493667125701904296875;
        _582 = _826;
    }
    float _828 = _582;
    float _830 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _832 = _774;
    float _834 = _828;
    if (_792)
    {
        float _836 = _828 * 6.283185482025146484375;
        float _838 = sin(_836);
        _832 = _838;
    }
    float _840 = _832;
    float _842 = precise::max(0.0, _830);
    float _844 = _506;
    float _846 = _842;
    if (_792)
    {
        float _848 = _828 * 6.283185482025146484375;
        float _850 = cos(_848);
        _844 = _850;
    }
    float _852 = _844;
    float _854 = -_776;
    float _856 = -_842;
    float _858 = fma(_758, _854, _856);
    if (_792)
    {
        float _860 = _858 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _804 = _860;
    }
    float _862 = _804;
    float _864 = _862;
    float _866 = _840;
    if (_792)
    {
        float _868 = fma(_840, _862, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _864 = _868;
    }
    float _870 = _864;
    float _872 = _870;
    if (!_792)
    {
        _866 = _778;
    }
    float _874 = _866;
    float _876 = _874;
    if (!_792)
    {
        _834 = _858;
    }
    float _878 = _834;
    float _880 = _878;
    if (_792)
    {
        float _882 = _816 * _870;
        _584 = _882;
    }
    float _884 = _584;
    if (!_792)
    {
        _818 = _780;
    }
    float _886 = _818;
    float _888 = _886;
    float _890 = _852;
    if (_792)
    {
        float _892 = _852 + (-1.0);
        _846 = _892;
    }
    float _894 = _846;
    if (_792)
    {
        float _896 = _778 * _884;
        _876 = _896;
    }
    float _898 = _876;
    if (!_792)
    {
        _872 = _782;
    }
    float _900 = _872;
    float _902 = _900;
    if (_792)
    {
        float _904 = _780 * _884;
        _888 = _904;
    }
    float _906 = _888;
    if (_792)
    {
        float _908 = _894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _806 = _908;
    }
    float _910 = _806;
    if (_792)
    {
        float _912 = _898 * _898;
        _902 = _912;
    }
    float _914 = _902;
    float _916 = sqrt(_772);
    float _918 = _750 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_792)
    {
        float _920 = fma(_858, _852, _910);
        _880 = _920;
    }
    float _922 = _880;
    if (!_792)
    {
        _890 = _784;
    }
    float _924 = _890;
    float _926 = _924;
    if (_792)
    {
        float _928 = _906 * _906;
        _926 = _928;
    }
    float _930 = _926;
    float _932 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[1].x, _918);
    float _934 = fma(_922, _922, _914);
    float _936 = _750 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _938 = _750 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _940 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[1].z, _932);
    float _942 = _934 + _930;
    float _944 = _750 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _946 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[2].x, _936);
    float _948 = _940 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _950 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[0].x, _944);
    float _952 = rsqrt(_942);
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _956 = fma(_916, (*spvDescriptorSet0.vp_c15)._m0[23].w, _954);
    float _958 = precise::clamp(_956, 0.0, 1.0);
    float _960 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[3].x, _938);
    float _962 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[0].z, _950);
    float _964 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[2].z, _946);
    float _966 = -_958;
    float _968 = _966 + 1.0;
    float _970 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[3].z, _960);
    float _972 = _962 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _974 = _948 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _976 = _964 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _978 = _970 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _980 = abs(_968);
    float _982 = log2(_980);
    float _984 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[7].x, _974);
    float _986 = _976 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[7].z, _984);
    float _990 = _952 * _898;
    float _992 = _952 * _922;
    float _994 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _996 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[7].w, _988);
    float _998 = _990 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1000 = _952 * _906;
    float _1002 = fma(_468, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1004 = -_986;
    float _1006 = fma(_1004, _994, 1.0);
    float _1008 = -_998;
    float _1010 = fma(_992, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1008);
    float _1012 = -_824;
    float _1014 = _786 + _1012;
    float _1016 = _982 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1018 = floor(_1002);
    float _1020 = -_1000;
    float _1022 = fma(_1020, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1010);
    float _1024 = _948 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1026 = _948 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1028 = fma(_1022, -0.5, 0.5);
    float _1030 = fma(_1022, 0.5, 0.5);
    float _1032 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1024);
    float _1034 = exp2(_1016);
    float _1036 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1026);
    float _1038 = _992 + 1.0;
    float _1040 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1032);
    float _1042 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1036);
    float _1044 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1040);
    float _1046 = log2(_1006);
    float _1048 = -_1018;
    float _1050 = _1002 + _1048;
    float _1052 = fma(_1030, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1054 = fma(_1030, _1052, -0.212114393711090087890625);
    float _1056 = 1.0 / _996;
    float _1058 = -_992;
    float _1060 = fma(_1034, _1038, _1058);
    float _1062 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1042);
    float _1064 = fma(_1030, _1054, 1.570728778839111328125);
    float _1066 = sqrt(_1028);
    float _1068 = _1046 * 0.693147182464599609375;
    float _1070 = _1068 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1072 = fma(_1060, 0.5, 0.5);
    float _1074 = _1044 * _1056;
    float _1076 = _1062 * _1056;
    float _1078 = fma(_1074, 0.5, 0.5);
    float _1080 = fma(_1076, -0.5, 0.5);
    float _1082 = _1066 * 0.636619746685028076171875;
    float2 _4358 = float2(_1014, _1050);
    float _1084 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4358, float2(0.0), isnan(_4358)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4358, float2(0.0), isnan(_4358)), level(0.0)).x;
    float3 _4369 = float3(_1078, _1080, _1070);
    float _1086 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4369, float3(0.0), isnan(_4369)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4369, float3(0.0), isnan(_4369)), level(0.0)).x;
    float _1088 = -_1064;
    float _1090 = fma(_1082, _1088, 1.0);
    float3 _4385 = float3(_1078, _1080, _1070);
    float4 _1093 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4385, float3(0.0), isnan(_4385)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4385, float3(0.0), isnan(_4385)), level(0.0)).xyzw;
    float _1095 = _1093.x;
    float _1097 = _1093.y;
    float _1099 = _1093.z;
    float _1101 = _1093.w;
    float2 _4401 = float2(_1090, _1072);
    float3 _1105 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4401, float2(0.0), isnan(_4401)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4401, float2(0.0), isnan(_4401)), level(0.0)).xyz;
    float _1107 = _1105.x;
    float _1109 = _1105.y;
    float _1111 = _1105.z;
    float _1113 = in.m_74.x;
    float _1115 = _504 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1117 = in.m_66.x;
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1121 = _1119 != 0;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1125 = _1123 != 0;
    float _1127 = in.m_66.z;
    float _1129 = float(_129);
    float _1131 = in.m_74.y;
    float _1133 = in.m_66.w;
    float _1135 = in.m_66.y;
    float _1137 = 1.0 / _1129;
    int _1139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1141 = _1139 != 0;
    int _1143 = 0;
    float _1145 = _1030;
    float _1147 = _1113;
    float _1149 = _996;
    float _1151 = _1062;
    if (_1121)
    {
        float _1153 = -_1113;
        float _1155 = _1153 + 1.0;
        _1143 = as_type<int>(_1155);
    }
    int _1157 = _1143;
    if (!_1121)
    {
        _1145 = _1113;
    }
    float _1159 = _1145;
    int _1161 = 0;
    float _1163 = _1159;
    if (_1125)
    {
        float _1165 = -_1113;
        float _1167 = _1165 + 1.0;
        _1161 = as_type<int>(_1167);
    }
    int _1169 = _1161;
    float _1171 = 0.0;
    if (!_1125)
    {
        _1171 = _1113;
    }
    float _1173 = _1171;
    out.m_76.x = 1.0;
    out.m_76.y = 1.0;
    out.m_76.z = 1.0;
    float _1175 = _1173;
    float _1177 = _1117;
    if (_1121)
    {
        bool _1179 = _1117 > 0.5;
        _808 = _1179;
    }
    bool _1181 = _808;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    out.m_78.x = _752;
    out.m_78.y = _750;
    out.m_78.z = _754;
    if (_1121)
    {
        float _1187 = _1181 ? as_type<float>(_1157) : _1113;
        _1163 = _1187;
    }
    float _1189 = _1163;
    bool _1191 = _1127 > 0.5;
    float _1193 = -_1131;
    float _1195 = _1193 + 1.0;
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1199 = _1197 != 0;
    float _1201 = 1.0 / _1185;
    float _1203 = _1131;
    float _1205 = _1127;
    float _1207 = _1135;
    if (_1125)
    {
        float _1209 = _1191 ? as_type<float>(_1169) : _1113;
        _1175 = _1209;
    }
    float _1211 = _1175;
    bool _1213 = _1133 > 0.5;
    int _1215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1217 = _1215 != 0;
    float _1219 = _1135 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1221 = _1135 > 0.5;
    float _1223 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1225 = int(_1223);
    int _1227 = _1213 ? as_type<int>(_1195) : as_type<int>(_1131);
    int _1229 = _1221 ? as_type<int>(_1195) : as_type<int>(_1131);
    float _1231 = _1217 ? as_type<float>(_1227) : _1131;
    float _1233 = _1141 ? as_type<float>(_1229) : _1131;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1237 = _1235 != 0;
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1241 = _1239 != 0;
    int _1243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1245 = _1243 != 0;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1249 = _1247 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    if (_1199)
    {
        float _1251 = _1191 ? _1195 : _1131;
        _1203 = _1251;
    }
    float _1253 = _1203;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1257 = _1255 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1261 = _1259 != 0;
    float _1263 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1265 = int(_1263);
    int _1267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1269 = _1267 != 0;
    int _1271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1273 = _1271 != 0;
    float _1275 = 1.0 / _1249;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1283 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = 1.0 / _1257;
    float _1287 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = float(_1265);
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1295 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_80.x = _1283;
    out.m_80.y = _1287;
    out.m_80.z = _1289;
    float _1297 = _163 * _1291;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1301;
    float _1305 = -_1293;
    float _1307 = fma(_1295, 2.0, _1305);
    float _1309 = _1297 * _1137;
    float _1311 = fma(_1219, -2.0, _1299);
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1315 = _1313 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1317 = _1303 * _1285;
    float _1319 = _1315 * _1275;
    float _1321 = float(_1225);
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1325 = _369 + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1329 = _369 + _1327;
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1333 = fma(_1317, _1325, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1335 = 1.0 / _1321;
    float _1337 = float(uint(_1265));
    float _1339 = fma(_1319, _1329, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1341 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _1343 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1345 = isnan(_369);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1351 = _1347 || _1349;
    float _1353 = float(_1351);
    float _1355 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1359 = _369 + _1357;
    bool _1361 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1363 = isnan(_369);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1369 = _1365 || _1367;
    float _1371 = float(_1369);
    float _1373 = 1.0 / _1337;
    float _1375 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1331);
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1379 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1377);
    float _1381 = -_1353;
    float _1383 = _1381 + 1.0;
    float _1385 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1311);
    float _1387 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1375);
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1391 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1389);
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1395 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1393;
    float _1397 = _163 * _1335;
    bool _1399 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1401 = isnan(_369);
    bool _1403 = _1399 || _1401;
    bool _1405 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1407 = _1403 || _1405;
    float _1409 = float(_1407);
    float _1411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1413 = _369 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1415 = isnan(_369);
    bool _1417 = _1413 || _1415;
    bool _1419 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1421 = _1417 || _1419;
    float _1423 = float(_1421);
    float _1425 = _1395 * _1201;
    float _1427 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1379);
    float _1429 = -_1423;
    float _1431 = _1429 + 1.0;
    float _1433 = _1423 * _1383;
    float _1435 = trunc(_1397);
    int _1437 = int(_1435);
    float _1439 = -_1385;
    float _1441 = fma(_1387, _1341, _1439);
    float _1443 = _1371 * _1431;
    int _1445 = as_type<int>(_1373) + (-2);
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1449 = ~_1265;
    int _1451 = _1449 + 1;
    float _1453 = _1333 * _1443;
    bool _1455 = !_1261;
    float _1457 = _1455 ? 7.345489978790283203125 : 1.0;
    float _1459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1461 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1463 = fma(_1425, _1359, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1465 = _1457 * _1117;
    float _1467 = fma(_1461, _1253, -0.5);
    int _1469 = as_type<int>(_1461);
    float _1471 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    float _1473 = _1353;
    float _1475 = _1383;
    if (_1237)
    {
        float _1477 = -_1113;
        float _1479 = _1477 + 1.0;
        _1469 = as_type<int>(_1479);
    }
    int _1481 = _1469;
    float _1483 = -_1409;
    float _1485 = _1483 + 1.0;
    float _1487 = float(uint(_1437));
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (!_1261)
    {
        _1471 = _1135;
    }
    float _1491 = _1471;
    float _1493 = _1353 * _1485;
    float _1495 = _1491;
    if (_1237)
    {
        float _1497 = _1221 ? as_type<float>(_1481) : _1113;
        _1147 = _1497;
    }
    float _1499 = _1147;
    float _1501 = as_type<float>(_1445) * _1487;
    float _1503 = -_1371;
    float _1505 = _1503 + 1.0;
    float _1507 = _1459 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1261)
    {
        _1473 = _1117;
    }
    float _1509 = _1473;
    float _1511 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1489);
    float _1513 = trunc(_1501);
    float _1515 = precise::max(_1513, 0.0);
    uint _1517 = uint(_1515);
    float _1519 = fma(_1231, _1507, -0.5);
    float _1521 = _1509;
    if (!_1261)
    {
        _1521 = _1127;
    }
    float _1523 = _1521;
    float _1525 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1453);
    if (_1261)
    {
        _1495 = _1117;
    }
    float _1527 = _1495;
    float _1529 = _474 + _1427;
    int _1531 = ~_1265;
    int _1533 = _1531 + 1;
    float _1535 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1537 = floor(_1465);
    if (!_1261)
    {
        _1475 = _1127;
    }
    float _1539 = _1475;
    float _1541 = fma(_1339, _1433, _1525);
    float _1543 = -_1447;
    float _1545 = fma(_1535, 2.0, _1543);
    float _1547 = -_163;
    float _1549 = fma(_1547, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1307);
    float _1551 = _1539;
    float _1553 = _1549;
    if (_1261)
    {
        _1205 = _1135;
    }
    float _1555 = _1205;
    float _1557 = -_163;
    float _1559 = fma(_1557, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1545);
    int _1561 = _1451 * int(_1517);
    int _1563 = _1561 + _1437;
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_1261)
    {
        _1551 = _1135;
    }
    float _1567 = _1551;
    float _1569 = _1555 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1571 = _387 != 0.0;
    bool _1573 = isnan(_387);
    bool _1575 = _1571 || _1573;
    bool _1577 = isnan(0.0);
    bool _1579 = _1575 || _1577;
    float _1581 = trunc(_1309);
    int _1583 = int(_1581);
    float _1585 = float(uint(_1563));
    float _1587 = -_1537;
    float _1589 = _1465 + _1587;
    float _1591 = as_type<float>(_1445) * _1585;
    float _1593 = float(_1437);
    float _1595 = _1291 * _1589;
    float _1597 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1599 = trunc(_1591);
    float _1601 = precise::max(_1599, 0.0);
    uint _1603 = uint(_1601);
    float _1605 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1597);
    float _1607 = _1527 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1609 = _1593 >= _1291;
    bool _1611 = isnan(_1593);
    bool _1613 = _1609 || _1611;
    bool _1615 = isnan(_1291);
    bool _1617 = _1613 || _1615;
    float _1619 = float(_1617);
    float _1621 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (!_1261)
    {
        _1207 = _1117;
    }
    float _1623 = _1207;
    float _1625 = -_1565;
    float _1627 = fma(_1607, 2.0, _1625);
    bool _1629 = _385 == 0.0;
    bool _1631 = !_1579;
    bool _1633 = _1629 && _1631;
    float _1635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1637 = in.m_82.x;
    float _1639 = in.m_82.y;
    float _1641 = in.m_82.z;
    float _1643 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1621);
    bool _1645 = _389 == 0.0;
    bool _1647 = _1645 && _1633;
    float _1649 = -_163;
    float _1651 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1627);
    float _1653 = _1623 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1655 = int(_1517) + int(_1603);
    float _1657 = trunc(_1619);
    int _1659 = int(_1657);
    int _1661 = abs(_534);
    int _1663 = _1533 * _1655;
    int _1665 = _1663 + _1437;
    float _1667 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1669 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1671 = uint(_1665) >= uint(_1265);
    float _1673 = _504 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1675 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1115);
    float _1677 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1667);
    bool _1679 = !_1671;
    int _1681 = _1679 ? 0 : (-1);
    float _1683 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1673);
    float _1685 = _1635 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1687 = fma(_1189, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1689 = ~_1655;
    int _1691 = _1689 + _1681;
    int _1693 = _1691 + 1;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1697 = _1265 == 0;
    float _1699 = trunc(_1595);
    int _1701 = int(_1699);
    float _1703 = as_type<float>(_1603);
    float _1705 = _1643;
    if (_1647)
    {
        _1177 = _1637;
    }
    float _1707 = _1177;
    int _1709 = _1265 * _1693;
    int _1711 = _1709 + _1437;
    int _1713 = ~_1659;
    int _1715 = _1713 + 1;
    int _1717 = _1715 + 1;
    float _1719 = fma(_1685, _1211, -0.5);
    float _1721 = _1669 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1723 = _1707;
    if (!_1647)
    {
        float _1725 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1637);
        _1723 = _1725;
    }
    float _1727 = _1723;
    bool _1729 = !_1697;
    int _1731 = _1729 ? _1711 : (-1);
    float _1733 = fma(_1569, -2.0, _1695);
    int _1735 = _1265 + (-1);
    float _1737 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1739 = !_1245;
    int _1741 = _1739 ? 0 : 1;
    int _1743 = _1731 * _1717;
    float _1745 = _1737;
    if (_1647)
    {
        _1703 = _1639;
    }
    float _1747 = _1703;
    float _1749 = _1747;
    if (!_1647)
    {
        float _1751 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1639);
        _1749 = _1751;
    }
    float _1753 = _1749;
    int _1755 = _1659 * _1735;
    int _1757 = _1755 + _1743;
    int _1759 = abs(_1741);
    float _1761 = fma(_1567, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1737);
    if (_1647)
    {
        _1745 = _1641;
    }
    float _1763 = _1745;
    int _1765 = _1757 * _1661;
    bool _1767 = !_1269;
    int _1769 = _1767 ? 0 : 1;
    int _1771 = _1701 * _1759;
    int _1773 = _1771 + _1437;
    int _1775 = abs(_538);
    float _1777 = _1763;
    if (!_1647)
    {
        float _1779 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1641);
        _1777 = _1779;
    }
    float _1781 = _1777;
    int _1783 = abs(_1769);
    float _1785 = -_1529;
    float _1787 = _1785 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1789 = !_1273;
    int _1791 = _1789 ? 0 : 1;
    int _1793 = _1583 * _1775;
    int _1795 = _1793 + _1765;
    float _1797 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1391);
    float _1799 = fma(_468, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1675);
    int _1801 = abs(_1791);
    int _1803 = _1773 * _1783;
    int _1805 = _1803 + _1795;
    float _1807 = precise::min(_1529, _1787);
    float _1809 = _468 + _1797;
    float _1811 = in.m_84.x;
    float _1813 = in.m_84.y;
    float _1815 = in.m_84.z;
    float _1817 = in.m_84.w;
    float _1819 = fma(_468, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1683);
    int _1821 = _1701 * _1801;
    int _1823 = _1821 + _1805;
    bool _1825 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1827 = isnan(0.0);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1833 = _1829 || _1831;
    float _1835 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1605);
    float _1837 = fma(_1463, _1493, _1541);
    float _1839 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1677);
    float _1841 = float(uint(_1823));
    float _1843 = fma(_1835, _1719, _1651);
    float _1845 = fma(_1721, _1499, -0.5);
    float _1847 = fma(_1839, _1687, _1549);
    float _1849 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1643);
    float _1851 = as_type<float>(_1445) * _1841;
    int _1853 = ~_1265;
    int _1855 = _1853 + 1;
    float _1857 = -_1809;
    float _1859 = _1857 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1861 = fma(_1849, _1845, _1559);
    float _1863 = trunc(_1851);
    float _1865 = precise::max(_1863, 0.0);
    uint _1867 = uint(_1865);
    if (_1833)
    {
        float _1869 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1553 = _1869;
    }
    float _1871 = _1553;
    float _1873 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1733);
    float _1875 = precise::min(_1809, _1859);
    float _1877 = _1799 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1833)
    {
        float _1879 = precise::min(_1871, 20.0);
        _1705 = _1879;
    }
    float _1881 = _1705;
    float _1883 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1885 = _331 * _1813;
    float _1887 = _339 * _1813;
    float _1889 = _335 * _1813;
    float _1891 = _1815 * _1637;
    float _1893 = fma(_287, _1811, _1885);
    float _1895 = fma(_295, _1811, _1887);
    float _1897 = fma(_291, _1811, _1889);
    float _1899 = -_1891;
    float _1901 = fma(_1811, _1641, _1899);
    float _1903 = fma(_313, _1815, _1893);
    int _1905 = _1855 * int(_1867);
    int _1907 = _1905 + _1823;
    float _1909 = _1813 * _1641;
    float _1911 = fma(_323, _1815, _1897);
    float _1913 = fma(_327, _1815, _1895);
    float _1915 = _1811 * _1639;
    float _1917 = float(uint(_1907));
    float _1919 = -_1909;
    float _1921 = fma(_1815, _1639, _1919);
    float _1923 = _1881;
    float _1925 = as_type<float>(_1907);
    if (_1833)
    {
        float _1927 = 1.0 / _1881;
        _1923 = _1927;
    }
    float _1929 = _1923;
    float _1931 = -_1915;
    float _1933 = fma(_1813, _1637, _1931);
    float _1935 = _1819 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1937 = as_type<float>(_1445) * _1917;
    float _1939 = fma(_1653, -2.0, _1883);
    float _1941 = precise::min(_1807, _1875);
    float _1943 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1761);
    float _1945 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1511);
    float _1947 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1939);
    float _1949 = trunc(_1937);
    float _1951 = precise::max(_1949, 0.0);
    uint _1953 = uint(_1951);
    float _1955 = _335 * _1753;
    int _1957 = ~_1265;
    int _1959 = _1957 + 1;
    float _1961 = _1921 * _1817;
    if (!_1833)
    {
        _1925 = 1.0;
    }
    float _1963 = _1925;
    float _1965 = _1877 + _1935;
    float _1967 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1837);
    float _1969 = _1963;
    if (_1833)
    {
        float _1971 = _1941 * _1929;
        float _1973 = precise::clamp(_1971, 0.0, 1.0);
        _1969 = _1973;
    }
    float _1975 = _1969;
    float _1977 = fma(_291, _1727, _1955);
    float _1979 = _1901 * _1817;
    float _1981 = _1933 * _1817;
    float _1983 = _339 * _1753;
    float _1985 = -_1873;
    float _1987 = fma(_1943, _1519, _1985);
    float _1989 = _1979 * _331;
    float _1991 = _1979 * _335;
    float _1993 = _331 * _1753;
    int _1995 = int(_1867) + int(_1953);
    float _1997 = _1979 * _339;
    float _1999 = 1.0 / _1935;
    float _2001 = _1911 * _558;
    float _2003 = _1911 * _668;
    int _2005 = _1959 * _1995;
    int _2007 = _2005 + _1823;
    float _2009 = _1911 * _568;
    float _2011 = fma(_295, _1727, _1983);
    float _2013 = fma(_1903, _662, _2001);
    bool _2015 = uint(_2007) >= uint(_1265);
    float _2017 = fma(_1903, _564, _2003);
    float _2019 = fma(_327, _1781, _2011);
    bool _2021 = !_2015;
    int _2023 = _2021 ? 0 : (-1);
    float _2025 = fma(_287, _1727, _1993);
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2029 = _1965 * _1999;
    float _2031 = _2029 * 0.5;
    float _2033 = -_1947;
    float _2035 = fma(_1945, _1467, _2033);
    int _2037 = ~_1995;
    int _2039 = _2037 + _2023;
    int _2041 = _2039 + 1;
    float _2043 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2047 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2049 = fma(_2031, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2047);
    float _2051 = _1441 + 0.5;
    float _2053 = float(uint(_1773));
    int _2055 = _1265 * _2041;
    int _2057 = _2055 + _1823;
    float _2059 = _1987 + 0.5;
    float _2061 = fma(_1903, _572, _2009);
    float _2063 = 1.0 / _2049;
    float _2065 = as_type<float>(_1445) * _2053;
    bool _2067 = !_1697;
    int _2069 = _2067 ? _2057 : (-1);
    float _2071 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2073 = _2043 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2075 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2077 = _2069 >> 31;
    float _2079 = _1967 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2081 = trunc(_2065);
    float _2083 = precise::max(_2081, 0.0);
    uint _2085 = uint(_2083);
    int _2087 = ~_1265;
    int _2089 = _2087 + 1;
    float _2091 = fma(_1961, _291, _1991);
    int _2093 = _2077 & 3;
    out.m_86.x = _2071;
    out.m_86.y = _2073;
    out.m_86.z = _2075;
    out.m_86.w = _2079;
    float _2095 = fma(_313, _1781, _2025);
    float _2097 = _1847 + 0.5;
    float _2099 = _1843 + 0.5;
    float _2101 = fma(_1961, _287, _1989);
    float _2103 = fma(_1913, _562, _2017);
    float _2105 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2107 = _2063 * _2105;
    float _2109 = fma(_323, _1781, _1977);
    out.m_88.x = _2097;
    out.m_88.y = _2051;
    out.m_88.z = _2099;
    out.m_88.w = _2059;
    float _2111 = fma(_1961, _295, _1997);
    float _2113 = fma(_1981, _323, _2091);
    int _2115 = _2069 & 3;
    bool _2117 = _2115 != 0;
    float _2119 = fma(_1913, _566, _2013);
    int _2121 = _2069 + _2093;
    int _2123 = _2089 * int(_2085);
    int _2125 = _2123 + _1773;
    float _2127 = abs(_2107);
    float _2129 = log2(_2127);
    float _2131 = _2109 * _568;
    int _2133 = _2121 >> 2;
    float _2135 = fma(_1913, _674, _2061);
    float _2137 = fma(_1981, _313, _2101);
    float _2139 = fma(_1981, _327, _2111);
    float _2141 = _2109 * _558;
    int _2143 = _2133 << 4;
    int _2145 = _2143 + 368;
    out.m_90.x = _2119;
    out.m_90.y = _2103;
    out.m_90.z = _2135;
    float _2147 = float(uint(_2125));
    float _2149 = fma(_2095, _662, _2141);
    uint _2151 = uint(int(uint(_2145) >> uint(2)));
    uint _2153 = uint(int(uint(int(_2151)) >> uint(2)));
    int _2155 = int(_2151) & 3;
    float _2157 = (*spvDescriptorSet0.vp_c9)._m0[int(_2153)][_2155];
    int _2159 = int(_2151) + 1;
    uint _2161 = uint(int(uint(_2159) >> uint(2)));
    int _2163 = _2159 & 3;
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[int(_2161)][_2163];
    float _2167 = _2113 * _568;
    bool _2169 = _2107 <= 8000.0;
    bool _2171 = isnan(_2107);
    bool _2173 = _2169 || _2171;
    bool _2175 = isnan(8000.0);
    bool _2177 = _2173 || _2175;
    float _2179 = float(_2177);
    float _2181 = as_type<float>(_1445) * _2147;
    float _2183 = _2109 * _668;
    float _2185 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2187 = _2113 * _668;
    float _2189 = trunc(_2181);
    float _2191 = precise::max(_2189, 0.0);
    uint _2193 = uint(_2191);
    float _2195 = fma(_2095, _564, _2183);
    float _2197 = fma(_2095, _572, _2131);
    int _2199 = _2069 & 3;
    bool _2201 = _2199 != 0;
    int _2203 = _2145 + 8;
    uint _2205 = uint(int(uint(_2203) >> uint(2)));
    uint _2207 = uint(int(uint(int(_2205)) >> uint(2)));
    int _2209 = int(_2205) & 3;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[int(_2207)][_2209];
    int _2213 = int(_2205) + 1;
    uint _2215 = uint(int(uint(_2213) >> uint(2)));
    int _2217 = _2213 & 3;
    float _2219 = (*spvDescriptorSet0.vp_c9)._m0[int(_2215)][_2217];
    int _2221 = ~_1265;
    int _2223 = _2221 + 1;
    float _2225 = fma(_2137, _564, _2187);
    bool _2227 = uint(_2199) > 1u;
    float _2229 = exp2(_2185);
    int _2231 = _2117 ? 0 : 1;
    float _2233 = _2113 * _558;
    bool _2235 = uint(_2199) >= 2u;
    float _2237 = -_1084;
    float _2239 = _2237 + 1.0;
    int _2241 = ~_2231;
    int _2243 = _2241 + 1;
    int _2245 = _2243 + 1;
    float _2247 = fma(_2137, _662, _2233);
    bool _2249 = !_2201;
    int _2251 = _2249 ? 0 : 1;
    float _2253 = fma(_2137, _572, _2167);
    int _2255 = int(_2085) + int(_2193);
    float _2257 = _1861 + 0.5;
    bool _2259 = _2199 != 3;
    float _2261 = _2035 + 0.5;
    int _2263 = _2245;
    float _2265 = _1975;
    if (!_2227)
    {
        int _2267 = ~_2231;
        int _2269 = _2267 + 1;
        _2263 = _2269;
    }
    int _2271 = _2263;
    int _2273 = _2223 * _2255;
    int _2275 = _2273 + _1773;
    bool _2277 = _2199 != 3;
    float _2279 = fma(_2229, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2281 = precise::clamp(_2279, 0.0, 1.0);
    int _2283 = abs(_2271);
    out.m_92.x = _2257;
    out.m_92.y = _2261;
    int _2285 = _2235 ? 0 : 1;
    int _2287 = ~_2283;
    int _2289 = _2287 + 1;
    int _2291 = _2289 + 1;
    bool _2293 = uint(_2275) >= uint(_1265);
    int _2295 = ~_2285;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    int _2301 = abs(_2251);
    int _2303 = _2299;
    if (_2277)
    {
        int _2305 = ~_2285;
        int _2307 = _2305 + 1;
        _2303 = _2307;
    }
    int _2309 = _2303;
    bool _2311 = !_1241;
    int _2313 = _2311 ? 0 : 1;
    int _2315 = _2291 * as_type<int>(_2165);
    bool _2317 = !_2259;
    int _2319 = _2317 ? 0 : (-1);
    int _2321 = abs(_2309);
    int _2323 = abs(_2319);
    int _2325 = ~_2301;
    int _2327 = _2325 + 1;
    int _2329 = _2327 + 1;
    bool _2331 = !_2293;
    int _2333 = _2331 ? 0 : (-1);
    int _2335 = abs(_2313);
    int _2337 = _2329 * as_type<int>(_2157);
    int _2339 = _2337 + _2315;
    int _2341 = ~_2321;
    int _2343 = _2341 + 1;
    int _2345 = _2343 + 1;
    float _2347 = fma(_2019, _566, _2149);
    int _2349 = ~_2255;
    int _2351 = _2349 + _2333;
    int _2353 = _2351 + 1;
    int _2355 = _2345 * as_type<int>(_2211);
    int _2357 = _2355 + _2339;
    int _2359 = ~_2323;
    int _2361 = _2359 + 1;
    int _2363 = _2361 + 1;
    float _2365 = _948 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2367 = _1265 * _2353;
    int _2369 = _2367 + _1773;
    int _2371 = ~_2335;
    int _2373 = _2371 + 1;
    int _2375 = _2373 + 1;
    float _2377 = in.m_94.x;
    int _2379 = _2363 * as_type<int>(_2219);
    int _2381 = _2379 + _2357;
    float _2383 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2365);
    bool _2385 = !_1697;
    int _2387 = _2385 ? _2369 : (-1);
    float _2389 = fma(_2139, _674, _2253);
    int _2391 = _2381 * _2375;
    float _2393 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2383);
    float _2395 = fma(_2139, _562, _2225);
    int _2397 = _2387 * _2335;
    int _2399 = _2397 + _2391;
    float _2401 = _982 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2403 = fma(_2281, -2.0, 3.0);
    float _2405 = _2281 * _2281;
    float _2407 = fma(_2139, _566, _2247);
    float _2409 = fma(_2019, _562, _2195);
    float _2411 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2393);
    float _2413 = exp2(_2401);
    float _2415 = _2405 * _2403;
    out.m_96.x = _2407;
    out.m_96.y = _2395;
    out.m_96.z = _2389;
    float _2417 = -_2415;
    float _2419 = _2417 + 1.0;
    bool _2421 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2423 = isnan(_916);
    bool _2425 = _2421 || _2423;
    bool _2427 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2429 = _2425 || _2427;
    out.gl_Position.x = _1044;
    out.gl_Position.y = _1062;
    out.gl_Position.z = _2411;
    out.gl_Position.w = _996;
    float _2431 = float(_2399);
    float _2433 = fma(_2419, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2415);
    float _2435 = _2411 + _996;
    float _2437 = fma(_2019, _674, _2197);
    float _2439 = _2179 * _2433;
    float _2441 = _2435 * 0.5;
    float _2443 = -_2413;
    float _2445 = _2443 + 1.0;
    float _2447 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_98.x = _2347;
    out.m_98.y = _2409;
    out.m_98.z = _2437;
    float _2449 = _1975 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2451 = _2445 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2453 = _2239 * _2447;
    float _2455 = precise::clamp(_2453, 0.0, 1.0);
    out.m_100.z = _2441;
    out.m_100.w = _996;
    float _2457 = _2431;
    float _2459 = _2411;
    if (!_2429)
    {
        _2265 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2461 = _2265;
    float _2463 = _2451 * _1086;
    float _2465 = -_2455;
    float _2467 = fma(_2465, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2469 = -_2451;
    float _2471 = _2469 + 1.0;
    out.m_102.x = _2431;
    float _2473 = _1101 * _2463;
    float _2475 = _2467 * _2377;
    float _2477 = _1111 * _2463;
    float _2479 = _1101 * _2471;
    float _2481 = fma(_1107, _2473, _1095);
    float _2483 = fma(_1109, _2473, _1097);
    float _2485 = _2475 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2487 = fma(_1101, _2477, _1099);
    float _2489 = _2463;
    float _2491 = _2461;
    float _2493 = _2461;
    if (!_2429)
    {
        _2457 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2495 = _2457;
    float _2497 = _2495;
    float _2499 = _2495;
    if (!_2429)
    {
        _1149 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2501 = _1149;
    out.m_104.x = _2485;
    float _2503 = _2501;
    float _2505 = _2501;
    if (!_2429)
    {
        _2459 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2507 = _2459;
    float _2509 = _2507;
    float _2511 = _2507;
    if (!_2429)
    {
        _1151 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2513 = _1151;
    out.m_106.x = _2481;
    out.m_106.y = _2483;
    out.m_106.z = _2487;
    out.m_106.w = _2479;
    float _2515 = _2513;
    float _2517 = _2513;
    if (!_2429)
    {
        _2489 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2519 = _2489;
    bool _2521 = !_2429;
    float _2523 = _2519;
    float _2525 = _2519;
    if (!_2521)
    {
        bool _2527 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2529 = isnan(_916);
        bool _2531 = _2527 || _2529;
        bool _2533 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2535 = _2531 || _2533;
        if (!_2535)
        {
            float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2539 = _916 + _2537;
            float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2543 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2541;
            float _2545 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2549 = 1.0 / _2543;
            float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2557 = _2555 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2561 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2567 = _2539 * _2549;
            float _2569 = precise::clamp(_2567, 0.0, 1.0);
            float _2571 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2573 = _2571 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2575 = fma(_2569, _2547, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2577 = fma(_2569, _2573, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2579 = fma(_2569, _2553, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2581 = fma(_2569, _2557, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2583 = fma(_2569, _2561, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2585 = fma(_2569, _2565, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2493 = _2579;
            _2517 = _2583;
            _2499 = _2575;
            _2511 = _2581;
            _2505 = _2577;
            _2525 = _2585;
            _2587 = true;
        }
        else
        {
            bool _2589 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2591 = isnan(_916);
            bool _2593 = _2589 || _2591;
            bool _2595 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2597 = _2593 || _2595;
            if (!_2597)
            {
                _2497 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2599 = _2497;
            _2499 = _2599;
            if (!_2597)
            {
                _2491 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2601 = _2491;
            _2493 = _2601;
            if (!_2597)
            {
                _2503 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2603 = _2503;
            _2505 = _2603;
            if (!_2597)
            {
                _2509 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2605 = _2509;
            _2511 = _2605;
            if (!_2597)
            {
                _2515 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2607 = _2515;
            _2517 = _2607;
            if (!_2597)
            {
                _2523 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2609 = _2523;
            bool _2611 = !_2597;
            _2525 = _2609;
            if (!_2611)
            {
                bool _2613 = _916 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2615 = isnan(_916);
                bool _2617 = _2613 || _2615;
                bool _2619 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2621 = _2617 || _2619;
                if (!_2621)
                {
                    float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2625 = _916 + _2623;
                    float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2629 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2627;
                    float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2635 = 1.0 / _2629;
                    float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2639 = _2637 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2641 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2643 = _2641 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2645 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2647 = _2645 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2653 = _2625 * _2635;
                    float _2655 = precise::clamp(_2653, 0.0, 1.0);
                    float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2661 = fma(_2655, _2633, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2663 = fma(_2655, _2659, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2665 = fma(_2655, _2639, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2667 = fma(_2655, _2643, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2669 = fma(_2655, _2647, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2671 = fma(_2655, _2651, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2493 = _2665;
                    _2517 = _2669;
                    _2499 = _2661;
                    _2511 = _2667;
                    _2505 = _2663;
                    _2525 = _2671;
                    _2587 = true;
                }
                else
                {
                    _2493 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2517 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2499 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2511 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2505 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2525 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2587 = false;
    float _2673 = _2493;
    float _2675 = _2517;
    float _2677 = _2499;
    float _2679 = _2511;
    float _2681 = _2505;
    float _2683 = _2525;
    float _2685 = fma(_2409, -0.5, 0.5);
    float _2687 = precise::clamp(_2685, 0.0, 1.0);
    float _2689 = -_2673;
    float _2691 = _2689 + _2675;
    float _2693 = -_2677;
    float _2695 = _2693 + _2679;
    float _2697 = -_2681;
    float _2699 = _2697 + _2683;
    bool _2701 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2703 = fma(_2687, _2691, _2673);
    float _2705 = fma(_2687, _2695, _2677);
    float _2707 = fma(_2687, _2699, _2681);
    float _2709 = _2449 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2711 = _2703 * 0.586610972881317138671875;
    out.m_56.x = 1.0;
    float _2713 = fma(_2705, 0.298911988735198974609375, _2711);
    out.m_104.w = _2709;
    float _2715 = fma(_2707, 0.114477999508380889892578125, _2713);
    out.m_108.x = 0.0;
    float _2717 = -_2715;
    float _2719 = _2705 + _2717;
    float _2721 = -_2715;
    float _2723 = _2703 + _2721;
    float _2725 = -_2715;
    float _2727 = _2707 + _2725;
    float _2729 = fma(_2719, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2715);
    float _2731 = fma(_2723, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2715);
    float _2733 = fma(_2727, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2715);
    out.m_110.x = _2729;
    out.m_110.y = _2731;
    out.m_110.z = _2733;
    if (!_2701)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2735 = -_750;
    float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2739 = -_752;
    float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2743 = -_754;
    float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2747 = _2737 * _2737;
    float _2749 = fma(_2741, _2741, _2747);
    float _2751 = fma(_2745, _2745, _2749);
    float _2753 = sqrt(_2751);
    float _2755 = rsqrt(_2751);
    float _2757 = -_2753;
    float _2759 = _2757 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2761 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2763 = precise::clamp(_2761, 0.0, 1.0);
    float _2765 = _2741 * _2755;
    float _2767 = _2737 * _2755;
    float _2769 = abs(_2763);
    float _2771 = log2(_2769);
    float _2773 = _2745 * _2755;
    float _2775 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2777 = _2409 * _2767;
    float _2779 = -_2767;
    float _2781 = -_2775;
    float _2783 = fma(_2779, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2781);
    float _2785 = fma(_2347, _2765, _2777);
    float _2787 = -_2773;
    float _2789 = fma(_2787, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2783);
    float _2791 = fma(_2437, _2773, _2785);
    float _2793 = precise::clamp(_2791, 0.0, 1.0);
    float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2797 = _2789 + _2795;
    float _2799 = _2771 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2801 = _2797 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2803 = precise::clamp(_2801, 0.0, 1.0);
    float _2805 = exp2(_2799);
    float _2807 = _2805 * _2803;
    float _2809 = _2793 * _2807;
    float _2811 = _2809 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2813 = _2809 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2815 = _2809 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_108.x = _2811;
    out.m_108.y = _2813;
    out.m_108.z = _2815;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

