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
    float4 m_67 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_49 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_69 [[user(locn11)]];
    float4 m_83 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = in.m_44.w;
    float _101 = trunc(_97);
    int _104 = int(_101);
    float _106 = -_99;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _108;
    bool _112 = _104 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1278 = as_type<float>(_122);
        out.gl_Position.z = _1278;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _126 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_99);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = float(_104);
    bool _138 = _108 >= _136;
    bool _140 = !_134;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_49.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _124 = as_type<int>(_148);
    }
    int _150 = _124;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1334 = as_type<float>(_150);
        out.gl_Position.z = _1334;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_51.w;
    float _154 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _156 = in.m_44.x;
    float _158 = in.m_44.y;
    float _160 = in.m_44.z;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_42.x;
    float _174 = in.m_42.y;
    float _176 = in.m_42.z;
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    float _184 = in.m_51.x;
    float _186 = in.m_51.y;
    float _188 = in.m_51.z;
    float _190 = 0.0;
    float _192 = _154;
    if (!_170)
    {
        float _194 = _154 * _154;
        float _196 = _194 * 0.5;
        _190 = _196;
    }
    float _198 = _190;
    float _200 = _198;
    if (!_170)
    {
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    bool _206 = !_170;
    float _208 = _204;
    float _210 = _178;
    if (!_206)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _154 * _214;
        float _224 = exp2(_222);
        float _226 = _220 * 0.693147182464599609375;
        float _228 = 1.0 / _226;
        float _230 = 1.0 / _218;
        float _232 = _224 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _228, _154);
        float _238 = _236 * _230;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _240;
    }
    float _242 = _208;
    bool _244 = !_170;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _154 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _192 = _264;
    }
    float _266 = _192;
    float _268 = _184 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = _186 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _180);
    float _274 = _188 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _276 = _268 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _278 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _270 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _282 = _274 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _284 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _178);
    float _286 = fma(_266, _158, _278);
    float _288 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _290 = _280 * _272;
    float _292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _182);
    float _294 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _296 = fma(_266, _156, _288);
    float _298 = fma(_286, _152, _174);
    float _300 = _282 * _292;
    float _302 = fma(_266, _160, _294);
    float _304 = fma(_296, _152, _172);
    float _306 = _298 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _308 = _276 * _284;
    float _310 = fma(_302, _152, _176);
    float _312 = _290 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _314 = _298 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _316 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[6].x, _306);
    float _318 = _290 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _320 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[10].x, _312);
    float _322 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[4].x, _314);
    float _324 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[6].z, _316);
    float _326 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[8].x, _318);
    float _328 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[10].z, _320);
    float _330 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[4].z, _322);
    float _332 = _324 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _334 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[8].z, _326);
    float _336 = _330 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _338 = _332 + _328;
    float _340 = _290 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _342 = _336 + _334;
    float _344 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _346 = _338 + _344;
    float _348 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[9].x, _340);
    float _350 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _352 = _342 + _350;
    float _354 = _346 * _346;
    float _356 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[9].z, _348);
    float _358 = fma(_352, _352, _354);
    float _360 = _298 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _362 = sqrt(_358);
    float _364 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[5].x, _360);
    float _366 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[5].z, _364);
    float _368 = _366 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _370 = _368 + _356;
    bool _372 = _362 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _374 = _334;
    float _376 = _342;
    float _378 = _338;
    float _380 = _300;
    if (!_372)
    {
        _374 = _370;
    }
    float _382 = _374;
    bool _384 = !_372;
    float _386 = _382;
    if (!_384)
    {
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _390 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _392 = _362 + _390;
        float _394 = rsqrt(_358);
        float _396 = _392 * _388;
        float _398 = _370 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _400 = _396 * 0.15915493667125701904296875;
        float _402 = _400 * 6.283185482025146484375;
        float _404 = cos(_402);
        float _406 = _400 * 6.283185482025146484375;
        float _408 = sin(_406);
        float _410 = _404 + (-1.0);
        float _412 = _410 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _414 = fma(_408, _398, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _416 = fma(_370, _404, _412);
        float _418 = _394 * _414;
        float _420 = fma(_352, _418, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _422 = fma(_346, _418, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _386 = _416;
        _376 = _420;
        _378 = _422;
    }
    float _424 = _386;
    float _426 = _376;
    float _428 = _378;
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _432 = _424 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _436 = _426 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _440 = _428 + _438;
    float _442 = _432 * _432;
    float _444 = fma(_436, _436, _442);
    float _446 = fma(_440, _440, _444);
    float _448 = rsqrt(_446);
    float _450 = sqrt(_446);
    float _452 = _448 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _454 = _436 * _452;
    float _456 = _440 * _452;
    float _458 = _454 * _454;
    float _460 = _456 * _456;
    float _462 = _458 + _460;
    float _464 = sqrt(_462);
    bool _466 = _464 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _468 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _470 = _464 + _468;
    float _472 = _444;
    float _474 = _462;
    float _476 = _470;
    float _478 = _454;
    if (_466)
    {
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _472 = _480;
    }
    float _482 = _472;
    if (_466)
    {
        float _484 = rsqrt(_462);
        _474 = _484;
    }
    float _486 = _474;
    float _488 = _486;
    if (_466)
    {
        float _490 = _470 * _482;
        _476 = _490;
    }
    float _492 = _476;
    if (_466)
    {
        float _494 = _492 * 0.15915493667125701904296875;
        _380 = _494;
    }
    float _496 = _380;
    float _498 = _482;
    float _500 = _496;
    if (_466)
    {
        float _502 = _496 * 6.283185482025146484375;
        float _504 = sin(_502);
        _498 = _504;
    }
    float _506 = _498;
    float _508 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _510 = precise::max(0.0, _508);
    float _512 = _310;
    float _514 = _510;
    if (_466)
    {
        float _516 = _496 * 6.283185482025146484375;
        float _518 = cos(_516);
        _512 = _518;
    }
    float _520 = _512;
    float _522 = -_452;
    float _524 = -_510;
    float _526 = fma(_432, _522, _524);
    if (_466)
    {
        float _528 = _526 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _514 = _528;
    }
    float _530 = _514;
    float _532 = _506;
    float _534 = _530;
    if (_466)
    {
        float _536 = fma(_506, _530, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _532 = _536;
    }
    float _538 = _532;
    float _540 = _538;
    float _542 = _520;
    if (_466)
    {
        float _544 = _520 + (-1.0);
        _534 = _544;
    }
    float _546 = _534;
    float _548 = 0.0;
    float _550 = _546;
    if (_466)
    {
        float _552 = _486 * _538;
        _548 = _552;
    }
    float _554 = _548;
    if (!_466)
    {
        _540 = _526;
    }
    float _556 = _540;
    float _558 = _556;
    if (_466)
    {
        float _560 = _546 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _500 = _560;
    }
    float _562 = _500;
    if (_466)
    {
        float _564 = _454 * _554;
        _478 = _564;
    }
    float _566 = _478;
    if (!_466)
    {
        _550 = _456;
    }
    float _568 = _550;
    float _570 = _568;
    if (_466)
    {
        float _572 = _456 * _554;
        _570 = _572;
    }
    float _574 = _570;
    if (!_466)
    {
        _488 = _458;
    }
    float _576 = _488;
    float _578 = _576;
    if (_466)
    {
        float _580 = fma(_526, _520, _562);
        _558 = _580;
    }
    float _582 = _558;
    if (_466)
    {
        float _584 = _566 * _566;
        _578 = _584;
    }
    float _586 = _578;
    if (!_466)
    {
        _542 = _460;
    }
    float _588 = _542;
    float _590 = _588;
    if (_466)
    {
        float _592 = _574 * _574;
        _590 = _592;
    }
    float _594 = _590;
    float _596 = fma(_582, _582, _586);
    float _598 = _424 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _600 = _596 + _594;
    float _602 = _424 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _604 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _606 = fma(_450, (*spvDescriptorSet0.vp_c15)._m0[23].w, _604);
    float _608 = precise::clamp(_606, 0.0, 1.0);
    float _610 = _424 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _612 = rsqrt(_600);
    float _614 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[2].x, _602);
    float _616 = -_608;
    float _618 = _616 + 1.0;
    float _620 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[1].x, _610);
    float _622 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _624 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[2].z, _614);
    float _626 = _424 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _628 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[1].z, _620);
    float _630 = abs(_618);
    float _632 = log2(_630);
    float _634 = _624 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _636 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[0].x, _626);
    float _638 = _628 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _640 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[3].x, _598);
    float _642 = _634 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _644 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[0].z, _636);
    float _646 = _612 * _566;
    float _648 = _612 * _582;
    float _650 = _644 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _652 = _638 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _654 = _646 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _656 = -_642;
    float _658 = fma(_656, _622, 1.0);
    float _660 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[3].z, _640);
    float _662 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[7].x, _652);
    float _664 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _666 = _612 * _574;
    float _668 = -_654;
    float _670 = fma(_648, (*spvDescriptorSet0.vp_c15)._m0[21].y, _668);
    float _672 = _660 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _674 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[7].z, _662);
    float _676 = exp2(_664);
    float _678 = -_666;
    float _680 = fma(_678, (*spvDescriptorSet0.vp_c15)._m0[21].z, _670);
    float _682 = _638 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _684 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[7].w, _674);
    float _686 = _638 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _688 = fma(_680, -0.5, 0.5);
    float _690 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[4].x, _682);
    float _692 = fma(_680, 0.5, 0.5);
    float _694 = log2(_658);
    float _696 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[5].x, _686);
    float _698 = _648 + 1.0;
    float _700 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[4].z, _690);
    float _702 = fma(_692, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _704 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[5].z, _696);
    float _706 = 1.0 / _684;
    float _708 = -_648;
    float _710 = fma(_676, _698, _708);
    float _712 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[4].w, _700);
    float _714 = fma(_692, _702, -0.212114393711090087890625);
    float _716 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[5].w, _704);
    float _718 = fma(_710, 0.5, 0.5);
    float _720 = fma(_692, _714, 1.570728778839111328125);
    float _722 = sqrt(_688);
    float _724 = _694 * 0.693147182464599609375;
    float _726 = _724 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _728 = _716 * _706;
    float _730 = _712 * _706;
    float _732 = fma(_728, -0.5, 0.5);
    float _734 = fma(_730, 0.5, 0.5);
    float _736 = _722 * 0.636619746685028076171875;
    float3 _2307 = float3(_734, _732, _726);
    float _738 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2307, float3(0.0), isnan(_2307)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2307, float3(0.0), isnan(_2307)), level(0.0)).x;
    float3 _2318 = float3(_734, _732, _726);
    float4 _741 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2318, float3(0.0), isnan(_2318)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2318, float3(0.0), isnan(_2318)), level(0.0)).xyzw;
    float _743 = _741.x;
    float _745 = _741.y;
    float _747 = _741.z;
    float _749 = _741.w;
    float _751 = -_720;
    float _753 = fma(_736, _751, 1.0);
    float2 _2340 = float2(_753, _718);
    float3 _757 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2340, float2(0.0), isnan(_2340)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2340, float2(0.0), isnan(_2340)), level(0.0)).xyz;
    float _759 = _757.x;
    float _761 = _757.y;
    float _763 = _757.z;
    float _765 = in.m_55.x;
    float _767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _769 = in.m_57.x;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _773 = _771 != 0;
    float _775 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _779 = _777 != 0;
    float _781 = in.m_55.y;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _785 = _783 != 0;
    float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _791 = in.m_57.y;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _795 = _793 != 0;
    float _797 = _638 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _799 = in.m_57.w;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _803 = _801 != 0;
    float _805 = _767 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _809 = in.m_57.z;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _813 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[6].x, _797);
    int _815 = as_type<int>(_732);
    float _817 = _734;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _821 = _765;
    if (_773)
    {
        float _823 = -_765;
        float _825 = _823 + 1.0;
        _815 = as_type<int>(_825);
    }
    int _827 = _815;
    if (!_773)
    {
        _817 = _765;
    }
    float _829 = _817;
    int _831 = 0;
    float _833 = _829;
    if (_779)
    {
        float _835 = -_765;
        float _837 = _835 + 1.0;
        _831 = as_type<int>(_837);
    }
    int _839 = _831;
    float _841 = _787 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _843 = false;
    if (_773)
    {
        bool _845 = _769 > 0.5;
        _843 = _845;
    }
    bool _847 = _843;
    float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_59.x = _765;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_773)
    {
        float _853 = _847 ? as_type<float>(_827) : _765;
        _833 = _853;
    }
    float _855 = _833;
    float _857 = -_781;
    float _859 = _857 + 1.0;
    out.m_59.y = _781;
    bool _861 = _791 > 0.5;
    float _863 = fma(_805, _855, -0.5);
    float _865 = _791 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _869 = _867 != 0;
    float _871 = exp2(_775);
    bool _873 = _799 > 0.5;
    float _875 = fma(_865, -2.0, _811);
    int _877 = _861 ? as_type<int>(_859) : as_type<int>(_781);
    float _879 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[6].z, _813);
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _883 = _881 != 0;
    float _885 = _769 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _887 = _785 ? as_type<float>(_877) : _781;
    float _889 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[76].y, _875);
    int _891 = _873 ? as_type<int>(_859) : as_type<int>(_781);
    float _893 = -_789;
    float _895 = fma(_885, 2.0, _893);
    bool _897 = _180 != 0.0;
    bool _899 = isnan(_180);
    bool _901 = _897 || _899;
    bool _903 = isnan(0.0);
    bool _905 = _901 || _903;
    float _907 = in.m_61.x;
    float _909 = in.m_61.y;
    float _911 = in.m_61.z;
    bool _913 = _809 > 0.5;
    float _915 = fma(_841, _887, -0.5);
    bool _917 = _178 == 0.0;
    bool _919 = !_905;
    bool _921 = _917 && _919;
    float _923 = -_108;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[76].x, _895);
    float _927 = _781;
    float _929 = _809;
    float _931 = _791;
    if (!_779)
    {
        _819 = _765;
    }
    float _933 = _819;
    float _935 = _849 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _937 = _803 ? as_type<float>(_891) : _781;
    float _939 = -_871;
    float _941 = _939 + 1.0;
    bool _943 = _182 == 0.0;
    bool _945 = _943 && _921;
    float _947 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[6].w, _879);
    float _949 = _933;
    if (_779)
    {
        float _951 = _913 ? as_type<float>(_839) : _765;
        _949 = _951;
    }
    float _953 = _949;
    float _955 = fma(_937, _935, -0.5);
    if (_795)
    {
        float _957 = _913 ? _859 : _781;
        _927 = _957;
    }
    float _959 = _927;
    float _961 = _807 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _965 = fma(_961, _953, -0.5);
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _969 = _791 > 0.5;
    bool _971 = _969 && _869;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _975 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[78].z, _967);
    float _977 = _909;
    float _979 = _907;
    float _981 = _911;
    if (!_945)
    {
        float _983 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[17].y, _909);
        _977 = _983;
    }
    float _985 = _977;
    float _987 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[78].w, _973);
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _991 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].z, _975);
    float _993 = _991;
    float _995 = _989;
    if (!_945)
    {
        float _997 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[17].y, _907);
        _979 = _997;
    }
    float _999 = _979;
    float _1001 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].w, _987);
    float _1003 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[88].w, _989);
    float _1005 = fma(_991, _863, _925);
    if (_883)
    {
        _993 = _769;
    }
    float _1007 = _993;
    float _1009 = -_889;
    float _1011 = fma(_1001, _915, _1009);
    float _1013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1015 = _1007;
    if (!_883)
    {
        _995 = _791;
    }
    float _1017 = _995;
    float _1019 = _1017;
    if (!_945)
    {
        float _1021 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[17].y, _911);
        _981 = _1021;
    }
    float _1023 = _981;
    if (!_883)
    {
        _1015 = _809;
    }
    float _1025 = _1015;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1029 = _963 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_883)
    {
        _1019 = _769;
    }
    float _1031 = _1019;
    float _1033 = _1025 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_869)
    {
        _210 = _765;
    }
    float _1035 = _210;
    float _1037 = _1035;
    if (_971)
    {
        float _1039 = -_765;
        float _1041 = _1039 + 1.0;
        _821 = _1041;
    }
    float _1043 = _821;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1047 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1049 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1027);
    float _1051 = fma(_1029, _959, -0.5);
    float _1053 = _1047;
    if (_869)
    {
        _1037 = _1043;
    }
    float _1055 = _1037;
    float _1057 = -_1045;
    float _1059 = fma(_1047, 2.0, _1057);
    float _1061 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (!_883)
    {
        _1053 = _809;
    }
    float _1067 = _1053;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1071 = _1067;
    if (_883)
    {
        _929 = _791;
    }
    float _1073 = _929;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_883)
    {
        _1071 = _791;
    }
    float _1077 = _1071;
    float _1079 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1065);
    if (!_883)
    {
        _931 = _769;
    }
    float _1081 = _931;
    float _1083 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1069);
    float _1085 = -_1075;
    float _1087 = fma(_1033, 2.0, _1085);
    float _1089 = _985 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1091 = _985 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1093 = _985 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1095 = fma(_1061, _1055, -0.5);
    float _1097 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1079);
    float _1099 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1101 = -_108;
    float _1103 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1087);
    float _1105 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1089);
    float _1107 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1091);
    float _1109 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1093);
    float _1111 = fma(_1097, _1095, _1103);
    float _1113 = fma(_1099, -2.0, _1063);
    float _1115 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1049);
    float _1117 = fma(_1023, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1105);
    float _1119 = fma(_1023, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1107);
    float _1121 = fma(_1023, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1109);
    float _1123 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1125 = -_108;
    float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1059);
    float _1129 = fma(_1123, -2.0, _851);
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1135 = fma(_1115, _965, _1127);
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1139 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1003);
    float _1141 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1083);
    float _1143 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1113);
    float _1145 = in.m_63.w;
    float _1147 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1129);
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1151 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1153 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1155 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = -_1147;
    float _1159 = fma(_1139, _1051, _1157);
    out.m_65.x = _1117;
    out.m_65.y = _1119;
    out.m_65.z = _1121;
    float _1161 = -_1143;
    float _1163 = fma(_1141, _955, _1161);
    out.m_67.x = _1151;
    out.m_67.y = _1153;
    out.m_67.z = _1155;
    out.m_67.w = _1149;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1167 = _1005 + 0.5;
    out.m_69.x = _426;
    out.m_69.y = _424;
    out.m_69.z = _428;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1173 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1175 = _941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.x = _436;
    out.m_71.y = _432;
    out.m_71.z = _440;
    float _1177 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1181 = _1011 + 0.5;
    float _1183 = _1135 + 0.5;
    float _1185 = _1159 + 0.5;
    float _1187 = _947 + _684;
    float _1189 = _1111 + 0.5;
    float _1191 = _1163 + 0.5;
    float _1193 = _1187 * 0.5;
    out.m_73.x = _1173;
    out.m_73.y = _1177;
    out.m_73.z = _1179;
    float _1195 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.w = _1145;
    out.m_77.x = _1167;
    out.m_77.y = _1181;
    out.m_77.z = _1183;
    out.m_77.w = _1191;
    out.m_79.x = _1189;
    out.m_79.y = _1185;
    out.gl_Position.x = _712;
    out.gl_Position.y = _716;
    out.gl_Position.z = _947;
    out.gl_Position.w = _684;
    out.m_81.z = _1193;
    out.m_81.w = _684;
    out.m_49.x = _1195;
    float _1197 = _1175 * _738;
    float _1199 = -_1175;
    float _1201 = _1199 + 1.0;
    float _1203 = _749 * _1197;
    float _1205 = _749 * _1201;
    float _1207 = _763 * _1197;
    float _1209 = fma(_759, _1203, _743);
    float _1211 = fma(_761, _1203, _745);
    float _1213 = fma(_749, _1207, _747);
    out.m_83.x = _1209;
    out.m_83.y = _1211;
    out.m_83.z = _1213;
    out.m_83.w = _1205;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = in.m_44.w;
    float _101 = trunc(_97);
    int _104 = int(_101);
    float _106 = -_99;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _108;
    bool _112 = _104 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1278 = as_type<float>(_122);
        out.gl_Position.z = _1278;
    }
    if (!_112)
    {
        return out;
    }
    bool _126 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_99);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = float(_104);
    bool _138 = _108 >= _136;
    bool _140 = !_134;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_49.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _124 = as_type<int>(_148);
    }
    int _150 = _124;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1334 = as_type<float>(_150);
        out.gl_Position.z = _1334;
    }
    if (_142)
    {
        return out;
    }
    float _152 = in.m_51.w;
    float _154 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _156 = in.m_44.x;
    float _158 = in.m_44.y;
    float _160 = in.m_44.z;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_42.x;
    float _174 = in.m_42.y;
    float _176 = in.m_42.z;
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    float _184 = in.m_51.x;
    float _186 = in.m_51.y;
    float _188 = in.m_51.z;
    float _190 = 0.0;
    float _192 = _154;
    if (!_170)
    {
        float _194 = _154 * _154;
        float _196 = _194 * 0.5;
        _190 = _196;
    }
    float _198 = _190;
    float _200 = _198;
    if (!_170)
    {
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    bool _206 = !_170;
    float _208 = _204;
    float _210 = _178;
    if (!_206)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _154 * _214;
        float _224 = exp2(_222);
        float _226 = _220 * 0.693147182464599609375;
        float _228 = 1.0 / _226;
        float _230 = 1.0 / _218;
        float _232 = _224 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _228, _154);
        float _238 = _236 * _230;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _240;
    }
    float _242 = _208;
    bool _244 = !_170;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _154 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _192 = _264;
    }
    float _266 = _192;
    float _268 = _184 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = _186 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _180);
    float _274 = _188 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _276 = _268 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _278 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _270 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _282 = _274 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _284 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _178);
    float _286 = fma(_266, _158, _278);
    float _288 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _290 = _280 * _272;
    float _292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _182);
    float _294 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _296 = fma(_266, _156, _288);
    float _298 = fma(_286, _152, _174);
    float _300 = _282 * _292;
    float _302 = fma(_266, _160, _294);
    float _304 = fma(_296, _152, _172);
    float _306 = _298 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _308 = _276 * _284;
    float _310 = fma(_302, _152, _176);
    float _312 = _290 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _314 = _298 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _316 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[6].x, _306);
    float _318 = _290 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _320 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[10].x, _312);
    float _322 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[4].x, _314);
    float _324 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[6].z, _316);
    float _326 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[8].x, _318);
    float _328 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[10].z, _320);
    float _330 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[4].z, _322);
    float _332 = _324 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _334 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[8].z, _326);
    float _336 = _330 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _338 = _332 + _328;
    float _340 = _290 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _342 = _336 + _334;
    float _344 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _346 = _338 + _344;
    float _348 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[9].x, _340);
    float _350 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _352 = _342 + _350;
    float _354 = _346 * _346;
    float _356 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[9].z, _348);
    float _358 = fma(_352, _352, _354);
    float _360 = _298 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _362 = sqrt(_358);
    float _364 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[5].x, _360);
    float _366 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[5].z, _364);
    float _368 = _366 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _370 = _368 + _356;
    bool _372 = _362 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _374 = _334;
    float _376 = _342;
    float _378 = _338;
    float _380 = _300;
    if (!_372)
    {
        _374 = _370;
    }
    float _382 = _374;
    bool _384 = !_372;
    float _386 = _382;
    if (!_384)
    {
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _390 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _392 = _362 + _390;
        float _394 = rsqrt(_358);
        float _396 = _392 * _388;
        float _398 = _370 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _400 = _396 * 0.15915493667125701904296875;
        float _402 = _400 * 6.283185482025146484375;
        float _404 = cos(_402);
        float _406 = _400 * 6.283185482025146484375;
        float _408 = sin(_406);
        float _410 = _404 + (-1.0);
        float _412 = _410 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _414 = fma(_408, _398, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _416 = fma(_370, _404, _412);
        float _418 = _394 * _414;
        float _420 = fma(_352, _418, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _422 = fma(_346, _418, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _386 = _416;
        _376 = _420;
        _378 = _422;
    }
    float _424 = _386;
    float _426 = _376;
    float _428 = _378;
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _432 = _424 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _436 = _426 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _440 = _428 + _438;
    float _442 = _432 * _432;
    float _444 = fma(_436, _436, _442);
    float _446 = fma(_440, _440, _444);
    float _448 = rsqrt(_446);
    float _450 = sqrt(_446);
    float _452 = _448 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _454 = _436 * _452;
    float _456 = _440 * _452;
    float _458 = _454 * _454;
    float _460 = _456 * _456;
    float _462 = _458 + _460;
    float _464 = sqrt(_462);
    bool _466 = _464 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _468 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _470 = _464 + _468;
    float _472 = _444;
    float _474 = _462;
    float _476 = _470;
    float _478 = _454;
    if (_466)
    {
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _472 = _480;
    }
    float _482 = _472;
    if (_466)
    {
        float _484 = rsqrt(_462);
        _474 = _484;
    }
    float _486 = _474;
    float _488 = _486;
    if (_466)
    {
        float _490 = _470 * _482;
        _476 = _490;
    }
    float _492 = _476;
    if (_466)
    {
        float _494 = _492 * 0.15915493667125701904296875;
        _380 = _494;
    }
    float _496 = _380;
    float _498 = _482;
    float _500 = _496;
    if (_466)
    {
        float _502 = _496 * 6.283185482025146484375;
        float _504 = sin(_502);
        _498 = _504;
    }
    float _506 = _498;
    float _508 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _510 = precise::max(0.0, _508);
    float _512 = _310;
    float _514 = _510;
    if (_466)
    {
        float _516 = _496 * 6.283185482025146484375;
        float _518 = cos(_516);
        _512 = _518;
    }
    float _520 = _512;
    float _522 = -_452;
    float _524 = -_510;
    float _526 = fma(_432, _522, _524);
    if (_466)
    {
        float _528 = _526 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _514 = _528;
    }
    float _530 = _514;
    float _532 = _506;
    float _534 = _530;
    if (_466)
    {
        float _536 = fma(_506, _530, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _532 = _536;
    }
    float _538 = _532;
    float _540 = _538;
    float _542 = _520;
    if (_466)
    {
        float _544 = _520 + (-1.0);
        _534 = _544;
    }
    float _546 = _534;
    float _548 = 0.0;
    float _550 = _546;
    if (_466)
    {
        float _552 = _486 * _538;
        _548 = _552;
    }
    float _554 = _548;
    if (!_466)
    {
        _540 = _526;
    }
    float _556 = _540;
    float _558 = _556;
    if (_466)
    {
        float _560 = _546 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _500 = _560;
    }
    float _562 = _500;
    if (_466)
    {
        float _564 = _454 * _554;
        _478 = _564;
    }
    float _566 = _478;
    if (!_466)
    {
        _550 = _456;
    }
    float _568 = _550;
    float _570 = _568;
    if (_466)
    {
        float _572 = _456 * _554;
        _570 = _572;
    }
    float _574 = _570;
    if (!_466)
    {
        _488 = _458;
    }
    float _576 = _488;
    float _578 = _576;
    if (_466)
    {
        float _580 = fma(_526, _520, _562);
        _558 = _580;
    }
    float _582 = _558;
    if (_466)
    {
        float _584 = _566 * _566;
        _578 = _584;
    }
    float _586 = _578;
    if (!_466)
    {
        _542 = _460;
    }
    float _588 = _542;
    float _590 = _588;
    if (_466)
    {
        float _592 = _574 * _574;
        _590 = _592;
    }
    float _594 = _590;
    float _596 = fma(_582, _582, _586);
    float _598 = _424 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _600 = _596 + _594;
    float _602 = _424 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _604 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _606 = fma(_450, (*spvDescriptorSet0.vp_c15)._m0[23].w, _604);
    float _608 = precise::clamp(_606, 0.0, 1.0);
    float _610 = _424 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _612 = rsqrt(_600);
    float _614 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[2].x, _602);
    float _616 = -_608;
    float _618 = _616 + 1.0;
    float _620 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[1].x, _610);
    float _622 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _624 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[2].z, _614);
    float _626 = _424 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _628 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[1].z, _620);
    float _630 = abs(_618);
    float _632 = log2(_630);
    float _634 = _624 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _636 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[0].x, _626);
    float _638 = _628 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _640 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[3].x, _598);
    float _642 = _634 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _644 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[0].z, _636);
    float _646 = _612 * _566;
    float _648 = _612 * _582;
    float _650 = _644 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _652 = _638 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _654 = _646 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _656 = -_642;
    float _658 = fma(_656, _622, 1.0);
    float _660 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[3].z, _640);
    float _662 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[7].x, _652);
    float _664 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _666 = _612 * _574;
    float _668 = -_654;
    float _670 = fma(_648, (*spvDescriptorSet0.vp_c15)._m0[21].y, _668);
    float _672 = _660 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _674 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[7].z, _662);
    float _676 = exp2(_664);
    float _678 = -_666;
    float _680 = fma(_678, (*spvDescriptorSet0.vp_c15)._m0[21].z, _670);
    float _682 = _638 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _684 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[7].w, _674);
    float _686 = _638 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _688 = fma(_680, -0.5, 0.5);
    float _690 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[4].x, _682);
    float _692 = fma(_680, 0.5, 0.5);
    float _694 = log2(_658);
    float _696 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[5].x, _686);
    float _698 = _648 + 1.0;
    float _700 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[4].z, _690);
    float _702 = fma(_692, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _704 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[5].z, _696);
    float _706 = 1.0 / _684;
    float _708 = -_648;
    float _710 = fma(_676, _698, _708);
    float _712 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[4].w, _700);
    float _714 = fma(_692, _702, -0.212114393711090087890625);
    float _716 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[5].w, _704);
    float _718 = fma(_710, 0.5, 0.5);
    float _720 = fma(_692, _714, 1.570728778839111328125);
    float _722 = sqrt(_688);
    float _724 = _694 * 0.693147182464599609375;
    float _726 = _724 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _728 = _716 * _706;
    float _730 = _712 * _706;
    float _732 = fma(_728, -0.5, 0.5);
    float _734 = fma(_730, 0.5, 0.5);
    float _736 = _722 * 0.636619746685028076171875;
    float3 _2307 = float3(_734, _732, _726);
    float _738 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2307, float3(0.0), isnan(_2307)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2307, float3(0.0), isnan(_2307)), level(0.0)).x;
    float3 _2318 = float3(_734, _732, _726);
    float4 _741 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2318, float3(0.0), isnan(_2318)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2318, float3(0.0), isnan(_2318)), level(0.0)).xyzw;
    float _743 = _741.x;
    float _745 = _741.y;
    float _747 = _741.z;
    float _749 = _741.w;
    float _751 = -_720;
    float _753 = fma(_736, _751, 1.0);
    float2 _2340 = float2(_753, _718);
    float3 _757 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2340, float2(0.0), isnan(_2340)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2340, float2(0.0), isnan(_2340)), level(0.0)).xyz;
    float _759 = _757.x;
    float _761 = _757.y;
    float _763 = _757.z;
    float _765 = in.m_55.x;
    float _767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _769 = in.m_57.x;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _773 = _771 != 0;
    float _775 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _779 = _777 != 0;
    float _781 = in.m_55.y;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _785 = _783 != 0;
    float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _791 = in.m_57.y;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _795 = _793 != 0;
    float _797 = _638 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _799 = in.m_57.w;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _803 = _801 != 0;
    float _805 = _767 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _809 = in.m_57.z;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _813 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[6].x, _797);
    int _815 = as_type<int>(_732);
    float _817 = _734;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _821 = _765;
    if (_773)
    {
        float _823 = -_765;
        float _825 = _823 + 1.0;
        _815 = as_type<int>(_825);
    }
    int _827 = _815;
    if (!_773)
    {
        _817 = _765;
    }
    float _829 = _817;
    int _831 = 0;
    float _833 = _829;
    if (_779)
    {
        float _835 = -_765;
        float _837 = _835 + 1.0;
        _831 = as_type<int>(_837);
    }
    int _839 = _831;
    float _841 = _787 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _843 = false;
    if (_773)
    {
        bool _845 = _769 > 0.5;
        _843 = _845;
    }
    bool _847 = _843;
    float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_59.x = _765;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_773)
    {
        float _853 = _847 ? as_type<float>(_827) : _765;
        _833 = _853;
    }
    float _855 = _833;
    float _857 = -_781;
    float _859 = _857 + 1.0;
    out.m_59.y = _781;
    bool _861 = _791 > 0.5;
    float _863 = fma(_805, _855, -0.5);
    float _865 = _791 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _869 = _867 != 0;
    float _871 = exp2(_775);
    bool _873 = _799 > 0.5;
    float _875 = fma(_865, -2.0, _811);
    int _877 = _861 ? as_type<int>(_859) : as_type<int>(_781);
    float _879 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[6].z, _813);
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _883 = _881 != 0;
    float _885 = _769 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _887 = _785 ? as_type<float>(_877) : _781;
    float _889 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[76].y, _875);
    int _891 = _873 ? as_type<int>(_859) : as_type<int>(_781);
    float _893 = -_789;
    float _895 = fma(_885, 2.0, _893);
    bool _897 = _180 != 0.0;
    bool _899 = isnan(_180);
    bool _901 = _897 || _899;
    bool _903 = isnan(0.0);
    bool _905 = _901 || _903;
    float _907 = in.m_61.x;
    float _909 = in.m_61.y;
    float _911 = in.m_61.z;
    bool _913 = _809 > 0.5;
    float _915 = fma(_841, _887, -0.5);
    bool _917 = _178 == 0.0;
    bool _919 = !_905;
    bool _921 = _917 && _919;
    float _923 = -_108;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[76].x, _895);
    float _927 = _781;
    float _929 = _809;
    float _931 = _791;
    if (!_779)
    {
        _819 = _765;
    }
    float _933 = _819;
    float _935 = _849 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _937 = _803 ? as_type<float>(_891) : _781;
    float _939 = -_871;
    float _941 = _939 + 1.0;
    bool _943 = _182 == 0.0;
    bool _945 = _943 && _921;
    float _947 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[6].w, _879);
    float _949 = _933;
    if (_779)
    {
        float _951 = _913 ? as_type<float>(_839) : _765;
        _949 = _951;
    }
    float _953 = _949;
    float _955 = fma(_937, _935, -0.5);
    if (_795)
    {
        float _957 = _913 ? _859 : _781;
        _927 = _957;
    }
    float _959 = _927;
    float _961 = _807 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _965 = fma(_961, _953, -0.5);
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _969 = _791 > 0.5;
    bool _971 = _969 && _869;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _975 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[78].z, _967);
    float _977 = _909;
    float _979 = _907;
    float _981 = _911;
    if (!_945)
    {
        float _983 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[17].y, _909);
        _977 = _983;
    }
    float _985 = _977;
    float _987 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[78].w, _973);
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _991 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].z, _975);
    float _993 = _991;
    float _995 = _989;
    if (!_945)
    {
        float _997 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[17].y, _907);
        _979 = _997;
    }
    float _999 = _979;
    float _1001 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].w, _987);
    float _1003 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[88].w, _989);
    float _1005 = fma(_991, _863, _925);
    if (_883)
    {
        _993 = _769;
    }
    float _1007 = _993;
    float _1009 = -_889;
    float _1011 = fma(_1001, _915, _1009);
    float _1013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1015 = _1007;
    if (!_883)
    {
        _995 = _791;
    }
    float _1017 = _995;
    float _1019 = _1017;
    if (!_945)
    {
        float _1021 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[17].y, _911);
        _981 = _1021;
    }
    float _1023 = _981;
    if (!_883)
    {
        _1015 = _809;
    }
    float _1025 = _1015;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1029 = _963 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_883)
    {
        _1019 = _769;
    }
    float _1031 = _1019;
    float _1033 = _1025 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_869)
    {
        _210 = _765;
    }
    float _1035 = _210;
    float _1037 = _1035;
    if (_971)
    {
        float _1039 = -_765;
        float _1041 = _1039 + 1.0;
        _821 = _1041;
    }
    float _1043 = _821;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1047 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1049 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1027);
    float _1051 = fma(_1029, _959, -0.5);
    float _1053 = _1047;
    if (_869)
    {
        _1037 = _1043;
    }
    float _1055 = _1037;
    float _1057 = -_1045;
    float _1059 = fma(_1047, 2.0, _1057);
    float _1061 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (!_883)
    {
        _1053 = _809;
    }
    float _1067 = _1053;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1071 = _1067;
    if (_883)
    {
        _929 = _791;
    }
    float _1073 = _929;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_883)
    {
        _1071 = _791;
    }
    float _1077 = _1071;
    float _1079 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1065);
    if (!_883)
    {
        _931 = _769;
    }
    float _1081 = _931;
    float _1083 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1069);
    float _1085 = -_1075;
    float _1087 = fma(_1033, 2.0, _1085);
    float _1089 = _985 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1091 = _985 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1093 = _985 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1095 = fma(_1061, _1055, -0.5);
    float _1097 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1079);
    float _1099 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1101 = -_108;
    float _1103 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1087);
    float _1105 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1089);
    float _1107 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1091);
    float _1109 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1093);
    float _1111 = fma(_1097, _1095, _1103);
    float _1113 = fma(_1099, -2.0, _1063);
    float _1115 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1049);
    float _1117 = fma(_1023, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1105);
    float _1119 = fma(_1023, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1107);
    float _1121 = fma(_1023, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1109);
    float _1123 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1125 = -_108;
    float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1059);
    float _1129 = fma(_1123, -2.0, _851);
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1135 = fma(_1115, _965, _1127);
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1139 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1003);
    float _1141 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1083);
    float _1143 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1113);
    float _1145 = in.m_63.w;
    float _1147 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1129);
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1151 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1153 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1155 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = -_1147;
    float _1159 = fma(_1139, _1051, _1157);
    out.m_65.x = _1117;
    out.m_65.y = _1119;
    out.m_65.z = _1121;
    float _1161 = -_1143;
    float _1163 = fma(_1141, _955, _1161);
    out.m_67.x = _1151;
    out.m_67.y = _1153;
    out.m_67.z = _1155;
    out.m_67.w = _1149;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1167 = _1005 + 0.5;
    out.m_69.x = _426;
    out.m_69.y = _424;
    out.m_69.z = _428;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1173 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1175 = _941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.x = _436;
    out.m_71.y = _432;
    out.m_71.z = _440;
    float _1177 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1181 = _1011 + 0.5;
    float _1183 = _1135 + 0.5;
    float _1185 = _1159 + 0.5;
    float _1187 = _947 + _684;
    float _1189 = _1111 + 0.5;
    float _1191 = _1163 + 0.5;
    float _1193 = _1187 * 0.5;
    out.m_73.x = _1173;
    out.m_73.y = _1177;
    out.m_73.z = _1179;
    float _1195 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.w = _1145;
    out.m_77.x = _1167;
    out.m_77.y = _1181;
    out.m_77.z = _1183;
    out.m_77.w = _1191;
    out.m_79.x = _1189;
    out.m_79.y = _1185;
    out.gl_Position.x = _712;
    out.gl_Position.y = _716;
    out.gl_Position.z = _947;
    out.gl_Position.w = _684;
    out.m_81.z = _1193;
    out.m_81.w = _684;
    out.m_49.x = _1195;
    float _1197 = _1175 * _738;
    float _1199 = -_1175;
    float _1201 = _1199 + 1.0;
    float _1203 = _749 * _1197;
    float _1205 = _749 * _1201;
    float _1207 = _763 * _1197;
    float _1209 = fma(_759, _1203, _743);
    float _1211 = fma(_761, _1203, _745);
    float _1213 = fma(_749, _1207, _747);
    out.m_83.x = _1209;
    out.m_83.y = _1211;
    out.m_83.z = _1213;
    out.m_83.w = _1205;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = in.m_44.w;
    float _101 = trunc(_97);
    int _104 = int(_101);
    float _106 = -_99;
    float _108 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _108;
    bool _112 = _104 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1278 = as_type<float>(_122);
        out.gl_Position.z = _1278;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _126 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_99);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = float(_104);
    bool _138 = _108 >= _136;
    bool _140 = !_134;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_49.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _124 = as_type<int>(_148);
    }
    int _150 = _124;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1334 = as_type<float>(_150);
        out.gl_Position.z = _1334;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_51.w;
    float _154 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _156 = in.m_44.x;
    float _158 = in.m_44.y;
    float _160 = in.m_44.z;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_42.x;
    float _174 = in.m_42.y;
    float _176 = in.m_42.z;
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    float _184 = in.m_51.x;
    float _186 = in.m_51.y;
    float _188 = in.m_51.z;
    float _190 = 0.0;
    float _192 = _154;
    if (!_170)
    {
        float _194 = _154 * _154;
        float _196 = _194 * 0.5;
        _190 = _196;
    }
    float _198 = _190;
    float _200 = _198;
    if (!_170)
    {
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    bool _206 = !_170;
    float _208 = _204;
    float _210 = _178;
    if (!_206)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _154 * _214;
        float _224 = exp2(_222);
        float _226 = _220 * 0.693147182464599609375;
        float _228 = 1.0 / _226;
        float _230 = 1.0 / _218;
        float _232 = _224 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _228, _154);
        float _238 = _236 * _230;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _240;
    }
    float _242 = _208;
    bool _244 = !_170;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _154 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _192 = _264;
    }
    float _266 = _192;
    float _268 = _184 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = _186 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _180);
    float _274 = _188 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _276 = _268 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _278 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _280 = _270 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _282 = _274 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _284 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _178);
    float _286 = fma(_266, _158, _278);
    float _288 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _290 = _280 * _272;
    float _292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _182);
    float _294 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _296 = fma(_266, _156, _288);
    float _298 = fma(_286, _152, _174);
    float _300 = _282 * _292;
    float _302 = fma(_266, _160, _294);
    float _304 = fma(_296, _152, _172);
    float _306 = _298 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _308 = _276 * _284;
    float _310 = fma(_302, _152, _176);
    float _312 = _290 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _314 = _298 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _316 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[6].x, _306);
    float _318 = _290 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _320 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[10].x, _312);
    float _322 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[4].x, _314);
    float _324 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[6].z, _316);
    float _326 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[8].x, _318);
    float _328 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[10].z, _320);
    float _330 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[4].z, _322);
    float _332 = _324 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _334 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[8].z, _326);
    float _336 = _330 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _338 = _332 + _328;
    float _340 = _290 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _342 = _336 + _334;
    float _344 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _346 = _338 + _344;
    float _348 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[9].x, _340);
    float _350 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _352 = _342 + _350;
    float _354 = _346 * _346;
    float _356 = fma(_300, (*spvDescriptorSet0.vp_c10)._m0[9].z, _348);
    float _358 = fma(_352, _352, _354);
    float _360 = _298 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _362 = sqrt(_358);
    float _364 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[5].x, _360);
    float _366 = fma(_310, (*spvDescriptorSet0.vp_c10)._m0[5].z, _364);
    float _368 = _366 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _370 = _368 + _356;
    bool _372 = _362 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _374 = _334;
    float _376 = _342;
    float _378 = _338;
    float _380 = _300;
    if (!_372)
    {
        _374 = _370;
    }
    float _382 = _374;
    bool _384 = !_372;
    float _386 = _382;
    if (!_384)
    {
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _390 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _392 = _362 + _390;
        float _394 = rsqrt(_358);
        float _396 = _392 * _388;
        float _398 = _370 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _400 = _396 * 0.15915493667125701904296875;
        float _402 = _400 * 6.283185482025146484375;
        float _404 = cos(_402);
        float _406 = _400 * 6.283185482025146484375;
        float _408 = sin(_406);
        float _410 = _404 + (-1.0);
        float _412 = _410 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _414 = fma(_408, _398, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _416 = fma(_370, _404, _412);
        float _418 = _394 * _414;
        float _420 = fma(_352, _418, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _422 = fma(_346, _418, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _386 = _416;
        _376 = _420;
        _378 = _422;
    }
    float _424 = _386;
    float _426 = _376;
    float _428 = _378;
    float _430 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _432 = _424 + _430;
    float _434 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _436 = _426 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _440 = _428 + _438;
    float _442 = _432 * _432;
    float _444 = fma(_436, _436, _442);
    float _446 = fma(_440, _440, _444);
    float _448 = rsqrt(_446);
    float _450 = sqrt(_446);
    float _452 = _448 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _454 = _436 * _452;
    float _456 = _440 * _452;
    float _458 = _454 * _454;
    float _460 = _456 * _456;
    float _462 = _458 + _460;
    float _464 = sqrt(_462);
    bool _466 = _464 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _468 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _470 = _464 + _468;
    float _472 = _444;
    float _474 = _462;
    float _476 = _470;
    float _478 = _454;
    if (_466)
    {
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _472 = _480;
    }
    float _482 = _472;
    if (_466)
    {
        float _484 = rsqrt(_462);
        _474 = _484;
    }
    float _486 = _474;
    float _488 = _486;
    if (_466)
    {
        float _490 = _470 * _482;
        _476 = _490;
    }
    float _492 = _476;
    if (_466)
    {
        float _494 = _492 * 0.15915493667125701904296875;
        _380 = _494;
    }
    float _496 = _380;
    float _498 = _482;
    float _500 = _496;
    if (_466)
    {
        float _502 = _496 * 6.283185482025146484375;
        float _504 = sin(_502);
        _498 = _504;
    }
    float _506 = _498;
    float _508 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _510 = precise::max(0.0, _508);
    float _512 = _310;
    float _514 = _510;
    if (_466)
    {
        float _516 = _496 * 6.283185482025146484375;
        float _518 = cos(_516);
        _512 = _518;
    }
    float _520 = _512;
    float _522 = -_452;
    float _524 = -_510;
    float _526 = fma(_432, _522, _524);
    if (_466)
    {
        float _528 = _526 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _514 = _528;
    }
    float _530 = _514;
    float _532 = _506;
    float _534 = _530;
    if (_466)
    {
        float _536 = fma(_506, _530, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _532 = _536;
    }
    float _538 = _532;
    float _540 = _538;
    float _542 = _520;
    if (_466)
    {
        float _544 = _520 + (-1.0);
        _534 = _544;
    }
    float _546 = _534;
    float _548 = 0.0;
    float _550 = _546;
    if (_466)
    {
        float _552 = _486 * _538;
        _548 = _552;
    }
    float _554 = _548;
    if (!_466)
    {
        _540 = _526;
    }
    float _556 = _540;
    float _558 = _556;
    if (_466)
    {
        float _560 = _546 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _500 = _560;
    }
    float _562 = _500;
    if (_466)
    {
        float _564 = _454 * _554;
        _478 = _564;
    }
    float _566 = _478;
    if (!_466)
    {
        _550 = _456;
    }
    float _568 = _550;
    float _570 = _568;
    if (_466)
    {
        float _572 = _456 * _554;
        _570 = _572;
    }
    float _574 = _570;
    if (!_466)
    {
        _488 = _458;
    }
    float _576 = _488;
    float _578 = _576;
    if (_466)
    {
        float _580 = fma(_526, _520, _562);
        _558 = _580;
    }
    float _582 = _558;
    if (_466)
    {
        float _584 = _566 * _566;
        _578 = _584;
    }
    float _586 = _578;
    if (!_466)
    {
        _542 = _460;
    }
    float _588 = _542;
    float _590 = _588;
    if (_466)
    {
        float _592 = _574 * _574;
        _590 = _592;
    }
    float _594 = _590;
    float _596 = fma(_582, _582, _586);
    float _598 = _424 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _600 = _596 + _594;
    float _602 = _424 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _604 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _606 = fma(_450, (*spvDescriptorSet0.vp_c15)._m0[23].w, _604);
    float _608 = precise::clamp(_606, 0.0, 1.0);
    float _610 = _424 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _612 = rsqrt(_600);
    float _614 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[2].x, _602);
    float _616 = -_608;
    float _618 = _616 + 1.0;
    float _620 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[1].x, _610);
    float _622 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _624 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[2].z, _614);
    float _626 = _424 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _628 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[1].z, _620);
    float _630 = abs(_618);
    float _632 = log2(_630);
    float _634 = _624 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _636 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[0].x, _626);
    float _638 = _628 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _640 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[3].x, _598);
    float _642 = _634 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _644 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[0].z, _636);
    float _646 = _612 * _566;
    float _648 = _612 * _582;
    float _650 = _644 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _652 = _638 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _654 = _646 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _656 = -_642;
    float _658 = fma(_656, _622, 1.0);
    float _660 = fma(_428, (*spvDescriptorSet0.vp_c8)._m0[3].z, _640);
    float _662 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[7].x, _652);
    float _664 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _666 = _612 * _574;
    float _668 = -_654;
    float _670 = fma(_648, (*spvDescriptorSet0.vp_c15)._m0[21].y, _668);
    float _672 = _660 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _674 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[7].z, _662);
    float _676 = exp2(_664);
    float _678 = -_666;
    float _680 = fma(_678, (*spvDescriptorSet0.vp_c15)._m0[21].z, _670);
    float _682 = _638 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _684 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[7].w, _674);
    float _686 = _638 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _688 = fma(_680, -0.5, 0.5);
    float _690 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[4].x, _682);
    float _692 = fma(_680, 0.5, 0.5);
    float _694 = log2(_658);
    float _696 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[5].x, _686);
    float _698 = _648 + 1.0;
    float _700 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[4].z, _690);
    float _702 = fma(_692, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _704 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[5].z, _696);
    float _706 = 1.0 / _684;
    float _708 = -_648;
    float _710 = fma(_676, _698, _708);
    float _712 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[4].w, _700);
    float _714 = fma(_692, _702, -0.212114393711090087890625);
    float _716 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[5].w, _704);
    float _718 = fma(_710, 0.5, 0.5);
    float _720 = fma(_692, _714, 1.570728778839111328125);
    float _722 = sqrt(_688);
    float _724 = _694 * 0.693147182464599609375;
    float _726 = _724 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _728 = _716 * _706;
    float _730 = _712 * _706;
    float _732 = fma(_728, -0.5, 0.5);
    float _734 = fma(_730, 0.5, 0.5);
    float _736 = _722 * 0.636619746685028076171875;
    float3 _2307 = float3(_734, _732, _726);
    float _738 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2307, float3(0.0), isnan(_2307)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2307, float3(0.0), isnan(_2307)), level(0.0)).x;
    float3 _2318 = float3(_734, _732, _726);
    float4 _741 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2318, float3(0.0), isnan(_2318)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2318, float3(0.0), isnan(_2318)), level(0.0)).xyzw;
    float _743 = _741.x;
    float _745 = _741.y;
    float _747 = _741.z;
    float _749 = _741.w;
    float _751 = -_720;
    float _753 = fma(_736, _751, 1.0);
    float2 _2340 = float2(_753, _718);
    float3 _757 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2340, float2(0.0), isnan(_2340)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2340, float2(0.0), isnan(_2340)), level(0.0)).xyz;
    float _759 = _757.x;
    float _761 = _757.y;
    float _763 = _757.z;
    float _765 = in.m_55.x;
    float _767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _769 = in.m_57.x;
    int _771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _773 = _771 != 0;
    float _775 = _632 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _779 = _777 != 0;
    float _781 = in.m_55.y;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _785 = _783 != 0;
    float _787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _791 = in.m_57.y;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _795 = _793 != 0;
    float _797 = _638 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _799 = in.m_57.w;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _803 = _801 != 0;
    float _805 = _767 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _809 = in.m_57.z;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _813 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[6].x, _797);
    int _815 = as_type<int>(_732);
    float _817 = _734;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _821 = _765;
    if (_773)
    {
        float _823 = -_765;
        float _825 = _823 + 1.0;
        _815 = as_type<int>(_825);
    }
    int _827 = _815;
    if (!_773)
    {
        _817 = _765;
    }
    float _829 = _817;
    int _831 = 0;
    float _833 = _829;
    if (_779)
    {
        float _835 = -_765;
        float _837 = _835 + 1.0;
        _831 = as_type<int>(_837);
    }
    int _839 = _831;
    float _841 = _787 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _843 = false;
    if (_773)
    {
        bool _845 = _769 > 0.5;
        _843 = _845;
    }
    bool _847 = _843;
    float _849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_59.x = _765;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_773)
    {
        float _853 = _847 ? as_type<float>(_827) : _765;
        _833 = _853;
    }
    float _855 = _833;
    float _857 = -_781;
    float _859 = _857 + 1.0;
    out.m_59.y = _781;
    bool _861 = _791 > 0.5;
    float _863 = fma(_805, _855, -0.5);
    float _865 = _791 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _869 = _867 != 0;
    float _871 = exp2(_775);
    bool _873 = _799 > 0.5;
    float _875 = fma(_865, -2.0, _811);
    int _877 = _861 ? as_type<int>(_859) : as_type<int>(_781);
    float _879 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[6].z, _813);
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _883 = _881 != 0;
    float _885 = _769 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _887 = _785 ? as_type<float>(_877) : _781;
    float _889 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[76].y, _875);
    int _891 = _873 ? as_type<int>(_859) : as_type<int>(_781);
    float _893 = -_789;
    float _895 = fma(_885, 2.0, _893);
    bool _897 = _180 != 0.0;
    bool _899 = isnan(_180);
    bool _901 = _897 || _899;
    bool _903 = isnan(0.0);
    bool _905 = _901 || _903;
    float _907 = in.m_61.x;
    float _909 = in.m_61.y;
    float _911 = in.m_61.z;
    bool _913 = _809 > 0.5;
    float _915 = fma(_841, _887, -0.5);
    bool _917 = _178 == 0.0;
    bool _919 = !_905;
    bool _921 = _917 && _919;
    float _923 = -_108;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[76].x, _895);
    float _927 = _781;
    float _929 = _809;
    float _931 = _791;
    if (!_779)
    {
        _819 = _765;
    }
    float _933 = _819;
    float _935 = _849 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _937 = _803 ? as_type<float>(_891) : _781;
    float _939 = -_871;
    float _941 = _939 + 1.0;
    bool _943 = _182 == 0.0;
    bool _945 = _943 && _921;
    float _947 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[6].w, _879);
    float _949 = _933;
    if (_779)
    {
        float _951 = _913 ? as_type<float>(_839) : _765;
        _949 = _951;
    }
    float _953 = _949;
    float _955 = fma(_937, _935, -0.5);
    if (_795)
    {
        float _957 = _913 ? _859 : _781;
        _927 = _957;
    }
    float _959 = _927;
    float _961 = _807 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _965 = fma(_961, _953, -0.5);
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _969 = _791 > 0.5;
    bool _971 = _969 && _869;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _975 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[78].z, _967);
    float _977 = _909;
    float _979 = _907;
    float _981 = _911;
    if (!_945)
    {
        float _983 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[17].y, _909);
        _977 = _983;
    }
    float _985 = _977;
    float _987 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[78].w, _973);
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _991 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].z, _975);
    float _993 = _991;
    float _995 = _989;
    if (!_945)
    {
        float _997 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[17].y, _907);
        _979 = _997;
    }
    float _999 = _979;
    float _1001 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].w, _987);
    float _1003 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[88].w, _989);
    float _1005 = fma(_991, _863, _925);
    if (_883)
    {
        _993 = _769;
    }
    float _1007 = _993;
    float _1009 = -_889;
    float _1011 = fma(_1001, _915, _1009);
    float _1013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1015 = _1007;
    if (!_883)
    {
        _995 = _791;
    }
    float _1017 = _995;
    float _1019 = _1017;
    if (!_945)
    {
        float _1021 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[17].y, _911);
        _981 = _1021;
    }
    float _1023 = _981;
    if (!_883)
    {
        _1015 = _809;
    }
    float _1025 = _1015;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1029 = _963 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_883)
    {
        _1019 = _769;
    }
    float _1031 = _1019;
    float _1033 = _1025 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_869)
    {
        _210 = _765;
    }
    float _1035 = _210;
    float _1037 = _1035;
    if (_971)
    {
        float _1039 = -_765;
        float _1041 = _1039 + 1.0;
        _821 = _1041;
    }
    float _1043 = _821;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1047 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1049 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1027);
    float _1051 = fma(_1029, _959, -0.5);
    float _1053 = _1047;
    if (_869)
    {
        _1037 = _1043;
    }
    float _1055 = _1037;
    float _1057 = -_1045;
    float _1059 = fma(_1047, 2.0, _1057);
    float _1061 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (!_883)
    {
        _1053 = _809;
    }
    float _1067 = _1053;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1071 = _1067;
    if (_883)
    {
        _929 = _791;
    }
    float _1073 = _929;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_883)
    {
        _1071 = _791;
    }
    float _1077 = _1071;
    float _1079 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1065);
    if (!_883)
    {
        _931 = _769;
    }
    float _1081 = _931;
    float _1083 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1069);
    float _1085 = -_1075;
    float _1087 = fma(_1033, 2.0, _1085);
    float _1089 = _985 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1091 = _985 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1093 = _985 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1095 = fma(_1061, _1055, -0.5);
    float _1097 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1079);
    float _1099 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1101 = -_108;
    float _1103 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1087);
    float _1105 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1089);
    float _1107 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1091);
    float _1109 = fma(_999, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1093);
    float _1111 = fma(_1097, _1095, _1103);
    float _1113 = fma(_1099, -2.0, _1063);
    float _1115 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1049);
    float _1117 = fma(_1023, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1105);
    float _1119 = fma(_1023, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1107);
    float _1121 = fma(_1023, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1109);
    float _1123 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1125 = -_108;
    float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1059);
    float _1129 = fma(_1123, -2.0, _851);
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1135 = fma(_1115, _965, _1127);
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1139 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1003);
    float _1141 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1083);
    float _1143 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1113);
    float _1145 = in.m_63.w;
    float _1147 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1129);
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1151 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1153 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1155 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1157 = -_1147;
    float _1159 = fma(_1139, _1051, _1157);
    out.m_65.x = _1117;
    out.m_65.y = _1119;
    out.m_65.z = _1121;
    float _1161 = -_1143;
    float _1163 = fma(_1141, _955, _1161);
    out.m_67.x = _1151;
    out.m_67.y = _1153;
    out.m_67.z = _1155;
    out.m_67.w = _1149;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1167 = _1005 + 0.5;
    out.m_69.x = _426;
    out.m_69.y = _424;
    out.m_69.z = _428;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1173 = _1165 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1175 = _941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.x = _436;
    out.m_71.y = _432;
    out.m_71.z = _440;
    float _1177 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1181 = _1011 + 0.5;
    float _1183 = _1135 + 0.5;
    float _1185 = _1159 + 0.5;
    float _1187 = _947 + _684;
    float _1189 = _1111 + 0.5;
    float _1191 = _1163 + 0.5;
    float _1193 = _1187 * 0.5;
    out.m_73.x = _1173;
    out.m_73.y = _1177;
    out.m_73.z = _1179;
    float _1195 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.w = _1145;
    out.m_77.x = _1167;
    out.m_77.y = _1181;
    out.m_77.z = _1183;
    out.m_77.w = _1191;
    out.m_79.x = _1189;
    out.m_79.y = _1185;
    out.gl_Position.x = _712;
    out.gl_Position.y = _716;
    out.gl_Position.z = _947;
    out.gl_Position.w = _684;
    out.m_81.z = _1193;
    out.m_81.w = _684;
    out.m_49.x = _1195;
    float _1197 = _1175 * _738;
    float _1199 = -_1175;
    float _1201 = _1199 + 1.0;
    float _1203 = _749 * _1197;
    float _1205 = _749 * _1201;
    float _1207 = _763 * _1197;
    float _1209 = fma(_759, _1203, _743);
    float _1211 = fma(_761, _1203, _745);
    float _1213 = fma(_749, _1207, _747);
    out.m_83.x = _1209;
    out.m_83.y = _1211;
    out.m_83.z = _1213;
    out.m_83.w = _1205;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

