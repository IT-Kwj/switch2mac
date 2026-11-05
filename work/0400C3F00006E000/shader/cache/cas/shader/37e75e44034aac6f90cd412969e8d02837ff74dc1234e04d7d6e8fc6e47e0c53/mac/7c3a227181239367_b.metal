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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
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
    float4 m_75 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_89 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_73 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 m_85 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1583 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = in.m_46.w;
    float _107 = trunc(_103);
    int _110 = int(_107);
    float _112 = -_105;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _114;
    bool _118 = _110 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (!_118)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_118)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1897 = as_type<float>(_128);
        out.gl_Position.z = _1897;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _132 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_105);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = float(_110);
    bool _144 = _114 >= _142;
    bool _146 = !_140;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_51.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _130 = as_type<int>(_154);
    }
    int _156 = _130;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1953 = as_type<float>(_156);
        out.gl_Position.z = _1953;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_53.w;
    float _160 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_46.x;
    float _174 = in.m_46.y;
    float _176 = in.m_46.z;
    float _178 = in.m_44.x;
    float _180 = in.m_44.y;
    float _182 = in.m_44.z;
    float _184 = 0.0;
    float _186 = _160;
    if (!_170)
    {
        float _188 = _160 * _160;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_170)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    bool _200 = !_170;
    float _202 = _198;
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _160 * _206;
        float _216 = exp2(_214);
        float _218 = _212 * 0.693147182464599609375;
        float _220 = 1.0 / _218;
        float _222 = 1.0 / _210;
        float _224 = _216 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _220, _160);
        float _230 = _228 * _222;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _232;
    }
    float _234 = _202;
    bool _236 = !_170;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _160 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _186 = _256;
    }
    float _258 = _186;
    float _260 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _264 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_258, _174, _260);
    float _268 = fma(_258, _172, _262);
    float _270 = fma(_258, _176, _264);
    float _272 = fma(_266, _158, _180);
    float _274 = fma(_268, _158, _178);
    float _276 = fma(_270, _158, _182);
    float _278 = in.m_55.x;
    float _280 = in.m_55.y;
    float _282 = in.m_55.z;
    float _284 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _286 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _288 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _290 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _284);
    float _292 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _286);
    float _294 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _288);
    float _296 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _290);
    float _298 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _292);
    float _300 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _294);
    float _302 = _296 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _304 = _298 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _306 = _300 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _308 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _310 = _302 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _314 = _304 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _318 = _306 + _316;
    float _320 = _310 * _310;
    float _322 = fma(_314, _314, _320);
    float _324 = fma(_318, _318, _322);
    float _326 = rsqrt(_324);
    float _328 = _310 * _326;
    float _330 = _314 * _326;
    float _332 = _318 * _326;
    float _334 = -_328;
    float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[18].w, _310);
    float _338 = -_330;
    float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _314);
    float _342 = -_332;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[18].w, _318);
    float _346 = in.m_53.x;
    float _348 = in.m_53.y;
    float _350 = in.m_53.z;
    float _352 = _336 * _336;
    float _354 = fma(_340, _340, _352);
    float _356 = fma(_344, _344, _354);
    float _358 = sqrt(_356);
    float _360 = _348 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _362 = _346 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _364 = _350 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _366 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _368 = _326 * _358;
    float _370 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _280);
    float _372 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _374 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _278);
    float _376 = _368 * _366;
    float _378 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _380 = _368 * _372;
    float _382 = _370 * _376;
    float _384 = _368 * _378;
    float _386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _282);
    float _388 = _374 * _380;
    float _390 = _382 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _392 = _382 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _394 = _386 * _384;
    float _396 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[10].x, _390);
    float _398 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[8].x, _392);
    float _400 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[10].z, _396);
    float _402 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[8].z, _398);
    float _404 = _306 + _400;
    float _406 = _304 + _402;
    float _408 = _382 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _410 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _412 = _404 + _410;
    float _414 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _416 = _406 + _414;
    float _418 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[9].x, _408);
    float _420 = _412 * _412;
    float _422 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[9].z, _418);
    float _424 = fma(_416, _416, _420);
    float _426 = _302 + _422;
    float _428 = sqrt(_424);
    bool _430 = _428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _432 = _420;
    float _434 = _382;
    float _436 = _418;
    float _438 = _416;
    float _440 = _412;
    if (!_430)
    {
        _432 = _406;
    }
    float _442 = _432;
    float _444 = _442;
    if (!_430)
    {
        _434 = _404;
    }
    float _446 = _434;
    float _448 = _446;
    if (!_430)
    {
        _436 = _426;
    }
    float _450 = _436;
    bool _452 = !_430;
    float _454 = _450;
    if (!_452)
    {
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _458 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _460 = _428 + _458;
        float _462 = _426 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _464 = rsqrt(_424);
        float _466 = _460 * _456;
        float _468 = _466 * 0.15915493667125701904296875;
        float _470 = _468 * 6.283185482025146484375;
        float _472 = sin(_470);
        float _474 = _468 * 6.283185482025146484375;
        float _476 = cos(_474);
        float _478 = fma(_472, _462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _480 = _464 * _478;
        float _482 = _476 + (-1.0);
        float _484 = _482 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _486 = fma(_416, _480, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _488 = fma(_412, _480, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _490 = fma(_426, _476, _484);
        _454 = _490;
        _444 = _486;
        _448 = _488;
    }
    float _492 = _454;
    float _494 = _444;
    float _496 = _448;
    float _498 = -_328;
    float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _502 = -_330;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _494);
    float _506 = -_332;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _510 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _512 = _500 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _516 = _504 + _514;
    float _518 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _520 = _508 + _518;
    float _522 = _512 * _512;
    float _524 = fma(_516, _516, _522);
    float _526 = fma(_520, _520, _524);
    float _528 = rsqrt(_526);
    float _530 = sqrt(_526);
    float _532 = _528 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _534 = _516 * _532;
    float _536 = _520 * _532;
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
    float _558 = _512;
    if (_546)
    {
        float _560 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _552 = _560;
    }
    float _562 = _552;
    if (_546)
    {
        float _564 = rsqrt(_542);
        _554 = _564;
    }
    float _566 = _554;
    float _568 = _566;
    if (_546)
    {
        float _570 = _550 * _562;
        _556 = _570;
    }
    float _572 = _556;
    if (_546)
    {
        float _574 = _572 * 0.15915493667125701904296875;
        _438 = _574;
    }
    float _576 = _438;
    float _578 = _520;
    if (_546)
    {
        float _580 = _576 * 6.283185482025146484375;
        float _582 = sin(_580);
        _578 = _582;
    }
    float _584 = _578;
    float _586 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _588 = precise::max(0.0, _586);
    float _590 = _562;
    float _592 = _588;
    if (_546)
    {
        float _594 = _576 * 6.283185482025146484375;
        float _596 = cos(_594);
        _590 = _596;
    }
    float _598 = _590;
    float _600 = -_532;
    float _602 = -_588;
    float _604 = fma(_512, _600, _602);
    if (_546)
    {
        float _606 = _604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _558 = _606;
    }
    float _608 = _558;
    float _610 = _500 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _612 = _608;
    float _614 = _584;
    if (_546)
    {
        float _616 = fma(_584, _608, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _612 = _616;
    }
    float _618 = _612;
    float _620 = _618;
    if (!_546)
    {
        _614 = _534;
    }
    float _622 = _614;
    float _624 = _622;
    float _626 = _598;
    if (_546)
    {
        float _628 = _598 + (-1.0);
        _592 = _628;
    }
    float _630 = _592;
    float _632 = 0.0;
    float _634 = _630;
    if (_546)
    {
        float _636 = _566 * _618;
        _632 = _636;
    }
    float _638 = _632;
    if (!_546)
    {
        _620 = _604;
    }
    float _640 = _620;
    float _642 = _640;
    if (_546)
    {
        float _644 = _630 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _440 = _644;
    }
    float _646 = _440;
    if (_546)
    {
        float _648 = _534 * _638;
        _624 = _648;
    }
    float _650 = _624;
    if (!_546)
    {
        _634 = _536;
    }
    float _652 = _634;
    float _654 = _652;
    if (_546)
    {
        float _656 = _536 * _638;
        _654 = _656;
    }
    float _658 = _654;
    if (!_546)
    {
        _568 = _538;
    }
    float _660 = _568;
    float _662 = _660;
    if (_546)
    {
        float _664 = fma(_604, _598, _646);
        _642 = _664;
    }
    float _666 = _642;
    if (_546)
    {
        float _668 = _650 * _650;
        _662 = _668;
    }
    float _670 = _662;
    if (!_546)
    {
        _626 = _540;
    }
    float _672 = _626;
    float _674 = _672;
    if (_546)
    {
        float _676 = _658 * _658;
        _674 = _676;
    }
    float _678 = _674;
    float _680 = fma(_666, _666, _670);
    float _682 = _500 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _684 = _680 + _678;
    float _686 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _688 = fma(_530, (*spvDescriptorSet0.vp_c15)._m0[23].w, _686);
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[2].x, _610);
    float _694 = _500 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _696 = rsqrt(_684);
    float _698 = -_690;
    float _700 = _698 + 1.0;
    float _702 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[2].z, _692);
    float _704 = _500 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _706 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[1].x, _694);
    float _708 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[3].x, _682);
    float _710 = _702 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _712 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[0].x, _704);
    float _714 = abs(_700);
    float _716 = log2(_714);
    float _718 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[1].z, _706);
    float _720 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[3].z, _708);
    float _722 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[0].z, _712);
    float _724 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _726 = _718 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _728 = _710 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _730 = _722 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _732 = _696 * _650;
    float _734 = _726 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _736 = _696 * _666;
    float _738 = _696 * _658;
    float _740 = _732 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _742 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[7].x, _734);
    float _744 = _720 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _746 = -_728;
    float _748 = fma(_746, _724, 1.0);
    float _750 = _716 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _752 = -_740;
    float _754 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[21].y, _752);
    float _756 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[7].z, _742);
    float _758 = log2(_748);
    float _760 = -_738;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c15)._m0[21].z, _754);
    float _764 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[7].w, _756);
    float _766 = _726 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _768 = _726 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _770 = fma(_762, -0.5, 0.5);
    float _772 = fma(_762, 0.5, 0.5);
    float _774 = exp2(_750);
    float _776 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[4].x, _766);
    float _778 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[5].x, _768);
    float _780 = _736 + 1.0;
    float _782 = fma(_772, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _784 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[4].z, _776);
    float _786 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[5].z, _778);
    float _788 = 1.0 / _764;
    float _790 = fma(_772, _782, -0.212114393711090087890625);
    float _792 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[4].w, _784);
    float _794 = _758 * 0.693147182464599609375;
    float _796 = fma(_772, _790, 1.570728778839111328125);
    float _798 = _794 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _800 = sqrt(_770);
    float _802 = -_736;
    float _804 = fma(_774, _780, _802);
    float _806 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[5].w, _786);
    float _808 = fma(_804, 0.5, 0.5);
    float _810 = _792 * _788;
    float _812 = _806 * _788;
    float _814 = fma(_810, 0.5, 0.5);
    float _816 = fma(_812, -0.5, 0.5);
    float _818 = _800 * 0.636619746685028076171875;
    float3 _3053 = float3(_814, _816, _798);
    float _820 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3053, float3(0.0), isnan(_3053)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3053, float3(0.0), isnan(_3053)), level(0.0)).x;
    float3 _3064 = float3(_814, _816, _798);
    float4 _823 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3064, float3(0.0), isnan(_3064)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3064, float3(0.0), isnan(_3064)), level(0.0)).xyzw;
    float _825 = _823.x;
    float _827 = _823.y;
    float _829 = _823.z;
    float _831 = _823.w;
    float _833 = -_796;
    float _835 = fma(_818, _833, 1.0);
    float2 _3086 = float2(_835, _808);
    float3 _839 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3086, float2(0.0), isnan(_3086)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3086, float2(0.0), isnan(_3086)), level(0.0)).xyz;
    float _841 = _839.x;
    float _843 = _839.y;
    float _845 = _839.z;
    float _847 = in.m_57.y;
    float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _851 = in.m_59.y;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _855 = _853 != 0;
    float _857 = -_328;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[18].w, _302);
    float _861 = in.m_57.x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _865 = in.m_57.z;
    float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _871 = in.m_59.x;
    float _873 = -_330;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _879 = _877 != 0;
    float _881 = -_332;
    float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[18].w, _306);
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _889 = _887 != 0;
    float _891 = _847 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _893 = _847 > 0.5;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _897 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[78].w, _885);
    float _899 = fma(_891, -2.0, _863);
    float _901 = -_851;
    float _903 = _901 + 1.0;
    float _905 = _867 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _909 = _907 != 0;
    float _911 = _861 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _915 = _913 != 0;
    float _917 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _899);
    float _919 = _893 ? _903 : _851;
    float _921 = -_869;
    float _923 = fma(_911, 2.0, _921);
    float _925 = _911;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _929 = _919;
    float _931 = _861;
    float _933 = _814;
    float _935 = _851;
    float _937 = _871;
    float _939 = _764;
    if (_855)
    {
        _925 = _865;
    }
    float _941 = _925;
    float _943 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[88].w, _895);
    float _945 = _879 ? _919 : _851;
    float _947 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _897);
    float _949 = _941;
    if (_855)
    {
        _927 = _941;
    }
    float _951 = _927;
    float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _955 = _951;
    if (!_855)
    {
        _949 = _865;
    }
    float _957 = _949;
    float _959 = fma(_905, _945, -0.5);
    if (_855)
    {
        _929 = _847;
    }
    float _961 = _929;
    float _963 = _716 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _965 = _961;
    if (!_855)
    {
        _955 = _847;
    }
    float _967 = _955;
    float _969 = -_917;
    float _971 = fma(_947, _959, _969);
    float _973 = in.m_61.x;
    float _975 = in.m_61.y;
    float _977 = in.m_61.z;
    float _979 = _726 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _983 = _280 != 0.0;
    bool _985 = isnan(_280);
    bool _987 = _983 || _985;
    bool _989 = isnan(0.0);
    bool _991 = _987 || _989;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    int _995 = as_type<int>(_967);
    float _997 = _993;
    if (!_855)
    {
        _965 = _861;
    }
    float _999 = _965;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1003 = false;
    int _1005 = as_type<int>(_999);
    float _1007 = _1001;
    if (_889)
    {
        bool _1009 = _861 > 0.5;
        _1003 = _1009;
    }
    bool _1011 = _1003;
    float _1013 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[78].z, _981);
    float _1015 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[89].z, _993);
    float _1017 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1001);
    if (_889)
    {
        float _1019 = -_871;
        float _1021 = _1019 + 1.0;
        _995 = as_type<int>(_1021);
    }
    int _1023 = _995;
    if (!_855)
    {
        _931 = _957;
    }
    float _1025 = _931;
    float _1027 = _999 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1029 = _957 > 0.5;
    if (_909)
    {
        float _1031 = -_871;
        float _1033 = _1031 + 1.0;
        _1005 = as_type<int>(_1033);
    }
    int _1035 = _1005;
    bool _1037 = _278 == 0.0;
    bool _1039 = !_991;
    bool _1041 = _1037 && _1039;
    float _1043 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1015);
    float _1045 = as_type<float>(_1035);
    if (!_889)
    {
        _933 = _871;
    }
    float _1047 = _933;
    float _1049 = exp2(_963);
    float _1051 = _1047;
    if (_889)
    {
        float _1053 = _1011 ? as_type<float>(_1023) : _871;
        _1051 = _1053;
    }
    float _1055 = _1051;
    float _1057 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[6].x, _979);
    if (_915)
    {
        float _1059 = _1029 ? _903 : _851;
        _935 = _1059;
    }
    float _1061 = _935;
    float _1063 = in.m_63.w;
    float _1065 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1057);
    bool _1067 = _282 == 0.0;
    bool _1069 = _1067 && _1041;
    float _1071 = in.m_65.x;
    float _1073 = in.m_65.y;
    float _1075 = in.m_65.z;
    float _1077 = in.m_65.w;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_909)
    {
        float _1081 = _893 ? as_type<float>(_1035) : _871;
        _937 = _1081;
    }
    float _1083 = _937;
    float _1085 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1017);
    float _1087 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[87].w, _943);
    float _1089 = fma(_1027, -2.0, _1079);
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1095 = -_1049;
    float _1097 = _1095 + 1.0;
    out.m_67.x = _504;
    out.m_67.y = _500;
    out.m_67.z = _508;
    bool _1099 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1101 = isnan(_530);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1107 = _1103 || _1105;
    float _1109 = 0.0;
    if (_1069)
    {
        _1109 = _975;
    }
    float _1111 = _1109;
    float _1113 = 0.0;
    float _1115 = _1111;
    if (_1069)
    {
        _1113 = _973;
    }
    float _1117 = _1113;
    float _1119 = 0.0;
    float _1121 = _1117;
    if (_1069)
    {
        _1119 = _977;
    }
    float _1123 = _1119;
    float _1125 = _1123;
    if (_1069)
    {
        _1007 = _1111;
    }
    float _1127 = _1007;
    out.m_69.w = _1063;
    float _1129 = _1127;
    if (!_1069)
    {
        _1115 = _975;
    }
    float _1131 = _1115;
    float _1133 = _1025 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_1069)
    {
        _1045 = _1117;
    }
    float _1135 = _1045;
    float _1137 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1139 = _1135;
    if (_1069)
    {
        _997 = _1123;
    }
    float _1141 = _997;
    float _1143 = _1141;
    if (!_1069)
    {
        float _1145 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1131);
        _1129 = _1145;
    }
    float _1147 = _1129;
    if (!_1069)
    {
        _1121 = _973;
    }
    float _1149 = _1121;
    float _1151 = _849 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1069)
    {
        _1125 = _977;
    }
    float _1153 = _1125;
    float _1155 = _953 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1157 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1159 = -_1091;
    float _1161 = fma(_1133, 2.0, _1159);
    float _1163 = fma(_1151, _1083, -0.5);
    float _1165 = fma(_1155, _1061, -0.5);
    float _1167 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1157);
    float _1169 = fma(_1137, _1055, -0.5);
    float _1171 = _1077;
    if (!_1069)
    {
        float _1173 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1149);
        _1139 = _1173;
    }
    float _1175 = _1139;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1179 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1183 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1167);
    float _1185 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1013);
    float _1187 = -_114;
    float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[76].x, _923);
    float _1191 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1193 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1197 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1199 = _1179 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1201 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1203 = fma(_1185, _1169, _1189);
    float _1205 = _859 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1207 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1191);
    float _1209 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1193);
    out.m_71.x = _1197;
    out.m_71.y = _1199;
    out.m_71.z = _1201;
    out.m_71.w = _1195;
    float _1211 = _1075 * _1149;
    float _1213 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1207);
    float _1215 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1209);
    float _1217 = _1071 * _1131;
    float _1219 = _859 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (!_1069)
    {
        float _1221 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1153);
        _1143 = _1221;
    }
    float _1223 = _1143;
    bool _1225 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1227 = isnan(0.5);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1233 = _1229 || _1231;
    out.m_73.x = _1183;
    out.m_73.y = _1213;
    out.m_73.z = _1215;
    float _1235 = -_1217;
    float _1237 = fma(_1073, _1149, _1235);
    float _1239 = _1203 + 0.5;
    float _1241 = in.m_63.x;
    float _1243 = _1237 * _1077;
    float _1245 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1205);
    float _1247 = _1073 * _1153;
    float _1249 = _1043 * (-0.15915493667125701904296875);
    float _1251 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1219);
    float _1253 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1245);
    float _1255 = -_1247;
    float _1257 = fma(_1075, _1131, _1255);
    float _1259 = -_1211;
    float _1261 = fma(_1071, _1153, _1259);
    float _1263 = _1249 * 6.283185482025146484375;
    float _1265 = sin(_1263);
    float _1267 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1269 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1089);
    float _1271 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1251);
    float _1273 = _1147 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1275 = _1261 * _1077;
    float _1277 = _1257 * _1077;
    float _1279 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1281 = _1249 * 6.283185482025146484375;
    float _1283 = cos(_1281);
    float _1285 = fma(_1175, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1273);
    float _1287 = _1275;
    float _1289 = _1239;
    if (!_1233)
    {
        _1171 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1291 = _1171;
    float _1293 = _1279 + _1267;
    float _1295 = _1147 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1297 = _1147 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1299 = -_114;
    float _1301 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1161);
    out.m_69.x = _1241;
    float _1303 = 1.0 / _1267;
    float _1305 = _1265 * _1165;
    float _1307 = fma(_1175, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1295);
    float _1309 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1311 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1313 = fma(_1175, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1297);
    float _1315 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1065);
    float _1317 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1309);
    float _1319 = _1283 * _1165;
    float _1321 = -_1305;
    float _1323 = fma(_1283, _1163, _1321);
    float _1325 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1327 = fma(_1265, _1163, _1319);
    float _1329 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1311);
    float _1331 = _971 + 0.5;
    float _1333 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1325);
    float _1335 = _1293 * _1303;
    float _1337 = _1335 * 0.5;
    float _1339 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1329);
    out.gl_Position.x = _792;
    out.gl_Position.y = _806;
    out.gl_Position.z = _1315;
    out.gl_Position.w = _764;
    float _1341 = fma(_1085, _1323, _1301);
    float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1345 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1343);
    float _1347 = _1337;
    float _1349 = _1315;
    float _1351 = _1291;
    if (!_1233)
    {
        float _1353 = -_1291;
        float _1355 = _1353 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1347 = _1355;
    }
    float _1357 = _1347;
    float _1359 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1333);
    float _1361 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1317);
    out.m_75.x = _1239;
    out.m_75.y = _1331;
    float _1363 = _1361;
    if (!_1233)
    {
        float _1365 = 1.0 / _1357;
        _1287 = _1365;
    }
    float _1367 = _1287;
    float _1369 = -_1269;
    float _1371 = fma(_1087, _1327, _1369);
    float _1373 = _1341 + 0.5;
    out.m_77.x = _1359;
    out.m_77.y = _1361;
    out.m_77.z = _1339;
    float _1375 = _1371 + 0.5;
    float _1377 = 1.0 / _1345;
    float _1379 = _1315 + _764;
    if (_1233)
    {
        _1289 = 1.0;
    }
    float _1381 = _1289;
    out.m_79.x = _1373;
    out.m_79.y = _1375;
    float _1383 = _1379 * 0.5;
    float _1385 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1387 = _1381;
    if (!_1233)
    {
        _1363 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1389 = _1363;
    float _1391 = fma(_1223, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1285);
    float _1393 = fma(_1223, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1313);
    float _1395 = -_1385;
    float _1397 = _1395 + 1.0;
    out.m_81.z = _1383;
    out.m_81.w = _764;
    float _1399 = _1397;
    if (!_1107)
    {
        _939 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1401 = _939;
    float _1403 = _1401;
    float _1405 = _1401;
    if (!_1107)
    {
        _1349 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1407 = _1349;
    float _1409 = _1377;
    float _1411 = _1407;
    float _1413 = _1407;
    if (!_1233)
    {
        float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1417 = -_1291;
        float _1419 = fma(_1377, _1415, _1417);
        _1351 = _1419;
    }
    float _1421 = _1351;
    float _1423 = _1421;
    if (!_1233)
    {
        float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1427 = -_1389;
        float _1429 = fma(_1377, _1425, _1427);
        _1409 = _1429;
    }
    float _1431 = _1409;
    float _1433 = _1431;
    if (!_1233)
    {
        float _1435 = _1421 * _1367;
        float _1437 = precise::clamp(_1435, 0.0, 1.0);
        _1387 = _1437;
    }
    float _1439 = _1387;
    if (!_1233)
    {
        float _1441 = -_1389;
        float _1443 = _1441 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1423 = _1443;
    }
    float _1445 = _1423;
    float _1447 = fma(_1223, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1307);
    float _1449 = _1445;
    if (!_1233)
    {
        float _1451 = 1.0 / _1445;
        _1449 = _1451;
    }
    float _1453 = _1449;
    out.m_83.x = _1391;
    out.m_83.y = _1447;
    out.m_83.z = _1393;
    float _1455 = _1453;
    if (!_1233)
    {
        float _1457 = _1431 * _1453;
        float _1459 = precise::clamp(_1457, 0.0, 1.0);
        _1433 = _1459;
    }
    float _1461 = _1433;
    float _1463 = _1461;
    if (_1233)
    {
        _1455 = 1.0;
    }
    float _1465 = _1455;
    float _1467 = _1465;
    if (!_1233)
    {
        float _1469 = -_1461;
        float _1471 = _1469 + 1.0;
        _1467 = _1471;
    }
    float _1473 = _1467;
    if (!_1107)
    {
        _1463 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1475 = _1463;
    float _1477 = _1385 * _820;
    float _1479 = _831 * _1397;
    float _1481 = _1439 * _1473;
    float _1483 = _1481;
    float _1485 = _1475;
    float _1487 = _1475;
    if (!_1107)
    {
        _1399 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1489 = _1399;
    float _1491 = _831 * _1477;
    float _1493 = _1481 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1495 = _845 * _1477;
    float _1497 = fma(_841, _1491, _825);
    float _1499 = fma(_843, _1491, _827);
    float _1501 = _1491;
    float _1503 = _1489;
    float _1505 = _1489;
    if (!_1107)
    {
        _1501 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1507 = _1501;
    float _1509 = fma(_831, _1495, _829);
    float _1511 = _1507;
    float _1513 = _1507;
    if (!_1107)
    {
        _1483 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1515 = _1483;
    out.m_85.x = _1497;
    out.m_85.y = _1499;
    out.m_85.z = _1509;
    out.m_85.w = _1479;
    bool _1517 = !_1107;
    float _1519 = _1515;
    float _1521 = _1515;
    if (!_1517)
    {
        bool _1523 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1525 = isnan(_530);
        bool _1527 = _1523 || _1525;
        bool _1529 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1531 = _1527 || _1529;
        if (!_1531)
        {
            float _1533 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1535 = _530 + _1533;
            float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1539 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1537;
            float _1541 = 1.0 / _1539;
            float _1543 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1545 = _1543 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1547 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1549 = _1547 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1553 = _1551 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1557 = _1555 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1559 = _1535 * _1541;
            float _1561 = precise::clamp(_1559, 0.0, 1.0);
            float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1565 = _1563 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1567 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1569 = _1567 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1571 = fma(_1561, _1545, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1573 = fma(_1561, _1565, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1575 = fma(_1561, _1569, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1577 = fma(_1561, _1549, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1579 = fma(_1561, _1553, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1581 = fma(_1561, _1557, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1513 = _1575;
            _1487 = _1579;
            _1405 = _1573;
            _1505 = _1577;
            _1413 = _1571;
            _1521 = _1581;
            _1583 = true;
        }
        else
        {
            bool _1585 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1587 = isnan(_530);
            bool _1589 = _1585 || _1587;
            bool _1591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1593 = _1589 || _1591;
            if (!_1593)
            {
                _1403 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1595 = _1403;
            _1405 = _1595;
            if (!_1593)
            {
                _1511 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1597 = _1511;
            _1513 = _1597;
            if (!_1593)
            {
                _1411 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1599 = _1411;
            _1413 = _1599;
            if (!_1593)
            {
                _1503 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1601 = _1503;
            _1505 = _1601;
            if (!_1593)
            {
                _1485 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1603 = _1485;
            _1487 = _1603;
            if (!_1593)
            {
                _1519 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1605 = _1519;
            bool _1607 = !_1593;
            _1521 = _1605;
            if (!_1607)
            {
                bool _1609 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1611 = isnan(_530);
                bool _1613 = _1609 || _1611;
                bool _1615 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1617 = _1613 || _1615;
                if (!_1617)
                {
                    float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1621 = _530 + _1619;
                    float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1625 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1623;
                    float _1627 = 1.0 / _1625;
                    float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1631 = _1629 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1635 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1637 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1639 = _1637 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1643 = _1641 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1645 = _1621 * _1627;
                    float _1647 = precise::clamp(_1645, 0.0, 1.0);
                    float _1649 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1651 = _1649 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1653 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1655 = _1653 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1657 = fma(_1647, _1631, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1659 = fma(_1647, _1651, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1661 = fma(_1647, _1655, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1663 = fma(_1647, _1635, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1665 = fma(_1647, _1639, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1667 = fma(_1647, _1643, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1513 = _1661;
                    _1487 = _1665;
                    _1405 = _1659;
                    _1505 = _1663;
                    _1413 = _1657;
                    _1521 = _1667;
                    _1583 = true;
                }
                else
                {
                    _1513 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1487 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1405 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1505 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1413 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1521 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1583 = false;
    float _1669 = _1513;
    float _1671 = _1487;
    float _1673 = _1405;
    float _1675 = _1505;
    float _1677 = _1413;
    float _1679 = _1521;
    float _1681 = fma(_1447, -0.5, 0.5);
    float _1683 = precise::clamp(_1681, 0.0, 1.0);
    float _1685 = -_1669;
    float _1687 = _1685 + _1671;
    float _1689 = _1493 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1691 = -_1673;
    float _1693 = _1691 + _1675;
    out.m_87.x = 0.0;
    float _1695 = fma(_1683, _1687, _1669);
    float _1697 = -_1677;
    float _1699 = _1697 + _1679;
    out.m_51.x = _1689;
    float _1701 = fma(_1683, _1693, _1673);
    float _1703 = _1695 * 0.586610972881317138671875;
    bool _1705 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1707 = fma(_1683, _1699, _1677);
    float _1709 = fma(_1701, 0.298911988735198974609375, _1703);
    bool _1711 = _1439 > 0.0;
    bool _1713 = isnan(_1439);
    bool _1715 = _1711 || _1713;
    bool _1717 = isnan(0.0);
    bool _1719 = _1715 || _1717;
    float _1721 = fma(_1707, 0.114477999508380889892578125, _1709);
    bool _1723 = _1473 <= 0.0;
    bool _1725 = !_1719;
    bool _1727 = _1723 || _1725;
    float _1729 = -_1721;
    float _1731 = _1701 + _1729;
    float _1733 = -_1721;
    float _1735 = _1695 + _1733;
    float _1737 = -_1721;
    float _1739 = _1707 + _1737;
    float _1741 = fma(_1731, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1721);
    float _1743 = fma(_1735, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1721);
    float _1745 = fma(_1739, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1721);
    bool _1747 = !_1705;
    if (!_1747)
    {
        float _1749 = -_500;
        float _1751 = _1749 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1753 = -_504;
        float _1755 = _1753 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1757 = -_508;
        float _1759 = _1757 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1761 = _1751 * _1751;
        float _1763 = fma(_1755, _1755, _1761);
        float _1765 = fma(_1759, _1759, _1763);
        float _1767 = sqrt(_1765);
        float _1769 = rsqrt(_1765);
        float _1771 = -_1767;
        float _1773 = _1771 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1775 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1777 = precise::clamp(_1775, 0.0, 1.0);
        float _1779 = _1755 * _1769;
        float _1781 = _1751 * _1769;
        float _1783 = abs(_1777);
        float _1785 = log2(_1783);
        float _1787 = _1759 * _1769;
        float _1789 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1791 = _1447 * _1781;
        float _1793 = -_1781;
        float _1795 = -_1789;
        float _1797 = fma(_1793, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1795);
        float _1799 = fma(_1391, _1779, _1791);
        float _1801 = -_1787;
        float _1803 = fma(_1801, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1797);
        float _1805 = fma(_1393, _1787, _1799);
        float _1807 = precise::clamp(_1805, 0.0, 1.0);
        float _1809 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1811 = _1803 + _1809;
        float _1813 = _1785 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1815 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1817 = precise::clamp(_1815, 0.0, 1.0);
        float _1819 = exp2(_1813);
        float _1821 = _1819 * _1817;
        float _1823 = _1807 * _1821;
        float _1825 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1827 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1829 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _1825;
        out.m_87.y = _1827;
        out.m_87.z = _1829;
    }
    out.m_89.x = _1741;
    out.m_89.y = _1743;
    out.m_89.z = _1745;
    if (!_1727)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _1831 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1831;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1583 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = in.m_46.w;
    float _107 = trunc(_103);
    int _110 = int(_107);
    float _112 = -_105;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _114;
    bool _118 = _110 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (!_118)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_118)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1897 = as_type<float>(_128);
        out.gl_Position.z = _1897;
    }
    if (!_118)
    {
        return out;
    }
    bool _132 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_105);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = float(_110);
    bool _144 = _114 >= _142;
    bool _146 = !_140;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_51.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _130 = as_type<int>(_154);
    }
    int _156 = _130;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1953 = as_type<float>(_156);
        out.gl_Position.z = _1953;
    }
    if (_148)
    {
        return out;
    }
    float _158 = in.m_53.w;
    float _160 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_46.x;
    float _174 = in.m_46.y;
    float _176 = in.m_46.z;
    float _178 = in.m_44.x;
    float _180 = in.m_44.y;
    float _182 = in.m_44.z;
    float _184 = 0.0;
    float _186 = _160;
    if (!_170)
    {
        float _188 = _160 * _160;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_170)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    bool _200 = !_170;
    float _202 = _198;
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _160 * _206;
        float _216 = exp2(_214);
        float _218 = _212 * 0.693147182464599609375;
        float _220 = 1.0 / _218;
        float _222 = 1.0 / _210;
        float _224 = _216 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _220, _160);
        float _230 = _228 * _222;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _232;
    }
    float _234 = _202;
    bool _236 = !_170;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _160 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _186 = _256;
    }
    float _258 = _186;
    float _260 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _264 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_258, _174, _260);
    float _268 = fma(_258, _172, _262);
    float _270 = fma(_258, _176, _264);
    float _272 = fma(_266, _158, _180);
    float _274 = fma(_268, _158, _178);
    float _276 = fma(_270, _158, _182);
    float _278 = in.m_55.x;
    float _280 = in.m_55.y;
    float _282 = in.m_55.z;
    float _284 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _286 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _288 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _290 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _284);
    float _292 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _286);
    float _294 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _288);
    float _296 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _290);
    float _298 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _292);
    float _300 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _294);
    float _302 = _296 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _304 = _298 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _306 = _300 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _308 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _310 = _302 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _314 = _304 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _318 = _306 + _316;
    float _320 = _310 * _310;
    float _322 = fma(_314, _314, _320);
    float _324 = fma(_318, _318, _322);
    float _326 = rsqrt(_324);
    float _328 = _310 * _326;
    float _330 = _314 * _326;
    float _332 = _318 * _326;
    float _334 = -_328;
    float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[18].w, _310);
    float _338 = -_330;
    float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _314);
    float _342 = -_332;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[18].w, _318);
    float _346 = in.m_53.x;
    float _348 = in.m_53.y;
    float _350 = in.m_53.z;
    float _352 = _336 * _336;
    float _354 = fma(_340, _340, _352);
    float _356 = fma(_344, _344, _354);
    float _358 = sqrt(_356);
    float _360 = _348 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _362 = _346 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _364 = _350 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _366 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _368 = _326 * _358;
    float _370 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _280);
    float _372 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _374 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _278);
    float _376 = _368 * _366;
    float _378 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _380 = _368 * _372;
    float _382 = _370 * _376;
    float _384 = _368 * _378;
    float _386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _282);
    float _388 = _374 * _380;
    float _390 = _382 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _392 = _382 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _394 = _386 * _384;
    float _396 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[10].x, _390);
    float _398 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[8].x, _392);
    float _400 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[10].z, _396);
    float _402 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[8].z, _398);
    float _404 = _306 + _400;
    float _406 = _304 + _402;
    float _408 = _382 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _410 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _412 = _404 + _410;
    float _414 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _416 = _406 + _414;
    float _418 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[9].x, _408);
    float _420 = _412 * _412;
    float _422 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[9].z, _418);
    float _424 = fma(_416, _416, _420);
    float _426 = _302 + _422;
    float _428 = sqrt(_424);
    bool _430 = _428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _432 = _420;
    float _434 = _382;
    float _436 = _418;
    float _438 = _416;
    float _440 = _412;
    if (!_430)
    {
        _432 = _406;
    }
    float _442 = _432;
    float _444 = _442;
    if (!_430)
    {
        _434 = _404;
    }
    float _446 = _434;
    float _448 = _446;
    if (!_430)
    {
        _436 = _426;
    }
    float _450 = _436;
    bool _452 = !_430;
    float _454 = _450;
    if (!_452)
    {
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _458 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _460 = _428 + _458;
        float _462 = _426 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _464 = rsqrt(_424);
        float _466 = _460 * _456;
        float _468 = _466 * 0.15915493667125701904296875;
        float _470 = _468 * 6.283185482025146484375;
        float _472 = sin(_470);
        float _474 = _468 * 6.283185482025146484375;
        float _476 = cos(_474);
        float _478 = fma(_472, _462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _480 = _464 * _478;
        float _482 = _476 + (-1.0);
        float _484 = _482 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _486 = fma(_416, _480, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _488 = fma(_412, _480, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _490 = fma(_426, _476, _484);
        _454 = _490;
        _444 = _486;
        _448 = _488;
    }
    float _492 = _454;
    float _494 = _444;
    float _496 = _448;
    float _498 = -_328;
    float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _502 = -_330;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _494);
    float _506 = -_332;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _510 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _512 = _500 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _516 = _504 + _514;
    float _518 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _520 = _508 + _518;
    float _522 = _512 * _512;
    float _524 = fma(_516, _516, _522);
    float _526 = fma(_520, _520, _524);
    float _528 = rsqrt(_526);
    float _530 = sqrt(_526);
    float _532 = _528 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _534 = _516 * _532;
    float _536 = _520 * _532;
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
    float _558 = _512;
    if (_546)
    {
        float _560 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _552 = _560;
    }
    float _562 = _552;
    if (_546)
    {
        float _564 = rsqrt(_542);
        _554 = _564;
    }
    float _566 = _554;
    float _568 = _566;
    if (_546)
    {
        float _570 = _550 * _562;
        _556 = _570;
    }
    float _572 = _556;
    if (_546)
    {
        float _574 = _572 * 0.15915493667125701904296875;
        _438 = _574;
    }
    float _576 = _438;
    float _578 = _520;
    if (_546)
    {
        float _580 = _576 * 6.283185482025146484375;
        float _582 = sin(_580);
        _578 = _582;
    }
    float _584 = _578;
    float _586 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _588 = precise::max(0.0, _586);
    float _590 = _562;
    float _592 = _588;
    if (_546)
    {
        float _594 = _576 * 6.283185482025146484375;
        float _596 = cos(_594);
        _590 = _596;
    }
    float _598 = _590;
    float _600 = -_532;
    float _602 = -_588;
    float _604 = fma(_512, _600, _602);
    if (_546)
    {
        float _606 = _604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _558 = _606;
    }
    float _608 = _558;
    float _610 = _500 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _612 = _608;
    float _614 = _584;
    if (_546)
    {
        float _616 = fma(_584, _608, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _612 = _616;
    }
    float _618 = _612;
    float _620 = _618;
    if (!_546)
    {
        _614 = _534;
    }
    float _622 = _614;
    float _624 = _622;
    float _626 = _598;
    if (_546)
    {
        float _628 = _598 + (-1.0);
        _592 = _628;
    }
    float _630 = _592;
    float _632 = 0.0;
    float _634 = _630;
    if (_546)
    {
        float _636 = _566 * _618;
        _632 = _636;
    }
    float _638 = _632;
    if (!_546)
    {
        _620 = _604;
    }
    float _640 = _620;
    float _642 = _640;
    if (_546)
    {
        float _644 = _630 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _440 = _644;
    }
    float _646 = _440;
    if (_546)
    {
        float _648 = _534 * _638;
        _624 = _648;
    }
    float _650 = _624;
    if (!_546)
    {
        _634 = _536;
    }
    float _652 = _634;
    float _654 = _652;
    if (_546)
    {
        float _656 = _536 * _638;
        _654 = _656;
    }
    float _658 = _654;
    if (!_546)
    {
        _568 = _538;
    }
    float _660 = _568;
    float _662 = _660;
    if (_546)
    {
        float _664 = fma(_604, _598, _646);
        _642 = _664;
    }
    float _666 = _642;
    if (_546)
    {
        float _668 = _650 * _650;
        _662 = _668;
    }
    float _670 = _662;
    if (!_546)
    {
        _626 = _540;
    }
    float _672 = _626;
    float _674 = _672;
    if (_546)
    {
        float _676 = _658 * _658;
        _674 = _676;
    }
    float _678 = _674;
    float _680 = fma(_666, _666, _670);
    float _682 = _500 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _684 = _680 + _678;
    float _686 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _688 = fma(_530, (*spvDescriptorSet0.vp_c15)._m0[23].w, _686);
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[2].x, _610);
    float _694 = _500 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _696 = rsqrt(_684);
    float _698 = -_690;
    float _700 = _698 + 1.0;
    float _702 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[2].z, _692);
    float _704 = _500 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _706 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[1].x, _694);
    float _708 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[3].x, _682);
    float _710 = _702 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _712 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[0].x, _704);
    float _714 = abs(_700);
    float _716 = log2(_714);
    float _718 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[1].z, _706);
    float _720 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[3].z, _708);
    float _722 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[0].z, _712);
    float _724 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _726 = _718 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _728 = _710 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _730 = _722 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _732 = _696 * _650;
    float _734 = _726 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _736 = _696 * _666;
    float _738 = _696 * _658;
    float _740 = _732 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _742 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[7].x, _734);
    float _744 = _720 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _746 = -_728;
    float _748 = fma(_746, _724, 1.0);
    float _750 = _716 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _752 = -_740;
    float _754 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[21].y, _752);
    float _756 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[7].z, _742);
    float _758 = log2(_748);
    float _760 = -_738;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c15)._m0[21].z, _754);
    float _764 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[7].w, _756);
    float _766 = _726 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _768 = _726 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _770 = fma(_762, -0.5, 0.5);
    float _772 = fma(_762, 0.5, 0.5);
    float _774 = exp2(_750);
    float _776 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[4].x, _766);
    float _778 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[5].x, _768);
    float _780 = _736 + 1.0;
    float _782 = fma(_772, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _784 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[4].z, _776);
    float _786 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[5].z, _778);
    float _788 = 1.0 / _764;
    float _790 = fma(_772, _782, -0.212114393711090087890625);
    float _792 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[4].w, _784);
    float _794 = _758 * 0.693147182464599609375;
    float _796 = fma(_772, _790, 1.570728778839111328125);
    float _798 = _794 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _800 = sqrt(_770);
    float _802 = -_736;
    float _804 = fma(_774, _780, _802);
    float _806 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[5].w, _786);
    float _808 = fma(_804, 0.5, 0.5);
    float _810 = _792 * _788;
    float _812 = _806 * _788;
    float _814 = fma(_810, 0.5, 0.5);
    float _816 = fma(_812, -0.5, 0.5);
    float _818 = _800 * 0.636619746685028076171875;
    float3 _3053 = float3(_814, _816, _798);
    float _820 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3053, float3(0.0), isnan(_3053)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3053, float3(0.0), isnan(_3053)), level(0.0)).x;
    float3 _3064 = float3(_814, _816, _798);
    float4 _823 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3064, float3(0.0), isnan(_3064)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3064, float3(0.0), isnan(_3064)), level(0.0)).xyzw;
    float _825 = _823.x;
    float _827 = _823.y;
    float _829 = _823.z;
    float _831 = _823.w;
    float _833 = -_796;
    float _835 = fma(_818, _833, 1.0);
    float2 _3086 = float2(_835, _808);
    float3 _839 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3086, float2(0.0), isnan(_3086)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3086, float2(0.0), isnan(_3086)), level(0.0)).xyz;
    float _841 = _839.x;
    float _843 = _839.y;
    float _845 = _839.z;
    float _847 = in.m_57.y;
    float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _851 = in.m_59.y;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _855 = _853 != 0;
    float _857 = -_328;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[18].w, _302);
    float _861 = in.m_57.x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _865 = in.m_57.z;
    float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _871 = in.m_59.x;
    float _873 = -_330;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _879 = _877 != 0;
    float _881 = -_332;
    float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[18].w, _306);
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _889 = _887 != 0;
    float _891 = _847 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _893 = _847 > 0.5;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _897 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[78].w, _885);
    float _899 = fma(_891, -2.0, _863);
    float _901 = -_851;
    float _903 = _901 + 1.0;
    float _905 = _867 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _909 = _907 != 0;
    float _911 = _861 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _915 = _913 != 0;
    float _917 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _899);
    float _919 = _893 ? _903 : _851;
    float _921 = -_869;
    float _923 = fma(_911, 2.0, _921);
    float _925 = _911;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _929 = _919;
    float _931 = _861;
    float _933 = _814;
    float _935 = _851;
    float _937 = _871;
    float _939 = _764;
    if (_855)
    {
        _925 = _865;
    }
    float _941 = _925;
    float _943 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[88].w, _895);
    float _945 = _879 ? _919 : _851;
    float _947 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _897);
    float _949 = _941;
    if (_855)
    {
        _927 = _941;
    }
    float _951 = _927;
    float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _955 = _951;
    if (!_855)
    {
        _949 = _865;
    }
    float _957 = _949;
    float _959 = fma(_905, _945, -0.5);
    if (_855)
    {
        _929 = _847;
    }
    float _961 = _929;
    float _963 = _716 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _965 = _961;
    if (!_855)
    {
        _955 = _847;
    }
    float _967 = _955;
    float _969 = -_917;
    float _971 = fma(_947, _959, _969);
    float _973 = in.m_61.x;
    float _975 = in.m_61.y;
    float _977 = in.m_61.z;
    float _979 = _726 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _983 = _280 != 0.0;
    bool _985 = isnan(_280);
    bool _987 = _983 || _985;
    bool _989 = isnan(0.0);
    bool _991 = _987 || _989;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    int _995 = as_type<int>(_967);
    float _997 = _993;
    if (!_855)
    {
        _965 = _861;
    }
    float _999 = _965;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1003 = false;
    int _1005 = as_type<int>(_999);
    float _1007 = _1001;
    if (_889)
    {
        bool _1009 = _861 > 0.5;
        _1003 = _1009;
    }
    bool _1011 = _1003;
    float _1013 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[78].z, _981);
    float _1015 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[89].z, _993);
    float _1017 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1001);
    if (_889)
    {
        float _1019 = -_871;
        float _1021 = _1019 + 1.0;
        _995 = as_type<int>(_1021);
    }
    int _1023 = _995;
    if (!_855)
    {
        _931 = _957;
    }
    float _1025 = _931;
    float _1027 = _999 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1029 = _957 > 0.5;
    if (_909)
    {
        float _1031 = -_871;
        float _1033 = _1031 + 1.0;
        _1005 = as_type<int>(_1033);
    }
    int _1035 = _1005;
    bool _1037 = _278 == 0.0;
    bool _1039 = !_991;
    bool _1041 = _1037 && _1039;
    float _1043 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1015);
    float _1045 = as_type<float>(_1035);
    if (!_889)
    {
        _933 = _871;
    }
    float _1047 = _933;
    float _1049 = exp2(_963);
    float _1051 = _1047;
    if (_889)
    {
        float _1053 = _1011 ? as_type<float>(_1023) : _871;
        _1051 = _1053;
    }
    float _1055 = _1051;
    float _1057 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[6].x, _979);
    if (_915)
    {
        float _1059 = _1029 ? _903 : _851;
        _935 = _1059;
    }
    float _1061 = _935;
    float _1063 = in.m_63.w;
    float _1065 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1057);
    bool _1067 = _282 == 0.0;
    bool _1069 = _1067 && _1041;
    float _1071 = in.m_65.x;
    float _1073 = in.m_65.y;
    float _1075 = in.m_65.z;
    float _1077 = in.m_65.w;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_909)
    {
        float _1081 = _893 ? as_type<float>(_1035) : _871;
        _937 = _1081;
    }
    float _1083 = _937;
    float _1085 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1017);
    float _1087 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[87].w, _943);
    float _1089 = fma(_1027, -2.0, _1079);
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1095 = -_1049;
    float _1097 = _1095 + 1.0;
    out.m_67.x = _504;
    out.m_67.y = _500;
    out.m_67.z = _508;
    bool _1099 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1101 = isnan(_530);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1107 = _1103 || _1105;
    float _1109 = 0.0;
    if (_1069)
    {
        _1109 = _975;
    }
    float _1111 = _1109;
    float _1113 = 0.0;
    float _1115 = _1111;
    if (_1069)
    {
        _1113 = _973;
    }
    float _1117 = _1113;
    float _1119 = 0.0;
    float _1121 = _1117;
    if (_1069)
    {
        _1119 = _977;
    }
    float _1123 = _1119;
    float _1125 = _1123;
    if (_1069)
    {
        _1007 = _1111;
    }
    float _1127 = _1007;
    out.m_69.w = _1063;
    float _1129 = _1127;
    if (!_1069)
    {
        _1115 = _975;
    }
    float _1131 = _1115;
    float _1133 = _1025 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_1069)
    {
        _1045 = _1117;
    }
    float _1135 = _1045;
    float _1137 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1139 = _1135;
    if (_1069)
    {
        _997 = _1123;
    }
    float _1141 = _997;
    float _1143 = _1141;
    if (!_1069)
    {
        float _1145 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1131);
        _1129 = _1145;
    }
    float _1147 = _1129;
    if (!_1069)
    {
        _1121 = _973;
    }
    float _1149 = _1121;
    float _1151 = _849 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1069)
    {
        _1125 = _977;
    }
    float _1153 = _1125;
    float _1155 = _953 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1157 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1159 = -_1091;
    float _1161 = fma(_1133, 2.0, _1159);
    float _1163 = fma(_1151, _1083, -0.5);
    float _1165 = fma(_1155, _1061, -0.5);
    float _1167 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1157);
    float _1169 = fma(_1137, _1055, -0.5);
    float _1171 = _1077;
    if (!_1069)
    {
        float _1173 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1149);
        _1139 = _1173;
    }
    float _1175 = _1139;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1179 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1183 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1167);
    float _1185 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1013);
    float _1187 = -_114;
    float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[76].x, _923);
    float _1191 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1193 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1197 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1199 = _1179 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1201 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1203 = fma(_1185, _1169, _1189);
    float _1205 = _859 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1207 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1191);
    float _1209 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1193);
    out.m_71.x = _1197;
    out.m_71.y = _1199;
    out.m_71.z = _1201;
    out.m_71.w = _1195;
    float _1211 = _1075 * _1149;
    float _1213 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1207);
    float _1215 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1209);
    float _1217 = _1071 * _1131;
    float _1219 = _859 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (!_1069)
    {
        float _1221 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1153);
        _1143 = _1221;
    }
    float _1223 = _1143;
    bool _1225 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1227 = isnan(0.5);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1233 = _1229 || _1231;
    out.m_73.x = _1183;
    out.m_73.y = _1213;
    out.m_73.z = _1215;
    float _1235 = -_1217;
    float _1237 = fma(_1073, _1149, _1235);
    float _1239 = _1203 + 0.5;
    float _1241 = in.m_63.x;
    float _1243 = _1237 * _1077;
    float _1245 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1205);
    float _1247 = _1073 * _1153;
    float _1249 = _1043 * (-0.15915493667125701904296875);
    float _1251 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1219);
    float _1253 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1245);
    float _1255 = -_1247;
    float _1257 = fma(_1075, _1131, _1255);
    float _1259 = -_1211;
    float _1261 = fma(_1071, _1153, _1259);
    float _1263 = _1249 * 6.283185482025146484375;
    float _1265 = sin(_1263);
    float _1267 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1269 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1089);
    float _1271 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1251);
    float _1273 = _1147 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1275 = _1261 * _1077;
    float _1277 = _1257 * _1077;
    float _1279 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1281 = _1249 * 6.283185482025146484375;
    float _1283 = cos(_1281);
    float _1285 = fma(_1175, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1273);
    float _1287 = _1275;
    float _1289 = _1239;
    if (!_1233)
    {
        _1171 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1291 = _1171;
    float _1293 = _1279 + _1267;
    float _1295 = _1147 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1297 = _1147 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1299 = -_114;
    float _1301 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1161);
    out.m_69.x = _1241;
    float _1303 = 1.0 / _1267;
    float _1305 = _1265 * _1165;
    float _1307 = fma(_1175, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1295);
    float _1309 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1311 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1313 = fma(_1175, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1297);
    float _1315 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1065);
    float _1317 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1309);
    float _1319 = _1283 * _1165;
    float _1321 = -_1305;
    float _1323 = fma(_1283, _1163, _1321);
    float _1325 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1327 = fma(_1265, _1163, _1319);
    float _1329 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1311);
    float _1331 = _971 + 0.5;
    float _1333 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1325);
    float _1335 = _1293 * _1303;
    float _1337 = _1335 * 0.5;
    float _1339 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1329);
    out.gl_Position.x = _792;
    out.gl_Position.y = _806;
    out.gl_Position.z = _1315;
    out.gl_Position.w = _764;
    float _1341 = fma(_1085, _1323, _1301);
    float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1345 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1343);
    float _1347 = _1337;
    float _1349 = _1315;
    float _1351 = _1291;
    if (!_1233)
    {
        float _1353 = -_1291;
        float _1355 = _1353 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1347 = _1355;
    }
    float _1357 = _1347;
    float _1359 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1333);
    float _1361 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1317);
    out.m_75.x = _1239;
    out.m_75.y = _1331;
    float _1363 = _1361;
    if (!_1233)
    {
        float _1365 = 1.0 / _1357;
        _1287 = _1365;
    }
    float _1367 = _1287;
    float _1369 = -_1269;
    float _1371 = fma(_1087, _1327, _1369);
    float _1373 = _1341 + 0.5;
    out.m_77.x = _1359;
    out.m_77.y = _1361;
    out.m_77.z = _1339;
    float _1375 = _1371 + 0.5;
    float _1377 = 1.0 / _1345;
    float _1379 = _1315 + _764;
    if (_1233)
    {
        _1289 = 1.0;
    }
    float _1381 = _1289;
    out.m_79.x = _1373;
    out.m_79.y = _1375;
    float _1383 = _1379 * 0.5;
    float _1385 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1387 = _1381;
    if (!_1233)
    {
        _1363 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1389 = _1363;
    float _1391 = fma(_1223, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1285);
    float _1393 = fma(_1223, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1313);
    float _1395 = -_1385;
    float _1397 = _1395 + 1.0;
    out.m_81.z = _1383;
    out.m_81.w = _764;
    float _1399 = _1397;
    if (!_1107)
    {
        _939 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1401 = _939;
    float _1403 = _1401;
    float _1405 = _1401;
    if (!_1107)
    {
        _1349 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1407 = _1349;
    float _1409 = _1377;
    float _1411 = _1407;
    float _1413 = _1407;
    if (!_1233)
    {
        float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1417 = -_1291;
        float _1419 = fma(_1377, _1415, _1417);
        _1351 = _1419;
    }
    float _1421 = _1351;
    float _1423 = _1421;
    if (!_1233)
    {
        float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1427 = -_1389;
        float _1429 = fma(_1377, _1425, _1427);
        _1409 = _1429;
    }
    float _1431 = _1409;
    float _1433 = _1431;
    if (!_1233)
    {
        float _1435 = _1421 * _1367;
        float _1437 = precise::clamp(_1435, 0.0, 1.0);
        _1387 = _1437;
    }
    float _1439 = _1387;
    if (!_1233)
    {
        float _1441 = -_1389;
        float _1443 = _1441 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1423 = _1443;
    }
    float _1445 = _1423;
    float _1447 = fma(_1223, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1307);
    float _1449 = _1445;
    if (!_1233)
    {
        float _1451 = 1.0 / _1445;
        _1449 = _1451;
    }
    float _1453 = _1449;
    out.m_83.x = _1391;
    out.m_83.y = _1447;
    out.m_83.z = _1393;
    float _1455 = _1453;
    if (!_1233)
    {
        float _1457 = _1431 * _1453;
        float _1459 = precise::clamp(_1457, 0.0, 1.0);
        _1433 = _1459;
    }
    float _1461 = _1433;
    float _1463 = _1461;
    if (_1233)
    {
        _1455 = 1.0;
    }
    float _1465 = _1455;
    float _1467 = _1465;
    if (!_1233)
    {
        float _1469 = -_1461;
        float _1471 = _1469 + 1.0;
        _1467 = _1471;
    }
    float _1473 = _1467;
    if (!_1107)
    {
        _1463 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1475 = _1463;
    float _1477 = _1385 * _820;
    float _1479 = _831 * _1397;
    float _1481 = _1439 * _1473;
    float _1483 = _1481;
    float _1485 = _1475;
    float _1487 = _1475;
    if (!_1107)
    {
        _1399 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1489 = _1399;
    float _1491 = _831 * _1477;
    float _1493 = _1481 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1495 = _845 * _1477;
    float _1497 = fma(_841, _1491, _825);
    float _1499 = fma(_843, _1491, _827);
    float _1501 = _1491;
    float _1503 = _1489;
    float _1505 = _1489;
    if (!_1107)
    {
        _1501 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1507 = _1501;
    float _1509 = fma(_831, _1495, _829);
    float _1511 = _1507;
    float _1513 = _1507;
    if (!_1107)
    {
        _1483 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1515 = _1483;
    out.m_85.x = _1497;
    out.m_85.y = _1499;
    out.m_85.z = _1509;
    out.m_85.w = _1479;
    bool _1517 = !_1107;
    float _1519 = _1515;
    float _1521 = _1515;
    if (!_1517)
    {
        bool _1523 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1525 = isnan(_530);
        bool _1527 = _1523 || _1525;
        bool _1529 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1531 = _1527 || _1529;
        if (!_1531)
        {
            float _1533 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1535 = _530 + _1533;
            float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1539 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1537;
            float _1541 = 1.0 / _1539;
            float _1543 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1545 = _1543 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1547 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1549 = _1547 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1553 = _1551 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1557 = _1555 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1559 = _1535 * _1541;
            float _1561 = precise::clamp(_1559, 0.0, 1.0);
            float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1565 = _1563 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1567 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1569 = _1567 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1571 = fma(_1561, _1545, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1573 = fma(_1561, _1565, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1575 = fma(_1561, _1569, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1577 = fma(_1561, _1549, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1579 = fma(_1561, _1553, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1581 = fma(_1561, _1557, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1513 = _1575;
            _1487 = _1579;
            _1405 = _1573;
            _1505 = _1577;
            _1413 = _1571;
            _1521 = _1581;
            _1583 = true;
        }
        else
        {
            bool _1585 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1587 = isnan(_530);
            bool _1589 = _1585 || _1587;
            bool _1591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1593 = _1589 || _1591;
            if (!_1593)
            {
                _1403 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1595 = _1403;
            _1405 = _1595;
            if (!_1593)
            {
                _1511 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1597 = _1511;
            _1513 = _1597;
            if (!_1593)
            {
                _1411 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1599 = _1411;
            _1413 = _1599;
            if (!_1593)
            {
                _1503 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1601 = _1503;
            _1505 = _1601;
            if (!_1593)
            {
                _1485 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1603 = _1485;
            _1487 = _1603;
            if (!_1593)
            {
                _1519 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1605 = _1519;
            bool _1607 = !_1593;
            _1521 = _1605;
            if (!_1607)
            {
                bool _1609 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1611 = isnan(_530);
                bool _1613 = _1609 || _1611;
                bool _1615 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1617 = _1613 || _1615;
                if (!_1617)
                {
                    float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1621 = _530 + _1619;
                    float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1625 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1623;
                    float _1627 = 1.0 / _1625;
                    float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1631 = _1629 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1635 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1637 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1639 = _1637 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1643 = _1641 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1645 = _1621 * _1627;
                    float _1647 = precise::clamp(_1645, 0.0, 1.0);
                    float _1649 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1651 = _1649 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1653 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1655 = _1653 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1657 = fma(_1647, _1631, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1659 = fma(_1647, _1651, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1661 = fma(_1647, _1655, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1663 = fma(_1647, _1635, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1665 = fma(_1647, _1639, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1667 = fma(_1647, _1643, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1513 = _1661;
                    _1487 = _1665;
                    _1405 = _1659;
                    _1505 = _1663;
                    _1413 = _1657;
                    _1521 = _1667;
                    _1583 = true;
                }
                else
                {
                    _1513 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1487 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1405 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1505 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1413 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1521 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1583 = false;
    float _1669 = _1513;
    float _1671 = _1487;
    float _1673 = _1405;
    float _1675 = _1505;
    float _1677 = _1413;
    float _1679 = _1521;
    float _1681 = fma(_1447, -0.5, 0.5);
    float _1683 = precise::clamp(_1681, 0.0, 1.0);
    float _1685 = -_1669;
    float _1687 = _1685 + _1671;
    float _1689 = _1493 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1691 = -_1673;
    float _1693 = _1691 + _1675;
    out.m_87.x = 0.0;
    float _1695 = fma(_1683, _1687, _1669);
    float _1697 = -_1677;
    float _1699 = _1697 + _1679;
    out.m_51.x = _1689;
    float _1701 = fma(_1683, _1693, _1673);
    float _1703 = _1695 * 0.586610972881317138671875;
    bool _1705 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1707 = fma(_1683, _1699, _1677);
    float _1709 = fma(_1701, 0.298911988735198974609375, _1703);
    bool _1711 = _1439 > 0.0;
    bool _1713 = isnan(_1439);
    bool _1715 = _1711 || _1713;
    bool _1717 = isnan(0.0);
    bool _1719 = _1715 || _1717;
    float _1721 = fma(_1707, 0.114477999508380889892578125, _1709);
    bool _1723 = _1473 <= 0.0;
    bool _1725 = !_1719;
    bool _1727 = _1723 || _1725;
    float _1729 = -_1721;
    float _1731 = _1701 + _1729;
    float _1733 = -_1721;
    float _1735 = _1695 + _1733;
    float _1737 = -_1721;
    float _1739 = _1707 + _1737;
    float _1741 = fma(_1731, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1721);
    float _1743 = fma(_1735, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1721);
    float _1745 = fma(_1739, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1721);
    bool _1747 = !_1705;
    if (!_1747)
    {
        float _1749 = -_500;
        float _1751 = _1749 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1753 = -_504;
        float _1755 = _1753 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1757 = -_508;
        float _1759 = _1757 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1761 = _1751 * _1751;
        float _1763 = fma(_1755, _1755, _1761);
        float _1765 = fma(_1759, _1759, _1763);
        float _1767 = sqrt(_1765);
        float _1769 = rsqrt(_1765);
        float _1771 = -_1767;
        float _1773 = _1771 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1775 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1777 = precise::clamp(_1775, 0.0, 1.0);
        float _1779 = _1755 * _1769;
        float _1781 = _1751 * _1769;
        float _1783 = abs(_1777);
        float _1785 = log2(_1783);
        float _1787 = _1759 * _1769;
        float _1789 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1791 = _1447 * _1781;
        float _1793 = -_1781;
        float _1795 = -_1789;
        float _1797 = fma(_1793, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1795);
        float _1799 = fma(_1391, _1779, _1791);
        float _1801 = -_1787;
        float _1803 = fma(_1801, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1797);
        float _1805 = fma(_1393, _1787, _1799);
        float _1807 = precise::clamp(_1805, 0.0, 1.0);
        float _1809 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1811 = _1803 + _1809;
        float _1813 = _1785 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1815 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1817 = precise::clamp(_1815, 0.0, 1.0);
        float _1819 = exp2(_1813);
        float _1821 = _1819 * _1817;
        float _1823 = _1807 * _1821;
        float _1825 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1827 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1829 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _1825;
        out.m_87.y = _1827;
        out.m_87.z = _1829;
    }
    out.m_89.x = _1741;
    out.m_89.y = _1743;
    out.m_89.z = _1745;
    if (!_1727)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _1831 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1831;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1583 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = in.m_46.w;
    float _107 = trunc(_103);
    int _110 = int(_107);
    float _112 = -_105;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _114;
    bool _118 = _110 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    if (!_118)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_118)
    {
        float _126 = _122 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1897 = as_type<float>(_128);
        out.gl_Position.z = _1897;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _132 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_105);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = float(_110);
    bool _144 = _114 >= _142;
    bool _146 = !_140;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_51.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _130 = as_type<int>(_154);
    }
    int _156 = _130;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1953 = as_type<float>(_156);
        out.gl_Position.z = _1953;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_53.w;
    float _160 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_46.x;
    float _174 = in.m_46.y;
    float _176 = in.m_46.z;
    float _178 = in.m_44.x;
    float _180 = in.m_44.y;
    float _182 = in.m_44.z;
    float _184 = 0.0;
    float _186 = _160;
    if (!_170)
    {
        float _188 = _160 * _160;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_170)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    bool _200 = !_170;
    float _202 = _198;
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _160 * _206;
        float _216 = exp2(_214);
        float _218 = _212 * 0.693147182464599609375;
        float _220 = 1.0 / _218;
        float _222 = 1.0 / _210;
        float _224 = _216 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _220, _160);
        float _230 = _228 * _222;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _232;
    }
    float _234 = _202;
    bool _236 = !_170;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _160 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _186 = _256;
    }
    float _258 = _186;
    float _260 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _264 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_258, _174, _260);
    float _268 = fma(_258, _172, _262);
    float _270 = fma(_258, _176, _264);
    float _272 = fma(_266, _158, _180);
    float _274 = fma(_268, _158, _178);
    float _276 = fma(_270, _158, _182);
    float _278 = in.m_55.x;
    float _280 = in.m_55.y;
    float _282 = in.m_55.z;
    float _284 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _286 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _288 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _290 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _284);
    float _292 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _286);
    float _294 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _288);
    float _296 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _290);
    float _298 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _292);
    float _300 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _294);
    float _302 = _296 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _304 = _298 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _306 = _300 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _308 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _310 = _302 + _308;
    float _312 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _314 = _304 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _318 = _306 + _316;
    float _320 = _310 * _310;
    float _322 = fma(_314, _314, _320);
    float _324 = fma(_318, _318, _322);
    float _326 = rsqrt(_324);
    float _328 = _310 * _326;
    float _330 = _314 * _326;
    float _332 = _318 * _326;
    float _334 = -_328;
    float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[18].w, _310);
    float _338 = -_330;
    float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _314);
    float _342 = -_332;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[18].w, _318);
    float _346 = in.m_53.x;
    float _348 = in.m_53.y;
    float _350 = in.m_53.z;
    float _352 = _336 * _336;
    float _354 = fma(_340, _340, _352);
    float _356 = fma(_344, _344, _354);
    float _358 = sqrt(_356);
    float _360 = _348 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _362 = _346 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _364 = _350 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _366 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _368 = _326 * _358;
    float _370 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _280);
    float _372 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _374 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _278);
    float _376 = _368 * _366;
    float _378 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _380 = _368 * _372;
    float _382 = _370 * _376;
    float _384 = _368 * _378;
    float _386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _282);
    float _388 = _374 * _380;
    float _390 = _382 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _392 = _382 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _394 = _386 * _384;
    float _396 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[10].x, _390);
    float _398 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[8].x, _392);
    float _400 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[10].z, _396);
    float _402 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[8].z, _398);
    float _404 = _306 + _400;
    float _406 = _304 + _402;
    float _408 = _382 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _410 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _412 = _404 + _410;
    float _414 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _416 = _406 + _414;
    float _418 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[9].x, _408);
    float _420 = _412 * _412;
    float _422 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[9].z, _418);
    float _424 = fma(_416, _416, _420);
    float _426 = _302 + _422;
    float _428 = sqrt(_424);
    bool _430 = _428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _432 = _420;
    float _434 = _382;
    float _436 = _418;
    float _438 = _416;
    float _440 = _412;
    if (!_430)
    {
        _432 = _406;
    }
    float _442 = _432;
    float _444 = _442;
    if (!_430)
    {
        _434 = _404;
    }
    float _446 = _434;
    float _448 = _446;
    if (!_430)
    {
        _436 = _426;
    }
    float _450 = _436;
    bool _452 = !_430;
    float _454 = _450;
    if (!_452)
    {
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _458 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _460 = _428 + _458;
        float _462 = _426 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _464 = rsqrt(_424);
        float _466 = _460 * _456;
        float _468 = _466 * 0.15915493667125701904296875;
        float _470 = _468 * 6.283185482025146484375;
        float _472 = sin(_470);
        float _474 = _468 * 6.283185482025146484375;
        float _476 = cos(_474);
        float _478 = fma(_472, _462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _480 = _464 * _478;
        float _482 = _476 + (-1.0);
        float _484 = _482 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _486 = fma(_416, _480, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _488 = fma(_412, _480, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _490 = fma(_426, _476, _484);
        _454 = _490;
        _444 = _486;
        _448 = _488;
    }
    float _492 = _454;
    float _494 = _444;
    float _496 = _448;
    float _498 = -_328;
    float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _502 = -_330;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _494);
    float _506 = -_332;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _510 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _512 = _500 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _516 = _504 + _514;
    float _518 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _520 = _508 + _518;
    float _522 = _512 * _512;
    float _524 = fma(_516, _516, _522);
    float _526 = fma(_520, _520, _524);
    float _528 = rsqrt(_526);
    float _530 = sqrt(_526);
    float _532 = _528 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _534 = _516 * _532;
    float _536 = _520 * _532;
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
    float _558 = _512;
    if (_546)
    {
        float _560 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _552 = _560;
    }
    float _562 = _552;
    if (_546)
    {
        float _564 = rsqrt(_542);
        _554 = _564;
    }
    float _566 = _554;
    float _568 = _566;
    if (_546)
    {
        float _570 = _550 * _562;
        _556 = _570;
    }
    float _572 = _556;
    if (_546)
    {
        float _574 = _572 * 0.15915493667125701904296875;
        _438 = _574;
    }
    float _576 = _438;
    float _578 = _520;
    if (_546)
    {
        float _580 = _576 * 6.283185482025146484375;
        float _582 = sin(_580);
        _578 = _582;
    }
    float _584 = _578;
    float _586 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _588 = precise::max(0.0, _586);
    float _590 = _562;
    float _592 = _588;
    if (_546)
    {
        float _594 = _576 * 6.283185482025146484375;
        float _596 = cos(_594);
        _590 = _596;
    }
    float _598 = _590;
    float _600 = -_532;
    float _602 = -_588;
    float _604 = fma(_512, _600, _602);
    if (_546)
    {
        float _606 = _604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _558 = _606;
    }
    float _608 = _558;
    float _610 = _500 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _612 = _608;
    float _614 = _584;
    if (_546)
    {
        float _616 = fma(_584, _608, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _612 = _616;
    }
    float _618 = _612;
    float _620 = _618;
    if (!_546)
    {
        _614 = _534;
    }
    float _622 = _614;
    float _624 = _622;
    float _626 = _598;
    if (_546)
    {
        float _628 = _598 + (-1.0);
        _592 = _628;
    }
    float _630 = _592;
    float _632 = 0.0;
    float _634 = _630;
    if (_546)
    {
        float _636 = _566 * _618;
        _632 = _636;
    }
    float _638 = _632;
    if (!_546)
    {
        _620 = _604;
    }
    float _640 = _620;
    float _642 = _640;
    if (_546)
    {
        float _644 = _630 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _440 = _644;
    }
    float _646 = _440;
    if (_546)
    {
        float _648 = _534 * _638;
        _624 = _648;
    }
    float _650 = _624;
    if (!_546)
    {
        _634 = _536;
    }
    float _652 = _634;
    float _654 = _652;
    if (_546)
    {
        float _656 = _536 * _638;
        _654 = _656;
    }
    float _658 = _654;
    if (!_546)
    {
        _568 = _538;
    }
    float _660 = _568;
    float _662 = _660;
    if (_546)
    {
        float _664 = fma(_604, _598, _646);
        _642 = _664;
    }
    float _666 = _642;
    if (_546)
    {
        float _668 = _650 * _650;
        _662 = _668;
    }
    float _670 = _662;
    if (!_546)
    {
        _626 = _540;
    }
    float _672 = _626;
    float _674 = _672;
    if (_546)
    {
        float _676 = _658 * _658;
        _674 = _676;
    }
    float _678 = _674;
    float _680 = fma(_666, _666, _670);
    float _682 = _500 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _684 = _680 + _678;
    float _686 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _688 = fma(_530, (*spvDescriptorSet0.vp_c15)._m0[23].w, _686);
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[2].x, _610);
    float _694 = _500 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _696 = rsqrt(_684);
    float _698 = -_690;
    float _700 = _698 + 1.0;
    float _702 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[2].z, _692);
    float _704 = _500 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _706 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[1].x, _694);
    float _708 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[3].x, _682);
    float _710 = _702 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _712 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[0].x, _704);
    float _714 = abs(_700);
    float _716 = log2(_714);
    float _718 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[1].z, _706);
    float _720 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[3].z, _708);
    float _722 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[0].z, _712);
    float _724 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _726 = _718 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _728 = _710 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _730 = _722 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _732 = _696 * _650;
    float _734 = _726 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _736 = _696 * _666;
    float _738 = _696 * _658;
    float _740 = _732 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _742 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[7].x, _734);
    float _744 = _720 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _746 = -_728;
    float _748 = fma(_746, _724, 1.0);
    float _750 = _716 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _752 = -_740;
    float _754 = fma(_736, (*spvDescriptorSet0.vp_c15)._m0[21].y, _752);
    float _756 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[7].z, _742);
    float _758 = log2(_748);
    float _760 = -_738;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c15)._m0[21].z, _754);
    float _764 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[7].w, _756);
    float _766 = _726 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _768 = _726 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _770 = fma(_762, -0.5, 0.5);
    float _772 = fma(_762, 0.5, 0.5);
    float _774 = exp2(_750);
    float _776 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[4].x, _766);
    float _778 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[5].x, _768);
    float _780 = _736 + 1.0;
    float _782 = fma(_772, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _784 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[4].z, _776);
    float _786 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[5].z, _778);
    float _788 = 1.0 / _764;
    float _790 = fma(_772, _782, -0.212114393711090087890625);
    float _792 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[4].w, _784);
    float _794 = _758 * 0.693147182464599609375;
    float _796 = fma(_772, _790, 1.570728778839111328125);
    float _798 = _794 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _800 = sqrt(_770);
    float _802 = -_736;
    float _804 = fma(_774, _780, _802);
    float _806 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[5].w, _786);
    float _808 = fma(_804, 0.5, 0.5);
    float _810 = _792 * _788;
    float _812 = _806 * _788;
    float _814 = fma(_810, 0.5, 0.5);
    float _816 = fma(_812, -0.5, 0.5);
    float _818 = _800 * 0.636619746685028076171875;
    float3 _3053 = float3(_814, _816, _798);
    float _820 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3053, float3(0.0), isnan(_3053)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3053, float3(0.0), isnan(_3053)), level(0.0)).x;
    float3 _3064 = float3(_814, _816, _798);
    float4 _823 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3064, float3(0.0), isnan(_3064)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3064, float3(0.0), isnan(_3064)), level(0.0)).xyzw;
    float _825 = _823.x;
    float _827 = _823.y;
    float _829 = _823.z;
    float _831 = _823.w;
    float _833 = -_796;
    float _835 = fma(_818, _833, 1.0);
    float2 _3086 = float2(_835, _808);
    float3 _839 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3086, float2(0.0), isnan(_3086)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3086, float2(0.0), isnan(_3086)), level(0.0)).xyz;
    float _841 = _839.x;
    float _843 = _839.y;
    float _845 = _839.z;
    float _847 = in.m_57.y;
    float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _851 = in.m_59.y;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _855 = _853 != 0;
    float _857 = -_328;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[18].w, _302);
    float _861 = in.m_57.x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _865 = in.m_57.z;
    float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _871 = in.m_59.x;
    float _873 = -_330;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _879 = _877 != 0;
    float _881 = -_332;
    float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[18].w, _306);
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _889 = _887 != 0;
    float _891 = _847 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _893 = _847 > 0.5;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _897 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[78].w, _885);
    float _899 = fma(_891, -2.0, _863);
    float _901 = -_851;
    float _903 = _901 + 1.0;
    float _905 = _867 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _909 = _907 != 0;
    float _911 = _861 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _915 = _913 != 0;
    float _917 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _899);
    float _919 = _893 ? _903 : _851;
    float _921 = -_869;
    float _923 = fma(_911, 2.0, _921);
    float _925 = _911;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _929 = _919;
    float _931 = _861;
    float _933 = _814;
    float _935 = _851;
    float _937 = _871;
    float _939 = _764;
    if (_855)
    {
        _925 = _865;
    }
    float _941 = _925;
    float _943 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[88].w, _895);
    float _945 = _879 ? _919 : _851;
    float _947 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _897);
    float _949 = _941;
    if (_855)
    {
        _927 = _941;
    }
    float _951 = _927;
    float _953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _955 = _951;
    if (!_855)
    {
        _949 = _865;
    }
    float _957 = _949;
    float _959 = fma(_905, _945, -0.5);
    if (_855)
    {
        _929 = _847;
    }
    float _961 = _929;
    float _963 = _716 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _965 = _961;
    if (!_855)
    {
        _955 = _847;
    }
    float _967 = _955;
    float _969 = -_917;
    float _971 = fma(_947, _959, _969);
    float _973 = in.m_61.x;
    float _975 = in.m_61.y;
    float _977 = in.m_61.z;
    float _979 = _726 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _981 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _983 = _280 != 0.0;
    bool _985 = isnan(_280);
    bool _987 = _983 || _985;
    bool _989 = isnan(0.0);
    bool _991 = _987 || _989;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    int _995 = as_type<int>(_967);
    float _997 = _993;
    if (!_855)
    {
        _965 = _861;
    }
    float _999 = _965;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1003 = false;
    int _1005 = as_type<int>(_999);
    float _1007 = _1001;
    if (_889)
    {
        bool _1009 = _861 > 0.5;
        _1003 = _1009;
    }
    bool _1011 = _1003;
    float _1013 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[78].z, _981);
    float _1015 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[89].z, _993);
    float _1017 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1001);
    if (_889)
    {
        float _1019 = -_871;
        float _1021 = _1019 + 1.0;
        _995 = as_type<int>(_1021);
    }
    int _1023 = _995;
    if (!_855)
    {
        _931 = _957;
    }
    float _1025 = _931;
    float _1027 = _999 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1029 = _957 > 0.5;
    if (_909)
    {
        float _1031 = -_871;
        float _1033 = _1031 + 1.0;
        _1005 = as_type<int>(_1033);
    }
    int _1035 = _1005;
    bool _1037 = _278 == 0.0;
    bool _1039 = !_991;
    bool _1041 = _1037 && _1039;
    float _1043 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1015);
    float _1045 = as_type<float>(_1035);
    if (!_889)
    {
        _933 = _871;
    }
    float _1047 = _933;
    float _1049 = exp2(_963);
    float _1051 = _1047;
    if (_889)
    {
        float _1053 = _1011 ? as_type<float>(_1023) : _871;
        _1051 = _1053;
    }
    float _1055 = _1051;
    float _1057 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[6].x, _979);
    if (_915)
    {
        float _1059 = _1029 ? _903 : _851;
        _935 = _1059;
    }
    float _1061 = _935;
    float _1063 = in.m_63.w;
    float _1065 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1057);
    bool _1067 = _282 == 0.0;
    bool _1069 = _1067 && _1041;
    float _1071 = in.m_65.x;
    float _1073 = in.m_65.y;
    float _1075 = in.m_65.z;
    float _1077 = in.m_65.w;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_909)
    {
        float _1081 = _893 ? as_type<float>(_1035) : _871;
        _937 = _1081;
    }
    float _1083 = _937;
    float _1085 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1017);
    float _1087 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[87].w, _943);
    float _1089 = fma(_1027, -2.0, _1079);
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1095 = -_1049;
    float _1097 = _1095 + 1.0;
    out.m_67.x = _504;
    out.m_67.y = _500;
    out.m_67.z = _508;
    bool _1099 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1101 = isnan(_530);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1107 = _1103 || _1105;
    float _1109 = 0.0;
    if (_1069)
    {
        _1109 = _975;
    }
    float _1111 = _1109;
    float _1113 = 0.0;
    float _1115 = _1111;
    if (_1069)
    {
        _1113 = _973;
    }
    float _1117 = _1113;
    float _1119 = 0.0;
    float _1121 = _1117;
    if (_1069)
    {
        _1119 = _977;
    }
    float _1123 = _1119;
    float _1125 = _1123;
    if (_1069)
    {
        _1007 = _1111;
    }
    float _1127 = _1007;
    out.m_69.w = _1063;
    float _1129 = _1127;
    if (!_1069)
    {
        _1115 = _975;
    }
    float _1131 = _1115;
    float _1133 = _1025 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_1069)
    {
        _1045 = _1117;
    }
    float _1135 = _1045;
    float _1137 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1139 = _1135;
    if (_1069)
    {
        _997 = _1123;
    }
    float _1141 = _997;
    float _1143 = _1141;
    if (!_1069)
    {
        float _1145 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1131);
        _1129 = _1145;
    }
    float _1147 = _1129;
    if (!_1069)
    {
        _1121 = _973;
    }
    float _1149 = _1121;
    float _1151 = _849 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1069)
    {
        _1125 = _977;
    }
    float _1153 = _1125;
    float _1155 = _953 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1157 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1159 = -_1091;
    float _1161 = fma(_1133, 2.0, _1159);
    float _1163 = fma(_1151, _1083, -0.5);
    float _1165 = fma(_1155, _1061, -0.5);
    float _1167 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1157);
    float _1169 = fma(_1137, _1055, -0.5);
    float _1171 = _1077;
    if (!_1069)
    {
        float _1173 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1149);
        _1139 = _1173;
    }
    float _1175 = _1139;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1179 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1183 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1167);
    float _1185 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1013);
    float _1187 = -_114;
    float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[76].x, _923);
    float _1191 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1193 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1197 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1199 = _1179 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1201 = _1181 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1203 = fma(_1185, _1169, _1189);
    float _1205 = _859 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1207 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1191);
    float _1209 = fma(_1071, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1193);
    out.m_71.x = _1197;
    out.m_71.y = _1199;
    out.m_71.z = _1201;
    out.m_71.w = _1195;
    float _1211 = _1075 * _1149;
    float _1213 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1207);
    float _1215 = fma(_1075, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1209);
    float _1217 = _1071 * _1131;
    float _1219 = _859 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (!_1069)
    {
        float _1221 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1153);
        _1143 = _1221;
    }
    float _1223 = _1143;
    bool _1225 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1227 = isnan(0.5);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1233 = _1229 || _1231;
    out.m_73.x = _1183;
    out.m_73.y = _1213;
    out.m_73.z = _1215;
    float _1235 = -_1217;
    float _1237 = fma(_1073, _1149, _1235);
    float _1239 = _1203 + 0.5;
    float _1241 = in.m_63.x;
    float _1243 = _1237 * _1077;
    float _1245 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1205);
    float _1247 = _1073 * _1153;
    float _1249 = _1043 * (-0.15915493667125701904296875);
    float _1251 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1219);
    float _1253 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1245);
    float _1255 = -_1247;
    float _1257 = fma(_1075, _1131, _1255);
    float _1259 = -_1211;
    float _1261 = fma(_1071, _1153, _1259);
    float _1263 = _1249 * 6.283185482025146484375;
    float _1265 = sin(_1263);
    float _1267 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1269 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1089);
    float _1271 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1251);
    float _1273 = _1147 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1275 = _1261 * _1077;
    float _1277 = _1257 * _1077;
    float _1279 = _1271 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1281 = _1249 * 6.283185482025146484375;
    float _1283 = cos(_1281);
    float _1285 = fma(_1175, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1273);
    float _1287 = _1275;
    float _1289 = _1239;
    if (!_1233)
    {
        _1171 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1291 = _1171;
    float _1293 = _1279 + _1267;
    float _1295 = _1147 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1297 = _1147 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1299 = -_114;
    float _1301 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1161);
    out.m_69.x = _1241;
    float _1303 = 1.0 / _1267;
    float _1305 = _1265 * _1165;
    float _1307 = fma(_1175, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1295);
    float _1309 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1311 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1313 = fma(_1175, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1297);
    float _1315 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1065);
    float _1317 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1309);
    float _1319 = _1283 * _1165;
    float _1321 = -_1305;
    float _1323 = fma(_1283, _1163, _1321);
    float _1325 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1327 = fma(_1265, _1163, _1319);
    float _1329 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1311);
    float _1331 = _971 + 0.5;
    float _1333 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1325);
    float _1335 = _1293 * _1303;
    float _1337 = _1335 * 0.5;
    float _1339 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1329);
    out.gl_Position.x = _792;
    out.gl_Position.y = _806;
    out.gl_Position.z = _1315;
    out.gl_Position.w = _764;
    float _1341 = fma(_1085, _1323, _1301);
    float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1345 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1343);
    float _1347 = _1337;
    float _1349 = _1315;
    float _1351 = _1291;
    if (!_1233)
    {
        float _1353 = -_1291;
        float _1355 = _1353 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1347 = _1355;
    }
    float _1357 = _1347;
    float _1359 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1333);
    float _1361 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1317);
    out.m_75.x = _1239;
    out.m_75.y = _1331;
    float _1363 = _1361;
    if (!_1233)
    {
        float _1365 = 1.0 / _1357;
        _1287 = _1365;
    }
    float _1367 = _1287;
    float _1369 = -_1269;
    float _1371 = fma(_1087, _1327, _1369);
    float _1373 = _1341 + 0.5;
    out.m_77.x = _1359;
    out.m_77.y = _1361;
    out.m_77.z = _1339;
    float _1375 = _1371 + 0.5;
    float _1377 = 1.0 / _1345;
    float _1379 = _1315 + _764;
    if (_1233)
    {
        _1289 = 1.0;
    }
    float _1381 = _1289;
    out.m_79.x = _1373;
    out.m_79.y = _1375;
    float _1383 = _1379 * 0.5;
    float _1385 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1387 = _1381;
    if (!_1233)
    {
        _1363 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1389 = _1363;
    float _1391 = fma(_1223, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1285);
    float _1393 = fma(_1223, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1313);
    float _1395 = -_1385;
    float _1397 = _1395 + 1.0;
    out.m_81.z = _1383;
    out.m_81.w = _764;
    float _1399 = _1397;
    if (!_1107)
    {
        _939 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1401 = _939;
    float _1403 = _1401;
    float _1405 = _1401;
    if (!_1107)
    {
        _1349 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1407 = _1349;
    float _1409 = _1377;
    float _1411 = _1407;
    float _1413 = _1407;
    if (!_1233)
    {
        float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1417 = -_1291;
        float _1419 = fma(_1377, _1415, _1417);
        _1351 = _1419;
    }
    float _1421 = _1351;
    float _1423 = _1421;
    if (!_1233)
    {
        float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1427 = -_1389;
        float _1429 = fma(_1377, _1425, _1427);
        _1409 = _1429;
    }
    float _1431 = _1409;
    float _1433 = _1431;
    if (!_1233)
    {
        float _1435 = _1421 * _1367;
        float _1437 = precise::clamp(_1435, 0.0, 1.0);
        _1387 = _1437;
    }
    float _1439 = _1387;
    if (!_1233)
    {
        float _1441 = -_1389;
        float _1443 = _1441 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1423 = _1443;
    }
    float _1445 = _1423;
    float _1447 = fma(_1223, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1307);
    float _1449 = _1445;
    if (!_1233)
    {
        float _1451 = 1.0 / _1445;
        _1449 = _1451;
    }
    float _1453 = _1449;
    out.m_83.x = _1391;
    out.m_83.y = _1447;
    out.m_83.z = _1393;
    float _1455 = _1453;
    if (!_1233)
    {
        float _1457 = _1431 * _1453;
        float _1459 = precise::clamp(_1457, 0.0, 1.0);
        _1433 = _1459;
    }
    float _1461 = _1433;
    float _1463 = _1461;
    if (_1233)
    {
        _1455 = 1.0;
    }
    float _1465 = _1455;
    float _1467 = _1465;
    if (!_1233)
    {
        float _1469 = -_1461;
        float _1471 = _1469 + 1.0;
        _1467 = _1471;
    }
    float _1473 = _1467;
    if (!_1107)
    {
        _1463 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1475 = _1463;
    float _1477 = _1385 * _820;
    float _1479 = _831 * _1397;
    float _1481 = _1439 * _1473;
    float _1483 = _1481;
    float _1485 = _1475;
    float _1487 = _1475;
    if (!_1107)
    {
        _1399 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1489 = _1399;
    float _1491 = _831 * _1477;
    float _1493 = _1481 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1495 = _845 * _1477;
    float _1497 = fma(_841, _1491, _825);
    float _1499 = fma(_843, _1491, _827);
    float _1501 = _1491;
    float _1503 = _1489;
    float _1505 = _1489;
    if (!_1107)
    {
        _1501 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1507 = _1501;
    float _1509 = fma(_831, _1495, _829);
    float _1511 = _1507;
    float _1513 = _1507;
    if (!_1107)
    {
        _1483 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1515 = _1483;
    out.m_85.x = _1497;
    out.m_85.y = _1499;
    out.m_85.z = _1509;
    out.m_85.w = _1479;
    bool _1517 = !_1107;
    float _1519 = _1515;
    float _1521 = _1515;
    if (!_1517)
    {
        bool _1523 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1525 = isnan(_530);
        bool _1527 = _1523 || _1525;
        bool _1529 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1531 = _1527 || _1529;
        if (!_1531)
        {
            float _1533 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1535 = _530 + _1533;
            float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1539 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1537;
            float _1541 = 1.0 / _1539;
            float _1543 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1545 = _1543 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1547 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1549 = _1547 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1553 = _1551 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1557 = _1555 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1559 = _1535 * _1541;
            float _1561 = precise::clamp(_1559, 0.0, 1.0);
            float _1563 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1565 = _1563 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1567 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1569 = _1567 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1571 = fma(_1561, _1545, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1573 = fma(_1561, _1565, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1575 = fma(_1561, _1569, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1577 = fma(_1561, _1549, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1579 = fma(_1561, _1553, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1581 = fma(_1561, _1557, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1513 = _1575;
            _1487 = _1579;
            _1405 = _1573;
            _1505 = _1577;
            _1413 = _1571;
            _1521 = _1581;
            _1583 = true;
        }
        else
        {
            bool _1585 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1587 = isnan(_530);
            bool _1589 = _1585 || _1587;
            bool _1591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1593 = _1589 || _1591;
            if (!_1593)
            {
                _1403 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1595 = _1403;
            _1405 = _1595;
            if (!_1593)
            {
                _1511 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1597 = _1511;
            _1513 = _1597;
            if (!_1593)
            {
                _1411 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1599 = _1411;
            _1413 = _1599;
            if (!_1593)
            {
                _1503 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1601 = _1503;
            _1505 = _1601;
            if (!_1593)
            {
                _1485 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1603 = _1485;
            _1487 = _1603;
            if (!_1593)
            {
                _1519 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1605 = _1519;
            bool _1607 = !_1593;
            _1521 = _1605;
            if (!_1607)
            {
                bool _1609 = _530 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1611 = isnan(_530);
                bool _1613 = _1609 || _1611;
                bool _1615 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1617 = _1613 || _1615;
                if (!_1617)
                {
                    float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1621 = _530 + _1619;
                    float _1623 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1625 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1623;
                    float _1627 = 1.0 / _1625;
                    float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1631 = _1629 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1635 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1637 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1639 = _1637 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1643 = _1641 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1645 = _1621 * _1627;
                    float _1647 = precise::clamp(_1645, 0.0, 1.0);
                    float _1649 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1651 = _1649 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1653 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1655 = _1653 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1657 = fma(_1647, _1631, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1659 = fma(_1647, _1651, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1661 = fma(_1647, _1655, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1663 = fma(_1647, _1635, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1665 = fma(_1647, _1639, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1667 = fma(_1647, _1643, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1513 = _1661;
                    _1487 = _1665;
                    _1405 = _1659;
                    _1505 = _1663;
                    _1413 = _1657;
                    _1521 = _1667;
                    _1583 = true;
                }
                else
                {
                    _1513 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1487 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1405 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1505 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1413 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1521 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1583 = false;
    float _1669 = _1513;
    float _1671 = _1487;
    float _1673 = _1405;
    float _1675 = _1505;
    float _1677 = _1413;
    float _1679 = _1521;
    float _1681 = fma(_1447, -0.5, 0.5);
    float _1683 = precise::clamp(_1681, 0.0, 1.0);
    float _1685 = -_1669;
    float _1687 = _1685 + _1671;
    float _1689 = _1493 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1691 = -_1673;
    float _1693 = _1691 + _1675;
    out.m_87.x = 0.0;
    float _1695 = fma(_1683, _1687, _1669);
    float _1697 = -_1677;
    float _1699 = _1697 + _1679;
    out.m_51.x = _1689;
    float _1701 = fma(_1683, _1693, _1673);
    float _1703 = _1695 * 0.586610972881317138671875;
    bool _1705 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1707 = fma(_1683, _1699, _1677);
    float _1709 = fma(_1701, 0.298911988735198974609375, _1703);
    bool _1711 = _1439 > 0.0;
    bool _1713 = isnan(_1439);
    bool _1715 = _1711 || _1713;
    bool _1717 = isnan(0.0);
    bool _1719 = _1715 || _1717;
    float _1721 = fma(_1707, 0.114477999508380889892578125, _1709);
    bool _1723 = _1473 <= 0.0;
    bool _1725 = !_1719;
    bool _1727 = _1723 || _1725;
    float _1729 = -_1721;
    float _1731 = _1701 + _1729;
    float _1733 = -_1721;
    float _1735 = _1695 + _1733;
    float _1737 = -_1721;
    float _1739 = _1707 + _1737;
    float _1741 = fma(_1731, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1721);
    float _1743 = fma(_1735, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1721);
    float _1745 = fma(_1739, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1721);
    bool _1747 = !_1705;
    if (!_1747)
    {
        float _1749 = -_500;
        float _1751 = _1749 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1753 = -_504;
        float _1755 = _1753 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1757 = -_508;
        float _1759 = _1757 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1761 = _1751 * _1751;
        float _1763 = fma(_1755, _1755, _1761);
        float _1765 = fma(_1759, _1759, _1763);
        float _1767 = sqrt(_1765);
        float _1769 = rsqrt(_1765);
        float _1771 = -_1767;
        float _1773 = _1771 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1775 = _1773 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1777 = precise::clamp(_1775, 0.0, 1.0);
        float _1779 = _1755 * _1769;
        float _1781 = _1751 * _1769;
        float _1783 = abs(_1777);
        float _1785 = log2(_1783);
        float _1787 = _1759 * _1769;
        float _1789 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1791 = _1447 * _1781;
        float _1793 = -_1781;
        float _1795 = -_1789;
        float _1797 = fma(_1793, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1795);
        float _1799 = fma(_1391, _1779, _1791);
        float _1801 = -_1787;
        float _1803 = fma(_1801, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1797);
        float _1805 = fma(_1393, _1787, _1799);
        float _1807 = precise::clamp(_1805, 0.0, 1.0);
        float _1809 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1811 = _1803 + _1809;
        float _1813 = _1785 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1815 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1817 = precise::clamp(_1815, 0.0, 1.0);
        float _1819 = exp2(_1813);
        float _1821 = _1819 * _1817;
        float _1823 = _1807 * _1821;
        float _1825 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1827 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1829 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _1825;
        out.m_87.y = _1827;
        out.m_87.z = _1829;
    }
    out.m_89.x = _1741;
    out.m_89.y = _1743;
    out.m_89.z = _1745;
    if (!_1727)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _1831 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1831;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

