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
    float4 m_78 [[user(locn0)]];
    float4 m_76 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_56 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_88 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_80 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
    float4 m_74 [[attribute(7)]];
    float4 m_70 [[attribute(8)]];
    float4 m_66 [[attribute(9)]];
    float4 m_72 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1657 = false;
    bool _357 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_53.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_56.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1890 = as_type<float>(_127);
        out.gl_Position.z = _1890;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_58.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_141)
    {
        float _147 = float(_111);
        _121 = _147;
    }
    float _149 = _121;
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
        out.m_56.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _129 = as_type<int>(_161);
    }
    int _163 = _129;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1959 = as_type<float>(_163);
        out.gl_Position.z = _1959;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = in.m_60.x;
    float _167 = in.m_60.y;
    float _169 = in.m_60.z;
    float _171 = in.m_62.x;
    float _173 = in.m_62.y;
    float _175 = in.m_62.z;
    float _177 = in.m_64.x;
    float _179 = in.m_64.y;
    float _181 = in.m_64.z;
    float _183 = in.m_66.x;
    float _185 = _165 * _165;
    float _187 = _167 * _167;
    float _189 = _169 * _169;
    float _191 = fma(_171, _171, _185);
    float _193 = fma(_173, _173, _187);
    float _195 = fma(_175, _175, _189);
    float _197 = fma(_177, _177, _191);
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = sqrt(_197);
    float _205 = sqrt(_199);
    float _207 = sqrt(_201);
    bool _209 = _203 > 0.0;
    bool _211 = _205 > 0.0;
    float _213 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _215 = _197;
    float _217 = _213;
    float _219 = _165;
    if (_209)
    {
        float _221 = rsqrt(_197);
        _215 = _221;
    }
    float _223 = _215;
    float _225 = 0.0;
    if (!_209)
    {
        _225 = 0.0;
    }
    float _227 = _225;
    bool _229 = _207 > 0.0;
    float _231 = _213 * _183;
    float _233 = 0.0;
    float _235 = _227;
    if (!_209)
    {
        _233 = 0.0;
    }
    float _237 = _233;
    float _239 = 0.0;
    float _241 = _237;
    if (!_209)
    {
        _239 = 0.0;
    }
    float _243 = _239;
    float _245 = 0.0;
    float _247 = _243;
    if (_211)
    {
        float _249 = rsqrt(_199);
        _245 = _249;
    }
    float _251 = _245;
    float _253 = 0.0;
    if (!_211)
    {
        _253 = 0.0;
    }
    float _255 = _253;
    float _257 = 0.0;
    float _259 = _255;
    if (!_211)
    {
        _257 = 0.0;
    }
    float _261 = _257;
    float _263 = 0.0;
    float _265 = _261;
    if (!_211)
    {
        _263 = 0.0;
    }
    float _267 = _263;
    float _269 = _203;
    float _271 = _267;
    if (_229)
    {
        float _273 = rsqrt(_201);
        _269 = _273;
    }
    float _275 = _269;
    float _277 = _223;
    if (_209)
    {
        float _279 = _223 * _171;
        _235 = _279;
    }
    float _281 = _235;
    if (_209)
    {
        float _283 = _223 * _165;
        _241 = _283;
    }
    float _285 = _241;
    if (_209)
    {
        float _287 = _223 * _177;
        _247 = _287;
    }
    float _289 = _247;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = 0.0;
    if (!_229)
    {
        _293 = 0.0;
    }
    float _295 = _293;
    float _297 = trunc(_231);
    int _299 = int(_297);
    float _301 = _295;
    if (!_229)
    {
        _217 = 0.0;
    }
    float _303 = _217;
    float _305 = _303;
    if (_211)
    {
        float _307 = _251 * _173;
        _259 = _307;
    }
    float _309 = _259;
    if (!_229)
    {
        _277 = 0.0;
    }
    float _311 = _277;
    float _313 = _311;
    if (_211)
    {
        float _315 = _251 * _167;
        _265 = _315;
    }
    float _317 = _265;
    if (_211)
    {
        float _319 = _251 * _179;
        _271 = _319;
    }
    float _321 = _271;
    if (_229)
    {
        float _323 = _275 * _175;
        _301 = _323;
    }
    float _325 = _301;
    if (_229)
    {
        float _327 = _275 * _169;
        _305 = _327;
    }
    float _329 = _305;
    if (_229)
    {
        float _331 = _275 * _181;
        _313 = _331;
    }
    float _333 = _313;
    int _335 = _299 << 4;
    int _337 = _335 + 1712;
    bool _339 = !_291;
    float _355;
    if (!_339)
    {
        float _341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _343 = _183 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _345 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _347 = _345 * _341;
        float _349 = floor(_347);
        float _351 = -_349;
        float _353 = _347 + _351;
        _355 = _353;
        _357 = true;
    }
    else
    {
        float _359 = float(_111);
        float _361 = 1.0 / _359;
        float _363 = _145 * _361;
        _355 = _363;
    }
    _357 = false;
    float _365 = _355;
    float _367 = in.m_68.w;
    float _369 = in.m_70.x;
    float _371 = in.m_70.y;
    float _373 = in.m_70.z;
    float _375 = in.m_62.w;
    float _377 = trunc(_367);
    int _379 = int(_377);
    int _381 = _379 << 5;
    uint _384 = uint(int(uint(_381) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_384)];
    float _386 = as_type<float>(_dmw0.x);
    int _388 = _381 + 4;
    uint _390 = uint(int(uint(_388) >> uint(2)));
    float _392 = as_type<float>(_dmw0.y);
    int _394 = _381 + 8;
    uint _396 = uint(int(uint(_394) >> uint(2)));
    float _398 = as_type<float>(_dmw0.z);
    int _400 = _381 + 12;
    uint _402 = uint(int(uint(_400) >> uint(2)));
    float _404 = as_type<float>(_dmw0.w);
    float _406 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _408 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _410 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _406);
    float _412 = in.m_53.x;
    float _414 = in.m_53.y;
    float _416 = in.m_53.z;
    float _418 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _408);
    float _420 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _410);
    float _422 = in.m_72.x;
    float _424 = in.m_72.y;
    float _426 = in.m_72.z;
    float _428 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _430 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _418);
    float _432 = rsqrt(_420);
    float _434 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _428);
    float _436 = in.m_64.w;
    float _438 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _434);
    float _440 = rsqrt(_430);
    float _442 = rsqrt(_438);
    float _444 = _173 * _414;
    float _446 = _179 * _414;
    float _448 = _432 * _369;
    float _450 = _424 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _452 = fma(_171, _412, _444);
    float _454 = fma(_177, _412, _446);
    float _456 = _422 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _458 = _440 * _371;
    float _460 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _462 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _448);
    float _464 = _456 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _466 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _458);
    float _468 = _426 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _470 = fma(_181, _416, _454);
    float _472 = _464 * _462;
    float _474 = _442 * _373;
    float _476 = _460 * _466;
    float _478 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _480 = fma(_175, _416, _452);
    float _482 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _474);
    float _484 = _476 * _321;
    float _486 = _476 * _309;
    float _488 = _470 + _436;
    float _490 = _478 * _482;
    float _492 = fma(_472, _289, _484);
    float _494 = fma(_472, _281, _486);
    float _496 = _480 + _375;
    float _498 = _167 * _414;
    float _500 = fma(_490, _333, _492);
    float _502 = fma(_490, _325, _494);
    float _504 = in.m_60.w;
    float _506 = fma(_165, _412, _498);
    float _508 = _488 + _500;
    float _510 = _496 + _502;
    float _512 = _476 * _317;
    float _514 = fma(_169, _416, _506);
    float _516 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _518 = _508 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _522 = _510 + _520;
    float _524 = fma(_472, _285, _512);
    float _526 = _518 * _518;
    float _528 = fma(_490, _329, _524);
    float _530 = fma(_522, _522, _526);
    float _532 = sqrt(_530);
    bool _534 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _536 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.5);
    bool _542 = _538 || _540;
    float _544 = _514 + _504;
    float _546 = _544 + _528;
    bool _548 = _532 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _550 = _365;
    if (!_548)
    {
        _219 = _508;
    }
    float _552 = _219;
    float _554 = _404 * 2.0;
    float _556 = _386 * 2.0;
    float _558 = _392 * 2.0;
    float _560 = _392 * _392;
    float _562 = _398 * _554;
    float _564 = _386 * _554;
    float _566 = _392 * _554;
    float _568 = _398 * _398;
    float _570 = -_562;
    float _572 = fma(_392, _556, _570);
    float _574 = fma(_392, _556, _562);
    float _576 = fma(_398, _556, _566);
    float _578 = -_564;
    float _580 = fma(_398, _558, _578);
    float _582 = -_566;
    float _584 = fma(_398, _556, _582);
    float _586 = fma(_398, _558, _564);
    float _588 = _386 * _386;
    float _590 = _392;
    float _592 = _564;
    float _594 = _552;
    if (!_548)
    {
        _590 = _510;
    }
    float _596 = _590;
    float _598 = _596;
    if (!_548)
    {
        _592 = _546;
    }
    float _600 = _592;
    bool _602 = !_548;
    float _604 = _600;
    if (!_602)
    {
        float _606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _608 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _610 = _532 + _608;
        float _612 = _546 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _614 = rsqrt(_530);
        float _616 = _610 * _606;
        float _618 = _616 * 0.15915493667125701904296875;
        float _620 = _618 * 6.283185482025146484375;
        float _622 = cos(_620);
        float _624 = _618 * 6.283185482025146484375;
        float _626 = sin(_624);
        float _628 = _622 + (-1.0);
        float _630 = _628 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _632 = fma(_626, _612, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _634 = fma(_546, _622, _630);
        float _636 = _614 * _632;
        float _638 = fma(_522, _636, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _640 = fma(_518, _636, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _604 = _634;
        _598 = _638;
        _594 = _640;
    }
    float _642 = _604;
    float _644 = _598;
    float _646 = _594;
    float _648 = -_544;
    float _650 = _648 + _642;
    float _652 = -_496;
    float _654 = _652 + _644;
    float _656 = fma(_560, -2.0, 1.0);
    float _658 = -_488;
    float _660 = _658 + _646;
    float _662 = _650 * _317;
    float _664 = _650 * _285;
    float _666 = fma(_588, -2.0, 1.0);
    float _668 = _650 * _329;
    float _670 = fma(_654, _309, _662);
    float _672 = fma(_568, -2.0, _656);
    float _674 = fma(_654, _281, _664);
    float _676 = fma(_568, -2.0, _666);
    float _678 = fma(_660, _321, _670);
    float _680 = fma(_654, _325, _668);
    float _682 = fma(_660, _289, _674);
    float _684 = fma(_560, -2.0, _666);
    float _686 = _678 * _572;
    float _688 = _678 * _676;
    float _690 = _678 * _586;
    float _692 = fma(_660, _333, _680);
    float _694 = fma(_682, _672, _686);
    float _696 = fma(_682, _574, _688);
    float _698 = fma(_682, _584, _690);
    float _700 = fma(_692, _576, _694);
    float _702 = fma(_692, _580, _696);
    float _704 = fma(_692, _684, _698);
    float _706 = _496 + _700;
    float _708 = _544 + _702;
    float _710 = _488 + _704;
    float _712 = _708;
    float _714 = _706;
    float _716 = _710;
    float _718 = _704;
    if (!_542)
    {
        float _720 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _722 = _544 + _720;
        float _724 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _726 = _496 + _724;
        float _728 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _730 = _722 * _722;
        float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _734 = _488 + _732;
        float _736 = fma(_726, _726, _730);
        float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _740 = fma(_734, _734, _736);
        float _742 = sqrt(_740);
        float _744 = _728 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _746 = precise::min(_742, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _748 = _746 * _738;
        float _750 = _744 * _748;
        float _752 = fma(_700, _750, _496);
        float _754 = fma(_702, _750, _544);
        float _756 = fma(_704, _750, _488);
        _712 = _754;
        _714 = _752;
        _716 = _756;
    }
    float _758 = _712;
    float _760 = _714;
    float _762 = _716;
    float _764 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _766 = _758 + _764;
    float _768 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _770 = _760 + _768;
    float _772 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _774 = _762 + _772;
    float _776 = _766 * _766;
    float _778 = fma(_770, _770, _776);
    float _780 = fma(_774, _774, _778);
    float _782 = rsqrt(_780);
    float _784 = sqrt(_780);
    float _786 = _782 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _788 = _770 * _786;
    float _790 = _774 * _786;
    float _792 = _788 * _788;
    float _794 = _790 * _790;
    float _796 = _792 + _794;
    float _798 = sqrt(_796);
    bool _800 = _798 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _802 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _804 = _798 + _802;
    float _806 = _774;
    float _808 = _776;
    float _810 = _804;
    float _812 = _766;
    if (_800)
    {
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _806 = _814;
    }
    float _816 = _806;
    if (_800)
    {
        float _818 = rsqrt(_796);
        _808 = _818;
    }
    float _820 = _808;
    float _822 = _820;
    if (_800)
    {
        float _824 = _804 * _816;
        _810 = _824;
    }
    float _826 = _810;
    if (_800)
    {
        float _828 = _826 * 0.15915493667125701904296875;
        _718 = _828;
    }
    float _830 = _718;
    float _832 = _782;
    if (_800)
    {
        float _834 = _830 * 6.283185482025146484375;
        float _836 = sin(_834);
        _832 = _836;
    }
    float _838 = _832;
    float _840 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _842 = precise::max(0.0, _840);
    float _844 = _702;
    float _846 = _842;
    float _848 = _840;
    if (_800)
    {
        float _850 = _830 * 6.283185482025146484375;
        float _852 = cos(_850);
        _844 = _852;
    }
    float _854 = _844;
    float _856 = -_786;
    float _858 = -_842;
    float _860 = fma(_766, _856, _858);
    if (!_800)
    {
        _812 = _788;
    }
    float _862 = _812;
    float _864 = _862;
    if (_800)
    {
        float _866 = _860 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _846 = _866;
    }
    float _868 = _846;
    float _870 = _838;
    float _872 = _868;
    if (_800)
    {
        float _874 = fma(_838, _868, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _870 = _874;
    }
    float _876 = _870;
    float _878 = _876;
    float _880 = _854;
    if (_800)
    {
        float _882 = _854 + (-1.0);
        _848 = _882;
    }
    float _884 = _848;
    float _886 = 0.0;
    float _888 = _884;
    if (_800)
    {
        float _890 = _820 * _876;
        _886 = _890;
    }
    float _892 = _886;
    if (!_800)
    {
        _822 = _860;
    }
    float _894 = _822;
    float _896 = _894;
    if (_800)
    {
        float _898 = _884 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _872 = _898;
    }
    float _900 = _872;
    if (_800)
    {
        float _902 = _788 * _892;
        _864 = _902;
    }
    float _904 = _864;
    if (!_800)
    {
        _888 = _790;
    }
    float _906 = _888;
    float _908 = _906;
    if (_800)
    {
        float _910 = _790 * _892;
        _908 = _910;
    }
    float _912 = _908;
    if (!_800)
    {
        _878 = _792;
    }
    float _914 = _878;
    float _916 = _914;
    if (_800)
    {
        float _918 = fma(_860, _854, _900);
        _896 = _918;
    }
    float _920 = _896;
    if (_800)
    {
        float _922 = _904 * _904;
        _916 = _922;
    }
    float _924 = _916;
    float _926 = _758 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_800)
    {
        _880 = _794;
    }
    float _928 = _880;
    float _930 = _928;
    if (_800)
    {
        float _932 = _912 * _912;
        _930 = _932;
    }
    float _934 = _930;
    float _936 = fma(_920, _920, _924);
    float _938 = fma(_496, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _940 = _758 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _942 = _936 + _934;
    float _944 = _758 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _946 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[1].x, _940);
    float _948 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[2].x, _926);
    float _950 = rsqrt(_942);
    float _952 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[0].x, _944);
    float _954 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[1].z, _946);
    float _956 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _958 = fma(_784, (*spvDescriptorSet0.vp_c15)._m0[23].w, _956);
    float _960 = precise::clamp(_958, 0.0, 1.0);
    float _962 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[2].z, _948);
    float _964 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[0].z, _952);
    float _966 = _954 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _968 = -_960;
    float _970 = _968 + 1.0;
    float _972 = _962 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _974 = _964 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _976 = _966 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _978 = _758 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _980 = floor(_938);
    float _982 = fma(_488, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[7].x, _976);
    float _986 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[3].x, _978);
    float _988 = _950 * _904;
    float _990 = _950 * _912;
    float _992 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[7].z, _984);
    float _994 = _950 * _920;
    float _996 = abs(_970);
    float _998 = log2(_996);
    float _1000 = _988 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1002 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[3].z, _986);
    float _1004 = -_1000;
    float _1006 = fma(_994, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1004);
    float _1008 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1010 = floor(_982);
    float _1012 = -_990;
    float _1014 = fma(_1012, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1006);
    float _1016 = _972 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1018 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[7].w, _992);
    float _1020 = fma(_1014, -0.5, 0.5);
    float _1022 = -_980;
    float _1024 = _938 + _1022;
    float _1026 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1028 = _998 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1030 = 1.0 / _1018;
    float _1032 = _966 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1034 = -_1016;
    float _1036 = fma(_1034, _1026, 1.0);
    float _1038 = _966 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1040 = fma(_1014, 0.5, 0.5);
    float _1042 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1032);
    float _1044 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1038);
    float _1046 = exp2(_1028);
    float _1048 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1042);
    float _1050 = fma(_1040, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1052 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1044);
    float _1054 = _994 + 1.0;
    float _1056 = -_1010;
    float _1058 = _982 + _1056;
    float _1060 = fma(_1040, _1050, -0.212114393711090087890625);
    float _1062 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1052);
    float _1064 = log2(_1036);
    float _1066 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1048);
    float _1068 = sqrt(_1020);
    float _1070 = -_994;
    float _1072 = fma(_1046, _1054, _1070);
    float _1074 = _1062 * _1030;
    float _1076 = _1066 * _1030;
    float2 _3418 = float2(_1024, _1058);
    float _1078 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3418, float2(0.0), isnan(_3418)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3418, float2(0.0), isnan(_3418)), level(0.0)).x;
    float _1080 = fma(_1040, _1060, 1.570728778839111328125);
    float _1082 = fma(_1074, 0.5, 0.5);
    float _1084 = fma(_1076, -0.5, 0.5);
    float _1086 = _1064 * 0.693147182464599609375;
    float _1088 = fma(_1072, 0.5, 0.5);
    float _1090 = _1086 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1092 = _1068 * 0.636619746685028076171875;
    float3 _3449 = float3(_1082, _1084, _1090);
    float _1094 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3449, float3(0.0), isnan(_3449)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3449, float3(0.0), isnan(_3449)), level(0.0)).x;
    float3 _3460 = float3(_1082, _1084, _1090);
    float4 _1097 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3460, float3(0.0), isnan(_3460)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3460, float3(0.0), isnan(_3460)), level(0.0)).xyzw;
    float _1099 = _1097.x;
    float _1101 = _1097.y;
    float _1103 = _1097.z;
    float _1105 = _1097.w;
    float _1107 = -_1080;
    float _1109 = fma(_1092, _1107, 1.0);
    float2 _3481 = float2(_1109, _1088);
    float3 _1113 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3481, float2(0.0), isnan(_3481)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3481, float2(0.0), isnan(_3481)), level(0.0)).xyz;
    float _1115 = _1113.x;
    float _1117 = _1113.y;
    float _1119 = _1113.z;
    float _1121 = _544 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1123 = _998 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1129 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1121);
    float _1131 = _544 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1135 = _1133 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1137 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1129);
    float _1139 = 1.0 / _1127;
    float _1141 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1131);
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1143;
    float _1147 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1149 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1141);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1155 = 1.0 / _1147;
    float _1157 = _1149 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1159 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1165 = _966 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1169 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1167);
    float _1171 = 1.0 / _1135;
    float _1173 = _1157 + _1147;
    float _1175 = _1153 * _1139;
    bool _1177 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1179 = isnan(_365);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1185 = _1181 || _1183;
    float _1187 = float(_1185);
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1191 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1189);
    bool _1193 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1195 = isnan(_365);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1201 = _1197 || _1199;
    float _1203 = float(_1201);
    float _1205 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1169);
    bool _1207 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1209 = isnan(_365);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = -_1187;
    float _1221 = _1219 + 1.0;
    float _1223 = _1173 * _1155;
    float _1225 = _1223 * 0.5;
    float _1227 = 1.0 / _1163;
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1231 = _365 + _1229;
    float _1233 = _1203 * _1221;
    float _1235 = -_1203;
    float _1237 = _1235 + 1.0;
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1241 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1239);
    float _1243 = -_1217;
    float _1245 = _1243 + 1.0;
    float _1247 = _1145 * _1171;
    float _1249 = _1217 * _1237;
    float _1251 = 1.0 / _1241;
    float _1253 = fma(_1247, _1231, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1255 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1257 = isnan(_365);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    uint _1267 = uint(int(uint(_337) >> uint(2)));
    uint _1269 = uint(int(uint(int(_1267)) >> uint(2)));
    int _1271 = int(_1267) & 3;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[int(_1269)][_1271];
    int _1275 = int(_1267) + 1;
    uint _1277 = uint(int(uint(_1275) >> uint(2)));
    int _1279 = _1275 & 3;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[int(_1277)][_1279];
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1283;
    bool _1287 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1289 = isnan(0.0);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1295 = _1291 || _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1299 = _365 + _1297;
    float _1301 = _1265 * _1245;
    float _1303 = _1285 * _1227;
    float _1305 = -_1265;
    float _1307 = _1305 + 1.0;
    bool _1309 = _458 != 0.0;
    bool _1311 = isnan(_458);
    bool _1313 = _1309 || _1311;
    bool _1315 = isnan(0.0);
    bool _1317 = _1313 || _1315;
    int _1319 = _337 + 8;
    uint _1321 = uint(int(uint(_1319) >> uint(2)));
    uint _1323 = uint(int(uint(int(_1321)) >> uint(2)));
    int _1325 = int(_1321) & 3;
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[int(_1323)][_1325];
    float _1329 = _1253 * _1301;
    float _1331 = exp2(_1123);
    bool _1333 = _448 == 0.0;
    bool _1335 = !_1317;
    bool _1337 = _1333 && _1335;
    float _1339 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1165);
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1343 = _1251 * _1341;
    float _1345 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1329);
    float _1347 = 0.0;
    float _1349 = _1301;
    if (_1295)
    {
        float _1351 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1347 = _1351;
    }
    float _1353 = _1347;
    float _1355 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1191);
    float _1357 = fma(_1175, _1299, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1359 = abs(_1343);
    float _1361 = log2(_1359);
    float _1363 = _496 + _1205;
    float _1365 = _488 + _1355;
    if (_1295)
    {
        float _1367 = precise::min(_1353, 20.0);
        _1349 = _1367;
    }
    float _1369 = _1349;
    float _1371 = in.m_74.x;
    float _1373 = in.m_74.y;
    float _1375 = in.m_74.z;
    float _1377 = -_1363;
    float _1379 = _1377 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1381 = -_1365;
    float _1383 = _1381 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1387 = _365 + _1385;
    bool _1389 = _474 == 0.0;
    bool _1391 = _1389 && _1337;
    float _1393 = fma(_1357, _1249, _1345);
    float _1395 = precise::min(_1363, _1379);
    float _1397 = fma(_1303, _1387, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1399 = precise::min(_1365, _1383);
    float _1401 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1339);
    float _1403 = fma(_1397, _1233, _1393);
    float _1405 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1407 = precise::min(_1395, _1399);
    float _1409 = -_1331;
    float _1411 = _1409 + 1.0;
    float _1413 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1403);
    bool _1415 = _1343 <= 8000.0;
    bool _1417 = isnan(_1343);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan(8000.0);
    bool _1423 = _1419 || _1421;
    float _1425 = float(_1423);
    float _1427 = exp2(_1405);
    float _1429 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_76.x = 1.0;
    out.m_76.y = 1.0;
    out.m_76.z = 1.0;
    float _1431 = _1413 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (!_1295)
    {
        _550 = 1.0;
    }
    float _1433 = _550;
    float _1435 = _1373;
    float _1437 = _1371;
    float _1439 = _1375;
    float _1441 = _1433;
    if (!_1391)
    {
        float _1443 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1373);
        _1435 = _1443;
    }
    float _1445 = _1435;
    float _1447 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1449 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (!_1391)
    {
        float _1451 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1371);
        _1437 = _1451;
    }
    float _1453 = _1437;
    float _1455 = _317 * _1445;
    float _1457 = _309 * _1445;
    float _1459 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1461 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1463 = _1327 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1465 = _321 * _1445;
    if (!_1391)
    {
        float _1467 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1375);
        _1439 = _1467;
    }
    float _1469 = _1439;
    float _1471 = fma(_1427, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1473 = precise::clamp(_1471, 0.0, 1.0);
    float _1475 = _1463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1477 = fma(_285, _1453, _1455);
    float _1479 = fma(_281, _1453, _1457);
    float _1481 = fma(_1473, -2.0, 3.0);
    float _1483 = _1473 * _1473;
    float _1485 = fma(_289, _1453, _1465);
    out.m_78.x = _1459;
    out.m_78.y = _1461;
    out.m_78.z = _1475;
    out.m_78.w = _1431;
    float _1487 = fma(_329, _1469, _1477);
    float _1489 = _1483 * _1481;
    float _1491 = fma(_325, _1469, _1479);
    float _1493 = in.m_80.x;
    float _1495 = fma(_333, _1469, _1485);
    float _1497 = -_1489;
    float _1499 = _1497 + 1.0;
    float _1501 = _1487 * _572;
    float _1503 = _1487 * _676;
    float _1505 = _1487 * _586;
    float _1507 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1489);
    float _1509 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1401);
    float _1511 = fma(_1491, _672, _1501);
    float _1513 = _1425 * _1507;
    float _1515 = _1509 + _1018;
    float _1517 = fma(_1491, _574, _1503);
    float _1519 = fma(_1491, _584, _1505);
    float _1521 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1523 = _1515 * 0.5;
    out.gl_Position.x = _1062;
    out.gl_Position.y = _1066;
    out.gl_Position.z = _1509;
    out.gl_Position.w = _1018;
    float _1525 = fma(_1495, _576, _1511);
    float _1527 = fma(_1495, _580, _1517);
    float _1529 = fma(_1495, _684, _1519);
    float _1531 = as_type<float>(_337);
    float _1533 = _1505;
    if (_1295)
    {
        float _1535 = 1.0 / _1369;
        _1531 = _1535;
    }
    float _1537 = _1531;
    bool _1539 = _784 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1541 = isnan(_784);
    bool _1543 = _1539 || _1541;
    bool _1545 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1547 = _1543 || _1545;
    out.m_82.x = _1525;
    out.m_82.y = _1527;
    out.m_82.z = _1529;
    out.m_84.z = _1523;
    out.m_84.w = _1018;
    float _1549 = -_1429;
    float _1551 = _1549 + 1.0;
    if (!_1547)
    {
        _1533 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1553 = _1533;
    float _1555 = _1553;
    float _1557 = _1553;
    if (_1295)
    {
        float _1559 = _1407 * _1537;
        float _1561 = precise::clamp(_1559, 0.0, 1.0);
        _1441 = _1561;
    }
    float _1563 = _1441;
    float _1565 = _1563 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1567 = -_1078;
    float _1569 = _1567 + 1.0;
    float _1571 = _1569 * _1521;
    float _1573 = precise::clamp(_1571, 0.0, 1.0);
    float _1575 = -_1573;
    float _1577 = fma(_1575, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1579 = _1577 * _1493;
    float _1581 = _1429 * _1094;
    float _1583 = _1105 * _1551;
    float _1585 = _1579 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1587 = _1105 * _1581;
    float _1589 = _1579;
    float _1591 = _1587;
    if (!_1547)
    {
        _1589 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1593 = _1589;
    out.m_86.x = _1585;
    float _1595 = _1119 * _1581;
    float _1597 = fma(_1115, _1587, _1099);
    float _1599 = fma(_1117, _1587, _1101);
    float _1601 = _1593;
    float _1603 = _1593;
    if (!_1547)
    {
        _1591 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1605 = _1591;
    float _1607 = fma(_1105, _1595, _1103);
    out.m_88.x = _1597;
    out.m_88.y = _1599;
    out.m_88.z = _1607;
    out.m_88.w = _1583;
    bool _1609 = !_1547;
    float _1611 = _1605;
    float _1613 = _1605;
    if (!_1609)
    {
        bool _1615 = _784 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1617 = isnan(_784);
        bool _1619 = _1615 || _1617;
        bool _1621 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1623 = _1619 || _1621;
        if (!_1623)
        {
            float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1627 = _784 + _1625;
            float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1631 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1629;
            float _1633 = 1.0 / _1631;
            float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1637 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1641 = _1639 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1643 = _1627 * _1633;
            float _1645 = precise::clamp(_1643, 0.0, 1.0);
            float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1649 = _1647 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1651 = fma(_1645, _1641, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1653 = fma(_1645, _1649, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1655 = fma(_1645, _1637, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1603 = _1655;
            _1557 = _1653;
            _1613 = _1651;
            _1657 = true;
        }
        else
        {
            bool _1659 = _784 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1661 = isnan(_784);
            bool _1663 = _1659 || _1661;
            bool _1665 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1667 = _1663 || _1665;
            if (!_1667)
            {
                _1555 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1669 = _1555;
            _1557 = _1669;
            if (!_1667)
            {
                _1601 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1671 = _1601;
            _1603 = _1671;
            if (!_1667)
            {
                _1611 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1673 = _1611;
            bool _1675 = !_1667;
            _1613 = _1673;
            if (!_1675)
            {
                bool _1677 = _784 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1679 = isnan(_784);
                bool _1681 = _1677 || _1679;
                bool _1683 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1685 = _1681 || _1683;
                if (!_1685)
                {
                    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1689 = _784 + _1687;
                    float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1693 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1691;
                    float _1695 = 1.0 / _1693;
                    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1705 = _1689 * _1695;
                    float _1707 = precise::clamp(_1705, 0.0, 1.0);
                    float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1711 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1713 = fma(_1707, _1703, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1715 = fma(_1707, _1711, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1717 = fma(_1707, _1699, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1603 = _1717;
                    _1557 = _1715;
                    _1613 = _1713;
                    _1657 = true;
                }
                else
                {
                    _1603 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1557 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1613 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1657 = false;
    float _1719 = _1603;
    float _1721 = _1557;
    float _1723 = _1613;
    float _1725 = _1719 * 0.586610972881317138671875;
    bool _1727 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1729 = _1565 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_56.x = 1.0;
    float _1731 = fma(_1721, 0.298911988735198974609375, _1725);
    out.m_86.w = _1729;
    float _1733 = fma(_1723, 0.114477999508380889892578125, _1731);
    out.m_90.x = 0.0;
    float _1735 = -_1733;
    float _1737 = _1735 + _1721;
    float _1739 = -_1733;
    float _1741 = _1739 + _1719;
    float _1743 = -_1733;
    float _1745 = _1743 + _1723;
    float _1747 = fma(_1737, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1733);
    float _1749 = fma(_1741, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1733);
    float _1751 = fma(_1745, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1733);
    out.m_92.x = _1747;
    out.m_92.y = _1749;
    out.m_92.z = _1751;
    if (!_1727)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1753 = -_758;
    float _1755 = _1753 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1757 = -_760;
    float _1759 = _1757 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1761 = -_762;
    float _1763 = _1761 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1765 = _1755 * _1755;
    float _1767 = fma(_1759, _1759, _1765);
    float _1769 = fma(_1763, _1763, _1767);
    float _1771 = sqrt(_1769);
    float _1773 = rsqrt(_1769);
    float _1775 = -_1771;
    float _1777 = _1775 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1779 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1781 = precise::clamp(_1779, 0.0, 1.0);
    float _1783 = _1759 * _1773;
    float _1785 = _1755 * _1773;
    float _1787 = abs(_1781);
    float _1789 = log2(_1787);
    float _1791 = _1763 * _1773;
    float _1793 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1795 = _1527 * _1785;
    float _1797 = -_1785;
    float _1799 = -_1793;
    float _1801 = fma(_1797, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1799);
    float _1803 = fma(_1525, _1783, _1795);
    float _1805 = -_1791;
    float _1807 = fma(_1805, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1801);
    float _1809 = fma(_1529, _1791, _1803);
    float _1811 = precise::clamp(_1809, 0.0, 1.0);
    float _1813 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1815 = _1807 + _1813;
    float _1817 = _1789 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1819 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1821 = precise::clamp(_1819, 0.0, 1.0);
    float _1823 = exp2(_1817);
    float _1825 = _1823 * _1821;
    float _1827 = _1811 * _1825;
    float _1829 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1831 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1833 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _1829;
    out.m_90.y = _1831;
    out.m_90.z = _1833;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1657 = false;
    bool _357 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_53.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_56.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1890 = as_type<float>(_127);
        out.gl_Position.z = _1890;
    }
    if (!_115)
    {
        return out;
    }
    float _131 = in.m_58.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_141)
    {
        float _147 = float(_111);
        _121 = _147;
    }
    float _149 = _121;
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
        out.m_56.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _129 = as_type<int>(_161);
    }
    int _163 = _129;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1959 = as_type<float>(_163);
        out.gl_Position.z = _1959;
    }
    if (_155)
    {
        return out;
    }
    float _165 = in.m_60.x;
    float _167 = in.m_60.y;
    float _169 = in.m_60.z;
    float _171 = in.m_62.x;
    float _173 = in.m_62.y;
    float _175 = in.m_62.z;
    float _177 = in.m_64.x;
    float _179 = in.m_64.y;
    float _181 = in.m_64.z;
    float _183 = in.m_66.x;
    float _185 = _165 * _165;
    float _187 = _167 * _167;
    float _189 = _169 * _169;
    float _191 = fma(_171, _171, _185);
    float _193 = fma(_173, _173, _187);
    float _195 = fma(_175, _175, _189);
    float _197 = fma(_177, _177, _191);
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = sqrt(_197);
    float _205 = sqrt(_199);
    float _207 = sqrt(_201);
    bool _209 = _203 > 0.0;
    bool _211 = _205 > 0.0;
    float _213 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _215 = _197;
    float _217 = _213;
    float _219 = _165;
    if (_209)
    {
        float _221 = rsqrt(_197);
        _215 = _221;
    }
    float _223 = _215;
    float _225 = 0.0;
    if (!_209)
    {
        _225 = 0.0;
    }
    float _227 = _225;
    bool _229 = _207 > 0.0;
    float _231 = _213 * _183;
    float _233 = 0.0;
    float _235 = _227;
    if (!_209)
    {
        _233 = 0.0;
    }
    float _237 = _233;
    float _239 = 0.0;
    float _241 = _237;
    if (!_209)
    {
        _239 = 0.0;
    }
    float _243 = _239;
    float _245 = 0.0;
    float _247 = _243;
    if (_211)
    {
        float _249 = rsqrt(_199);
        _245 = _249;
    }
    float _251 = _245;
    float _253 = 0.0;
    if (!_211)
    {
        _253 = 0.0;
    }
    float _255 = _253;
    float _257 = 0.0;
    float _259 = _255;
    if (!_211)
    {
        _257 = 0.0;
    }
    float _261 = _257;
    float _263 = 0.0;
    float _265 = _261;
    if (!_211)
    {
        _263 = 0.0;
    }
    float _267 = _263;
    float _269 = _203;
    float _271 = _267;
    if (_229)
    {
        float _273 = rsqrt(_201);
        _269 = _273;
    }
    float _275 = _269;
    float _277 = _223;
    if (_209)
    {
        float _279 = _223 * _171;
        _235 = _279;
    }
    float _281 = _235;
    if (_209)
    {
        float _283 = _223 * _165;
        _241 = _283;
    }
    float _285 = _241;
    if (_209)
    {
        float _287 = _223 * _177;
        _247 = _287;
    }
    float _289 = _247;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = 0.0;
    if (!_229)
    {
        _293 = 0.0;
    }
    float _295 = _293;
    float _297 = trunc(_231);
    int _299 = int(_297);
    float _301 = _295;
    if (!_229)
    {
        _217 = 0.0;
    }
    float _303 = _217;
    float _305 = _303;
    if (_211)
    {
        float _307 = _251 * _173;
        _259 = _307;
    }
    float _309 = _259;
    if (!_229)
    {
        _277 = 0.0;
    }
    float _311 = _277;
    float _313 = _311;
    if (_211)
    {
        float _315 = _251 * _167;
        _265 = _315;
    }
    float _317 = _265;
    if (_211)
    {
        float _319 = _251 * _179;
        _271 = _319;
    }
    float _321 = _271;
    if (_229)
    {
        float _323 = _275 * _175;
        _301 = _323;
    }
    float _325 = _301;
    if (_229)
    {
        float _327 = _275 * _169;
        _305 = _327;
    }
    float _329 = _305;
    if (_229)
    {
        float _331 = _275 * _181;
        _313 = _331;
    }
    float _333 = _313;
    int _335 = _299 << 4;
    int _337 = _335 + 1712;
    bool _339 = !_291;
    float _355;
    if (!_339)
    {
        float _341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _343 = _183 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _345 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _347 = _345 * _341;
        float _349 = floor(_347);
        float _351 = -_349;
        float _353 = _347 + _351;
        _355 = _353;
        _357 = true;
    }
    else
    {
        float _359 = float(_111);
        float _361 = 1.0 / _359;
        float _363 = _145 * _361;
        _355 = _363;
    }
    _357 = false;
    float _365 = _355;
    float _367 = in.m_68.w;
    float _369 = in.m_70.x;
    float _371 = in.m_70.y;
    float _373 = in.m_70.z;
    float _375 = in.m_62.w;
    float _377 = trunc(_367);
    int _379 = int(_377);
    int _381 = _379 << 5;
    uint _384 = uint(int(uint(_381) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_384)];
    float _386 = as_type<float>(_dmw0.x);
    int _388 = _381 + 4;
    uint _390 = uint(int(uint(_388) >> uint(2)));
    float _392 = as_type<float>(_dmw0.y);
    int _394 = _381 + 8;
    uint _396 = uint(int(uint(_394) >> uint(2)));
    float _398 = as_type<float>(_dmw0.z);
    int _400 = _381 + 12;
    uint _402 = uint(int(uint(_400) >> uint(2)));
    float _404 = as_type<float>(_dmw0.w);
    float _406 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _408 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _410 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _406);
    float _412 = in.m_53.x;
    float _414 = in.m_53.y;
    float _416 = in.m_53.z;
    float _418 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _408);
    float _420 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _410);
    float _422 = in.m_72.x;
    float _424 = in.m_72.y;
    float _426 = in.m_72.z;
    float _428 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _430 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _418);
    float _432 = rsqrt(_420);
    float _434 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _428);
    float _436 = in.m_64.w;
    float _438 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _434);
    float _440 = rsqrt(_430);
    float _442 = rsqrt(_438);
    float _444 = _173 * _414;
    float _446 = _179 * _414;
    float _448 = _432 * _369;
    float _450 = _424 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _452 = fma(_171, _412, _444);
    float _454 = fma(_177, _412, _446);
    float _456 = _422 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _458 = _440 * _371;
    float _460 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _462 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _448);
    float _464 = _456 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _466 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _458);
    float _468 = _426 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _470 = fma(_181, _416, _454);
    float _472 = _464 * _462;
    float _474 = _442 * _373;
    float _476 = _460 * _466;
    float _478 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _480 = fma(_175, _416, _452);
    float _482 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _474);
    float _484 = _476 * _321;
    float _486 = _476 * _309;
    float _488 = _470 + _436;
    float _490 = _478 * _482;
    float _492 = fma(_472, _289, _484);
    float _494 = fma(_472, _281, _486);
    float _496 = _480 + _375;
    float _498 = _167 * _414;
    float _500 = fma(_490, _333, _492);
    float _502 = fma(_490, _325, _494);
    float _504 = in.m_60.w;
    float _506 = fma(_165, _412, _498);
    float _508 = _488 + _500;
    float _510 = _496 + _502;
    float _512 = _476 * _317;
    float _514 = fma(_169, _416, _506);
    float _516 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _518 = _508 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _522 = _510 + _520;
    float _524 = fma(_472, _285, _512);
    float _526 = _518 * _518;
    float _528 = fma(_490, _329, _524);
    float _530 = fma(_522, _522, _526);
    float _532 = sqrt(_530);
    bool _534 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _536 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.5);
    bool _542 = _538 || _540;
    float _544 = _514 + _504;
    float _546 = _544 + _528;
    bool _548 = _532 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _550 = _365;
    if (!_548)
    {
        _219 = _508;
    }
    float _552 = _219;
    float _554 = _404 * 2.0;
    float _556 = _386 * 2.0;
    float _558 = _392 * 2.0;
    float _560 = _392 * _392;
    float _562 = _398 * _554;
    float _564 = _386 * _554;
    float _566 = _392 * _554;
    float _568 = _398 * _398;
    float _570 = -_562;
    float _572 = fma(_392, _556, _570);
    float _574 = fma(_392, _556, _562);
    float _576 = fma(_398, _556, _566);
    float _578 = -_564;
    float _580 = fma(_398, _558, _578);
    float _582 = -_566;
    float _584 = fma(_398, _556, _582);
    float _586 = fma(_398, _558, _564);
    float _588 = _386 * _386;
    float _590 = _392;
    float _592 = _564;
    float _594 = _552;
    if (!_548)
    {
        _590 = _510;
    }
    float _596 = _590;
    float _598 = _596;
    if (!_548)
    {
        _592 = _546;
    }
    float _600 = _592;
    bool _602 = !_548;
    float _604 = _600;
    if (!_602)
    {
        float _606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _608 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _610 = _532 + _608;
        float _612 = _546 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _614 = rsqrt(_530);
        float _616 = _610 * _606;
        float _618 = _616 * 0.15915493667125701904296875;
        float _620 = _618 * 6.283185482025146484375;
        float _622 = cos(_620);
        float _624 = _618 * 6.283185482025146484375;
        float _626 = sin(_624);
        float _628 = _622 + (-1.0);
        float _630 = _628 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _632 = fma(_626, _612, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _634 = fma(_546, _622, _630);
        float _636 = _614 * _632;
        float _638 = fma(_522, _636, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _640 = fma(_518, _636, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _604 = _634;
        _598 = _638;
        _594 = _640;
    }
    float _642 = _604;
    float _644 = _598;
    float _646 = _594;
    float _648 = -_544;
    float _650 = _648 + _642;
    float _652 = -_496;
    float _654 = _652 + _644;
    float _656 = fma(_560, -2.0, 1.0);
    float _658 = -_488;
    float _660 = _658 + _646;
    float _662 = _650 * _317;
    float _664 = _650 * _285;
    float _666 = fma(_588, -2.0, 1.0);
    float _668 = _650 * _329;
    float _670 = fma(_654, _309, _662);
    float _672 = fma(_568, -2.0, _656);
    float _674 = fma(_654, _281, _664);
    float _676 = fma(_568, -2.0, _666);
    float _678 = fma(_660, _321, _670);
    float _680 = fma(_654, _325, _668);
    float _682 = fma(_660, _289, _674);
    float _684 = fma(_560, -2.0, _666);
    float _686 = _678 * _572;
    float _688 = _678 * _676;
    float _690 = _678 * _586;
    float _692 = fma(_660, _333, _680);
    float _694 = fma(_682, _672, _686);
    float _696 = fma(_682, _574, _688);
    float _698 = fma(_682, _584, _690);
    float _700 = fma(_692, _576, _694);
    float _702 = fma(_692, _580, _696);
    float _704 = fma(_692, _684, _698);
    float _706 = _496 + _700;
    float _708 = _544 + _702;
    float _710 = _488 + _704;
    float _712 = _708;
    float _714 = _706;
    float _716 = _710;
    float _718 = _704;
    if (!_542)
    {
        float _720 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _722 = _544 + _720;
        float _724 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _726 = _496 + _724;
        float _728 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _730 = _722 * _722;
        float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _734 = _488 + _732;
        float _736 = fma(_726, _726, _730);
        float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _740 = fma(_734, _734, _736);
        float _742 = sqrt(_740);
        float _744 = _728 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _746 = precise::min(_742, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _748 = _746 * _738;
        float _750 = _744 * _748;
        float _752 = fma(_700, _750, _496);
        float _754 = fma(_702, _750, _544);
        float _756 = fma(_704, _750, _488);
        _712 = _754;
        _714 = _752;
        _716 = _756;
    }
    float _758 = _712;
    float _760 = _714;
    float _762 = _716;
    float _764 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _766 = _758 + _764;
    float _768 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _770 = _760 + _768;
    float _772 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _774 = _762 + _772;
    float _776 = _766 * _766;
    float _778 = fma(_770, _770, _776);
    float _780 = fma(_774, _774, _778);
    float _782 = rsqrt(_780);
    float _784 = sqrt(_780);
    float _786 = _782 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _788 = _770 * _786;
    float _790 = _774 * _786;
    float _792 = _788 * _788;
    float _794 = _790 * _790;
    float _796 = _792 + _794;
    float _798 = sqrt(_796);
    bool _800 = _798 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _802 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _804 = _798 + _802;
    float _806 = _774;
    float _808 = _776;
    float _810 = _804;
    float _812 = _766;
    if (_800)
    {
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _806 = _814;
    }
    float _816 = _806;
    if (_800)
    {
        float _818 = rsqrt(_796);
        _808 = _818;
    }
    float _820 = _808;
    float _822 = _820;
    if (_800)
    {
        float _824 = _804 * _816;
        _810 = _824;
    }
    float _826 = _810;
    if (_800)
    {
        float _828 = _826 * 0.15915493667125701904296875;
        _718 = _828;
    }
    float _830 = _718;
    float _832 = _782;
    if (_800)
    {
        float _834 = _830 * 6.283185482025146484375;
        float _836 = sin(_834);
        _832 = _836;
    }
    float _838 = _832;
    float _840 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _842 = precise::max(0.0, _840);
    float _844 = _702;
    float _846 = _842;
    float _848 = _840;
    if (_800)
    {
        float _850 = _830 * 6.283185482025146484375;
        float _852 = cos(_850);
        _844 = _852;
    }
    float _854 = _844;
    float _856 = -_786;
    float _858 = -_842;
    float _860 = fma(_766, _856, _858);
    if (!_800)
    {
        _812 = _788;
    }
    float _862 = _812;
    float _864 = _862;
    if (_800)
    {
        float _866 = _860 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _846 = _866;
    }
    float _868 = _846;
    float _870 = _838;
    float _872 = _868;
    if (_800)
    {
        float _874 = fma(_838, _868, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _870 = _874;
    }
    float _876 = _870;
    float _878 = _876;
    float _880 = _854;
    if (_800)
    {
        float _882 = _854 + (-1.0);
        _848 = _882;
    }
    float _884 = _848;
    float _886 = 0.0;
    float _888 = _884;
    if (_800)
    {
        float _890 = _820 * _876;
        _886 = _890;
    }
    float _892 = _886;
    if (!_800)
    {
        _822 = _860;
    }
    float _894 = _822;
    float _896 = _894;
    if (_800)
    {
        float _898 = _884 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _872 = _898;
    }
    float _900 = _872;
    if (_800)
    {
        float _902 = _788 * _892;
        _864 = _902;
    }
    float _904 = _864;
    if (!_800)
    {
        _888 = _790;
    }
    float _906 = _888;
    float _908 = _906;
    if (_800)
    {
        float _910 = _790 * _892;
        _908 = _910;
    }
    float _912 = _908;
    if (!_800)
    {
        _878 = _792;
    }
    float _914 = _878;
    float _916 = _914;
    if (_800)
    {
        float _918 = fma(_860, _854, _900);
        _896 = _918;
    }
    float _920 = _896;
    if (_800)
    {
        float _922 = _904 * _904;
        _916 = _922;
    }
    float _924 = _916;
    float _926 = _758 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_800)
    {
        _880 = _794;
    }
    float _928 = _880;
    float _930 = _928;
    if (_800)
    {
        float _932 = _912 * _912;
        _930 = _932;
    }
    float _934 = _930;
    float _936 = fma(_920, _920, _924);
    float _938 = fma(_496, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _940 = _758 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _942 = _936 + _934;
    float _944 = _758 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _946 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[1].x, _940);
    float _948 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[2].x, _926);
    float _950 = rsqrt(_942);
    float _952 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[0].x, _944);
    float _954 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[1].z, _946);
    float _956 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _958 = fma(_784, (*spvDescriptorSet0.vp_c15)._m0[23].w, _956);
    float _960 = precise::clamp(_958, 0.0, 1.0);
    float _962 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[2].z, _948);
    float _964 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[0].z, _952);
    float _966 = _954 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _968 = -_960;
    float _970 = _968 + 1.0;
    float _972 = _962 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _974 = _964 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _976 = _966 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _978 = _758 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _980 = floor(_938);
    float _982 = fma(_488, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[7].x, _976);
    float _986 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[3].x, _978);
    float _988 = _950 * _904;
    float _990 = _950 * _912;
    float _992 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[7].z, _984);
    float _994 = _950 * _920;
    float _996 = abs(_970);
    float _998 = log2(_996);
    float _1000 = _988 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1002 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[3].z, _986);
    float _1004 = -_1000;
    float _1006 = fma(_994, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1004);
    float _1008 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1010 = floor(_982);
    float _1012 = -_990;
    float _1014 = fma(_1012, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1006);
    float _1016 = _972 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1018 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[7].w, _992);
    float _1020 = fma(_1014, -0.5, 0.5);
    float _1022 = -_980;
    float _1024 = _938 + _1022;
    float _1026 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1028 = _998 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1030 = 1.0 / _1018;
    float _1032 = _966 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1034 = -_1016;
    float _1036 = fma(_1034, _1026, 1.0);
    float _1038 = _966 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1040 = fma(_1014, 0.5, 0.5);
    float _1042 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1032);
    float _1044 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1038);
    float _1046 = exp2(_1028);
    float _1048 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1042);
    float _1050 = fma(_1040, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1052 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1044);
    float _1054 = _994 + 1.0;
    float _1056 = -_1010;
    float _1058 = _982 + _1056;
    float _1060 = fma(_1040, _1050, -0.212114393711090087890625);
    float _1062 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1052);
    float _1064 = log2(_1036);
    float _1066 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1048);
    float _1068 = sqrt(_1020);
    float _1070 = -_994;
    float _1072 = fma(_1046, _1054, _1070);
    float _1074 = _1062 * _1030;
    float _1076 = _1066 * _1030;
    float2 _3418 = float2(_1024, _1058);
    float _1078 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3418, float2(0.0), isnan(_3418)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3418, float2(0.0), isnan(_3418)), level(0.0)).x;
    float _1080 = fma(_1040, _1060, 1.570728778839111328125);
    float _1082 = fma(_1074, 0.5, 0.5);
    float _1084 = fma(_1076, -0.5, 0.5);
    float _1086 = _1064 * 0.693147182464599609375;
    float _1088 = fma(_1072, 0.5, 0.5);
    float _1090 = _1086 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1092 = _1068 * 0.636619746685028076171875;
    float3 _3449 = float3(_1082, _1084, _1090);
    float _1094 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3449, float3(0.0), isnan(_3449)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3449, float3(0.0), isnan(_3449)), level(0.0)).x;
    float3 _3460 = float3(_1082, _1084, _1090);
    float4 _1097 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3460, float3(0.0), isnan(_3460)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3460, float3(0.0), isnan(_3460)), level(0.0)).xyzw;
    float _1099 = _1097.x;
    float _1101 = _1097.y;
    float _1103 = _1097.z;
    float _1105 = _1097.w;
    float _1107 = -_1080;
    float _1109 = fma(_1092, _1107, 1.0);
    float2 _3481 = float2(_1109, _1088);
    float3 _1113 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3481, float2(0.0), isnan(_3481)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3481, float2(0.0), isnan(_3481)), level(0.0)).xyz;
    float _1115 = _1113.x;
    float _1117 = _1113.y;
    float _1119 = _1113.z;
    float _1121 = _544 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1123 = _998 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1129 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1121);
    float _1131 = _544 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1135 = _1133 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1137 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1129);
    float _1139 = 1.0 / _1127;
    float _1141 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1131);
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1143;
    float _1147 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1149 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1141);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1155 = 1.0 / _1147;
    float _1157 = _1149 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1159 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1165 = _966 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1169 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1167);
    float _1171 = 1.0 / _1135;
    float _1173 = _1157 + _1147;
    float _1175 = _1153 * _1139;
    bool _1177 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1179 = isnan(_365);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1185 = _1181 || _1183;
    float _1187 = float(_1185);
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1191 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1189);
    bool _1193 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1195 = isnan(_365);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1201 = _1197 || _1199;
    float _1203 = float(_1201);
    float _1205 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1169);
    bool _1207 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1209 = isnan(_365);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = -_1187;
    float _1221 = _1219 + 1.0;
    float _1223 = _1173 * _1155;
    float _1225 = _1223 * 0.5;
    float _1227 = 1.0 / _1163;
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1231 = _365 + _1229;
    float _1233 = _1203 * _1221;
    float _1235 = -_1203;
    float _1237 = _1235 + 1.0;
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1241 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1239);
    float _1243 = -_1217;
    float _1245 = _1243 + 1.0;
    float _1247 = _1145 * _1171;
    float _1249 = _1217 * _1237;
    float _1251 = 1.0 / _1241;
    float _1253 = fma(_1247, _1231, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1255 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1257 = isnan(_365);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    uint _1267 = uint(int(uint(_337) >> uint(2)));
    uint _1269 = uint(int(uint(int(_1267)) >> uint(2)));
    int _1271 = int(_1267) & 3;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[int(_1269)][_1271];
    int _1275 = int(_1267) + 1;
    uint _1277 = uint(int(uint(_1275) >> uint(2)));
    int _1279 = _1275 & 3;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[int(_1277)][_1279];
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1283;
    bool _1287 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1289 = isnan(0.0);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1295 = _1291 || _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1299 = _365 + _1297;
    float _1301 = _1265 * _1245;
    float _1303 = _1285 * _1227;
    float _1305 = -_1265;
    float _1307 = _1305 + 1.0;
    bool _1309 = _458 != 0.0;
    bool _1311 = isnan(_458);
    bool _1313 = _1309 || _1311;
    bool _1315 = isnan(0.0);
    bool _1317 = _1313 || _1315;
    int _1319 = _337 + 8;
    uint _1321 = uint(int(uint(_1319) >> uint(2)));
    uint _1323 = uint(int(uint(int(_1321)) >> uint(2)));
    int _1325 = int(_1321) & 3;
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[int(_1323)][_1325];
    float _1329 = _1253 * _1301;
    float _1331 = exp2(_1123);
    bool _1333 = _448 == 0.0;
    bool _1335 = !_1317;
    bool _1337 = _1333 && _1335;
    float _1339 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1165);
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1343 = _1251 * _1341;
    float _1345 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1329);
    float _1347 = 0.0;
    float _1349 = _1301;
    if (_1295)
    {
        float _1351 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1347 = _1351;
    }
    float _1353 = _1347;
    float _1355 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1191);
    float _1357 = fma(_1175, _1299, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1359 = abs(_1343);
    float _1361 = log2(_1359);
    float _1363 = _496 + _1205;
    float _1365 = _488 + _1355;
    if (_1295)
    {
        float _1367 = precise::min(_1353, 20.0);
        _1349 = _1367;
    }
    float _1369 = _1349;
    float _1371 = in.m_74.x;
    float _1373 = in.m_74.y;
    float _1375 = in.m_74.z;
    float _1377 = -_1363;
    float _1379 = _1377 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1381 = -_1365;
    float _1383 = _1381 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1387 = _365 + _1385;
    bool _1389 = _474 == 0.0;
    bool _1391 = _1389 && _1337;
    float _1393 = fma(_1357, _1249, _1345);
    float _1395 = precise::min(_1363, _1379);
    float _1397 = fma(_1303, _1387, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1399 = precise::min(_1365, _1383);
    float _1401 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1339);
    float _1403 = fma(_1397, _1233, _1393);
    float _1405 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1407 = precise::min(_1395, _1399);
    float _1409 = -_1331;
    float _1411 = _1409 + 1.0;
    float _1413 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1403);
    bool _1415 = _1343 <= 8000.0;
    bool _1417 = isnan(_1343);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan(8000.0);
    bool _1423 = _1419 || _1421;
    float _1425 = float(_1423);
    float _1427 = exp2(_1405);
    float _1429 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_76.x = 1.0;
    out.m_76.y = 1.0;
    out.m_76.z = 1.0;
    float _1431 = _1413 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (!_1295)
    {
        _550 = 1.0;
    }
    float _1433 = _550;
    float _1435 = _1373;
    float _1437 = _1371;
    float _1439 = _1375;
    float _1441 = _1433;
    if (!_1391)
    {
        float _1443 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1373);
        _1435 = _1443;
    }
    float _1445 = _1435;
    float _1447 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1449 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (!_1391)
    {
        float _1451 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1371);
        _1437 = _1451;
    }
    float _1453 = _1437;
    float _1455 = _317 * _1445;
    float _1457 = _309 * _1445;
    float _1459 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1461 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1463 = _1327 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1465 = _321 * _1445;
    if (!_1391)
    {
        float _1467 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1375);
        _1439 = _1467;
    }
    float _1469 = _1439;
    float _1471 = fma(_1427, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1473 = precise::clamp(_1471, 0.0, 1.0);
    float _1475 = _1463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1477 = fma(_285, _1453, _1455);
    float _1479 = fma(_281, _1453, _1457);
    float _1481 = fma(_1473, -2.0, 3.0);
    float _1483 = _1473 * _1473;
    float _1485 = fma(_289, _1453, _1465);
    out.m_78.x = _1459;
    out.m_78.y = _1461;
    out.m_78.z = _1475;
    out.m_78.w = _1431;
    float _1487 = fma(_329, _1469, _1477);
    float _1489 = _1483 * _1481;
    float _1491 = fma(_325, _1469, _1479);
    float _1493 = in.m_80.x;
    float _1495 = fma(_333, _1469, _1485);
    float _1497 = -_1489;
    float _1499 = _1497 + 1.0;
    float _1501 = _1487 * _572;
    float _1503 = _1487 * _676;
    float _1505 = _1487 * _586;
    float _1507 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1489);
    float _1509 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1401);
    float _1511 = fma(_1491, _672, _1501);
    float _1513 = _1425 * _1507;
    float _1515 = _1509 + _1018;
    float _1517 = fma(_1491, _574, _1503);
    float _1519 = fma(_1491, _584, _1505);
    float _1521 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1523 = _1515 * 0.5;
    out.gl_Position.x = _1062;
    out.gl_Position.y = _1066;
    out.gl_Position.z = _1509;
    out.gl_Position.w = _1018;
    float _1525 = fma(_1495, _576, _1511);
    float _1527 = fma(_1495, _580, _1517);
    float _1529 = fma(_1495, _684, _1519);
    float _1531 = as_type<float>(_337);
    float _1533 = _1505;
    if (_1295)
    {
        float _1535 = 1.0 / _1369;
        _1531 = _1535;
    }
    float _1537 = _1531;
    bool _1539 = _784 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1541 = isnan(_784);
    bool _1543 = _1539 || _1541;
    bool _1545 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1547 = _1543 || _1545;
    out.m_82.x = _1525;
    out.m_82.y = _1527;
    out.m_82.z = _1529;
    out.m_84.z = _1523;
    out.m_84.w = _1018;
    float _1549 = -_1429;
    float _1551 = _1549 + 1.0;
    if (!_1547)
    {
        _1533 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1553 = _1533;
    float _1555 = _1553;
    float _1557 = _1553;
    if (_1295)
    {
        float _1559 = _1407 * _1537;
        float _1561 = precise::clamp(_1559, 0.0, 1.0);
        _1441 = _1561;
    }
    float _1563 = _1441;
    float _1565 = _1563 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1567 = -_1078;
    float _1569 = _1567 + 1.0;
    float _1571 = _1569 * _1521;
    float _1573 = precise::clamp(_1571, 0.0, 1.0);
    float _1575 = -_1573;
    float _1577 = fma(_1575, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1579 = _1577 * _1493;
    float _1581 = _1429 * _1094;
    float _1583 = _1105 * _1551;
    float _1585 = _1579 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1587 = _1105 * _1581;
    float _1589 = _1579;
    float _1591 = _1587;
    if (!_1547)
    {
        _1589 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1593 = _1589;
    out.m_86.x = _1585;
    float _1595 = _1119 * _1581;
    float _1597 = fma(_1115, _1587, _1099);
    float _1599 = fma(_1117, _1587, _1101);
    float _1601 = _1593;
    float _1603 = _1593;
    if (!_1547)
    {
        _1591 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1605 = _1591;
    float _1607 = fma(_1105, _1595, _1103);
    out.m_88.x = _1597;
    out.m_88.y = _1599;
    out.m_88.z = _1607;
    out.m_88.w = _1583;
    bool _1609 = !_1547;
    float _1611 = _1605;
    float _1613 = _1605;
    if (!_1609)
    {
        bool _1615 = _784 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1617 = isnan(_784);
        bool _1619 = _1615 || _1617;
        bool _1621 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1623 = _1619 || _1621;
        if (!_1623)
        {
            float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1627 = _784 + _1625;
            float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1631 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1629;
            float _1633 = 1.0 / _1631;
            float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1637 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1641 = _1639 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1643 = _1627 * _1633;
            float _1645 = precise::clamp(_1643, 0.0, 1.0);
            float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1649 = _1647 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1651 = fma(_1645, _1641, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1653 = fma(_1645, _1649, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1655 = fma(_1645, _1637, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1603 = _1655;
            _1557 = _1653;
            _1613 = _1651;
            _1657 = true;
        }
        else
        {
            bool _1659 = _784 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1661 = isnan(_784);
            bool _1663 = _1659 || _1661;
            bool _1665 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1667 = _1663 || _1665;
            if (!_1667)
            {
                _1555 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1669 = _1555;
            _1557 = _1669;
            if (!_1667)
            {
                _1601 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1671 = _1601;
            _1603 = _1671;
            if (!_1667)
            {
                _1611 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1673 = _1611;
            bool _1675 = !_1667;
            _1613 = _1673;
            if (!_1675)
            {
                bool _1677 = _784 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1679 = isnan(_784);
                bool _1681 = _1677 || _1679;
                bool _1683 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1685 = _1681 || _1683;
                if (!_1685)
                {
                    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1689 = _784 + _1687;
                    float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1693 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1691;
                    float _1695 = 1.0 / _1693;
                    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1705 = _1689 * _1695;
                    float _1707 = precise::clamp(_1705, 0.0, 1.0);
                    float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1711 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1713 = fma(_1707, _1703, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1715 = fma(_1707, _1711, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1717 = fma(_1707, _1699, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1603 = _1717;
                    _1557 = _1715;
                    _1613 = _1713;
                    _1657 = true;
                }
                else
                {
                    _1603 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1557 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1613 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1657 = false;
    float _1719 = _1603;
    float _1721 = _1557;
    float _1723 = _1613;
    float _1725 = _1719 * 0.586610972881317138671875;
    bool _1727 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1729 = _1565 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_56.x = 1.0;
    float _1731 = fma(_1721, 0.298911988735198974609375, _1725);
    out.m_86.w = _1729;
    float _1733 = fma(_1723, 0.114477999508380889892578125, _1731);
    out.m_90.x = 0.0;
    float _1735 = -_1733;
    float _1737 = _1735 + _1721;
    float _1739 = -_1733;
    float _1741 = _1739 + _1719;
    float _1743 = -_1733;
    float _1745 = _1743 + _1723;
    float _1747 = fma(_1737, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1733);
    float _1749 = fma(_1741, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1733);
    float _1751 = fma(_1745, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1733);
    out.m_92.x = _1747;
    out.m_92.y = _1749;
    out.m_92.z = _1751;
    if (!_1727)
    {
        return out;
    }
    float _1753 = -_758;
    float _1755 = _1753 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1757 = -_760;
    float _1759 = _1757 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1761 = -_762;
    float _1763 = _1761 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1765 = _1755 * _1755;
    float _1767 = fma(_1759, _1759, _1765);
    float _1769 = fma(_1763, _1763, _1767);
    float _1771 = sqrt(_1769);
    float _1773 = rsqrt(_1769);
    float _1775 = -_1771;
    float _1777 = _1775 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1779 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1781 = precise::clamp(_1779, 0.0, 1.0);
    float _1783 = _1759 * _1773;
    float _1785 = _1755 * _1773;
    float _1787 = abs(_1781);
    float _1789 = log2(_1787);
    float _1791 = _1763 * _1773;
    float _1793 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1795 = _1527 * _1785;
    float _1797 = -_1785;
    float _1799 = -_1793;
    float _1801 = fma(_1797, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1799);
    float _1803 = fma(_1525, _1783, _1795);
    float _1805 = -_1791;
    float _1807 = fma(_1805, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1801);
    float _1809 = fma(_1529, _1791, _1803);
    float _1811 = precise::clamp(_1809, 0.0, 1.0);
    float _1813 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1815 = _1807 + _1813;
    float _1817 = _1789 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1819 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1821 = precise::clamp(_1819, 0.0, 1.0);
    float _1823 = exp2(_1817);
    float _1825 = _1823 * _1821;
    float _1827 = _1811 * _1825;
    float _1829 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1831 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1833 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _1829;
    out.m_90.y = _1831;
    out.m_90.z = _1833;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1657 = false;
    bool _357 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_53.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_56.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1890 = as_type<float>(_127);
        out.gl_Position.z = _1890;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_58.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_141)
    {
        float _147 = float(_111);
        _121 = _147;
    }
    float _149 = _121;
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
        out.m_56.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _129 = as_type<int>(_161);
    }
    int _163 = _129;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1959 = as_type<float>(_163);
        out.gl_Position.z = _1959;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = in.m_60.x;
    float _167 = in.m_60.y;
    float _169 = in.m_60.z;
    float _171 = in.m_62.x;
    float _173 = in.m_62.y;
    float _175 = in.m_62.z;
    float _177 = in.m_64.x;
    float _179 = in.m_64.y;
    float _181 = in.m_64.z;
    float _183 = in.m_66.x;
    float _185 = _165 * _165;
    float _187 = _167 * _167;
    float _189 = _169 * _169;
    float _191 = fma(_171, _171, _185);
    float _193 = fma(_173, _173, _187);
    float _195 = fma(_175, _175, _189);
    float _197 = fma(_177, _177, _191);
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = sqrt(_197);
    float _205 = sqrt(_199);
    float _207 = sqrt(_201);
    bool _209 = _203 > 0.0;
    bool _211 = _205 > 0.0;
    float _213 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _215 = _197;
    float _217 = _213;
    float _219 = _165;
    if (_209)
    {
        float _221 = rsqrt(_197);
        _215 = _221;
    }
    float _223 = _215;
    float _225 = 0.0;
    if (!_209)
    {
        _225 = 0.0;
    }
    float _227 = _225;
    bool _229 = _207 > 0.0;
    float _231 = _213 * _183;
    float _233 = 0.0;
    float _235 = _227;
    if (!_209)
    {
        _233 = 0.0;
    }
    float _237 = _233;
    float _239 = 0.0;
    float _241 = _237;
    if (!_209)
    {
        _239 = 0.0;
    }
    float _243 = _239;
    float _245 = 0.0;
    float _247 = _243;
    if (_211)
    {
        float _249 = rsqrt(_199);
        _245 = _249;
    }
    float _251 = _245;
    float _253 = 0.0;
    if (!_211)
    {
        _253 = 0.0;
    }
    float _255 = _253;
    float _257 = 0.0;
    float _259 = _255;
    if (!_211)
    {
        _257 = 0.0;
    }
    float _261 = _257;
    float _263 = 0.0;
    float _265 = _261;
    if (!_211)
    {
        _263 = 0.0;
    }
    float _267 = _263;
    float _269 = _203;
    float _271 = _267;
    if (_229)
    {
        float _273 = rsqrt(_201);
        _269 = _273;
    }
    float _275 = _269;
    float _277 = _223;
    if (_209)
    {
        float _279 = _223 * _171;
        _235 = _279;
    }
    float _281 = _235;
    if (_209)
    {
        float _283 = _223 * _165;
        _241 = _283;
    }
    float _285 = _241;
    if (_209)
    {
        float _287 = _223 * _177;
        _247 = _287;
    }
    float _289 = _247;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = 0.0;
    if (!_229)
    {
        _293 = 0.0;
    }
    float _295 = _293;
    float _297 = trunc(_231);
    int _299 = int(_297);
    float _301 = _295;
    if (!_229)
    {
        _217 = 0.0;
    }
    float _303 = _217;
    float _305 = _303;
    if (_211)
    {
        float _307 = _251 * _173;
        _259 = _307;
    }
    float _309 = _259;
    if (!_229)
    {
        _277 = 0.0;
    }
    float _311 = _277;
    float _313 = _311;
    if (_211)
    {
        float _315 = _251 * _167;
        _265 = _315;
    }
    float _317 = _265;
    if (_211)
    {
        float _319 = _251 * _179;
        _271 = _319;
    }
    float _321 = _271;
    if (_229)
    {
        float _323 = _275 * _175;
        _301 = _323;
    }
    float _325 = _301;
    if (_229)
    {
        float _327 = _275 * _169;
        _305 = _327;
    }
    float _329 = _305;
    if (_229)
    {
        float _331 = _275 * _181;
        _313 = _331;
    }
    float _333 = _313;
    int _335 = _299 << 4;
    int _337 = _335 + 1712;
    bool _339 = !_291;
    float _355;
    if (!_339)
    {
        float _341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _343 = _183 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _345 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _347 = _345 * _341;
        float _349 = floor(_347);
        float _351 = -_349;
        float _353 = _347 + _351;
        _355 = _353;
        _357 = true;
    }
    else
    {
        float _359 = float(_111);
        float _361 = 1.0 / _359;
        float _363 = _145 * _361;
        _355 = _363;
    }
    _357 = false;
    float _365 = _355;
    float _367 = in.m_68.w;
    float _369 = in.m_70.x;
    float _371 = in.m_70.y;
    float _373 = in.m_70.z;
    float _375 = in.m_62.w;
    float _377 = trunc(_367);
    int _379 = int(_377);
    int _381 = _379 << 5;
    uint _384 = uint(int(uint(_381) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_384)];
    float _386 = as_type<float>(_dmw0.x);
    int _388 = _381 + 4;
    uint _390 = uint(int(uint(_388) >> uint(2)));
    float _392 = as_type<float>(_dmw0.y);
    int _394 = _381 + 8;
    uint _396 = uint(int(uint(_394) >> uint(2)));
    float _398 = as_type<float>(_dmw0.z);
    int _400 = _381 + 12;
    uint _402 = uint(int(uint(_400) >> uint(2)));
    float _404 = as_type<float>(_dmw0.w);
    float _406 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _408 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _410 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _406);
    float _412 = in.m_53.x;
    float _414 = in.m_53.y;
    float _416 = in.m_53.z;
    float _418 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _408);
    float _420 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _410);
    float _422 = in.m_72.x;
    float _424 = in.m_72.y;
    float _426 = in.m_72.z;
    float _428 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _430 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _418);
    float _432 = rsqrt(_420);
    float _434 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _428);
    float _436 = in.m_64.w;
    float _438 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _434);
    float _440 = rsqrt(_430);
    float _442 = rsqrt(_438);
    float _444 = _173 * _414;
    float _446 = _179 * _414;
    float _448 = _432 * _369;
    float _450 = _424 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _452 = fma(_171, _412, _444);
    float _454 = fma(_177, _412, _446);
    float _456 = _422 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _458 = _440 * _371;
    float _460 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _462 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _448);
    float _464 = _456 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _466 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _458);
    float _468 = _426 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _470 = fma(_181, _416, _454);
    float _472 = _464 * _462;
    float _474 = _442 * _373;
    float _476 = _460 * _466;
    float _478 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _480 = fma(_175, _416, _452);
    float _482 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _474);
    float _484 = _476 * _321;
    float _486 = _476 * _309;
    float _488 = _470 + _436;
    float _490 = _478 * _482;
    float _492 = fma(_472, _289, _484);
    float _494 = fma(_472, _281, _486);
    float _496 = _480 + _375;
    float _498 = _167 * _414;
    float _500 = fma(_490, _333, _492);
    float _502 = fma(_490, _325, _494);
    float _504 = in.m_60.w;
    float _506 = fma(_165, _412, _498);
    float _508 = _488 + _500;
    float _510 = _496 + _502;
    float _512 = _476 * _317;
    float _514 = fma(_169, _416, _506);
    float _516 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _518 = _508 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _522 = _510 + _520;
    float _524 = fma(_472, _285, _512);
    float _526 = _518 * _518;
    float _528 = fma(_490, _329, _524);
    float _530 = fma(_522, _522, _526);
    float _532 = sqrt(_530);
    bool _534 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _536 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.5);
    bool _542 = _538 || _540;
    float _544 = _514 + _504;
    float _546 = _544 + _528;
    bool _548 = _532 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _550 = _365;
    if (!_548)
    {
        _219 = _508;
    }
    float _552 = _219;
    float _554 = _404 * 2.0;
    float _556 = _386 * 2.0;
    float _558 = _392 * 2.0;
    float _560 = _392 * _392;
    float _562 = _398 * _554;
    float _564 = _386 * _554;
    float _566 = _392 * _554;
    float _568 = _398 * _398;
    float _570 = -_562;
    float _572 = fma(_392, _556, _570);
    float _574 = fma(_392, _556, _562);
    float _576 = fma(_398, _556, _566);
    float _578 = -_564;
    float _580 = fma(_398, _558, _578);
    float _582 = -_566;
    float _584 = fma(_398, _556, _582);
    float _586 = fma(_398, _558, _564);
    float _588 = _386 * _386;
    float _590 = _392;
    float _592 = _564;
    float _594 = _552;
    if (!_548)
    {
        _590 = _510;
    }
    float _596 = _590;
    float _598 = _596;
    if (!_548)
    {
        _592 = _546;
    }
    float _600 = _592;
    bool _602 = !_548;
    float _604 = _600;
    if (!_602)
    {
        float _606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _608 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _610 = _532 + _608;
        float _612 = _546 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _614 = rsqrt(_530);
        float _616 = _610 * _606;
        float _618 = _616 * 0.15915493667125701904296875;
        float _620 = _618 * 6.283185482025146484375;
        float _622 = cos(_620);
        float _624 = _618 * 6.283185482025146484375;
        float _626 = sin(_624);
        float _628 = _622 + (-1.0);
        float _630 = _628 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _632 = fma(_626, _612, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _634 = fma(_546, _622, _630);
        float _636 = _614 * _632;
        float _638 = fma(_522, _636, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _640 = fma(_518, _636, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _604 = _634;
        _598 = _638;
        _594 = _640;
    }
    float _642 = _604;
    float _644 = _598;
    float _646 = _594;
    float _648 = -_544;
    float _650 = _648 + _642;
    float _652 = -_496;
    float _654 = _652 + _644;
    float _656 = fma(_560, -2.0, 1.0);
    float _658 = -_488;
    float _660 = _658 + _646;
    float _662 = _650 * _317;
    float _664 = _650 * _285;
    float _666 = fma(_588, -2.0, 1.0);
    float _668 = _650 * _329;
    float _670 = fma(_654, _309, _662);
    float _672 = fma(_568, -2.0, _656);
    float _674 = fma(_654, _281, _664);
    float _676 = fma(_568, -2.0, _666);
    float _678 = fma(_660, _321, _670);
    float _680 = fma(_654, _325, _668);
    float _682 = fma(_660, _289, _674);
    float _684 = fma(_560, -2.0, _666);
    float _686 = _678 * _572;
    float _688 = _678 * _676;
    float _690 = _678 * _586;
    float _692 = fma(_660, _333, _680);
    float _694 = fma(_682, _672, _686);
    float _696 = fma(_682, _574, _688);
    float _698 = fma(_682, _584, _690);
    float _700 = fma(_692, _576, _694);
    float _702 = fma(_692, _580, _696);
    float _704 = fma(_692, _684, _698);
    float _706 = _496 + _700;
    float _708 = _544 + _702;
    float _710 = _488 + _704;
    float _712 = _708;
    float _714 = _706;
    float _716 = _710;
    float _718 = _704;
    if (!_542)
    {
        float _720 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _722 = _544 + _720;
        float _724 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _726 = _496 + _724;
        float _728 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _730 = _722 * _722;
        float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _734 = _488 + _732;
        float _736 = fma(_726, _726, _730);
        float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _740 = fma(_734, _734, _736);
        float _742 = sqrt(_740);
        float _744 = _728 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _746 = precise::min(_742, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _748 = _746 * _738;
        float _750 = _744 * _748;
        float _752 = fma(_700, _750, _496);
        float _754 = fma(_702, _750, _544);
        float _756 = fma(_704, _750, _488);
        _712 = _754;
        _714 = _752;
        _716 = _756;
    }
    float _758 = _712;
    float _760 = _714;
    float _762 = _716;
    float _764 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _766 = _758 + _764;
    float _768 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _770 = _760 + _768;
    float _772 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _774 = _762 + _772;
    float _776 = _766 * _766;
    float _778 = fma(_770, _770, _776);
    float _780 = fma(_774, _774, _778);
    float _782 = rsqrt(_780);
    float _784 = sqrt(_780);
    float _786 = _782 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _788 = _770 * _786;
    float _790 = _774 * _786;
    float _792 = _788 * _788;
    float _794 = _790 * _790;
    float _796 = _792 + _794;
    float _798 = sqrt(_796);
    bool _800 = _798 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _802 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _804 = _798 + _802;
    float _806 = _774;
    float _808 = _776;
    float _810 = _804;
    float _812 = _766;
    if (_800)
    {
        float _814 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _806 = _814;
    }
    float _816 = _806;
    if (_800)
    {
        float _818 = rsqrt(_796);
        _808 = _818;
    }
    float _820 = _808;
    float _822 = _820;
    if (_800)
    {
        float _824 = _804 * _816;
        _810 = _824;
    }
    float _826 = _810;
    if (_800)
    {
        float _828 = _826 * 0.15915493667125701904296875;
        _718 = _828;
    }
    float _830 = _718;
    float _832 = _782;
    if (_800)
    {
        float _834 = _830 * 6.283185482025146484375;
        float _836 = sin(_834);
        _832 = _836;
    }
    float _838 = _832;
    float _840 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _842 = precise::max(0.0, _840);
    float _844 = _702;
    float _846 = _842;
    float _848 = _840;
    if (_800)
    {
        float _850 = _830 * 6.283185482025146484375;
        float _852 = cos(_850);
        _844 = _852;
    }
    float _854 = _844;
    float _856 = -_786;
    float _858 = -_842;
    float _860 = fma(_766, _856, _858);
    if (!_800)
    {
        _812 = _788;
    }
    float _862 = _812;
    float _864 = _862;
    if (_800)
    {
        float _866 = _860 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _846 = _866;
    }
    float _868 = _846;
    float _870 = _838;
    float _872 = _868;
    if (_800)
    {
        float _874 = fma(_838, _868, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _870 = _874;
    }
    float _876 = _870;
    float _878 = _876;
    float _880 = _854;
    if (_800)
    {
        float _882 = _854 + (-1.0);
        _848 = _882;
    }
    float _884 = _848;
    float _886 = 0.0;
    float _888 = _884;
    if (_800)
    {
        float _890 = _820 * _876;
        _886 = _890;
    }
    float _892 = _886;
    if (!_800)
    {
        _822 = _860;
    }
    float _894 = _822;
    float _896 = _894;
    if (_800)
    {
        float _898 = _884 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _872 = _898;
    }
    float _900 = _872;
    if (_800)
    {
        float _902 = _788 * _892;
        _864 = _902;
    }
    float _904 = _864;
    if (!_800)
    {
        _888 = _790;
    }
    float _906 = _888;
    float _908 = _906;
    if (_800)
    {
        float _910 = _790 * _892;
        _908 = _910;
    }
    float _912 = _908;
    if (!_800)
    {
        _878 = _792;
    }
    float _914 = _878;
    float _916 = _914;
    if (_800)
    {
        float _918 = fma(_860, _854, _900);
        _896 = _918;
    }
    float _920 = _896;
    if (_800)
    {
        float _922 = _904 * _904;
        _916 = _922;
    }
    float _924 = _916;
    float _926 = _758 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_800)
    {
        _880 = _794;
    }
    float _928 = _880;
    float _930 = _928;
    if (_800)
    {
        float _932 = _912 * _912;
        _930 = _932;
    }
    float _934 = _930;
    float _936 = fma(_920, _920, _924);
    float _938 = fma(_496, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _940 = _758 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _942 = _936 + _934;
    float _944 = _758 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _946 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[1].x, _940);
    float _948 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[2].x, _926);
    float _950 = rsqrt(_942);
    float _952 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[0].x, _944);
    float _954 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[1].z, _946);
    float _956 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _958 = fma(_784, (*spvDescriptorSet0.vp_c15)._m0[23].w, _956);
    float _960 = precise::clamp(_958, 0.0, 1.0);
    float _962 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[2].z, _948);
    float _964 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[0].z, _952);
    float _966 = _954 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _968 = -_960;
    float _970 = _968 + 1.0;
    float _972 = _962 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _974 = _964 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _976 = _966 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _978 = _758 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _980 = floor(_938);
    float _982 = fma(_488, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[7].x, _976);
    float _986 = fma(_760, (*spvDescriptorSet0.vp_c8)._m0[3].x, _978);
    float _988 = _950 * _904;
    float _990 = _950 * _912;
    float _992 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[7].z, _984);
    float _994 = _950 * _920;
    float _996 = abs(_970);
    float _998 = log2(_996);
    float _1000 = _988 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1002 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[3].z, _986);
    float _1004 = -_1000;
    float _1006 = fma(_994, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1004);
    float _1008 = _1002 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1010 = floor(_982);
    float _1012 = -_990;
    float _1014 = fma(_1012, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1006);
    float _1016 = _972 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1018 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[7].w, _992);
    float _1020 = fma(_1014, -0.5, 0.5);
    float _1022 = -_980;
    float _1024 = _938 + _1022;
    float _1026 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1028 = _998 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1030 = 1.0 / _1018;
    float _1032 = _966 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1034 = -_1016;
    float _1036 = fma(_1034, _1026, 1.0);
    float _1038 = _966 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1040 = fma(_1014, 0.5, 0.5);
    float _1042 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1032);
    float _1044 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1038);
    float _1046 = exp2(_1028);
    float _1048 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1042);
    float _1050 = fma(_1040, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1052 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1044);
    float _1054 = _994 + 1.0;
    float _1056 = -_1010;
    float _1058 = _982 + _1056;
    float _1060 = fma(_1040, _1050, -0.212114393711090087890625);
    float _1062 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1052);
    float _1064 = log2(_1036);
    float _1066 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1048);
    float _1068 = sqrt(_1020);
    float _1070 = -_994;
    float _1072 = fma(_1046, _1054, _1070);
    float _1074 = _1062 * _1030;
    float _1076 = _1066 * _1030;
    float2 _3418 = float2(_1024, _1058);
    float _1078 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3418, float2(0.0), isnan(_3418)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3418, float2(0.0), isnan(_3418)), level(0.0)).x;
    float _1080 = fma(_1040, _1060, 1.570728778839111328125);
    float _1082 = fma(_1074, 0.5, 0.5);
    float _1084 = fma(_1076, -0.5, 0.5);
    float _1086 = _1064 * 0.693147182464599609375;
    float _1088 = fma(_1072, 0.5, 0.5);
    float _1090 = _1086 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1092 = _1068 * 0.636619746685028076171875;
    float3 _3449 = float3(_1082, _1084, _1090);
    float _1094 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3449, float3(0.0), isnan(_3449)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3449, float3(0.0), isnan(_3449)), level(0.0)).x;
    float3 _3460 = float3(_1082, _1084, _1090);
    float4 _1097 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3460, float3(0.0), isnan(_3460)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3460, float3(0.0), isnan(_3460)), level(0.0)).xyzw;
    float _1099 = _1097.x;
    float _1101 = _1097.y;
    float _1103 = _1097.z;
    float _1105 = _1097.w;
    float _1107 = -_1080;
    float _1109 = fma(_1092, _1107, 1.0);
    float2 _3481 = float2(_1109, _1088);
    float3 _1113 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3481, float2(0.0), isnan(_3481)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3481, float2(0.0), isnan(_3481)), level(0.0)).xyz;
    float _1115 = _1113.x;
    float _1117 = _1113.y;
    float _1119 = _1113.z;
    float _1121 = _544 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1123 = _998 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1129 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1121);
    float _1131 = _544 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1135 = _1133 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1137 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1129);
    float _1139 = 1.0 / _1127;
    float _1141 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1131);
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1143;
    float _1147 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1149 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1141);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1155 = 1.0 / _1147;
    float _1157 = _1149 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1159 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1161 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1163 = _1161 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1165 = _966 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1169 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1167);
    float _1171 = 1.0 / _1135;
    float _1173 = _1157 + _1147;
    float _1175 = _1153 * _1139;
    bool _1177 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1179 = isnan(_365);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1185 = _1181 || _1183;
    float _1187 = float(_1185);
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1191 = fma(_1159, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1189);
    bool _1193 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1195 = isnan(_365);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1201 = _1197 || _1199;
    float _1203 = float(_1201);
    float _1205 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1169);
    bool _1207 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1209 = isnan(_365);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1215 = _1211 || _1213;
    float _1217 = float(_1215);
    float _1219 = -_1187;
    float _1221 = _1219 + 1.0;
    float _1223 = _1173 * _1155;
    float _1225 = _1223 * 0.5;
    float _1227 = 1.0 / _1163;
    float _1229 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1231 = _365 + _1229;
    float _1233 = _1203 * _1221;
    float _1235 = -_1203;
    float _1237 = _1235 + 1.0;
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1241 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1239);
    float _1243 = -_1217;
    float _1245 = _1243 + 1.0;
    float _1247 = _1145 * _1171;
    float _1249 = _1217 * _1237;
    float _1251 = 1.0 / _1241;
    float _1253 = fma(_1247, _1231, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1255 = _365 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1257 = isnan(_365);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    uint _1267 = uint(int(uint(_337) >> uint(2)));
    uint _1269 = uint(int(uint(int(_1267)) >> uint(2)));
    int _1271 = int(_1267) & 3;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[int(_1269)][_1271];
    int _1275 = int(_1267) + 1;
    uint _1277 = uint(int(uint(_1275) >> uint(2)));
    int _1279 = _1275 & 3;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[int(_1277)][_1279];
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1283;
    bool _1287 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1289 = isnan(0.0);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1295 = _1291 || _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1299 = _365 + _1297;
    float _1301 = _1265 * _1245;
    float _1303 = _1285 * _1227;
    float _1305 = -_1265;
    float _1307 = _1305 + 1.0;
    bool _1309 = _458 != 0.0;
    bool _1311 = isnan(_458);
    bool _1313 = _1309 || _1311;
    bool _1315 = isnan(0.0);
    bool _1317 = _1313 || _1315;
    int _1319 = _337 + 8;
    uint _1321 = uint(int(uint(_1319) >> uint(2)));
    uint _1323 = uint(int(uint(int(_1321)) >> uint(2)));
    int _1325 = int(_1321) & 3;
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[int(_1323)][_1325];
    float _1329 = _1253 * _1301;
    float _1331 = exp2(_1123);
    bool _1333 = _448 == 0.0;
    bool _1335 = !_1317;
    bool _1337 = _1333 && _1335;
    float _1339 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1165);
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1343 = _1251 * _1341;
    float _1345 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1329);
    float _1347 = 0.0;
    float _1349 = _1301;
    if (_1295)
    {
        float _1351 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1347 = _1351;
    }
    float _1353 = _1347;
    float _1355 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1191);
    float _1357 = fma(_1175, _1299, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1359 = abs(_1343);
    float _1361 = log2(_1359);
    float _1363 = _496 + _1205;
    float _1365 = _488 + _1355;
    if (_1295)
    {
        float _1367 = precise::min(_1353, 20.0);
        _1349 = _1367;
    }
    float _1369 = _1349;
    float _1371 = in.m_74.x;
    float _1373 = in.m_74.y;
    float _1375 = in.m_74.z;
    float _1377 = -_1363;
    float _1379 = _1377 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1381 = -_1365;
    float _1383 = _1381 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1387 = _365 + _1385;
    bool _1389 = _474 == 0.0;
    bool _1391 = _1389 && _1337;
    float _1393 = fma(_1357, _1249, _1345);
    float _1395 = precise::min(_1363, _1379);
    float _1397 = fma(_1303, _1387, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1399 = precise::min(_1365, _1383);
    float _1401 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1339);
    float _1403 = fma(_1397, _1233, _1393);
    float _1405 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1407 = precise::min(_1395, _1399);
    float _1409 = -_1331;
    float _1411 = _1409 + 1.0;
    float _1413 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1403);
    bool _1415 = _1343 <= 8000.0;
    bool _1417 = isnan(_1343);
    bool _1419 = _1415 || _1417;
    bool _1421 = isnan(8000.0);
    bool _1423 = _1419 || _1421;
    float _1425 = float(_1423);
    float _1427 = exp2(_1405);
    float _1429 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_76.x = 1.0;
    out.m_76.y = 1.0;
    out.m_76.z = 1.0;
    float _1431 = _1413 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (!_1295)
    {
        _550 = 1.0;
    }
    float _1433 = _550;
    float _1435 = _1373;
    float _1437 = _1371;
    float _1439 = _1375;
    float _1441 = _1433;
    if (!_1391)
    {
        float _1443 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1373);
        _1435 = _1443;
    }
    float _1445 = _1435;
    float _1447 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1449 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    if (!_1391)
    {
        float _1451 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1371);
        _1437 = _1451;
    }
    float _1453 = _1437;
    float _1455 = _317 * _1445;
    float _1457 = _309 * _1445;
    float _1459 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1461 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1463 = _1327 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1465 = _321 * _1445;
    if (!_1391)
    {
        float _1467 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1375);
        _1439 = _1467;
    }
    float _1469 = _1439;
    float _1471 = fma(_1427, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1473 = precise::clamp(_1471, 0.0, 1.0);
    float _1475 = _1463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1477 = fma(_285, _1453, _1455);
    float _1479 = fma(_281, _1453, _1457);
    float _1481 = fma(_1473, -2.0, 3.0);
    float _1483 = _1473 * _1473;
    float _1485 = fma(_289, _1453, _1465);
    out.m_78.x = _1459;
    out.m_78.y = _1461;
    out.m_78.z = _1475;
    out.m_78.w = _1431;
    float _1487 = fma(_329, _1469, _1477);
    float _1489 = _1483 * _1481;
    float _1491 = fma(_325, _1469, _1479);
    float _1493 = in.m_80.x;
    float _1495 = fma(_333, _1469, _1485);
    float _1497 = -_1489;
    float _1499 = _1497 + 1.0;
    float _1501 = _1487 * _572;
    float _1503 = _1487 * _676;
    float _1505 = _1487 * _586;
    float _1507 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1489);
    float _1509 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1401);
    float _1511 = fma(_1491, _672, _1501);
    float _1513 = _1425 * _1507;
    float _1515 = _1509 + _1018;
    float _1517 = fma(_1491, _574, _1503);
    float _1519 = fma(_1491, _584, _1505);
    float _1521 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1523 = _1515 * 0.5;
    out.gl_Position.x = _1062;
    out.gl_Position.y = _1066;
    out.gl_Position.z = _1509;
    out.gl_Position.w = _1018;
    float _1525 = fma(_1495, _576, _1511);
    float _1527 = fma(_1495, _580, _1517);
    float _1529 = fma(_1495, _684, _1519);
    float _1531 = as_type<float>(_337);
    float _1533 = _1505;
    if (_1295)
    {
        float _1535 = 1.0 / _1369;
        _1531 = _1535;
    }
    float _1537 = _1531;
    bool _1539 = _784 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1541 = isnan(_784);
    bool _1543 = _1539 || _1541;
    bool _1545 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1547 = _1543 || _1545;
    out.m_82.x = _1525;
    out.m_82.y = _1527;
    out.m_82.z = _1529;
    out.m_84.z = _1523;
    out.m_84.w = _1018;
    float _1549 = -_1429;
    float _1551 = _1549 + 1.0;
    if (!_1547)
    {
        _1533 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1553 = _1533;
    float _1555 = _1553;
    float _1557 = _1553;
    if (_1295)
    {
        float _1559 = _1407 * _1537;
        float _1561 = precise::clamp(_1559, 0.0, 1.0);
        _1441 = _1561;
    }
    float _1563 = _1441;
    float _1565 = _1563 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1567 = -_1078;
    float _1569 = _1567 + 1.0;
    float _1571 = _1569 * _1521;
    float _1573 = precise::clamp(_1571, 0.0, 1.0);
    float _1575 = -_1573;
    float _1577 = fma(_1575, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1579 = _1577 * _1493;
    float _1581 = _1429 * _1094;
    float _1583 = _1105 * _1551;
    float _1585 = _1579 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1587 = _1105 * _1581;
    float _1589 = _1579;
    float _1591 = _1587;
    if (!_1547)
    {
        _1589 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1593 = _1589;
    out.m_86.x = _1585;
    float _1595 = _1119 * _1581;
    float _1597 = fma(_1115, _1587, _1099);
    float _1599 = fma(_1117, _1587, _1101);
    float _1601 = _1593;
    float _1603 = _1593;
    if (!_1547)
    {
        _1591 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1605 = _1591;
    float _1607 = fma(_1105, _1595, _1103);
    out.m_88.x = _1597;
    out.m_88.y = _1599;
    out.m_88.z = _1607;
    out.m_88.w = _1583;
    bool _1609 = !_1547;
    float _1611 = _1605;
    float _1613 = _1605;
    if (!_1609)
    {
        bool _1615 = _784 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1617 = isnan(_784);
        bool _1619 = _1615 || _1617;
        bool _1621 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1623 = _1619 || _1621;
        if (!_1623)
        {
            float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1627 = _784 + _1625;
            float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1631 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1629;
            float _1633 = 1.0 / _1631;
            float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1637 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1641 = _1639 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1643 = _1627 * _1633;
            float _1645 = precise::clamp(_1643, 0.0, 1.0);
            float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1649 = _1647 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1651 = fma(_1645, _1641, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1653 = fma(_1645, _1649, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1655 = fma(_1645, _1637, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1603 = _1655;
            _1557 = _1653;
            _1613 = _1651;
            _1657 = true;
        }
        else
        {
            bool _1659 = _784 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1661 = isnan(_784);
            bool _1663 = _1659 || _1661;
            bool _1665 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1667 = _1663 || _1665;
            if (!_1667)
            {
                _1555 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1669 = _1555;
            _1557 = _1669;
            if (!_1667)
            {
                _1601 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1671 = _1601;
            _1603 = _1671;
            if (!_1667)
            {
                _1611 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1673 = _1611;
            bool _1675 = !_1667;
            _1613 = _1673;
            if (!_1675)
            {
                bool _1677 = _784 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1679 = isnan(_784);
                bool _1681 = _1677 || _1679;
                bool _1683 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1685 = _1681 || _1683;
                if (!_1685)
                {
                    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1689 = _784 + _1687;
                    float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1693 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1691;
                    float _1695 = 1.0 / _1693;
                    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1705 = _1689 * _1695;
                    float _1707 = precise::clamp(_1705, 0.0, 1.0);
                    float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1711 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1713 = fma(_1707, _1703, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1715 = fma(_1707, _1711, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1717 = fma(_1707, _1699, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1603 = _1717;
                    _1557 = _1715;
                    _1613 = _1713;
                    _1657 = true;
                }
                else
                {
                    _1603 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1557 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1613 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1657 = false;
    float _1719 = _1603;
    float _1721 = _1557;
    float _1723 = _1613;
    float _1725 = _1719 * 0.586610972881317138671875;
    bool _1727 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1729 = _1565 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_56.x = 1.0;
    float _1731 = fma(_1721, 0.298911988735198974609375, _1725);
    out.m_86.w = _1729;
    float _1733 = fma(_1723, 0.114477999508380889892578125, _1731);
    out.m_90.x = 0.0;
    float _1735 = -_1733;
    float _1737 = _1735 + _1721;
    float _1739 = -_1733;
    float _1741 = _1739 + _1719;
    float _1743 = -_1733;
    float _1745 = _1743 + _1723;
    float _1747 = fma(_1737, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1733);
    float _1749 = fma(_1741, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1733);
    float _1751 = fma(_1745, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1733);
    out.m_92.x = _1747;
    out.m_92.y = _1749;
    out.m_92.z = _1751;
    if (!_1727)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1753 = -_758;
    float _1755 = _1753 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1757 = -_760;
    float _1759 = _1757 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1761 = -_762;
    float _1763 = _1761 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1765 = _1755 * _1755;
    float _1767 = fma(_1759, _1759, _1765);
    float _1769 = fma(_1763, _1763, _1767);
    float _1771 = sqrt(_1769);
    float _1773 = rsqrt(_1769);
    float _1775 = -_1771;
    float _1777 = _1775 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1779 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1781 = precise::clamp(_1779, 0.0, 1.0);
    float _1783 = _1759 * _1773;
    float _1785 = _1755 * _1773;
    float _1787 = abs(_1781);
    float _1789 = log2(_1787);
    float _1791 = _1763 * _1773;
    float _1793 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1795 = _1527 * _1785;
    float _1797 = -_1785;
    float _1799 = -_1793;
    float _1801 = fma(_1797, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1799);
    float _1803 = fma(_1525, _1783, _1795);
    float _1805 = -_1791;
    float _1807 = fma(_1805, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1801);
    float _1809 = fma(_1529, _1791, _1803);
    float _1811 = precise::clamp(_1809, 0.0, 1.0);
    float _1813 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1815 = _1807 + _1813;
    float _1817 = _1789 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1819 = _1815 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1821 = precise::clamp(_1819, 0.0, 1.0);
    float _1823 = exp2(_1817);
    float _1825 = _1823 * _1821;
    float _1827 = _1811 * _1825;
    float _1829 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1831 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1833 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _1829;
    out.m_90.y = _1831;
    out.m_90.z = _1833;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

