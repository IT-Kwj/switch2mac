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
    float4 m_76 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_98 [[user(locn4)]];
    float4 m_56 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_96 [[user(locn10)]];
    float4 m_92 [[user(locn11)]];
    float4 m_94 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_84 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_66 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
    float4 m_64 [[attribute(7)]];
    float4 m_72 [[attribute(8)]];
    float4 m_68 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1673 = false;
    bool _205 = false;
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
        float _1958 = as_type<float>(_133);
        out.gl_Position.z = _1958;
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
        float _2027 = as_type<float>(_169);
        out.gl_Position.z = _2027;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = in.m_60.x;
    float _173 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _177 = _173 * _171;
    float _179 = trunc(_177);
    int _181 = int(_179);
    int _183 = _181 << 4;
    int _185 = _183 + 1712;
    bool _187 = !_175;
    float _203;
    if (!_187)
    {
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _191 = _171 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_117);
        float _209 = 1.0 / _207;
        float _211 = _151 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = in.m_62.w;
    float _217 = in.m_64.x;
    float _219 = in.m_64.y;
    float _221 = in.m_64.z;
    float _223 = in.m_66.x;
    float _225 = in.m_66.y;
    float _227 = in.m_66.z;
    float _229 = in.m_53.x;
    float _231 = in.m_53.y;
    float _233 = in.m_53.z;
    float _235 = trunc(_215);
    int _237 = int(_235);
    int _239 = _237 << 5;
    uint _242 = uint(int(uint(_239) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_242)];
    float _244 = as_type<float>(_dmw0.x);
    int _246 = _239 + 4;
    uint _248 = uint(int(uint(_246) >> uint(2)));
    float _250 = as_type<float>(_dmw0.y);
    int _252 = _239 + 8;
    uint _254 = uint(int(uint(_252) >> uint(2)));
    float _256 = as_type<float>(_dmw0.z);
    int _258 = _239 + 12;
    uint _260 = uint(int(uint(_258) >> uint(2)));
    float _262 = as_type<float>(_dmw0.w);
    float _264 = _217 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _266 = _219 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = _221 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _270 = _231 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _274 = _264 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _276 = _268 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _278 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[6].x, _270);
    float _280 = _272 * _274;
    float _282 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _284 = _266 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _286 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _227);
    float _288 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[6].z, _278);
    float _290 = _282 * _284;
    float _292 = _231 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _294 = _286 * _276;
    float _296 = _288 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _298 = _290 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _300 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[4].x, _292);
    float _302 = _290 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _304 = _231 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _306 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[10].x, _298);
    float _308 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[4].z, _300);
    float _310 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[8].x, _302);
    float _312 = _290 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _314 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[10].z, _306);
    float _316 = _308 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _318 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[8].z, _310);
    float _320 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[5].x, _304);
    float _322 = _296 + _314;
    float _324 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[9].x, _312);
    float _326 = _316 + _318;
    float _328 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[5].z, _320);
    float _330 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _332 = _322 + _330;
    float _334 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[9].z, _324);
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _338 = _326 + _336;
    float _340 = _328 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _342 = _332 * _332;
    float _344 = _340 + _334;
    float _346 = fma(_338, _338, _342);
    float _348 = sqrt(_346);
    bool _350 = _348 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _352 = _229;
    float _354 = _344;
    float _356 = _326;
    float _358 = _332;
    float _360 = _322;
    if (!_350)
    {
        _352 = _322;
    }
    float _362 = _352;
    float _364 = _262 * 2.0;
    float _366 = _250 * 2.0;
    float _368 = _244 * _364;
    float _370 = -_368;
    float _372 = fma(_256, _366, _370);
    float _374 = fma(_256, _366, _368);
    bool _376 = !_350;
    float _378 = _362;
    if (!_376)
    {
        float _380 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _382 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _384 = _348 + _382;
        float _386 = _344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _388 = rsqrt(_346);
        float _390 = _384 * _380;
        float _392 = _390 * 0.15915493667125701904296875;
        float _394 = _392 * 6.283185482025146484375;
        float _396 = cos(_394);
        float _398 = _392 * 6.283185482025146484375;
        float _400 = sin(_398);
        float _402 = _396 + (-1.0);
        float _404 = _402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _406 = fma(_400, _386, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _408 = fma(_344, _396, _404);
        float _410 = _388 * _406;
        float _412 = fma(_338, _410, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _414 = fma(_332, _410, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _354 = _408;
        _356 = _412;
        _378 = _414;
    }
    float _416 = _354;
    float _418 = _356;
    float _420 = _378;
    float _422 = -_340;
    float _424 = _422 + _416;
    float _426 = _244 * 2.0;
    float _428 = _244 * _244;
    float _430 = -_316;
    float _432 = _430 + _418;
    float _434 = _424 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _436 = _256 * _256;
    float _438 = fma(_428, -2.0, 1.0);
    float _440 = -_296;
    float _442 = _440 + _420;
    float _444 = _424 * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _446 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].y, _434);
    float _448 = _424 * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _450 = _256 * _364;
    float _452 = _250 * _250;
    float _454 = fma(_436, -2.0, _438);
    float _456 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].x, _444);
    float _458 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[6].y, _446);
    float _460 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].z, _448);
    float _462 = -_450;
    float _464 = fma(_250, _426, _462);
    float _466 = fma(_452, -2.0, 1.0);
    float _468 = fma(_250, _426, _450);
    float _470 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[6].x, _456);
    float _472 = _458 * _454;
    float _474 = _250 * _364;
    float _476 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[6].z, _460);
    float _478 = fma(_436, -2.0, _466);
    float _480 = _458 * _464;
    float _482 = fma(_470, _468, _472);
    float _484 = fma(_256, _426, _474);
    float _486 = -_474;
    float _488 = fma(_256, _426, _486);
    float _490 = _458 * _374;
    float _492 = fma(_470, _478, _480);
    float _494 = fma(_476, _372, _482);
    float _496 = fma(_452, -2.0, _438);
    float _498 = fma(_470, _488, _490);
    float _500 = fma(_476, _484, _492);
    float _502 = _340 + _494;
    float _504 = fma(_476, _496, _498);
    float _506 = _316 + _500;
    float _508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _510 = _502 + _508;
    float _512 = _296 + _504;
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _516 = _506 + _514;
    float _518 = _510 * _510;
    float _520 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _522 = _512 + _520;
    float _524 = fma(_516, _516, _518);
    float _526 = fma(_522, _522, _524);
    float _528 = rsqrt(_526);
    float _530 = sqrt(_526);
    float _532 = _528 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _534 = _516 * _532;
    float _536 = _522 * _532;
    float _538 = _534 * _534;
    float _540 = _536 * _536;
    float _542 = _538 + _540;
    float _544 = sqrt(_542);
    bool _546 = _544 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _548 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _550 = _544 + _548;
    float _552 = _528;
    float _554 = _542;
    float _556 = _550;
    float _558 = _426;
    float _560 = _532;
    if (_546)
    {
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _552 = _562;
    }
    float _564 = _552;
    if (_546)
    {
        float _566 = rsqrt(_542);
        _554 = _566;
    }
    float _568 = _554;
    float _570 = _568;
    if (_546)
    {
        float _572 = _550 * _564;
        _556 = _572;
    }
    float _574 = _556;
    if (_546)
    {
        float _576 = _574 * 0.15915493667125701904296875;
        _358 = _576;
    }
    float _578 = _358;
    float _580 = _564;
    float _582 = _578;
    if (_546)
    {
        float _584 = _578 * 6.283185482025146484375;
        float _586 = sin(_584);
        _580 = _586;
    }
    float _588 = _580;
    float _590 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _592 = precise::max(0.0, _590);
    float _594 = _522;
    if (_546)
    {
        float _596 = _578 * 6.283185482025146484375;
        float _598 = cos(_596);
        _594 = _598;
    }
    float _600 = _594;
    float _602 = -_532;
    float _604 = -_592;
    float _606 = fma(_510, _602, _604);
    if (_546)
    {
        float _608 = _606 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _558 = _608;
    }
    float _610 = _558;
    float _612 = _610;
    if (!_546)
    {
        _582 = _536;
    }
    float _614 = _582;
    float _616 = fma(_316, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _618 = _588;
    float _620 = _614;
    if (_546)
    {
        float _622 = fma(_588, _610, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _360 = _622;
    }
    float _624 = _360;
    float _626 = _624;
    if (!_546)
    {
        _618 = _534;
    }
    float _628 = _618;
    float _630 = floor(_616);
    float _632 = _628;
    float _634 = _600;
    if (_546)
    {
        float _636 = _600 + (-1.0);
        _612 = _636;
    }
    float _638 = _612;
    float _640 = 0.0;
    if (_546)
    {
        float _642 = _568 * _624;
        _640 = _642;
    }
    float _644 = _640;
    if (!_546)
    {
        _626 = _606;
    }
    float _646 = _626;
    float _648 = _646;
    if (_546)
    {
        float _650 = _638 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _560 = _650;
    }
    float _652 = _560;
    if (_546)
    {
        float _654 = _534 * _644;
        _632 = _654;
    }
    float _656 = _632;
    if (!_546)
    {
        _570 = _538;
    }
    float _658 = _570;
    float _660 = _658;
    if (_546)
    {
        float _662 = _536 * _644;
        _620 = _662;
    }
    float _664 = _620;
    if (_546)
    {
        float _666 = fma(_606, _600, _652);
        _648 = _666;
    }
    float _668 = _648;
    if (_546)
    {
        float _670 = _656 * _656;
        _660 = _670;
    }
    float _672 = _660;
    if (!_546)
    {
        _634 = _540;
    }
    float _674 = _634;
    float _676 = _674;
    if (_546)
    {
        float _678 = _664 * _664;
        _676 = _678;
    }
    float _680 = _676;
    float _682 = _502 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _684 = fma(_668, _668, _672);
    float _686 = _502 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _688 = _502 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _690 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[1].x, _682);
    float _692 = _684 + _680;
    float _694 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[2].x, _686);
    float _696 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[0].x, _688);
    float _698 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[1].z, _690);
    float _700 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _702 = fma(_530, (*spvDescriptorSet0.vp_c15)._m0[23].w, _700);
    float _704 = precise::clamp(_702, 0.0, 1.0);
    float _706 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[2].z, _694);
    float _708 = rsqrt(_692);
    float _710 = _502 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _712 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[0].z, _696);
    float _714 = _698 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _716 = _706 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _718 = -_704;
    float _720 = _718 + 1.0;
    float _722 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[3].x, _710);
    float _724 = _712 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _726 = _714 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _728 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _730 = _716 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _732 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[3].z, _722);
    float _734 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _726);
    float _736 = abs(_720);
    float _738 = log2(_736);
    float _740 = -_730;
    float _742 = fma(_740, _728, 1.0);
    float _744 = _732 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _746 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[7].z, _734);
    float _748 = _708 * _656;
    float _750 = _708 * _664;
    float _752 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[7].w, _746);
    float _754 = _708 * _668;
    float _756 = _748 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _758 = fma(_296, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _760 = -_630;
    float _762 = _616 + _760;
    float _764 = _714 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _766 = -_756;
    float _768 = fma(_754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _766);
    float _770 = floor(_758);
    float _772 = _714 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _774 = _738 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _776 = -_750;
    float _778 = fma(_776, (*spvDescriptorSet0.vp_c15)._m0[21].z, _768);
    float _780 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _764);
    float _782 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _772);
    float _784 = fma(_778, -0.5, 0.5);
    float _786 = exp2(_774);
    float _788 = fma(_778, 0.5, 0.5);
    float _790 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[4].z, _780);
    float _792 = fma(_788, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _794 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[4].w, _790);
    float _796 = log2(_742);
    float _798 = -_770;
    float _800 = _758 + _798;
    float _802 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[5].z, _782);
    float _804 = _754 + 1.0;
    float _806 = fma(_788, _792, -0.212114393711090087890625);
    float _808 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[5].w, _802);
    float _810 = 1.0 / _752;
    float _812 = -_754;
    float _814 = fma(_786, _804, _812);
    float _816 = fma(_788, _806, 1.570728778839111328125);
    float _818 = fma(_814, 0.5, 0.5);
    float _820 = sqrt(_784);
    float _822 = _796 * 0.693147182464599609375;
    float2 _3128 = float2(_762, _800);
    float _824 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3128, float2(0.0), isnan(_3128)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3128, float2(0.0), isnan(_3128)), level(0.0)).x;
    float _826 = _822 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _828 = _794 * _810;
    float _830 = _808 * _810;
    float _832 = fma(_828, 0.5, 0.5);
    float _834 = fma(_830, -0.5, 0.5);
    float _836 = _820 * 0.636619746685028076171875;
    float3 _3156 = float3(_832, _834, _826);
    float _838 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3156, float3(0.0), isnan(_3156)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3156, float3(0.0), isnan(_3156)), level(0.0)).x;
    float _840 = -_816;
    float _842 = fma(_836, _840, 1.0);
    float3 _3172 = float3(_832, _834, _826);
    float4 _845 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3172, float3(0.0), isnan(_3172)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3172, float3(0.0), isnan(_3172)), level(0.0)).xyzw;
    float _847 = _845.x;
    float _849 = _845.y;
    float _851 = _845.z;
    float _853 = _845.w;
    float2 _3188 = float2(_842, _818);
    float3 _857 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3188, float2(0.0), isnan(_3188)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3188, float2(0.0), isnan(_3188)), level(0.0)).xyz;
    float _859 = _857.x;
    float _861 = _857.y;
    float _863 = _857.z;
    float _865 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _867 = in.m_60.y;
    bool _869 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _871 = isnan(_213);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = _340 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _883 = _865 * _171;
    float _885 = in.m_68.y;
    float _887 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _889 = trunc(_883);
    int _891 = int(_889);
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _899 = _897 != 0;
    float _901 = in.m_68.x;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _905 = _903 != 0;
    int _907 = _185 + 8;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    uint _911 = uint(int(uint(int(_909)) >> uint(2)));
    int _913 = int(_909) & 3;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[int(_911)][_913];
    float _917 = in.m_60.w;
    float _919 = 1.0 / _895;
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _923 = _921 != 0;
    float _925 = fma(_316, (*spvDescriptorSet0.vp_c8)._m0[11].x, _881);
    float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _929 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[28].x, _927);
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _933 = _931 != 0;
    float _935 = _340 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _937 = _867 > 0.5;
    float _939 = 0.0;
    float _941 = (*spvDescriptorSet0.vp_c8)._m0[28].x;
    bool _943 = _933;
    float _945 = _752;
    if (_899)
    {
        float _947 = in.m_60.z;
        _939 = _947;
    }
    float _949 = _939;
    int _951 = _891 << 4;
    int _953 = _951 + 1968;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _955;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _961 = _213 + _959;
    bool _963 = false;
    if (_905)
    {
        bool _965 = _171 > 0.5;
        _963 = _965;
    }
    bool _967 = _963;
    uint _969 = uint(int(uint(_953) >> uint(2)));
    uint _971 = uint(int(uint(int(_969)) >> uint(2)));
    int _973 = int(_969) & 3;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[int(_971)][_973];
    int _977 = int(_969) + 1;
    uint _979 = uint(int(uint(_977) >> uint(2)));
    int _981 = _977 & 3;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[int(_979)][_981];
    bool _985 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _987 = isnan(_213);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = -_879;
    float _999 = _997 + 1.0;
    float _1001 = -_885;
    float _1003 = _1001 + 1.0;
    float _1005 = _957 * _919;
    float _1007 = _995 * _999;
    float _1009 = _1005;
    int _1011 = as_type<int>(_901);
    int _1013 = as_type<int>(_1007);
    float _1015 = _885;
    float _1017 = (*spvDescriptorSet0.vp_c8)._m0[28].z;
    if (!_905)
    {
        _941 = _901;
    }
    float _1019 = _941;
    int _1021 = _953 + 8;
    uint _1023 = uint(int(uint(_1021) >> uint(2)));
    uint _1025 = uint(int(uint(int(_1023)) >> uint(2)));
    int _1027 = int(_1023) & 3;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[int(_1025)][_1027];
    float _1031 = fma(_1005, _961, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1033 = -_995;
    float _1035 = _1033 + 1.0;
    bool _1037 = _917 > 0.5;
    float _1039 = fma(_296, (*spvDescriptorSet0.vp_c8)._m0[11].z, _925);
    float _1041 = _1031 * _1007;
    float _1043 = _1019;
    if (!_905)
    {
        _1009 = _1019;
    }
    float _1045 = _1009;
    float _1047 = in.m_70.x;
    float _1049 = in.m_70.y;
    float _1051 = in.m_70.z;
    float _1053 = _1045;
    if (_905)
    {
        _1043 = _901;
    }
    float _1055 = _1043;
    float _1057 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1041);
    float _1059 = _1037 ? _1003 : _885;
    uint _1061 = uint(int(uint(_185) >> uint(2)));
    uint _1063 = uint(int(uint(int(_1061)) >> uint(2)));
    int _1065 = int(_1061) & 3;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[int(_1063)][_1065];
    int _1069 = int(_1061) + 1;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    int _1073 = _1069 & 3;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[int(_1071)][_1073];
    bool _1077 = _225 != 0.0;
    bool _1079 = isnan(_225);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan(0.0);
    bool _1085 = _1081 || _1083;
    float _1087 = _1055;
    float _1089 = _1059;
    if (_905)
    {
        float _1091 = -_1055;
        float _1093 = _1091 + 1.0;
        _1011 = as_type<int>(_1093);
    }
    int _1095 = _1011;
    float _1097 = _933 ? _1059 : _885;
    if (_899)
    {
        float _1099 = -_1055;
        float _1101 = _1099 + 1.0;
        _1013 = as_type<int>(_1101);
    }
    int _1103 = _1013;
    float _1105 = _949;
    if (_899)
    {
        bool _1107 = _949 > 0.5;
        _943 = _1107;
    }
    bool _1109 = _943;
    float _1111 = fma(_316, (*spvDescriptorSet0.vp_c8)._m0[10].x, _935);
    bool _1113 = _223 == 0.0;
    bool _1115 = !_1085;
    bool _1117 = _1113 && _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1121 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1119);
    if (_923)
    {
        float _1123 = _937 ? _1003 : _885;
        _1015 = _1123;
    }
    float _1125 = _1015;
    float _1127 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1057);
    if (_905)
    {
        float _1129 = _967 ? as_type<float>(_1095) : _1055;
        _1053 = _1129;
    }
    float _1131 = _1053;
    float _1133 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_899)
    {
        float _1135 = _1109 ? as_type<float>(_1103) : _1055;
        _1087 = _1135;
    }
    float _1137 = _1087;
    float _1139 = _714 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1141 = _227 == 0.0;
    bool _1143 = _1141 && _1117;
    float _1145 = _738 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1147 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1149 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1139);
    float _1151 = exp2(_1145);
    float _1153 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1149);
    float _1155 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1153);
    float _1157 = 0.0;
    float _1159 = _1155;
    if (_1143)
    {
        _1157 = _1051;
    }
    float _1161 = _1157;
    float _1163 = _975 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1165 = _983 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1167 = 0.0;
    float _1169 = _1163;
    float _1171 = _1161;
    if (_1143)
    {
        _1167 = _1047;
    }
    float _1173 = _1167;
    float _1175 = in.m_72.x;
    float _1177 = in.m_72.y;
    float _1179 = in.m_72.z;
    float _1181 = in.m_72.w;
    float _1183 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1185 = _1173;
    if (_1143)
    {
        _1017 = _1049;
    }
    float _1187 = _1017;
    float _1189 = _1187;
    if (_1143)
    {
        _1169 = _1161;
    }
    float _1191 = _1169;
    float _1193 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1195 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1197 = _1191;
    if (_1143)
    {
        _1105 = _1173;
    }
    float _1199 = _1105;
    float _1201 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1203 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1205 = _1199;
    if (!_1143)
    {
        _1171 = _1051;
    }
    float _1207 = _1171;
    float _1209 = fma(_296, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1111);
    if (!_1143)
    {
        _1185 = _1047;
    }
    float _1211 = _1185;
    float _1213 = 1.0 / _1203;
    if (_1143)
    {
        _1089 = _1187;
    }
    float _1215 = _1089;
    out.m_74.x = _1183;
    out.m_74.y = _1195;
    out.m_74.z = _1201;
    float _1217 = _1215;
    if (!_1143)
    {
        _1189 = _1049;
    }
    float _1219 = _1189;
    float _1221 = _1209 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (!_1143)
    {
        float _1223 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1211);
        _1205 = _1223;
    }
    float _1225 = _1205;
    if (!_1143)
    {
        float _1227 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1207);
        _1197 = _1227;
    }
    float _1229 = _1197;
    float _1231 = _915 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (!_1143)
    {
        float _1233 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1219);
        _1217 = _1233;
    }
    float _1235 = _1217;
    float _1237 = _1221 + _1203;
    float _1239 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1241 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1243 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1247 = _1179 * _1211;
    float _1249 = fma(_1175, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1239);
    float _1251 = fma(_1175, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1241);
    float _1253 = fma(_1175, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1243);
    float _1255 = -_1247;
    float _1257 = fma(_1175, _1207, _1255);
    float _1259 = _1175 * _1219;
    float _1261 = _1237 * _1213;
    float _1263 = _1261 * 0.5;
    float _1265 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1267 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1269 = -_1259;
    float _1271 = fma(_1177, _1211, _1269);
    float _1273 = _1177 * _1207;
    float _1275 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1279 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1283 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1281);
    float _1285 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1289 = _1127 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1291 = fma(_1179, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1249);
    float _1293 = fma(_1179, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1251);
    float _1295 = 1.0 / _1283;
    float _1297 = fma(_1179, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1253);
    out.m_76.x = _1279;
    out.m_76.y = _1285;
    out.m_76.z = _1287;
    out.m_76.w = _1289;
    float _1299 = -_1273;
    float _1301 = fma(_1179, _1219, _1299);
    float _1303 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1305 = _1257 * _1181;
    float _1307 = _1133 * _1245;
    float _1309 = _1301 * _1181;
    float _1311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1313 = _1275 * _1277;
    float _1315 = _1271 * _1181;
    float _1317 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1319 = _1293 * _454;
    bool _1321 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1323 = isnan(0.0);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1329 = _1325 || _1327;
    float _1331 = fma(_1309, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1317);
    float _1333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1337 = _1295 * _1335;
    float _1339 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1341 = fma(_1315, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1331);
    float _1343 = _1293 * _464;
    float _1345 = _1293 * _374;
    float _1347 = fma(_1309, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1339);
    float _1349 = abs(_1337);
    float _1351 = log2(_1349);
    float _1353 = _1303 * _1311;
    float _1355 = fma(_1291, _478, _1343);
    float _1357 = fma(_1291, _488, _1345);
    float _1359 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1361 = _1147 * _1333;
    float _1363 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1365 = fma(_1315, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1347);
    float _1367 = _1341 * _454;
    float _1369 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    out.m_78.x = _1313;
    out.m_78.y = _1353;
    out.m_78.z = _1361;
    out.m_78.w = _1307;
    float _1371 = fma(_1309, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1363);
    float _1373 = fma(_1291, _468, _1319);
    float _1375 = fma(_1225, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1359);
    float _1377 = fma(_1225, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1369);
    float _1379 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1381 = _1337 <= 8000.0;
    bool _1383 = isnan(_1337);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan(8000.0);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = fma(_1229, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1375);
    float _1395 = fma(_1225, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1379);
    float _1397 = _1393 * _454;
    float _1399 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1401 = fma(_1315, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1371);
    float _1403 = _1341 * _464;
    float _1405 = _1341 * _374;
    float _1407 = fma(_1297, _484, _1355);
    float _1409 = fma(_1401, _468, _1367);
    float _1411 = exp2(_1399);
    float _1413 = fma(_1401, _478, _1403);
    float _1415 = fma(_1401, _488, _1405);
    float _1417 = fma(_1297, _372, _1373);
    float _1419 = fma(_1297, _496, _1357);
    float _1421 = fma(_1365, _484, _1413);
    float _1423 = fma(_1365, _372, _1409);
    float _1425 = fma(_1365, _496, _1415);
    float _1427 = fma(_1229, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1377);
    out.m_80.x = _1407;
    out.m_80.y = _1417;
    out.m_80.z = _1419;
    float _1429 = _1393 * _374;
    float _1431 = _1393 * _464;
    float _1433 = fma(_1229, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1395);
    out.m_82.x = _1421;
    out.m_82.y = _1423;
    out.m_82.z = _1425;
    float _1435 = fma(_1427, _488, _1429);
    float _1437 = fma(_1411, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1439 = precise::clamp(_1437, 0.0, 1.0);
    float _1441 = fma(_1427, _478, _1431);
    float _1443 = in.m_84.x;
    float _1445 = fma(_1427, _468, _1397);
    float _1447 = fma(_1439, -2.0, 3.0);
    float _1449 = _1439 * _1439;
    float _1451 = _1155 + _752;
    float _1453 = _1419;
    if (!_1329)
    {
        _1453 = 1.0;
    }
    float _1455 = _1453;
    float _1457 = _1449 * _1447;
    float _1459 = _1451 * 0.5;
    float _1461 = -_1457;
    float _1463 = _1461 + 1.0;
    float _1465 = fma(_1463, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1457);
    bool _1467 = !_1329;
    float _1469 = _1455;
    float _1471 = _752;
    float _1473 = _1459;
    if (!_1467)
    {
        float _1475 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        float _1477 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1121);
        float _1479 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _929);
        float _1481 = precise::min(_1475, 20.0);
        float _1483 = _296 + _1477;
        float _1485 = _316 + _1479;
        float _1487 = -_1483;
        float _1489 = _1487 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
        float _1491 = 1.0 / _1481;
        float _1493 = -_1485;
        float _1495 = _1493 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
        float _1497 = precise::min(_1483, _1489);
        float _1499 = precise::min(_1485, _1495);
        float _1501 = precise::min(_1497, _1499);
        float _1503 = _1501 * _1491;
        float _1505 = precise::clamp(_1503, 0.0, 1.0);
        _1469 = _1505;
    }
    float _1507 = _1469;
    float _1509 = _1391 * _1465;
    float _1511 = -_1151;
    float _1513 = _1511 + 1.0;
    float _1515 = -_824;
    float _1517 = _1515 + 1.0;
    float _1519 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1521 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _794;
    out.gl_Position.y = _808;
    out.gl_Position.z = _1155;
    out.gl_Position.w = _752;
    float _1523 = fma(_1433, _484, _1441);
    float _1525 = _1517 * _1519;
    float _1527 = precise::clamp(_1525, 0.0, 1.0);
    float _1529 = _1521 * _838;
    float _1531 = fma(_1433, _372, _1445);
    float _1533 = fma(_1433, _496, _1435);
    float _1535 = -_1527;
    float _1537 = fma(_1535, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1539 = _863 * _1529;
    out.m_86.x = _506;
    out.m_86.y = _502;
    out.m_86.z = _512;
    bool _1541 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1543 = isnan(_530);
    bool _1545 = _1541 || _1543;
    bool _1547 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1549 = _1545 || _1547;
    float _1551 = _1537 * _1443;
    float _1553 = fma(_853, _1539, _851);
    out.m_88.x = _1523;
    out.m_88.y = _1531;
    out.m_88.z = _1533;
    float _1555 = _853 * _1529;
    float _1557 = -_1521;
    float _1559 = _1557 + 1.0;
    float _1561 = _1551 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_90.z = _1459;
    out.m_90.w = _752;
    float _1563 = fma(_859, _1555, _847);
    float _1565 = fma(_861, _1555, _849);
    float _1567 = _853 * _1559;
    out.m_92.x = _1561;
    float _1569 = _1507 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1571 = _1555;
    float _1573 = _1559;
    if (!_1549)
    {
        _945 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1575 = _945;
    out.m_94.x = _1563;
    out.m_94.y = _1565;
    out.m_94.z = _1553;
    out.m_94.w = _1567;
    float _1577 = _1575;
    float _1579 = _1575;
    if (!_1549)
    {
        _1159 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1581 = _1159;
    float _1583 = _1581;
    float _1585 = _1581;
    if (!_1549)
    {
        _1471 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1587 = _1471;
    float _1589 = _1587;
    float _1591 = _1587;
    if (!_1549)
    {
        _1473 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1593 = _1473;
    float _1595 = _1593;
    float _1597 = _1593;
    if (!_1549)
    {
        _1571 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1599 = _1571;
    float _1601 = _1599;
    float _1603 = _1599;
    if (!_1549)
    {
        _1573 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1605 = _1573;
    bool _1607 = !_1549;
    float _1609 = _1605;
    float _1611 = _1605;
    if (!_1607)
    {
        bool _1613 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1615 = isnan(_530);
        bool _1617 = _1613 || _1615;
        bool _1619 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1621 = _1617 || _1619;
        if (!_1621)
        {
            float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1625 = _530 + _1623;
            float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1629 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1627;
            float _1631 = 1.0 / _1629;
            float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1635 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1637 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1639 = _1637 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1643 = _1641 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1645 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1647 = _1645 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1649 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1651 = _1649 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1653 = _1625 * _1631;
            float _1655 = precise::clamp(_1653, 0.0, 1.0);
            float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1659 = _1657 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1661 = fma(_1655, _1635, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1663 = fma(_1655, _1659, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1665 = fma(_1655, _1639, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1667 = fma(_1655, _1643, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1669 = fma(_1655, _1647, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1671 = fma(_1655, _1651, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1597 = _1663;
            _1603 = _1669;
            _1591 = _1661;
            _1585 = _1667;
            _1579 = _1665;
            _1611 = _1671;
            _1673 = true;
        }
        else
        {
            bool _1675 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1677 = isnan(_530);
            bool _1679 = _1675 || _1677;
            bool _1681 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1683 = _1679 || _1681;
            if (!_1683)
            {
                _1589 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1685 = _1589;
            _1591 = _1685;
            if (!_1683)
            {
                _1595 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1687 = _1595;
            _1597 = _1687;
            if (!_1683)
            {
                _1577 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1689 = _1577;
            _1579 = _1689;
            if (!_1683)
            {
                _1583 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1691 = _1583;
            _1585 = _1691;
            if (!_1683)
            {
                _1601 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1693 = _1601;
            _1603 = _1693;
            if (!_1683)
            {
                _1609 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1695 = _1609;
            bool _1697 = !_1683;
            _1611 = _1695;
            if (!_1697)
            {
                bool _1699 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1701 = isnan(_530);
                bool _1703 = _1699 || _1701;
                bool _1705 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1707 = _1703 || _1705;
                if (!_1707)
                {
                    float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1711 = _530 + _1709;
                    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1715 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1713;
                    float _1717 = 1.0 / _1715;
                    float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1721 = _1719 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1727 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1729 = _1727 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1731 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1733 = _1731 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1735 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1737 = _1735 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1739 = _1711 * _1717;
                    float _1741 = precise::clamp(_1739, 0.0, 1.0);
                    float _1743 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1745 = _1743 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1747 = fma(_1741, _1721, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1749 = fma(_1741, _1745, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1751 = fma(_1741, _1725, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1753 = fma(_1741, _1729, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1755 = fma(_1741, _1733, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1757 = fma(_1741, _1737, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1597 = _1749;
                    _1603 = _1755;
                    _1591 = _1747;
                    _1585 = _1753;
                    _1579 = _1751;
                    _1611 = _1757;
                    _1673 = true;
                }
                else
                {
                    _1597 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1603 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1591 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1585 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1579 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1611 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1673 = false;
    float _1759 = _1597;
    float _1761 = _1603;
    float _1763 = _1591;
    float _1765 = _1585;
    float _1767 = _1579;
    float _1769 = _1611;
    float _1771 = fma(_1531, -0.5, 0.5);
    float _1773 = precise::clamp(_1771, 0.0, 1.0);
    float _1775 = -_1759;
    float _1777 = _1775 + _1761;
    float _1779 = -_1763;
    float _1781 = _1779 + _1765;
    float _1783 = -_1767;
    float _1785 = _1783 + _1769;
    bool _1787 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1789 = fma(_1773, _1777, _1759);
    float _1791 = fma(_1773, _1781, _1763);
    float _1793 = fma(_1773, _1785, _1767);
    float _1795 = _1569 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1797 = _1789 * 0.586610972881317138671875;
    out.m_96.x = 0.0;
    float _1799 = fma(_1791, 0.298911988735198974609375, _1797);
    out.m_92.w = _1795;
    float _1801 = fma(_1793, 0.114477999508380889892578125, _1799);
    out.m_56.x = 1.0;
    float _1803 = -_1801;
    float _1805 = _1791 + _1803;
    float _1807 = -_1801;
    float _1809 = _1789 + _1807;
    float _1811 = -_1801;
    float _1813 = _1793 + _1811;
    float _1815 = fma(_1805, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1801);
    float _1817 = fma(_1809, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1801);
    float _1819 = fma(_1813, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1801);
    out.m_98.x = _1815;
    out.m_98.y = _1817;
    out.m_98.z = _1819;
    if (!_1787)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1821 = -_502;
    float _1823 = _1821 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1825 = -_506;
    float _1827 = _1825 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1829 = -_512;
    float _1831 = _1829 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1833 = _1823 * _1823;
    float _1835 = fma(_1827, _1827, _1833);
    float _1837 = fma(_1831, _1831, _1835);
    float _1839 = sqrt(_1837);
    float _1841 = rsqrt(_1837);
    float _1843 = -_1839;
    float _1845 = _1843 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1847 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1849 = precise::clamp(_1847, 0.0, 1.0);
    float _1851 = _1827 * _1841;
    float _1853 = _1823 * _1841;
    float _1855 = abs(_1849);
    float _1857 = log2(_1855);
    float _1859 = _1831 * _1841;
    float _1861 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1863 = _1531 * _1853;
    float _1865 = -_1853;
    float _1867 = -_1861;
    float _1869 = fma(_1865, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1867);
    float _1871 = fma(_1523, _1851, _1863);
    float _1873 = -_1859;
    float _1875 = fma(_1873, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1869);
    float _1877 = fma(_1533, _1859, _1871);
    float _1879 = precise::clamp(_1877, 0.0, 1.0);
    float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1883 = _1875 + _1881;
    float _1885 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1887 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1889 = precise::clamp(_1887, 0.0, 1.0);
    float _1891 = exp2(_1885);
    float _1893 = _1891 * _1889;
    float _1895 = _1879 * _1893;
    float _1897 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1899 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1901 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _1897;
    out.m_96.y = _1899;
    out.m_96.z = _1901;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1673 = false;
    bool _205 = false;
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
        float _1958 = as_type<float>(_133);
        out.gl_Position.z = _1958;
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
        float _2027 = as_type<float>(_169);
        out.gl_Position.z = _2027;
    }
    if (_161)
    {
        return out;
    }
    float _171 = in.m_60.x;
    float _173 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _177 = _173 * _171;
    float _179 = trunc(_177);
    int _181 = int(_179);
    int _183 = _181 << 4;
    int _185 = _183 + 1712;
    bool _187 = !_175;
    float _203;
    if (!_187)
    {
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _191 = _171 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_117);
        float _209 = 1.0 / _207;
        float _211 = _151 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = in.m_62.w;
    float _217 = in.m_64.x;
    float _219 = in.m_64.y;
    float _221 = in.m_64.z;
    float _223 = in.m_66.x;
    float _225 = in.m_66.y;
    float _227 = in.m_66.z;
    float _229 = in.m_53.x;
    float _231 = in.m_53.y;
    float _233 = in.m_53.z;
    float _235 = trunc(_215);
    int _237 = int(_235);
    int _239 = _237 << 5;
    uint _242 = uint(int(uint(_239) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_242)];
    float _244 = as_type<float>(_dmw0.x);
    int _246 = _239 + 4;
    uint _248 = uint(int(uint(_246) >> uint(2)));
    float _250 = as_type<float>(_dmw0.y);
    int _252 = _239 + 8;
    uint _254 = uint(int(uint(_252) >> uint(2)));
    float _256 = as_type<float>(_dmw0.z);
    int _258 = _239 + 12;
    uint _260 = uint(int(uint(_258) >> uint(2)));
    float _262 = as_type<float>(_dmw0.w);
    float _264 = _217 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _266 = _219 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = _221 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _270 = _231 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _274 = _264 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _276 = _268 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _278 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[6].x, _270);
    float _280 = _272 * _274;
    float _282 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _284 = _266 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _286 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _227);
    float _288 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[6].z, _278);
    float _290 = _282 * _284;
    float _292 = _231 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _294 = _286 * _276;
    float _296 = _288 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _298 = _290 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _300 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[4].x, _292);
    float _302 = _290 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _304 = _231 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _306 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[10].x, _298);
    float _308 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[4].z, _300);
    float _310 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[8].x, _302);
    float _312 = _290 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _314 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[10].z, _306);
    float _316 = _308 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _318 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[8].z, _310);
    float _320 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[5].x, _304);
    float _322 = _296 + _314;
    float _324 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[9].x, _312);
    float _326 = _316 + _318;
    float _328 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[5].z, _320);
    float _330 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _332 = _322 + _330;
    float _334 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[9].z, _324);
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _338 = _326 + _336;
    float _340 = _328 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _342 = _332 * _332;
    float _344 = _340 + _334;
    float _346 = fma(_338, _338, _342);
    float _348 = sqrt(_346);
    bool _350 = _348 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _352 = _229;
    float _354 = _344;
    float _356 = _326;
    float _358 = _332;
    float _360 = _322;
    if (!_350)
    {
        _352 = _322;
    }
    float _362 = _352;
    float _364 = _262 * 2.0;
    float _366 = _250 * 2.0;
    float _368 = _244 * _364;
    float _370 = -_368;
    float _372 = fma(_256, _366, _370);
    float _374 = fma(_256, _366, _368);
    bool _376 = !_350;
    float _378 = _362;
    if (!_376)
    {
        float _380 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _382 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _384 = _348 + _382;
        float _386 = _344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _388 = rsqrt(_346);
        float _390 = _384 * _380;
        float _392 = _390 * 0.15915493667125701904296875;
        float _394 = _392 * 6.283185482025146484375;
        float _396 = cos(_394);
        float _398 = _392 * 6.283185482025146484375;
        float _400 = sin(_398);
        float _402 = _396 + (-1.0);
        float _404 = _402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _406 = fma(_400, _386, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _408 = fma(_344, _396, _404);
        float _410 = _388 * _406;
        float _412 = fma(_338, _410, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _414 = fma(_332, _410, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _354 = _408;
        _356 = _412;
        _378 = _414;
    }
    float _416 = _354;
    float _418 = _356;
    float _420 = _378;
    float _422 = -_340;
    float _424 = _422 + _416;
    float _426 = _244 * 2.0;
    float _428 = _244 * _244;
    float _430 = -_316;
    float _432 = _430 + _418;
    float _434 = _424 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _436 = _256 * _256;
    float _438 = fma(_428, -2.0, 1.0);
    float _440 = -_296;
    float _442 = _440 + _420;
    float _444 = _424 * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _446 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].y, _434);
    float _448 = _424 * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _450 = _256 * _364;
    float _452 = _250 * _250;
    float _454 = fma(_436, -2.0, _438);
    float _456 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].x, _444);
    float _458 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[6].y, _446);
    float _460 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].z, _448);
    float _462 = -_450;
    float _464 = fma(_250, _426, _462);
    float _466 = fma(_452, -2.0, 1.0);
    float _468 = fma(_250, _426, _450);
    float _470 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[6].x, _456);
    float _472 = _458 * _454;
    float _474 = _250 * _364;
    float _476 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[6].z, _460);
    float _478 = fma(_436, -2.0, _466);
    float _480 = _458 * _464;
    float _482 = fma(_470, _468, _472);
    float _484 = fma(_256, _426, _474);
    float _486 = -_474;
    float _488 = fma(_256, _426, _486);
    float _490 = _458 * _374;
    float _492 = fma(_470, _478, _480);
    float _494 = fma(_476, _372, _482);
    float _496 = fma(_452, -2.0, _438);
    float _498 = fma(_470, _488, _490);
    float _500 = fma(_476, _484, _492);
    float _502 = _340 + _494;
    float _504 = fma(_476, _496, _498);
    float _506 = _316 + _500;
    float _508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _510 = _502 + _508;
    float _512 = _296 + _504;
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _516 = _506 + _514;
    float _518 = _510 * _510;
    float _520 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _522 = _512 + _520;
    float _524 = fma(_516, _516, _518);
    float _526 = fma(_522, _522, _524);
    float _528 = rsqrt(_526);
    float _530 = sqrt(_526);
    float _532 = _528 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _534 = _516 * _532;
    float _536 = _522 * _532;
    float _538 = _534 * _534;
    float _540 = _536 * _536;
    float _542 = _538 + _540;
    float _544 = sqrt(_542);
    bool _546 = _544 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _548 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _550 = _544 + _548;
    float _552 = _528;
    float _554 = _542;
    float _556 = _550;
    float _558 = _426;
    float _560 = _532;
    if (_546)
    {
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _552 = _562;
    }
    float _564 = _552;
    if (_546)
    {
        float _566 = rsqrt(_542);
        _554 = _566;
    }
    float _568 = _554;
    float _570 = _568;
    if (_546)
    {
        float _572 = _550 * _564;
        _556 = _572;
    }
    float _574 = _556;
    if (_546)
    {
        float _576 = _574 * 0.15915493667125701904296875;
        _358 = _576;
    }
    float _578 = _358;
    float _580 = _564;
    float _582 = _578;
    if (_546)
    {
        float _584 = _578 * 6.283185482025146484375;
        float _586 = sin(_584);
        _580 = _586;
    }
    float _588 = _580;
    float _590 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _592 = precise::max(0.0, _590);
    float _594 = _522;
    if (_546)
    {
        float _596 = _578 * 6.283185482025146484375;
        float _598 = cos(_596);
        _594 = _598;
    }
    float _600 = _594;
    float _602 = -_532;
    float _604 = -_592;
    float _606 = fma(_510, _602, _604);
    if (_546)
    {
        float _608 = _606 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _558 = _608;
    }
    float _610 = _558;
    float _612 = _610;
    if (!_546)
    {
        _582 = _536;
    }
    float _614 = _582;
    float _616 = fma(_316, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _618 = _588;
    float _620 = _614;
    if (_546)
    {
        float _622 = fma(_588, _610, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _360 = _622;
    }
    float _624 = _360;
    float _626 = _624;
    if (!_546)
    {
        _618 = _534;
    }
    float _628 = _618;
    float _630 = floor(_616);
    float _632 = _628;
    float _634 = _600;
    if (_546)
    {
        float _636 = _600 + (-1.0);
        _612 = _636;
    }
    float _638 = _612;
    float _640 = 0.0;
    if (_546)
    {
        float _642 = _568 * _624;
        _640 = _642;
    }
    float _644 = _640;
    if (!_546)
    {
        _626 = _606;
    }
    float _646 = _626;
    float _648 = _646;
    if (_546)
    {
        float _650 = _638 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _560 = _650;
    }
    float _652 = _560;
    if (_546)
    {
        float _654 = _534 * _644;
        _632 = _654;
    }
    float _656 = _632;
    if (!_546)
    {
        _570 = _538;
    }
    float _658 = _570;
    float _660 = _658;
    if (_546)
    {
        float _662 = _536 * _644;
        _620 = _662;
    }
    float _664 = _620;
    if (_546)
    {
        float _666 = fma(_606, _600, _652);
        _648 = _666;
    }
    float _668 = _648;
    if (_546)
    {
        float _670 = _656 * _656;
        _660 = _670;
    }
    float _672 = _660;
    if (!_546)
    {
        _634 = _540;
    }
    float _674 = _634;
    float _676 = _674;
    if (_546)
    {
        float _678 = _664 * _664;
        _676 = _678;
    }
    float _680 = _676;
    float _682 = _502 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _684 = fma(_668, _668, _672);
    float _686 = _502 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _688 = _502 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _690 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[1].x, _682);
    float _692 = _684 + _680;
    float _694 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[2].x, _686);
    float _696 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[0].x, _688);
    float _698 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[1].z, _690);
    float _700 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _702 = fma(_530, (*spvDescriptorSet0.vp_c15)._m0[23].w, _700);
    float _704 = precise::clamp(_702, 0.0, 1.0);
    float _706 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[2].z, _694);
    float _708 = rsqrt(_692);
    float _710 = _502 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _712 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[0].z, _696);
    float _714 = _698 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _716 = _706 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _718 = -_704;
    float _720 = _718 + 1.0;
    float _722 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[3].x, _710);
    float _724 = _712 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _726 = _714 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _728 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _730 = _716 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _732 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[3].z, _722);
    float _734 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _726);
    float _736 = abs(_720);
    float _738 = log2(_736);
    float _740 = -_730;
    float _742 = fma(_740, _728, 1.0);
    float _744 = _732 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _746 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[7].z, _734);
    float _748 = _708 * _656;
    float _750 = _708 * _664;
    float _752 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[7].w, _746);
    float _754 = _708 * _668;
    float _756 = _748 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _758 = fma(_296, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _760 = -_630;
    float _762 = _616 + _760;
    float _764 = _714 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _766 = -_756;
    float _768 = fma(_754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _766);
    float _770 = floor(_758);
    float _772 = _714 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _774 = _738 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _776 = -_750;
    float _778 = fma(_776, (*spvDescriptorSet0.vp_c15)._m0[21].z, _768);
    float _780 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _764);
    float _782 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _772);
    float _784 = fma(_778, -0.5, 0.5);
    float _786 = exp2(_774);
    float _788 = fma(_778, 0.5, 0.5);
    float _790 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[4].z, _780);
    float _792 = fma(_788, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _794 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[4].w, _790);
    float _796 = log2(_742);
    float _798 = -_770;
    float _800 = _758 + _798;
    float _802 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[5].z, _782);
    float _804 = _754 + 1.0;
    float _806 = fma(_788, _792, -0.212114393711090087890625);
    float _808 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[5].w, _802);
    float _810 = 1.0 / _752;
    float _812 = -_754;
    float _814 = fma(_786, _804, _812);
    float _816 = fma(_788, _806, 1.570728778839111328125);
    float _818 = fma(_814, 0.5, 0.5);
    float _820 = sqrt(_784);
    float _822 = _796 * 0.693147182464599609375;
    float2 _3128 = float2(_762, _800);
    float _824 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3128, float2(0.0), isnan(_3128)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3128, float2(0.0), isnan(_3128)), level(0.0)).x;
    float _826 = _822 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _828 = _794 * _810;
    float _830 = _808 * _810;
    float _832 = fma(_828, 0.5, 0.5);
    float _834 = fma(_830, -0.5, 0.5);
    float _836 = _820 * 0.636619746685028076171875;
    float3 _3156 = float3(_832, _834, _826);
    float _838 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3156, float3(0.0), isnan(_3156)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3156, float3(0.0), isnan(_3156)), level(0.0)).x;
    float _840 = -_816;
    float _842 = fma(_836, _840, 1.0);
    float3 _3172 = float3(_832, _834, _826);
    float4 _845 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3172, float3(0.0), isnan(_3172)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3172, float3(0.0), isnan(_3172)), level(0.0)).xyzw;
    float _847 = _845.x;
    float _849 = _845.y;
    float _851 = _845.z;
    float _853 = _845.w;
    float2 _3188 = float2(_842, _818);
    float3 _857 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3188, float2(0.0), isnan(_3188)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3188, float2(0.0), isnan(_3188)), level(0.0)).xyz;
    float _859 = _857.x;
    float _861 = _857.y;
    float _863 = _857.z;
    float _865 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _867 = in.m_60.y;
    bool _869 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _871 = isnan(_213);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = _340 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _883 = _865 * _171;
    float _885 = in.m_68.y;
    float _887 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _889 = trunc(_883);
    int _891 = int(_889);
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _899 = _897 != 0;
    float _901 = in.m_68.x;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _905 = _903 != 0;
    int _907 = _185 + 8;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    uint _911 = uint(int(uint(int(_909)) >> uint(2)));
    int _913 = int(_909) & 3;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[int(_911)][_913];
    float _917 = in.m_60.w;
    float _919 = 1.0 / _895;
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _923 = _921 != 0;
    float _925 = fma(_316, (*spvDescriptorSet0.vp_c8)._m0[11].x, _881);
    float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _929 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[28].x, _927);
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _933 = _931 != 0;
    float _935 = _340 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _937 = _867 > 0.5;
    float _939 = 0.0;
    float _941 = (*spvDescriptorSet0.vp_c8)._m0[28].x;
    bool _943 = _933;
    float _945 = _752;
    if (_899)
    {
        float _947 = in.m_60.z;
        _939 = _947;
    }
    float _949 = _939;
    int _951 = _891 << 4;
    int _953 = _951 + 1968;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _955;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _961 = _213 + _959;
    bool _963 = false;
    if (_905)
    {
        bool _965 = _171 > 0.5;
        _963 = _965;
    }
    bool _967 = _963;
    uint _969 = uint(int(uint(_953) >> uint(2)));
    uint _971 = uint(int(uint(int(_969)) >> uint(2)));
    int _973 = int(_969) & 3;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[int(_971)][_973];
    int _977 = int(_969) + 1;
    uint _979 = uint(int(uint(_977) >> uint(2)));
    int _981 = _977 & 3;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[int(_979)][_981];
    bool _985 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _987 = isnan(_213);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = -_879;
    float _999 = _997 + 1.0;
    float _1001 = -_885;
    float _1003 = _1001 + 1.0;
    float _1005 = _957 * _919;
    float _1007 = _995 * _999;
    float _1009 = _1005;
    int _1011 = as_type<int>(_901);
    int _1013 = as_type<int>(_1007);
    float _1015 = _885;
    float _1017 = (*spvDescriptorSet0.vp_c8)._m0[28].z;
    if (!_905)
    {
        _941 = _901;
    }
    float _1019 = _941;
    int _1021 = _953 + 8;
    uint _1023 = uint(int(uint(_1021) >> uint(2)));
    uint _1025 = uint(int(uint(int(_1023)) >> uint(2)));
    int _1027 = int(_1023) & 3;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[int(_1025)][_1027];
    float _1031 = fma(_1005, _961, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1033 = -_995;
    float _1035 = _1033 + 1.0;
    bool _1037 = _917 > 0.5;
    float _1039 = fma(_296, (*spvDescriptorSet0.vp_c8)._m0[11].z, _925);
    float _1041 = _1031 * _1007;
    float _1043 = _1019;
    if (!_905)
    {
        _1009 = _1019;
    }
    float _1045 = _1009;
    float _1047 = in.m_70.x;
    float _1049 = in.m_70.y;
    float _1051 = in.m_70.z;
    float _1053 = _1045;
    if (_905)
    {
        _1043 = _901;
    }
    float _1055 = _1043;
    float _1057 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1041);
    float _1059 = _1037 ? _1003 : _885;
    uint _1061 = uint(int(uint(_185) >> uint(2)));
    uint _1063 = uint(int(uint(int(_1061)) >> uint(2)));
    int _1065 = int(_1061) & 3;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[int(_1063)][_1065];
    int _1069 = int(_1061) + 1;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    int _1073 = _1069 & 3;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[int(_1071)][_1073];
    bool _1077 = _225 != 0.0;
    bool _1079 = isnan(_225);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan(0.0);
    bool _1085 = _1081 || _1083;
    float _1087 = _1055;
    float _1089 = _1059;
    if (_905)
    {
        float _1091 = -_1055;
        float _1093 = _1091 + 1.0;
        _1011 = as_type<int>(_1093);
    }
    int _1095 = _1011;
    float _1097 = _933 ? _1059 : _885;
    if (_899)
    {
        float _1099 = -_1055;
        float _1101 = _1099 + 1.0;
        _1013 = as_type<int>(_1101);
    }
    int _1103 = _1013;
    float _1105 = _949;
    if (_899)
    {
        bool _1107 = _949 > 0.5;
        _943 = _1107;
    }
    bool _1109 = _943;
    float _1111 = fma(_316, (*spvDescriptorSet0.vp_c8)._m0[10].x, _935);
    bool _1113 = _223 == 0.0;
    bool _1115 = !_1085;
    bool _1117 = _1113 && _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1121 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1119);
    if (_923)
    {
        float _1123 = _937 ? _1003 : _885;
        _1015 = _1123;
    }
    float _1125 = _1015;
    float _1127 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1057);
    if (_905)
    {
        float _1129 = _967 ? as_type<float>(_1095) : _1055;
        _1053 = _1129;
    }
    float _1131 = _1053;
    float _1133 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_899)
    {
        float _1135 = _1109 ? as_type<float>(_1103) : _1055;
        _1087 = _1135;
    }
    float _1137 = _1087;
    float _1139 = _714 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1141 = _227 == 0.0;
    bool _1143 = _1141 && _1117;
    float _1145 = _738 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1147 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1149 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1139);
    float _1151 = exp2(_1145);
    float _1153 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1149);
    float _1155 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1153);
    float _1157 = 0.0;
    float _1159 = _1155;
    if (_1143)
    {
        _1157 = _1051;
    }
    float _1161 = _1157;
    float _1163 = _975 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1165 = _983 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1167 = 0.0;
    float _1169 = _1163;
    float _1171 = _1161;
    if (_1143)
    {
        _1167 = _1047;
    }
    float _1173 = _1167;
    float _1175 = in.m_72.x;
    float _1177 = in.m_72.y;
    float _1179 = in.m_72.z;
    float _1181 = in.m_72.w;
    float _1183 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1185 = _1173;
    if (_1143)
    {
        _1017 = _1049;
    }
    float _1187 = _1017;
    float _1189 = _1187;
    if (_1143)
    {
        _1169 = _1161;
    }
    float _1191 = _1169;
    float _1193 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1195 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1197 = _1191;
    if (_1143)
    {
        _1105 = _1173;
    }
    float _1199 = _1105;
    float _1201 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1203 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1205 = _1199;
    if (!_1143)
    {
        _1171 = _1051;
    }
    float _1207 = _1171;
    float _1209 = fma(_296, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1111);
    if (!_1143)
    {
        _1185 = _1047;
    }
    float _1211 = _1185;
    float _1213 = 1.0 / _1203;
    if (_1143)
    {
        _1089 = _1187;
    }
    float _1215 = _1089;
    out.m_74.x = _1183;
    out.m_74.y = _1195;
    out.m_74.z = _1201;
    float _1217 = _1215;
    if (!_1143)
    {
        _1189 = _1049;
    }
    float _1219 = _1189;
    float _1221 = _1209 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (!_1143)
    {
        float _1223 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1211);
        _1205 = _1223;
    }
    float _1225 = _1205;
    if (!_1143)
    {
        float _1227 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1207);
        _1197 = _1227;
    }
    float _1229 = _1197;
    float _1231 = _915 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (!_1143)
    {
        float _1233 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1219);
        _1217 = _1233;
    }
    float _1235 = _1217;
    float _1237 = _1221 + _1203;
    float _1239 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1241 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1243 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1247 = _1179 * _1211;
    float _1249 = fma(_1175, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1239);
    float _1251 = fma(_1175, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1241);
    float _1253 = fma(_1175, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1243);
    float _1255 = -_1247;
    float _1257 = fma(_1175, _1207, _1255);
    float _1259 = _1175 * _1219;
    float _1261 = _1237 * _1213;
    float _1263 = _1261 * 0.5;
    float _1265 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1267 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1269 = -_1259;
    float _1271 = fma(_1177, _1211, _1269);
    float _1273 = _1177 * _1207;
    float _1275 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1279 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1283 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1281);
    float _1285 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1289 = _1127 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1291 = fma(_1179, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1249);
    float _1293 = fma(_1179, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1251);
    float _1295 = 1.0 / _1283;
    float _1297 = fma(_1179, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1253);
    out.m_76.x = _1279;
    out.m_76.y = _1285;
    out.m_76.z = _1287;
    out.m_76.w = _1289;
    float _1299 = -_1273;
    float _1301 = fma(_1179, _1219, _1299);
    float _1303 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1305 = _1257 * _1181;
    float _1307 = _1133 * _1245;
    float _1309 = _1301 * _1181;
    float _1311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1313 = _1275 * _1277;
    float _1315 = _1271 * _1181;
    float _1317 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1319 = _1293 * _454;
    bool _1321 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1323 = isnan(0.0);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1329 = _1325 || _1327;
    float _1331 = fma(_1309, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1317);
    float _1333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1337 = _1295 * _1335;
    float _1339 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1341 = fma(_1315, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1331);
    float _1343 = _1293 * _464;
    float _1345 = _1293 * _374;
    float _1347 = fma(_1309, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1339);
    float _1349 = abs(_1337);
    float _1351 = log2(_1349);
    float _1353 = _1303 * _1311;
    float _1355 = fma(_1291, _478, _1343);
    float _1357 = fma(_1291, _488, _1345);
    float _1359 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1361 = _1147 * _1333;
    float _1363 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1365 = fma(_1315, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1347);
    float _1367 = _1341 * _454;
    float _1369 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    out.m_78.x = _1313;
    out.m_78.y = _1353;
    out.m_78.z = _1361;
    out.m_78.w = _1307;
    float _1371 = fma(_1309, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1363);
    float _1373 = fma(_1291, _468, _1319);
    float _1375 = fma(_1225, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1359);
    float _1377 = fma(_1225, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1369);
    float _1379 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1381 = _1337 <= 8000.0;
    bool _1383 = isnan(_1337);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan(8000.0);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = fma(_1229, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1375);
    float _1395 = fma(_1225, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1379);
    float _1397 = _1393 * _454;
    float _1399 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1401 = fma(_1315, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1371);
    float _1403 = _1341 * _464;
    float _1405 = _1341 * _374;
    float _1407 = fma(_1297, _484, _1355);
    float _1409 = fma(_1401, _468, _1367);
    float _1411 = exp2(_1399);
    float _1413 = fma(_1401, _478, _1403);
    float _1415 = fma(_1401, _488, _1405);
    float _1417 = fma(_1297, _372, _1373);
    float _1419 = fma(_1297, _496, _1357);
    float _1421 = fma(_1365, _484, _1413);
    float _1423 = fma(_1365, _372, _1409);
    float _1425 = fma(_1365, _496, _1415);
    float _1427 = fma(_1229, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1377);
    out.m_80.x = _1407;
    out.m_80.y = _1417;
    out.m_80.z = _1419;
    float _1429 = _1393 * _374;
    float _1431 = _1393 * _464;
    float _1433 = fma(_1229, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1395);
    out.m_82.x = _1421;
    out.m_82.y = _1423;
    out.m_82.z = _1425;
    float _1435 = fma(_1427, _488, _1429);
    float _1437 = fma(_1411, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1439 = precise::clamp(_1437, 0.0, 1.0);
    float _1441 = fma(_1427, _478, _1431);
    float _1443 = in.m_84.x;
    float _1445 = fma(_1427, _468, _1397);
    float _1447 = fma(_1439, -2.0, 3.0);
    float _1449 = _1439 * _1439;
    float _1451 = _1155 + _752;
    float _1453 = _1419;
    if (!_1329)
    {
        _1453 = 1.0;
    }
    float _1455 = _1453;
    float _1457 = _1449 * _1447;
    float _1459 = _1451 * 0.5;
    float _1461 = -_1457;
    float _1463 = _1461 + 1.0;
    float _1465 = fma(_1463, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1457);
    bool _1467 = !_1329;
    float _1469 = _1455;
    float _1471 = _752;
    float _1473 = _1459;
    if (!_1467)
    {
        float _1475 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        float _1477 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1121);
        float _1479 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _929);
        float _1481 = precise::min(_1475, 20.0);
        float _1483 = _296 + _1477;
        float _1485 = _316 + _1479;
        float _1487 = -_1483;
        float _1489 = _1487 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
        float _1491 = 1.0 / _1481;
        float _1493 = -_1485;
        float _1495 = _1493 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
        float _1497 = precise::min(_1483, _1489);
        float _1499 = precise::min(_1485, _1495);
        float _1501 = precise::min(_1497, _1499);
        float _1503 = _1501 * _1491;
        float _1505 = precise::clamp(_1503, 0.0, 1.0);
        _1469 = _1505;
    }
    float _1507 = _1469;
    float _1509 = _1391 * _1465;
    float _1511 = -_1151;
    float _1513 = _1511 + 1.0;
    float _1515 = -_824;
    float _1517 = _1515 + 1.0;
    float _1519 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1521 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _794;
    out.gl_Position.y = _808;
    out.gl_Position.z = _1155;
    out.gl_Position.w = _752;
    float _1523 = fma(_1433, _484, _1441);
    float _1525 = _1517 * _1519;
    float _1527 = precise::clamp(_1525, 0.0, 1.0);
    float _1529 = _1521 * _838;
    float _1531 = fma(_1433, _372, _1445);
    float _1533 = fma(_1433, _496, _1435);
    float _1535 = -_1527;
    float _1537 = fma(_1535, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1539 = _863 * _1529;
    out.m_86.x = _506;
    out.m_86.y = _502;
    out.m_86.z = _512;
    bool _1541 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1543 = isnan(_530);
    bool _1545 = _1541 || _1543;
    bool _1547 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1549 = _1545 || _1547;
    float _1551 = _1537 * _1443;
    float _1553 = fma(_853, _1539, _851);
    out.m_88.x = _1523;
    out.m_88.y = _1531;
    out.m_88.z = _1533;
    float _1555 = _853 * _1529;
    float _1557 = -_1521;
    float _1559 = _1557 + 1.0;
    float _1561 = _1551 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_90.z = _1459;
    out.m_90.w = _752;
    float _1563 = fma(_859, _1555, _847);
    float _1565 = fma(_861, _1555, _849);
    float _1567 = _853 * _1559;
    out.m_92.x = _1561;
    float _1569 = _1507 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1571 = _1555;
    float _1573 = _1559;
    if (!_1549)
    {
        _945 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1575 = _945;
    out.m_94.x = _1563;
    out.m_94.y = _1565;
    out.m_94.z = _1553;
    out.m_94.w = _1567;
    float _1577 = _1575;
    float _1579 = _1575;
    if (!_1549)
    {
        _1159 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1581 = _1159;
    float _1583 = _1581;
    float _1585 = _1581;
    if (!_1549)
    {
        _1471 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1587 = _1471;
    float _1589 = _1587;
    float _1591 = _1587;
    if (!_1549)
    {
        _1473 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1593 = _1473;
    float _1595 = _1593;
    float _1597 = _1593;
    if (!_1549)
    {
        _1571 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1599 = _1571;
    float _1601 = _1599;
    float _1603 = _1599;
    if (!_1549)
    {
        _1573 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1605 = _1573;
    bool _1607 = !_1549;
    float _1609 = _1605;
    float _1611 = _1605;
    if (!_1607)
    {
        bool _1613 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1615 = isnan(_530);
        bool _1617 = _1613 || _1615;
        bool _1619 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1621 = _1617 || _1619;
        if (!_1621)
        {
            float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1625 = _530 + _1623;
            float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1629 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1627;
            float _1631 = 1.0 / _1629;
            float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1635 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1637 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1639 = _1637 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1643 = _1641 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1645 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1647 = _1645 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1649 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1651 = _1649 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1653 = _1625 * _1631;
            float _1655 = precise::clamp(_1653, 0.0, 1.0);
            float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1659 = _1657 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1661 = fma(_1655, _1635, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1663 = fma(_1655, _1659, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1665 = fma(_1655, _1639, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1667 = fma(_1655, _1643, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1669 = fma(_1655, _1647, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1671 = fma(_1655, _1651, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1597 = _1663;
            _1603 = _1669;
            _1591 = _1661;
            _1585 = _1667;
            _1579 = _1665;
            _1611 = _1671;
            _1673 = true;
        }
        else
        {
            bool _1675 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1677 = isnan(_530);
            bool _1679 = _1675 || _1677;
            bool _1681 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1683 = _1679 || _1681;
            if (!_1683)
            {
                _1589 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1685 = _1589;
            _1591 = _1685;
            if (!_1683)
            {
                _1595 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1687 = _1595;
            _1597 = _1687;
            if (!_1683)
            {
                _1577 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1689 = _1577;
            _1579 = _1689;
            if (!_1683)
            {
                _1583 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1691 = _1583;
            _1585 = _1691;
            if (!_1683)
            {
                _1601 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1693 = _1601;
            _1603 = _1693;
            if (!_1683)
            {
                _1609 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1695 = _1609;
            bool _1697 = !_1683;
            _1611 = _1695;
            if (!_1697)
            {
                bool _1699 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1701 = isnan(_530);
                bool _1703 = _1699 || _1701;
                bool _1705 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1707 = _1703 || _1705;
                if (!_1707)
                {
                    float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1711 = _530 + _1709;
                    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1715 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1713;
                    float _1717 = 1.0 / _1715;
                    float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1721 = _1719 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1727 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1729 = _1727 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1731 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1733 = _1731 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1735 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1737 = _1735 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1739 = _1711 * _1717;
                    float _1741 = precise::clamp(_1739, 0.0, 1.0);
                    float _1743 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1745 = _1743 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1747 = fma(_1741, _1721, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1749 = fma(_1741, _1745, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1751 = fma(_1741, _1725, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1753 = fma(_1741, _1729, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1755 = fma(_1741, _1733, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1757 = fma(_1741, _1737, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1597 = _1749;
                    _1603 = _1755;
                    _1591 = _1747;
                    _1585 = _1753;
                    _1579 = _1751;
                    _1611 = _1757;
                    _1673 = true;
                }
                else
                {
                    _1597 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1603 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1591 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1585 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1579 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1611 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1673 = false;
    float _1759 = _1597;
    float _1761 = _1603;
    float _1763 = _1591;
    float _1765 = _1585;
    float _1767 = _1579;
    float _1769 = _1611;
    float _1771 = fma(_1531, -0.5, 0.5);
    float _1773 = precise::clamp(_1771, 0.0, 1.0);
    float _1775 = -_1759;
    float _1777 = _1775 + _1761;
    float _1779 = -_1763;
    float _1781 = _1779 + _1765;
    float _1783 = -_1767;
    float _1785 = _1783 + _1769;
    bool _1787 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1789 = fma(_1773, _1777, _1759);
    float _1791 = fma(_1773, _1781, _1763);
    float _1793 = fma(_1773, _1785, _1767);
    float _1795 = _1569 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1797 = _1789 * 0.586610972881317138671875;
    out.m_96.x = 0.0;
    float _1799 = fma(_1791, 0.298911988735198974609375, _1797);
    out.m_92.w = _1795;
    float _1801 = fma(_1793, 0.114477999508380889892578125, _1799);
    out.m_56.x = 1.0;
    float _1803 = -_1801;
    float _1805 = _1791 + _1803;
    float _1807 = -_1801;
    float _1809 = _1789 + _1807;
    float _1811 = -_1801;
    float _1813 = _1793 + _1811;
    float _1815 = fma(_1805, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1801);
    float _1817 = fma(_1809, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1801);
    float _1819 = fma(_1813, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1801);
    out.m_98.x = _1815;
    out.m_98.y = _1817;
    out.m_98.z = _1819;
    if (!_1787)
    {
        return out;
    }
    float _1821 = -_502;
    float _1823 = _1821 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1825 = -_506;
    float _1827 = _1825 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1829 = -_512;
    float _1831 = _1829 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1833 = _1823 * _1823;
    float _1835 = fma(_1827, _1827, _1833);
    float _1837 = fma(_1831, _1831, _1835);
    float _1839 = sqrt(_1837);
    float _1841 = rsqrt(_1837);
    float _1843 = -_1839;
    float _1845 = _1843 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1847 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1849 = precise::clamp(_1847, 0.0, 1.0);
    float _1851 = _1827 * _1841;
    float _1853 = _1823 * _1841;
    float _1855 = abs(_1849);
    float _1857 = log2(_1855);
    float _1859 = _1831 * _1841;
    float _1861 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1863 = _1531 * _1853;
    float _1865 = -_1853;
    float _1867 = -_1861;
    float _1869 = fma(_1865, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1867);
    float _1871 = fma(_1523, _1851, _1863);
    float _1873 = -_1859;
    float _1875 = fma(_1873, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1869);
    float _1877 = fma(_1533, _1859, _1871);
    float _1879 = precise::clamp(_1877, 0.0, 1.0);
    float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1883 = _1875 + _1881;
    float _1885 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1887 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1889 = precise::clamp(_1887, 0.0, 1.0);
    float _1891 = exp2(_1885);
    float _1893 = _1891 * _1889;
    float _1895 = _1879 * _1893;
    float _1897 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1899 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1901 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _1897;
    out.m_96.y = _1899;
    out.m_96.z = _1901;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1673 = false;
    bool _205 = false;
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
        float _1958 = as_type<float>(_133);
        out.gl_Position.z = _1958;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2027 = as_type<float>(_169);
        out.gl_Position.z = _2027;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = in.m_60.x;
    float _173 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _175 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _177 = _173 * _171;
    float _179 = trunc(_177);
    int _181 = int(_179);
    int _183 = _181 << 4;
    int _185 = _183 + 1712;
    bool _187 = !_175;
    float _203;
    if (!_187)
    {
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _191 = _171 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_117);
        float _209 = 1.0 / _207;
        float _211 = _151 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = in.m_62.w;
    float _217 = in.m_64.x;
    float _219 = in.m_64.y;
    float _221 = in.m_64.z;
    float _223 = in.m_66.x;
    float _225 = in.m_66.y;
    float _227 = in.m_66.z;
    float _229 = in.m_53.x;
    float _231 = in.m_53.y;
    float _233 = in.m_53.z;
    float _235 = trunc(_215);
    int _237 = int(_235);
    int _239 = _237 << 5;
    uint _242 = uint(int(uint(_239) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_242)];
    float _244 = as_type<float>(_dmw0.x);
    int _246 = _239 + 4;
    uint _248 = uint(int(uint(_246) >> uint(2)));
    float _250 = as_type<float>(_dmw0.y);
    int _252 = _239 + 8;
    uint _254 = uint(int(uint(_252) >> uint(2)));
    float _256 = as_type<float>(_dmw0.z);
    int _258 = _239 + 12;
    uint _260 = uint(int(uint(_258) >> uint(2)));
    float _262 = as_type<float>(_dmw0.w);
    float _264 = _217 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _266 = _219 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = _221 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _270 = _231 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _274 = _264 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _276 = _268 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _278 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[6].x, _270);
    float _280 = _272 * _274;
    float _282 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _284 = _266 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _286 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _227);
    float _288 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[6].z, _278);
    float _290 = _282 * _284;
    float _292 = _231 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _294 = _286 * _276;
    float _296 = _288 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _298 = _290 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _300 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[4].x, _292);
    float _302 = _290 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _304 = _231 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _306 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[10].x, _298);
    float _308 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[4].z, _300);
    float _310 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[8].x, _302);
    float _312 = _290 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _314 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[10].z, _306);
    float _316 = _308 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _318 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[8].z, _310);
    float _320 = fma(_229, (*spvDescriptorSet0.vp_c10)._m0[5].x, _304);
    float _322 = _296 + _314;
    float _324 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[9].x, _312);
    float _326 = _316 + _318;
    float _328 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[5].z, _320);
    float _330 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _332 = _322 + _330;
    float _334 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[9].z, _324);
    float _336 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _338 = _326 + _336;
    float _340 = _328 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _342 = _332 * _332;
    float _344 = _340 + _334;
    float _346 = fma(_338, _338, _342);
    float _348 = sqrt(_346);
    bool _350 = _348 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _352 = _229;
    float _354 = _344;
    float _356 = _326;
    float _358 = _332;
    float _360 = _322;
    if (!_350)
    {
        _352 = _322;
    }
    float _362 = _352;
    float _364 = _262 * 2.0;
    float _366 = _250 * 2.0;
    float _368 = _244 * _364;
    float _370 = -_368;
    float _372 = fma(_256, _366, _370);
    float _374 = fma(_256, _366, _368);
    bool _376 = !_350;
    float _378 = _362;
    if (!_376)
    {
        float _380 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _382 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _384 = _348 + _382;
        float _386 = _344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _388 = rsqrt(_346);
        float _390 = _384 * _380;
        float _392 = _390 * 0.15915493667125701904296875;
        float _394 = _392 * 6.283185482025146484375;
        float _396 = cos(_394);
        float _398 = _392 * 6.283185482025146484375;
        float _400 = sin(_398);
        float _402 = _396 + (-1.0);
        float _404 = _402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _406 = fma(_400, _386, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _408 = fma(_344, _396, _404);
        float _410 = _388 * _406;
        float _412 = fma(_338, _410, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _414 = fma(_332, _410, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _354 = _408;
        _356 = _412;
        _378 = _414;
    }
    float _416 = _354;
    float _418 = _356;
    float _420 = _378;
    float _422 = -_340;
    float _424 = _422 + _416;
    float _426 = _244 * 2.0;
    float _428 = _244 * _244;
    float _430 = -_316;
    float _432 = _430 + _418;
    float _434 = _424 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _436 = _256 * _256;
    float _438 = fma(_428, -2.0, 1.0);
    float _440 = -_296;
    float _442 = _440 + _420;
    float _444 = _424 * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _446 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].y, _434);
    float _448 = _424 * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _450 = _256 * _364;
    float _452 = _250 * _250;
    float _454 = fma(_436, -2.0, _438);
    float _456 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].x, _444);
    float _458 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[6].y, _446);
    float _460 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].z, _448);
    float _462 = -_450;
    float _464 = fma(_250, _426, _462);
    float _466 = fma(_452, -2.0, 1.0);
    float _468 = fma(_250, _426, _450);
    float _470 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[6].x, _456);
    float _472 = _458 * _454;
    float _474 = _250 * _364;
    float _476 = fma(_442, (*spvDescriptorSet0.vp_c10)._m0[6].z, _460);
    float _478 = fma(_436, -2.0, _466);
    float _480 = _458 * _464;
    float _482 = fma(_470, _468, _472);
    float _484 = fma(_256, _426, _474);
    float _486 = -_474;
    float _488 = fma(_256, _426, _486);
    float _490 = _458 * _374;
    float _492 = fma(_470, _478, _480);
    float _494 = fma(_476, _372, _482);
    float _496 = fma(_452, -2.0, _438);
    float _498 = fma(_470, _488, _490);
    float _500 = fma(_476, _484, _492);
    float _502 = _340 + _494;
    float _504 = fma(_476, _496, _498);
    float _506 = _316 + _500;
    float _508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _510 = _502 + _508;
    float _512 = _296 + _504;
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _516 = _506 + _514;
    float _518 = _510 * _510;
    float _520 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _522 = _512 + _520;
    float _524 = fma(_516, _516, _518);
    float _526 = fma(_522, _522, _524);
    float _528 = rsqrt(_526);
    float _530 = sqrt(_526);
    float _532 = _528 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _534 = _516 * _532;
    float _536 = _522 * _532;
    float _538 = _534 * _534;
    float _540 = _536 * _536;
    float _542 = _538 + _540;
    float _544 = sqrt(_542);
    bool _546 = _544 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _548 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _550 = _544 + _548;
    float _552 = _528;
    float _554 = _542;
    float _556 = _550;
    float _558 = _426;
    float _560 = _532;
    if (_546)
    {
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _552 = _562;
    }
    float _564 = _552;
    if (_546)
    {
        float _566 = rsqrt(_542);
        _554 = _566;
    }
    float _568 = _554;
    float _570 = _568;
    if (_546)
    {
        float _572 = _550 * _564;
        _556 = _572;
    }
    float _574 = _556;
    if (_546)
    {
        float _576 = _574 * 0.15915493667125701904296875;
        _358 = _576;
    }
    float _578 = _358;
    float _580 = _564;
    float _582 = _578;
    if (_546)
    {
        float _584 = _578 * 6.283185482025146484375;
        float _586 = sin(_584);
        _580 = _586;
    }
    float _588 = _580;
    float _590 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _592 = precise::max(0.0, _590);
    float _594 = _522;
    if (_546)
    {
        float _596 = _578 * 6.283185482025146484375;
        float _598 = cos(_596);
        _594 = _598;
    }
    float _600 = _594;
    float _602 = -_532;
    float _604 = -_592;
    float _606 = fma(_510, _602, _604);
    if (_546)
    {
        float _608 = _606 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _558 = _608;
    }
    float _610 = _558;
    float _612 = _610;
    if (!_546)
    {
        _582 = _536;
    }
    float _614 = _582;
    float _616 = fma(_316, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _618 = _588;
    float _620 = _614;
    if (_546)
    {
        float _622 = fma(_588, _610, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _360 = _622;
    }
    float _624 = _360;
    float _626 = _624;
    if (!_546)
    {
        _618 = _534;
    }
    float _628 = _618;
    float _630 = floor(_616);
    float _632 = _628;
    float _634 = _600;
    if (_546)
    {
        float _636 = _600 + (-1.0);
        _612 = _636;
    }
    float _638 = _612;
    float _640 = 0.0;
    if (_546)
    {
        float _642 = _568 * _624;
        _640 = _642;
    }
    float _644 = _640;
    if (!_546)
    {
        _626 = _606;
    }
    float _646 = _626;
    float _648 = _646;
    if (_546)
    {
        float _650 = _638 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _560 = _650;
    }
    float _652 = _560;
    if (_546)
    {
        float _654 = _534 * _644;
        _632 = _654;
    }
    float _656 = _632;
    if (!_546)
    {
        _570 = _538;
    }
    float _658 = _570;
    float _660 = _658;
    if (_546)
    {
        float _662 = _536 * _644;
        _620 = _662;
    }
    float _664 = _620;
    if (_546)
    {
        float _666 = fma(_606, _600, _652);
        _648 = _666;
    }
    float _668 = _648;
    if (_546)
    {
        float _670 = _656 * _656;
        _660 = _670;
    }
    float _672 = _660;
    if (!_546)
    {
        _634 = _540;
    }
    float _674 = _634;
    float _676 = _674;
    if (_546)
    {
        float _678 = _664 * _664;
        _676 = _678;
    }
    float _680 = _676;
    float _682 = _502 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _684 = fma(_668, _668, _672);
    float _686 = _502 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _688 = _502 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _690 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[1].x, _682);
    float _692 = _684 + _680;
    float _694 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[2].x, _686);
    float _696 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[0].x, _688);
    float _698 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[1].z, _690);
    float _700 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _702 = fma(_530, (*spvDescriptorSet0.vp_c15)._m0[23].w, _700);
    float _704 = precise::clamp(_702, 0.0, 1.0);
    float _706 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[2].z, _694);
    float _708 = rsqrt(_692);
    float _710 = _502 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _712 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[0].z, _696);
    float _714 = _698 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _716 = _706 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _718 = -_704;
    float _720 = _718 + 1.0;
    float _722 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[3].x, _710);
    float _724 = _712 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _726 = _714 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _728 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _730 = _716 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _732 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[3].z, _722);
    float _734 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _726);
    float _736 = abs(_720);
    float _738 = log2(_736);
    float _740 = -_730;
    float _742 = fma(_740, _728, 1.0);
    float _744 = _732 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _746 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[7].z, _734);
    float _748 = _708 * _656;
    float _750 = _708 * _664;
    float _752 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[7].w, _746);
    float _754 = _708 * _668;
    float _756 = _748 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _758 = fma(_296, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _760 = -_630;
    float _762 = _616 + _760;
    float _764 = _714 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _766 = -_756;
    float _768 = fma(_754, (*spvDescriptorSet0.vp_c15)._m0[21].y, _766);
    float _770 = floor(_758);
    float _772 = _714 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _774 = _738 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _776 = -_750;
    float _778 = fma(_776, (*spvDescriptorSet0.vp_c15)._m0[21].z, _768);
    float _780 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _764);
    float _782 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _772);
    float _784 = fma(_778, -0.5, 0.5);
    float _786 = exp2(_774);
    float _788 = fma(_778, 0.5, 0.5);
    float _790 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[4].z, _780);
    float _792 = fma(_788, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _794 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[4].w, _790);
    float _796 = log2(_742);
    float _798 = -_770;
    float _800 = _758 + _798;
    float _802 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[5].z, _782);
    float _804 = _754 + 1.0;
    float _806 = fma(_788, _792, -0.212114393711090087890625);
    float _808 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[5].w, _802);
    float _810 = 1.0 / _752;
    float _812 = -_754;
    float _814 = fma(_786, _804, _812);
    float _816 = fma(_788, _806, 1.570728778839111328125);
    float _818 = fma(_814, 0.5, 0.5);
    float _820 = sqrt(_784);
    float _822 = _796 * 0.693147182464599609375;
    float2 _3128 = float2(_762, _800);
    float _824 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3128, float2(0.0), isnan(_3128)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3128, float2(0.0), isnan(_3128)), level(0.0)).x;
    float _826 = _822 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _828 = _794 * _810;
    float _830 = _808 * _810;
    float _832 = fma(_828, 0.5, 0.5);
    float _834 = fma(_830, -0.5, 0.5);
    float _836 = _820 * 0.636619746685028076171875;
    float3 _3156 = float3(_832, _834, _826);
    float _838 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3156, float3(0.0), isnan(_3156)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3156, float3(0.0), isnan(_3156)), level(0.0)).x;
    float _840 = -_816;
    float _842 = fma(_836, _840, 1.0);
    float3 _3172 = float3(_832, _834, _826);
    float4 _845 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3172, float3(0.0), isnan(_3172)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3172, float3(0.0), isnan(_3172)), level(0.0)).xyzw;
    float _847 = _845.x;
    float _849 = _845.y;
    float _851 = _845.z;
    float _853 = _845.w;
    float2 _3188 = float2(_842, _818);
    float3 _857 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3188, float2(0.0), isnan(_3188)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3188, float2(0.0), isnan(_3188)), level(0.0)).xyz;
    float _859 = _857.x;
    float _861 = _857.y;
    float _863 = _857.z;
    float _865 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _867 = in.m_60.y;
    bool _869 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _871 = isnan(_213);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = _340 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _883 = _865 * _171;
    float _885 = in.m_68.y;
    float _887 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _889 = trunc(_883);
    int _891 = int(_889);
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _899 = _897 != 0;
    float _901 = in.m_68.x;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _905 = _903 != 0;
    int _907 = _185 + 8;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    uint _911 = uint(int(uint(int(_909)) >> uint(2)));
    int _913 = int(_909) & 3;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[int(_911)][_913];
    float _917 = in.m_60.w;
    float _919 = 1.0 / _895;
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _923 = _921 != 0;
    float _925 = fma(_316, (*spvDescriptorSet0.vp_c8)._m0[11].x, _881);
    float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _929 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[28].x, _927);
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _933 = _931 != 0;
    float _935 = _340 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _937 = _867 > 0.5;
    float _939 = 0.0;
    float _941 = (*spvDescriptorSet0.vp_c8)._m0[28].x;
    bool _943 = _933;
    float _945 = _752;
    if (_899)
    {
        float _947 = in.m_60.z;
        _939 = _947;
    }
    float _949 = _939;
    int _951 = _891 << 4;
    int _953 = _951 + 1968;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _955;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _961 = _213 + _959;
    bool _963 = false;
    if (_905)
    {
        bool _965 = _171 > 0.5;
        _963 = _965;
    }
    bool _967 = _963;
    uint _969 = uint(int(uint(_953) >> uint(2)));
    uint _971 = uint(int(uint(int(_969)) >> uint(2)));
    int _973 = int(_969) & 3;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[int(_971)][_973];
    int _977 = int(_969) + 1;
    uint _979 = uint(int(uint(_977) >> uint(2)));
    int _981 = _977 & 3;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[int(_979)][_981];
    bool _985 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _987 = isnan(_213);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = -_879;
    float _999 = _997 + 1.0;
    float _1001 = -_885;
    float _1003 = _1001 + 1.0;
    float _1005 = _957 * _919;
    float _1007 = _995 * _999;
    float _1009 = _1005;
    int _1011 = as_type<int>(_901);
    int _1013 = as_type<int>(_1007);
    float _1015 = _885;
    float _1017 = (*spvDescriptorSet0.vp_c8)._m0[28].z;
    if (!_905)
    {
        _941 = _901;
    }
    float _1019 = _941;
    int _1021 = _953 + 8;
    uint _1023 = uint(int(uint(_1021) >> uint(2)));
    uint _1025 = uint(int(uint(int(_1023)) >> uint(2)));
    int _1027 = int(_1023) & 3;
    float _1029 = (*spvDescriptorSet0.vp_c9)._m0[int(_1025)][_1027];
    float _1031 = fma(_1005, _961, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1033 = -_995;
    float _1035 = _1033 + 1.0;
    bool _1037 = _917 > 0.5;
    float _1039 = fma(_296, (*spvDescriptorSet0.vp_c8)._m0[11].z, _925);
    float _1041 = _1031 * _1007;
    float _1043 = _1019;
    if (!_905)
    {
        _1009 = _1019;
    }
    float _1045 = _1009;
    float _1047 = in.m_70.x;
    float _1049 = in.m_70.y;
    float _1051 = in.m_70.z;
    float _1053 = _1045;
    if (_905)
    {
        _1043 = _901;
    }
    float _1055 = _1043;
    float _1057 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1041);
    float _1059 = _1037 ? _1003 : _885;
    uint _1061 = uint(int(uint(_185) >> uint(2)));
    uint _1063 = uint(int(uint(int(_1061)) >> uint(2)));
    int _1065 = int(_1061) & 3;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[int(_1063)][_1065];
    int _1069 = int(_1061) + 1;
    uint _1071 = uint(int(uint(_1069) >> uint(2)));
    int _1073 = _1069 & 3;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[int(_1071)][_1073];
    bool _1077 = _225 != 0.0;
    bool _1079 = isnan(_225);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan(0.0);
    bool _1085 = _1081 || _1083;
    float _1087 = _1055;
    float _1089 = _1059;
    if (_905)
    {
        float _1091 = -_1055;
        float _1093 = _1091 + 1.0;
        _1011 = as_type<int>(_1093);
    }
    int _1095 = _1011;
    float _1097 = _933 ? _1059 : _885;
    if (_899)
    {
        float _1099 = -_1055;
        float _1101 = _1099 + 1.0;
        _1013 = as_type<int>(_1101);
    }
    int _1103 = _1013;
    float _1105 = _949;
    if (_899)
    {
        bool _1107 = _949 > 0.5;
        _943 = _1107;
    }
    bool _1109 = _943;
    float _1111 = fma(_316, (*spvDescriptorSet0.vp_c8)._m0[10].x, _935);
    bool _1113 = _223 == 0.0;
    bool _1115 = !_1085;
    bool _1117 = _1113 && _1115;
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1121 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1119);
    if (_923)
    {
        float _1123 = _937 ? _1003 : _885;
        _1015 = _1123;
    }
    float _1125 = _1015;
    float _1127 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1057);
    if (_905)
    {
        float _1129 = _967 ? as_type<float>(_1095) : _1055;
        _1053 = _1129;
    }
    float _1131 = _1053;
    float _1133 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_899)
    {
        float _1135 = _1109 ? as_type<float>(_1103) : _1055;
        _1087 = _1135;
    }
    float _1137 = _1087;
    float _1139 = _714 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1141 = _227 == 0.0;
    bool _1143 = _1141 && _1117;
    float _1145 = _738 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1147 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1149 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1139);
    float _1151 = exp2(_1145);
    float _1153 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1149);
    float _1155 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1153);
    float _1157 = 0.0;
    float _1159 = _1155;
    if (_1143)
    {
        _1157 = _1051;
    }
    float _1161 = _1157;
    float _1163 = _975 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1165 = _983 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1167 = 0.0;
    float _1169 = _1163;
    float _1171 = _1161;
    if (_1143)
    {
        _1167 = _1047;
    }
    float _1173 = _1167;
    float _1175 = in.m_72.x;
    float _1177 = in.m_72.y;
    float _1179 = in.m_72.z;
    float _1181 = in.m_72.w;
    float _1183 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1185 = _1173;
    if (_1143)
    {
        _1017 = _1049;
    }
    float _1187 = _1017;
    float _1189 = _1187;
    if (_1143)
    {
        _1169 = _1161;
    }
    float _1191 = _1169;
    float _1193 = _1029 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1195 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1197 = _1191;
    if (_1143)
    {
        _1105 = _1173;
    }
    float _1199 = _1105;
    float _1201 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1203 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1205 = _1199;
    if (!_1143)
    {
        _1171 = _1051;
    }
    float _1207 = _1171;
    float _1209 = fma(_296, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1111);
    if (!_1143)
    {
        _1185 = _1047;
    }
    float _1211 = _1185;
    float _1213 = 1.0 / _1203;
    if (_1143)
    {
        _1089 = _1187;
    }
    float _1215 = _1089;
    out.m_74.x = _1183;
    out.m_74.y = _1195;
    out.m_74.z = _1201;
    float _1217 = _1215;
    if (!_1143)
    {
        _1189 = _1049;
    }
    float _1219 = _1189;
    float _1221 = _1209 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    if (!_1143)
    {
        float _1223 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1211);
        _1205 = _1223;
    }
    float _1225 = _1205;
    if (!_1143)
    {
        float _1227 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1207);
        _1197 = _1227;
    }
    float _1229 = _1197;
    float _1231 = _915 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (!_1143)
    {
        float _1233 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1219);
        _1217 = _1233;
    }
    float _1235 = _1217;
    float _1237 = _1221 + _1203;
    float _1239 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1241 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1243 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1247 = _1179 * _1211;
    float _1249 = fma(_1175, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1239);
    float _1251 = fma(_1175, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1241);
    float _1253 = fma(_1175, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1243);
    float _1255 = -_1247;
    float _1257 = fma(_1175, _1207, _1255);
    float _1259 = _1175 * _1219;
    float _1261 = _1237 * _1213;
    float _1263 = _1261 * 0.5;
    float _1265 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1267 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1269 = -_1259;
    float _1271 = fma(_1177, _1211, _1269);
    float _1273 = _1177 * _1207;
    float _1275 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1279 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1283 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1281);
    float _1285 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1289 = _1127 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1291 = fma(_1179, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1249);
    float _1293 = fma(_1179, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1251);
    float _1295 = 1.0 / _1283;
    float _1297 = fma(_1179, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1253);
    out.m_76.x = _1279;
    out.m_76.y = _1285;
    out.m_76.z = _1287;
    out.m_76.w = _1289;
    float _1299 = -_1273;
    float _1301 = fma(_1179, _1219, _1299);
    float _1303 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1305 = _1257 * _1181;
    float _1307 = _1133 * _1245;
    float _1309 = _1301 * _1181;
    float _1311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1313 = _1275 * _1277;
    float _1315 = _1271 * _1181;
    float _1317 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1319 = _1293 * _454;
    bool _1321 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1323 = isnan(0.0);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1329 = _1325 || _1327;
    float _1331 = fma(_1309, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1317);
    float _1333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1335 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1337 = _1295 * _1335;
    float _1339 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1341 = fma(_1315, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1331);
    float _1343 = _1293 * _464;
    float _1345 = _1293 * _374;
    float _1347 = fma(_1309, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1339);
    float _1349 = abs(_1337);
    float _1351 = log2(_1349);
    float _1353 = _1303 * _1311;
    float _1355 = fma(_1291, _478, _1343);
    float _1357 = fma(_1291, _488, _1345);
    float _1359 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1361 = _1147 * _1333;
    float _1363 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1365 = fma(_1315, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1347);
    float _1367 = _1341 * _454;
    float _1369 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    out.m_78.x = _1313;
    out.m_78.y = _1353;
    out.m_78.z = _1361;
    out.m_78.w = _1307;
    float _1371 = fma(_1309, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1363);
    float _1373 = fma(_1291, _468, _1319);
    float _1375 = fma(_1225, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1359);
    float _1377 = fma(_1225, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1369);
    float _1379 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1381 = _1337 <= 8000.0;
    bool _1383 = isnan(_1337);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan(8000.0);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = fma(_1229, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1375);
    float _1395 = fma(_1225, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1379);
    float _1397 = _1393 * _454;
    float _1399 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1401 = fma(_1315, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1371);
    float _1403 = _1341 * _464;
    float _1405 = _1341 * _374;
    float _1407 = fma(_1297, _484, _1355);
    float _1409 = fma(_1401, _468, _1367);
    float _1411 = exp2(_1399);
    float _1413 = fma(_1401, _478, _1403);
    float _1415 = fma(_1401, _488, _1405);
    float _1417 = fma(_1297, _372, _1373);
    float _1419 = fma(_1297, _496, _1357);
    float _1421 = fma(_1365, _484, _1413);
    float _1423 = fma(_1365, _372, _1409);
    float _1425 = fma(_1365, _496, _1415);
    float _1427 = fma(_1229, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1377);
    out.m_80.x = _1407;
    out.m_80.y = _1417;
    out.m_80.z = _1419;
    float _1429 = _1393 * _374;
    float _1431 = _1393 * _464;
    float _1433 = fma(_1229, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1395);
    out.m_82.x = _1421;
    out.m_82.y = _1423;
    out.m_82.z = _1425;
    float _1435 = fma(_1427, _488, _1429);
    float _1437 = fma(_1411, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1439 = precise::clamp(_1437, 0.0, 1.0);
    float _1441 = fma(_1427, _478, _1431);
    float _1443 = in.m_84.x;
    float _1445 = fma(_1427, _468, _1397);
    float _1447 = fma(_1439, -2.0, 3.0);
    float _1449 = _1439 * _1439;
    float _1451 = _1155 + _752;
    float _1453 = _1419;
    if (!_1329)
    {
        _1453 = 1.0;
    }
    float _1455 = _1453;
    float _1457 = _1449 * _1447;
    float _1459 = _1451 * 0.5;
    float _1461 = -_1457;
    float _1463 = _1461 + 1.0;
    float _1465 = fma(_1463, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1457);
    bool _1467 = !_1329;
    float _1469 = _1455;
    float _1471 = _752;
    float _1473 = _1459;
    if (!_1467)
    {
        float _1475 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        float _1477 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1121);
        float _1479 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _929);
        float _1481 = precise::min(_1475, 20.0);
        float _1483 = _296 + _1477;
        float _1485 = _316 + _1479;
        float _1487 = -_1483;
        float _1489 = _1487 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
        float _1491 = 1.0 / _1481;
        float _1493 = -_1485;
        float _1495 = _1493 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
        float _1497 = precise::min(_1483, _1489);
        float _1499 = precise::min(_1485, _1495);
        float _1501 = precise::min(_1497, _1499);
        float _1503 = _1501 * _1491;
        float _1505 = precise::clamp(_1503, 0.0, 1.0);
        _1469 = _1505;
    }
    float _1507 = _1469;
    float _1509 = _1391 * _1465;
    float _1511 = -_1151;
    float _1513 = _1511 + 1.0;
    float _1515 = -_824;
    float _1517 = _1515 + 1.0;
    float _1519 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1521 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _794;
    out.gl_Position.y = _808;
    out.gl_Position.z = _1155;
    out.gl_Position.w = _752;
    float _1523 = fma(_1433, _484, _1441);
    float _1525 = _1517 * _1519;
    float _1527 = precise::clamp(_1525, 0.0, 1.0);
    float _1529 = _1521 * _838;
    float _1531 = fma(_1433, _372, _1445);
    float _1533 = fma(_1433, _496, _1435);
    float _1535 = -_1527;
    float _1537 = fma(_1535, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1539 = _863 * _1529;
    out.m_86.x = _506;
    out.m_86.y = _502;
    out.m_86.z = _512;
    bool _1541 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1543 = isnan(_530);
    bool _1545 = _1541 || _1543;
    bool _1547 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1549 = _1545 || _1547;
    float _1551 = _1537 * _1443;
    float _1553 = fma(_853, _1539, _851);
    out.m_88.x = _1523;
    out.m_88.y = _1531;
    out.m_88.z = _1533;
    float _1555 = _853 * _1529;
    float _1557 = -_1521;
    float _1559 = _1557 + 1.0;
    float _1561 = _1551 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_90.z = _1459;
    out.m_90.w = _752;
    float _1563 = fma(_859, _1555, _847);
    float _1565 = fma(_861, _1555, _849);
    float _1567 = _853 * _1559;
    out.m_92.x = _1561;
    float _1569 = _1507 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1571 = _1555;
    float _1573 = _1559;
    if (!_1549)
    {
        _945 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1575 = _945;
    out.m_94.x = _1563;
    out.m_94.y = _1565;
    out.m_94.z = _1553;
    out.m_94.w = _1567;
    float _1577 = _1575;
    float _1579 = _1575;
    if (!_1549)
    {
        _1159 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1581 = _1159;
    float _1583 = _1581;
    float _1585 = _1581;
    if (!_1549)
    {
        _1471 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1587 = _1471;
    float _1589 = _1587;
    float _1591 = _1587;
    if (!_1549)
    {
        _1473 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1593 = _1473;
    float _1595 = _1593;
    float _1597 = _1593;
    if (!_1549)
    {
        _1571 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1599 = _1571;
    float _1601 = _1599;
    float _1603 = _1599;
    if (!_1549)
    {
        _1573 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1605 = _1573;
    bool _1607 = !_1549;
    float _1609 = _1605;
    float _1611 = _1605;
    if (!_1607)
    {
        bool _1613 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1615 = isnan(_530);
        bool _1617 = _1613 || _1615;
        bool _1619 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1621 = _1617 || _1619;
        if (!_1621)
        {
            float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1625 = _530 + _1623;
            float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1629 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1627;
            float _1631 = 1.0 / _1629;
            float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1635 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1637 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1639 = _1637 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1643 = _1641 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1645 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1647 = _1645 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1649 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1651 = _1649 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1653 = _1625 * _1631;
            float _1655 = precise::clamp(_1653, 0.0, 1.0);
            float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1659 = _1657 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1661 = fma(_1655, _1635, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1663 = fma(_1655, _1659, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1665 = fma(_1655, _1639, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1667 = fma(_1655, _1643, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1669 = fma(_1655, _1647, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1671 = fma(_1655, _1651, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1597 = _1663;
            _1603 = _1669;
            _1591 = _1661;
            _1585 = _1667;
            _1579 = _1665;
            _1611 = _1671;
            _1673 = true;
        }
        else
        {
            bool _1675 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1677 = isnan(_530);
            bool _1679 = _1675 || _1677;
            bool _1681 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1683 = _1679 || _1681;
            if (!_1683)
            {
                _1589 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1685 = _1589;
            _1591 = _1685;
            if (!_1683)
            {
                _1595 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1687 = _1595;
            _1597 = _1687;
            if (!_1683)
            {
                _1577 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1689 = _1577;
            _1579 = _1689;
            if (!_1683)
            {
                _1583 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1691 = _1583;
            _1585 = _1691;
            if (!_1683)
            {
                _1601 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1693 = _1601;
            _1603 = _1693;
            if (!_1683)
            {
                _1609 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1695 = _1609;
            bool _1697 = !_1683;
            _1611 = _1695;
            if (!_1697)
            {
                bool _1699 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1701 = isnan(_530);
                bool _1703 = _1699 || _1701;
                bool _1705 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1707 = _1703 || _1705;
                if (!_1707)
                {
                    float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1711 = _530 + _1709;
                    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1715 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1713;
                    float _1717 = 1.0 / _1715;
                    float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1721 = _1719 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1725 = _1723 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1727 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1729 = _1727 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1731 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1733 = _1731 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1735 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1737 = _1735 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1739 = _1711 * _1717;
                    float _1741 = precise::clamp(_1739, 0.0, 1.0);
                    float _1743 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1745 = _1743 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1747 = fma(_1741, _1721, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1749 = fma(_1741, _1745, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1751 = fma(_1741, _1725, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1753 = fma(_1741, _1729, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1755 = fma(_1741, _1733, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1757 = fma(_1741, _1737, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1597 = _1749;
                    _1603 = _1755;
                    _1591 = _1747;
                    _1585 = _1753;
                    _1579 = _1751;
                    _1611 = _1757;
                    _1673 = true;
                }
                else
                {
                    _1597 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1603 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1591 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1585 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1579 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1611 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1673 = false;
    float _1759 = _1597;
    float _1761 = _1603;
    float _1763 = _1591;
    float _1765 = _1585;
    float _1767 = _1579;
    float _1769 = _1611;
    float _1771 = fma(_1531, -0.5, 0.5);
    float _1773 = precise::clamp(_1771, 0.0, 1.0);
    float _1775 = -_1759;
    float _1777 = _1775 + _1761;
    float _1779 = -_1763;
    float _1781 = _1779 + _1765;
    float _1783 = -_1767;
    float _1785 = _1783 + _1769;
    bool _1787 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1789 = fma(_1773, _1777, _1759);
    float _1791 = fma(_1773, _1781, _1763);
    float _1793 = fma(_1773, _1785, _1767);
    float _1795 = _1569 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1797 = _1789 * 0.586610972881317138671875;
    out.m_96.x = 0.0;
    float _1799 = fma(_1791, 0.298911988735198974609375, _1797);
    out.m_92.w = _1795;
    float _1801 = fma(_1793, 0.114477999508380889892578125, _1799);
    out.m_56.x = 1.0;
    float _1803 = -_1801;
    float _1805 = _1791 + _1803;
    float _1807 = -_1801;
    float _1809 = _1789 + _1807;
    float _1811 = -_1801;
    float _1813 = _1793 + _1811;
    float _1815 = fma(_1805, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1801);
    float _1817 = fma(_1809, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1801);
    float _1819 = fma(_1813, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1801);
    out.m_98.x = _1815;
    out.m_98.y = _1817;
    out.m_98.z = _1819;
    if (!_1787)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1821 = -_502;
    float _1823 = _1821 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1825 = -_506;
    float _1827 = _1825 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1829 = -_512;
    float _1831 = _1829 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1833 = _1823 * _1823;
    float _1835 = fma(_1827, _1827, _1833);
    float _1837 = fma(_1831, _1831, _1835);
    float _1839 = sqrt(_1837);
    float _1841 = rsqrt(_1837);
    float _1843 = -_1839;
    float _1845 = _1843 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1847 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1849 = precise::clamp(_1847, 0.0, 1.0);
    float _1851 = _1827 * _1841;
    float _1853 = _1823 * _1841;
    float _1855 = abs(_1849);
    float _1857 = log2(_1855);
    float _1859 = _1831 * _1841;
    float _1861 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1863 = _1531 * _1853;
    float _1865 = -_1853;
    float _1867 = -_1861;
    float _1869 = fma(_1865, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1867);
    float _1871 = fma(_1523, _1851, _1863);
    float _1873 = -_1859;
    float _1875 = fma(_1873, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1869);
    float _1877 = fma(_1533, _1859, _1871);
    float _1879 = precise::clamp(_1877, 0.0, 1.0);
    float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1883 = _1875 + _1881;
    float _1885 = _1857 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1887 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1889 = precise::clamp(_1887, 0.0, 1.0);
    float _1891 = exp2(_1885);
    float _1893 = _1891 * _1889;
    float _1895 = _1879 * _1893;
    float _1897 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1899 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1901 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _1897;
    out.m_96.y = _1899;
    out.m_96.z = _1901;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

