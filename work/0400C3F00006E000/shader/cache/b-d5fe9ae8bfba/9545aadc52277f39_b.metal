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
    float4 m_65 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_59 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_49 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1354 = as_type<float>(_104);
        out.gl_Position.z = _1354;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _96 = _124;
    }
    float _126 = _96;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1423 = as_type<float>(_140);
        out.gl_Position.z = _1423;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_49.x;
    float _144 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _146 = in.m_51.x;
    float _148 = in.m_51.y;
    float _150 = in.m_51.z;
    float _152 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _144);
    float _154 = in.m_53.x;
    float _156 = in.m_53.y;
    float _158 = in.m_53.z;
    float _160 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _152);
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = sqrt(_160);
    float _174 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _176 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _174);
    float _178 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[193].x, -1.0);
    float _180 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _176);
    float _182 = fma(_178, _142, 1.0);
    float _184 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _186 = rsqrt(_180);
    float _188 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _190 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _192 = _172 * _154;
    float _194 = _156 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _196 = in.m_47.x;
    float _198 = in.m_47.y;
    float _200 = in.m_47.z;
    float _202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _154);
    float _204 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.033333338797092437744140625, _192);
    float _206 = _194 * _182;
    float _208 = in.m_51.w;
    float _210 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _212 = _204 * 0.15915493667125701904296875;
    float _214 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _216 = in.m_42.x;
    float _218 = in.m_42.y;
    float _220 = in.m_42.z;
    float _222 = _188 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _206);
    float _226 = _184;
    float _228 = _214;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_170)
    {
        float _232 = _214 * _214;
        float _234 = _232 * 0.5;
        _226 = _234;
    }
    float _236 = _226;
    float _238 = _212 * 6.283185482025146484375;
    float _240 = sin(_238);
    float _242 = _210 * _202;
    float _244 = _222 * _224;
    float _246 = _236;
    if (!_170)
    {
        float _248 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _246 = _248;
    }
    float _250 = _246;
    bool _252 = !_170;
    float _254 = _250;
    if (!_252)
    {
        float _256 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = log2(_256);
        float _260 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _262 = _260 + 1.0;
        float _264 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = _214 * _258;
        float _268 = 1.0 / _262;
        float _270 = _264 * 0.693147182464599609375;
        float _272 = exp2(_266);
        float _274 = 1.0 / _270;
        float _276 = _272 + (-1.0);
        float _278 = -_276;
        float _280 = fma(_278, _274, _214);
        float _282 = _280 * _268;
        float _284 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _254 = _284;
    }
    float _286 = _254;
    bool _288 = !_170;
    if (!_288)
    {
        float _290 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = log2(_290);
        float _294 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _296 = _294 + 1.0;
        float _298 = 1.0 / _296;
        float _300 = _214 * _292;
        float _302 = exp2(_300);
        float _304 = -_302;
        float _306 = _304 + 1.0;
        float _308 = _306 * _298;
        _228 = _308;
        _230 = _298;
    }
    float _310 = _228;
    float _312 = _230;
    float _314 = _240 + _158;
    float _316 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _318 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _320 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _322 = _190 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _324 = fma(_310, _198, _316);
    float _326 = fma(_310, _196, _318);
    float _328 = _314 * _186;
    float _330 = _328 * 0.125;
    float _332 = fma(_310, _200, _320);
    float _334 = fma(_324, _208, _218);
    float _336 = fma(_326, _208, _216);
    float _338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _330);
    float _340 = fma(_332, _208, _220);
    float _342 = _334 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _344 = _334 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _346 = _322 * _338;
    float _348 = _244 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _350 = _244 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _352 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[6].x, _342);
    float _354 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[4].x, _344);
    float _356 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[8].x, _348);
    float _358 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[10].x, _350);
    float _360 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[6].z, _352);
    float _362 = _334 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _364 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[4].z, _354);
    float _366 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[10].z, _358);
    float _368 = _360 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _370 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[5].x, _362);
    float _372 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[8].z, _356);
    float _374 = _364 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _376 = _368 + _366;
    float _378 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[5].z, _370);
    float _380 = _244 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _382 = _374 + _372;
    float _384 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _386 = _376 + _384;
    float _388 = _378 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _390 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _392 = isnan(0.5);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _398 = _394 || _396;
    float _400 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _402 = _382 + _400;
    float _404 = _386 * _386;
    float _406 = _388 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _408 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[9].x, _380);
    float _410 = fma(_402, _402, _404);
    float _412 = fma(_374, (*spvDescriptorSet0.vp_c8)._m0[11].x, _406);
    float _414 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[9].z, _408);
    float _416 = sqrt(_410);
    float _418 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[11].z, _412);
    float _420 = _388 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _422 = _388 + _414;
    float _424 = _318;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _428 = _414;
    float _430 = _422;
    float _432 = _376;
    float _434 = _382;
    float _436 = _312;
    if (_398)
    {
        _424 = 1.0;
    }
    float _438 = _424;
    float _440 = _418 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _442 = fma(_374, (*spvDescriptorSet0.vp_c8)._m0[10].x, _420);
    float _444 = 1.0 / _440;
    float _446 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[10].z, _442);
    float _448 = _446 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _450 = _416 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _452 = _448 + _440;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _456 = _454 != 0;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _460 = _458 != 0;
    float _462 = _452 * _444;
    float _464 = _462 * 0.5;
    bool _466 = !_456;
    int _468 = _466 ? 0 : 1;
    bool _470 = !_460;
    int _472 = _470 ? 0 : 1;
    float _474 = _452;
    float _476 = _438;
    bool _478 = false;
    if (!_450)
    {
        _426 = _382;
    }
    float _480 = _426;
    float _482 = _480;
    if (!_450)
    {
        _474 = _376;
    }
    float _484 = _474;
    float _486 = _484;
    if (!_450)
    {
        _428 = _422;
    }
    float _488 = _428;
    bool _490 = !_450;
    float _492 = _488;
    if (!_490)
    {
        float _494 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _496 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _498 = _416 + _496;
        float _500 = _422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _502 = rsqrt(_410);
        float _504 = _498 * _494;
        float _506 = _504 * 0.15915493667125701904296875;
        float _508 = _506 * 6.283185482025146484375;
        float _510 = cos(_508);
        float _512 = _506 * 6.283185482025146484375;
        float _514 = sin(_512);
        float _516 = _510 + (-1.0);
        float _518 = _516 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _520 = fma(_514, _500, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _522 = fma(_422, _510, _518);
        float _524 = _502 * _520;
        float _526 = fma(_402, _524, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _528 = fma(_386, _524, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _492 = _522;
        _482 = _526;
        _486 = _528;
    }
    float _530 = _492;
    float _532 = _482;
    float _534 = _486;
    if (!_398)
    {
        float _536 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _538 = _536 * 0.15915493667125701904296875;
        float _540 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _542 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _544 = fma(_464, (*spvDescriptorSet0.vp_c8)._m0[30].w, _542);
        float _546 = _538 * 6.283185482025146484375;
        float _548 = cos(_546);
        float _550 = _540 * 0.15915493667125701904296875;
        float _552 = _538 * 6.283185482025146484375;
        float _554 = sin(_552);
        float _556 = 1.0 / _548;
        float _558 = _550 * 6.283185482025146484375;
        float _560 = cos(_558);
        float _562 = _554 * _556;
        float _564 = _550 * 6.283185482025146484375;
        float _566 = sin(_564);
        float _568 = _560 * _562;
        float _570 = 1.0 / _544;
        float _572 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _574 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _572;
        float _576 = 1.0 / _568;
        float _578 = 1.0 / _574;
        float _580 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _582 = _570 * _580;
        float _584 = _566 * _576;
        float _586 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _588 = fma(_584, _582, _586);
        float _590 = _588 * _578;
        float _592 = precise::clamp(_590, 0.0, 1.0);
        float _594 = -_592;
        float _596 = _594 + 1.0;
        _430 = _578;
        _432 = _550;
        _434 = _570;
        _476 = _596;
    }
    float _598 = _430;
    float _600 = _432;
    float _602 = _434;
    float _604 = _476;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _608 = _530 + _606;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _532 + _610;
    float _614 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _616 = _534 + _614;
    float _618 = _608 * _608;
    float _620 = fma(_612, _612, _618);
    float _622 = fma(_616, _616, _620);
    float _624 = rsqrt(_622);
    float _626 = _624 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _628 = _612 * _626;
    float _630 = _616 * _626;
    float _632 = _628 * _628;
    float _634 = _630 * _630;
    float _636 = _632 + _634;
    float _638 = sqrt(_636);
    bool _640 = _638 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _642 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _644 = _638 + _642;
    float _646 = _598;
    float _648 = _644;
    float _650 = _600;
    float _652 = _608;
    float _654 = _628;
    if (_640)
    {
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _646 = _656;
    }
    float _658 = _646;
    float _660 = _658;
    if (_640)
    {
        float _662 = _644 * _658;
        _648 = _662;
    }
    float _664 = _648;
    if (_640)
    {
        float _666 = rsqrt(_636);
        _660 = _666;
    }
    float _668 = _660;
    float _670 = _668;
    if (_640)
    {
        float _672 = _664 * 0.15915493667125701904296875;
        _650 = _672;
    }
    float _674 = _650;
    float _676 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _678 = _616;
    if (_640)
    {
        float _680 = _674 * 6.283185482025146484375;
        float _682 = sin(_680);
        _678 = _682;
    }
    float _684 = _678;
    float _686 = precise::max(0.0, _676);
    float _688 = _602;
    float _690 = _686;
    if (_640)
    {
        float _692 = _674 * 6.283185482025146484375;
        float _694 = cos(_692);
        _688 = _694;
    }
    float _696 = _688;
    float _698 = -_626;
    float _700 = -_686;
    float _702 = fma(_608, _698, _700);
    if (_640)
    {
        float _704 = _702 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _652 = _704;
    }
    float _706 = _652;
    float _708 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _710 = sqrt(_622);
    float _712 = _684;
    float _714 = _706;
    if (_640)
    {
        float _716 = fma(_684, _706, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _712 = _716;
    }
    float _718 = _712;
    float _720 = _718;
    if (!_640)
    {
        _714 = _702;
    }
    float _722 = _714;
    float _724 = _722;
    if (_640)
    {
        float _726 = _668 * _718;
        _436 = _726;
    }
    float _728 = _436;
    if (!_640)
    {
        _720 = _632;
    }
    float _730 = _720;
    float _732 = _530 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _734 = _730;
    float _736 = _696;
    if (_640)
    {
        float _738 = _696 + (-1.0);
        _690 = _738;
    }
    float _740 = _690;
    float _742 = _740;
    if (_640)
    {
        float _744 = _628 * _728;
        _654 = _744;
    }
    float _746 = _654;
    float _748 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[3].x, _732);
    if (_640)
    {
        float _750 = _740 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _670 = _750;
    }
    float _752 = _670;
    if (!_640)
    {
        _742 = _630;
    }
    float _754 = _742;
    float _756 = _754;
    if (_640)
    {
        float _758 = _630 * _728;
        _756 = _758;
    }
    float _760 = _756;
    if (_640)
    {
        float _762 = _746 * _746;
        _734 = _762;
    }
    float _764 = _734;
    if (_640)
    {
        float _766 = fma(_702, _696, _752);
        _724 = _766;
    }
    float _768 = _724;
    if (!_640)
    {
        _736 = _634;
    }
    float _770 = _736;
    float _772 = _770;
    if (_640)
    {
        float _774 = _760 * _760;
        _772 = _774;
    }
    float _776 = _772;
    float _778 = fma(_768, _768, _764);
    float _780 = _778 + _776;
    float _782 = _530 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _784 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _786 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[23].w, _784);
    float _788 = precise::clamp(_786, 0.0, 1.0);
    float _790 = _530 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _792 = rsqrt(_780);
    float _794 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[2].x, _782);
    float _796 = -_788;
    float _798 = _796 + 1.0;
    float _800 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[1].x, _790);
    float _802 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[2].z, _794);
    float _804 = _530 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _806 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[1].z, _800);
    float _808 = abs(_798);
    float _810 = log2(_808);
    float _812 = _802 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _814 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[0].x, _804);
    float _816 = _806 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _818 = _812 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _820 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[0].z, _814);
    float _822 = _816 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _824 = _792 * _746;
    float _826 = -_818;
    float _828 = fma(_826, _708, 1.0);
    float _830 = _820 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _832 = _792 * _768;
    float _834 = _824 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _836 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[3].z, _748);
    float _838 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[7].x, _822);
    float _840 = _792 * _760;
    float _842 = -_834;
    float _844 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[21].y, _842);
    float _846 = _836 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _848 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[7].z, _838);
    float _850 = log2(_828);
    float _852 = -_840;
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c15)._m0[21].z, _844);
    float _856 = _810 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _858 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[7].w, _848);
    float _860 = _816 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _862 = fma(_854, -0.5, 0.5);
    float _864 = _816 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _866 = fma(_854, 0.5, 0.5);
    float _868 = 1.0 / _858;
    float _870 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[4].x, _860);
    float _872 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[5].x, _864);
    float _874 = fma(_866, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _876 = _832 + 1.0;
    float _878 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[4].z, _870);
    float _880 = fma(_866, _874, -0.212114393711090087890625);
    float _882 = exp2(_856);
    float _884 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[4].w, _878);
    float _886 = fma(_866, _880, 1.570728778839111328125);
    float _888 = sqrt(_862);
    float _890 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[5].z, _872);
    float _892 = _884 * _868;
    float _894 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[5].w, _890);
    float _896 = _850 * 0.693147182464599609375;
    float _898 = fma(_892, 0.5, 0.5);
    float _900 = -_832;
    float _902 = fma(_882, _876, _900);
    float _904 = _894 * _868;
    float _906 = _896 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _908 = fma(_902, 0.5, 0.5);
    float _910 = fma(_904, -0.5, 0.5);
    float _912 = _888 * 0.636619746685028076171875;
    float3 _2679 = float3(_898, _910, _906);
    float _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2679, float3(0.0), isnan(_2679)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2679, float3(0.0), isnan(_2679)), level(0.0)).x;
    float3 _2690 = float3(_898, _910, _906);
    float4 _917 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2690, float3(0.0), isnan(_2690)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2690, float3(0.0), isnan(_2690)), level(0.0)).xyzw;
    float _919 = _917.x;
    float _921 = _917.y;
    float _923 = _917.z;
    float _925 = _917.w;
    float _927 = -_886;
    float _929 = fma(_912, _927, 1.0);
    float2 _2712 = float2(_929, _908);
    float3 _933 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2712, float2(0.0), isnan(_2712)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2712, float2(0.0), isnan(_2712)), level(0.0)).xyz;
    float _935 = _933.x;
    float _937 = _933.y;
    float _939 = _933.z;
    float _941 = in.m_55.x;
    float _943 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _945 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _947 = in.m_57.x;
    float _949 = _816 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _953 = _951 != 0;
    float _955 = in.m_57.y;
    int _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _959 = _957 != 0;
    float _961 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _963 = in.m_57.w;
    float _965 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[6].x, _949);
    out.m_59.x = _532;
    out.m_59.y = _530;
    out.m_59.z = _534;
    float _967 = _945 * _943;
    int _969 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _971 = _969 != 0;
    float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _975 = in.m_55.y;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _979 = _977 != 0;
    int _981 = 1;
    float _983 = _943;
    float _985 = _941;
    if (_953)
    {
        float _987 = -_941;
        float _989 = _987 + 1.0;
        _981 = as_type<int>(_989);
    }
    int _991 = _981;
    int _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _995 = _993 != 0;
    float _997 = 0.0;
    if (_959)
    {
        float _999 = in.m_57.z;
        _997 = _999;
    }
    float _1001 = _997;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1005 = _1003 != 0;
    float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_953)
    {
        bool _1009 = _947 > 0.5;
        _478 = _1009;
    }
    bool _1011 = _478;
    out.m_61.x = _941;
    float _1013 = _955 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_953)
    {
        _983 = _941;
    }
    float _1015 = _983;
    float _1017 = _1015;
    if (_953)
    {
        float _1019 = _1011 ? as_type<float>(_991) : _941;
        _1017 = _1019;
    }
    float _1021 = _1017;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1025 = _947 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1029 = _963 > 0.5;
    float _1031 = -_1023;
    float _1033 = fma(_1025, 2.0, _1031);
    float _1035 = fma(_1013, -2.0, _1027);
    float _1037 = _1027;
    float _1039 = _1025;
    if (!_979)
    {
        float _1041 = in.m_57.z;
        _1037 = _1041;
    }
    float _1043 = _1037;
    float _1045 = -_975;
    float _1047 = _1045 + 1.0;
    float _1049 = _975;
    float _1051 = _1047;
    if (!_979)
    {
        _1039 = _955;
    }
    float _1053 = _1039;
    float _1055 = -_122;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1033);
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1061 = _1053;
    if (_979)
    {
        _1061 = _947;
    }
    float _1063 = _1061;
    out.m_61.y = _975;
    bool _1065 = _1001 > 0.5;
    bool _1067 = _1065 && _959;
    float _1069 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[20].x, _967);
    float _1071 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1059);
    int _1073 = _1029 ? as_type<int>(_1047) : as_type<int>(_975);
    float _1075 = _961 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1077 = _995 ? as_type<float>(_1073) : _975;
    float _1079 = fma(_1075, _1021, -0.5);
    float _1081 = floor(_1069);
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1085 = _973 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1087 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1071);
    bool _1089 = _955 > 0.5;
    float _1091 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1083);
    float _1093 = fma(_1077, _1085, -0.5);
    float _1095 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1097 = _1075;
    float _1099 = _1043;
    if (!_979)
    {
        _1097 = _1043;
    }
    float _1101 = _1097;
    float _1103 = _1101;
    if (_979)
    {
        _1103 = _955;
    }
    float _1105 = _1103;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_979)
    {
        _1099 = _955;
    }
    float _1109 = _1099;
    float _1111 = fma(_1087, _1079, _1057);
    if (_1005)
    {
        float _1113 = _1089 ? _1047 : _975;
        _1049 = _1113;
    }
    float _1115 = _1049;
    float _1117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_959)
    {
        _1051 = _941;
    }
    float _1119 = _1051;
    float _1121 = _1119;
    if (_1067)
    {
        float _1123 = -_941;
        float _1125 = _1123 + 1.0;
        _985 = _1125;
    }
    float _1127 = _985;
    float _1129 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1107);
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_959)
    {
        _1121 = _1127;
    }
    float _1133 = _1121;
    float _1135 = -_1081;
    float _1137 = _1069 + _1135;
    float _1139 = _1069 * 6.283185482025146484375;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1143 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1145 = abs(_472);
    float _1147 = _1139 * 0.15915493667125701904296875;
    float _1149 = -_1141;
    float _1151 = fma(_1095, 2.0, _1149);
    float _1153 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1131);
    float _1155 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1159 = fma(_1143, _1115, -0.5);
    float _1161 = _1147 * 6.283185482025146484375;
    float _1163 = cos(_1161);
    float _1165 = fma(_1155, _1133, -0.5);
    float _1167 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1169 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1091);
    float _1171 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1035);
    float _1173 = fma(_1167, -2.0, _1157);
    int _1175 = abs(_468);
    float _1177 = -_1171;
    float _1179 = fma(_1169, _1159, _1177);
    float _1181 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1129);
    float _1183 = -_122;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1151);
    float _1187 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1153);
    float _1189 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1173);
    float _1191 = -_1137;
    float _1193 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _1195 = _1137 < 0.5;
    float _1197 = float(_1195);
    float _1199 = _810 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1201 = fma(_1163, 0.5, 0.5);
    bool _1203 = !_971;
    int _1205 = _1203 ? 0 : 1;
    float _1207 = fma(_1181, _1165, _1185);
    float _1209 = float(_1175);
    float _1211 = -_1201;
    float _1213 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1215 = exp2(_1199);
    int _1217 = abs(_1205);
    float _1219 = -_1197;
    float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1223 = abs(_1193);
    float _1225 = _1209 * _1223;
    float _1227 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[6].z, _965);
    float _1229 = float(_1217);
    float _1231 = _1179 + 0.5;
    float _1233 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1227);
    bool _1235 = _604 > 0.0;
    bool _1237 = isnan(_604);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan(0.0);
    bool _1243 = _1239 || _1241;
    float _1245 = fma(_1229, _1213, _1225);
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1249 = _1111 + 0.5;
    float _1251 = -_1189;
    float _1253 = fma(_1187, _1093, _1251);
    float _1255 = float(_1145);
    float _1257 = -_1215;
    float _1259 = _1257 + 1.0;
    out.m_63.w = _1247;
    float _1261 = _1207 + 0.5;
    float _1263 = _1253 + 0.5;
    float _1265 = _1259 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1267 = abs(_1221);
    float _1269 = fma(_1255, _1267, _1245);
    out.gl_Position.x = _884;
    out.gl_Position.y = _894;
    out.gl_Position.z = _1233;
    out.gl_Position.w = _858;
    float _1271 = _1269 * _604;
    float _1273 = _1233 + _858;
    out.m_65.x = _1249;
    out.m_65.y = _1231;
    out.m_65.z = _1261;
    out.m_65.w = _1263;
    float _1275 = _1273 * 0.5;
    float _1277 = _1271 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.z = _1275;
    out.m_67.w = _858;
    out.m_45.x = _1277;
    float _1279 = _1265 * _914;
    float _1281 = -_1265;
    float _1283 = _1281 + 1.0;
    float _1285 = _925 * _1279;
    float _1287 = _939 * _1279;
    float _1289 = fma(_935, _1285, _919);
    float _1291 = fma(_937, _1285, _921);
    float _1293 = _925 * _1283;
    float _1295 = fma(_925, _1287, _923);
    out.m_69.x = _1289;
    out.m_69.y = _1291;
    out.m_69.z = _1295;
    out.m_69.w = _1293;
    if (_1243)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1297 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1297;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1354 = as_type<float>(_104);
        out.gl_Position.z = _1354;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _96 = _124;
    }
    float _126 = _96;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1423 = as_type<float>(_140);
        out.gl_Position.z = _1423;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_49.x;
    float _144 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _146 = in.m_51.x;
    float _148 = in.m_51.y;
    float _150 = in.m_51.z;
    float _152 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _144);
    float _154 = in.m_53.x;
    float _156 = in.m_53.y;
    float _158 = in.m_53.z;
    float _160 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _152);
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = sqrt(_160);
    float _174 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _176 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _174);
    float _178 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[193].x, -1.0);
    float _180 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _176);
    float _182 = fma(_178, _142, 1.0);
    float _184 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _186 = rsqrt(_180);
    float _188 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _190 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _192 = _172 * _154;
    float _194 = _156 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _196 = in.m_47.x;
    float _198 = in.m_47.y;
    float _200 = in.m_47.z;
    float _202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _154);
    float _204 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.033333338797092437744140625, _192);
    float _206 = _194 * _182;
    float _208 = in.m_51.w;
    float _210 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _212 = _204 * 0.15915493667125701904296875;
    float _214 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _216 = in.m_42.x;
    float _218 = in.m_42.y;
    float _220 = in.m_42.z;
    float _222 = _188 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _206);
    float _226 = _184;
    float _228 = _214;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_170)
    {
        float _232 = _214 * _214;
        float _234 = _232 * 0.5;
        _226 = _234;
    }
    float _236 = _226;
    float _238 = _212 * 6.283185482025146484375;
    float _240 = sin(_238);
    float _242 = _210 * _202;
    float _244 = _222 * _224;
    float _246 = _236;
    if (!_170)
    {
        float _248 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _246 = _248;
    }
    float _250 = _246;
    bool _252 = !_170;
    float _254 = _250;
    if (!_252)
    {
        float _256 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = log2(_256);
        float _260 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _262 = _260 + 1.0;
        float _264 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = _214 * _258;
        float _268 = 1.0 / _262;
        float _270 = _264 * 0.693147182464599609375;
        float _272 = exp2(_266);
        float _274 = 1.0 / _270;
        float _276 = _272 + (-1.0);
        float _278 = -_276;
        float _280 = fma(_278, _274, _214);
        float _282 = _280 * _268;
        float _284 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _254 = _284;
    }
    float _286 = _254;
    bool _288 = !_170;
    if (!_288)
    {
        float _290 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = log2(_290);
        float _294 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _296 = _294 + 1.0;
        float _298 = 1.0 / _296;
        float _300 = _214 * _292;
        float _302 = exp2(_300);
        float _304 = -_302;
        float _306 = _304 + 1.0;
        float _308 = _306 * _298;
        _228 = _308;
        _230 = _298;
    }
    float _310 = _228;
    float _312 = _230;
    float _314 = _240 + _158;
    float _316 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _318 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _320 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _322 = _190 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _324 = fma(_310, _198, _316);
    float _326 = fma(_310, _196, _318);
    float _328 = _314 * _186;
    float _330 = _328 * 0.125;
    float _332 = fma(_310, _200, _320);
    float _334 = fma(_324, _208, _218);
    float _336 = fma(_326, _208, _216);
    float _338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _330);
    float _340 = fma(_332, _208, _220);
    float _342 = _334 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _344 = _334 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _346 = _322 * _338;
    float _348 = _244 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _350 = _244 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _352 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[6].x, _342);
    float _354 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[4].x, _344);
    float _356 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[8].x, _348);
    float _358 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[10].x, _350);
    float _360 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[6].z, _352);
    float _362 = _334 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _364 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[4].z, _354);
    float _366 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[10].z, _358);
    float _368 = _360 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _370 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[5].x, _362);
    float _372 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[8].z, _356);
    float _374 = _364 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _376 = _368 + _366;
    float _378 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[5].z, _370);
    float _380 = _244 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _382 = _374 + _372;
    float _384 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _386 = _376 + _384;
    float _388 = _378 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _390 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _392 = isnan(0.5);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _398 = _394 || _396;
    float _400 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _402 = _382 + _400;
    float _404 = _386 * _386;
    float _406 = _388 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _408 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[9].x, _380);
    float _410 = fma(_402, _402, _404);
    float _412 = fma(_374, (*spvDescriptorSet0.vp_c8)._m0[11].x, _406);
    float _414 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[9].z, _408);
    float _416 = sqrt(_410);
    float _418 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[11].z, _412);
    float _420 = _388 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _422 = _388 + _414;
    float _424 = _318;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _428 = _414;
    float _430 = _422;
    float _432 = _376;
    float _434 = _382;
    float _436 = _312;
    if (_398)
    {
        _424 = 1.0;
    }
    float _438 = _424;
    float _440 = _418 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _442 = fma(_374, (*spvDescriptorSet0.vp_c8)._m0[10].x, _420);
    float _444 = 1.0 / _440;
    float _446 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[10].z, _442);
    float _448 = _446 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _450 = _416 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _452 = _448 + _440;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _456 = _454 != 0;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _460 = _458 != 0;
    float _462 = _452 * _444;
    float _464 = _462 * 0.5;
    bool _466 = !_456;
    int _468 = _466 ? 0 : 1;
    bool _470 = !_460;
    int _472 = _470 ? 0 : 1;
    float _474 = _452;
    float _476 = _438;
    bool _478 = false;
    if (!_450)
    {
        _426 = _382;
    }
    float _480 = _426;
    float _482 = _480;
    if (!_450)
    {
        _474 = _376;
    }
    float _484 = _474;
    float _486 = _484;
    if (!_450)
    {
        _428 = _422;
    }
    float _488 = _428;
    bool _490 = !_450;
    float _492 = _488;
    if (!_490)
    {
        float _494 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _496 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _498 = _416 + _496;
        float _500 = _422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _502 = rsqrt(_410);
        float _504 = _498 * _494;
        float _506 = _504 * 0.15915493667125701904296875;
        float _508 = _506 * 6.283185482025146484375;
        float _510 = cos(_508);
        float _512 = _506 * 6.283185482025146484375;
        float _514 = sin(_512);
        float _516 = _510 + (-1.0);
        float _518 = _516 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _520 = fma(_514, _500, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _522 = fma(_422, _510, _518);
        float _524 = _502 * _520;
        float _526 = fma(_402, _524, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _528 = fma(_386, _524, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _492 = _522;
        _482 = _526;
        _486 = _528;
    }
    float _530 = _492;
    float _532 = _482;
    float _534 = _486;
    if (!_398)
    {
        float _536 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _538 = _536 * 0.15915493667125701904296875;
        float _540 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _542 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _544 = fma(_464, (*spvDescriptorSet0.vp_c8)._m0[30].w, _542);
        float _546 = _538 * 6.283185482025146484375;
        float _548 = cos(_546);
        float _550 = _540 * 0.15915493667125701904296875;
        float _552 = _538 * 6.283185482025146484375;
        float _554 = sin(_552);
        float _556 = 1.0 / _548;
        float _558 = _550 * 6.283185482025146484375;
        float _560 = cos(_558);
        float _562 = _554 * _556;
        float _564 = _550 * 6.283185482025146484375;
        float _566 = sin(_564);
        float _568 = _560 * _562;
        float _570 = 1.0 / _544;
        float _572 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _574 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _572;
        float _576 = 1.0 / _568;
        float _578 = 1.0 / _574;
        float _580 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _582 = _570 * _580;
        float _584 = _566 * _576;
        float _586 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _588 = fma(_584, _582, _586);
        float _590 = _588 * _578;
        float _592 = precise::clamp(_590, 0.0, 1.0);
        float _594 = -_592;
        float _596 = _594 + 1.0;
        _430 = _578;
        _432 = _550;
        _434 = _570;
        _476 = _596;
    }
    float _598 = _430;
    float _600 = _432;
    float _602 = _434;
    float _604 = _476;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _608 = _530 + _606;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _532 + _610;
    float _614 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _616 = _534 + _614;
    float _618 = _608 * _608;
    float _620 = fma(_612, _612, _618);
    float _622 = fma(_616, _616, _620);
    float _624 = rsqrt(_622);
    float _626 = _624 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _628 = _612 * _626;
    float _630 = _616 * _626;
    float _632 = _628 * _628;
    float _634 = _630 * _630;
    float _636 = _632 + _634;
    float _638 = sqrt(_636);
    bool _640 = _638 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _642 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _644 = _638 + _642;
    float _646 = _598;
    float _648 = _644;
    float _650 = _600;
    float _652 = _608;
    float _654 = _628;
    if (_640)
    {
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _646 = _656;
    }
    float _658 = _646;
    float _660 = _658;
    if (_640)
    {
        float _662 = _644 * _658;
        _648 = _662;
    }
    float _664 = _648;
    if (_640)
    {
        float _666 = rsqrt(_636);
        _660 = _666;
    }
    float _668 = _660;
    float _670 = _668;
    if (_640)
    {
        float _672 = _664 * 0.15915493667125701904296875;
        _650 = _672;
    }
    float _674 = _650;
    float _676 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _678 = _616;
    if (_640)
    {
        float _680 = _674 * 6.283185482025146484375;
        float _682 = sin(_680);
        _678 = _682;
    }
    float _684 = _678;
    float _686 = precise::max(0.0, _676);
    float _688 = _602;
    float _690 = _686;
    if (_640)
    {
        float _692 = _674 * 6.283185482025146484375;
        float _694 = cos(_692);
        _688 = _694;
    }
    float _696 = _688;
    float _698 = -_626;
    float _700 = -_686;
    float _702 = fma(_608, _698, _700);
    if (_640)
    {
        float _704 = _702 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _652 = _704;
    }
    float _706 = _652;
    float _708 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _710 = sqrt(_622);
    float _712 = _684;
    float _714 = _706;
    if (_640)
    {
        float _716 = fma(_684, _706, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _712 = _716;
    }
    float _718 = _712;
    float _720 = _718;
    if (!_640)
    {
        _714 = _702;
    }
    float _722 = _714;
    float _724 = _722;
    if (_640)
    {
        float _726 = _668 * _718;
        _436 = _726;
    }
    float _728 = _436;
    if (!_640)
    {
        _720 = _632;
    }
    float _730 = _720;
    float _732 = _530 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _734 = _730;
    float _736 = _696;
    if (_640)
    {
        float _738 = _696 + (-1.0);
        _690 = _738;
    }
    float _740 = _690;
    float _742 = _740;
    if (_640)
    {
        float _744 = _628 * _728;
        _654 = _744;
    }
    float _746 = _654;
    float _748 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[3].x, _732);
    if (_640)
    {
        float _750 = _740 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _670 = _750;
    }
    float _752 = _670;
    if (!_640)
    {
        _742 = _630;
    }
    float _754 = _742;
    float _756 = _754;
    if (_640)
    {
        float _758 = _630 * _728;
        _756 = _758;
    }
    float _760 = _756;
    if (_640)
    {
        float _762 = _746 * _746;
        _734 = _762;
    }
    float _764 = _734;
    if (_640)
    {
        float _766 = fma(_702, _696, _752);
        _724 = _766;
    }
    float _768 = _724;
    if (!_640)
    {
        _736 = _634;
    }
    float _770 = _736;
    float _772 = _770;
    if (_640)
    {
        float _774 = _760 * _760;
        _772 = _774;
    }
    float _776 = _772;
    float _778 = fma(_768, _768, _764);
    float _780 = _778 + _776;
    float _782 = _530 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _784 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _786 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[23].w, _784);
    float _788 = precise::clamp(_786, 0.0, 1.0);
    float _790 = _530 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _792 = rsqrt(_780);
    float _794 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[2].x, _782);
    float _796 = -_788;
    float _798 = _796 + 1.0;
    float _800 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[1].x, _790);
    float _802 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[2].z, _794);
    float _804 = _530 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _806 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[1].z, _800);
    float _808 = abs(_798);
    float _810 = log2(_808);
    float _812 = _802 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _814 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[0].x, _804);
    float _816 = _806 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _818 = _812 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _820 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[0].z, _814);
    float _822 = _816 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _824 = _792 * _746;
    float _826 = -_818;
    float _828 = fma(_826, _708, 1.0);
    float _830 = _820 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _832 = _792 * _768;
    float _834 = _824 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _836 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[3].z, _748);
    float _838 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[7].x, _822);
    float _840 = _792 * _760;
    float _842 = -_834;
    float _844 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[21].y, _842);
    float _846 = _836 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _848 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[7].z, _838);
    float _850 = log2(_828);
    float _852 = -_840;
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c15)._m0[21].z, _844);
    float _856 = _810 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _858 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[7].w, _848);
    float _860 = _816 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _862 = fma(_854, -0.5, 0.5);
    float _864 = _816 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _866 = fma(_854, 0.5, 0.5);
    float _868 = 1.0 / _858;
    float _870 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[4].x, _860);
    float _872 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[5].x, _864);
    float _874 = fma(_866, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _876 = _832 + 1.0;
    float _878 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[4].z, _870);
    float _880 = fma(_866, _874, -0.212114393711090087890625);
    float _882 = exp2(_856);
    float _884 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[4].w, _878);
    float _886 = fma(_866, _880, 1.570728778839111328125);
    float _888 = sqrt(_862);
    float _890 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[5].z, _872);
    float _892 = _884 * _868;
    float _894 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[5].w, _890);
    float _896 = _850 * 0.693147182464599609375;
    float _898 = fma(_892, 0.5, 0.5);
    float _900 = -_832;
    float _902 = fma(_882, _876, _900);
    float _904 = _894 * _868;
    float _906 = _896 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _908 = fma(_902, 0.5, 0.5);
    float _910 = fma(_904, -0.5, 0.5);
    float _912 = _888 * 0.636619746685028076171875;
    float3 _2679 = float3(_898, _910, _906);
    float _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2679, float3(0.0), isnan(_2679)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2679, float3(0.0), isnan(_2679)), level(0.0)).x;
    float3 _2690 = float3(_898, _910, _906);
    float4 _917 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2690, float3(0.0), isnan(_2690)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2690, float3(0.0), isnan(_2690)), level(0.0)).xyzw;
    float _919 = _917.x;
    float _921 = _917.y;
    float _923 = _917.z;
    float _925 = _917.w;
    float _927 = -_886;
    float _929 = fma(_912, _927, 1.0);
    float2 _2712 = float2(_929, _908);
    float3 _933 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2712, float2(0.0), isnan(_2712)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2712, float2(0.0), isnan(_2712)), level(0.0)).xyz;
    float _935 = _933.x;
    float _937 = _933.y;
    float _939 = _933.z;
    float _941 = in.m_55.x;
    float _943 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _945 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _947 = in.m_57.x;
    float _949 = _816 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _953 = _951 != 0;
    float _955 = in.m_57.y;
    int _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _959 = _957 != 0;
    float _961 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _963 = in.m_57.w;
    float _965 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[6].x, _949);
    out.m_59.x = _532;
    out.m_59.y = _530;
    out.m_59.z = _534;
    float _967 = _945 * _943;
    int _969 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _971 = _969 != 0;
    float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _975 = in.m_55.y;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _979 = _977 != 0;
    int _981 = 1;
    float _983 = _943;
    float _985 = _941;
    if (_953)
    {
        float _987 = -_941;
        float _989 = _987 + 1.0;
        _981 = as_type<int>(_989);
    }
    int _991 = _981;
    int _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _995 = _993 != 0;
    float _997 = 0.0;
    if (_959)
    {
        float _999 = in.m_57.z;
        _997 = _999;
    }
    float _1001 = _997;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1005 = _1003 != 0;
    float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_953)
    {
        bool _1009 = _947 > 0.5;
        _478 = _1009;
    }
    bool _1011 = _478;
    out.m_61.x = _941;
    float _1013 = _955 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_953)
    {
        _983 = _941;
    }
    float _1015 = _983;
    float _1017 = _1015;
    if (_953)
    {
        float _1019 = _1011 ? as_type<float>(_991) : _941;
        _1017 = _1019;
    }
    float _1021 = _1017;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1025 = _947 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1029 = _963 > 0.5;
    float _1031 = -_1023;
    float _1033 = fma(_1025, 2.0, _1031);
    float _1035 = fma(_1013, -2.0, _1027);
    float _1037 = _1027;
    float _1039 = _1025;
    if (!_979)
    {
        float _1041 = in.m_57.z;
        _1037 = _1041;
    }
    float _1043 = _1037;
    float _1045 = -_975;
    float _1047 = _1045 + 1.0;
    float _1049 = _975;
    float _1051 = _1047;
    if (!_979)
    {
        _1039 = _955;
    }
    float _1053 = _1039;
    float _1055 = -_122;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1033);
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1061 = _1053;
    if (_979)
    {
        _1061 = _947;
    }
    float _1063 = _1061;
    out.m_61.y = _975;
    bool _1065 = _1001 > 0.5;
    bool _1067 = _1065 && _959;
    float _1069 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[20].x, _967);
    float _1071 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1059);
    int _1073 = _1029 ? as_type<int>(_1047) : as_type<int>(_975);
    float _1075 = _961 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1077 = _995 ? as_type<float>(_1073) : _975;
    float _1079 = fma(_1075, _1021, -0.5);
    float _1081 = floor(_1069);
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1085 = _973 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1087 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1071);
    bool _1089 = _955 > 0.5;
    float _1091 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1083);
    float _1093 = fma(_1077, _1085, -0.5);
    float _1095 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1097 = _1075;
    float _1099 = _1043;
    if (!_979)
    {
        _1097 = _1043;
    }
    float _1101 = _1097;
    float _1103 = _1101;
    if (_979)
    {
        _1103 = _955;
    }
    float _1105 = _1103;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_979)
    {
        _1099 = _955;
    }
    float _1109 = _1099;
    float _1111 = fma(_1087, _1079, _1057);
    if (_1005)
    {
        float _1113 = _1089 ? _1047 : _975;
        _1049 = _1113;
    }
    float _1115 = _1049;
    float _1117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_959)
    {
        _1051 = _941;
    }
    float _1119 = _1051;
    float _1121 = _1119;
    if (_1067)
    {
        float _1123 = -_941;
        float _1125 = _1123 + 1.0;
        _985 = _1125;
    }
    float _1127 = _985;
    float _1129 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1107);
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_959)
    {
        _1121 = _1127;
    }
    float _1133 = _1121;
    float _1135 = -_1081;
    float _1137 = _1069 + _1135;
    float _1139 = _1069 * 6.283185482025146484375;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1143 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1145 = abs(_472);
    float _1147 = _1139 * 0.15915493667125701904296875;
    float _1149 = -_1141;
    float _1151 = fma(_1095, 2.0, _1149);
    float _1153 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1131);
    float _1155 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1159 = fma(_1143, _1115, -0.5);
    float _1161 = _1147 * 6.283185482025146484375;
    float _1163 = cos(_1161);
    float _1165 = fma(_1155, _1133, -0.5);
    float _1167 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1169 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1091);
    float _1171 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1035);
    float _1173 = fma(_1167, -2.0, _1157);
    int _1175 = abs(_468);
    float _1177 = -_1171;
    float _1179 = fma(_1169, _1159, _1177);
    float _1181 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1129);
    float _1183 = -_122;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1151);
    float _1187 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1153);
    float _1189 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1173);
    float _1191 = -_1137;
    float _1193 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _1195 = _1137 < 0.5;
    float _1197 = float(_1195);
    float _1199 = _810 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1201 = fma(_1163, 0.5, 0.5);
    bool _1203 = !_971;
    int _1205 = _1203 ? 0 : 1;
    float _1207 = fma(_1181, _1165, _1185);
    float _1209 = float(_1175);
    float _1211 = -_1201;
    float _1213 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1215 = exp2(_1199);
    int _1217 = abs(_1205);
    float _1219 = -_1197;
    float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1223 = abs(_1193);
    float _1225 = _1209 * _1223;
    float _1227 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[6].z, _965);
    float _1229 = float(_1217);
    float _1231 = _1179 + 0.5;
    float _1233 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1227);
    bool _1235 = _604 > 0.0;
    bool _1237 = isnan(_604);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan(0.0);
    bool _1243 = _1239 || _1241;
    float _1245 = fma(_1229, _1213, _1225);
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1249 = _1111 + 0.5;
    float _1251 = -_1189;
    float _1253 = fma(_1187, _1093, _1251);
    float _1255 = float(_1145);
    float _1257 = -_1215;
    float _1259 = _1257 + 1.0;
    out.m_63.w = _1247;
    float _1261 = _1207 + 0.5;
    float _1263 = _1253 + 0.5;
    float _1265 = _1259 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1267 = abs(_1221);
    float _1269 = fma(_1255, _1267, _1245);
    out.gl_Position.x = _884;
    out.gl_Position.y = _894;
    out.gl_Position.z = _1233;
    out.gl_Position.w = _858;
    float _1271 = _1269 * _604;
    float _1273 = _1233 + _858;
    out.m_65.x = _1249;
    out.m_65.y = _1231;
    out.m_65.z = _1261;
    out.m_65.w = _1263;
    float _1275 = _1273 * 0.5;
    float _1277 = _1271 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.z = _1275;
    out.m_67.w = _858;
    out.m_45.x = _1277;
    float _1279 = _1265 * _914;
    float _1281 = -_1265;
    float _1283 = _1281 + 1.0;
    float _1285 = _925 * _1279;
    float _1287 = _939 * _1279;
    float _1289 = fma(_935, _1285, _919);
    float _1291 = fma(_937, _1285, _921);
    float _1293 = _925 * _1283;
    float _1295 = fma(_925, _1287, _923);
    out.m_69.x = _1289;
    out.m_69.y = _1291;
    out.m_69.z = _1295;
    out.m_69.w = _1293;
    if (_1243)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1297 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1297;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    float _96 = as_type<float>(_88);
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _94;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1354 = as_type<float>(_104);
        out.gl_Position.z = _1354;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _96 = _124;
    }
    float _126 = _96;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1423 = as_type<float>(_140);
        out.gl_Position.z = _1423;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_49.x;
    float _144 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _146 = in.m_51.x;
    float _148 = in.m_51.y;
    float _150 = in.m_51.z;
    float _152 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _144);
    float _154 = in.m_53.x;
    float _156 = in.m_53.y;
    float _158 = in.m_53.z;
    float _160 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _152);
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = sqrt(_160);
    float _174 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _176 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _174);
    float _178 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[193].x, -1.0);
    float _180 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _176);
    float _182 = fma(_178, _142, 1.0);
    float _184 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _186 = rsqrt(_180);
    float _188 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _190 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _192 = _172 * _154;
    float _194 = _156 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _196 = in.m_47.x;
    float _198 = in.m_47.y;
    float _200 = in.m_47.z;
    float _202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _154);
    float _204 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.033333338797092437744140625, _192);
    float _206 = _194 * _182;
    float _208 = in.m_51.w;
    float _210 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _212 = _204 * 0.15915493667125701904296875;
    float _214 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _216 = in.m_42.x;
    float _218 = in.m_42.y;
    float _220 = in.m_42.z;
    float _222 = _188 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _206);
    float _226 = _184;
    float _228 = _214;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_170)
    {
        float _232 = _214 * _214;
        float _234 = _232 * 0.5;
        _226 = _234;
    }
    float _236 = _226;
    float _238 = _212 * 6.283185482025146484375;
    float _240 = sin(_238);
    float _242 = _210 * _202;
    float _244 = _222 * _224;
    float _246 = _236;
    if (!_170)
    {
        float _248 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _246 = _248;
    }
    float _250 = _246;
    bool _252 = !_170;
    float _254 = _250;
    if (!_252)
    {
        float _256 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = log2(_256);
        float _260 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _262 = _260 + 1.0;
        float _264 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = _214 * _258;
        float _268 = 1.0 / _262;
        float _270 = _264 * 0.693147182464599609375;
        float _272 = exp2(_266);
        float _274 = 1.0 / _270;
        float _276 = _272 + (-1.0);
        float _278 = -_276;
        float _280 = fma(_278, _274, _214);
        float _282 = _280 * _268;
        float _284 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _254 = _284;
    }
    float _286 = _254;
    bool _288 = !_170;
    if (!_288)
    {
        float _290 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = log2(_290);
        float _294 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _296 = _294 + 1.0;
        float _298 = 1.0 / _296;
        float _300 = _214 * _292;
        float _302 = exp2(_300);
        float _304 = -_302;
        float _306 = _304 + 1.0;
        float _308 = _306 * _298;
        _228 = _308;
        _230 = _298;
    }
    float _310 = _228;
    float _312 = _230;
    float _314 = _240 + _158;
    float _316 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _318 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _320 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _322 = _190 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _324 = fma(_310, _198, _316);
    float _326 = fma(_310, _196, _318);
    float _328 = _314 * _186;
    float _330 = _328 * 0.125;
    float _332 = fma(_310, _200, _320);
    float _334 = fma(_324, _208, _218);
    float _336 = fma(_326, _208, _216);
    float _338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _330);
    float _340 = fma(_332, _208, _220);
    float _342 = _334 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _344 = _334 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _346 = _322 * _338;
    float _348 = _244 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _350 = _244 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _352 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[6].x, _342);
    float _354 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[4].x, _344);
    float _356 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[8].x, _348);
    float _358 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[10].x, _350);
    float _360 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[6].z, _352);
    float _362 = _334 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _364 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[4].z, _354);
    float _366 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[10].z, _358);
    float _368 = _360 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _370 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[5].x, _362);
    float _372 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[8].z, _356);
    float _374 = _364 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _376 = _368 + _366;
    float _378 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[5].z, _370);
    float _380 = _244 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _382 = _374 + _372;
    float _384 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _386 = _376 + _384;
    float _388 = _378 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _390 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _392 = isnan(0.5);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _398 = _394 || _396;
    float _400 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _402 = _382 + _400;
    float _404 = _386 * _386;
    float _406 = _388 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _408 = fma(_242, (*spvDescriptorSet0.vp_c10)._m0[9].x, _380);
    float _410 = fma(_402, _402, _404);
    float _412 = fma(_374, (*spvDescriptorSet0.vp_c8)._m0[11].x, _406);
    float _414 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[9].z, _408);
    float _416 = sqrt(_410);
    float _418 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[11].z, _412);
    float _420 = _388 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _422 = _388 + _414;
    float _424 = _318;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    float _428 = _414;
    float _430 = _422;
    float _432 = _376;
    float _434 = _382;
    float _436 = _312;
    if (_398)
    {
        _424 = 1.0;
    }
    float _438 = _424;
    float _440 = _418 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _442 = fma(_374, (*spvDescriptorSet0.vp_c8)._m0[10].x, _420);
    float _444 = 1.0 / _440;
    float _446 = fma(_368, (*spvDescriptorSet0.vp_c8)._m0[10].z, _442);
    float _448 = _446 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _450 = _416 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _452 = _448 + _440;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _456 = _454 != 0;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _460 = _458 != 0;
    float _462 = _452 * _444;
    float _464 = _462 * 0.5;
    bool _466 = !_456;
    int _468 = _466 ? 0 : 1;
    bool _470 = !_460;
    int _472 = _470 ? 0 : 1;
    float _474 = _452;
    float _476 = _438;
    bool _478 = false;
    if (!_450)
    {
        _426 = _382;
    }
    float _480 = _426;
    float _482 = _480;
    if (!_450)
    {
        _474 = _376;
    }
    float _484 = _474;
    float _486 = _484;
    if (!_450)
    {
        _428 = _422;
    }
    float _488 = _428;
    bool _490 = !_450;
    float _492 = _488;
    if (!_490)
    {
        float _494 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _496 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _498 = _416 + _496;
        float _500 = _422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _502 = rsqrt(_410);
        float _504 = _498 * _494;
        float _506 = _504 * 0.15915493667125701904296875;
        float _508 = _506 * 6.283185482025146484375;
        float _510 = cos(_508);
        float _512 = _506 * 6.283185482025146484375;
        float _514 = sin(_512);
        float _516 = _510 + (-1.0);
        float _518 = _516 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _520 = fma(_514, _500, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _522 = fma(_422, _510, _518);
        float _524 = _502 * _520;
        float _526 = fma(_402, _524, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _528 = fma(_386, _524, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _492 = _522;
        _482 = _526;
        _486 = _528;
    }
    float _530 = _492;
    float _532 = _482;
    float _534 = _486;
    if (!_398)
    {
        float _536 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _538 = _536 * 0.15915493667125701904296875;
        float _540 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _542 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _544 = fma(_464, (*spvDescriptorSet0.vp_c8)._m0[30].w, _542);
        float _546 = _538 * 6.283185482025146484375;
        float _548 = cos(_546);
        float _550 = _540 * 0.15915493667125701904296875;
        float _552 = _538 * 6.283185482025146484375;
        float _554 = sin(_552);
        float _556 = 1.0 / _548;
        float _558 = _550 * 6.283185482025146484375;
        float _560 = cos(_558);
        float _562 = _554 * _556;
        float _564 = _550 * 6.283185482025146484375;
        float _566 = sin(_564);
        float _568 = _560 * _562;
        float _570 = 1.0 / _544;
        float _572 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _574 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _572;
        float _576 = 1.0 / _568;
        float _578 = 1.0 / _574;
        float _580 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _582 = _570 * _580;
        float _584 = _566 * _576;
        float _586 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _588 = fma(_584, _582, _586);
        float _590 = _588 * _578;
        float _592 = precise::clamp(_590, 0.0, 1.0);
        float _594 = -_592;
        float _596 = _594 + 1.0;
        _430 = _578;
        _432 = _550;
        _434 = _570;
        _476 = _596;
    }
    float _598 = _430;
    float _600 = _432;
    float _602 = _434;
    float _604 = _476;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _608 = _530 + _606;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _532 + _610;
    float _614 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _616 = _534 + _614;
    float _618 = _608 * _608;
    float _620 = fma(_612, _612, _618);
    float _622 = fma(_616, _616, _620);
    float _624 = rsqrt(_622);
    float _626 = _624 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _628 = _612 * _626;
    float _630 = _616 * _626;
    float _632 = _628 * _628;
    float _634 = _630 * _630;
    float _636 = _632 + _634;
    float _638 = sqrt(_636);
    bool _640 = _638 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _642 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _644 = _638 + _642;
    float _646 = _598;
    float _648 = _644;
    float _650 = _600;
    float _652 = _608;
    float _654 = _628;
    if (_640)
    {
        float _656 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _646 = _656;
    }
    float _658 = _646;
    float _660 = _658;
    if (_640)
    {
        float _662 = _644 * _658;
        _648 = _662;
    }
    float _664 = _648;
    if (_640)
    {
        float _666 = rsqrt(_636);
        _660 = _666;
    }
    float _668 = _660;
    float _670 = _668;
    if (_640)
    {
        float _672 = _664 * 0.15915493667125701904296875;
        _650 = _672;
    }
    float _674 = _650;
    float _676 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _678 = _616;
    if (_640)
    {
        float _680 = _674 * 6.283185482025146484375;
        float _682 = sin(_680);
        _678 = _682;
    }
    float _684 = _678;
    float _686 = precise::max(0.0, _676);
    float _688 = _602;
    float _690 = _686;
    if (_640)
    {
        float _692 = _674 * 6.283185482025146484375;
        float _694 = cos(_692);
        _688 = _694;
    }
    float _696 = _688;
    float _698 = -_626;
    float _700 = -_686;
    float _702 = fma(_608, _698, _700);
    if (_640)
    {
        float _704 = _702 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _652 = _704;
    }
    float _706 = _652;
    float _708 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _710 = sqrt(_622);
    float _712 = _684;
    float _714 = _706;
    if (_640)
    {
        float _716 = fma(_684, _706, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _712 = _716;
    }
    float _718 = _712;
    float _720 = _718;
    if (!_640)
    {
        _714 = _702;
    }
    float _722 = _714;
    float _724 = _722;
    if (_640)
    {
        float _726 = _668 * _718;
        _436 = _726;
    }
    float _728 = _436;
    if (!_640)
    {
        _720 = _632;
    }
    float _730 = _720;
    float _732 = _530 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _734 = _730;
    float _736 = _696;
    if (_640)
    {
        float _738 = _696 + (-1.0);
        _690 = _738;
    }
    float _740 = _690;
    float _742 = _740;
    if (_640)
    {
        float _744 = _628 * _728;
        _654 = _744;
    }
    float _746 = _654;
    float _748 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[3].x, _732);
    if (_640)
    {
        float _750 = _740 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _670 = _750;
    }
    float _752 = _670;
    if (!_640)
    {
        _742 = _630;
    }
    float _754 = _742;
    float _756 = _754;
    if (_640)
    {
        float _758 = _630 * _728;
        _756 = _758;
    }
    float _760 = _756;
    if (_640)
    {
        float _762 = _746 * _746;
        _734 = _762;
    }
    float _764 = _734;
    if (_640)
    {
        float _766 = fma(_702, _696, _752);
        _724 = _766;
    }
    float _768 = _724;
    if (!_640)
    {
        _736 = _634;
    }
    float _770 = _736;
    float _772 = _770;
    if (_640)
    {
        float _774 = _760 * _760;
        _772 = _774;
    }
    float _776 = _772;
    float _778 = fma(_768, _768, _764);
    float _780 = _778 + _776;
    float _782 = _530 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _784 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _786 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[23].w, _784);
    float _788 = precise::clamp(_786, 0.0, 1.0);
    float _790 = _530 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _792 = rsqrt(_780);
    float _794 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[2].x, _782);
    float _796 = -_788;
    float _798 = _796 + 1.0;
    float _800 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[1].x, _790);
    float _802 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[2].z, _794);
    float _804 = _530 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _806 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[1].z, _800);
    float _808 = abs(_798);
    float _810 = log2(_808);
    float _812 = _802 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _814 = fma(_532, (*spvDescriptorSet0.vp_c8)._m0[0].x, _804);
    float _816 = _806 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _818 = _812 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _820 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[0].z, _814);
    float _822 = _816 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _824 = _792 * _746;
    float _826 = -_818;
    float _828 = fma(_826, _708, 1.0);
    float _830 = _820 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _832 = _792 * _768;
    float _834 = _824 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _836 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[3].z, _748);
    float _838 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[7].x, _822);
    float _840 = _792 * _760;
    float _842 = -_834;
    float _844 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[21].y, _842);
    float _846 = _836 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _848 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[7].z, _838);
    float _850 = log2(_828);
    float _852 = -_840;
    float _854 = fma(_852, (*spvDescriptorSet0.vp_c15)._m0[21].z, _844);
    float _856 = _810 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _858 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[7].w, _848);
    float _860 = _816 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _862 = fma(_854, -0.5, 0.5);
    float _864 = _816 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _866 = fma(_854, 0.5, 0.5);
    float _868 = 1.0 / _858;
    float _870 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[4].x, _860);
    float _872 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[5].x, _864);
    float _874 = fma(_866, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _876 = _832 + 1.0;
    float _878 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[4].z, _870);
    float _880 = fma(_866, _874, -0.212114393711090087890625);
    float _882 = exp2(_856);
    float _884 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[4].w, _878);
    float _886 = fma(_866, _880, 1.570728778839111328125);
    float _888 = sqrt(_862);
    float _890 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[5].z, _872);
    float _892 = _884 * _868;
    float _894 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[5].w, _890);
    float _896 = _850 * 0.693147182464599609375;
    float _898 = fma(_892, 0.5, 0.5);
    float _900 = -_832;
    float _902 = fma(_882, _876, _900);
    float _904 = _894 * _868;
    float _906 = _896 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _908 = fma(_902, 0.5, 0.5);
    float _910 = fma(_904, -0.5, 0.5);
    float _912 = _888 * 0.636619746685028076171875;
    float3 _2679 = float3(_898, _910, _906);
    float _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2679, float3(0.0), isnan(_2679)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2679, float3(0.0), isnan(_2679)), level(0.0)).x;
    float3 _2690 = float3(_898, _910, _906);
    float4 _917 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2690, float3(0.0), isnan(_2690)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2690, float3(0.0), isnan(_2690)), level(0.0)).xyzw;
    float _919 = _917.x;
    float _921 = _917.y;
    float _923 = _917.z;
    float _925 = _917.w;
    float _927 = -_886;
    float _929 = fma(_912, _927, 1.0);
    float2 _2712 = float2(_929, _908);
    float3 _933 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2712, float2(0.0), isnan(_2712)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2712, float2(0.0), isnan(_2712)), level(0.0)).xyz;
    float _935 = _933.x;
    float _937 = _933.y;
    float _939 = _933.z;
    float _941 = in.m_55.x;
    float _943 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _945 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _947 = in.m_57.x;
    float _949 = _816 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _953 = _951 != 0;
    float _955 = in.m_57.y;
    int _957 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _959 = _957 != 0;
    float _961 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _963 = in.m_57.w;
    float _965 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[6].x, _949);
    out.m_59.x = _532;
    out.m_59.y = _530;
    out.m_59.z = _534;
    float _967 = _945 * _943;
    int _969 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _971 = _969 != 0;
    float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _975 = in.m_55.y;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _979 = _977 != 0;
    int _981 = 1;
    float _983 = _943;
    float _985 = _941;
    if (_953)
    {
        float _987 = -_941;
        float _989 = _987 + 1.0;
        _981 = as_type<int>(_989);
    }
    int _991 = _981;
    int _993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _995 = _993 != 0;
    float _997 = 0.0;
    if (_959)
    {
        float _999 = in.m_57.z;
        _997 = _999;
    }
    float _1001 = _997;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1005 = _1003 != 0;
    float _1007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_953)
    {
        bool _1009 = _947 > 0.5;
        _478 = _1009;
    }
    bool _1011 = _478;
    out.m_61.x = _941;
    float _1013 = _955 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_953)
    {
        _983 = _941;
    }
    float _1015 = _983;
    float _1017 = _1015;
    if (_953)
    {
        float _1019 = _1011 ? as_type<float>(_991) : _941;
        _1017 = _1019;
    }
    float _1021 = _1017;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1025 = _947 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1029 = _963 > 0.5;
    float _1031 = -_1023;
    float _1033 = fma(_1025, 2.0, _1031);
    float _1035 = fma(_1013, -2.0, _1027);
    float _1037 = _1027;
    float _1039 = _1025;
    if (!_979)
    {
        float _1041 = in.m_57.z;
        _1037 = _1041;
    }
    float _1043 = _1037;
    float _1045 = -_975;
    float _1047 = _1045 + 1.0;
    float _1049 = _975;
    float _1051 = _1047;
    if (!_979)
    {
        _1039 = _955;
    }
    float _1053 = _1039;
    float _1055 = -_122;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1033);
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1061 = _1053;
    if (_979)
    {
        _1061 = _947;
    }
    float _1063 = _1061;
    out.m_61.y = _975;
    bool _1065 = _1001 > 0.5;
    bool _1067 = _1065 && _959;
    float _1069 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[20].x, _967);
    float _1071 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1059);
    int _1073 = _1029 ? as_type<int>(_1047) : as_type<int>(_975);
    float _1075 = _961 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1077 = _995 ? as_type<float>(_1073) : _975;
    float _1079 = fma(_1075, _1021, -0.5);
    float _1081 = floor(_1069);
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1085 = _973 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1087 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1071);
    bool _1089 = _955 > 0.5;
    float _1091 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1083);
    float _1093 = fma(_1077, _1085, -0.5);
    float _1095 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1097 = _1075;
    float _1099 = _1043;
    if (!_979)
    {
        _1097 = _1043;
    }
    float _1101 = _1097;
    float _1103 = _1101;
    if (_979)
    {
        _1103 = _955;
    }
    float _1105 = _1103;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_979)
    {
        _1099 = _955;
    }
    float _1109 = _1099;
    float _1111 = fma(_1087, _1079, _1057);
    if (_1005)
    {
        float _1113 = _1089 ? _1047 : _975;
        _1049 = _1113;
    }
    float _1115 = _1049;
    float _1117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_959)
    {
        _1051 = _941;
    }
    float _1119 = _1051;
    float _1121 = _1119;
    if (_1067)
    {
        float _1123 = -_941;
        float _1125 = _1123 + 1.0;
        _985 = _1125;
    }
    float _1127 = _985;
    float _1129 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1107);
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_959)
    {
        _1121 = _1127;
    }
    float _1133 = _1121;
    float _1135 = -_1081;
    float _1137 = _1069 + _1135;
    float _1139 = _1069 * 6.283185482025146484375;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1143 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1145 = abs(_472);
    float _1147 = _1139 * 0.15915493667125701904296875;
    float _1149 = -_1141;
    float _1151 = fma(_1095, 2.0, _1149);
    float _1153 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1131);
    float _1155 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1159 = fma(_1143, _1115, -0.5);
    float _1161 = _1147 * 6.283185482025146484375;
    float _1163 = cos(_1161);
    float _1165 = fma(_1155, _1133, -0.5);
    float _1167 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1169 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1091);
    float _1171 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1035);
    float _1173 = fma(_1167, -2.0, _1157);
    int _1175 = abs(_468);
    float _1177 = -_1171;
    float _1179 = fma(_1169, _1159, _1177);
    float _1181 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1129);
    float _1183 = -_122;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1151);
    float _1187 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1153);
    float _1189 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1173);
    float _1191 = -_1137;
    float _1193 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _1195 = _1137 < 0.5;
    float _1197 = float(_1195);
    float _1199 = _810 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1201 = fma(_1163, 0.5, 0.5);
    bool _1203 = !_971;
    int _1205 = _1203 ? 0 : 1;
    float _1207 = fma(_1181, _1165, _1185);
    float _1209 = float(_1175);
    float _1211 = -_1201;
    float _1213 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1215 = exp2(_1199);
    int _1217 = abs(_1205);
    float _1219 = -_1197;
    float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1223 = abs(_1193);
    float _1225 = _1209 * _1223;
    float _1227 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[6].z, _965);
    float _1229 = float(_1217);
    float _1231 = _1179 + 0.5;
    float _1233 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1227);
    bool _1235 = _604 > 0.0;
    bool _1237 = isnan(_604);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan(0.0);
    bool _1243 = _1239 || _1241;
    float _1245 = fma(_1229, _1213, _1225);
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1249 = _1111 + 0.5;
    float _1251 = -_1189;
    float _1253 = fma(_1187, _1093, _1251);
    float _1255 = float(_1145);
    float _1257 = -_1215;
    float _1259 = _1257 + 1.0;
    out.m_63.w = _1247;
    float _1261 = _1207 + 0.5;
    float _1263 = _1253 + 0.5;
    float _1265 = _1259 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1267 = abs(_1221);
    float _1269 = fma(_1255, _1267, _1245);
    out.gl_Position.x = _884;
    out.gl_Position.y = _894;
    out.gl_Position.z = _1233;
    out.gl_Position.w = _858;
    float _1271 = _1269 * _604;
    float _1273 = _1233 + _858;
    out.m_65.x = _1249;
    out.m_65.y = _1231;
    out.m_65.z = _1261;
    out.m_65.w = _1263;
    float _1275 = _1273 * 0.5;
    float _1277 = _1271 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.z = _1275;
    out.m_67.w = _858;
    out.m_45.x = _1277;
    float _1279 = _1265 * _914;
    float _1281 = -_1265;
    float _1283 = _1281 + 1.0;
    float _1285 = _925 * _1279;
    float _1287 = _939 * _1279;
    float _1289 = fma(_935, _1285, _919);
    float _1291 = fma(_937, _1285, _921);
    float _1293 = _925 * _1283;
    float _1295 = fma(_925, _1287, _923);
    out.m_69.x = _1289;
    out.m_69.y = _1291;
    out.m_69.z = _1295;
    out.m_69.w = _1293;
    if (_1243)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1297 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1297;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

