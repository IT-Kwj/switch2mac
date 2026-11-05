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
    float4 m_63 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    float _98 = as_type<float>(_90);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1108 = as_type<float>(_106);
        out.gl_Position.z = _1108;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_120)
    {
        float _126 = float(_90);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1177 = as_type<float>(_142);
        out.gl_Position.z = _1177;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_47.x;
    float _146 = in.m_47.y;
    float _148 = in.m_47.z;
    float _150 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_42.x;
    float _154 = in.m_42.y;
    float _156 = in.m_42.z;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = in.m_51.x;
    float _176 = in.m_51.y;
    float _178 = in.m_51.z;
    float _180 = in.m_51.w;
    float _182 = 0.0;
    float _184 = _150;
    if (!_166)
    {
        float _186 = _150 * _150;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_166)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_166;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _150 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _150);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_166;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _150 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    float _258 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _168);
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _170);
    float _266 = _258 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _268 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _272 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = _266 * _262;
    float _276 = fma(_256, _146, _268);
    float _278 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _270 * _264;
    float _282 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _284 = fma(_276, _180, _154);
    float _286 = fma(_256, _144, _278);
    float _288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _172);
    float _290 = fma(_256, _148, _282);
    float _292 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _294 = fma(_286, _180, _152);
    float _296 = _272 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _298 = fma(_290, _180, _156);
    float _300 = _280 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _302 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _304 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _292);
    float _306 = _296 * _288;
    float _308 = _280 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _310 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[10].x, _300);
    float _312 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _302);
    float _314 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].z, _304);
    float _316 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[8].x, _308);
    float _318 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].z, _310);
    float _320 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _322 = _314 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _324 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _326 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[8].z, _316);
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _322 + _318;
    float _332 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _324);
    float _334 = in.m_53.y;
    float _336 = _328 + _326;
    float _338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _340 = _330 + _338;
    float _342 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].z, _332);
    float _344 = _280 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _346 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _348 = _336 + _346;
    float _350 = _340 * _340;
    float _352 = _342 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _354 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[9].x, _344);
    bool _356 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _358 = isnan(0.5);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _364 = _360 || _362;
    float _366 = fma(_348, _348, _350);
    float _368 = _352 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _370 = _352 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _372 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[9].z, _354);
    float _374 = sqrt(_366);
    float _376 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _368);
    float _378 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _370);
    float _380 = _352 + _372;
    float _382 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _376);
    float _384 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _378);
    float _386 = _314;
    float _388 = _306;
    float _390 = _366;
    if (_364)
    {
        _386 = 1.0;
    }
    float _392 = _386;
    float _394 = _382 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _396 = _384 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _398 = fma(_334, -1.7000000476837158203125, _380);
    float _400 = 1.0 / _394;
    float _402 = _396 + _394;
    bool _404 = _374 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _408 = _406 != 0;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _412 = _410 != 0;
    bool _414 = !_408;
    int _416 = _414 ? 0 : 1;
    bool _418 = !_412;
    int _420 = _418 ? 0 : 1;
    float _422 = _402 * _400;
    float _424 = _422 * 0.5;
    float _426 = _402;
    float _428 = _334;
    float _430 = _394;
    float _432 = _392;
    if (!_404)
    {
        _426 = _336;
    }
    float _434 = _426;
    float _436 = _434;
    if (!_404)
    {
        _428 = _330;
    }
    float _438 = _428;
    float _440 = _438;
    if (!_404)
    {
        _430 = _398;
    }
    float _442 = _430;
    bool _444 = !_404;
    float _446 = _442;
    if (!_444)
    {
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _452 = _374 + _450;
        float _454 = _398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _456 = rsqrt(_366);
        float _458 = _452 * _448;
        float _460 = _458 * 0.15915493667125701904296875;
        float _462 = _460 * 6.283185482025146484375;
        float _464 = cos(_462);
        float _466 = _460 * 6.283185482025146484375;
        float _468 = sin(_466);
        float _470 = _464 + (-1.0);
        float _472 = _470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _474 = fma(_468, _454, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _476 = fma(_398, _464, _472);
        float _478 = _456 * _474;
        float _480 = fma(_348, _478, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _482 = fma(_340, _478, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _446 = _476;
        _436 = _480;
        _440 = _482;
    }
    float _484 = _446;
    float _486 = _436;
    float _488 = _440;
    if (!_364)
    {
        float _490 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _492 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[30].w, _490);
        float _494 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _498 = 1.0 / _492;
        float _500 = 1.0 / _496;
        float _502 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _504 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _506 = fma(_498, _502, _504);
        float _508 = _506 * _500;
        float _510 = precise::clamp(_508, 0.0, 1.0);
        _432 = _510;
    }
    float _512 = _432;
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _516 = _484 + _514;
    float _518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _520 = _486 + _518;
    float _522 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _524 = _488 + _522;
    float _526 = _516 * _516;
    float _528 = fma(_520, _520, _526);
    float _530 = fma(_524, _524, _528);
    float _532 = rsqrt(_530);
    float _534 = _532 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _536 = _520 * _534;
    float _538 = _524 * _534;
    float _540 = _536 * _536;
    float _542 = _538 * _538;
    float _544 = _540 + _542;
    float _546 = sqrt(_544);
    bool _548 = _546 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _550 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _552 = _546 + _550;
    float _554 = _348;
    float _556 = _552;
    float _558 = _516;
    float _560 = _536;
    if (_548)
    {
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _554 = _562;
    }
    float _564 = _554;
    float _566 = _564;
    if (_548)
    {
        float _568 = _552 * _564;
        _556 = _568;
    }
    float _570 = _556;
    if (_548)
    {
        float _572 = rsqrt(_544);
        _566 = _572;
    }
    float _574 = _566;
    float _576 = _574;
    if (_548)
    {
        float _578 = _570 * 0.15915493667125701904296875;
        _388 = _578;
    }
    float _580 = _388;
    float _582 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _584 = _524;
    if (_548)
    {
        float _586 = _580 * 6.283185482025146484375;
        float _588 = sin(_586);
        _584 = _588;
    }
    float _590 = _584;
    float _592 = precise::max(0.0, _582);
    float _594 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _596 = _328;
    float _598 = _592;
    if (_548)
    {
        float _600 = _580 * 6.283185482025146484375;
        float _602 = cos(_600);
        _596 = _602;
    }
    float _604 = _596;
    float _606 = -_534;
    float _608 = -_592;
    float _610 = fma(_516, _606, _608);
    if (_548)
    {
        float _612 = _610 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _558 = _612;
    }
    float _614 = _558;
    float _616 = sqrt(_530);
    float _618 = _590;
    float _620 = _614;
    if (_548)
    {
        float _622 = fma(_590, _614, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _618 = _622;
    }
    float _624 = _618;
    float _626 = _624;
    if (!_548)
    {
        _620 = _610;
    }
    float _628 = _620;
    float _630 = _628;
    if (_548)
    {
        float _632 = _574 * _624;
        _390 = _632;
    }
    float _634 = _390;
    if (!_548)
    {
        _626 = _540;
    }
    float _636 = _626;
    float _638 = _484 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _640 = _636;
    float _642 = _604;
    if (_548)
    {
        float _644 = _604 + (-1.0);
        _598 = _644;
    }
    float _646 = _598;
    float _648 = _646;
    if (_548)
    {
        float _650 = _536 * _634;
        _560 = _650;
    }
    float _652 = _560;
    float _654 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[3].x, _638);
    if (_548)
    {
        float _656 = _646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _576 = _656;
    }
    float _658 = _576;
    if (!_548)
    {
        _648 = _538;
    }
    float _660 = _648;
    float _662 = _660;
    if (_548)
    {
        float _664 = _538 * _634;
        _662 = _664;
    }
    float _666 = _662;
    if (_548)
    {
        float _668 = _652 * _652;
        _640 = _668;
    }
    float _670 = _640;
    if (_548)
    {
        float _672 = fma(_610, _604, _658);
        _630 = _672;
    }
    float _674 = _630;
    if (!_548)
    {
        _642 = _542;
    }
    float _676 = _642;
    float _678 = _676;
    if (_548)
    {
        float _680 = _666 * _666;
        _678 = _680;
    }
    float _682 = _678;
    float _684 = fma(_674, _674, _670);
    float _686 = _684 + _682;
    float _688 = _484 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _690 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _692 = fma(_616, (*spvDescriptorSet0.vp_c15)._m0[23].w, _690);
    float _694 = precise::clamp(_692, 0.0, 1.0);
    float _696 = _484 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _698 = rsqrt(_686);
    float _700 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[2].x, _688);
    float _702 = -_694;
    float _704 = _702 + 1.0;
    float _706 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[1].x, _696);
    float _708 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[2].z, _700);
    float _710 = _484 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _712 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[1].z, _706);
    float _714 = abs(_704);
    float _716 = log2(_714);
    float _718 = _708 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _720 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[0].x, _710);
    float _722 = _712 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _724 = _718 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _726 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[0].z, _720);
    float _728 = _698 * _652;
    float _730 = _698 * _674;
    float _732 = _726 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _734 = _722 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _736 = _728 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _738 = -_724;
    float _740 = fma(_738, _594, 1.0);
    float _742 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[3].z, _654);
    float _744 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[7].x, _734);
    float _746 = _698 * _666;
    float _748 = -_736;
    float _750 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[21].y, _748);
    float _752 = _742 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _754 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[7].z, _744);
    float _756 = _716 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _758 = -_746;
    float _760 = fma(_758, (*spvDescriptorSet0.vp_c15)._m0[21].z, _750);
    float _762 = _722 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _764 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[7].w, _754);
    float _766 = log2(_740);
    float _768 = fma(_760, -0.5, 0.5);
    float _770 = _722 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _772 = fma(_760, 0.5, 0.5);
    float _774 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[4].x, _762);
    float _776 = _730 + 1.0;
    float _778 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[5].x, _770);
    float _780 = fma(_772, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _782 = exp2(_756);
    float _784 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[4].z, _774);
    float _786 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[5].z, _778);
    float _788 = fma(_772, _780, -0.212114393711090087890625);
    float _790 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[4].w, _784);
    float _792 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[5].w, _786);
    float _794 = fma(_772, _788, 1.570728778839111328125);
    float _796 = 1.0 / _764;
    float _798 = _766 * 0.693147182464599609375;
    float _800 = _798 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _802 = sqrt(_768);
    float _804 = -_730;
    float _806 = fma(_782, _776, _804);
    float _808 = _790 * _796;
    float _810 = _792 * _796;
    float _812 = fma(_806, 0.5, 0.5);
    float _814 = fma(_808, 0.5, 0.5);
    float _816 = fma(_810, -0.5, 0.5);
    float _818 = _802 * 0.636619746685028076171875;
    float3 _2298 = float3(_814, _816, _800);
    float _820 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2298, float3(0.0), isnan(_2298)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2298, float3(0.0), isnan(_2298)), level(0.0)).x;
    float _822 = -_794;
    float _824 = fma(_818, _822, 1.0);
    float3 _2314 = float3(_814, _816, _800);
    float4 _827 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2314, float3(0.0), isnan(_2314)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2314, float3(0.0), isnan(_2314)), level(0.0)).xyzw;
    float _829 = _827.x;
    float _831 = _827.y;
    float _833 = _827.z;
    float _835 = _827.w;
    float2 _2331 = float2(_824, _812);
    float3 _839 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2331, float2(0.0), isnan(_2331)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2331, float2(0.0), isnan(_2331)), level(0.0)).xyz;
    float _841 = _839.x;
    float _843 = _839.y;
    float _845 = _839.z;
    float _847 = in.m_55.x;
    float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _851 = _124 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _853 = _170 != 0.0;
    bool _855 = isnan(_170);
    bool _857 = _853 || _855;
    bool _859 = isnan(0.0);
    bool _861 = _857 || _859;
    float _863 = _716 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _865 = _722 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _867 = _168 == 0.0;
    bool _869 = !_861;
    bool _871 = _867 && _869;
    out.m_57.x = _486;
    out.m_57.y = _484;
    out.m_57.z = _488;
    int _873 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _875 = _873 != 0;
    float _877 = exp2(_863);
    bool _879 = _172 == 0.0;
    bool _881 = _879 && _871;
    float _883 = _851 * _849;
    float _885 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[20].x, _883);
    float _887 = in.m_59.x;
    float _889 = in.m_59.y;
    float _891 = in.m_59.z;
    float _893 = -_877;
    float _895 = _893 + 1.0;
    float _897 = _885 * 6.283185482025146484375;
    float _899 = floor(_885);
    float _901 = _895 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _903 = _897 * 0.15915493667125701904296875;
    float _905 = _903 * 6.283185482025146484375;
    float _907 = cos(_905);
    float _909 = -_899;
    float _911 = _885 + _909;
    float _913 = _887;
    float _915 = _889;
    float _917 = _891;
    if (!_881)
    {
        float _919 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[17].y, _887);
        _913 = _919;
    }
    float _921 = _913;
    bool _923 = !_875;
    int _925 = _923 ? 0 : 1;
    if (!_881)
    {
        float _927 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[17].y, _889);
        _915 = _927;
    }
    float _929 = _915;
    if (!_881)
    {
        float _931 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[17].y, _891);
        _917 = _931;
    }
    float _933 = _917;
    float _935 = fma(_907, 0.5, 0.5);
    int _937 = abs(_925);
    float _939 = _929 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _941 = _929 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _943 = abs(_416);
    float _945 = _929 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _947 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[8].x, _939);
    float _949 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[9].x, _941);
    float _951 = float(_943);
    float _953 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[10].x, _945);
    bool _955 = _911 < 0.5;
    float _957 = float(_955);
    float _959 = -_911;
    float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _963 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[6].x, _865);
    bool _965 = _512 > 0.0;
    bool _967 = isnan(_512);
    bool _969 = _965 || _967;
    bool _971 = isnan(0.0);
    bool _973 = _969 || _971;
    float _975 = abs(_961);
    float _977 = _951 * _975;
    float _979 = -_957;
    float _981 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _983 = float(_937);
    float _985 = -_935;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _989 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[6].z, _963);
    float _991 = in.m_61.w;
    float _993 = fma(_983, _987, _977);
    float _995 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[6].w, _989);
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _999 = abs(_420);
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1003 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1007 = float(_999);
    float _1009 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1015 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[8].z, _947);
    float _1017 = abs(_981);
    float _1019 = fma(_1007, _1017, _993);
    float _1021 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[9].z, _949);
    float _1023 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[10].z, _953);
    out.m_63.x = _1009;
    out.m_63.y = _1013;
    out.m_63.z = _1011;
    float _1025 = _1019 * _1003;
    float _1027 = _995 + _764;
    out.m_65.x = _1015;
    out.m_65.y = _1021;
    out.m_65.z = _1023;
    float _1029 = _1027 * 0.5;
    out.m_67.w = _991;
    float _1031 = _1025 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _790;
    out.gl_Position.y = _792;
    out.gl_Position.z = _995;
    out.gl_Position.w = _764;
    out.m_69.z = _1029;
    out.m_69.w = _764;
    out.m_45.x = _1031;
    float _1033 = _901 * _820;
    float _1035 = -_901;
    float _1037 = _1035 + 1.0;
    float _1039 = _835 * _1033;
    float _1041 = _845 * _1033;
    float _1043 = fma(_841, _1039, _829);
    float _1045 = fma(_843, _1039, _831);
    float _1047 = _835 * _1037;
    float _1049 = fma(_835, _1041, _833);
    out.m_71.x = _1043;
    out.m_71.y = _1045;
    out.m_71.z = _1049;
    out.m_71.w = _1047;
    if (_973)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1051 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1051;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    float _98 = as_type<float>(_90);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1108 = as_type<float>(_106);
        out.gl_Position.z = _1108;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_120)
    {
        float _126 = float(_90);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1177 = as_type<float>(_142);
        out.gl_Position.z = _1177;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_47.x;
    float _146 = in.m_47.y;
    float _148 = in.m_47.z;
    float _150 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_42.x;
    float _154 = in.m_42.y;
    float _156 = in.m_42.z;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = in.m_51.x;
    float _176 = in.m_51.y;
    float _178 = in.m_51.z;
    float _180 = in.m_51.w;
    float _182 = 0.0;
    float _184 = _150;
    if (!_166)
    {
        float _186 = _150 * _150;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_166)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_166;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _150 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _150);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_166;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _150 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    float _258 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _168);
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _170);
    float _266 = _258 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _268 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _272 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = _266 * _262;
    float _276 = fma(_256, _146, _268);
    float _278 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _270 * _264;
    float _282 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _284 = fma(_276, _180, _154);
    float _286 = fma(_256, _144, _278);
    float _288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _172);
    float _290 = fma(_256, _148, _282);
    float _292 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _294 = fma(_286, _180, _152);
    float _296 = _272 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _298 = fma(_290, _180, _156);
    float _300 = _280 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _302 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _304 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _292);
    float _306 = _296 * _288;
    float _308 = _280 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _310 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[10].x, _300);
    float _312 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _302);
    float _314 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].z, _304);
    float _316 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[8].x, _308);
    float _318 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].z, _310);
    float _320 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _322 = _314 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _324 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _326 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[8].z, _316);
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _322 + _318;
    float _332 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _324);
    float _334 = in.m_53.y;
    float _336 = _328 + _326;
    float _338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _340 = _330 + _338;
    float _342 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].z, _332);
    float _344 = _280 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _346 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _348 = _336 + _346;
    float _350 = _340 * _340;
    float _352 = _342 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _354 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[9].x, _344);
    bool _356 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _358 = isnan(0.5);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _364 = _360 || _362;
    float _366 = fma(_348, _348, _350);
    float _368 = _352 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _370 = _352 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _372 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[9].z, _354);
    float _374 = sqrt(_366);
    float _376 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _368);
    float _378 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _370);
    float _380 = _352 + _372;
    float _382 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _376);
    float _384 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _378);
    float _386 = _314;
    float _388 = _306;
    float _390 = _366;
    if (_364)
    {
        _386 = 1.0;
    }
    float _392 = _386;
    float _394 = _382 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _396 = _384 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _398 = fma(_334, -1.7000000476837158203125, _380);
    float _400 = 1.0 / _394;
    float _402 = _396 + _394;
    bool _404 = _374 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _408 = _406 != 0;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _412 = _410 != 0;
    bool _414 = !_408;
    int _416 = _414 ? 0 : 1;
    bool _418 = !_412;
    int _420 = _418 ? 0 : 1;
    float _422 = _402 * _400;
    float _424 = _422 * 0.5;
    float _426 = _402;
    float _428 = _334;
    float _430 = _394;
    float _432 = _392;
    if (!_404)
    {
        _426 = _336;
    }
    float _434 = _426;
    float _436 = _434;
    if (!_404)
    {
        _428 = _330;
    }
    float _438 = _428;
    float _440 = _438;
    if (!_404)
    {
        _430 = _398;
    }
    float _442 = _430;
    bool _444 = !_404;
    float _446 = _442;
    if (!_444)
    {
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _452 = _374 + _450;
        float _454 = _398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _456 = rsqrt(_366);
        float _458 = _452 * _448;
        float _460 = _458 * 0.15915493667125701904296875;
        float _462 = _460 * 6.283185482025146484375;
        float _464 = cos(_462);
        float _466 = _460 * 6.283185482025146484375;
        float _468 = sin(_466);
        float _470 = _464 + (-1.0);
        float _472 = _470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _474 = fma(_468, _454, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _476 = fma(_398, _464, _472);
        float _478 = _456 * _474;
        float _480 = fma(_348, _478, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _482 = fma(_340, _478, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _446 = _476;
        _436 = _480;
        _440 = _482;
    }
    float _484 = _446;
    float _486 = _436;
    float _488 = _440;
    if (!_364)
    {
        float _490 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _492 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[30].w, _490);
        float _494 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _498 = 1.0 / _492;
        float _500 = 1.0 / _496;
        float _502 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _504 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _506 = fma(_498, _502, _504);
        float _508 = _506 * _500;
        float _510 = precise::clamp(_508, 0.0, 1.0);
        _432 = _510;
    }
    float _512 = _432;
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _516 = _484 + _514;
    float _518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _520 = _486 + _518;
    float _522 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _524 = _488 + _522;
    float _526 = _516 * _516;
    float _528 = fma(_520, _520, _526);
    float _530 = fma(_524, _524, _528);
    float _532 = rsqrt(_530);
    float _534 = _532 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _536 = _520 * _534;
    float _538 = _524 * _534;
    float _540 = _536 * _536;
    float _542 = _538 * _538;
    float _544 = _540 + _542;
    float _546 = sqrt(_544);
    bool _548 = _546 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _550 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _552 = _546 + _550;
    float _554 = _348;
    float _556 = _552;
    float _558 = _516;
    float _560 = _536;
    if (_548)
    {
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _554 = _562;
    }
    float _564 = _554;
    float _566 = _564;
    if (_548)
    {
        float _568 = _552 * _564;
        _556 = _568;
    }
    float _570 = _556;
    if (_548)
    {
        float _572 = rsqrt(_544);
        _566 = _572;
    }
    float _574 = _566;
    float _576 = _574;
    if (_548)
    {
        float _578 = _570 * 0.15915493667125701904296875;
        _388 = _578;
    }
    float _580 = _388;
    float _582 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _584 = _524;
    if (_548)
    {
        float _586 = _580 * 6.283185482025146484375;
        float _588 = sin(_586);
        _584 = _588;
    }
    float _590 = _584;
    float _592 = precise::max(0.0, _582);
    float _594 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _596 = _328;
    float _598 = _592;
    if (_548)
    {
        float _600 = _580 * 6.283185482025146484375;
        float _602 = cos(_600);
        _596 = _602;
    }
    float _604 = _596;
    float _606 = -_534;
    float _608 = -_592;
    float _610 = fma(_516, _606, _608);
    if (_548)
    {
        float _612 = _610 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _558 = _612;
    }
    float _614 = _558;
    float _616 = sqrt(_530);
    float _618 = _590;
    float _620 = _614;
    if (_548)
    {
        float _622 = fma(_590, _614, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _618 = _622;
    }
    float _624 = _618;
    float _626 = _624;
    if (!_548)
    {
        _620 = _610;
    }
    float _628 = _620;
    float _630 = _628;
    if (_548)
    {
        float _632 = _574 * _624;
        _390 = _632;
    }
    float _634 = _390;
    if (!_548)
    {
        _626 = _540;
    }
    float _636 = _626;
    float _638 = _484 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _640 = _636;
    float _642 = _604;
    if (_548)
    {
        float _644 = _604 + (-1.0);
        _598 = _644;
    }
    float _646 = _598;
    float _648 = _646;
    if (_548)
    {
        float _650 = _536 * _634;
        _560 = _650;
    }
    float _652 = _560;
    float _654 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[3].x, _638);
    if (_548)
    {
        float _656 = _646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _576 = _656;
    }
    float _658 = _576;
    if (!_548)
    {
        _648 = _538;
    }
    float _660 = _648;
    float _662 = _660;
    if (_548)
    {
        float _664 = _538 * _634;
        _662 = _664;
    }
    float _666 = _662;
    if (_548)
    {
        float _668 = _652 * _652;
        _640 = _668;
    }
    float _670 = _640;
    if (_548)
    {
        float _672 = fma(_610, _604, _658);
        _630 = _672;
    }
    float _674 = _630;
    if (!_548)
    {
        _642 = _542;
    }
    float _676 = _642;
    float _678 = _676;
    if (_548)
    {
        float _680 = _666 * _666;
        _678 = _680;
    }
    float _682 = _678;
    float _684 = fma(_674, _674, _670);
    float _686 = _684 + _682;
    float _688 = _484 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _690 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _692 = fma(_616, (*spvDescriptorSet0.vp_c15)._m0[23].w, _690);
    float _694 = precise::clamp(_692, 0.0, 1.0);
    float _696 = _484 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _698 = rsqrt(_686);
    float _700 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[2].x, _688);
    float _702 = -_694;
    float _704 = _702 + 1.0;
    float _706 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[1].x, _696);
    float _708 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[2].z, _700);
    float _710 = _484 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _712 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[1].z, _706);
    float _714 = abs(_704);
    float _716 = log2(_714);
    float _718 = _708 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _720 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[0].x, _710);
    float _722 = _712 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _724 = _718 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _726 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[0].z, _720);
    float _728 = _698 * _652;
    float _730 = _698 * _674;
    float _732 = _726 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _734 = _722 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _736 = _728 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _738 = -_724;
    float _740 = fma(_738, _594, 1.0);
    float _742 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[3].z, _654);
    float _744 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[7].x, _734);
    float _746 = _698 * _666;
    float _748 = -_736;
    float _750 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[21].y, _748);
    float _752 = _742 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _754 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[7].z, _744);
    float _756 = _716 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _758 = -_746;
    float _760 = fma(_758, (*spvDescriptorSet0.vp_c15)._m0[21].z, _750);
    float _762 = _722 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _764 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[7].w, _754);
    float _766 = log2(_740);
    float _768 = fma(_760, -0.5, 0.5);
    float _770 = _722 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _772 = fma(_760, 0.5, 0.5);
    float _774 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[4].x, _762);
    float _776 = _730 + 1.0;
    float _778 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[5].x, _770);
    float _780 = fma(_772, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _782 = exp2(_756);
    float _784 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[4].z, _774);
    float _786 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[5].z, _778);
    float _788 = fma(_772, _780, -0.212114393711090087890625);
    float _790 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[4].w, _784);
    float _792 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[5].w, _786);
    float _794 = fma(_772, _788, 1.570728778839111328125);
    float _796 = 1.0 / _764;
    float _798 = _766 * 0.693147182464599609375;
    float _800 = _798 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _802 = sqrt(_768);
    float _804 = -_730;
    float _806 = fma(_782, _776, _804);
    float _808 = _790 * _796;
    float _810 = _792 * _796;
    float _812 = fma(_806, 0.5, 0.5);
    float _814 = fma(_808, 0.5, 0.5);
    float _816 = fma(_810, -0.5, 0.5);
    float _818 = _802 * 0.636619746685028076171875;
    float3 _2298 = float3(_814, _816, _800);
    float _820 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2298, float3(0.0), isnan(_2298)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2298, float3(0.0), isnan(_2298)), level(0.0)).x;
    float _822 = -_794;
    float _824 = fma(_818, _822, 1.0);
    float3 _2314 = float3(_814, _816, _800);
    float4 _827 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2314, float3(0.0), isnan(_2314)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2314, float3(0.0), isnan(_2314)), level(0.0)).xyzw;
    float _829 = _827.x;
    float _831 = _827.y;
    float _833 = _827.z;
    float _835 = _827.w;
    float2 _2331 = float2(_824, _812);
    float3 _839 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2331, float2(0.0), isnan(_2331)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2331, float2(0.0), isnan(_2331)), level(0.0)).xyz;
    float _841 = _839.x;
    float _843 = _839.y;
    float _845 = _839.z;
    float _847 = in.m_55.x;
    float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _851 = _124 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _853 = _170 != 0.0;
    bool _855 = isnan(_170);
    bool _857 = _853 || _855;
    bool _859 = isnan(0.0);
    bool _861 = _857 || _859;
    float _863 = _716 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _865 = _722 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _867 = _168 == 0.0;
    bool _869 = !_861;
    bool _871 = _867 && _869;
    out.m_57.x = _486;
    out.m_57.y = _484;
    out.m_57.z = _488;
    int _873 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _875 = _873 != 0;
    float _877 = exp2(_863);
    bool _879 = _172 == 0.0;
    bool _881 = _879 && _871;
    float _883 = _851 * _849;
    float _885 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[20].x, _883);
    float _887 = in.m_59.x;
    float _889 = in.m_59.y;
    float _891 = in.m_59.z;
    float _893 = -_877;
    float _895 = _893 + 1.0;
    float _897 = _885 * 6.283185482025146484375;
    float _899 = floor(_885);
    float _901 = _895 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _903 = _897 * 0.15915493667125701904296875;
    float _905 = _903 * 6.283185482025146484375;
    float _907 = cos(_905);
    float _909 = -_899;
    float _911 = _885 + _909;
    float _913 = _887;
    float _915 = _889;
    float _917 = _891;
    if (!_881)
    {
        float _919 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[17].y, _887);
        _913 = _919;
    }
    float _921 = _913;
    bool _923 = !_875;
    int _925 = _923 ? 0 : 1;
    if (!_881)
    {
        float _927 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[17].y, _889);
        _915 = _927;
    }
    float _929 = _915;
    if (!_881)
    {
        float _931 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[17].y, _891);
        _917 = _931;
    }
    float _933 = _917;
    float _935 = fma(_907, 0.5, 0.5);
    int _937 = abs(_925);
    float _939 = _929 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _941 = _929 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _943 = abs(_416);
    float _945 = _929 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _947 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[8].x, _939);
    float _949 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[9].x, _941);
    float _951 = float(_943);
    float _953 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[10].x, _945);
    bool _955 = _911 < 0.5;
    float _957 = float(_955);
    float _959 = -_911;
    float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _963 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[6].x, _865);
    bool _965 = _512 > 0.0;
    bool _967 = isnan(_512);
    bool _969 = _965 || _967;
    bool _971 = isnan(0.0);
    bool _973 = _969 || _971;
    float _975 = abs(_961);
    float _977 = _951 * _975;
    float _979 = -_957;
    float _981 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _983 = float(_937);
    float _985 = -_935;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _989 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[6].z, _963);
    float _991 = in.m_61.w;
    float _993 = fma(_983, _987, _977);
    float _995 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[6].w, _989);
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _999 = abs(_420);
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1003 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1007 = float(_999);
    float _1009 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1015 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[8].z, _947);
    float _1017 = abs(_981);
    float _1019 = fma(_1007, _1017, _993);
    float _1021 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[9].z, _949);
    float _1023 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[10].z, _953);
    out.m_63.x = _1009;
    out.m_63.y = _1013;
    out.m_63.z = _1011;
    float _1025 = _1019 * _1003;
    float _1027 = _995 + _764;
    out.m_65.x = _1015;
    out.m_65.y = _1021;
    out.m_65.z = _1023;
    float _1029 = _1027 * 0.5;
    out.m_67.w = _991;
    float _1031 = _1025 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _790;
    out.gl_Position.y = _792;
    out.gl_Position.z = _995;
    out.gl_Position.w = _764;
    out.m_69.z = _1029;
    out.m_69.w = _764;
    out.m_45.x = _1031;
    float _1033 = _901 * _820;
    float _1035 = -_901;
    float _1037 = _1035 + 1.0;
    float _1039 = _835 * _1033;
    float _1041 = _845 * _1033;
    float _1043 = fma(_841, _1039, _829);
    float _1045 = fma(_843, _1039, _831);
    float _1047 = _835 * _1037;
    float _1049 = fma(_835, _1041, _833);
    out.m_71.x = _1043;
    out.m_71.y = _1045;
    out.m_71.z = _1049;
    out.m_71.w = _1047;
    if (_973)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1051 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1051;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    float _98 = as_type<float>(_90);
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _96;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _100 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1108 = as_type<float>(_106);
        out.gl_Position.z = _1108;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_120)
    {
        float _126 = float(_90);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1177 = as_type<float>(_142);
        out.gl_Position.z = _1177;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_47.x;
    float _146 = in.m_47.y;
    float _148 = in.m_47.z;
    float _150 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_42.x;
    float _154 = in.m_42.y;
    float _156 = in.m_42.z;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = in.m_51.x;
    float _176 = in.m_51.y;
    float _178 = in.m_51.z;
    float _180 = in.m_51.w;
    float _182 = 0.0;
    float _184 = _150;
    if (!_166)
    {
        float _186 = _150 * _150;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_166)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_166;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _150 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _150);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_166;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _150 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    float _258 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _168);
    float _264 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _170);
    float _266 = _258 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _268 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _260 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _272 = _178 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = _266 * _262;
    float _276 = fma(_256, _146, _268);
    float _278 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _270 * _264;
    float _282 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _284 = fma(_276, _180, _154);
    float _286 = fma(_256, _144, _278);
    float _288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _172);
    float _290 = fma(_256, _148, _282);
    float _292 = _284 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _294 = fma(_286, _180, _152);
    float _296 = _272 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _298 = fma(_290, _180, _156);
    float _300 = _280 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _302 = _284 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _304 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].x, _292);
    float _306 = _296 * _288;
    float _308 = _280 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _310 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[10].x, _300);
    float _312 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].x, _302);
    float _314 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[6].z, _304);
    float _316 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[8].x, _308);
    float _318 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[10].z, _310);
    float _320 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[4].z, _312);
    float _322 = _314 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _324 = _284 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _326 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[8].z, _316);
    float _328 = _320 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _330 = _322 + _318;
    float _332 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].x, _324);
    float _334 = in.m_53.y;
    float _336 = _328 + _326;
    float _338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _340 = _330 + _338;
    float _342 = fma(_298, (*spvDescriptorSet0.vp_c10)._m0[5].z, _332);
    float _344 = _280 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _346 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _348 = _336 + _346;
    float _350 = _340 * _340;
    float _352 = _342 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _354 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[9].x, _344);
    bool _356 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _358 = isnan(0.5);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _364 = _360 || _362;
    float _366 = fma(_348, _348, _350);
    float _368 = _352 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _370 = _352 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _372 = fma(_306, (*spvDescriptorSet0.vp_c10)._m0[9].z, _354);
    float _374 = sqrt(_366);
    float _376 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[11].x, _368);
    float _378 = fma(_328, (*spvDescriptorSet0.vp_c8)._m0[10].x, _370);
    float _380 = _352 + _372;
    float _382 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _376);
    float _384 = fma(_322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _378);
    float _386 = _314;
    float _388 = _306;
    float _390 = _366;
    if (_364)
    {
        _386 = 1.0;
    }
    float _392 = _386;
    float _394 = _382 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _396 = _384 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _398 = fma(_334, -1.7000000476837158203125, _380);
    float _400 = 1.0 / _394;
    float _402 = _396 + _394;
    bool _404 = _374 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _408 = _406 != 0;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _412 = _410 != 0;
    bool _414 = !_408;
    int _416 = _414 ? 0 : 1;
    bool _418 = !_412;
    int _420 = _418 ? 0 : 1;
    float _422 = _402 * _400;
    float _424 = _422 * 0.5;
    float _426 = _402;
    float _428 = _334;
    float _430 = _394;
    float _432 = _392;
    if (!_404)
    {
        _426 = _336;
    }
    float _434 = _426;
    float _436 = _434;
    if (!_404)
    {
        _428 = _330;
    }
    float _438 = _428;
    float _440 = _438;
    if (!_404)
    {
        _430 = _398;
    }
    float _442 = _430;
    bool _444 = !_404;
    float _446 = _442;
    if (!_444)
    {
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _452 = _374 + _450;
        float _454 = _398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _456 = rsqrt(_366);
        float _458 = _452 * _448;
        float _460 = _458 * 0.15915493667125701904296875;
        float _462 = _460 * 6.283185482025146484375;
        float _464 = cos(_462);
        float _466 = _460 * 6.283185482025146484375;
        float _468 = sin(_466);
        float _470 = _464 + (-1.0);
        float _472 = _470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _474 = fma(_468, _454, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _476 = fma(_398, _464, _472);
        float _478 = _456 * _474;
        float _480 = fma(_348, _478, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _482 = fma(_340, _478, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _446 = _476;
        _436 = _480;
        _440 = _482;
    }
    float _484 = _446;
    float _486 = _436;
    float _488 = _440;
    if (!_364)
    {
        float _490 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _492 = fma(_424, (*spvDescriptorSet0.vp_c8)._m0[30].w, _490);
        float _494 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _498 = 1.0 / _492;
        float _500 = 1.0 / _496;
        float _502 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _504 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _506 = fma(_498, _502, _504);
        float _508 = _506 * _500;
        float _510 = precise::clamp(_508, 0.0, 1.0);
        _432 = _510;
    }
    float _512 = _432;
    float _514 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _516 = _484 + _514;
    float _518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _520 = _486 + _518;
    float _522 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _524 = _488 + _522;
    float _526 = _516 * _516;
    float _528 = fma(_520, _520, _526);
    float _530 = fma(_524, _524, _528);
    float _532 = rsqrt(_530);
    float _534 = _532 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _536 = _520 * _534;
    float _538 = _524 * _534;
    float _540 = _536 * _536;
    float _542 = _538 * _538;
    float _544 = _540 + _542;
    float _546 = sqrt(_544);
    bool _548 = _546 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _550 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _552 = _546 + _550;
    float _554 = _348;
    float _556 = _552;
    float _558 = _516;
    float _560 = _536;
    if (_548)
    {
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _554 = _562;
    }
    float _564 = _554;
    float _566 = _564;
    if (_548)
    {
        float _568 = _552 * _564;
        _556 = _568;
    }
    float _570 = _556;
    if (_548)
    {
        float _572 = rsqrt(_544);
        _566 = _572;
    }
    float _574 = _566;
    float _576 = _574;
    if (_548)
    {
        float _578 = _570 * 0.15915493667125701904296875;
        _388 = _578;
    }
    float _580 = _388;
    float _582 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _584 = _524;
    if (_548)
    {
        float _586 = _580 * 6.283185482025146484375;
        float _588 = sin(_586);
        _584 = _588;
    }
    float _590 = _584;
    float _592 = precise::max(0.0, _582);
    float _594 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _596 = _328;
    float _598 = _592;
    if (_548)
    {
        float _600 = _580 * 6.283185482025146484375;
        float _602 = cos(_600);
        _596 = _602;
    }
    float _604 = _596;
    float _606 = -_534;
    float _608 = -_592;
    float _610 = fma(_516, _606, _608);
    if (_548)
    {
        float _612 = _610 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _558 = _612;
    }
    float _614 = _558;
    float _616 = sqrt(_530);
    float _618 = _590;
    float _620 = _614;
    if (_548)
    {
        float _622 = fma(_590, _614, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _618 = _622;
    }
    float _624 = _618;
    float _626 = _624;
    if (!_548)
    {
        _620 = _610;
    }
    float _628 = _620;
    float _630 = _628;
    if (_548)
    {
        float _632 = _574 * _624;
        _390 = _632;
    }
    float _634 = _390;
    if (!_548)
    {
        _626 = _540;
    }
    float _636 = _626;
    float _638 = _484 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _640 = _636;
    float _642 = _604;
    if (_548)
    {
        float _644 = _604 + (-1.0);
        _598 = _644;
    }
    float _646 = _598;
    float _648 = _646;
    if (_548)
    {
        float _650 = _536 * _634;
        _560 = _650;
    }
    float _652 = _560;
    float _654 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[3].x, _638);
    if (_548)
    {
        float _656 = _646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _576 = _656;
    }
    float _658 = _576;
    if (!_548)
    {
        _648 = _538;
    }
    float _660 = _648;
    float _662 = _660;
    if (_548)
    {
        float _664 = _538 * _634;
        _662 = _664;
    }
    float _666 = _662;
    if (_548)
    {
        float _668 = _652 * _652;
        _640 = _668;
    }
    float _670 = _640;
    if (_548)
    {
        float _672 = fma(_610, _604, _658);
        _630 = _672;
    }
    float _674 = _630;
    if (!_548)
    {
        _642 = _542;
    }
    float _676 = _642;
    float _678 = _676;
    if (_548)
    {
        float _680 = _666 * _666;
        _678 = _680;
    }
    float _682 = _678;
    float _684 = fma(_674, _674, _670);
    float _686 = _684 + _682;
    float _688 = _484 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _690 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _692 = fma(_616, (*spvDescriptorSet0.vp_c15)._m0[23].w, _690);
    float _694 = precise::clamp(_692, 0.0, 1.0);
    float _696 = _484 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _698 = rsqrt(_686);
    float _700 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[2].x, _688);
    float _702 = -_694;
    float _704 = _702 + 1.0;
    float _706 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[1].x, _696);
    float _708 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[2].z, _700);
    float _710 = _484 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _712 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[1].z, _706);
    float _714 = abs(_704);
    float _716 = log2(_714);
    float _718 = _708 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _720 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[0].x, _710);
    float _722 = _712 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _724 = _718 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _726 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[0].z, _720);
    float _728 = _698 * _652;
    float _730 = _698 * _674;
    float _732 = _726 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _734 = _722 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _736 = _728 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _738 = -_724;
    float _740 = fma(_738, _594, 1.0);
    float _742 = fma(_488, (*spvDescriptorSet0.vp_c8)._m0[3].z, _654);
    float _744 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[7].x, _734);
    float _746 = _698 * _666;
    float _748 = -_736;
    float _750 = fma(_730, (*spvDescriptorSet0.vp_c15)._m0[21].y, _748);
    float _752 = _742 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _754 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[7].z, _744);
    float _756 = _716 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _758 = -_746;
    float _760 = fma(_758, (*spvDescriptorSet0.vp_c15)._m0[21].z, _750);
    float _762 = _722 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _764 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[7].w, _754);
    float _766 = log2(_740);
    float _768 = fma(_760, -0.5, 0.5);
    float _770 = _722 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _772 = fma(_760, 0.5, 0.5);
    float _774 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[4].x, _762);
    float _776 = _730 + 1.0;
    float _778 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[5].x, _770);
    float _780 = fma(_772, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _782 = exp2(_756);
    float _784 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[4].z, _774);
    float _786 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[5].z, _778);
    float _788 = fma(_772, _780, -0.212114393711090087890625);
    float _790 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[4].w, _784);
    float _792 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[5].w, _786);
    float _794 = fma(_772, _788, 1.570728778839111328125);
    float _796 = 1.0 / _764;
    float _798 = _766 * 0.693147182464599609375;
    float _800 = _798 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _802 = sqrt(_768);
    float _804 = -_730;
    float _806 = fma(_782, _776, _804);
    float _808 = _790 * _796;
    float _810 = _792 * _796;
    float _812 = fma(_806, 0.5, 0.5);
    float _814 = fma(_808, 0.5, 0.5);
    float _816 = fma(_810, -0.5, 0.5);
    float _818 = _802 * 0.636619746685028076171875;
    float3 _2298 = float3(_814, _816, _800);
    float _820 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2298, float3(0.0), isnan(_2298)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2298, float3(0.0), isnan(_2298)), level(0.0)).x;
    float _822 = -_794;
    float _824 = fma(_818, _822, 1.0);
    float3 _2314 = float3(_814, _816, _800);
    float4 _827 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2314, float3(0.0), isnan(_2314)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2314, float3(0.0), isnan(_2314)), level(0.0)).xyzw;
    float _829 = _827.x;
    float _831 = _827.y;
    float _833 = _827.z;
    float _835 = _827.w;
    float2 _2331 = float2(_824, _812);
    float3 _839 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2331, float2(0.0), isnan(_2331)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2331, float2(0.0), isnan(_2331)), level(0.0)).xyz;
    float _841 = _839.x;
    float _843 = _839.y;
    float _845 = _839.z;
    float _847 = in.m_55.x;
    float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _851 = _124 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _853 = _170 != 0.0;
    bool _855 = isnan(_170);
    bool _857 = _853 || _855;
    bool _859 = isnan(0.0);
    bool _861 = _857 || _859;
    float _863 = _716 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _865 = _722 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _867 = _168 == 0.0;
    bool _869 = !_861;
    bool _871 = _867 && _869;
    out.m_57.x = _486;
    out.m_57.y = _484;
    out.m_57.z = _488;
    int _873 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _875 = _873 != 0;
    float _877 = exp2(_863);
    bool _879 = _172 == 0.0;
    bool _881 = _879 && _871;
    float _883 = _851 * _849;
    float _885 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[20].x, _883);
    float _887 = in.m_59.x;
    float _889 = in.m_59.y;
    float _891 = in.m_59.z;
    float _893 = -_877;
    float _895 = _893 + 1.0;
    float _897 = _885 * 6.283185482025146484375;
    float _899 = floor(_885);
    float _901 = _895 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _903 = _897 * 0.15915493667125701904296875;
    float _905 = _903 * 6.283185482025146484375;
    float _907 = cos(_905);
    float _909 = -_899;
    float _911 = _885 + _909;
    float _913 = _887;
    float _915 = _889;
    float _917 = _891;
    if (!_881)
    {
        float _919 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[17].y, _887);
        _913 = _919;
    }
    float _921 = _913;
    bool _923 = !_875;
    int _925 = _923 ? 0 : 1;
    if (!_881)
    {
        float _927 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[17].y, _889);
        _915 = _927;
    }
    float _929 = _915;
    if (!_881)
    {
        float _931 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[17].y, _891);
        _917 = _931;
    }
    float _933 = _917;
    float _935 = fma(_907, 0.5, 0.5);
    int _937 = abs(_925);
    float _939 = _929 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _941 = _929 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _943 = abs(_416);
    float _945 = _929 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _947 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[8].x, _939);
    float _949 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[9].x, _941);
    float _951 = float(_943);
    float _953 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[10].x, _945);
    bool _955 = _911 < 0.5;
    float _957 = float(_955);
    float _959 = -_911;
    float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _963 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[6].x, _865);
    bool _965 = _512 > 0.0;
    bool _967 = isnan(_512);
    bool _969 = _965 || _967;
    bool _971 = isnan(0.0);
    bool _973 = _969 || _971;
    float _975 = abs(_961);
    float _977 = _951 * _975;
    float _979 = -_957;
    float _981 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _983 = float(_937);
    float _985 = -_935;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _989 = fma(_718, (*spvDescriptorSet0.vp_c8)._m0[6].z, _963);
    float _991 = in.m_61.w;
    float _993 = fma(_983, _987, _977);
    float _995 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[6].w, _989);
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _999 = abs(_420);
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1003 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1007 = float(_999);
    float _1009 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1015 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[8].z, _947);
    float _1017 = abs(_981);
    float _1019 = fma(_1007, _1017, _993);
    float _1021 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[9].z, _949);
    float _1023 = fma(_933, (*spvDescriptorSet0.vp_c10)._m0[10].z, _953);
    out.m_63.x = _1009;
    out.m_63.y = _1013;
    out.m_63.z = _1011;
    float _1025 = _1019 * _1003;
    float _1027 = _995 + _764;
    out.m_65.x = _1015;
    out.m_65.y = _1021;
    out.m_65.z = _1023;
    float _1029 = _1027 * 0.5;
    out.m_67.w = _991;
    float _1031 = _1025 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _790;
    out.gl_Position.y = _792;
    out.gl_Position.z = _995;
    out.gl_Position.w = _764;
    out.m_69.z = _1029;
    out.m_69.w = _764;
    out.m_45.x = _1031;
    float _1033 = _901 * _820;
    float _1035 = -_901;
    float _1037 = _1035 + 1.0;
    float _1039 = _835 * _1033;
    float _1041 = _845 * _1033;
    float _1043 = fma(_841, _1039, _829);
    float _1045 = fma(_843, _1039, _831);
    float _1047 = _835 * _1037;
    float _1049 = fma(_835, _1041, _833);
    out.m_71.x = _1043;
    out.m_71.y = _1045;
    out.m_71.z = _1049;
    out.m_71.w = _1047;
    if (_973)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1051 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1051;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

