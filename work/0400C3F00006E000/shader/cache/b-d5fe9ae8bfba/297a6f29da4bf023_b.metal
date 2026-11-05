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
    float4 m_71 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_57 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    float _100 = as_type<float>(_92);
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1432 = as_type<float>(_108);
        out.gl_Position.z = _1432;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_92);
        _100 = _130;
    }
    float _132 = _100;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1502 = as_type<float>(_146);
        out.gl_Position.z = _1502;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_49.x;
    float _150 = in.m_49.y;
    float _152 = in.m_49.z;
    float _154 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _156 = log2(_154);
    float _158 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = 0.0;
    float _172 = _158;
    if (!_168)
    {
        float _174 = _158 * _158;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_168)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    float _186 = _152 * 2.0;
    float _188 = _148 * 2.0;
    float _190 = _150 + _152;
    float _192 = _150 + _148;
    float _194 = floor(_188);
    float _196 = _190 + (-1.0);
    float _198 = _192 + (-1.0);
    float _200 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _202 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _204 = floor(_186);
    float _206 = _156 * _126;
    bool _208 = _204 > 0.0;
    bool _210 = _204 >= 0.0;
    bool _212 = isnan(_204);
    bool _214 = _210 || _212;
    bool _216 = isnan(0.0);
    bool _218 = _214 || _216;
    bool _220 = !_168;
    float _222 = _184;
    if (!_220)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _158 * _226;
        float _236 = 1.0 / _230;
        float _238 = _232 * 0.693147182464599609375;
        float _240 = exp2(_234);
        float _242 = 1.0 / _238;
        float _244 = _240 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _242, _158);
        float _250 = _248 * _236;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _222 = _252;
    }
    float _254 = _222;
    bool _256 = !_168;
    if (!_256)
    {
        float _258 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = log2(_258);
        float _262 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _264 = _262 + 1.0;
        float _266 = 1.0 / _264;
        float _268 = _158 * _260;
        float _270 = exp2(_268);
        float _272 = -_270;
        float _274 = _272 + 1.0;
        float _276 = _274 * _266;
        _172 = _276;
    }
    float _278 = _172;
    float _280 = exp2(_206);
    int _282 = _218 ? 0 : 1;
    float _284 = _150 * 2.0;
    int _286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _288 = _286 != 0;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _292 = _290 != 0;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _296 = _294 != 0;
    float _298 = _150 + (-0.5);
    float _300 = in.m_51.w;
    bool _302 = _194 > 0.0;
    float _304 = floor(_284);
    bool _306 = _194 >= 0.0;
    bool _308 = isnan(_194);
    bool _310 = _306 || _308;
    bool _312 = isnan(0.0);
    bool _314 = _310 || _312;
    float _316 = in.m_53.x;
    float _318 = in.m_53.y;
    float _320 = in.m_53.z;
    int _322 = ~_282;
    int _324 = _322 + 1;
    int _326 = _324 + 1;
    int _328 = _326;
    if (!_208)
    {
        int _330 = ~_282;
        int _332 = _330 + 1;
        _328 = _332;
    }
    int _334 = _328;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _338 = 1.0 + _336;
    bool _340 = !_288;
    int _342 = _340 ? 0 : 1;
    float _344 = -_280;
    float _346 = _344 + 1.0;
    bool _348 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _350 = isnan(1.0);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _356 = _352 || _354;
    float _358 = 1.0 / _338;
    int _360 = abs(_342);
    int _362 = _314 ? 0 : 1;
    float _364 = float(_334);
    float _366 = float(_360);
    bool _368 = !_292;
    int _370 = _368 ? 0 : 1;
    bool _372 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _374 = isnan(0.0);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _380 = _376 || _378;
    float _382 = _366 * _364;
    int _384 = ~_362;
    int _386 = _384 + 1;
    int _388 = _386 + 1;
    int _390 = _388;
    if (!_302)
    {
        int _392 = ~_362;
        int _394 = _392 + 1;
        _390 = _394;
    }
    int _396 = _390;
    int _398 = abs(_370);
    float _400 = _382 * (-2.0);
    bool _402 = _304 > 0.0;
    float _404 = _380 ? _346 : 0.0;
    float _406 = fma(_400, _316, _316);
    float _408 = float(_396);
    float _410 = fma(_202, _400, _202);
    float _412 = float(_398);
    if (_356)
    {
        float _414 = _404 * _358;
        _128 = _414;
    }
    float _416 = _128;
    bool _418 = _304 >= 0.0;
    bool _420 = isnan(_304);
    bool _422 = _418 || _420;
    bool _424 = isnan(0.0);
    bool _426 = _422 || _424;
    float _428 = _148 + (-0.5);
    bool _430 = !_296;
    int _432 = _430 ? 0 : 1;
    float _434 = _412 * _408;
    int _436 = _426 ? 0 : 1;
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[196].x, _406);
    float _440 = _148 + _152;
    float _442 = _434 * (-2.0);
    int _444 = ~_436;
    int _446 = _444 + 1;
    int _448 = _446 + 1;
    float _450 = fma(_410, _416, _438);
    int _452 = _448;
    if (!_402)
    {
        int _454 = ~_436;
        int _456 = _454 + 1;
        _452 = _456;
    }
    int _458 = _452;
    float _460 = fma(_442, _318, _318);
    int _462 = abs(_432);
    float _464 = fma(_200, _442, _200);
    float _466 = float(_458);
    float _468 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[196].y, _460);
    float _470 = float(_462);
    float _472 = in.m_51.x;
    float _474 = in.m_51.y;
    float _476 = in.m_51.z;
    float _478 = fma(_464, _416, _468);
    float _480 = _440 + (-1.0);
    float _482 = _470 * _466;
    float _484 = in.m_55.x;
    float _486 = in.m_55.y;
    float _488 = in.m_55.z;
    float _490 = _478 * 0.15915493667125701904296875;
    float _492 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _494 = _482 * (-2.0);
    float _496 = _152 + (-0.5);
    float _498 = _450 * 0.15915493667125701904296875;
    float _500 = _490 * 6.283185482025146484375;
    float _502 = sin(_500);
    float _504 = fma(_494, _320, _320);
    float _506 = fma(_492, _494, _492);
    float _508 = in.m_47.x;
    float _510 = in.m_47.y;
    float _512 = in.m_47.z;
    float _514 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[196].z, _504);
    float _516 = in.m_42.x;
    float _518 = in.m_42.y;
    float _520 = in.m_42.z;
    float _522 = _498 * 6.283185482025146484375;
    float _524 = cos(_522);
    float _526 = fma(_506, _416, _514);
    bool _528 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _530 = isnan(0.5);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _536 = _532 || _534;
    float _538 = _526 * 0.15915493667125701904296875;
    float _540 = _474 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _542 = _472 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _544 = _490 * 6.283185482025146484375;
    float _546 = cos(_544);
    float _548 = _476 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _550 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _486);
    float _552 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _554 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _484);
    float _556 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _558 = _550 * _552;
    float _560 = _538 * 6.283185482025146484375;
    float _562 = cos(_560);
    float _564 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _566 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _568 = _554 * _556;
    float _570 = _524 * _502;
    float _572 = fma(_278, _508, _564);
    float _574 = fma(_278, _512, _566);
    float _576 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _488);
    float _578 = _498 * 6.283185482025146484375;
    float _580 = sin(_578);
    float _582 = _524 * _546;
    float _584 = fma(_572, _300, _516);
    float _586 = fma(_574, _300, _520);
    float _588 = _538 * 6.283185482025146484375;
    float _590 = sin(_588);
    float _592 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _594 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _596 = _524 * _562;
    float _598 = _576 * _592;
    float _600 = fma(_278, _510, _594);
    float _602 = _596 * _558;
    float _604 = _580 * _502;
    float _606 = _546 * _562;
    float _608 = fma(_600, _300, _518);
    float _610 = _580 * _546;
    float _612 = _580 * _562;
    float _614 = _502 * _562;
    float _616 = _608 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _618 = _608 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _620 = fma(_590, _582, _604);
    float _622 = fma(_590, _604, _582);
    float _624 = -_570;
    float _626 = fma(_590, _610, _624);
    float _628 = -_558;
    float _630 = _590 * _628;
    float _632 = -_610;
    float _634 = fma(_590, _570, _632);
    float _636 = fma(_620, _568, _602);
    float _638 = _612 * _558;
    float _640 = fma(_606, _568, _630);
    float _642 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[6].x, _616);
    float _644 = fma(_634, _598, _636);
    float _646 = fma(_626, _568, _638);
    float _648 = fma(_614, _598, _640);
    float _650 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[4].x, _618);
    float _652 = _644 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _654 = fma(_622, _598, _646);
    float _656 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[6].z, _642);
    float _658 = _644 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _660 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[10].x, _652);
    float _662 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[4].z, _650);
    float _664 = _656 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _666 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[8].x, _658);
    float _668 = fma(_654, (*spvDescriptorSet0.vp_c10)._m0[10].z, _660);
    float _670 = _608 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _672 = _662 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _674 = fma(_654, (*spvDescriptorSet0.vp_c10)._m0[8].z, _666);
    float _676 = _664 + _668;
    float _678 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[5].x, _670);
    float _680 = _568;
    float _682 = _644;
    if (_536)
    {
        _680 = 1.0;
    }
    float _684 = _680;
    float _686 = _672 + _674;
    float _688 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _690 = _676 + _688;
    float _692 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[5].z, _678);
    float _694 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _696 = _686 + _694;
    float _698 = _690 * _690;
    float _700 = _692 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _702 = fma(_696, _696, _698);
    float _704 = _700 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _706 = _700 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _708 = sqrt(_702);
    float _710 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[11].x, _704);
    float _712 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[10].x, _706);
    float _714 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[11].z, _710);
    float _716 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[10].z, _712);
    float _718 = _714 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _720 = _644 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _722 = _716 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _724 = 1.0 / _718;
    float _726 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[9].x, _720);
    float _728 = _722 + _718;
    bool _730 = _708 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _732 = fma(_654, (*spvDescriptorSet0.vp_c10)._m0[9].z, _726);
    float _734 = _700 + _732;
    float _736 = _728 * _724;
    float _738 = _736 * 0.5;
    float _740 = _728;
    float _742 = _700;
    float _744 = _732;
    float _746 = _686;
    float _748 = _684;
    if (!_730)
    {
        _740 = _686;
    }
    float _750 = _740;
    float _752 = _750;
    if (!_730)
    {
        _742 = _676;
    }
    float _754 = _742;
    float _756 = _754;
    if (!_730)
    {
        _744 = _734;
    }
    float _758 = _744;
    bool _760 = !_730;
    float _762 = _758;
    if (!_760)
    {
        float _764 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _768 = _708 + _766;
        float _770 = rsqrt(_702);
        float _772 = _768 * _764;
        float _774 = _734 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _776 = _772 * 0.15915493667125701904296875;
        float _778 = _776 * 6.283185482025146484375;
        float _780 = cos(_778);
        float _782 = _776 * 6.283185482025146484375;
        float _784 = sin(_782);
        float _786 = _780 + (-1.0);
        float _788 = _786 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _790 = fma(_784, _774, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _792 = fma(_734, _780, _788);
        float _794 = _770 * _790;
        float _796 = fma(_696, _794, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _798 = fma(_690, _794, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _762 = _792;
        _752 = _796;
        _756 = _798;
    }
    float _800 = _762;
    float _802 = _752;
    float _804 = _756;
    if (!_536)
    {
        float _806 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _808 = _806 * 0.15915493667125701904296875;
        float _810 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _812 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _814 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[30].w, _812);
        float _816 = _808 * 6.283185482025146484375;
        float _818 = cos(_816);
        float _820 = _810 * 0.15915493667125701904296875;
        float _822 = _808 * 6.283185482025146484375;
        float _824 = sin(_822);
        float _826 = 1.0 / _818;
        float _828 = _820 * 6.283185482025146484375;
        float _830 = cos(_828);
        float _832 = _824 * _826;
        float _834 = _820 * 6.283185482025146484375;
        float _836 = sin(_834);
        float _838 = _830 * _832;
        float _840 = 1.0 / _814;
        float _842 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _844 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _842;
        float _846 = 1.0 / _838;
        float _848 = 1.0 / _844;
        float _850 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _852 = _840 * _850;
        float _854 = _836 * _846;
        float _856 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _858 = fma(_854, _852, _856);
        float _860 = _858 * _848;
        float _862 = precise::clamp(_860, 0.0, 1.0);
        _746 = _820;
        _682 = _846;
        _748 = _862;
    }
    float _864 = _746;
    float _866 = _682;
    float _868 = _748;
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _872 = _800 + _870;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _876 = _802 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _880 = _804 + _878;
    float _882 = _872 * _872;
    float _884 = fma(_876, _876, _882);
    float _886 = fma(_880, _880, _884);
    float _888 = rsqrt(_886);
    float _890 = sqrt(_886);
    float _892 = _888 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _894 = _876 * _892;
    float _896 = _880 * _892;
    float _898 = _894 * _894;
    float _900 = _896 * _896;
    float _902 = _898 + _900;
    float _904 = sqrt(_902);
    bool _906 = _904 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _910 = _904 + _908;
    float _912 = _880;
    float _914 = _866;
    float _916 = _910;
    float _918 = _864;
    float _920 = _872;
    if (_906)
    {
        float _922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _912 = _922;
    }
    float _924 = _912;
    if (_906)
    {
        float _926 = rsqrt(_902);
        _914 = _926;
    }
    float _928 = _914;
    float _930 = _928;
    if (_906)
    {
        float _932 = _910 * _924;
        _916 = _932;
    }
    float _934 = _916;
    if (_906)
    {
        float _936 = _934 * 0.15915493667125701904296875;
        _918 = _936;
    }
    float _938 = _918;
    float _940 = _882;
    if (_906)
    {
        float _942 = _938 * 6.283185482025146484375;
        float _944 = sin(_942);
        _940 = _944;
    }
    float _946 = _940;
    float _948 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _950 = precise::max(0.0, _948);
    float _952 = _888;
    float _954 = _950;
    float _956 = _948;
    if (_906)
    {
        float _958 = _938 * 6.283185482025146484375;
        float _960 = cos(_958);
        _952 = _960;
    }
    float _962 = _952;
    float _964 = -_892;
    float _966 = -_950;
    float _968 = fma(_872, _964, _966);
    if (!_906)
    {
        _954 = _894;
    }
    float _970 = _954;
    float _972 = _970;
    if (_906)
    {
        float _974 = _968 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _956 = _974;
    }
    float _976 = _956;
    float _978 = _800 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _980 = _946;
    float _982 = _976;
    if (_906)
    {
        float _984 = fma(_946, _976, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _920 = _984;
    }
    float _986 = _920;
    float _988 = _986;
    if (!_906)
    {
        _980 = _898;
    }
    float _990 = _980;
    float _992 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[2].x, _978);
    float _994 = _990;
    float _996 = _962;
    if (_906)
    {
        float _998 = _962 + (-1.0);
        _982 = _998;
    }
    float _1000 = _982;
    float _1002 = 0.0;
    float _1004 = _1000;
    if (_906)
    {
        float _1006 = _928 * _986;
        _1002 = _1006;
    }
    float _1008 = _1002;
    if (!_906)
    {
        _988 = _968;
    }
    float _1010 = _988;
    float _1012 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[2].z, _992);
    float _1014 = _1010;
    if (_906)
    {
        float _1016 = _1000 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _930 = _1016;
    }
    float _1018 = _930;
    if (_906)
    {
        float _1020 = _894 * _1008;
        _972 = _1020;
    }
    float _1022 = _972;
    if (!_906)
    {
        _1004 = _896;
    }
    float _1024 = _1004;
    float _1026 = _1024;
    if (_906)
    {
        float _1028 = _896 * _1008;
        _1026 = _1028;
    }
    float _1030 = _1026;
    if (_906)
    {
        float _1032 = fma(_968, _962, _1018);
        _1014 = _1032;
    }
    float _1034 = _1014;
    if (_906)
    {
        float _1036 = _1022 * _1022;
        _994 = _1036;
    }
    float _1038 = _994;
    if (!_906)
    {
        _996 = _900;
    }
    float _1040 = _996;
    float _1042 = _1040;
    if (_906)
    {
        float _1044 = _1030 * _1030;
        _1042 = _1044;
    }
    float _1046 = _1042;
    float _1048 = fma(_1034, _1034, _1038);
    float _1050 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1052 = _800 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1054 = _1048 + _1046;
    float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1058 = fma(_890, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1056);
    float _1060 = precise::clamp(_1058, 0.0, 1.0);
    float _1062 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1064 = _800 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1066 = rsqrt(_1054);
    float _1068 = _800 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1070 = -_1060;
    float _1072 = _1070 + 1.0;
    float _1074 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1064);
    float _1076 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1052);
    float _1078 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1068);
    float _1080 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1074);
    float _1082 = abs(_1072);
    float _1084 = log2(_1082);
    float _1086 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1078);
    float _1088 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1076);
    float _1090 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1092 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1094 = _1086 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1096 = _1088 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1098 = _1066 * _1022;
    float _1100 = -_1092;
    float _1102 = fma(_1100, _1062, 1.0);
    float _1104 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1106 = _1066 * _1034;
    float _1108 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1110 = _1066 * _1030;
    float _1112 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1104);
    float _1114 = log2(_1102);
    float _1116 = -_1108;
    float _1118 = fma(_1106, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1116);
    float _1120 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1122 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1112);
    float _1124 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1126 = -_1110;
    float _1128 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1118);
    float _1130 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1132 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1122);
    float _1134 = exp2(_1120);
    float _1136 = fma(_1128, -0.5, 0.5);
    float _1138 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1130);
    float _1140 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1124);
    float _1142 = fma(_1128, 0.5, 0.5);
    float _1144 = _1106 + 1.0;
    float _1146 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1138);
    float _1148 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1140);
    float _1150 = 1.0 / _1132;
    float _1152 = fma(_1142, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1154 = _1114 * 0.693147182464599609375;
    float _1156 = fma(_1142, _1152, -0.212114393711090087890625);
    float _1158 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1160 = sqrt(_1136);
    float _1162 = -_1106;
    float _1164 = fma(_1134, _1144, _1162);
    float _1166 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1146);
    float _1168 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1148);
    float _1170 = fma(_1142, _1156, 1.570728778839111328125);
    float _1172 = fma(_1164, 0.5, 0.5);
    float _1174 = _1166 * _1150;
    float _1176 = _1168 * _1150;
    float _1178 = fma(_1174, 0.5, 0.5);
    float _1180 = fma(_1176, -0.5, 0.5);
    float _1182 = _1160 * 0.636619746685028076171875;
    float3 _3100 = float3(_1178, _1180, _1158);
    float _1184 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3100, float3(0.0), isnan(_3100)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3100, float3(0.0), isnan(_3100)), level(0.0)).x;
    float _1186 = -_1170;
    float _1188 = fma(_1182, _1186, 1.0);
    float3 _3116 = float3(_1178, _1180, _1158);
    float4 _1191 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3116, float3(0.0), isnan(_3116)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3116, float3(0.0), isnan(_3116)), level(0.0)).xyzw;
    float _1193 = _1191.x;
    float _1195 = _1191.y;
    float _1197 = _1191.z;
    float _1199 = _1191.w;
    float2 _3133 = float2(_1188, _1172);
    float3 _1203 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3133, float2(0.0), isnan(_3133)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3133, float2(0.0), isnan(_3133)), level(0.0)).xyz;
    float _1205 = _1203.x;
    float _1207 = _1203.y;
    float _1209 = _1203.z;
    float _1211 = in.m_57.x;
    float _1213 = in.m_57.y;
    float _1215 = in.m_57.z;
    bool _1217 = _486 != 0.0;
    bool _1219 = isnan(_486);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan(0.0);
    bool _1225 = _1221 || _1223;
    float _1227 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_59.x = _802;
    out.m_59.y = _800;
    out.m_59.z = _804;
    bool _1229 = _484 == 0.0;
    bool _1231 = !_1225;
    bool _1233 = _1229 && _1231;
    float _1235 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1227);
    bool _1237 = _488 == 0.0;
    bool _1239 = _1237 && _1233;
    float _1241 = _1213;
    float _1243 = _1211;
    float _1245 = _1215;
    if (!_1239)
    {
        float _1247 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1213);
        _1241 = _1247;
    }
    float _1249 = _1241;
    if (!_1239)
    {
        float _1251 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1211);
        _1243 = _1251;
    }
    float _1253 = _1243;
    if (!_1239)
    {
        float _1255 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1215);
        _1245 = _1255;
    }
    float _1257 = _1245;
    float _1259 = _596 * _1249;
    float _1261 = -_1249;
    float _1263 = _590 * _1261;
    float _1265 = _612 * _1249;
    float _1267 = fma(_620, _1253, _1259);
    float _1269 = fma(_606, _1253, _1263);
    float _1271 = fma(_626, _1253, _1265);
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1275 = fma(_634, _1257, _1267);
    float _1277 = fma(_614, _1257, _1269);
    float _1279 = fma(_622, _1257, _1271);
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1285 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1287 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1289 = in.m_61.w;
    float _1291 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1283);
    float _1293 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1285);
    float _1295 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1287);
    float _1297 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1299 = fma(_1279, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1291);
    float _1301 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1235);
    float _1303 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1305 = exp2(_1297);
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1311 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1313 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1315 = fma(_1279, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1293);
    float _1317 = fma(_1279, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1295);
    float _1319 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1301);
    bool _1321 = _868 > 0.0;
    bool _1323 = isnan(_868);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan(0.0);
    bool _1329 = _1325 || _1327;
    out.m_63.x = _1303;
    out.m_63.y = _1313;
    out.m_63.z = _1311;
    out.m_63.w = _1309;
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1335 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1337 = -_1305;
    float _1339 = _1337 + 1.0;
    float _1341 = _868 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1343 = _1319 + _1132;
    float _1345 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1349 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1351 = _1335 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1353 = _1343 * 0.5;
    float _1355 = -_1347;
    float _1357 = _1355 + 1.0;
    float _1359 = _1341 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1345;
    out.m_65.y = _1349;
    out.m_65.z = _1351;
    out.m_67.w = _1289;
    out.m_69.x = _1299;
    out.m_69.y = _1315;
    out.m_69.z = _1317;
    out.gl_Position.x = _1166;
    out.gl_Position.y = _1168;
    out.gl_Position.z = _1319;
    out.gl_Position.w = _1132;
    out.m_71.z = _1353;
    out.m_71.w = _1132;
    out.m_45.x = _1359;
    float _1361 = _1347 * _1184;
    float _1363 = _1199 * _1361;
    float _1365 = _1199 * _1357;
    float _1367 = _1209 * _1361;
    float _1369 = fma(_1205, _1363, _1193);
    float _1371 = fma(_1207, _1363, _1195);
    float _1373 = fma(_1199, _1367, _1197);
    out.m_73.x = _1369;
    out.m_73.y = _1371;
    out.m_73.z = _1373;
    out.m_73.w = _1365;
    if (_1329)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1375 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1375;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    float _100 = as_type<float>(_92);
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1432 = as_type<float>(_108);
        out.gl_Position.z = _1432;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_92);
        _100 = _130;
    }
    float _132 = _100;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1502 = as_type<float>(_146);
        out.gl_Position.z = _1502;
    }
    if (_138)
    {
        return out;
    }
    float _148 = in.m_49.x;
    float _150 = in.m_49.y;
    float _152 = in.m_49.z;
    float _154 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _156 = log2(_154);
    float _158 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = 0.0;
    float _172 = _158;
    if (!_168)
    {
        float _174 = _158 * _158;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_168)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    float _186 = _152 * 2.0;
    float _188 = _148 * 2.0;
    float _190 = _150 + _152;
    float _192 = _150 + _148;
    float _194 = floor(_188);
    float _196 = _190 + (-1.0);
    float _198 = _192 + (-1.0);
    float _200 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _202 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _204 = floor(_186);
    float _206 = _156 * _126;
    bool _208 = _204 > 0.0;
    bool _210 = _204 >= 0.0;
    bool _212 = isnan(_204);
    bool _214 = _210 || _212;
    bool _216 = isnan(0.0);
    bool _218 = _214 || _216;
    bool _220 = !_168;
    float _222 = _184;
    if (!_220)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _158 * _226;
        float _236 = 1.0 / _230;
        float _238 = _232 * 0.693147182464599609375;
        float _240 = exp2(_234);
        float _242 = 1.0 / _238;
        float _244 = _240 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _242, _158);
        float _250 = _248 * _236;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _222 = _252;
    }
    float _254 = _222;
    bool _256 = !_168;
    if (!_256)
    {
        float _258 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = log2(_258);
        float _262 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _264 = _262 + 1.0;
        float _266 = 1.0 / _264;
        float _268 = _158 * _260;
        float _270 = exp2(_268);
        float _272 = -_270;
        float _274 = _272 + 1.0;
        float _276 = _274 * _266;
        _172 = _276;
    }
    float _278 = _172;
    float _280 = exp2(_206);
    int _282 = _218 ? 0 : 1;
    float _284 = _150 * 2.0;
    int _286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _288 = _286 != 0;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _292 = _290 != 0;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _296 = _294 != 0;
    float _298 = _150 + (-0.5);
    float _300 = in.m_51.w;
    bool _302 = _194 > 0.0;
    float _304 = floor(_284);
    bool _306 = _194 >= 0.0;
    bool _308 = isnan(_194);
    bool _310 = _306 || _308;
    bool _312 = isnan(0.0);
    bool _314 = _310 || _312;
    float _316 = in.m_53.x;
    float _318 = in.m_53.y;
    float _320 = in.m_53.z;
    int _322 = ~_282;
    int _324 = _322 + 1;
    int _326 = _324 + 1;
    int _328 = _326;
    if (!_208)
    {
        int _330 = ~_282;
        int _332 = _330 + 1;
        _328 = _332;
    }
    int _334 = _328;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _338 = 1.0 + _336;
    bool _340 = !_288;
    int _342 = _340 ? 0 : 1;
    float _344 = -_280;
    float _346 = _344 + 1.0;
    bool _348 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _350 = isnan(1.0);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _356 = _352 || _354;
    float _358 = 1.0 / _338;
    int _360 = abs(_342);
    int _362 = _314 ? 0 : 1;
    float _364 = float(_334);
    float _366 = float(_360);
    bool _368 = !_292;
    int _370 = _368 ? 0 : 1;
    bool _372 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _374 = isnan(0.0);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _380 = _376 || _378;
    float _382 = _366 * _364;
    int _384 = ~_362;
    int _386 = _384 + 1;
    int _388 = _386 + 1;
    int _390 = _388;
    if (!_302)
    {
        int _392 = ~_362;
        int _394 = _392 + 1;
        _390 = _394;
    }
    int _396 = _390;
    int _398 = abs(_370);
    float _400 = _382 * (-2.0);
    bool _402 = _304 > 0.0;
    float _404 = _380 ? _346 : 0.0;
    float _406 = fma(_400, _316, _316);
    float _408 = float(_396);
    float _410 = fma(_202, _400, _202);
    float _412 = float(_398);
    if (_356)
    {
        float _414 = _404 * _358;
        _128 = _414;
    }
    float _416 = _128;
    bool _418 = _304 >= 0.0;
    bool _420 = isnan(_304);
    bool _422 = _418 || _420;
    bool _424 = isnan(0.0);
    bool _426 = _422 || _424;
    float _428 = _148 + (-0.5);
    bool _430 = !_296;
    int _432 = _430 ? 0 : 1;
    float _434 = _412 * _408;
    int _436 = _426 ? 0 : 1;
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[196].x, _406);
    float _440 = _148 + _152;
    float _442 = _434 * (-2.0);
    int _444 = ~_436;
    int _446 = _444 + 1;
    int _448 = _446 + 1;
    float _450 = fma(_410, _416, _438);
    int _452 = _448;
    if (!_402)
    {
        int _454 = ~_436;
        int _456 = _454 + 1;
        _452 = _456;
    }
    int _458 = _452;
    float _460 = fma(_442, _318, _318);
    int _462 = abs(_432);
    float _464 = fma(_200, _442, _200);
    float _466 = float(_458);
    float _468 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[196].y, _460);
    float _470 = float(_462);
    float _472 = in.m_51.x;
    float _474 = in.m_51.y;
    float _476 = in.m_51.z;
    float _478 = fma(_464, _416, _468);
    float _480 = _440 + (-1.0);
    float _482 = _470 * _466;
    float _484 = in.m_55.x;
    float _486 = in.m_55.y;
    float _488 = in.m_55.z;
    float _490 = _478 * 0.15915493667125701904296875;
    float _492 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _494 = _482 * (-2.0);
    float _496 = _152 + (-0.5);
    float _498 = _450 * 0.15915493667125701904296875;
    float _500 = _490 * 6.283185482025146484375;
    float _502 = sin(_500);
    float _504 = fma(_494, _320, _320);
    float _506 = fma(_492, _494, _492);
    float _508 = in.m_47.x;
    float _510 = in.m_47.y;
    float _512 = in.m_47.z;
    float _514 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[196].z, _504);
    float _516 = in.m_42.x;
    float _518 = in.m_42.y;
    float _520 = in.m_42.z;
    float _522 = _498 * 6.283185482025146484375;
    float _524 = cos(_522);
    float _526 = fma(_506, _416, _514);
    bool _528 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _530 = isnan(0.5);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _536 = _532 || _534;
    float _538 = _526 * 0.15915493667125701904296875;
    float _540 = _474 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _542 = _472 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _544 = _490 * 6.283185482025146484375;
    float _546 = cos(_544);
    float _548 = _476 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _550 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _486);
    float _552 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _554 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _484);
    float _556 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _558 = _550 * _552;
    float _560 = _538 * 6.283185482025146484375;
    float _562 = cos(_560);
    float _564 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _566 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _568 = _554 * _556;
    float _570 = _524 * _502;
    float _572 = fma(_278, _508, _564);
    float _574 = fma(_278, _512, _566);
    float _576 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _488);
    float _578 = _498 * 6.283185482025146484375;
    float _580 = sin(_578);
    float _582 = _524 * _546;
    float _584 = fma(_572, _300, _516);
    float _586 = fma(_574, _300, _520);
    float _588 = _538 * 6.283185482025146484375;
    float _590 = sin(_588);
    float _592 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _594 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _596 = _524 * _562;
    float _598 = _576 * _592;
    float _600 = fma(_278, _510, _594);
    float _602 = _596 * _558;
    float _604 = _580 * _502;
    float _606 = _546 * _562;
    float _608 = fma(_600, _300, _518);
    float _610 = _580 * _546;
    float _612 = _580 * _562;
    float _614 = _502 * _562;
    float _616 = _608 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _618 = _608 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _620 = fma(_590, _582, _604);
    float _622 = fma(_590, _604, _582);
    float _624 = -_570;
    float _626 = fma(_590, _610, _624);
    float _628 = -_558;
    float _630 = _590 * _628;
    float _632 = -_610;
    float _634 = fma(_590, _570, _632);
    float _636 = fma(_620, _568, _602);
    float _638 = _612 * _558;
    float _640 = fma(_606, _568, _630);
    float _642 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[6].x, _616);
    float _644 = fma(_634, _598, _636);
    float _646 = fma(_626, _568, _638);
    float _648 = fma(_614, _598, _640);
    float _650 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[4].x, _618);
    float _652 = _644 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _654 = fma(_622, _598, _646);
    float _656 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[6].z, _642);
    float _658 = _644 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _660 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[10].x, _652);
    float _662 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[4].z, _650);
    float _664 = _656 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _666 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[8].x, _658);
    float _668 = fma(_654, (*spvDescriptorSet0.vp_c10)._m0[10].z, _660);
    float _670 = _608 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _672 = _662 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _674 = fma(_654, (*spvDescriptorSet0.vp_c10)._m0[8].z, _666);
    float _676 = _664 + _668;
    float _678 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[5].x, _670);
    float _680 = _568;
    float _682 = _644;
    if (_536)
    {
        _680 = 1.0;
    }
    float _684 = _680;
    float _686 = _672 + _674;
    float _688 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _690 = _676 + _688;
    float _692 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[5].z, _678);
    float _694 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _696 = _686 + _694;
    float _698 = _690 * _690;
    float _700 = _692 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _702 = fma(_696, _696, _698);
    float _704 = _700 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _706 = _700 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _708 = sqrt(_702);
    float _710 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[11].x, _704);
    float _712 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[10].x, _706);
    float _714 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[11].z, _710);
    float _716 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[10].z, _712);
    float _718 = _714 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _720 = _644 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _722 = _716 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _724 = 1.0 / _718;
    float _726 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[9].x, _720);
    float _728 = _722 + _718;
    bool _730 = _708 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _732 = fma(_654, (*spvDescriptorSet0.vp_c10)._m0[9].z, _726);
    float _734 = _700 + _732;
    float _736 = _728 * _724;
    float _738 = _736 * 0.5;
    float _740 = _728;
    float _742 = _700;
    float _744 = _732;
    float _746 = _686;
    float _748 = _684;
    if (!_730)
    {
        _740 = _686;
    }
    float _750 = _740;
    float _752 = _750;
    if (!_730)
    {
        _742 = _676;
    }
    float _754 = _742;
    float _756 = _754;
    if (!_730)
    {
        _744 = _734;
    }
    float _758 = _744;
    bool _760 = !_730;
    float _762 = _758;
    if (!_760)
    {
        float _764 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _768 = _708 + _766;
        float _770 = rsqrt(_702);
        float _772 = _768 * _764;
        float _774 = _734 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _776 = _772 * 0.15915493667125701904296875;
        float _778 = _776 * 6.283185482025146484375;
        float _780 = cos(_778);
        float _782 = _776 * 6.283185482025146484375;
        float _784 = sin(_782);
        float _786 = _780 + (-1.0);
        float _788 = _786 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _790 = fma(_784, _774, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _792 = fma(_734, _780, _788);
        float _794 = _770 * _790;
        float _796 = fma(_696, _794, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _798 = fma(_690, _794, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _762 = _792;
        _752 = _796;
        _756 = _798;
    }
    float _800 = _762;
    float _802 = _752;
    float _804 = _756;
    if (!_536)
    {
        float _806 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _808 = _806 * 0.15915493667125701904296875;
        float _810 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _812 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _814 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[30].w, _812);
        float _816 = _808 * 6.283185482025146484375;
        float _818 = cos(_816);
        float _820 = _810 * 0.15915493667125701904296875;
        float _822 = _808 * 6.283185482025146484375;
        float _824 = sin(_822);
        float _826 = 1.0 / _818;
        float _828 = _820 * 6.283185482025146484375;
        float _830 = cos(_828);
        float _832 = _824 * _826;
        float _834 = _820 * 6.283185482025146484375;
        float _836 = sin(_834);
        float _838 = _830 * _832;
        float _840 = 1.0 / _814;
        float _842 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _844 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _842;
        float _846 = 1.0 / _838;
        float _848 = 1.0 / _844;
        float _850 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _852 = _840 * _850;
        float _854 = _836 * _846;
        float _856 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _858 = fma(_854, _852, _856);
        float _860 = _858 * _848;
        float _862 = precise::clamp(_860, 0.0, 1.0);
        _746 = _820;
        _682 = _846;
        _748 = _862;
    }
    float _864 = _746;
    float _866 = _682;
    float _868 = _748;
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _872 = _800 + _870;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _876 = _802 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _880 = _804 + _878;
    float _882 = _872 * _872;
    float _884 = fma(_876, _876, _882);
    float _886 = fma(_880, _880, _884);
    float _888 = rsqrt(_886);
    float _890 = sqrt(_886);
    float _892 = _888 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _894 = _876 * _892;
    float _896 = _880 * _892;
    float _898 = _894 * _894;
    float _900 = _896 * _896;
    float _902 = _898 + _900;
    float _904 = sqrt(_902);
    bool _906 = _904 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _910 = _904 + _908;
    float _912 = _880;
    float _914 = _866;
    float _916 = _910;
    float _918 = _864;
    float _920 = _872;
    if (_906)
    {
        float _922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _912 = _922;
    }
    float _924 = _912;
    if (_906)
    {
        float _926 = rsqrt(_902);
        _914 = _926;
    }
    float _928 = _914;
    float _930 = _928;
    if (_906)
    {
        float _932 = _910 * _924;
        _916 = _932;
    }
    float _934 = _916;
    if (_906)
    {
        float _936 = _934 * 0.15915493667125701904296875;
        _918 = _936;
    }
    float _938 = _918;
    float _940 = _882;
    if (_906)
    {
        float _942 = _938 * 6.283185482025146484375;
        float _944 = sin(_942);
        _940 = _944;
    }
    float _946 = _940;
    float _948 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _950 = precise::max(0.0, _948);
    float _952 = _888;
    float _954 = _950;
    float _956 = _948;
    if (_906)
    {
        float _958 = _938 * 6.283185482025146484375;
        float _960 = cos(_958);
        _952 = _960;
    }
    float _962 = _952;
    float _964 = -_892;
    float _966 = -_950;
    float _968 = fma(_872, _964, _966);
    if (!_906)
    {
        _954 = _894;
    }
    float _970 = _954;
    float _972 = _970;
    if (_906)
    {
        float _974 = _968 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _956 = _974;
    }
    float _976 = _956;
    float _978 = _800 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _980 = _946;
    float _982 = _976;
    if (_906)
    {
        float _984 = fma(_946, _976, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _920 = _984;
    }
    float _986 = _920;
    float _988 = _986;
    if (!_906)
    {
        _980 = _898;
    }
    float _990 = _980;
    float _992 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[2].x, _978);
    float _994 = _990;
    float _996 = _962;
    if (_906)
    {
        float _998 = _962 + (-1.0);
        _982 = _998;
    }
    float _1000 = _982;
    float _1002 = 0.0;
    float _1004 = _1000;
    if (_906)
    {
        float _1006 = _928 * _986;
        _1002 = _1006;
    }
    float _1008 = _1002;
    if (!_906)
    {
        _988 = _968;
    }
    float _1010 = _988;
    float _1012 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[2].z, _992);
    float _1014 = _1010;
    if (_906)
    {
        float _1016 = _1000 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _930 = _1016;
    }
    float _1018 = _930;
    if (_906)
    {
        float _1020 = _894 * _1008;
        _972 = _1020;
    }
    float _1022 = _972;
    if (!_906)
    {
        _1004 = _896;
    }
    float _1024 = _1004;
    float _1026 = _1024;
    if (_906)
    {
        float _1028 = _896 * _1008;
        _1026 = _1028;
    }
    float _1030 = _1026;
    if (_906)
    {
        float _1032 = fma(_968, _962, _1018);
        _1014 = _1032;
    }
    float _1034 = _1014;
    if (_906)
    {
        float _1036 = _1022 * _1022;
        _994 = _1036;
    }
    float _1038 = _994;
    if (!_906)
    {
        _996 = _900;
    }
    float _1040 = _996;
    float _1042 = _1040;
    if (_906)
    {
        float _1044 = _1030 * _1030;
        _1042 = _1044;
    }
    float _1046 = _1042;
    float _1048 = fma(_1034, _1034, _1038);
    float _1050 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1052 = _800 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1054 = _1048 + _1046;
    float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1058 = fma(_890, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1056);
    float _1060 = precise::clamp(_1058, 0.0, 1.0);
    float _1062 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1064 = _800 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1066 = rsqrt(_1054);
    float _1068 = _800 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1070 = -_1060;
    float _1072 = _1070 + 1.0;
    float _1074 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1064);
    float _1076 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1052);
    float _1078 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1068);
    float _1080 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1074);
    float _1082 = abs(_1072);
    float _1084 = log2(_1082);
    float _1086 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1078);
    float _1088 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1076);
    float _1090 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1092 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1094 = _1086 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1096 = _1088 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1098 = _1066 * _1022;
    float _1100 = -_1092;
    float _1102 = fma(_1100, _1062, 1.0);
    float _1104 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1106 = _1066 * _1034;
    float _1108 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1110 = _1066 * _1030;
    float _1112 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1104);
    float _1114 = log2(_1102);
    float _1116 = -_1108;
    float _1118 = fma(_1106, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1116);
    float _1120 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1122 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1112);
    float _1124 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1126 = -_1110;
    float _1128 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1118);
    float _1130 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1132 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1122);
    float _1134 = exp2(_1120);
    float _1136 = fma(_1128, -0.5, 0.5);
    float _1138 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1130);
    float _1140 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1124);
    float _1142 = fma(_1128, 0.5, 0.5);
    float _1144 = _1106 + 1.0;
    float _1146 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1138);
    float _1148 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1140);
    float _1150 = 1.0 / _1132;
    float _1152 = fma(_1142, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1154 = _1114 * 0.693147182464599609375;
    float _1156 = fma(_1142, _1152, -0.212114393711090087890625);
    float _1158 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1160 = sqrt(_1136);
    float _1162 = -_1106;
    float _1164 = fma(_1134, _1144, _1162);
    float _1166 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1146);
    float _1168 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1148);
    float _1170 = fma(_1142, _1156, 1.570728778839111328125);
    float _1172 = fma(_1164, 0.5, 0.5);
    float _1174 = _1166 * _1150;
    float _1176 = _1168 * _1150;
    float _1178 = fma(_1174, 0.5, 0.5);
    float _1180 = fma(_1176, -0.5, 0.5);
    float _1182 = _1160 * 0.636619746685028076171875;
    float3 _3100 = float3(_1178, _1180, _1158);
    float _1184 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3100, float3(0.0), isnan(_3100)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3100, float3(0.0), isnan(_3100)), level(0.0)).x;
    float _1186 = -_1170;
    float _1188 = fma(_1182, _1186, 1.0);
    float3 _3116 = float3(_1178, _1180, _1158);
    float4 _1191 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3116, float3(0.0), isnan(_3116)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3116, float3(0.0), isnan(_3116)), level(0.0)).xyzw;
    float _1193 = _1191.x;
    float _1195 = _1191.y;
    float _1197 = _1191.z;
    float _1199 = _1191.w;
    float2 _3133 = float2(_1188, _1172);
    float3 _1203 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3133, float2(0.0), isnan(_3133)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3133, float2(0.0), isnan(_3133)), level(0.0)).xyz;
    float _1205 = _1203.x;
    float _1207 = _1203.y;
    float _1209 = _1203.z;
    float _1211 = in.m_57.x;
    float _1213 = in.m_57.y;
    float _1215 = in.m_57.z;
    bool _1217 = _486 != 0.0;
    bool _1219 = isnan(_486);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan(0.0);
    bool _1225 = _1221 || _1223;
    float _1227 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_59.x = _802;
    out.m_59.y = _800;
    out.m_59.z = _804;
    bool _1229 = _484 == 0.0;
    bool _1231 = !_1225;
    bool _1233 = _1229 && _1231;
    float _1235 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1227);
    bool _1237 = _488 == 0.0;
    bool _1239 = _1237 && _1233;
    float _1241 = _1213;
    float _1243 = _1211;
    float _1245 = _1215;
    if (!_1239)
    {
        float _1247 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1213);
        _1241 = _1247;
    }
    float _1249 = _1241;
    if (!_1239)
    {
        float _1251 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1211);
        _1243 = _1251;
    }
    float _1253 = _1243;
    if (!_1239)
    {
        float _1255 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1215);
        _1245 = _1255;
    }
    float _1257 = _1245;
    float _1259 = _596 * _1249;
    float _1261 = -_1249;
    float _1263 = _590 * _1261;
    float _1265 = _612 * _1249;
    float _1267 = fma(_620, _1253, _1259);
    float _1269 = fma(_606, _1253, _1263);
    float _1271 = fma(_626, _1253, _1265);
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1275 = fma(_634, _1257, _1267);
    float _1277 = fma(_614, _1257, _1269);
    float _1279 = fma(_622, _1257, _1271);
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1285 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1287 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1289 = in.m_61.w;
    float _1291 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1283);
    float _1293 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1285);
    float _1295 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1287);
    float _1297 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1299 = fma(_1279, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1291);
    float _1301 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1235);
    float _1303 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1305 = exp2(_1297);
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1311 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1313 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1315 = fma(_1279, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1293);
    float _1317 = fma(_1279, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1295);
    float _1319 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1301);
    bool _1321 = _868 > 0.0;
    bool _1323 = isnan(_868);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan(0.0);
    bool _1329 = _1325 || _1327;
    out.m_63.x = _1303;
    out.m_63.y = _1313;
    out.m_63.z = _1311;
    out.m_63.w = _1309;
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1335 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1337 = -_1305;
    float _1339 = _1337 + 1.0;
    float _1341 = _868 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1343 = _1319 + _1132;
    float _1345 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1349 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1351 = _1335 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1353 = _1343 * 0.5;
    float _1355 = -_1347;
    float _1357 = _1355 + 1.0;
    float _1359 = _1341 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1345;
    out.m_65.y = _1349;
    out.m_65.z = _1351;
    out.m_67.w = _1289;
    out.m_69.x = _1299;
    out.m_69.y = _1315;
    out.m_69.z = _1317;
    out.gl_Position.x = _1166;
    out.gl_Position.y = _1168;
    out.gl_Position.z = _1319;
    out.gl_Position.w = _1132;
    out.m_71.z = _1353;
    out.m_71.w = _1132;
    out.m_45.x = _1359;
    float _1361 = _1347 * _1184;
    float _1363 = _1199 * _1361;
    float _1365 = _1199 * _1357;
    float _1367 = _1209 * _1361;
    float _1369 = fma(_1205, _1363, _1193);
    float _1371 = fma(_1207, _1363, _1195);
    float _1373 = fma(_1199, _1367, _1197);
    out.m_73.x = _1369;
    out.m_73.y = _1371;
    out.m_73.z = _1373;
    out.m_73.w = _1365;
    if (_1329)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1375 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1375;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    float _100 = as_type<float>(_92);
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1432 = as_type<float>(_108);
        out.gl_Position.z = _1432;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = _126;
    if (_122)
    {
        float _130 = float(_92);
        _100 = _130;
    }
    float _132 = _100;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1502 = as_type<float>(_146);
        out.gl_Position.z = _1502;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_49.x;
    float _150 = in.m_49.y;
    float _152 = in.m_49.z;
    float _154 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _156 = log2(_154);
    float _158 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = 0.0;
    float _172 = _158;
    if (!_168)
    {
        float _174 = _158 * _158;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_168)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    float _186 = _152 * 2.0;
    float _188 = _148 * 2.0;
    float _190 = _150 + _152;
    float _192 = _150 + _148;
    float _194 = floor(_188);
    float _196 = _190 + (-1.0);
    float _198 = _192 + (-1.0);
    float _200 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _202 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _204 = floor(_186);
    float _206 = _156 * _126;
    bool _208 = _204 > 0.0;
    bool _210 = _204 >= 0.0;
    bool _212 = isnan(_204);
    bool _214 = _210 || _212;
    bool _216 = isnan(0.0);
    bool _218 = _214 || _216;
    bool _220 = !_168;
    float _222 = _184;
    if (!_220)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _158 * _226;
        float _236 = 1.0 / _230;
        float _238 = _232 * 0.693147182464599609375;
        float _240 = exp2(_234);
        float _242 = 1.0 / _238;
        float _244 = _240 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _242, _158);
        float _250 = _248 * _236;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _222 = _252;
    }
    float _254 = _222;
    bool _256 = !_168;
    if (!_256)
    {
        float _258 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = log2(_258);
        float _262 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _264 = _262 + 1.0;
        float _266 = 1.0 / _264;
        float _268 = _158 * _260;
        float _270 = exp2(_268);
        float _272 = -_270;
        float _274 = _272 + 1.0;
        float _276 = _274 * _266;
        _172 = _276;
    }
    float _278 = _172;
    float _280 = exp2(_206);
    int _282 = _218 ? 0 : 1;
    float _284 = _150 * 2.0;
    int _286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _288 = _286 != 0;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _292 = _290 != 0;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _296 = _294 != 0;
    float _298 = _150 + (-0.5);
    float _300 = in.m_51.w;
    bool _302 = _194 > 0.0;
    float _304 = floor(_284);
    bool _306 = _194 >= 0.0;
    bool _308 = isnan(_194);
    bool _310 = _306 || _308;
    bool _312 = isnan(0.0);
    bool _314 = _310 || _312;
    float _316 = in.m_53.x;
    float _318 = in.m_53.y;
    float _320 = in.m_53.z;
    int _322 = ~_282;
    int _324 = _322 + 1;
    int _326 = _324 + 1;
    int _328 = _326;
    if (!_208)
    {
        int _330 = ~_282;
        int _332 = _330 + 1;
        _328 = _332;
    }
    int _334 = _328;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _338 = 1.0 + _336;
    bool _340 = !_288;
    int _342 = _340 ? 0 : 1;
    float _344 = -_280;
    float _346 = _344 + 1.0;
    bool _348 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _350 = isnan(1.0);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _356 = _352 || _354;
    float _358 = 1.0 / _338;
    int _360 = abs(_342);
    int _362 = _314 ? 0 : 1;
    float _364 = float(_334);
    float _366 = float(_360);
    bool _368 = !_292;
    int _370 = _368 ? 0 : 1;
    bool _372 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _374 = isnan(0.0);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _380 = _376 || _378;
    float _382 = _366 * _364;
    int _384 = ~_362;
    int _386 = _384 + 1;
    int _388 = _386 + 1;
    int _390 = _388;
    if (!_302)
    {
        int _392 = ~_362;
        int _394 = _392 + 1;
        _390 = _394;
    }
    int _396 = _390;
    int _398 = abs(_370);
    float _400 = _382 * (-2.0);
    bool _402 = _304 > 0.0;
    float _404 = _380 ? _346 : 0.0;
    float _406 = fma(_400, _316, _316);
    float _408 = float(_396);
    float _410 = fma(_202, _400, _202);
    float _412 = float(_398);
    if (_356)
    {
        float _414 = _404 * _358;
        _128 = _414;
    }
    float _416 = _128;
    bool _418 = _304 >= 0.0;
    bool _420 = isnan(_304);
    bool _422 = _418 || _420;
    bool _424 = isnan(0.0);
    bool _426 = _422 || _424;
    float _428 = _148 + (-0.5);
    bool _430 = !_296;
    int _432 = _430 ? 0 : 1;
    float _434 = _412 * _408;
    int _436 = _426 ? 0 : 1;
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[196].x, _406);
    float _440 = _148 + _152;
    float _442 = _434 * (-2.0);
    int _444 = ~_436;
    int _446 = _444 + 1;
    int _448 = _446 + 1;
    float _450 = fma(_410, _416, _438);
    int _452 = _448;
    if (!_402)
    {
        int _454 = ~_436;
        int _456 = _454 + 1;
        _452 = _456;
    }
    int _458 = _452;
    float _460 = fma(_442, _318, _318);
    int _462 = abs(_432);
    float _464 = fma(_200, _442, _200);
    float _466 = float(_458);
    float _468 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[196].y, _460);
    float _470 = float(_462);
    float _472 = in.m_51.x;
    float _474 = in.m_51.y;
    float _476 = in.m_51.z;
    float _478 = fma(_464, _416, _468);
    float _480 = _440 + (-1.0);
    float _482 = _470 * _466;
    float _484 = in.m_55.x;
    float _486 = in.m_55.y;
    float _488 = in.m_55.z;
    float _490 = _478 * 0.15915493667125701904296875;
    float _492 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _494 = _482 * (-2.0);
    float _496 = _152 + (-0.5);
    float _498 = _450 * 0.15915493667125701904296875;
    float _500 = _490 * 6.283185482025146484375;
    float _502 = sin(_500);
    float _504 = fma(_494, _320, _320);
    float _506 = fma(_492, _494, _492);
    float _508 = in.m_47.x;
    float _510 = in.m_47.y;
    float _512 = in.m_47.z;
    float _514 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[196].z, _504);
    float _516 = in.m_42.x;
    float _518 = in.m_42.y;
    float _520 = in.m_42.z;
    float _522 = _498 * 6.283185482025146484375;
    float _524 = cos(_522);
    float _526 = fma(_506, _416, _514);
    bool _528 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _530 = isnan(0.5);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _536 = _532 || _534;
    float _538 = _526 * 0.15915493667125701904296875;
    float _540 = _474 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _542 = _472 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _544 = _490 * 6.283185482025146484375;
    float _546 = cos(_544);
    float _548 = _476 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _550 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _486);
    float _552 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _554 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _484);
    float _556 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _558 = _550 * _552;
    float _560 = _538 * 6.283185482025146484375;
    float _562 = cos(_560);
    float _564 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _566 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _568 = _554 * _556;
    float _570 = _524 * _502;
    float _572 = fma(_278, _508, _564);
    float _574 = fma(_278, _512, _566);
    float _576 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _488);
    float _578 = _498 * 6.283185482025146484375;
    float _580 = sin(_578);
    float _582 = _524 * _546;
    float _584 = fma(_572, _300, _516);
    float _586 = fma(_574, _300, _520);
    float _588 = _538 * 6.283185482025146484375;
    float _590 = sin(_588);
    float _592 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _594 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _596 = _524 * _562;
    float _598 = _576 * _592;
    float _600 = fma(_278, _510, _594);
    float _602 = _596 * _558;
    float _604 = _580 * _502;
    float _606 = _546 * _562;
    float _608 = fma(_600, _300, _518);
    float _610 = _580 * _546;
    float _612 = _580 * _562;
    float _614 = _502 * _562;
    float _616 = _608 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _618 = _608 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _620 = fma(_590, _582, _604);
    float _622 = fma(_590, _604, _582);
    float _624 = -_570;
    float _626 = fma(_590, _610, _624);
    float _628 = -_558;
    float _630 = _590 * _628;
    float _632 = -_610;
    float _634 = fma(_590, _570, _632);
    float _636 = fma(_620, _568, _602);
    float _638 = _612 * _558;
    float _640 = fma(_606, _568, _630);
    float _642 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[6].x, _616);
    float _644 = fma(_634, _598, _636);
    float _646 = fma(_626, _568, _638);
    float _648 = fma(_614, _598, _640);
    float _650 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[4].x, _618);
    float _652 = _644 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _654 = fma(_622, _598, _646);
    float _656 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[6].z, _642);
    float _658 = _644 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _660 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[10].x, _652);
    float _662 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[4].z, _650);
    float _664 = _656 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _666 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[8].x, _658);
    float _668 = fma(_654, (*spvDescriptorSet0.vp_c10)._m0[10].z, _660);
    float _670 = _608 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _672 = _662 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _674 = fma(_654, (*spvDescriptorSet0.vp_c10)._m0[8].z, _666);
    float _676 = _664 + _668;
    float _678 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[5].x, _670);
    float _680 = _568;
    float _682 = _644;
    if (_536)
    {
        _680 = 1.0;
    }
    float _684 = _680;
    float _686 = _672 + _674;
    float _688 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _690 = _676 + _688;
    float _692 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[5].z, _678);
    float _694 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _696 = _686 + _694;
    float _698 = _690 * _690;
    float _700 = _692 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _702 = fma(_696, _696, _698);
    float _704 = _700 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _706 = _700 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _708 = sqrt(_702);
    float _710 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[11].x, _704);
    float _712 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[10].x, _706);
    float _714 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[11].z, _710);
    float _716 = fma(_664, (*spvDescriptorSet0.vp_c8)._m0[10].z, _712);
    float _718 = _714 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _720 = _644 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _722 = _716 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _724 = 1.0 / _718;
    float _726 = fma(_648, (*spvDescriptorSet0.vp_c10)._m0[9].x, _720);
    float _728 = _722 + _718;
    bool _730 = _708 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _732 = fma(_654, (*spvDescriptorSet0.vp_c10)._m0[9].z, _726);
    float _734 = _700 + _732;
    float _736 = _728 * _724;
    float _738 = _736 * 0.5;
    float _740 = _728;
    float _742 = _700;
    float _744 = _732;
    float _746 = _686;
    float _748 = _684;
    if (!_730)
    {
        _740 = _686;
    }
    float _750 = _740;
    float _752 = _750;
    if (!_730)
    {
        _742 = _676;
    }
    float _754 = _742;
    float _756 = _754;
    if (!_730)
    {
        _744 = _734;
    }
    float _758 = _744;
    bool _760 = !_730;
    float _762 = _758;
    if (!_760)
    {
        float _764 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _768 = _708 + _766;
        float _770 = rsqrt(_702);
        float _772 = _768 * _764;
        float _774 = _734 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _776 = _772 * 0.15915493667125701904296875;
        float _778 = _776 * 6.283185482025146484375;
        float _780 = cos(_778);
        float _782 = _776 * 6.283185482025146484375;
        float _784 = sin(_782);
        float _786 = _780 + (-1.0);
        float _788 = _786 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _790 = fma(_784, _774, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _792 = fma(_734, _780, _788);
        float _794 = _770 * _790;
        float _796 = fma(_696, _794, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _798 = fma(_690, _794, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _762 = _792;
        _752 = _796;
        _756 = _798;
    }
    float _800 = _762;
    float _802 = _752;
    float _804 = _756;
    if (!_536)
    {
        float _806 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _808 = _806 * 0.15915493667125701904296875;
        float _810 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _812 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _814 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[30].w, _812);
        float _816 = _808 * 6.283185482025146484375;
        float _818 = cos(_816);
        float _820 = _810 * 0.15915493667125701904296875;
        float _822 = _808 * 6.283185482025146484375;
        float _824 = sin(_822);
        float _826 = 1.0 / _818;
        float _828 = _820 * 6.283185482025146484375;
        float _830 = cos(_828);
        float _832 = _824 * _826;
        float _834 = _820 * 6.283185482025146484375;
        float _836 = sin(_834);
        float _838 = _830 * _832;
        float _840 = 1.0 / _814;
        float _842 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _844 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _842;
        float _846 = 1.0 / _838;
        float _848 = 1.0 / _844;
        float _850 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _852 = _840 * _850;
        float _854 = _836 * _846;
        float _856 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _858 = fma(_854, _852, _856);
        float _860 = _858 * _848;
        float _862 = precise::clamp(_860, 0.0, 1.0);
        _746 = _820;
        _682 = _846;
        _748 = _862;
    }
    float _864 = _746;
    float _866 = _682;
    float _868 = _748;
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _872 = _800 + _870;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _876 = _802 + _874;
    float _878 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _880 = _804 + _878;
    float _882 = _872 * _872;
    float _884 = fma(_876, _876, _882);
    float _886 = fma(_880, _880, _884);
    float _888 = rsqrt(_886);
    float _890 = sqrt(_886);
    float _892 = _888 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _894 = _876 * _892;
    float _896 = _880 * _892;
    float _898 = _894 * _894;
    float _900 = _896 * _896;
    float _902 = _898 + _900;
    float _904 = sqrt(_902);
    bool _906 = _904 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _908 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _910 = _904 + _908;
    float _912 = _880;
    float _914 = _866;
    float _916 = _910;
    float _918 = _864;
    float _920 = _872;
    if (_906)
    {
        float _922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _912 = _922;
    }
    float _924 = _912;
    if (_906)
    {
        float _926 = rsqrt(_902);
        _914 = _926;
    }
    float _928 = _914;
    float _930 = _928;
    if (_906)
    {
        float _932 = _910 * _924;
        _916 = _932;
    }
    float _934 = _916;
    if (_906)
    {
        float _936 = _934 * 0.15915493667125701904296875;
        _918 = _936;
    }
    float _938 = _918;
    float _940 = _882;
    if (_906)
    {
        float _942 = _938 * 6.283185482025146484375;
        float _944 = sin(_942);
        _940 = _944;
    }
    float _946 = _940;
    float _948 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _950 = precise::max(0.0, _948);
    float _952 = _888;
    float _954 = _950;
    float _956 = _948;
    if (_906)
    {
        float _958 = _938 * 6.283185482025146484375;
        float _960 = cos(_958);
        _952 = _960;
    }
    float _962 = _952;
    float _964 = -_892;
    float _966 = -_950;
    float _968 = fma(_872, _964, _966);
    if (!_906)
    {
        _954 = _894;
    }
    float _970 = _954;
    float _972 = _970;
    if (_906)
    {
        float _974 = _968 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _956 = _974;
    }
    float _976 = _956;
    float _978 = _800 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _980 = _946;
    float _982 = _976;
    if (_906)
    {
        float _984 = fma(_946, _976, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _920 = _984;
    }
    float _986 = _920;
    float _988 = _986;
    if (!_906)
    {
        _980 = _898;
    }
    float _990 = _980;
    float _992 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[2].x, _978);
    float _994 = _990;
    float _996 = _962;
    if (_906)
    {
        float _998 = _962 + (-1.0);
        _982 = _998;
    }
    float _1000 = _982;
    float _1002 = 0.0;
    float _1004 = _1000;
    if (_906)
    {
        float _1006 = _928 * _986;
        _1002 = _1006;
    }
    float _1008 = _1002;
    if (!_906)
    {
        _988 = _968;
    }
    float _1010 = _988;
    float _1012 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[2].z, _992);
    float _1014 = _1010;
    if (_906)
    {
        float _1016 = _1000 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _930 = _1016;
    }
    float _1018 = _930;
    if (_906)
    {
        float _1020 = _894 * _1008;
        _972 = _1020;
    }
    float _1022 = _972;
    if (!_906)
    {
        _1004 = _896;
    }
    float _1024 = _1004;
    float _1026 = _1024;
    if (_906)
    {
        float _1028 = _896 * _1008;
        _1026 = _1028;
    }
    float _1030 = _1026;
    if (_906)
    {
        float _1032 = fma(_968, _962, _1018);
        _1014 = _1032;
    }
    float _1034 = _1014;
    if (_906)
    {
        float _1036 = _1022 * _1022;
        _994 = _1036;
    }
    float _1038 = _994;
    if (!_906)
    {
        _996 = _900;
    }
    float _1040 = _996;
    float _1042 = _1040;
    if (_906)
    {
        float _1044 = _1030 * _1030;
        _1042 = _1044;
    }
    float _1046 = _1042;
    float _1048 = fma(_1034, _1034, _1038);
    float _1050 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1052 = _800 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1054 = _1048 + _1046;
    float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1058 = fma(_890, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1056);
    float _1060 = precise::clamp(_1058, 0.0, 1.0);
    float _1062 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1064 = _800 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1066 = rsqrt(_1054);
    float _1068 = _800 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1070 = -_1060;
    float _1072 = _1070 + 1.0;
    float _1074 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1064);
    float _1076 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1052);
    float _1078 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1068);
    float _1080 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1074);
    float _1082 = abs(_1072);
    float _1084 = log2(_1082);
    float _1086 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1078);
    float _1088 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1076);
    float _1090 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1092 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1094 = _1086 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1096 = _1088 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1098 = _1066 * _1022;
    float _1100 = -_1092;
    float _1102 = fma(_1100, _1062, 1.0);
    float _1104 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1106 = _1066 * _1034;
    float _1108 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1110 = _1066 * _1030;
    float _1112 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1104);
    float _1114 = log2(_1102);
    float _1116 = -_1108;
    float _1118 = fma(_1106, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1116);
    float _1120 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1122 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1112);
    float _1124 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1126 = -_1110;
    float _1128 = fma(_1126, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1118);
    float _1130 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1132 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1122);
    float _1134 = exp2(_1120);
    float _1136 = fma(_1128, -0.5, 0.5);
    float _1138 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1130);
    float _1140 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1124);
    float _1142 = fma(_1128, 0.5, 0.5);
    float _1144 = _1106 + 1.0;
    float _1146 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1138);
    float _1148 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1140);
    float _1150 = 1.0 / _1132;
    float _1152 = fma(_1142, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1154 = _1114 * 0.693147182464599609375;
    float _1156 = fma(_1142, _1152, -0.212114393711090087890625);
    float _1158 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1160 = sqrt(_1136);
    float _1162 = -_1106;
    float _1164 = fma(_1134, _1144, _1162);
    float _1166 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1146);
    float _1168 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1148);
    float _1170 = fma(_1142, _1156, 1.570728778839111328125);
    float _1172 = fma(_1164, 0.5, 0.5);
    float _1174 = _1166 * _1150;
    float _1176 = _1168 * _1150;
    float _1178 = fma(_1174, 0.5, 0.5);
    float _1180 = fma(_1176, -0.5, 0.5);
    float _1182 = _1160 * 0.636619746685028076171875;
    float3 _3100 = float3(_1178, _1180, _1158);
    float _1184 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3100, float3(0.0), isnan(_3100)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3100, float3(0.0), isnan(_3100)), level(0.0)).x;
    float _1186 = -_1170;
    float _1188 = fma(_1182, _1186, 1.0);
    float3 _3116 = float3(_1178, _1180, _1158);
    float4 _1191 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3116, float3(0.0), isnan(_3116)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3116, float3(0.0), isnan(_3116)), level(0.0)).xyzw;
    float _1193 = _1191.x;
    float _1195 = _1191.y;
    float _1197 = _1191.z;
    float _1199 = _1191.w;
    float2 _3133 = float2(_1188, _1172);
    float3 _1203 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3133, float2(0.0), isnan(_3133)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3133, float2(0.0), isnan(_3133)), level(0.0)).xyz;
    float _1205 = _1203.x;
    float _1207 = _1203.y;
    float _1209 = _1203.z;
    float _1211 = in.m_57.x;
    float _1213 = in.m_57.y;
    float _1215 = in.m_57.z;
    bool _1217 = _486 != 0.0;
    bool _1219 = isnan(_486);
    bool _1221 = _1217 || _1219;
    bool _1223 = isnan(0.0);
    bool _1225 = _1221 || _1223;
    float _1227 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_59.x = _802;
    out.m_59.y = _800;
    out.m_59.z = _804;
    bool _1229 = _484 == 0.0;
    bool _1231 = !_1225;
    bool _1233 = _1229 && _1231;
    float _1235 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1227);
    bool _1237 = _488 == 0.0;
    bool _1239 = _1237 && _1233;
    float _1241 = _1213;
    float _1243 = _1211;
    float _1245 = _1215;
    if (!_1239)
    {
        float _1247 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1213);
        _1241 = _1247;
    }
    float _1249 = _1241;
    if (!_1239)
    {
        float _1251 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1211);
        _1243 = _1251;
    }
    float _1253 = _1243;
    if (!_1239)
    {
        float _1255 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1215);
        _1245 = _1255;
    }
    float _1257 = _1245;
    float _1259 = _596 * _1249;
    float _1261 = -_1249;
    float _1263 = _590 * _1261;
    float _1265 = _612 * _1249;
    float _1267 = fma(_620, _1253, _1259);
    float _1269 = fma(_606, _1253, _1263);
    float _1271 = fma(_626, _1253, _1265);
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1275 = fma(_634, _1257, _1267);
    float _1277 = fma(_614, _1257, _1269);
    float _1279 = fma(_622, _1257, _1271);
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1285 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1287 = _1275 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1289 = in.m_61.w;
    float _1291 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1283);
    float _1293 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1285);
    float _1295 = fma(_1277, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1287);
    float _1297 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1299 = fma(_1279, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1291);
    float _1301 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1235);
    float _1303 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1305 = exp2(_1297);
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1311 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1313 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1315 = fma(_1279, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1293);
    float _1317 = fma(_1279, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1295);
    float _1319 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1301);
    bool _1321 = _868 > 0.0;
    bool _1323 = isnan(_868);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan(0.0);
    bool _1329 = _1325 || _1327;
    out.m_63.x = _1303;
    out.m_63.y = _1313;
    out.m_63.z = _1311;
    out.m_63.w = _1309;
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1335 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1337 = -_1305;
    float _1339 = _1337 + 1.0;
    float _1341 = _868 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1343 = _1319 + _1132;
    float _1345 = _1331 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1349 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1351 = _1335 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1353 = _1343 * 0.5;
    float _1355 = -_1347;
    float _1357 = _1355 + 1.0;
    float _1359 = _1341 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1345;
    out.m_65.y = _1349;
    out.m_65.z = _1351;
    out.m_67.w = _1289;
    out.m_69.x = _1299;
    out.m_69.y = _1315;
    out.m_69.z = _1317;
    out.gl_Position.x = _1166;
    out.gl_Position.y = _1168;
    out.gl_Position.z = _1319;
    out.gl_Position.w = _1132;
    out.m_71.z = _1353;
    out.m_71.w = _1132;
    out.m_45.x = _1359;
    float _1361 = _1347 * _1184;
    float _1363 = _1199 * _1361;
    float _1365 = _1199 * _1357;
    float _1367 = _1209 * _1361;
    float _1369 = fma(_1205, _1363, _1193);
    float _1371 = fma(_1207, _1363, _1195);
    float _1373 = fma(_1199, _1367, _1197);
    out.m_73.x = _1369;
    out.m_73.y = _1371;
    out.m_73.z = _1373;
    out.m_73.w = _1365;
    if (_1329)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1375 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1375;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

