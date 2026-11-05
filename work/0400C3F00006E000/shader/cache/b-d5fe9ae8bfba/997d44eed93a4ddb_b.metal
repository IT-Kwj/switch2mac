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
    float4 m_59 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1155 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    float _106 = as_type<float>(_98);
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1499 = as_type<float>(_114);
        out.gl_Position.z = _1499;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_128)
    {
        float _134 = float(_98);
        _106 = _134;
    }
    float _136 = _106;
    bool _138 = _132 >= _136;
    bool _140 = !_128;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _116 = as_type<int>(_148);
    }
    int _150 = _116;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1568 = as_type<float>(_150);
        out.gl_Position.z = _1568;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_51.x;
    float _154 = in.m_51.y;
    float _156 = in.m_51.z;
    float _158 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _160 = in.m_53.w;
    float _162 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _162;
    float _166 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _168 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _166;
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _164 * _164;
    float _178 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _180 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _178;
    bool _182 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _184 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _186 = _182 || _184;
    bool _188 = isnan(1.0);
    bool _190 = _186 || _188;
    float _192 = in.m_44.x;
    float _194 = in.m_44.y;
    float _196 = in.m_44.z;
    float _198 = fma(_168, _168, _176);
    float _200 = fma(_180, _180, _198);
    float _202 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _204 = _152 * 18.84955596923828125;
    float _206 = sqrt(_200);
    float _208 = fma(_152, 12.56637096405029296875, _202);
    float _210 = _204 * 0.15915493667125701904296875;
    float _212 = in.m_53.x;
    float _214 = in.m_53.y;
    float _216 = in.m_53.z;
    float _218 = _208 * 0.15915493667125701904296875;
    float _220 = _210 * 6.283185482025146484375;
    float _222 = sin(_220);
    float _224 = precise::max(_206, 50.0);
    float _226 = _218 * 6.283185482025146484375;
    float _228 = cos(_226);
    float _230 = _206;
    float _232 = _158;
    if (!_190)
    {
        float _234 = _158 * _158;
        float _236 = _234 * 0.5;
        _230 = _236;
    }
    float _238 = _230;
    float _240 = precise::min(_224, 100.0);
    float _242 = _238;
    if (!_190)
    {
        float _244 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _242 = _244;
    }
    float _246 = _242;
    float _248 = fma(_222, 0.362500011920928955078125, 1.1375000476837158203125);
    bool _250 = !_190;
    float _252 = _246;
    if (!_250)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _264 = _158 * _256;
        float _266 = 1.0 / _260;
        float _268 = _262 * 0.693147182464599609375;
        float _270 = exp2(_264);
        float _272 = 1.0 / _268;
        float _274 = _270 + (-1.0);
        float _276 = -_274;
        float _278 = fma(_276, _272, _158);
        float _280 = _278 * _266;
        float _282 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _252 = _282;
    }
    float _284 = _252;
    bool _286 = !_190;
    if (!_286)
    {
        float _288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = log2(_288);
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = 1.0 / _294;
        float _298 = _158 * _290;
        float _300 = exp2(_298);
        float _302 = -_300;
        float _304 = _302 + 1.0;
        float _306 = _304 * _296;
        _232 = _306;
    }
    float _308 = _232;
    float _310 = _218 * 6.283185482025146484375;
    float _312 = sin(_310);
    float _314 = fma(_240, 0.014999999664723873138427734375, -0.5);
    float _316 = _152 * 6.283185482025146484375;
    float _318 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _320 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _322 = _314 * _248;
    float _324 = _316 * 0.15915493667125701904296875;
    float _326 = fma(_308, _170, _318);
    float _328 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _330 = _322 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _332 = _324 * 6.283185482025146484375;
    float _334 = cos(_332);
    float _336 = fma(_308, _174, _320);
    float _338 = fma(_308, _172, _328);
    float _340 = _156 * _330;
    float _342 = fma(_326, _160, _192);
    float _344 = fma(_338, _160, _194);
    float _346 = _154 * _330;
    float _348 = _324 * 6.283185482025146484375;
    float _350 = sin(_348);
    float _352 = _340 * _312;
    float _354 = _340 * _228;
    float _356 = _216 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = _214 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = -_352;
    float _362 = fma(_346, _228, _360);
    float _364 = fma(_346, _312, _354);
    float _366 = fma(_336, _160, _196);
    float _368 = _356 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _370 = _362 + 0.5;
    float _372 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _364);
    float _374 = _212 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _378 = _370 * _334;
    float _380 = _368 * _372;
    float _382 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _384 = _370 * _350;
    float _386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _378);
    float _388 = _344 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _390 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _384);
    float _392 = _376 * _386;
    float _394 = _344 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _396 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _388);
    float _398 = _382 * _390;
    float _400 = _392 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _402 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _394);
    float _404 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    float _406 = _392 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[10].x, _400);
    float _410 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].z, _402);
    float _412 = _404 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _414 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[8].x, _406);
    float _416 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[10].z, _408);
    float _418 = _410 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _420 = _392 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _422 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[8].z, _414);
    float _424 = _412 + _416;
    float _426 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[9].x, _420);
    float _428 = _418 + _422;
    float _430 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _432 = _424 + _430;
    float _434 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[9].z, _426);
    float _436 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _438 = _428 + _436;
    float _440 = _432 * _432;
    float _442 = fma(_438, _438, _440);
    float _444 = _344 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _446 = sqrt(_442);
    float _448 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _444);
    float _450 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].z, _448);
    float _452 = _450 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _454 = _452 + _434;
    bool _456 = _446 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _458 = _452;
    float _460 = _392;
    float _462 = _450;
    float _464 = _446;
    float _466 = _454;
    float _468 = _344;
    if (!_456)
    {
        _458 = _428;
    }
    float _470 = _458;
    float _472 = _470;
    if (!_456)
    {
        _460 = _424;
    }
    float _474 = _460;
    float _476 = _474;
    if (!_456)
    {
        _462 = _454;
    }
    float _478 = _462;
    bool _480 = !_456;
    float _482 = _478;
    if (!_480)
    {
        float _484 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _486 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _488 = _446 + _486;
        float _490 = _454 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _492 = rsqrt(_442);
        float _494 = _488 * _484;
        float _496 = _494 * 0.15915493667125701904296875;
        float _498 = _496 * 6.283185482025146484375;
        float _500 = cos(_498);
        float _502 = _496 * 6.283185482025146484375;
        float _504 = sin(_502);
        float _506 = _500 + (-1.0);
        float _508 = _506 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _510 = fma(_504, _490, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _512 = fma(_454, _500, _508);
        float _514 = _492 * _510;
        float _516 = fma(_438, _514, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _518 = fma(_432, _514, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _482 = _512;
        _472 = _516;
        _476 = _518;
        _464 = _496;
    }
    float _520 = _482;
    float _522 = _472;
    float _524 = _476;
    float _526 = _464;
    float _528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _530 = _520 + _528;
    float _532 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _534 = _522 + _532;
    float _536 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _538 = _524 + _536;
    float _540 = _530 * _530;
    float _542 = fma(_534, _534, _540);
    float _544 = fma(_538, _538, _542);
    float _546 = rsqrt(_544);
    float _548 = sqrt(_544);
    float _550 = _534 * _546;
    float _552 = _538 * _546;
    float _554 = _530 * _546;
    float _556 = _550 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _558 = _552 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _560 = _556 * _556;
    float _562 = _558 * _558;
    float _564 = _560 + _562;
    float _566 = sqrt(_564);
    bool _568 = _566 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _570 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _572 = _566 + _570;
    float _574 = _526;
    float _576 = _572;
    float _578 = _556;
    if (_568)
    {
        float _580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _574 = _580;
    }
    float _582 = _574;
    if (_568)
    {
        float _584 = rsqrt(_564);
        _466 = _584;
    }
    float _586 = _466;
    float _588 = _586;
    if (_568)
    {
        float _590 = _572 * _582;
        _576 = _590;
    }
    float _592 = _576;
    if (_568)
    {
        float _594 = _592 * 0.15915493667125701904296875;
        _468 = _594;
    }
    float _596 = _468;
    float _598 = _582;
    if (_568)
    {
        float _600 = _596 * 6.283185482025146484375;
        float _602 = sin(_600);
        _598 = _602;
    }
    float _604 = _598;
    float _606 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _608 = precise::max(0.0, _606);
    float _610 = _366;
    float _612 = _606;
    float _614 = _608;
    if (_568)
    {
        float _616 = _596 * 6.283185482025146484375;
        float _618 = cos(_616);
        _610 = _618;
    }
    float _620 = _610;
    float _622 = -_554;
    float _624 = -_608;
    float _626 = fma(_622, (*spvDescriptorSet0.vp_c15)._m0[24].y, _624);
    if (_568)
    {
        float _628 = _626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _612 = _628;
    }
    float _630 = _612;
    float _632 = _630;
    float _634 = _604;
    if (_568)
    {
        float _636 = fma(_604, _630, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _632 = _636;
    }
    float _638 = _632;
    float _640 = _638;
    if (!_568)
    {
        _634 = _626;
    }
    float _642 = _634;
    float _644 = _642;
    float _646 = _620;
    if (_568)
    {
        float _648 = _620 + (-1.0);
        _614 = _648;
    }
    float _650 = _614;
    float _652 = 0.0;
    float _654 = _650;
    if (_568)
    {
        float _656 = _586 * _638;
        _652 = _656;
    }
    float _658 = _652;
    if (!_568)
    {
        _640 = _560;
    }
    float _660 = _640;
    float _662 = _520 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _664 = _660;
    if (_568)
    {
        float _666 = _650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _588 = _666;
    }
    float _668 = _588;
    if (_568)
    {
        float _670 = _556 * _658;
        _578 = _670;
    }
    float _672 = _578;
    if (!_568)
    {
        _654 = _558;
    }
    float _674 = _654;
    float _676 = _674;
    if (_568)
    {
        float _678 = _558 * _658;
        _676 = _678;
    }
    float _680 = _676;
    if (_568)
    {
        float _682 = fma(_626, _620, _668);
        _644 = _682;
    }
    float _684 = _644;
    if (_568)
    {
        float _686 = _672 * _672;
        _664 = _686;
    }
    float _688 = _664;
    if (!_568)
    {
        _646 = _562;
    }
    float _690 = _646;
    float _692 = _690;
    if (_568)
    {
        float _694 = _680 * _680;
        _692 = _694;
    }
    float _696 = _692;
    float _698 = _520 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _700 = fma(_684, _684, _688);
    float _702 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[3].x, _662);
    float _704 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[2].x, _698);
    float _706 = _700 + _696;
    float _708 = _520 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _712 = fma(_548, (*spvDescriptorSet0.vp_c15)._m0[23].w, _710);
    float _714 = precise::clamp(_712, 0.0, 1.0);
    float _716 = fma(_524, (*spvDescriptorSet0.vp_c8)._m0[2].z, _704);
    float _718 = rsqrt(_706);
    float _720 = _520 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _722 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[1].x, _708);
    float _724 = _716 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _726 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[0].x, _720);
    float _728 = fma(_524, (*spvDescriptorSet0.vp_c8)._m0[1].z, _722);
    float _730 = -_714;
    float _732 = _730 + 1.0;
    float _734 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _736 = _724 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _738 = fma(_524, (*spvDescriptorSet0.vp_c8)._m0[0].z, _726);
    float _740 = _728 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _742 = fma(_524, (*spvDescriptorSet0.vp_c8)._m0[3].z, _702);
    float _744 = -_736;
    float _746 = fma(_744, _734, 1.0);
    float _748 = _738 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _750 = _740 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _752 = abs(_732);
    float _754 = log2(_752);
    float _756 = _718 * _672;
    float _758 = _742 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _760 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[7].x, _750);
    float _762 = _718 * _684;
    float _764 = _756 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _766 = _718 * _680;
    float _768 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[7].z, _760);
    float _770 = log2(_746);
    float _772 = -_764;
    float _774 = fma(_762, (*spvDescriptorSet0.vp_c15)._m0[21].y, _772);
    float _776 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _768);
    float _778 = _740 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _780 = -_766;
    float _782 = fma(_780, (*spvDescriptorSet0.vp_c15)._m0[21].z, _774);
    float _784 = _740 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _786 = _754 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _788 = fma(_782, -0.5, 0.5);
    float _790 = 1.0 / _776;
    float _792 = fma(_782, 0.5, 0.5);
    float _794 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[4].x, _778);
    float _796 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[5].x, _784);
    float _798 = _762 + 1.0;
    float _800 = fma(_792, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _802 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[4].z, _794);
    float _804 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[5].z, _796);
    float _806 = exp2(_786);
    float _808 = fma(_792, _800, -0.212114393711090087890625);
    float _810 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _802);
    float _812 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _804);
    float _814 = _770 * 0.693147182464599609375;
    float _816 = fma(_792, _808, 1.570728778839111328125);
    float _818 = sqrt(_788);
    float _820 = _810 * _790;
    float _822 = _812 * _790;
    float _824 = _814 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _826 = fma(_820, 0.5, 0.5);
    float _828 = fma(_822, -0.5, 0.5);
    float _830 = -_762;
    float _832 = fma(_806, _798, _830);
    float3 _2684 = float3(_826, _828, _824);
    float _834 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2684, float3(0.0), isnan(_2684)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2684, float3(0.0), isnan(_2684)), level(0.0)).x;
    float3 _2695 = float3(_826, _828, _824);
    float4 _837 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2695, float3(0.0), isnan(_2695)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2695, float3(0.0), isnan(_2695)), level(0.0)).xyzw;
    float _839 = _837.x;
    float _841 = _837.y;
    float _843 = _837.z;
    float _845 = _837.w;
    float _847 = fma(_832, 0.5, 0.5);
    float _849 = _818 * 0.636619746685028076171875;
    float _851 = -_816;
    float _853 = fma(_849, _851, 1.0);
    float2 _2722 = float2(_853, _847);
    float3 _857 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2722, float2(0.0), isnan(_2722)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2722, float2(0.0), isnan(_2722)), level(0.0)).xyz;
    float _859 = _857.x;
    float _861 = _857.y;
    float _863 = _857.z;
    float _865 = in.m_55.z;
    float _867 = _740 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _871 = _869 != 0;
    float _873 = in.m_55.y;
    float _875 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[6].x, _867);
    float _877 = in.m_57.x;
    float _879 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[6].z, _875);
    out.m_59.x = _384;
    out.m_59.y = _378;
    float _881 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _879);
    float _883 = 0.0;
    float _885 = _776;
    float _887 = _881;
    float _889 = _812;
    if (_871)
    {
        float _891 = in.m_61.x;
        _883 = _891;
    }
    float _893 = _883;
    out.m_63.x = _522;
    out.m_63.y = _520;
    out.m_63.z = _524;
    float _895 = _312 * _865;
    float _897 = _228 * _865;
    float _899 = -_895;
    float _901 = fma(_228, _873, _899);
    float _903 = fma(_312, _873, _897);
    float _905 = _901 * _334;
    float _907 = _901 * _350;
    float _909 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _911 = _905 * _905;
    bool _913 = _893 > 0.5;
    bool _915 = _913 && _871;
    float _917 = fma(_907, _907, _911);
    float _919 = _893;
    float _921 = _911;
    if (_871)
    {
        _919 = _877;
    }
    float _923 = _919;
    float _925 = _923;
    if (!_871)
    {
        _921 = _877;
    }
    float _927 = _921;
    float _929 = fma(_903, _903, _917);
    float _931 = rsqrt(_929);
    float _933 = _927;
    if (_915)
    {
        float _935 = -_923;
        float _937 = _935 + 1.0;
        _925 = _937;
    }
    float _939 = _925;
    if (_871)
    {
        _933 = _939;
    }
    float _941 = _933;
    float _943 = _754 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _945 = _378 != 0.0;
    bool _947 = isnan(_378);
    bool _949 = _945 || _947;
    bool _951 = isnan(0.0);
    bool _953 = _949 || _951;
    float _955 = _941 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _957 = _384 == 0.0;
    bool _959 = !_953;
    bool _961 = _957 && _959;
    float _963 = exp2(_943);
    float _965 = _955 * _909;
    bool _967 = _364 == 0.0;
    bool _969 = _967 && _961;
    float _971 = _907 * _931;
    float _973 = _905 * _931;
    float _975 = _903 * _931;
    out.m_65.x = _965;
    float _977 = _881 + _776;
    float _979 = _973;
    float _981 = _971;
    float _983 = _975;
    if (!_969)
    {
        float _985 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[17].y, _973);
        _979 = _985;
    }
    float _987 = _979;
    if (!_969)
    {
        float _989 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[17].y, _971);
        _981 = _989;
    }
    float _991 = _981;
    float _993 = -_963;
    float _995 = _993 + 1.0;
    if (!_969)
    {
        float _997 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[17].y, _975);
        _983 = _997;
    }
    float _999 = _983;
    float _1001 = _987 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1003 = _987 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1005 = _987 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1007 = _995 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1009 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1001);
    float _1011 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1003);
    float _1013 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1005);
    float _1015 = _977 * 0.5;
    float _1017 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1009);
    float _1019 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1011);
    float _1021 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1013);
    bool _1023 = _548 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1025 = isnan(_548);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1031 = _1027 || _1029;
    out.m_67.z = _1015;
    out.m_67.w = _776;
    out.m_69.x = _1017;
    out.m_69.y = _1019;
    out.m_69.z = _1021;
    out.gl_Position.x = _810;
    out.gl_Position.y = _812;
    out.gl_Position.z = _881;
    out.gl_Position.w = _776;
    float _1033 = _810;
    if (!_1031)
    {
        _885 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1035 = _885;
    float _1037 = _1035;
    float _1039 = _1035;
    if (!_1031)
    {
        _887 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1041 = _887;
    float _1043 = _1041;
    float _1045 = _1041;
    if (!_1031)
    {
        _889 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1047 = _889;
    float _1049 = _1047;
    float _1051 = _1047;
    if (!_1031)
    {
        _1033 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1053 = _1033;
    float _1055 = _1007 * _834;
    float _1057 = -_1007;
    float _1059 = _1057 + 1.0;
    float _1061 = _845 * _1055;
    float _1063 = _845 * _1059;
    float _1065 = _863 * _1055;
    float _1067 = fma(_859, _1061, _839);
    float _1069 = fma(_861, _1061, _841);
    float _1071 = _1055;
    float _1073 = _843;
    float _1075 = _1053;
    float _1077 = _1053;
    if (!_1031)
    {
        _1071 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1079 = _1071;
    float _1081 = fma(_845, _1065, _843);
    float _1083 = _1079;
    float _1085 = _1079;
    if (!_1031)
    {
        _1073 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1087 = _1073;
    out.m_71.x = _1067;
    out.m_71.y = _1069;
    out.m_71.z = _1081;
    out.m_71.w = _1063;
    bool _1089 = !_1031;
    float _1091 = _1087;
    float _1093 = _1087;
    if (!_1089)
    {
        bool _1095 = _548 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1097 = isnan(_548);
        bool _1099 = _1095 || _1097;
        bool _1101 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1103 = _1099 || _1101;
        if (!_1103)
        {
            float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1107 = _548 + _1105;
            float _1109 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1111 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1109;
            float _1113 = 1.0 / _1111;
            float _1115 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1117 = _1115 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1121 = _1119 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1125 = _1123 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1127 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1129 = _1127 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1133 = _1131 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1135 = _1107 * _1113;
            float _1137 = precise::clamp(_1135, 0.0, 1.0);
            float _1139 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1141 = _1139 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1143 = fma(_1137, _1117, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1145 = fma(_1137, _1141, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1147 = fma(_1137, _1121, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1149 = fma(_1137, _1125, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1151 = fma(_1137, _1129, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1153 = fma(_1137, _1133, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1039 = _1145;
            _1077 = _1151;
            _1093 = _1143;
            _1051 = _1149;
            _1045 = _1147;
            _1085 = _1153;
            _1155 = true;
        }
        else
        {
            bool _1157 = _548 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1159 = isnan(_548);
            bool _1161 = _1157 || _1159;
            bool _1163 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1165 = _1161 || _1163;
            if (!_1165)
            {
                _1091 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1167 = _1091;
            _1093 = _1167;
            if (!_1165)
            {
                _1037 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1169 = _1037;
            _1039 = _1169;
            if (!_1165)
            {
                _1043 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1171 = _1043;
            _1045 = _1171;
            if (!_1165)
            {
                _1049 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1173 = _1049;
            _1051 = _1173;
            if (!_1165)
            {
                _1075 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1175 = _1075;
            _1077 = _1175;
            if (!_1165)
            {
                _1083 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1177 = _1083;
            bool _1179 = !_1165;
            _1085 = _1177;
            if (!_1179)
            {
                bool _1181 = _548 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1183 = isnan(_548);
                bool _1185 = _1181 || _1183;
                bool _1187 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1189 = _1185 || _1187;
                if (!_1189)
                {
                    float _1191 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1193 = _548 + _1191;
                    float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1197 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1195;
                    float _1199 = 1.0 / _1197;
                    float _1201 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1203 = _1201 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1205 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1207 = _1205 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1209 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1211 = _1209 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1213 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1215 = _1213 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1217 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1219 = _1217 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1221 = _1193 * _1199;
                    float _1223 = precise::clamp(_1221, 0.0, 1.0);
                    float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1227 = _1225 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1229 = fma(_1223, _1203, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1231 = fma(_1223, _1227, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1233 = fma(_1223, _1207, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1235 = fma(_1223, _1211, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1237 = fma(_1223, _1215, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1239 = fma(_1223, _1219, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1039 = _1231;
                    _1077 = _1237;
                    _1093 = _1229;
                    _1051 = _1235;
                    _1045 = _1233;
                    _1085 = _1239;
                    _1155 = true;
                }
                else
                {
                    _1039 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1077 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1093 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1051 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1045 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1085 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1155 = false;
    float _1241 = _1039;
    float _1243 = _1077;
    float _1245 = _1093;
    float _1247 = _1051;
    float _1249 = _1045;
    float _1251 = _1085;
    float _1253 = fma(_1019, -0.5, 0.5);
    float _1255 = precise::clamp(_1253, 0.0, 1.0);
    float _1257 = -_1241;
    float _1259 = _1257 + _1243;
    float _1261 = -_1245;
    float _1263 = _1261 + _1247;
    float _1265 = -_1249;
    float _1267 = _1265 + _1251;
    bool _1269 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1271 = fma(_1255, _1259, _1241);
    float _1273 = fma(_1255, _1263, _1245);
    float _1275 = fma(_1255, _1267, _1249);
    float _1277 = _1271 * 0.586610972881317138671875;
    out.m_73.x = 0.0;
    float _1279 = fma(_1273, 0.298911988735198974609375, _1277);
    out.m_75.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1281 = fma(_1275, 0.114477999508380889892578125, _1279);
    out.m_47.x = 1.0;
    float _1283 = -_1281;
    float _1285 = _1273 + _1283;
    float _1287 = -_1281;
    float _1289 = _1271 + _1287;
    float _1291 = -_1281;
    float _1293 = _1275 + _1291;
    float _1295 = fma(_1285, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1281);
    float _1297 = fma(_1289, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1281);
    float _1299 = fma(_1293, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1281);
    out.m_77.x = 0.0;
    out.m_79.x = _1295;
    out.m_79.y = _1297;
    out.m_79.z = _1299;
    if (!_1269)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1301 = -_520;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1305 = -_522;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1309 = -_524;
    float _1311 = _1309 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1313 = _1303 * _1303;
    float _1315 = fma(_1307, _1307, _1313);
    float _1317 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _1319 = precise::clamp(_1317, 0.0, 1.0);
    float _1321 = fma(_1311, _1311, _1315);
    float _1323 = _1319 * _1319;
    float _1325 = rsqrt(_1321);
    float _1327 = _1303 * _1325;
    float _1329 = _1307 * _1325;
    float _1331 = _1311 * _1325;
    float _1333 = sqrt(_1321);
    float _1335 = -_554;
    float _1337 = _1335 + _1327;
    float _1339 = -_550;
    float _1341 = _1339 + _1329;
    float _1343 = -_552;
    float _1345 = _1343 + _1331;
    float _1347 = _1337 * _1337;
    float _1349 = fma(_1341, _1341, _1347);
    float _1351 = fma(_1345, _1345, _1349);
    float _1353 = -_1333;
    float _1355 = _1353 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1357 = rsqrt(_1351);
    float _1359 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1361 = precise::clamp(_1359, 0.0, 1.0);
    float _1363 = abs(_1361);
    float _1365 = log2(_1363);
    float _1367 = _1323 + (-1.0);
    float _1369 = _1337 * _1357;
    float _1371 = _1341 * _1357;
    float _1373 = _1345 * _1357;
    float _1375 = _1019 * _1369;
    float _1377 = _1019 * _1327;
    float _1379 = fma(_1017, _1371, _1375);
    float _1381 = _1365 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1383 = fma(_1017, _1329, _1377);
    float _1385 = fma(_1021, _1373, _1379);
    float _1387 = precise::clamp(_1385, 0.0, 1.0);
    float _1389 = fma(_1021, _1331, _1383);
    float _1391 = precise::clamp(_1389, 0.0, 1.0);
    float _1393 = exp2(_1381);
    float _1395 = _1387 * _1387;
    float _1397 = _1329 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1399 = fma(_1395, _1367, 1.0);
    float _1401 = -_1327;
    float _1403 = -_1397;
    float _1405 = fma(_1401, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1403);
    float _1407 = _1399 * _1399;
    float _1409 = -_1331;
    float _1411 = fma(_1409, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1405);
    float _1413 = 1.0 / _1407;
    float _1415 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1417 = _1411 + _1415;
    float _1419 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1421 = precise::clamp(_1419, 0.0, 1.0);
    float _1423 = _1393 * _1421;
    float _1425 = _1391 * _1423;
    float _1427 = _1323 * _1413;
    float _1429 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1431 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1433 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _1435 = _1425 * _1427;
    float _1437 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1439 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1441 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_73.x = _1429;
    out.m_73.y = _1431;
    out.m_73.z = _1433;
    out.m_77.x = _1437;
    out.m_77.y = _1439;
    out.m_77.z = _1441;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1155 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    float _106 = as_type<float>(_98);
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1499 = as_type<float>(_114);
        out.gl_Position.z = _1499;
    }
    if (!_102)
    {
        return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_128)
    {
        float _134 = float(_98);
        _106 = _134;
    }
    float _136 = _106;
    bool _138 = _132 >= _136;
    bool _140 = !_128;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _116 = as_type<int>(_148);
    }
    int _150 = _116;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1568 = as_type<float>(_150);
        out.gl_Position.z = _1568;
    }
    if (_142)
    {
        return out;
    }
    float _152 = in.m_51.x;
    float _154 = in.m_51.y;
    float _156 = in.m_51.z;
    float _158 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _160 = in.m_53.w;
    float _162 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _162;
    float _166 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _168 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _166;
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _164 * _164;
    float _178 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _180 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _178;
    bool _182 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _184 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _186 = _182 || _184;
    bool _188 = isnan(1.0);
    bool _190 = _186 || _188;
    float _192 = in.m_44.x;
    float _194 = in.m_44.y;
    float _196 = in.m_44.z;
    float _198 = fma(_168, _168, _176);
    float _200 = fma(_180, _180, _198);
    float _202 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _204 = _152 * 18.84955596923828125;
    float _206 = sqrt(_200);
    float _208 = fma(_152, 12.56637096405029296875, _202);
    float _210 = _204 * 0.15915493667125701904296875;
    float _212 = in.m_53.x;
    float _214 = in.m_53.y;
    float _216 = in.m_53.z;
    float _218 = _208 * 0.15915493667125701904296875;
    float _220 = _210 * 6.283185482025146484375;
    float _222 = sin(_220);
    float _224 = precise::max(_206, 50.0);
    float _226 = _218 * 6.283185482025146484375;
    float _228 = cos(_226);
    float _230 = _206;
    float _232 = _158;
    if (!_190)
    {
        float _234 = _158 * _158;
        float _236 = _234 * 0.5;
        _230 = _236;
    }
    float _238 = _230;
    float _240 = precise::min(_224, 100.0);
    float _242 = _238;
    if (!_190)
    {
        float _244 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _242 = _244;
    }
    float _246 = _242;
    float _248 = fma(_222, 0.362500011920928955078125, 1.1375000476837158203125);
    bool _250 = !_190;
    float _252 = _246;
    if (!_250)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _264 = _158 * _256;
        float _266 = 1.0 / _260;
        float _268 = _262 * 0.693147182464599609375;
        float _270 = exp2(_264);
        float _272 = 1.0 / _268;
        float _274 = _270 + (-1.0);
        float _276 = -_274;
        float _278 = fma(_276, _272, _158);
        float _280 = _278 * _266;
        float _282 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _252 = _282;
    }
    float _284 = _252;
    bool _286 = !_190;
    if (!_286)
    {
        float _288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = log2(_288);
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = 1.0 / _294;
        float _298 = _158 * _290;
        float _300 = exp2(_298);
        float _302 = -_300;
        float _304 = _302 + 1.0;
        float _306 = _304 * _296;
        _232 = _306;
    }
    float _308 = _232;
    float _310 = _218 * 6.283185482025146484375;
    float _312 = sin(_310);
    float _314 = fma(_240, 0.014999999664723873138427734375, -0.5);
    float _316 = _152 * 6.283185482025146484375;
    float _318 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _320 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _322 = _314 * _248;
    float _324 = _316 * 0.15915493667125701904296875;
    float _326 = fma(_308, _170, _318);
    float _328 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _330 = _322 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _332 = _324 * 6.283185482025146484375;
    float _334 = cos(_332);
    float _336 = fma(_308, _174, _320);
    float _338 = fma(_308, _172, _328);
    float _340 = _156 * _330;
    float _342 = fma(_326, _160, _192);
    float _344 = fma(_338, _160, _194);
    float _346 = _154 * _330;
    float _348 = _324 * 6.283185482025146484375;
    float _350 = sin(_348);
    float _352 = _340 * _312;
    float _354 = _340 * _228;
    float _356 = _216 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = _214 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = -_352;
    float _362 = fma(_346, _228, _360);
    float _364 = fma(_346, _312, _354);
    float _366 = fma(_336, _160, _196);
    float _368 = _356 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _370 = _362 + 0.5;
    float _372 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _364);
    float _374 = _212 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _378 = _370 * _334;
    float _380 = _368 * _372;
    float _382 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _384 = _370 * _350;
    float _386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _378);
    float _388 = _344 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _390 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _384);
    float _392 = _376 * _386;
    float _394 = _344 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _396 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _388);
    float _398 = _382 * _390;
    float _400 = _392 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _402 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _394);
    float _404 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    float _406 = _392 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[10].x, _400);
    float _410 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].z, _402);
    float _412 = _404 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _414 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[8].x, _406);
    float _416 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[10].z, _408);
    float _418 = _410 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _420 = _392 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _422 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[8].z, _414);
    float _424 = _412 + _416;
    float _426 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[9].x, _420);
    float _428 = _418 + _422;
    float _430 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _432 = _424 + _430;
    float _434 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[9].z, _426);
    float _436 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _438 = _428 + _436;
    float _440 = _432 * _432;
    float _442 = fma(_438, _438, _440);
    float _444 = _344 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _446 = sqrt(_442);
    float _448 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _444);
    float _450 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].z, _448);
    float _452 = _450 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _454 = _452 + _434;
    bool _456 = _446 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _458 = _452;
    float _460 = _392;
    float _462 = _450;
    float _464 = _446;
    float _466 = _454;
    float _468 = _344;
    if (!_456)
    {
        _458 = _428;
    }
    float _470 = _458;
    float _472 = _470;
    if (!_456)
    {
        _460 = _424;
    }
    float _474 = _460;
    float _476 = _474;
    if (!_456)
    {
        _462 = _454;
    }
    float _478 = _462;
    bool _480 = !_456;
    float _482 = _478;
    if (!_480)
    {
        float _484 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _486 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _488 = _446 + _486;
        float _490 = _454 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _492 = rsqrt(_442);
        float _494 = _488 * _484;
        float _496 = _494 * 0.15915493667125701904296875;
        float _498 = _496 * 6.283185482025146484375;
        float _500 = cos(_498);
        float _502 = _496 * 6.283185482025146484375;
        float _504 = sin(_502);
        float _506 = _500 + (-1.0);
        float _508 = _506 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _510 = fma(_504, _490, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _512 = fma(_454, _500, _508);
        float _514 = _492 * _510;
        float _516 = fma(_438, _514, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _518 = fma(_432, _514, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _482 = _512;
        _472 = _516;
        _476 = _518;
        _464 = _496;
    }
    float _520 = _482;
    float _522 = _472;
    float _524 = _476;
    float _526 = _464;
    float _528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _530 = _520 + _528;
    float _532 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _534 = _522 + _532;
    float _536 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _538 = _524 + _536;
    float _540 = _530 * _530;
    float _542 = fma(_534, _534, _540);
    float _544 = fma(_538, _538, _542);
    float _546 = rsqrt(_544);
    float _548 = sqrt(_544);
    float _550 = _534 * _546;
    float _552 = _538 * _546;
    float _554 = _530 * _546;
    float _556 = _550 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _558 = _552 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _560 = _556 * _556;
    float _562 = _558 * _558;
    float _564 = _560 + _562;
    float _566 = sqrt(_564);
    bool _568 = _566 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _570 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _572 = _566 + _570;
    float _574 = _526;
    float _576 = _572;
    float _578 = _556;
    if (_568)
    {
        float _580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _574 = _580;
    }
    float _582 = _574;
    if (_568)
    {
        float _584 = rsqrt(_564);
        _466 = _584;
    }
    float _586 = _466;
    float _588 = _586;
    if (_568)
    {
        float _590 = _572 * _582;
        _576 = _590;
    }
    float _592 = _576;
    if (_568)
    {
        float _594 = _592 * 0.15915493667125701904296875;
        _468 = _594;
    }
    float _596 = _468;
    float _598 = _582;
    if (_568)
    {
        float _600 = _596 * 6.283185482025146484375;
        float _602 = sin(_600);
        _598 = _602;
    }
    float _604 = _598;
    float _606 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _608 = precise::max(0.0, _606);
    float _610 = _366;
    float _612 = _606;
    float _614 = _608;
    if (_568)
    {
        float _616 = _596 * 6.283185482025146484375;
        float _618 = cos(_616);
        _610 = _618;
    }
    float _620 = _610;
    float _622 = -_554;
    float _624 = -_608;
    float _626 = fma(_622, (*spvDescriptorSet0.vp_c15)._m0[24].y, _624);
    if (_568)
    {
        float _628 = _626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _612 = _628;
    }
    float _630 = _612;
    float _632 = _630;
    float _634 = _604;
    if (_568)
    {
        float _636 = fma(_604, _630, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _632 = _636;
    }
    float _638 = _632;
    float _640 = _638;
    if (!_568)
    {
        _634 = _626;
    }
    float _642 = _634;
    float _644 = _642;
    float _646 = _620;
    if (_568)
    {
        float _648 = _620 + (-1.0);
        _614 = _648;
    }
    float _650 = _614;
    float _652 = 0.0;
    float _654 = _650;
    if (_568)
    {
        float _656 = _586 * _638;
        _652 = _656;
    }
    float _658 = _652;
    if (!_568)
    {
        _640 = _560;
    }
    float _660 = _640;
    float _662 = _520 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _664 = _660;
    if (_568)
    {
        float _666 = _650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _588 = _666;
    }
    float _668 = _588;
    if (_568)
    {
        float _670 = _556 * _658;
        _578 = _670;
    }
    float _672 = _578;
    if (!_568)
    {
        _654 = _558;
    }
    float _674 = _654;
    float _676 = _674;
    if (_568)
    {
        float _678 = _558 * _658;
        _676 = _678;
    }
    float _680 = _676;
    if (_568)
    {
        float _682 = fma(_626, _620, _668);
        _644 = _682;
    }
    float _684 = _644;
    if (_568)
    {
        float _686 = _672 * _672;
        _664 = _686;
    }
    float _688 = _664;
    if (!_568)
    {
        _646 = _562;
    }
    float _690 = _646;
    float _692 = _690;
    if (_568)
    {
        float _694 = _680 * _680;
        _692 = _694;
    }
    float _696 = _692;
    float _698 = _520 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _700 = fma(_684, _684, _688);
    float _702 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[3].x, _662);
    float _704 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[2].x, _698);
    float _706 = _700 + _696;
    float _708 = _520 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _712 = fma(_548, (*spvDescriptorSet0.vp_c15)._m0[23].w, _710);
    float _714 = precise::clamp(_712, 0.0, 1.0);
    float _716 = fma(_524, (*spvDescriptorSet0.vp_c8)._m0[2].z, _704);
    float _718 = rsqrt(_706);
    float _720 = _520 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _722 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[1].x, _708);
    float _724 = _716 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _726 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[0].x, _720);
    float _728 = fma(_524, (*spvDescriptorSet0.vp_c8)._m0[1].z, _722);
    float _730 = -_714;
    float _732 = _730 + 1.0;
    float _734 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _736 = _724 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _738 = fma(_524, (*spvDescriptorSet0.vp_c8)._m0[0].z, _726);
    float _740 = _728 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _742 = fma(_524, (*spvDescriptorSet0.vp_c8)._m0[3].z, _702);
    float _744 = -_736;
    float _746 = fma(_744, _734, 1.0);
    float _748 = _738 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _750 = _740 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _752 = abs(_732);
    float _754 = log2(_752);
    float _756 = _718 * _672;
    float _758 = _742 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _760 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[7].x, _750);
    float _762 = _718 * _684;
    float _764 = _756 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _766 = _718 * _680;
    float _768 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[7].z, _760);
    float _770 = log2(_746);
    float _772 = -_764;
    float _774 = fma(_762, (*spvDescriptorSet0.vp_c15)._m0[21].y, _772);
    float _776 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _768);
    float _778 = _740 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _780 = -_766;
    float _782 = fma(_780, (*spvDescriptorSet0.vp_c15)._m0[21].z, _774);
    float _784 = _740 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _786 = _754 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _788 = fma(_782, -0.5, 0.5);
    float _790 = 1.0 / _776;
    float _792 = fma(_782, 0.5, 0.5);
    float _794 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[4].x, _778);
    float _796 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[5].x, _784);
    float _798 = _762 + 1.0;
    float _800 = fma(_792, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _802 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[4].z, _794);
    float _804 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[5].z, _796);
    float _806 = exp2(_786);
    float _808 = fma(_792, _800, -0.212114393711090087890625);
    float _810 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _802);
    float _812 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _804);
    float _814 = _770 * 0.693147182464599609375;
    float _816 = fma(_792, _808, 1.570728778839111328125);
    float _818 = sqrt(_788);
    float _820 = _810 * _790;
    float _822 = _812 * _790;
    float _824 = _814 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _826 = fma(_820, 0.5, 0.5);
    float _828 = fma(_822, -0.5, 0.5);
    float _830 = -_762;
    float _832 = fma(_806, _798, _830);
    float3 _2684 = float3(_826, _828, _824);
    float _834 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2684, float3(0.0), isnan(_2684)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2684, float3(0.0), isnan(_2684)), level(0.0)).x;
    float3 _2695 = float3(_826, _828, _824);
    float4 _837 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2695, float3(0.0), isnan(_2695)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2695, float3(0.0), isnan(_2695)), level(0.0)).xyzw;
    float _839 = _837.x;
    float _841 = _837.y;
    float _843 = _837.z;
    float _845 = _837.w;
    float _847 = fma(_832, 0.5, 0.5);
    float _849 = _818 * 0.636619746685028076171875;
    float _851 = -_816;
    float _853 = fma(_849, _851, 1.0);
    float2 _2722 = float2(_853, _847);
    float3 _857 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2722, float2(0.0), isnan(_2722)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2722, float2(0.0), isnan(_2722)), level(0.0)).xyz;
    float _859 = _857.x;
    float _861 = _857.y;
    float _863 = _857.z;
    float _865 = in.m_55.z;
    float _867 = _740 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _871 = _869 != 0;
    float _873 = in.m_55.y;
    float _875 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[6].x, _867);
    float _877 = in.m_57.x;
    float _879 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[6].z, _875);
    out.m_59.x = _384;
    out.m_59.y = _378;
    float _881 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _879);
    float _883 = 0.0;
    float _885 = _776;
    float _887 = _881;
    float _889 = _812;
    if (_871)
    {
        float _891 = in.m_61.x;
        _883 = _891;
    }
    float _893 = _883;
    out.m_63.x = _522;
    out.m_63.y = _520;
    out.m_63.z = _524;
    float _895 = _312 * _865;
    float _897 = _228 * _865;
    float _899 = -_895;
    float _901 = fma(_228, _873, _899);
    float _903 = fma(_312, _873, _897);
    float _905 = _901 * _334;
    float _907 = _901 * _350;
    float _909 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _911 = _905 * _905;
    bool _913 = _893 > 0.5;
    bool _915 = _913 && _871;
    float _917 = fma(_907, _907, _911);
    float _919 = _893;
    float _921 = _911;
    if (_871)
    {
        _919 = _877;
    }
    float _923 = _919;
    float _925 = _923;
    if (!_871)
    {
        _921 = _877;
    }
    float _927 = _921;
    float _929 = fma(_903, _903, _917);
    float _931 = rsqrt(_929);
    float _933 = _927;
    if (_915)
    {
        float _935 = -_923;
        float _937 = _935 + 1.0;
        _925 = _937;
    }
    float _939 = _925;
    if (_871)
    {
        _933 = _939;
    }
    float _941 = _933;
    float _943 = _754 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _945 = _378 != 0.0;
    bool _947 = isnan(_378);
    bool _949 = _945 || _947;
    bool _951 = isnan(0.0);
    bool _953 = _949 || _951;
    float _955 = _941 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _957 = _384 == 0.0;
    bool _959 = !_953;
    bool _961 = _957 && _959;
    float _963 = exp2(_943);
    float _965 = _955 * _909;
    bool _967 = _364 == 0.0;
    bool _969 = _967 && _961;
    float _971 = _907 * _931;
    float _973 = _905 * _931;
    float _975 = _903 * _931;
    out.m_65.x = _965;
    float _977 = _881 + _776;
    float _979 = _973;
    float _981 = _971;
    float _983 = _975;
    if (!_969)
    {
        float _985 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[17].y, _973);
        _979 = _985;
    }
    float _987 = _979;
    if (!_969)
    {
        float _989 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[17].y, _971);
        _981 = _989;
    }
    float _991 = _981;
    float _993 = -_963;
    float _995 = _993 + 1.0;
    if (!_969)
    {
        float _997 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[17].y, _975);
        _983 = _997;
    }
    float _999 = _983;
    float _1001 = _987 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1003 = _987 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1005 = _987 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1007 = _995 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1009 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1001);
    float _1011 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1003);
    float _1013 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1005);
    float _1015 = _977 * 0.5;
    float _1017 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1009);
    float _1019 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1011);
    float _1021 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1013);
    bool _1023 = _548 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1025 = isnan(_548);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1031 = _1027 || _1029;
    out.m_67.z = _1015;
    out.m_67.w = _776;
    out.m_69.x = _1017;
    out.m_69.y = _1019;
    out.m_69.z = _1021;
    out.gl_Position.x = _810;
    out.gl_Position.y = _812;
    out.gl_Position.z = _881;
    out.gl_Position.w = _776;
    float _1033 = _810;
    if (!_1031)
    {
        _885 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1035 = _885;
    float _1037 = _1035;
    float _1039 = _1035;
    if (!_1031)
    {
        _887 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1041 = _887;
    float _1043 = _1041;
    float _1045 = _1041;
    if (!_1031)
    {
        _889 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1047 = _889;
    float _1049 = _1047;
    float _1051 = _1047;
    if (!_1031)
    {
        _1033 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1053 = _1033;
    float _1055 = _1007 * _834;
    float _1057 = -_1007;
    float _1059 = _1057 + 1.0;
    float _1061 = _845 * _1055;
    float _1063 = _845 * _1059;
    float _1065 = _863 * _1055;
    float _1067 = fma(_859, _1061, _839);
    float _1069 = fma(_861, _1061, _841);
    float _1071 = _1055;
    float _1073 = _843;
    float _1075 = _1053;
    float _1077 = _1053;
    if (!_1031)
    {
        _1071 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1079 = _1071;
    float _1081 = fma(_845, _1065, _843);
    float _1083 = _1079;
    float _1085 = _1079;
    if (!_1031)
    {
        _1073 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1087 = _1073;
    out.m_71.x = _1067;
    out.m_71.y = _1069;
    out.m_71.z = _1081;
    out.m_71.w = _1063;
    bool _1089 = !_1031;
    float _1091 = _1087;
    float _1093 = _1087;
    if (!_1089)
    {
        bool _1095 = _548 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1097 = isnan(_548);
        bool _1099 = _1095 || _1097;
        bool _1101 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1103 = _1099 || _1101;
        if (!_1103)
        {
            float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1107 = _548 + _1105;
            float _1109 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1111 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1109;
            float _1113 = 1.0 / _1111;
            float _1115 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1117 = _1115 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1121 = _1119 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1125 = _1123 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1127 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1129 = _1127 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1133 = _1131 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1135 = _1107 * _1113;
            float _1137 = precise::clamp(_1135, 0.0, 1.0);
            float _1139 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1141 = _1139 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1143 = fma(_1137, _1117, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1145 = fma(_1137, _1141, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1147 = fma(_1137, _1121, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1149 = fma(_1137, _1125, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1151 = fma(_1137, _1129, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1153 = fma(_1137, _1133, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1039 = _1145;
            _1077 = _1151;
            _1093 = _1143;
            _1051 = _1149;
            _1045 = _1147;
            _1085 = _1153;
            _1155 = true;
        }
        else
        {
            bool _1157 = _548 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1159 = isnan(_548);
            bool _1161 = _1157 || _1159;
            bool _1163 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1165 = _1161 || _1163;
            if (!_1165)
            {
                _1091 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1167 = _1091;
            _1093 = _1167;
            if (!_1165)
            {
                _1037 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1169 = _1037;
            _1039 = _1169;
            if (!_1165)
            {
                _1043 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1171 = _1043;
            _1045 = _1171;
            if (!_1165)
            {
                _1049 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1173 = _1049;
            _1051 = _1173;
            if (!_1165)
            {
                _1075 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1175 = _1075;
            _1077 = _1175;
            if (!_1165)
            {
                _1083 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1177 = _1083;
            bool _1179 = !_1165;
            _1085 = _1177;
            if (!_1179)
            {
                bool _1181 = _548 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1183 = isnan(_548);
                bool _1185 = _1181 || _1183;
                bool _1187 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1189 = _1185 || _1187;
                if (!_1189)
                {
                    float _1191 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1193 = _548 + _1191;
                    float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1197 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1195;
                    float _1199 = 1.0 / _1197;
                    float _1201 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1203 = _1201 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1205 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1207 = _1205 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1209 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1211 = _1209 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1213 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1215 = _1213 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1217 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1219 = _1217 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1221 = _1193 * _1199;
                    float _1223 = precise::clamp(_1221, 0.0, 1.0);
                    float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1227 = _1225 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1229 = fma(_1223, _1203, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1231 = fma(_1223, _1227, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1233 = fma(_1223, _1207, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1235 = fma(_1223, _1211, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1237 = fma(_1223, _1215, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1239 = fma(_1223, _1219, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1039 = _1231;
                    _1077 = _1237;
                    _1093 = _1229;
                    _1051 = _1235;
                    _1045 = _1233;
                    _1085 = _1239;
                    _1155 = true;
                }
                else
                {
                    _1039 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1077 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1093 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1051 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1045 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1085 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1155 = false;
    float _1241 = _1039;
    float _1243 = _1077;
    float _1245 = _1093;
    float _1247 = _1051;
    float _1249 = _1045;
    float _1251 = _1085;
    float _1253 = fma(_1019, -0.5, 0.5);
    float _1255 = precise::clamp(_1253, 0.0, 1.0);
    float _1257 = -_1241;
    float _1259 = _1257 + _1243;
    float _1261 = -_1245;
    float _1263 = _1261 + _1247;
    float _1265 = -_1249;
    float _1267 = _1265 + _1251;
    bool _1269 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1271 = fma(_1255, _1259, _1241);
    float _1273 = fma(_1255, _1263, _1245);
    float _1275 = fma(_1255, _1267, _1249);
    float _1277 = _1271 * 0.586610972881317138671875;
    out.m_73.x = 0.0;
    float _1279 = fma(_1273, 0.298911988735198974609375, _1277);
    out.m_75.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1281 = fma(_1275, 0.114477999508380889892578125, _1279);
    out.m_47.x = 1.0;
    float _1283 = -_1281;
    float _1285 = _1273 + _1283;
    float _1287 = -_1281;
    float _1289 = _1271 + _1287;
    float _1291 = -_1281;
    float _1293 = _1275 + _1291;
    float _1295 = fma(_1285, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1281);
    float _1297 = fma(_1289, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1281);
    float _1299 = fma(_1293, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1281);
    out.m_77.x = 0.0;
    out.m_79.x = _1295;
    out.m_79.y = _1297;
    out.m_79.z = _1299;
    if (!_1269)
    {
        return out;
    }
    float _1301 = -_520;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1305 = -_522;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1309 = -_524;
    float _1311 = _1309 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1313 = _1303 * _1303;
    float _1315 = fma(_1307, _1307, _1313);
    float _1317 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _1319 = precise::clamp(_1317, 0.0, 1.0);
    float _1321 = fma(_1311, _1311, _1315);
    float _1323 = _1319 * _1319;
    float _1325 = rsqrt(_1321);
    float _1327 = _1303 * _1325;
    float _1329 = _1307 * _1325;
    float _1331 = _1311 * _1325;
    float _1333 = sqrt(_1321);
    float _1335 = -_554;
    float _1337 = _1335 + _1327;
    float _1339 = -_550;
    float _1341 = _1339 + _1329;
    float _1343 = -_552;
    float _1345 = _1343 + _1331;
    float _1347 = _1337 * _1337;
    float _1349 = fma(_1341, _1341, _1347);
    float _1351 = fma(_1345, _1345, _1349);
    float _1353 = -_1333;
    float _1355 = _1353 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1357 = rsqrt(_1351);
    float _1359 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1361 = precise::clamp(_1359, 0.0, 1.0);
    float _1363 = abs(_1361);
    float _1365 = log2(_1363);
    float _1367 = _1323 + (-1.0);
    float _1369 = _1337 * _1357;
    float _1371 = _1341 * _1357;
    float _1373 = _1345 * _1357;
    float _1375 = _1019 * _1369;
    float _1377 = _1019 * _1327;
    float _1379 = fma(_1017, _1371, _1375);
    float _1381 = _1365 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1383 = fma(_1017, _1329, _1377);
    float _1385 = fma(_1021, _1373, _1379);
    float _1387 = precise::clamp(_1385, 0.0, 1.0);
    float _1389 = fma(_1021, _1331, _1383);
    float _1391 = precise::clamp(_1389, 0.0, 1.0);
    float _1393 = exp2(_1381);
    float _1395 = _1387 * _1387;
    float _1397 = _1329 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1399 = fma(_1395, _1367, 1.0);
    float _1401 = -_1327;
    float _1403 = -_1397;
    float _1405 = fma(_1401, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1403);
    float _1407 = _1399 * _1399;
    float _1409 = -_1331;
    float _1411 = fma(_1409, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1405);
    float _1413 = 1.0 / _1407;
    float _1415 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1417 = _1411 + _1415;
    float _1419 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1421 = precise::clamp(_1419, 0.0, 1.0);
    float _1423 = _1393 * _1421;
    float _1425 = _1391 * _1423;
    float _1427 = _1323 * _1413;
    float _1429 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1431 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1433 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _1435 = _1425 * _1427;
    float _1437 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1439 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1441 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_73.x = _1429;
    out.m_73.y = _1431;
    out.m_73.z = _1433;
    out.m_77.x = _1437;
    out.m_77.y = _1439;
    out.m_77.z = _1441;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1155 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    float _106 = as_type<float>(_98);
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1499 = as_type<float>(_114);
        out.gl_Position.z = _1499;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_128)
    {
        float _134 = float(_98);
        _106 = _134;
    }
    float _136 = _106;
    bool _138 = _132 >= _136;
    bool _140 = !_128;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _116 = as_type<int>(_148);
    }
    int _150 = _116;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1568 = as_type<float>(_150);
        out.gl_Position.z = _1568;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_51.x;
    float _154 = in.m_51.y;
    float _156 = in.m_51.z;
    float _158 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _160 = in.m_53.w;
    float _162 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _162;
    float _166 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _168 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _166;
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _164 * _164;
    float _178 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _180 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _178;
    bool _182 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _184 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _186 = _182 || _184;
    bool _188 = isnan(1.0);
    bool _190 = _186 || _188;
    float _192 = in.m_44.x;
    float _194 = in.m_44.y;
    float _196 = in.m_44.z;
    float _198 = fma(_168, _168, _176);
    float _200 = fma(_180, _180, _198);
    float _202 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _204 = _152 * 18.84955596923828125;
    float _206 = sqrt(_200);
    float _208 = fma(_152, 12.56637096405029296875, _202);
    float _210 = _204 * 0.15915493667125701904296875;
    float _212 = in.m_53.x;
    float _214 = in.m_53.y;
    float _216 = in.m_53.z;
    float _218 = _208 * 0.15915493667125701904296875;
    float _220 = _210 * 6.283185482025146484375;
    float _222 = sin(_220);
    float _224 = precise::max(_206, 50.0);
    float _226 = _218 * 6.283185482025146484375;
    float _228 = cos(_226);
    float _230 = _206;
    float _232 = _158;
    if (!_190)
    {
        float _234 = _158 * _158;
        float _236 = _234 * 0.5;
        _230 = _236;
    }
    float _238 = _230;
    float _240 = precise::min(_224, 100.0);
    float _242 = _238;
    if (!_190)
    {
        float _244 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _242 = _244;
    }
    float _246 = _242;
    float _248 = fma(_222, 0.362500011920928955078125, 1.1375000476837158203125);
    bool _250 = !_190;
    float _252 = _246;
    if (!_250)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _264 = _158 * _256;
        float _266 = 1.0 / _260;
        float _268 = _262 * 0.693147182464599609375;
        float _270 = exp2(_264);
        float _272 = 1.0 / _268;
        float _274 = _270 + (-1.0);
        float _276 = -_274;
        float _278 = fma(_276, _272, _158);
        float _280 = _278 * _266;
        float _282 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _252 = _282;
    }
    float _284 = _252;
    bool _286 = !_190;
    if (!_286)
    {
        float _288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = log2(_288);
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = 1.0 / _294;
        float _298 = _158 * _290;
        float _300 = exp2(_298);
        float _302 = -_300;
        float _304 = _302 + 1.0;
        float _306 = _304 * _296;
        _232 = _306;
    }
    float _308 = _232;
    float _310 = _218 * 6.283185482025146484375;
    float _312 = sin(_310);
    float _314 = fma(_240, 0.014999999664723873138427734375, -0.5);
    float _316 = _152 * 6.283185482025146484375;
    float _318 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _320 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _322 = _314 * _248;
    float _324 = _316 * 0.15915493667125701904296875;
    float _326 = fma(_308, _170, _318);
    float _328 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _330 = _322 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _332 = _324 * 6.283185482025146484375;
    float _334 = cos(_332);
    float _336 = fma(_308, _174, _320);
    float _338 = fma(_308, _172, _328);
    float _340 = _156 * _330;
    float _342 = fma(_326, _160, _192);
    float _344 = fma(_338, _160, _194);
    float _346 = _154 * _330;
    float _348 = _324 * 6.283185482025146484375;
    float _350 = sin(_348);
    float _352 = _340 * _312;
    float _354 = _340 * _228;
    float _356 = _216 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = _214 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = -_352;
    float _362 = fma(_346, _228, _360);
    float _364 = fma(_346, _312, _354);
    float _366 = fma(_336, _160, _196);
    float _368 = _356 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _370 = _362 + 0.5;
    float _372 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _364);
    float _374 = _212 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _378 = _370 * _334;
    float _380 = _368 * _372;
    float _382 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _384 = _370 * _350;
    float _386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _378);
    float _388 = _344 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _390 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _384);
    float _392 = _376 * _386;
    float _394 = _344 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _396 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _388);
    float _398 = _382 * _390;
    float _400 = _392 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _402 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _394);
    float _404 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    float _406 = _392 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[10].x, _400);
    float _410 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[4].z, _402);
    float _412 = _404 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _414 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[8].x, _406);
    float _416 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[10].z, _408);
    float _418 = _410 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _420 = _392 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _422 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[8].z, _414);
    float _424 = _412 + _416;
    float _426 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[9].x, _420);
    float _428 = _418 + _422;
    float _430 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _432 = _424 + _430;
    float _434 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[9].z, _426);
    float _436 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _438 = _428 + _436;
    float _440 = _432 * _432;
    float _442 = fma(_438, _438, _440);
    float _444 = _344 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _446 = sqrt(_442);
    float _448 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _444);
    float _450 = fma(_366, (*spvDescriptorSet0.vp_c10)._m0[5].z, _448);
    float _452 = _450 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _454 = _452 + _434;
    bool _456 = _446 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _458 = _452;
    float _460 = _392;
    float _462 = _450;
    float _464 = _446;
    float _466 = _454;
    float _468 = _344;
    if (!_456)
    {
        _458 = _428;
    }
    float _470 = _458;
    float _472 = _470;
    if (!_456)
    {
        _460 = _424;
    }
    float _474 = _460;
    float _476 = _474;
    if (!_456)
    {
        _462 = _454;
    }
    float _478 = _462;
    bool _480 = !_456;
    float _482 = _478;
    if (!_480)
    {
        float _484 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _486 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _488 = _446 + _486;
        float _490 = _454 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _492 = rsqrt(_442);
        float _494 = _488 * _484;
        float _496 = _494 * 0.15915493667125701904296875;
        float _498 = _496 * 6.283185482025146484375;
        float _500 = cos(_498);
        float _502 = _496 * 6.283185482025146484375;
        float _504 = sin(_502);
        float _506 = _500 + (-1.0);
        float _508 = _506 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _510 = fma(_504, _490, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _512 = fma(_454, _500, _508);
        float _514 = _492 * _510;
        float _516 = fma(_438, _514, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _518 = fma(_432, _514, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _482 = _512;
        _472 = _516;
        _476 = _518;
        _464 = _496;
    }
    float _520 = _482;
    float _522 = _472;
    float _524 = _476;
    float _526 = _464;
    float _528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _530 = _520 + _528;
    float _532 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _534 = _522 + _532;
    float _536 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _538 = _524 + _536;
    float _540 = _530 * _530;
    float _542 = fma(_534, _534, _540);
    float _544 = fma(_538, _538, _542);
    float _546 = rsqrt(_544);
    float _548 = sqrt(_544);
    float _550 = _534 * _546;
    float _552 = _538 * _546;
    float _554 = _530 * _546;
    float _556 = _550 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _558 = _552 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _560 = _556 * _556;
    float _562 = _558 * _558;
    float _564 = _560 + _562;
    float _566 = sqrt(_564);
    bool _568 = _566 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _570 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _572 = _566 + _570;
    float _574 = _526;
    float _576 = _572;
    float _578 = _556;
    if (_568)
    {
        float _580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _574 = _580;
    }
    float _582 = _574;
    if (_568)
    {
        float _584 = rsqrt(_564);
        _466 = _584;
    }
    float _586 = _466;
    float _588 = _586;
    if (_568)
    {
        float _590 = _572 * _582;
        _576 = _590;
    }
    float _592 = _576;
    if (_568)
    {
        float _594 = _592 * 0.15915493667125701904296875;
        _468 = _594;
    }
    float _596 = _468;
    float _598 = _582;
    if (_568)
    {
        float _600 = _596 * 6.283185482025146484375;
        float _602 = sin(_600);
        _598 = _602;
    }
    float _604 = _598;
    float _606 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _608 = precise::max(0.0, _606);
    float _610 = _366;
    float _612 = _606;
    float _614 = _608;
    if (_568)
    {
        float _616 = _596 * 6.283185482025146484375;
        float _618 = cos(_616);
        _610 = _618;
    }
    float _620 = _610;
    float _622 = -_554;
    float _624 = -_608;
    float _626 = fma(_622, (*spvDescriptorSet0.vp_c15)._m0[24].y, _624);
    if (_568)
    {
        float _628 = _626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _612 = _628;
    }
    float _630 = _612;
    float _632 = _630;
    float _634 = _604;
    if (_568)
    {
        float _636 = fma(_604, _630, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _632 = _636;
    }
    float _638 = _632;
    float _640 = _638;
    if (!_568)
    {
        _634 = _626;
    }
    float _642 = _634;
    float _644 = _642;
    float _646 = _620;
    if (_568)
    {
        float _648 = _620 + (-1.0);
        _614 = _648;
    }
    float _650 = _614;
    float _652 = 0.0;
    float _654 = _650;
    if (_568)
    {
        float _656 = _586 * _638;
        _652 = _656;
    }
    float _658 = _652;
    if (!_568)
    {
        _640 = _560;
    }
    float _660 = _640;
    float _662 = _520 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _664 = _660;
    if (_568)
    {
        float _666 = _650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _588 = _666;
    }
    float _668 = _588;
    if (_568)
    {
        float _670 = _556 * _658;
        _578 = _670;
    }
    float _672 = _578;
    if (!_568)
    {
        _654 = _558;
    }
    float _674 = _654;
    float _676 = _674;
    if (_568)
    {
        float _678 = _558 * _658;
        _676 = _678;
    }
    float _680 = _676;
    if (_568)
    {
        float _682 = fma(_626, _620, _668);
        _644 = _682;
    }
    float _684 = _644;
    if (_568)
    {
        float _686 = _672 * _672;
        _664 = _686;
    }
    float _688 = _664;
    if (!_568)
    {
        _646 = _562;
    }
    float _690 = _646;
    float _692 = _690;
    if (_568)
    {
        float _694 = _680 * _680;
        _692 = _694;
    }
    float _696 = _692;
    float _698 = _520 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _700 = fma(_684, _684, _688);
    float _702 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[3].x, _662);
    float _704 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[2].x, _698);
    float _706 = _700 + _696;
    float _708 = _520 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _712 = fma(_548, (*spvDescriptorSet0.vp_c15)._m0[23].w, _710);
    float _714 = precise::clamp(_712, 0.0, 1.0);
    float _716 = fma(_524, (*spvDescriptorSet0.vp_c8)._m0[2].z, _704);
    float _718 = rsqrt(_706);
    float _720 = _520 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _722 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[1].x, _708);
    float _724 = _716 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _726 = fma(_522, (*spvDescriptorSet0.vp_c8)._m0[0].x, _720);
    float _728 = fma(_524, (*spvDescriptorSet0.vp_c8)._m0[1].z, _722);
    float _730 = -_714;
    float _732 = _730 + 1.0;
    float _734 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _736 = _724 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _738 = fma(_524, (*spvDescriptorSet0.vp_c8)._m0[0].z, _726);
    float _740 = _728 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _742 = fma(_524, (*spvDescriptorSet0.vp_c8)._m0[3].z, _702);
    float _744 = -_736;
    float _746 = fma(_744, _734, 1.0);
    float _748 = _738 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _750 = _740 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _752 = abs(_732);
    float _754 = log2(_752);
    float _756 = _718 * _672;
    float _758 = _742 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _760 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[7].x, _750);
    float _762 = _718 * _684;
    float _764 = _756 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _766 = _718 * _680;
    float _768 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[7].z, _760);
    float _770 = log2(_746);
    float _772 = -_764;
    float _774 = fma(_762, (*spvDescriptorSet0.vp_c15)._m0[21].y, _772);
    float _776 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _768);
    float _778 = _740 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _780 = -_766;
    float _782 = fma(_780, (*spvDescriptorSet0.vp_c15)._m0[21].z, _774);
    float _784 = _740 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _786 = _754 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _788 = fma(_782, -0.5, 0.5);
    float _790 = 1.0 / _776;
    float _792 = fma(_782, 0.5, 0.5);
    float _794 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[4].x, _778);
    float _796 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[5].x, _784);
    float _798 = _762 + 1.0;
    float _800 = fma(_792, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _802 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[4].z, _794);
    float _804 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[5].z, _796);
    float _806 = exp2(_786);
    float _808 = fma(_792, _800, -0.212114393711090087890625);
    float _810 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _802);
    float _812 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _804);
    float _814 = _770 * 0.693147182464599609375;
    float _816 = fma(_792, _808, 1.570728778839111328125);
    float _818 = sqrt(_788);
    float _820 = _810 * _790;
    float _822 = _812 * _790;
    float _824 = _814 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _826 = fma(_820, 0.5, 0.5);
    float _828 = fma(_822, -0.5, 0.5);
    float _830 = -_762;
    float _832 = fma(_806, _798, _830);
    float3 _2684 = float3(_826, _828, _824);
    float _834 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2684, float3(0.0), isnan(_2684)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2684, float3(0.0), isnan(_2684)), level(0.0)).x;
    float3 _2695 = float3(_826, _828, _824);
    float4 _837 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2695, float3(0.0), isnan(_2695)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2695, float3(0.0), isnan(_2695)), level(0.0)).xyzw;
    float _839 = _837.x;
    float _841 = _837.y;
    float _843 = _837.z;
    float _845 = _837.w;
    float _847 = fma(_832, 0.5, 0.5);
    float _849 = _818 * 0.636619746685028076171875;
    float _851 = -_816;
    float _853 = fma(_849, _851, 1.0);
    float2 _2722 = float2(_853, _847);
    float3 _857 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2722, float2(0.0), isnan(_2722)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2722, float2(0.0), isnan(_2722)), level(0.0)).xyz;
    float _859 = _857.x;
    float _861 = _857.y;
    float _863 = _857.z;
    float _865 = in.m_55.z;
    float _867 = _740 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _871 = _869 != 0;
    float _873 = in.m_55.y;
    float _875 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[6].x, _867);
    float _877 = in.m_57.x;
    float _879 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[6].z, _875);
    out.m_59.x = _384;
    out.m_59.y = _378;
    float _881 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _879);
    float _883 = 0.0;
    float _885 = _776;
    float _887 = _881;
    float _889 = _812;
    if (_871)
    {
        float _891 = in.m_61.x;
        _883 = _891;
    }
    float _893 = _883;
    out.m_63.x = _522;
    out.m_63.y = _520;
    out.m_63.z = _524;
    float _895 = _312 * _865;
    float _897 = _228 * _865;
    float _899 = -_895;
    float _901 = fma(_228, _873, _899);
    float _903 = fma(_312, _873, _897);
    float _905 = _901 * _334;
    float _907 = _901 * _350;
    float _909 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _911 = _905 * _905;
    bool _913 = _893 > 0.5;
    bool _915 = _913 && _871;
    float _917 = fma(_907, _907, _911);
    float _919 = _893;
    float _921 = _911;
    if (_871)
    {
        _919 = _877;
    }
    float _923 = _919;
    float _925 = _923;
    if (!_871)
    {
        _921 = _877;
    }
    float _927 = _921;
    float _929 = fma(_903, _903, _917);
    float _931 = rsqrt(_929);
    float _933 = _927;
    if (_915)
    {
        float _935 = -_923;
        float _937 = _935 + 1.0;
        _925 = _937;
    }
    float _939 = _925;
    if (_871)
    {
        _933 = _939;
    }
    float _941 = _933;
    float _943 = _754 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _945 = _378 != 0.0;
    bool _947 = isnan(_378);
    bool _949 = _945 || _947;
    bool _951 = isnan(0.0);
    bool _953 = _949 || _951;
    float _955 = _941 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _957 = _384 == 0.0;
    bool _959 = !_953;
    bool _961 = _957 && _959;
    float _963 = exp2(_943);
    float _965 = _955 * _909;
    bool _967 = _364 == 0.0;
    bool _969 = _967 && _961;
    float _971 = _907 * _931;
    float _973 = _905 * _931;
    float _975 = _903 * _931;
    out.m_65.x = _965;
    float _977 = _881 + _776;
    float _979 = _973;
    float _981 = _971;
    float _983 = _975;
    if (!_969)
    {
        float _985 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[17].y, _973);
        _979 = _985;
    }
    float _987 = _979;
    if (!_969)
    {
        float _989 = fma(_384, (*spvDescriptorSet0.vp_c9)._m0[17].y, _971);
        _981 = _989;
    }
    float _991 = _981;
    float _993 = -_963;
    float _995 = _993 + 1.0;
    if (!_969)
    {
        float _997 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[17].y, _975);
        _983 = _997;
    }
    float _999 = _983;
    float _1001 = _987 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1003 = _987 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1005 = _987 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1007 = _995 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1009 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1001);
    float _1011 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1003);
    float _1013 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1005);
    float _1015 = _977 * 0.5;
    float _1017 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1009);
    float _1019 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1011);
    float _1021 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1013);
    bool _1023 = _548 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1025 = isnan(_548);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1031 = _1027 || _1029;
    out.m_67.z = _1015;
    out.m_67.w = _776;
    out.m_69.x = _1017;
    out.m_69.y = _1019;
    out.m_69.z = _1021;
    out.gl_Position.x = _810;
    out.gl_Position.y = _812;
    out.gl_Position.z = _881;
    out.gl_Position.w = _776;
    float _1033 = _810;
    if (!_1031)
    {
        _885 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1035 = _885;
    float _1037 = _1035;
    float _1039 = _1035;
    if (!_1031)
    {
        _887 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1041 = _887;
    float _1043 = _1041;
    float _1045 = _1041;
    if (!_1031)
    {
        _889 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1047 = _889;
    float _1049 = _1047;
    float _1051 = _1047;
    if (!_1031)
    {
        _1033 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1053 = _1033;
    float _1055 = _1007 * _834;
    float _1057 = -_1007;
    float _1059 = _1057 + 1.0;
    float _1061 = _845 * _1055;
    float _1063 = _845 * _1059;
    float _1065 = _863 * _1055;
    float _1067 = fma(_859, _1061, _839);
    float _1069 = fma(_861, _1061, _841);
    float _1071 = _1055;
    float _1073 = _843;
    float _1075 = _1053;
    float _1077 = _1053;
    if (!_1031)
    {
        _1071 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1079 = _1071;
    float _1081 = fma(_845, _1065, _843);
    float _1083 = _1079;
    float _1085 = _1079;
    if (!_1031)
    {
        _1073 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1087 = _1073;
    out.m_71.x = _1067;
    out.m_71.y = _1069;
    out.m_71.z = _1081;
    out.m_71.w = _1063;
    bool _1089 = !_1031;
    float _1091 = _1087;
    float _1093 = _1087;
    if (!_1089)
    {
        bool _1095 = _548 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1097 = isnan(_548);
        bool _1099 = _1095 || _1097;
        bool _1101 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1103 = _1099 || _1101;
        if (!_1103)
        {
            float _1105 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1107 = _548 + _1105;
            float _1109 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1111 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1109;
            float _1113 = 1.0 / _1111;
            float _1115 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1117 = _1115 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1119 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1121 = _1119 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1123 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1125 = _1123 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1127 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1129 = _1127 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1131 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1133 = _1131 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1135 = _1107 * _1113;
            float _1137 = precise::clamp(_1135, 0.0, 1.0);
            float _1139 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1141 = _1139 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1143 = fma(_1137, _1117, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1145 = fma(_1137, _1141, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1147 = fma(_1137, _1121, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1149 = fma(_1137, _1125, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1151 = fma(_1137, _1129, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1153 = fma(_1137, _1133, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1039 = _1145;
            _1077 = _1151;
            _1093 = _1143;
            _1051 = _1149;
            _1045 = _1147;
            _1085 = _1153;
            _1155 = true;
        }
        else
        {
            bool _1157 = _548 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1159 = isnan(_548);
            bool _1161 = _1157 || _1159;
            bool _1163 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1165 = _1161 || _1163;
            if (!_1165)
            {
                _1091 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1167 = _1091;
            _1093 = _1167;
            if (!_1165)
            {
                _1037 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1169 = _1037;
            _1039 = _1169;
            if (!_1165)
            {
                _1043 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1171 = _1043;
            _1045 = _1171;
            if (!_1165)
            {
                _1049 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1173 = _1049;
            _1051 = _1173;
            if (!_1165)
            {
                _1075 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1175 = _1075;
            _1077 = _1175;
            if (!_1165)
            {
                _1083 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1177 = _1083;
            bool _1179 = !_1165;
            _1085 = _1177;
            if (!_1179)
            {
                bool _1181 = _548 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1183 = isnan(_548);
                bool _1185 = _1181 || _1183;
                bool _1187 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1189 = _1185 || _1187;
                if (!_1189)
                {
                    float _1191 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1193 = _548 + _1191;
                    float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1197 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1195;
                    float _1199 = 1.0 / _1197;
                    float _1201 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1203 = _1201 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1205 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1207 = _1205 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1209 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1211 = _1209 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1213 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1215 = _1213 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1217 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1219 = _1217 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1221 = _1193 * _1199;
                    float _1223 = precise::clamp(_1221, 0.0, 1.0);
                    float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1227 = _1225 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1229 = fma(_1223, _1203, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1231 = fma(_1223, _1227, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1233 = fma(_1223, _1207, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1235 = fma(_1223, _1211, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1237 = fma(_1223, _1215, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1239 = fma(_1223, _1219, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1039 = _1231;
                    _1077 = _1237;
                    _1093 = _1229;
                    _1051 = _1235;
                    _1045 = _1233;
                    _1085 = _1239;
                    _1155 = true;
                }
                else
                {
                    _1039 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1077 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1093 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1051 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1045 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1085 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1155 = false;
    float _1241 = _1039;
    float _1243 = _1077;
    float _1245 = _1093;
    float _1247 = _1051;
    float _1249 = _1045;
    float _1251 = _1085;
    float _1253 = fma(_1019, -0.5, 0.5);
    float _1255 = precise::clamp(_1253, 0.0, 1.0);
    float _1257 = -_1241;
    float _1259 = _1257 + _1243;
    float _1261 = -_1245;
    float _1263 = _1261 + _1247;
    float _1265 = -_1249;
    float _1267 = _1265 + _1251;
    bool _1269 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1271 = fma(_1255, _1259, _1241);
    float _1273 = fma(_1255, _1263, _1245);
    float _1275 = fma(_1255, _1267, _1249);
    float _1277 = _1271 * 0.586610972881317138671875;
    out.m_73.x = 0.0;
    float _1279 = fma(_1273, 0.298911988735198974609375, _1277);
    out.m_75.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1281 = fma(_1275, 0.114477999508380889892578125, _1279);
    out.m_47.x = 1.0;
    float _1283 = -_1281;
    float _1285 = _1273 + _1283;
    float _1287 = -_1281;
    float _1289 = _1271 + _1287;
    float _1291 = -_1281;
    float _1293 = _1275 + _1291;
    float _1295 = fma(_1285, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1281);
    float _1297 = fma(_1289, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1281);
    float _1299 = fma(_1293, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1281);
    out.m_77.x = 0.0;
    out.m_79.x = _1295;
    out.m_79.y = _1297;
    out.m_79.z = _1299;
    if (!_1269)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1301 = -_520;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1305 = -_522;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1309 = -_524;
    float _1311 = _1309 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1313 = _1303 * _1303;
    float _1315 = fma(_1307, _1307, _1313);
    float _1317 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _1319 = precise::clamp(_1317, 0.0, 1.0);
    float _1321 = fma(_1311, _1311, _1315);
    float _1323 = _1319 * _1319;
    float _1325 = rsqrt(_1321);
    float _1327 = _1303 * _1325;
    float _1329 = _1307 * _1325;
    float _1331 = _1311 * _1325;
    float _1333 = sqrt(_1321);
    float _1335 = -_554;
    float _1337 = _1335 + _1327;
    float _1339 = -_550;
    float _1341 = _1339 + _1329;
    float _1343 = -_552;
    float _1345 = _1343 + _1331;
    float _1347 = _1337 * _1337;
    float _1349 = fma(_1341, _1341, _1347);
    float _1351 = fma(_1345, _1345, _1349);
    float _1353 = -_1333;
    float _1355 = _1353 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1357 = rsqrt(_1351);
    float _1359 = _1355 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1361 = precise::clamp(_1359, 0.0, 1.0);
    float _1363 = abs(_1361);
    float _1365 = log2(_1363);
    float _1367 = _1323 + (-1.0);
    float _1369 = _1337 * _1357;
    float _1371 = _1341 * _1357;
    float _1373 = _1345 * _1357;
    float _1375 = _1019 * _1369;
    float _1377 = _1019 * _1327;
    float _1379 = fma(_1017, _1371, _1375);
    float _1381 = _1365 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1383 = fma(_1017, _1329, _1377);
    float _1385 = fma(_1021, _1373, _1379);
    float _1387 = precise::clamp(_1385, 0.0, 1.0);
    float _1389 = fma(_1021, _1331, _1383);
    float _1391 = precise::clamp(_1389, 0.0, 1.0);
    float _1393 = exp2(_1381);
    float _1395 = _1387 * _1387;
    float _1397 = _1329 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1399 = fma(_1395, _1367, 1.0);
    float _1401 = -_1327;
    float _1403 = -_1397;
    float _1405 = fma(_1401, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1403);
    float _1407 = _1399 * _1399;
    float _1409 = -_1331;
    float _1411 = fma(_1409, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1405);
    float _1413 = 1.0 / _1407;
    float _1415 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1417 = _1411 + _1415;
    float _1419 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1421 = precise::clamp(_1419, 0.0, 1.0);
    float _1423 = _1393 * _1421;
    float _1425 = _1391 * _1423;
    float _1427 = _1323 * _1413;
    float _1429 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1431 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1433 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _1435 = _1425 * _1427;
    float _1437 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1439 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1441 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_73.x = _1429;
    out.m_73.y = _1431;
    out.m_73.z = _1433;
    out.m_77.x = _1437;
    out.m_77.y = _1439;
    out.m_77.z = _1441;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

