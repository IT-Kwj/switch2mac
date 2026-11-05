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
    float4 m_88 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_86 [[user(locn2)]];
    float4 m_94 [[user(locn3)]];
    float4 m_104 [[user(locn4)]];
    float4 m_56 [[user(locn5)]];
    float4 m_92 [[user(locn6)]];
    float4 m_96 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 m_102 [[user(locn10)]];
    float4 m_98 [[user(locn11)]];
    float4 m_100 [[user(locn12)]];
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
    float4 m_80 [[attribute(7)]];
    float4 m_72 [[attribute(8)]];
    float4 m_66 [[attribute(9)]];
    float4 m_70 [[attribute(10)]];
    float4 m_84 [[attribute(11)]];
    float4 m_76 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2119 = false;
    bool _367 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_53.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    float _133 = _131;
    if (!_127)
    {
        out.m_56.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2404 = as_type<float>(_139);
        out.gl_Position.z = _2404;
    }
    if (!_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_58.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = 0.0;
    if (_153)
    {
        float _161 = float(_123);
        _159 = _161;
    }
    float _163 = _159;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    if (_169)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _133;
    if (_169)
    {
        out.m_56.x = 0.0;
    }
    if (_169)
    {
        float _173 = _171 * 5.0;
        _141 = as_type<int>(_173);
    }
    int _175 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2472 = as_type<float>(_175);
        out.gl_Position.z = _2472;
    }
    if (_169)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    float _195 = in.m_66.x;
    float _197 = _177 * _177;
    float _199 = _179 * _179;
    float _201 = _181 * _181;
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = fma(_187, _187, _201);
    float _209 = fma(_189, _189, _203);
    float _211 = fma(_191, _191, _205);
    float _213 = fma(_193, _193, _207);
    float _215 = sqrt(_209);
    float _217 = sqrt(_211);
    float _219 = sqrt(_213);
    bool _221 = _215 > 0.0;
    bool _223 = _217 > 0.0;
    float _225 = _209;
    if (_221)
    {
        float _227 = rsqrt(_209);
        _225 = _227;
    }
    float _229 = _225;
    float _231 = 0.0;
    if (!_221)
    {
        _231 = 0.0;
    }
    float _233 = _231;
    bool _235 = _219 > 0.0;
    float _237 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _239 = 0.0;
    float _241 = _233;
    if (!_221)
    {
        _239 = 0.0;
    }
    float _243 = _239;
    float _245 = 0.0;
    float _247 = _243;
    if (_223)
    {
        float _249 = rsqrt(_211);
        _245 = _249;
    }
    float _251 = _245;
    float _253 = 0.0;
    if (!_221)
    {
        _253 = 0.0;
    }
    float _255 = _253;
    float _257 = _237 * _195;
    float _259 = 0.0;
    float _261 = _255;
    if (!_223)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    if (!_223)
    {
        _265 = 0.0;
    }
    float _269 = _265;
    float _271 = 0.0;
    float _273 = _269;
    if (!_223)
    {
        _271 = 0.0;
    }
    float _275 = _271;
    float _277 = _217;
    float _279 = _275;
    if (_235)
    {
        float _281 = rsqrt(_213);
        _277 = _281;
    }
    float _283 = _277;
    if (_221)
    {
        float _285 = _229 * _183;
        _241 = _285;
    }
    float _287 = _241;
    if (_221)
    {
        float _289 = _229 * _177;
        _247 = _289;
    }
    float _291 = _247;
    if (_221)
    {
        float _293 = _229 * _189;
        _261 = _293;
    }
    float _295 = _261;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = 0.0;
    if (!_235)
    {
        _299 = 0.0;
    }
    float _301 = _299;
    float _303 = trunc(_257);
    int _305 = int(_303);
    float _307 = 0.0;
    float _309 = _301;
    if (!_235)
    {
        _307 = 0.0;
    }
    float _311 = _307;
    float _313 = _311;
    if (_223)
    {
        float _315 = _251 * _185;
        _267 = _315;
    }
    float _317 = _267;
    float _319 = 0.0;
    if (!_235)
    {
        _319 = 0.0;
    }
    float _321 = _319;
    float _323 = _321;
    if (_223)
    {
        float _325 = _251 * _179;
        _273 = _325;
    }
    float _327 = _273;
    if (_223)
    {
        float _329 = _251 * _191;
        _279 = _329;
    }
    float _331 = _279;
    if (_235)
    {
        float _333 = _283 * _187;
        _309 = _333;
    }
    float _335 = _309;
    if (_235)
    {
        float _337 = _283 * _181;
        _313 = _337;
    }
    float _339 = _313;
    if (_235)
    {
        float _341 = _283 * _193;
        _323 = _341;
    }
    float _343 = _323;
    int _345 = _305 << 4;
    int _347 = _345 + 1712;
    bool _349 = !_297;
    float _365;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _353 = _195 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[11].y, _157);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_123);
        float _371 = 1.0 / _369;
        float _373 = _157 * _371;
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
    int _405 = _403 << 5;
    uint _408 = uint(int(uint(_405) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_408)];
    float _410 = as_type<float>(_dmw0.x);
    int _412 = _405 + 4;
    uint _414 = uint(int(uint(_412) >> uint(2)));
    float _416 = as_type<float>(_dmw0.y);
    int _418 = _405 + 8;
    uint _420 = uint(int(uint(_418) >> uint(2)));
    float _422 = as_type<float>(_dmw0.z);
    int _424 = _405 + 12;
    uint _426 = uint(int(uint(_424) >> uint(2)));
    float _428 = as_type<float>(_dmw0.w);
    float _430 = _191 * _381;
    float _432 = _387 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = _385 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _436 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _393);
    float _438 = fma(_189, _379, _430);
    float _440 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _442 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _391);
    float _444 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _446 = _389 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _448 = _436 * _440;
    float _450 = _185 * _381;
    float _452 = _442 * _444;
    float _454 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _395);
    float _456 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _458 = _448 * _331;
    float _460 = fma(_183, _379, _450);
    float _462 = fma(_193, _383, _438);
    float _464 = _454 * _456;
    float _466 = _448 * _317;
    float _468 = fma(_452, _295, _458);
    float _470 = fma(_187, _383, _460);
    float _472 = _462 + _397;
    float _474 = fma(_452, _287, _466);
    float _476 = fma(_464, _343, _468);
    float _478 = _470 + _399;
    float _480 = _179 * _381;
    float _482 = fma(_464, _335, _474);
    float _484 = _472 + _476;
    float _486 = _448 * _327;
    float _488 = in.m_60.w;
    float _490 = _478 + _482;
    float _492 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _494 = _484 + _492;
    float _496 = fma(_177, _379, _480);
    float _498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _500 = _490 + _498;
    float _502 = _494 * _494;
    float _504 = fma(_181, _383, _496);
    float _506 = fma(_452, _291, _486);
    bool _508 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _510 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _512 = _508 || _510;
    bool _514 = isnan(0.5);
    bool _516 = _512 || _514;
    float _518 = fma(_500, _500, _502);
    float _520 = sqrt(_518);
    bool _522 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _524 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.5);
    bool _530 = _526 || _528;
    float _532 = _504 + _488;
    float _534 = fma(_464, _339, _506);
    float _536 = _532 + _534;
    bool _538 = _520 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _540 = _534;
    float _542 = _452;
    float _544 = _518;
    if (!_538)
    {
        _540 = _490;
    }
    float _546 = _540;
    float _548 = _428 * 2.0;
    float _550 = _410 * 2.0;
    float _552 = _416 * 2.0;
    float _554 = _416 * _416;
    float _556 = _422 * _548;
    float _558 = _416 * _548;
    float _560 = _410 * _548;
    float _562 = _422 * _422;
    float _564 = -_556;
    float _566 = fma(_416, _550, _564);
    float _568 = fma(_416, _550, _556);
    float _570 = fma(_422, _550, _558);
    float _572 = -_558;
    float _574 = fma(_422, _550, _572);
    float _576 = -_560;
    float _578 = fma(_422, _552, _576);
    float _580 = fma(_422, _552, _560);
    float _582 = _410 * _410;
    float _584 = _410;
    float _586 = _416;
    float _588 = _546;
    if (!_538)
    {
        _584 = _484;
    }
    float _590 = _584;
    float _592 = _590;
    if (!_538)
    {
        _586 = _536;
    }
    float _594 = _586;
    bool _596 = !_538;
    float _598 = _594;
    if (!_596)
    {
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _602 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _604 = _520 + _602;
        float _606 = _536 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _608 = rsqrt(_518);
        float _610 = _604 * _600;
        float _612 = _610 * 0.15915493667125701904296875;
        float _614 = _612 * 6.283185482025146484375;
        float _616 = cos(_614);
        float _618 = _612 * 6.283185482025146484375;
        float _620 = sin(_618);
        float _622 = _616 + (-1.0);
        float _624 = _622 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _626 = fma(_620, _606, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _628 = fma(_536, _616, _624);
        float _630 = _608 * _626;
        float _632 = fma(_500, _630, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _634 = fma(_494, _630, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _598 = _628;
        _588 = _632;
        _592 = _634;
    }
    float _636 = _598;
    float _638 = _588;
    float _640 = _592;
    float _642 = -_532;
    float _644 = _642 + _636;
    float _646 = -_478;
    float _648 = _646 + _638;
    float _650 = fma(_554, -2.0, 1.0);
    float _652 = -_472;
    float _654 = _652 + _640;
    float _656 = _644 * _327;
    float _658 = _644 * _291;
    float _660 = fma(_582, -2.0, 1.0);
    float _662 = _644 * _339;
    float _664 = fma(_648, _317, _656);
    float _666 = fma(_562, -2.0, _650);
    float _668 = fma(_648, _287, _658);
    float _670 = fma(_562, -2.0, _660);
    float _672 = fma(_654, _331, _664);
    float _674 = fma(_648, _335, _662);
    float _676 = fma(_654, _295, _668);
    float _678 = fma(_554, -2.0, _660);
    float _680 = _672 * _566;
    float _682 = _672 * _670;
    float _684 = _672 * _580;
    float _686 = fma(_654, _343, _674);
    float _688 = fma(_676, _666, _680);
    float _690 = fma(_676, _568, _682);
    float _692 = fma(_676, _574, _684);
    float _694 = _684;
    if (_530)
    {
        _542 = 1.0;
    }
    float _696 = _542;
    float _698 = fma(_686, _570, _688);
    float _700 = fma(_686, _578, _690);
    float _702 = fma(_686, _678, _692);
    float _704 = _478 + _698;
    float _706 = _532 + _700;
    float _708 = _472 + _702;
    float _710 = _706;
    float _712 = _704;
    float _714 = _708;
    float _716 = _696;
    if (!_516)
    {
        float _718 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _720 = _532 + _718;
        float _722 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _724 = _478 + _722;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _728 = _720 * _720;
        float _730 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _732 = _472 + _730;
        float _734 = fma(_724, _724, _728);
        float _736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _738 = fma(_732, _732, _734);
        float _740 = sqrt(_738);
        float _742 = _726 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _744 = precise::min(_740, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _746 = _744 * _736;
        float _748 = _742 * _746;
        float _750 = fma(_698, _748, _478);
        float _752 = fma(_700, _748, _532);
        float _754 = fma(_702, _748, _472);
        _710 = _752;
        _712 = _750;
        _714 = _754;
    }
    float _756 = _710;
    float _758 = _712;
    float _760 = _714;
    if (!_530)
    {
        float _762 = in.m_74.w;
        int _764 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _766 = _764 == 4;
        bool _768 = _764 == 8;
        bool _770 = _764 == 12;
        int _772 = as_type<int>(_762) << 16;
        int _774 = as_type<int>(_762) << 8;
        int _776 = as_type<int>(_762) << 24;
        int _778 = _772 >> 24;
        int _780 = _774 >> 24;
        int _782 = as_type<int>(_762) >> 24;
        int _784 = _776 >> 24;
        float _786 = float(_778);
        float _788 = float(_780);
        float _790 = float(_782);
        float _792 = _786 * 0.0078740157186985015869140625;
        float _794 = float(_784);
        float _796 = _788 * 0.0078740157186985015869140625;
        float _798 = _790 * 0.0078740157186985015869140625;
        float _800 = precise::min(_792, 1.0);
        float _802 = _794 * 0.0078740157186985015869140625;
        float _804 = precise::min(_796, 1.0);
        float _806 = precise::min(_798, 1.0);
        float _808 = precise::min(_802, 1.0);
        float _810 = precise::max(_800, -1.0);
        float _812 = precise::max(_804, -1.0);
        float _814 = precise::max(_806, -1.0);
        float _816 = precise::max(_808, -1.0);
        float _818 = _816;
        _694 = as_type<float>(_764);
        if (_766)
        {
            _818 = _810;
        }
        float _820 = _818;
        float _822 = _820;
        if (_768)
        {
            _822 = _812;
        }
        float _824 = _822;
        float _826 = _824;
        if (_770)
        {
            _826 = _814;
        }
        float _828 = _826;
        float _830 = abs(_828);
        float _832 = (-0.0) + _830;
        _716 = _832;
    }
    float _834 = _716;
    float _836 = _694;
    float _838 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _840 = _756 + _838;
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _844 = _758 + _842;
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _848 = _760 + _846;
    float _850 = _840 * _840;
    bool _852 = _834 != 0.0;
    bool _854 = isnan(_834);
    bool _856 = _852 || _854;
    bool _858 = isnan(0.0);
    bool _860 = _856 || _858;
    float _862 = fma(_844, _844, _850);
    float _864 = fma(_848, _848, _862);
    float _866 = rsqrt(_864);
    float _868 = sqrt(_864);
    float _870 = _866 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _872 = _844 * _870;
    float _874 = _848 * _870;
    float _876 = _872 * _872;
    float _878 = _874 * _874;
    float _880 = _876 + _878;
    float _882 = sqrt(_880);
    bool _884 = _882 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _888 = _882 + _886;
    float _890 = _866;
    float _892 = _880;
    float _894 = _888;
    float _896 = _840;
    if (_884)
    {
        float _898 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _890 = _898;
    }
    float _900 = _890;
    if (_884)
    {
        float _902 = rsqrt(_880);
        _892 = _902;
    }
    float _904 = _892;
    float _906 = _904;
    if (_884)
    {
        float _908 = _888 * _900;
        _894 = _908;
    }
    float _910 = _894;
    if (_884)
    {
        float _912 = _910 * 0.15915493667125701904296875;
        _544 = _912;
    }
    float _914 = _544;
    float _916 = _836;
    if (_884)
    {
        float _918 = _914 * 6.283185482025146484375;
        float _920 = sin(_918);
        _916 = _920;
    }
    float _922 = _916;
    float _924 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _926 = precise::max(0.0, _924);
    float _928 = _848;
    float _930 = _926;
    float _932 = _924;
    if (_884)
    {
        float _934 = _914 * 6.283185482025146484375;
        float _936 = cos(_934);
        _928 = _936;
    }
    float _938 = _928;
    float _940 = -_870;
    float _942 = -_926;
    float _944 = fma(_840, _940, _942);
    float _946 = _944;
    if (!_884)
    {
        _896 = _872;
    }
    float _948 = _896;
    float _950 = _948;
    if (_884)
    {
        float _952 = _944 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _930 = _952;
    }
    float _954 = _930;
    float _956 = _922;
    float _958 = _954;
    if (_884)
    {
        float _960 = fma(_922, _954, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _956 = _960;
    }
    float _962 = _956;
    if (_884)
    {
        float _964 = _938 + (-1.0);
        _932 = _964;
    }
    float _966 = _932;
    float _968 = 0.0;
    float _970 = _966;
    if (_884)
    {
        float _972 = _904 * _962;
        _968 = _972;
    }
    float _974 = _968;
    float _976 = _756 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _978 = _976;
    if (!_884)
    {
        _906 = _876;
    }
    float _980 = _906;
    float _982 = _980;
    if (_884)
    {
        float _984 = _966 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _958 = _984;
    }
    float _986 = _958;
    if (_884)
    {
        float _988 = _872 * _974;
        _950 = _988;
    }
    float _990 = _950;
    if (!_884)
    {
        _970 = _874;
    }
    float _992 = _970;
    float _994 = _992;
    if (_884)
    {
        float _996 = _874 * _974;
        _994 = _996;
    }
    float _998 = _994;
    if (_884)
    {
        float _1000 = fma(_944, _938, _986);
        _946 = _1000;
    }
    float _1002 = _946;
    if (_884)
    {
        float _1004 = _990 * _990;
        _982 = _1004;
    }
    float _1006 = _982;
    float _1008 = fma(_478, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1010 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[2].x, _976);
    float _1012 = _1008;
    if (!_884)
    {
        _978 = _878;
    }
    float _1014 = _978;
    float _1016 = _1014;
    if (_884)
    {
        float _1018 = _998 * _998;
        _1016 = _1018;
    }
    float _1020 = _1016;
    float _1022 = fma(_1002, _1002, _1006);
    float _1024 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1010);
    float _1026 = _756 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1028 = _1022 + _1020;
    float _1030 = _756 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1034 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1036 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1026);
    float _1038 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1030);
    float _1040 = rsqrt(_1028);
    float _1042 = fma(_472, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1044 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1046 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1038);
    float _1048 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1036);
    float _1050 = -_1044;
    float _1052 = fma(_1050, _1034, 1.0);
    float _1054 = _756 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1058 = fma(_868, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1056);
    float _1060 = precise::clamp(_1058, 0.0, 1.0);
    float _1062 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1064 = _1048 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1066 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1054);
    float _1068 = -_1060;
    float _1070 = _1068 + 1.0;
    float _1072 = floor(_1008);
    float _1074 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1066);
    float _1076 = _1040 * _990;
    float _1078 = _1040 * _1002;
    float _1080 = _1040 * _998;
    float _1082 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1084 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1086 = abs(_1070);
    float _1088 = log2(_1086);
    float _1090 = _1076 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1092 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1084);
    float _1094 = -_1090;
    float _1096 = fma(_1078, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1094);
    float _1098 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1092);
    float _1100 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1102 = -_1080;
    float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1096);
    float _1106 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1108 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1098);
    float _1110 = floor(_1042);
    float _1112 = fma(_1104, -0.5, 0.5);
    float _1114 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1106);
    float _1116 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1100);
    float _1118 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1120 = fma(_1104, 0.5, 0.5);
    float _1122 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1114);
    float _1124 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1116);
    float _1126 = 1.0 / _1108;
    float _1128 = -_1072;
    float _1130 = _1008 + _1128;
    float _1132 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1122);
    float _1134 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1124);
    float _1136 = fma(_1120, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1138 = _1078 + 1.0;
    float _1140 = _1072;
    float _1142 = _1108;
    float _1144 = _1134;
    if (_860)
    {
        _1140 = _1132;
    }
    float _1146 = _1140;
    float _1148 = log2(_1052);
    float _1150 = _1146;
    if (_860)
    {
        _1012 = _1134;
    }
    float _1152 = _1012;
    float _1154 = -_1110;
    float _1156 = _1042 + _1154;
    float _1158 = _1152;
    if (!_860)
    {
        _1150 = 0.0;
    }
    float _1160 = _1150;
    float _1162 = fma(_1120, _1136, -0.212114393711090087890625);
    if (!_860)
    {
        _1158 = 0.0;
    }
    float _1164 = _1158;
    float _1166 = sqrt(_1112);
    float _1168 = _1126 * _1160;
    float _1170 = _1126 * _1164;
    float _1172 = exp2(_1118);
    float _1174 = _1148 * 0.693147182464599609375;
    float2 _4005 = float2(_1130, _1156);
    float _1176 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4005, float2(0.0), isnan(_4005)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4005, float2(0.0), isnan(_4005)), level(0.0)).x;
    float _1178 = fma(_1120, _1162, 1.570728778839111328125);
    float _1180 = fma(_1168, 0.5, 0.5);
    float _1182 = _1174 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1184 = fma(_1170, -0.5, 0.5);
    float _1186 = _1166 * 0.636619746685028076171875;
    float3 _4031 = float3(_1180, _1184, _1182);
    float _1188 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4031, float3(0.0), isnan(_4031)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4031, float3(0.0), isnan(_4031)), level(0.0)).x;
    float _1190 = -_1178;
    float _1192 = fma(_1186, _1190, 1.0);
    float _1194 = -_1078;
    float _1196 = fma(_1172, _1138, _1194);
    float _1198 = fma(_1196, 0.5, 0.5);
    float3 _4055 = float3(_1180, _1184, _1182);
    float4 _1201 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4055, float3(0.0), isnan(_4055)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4055, float3(0.0), isnan(_4055)), level(0.0)).xyzw;
    float _1203 = _1201.x;
    float _1205 = _1201.y;
    float _1207 = _1201.z;
    float _1209 = _1201.w;
    float2 _4071 = float2(_1192, _1198);
    float3 _1213 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4071, float2(0.0), isnan(_4071)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4071, float2(0.0), isnan(_4071)), level(0.0)).xyz;
    float _1215 = _1213.x;
    float _1217 = _1213.y;
    float _1219 = _1213.z;
    float _1221 = in.m_66.w;
    float _1223 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1225 = in.m_66.y;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1229 = _1227 != 0;
    float _1231 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1223);
    float _1233 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1235 = in.m_76.y;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1239 = _1237 != 0;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1243 = _1241 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1247 = _1245 != 0;
    float _1249 = _1233 * _195;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1253 = _1251 != 0;
    float _1255 = in.m_76.x;
    float _1257 = trunc(_1249);
    int _1259 = int(_1257);
    float _1261 = _1180;
    bool _1263 = _1247;
    if (_1229)
    {
        float _1265 = in.m_66.z;
        _1261 = _1265;
    }
    float _1267 = _1261;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1271 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1273 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1231);
    float _1275 = 1.0 / _1243;
    bool _1277 = _1221 > 0.5;
    float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1281 = _1279 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1283;
    bool _1287 = _1225 > 0.5;
    out.m_78.x = _758;
    out.m_78.y = _756;
    out.m_78.z = _760;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1293 = 1.0 / _1271;
    float _1295 = -_1235;
    float _1297 = _1295 + 1.0;
    int _1299 = _1259 << 4;
    int _1301 = _1299 + 1968;
    float _1303 = 0.0;
    bool _1305 = _1277;
    float _1307 = _1235;
    float _1309 = _1255;
    if (!_1239)
    {
        _1303 = _1255;
    }
    float _1311 = _1303;
    float _1313 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    int _1315 = _1301 + 8;
    uint _1317 = uint(int(uint(_1315) >> uint(2)));
    uint _1319 = uint(int(uint(int(_1317)) >> uint(2)));
    int _1321 = int(_1317) & 3;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[int(_1319)][_1321];
    float _1325 = 1.0 / _1291;
    int _1327 = _1277 ? as_type<int>(_1297) : as_type<int>(_1235);
    float _1329 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1331 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1329);
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1335 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1333;
    float _1337 = _1311;
    if (_1239)
    {
        bool _1339 = _195 > 0.5;
        _1305 = _1339;
    }
    bool _1341 = _1305;
    float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1345 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1343);
    float _1347 = _1247 ? as_type<float>(_1327) : _1235;
    float _1349 = _1335 * _1275;
    float _1351 = _1281 * _1293;
    if (_1229)
    {
        bool _1353 = _1267 > 0.5;
        _1263 = _1353;
    }
    bool _1355 = _1263;
    uint _1357 = uint(int(uint(_1301) >> uint(2)));
    uint _1359 = uint(int(uint(int(_1357)) >> uint(2)));
    int _1361 = int(_1357) & 3;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[int(_1359)][_1361];
    int _1365 = int(_1357) + 1;
    uint _1367 = uint(int(uint(_1365) >> uint(2)));
    int _1369 = _1365 & 3;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[int(_1367)][_1369];
    float _1373 = in.m_80.x;
    float _1375 = in.m_80.y;
    float _1377 = in.m_80.z;
    bool _1379 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1381 = isnan(_375);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1387 = _1383 || _1385;
    float _1389 = float(_1387);
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1393 = _375 + _1391;
    if (_1253)
    {
        float _1395 = _1287 ? _1297 : _1235;
        _1307 = _1395;
    }
    float _1397 = _1307;
    float _1399 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1331);
    float _1401 = _1285 * _1325;
    bool _1403 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1405 = isnan(_375);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1411 = _1407 || _1409;
    float _1413 = float(_1411);
    float _1415 = -_1389;
    float _1417 = _1415 + 1.0;
    bool _1419 = _393 != 0.0;
    bool _1421 = isnan(_393);
    bool _1423 = _1419 || _1421;
    bool _1425 = isnan(0.0);
    bool _1427 = _1423 || _1425;
    float _1429 = fma(_1349, _1393, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1431 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1433 = isnan(_375);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1439 = _1435 || _1437;
    float _1441 = float(_1439);
    float _1443 = -_1413;
    float _1445 = _1443 + 1.0;
    bool _1447 = _391 == 0.0;
    bool _1449 = !_1427;
    bool _1451 = _1447 && _1449;
    float _1453 = _1413 * _1417;
    bool _1455 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1457 = isnan(_375);
    bool _1459 = _1455 || _1457;
    bool _1461 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1463 = _1459 || _1461;
    float _1465 = float(_1463);
    float _1467 = _1441 * _1445;
    bool _1469 = _395 == 0.0;
    bool _1471 = _1469 && _1451;
    float _1473 = -_1441;
    float _1475 = _1473 + 1.0;
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1479 = _375 + _1477;
    float _1481 = -_1465;
    float _1483 = _1481 + 1.0;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1487 = _375 + _1485;
    float _1489 = _1465 * _1475;
    float _1491 = fma(_1351, _1479, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1493 = as_type<int>(_1479);
    int _1495 = as_type<int>(_1429);
    float _1497 = _1465;
    float _1499 = _1487;
    float _1501 = _1475;
    if (_1239)
    {
        float _1503 = -_1255;
        float _1505 = _1503 + 1.0;
        _1493 = as_type<int>(_1505);
    }
    int _1507 = _1493;
    float _1509 = fma(_1401, _1487, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1511 = _1429 * _1489;
    float _1513 = as_type<float>(_1507);
    float _1515 = _1511;
    if (_1229)
    {
        float _1517 = -_1255;
        float _1519 = _1517 + 1.0;
        _1495 = as_type<int>(_1519);
    }
    int _1521 = _1495;
    float _1523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1525 = as_type<float>(_1521);
    if (_1239)
    {
        float _1527 = _1341 ? as_type<float>(_1507) : _1255;
        _1337 = _1527;
    }
    float _1529 = _1337;
    float _1531 = fma(_1483, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1511);
    if (_1471)
    {
        _1513 = _1375;
    }
    float _1533 = _1513;
    float _1535 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1345);
    float _1537 = _1533;
    if (_1471)
    {
        _1515 = _1377;
    }
    float _1539 = _1515;
    float _1541 = _478 + _1399;
    float _1543 = _1539;
    if (_1471)
    {
        _1497 = _1533;
    }
    float _1545 = _1497;
    float _1547 = _472 + _1535;
    float _1549 = _1545;
    if (!_1471)
    {
        _1537 = _1375;
    }
    float _1551 = _1537;
    float _1553 = _532 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_1471)
    {
        _1499 = _1373;
    }
    float _1555 = _1499;
    float _1557 = fma(_1491, _1467, _1531);
    float _1559 = _1555;
    float _1561 = _1557;
    if (_1471)
    {
        _1501 = _1539;
    }
    float _1563 = _1501;
    float _1565 = -_1541;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1569 = _1563;
    if (!_1471)
    {
        _1543 = _1377;
    }
    float _1571 = _1543;
    float _1573 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1553);
    if (_1229)
    {
        float _1575 = _1355 ? as_type<float>(_1521) : _1255;
        _1309 = _1575;
    }
    float _1577 = _1309;
    float _1579 = _532 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_1471)
    {
        _1525 = _1555;
    }
    float _1581 = _1525;
    float _1583 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1573);
    float _1585 = _1581;
    if (!_1471)
    {
        _1559 = _1373;
    }
    float _1587 = _1559;
    float _1589 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1591 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1593 = isnan(0.0);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1599 = _1595 || _1597;
    float _1601 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1603 = _1363 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (!_1471)
    {
        float _1605 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1587);
        _1585 = _1605;
    }
    float _1607 = _1585;
    float _1609 = _1589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1613 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1579);
    float _1615 = _1371 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1617 = _1603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1619 = -_1547;
    float _1621 = _1619 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1623 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1613);
    float _1625 = _1615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1627 = fma(_1509, _1453, _1557);
    float _1629 = 1.0 / _1601;
    float _1631 = _1623 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1599)
    {
        float _1633 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1561 = _1633;
    }
    float _1635 = _1561;
    float _1637 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1639 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_82.x = _1617;
    out.m_82.y = _1625;
    out.m_82.z = _1609;
    float _1641 = precise::min(_1541, _1567);
    float _1643 = _1635;
    if (!_1471)
    {
        float _1645 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1571);
        _1569 = _1645;
    }
    float _1647 = _1569;
    float _1649 = precise::min(_1547, _1621);
    float _1651 = _1631 + _1601;
    float _1653 = _1637 * _1611;
    float _1655 = _1639 * _1523;
    float _1657 = precise::min(_1641, _1649);
    float _1659 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1661 = in.m_84.x;
    float _1663 = in.m_84.y;
    float _1665 = in.m_84.z;
    float _1667 = in.m_84.w;
    float _1669 = _1651 * _1629;
    float _1671 = _1669 * 0.5;
    uint _1673 = uint(int(uint(_347) >> uint(2)));
    uint _1675 = uint(int(uint(int(_1673)) >> uint(2)));
    int _1677 = int(_1673) & 3;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[int(_1675)][_1677];
    int _1681 = int(_1673) + 1;
    uint _1683 = uint(int(uint(_1681) >> uint(2)));
    int _1685 = _1681 & 3;
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[int(_1683)][_1685];
    float _1689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1691 = _1577 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1693 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1695 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1693);
    if (!_1471)
    {
        float _1697 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1551);
        _1549 = _1697;
    }
    float _1699 = _1549;
    float _1701 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1627);
    if (_1599)
    {
        float _1703 = precise::min(_1635, 20.0);
        _1643 = _1703;
    }
    float _1705 = _1643;
    int _1707 = _347 + 8;
    uint _1709 = uint(int(uint(_1707) >> uint(2)));
    uint _1711 = uint(int(uint(int(_1709)) >> uint(2)));
    int _1713 = int(_1709) & 3;
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[int(_1711)][_1713];
    float _1717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1719 = _868 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1721 = isnan(_868);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1727 = _1723 || _1725;
    float _1729 = 1.0 / _1695;
    float _1731 = _1659 * _1689;
    float _1733 = _327 * _1663;
    float _1735 = _317 * _1663;
    float _1737 = _331 * _1663;
    float _1739 = _1691 * _1717;
    float _1741 = _1665 * _1587;
    float _1743 = fma(_291, _1661, _1733);
    float _1745 = _1547;
    float _1747 = _1717;
    if (_1599)
    {
        float _1749 = 1.0 / _1705;
        _1745 = _1749;
    }
    float _1751 = _1745;
    float _1753 = fma(_287, _1661, _1735);
    out.m_86.x = _1655;
    out.m_86.y = _1731;
    out.m_86.z = _1739;
    out.m_86.w = _1653;
    float _1755 = fma(_295, _1661, _1737);
    float _1757 = -_1741;
    float _1759 = fma(_1661, _1571, _1757);
    float _1761 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1763 = _1729 * _1761;
    float _1765 = _1661 * _1551;
    float _1767 = _1663 * _1571;
    float _1769 = fma(_335, _1665, _1753);
    float _1771 = fma(_339, _1665, _1743);
    float _1773 = -_1765;
    float _1775 = fma(_1663, _1587, _1773);
    float _1777 = _1759 * _1667;
    float _1779 = fma(_343, _1665, _1755);
    float _1781 = -_1767;
    float _1783 = fma(_1665, _1551, _1781);
    float _1785 = _317 * _1699;
    if (!_1599)
    {
        _1747 = 1.0;
    }
    float _1787 = _1747;
    float _1789 = abs(_1763);
    float _1791 = log2(_1789);
    float _1793 = _1787;
    if (_1599)
    {
        float _1795 = _1657 * _1751;
        float _1797 = precise::clamp(_1795, 0.0, 1.0);
        _1793 = _1797;
    }
    float _1799 = _1793;
    float _1801 = _327 * _1699;
    float _1803 = _331 * _1699;
    float _1805 = _1687 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1807 = _1777 * _317;
    float _1809 = fma(_287, _1607, _1785);
    float _1811 = fma(_291, _1607, _1801);
    float _1813 = fma(_295, _1607, _1803);
    float _1815 = _1783 * _1667;
    float _1817 = _1777 * _327;
    float _1819 = _1777 * _331;
    float _1821 = _1775 * _1667;
    float _1823 = _1679 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1825 = _1715 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1827 = _1771 * _566;
    float _1829 = _1791 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1831 = _1771 * _670;
    float _1833 = fma(_1815, _287, _1807);
    float _1835 = _1771 * _580;
    float _1837 = fma(_1815, _291, _1817);
    float _1839 = fma(_1815, _295, _1819);
    float _1841 = exp2(_1829);
    float _1843 = fma(_335, _1647, _1809);
    float _1845 = _1823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1847 = _1805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1849 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1851 = _1701 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1853 = fma(_1769, _666, _1827);
    float _1855 = fma(_1769, _568, _1831);
    float _1857 = fma(_1821, _335, _1833);
    float _1859 = fma(_339, _1647, _1811);
    float _1861 = fma(_1769, _574, _1835);
    float _1863 = fma(_1821, _339, _1837);
    float _1865 = fma(_343, _1647, _1813);
    float _1867 = fma(_1821, _343, _1839);
    float _1869 = fma(_1779, _570, _1853);
    float _1871 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1873 = precise::clamp(_1871, 0.0, 1.0);
    out.m_88.x = _1845;
    out.m_88.y = _1847;
    out.m_88.z = _1849;
    out.m_88.w = _1851;
    float _1875 = fma(_1779, _578, _1855);
    float _1877 = fma(_1779, _678, _1861);
    float _1879 = fma(_1873, -2.0, 3.0);
    float _1881 = _1873 * _1873;
    float _1883 = _1859 * _670;
    bool _1885 = _1763 <= 8000.0;
    bool _1887 = isnan(_1763);
    bool _1889 = _1885 || _1887;
    bool _1891 = isnan(8000.0);
    bool _1893 = _1889 || _1891;
    float _1895 = float(_1893);
    out.m_90.x = _1869;
    out.m_90.y = _1875;
    out.m_90.z = _1877;
    float _1897 = _1881 * _1879;
    float _1899 = fma(_1843, _568, _1883);
    float _1901 = _1859 * _566;
    float _1903 = _1863 * _566;
    float _1905 = _1863 * _670;
    float _1907 = _1863 * _580;
    float _1909 = fma(_1843, _666, _1901);
    float _1911 = fma(_1857, _666, _1903);
    float _1913 = fma(_1857, _568, _1905);
    float _1915 = fma(_1857, _574, _1907);
    float _1917 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1919 = -_1897;
    float _1921 = _1919 + 1.0;
    float _1923 = fma(_1867, _578, _1913);
    float _1925 = fma(_1867, _570, _1911);
    float _1927 = fma(_1867, _678, _1915);
    float _1929 = fma(_1921, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1897);
    float _1931 = exp2(_1917);
    float _1933 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1273);
    float _1935 = _1859 * _580;
    float _1937 = in.m_74.x;
    float _1939 = _1895 * _1929;
    float _1941 = _1799 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1943 = fma(_1843, _574, _1935);
    out.m_92.x = _1925;
    out.m_92.y = _1923;
    out.m_92.z = _1927;
    float _1945 = _1939 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1947 = _1933 + _1108;
    int _1949 = as_type<int>(_1877);
    float _1951 = _1909;
    float _1953 = 0.0;
    float _1955 = _1933;
    if (!_860)
    {
        float _1957 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _1949 = as_type<int>(_1957);
    }
    int _1959 = _1949;
    out.gl_Position.x = _1132;
    out.gl_Position.y = _1134;
    out.gl_Position.z = _1933;
    out.gl_Position.w = _1108;
    float _1961 = _1947 * 0.5;
    float _1963 = -_1931;
    float _1965 = _1963 + 1.0;
    float _1967 = _1941 * _834;
    if (!_860)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5346 = as_type<float>(_1959);
        out.gl_Position.z = _5346;
    }
    float _1969 = fma(_1865, _578, _1899);
    float _1971 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1973 = fma(_1865, _570, _1909);
    float _1975 = fma(_1865, _678, _1943);
    out.m_94.z = _1961;
    out.m_94.w = _1108;
    if (_860)
    {
        _1951 = _1967;
    }
    float _1977 = _1951;
    float _1979 = _1977;
    if (!_860)
    {
        _1979 = 0.0;
    }
    float _1981 = _1979;
    float _1983 = -_1971;
    float _1985 = _1983 + 1.0;
    out.m_96.x = _1973;
    out.m_96.y = _1969;
    out.m_96.z = _1975;
    float _1987 = _1985;
    if (!_1727)
    {
        _1953 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1989 = _1953;
    float _1991 = -_1176;
    float _1993 = _1991 + 1.0;
    float _1995 = _1989;
    float _1997 = _1989;
    if (!_1727)
    {
        _1142 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1999 = _1142;
    float _2001 = _1999;
    float _2003 = _1999;
    if (!_1727)
    {
        _1955 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2005 = _1955;
    float _2007 = _1993 * _1945;
    float _2009 = precise::clamp(_2007, 0.0, 1.0);
    float _2011 = _2005;
    float _2013 = _2005;
    if (!_1727)
    {
        _1144 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2015 = _1144;
    float _2017 = _1971 * _1188;
    float _2019 = -_2009;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2023 = _2021 * _1937;
    float _2025 = _2023 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2027 = _1209 * _2017;
    float _2029 = _1209 * _1985;
    out.m_98.x = _2025;
    float _2031 = _2027;
    float _2033 = _2015;
    float _2035 = _2015;
    if (!_1727)
    {
        _1987 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2037 = _1987;
    float _2039 = _1219 * _2017;
    float _2041 = fma(_1215, _2027, _1203);
    float _2043 = fma(_1217, _2027, _1205);
    float _2045 = _2037;
    float _2047 = _2037;
    if (!_1727)
    {
        _2031 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2049 = _2031;
    float _2051 = fma(_1209, _2039, _1207);
    out.m_100.x = _2041;
    out.m_100.y = _2043;
    out.m_100.z = _2051;
    out.m_100.w = _2029;
    bool _2053 = !_1727;
    float _2055 = _2049;
    float _2057 = _2049;
    if (!_2053)
    {
        bool _2059 = _868 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2061 = isnan(_868);
        bool _2063 = _2059 || _2061;
        bool _2065 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2067 = _2063 || _2065;
        if (!_2067)
        {
            float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2071 = _868 + _2069;
            float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2075 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2073;
            float _2077 = 1.0 / _2075;
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2085 = _2083 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2097 = _2095 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2099 = _2071 * _2077;
            float _2101 = precise::clamp(_2099, 0.0, 1.0);
            float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2105 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2107 = fma(_2101, _2081, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2109 = fma(_2101, _2105, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2111 = fma(_2101, _2085, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2113 = fma(_2101, _2089, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2115 = fma(_2101, _2093, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2117 = fma(_2101, _2097, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2003 = _2109;
            _2047 = _2115;
            _1997 = _2107;
            _2035 = _2113;
            _2013 = _2111;
            _2057 = _2117;
            _2119 = true;
        }
        else
        {
            bool _2121 = _868 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2123 = isnan(_868);
            bool _2125 = _2121 || _2123;
            bool _2127 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2129 = _2125 || _2127;
            if (!_2129)
            {
                _1995 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2131 = _1995;
            _1997 = _2131;
            if (!_2129)
            {
                _2001 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2133 = _2001;
            _2003 = _2133;
            if (!_2129)
            {
                _2011 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2135 = _2011;
            _2013 = _2135;
            if (!_2129)
            {
                _2033 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2137 = _2033;
            _2035 = _2137;
            if (!_2129)
            {
                _2045 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2139 = _2045;
            _2047 = _2139;
            if (!_2129)
            {
                _2055 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2141 = _2055;
            bool _2143 = !_2129;
            _2057 = _2141;
            if (!_2143)
            {
                bool _2145 = _868 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2147 = isnan(_868);
                bool _2149 = _2145 || _2147;
                bool _2151 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2153 = _2149 || _2151;
                if (!_2153)
                {
                    float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2157 = _868 + _2155;
                    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2161 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2159;
                    float _2163 = 1.0 / _2161;
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2181 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2183 = _2181 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2185 = _2157 * _2163;
                    float _2187 = precise::clamp(_2185, 0.0, 1.0);
                    float _2189 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2193 = fma(_2187, _2167, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2195 = fma(_2187, _2191, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2197 = fma(_2187, _2171, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2199 = fma(_2187, _2175, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2201 = fma(_2187, _2179, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2203 = fma(_2187, _2183, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2003 = _2195;
                    _2047 = _2201;
                    _1997 = _2193;
                    _2035 = _2199;
                    _2013 = _2197;
                    _2057 = _2203;
                    _2119 = true;
                }
                else
                {
                    _2003 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2047 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1997 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2035 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2013 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2057 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2119 = false;
    float _2205 = _2003;
    float _2207 = _2047;
    float _2209 = _1997;
    float _2211 = _2035;
    float _2213 = _2013;
    float _2215 = _2057;
    float _2217 = fma(_1969, -0.5, 0.5);
    float _2219 = precise::clamp(_2217, 0.0, 1.0);
    float _2221 = -_2205;
    float _2223 = _2221 + _2207;
    float _2225 = -_2209;
    float _2227 = _2225 + _2211;
    float _2229 = -_2213;
    float _2231 = _2229 + _2215;
    bool _2233 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2235 = fma(_2219, _2223, _2205);
    float _2237 = fma(_2219, _2227, _2209);
    float _2239 = fma(_2219, _2231, _2213);
    float _2241 = _1981 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2243 = _2235 * 0.586610972881317138671875;
    out.m_102.x = 0.0;
    float _2245 = fma(_2237, 0.298911988735198974609375, _2243);
    out.m_98.w = _2241;
    float _2247 = fma(_2239, 0.114477999508380889892578125, _2245);
    out.m_56.x = 1.0;
    float _2249 = -_2247;
    float _2251 = _2237 + _2249;
    float _2253 = -_2247;
    float _2255 = _2235 + _2253;
    float _2257 = -_2247;
    float _2259 = _2239 + _2257;
    float _2261 = fma(_2251, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2247);
    float _2263 = fma(_2255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2247);
    float _2265 = fma(_2259, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2247);
    out.m_104.x = _2261;
    out.m_104.y = _2263;
    out.m_104.z = _2265;
    if (!_2233)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2267 = -_756;
    float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2271 = -_758;
    float _2273 = _2271 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2275 = -_760;
    float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2279 = _2269 * _2269;
    float _2281 = fma(_2273, _2273, _2279);
    float _2283 = fma(_2277, _2277, _2281);
    float _2285 = sqrt(_2283);
    float _2287 = rsqrt(_2283);
    float _2289 = -_2285;
    float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2293 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2295 = precise::clamp(_2293, 0.0, 1.0);
    float _2297 = _2273 * _2287;
    float _2299 = _2269 * _2287;
    float _2301 = abs(_2295);
    float _2303 = log2(_2301);
    float _2305 = _2277 * _2287;
    float _2307 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2309 = _1969 * _2299;
    float _2311 = -_2299;
    float _2313 = -_2307;
    float _2315 = fma(_2311, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2313);
    float _2317 = fma(_1973, _2297, _2309);
    float _2319 = -_2305;
    float _2321 = fma(_2319, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2315);
    float _2323 = fma(_1975, _2305, _2317);
    float _2325 = precise::clamp(_2323, 0.0, 1.0);
    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2329 = _2321 + _2327;
    float _2331 = _2303 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2333 = _2329 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2335 = precise::clamp(_2333, 0.0, 1.0);
    float _2337 = exp2(_2331);
    float _2339 = _2337 * _2335;
    float _2341 = _2325 * _2339;
    float _2343 = _2341 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2345 = _2341 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2347 = _2341 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _2343;
    out.m_102.y = _2345;
    out.m_102.z = _2347;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2119 = false;
    bool _367 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_53.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    float _133 = _131;
    if (!_127)
    {
        out.m_56.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2404 = as_type<float>(_139);
        out.gl_Position.z = _2404;
    }
    if (!_127)
    {
        return out;
    }
    float _143 = in.m_58.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = 0.0;
    if (_153)
    {
        float _161 = float(_123);
        _159 = _161;
    }
    float _163 = _159;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    if (_169)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _133;
    if (_169)
    {
        out.m_56.x = 0.0;
    }
    if (_169)
    {
        float _173 = _171 * 5.0;
        _141 = as_type<int>(_173);
    }
    int _175 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2472 = as_type<float>(_175);
        out.gl_Position.z = _2472;
    }
    if (_169)
    {
        return out;
    }
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    float _195 = in.m_66.x;
    float _197 = _177 * _177;
    float _199 = _179 * _179;
    float _201 = _181 * _181;
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = fma(_187, _187, _201);
    float _209 = fma(_189, _189, _203);
    float _211 = fma(_191, _191, _205);
    float _213 = fma(_193, _193, _207);
    float _215 = sqrt(_209);
    float _217 = sqrt(_211);
    float _219 = sqrt(_213);
    bool _221 = _215 > 0.0;
    bool _223 = _217 > 0.0;
    float _225 = _209;
    if (_221)
    {
        float _227 = rsqrt(_209);
        _225 = _227;
    }
    float _229 = _225;
    float _231 = 0.0;
    if (!_221)
    {
        _231 = 0.0;
    }
    float _233 = _231;
    bool _235 = _219 > 0.0;
    float _237 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _239 = 0.0;
    float _241 = _233;
    if (!_221)
    {
        _239 = 0.0;
    }
    float _243 = _239;
    float _245 = 0.0;
    float _247 = _243;
    if (_223)
    {
        float _249 = rsqrt(_211);
        _245 = _249;
    }
    float _251 = _245;
    float _253 = 0.0;
    if (!_221)
    {
        _253 = 0.0;
    }
    float _255 = _253;
    float _257 = _237 * _195;
    float _259 = 0.0;
    float _261 = _255;
    if (!_223)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    if (!_223)
    {
        _265 = 0.0;
    }
    float _269 = _265;
    float _271 = 0.0;
    float _273 = _269;
    if (!_223)
    {
        _271 = 0.0;
    }
    float _275 = _271;
    float _277 = _217;
    float _279 = _275;
    if (_235)
    {
        float _281 = rsqrt(_213);
        _277 = _281;
    }
    float _283 = _277;
    if (_221)
    {
        float _285 = _229 * _183;
        _241 = _285;
    }
    float _287 = _241;
    if (_221)
    {
        float _289 = _229 * _177;
        _247 = _289;
    }
    float _291 = _247;
    if (_221)
    {
        float _293 = _229 * _189;
        _261 = _293;
    }
    float _295 = _261;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = 0.0;
    if (!_235)
    {
        _299 = 0.0;
    }
    float _301 = _299;
    float _303 = trunc(_257);
    int _305 = int(_303);
    float _307 = 0.0;
    float _309 = _301;
    if (!_235)
    {
        _307 = 0.0;
    }
    float _311 = _307;
    float _313 = _311;
    if (_223)
    {
        float _315 = _251 * _185;
        _267 = _315;
    }
    float _317 = _267;
    float _319 = 0.0;
    if (!_235)
    {
        _319 = 0.0;
    }
    float _321 = _319;
    float _323 = _321;
    if (_223)
    {
        float _325 = _251 * _179;
        _273 = _325;
    }
    float _327 = _273;
    if (_223)
    {
        float _329 = _251 * _191;
        _279 = _329;
    }
    float _331 = _279;
    if (_235)
    {
        float _333 = _283 * _187;
        _309 = _333;
    }
    float _335 = _309;
    if (_235)
    {
        float _337 = _283 * _181;
        _313 = _337;
    }
    float _339 = _313;
    if (_235)
    {
        float _341 = _283 * _193;
        _323 = _341;
    }
    float _343 = _323;
    int _345 = _305 << 4;
    int _347 = _345 + 1712;
    bool _349 = !_297;
    float _365;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _353 = _195 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[11].y, _157);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_123);
        float _371 = 1.0 / _369;
        float _373 = _157 * _371;
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
    int _405 = _403 << 5;
    uint _408 = uint(int(uint(_405) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_408)];
    float _410 = as_type<float>(_dmw0.x);
    int _412 = _405 + 4;
    uint _414 = uint(int(uint(_412) >> uint(2)));
    float _416 = as_type<float>(_dmw0.y);
    int _418 = _405 + 8;
    uint _420 = uint(int(uint(_418) >> uint(2)));
    float _422 = as_type<float>(_dmw0.z);
    int _424 = _405 + 12;
    uint _426 = uint(int(uint(_424) >> uint(2)));
    float _428 = as_type<float>(_dmw0.w);
    float _430 = _191 * _381;
    float _432 = _387 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = _385 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _436 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _393);
    float _438 = fma(_189, _379, _430);
    float _440 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _442 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _391);
    float _444 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _446 = _389 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _448 = _436 * _440;
    float _450 = _185 * _381;
    float _452 = _442 * _444;
    float _454 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _395);
    float _456 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _458 = _448 * _331;
    float _460 = fma(_183, _379, _450);
    float _462 = fma(_193, _383, _438);
    float _464 = _454 * _456;
    float _466 = _448 * _317;
    float _468 = fma(_452, _295, _458);
    float _470 = fma(_187, _383, _460);
    float _472 = _462 + _397;
    float _474 = fma(_452, _287, _466);
    float _476 = fma(_464, _343, _468);
    float _478 = _470 + _399;
    float _480 = _179 * _381;
    float _482 = fma(_464, _335, _474);
    float _484 = _472 + _476;
    float _486 = _448 * _327;
    float _488 = in.m_60.w;
    float _490 = _478 + _482;
    float _492 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _494 = _484 + _492;
    float _496 = fma(_177, _379, _480);
    float _498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _500 = _490 + _498;
    float _502 = _494 * _494;
    float _504 = fma(_181, _383, _496);
    float _506 = fma(_452, _291, _486);
    bool _508 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _510 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _512 = _508 || _510;
    bool _514 = isnan(0.5);
    bool _516 = _512 || _514;
    float _518 = fma(_500, _500, _502);
    float _520 = sqrt(_518);
    bool _522 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _524 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.5);
    bool _530 = _526 || _528;
    float _532 = _504 + _488;
    float _534 = fma(_464, _339, _506);
    float _536 = _532 + _534;
    bool _538 = _520 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _540 = _534;
    float _542 = _452;
    float _544 = _518;
    if (!_538)
    {
        _540 = _490;
    }
    float _546 = _540;
    float _548 = _428 * 2.0;
    float _550 = _410 * 2.0;
    float _552 = _416 * 2.0;
    float _554 = _416 * _416;
    float _556 = _422 * _548;
    float _558 = _416 * _548;
    float _560 = _410 * _548;
    float _562 = _422 * _422;
    float _564 = -_556;
    float _566 = fma(_416, _550, _564);
    float _568 = fma(_416, _550, _556);
    float _570 = fma(_422, _550, _558);
    float _572 = -_558;
    float _574 = fma(_422, _550, _572);
    float _576 = -_560;
    float _578 = fma(_422, _552, _576);
    float _580 = fma(_422, _552, _560);
    float _582 = _410 * _410;
    float _584 = _410;
    float _586 = _416;
    float _588 = _546;
    if (!_538)
    {
        _584 = _484;
    }
    float _590 = _584;
    float _592 = _590;
    if (!_538)
    {
        _586 = _536;
    }
    float _594 = _586;
    bool _596 = !_538;
    float _598 = _594;
    if (!_596)
    {
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _602 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _604 = _520 + _602;
        float _606 = _536 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _608 = rsqrt(_518);
        float _610 = _604 * _600;
        float _612 = _610 * 0.15915493667125701904296875;
        float _614 = _612 * 6.283185482025146484375;
        float _616 = cos(_614);
        float _618 = _612 * 6.283185482025146484375;
        float _620 = sin(_618);
        float _622 = _616 + (-1.0);
        float _624 = _622 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _626 = fma(_620, _606, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _628 = fma(_536, _616, _624);
        float _630 = _608 * _626;
        float _632 = fma(_500, _630, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _634 = fma(_494, _630, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _598 = _628;
        _588 = _632;
        _592 = _634;
    }
    float _636 = _598;
    float _638 = _588;
    float _640 = _592;
    float _642 = -_532;
    float _644 = _642 + _636;
    float _646 = -_478;
    float _648 = _646 + _638;
    float _650 = fma(_554, -2.0, 1.0);
    float _652 = -_472;
    float _654 = _652 + _640;
    float _656 = _644 * _327;
    float _658 = _644 * _291;
    float _660 = fma(_582, -2.0, 1.0);
    float _662 = _644 * _339;
    float _664 = fma(_648, _317, _656);
    float _666 = fma(_562, -2.0, _650);
    float _668 = fma(_648, _287, _658);
    float _670 = fma(_562, -2.0, _660);
    float _672 = fma(_654, _331, _664);
    float _674 = fma(_648, _335, _662);
    float _676 = fma(_654, _295, _668);
    float _678 = fma(_554, -2.0, _660);
    float _680 = _672 * _566;
    float _682 = _672 * _670;
    float _684 = _672 * _580;
    float _686 = fma(_654, _343, _674);
    float _688 = fma(_676, _666, _680);
    float _690 = fma(_676, _568, _682);
    float _692 = fma(_676, _574, _684);
    float _694 = _684;
    if (_530)
    {
        _542 = 1.0;
    }
    float _696 = _542;
    float _698 = fma(_686, _570, _688);
    float _700 = fma(_686, _578, _690);
    float _702 = fma(_686, _678, _692);
    float _704 = _478 + _698;
    float _706 = _532 + _700;
    float _708 = _472 + _702;
    float _710 = _706;
    float _712 = _704;
    float _714 = _708;
    float _716 = _696;
    if (!_516)
    {
        float _718 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _720 = _532 + _718;
        float _722 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _724 = _478 + _722;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _728 = _720 * _720;
        float _730 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _732 = _472 + _730;
        float _734 = fma(_724, _724, _728);
        float _736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _738 = fma(_732, _732, _734);
        float _740 = sqrt(_738);
        float _742 = _726 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _744 = precise::min(_740, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _746 = _744 * _736;
        float _748 = _742 * _746;
        float _750 = fma(_698, _748, _478);
        float _752 = fma(_700, _748, _532);
        float _754 = fma(_702, _748, _472);
        _710 = _752;
        _712 = _750;
        _714 = _754;
    }
    float _756 = _710;
    float _758 = _712;
    float _760 = _714;
    if (!_530)
    {
        float _762 = in.m_74.w;
        int _764 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _766 = _764 == 4;
        bool _768 = _764 == 8;
        bool _770 = _764 == 12;
        int _772 = as_type<int>(_762) << 16;
        int _774 = as_type<int>(_762) << 8;
        int _776 = as_type<int>(_762) << 24;
        int _778 = _772 >> 24;
        int _780 = _774 >> 24;
        int _782 = as_type<int>(_762) >> 24;
        int _784 = _776 >> 24;
        float _786 = float(_778);
        float _788 = float(_780);
        float _790 = float(_782);
        float _792 = _786 * 0.0078740157186985015869140625;
        float _794 = float(_784);
        float _796 = _788 * 0.0078740157186985015869140625;
        float _798 = _790 * 0.0078740157186985015869140625;
        float _800 = precise::min(_792, 1.0);
        float _802 = _794 * 0.0078740157186985015869140625;
        float _804 = precise::min(_796, 1.0);
        float _806 = precise::min(_798, 1.0);
        float _808 = precise::min(_802, 1.0);
        float _810 = precise::max(_800, -1.0);
        float _812 = precise::max(_804, -1.0);
        float _814 = precise::max(_806, -1.0);
        float _816 = precise::max(_808, -1.0);
        float _818 = _816;
        _694 = as_type<float>(_764);
        if (_766)
        {
            _818 = _810;
        }
        float _820 = _818;
        float _822 = _820;
        if (_768)
        {
            _822 = _812;
        }
        float _824 = _822;
        float _826 = _824;
        if (_770)
        {
            _826 = _814;
        }
        float _828 = _826;
        float _830 = abs(_828);
        float _832 = (-0.0) + _830;
        _716 = _832;
    }
    float _834 = _716;
    float _836 = _694;
    float _838 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _840 = _756 + _838;
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _844 = _758 + _842;
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _848 = _760 + _846;
    float _850 = _840 * _840;
    bool _852 = _834 != 0.0;
    bool _854 = isnan(_834);
    bool _856 = _852 || _854;
    bool _858 = isnan(0.0);
    bool _860 = _856 || _858;
    float _862 = fma(_844, _844, _850);
    float _864 = fma(_848, _848, _862);
    float _866 = rsqrt(_864);
    float _868 = sqrt(_864);
    float _870 = _866 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _872 = _844 * _870;
    float _874 = _848 * _870;
    float _876 = _872 * _872;
    float _878 = _874 * _874;
    float _880 = _876 + _878;
    float _882 = sqrt(_880);
    bool _884 = _882 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _888 = _882 + _886;
    float _890 = _866;
    float _892 = _880;
    float _894 = _888;
    float _896 = _840;
    if (_884)
    {
        float _898 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _890 = _898;
    }
    float _900 = _890;
    if (_884)
    {
        float _902 = rsqrt(_880);
        _892 = _902;
    }
    float _904 = _892;
    float _906 = _904;
    if (_884)
    {
        float _908 = _888 * _900;
        _894 = _908;
    }
    float _910 = _894;
    if (_884)
    {
        float _912 = _910 * 0.15915493667125701904296875;
        _544 = _912;
    }
    float _914 = _544;
    float _916 = _836;
    if (_884)
    {
        float _918 = _914 * 6.283185482025146484375;
        float _920 = sin(_918);
        _916 = _920;
    }
    float _922 = _916;
    float _924 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _926 = precise::max(0.0, _924);
    float _928 = _848;
    float _930 = _926;
    float _932 = _924;
    if (_884)
    {
        float _934 = _914 * 6.283185482025146484375;
        float _936 = cos(_934);
        _928 = _936;
    }
    float _938 = _928;
    float _940 = -_870;
    float _942 = -_926;
    float _944 = fma(_840, _940, _942);
    float _946 = _944;
    if (!_884)
    {
        _896 = _872;
    }
    float _948 = _896;
    float _950 = _948;
    if (_884)
    {
        float _952 = _944 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _930 = _952;
    }
    float _954 = _930;
    float _956 = _922;
    float _958 = _954;
    if (_884)
    {
        float _960 = fma(_922, _954, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _956 = _960;
    }
    float _962 = _956;
    if (_884)
    {
        float _964 = _938 + (-1.0);
        _932 = _964;
    }
    float _966 = _932;
    float _968 = 0.0;
    float _970 = _966;
    if (_884)
    {
        float _972 = _904 * _962;
        _968 = _972;
    }
    float _974 = _968;
    float _976 = _756 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _978 = _976;
    if (!_884)
    {
        _906 = _876;
    }
    float _980 = _906;
    float _982 = _980;
    if (_884)
    {
        float _984 = _966 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _958 = _984;
    }
    float _986 = _958;
    if (_884)
    {
        float _988 = _872 * _974;
        _950 = _988;
    }
    float _990 = _950;
    if (!_884)
    {
        _970 = _874;
    }
    float _992 = _970;
    float _994 = _992;
    if (_884)
    {
        float _996 = _874 * _974;
        _994 = _996;
    }
    float _998 = _994;
    if (_884)
    {
        float _1000 = fma(_944, _938, _986);
        _946 = _1000;
    }
    float _1002 = _946;
    if (_884)
    {
        float _1004 = _990 * _990;
        _982 = _1004;
    }
    float _1006 = _982;
    float _1008 = fma(_478, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1010 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[2].x, _976);
    float _1012 = _1008;
    if (!_884)
    {
        _978 = _878;
    }
    float _1014 = _978;
    float _1016 = _1014;
    if (_884)
    {
        float _1018 = _998 * _998;
        _1016 = _1018;
    }
    float _1020 = _1016;
    float _1022 = fma(_1002, _1002, _1006);
    float _1024 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1010);
    float _1026 = _756 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1028 = _1022 + _1020;
    float _1030 = _756 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1034 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1036 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1026);
    float _1038 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1030);
    float _1040 = rsqrt(_1028);
    float _1042 = fma(_472, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1044 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1046 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1038);
    float _1048 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1036);
    float _1050 = -_1044;
    float _1052 = fma(_1050, _1034, 1.0);
    float _1054 = _756 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1058 = fma(_868, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1056);
    float _1060 = precise::clamp(_1058, 0.0, 1.0);
    float _1062 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1064 = _1048 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1066 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1054);
    float _1068 = -_1060;
    float _1070 = _1068 + 1.0;
    float _1072 = floor(_1008);
    float _1074 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1066);
    float _1076 = _1040 * _990;
    float _1078 = _1040 * _1002;
    float _1080 = _1040 * _998;
    float _1082 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1084 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1086 = abs(_1070);
    float _1088 = log2(_1086);
    float _1090 = _1076 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1092 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1084);
    float _1094 = -_1090;
    float _1096 = fma(_1078, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1094);
    float _1098 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1092);
    float _1100 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1102 = -_1080;
    float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1096);
    float _1106 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1108 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1098);
    float _1110 = floor(_1042);
    float _1112 = fma(_1104, -0.5, 0.5);
    float _1114 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1106);
    float _1116 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1100);
    float _1118 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1120 = fma(_1104, 0.5, 0.5);
    float _1122 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1114);
    float _1124 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1116);
    float _1126 = 1.0 / _1108;
    float _1128 = -_1072;
    float _1130 = _1008 + _1128;
    float _1132 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1122);
    float _1134 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1124);
    float _1136 = fma(_1120, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1138 = _1078 + 1.0;
    float _1140 = _1072;
    float _1142 = _1108;
    float _1144 = _1134;
    if (_860)
    {
        _1140 = _1132;
    }
    float _1146 = _1140;
    float _1148 = log2(_1052);
    float _1150 = _1146;
    if (_860)
    {
        _1012 = _1134;
    }
    float _1152 = _1012;
    float _1154 = -_1110;
    float _1156 = _1042 + _1154;
    float _1158 = _1152;
    if (!_860)
    {
        _1150 = 0.0;
    }
    float _1160 = _1150;
    float _1162 = fma(_1120, _1136, -0.212114393711090087890625);
    if (!_860)
    {
        _1158 = 0.0;
    }
    float _1164 = _1158;
    float _1166 = sqrt(_1112);
    float _1168 = _1126 * _1160;
    float _1170 = _1126 * _1164;
    float _1172 = exp2(_1118);
    float _1174 = _1148 * 0.693147182464599609375;
    float2 _4005 = float2(_1130, _1156);
    float _1176 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4005, float2(0.0), isnan(_4005)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4005, float2(0.0), isnan(_4005)), level(0.0)).x;
    float _1178 = fma(_1120, _1162, 1.570728778839111328125);
    float _1180 = fma(_1168, 0.5, 0.5);
    float _1182 = _1174 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1184 = fma(_1170, -0.5, 0.5);
    float _1186 = _1166 * 0.636619746685028076171875;
    float3 _4031 = float3(_1180, _1184, _1182);
    float _1188 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4031, float3(0.0), isnan(_4031)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4031, float3(0.0), isnan(_4031)), level(0.0)).x;
    float _1190 = -_1178;
    float _1192 = fma(_1186, _1190, 1.0);
    float _1194 = -_1078;
    float _1196 = fma(_1172, _1138, _1194);
    float _1198 = fma(_1196, 0.5, 0.5);
    float3 _4055 = float3(_1180, _1184, _1182);
    float4 _1201 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4055, float3(0.0), isnan(_4055)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4055, float3(0.0), isnan(_4055)), level(0.0)).xyzw;
    float _1203 = _1201.x;
    float _1205 = _1201.y;
    float _1207 = _1201.z;
    float _1209 = _1201.w;
    float2 _4071 = float2(_1192, _1198);
    float3 _1213 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4071, float2(0.0), isnan(_4071)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4071, float2(0.0), isnan(_4071)), level(0.0)).xyz;
    float _1215 = _1213.x;
    float _1217 = _1213.y;
    float _1219 = _1213.z;
    float _1221 = in.m_66.w;
    float _1223 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1225 = in.m_66.y;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1229 = _1227 != 0;
    float _1231 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1223);
    float _1233 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1235 = in.m_76.y;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1239 = _1237 != 0;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1243 = _1241 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1247 = _1245 != 0;
    float _1249 = _1233 * _195;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1253 = _1251 != 0;
    float _1255 = in.m_76.x;
    float _1257 = trunc(_1249);
    int _1259 = int(_1257);
    float _1261 = _1180;
    bool _1263 = _1247;
    if (_1229)
    {
        float _1265 = in.m_66.z;
        _1261 = _1265;
    }
    float _1267 = _1261;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1271 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1273 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1231);
    float _1275 = 1.0 / _1243;
    bool _1277 = _1221 > 0.5;
    float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1281 = _1279 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1283;
    bool _1287 = _1225 > 0.5;
    out.m_78.x = _758;
    out.m_78.y = _756;
    out.m_78.z = _760;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1293 = 1.0 / _1271;
    float _1295 = -_1235;
    float _1297 = _1295 + 1.0;
    int _1299 = _1259 << 4;
    int _1301 = _1299 + 1968;
    float _1303 = 0.0;
    bool _1305 = _1277;
    float _1307 = _1235;
    float _1309 = _1255;
    if (!_1239)
    {
        _1303 = _1255;
    }
    float _1311 = _1303;
    float _1313 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    int _1315 = _1301 + 8;
    uint _1317 = uint(int(uint(_1315) >> uint(2)));
    uint _1319 = uint(int(uint(int(_1317)) >> uint(2)));
    int _1321 = int(_1317) & 3;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[int(_1319)][_1321];
    float _1325 = 1.0 / _1291;
    int _1327 = _1277 ? as_type<int>(_1297) : as_type<int>(_1235);
    float _1329 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1331 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1329);
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1335 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1333;
    float _1337 = _1311;
    if (_1239)
    {
        bool _1339 = _195 > 0.5;
        _1305 = _1339;
    }
    bool _1341 = _1305;
    float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1345 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1343);
    float _1347 = _1247 ? as_type<float>(_1327) : _1235;
    float _1349 = _1335 * _1275;
    float _1351 = _1281 * _1293;
    if (_1229)
    {
        bool _1353 = _1267 > 0.5;
        _1263 = _1353;
    }
    bool _1355 = _1263;
    uint _1357 = uint(int(uint(_1301) >> uint(2)));
    uint _1359 = uint(int(uint(int(_1357)) >> uint(2)));
    int _1361 = int(_1357) & 3;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[int(_1359)][_1361];
    int _1365 = int(_1357) + 1;
    uint _1367 = uint(int(uint(_1365) >> uint(2)));
    int _1369 = _1365 & 3;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[int(_1367)][_1369];
    float _1373 = in.m_80.x;
    float _1375 = in.m_80.y;
    float _1377 = in.m_80.z;
    bool _1379 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1381 = isnan(_375);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1387 = _1383 || _1385;
    float _1389 = float(_1387);
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1393 = _375 + _1391;
    if (_1253)
    {
        float _1395 = _1287 ? _1297 : _1235;
        _1307 = _1395;
    }
    float _1397 = _1307;
    float _1399 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1331);
    float _1401 = _1285 * _1325;
    bool _1403 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1405 = isnan(_375);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1411 = _1407 || _1409;
    float _1413 = float(_1411);
    float _1415 = -_1389;
    float _1417 = _1415 + 1.0;
    bool _1419 = _393 != 0.0;
    bool _1421 = isnan(_393);
    bool _1423 = _1419 || _1421;
    bool _1425 = isnan(0.0);
    bool _1427 = _1423 || _1425;
    float _1429 = fma(_1349, _1393, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1431 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1433 = isnan(_375);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1439 = _1435 || _1437;
    float _1441 = float(_1439);
    float _1443 = -_1413;
    float _1445 = _1443 + 1.0;
    bool _1447 = _391 == 0.0;
    bool _1449 = !_1427;
    bool _1451 = _1447 && _1449;
    float _1453 = _1413 * _1417;
    bool _1455 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1457 = isnan(_375);
    bool _1459 = _1455 || _1457;
    bool _1461 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1463 = _1459 || _1461;
    float _1465 = float(_1463);
    float _1467 = _1441 * _1445;
    bool _1469 = _395 == 0.0;
    bool _1471 = _1469 && _1451;
    float _1473 = -_1441;
    float _1475 = _1473 + 1.0;
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1479 = _375 + _1477;
    float _1481 = -_1465;
    float _1483 = _1481 + 1.0;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1487 = _375 + _1485;
    float _1489 = _1465 * _1475;
    float _1491 = fma(_1351, _1479, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1493 = as_type<int>(_1479);
    int _1495 = as_type<int>(_1429);
    float _1497 = _1465;
    float _1499 = _1487;
    float _1501 = _1475;
    if (_1239)
    {
        float _1503 = -_1255;
        float _1505 = _1503 + 1.0;
        _1493 = as_type<int>(_1505);
    }
    int _1507 = _1493;
    float _1509 = fma(_1401, _1487, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1511 = _1429 * _1489;
    float _1513 = as_type<float>(_1507);
    float _1515 = _1511;
    if (_1229)
    {
        float _1517 = -_1255;
        float _1519 = _1517 + 1.0;
        _1495 = as_type<int>(_1519);
    }
    int _1521 = _1495;
    float _1523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1525 = as_type<float>(_1521);
    if (_1239)
    {
        float _1527 = _1341 ? as_type<float>(_1507) : _1255;
        _1337 = _1527;
    }
    float _1529 = _1337;
    float _1531 = fma(_1483, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1511);
    if (_1471)
    {
        _1513 = _1375;
    }
    float _1533 = _1513;
    float _1535 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1345);
    float _1537 = _1533;
    if (_1471)
    {
        _1515 = _1377;
    }
    float _1539 = _1515;
    float _1541 = _478 + _1399;
    float _1543 = _1539;
    if (_1471)
    {
        _1497 = _1533;
    }
    float _1545 = _1497;
    float _1547 = _472 + _1535;
    float _1549 = _1545;
    if (!_1471)
    {
        _1537 = _1375;
    }
    float _1551 = _1537;
    float _1553 = _532 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_1471)
    {
        _1499 = _1373;
    }
    float _1555 = _1499;
    float _1557 = fma(_1491, _1467, _1531);
    float _1559 = _1555;
    float _1561 = _1557;
    if (_1471)
    {
        _1501 = _1539;
    }
    float _1563 = _1501;
    float _1565 = -_1541;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1569 = _1563;
    if (!_1471)
    {
        _1543 = _1377;
    }
    float _1571 = _1543;
    float _1573 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1553);
    if (_1229)
    {
        float _1575 = _1355 ? as_type<float>(_1521) : _1255;
        _1309 = _1575;
    }
    float _1577 = _1309;
    float _1579 = _532 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_1471)
    {
        _1525 = _1555;
    }
    float _1581 = _1525;
    float _1583 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1573);
    float _1585 = _1581;
    if (!_1471)
    {
        _1559 = _1373;
    }
    float _1587 = _1559;
    float _1589 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1591 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1593 = isnan(0.0);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1599 = _1595 || _1597;
    float _1601 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1603 = _1363 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (!_1471)
    {
        float _1605 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1587);
        _1585 = _1605;
    }
    float _1607 = _1585;
    float _1609 = _1589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1613 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1579);
    float _1615 = _1371 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1617 = _1603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1619 = -_1547;
    float _1621 = _1619 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1623 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1613);
    float _1625 = _1615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1627 = fma(_1509, _1453, _1557);
    float _1629 = 1.0 / _1601;
    float _1631 = _1623 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1599)
    {
        float _1633 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1561 = _1633;
    }
    float _1635 = _1561;
    float _1637 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1639 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_82.x = _1617;
    out.m_82.y = _1625;
    out.m_82.z = _1609;
    float _1641 = precise::min(_1541, _1567);
    float _1643 = _1635;
    if (!_1471)
    {
        float _1645 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1571);
        _1569 = _1645;
    }
    float _1647 = _1569;
    float _1649 = precise::min(_1547, _1621);
    float _1651 = _1631 + _1601;
    float _1653 = _1637 * _1611;
    float _1655 = _1639 * _1523;
    float _1657 = precise::min(_1641, _1649);
    float _1659 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1661 = in.m_84.x;
    float _1663 = in.m_84.y;
    float _1665 = in.m_84.z;
    float _1667 = in.m_84.w;
    float _1669 = _1651 * _1629;
    float _1671 = _1669 * 0.5;
    uint _1673 = uint(int(uint(_347) >> uint(2)));
    uint _1675 = uint(int(uint(int(_1673)) >> uint(2)));
    int _1677 = int(_1673) & 3;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[int(_1675)][_1677];
    int _1681 = int(_1673) + 1;
    uint _1683 = uint(int(uint(_1681) >> uint(2)));
    int _1685 = _1681 & 3;
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[int(_1683)][_1685];
    float _1689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1691 = _1577 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1693 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1695 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1693);
    if (!_1471)
    {
        float _1697 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1551);
        _1549 = _1697;
    }
    float _1699 = _1549;
    float _1701 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1627);
    if (_1599)
    {
        float _1703 = precise::min(_1635, 20.0);
        _1643 = _1703;
    }
    float _1705 = _1643;
    int _1707 = _347 + 8;
    uint _1709 = uint(int(uint(_1707) >> uint(2)));
    uint _1711 = uint(int(uint(int(_1709)) >> uint(2)));
    int _1713 = int(_1709) & 3;
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[int(_1711)][_1713];
    float _1717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1719 = _868 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1721 = isnan(_868);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1727 = _1723 || _1725;
    float _1729 = 1.0 / _1695;
    float _1731 = _1659 * _1689;
    float _1733 = _327 * _1663;
    float _1735 = _317 * _1663;
    float _1737 = _331 * _1663;
    float _1739 = _1691 * _1717;
    float _1741 = _1665 * _1587;
    float _1743 = fma(_291, _1661, _1733);
    float _1745 = _1547;
    float _1747 = _1717;
    if (_1599)
    {
        float _1749 = 1.0 / _1705;
        _1745 = _1749;
    }
    float _1751 = _1745;
    float _1753 = fma(_287, _1661, _1735);
    out.m_86.x = _1655;
    out.m_86.y = _1731;
    out.m_86.z = _1739;
    out.m_86.w = _1653;
    float _1755 = fma(_295, _1661, _1737);
    float _1757 = -_1741;
    float _1759 = fma(_1661, _1571, _1757);
    float _1761 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1763 = _1729 * _1761;
    float _1765 = _1661 * _1551;
    float _1767 = _1663 * _1571;
    float _1769 = fma(_335, _1665, _1753);
    float _1771 = fma(_339, _1665, _1743);
    float _1773 = -_1765;
    float _1775 = fma(_1663, _1587, _1773);
    float _1777 = _1759 * _1667;
    float _1779 = fma(_343, _1665, _1755);
    float _1781 = -_1767;
    float _1783 = fma(_1665, _1551, _1781);
    float _1785 = _317 * _1699;
    if (!_1599)
    {
        _1747 = 1.0;
    }
    float _1787 = _1747;
    float _1789 = abs(_1763);
    float _1791 = log2(_1789);
    float _1793 = _1787;
    if (_1599)
    {
        float _1795 = _1657 * _1751;
        float _1797 = precise::clamp(_1795, 0.0, 1.0);
        _1793 = _1797;
    }
    float _1799 = _1793;
    float _1801 = _327 * _1699;
    float _1803 = _331 * _1699;
    float _1805 = _1687 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1807 = _1777 * _317;
    float _1809 = fma(_287, _1607, _1785);
    float _1811 = fma(_291, _1607, _1801);
    float _1813 = fma(_295, _1607, _1803);
    float _1815 = _1783 * _1667;
    float _1817 = _1777 * _327;
    float _1819 = _1777 * _331;
    float _1821 = _1775 * _1667;
    float _1823 = _1679 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1825 = _1715 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1827 = _1771 * _566;
    float _1829 = _1791 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1831 = _1771 * _670;
    float _1833 = fma(_1815, _287, _1807);
    float _1835 = _1771 * _580;
    float _1837 = fma(_1815, _291, _1817);
    float _1839 = fma(_1815, _295, _1819);
    float _1841 = exp2(_1829);
    float _1843 = fma(_335, _1647, _1809);
    float _1845 = _1823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1847 = _1805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1849 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1851 = _1701 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1853 = fma(_1769, _666, _1827);
    float _1855 = fma(_1769, _568, _1831);
    float _1857 = fma(_1821, _335, _1833);
    float _1859 = fma(_339, _1647, _1811);
    float _1861 = fma(_1769, _574, _1835);
    float _1863 = fma(_1821, _339, _1837);
    float _1865 = fma(_343, _1647, _1813);
    float _1867 = fma(_1821, _343, _1839);
    float _1869 = fma(_1779, _570, _1853);
    float _1871 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1873 = precise::clamp(_1871, 0.0, 1.0);
    out.m_88.x = _1845;
    out.m_88.y = _1847;
    out.m_88.z = _1849;
    out.m_88.w = _1851;
    float _1875 = fma(_1779, _578, _1855);
    float _1877 = fma(_1779, _678, _1861);
    float _1879 = fma(_1873, -2.0, 3.0);
    float _1881 = _1873 * _1873;
    float _1883 = _1859 * _670;
    bool _1885 = _1763 <= 8000.0;
    bool _1887 = isnan(_1763);
    bool _1889 = _1885 || _1887;
    bool _1891 = isnan(8000.0);
    bool _1893 = _1889 || _1891;
    float _1895 = float(_1893);
    out.m_90.x = _1869;
    out.m_90.y = _1875;
    out.m_90.z = _1877;
    float _1897 = _1881 * _1879;
    float _1899 = fma(_1843, _568, _1883);
    float _1901 = _1859 * _566;
    float _1903 = _1863 * _566;
    float _1905 = _1863 * _670;
    float _1907 = _1863 * _580;
    float _1909 = fma(_1843, _666, _1901);
    float _1911 = fma(_1857, _666, _1903);
    float _1913 = fma(_1857, _568, _1905);
    float _1915 = fma(_1857, _574, _1907);
    float _1917 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1919 = -_1897;
    float _1921 = _1919 + 1.0;
    float _1923 = fma(_1867, _578, _1913);
    float _1925 = fma(_1867, _570, _1911);
    float _1927 = fma(_1867, _678, _1915);
    float _1929 = fma(_1921, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1897);
    float _1931 = exp2(_1917);
    float _1933 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1273);
    float _1935 = _1859 * _580;
    float _1937 = in.m_74.x;
    float _1939 = _1895 * _1929;
    float _1941 = _1799 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1943 = fma(_1843, _574, _1935);
    out.m_92.x = _1925;
    out.m_92.y = _1923;
    out.m_92.z = _1927;
    float _1945 = _1939 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1947 = _1933 + _1108;
    int _1949 = as_type<int>(_1877);
    float _1951 = _1909;
    float _1953 = 0.0;
    float _1955 = _1933;
    if (!_860)
    {
        float _1957 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _1949 = as_type<int>(_1957);
    }
    int _1959 = _1949;
    out.gl_Position.x = _1132;
    out.gl_Position.y = _1134;
    out.gl_Position.z = _1933;
    out.gl_Position.w = _1108;
    float _1961 = _1947 * 0.5;
    float _1963 = -_1931;
    float _1965 = _1963 + 1.0;
    float _1967 = _1941 * _834;
    if (!_860)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5346 = as_type<float>(_1959);
        out.gl_Position.z = _5346;
    }
    float _1969 = fma(_1865, _578, _1899);
    float _1971 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1973 = fma(_1865, _570, _1909);
    float _1975 = fma(_1865, _678, _1943);
    out.m_94.z = _1961;
    out.m_94.w = _1108;
    if (_860)
    {
        _1951 = _1967;
    }
    float _1977 = _1951;
    float _1979 = _1977;
    if (!_860)
    {
        _1979 = 0.0;
    }
    float _1981 = _1979;
    float _1983 = -_1971;
    float _1985 = _1983 + 1.0;
    out.m_96.x = _1973;
    out.m_96.y = _1969;
    out.m_96.z = _1975;
    float _1987 = _1985;
    if (!_1727)
    {
        _1953 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1989 = _1953;
    float _1991 = -_1176;
    float _1993 = _1991 + 1.0;
    float _1995 = _1989;
    float _1997 = _1989;
    if (!_1727)
    {
        _1142 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1999 = _1142;
    float _2001 = _1999;
    float _2003 = _1999;
    if (!_1727)
    {
        _1955 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2005 = _1955;
    float _2007 = _1993 * _1945;
    float _2009 = precise::clamp(_2007, 0.0, 1.0);
    float _2011 = _2005;
    float _2013 = _2005;
    if (!_1727)
    {
        _1144 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2015 = _1144;
    float _2017 = _1971 * _1188;
    float _2019 = -_2009;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2023 = _2021 * _1937;
    float _2025 = _2023 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2027 = _1209 * _2017;
    float _2029 = _1209 * _1985;
    out.m_98.x = _2025;
    float _2031 = _2027;
    float _2033 = _2015;
    float _2035 = _2015;
    if (!_1727)
    {
        _1987 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2037 = _1987;
    float _2039 = _1219 * _2017;
    float _2041 = fma(_1215, _2027, _1203);
    float _2043 = fma(_1217, _2027, _1205);
    float _2045 = _2037;
    float _2047 = _2037;
    if (!_1727)
    {
        _2031 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2049 = _2031;
    float _2051 = fma(_1209, _2039, _1207);
    out.m_100.x = _2041;
    out.m_100.y = _2043;
    out.m_100.z = _2051;
    out.m_100.w = _2029;
    bool _2053 = !_1727;
    float _2055 = _2049;
    float _2057 = _2049;
    if (!_2053)
    {
        bool _2059 = _868 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2061 = isnan(_868);
        bool _2063 = _2059 || _2061;
        bool _2065 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2067 = _2063 || _2065;
        if (!_2067)
        {
            float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2071 = _868 + _2069;
            float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2075 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2073;
            float _2077 = 1.0 / _2075;
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2085 = _2083 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2097 = _2095 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2099 = _2071 * _2077;
            float _2101 = precise::clamp(_2099, 0.0, 1.0);
            float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2105 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2107 = fma(_2101, _2081, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2109 = fma(_2101, _2105, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2111 = fma(_2101, _2085, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2113 = fma(_2101, _2089, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2115 = fma(_2101, _2093, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2117 = fma(_2101, _2097, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2003 = _2109;
            _2047 = _2115;
            _1997 = _2107;
            _2035 = _2113;
            _2013 = _2111;
            _2057 = _2117;
            _2119 = true;
        }
        else
        {
            bool _2121 = _868 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2123 = isnan(_868);
            bool _2125 = _2121 || _2123;
            bool _2127 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2129 = _2125 || _2127;
            if (!_2129)
            {
                _1995 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2131 = _1995;
            _1997 = _2131;
            if (!_2129)
            {
                _2001 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2133 = _2001;
            _2003 = _2133;
            if (!_2129)
            {
                _2011 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2135 = _2011;
            _2013 = _2135;
            if (!_2129)
            {
                _2033 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2137 = _2033;
            _2035 = _2137;
            if (!_2129)
            {
                _2045 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2139 = _2045;
            _2047 = _2139;
            if (!_2129)
            {
                _2055 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2141 = _2055;
            bool _2143 = !_2129;
            _2057 = _2141;
            if (!_2143)
            {
                bool _2145 = _868 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2147 = isnan(_868);
                bool _2149 = _2145 || _2147;
                bool _2151 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2153 = _2149 || _2151;
                if (!_2153)
                {
                    float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2157 = _868 + _2155;
                    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2161 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2159;
                    float _2163 = 1.0 / _2161;
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2181 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2183 = _2181 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2185 = _2157 * _2163;
                    float _2187 = precise::clamp(_2185, 0.0, 1.0);
                    float _2189 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2193 = fma(_2187, _2167, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2195 = fma(_2187, _2191, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2197 = fma(_2187, _2171, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2199 = fma(_2187, _2175, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2201 = fma(_2187, _2179, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2203 = fma(_2187, _2183, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2003 = _2195;
                    _2047 = _2201;
                    _1997 = _2193;
                    _2035 = _2199;
                    _2013 = _2197;
                    _2057 = _2203;
                    _2119 = true;
                }
                else
                {
                    _2003 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2047 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1997 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2035 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2013 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2057 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2119 = false;
    float _2205 = _2003;
    float _2207 = _2047;
    float _2209 = _1997;
    float _2211 = _2035;
    float _2213 = _2013;
    float _2215 = _2057;
    float _2217 = fma(_1969, -0.5, 0.5);
    float _2219 = precise::clamp(_2217, 0.0, 1.0);
    float _2221 = -_2205;
    float _2223 = _2221 + _2207;
    float _2225 = -_2209;
    float _2227 = _2225 + _2211;
    float _2229 = -_2213;
    float _2231 = _2229 + _2215;
    bool _2233 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2235 = fma(_2219, _2223, _2205);
    float _2237 = fma(_2219, _2227, _2209);
    float _2239 = fma(_2219, _2231, _2213);
    float _2241 = _1981 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2243 = _2235 * 0.586610972881317138671875;
    out.m_102.x = 0.0;
    float _2245 = fma(_2237, 0.298911988735198974609375, _2243);
    out.m_98.w = _2241;
    float _2247 = fma(_2239, 0.114477999508380889892578125, _2245);
    out.m_56.x = 1.0;
    float _2249 = -_2247;
    float _2251 = _2237 + _2249;
    float _2253 = -_2247;
    float _2255 = _2235 + _2253;
    float _2257 = -_2247;
    float _2259 = _2239 + _2257;
    float _2261 = fma(_2251, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2247);
    float _2263 = fma(_2255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2247);
    float _2265 = fma(_2259, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2247);
    out.m_104.x = _2261;
    out.m_104.y = _2263;
    out.m_104.z = _2265;
    if (!_2233)
    {
        return out;
    }
    float _2267 = -_756;
    float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2271 = -_758;
    float _2273 = _2271 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2275 = -_760;
    float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2279 = _2269 * _2269;
    float _2281 = fma(_2273, _2273, _2279);
    float _2283 = fma(_2277, _2277, _2281);
    float _2285 = sqrt(_2283);
    float _2287 = rsqrt(_2283);
    float _2289 = -_2285;
    float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2293 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2295 = precise::clamp(_2293, 0.0, 1.0);
    float _2297 = _2273 * _2287;
    float _2299 = _2269 * _2287;
    float _2301 = abs(_2295);
    float _2303 = log2(_2301);
    float _2305 = _2277 * _2287;
    float _2307 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2309 = _1969 * _2299;
    float _2311 = -_2299;
    float _2313 = -_2307;
    float _2315 = fma(_2311, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2313);
    float _2317 = fma(_1973, _2297, _2309);
    float _2319 = -_2305;
    float _2321 = fma(_2319, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2315);
    float _2323 = fma(_1975, _2305, _2317);
    float _2325 = precise::clamp(_2323, 0.0, 1.0);
    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2329 = _2321 + _2327;
    float _2331 = _2303 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2333 = _2329 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2335 = precise::clamp(_2333, 0.0, 1.0);
    float _2337 = exp2(_2331);
    float _2339 = _2337 * _2335;
    float _2341 = _2325 * _2339;
    float _2343 = _2341 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2345 = _2341 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2347 = _2341 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _2343;
    out.m_102.y = _2345;
    out.m_102.z = _2347;
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
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2119 = false;
    bool _367 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_53.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    float _133 = _131;
    if (!_127)
    {
        out.m_56.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2404 = as_type<float>(_139);
        out.gl_Position.z = _2404;
    }
    if (!_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_58.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = 0.0;
    if (_153)
    {
        float _161 = float(_123);
        _159 = _161;
    }
    float _163 = _159;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    if (_169)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _133;
    if (_169)
    {
        out.m_56.x = 0.0;
    }
    if (_169)
    {
        float _173 = _171 * 5.0;
        _141 = as_type<int>(_173);
    }
    int _175 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2472 = as_type<float>(_175);
        out.gl_Position.z = _2472;
    }
    if (_169)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    float _195 = in.m_66.x;
    float _197 = _177 * _177;
    float _199 = _179 * _179;
    float _201 = _181 * _181;
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = fma(_187, _187, _201);
    float _209 = fma(_189, _189, _203);
    float _211 = fma(_191, _191, _205);
    float _213 = fma(_193, _193, _207);
    float _215 = sqrt(_209);
    float _217 = sqrt(_211);
    float _219 = sqrt(_213);
    bool _221 = _215 > 0.0;
    bool _223 = _217 > 0.0;
    float _225 = _209;
    if (_221)
    {
        float _227 = rsqrt(_209);
        _225 = _227;
    }
    float _229 = _225;
    float _231 = 0.0;
    if (!_221)
    {
        _231 = 0.0;
    }
    float _233 = _231;
    bool _235 = _219 > 0.0;
    float _237 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _239 = 0.0;
    float _241 = _233;
    if (!_221)
    {
        _239 = 0.0;
    }
    float _243 = _239;
    float _245 = 0.0;
    float _247 = _243;
    if (_223)
    {
        float _249 = rsqrt(_211);
        _245 = _249;
    }
    float _251 = _245;
    float _253 = 0.0;
    if (!_221)
    {
        _253 = 0.0;
    }
    float _255 = _253;
    float _257 = _237 * _195;
    float _259 = 0.0;
    float _261 = _255;
    if (!_223)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    if (!_223)
    {
        _265 = 0.0;
    }
    float _269 = _265;
    float _271 = 0.0;
    float _273 = _269;
    if (!_223)
    {
        _271 = 0.0;
    }
    float _275 = _271;
    float _277 = _217;
    float _279 = _275;
    if (_235)
    {
        float _281 = rsqrt(_213);
        _277 = _281;
    }
    float _283 = _277;
    if (_221)
    {
        float _285 = _229 * _183;
        _241 = _285;
    }
    float _287 = _241;
    if (_221)
    {
        float _289 = _229 * _177;
        _247 = _289;
    }
    float _291 = _247;
    if (_221)
    {
        float _293 = _229 * _189;
        _261 = _293;
    }
    float _295 = _261;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _299 = 0.0;
    if (!_235)
    {
        _299 = 0.0;
    }
    float _301 = _299;
    float _303 = trunc(_257);
    int _305 = int(_303);
    float _307 = 0.0;
    float _309 = _301;
    if (!_235)
    {
        _307 = 0.0;
    }
    float _311 = _307;
    float _313 = _311;
    if (_223)
    {
        float _315 = _251 * _185;
        _267 = _315;
    }
    float _317 = _267;
    float _319 = 0.0;
    if (!_235)
    {
        _319 = 0.0;
    }
    float _321 = _319;
    float _323 = _321;
    if (_223)
    {
        float _325 = _251 * _179;
        _273 = _325;
    }
    float _327 = _273;
    if (_223)
    {
        float _329 = _251 * _191;
        _279 = _329;
    }
    float _331 = _279;
    if (_235)
    {
        float _333 = _283 * _187;
        _309 = _333;
    }
    float _335 = _309;
    if (_235)
    {
        float _337 = _283 * _181;
        _313 = _337;
    }
    float _339 = _313;
    if (_235)
    {
        float _341 = _283 * _193;
        _323 = _341;
    }
    float _343 = _323;
    int _345 = _305 << 4;
    int _347 = _345 + 1712;
    bool _349 = !_297;
    float _365;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _353 = _195 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[11].y, _157);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_123);
        float _371 = 1.0 / _369;
        float _373 = _157 * _371;
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
    int _405 = _403 << 5;
    uint _408 = uint(int(uint(_405) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_408)];
    float _410 = as_type<float>(_dmw0.x);
    int _412 = _405 + 4;
    uint _414 = uint(int(uint(_412) >> uint(2)));
    float _416 = as_type<float>(_dmw0.y);
    int _418 = _405 + 8;
    uint _420 = uint(int(uint(_418) >> uint(2)));
    float _422 = as_type<float>(_dmw0.z);
    int _424 = _405 + 12;
    uint _426 = uint(int(uint(_424) >> uint(2)));
    float _428 = as_type<float>(_dmw0.w);
    float _430 = _191 * _381;
    float _432 = _387 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = _385 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _436 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _393);
    float _438 = fma(_189, _379, _430);
    float _440 = _432 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _442 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _391);
    float _444 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _446 = _389 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _448 = _436 * _440;
    float _450 = _185 * _381;
    float _452 = _442 * _444;
    float _454 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _395);
    float _456 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _458 = _448 * _331;
    float _460 = fma(_183, _379, _450);
    float _462 = fma(_193, _383, _438);
    float _464 = _454 * _456;
    float _466 = _448 * _317;
    float _468 = fma(_452, _295, _458);
    float _470 = fma(_187, _383, _460);
    float _472 = _462 + _397;
    float _474 = fma(_452, _287, _466);
    float _476 = fma(_464, _343, _468);
    float _478 = _470 + _399;
    float _480 = _179 * _381;
    float _482 = fma(_464, _335, _474);
    float _484 = _472 + _476;
    float _486 = _448 * _327;
    float _488 = in.m_60.w;
    float _490 = _478 + _482;
    float _492 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _494 = _484 + _492;
    float _496 = fma(_177, _379, _480);
    float _498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _500 = _490 + _498;
    float _502 = _494 * _494;
    float _504 = fma(_181, _383, _496);
    float _506 = fma(_452, _291, _486);
    bool _508 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _510 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _512 = _508 || _510;
    bool _514 = isnan(0.5);
    bool _516 = _512 || _514;
    float _518 = fma(_500, _500, _502);
    float _520 = sqrt(_518);
    bool _522 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _524 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.5);
    bool _530 = _526 || _528;
    float _532 = _504 + _488;
    float _534 = fma(_464, _339, _506);
    float _536 = _532 + _534;
    bool _538 = _520 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _540 = _534;
    float _542 = _452;
    float _544 = _518;
    if (!_538)
    {
        _540 = _490;
    }
    float _546 = _540;
    float _548 = _428 * 2.0;
    float _550 = _410 * 2.0;
    float _552 = _416 * 2.0;
    float _554 = _416 * _416;
    float _556 = _422 * _548;
    float _558 = _416 * _548;
    float _560 = _410 * _548;
    float _562 = _422 * _422;
    float _564 = -_556;
    float _566 = fma(_416, _550, _564);
    float _568 = fma(_416, _550, _556);
    float _570 = fma(_422, _550, _558);
    float _572 = -_558;
    float _574 = fma(_422, _550, _572);
    float _576 = -_560;
    float _578 = fma(_422, _552, _576);
    float _580 = fma(_422, _552, _560);
    float _582 = _410 * _410;
    float _584 = _410;
    float _586 = _416;
    float _588 = _546;
    if (!_538)
    {
        _584 = _484;
    }
    float _590 = _584;
    float _592 = _590;
    if (!_538)
    {
        _586 = _536;
    }
    float _594 = _586;
    bool _596 = !_538;
    float _598 = _594;
    if (!_596)
    {
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _602 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _604 = _520 + _602;
        float _606 = _536 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _608 = rsqrt(_518);
        float _610 = _604 * _600;
        float _612 = _610 * 0.15915493667125701904296875;
        float _614 = _612 * 6.283185482025146484375;
        float _616 = cos(_614);
        float _618 = _612 * 6.283185482025146484375;
        float _620 = sin(_618);
        float _622 = _616 + (-1.0);
        float _624 = _622 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _626 = fma(_620, _606, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _628 = fma(_536, _616, _624);
        float _630 = _608 * _626;
        float _632 = fma(_500, _630, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _634 = fma(_494, _630, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _598 = _628;
        _588 = _632;
        _592 = _634;
    }
    float _636 = _598;
    float _638 = _588;
    float _640 = _592;
    float _642 = -_532;
    float _644 = _642 + _636;
    float _646 = -_478;
    float _648 = _646 + _638;
    float _650 = fma(_554, -2.0, 1.0);
    float _652 = -_472;
    float _654 = _652 + _640;
    float _656 = _644 * _327;
    float _658 = _644 * _291;
    float _660 = fma(_582, -2.0, 1.0);
    float _662 = _644 * _339;
    float _664 = fma(_648, _317, _656);
    float _666 = fma(_562, -2.0, _650);
    float _668 = fma(_648, _287, _658);
    float _670 = fma(_562, -2.0, _660);
    float _672 = fma(_654, _331, _664);
    float _674 = fma(_648, _335, _662);
    float _676 = fma(_654, _295, _668);
    float _678 = fma(_554, -2.0, _660);
    float _680 = _672 * _566;
    float _682 = _672 * _670;
    float _684 = _672 * _580;
    float _686 = fma(_654, _343, _674);
    float _688 = fma(_676, _666, _680);
    float _690 = fma(_676, _568, _682);
    float _692 = fma(_676, _574, _684);
    float _694 = _684;
    if (_530)
    {
        _542 = 1.0;
    }
    float _696 = _542;
    float _698 = fma(_686, _570, _688);
    float _700 = fma(_686, _578, _690);
    float _702 = fma(_686, _678, _692);
    float _704 = _478 + _698;
    float _706 = _532 + _700;
    float _708 = _472 + _702;
    float _710 = _706;
    float _712 = _704;
    float _714 = _708;
    float _716 = _696;
    if (!_516)
    {
        float _718 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _720 = _532 + _718;
        float _722 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _724 = _478 + _722;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _728 = _720 * _720;
        float _730 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _732 = _472 + _730;
        float _734 = fma(_724, _724, _728);
        float _736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _738 = fma(_732, _732, _734);
        float _740 = sqrt(_738);
        float _742 = _726 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _744 = precise::min(_740, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _746 = _744 * _736;
        float _748 = _742 * _746;
        float _750 = fma(_698, _748, _478);
        float _752 = fma(_700, _748, _532);
        float _754 = fma(_702, _748, _472);
        _710 = _752;
        _712 = _750;
        _714 = _754;
    }
    float _756 = _710;
    float _758 = _712;
    float _760 = _714;
    if (!_530)
    {
        float _762 = in.m_74.w;
        int _764 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _766 = _764 == 4;
        bool _768 = _764 == 8;
        bool _770 = _764 == 12;
        int _772 = as_type<int>(_762) << 16;
        int _774 = as_type<int>(_762) << 8;
        int _776 = as_type<int>(_762) << 24;
        int _778 = _772 >> 24;
        int _780 = _774 >> 24;
        int _782 = as_type<int>(_762) >> 24;
        int _784 = _776 >> 24;
        float _786 = float(_778);
        float _788 = float(_780);
        float _790 = float(_782);
        float _792 = _786 * 0.0078740157186985015869140625;
        float _794 = float(_784);
        float _796 = _788 * 0.0078740157186985015869140625;
        float _798 = _790 * 0.0078740157186985015869140625;
        float _800 = precise::min(_792, 1.0);
        float _802 = _794 * 0.0078740157186985015869140625;
        float _804 = precise::min(_796, 1.0);
        float _806 = precise::min(_798, 1.0);
        float _808 = precise::min(_802, 1.0);
        float _810 = precise::max(_800, -1.0);
        float _812 = precise::max(_804, -1.0);
        float _814 = precise::max(_806, -1.0);
        float _816 = precise::max(_808, -1.0);
        float _818 = _816;
        _694 = as_type<float>(_764);
        if (_766)
        {
            _818 = _810;
        }
        float _820 = _818;
        float _822 = _820;
        if (_768)
        {
            _822 = _812;
        }
        float _824 = _822;
        float _826 = _824;
        if (_770)
        {
            _826 = _814;
        }
        float _828 = _826;
        float _830 = abs(_828);
        float _832 = (-0.0) + _830;
        _716 = _832;
    }
    float _834 = _716;
    float _836 = _694;
    float _838 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _840 = _756 + _838;
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _844 = _758 + _842;
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _848 = _760 + _846;
    float _850 = _840 * _840;
    bool _852 = _834 != 0.0;
    bool _854 = isnan(_834);
    bool _856 = _852 || _854;
    bool _858 = isnan(0.0);
    bool _860 = _856 || _858;
    float _862 = fma(_844, _844, _850);
    float _864 = fma(_848, _848, _862);
    float _866 = rsqrt(_864);
    float _868 = sqrt(_864);
    float _870 = _866 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _872 = _844 * _870;
    float _874 = _848 * _870;
    float _876 = _872 * _872;
    float _878 = _874 * _874;
    float _880 = _876 + _878;
    float _882 = sqrt(_880);
    bool _884 = _882 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _888 = _882 + _886;
    float _890 = _866;
    float _892 = _880;
    float _894 = _888;
    float _896 = _840;
    if (_884)
    {
        float _898 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _890 = _898;
    }
    float _900 = _890;
    if (_884)
    {
        float _902 = rsqrt(_880);
        _892 = _902;
    }
    float _904 = _892;
    float _906 = _904;
    if (_884)
    {
        float _908 = _888 * _900;
        _894 = _908;
    }
    float _910 = _894;
    if (_884)
    {
        float _912 = _910 * 0.15915493667125701904296875;
        _544 = _912;
    }
    float _914 = _544;
    float _916 = _836;
    if (_884)
    {
        float _918 = _914 * 6.283185482025146484375;
        float _920 = sin(_918);
        _916 = _920;
    }
    float _922 = _916;
    float _924 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _926 = precise::max(0.0, _924);
    float _928 = _848;
    float _930 = _926;
    float _932 = _924;
    if (_884)
    {
        float _934 = _914 * 6.283185482025146484375;
        float _936 = cos(_934);
        _928 = _936;
    }
    float _938 = _928;
    float _940 = -_870;
    float _942 = -_926;
    float _944 = fma(_840, _940, _942);
    float _946 = _944;
    if (!_884)
    {
        _896 = _872;
    }
    float _948 = _896;
    float _950 = _948;
    if (_884)
    {
        float _952 = _944 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _930 = _952;
    }
    float _954 = _930;
    float _956 = _922;
    float _958 = _954;
    if (_884)
    {
        float _960 = fma(_922, _954, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _956 = _960;
    }
    float _962 = _956;
    if (_884)
    {
        float _964 = _938 + (-1.0);
        _932 = _964;
    }
    float _966 = _932;
    float _968 = 0.0;
    float _970 = _966;
    if (_884)
    {
        float _972 = _904 * _962;
        _968 = _972;
    }
    float _974 = _968;
    float _976 = _756 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _978 = _976;
    if (!_884)
    {
        _906 = _876;
    }
    float _980 = _906;
    float _982 = _980;
    if (_884)
    {
        float _984 = _966 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _958 = _984;
    }
    float _986 = _958;
    if (_884)
    {
        float _988 = _872 * _974;
        _950 = _988;
    }
    float _990 = _950;
    if (!_884)
    {
        _970 = _874;
    }
    float _992 = _970;
    float _994 = _992;
    if (_884)
    {
        float _996 = _874 * _974;
        _994 = _996;
    }
    float _998 = _994;
    if (_884)
    {
        float _1000 = fma(_944, _938, _986);
        _946 = _1000;
    }
    float _1002 = _946;
    if (_884)
    {
        float _1004 = _990 * _990;
        _982 = _1004;
    }
    float _1006 = _982;
    float _1008 = fma(_478, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1010 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[2].x, _976);
    float _1012 = _1008;
    if (!_884)
    {
        _978 = _878;
    }
    float _1014 = _978;
    float _1016 = _1014;
    if (_884)
    {
        float _1018 = _998 * _998;
        _1016 = _1018;
    }
    float _1020 = _1016;
    float _1022 = fma(_1002, _1002, _1006);
    float _1024 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1010);
    float _1026 = _756 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1028 = _1022 + _1020;
    float _1030 = _756 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1034 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1036 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1026);
    float _1038 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1030);
    float _1040 = rsqrt(_1028);
    float _1042 = fma(_472, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1044 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1046 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1038);
    float _1048 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1036);
    float _1050 = -_1044;
    float _1052 = fma(_1050, _1034, 1.0);
    float _1054 = _756 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1058 = fma(_868, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1056);
    float _1060 = precise::clamp(_1058, 0.0, 1.0);
    float _1062 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1064 = _1048 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1066 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1054);
    float _1068 = -_1060;
    float _1070 = _1068 + 1.0;
    float _1072 = floor(_1008);
    float _1074 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1066);
    float _1076 = _1040 * _990;
    float _1078 = _1040 * _1002;
    float _1080 = _1040 * _998;
    float _1082 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1084 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1086 = abs(_1070);
    float _1088 = log2(_1086);
    float _1090 = _1076 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1092 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1084);
    float _1094 = -_1090;
    float _1096 = fma(_1078, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1094);
    float _1098 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1092);
    float _1100 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1102 = -_1080;
    float _1104 = fma(_1102, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1096);
    float _1106 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1108 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1098);
    float _1110 = floor(_1042);
    float _1112 = fma(_1104, -0.5, 0.5);
    float _1114 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1106);
    float _1116 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1100);
    float _1118 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1120 = fma(_1104, 0.5, 0.5);
    float _1122 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1114);
    float _1124 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1116);
    float _1126 = 1.0 / _1108;
    float _1128 = -_1072;
    float _1130 = _1008 + _1128;
    float _1132 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1122);
    float _1134 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1124);
    float _1136 = fma(_1120, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1138 = _1078 + 1.0;
    float _1140 = _1072;
    float _1142 = _1108;
    float _1144 = _1134;
    if (_860)
    {
        _1140 = _1132;
    }
    float _1146 = _1140;
    float _1148 = log2(_1052);
    float _1150 = _1146;
    if (_860)
    {
        _1012 = _1134;
    }
    float _1152 = _1012;
    float _1154 = -_1110;
    float _1156 = _1042 + _1154;
    float _1158 = _1152;
    if (!_860)
    {
        _1150 = 0.0;
    }
    float _1160 = _1150;
    float _1162 = fma(_1120, _1136, -0.212114393711090087890625);
    if (!_860)
    {
        _1158 = 0.0;
    }
    float _1164 = _1158;
    float _1166 = sqrt(_1112);
    float _1168 = _1126 * _1160;
    float _1170 = _1126 * _1164;
    float _1172 = exp2(_1118);
    float _1174 = _1148 * 0.693147182464599609375;
    float2 _4005 = float2(_1130, _1156);
    float _1176 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4005, float2(0.0), isnan(_4005)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4005, float2(0.0), isnan(_4005)), level(0.0)).x;
    float _1178 = fma(_1120, _1162, 1.570728778839111328125);
    float _1180 = fma(_1168, 0.5, 0.5);
    float _1182 = _1174 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1184 = fma(_1170, -0.5, 0.5);
    float _1186 = _1166 * 0.636619746685028076171875;
    float3 _4031 = float3(_1180, _1184, _1182);
    float _1188 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4031, float3(0.0), isnan(_4031)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4031, float3(0.0), isnan(_4031)), level(0.0)).x;
    float _1190 = -_1178;
    float _1192 = fma(_1186, _1190, 1.0);
    float _1194 = -_1078;
    float _1196 = fma(_1172, _1138, _1194);
    float _1198 = fma(_1196, 0.5, 0.5);
    float3 _4055 = float3(_1180, _1184, _1182);
    float4 _1201 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4055, float3(0.0), isnan(_4055)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4055, float3(0.0), isnan(_4055)), level(0.0)).xyzw;
    float _1203 = _1201.x;
    float _1205 = _1201.y;
    float _1207 = _1201.z;
    float _1209 = _1201.w;
    float2 _4071 = float2(_1192, _1198);
    float3 _1213 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4071, float2(0.0), isnan(_4071)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4071, float2(0.0), isnan(_4071)), level(0.0)).xyz;
    float _1215 = _1213.x;
    float _1217 = _1213.y;
    float _1219 = _1213.z;
    float _1221 = in.m_66.w;
    float _1223 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1225 = in.m_66.y;
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1229 = _1227 != 0;
    float _1231 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1223);
    float _1233 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1235 = in.m_76.y;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1239 = _1237 != 0;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1243 = _1241 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1247 = _1245 != 0;
    float _1249 = _1233 * _195;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1253 = _1251 != 0;
    float _1255 = in.m_76.x;
    float _1257 = trunc(_1249);
    int _1259 = int(_1257);
    float _1261 = _1180;
    bool _1263 = _1247;
    if (_1229)
    {
        float _1265 = in.m_66.z;
        _1261 = _1265;
    }
    float _1267 = _1261;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1271 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1273 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1231);
    float _1275 = 1.0 / _1243;
    bool _1277 = _1221 > 0.5;
    float _1279 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1281 = _1279 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1283;
    bool _1287 = _1225 > 0.5;
    out.m_78.x = _758;
    out.m_78.y = _756;
    out.m_78.z = _760;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1293 = 1.0 / _1271;
    float _1295 = -_1235;
    float _1297 = _1295 + 1.0;
    int _1299 = _1259 << 4;
    int _1301 = _1299 + 1968;
    float _1303 = 0.0;
    bool _1305 = _1277;
    float _1307 = _1235;
    float _1309 = _1255;
    if (!_1239)
    {
        _1303 = _1255;
    }
    float _1311 = _1303;
    float _1313 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    int _1315 = _1301 + 8;
    uint _1317 = uint(int(uint(_1315) >> uint(2)));
    uint _1319 = uint(int(uint(int(_1317)) >> uint(2)));
    int _1321 = int(_1317) & 3;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[int(_1319)][_1321];
    float _1325 = 1.0 / _1291;
    int _1327 = _1277 ? as_type<int>(_1297) : as_type<int>(_1235);
    float _1329 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1331 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1329);
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1335 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1333;
    float _1337 = _1311;
    if (_1239)
    {
        bool _1339 = _195 > 0.5;
        _1305 = _1339;
    }
    bool _1341 = _1305;
    float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1345 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1343);
    float _1347 = _1247 ? as_type<float>(_1327) : _1235;
    float _1349 = _1335 * _1275;
    float _1351 = _1281 * _1293;
    if (_1229)
    {
        bool _1353 = _1267 > 0.5;
        _1263 = _1353;
    }
    bool _1355 = _1263;
    uint _1357 = uint(int(uint(_1301) >> uint(2)));
    uint _1359 = uint(int(uint(int(_1357)) >> uint(2)));
    int _1361 = int(_1357) & 3;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[int(_1359)][_1361];
    int _1365 = int(_1357) + 1;
    uint _1367 = uint(int(uint(_1365) >> uint(2)));
    int _1369 = _1365 & 3;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[int(_1367)][_1369];
    float _1373 = in.m_80.x;
    float _1375 = in.m_80.y;
    float _1377 = in.m_80.z;
    bool _1379 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1381 = isnan(_375);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1387 = _1383 || _1385;
    float _1389 = float(_1387);
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1393 = _375 + _1391;
    if (_1253)
    {
        float _1395 = _1287 ? _1297 : _1235;
        _1307 = _1395;
    }
    float _1397 = _1307;
    float _1399 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1331);
    float _1401 = _1285 * _1325;
    bool _1403 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1405 = isnan(_375);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1411 = _1407 || _1409;
    float _1413 = float(_1411);
    float _1415 = -_1389;
    float _1417 = _1415 + 1.0;
    bool _1419 = _393 != 0.0;
    bool _1421 = isnan(_393);
    bool _1423 = _1419 || _1421;
    bool _1425 = isnan(0.0);
    bool _1427 = _1423 || _1425;
    float _1429 = fma(_1349, _1393, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1431 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1433 = isnan(_375);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1439 = _1435 || _1437;
    float _1441 = float(_1439);
    float _1443 = -_1413;
    float _1445 = _1443 + 1.0;
    bool _1447 = _391 == 0.0;
    bool _1449 = !_1427;
    bool _1451 = _1447 && _1449;
    float _1453 = _1413 * _1417;
    bool _1455 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1457 = isnan(_375);
    bool _1459 = _1455 || _1457;
    bool _1461 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1463 = _1459 || _1461;
    float _1465 = float(_1463);
    float _1467 = _1441 * _1445;
    bool _1469 = _395 == 0.0;
    bool _1471 = _1469 && _1451;
    float _1473 = -_1441;
    float _1475 = _1473 + 1.0;
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1479 = _375 + _1477;
    float _1481 = -_1465;
    float _1483 = _1481 + 1.0;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1487 = _375 + _1485;
    float _1489 = _1465 * _1475;
    float _1491 = fma(_1351, _1479, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1493 = as_type<int>(_1479);
    int _1495 = as_type<int>(_1429);
    float _1497 = _1465;
    float _1499 = _1487;
    float _1501 = _1475;
    if (_1239)
    {
        float _1503 = -_1255;
        float _1505 = _1503 + 1.0;
        _1493 = as_type<int>(_1505);
    }
    int _1507 = _1493;
    float _1509 = fma(_1401, _1487, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1511 = _1429 * _1489;
    float _1513 = as_type<float>(_1507);
    float _1515 = _1511;
    if (_1229)
    {
        float _1517 = -_1255;
        float _1519 = _1517 + 1.0;
        _1495 = as_type<int>(_1519);
    }
    int _1521 = _1495;
    float _1523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1525 = as_type<float>(_1521);
    if (_1239)
    {
        float _1527 = _1341 ? as_type<float>(_1507) : _1255;
        _1337 = _1527;
    }
    float _1529 = _1337;
    float _1531 = fma(_1483, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1511);
    if (_1471)
    {
        _1513 = _1375;
    }
    float _1533 = _1513;
    float _1535 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1345);
    float _1537 = _1533;
    if (_1471)
    {
        _1515 = _1377;
    }
    float _1539 = _1515;
    float _1541 = _478 + _1399;
    float _1543 = _1539;
    if (_1471)
    {
        _1497 = _1533;
    }
    float _1545 = _1497;
    float _1547 = _472 + _1535;
    float _1549 = _1545;
    if (!_1471)
    {
        _1537 = _1375;
    }
    float _1551 = _1537;
    float _1553 = _532 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_1471)
    {
        _1499 = _1373;
    }
    float _1555 = _1499;
    float _1557 = fma(_1491, _1467, _1531);
    float _1559 = _1555;
    float _1561 = _1557;
    if (_1471)
    {
        _1501 = _1539;
    }
    float _1563 = _1501;
    float _1565 = -_1541;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1569 = _1563;
    if (!_1471)
    {
        _1543 = _1377;
    }
    float _1571 = _1543;
    float _1573 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1553);
    if (_1229)
    {
        float _1575 = _1355 ? as_type<float>(_1521) : _1255;
        _1309 = _1575;
    }
    float _1577 = _1309;
    float _1579 = _532 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_1471)
    {
        _1525 = _1555;
    }
    float _1581 = _1525;
    float _1583 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1573);
    float _1585 = _1581;
    if (!_1471)
    {
        _1559 = _1373;
    }
    float _1587 = _1559;
    float _1589 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1591 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1593 = isnan(0.0);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1599 = _1595 || _1597;
    float _1601 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1603 = _1363 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (!_1471)
    {
        float _1605 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1587);
        _1585 = _1605;
    }
    float _1607 = _1585;
    float _1609 = _1589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1613 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1579);
    float _1615 = _1371 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1617 = _1603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1619 = -_1547;
    float _1621 = _1619 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1623 = fma(_472, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1613);
    float _1625 = _1615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1627 = fma(_1509, _1453, _1557);
    float _1629 = 1.0 / _1601;
    float _1631 = _1623 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (_1599)
    {
        float _1633 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1561 = _1633;
    }
    float _1635 = _1561;
    float _1637 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1639 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_82.x = _1617;
    out.m_82.y = _1625;
    out.m_82.z = _1609;
    float _1641 = precise::min(_1541, _1567);
    float _1643 = _1635;
    if (!_1471)
    {
        float _1645 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1571);
        _1569 = _1645;
    }
    float _1647 = _1569;
    float _1649 = precise::min(_1547, _1621);
    float _1651 = _1631 + _1601;
    float _1653 = _1637 * _1611;
    float _1655 = _1639 * _1523;
    float _1657 = precise::min(_1641, _1649);
    float _1659 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1661 = in.m_84.x;
    float _1663 = in.m_84.y;
    float _1665 = in.m_84.z;
    float _1667 = in.m_84.w;
    float _1669 = _1651 * _1629;
    float _1671 = _1669 * 0.5;
    uint _1673 = uint(int(uint(_347) >> uint(2)));
    uint _1675 = uint(int(uint(int(_1673)) >> uint(2)));
    int _1677 = int(_1673) & 3;
    float _1679 = (*spvDescriptorSet0.vp_c9)._m0[int(_1675)][_1677];
    int _1681 = int(_1673) + 1;
    uint _1683 = uint(int(uint(_1681) >> uint(2)));
    int _1685 = _1681 & 3;
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[int(_1683)][_1685];
    float _1689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1691 = _1577 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1693 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1695 = fma(_1671, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1693);
    if (!_1471)
    {
        float _1697 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1551);
        _1549 = _1697;
    }
    float _1699 = _1549;
    float _1701 = fma(_1389, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1627);
    if (_1599)
    {
        float _1703 = precise::min(_1635, 20.0);
        _1643 = _1703;
    }
    float _1705 = _1643;
    int _1707 = _347 + 8;
    uint _1709 = uint(int(uint(_1707) >> uint(2)));
    uint _1711 = uint(int(uint(int(_1709)) >> uint(2)));
    int _1713 = int(_1709) & 3;
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[int(_1711)][_1713];
    float _1717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1719 = _868 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1721 = isnan(_868);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1727 = _1723 || _1725;
    float _1729 = 1.0 / _1695;
    float _1731 = _1659 * _1689;
    float _1733 = _327 * _1663;
    float _1735 = _317 * _1663;
    float _1737 = _331 * _1663;
    float _1739 = _1691 * _1717;
    float _1741 = _1665 * _1587;
    float _1743 = fma(_291, _1661, _1733);
    float _1745 = _1547;
    float _1747 = _1717;
    if (_1599)
    {
        float _1749 = 1.0 / _1705;
        _1745 = _1749;
    }
    float _1751 = _1745;
    float _1753 = fma(_287, _1661, _1735);
    out.m_86.x = _1655;
    out.m_86.y = _1731;
    out.m_86.z = _1739;
    out.m_86.w = _1653;
    float _1755 = fma(_295, _1661, _1737);
    float _1757 = -_1741;
    float _1759 = fma(_1661, _1571, _1757);
    float _1761 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1763 = _1729 * _1761;
    float _1765 = _1661 * _1551;
    float _1767 = _1663 * _1571;
    float _1769 = fma(_335, _1665, _1753);
    float _1771 = fma(_339, _1665, _1743);
    float _1773 = -_1765;
    float _1775 = fma(_1663, _1587, _1773);
    float _1777 = _1759 * _1667;
    float _1779 = fma(_343, _1665, _1755);
    float _1781 = -_1767;
    float _1783 = fma(_1665, _1551, _1781);
    float _1785 = _317 * _1699;
    if (!_1599)
    {
        _1747 = 1.0;
    }
    float _1787 = _1747;
    float _1789 = abs(_1763);
    float _1791 = log2(_1789);
    float _1793 = _1787;
    if (_1599)
    {
        float _1795 = _1657 * _1751;
        float _1797 = precise::clamp(_1795, 0.0, 1.0);
        _1793 = _1797;
    }
    float _1799 = _1793;
    float _1801 = _327 * _1699;
    float _1803 = _331 * _1699;
    float _1805 = _1687 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1807 = _1777 * _317;
    float _1809 = fma(_287, _1607, _1785);
    float _1811 = fma(_291, _1607, _1801);
    float _1813 = fma(_295, _1607, _1803);
    float _1815 = _1783 * _1667;
    float _1817 = _1777 * _327;
    float _1819 = _1777 * _331;
    float _1821 = _1775 * _1667;
    float _1823 = _1679 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1825 = _1715 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1827 = _1771 * _566;
    float _1829 = _1791 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1831 = _1771 * _670;
    float _1833 = fma(_1815, _287, _1807);
    float _1835 = _1771 * _580;
    float _1837 = fma(_1815, _291, _1817);
    float _1839 = fma(_1815, _295, _1819);
    float _1841 = exp2(_1829);
    float _1843 = fma(_335, _1647, _1809);
    float _1845 = _1823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1847 = _1805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1849 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1851 = _1701 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1853 = fma(_1769, _666, _1827);
    float _1855 = fma(_1769, _568, _1831);
    float _1857 = fma(_1821, _335, _1833);
    float _1859 = fma(_339, _1647, _1811);
    float _1861 = fma(_1769, _574, _1835);
    float _1863 = fma(_1821, _339, _1837);
    float _1865 = fma(_343, _1647, _1813);
    float _1867 = fma(_1821, _343, _1839);
    float _1869 = fma(_1779, _570, _1853);
    float _1871 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1873 = precise::clamp(_1871, 0.0, 1.0);
    out.m_88.x = _1845;
    out.m_88.y = _1847;
    out.m_88.z = _1849;
    out.m_88.w = _1851;
    float _1875 = fma(_1779, _578, _1855);
    float _1877 = fma(_1779, _678, _1861);
    float _1879 = fma(_1873, -2.0, 3.0);
    float _1881 = _1873 * _1873;
    float _1883 = _1859 * _670;
    bool _1885 = _1763 <= 8000.0;
    bool _1887 = isnan(_1763);
    bool _1889 = _1885 || _1887;
    bool _1891 = isnan(8000.0);
    bool _1893 = _1889 || _1891;
    float _1895 = float(_1893);
    out.m_90.x = _1869;
    out.m_90.y = _1875;
    out.m_90.z = _1877;
    float _1897 = _1881 * _1879;
    float _1899 = fma(_1843, _568, _1883);
    float _1901 = _1859 * _566;
    float _1903 = _1863 * _566;
    float _1905 = _1863 * _670;
    float _1907 = _1863 * _580;
    float _1909 = fma(_1843, _666, _1901);
    float _1911 = fma(_1857, _666, _1903);
    float _1913 = fma(_1857, _568, _1905);
    float _1915 = fma(_1857, _574, _1907);
    float _1917 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1919 = -_1897;
    float _1921 = _1919 + 1.0;
    float _1923 = fma(_1867, _578, _1913);
    float _1925 = fma(_1867, _570, _1911);
    float _1927 = fma(_1867, _678, _1915);
    float _1929 = fma(_1921, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1897);
    float _1931 = exp2(_1917);
    float _1933 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1273);
    float _1935 = _1859 * _580;
    float _1937 = in.m_74.x;
    float _1939 = _1895 * _1929;
    float _1941 = _1799 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1943 = fma(_1843, _574, _1935);
    out.m_92.x = _1925;
    out.m_92.y = _1923;
    out.m_92.z = _1927;
    float _1945 = _1939 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1947 = _1933 + _1108;
    int _1949 = as_type<int>(_1877);
    float _1951 = _1909;
    float _1953 = 0.0;
    float _1955 = _1933;
    if (!_860)
    {
        float _1957 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        _1949 = as_type<int>(_1957);
    }
    int _1959 = _1949;
    out.gl_Position.x = _1132;
    out.gl_Position.y = _1134;
    out.gl_Position.z = _1933;
    out.gl_Position.w = _1108;
    float _1961 = _1947 * 0.5;
    float _1963 = -_1931;
    float _1965 = _1963 + 1.0;
    float _1967 = _1941 * _834;
    if (!_860)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5346 = as_type<float>(_1959);
        out.gl_Position.z = _5346;
    }
    float _1969 = fma(_1865, _578, _1899);
    float _1971 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1973 = fma(_1865, _570, _1909);
    float _1975 = fma(_1865, _678, _1943);
    out.m_94.z = _1961;
    out.m_94.w = _1108;
    if (_860)
    {
        _1951 = _1967;
    }
    float _1977 = _1951;
    float _1979 = _1977;
    if (!_860)
    {
        _1979 = 0.0;
    }
    float _1981 = _1979;
    float _1983 = -_1971;
    float _1985 = _1983 + 1.0;
    out.m_96.x = _1973;
    out.m_96.y = _1969;
    out.m_96.z = _1975;
    float _1987 = _1985;
    if (!_1727)
    {
        _1953 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1989 = _1953;
    float _1991 = -_1176;
    float _1993 = _1991 + 1.0;
    float _1995 = _1989;
    float _1997 = _1989;
    if (!_1727)
    {
        _1142 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1999 = _1142;
    float _2001 = _1999;
    float _2003 = _1999;
    if (!_1727)
    {
        _1955 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2005 = _1955;
    float _2007 = _1993 * _1945;
    float _2009 = precise::clamp(_2007, 0.0, 1.0);
    float _2011 = _2005;
    float _2013 = _2005;
    if (!_1727)
    {
        _1144 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2015 = _1144;
    float _2017 = _1971 * _1188;
    float _2019 = -_2009;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2023 = _2021 * _1937;
    float _2025 = _2023 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2027 = _1209 * _2017;
    float _2029 = _1209 * _1985;
    out.m_98.x = _2025;
    float _2031 = _2027;
    float _2033 = _2015;
    float _2035 = _2015;
    if (!_1727)
    {
        _1987 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2037 = _1987;
    float _2039 = _1219 * _2017;
    float _2041 = fma(_1215, _2027, _1203);
    float _2043 = fma(_1217, _2027, _1205);
    float _2045 = _2037;
    float _2047 = _2037;
    if (!_1727)
    {
        _2031 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2049 = _2031;
    float _2051 = fma(_1209, _2039, _1207);
    out.m_100.x = _2041;
    out.m_100.y = _2043;
    out.m_100.z = _2051;
    out.m_100.w = _2029;
    bool _2053 = !_1727;
    float _2055 = _2049;
    float _2057 = _2049;
    if (!_2053)
    {
        bool _2059 = _868 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2061 = isnan(_868);
        bool _2063 = _2059 || _2061;
        bool _2065 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2067 = _2063 || _2065;
        if (!_2067)
        {
            float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2071 = _868 + _2069;
            float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2075 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2073;
            float _2077 = 1.0 / _2075;
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2085 = _2083 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2097 = _2095 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2099 = _2071 * _2077;
            float _2101 = precise::clamp(_2099, 0.0, 1.0);
            float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2105 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2107 = fma(_2101, _2081, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2109 = fma(_2101, _2105, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2111 = fma(_2101, _2085, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2113 = fma(_2101, _2089, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2115 = fma(_2101, _2093, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2117 = fma(_2101, _2097, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2003 = _2109;
            _2047 = _2115;
            _1997 = _2107;
            _2035 = _2113;
            _2013 = _2111;
            _2057 = _2117;
            _2119 = true;
        }
        else
        {
            bool _2121 = _868 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2123 = isnan(_868);
            bool _2125 = _2121 || _2123;
            bool _2127 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2129 = _2125 || _2127;
            if (!_2129)
            {
                _1995 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2131 = _1995;
            _1997 = _2131;
            if (!_2129)
            {
                _2001 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2133 = _2001;
            _2003 = _2133;
            if (!_2129)
            {
                _2011 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2135 = _2011;
            _2013 = _2135;
            if (!_2129)
            {
                _2033 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2137 = _2033;
            _2035 = _2137;
            if (!_2129)
            {
                _2045 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2139 = _2045;
            _2047 = _2139;
            if (!_2129)
            {
                _2055 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2141 = _2055;
            bool _2143 = !_2129;
            _2057 = _2141;
            if (!_2143)
            {
                bool _2145 = _868 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2147 = isnan(_868);
                bool _2149 = _2145 || _2147;
                bool _2151 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2153 = _2149 || _2151;
                if (!_2153)
                {
                    float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2157 = _868 + _2155;
                    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2161 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2159;
                    float _2163 = 1.0 / _2161;
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2181 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2183 = _2181 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2185 = _2157 * _2163;
                    float _2187 = precise::clamp(_2185, 0.0, 1.0);
                    float _2189 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2193 = fma(_2187, _2167, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2195 = fma(_2187, _2191, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2197 = fma(_2187, _2171, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2199 = fma(_2187, _2175, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2201 = fma(_2187, _2179, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2203 = fma(_2187, _2183, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2003 = _2195;
                    _2047 = _2201;
                    _1997 = _2193;
                    _2035 = _2199;
                    _2013 = _2197;
                    _2057 = _2203;
                    _2119 = true;
                }
                else
                {
                    _2003 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2047 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1997 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2035 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2013 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2057 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2119 = false;
    float _2205 = _2003;
    float _2207 = _2047;
    float _2209 = _1997;
    float _2211 = _2035;
    float _2213 = _2013;
    float _2215 = _2057;
    float _2217 = fma(_1969, -0.5, 0.5);
    float _2219 = precise::clamp(_2217, 0.0, 1.0);
    float _2221 = -_2205;
    float _2223 = _2221 + _2207;
    float _2225 = -_2209;
    float _2227 = _2225 + _2211;
    float _2229 = -_2213;
    float _2231 = _2229 + _2215;
    bool _2233 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2235 = fma(_2219, _2223, _2205);
    float _2237 = fma(_2219, _2227, _2209);
    float _2239 = fma(_2219, _2231, _2213);
    float _2241 = _1981 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2243 = _2235 * 0.586610972881317138671875;
    out.m_102.x = 0.0;
    float _2245 = fma(_2237, 0.298911988735198974609375, _2243);
    out.m_98.w = _2241;
    float _2247 = fma(_2239, 0.114477999508380889892578125, _2245);
    out.m_56.x = 1.0;
    float _2249 = -_2247;
    float _2251 = _2237 + _2249;
    float _2253 = -_2247;
    float _2255 = _2235 + _2253;
    float _2257 = -_2247;
    float _2259 = _2239 + _2257;
    float _2261 = fma(_2251, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2247);
    float _2263 = fma(_2255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2247);
    float _2265 = fma(_2259, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2247);
    out.m_104.x = _2261;
    out.m_104.y = _2263;
    out.m_104.z = _2265;
    if (!_2233)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2267 = -_756;
    float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2271 = -_758;
    float _2273 = _2271 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2275 = -_760;
    float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2279 = _2269 * _2269;
    float _2281 = fma(_2273, _2273, _2279);
    float _2283 = fma(_2277, _2277, _2281);
    float _2285 = sqrt(_2283);
    float _2287 = rsqrt(_2283);
    float _2289 = -_2285;
    float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2293 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2295 = precise::clamp(_2293, 0.0, 1.0);
    float _2297 = _2273 * _2287;
    float _2299 = _2269 * _2287;
    float _2301 = abs(_2295);
    float _2303 = log2(_2301);
    float _2305 = _2277 * _2287;
    float _2307 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2309 = _1969 * _2299;
    float _2311 = -_2299;
    float _2313 = -_2307;
    float _2315 = fma(_2311, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2313);
    float _2317 = fma(_1973, _2297, _2309);
    float _2319 = -_2305;
    float _2321 = fma(_2319, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2315);
    float _2323 = fma(_1975, _2305, _2317);
    float _2325 = precise::clamp(_2323, 0.0, 1.0);
    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2329 = _2321 + _2327;
    float _2331 = _2303 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2333 = _2329 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2335 = precise::clamp(_2333, 0.0, 1.0);
    float _2337 = exp2(_2331);
    float _2339 = _2337 * _2335;
    float _2341 = _2325 * _2339;
    float _2343 = _2341 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2345 = _2341 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2347 = _2341 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _2343;
    out.m_102.y = _2345;
    out.m_102.z = _2347;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

