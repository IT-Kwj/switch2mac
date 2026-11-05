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
    float4 m_59 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_51 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1595 = as_type<float>(_106);
        out.gl_Position.z = _1595;
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
        _100 = _126;
    }
    float _128 = _100;
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
        float _1664 = as_type<float>(_142);
        out.gl_Position.z = _1664;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.w;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = in.m_42.x;
    float _166 = in.m_42.y;
    float _168 = in.m_42.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    float _246 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_244, _160, _246);
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _162, _250);
    float _258 = fma(_252, _144, _166);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _168);
    float _264 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _266 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _268 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _270 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _264);
    float _272 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _266);
    float _274 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _268);
    float _276 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _270);
    float _278 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _272);
    float _280 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _274);
    float _282 = _276 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _284 = _278 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _286 = _280 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _288 = in.m_49.x;
    float _290 = in.m_49.y;
    float _292 = in.m_49.z;
    float _294 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _296 = _282 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _300 = _284 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _304 = _286 + _302;
    float _306 = _296 * _296;
    float _308 = fma(_300, _300, _306);
    float _310 = fma(_304, _304, _308);
    float _312 = rsqrt(_310);
    float _314 = _290 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _316 = _288 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = _292 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _322 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _324 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _326 = _296 * _312;
    float _328 = _300 * _312;
    float _330 = -_326;
    float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[18].w, _296);
    float _334 = _304 * _312;
    float _336 = -_328;
    float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[18].w, _300);
    float _340 = _332 * _332;
    float _342 = -_334;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    float _346 = fma(_338, _338, _340);
    float _348 = in.m_51.x;
    float _350 = in.m_51.y;
    float _352 = in.m_51.z;
    float _354 = fma(_344, _344, _346);
    float _356 = sqrt(_354);
    float _358 = _312 * _356;
    float _360 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _350);
    float _362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _348);
    float _364 = _320 * _358;
    float _366 = _322 * _358;
    float _368 = _324 * _358;
    float _370 = _364 * _360;
    float _372 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _352);
    float _374 = _366 * _362;
    float _376 = _370 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _378 = _370 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _380 = _368 * _372;
    float _382 = _370 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _384 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[10].x, _376);
    float _386 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[8].x, _378);
    float _388 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[9].x, _382);
    float _390 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[10].z, _384);
    float _392 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[8].z, _386);
    float _394 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[9].z, _388);
    float _396 = _286 + _390;
    float _398 = _284 + _392;
    float _400 = _282 + _394;
    float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _404 = _396 + _402;
    float _406 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _408 = _398 + _406;
    float _410 = _404 * _404;
    float _412 = fma(_408, _408, _410);
    float _414 = sqrt(_412);
    bool _416 = _414 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _424 = _422 != 0;
    bool _426 = !_420;
    int _428 = _426 ? 0 : 1;
    bool _430 = !_424;
    int _432 = _430 ? 0 : 1;
    float _434 = _374;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _438 = _398;
    float _440 = _368;
    float _442 = _282;
    if (!_416)
    {
        _434 = _396;
    }
    float _444 = _434;
    float _446 = _444;
    if (!_416)
    {
        _436 = _400;
    }
    float _448 = _436;
    bool _450 = !_416;
    float _452 = _448;
    if (!_450)
    {
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _456 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _458 = _414 + _456;
        float _460 = _400 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _462 = rsqrt(_412);
        float _464 = _458 * _454;
        float _466 = _464 * 0.15915493667125701904296875;
        float _468 = _466 * 6.283185482025146484375;
        float _470 = cos(_468);
        float _472 = _466 * 6.283185482025146484375;
        float _474 = sin(_472);
        float _476 = _470 + (-1.0);
        float _478 = fma(_474, _460, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _480 = _476 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _482 = _462 * _478;
        float _484 = fma(_400, _470, _480);
        float _486 = fma(_408, _482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _488 = fma(_404, _482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _452 = _484;
        _438 = _486;
        _446 = _488;
        _440 = _466;
    }
    float _490 = _452;
    float _492 = _438;
    float _494 = _446;
    float _496 = _440;
    float _498 = -_326;
    float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _490);
    float _502 = -_328;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _506 = -_334;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _494);
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
    float _530 = _528 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _532 = _516 * _530;
    float _534 = _520 * _530;
    float _536 = _532 * _532;
    float _538 = _534 * _534;
    float _540 = _536 + _538;
    float _542 = sqrt(_540);
    bool _544 = _542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _546 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _548 = _542 + _546;
    float _550 = _520;
    float _552 = _496;
    float _554 = _548;
    float _556 = _512;
    if (_544)
    {
        float _558 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _550 = _558;
    }
    float _560 = _550;
    if (_544)
    {
        float _562 = rsqrt(_540);
        _552 = _562;
    }
    float _564 = _552;
    float _566 = _564;
    if (_544)
    {
        float _568 = _548 * _560;
        _554 = _568;
    }
    float _570 = _554;
    if (_544)
    {
        float _572 = _570 * 0.15915493667125701904296875;
        _442 = _572;
    }
    float _574 = _442;
    float _576 = _528;
    if (_544)
    {
        float _578 = _574 * 6.283185482025146484375;
        float _580 = sin(_578);
        _576 = _580;
    }
    float _582 = _576;
    float _584 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _586 = precise::max(0.0, _584);
    float _588 = _522;
    float _590 = _586;
    float _592 = _584;
    if (_544)
    {
        float _594 = _574 * 6.283185482025146484375;
        float _596 = cos(_594);
        _588 = _596;
    }
    float _598 = _588;
    float _600 = -_530;
    float _602 = -_586;
    float _604 = fma(_512, _600, _602);
    if (!_544)
    {
        _556 = _532;
    }
    float _606 = _556;
    float _608 = _606;
    if (_544)
    {
        float _610 = _604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _610;
    }
    float _612 = _590;
    float _614 = sqrt(_526);
    float _616 = _612;
    float _618 = _582;
    if (_544)
    {
        float _620 = fma(_582, _612, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _616 = _620;
    }
    float _622 = _616;
    float _624 = _622;
    if (!_544)
    {
        _618 = _536;
    }
    float _626 = _618;
    float _628 = _626;
    float _630 = _598;
    if (_544)
    {
        float _632 = _598 + (-1.0);
        _592 = _632;
    }
    float _634 = _592;
    float _636 = 0.0;
    float _638 = _634;
    if (_544)
    {
        float _640 = _564 * _622;
        _636 = _640;
    }
    float _642 = _636;
    if (!_544)
    {
        _624 = _604;
    }
    float _644 = _624;
    float _646 = _644;
    if (_544)
    {
        float _648 = _634 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _566 = _648;
    }
    float _650 = _566;
    if (_544)
    {
        float _652 = _532 * _642;
        _608 = _652;
    }
    float _654 = _608;
    if (!_544)
    {
        _638 = _534;
    }
    float _656 = _638;
    float _658 = _656;
    if (_544)
    {
        float _660 = _534 * _642;
        _658 = _660;
    }
    float _662 = _658;
    if (_544)
    {
        float _664 = fma(_604, _598, _650);
        _646 = _664;
    }
    float _666 = _646;
    if (_544)
    {
        float _668 = _654 * _654;
        _628 = _668;
    }
    float _670 = _628;
    if (!_544)
    {
        _630 = _538;
    }
    float _672 = _630;
    float _674 = _672;
    if (_544)
    {
        float _676 = _662 * _662;
        _674 = _676;
    }
    float _678 = _674;
    float _680 = fma(_666, _666, _670);
    float _682 = _680 + _678;
    float _684 = _500 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _686 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _688 = fma(_614, (*spvDescriptorSet0.vp_c15)._m0[23].w, _686);
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _694 = _500 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _696 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[2].x, _684);
    float _698 = rsqrt(_682);
    float _700 = _500 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _702 = -_690;
    float _704 = _702 + 1.0;
    float _706 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[2].z, _696);
    float _708 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[1].x, _694);
    float _710 = _500 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _712 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[0].x, _700);
    float _714 = _706 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _716 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[1].z, _708);
    float _718 = abs(_704);
    float _720 = log2(_718);
    float _722 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[3].x, _710);
    float _724 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[0].z, _712);
    float _726 = _716 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _728 = _714 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _730 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[3].z, _722);
    float _732 = _724 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _734 = _726 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _736 = _698 * _654;
    float _738 = _730 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _740 = _698 * _662;
    float _742 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[7].x, _734);
    float _744 = _698 * _666;
    float _746 = _736 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _748 = -_728;
    float _750 = fma(_748, _692, 1.0);
    float _752 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[7].z, _742);
    float _754 = _720 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _756 = -_746;
    float _758 = fma(_744, (*spvDescriptorSet0.vp_c15)._m0[21].y, _756);
    float _760 = _726 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _762 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[7].w, _752);
    float _764 = exp2(_754);
    float _766 = -_740;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c15)._m0[21].z, _758);
    float _770 = _726 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _772 = fma(_768, -0.5, 0.5);
    float _774 = fma(_768, 0.5, 0.5);
    float _776 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[4].x, _770);
    float _778 = log2(_750);
    float _780 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[5].x, _760);
    float _782 = _744 + 1.0;
    float _784 = fma(_774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _786 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[4].z, _776);
    float _788 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[5].z, _780);
    float _790 = fma(_774, _784, -0.212114393711090087890625);
    float _792 = 1.0 / _762;
    float _794 = -_744;
    float _796 = fma(_764, _782, _794);
    float _798 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[4].w, _786);
    float _800 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[5].w, _788);
    float _802 = fma(_774, _790, 1.570728778839111328125);
    float _804 = fma(_796, 0.5, 0.5);
    float _806 = sqrt(_772);
    float _808 = _778 * 0.693147182464599609375;
    float _810 = _808 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _812 = _798 * _792;
    float _814 = _800 * _792;
    float _816 = fma(_812, 0.5, 0.5);
    float _818 = fma(_814, -0.5, 0.5);
    float _820 = _806 * 0.636619746685028076171875;
    float _822 = -_802;
    float _824 = fma(_820, _822, 1.0);
    float3 _2786 = float3(_816, _818, _810);
    float _826 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2786, float3(0.0), isnan(_2786)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2786, float3(0.0), isnan(_2786)), level(0.0)).x;
    float3 _2797 = float3(_816, _818, _810);
    float4 _829 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2797, float3(0.0), isnan(_2797)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2797, float3(0.0), isnan(_2797)), level(0.0)).xyzw;
    float _831 = _829.x;
    float _833 = _829.y;
    float _835 = _829.z;
    float _837 = _829.w;
    float2 _2814 = float2(_824, _804);
    float3 _841 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2814, float2(0.0), isnan(_2814)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2814, float2(0.0), isnan(_2814)), level(0.0)).xyz;
    float _843 = _841.x;
    float _845 = _841.y;
    float _847 = _841.z;
    float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _851 = _124 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _853 = in.m_53.w;
    float _855 = _720 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _863 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _865 = _863 != 0;
    float _867 = in.m_53.x;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _873 = in.m_53.y;
    float _875 = _851 * _849;
    float _877 = 1.0 / _859;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _879;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _891 = _889 != 0;
    float _893 = 1.0 / _871;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _899 = _726 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _901 = _853 > 0.5;
    float _903 = in.m_55.x;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _907 = _905 != 0;
    float _909 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[6].x, _899);
    float _911 = 1.0 / _897;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _917 = in.m_57.y;
    float _919 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[20].x, _875);
    float _921 = in.m_55.y;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _925 = _923 != 0;
    float _927 = 1.0 / _915;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _935 = _933 != 0;
    float _937 = _867 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _941 = _939 != 0;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _945 = _873 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _947 = -_887;
    float _949 = fma(_937, 2.0, _947);
    float _951 = 1.0 / _931;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _957 = float(_90);
    float _959 = _881 * _911;
    float _961 = fma(_945, -2.0, _943);
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _971 = 1.0 / _955;
    float _973 = _885 * _927;
    float _975 = _969 * _893;
    float _977 = -_917;
    float _979 = _977 + 1.0;
    float _981 = _965 * _877;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _983;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _991 = 1.0 / _957;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _997 = in.m_57.x;
    float _999 = _985 * _951;
    float _1001 = _943;
    float _1003 = _917;
    bool _1005 = _941;
    bool _1007 = _935;
    float _1009 = _961;
    if (_925)
    {
        float _1011 = in.m_53.z;
        _1001 = _1011;
    }
    float _1013 = _1001;
    float _1015 = 1.0 / _995;
    float _1017 = _989 * _971;
    int _1019 = _901 ? as_type<int>(_979) : as_type<int>(_917);
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1023 = _873 > 0.5;
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1027 = _935 ? as_type<float>(_1019) : _917;
    float _1029 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1021);
    float _1031 = _124 * _991;
    if (_941)
    {
        float _1033 = _1023 ? _979 : _917;
        _1003 = _1033;
    }
    float _1035 = _1003;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1037;
    float _1041 = _995;
    if (!_907)
    {
        float _1043 = in.m_53.z;
        _1041 = _1043;
    }
    float _1045 = _1041;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1049 = _1031 + _1047;
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1053 = _1031 + _1051;
    if (_891)
    {
        bool _1055 = _867 > 0.5;
        _1005 = _1055;
    }
    bool _1057 = _1005;
    float _1059 = floor(_919);
    float _1061 = _1039 * _1015;
    float _1063 = fma(_981, _1049, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1067 = _1031 + _1065;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1071 = _1031 + _1069;
    float _1073 = fma(_1017, _1053, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1077 = _1031 + _1075;
    float _1079 = fma(_973, _1067, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1081 = fma(_959, _1071, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1085 = _1071;
    if (!_891)
    {
        _1085 = _997;
    }
    float _1087 = _1085;
    float _1089 = fma(_1061, _1077, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1091 = _1087;
    float _1093 = _1013;
    if (_925)
    {
        bool _1095 = _1013 > 0.5;
        _1007 = _1095;
    }
    bool _1097 = _1007;
    float _1099 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1029);
    float _1101 = 0.0;
    if (!_891)
    {
        _1101 = _1087;
    }
    float _1103 = _1101;
    float _1105 = -_124;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[76].x, _949);
    float _1109 = _1103;
    if (_891)
    {
        _1091 = _997;
    }
    float _1111 = _1091;
    float _1113 = _861 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1115 = -_1059;
    float _1117 = _919 + _1115;
    if (!_907)
    {
        _1093 = _873;
    }
    float _1119 = _1093;
    float _1121 = fma(_1027, _1113, -0.5);
    float _1123 = _1119;
    if (_907)
    {
        _1123 = _867;
    }
    float _1125 = _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1129 = _1031 + _1127;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1133 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1135 = fma(_975, _1129, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1139 = _1031 + _1137;
    float _1141 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1131);
    float _1143 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1145 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1147 = isnan(_1031);
    bool _1149 = _1145 || _1147;
    bool _1151 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1153 = _1149 || _1151;
    float _1155 = float(_1153);
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1159 = fma(_999, _1139, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1161 = _1139;
    float _1163 = _1045;
    if (!_907)
    {
        _1161 = _1045;
    }
    float _1165 = _1161;
    float _1167 = -_1025;
    float _1169 = fma(_1143, 2.0, _1167);
    bool _1171 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1173 = isnan(_1031);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1157);
    float _1185 = _1165;
    if (_907)
    {
        _1185 = _873;
    }
    float _1187 = _1185;
    float _1189 = -_1155;
    float _1191 = _1189 + 1.0;
    if (_907)
    {
        _1163 = _873;
    }
    float _1193 = _1163;
    float _1195 = fma(_1133, _1035, -0.5);
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1199 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1201 = isnan(_1031);
    bool _1203 = _1199 || _1201;
    bool _1205 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1207 = _1203 || _1205;
    int _1209 = _1207 ? 1065353216 : 0;
    float _1211 = _1181 * _1191;
    float _1213 = -_1181;
    float _1215 = _1213 + 1.0;
    float _1217 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1197);
    float _1219 = _919 * 6.283185482025146484375;
    bool _1221 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1223 = isnan(_1031);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1229 = _1225 || _1227;
    float _1231 = float(_1229);
    float _1233 = as_type<float>(_1209) * _1215;
    float _1235 = -as_type<float>(_1209);
    float _1237 = _1235 + 1.0;
    int _1239 = _1209;
    if (_891)
    {
        float _1241 = -_1111;
        float _1243 = _1241 + 1.0;
        _1239 = as_type<int>(_1243);
    }
    int _1245 = _1239;
    float _1247 = _1219 * 0.15915493667125701904296875;
    bool _1249 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1251 = isnan(_1031);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = -_1231;
    float _1263 = _1261 + 1.0;
    float _1265 = _1231 * _1237;
    if (_891)
    {
        float _1267 = _1057 ? as_type<float>(_1245) : _1111;
        _1109 = _1267;
    }
    float _1269 = _1109;
    float _1271 = _1247 * 6.283185482025146484375;
    float _1273 = cos(_1271);
    float _1275 = _1259 * _1263;
    bool _1277 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1279 = isnan(_1031);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1285 = _1281 || _1283;
    float _1287 = float(_1285);
    float _1289 = -_1259;
    float _1291 = _1289 + 1.0;
    bool _1293 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1295 = isnan(_1031);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1301 = _1297 || _1299;
    float _1303 = float(_1301);
    float _1305 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1183);
    bool _1307 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1309 = isnan(_1031);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = _1287 * _1291;
    float _1321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1323 = -_1287;
    float _1325 = _1323 + 1.0;
    int _1327 = 0;
    if (_925)
    {
        float _1329 = -_1111;
        float _1331 = _1329 + 1.0;
        _1327 = as_type<int>(_1331);
    }
    int _1333 = _1327;
    float _1335 = -_1317;
    float _1337 = _1335 + 1.0;
    float _1339 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _961);
    float _1341 = _1317 * _1325;
    float _1343 = _1303 * _1337;
    float _1345 = fma(_1273, 0.5, 0.5);
    float _1347 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1349 = _1117 < 0.5;
    float _1351 = float(_1349);
    float _1353 = _1063 * _1343;
    float _1355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_925)
    {
        _1009 = _1111;
    }
    float _1357 = _1009;
    float _1359 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1141);
    float _1361 = _1357;
    if (_925)
    {
        float _1363 = _1097 ? as_type<float>(_1333) : _1111;
        _1361 = _1363;
    }
    float _1365 = _1361;
    float _1367 = -_1339;
    float _1369 = fma(_1305, _1195, _1367);
    float _1371 = -_1117;
    float _1373 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1375 = -_1351;
    float _1377 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1379 = -_1303;
    float _1381 = _1379 + 1.0;
    float _1383 = -_1345;
    float _1385 = fma(_1383, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1389 = _1321 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1391 = fma(_1347, -2.0, _1387);
    float _1393 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1353);
    float _1395 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1399 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1401 = fma(_1389, _1269, -0.5);
    float _1403 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1405 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1407 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1409 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1411 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1417 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1419 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1421 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _1403;
    out.m_59.y = _1405;
    out.m_59.z = _1407;
    float _1423 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1425 = abs(_428);
    float _1427 = -_124;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1169);
    out.m_61.x = _1417;
    out.m_61.y = _1419;
    out.m_61.z = _1421;
    out.m_61.w = _1415;
    float _1431 = fma(_1423, _1365, -0.5);
    float _1433 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1217);
    float _1435 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1391);
    float _1437 = fma(_1135, _1341, _1393);
    float _1439 = fma(_1359, _1431, _1429);
    bool _1441 = !_865;
    int _1443 = _1441 ? 0 : 1;
    float _1445 = fma(_1099, _1401, _1107);
    int _1447 = abs(_432);
    float _1449 = -_1435;
    float _1451 = fma(_1433, _1121, _1449);
    float _1453 = exp2(_855);
    float _1455 = fma(_1081, _1319, _1437);
    int _1457 = abs(_1443);
    float _1459 = in.m_55.z;
    float _1461 = _1445 + 0.5;
    float _1463 = _1439 + 0.5;
    float _1465 = in.m_55.w;
    float _1467 = float(_1425);
    float _1469 = _1451 + 0.5;
    float _1471 = fma(_1079, _1275, _1455);
    float _1473 = float(_1457);
    float _1475 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[6].z, _909);
    float _1477 = abs(_1373);
    float _1479 = _1467 * _1477;
    float _1481 = _1369 + 0.5;
    float _1483 = fma(_1159, _1265, _1471);
    float _1485 = -_1453;
    float _1487 = _1485 + 1.0;
    float _1489 = float(_1447);
    float _1491 = fma(_1473, _1385, _1479);
    out.m_63.x = _1461;
    out.m_63.y = _1481;
    out.m_63.z = _1463;
    out.m_63.w = _1469;
    float _1493 = fma(_1073, _1233, _1483);
    float _1495 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1475);
    float _1497 = abs(_1377);
    float _1499 = fma(_1489, _1497, _1491);
    float _1501 = _798 + _762;
    float _1503 = fma(_1089, _1211, _1493);
    float _1505 = _1495 + _762;
    float _1507 = _762 * 0.5;
    float _1509 = _1499 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1511 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1503);
    float _1513 = _1505 * 0.5;
    float _1515 = _1501 * 0.5;
    float _1517 = fma(_800, -0.5, _1507);
    float _1519 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1521 = _1509 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _903;
    out.m_65.y = _921;
    out.m_65.z = _1459;
    out.m_65.w = _1465;
    out.m_67.x = _1511;
    out.gl_Position.x = _798;
    out.gl_Position.y = _800;
    out.gl_Position.z = _1495;
    out.gl_Position.w = _762;
    out.m_69.x = _1515;
    out.m_69.y = _1517;
    out.m_69.z = _1513;
    out.m_69.w = _762;
    out.m_45.x = _1521;
    float _1523 = _1519 * _826;
    float _1525 = -_1519;
    float _1527 = _1525 + 1.0;
    float _1529 = _837 * _1523;
    float _1531 = _847 * _1523;
    float _1533 = _837 * _1527;
    float _1535 = fma(_843, _1529, _831);
    float _1537 = fma(_845, _1529, _833);
    float _1539 = fma(_837, _1531, _835);
    out.m_71.x = _1535;
    out.m_71.y = _1537;
    out.m_71.z = _1539;
    out.m_71.w = _1533;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1595 = as_type<float>(_106);
        out.gl_Position.z = _1595;
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
        _100 = _126;
    }
    float _128 = _100;
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
        float _1664 = as_type<float>(_142);
        out.gl_Position.z = _1664;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_49.w;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = in.m_42.x;
    float _166 = in.m_42.y;
    float _168 = in.m_42.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    float _246 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_244, _160, _246);
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _162, _250);
    float _258 = fma(_252, _144, _166);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _168);
    float _264 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _266 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _268 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _270 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _264);
    float _272 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _266);
    float _274 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _268);
    float _276 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _270);
    float _278 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _272);
    float _280 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _274);
    float _282 = _276 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _284 = _278 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _286 = _280 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _288 = in.m_49.x;
    float _290 = in.m_49.y;
    float _292 = in.m_49.z;
    float _294 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _296 = _282 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _300 = _284 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _304 = _286 + _302;
    float _306 = _296 * _296;
    float _308 = fma(_300, _300, _306);
    float _310 = fma(_304, _304, _308);
    float _312 = rsqrt(_310);
    float _314 = _290 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _316 = _288 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = _292 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _322 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _324 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _326 = _296 * _312;
    float _328 = _300 * _312;
    float _330 = -_326;
    float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[18].w, _296);
    float _334 = _304 * _312;
    float _336 = -_328;
    float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[18].w, _300);
    float _340 = _332 * _332;
    float _342 = -_334;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    float _346 = fma(_338, _338, _340);
    float _348 = in.m_51.x;
    float _350 = in.m_51.y;
    float _352 = in.m_51.z;
    float _354 = fma(_344, _344, _346);
    float _356 = sqrt(_354);
    float _358 = _312 * _356;
    float _360 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _350);
    float _362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _348);
    float _364 = _320 * _358;
    float _366 = _322 * _358;
    float _368 = _324 * _358;
    float _370 = _364 * _360;
    float _372 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _352);
    float _374 = _366 * _362;
    float _376 = _370 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _378 = _370 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _380 = _368 * _372;
    float _382 = _370 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _384 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[10].x, _376);
    float _386 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[8].x, _378);
    float _388 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[9].x, _382);
    float _390 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[10].z, _384);
    float _392 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[8].z, _386);
    float _394 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[9].z, _388);
    float _396 = _286 + _390;
    float _398 = _284 + _392;
    float _400 = _282 + _394;
    float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _404 = _396 + _402;
    float _406 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _408 = _398 + _406;
    float _410 = _404 * _404;
    float _412 = fma(_408, _408, _410);
    float _414 = sqrt(_412);
    bool _416 = _414 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _424 = _422 != 0;
    bool _426 = !_420;
    int _428 = _426 ? 0 : 1;
    bool _430 = !_424;
    int _432 = _430 ? 0 : 1;
    float _434 = _374;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _438 = _398;
    float _440 = _368;
    float _442 = _282;
    if (!_416)
    {
        _434 = _396;
    }
    float _444 = _434;
    float _446 = _444;
    if (!_416)
    {
        _436 = _400;
    }
    float _448 = _436;
    bool _450 = !_416;
    float _452 = _448;
    if (!_450)
    {
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _456 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _458 = _414 + _456;
        float _460 = _400 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _462 = rsqrt(_412);
        float _464 = _458 * _454;
        float _466 = _464 * 0.15915493667125701904296875;
        float _468 = _466 * 6.283185482025146484375;
        float _470 = cos(_468);
        float _472 = _466 * 6.283185482025146484375;
        float _474 = sin(_472);
        float _476 = _470 + (-1.0);
        float _478 = fma(_474, _460, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _480 = _476 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _482 = _462 * _478;
        float _484 = fma(_400, _470, _480);
        float _486 = fma(_408, _482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _488 = fma(_404, _482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _452 = _484;
        _438 = _486;
        _446 = _488;
        _440 = _466;
    }
    float _490 = _452;
    float _492 = _438;
    float _494 = _446;
    float _496 = _440;
    float _498 = -_326;
    float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _490);
    float _502 = -_328;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _506 = -_334;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _494);
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
    float _530 = _528 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _532 = _516 * _530;
    float _534 = _520 * _530;
    float _536 = _532 * _532;
    float _538 = _534 * _534;
    float _540 = _536 + _538;
    float _542 = sqrt(_540);
    bool _544 = _542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _546 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _548 = _542 + _546;
    float _550 = _520;
    float _552 = _496;
    float _554 = _548;
    float _556 = _512;
    if (_544)
    {
        float _558 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _550 = _558;
    }
    float _560 = _550;
    if (_544)
    {
        float _562 = rsqrt(_540);
        _552 = _562;
    }
    float _564 = _552;
    float _566 = _564;
    if (_544)
    {
        float _568 = _548 * _560;
        _554 = _568;
    }
    float _570 = _554;
    if (_544)
    {
        float _572 = _570 * 0.15915493667125701904296875;
        _442 = _572;
    }
    float _574 = _442;
    float _576 = _528;
    if (_544)
    {
        float _578 = _574 * 6.283185482025146484375;
        float _580 = sin(_578);
        _576 = _580;
    }
    float _582 = _576;
    float _584 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _586 = precise::max(0.0, _584);
    float _588 = _522;
    float _590 = _586;
    float _592 = _584;
    if (_544)
    {
        float _594 = _574 * 6.283185482025146484375;
        float _596 = cos(_594);
        _588 = _596;
    }
    float _598 = _588;
    float _600 = -_530;
    float _602 = -_586;
    float _604 = fma(_512, _600, _602);
    if (!_544)
    {
        _556 = _532;
    }
    float _606 = _556;
    float _608 = _606;
    if (_544)
    {
        float _610 = _604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _610;
    }
    float _612 = _590;
    float _614 = sqrt(_526);
    float _616 = _612;
    float _618 = _582;
    if (_544)
    {
        float _620 = fma(_582, _612, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _616 = _620;
    }
    float _622 = _616;
    float _624 = _622;
    if (!_544)
    {
        _618 = _536;
    }
    float _626 = _618;
    float _628 = _626;
    float _630 = _598;
    if (_544)
    {
        float _632 = _598 + (-1.0);
        _592 = _632;
    }
    float _634 = _592;
    float _636 = 0.0;
    float _638 = _634;
    if (_544)
    {
        float _640 = _564 * _622;
        _636 = _640;
    }
    float _642 = _636;
    if (!_544)
    {
        _624 = _604;
    }
    float _644 = _624;
    float _646 = _644;
    if (_544)
    {
        float _648 = _634 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _566 = _648;
    }
    float _650 = _566;
    if (_544)
    {
        float _652 = _532 * _642;
        _608 = _652;
    }
    float _654 = _608;
    if (!_544)
    {
        _638 = _534;
    }
    float _656 = _638;
    float _658 = _656;
    if (_544)
    {
        float _660 = _534 * _642;
        _658 = _660;
    }
    float _662 = _658;
    if (_544)
    {
        float _664 = fma(_604, _598, _650);
        _646 = _664;
    }
    float _666 = _646;
    if (_544)
    {
        float _668 = _654 * _654;
        _628 = _668;
    }
    float _670 = _628;
    if (!_544)
    {
        _630 = _538;
    }
    float _672 = _630;
    float _674 = _672;
    if (_544)
    {
        float _676 = _662 * _662;
        _674 = _676;
    }
    float _678 = _674;
    float _680 = fma(_666, _666, _670);
    float _682 = _680 + _678;
    float _684 = _500 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _686 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _688 = fma(_614, (*spvDescriptorSet0.vp_c15)._m0[23].w, _686);
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _694 = _500 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _696 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[2].x, _684);
    float _698 = rsqrt(_682);
    float _700 = _500 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _702 = -_690;
    float _704 = _702 + 1.0;
    float _706 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[2].z, _696);
    float _708 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[1].x, _694);
    float _710 = _500 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _712 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[0].x, _700);
    float _714 = _706 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _716 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[1].z, _708);
    float _718 = abs(_704);
    float _720 = log2(_718);
    float _722 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[3].x, _710);
    float _724 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[0].z, _712);
    float _726 = _716 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _728 = _714 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _730 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[3].z, _722);
    float _732 = _724 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _734 = _726 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _736 = _698 * _654;
    float _738 = _730 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _740 = _698 * _662;
    float _742 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[7].x, _734);
    float _744 = _698 * _666;
    float _746 = _736 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _748 = -_728;
    float _750 = fma(_748, _692, 1.0);
    float _752 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[7].z, _742);
    float _754 = _720 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _756 = -_746;
    float _758 = fma(_744, (*spvDescriptorSet0.vp_c15)._m0[21].y, _756);
    float _760 = _726 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _762 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[7].w, _752);
    float _764 = exp2(_754);
    float _766 = -_740;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c15)._m0[21].z, _758);
    float _770 = _726 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _772 = fma(_768, -0.5, 0.5);
    float _774 = fma(_768, 0.5, 0.5);
    float _776 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[4].x, _770);
    float _778 = log2(_750);
    float _780 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[5].x, _760);
    float _782 = _744 + 1.0;
    float _784 = fma(_774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _786 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[4].z, _776);
    float _788 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[5].z, _780);
    float _790 = fma(_774, _784, -0.212114393711090087890625);
    float _792 = 1.0 / _762;
    float _794 = -_744;
    float _796 = fma(_764, _782, _794);
    float _798 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[4].w, _786);
    float _800 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[5].w, _788);
    float _802 = fma(_774, _790, 1.570728778839111328125);
    float _804 = fma(_796, 0.5, 0.5);
    float _806 = sqrt(_772);
    float _808 = _778 * 0.693147182464599609375;
    float _810 = _808 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _812 = _798 * _792;
    float _814 = _800 * _792;
    float _816 = fma(_812, 0.5, 0.5);
    float _818 = fma(_814, -0.5, 0.5);
    float _820 = _806 * 0.636619746685028076171875;
    float _822 = -_802;
    float _824 = fma(_820, _822, 1.0);
    float3 _2786 = float3(_816, _818, _810);
    float _826 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2786, float3(0.0), isnan(_2786)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2786, float3(0.0), isnan(_2786)), level(0.0)).x;
    float3 _2797 = float3(_816, _818, _810);
    float4 _829 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2797, float3(0.0), isnan(_2797)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2797, float3(0.0), isnan(_2797)), level(0.0)).xyzw;
    float _831 = _829.x;
    float _833 = _829.y;
    float _835 = _829.z;
    float _837 = _829.w;
    float2 _2814 = float2(_824, _804);
    float3 _841 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2814, float2(0.0), isnan(_2814)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2814, float2(0.0), isnan(_2814)), level(0.0)).xyz;
    float _843 = _841.x;
    float _845 = _841.y;
    float _847 = _841.z;
    float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _851 = _124 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _853 = in.m_53.w;
    float _855 = _720 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _863 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _865 = _863 != 0;
    float _867 = in.m_53.x;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _873 = in.m_53.y;
    float _875 = _851 * _849;
    float _877 = 1.0 / _859;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _879;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _891 = _889 != 0;
    float _893 = 1.0 / _871;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _899 = _726 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _901 = _853 > 0.5;
    float _903 = in.m_55.x;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _907 = _905 != 0;
    float _909 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[6].x, _899);
    float _911 = 1.0 / _897;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _917 = in.m_57.y;
    float _919 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[20].x, _875);
    float _921 = in.m_55.y;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _925 = _923 != 0;
    float _927 = 1.0 / _915;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _935 = _933 != 0;
    float _937 = _867 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _941 = _939 != 0;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _945 = _873 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _947 = -_887;
    float _949 = fma(_937, 2.0, _947);
    float _951 = 1.0 / _931;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _957 = float(_90);
    float _959 = _881 * _911;
    float _961 = fma(_945, -2.0, _943);
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _971 = 1.0 / _955;
    float _973 = _885 * _927;
    float _975 = _969 * _893;
    float _977 = -_917;
    float _979 = _977 + 1.0;
    float _981 = _965 * _877;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _983;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _991 = 1.0 / _957;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _997 = in.m_57.x;
    float _999 = _985 * _951;
    float _1001 = _943;
    float _1003 = _917;
    bool _1005 = _941;
    bool _1007 = _935;
    float _1009 = _961;
    if (_925)
    {
        float _1011 = in.m_53.z;
        _1001 = _1011;
    }
    float _1013 = _1001;
    float _1015 = 1.0 / _995;
    float _1017 = _989 * _971;
    int _1019 = _901 ? as_type<int>(_979) : as_type<int>(_917);
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1023 = _873 > 0.5;
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1027 = _935 ? as_type<float>(_1019) : _917;
    float _1029 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1021);
    float _1031 = _124 * _991;
    if (_941)
    {
        float _1033 = _1023 ? _979 : _917;
        _1003 = _1033;
    }
    float _1035 = _1003;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1037;
    float _1041 = _995;
    if (!_907)
    {
        float _1043 = in.m_53.z;
        _1041 = _1043;
    }
    float _1045 = _1041;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1049 = _1031 + _1047;
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1053 = _1031 + _1051;
    if (_891)
    {
        bool _1055 = _867 > 0.5;
        _1005 = _1055;
    }
    bool _1057 = _1005;
    float _1059 = floor(_919);
    float _1061 = _1039 * _1015;
    float _1063 = fma(_981, _1049, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1067 = _1031 + _1065;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1071 = _1031 + _1069;
    float _1073 = fma(_1017, _1053, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1077 = _1031 + _1075;
    float _1079 = fma(_973, _1067, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1081 = fma(_959, _1071, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1085 = _1071;
    if (!_891)
    {
        _1085 = _997;
    }
    float _1087 = _1085;
    float _1089 = fma(_1061, _1077, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1091 = _1087;
    float _1093 = _1013;
    if (_925)
    {
        bool _1095 = _1013 > 0.5;
        _1007 = _1095;
    }
    bool _1097 = _1007;
    float _1099 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1029);
    float _1101 = 0.0;
    if (!_891)
    {
        _1101 = _1087;
    }
    float _1103 = _1101;
    float _1105 = -_124;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[76].x, _949);
    float _1109 = _1103;
    if (_891)
    {
        _1091 = _997;
    }
    float _1111 = _1091;
    float _1113 = _861 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1115 = -_1059;
    float _1117 = _919 + _1115;
    if (!_907)
    {
        _1093 = _873;
    }
    float _1119 = _1093;
    float _1121 = fma(_1027, _1113, -0.5);
    float _1123 = _1119;
    if (_907)
    {
        _1123 = _867;
    }
    float _1125 = _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1129 = _1031 + _1127;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1133 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1135 = fma(_975, _1129, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1139 = _1031 + _1137;
    float _1141 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1131);
    float _1143 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1145 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1147 = isnan(_1031);
    bool _1149 = _1145 || _1147;
    bool _1151 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1153 = _1149 || _1151;
    float _1155 = float(_1153);
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1159 = fma(_999, _1139, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1161 = _1139;
    float _1163 = _1045;
    if (!_907)
    {
        _1161 = _1045;
    }
    float _1165 = _1161;
    float _1167 = -_1025;
    float _1169 = fma(_1143, 2.0, _1167);
    bool _1171 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1173 = isnan(_1031);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1157);
    float _1185 = _1165;
    if (_907)
    {
        _1185 = _873;
    }
    float _1187 = _1185;
    float _1189 = -_1155;
    float _1191 = _1189 + 1.0;
    if (_907)
    {
        _1163 = _873;
    }
    float _1193 = _1163;
    float _1195 = fma(_1133, _1035, -0.5);
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1199 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1201 = isnan(_1031);
    bool _1203 = _1199 || _1201;
    bool _1205 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1207 = _1203 || _1205;
    int _1209 = _1207 ? 1065353216 : 0;
    float _1211 = _1181 * _1191;
    float _1213 = -_1181;
    float _1215 = _1213 + 1.0;
    float _1217 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1197);
    float _1219 = _919 * 6.283185482025146484375;
    bool _1221 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1223 = isnan(_1031);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1229 = _1225 || _1227;
    float _1231 = float(_1229);
    float _1233 = as_type<float>(_1209) * _1215;
    float _1235 = -as_type<float>(_1209);
    float _1237 = _1235 + 1.0;
    int _1239 = _1209;
    if (_891)
    {
        float _1241 = -_1111;
        float _1243 = _1241 + 1.0;
        _1239 = as_type<int>(_1243);
    }
    int _1245 = _1239;
    float _1247 = _1219 * 0.15915493667125701904296875;
    bool _1249 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1251 = isnan(_1031);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = -_1231;
    float _1263 = _1261 + 1.0;
    float _1265 = _1231 * _1237;
    if (_891)
    {
        float _1267 = _1057 ? as_type<float>(_1245) : _1111;
        _1109 = _1267;
    }
    float _1269 = _1109;
    float _1271 = _1247 * 6.283185482025146484375;
    float _1273 = cos(_1271);
    float _1275 = _1259 * _1263;
    bool _1277 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1279 = isnan(_1031);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1285 = _1281 || _1283;
    float _1287 = float(_1285);
    float _1289 = -_1259;
    float _1291 = _1289 + 1.0;
    bool _1293 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1295 = isnan(_1031);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1301 = _1297 || _1299;
    float _1303 = float(_1301);
    float _1305 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1183);
    bool _1307 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1309 = isnan(_1031);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = _1287 * _1291;
    float _1321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1323 = -_1287;
    float _1325 = _1323 + 1.0;
    int _1327 = 0;
    if (_925)
    {
        float _1329 = -_1111;
        float _1331 = _1329 + 1.0;
        _1327 = as_type<int>(_1331);
    }
    int _1333 = _1327;
    float _1335 = -_1317;
    float _1337 = _1335 + 1.0;
    float _1339 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _961);
    float _1341 = _1317 * _1325;
    float _1343 = _1303 * _1337;
    float _1345 = fma(_1273, 0.5, 0.5);
    float _1347 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1349 = _1117 < 0.5;
    float _1351 = float(_1349);
    float _1353 = _1063 * _1343;
    float _1355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_925)
    {
        _1009 = _1111;
    }
    float _1357 = _1009;
    float _1359 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1141);
    float _1361 = _1357;
    if (_925)
    {
        float _1363 = _1097 ? as_type<float>(_1333) : _1111;
        _1361 = _1363;
    }
    float _1365 = _1361;
    float _1367 = -_1339;
    float _1369 = fma(_1305, _1195, _1367);
    float _1371 = -_1117;
    float _1373 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1375 = -_1351;
    float _1377 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1379 = -_1303;
    float _1381 = _1379 + 1.0;
    float _1383 = -_1345;
    float _1385 = fma(_1383, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1389 = _1321 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1391 = fma(_1347, -2.0, _1387);
    float _1393 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1353);
    float _1395 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1399 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1401 = fma(_1389, _1269, -0.5);
    float _1403 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1405 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1407 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1409 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1411 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1417 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1419 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1421 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _1403;
    out.m_59.y = _1405;
    out.m_59.z = _1407;
    float _1423 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1425 = abs(_428);
    float _1427 = -_124;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1169);
    out.m_61.x = _1417;
    out.m_61.y = _1419;
    out.m_61.z = _1421;
    out.m_61.w = _1415;
    float _1431 = fma(_1423, _1365, -0.5);
    float _1433 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1217);
    float _1435 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1391);
    float _1437 = fma(_1135, _1341, _1393);
    float _1439 = fma(_1359, _1431, _1429);
    bool _1441 = !_865;
    int _1443 = _1441 ? 0 : 1;
    float _1445 = fma(_1099, _1401, _1107);
    int _1447 = abs(_432);
    float _1449 = -_1435;
    float _1451 = fma(_1433, _1121, _1449);
    float _1453 = exp2(_855);
    float _1455 = fma(_1081, _1319, _1437);
    int _1457 = abs(_1443);
    float _1459 = in.m_55.z;
    float _1461 = _1445 + 0.5;
    float _1463 = _1439 + 0.5;
    float _1465 = in.m_55.w;
    float _1467 = float(_1425);
    float _1469 = _1451 + 0.5;
    float _1471 = fma(_1079, _1275, _1455);
    float _1473 = float(_1457);
    float _1475 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[6].z, _909);
    float _1477 = abs(_1373);
    float _1479 = _1467 * _1477;
    float _1481 = _1369 + 0.5;
    float _1483 = fma(_1159, _1265, _1471);
    float _1485 = -_1453;
    float _1487 = _1485 + 1.0;
    float _1489 = float(_1447);
    float _1491 = fma(_1473, _1385, _1479);
    out.m_63.x = _1461;
    out.m_63.y = _1481;
    out.m_63.z = _1463;
    out.m_63.w = _1469;
    float _1493 = fma(_1073, _1233, _1483);
    float _1495 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1475);
    float _1497 = abs(_1377);
    float _1499 = fma(_1489, _1497, _1491);
    float _1501 = _798 + _762;
    float _1503 = fma(_1089, _1211, _1493);
    float _1505 = _1495 + _762;
    float _1507 = _762 * 0.5;
    float _1509 = _1499 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1511 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1503);
    float _1513 = _1505 * 0.5;
    float _1515 = _1501 * 0.5;
    float _1517 = fma(_800, -0.5, _1507);
    float _1519 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1521 = _1509 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _903;
    out.m_65.y = _921;
    out.m_65.z = _1459;
    out.m_65.w = _1465;
    out.m_67.x = _1511;
    out.gl_Position.x = _798;
    out.gl_Position.y = _800;
    out.gl_Position.z = _1495;
    out.gl_Position.w = _762;
    out.m_69.x = _1515;
    out.m_69.y = _1517;
    out.m_69.z = _1513;
    out.m_69.w = _762;
    out.m_45.x = _1521;
    float _1523 = _1519 * _826;
    float _1525 = -_1519;
    float _1527 = _1525 + 1.0;
    float _1529 = _837 * _1523;
    float _1531 = _847 * _1523;
    float _1533 = _837 * _1527;
    float _1535 = fma(_843, _1529, _831);
    float _1537 = fma(_845, _1529, _833);
    float _1539 = fma(_837, _1531, _835);
    out.m_71.x = _1535;
    out.m_71.y = _1537;
    out.m_71.z = _1539;
    out.m_71.w = _1533;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
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
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1595 = as_type<float>(_106);
        out.gl_Position.z = _1595;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        _100 = _126;
    }
    float _128 = _100;
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
        float _1664 = as_type<float>(_142);
        out.gl_Position.z = _1664;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.w;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = in.m_42.x;
    float _166 = in.m_42.y;
    float _168 = in.m_42.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    float _246 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_244, _160, _246);
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _162, _250);
    float _258 = fma(_252, _144, _166);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _168);
    float _264 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _266 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _268 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _270 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _264);
    float _272 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _266);
    float _274 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _268);
    float _276 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _270);
    float _278 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _272);
    float _280 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _274);
    float _282 = _276 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _284 = _278 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _286 = _280 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _288 = in.m_49.x;
    float _290 = in.m_49.y;
    float _292 = in.m_49.z;
    float _294 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _296 = _282 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _300 = _284 + _298;
    float _302 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _304 = _286 + _302;
    float _306 = _296 * _296;
    float _308 = fma(_300, _300, _306);
    float _310 = fma(_304, _304, _308);
    float _312 = rsqrt(_310);
    float _314 = _290 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _316 = _288 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = _292 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _322 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _324 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _326 = _296 * _312;
    float _328 = _300 * _312;
    float _330 = -_326;
    float _332 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[18].w, _296);
    float _334 = _304 * _312;
    float _336 = -_328;
    float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[18].w, _300);
    float _340 = _332 * _332;
    float _342 = -_334;
    float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[18].w, _304);
    float _346 = fma(_338, _338, _340);
    float _348 = in.m_51.x;
    float _350 = in.m_51.y;
    float _352 = in.m_51.z;
    float _354 = fma(_344, _344, _346);
    float _356 = sqrt(_354);
    float _358 = _312 * _356;
    float _360 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _350);
    float _362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _348);
    float _364 = _320 * _358;
    float _366 = _322 * _358;
    float _368 = _324 * _358;
    float _370 = _364 * _360;
    float _372 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _352);
    float _374 = _366 * _362;
    float _376 = _370 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _378 = _370 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _380 = _368 * _372;
    float _382 = _370 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _384 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[10].x, _376);
    float _386 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[8].x, _378);
    float _388 = fma(_374, (*spvDescriptorSet0.vp_c10)._m0[9].x, _382);
    float _390 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[10].z, _384);
    float _392 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[8].z, _386);
    float _394 = fma(_380, (*spvDescriptorSet0.vp_c10)._m0[9].z, _388);
    float _396 = _286 + _390;
    float _398 = _284 + _392;
    float _400 = _282 + _394;
    float _402 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _404 = _396 + _402;
    float _406 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _408 = _398 + _406;
    float _410 = _404 * _404;
    float _412 = fma(_408, _408, _410);
    float _414 = sqrt(_412);
    bool _416 = _414 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _424 = _422 != 0;
    bool _426 = !_420;
    int _428 = _426 ? 0 : 1;
    bool _430 = !_424;
    int _432 = _430 ? 0 : 1;
    float _434 = _374;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _438 = _398;
    float _440 = _368;
    float _442 = _282;
    if (!_416)
    {
        _434 = _396;
    }
    float _444 = _434;
    float _446 = _444;
    if (!_416)
    {
        _436 = _400;
    }
    float _448 = _436;
    bool _450 = !_416;
    float _452 = _448;
    if (!_450)
    {
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _456 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _458 = _414 + _456;
        float _460 = _400 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _462 = rsqrt(_412);
        float _464 = _458 * _454;
        float _466 = _464 * 0.15915493667125701904296875;
        float _468 = _466 * 6.283185482025146484375;
        float _470 = cos(_468);
        float _472 = _466 * 6.283185482025146484375;
        float _474 = sin(_472);
        float _476 = _470 + (-1.0);
        float _478 = fma(_474, _460, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _480 = _476 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _482 = _462 * _478;
        float _484 = fma(_400, _470, _480);
        float _486 = fma(_408, _482, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _488 = fma(_404, _482, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _452 = _484;
        _438 = _486;
        _446 = _488;
        _440 = _466;
    }
    float _490 = _452;
    float _492 = _438;
    float _494 = _446;
    float _496 = _440;
    float _498 = -_326;
    float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _490);
    float _502 = -_328;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _492);
    float _506 = -_334;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _494);
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
    float _530 = _528 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _532 = _516 * _530;
    float _534 = _520 * _530;
    float _536 = _532 * _532;
    float _538 = _534 * _534;
    float _540 = _536 + _538;
    float _542 = sqrt(_540);
    bool _544 = _542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _546 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _548 = _542 + _546;
    float _550 = _520;
    float _552 = _496;
    float _554 = _548;
    float _556 = _512;
    if (_544)
    {
        float _558 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _550 = _558;
    }
    float _560 = _550;
    if (_544)
    {
        float _562 = rsqrt(_540);
        _552 = _562;
    }
    float _564 = _552;
    float _566 = _564;
    if (_544)
    {
        float _568 = _548 * _560;
        _554 = _568;
    }
    float _570 = _554;
    if (_544)
    {
        float _572 = _570 * 0.15915493667125701904296875;
        _442 = _572;
    }
    float _574 = _442;
    float _576 = _528;
    if (_544)
    {
        float _578 = _574 * 6.283185482025146484375;
        float _580 = sin(_578);
        _576 = _580;
    }
    float _582 = _576;
    float _584 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _586 = precise::max(0.0, _584);
    float _588 = _522;
    float _590 = _586;
    float _592 = _584;
    if (_544)
    {
        float _594 = _574 * 6.283185482025146484375;
        float _596 = cos(_594);
        _588 = _596;
    }
    float _598 = _588;
    float _600 = -_530;
    float _602 = -_586;
    float _604 = fma(_512, _600, _602);
    if (!_544)
    {
        _556 = _532;
    }
    float _606 = _556;
    float _608 = _606;
    if (_544)
    {
        float _610 = _604 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _590 = _610;
    }
    float _612 = _590;
    float _614 = sqrt(_526);
    float _616 = _612;
    float _618 = _582;
    if (_544)
    {
        float _620 = fma(_582, _612, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _616 = _620;
    }
    float _622 = _616;
    float _624 = _622;
    if (!_544)
    {
        _618 = _536;
    }
    float _626 = _618;
    float _628 = _626;
    float _630 = _598;
    if (_544)
    {
        float _632 = _598 + (-1.0);
        _592 = _632;
    }
    float _634 = _592;
    float _636 = 0.0;
    float _638 = _634;
    if (_544)
    {
        float _640 = _564 * _622;
        _636 = _640;
    }
    float _642 = _636;
    if (!_544)
    {
        _624 = _604;
    }
    float _644 = _624;
    float _646 = _644;
    if (_544)
    {
        float _648 = _634 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _566 = _648;
    }
    float _650 = _566;
    if (_544)
    {
        float _652 = _532 * _642;
        _608 = _652;
    }
    float _654 = _608;
    if (!_544)
    {
        _638 = _534;
    }
    float _656 = _638;
    float _658 = _656;
    if (_544)
    {
        float _660 = _534 * _642;
        _658 = _660;
    }
    float _662 = _658;
    if (_544)
    {
        float _664 = fma(_604, _598, _650);
        _646 = _664;
    }
    float _666 = _646;
    if (_544)
    {
        float _668 = _654 * _654;
        _628 = _668;
    }
    float _670 = _628;
    if (!_544)
    {
        _630 = _538;
    }
    float _672 = _630;
    float _674 = _672;
    if (_544)
    {
        float _676 = _662 * _662;
        _674 = _676;
    }
    float _678 = _674;
    float _680 = fma(_666, _666, _670);
    float _682 = _680 + _678;
    float _684 = _500 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _686 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _688 = fma(_614, (*spvDescriptorSet0.vp_c15)._m0[23].w, _686);
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _694 = _500 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _696 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[2].x, _684);
    float _698 = rsqrt(_682);
    float _700 = _500 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _702 = -_690;
    float _704 = _702 + 1.0;
    float _706 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[2].z, _696);
    float _708 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[1].x, _694);
    float _710 = _500 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _712 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[0].x, _700);
    float _714 = _706 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _716 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[1].z, _708);
    float _718 = abs(_704);
    float _720 = log2(_718);
    float _722 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[3].x, _710);
    float _724 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[0].z, _712);
    float _726 = _716 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _728 = _714 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _730 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[3].z, _722);
    float _732 = _724 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _734 = _726 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _736 = _698 * _654;
    float _738 = _730 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _740 = _698 * _662;
    float _742 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[7].x, _734);
    float _744 = _698 * _666;
    float _746 = _736 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _748 = -_728;
    float _750 = fma(_748, _692, 1.0);
    float _752 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[7].z, _742);
    float _754 = _720 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _756 = -_746;
    float _758 = fma(_744, (*spvDescriptorSet0.vp_c15)._m0[21].y, _756);
    float _760 = _726 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _762 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[7].w, _752);
    float _764 = exp2(_754);
    float _766 = -_740;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c15)._m0[21].z, _758);
    float _770 = _726 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _772 = fma(_768, -0.5, 0.5);
    float _774 = fma(_768, 0.5, 0.5);
    float _776 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[4].x, _770);
    float _778 = log2(_750);
    float _780 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[5].x, _760);
    float _782 = _744 + 1.0;
    float _784 = fma(_774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _786 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[4].z, _776);
    float _788 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[5].z, _780);
    float _790 = fma(_774, _784, -0.212114393711090087890625);
    float _792 = 1.0 / _762;
    float _794 = -_744;
    float _796 = fma(_764, _782, _794);
    float _798 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[4].w, _786);
    float _800 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[5].w, _788);
    float _802 = fma(_774, _790, 1.570728778839111328125);
    float _804 = fma(_796, 0.5, 0.5);
    float _806 = sqrt(_772);
    float _808 = _778 * 0.693147182464599609375;
    float _810 = _808 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _812 = _798 * _792;
    float _814 = _800 * _792;
    float _816 = fma(_812, 0.5, 0.5);
    float _818 = fma(_814, -0.5, 0.5);
    float _820 = _806 * 0.636619746685028076171875;
    float _822 = -_802;
    float _824 = fma(_820, _822, 1.0);
    float3 _2786 = float3(_816, _818, _810);
    float _826 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2786, float3(0.0), isnan(_2786)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2786, float3(0.0), isnan(_2786)), level(0.0)).x;
    float3 _2797 = float3(_816, _818, _810);
    float4 _829 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2797, float3(0.0), isnan(_2797)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2797, float3(0.0), isnan(_2797)), level(0.0)).xyzw;
    float _831 = _829.x;
    float _833 = _829.y;
    float _835 = _829.z;
    float _837 = _829.w;
    float2 _2814 = float2(_824, _804);
    float3 _841 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2814, float2(0.0), isnan(_2814)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2814, float2(0.0), isnan(_2814)), level(0.0)).xyz;
    float _843 = _841.x;
    float _845 = _841.y;
    float _847 = _841.z;
    float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _851 = _124 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _853 = in.m_53.w;
    float _855 = _720 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _863 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _865 = _863 != 0;
    float _867 = in.m_53.x;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _873 = in.m_53.y;
    float _875 = _851 * _849;
    float _877 = 1.0 / _859;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _879;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _891 = _889 != 0;
    float _893 = 1.0 / _871;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _899 = _726 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _901 = _853 > 0.5;
    float _903 = in.m_55.x;
    int _905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _907 = _905 != 0;
    float _909 = fma(_732, (*spvDescriptorSet0.vp_c8)._m0[6].x, _899);
    float _911 = 1.0 / _897;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _917 = in.m_57.y;
    float _919 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[20].x, _875);
    float _921 = in.m_55.y;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _925 = _923 != 0;
    float _927 = 1.0 / _915;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _935 = _933 != 0;
    float _937 = _867 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _941 = _939 != 0;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _945 = _873 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _947 = -_887;
    float _949 = fma(_937, 2.0, _947);
    float _951 = 1.0 / _931;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _957 = float(_90);
    float _959 = _881 * _911;
    float _961 = fma(_945, -2.0, _943);
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _971 = 1.0 / _955;
    float _973 = _885 * _927;
    float _975 = _969 * _893;
    float _977 = -_917;
    float _979 = _977 + 1.0;
    float _981 = _965 * _877;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _983;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _991 = 1.0 / _957;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _997 = in.m_57.x;
    float _999 = _985 * _951;
    float _1001 = _943;
    float _1003 = _917;
    bool _1005 = _941;
    bool _1007 = _935;
    float _1009 = _961;
    if (_925)
    {
        float _1011 = in.m_53.z;
        _1001 = _1011;
    }
    float _1013 = _1001;
    float _1015 = 1.0 / _995;
    float _1017 = _989 * _971;
    int _1019 = _901 ? as_type<int>(_979) : as_type<int>(_917);
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1023 = _873 > 0.5;
    float _1025 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1027 = _935 ? as_type<float>(_1019) : _917;
    float _1029 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1021);
    float _1031 = _124 * _991;
    if (_941)
    {
        float _1033 = _1023 ? _979 : _917;
        _1003 = _1033;
    }
    float _1035 = _1003;
    float _1037 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1037;
    float _1041 = _995;
    if (!_907)
    {
        float _1043 = in.m_53.z;
        _1041 = _1043;
    }
    float _1045 = _1041;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1049 = _1031 + _1047;
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1053 = _1031 + _1051;
    if (_891)
    {
        bool _1055 = _867 > 0.5;
        _1005 = _1055;
    }
    bool _1057 = _1005;
    float _1059 = floor(_919);
    float _1061 = _1039 * _1015;
    float _1063 = fma(_981, _1049, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1065 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1067 = _1031 + _1065;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1071 = _1031 + _1069;
    float _1073 = fma(_1017, _1053, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1077 = _1031 + _1075;
    float _1079 = fma(_973, _1067, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1081 = fma(_959, _1071, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1085 = _1071;
    if (!_891)
    {
        _1085 = _997;
    }
    float _1087 = _1085;
    float _1089 = fma(_1061, _1077, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1091 = _1087;
    float _1093 = _1013;
    if (_925)
    {
        bool _1095 = _1013 > 0.5;
        _1007 = _1095;
    }
    bool _1097 = _1007;
    float _1099 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1029);
    float _1101 = 0.0;
    if (!_891)
    {
        _1101 = _1087;
    }
    float _1103 = _1101;
    float _1105 = -_124;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[76].x, _949);
    float _1109 = _1103;
    if (_891)
    {
        _1091 = _997;
    }
    float _1111 = _1091;
    float _1113 = _861 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1115 = -_1059;
    float _1117 = _919 + _1115;
    if (!_907)
    {
        _1093 = _873;
    }
    float _1119 = _1093;
    float _1121 = fma(_1027, _1113, -0.5);
    float _1123 = _1119;
    if (_907)
    {
        _1123 = _867;
    }
    float _1125 = _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1129 = _1031 + _1127;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1133 = _1083 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1135 = fma(_975, _1129, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1139 = _1031 + _1137;
    float _1141 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1131);
    float _1143 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1145 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1147 = isnan(_1031);
    bool _1149 = _1145 || _1147;
    bool _1151 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1153 = _1149 || _1151;
    float _1155 = float(_1153);
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1159 = fma(_999, _1139, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1161 = _1139;
    float _1163 = _1045;
    if (!_907)
    {
        _1161 = _1045;
    }
    float _1165 = _1161;
    float _1167 = -_1025;
    float _1169 = fma(_1143, 2.0, _1167);
    bool _1171 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1173 = isnan(_1031);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1157);
    float _1185 = _1165;
    if (_907)
    {
        _1185 = _873;
    }
    float _1187 = _1185;
    float _1189 = -_1155;
    float _1191 = _1189 + 1.0;
    if (_907)
    {
        _1163 = _873;
    }
    float _1193 = _1163;
    float _1195 = fma(_1133, _1035, -0.5);
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1199 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1201 = isnan(_1031);
    bool _1203 = _1199 || _1201;
    bool _1205 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1207 = _1203 || _1205;
    int _1209 = _1207 ? 1065353216 : 0;
    float _1211 = _1181 * _1191;
    float _1213 = -_1181;
    float _1215 = _1213 + 1.0;
    float _1217 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1197);
    float _1219 = _919 * 6.283185482025146484375;
    bool _1221 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1223 = isnan(_1031);
    bool _1225 = _1221 || _1223;
    bool _1227 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1229 = _1225 || _1227;
    float _1231 = float(_1229);
    float _1233 = as_type<float>(_1209) * _1215;
    float _1235 = -as_type<float>(_1209);
    float _1237 = _1235 + 1.0;
    int _1239 = _1209;
    if (_891)
    {
        float _1241 = -_1111;
        float _1243 = _1241 + 1.0;
        _1239 = as_type<int>(_1243);
    }
    int _1245 = _1239;
    float _1247 = _1219 * 0.15915493667125701904296875;
    bool _1249 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1251 = isnan(_1031);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = -_1231;
    float _1263 = _1261 + 1.0;
    float _1265 = _1231 * _1237;
    if (_891)
    {
        float _1267 = _1057 ? as_type<float>(_1245) : _1111;
        _1109 = _1267;
    }
    float _1269 = _1109;
    float _1271 = _1247 * 6.283185482025146484375;
    float _1273 = cos(_1271);
    float _1275 = _1259 * _1263;
    bool _1277 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1279 = isnan(_1031);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1285 = _1281 || _1283;
    float _1287 = float(_1285);
    float _1289 = -_1259;
    float _1291 = _1289 + 1.0;
    bool _1293 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1295 = isnan(_1031);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1301 = _1297 || _1299;
    float _1303 = float(_1301);
    float _1305 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1183);
    bool _1307 = _1031 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1309 = isnan(_1031);
    bool _1311 = _1307 || _1309;
    bool _1313 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1315 = _1311 || _1313;
    float _1317 = float(_1315);
    float _1319 = _1287 * _1291;
    float _1321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1323 = -_1287;
    float _1325 = _1323 + 1.0;
    int _1327 = 0;
    if (_925)
    {
        float _1329 = -_1111;
        float _1331 = _1329 + 1.0;
        _1327 = as_type<int>(_1331);
    }
    int _1333 = _1327;
    float _1335 = -_1317;
    float _1337 = _1335 + 1.0;
    float _1339 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _961);
    float _1341 = _1317 * _1325;
    float _1343 = _1303 * _1337;
    float _1345 = fma(_1273, 0.5, 0.5);
    float _1347 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1349 = _1117 < 0.5;
    float _1351 = float(_1349);
    float _1353 = _1063 * _1343;
    float _1355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_925)
    {
        _1009 = _1111;
    }
    float _1357 = _1009;
    float _1359 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1141);
    float _1361 = _1357;
    if (_925)
    {
        float _1363 = _1097 ? as_type<float>(_1333) : _1111;
        _1361 = _1363;
    }
    float _1365 = _1361;
    float _1367 = -_1339;
    float _1369 = fma(_1305, _1195, _1367);
    float _1371 = -_1117;
    float _1373 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1375 = -_1351;
    float _1377 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1379 = -_1303;
    float _1381 = _1379 + 1.0;
    float _1383 = -_1345;
    float _1385 = fma(_1383, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1389 = _1321 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1391 = fma(_1347, -2.0, _1387);
    float _1393 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1353);
    float _1395 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1399 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1401 = fma(_1389, _1269, -0.5);
    float _1403 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1405 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1407 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1409 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1411 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1417 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1419 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1421 = _1413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _1403;
    out.m_59.y = _1405;
    out.m_59.z = _1407;
    float _1423 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1425 = abs(_428);
    float _1427 = -_124;
    float _1429 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1169);
    out.m_61.x = _1417;
    out.m_61.y = _1419;
    out.m_61.z = _1421;
    out.m_61.w = _1415;
    float _1431 = fma(_1423, _1365, -0.5);
    float _1433 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1217);
    float _1435 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1391);
    float _1437 = fma(_1135, _1341, _1393);
    float _1439 = fma(_1359, _1431, _1429);
    bool _1441 = !_865;
    int _1443 = _1441 ? 0 : 1;
    float _1445 = fma(_1099, _1401, _1107);
    int _1447 = abs(_432);
    float _1449 = -_1435;
    float _1451 = fma(_1433, _1121, _1449);
    float _1453 = exp2(_855);
    float _1455 = fma(_1081, _1319, _1437);
    int _1457 = abs(_1443);
    float _1459 = in.m_55.z;
    float _1461 = _1445 + 0.5;
    float _1463 = _1439 + 0.5;
    float _1465 = in.m_55.w;
    float _1467 = float(_1425);
    float _1469 = _1451 + 0.5;
    float _1471 = fma(_1079, _1275, _1455);
    float _1473 = float(_1457);
    float _1475 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[6].z, _909);
    float _1477 = abs(_1373);
    float _1479 = _1467 * _1477;
    float _1481 = _1369 + 0.5;
    float _1483 = fma(_1159, _1265, _1471);
    float _1485 = -_1453;
    float _1487 = _1485 + 1.0;
    float _1489 = float(_1447);
    float _1491 = fma(_1473, _1385, _1479);
    out.m_63.x = _1461;
    out.m_63.y = _1481;
    out.m_63.z = _1463;
    out.m_63.w = _1469;
    float _1493 = fma(_1073, _1233, _1483);
    float _1495 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1475);
    float _1497 = abs(_1377);
    float _1499 = fma(_1489, _1497, _1491);
    float _1501 = _798 + _762;
    float _1503 = fma(_1089, _1211, _1493);
    float _1505 = _1495 + _762;
    float _1507 = _762 * 0.5;
    float _1509 = _1499 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1511 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1503);
    float _1513 = _1505 * 0.5;
    float _1515 = _1501 * 0.5;
    float _1517 = fma(_800, -0.5, _1507);
    float _1519 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1521 = _1509 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _903;
    out.m_65.y = _921;
    out.m_65.z = _1459;
    out.m_65.w = _1465;
    out.m_67.x = _1511;
    out.gl_Position.x = _798;
    out.gl_Position.y = _800;
    out.gl_Position.z = _1495;
    out.gl_Position.w = _762;
    out.m_69.x = _1515;
    out.m_69.y = _1517;
    out.m_69.z = _1513;
    out.m_69.w = _762;
    out.m_45.x = _1521;
    float _1523 = _1519 * _826;
    float _1525 = -_1519;
    float _1527 = _1525 + 1.0;
    float _1529 = _837 * _1523;
    float _1531 = _847 * _1523;
    float _1533 = _837 * _1527;
    float _1535 = fma(_843, _1529, _831);
    float _1537 = fma(_845, _1529, _833);
    float _1539 = fma(_837, _1531, _835);
    out.m_71.x = _1535;
    out.m_71.y = _1537;
    out.m_71.z = _1539;
    out.m_71.w = _1533;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

