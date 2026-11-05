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
    float4 m_47 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_81 [[user(locn4)]];
    float4 m_71 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_69 [[user(locn10)]];
    float4 m_79 [[user(locn11)]];
    float4 m_77 [[user(locn12)]];
    float4 m_83 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1811 = false;
    bool _350 = false;
    bool _182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_106)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2155 = as_type<float>(_116);
        out.gl_Position.z = _2155;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_49.w;
    float _122 = in.m_51.w;
    bool _124 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_120);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_120;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.w = _122;
    float _138 = 0.0;
    float _140 = _136;
    if (_132)
    {
        float _142 = float(_102);
        _138 = _142;
    }
    float _144 = _138;
    bool _146 = _136 >= _144;
    bool _148 = !_132;
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
        _118 = as_type<int>(_156);
    }
    int _158 = _118;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2229 = as_type<float>(_158);
        out.gl_Position.z = _2229;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _162 = !_160;
    float _180;
    if (!_162)
    {
        float _164 = in.m_51.x;
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _170 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _172 = _170 * _166;
        float _174 = floor(_172);
        float _176 = -_174;
        float _178 = _172 + _176;
        _180 = _178;
        _182 = true;
    }
    else
    {
        float _184 = float(_102);
        float _186 = 1.0 / _184;
        float _188 = _136 * _186;
        _180 = _188;
    }
    _182 = false;
    float _190 = _180;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _194 = _190 + _192;
    bool _196 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _198 = isnan(_190);
    bool _200 = _196 || _198;
    bool _202 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _204 = _200 || _202;
    float _206 = float(_204);
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _190 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = 1.0 / _214;
    bool _222 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _224 = 1.0 / _218;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _226;
    float _230 = _194 * _220;
    bool _232 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _234 = isnan(_190);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    float _244 = -_206;
    float _246 = _244 + 1.0;
    bool _248 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _250 = isnan(_190);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = fma(_228, _230, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _262 = _258 * _246;
    float _264 = -_258;
    float _266 = _264 + 1.0;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    float _276 = _210 * _224;
    float _278 = _242 * _266;
    float _280 = fma(_270, _230, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _282 = fma(_274, _230, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _284 = -_242;
    float _286 = _284 + 1.0;
    float _288 = _260 * _278;
    float _290 = _280 * _278;
    float _292 = _282 * _278;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _306 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].x, _290);
    float _308 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].y, _288);
    float _310 = fma(_296, _276, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _312 = fma(_300, _276, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _314 = fma(_304, _276, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _316 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].z, _292);
    float _318 = fma(_310, _262, _306);
    float _320 = fma(_312, _262, _308);
    float _322 = fma(_314, _262, _316);
    float _324 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].x, _318);
    float _326 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].y, _320);
    float _328 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].z, _322);
    bool _330 = !_222;
    float _348;
    if (!_330)
    {
        float _332 = in.m_51.x;
        float _334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _336 = _332 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[11].x, _136);
        float _340 = _338 * _334;
        float _342 = floor(_340);
        float _344 = -_342;
        float _346 = _340 + _344;
        _348 = _346;
        _350 = true;
    }
    else
    {
        float _352 = float(_102);
        float _354 = 1.0 / _352;
        float _356 = _136 * _354;
        _348 = _356;
    }
    _350 = false;
    float _358 = _348;
    float _360 = in.m_51.x;
    float _362 = in.m_51.y;
    float _364 = in.m_51.z;
    float _366 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _368 = log2(_366);
    int _370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _372 = _370 != 0;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _376 = _374 != 0;
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _380 = _378 != 0;
    float _382 = _368 * _136;
    float _384 = exp2(_382);
    float _386 = _364 * 2.0;
    float _388 = _360 * 2.0;
    float _390 = _362 + _364;
    float _392 = _362 + _360;
    float _394 = _362 * 2.0;
    float _396 = _362 + (-0.5);
    float _398 = _390 + (-1.0);
    float _400 = floor(_386);
    float _402 = _392 + (-1.0);
    float _404 = floor(_388);
    float _406 = -_384;
    float _408 = _406 + 1.0;
    bool _410 = _400 > 0.0;
    float _412 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _414 = _400 >= 0.0;
    bool _416 = isnan(_400);
    bool _418 = _414 || _416;
    bool _420 = isnan(0.0);
    bool _422 = _418 || _420;
    float _424 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _426 = floor(_394);
    int _428 = _422 ? 0 : 1;
    bool _430 = _404 > 0.0;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _434 = 1.0 + _432;
    bool _436 = _404 >= 0.0;
    bool _438 = isnan(_404);
    bool _440 = _436 || _438;
    bool _442 = isnan(0.0);
    bool _444 = _440 || _442;
    bool _446 = !_372;
    int _448 = _446 ? 0 : 1;
    float _450 = 1.0 / _434;
    float _452 = in.m_55.x;
    float _454 = in.m_55.y;
    float _456 = in.m_55.z;
    int _458 = ~_428;
    int _460 = _458 + 1;
    int _462 = _460 + 1;
    int _464 = _462;
    if (!_410)
    {
        int _466 = ~_428;
        int _468 = _466 + 1;
        _464 = _468;
    }
    int _470 = _464;
    int _472 = abs(_448);
    bool _474 = !_376;
    int _476 = _474 ? 0 : 1;
    bool _478 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _480 = isnan(1.0);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _486 = _482 || _484;
    int _488 = _444 ? 0 : 1;
    int _490 = abs(_476);
    bool _492 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _494 = isnan(0.0);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _500 = _496 || _498;
    float _502 = float(_472);
    float _504 = float(_470);
    int _506 = ~_488;
    int _508 = _506 + 1;
    int _510 = _508 + 1;
    int _512 = _510;
    if (!_430)
    {
        int _514 = ~_488;
        int _516 = _514 + 1;
        _512 = _516;
    }
    int _518 = _512;
    float _520 = _502 * _504;
    float _522 = _500 ? _408 : 0.0;
    bool _524 = _426 > 0.0;
    float _526 = float(_490);
    if (_486)
    {
        float _528 = _522 * _450;
        _140 = _528;
    }
    float _530 = _140;
    float _532 = float(_518);
    float _534 = _520 * (-2.0);
    bool _536 = _426 >= 0.0;
    bool _538 = isnan(_426);
    bool _540 = _536 || _538;
    bool _542 = isnan(0.0);
    bool _544 = _540 || _542;
    bool _546 = !_380;
    int _548 = _546 ? 0 : 1;
    float _550 = _526 * _532;
    float _552 = _360 + (-0.5);
    float _554 = fma(_534, _452, _452);
    int _556 = _544 ? 0 : 1;
    float _558 = fma(_424, _534, _424);
    float _560 = _550 * (-2.0);
    float _562 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[196].x, _554);
    int _564 = ~_556;
    int _566 = _564 + 1;
    int _568 = _566 + 1;
    int _570 = abs(_548);
    float _572 = fma(_558, _530, _562);
    int _574 = _568;
    if (!_524)
    {
        int _576 = ~_556;
        int _578 = _576 + 1;
        _574 = _578;
    }
    int _580 = _574;
    float _582 = fma(_412, _560, _412);
    float _584 = fma(_560, _454, _454);
    float _586 = float(_570);
    float _588 = _364 + _360;
    float _590 = float(_580);
    float _592 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[196].y, _584);
    float _594 = _364 + (-0.5);
    float _596 = in.m_57.x;
    float _598 = in.m_57.y;
    float _600 = in.m_57.z;
    float _602 = _586 * _590;
    float _604 = fma(_582, _530, _592);
    float _606 = _588 + (-1.0);
    float _608 = in.m_59.x;
    float _610 = in.m_59.y;
    float _612 = in.m_59.z;
    float _614 = _602 * (-2.0);
    float _616 = _604 * 0.15915493667125701904296875;
    float _618 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _620 = _572 * 0.15915493667125701904296875;
    float _622 = fma(_614, _456, _456);
    float _624 = _616 * 6.283185482025146484375;
    float _626 = sin(_624);
    float _628 = fma(_618, _614, _618);
    float _630 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[196].z, _622);
    float _632 = fma(_628, _530, _630);
    float _634 = _620 * 6.283185482025146484375;
    float _636 = sin(_634);
    float _638 = _632 * 0.15915493667125701904296875;
    float _640 = _324 * _596;
    float _642 = _326 * _598;
    float _644 = _620 * 6.283185482025146484375;
    float _646 = cos(_644);
    float _648 = in.m_44.x;
    float _650 = in.m_44.y;
    float _652 = in.m_44.z;
    float _654 = _328 * _600;
    float _656 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _612);
    float _658 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _608);
    float _660 = _640 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _662 = _654 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _610);
    float _666 = _616 * 6.283185482025146484375;
    float _668 = cos(_666);
    float _670 = _642 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _672 = _656 * _662;
    float _674 = _658 * _660;
    float _676 = _636 * _626;
    float _678 = _664 * _670;
    bool _680 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _682 = isnan(0.5);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _688 = _684 || _686;
    float _690 = _638 * 6.283185482025146484375;
    float _692 = cos(_690);
    float _694 = _646 * _626;
    float _696 = _638 * 6.283185482025146484375;
    float _698 = sin(_696);
    float _700 = _636 * _668;
    float _702 = _646 * _668;
    float _704 = _650 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _706 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[6].x, _704);
    float _708 = _646 * _692;
    float _710 = _668 * _692;
    float _712 = _636 * _692;
    float _714 = _626 * _692;
    float _716 = _712 * _678;
    float _718 = -_694;
    float _720 = fma(_698, _700, _718);
    float _722 = -_700;
    float _724 = fma(_698, _694, _722);
    float _726 = fma(_698, _702, _676);
    float _728 = _708 * _678;
    float _730 = fma(_698, _676, _702);
    float _732 = -_678;
    float _734 = _698 * _732;
    float _736 = fma(_720, _674, _716);
    float _738 = fma(_726, _674, _728);
    float _740 = _650 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _742 = fma(_710, _674, _734);
    float _744 = fma(_730, _672, _736);
    float _746 = fma(_724, _672, _738);
    float _748 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[4].x, _740);
    float _750 = fma(_714, _672, _742);
    float _752 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[6].z, _706);
    float _754 = _746 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _756 = _746 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _758 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[4].z, _748);
    float _760 = _752 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _762 = fma(_750, (*spvDescriptorSet0.vp_c10)._m0[10].x, _754);
    float _764 = fma(_750, (*spvDescriptorSet0.vp_c10)._m0[8].x, _756);
    float _766 = _758 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _768 = _650 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _770 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[10].z, _762);
    float _772 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[8].z, _764);
    float _774 = _746 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _776 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[5].x, _768);
    float _778 = _760 + _770;
    float _780 = _766 + _772;
    float _782 = fma(_750, (*spvDescriptorSet0.vp_c10)._m0[9].x, _774);
    float _784 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[5].z, _776);
    float _786 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _788 = _778 + _786;
    float _790 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _792 = _780 + _790;
    float _794 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[9].z, _782);
    float _796 = _784 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _798 = _788 * _788;
    float _800 = _796 + _794;
    float _802 = fma(_792, _792, _798);
    float _804 = sqrt(_802);
    bool _806 = _804 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _808 = _648;
    float _810 = _652;
    float _812 = _784;
    float _814 = _804;
    float _816 = _780;
    float _818 = _792;
    if (!_806)
    {
        _808 = _780;
    }
    float _820 = _808;
    float _822 = _820;
    if (!_806)
    {
        _810 = _778;
    }
    float _824 = _810;
    float _826 = _824;
    if (!_806)
    {
        _812 = _800;
    }
    float _828 = _812;
    bool _830 = !_806;
    float _832 = _828;
    if (!_830)
    {
        float _834 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _838 = _804 + _836;
        float _840 = rsqrt(_802);
        float _842 = _838 * _834;
        float _844 = _800 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _846 = _842 * 0.15915493667125701904296875;
        float _848 = _846 * 6.283185482025146484375;
        float _850 = cos(_848);
        float _852 = _846 * 6.283185482025146484375;
        float _854 = sin(_852);
        float _856 = _850 + (-1.0);
        float _858 = _856 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _860 = fma(_854, _844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _862 = fma(_800, _850, _858);
        float _864 = _840 * _860;
        float _866 = fma(_792, _864, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _868 = fma(_788, _864, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _822 = _866;
        _832 = _862;
        _826 = _868;
        _814 = _844;
    }
    float _870 = _822;
    float _872 = _832;
    float _874 = _826;
    float _876 = _814;
    float _878 = _872;
    float _880 = _870;
    float _882 = _874;
    float _884 = _876;
    if (!_688)
    {
        float _886 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _888 = _796 + _886;
        float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _892 = _766 + _890;
        float _894 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _896 = -_766;
        float _898 = _896 + _870;
        float _900 = _888 * _888;
        float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _904 = _760 + _902;
        float _906 = -_796;
        float _908 = _906 + _872;
        float _910 = fma(_892, _892, _900);
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _914 = fma(_904, _904, _910);
        float _916 = sqrt(_914);
        float _918 = _894 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _920 = precise::min(_916, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _922 = _920 * _912;
        float _924 = _918 * _922;
        float _926 = -_760;
        float _928 = _926 + _874;
        float _930 = fma(_898, _924, _766);
        float _932 = fma(_908, _924, _796);
        float _934 = fma(_928, _924, _760);
        _878 = _932;
        _880 = _930;
        _882 = _934;
        _816 = _916;
        _884 = _928;
        _818 = _924;
    }
    float _936 = _878;
    float _938 = _880;
    float _940 = _882;
    float _942 = _816;
    float _944 = _884;
    float _946 = _818;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _950 = _936 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _954 = _938 + _952;
    float _956 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _958 = _940 + _956;
    float _960 = _950 * _950;
    float _962 = fma(_954, _954, _960);
    float _964 = fma(_958, _958, _962);
    float _966 = rsqrt(_964);
    float _968 = sqrt(_964);
    float _970 = _954 * _966;
    float _972 = _958 * _966;
    float _974 = _950 * _966;
    float _976 = _970 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _978 = _972 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _980 = _976 * _976;
    float _982 = _978 * _978;
    float _984 = _980 + _982;
    float _986 = sqrt(_984);
    bool _988 = _986 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _992 = _986 + _990;
    float _994 = _796;
    float _996 = _984;
    float _998 = _992;
    float _1000 = _942;
    float _1002 = _966;
    float _1004 = _946;
    if (_988)
    {
        float _1006 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _994 = _1006;
    }
    float _1008 = _994;
    if (_988)
    {
        float _1010 = rsqrt(_984);
        _996 = _1010;
    }
    float _1012 = _996;
    if (_988)
    {
        float _1014 = _992 * _1008;
        _998 = _1014;
    }
    float _1016 = _998;
    if (_988)
    {
        float _1018 = _1016 * 0.15915493667125701904296875;
        _1000 = _1018;
    }
    float _1020 = _1000;
    float _1022 = _1008;
    float _1024 = _1020;
    if (_988)
    {
        float _1026 = _1020 * 6.283185482025146484375;
        float _1028 = sin(_1026);
        _1022 = _1028;
    }
    float _1030 = _1022;
    float _1032 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1034 = precise::max(0.0, _1032);
    float _1036 = _944;
    float _1038 = _1034;
    if (_988)
    {
        float _1040 = _1020 * 6.283185482025146484375;
        float _1042 = cos(_1040);
        _1036 = _1042;
    }
    float _1044 = _1036;
    float _1046 = -_974;
    float _1048 = -_1034;
    float _1050 = fma(_1046, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1048);
    if (_988)
    {
        float _1052 = _1050 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1038 = _1052;
    }
    float _1054 = _1038;
    float _1056 = _1054;
    if (!_988)
    {
        _1024 = _980;
    }
    float _1058 = _1024;
    float _1060 = _1030;
    float _1062 = _1058;
    if (_988)
    {
        float _1064 = fma(_1030, _1054, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1060 = _1064;
    }
    float _1066 = _1060;
    float _1068 = _1066;
    if (!_988)
    {
        _1056 = _1050;
    }
    float _1070 = _1056;
    float _1072 = _1070;
    float _1074 = _1044;
    if (_988)
    {
        float _1076 = _1044 + (-1.0);
        _1002 = _1076;
    }
    float _1078 = _1002;
    float _1080 = 0.0;
    float _1082 = _1078;
    if (_988)
    {
        float _1084 = _1012 * _1066;
        _1080 = _1084;
    }
    float _1086 = _1080;
    if (!_988)
    {
        _1068 = _976;
    }
    float _1088 = _1068;
    float _1090 = _936 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1092 = _1088;
    if (_988)
    {
        float _1094 = _1078 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1004 = _1094;
    }
    float _1096 = _1004;
    if (_988)
    {
        float _1098 = _976 * _1086;
        _1092 = _1098;
    }
    float _1100 = _1092;
    if (!_988)
    {
        _1082 = _978;
    }
    float _1102 = _1082;
    float _1104 = _1102;
    if (_988)
    {
        float _1106 = _978 * _1086;
        _1104 = _1106;
    }
    float _1108 = _1104;
    if (_988)
    {
        float _1110 = fma(_1050, _1044, _1096);
        _1072 = _1110;
    }
    float _1112 = _1072;
    if (_988)
    {
        float _1114 = _1100 * _1100;
        _1062 = _1114;
    }
    float _1116 = _1062;
    if (!_988)
    {
        _1074 = _982;
    }
    float _1118 = _1074;
    float _1120 = _1118;
    if (_988)
    {
        float _1122 = _1108 * _1108;
        _1120 = _1122;
    }
    float _1124 = _1120;
    float _1126 = fma(_1112, _1112, _1116);
    float _1128 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1130 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1090);
    float _1132 = _936 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1134 = _1126 + _1124;
    float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1138 = fma(_968, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1136);
    float _1140 = precise::clamp(_1138, 0.0, 1.0);
    float _1142 = _936 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1144 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1130);
    float _1146 = rsqrt(_1134);
    float _1148 = -_1140;
    float _1150 = _1148 + 1.0;
    float _1152 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1142);
    float _1154 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1132);
    float _1156 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1158 = _936 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1160 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1152);
    float _1162 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1154);
    float _1164 = abs(_1150);
    float _1166 = log2(_1164);
    float _1168 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1158);
    float _1170 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1172 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1174 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1176 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1168);
    float _1178 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1180 = _1146 * _1100;
    float _1182 = _1146 * _1112;
    float _1184 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1178);
    float _1186 = _1146 * _1108;
    float _1188 = _1180 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1190 = -_1174;
    float _1192 = fma(_1190, _1128, 1.0);
    float _1194 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1196 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1184);
    float _1198 = -_1188;
    float _1200 = fma(_1182, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1198);
    float _1202 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1196);
    float _1206 = -_1186;
    float _1208 = fma(_1206, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1200);
    float _1210 = exp2(_1202);
    float _1212 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1214 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1216 = fma(_1208, -0.5, 0.5);
    float _1218 = fma(_1208, 0.5, 0.5);
    float _1220 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1212);
    float _1222 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1214);
    float _1224 = _1182 + 1.0;
    float _1226 = log2(_1192);
    float _1228 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1220);
    float _1230 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1222);
    float _1232 = fma(_1218, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1234 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1228);
    float _1236 = fma(_1218, _1232, -0.212114393711090087890625);
    float _1238 = 1.0 / _1204;
    float _1240 = -_1182;
    float _1242 = fma(_1210, _1224, _1240);
    float _1244 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1230);
    float _1246 = fma(_1218, _1236, 1.570728778839111328125);
    float _1248 = fma(_1242, 0.5, 0.5);
    float _1250 = sqrt(_1216);
    float _1252 = _1226 * 0.693147182464599609375;
    float _1254 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1256 = _1234 * _1238;
    float _1258 = _1244 * _1238;
    float _1260 = fma(_1256, 0.5, 0.5);
    float _1262 = fma(_1258, -0.5, 0.5);
    float _1264 = _1250 * 0.636619746685028076171875;
    float3 _3950 = float3(_1260, _1262, _1254);
    float _1266 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3950, float3(0.0), isnan(_3950)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3950, float3(0.0), isnan(_3950)), level(0.0)).x;
    float _1268 = -_1246;
    float _1270 = fma(_1264, _1268, 1.0);
    float3 _3966 = float3(_1260, _1262, _1254);
    float4 _1273 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3966, float3(0.0), isnan(_3966)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3966, float3(0.0), isnan(_3966)), level(0.0)).xyzw;
    float _1275 = _1273.x;
    float _1277 = _1273.y;
    float _1279 = _1273.z;
    float _1281 = _1273.w;
    float2 _3983 = float2(_1270, _1248);
    float3 _1285 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3983, float2(0.0), isnan(_3983)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3983, float2(0.0), isnan(_3983)), level(0.0)).xyz;
    float _1287 = _1285.x;
    float _1289 = _1285.y;
    float _1291 = _1285.z;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1295 = _358 + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1299 = _358 + _1297;
    float _1301 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1303;
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1309 = _1307 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1313 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1311;
    float _1315 = 1.0 / _1309;
    bool _1317 = _610 != 0.0;
    bool _1319 = isnan(_610);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan(0.0);
    bool _1325 = _1321 || _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1327;
    bool _1331 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1333 = isnan(_358);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1339 = _1335 || _1337;
    float _1341 = float(_1339);
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1343;
    bool _1347 = _608 == 0.0;
    bool _1349 = !_1325;
    bool _1351 = _1347 && _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1355 = _1353 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _1357 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1359 = isnan(_358);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1365 = _1361 || _1363;
    float _1367 = float(_1365);
    float _1369 = 1.0 / _1305;
    float _1371 = -_1341;
    float _1373 = _1371 + 1.0;
    bool _1375 = _612 == 0.0;
    bool _1377 = _1375 && _1351;
    float _1379 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1381 = _1379 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1383 = -_1367;
    float _1385 = _1383 + 1.0;
    float _1387 = _1367 * _1373;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    out.m_61.x = _938;
    out.m_61.y = _936;
    out.m_61.z = _940;
    float _1393 = _1299 * _1315;
    float _1395 = exp2(_1301);
    float _1397 = fma(_1391, _1393, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1399 = fma(_1355, _1393, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1401 = fma(_1381, _1393, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1403 = _1295 * _1369;
    float _1405 = in.m_63.x;
    float _1407 = in.m_63.y;
    float _1409 = in.m_63.z;
    float _1411 = fma(_1313, _1403, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1413 = fma(_1329, _1403, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1415 = fma(_1345, _1403, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1417 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1419 = isnan(_358);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1425 = _1421 || _1423;
    float _1427 = float(_1425);
    float _1429 = in.m_65.x;
    float _1431 = in.m_65.y;
    float _1433 = in.m_65.z;
    float _1435 = in.m_65.w;
    float _1437 = -_1395;
    float _1439 = _1437 + 1.0;
    float _1441 = _1427 * _1385;
    float _1443 = -_1427;
    float _1445 = _1443 + 1.0;
    float _1447 = _1413 * _1441;
    float _1449 = _1411 * _1441;
    float _1451 = _1415 * _1441;
    float _1453 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1447);
    float _1455 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1449);
    float _1457 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1451);
    float _1459 = fma(_1399, _1387, _1453);
    float _1461 = fma(_1397, _1387, _1455);
    float _1463 = _1413;
    float _1465 = _1449;
    float _1467 = _1393;
    float _1469 = _1405;
    float _1471 = _1244;
    float _1473 = _1234;
    if (_1377)
    {
        _1463 = _1405;
    }
    float _1475 = _1463;
    float _1477 = fma(_1401, _1387, _1457);
    float _1479 = _1475;
    if (_1377)
    {
        _1465 = _1407;
    }
    float _1481 = _1465;
    float _1483 = _1481;
    if (!_1377)
    {
        float _1485 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1407);
        _1483 = _1485;
    }
    float _1487 = _1483;
    if (_1377)
    {
        _1467 = _1475;
    }
    float _1489 = _1467;
    float _1491 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1461);
    float _1493 = _1489;
    if (!_1377)
    {
        _1479 = _1405;
    }
    float _1495 = _1479;
    float _1497 = _1431 * _1409;
    if (_1377)
    {
        _1469 = _1409;
    }
    float _1499 = _1469;
    float _1501 = _1499;
    if (!_1377)
    {
        float _1503 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1409);
        _1501 = _1503;
    }
    float _1505 = _1501;
    float _1507 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1459);
    float _1509 = _1433 * _1495;
    if (!_1377)
    {
        float _1511 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1495);
        _1493 = _1511;
    }
    float _1513 = _1493;
    float _1515 = _1429 * _1407;
    float _1517 = -_1497;
    float _1519 = fma(_1433, _1407, _1517);
    float _1521 = -_1509;
    float _1523 = fma(_1429, _1409, _1521);
    float _1525 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1477);
    float _1527 = -_1515;
    float _1529 = fma(_1431, _1495, _1527);
    float _1531 = _1491 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1533 = _1523 * _1435;
    float _1535 = _1519 * _1435;
    float _1537 = _1529 * _1435;
    float _1539 = -_1487;
    float _1541 = _698 * _1539;
    float _1543 = -_1431;
    float _1545 = _698 * _1543;
    float _1547 = -_1533;
    float _1549 = _698 * _1547;
    float _1551 = _1507 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1553 = fma(_710, _1513, _1541);
    float _1555 = fma(_710, _1429, _1545);
    float _1557 = fma(_710, _1535, _1549);
    float _1559 = _708 * _1431;
    float _1561 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1563 = _712 * _1431;
    float _1565 = _708 * _1487;
    float _1567 = _712 * _1487;
    float _1569 = fma(_726, _1429, _1559);
    float _1571 = _708 * _1533;
    float _1573 = _1531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1575 = _1551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1577 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1579 = _712 * _1533;
    float _1581 = fma(_720, _1429, _1563);
    float _1583 = fma(_724, _1433, _1569);
    float _1585 = fma(_726, _1535, _1571);
    float _1587 = fma(_714, _1433, _1555);
    out.m_67.x = _1573;
    out.m_67.y = _1575;
    out.m_67.z = _1577;
    float _1589 = fma(_726, _1513, _1565);
    float _1591 = fma(_720, _1513, _1567);
    float _1593 = fma(_720, _1535, _1579);
    float _1595 = fma(_730, _1433, _1581);
    float _1597 = _1583 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1599 = fma(_714, _1505, _1553);
    float _1601 = fma(_714, _1537, _1557);
    float _1603 = fma(_724, _1505, _1589);
    float _1605 = fma(_730, _1505, _1591);
    float _1607 = fma(_724, _1537, _1585);
    float _1609 = fma(_730, _1537, _1593);
    float _1611 = _1583 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1613 = _1583 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1615 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1597);
    float _1617 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1619 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1611);
    float _1621 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1613);
    float _1623 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1625 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1627 = _1607 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1629 = fma(_1599, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1617);
    float _1631 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1623);
    float _1633 = fma(_1599, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1625);
    float _1635 = _1607 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1637 = fma(_1601, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1627);
    float _1639 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1631);
    float _1641 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1643 = _1607 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1645 = fma(_1601, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1635);
    float _1647 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1639);
    float _1649 = fma(_1599, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1641);
    float _1651 = fma(_1595, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1615);
    float _1653 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1655 = fma(_1595, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1619);
    float _1657 = fma(_1595, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1621);
    float _1659 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1637);
    float _1661 = _1647 + _1204;
    float _1663 = fma(_1601, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1643);
    float _1665 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1645);
    out.m_69.x = _1651;
    out.m_69.y = _1655;
    out.m_69.z = _1657;
    float _1667 = _1661 * 0.5;
    float _1669 = fma(_1605, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1629);
    float _1671 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1663);
    float _1673 = fma(_1605, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1649);
    float _1675 = fma(_1605, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1633);
    bool _1677 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1679 = isnan(_968);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1685 = _1681 || _1683;
    out.m_71.x = _1659;
    out.m_71.y = _1665;
    out.m_71.z = _1671;
    float _1687 = -_1653;
    float _1689 = _1687 + 1.0;
    out.m_73.z = _1667;
    out.m_73.w = _1204;
    out.m_75.x = _1673;
    out.m_75.y = _1669;
    out.m_75.z = _1675;
    float _1691 = _1605;
    float _1693 = _1657;
    float _1695 = _1655;
    float _1697 = _1689;
    if (!_1685)
    {
        _1691 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1699 = _1691;
    out.gl_Position.x = _1234;
    out.gl_Position.y = _1244;
    out.gl_Position.z = _1647;
    out.gl_Position.w = _1204;
    float _1701 = _1699;
    float _1703 = _1699;
    if (!_1685)
    {
        _1693 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1705 = _1693;
    float _1707 = _1705;
    float _1709 = _1705;
    if (!_1685)
    {
        _1695 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1711 = _1695;
    float _1713 = _1711;
    float _1715 = _1711;
    if (!_1685)
    {
        _1471 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1717 = _1471;
    float _1719 = _1717;
    float _1721 = _1717;
    if (!_1685)
    {
        _1473 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1723 = _1473;
    float _1725 = _1653 * _1266;
    float _1727 = _1281 * _1725;
    float _1729 = _1281 * _1689;
    float _1731 = _1723;
    float _1733 = _1723;
    if (!_1685)
    {
        _1697 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1735 = _1697;
    float _1737 = _1291 * _1725;
    float _1739 = fma(_1287, _1727, _1275);
    float _1741 = fma(_1289, _1727, _1277);
    float _1743 = fma(_1281, _1737, _1279);
    out.m_77.x = _1739;
    out.m_77.y = _1741;
    out.m_77.z = _1743;
    out.m_77.w = _1729;
    bool _1745 = !_1685;
    float _1747 = _1735;
    float _1749 = _1735;
    if (!_1745)
    {
        bool _1751 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1753 = isnan(_968);
        bool _1755 = _1751 || _1753;
        bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1759 = _1755 || _1757;
        if (!_1759)
        {
            float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1763 = _968 + _1761;
            float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1767 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1765;
            float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1771 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1773 = 1.0 / _1767;
            float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1777 = _1775 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1781 = _1779 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1785 = _1783 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1791 = _1763 * _1773;
            float _1793 = precise::clamp(_1791, 0.0, 1.0);
            float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1797 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1799 = fma(_1793, _1771, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1801 = fma(_1793, _1797, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1803 = fma(_1793, _1777, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1805 = fma(_1793, _1781, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1807 = fma(_1793, _1785, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1809 = fma(_1793, _1789, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1733 = _1803;
            _1715 = _1807;
            _1721 = _1799;
            _1709 = _1805;
            _1703 = _1801;
            _1749 = _1809;
            _1811 = true;
        }
        else
        {
            bool _1813 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1815 = isnan(_968);
            bool _1817 = _1813 || _1815;
            bool _1819 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1821 = _1817 || _1819;
            if (!_1821)
            {
                _1719 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1823 = _1719;
            _1721 = _1823;
            if (!_1821)
            {
                _1731 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1825 = _1731;
            _1733 = _1825;
            if (!_1821)
            {
                _1701 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1827 = _1701;
            _1703 = _1827;
            if (!_1821)
            {
                _1707 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1829 = _1707;
            _1709 = _1829;
            if (!_1821)
            {
                _1713 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1831 = _1713;
            _1715 = _1831;
            if (!_1821)
            {
                _1747 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1833 = _1747;
            bool _1835 = !_1821;
            _1749 = _1833;
            if (!_1835)
            {
                bool _1837 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1839 = isnan(_968);
                bool _1841 = _1837 || _1839;
                bool _1843 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1845 = _1841 || _1843;
                if (!_1845)
                {
                    float _1847 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1849 = _968 + _1847;
                    float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1853 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1851;
                    float _1855 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1857 = _1855 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1859 = 1.0 / _1853;
                    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1863 = _1861 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1867 = _1865 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1871 = _1869 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1875 = _1873 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1877 = _1849 * _1859;
                    float _1879 = precise::clamp(_1877, 0.0, 1.0);
                    float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1883 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1885 = fma(_1879, _1857, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1887 = fma(_1879, _1883, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1889 = fma(_1879, _1863, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1891 = fma(_1879, _1867, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1893 = fma(_1879, _1871, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1895 = fma(_1879, _1875, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1733 = _1889;
                    _1715 = _1893;
                    _1721 = _1885;
                    _1709 = _1891;
                    _1703 = _1887;
                    _1749 = _1895;
                    _1811 = true;
                }
                else
                {
                    _1733 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1715 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1721 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1709 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1703 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1749 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1811 = false;
    float _1897 = _1733;
    float _1899 = _1715;
    float _1901 = _1721;
    float _1903 = _1709;
    float _1905 = _1703;
    float _1907 = _1749;
    float _1909 = fma(_1669, -0.5, 0.5);
    float _1911 = precise::clamp(_1909, 0.0, 1.0);
    float _1913 = -_1897;
    float _1915 = _1913 + _1899;
    float _1917 = -_1901;
    float _1919 = _1917 + _1903;
    float _1921 = -_1905;
    float _1923 = _1921 + _1907;
    bool _1925 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1927 = fma(_1911, _1915, _1897);
    float _1929 = fma(_1911, _1919, _1901);
    float _1931 = fma(_1911, _1923, _1905);
    float _1933 = _1927 * 0.586610972881317138671875;
    out.m_79.x = 0.0;
    float _1935 = fma(_1929, 0.298911988735198974609375, _1933);
    float _1937 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1939 = fma(_1931, 0.114477999508380889892578125, _1935);
    out.m_47.x = _1937;
    float _1941 = -_1939;
    float _1943 = _1929 + _1941;
    float _1945 = -_1939;
    float _1947 = _1927 + _1945;
    float _1949 = -_1939;
    float _1951 = _1931 + _1949;
    out.m_81.x = 0.0;
    float _1953 = fma(_1943, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1939);
    float _1955 = fma(_1947, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1939);
    float _1957 = fma(_1951, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1939);
    out.m_83.x = _1953;
    out.m_83.y = _1955;
    out.m_83.z = _1957;
    if (!_1925)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1959 = -_936;
    float _1961 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1963 = -_938;
    float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1967 = -_940;
    float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1971 = _1961 * _1961;
    float _1973 = fma(_1965, _1965, _1971);
    float _1975 = fma(_1969, _1969, _1973);
    float _1977 = rsqrt(_1975);
    float _1979 = _1961 * _1977;
    float _1981 = _1965 * _1977;
    float _1983 = _1969 * _1977;
    float _1985 = sqrt(_1975);
    float _1987 = -_974;
    float _1989 = _1987 + _1979;
    float _1991 = -_970;
    float _1993 = _1991 + _1981;
    float _1995 = -_972;
    float _1997 = _1995 + _1983;
    float _1999 = _1989 * _1989;
    float _2001 = fma(_1993, _1993, _1999);
    float _2003 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2005 = precise::clamp(_2003, 0.0, 1.0);
    float _2007 = fma(_1997, _1997, _2001);
    float _2009 = _2005 * _2005;
    float _2011 = -_1985;
    float _2013 = _2011 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2015 = _2009 + (-1.0);
    float _2017 = rsqrt(_2007);
    float _2019 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2021 = precise::clamp(_2019, 0.0, 1.0);
    float _2023 = abs(_2021);
    float _2025 = log2(_2023);
    float _2027 = _1989 * _2017;
    float _2029 = _1993 * _2017;
    float _2031 = _1997 * _2017;
    float _2033 = _1669 * _2027;
    float _2035 = _1669 * _1979;
    float _2037 = fma(_1673, _2029, _2033);
    float _2039 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2041 = fma(_1673, _1981, _2035);
    float _2043 = fma(_1675, _2031, _2037);
    float _2045 = precise::clamp(_2043, 0.0, 1.0);
    float _2047 = fma(_1675, _1983, _2041);
    float _2049 = precise::clamp(_2047, 0.0, 1.0);
    float _2051 = exp2(_2039);
    float _2053 = _2045 * _2045;
    float _2055 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2057 = fma(_2053, _2015, 1.0);
    float _2059 = -_1979;
    float _2061 = -_2055;
    float _2063 = fma(_2059, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2061);
    float _2065 = _2057 * _2057;
    float _2067 = -_1983;
    float _2069 = fma(_2067, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2063);
    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2073 = _2069 + _2071;
    float _2075 = 1.0 / _2065;
    float _2077 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2079 = precise::clamp(_2077, 0.0, 1.0);
    float _2081 = _2051 * _2079;
    float _2083 = _2049 * _2081;
    float _2085 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2087 = _2009 * _2075;
    float _2089 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2091 = _2083 * _2087;
    float _2093 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2095 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2097 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2099 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_79.x = _2085;
    out.m_79.y = _2093;
    out.m_79.z = _2089;
    out.m_81.x = _2095;
    out.m_81.y = _2097;
    out.m_81.z = _2099;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1811 = false;
    bool _350 = false;
    bool _182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_106)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2155 = as_type<float>(_116);
        out.gl_Position.z = _2155;
    }
    if (!_106)
    {
        return out;
    }
    float _120 = in.m_49.w;
    float _122 = in.m_51.w;
    bool _124 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_120);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_120;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.w = _122;
    float _138 = 0.0;
    float _140 = _136;
    if (_132)
    {
        float _142 = float(_102);
        _138 = _142;
    }
    float _144 = _138;
    bool _146 = _136 >= _144;
    bool _148 = !_132;
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
        _118 = as_type<int>(_156);
    }
    int _158 = _118;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2229 = as_type<float>(_158);
        out.gl_Position.z = _2229;
    }
    if (_150)
    {
        return out;
    }
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _162 = !_160;
    float _180;
    if (!_162)
    {
        float _164 = in.m_51.x;
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _170 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _172 = _170 * _166;
        float _174 = floor(_172);
        float _176 = -_174;
        float _178 = _172 + _176;
        _180 = _178;
        _182 = true;
    }
    else
    {
        float _184 = float(_102);
        float _186 = 1.0 / _184;
        float _188 = _136 * _186;
        _180 = _188;
    }
    _182 = false;
    float _190 = _180;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _194 = _190 + _192;
    bool _196 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _198 = isnan(_190);
    bool _200 = _196 || _198;
    bool _202 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _204 = _200 || _202;
    float _206 = float(_204);
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _190 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = 1.0 / _214;
    bool _222 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _224 = 1.0 / _218;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _226;
    float _230 = _194 * _220;
    bool _232 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _234 = isnan(_190);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    float _244 = -_206;
    float _246 = _244 + 1.0;
    bool _248 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _250 = isnan(_190);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = fma(_228, _230, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _262 = _258 * _246;
    float _264 = -_258;
    float _266 = _264 + 1.0;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    float _276 = _210 * _224;
    float _278 = _242 * _266;
    float _280 = fma(_270, _230, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _282 = fma(_274, _230, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _284 = -_242;
    float _286 = _284 + 1.0;
    float _288 = _260 * _278;
    float _290 = _280 * _278;
    float _292 = _282 * _278;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _306 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].x, _290);
    float _308 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].y, _288);
    float _310 = fma(_296, _276, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _312 = fma(_300, _276, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _314 = fma(_304, _276, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _316 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].z, _292);
    float _318 = fma(_310, _262, _306);
    float _320 = fma(_312, _262, _308);
    float _322 = fma(_314, _262, _316);
    float _324 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].x, _318);
    float _326 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].y, _320);
    float _328 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].z, _322);
    bool _330 = !_222;
    float _348;
    if (!_330)
    {
        float _332 = in.m_51.x;
        float _334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _336 = _332 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[11].x, _136);
        float _340 = _338 * _334;
        float _342 = floor(_340);
        float _344 = -_342;
        float _346 = _340 + _344;
        _348 = _346;
        _350 = true;
    }
    else
    {
        float _352 = float(_102);
        float _354 = 1.0 / _352;
        float _356 = _136 * _354;
        _348 = _356;
    }
    _350 = false;
    float _358 = _348;
    float _360 = in.m_51.x;
    float _362 = in.m_51.y;
    float _364 = in.m_51.z;
    float _366 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _368 = log2(_366);
    int _370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _372 = _370 != 0;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _376 = _374 != 0;
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _380 = _378 != 0;
    float _382 = _368 * _136;
    float _384 = exp2(_382);
    float _386 = _364 * 2.0;
    float _388 = _360 * 2.0;
    float _390 = _362 + _364;
    float _392 = _362 + _360;
    float _394 = _362 * 2.0;
    float _396 = _362 + (-0.5);
    float _398 = _390 + (-1.0);
    float _400 = floor(_386);
    float _402 = _392 + (-1.0);
    float _404 = floor(_388);
    float _406 = -_384;
    float _408 = _406 + 1.0;
    bool _410 = _400 > 0.0;
    float _412 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _414 = _400 >= 0.0;
    bool _416 = isnan(_400);
    bool _418 = _414 || _416;
    bool _420 = isnan(0.0);
    bool _422 = _418 || _420;
    float _424 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _426 = floor(_394);
    int _428 = _422 ? 0 : 1;
    bool _430 = _404 > 0.0;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _434 = 1.0 + _432;
    bool _436 = _404 >= 0.0;
    bool _438 = isnan(_404);
    bool _440 = _436 || _438;
    bool _442 = isnan(0.0);
    bool _444 = _440 || _442;
    bool _446 = !_372;
    int _448 = _446 ? 0 : 1;
    float _450 = 1.0 / _434;
    float _452 = in.m_55.x;
    float _454 = in.m_55.y;
    float _456 = in.m_55.z;
    int _458 = ~_428;
    int _460 = _458 + 1;
    int _462 = _460 + 1;
    int _464 = _462;
    if (!_410)
    {
        int _466 = ~_428;
        int _468 = _466 + 1;
        _464 = _468;
    }
    int _470 = _464;
    int _472 = abs(_448);
    bool _474 = !_376;
    int _476 = _474 ? 0 : 1;
    bool _478 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _480 = isnan(1.0);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _486 = _482 || _484;
    int _488 = _444 ? 0 : 1;
    int _490 = abs(_476);
    bool _492 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _494 = isnan(0.0);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _500 = _496 || _498;
    float _502 = float(_472);
    float _504 = float(_470);
    int _506 = ~_488;
    int _508 = _506 + 1;
    int _510 = _508 + 1;
    int _512 = _510;
    if (!_430)
    {
        int _514 = ~_488;
        int _516 = _514 + 1;
        _512 = _516;
    }
    int _518 = _512;
    float _520 = _502 * _504;
    float _522 = _500 ? _408 : 0.0;
    bool _524 = _426 > 0.0;
    float _526 = float(_490);
    if (_486)
    {
        float _528 = _522 * _450;
        _140 = _528;
    }
    float _530 = _140;
    float _532 = float(_518);
    float _534 = _520 * (-2.0);
    bool _536 = _426 >= 0.0;
    bool _538 = isnan(_426);
    bool _540 = _536 || _538;
    bool _542 = isnan(0.0);
    bool _544 = _540 || _542;
    bool _546 = !_380;
    int _548 = _546 ? 0 : 1;
    float _550 = _526 * _532;
    float _552 = _360 + (-0.5);
    float _554 = fma(_534, _452, _452);
    int _556 = _544 ? 0 : 1;
    float _558 = fma(_424, _534, _424);
    float _560 = _550 * (-2.0);
    float _562 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[196].x, _554);
    int _564 = ~_556;
    int _566 = _564 + 1;
    int _568 = _566 + 1;
    int _570 = abs(_548);
    float _572 = fma(_558, _530, _562);
    int _574 = _568;
    if (!_524)
    {
        int _576 = ~_556;
        int _578 = _576 + 1;
        _574 = _578;
    }
    int _580 = _574;
    float _582 = fma(_412, _560, _412);
    float _584 = fma(_560, _454, _454);
    float _586 = float(_570);
    float _588 = _364 + _360;
    float _590 = float(_580);
    float _592 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[196].y, _584);
    float _594 = _364 + (-0.5);
    float _596 = in.m_57.x;
    float _598 = in.m_57.y;
    float _600 = in.m_57.z;
    float _602 = _586 * _590;
    float _604 = fma(_582, _530, _592);
    float _606 = _588 + (-1.0);
    float _608 = in.m_59.x;
    float _610 = in.m_59.y;
    float _612 = in.m_59.z;
    float _614 = _602 * (-2.0);
    float _616 = _604 * 0.15915493667125701904296875;
    float _618 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _620 = _572 * 0.15915493667125701904296875;
    float _622 = fma(_614, _456, _456);
    float _624 = _616 * 6.283185482025146484375;
    float _626 = sin(_624);
    float _628 = fma(_618, _614, _618);
    float _630 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[196].z, _622);
    float _632 = fma(_628, _530, _630);
    float _634 = _620 * 6.283185482025146484375;
    float _636 = sin(_634);
    float _638 = _632 * 0.15915493667125701904296875;
    float _640 = _324 * _596;
    float _642 = _326 * _598;
    float _644 = _620 * 6.283185482025146484375;
    float _646 = cos(_644);
    float _648 = in.m_44.x;
    float _650 = in.m_44.y;
    float _652 = in.m_44.z;
    float _654 = _328 * _600;
    float _656 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _612);
    float _658 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _608);
    float _660 = _640 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _662 = _654 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _610);
    float _666 = _616 * 6.283185482025146484375;
    float _668 = cos(_666);
    float _670 = _642 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _672 = _656 * _662;
    float _674 = _658 * _660;
    float _676 = _636 * _626;
    float _678 = _664 * _670;
    bool _680 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _682 = isnan(0.5);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _688 = _684 || _686;
    float _690 = _638 * 6.283185482025146484375;
    float _692 = cos(_690);
    float _694 = _646 * _626;
    float _696 = _638 * 6.283185482025146484375;
    float _698 = sin(_696);
    float _700 = _636 * _668;
    float _702 = _646 * _668;
    float _704 = _650 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _706 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[6].x, _704);
    float _708 = _646 * _692;
    float _710 = _668 * _692;
    float _712 = _636 * _692;
    float _714 = _626 * _692;
    float _716 = _712 * _678;
    float _718 = -_694;
    float _720 = fma(_698, _700, _718);
    float _722 = -_700;
    float _724 = fma(_698, _694, _722);
    float _726 = fma(_698, _702, _676);
    float _728 = _708 * _678;
    float _730 = fma(_698, _676, _702);
    float _732 = -_678;
    float _734 = _698 * _732;
    float _736 = fma(_720, _674, _716);
    float _738 = fma(_726, _674, _728);
    float _740 = _650 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _742 = fma(_710, _674, _734);
    float _744 = fma(_730, _672, _736);
    float _746 = fma(_724, _672, _738);
    float _748 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[4].x, _740);
    float _750 = fma(_714, _672, _742);
    float _752 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[6].z, _706);
    float _754 = _746 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _756 = _746 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _758 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[4].z, _748);
    float _760 = _752 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _762 = fma(_750, (*spvDescriptorSet0.vp_c10)._m0[10].x, _754);
    float _764 = fma(_750, (*spvDescriptorSet0.vp_c10)._m0[8].x, _756);
    float _766 = _758 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _768 = _650 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _770 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[10].z, _762);
    float _772 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[8].z, _764);
    float _774 = _746 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _776 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[5].x, _768);
    float _778 = _760 + _770;
    float _780 = _766 + _772;
    float _782 = fma(_750, (*spvDescriptorSet0.vp_c10)._m0[9].x, _774);
    float _784 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[5].z, _776);
    float _786 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _788 = _778 + _786;
    float _790 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _792 = _780 + _790;
    float _794 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[9].z, _782);
    float _796 = _784 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _798 = _788 * _788;
    float _800 = _796 + _794;
    float _802 = fma(_792, _792, _798);
    float _804 = sqrt(_802);
    bool _806 = _804 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _808 = _648;
    float _810 = _652;
    float _812 = _784;
    float _814 = _804;
    float _816 = _780;
    float _818 = _792;
    if (!_806)
    {
        _808 = _780;
    }
    float _820 = _808;
    float _822 = _820;
    if (!_806)
    {
        _810 = _778;
    }
    float _824 = _810;
    float _826 = _824;
    if (!_806)
    {
        _812 = _800;
    }
    float _828 = _812;
    bool _830 = !_806;
    float _832 = _828;
    if (!_830)
    {
        float _834 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _838 = _804 + _836;
        float _840 = rsqrt(_802);
        float _842 = _838 * _834;
        float _844 = _800 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _846 = _842 * 0.15915493667125701904296875;
        float _848 = _846 * 6.283185482025146484375;
        float _850 = cos(_848);
        float _852 = _846 * 6.283185482025146484375;
        float _854 = sin(_852);
        float _856 = _850 + (-1.0);
        float _858 = _856 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _860 = fma(_854, _844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _862 = fma(_800, _850, _858);
        float _864 = _840 * _860;
        float _866 = fma(_792, _864, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _868 = fma(_788, _864, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _822 = _866;
        _832 = _862;
        _826 = _868;
        _814 = _844;
    }
    float _870 = _822;
    float _872 = _832;
    float _874 = _826;
    float _876 = _814;
    float _878 = _872;
    float _880 = _870;
    float _882 = _874;
    float _884 = _876;
    if (!_688)
    {
        float _886 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _888 = _796 + _886;
        float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _892 = _766 + _890;
        float _894 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _896 = -_766;
        float _898 = _896 + _870;
        float _900 = _888 * _888;
        float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _904 = _760 + _902;
        float _906 = -_796;
        float _908 = _906 + _872;
        float _910 = fma(_892, _892, _900);
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _914 = fma(_904, _904, _910);
        float _916 = sqrt(_914);
        float _918 = _894 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _920 = precise::min(_916, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _922 = _920 * _912;
        float _924 = _918 * _922;
        float _926 = -_760;
        float _928 = _926 + _874;
        float _930 = fma(_898, _924, _766);
        float _932 = fma(_908, _924, _796);
        float _934 = fma(_928, _924, _760);
        _878 = _932;
        _880 = _930;
        _882 = _934;
        _816 = _916;
        _884 = _928;
        _818 = _924;
    }
    float _936 = _878;
    float _938 = _880;
    float _940 = _882;
    float _942 = _816;
    float _944 = _884;
    float _946 = _818;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _950 = _936 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _954 = _938 + _952;
    float _956 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _958 = _940 + _956;
    float _960 = _950 * _950;
    float _962 = fma(_954, _954, _960);
    float _964 = fma(_958, _958, _962);
    float _966 = rsqrt(_964);
    float _968 = sqrt(_964);
    float _970 = _954 * _966;
    float _972 = _958 * _966;
    float _974 = _950 * _966;
    float _976 = _970 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _978 = _972 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _980 = _976 * _976;
    float _982 = _978 * _978;
    float _984 = _980 + _982;
    float _986 = sqrt(_984);
    bool _988 = _986 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _992 = _986 + _990;
    float _994 = _796;
    float _996 = _984;
    float _998 = _992;
    float _1000 = _942;
    float _1002 = _966;
    float _1004 = _946;
    if (_988)
    {
        float _1006 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _994 = _1006;
    }
    float _1008 = _994;
    if (_988)
    {
        float _1010 = rsqrt(_984);
        _996 = _1010;
    }
    float _1012 = _996;
    if (_988)
    {
        float _1014 = _992 * _1008;
        _998 = _1014;
    }
    float _1016 = _998;
    if (_988)
    {
        float _1018 = _1016 * 0.15915493667125701904296875;
        _1000 = _1018;
    }
    float _1020 = _1000;
    float _1022 = _1008;
    float _1024 = _1020;
    if (_988)
    {
        float _1026 = _1020 * 6.283185482025146484375;
        float _1028 = sin(_1026);
        _1022 = _1028;
    }
    float _1030 = _1022;
    float _1032 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1034 = precise::max(0.0, _1032);
    float _1036 = _944;
    float _1038 = _1034;
    if (_988)
    {
        float _1040 = _1020 * 6.283185482025146484375;
        float _1042 = cos(_1040);
        _1036 = _1042;
    }
    float _1044 = _1036;
    float _1046 = -_974;
    float _1048 = -_1034;
    float _1050 = fma(_1046, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1048);
    if (_988)
    {
        float _1052 = _1050 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1038 = _1052;
    }
    float _1054 = _1038;
    float _1056 = _1054;
    if (!_988)
    {
        _1024 = _980;
    }
    float _1058 = _1024;
    float _1060 = _1030;
    float _1062 = _1058;
    if (_988)
    {
        float _1064 = fma(_1030, _1054, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1060 = _1064;
    }
    float _1066 = _1060;
    float _1068 = _1066;
    if (!_988)
    {
        _1056 = _1050;
    }
    float _1070 = _1056;
    float _1072 = _1070;
    float _1074 = _1044;
    if (_988)
    {
        float _1076 = _1044 + (-1.0);
        _1002 = _1076;
    }
    float _1078 = _1002;
    float _1080 = 0.0;
    float _1082 = _1078;
    if (_988)
    {
        float _1084 = _1012 * _1066;
        _1080 = _1084;
    }
    float _1086 = _1080;
    if (!_988)
    {
        _1068 = _976;
    }
    float _1088 = _1068;
    float _1090 = _936 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1092 = _1088;
    if (_988)
    {
        float _1094 = _1078 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1004 = _1094;
    }
    float _1096 = _1004;
    if (_988)
    {
        float _1098 = _976 * _1086;
        _1092 = _1098;
    }
    float _1100 = _1092;
    if (!_988)
    {
        _1082 = _978;
    }
    float _1102 = _1082;
    float _1104 = _1102;
    if (_988)
    {
        float _1106 = _978 * _1086;
        _1104 = _1106;
    }
    float _1108 = _1104;
    if (_988)
    {
        float _1110 = fma(_1050, _1044, _1096);
        _1072 = _1110;
    }
    float _1112 = _1072;
    if (_988)
    {
        float _1114 = _1100 * _1100;
        _1062 = _1114;
    }
    float _1116 = _1062;
    if (!_988)
    {
        _1074 = _982;
    }
    float _1118 = _1074;
    float _1120 = _1118;
    if (_988)
    {
        float _1122 = _1108 * _1108;
        _1120 = _1122;
    }
    float _1124 = _1120;
    float _1126 = fma(_1112, _1112, _1116);
    float _1128 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1130 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1090);
    float _1132 = _936 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1134 = _1126 + _1124;
    float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1138 = fma(_968, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1136);
    float _1140 = precise::clamp(_1138, 0.0, 1.0);
    float _1142 = _936 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1144 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1130);
    float _1146 = rsqrt(_1134);
    float _1148 = -_1140;
    float _1150 = _1148 + 1.0;
    float _1152 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1142);
    float _1154 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1132);
    float _1156 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1158 = _936 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1160 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1152);
    float _1162 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1154);
    float _1164 = abs(_1150);
    float _1166 = log2(_1164);
    float _1168 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1158);
    float _1170 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1172 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1174 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1176 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1168);
    float _1178 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1180 = _1146 * _1100;
    float _1182 = _1146 * _1112;
    float _1184 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1178);
    float _1186 = _1146 * _1108;
    float _1188 = _1180 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1190 = -_1174;
    float _1192 = fma(_1190, _1128, 1.0);
    float _1194 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1196 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1184);
    float _1198 = -_1188;
    float _1200 = fma(_1182, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1198);
    float _1202 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1196);
    float _1206 = -_1186;
    float _1208 = fma(_1206, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1200);
    float _1210 = exp2(_1202);
    float _1212 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1214 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1216 = fma(_1208, -0.5, 0.5);
    float _1218 = fma(_1208, 0.5, 0.5);
    float _1220 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1212);
    float _1222 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1214);
    float _1224 = _1182 + 1.0;
    float _1226 = log2(_1192);
    float _1228 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1220);
    float _1230 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1222);
    float _1232 = fma(_1218, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1234 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1228);
    float _1236 = fma(_1218, _1232, -0.212114393711090087890625);
    float _1238 = 1.0 / _1204;
    float _1240 = -_1182;
    float _1242 = fma(_1210, _1224, _1240);
    float _1244 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1230);
    float _1246 = fma(_1218, _1236, 1.570728778839111328125);
    float _1248 = fma(_1242, 0.5, 0.5);
    float _1250 = sqrt(_1216);
    float _1252 = _1226 * 0.693147182464599609375;
    float _1254 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1256 = _1234 * _1238;
    float _1258 = _1244 * _1238;
    float _1260 = fma(_1256, 0.5, 0.5);
    float _1262 = fma(_1258, -0.5, 0.5);
    float _1264 = _1250 * 0.636619746685028076171875;
    float3 _3950 = float3(_1260, _1262, _1254);
    float _1266 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3950, float3(0.0), isnan(_3950)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3950, float3(0.0), isnan(_3950)), level(0.0)).x;
    float _1268 = -_1246;
    float _1270 = fma(_1264, _1268, 1.0);
    float3 _3966 = float3(_1260, _1262, _1254);
    float4 _1273 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3966, float3(0.0), isnan(_3966)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3966, float3(0.0), isnan(_3966)), level(0.0)).xyzw;
    float _1275 = _1273.x;
    float _1277 = _1273.y;
    float _1279 = _1273.z;
    float _1281 = _1273.w;
    float2 _3983 = float2(_1270, _1248);
    float3 _1285 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3983, float2(0.0), isnan(_3983)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3983, float2(0.0), isnan(_3983)), level(0.0)).xyz;
    float _1287 = _1285.x;
    float _1289 = _1285.y;
    float _1291 = _1285.z;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1295 = _358 + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1299 = _358 + _1297;
    float _1301 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1303;
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1309 = _1307 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1313 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1311;
    float _1315 = 1.0 / _1309;
    bool _1317 = _610 != 0.0;
    bool _1319 = isnan(_610);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan(0.0);
    bool _1325 = _1321 || _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1327;
    bool _1331 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1333 = isnan(_358);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1339 = _1335 || _1337;
    float _1341 = float(_1339);
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1343;
    bool _1347 = _608 == 0.0;
    bool _1349 = !_1325;
    bool _1351 = _1347 && _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1355 = _1353 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _1357 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1359 = isnan(_358);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1365 = _1361 || _1363;
    float _1367 = float(_1365);
    float _1369 = 1.0 / _1305;
    float _1371 = -_1341;
    float _1373 = _1371 + 1.0;
    bool _1375 = _612 == 0.0;
    bool _1377 = _1375 && _1351;
    float _1379 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1381 = _1379 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1383 = -_1367;
    float _1385 = _1383 + 1.0;
    float _1387 = _1367 * _1373;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    out.m_61.x = _938;
    out.m_61.y = _936;
    out.m_61.z = _940;
    float _1393 = _1299 * _1315;
    float _1395 = exp2(_1301);
    float _1397 = fma(_1391, _1393, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1399 = fma(_1355, _1393, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1401 = fma(_1381, _1393, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1403 = _1295 * _1369;
    float _1405 = in.m_63.x;
    float _1407 = in.m_63.y;
    float _1409 = in.m_63.z;
    float _1411 = fma(_1313, _1403, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1413 = fma(_1329, _1403, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1415 = fma(_1345, _1403, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1417 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1419 = isnan(_358);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1425 = _1421 || _1423;
    float _1427 = float(_1425);
    float _1429 = in.m_65.x;
    float _1431 = in.m_65.y;
    float _1433 = in.m_65.z;
    float _1435 = in.m_65.w;
    float _1437 = -_1395;
    float _1439 = _1437 + 1.0;
    float _1441 = _1427 * _1385;
    float _1443 = -_1427;
    float _1445 = _1443 + 1.0;
    float _1447 = _1413 * _1441;
    float _1449 = _1411 * _1441;
    float _1451 = _1415 * _1441;
    float _1453 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1447);
    float _1455 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1449);
    float _1457 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1451);
    float _1459 = fma(_1399, _1387, _1453);
    float _1461 = fma(_1397, _1387, _1455);
    float _1463 = _1413;
    float _1465 = _1449;
    float _1467 = _1393;
    float _1469 = _1405;
    float _1471 = _1244;
    float _1473 = _1234;
    if (_1377)
    {
        _1463 = _1405;
    }
    float _1475 = _1463;
    float _1477 = fma(_1401, _1387, _1457);
    float _1479 = _1475;
    if (_1377)
    {
        _1465 = _1407;
    }
    float _1481 = _1465;
    float _1483 = _1481;
    if (!_1377)
    {
        float _1485 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1407);
        _1483 = _1485;
    }
    float _1487 = _1483;
    if (_1377)
    {
        _1467 = _1475;
    }
    float _1489 = _1467;
    float _1491 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1461);
    float _1493 = _1489;
    if (!_1377)
    {
        _1479 = _1405;
    }
    float _1495 = _1479;
    float _1497 = _1431 * _1409;
    if (_1377)
    {
        _1469 = _1409;
    }
    float _1499 = _1469;
    float _1501 = _1499;
    if (!_1377)
    {
        float _1503 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1409);
        _1501 = _1503;
    }
    float _1505 = _1501;
    float _1507 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1459);
    float _1509 = _1433 * _1495;
    if (!_1377)
    {
        float _1511 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1495);
        _1493 = _1511;
    }
    float _1513 = _1493;
    float _1515 = _1429 * _1407;
    float _1517 = -_1497;
    float _1519 = fma(_1433, _1407, _1517);
    float _1521 = -_1509;
    float _1523 = fma(_1429, _1409, _1521);
    float _1525 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1477);
    float _1527 = -_1515;
    float _1529 = fma(_1431, _1495, _1527);
    float _1531 = _1491 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1533 = _1523 * _1435;
    float _1535 = _1519 * _1435;
    float _1537 = _1529 * _1435;
    float _1539 = -_1487;
    float _1541 = _698 * _1539;
    float _1543 = -_1431;
    float _1545 = _698 * _1543;
    float _1547 = -_1533;
    float _1549 = _698 * _1547;
    float _1551 = _1507 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1553 = fma(_710, _1513, _1541);
    float _1555 = fma(_710, _1429, _1545);
    float _1557 = fma(_710, _1535, _1549);
    float _1559 = _708 * _1431;
    float _1561 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1563 = _712 * _1431;
    float _1565 = _708 * _1487;
    float _1567 = _712 * _1487;
    float _1569 = fma(_726, _1429, _1559);
    float _1571 = _708 * _1533;
    float _1573 = _1531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1575 = _1551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1577 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1579 = _712 * _1533;
    float _1581 = fma(_720, _1429, _1563);
    float _1583 = fma(_724, _1433, _1569);
    float _1585 = fma(_726, _1535, _1571);
    float _1587 = fma(_714, _1433, _1555);
    out.m_67.x = _1573;
    out.m_67.y = _1575;
    out.m_67.z = _1577;
    float _1589 = fma(_726, _1513, _1565);
    float _1591 = fma(_720, _1513, _1567);
    float _1593 = fma(_720, _1535, _1579);
    float _1595 = fma(_730, _1433, _1581);
    float _1597 = _1583 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1599 = fma(_714, _1505, _1553);
    float _1601 = fma(_714, _1537, _1557);
    float _1603 = fma(_724, _1505, _1589);
    float _1605 = fma(_730, _1505, _1591);
    float _1607 = fma(_724, _1537, _1585);
    float _1609 = fma(_730, _1537, _1593);
    float _1611 = _1583 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1613 = _1583 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1615 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1597);
    float _1617 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1619 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1611);
    float _1621 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1613);
    float _1623 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1625 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1627 = _1607 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1629 = fma(_1599, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1617);
    float _1631 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1623);
    float _1633 = fma(_1599, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1625);
    float _1635 = _1607 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1637 = fma(_1601, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1627);
    float _1639 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1631);
    float _1641 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1643 = _1607 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1645 = fma(_1601, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1635);
    float _1647 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1639);
    float _1649 = fma(_1599, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1641);
    float _1651 = fma(_1595, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1615);
    float _1653 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1655 = fma(_1595, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1619);
    float _1657 = fma(_1595, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1621);
    float _1659 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1637);
    float _1661 = _1647 + _1204;
    float _1663 = fma(_1601, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1643);
    float _1665 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1645);
    out.m_69.x = _1651;
    out.m_69.y = _1655;
    out.m_69.z = _1657;
    float _1667 = _1661 * 0.5;
    float _1669 = fma(_1605, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1629);
    float _1671 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1663);
    float _1673 = fma(_1605, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1649);
    float _1675 = fma(_1605, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1633);
    bool _1677 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1679 = isnan(_968);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1685 = _1681 || _1683;
    out.m_71.x = _1659;
    out.m_71.y = _1665;
    out.m_71.z = _1671;
    float _1687 = -_1653;
    float _1689 = _1687 + 1.0;
    out.m_73.z = _1667;
    out.m_73.w = _1204;
    out.m_75.x = _1673;
    out.m_75.y = _1669;
    out.m_75.z = _1675;
    float _1691 = _1605;
    float _1693 = _1657;
    float _1695 = _1655;
    float _1697 = _1689;
    if (!_1685)
    {
        _1691 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1699 = _1691;
    out.gl_Position.x = _1234;
    out.gl_Position.y = _1244;
    out.gl_Position.z = _1647;
    out.gl_Position.w = _1204;
    float _1701 = _1699;
    float _1703 = _1699;
    if (!_1685)
    {
        _1693 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1705 = _1693;
    float _1707 = _1705;
    float _1709 = _1705;
    if (!_1685)
    {
        _1695 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1711 = _1695;
    float _1713 = _1711;
    float _1715 = _1711;
    if (!_1685)
    {
        _1471 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1717 = _1471;
    float _1719 = _1717;
    float _1721 = _1717;
    if (!_1685)
    {
        _1473 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1723 = _1473;
    float _1725 = _1653 * _1266;
    float _1727 = _1281 * _1725;
    float _1729 = _1281 * _1689;
    float _1731 = _1723;
    float _1733 = _1723;
    if (!_1685)
    {
        _1697 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1735 = _1697;
    float _1737 = _1291 * _1725;
    float _1739 = fma(_1287, _1727, _1275);
    float _1741 = fma(_1289, _1727, _1277);
    float _1743 = fma(_1281, _1737, _1279);
    out.m_77.x = _1739;
    out.m_77.y = _1741;
    out.m_77.z = _1743;
    out.m_77.w = _1729;
    bool _1745 = !_1685;
    float _1747 = _1735;
    float _1749 = _1735;
    if (!_1745)
    {
        bool _1751 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1753 = isnan(_968);
        bool _1755 = _1751 || _1753;
        bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1759 = _1755 || _1757;
        if (!_1759)
        {
            float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1763 = _968 + _1761;
            float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1767 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1765;
            float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1771 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1773 = 1.0 / _1767;
            float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1777 = _1775 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1781 = _1779 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1785 = _1783 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1791 = _1763 * _1773;
            float _1793 = precise::clamp(_1791, 0.0, 1.0);
            float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1797 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1799 = fma(_1793, _1771, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1801 = fma(_1793, _1797, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1803 = fma(_1793, _1777, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1805 = fma(_1793, _1781, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1807 = fma(_1793, _1785, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1809 = fma(_1793, _1789, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1733 = _1803;
            _1715 = _1807;
            _1721 = _1799;
            _1709 = _1805;
            _1703 = _1801;
            _1749 = _1809;
            _1811 = true;
        }
        else
        {
            bool _1813 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1815 = isnan(_968);
            bool _1817 = _1813 || _1815;
            bool _1819 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1821 = _1817 || _1819;
            if (!_1821)
            {
                _1719 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1823 = _1719;
            _1721 = _1823;
            if (!_1821)
            {
                _1731 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1825 = _1731;
            _1733 = _1825;
            if (!_1821)
            {
                _1701 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1827 = _1701;
            _1703 = _1827;
            if (!_1821)
            {
                _1707 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1829 = _1707;
            _1709 = _1829;
            if (!_1821)
            {
                _1713 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1831 = _1713;
            _1715 = _1831;
            if (!_1821)
            {
                _1747 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1833 = _1747;
            bool _1835 = !_1821;
            _1749 = _1833;
            if (!_1835)
            {
                bool _1837 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1839 = isnan(_968);
                bool _1841 = _1837 || _1839;
                bool _1843 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1845 = _1841 || _1843;
                if (!_1845)
                {
                    float _1847 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1849 = _968 + _1847;
                    float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1853 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1851;
                    float _1855 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1857 = _1855 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1859 = 1.0 / _1853;
                    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1863 = _1861 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1867 = _1865 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1871 = _1869 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1875 = _1873 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1877 = _1849 * _1859;
                    float _1879 = precise::clamp(_1877, 0.0, 1.0);
                    float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1883 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1885 = fma(_1879, _1857, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1887 = fma(_1879, _1883, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1889 = fma(_1879, _1863, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1891 = fma(_1879, _1867, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1893 = fma(_1879, _1871, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1895 = fma(_1879, _1875, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1733 = _1889;
                    _1715 = _1893;
                    _1721 = _1885;
                    _1709 = _1891;
                    _1703 = _1887;
                    _1749 = _1895;
                    _1811 = true;
                }
                else
                {
                    _1733 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1715 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1721 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1709 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1703 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1749 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1811 = false;
    float _1897 = _1733;
    float _1899 = _1715;
    float _1901 = _1721;
    float _1903 = _1709;
    float _1905 = _1703;
    float _1907 = _1749;
    float _1909 = fma(_1669, -0.5, 0.5);
    float _1911 = precise::clamp(_1909, 0.0, 1.0);
    float _1913 = -_1897;
    float _1915 = _1913 + _1899;
    float _1917 = -_1901;
    float _1919 = _1917 + _1903;
    float _1921 = -_1905;
    float _1923 = _1921 + _1907;
    bool _1925 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1927 = fma(_1911, _1915, _1897);
    float _1929 = fma(_1911, _1919, _1901);
    float _1931 = fma(_1911, _1923, _1905);
    float _1933 = _1927 * 0.586610972881317138671875;
    out.m_79.x = 0.0;
    float _1935 = fma(_1929, 0.298911988735198974609375, _1933);
    float _1937 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1939 = fma(_1931, 0.114477999508380889892578125, _1935);
    out.m_47.x = _1937;
    float _1941 = -_1939;
    float _1943 = _1929 + _1941;
    float _1945 = -_1939;
    float _1947 = _1927 + _1945;
    float _1949 = -_1939;
    float _1951 = _1931 + _1949;
    out.m_81.x = 0.0;
    float _1953 = fma(_1943, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1939);
    float _1955 = fma(_1947, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1939);
    float _1957 = fma(_1951, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1939);
    out.m_83.x = _1953;
    out.m_83.y = _1955;
    out.m_83.z = _1957;
    if (!_1925)
    {
        return out;
    }
    float _1959 = -_936;
    float _1961 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1963 = -_938;
    float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1967 = -_940;
    float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1971 = _1961 * _1961;
    float _1973 = fma(_1965, _1965, _1971);
    float _1975 = fma(_1969, _1969, _1973);
    float _1977 = rsqrt(_1975);
    float _1979 = _1961 * _1977;
    float _1981 = _1965 * _1977;
    float _1983 = _1969 * _1977;
    float _1985 = sqrt(_1975);
    float _1987 = -_974;
    float _1989 = _1987 + _1979;
    float _1991 = -_970;
    float _1993 = _1991 + _1981;
    float _1995 = -_972;
    float _1997 = _1995 + _1983;
    float _1999 = _1989 * _1989;
    float _2001 = fma(_1993, _1993, _1999);
    float _2003 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2005 = precise::clamp(_2003, 0.0, 1.0);
    float _2007 = fma(_1997, _1997, _2001);
    float _2009 = _2005 * _2005;
    float _2011 = -_1985;
    float _2013 = _2011 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2015 = _2009 + (-1.0);
    float _2017 = rsqrt(_2007);
    float _2019 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2021 = precise::clamp(_2019, 0.0, 1.0);
    float _2023 = abs(_2021);
    float _2025 = log2(_2023);
    float _2027 = _1989 * _2017;
    float _2029 = _1993 * _2017;
    float _2031 = _1997 * _2017;
    float _2033 = _1669 * _2027;
    float _2035 = _1669 * _1979;
    float _2037 = fma(_1673, _2029, _2033);
    float _2039 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2041 = fma(_1673, _1981, _2035);
    float _2043 = fma(_1675, _2031, _2037);
    float _2045 = precise::clamp(_2043, 0.0, 1.0);
    float _2047 = fma(_1675, _1983, _2041);
    float _2049 = precise::clamp(_2047, 0.0, 1.0);
    float _2051 = exp2(_2039);
    float _2053 = _2045 * _2045;
    float _2055 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2057 = fma(_2053, _2015, 1.0);
    float _2059 = -_1979;
    float _2061 = -_2055;
    float _2063 = fma(_2059, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2061);
    float _2065 = _2057 * _2057;
    float _2067 = -_1983;
    float _2069 = fma(_2067, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2063);
    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2073 = _2069 + _2071;
    float _2075 = 1.0 / _2065;
    float _2077 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2079 = precise::clamp(_2077, 0.0, 1.0);
    float _2081 = _2051 * _2079;
    float _2083 = _2049 * _2081;
    float _2085 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2087 = _2009 * _2075;
    float _2089 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2091 = _2083 * _2087;
    float _2093 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2095 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2097 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2099 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_79.x = _2085;
    out.m_79.y = _2093;
    out.m_79.z = _2089;
    out.m_81.x = _2095;
    out.m_81.y = _2097;
    out.m_81.z = _2099;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1811 = false;
    bool _350 = false;
    bool _182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_106)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2155 = as_type<float>(_116);
        out.gl_Position.z = _2155;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_49.w;
    float _122 = in.m_51.w;
    bool _124 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_120);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_120;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.w = _122;
    float _138 = 0.0;
    float _140 = _136;
    if (_132)
    {
        float _142 = float(_102);
        _138 = _142;
    }
    float _144 = _138;
    bool _146 = _136 >= _144;
    bool _148 = !_132;
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
        _118 = as_type<int>(_156);
    }
    int _158 = _118;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2229 = as_type<float>(_158);
        out.gl_Position.z = _2229;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _162 = !_160;
    float _180;
    if (!_162)
    {
        float _164 = in.m_51.x;
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _170 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _172 = _170 * _166;
        float _174 = floor(_172);
        float _176 = -_174;
        float _178 = _172 + _176;
        _180 = _178;
        _182 = true;
    }
    else
    {
        float _184 = float(_102);
        float _186 = 1.0 / _184;
        float _188 = _136 * _186;
        _180 = _188;
    }
    _182 = false;
    float _190 = _180;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _194 = _190 + _192;
    bool _196 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _198 = isnan(_190);
    bool _200 = _196 || _198;
    bool _202 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _204 = _200 || _202;
    float _206 = float(_204);
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _190 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = 1.0 / _214;
    bool _222 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _224 = 1.0 / _218;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _226;
    float _230 = _194 * _220;
    bool _232 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _234 = isnan(_190);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    float _244 = -_206;
    float _246 = _244 + 1.0;
    bool _248 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _250 = isnan(_190);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = fma(_228, _230, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _262 = _258 * _246;
    float _264 = -_258;
    float _266 = _264 + 1.0;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _272;
    float _276 = _210 * _224;
    float _278 = _242 * _266;
    float _280 = fma(_270, _230, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _282 = fma(_274, _230, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _284 = -_242;
    float _286 = _284 + 1.0;
    float _288 = _260 * _278;
    float _290 = _280 * _278;
    float _292 = _282 * _278;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _306 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].x, _290);
    float _308 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].y, _288);
    float _310 = fma(_296, _276, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _312 = fma(_300, _276, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _314 = fma(_304, _276, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _316 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].z, _292);
    float _318 = fma(_310, _262, _306);
    float _320 = fma(_312, _262, _308);
    float _322 = fma(_314, _262, _316);
    float _324 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].x, _318);
    float _326 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].y, _320);
    float _328 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].z, _322);
    bool _330 = !_222;
    float _348;
    if (!_330)
    {
        float _332 = in.m_51.x;
        float _334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _336 = _332 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[11].x, _136);
        float _340 = _338 * _334;
        float _342 = floor(_340);
        float _344 = -_342;
        float _346 = _340 + _344;
        _348 = _346;
        _350 = true;
    }
    else
    {
        float _352 = float(_102);
        float _354 = 1.0 / _352;
        float _356 = _136 * _354;
        _348 = _356;
    }
    _350 = false;
    float _358 = _348;
    float _360 = in.m_51.x;
    float _362 = in.m_51.y;
    float _364 = in.m_51.z;
    float _366 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _368 = log2(_366);
    int _370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _372 = _370 != 0;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _376 = _374 != 0;
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _380 = _378 != 0;
    float _382 = _368 * _136;
    float _384 = exp2(_382);
    float _386 = _364 * 2.0;
    float _388 = _360 * 2.0;
    float _390 = _362 + _364;
    float _392 = _362 + _360;
    float _394 = _362 * 2.0;
    float _396 = _362 + (-0.5);
    float _398 = _390 + (-1.0);
    float _400 = floor(_386);
    float _402 = _392 + (-1.0);
    float _404 = floor(_388);
    float _406 = -_384;
    float _408 = _406 + 1.0;
    bool _410 = _400 > 0.0;
    float _412 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _414 = _400 >= 0.0;
    bool _416 = isnan(_400);
    bool _418 = _414 || _416;
    bool _420 = isnan(0.0);
    bool _422 = _418 || _420;
    float _424 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _426 = floor(_394);
    int _428 = _422 ? 0 : 1;
    bool _430 = _404 > 0.0;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _434 = 1.0 + _432;
    bool _436 = _404 >= 0.0;
    bool _438 = isnan(_404);
    bool _440 = _436 || _438;
    bool _442 = isnan(0.0);
    bool _444 = _440 || _442;
    bool _446 = !_372;
    int _448 = _446 ? 0 : 1;
    float _450 = 1.0 / _434;
    float _452 = in.m_55.x;
    float _454 = in.m_55.y;
    float _456 = in.m_55.z;
    int _458 = ~_428;
    int _460 = _458 + 1;
    int _462 = _460 + 1;
    int _464 = _462;
    if (!_410)
    {
        int _466 = ~_428;
        int _468 = _466 + 1;
        _464 = _468;
    }
    int _470 = _464;
    int _472 = abs(_448);
    bool _474 = !_376;
    int _476 = _474 ? 0 : 1;
    bool _478 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _480 = isnan(1.0);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _486 = _482 || _484;
    int _488 = _444 ? 0 : 1;
    int _490 = abs(_476);
    bool _492 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _494 = isnan(0.0);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _500 = _496 || _498;
    float _502 = float(_472);
    float _504 = float(_470);
    int _506 = ~_488;
    int _508 = _506 + 1;
    int _510 = _508 + 1;
    int _512 = _510;
    if (!_430)
    {
        int _514 = ~_488;
        int _516 = _514 + 1;
        _512 = _516;
    }
    int _518 = _512;
    float _520 = _502 * _504;
    float _522 = _500 ? _408 : 0.0;
    bool _524 = _426 > 0.0;
    float _526 = float(_490);
    if (_486)
    {
        float _528 = _522 * _450;
        _140 = _528;
    }
    float _530 = _140;
    float _532 = float(_518);
    float _534 = _520 * (-2.0);
    bool _536 = _426 >= 0.0;
    bool _538 = isnan(_426);
    bool _540 = _536 || _538;
    bool _542 = isnan(0.0);
    bool _544 = _540 || _542;
    bool _546 = !_380;
    int _548 = _546 ? 0 : 1;
    float _550 = _526 * _532;
    float _552 = _360 + (-0.5);
    float _554 = fma(_534, _452, _452);
    int _556 = _544 ? 0 : 1;
    float _558 = fma(_424, _534, _424);
    float _560 = _550 * (-2.0);
    float _562 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[196].x, _554);
    int _564 = ~_556;
    int _566 = _564 + 1;
    int _568 = _566 + 1;
    int _570 = abs(_548);
    float _572 = fma(_558, _530, _562);
    int _574 = _568;
    if (!_524)
    {
        int _576 = ~_556;
        int _578 = _576 + 1;
        _574 = _578;
    }
    int _580 = _574;
    float _582 = fma(_412, _560, _412);
    float _584 = fma(_560, _454, _454);
    float _586 = float(_570);
    float _588 = _364 + _360;
    float _590 = float(_580);
    float _592 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[196].y, _584);
    float _594 = _364 + (-0.5);
    float _596 = in.m_57.x;
    float _598 = in.m_57.y;
    float _600 = in.m_57.z;
    float _602 = _586 * _590;
    float _604 = fma(_582, _530, _592);
    float _606 = _588 + (-1.0);
    float _608 = in.m_59.x;
    float _610 = in.m_59.y;
    float _612 = in.m_59.z;
    float _614 = _602 * (-2.0);
    float _616 = _604 * 0.15915493667125701904296875;
    float _618 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _620 = _572 * 0.15915493667125701904296875;
    float _622 = fma(_614, _456, _456);
    float _624 = _616 * 6.283185482025146484375;
    float _626 = sin(_624);
    float _628 = fma(_618, _614, _618);
    float _630 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[196].z, _622);
    float _632 = fma(_628, _530, _630);
    float _634 = _620 * 6.283185482025146484375;
    float _636 = sin(_634);
    float _638 = _632 * 0.15915493667125701904296875;
    float _640 = _324 * _596;
    float _642 = _326 * _598;
    float _644 = _620 * 6.283185482025146484375;
    float _646 = cos(_644);
    float _648 = in.m_44.x;
    float _650 = in.m_44.y;
    float _652 = in.m_44.z;
    float _654 = _328 * _600;
    float _656 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _612);
    float _658 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _608);
    float _660 = _640 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _662 = _654 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _610);
    float _666 = _616 * 6.283185482025146484375;
    float _668 = cos(_666);
    float _670 = _642 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _672 = _656 * _662;
    float _674 = _658 * _660;
    float _676 = _636 * _626;
    float _678 = _664 * _670;
    bool _680 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _682 = isnan(0.5);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _688 = _684 || _686;
    float _690 = _638 * 6.283185482025146484375;
    float _692 = cos(_690);
    float _694 = _646 * _626;
    float _696 = _638 * 6.283185482025146484375;
    float _698 = sin(_696);
    float _700 = _636 * _668;
    float _702 = _646 * _668;
    float _704 = _650 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _706 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[6].x, _704);
    float _708 = _646 * _692;
    float _710 = _668 * _692;
    float _712 = _636 * _692;
    float _714 = _626 * _692;
    float _716 = _712 * _678;
    float _718 = -_694;
    float _720 = fma(_698, _700, _718);
    float _722 = -_700;
    float _724 = fma(_698, _694, _722);
    float _726 = fma(_698, _702, _676);
    float _728 = _708 * _678;
    float _730 = fma(_698, _676, _702);
    float _732 = -_678;
    float _734 = _698 * _732;
    float _736 = fma(_720, _674, _716);
    float _738 = fma(_726, _674, _728);
    float _740 = _650 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _742 = fma(_710, _674, _734);
    float _744 = fma(_730, _672, _736);
    float _746 = fma(_724, _672, _738);
    float _748 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[4].x, _740);
    float _750 = fma(_714, _672, _742);
    float _752 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[6].z, _706);
    float _754 = _746 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _756 = _746 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _758 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[4].z, _748);
    float _760 = _752 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _762 = fma(_750, (*spvDescriptorSet0.vp_c10)._m0[10].x, _754);
    float _764 = fma(_750, (*spvDescriptorSet0.vp_c10)._m0[8].x, _756);
    float _766 = _758 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _768 = _650 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _770 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[10].z, _762);
    float _772 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[8].z, _764);
    float _774 = _746 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _776 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[5].x, _768);
    float _778 = _760 + _770;
    float _780 = _766 + _772;
    float _782 = fma(_750, (*spvDescriptorSet0.vp_c10)._m0[9].x, _774);
    float _784 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[5].z, _776);
    float _786 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _788 = _778 + _786;
    float _790 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _792 = _780 + _790;
    float _794 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[9].z, _782);
    float _796 = _784 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _798 = _788 * _788;
    float _800 = _796 + _794;
    float _802 = fma(_792, _792, _798);
    float _804 = sqrt(_802);
    bool _806 = _804 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _808 = _648;
    float _810 = _652;
    float _812 = _784;
    float _814 = _804;
    float _816 = _780;
    float _818 = _792;
    if (!_806)
    {
        _808 = _780;
    }
    float _820 = _808;
    float _822 = _820;
    if (!_806)
    {
        _810 = _778;
    }
    float _824 = _810;
    float _826 = _824;
    if (!_806)
    {
        _812 = _800;
    }
    float _828 = _812;
    bool _830 = !_806;
    float _832 = _828;
    if (!_830)
    {
        float _834 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _838 = _804 + _836;
        float _840 = rsqrt(_802);
        float _842 = _838 * _834;
        float _844 = _800 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _846 = _842 * 0.15915493667125701904296875;
        float _848 = _846 * 6.283185482025146484375;
        float _850 = cos(_848);
        float _852 = _846 * 6.283185482025146484375;
        float _854 = sin(_852);
        float _856 = _850 + (-1.0);
        float _858 = _856 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _860 = fma(_854, _844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _862 = fma(_800, _850, _858);
        float _864 = _840 * _860;
        float _866 = fma(_792, _864, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _868 = fma(_788, _864, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _822 = _866;
        _832 = _862;
        _826 = _868;
        _814 = _844;
    }
    float _870 = _822;
    float _872 = _832;
    float _874 = _826;
    float _876 = _814;
    float _878 = _872;
    float _880 = _870;
    float _882 = _874;
    float _884 = _876;
    if (!_688)
    {
        float _886 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _888 = _796 + _886;
        float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _892 = _766 + _890;
        float _894 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _896 = -_766;
        float _898 = _896 + _870;
        float _900 = _888 * _888;
        float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _904 = _760 + _902;
        float _906 = -_796;
        float _908 = _906 + _872;
        float _910 = fma(_892, _892, _900);
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _914 = fma(_904, _904, _910);
        float _916 = sqrt(_914);
        float _918 = _894 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _920 = precise::min(_916, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _922 = _920 * _912;
        float _924 = _918 * _922;
        float _926 = -_760;
        float _928 = _926 + _874;
        float _930 = fma(_898, _924, _766);
        float _932 = fma(_908, _924, _796);
        float _934 = fma(_928, _924, _760);
        _878 = _932;
        _880 = _930;
        _882 = _934;
        _816 = _916;
        _884 = _928;
        _818 = _924;
    }
    float _936 = _878;
    float _938 = _880;
    float _940 = _882;
    float _942 = _816;
    float _944 = _884;
    float _946 = _818;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _950 = _936 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _954 = _938 + _952;
    float _956 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _958 = _940 + _956;
    float _960 = _950 * _950;
    float _962 = fma(_954, _954, _960);
    float _964 = fma(_958, _958, _962);
    float _966 = rsqrt(_964);
    float _968 = sqrt(_964);
    float _970 = _954 * _966;
    float _972 = _958 * _966;
    float _974 = _950 * _966;
    float _976 = _970 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _978 = _972 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _980 = _976 * _976;
    float _982 = _978 * _978;
    float _984 = _980 + _982;
    float _986 = sqrt(_984);
    bool _988 = _986 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _992 = _986 + _990;
    float _994 = _796;
    float _996 = _984;
    float _998 = _992;
    float _1000 = _942;
    float _1002 = _966;
    float _1004 = _946;
    if (_988)
    {
        float _1006 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _994 = _1006;
    }
    float _1008 = _994;
    if (_988)
    {
        float _1010 = rsqrt(_984);
        _996 = _1010;
    }
    float _1012 = _996;
    if (_988)
    {
        float _1014 = _992 * _1008;
        _998 = _1014;
    }
    float _1016 = _998;
    if (_988)
    {
        float _1018 = _1016 * 0.15915493667125701904296875;
        _1000 = _1018;
    }
    float _1020 = _1000;
    float _1022 = _1008;
    float _1024 = _1020;
    if (_988)
    {
        float _1026 = _1020 * 6.283185482025146484375;
        float _1028 = sin(_1026);
        _1022 = _1028;
    }
    float _1030 = _1022;
    float _1032 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1034 = precise::max(0.0, _1032);
    float _1036 = _944;
    float _1038 = _1034;
    if (_988)
    {
        float _1040 = _1020 * 6.283185482025146484375;
        float _1042 = cos(_1040);
        _1036 = _1042;
    }
    float _1044 = _1036;
    float _1046 = -_974;
    float _1048 = -_1034;
    float _1050 = fma(_1046, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1048);
    if (_988)
    {
        float _1052 = _1050 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1038 = _1052;
    }
    float _1054 = _1038;
    float _1056 = _1054;
    if (!_988)
    {
        _1024 = _980;
    }
    float _1058 = _1024;
    float _1060 = _1030;
    float _1062 = _1058;
    if (_988)
    {
        float _1064 = fma(_1030, _1054, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1060 = _1064;
    }
    float _1066 = _1060;
    float _1068 = _1066;
    if (!_988)
    {
        _1056 = _1050;
    }
    float _1070 = _1056;
    float _1072 = _1070;
    float _1074 = _1044;
    if (_988)
    {
        float _1076 = _1044 + (-1.0);
        _1002 = _1076;
    }
    float _1078 = _1002;
    float _1080 = 0.0;
    float _1082 = _1078;
    if (_988)
    {
        float _1084 = _1012 * _1066;
        _1080 = _1084;
    }
    float _1086 = _1080;
    if (!_988)
    {
        _1068 = _976;
    }
    float _1088 = _1068;
    float _1090 = _936 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1092 = _1088;
    if (_988)
    {
        float _1094 = _1078 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1004 = _1094;
    }
    float _1096 = _1004;
    if (_988)
    {
        float _1098 = _976 * _1086;
        _1092 = _1098;
    }
    float _1100 = _1092;
    if (!_988)
    {
        _1082 = _978;
    }
    float _1102 = _1082;
    float _1104 = _1102;
    if (_988)
    {
        float _1106 = _978 * _1086;
        _1104 = _1106;
    }
    float _1108 = _1104;
    if (_988)
    {
        float _1110 = fma(_1050, _1044, _1096);
        _1072 = _1110;
    }
    float _1112 = _1072;
    if (_988)
    {
        float _1114 = _1100 * _1100;
        _1062 = _1114;
    }
    float _1116 = _1062;
    if (!_988)
    {
        _1074 = _982;
    }
    float _1118 = _1074;
    float _1120 = _1118;
    if (_988)
    {
        float _1122 = _1108 * _1108;
        _1120 = _1122;
    }
    float _1124 = _1120;
    float _1126 = fma(_1112, _1112, _1116);
    float _1128 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1130 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1090);
    float _1132 = _936 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1134 = _1126 + _1124;
    float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1138 = fma(_968, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1136);
    float _1140 = precise::clamp(_1138, 0.0, 1.0);
    float _1142 = _936 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1144 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1130);
    float _1146 = rsqrt(_1134);
    float _1148 = -_1140;
    float _1150 = _1148 + 1.0;
    float _1152 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1142);
    float _1154 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1132);
    float _1156 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1158 = _936 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1160 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1152);
    float _1162 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1154);
    float _1164 = abs(_1150);
    float _1166 = log2(_1164);
    float _1168 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1158);
    float _1170 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1172 = _1162 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1174 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1176 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1168);
    float _1178 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1180 = _1146 * _1100;
    float _1182 = _1146 * _1112;
    float _1184 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1178);
    float _1186 = _1146 * _1108;
    float _1188 = _1180 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1190 = -_1174;
    float _1192 = fma(_1190, _1128, 1.0);
    float _1194 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1196 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1184);
    float _1198 = -_1188;
    float _1200 = fma(_1182, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1198);
    float _1202 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1196);
    float _1206 = -_1186;
    float _1208 = fma(_1206, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1200);
    float _1210 = exp2(_1202);
    float _1212 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1214 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1216 = fma(_1208, -0.5, 0.5);
    float _1218 = fma(_1208, 0.5, 0.5);
    float _1220 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1212);
    float _1222 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1214);
    float _1224 = _1182 + 1.0;
    float _1226 = log2(_1192);
    float _1228 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1220);
    float _1230 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1222);
    float _1232 = fma(_1218, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1234 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1228);
    float _1236 = fma(_1218, _1232, -0.212114393711090087890625);
    float _1238 = 1.0 / _1204;
    float _1240 = -_1182;
    float _1242 = fma(_1210, _1224, _1240);
    float _1244 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1230);
    float _1246 = fma(_1218, _1236, 1.570728778839111328125);
    float _1248 = fma(_1242, 0.5, 0.5);
    float _1250 = sqrt(_1216);
    float _1252 = _1226 * 0.693147182464599609375;
    float _1254 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1256 = _1234 * _1238;
    float _1258 = _1244 * _1238;
    float _1260 = fma(_1256, 0.5, 0.5);
    float _1262 = fma(_1258, -0.5, 0.5);
    float _1264 = _1250 * 0.636619746685028076171875;
    float3 _3950 = float3(_1260, _1262, _1254);
    float _1266 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3950, float3(0.0), isnan(_3950)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3950, float3(0.0), isnan(_3950)), level(0.0)).x;
    float _1268 = -_1246;
    float _1270 = fma(_1264, _1268, 1.0);
    float3 _3966 = float3(_1260, _1262, _1254);
    float4 _1273 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3966, float3(0.0), isnan(_3966)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3966, float3(0.0), isnan(_3966)), level(0.0)).xyzw;
    float _1275 = _1273.x;
    float _1277 = _1273.y;
    float _1279 = _1273.z;
    float _1281 = _1273.w;
    float2 _3983 = float2(_1270, _1248);
    float3 _1285 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3983, float2(0.0), isnan(_3983)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3983, float2(0.0), isnan(_3983)), level(0.0)).xyz;
    float _1287 = _1285.x;
    float _1289 = _1285.y;
    float _1291 = _1285.z;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1295 = _358 + _1293;
    float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1299 = _358 + _1297;
    float _1301 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1303 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1303;
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1309 = _1307 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1313 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1311;
    float _1315 = 1.0 / _1309;
    bool _1317 = _610 != 0.0;
    bool _1319 = isnan(_610);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan(0.0);
    bool _1325 = _1321 || _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1327;
    bool _1331 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1333 = isnan(_358);
    bool _1335 = _1331 || _1333;
    bool _1337 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1339 = _1335 || _1337;
    float _1341 = float(_1339);
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1343;
    bool _1347 = _608 == 0.0;
    bool _1349 = !_1325;
    bool _1351 = _1347 && _1349;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1355 = _1353 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _1357 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1359 = isnan(_358);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1365 = _1361 || _1363;
    float _1367 = float(_1365);
    float _1369 = 1.0 / _1305;
    float _1371 = -_1341;
    float _1373 = _1371 + 1.0;
    bool _1375 = _612 == 0.0;
    bool _1377 = _1375 && _1351;
    float _1379 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1381 = _1379 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1383 = -_1367;
    float _1385 = _1383 + 1.0;
    float _1387 = _1367 * _1373;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    out.m_61.x = _938;
    out.m_61.y = _936;
    out.m_61.z = _940;
    float _1393 = _1299 * _1315;
    float _1395 = exp2(_1301);
    float _1397 = fma(_1391, _1393, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1399 = fma(_1355, _1393, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1401 = fma(_1381, _1393, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1403 = _1295 * _1369;
    float _1405 = in.m_63.x;
    float _1407 = in.m_63.y;
    float _1409 = in.m_63.z;
    float _1411 = fma(_1313, _1403, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1413 = fma(_1329, _1403, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1415 = fma(_1345, _1403, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1417 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1419 = isnan(_358);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1425 = _1421 || _1423;
    float _1427 = float(_1425);
    float _1429 = in.m_65.x;
    float _1431 = in.m_65.y;
    float _1433 = in.m_65.z;
    float _1435 = in.m_65.w;
    float _1437 = -_1395;
    float _1439 = _1437 + 1.0;
    float _1441 = _1427 * _1385;
    float _1443 = -_1427;
    float _1445 = _1443 + 1.0;
    float _1447 = _1413 * _1441;
    float _1449 = _1411 * _1441;
    float _1451 = _1415 * _1441;
    float _1453 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1447);
    float _1455 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1449);
    float _1457 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1451);
    float _1459 = fma(_1399, _1387, _1453);
    float _1461 = fma(_1397, _1387, _1455);
    float _1463 = _1413;
    float _1465 = _1449;
    float _1467 = _1393;
    float _1469 = _1405;
    float _1471 = _1244;
    float _1473 = _1234;
    if (_1377)
    {
        _1463 = _1405;
    }
    float _1475 = _1463;
    float _1477 = fma(_1401, _1387, _1457);
    float _1479 = _1475;
    if (_1377)
    {
        _1465 = _1407;
    }
    float _1481 = _1465;
    float _1483 = _1481;
    if (!_1377)
    {
        float _1485 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1407);
        _1483 = _1485;
    }
    float _1487 = _1483;
    if (_1377)
    {
        _1467 = _1475;
    }
    float _1489 = _1467;
    float _1491 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1461);
    float _1493 = _1489;
    if (!_1377)
    {
        _1479 = _1405;
    }
    float _1495 = _1479;
    float _1497 = _1431 * _1409;
    if (_1377)
    {
        _1469 = _1409;
    }
    float _1499 = _1469;
    float _1501 = _1499;
    if (!_1377)
    {
        float _1503 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1409);
        _1501 = _1503;
    }
    float _1505 = _1501;
    float _1507 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1459);
    float _1509 = _1433 * _1495;
    if (!_1377)
    {
        float _1511 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1495);
        _1493 = _1511;
    }
    float _1513 = _1493;
    float _1515 = _1429 * _1407;
    float _1517 = -_1497;
    float _1519 = fma(_1433, _1407, _1517);
    float _1521 = -_1509;
    float _1523 = fma(_1429, _1409, _1521);
    float _1525 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1477);
    float _1527 = -_1515;
    float _1529 = fma(_1431, _1495, _1527);
    float _1531 = _1491 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1533 = _1523 * _1435;
    float _1535 = _1519 * _1435;
    float _1537 = _1529 * _1435;
    float _1539 = -_1487;
    float _1541 = _698 * _1539;
    float _1543 = -_1431;
    float _1545 = _698 * _1543;
    float _1547 = -_1533;
    float _1549 = _698 * _1547;
    float _1551 = _1507 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1553 = fma(_710, _1513, _1541);
    float _1555 = fma(_710, _1429, _1545);
    float _1557 = fma(_710, _1535, _1549);
    float _1559 = _708 * _1431;
    float _1561 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1563 = _712 * _1431;
    float _1565 = _708 * _1487;
    float _1567 = _712 * _1487;
    float _1569 = fma(_726, _1429, _1559);
    float _1571 = _708 * _1533;
    float _1573 = _1531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1575 = _1551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1577 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1579 = _712 * _1533;
    float _1581 = fma(_720, _1429, _1563);
    float _1583 = fma(_724, _1433, _1569);
    float _1585 = fma(_726, _1535, _1571);
    float _1587 = fma(_714, _1433, _1555);
    out.m_67.x = _1573;
    out.m_67.y = _1575;
    out.m_67.z = _1577;
    float _1589 = fma(_726, _1513, _1565);
    float _1591 = fma(_720, _1513, _1567);
    float _1593 = fma(_720, _1535, _1579);
    float _1595 = fma(_730, _1433, _1581);
    float _1597 = _1583 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1599 = fma(_714, _1505, _1553);
    float _1601 = fma(_714, _1537, _1557);
    float _1603 = fma(_724, _1505, _1589);
    float _1605 = fma(_730, _1505, _1591);
    float _1607 = fma(_724, _1537, _1585);
    float _1609 = fma(_730, _1537, _1593);
    float _1611 = _1583 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1613 = _1583 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1615 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1597);
    float _1617 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1619 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1611);
    float _1621 = fma(_1587, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1613);
    float _1623 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1625 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1627 = _1607 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1629 = fma(_1599, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1617);
    float _1631 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1623);
    float _1633 = fma(_1599, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1625);
    float _1635 = _1607 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1637 = fma(_1601, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1627);
    float _1639 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1631);
    float _1641 = _1603 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1643 = _1607 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1645 = fma(_1601, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1635);
    float _1647 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1639);
    float _1649 = fma(_1599, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1641);
    float _1651 = fma(_1595, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1615);
    float _1653 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1655 = fma(_1595, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1619);
    float _1657 = fma(_1595, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1621);
    float _1659 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1637);
    float _1661 = _1647 + _1204;
    float _1663 = fma(_1601, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1643);
    float _1665 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1645);
    out.m_69.x = _1651;
    out.m_69.y = _1655;
    out.m_69.z = _1657;
    float _1667 = _1661 * 0.5;
    float _1669 = fma(_1605, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1629);
    float _1671 = fma(_1609, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1663);
    float _1673 = fma(_1605, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1649);
    float _1675 = fma(_1605, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1633);
    bool _1677 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1679 = isnan(_968);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1685 = _1681 || _1683;
    out.m_71.x = _1659;
    out.m_71.y = _1665;
    out.m_71.z = _1671;
    float _1687 = -_1653;
    float _1689 = _1687 + 1.0;
    out.m_73.z = _1667;
    out.m_73.w = _1204;
    out.m_75.x = _1673;
    out.m_75.y = _1669;
    out.m_75.z = _1675;
    float _1691 = _1605;
    float _1693 = _1657;
    float _1695 = _1655;
    float _1697 = _1689;
    if (!_1685)
    {
        _1691 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1699 = _1691;
    out.gl_Position.x = _1234;
    out.gl_Position.y = _1244;
    out.gl_Position.z = _1647;
    out.gl_Position.w = _1204;
    float _1701 = _1699;
    float _1703 = _1699;
    if (!_1685)
    {
        _1693 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1705 = _1693;
    float _1707 = _1705;
    float _1709 = _1705;
    if (!_1685)
    {
        _1695 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1711 = _1695;
    float _1713 = _1711;
    float _1715 = _1711;
    if (!_1685)
    {
        _1471 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1717 = _1471;
    float _1719 = _1717;
    float _1721 = _1717;
    if (!_1685)
    {
        _1473 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1723 = _1473;
    float _1725 = _1653 * _1266;
    float _1727 = _1281 * _1725;
    float _1729 = _1281 * _1689;
    float _1731 = _1723;
    float _1733 = _1723;
    if (!_1685)
    {
        _1697 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1735 = _1697;
    float _1737 = _1291 * _1725;
    float _1739 = fma(_1287, _1727, _1275);
    float _1741 = fma(_1289, _1727, _1277);
    float _1743 = fma(_1281, _1737, _1279);
    out.m_77.x = _1739;
    out.m_77.y = _1741;
    out.m_77.z = _1743;
    out.m_77.w = _1729;
    bool _1745 = !_1685;
    float _1747 = _1735;
    float _1749 = _1735;
    if (!_1745)
    {
        bool _1751 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1753 = isnan(_968);
        bool _1755 = _1751 || _1753;
        bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1759 = _1755 || _1757;
        if (!_1759)
        {
            float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1763 = _968 + _1761;
            float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1767 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1765;
            float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1771 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1773 = 1.0 / _1767;
            float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1777 = _1775 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1781 = _1779 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1785 = _1783 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1791 = _1763 * _1773;
            float _1793 = precise::clamp(_1791, 0.0, 1.0);
            float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1797 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1799 = fma(_1793, _1771, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1801 = fma(_1793, _1797, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1803 = fma(_1793, _1777, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1805 = fma(_1793, _1781, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1807 = fma(_1793, _1785, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1809 = fma(_1793, _1789, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1733 = _1803;
            _1715 = _1807;
            _1721 = _1799;
            _1709 = _1805;
            _1703 = _1801;
            _1749 = _1809;
            _1811 = true;
        }
        else
        {
            bool _1813 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1815 = isnan(_968);
            bool _1817 = _1813 || _1815;
            bool _1819 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1821 = _1817 || _1819;
            if (!_1821)
            {
                _1719 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1823 = _1719;
            _1721 = _1823;
            if (!_1821)
            {
                _1731 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1825 = _1731;
            _1733 = _1825;
            if (!_1821)
            {
                _1701 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1827 = _1701;
            _1703 = _1827;
            if (!_1821)
            {
                _1707 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1829 = _1707;
            _1709 = _1829;
            if (!_1821)
            {
                _1713 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1831 = _1713;
            _1715 = _1831;
            if (!_1821)
            {
                _1747 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1833 = _1747;
            bool _1835 = !_1821;
            _1749 = _1833;
            if (!_1835)
            {
                bool _1837 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1839 = isnan(_968);
                bool _1841 = _1837 || _1839;
                bool _1843 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1845 = _1841 || _1843;
                if (!_1845)
                {
                    float _1847 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1849 = _968 + _1847;
                    float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1853 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1851;
                    float _1855 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1857 = _1855 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1859 = 1.0 / _1853;
                    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1863 = _1861 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1867 = _1865 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1871 = _1869 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1875 = _1873 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1877 = _1849 * _1859;
                    float _1879 = precise::clamp(_1877, 0.0, 1.0);
                    float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1883 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1885 = fma(_1879, _1857, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1887 = fma(_1879, _1883, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1889 = fma(_1879, _1863, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1891 = fma(_1879, _1867, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1893 = fma(_1879, _1871, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1895 = fma(_1879, _1875, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1733 = _1889;
                    _1715 = _1893;
                    _1721 = _1885;
                    _1709 = _1891;
                    _1703 = _1887;
                    _1749 = _1895;
                    _1811 = true;
                }
                else
                {
                    _1733 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1715 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1721 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1709 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1703 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1749 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1811 = false;
    float _1897 = _1733;
    float _1899 = _1715;
    float _1901 = _1721;
    float _1903 = _1709;
    float _1905 = _1703;
    float _1907 = _1749;
    float _1909 = fma(_1669, -0.5, 0.5);
    float _1911 = precise::clamp(_1909, 0.0, 1.0);
    float _1913 = -_1897;
    float _1915 = _1913 + _1899;
    float _1917 = -_1901;
    float _1919 = _1917 + _1903;
    float _1921 = -_1905;
    float _1923 = _1921 + _1907;
    bool _1925 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1927 = fma(_1911, _1915, _1897);
    float _1929 = fma(_1911, _1919, _1901);
    float _1931 = fma(_1911, _1923, _1905);
    float _1933 = _1927 * 0.586610972881317138671875;
    out.m_79.x = 0.0;
    float _1935 = fma(_1929, 0.298911988735198974609375, _1933);
    float _1937 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1939 = fma(_1931, 0.114477999508380889892578125, _1935);
    out.m_47.x = _1937;
    float _1941 = -_1939;
    float _1943 = _1929 + _1941;
    float _1945 = -_1939;
    float _1947 = _1927 + _1945;
    float _1949 = -_1939;
    float _1951 = _1931 + _1949;
    out.m_81.x = 0.0;
    float _1953 = fma(_1943, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1939);
    float _1955 = fma(_1947, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1939);
    float _1957 = fma(_1951, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1939);
    out.m_83.x = _1953;
    out.m_83.y = _1955;
    out.m_83.z = _1957;
    if (!_1925)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1959 = -_936;
    float _1961 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1963 = -_938;
    float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1967 = -_940;
    float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1971 = _1961 * _1961;
    float _1973 = fma(_1965, _1965, _1971);
    float _1975 = fma(_1969, _1969, _1973);
    float _1977 = rsqrt(_1975);
    float _1979 = _1961 * _1977;
    float _1981 = _1965 * _1977;
    float _1983 = _1969 * _1977;
    float _1985 = sqrt(_1975);
    float _1987 = -_974;
    float _1989 = _1987 + _1979;
    float _1991 = -_970;
    float _1993 = _1991 + _1981;
    float _1995 = -_972;
    float _1997 = _1995 + _1983;
    float _1999 = _1989 * _1989;
    float _2001 = fma(_1993, _1993, _1999);
    float _2003 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2005 = precise::clamp(_2003, 0.0, 1.0);
    float _2007 = fma(_1997, _1997, _2001);
    float _2009 = _2005 * _2005;
    float _2011 = -_1985;
    float _2013 = _2011 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2015 = _2009 + (-1.0);
    float _2017 = rsqrt(_2007);
    float _2019 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2021 = precise::clamp(_2019, 0.0, 1.0);
    float _2023 = abs(_2021);
    float _2025 = log2(_2023);
    float _2027 = _1989 * _2017;
    float _2029 = _1993 * _2017;
    float _2031 = _1997 * _2017;
    float _2033 = _1669 * _2027;
    float _2035 = _1669 * _1979;
    float _2037 = fma(_1673, _2029, _2033);
    float _2039 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2041 = fma(_1673, _1981, _2035);
    float _2043 = fma(_1675, _2031, _2037);
    float _2045 = precise::clamp(_2043, 0.0, 1.0);
    float _2047 = fma(_1675, _1983, _2041);
    float _2049 = precise::clamp(_2047, 0.0, 1.0);
    float _2051 = exp2(_2039);
    float _2053 = _2045 * _2045;
    float _2055 = _1981 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2057 = fma(_2053, _2015, 1.0);
    float _2059 = -_1979;
    float _2061 = -_2055;
    float _2063 = fma(_2059, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2061);
    float _2065 = _2057 * _2057;
    float _2067 = -_1983;
    float _2069 = fma(_2067, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2063);
    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2073 = _2069 + _2071;
    float _2075 = 1.0 / _2065;
    float _2077 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2079 = precise::clamp(_2077, 0.0, 1.0);
    float _2081 = _2051 * _2079;
    float _2083 = _2049 * _2081;
    float _2085 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2087 = _2009 * _2075;
    float _2089 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2091 = _2083 * _2087;
    float _2093 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2095 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2097 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2099 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_79.x = _2085;
    out.m_79.y = _2093;
    out.m_79.z = _2089;
    out.m_81.x = _2095;
    out.m_81.y = _2097;
    out.m_81.z = _2099;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

