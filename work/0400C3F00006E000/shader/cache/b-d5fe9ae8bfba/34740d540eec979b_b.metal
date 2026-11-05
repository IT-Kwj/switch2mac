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
    float4 m_61 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1004 = as_type<float>(_106);
        out.gl_Position.z = _1004;
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
        float _1073 = as_type<float>(_142);
        out.gl_Position.z = _1073;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.x;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_51.z;
    float _150 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_51.y;
    float _164 = in.m_51.x;
    float _166 = in.m_47.x;
    float _168 = in.m_47.y;
    float _170 = in.m_47.z;
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    float _178 = in.m_53.w;
    float _180 = 0.0;
    float _182 = _146;
    if (!_160)
    {
        float _184 = _146 * _146;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[191].y, _144);
    float _192 = _188;
    if (!_160)
    {
        float _194 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    float _198 = _190 * 0.15915493667125701904296875;
    float _200 = _198 * 6.283185482025146484375;
    float _202 = sin(_200);
    float _204 = _202 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _206 = _204 * 0.01745329238474369049072265625;
    float _208 = _206 * 0.15915493667125701904296875;
    float _210 = in.m_42.x;
    float _212 = in.m_42.y;
    float _214 = in.m_42.z;
    float _216 = _208 * 6.283185482025146484375;
    float _218 = sin(_216);
    float _220 = _208 * 6.283185482025146484375;
    float _222 = cos(_220);
    bool _224 = !_160;
    float _226 = _196;
    float _228 = _162;
    if (!_224)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = _146 * _232;
        float _242 = exp2(_240);
        float _244 = _238 * 0.693147182464599609375;
        float _246 = 1.0 / _244;
        float _248 = 1.0 / _236;
        float _250 = _242 + (-1.0);
        float _252 = -_250;
        float _254 = fma(_252, _246, _146);
        float _256 = _254 * _248;
        float _258 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _226 = _258;
    }
    float _260 = _226;
    bool _262 = !_160;
    if (!_262)
    {
        float _264 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = log2(_264);
        float _268 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _270 = _268 + 1.0;
        float _272 = 1.0 / _270;
        float _274 = _146 * _266;
        float _276 = exp2(_274);
        float _278 = -_276;
        float _280 = _278 + 1.0;
        float _282 = _280 * _272;
        _182 = _282;
    }
    float _284 = _182;
    float _286 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _288 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _292 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _294 = fma(_284, _168, _286);
    float _296 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _298 = _218 * _148;
    float _300 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _302 = fma(_284, _166, _290);
    float _304 = _222 * _148;
    float _306 = -_298;
    float _308 = fma(_222, _162, _306);
    float _310 = fma(_284, _170, _300);
    float _312 = fma(_294, _178, _212);
    float _314 = fma(_218, _162, _304);
    float _316 = _292 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _308);
    float _320 = fma(_302, _178, _210);
    float _322 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _324 = fma(_310, _178, _214);
    float _326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _164);
    float _328 = _312 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _330 = _316 * _318;
    float _332 = _322 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _314);
    float _336 = _296 * _326;
    float _338 = _312 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _340 = fma(_320, (*spvDescriptorSet0.vp_c10)._m0[6].x, _328);
    float _342 = _330 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _344 = _332 * _334;
    float _346 = fma(_320, (*spvDescriptorSet0.vp_c10)._m0[4].x, _338);
    float _348 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[6].z, _340);
    float _350 = _330 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _352 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[10].x, _342);
    float _354 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[4].z, _346);
    float _356 = _348 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _358 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[8].x, _350);
    float _360 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[10].z, _352);
    float _362 = _354 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _364 = _312 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _366 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[8].z, _358);
    float _368 = _356 + _360;
    float _370 = fma(_320, (*spvDescriptorSet0.vp_c10)._m0[5].x, _364);
    float _372 = _362 + _366;
    float _374 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _376 = _368 + _374;
    float _378 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[5].z, _370);
    float _380 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _382 = _372 + _380;
    float _384 = _376 * _376;
    float _386 = _378 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _388 = fma(_382, _382, _384);
    float _390 = _330 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _392 = sqrt(_388);
    float _394 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[9].x, _390);
    float _396 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[9].z, _394);
    float _398 = _386 + _396;
    bool _400 = _392 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _402 = _386;
    float _404 = _324;
    float _406 = _378;
    if (!_400)
    {
        _402 = _372;
    }
    float _408 = _402;
    float _410 = _408;
    if (!_400)
    {
        _404 = _368;
    }
    float _412 = _404;
    float _414 = _412;
    if (!_400)
    {
        _406 = _398;
    }
    float _416 = _406;
    bool _418 = !_400;
    float _420 = _416;
    if (!_418)
    {
        float _422 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _424 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _426 = _392 + _424;
        float _428 = _398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _430 = rsqrt(_388);
        float _432 = _426 * _422;
        float _434 = _432 * 0.15915493667125701904296875;
        float _436 = _434 * 6.283185482025146484375;
        float _438 = cos(_436);
        float _440 = _434 * 6.283185482025146484375;
        float _442 = sin(_440);
        float _444 = _438 + (-1.0);
        float _446 = _444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _448 = fma(_442, _428, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _450 = fma(_398, _438, _446);
        float _452 = _430 * _448;
        float _454 = fma(_382, _452, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _456 = fma(_376, _452, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _420 = _450;
        _410 = _454;
        _414 = _456;
    }
    float _458 = _420;
    float _460 = _410;
    float _462 = _414;
    float _464 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _466 = _458 + _464;
    float _468 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _470 = _460 + _468;
    float _472 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _474 = _462 + _472;
    float _476 = _466 * _466;
    float _478 = fma(_470, _470, _476);
    float _480 = fma(_474, _474, _478);
    float _482 = rsqrt(_480);
    float _484 = sqrt(_480);
    float _486 = _482 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _488 = _470 * _486;
    float _490 = _474 * _486;
    float _492 = _488 * _488;
    float _494 = _490 * _490;
    float _496 = _492 + _494;
    float _498 = sqrt(_496);
    bool _500 = _498 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _502 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _504 = _498 + _502;
    float _506 = _398;
    float _508 = _496;
    float _510 = _504;
    float _512 = _466;
    float _514 = _488;
    if (_500)
    {
        float _516 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _506 = _516;
    }
    float _518 = _506;
    if (_500)
    {
        float _520 = rsqrt(_496);
        _508 = _520;
    }
    float _522 = _508;
    float _524 = _518;
    if (_500)
    {
        float _526 = _504 * _518;
        _510 = _526;
    }
    float _528 = _510;
    if (_500)
    {
        float _530 = _528 * 0.15915493667125701904296875;
        _524 = _530;
    }
    float _532 = _524;
    float _534 = _474;
    float _536 = _532;
    if (_500)
    {
        float _538 = _532 * 6.283185482025146484375;
        float _540 = sin(_538);
        _534 = _540;
    }
    float _542 = _534;
    float _544 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _546 = precise::max(0.0, _544);
    float _548 = _372;
    float _550 = _546;
    if (_500)
    {
        float _552 = _532 * 6.283185482025146484375;
        float _554 = cos(_552);
        _548 = _554;
    }
    float _556 = _548;
    float _558 = -_486;
    float _560 = -_546;
    float _562 = fma(_466, _558, _560);
    if (_500)
    {
        float _564 = _562 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _512 = _564;
    }
    float _566 = _512;
    float _568 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _570 = _566;
    float _572 = _542;
    if (_500)
    {
        float _574 = fma(_542, _566, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _570 = _574;
    }
    float _576 = _570;
    float _578 = _576;
    if (!_500)
    {
        _572 = _492;
    }
    float _580 = _572;
    float _582 = _458 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _584 = _580;
    float _586 = _556;
    if (_500)
    {
        float _588 = _556 + (-1.0);
        _550 = _588;
    }
    float _590 = _550;
    float _592 = _590;
    if (_500)
    {
        float _594 = _522 * _576;
        _228 = _594;
    }
    float _596 = _228;
    if (!_500)
    {
        _578 = _562;
    }
    float _598 = _578;
    float _600 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[3].x, _582);
    float _602 = _598;
    if (_500)
    {
        float _604 = _590 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _536 = _604;
    }
    float _606 = _536;
    if (_500)
    {
        float _608 = _488 * _596;
        _514 = _608;
    }
    float _610 = _514;
    if (!_500)
    {
        _592 = _490;
    }
    float _612 = _592;
    float _614 = _612;
    if (_500)
    {
        float _616 = _490 * _596;
        _614 = _616;
    }
    float _618 = _614;
    if (_500)
    {
        float _620 = fma(_562, _556, _606);
        _602 = _620;
    }
    float _622 = _602;
    if (_500)
    {
        float _624 = _610 * _610;
        _584 = _624;
    }
    float _626 = _584;
    if (!_500)
    {
        _586 = _494;
    }
    float _628 = _586;
    float _630 = _628;
    if (_500)
    {
        float _632 = _618 * _618;
        _630 = _632;
    }
    float _634 = _630;
    float _636 = fma(_622, _622, _626);
    float _638 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[3].z, _600);
    float _640 = _636 + _634;
    float _642 = _458 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _644 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _646 = fma(_484, (*spvDescriptorSet0.vp_c15)._m0[23].w, _644);
    float _648 = precise::clamp(_646, 0.0, 1.0);
    float _650 = _458 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _652 = rsqrt(_640);
    float _654 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[2].x, _642);
    float _656 = -_648;
    float _658 = _656 + 1.0;
    float _660 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[1].x, _650);
    float _662 = _638 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _664 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[2].z, _654);
    float _666 = _458 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _668 = abs(_658);
    float _670 = log2(_668);
    float _672 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[1].z, _660);
    float _674 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[0].x, _666);
    float _676 = _664 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _678 = _672 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _680 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[0].z, _674);
    float _682 = _676 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _684 = _652 * _610;
    float _686 = _652 * _622;
    float _688 = _680 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _690 = _678 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _692 = _684 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _694 = _652 * _618;
    float _696 = -_682;
    float _698 = fma(_696, _568, 1.0);
    float _700 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[7].x, _690);
    float _702 = _670 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _704 = -_692;
    float _706 = fma(_686, (*spvDescriptorSet0.vp_c15)._m0[21].y, _704);
    float _708 = _686 + 1.0;
    float _710 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[7].z, _700);
    float _712 = log2(_698);
    float _714 = -_694;
    float _716 = fma(_714, (*spvDescriptorSet0.vp_c15)._m0[21].z, _706);
    float _718 = _678 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _720 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[7].w, _710);
    float _722 = _678 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _724 = fma(_716, -0.5, 0.5);
    float _726 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[4].x, _718);
    float _728 = fma(_716, 0.5, 0.5);
    float _730 = exp2(_702);
    float _732 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[5].x, _722);
    float _734 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[4].z, _726);
    float _736 = fma(_728, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _738 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[5].z, _732);
    float _740 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[4].w, _734);
    float _742 = 1.0 / _720;
    float _744 = _712 * 0.693147182464599609375;
    float _746 = _744 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _748 = sqrt(_724);
    float _750 = -_686;
    float _752 = fma(_730, _708, _750);
    float _754 = fma(_728, _736, -0.212114393711090087890625);
    float _756 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[5].w, _738);
    float _758 = fma(_752, 0.5, 0.5);
    float _760 = fma(_728, _754, 1.570728778839111328125);
    float _762 = _740 * _742;
    float _764 = _756 * _742;
    float _766 = fma(_762, 0.5, 0.5);
    float _768 = fma(_764, -0.5, 0.5);
    float _770 = _748 * 0.636619746685028076171875;
    float3 _2111 = float3(_766, _768, _746);
    float _772 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2111, float3(0.0), isnan(_2111)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2111, float3(0.0), isnan(_2111)), level(0.0)).x;
    float3 _2122 = float3(_766, _768, _746);
    float4 _775 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2122, float3(0.0), isnan(_2122)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2122, float3(0.0), isnan(_2122)), level(0.0)).xyzw;
    float _777 = _775.x;
    float _779 = _775.y;
    float _781 = _775.z;
    float _783 = _775.w;
    float _785 = -_760;
    float _787 = fma(_770, _785, 1.0);
    float2 _2144 = float2(_787, _758);
    float3 _791 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2144, float2(0.0), isnan(_2144)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2144, float2(0.0), isnan(_2144)), level(0.0)).xyz;
    float _793 = _791.x;
    float _795 = _791.y;
    float _797 = _791.z;
    float _799 = in.m_55.z;
    bool _801 = _308 != 0.0;
    bool _803 = isnan(_308);
    bool _805 = _801 || _803;
    bool _807 = isnan(0.0);
    bool _809 = _805 || _807;
    float _811 = in.m_55.y;
    bool _813 = _164 == 0.0;
    bool _815 = !_809;
    bool _817 = _813 && _815;
    float _819 = in.m_55.x;
    bool _821 = _314 == 0.0;
    bool _823 = _821 && _817;
    out.m_57.x = _460;
    out.m_57.y = _458;
    out.m_57.z = _462;
    float _825 = _218 * _799;
    float _827 = _222 * _799;
    float _829 = in.m_59.w;
    float _831 = -_825;
    float _833 = fma(_222, _811, _831);
    float _835 = fma(_218, _811, _827);
    float _837 = _670 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _839 = _833;
    float _841 = _835;
    if (!_823)
    {
        float _843 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[17].y, _833);
        _839 = _843;
    }
    float _845 = _839;
    if (!_823)
    {
        float _847 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[17].y, _835);
        _841 = _847;
    }
    float _849 = _841;
    float _851 = _819;
    if (!_823)
    {
        float _853 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[17].y, _819);
        _851 = _853;
    }
    float _855 = _851;
    float _857 = _678 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _859 = exp2(_837);
    float _861 = _845 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _863 = _845 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _865 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[6].x, _857);
    float _867 = _845 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _869 = fma(_855, (*spvDescriptorSet0.vp_c10)._m0[8].x, _861);
    float _871 = fma(_855, (*spvDescriptorSet0.vp_c10)._m0[9].x, _863);
    float _873 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[6].z, _865);
    float _875 = fma(_849, (*spvDescriptorSet0.vp_c10)._m0[8].z, _869);
    float _877 = _740 + _720;
    float _879 = fma(_855, (*spvDescriptorSet0.vp_c10)._m0[10].x, _867);
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _883 = -_859;
    float _885 = _883 + 1.0;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _891 = _877 * 0.5;
    float _893 = _885 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _897 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _901 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _903 = fma(_849, (*spvDescriptorSet0.vp_c10)._m0[9].z, _871);
    float _905 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[6].w, _873);
    float _907 = fma(_849, (*spvDescriptorSet0.vp_c10)._m0[10].z, _879);
    float _909 = _720 * 0.5;
    out.m_61.x = _897;
    out.m_61.y = _899;
    out.m_61.z = _901;
    out.m_61.w = _895;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _917 = _905 + _720;
    float _919 = fma(_756, -0.5, _909);
    float _921 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _925 = _915 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _927 = _917 * 0.5;
    out.m_63.w = _829;
    float _929 = -_893;
    float _931 = _929 + 1.0;
    out.m_65.x = _921;
    out.m_65.y = _923;
    out.m_65.z = _925;
    float _933 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _875;
    out.m_67.y = _903;
    out.m_67.z = _907;
    out.gl_Position.x = _740;
    out.gl_Position.y = _756;
    out.gl_Position.z = _905;
    out.gl_Position.w = _720;
    out.m_69.x = _891;
    out.m_69.y = _919;
    out.m_69.z = _927;
    out.m_69.w = _720;
    out.m_45.x = _933;
    float _935 = _893 * _772;
    float _937 = _783 * _935;
    float _939 = _797 * _935;
    float _941 = fma(_793, _937, _777);
    float _943 = fma(_795, _937, _779);
    float _945 = _783 * _931;
    float _947 = fma(_783, _939, _781);
    out.m_71.x = _941;
    out.m_71.y = _943;
    out.m_71.z = _947;
    out.m_71.w = _945;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1004 = as_type<float>(_106);
        out.gl_Position.z = _1004;
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
        float _1073 = as_type<float>(_142);
        out.gl_Position.z = _1073;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_49.x;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_51.z;
    float _150 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_51.y;
    float _164 = in.m_51.x;
    float _166 = in.m_47.x;
    float _168 = in.m_47.y;
    float _170 = in.m_47.z;
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    float _178 = in.m_53.w;
    float _180 = 0.0;
    float _182 = _146;
    if (!_160)
    {
        float _184 = _146 * _146;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[191].y, _144);
    float _192 = _188;
    if (!_160)
    {
        float _194 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    float _198 = _190 * 0.15915493667125701904296875;
    float _200 = _198 * 6.283185482025146484375;
    float _202 = sin(_200);
    float _204 = _202 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _206 = _204 * 0.01745329238474369049072265625;
    float _208 = _206 * 0.15915493667125701904296875;
    float _210 = in.m_42.x;
    float _212 = in.m_42.y;
    float _214 = in.m_42.z;
    float _216 = _208 * 6.283185482025146484375;
    float _218 = sin(_216);
    float _220 = _208 * 6.283185482025146484375;
    float _222 = cos(_220);
    bool _224 = !_160;
    float _226 = _196;
    float _228 = _162;
    if (!_224)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = _146 * _232;
        float _242 = exp2(_240);
        float _244 = _238 * 0.693147182464599609375;
        float _246 = 1.0 / _244;
        float _248 = 1.0 / _236;
        float _250 = _242 + (-1.0);
        float _252 = -_250;
        float _254 = fma(_252, _246, _146);
        float _256 = _254 * _248;
        float _258 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _226 = _258;
    }
    float _260 = _226;
    bool _262 = !_160;
    if (!_262)
    {
        float _264 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = log2(_264);
        float _268 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _270 = _268 + 1.0;
        float _272 = 1.0 / _270;
        float _274 = _146 * _266;
        float _276 = exp2(_274);
        float _278 = -_276;
        float _280 = _278 + 1.0;
        float _282 = _280 * _272;
        _182 = _282;
    }
    float _284 = _182;
    float _286 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _288 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _292 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _294 = fma(_284, _168, _286);
    float _296 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _298 = _218 * _148;
    float _300 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _302 = fma(_284, _166, _290);
    float _304 = _222 * _148;
    float _306 = -_298;
    float _308 = fma(_222, _162, _306);
    float _310 = fma(_284, _170, _300);
    float _312 = fma(_294, _178, _212);
    float _314 = fma(_218, _162, _304);
    float _316 = _292 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _308);
    float _320 = fma(_302, _178, _210);
    float _322 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _324 = fma(_310, _178, _214);
    float _326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _164);
    float _328 = _312 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _330 = _316 * _318;
    float _332 = _322 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _314);
    float _336 = _296 * _326;
    float _338 = _312 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _340 = fma(_320, (*spvDescriptorSet0.vp_c10)._m0[6].x, _328);
    float _342 = _330 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _344 = _332 * _334;
    float _346 = fma(_320, (*spvDescriptorSet0.vp_c10)._m0[4].x, _338);
    float _348 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[6].z, _340);
    float _350 = _330 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _352 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[10].x, _342);
    float _354 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[4].z, _346);
    float _356 = _348 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _358 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[8].x, _350);
    float _360 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[10].z, _352);
    float _362 = _354 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _364 = _312 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _366 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[8].z, _358);
    float _368 = _356 + _360;
    float _370 = fma(_320, (*spvDescriptorSet0.vp_c10)._m0[5].x, _364);
    float _372 = _362 + _366;
    float _374 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _376 = _368 + _374;
    float _378 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[5].z, _370);
    float _380 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _382 = _372 + _380;
    float _384 = _376 * _376;
    float _386 = _378 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _388 = fma(_382, _382, _384);
    float _390 = _330 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _392 = sqrt(_388);
    float _394 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[9].x, _390);
    float _396 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[9].z, _394);
    float _398 = _386 + _396;
    bool _400 = _392 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _402 = _386;
    float _404 = _324;
    float _406 = _378;
    if (!_400)
    {
        _402 = _372;
    }
    float _408 = _402;
    float _410 = _408;
    if (!_400)
    {
        _404 = _368;
    }
    float _412 = _404;
    float _414 = _412;
    if (!_400)
    {
        _406 = _398;
    }
    float _416 = _406;
    bool _418 = !_400;
    float _420 = _416;
    if (!_418)
    {
        float _422 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _424 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _426 = _392 + _424;
        float _428 = _398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _430 = rsqrt(_388);
        float _432 = _426 * _422;
        float _434 = _432 * 0.15915493667125701904296875;
        float _436 = _434 * 6.283185482025146484375;
        float _438 = cos(_436);
        float _440 = _434 * 6.283185482025146484375;
        float _442 = sin(_440);
        float _444 = _438 + (-1.0);
        float _446 = _444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _448 = fma(_442, _428, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _450 = fma(_398, _438, _446);
        float _452 = _430 * _448;
        float _454 = fma(_382, _452, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _456 = fma(_376, _452, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _420 = _450;
        _410 = _454;
        _414 = _456;
    }
    float _458 = _420;
    float _460 = _410;
    float _462 = _414;
    float _464 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _466 = _458 + _464;
    float _468 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _470 = _460 + _468;
    float _472 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _474 = _462 + _472;
    float _476 = _466 * _466;
    float _478 = fma(_470, _470, _476);
    float _480 = fma(_474, _474, _478);
    float _482 = rsqrt(_480);
    float _484 = sqrt(_480);
    float _486 = _482 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _488 = _470 * _486;
    float _490 = _474 * _486;
    float _492 = _488 * _488;
    float _494 = _490 * _490;
    float _496 = _492 + _494;
    float _498 = sqrt(_496);
    bool _500 = _498 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _502 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _504 = _498 + _502;
    float _506 = _398;
    float _508 = _496;
    float _510 = _504;
    float _512 = _466;
    float _514 = _488;
    if (_500)
    {
        float _516 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _506 = _516;
    }
    float _518 = _506;
    if (_500)
    {
        float _520 = rsqrt(_496);
        _508 = _520;
    }
    float _522 = _508;
    float _524 = _518;
    if (_500)
    {
        float _526 = _504 * _518;
        _510 = _526;
    }
    float _528 = _510;
    if (_500)
    {
        float _530 = _528 * 0.15915493667125701904296875;
        _524 = _530;
    }
    float _532 = _524;
    float _534 = _474;
    float _536 = _532;
    if (_500)
    {
        float _538 = _532 * 6.283185482025146484375;
        float _540 = sin(_538);
        _534 = _540;
    }
    float _542 = _534;
    float _544 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _546 = precise::max(0.0, _544);
    float _548 = _372;
    float _550 = _546;
    if (_500)
    {
        float _552 = _532 * 6.283185482025146484375;
        float _554 = cos(_552);
        _548 = _554;
    }
    float _556 = _548;
    float _558 = -_486;
    float _560 = -_546;
    float _562 = fma(_466, _558, _560);
    if (_500)
    {
        float _564 = _562 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _512 = _564;
    }
    float _566 = _512;
    float _568 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _570 = _566;
    float _572 = _542;
    if (_500)
    {
        float _574 = fma(_542, _566, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _570 = _574;
    }
    float _576 = _570;
    float _578 = _576;
    if (!_500)
    {
        _572 = _492;
    }
    float _580 = _572;
    float _582 = _458 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _584 = _580;
    float _586 = _556;
    if (_500)
    {
        float _588 = _556 + (-1.0);
        _550 = _588;
    }
    float _590 = _550;
    float _592 = _590;
    if (_500)
    {
        float _594 = _522 * _576;
        _228 = _594;
    }
    float _596 = _228;
    if (!_500)
    {
        _578 = _562;
    }
    float _598 = _578;
    float _600 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[3].x, _582);
    float _602 = _598;
    if (_500)
    {
        float _604 = _590 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _536 = _604;
    }
    float _606 = _536;
    if (_500)
    {
        float _608 = _488 * _596;
        _514 = _608;
    }
    float _610 = _514;
    if (!_500)
    {
        _592 = _490;
    }
    float _612 = _592;
    float _614 = _612;
    if (_500)
    {
        float _616 = _490 * _596;
        _614 = _616;
    }
    float _618 = _614;
    if (_500)
    {
        float _620 = fma(_562, _556, _606);
        _602 = _620;
    }
    float _622 = _602;
    if (_500)
    {
        float _624 = _610 * _610;
        _584 = _624;
    }
    float _626 = _584;
    if (!_500)
    {
        _586 = _494;
    }
    float _628 = _586;
    float _630 = _628;
    if (_500)
    {
        float _632 = _618 * _618;
        _630 = _632;
    }
    float _634 = _630;
    float _636 = fma(_622, _622, _626);
    float _638 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[3].z, _600);
    float _640 = _636 + _634;
    float _642 = _458 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _644 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _646 = fma(_484, (*spvDescriptorSet0.vp_c15)._m0[23].w, _644);
    float _648 = precise::clamp(_646, 0.0, 1.0);
    float _650 = _458 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _652 = rsqrt(_640);
    float _654 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[2].x, _642);
    float _656 = -_648;
    float _658 = _656 + 1.0;
    float _660 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[1].x, _650);
    float _662 = _638 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _664 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[2].z, _654);
    float _666 = _458 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _668 = abs(_658);
    float _670 = log2(_668);
    float _672 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[1].z, _660);
    float _674 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[0].x, _666);
    float _676 = _664 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _678 = _672 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _680 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[0].z, _674);
    float _682 = _676 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _684 = _652 * _610;
    float _686 = _652 * _622;
    float _688 = _680 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _690 = _678 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _692 = _684 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _694 = _652 * _618;
    float _696 = -_682;
    float _698 = fma(_696, _568, 1.0);
    float _700 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[7].x, _690);
    float _702 = _670 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _704 = -_692;
    float _706 = fma(_686, (*spvDescriptorSet0.vp_c15)._m0[21].y, _704);
    float _708 = _686 + 1.0;
    float _710 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[7].z, _700);
    float _712 = log2(_698);
    float _714 = -_694;
    float _716 = fma(_714, (*spvDescriptorSet0.vp_c15)._m0[21].z, _706);
    float _718 = _678 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _720 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[7].w, _710);
    float _722 = _678 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _724 = fma(_716, -0.5, 0.5);
    float _726 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[4].x, _718);
    float _728 = fma(_716, 0.5, 0.5);
    float _730 = exp2(_702);
    float _732 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[5].x, _722);
    float _734 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[4].z, _726);
    float _736 = fma(_728, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _738 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[5].z, _732);
    float _740 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[4].w, _734);
    float _742 = 1.0 / _720;
    float _744 = _712 * 0.693147182464599609375;
    float _746 = _744 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _748 = sqrt(_724);
    float _750 = -_686;
    float _752 = fma(_730, _708, _750);
    float _754 = fma(_728, _736, -0.212114393711090087890625);
    float _756 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[5].w, _738);
    float _758 = fma(_752, 0.5, 0.5);
    float _760 = fma(_728, _754, 1.570728778839111328125);
    float _762 = _740 * _742;
    float _764 = _756 * _742;
    float _766 = fma(_762, 0.5, 0.5);
    float _768 = fma(_764, -0.5, 0.5);
    float _770 = _748 * 0.636619746685028076171875;
    float3 _2111 = float3(_766, _768, _746);
    float _772 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2111, float3(0.0), isnan(_2111)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2111, float3(0.0), isnan(_2111)), level(0.0)).x;
    float3 _2122 = float3(_766, _768, _746);
    float4 _775 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2122, float3(0.0), isnan(_2122)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2122, float3(0.0), isnan(_2122)), level(0.0)).xyzw;
    float _777 = _775.x;
    float _779 = _775.y;
    float _781 = _775.z;
    float _783 = _775.w;
    float _785 = -_760;
    float _787 = fma(_770, _785, 1.0);
    float2 _2144 = float2(_787, _758);
    float3 _791 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2144, float2(0.0), isnan(_2144)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2144, float2(0.0), isnan(_2144)), level(0.0)).xyz;
    float _793 = _791.x;
    float _795 = _791.y;
    float _797 = _791.z;
    float _799 = in.m_55.z;
    bool _801 = _308 != 0.0;
    bool _803 = isnan(_308);
    bool _805 = _801 || _803;
    bool _807 = isnan(0.0);
    bool _809 = _805 || _807;
    float _811 = in.m_55.y;
    bool _813 = _164 == 0.0;
    bool _815 = !_809;
    bool _817 = _813 && _815;
    float _819 = in.m_55.x;
    bool _821 = _314 == 0.0;
    bool _823 = _821 && _817;
    out.m_57.x = _460;
    out.m_57.y = _458;
    out.m_57.z = _462;
    float _825 = _218 * _799;
    float _827 = _222 * _799;
    float _829 = in.m_59.w;
    float _831 = -_825;
    float _833 = fma(_222, _811, _831);
    float _835 = fma(_218, _811, _827);
    float _837 = _670 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _839 = _833;
    float _841 = _835;
    if (!_823)
    {
        float _843 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[17].y, _833);
        _839 = _843;
    }
    float _845 = _839;
    if (!_823)
    {
        float _847 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[17].y, _835);
        _841 = _847;
    }
    float _849 = _841;
    float _851 = _819;
    if (!_823)
    {
        float _853 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[17].y, _819);
        _851 = _853;
    }
    float _855 = _851;
    float _857 = _678 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _859 = exp2(_837);
    float _861 = _845 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _863 = _845 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _865 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[6].x, _857);
    float _867 = _845 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _869 = fma(_855, (*spvDescriptorSet0.vp_c10)._m0[8].x, _861);
    float _871 = fma(_855, (*spvDescriptorSet0.vp_c10)._m0[9].x, _863);
    float _873 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[6].z, _865);
    float _875 = fma(_849, (*spvDescriptorSet0.vp_c10)._m0[8].z, _869);
    float _877 = _740 + _720;
    float _879 = fma(_855, (*spvDescriptorSet0.vp_c10)._m0[10].x, _867);
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _883 = -_859;
    float _885 = _883 + 1.0;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _891 = _877 * 0.5;
    float _893 = _885 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _897 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _901 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _903 = fma(_849, (*spvDescriptorSet0.vp_c10)._m0[9].z, _871);
    float _905 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[6].w, _873);
    float _907 = fma(_849, (*spvDescriptorSet0.vp_c10)._m0[10].z, _879);
    float _909 = _720 * 0.5;
    out.m_61.x = _897;
    out.m_61.y = _899;
    out.m_61.z = _901;
    out.m_61.w = _895;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _917 = _905 + _720;
    float _919 = fma(_756, -0.5, _909);
    float _921 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _925 = _915 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _927 = _917 * 0.5;
    out.m_63.w = _829;
    float _929 = -_893;
    float _931 = _929 + 1.0;
    out.m_65.x = _921;
    out.m_65.y = _923;
    out.m_65.z = _925;
    float _933 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _875;
    out.m_67.y = _903;
    out.m_67.z = _907;
    out.gl_Position.x = _740;
    out.gl_Position.y = _756;
    out.gl_Position.z = _905;
    out.gl_Position.w = _720;
    out.m_69.x = _891;
    out.m_69.y = _919;
    out.m_69.z = _927;
    out.m_69.w = _720;
    out.m_45.x = _933;
    float _935 = _893 * _772;
    float _937 = _783 * _935;
    float _939 = _797 * _935;
    float _941 = fma(_793, _937, _777);
    float _943 = fma(_795, _937, _779);
    float _945 = _783 * _931;
    float _947 = fma(_783, _939, _781);
    out.m_71.x = _941;
    out.m_71.y = _943;
    out.m_71.z = _947;
    out.m_71.w = _945;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1004 = as_type<float>(_106);
        out.gl_Position.z = _1004;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1073 = as_type<float>(_142);
        out.gl_Position.z = _1073;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.x;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_51.z;
    float _150 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_51.y;
    float _164 = in.m_51.x;
    float _166 = in.m_47.x;
    float _168 = in.m_47.y;
    float _170 = in.m_47.z;
    float _172 = in.m_53.x;
    float _174 = in.m_53.y;
    float _176 = in.m_53.z;
    float _178 = in.m_53.w;
    float _180 = 0.0;
    float _182 = _146;
    if (!_160)
    {
        float _184 = _146 * _146;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[191].y, _144);
    float _192 = _188;
    if (!_160)
    {
        float _194 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    float _198 = _190 * 0.15915493667125701904296875;
    float _200 = _198 * 6.283185482025146484375;
    float _202 = sin(_200);
    float _204 = _202 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _206 = _204 * 0.01745329238474369049072265625;
    float _208 = _206 * 0.15915493667125701904296875;
    float _210 = in.m_42.x;
    float _212 = in.m_42.y;
    float _214 = in.m_42.z;
    float _216 = _208 * 6.283185482025146484375;
    float _218 = sin(_216);
    float _220 = _208 * 6.283185482025146484375;
    float _222 = cos(_220);
    bool _224 = !_160;
    float _226 = _196;
    float _228 = _162;
    if (!_224)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = _146 * _232;
        float _242 = exp2(_240);
        float _244 = _238 * 0.693147182464599609375;
        float _246 = 1.0 / _244;
        float _248 = 1.0 / _236;
        float _250 = _242 + (-1.0);
        float _252 = -_250;
        float _254 = fma(_252, _246, _146);
        float _256 = _254 * _248;
        float _258 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _226 = _258;
    }
    float _260 = _226;
    bool _262 = !_160;
    if (!_262)
    {
        float _264 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = log2(_264);
        float _268 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _270 = _268 + 1.0;
        float _272 = 1.0 / _270;
        float _274 = _146 * _266;
        float _276 = exp2(_274);
        float _278 = -_276;
        float _280 = _278 + 1.0;
        float _282 = _280 * _272;
        _182 = _282;
    }
    float _284 = _182;
    float _286 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _288 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _292 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _294 = fma(_284, _168, _286);
    float _296 = _288 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _298 = _218 * _148;
    float _300 = _260 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _302 = fma(_284, _166, _290);
    float _304 = _222 * _148;
    float _306 = -_298;
    float _308 = fma(_222, _162, _306);
    float _310 = fma(_284, _170, _300);
    float _312 = fma(_294, _178, _212);
    float _314 = fma(_218, _162, _304);
    float _316 = _292 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _308);
    float _320 = fma(_302, _178, _210);
    float _322 = _176 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _324 = fma(_310, _178, _214);
    float _326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _164);
    float _328 = _312 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _330 = _316 * _318;
    float _332 = _322 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _314);
    float _336 = _296 * _326;
    float _338 = _312 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _340 = fma(_320, (*spvDescriptorSet0.vp_c10)._m0[6].x, _328);
    float _342 = _330 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _344 = _332 * _334;
    float _346 = fma(_320, (*spvDescriptorSet0.vp_c10)._m0[4].x, _338);
    float _348 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[6].z, _340);
    float _350 = _330 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _352 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[10].x, _342);
    float _354 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[4].z, _346);
    float _356 = _348 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _358 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[8].x, _350);
    float _360 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[10].z, _352);
    float _362 = _354 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _364 = _312 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _366 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[8].z, _358);
    float _368 = _356 + _360;
    float _370 = fma(_320, (*spvDescriptorSet0.vp_c10)._m0[5].x, _364);
    float _372 = _362 + _366;
    float _374 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _376 = _368 + _374;
    float _378 = fma(_324, (*spvDescriptorSet0.vp_c10)._m0[5].z, _370);
    float _380 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _382 = _372 + _380;
    float _384 = _376 * _376;
    float _386 = _378 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _388 = fma(_382, _382, _384);
    float _390 = _330 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _392 = sqrt(_388);
    float _394 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[9].x, _390);
    float _396 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[9].z, _394);
    float _398 = _386 + _396;
    bool _400 = _392 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _402 = _386;
    float _404 = _324;
    float _406 = _378;
    if (!_400)
    {
        _402 = _372;
    }
    float _408 = _402;
    float _410 = _408;
    if (!_400)
    {
        _404 = _368;
    }
    float _412 = _404;
    float _414 = _412;
    if (!_400)
    {
        _406 = _398;
    }
    float _416 = _406;
    bool _418 = !_400;
    float _420 = _416;
    if (!_418)
    {
        float _422 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _424 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _426 = _392 + _424;
        float _428 = _398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _430 = rsqrt(_388);
        float _432 = _426 * _422;
        float _434 = _432 * 0.15915493667125701904296875;
        float _436 = _434 * 6.283185482025146484375;
        float _438 = cos(_436);
        float _440 = _434 * 6.283185482025146484375;
        float _442 = sin(_440);
        float _444 = _438 + (-1.0);
        float _446 = _444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _448 = fma(_442, _428, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _450 = fma(_398, _438, _446);
        float _452 = _430 * _448;
        float _454 = fma(_382, _452, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _456 = fma(_376, _452, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _420 = _450;
        _410 = _454;
        _414 = _456;
    }
    float _458 = _420;
    float _460 = _410;
    float _462 = _414;
    float _464 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _466 = _458 + _464;
    float _468 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _470 = _460 + _468;
    float _472 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _474 = _462 + _472;
    float _476 = _466 * _466;
    float _478 = fma(_470, _470, _476);
    float _480 = fma(_474, _474, _478);
    float _482 = rsqrt(_480);
    float _484 = sqrt(_480);
    float _486 = _482 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _488 = _470 * _486;
    float _490 = _474 * _486;
    float _492 = _488 * _488;
    float _494 = _490 * _490;
    float _496 = _492 + _494;
    float _498 = sqrt(_496);
    bool _500 = _498 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _502 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _504 = _498 + _502;
    float _506 = _398;
    float _508 = _496;
    float _510 = _504;
    float _512 = _466;
    float _514 = _488;
    if (_500)
    {
        float _516 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _506 = _516;
    }
    float _518 = _506;
    if (_500)
    {
        float _520 = rsqrt(_496);
        _508 = _520;
    }
    float _522 = _508;
    float _524 = _518;
    if (_500)
    {
        float _526 = _504 * _518;
        _510 = _526;
    }
    float _528 = _510;
    if (_500)
    {
        float _530 = _528 * 0.15915493667125701904296875;
        _524 = _530;
    }
    float _532 = _524;
    float _534 = _474;
    float _536 = _532;
    if (_500)
    {
        float _538 = _532 * 6.283185482025146484375;
        float _540 = sin(_538);
        _534 = _540;
    }
    float _542 = _534;
    float _544 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _546 = precise::max(0.0, _544);
    float _548 = _372;
    float _550 = _546;
    if (_500)
    {
        float _552 = _532 * 6.283185482025146484375;
        float _554 = cos(_552);
        _548 = _554;
    }
    float _556 = _548;
    float _558 = -_486;
    float _560 = -_546;
    float _562 = fma(_466, _558, _560);
    if (_500)
    {
        float _564 = _562 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _512 = _564;
    }
    float _566 = _512;
    float _568 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _570 = _566;
    float _572 = _542;
    if (_500)
    {
        float _574 = fma(_542, _566, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _570 = _574;
    }
    float _576 = _570;
    float _578 = _576;
    if (!_500)
    {
        _572 = _492;
    }
    float _580 = _572;
    float _582 = _458 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _584 = _580;
    float _586 = _556;
    if (_500)
    {
        float _588 = _556 + (-1.0);
        _550 = _588;
    }
    float _590 = _550;
    float _592 = _590;
    if (_500)
    {
        float _594 = _522 * _576;
        _228 = _594;
    }
    float _596 = _228;
    if (!_500)
    {
        _578 = _562;
    }
    float _598 = _578;
    float _600 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[3].x, _582);
    float _602 = _598;
    if (_500)
    {
        float _604 = _590 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _536 = _604;
    }
    float _606 = _536;
    if (_500)
    {
        float _608 = _488 * _596;
        _514 = _608;
    }
    float _610 = _514;
    if (!_500)
    {
        _592 = _490;
    }
    float _612 = _592;
    float _614 = _612;
    if (_500)
    {
        float _616 = _490 * _596;
        _614 = _616;
    }
    float _618 = _614;
    if (_500)
    {
        float _620 = fma(_562, _556, _606);
        _602 = _620;
    }
    float _622 = _602;
    if (_500)
    {
        float _624 = _610 * _610;
        _584 = _624;
    }
    float _626 = _584;
    if (!_500)
    {
        _586 = _494;
    }
    float _628 = _586;
    float _630 = _628;
    if (_500)
    {
        float _632 = _618 * _618;
        _630 = _632;
    }
    float _634 = _630;
    float _636 = fma(_622, _622, _626);
    float _638 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[3].z, _600);
    float _640 = _636 + _634;
    float _642 = _458 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _644 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _646 = fma(_484, (*spvDescriptorSet0.vp_c15)._m0[23].w, _644);
    float _648 = precise::clamp(_646, 0.0, 1.0);
    float _650 = _458 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _652 = rsqrt(_640);
    float _654 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[2].x, _642);
    float _656 = -_648;
    float _658 = _656 + 1.0;
    float _660 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[1].x, _650);
    float _662 = _638 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _664 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[2].z, _654);
    float _666 = _458 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _668 = abs(_658);
    float _670 = log2(_668);
    float _672 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[1].z, _660);
    float _674 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[0].x, _666);
    float _676 = _664 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _678 = _672 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _680 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[0].z, _674);
    float _682 = _676 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _684 = _652 * _610;
    float _686 = _652 * _622;
    float _688 = _680 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _690 = _678 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _692 = _684 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _694 = _652 * _618;
    float _696 = -_682;
    float _698 = fma(_696, _568, 1.0);
    float _700 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[7].x, _690);
    float _702 = _670 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _704 = -_692;
    float _706 = fma(_686, (*spvDescriptorSet0.vp_c15)._m0[21].y, _704);
    float _708 = _686 + 1.0;
    float _710 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[7].z, _700);
    float _712 = log2(_698);
    float _714 = -_694;
    float _716 = fma(_714, (*spvDescriptorSet0.vp_c15)._m0[21].z, _706);
    float _718 = _678 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _720 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[7].w, _710);
    float _722 = _678 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _724 = fma(_716, -0.5, 0.5);
    float _726 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[4].x, _718);
    float _728 = fma(_716, 0.5, 0.5);
    float _730 = exp2(_702);
    float _732 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[5].x, _722);
    float _734 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[4].z, _726);
    float _736 = fma(_728, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _738 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[5].z, _732);
    float _740 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[4].w, _734);
    float _742 = 1.0 / _720;
    float _744 = _712 * 0.693147182464599609375;
    float _746 = _744 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _748 = sqrt(_724);
    float _750 = -_686;
    float _752 = fma(_730, _708, _750);
    float _754 = fma(_728, _736, -0.212114393711090087890625);
    float _756 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[5].w, _738);
    float _758 = fma(_752, 0.5, 0.5);
    float _760 = fma(_728, _754, 1.570728778839111328125);
    float _762 = _740 * _742;
    float _764 = _756 * _742;
    float _766 = fma(_762, 0.5, 0.5);
    float _768 = fma(_764, -0.5, 0.5);
    float _770 = _748 * 0.636619746685028076171875;
    float3 _2111 = float3(_766, _768, _746);
    float _772 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2111, float3(0.0), isnan(_2111)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2111, float3(0.0), isnan(_2111)), level(0.0)).x;
    float3 _2122 = float3(_766, _768, _746);
    float4 _775 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2122, float3(0.0), isnan(_2122)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2122, float3(0.0), isnan(_2122)), level(0.0)).xyzw;
    float _777 = _775.x;
    float _779 = _775.y;
    float _781 = _775.z;
    float _783 = _775.w;
    float _785 = -_760;
    float _787 = fma(_770, _785, 1.0);
    float2 _2144 = float2(_787, _758);
    float3 _791 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2144, float2(0.0), isnan(_2144)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2144, float2(0.0), isnan(_2144)), level(0.0)).xyz;
    float _793 = _791.x;
    float _795 = _791.y;
    float _797 = _791.z;
    float _799 = in.m_55.z;
    bool _801 = _308 != 0.0;
    bool _803 = isnan(_308);
    bool _805 = _801 || _803;
    bool _807 = isnan(0.0);
    bool _809 = _805 || _807;
    float _811 = in.m_55.y;
    bool _813 = _164 == 0.0;
    bool _815 = !_809;
    bool _817 = _813 && _815;
    float _819 = in.m_55.x;
    bool _821 = _314 == 0.0;
    bool _823 = _821 && _817;
    out.m_57.x = _460;
    out.m_57.y = _458;
    out.m_57.z = _462;
    float _825 = _218 * _799;
    float _827 = _222 * _799;
    float _829 = in.m_59.w;
    float _831 = -_825;
    float _833 = fma(_222, _811, _831);
    float _835 = fma(_218, _811, _827);
    float _837 = _670 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _839 = _833;
    float _841 = _835;
    if (!_823)
    {
        float _843 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[17].y, _833);
        _839 = _843;
    }
    float _845 = _839;
    if (!_823)
    {
        float _847 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[17].y, _835);
        _841 = _847;
    }
    float _849 = _841;
    float _851 = _819;
    if (!_823)
    {
        float _853 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[17].y, _819);
        _851 = _853;
    }
    float _855 = _851;
    float _857 = _678 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _859 = exp2(_837);
    float _861 = _845 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _863 = _845 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _865 = fma(_688, (*spvDescriptorSet0.vp_c8)._m0[6].x, _857);
    float _867 = _845 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _869 = fma(_855, (*spvDescriptorSet0.vp_c10)._m0[8].x, _861);
    float _871 = fma(_855, (*spvDescriptorSet0.vp_c10)._m0[9].x, _863);
    float _873 = fma(_676, (*spvDescriptorSet0.vp_c8)._m0[6].z, _865);
    float _875 = fma(_849, (*spvDescriptorSet0.vp_c10)._m0[8].z, _869);
    float _877 = _740 + _720;
    float _879 = fma(_855, (*spvDescriptorSet0.vp_c10)._m0[10].x, _867);
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _883 = -_859;
    float _885 = _883 + 1.0;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _891 = _877 * 0.5;
    float _893 = _885 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _897 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _901 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _903 = fma(_849, (*spvDescriptorSet0.vp_c10)._m0[9].z, _871);
    float _905 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[6].w, _873);
    float _907 = fma(_849, (*spvDescriptorSet0.vp_c10)._m0[10].z, _879);
    float _909 = _720 * 0.5;
    out.m_61.x = _897;
    out.m_61.y = _899;
    out.m_61.z = _901;
    out.m_61.w = _895;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _917 = _905 + _720;
    float _919 = fma(_756, -0.5, _909);
    float _921 = _911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _923 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _925 = _915 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _927 = _917 * 0.5;
    out.m_63.w = _829;
    float _929 = -_893;
    float _931 = _929 + 1.0;
    out.m_65.x = _921;
    out.m_65.y = _923;
    out.m_65.z = _925;
    float _933 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _875;
    out.m_67.y = _903;
    out.m_67.z = _907;
    out.gl_Position.x = _740;
    out.gl_Position.y = _756;
    out.gl_Position.z = _905;
    out.gl_Position.w = _720;
    out.m_69.x = _891;
    out.m_69.y = _919;
    out.m_69.z = _927;
    out.m_69.w = _720;
    out.m_45.x = _933;
    float _935 = _893 * _772;
    float _937 = _783 * _935;
    float _939 = _797 * _935;
    float _941 = fma(_793, _937, _777);
    float _943 = fma(_795, _937, _779);
    float _945 = _783 * _931;
    float _947 = fma(_783, _939, _781);
    out.m_71.x = _941;
    out.m_71.y = _943;
    out.m_71.z = _947;
    out.m_71.w = _945;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

