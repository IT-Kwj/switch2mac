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
    float4 m_67 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_81 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_73 [[user(locn10)]];
    float4 m_65 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 m_83 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1487 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1773 = as_type<float>(_122);
        out.gl_Position.z = _1773;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_49.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_106);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1842 = as_type<float>(_158);
        out.gl_Position.z = _1842;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_51.w;
    float _162 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_49.x;
    float _176 = in.m_49.y;
    float _178 = in.m_49.z;
    float _180 = in.m_44.x;
    float _182 = in.m_44.y;
    float _184 = in.m_44.z;
    float _186 = 0.0;
    float _188 = _162;
    if (!_172)
    {
        float _190 = _162 * _162;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _194;
    if (!_172)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_172;
    float _204 = _200;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _162 * _208;
        float _218 = exp2(_216);
        float _220 = _214 * 0.693147182464599609375;
        float _222 = 1.0 / _220;
        float _224 = 1.0 / _212;
        float _226 = _218 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _222, _162);
        float _232 = _230 * _224;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_172;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _162 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _188 = _258;
    }
    float _260 = _188;
    float _262 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _266 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _268 = in.m_53.x;
    float _270 = in.m_53.y;
    float _272 = in.m_53.z;
    float _274 = fma(_260, _176, _262);
    float _276 = fma(_260, _174, _264);
    float _278 = fma(_260, _178, _266);
    float _280 = fma(_274, _160, _182);
    float _282 = fma(_276, _160, _180);
    float _284 = fma(_278, _160, _184);
    float _286 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _288 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _290 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _292 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].x, _286);
    float _294 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].x, _288);
    float _296 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].x, _290);
    float _298 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _292);
    float _300 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _294);
    float _302 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _296);
    float _304 = _298 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _306 = _300 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _308 = _302 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _310 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _312 = _304 + _310;
    float _314 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _316 = _306 + _314;
    float _318 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _320 = _308 + _318;
    float _322 = _312 * _312;
    float _324 = fma(_316, _316, _322);
    float _326 = fma(_320, _320, _324);
    float _328 = rsqrt(_326);
    float _330 = _312 * _328;
    float _332 = _316 * _328;
    float _334 = _320 * _328;
    float _336 = -_330;
    float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[18].w, _312);
    float _340 = -_332;
    float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[18].w, _316);
    float _344 = -_334;
    float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[18].w, _320);
    float _348 = _338 * _338;
    float _350 = in.m_51.x;
    float _352 = in.m_51.y;
    float _354 = in.m_51.z;
    float _356 = fma(_342, _342, _348);
    float _358 = fma(_346, _346, _356);
    float _360 = sqrt(_358);
    float _362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _268);
    float _364 = _352 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _366 = _350 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _368 = _328 * _360;
    float _370 = _354 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _372 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _374 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _270);
    float _376 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _378 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _380 = _372 * _368;
    float _382 = _376 * _368;
    float _384 = _378 * _368;
    float _386 = _380 * _374;
    float _388 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _272);
    float _390 = _382 * _362;
    float _392 = _386 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _394 = _384 * _388;
    float _396 = _386 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _398 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[10].x, _392);
    float _400 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[8].x, _396);
    float _402 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[10].z, _398);
    float _404 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[8].z, _400);
    float _406 = _308 + _402;
    float _408 = _306 + _404;
    float _410 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _412 = _406 + _410;
    float _414 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _416 = _408 + _414;
    float _418 = _412 * _412;
    float _420 = fma(_416, _416, _418);
    float _422 = _386 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _424 = sqrt(_420);
    float _426 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[9].x, _422);
    float _428 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[9].z, _426);
    float _430 = _304 + _428;
    bool _432 = _424 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _434 = _428;
    float _436 = _304;
    float _438 = _394;
    float _440 = _368;
    float _442 = _412;
    if (!_432)
    {
        _434 = _408;
    }
    float _444 = _434;
    float _446 = _444;
    if (!_432)
    {
        _436 = _406;
    }
    float _448 = _436;
    float _450 = _448;
    if (!_432)
    {
        _438 = _430;
    }
    float _452 = _438;
    bool _454 = !_432;
    float _456 = _452;
    if (!_454)
    {
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _460 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _462 = _424 + _460;
        float _464 = _430 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _466 = rsqrt(_420);
        float _468 = _462 * _458;
        float _470 = _468 * 0.15915493667125701904296875;
        float _472 = _470 * 6.283185482025146484375;
        float _474 = sin(_472);
        float _476 = _470 * 6.283185482025146484375;
        float _478 = cos(_476);
        float _480 = fma(_474, _464, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _482 = _466 * _480;
        float _484 = _478 + (-1.0);
        float _486 = fma(_416, _482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _488 = fma(_412, _482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _490 = _484 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _492 = fma(_430, _478, _490);
        _456 = _492;
        _446 = _486;
        _450 = _488;
        _440 = _470;
    }
    float _494 = _456;
    float _496 = _446;
    float _498 = _450;
    float _500 = _440;
    float _502 = -_330;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _494);
    float _506 = -_332;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _510 = -_334;
    float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _498);
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _516 = _504 + _514;
    float _518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _520 = _508 + _518;
    float _522 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _524 = _512 + _522;
    float _526 = _516 * _516;
    float _528 = fma(_520, _520, _526);
    float _530 = fma(_524, _524, _528);
    float _532 = rsqrt(_530);
    float _534 = sqrt(_530);
    float _536 = _532 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _538 = _520 * _536;
    float _540 = _524 * _536;
    float _542 = _538 * _538;
    float _544 = _540 * _540;
    float _546 = _542 + _544;
    float _548 = sqrt(_546);
    bool _550 = _548 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _552 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _554 = _548 + _552;
    float _556 = _500;
    float _558 = _546;
    float _560 = _554;
    float _562 = _538;
    float _564 = _524;
    float _566 = _516;
    float _568 = _520;
    if (_550)
    {
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _556 = _570;
    }
    float _572 = _556;
    if (_550)
    {
        float _574 = rsqrt(_546);
        _558 = _574;
    }
    float _576 = _558;
    float _578 = _576;
    if (_550)
    {
        float _580 = _554 * _572;
        _560 = _580;
    }
    float _582 = _560;
    if (_550)
    {
        float _584 = _582 * 0.15915493667125701904296875;
        _442 = _584;
    }
    float _586 = _442;
    float _588 = _572;
    float _590 = _586;
    if (_550)
    {
        float _592 = _586 * 6.283185482025146484375;
        float _594 = sin(_592);
        _588 = _594;
    }
    float _596 = _588;
    float _598 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _600 = precise::max(0.0, _598);
    float _602 = _408;
    float _604 = _600;
    if (_550)
    {
        float _606 = _586 * 6.283185482025146484375;
        float _608 = cos(_606);
        _602 = _608;
    }
    float _610 = _602;
    float _612 = -_536;
    float _614 = -_600;
    float _616 = fma(_516, _612, _614);
    if (_550)
    {
        float _618 = _616 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _604 = _618;
    }
    float _620 = _604;
    float _622 = _596;
    float _624 = _620;
    if (_550)
    {
        float _626 = fma(_596, _620, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _622 = _626;
    }
    float _628 = _622;
    float _630 = _628;
    float _632 = _610;
    if (_550)
    {
        float _634 = _610 + (-1.0);
        _624 = _634;
    }
    float _636 = _624;
    float _638 = 0.0;
    float _640 = _636;
    if (_550)
    {
        float _642 = _576 * _628;
        _638 = _642;
    }
    float _644 = _638;
    if (!_550)
    {
        _630 = _616;
    }
    float _646 = _630;
    float _648 = _646;
    if (_550)
    {
        float _650 = _636 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _650;
    }
    float _652 = _590;
    if (_550)
    {
        float _654 = _538 * _644;
        _562 = _654;
    }
    float _656 = _562;
    if (!_550)
    {
        _640 = _540;
    }
    float _658 = _640;
    float _660 = _658;
    if (_550)
    {
        float _662 = _540 * _644;
        _660 = _662;
    }
    float _664 = _660;
    if (!_550)
    {
        _578 = _542;
    }
    float _666 = _578;
    float _668 = _666;
    if (_550)
    {
        float _670 = fma(_616, _610, _652);
        _648 = _670;
    }
    float _672 = _648;
    if (_550)
    {
        float _674 = _656 * _656;
        _668 = _674;
    }
    float _676 = _668;
    if (!_550)
    {
        _632 = _544;
    }
    float _678 = _632;
    float _680 = _678;
    if (_550)
    {
        float _682 = _664 * _664;
        _680 = _682;
    }
    float _684 = _680;
    float _686 = _504 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _688 = fma(_672, _672, _676);
    float _690 = _504 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _692 = _688 + _684;
    float _694 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[2].x, _686);
    float _696 = _504 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _698 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _700 = fma(_534, (*spvDescriptorSet0.vp_c15)._m0[23].w, _698);
    float _702 = precise::clamp(_700, 0.0, 1.0);
    float _704 = rsqrt(_692);
    float _706 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[2].z, _694);
    float _708 = _504 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _710 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[1].x, _696);
    float _712 = -_702;
    float _714 = _712 + 1.0;
    float _716 = _706 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _718 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[0].x, _708);
    float _720 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[1].z, _710);
    float _722 = abs(_714);
    float _724 = log2(_722);
    float _726 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _728 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[0].z, _718);
    float _730 = _720 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _732 = _716 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _734 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[3].x, _690);
    float _736 = _728 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _738 = _704 * _656;
    float _740 = _730 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _742 = _704 * _672;
    float _744 = -_732;
    float _746 = fma(_744, _726, 1.0);
    float _748 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[3].z, _734);
    float _750 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[7].x, _740);
    float _752 = _738 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _754 = _704 * _664;
    float _756 = _724 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _758 = _748 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _760 = -_752;
    float _762 = fma(_742, (*spvDescriptorSet0.vp_c15)._m0[21].y, _760);
    float _764 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[7].z, _750);
    float _766 = exp2(_756);
    float _768 = _730 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _770 = -_754;
    float _772 = fma(_770, (*spvDescriptorSet0.vp_c15)._m0[21].z, _762);
    float _774 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _764);
    float _776 = _730 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _778 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[5].x, _768);
    float _780 = fma(_772, -0.5, 0.5);
    float _782 = fma(_772, 0.5, 0.5);
    float _784 = log2(_746);
    float _786 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[4].x, _776);
    float _788 = _742 + 1.0;
    float _790 = fma(_782, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _792 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[5].z, _778);
    float _794 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[4].z, _786);
    float _796 = fma(_782, _790, -0.212114393711090087890625);
    float _798 = 1.0 / _774;
    float _800 = -_742;
    float _802 = fma(_766, _788, _800);
    float _804 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _794);
    float _806 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _792);
    float _808 = fma(_782, _796, 1.570728778839111328125);
    float _810 = fma(_802, 0.5, 0.5);
    float _812 = sqrt(_780);
    float _814 = _784 * 0.693147182464599609375;
    float _816 = _804 * _798;
    float _818 = _806 * _798;
    float _820 = _814 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _822 = fma(_816, 0.5, 0.5);
    float _824 = fma(_818, -0.5, 0.5);
    float _826 = _812 * 0.636619746685028076171875;
    float3 _2941 = float3(_822, _824, _820);
    float _828 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2941, float3(0.0), isnan(_2941)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2941, float3(0.0), isnan(_2941)), level(0.0)).x;
    float3 _2952 = float3(_822, _824, _820);
    float4 _831 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2952, float3(0.0), isnan(_2952)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2952, float3(0.0), isnan(_2952)), level(0.0)).xyzw;
    float _833 = _831.x;
    float _835 = _831.y;
    float _837 = _831.z;
    float _839 = _831.w;
    float _841 = -_808;
    float _843 = fma(_826, _841, 1.0);
    float2 _2974 = float2(_843, _810);
    float3 _847 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2974, float2(0.0), isnan(_2974)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2974, float2(0.0), isnan(_2974)), level(0.0)).xyz;
    float _849 = _847.x;
    float _851 = _847.y;
    float _853 = _847.z;
    float _855 = in.m_55.w;
    float _857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _859 = in.m_57.z;
    float _861 = in.m_57.w;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _865 = _863 != 0;
    float _867 = _724 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _871 = _869 != 0;
    float _873 = in.m_55.y;
    float _875 = in.m_57.y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _881 = _879 != 0;
    float _883 = in.m_57.x;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _887 = _885 != 0;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _893 = _891 != 0;
    float _895 = in.m_55.z;
    float _897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _899 = -_855;
    float _901 = _899 + 1.0;
    out.m_59.w = _855;
    float _903 = _730 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _905 = _859 > 0.5;
    float _907 = in.m_55.x;
    bool _909 = _861 > 0.5;
    float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _915 = _855;
    bool _917 = _909;
    float _919 = _859;
    float _921 = _774;
    float _923 = _804;
    float _925 = _806;
    if (_865)
    {
        float _927 = _905 ? _901 : _855;
        _915 = _927;
    }
    float _929 = _915;
    float _931 = -_873;
    float _933 = _931 + 1.0;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _937 = _935 != 0;
    float _939 = _861;
    float _941 = _873;
    float _943 = _875;
    if (_871)
    {
        float _945 = in.m_57.z;
        _939 = _945;
    }
    float _947 = _939;
    bool _949 = _875 > 0.5;
    float _951 = _897 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _955 = _883 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _957 = _949 ? as_type<int>(_933) : as_type<int>(_873);
    float _959 = fma(_951, _929, -0.5);
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _963 = _961 != 0;
    float _965 = -_889;
    float _967 = fma(_955, 2.0, _965);
    float _969 = _875 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _971 = _937 ? as_type<float>(_957) : _873;
    float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _975 = _895;
    float _977 = _971;
    if (_881)
    {
        float _979 = _909 ? _933 : _873;
        _941 = _979;
    }
    float _981 = _941;
    float _983 = fma(_969, -2.0, _877);
    bool _985 = _875 > 0.5;
    bool _987 = _985 && _893;
    float _989 = in.m_61.x;
    float _991 = in.m_61.y;
    float _993 = in.m_61.z;
    bool _995 = _270 != 0.0;
    bool _997 = isnan(_270);
    bool _999 = _995 || _997;
    bool _1001 = isnan(0.0);
    bool _1003 = _999 || _1001;
    float _1005 = -_140;
    float _1007 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[76].x, _967);
    float _1009 = 0.0;
    if (_893)
    {
        _1009 = _895;
    }
    float _1011 = _1009;
    float _1013 = exp2(_867);
    bool _1015 = _268 == 0.0;
    bool _1017 = !_1003;
    bool _1019 = _1015 && _1017;
    float _1021 = in.m_63.y;
    float _1023 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[6].x, _903);
    bool _1025 = _272 == 0.0;
    bool _1027 = _1025 && _1019;
    out.m_65.x = _508;
    out.m_65.y = _504;
    out.m_65.z = _512;
    float _1029 = _1011;
    float _1031 = _947;
    bool _1033 = _1027;
    if (_871)
    {
        bool _1035 = _947 > 0.5;
        _917 = _1035;
    }
    bool _1037 = _917;
    if (_987)
    {
        float _1039 = -_1011;
        float _1041 = _1039 + 1.0;
        _1029 = _1041;
    }
    float _1043 = _1029;
    float _1045 = _973 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_887)
    {
        _1031 = _907;
    }
    float _1047 = _1031;
    float _1049 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1023);
    float _1051 = fma(_1045, _971, -0.5);
    float _1053 = _1047;
    if (_893)
    {
        _975 = _1043;
    }
    float _1055 = _975;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1061 = _1057;
    if (_963)
    {
        _977 = _883;
    }
    float _1063 = _977;
    float _1065 = -_1013;
    float _1067 = _1065 + 1.0;
    float _1069 = _1063;
    if (!_963)
    {
        _1069 = _859;
    }
    float _1071 = _1069;
    float _1073 = _989;
    float _1075 = _993;
    float _1077 = _991;
    if (!_1027)
    {
        float _1079 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[17].y, _989);
        _1073 = _1079;
    }
    float _1081 = _1073;
    float _1083 = 0.0;
    if (!_887)
    {
        _1083 = _1047;
    }
    float _1085 = _1083;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1089 = _1085;
    if (_887)
    {
        _1053 = _907;
    }
    float _1091 = _1053;
    float _1093 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1095 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _983);
    float _1097 = _1091;
    if (!_1027)
    {
        float _1099 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[17].y, _993);
        _1075 = _1099;
    }
    float _1101 = _1075;
    float _1103 = -_1087;
    float _1105 = fma(_1093, 2.0, _1103);
    float _1107 = _1087;
    if (!_963)
    {
        float _1109 = in.m_57.z;
        _1107 = _1109;
    }
    float _1111 = _1107;
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1115 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1057);
    if (!_963)
    {
        _1061 = _875;
    }
    float _1117 = _1061;
    float _1119 = _857 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1121 = _1117;
    int _1123 = as_type<int>(_1119);
    if (_963)
    {
        _1121 = _883;
    }
    float _1125 = _1121;
    float _1127 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1115);
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1131 = fma(_1119, _981, -0.5);
    if (!_1027)
    {
        float _1133 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[17].y, _991);
        _1077 = _1133;
    }
    float _1135 = _1077;
    float _1137 = -_1095;
    float _1139 = fma(_1127, _1051, _1137);
    if (_887)
    {
        float _1141 = -_1091;
        float _1143 = _1141 + 1.0;
        _1123 = as_type<int>(_1143);
    }
    int _1145 = _1123;
    float _1147 = as_type<float>(_1145);
    if (_887)
    {
        bool _1149 = _883 > 0.5;
        _1033 = _1149;
    }
    bool _1151 = _1033;
    float _1153 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1129);
    int _1155 = 0;
    if (_871)
    {
        float _1157 = -_1091;
        float _1159 = _1157 + 1.0;
        _1155 = as_type<int>(_1159);
    }
    int _1161 = _1155;
    float _1163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1167 = _911 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1169 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1171 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1113);
    if (_887)
    {
        float _1173 = _1151 ? as_type<float>(_1145) : _1091;
        _1089 = _1173;
    }
    float _1175 = _1089;
    float _1177 = fma(_1167, _1055, -0.5);
    float _1179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_871)
    {
        float _1181 = _1037 ? as_type<float>(_1161) : _1091;
        _1097 = _1181;
    }
    float _1183 = _1097;
    float _1185 = -_1165;
    float _1187 = fma(_1169, 2.0, _1185);
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1191 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1153);
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_963)
    {
        _919 = _875;
    }
    float _1195 = _919;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1199 = _1111;
    if (!_963)
    {
        _1147 = _1111;
    }
    float _1201 = _1147;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1205 = _1201;
    if (_963)
    {
        _1199 = _875;
    }
    float _1207 = _1199;
    float _1209 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1189);
    if (_963)
    {
        _1205 = _875;
    }
    float _1211 = _1205;
    float _1213 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1193);
    float _1215 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1203);
    if (!_963)
    {
        _943 = _883;
    }
    float _1217 = _943;
    float _1219 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1197);
    float _1221 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1223 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1225 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1227 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1209);
    float _1229 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1231 = _1179 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1233 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1235 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1237 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1221);
    float _1239 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1223);
    float _1241 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1225);
    float _1243 = _1227 * (-0.15915493667125701904296875);
    float _1245 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1213);
    float _1247 = fma(_1229, _1175, -0.5);
    float _1249 = fma(_1231, _1183, -0.5);
    float _1251 = fma(_1235, -2.0, _953);
    float _1253 = fma(_1101, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1237);
    float _1255 = fma(_1101, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1239);
    float _1257 = fma(_1101, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1241);
    float _1259 = _1243 * 6.283185482025146484375;
    float _1261 = sin(_1259);
    float _1263 = fma(_1245, _1247, _1007);
    float _1265 = -_140;
    float _1267 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1187);
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1271 = _1243 * 6.283185482025146484375;
    float _1273 = cos(_1271);
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1281 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1291 = fma(_1191, _1249, _1267);
    float _1293 = in.m_63.x;
    float _1295 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1297 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1219);
    float _1299 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1251);
    float _1301 = in.m_63.w;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1305 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1281;
    out.m_67.y = _1283;
    out.m_67.z = _1285;
    out.m_67.w = _1279;
    float _1309 = fma(_1295, -2.0, _1059);
    float _1311 = _1067 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1313 = -_140;
    float _1315 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1105);
    out.m_69.x = _1233;
    out.m_69.y = _1305;
    out.m_69.z = _1307;
    out.m_69.w = _1303;
    float _1317 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1309);
    float _1319 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1049);
    bool _1321 = _534 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1323 = isnan(_534);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1329 = _1325 || _1327;
    out.m_71.y = _1021;
    out.m_73.x = _1253;
    out.m_73.y = _1255;
    out.m_73.z = _1257;
    float _1331 = _1261 * _959;
    float _1333 = -_1299;
    float _1335 = fma(_1297, _1131, _1333);
    float _1337 = _1273 * _959;
    float _1339 = _1263 + 0.5;
    float _1341 = -_1331;
    float _1343 = fma(_1273, _1177, _1341);
    float _1345 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1215);
    float _1347 = _1139 + 0.5;
    float _1349 = _1291 + 0.5;
    float _1351 = _1335 + 0.5;
    float _1353 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1171);
    float _1355 = fma(_1261, _1177, _1337);
    float _1357 = fma(_1345, _1343, _1315);
    float _1359 = _1319 + _774;
    out.m_75.x = _1339;
    out.m_75.y = _1347;
    out.m_75.z = _1349;
    out.m_75.w = _1351;
    float _1361 = -_1317;
    float _1363 = fma(_1353, _1355, _1361);
    float _1365 = _1357 + 0.5;
    float _1367 = _1359 * 0.5;
    out.m_71.x = _1293;
    float _1369 = _1363 + 0.5;
    out.m_71.w = _1301;
    out.m_77.x = _1365;
    out.m_77.y = _1369;
    float _1371 = -_1311;
    float _1373 = _1371 + 1.0;
    out.m_79.z = _1367;
    out.m_79.w = _774;
    out.m_81.x = _520;
    out.m_81.y = _516;
    out.m_81.z = _524;
    out.gl_Position.x = _804;
    out.gl_Position.y = _806;
    out.gl_Position.z = _1319;
    out.gl_Position.w = _774;
    if (!_1329)
    {
        _564 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1375 = _564;
    float _1377 = _1375;
    float _1379 = _1375;
    if (!_1329)
    {
        _566 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1381 = _566;
    float _1383 = _1381;
    float _1385 = _1381;
    if (!_1329)
    {
        _568 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1387 = _568;
    float _1389 = _1387;
    float _1391 = _1387;
    if (!_1329)
    {
        _921 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1393 = _921;
    float _1395 = _1393;
    float _1397 = _1393;
    if (!_1329)
    {
        _923 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1399 = _923;
    float _1401 = _1399;
    float _1403 = _1399;
    if (!_1329)
    {
        _925 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1405 = _925;
    float _1407 = _1311 * _828;
    float _1409 = _839 * _1373;
    float _1411 = _839 * _1407;
    float _1413 = _853 * _1407;
    float _1415 = fma(_849, _1411, _833);
    float _1417 = fma(_851, _1411, _835);
    float _1419 = fma(_839, _1413, _837);
    out.m_83.x = _1415;
    out.m_83.y = _1417;
    out.m_83.z = _1419;
    out.m_83.w = _1409;
    bool _1421 = !_1329;
    float _1423 = _1405;
    float _1425 = _1405;
    if (!_1421)
    {
        bool _1427 = _534 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1429 = isnan(_534);
        bool _1431 = _1427 || _1429;
        bool _1433 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1435 = _1431 || _1433;
        if (!_1435)
        {
            float _1437 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1439 = _534 + _1437;
            float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1443 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1441;
            float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1447 = _1445 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1449 = 1.0 / _1443;
            float _1451 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1453 = _1451 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1455 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1457 = _1455 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1461 = _1459 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1465 = _1463 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1467 = _1439 * _1449;
            float _1469 = precise::clamp(_1467, 0.0, 1.0);
            float _1471 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1473 = _1471 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1475 = fma(_1469, _1447, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1477 = fma(_1469, _1473, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1479 = fma(_1469, _1453, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1481 = fma(_1469, _1457, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1483 = fma(_1469, _1461, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1485 = fma(_1469, _1465, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1403 = _1479;
            _1385 = _1483;
            _1397 = _1475;
            _1379 = _1481;
            _1425 = _1477;
            _1391 = _1485;
            _1487 = true;
        }
        else
        {
            bool _1489 = _534 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1491 = isnan(_534);
            bool _1493 = _1489 || _1491;
            bool _1495 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1497 = _1493 || _1495;
            if (!_1497)
            {
                _1395 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1499 = _1395;
            _1397 = _1499;
            if (!_1497)
            {
                _1401 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1501 = _1401;
            _1403 = _1501;
            if (!_1497)
            {
                _1423 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1503 = _1423;
            _1425 = _1503;
            if (!_1497)
            {
                _1377 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1505 = _1377;
            _1379 = _1505;
            if (!_1497)
            {
                _1383 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1507 = _1383;
            _1385 = _1507;
            if (!_1497)
            {
                _1389 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1509 = _1389;
            bool _1511 = !_1497;
            _1391 = _1509;
            if (!_1511)
            {
                bool _1513 = _534 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1515 = isnan(_534);
                bool _1517 = _1513 || _1515;
                bool _1519 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1521 = _1517 || _1519;
                if (!_1521)
                {
                    float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1525 = _534 + _1523;
                    float _1527 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1529 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1527;
                    float _1531 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1533 = _1531 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1535 = 1.0 / _1529;
                    float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1539 = _1537 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1543 = _1541 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1545 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1547 = _1545 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1551 = _1549 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1553 = _1525 * _1535;
                    float _1555 = precise::clamp(_1553, 0.0, 1.0);
                    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1559 = _1557 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1561 = fma(_1555, _1533, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1563 = fma(_1555, _1559, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1565 = fma(_1555, _1539, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1567 = fma(_1555, _1543, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1569 = fma(_1555, _1547, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1571 = fma(_1555, _1551, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1403 = _1565;
                    _1385 = _1569;
                    _1397 = _1561;
                    _1379 = _1567;
                    _1425 = _1563;
                    _1391 = _1571;
                    _1487 = true;
                }
                else
                {
                    _1403 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1385 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1397 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1379 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1425 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1391 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1487 = false;
    float _1573 = _1403;
    float _1575 = _1385;
    float _1577 = _1397;
    float _1579 = _1379;
    float _1581 = _1425;
    float _1583 = _1391;
    float _1585 = fma(_1255, -0.5, 0.5);
    float _1587 = precise::clamp(_1585, 0.0, 1.0);
    float _1589 = -_1573;
    float _1591 = _1589 + _1575;
    float _1593 = -_1577;
    float _1595 = _1593 + _1579;
    float _1597 = -_1581;
    float _1599 = _1597 + _1583;
    bool _1601 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1603 = fma(_1587, _1591, _1573);
    float _1605 = fma(_1587, _1595, _1577);
    float _1607 = fma(_1587, _1599, _1581);
    float _1609 = _1603 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _1611 = fma(_1605, 0.298911988735198974609375, _1609);
    float _1613 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1615 = fma(_1607, 0.114477999508380889892578125, _1611);
    out.m_47.x = _1613;
    float _1617 = -_1615;
    float _1619 = _1605 + _1617;
    float _1621 = -_1615;
    float _1623 = _1603 + _1621;
    float _1625 = -_1615;
    float _1627 = _1607 + _1625;
    float _1629 = fma(_1619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1615);
    float _1631 = fma(_1623, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1615);
    float _1633 = fma(_1627, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1615);
    out.m_87.x = _1629;
    out.m_87.y = _1631;
    out.m_87.z = _1633;
    if (!_1601)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1635 = -_504;
    float _1637 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1639 = -_508;
    float _1641 = _1639 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1643 = -_512;
    float _1645 = _1643 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1647 = _1637 * _1637;
    float _1649 = fma(_1641, _1641, _1647);
    float _1651 = fma(_1645, _1645, _1649);
    float _1653 = sqrt(_1651);
    float _1655 = rsqrt(_1651);
    float _1657 = -_1653;
    float _1659 = _1657 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1661 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1663 = precise::clamp(_1661, 0.0, 1.0);
    float _1665 = _1641 * _1655;
    float _1667 = _1637 * _1655;
    float _1669 = abs(_1663);
    float _1671 = log2(_1669);
    float _1673 = _1645 * _1655;
    float _1675 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1677 = _1255 * _1667;
    float _1679 = -_1667;
    float _1681 = -_1675;
    float _1683 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1681);
    float _1685 = fma(_1253, _1665, _1677);
    float _1687 = -_1673;
    float _1689 = fma(_1687, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1683);
    float _1691 = fma(_1257, _1673, _1685);
    float _1693 = precise::clamp(_1691, 0.0, 1.0);
    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1697 = _1689 + _1695;
    float _1699 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1701 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1703 = precise::clamp(_1701, 0.0, 1.0);
    float _1705 = exp2(_1699);
    float _1707 = _1705 * _1703;
    float _1709 = _1693 * _1707;
    float _1711 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1713 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1715 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1711;
    out.m_85.y = _1713;
    out.m_85.z = _1715;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1487 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1773 = as_type<float>(_122);
        out.gl_Position.z = _1773;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_49.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_106);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1842 = as_type<float>(_158);
        out.gl_Position.z = _1842;
    }
    if (_150)
    {
        return out;
    }
    float _160 = in.m_51.w;
    float _162 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_49.x;
    float _176 = in.m_49.y;
    float _178 = in.m_49.z;
    float _180 = in.m_44.x;
    float _182 = in.m_44.y;
    float _184 = in.m_44.z;
    float _186 = 0.0;
    float _188 = _162;
    if (!_172)
    {
        float _190 = _162 * _162;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _194;
    if (!_172)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_172;
    float _204 = _200;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _162 * _208;
        float _218 = exp2(_216);
        float _220 = _214 * 0.693147182464599609375;
        float _222 = 1.0 / _220;
        float _224 = 1.0 / _212;
        float _226 = _218 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _222, _162);
        float _232 = _230 * _224;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_172;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _162 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _188 = _258;
    }
    float _260 = _188;
    float _262 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _266 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _268 = in.m_53.x;
    float _270 = in.m_53.y;
    float _272 = in.m_53.z;
    float _274 = fma(_260, _176, _262);
    float _276 = fma(_260, _174, _264);
    float _278 = fma(_260, _178, _266);
    float _280 = fma(_274, _160, _182);
    float _282 = fma(_276, _160, _180);
    float _284 = fma(_278, _160, _184);
    float _286 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _288 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _290 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _292 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].x, _286);
    float _294 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].x, _288);
    float _296 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].x, _290);
    float _298 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _292);
    float _300 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _294);
    float _302 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _296);
    float _304 = _298 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _306 = _300 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _308 = _302 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _310 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _312 = _304 + _310;
    float _314 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _316 = _306 + _314;
    float _318 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _320 = _308 + _318;
    float _322 = _312 * _312;
    float _324 = fma(_316, _316, _322);
    float _326 = fma(_320, _320, _324);
    float _328 = rsqrt(_326);
    float _330 = _312 * _328;
    float _332 = _316 * _328;
    float _334 = _320 * _328;
    float _336 = -_330;
    float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[18].w, _312);
    float _340 = -_332;
    float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[18].w, _316);
    float _344 = -_334;
    float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[18].w, _320);
    float _348 = _338 * _338;
    float _350 = in.m_51.x;
    float _352 = in.m_51.y;
    float _354 = in.m_51.z;
    float _356 = fma(_342, _342, _348);
    float _358 = fma(_346, _346, _356);
    float _360 = sqrt(_358);
    float _362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _268);
    float _364 = _352 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _366 = _350 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _368 = _328 * _360;
    float _370 = _354 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _372 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _374 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _270);
    float _376 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _378 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _380 = _372 * _368;
    float _382 = _376 * _368;
    float _384 = _378 * _368;
    float _386 = _380 * _374;
    float _388 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _272);
    float _390 = _382 * _362;
    float _392 = _386 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _394 = _384 * _388;
    float _396 = _386 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _398 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[10].x, _392);
    float _400 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[8].x, _396);
    float _402 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[10].z, _398);
    float _404 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[8].z, _400);
    float _406 = _308 + _402;
    float _408 = _306 + _404;
    float _410 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _412 = _406 + _410;
    float _414 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _416 = _408 + _414;
    float _418 = _412 * _412;
    float _420 = fma(_416, _416, _418);
    float _422 = _386 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _424 = sqrt(_420);
    float _426 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[9].x, _422);
    float _428 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[9].z, _426);
    float _430 = _304 + _428;
    bool _432 = _424 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _434 = _428;
    float _436 = _304;
    float _438 = _394;
    float _440 = _368;
    float _442 = _412;
    if (!_432)
    {
        _434 = _408;
    }
    float _444 = _434;
    float _446 = _444;
    if (!_432)
    {
        _436 = _406;
    }
    float _448 = _436;
    float _450 = _448;
    if (!_432)
    {
        _438 = _430;
    }
    float _452 = _438;
    bool _454 = !_432;
    float _456 = _452;
    if (!_454)
    {
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _460 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _462 = _424 + _460;
        float _464 = _430 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _466 = rsqrt(_420);
        float _468 = _462 * _458;
        float _470 = _468 * 0.15915493667125701904296875;
        float _472 = _470 * 6.283185482025146484375;
        float _474 = sin(_472);
        float _476 = _470 * 6.283185482025146484375;
        float _478 = cos(_476);
        float _480 = fma(_474, _464, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _482 = _466 * _480;
        float _484 = _478 + (-1.0);
        float _486 = fma(_416, _482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _488 = fma(_412, _482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _490 = _484 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _492 = fma(_430, _478, _490);
        _456 = _492;
        _446 = _486;
        _450 = _488;
        _440 = _470;
    }
    float _494 = _456;
    float _496 = _446;
    float _498 = _450;
    float _500 = _440;
    float _502 = -_330;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _494);
    float _506 = -_332;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _510 = -_334;
    float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _498);
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _516 = _504 + _514;
    float _518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _520 = _508 + _518;
    float _522 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _524 = _512 + _522;
    float _526 = _516 * _516;
    float _528 = fma(_520, _520, _526);
    float _530 = fma(_524, _524, _528);
    float _532 = rsqrt(_530);
    float _534 = sqrt(_530);
    float _536 = _532 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _538 = _520 * _536;
    float _540 = _524 * _536;
    float _542 = _538 * _538;
    float _544 = _540 * _540;
    float _546 = _542 + _544;
    float _548 = sqrt(_546);
    bool _550 = _548 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _552 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _554 = _548 + _552;
    float _556 = _500;
    float _558 = _546;
    float _560 = _554;
    float _562 = _538;
    float _564 = _524;
    float _566 = _516;
    float _568 = _520;
    if (_550)
    {
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _556 = _570;
    }
    float _572 = _556;
    if (_550)
    {
        float _574 = rsqrt(_546);
        _558 = _574;
    }
    float _576 = _558;
    float _578 = _576;
    if (_550)
    {
        float _580 = _554 * _572;
        _560 = _580;
    }
    float _582 = _560;
    if (_550)
    {
        float _584 = _582 * 0.15915493667125701904296875;
        _442 = _584;
    }
    float _586 = _442;
    float _588 = _572;
    float _590 = _586;
    if (_550)
    {
        float _592 = _586 * 6.283185482025146484375;
        float _594 = sin(_592);
        _588 = _594;
    }
    float _596 = _588;
    float _598 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _600 = precise::max(0.0, _598);
    float _602 = _408;
    float _604 = _600;
    if (_550)
    {
        float _606 = _586 * 6.283185482025146484375;
        float _608 = cos(_606);
        _602 = _608;
    }
    float _610 = _602;
    float _612 = -_536;
    float _614 = -_600;
    float _616 = fma(_516, _612, _614);
    if (_550)
    {
        float _618 = _616 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _604 = _618;
    }
    float _620 = _604;
    float _622 = _596;
    float _624 = _620;
    if (_550)
    {
        float _626 = fma(_596, _620, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _622 = _626;
    }
    float _628 = _622;
    float _630 = _628;
    float _632 = _610;
    if (_550)
    {
        float _634 = _610 + (-1.0);
        _624 = _634;
    }
    float _636 = _624;
    float _638 = 0.0;
    float _640 = _636;
    if (_550)
    {
        float _642 = _576 * _628;
        _638 = _642;
    }
    float _644 = _638;
    if (!_550)
    {
        _630 = _616;
    }
    float _646 = _630;
    float _648 = _646;
    if (_550)
    {
        float _650 = _636 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _650;
    }
    float _652 = _590;
    if (_550)
    {
        float _654 = _538 * _644;
        _562 = _654;
    }
    float _656 = _562;
    if (!_550)
    {
        _640 = _540;
    }
    float _658 = _640;
    float _660 = _658;
    if (_550)
    {
        float _662 = _540 * _644;
        _660 = _662;
    }
    float _664 = _660;
    if (!_550)
    {
        _578 = _542;
    }
    float _666 = _578;
    float _668 = _666;
    if (_550)
    {
        float _670 = fma(_616, _610, _652);
        _648 = _670;
    }
    float _672 = _648;
    if (_550)
    {
        float _674 = _656 * _656;
        _668 = _674;
    }
    float _676 = _668;
    if (!_550)
    {
        _632 = _544;
    }
    float _678 = _632;
    float _680 = _678;
    if (_550)
    {
        float _682 = _664 * _664;
        _680 = _682;
    }
    float _684 = _680;
    float _686 = _504 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _688 = fma(_672, _672, _676);
    float _690 = _504 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _692 = _688 + _684;
    float _694 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[2].x, _686);
    float _696 = _504 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _698 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _700 = fma(_534, (*spvDescriptorSet0.vp_c15)._m0[23].w, _698);
    float _702 = precise::clamp(_700, 0.0, 1.0);
    float _704 = rsqrt(_692);
    float _706 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[2].z, _694);
    float _708 = _504 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _710 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[1].x, _696);
    float _712 = -_702;
    float _714 = _712 + 1.0;
    float _716 = _706 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _718 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[0].x, _708);
    float _720 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[1].z, _710);
    float _722 = abs(_714);
    float _724 = log2(_722);
    float _726 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _728 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[0].z, _718);
    float _730 = _720 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _732 = _716 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _734 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[3].x, _690);
    float _736 = _728 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _738 = _704 * _656;
    float _740 = _730 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _742 = _704 * _672;
    float _744 = -_732;
    float _746 = fma(_744, _726, 1.0);
    float _748 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[3].z, _734);
    float _750 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[7].x, _740);
    float _752 = _738 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _754 = _704 * _664;
    float _756 = _724 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _758 = _748 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _760 = -_752;
    float _762 = fma(_742, (*spvDescriptorSet0.vp_c15)._m0[21].y, _760);
    float _764 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[7].z, _750);
    float _766 = exp2(_756);
    float _768 = _730 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _770 = -_754;
    float _772 = fma(_770, (*spvDescriptorSet0.vp_c15)._m0[21].z, _762);
    float _774 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _764);
    float _776 = _730 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _778 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[5].x, _768);
    float _780 = fma(_772, -0.5, 0.5);
    float _782 = fma(_772, 0.5, 0.5);
    float _784 = log2(_746);
    float _786 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[4].x, _776);
    float _788 = _742 + 1.0;
    float _790 = fma(_782, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _792 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[5].z, _778);
    float _794 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[4].z, _786);
    float _796 = fma(_782, _790, -0.212114393711090087890625);
    float _798 = 1.0 / _774;
    float _800 = -_742;
    float _802 = fma(_766, _788, _800);
    float _804 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _794);
    float _806 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _792);
    float _808 = fma(_782, _796, 1.570728778839111328125);
    float _810 = fma(_802, 0.5, 0.5);
    float _812 = sqrt(_780);
    float _814 = _784 * 0.693147182464599609375;
    float _816 = _804 * _798;
    float _818 = _806 * _798;
    float _820 = _814 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _822 = fma(_816, 0.5, 0.5);
    float _824 = fma(_818, -0.5, 0.5);
    float _826 = _812 * 0.636619746685028076171875;
    float3 _2941 = float3(_822, _824, _820);
    float _828 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2941, float3(0.0), isnan(_2941)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2941, float3(0.0), isnan(_2941)), level(0.0)).x;
    float3 _2952 = float3(_822, _824, _820);
    float4 _831 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2952, float3(0.0), isnan(_2952)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2952, float3(0.0), isnan(_2952)), level(0.0)).xyzw;
    float _833 = _831.x;
    float _835 = _831.y;
    float _837 = _831.z;
    float _839 = _831.w;
    float _841 = -_808;
    float _843 = fma(_826, _841, 1.0);
    float2 _2974 = float2(_843, _810);
    float3 _847 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2974, float2(0.0), isnan(_2974)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2974, float2(0.0), isnan(_2974)), level(0.0)).xyz;
    float _849 = _847.x;
    float _851 = _847.y;
    float _853 = _847.z;
    float _855 = in.m_55.w;
    float _857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _859 = in.m_57.z;
    float _861 = in.m_57.w;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _865 = _863 != 0;
    float _867 = _724 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _871 = _869 != 0;
    float _873 = in.m_55.y;
    float _875 = in.m_57.y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _881 = _879 != 0;
    float _883 = in.m_57.x;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _887 = _885 != 0;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _893 = _891 != 0;
    float _895 = in.m_55.z;
    float _897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _899 = -_855;
    float _901 = _899 + 1.0;
    out.m_59.w = _855;
    float _903 = _730 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _905 = _859 > 0.5;
    float _907 = in.m_55.x;
    bool _909 = _861 > 0.5;
    float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _915 = _855;
    bool _917 = _909;
    float _919 = _859;
    float _921 = _774;
    float _923 = _804;
    float _925 = _806;
    if (_865)
    {
        float _927 = _905 ? _901 : _855;
        _915 = _927;
    }
    float _929 = _915;
    float _931 = -_873;
    float _933 = _931 + 1.0;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _937 = _935 != 0;
    float _939 = _861;
    float _941 = _873;
    float _943 = _875;
    if (_871)
    {
        float _945 = in.m_57.z;
        _939 = _945;
    }
    float _947 = _939;
    bool _949 = _875 > 0.5;
    float _951 = _897 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _955 = _883 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _957 = _949 ? as_type<int>(_933) : as_type<int>(_873);
    float _959 = fma(_951, _929, -0.5);
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _963 = _961 != 0;
    float _965 = -_889;
    float _967 = fma(_955, 2.0, _965);
    float _969 = _875 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _971 = _937 ? as_type<float>(_957) : _873;
    float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _975 = _895;
    float _977 = _971;
    if (_881)
    {
        float _979 = _909 ? _933 : _873;
        _941 = _979;
    }
    float _981 = _941;
    float _983 = fma(_969, -2.0, _877);
    bool _985 = _875 > 0.5;
    bool _987 = _985 && _893;
    float _989 = in.m_61.x;
    float _991 = in.m_61.y;
    float _993 = in.m_61.z;
    bool _995 = _270 != 0.0;
    bool _997 = isnan(_270);
    bool _999 = _995 || _997;
    bool _1001 = isnan(0.0);
    bool _1003 = _999 || _1001;
    float _1005 = -_140;
    float _1007 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[76].x, _967);
    float _1009 = 0.0;
    if (_893)
    {
        _1009 = _895;
    }
    float _1011 = _1009;
    float _1013 = exp2(_867);
    bool _1015 = _268 == 0.0;
    bool _1017 = !_1003;
    bool _1019 = _1015 && _1017;
    float _1021 = in.m_63.y;
    float _1023 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[6].x, _903);
    bool _1025 = _272 == 0.0;
    bool _1027 = _1025 && _1019;
    out.m_65.x = _508;
    out.m_65.y = _504;
    out.m_65.z = _512;
    float _1029 = _1011;
    float _1031 = _947;
    bool _1033 = _1027;
    if (_871)
    {
        bool _1035 = _947 > 0.5;
        _917 = _1035;
    }
    bool _1037 = _917;
    if (_987)
    {
        float _1039 = -_1011;
        float _1041 = _1039 + 1.0;
        _1029 = _1041;
    }
    float _1043 = _1029;
    float _1045 = _973 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_887)
    {
        _1031 = _907;
    }
    float _1047 = _1031;
    float _1049 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1023);
    float _1051 = fma(_1045, _971, -0.5);
    float _1053 = _1047;
    if (_893)
    {
        _975 = _1043;
    }
    float _1055 = _975;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1061 = _1057;
    if (_963)
    {
        _977 = _883;
    }
    float _1063 = _977;
    float _1065 = -_1013;
    float _1067 = _1065 + 1.0;
    float _1069 = _1063;
    if (!_963)
    {
        _1069 = _859;
    }
    float _1071 = _1069;
    float _1073 = _989;
    float _1075 = _993;
    float _1077 = _991;
    if (!_1027)
    {
        float _1079 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[17].y, _989);
        _1073 = _1079;
    }
    float _1081 = _1073;
    float _1083 = 0.0;
    if (!_887)
    {
        _1083 = _1047;
    }
    float _1085 = _1083;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1089 = _1085;
    if (_887)
    {
        _1053 = _907;
    }
    float _1091 = _1053;
    float _1093 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1095 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _983);
    float _1097 = _1091;
    if (!_1027)
    {
        float _1099 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[17].y, _993);
        _1075 = _1099;
    }
    float _1101 = _1075;
    float _1103 = -_1087;
    float _1105 = fma(_1093, 2.0, _1103);
    float _1107 = _1087;
    if (!_963)
    {
        float _1109 = in.m_57.z;
        _1107 = _1109;
    }
    float _1111 = _1107;
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1115 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1057);
    if (!_963)
    {
        _1061 = _875;
    }
    float _1117 = _1061;
    float _1119 = _857 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1121 = _1117;
    int _1123 = as_type<int>(_1119);
    if (_963)
    {
        _1121 = _883;
    }
    float _1125 = _1121;
    float _1127 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1115);
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1131 = fma(_1119, _981, -0.5);
    if (!_1027)
    {
        float _1133 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[17].y, _991);
        _1077 = _1133;
    }
    float _1135 = _1077;
    float _1137 = -_1095;
    float _1139 = fma(_1127, _1051, _1137);
    if (_887)
    {
        float _1141 = -_1091;
        float _1143 = _1141 + 1.0;
        _1123 = as_type<int>(_1143);
    }
    int _1145 = _1123;
    float _1147 = as_type<float>(_1145);
    if (_887)
    {
        bool _1149 = _883 > 0.5;
        _1033 = _1149;
    }
    bool _1151 = _1033;
    float _1153 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1129);
    int _1155 = 0;
    if (_871)
    {
        float _1157 = -_1091;
        float _1159 = _1157 + 1.0;
        _1155 = as_type<int>(_1159);
    }
    int _1161 = _1155;
    float _1163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1167 = _911 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1169 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1171 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1113);
    if (_887)
    {
        float _1173 = _1151 ? as_type<float>(_1145) : _1091;
        _1089 = _1173;
    }
    float _1175 = _1089;
    float _1177 = fma(_1167, _1055, -0.5);
    float _1179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_871)
    {
        float _1181 = _1037 ? as_type<float>(_1161) : _1091;
        _1097 = _1181;
    }
    float _1183 = _1097;
    float _1185 = -_1165;
    float _1187 = fma(_1169, 2.0, _1185);
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1191 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1153);
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_963)
    {
        _919 = _875;
    }
    float _1195 = _919;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1199 = _1111;
    if (!_963)
    {
        _1147 = _1111;
    }
    float _1201 = _1147;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1205 = _1201;
    if (_963)
    {
        _1199 = _875;
    }
    float _1207 = _1199;
    float _1209 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1189);
    if (_963)
    {
        _1205 = _875;
    }
    float _1211 = _1205;
    float _1213 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1193);
    float _1215 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1203);
    if (!_963)
    {
        _943 = _883;
    }
    float _1217 = _943;
    float _1219 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1197);
    float _1221 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1223 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1225 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1227 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1209);
    float _1229 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1231 = _1179 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1233 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1235 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1237 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1221);
    float _1239 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1223);
    float _1241 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1225);
    float _1243 = _1227 * (-0.15915493667125701904296875);
    float _1245 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1213);
    float _1247 = fma(_1229, _1175, -0.5);
    float _1249 = fma(_1231, _1183, -0.5);
    float _1251 = fma(_1235, -2.0, _953);
    float _1253 = fma(_1101, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1237);
    float _1255 = fma(_1101, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1239);
    float _1257 = fma(_1101, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1241);
    float _1259 = _1243 * 6.283185482025146484375;
    float _1261 = sin(_1259);
    float _1263 = fma(_1245, _1247, _1007);
    float _1265 = -_140;
    float _1267 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1187);
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1271 = _1243 * 6.283185482025146484375;
    float _1273 = cos(_1271);
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1281 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1291 = fma(_1191, _1249, _1267);
    float _1293 = in.m_63.x;
    float _1295 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1297 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1219);
    float _1299 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1251);
    float _1301 = in.m_63.w;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1305 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1281;
    out.m_67.y = _1283;
    out.m_67.z = _1285;
    out.m_67.w = _1279;
    float _1309 = fma(_1295, -2.0, _1059);
    float _1311 = _1067 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1313 = -_140;
    float _1315 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1105);
    out.m_69.x = _1233;
    out.m_69.y = _1305;
    out.m_69.z = _1307;
    out.m_69.w = _1303;
    float _1317 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1309);
    float _1319 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1049);
    bool _1321 = _534 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1323 = isnan(_534);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1329 = _1325 || _1327;
    out.m_71.y = _1021;
    out.m_73.x = _1253;
    out.m_73.y = _1255;
    out.m_73.z = _1257;
    float _1331 = _1261 * _959;
    float _1333 = -_1299;
    float _1335 = fma(_1297, _1131, _1333);
    float _1337 = _1273 * _959;
    float _1339 = _1263 + 0.5;
    float _1341 = -_1331;
    float _1343 = fma(_1273, _1177, _1341);
    float _1345 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1215);
    float _1347 = _1139 + 0.5;
    float _1349 = _1291 + 0.5;
    float _1351 = _1335 + 0.5;
    float _1353 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1171);
    float _1355 = fma(_1261, _1177, _1337);
    float _1357 = fma(_1345, _1343, _1315);
    float _1359 = _1319 + _774;
    out.m_75.x = _1339;
    out.m_75.y = _1347;
    out.m_75.z = _1349;
    out.m_75.w = _1351;
    float _1361 = -_1317;
    float _1363 = fma(_1353, _1355, _1361);
    float _1365 = _1357 + 0.5;
    float _1367 = _1359 * 0.5;
    out.m_71.x = _1293;
    float _1369 = _1363 + 0.5;
    out.m_71.w = _1301;
    out.m_77.x = _1365;
    out.m_77.y = _1369;
    float _1371 = -_1311;
    float _1373 = _1371 + 1.0;
    out.m_79.z = _1367;
    out.m_79.w = _774;
    out.m_81.x = _520;
    out.m_81.y = _516;
    out.m_81.z = _524;
    out.gl_Position.x = _804;
    out.gl_Position.y = _806;
    out.gl_Position.z = _1319;
    out.gl_Position.w = _774;
    if (!_1329)
    {
        _564 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1375 = _564;
    float _1377 = _1375;
    float _1379 = _1375;
    if (!_1329)
    {
        _566 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1381 = _566;
    float _1383 = _1381;
    float _1385 = _1381;
    if (!_1329)
    {
        _568 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1387 = _568;
    float _1389 = _1387;
    float _1391 = _1387;
    if (!_1329)
    {
        _921 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1393 = _921;
    float _1395 = _1393;
    float _1397 = _1393;
    if (!_1329)
    {
        _923 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1399 = _923;
    float _1401 = _1399;
    float _1403 = _1399;
    if (!_1329)
    {
        _925 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1405 = _925;
    float _1407 = _1311 * _828;
    float _1409 = _839 * _1373;
    float _1411 = _839 * _1407;
    float _1413 = _853 * _1407;
    float _1415 = fma(_849, _1411, _833);
    float _1417 = fma(_851, _1411, _835);
    float _1419 = fma(_839, _1413, _837);
    out.m_83.x = _1415;
    out.m_83.y = _1417;
    out.m_83.z = _1419;
    out.m_83.w = _1409;
    bool _1421 = !_1329;
    float _1423 = _1405;
    float _1425 = _1405;
    if (!_1421)
    {
        bool _1427 = _534 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1429 = isnan(_534);
        bool _1431 = _1427 || _1429;
        bool _1433 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1435 = _1431 || _1433;
        if (!_1435)
        {
            float _1437 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1439 = _534 + _1437;
            float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1443 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1441;
            float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1447 = _1445 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1449 = 1.0 / _1443;
            float _1451 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1453 = _1451 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1455 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1457 = _1455 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1461 = _1459 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1465 = _1463 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1467 = _1439 * _1449;
            float _1469 = precise::clamp(_1467, 0.0, 1.0);
            float _1471 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1473 = _1471 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1475 = fma(_1469, _1447, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1477 = fma(_1469, _1473, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1479 = fma(_1469, _1453, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1481 = fma(_1469, _1457, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1483 = fma(_1469, _1461, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1485 = fma(_1469, _1465, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1403 = _1479;
            _1385 = _1483;
            _1397 = _1475;
            _1379 = _1481;
            _1425 = _1477;
            _1391 = _1485;
            _1487 = true;
        }
        else
        {
            bool _1489 = _534 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1491 = isnan(_534);
            bool _1493 = _1489 || _1491;
            bool _1495 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1497 = _1493 || _1495;
            if (!_1497)
            {
                _1395 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1499 = _1395;
            _1397 = _1499;
            if (!_1497)
            {
                _1401 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1501 = _1401;
            _1403 = _1501;
            if (!_1497)
            {
                _1423 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1503 = _1423;
            _1425 = _1503;
            if (!_1497)
            {
                _1377 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1505 = _1377;
            _1379 = _1505;
            if (!_1497)
            {
                _1383 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1507 = _1383;
            _1385 = _1507;
            if (!_1497)
            {
                _1389 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1509 = _1389;
            bool _1511 = !_1497;
            _1391 = _1509;
            if (!_1511)
            {
                bool _1513 = _534 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1515 = isnan(_534);
                bool _1517 = _1513 || _1515;
                bool _1519 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1521 = _1517 || _1519;
                if (!_1521)
                {
                    float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1525 = _534 + _1523;
                    float _1527 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1529 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1527;
                    float _1531 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1533 = _1531 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1535 = 1.0 / _1529;
                    float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1539 = _1537 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1543 = _1541 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1545 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1547 = _1545 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1551 = _1549 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1553 = _1525 * _1535;
                    float _1555 = precise::clamp(_1553, 0.0, 1.0);
                    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1559 = _1557 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1561 = fma(_1555, _1533, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1563 = fma(_1555, _1559, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1565 = fma(_1555, _1539, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1567 = fma(_1555, _1543, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1569 = fma(_1555, _1547, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1571 = fma(_1555, _1551, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1403 = _1565;
                    _1385 = _1569;
                    _1397 = _1561;
                    _1379 = _1567;
                    _1425 = _1563;
                    _1391 = _1571;
                    _1487 = true;
                }
                else
                {
                    _1403 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1385 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1397 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1379 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1425 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1391 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1487 = false;
    float _1573 = _1403;
    float _1575 = _1385;
    float _1577 = _1397;
    float _1579 = _1379;
    float _1581 = _1425;
    float _1583 = _1391;
    float _1585 = fma(_1255, -0.5, 0.5);
    float _1587 = precise::clamp(_1585, 0.0, 1.0);
    float _1589 = -_1573;
    float _1591 = _1589 + _1575;
    float _1593 = -_1577;
    float _1595 = _1593 + _1579;
    float _1597 = -_1581;
    float _1599 = _1597 + _1583;
    bool _1601 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1603 = fma(_1587, _1591, _1573);
    float _1605 = fma(_1587, _1595, _1577);
    float _1607 = fma(_1587, _1599, _1581);
    float _1609 = _1603 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _1611 = fma(_1605, 0.298911988735198974609375, _1609);
    float _1613 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1615 = fma(_1607, 0.114477999508380889892578125, _1611);
    out.m_47.x = _1613;
    float _1617 = -_1615;
    float _1619 = _1605 + _1617;
    float _1621 = -_1615;
    float _1623 = _1603 + _1621;
    float _1625 = -_1615;
    float _1627 = _1607 + _1625;
    float _1629 = fma(_1619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1615);
    float _1631 = fma(_1623, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1615);
    float _1633 = fma(_1627, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1615);
    out.m_87.x = _1629;
    out.m_87.y = _1631;
    out.m_87.z = _1633;
    if (!_1601)
    {
        return out;
    }
    float _1635 = -_504;
    float _1637 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1639 = -_508;
    float _1641 = _1639 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1643 = -_512;
    float _1645 = _1643 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1647 = _1637 * _1637;
    float _1649 = fma(_1641, _1641, _1647);
    float _1651 = fma(_1645, _1645, _1649);
    float _1653 = sqrt(_1651);
    float _1655 = rsqrt(_1651);
    float _1657 = -_1653;
    float _1659 = _1657 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1661 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1663 = precise::clamp(_1661, 0.0, 1.0);
    float _1665 = _1641 * _1655;
    float _1667 = _1637 * _1655;
    float _1669 = abs(_1663);
    float _1671 = log2(_1669);
    float _1673 = _1645 * _1655;
    float _1675 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1677 = _1255 * _1667;
    float _1679 = -_1667;
    float _1681 = -_1675;
    float _1683 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1681);
    float _1685 = fma(_1253, _1665, _1677);
    float _1687 = -_1673;
    float _1689 = fma(_1687, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1683);
    float _1691 = fma(_1257, _1673, _1685);
    float _1693 = precise::clamp(_1691, 0.0, 1.0);
    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1697 = _1689 + _1695;
    float _1699 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1701 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1703 = precise::clamp(_1701, 0.0, 1.0);
    float _1705 = exp2(_1699);
    float _1707 = _1705 * _1703;
    float _1709 = _1693 * _1707;
    float _1711 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1713 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1715 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1711;
    out.m_85.y = _1713;
    out.m_85.z = _1715;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1487 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1773 = as_type<float>(_122);
        out.gl_Position.z = _1773;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_49.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_106);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1842 = as_type<float>(_158);
        out.gl_Position.z = _1842;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_51.w;
    float _162 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_49.x;
    float _176 = in.m_49.y;
    float _178 = in.m_49.z;
    float _180 = in.m_44.x;
    float _182 = in.m_44.y;
    float _184 = in.m_44.z;
    float _186 = 0.0;
    float _188 = _162;
    if (!_172)
    {
        float _190 = _162 * _162;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _194;
    if (!_172)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_172;
    float _204 = _200;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _162 * _208;
        float _218 = exp2(_216);
        float _220 = _214 * 0.693147182464599609375;
        float _222 = 1.0 / _220;
        float _224 = 1.0 / _212;
        float _226 = _218 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _222, _162);
        float _232 = _230 * _224;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_172;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _162 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _188 = _258;
    }
    float _260 = _188;
    float _262 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _266 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _268 = in.m_53.x;
    float _270 = in.m_53.y;
    float _272 = in.m_53.z;
    float _274 = fma(_260, _176, _262);
    float _276 = fma(_260, _174, _264);
    float _278 = fma(_260, _178, _266);
    float _280 = fma(_274, _160, _182);
    float _282 = fma(_276, _160, _180);
    float _284 = fma(_278, _160, _184);
    float _286 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _288 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _290 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _292 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].x, _286);
    float _294 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].x, _288);
    float _296 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].x, _290);
    float _298 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _292);
    float _300 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _294);
    float _302 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _296);
    float _304 = _298 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _306 = _300 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _308 = _302 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _310 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _312 = _304 + _310;
    float _314 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _316 = _306 + _314;
    float _318 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _320 = _308 + _318;
    float _322 = _312 * _312;
    float _324 = fma(_316, _316, _322);
    float _326 = fma(_320, _320, _324);
    float _328 = rsqrt(_326);
    float _330 = _312 * _328;
    float _332 = _316 * _328;
    float _334 = _320 * _328;
    float _336 = -_330;
    float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[18].w, _312);
    float _340 = -_332;
    float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[18].w, _316);
    float _344 = -_334;
    float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[18].w, _320);
    float _348 = _338 * _338;
    float _350 = in.m_51.x;
    float _352 = in.m_51.y;
    float _354 = in.m_51.z;
    float _356 = fma(_342, _342, _348);
    float _358 = fma(_346, _346, _356);
    float _360 = sqrt(_358);
    float _362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _268);
    float _364 = _352 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _366 = _350 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _368 = _328 * _360;
    float _370 = _354 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _372 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _374 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _270);
    float _376 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _378 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _380 = _372 * _368;
    float _382 = _376 * _368;
    float _384 = _378 * _368;
    float _386 = _380 * _374;
    float _388 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _272);
    float _390 = _382 * _362;
    float _392 = _386 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _394 = _384 * _388;
    float _396 = _386 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _398 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[10].x, _392);
    float _400 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[8].x, _396);
    float _402 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[10].z, _398);
    float _404 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[8].z, _400);
    float _406 = _308 + _402;
    float _408 = _306 + _404;
    float _410 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _412 = _406 + _410;
    float _414 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _416 = _408 + _414;
    float _418 = _412 * _412;
    float _420 = fma(_416, _416, _418);
    float _422 = _386 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _424 = sqrt(_420);
    float _426 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[9].x, _422);
    float _428 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[9].z, _426);
    float _430 = _304 + _428;
    bool _432 = _424 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _434 = _428;
    float _436 = _304;
    float _438 = _394;
    float _440 = _368;
    float _442 = _412;
    if (!_432)
    {
        _434 = _408;
    }
    float _444 = _434;
    float _446 = _444;
    if (!_432)
    {
        _436 = _406;
    }
    float _448 = _436;
    float _450 = _448;
    if (!_432)
    {
        _438 = _430;
    }
    float _452 = _438;
    bool _454 = !_432;
    float _456 = _452;
    if (!_454)
    {
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _460 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _462 = _424 + _460;
        float _464 = _430 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _466 = rsqrt(_420);
        float _468 = _462 * _458;
        float _470 = _468 * 0.15915493667125701904296875;
        float _472 = _470 * 6.283185482025146484375;
        float _474 = sin(_472);
        float _476 = _470 * 6.283185482025146484375;
        float _478 = cos(_476);
        float _480 = fma(_474, _464, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _482 = _466 * _480;
        float _484 = _478 + (-1.0);
        float _486 = fma(_416, _482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _488 = fma(_412, _482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _490 = _484 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _492 = fma(_430, _478, _490);
        _456 = _492;
        _446 = _486;
        _450 = _488;
        _440 = _470;
    }
    float _494 = _456;
    float _496 = _446;
    float _498 = _450;
    float _500 = _440;
    float _502 = -_330;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _494);
    float _506 = -_332;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _496);
    float _510 = -_334;
    float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _498);
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _516 = _504 + _514;
    float _518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _520 = _508 + _518;
    float _522 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _524 = _512 + _522;
    float _526 = _516 * _516;
    float _528 = fma(_520, _520, _526);
    float _530 = fma(_524, _524, _528);
    float _532 = rsqrt(_530);
    float _534 = sqrt(_530);
    float _536 = _532 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _538 = _520 * _536;
    float _540 = _524 * _536;
    float _542 = _538 * _538;
    float _544 = _540 * _540;
    float _546 = _542 + _544;
    float _548 = sqrt(_546);
    bool _550 = _548 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _552 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _554 = _548 + _552;
    float _556 = _500;
    float _558 = _546;
    float _560 = _554;
    float _562 = _538;
    float _564 = _524;
    float _566 = _516;
    float _568 = _520;
    if (_550)
    {
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _556 = _570;
    }
    float _572 = _556;
    if (_550)
    {
        float _574 = rsqrt(_546);
        _558 = _574;
    }
    float _576 = _558;
    float _578 = _576;
    if (_550)
    {
        float _580 = _554 * _572;
        _560 = _580;
    }
    float _582 = _560;
    if (_550)
    {
        float _584 = _582 * 0.15915493667125701904296875;
        _442 = _584;
    }
    float _586 = _442;
    float _588 = _572;
    float _590 = _586;
    if (_550)
    {
        float _592 = _586 * 6.283185482025146484375;
        float _594 = sin(_592);
        _588 = _594;
    }
    float _596 = _588;
    float _598 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _600 = precise::max(0.0, _598);
    float _602 = _408;
    float _604 = _600;
    if (_550)
    {
        float _606 = _586 * 6.283185482025146484375;
        float _608 = cos(_606);
        _602 = _608;
    }
    float _610 = _602;
    float _612 = -_536;
    float _614 = -_600;
    float _616 = fma(_516, _612, _614);
    if (_550)
    {
        float _618 = _616 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _604 = _618;
    }
    float _620 = _604;
    float _622 = _596;
    float _624 = _620;
    if (_550)
    {
        float _626 = fma(_596, _620, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _622 = _626;
    }
    float _628 = _622;
    float _630 = _628;
    float _632 = _610;
    if (_550)
    {
        float _634 = _610 + (-1.0);
        _624 = _634;
    }
    float _636 = _624;
    float _638 = 0.0;
    float _640 = _636;
    if (_550)
    {
        float _642 = _576 * _628;
        _638 = _642;
    }
    float _644 = _638;
    if (!_550)
    {
        _630 = _616;
    }
    float _646 = _630;
    float _648 = _646;
    if (_550)
    {
        float _650 = _636 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _650;
    }
    float _652 = _590;
    if (_550)
    {
        float _654 = _538 * _644;
        _562 = _654;
    }
    float _656 = _562;
    if (!_550)
    {
        _640 = _540;
    }
    float _658 = _640;
    float _660 = _658;
    if (_550)
    {
        float _662 = _540 * _644;
        _660 = _662;
    }
    float _664 = _660;
    if (!_550)
    {
        _578 = _542;
    }
    float _666 = _578;
    float _668 = _666;
    if (_550)
    {
        float _670 = fma(_616, _610, _652);
        _648 = _670;
    }
    float _672 = _648;
    if (_550)
    {
        float _674 = _656 * _656;
        _668 = _674;
    }
    float _676 = _668;
    if (!_550)
    {
        _632 = _544;
    }
    float _678 = _632;
    float _680 = _678;
    if (_550)
    {
        float _682 = _664 * _664;
        _680 = _682;
    }
    float _684 = _680;
    float _686 = _504 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _688 = fma(_672, _672, _676);
    float _690 = _504 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _692 = _688 + _684;
    float _694 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[2].x, _686);
    float _696 = _504 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _698 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _700 = fma(_534, (*spvDescriptorSet0.vp_c15)._m0[23].w, _698);
    float _702 = precise::clamp(_700, 0.0, 1.0);
    float _704 = rsqrt(_692);
    float _706 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[2].z, _694);
    float _708 = _504 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _710 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[1].x, _696);
    float _712 = -_702;
    float _714 = _712 + 1.0;
    float _716 = _706 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _718 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[0].x, _708);
    float _720 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[1].z, _710);
    float _722 = abs(_714);
    float _724 = log2(_722);
    float _726 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _728 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[0].z, _718);
    float _730 = _720 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _732 = _716 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _734 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[3].x, _690);
    float _736 = _728 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _738 = _704 * _656;
    float _740 = _730 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _742 = _704 * _672;
    float _744 = -_732;
    float _746 = fma(_744, _726, 1.0);
    float _748 = fma(_512, (*spvDescriptorSet0.vp_c8)._m0[3].z, _734);
    float _750 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[7].x, _740);
    float _752 = _738 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _754 = _704 * _664;
    float _756 = _724 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _758 = _748 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _760 = -_752;
    float _762 = fma(_742, (*spvDescriptorSet0.vp_c15)._m0[21].y, _760);
    float _764 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[7].z, _750);
    float _766 = exp2(_756);
    float _768 = _730 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _770 = -_754;
    float _772 = fma(_770, (*spvDescriptorSet0.vp_c15)._m0[21].z, _762);
    float _774 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _764);
    float _776 = _730 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _778 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[5].x, _768);
    float _780 = fma(_772, -0.5, 0.5);
    float _782 = fma(_772, 0.5, 0.5);
    float _784 = log2(_746);
    float _786 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[4].x, _776);
    float _788 = _742 + 1.0;
    float _790 = fma(_782, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _792 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[5].z, _778);
    float _794 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[4].z, _786);
    float _796 = fma(_782, _790, -0.212114393711090087890625);
    float _798 = 1.0 / _774;
    float _800 = -_742;
    float _802 = fma(_766, _788, _800);
    float _804 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _794);
    float _806 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _792);
    float _808 = fma(_782, _796, 1.570728778839111328125);
    float _810 = fma(_802, 0.5, 0.5);
    float _812 = sqrt(_780);
    float _814 = _784 * 0.693147182464599609375;
    float _816 = _804 * _798;
    float _818 = _806 * _798;
    float _820 = _814 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _822 = fma(_816, 0.5, 0.5);
    float _824 = fma(_818, -0.5, 0.5);
    float _826 = _812 * 0.636619746685028076171875;
    float3 _2941 = float3(_822, _824, _820);
    float _828 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2941, float3(0.0), isnan(_2941)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2941, float3(0.0), isnan(_2941)), level(0.0)).x;
    float3 _2952 = float3(_822, _824, _820);
    float4 _831 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2952, float3(0.0), isnan(_2952)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2952, float3(0.0), isnan(_2952)), level(0.0)).xyzw;
    float _833 = _831.x;
    float _835 = _831.y;
    float _837 = _831.z;
    float _839 = _831.w;
    float _841 = -_808;
    float _843 = fma(_826, _841, 1.0);
    float2 _2974 = float2(_843, _810);
    float3 _847 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2974, float2(0.0), isnan(_2974)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2974, float2(0.0), isnan(_2974)), level(0.0)).xyz;
    float _849 = _847.x;
    float _851 = _847.y;
    float _853 = _847.z;
    float _855 = in.m_55.w;
    float _857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _859 = in.m_57.z;
    float _861 = in.m_57.w;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _865 = _863 != 0;
    float _867 = _724 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _871 = _869 != 0;
    float _873 = in.m_55.y;
    float _875 = in.m_57.y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _881 = _879 != 0;
    float _883 = in.m_57.x;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _887 = _885 != 0;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _893 = _891 != 0;
    float _895 = in.m_55.z;
    float _897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _899 = -_855;
    float _901 = _899 + 1.0;
    out.m_59.w = _855;
    float _903 = _730 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _905 = _859 > 0.5;
    float _907 = in.m_55.x;
    bool _909 = _861 > 0.5;
    float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _915 = _855;
    bool _917 = _909;
    float _919 = _859;
    float _921 = _774;
    float _923 = _804;
    float _925 = _806;
    if (_865)
    {
        float _927 = _905 ? _901 : _855;
        _915 = _927;
    }
    float _929 = _915;
    float _931 = -_873;
    float _933 = _931 + 1.0;
    int _935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _937 = _935 != 0;
    float _939 = _861;
    float _941 = _873;
    float _943 = _875;
    if (_871)
    {
        float _945 = in.m_57.z;
        _939 = _945;
    }
    float _947 = _939;
    bool _949 = _875 > 0.5;
    float _951 = _897 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _955 = _883 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _957 = _949 ? as_type<int>(_933) : as_type<int>(_873);
    float _959 = fma(_951, _929, -0.5);
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _963 = _961 != 0;
    float _965 = -_889;
    float _967 = fma(_955, 2.0, _965);
    float _969 = _875 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _971 = _937 ? as_type<float>(_957) : _873;
    float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _975 = _895;
    float _977 = _971;
    if (_881)
    {
        float _979 = _909 ? _933 : _873;
        _941 = _979;
    }
    float _981 = _941;
    float _983 = fma(_969, -2.0, _877);
    bool _985 = _875 > 0.5;
    bool _987 = _985 && _893;
    float _989 = in.m_61.x;
    float _991 = in.m_61.y;
    float _993 = in.m_61.z;
    bool _995 = _270 != 0.0;
    bool _997 = isnan(_270);
    bool _999 = _995 || _997;
    bool _1001 = isnan(0.0);
    bool _1003 = _999 || _1001;
    float _1005 = -_140;
    float _1007 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[76].x, _967);
    float _1009 = 0.0;
    if (_893)
    {
        _1009 = _895;
    }
    float _1011 = _1009;
    float _1013 = exp2(_867);
    bool _1015 = _268 == 0.0;
    bool _1017 = !_1003;
    bool _1019 = _1015 && _1017;
    float _1021 = in.m_63.y;
    float _1023 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[6].x, _903);
    bool _1025 = _272 == 0.0;
    bool _1027 = _1025 && _1019;
    out.m_65.x = _508;
    out.m_65.y = _504;
    out.m_65.z = _512;
    float _1029 = _1011;
    float _1031 = _947;
    bool _1033 = _1027;
    if (_871)
    {
        bool _1035 = _947 > 0.5;
        _917 = _1035;
    }
    bool _1037 = _917;
    if (_987)
    {
        float _1039 = -_1011;
        float _1041 = _1039 + 1.0;
        _1029 = _1041;
    }
    float _1043 = _1029;
    float _1045 = _973 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_887)
    {
        _1031 = _907;
    }
    float _1047 = _1031;
    float _1049 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1023);
    float _1051 = fma(_1045, _971, -0.5);
    float _1053 = _1047;
    if (_893)
    {
        _975 = _1043;
    }
    float _1055 = _975;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1061 = _1057;
    if (_963)
    {
        _977 = _883;
    }
    float _1063 = _977;
    float _1065 = -_1013;
    float _1067 = _1065 + 1.0;
    float _1069 = _1063;
    if (!_963)
    {
        _1069 = _859;
    }
    float _1071 = _1069;
    float _1073 = _989;
    float _1075 = _993;
    float _1077 = _991;
    if (!_1027)
    {
        float _1079 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[17].y, _989);
        _1073 = _1079;
    }
    float _1081 = _1073;
    float _1083 = 0.0;
    if (!_887)
    {
        _1083 = _1047;
    }
    float _1085 = _1083;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1089 = _1085;
    if (_887)
    {
        _1053 = _907;
    }
    float _1091 = _1053;
    float _1093 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1095 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _983);
    float _1097 = _1091;
    if (!_1027)
    {
        float _1099 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[17].y, _993);
        _1075 = _1099;
    }
    float _1101 = _1075;
    float _1103 = -_1087;
    float _1105 = fma(_1093, 2.0, _1103);
    float _1107 = _1087;
    if (!_963)
    {
        float _1109 = in.m_57.z;
        _1107 = _1109;
    }
    float _1111 = _1107;
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1115 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1057);
    if (!_963)
    {
        _1061 = _875;
    }
    float _1117 = _1061;
    float _1119 = _857 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1121 = _1117;
    int _1123 = as_type<int>(_1119);
    if (_963)
    {
        _1121 = _883;
    }
    float _1125 = _1121;
    float _1127 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1115);
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1131 = fma(_1119, _981, -0.5);
    if (!_1027)
    {
        float _1133 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[17].y, _991);
        _1077 = _1133;
    }
    float _1135 = _1077;
    float _1137 = -_1095;
    float _1139 = fma(_1127, _1051, _1137);
    if (_887)
    {
        float _1141 = -_1091;
        float _1143 = _1141 + 1.0;
        _1123 = as_type<int>(_1143);
    }
    int _1145 = _1123;
    float _1147 = as_type<float>(_1145);
    if (_887)
    {
        bool _1149 = _883 > 0.5;
        _1033 = _1149;
    }
    bool _1151 = _1033;
    float _1153 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1129);
    int _1155 = 0;
    if (_871)
    {
        float _1157 = -_1091;
        float _1159 = _1157 + 1.0;
        _1155 = as_type<int>(_1159);
    }
    int _1161 = _1155;
    float _1163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1167 = _911 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1169 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1171 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1113);
    if (_887)
    {
        float _1173 = _1151 ? as_type<float>(_1145) : _1091;
        _1089 = _1173;
    }
    float _1175 = _1089;
    float _1177 = fma(_1167, _1055, -0.5);
    float _1179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_871)
    {
        float _1181 = _1037 ? as_type<float>(_1161) : _1091;
        _1097 = _1181;
    }
    float _1183 = _1097;
    float _1185 = -_1165;
    float _1187 = fma(_1169, 2.0, _1185);
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1191 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1153);
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_963)
    {
        _919 = _875;
    }
    float _1195 = _919;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1199 = _1111;
    if (!_963)
    {
        _1147 = _1111;
    }
    float _1201 = _1147;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1205 = _1201;
    if (_963)
    {
        _1199 = _875;
    }
    float _1207 = _1199;
    float _1209 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1189);
    if (_963)
    {
        _1205 = _875;
    }
    float _1211 = _1205;
    float _1213 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1193);
    float _1215 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1203);
    if (!_963)
    {
        _943 = _883;
    }
    float _1217 = _943;
    float _1219 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1197);
    float _1221 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1223 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1225 = _1135 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1227 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1209);
    float _1229 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1231 = _1179 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1233 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1235 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1237 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1221);
    float _1239 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1223);
    float _1241 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1225);
    float _1243 = _1227 * (-0.15915493667125701904296875);
    float _1245 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1213);
    float _1247 = fma(_1229, _1175, -0.5);
    float _1249 = fma(_1231, _1183, -0.5);
    float _1251 = fma(_1235, -2.0, _953);
    float _1253 = fma(_1101, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1237);
    float _1255 = fma(_1101, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1239);
    float _1257 = fma(_1101, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1241);
    float _1259 = _1243 * 6.283185482025146484375;
    float _1261 = sin(_1259);
    float _1263 = fma(_1245, _1247, _1007);
    float _1265 = -_140;
    float _1267 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1187);
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1271 = _1243 * 6.283185482025146484375;
    float _1273 = cos(_1271);
    float _1275 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1277 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1281 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1291 = fma(_1191, _1249, _1267);
    float _1293 = in.m_63.x;
    float _1295 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1297 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1219);
    float _1299 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1251);
    float _1301 = in.m_63.w;
    float _1303 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1305 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _1281;
    out.m_67.y = _1283;
    out.m_67.z = _1285;
    out.m_67.w = _1279;
    float _1309 = fma(_1295, -2.0, _1059);
    float _1311 = _1067 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1313 = -_140;
    float _1315 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1105);
    out.m_69.x = _1233;
    out.m_69.y = _1305;
    out.m_69.z = _1307;
    out.m_69.w = _1303;
    float _1317 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1309);
    float _1319 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1049);
    bool _1321 = _534 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1323 = isnan(_534);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1329 = _1325 || _1327;
    out.m_71.y = _1021;
    out.m_73.x = _1253;
    out.m_73.y = _1255;
    out.m_73.z = _1257;
    float _1331 = _1261 * _959;
    float _1333 = -_1299;
    float _1335 = fma(_1297, _1131, _1333);
    float _1337 = _1273 * _959;
    float _1339 = _1263 + 0.5;
    float _1341 = -_1331;
    float _1343 = fma(_1273, _1177, _1341);
    float _1345 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1215);
    float _1347 = _1139 + 0.5;
    float _1349 = _1291 + 0.5;
    float _1351 = _1335 + 0.5;
    float _1353 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1171);
    float _1355 = fma(_1261, _1177, _1337);
    float _1357 = fma(_1345, _1343, _1315);
    float _1359 = _1319 + _774;
    out.m_75.x = _1339;
    out.m_75.y = _1347;
    out.m_75.z = _1349;
    out.m_75.w = _1351;
    float _1361 = -_1317;
    float _1363 = fma(_1353, _1355, _1361);
    float _1365 = _1357 + 0.5;
    float _1367 = _1359 * 0.5;
    out.m_71.x = _1293;
    float _1369 = _1363 + 0.5;
    out.m_71.w = _1301;
    out.m_77.x = _1365;
    out.m_77.y = _1369;
    float _1371 = -_1311;
    float _1373 = _1371 + 1.0;
    out.m_79.z = _1367;
    out.m_79.w = _774;
    out.m_81.x = _520;
    out.m_81.y = _516;
    out.m_81.z = _524;
    out.gl_Position.x = _804;
    out.gl_Position.y = _806;
    out.gl_Position.z = _1319;
    out.gl_Position.w = _774;
    if (!_1329)
    {
        _564 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1375 = _564;
    float _1377 = _1375;
    float _1379 = _1375;
    if (!_1329)
    {
        _566 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1381 = _566;
    float _1383 = _1381;
    float _1385 = _1381;
    if (!_1329)
    {
        _568 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1387 = _568;
    float _1389 = _1387;
    float _1391 = _1387;
    if (!_1329)
    {
        _921 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1393 = _921;
    float _1395 = _1393;
    float _1397 = _1393;
    if (!_1329)
    {
        _923 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1399 = _923;
    float _1401 = _1399;
    float _1403 = _1399;
    if (!_1329)
    {
        _925 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1405 = _925;
    float _1407 = _1311 * _828;
    float _1409 = _839 * _1373;
    float _1411 = _839 * _1407;
    float _1413 = _853 * _1407;
    float _1415 = fma(_849, _1411, _833);
    float _1417 = fma(_851, _1411, _835);
    float _1419 = fma(_839, _1413, _837);
    out.m_83.x = _1415;
    out.m_83.y = _1417;
    out.m_83.z = _1419;
    out.m_83.w = _1409;
    bool _1421 = !_1329;
    float _1423 = _1405;
    float _1425 = _1405;
    if (!_1421)
    {
        bool _1427 = _534 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1429 = isnan(_534);
        bool _1431 = _1427 || _1429;
        bool _1433 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1435 = _1431 || _1433;
        if (!_1435)
        {
            float _1437 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1439 = _534 + _1437;
            float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1443 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1441;
            float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1447 = _1445 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1449 = 1.0 / _1443;
            float _1451 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1453 = _1451 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1455 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1457 = _1455 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1461 = _1459 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1465 = _1463 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1467 = _1439 * _1449;
            float _1469 = precise::clamp(_1467, 0.0, 1.0);
            float _1471 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1473 = _1471 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1475 = fma(_1469, _1447, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1477 = fma(_1469, _1473, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1479 = fma(_1469, _1453, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1481 = fma(_1469, _1457, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1483 = fma(_1469, _1461, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1485 = fma(_1469, _1465, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1403 = _1479;
            _1385 = _1483;
            _1397 = _1475;
            _1379 = _1481;
            _1425 = _1477;
            _1391 = _1485;
            _1487 = true;
        }
        else
        {
            bool _1489 = _534 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1491 = isnan(_534);
            bool _1493 = _1489 || _1491;
            bool _1495 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1497 = _1493 || _1495;
            if (!_1497)
            {
                _1395 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1499 = _1395;
            _1397 = _1499;
            if (!_1497)
            {
                _1401 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1501 = _1401;
            _1403 = _1501;
            if (!_1497)
            {
                _1423 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1503 = _1423;
            _1425 = _1503;
            if (!_1497)
            {
                _1377 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1505 = _1377;
            _1379 = _1505;
            if (!_1497)
            {
                _1383 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1507 = _1383;
            _1385 = _1507;
            if (!_1497)
            {
                _1389 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1509 = _1389;
            bool _1511 = !_1497;
            _1391 = _1509;
            if (!_1511)
            {
                bool _1513 = _534 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1515 = isnan(_534);
                bool _1517 = _1513 || _1515;
                bool _1519 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1521 = _1517 || _1519;
                if (!_1521)
                {
                    float _1523 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1525 = _534 + _1523;
                    float _1527 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1529 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1527;
                    float _1531 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1533 = _1531 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1535 = 1.0 / _1529;
                    float _1537 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1539 = _1537 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1543 = _1541 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1545 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1547 = _1545 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1551 = _1549 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1553 = _1525 * _1535;
                    float _1555 = precise::clamp(_1553, 0.0, 1.0);
                    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1559 = _1557 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1561 = fma(_1555, _1533, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1563 = fma(_1555, _1559, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1565 = fma(_1555, _1539, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1567 = fma(_1555, _1543, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1569 = fma(_1555, _1547, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1571 = fma(_1555, _1551, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1403 = _1565;
                    _1385 = _1569;
                    _1397 = _1561;
                    _1379 = _1567;
                    _1425 = _1563;
                    _1391 = _1571;
                    _1487 = true;
                }
                else
                {
                    _1403 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1385 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1397 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1379 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1425 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1391 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1487 = false;
    float _1573 = _1403;
    float _1575 = _1385;
    float _1577 = _1397;
    float _1579 = _1379;
    float _1581 = _1425;
    float _1583 = _1391;
    float _1585 = fma(_1255, -0.5, 0.5);
    float _1587 = precise::clamp(_1585, 0.0, 1.0);
    float _1589 = -_1573;
    float _1591 = _1589 + _1575;
    float _1593 = -_1577;
    float _1595 = _1593 + _1579;
    float _1597 = -_1581;
    float _1599 = _1597 + _1583;
    bool _1601 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1603 = fma(_1587, _1591, _1573);
    float _1605 = fma(_1587, _1595, _1577);
    float _1607 = fma(_1587, _1599, _1581);
    float _1609 = _1603 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _1611 = fma(_1605, 0.298911988735198974609375, _1609);
    float _1613 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1615 = fma(_1607, 0.114477999508380889892578125, _1611);
    out.m_47.x = _1613;
    float _1617 = -_1615;
    float _1619 = _1605 + _1617;
    float _1621 = -_1615;
    float _1623 = _1603 + _1621;
    float _1625 = -_1615;
    float _1627 = _1607 + _1625;
    float _1629 = fma(_1619, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1615);
    float _1631 = fma(_1623, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1615);
    float _1633 = fma(_1627, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1615);
    out.m_87.x = _1629;
    out.m_87.y = _1631;
    out.m_87.z = _1633;
    if (!_1601)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1635 = -_504;
    float _1637 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1639 = -_508;
    float _1641 = _1639 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1643 = -_512;
    float _1645 = _1643 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1647 = _1637 * _1637;
    float _1649 = fma(_1641, _1641, _1647);
    float _1651 = fma(_1645, _1645, _1649);
    float _1653 = sqrt(_1651);
    float _1655 = rsqrt(_1651);
    float _1657 = -_1653;
    float _1659 = _1657 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1661 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1663 = precise::clamp(_1661, 0.0, 1.0);
    float _1665 = _1641 * _1655;
    float _1667 = _1637 * _1655;
    float _1669 = abs(_1663);
    float _1671 = log2(_1669);
    float _1673 = _1645 * _1655;
    float _1675 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1677 = _1255 * _1667;
    float _1679 = -_1667;
    float _1681 = -_1675;
    float _1683 = fma(_1679, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1681);
    float _1685 = fma(_1253, _1665, _1677);
    float _1687 = -_1673;
    float _1689 = fma(_1687, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1683);
    float _1691 = fma(_1257, _1673, _1685);
    float _1693 = precise::clamp(_1691, 0.0, 1.0);
    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1697 = _1689 + _1695;
    float _1699 = _1671 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1701 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1703 = precise::clamp(_1701, 0.0, 1.0);
    float _1705 = exp2(_1699);
    float _1707 = _1705 * _1703;
    float _1709 = _1693 * _1707;
    float _1711 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1713 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1715 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1711;
    out.m_85.y = _1713;
    out.m_85.z = _1715;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

