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
    float4 m_65 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_100);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1497 = as_type<float>(_116);
        out.gl_Position.z = _1497;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_49.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_100);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1566 = as_type<float>(_152);
        out.gl_Position.z = _1566;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_51.x;
    float _156 = in.m_51.y;
    float _158 = in.m_51.z;
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _168 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0500000081956386566162109375;
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _166 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _178 = _168 * 0.15915493667125701904296875;
    float _180 = in.m_44.x;
    float _182 = in.m_44.y;
    float _184 = in.m_44.z;
    bool _186 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _188 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _190 = _186 || _188;
    bool _192 = isnan(1.0);
    bool _194 = _190 || _192;
    float _196 = _176 * 0.15915493667125701904296875;
    float _198 = in.m_53.w;
    float _200 = _178 * 6.283185482025146484375;
    float _202 = sin(_200);
    float _204 = _156 + (-0.5);
    float _206 = _196 * 6.283185482025146484375;
    float _208 = sin(_206);
    float _210 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _156);
    float _212 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _214 = _160 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _216 = _212 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _218 = _196 * 6.283185482025146484375;
    float _220 = cos(_218);
    float _222 = abs(_204);
    float _224 = fma(_222, -2.0, 1.0);
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _230 = _216 * _210;
    float _232 = _178 * 6.283185482025146484375;
    float _234 = cos(_232);
    float _236 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _238 = fma(_226, -2.0, 3.0);
    float _240 = _226 * _226;
    float _242 = _208 * _154;
    float _244 = _220 * _154;
    float _246 = _154;
    float _248 = _244;
    float _250 = _236;
    float _252 = _230;
    float _254 = _202;
    if (!_194)
    {
        float _256 = _236 * _236;
        float _258 = _256 * 0.5;
        _246 = _258;
    }
    float _260 = _246;
    float _262 = _238 * _240;
    float _264 = _262 * 0.125;
    float _266 = -_242;
    float _268 = fma(_220, _158, _266);
    float _270 = fma(_208, _158, _244);
    float _272 = _260;
    if (!_194)
    {
        float _274 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _272 = _274;
    }
    float _276 = _272;
    bool _278 = !_194;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _236 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _236);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
        _248 = _288;
    }
    float _312 = _280;
    float _314 = _248;
    bool _316 = !_194;
    float _318 = _314;
    if (!_316)
    {
        float _320 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _322 = log2(_320);
        float _324 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _326 = _324 + 1.0;
        float _328 = 1.0 / _326;
        float _330 = _236 * _322;
        float _332 = exp2(_330);
        float _334 = -_332;
        float _336 = _334 + 1.0;
        float _338 = _336 * _328;
        _250 = _338;
    }
    float _340 = _250;
    float _342 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _344 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _346 = fma(_202, _264, _270);
    float _348 = _214 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _350 = fma(_340, _172, _342);
    float _352 = fma(_340, _170, _344);
    float _354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _346);
    float _356 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _358 = fma(_350, _198, _182);
    float _360 = fma(_264, _234, _268);
    float _362 = _348 * _354;
    float _364 = fma(_340, _174, _356);
    float _366 = fma(_352, _198, _180);
    float _368 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _370 = _228 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _372 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _360);
    float _374 = fma(_364, _198, _184);
    float _376 = _230 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _378 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _380 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].x, _368);
    float _382 = _370 * _372;
    float _384 = _230 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _386 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[10].x, _376);
    float _388 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].x, _378);
    float _390 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].z, _380);
    float _392 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[8].x, _384);
    float _394 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[10].z, _386);
    float _396 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].z, _388);
    float _398 = _390 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _400 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[8].z, _392);
    float _402 = _230 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _404 = _396 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _406 = _398 + _394;
    float _408 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[9].x, _402);
    float _410 = _404 + _400;
    float _412 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _414 = _406 + _412;
    float _416 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[9].z, _408);
    float _418 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _420 = _410 + _418;
    float _422 = _414 * _414;
    float _424 = fma(_420, _420, _422);
    float _426 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _428 = sqrt(_424);
    float _430 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].x, _426);
    float _432 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].z, _430);
    float _434 = _432 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _436 = _434 + _416;
    bool _438 = _428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _440 = _434;
    float _442 = _410;
    float _444 = _406;
    if (!_438)
    {
        _440 = _436;
    }
    float _446 = _440;
    bool _448 = !_438;
    float _450 = _446;
    if (!_448)
    {
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _454 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _456 = _428 + _454;
        float _458 = rsqrt(_424);
        float _460 = _456 * _452;
        float _462 = _436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _464 = _460 * 0.15915493667125701904296875;
        float _466 = _464 * 6.283185482025146484375;
        float _468 = cos(_466);
        float _470 = _464 * 6.283185482025146484375;
        float _472 = sin(_470);
        float _474 = _468 + (-1.0);
        float _476 = _474 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _478 = fma(_472, _462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _480 = fma(_436, _468, _476);
        float _482 = _458 * _478;
        float _484 = fma(_420, _482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _486 = fma(_414, _482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _450 = _480;
        _442 = _484;
        _444 = _486;
    }
    float _488 = _450;
    float _490 = _442;
    float _492 = _444;
    float _494 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _496 = _488 + _494;
    float _498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _500 = _490 + _498;
    float _502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _504 = _492 + _502;
    float _506 = _496 * _496;
    float _508 = fma(_500, _500, _506);
    float _510 = fma(_504, _504, _508);
    float _512 = rsqrt(_510);
    float _514 = _512 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _516 = _500 * _514;
    float _518 = _504 * _514;
    float _520 = _516 * _516;
    float _522 = _518 * _518;
    float _524 = _520 + _522;
    float _526 = sqrt(_524);
    bool _528 = _526 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _530 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _532 = _526 + _530;
    float _534 = _504;
    float _536 = _524;
    float _538 = _532;
    float _540 = _496;
    if (_528)
    {
        float _542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _534 = _542;
    }
    float _544 = _534;
    if (_528)
    {
        float _546 = rsqrt(_524);
        _536 = _546;
    }
    float _548 = _536;
    float _550 = _548;
    if (_528)
    {
        float _552 = _532 * _544;
        _538 = _552;
    }
    float _554 = _538;
    if (_528)
    {
        float _556 = _554 * 0.15915493667125701904296875;
        _252 = _556;
    }
    float _558 = _252;
    float _560 = _512;
    if (_528)
    {
        float _562 = _558 * 6.283185482025146484375;
        float _564 = sin(_562);
        _560 = _564;
    }
    float _566 = _560;
    float _568 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _570 = precise::max(0.0, _568);
    float _572 = _506;
    float _574 = _570;
    float _576 = _568;
    if (_528)
    {
        float _578 = _558 * 6.283185482025146484375;
        float _580 = cos(_578);
        _572 = _580;
    }
    float _582 = _572;
    float _584 = -_514;
    float _586 = -_570;
    float _588 = fma(_496, _584, _586);
    if (!_528)
    {
        _540 = _518;
    }
    float _590 = _540;
    float _592 = _590;
    if (_528)
    {
        float _594 = _588 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _574 = _594;
    }
    float _596 = _574;
    float _598 = _488 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _600 = _596;
    float _602 = _566;
    if (_528)
    {
        float _604 = fma(_566, _596, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _600 = _604;
    }
    float _606 = _600;
    float _608 = _606;
    if (!_528)
    {
        _602 = _516;
    }
    float _610 = _602;
    float _612 = _610;
    float _614 = _582;
    if (_528)
    {
        float _616 = _582 + (-1.0);
        _576 = _616;
    }
    float _618 = _576;
    if (_528)
    {
        float _620 = _548 * _606;
        _254 = _620;
    }
    float _622 = _254;
    if (!_528)
    {
        _608 = _588;
    }
    float _624 = _608;
    float _626 = _624;
    if (_528)
    {
        float _628 = _618 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _318 = _628;
    }
    float _630 = _318;
    if (_528)
    {
        float _632 = _516 * _622;
        _612 = _632;
    }
    float _634 = _612;
    if (!_528)
    {
        _550 = _520;
    }
    float _636 = _550;
    float _638 = sqrt(_510);
    float _640 = _636;
    if (_528)
    {
        float _642 = fma(_588, _582, _630);
        _626 = _642;
    }
    float _644 = _626;
    if (_528)
    {
        float _646 = _518 * _622;
        _592 = _646;
    }
    float _648 = _592;
    if (_528)
    {
        float _650 = _634 * _634;
        _640 = _650;
    }
    float _652 = _640;
    if (!_528)
    {
        _614 = _522;
    }
    float _654 = _614;
    float _656 = _654;
    if (_528)
    {
        float _658 = _648 * _648;
        _656 = _658;
    }
    float _660 = _656;
    float _662 = fma(_644, _644, _652);
    float _664 = _662 + _660;
    float _666 = fma(_490, (*spvDescriptorSet0.vp_c8)._m0[2].x, _598);
    float _668 = _488 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _670 = rsqrt(_664);
    float _672 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _674 = fma(_638, (*spvDescriptorSet0.vp_c15)._m0[23].w, _672);
    float _676 = precise::clamp(_674, 0.0, 1.0);
    float _678 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[2].z, _666);
    float _680 = _488 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _682 = fma(_490, (*spvDescriptorSet0.vp_c8)._m0[1].x, _668);
    float _684 = -_676;
    float _686 = _684 + 1.0;
    float _688 = _678 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _690 = fma(_490, (*spvDescriptorSet0.vp_c8)._m0[0].x, _680);
    float _692 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _694 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[1].z, _682);
    float _696 = _688 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _698 = abs(_686);
    float _700 = log2(_698);
    float _702 = _488 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _704 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[0].z, _690);
    float _706 = _694 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _708 = -_696;
    float _710 = fma(_708, _692, 1.0);
    float _712 = _670 * _634;
    float _714 = fma(_490, (*spvDescriptorSet0.vp_c8)._m0[3].x, _702);
    float _716 = _704 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _718 = _706 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _720 = _670 * _644;
    float _722 = _712 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _724 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[3].z, _714);
    float _726 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[7].x, _718);
    float _728 = _670 * _648;
    float _730 = -_722;
    float _732 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[21].y, _730);
    float _734 = _724 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _736 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[7].z, _726);
    float _738 = _700 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _740 = -_728;
    float _742 = fma(_740, (*spvDescriptorSet0.vp_c15)._m0[21].z, _732);
    float _744 = log2(_710);
    float _746 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[7].w, _736);
    float _748 = _706 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _750 = fma(_742, -0.5, 0.5);
    float _752 = _706 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _754 = fma(_742, 0.5, 0.5);
    float _756 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[4].x, _748);
    float _758 = _720 + 1.0;
    float _760 = exp2(_738);
    float _762 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[5].x, _752);
    float _764 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[4].z, _756);
    float _766 = fma(_754, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _768 = fma(_754, _766, -0.212114393711090087890625);
    float _770 = 1.0 / _746;
    float _772 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[5].z, _762);
    float _774 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[4].w, _764);
    float _776 = _744 * 0.693147182464599609375;
    float _778 = fma(_754, _768, 1.570728778839111328125);
    float _780 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[5].w, _772);
    float _782 = _776 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _784 = sqrt(_750);
    float _786 = -_720;
    float _788 = fma(_760, _758, _786);
    float _790 = fma(_788, 0.5, 0.5);
    float _792 = _774 * _770;
    float _794 = _780 * _770;
    float _796 = fma(_792, 0.5, 0.5);
    float _798 = fma(_794, -0.5, 0.5);
    float _800 = _784 * 0.636619746685028076171875;
    float3 _2628 = float3(_796, _798, _782);
    float _802 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2628, float3(0.0), isnan(_2628)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2628, float3(0.0), isnan(_2628)), level(0.0)).x;
    float _804 = -_778;
    float _806 = fma(_800, _804, 1.0);
    float3 _2644 = float3(_796, _798, _782);
    float4 _809 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2644, float3(0.0), isnan(_2644)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2644, float3(0.0), isnan(_2644)), level(0.0)).xyzw;
    float _811 = _809.x;
    float _813 = _809.y;
    float _815 = _809.z;
    float _817 = _809.w;
    float2 _2661 = float2(_806, _790);
    float3 _821 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2661, float2(0.0), isnan(_2661)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2661, float2(0.0), isnan(_2661)), level(0.0)).xyz;
    float _823 = _821.x;
    float _825 = _821.y;
    float _827 = _821.z;
    float _829 = in.m_55.y;
    float _831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _835 = _833 != 0;
    float _837 = in.m_57.x;
    float _839 = in.m_57.y;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _843 = _841 != 0;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _847 = _700 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _849 = in.m_55.x;
    float _851 = in.m_59.x;
    float _853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _855 = _706 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _857 = _754;
    float _859 = _774;
    if (_835)
    {
        float _861 = in.m_57.x;
        _857 = _861;
    }
    float _863 = _857;
    float _865 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[6].x, _855);
    float _867 = in.m_59.z;
    float _869 = exp2(_847);
    float _871 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[6].z, _865);
    float _873 = -_829;
    float _875 = _873 + 1.0;
    out.m_61.x = _490;
    out.m_61.y = _488;
    out.m_61.z = _492;
    float _877 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[6].w, _871);
    bool _879 = _839 > 0.5;
    float _881 = _837 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _883 = _829;
    float _885 = _877;
    if (_843)
    {
        float _887 = _879 ? _875 : _829;
        _883 = _887;
    }
    float _889 = _883;
    float _891 = -_845;
    float _893 = fma(_881, 2.0, _891);
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _897 = _831 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _899 = -_869;
    float _901 = _899 + 1.0;
    float _903 = 0.0;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_835)
    {
        _903 = _849;
    }
    float _907 = _903;
    float _909 = fma(_897, _889, -0.5);
    bool _911 = _863 > 0.5;
    bool _913 = _911 && _835;
    float _915 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[78].z, _895);
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _919 = _839 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _923 = -_134;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[76].x, _893);
    float _927 = _220 * _851;
    float _929 = fma(_919, -2.0, _917);
    float _931 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[78].w, _921);
    float _933 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _915);
    float _935 = _907;
    if (!_835)
    {
        _905 = _849;
    }
    float _937 = _905;
    float _939 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _929);
    float _941 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _931);
    float _943 = _937;
    if (_913)
    {
        float _945 = -_907;
        float _947 = _945 + 1.0;
        _935 = _947;
    }
    float _949 = _935;
    float _951 = _208 * _851;
    float _953 = _853 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _955 = in.m_59.y;
    float _957 = -_939;
    float _959 = fma(_941, _909, _957);
    if (_835)
    {
        _943 = _949;
    }
    float _961 = _943;
    float _963 = fma(_208, _867, _927);
    bool _965 = _156 != 0.0;
    bool _967 = isnan(_156);
    bool _969 = _965 || _967;
    bool _971 = isnan(0.0);
    bool _973 = _969 || _971;
    float _975 = -_951;
    float _977 = fma(_220, _867, _975);
    float _979 = fma(_953, _961, -0.5);
    bool _981 = _346 == 0.0;
    bool _983 = !_973;
    bool _985 = _981 && _983;
    float _987 = in.m_63.w;
    float _989 = fma(_933, _979, _925);
    bool _991 = _360 == 0.0;
    bool _993 = _991 && _985;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _999 = _995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1007 = _955;
    float _1009 = _963;
    float _1011 = _977;
    if (!_993)
    {
        float _1013 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[17].y, _955);
        _1007 = _1013;
    }
    float _1015 = _1007;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1021 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1023 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_993)
    {
        float _1025 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[17].y, _963);
        _1009 = _1025;
    }
    float _1027 = _1009;
    float _1029 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1033 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1035 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1037 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1021;
    out.m_65.y = _999;
    out.m_65.z = _1023;
    out.m_65.w = _997;
    float _1039 = _989 + 0.5;
    if (!_993)
    {
        float _1041 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[17].y, _977);
        _1011 = _1041;
    }
    float _1043 = _1011;
    float _1045 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1047 = fma(_1027, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1029);
    float _1049 = _901 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1033;
    out.m_67.y = _1035;
    out.m_67.z = _1037;
    out.m_67.w = _1031;
    float _1051 = fma(_1027, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1045);
    float _1053 = _959 + 0.5;
    bool _1055 = _638 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1057 = isnan(_638);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1063 = _1059 || _1061;
    out.m_69.w = _987;
    float _1065 = _746 * 0.5;
    float _1067 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_71.x = _1039;
    out.m_71.y = _1053;
    float _1069 = fma(_1027, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1067);
    float _1071 = fma(_780, -0.5, _1065);
    float _1073 = fma(_1043, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1047);
    float _1075 = fma(_1043, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1051);
    float _1077 = _877 + _746;
    float _1079 = _774 + _746;
    float _1081 = fma(_1043, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1069);
    float _1083 = _1077 * 0.5;
    float _1085 = _1079 * 0.5;
    out.gl_Position.x = _774;
    out.gl_Position.y = _780;
    out.gl_Position.z = _877;
    out.gl_Position.w = _746;
    out.m_73.x = _1085;
    out.m_73.y = _1071;
    out.m_73.z = _1083;
    out.m_73.w = _746;
    out.m_75.x = _1073;
    out.m_75.y = _1075;
    out.m_75.z = _1081;
    if (!_1063)
    {
        _885 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1087 = _885;
    float _1089 = _1087;
    float _1091 = _1087;
    if (!_1063)
    {
        _859 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1093 = _859;
    float _1095 = _1049 * _802;
    float _1097 = -_1049;
    float _1099 = _1097 + 1.0;
    float _1101 = _817 * _1095;
    float _1103 = _827 * _1095;
    float _1105 = fma(_823, _1101, _811);
    float _1107 = fma(_825, _1101, _813);
    float _1109 = _817 * _1099;
    float _1111 = fma(_817, _1103, _815);
    float _1113 = _1101;
    float _1115 = _817;
    float _1117 = _815;
    float _1119 = _1095;
    float _1121 = _1093;
    float _1123 = _1093;
    if (!_1063)
    {
        _1113 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1125 = _1113;
    float _1127 = _1125;
    float _1129 = _1125;
    if (!_1063)
    {
        _1115 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1131 = _1115;
    out.m_77.x = _1105;
    out.m_77.y = _1107;
    out.m_77.z = _1111;
    out.m_77.w = _1109;
    float _1133 = _1131;
    float _1135 = _1131;
    if (!_1063)
    {
        _1117 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1137 = _1117;
    float _1139 = _1137;
    float _1141 = _1137;
    if (!_1063)
    {
        _1119 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1143 = _1119;
    bool _1145 = !_1063;
    float _1147 = _1143;
    float _1149 = _1143;
    if (!_1145)
    {
        bool _1151 = _638 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1153 = isnan(_638);
        bool _1155 = _1151 || _1153;
        bool _1157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1159 = _1155 || _1157;
        if (!_1159)
        {
            float _1161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1163 = _638 + _1161;
            float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1167 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1165;
            float _1169 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1171 = _1169 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1173 = 1.0 / _1167;
            float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1177 = _1175 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1179 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1181 = _1179 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1185 = _1183 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1189 = _1187 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1191 = _1163 * _1173;
            float _1193 = precise::clamp(_1191, 0.0, 1.0);
            float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1197 = _1195 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1199 = fma(_1193, _1171, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1201 = fma(_1193, _1197, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1203 = fma(_1193, _1177, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1205 = fma(_1193, _1181, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1207 = fma(_1193, _1185, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1209 = fma(_1193, _1189, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1129 = _1203;
            _1141 = _1207;
            _1091 = _1199;
            _1135 = _1205;
            _1123 = _1201;
            _1149 = _1209;
            _1211 = true;
        }
        else
        {
            bool _1213 = _638 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1215 = isnan(_638);
            bool _1217 = _1213 || _1215;
            bool _1219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1221 = _1217 || _1219;
            if (!_1221)
            {
                _1089 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1223 = _1089;
            _1091 = _1223;
            if (!_1221)
            {
                _1127 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1225 = _1127;
            _1129 = _1225;
            if (!_1221)
            {
                _1121 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1227 = _1121;
            _1123 = _1227;
            if (!_1221)
            {
                _1133 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1229 = _1133;
            _1135 = _1229;
            if (!_1221)
            {
                _1139 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1231 = _1139;
            _1141 = _1231;
            if (!_1221)
            {
                _1147 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1233 = _1147;
            bool _1235 = !_1221;
            _1149 = _1233;
            if (!_1235)
            {
                bool _1237 = _638 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1239 = isnan(_638);
                bool _1241 = _1237 || _1239;
                bool _1243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1245 = _1241 || _1243;
                if (!_1245)
                {
                    float _1247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1249 = _638 + _1247;
                    float _1251 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1253 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1251;
                    float _1255 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1257 = _1255 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1259 = 1.0 / _1253;
                    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1263 = _1261 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1267 = _1265 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1269 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1271 = _1269 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1273 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1275 = _1273 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1277 = _1249 * _1259;
                    float _1279 = precise::clamp(_1277, 0.0, 1.0);
                    float _1281 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1283 = _1281 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1285 = fma(_1279, _1257, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1287 = fma(_1279, _1283, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1289 = fma(_1279, _1263, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1291 = fma(_1279, _1267, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1293 = fma(_1279, _1271, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1295 = fma(_1279, _1275, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1129 = _1289;
                    _1141 = _1293;
                    _1091 = _1285;
                    _1135 = _1291;
                    _1123 = _1287;
                    _1149 = _1295;
                    _1211 = true;
                }
                else
                {
                    _1129 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1141 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1091 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1135 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1123 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1149 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1211 = false;
    float _1297 = _1129;
    float _1299 = _1141;
    float _1301 = _1091;
    float _1303 = _1135;
    float _1305 = _1123;
    float _1307 = _1149;
    float _1309 = fma(_1075, -0.5, 0.5);
    float _1311 = precise::clamp(_1309, 0.0, 1.0);
    float _1313 = -_1297;
    float _1315 = _1313 + _1299;
    float _1317 = -_1301;
    float _1319 = _1317 + _1303;
    float _1321 = -_1305;
    float _1323 = _1321 + _1307;
    bool _1325 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1327 = fma(_1311, _1315, _1297);
    float _1329 = fma(_1311, _1319, _1301);
    float _1331 = fma(_1311, _1323, _1305);
    float _1333 = _1327 * 0.586610972881317138671875;
    out.m_79.x = 0.0;
    float _1335 = fma(_1329, 0.298911988735198974609375, _1333);
    float _1337 = fma(_1331, 0.114477999508380889892578125, _1335);
    float _1339 = -_1337;
    float _1341 = _1329 + _1339;
    float _1343 = -_1337;
    float _1345 = _1327 + _1343;
    float _1347 = -_1337;
    float _1349 = _1331 + _1347;
    float _1351 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1353 = fma(_1341, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1337);
    float _1355 = fma(_1345, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1337);
    float _1357 = fma(_1349, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1337);
    out.m_47.x = _1351;
    out.m_81.x = _1353;
    out.m_81.y = _1355;
    out.m_81.z = _1357;
    if (!_1325)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1359 = -_488;
    float _1361 = _1359 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1363 = -_490;
    float _1365 = _1363 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1367 = -_492;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1371 = _1361 * _1361;
    float _1373 = fma(_1365, _1365, _1371);
    float _1375 = fma(_1369, _1369, _1373);
    float _1377 = sqrt(_1375);
    float _1379 = rsqrt(_1375);
    float _1381 = -_1377;
    float _1383 = _1381 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1385 = _1383 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1387 = precise::clamp(_1385, 0.0, 1.0);
    float _1389 = _1365 * _1379;
    float _1391 = _1361 * _1379;
    float _1393 = abs(_1387);
    float _1395 = log2(_1393);
    float _1397 = _1369 * _1379;
    float _1399 = _1389 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1401 = _1075 * _1391;
    float _1403 = -_1391;
    float _1405 = -_1399;
    float _1407 = fma(_1403, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1405);
    float _1409 = fma(_1073, _1389, _1401);
    float _1411 = -_1397;
    float _1413 = fma(_1411, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1407);
    float _1415 = fma(_1081, _1397, _1409);
    float _1417 = precise::clamp(_1415, 0.0, 1.0);
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1421 = _1413 + _1419;
    float _1423 = _1395 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1425 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1427 = precise::clamp(_1425, 0.0, 1.0);
    float _1429 = exp2(_1423);
    float _1431 = _1429 * _1427;
    float _1433 = _1417 * _1431;
    float _1435 = _1433 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1437 = _1433 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1439 = _1433 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_79.x = _1435;
    out.m_79.y = _1437;
    out.m_79.z = _1439;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_100);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1497 = as_type<float>(_116);
        out.gl_Position.z = _1497;
    }
    if (!_104)
    {
        return out;
    }
    float _120 = in.m_49.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_100);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1566 = as_type<float>(_152);
        out.gl_Position.z = _1566;
    }
    if (_144)
    {
        return out;
    }
    float _154 = in.m_51.x;
    float _156 = in.m_51.y;
    float _158 = in.m_51.z;
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _168 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0500000081956386566162109375;
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _166 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _178 = _168 * 0.15915493667125701904296875;
    float _180 = in.m_44.x;
    float _182 = in.m_44.y;
    float _184 = in.m_44.z;
    bool _186 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _188 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _190 = _186 || _188;
    bool _192 = isnan(1.0);
    bool _194 = _190 || _192;
    float _196 = _176 * 0.15915493667125701904296875;
    float _198 = in.m_53.w;
    float _200 = _178 * 6.283185482025146484375;
    float _202 = sin(_200);
    float _204 = _156 + (-0.5);
    float _206 = _196 * 6.283185482025146484375;
    float _208 = sin(_206);
    float _210 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _156);
    float _212 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _214 = _160 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _216 = _212 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _218 = _196 * 6.283185482025146484375;
    float _220 = cos(_218);
    float _222 = abs(_204);
    float _224 = fma(_222, -2.0, 1.0);
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _230 = _216 * _210;
    float _232 = _178 * 6.283185482025146484375;
    float _234 = cos(_232);
    float _236 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _238 = fma(_226, -2.0, 3.0);
    float _240 = _226 * _226;
    float _242 = _208 * _154;
    float _244 = _220 * _154;
    float _246 = _154;
    float _248 = _244;
    float _250 = _236;
    float _252 = _230;
    float _254 = _202;
    if (!_194)
    {
        float _256 = _236 * _236;
        float _258 = _256 * 0.5;
        _246 = _258;
    }
    float _260 = _246;
    float _262 = _238 * _240;
    float _264 = _262 * 0.125;
    float _266 = -_242;
    float _268 = fma(_220, _158, _266);
    float _270 = fma(_208, _158, _244);
    float _272 = _260;
    if (!_194)
    {
        float _274 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _272 = _274;
    }
    float _276 = _272;
    bool _278 = !_194;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _236 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _236);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
        _248 = _288;
    }
    float _312 = _280;
    float _314 = _248;
    bool _316 = !_194;
    float _318 = _314;
    if (!_316)
    {
        float _320 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _322 = log2(_320);
        float _324 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _326 = _324 + 1.0;
        float _328 = 1.0 / _326;
        float _330 = _236 * _322;
        float _332 = exp2(_330);
        float _334 = -_332;
        float _336 = _334 + 1.0;
        float _338 = _336 * _328;
        _250 = _338;
    }
    float _340 = _250;
    float _342 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _344 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _346 = fma(_202, _264, _270);
    float _348 = _214 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _350 = fma(_340, _172, _342);
    float _352 = fma(_340, _170, _344);
    float _354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _346);
    float _356 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _358 = fma(_350, _198, _182);
    float _360 = fma(_264, _234, _268);
    float _362 = _348 * _354;
    float _364 = fma(_340, _174, _356);
    float _366 = fma(_352, _198, _180);
    float _368 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _370 = _228 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _372 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _360);
    float _374 = fma(_364, _198, _184);
    float _376 = _230 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _378 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _380 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].x, _368);
    float _382 = _370 * _372;
    float _384 = _230 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _386 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[10].x, _376);
    float _388 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].x, _378);
    float _390 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].z, _380);
    float _392 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[8].x, _384);
    float _394 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[10].z, _386);
    float _396 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].z, _388);
    float _398 = _390 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _400 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[8].z, _392);
    float _402 = _230 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _404 = _396 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _406 = _398 + _394;
    float _408 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[9].x, _402);
    float _410 = _404 + _400;
    float _412 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _414 = _406 + _412;
    float _416 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[9].z, _408);
    float _418 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _420 = _410 + _418;
    float _422 = _414 * _414;
    float _424 = fma(_420, _420, _422);
    float _426 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _428 = sqrt(_424);
    float _430 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].x, _426);
    float _432 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].z, _430);
    float _434 = _432 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _436 = _434 + _416;
    bool _438 = _428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _440 = _434;
    float _442 = _410;
    float _444 = _406;
    if (!_438)
    {
        _440 = _436;
    }
    float _446 = _440;
    bool _448 = !_438;
    float _450 = _446;
    if (!_448)
    {
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _454 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _456 = _428 + _454;
        float _458 = rsqrt(_424);
        float _460 = _456 * _452;
        float _462 = _436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _464 = _460 * 0.15915493667125701904296875;
        float _466 = _464 * 6.283185482025146484375;
        float _468 = cos(_466);
        float _470 = _464 * 6.283185482025146484375;
        float _472 = sin(_470);
        float _474 = _468 + (-1.0);
        float _476 = _474 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _478 = fma(_472, _462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _480 = fma(_436, _468, _476);
        float _482 = _458 * _478;
        float _484 = fma(_420, _482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _486 = fma(_414, _482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _450 = _480;
        _442 = _484;
        _444 = _486;
    }
    float _488 = _450;
    float _490 = _442;
    float _492 = _444;
    float _494 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _496 = _488 + _494;
    float _498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _500 = _490 + _498;
    float _502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _504 = _492 + _502;
    float _506 = _496 * _496;
    float _508 = fma(_500, _500, _506);
    float _510 = fma(_504, _504, _508);
    float _512 = rsqrt(_510);
    float _514 = _512 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _516 = _500 * _514;
    float _518 = _504 * _514;
    float _520 = _516 * _516;
    float _522 = _518 * _518;
    float _524 = _520 + _522;
    float _526 = sqrt(_524);
    bool _528 = _526 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _530 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _532 = _526 + _530;
    float _534 = _504;
    float _536 = _524;
    float _538 = _532;
    float _540 = _496;
    if (_528)
    {
        float _542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _534 = _542;
    }
    float _544 = _534;
    if (_528)
    {
        float _546 = rsqrt(_524);
        _536 = _546;
    }
    float _548 = _536;
    float _550 = _548;
    if (_528)
    {
        float _552 = _532 * _544;
        _538 = _552;
    }
    float _554 = _538;
    if (_528)
    {
        float _556 = _554 * 0.15915493667125701904296875;
        _252 = _556;
    }
    float _558 = _252;
    float _560 = _512;
    if (_528)
    {
        float _562 = _558 * 6.283185482025146484375;
        float _564 = sin(_562);
        _560 = _564;
    }
    float _566 = _560;
    float _568 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _570 = precise::max(0.0, _568);
    float _572 = _506;
    float _574 = _570;
    float _576 = _568;
    if (_528)
    {
        float _578 = _558 * 6.283185482025146484375;
        float _580 = cos(_578);
        _572 = _580;
    }
    float _582 = _572;
    float _584 = -_514;
    float _586 = -_570;
    float _588 = fma(_496, _584, _586);
    if (!_528)
    {
        _540 = _518;
    }
    float _590 = _540;
    float _592 = _590;
    if (_528)
    {
        float _594 = _588 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _574 = _594;
    }
    float _596 = _574;
    float _598 = _488 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _600 = _596;
    float _602 = _566;
    if (_528)
    {
        float _604 = fma(_566, _596, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _600 = _604;
    }
    float _606 = _600;
    float _608 = _606;
    if (!_528)
    {
        _602 = _516;
    }
    float _610 = _602;
    float _612 = _610;
    float _614 = _582;
    if (_528)
    {
        float _616 = _582 + (-1.0);
        _576 = _616;
    }
    float _618 = _576;
    if (_528)
    {
        float _620 = _548 * _606;
        _254 = _620;
    }
    float _622 = _254;
    if (!_528)
    {
        _608 = _588;
    }
    float _624 = _608;
    float _626 = _624;
    if (_528)
    {
        float _628 = _618 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _318 = _628;
    }
    float _630 = _318;
    if (_528)
    {
        float _632 = _516 * _622;
        _612 = _632;
    }
    float _634 = _612;
    if (!_528)
    {
        _550 = _520;
    }
    float _636 = _550;
    float _638 = sqrt(_510);
    float _640 = _636;
    if (_528)
    {
        float _642 = fma(_588, _582, _630);
        _626 = _642;
    }
    float _644 = _626;
    if (_528)
    {
        float _646 = _518 * _622;
        _592 = _646;
    }
    float _648 = _592;
    if (_528)
    {
        float _650 = _634 * _634;
        _640 = _650;
    }
    float _652 = _640;
    if (!_528)
    {
        _614 = _522;
    }
    float _654 = _614;
    float _656 = _654;
    if (_528)
    {
        float _658 = _648 * _648;
        _656 = _658;
    }
    float _660 = _656;
    float _662 = fma(_644, _644, _652);
    float _664 = _662 + _660;
    float _666 = fma(_490, (*spvDescriptorSet0.vp_c8)._m0[2].x, _598);
    float _668 = _488 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _670 = rsqrt(_664);
    float _672 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _674 = fma(_638, (*spvDescriptorSet0.vp_c15)._m0[23].w, _672);
    float _676 = precise::clamp(_674, 0.0, 1.0);
    float _678 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[2].z, _666);
    float _680 = _488 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _682 = fma(_490, (*spvDescriptorSet0.vp_c8)._m0[1].x, _668);
    float _684 = -_676;
    float _686 = _684 + 1.0;
    float _688 = _678 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _690 = fma(_490, (*spvDescriptorSet0.vp_c8)._m0[0].x, _680);
    float _692 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _694 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[1].z, _682);
    float _696 = _688 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _698 = abs(_686);
    float _700 = log2(_698);
    float _702 = _488 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _704 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[0].z, _690);
    float _706 = _694 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _708 = -_696;
    float _710 = fma(_708, _692, 1.0);
    float _712 = _670 * _634;
    float _714 = fma(_490, (*spvDescriptorSet0.vp_c8)._m0[3].x, _702);
    float _716 = _704 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _718 = _706 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _720 = _670 * _644;
    float _722 = _712 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _724 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[3].z, _714);
    float _726 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[7].x, _718);
    float _728 = _670 * _648;
    float _730 = -_722;
    float _732 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[21].y, _730);
    float _734 = _724 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _736 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[7].z, _726);
    float _738 = _700 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _740 = -_728;
    float _742 = fma(_740, (*spvDescriptorSet0.vp_c15)._m0[21].z, _732);
    float _744 = log2(_710);
    float _746 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[7].w, _736);
    float _748 = _706 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _750 = fma(_742, -0.5, 0.5);
    float _752 = _706 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _754 = fma(_742, 0.5, 0.5);
    float _756 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[4].x, _748);
    float _758 = _720 + 1.0;
    float _760 = exp2(_738);
    float _762 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[5].x, _752);
    float _764 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[4].z, _756);
    float _766 = fma(_754, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _768 = fma(_754, _766, -0.212114393711090087890625);
    float _770 = 1.0 / _746;
    float _772 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[5].z, _762);
    float _774 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[4].w, _764);
    float _776 = _744 * 0.693147182464599609375;
    float _778 = fma(_754, _768, 1.570728778839111328125);
    float _780 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[5].w, _772);
    float _782 = _776 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _784 = sqrt(_750);
    float _786 = -_720;
    float _788 = fma(_760, _758, _786);
    float _790 = fma(_788, 0.5, 0.5);
    float _792 = _774 * _770;
    float _794 = _780 * _770;
    float _796 = fma(_792, 0.5, 0.5);
    float _798 = fma(_794, -0.5, 0.5);
    float _800 = _784 * 0.636619746685028076171875;
    float3 _2628 = float3(_796, _798, _782);
    float _802 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2628, float3(0.0), isnan(_2628)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2628, float3(0.0), isnan(_2628)), level(0.0)).x;
    float _804 = -_778;
    float _806 = fma(_800, _804, 1.0);
    float3 _2644 = float3(_796, _798, _782);
    float4 _809 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2644, float3(0.0), isnan(_2644)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2644, float3(0.0), isnan(_2644)), level(0.0)).xyzw;
    float _811 = _809.x;
    float _813 = _809.y;
    float _815 = _809.z;
    float _817 = _809.w;
    float2 _2661 = float2(_806, _790);
    float3 _821 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2661, float2(0.0), isnan(_2661)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2661, float2(0.0), isnan(_2661)), level(0.0)).xyz;
    float _823 = _821.x;
    float _825 = _821.y;
    float _827 = _821.z;
    float _829 = in.m_55.y;
    float _831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _835 = _833 != 0;
    float _837 = in.m_57.x;
    float _839 = in.m_57.y;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _843 = _841 != 0;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _847 = _700 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _849 = in.m_55.x;
    float _851 = in.m_59.x;
    float _853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _855 = _706 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _857 = _754;
    float _859 = _774;
    if (_835)
    {
        float _861 = in.m_57.x;
        _857 = _861;
    }
    float _863 = _857;
    float _865 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[6].x, _855);
    float _867 = in.m_59.z;
    float _869 = exp2(_847);
    float _871 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[6].z, _865);
    float _873 = -_829;
    float _875 = _873 + 1.0;
    out.m_61.x = _490;
    out.m_61.y = _488;
    out.m_61.z = _492;
    float _877 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[6].w, _871);
    bool _879 = _839 > 0.5;
    float _881 = _837 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _883 = _829;
    float _885 = _877;
    if (_843)
    {
        float _887 = _879 ? _875 : _829;
        _883 = _887;
    }
    float _889 = _883;
    float _891 = -_845;
    float _893 = fma(_881, 2.0, _891);
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _897 = _831 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _899 = -_869;
    float _901 = _899 + 1.0;
    float _903 = 0.0;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_835)
    {
        _903 = _849;
    }
    float _907 = _903;
    float _909 = fma(_897, _889, -0.5);
    bool _911 = _863 > 0.5;
    bool _913 = _911 && _835;
    float _915 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[78].z, _895);
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _919 = _839 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _923 = -_134;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[76].x, _893);
    float _927 = _220 * _851;
    float _929 = fma(_919, -2.0, _917);
    float _931 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[78].w, _921);
    float _933 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _915);
    float _935 = _907;
    if (!_835)
    {
        _905 = _849;
    }
    float _937 = _905;
    float _939 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _929);
    float _941 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _931);
    float _943 = _937;
    if (_913)
    {
        float _945 = -_907;
        float _947 = _945 + 1.0;
        _935 = _947;
    }
    float _949 = _935;
    float _951 = _208 * _851;
    float _953 = _853 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _955 = in.m_59.y;
    float _957 = -_939;
    float _959 = fma(_941, _909, _957);
    if (_835)
    {
        _943 = _949;
    }
    float _961 = _943;
    float _963 = fma(_208, _867, _927);
    bool _965 = _156 != 0.0;
    bool _967 = isnan(_156);
    bool _969 = _965 || _967;
    bool _971 = isnan(0.0);
    bool _973 = _969 || _971;
    float _975 = -_951;
    float _977 = fma(_220, _867, _975);
    float _979 = fma(_953, _961, -0.5);
    bool _981 = _346 == 0.0;
    bool _983 = !_973;
    bool _985 = _981 && _983;
    float _987 = in.m_63.w;
    float _989 = fma(_933, _979, _925);
    bool _991 = _360 == 0.0;
    bool _993 = _991 && _985;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _999 = _995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1007 = _955;
    float _1009 = _963;
    float _1011 = _977;
    if (!_993)
    {
        float _1013 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[17].y, _955);
        _1007 = _1013;
    }
    float _1015 = _1007;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1021 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1023 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_993)
    {
        float _1025 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[17].y, _963);
        _1009 = _1025;
    }
    float _1027 = _1009;
    float _1029 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1033 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1035 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1037 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1021;
    out.m_65.y = _999;
    out.m_65.z = _1023;
    out.m_65.w = _997;
    float _1039 = _989 + 0.5;
    if (!_993)
    {
        float _1041 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[17].y, _977);
        _1011 = _1041;
    }
    float _1043 = _1011;
    float _1045 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1047 = fma(_1027, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1029);
    float _1049 = _901 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1033;
    out.m_67.y = _1035;
    out.m_67.z = _1037;
    out.m_67.w = _1031;
    float _1051 = fma(_1027, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1045);
    float _1053 = _959 + 0.5;
    bool _1055 = _638 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1057 = isnan(_638);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1063 = _1059 || _1061;
    out.m_69.w = _987;
    float _1065 = _746 * 0.5;
    float _1067 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_71.x = _1039;
    out.m_71.y = _1053;
    float _1069 = fma(_1027, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1067);
    float _1071 = fma(_780, -0.5, _1065);
    float _1073 = fma(_1043, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1047);
    float _1075 = fma(_1043, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1051);
    float _1077 = _877 + _746;
    float _1079 = _774 + _746;
    float _1081 = fma(_1043, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1069);
    float _1083 = _1077 * 0.5;
    float _1085 = _1079 * 0.5;
    out.gl_Position.x = _774;
    out.gl_Position.y = _780;
    out.gl_Position.z = _877;
    out.gl_Position.w = _746;
    out.m_73.x = _1085;
    out.m_73.y = _1071;
    out.m_73.z = _1083;
    out.m_73.w = _746;
    out.m_75.x = _1073;
    out.m_75.y = _1075;
    out.m_75.z = _1081;
    if (!_1063)
    {
        _885 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1087 = _885;
    float _1089 = _1087;
    float _1091 = _1087;
    if (!_1063)
    {
        _859 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1093 = _859;
    float _1095 = _1049 * _802;
    float _1097 = -_1049;
    float _1099 = _1097 + 1.0;
    float _1101 = _817 * _1095;
    float _1103 = _827 * _1095;
    float _1105 = fma(_823, _1101, _811);
    float _1107 = fma(_825, _1101, _813);
    float _1109 = _817 * _1099;
    float _1111 = fma(_817, _1103, _815);
    float _1113 = _1101;
    float _1115 = _817;
    float _1117 = _815;
    float _1119 = _1095;
    float _1121 = _1093;
    float _1123 = _1093;
    if (!_1063)
    {
        _1113 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1125 = _1113;
    float _1127 = _1125;
    float _1129 = _1125;
    if (!_1063)
    {
        _1115 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1131 = _1115;
    out.m_77.x = _1105;
    out.m_77.y = _1107;
    out.m_77.z = _1111;
    out.m_77.w = _1109;
    float _1133 = _1131;
    float _1135 = _1131;
    if (!_1063)
    {
        _1117 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1137 = _1117;
    float _1139 = _1137;
    float _1141 = _1137;
    if (!_1063)
    {
        _1119 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1143 = _1119;
    bool _1145 = !_1063;
    float _1147 = _1143;
    float _1149 = _1143;
    if (!_1145)
    {
        bool _1151 = _638 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1153 = isnan(_638);
        bool _1155 = _1151 || _1153;
        bool _1157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1159 = _1155 || _1157;
        if (!_1159)
        {
            float _1161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1163 = _638 + _1161;
            float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1167 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1165;
            float _1169 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1171 = _1169 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1173 = 1.0 / _1167;
            float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1177 = _1175 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1179 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1181 = _1179 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1185 = _1183 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1189 = _1187 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1191 = _1163 * _1173;
            float _1193 = precise::clamp(_1191, 0.0, 1.0);
            float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1197 = _1195 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1199 = fma(_1193, _1171, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1201 = fma(_1193, _1197, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1203 = fma(_1193, _1177, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1205 = fma(_1193, _1181, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1207 = fma(_1193, _1185, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1209 = fma(_1193, _1189, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1129 = _1203;
            _1141 = _1207;
            _1091 = _1199;
            _1135 = _1205;
            _1123 = _1201;
            _1149 = _1209;
            _1211 = true;
        }
        else
        {
            bool _1213 = _638 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1215 = isnan(_638);
            bool _1217 = _1213 || _1215;
            bool _1219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1221 = _1217 || _1219;
            if (!_1221)
            {
                _1089 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1223 = _1089;
            _1091 = _1223;
            if (!_1221)
            {
                _1127 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1225 = _1127;
            _1129 = _1225;
            if (!_1221)
            {
                _1121 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1227 = _1121;
            _1123 = _1227;
            if (!_1221)
            {
                _1133 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1229 = _1133;
            _1135 = _1229;
            if (!_1221)
            {
                _1139 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1231 = _1139;
            _1141 = _1231;
            if (!_1221)
            {
                _1147 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1233 = _1147;
            bool _1235 = !_1221;
            _1149 = _1233;
            if (!_1235)
            {
                bool _1237 = _638 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1239 = isnan(_638);
                bool _1241 = _1237 || _1239;
                bool _1243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1245 = _1241 || _1243;
                if (!_1245)
                {
                    float _1247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1249 = _638 + _1247;
                    float _1251 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1253 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1251;
                    float _1255 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1257 = _1255 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1259 = 1.0 / _1253;
                    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1263 = _1261 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1267 = _1265 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1269 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1271 = _1269 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1273 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1275 = _1273 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1277 = _1249 * _1259;
                    float _1279 = precise::clamp(_1277, 0.0, 1.0);
                    float _1281 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1283 = _1281 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1285 = fma(_1279, _1257, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1287 = fma(_1279, _1283, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1289 = fma(_1279, _1263, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1291 = fma(_1279, _1267, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1293 = fma(_1279, _1271, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1295 = fma(_1279, _1275, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1129 = _1289;
                    _1141 = _1293;
                    _1091 = _1285;
                    _1135 = _1291;
                    _1123 = _1287;
                    _1149 = _1295;
                    _1211 = true;
                }
                else
                {
                    _1129 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1141 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1091 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1135 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1123 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1149 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1211 = false;
    float _1297 = _1129;
    float _1299 = _1141;
    float _1301 = _1091;
    float _1303 = _1135;
    float _1305 = _1123;
    float _1307 = _1149;
    float _1309 = fma(_1075, -0.5, 0.5);
    float _1311 = precise::clamp(_1309, 0.0, 1.0);
    float _1313 = -_1297;
    float _1315 = _1313 + _1299;
    float _1317 = -_1301;
    float _1319 = _1317 + _1303;
    float _1321 = -_1305;
    float _1323 = _1321 + _1307;
    bool _1325 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1327 = fma(_1311, _1315, _1297);
    float _1329 = fma(_1311, _1319, _1301);
    float _1331 = fma(_1311, _1323, _1305);
    float _1333 = _1327 * 0.586610972881317138671875;
    out.m_79.x = 0.0;
    float _1335 = fma(_1329, 0.298911988735198974609375, _1333);
    float _1337 = fma(_1331, 0.114477999508380889892578125, _1335);
    float _1339 = -_1337;
    float _1341 = _1329 + _1339;
    float _1343 = -_1337;
    float _1345 = _1327 + _1343;
    float _1347 = -_1337;
    float _1349 = _1331 + _1347;
    float _1351 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1353 = fma(_1341, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1337);
    float _1355 = fma(_1345, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1337);
    float _1357 = fma(_1349, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1337);
    out.m_47.x = _1351;
    out.m_81.x = _1353;
    out.m_81.y = _1355;
    out.m_81.z = _1357;
    if (!_1325)
    {
        return out;
    }
    float _1359 = -_488;
    float _1361 = _1359 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1363 = -_490;
    float _1365 = _1363 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1367 = -_492;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1371 = _1361 * _1361;
    float _1373 = fma(_1365, _1365, _1371);
    float _1375 = fma(_1369, _1369, _1373);
    float _1377 = sqrt(_1375);
    float _1379 = rsqrt(_1375);
    float _1381 = -_1377;
    float _1383 = _1381 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1385 = _1383 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1387 = precise::clamp(_1385, 0.0, 1.0);
    float _1389 = _1365 * _1379;
    float _1391 = _1361 * _1379;
    float _1393 = abs(_1387);
    float _1395 = log2(_1393);
    float _1397 = _1369 * _1379;
    float _1399 = _1389 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1401 = _1075 * _1391;
    float _1403 = -_1391;
    float _1405 = -_1399;
    float _1407 = fma(_1403, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1405);
    float _1409 = fma(_1073, _1389, _1401);
    float _1411 = -_1397;
    float _1413 = fma(_1411, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1407);
    float _1415 = fma(_1081, _1397, _1409);
    float _1417 = precise::clamp(_1415, 0.0, 1.0);
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1421 = _1413 + _1419;
    float _1423 = _1395 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1425 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1427 = precise::clamp(_1425, 0.0, 1.0);
    float _1429 = exp2(_1423);
    float _1431 = _1429 * _1427;
    float _1433 = _1417 * _1431;
    float _1435 = _1433 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1437 = _1433 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1439 = _1433 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_79.x = _1435;
    out.m_79.y = _1437;
    out.m_79.z = _1439;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1211 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_100);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1497 = as_type<float>(_116);
        out.gl_Position.z = _1497;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_49.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_100);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1566 = as_type<float>(_152);
        out.gl_Position.z = _1566;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_51.x;
    float _156 = in.m_51.y;
    float _158 = in.m_51.z;
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _168 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0500000081956386566162109375;
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _166 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _178 = _168 * 0.15915493667125701904296875;
    float _180 = in.m_44.x;
    float _182 = in.m_44.y;
    float _184 = in.m_44.z;
    bool _186 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _188 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _190 = _186 || _188;
    bool _192 = isnan(1.0);
    bool _194 = _190 || _192;
    float _196 = _176 * 0.15915493667125701904296875;
    float _198 = in.m_53.w;
    float _200 = _178 * 6.283185482025146484375;
    float _202 = sin(_200);
    float _204 = _156 + (-0.5);
    float _206 = _196 * 6.283185482025146484375;
    float _208 = sin(_206);
    float _210 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _156);
    float _212 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _214 = _160 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _216 = _212 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _218 = _196 * 6.283185482025146484375;
    float _220 = cos(_218);
    float _222 = abs(_204);
    float _224 = fma(_222, -2.0, 1.0);
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _230 = _216 * _210;
    float _232 = _178 * 6.283185482025146484375;
    float _234 = cos(_232);
    float _236 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _238 = fma(_226, -2.0, 3.0);
    float _240 = _226 * _226;
    float _242 = _208 * _154;
    float _244 = _220 * _154;
    float _246 = _154;
    float _248 = _244;
    float _250 = _236;
    float _252 = _230;
    float _254 = _202;
    if (!_194)
    {
        float _256 = _236 * _236;
        float _258 = _256 * 0.5;
        _246 = _258;
    }
    float _260 = _246;
    float _262 = _238 * _240;
    float _264 = _262 * 0.125;
    float _266 = -_242;
    float _268 = fma(_220, _158, _266);
    float _270 = fma(_208, _158, _244);
    float _272 = _260;
    if (!_194)
    {
        float _274 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _272 = _274;
    }
    float _276 = _272;
    bool _278 = !_194;
    float _280 = _276;
    if (!_278)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = _236 * _284;
        float _294 = 1.0 / _288;
        float _296 = _290 * 0.693147182464599609375;
        float _298 = exp2(_292);
        float _300 = 1.0 / _296;
        float _302 = _298 + (-1.0);
        float _304 = -_302;
        float _306 = fma(_304, _300, _236);
        float _308 = _306 * _294;
        float _310 = _308 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _310;
        _248 = _288;
    }
    float _312 = _280;
    float _314 = _248;
    bool _316 = !_194;
    float _318 = _314;
    if (!_316)
    {
        float _320 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _322 = log2(_320);
        float _324 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _326 = _324 + 1.0;
        float _328 = 1.0 / _326;
        float _330 = _236 * _322;
        float _332 = exp2(_330);
        float _334 = -_332;
        float _336 = _334 + 1.0;
        float _338 = _336 * _328;
        _250 = _338;
    }
    float _340 = _250;
    float _342 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _344 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _346 = fma(_202, _264, _270);
    float _348 = _214 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _350 = fma(_340, _172, _342);
    float _352 = fma(_340, _170, _344);
    float _354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _346);
    float _356 = _312 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _358 = fma(_350, _198, _182);
    float _360 = fma(_264, _234, _268);
    float _362 = _348 * _354;
    float _364 = fma(_340, _174, _356);
    float _366 = fma(_352, _198, _180);
    float _368 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _370 = _228 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _372 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _360);
    float _374 = fma(_364, _198, _184);
    float _376 = _230 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _378 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _380 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].x, _368);
    float _382 = _370 * _372;
    float _384 = _230 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _386 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[10].x, _376);
    float _388 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].x, _378);
    float _390 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[6].z, _380);
    float _392 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[8].x, _384);
    float _394 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[10].z, _386);
    float _396 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[4].z, _388);
    float _398 = _390 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _400 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[8].z, _392);
    float _402 = _230 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _404 = _396 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _406 = _398 + _394;
    float _408 = fma(_362, (*spvDescriptorSet0.vp_c10)._m0[9].x, _402);
    float _410 = _404 + _400;
    float _412 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _414 = _406 + _412;
    float _416 = fma(_382, (*spvDescriptorSet0.vp_c10)._m0[9].z, _408);
    float _418 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _420 = _410 + _418;
    float _422 = _414 * _414;
    float _424 = fma(_420, _420, _422);
    float _426 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _428 = sqrt(_424);
    float _430 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].x, _426);
    float _432 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[5].z, _430);
    float _434 = _432 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _436 = _434 + _416;
    bool _438 = _428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _440 = _434;
    float _442 = _410;
    float _444 = _406;
    if (!_438)
    {
        _440 = _436;
    }
    float _446 = _440;
    bool _448 = !_438;
    float _450 = _446;
    if (!_448)
    {
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _454 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _456 = _428 + _454;
        float _458 = rsqrt(_424);
        float _460 = _456 * _452;
        float _462 = _436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _464 = _460 * 0.15915493667125701904296875;
        float _466 = _464 * 6.283185482025146484375;
        float _468 = cos(_466);
        float _470 = _464 * 6.283185482025146484375;
        float _472 = sin(_470);
        float _474 = _468 + (-1.0);
        float _476 = _474 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _478 = fma(_472, _462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _480 = fma(_436, _468, _476);
        float _482 = _458 * _478;
        float _484 = fma(_420, _482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _486 = fma(_414, _482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _450 = _480;
        _442 = _484;
        _444 = _486;
    }
    float _488 = _450;
    float _490 = _442;
    float _492 = _444;
    float _494 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _496 = _488 + _494;
    float _498 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _500 = _490 + _498;
    float _502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _504 = _492 + _502;
    float _506 = _496 * _496;
    float _508 = fma(_500, _500, _506);
    float _510 = fma(_504, _504, _508);
    float _512 = rsqrt(_510);
    float _514 = _512 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _516 = _500 * _514;
    float _518 = _504 * _514;
    float _520 = _516 * _516;
    float _522 = _518 * _518;
    float _524 = _520 + _522;
    float _526 = sqrt(_524);
    bool _528 = _526 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _530 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _532 = _526 + _530;
    float _534 = _504;
    float _536 = _524;
    float _538 = _532;
    float _540 = _496;
    if (_528)
    {
        float _542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _534 = _542;
    }
    float _544 = _534;
    if (_528)
    {
        float _546 = rsqrt(_524);
        _536 = _546;
    }
    float _548 = _536;
    float _550 = _548;
    if (_528)
    {
        float _552 = _532 * _544;
        _538 = _552;
    }
    float _554 = _538;
    if (_528)
    {
        float _556 = _554 * 0.15915493667125701904296875;
        _252 = _556;
    }
    float _558 = _252;
    float _560 = _512;
    if (_528)
    {
        float _562 = _558 * 6.283185482025146484375;
        float _564 = sin(_562);
        _560 = _564;
    }
    float _566 = _560;
    float _568 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _570 = precise::max(0.0, _568);
    float _572 = _506;
    float _574 = _570;
    float _576 = _568;
    if (_528)
    {
        float _578 = _558 * 6.283185482025146484375;
        float _580 = cos(_578);
        _572 = _580;
    }
    float _582 = _572;
    float _584 = -_514;
    float _586 = -_570;
    float _588 = fma(_496, _584, _586);
    if (!_528)
    {
        _540 = _518;
    }
    float _590 = _540;
    float _592 = _590;
    if (_528)
    {
        float _594 = _588 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _574 = _594;
    }
    float _596 = _574;
    float _598 = _488 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _600 = _596;
    float _602 = _566;
    if (_528)
    {
        float _604 = fma(_566, _596, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _600 = _604;
    }
    float _606 = _600;
    float _608 = _606;
    if (!_528)
    {
        _602 = _516;
    }
    float _610 = _602;
    float _612 = _610;
    float _614 = _582;
    if (_528)
    {
        float _616 = _582 + (-1.0);
        _576 = _616;
    }
    float _618 = _576;
    if (_528)
    {
        float _620 = _548 * _606;
        _254 = _620;
    }
    float _622 = _254;
    if (!_528)
    {
        _608 = _588;
    }
    float _624 = _608;
    float _626 = _624;
    if (_528)
    {
        float _628 = _618 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _318 = _628;
    }
    float _630 = _318;
    if (_528)
    {
        float _632 = _516 * _622;
        _612 = _632;
    }
    float _634 = _612;
    if (!_528)
    {
        _550 = _520;
    }
    float _636 = _550;
    float _638 = sqrt(_510);
    float _640 = _636;
    if (_528)
    {
        float _642 = fma(_588, _582, _630);
        _626 = _642;
    }
    float _644 = _626;
    if (_528)
    {
        float _646 = _518 * _622;
        _592 = _646;
    }
    float _648 = _592;
    if (_528)
    {
        float _650 = _634 * _634;
        _640 = _650;
    }
    float _652 = _640;
    if (!_528)
    {
        _614 = _522;
    }
    float _654 = _614;
    float _656 = _654;
    if (_528)
    {
        float _658 = _648 * _648;
        _656 = _658;
    }
    float _660 = _656;
    float _662 = fma(_644, _644, _652);
    float _664 = _662 + _660;
    float _666 = fma(_490, (*spvDescriptorSet0.vp_c8)._m0[2].x, _598);
    float _668 = _488 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _670 = rsqrt(_664);
    float _672 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _674 = fma(_638, (*spvDescriptorSet0.vp_c15)._m0[23].w, _672);
    float _676 = precise::clamp(_674, 0.0, 1.0);
    float _678 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[2].z, _666);
    float _680 = _488 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _682 = fma(_490, (*spvDescriptorSet0.vp_c8)._m0[1].x, _668);
    float _684 = -_676;
    float _686 = _684 + 1.0;
    float _688 = _678 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _690 = fma(_490, (*spvDescriptorSet0.vp_c8)._m0[0].x, _680);
    float _692 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _694 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[1].z, _682);
    float _696 = _688 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _698 = abs(_686);
    float _700 = log2(_698);
    float _702 = _488 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _704 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[0].z, _690);
    float _706 = _694 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _708 = -_696;
    float _710 = fma(_708, _692, 1.0);
    float _712 = _670 * _634;
    float _714 = fma(_490, (*spvDescriptorSet0.vp_c8)._m0[3].x, _702);
    float _716 = _704 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _718 = _706 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _720 = _670 * _644;
    float _722 = _712 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _724 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[3].z, _714);
    float _726 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[7].x, _718);
    float _728 = _670 * _648;
    float _730 = -_722;
    float _732 = fma(_720, (*spvDescriptorSet0.vp_c15)._m0[21].y, _730);
    float _734 = _724 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _736 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[7].z, _726);
    float _738 = _700 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _740 = -_728;
    float _742 = fma(_740, (*spvDescriptorSet0.vp_c15)._m0[21].z, _732);
    float _744 = log2(_710);
    float _746 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[7].w, _736);
    float _748 = _706 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _750 = fma(_742, -0.5, 0.5);
    float _752 = _706 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _754 = fma(_742, 0.5, 0.5);
    float _756 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[4].x, _748);
    float _758 = _720 + 1.0;
    float _760 = exp2(_738);
    float _762 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[5].x, _752);
    float _764 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[4].z, _756);
    float _766 = fma(_754, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _768 = fma(_754, _766, -0.212114393711090087890625);
    float _770 = 1.0 / _746;
    float _772 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[5].z, _762);
    float _774 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[4].w, _764);
    float _776 = _744 * 0.693147182464599609375;
    float _778 = fma(_754, _768, 1.570728778839111328125);
    float _780 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[5].w, _772);
    float _782 = _776 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _784 = sqrt(_750);
    float _786 = -_720;
    float _788 = fma(_760, _758, _786);
    float _790 = fma(_788, 0.5, 0.5);
    float _792 = _774 * _770;
    float _794 = _780 * _770;
    float _796 = fma(_792, 0.5, 0.5);
    float _798 = fma(_794, -0.5, 0.5);
    float _800 = _784 * 0.636619746685028076171875;
    float3 _2628 = float3(_796, _798, _782);
    float _802 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2628, float3(0.0), isnan(_2628)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2628, float3(0.0), isnan(_2628)), level(0.0)).x;
    float _804 = -_778;
    float _806 = fma(_800, _804, 1.0);
    float3 _2644 = float3(_796, _798, _782);
    float4 _809 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2644, float3(0.0), isnan(_2644)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2644, float3(0.0), isnan(_2644)), level(0.0)).xyzw;
    float _811 = _809.x;
    float _813 = _809.y;
    float _815 = _809.z;
    float _817 = _809.w;
    float2 _2661 = float2(_806, _790);
    float3 _821 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2661, float2(0.0), isnan(_2661)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2661, float2(0.0), isnan(_2661)), level(0.0)).xyz;
    float _823 = _821.x;
    float _825 = _821.y;
    float _827 = _821.z;
    float _829 = in.m_55.y;
    float _831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _835 = _833 != 0;
    float _837 = in.m_57.x;
    float _839 = in.m_57.y;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _843 = _841 != 0;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _847 = _700 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _849 = in.m_55.x;
    float _851 = in.m_59.x;
    float _853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _855 = _706 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _857 = _754;
    float _859 = _774;
    if (_835)
    {
        float _861 = in.m_57.x;
        _857 = _861;
    }
    float _863 = _857;
    float _865 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[6].x, _855);
    float _867 = in.m_59.z;
    float _869 = exp2(_847);
    float _871 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[6].z, _865);
    float _873 = -_829;
    float _875 = _873 + 1.0;
    out.m_61.x = _490;
    out.m_61.y = _488;
    out.m_61.z = _492;
    float _877 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[6].w, _871);
    bool _879 = _839 > 0.5;
    float _881 = _837 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _883 = _829;
    float _885 = _877;
    if (_843)
    {
        float _887 = _879 ? _875 : _829;
        _883 = _887;
    }
    float _889 = _883;
    float _891 = -_845;
    float _893 = fma(_881, 2.0, _891);
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _897 = _831 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _899 = -_869;
    float _901 = _899 + 1.0;
    float _903 = 0.0;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_835)
    {
        _903 = _849;
    }
    float _907 = _903;
    float _909 = fma(_897, _889, -0.5);
    bool _911 = _863 > 0.5;
    bool _913 = _911 && _835;
    float _915 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[78].z, _895);
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _919 = _839 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _923 = -_134;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[76].x, _893);
    float _927 = _220 * _851;
    float _929 = fma(_919, -2.0, _917);
    float _931 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[78].w, _921);
    float _933 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _915);
    float _935 = _907;
    if (!_835)
    {
        _905 = _849;
    }
    float _937 = _905;
    float _939 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _929);
    float _941 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _931);
    float _943 = _937;
    if (_913)
    {
        float _945 = -_907;
        float _947 = _945 + 1.0;
        _935 = _947;
    }
    float _949 = _935;
    float _951 = _208 * _851;
    float _953 = _853 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _955 = in.m_59.y;
    float _957 = -_939;
    float _959 = fma(_941, _909, _957);
    if (_835)
    {
        _943 = _949;
    }
    float _961 = _943;
    float _963 = fma(_208, _867, _927);
    bool _965 = _156 != 0.0;
    bool _967 = isnan(_156);
    bool _969 = _965 || _967;
    bool _971 = isnan(0.0);
    bool _973 = _969 || _971;
    float _975 = -_951;
    float _977 = fma(_220, _867, _975);
    float _979 = fma(_953, _961, -0.5);
    bool _981 = _346 == 0.0;
    bool _983 = !_973;
    bool _985 = _981 && _983;
    float _987 = in.m_63.w;
    float _989 = fma(_933, _979, _925);
    bool _991 = _360 == 0.0;
    bool _993 = _991 && _985;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _999 = _995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1007 = _955;
    float _1009 = _963;
    float _1011 = _977;
    if (!_993)
    {
        float _1013 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[17].y, _955);
        _1007 = _1013;
    }
    float _1015 = _1007;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1021 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1023 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_993)
    {
        float _1025 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[17].y, _963);
        _1009 = _1025;
    }
    float _1027 = _1009;
    float _1029 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1033 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1035 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1037 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _1021;
    out.m_65.y = _999;
    out.m_65.z = _1023;
    out.m_65.w = _997;
    float _1039 = _989 + 0.5;
    if (!_993)
    {
        float _1041 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[17].y, _977);
        _1011 = _1041;
    }
    float _1043 = _1011;
    float _1045 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1047 = fma(_1027, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1029);
    float _1049 = _901 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1033;
    out.m_67.y = _1035;
    out.m_67.z = _1037;
    out.m_67.w = _1031;
    float _1051 = fma(_1027, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1045);
    float _1053 = _959 + 0.5;
    bool _1055 = _638 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1057 = isnan(_638);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1063 = _1059 || _1061;
    out.m_69.w = _987;
    float _1065 = _746 * 0.5;
    float _1067 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_71.x = _1039;
    out.m_71.y = _1053;
    float _1069 = fma(_1027, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1067);
    float _1071 = fma(_780, -0.5, _1065);
    float _1073 = fma(_1043, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1047);
    float _1075 = fma(_1043, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1051);
    float _1077 = _877 + _746;
    float _1079 = _774 + _746;
    float _1081 = fma(_1043, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1069);
    float _1083 = _1077 * 0.5;
    float _1085 = _1079 * 0.5;
    out.gl_Position.x = _774;
    out.gl_Position.y = _780;
    out.gl_Position.z = _877;
    out.gl_Position.w = _746;
    out.m_73.x = _1085;
    out.m_73.y = _1071;
    out.m_73.z = _1083;
    out.m_73.w = _746;
    out.m_75.x = _1073;
    out.m_75.y = _1075;
    out.m_75.z = _1081;
    if (!_1063)
    {
        _885 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1087 = _885;
    float _1089 = _1087;
    float _1091 = _1087;
    if (!_1063)
    {
        _859 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1093 = _859;
    float _1095 = _1049 * _802;
    float _1097 = -_1049;
    float _1099 = _1097 + 1.0;
    float _1101 = _817 * _1095;
    float _1103 = _827 * _1095;
    float _1105 = fma(_823, _1101, _811);
    float _1107 = fma(_825, _1101, _813);
    float _1109 = _817 * _1099;
    float _1111 = fma(_817, _1103, _815);
    float _1113 = _1101;
    float _1115 = _817;
    float _1117 = _815;
    float _1119 = _1095;
    float _1121 = _1093;
    float _1123 = _1093;
    if (!_1063)
    {
        _1113 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1125 = _1113;
    float _1127 = _1125;
    float _1129 = _1125;
    if (!_1063)
    {
        _1115 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1131 = _1115;
    out.m_77.x = _1105;
    out.m_77.y = _1107;
    out.m_77.z = _1111;
    out.m_77.w = _1109;
    float _1133 = _1131;
    float _1135 = _1131;
    if (!_1063)
    {
        _1117 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1137 = _1117;
    float _1139 = _1137;
    float _1141 = _1137;
    if (!_1063)
    {
        _1119 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1143 = _1119;
    bool _1145 = !_1063;
    float _1147 = _1143;
    float _1149 = _1143;
    if (!_1145)
    {
        bool _1151 = _638 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1153 = isnan(_638);
        bool _1155 = _1151 || _1153;
        bool _1157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1159 = _1155 || _1157;
        if (!_1159)
        {
            float _1161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1163 = _638 + _1161;
            float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1167 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1165;
            float _1169 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1171 = _1169 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1173 = 1.0 / _1167;
            float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1177 = _1175 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1179 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1181 = _1179 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1183 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1185 = _1183 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1187 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1189 = _1187 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1191 = _1163 * _1173;
            float _1193 = precise::clamp(_1191, 0.0, 1.0);
            float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1197 = _1195 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1199 = fma(_1193, _1171, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1201 = fma(_1193, _1197, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1203 = fma(_1193, _1177, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1205 = fma(_1193, _1181, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1207 = fma(_1193, _1185, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1209 = fma(_1193, _1189, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1129 = _1203;
            _1141 = _1207;
            _1091 = _1199;
            _1135 = _1205;
            _1123 = _1201;
            _1149 = _1209;
            _1211 = true;
        }
        else
        {
            bool _1213 = _638 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1215 = isnan(_638);
            bool _1217 = _1213 || _1215;
            bool _1219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1221 = _1217 || _1219;
            if (!_1221)
            {
                _1089 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1223 = _1089;
            _1091 = _1223;
            if (!_1221)
            {
                _1127 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1225 = _1127;
            _1129 = _1225;
            if (!_1221)
            {
                _1121 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1227 = _1121;
            _1123 = _1227;
            if (!_1221)
            {
                _1133 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1229 = _1133;
            _1135 = _1229;
            if (!_1221)
            {
                _1139 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1231 = _1139;
            _1141 = _1231;
            if (!_1221)
            {
                _1147 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1233 = _1147;
            bool _1235 = !_1221;
            _1149 = _1233;
            if (!_1235)
            {
                bool _1237 = _638 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1239 = isnan(_638);
                bool _1241 = _1237 || _1239;
                bool _1243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1245 = _1241 || _1243;
                if (!_1245)
                {
                    float _1247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1249 = _638 + _1247;
                    float _1251 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1253 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1251;
                    float _1255 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1257 = _1255 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1259 = 1.0 / _1253;
                    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1263 = _1261 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1267 = _1265 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1269 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1271 = _1269 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1273 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1275 = _1273 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1277 = _1249 * _1259;
                    float _1279 = precise::clamp(_1277, 0.0, 1.0);
                    float _1281 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1283 = _1281 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1285 = fma(_1279, _1257, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1287 = fma(_1279, _1283, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1289 = fma(_1279, _1263, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1291 = fma(_1279, _1267, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1293 = fma(_1279, _1271, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1295 = fma(_1279, _1275, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1129 = _1289;
                    _1141 = _1293;
                    _1091 = _1285;
                    _1135 = _1291;
                    _1123 = _1287;
                    _1149 = _1295;
                    _1211 = true;
                }
                else
                {
                    _1129 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1141 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1091 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1135 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1123 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1149 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1211 = false;
    float _1297 = _1129;
    float _1299 = _1141;
    float _1301 = _1091;
    float _1303 = _1135;
    float _1305 = _1123;
    float _1307 = _1149;
    float _1309 = fma(_1075, -0.5, 0.5);
    float _1311 = precise::clamp(_1309, 0.0, 1.0);
    float _1313 = -_1297;
    float _1315 = _1313 + _1299;
    float _1317 = -_1301;
    float _1319 = _1317 + _1303;
    float _1321 = -_1305;
    float _1323 = _1321 + _1307;
    bool _1325 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1327 = fma(_1311, _1315, _1297);
    float _1329 = fma(_1311, _1319, _1301);
    float _1331 = fma(_1311, _1323, _1305);
    float _1333 = _1327 * 0.586610972881317138671875;
    out.m_79.x = 0.0;
    float _1335 = fma(_1329, 0.298911988735198974609375, _1333);
    float _1337 = fma(_1331, 0.114477999508380889892578125, _1335);
    float _1339 = -_1337;
    float _1341 = _1329 + _1339;
    float _1343 = -_1337;
    float _1345 = _1327 + _1343;
    float _1347 = -_1337;
    float _1349 = _1331 + _1347;
    float _1351 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1353 = fma(_1341, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1337);
    float _1355 = fma(_1345, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1337);
    float _1357 = fma(_1349, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1337);
    out.m_47.x = _1351;
    out.m_81.x = _1353;
    out.m_81.y = _1355;
    out.m_81.z = _1357;
    if (!_1325)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1359 = -_488;
    float _1361 = _1359 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1363 = -_490;
    float _1365 = _1363 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1367 = -_492;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1371 = _1361 * _1361;
    float _1373 = fma(_1365, _1365, _1371);
    float _1375 = fma(_1369, _1369, _1373);
    float _1377 = sqrt(_1375);
    float _1379 = rsqrt(_1375);
    float _1381 = -_1377;
    float _1383 = _1381 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1385 = _1383 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1387 = precise::clamp(_1385, 0.0, 1.0);
    float _1389 = _1365 * _1379;
    float _1391 = _1361 * _1379;
    float _1393 = abs(_1387);
    float _1395 = log2(_1393);
    float _1397 = _1369 * _1379;
    float _1399 = _1389 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1401 = _1075 * _1391;
    float _1403 = -_1391;
    float _1405 = -_1399;
    float _1407 = fma(_1403, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1405);
    float _1409 = fma(_1073, _1389, _1401);
    float _1411 = -_1397;
    float _1413 = fma(_1411, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1407);
    float _1415 = fma(_1081, _1397, _1409);
    float _1417 = precise::clamp(_1415, 0.0, 1.0);
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1421 = _1413 + _1419;
    float _1423 = _1395 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1425 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1427 = precise::clamp(_1425, 0.0, 1.0);
    float _1429 = exp2(_1423);
    float _1431 = _1429 * _1427;
    float _1433 = _1417 * _1431;
    float _1435 = _1433 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1437 = _1433 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1439 = _1433 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_79.x = _1435;
    out.m_79.y = _1437;
    out.m_79.z = _1439;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

