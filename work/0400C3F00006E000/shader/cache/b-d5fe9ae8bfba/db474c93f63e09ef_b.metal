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
    texture2d<float> vp_t_tcb_8 [[id(5)]];
    sampler vp_t_tcb_8Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_8Smplr_w [[id(13)]];
    sampler vp_t_tcb_32Smplr_w [[id(14)]];
    sampler vp_t_tcb_30Smplr_w [[id(15)]];
    sampler vp_t_tcb_1CSmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_67 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_51 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
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
    float _102 = _100;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_94)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1279 = as_type<float>(_108);
        out.gl_Position.z = _1279;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_90);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    if (_136)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _98;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _110 = as_type<int>(_140);
    }
    int _142 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1347 = as_type<float>(_142);
        out.gl_Position.z = _1347;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_51.x;
    float _146 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _148 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _146;
    float _150 = in.m_53.x;
    float _152 = in.m_53.y;
    float _154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _156 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _154;
    float _158 = _148 * _148;
    float _160 = fma(_156, _156, _158);
    float _162 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _162;
    float _166 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _168 = fma(_164, _164, _160);
    float _170 = sqrt(_168);
    float _172 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[191].x, _144);
    float _174 = _166 * (*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _176 = floor(_172);
    float _178 = _150 * 0.15915493667125701904296875;
    float _180 = precise::max(_170, 50.0);
    float _182 = _178 * 6.283185482025146484375;
    float _184 = sin(_182);
    float _186 = precise::min(_180, 100.0);
    float _188 = -_176;
    float _190 = _172 + _188;
    float _192 = _178 * 6.283185482025146484375;
    float _194 = cos(_192);
    float _196 = fma(_186, 0.0199999995529651641845703125, -1.0);
    float _198 = fma(_190, 0.800000011920928955078125, 0.300000011920928955078125);
    float _200 = fma(_196, 1.0499999523162841796875, 0.699999988079071044921875);
    float _202 = fma(_200, _152, _198);
    float _204 = _202 * _184;
    float _206 = _202 * _194;
    float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _210 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[191].z, _174);
    float2 _1470 = float2(_208, _210);
    float _212 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1470, float2(0.0), isnan(_1470)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1470, float2(0.0), isnan(_1470)), level(0.0)).y;
    float _214 = in.m_55.w;
    float _216 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _218 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _222 = _218 || _220;
    bool _224 = isnan(1.0);
    bool _226 = _222 || _224;
    float _228 = in.m_49.x;
    float _230 = in.m_49.y;
    float _232 = in.m_49.z;
    float _234 = in.m_44.x;
    float _236 = in.m_44.y;
    float _238 = in.m_44.z;
    float _240 = _178;
    float _242 = _216;
    if (!_226)
    {
        float _244 = _216 * _216;
        float _246 = _244 * 0.5;
        _240 = _246;
    }
    float _248 = _240;
    float _250 = _248;
    if (!_226)
    {
        float _252 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _250 = _252;
    }
    float _254 = _250;
    bool _256 = !_226;
    float _258 = _254;
    if (!_256)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _270 = _216 * _262;
        float _272 = 1.0 / _266;
        float _274 = _268 * 0.693147182464599609375;
        float _276 = exp2(_270);
        float _278 = 1.0 / _274;
        float _280 = _276 + (-1.0);
        float _282 = -_280;
        float _284 = fma(_282, _278, _216);
        float _286 = _284 * _272;
        float _288 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _258 = _288;
    }
    float _290 = _258;
    bool _292 = !_226;
    if (!_292)
    {
        float _294 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _296 = log2(_294);
        float _298 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _300 = _298 + 1.0;
        float _302 = 1.0 / _300;
        float _304 = _216 * _296;
        float _306 = exp2(_304);
        float _308 = -_306;
        float _310 = _308 + 1.0;
        float _312 = _310 * _302;
        _242 = _312;
    }
    float _314 = _242;
    float _316 = _290 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _318 = _290 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _320 = fma(_196, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _322 = _212 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _324 = fma(_314, _230, _316);
    float _326 = fma(_314, _228, _318);
    float _328 = _290 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _330 = _322 * _320;
    float _332 = fma(_324, _214, _236);
    float _334 = fma(_326, _214, _234);
    float _336 = fma(_314, _232, _328);
    float _338 = precise::max(_170, 200.0);
    float _340 = _332 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _342 = _332 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _344 = fma(_336, _214, _238);
    float _346 = _332 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _348 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[5].x, _340);
    float _350 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[4].x, _342);
    float _352 = precise::min(_338, 500.0);
    float _354 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[6].x, _346);
    float _356 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].z, _348);
    float _358 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].z, _350);
    float _360 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].z, _354);
    float _362 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _364 = _358 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _368 = _366 != 0;
    int _370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _372 = _370 != 0;
    float _374 = _360 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _376 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _378 = _362 + _376;
    float _380 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _382 = _364 + _380;
    float _384 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _386 = _374 + _384;
    float _388 = _378 * _378;
    bool _390 = !_368;
    int _392 = _390 ? 0 : 1;
    bool _394 = !_372;
    int _396 = _394 ? 0 : 1;
    float _398 = fma(_382, _382, _388);
    float _400 = fma(_386, _386, _398);
    float _402 = rsqrt(_400);
    float _404 = _378 * _402;
    float _406 = _382 * _402;
    float _408 = -_404;
    float _410 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[18].w, _378);
    float _412 = -_406;
    float _414 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[18].w, _382);
    float _416 = in.m_55.x;
    float _418 = in.m_55.y;
    float _420 = in.m_55.z;
    float _422 = _410 * _410;
    float _424 = _386 * _402;
    float _426 = fma(_414, _414, _422);
    float _428 = -_424;
    float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[18].w, _386);
    float _432 = in.m_53.z;
    float _434 = fma(_430, _430, _426);
    float _436 = sqrt(_434);
    float _438 = _416 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _440 = _418 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _442 = _420 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _444 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _446 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _448 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _450 = _402 * _436;
    float _452 = _444 * _450;
    float _454 = _446 * _450;
    float _456 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _204);
    float _458 = _448 * _450;
    float _460 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _432);
    float _462 = _452 * _456;
    float _464 = _458 * _460;
    float _466 = fma(_190, 0.449999988079071044921875, 0.699999988079071044921875);
    float _468 = fma(_330, _466, _206);
    float _470 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _468);
    float _472 = _454 * _470;
    float _474 = _472 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _476 = _472 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _478 = _472 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _480 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[10].x, _474);
    float _482 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[8].x, _476);
    float _484 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[9].x, _478);
    float _486 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[10].z, _480);
    float _488 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[8].z, _482);
    float _490 = fma(_352, 0.00166666670702397823333740234375, 0.66666662693023681640625);
    float _492 = _374 + _486;
    float _494 = _364 + _488;
    float _496 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[9].z, _484);
    float _498 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _500 = _492 + _498;
    float _502 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _504 = _494 + _502;
    float _506 = _362 + _496;
    float _508 = fma(_500, _490, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _510 = fma(_504, _490, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _512 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _514 = _506 + _512;
    float _516 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _518 = _508 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _522 = _510 + _520;
    float _524 = fma(_514, _490, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _526 = _518 * _518;
    float _528 = fma(_522, _522, _526);
    float _530 = sqrt(_528);
    bool _532 = _530 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _534 = _478;
    float _536 = _510;
    float _538 = _526;
    float _540 = _522;
    if (!_532)
    {
        _534 = _510;
    }
    float _542 = _534;
    float _544 = _542;
    if (!_532)
    {
        _536 = _508;
    }
    float _546 = _536;
    float _548 = _546;
    if (!_532)
    {
        _538 = _524;
    }
    float _550 = _538;
    bool _552 = !_532;
    float _554 = _550;
    if (!_552)
    {
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _558 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _560 = _530 + _558;
        float _562 = _524 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _564 = rsqrt(_528);
        float _566 = _560 * _556;
        float _568 = _566 * 0.15915493667125701904296875;
        float _570 = _568 * 6.283185482025146484375;
        float _572 = sin(_570);
        float _574 = _568 * 6.283185482025146484375;
        float _576 = cos(_574);
        float _578 = fma(_572, _562, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _580 = _564 * _578;
        float _582 = _576 + (-1.0);
        float _584 = fma(_522, _580, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _586 = fma(_518, _580, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _588 = _582 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _590 = fma(_524, _576, _588);
        _554 = _590;
        _544 = _584;
        _548 = _586;
    }
    float _592 = _554;
    float _594 = _544;
    float _596 = _548;
    float _598 = -_404;
    float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[18].w, _592);
    float _602 = -_406;
    float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[18].w, _594);
    float _606 = -_424;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _596);
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _612 = _600 + _610;
    float _614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _616 = _604 + _614;
    float _618 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _620 = _608 + _618;
    float _622 = _612 * _612;
    float _624 = fma(_616, _616, _622);
    float _626 = fma(_620, _620, _624);
    float _628 = rsqrt(_626);
    float _630 = sqrt(_626);
    float _632 = _628 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _634 = _616 * _632;
    float _636 = _620 * _632;
    float _638 = _634 * _634;
    float _640 = _636 * _636;
    float _642 = _638 + _640;
    float _644 = sqrt(_642);
    bool _646 = _644 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _648 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _650 = _644 + _648;
    float _652 = _620;
    float _654 = _642;
    float _656 = _650;
    float _658 = _612;
    if (_646)
    {
        float _660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _652 = _660;
    }
    float _662 = _652;
    if (_646)
    {
        float _664 = rsqrt(_642);
        _654 = _664;
    }
    float _666 = _654;
    float _668 = _666;
    if (_646)
    {
        float _670 = _650 * _662;
        _656 = _670;
    }
    float _672 = _656;
    if (_646)
    {
        float _674 = _672 * 0.15915493667125701904296875;
        _540 = _674;
    }
    float _676 = _540;
    float _678 = _662;
    float _680 = _676;
    if (_646)
    {
        float _682 = _676 * 6.283185482025146484375;
        float _684 = sin(_682);
        _678 = _684;
    }
    float _686 = _678;
    float _688 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _690 = precise::max(0.0, _688);
    float _692 = _622;
    float _694 = _690;
    if (_646)
    {
        float _696 = _676 * 6.283185482025146484375;
        float _698 = cos(_696);
        _692 = _698;
    }
    float _700 = _692;
    float _702 = -_632;
    float _704 = -_690;
    float _706 = fma(_612, _702, _704);
    if (!_646)
    {
        _658 = _634;
    }
    float _708 = _658;
    float _710 = _708;
    if (_646)
    {
        float _712 = _706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _694 = _712;
    }
    float _714 = _694;
    float _716 = _686;
    float _718 = _714;
    if (_646)
    {
        float _720 = fma(_686, _714, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _716 = _720;
    }
    float _722 = _716;
    float _724 = _722;
    float _726 = _700;
    if (_646)
    {
        float _728 = _700 + (-1.0);
        _718 = _728;
    }
    float _730 = _718;
    float _732 = 0.0;
    float _734 = _730;
    if (_646)
    {
        float _736 = _666 * _722;
        _732 = _736;
    }
    float _738 = _732;
    if (!_646)
    {
        _724 = _706;
    }
    float _740 = _724;
    float _742 = _740;
    if (_646)
    {
        float _744 = _730 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _680 = _744;
    }
    float _746 = _680;
    if (_646)
    {
        float _748 = _634 * _738;
        _710 = _748;
    }
    float _750 = _710;
    if (!_646)
    {
        _734 = _636;
    }
    float _752 = _734;
    float _754 = _752;
    if (_646)
    {
        float _756 = _636 * _738;
        _754 = _756;
    }
    float _758 = _754;
    if (_646)
    {
        float _760 = fma(_706, _700, _746);
        _742 = _760;
    }
    float _762 = _742;
    if (!_646)
    {
        _668 = _638;
    }
    float _764 = _668;
    float _766 = _764;
    if (_646)
    {
        float _768 = _750 * _750;
        _766 = _768;
    }
    float _770 = _766;
    float _772 = _600 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_646)
    {
        _726 = _640;
    }
    float _774 = _726;
    float _776 = _774;
    if (_646)
    {
        float _778 = _758 * _758;
        _776 = _778;
    }
    float _780 = _776;
    float _782 = fma(_762, _762, _770);
    float _784 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _786 = fma(_630, (*spvDescriptorSet0.vp_c15)._m0[23].w, _784);
    float _788 = precise::clamp(_786, 0.0, 1.0);
    float _790 = _600 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _792 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[2].x, _772);
    float _794 = _782 + _780;
    float _796 = _600 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _798 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[1].x, _790);
    float _800 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[2].z, _792);
    float _802 = _600 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _804 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[0].x, _796);
    float _806 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[1].z, _798);
    float _808 = rsqrt(_794);
    float _810 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[0].z, _804);
    float _812 = _806 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _814 = _800 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _816 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[3].x, _802);
    float _818 = _810 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _820 = _812 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _822 = -_788;
    float _824 = _822 + 1.0;
    float _826 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _828 = _814 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _830 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[3].z, _816);
    float _832 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[7].x, _820);
    float _834 = -_828;
    float _836 = fma(_834, _826, 1.0);
    float _838 = abs(_824);
    float _840 = log2(_838);
    float _842 = _830 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _844 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[7].z, _832);
    float _846 = _808 * _750;
    float _848 = _808 * _762;
    float _850 = _808 * _758;
    float _852 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[7].w, _844);
    float _854 = _846 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _856 = log2(_836);
    float _858 = _848 + 1.0;
    float _860 = -_854;
    float _862 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[21].y, _860);
    float _864 = _812 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _866 = -_850;
    float _868 = fma(_866, (*spvDescriptorSet0.vp_c15)._m0[21].z, _862);
    float _870 = _840 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _872 = 1.0 / _852;
    float _874 = _812 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _876 = fma(_868, -0.5, 0.5);
    float _878 = fma(_868, 0.5, 0.5);
    float _880 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[5].x, _864);
    float _882 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[4].x, _874);
    float _884 = fma(_878, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _886 = exp2(_870);
    float _888 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[4].z, _882);
    float _890 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[5].z, _880);
    float _892 = fma(_878, _884, -0.212114393711090087890625);
    float _894 = _856 * 0.693147182464599609375;
    float _896 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[4].w, _888);
    float _898 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[5].w, _890);
    float _900 = fma(_878, _892, 1.570728778839111328125);
    float _902 = sqrt(_876);
    float _904 = _896 * _872;
    float _906 = _894 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _908 = fma(_904, 0.5, 0.5);
    float _910 = -_848;
    float _912 = fma(_886, _858, _910);
    float _914 = _898 * _872;
    float _916 = fma(_912, 0.5, 0.5);
    float _918 = fma(_914, -0.5, 0.5);
    float _920 = _902 * 0.636619746685028076171875;
    float _922 = -_900;
    float _924 = fma(_920, _922, 1.0);
    float3 _2647 = float3(_908, _918, _906);
    float _926 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2647, float3(0.0), isnan(_2647)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2647, float3(0.0), isnan(_2647)), level(0.0)).x;
    float3 _2658 = float3(_908, _918, _906);
    float4 _929 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2658, float3(0.0), isnan(_2658)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2658, float3(0.0), isnan(_2658)), level(0.0)).xyzw;
    float _931 = _929.x;
    float _933 = _929.y;
    float _935 = _929.z;
    float _937 = _929.w;
    float2 _2674 = float2(_924, _916);
    float3 _941 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2674, float2(0.0), isnan(_2674)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2674, float2(0.0), isnan(_2674)), level(0.0)).xyz;
    float _943 = _941.x;
    float _945 = _941.y;
    float _947 = _941.z;
    float _949 = in.m_57.x;
    float _951 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _953 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _955 = -_404;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[18].w, _362);
    float _959 = -_424;
    float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[18].w, _374);
    int _963 = abs(_396);
    out.m_59.x = _190;
    float _965 = _957 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _967 = _812 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _969 = precise::max(_190, 0.800000011920928955078125);
    float _971 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[6].x, _967);
    float _973 = float(_963);
    float _975 = _953 * _951;
    float _977 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[6].z, _971);
    float _979 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[20].x, _975);
    float _981 = floor(_979);
    float _983 = _979 * 6.283185482025146484375;
    float _985 = _983 * 0.15915493667125701904296875;
    float _987 = _985 * 6.283185482025146484375;
    float _989 = cos(_987);
    int _991 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _993 = _991 != 0;
    float _995 = -_981;
    float _997 = _979 + _995;
    int _999 = abs(_392);
    float _1001 = in.m_51.w;
    float _1003 = precise::min(_969, 1.0);
    bool _1005 = _997 < 0.5;
    float _1007 = float(_1005);
    float _1009 = -_997;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1013 = fma(_1003, -5.000000476837158203125, 5.000000476837158203125);
    float _1015 = fma(_989, 0.5, 0.5);
    float _1017 = -_1007;
    float _1019 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _1021 = !_993;
    int _1023 = _1021 ? 0 : 1;
    float _1025 = -_1015;
    float _1027 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1029 = float(_999);
    int _1031 = abs(_1023);
    float _1033 = abs(_1011);
    float _1035 = _1029 * _1033;
    float _1037 = -_406;
    float _1039 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[18].w, _364);
    bool _1041 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1043 = isnan(0.5);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1049 = _1045 || _1047;
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1053 = float(_1031);
    float _1055 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[11].x, _965);
    out.m_61.w = _1001;
    float _1057 = precise::max(0.0, _190);
    float _1059 = _840 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1061 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1055);
    float _1063 = fma(_1053, _1027, _1035);
    out.m_63.w = _1051;
    float _1065 = _957 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1067 = _1061 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1069 = precise::min(_1057, 0.20000000298023223876953125);
    float _1071 = exp2(_1059);
    float _1073 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1065);
    float _1075 = abs(_1019);
    float _1077 = fma(_973, _1075, _1063);
    float _1079 = _1063;
    if (_1049)
    {
        _1079 = 1.0;
    }
    float _1081 = _1079;
    float _1083 = _1069 * 5.0;
    float _1085 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1073);
    float _1087 = 1.0 / _1067;
    float _1089 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1091 = _1083 * _1013;
    float _1093 = _1089 + _1067;
    float _1095 = _1091 * _1091;
    float _1097 = _1093 * _1087;
    float _1099 = _1097 * 0.5;
    float _1101 = _1081;
    if (!_1049)
    {
        float _1103 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1105 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1107 = _1103 * 0.15915493667125701904296875;
        float _1109 = _1105 * 0.15915493667125701904296875;
        float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1113 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1111);
        float _1115 = _1107 * 6.283185482025146484375;
        float _1117 = cos(_1115);
        float _1119 = _1107 * 6.283185482025146484375;
        float _1121 = sin(_1119);
        float _1123 = 1.0 / _1117;
        float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1127 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1125;
        float _1129 = _1109 * 6.283185482025146484375;
        float _1131 = cos(_1129);
        float _1133 = _1121 * _1123;
        float _1135 = _1109 * 6.283185482025146484375;
        float _1137 = sin(_1135);
        float _1139 = _1131 * _1133;
        float _1141 = 1.0 / _1113;
        float _1143 = 1.0 / _1139;
        float _1145 = 1.0 / _1127;
        float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1149 = _1141 * _1147;
        float _1151 = _1137 * _1143;
        float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1155 = fma(_1151, _1149, _1153);
        float _1157 = _1155 * _1145;
        float _1159 = precise::clamp(_1157, 0.0, 1.0);
        float _1161 = -_1159;
        float _1163 = _1161 + 1.0;
        _1101 = _1163;
    }
    float _1165 = _1101;
    float _1167 = -_1071;
    float _1169 = _1167 + 1.0;
    out.m_65.x = _1039;
    out.m_65.y = _957;
    out.m_65.z = _961;
    float _1171 = _1165 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1173 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[6].w, _977);
    bool _1175 = _1165 > 0.0;
    bool _1177 = isnan(_1165);
    bool _1179 = _1175 || _1177;
    bool _1181 = isnan(0.0);
    bool _1183 = _1179 || _1181;
    float _1185 = _896 + _852;
    float _1187 = _1077 * _1171;
    float _1189 = _1173 + _852;
    float _1191 = _852 * 0.5;
    out.m_67.x = _604;
    out.m_67.y = _600;
    out.m_67.z = _608;
    float _1193 = _1189 * 0.5;
    float _1195 = _1185 * 0.5;
    float _1197 = _1169 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1199 = fma(_898, -0.5, _1191);
    float _1201 = _1187 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_59.w = _1095;
    float _1203 = _1197 * _926;
    float _1205 = -_1197;
    float _1207 = _1205 + 1.0;
    out.gl_Position.x = _896;
    out.gl_Position.y = _898;
    out.gl_Position.z = _1173;
    out.gl_Position.w = _852;
    float _1209 = _937 * _1203;
    float _1211 = _947 * _1203;
    float _1213 = _937 * _1207;
    float _1215 = fma(_943, _1209, _931);
    float _1217 = fma(_945, _1209, _933);
    float _1219 = fma(_937, _1211, _935);
    out.m_69.x = _1195;
    out.m_69.y = _1199;
    out.m_69.z = _1193;
    out.m_69.w = _852;
    out.m_47.x = _1201;
    out.m_71.x = _1215;
    out.m_71.y = _1217;
    out.m_71.z = _1219;
    out.m_71.w = _1213;
    if (_1183)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1221 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1221;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
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
    float _102 = _100;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_94)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1279 = as_type<float>(_108);
        out.gl_Position.z = _1279;
    }
    if (!_94)
    {
        return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_90);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    if (_136)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _98;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _110 = as_type<int>(_140);
    }
    int _142 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1347 = as_type<float>(_142);
        out.gl_Position.z = _1347;
    }
    if (_136)
    {
        return out;
    }
    float _144 = in.m_51.x;
    float _146 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _148 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _146;
    float _150 = in.m_53.x;
    float _152 = in.m_53.y;
    float _154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _156 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _154;
    float _158 = _148 * _148;
    float _160 = fma(_156, _156, _158);
    float _162 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _162;
    float _166 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _168 = fma(_164, _164, _160);
    float _170 = sqrt(_168);
    float _172 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[191].x, _144);
    float _174 = _166 * (*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _176 = floor(_172);
    float _178 = _150 * 0.15915493667125701904296875;
    float _180 = precise::max(_170, 50.0);
    float _182 = _178 * 6.283185482025146484375;
    float _184 = sin(_182);
    float _186 = precise::min(_180, 100.0);
    float _188 = -_176;
    float _190 = _172 + _188;
    float _192 = _178 * 6.283185482025146484375;
    float _194 = cos(_192);
    float _196 = fma(_186, 0.0199999995529651641845703125, -1.0);
    float _198 = fma(_190, 0.800000011920928955078125, 0.300000011920928955078125);
    float _200 = fma(_196, 1.0499999523162841796875, 0.699999988079071044921875);
    float _202 = fma(_200, _152, _198);
    float _204 = _202 * _184;
    float _206 = _202 * _194;
    float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _210 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[191].z, _174);
    float2 _1470 = float2(_208, _210);
    float _212 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1470, float2(0.0), isnan(_1470)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1470, float2(0.0), isnan(_1470)), level(0.0)).y;
    float _214 = in.m_55.w;
    float _216 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _218 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _222 = _218 || _220;
    bool _224 = isnan(1.0);
    bool _226 = _222 || _224;
    float _228 = in.m_49.x;
    float _230 = in.m_49.y;
    float _232 = in.m_49.z;
    float _234 = in.m_44.x;
    float _236 = in.m_44.y;
    float _238 = in.m_44.z;
    float _240 = _178;
    float _242 = _216;
    if (!_226)
    {
        float _244 = _216 * _216;
        float _246 = _244 * 0.5;
        _240 = _246;
    }
    float _248 = _240;
    float _250 = _248;
    if (!_226)
    {
        float _252 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _250 = _252;
    }
    float _254 = _250;
    bool _256 = !_226;
    float _258 = _254;
    if (!_256)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _270 = _216 * _262;
        float _272 = 1.0 / _266;
        float _274 = _268 * 0.693147182464599609375;
        float _276 = exp2(_270);
        float _278 = 1.0 / _274;
        float _280 = _276 + (-1.0);
        float _282 = -_280;
        float _284 = fma(_282, _278, _216);
        float _286 = _284 * _272;
        float _288 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _258 = _288;
    }
    float _290 = _258;
    bool _292 = !_226;
    if (!_292)
    {
        float _294 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _296 = log2(_294);
        float _298 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _300 = _298 + 1.0;
        float _302 = 1.0 / _300;
        float _304 = _216 * _296;
        float _306 = exp2(_304);
        float _308 = -_306;
        float _310 = _308 + 1.0;
        float _312 = _310 * _302;
        _242 = _312;
    }
    float _314 = _242;
    float _316 = _290 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _318 = _290 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _320 = fma(_196, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _322 = _212 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _324 = fma(_314, _230, _316);
    float _326 = fma(_314, _228, _318);
    float _328 = _290 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _330 = _322 * _320;
    float _332 = fma(_324, _214, _236);
    float _334 = fma(_326, _214, _234);
    float _336 = fma(_314, _232, _328);
    float _338 = precise::max(_170, 200.0);
    float _340 = _332 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _342 = _332 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _344 = fma(_336, _214, _238);
    float _346 = _332 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _348 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[5].x, _340);
    float _350 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[4].x, _342);
    float _352 = precise::min(_338, 500.0);
    float _354 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[6].x, _346);
    float _356 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].z, _348);
    float _358 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].z, _350);
    float _360 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].z, _354);
    float _362 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _364 = _358 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _368 = _366 != 0;
    int _370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _372 = _370 != 0;
    float _374 = _360 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _376 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _378 = _362 + _376;
    float _380 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _382 = _364 + _380;
    float _384 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _386 = _374 + _384;
    float _388 = _378 * _378;
    bool _390 = !_368;
    int _392 = _390 ? 0 : 1;
    bool _394 = !_372;
    int _396 = _394 ? 0 : 1;
    float _398 = fma(_382, _382, _388);
    float _400 = fma(_386, _386, _398);
    float _402 = rsqrt(_400);
    float _404 = _378 * _402;
    float _406 = _382 * _402;
    float _408 = -_404;
    float _410 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[18].w, _378);
    float _412 = -_406;
    float _414 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[18].w, _382);
    float _416 = in.m_55.x;
    float _418 = in.m_55.y;
    float _420 = in.m_55.z;
    float _422 = _410 * _410;
    float _424 = _386 * _402;
    float _426 = fma(_414, _414, _422);
    float _428 = -_424;
    float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[18].w, _386);
    float _432 = in.m_53.z;
    float _434 = fma(_430, _430, _426);
    float _436 = sqrt(_434);
    float _438 = _416 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _440 = _418 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _442 = _420 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _444 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _446 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _448 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _450 = _402 * _436;
    float _452 = _444 * _450;
    float _454 = _446 * _450;
    float _456 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _204);
    float _458 = _448 * _450;
    float _460 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _432);
    float _462 = _452 * _456;
    float _464 = _458 * _460;
    float _466 = fma(_190, 0.449999988079071044921875, 0.699999988079071044921875);
    float _468 = fma(_330, _466, _206);
    float _470 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _468);
    float _472 = _454 * _470;
    float _474 = _472 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _476 = _472 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _478 = _472 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _480 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[10].x, _474);
    float _482 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[8].x, _476);
    float _484 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[9].x, _478);
    float _486 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[10].z, _480);
    float _488 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[8].z, _482);
    float _490 = fma(_352, 0.00166666670702397823333740234375, 0.66666662693023681640625);
    float _492 = _374 + _486;
    float _494 = _364 + _488;
    float _496 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[9].z, _484);
    float _498 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _500 = _492 + _498;
    float _502 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _504 = _494 + _502;
    float _506 = _362 + _496;
    float _508 = fma(_500, _490, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _510 = fma(_504, _490, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _512 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _514 = _506 + _512;
    float _516 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _518 = _508 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _522 = _510 + _520;
    float _524 = fma(_514, _490, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _526 = _518 * _518;
    float _528 = fma(_522, _522, _526);
    float _530 = sqrt(_528);
    bool _532 = _530 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _534 = _478;
    float _536 = _510;
    float _538 = _526;
    float _540 = _522;
    if (!_532)
    {
        _534 = _510;
    }
    float _542 = _534;
    float _544 = _542;
    if (!_532)
    {
        _536 = _508;
    }
    float _546 = _536;
    float _548 = _546;
    if (!_532)
    {
        _538 = _524;
    }
    float _550 = _538;
    bool _552 = !_532;
    float _554 = _550;
    if (!_552)
    {
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _558 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _560 = _530 + _558;
        float _562 = _524 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _564 = rsqrt(_528);
        float _566 = _560 * _556;
        float _568 = _566 * 0.15915493667125701904296875;
        float _570 = _568 * 6.283185482025146484375;
        float _572 = sin(_570);
        float _574 = _568 * 6.283185482025146484375;
        float _576 = cos(_574);
        float _578 = fma(_572, _562, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _580 = _564 * _578;
        float _582 = _576 + (-1.0);
        float _584 = fma(_522, _580, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _586 = fma(_518, _580, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _588 = _582 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _590 = fma(_524, _576, _588);
        _554 = _590;
        _544 = _584;
        _548 = _586;
    }
    float _592 = _554;
    float _594 = _544;
    float _596 = _548;
    float _598 = -_404;
    float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[18].w, _592);
    float _602 = -_406;
    float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[18].w, _594);
    float _606 = -_424;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _596);
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _612 = _600 + _610;
    float _614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _616 = _604 + _614;
    float _618 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _620 = _608 + _618;
    float _622 = _612 * _612;
    float _624 = fma(_616, _616, _622);
    float _626 = fma(_620, _620, _624);
    float _628 = rsqrt(_626);
    float _630 = sqrt(_626);
    float _632 = _628 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _634 = _616 * _632;
    float _636 = _620 * _632;
    float _638 = _634 * _634;
    float _640 = _636 * _636;
    float _642 = _638 + _640;
    float _644 = sqrt(_642);
    bool _646 = _644 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _648 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _650 = _644 + _648;
    float _652 = _620;
    float _654 = _642;
    float _656 = _650;
    float _658 = _612;
    if (_646)
    {
        float _660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _652 = _660;
    }
    float _662 = _652;
    if (_646)
    {
        float _664 = rsqrt(_642);
        _654 = _664;
    }
    float _666 = _654;
    float _668 = _666;
    if (_646)
    {
        float _670 = _650 * _662;
        _656 = _670;
    }
    float _672 = _656;
    if (_646)
    {
        float _674 = _672 * 0.15915493667125701904296875;
        _540 = _674;
    }
    float _676 = _540;
    float _678 = _662;
    float _680 = _676;
    if (_646)
    {
        float _682 = _676 * 6.283185482025146484375;
        float _684 = sin(_682);
        _678 = _684;
    }
    float _686 = _678;
    float _688 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _690 = precise::max(0.0, _688);
    float _692 = _622;
    float _694 = _690;
    if (_646)
    {
        float _696 = _676 * 6.283185482025146484375;
        float _698 = cos(_696);
        _692 = _698;
    }
    float _700 = _692;
    float _702 = -_632;
    float _704 = -_690;
    float _706 = fma(_612, _702, _704);
    if (!_646)
    {
        _658 = _634;
    }
    float _708 = _658;
    float _710 = _708;
    if (_646)
    {
        float _712 = _706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _694 = _712;
    }
    float _714 = _694;
    float _716 = _686;
    float _718 = _714;
    if (_646)
    {
        float _720 = fma(_686, _714, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _716 = _720;
    }
    float _722 = _716;
    float _724 = _722;
    float _726 = _700;
    if (_646)
    {
        float _728 = _700 + (-1.0);
        _718 = _728;
    }
    float _730 = _718;
    float _732 = 0.0;
    float _734 = _730;
    if (_646)
    {
        float _736 = _666 * _722;
        _732 = _736;
    }
    float _738 = _732;
    if (!_646)
    {
        _724 = _706;
    }
    float _740 = _724;
    float _742 = _740;
    if (_646)
    {
        float _744 = _730 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _680 = _744;
    }
    float _746 = _680;
    if (_646)
    {
        float _748 = _634 * _738;
        _710 = _748;
    }
    float _750 = _710;
    if (!_646)
    {
        _734 = _636;
    }
    float _752 = _734;
    float _754 = _752;
    if (_646)
    {
        float _756 = _636 * _738;
        _754 = _756;
    }
    float _758 = _754;
    if (_646)
    {
        float _760 = fma(_706, _700, _746);
        _742 = _760;
    }
    float _762 = _742;
    if (!_646)
    {
        _668 = _638;
    }
    float _764 = _668;
    float _766 = _764;
    if (_646)
    {
        float _768 = _750 * _750;
        _766 = _768;
    }
    float _770 = _766;
    float _772 = _600 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_646)
    {
        _726 = _640;
    }
    float _774 = _726;
    float _776 = _774;
    if (_646)
    {
        float _778 = _758 * _758;
        _776 = _778;
    }
    float _780 = _776;
    float _782 = fma(_762, _762, _770);
    float _784 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _786 = fma(_630, (*spvDescriptorSet0.vp_c15)._m0[23].w, _784);
    float _788 = precise::clamp(_786, 0.0, 1.0);
    float _790 = _600 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _792 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[2].x, _772);
    float _794 = _782 + _780;
    float _796 = _600 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _798 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[1].x, _790);
    float _800 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[2].z, _792);
    float _802 = _600 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _804 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[0].x, _796);
    float _806 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[1].z, _798);
    float _808 = rsqrt(_794);
    float _810 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[0].z, _804);
    float _812 = _806 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _814 = _800 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _816 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[3].x, _802);
    float _818 = _810 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _820 = _812 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _822 = -_788;
    float _824 = _822 + 1.0;
    float _826 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _828 = _814 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _830 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[3].z, _816);
    float _832 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[7].x, _820);
    float _834 = -_828;
    float _836 = fma(_834, _826, 1.0);
    float _838 = abs(_824);
    float _840 = log2(_838);
    float _842 = _830 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _844 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[7].z, _832);
    float _846 = _808 * _750;
    float _848 = _808 * _762;
    float _850 = _808 * _758;
    float _852 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[7].w, _844);
    float _854 = _846 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _856 = log2(_836);
    float _858 = _848 + 1.0;
    float _860 = -_854;
    float _862 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[21].y, _860);
    float _864 = _812 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _866 = -_850;
    float _868 = fma(_866, (*spvDescriptorSet0.vp_c15)._m0[21].z, _862);
    float _870 = _840 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _872 = 1.0 / _852;
    float _874 = _812 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _876 = fma(_868, -0.5, 0.5);
    float _878 = fma(_868, 0.5, 0.5);
    float _880 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[5].x, _864);
    float _882 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[4].x, _874);
    float _884 = fma(_878, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _886 = exp2(_870);
    float _888 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[4].z, _882);
    float _890 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[5].z, _880);
    float _892 = fma(_878, _884, -0.212114393711090087890625);
    float _894 = _856 * 0.693147182464599609375;
    float _896 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[4].w, _888);
    float _898 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[5].w, _890);
    float _900 = fma(_878, _892, 1.570728778839111328125);
    float _902 = sqrt(_876);
    float _904 = _896 * _872;
    float _906 = _894 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _908 = fma(_904, 0.5, 0.5);
    float _910 = -_848;
    float _912 = fma(_886, _858, _910);
    float _914 = _898 * _872;
    float _916 = fma(_912, 0.5, 0.5);
    float _918 = fma(_914, -0.5, 0.5);
    float _920 = _902 * 0.636619746685028076171875;
    float _922 = -_900;
    float _924 = fma(_920, _922, 1.0);
    float3 _2647 = float3(_908, _918, _906);
    float _926 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2647, float3(0.0), isnan(_2647)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2647, float3(0.0), isnan(_2647)), level(0.0)).x;
    float3 _2658 = float3(_908, _918, _906);
    float4 _929 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2658, float3(0.0), isnan(_2658)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2658, float3(0.0), isnan(_2658)), level(0.0)).xyzw;
    float _931 = _929.x;
    float _933 = _929.y;
    float _935 = _929.z;
    float _937 = _929.w;
    float2 _2674 = float2(_924, _916);
    float3 _941 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2674, float2(0.0), isnan(_2674)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2674, float2(0.0), isnan(_2674)), level(0.0)).xyz;
    float _943 = _941.x;
    float _945 = _941.y;
    float _947 = _941.z;
    float _949 = in.m_57.x;
    float _951 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _953 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _955 = -_404;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[18].w, _362);
    float _959 = -_424;
    float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[18].w, _374);
    int _963 = abs(_396);
    out.m_59.x = _190;
    float _965 = _957 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _967 = _812 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _969 = precise::max(_190, 0.800000011920928955078125);
    float _971 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[6].x, _967);
    float _973 = float(_963);
    float _975 = _953 * _951;
    float _977 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[6].z, _971);
    float _979 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[20].x, _975);
    float _981 = floor(_979);
    float _983 = _979 * 6.283185482025146484375;
    float _985 = _983 * 0.15915493667125701904296875;
    float _987 = _985 * 6.283185482025146484375;
    float _989 = cos(_987);
    int _991 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _993 = _991 != 0;
    float _995 = -_981;
    float _997 = _979 + _995;
    int _999 = abs(_392);
    float _1001 = in.m_51.w;
    float _1003 = precise::min(_969, 1.0);
    bool _1005 = _997 < 0.5;
    float _1007 = float(_1005);
    float _1009 = -_997;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1013 = fma(_1003, -5.000000476837158203125, 5.000000476837158203125);
    float _1015 = fma(_989, 0.5, 0.5);
    float _1017 = -_1007;
    float _1019 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _1021 = !_993;
    int _1023 = _1021 ? 0 : 1;
    float _1025 = -_1015;
    float _1027 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1029 = float(_999);
    int _1031 = abs(_1023);
    float _1033 = abs(_1011);
    float _1035 = _1029 * _1033;
    float _1037 = -_406;
    float _1039 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[18].w, _364);
    bool _1041 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1043 = isnan(0.5);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1049 = _1045 || _1047;
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1053 = float(_1031);
    float _1055 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[11].x, _965);
    out.m_61.w = _1001;
    float _1057 = precise::max(0.0, _190);
    float _1059 = _840 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1061 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1055);
    float _1063 = fma(_1053, _1027, _1035);
    out.m_63.w = _1051;
    float _1065 = _957 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1067 = _1061 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1069 = precise::min(_1057, 0.20000000298023223876953125);
    float _1071 = exp2(_1059);
    float _1073 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1065);
    float _1075 = abs(_1019);
    float _1077 = fma(_973, _1075, _1063);
    float _1079 = _1063;
    if (_1049)
    {
        _1079 = 1.0;
    }
    float _1081 = _1079;
    float _1083 = _1069 * 5.0;
    float _1085 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1073);
    float _1087 = 1.0 / _1067;
    float _1089 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1091 = _1083 * _1013;
    float _1093 = _1089 + _1067;
    float _1095 = _1091 * _1091;
    float _1097 = _1093 * _1087;
    float _1099 = _1097 * 0.5;
    float _1101 = _1081;
    if (!_1049)
    {
        float _1103 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1105 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1107 = _1103 * 0.15915493667125701904296875;
        float _1109 = _1105 * 0.15915493667125701904296875;
        float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1113 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1111);
        float _1115 = _1107 * 6.283185482025146484375;
        float _1117 = cos(_1115);
        float _1119 = _1107 * 6.283185482025146484375;
        float _1121 = sin(_1119);
        float _1123 = 1.0 / _1117;
        float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1127 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1125;
        float _1129 = _1109 * 6.283185482025146484375;
        float _1131 = cos(_1129);
        float _1133 = _1121 * _1123;
        float _1135 = _1109 * 6.283185482025146484375;
        float _1137 = sin(_1135);
        float _1139 = _1131 * _1133;
        float _1141 = 1.0 / _1113;
        float _1143 = 1.0 / _1139;
        float _1145 = 1.0 / _1127;
        float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1149 = _1141 * _1147;
        float _1151 = _1137 * _1143;
        float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1155 = fma(_1151, _1149, _1153);
        float _1157 = _1155 * _1145;
        float _1159 = precise::clamp(_1157, 0.0, 1.0);
        float _1161 = -_1159;
        float _1163 = _1161 + 1.0;
        _1101 = _1163;
    }
    float _1165 = _1101;
    float _1167 = -_1071;
    float _1169 = _1167 + 1.0;
    out.m_65.x = _1039;
    out.m_65.y = _957;
    out.m_65.z = _961;
    float _1171 = _1165 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1173 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[6].w, _977);
    bool _1175 = _1165 > 0.0;
    bool _1177 = isnan(_1165);
    bool _1179 = _1175 || _1177;
    bool _1181 = isnan(0.0);
    bool _1183 = _1179 || _1181;
    float _1185 = _896 + _852;
    float _1187 = _1077 * _1171;
    float _1189 = _1173 + _852;
    float _1191 = _852 * 0.5;
    out.m_67.x = _604;
    out.m_67.y = _600;
    out.m_67.z = _608;
    float _1193 = _1189 * 0.5;
    float _1195 = _1185 * 0.5;
    float _1197 = _1169 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1199 = fma(_898, -0.5, _1191);
    float _1201 = _1187 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_59.w = _1095;
    float _1203 = _1197 * _926;
    float _1205 = -_1197;
    float _1207 = _1205 + 1.0;
    out.gl_Position.x = _896;
    out.gl_Position.y = _898;
    out.gl_Position.z = _1173;
    out.gl_Position.w = _852;
    float _1209 = _937 * _1203;
    float _1211 = _947 * _1203;
    float _1213 = _937 * _1207;
    float _1215 = fma(_943, _1209, _931);
    float _1217 = fma(_945, _1209, _933);
    float _1219 = fma(_937, _1211, _935);
    out.m_69.x = _1195;
    out.m_69.y = _1199;
    out.m_69.z = _1193;
    out.m_69.w = _852;
    out.m_47.x = _1201;
    out.m_71.x = _1215;
    out.m_71.y = _1217;
    out.m_71.z = _1219;
    out.m_71.w = _1213;
    if (_1183)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1221 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1221;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
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
    float _102 = _100;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_94)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1279 = as_type<float>(_108);
        out.gl_Position.z = _1279;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_90);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    if (_136)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _98;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _140 = _138 * 5.0;
        _110 = as_type<int>(_140);
    }
    int _142 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1347 = as_type<float>(_142);
        out.gl_Position.z = _1347;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_51.x;
    float _146 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _148 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _146;
    float _150 = in.m_53.x;
    float _152 = in.m_53.y;
    float _154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _156 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _154;
    float _158 = _148 * _148;
    float _160 = fma(_156, _156, _158);
    float _162 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _162;
    float _166 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _168 = fma(_164, _164, _160);
    float _170 = sqrt(_168);
    float _172 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[191].x, _144);
    float _174 = _166 * (*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _176 = floor(_172);
    float _178 = _150 * 0.15915493667125701904296875;
    float _180 = precise::max(_170, 50.0);
    float _182 = _178 * 6.283185482025146484375;
    float _184 = sin(_182);
    float _186 = precise::min(_180, 100.0);
    float _188 = -_176;
    float _190 = _172 + _188;
    float _192 = _178 * 6.283185482025146484375;
    float _194 = cos(_192);
    float _196 = fma(_186, 0.0199999995529651641845703125, -1.0);
    float _198 = fma(_190, 0.800000011920928955078125, 0.300000011920928955078125);
    float _200 = fma(_196, 1.0499999523162841796875, 0.699999988079071044921875);
    float _202 = fma(_200, _152, _198);
    float _204 = _202 * _184;
    float _206 = _202 * _194;
    float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _210 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[191].z, _174);
    float2 _1470 = float2(_208, _210);
    float _212 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1470, float2(0.0), isnan(_1470)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1470, float2(0.0), isnan(_1470)), level(0.0)).y;
    float _214 = in.m_55.w;
    float _216 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _218 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _222 = _218 || _220;
    bool _224 = isnan(1.0);
    bool _226 = _222 || _224;
    float _228 = in.m_49.x;
    float _230 = in.m_49.y;
    float _232 = in.m_49.z;
    float _234 = in.m_44.x;
    float _236 = in.m_44.y;
    float _238 = in.m_44.z;
    float _240 = _178;
    float _242 = _216;
    if (!_226)
    {
        float _244 = _216 * _216;
        float _246 = _244 * 0.5;
        _240 = _246;
    }
    float _248 = _240;
    float _250 = _248;
    if (!_226)
    {
        float _252 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _250 = _252;
    }
    float _254 = _250;
    bool _256 = !_226;
    float _258 = _254;
    if (!_256)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _270 = _216 * _262;
        float _272 = 1.0 / _266;
        float _274 = _268 * 0.693147182464599609375;
        float _276 = exp2(_270);
        float _278 = 1.0 / _274;
        float _280 = _276 + (-1.0);
        float _282 = -_280;
        float _284 = fma(_282, _278, _216);
        float _286 = _284 * _272;
        float _288 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _258 = _288;
    }
    float _290 = _258;
    bool _292 = !_226;
    if (!_292)
    {
        float _294 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _296 = log2(_294);
        float _298 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _300 = _298 + 1.0;
        float _302 = 1.0 / _300;
        float _304 = _216 * _296;
        float _306 = exp2(_304);
        float _308 = -_306;
        float _310 = _308 + 1.0;
        float _312 = _310 * _302;
        _242 = _312;
    }
    float _314 = _242;
    float _316 = _290 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _318 = _290 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _320 = fma(_196, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _322 = _212 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _324 = fma(_314, _230, _316);
    float _326 = fma(_314, _228, _318);
    float _328 = _290 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _330 = _322 * _320;
    float _332 = fma(_324, _214, _236);
    float _334 = fma(_326, _214, _234);
    float _336 = fma(_314, _232, _328);
    float _338 = precise::max(_170, 200.0);
    float _340 = _332 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _342 = _332 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _344 = fma(_336, _214, _238);
    float _346 = _332 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _348 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[5].x, _340);
    float _350 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[4].x, _342);
    float _352 = precise::min(_338, 500.0);
    float _354 = fma(_334, (*spvDescriptorSet0.vp_c10)._m0[6].x, _346);
    float _356 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].z, _348);
    float _358 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].z, _350);
    float _360 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].z, _354);
    float _362 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _364 = _358 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _368 = _366 != 0;
    int _370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _372 = _370 != 0;
    float _374 = _360 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _376 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _378 = _362 + _376;
    float _380 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _382 = _364 + _380;
    float _384 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _386 = _374 + _384;
    float _388 = _378 * _378;
    bool _390 = !_368;
    int _392 = _390 ? 0 : 1;
    bool _394 = !_372;
    int _396 = _394 ? 0 : 1;
    float _398 = fma(_382, _382, _388);
    float _400 = fma(_386, _386, _398);
    float _402 = rsqrt(_400);
    float _404 = _378 * _402;
    float _406 = _382 * _402;
    float _408 = -_404;
    float _410 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[18].w, _378);
    float _412 = -_406;
    float _414 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[18].w, _382);
    float _416 = in.m_55.x;
    float _418 = in.m_55.y;
    float _420 = in.m_55.z;
    float _422 = _410 * _410;
    float _424 = _386 * _402;
    float _426 = fma(_414, _414, _422);
    float _428 = -_424;
    float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[18].w, _386);
    float _432 = in.m_53.z;
    float _434 = fma(_430, _430, _426);
    float _436 = sqrt(_434);
    float _438 = _416 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _440 = _418 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _442 = _420 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _444 = _438 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _446 = _440 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _448 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _450 = _402 * _436;
    float _452 = _444 * _450;
    float _454 = _446 * _450;
    float _456 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _204);
    float _458 = _448 * _450;
    float _460 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _432);
    float _462 = _452 * _456;
    float _464 = _458 * _460;
    float _466 = fma(_190, 0.449999988079071044921875, 0.699999988079071044921875);
    float _468 = fma(_330, _466, _206);
    float _470 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _468);
    float _472 = _454 * _470;
    float _474 = _472 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _476 = _472 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _478 = _472 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _480 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[10].x, _474);
    float _482 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[8].x, _476);
    float _484 = fma(_462, (*spvDescriptorSet0.vp_c10)._m0[9].x, _478);
    float _486 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[10].z, _480);
    float _488 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[8].z, _482);
    float _490 = fma(_352, 0.00166666670702397823333740234375, 0.66666662693023681640625);
    float _492 = _374 + _486;
    float _494 = _364 + _488;
    float _496 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[9].z, _484);
    float _498 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _500 = _492 + _498;
    float _502 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _504 = _494 + _502;
    float _506 = _362 + _496;
    float _508 = fma(_500, _490, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _510 = fma(_504, _490, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _512 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _514 = _506 + _512;
    float _516 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _518 = _508 + _516;
    float _520 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _522 = _510 + _520;
    float _524 = fma(_514, _490, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _526 = _518 * _518;
    float _528 = fma(_522, _522, _526);
    float _530 = sqrt(_528);
    bool _532 = _530 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _534 = _478;
    float _536 = _510;
    float _538 = _526;
    float _540 = _522;
    if (!_532)
    {
        _534 = _510;
    }
    float _542 = _534;
    float _544 = _542;
    if (!_532)
    {
        _536 = _508;
    }
    float _546 = _536;
    float _548 = _546;
    if (!_532)
    {
        _538 = _524;
    }
    float _550 = _538;
    bool _552 = !_532;
    float _554 = _550;
    if (!_552)
    {
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _558 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _560 = _530 + _558;
        float _562 = _524 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _564 = rsqrt(_528);
        float _566 = _560 * _556;
        float _568 = _566 * 0.15915493667125701904296875;
        float _570 = _568 * 6.283185482025146484375;
        float _572 = sin(_570);
        float _574 = _568 * 6.283185482025146484375;
        float _576 = cos(_574);
        float _578 = fma(_572, _562, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _580 = _564 * _578;
        float _582 = _576 + (-1.0);
        float _584 = fma(_522, _580, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _586 = fma(_518, _580, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _588 = _582 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _590 = fma(_524, _576, _588);
        _554 = _590;
        _544 = _584;
        _548 = _586;
    }
    float _592 = _554;
    float _594 = _544;
    float _596 = _548;
    float _598 = -_404;
    float _600 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[18].w, _592);
    float _602 = -_406;
    float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[18].w, _594);
    float _606 = -_424;
    float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _596);
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _612 = _600 + _610;
    float _614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _616 = _604 + _614;
    float _618 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _620 = _608 + _618;
    float _622 = _612 * _612;
    float _624 = fma(_616, _616, _622);
    float _626 = fma(_620, _620, _624);
    float _628 = rsqrt(_626);
    float _630 = sqrt(_626);
    float _632 = _628 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _634 = _616 * _632;
    float _636 = _620 * _632;
    float _638 = _634 * _634;
    float _640 = _636 * _636;
    float _642 = _638 + _640;
    float _644 = sqrt(_642);
    bool _646 = _644 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _648 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _650 = _644 + _648;
    float _652 = _620;
    float _654 = _642;
    float _656 = _650;
    float _658 = _612;
    if (_646)
    {
        float _660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _652 = _660;
    }
    float _662 = _652;
    if (_646)
    {
        float _664 = rsqrt(_642);
        _654 = _664;
    }
    float _666 = _654;
    float _668 = _666;
    if (_646)
    {
        float _670 = _650 * _662;
        _656 = _670;
    }
    float _672 = _656;
    if (_646)
    {
        float _674 = _672 * 0.15915493667125701904296875;
        _540 = _674;
    }
    float _676 = _540;
    float _678 = _662;
    float _680 = _676;
    if (_646)
    {
        float _682 = _676 * 6.283185482025146484375;
        float _684 = sin(_682);
        _678 = _684;
    }
    float _686 = _678;
    float _688 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _690 = precise::max(0.0, _688);
    float _692 = _622;
    float _694 = _690;
    if (_646)
    {
        float _696 = _676 * 6.283185482025146484375;
        float _698 = cos(_696);
        _692 = _698;
    }
    float _700 = _692;
    float _702 = -_632;
    float _704 = -_690;
    float _706 = fma(_612, _702, _704);
    if (!_646)
    {
        _658 = _634;
    }
    float _708 = _658;
    float _710 = _708;
    if (_646)
    {
        float _712 = _706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _694 = _712;
    }
    float _714 = _694;
    float _716 = _686;
    float _718 = _714;
    if (_646)
    {
        float _720 = fma(_686, _714, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _716 = _720;
    }
    float _722 = _716;
    float _724 = _722;
    float _726 = _700;
    if (_646)
    {
        float _728 = _700 + (-1.0);
        _718 = _728;
    }
    float _730 = _718;
    float _732 = 0.0;
    float _734 = _730;
    if (_646)
    {
        float _736 = _666 * _722;
        _732 = _736;
    }
    float _738 = _732;
    if (!_646)
    {
        _724 = _706;
    }
    float _740 = _724;
    float _742 = _740;
    if (_646)
    {
        float _744 = _730 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _680 = _744;
    }
    float _746 = _680;
    if (_646)
    {
        float _748 = _634 * _738;
        _710 = _748;
    }
    float _750 = _710;
    if (!_646)
    {
        _734 = _636;
    }
    float _752 = _734;
    float _754 = _752;
    if (_646)
    {
        float _756 = _636 * _738;
        _754 = _756;
    }
    float _758 = _754;
    if (_646)
    {
        float _760 = fma(_706, _700, _746);
        _742 = _760;
    }
    float _762 = _742;
    if (!_646)
    {
        _668 = _638;
    }
    float _764 = _668;
    float _766 = _764;
    if (_646)
    {
        float _768 = _750 * _750;
        _766 = _768;
    }
    float _770 = _766;
    float _772 = _600 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_646)
    {
        _726 = _640;
    }
    float _774 = _726;
    float _776 = _774;
    if (_646)
    {
        float _778 = _758 * _758;
        _776 = _778;
    }
    float _780 = _776;
    float _782 = fma(_762, _762, _770);
    float _784 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _786 = fma(_630, (*spvDescriptorSet0.vp_c15)._m0[23].w, _784);
    float _788 = precise::clamp(_786, 0.0, 1.0);
    float _790 = _600 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _792 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[2].x, _772);
    float _794 = _782 + _780;
    float _796 = _600 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _798 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[1].x, _790);
    float _800 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[2].z, _792);
    float _802 = _600 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _804 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[0].x, _796);
    float _806 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[1].z, _798);
    float _808 = rsqrt(_794);
    float _810 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[0].z, _804);
    float _812 = _806 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _814 = _800 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _816 = fma(_604, (*spvDescriptorSet0.vp_c8)._m0[3].x, _802);
    float _818 = _810 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _820 = _812 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _822 = -_788;
    float _824 = _822 + 1.0;
    float _826 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _828 = _814 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _830 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[3].z, _816);
    float _832 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[7].x, _820);
    float _834 = -_828;
    float _836 = fma(_834, _826, 1.0);
    float _838 = abs(_824);
    float _840 = log2(_838);
    float _842 = _830 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _844 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[7].z, _832);
    float _846 = _808 * _750;
    float _848 = _808 * _762;
    float _850 = _808 * _758;
    float _852 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[7].w, _844);
    float _854 = _846 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _856 = log2(_836);
    float _858 = _848 + 1.0;
    float _860 = -_854;
    float _862 = fma(_848, (*spvDescriptorSet0.vp_c15)._m0[21].y, _860);
    float _864 = _812 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _866 = -_850;
    float _868 = fma(_866, (*spvDescriptorSet0.vp_c15)._m0[21].z, _862);
    float _870 = _840 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _872 = 1.0 / _852;
    float _874 = _812 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _876 = fma(_868, -0.5, 0.5);
    float _878 = fma(_868, 0.5, 0.5);
    float _880 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[5].x, _864);
    float _882 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[4].x, _874);
    float _884 = fma(_878, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _886 = exp2(_870);
    float _888 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[4].z, _882);
    float _890 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[5].z, _880);
    float _892 = fma(_878, _884, -0.212114393711090087890625);
    float _894 = _856 * 0.693147182464599609375;
    float _896 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[4].w, _888);
    float _898 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[5].w, _890);
    float _900 = fma(_878, _892, 1.570728778839111328125);
    float _902 = sqrt(_876);
    float _904 = _896 * _872;
    float _906 = _894 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _908 = fma(_904, 0.5, 0.5);
    float _910 = -_848;
    float _912 = fma(_886, _858, _910);
    float _914 = _898 * _872;
    float _916 = fma(_912, 0.5, 0.5);
    float _918 = fma(_914, -0.5, 0.5);
    float _920 = _902 * 0.636619746685028076171875;
    float _922 = -_900;
    float _924 = fma(_920, _922, 1.0);
    float3 _2647 = float3(_908, _918, _906);
    float _926 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2647, float3(0.0), isnan(_2647)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2647, float3(0.0), isnan(_2647)), level(0.0)).x;
    float3 _2658 = float3(_908, _918, _906);
    float4 _929 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2658, float3(0.0), isnan(_2658)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2658, float3(0.0), isnan(_2658)), level(0.0)).xyzw;
    float _931 = _929.x;
    float _933 = _929.y;
    float _935 = _929.z;
    float _937 = _929.w;
    float2 _2674 = float2(_924, _916);
    float3 _941 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2674, float2(0.0), isnan(_2674)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2674, float2(0.0), isnan(_2674)), level(0.0)).xyz;
    float _943 = _941.x;
    float _945 = _941.y;
    float _947 = _941.z;
    float _949 = in.m_57.x;
    float _951 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _953 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _955 = -_404;
    float _957 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[18].w, _362);
    float _959 = -_424;
    float _961 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[18].w, _374);
    int _963 = abs(_396);
    out.m_59.x = _190;
    float _965 = _957 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _967 = _812 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _969 = precise::max(_190, 0.800000011920928955078125);
    float _971 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[6].x, _967);
    float _973 = float(_963);
    float _975 = _953 * _951;
    float _977 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[6].z, _971);
    float _979 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[20].x, _975);
    float _981 = floor(_979);
    float _983 = _979 * 6.283185482025146484375;
    float _985 = _983 * 0.15915493667125701904296875;
    float _987 = _985 * 6.283185482025146484375;
    float _989 = cos(_987);
    int _991 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _993 = _991 != 0;
    float _995 = -_981;
    float _997 = _979 + _995;
    int _999 = abs(_392);
    float _1001 = in.m_51.w;
    float _1003 = precise::min(_969, 1.0);
    bool _1005 = _997 < 0.5;
    float _1007 = float(_1005);
    float _1009 = -_997;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1013 = fma(_1003, -5.000000476837158203125, 5.000000476837158203125);
    float _1015 = fma(_989, 0.5, 0.5);
    float _1017 = -_1007;
    float _1019 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _1021 = !_993;
    int _1023 = _1021 ? 0 : 1;
    float _1025 = -_1015;
    float _1027 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1029 = float(_999);
    int _1031 = abs(_1023);
    float _1033 = abs(_1011);
    float _1035 = _1029 * _1033;
    float _1037 = -_406;
    float _1039 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[18].w, _364);
    bool _1041 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1043 = isnan(0.5);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1049 = _1045 || _1047;
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1053 = float(_1031);
    float _1055 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[11].x, _965);
    out.m_61.w = _1001;
    float _1057 = precise::max(0.0, _190);
    float _1059 = _840 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1061 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1055);
    float _1063 = fma(_1053, _1027, _1035);
    out.m_63.w = _1051;
    float _1065 = _957 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1067 = _1061 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1069 = precise::min(_1057, 0.20000000298023223876953125);
    float _1071 = exp2(_1059);
    float _1073 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1065);
    float _1075 = abs(_1019);
    float _1077 = fma(_973, _1075, _1063);
    float _1079 = _1063;
    if (_1049)
    {
        _1079 = 1.0;
    }
    float _1081 = _1079;
    float _1083 = _1069 * 5.0;
    float _1085 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1073);
    float _1087 = 1.0 / _1067;
    float _1089 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1091 = _1083 * _1013;
    float _1093 = _1089 + _1067;
    float _1095 = _1091 * _1091;
    float _1097 = _1093 * _1087;
    float _1099 = _1097 * 0.5;
    float _1101 = _1081;
    if (!_1049)
    {
        float _1103 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1105 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1107 = _1103 * 0.15915493667125701904296875;
        float _1109 = _1105 * 0.15915493667125701904296875;
        float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1113 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1111);
        float _1115 = _1107 * 6.283185482025146484375;
        float _1117 = cos(_1115);
        float _1119 = _1107 * 6.283185482025146484375;
        float _1121 = sin(_1119);
        float _1123 = 1.0 / _1117;
        float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1127 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1125;
        float _1129 = _1109 * 6.283185482025146484375;
        float _1131 = cos(_1129);
        float _1133 = _1121 * _1123;
        float _1135 = _1109 * 6.283185482025146484375;
        float _1137 = sin(_1135);
        float _1139 = _1131 * _1133;
        float _1141 = 1.0 / _1113;
        float _1143 = 1.0 / _1139;
        float _1145 = 1.0 / _1127;
        float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1149 = _1141 * _1147;
        float _1151 = _1137 * _1143;
        float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1155 = fma(_1151, _1149, _1153);
        float _1157 = _1155 * _1145;
        float _1159 = precise::clamp(_1157, 0.0, 1.0);
        float _1161 = -_1159;
        float _1163 = _1161 + 1.0;
        _1101 = _1163;
    }
    float _1165 = _1101;
    float _1167 = -_1071;
    float _1169 = _1167 + 1.0;
    out.m_65.x = _1039;
    out.m_65.y = _957;
    out.m_65.z = _961;
    float _1171 = _1165 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1173 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[6].w, _977);
    bool _1175 = _1165 > 0.0;
    bool _1177 = isnan(_1165);
    bool _1179 = _1175 || _1177;
    bool _1181 = isnan(0.0);
    bool _1183 = _1179 || _1181;
    float _1185 = _896 + _852;
    float _1187 = _1077 * _1171;
    float _1189 = _1173 + _852;
    float _1191 = _852 * 0.5;
    out.m_67.x = _604;
    out.m_67.y = _600;
    out.m_67.z = _608;
    float _1193 = _1189 * 0.5;
    float _1195 = _1185 * 0.5;
    float _1197 = _1169 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1199 = fma(_898, -0.5, _1191);
    float _1201 = _1187 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_59.w = _1095;
    float _1203 = _1197 * _926;
    float _1205 = -_1197;
    float _1207 = _1205 + 1.0;
    out.gl_Position.x = _896;
    out.gl_Position.y = _898;
    out.gl_Position.z = _1173;
    out.gl_Position.w = _852;
    float _1209 = _937 * _1203;
    float _1211 = _947 * _1203;
    float _1213 = _937 * _1207;
    float _1215 = fma(_943, _1209, _931);
    float _1217 = fma(_945, _1209, _933);
    float _1219 = fma(_937, _1211, _935);
    out.m_69.x = _1195;
    out.m_69.y = _1199;
    out.m_69.z = _1193;
    out.m_69.w = _852;
    out.m_47.x = _1201;
    out.m_71.x = _1215;
    out.m_71.y = _1217;
    out.m_71.z = _1219;
    out.m_71.w = _1213;
    if (_1183)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1221 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1221;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

