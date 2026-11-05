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
    float4 m_47 [[user(locn0)]];
    float4 m_81 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
    float4 m_67 [[attribute(11)]];
    float4 m_71 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _116 = as_type<float>(_104);
    float _118 = _108;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_112)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2149 = as_type<float>(_126);
        out.gl_Position.z = _2149;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _130 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_99);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = float(_104);
    bool _142 = _108 >= _140;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    if (_146)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _116;
    if (_146)
    {
        out.m_49.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _128 = as_type<int>(_150);
    }
    int _152 = _128;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2204 = as_type<float>(_152);
        out.gl_Position.z = _2204;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_51.x;
    float _156 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_51.y;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _162 = _160 != 0;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_51.z;
    float _176 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _178 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _180 = precise::max(_176, _178);
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _184 = _180 >= 16.0;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _188 = 0.0;
    float _190 = _156;
    if (!_172)
    {
        float _192 = _156 * _156;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _154 * 2.0;
    float _200 = _154 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _202 = _196;
    float _204 = _154;
    if (!_172)
    {
        float _206 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _206;
    }
    float _208 = _202;
    float _210 = _158 * 2.0;
    float _212 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _214 = floor(_198);
    float _216 = -_182;
    float _218 = fma(_200, 2.0, _216);
    float _220 = fma(_212, -2.0, _186);
    float _222 = floor(_210);
    bool _224 = _214 > 0.0;
    bool _226 = _214 >= 0.0;
    bool _228 = isnan(_214);
    bool _230 = _226 || _228;
    bool _232 = isnan(0.0);
    bool _234 = _230 || _232;
    float _236 = _174 * 2.0;
    float _238 = floor(_236);
    bool _240 = !_172;
    float _242 = _208;
    float _244 = _238;
    float _246 = _174;
    if (!_240)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = _156 * _250;
        float _260 = 1.0 / _254;
        float _262 = _256 * 0.693147182464599609375;
        float _264 = exp2(_258);
        float _266 = 1.0 / _262;
        float _268 = _264 + (-1.0);
        float _270 = -_268;
        float _272 = fma(_270, _266, _156);
        float _274 = _272 * _260;
        float _276 = _274 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _242 = _276;
    }
    float _278 = _242;
    bool _280 = !_172;
    if (!_280)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = 1.0 / _288;
        float _292 = _156 * _284;
        float _294 = exp2(_292);
        float _296 = -_294;
        float _298 = _296 + 1.0;
        float _300 = _298 * _290;
        _190 = _300;
    }
    float _302 = _190;
    bool _304 = _222 >= 0.0;
    bool _306 = isnan(_222);
    bool _308 = _304 || _306;
    bool _310 = isnan(0.0);
    bool _312 = _308 || _310;
    float _314 = _158 + _174;
    int _316 = _234 ? 0 : 1;
    float _318 = _158 + _154;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _322 = _320 != 0;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _326 = _324 != 0;
    int _328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _330 = _328 != 0;
    float _332 = _314 + (-1.0);
    float _334 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _336 = log2(_334);
    int _338 = _312 ? 0 : 1;
    float _340 = _318 + (-1.0);
    bool _342 = !_322;
    int _344 = _342 ? 0 : 1;
    float _346 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _348 = _238 >= 0.0;
    bool _350 = isnan(_238);
    bool _352 = _348 || _350;
    bool _354 = isnan(0.0);
    bool _356 = _352 || _354;
    float _358 = -_108;
    float _360 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[76].x, _218);
    bool _362 = _222 > 0.0;
    float _364 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[76].y, _220);
    int _366 = _356 ? 0 : 1;
    float _368 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    bool _370 = _238 > 0.0;
    float _372 = _332;
    int _374 = as_type<int>(_364);
    if (_162)
    {
        _372 = _154;
    }
    float _376 = _372;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _380 = _376;
    float _382 = _378;
    if (!_162)
    {
        _380 = _174;
    }
    float _384 = _380;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (!_162)
    {
        _244 = _158;
    }
    float _390 = _244;
    float _392 = _384 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _394 = _390;
    if (_162)
    {
        _394 = _154;
    }
    float _396 = _394;
    float _398 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _400 = -_386;
    float _402 = fma(_392, 2.0, _400);
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_162)
    {
        _388 = _174;
    }
    float _406 = _388;
    float _408 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[83].z, _378);
    float _410 = _396 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _412 = ~_366;
    int _414 = _412 + 1;
    int _416 = _414 + 1;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _420 = _406;
    int _422 = _416;
    if (_162)
    {
        _420 = _158;
    }
    float _424 = _420;
    float _426 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _408);
    if (!_370)
    {
        int _428 = ~_366;
        int _430 = _428 + 1;
        _422 = _430;
    }
    int _432 = _422;
    float _434 = -_108;
    float _436 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[86].x, _402);
    if (!_162)
    {
        _404 = _174;
    }
    float _438 = _404;
    float _440 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[83].w, _418);
    float _442 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _440);
    float _444 = _438;
    if (_162)
    {
        _382 = _158;
    }
    float _446 = _382;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _450 = _446;
    if (_162)
    {
        _444 = _158;
    }
    float _452 = _444;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _456 = abs(_344);
    float _458 = _154 + (-0.5);
    if (!_162)
    {
        _450 = _154;
    }
    float _460 = _450;
    float _462 = _452 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _464 = ~_316;
    int _466 = _464 + 1;
    int _468 = _466 + 1;
    float _470 = _460 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _472 = float(_432);
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _476 = float(_456);
    float _478 = fma(_462, -2.0, _448);
    int _480 = _468;
    if (!_224)
    {
        int _482 = ~_316;
        int _484 = _482 + 1;
        _480 = _484;
    }
    int _486 = _480;
    float _488 = _336 * _108;
    float _490 = fma(_470, -2.0, _454);
    float _492 = _476 * _472;
    float _494 = -_474;
    float _496 = fma(_410, 2.0, _494);
    float _498 = in.m_53.x;
    float _500 = in.m_53.y;
    float _502 = in.m_53.z;
    int _504 = ~_338;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    float _510 = exp2(_488);
    int _512 = _508;
    if (!_362)
    {
        int _514 = ~_338;
        int _516 = _514 + 1;
        _512 = _516;
    }
    int _518 = _512;
    float _520 = -_108;
    float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[81].x, _496);
    bool _524 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _526 = isnan(1.0);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _532 = _528 || _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _536 = 1.0 + _534;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _540 = 1.0 / _536;
    float _542 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[78].z, _538);
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _546 = -_510;
    float _548 = _546 + 1.0;
    bool _550 = !_326;
    int _552 = _550 ? 0 : 1;
    float _554 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].z, _542);
    bool _556 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _558 = isnan(0.0);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _564 = _560 || _562;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _570 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _478);
    float _572 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].w, _544);
    float _574 = _492 * (-2.0);
    int _576 = abs(_552);
    float _578 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[88].z, _566);
    float _580 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[88].w, _568);
    float _582 = _564 ? _548 : 0.0;
    float _584 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].w, _572);
    float _586 = fma(_574, _498, _498);
    float _588 = float(_486);
    float _590 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].z, _578);
    float _592 = float(_576);
    float _594 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].w, _580);
    float _596 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[86].y, _490);
    bool _598 = _532;
    float _600 = _584;
    if (_532)
    {
        float _602 = _582 * _540;
        _118 = _602;
    }
    float _604 = _118;
    float _606 = fma(_398, _574, _398);
    float _608 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[196].x, _586);
    float _610 = _592 * _588;
    float _612 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    bool _614 = !_330;
    int _616 = _614 ? 0 : 1;
    float _618 = fma(_606, _604, _608);
    float _620 = _184 ? _368 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _622 = _174 + _154;
    float _624 = _184 ? _612 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _626 = in.m_55.x;
    float _628 = in.m_55.y;
    float _630 = in.m_55.z;
    float _632 = abs(_620);
    bool _634 = _632 != 0.0;
    bool _636 = isnan(_632);
    bool _638 = _634 || _636;
    bool _640 = isnan(0.0);
    bool _642 = _638 || _640;
    float _644 = _622 + (-1.0);
    int _646 = abs(_616);
    float _648 = _618 * 0.15915493667125701904296875;
    float _650 = abs(_624);
    bool _652 = _650 == 0.0;
    bool _654 = !_642;
    bool _656 = _652 && _654;
    float _658 = _610 * (-2.0);
    float _660 = float(_518);
    float _662 = _648 * 6.283185482025146484375;
    float _664 = sin(_662);
    float _666 = in.m_57.x;
    float _668 = in.m_57.y;
    float _670 = in.m_57.z;
    float _672 = float(_646);
    float _674 = fma(_346, _658, _346);
    float _676 = abs(_624);
    bool _678 = _676 == 0.0;
    float _680 = fma(_658, _500, _500);
    float _682 = _672 * _660;
    float _684 = _158 + (-0.5);
    int _686 = as_type<int>(_684);
    bool _688 = _678;
    if (_656)
    {
        bool _690 = as_type<int>(_624) >= 0;
        _598 = _690;
    }
    bool _692 = _598;
    float _694 = _682 * (-2.0);
    float _696 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _698 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[196].y, _680);
    int _700 = _692 ? (-1) : 0;
    if (_656)
    {
        int _702 = _692 ? 0 : 1078530011;
        _686 = _702;
    }
    int _704 = _686;
    float _706 = fma(_694, _502, _502);
    float _708 = _174 + (-0.5);
    float _710 = fma(_696, _694, _696);
    float _712 = fma(_674, _604, _698);
    int _714 = _704;
    if (_656)
    {
        int _716 = int(0x80000000) & as_type<int>(_620);
        int _718 = _704 | _716;
        _714 = _718;
    }
    int _720 = _714;
    float _722 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].z, _706);
    bool _724 = !_642;
    bool _726 = _724 && _678;
    int _728 = _720;
    float _730 = as_type<float>(_720);
    if (!_726)
    {
        float _732 = abs(_620);
        bool _734 = _732 != as_type<float>(0x7f800000u /* inf */);
        bool _736 = isnan(_732);
        bool _738 = _734 || _736;
        bool _740 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _742 = _738 || _740;
        float _744 = abs(_624);
        bool _746 = _744 == as_type<float>(0x7f800000u /* inf */);
        float _748 = abs(_624);
        bool _750 = _748 == as_type<float>(0x7f800000u /* inf */);
        bool _752 = !_742;
        bool _754 = _750 && _752;
        _688 = _746;
        if (_754)
        {
            bool _756 = as_type<int>(_624) >= 0;
            _700 = _756 ? (-1) : 0;
        }
        int _758 = _700;
        if (_754)
        {
            _728 = 1075235812;
        }
        int _760 = _728;
        int _762 = _760;
        if (_754)
        {
            int _764 = ~_758;
            int _766 = (_764 != 0) ? _760 : 1061752795;
            _762 = _766;
        }
        int _768 = _762;
        float _770 = as_type<float>(_768);
        if (_754)
        {
            int _772 = int(0x80000000) & as_type<int>(_620);
            int _774 = _768 | _772;
            _770 = as_type<float>(_774);
        }
        float _776 = _770;
        bool _778 = !_742;
        bool _780 = _778 && _746;
        _730 = _776;
        if (!_780)
        {
            float _782 = abs(_620);
            float _784 = abs(_624);
            float _786 = precise::max(_782, _784);
            float _788 = abs(_620);
            float _790 = abs(_624);
            float _792 = precise::min(_788, _790);
            float _794 = 1.0 / _786;
            float _796 = abs(_620);
            float _798 = abs(_624);
            bool _800 = _796 > _798;
            bool _802 = as_type<int>(_624) >= 0;
            float _804 = abs(_620);
            float _806 = abs(_624);
            float _808 = _804 + _806;
            int _810 = as_type<int>(_620) & int(0x80000000);
            bool _812 = _808 > as_type<float>(0x7f800000u /* inf */);
            bool _814 = isnan(_808);
            bool _816 = _812 || _814;
            bool _818 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _820 = _816 || _818;
            float _822 = _792 * _794;
            float _824 = _822 * _822;
            float _826 = _824 + 11.33538818359375;
            float _828 = fma(_824, _826, 28.84246826171875);
            float _830 = fma(_824, _828, 19.6966705322265625);
            float _832 = fma(_824, -0.82336294651031494140625, -5.674867153167724609375);
            float _834 = fma(_824, _832, -6.565555095672607421875);
            float _836 = 1.0 / _830;
            float _838 = _824 * _834;
            float _840 = _822 * _838;
            float _842 = fma(_840, _836, _822);
            float _844 = _842;
            _730 = _808;
            if (_800)
            {
                float _846 = -_842;
                float _848 = _846 + 1.57079637050628662109375;
                _844 = _848;
            }
            float _850 = _844;
            int _852 = as_type<int>(_850);
            if (!_802)
            {
                float _854 = -_850;
                float _856 = _854 + 3.1415927410125732421875;
                _852 = as_type<int>(_856);
            }
            int _858 = _852;
            if (!_820)
            {
                int _860 = _810 | _858;
                _730 = as_type<float>(_860);
            }
        }
    }
    float _862 = _730;
    bool _864 = _688;
    float _866 = fma(_710, _604, _722);
    float _868 = _712 + _862;
    float _870 = in.m_55.w;
    float _872 = _626 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _874 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _876 = in.m_44.x;
    float _878 = in.m_44.y;
    float _880 = in.m_44.z;
    float _882 = _868 * 0.15915493667125701904296875;
    float _884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _666);
    float _886 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _888 = in.m_42.x;
    float _890 = in.m_42.y;
    float _892 = in.m_42.z;
    float _894 = _866 * 0.15915493667125701904296875;
    float _896 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _898 = _884 * _886;
    float _900 = in.m_59.x;
    float _902 = in.m_59.y;
    float _904 = in.m_59.z;
    float _906 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _908 = _630 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _910 = _648 * 6.283185482025146484375;
    float _912 = cos(_910);
    float _914 = in.m_61.x;
    float _916 = in.m_61.y;
    float _918 = in.m_61.z;
    float _920 = _628 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _668);
    float _924 = _908 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _926 = in.m_63.x;
    float _928 = in.m_63.y;
    float _930 = in.m_63.z;
    float _932 = _920 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _934 = _882 * 6.283185482025146484375;
    float _936 = sin(_934);
    float _938 = _922 * _932;
    float _940 = fma(_302, _876, _906);
    float _942 = fma(_302, _878, _874);
    float _944 = fma(_302, _880, _896);
    float _946 = _882 * 6.283185482025146484375;
    float _948 = cos(_946);
    float _950 = fma(_940, _870, _888);
    float _952 = fma(_942, _870, _890);
    float _954 = fma(_944, _870, _892);
    float _956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _670);
    float _958 = _952 * _902;
    float _960 = _894 * 6.283185482025146484375;
    float _962 = cos(_960);
    float _964 = _952 * _916;
    float _966 = fma(_950, _900, _958);
    float _968 = _664 * _936;
    float _970 = _912 * _936;
    float _972 = _952 * _928;
    float _974 = fma(_950, _914, _964);
    float _976 = fma(_954, _904, _966);
    float _978 = _894 * 6.283185482025146484375;
    float _980 = sin(_978);
    float _982 = _912 * _948;
    float _984 = fma(_950, _926, _972);
    float _986 = _956 * _924;
    float _988 = _664 * _948;
    float _990 = fma(_954, _918, _974);
    float _992 = fma(_954, _930, _984);
    float _994 = _912 * _962;
    float _996 = _664 * _962;
    float _998 = _936 * _962;
    float _1000 = _948 * _962;
    float _1002 = _992 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1004 = _996 * _938;
    float _1006 = fma(_980, _982, _968);
    float _1008 = fma(_980, _968, _982);
    float _1010 = _994 * _938;
    float _1012 = -_938;
    float _1014 = _980 * _1012;
    float _1016 = -_970;
    float _1018 = fma(_980, _988, _1016);
    float _1020 = -_988;
    float _1022 = fma(_980, _970, _1020);
    float _1024 = fma(_1006, _898, _1010);
    float _1026 = fma(_1000, _898, _1014);
    float _1028 = _976 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1030 = fma(_1018, _898, _1004);
    float _1032 = fma(_1022, _986, _1024);
    float _1034 = fma(_998, _986, _1026);
    float _1036 = fma(_1008, _986, _1030);
    float _1038 = _1032 + _1002;
    float _1040 = _1034 + _1028;
    float _1042 = _990 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1044 = -_1038;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1048 = -_1040;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1052 = _1036 + _1042;
    float _1054 = _1046 * _1046;
    float _1056 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1058 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1056;
    float _1060 = fma(_1050, _1050, _1054);
    float _1062 = -_1052;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1066 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1068 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1066;
    float _1070 = fma(_1064, _1064, _1060);
    float _1072 = abs(_1058);
    float _1074 = abs(_1068);
    float _1076 = precise::max(_1072, _1074);
    float _1078 = sqrt(_1070);
    bool _1080 = _1076 >= 16.0;
    float _1082 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1084 = _1082 * 3.2999999523162841796875;
    float _1086 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1088 = _1086 * 7.30000019073486328125;
    float _1090 = in.m_65.x;
    float _1092 = in.m_65.y;
    float _1094 = in.m_65.z;
    float _1096 = _1058;
    float _1098 = _1068;
    bool _1100 = _864;
    float _1102 = _918;
    float _1104 = _1038;
    if (_1080)
    {
        float _1106 = _1058 * 0.0625;
        _1096 = _1106;
    }
    float _1108 = _1096;
    float _1110 = fma(_1078, 13.0, _1084);
    if (_1080)
    {
        float _1112 = _1068 * 0.0625;
        _1098 = _1112;
    }
    float _1114 = _1098;
    float _1116 = fma(_1078, 22.299999237060546875, _1088);
    bool _1118 = _668 != 0.0;
    bool _1120 = isnan(_668);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan(0.0);
    bool _1126 = _1122 || _1124;
    float _1128 = _1110 * 0.01745329238474369049072265625;
    float _1130 = abs(_1108);
    bool _1132 = _1130 != 0.0;
    bool _1134 = isnan(_1130);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan(0.0);
    bool _1140 = _1136 || _1138;
    float _1142 = _1116 * 0.01745329238474369049072265625;
    float _1144 = abs(_1114);
    bool _1146 = _1144 == 0.0;
    float _1148 = _1128 * 0.15915493667125701904296875;
    float _1150 = abs(_1114);
    bool _1152 = _1150 == 0.0;
    bool _1154 = !_1140;
    bool _1156 = _1152 && _1154;
    float _1158 = _1142 * 0.15915493667125701904296875;
    bool _1160 = _666 == 0.0;
    bool _1162 = !_1126;
    bool _1164 = _1160 && _1162;
    float _1166 = _1148 * 6.283185482025146484375;
    float _1168 = sin(_1166);
    bool _1170 = _670 == 0.0;
    bool _1172 = _1170 && _1164;
    float _1174 = _1158 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    int _1178 = as_type<int>(_1142);
    if (_1156)
    {
        bool _1180 = as_type<int>(_1114) >= 0;
        _1100 = _1180;
    }
    bool _1182 = _1100;
    int _1184 = _1182 ? (-1) : 0;
    if (_1156)
    {
        int _1186 = _1182 ? 0 : 1078530011;
        _1178 = _1186;
    }
    int _1188 = _1178;
    int _1190 = _1188;
    if (_1156)
    {
        int _1192 = int(0x80000000) & as_type<int>(_1108);
        int _1194 = _1188 | _1192;
        _1102 = as_type<float>(_1194);
    }
    float _1196 = _1102;
    bool _1198 = !_1140;
    bool _1200 = _1198 && _1146;
    float _1202 = _1196;
    float _1204 = _1196;
    float _1206 = _1092;
    float _1208 = _1090;
    float _1210 = _1094;
    if (!_1200)
    {
        float _1212 = abs(_1108);
        bool _1214 = _1212 != as_type<float>(0x7f800000u /* inf */);
        bool _1216 = isnan(_1212);
        bool _1218 = _1214 || _1216;
        bool _1220 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1222 = _1218 || _1220;
        float _1224 = abs(_1114);
        bool _1226 = _1224 == as_type<float>(0x7f800000u /* inf */);
        float _1228 = abs(_1114);
        bool _1230 = _1228 == as_type<float>(0x7f800000u /* inf */);
        bool _1232 = !_1222;
        bool _1234 = _1230 && _1232;
        if (_1234)
        {
            bool _1236 = as_type<int>(_1114) >= 0;
            _1184 = _1236 ? (-1) : 0;
        }
        int _1238 = _1184;
        if (_1234)
        {
            _1190 = 1075235812;
        }
        int _1240 = _1190;
        int _1242 = _1240;
        if (_1234)
        {
            int _1244 = ~_1238;
            int _1246 = (_1244 != 0) ? _1240 : 1061752795;
            _1242 = _1246;
        }
        int _1248 = _1242;
        if (_1234)
        {
            int _1250 = int(0x80000000) & as_type<int>(_1108);
            int _1252 = _1248 | _1250;
            _1202 = as_type<float>(_1252);
        }
        float _1254 = _1202;
        bool _1256 = !_1222;
        bool _1258 = _1256 && _1226;
        _1204 = _1254;
        if (!_1258)
        {
            float _1260 = abs(_1108);
            float _1262 = abs(_1114);
            float _1264 = precise::max(_1260, _1262);
            float _1266 = abs(_1108);
            float _1268 = abs(_1114);
            float _1270 = precise::min(_1266, _1268);
            float _1272 = 1.0 / _1264;
            float _1274 = abs(_1108);
            float _1276 = abs(_1114);
            bool _1278 = _1274 > _1276;
            bool _1280 = as_type<int>(_1114) >= 0;
            float _1282 = _1270 * _1272;
            float _1284 = _1282 * _1282;
            float _1286 = _1284 + 11.33538818359375;
            float _1288 = fma(_1284, _1286, 28.84246826171875);
            float _1290 = fma(_1284, _1288, 19.6966705322265625);
            float _1292 = fma(_1284, -0.82336294651031494140625, -5.674867153167724609375);
            float _1294 = fma(_1284, _1292, -6.565555095672607421875);
            float _1296 = 1.0 / _1290;
            float _1298 = _1284 * _1294;
            float _1300 = abs(_1108);
            float _1302 = abs(_1114);
            float _1304 = _1300 + _1302;
            int _1306 = as_type<int>(_1108) & int(0x80000000);
            float _1308 = _1282 * _1298;
            bool _1310 = _1304 > as_type<float>(0x7f800000u /* inf */);
            bool _1312 = isnan(_1304);
            bool _1314 = _1310 || _1312;
            bool _1316 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1318 = _1314 || _1316;
            float _1320 = fma(_1308, _1296, _1282);
            float _1322 = _1320;
            _1204 = _1304;
            if (_1278)
            {
                float _1324 = -_1320;
                float _1326 = _1324 + 1.57079637050628662109375;
                _1322 = _1326;
            }
            float _1328 = _1322;
            int _1330 = as_type<int>(_1328);
            if (!_1280)
            {
                float _1332 = -_1328;
                float _1334 = _1332 + 3.1415927410125732421875;
                _1330 = as_type<int>(_1334);
            }
            int _1336 = _1330;
            if (!_1318)
            {
                int _1338 = _1306 | _1336;
                _1204 = as_type<float>(_1338);
            }
        }
    }
    float _1340 = _1204;
    if (!_1172)
    {
        float _1342 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1092);
        _1206 = _1342;
    }
    float _1344 = _1206;
    float _1346 = fma(_1078, 0.4166666567325592041015625, -0.666666686534881591796875);
    float _1348 = precise::clamp(_1346, 0.0, 1.0);
    float _1350 = _1340 * (-0.15915493667125701904296875);
    float _1352 = _1344;
    if (!_1172)
    {
        float _1354 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1090);
        _1208 = _1354;
    }
    float _1356 = _1208;
    float _1358 = -_1344;
    float _1360 = _980 * _1358;
    float _1362 = fma(_1348, -2.0, 3.0);
    float _1364 = _1348 * _1348;
    float _1366 = _1168 + _1176;
    float _1368 = _1356;
    if (!_1172)
    {
        float _1370 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1094);
        _1210 = _1370;
    }
    float _1372 = _1210;
    float _1374 = _1350 * 6.283185482025146484375;
    float _1376 = sin(_1374);
    float _1378 = fma(_1000, _1356, _1360);
    float _1380 = _996 * _1344;
    float _1382 = _1362 * _1364;
    float _1384 = _1366 * 0.100000001490116119384765625;
    float _1386 = fma(_998, _1372, _1378);
    float _1388 = fma(_1018, _1356, _1380);
    float _1390 = _994 * _1344;
    float _1392 = _1350 * 6.283185482025146484375;
    float _1394 = cos(_1392);
    float _1396 = _1382 * _1384;
    float _1398 = fma(_1008, _1372, _1388);
    float _1400 = fma(_1006, _1356, _1390);
    float _1402 = fma(_1386, _1396, _1040);
    float _1404 = fma(_1398, _1396, _1052);
    float _1406 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1408 = _1402 + _1406;
    float _1410 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1412 = _1404 + _1410;
    float _1414 = _1376 * _1408;
    float _1416 = _1394 * _1408;
    float _1418 = -_1414;
    float _1420 = fma(_1394, _1412, _1418);
    float _1422 = fma(_1376, _1412, _1416);
    float _1424 = _1420 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1426 = _1422 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1430 = _1424 + _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1434 = _1426 + _1432;
    float _1436 = _1430 * _1430;
    float _1438 = fma(_1434, _1434, _1436);
    float _1440 = fma(_1022, _1372, _1400);
    float _1442 = sqrt(_1438);
    float _1444 = fma(_1440, _1396, _1038);
    bool _1446 = _1442 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1448 = _1372;
    float _1450 = _1396;
    if (!_1446)
    {
        _1368 = _1426;
    }
    float _1452 = _1368;
    float _1454 = _1452;
    if (!_1446)
    {
        _1448 = _1424;
    }
    float _1456 = _1448;
    float _1458 = _1456;
    if (!_1446)
    {
        _1352 = _1444;
    }
    float _1460 = _1352;
    bool _1462 = !_1446;
    float _1464 = _1460;
    if (!_1462)
    {
        float _1466 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1470 = _1442 + _1468;
        float _1472 = _1444 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1474 = rsqrt(_1438);
        float _1476 = _1470 * _1466;
        float _1478 = _1476 * 0.15915493667125701904296875;
        float _1480 = _1478 * 6.283185482025146484375;
        float _1482 = cos(_1480);
        float _1484 = _1478 * 6.283185482025146484375;
        float _1486 = sin(_1484);
        float _1488 = _1482 + (-1.0);
        float _1490 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1492 = fma(_1486, _1472, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1494 = fma(_1444, _1482, _1490);
        float _1496 = _1474 * _1492;
        float _1498 = fma(_1434, _1496, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1500 = fma(_1430, _1496, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1464 = _1494;
        _1454 = _1498;
        _1458 = _1500;
    }
    float _1502 = _1464;
    float _1504 = _1454;
    float _1506 = _1458;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1510 = _1502 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1514 = _1504 + _1512;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1518 = _1506 + _1516;
    float _1520 = _1510 * _1510;
    float _1522 = fma(_1514, _1514, _1520);
    float _1524 = fma(_1518, _1518, _1522);
    float _1526 = rsqrt(_1524);
    float _1528 = _1526 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1530 = _1514 * _1528;
    float _1532 = _1518 * _1528;
    float _1534 = _1530 * _1530;
    float _1536 = _1532 * _1532;
    float _1538 = _1534 + _1536;
    float _1540 = sqrt(_1538);
    bool _1542 = _1540 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1546 = _1540 + _1544;
    float _1548 = _1426;
    float _1550 = _1546;
    float _1552 = _1510;
    float _1554 = _1530;
    if (_1542)
    {
        float _1556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1548 = _1556;
    }
    float _1558 = _1548;
    float _1560 = _1558;
    if (_1542)
    {
        float _1562 = _1546 * _1558;
        _1550 = _1562;
    }
    float _1564 = _1550;
    if (_1542)
    {
        float _1566 = rsqrt(_1538);
        _1560 = _1566;
    }
    float _1568 = _1560;
    float _1570 = _1568;
    if (_1542)
    {
        float _1572 = _1564 * 0.15915493667125701904296875;
        _1104 = _1572;
    }
    float _1574 = _1104;
    float _1576 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1578 = _1518;
    if (_1542)
    {
        float _1580 = _1574 * 6.283185482025146484375;
        float _1582 = sin(_1580);
        _1578 = _1582;
    }
    float _1584 = _1578;
    float _1586 = precise::max(0.0, _1576);
    float _1588 = _1434;
    float _1590 = _1586;
    if (_1542)
    {
        float _1592 = _1574 * 6.283185482025146484375;
        float _1594 = cos(_1592);
        _1588 = _1594;
    }
    float _1596 = _1588;
    float _1598 = -_1528;
    float _1600 = -_1586;
    float _1602 = fma(_1510, _1598, _1600);
    if (_1542)
    {
        float _1604 = _1602 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1552 = _1604;
    }
    float _1606 = _1552;
    float _1608 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1610 = sqrt(_1524);
    float _1612 = _1584;
    float _1614 = _1606;
    if (_1542)
    {
        float _1616 = fma(_1584, _1606, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1612 = _1616;
    }
    float _1618 = _1612;
    float _1620 = _1618;
    if (!_1542)
    {
        _1614 = _1602;
    }
    float _1622 = _1614;
    float _1624 = _1622;
    if (_1542)
    {
        float _1626 = _1568 * _1618;
        _1450 = _1626;
    }
    float _1628 = _1450;
    if (!_1542)
    {
        _1620 = _1534;
    }
    float _1630 = _1620;
    float _1632 = _1630;
    float _1634 = _1596;
    if (_1542)
    {
        float _1636 = _1596 + (-1.0);
        _1590 = _1636;
    }
    float _1638 = _1590;
    float _1640 = _1638;
    if (_1542)
    {
        float _1642 = _1530 * _1628;
        _1554 = _1642;
    }
    float _1644 = _1554;
    if (_1542)
    {
        float _1646 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1570 = _1646;
    }
    float _1648 = _1570;
    if (!_1542)
    {
        _1640 = _1532;
    }
    float _1650 = _1640;
    float _1652 = _1650;
    if (_1542)
    {
        float _1654 = _1532 * _1628;
        _1652 = _1654;
    }
    float _1656 = _1652;
    if (_1542)
    {
        float _1658 = _1644 * _1644;
        _1632 = _1658;
    }
    float _1660 = _1632;
    if (_1542)
    {
        float _1662 = fma(_1602, _1596, _1648);
        _1624 = _1662;
    }
    float _1664 = _1624;
    if (!_1542)
    {
        _1634 = _1536;
    }
    float _1666 = _1634;
    float _1668 = _1666;
    if (_1542)
    {
        float _1670 = _1656 * _1656;
        _1668 = _1670;
    }
    float _1672 = _1668;
    float _1674 = fma(_1664, _1664, _1660);
    float _1676 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1678 = _1674 + _1672;
    float _1680 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1684 = fma(_1610, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1682);
    float _1686 = precise::clamp(_1684, 0.0, 1.0);
    float _1688 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1690 = rsqrt(_1678);
    float _1692 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1680);
    float _1694 = -_1686;
    float _1696 = _1694 + 1.0;
    float _1698 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1688);
    float _1700 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1676);
    float _1702 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1692);
    float _1704 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1706 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1698);
    float _1708 = abs(_1696);
    float _1710 = log2(_1708);
    float _1712 = _1702 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1714 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1704);
    float _1716 = _1706 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1718 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1720 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1714);
    float _1722 = _1690 * _1664;
    float _1724 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1726 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1728 = _1690 * _1644;
    float _1730 = -_1718;
    float _1732 = fma(_1730, _1608, 1.0);
    float _1734 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1700);
    float _1736 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1724);
    float _1738 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1740 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1742 = _1690 * _1656;
    float _1744 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1746 = -_1738;
    float _1748 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1746);
    float _1750 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1736);
    float _1752 = log2(_1732);
    float _1754 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1756 = -_1742;
    float _1758 = fma(_1756, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1748);
    float _1760 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1750);
    float _1762 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1764 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1754);
    float _1766 = fma(_1758, -0.5, 0.5);
    float _1768 = exp2(_1740);
    float _1770 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1762);
    float _1772 = _1722 + 1.0;
    float _1774 = fma(_1758, 0.5, 0.5);
    float _1776 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1764);
    float _1778 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1770);
    float _1780 = fma(_1774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1782 = 1.0 / _1760;
    float _1784 = fma(_1774, _1780, -0.212114393711090087890625);
    float _1786 = fma(_1774, _1784, 1.570728778839111328125);
    float _1788 = sqrt(_1766);
    float _1790 = -_1722;
    float _1792 = fma(_1768, _1772, _1790);
    float _1794 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1778);
    float _1796 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1776);
    float _1798 = _1752 * 0.693147182464599609375;
    float _1800 = _1794 * _1782;
    float _1802 = _1796 * _1782;
    float _1804 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1806 = fma(_1800, 0.5, 0.5);
    float _1808 = fma(_1802, -0.5, 0.5);
    float _1810 = fma(_1792, 0.5, 0.5);
    float _1812 = _1788 * 0.636619746685028076171875;
    float3 _4752 = float3(_1806, _1808, _1804);
    float _1814 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4752, float3(0.0), isnan(_4752)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4752, float3(0.0), isnan(_4752)), level(0.0)).x;
    float _1816 = -_1786;
    float _1818 = fma(_1812, _1816, 1.0);
    float3 _4768 = float3(_1806, _1808, _1804);
    float4 _1821 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4768, float3(0.0), isnan(_4768)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4768, float3(0.0), isnan(_4768)), level(0.0)).xyzw;
    float _1823 = _1821.x;
    float _1825 = _1821.y;
    float _1827 = _1821.z;
    float _1829 = _1821.w;
    float2 _4785 = float2(_1818, _1810);
    float3 _1833 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4785, float2(0.0), isnan(_4785)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4785, float2(0.0), isnan(_4785)), level(0.0)).xyz;
    float _1835 = _1833.x;
    float _1837 = _1833.y;
    float _1839 = _1833.z;
    float _1841 = in.m_67.y;
    float _1843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1845 = _158 > 0.5;
    float _1847 = in.m_51.w;
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1851 = _1849 != 0;
    bool _1853 = _174 > 0.5;
    float _1855 = in.m_67.x;
    int _1857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1859 = _1857 != 0;
    float _1861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1865 = _1863 != 0;
    out.m_69.x = _1504;
    out.m_69.y = _1502;
    out.m_69.z = _1506;
    int _1867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1869 = _1867 != 0;
    int _1871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1873 = _1871 != 0;
    float _1875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1877 = -_1841;
    float _1879 = _1877 + 1.0;
    float _1881 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1885 = _1845 ? as_type<int>(_1879) : as_type<int>(_1841);
    float _1887 = _1851 ? as_type<float>(_1885) : _1841;
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1891 = _1889 != 0;
    float _1893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1895 = _1853 ? as_type<int>(_1879) : as_type<int>(_1841);
    float _1897 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1899 = _1841;
    bool _1901 = _1859;
    if (!_1865)
    {
        _1897 = _1855;
    }
    float _1903 = _1897;
    float _1905 = _1891 ? as_type<float>(_1895) : _1841;
    float _1907 = fma(_1881, _1887, -0.5);
    bool _1909 = _1847 > 0.5;
    float _1911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1913 = _1903;
    if (!_1865)
    {
        _246 = _1903;
    }
    float _1915 = _246;
    float _1917 = _1875 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1919 = as_type<int>(_1917);
    int _1921 = as_type<int>(_1875);
    float _1923 = _1915;
    if (_1859)
    {
        float _1925 = _1909 ? _1879 : _1841;
        _1899 = _1925;
    }
    float _1927 = _1899;
    float _1929 = _1843 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1865)
    {
        _1913 = _1855;
    }
    float _1931 = _1913;
    float _1933 = fma(_1905, _1917, -0.5);
    float _1935 = -_364;
    float _1937 = fma(_584, _1907, _1935);
    float _1939 = fma(_1929, _1927, -0.5);
    if (_1865)
    {
        bool _1941 = _154 > 0.5;
        _1901 = _1941;
    }
    bool _1943 = _1901;
    if (_1869)
    {
        float _1945 = -_1931;
        float _1947 = _1945 + 1.0;
        _1919 = as_type<int>(_1947);
    }
    int _1949 = _1919;
    if (_1873)
    {
        float _1951 = -_1931;
        float _1953 = _1951 + 1.0;
        _1921 = as_type<int>(_1953);
    }
    int _1955 = _1921;
    float _1957 = -_570;
    float _1959 = fma(_442, _1939, _1957);
    float _1961 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_1869)
    {
        _600 = _1931;
    }
    float _1963 = _600;
    float _1965 = _1883 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1967 = _1963;
    if (!_1873)
    {
        _204 = _1931;
    }
    float _1969 = _204;
    float _1971 = _1969;
    if (_1865)
    {
        float _1973 = -_1931;
        float _1975 = _1973 + 1.0;
        _374 = as_type<int>(_1975);
    }
    int _1977 = _374;
    if (_1869)
    {
        float _1979 = _1853 ? as_type<float>(_1949) : _1931;
        _1967 = _1979;
    }
    float _1981 = _1967;
    float _1983 = exp2(_1961);
    if (_1873)
    {
        float _1985 = _1845 ? as_type<float>(_1955) : _1931;
        _1971 = _1985;
    }
    float _1987 = _1971;
    float _1989 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1991 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1865)
    {
        float _1993 = _1943 ? as_type<float>(_1977) : _1931;
        _1923 = _1993;
    }
    float _1995 = _1923;
    float _1997 = _1386 * _1376;
    float _1999 = fma(_1989, _1981, -0.5);
    float _2001 = fma(_1991, _1987, -0.5);
    float _2003 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2005 = in.m_71.w;
    float _2007 = fma(_426, _1999, _522);
    float _2009 = fma(_590, _2001, _436);
    float _2011 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2003);
    float _2013 = -_596;
    float _2015 = fma(_594, _1933, _2013);
    float _2017 = _1386 * _1394;
    float _2019 = _2009 + 0.5;
    float _2021 = -_1983;
    float _2023 = _2021 + 1.0;
    float _2025 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2011);
    float _2027 = -_1997;
    float _2029 = fma(_1398, _1394, _2027);
    float _2031 = _2015 + 0.5;
    float _2033 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2035 = fma(_1398, _1376, _2017);
    float _2037 = _1794 + _1760;
    float _2039 = fma(_1965, _1995, -0.5);
    float _2041 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2025);
    float _2043 = _1760 * 0.5;
    out.m_73.x = _2035;
    out.m_73.y = _1440;
    out.m_73.z = _2029;
    float _2045 = _2037 * 0.5;
    float _2047 = fma(_554, _2039, _360);
    float _2049 = _2041 + _1760;
    float _2051 = _2007 + 0.5;
    float _2053 = _2047 + 0.5;
    float _2055 = _1937 + 0.5;
    float _2057 = _1959 + 0.5;
    float _2059 = _2049 * 0.5;
    float _2061 = fma(_1796, -0.5, _2043);
    float _2063 = -_2033;
    float _2065 = _2063 + 1.0;
    float _2067 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.w = _2005;
    out.m_77.x = _2053;
    out.m_77.y = _2055;
    out.m_77.z = _2051;
    out.m_77.w = _2057;
    out.m_79.x = _2019;
    out.m_79.y = _2031;
    out.gl_Position.x = _1794;
    out.gl_Position.y = _1796;
    out.gl_Position.z = _2041;
    out.gl_Position.w = _1760;
    out.m_81.x = _2045;
    out.m_81.y = _2061;
    out.m_81.z = _2059;
    out.m_81.w = _1760;
    out.m_49.x = _2067;
    float _2069 = _2033 * _1814;
    float _2071 = _1829 * _2069;
    float _2073 = _1829 * _2065;
    float _2075 = _1839 * _2069;
    float _2077 = fma(_1835, _2071, _1823);
    float _2079 = fma(_1837, _2071, _1825);
    float _2081 = fma(_1829, _2075, _1827);
    out.m_83.x = _2077;
    out.m_83.y = _2079;
    out.m_83.z = _2081;
    out.m_83.w = _2073;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _116 = as_type<float>(_104);
    float _118 = _108;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_112)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2149 = as_type<float>(_126);
        out.gl_Position.z = _2149;
    }
    if (!_112)
    {
        return out;
    }
    bool _130 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_99);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = float(_104);
    bool _142 = _108 >= _140;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    if (_146)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _116;
    if (_146)
    {
        out.m_49.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _128 = as_type<int>(_150);
    }
    int _152 = _128;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2204 = as_type<float>(_152);
        out.gl_Position.z = _2204;
    }
    if (_146)
    {
        return out;
    }
    float _154 = in.m_51.x;
    float _156 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_51.y;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _162 = _160 != 0;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_51.z;
    float _176 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _178 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _180 = precise::max(_176, _178);
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _184 = _180 >= 16.0;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _188 = 0.0;
    float _190 = _156;
    if (!_172)
    {
        float _192 = _156 * _156;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _154 * 2.0;
    float _200 = _154 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _202 = _196;
    float _204 = _154;
    if (!_172)
    {
        float _206 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _206;
    }
    float _208 = _202;
    float _210 = _158 * 2.0;
    float _212 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _214 = floor(_198);
    float _216 = -_182;
    float _218 = fma(_200, 2.0, _216);
    float _220 = fma(_212, -2.0, _186);
    float _222 = floor(_210);
    bool _224 = _214 > 0.0;
    bool _226 = _214 >= 0.0;
    bool _228 = isnan(_214);
    bool _230 = _226 || _228;
    bool _232 = isnan(0.0);
    bool _234 = _230 || _232;
    float _236 = _174 * 2.0;
    float _238 = floor(_236);
    bool _240 = !_172;
    float _242 = _208;
    float _244 = _238;
    float _246 = _174;
    if (!_240)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = _156 * _250;
        float _260 = 1.0 / _254;
        float _262 = _256 * 0.693147182464599609375;
        float _264 = exp2(_258);
        float _266 = 1.0 / _262;
        float _268 = _264 + (-1.0);
        float _270 = -_268;
        float _272 = fma(_270, _266, _156);
        float _274 = _272 * _260;
        float _276 = _274 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _242 = _276;
    }
    float _278 = _242;
    bool _280 = !_172;
    if (!_280)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = 1.0 / _288;
        float _292 = _156 * _284;
        float _294 = exp2(_292);
        float _296 = -_294;
        float _298 = _296 + 1.0;
        float _300 = _298 * _290;
        _190 = _300;
    }
    float _302 = _190;
    bool _304 = _222 >= 0.0;
    bool _306 = isnan(_222);
    bool _308 = _304 || _306;
    bool _310 = isnan(0.0);
    bool _312 = _308 || _310;
    float _314 = _158 + _174;
    int _316 = _234 ? 0 : 1;
    float _318 = _158 + _154;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _322 = _320 != 0;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _326 = _324 != 0;
    int _328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _330 = _328 != 0;
    float _332 = _314 + (-1.0);
    float _334 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _336 = log2(_334);
    int _338 = _312 ? 0 : 1;
    float _340 = _318 + (-1.0);
    bool _342 = !_322;
    int _344 = _342 ? 0 : 1;
    float _346 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _348 = _238 >= 0.0;
    bool _350 = isnan(_238);
    bool _352 = _348 || _350;
    bool _354 = isnan(0.0);
    bool _356 = _352 || _354;
    float _358 = -_108;
    float _360 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[76].x, _218);
    bool _362 = _222 > 0.0;
    float _364 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[76].y, _220);
    int _366 = _356 ? 0 : 1;
    float _368 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    bool _370 = _238 > 0.0;
    float _372 = _332;
    int _374 = as_type<int>(_364);
    if (_162)
    {
        _372 = _154;
    }
    float _376 = _372;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _380 = _376;
    float _382 = _378;
    if (!_162)
    {
        _380 = _174;
    }
    float _384 = _380;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (!_162)
    {
        _244 = _158;
    }
    float _390 = _244;
    float _392 = _384 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _394 = _390;
    if (_162)
    {
        _394 = _154;
    }
    float _396 = _394;
    float _398 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _400 = -_386;
    float _402 = fma(_392, 2.0, _400);
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_162)
    {
        _388 = _174;
    }
    float _406 = _388;
    float _408 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[83].z, _378);
    float _410 = _396 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _412 = ~_366;
    int _414 = _412 + 1;
    int _416 = _414 + 1;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _420 = _406;
    int _422 = _416;
    if (_162)
    {
        _420 = _158;
    }
    float _424 = _420;
    float _426 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _408);
    if (!_370)
    {
        int _428 = ~_366;
        int _430 = _428 + 1;
        _422 = _430;
    }
    int _432 = _422;
    float _434 = -_108;
    float _436 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[86].x, _402);
    if (!_162)
    {
        _404 = _174;
    }
    float _438 = _404;
    float _440 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[83].w, _418);
    float _442 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _440);
    float _444 = _438;
    if (_162)
    {
        _382 = _158;
    }
    float _446 = _382;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _450 = _446;
    if (_162)
    {
        _444 = _158;
    }
    float _452 = _444;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _456 = abs(_344);
    float _458 = _154 + (-0.5);
    if (!_162)
    {
        _450 = _154;
    }
    float _460 = _450;
    float _462 = _452 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _464 = ~_316;
    int _466 = _464 + 1;
    int _468 = _466 + 1;
    float _470 = _460 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _472 = float(_432);
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _476 = float(_456);
    float _478 = fma(_462, -2.0, _448);
    int _480 = _468;
    if (!_224)
    {
        int _482 = ~_316;
        int _484 = _482 + 1;
        _480 = _484;
    }
    int _486 = _480;
    float _488 = _336 * _108;
    float _490 = fma(_470, -2.0, _454);
    float _492 = _476 * _472;
    float _494 = -_474;
    float _496 = fma(_410, 2.0, _494);
    float _498 = in.m_53.x;
    float _500 = in.m_53.y;
    float _502 = in.m_53.z;
    int _504 = ~_338;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    float _510 = exp2(_488);
    int _512 = _508;
    if (!_362)
    {
        int _514 = ~_338;
        int _516 = _514 + 1;
        _512 = _516;
    }
    int _518 = _512;
    float _520 = -_108;
    float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[81].x, _496);
    bool _524 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _526 = isnan(1.0);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _532 = _528 || _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _536 = 1.0 + _534;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _540 = 1.0 / _536;
    float _542 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[78].z, _538);
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _546 = -_510;
    float _548 = _546 + 1.0;
    bool _550 = !_326;
    int _552 = _550 ? 0 : 1;
    float _554 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].z, _542);
    bool _556 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _558 = isnan(0.0);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _564 = _560 || _562;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _570 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _478);
    float _572 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].w, _544);
    float _574 = _492 * (-2.0);
    int _576 = abs(_552);
    float _578 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[88].z, _566);
    float _580 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[88].w, _568);
    float _582 = _564 ? _548 : 0.0;
    float _584 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].w, _572);
    float _586 = fma(_574, _498, _498);
    float _588 = float(_486);
    float _590 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].z, _578);
    float _592 = float(_576);
    float _594 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].w, _580);
    float _596 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[86].y, _490);
    bool _598 = _532;
    float _600 = _584;
    if (_532)
    {
        float _602 = _582 * _540;
        _118 = _602;
    }
    float _604 = _118;
    float _606 = fma(_398, _574, _398);
    float _608 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[196].x, _586);
    float _610 = _592 * _588;
    float _612 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    bool _614 = !_330;
    int _616 = _614 ? 0 : 1;
    float _618 = fma(_606, _604, _608);
    float _620 = _184 ? _368 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _622 = _174 + _154;
    float _624 = _184 ? _612 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _626 = in.m_55.x;
    float _628 = in.m_55.y;
    float _630 = in.m_55.z;
    float _632 = abs(_620);
    bool _634 = _632 != 0.0;
    bool _636 = isnan(_632);
    bool _638 = _634 || _636;
    bool _640 = isnan(0.0);
    bool _642 = _638 || _640;
    float _644 = _622 + (-1.0);
    int _646 = abs(_616);
    float _648 = _618 * 0.15915493667125701904296875;
    float _650 = abs(_624);
    bool _652 = _650 == 0.0;
    bool _654 = !_642;
    bool _656 = _652 && _654;
    float _658 = _610 * (-2.0);
    float _660 = float(_518);
    float _662 = _648 * 6.283185482025146484375;
    float _664 = sin(_662);
    float _666 = in.m_57.x;
    float _668 = in.m_57.y;
    float _670 = in.m_57.z;
    float _672 = float(_646);
    float _674 = fma(_346, _658, _346);
    float _676 = abs(_624);
    bool _678 = _676 == 0.0;
    float _680 = fma(_658, _500, _500);
    float _682 = _672 * _660;
    float _684 = _158 + (-0.5);
    int _686 = as_type<int>(_684);
    bool _688 = _678;
    if (_656)
    {
        bool _690 = as_type<int>(_624) >= 0;
        _598 = _690;
    }
    bool _692 = _598;
    float _694 = _682 * (-2.0);
    float _696 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _698 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[196].y, _680);
    int _700 = _692 ? (-1) : 0;
    if (_656)
    {
        int _702 = _692 ? 0 : 1078530011;
        _686 = _702;
    }
    int _704 = _686;
    float _706 = fma(_694, _502, _502);
    float _708 = _174 + (-0.5);
    float _710 = fma(_696, _694, _696);
    float _712 = fma(_674, _604, _698);
    int _714 = _704;
    if (_656)
    {
        int _716 = int(0x80000000) & as_type<int>(_620);
        int _718 = _704 | _716;
        _714 = _718;
    }
    int _720 = _714;
    float _722 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].z, _706);
    bool _724 = !_642;
    bool _726 = _724 && _678;
    int _728 = _720;
    float _730 = as_type<float>(_720);
    if (!_726)
    {
        float _732 = abs(_620);
        bool _734 = _732 != as_type<float>(0x7f800000u /* inf */);
        bool _736 = isnan(_732);
        bool _738 = _734 || _736;
        bool _740 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _742 = _738 || _740;
        float _744 = abs(_624);
        bool _746 = _744 == as_type<float>(0x7f800000u /* inf */);
        float _748 = abs(_624);
        bool _750 = _748 == as_type<float>(0x7f800000u /* inf */);
        bool _752 = !_742;
        bool _754 = _750 && _752;
        _688 = _746;
        if (_754)
        {
            bool _756 = as_type<int>(_624) >= 0;
            _700 = _756 ? (-1) : 0;
        }
        int _758 = _700;
        if (_754)
        {
            _728 = 1075235812;
        }
        int _760 = _728;
        int _762 = _760;
        if (_754)
        {
            int _764 = ~_758;
            int _766 = (_764 != 0) ? _760 : 1061752795;
            _762 = _766;
        }
        int _768 = _762;
        float _770 = as_type<float>(_768);
        if (_754)
        {
            int _772 = int(0x80000000) & as_type<int>(_620);
            int _774 = _768 | _772;
            _770 = as_type<float>(_774);
        }
        float _776 = _770;
        bool _778 = !_742;
        bool _780 = _778 && _746;
        _730 = _776;
        if (!_780)
        {
            float _782 = abs(_620);
            float _784 = abs(_624);
            float _786 = precise::max(_782, _784);
            float _788 = abs(_620);
            float _790 = abs(_624);
            float _792 = precise::min(_788, _790);
            float _794 = 1.0 / _786;
            float _796 = abs(_620);
            float _798 = abs(_624);
            bool _800 = _796 > _798;
            bool _802 = as_type<int>(_624) >= 0;
            float _804 = abs(_620);
            float _806 = abs(_624);
            float _808 = _804 + _806;
            int _810 = as_type<int>(_620) & int(0x80000000);
            bool _812 = _808 > as_type<float>(0x7f800000u /* inf */);
            bool _814 = isnan(_808);
            bool _816 = _812 || _814;
            bool _818 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _820 = _816 || _818;
            float _822 = _792 * _794;
            float _824 = _822 * _822;
            float _826 = _824 + 11.33538818359375;
            float _828 = fma(_824, _826, 28.84246826171875);
            float _830 = fma(_824, _828, 19.6966705322265625);
            float _832 = fma(_824, -0.82336294651031494140625, -5.674867153167724609375);
            float _834 = fma(_824, _832, -6.565555095672607421875);
            float _836 = 1.0 / _830;
            float _838 = _824 * _834;
            float _840 = _822 * _838;
            float _842 = fma(_840, _836, _822);
            float _844 = _842;
            _730 = _808;
            if (_800)
            {
                float _846 = -_842;
                float _848 = _846 + 1.57079637050628662109375;
                _844 = _848;
            }
            float _850 = _844;
            int _852 = as_type<int>(_850);
            if (!_802)
            {
                float _854 = -_850;
                float _856 = _854 + 3.1415927410125732421875;
                _852 = as_type<int>(_856);
            }
            int _858 = _852;
            if (!_820)
            {
                int _860 = _810 | _858;
                _730 = as_type<float>(_860);
            }
        }
    }
    float _862 = _730;
    bool _864 = _688;
    float _866 = fma(_710, _604, _722);
    float _868 = _712 + _862;
    float _870 = in.m_55.w;
    float _872 = _626 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _874 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _876 = in.m_44.x;
    float _878 = in.m_44.y;
    float _880 = in.m_44.z;
    float _882 = _868 * 0.15915493667125701904296875;
    float _884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _666);
    float _886 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _888 = in.m_42.x;
    float _890 = in.m_42.y;
    float _892 = in.m_42.z;
    float _894 = _866 * 0.15915493667125701904296875;
    float _896 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _898 = _884 * _886;
    float _900 = in.m_59.x;
    float _902 = in.m_59.y;
    float _904 = in.m_59.z;
    float _906 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _908 = _630 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _910 = _648 * 6.283185482025146484375;
    float _912 = cos(_910);
    float _914 = in.m_61.x;
    float _916 = in.m_61.y;
    float _918 = in.m_61.z;
    float _920 = _628 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _668);
    float _924 = _908 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _926 = in.m_63.x;
    float _928 = in.m_63.y;
    float _930 = in.m_63.z;
    float _932 = _920 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _934 = _882 * 6.283185482025146484375;
    float _936 = sin(_934);
    float _938 = _922 * _932;
    float _940 = fma(_302, _876, _906);
    float _942 = fma(_302, _878, _874);
    float _944 = fma(_302, _880, _896);
    float _946 = _882 * 6.283185482025146484375;
    float _948 = cos(_946);
    float _950 = fma(_940, _870, _888);
    float _952 = fma(_942, _870, _890);
    float _954 = fma(_944, _870, _892);
    float _956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _670);
    float _958 = _952 * _902;
    float _960 = _894 * 6.283185482025146484375;
    float _962 = cos(_960);
    float _964 = _952 * _916;
    float _966 = fma(_950, _900, _958);
    float _968 = _664 * _936;
    float _970 = _912 * _936;
    float _972 = _952 * _928;
    float _974 = fma(_950, _914, _964);
    float _976 = fma(_954, _904, _966);
    float _978 = _894 * 6.283185482025146484375;
    float _980 = sin(_978);
    float _982 = _912 * _948;
    float _984 = fma(_950, _926, _972);
    float _986 = _956 * _924;
    float _988 = _664 * _948;
    float _990 = fma(_954, _918, _974);
    float _992 = fma(_954, _930, _984);
    float _994 = _912 * _962;
    float _996 = _664 * _962;
    float _998 = _936 * _962;
    float _1000 = _948 * _962;
    float _1002 = _992 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1004 = _996 * _938;
    float _1006 = fma(_980, _982, _968);
    float _1008 = fma(_980, _968, _982);
    float _1010 = _994 * _938;
    float _1012 = -_938;
    float _1014 = _980 * _1012;
    float _1016 = -_970;
    float _1018 = fma(_980, _988, _1016);
    float _1020 = -_988;
    float _1022 = fma(_980, _970, _1020);
    float _1024 = fma(_1006, _898, _1010);
    float _1026 = fma(_1000, _898, _1014);
    float _1028 = _976 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1030 = fma(_1018, _898, _1004);
    float _1032 = fma(_1022, _986, _1024);
    float _1034 = fma(_998, _986, _1026);
    float _1036 = fma(_1008, _986, _1030);
    float _1038 = _1032 + _1002;
    float _1040 = _1034 + _1028;
    float _1042 = _990 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1044 = -_1038;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1048 = -_1040;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1052 = _1036 + _1042;
    float _1054 = _1046 * _1046;
    float _1056 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1058 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1056;
    float _1060 = fma(_1050, _1050, _1054);
    float _1062 = -_1052;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1066 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1068 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1066;
    float _1070 = fma(_1064, _1064, _1060);
    float _1072 = abs(_1058);
    float _1074 = abs(_1068);
    float _1076 = precise::max(_1072, _1074);
    float _1078 = sqrt(_1070);
    bool _1080 = _1076 >= 16.0;
    float _1082 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1084 = _1082 * 3.2999999523162841796875;
    float _1086 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1088 = _1086 * 7.30000019073486328125;
    float _1090 = in.m_65.x;
    float _1092 = in.m_65.y;
    float _1094 = in.m_65.z;
    float _1096 = _1058;
    float _1098 = _1068;
    bool _1100 = _864;
    float _1102 = _918;
    float _1104 = _1038;
    if (_1080)
    {
        float _1106 = _1058 * 0.0625;
        _1096 = _1106;
    }
    float _1108 = _1096;
    float _1110 = fma(_1078, 13.0, _1084);
    if (_1080)
    {
        float _1112 = _1068 * 0.0625;
        _1098 = _1112;
    }
    float _1114 = _1098;
    float _1116 = fma(_1078, 22.299999237060546875, _1088);
    bool _1118 = _668 != 0.0;
    bool _1120 = isnan(_668);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan(0.0);
    bool _1126 = _1122 || _1124;
    float _1128 = _1110 * 0.01745329238474369049072265625;
    float _1130 = abs(_1108);
    bool _1132 = _1130 != 0.0;
    bool _1134 = isnan(_1130);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan(0.0);
    bool _1140 = _1136 || _1138;
    float _1142 = _1116 * 0.01745329238474369049072265625;
    float _1144 = abs(_1114);
    bool _1146 = _1144 == 0.0;
    float _1148 = _1128 * 0.15915493667125701904296875;
    float _1150 = abs(_1114);
    bool _1152 = _1150 == 0.0;
    bool _1154 = !_1140;
    bool _1156 = _1152 && _1154;
    float _1158 = _1142 * 0.15915493667125701904296875;
    bool _1160 = _666 == 0.0;
    bool _1162 = !_1126;
    bool _1164 = _1160 && _1162;
    float _1166 = _1148 * 6.283185482025146484375;
    float _1168 = sin(_1166);
    bool _1170 = _670 == 0.0;
    bool _1172 = _1170 && _1164;
    float _1174 = _1158 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    int _1178 = as_type<int>(_1142);
    if (_1156)
    {
        bool _1180 = as_type<int>(_1114) >= 0;
        _1100 = _1180;
    }
    bool _1182 = _1100;
    int _1184 = _1182 ? (-1) : 0;
    if (_1156)
    {
        int _1186 = _1182 ? 0 : 1078530011;
        _1178 = _1186;
    }
    int _1188 = _1178;
    int _1190 = _1188;
    if (_1156)
    {
        int _1192 = int(0x80000000) & as_type<int>(_1108);
        int _1194 = _1188 | _1192;
        _1102 = as_type<float>(_1194);
    }
    float _1196 = _1102;
    bool _1198 = !_1140;
    bool _1200 = _1198 && _1146;
    float _1202 = _1196;
    float _1204 = _1196;
    float _1206 = _1092;
    float _1208 = _1090;
    float _1210 = _1094;
    if (!_1200)
    {
        float _1212 = abs(_1108);
        bool _1214 = _1212 != as_type<float>(0x7f800000u /* inf */);
        bool _1216 = isnan(_1212);
        bool _1218 = _1214 || _1216;
        bool _1220 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1222 = _1218 || _1220;
        float _1224 = abs(_1114);
        bool _1226 = _1224 == as_type<float>(0x7f800000u /* inf */);
        float _1228 = abs(_1114);
        bool _1230 = _1228 == as_type<float>(0x7f800000u /* inf */);
        bool _1232 = !_1222;
        bool _1234 = _1230 && _1232;
        if (_1234)
        {
            bool _1236 = as_type<int>(_1114) >= 0;
            _1184 = _1236 ? (-1) : 0;
        }
        int _1238 = _1184;
        if (_1234)
        {
            _1190 = 1075235812;
        }
        int _1240 = _1190;
        int _1242 = _1240;
        if (_1234)
        {
            int _1244 = ~_1238;
            int _1246 = (_1244 != 0) ? _1240 : 1061752795;
            _1242 = _1246;
        }
        int _1248 = _1242;
        if (_1234)
        {
            int _1250 = int(0x80000000) & as_type<int>(_1108);
            int _1252 = _1248 | _1250;
            _1202 = as_type<float>(_1252);
        }
        float _1254 = _1202;
        bool _1256 = !_1222;
        bool _1258 = _1256 && _1226;
        _1204 = _1254;
        if (!_1258)
        {
            float _1260 = abs(_1108);
            float _1262 = abs(_1114);
            float _1264 = precise::max(_1260, _1262);
            float _1266 = abs(_1108);
            float _1268 = abs(_1114);
            float _1270 = precise::min(_1266, _1268);
            float _1272 = 1.0 / _1264;
            float _1274 = abs(_1108);
            float _1276 = abs(_1114);
            bool _1278 = _1274 > _1276;
            bool _1280 = as_type<int>(_1114) >= 0;
            float _1282 = _1270 * _1272;
            float _1284 = _1282 * _1282;
            float _1286 = _1284 + 11.33538818359375;
            float _1288 = fma(_1284, _1286, 28.84246826171875);
            float _1290 = fma(_1284, _1288, 19.6966705322265625);
            float _1292 = fma(_1284, -0.82336294651031494140625, -5.674867153167724609375);
            float _1294 = fma(_1284, _1292, -6.565555095672607421875);
            float _1296 = 1.0 / _1290;
            float _1298 = _1284 * _1294;
            float _1300 = abs(_1108);
            float _1302 = abs(_1114);
            float _1304 = _1300 + _1302;
            int _1306 = as_type<int>(_1108) & int(0x80000000);
            float _1308 = _1282 * _1298;
            bool _1310 = _1304 > as_type<float>(0x7f800000u /* inf */);
            bool _1312 = isnan(_1304);
            bool _1314 = _1310 || _1312;
            bool _1316 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1318 = _1314 || _1316;
            float _1320 = fma(_1308, _1296, _1282);
            float _1322 = _1320;
            _1204 = _1304;
            if (_1278)
            {
                float _1324 = -_1320;
                float _1326 = _1324 + 1.57079637050628662109375;
                _1322 = _1326;
            }
            float _1328 = _1322;
            int _1330 = as_type<int>(_1328);
            if (!_1280)
            {
                float _1332 = -_1328;
                float _1334 = _1332 + 3.1415927410125732421875;
                _1330 = as_type<int>(_1334);
            }
            int _1336 = _1330;
            if (!_1318)
            {
                int _1338 = _1306 | _1336;
                _1204 = as_type<float>(_1338);
            }
        }
    }
    float _1340 = _1204;
    if (!_1172)
    {
        float _1342 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1092);
        _1206 = _1342;
    }
    float _1344 = _1206;
    float _1346 = fma(_1078, 0.4166666567325592041015625, -0.666666686534881591796875);
    float _1348 = precise::clamp(_1346, 0.0, 1.0);
    float _1350 = _1340 * (-0.15915493667125701904296875);
    float _1352 = _1344;
    if (!_1172)
    {
        float _1354 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1090);
        _1208 = _1354;
    }
    float _1356 = _1208;
    float _1358 = -_1344;
    float _1360 = _980 * _1358;
    float _1362 = fma(_1348, -2.0, 3.0);
    float _1364 = _1348 * _1348;
    float _1366 = _1168 + _1176;
    float _1368 = _1356;
    if (!_1172)
    {
        float _1370 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1094);
        _1210 = _1370;
    }
    float _1372 = _1210;
    float _1374 = _1350 * 6.283185482025146484375;
    float _1376 = sin(_1374);
    float _1378 = fma(_1000, _1356, _1360);
    float _1380 = _996 * _1344;
    float _1382 = _1362 * _1364;
    float _1384 = _1366 * 0.100000001490116119384765625;
    float _1386 = fma(_998, _1372, _1378);
    float _1388 = fma(_1018, _1356, _1380);
    float _1390 = _994 * _1344;
    float _1392 = _1350 * 6.283185482025146484375;
    float _1394 = cos(_1392);
    float _1396 = _1382 * _1384;
    float _1398 = fma(_1008, _1372, _1388);
    float _1400 = fma(_1006, _1356, _1390);
    float _1402 = fma(_1386, _1396, _1040);
    float _1404 = fma(_1398, _1396, _1052);
    float _1406 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1408 = _1402 + _1406;
    float _1410 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1412 = _1404 + _1410;
    float _1414 = _1376 * _1408;
    float _1416 = _1394 * _1408;
    float _1418 = -_1414;
    float _1420 = fma(_1394, _1412, _1418);
    float _1422 = fma(_1376, _1412, _1416);
    float _1424 = _1420 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1426 = _1422 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1430 = _1424 + _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1434 = _1426 + _1432;
    float _1436 = _1430 * _1430;
    float _1438 = fma(_1434, _1434, _1436);
    float _1440 = fma(_1022, _1372, _1400);
    float _1442 = sqrt(_1438);
    float _1444 = fma(_1440, _1396, _1038);
    bool _1446 = _1442 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1448 = _1372;
    float _1450 = _1396;
    if (!_1446)
    {
        _1368 = _1426;
    }
    float _1452 = _1368;
    float _1454 = _1452;
    if (!_1446)
    {
        _1448 = _1424;
    }
    float _1456 = _1448;
    float _1458 = _1456;
    if (!_1446)
    {
        _1352 = _1444;
    }
    float _1460 = _1352;
    bool _1462 = !_1446;
    float _1464 = _1460;
    if (!_1462)
    {
        float _1466 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1470 = _1442 + _1468;
        float _1472 = _1444 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1474 = rsqrt(_1438);
        float _1476 = _1470 * _1466;
        float _1478 = _1476 * 0.15915493667125701904296875;
        float _1480 = _1478 * 6.283185482025146484375;
        float _1482 = cos(_1480);
        float _1484 = _1478 * 6.283185482025146484375;
        float _1486 = sin(_1484);
        float _1488 = _1482 + (-1.0);
        float _1490 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1492 = fma(_1486, _1472, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1494 = fma(_1444, _1482, _1490);
        float _1496 = _1474 * _1492;
        float _1498 = fma(_1434, _1496, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1500 = fma(_1430, _1496, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1464 = _1494;
        _1454 = _1498;
        _1458 = _1500;
    }
    float _1502 = _1464;
    float _1504 = _1454;
    float _1506 = _1458;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1510 = _1502 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1514 = _1504 + _1512;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1518 = _1506 + _1516;
    float _1520 = _1510 * _1510;
    float _1522 = fma(_1514, _1514, _1520);
    float _1524 = fma(_1518, _1518, _1522);
    float _1526 = rsqrt(_1524);
    float _1528 = _1526 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1530 = _1514 * _1528;
    float _1532 = _1518 * _1528;
    float _1534 = _1530 * _1530;
    float _1536 = _1532 * _1532;
    float _1538 = _1534 + _1536;
    float _1540 = sqrt(_1538);
    bool _1542 = _1540 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1546 = _1540 + _1544;
    float _1548 = _1426;
    float _1550 = _1546;
    float _1552 = _1510;
    float _1554 = _1530;
    if (_1542)
    {
        float _1556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1548 = _1556;
    }
    float _1558 = _1548;
    float _1560 = _1558;
    if (_1542)
    {
        float _1562 = _1546 * _1558;
        _1550 = _1562;
    }
    float _1564 = _1550;
    if (_1542)
    {
        float _1566 = rsqrt(_1538);
        _1560 = _1566;
    }
    float _1568 = _1560;
    float _1570 = _1568;
    if (_1542)
    {
        float _1572 = _1564 * 0.15915493667125701904296875;
        _1104 = _1572;
    }
    float _1574 = _1104;
    float _1576 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1578 = _1518;
    if (_1542)
    {
        float _1580 = _1574 * 6.283185482025146484375;
        float _1582 = sin(_1580);
        _1578 = _1582;
    }
    float _1584 = _1578;
    float _1586 = precise::max(0.0, _1576);
    float _1588 = _1434;
    float _1590 = _1586;
    if (_1542)
    {
        float _1592 = _1574 * 6.283185482025146484375;
        float _1594 = cos(_1592);
        _1588 = _1594;
    }
    float _1596 = _1588;
    float _1598 = -_1528;
    float _1600 = -_1586;
    float _1602 = fma(_1510, _1598, _1600);
    if (_1542)
    {
        float _1604 = _1602 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1552 = _1604;
    }
    float _1606 = _1552;
    float _1608 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1610 = sqrt(_1524);
    float _1612 = _1584;
    float _1614 = _1606;
    if (_1542)
    {
        float _1616 = fma(_1584, _1606, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1612 = _1616;
    }
    float _1618 = _1612;
    float _1620 = _1618;
    if (!_1542)
    {
        _1614 = _1602;
    }
    float _1622 = _1614;
    float _1624 = _1622;
    if (_1542)
    {
        float _1626 = _1568 * _1618;
        _1450 = _1626;
    }
    float _1628 = _1450;
    if (!_1542)
    {
        _1620 = _1534;
    }
    float _1630 = _1620;
    float _1632 = _1630;
    float _1634 = _1596;
    if (_1542)
    {
        float _1636 = _1596 + (-1.0);
        _1590 = _1636;
    }
    float _1638 = _1590;
    float _1640 = _1638;
    if (_1542)
    {
        float _1642 = _1530 * _1628;
        _1554 = _1642;
    }
    float _1644 = _1554;
    if (_1542)
    {
        float _1646 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1570 = _1646;
    }
    float _1648 = _1570;
    if (!_1542)
    {
        _1640 = _1532;
    }
    float _1650 = _1640;
    float _1652 = _1650;
    if (_1542)
    {
        float _1654 = _1532 * _1628;
        _1652 = _1654;
    }
    float _1656 = _1652;
    if (_1542)
    {
        float _1658 = _1644 * _1644;
        _1632 = _1658;
    }
    float _1660 = _1632;
    if (_1542)
    {
        float _1662 = fma(_1602, _1596, _1648);
        _1624 = _1662;
    }
    float _1664 = _1624;
    if (!_1542)
    {
        _1634 = _1536;
    }
    float _1666 = _1634;
    float _1668 = _1666;
    if (_1542)
    {
        float _1670 = _1656 * _1656;
        _1668 = _1670;
    }
    float _1672 = _1668;
    float _1674 = fma(_1664, _1664, _1660);
    float _1676 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1678 = _1674 + _1672;
    float _1680 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1684 = fma(_1610, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1682);
    float _1686 = precise::clamp(_1684, 0.0, 1.0);
    float _1688 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1690 = rsqrt(_1678);
    float _1692 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1680);
    float _1694 = -_1686;
    float _1696 = _1694 + 1.0;
    float _1698 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1688);
    float _1700 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1676);
    float _1702 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1692);
    float _1704 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1706 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1698);
    float _1708 = abs(_1696);
    float _1710 = log2(_1708);
    float _1712 = _1702 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1714 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1704);
    float _1716 = _1706 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1718 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1720 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1714);
    float _1722 = _1690 * _1664;
    float _1724 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1726 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1728 = _1690 * _1644;
    float _1730 = -_1718;
    float _1732 = fma(_1730, _1608, 1.0);
    float _1734 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1700);
    float _1736 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1724);
    float _1738 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1740 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1742 = _1690 * _1656;
    float _1744 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1746 = -_1738;
    float _1748 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1746);
    float _1750 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1736);
    float _1752 = log2(_1732);
    float _1754 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1756 = -_1742;
    float _1758 = fma(_1756, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1748);
    float _1760 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1750);
    float _1762 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1764 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1754);
    float _1766 = fma(_1758, -0.5, 0.5);
    float _1768 = exp2(_1740);
    float _1770 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1762);
    float _1772 = _1722 + 1.0;
    float _1774 = fma(_1758, 0.5, 0.5);
    float _1776 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1764);
    float _1778 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1770);
    float _1780 = fma(_1774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1782 = 1.0 / _1760;
    float _1784 = fma(_1774, _1780, -0.212114393711090087890625);
    float _1786 = fma(_1774, _1784, 1.570728778839111328125);
    float _1788 = sqrt(_1766);
    float _1790 = -_1722;
    float _1792 = fma(_1768, _1772, _1790);
    float _1794 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1778);
    float _1796 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1776);
    float _1798 = _1752 * 0.693147182464599609375;
    float _1800 = _1794 * _1782;
    float _1802 = _1796 * _1782;
    float _1804 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1806 = fma(_1800, 0.5, 0.5);
    float _1808 = fma(_1802, -0.5, 0.5);
    float _1810 = fma(_1792, 0.5, 0.5);
    float _1812 = _1788 * 0.636619746685028076171875;
    float3 _4752 = float3(_1806, _1808, _1804);
    float _1814 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4752, float3(0.0), isnan(_4752)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4752, float3(0.0), isnan(_4752)), level(0.0)).x;
    float _1816 = -_1786;
    float _1818 = fma(_1812, _1816, 1.0);
    float3 _4768 = float3(_1806, _1808, _1804);
    float4 _1821 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4768, float3(0.0), isnan(_4768)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4768, float3(0.0), isnan(_4768)), level(0.0)).xyzw;
    float _1823 = _1821.x;
    float _1825 = _1821.y;
    float _1827 = _1821.z;
    float _1829 = _1821.w;
    float2 _4785 = float2(_1818, _1810);
    float3 _1833 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4785, float2(0.0), isnan(_4785)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4785, float2(0.0), isnan(_4785)), level(0.0)).xyz;
    float _1835 = _1833.x;
    float _1837 = _1833.y;
    float _1839 = _1833.z;
    float _1841 = in.m_67.y;
    float _1843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1845 = _158 > 0.5;
    float _1847 = in.m_51.w;
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1851 = _1849 != 0;
    bool _1853 = _174 > 0.5;
    float _1855 = in.m_67.x;
    int _1857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1859 = _1857 != 0;
    float _1861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1865 = _1863 != 0;
    out.m_69.x = _1504;
    out.m_69.y = _1502;
    out.m_69.z = _1506;
    int _1867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1869 = _1867 != 0;
    int _1871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1873 = _1871 != 0;
    float _1875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1877 = -_1841;
    float _1879 = _1877 + 1.0;
    float _1881 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1885 = _1845 ? as_type<int>(_1879) : as_type<int>(_1841);
    float _1887 = _1851 ? as_type<float>(_1885) : _1841;
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1891 = _1889 != 0;
    float _1893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1895 = _1853 ? as_type<int>(_1879) : as_type<int>(_1841);
    float _1897 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1899 = _1841;
    bool _1901 = _1859;
    if (!_1865)
    {
        _1897 = _1855;
    }
    float _1903 = _1897;
    float _1905 = _1891 ? as_type<float>(_1895) : _1841;
    float _1907 = fma(_1881, _1887, -0.5);
    bool _1909 = _1847 > 0.5;
    float _1911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1913 = _1903;
    if (!_1865)
    {
        _246 = _1903;
    }
    float _1915 = _246;
    float _1917 = _1875 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1919 = as_type<int>(_1917);
    int _1921 = as_type<int>(_1875);
    float _1923 = _1915;
    if (_1859)
    {
        float _1925 = _1909 ? _1879 : _1841;
        _1899 = _1925;
    }
    float _1927 = _1899;
    float _1929 = _1843 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1865)
    {
        _1913 = _1855;
    }
    float _1931 = _1913;
    float _1933 = fma(_1905, _1917, -0.5);
    float _1935 = -_364;
    float _1937 = fma(_584, _1907, _1935);
    float _1939 = fma(_1929, _1927, -0.5);
    if (_1865)
    {
        bool _1941 = _154 > 0.5;
        _1901 = _1941;
    }
    bool _1943 = _1901;
    if (_1869)
    {
        float _1945 = -_1931;
        float _1947 = _1945 + 1.0;
        _1919 = as_type<int>(_1947);
    }
    int _1949 = _1919;
    if (_1873)
    {
        float _1951 = -_1931;
        float _1953 = _1951 + 1.0;
        _1921 = as_type<int>(_1953);
    }
    int _1955 = _1921;
    float _1957 = -_570;
    float _1959 = fma(_442, _1939, _1957);
    float _1961 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_1869)
    {
        _600 = _1931;
    }
    float _1963 = _600;
    float _1965 = _1883 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1967 = _1963;
    if (!_1873)
    {
        _204 = _1931;
    }
    float _1969 = _204;
    float _1971 = _1969;
    if (_1865)
    {
        float _1973 = -_1931;
        float _1975 = _1973 + 1.0;
        _374 = as_type<int>(_1975);
    }
    int _1977 = _374;
    if (_1869)
    {
        float _1979 = _1853 ? as_type<float>(_1949) : _1931;
        _1967 = _1979;
    }
    float _1981 = _1967;
    float _1983 = exp2(_1961);
    if (_1873)
    {
        float _1985 = _1845 ? as_type<float>(_1955) : _1931;
        _1971 = _1985;
    }
    float _1987 = _1971;
    float _1989 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1991 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1865)
    {
        float _1993 = _1943 ? as_type<float>(_1977) : _1931;
        _1923 = _1993;
    }
    float _1995 = _1923;
    float _1997 = _1386 * _1376;
    float _1999 = fma(_1989, _1981, -0.5);
    float _2001 = fma(_1991, _1987, -0.5);
    float _2003 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2005 = in.m_71.w;
    float _2007 = fma(_426, _1999, _522);
    float _2009 = fma(_590, _2001, _436);
    float _2011 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2003);
    float _2013 = -_596;
    float _2015 = fma(_594, _1933, _2013);
    float _2017 = _1386 * _1394;
    float _2019 = _2009 + 0.5;
    float _2021 = -_1983;
    float _2023 = _2021 + 1.0;
    float _2025 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2011);
    float _2027 = -_1997;
    float _2029 = fma(_1398, _1394, _2027);
    float _2031 = _2015 + 0.5;
    float _2033 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2035 = fma(_1398, _1376, _2017);
    float _2037 = _1794 + _1760;
    float _2039 = fma(_1965, _1995, -0.5);
    float _2041 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2025);
    float _2043 = _1760 * 0.5;
    out.m_73.x = _2035;
    out.m_73.y = _1440;
    out.m_73.z = _2029;
    float _2045 = _2037 * 0.5;
    float _2047 = fma(_554, _2039, _360);
    float _2049 = _2041 + _1760;
    float _2051 = _2007 + 0.5;
    float _2053 = _2047 + 0.5;
    float _2055 = _1937 + 0.5;
    float _2057 = _1959 + 0.5;
    float _2059 = _2049 * 0.5;
    float _2061 = fma(_1796, -0.5, _2043);
    float _2063 = -_2033;
    float _2065 = _2063 + 1.0;
    float _2067 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.w = _2005;
    out.m_77.x = _2053;
    out.m_77.y = _2055;
    out.m_77.z = _2051;
    out.m_77.w = _2057;
    out.m_79.x = _2019;
    out.m_79.y = _2031;
    out.gl_Position.x = _1794;
    out.gl_Position.y = _1796;
    out.gl_Position.z = _2041;
    out.gl_Position.w = _1760;
    out.m_81.x = _2045;
    out.m_81.y = _2061;
    out.m_81.z = _2059;
    out.m_81.w = _1760;
    out.m_49.x = _2067;
    float _2069 = _2033 * _1814;
    float _2071 = _1829 * _2069;
    float _2073 = _1829 * _2065;
    float _2075 = _1839 * _2069;
    float _2077 = fma(_1835, _2071, _1823);
    float _2079 = fma(_1837, _2071, _1825);
    float _2081 = fma(_1829, _2075, _1827);
    out.m_83.x = _2077;
    out.m_83.y = _2079;
    out.m_83.z = _2081;
    out.m_83.w = _2073;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _116 = as_type<float>(_104);
    float _118 = _108;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _114;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_112)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2149 = as_type<float>(_126);
        out.gl_Position.z = _2149;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _130 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_99);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = float(_104);
    bool _142 = _108 >= _140;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    if (_146)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _116;
    if (_146)
    {
        out.m_49.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _128 = as_type<int>(_150);
    }
    int _152 = _128;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2204 = as_type<float>(_152);
        out.gl_Position.z = _2204;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_51.x;
    float _156 = _108 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_51.y;
    int _160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _162 = _160 != 0;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_51.z;
    float _176 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _178 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _180 = precise::max(_176, _178);
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _184 = _180 >= 16.0;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _188 = 0.0;
    float _190 = _156;
    if (!_172)
    {
        float _192 = _156 * _156;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _154 * 2.0;
    float _200 = _154 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _202 = _196;
    float _204 = _154;
    if (!_172)
    {
        float _206 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _206;
    }
    float _208 = _202;
    float _210 = _158 * 2.0;
    float _212 = _158 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _214 = floor(_198);
    float _216 = -_182;
    float _218 = fma(_200, 2.0, _216);
    float _220 = fma(_212, -2.0, _186);
    float _222 = floor(_210);
    bool _224 = _214 > 0.0;
    bool _226 = _214 >= 0.0;
    bool _228 = isnan(_214);
    bool _230 = _226 || _228;
    bool _232 = isnan(0.0);
    bool _234 = _230 || _232;
    float _236 = _174 * 2.0;
    float _238 = floor(_236);
    bool _240 = !_172;
    float _242 = _208;
    float _244 = _238;
    float _246 = _174;
    if (!_240)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = _156 * _250;
        float _260 = 1.0 / _254;
        float _262 = _256 * 0.693147182464599609375;
        float _264 = exp2(_258);
        float _266 = 1.0 / _262;
        float _268 = _264 + (-1.0);
        float _270 = -_268;
        float _272 = fma(_270, _266, _156);
        float _274 = _272 * _260;
        float _276 = _274 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _242 = _276;
    }
    float _278 = _242;
    bool _280 = !_172;
    if (!_280)
    {
        float _282 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _284 = log2(_282);
        float _286 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _288 = _286 + 1.0;
        float _290 = 1.0 / _288;
        float _292 = _156 * _284;
        float _294 = exp2(_292);
        float _296 = -_294;
        float _298 = _296 + 1.0;
        float _300 = _298 * _290;
        _190 = _300;
    }
    float _302 = _190;
    bool _304 = _222 >= 0.0;
    bool _306 = isnan(_222);
    bool _308 = _304 || _306;
    bool _310 = isnan(0.0);
    bool _312 = _308 || _310;
    float _314 = _158 + _174;
    int _316 = _234 ? 0 : 1;
    float _318 = _158 + _154;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _322 = _320 != 0;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _326 = _324 != 0;
    int _328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _330 = _328 != 0;
    float _332 = _314 + (-1.0);
    float _334 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _336 = log2(_334);
    int _338 = _312 ? 0 : 1;
    float _340 = _318 + (-1.0);
    bool _342 = !_322;
    int _344 = _342 ? 0 : 1;
    float _346 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _348 = _238 >= 0.0;
    bool _350 = isnan(_238);
    bool _352 = _348 || _350;
    bool _354 = isnan(0.0);
    bool _356 = _352 || _354;
    float _358 = -_108;
    float _360 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[76].x, _218);
    bool _362 = _222 > 0.0;
    float _364 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[76].y, _220);
    int _366 = _356 ? 0 : 1;
    float _368 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    bool _370 = _238 > 0.0;
    float _372 = _332;
    int _374 = as_type<int>(_364);
    if (_162)
    {
        _372 = _154;
    }
    float _376 = _372;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _380 = _376;
    float _382 = _378;
    if (!_162)
    {
        _380 = _174;
    }
    float _384 = _380;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (!_162)
    {
        _244 = _158;
    }
    float _390 = _244;
    float _392 = _384 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _394 = _390;
    if (_162)
    {
        _394 = _154;
    }
    float _396 = _394;
    float _398 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _400 = -_386;
    float _402 = fma(_392, 2.0, _400);
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_162)
    {
        _388 = _174;
    }
    float _406 = _388;
    float _408 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[83].z, _378);
    float _410 = _396 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _412 = ~_366;
    int _414 = _412 + 1;
    int _416 = _414 + 1;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _420 = _406;
    int _422 = _416;
    if (_162)
    {
        _420 = _158;
    }
    float _424 = _420;
    float _426 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].z, _408);
    if (!_370)
    {
        int _428 = ~_366;
        int _430 = _428 + 1;
        _422 = _430;
    }
    int _432 = _422;
    float _434 = -_108;
    float _436 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[86].x, _402);
    if (!_162)
    {
        _404 = _174;
    }
    float _438 = _404;
    float _440 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[83].w, _418);
    float _442 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[82].w, _440);
    float _444 = _438;
    if (_162)
    {
        _382 = _158;
    }
    float _446 = _382;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _450 = _446;
    if (_162)
    {
        _444 = _158;
    }
    float _452 = _444;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _456 = abs(_344);
    float _458 = _154 + (-0.5);
    if (!_162)
    {
        _450 = _154;
    }
    float _460 = _450;
    float _462 = _452 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _464 = ~_316;
    int _466 = _464 + 1;
    int _468 = _466 + 1;
    float _470 = _460 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _472 = float(_432);
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _476 = float(_456);
    float _478 = fma(_462, -2.0, _448);
    int _480 = _468;
    if (!_224)
    {
        int _482 = ~_316;
        int _484 = _482 + 1;
        _480 = _484;
    }
    int _486 = _480;
    float _488 = _336 * _108;
    float _490 = fma(_470, -2.0, _454);
    float _492 = _476 * _472;
    float _494 = -_474;
    float _496 = fma(_410, 2.0, _494);
    float _498 = in.m_53.x;
    float _500 = in.m_53.y;
    float _502 = in.m_53.z;
    int _504 = ~_338;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    float _510 = exp2(_488);
    int _512 = _508;
    if (!_362)
    {
        int _514 = ~_338;
        int _516 = _514 + 1;
        _512 = _516;
    }
    int _518 = _512;
    float _520 = -_108;
    float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[81].x, _496);
    bool _524 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _526 = isnan(1.0);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _532 = _528 || _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _536 = 1.0 + _534;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _540 = 1.0 / _536;
    float _542 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[78].z, _538);
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _546 = -_510;
    float _548 = _546 + 1.0;
    bool _550 = !_326;
    int _552 = _550 ? 0 : 1;
    float _554 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].z, _542);
    bool _556 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _558 = isnan(0.0);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _564 = _560 || _562;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _570 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[81].y, _478);
    float _572 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[78].w, _544);
    float _574 = _492 * (-2.0);
    int _576 = abs(_552);
    float _578 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[88].z, _566);
    float _580 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[88].w, _568);
    float _582 = _564 ? _548 : 0.0;
    float _584 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[77].w, _572);
    float _586 = fma(_574, _498, _498);
    float _588 = float(_486);
    float _590 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].z, _578);
    float _592 = float(_576);
    float _594 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[87].w, _580);
    float _596 = fma(_108, (*spvDescriptorSet0.vp_c9)._m0[86].y, _490);
    bool _598 = _532;
    float _600 = _584;
    if (_532)
    {
        float _602 = _582 * _540;
        _118 = _602;
    }
    float _604 = _118;
    float _606 = fma(_398, _574, _398);
    float _608 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[196].x, _586);
    float _610 = _592 * _588;
    float _612 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    bool _614 = !_330;
    int _616 = _614 ? 0 : 1;
    float _618 = fma(_606, _604, _608);
    float _620 = _184 ? _368 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _622 = _174 + _154;
    float _624 = _184 ? _612 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _626 = in.m_55.x;
    float _628 = in.m_55.y;
    float _630 = in.m_55.z;
    float _632 = abs(_620);
    bool _634 = _632 != 0.0;
    bool _636 = isnan(_632);
    bool _638 = _634 || _636;
    bool _640 = isnan(0.0);
    bool _642 = _638 || _640;
    float _644 = _622 + (-1.0);
    int _646 = abs(_616);
    float _648 = _618 * 0.15915493667125701904296875;
    float _650 = abs(_624);
    bool _652 = _650 == 0.0;
    bool _654 = !_642;
    bool _656 = _652 && _654;
    float _658 = _610 * (-2.0);
    float _660 = float(_518);
    float _662 = _648 * 6.283185482025146484375;
    float _664 = sin(_662);
    float _666 = in.m_57.x;
    float _668 = in.m_57.y;
    float _670 = in.m_57.z;
    float _672 = float(_646);
    float _674 = fma(_346, _658, _346);
    float _676 = abs(_624);
    bool _678 = _676 == 0.0;
    float _680 = fma(_658, _500, _500);
    float _682 = _672 * _660;
    float _684 = _158 + (-0.5);
    int _686 = as_type<int>(_684);
    bool _688 = _678;
    if (_656)
    {
        bool _690 = as_type<int>(_624) >= 0;
        _598 = _690;
    }
    bool _692 = _598;
    float _694 = _682 * (-2.0);
    float _696 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _698 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[196].y, _680);
    int _700 = _692 ? (-1) : 0;
    if (_656)
    {
        int _702 = _692 ? 0 : 1078530011;
        _686 = _702;
    }
    int _704 = _686;
    float _706 = fma(_694, _502, _502);
    float _708 = _174 + (-0.5);
    float _710 = fma(_696, _694, _696);
    float _712 = fma(_674, _604, _698);
    int _714 = _704;
    if (_656)
    {
        int _716 = int(0x80000000) & as_type<int>(_620);
        int _718 = _704 | _716;
        _714 = _718;
    }
    int _720 = _714;
    float _722 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[196].z, _706);
    bool _724 = !_642;
    bool _726 = _724 && _678;
    int _728 = _720;
    float _730 = as_type<float>(_720);
    if (!_726)
    {
        float _732 = abs(_620);
        bool _734 = _732 != as_type<float>(0x7f800000u /* inf */);
        bool _736 = isnan(_732);
        bool _738 = _734 || _736;
        bool _740 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _742 = _738 || _740;
        float _744 = abs(_624);
        bool _746 = _744 == as_type<float>(0x7f800000u /* inf */);
        float _748 = abs(_624);
        bool _750 = _748 == as_type<float>(0x7f800000u /* inf */);
        bool _752 = !_742;
        bool _754 = _750 && _752;
        _688 = _746;
        if (_754)
        {
            bool _756 = as_type<int>(_624) >= 0;
            _700 = _756 ? (-1) : 0;
        }
        int _758 = _700;
        if (_754)
        {
            _728 = 1075235812;
        }
        int _760 = _728;
        int _762 = _760;
        if (_754)
        {
            int _764 = ~_758;
            int _766 = (_764 != 0) ? _760 : 1061752795;
            _762 = _766;
        }
        int _768 = _762;
        float _770 = as_type<float>(_768);
        if (_754)
        {
            int _772 = int(0x80000000) & as_type<int>(_620);
            int _774 = _768 | _772;
            _770 = as_type<float>(_774);
        }
        float _776 = _770;
        bool _778 = !_742;
        bool _780 = _778 && _746;
        _730 = _776;
        if (!_780)
        {
            float _782 = abs(_620);
            float _784 = abs(_624);
            float _786 = precise::max(_782, _784);
            float _788 = abs(_620);
            float _790 = abs(_624);
            float _792 = precise::min(_788, _790);
            float _794 = 1.0 / _786;
            float _796 = abs(_620);
            float _798 = abs(_624);
            bool _800 = _796 > _798;
            bool _802 = as_type<int>(_624) >= 0;
            float _804 = abs(_620);
            float _806 = abs(_624);
            float _808 = _804 + _806;
            int _810 = as_type<int>(_620) & int(0x80000000);
            bool _812 = _808 > as_type<float>(0x7f800000u /* inf */);
            bool _814 = isnan(_808);
            bool _816 = _812 || _814;
            bool _818 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _820 = _816 || _818;
            float _822 = _792 * _794;
            float _824 = _822 * _822;
            float _826 = _824 + 11.33538818359375;
            float _828 = fma(_824, _826, 28.84246826171875);
            float _830 = fma(_824, _828, 19.6966705322265625);
            float _832 = fma(_824, -0.82336294651031494140625, -5.674867153167724609375);
            float _834 = fma(_824, _832, -6.565555095672607421875);
            float _836 = 1.0 / _830;
            float _838 = _824 * _834;
            float _840 = _822 * _838;
            float _842 = fma(_840, _836, _822);
            float _844 = _842;
            _730 = _808;
            if (_800)
            {
                float _846 = -_842;
                float _848 = _846 + 1.57079637050628662109375;
                _844 = _848;
            }
            float _850 = _844;
            int _852 = as_type<int>(_850);
            if (!_802)
            {
                float _854 = -_850;
                float _856 = _854 + 3.1415927410125732421875;
                _852 = as_type<int>(_856);
            }
            int _858 = _852;
            if (!_820)
            {
                int _860 = _810 | _858;
                _730 = as_type<float>(_860);
            }
        }
    }
    float _862 = _730;
    bool _864 = _688;
    float _866 = fma(_710, _604, _722);
    float _868 = _712 + _862;
    float _870 = in.m_55.w;
    float _872 = _626 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _874 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _876 = in.m_44.x;
    float _878 = in.m_44.y;
    float _880 = in.m_44.z;
    float _882 = _868 * 0.15915493667125701904296875;
    float _884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _666);
    float _886 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _888 = in.m_42.x;
    float _890 = in.m_42.y;
    float _892 = in.m_42.z;
    float _894 = _866 * 0.15915493667125701904296875;
    float _896 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _898 = _884 * _886;
    float _900 = in.m_59.x;
    float _902 = in.m_59.y;
    float _904 = in.m_59.z;
    float _906 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _908 = _630 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _910 = _648 * 6.283185482025146484375;
    float _912 = cos(_910);
    float _914 = in.m_61.x;
    float _916 = in.m_61.y;
    float _918 = in.m_61.z;
    float _920 = _628 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _668);
    float _924 = _908 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _926 = in.m_63.x;
    float _928 = in.m_63.y;
    float _930 = in.m_63.z;
    float _932 = _920 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _934 = _882 * 6.283185482025146484375;
    float _936 = sin(_934);
    float _938 = _922 * _932;
    float _940 = fma(_302, _876, _906);
    float _942 = fma(_302, _878, _874);
    float _944 = fma(_302, _880, _896);
    float _946 = _882 * 6.283185482025146484375;
    float _948 = cos(_946);
    float _950 = fma(_940, _870, _888);
    float _952 = fma(_942, _870, _890);
    float _954 = fma(_944, _870, _892);
    float _956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _670);
    float _958 = _952 * _902;
    float _960 = _894 * 6.283185482025146484375;
    float _962 = cos(_960);
    float _964 = _952 * _916;
    float _966 = fma(_950, _900, _958);
    float _968 = _664 * _936;
    float _970 = _912 * _936;
    float _972 = _952 * _928;
    float _974 = fma(_950, _914, _964);
    float _976 = fma(_954, _904, _966);
    float _978 = _894 * 6.283185482025146484375;
    float _980 = sin(_978);
    float _982 = _912 * _948;
    float _984 = fma(_950, _926, _972);
    float _986 = _956 * _924;
    float _988 = _664 * _948;
    float _990 = fma(_954, _918, _974);
    float _992 = fma(_954, _930, _984);
    float _994 = _912 * _962;
    float _996 = _664 * _962;
    float _998 = _936 * _962;
    float _1000 = _948 * _962;
    float _1002 = _992 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1004 = _996 * _938;
    float _1006 = fma(_980, _982, _968);
    float _1008 = fma(_980, _968, _982);
    float _1010 = _994 * _938;
    float _1012 = -_938;
    float _1014 = _980 * _1012;
    float _1016 = -_970;
    float _1018 = fma(_980, _988, _1016);
    float _1020 = -_988;
    float _1022 = fma(_980, _970, _1020);
    float _1024 = fma(_1006, _898, _1010);
    float _1026 = fma(_1000, _898, _1014);
    float _1028 = _976 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1030 = fma(_1018, _898, _1004);
    float _1032 = fma(_1022, _986, _1024);
    float _1034 = fma(_998, _986, _1026);
    float _1036 = fma(_1008, _986, _1030);
    float _1038 = _1032 + _1002;
    float _1040 = _1034 + _1028;
    float _1042 = _990 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1044 = -_1038;
    float _1046 = _1044 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1048 = -_1040;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1052 = _1036 + _1042;
    float _1054 = _1046 * _1046;
    float _1056 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1058 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1056;
    float _1060 = fma(_1050, _1050, _1054);
    float _1062 = -_1052;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1066 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1068 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1066;
    float _1070 = fma(_1064, _1064, _1060);
    float _1072 = abs(_1058);
    float _1074 = abs(_1068);
    float _1076 = precise::max(_1072, _1074);
    float _1078 = sqrt(_1070);
    bool _1080 = _1076 >= 16.0;
    float _1082 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1084 = _1082 * 3.2999999523162841796875;
    float _1086 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1088 = _1086 * 7.30000019073486328125;
    float _1090 = in.m_65.x;
    float _1092 = in.m_65.y;
    float _1094 = in.m_65.z;
    float _1096 = _1058;
    float _1098 = _1068;
    bool _1100 = _864;
    float _1102 = _918;
    float _1104 = _1038;
    if (_1080)
    {
        float _1106 = _1058 * 0.0625;
        _1096 = _1106;
    }
    float _1108 = _1096;
    float _1110 = fma(_1078, 13.0, _1084);
    if (_1080)
    {
        float _1112 = _1068 * 0.0625;
        _1098 = _1112;
    }
    float _1114 = _1098;
    float _1116 = fma(_1078, 22.299999237060546875, _1088);
    bool _1118 = _668 != 0.0;
    bool _1120 = isnan(_668);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan(0.0);
    bool _1126 = _1122 || _1124;
    float _1128 = _1110 * 0.01745329238474369049072265625;
    float _1130 = abs(_1108);
    bool _1132 = _1130 != 0.0;
    bool _1134 = isnan(_1130);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan(0.0);
    bool _1140 = _1136 || _1138;
    float _1142 = _1116 * 0.01745329238474369049072265625;
    float _1144 = abs(_1114);
    bool _1146 = _1144 == 0.0;
    float _1148 = _1128 * 0.15915493667125701904296875;
    float _1150 = abs(_1114);
    bool _1152 = _1150 == 0.0;
    bool _1154 = !_1140;
    bool _1156 = _1152 && _1154;
    float _1158 = _1142 * 0.15915493667125701904296875;
    bool _1160 = _666 == 0.0;
    bool _1162 = !_1126;
    bool _1164 = _1160 && _1162;
    float _1166 = _1148 * 6.283185482025146484375;
    float _1168 = sin(_1166);
    bool _1170 = _670 == 0.0;
    bool _1172 = _1170 && _1164;
    float _1174 = _1158 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    int _1178 = as_type<int>(_1142);
    if (_1156)
    {
        bool _1180 = as_type<int>(_1114) >= 0;
        _1100 = _1180;
    }
    bool _1182 = _1100;
    int _1184 = _1182 ? (-1) : 0;
    if (_1156)
    {
        int _1186 = _1182 ? 0 : 1078530011;
        _1178 = _1186;
    }
    int _1188 = _1178;
    int _1190 = _1188;
    if (_1156)
    {
        int _1192 = int(0x80000000) & as_type<int>(_1108);
        int _1194 = _1188 | _1192;
        _1102 = as_type<float>(_1194);
    }
    float _1196 = _1102;
    bool _1198 = !_1140;
    bool _1200 = _1198 && _1146;
    float _1202 = _1196;
    float _1204 = _1196;
    float _1206 = _1092;
    float _1208 = _1090;
    float _1210 = _1094;
    if (!_1200)
    {
        float _1212 = abs(_1108);
        bool _1214 = _1212 != as_type<float>(0x7f800000u /* inf */);
        bool _1216 = isnan(_1212);
        bool _1218 = _1214 || _1216;
        bool _1220 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1222 = _1218 || _1220;
        float _1224 = abs(_1114);
        bool _1226 = _1224 == as_type<float>(0x7f800000u /* inf */);
        float _1228 = abs(_1114);
        bool _1230 = _1228 == as_type<float>(0x7f800000u /* inf */);
        bool _1232 = !_1222;
        bool _1234 = _1230 && _1232;
        if (_1234)
        {
            bool _1236 = as_type<int>(_1114) >= 0;
            _1184 = _1236 ? (-1) : 0;
        }
        int _1238 = _1184;
        if (_1234)
        {
            _1190 = 1075235812;
        }
        int _1240 = _1190;
        int _1242 = _1240;
        if (_1234)
        {
            int _1244 = ~_1238;
            int _1246 = (_1244 != 0) ? _1240 : 1061752795;
            _1242 = _1246;
        }
        int _1248 = _1242;
        if (_1234)
        {
            int _1250 = int(0x80000000) & as_type<int>(_1108);
            int _1252 = _1248 | _1250;
            _1202 = as_type<float>(_1252);
        }
        float _1254 = _1202;
        bool _1256 = !_1222;
        bool _1258 = _1256 && _1226;
        _1204 = _1254;
        if (!_1258)
        {
            float _1260 = abs(_1108);
            float _1262 = abs(_1114);
            float _1264 = precise::max(_1260, _1262);
            float _1266 = abs(_1108);
            float _1268 = abs(_1114);
            float _1270 = precise::min(_1266, _1268);
            float _1272 = 1.0 / _1264;
            float _1274 = abs(_1108);
            float _1276 = abs(_1114);
            bool _1278 = _1274 > _1276;
            bool _1280 = as_type<int>(_1114) >= 0;
            float _1282 = _1270 * _1272;
            float _1284 = _1282 * _1282;
            float _1286 = _1284 + 11.33538818359375;
            float _1288 = fma(_1284, _1286, 28.84246826171875);
            float _1290 = fma(_1284, _1288, 19.6966705322265625);
            float _1292 = fma(_1284, -0.82336294651031494140625, -5.674867153167724609375);
            float _1294 = fma(_1284, _1292, -6.565555095672607421875);
            float _1296 = 1.0 / _1290;
            float _1298 = _1284 * _1294;
            float _1300 = abs(_1108);
            float _1302 = abs(_1114);
            float _1304 = _1300 + _1302;
            int _1306 = as_type<int>(_1108) & int(0x80000000);
            float _1308 = _1282 * _1298;
            bool _1310 = _1304 > as_type<float>(0x7f800000u /* inf */);
            bool _1312 = isnan(_1304);
            bool _1314 = _1310 || _1312;
            bool _1316 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1318 = _1314 || _1316;
            float _1320 = fma(_1308, _1296, _1282);
            float _1322 = _1320;
            _1204 = _1304;
            if (_1278)
            {
                float _1324 = -_1320;
                float _1326 = _1324 + 1.57079637050628662109375;
                _1322 = _1326;
            }
            float _1328 = _1322;
            int _1330 = as_type<int>(_1328);
            if (!_1280)
            {
                float _1332 = -_1328;
                float _1334 = _1332 + 3.1415927410125732421875;
                _1330 = as_type<int>(_1334);
            }
            int _1336 = _1330;
            if (!_1318)
            {
                int _1338 = _1306 | _1336;
                _1204 = as_type<float>(_1338);
            }
        }
    }
    float _1340 = _1204;
    if (!_1172)
    {
        float _1342 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1092);
        _1206 = _1342;
    }
    float _1344 = _1206;
    float _1346 = fma(_1078, 0.4166666567325592041015625, -0.666666686534881591796875);
    float _1348 = precise::clamp(_1346, 0.0, 1.0);
    float _1350 = _1340 * (-0.15915493667125701904296875);
    float _1352 = _1344;
    if (!_1172)
    {
        float _1354 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1090);
        _1208 = _1354;
    }
    float _1356 = _1208;
    float _1358 = -_1344;
    float _1360 = _980 * _1358;
    float _1362 = fma(_1348, -2.0, 3.0);
    float _1364 = _1348 * _1348;
    float _1366 = _1168 + _1176;
    float _1368 = _1356;
    if (!_1172)
    {
        float _1370 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1094);
        _1210 = _1370;
    }
    float _1372 = _1210;
    float _1374 = _1350 * 6.283185482025146484375;
    float _1376 = sin(_1374);
    float _1378 = fma(_1000, _1356, _1360);
    float _1380 = _996 * _1344;
    float _1382 = _1362 * _1364;
    float _1384 = _1366 * 0.100000001490116119384765625;
    float _1386 = fma(_998, _1372, _1378);
    float _1388 = fma(_1018, _1356, _1380);
    float _1390 = _994 * _1344;
    float _1392 = _1350 * 6.283185482025146484375;
    float _1394 = cos(_1392);
    float _1396 = _1382 * _1384;
    float _1398 = fma(_1008, _1372, _1388);
    float _1400 = fma(_1006, _1356, _1390);
    float _1402 = fma(_1386, _1396, _1040);
    float _1404 = fma(_1398, _1396, _1052);
    float _1406 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1408 = _1402 + _1406;
    float _1410 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1412 = _1404 + _1410;
    float _1414 = _1376 * _1408;
    float _1416 = _1394 * _1408;
    float _1418 = -_1414;
    float _1420 = fma(_1394, _1412, _1418);
    float _1422 = fma(_1376, _1412, _1416);
    float _1424 = _1420 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1426 = _1422 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1430 = _1424 + _1428;
    float _1432 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1434 = _1426 + _1432;
    float _1436 = _1430 * _1430;
    float _1438 = fma(_1434, _1434, _1436);
    float _1440 = fma(_1022, _1372, _1400);
    float _1442 = sqrt(_1438);
    float _1444 = fma(_1440, _1396, _1038);
    bool _1446 = _1442 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1448 = _1372;
    float _1450 = _1396;
    if (!_1446)
    {
        _1368 = _1426;
    }
    float _1452 = _1368;
    float _1454 = _1452;
    if (!_1446)
    {
        _1448 = _1424;
    }
    float _1456 = _1448;
    float _1458 = _1456;
    if (!_1446)
    {
        _1352 = _1444;
    }
    float _1460 = _1352;
    bool _1462 = !_1446;
    float _1464 = _1460;
    if (!_1462)
    {
        float _1466 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1470 = _1442 + _1468;
        float _1472 = _1444 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1474 = rsqrt(_1438);
        float _1476 = _1470 * _1466;
        float _1478 = _1476 * 0.15915493667125701904296875;
        float _1480 = _1478 * 6.283185482025146484375;
        float _1482 = cos(_1480);
        float _1484 = _1478 * 6.283185482025146484375;
        float _1486 = sin(_1484);
        float _1488 = _1482 + (-1.0);
        float _1490 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1492 = fma(_1486, _1472, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1494 = fma(_1444, _1482, _1490);
        float _1496 = _1474 * _1492;
        float _1498 = fma(_1434, _1496, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1500 = fma(_1430, _1496, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1464 = _1494;
        _1454 = _1498;
        _1458 = _1500;
    }
    float _1502 = _1464;
    float _1504 = _1454;
    float _1506 = _1458;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1510 = _1502 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1514 = _1504 + _1512;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1518 = _1506 + _1516;
    float _1520 = _1510 * _1510;
    float _1522 = fma(_1514, _1514, _1520);
    float _1524 = fma(_1518, _1518, _1522);
    float _1526 = rsqrt(_1524);
    float _1528 = _1526 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1530 = _1514 * _1528;
    float _1532 = _1518 * _1528;
    float _1534 = _1530 * _1530;
    float _1536 = _1532 * _1532;
    float _1538 = _1534 + _1536;
    float _1540 = sqrt(_1538);
    bool _1542 = _1540 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1546 = _1540 + _1544;
    float _1548 = _1426;
    float _1550 = _1546;
    float _1552 = _1510;
    float _1554 = _1530;
    if (_1542)
    {
        float _1556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1548 = _1556;
    }
    float _1558 = _1548;
    float _1560 = _1558;
    if (_1542)
    {
        float _1562 = _1546 * _1558;
        _1550 = _1562;
    }
    float _1564 = _1550;
    if (_1542)
    {
        float _1566 = rsqrt(_1538);
        _1560 = _1566;
    }
    float _1568 = _1560;
    float _1570 = _1568;
    if (_1542)
    {
        float _1572 = _1564 * 0.15915493667125701904296875;
        _1104 = _1572;
    }
    float _1574 = _1104;
    float _1576 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1578 = _1518;
    if (_1542)
    {
        float _1580 = _1574 * 6.283185482025146484375;
        float _1582 = sin(_1580);
        _1578 = _1582;
    }
    float _1584 = _1578;
    float _1586 = precise::max(0.0, _1576);
    float _1588 = _1434;
    float _1590 = _1586;
    if (_1542)
    {
        float _1592 = _1574 * 6.283185482025146484375;
        float _1594 = cos(_1592);
        _1588 = _1594;
    }
    float _1596 = _1588;
    float _1598 = -_1528;
    float _1600 = -_1586;
    float _1602 = fma(_1510, _1598, _1600);
    if (_1542)
    {
        float _1604 = _1602 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1552 = _1604;
    }
    float _1606 = _1552;
    float _1608 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1610 = sqrt(_1524);
    float _1612 = _1584;
    float _1614 = _1606;
    if (_1542)
    {
        float _1616 = fma(_1584, _1606, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1612 = _1616;
    }
    float _1618 = _1612;
    float _1620 = _1618;
    if (!_1542)
    {
        _1614 = _1602;
    }
    float _1622 = _1614;
    float _1624 = _1622;
    if (_1542)
    {
        float _1626 = _1568 * _1618;
        _1450 = _1626;
    }
    float _1628 = _1450;
    if (!_1542)
    {
        _1620 = _1534;
    }
    float _1630 = _1620;
    float _1632 = _1630;
    float _1634 = _1596;
    if (_1542)
    {
        float _1636 = _1596 + (-1.0);
        _1590 = _1636;
    }
    float _1638 = _1590;
    float _1640 = _1638;
    if (_1542)
    {
        float _1642 = _1530 * _1628;
        _1554 = _1642;
    }
    float _1644 = _1554;
    if (_1542)
    {
        float _1646 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1570 = _1646;
    }
    float _1648 = _1570;
    if (!_1542)
    {
        _1640 = _1532;
    }
    float _1650 = _1640;
    float _1652 = _1650;
    if (_1542)
    {
        float _1654 = _1532 * _1628;
        _1652 = _1654;
    }
    float _1656 = _1652;
    if (_1542)
    {
        float _1658 = _1644 * _1644;
        _1632 = _1658;
    }
    float _1660 = _1632;
    if (_1542)
    {
        float _1662 = fma(_1602, _1596, _1648);
        _1624 = _1662;
    }
    float _1664 = _1624;
    if (!_1542)
    {
        _1634 = _1536;
    }
    float _1666 = _1634;
    float _1668 = _1666;
    if (_1542)
    {
        float _1670 = _1656 * _1656;
        _1668 = _1670;
    }
    float _1672 = _1668;
    float _1674 = fma(_1664, _1664, _1660);
    float _1676 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1678 = _1674 + _1672;
    float _1680 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1684 = fma(_1610, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1682);
    float _1686 = precise::clamp(_1684, 0.0, 1.0);
    float _1688 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1690 = rsqrt(_1678);
    float _1692 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1680);
    float _1694 = -_1686;
    float _1696 = _1694 + 1.0;
    float _1698 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1688);
    float _1700 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1676);
    float _1702 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1692);
    float _1704 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1706 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1698);
    float _1708 = abs(_1696);
    float _1710 = log2(_1708);
    float _1712 = _1702 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1714 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1704);
    float _1716 = _1706 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1718 = _1712 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1720 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1714);
    float _1722 = _1690 * _1664;
    float _1724 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1726 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1728 = _1690 * _1644;
    float _1730 = -_1718;
    float _1732 = fma(_1730, _1608, 1.0);
    float _1734 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1700);
    float _1736 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1724);
    float _1738 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1740 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1742 = _1690 * _1656;
    float _1744 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1746 = -_1738;
    float _1748 = fma(_1722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1746);
    float _1750 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1736);
    float _1752 = log2(_1732);
    float _1754 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1756 = -_1742;
    float _1758 = fma(_1756, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1748);
    float _1760 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1750);
    float _1762 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1764 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1754);
    float _1766 = fma(_1758, -0.5, 0.5);
    float _1768 = exp2(_1740);
    float _1770 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1762);
    float _1772 = _1722 + 1.0;
    float _1774 = fma(_1758, 0.5, 0.5);
    float _1776 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1764);
    float _1778 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1770);
    float _1780 = fma(_1774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1782 = 1.0 / _1760;
    float _1784 = fma(_1774, _1780, -0.212114393711090087890625);
    float _1786 = fma(_1774, _1784, 1.570728778839111328125);
    float _1788 = sqrt(_1766);
    float _1790 = -_1722;
    float _1792 = fma(_1768, _1772, _1790);
    float _1794 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1778);
    float _1796 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1776);
    float _1798 = _1752 * 0.693147182464599609375;
    float _1800 = _1794 * _1782;
    float _1802 = _1796 * _1782;
    float _1804 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1806 = fma(_1800, 0.5, 0.5);
    float _1808 = fma(_1802, -0.5, 0.5);
    float _1810 = fma(_1792, 0.5, 0.5);
    float _1812 = _1788 * 0.636619746685028076171875;
    float3 _4752 = float3(_1806, _1808, _1804);
    float _1814 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4752, float3(0.0), isnan(_4752)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4752, float3(0.0), isnan(_4752)), level(0.0)).x;
    float _1816 = -_1786;
    float _1818 = fma(_1812, _1816, 1.0);
    float3 _4768 = float3(_1806, _1808, _1804);
    float4 _1821 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4768, float3(0.0), isnan(_4768)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4768, float3(0.0), isnan(_4768)), level(0.0)).xyzw;
    float _1823 = _1821.x;
    float _1825 = _1821.y;
    float _1827 = _1821.z;
    float _1829 = _1821.w;
    float2 _4785 = float2(_1818, _1810);
    float3 _1833 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4785, float2(0.0), isnan(_4785)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4785, float2(0.0), isnan(_4785)), level(0.0)).xyz;
    float _1835 = _1833.x;
    float _1837 = _1833.y;
    float _1839 = _1833.z;
    float _1841 = in.m_67.y;
    float _1843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1845 = _158 > 0.5;
    float _1847 = in.m_51.w;
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1851 = _1849 != 0;
    bool _1853 = _174 > 0.5;
    float _1855 = in.m_67.x;
    int _1857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1859 = _1857 != 0;
    float _1861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1865 = _1863 != 0;
    out.m_69.x = _1504;
    out.m_69.y = _1502;
    out.m_69.z = _1506;
    int _1867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1869 = _1867 != 0;
    int _1871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1873 = _1871 != 0;
    float _1875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1877 = -_1841;
    float _1879 = _1877 + 1.0;
    float _1881 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1885 = _1845 ? as_type<int>(_1879) : as_type<int>(_1841);
    float _1887 = _1851 ? as_type<float>(_1885) : _1841;
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1891 = _1889 != 0;
    float _1893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1895 = _1853 ? as_type<int>(_1879) : as_type<int>(_1841);
    float _1897 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1899 = _1841;
    bool _1901 = _1859;
    if (!_1865)
    {
        _1897 = _1855;
    }
    float _1903 = _1897;
    float _1905 = _1891 ? as_type<float>(_1895) : _1841;
    float _1907 = fma(_1881, _1887, -0.5);
    bool _1909 = _1847 > 0.5;
    float _1911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1913 = _1903;
    if (!_1865)
    {
        _246 = _1903;
    }
    float _1915 = _246;
    float _1917 = _1875 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1919 = as_type<int>(_1917);
    int _1921 = as_type<int>(_1875);
    float _1923 = _1915;
    if (_1859)
    {
        float _1925 = _1909 ? _1879 : _1841;
        _1899 = _1925;
    }
    float _1927 = _1899;
    float _1929 = _1843 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1865)
    {
        _1913 = _1855;
    }
    float _1931 = _1913;
    float _1933 = fma(_1905, _1917, -0.5);
    float _1935 = -_364;
    float _1937 = fma(_584, _1907, _1935);
    float _1939 = fma(_1929, _1927, -0.5);
    if (_1865)
    {
        bool _1941 = _154 > 0.5;
        _1901 = _1941;
    }
    bool _1943 = _1901;
    if (_1869)
    {
        float _1945 = -_1931;
        float _1947 = _1945 + 1.0;
        _1919 = as_type<int>(_1947);
    }
    int _1949 = _1919;
    if (_1873)
    {
        float _1951 = -_1931;
        float _1953 = _1951 + 1.0;
        _1921 = as_type<int>(_1953);
    }
    int _1955 = _1921;
    float _1957 = -_570;
    float _1959 = fma(_442, _1939, _1957);
    float _1961 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_1869)
    {
        _600 = _1931;
    }
    float _1963 = _600;
    float _1965 = _1883 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1967 = _1963;
    if (!_1873)
    {
        _204 = _1931;
    }
    float _1969 = _204;
    float _1971 = _1969;
    if (_1865)
    {
        float _1973 = -_1931;
        float _1975 = _1973 + 1.0;
        _374 = as_type<int>(_1975);
    }
    int _1977 = _374;
    if (_1869)
    {
        float _1979 = _1853 ? as_type<float>(_1949) : _1931;
        _1967 = _1979;
    }
    float _1981 = _1967;
    float _1983 = exp2(_1961);
    if (_1873)
    {
        float _1985 = _1845 ? as_type<float>(_1955) : _1931;
        _1971 = _1985;
    }
    float _1987 = _1971;
    float _1989 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1991 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1865)
    {
        float _1993 = _1943 ? as_type<float>(_1977) : _1931;
        _1923 = _1993;
    }
    float _1995 = _1923;
    float _1997 = _1386 * _1376;
    float _1999 = fma(_1989, _1981, -0.5);
    float _2001 = fma(_1991, _1987, -0.5);
    float _2003 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2005 = in.m_71.w;
    float _2007 = fma(_426, _1999, _522);
    float _2009 = fma(_590, _2001, _436);
    float _2011 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2003);
    float _2013 = -_596;
    float _2015 = fma(_594, _1933, _2013);
    float _2017 = _1386 * _1394;
    float _2019 = _2009 + 0.5;
    float _2021 = -_1983;
    float _2023 = _2021 + 1.0;
    float _2025 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2011);
    float _2027 = -_1997;
    float _2029 = fma(_1398, _1394, _2027);
    float _2031 = _2015 + 0.5;
    float _2033 = _2023 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2035 = fma(_1398, _1376, _2017);
    float _2037 = _1794 + _1760;
    float _2039 = fma(_1965, _1995, -0.5);
    float _2041 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2025);
    float _2043 = _1760 * 0.5;
    out.m_73.x = _2035;
    out.m_73.y = _1440;
    out.m_73.z = _2029;
    float _2045 = _2037 * 0.5;
    float _2047 = fma(_554, _2039, _360);
    float _2049 = _2041 + _1760;
    float _2051 = _2007 + 0.5;
    float _2053 = _2047 + 0.5;
    float _2055 = _1937 + 0.5;
    float _2057 = _1959 + 0.5;
    float _2059 = _2049 * 0.5;
    float _2061 = fma(_1796, -0.5, _2043);
    float _2063 = -_2033;
    float _2065 = _2063 + 1.0;
    float _2067 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.w = _2005;
    out.m_77.x = _2053;
    out.m_77.y = _2055;
    out.m_77.z = _2051;
    out.m_77.w = _2057;
    out.m_79.x = _2019;
    out.m_79.y = _2031;
    out.gl_Position.x = _1794;
    out.gl_Position.y = _1796;
    out.gl_Position.z = _2041;
    out.gl_Position.w = _1760;
    out.m_81.x = _2045;
    out.m_81.y = _2061;
    out.m_81.z = _2059;
    out.m_81.w = _1760;
    out.m_49.x = _2067;
    float _2069 = _2033 * _1814;
    float _2071 = _1829 * _2069;
    float _2073 = _1829 * _2065;
    float _2075 = _1839 * _2069;
    float _2077 = fma(_1835, _2071, _1823);
    float _2079 = fma(_1837, _2071, _1825);
    float _2081 = fma(_1829, _2075, _1827);
    out.m_83.x = _2077;
    out.m_83.y = _2079;
    out.m_83.z = _2081;
    out.m_83.w = _2073;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

