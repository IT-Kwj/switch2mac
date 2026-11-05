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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    float _102 = as_type<float>(_94);
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _100;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1266 = as_type<float>(_110);
        out.gl_Position.z = _1266;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_124)
    {
        float _130 = float(_94);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1335 = as_type<float>(_146);
        out.gl_Position.z = _1335;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_49.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_47.x;
    float _164 = in.m_47.y;
    float _166 = in.m_47.z;
    float _168 = in.m_42.x;
    float _170 = in.m_42.y;
    float _172 = in.m_42.z;
    float _174 = 0.0;
    float _176 = _150;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_160)
    {
        float _180 = _150 * _150;
        float _182 = _180 * 0.5;
        _174 = _182;
    }
    float _184 = _174;
    float _186 = _184;
    if (!_160)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_160;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _150 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _150);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_160;
    float _230 = 0.0;
    if (!_228)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _150 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _176 = _250;
        _230 = _240;
        _178 = _238;
    }
    float _252 = _176;
    float _254 = _230;
    float _256 = _178;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = in.m_51.x;
    float _264 = in.m_51.y;
    float _266 = in.m_51.z;
    float _268 = fma(_252, _164, _258);
    float _270 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_252, _162, _260);
    float _274 = fma(_268, _148, _170);
    float _276 = fma(_252, _166, _270);
    float _278 = fma(_272, _148, _168);
    float _280 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _282 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _284 = fma(_276, _148, _172);
    float _286 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _288 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _280);
    float _290 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _282);
    float _292 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _286);
    float _294 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _288);
    float _296 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _290);
    float _298 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _292);
    float _300 = _294 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _302 = _296 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _304 = _298 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _306 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _308 = _300 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _312 = _302 + _310;
    float _314 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _316 = _304 + _314;
    float _318 = _308 * _308;
    float _320 = fma(_312, _312, _318);
    float _322 = fma(_316, _316, _320);
    float _324 = rsqrt(_322);
    float _326 = _308 * _324;
    float _328 = _312 * _324;
    float _330 = _316 * _324;
    float _332 = -_326;
    float _334 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _308);
    float _336 = -_328;
    float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[18].w, _312);
    float _340 = -_330;
    float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[18].w, _316);
    float _344 = _334 * _334;
    float _346 = in.m_49.x;
    float _348 = in.m_49.y;
    float _350 = in.m_49.z;
    float _352 = fma(_338, _338, _344);
    float _354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _262);
    float _356 = fma(_342, _342, _352);
    float _358 = sqrt(_356);
    float _360 = _348 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _362 = _346 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _364 = _324 * _358;
    float _366 = _350 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _368 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _370 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _264);
    float _372 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _374 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _376 = _368 * _364;
    float _378 = _372 * _364;
    float _380 = _374 * _364;
    float _382 = _376 * _370;
    float _384 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _266);
    float _386 = _378 * _354;
    float _388 = _382 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _390 = _380 * _384;
    float _392 = _382 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _394 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[10].x, _388);
    float _396 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[8].x, _392);
    float _398 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[10].z, _394);
    float _400 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[8].z, _396);
    float _402 = _304 + _398;
    float _404 = _302 + _400;
    float _406 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _408 = _402 + _406;
    float _410 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _412 = _404 + _410;
    float _414 = _408 * _408;
    float _416 = fma(_412, _412, _414);
    float _418 = _382 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _420 = sqrt(_416);
    float _422 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[9].x, _418);
    float _424 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[9].z, _422);
    float _426 = _300 + _424;
    bool _428 = _420 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _430 = _424;
    float _432 = _422;
    float _434 = _402;
    float _436 = _386;
    float _438 = _254;
    float _440 = _416;
    if (!_428)
    {
        _430 = _404;
    }
    float _442 = _430;
    float _444 = _442;
    if (!_428)
    {
        _432 = _426;
    }
    float _446 = _432;
    bool _448 = !_428;
    float _450 = _446;
    if (!_448)
    {
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _454 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _456 = _420 + _454;
        float _458 = _426 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _460 = rsqrt(_416);
        float _462 = _456 * _452;
        float _464 = _462 * 0.15915493667125701904296875;
        float _466 = _464 * 6.283185482025146484375;
        float _468 = cos(_466);
        float _470 = _464 * 6.283185482025146484375;
        float _472 = sin(_470);
        float _474 = _468 + (-1.0);
        float _476 = fma(_472, _458, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _478 = _474 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _480 = _460 * _476;
        float _482 = fma(_426, _468, _478);
        float _484 = fma(_412, _480, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _486 = fma(_408, _480, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _450 = _482;
        _444 = _484;
        _434 = _486;
        _436 = _464;
    }
    float _488 = _450;
    float _490 = _444;
    float _492 = _434;
    float _494 = _436;
    float _496 = -_326;
    float _498 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[18].w, _488);
    float _500 = -_328;
    float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[18].w, _490);
    float _504 = -_330;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _510 = _498 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _514 = _502 + _512;
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _518 = _506 + _516;
    float _520 = _510 * _510;
    float _522 = fma(_514, _514, _520);
    float _524 = fma(_518, _518, _522);
    float _526 = rsqrt(_524);
    float _528 = sqrt(_524);
    float _530 = _526 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _532 = _514 * _530;
    float _534 = _518 * _530;
    float _536 = _532 * _532;
    float _538 = _534 * _534;
    float _540 = _536 + _538;
    float _542 = sqrt(_540);
    bool _544 = _542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _546 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _548 = _542 + _546;
    float _550 = _522;
    float _552 = _494;
    float _554 = _548;
    if (_544)
    {
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _550 = _556;
    }
    float _558 = _550;
    if (_544)
    {
        float _560 = rsqrt(_540);
        _552 = _560;
    }
    float _562 = _552;
    float _564 = _562;
    if (_544)
    {
        float _566 = _548 * _558;
        _554 = _566;
    }
    float _568 = _554;
    if (_544)
    {
        float _570 = _568 * 0.15915493667125701904296875;
        _438 = _570;
    }
    float _572 = _438;
    float _574 = _558;
    float _576 = _572;
    if (_544)
    {
        float _578 = _572 * 6.283185482025146484375;
        float _580 = sin(_578);
        _574 = _580;
    }
    float _582 = _574;
    float _584 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _586 = precise::max(0.0, _584);
    float _588 = _256;
    float _590 = _586;
    if (_544)
    {
        float _592 = _572 * 6.283185482025146484375;
        float _594 = cos(_592);
        _588 = _594;
    }
    float _596 = _588;
    float _598 = -_530;
    float _600 = -_586;
    float _602 = fma(_510, _598, _600);
    if (_544)
    {
        float _604 = _602 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _604;
    }
    float _606 = _590;
    float _608 = _582;
    float _610 = _606;
    if (_544)
    {
        float _612 = fma(_582, _606, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _440 = _612;
    }
    float _614 = _440;
    float _616 = _614;
    if (!_544)
    {
        _608 = _602;
    }
    float _618 = _608;
    float _620 = _618;
    float _622 = _596;
    if (_544)
    {
        float _624 = _596 + (-1.0);
        _610 = _624;
    }
    float _626 = _610;
    float _628 = 0.0;
    float _630 = _626;
    if (_544)
    {
        float _632 = _562 * _614;
        _628 = _632;
    }
    float _634 = _628;
    if (!_544)
    {
        _564 = _532;
    }
    float _636 = _564;
    float _638 = _636;
    if (_544)
    {
        float _640 = _626 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _576 = _640;
    }
    float _642 = _576;
    if (_544)
    {
        float _644 = _532 * _634;
        _638 = _644;
    }
    float _646 = _638;
    if (!_544)
    {
        _630 = _534;
    }
    float _648 = _630;
    float _650 = _648;
    if (_544)
    {
        float _652 = _534 * _634;
        _650 = _652;
    }
    float _654 = _650;
    if (!_544)
    {
        _616 = _536;
    }
    float _656 = _616;
    float _658 = _656;
    if (_544)
    {
        float _660 = fma(_602, _596, _642);
        _620 = _660;
    }
    float _662 = _620;
    if (_544)
    {
        float _664 = _646 * _646;
        _658 = _664;
    }
    float _666 = _658;
    float _668 = _498 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_544)
    {
        _622 = _538;
    }
    float _670 = _622;
    float _672 = _670;
    if (_544)
    {
        float _674 = _654 * _654;
        _672 = _674;
    }
    float _676 = _672;
    float _678 = fma(_662, _662, _666);
    float _680 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _682 = fma(_528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _680);
    float _684 = precise::clamp(_682, 0.0, 1.0);
    float _686 = _498 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _688 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[2].x, _668);
    float _690 = _678 + _676;
    float _692 = _498 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _694 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[1].x, _686);
    float _696 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[2].z, _688);
    float _698 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[0].x, _692);
    float _700 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[1].z, _694);
    float _702 = rsqrt(_690);
    float _704 = _696 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _706 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[0].z, _698);
    float _708 = _700 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _710 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _712 = _704 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _714 = _706 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _716 = _708 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _718 = -_684;
    float _720 = _718 + 1.0;
    float _722 = -_712;
    float _724 = fma(_722, _710, 1.0);
    float _726 = _498 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _728 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[7].x, _716);
    float _730 = abs(_720);
    float _732 = log2(_730);
    float _734 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[7].z, _728);
    float _736 = _702 * _646;
    float _738 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[3].x, _726);
    float _740 = _702 * _662;
    float _742 = _702 * _654;
    float _744 = _736 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _746 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[3].z, _738);
    float _748 = log2(_724);
    float _750 = _708 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _752 = -_744;
    float _754 = fma(_740, (*spvDescriptorSet0.vp_c15)._m0[21].y, _752);
    float _756 = _746 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _758 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[4].x, _750);
    float _760 = -_742;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c15)._m0[21].z, _754);
    float _764 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[7].w, _734);
    float _766 = _732 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _768 = _708 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _770 = fma(_762, -0.5, 0.5);
    float _772 = 1.0 / _764;
    float _774 = fma(_762, 0.5, 0.5);
    float _776 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[5].x, _768);
    float _778 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[4].z, _758);
    float _780 = _740 + 1.0;
    float _782 = fma(_774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _784 = _748 * 0.693147182464599609375;
    float _786 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[4].w, _778);
    float _788 = exp2(_766);
    float _790 = fma(_774, _782, -0.212114393711090087890625);
    float _792 = _784 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _794 = fma(_774, _790, 1.570728778839111328125);
    float _796 = sqrt(_770);
    float _798 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[5].z, _776);
    float _800 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[5].w, _798);
    float _802 = _786 * _772;
    float _804 = -_740;
    float _806 = fma(_788, _780, _804);
    float _808 = _800 * _772;
    float _810 = fma(_802, 0.5, 0.5);
    float _812 = fma(_806, 0.5, 0.5);
    float _814 = fma(_808, -0.5, 0.5);
    float _816 = _796 * 0.636619746685028076171875;
    float _818 = -_794;
    float _820 = fma(_816, _818, 1.0);
    float3 _2442 = float3(_810, _814, _792);
    float _822 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2442, float3(0.0), isnan(_2442)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2442, float3(0.0), isnan(_2442)), level(0.0)).x;
    float3 _2453 = float3(_810, _814, _792);
    float4 _825 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2453, float3(0.0), isnan(_2453)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2453, float3(0.0), isnan(_2453)), level(0.0)).xyzw;
    float _827 = _825.x;
    float _829 = _825.y;
    float _831 = _825.z;
    float _833 = _825.w;
    float2 _2470 = float2(_820, _812);
    float3 _837 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2470, float2(0.0), isnan(_2470)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2470, float2(0.0), isnan(_2470)), level(0.0)).xyz;
    float _839 = _837.x;
    float _841 = _837.y;
    float _843 = _837.z;
    float _845 = in.m_53.x;
    float _847 = in.m_53.y;
    float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _853 = _851 != 0;
    float _855 = in.m_55.y;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _859 = _857 != 0;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _863 = in.m_55.x;
    float _865 = -_326;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _300);
    float _869 = -_328;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _302);
    float _873 = -_330;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    out.m_57.x = _502;
    out.m_57.y = _498;
    out.m_57.z = _506;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _879 = _732 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _881 = 0.0;
    if (_853)
    {
        float _883 = in.m_53.x;
        _881 = _883;
    }
    float _885 = _881;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _891 = _708 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _893 = exp2(_879);
    float _895 = _845 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _897 = _847 > 0.5;
    float _899 = _847 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _901 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[78].z, _877);
    float _903 = -_855;
    float _905 = _903 + 1.0;
    float _907 = -_861;
    float _909 = fma(_895, 2.0, _907);
    float _911 = fma(_899, -2.0, _887);
    float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _915 = _849 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _917 = _855;
    float _919 = _849;
    if (_859)
    {
        float _921 = _897 ? _905 : _855;
        _917 = _921;
    }
    float _923 = _917;
    float _925 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _911);
    float _927 = in.m_59.x;
    float _929 = in.m_59.y;
    float _931 = in.m_59.z;
    bool _933 = _264 != 0.0;
    bool _935 = isnan(_264);
    bool _937 = _933 || _935;
    bool _939 = isnan(0.0);
    bool _941 = _937 || _939;
    float _943 = -_128;
    float _945 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[76].x, _909);
    float _947 = _863;
    if (_853)
    {
        _919 = _863;
    }
    float _949 = _919;
    float _951 = fma(_915, _923, -0.5);
    bool _953 = _262 == 0.0;
    bool _955 = !_941;
    bool _957 = _953 && _955;
    float _959 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[6].x, _891);
    bool _961 = _885 > 0.5;
    bool _963 = _961 && _853;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _967 = _266 == 0.0;
    bool _969 = _967 && _957;
    float _971 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[78].w, _965);
    float _973 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _901);
    float _975 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _971);
    float _977 = _949;
    if (_963)
    {
        float _979 = -_949;
        float _981 = _979 + 1.0;
        _977 = _981;
    }
    float _983 = _977;
    float _985 = -_925;
    float _987 = fma(_975, _951, _985);
    float _989 = in.m_61.w;
    float _991 = _927;
    float _993 = _929;
    float _995 = _931;
    float _997 = _987;
    if (!_969)
    {
        float _999 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[17].y, _927);
        _991 = _999;
    }
    float _1001 = _991;
    if (_853)
    {
        _947 = _983;
    }
    float _1003 = _947;
    if (!_969)
    {
        float _1005 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[17].y, _929);
        _993 = _1005;
    }
    float _1007 = _993;
    float _1009 = _913 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_969)
    {
        float _1011 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[17].y, _931);
        _995 = _1011;
    }
    float _1013 = _995;
    float _1015 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1017 = fma(_1009, _1003, -0.5);
    float _1019 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1021 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1023 = fma(_1001, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1015);
    float _1025 = fma(_973, _1017, _945);
    float _1027 = _867 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1029 = fma(_1001, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1019);
    float _1031 = fma(_1001, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1021);
    float _1033 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1027);
    float _1035 = fma(_1013, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1023);
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1043 = fma(_1013, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1029);
    float _1045 = fma(_1013, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1031);
    float _1047 = _987 + 0.5;
    float _1049 = _1025 + 0.5;
    float _1051 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1033);
    float _1053 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1055 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1057 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _1035;
    out.m_63.y = _1043;
    out.m_63.z = _1045;
    float _1059 = _867 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1061 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1063 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1065 = isnan(0.5);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1071 = _1067 || _1069;
    out.m_65.w = _989;
    float _1073 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1059);
    out.m_67.x = _1049;
    out.m_67.y = _1047;
    float _1075 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1073);
    float _1077 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[6].z, _959);
    out.m_69.x = _1053;
    out.m_69.y = _1055;
    out.m_69.z = _1057;
    out.m_69.w = _889;
    float _1079 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1081 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1077);
    if (_1071)
    {
        _997 = 1.0;
    }
    float _1083 = _997;
    float _1085 = _1079 + _1061;
    float _1087 = 1.0 / _1061;
    float _1089 = _1085 * _1087;
    float _1091 = _1089 * 0.5;
    float _1093 = _1083;
    if (!_1071)
    {
        float _1095 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1097 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1099 = _1095 * 0.15915493667125701904296875;
        float _1101 = _1097 * 0.15915493667125701904296875;
        float _1103 = _1099 * 6.283185482025146484375;
        float _1105 = cos(_1103);
        float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1109 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1107);
        float _1111 = _1099 * 6.283185482025146484375;
        float _1113 = sin(_1111);
        float _1115 = 1.0 / _1105;
        float _1117 = _1101 * 6.283185482025146484375;
        float _1119 = cos(_1117);
        float _1121 = _1113 * _1115;
        float _1123 = _1101 * 6.283185482025146484375;
        float _1125 = sin(_1123);
        float _1127 = _1119 * _1121;
        float _1129 = 1.0 / _1109;
        float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1133 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1131;
        float _1135 = 1.0 / _1127;
        float _1137 = 1.0 / _1133;
        float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1141 = _1129 * _1139;
        float _1143 = _1125 * _1135;
        float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1147 = fma(_1143, _1141, _1145);
        float _1149 = _1147 * _1137;
        float _1151 = precise::clamp(_1149, 0.0, 1.0);
        float _1153 = -_1151;
        float _1155 = _1153 + 1.0;
        _1093 = _1155;
    }
    float _1157 = _1093;
    float _1159 = -_893;
    float _1161 = _1159 + 1.0;
    float _1163 = _764 * 0.5;
    bool _1165 = _1157 > 0.0;
    bool _1167 = isnan(_1157);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan(0.0);
    bool _1173 = _1169 || _1171;
    float _1175 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1177 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1179 = fma(_800, -0.5, _1163);
    float _1181 = _1081 + _764;
    float _1183 = _786 + _764;
    float _1185 = _1177 * _822;
    float _1187 = -_1177;
    float _1189 = _1187 + 1.0;
    out.m_71.x = _514;
    out.m_71.y = _510;
    out.m_71.z = _518;
    float _1191 = _833 * _1185;
    float _1193 = _843 * _1185;
    float _1195 = _1181 * 0.5;
    float _1197 = _1183 * 0.5;
    float _1199 = _1175 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1201 = fma(_839, _1191, _827);
    float _1203 = fma(_841, _1191, _829);
    float _1205 = _833 * _1189;
    float _1207 = fma(_833, _1193, _831);
    out.gl_Position.x = _786;
    out.gl_Position.y = _800;
    out.gl_Position.z = _1081;
    out.gl_Position.w = _764;
    out.m_73.x = _1197;
    out.m_73.y = _1179;
    out.m_73.z = _1195;
    out.m_73.w = _764;
    out.m_45.x = _1199;
    out.m_75.x = _1201;
    out.m_75.y = _1203;
    out.m_75.z = _1207;
    out.m_75.w = _1205;
    if (_1173)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1209 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1209;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    float _102 = as_type<float>(_94);
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _100;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1266 = as_type<float>(_110);
        out.gl_Position.z = _1266;
    }
    if (!_98)
    {
        return out;
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_124)
    {
        float _130 = float(_94);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1335 = as_type<float>(_146);
        out.gl_Position.z = _1335;
    }
    if (_138)
    {
        return out;
    }
    float _148 = in.m_49.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_47.x;
    float _164 = in.m_47.y;
    float _166 = in.m_47.z;
    float _168 = in.m_42.x;
    float _170 = in.m_42.y;
    float _172 = in.m_42.z;
    float _174 = 0.0;
    float _176 = _150;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_160)
    {
        float _180 = _150 * _150;
        float _182 = _180 * 0.5;
        _174 = _182;
    }
    float _184 = _174;
    float _186 = _184;
    if (!_160)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_160;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _150 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _150);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_160;
    float _230 = 0.0;
    if (!_228)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _150 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _176 = _250;
        _230 = _240;
        _178 = _238;
    }
    float _252 = _176;
    float _254 = _230;
    float _256 = _178;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = in.m_51.x;
    float _264 = in.m_51.y;
    float _266 = in.m_51.z;
    float _268 = fma(_252, _164, _258);
    float _270 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_252, _162, _260);
    float _274 = fma(_268, _148, _170);
    float _276 = fma(_252, _166, _270);
    float _278 = fma(_272, _148, _168);
    float _280 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _282 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _284 = fma(_276, _148, _172);
    float _286 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _288 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _280);
    float _290 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _282);
    float _292 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _286);
    float _294 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _288);
    float _296 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _290);
    float _298 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _292);
    float _300 = _294 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _302 = _296 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _304 = _298 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _306 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _308 = _300 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _312 = _302 + _310;
    float _314 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _316 = _304 + _314;
    float _318 = _308 * _308;
    float _320 = fma(_312, _312, _318);
    float _322 = fma(_316, _316, _320);
    float _324 = rsqrt(_322);
    float _326 = _308 * _324;
    float _328 = _312 * _324;
    float _330 = _316 * _324;
    float _332 = -_326;
    float _334 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _308);
    float _336 = -_328;
    float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[18].w, _312);
    float _340 = -_330;
    float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[18].w, _316);
    float _344 = _334 * _334;
    float _346 = in.m_49.x;
    float _348 = in.m_49.y;
    float _350 = in.m_49.z;
    float _352 = fma(_338, _338, _344);
    float _354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _262);
    float _356 = fma(_342, _342, _352);
    float _358 = sqrt(_356);
    float _360 = _348 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _362 = _346 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _364 = _324 * _358;
    float _366 = _350 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _368 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _370 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _264);
    float _372 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _374 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _376 = _368 * _364;
    float _378 = _372 * _364;
    float _380 = _374 * _364;
    float _382 = _376 * _370;
    float _384 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _266);
    float _386 = _378 * _354;
    float _388 = _382 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _390 = _380 * _384;
    float _392 = _382 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _394 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[10].x, _388);
    float _396 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[8].x, _392);
    float _398 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[10].z, _394);
    float _400 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[8].z, _396);
    float _402 = _304 + _398;
    float _404 = _302 + _400;
    float _406 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _408 = _402 + _406;
    float _410 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _412 = _404 + _410;
    float _414 = _408 * _408;
    float _416 = fma(_412, _412, _414);
    float _418 = _382 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _420 = sqrt(_416);
    float _422 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[9].x, _418);
    float _424 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[9].z, _422);
    float _426 = _300 + _424;
    bool _428 = _420 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _430 = _424;
    float _432 = _422;
    float _434 = _402;
    float _436 = _386;
    float _438 = _254;
    float _440 = _416;
    if (!_428)
    {
        _430 = _404;
    }
    float _442 = _430;
    float _444 = _442;
    if (!_428)
    {
        _432 = _426;
    }
    float _446 = _432;
    bool _448 = !_428;
    float _450 = _446;
    if (!_448)
    {
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _454 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _456 = _420 + _454;
        float _458 = _426 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _460 = rsqrt(_416);
        float _462 = _456 * _452;
        float _464 = _462 * 0.15915493667125701904296875;
        float _466 = _464 * 6.283185482025146484375;
        float _468 = cos(_466);
        float _470 = _464 * 6.283185482025146484375;
        float _472 = sin(_470);
        float _474 = _468 + (-1.0);
        float _476 = fma(_472, _458, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _478 = _474 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _480 = _460 * _476;
        float _482 = fma(_426, _468, _478);
        float _484 = fma(_412, _480, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _486 = fma(_408, _480, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _450 = _482;
        _444 = _484;
        _434 = _486;
        _436 = _464;
    }
    float _488 = _450;
    float _490 = _444;
    float _492 = _434;
    float _494 = _436;
    float _496 = -_326;
    float _498 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[18].w, _488);
    float _500 = -_328;
    float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[18].w, _490);
    float _504 = -_330;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _510 = _498 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _514 = _502 + _512;
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _518 = _506 + _516;
    float _520 = _510 * _510;
    float _522 = fma(_514, _514, _520);
    float _524 = fma(_518, _518, _522);
    float _526 = rsqrt(_524);
    float _528 = sqrt(_524);
    float _530 = _526 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _532 = _514 * _530;
    float _534 = _518 * _530;
    float _536 = _532 * _532;
    float _538 = _534 * _534;
    float _540 = _536 + _538;
    float _542 = sqrt(_540);
    bool _544 = _542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _546 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _548 = _542 + _546;
    float _550 = _522;
    float _552 = _494;
    float _554 = _548;
    if (_544)
    {
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _550 = _556;
    }
    float _558 = _550;
    if (_544)
    {
        float _560 = rsqrt(_540);
        _552 = _560;
    }
    float _562 = _552;
    float _564 = _562;
    if (_544)
    {
        float _566 = _548 * _558;
        _554 = _566;
    }
    float _568 = _554;
    if (_544)
    {
        float _570 = _568 * 0.15915493667125701904296875;
        _438 = _570;
    }
    float _572 = _438;
    float _574 = _558;
    float _576 = _572;
    if (_544)
    {
        float _578 = _572 * 6.283185482025146484375;
        float _580 = sin(_578);
        _574 = _580;
    }
    float _582 = _574;
    float _584 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _586 = precise::max(0.0, _584);
    float _588 = _256;
    float _590 = _586;
    if (_544)
    {
        float _592 = _572 * 6.283185482025146484375;
        float _594 = cos(_592);
        _588 = _594;
    }
    float _596 = _588;
    float _598 = -_530;
    float _600 = -_586;
    float _602 = fma(_510, _598, _600);
    if (_544)
    {
        float _604 = _602 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _604;
    }
    float _606 = _590;
    float _608 = _582;
    float _610 = _606;
    if (_544)
    {
        float _612 = fma(_582, _606, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _440 = _612;
    }
    float _614 = _440;
    float _616 = _614;
    if (!_544)
    {
        _608 = _602;
    }
    float _618 = _608;
    float _620 = _618;
    float _622 = _596;
    if (_544)
    {
        float _624 = _596 + (-1.0);
        _610 = _624;
    }
    float _626 = _610;
    float _628 = 0.0;
    float _630 = _626;
    if (_544)
    {
        float _632 = _562 * _614;
        _628 = _632;
    }
    float _634 = _628;
    if (!_544)
    {
        _564 = _532;
    }
    float _636 = _564;
    float _638 = _636;
    if (_544)
    {
        float _640 = _626 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _576 = _640;
    }
    float _642 = _576;
    if (_544)
    {
        float _644 = _532 * _634;
        _638 = _644;
    }
    float _646 = _638;
    if (!_544)
    {
        _630 = _534;
    }
    float _648 = _630;
    float _650 = _648;
    if (_544)
    {
        float _652 = _534 * _634;
        _650 = _652;
    }
    float _654 = _650;
    if (!_544)
    {
        _616 = _536;
    }
    float _656 = _616;
    float _658 = _656;
    if (_544)
    {
        float _660 = fma(_602, _596, _642);
        _620 = _660;
    }
    float _662 = _620;
    if (_544)
    {
        float _664 = _646 * _646;
        _658 = _664;
    }
    float _666 = _658;
    float _668 = _498 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_544)
    {
        _622 = _538;
    }
    float _670 = _622;
    float _672 = _670;
    if (_544)
    {
        float _674 = _654 * _654;
        _672 = _674;
    }
    float _676 = _672;
    float _678 = fma(_662, _662, _666);
    float _680 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _682 = fma(_528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _680);
    float _684 = precise::clamp(_682, 0.0, 1.0);
    float _686 = _498 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _688 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[2].x, _668);
    float _690 = _678 + _676;
    float _692 = _498 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _694 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[1].x, _686);
    float _696 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[2].z, _688);
    float _698 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[0].x, _692);
    float _700 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[1].z, _694);
    float _702 = rsqrt(_690);
    float _704 = _696 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _706 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[0].z, _698);
    float _708 = _700 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _710 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _712 = _704 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _714 = _706 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _716 = _708 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _718 = -_684;
    float _720 = _718 + 1.0;
    float _722 = -_712;
    float _724 = fma(_722, _710, 1.0);
    float _726 = _498 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _728 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[7].x, _716);
    float _730 = abs(_720);
    float _732 = log2(_730);
    float _734 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[7].z, _728);
    float _736 = _702 * _646;
    float _738 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[3].x, _726);
    float _740 = _702 * _662;
    float _742 = _702 * _654;
    float _744 = _736 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _746 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[3].z, _738);
    float _748 = log2(_724);
    float _750 = _708 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _752 = -_744;
    float _754 = fma(_740, (*spvDescriptorSet0.vp_c15)._m0[21].y, _752);
    float _756 = _746 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _758 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[4].x, _750);
    float _760 = -_742;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c15)._m0[21].z, _754);
    float _764 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[7].w, _734);
    float _766 = _732 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _768 = _708 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _770 = fma(_762, -0.5, 0.5);
    float _772 = 1.0 / _764;
    float _774 = fma(_762, 0.5, 0.5);
    float _776 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[5].x, _768);
    float _778 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[4].z, _758);
    float _780 = _740 + 1.0;
    float _782 = fma(_774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _784 = _748 * 0.693147182464599609375;
    float _786 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[4].w, _778);
    float _788 = exp2(_766);
    float _790 = fma(_774, _782, -0.212114393711090087890625);
    float _792 = _784 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _794 = fma(_774, _790, 1.570728778839111328125);
    float _796 = sqrt(_770);
    float _798 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[5].z, _776);
    float _800 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[5].w, _798);
    float _802 = _786 * _772;
    float _804 = -_740;
    float _806 = fma(_788, _780, _804);
    float _808 = _800 * _772;
    float _810 = fma(_802, 0.5, 0.5);
    float _812 = fma(_806, 0.5, 0.5);
    float _814 = fma(_808, -0.5, 0.5);
    float _816 = _796 * 0.636619746685028076171875;
    float _818 = -_794;
    float _820 = fma(_816, _818, 1.0);
    float3 _2442 = float3(_810, _814, _792);
    float _822 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2442, float3(0.0), isnan(_2442)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2442, float3(0.0), isnan(_2442)), level(0.0)).x;
    float3 _2453 = float3(_810, _814, _792);
    float4 _825 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2453, float3(0.0), isnan(_2453)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2453, float3(0.0), isnan(_2453)), level(0.0)).xyzw;
    float _827 = _825.x;
    float _829 = _825.y;
    float _831 = _825.z;
    float _833 = _825.w;
    float2 _2470 = float2(_820, _812);
    float3 _837 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2470, float2(0.0), isnan(_2470)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2470, float2(0.0), isnan(_2470)), level(0.0)).xyz;
    float _839 = _837.x;
    float _841 = _837.y;
    float _843 = _837.z;
    float _845 = in.m_53.x;
    float _847 = in.m_53.y;
    float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _853 = _851 != 0;
    float _855 = in.m_55.y;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _859 = _857 != 0;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _863 = in.m_55.x;
    float _865 = -_326;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _300);
    float _869 = -_328;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _302);
    float _873 = -_330;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    out.m_57.x = _502;
    out.m_57.y = _498;
    out.m_57.z = _506;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _879 = _732 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _881 = 0.0;
    if (_853)
    {
        float _883 = in.m_53.x;
        _881 = _883;
    }
    float _885 = _881;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _891 = _708 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _893 = exp2(_879);
    float _895 = _845 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _897 = _847 > 0.5;
    float _899 = _847 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _901 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[78].z, _877);
    float _903 = -_855;
    float _905 = _903 + 1.0;
    float _907 = -_861;
    float _909 = fma(_895, 2.0, _907);
    float _911 = fma(_899, -2.0, _887);
    float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _915 = _849 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _917 = _855;
    float _919 = _849;
    if (_859)
    {
        float _921 = _897 ? _905 : _855;
        _917 = _921;
    }
    float _923 = _917;
    float _925 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _911);
    float _927 = in.m_59.x;
    float _929 = in.m_59.y;
    float _931 = in.m_59.z;
    bool _933 = _264 != 0.0;
    bool _935 = isnan(_264);
    bool _937 = _933 || _935;
    bool _939 = isnan(0.0);
    bool _941 = _937 || _939;
    float _943 = -_128;
    float _945 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[76].x, _909);
    float _947 = _863;
    if (_853)
    {
        _919 = _863;
    }
    float _949 = _919;
    float _951 = fma(_915, _923, -0.5);
    bool _953 = _262 == 0.0;
    bool _955 = !_941;
    bool _957 = _953 && _955;
    float _959 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[6].x, _891);
    bool _961 = _885 > 0.5;
    bool _963 = _961 && _853;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _967 = _266 == 0.0;
    bool _969 = _967 && _957;
    float _971 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[78].w, _965);
    float _973 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _901);
    float _975 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _971);
    float _977 = _949;
    if (_963)
    {
        float _979 = -_949;
        float _981 = _979 + 1.0;
        _977 = _981;
    }
    float _983 = _977;
    float _985 = -_925;
    float _987 = fma(_975, _951, _985);
    float _989 = in.m_61.w;
    float _991 = _927;
    float _993 = _929;
    float _995 = _931;
    float _997 = _987;
    if (!_969)
    {
        float _999 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[17].y, _927);
        _991 = _999;
    }
    float _1001 = _991;
    if (_853)
    {
        _947 = _983;
    }
    float _1003 = _947;
    if (!_969)
    {
        float _1005 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[17].y, _929);
        _993 = _1005;
    }
    float _1007 = _993;
    float _1009 = _913 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_969)
    {
        float _1011 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[17].y, _931);
        _995 = _1011;
    }
    float _1013 = _995;
    float _1015 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1017 = fma(_1009, _1003, -0.5);
    float _1019 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1021 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1023 = fma(_1001, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1015);
    float _1025 = fma(_973, _1017, _945);
    float _1027 = _867 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1029 = fma(_1001, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1019);
    float _1031 = fma(_1001, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1021);
    float _1033 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1027);
    float _1035 = fma(_1013, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1023);
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1043 = fma(_1013, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1029);
    float _1045 = fma(_1013, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1031);
    float _1047 = _987 + 0.5;
    float _1049 = _1025 + 0.5;
    float _1051 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1033);
    float _1053 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1055 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1057 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _1035;
    out.m_63.y = _1043;
    out.m_63.z = _1045;
    float _1059 = _867 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1061 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1063 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1065 = isnan(0.5);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1071 = _1067 || _1069;
    out.m_65.w = _989;
    float _1073 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1059);
    out.m_67.x = _1049;
    out.m_67.y = _1047;
    float _1075 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1073);
    float _1077 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[6].z, _959);
    out.m_69.x = _1053;
    out.m_69.y = _1055;
    out.m_69.z = _1057;
    out.m_69.w = _889;
    float _1079 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1081 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1077);
    if (_1071)
    {
        _997 = 1.0;
    }
    float _1083 = _997;
    float _1085 = _1079 + _1061;
    float _1087 = 1.0 / _1061;
    float _1089 = _1085 * _1087;
    float _1091 = _1089 * 0.5;
    float _1093 = _1083;
    if (!_1071)
    {
        float _1095 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1097 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1099 = _1095 * 0.15915493667125701904296875;
        float _1101 = _1097 * 0.15915493667125701904296875;
        float _1103 = _1099 * 6.283185482025146484375;
        float _1105 = cos(_1103);
        float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1109 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1107);
        float _1111 = _1099 * 6.283185482025146484375;
        float _1113 = sin(_1111);
        float _1115 = 1.0 / _1105;
        float _1117 = _1101 * 6.283185482025146484375;
        float _1119 = cos(_1117);
        float _1121 = _1113 * _1115;
        float _1123 = _1101 * 6.283185482025146484375;
        float _1125 = sin(_1123);
        float _1127 = _1119 * _1121;
        float _1129 = 1.0 / _1109;
        float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1133 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1131;
        float _1135 = 1.0 / _1127;
        float _1137 = 1.0 / _1133;
        float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1141 = _1129 * _1139;
        float _1143 = _1125 * _1135;
        float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1147 = fma(_1143, _1141, _1145);
        float _1149 = _1147 * _1137;
        float _1151 = precise::clamp(_1149, 0.0, 1.0);
        float _1153 = -_1151;
        float _1155 = _1153 + 1.0;
        _1093 = _1155;
    }
    float _1157 = _1093;
    float _1159 = -_893;
    float _1161 = _1159 + 1.0;
    float _1163 = _764 * 0.5;
    bool _1165 = _1157 > 0.0;
    bool _1167 = isnan(_1157);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan(0.0);
    bool _1173 = _1169 || _1171;
    float _1175 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1177 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1179 = fma(_800, -0.5, _1163);
    float _1181 = _1081 + _764;
    float _1183 = _786 + _764;
    float _1185 = _1177 * _822;
    float _1187 = -_1177;
    float _1189 = _1187 + 1.0;
    out.m_71.x = _514;
    out.m_71.y = _510;
    out.m_71.z = _518;
    float _1191 = _833 * _1185;
    float _1193 = _843 * _1185;
    float _1195 = _1181 * 0.5;
    float _1197 = _1183 * 0.5;
    float _1199 = _1175 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1201 = fma(_839, _1191, _827);
    float _1203 = fma(_841, _1191, _829);
    float _1205 = _833 * _1189;
    float _1207 = fma(_833, _1193, _831);
    out.gl_Position.x = _786;
    out.gl_Position.y = _800;
    out.gl_Position.z = _1081;
    out.gl_Position.w = _764;
    out.m_73.x = _1197;
    out.m_73.y = _1179;
    out.m_73.z = _1195;
    out.m_73.w = _764;
    out.m_45.x = _1199;
    out.m_75.x = _1201;
    out.m_75.y = _1203;
    out.m_75.z = _1207;
    out.m_75.w = _1205;
    if (_1173)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1209 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1209;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    float _102 = as_type<float>(_94);
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _100;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1266 = as_type<float>(_110);
        out.gl_Position.z = _1266;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_124)
    {
        float _130 = float(_94);
        _102 = _130;
    }
    float _132 = _102;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1335 = as_type<float>(_146);
        out.gl_Position.z = _1335;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_49.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_47.x;
    float _164 = in.m_47.y;
    float _166 = in.m_47.z;
    float _168 = in.m_42.x;
    float _170 = in.m_42.y;
    float _172 = in.m_42.z;
    float _174 = 0.0;
    float _176 = _150;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_160)
    {
        float _180 = _150 * _150;
        float _182 = _180 * 0.5;
        _174 = _182;
    }
    float _184 = _174;
    float _186 = _184;
    if (!_160)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    bool _192 = !_160;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _150 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _150);
        float _222 = _220 * _208;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_160;
    float _230 = 0.0;
    if (!_228)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _150 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _176 = _250;
        _230 = _240;
        _178 = _238;
    }
    float _252 = _176;
    float _254 = _230;
    float _256 = _178;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = in.m_51.x;
    float _264 = in.m_51.y;
    float _266 = in.m_51.z;
    float _268 = fma(_252, _164, _258);
    float _270 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_252, _162, _260);
    float _274 = fma(_268, _148, _170);
    float _276 = fma(_252, _166, _270);
    float _278 = fma(_272, _148, _168);
    float _280 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _282 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _284 = fma(_276, _148, _172);
    float _286 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _288 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _280);
    float _290 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _282);
    float _292 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _286);
    float _294 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _288);
    float _296 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _290);
    float _298 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _292);
    float _300 = _294 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _302 = _296 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _304 = _298 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _306 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _308 = _300 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _312 = _302 + _310;
    float _314 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _316 = _304 + _314;
    float _318 = _308 * _308;
    float _320 = fma(_312, _312, _318);
    float _322 = fma(_316, _316, _320);
    float _324 = rsqrt(_322);
    float _326 = _308 * _324;
    float _328 = _312 * _324;
    float _330 = _316 * _324;
    float _332 = -_326;
    float _334 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _308);
    float _336 = -_328;
    float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[18].w, _312);
    float _340 = -_330;
    float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[18].w, _316);
    float _344 = _334 * _334;
    float _346 = in.m_49.x;
    float _348 = in.m_49.y;
    float _350 = in.m_49.z;
    float _352 = fma(_338, _338, _344);
    float _354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _262);
    float _356 = fma(_342, _342, _352);
    float _358 = sqrt(_356);
    float _360 = _348 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _362 = _346 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _364 = _324 * _358;
    float _366 = _350 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _368 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _370 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _264);
    float _372 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _374 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _376 = _368 * _364;
    float _378 = _372 * _364;
    float _380 = _374 * _364;
    float _382 = _376 * _370;
    float _384 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _266);
    float _386 = _378 * _354;
    float _388 = _382 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _390 = _380 * _384;
    float _392 = _382 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _394 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[10].x, _388);
    float _396 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[8].x, _392);
    float _398 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[10].z, _394);
    float _400 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[8].z, _396);
    float _402 = _304 + _398;
    float _404 = _302 + _400;
    float _406 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _408 = _402 + _406;
    float _410 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _412 = _404 + _410;
    float _414 = _408 * _408;
    float _416 = fma(_412, _412, _414);
    float _418 = _382 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _420 = sqrt(_416);
    float _422 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[9].x, _418);
    float _424 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[9].z, _422);
    float _426 = _300 + _424;
    bool _428 = _420 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _430 = _424;
    float _432 = _422;
    float _434 = _402;
    float _436 = _386;
    float _438 = _254;
    float _440 = _416;
    if (!_428)
    {
        _430 = _404;
    }
    float _442 = _430;
    float _444 = _442;
    if (!_428)
    {
        _432 = _426;
    }
    float _446 = _432;
    bool _448 = !_428;
    float _450 = _446;
    if (!_448)
    {
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _454 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _456 = _420 + _454;
        float _458 = _426 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _460 = rsqrt(_416);
        float _462 = _456 * _452;
        float _464 = _462 * 0.15915493667125701904296875;
        float _466 = _464 * 6.283185482025146484375;
        float _468 = cos(_466);
        float _470 = _464 * 6.283185482025146484375;
        float _472 = sin(_470);
        float _474 = _468 + (-1.0);
        float _476 = fma(_472, _458, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _478 = _474 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _480 = _460 * _476;
        float _482 = fma(_426, _468, _478);
        float _484 = fma(_412, _480, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _486 = fma(_408, _480, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _450 = _482;
        _444 = _484;
        _434 = _486;
        _436 = _464;
    }
    float _488 = _450;
    float _490 = _444;
    float _492 = _434;
    float _494 = _436;
    float _496 = -_326;
    float _498 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[18].w, _488);
    float _500 = -_328;
    float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[18].w, _490);
    float _504 = -_330;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _510 = _498 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _514 = _502 + _512;
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _518 = _506 + _516;
    float _520 = _510 * _510;
    float _522 = fma(_514, _514, _520);
    float _524 = fma(_518, _518, _522);
    float _526 = rsqrt(_524);
    float _528 = sqrt(_524);
    float _530 = _526 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _532 = _514 * _530;
    float _534 = _518 * _530;
    float _536 = _532 * _532;
    float _538 = _534 * _534;
    float _540 = _536 + _538;
    float _542 = sqrt(_540);
    bool _544 = _542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _546 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _548 = _542 + _546;
    float _550 = _522;
    float _552 = _494;
    float _554 = _548;
    if (_544)
    {
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _550 = _556;
    }
    float _558 = _550;
    if (_544)
    {
        float _560 = rsqrt(_540);
        _552 = _560;
    }
    float _562 = _552;
    float _564 = _562;
    if (_544)
    {
        float _566 = _548 * _558;
        _554 = _566;
    }
    float _568 = _554;
    if (_544)
    {
        float _570 = _568 * 0.15915493667125701904296875;
        _438 = _570;
    }
    float _572 = _438;
    float _574 = _558;
    float _576 = _572;
    if (_544)
    {
        float _578 = _572 * 6.283185482025146484375;
        float _580 = sin(_578);
        _574 = _580;
    }
    float _582 = _574;
    float _584 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _586 = precise::max(0.0, _584);
    float _588 = _256;
    float _590 = _586;
    if (_544)
    {
        float _592 = _572 * 6.283185482025146484375;
        float _594 = cos(_592);
        _588 = _594;
    }
    float _596 = _588;
    float _598 = -_530;
    float _600 = -_586;
    float _602 = fma(_510, _598, _600);
    if (_544)
    {
        float _604 = _602 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _604;
    }
    float _606 = _590;
    float _608 = _582;
    float _610 = _606;
    if (_544)
    {
        float _612 = fma(_582, _606, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _440 = _612;
    }
    float _614 = _440;
    float _616 = _614;
    if (!_544)
    {
        _608 = _602;
    }
    float _618 = _608;
    float _620 = _618;
    float _622 = _596;
    if (_544)
    {
        float _624 = _596 + (-1.0);
        _610 = _624;
    }
    float _626 = _610;
    float _628 = 0.0;
    float _630 = _626;
    if (_544)
    {
        float _632 = _562 * _614;
        _628 = _632;
    }
    float _634 = _628;
    if (!_544)
    {
        _564 = _532;
    }
    float _636 = _564;
    float _638 = _636;
    if (_544)
    {
        float _640 = _626 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _576 = _640;
    }
    float _642 = _576;
    if (_544)
    {
        float _644 = _532 * _634;
        _638 = _644;
    }
    float _646 = _638;
    if (!_544)
    {
        _630 = _534;
    }
    float _648 = _630;
    float _650 = _648;
    if (_544)
    {
        float _652 = _534 * _634;
        _650 = _652;
    }
    float _654 = _650;
    if (!_544)
    {
        _616 = _536;
    }
    float _656 = _616;
    float _658 = _656;
    if (_544)
    {
        float _660 = fma(_602, _596, _642);
        _620 = _660;
    }
    float _662 = _620;
    if (_544)
    {
        float _664 = _646 * _646;
        _658 = _664;
    }
    float _666 = _658;
    float _668 = _498 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_544)
    {
        _622 = _538;
    }
    float _670 = _622;
    float _672 = _670;
    if (_544)
    {
        float _674 = _654 * _654;
        _672 = _674;
    }
    float _676 = _672;
    float _678 = fma(_662, _662, _666);
    float _680 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _682 = fma(_528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _680);
    float _684 = precise::clamp(_682, 0.0, 1.0);
    float _686 = _498 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _688 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[2].x, _668);
    float _690 = _678 + _676;
    float _692 = _498 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _694 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[1].x, _686);
    float _696 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[2].z, _688);
    float _698 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[0].x, _692);
    float _700 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[1].z, _694);
    float _702 = rsqrt(_690);
    float _704 = _696 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _706 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[0].z, _698);
    float _708 = _700 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _710 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _712 = _704 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _714 = _706 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _716 = _708 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _718 = -_684;
    float _720 = _718 + 1.0;
    float _722 = -_712;
    float _724 = fma(_722, _710, 1.0);
    float _726 = _498 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _728 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[7].x, _716);
    float _730 = abs(_720);
    float _732 = log2(_730);
    float _734 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[7].z, _728);
    float _736 = _702 * _646;
    float _738 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[3].x, _726);
    float _740 = _702 * _662;
    float _742 = _702 * _654;
    float _744 = _736 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _746 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[3].z, _738);
    float _748 = log2(_724);
    float _750 = _708 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _752 = -_744;
    float _754 = fma(_740, (*spvDescriptorSet0.vp_c15)._m0[21].y, _752);
    float _756 = _746 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _758 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[4].x, _750);
    float _760 = -_742;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c15)._m0[21].z, _754);
    float _764 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[7].w, _734);
    float _766 = _732 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _768 = _708 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _770 = fma(_762, -0.5, 0.5);
    float _772 = 1.0 / _764;
    float _774 = fma(_762, 0.5, 0.5);
    float _776 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[5].x, _768);
    float _778 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[4].z, _758);
    float _780 = _740 + 1.0;
    float _782 = fma(_774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _784 = _748 * 0.693147182464599609375;
    float _786 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[4].w, _778);
    float _788 = exp2(_766);
    float _790 = fma(_774, _782, -0.212114393711090087890625);
    float _792 = _784 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _794 = fma(_774, _790, 1.570728778839111328125);
    float _796 = sqrt(_770);
    float _798 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[5].z, _776);
    float _800 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[5].w, _798);
    float _802 = _786 * _772;
    float _804 = -_740;
    float _806 = fma(_788, _780, _804);
    float _808 = _800 * _772;
    float _810 = fma(_802, 0.5, 0.5);
    float _812 = fma(_806, 0.5, 0.5);
    float _814 = fma(_808, -0.5, 0.5);
    float _816 = _796 * 0.636619746685028076171875;
    float _818 = -_794;
    float _820 = fma(_816, _818, 1.0);
    float3 _2442 = float3(_810, _814, _792);
    float _822 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2442, float3(0.0), isnan(_2442)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2442, float3(0.0), isnan(_2442)), level(0.0)).x;
    float3 _2453 = float3(_810, _814, _792);
    float4 _825 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2453, float3(0.0), isnan(_2453)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2453, float3(0.0), isnan(_2453)), level(0.0)).xyzw;
    float _827 = _825.x;
    float _829 = _825.y;
    float _831 = _825.z;
    float _833 = _825.w;
    float2 _2470 = float2(_820, _812);
    float3 _837 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2470, float2(0.0), isnan(_2470)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2470, float2(0.0), isnan(_2470)), level(0.0)).xyz;
    float _839 = _837.x;
    float _841 = _837.y;
    float _843 = _837.z;
    float _845 = in.m_53.x;
    float _847 = in.m_53.y;
    float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _853 = _851 != 0;
    float _855 = in.m_55.y;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _859 = _857 != 0;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _863 = in.m_55.x;
    float _865 = -_326;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _300);
    float _869 = -_328;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _302);
    float _873 = -_330;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    out.m_57.x = _502;
    out.m_57.y = _498;
    out.m_57.z = _506;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _879 = _732 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _881 = 0.0;
    if (_853)
    {
        float _883 = in.m_53.x;
        _881 = _883;
    }
    float _885 = _881;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _891 = _708 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _893 = exp2(_879);
    float _895 = _845 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _897 = _847 > 0.5;
    float _899 = _847 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _901 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[78].z, _877);
    float _903 = -_855;
    float _905 = _903 + 1.0;
    float _907 = -_861;
    float _909 = fma(_895, 2.0, _907);
    float _911 = fma(_899, -2.0, _887);
    float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _915 = _849 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _917 = _855;
    float _919 = _849;
    if (_859)
    {
        float _921 = _897 ? _905 : _855;
        _917 = _921;
    }
    float _923 = _917;
    float _925 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _911);
    float _927 = in.m_59.x;
    float _929 = in.m_59.y;
    float _931 = in.m_59.z;
    bool _933 = _264 != 0.0;
    bool _935 = isnan(_264);
    bool _937 = _933 || _935;
    bool _939 = isnan(0.0);
    bool _941 = _937 || _939;
    float _943 = -_128;
    float _945 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[76].x, _909);
    float _947 = _863;
    if (_853)
    {
        _919 = _863;
    }
    float _949 = _919;
    float _951 = fma(_915, _923, -0.5);
    bool _953 = _262 == 0.0;
    bool _955 = !_941;
    bool _957 = _953 && _955;
    float _959 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[6].x, _891);
    bool _961 = _885 > 0.5;
    bool _963 = _961 && _853;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _967 = _266 == 0.0;
    bool _969 = _967 && _957;
    float _971 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[78].w, _965);
    float _973 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _901);
    float _975 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _971);
    float _977 = _949;
    if (_963)
    {
        float _979 = -_949;
        float _981 = _979 + 1.0;
        _977 = _981;
    }
    float _983 = _977;
    float _985 = -_925;
    float _987 = fma(_975, _951, _985);
    float _989 = in.m_61.w;
    float _991 = _927;
    float _993 = _929;
    float _995 = _931;
    float _997 = _987;
    if (!_969)
    {
        float _999 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[17].y, _927);
        _991 = _999;
    }
    float _1001 = _991;
    if (_853)
    {
        _947 = _983;
    }
    float _1003 = _947;
    if (!_969)
    {
        float _1005 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[17].y, _929);
        _993 = _1005;
    }
    float _1007 = _993;
    float _1009 = _913 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_969)
    {
        float _1011 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[17].y, _931);
        _995 = _1011;
    }
    float _1013 = _995;
    float _1015 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1017 = fma(_1009, _1003, -0.5);
    float _1019 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1021 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1023 = fma(_1001, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1015);
    float _1025 = fma(_973, _1017, _945);
    float _1027 = _867 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1029 = fma(_1001, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1019);
    float _1031 = fma(_1001, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1021);
    float _1033 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1027);
    float _1035 = fma(_1013, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1023);
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1043 = fma(_1013, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1029);
    float _1045 = fma(_1013, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1031);
    float _1047 = _987 + 0.5;
    float _1049 = _1025 + 0.5;
    float _1051 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1033);
    float _1053 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1055 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1057 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _1035;
    out.m_63.y = _1043;
    out.m_63.z = _1045;
    float _1059 = _867 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1061 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1063 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1065 = isnan(0.5);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1071 = _1067 || _1069;
    out.m_65.w = _989;
    float _1073 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1059);
    out.m_67.x = _1049;
    out.m_67.y = _1047;
    float _1075 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1073);
    float _1077 = fma(_704, (*spvDescriptorSet0.vp_c8)._m0[6].z, _959);
    out.m_69.x = _1053;
    out.m_69.y = _1055;
    out.m_69.z = _1057;
    out.m_69.w = _889;
    float _1079 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1081 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1077);
    if (_1071)
    {
        _997 = 1.0;
    }
    float _1083 = _997;
    float _1085 = _1079 + _1061;
    float _1087 = 1.0 / _1061;
    float _1089 = _1085 * _1087;
    float _1091 = _1089 * 0.5;
    float _1093 = _1083;
    if (!_1071)
    {
        float _1095 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1097 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1099 = _1095 * 0.15915493667125701904296875;
        float _1101 = _1097 * 0.15915493667125701904296875;
        float _1103 = _1099 * 6.283185482025146484375;
        float _1105 = cos(_1103);
        float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1109 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1107);
        float _1111 = _1099 * 6.283185482025146484375;
        float _1113 = sin(_1111);
        float _1115 = 1.0 / _1105;
        float _1117 = _1101 * 6.283185482025146484375;
        float _1119 = cos(_1117);
        float _1121 = _1113 * _1115;
        float _1123 = _1101 * 6.283185482025146484375;
        float _1125 = sin(_1123);
        float _1127 = _1119 * _1121;
        float _1129 = 1.0 / _1109;
        float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1133 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1131;
        float _1135 = 1.0 / _1127;
        float _1137 = 1.0 / _1133;
        float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1141 = _1129 * _1139;
        float _1143 = _1125 * _1135;
        float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1147 = fma(_1143, _1141, _1145);
        float _1149 = _1147 * _1137;
        float _1151 = precise::clamp(_1149, 0.0, 1.0);
        float _1153 = -_1151;
        float _1155 = _1153 + 1.0;
        _1093 = _1155;
    }
    float _1157 = _1093;
    float _1159 = -_893;
    float _1161 = _1159 + 1.0;
    float _1163 = _764 * 0.5;
    bool _1165 = _1157 > 0.0;
    bool _1167 = isnan(_1157);
    bool _1169 = _1165 || _1167;
    bool _1171 = isnan(0.0);
    bool _1173 = _1169 || _1171;
    float _1175 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1177 = _1161 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1179 = fma(_800, -0.5, _1163);
    float _1181 = _1081 + _764;
    float _1183 = _786 + _764;
    float _1185 = _1177 * _822;
    float _1187 = -_1177;
    float _1189 = _1187 + 1.0;
    out.m_71.x = _514;
    out.m_71.y = _510;
    out.m_71.z = _518;
    float _1191 = _833 * _1185;
    float _1193 = _843 * _1185;
    float _1195 = _1181 * 0.5;
    float _1197 = _1183 * 0.5;
    float _1199 = _1175 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1201 = fma(_839, _1191, _827);
    float _1203 = fma(_841, _1191, _829);
    float _1205 = _833 * _1189;
    float _1207 = fma(_833, _1193, _831);
    out.gl_Position.x = _786;
    out.gl_Position.y = _800;
    out.gl_Position.z = _1081;
    out.gl_Position.w = _764;
    out.m_73.x = _1197;
    out.m_73.y = _1179;
    out.m_73.z = _1195;
    out.m_73.w = _764;
    out.m_45.x = _1199;
    out.m_75.x = _1201;
    out.m_75.y = _1203;
    out.m_75.z = _1207;
    out.m_75.w = _1205;
    if (_1173)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1209 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1209;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

