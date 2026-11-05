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
    float4 m_51 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
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
        float _1480 = as_type<float>(_108);
        out.gl_Position.z = _1480;
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
        float _1550 = as_type<float>(_146);
        out.gl_Position.z = _1550;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_49.z;
    float _150 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _152 = log2(_150);
    float _154 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _156 = in.m_49.x;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.y;
    float _170 = 0.0;
    float _172 = _154;
    if (!_166)
    {
        float _174 = _154 * _154;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_166)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    float _186 = _148 * 2.0;
    float _188 = _156 * 2.0;
    float _190 = floor(_186);
    float _192 = _168 * 2.0;
    float _194 = floor(_188);
    float _196 = floor(_192);
    bool _198 = _190 > 0.0;
    bool _200 = _190 >= 0.0;
    bool _202 = isnan(_190);
    bool _204 = _200 || _202;
    bool _206 = isnan(0.0);
    bool _208 = _204 || _206;
    int _210 = _208 ? 0 : 1;
    bool _212 = _194 > 0.0;
    int _214 = ~_210;
    int _216 = _214 + 1;
    int _218 = _216 + 1;
    bool _220 = _194 >= 0.0;
    bool _222 = isnan(_194);
    bool _224 = _220 || _222;
    bool _226 = isnan(0.0);
    bool _228 = _224 || _226;
    int _230 = _218;
    float _232 = _184;
    if (!_198)
    {
        int _234 = ~_210;
        int _236 = _234 + 1;
        _230 = _236;
    }
    int _238 = _230;
    bool _240 = _196 > 0.0;
    bool _242 = _196 >= 0.0;
    bool _244 = isnan(_196);
    bool _246 = _242 || _244;
    bool _248 = isnan(0.0);
    bool _250 = _246 || _248;
    bool _252 = !_166;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _264 = _154 * _256;
        float _266 = 1.0 / _260;
        float _268 = _262 * 0.693147182464599609375;
        float _270 = exp2(_264);
        float _272 = 1.0 / _268;
        float _274 = _270 + (-1.0);
        float _276 = -_274;
        float _278 = fma(_276, _272, _154);
        float _280 = _278 * _266;
        float _282 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _232 = _282;
    }
    float _284 = _232;
    bool _286 = !_166;
    if (!_286)
    {
        float _288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = log2(_288);
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = 1.0 / _294;
        float _298 = _154 * _290;
        float _300 = exp2(_298);
        float _302 = -_300;
        float _304 = _302 + 1.0;
        float _306 = _304 * _296;
        _172 = _306;
    }
    float _308 = _172;
    float _310 = _152 * _126;
    float _312 = in.m_51.z;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _316 = _314 != 0;
    int _318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _320 = _318 != 0;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _324 = _322 != 0;
    float _326 = exp2(_310);
    float _328 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    bool _330 = !_316;
    int _332 = _330 ? 0 : 1;
    float _334 = in.m_53.x;
    float _336 = in.m_53.y;
    float _338 = in.m_53.z;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _342 = 1.0 + _340;
    float _344 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[191].y, _156);
    int _346 = abs(_332);
    float _348 = _156 + _168;
    float _350 = float(_238);
    float _352 = _344 * 0.15915493667125701904296875;
    float _354 = float(_346);
    float _356 = 1.0 / _342;
    float _358 = _348 + (-1.0);
    bool _360 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _362 = isnan(1.0);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _368 = _364 || _366;
    float _370 = _354 * _350;
    float _372 = -_326;
    float _374 = _372 + 1.0;
    float _376 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _378 = _228 ? 0 : 1;
    float _380 = _352 * 6.283185482025146484375;
    float _382 = sin(_380);
    int _384 = _250 ? 0 : 1;
    float _386 = _370 * (-2.0);
    bool _388 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _396 = _392 || _394;
    float _398 = in.m_51.y;
    int _400 = ~_384;
    int _402 = _400 + 1;
    int _404 = _402 + 1;
    int _406 = _404;
    if (!_240)
    {
        int _408 = ~_384;
        int _410 = _408 + 1;
        _406 = _410;
    }
    int _412 = _406;
    float _414 = fma(_386, _334, _334);
    bool _416 = !_320;
    int _418 = _416 ? 0 : 1;
    float _420 = in.m_55.w;
    float _422 = _396 ? _374 : 0.0;
    int _424 = abs(_418);
    int _426 = ~_378;
    int _428 = _426 + 1;
    int _430 = _428 + 1;
    float _432 = _382 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _434 = _430;
    if (!_212)
    {
        int _436 = ~_378;
        int _438 = _436 + 1;
        _434 = _438;
    }
    int _440 = _434;
    if (_368)
    {
        float _442 = _422 * _356;
        _128 = _442;
    }
    float _444 = _128;
    float _446 = _168 + _148;
    float _448 = _432 * 0.01745329238474369049072265625;
    bool _450 = !_324;
    int _452 = _450 ? 0 : 1;
    float _454 = fma(_376, _386, _376);
    float _456 = float(_440);
    float _458 = _448 * 0.15915493667125701904296875;
    float _460 = _156 + (-0.5);
    float _462 = _446 + (-1.0);
    float _464 = float(_424);
    float _466 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[196].x, _414);
    int _468 = abs(_452);
    float _470 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _472 = float(_412);
    float _474 = _464 * _456;
    float _476 = float(_468);
    float _478 = _156 + _148;
    float _480 = in.m_55.x;
    float _482 = in.m_55.y;
    float _484 = in.m_55.z;
    float _486 = _474 * (-2.0);
    float _488 = _476 * _472;
    float _490 = _168 + (-0.5);
    float _492 = _478 + (-1.0);
    float _494 = fma(_486, _336, _336);
    float _496 = in.m_51.x;
    float _498 = _488 * (-2.0);
    float _500 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _502 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[196].y, _494);
    float _504 = fma(_470, _486, _470);
    float _506 = in.m_47.x;
    float _508 = in.m_47.y;
    float _510 = in.m_47.z;
    float _512 = fma(_498, _338, _338);
    float _514 = _148 + (-0.5);
    float _516 = fma(_504, _444, _502);
    float _518 = fma(_454, _444, _466);
    float _520 = _458 * 6.283185482025146484375;
    float _522 = sin(_520);
    float _524 = in.m_42.x;
    float _526 = in.m_42.y;
    float _528 = in.m_42.z;
    float _530 = _516 * 0.15915493667125701904296875;
    float _532 = fma(_500, _498, _500);
    float _534 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[196].z, _512);
    float _536 = _518 * 0.15915493667125701904296875;
    float _538 = _480 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _540 = _458 * 6.283185482025146484375;
    float _542 = cos(_540);
    float _544 = fma(_532, _444, _534);
    float _546 = _484 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _548 = _538 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _550 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _552 = _544 * 0.15915493667125701904296875;
    float _554 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _556 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _558 = _536 * 6.283185482025146484375;
    float _560 = sin(_558);
    float _562 = _522 * _312;
    float _564 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _566 = fma(_308, _506, _550);
    float _568 = fma(_308, _508, _554);
    float _570 = fma(_308, _510, _556);
    bool _572 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _574 = isnan(0.5);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _580 = _576 || _578;
    float _582 = _536 * 6.283185482025146484375;
    float _584 = cos(_582);
    float _586 = _542 * _312;
    float _588 = -_562;
    float _590 = fma(_542, _398, _588);
    float _592 = fma(_570, _420, _528);
    float _594 = fma(_566, _420, _524);
    float _596 = fma(_522, _398, _586);
    float _598 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _590);
    float _600 = fma(_568, _420, _526);
    float _602 = _530 * 6.283185482025146484375;
    float _604 = sin(_602);
    float _606 = _482 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _608 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _496);
    float _610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _596);
    float _612 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _614 = _608 * _548;
    float _616 = _610 * _564;
    float _618 = _530 * 6.283185482025146484375;
    float _620 = cos(_618);
    float _622 = _598 * _612;
    float _624 = _552 * 6.283185482025146484375;
    float _626 = cos(_624);
    float _628 = _560 * _604;
    float _630 = _584 * _604;
    float _632 = _552 * 6.283185482025146484375;
    float _634 = sin(_632);
    float _636 = _584 * _620;
    float _638 = _560 * _620;
    float _640 = _584 * _626;
    float _642 = _620 * _626;
    float _644 = _560 * _626;
    float _646 = _604 * _626;
    float _648 = _640 * _622;
    float _650 = fma(_634, _636, _628);
    float _652 = -_622;
    float _654 = _634 * _652;
    float _656 = _644 * _622;
    float _658 = -_630;
    float _660 = fma(_634, _638, _658);
    float _662 = -_638;
    float _664 = fma(_634, _630, _662);
    float _666 = fma(_650, _614, _648);
    float _668 = fma(_634, _628, _636);
    float _670 = fma(_642, _614, _654);
    float _672 = fma(_660, _614, _656);
    float _674 = _600 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _676 = fma(_664, _616, _666);
    float _678 = fma(_646, _616, _670);
    float _680 = fma(_668, _616, _672);
    float _682 = _600 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _684 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[6].x, _674);
    float _686 = _676 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _688 = _600 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _690 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[4].x, _682);
    float _692 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[6].z, _684);
    float _694 = _676 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _696 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[10].x, _686);
    float _698 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[4].z, _690);
    float _700 = _692 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _702 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[8].x, _694);
    float _704 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[10].z, _696);
    float _706 = _698 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _708 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[5].x, _688);
    float _710 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[8].z, _702);
    float _712 = _700 + _704;
    float _714 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[5].z, _708);
    float _716 = _706 + _710;
    float _718 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _720 = _712 + _718;
    float _722 = _714 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _724 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _726 = _716 + _724;
    float _728 = _720 * _720;
    float _730 = _722 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _732 = fma(_726, _726, _728);
    float _734 = _722 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _736 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[11].x, _730);
    float _738 = sqrt(_732);
    float _740 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[10].x, _734);
    float _742 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[11].z, _736);
    float _744 = _742 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _746 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[10].z, _740);
    float _748 = _676 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _750 = 1.0 / _744;
    float _752 = _746 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _754 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[9].x, _748);
    float _756 = _752 + _744;
    bool _758 = _738 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _760 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[9].z, _754);
    float _762 = _722 + _760;
    float _764 = _722;
    float _766 = _748;
    float _768 = _744;
    float _770 = _756;
    float _772 = _726;
    float _774 = _700;
    if (_580)
    {
        _764 = 1.0;
    }
    float _776 = _764;
    float _778 = _756 * _750;
    float _780 = _778 * 0.5;
    float _782 = _776;
    if (!_758)
    {
        _766 = _716;
    }
    float _784 = _766;
    float _786 = _784;
    if (!_758)
    {
        _768 = _712;
    }
    float _788 = _768;
    float _790 = _788;
    if (!_758)
    {
        _770 = _762;
    }
    float _792 = _770;
    bool _794 = !_758;
    float _796 = _792;
    if (!_794)
    {
        float _798 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _800 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _802 = _738 + _800;
        float _804 = _762 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _806 = rsqrt(_732);
        float _808 = _802 * _798;
        float _810 = _808 * 0.15915493667125701904296875;
        float _812 = _810 * 6.283185482025146484375;
        float _814 = cos(_812);
        float _816 = _810 * 6.283185482025146484375;
        float _818 = sin(_816);
        float _820 = _814 + (-1.0);
        float _822 = _820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _824 = fma(_818, _804, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _826 = fma(_762, _814, _822);
        float _828 = _806 * _824;
        float _830 = fma(_726, _828, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _832 = fma(_720, _828, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _796 = _826;
        _786 = _830;
        _790 = _832;
    }
    float _834 = _796;
    float _836 = _786;
    float _838 = _790;
    if (!_580)
    {
        float _840 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _842 = _840 * 0.15915493667125701904296875;
        float _844 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _846 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _848 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[30].w, _846);
        float _850 = _842 * 6.283185482025146484375;
        float _852 = cos(_850);
        float _854 = _844 * 0.15915493667125701904296875;
        float _856 = _842 * 6.283185482025146484375;
        float _858 = sin(_856);
        float _860 = 1.0 / _852;
        float _862 = _854 * 6.283185482025146484375;
        float _864 = cos(_862);
        float _866 = _858 * _860;
        float _868 = _854 * 6.283185482025146484375;
        float _870 = sin(_868);
        float _872 = _864 * _866;
        float _874 = 1.0 / _848;
        float _876 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _878 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _876;
        float _880 = 1.0 / _872;
        float _882 = 1.0 / _878;
        float _884 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _886 = _874 * _884;
        float _888 = _870 * _880;
        float _890 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _892 = fma(_888, _886, _890);
        float _894 = _892 * _882;
        float _896 = precise::clamp(_894, 0.0, 1.0);
        _772 = _882;
        _782 = _896;
    }
    float _898 = _772;
    float _900 = _782;
    float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _904 = _834 + _902;
    float _906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _908 = _836 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _912 = _838 + _910;
    float _914 = _904 * _904;
    float _916 = fma(_908, _908, _914);
    float _918 = fma(_912, _912, _916);
    float _920 = rsqrt(_918);
    float _922 = sqrt(_918);
    float _924 = _920 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _926 = _908 * _924;
    float _928 = _912 * _924;
    float _930 = _926 * _926;
    float _932 = _928 * _928;
    float _934 = _930 + _932;
    float _936 = sqrt(_934);
    bool _938 = _936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _942 = _936 + _940;
    float _944 = _920;
    float _946 = _934;
    float _948 = _942;
    float _950 = _898;
    float _952 = _904;
    if (_938)
    {
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _944 = _954;
    }
    float _956 = _944;
    if (_938)
    {
        float _958 = rsqrt(_934);
        _946 = _958;
    }
    float _960 = _946;
    float _962 = _960;
    if (_938)
    {
        float _964 = _942 * _956;
        _948 = _964;
    }
    float _966 = _948;
    if (_938)
    {
        float _968 = _966 * 0.15915493667125701904296875;
        _950 = _968;
    }
    float _970 = _950;
    float _972 = _912;
    if (_938)
    {
        float _974 = _970 * 6.283185482025146484375;
        float _976 = sin(_974);
        _972 = _976;
    }
    float _978 = _972;
    float _980 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _982 = precise::max(0.0, _980);
    float _984 = _956;
    float _986 = _982;
    if (_938)
    {
        float _988 = _970 * 6.283185482025146484375;
        float _990 = cos(_988);
        _984 = _990;
    }
    float _992 = _984;
    float _994 = -_924;
    float _996 = -_982;
    float _998 = fma(_904, _994, _996);
    if (_938)
    {
        float _1000 = _998 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _952 = _1000;
    }
    float _1002 = _952;
    float _1004 = _834 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1006 = _1002;
    float _1008 = _978;
    if (_938)
    {
        float _1010 = fma(_978, _1002, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1006 = _1010;
    }
    float _1012 = _1006;
    float _1014 = _1012;
    if (!_938)
    {
        _1008 = _926;
    }
    float _1016 = _1008;
    float _1018 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1004);
    float _1020 = _1016;
    float _1022 = _992;
    if (_938)
    {
        float _1024 = _992 + (-1.0);
        _986 = _1024;
    }
    float _1026 = _986;
    float _1028 = 0.0;
    float _1030 = _1026;
    if (_938)
    {
        float _1032 = _960 * _1012;
        _1028 = _1032;
    }
    float _1034 = _1028;
    if (!_938)
    {
        _1014 = _998;
    }
    float _1036 = _1014;
    float _1038 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1018);
    float _1040 = _1036;
    if (_938)
    {
        float _1042 = _1026 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _774 = _1042;
    }
    float _1044 = _774;
    if (_938)
    {
        float _1046 = _926 * _1034;
        _1020 = _1046;
    }
    float _1048 = _1020;
    if (!_938)
    {
        _1030 = _928;
    }
    float _1050 = _1030;
    float _1052 = _1050;
    if (_938)
    {
        float _1054 = _928 * _1034;
        _1052 = _1054;
    }
    float _1056 = _1052;
    if (!_938)
    {
        _962 = _930;
    }
    float _1058 = _962;
    float _1060 = _1058;
    if (_938)
    {
        float _1062 = fma(_998, _992, _1044);
        _1040 = _1062;
    }
    float _1064 = _1040;
    if (_938)
    {
        float _1066 = _1048 * _1048;
        _1060 = _1066;
    }
    float _1068 = _1060;
    if (!_938)
    {
        _1022 = _932;
    }
    float _1070 = _1022;
    float _1072 = _1070;
    if (_938)
    {
        float _1074 = _1056 * _1056;
        _1072 = _1074;
    }
    float _1076 = _1072;
    float _1078 = fma(_1064, _1064, _1068);
    float _1080 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1082 = _834 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1084 = _1078 + _1076;
    float _1086 = _834 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1090 = fma(_922, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1088);
    float _1092 = precise::clamp(_1090, 0.0, 1.0);
    float _1094 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1096 = rsqrt(_1084);
    float _1098 = _834 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1100 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1086);
    float _1102 = -_1092;
    float _1104 = _1102 + 1.0;
    float _1106 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1082);
    float _1108 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1098);
    float _1110 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1100);
    float _1112 = abs(_1104);
    float _1114 = log2(_1112);
    float _1116 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1108);
    float _1118 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1120 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1106);
    float _1122 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1124 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1126 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1128 = _1096 * _1048;
    float _1130 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1132 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1126);
    float _1134 = _1096 * _1064;
    float _1136 = _1128 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1138 = _1096 * _1056;
    float _1140 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1132);
    float _1142 = -_1122;
    float _1144 = fma(_1142, _1094, 1.0);
    float _1146 = -_1136;
    float _1148 = fma(_1134, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1146);
    float _1150 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1152 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1140);
    float _1154 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1156 = -_1138;
    float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1148);
    float _1160 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1162 = 1.0 / _1152;
    float _1164 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1154);
    float _1166 = fma(_1158, -0.5, 0.5);
    float _1168 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1160);
    float _1170 = fma(_1158, 0.5, 0.5);
    float _1172 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1164);
    float _1174 = _1134 + 1.0;
    float _1176 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1168);
    float _1178 = log2(_1144);
    float _1180 = fma(_1170, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1182 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1176);
    float _1184 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1172);
    float _1186 = fma(_1170, _1180, -0.212114393711090087890625);
    float _1188 = exp2(_1150);
    float _1190 = _1182 * _1162;
    float _1192 = _1184 * _1162;
    float _1194 = fma(_1170, _1186, 1.570728778839111328125);
    float _1196 = fma(_1192, -0.5, 0.5);
    float _1198 = sqrt(_1166);
    float _1200 = _1178 * 0.693147182464599609375;
    float _1202 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1204 = -_1134;
    float _1206 = fma(_1188, _1174, _1204);
    float _1208 = fma(_1190, 0.5, 0.5);
    float _1210 = fma(_1206, 0.5, 0.5);
    float _1212 = _1198 * 0.636619746685028076171875;
    float3 _3194 = float3(_1208, _1196, _1202);
    float _1214 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3194, float3(0.0), isnan(_3194)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3194, float3(0.0), isnan(_3194)), level(0.0)).x;
    float3 _3205 = float3(_1208, _1196, _1202);
    float4 _1217 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3205, float3(0.0), isnan(_3205)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3205, float3(0.0), isnan(_3205)), level(0.0)).xyzw;
    float _1219 = _1217.x;
    float _1221 = _1217.y;
    float _1223 = _1217.z;
    float _1225 = _1217.w;
    float _1227 = -_1194;
    float _1229 = fma(_1212, _1227, 1.0);
    float2 _3227 = float2(_1229, _1210);
    float3 _1233 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3227, float2(0.0), isnan(_3227)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3227, float2(0.0), isnan(_3227)), level(0.0)).xyz;
    float _1235 = _1233.x;
    float _1237 = _1233.y;
    float _1239 = _1233.z;
    float _1241 = in.m_57.z;
    bool _1243 = _590 != 0.0;
    bool _1245 = isnan(_590);
    bool _1247 = _1243 || _1245;
    bool _1249 = isnan(0.0);
    bool _1251 = _1247 || _1249;
    float _1253 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1255 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1257 = in.m_57.y;
    bool _1259 = _496 == 0.0;
    bool _1261 = !_1251;
    bool _1263 = _1259 && _1261;
    float _1265 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1255);
    float _1267 = in.m_57.x;
    bool _1269 = _596 == 0.0;
    bool _1271 = _1269 && _1263;
    float _1273 = exp2(_1253);
    float _1275 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1265);
    out.m_59.x = _836;
    out.m_59.y = _834;
    out.m_59.z = _838;
    float _1277 = _522 * _1241;
    float _1279 = -_1273;
    float _1281 = _1279 + 1.0;
    float _1283 = -_1277;
    float _1285 = fma(_542, _1257, _1283);
    float _1287 = _542 * _1241;
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1291 = _1285;
    if (!_1271)
    {
        float _1293 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1285);
        _1291 = _1293;
    }
    float _1295 = _1291;
    float _1297 = _1267;
    if (!_1271)
    {
        float _1299 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1267);
        _1297 = _1299;
    }
    float _1301 = _1297;
    float _1303 = fma(_522, _1257, _1287);
    float _1305 = _640 * _1295;
    float _1307 = -_1295;
    float _1309 = _634 * _1307;
    float _1311 = _1303;
    if (!_1271)
    {
        float _1313 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1303);
        _1311 = _1313;
    }
    float _1315 = _1311;
    float _1317 = _644 * _1295;
    float _1319 = fma(_650, _1301, _1305);
    float _1321 = fma(_642, _1301, _1309);
    float _1323 = in.m_61.w;
    float _1325 = fma(_660, _1301, _1317);
    float _1327 = fma(_664, _1315, _1319);
    float _1329 = fma(_646, _1315, _1321);
    float _1331 = fma(_668, _1315, _1325);
    float _1333 = _1327 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1335 = _1327 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1337 = _1327 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1339 = fma(_1329, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1333);
    float _1341 = fma(_1329, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1335);
    float _1343 = fma(_1329, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1337);
    float _1345 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1339);
    float _1347 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1341);
    float _1349 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1343);
    float _1351 = _1152 * 0.5;
    float _1353 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1275);
    float _1355 = fma(_1184, -0.5, _1351);
    float _1357 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1359 = _900 > 0.0;
    bool _1361 = isnan(_900);
    bool _1363 = _1359 || _1361;
    bool _1365 = isnan(0.0);
    bool _1367 = _1363 || _1365;
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1379 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1381 = _1353 + _1152;
    float _1383 = _1182 + _1152;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1387 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1389 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1391 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1393 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1395 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1397 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1399 = _1381 * 0.5;
    float _1401 = _1383 * 0.5;
    float _1403 = _1379 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _1387;
    out.m_63.y = _1389;
    out.m_63.z = _1391;
    out.m_63.w = _1385;
    out.m_65.x = _1393;
    out.m_65.y = _1395;
    out.m_65.z = _1397;
    out.m_67.w = _1323;
    out.m_69.x = _1345;
    out.m_69.y = _1347;
    out.m_69.z = _1349;
    out.gl_Position.x = _1182;
    out.gl_Position.y = _1184;
    out.gl_Position.z = _1353;
    out.gl_Position.w = _1152;
    out.m_71.x = _1401;
    out.m_71.y = _1355;
    out.m_71.z = _1399;
    out.m_71.w = _1152;
    out.m_45.x = _1403;
    float _1405 = _1289 * _1214;
    float _1407 = -_1289;
    float _1409 = _1407 + 1.0;
    float _1411 = _1225 * _1405;
    float _1413 = _1239 * _1405;
    float _1415 = fma(_1235, _1411, _1219);
    float _1417 = fma(_1237, _1411, _1221);
    float _1419 = _1225 * _1409;
    float _1421 = fma(_1225, _1413, _1223);
    out.m_73.x = _1415;
    out.m_73.y = _1417;
    out.m_73.z = _1421;
    out.m_73.w = _1419;
    if (_1367)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1423 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1423;
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
        float _1480 = as_type<float>(_108);
        out.gl_Position.z = _1480;
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
        float _1550 = as_type<float>(_146);
        out.gl_Position.z = _1550;
    }
    if (_138)
    {
        return out;
    }
    float _148 = in.m_49.z;
    float _150 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _152 = log2(_150);
    float _154 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _156 = in.m_49.x;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.y;
    float _170 = 0.0;
    float _172 = _154;
    if (!_166)
    {
        float _174 = _154 * _154;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_166)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    float _186 = _148 * 2.0;
    float _188 = _156 * 2.0;
    float _190 = floor(_186);
    float _192 = _168 * 2.0;
    float _194 = floor(_188);
    float _196 = floor(_192);
    bool _198 = _190 > 0.0;
    bool _200 = _190 >= 0.0;
    bool _202 = isnan(_190);
    bool _204 = _200 || _202;
    bool _206 = isnan(0.0);
    bool _208 = _204 || _206;
    int _210 = _208 ? 0 : 1;
    bool _212 = _194 > 0.0;
    int _214 = ~_210;
    int _216 = _214 + 1;
    int _218 = _216 + 1;
    bool _220 = _194 >= 0.0;
    bool _222 = isnan(_194);
    bool _224 = _220 || _222;
    bool _226 = isnan(0.0);
    bool _228 = _224 || _226;
    int _230 = _218;
    float _232 = _184;
    if (!_198)
    {
        int _234 = ~_210;
        int _236 = _234 + 1;
        _230 = _236;
    }
    int _238 = _230;
    bool _240 = _196 > 0.0;
    bool _242 = _196 >= 0.0;
    bool _244 = isnan(_196);
    bool _246 = _242 || _244;
    bool _248 = isnan(0.0);
    bool _250 = _246 || _248;
    bool _252 = !_166;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _264 = _154 * _256;
        float _266 = 1.0 / _260;
        float _268 = _262 * 0.693147182464599609375;
        float _270 = exp2(_264);
        float _272 = 1.0 / _268;
        float _274 = _270 + (-1.0);
        float _276 = -_274;
        float _278 = fma(_276, _272, _154);
        float _280 = _278 * _266;
        float _282 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _232 = _282;
    }
    float _284 = _232;
    bool _286 = !_166;
    if (!_286)
    {
        float _288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = log2(_288);
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = 1.0 / _294;
        float _298 = _154 * _290;
        float _300 = exp2(_298);
        float _302 = -_300;
        float _304 = _302 + 1.0;
        float _306 = _304 * _296;
        _172 = _306;
    }
    float _308 = _172;
    float _310 = _152 * _126;
    float _312 = in.m_51.z;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _316 = _314 != 0;
    int _318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _320 = _318 != 0;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _324 = _322 != 0;
    float _326 = exp2(_310);
    float _328 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    bool _330 = !_316;
    int _332 = _330 ? 0 : 1;
    float _334 = in.m_53.x;
    float _336 = in.m_53.y;
    float _338 = in.m_53.z;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _342 = 1.0 + _340;
    float _344 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[191].y, _156);
    int _346 = abs(_332);
    float _348 = _156 + _168;
    float _350 = float(_238);
    float _352 = _344 * 0.15915493667125701904296875;
    float _354 = float(_346);
    float _356 = 1.0 / _342;
    float _358 = _348 + (-1.0);
    bool _360 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _362 = isnan(1.0);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _368 = _364 || _366;
    float _370 = _354 * _350;
    float _372 = -_326;
    float _374 = _372 + 1.0;
    float _376 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _378 = _228 ? 0 : 1;
    float _380 = _352 * 6.283185482025146484375;
    float _382 = sin(_380);
    int _384 = _250 ? 0 : 1;
    float _386 = _370 * (-2.0);
    bool _388 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _396 = _392 || _394;
    float _398 = in.m_51.y;
    int _400 = ~_384;
    int _402 = _400 + 1;
    int _404 = _402 + 1;
    int _406 = _404;
    if (!_240)
    {
        int _408 = ~_384;
        int _410 = _408 + 1;
        _406 = _410;
    }
    int _412 = _406;
    float _414 = fma(_386, _334, _334);
    bool _416 = !_320;
    int _418 = _416 ? 0 : 1;
    float _420 = in.m_55.w;
    float _422 = _396 ? _374 : 0.0;
    int _424 = abs(_418);
    int _426 = ~_378;
    int _428 = _426 + 1;
    int _430 = _428 + 1;
    float _432 = _382 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _434 = _430;
    if (!_212)
    {
        int _436 = ~_378;
        int _438 = _436 + 1;
        _434 = _438;
    }
    int _440 = _434;
    if (_368)
    {
        float _442 = _422 * _356;
        _128 = _442;
    }
    float _444 = _128;
    float _446 = _168 + _148;
    float _448 = _432 * 0.01745329238474369049072265625;
    bool _450 = !_324;
    int _452 = _450 ? 0 : 1;
    float _454 = fma(_376, _386, _376);
    float _456 = float(_440);
    float _458 = _448 * 0.15915493667125701904296875;
    float _460 = _156 + (-0.5);
    float _462 = _446 + (-1.0);
    float _464 = float(_424);
    float _466 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[196].x, _414);
    int _468 = abs(_452);
    float _470 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _472 = float(_412);
    float _474 = _464 * _456;
    float _476 = float(_468);
    float _478 = _156 + _148;
    float _480 = in.m_55.x;
    float _482 = in.m_55.y;
    float _484 = in.m_55.z;
    float _486 = _474 * (-2.0);
    float _488 = _476 * _472;
    float _490 = _168 + (-0.5);
    float _492 = _478 + (-1.0);
    float _494 = fma(_486, _336, _336);
    float _496 = in.m_51.x;
    float _498 = _488 * (-2.0);
    float _500 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _502 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[196].y, _494);
    float _504 = fma(_470, _486, _470);
    float _506 = in.m_47.x;
    float _508 = in.m_47.y;
    float _510 = in.m_47.z;
    float _512 = fma(_498, _338, _338);
    float _514 = _148 + (-0.5);
    float _516 = fma(_504, _444, _502);
    float _518 = fma(_454, _444, _466);
    float _520 = _458 * 6.283185482025146484375;
    float _522 = sin(_520);
    float _524 = in.m_42.x;
    float _526 = in.m_42.y;
    float _528 = in.m_42.z;
    float _530 = _516 * 0.15915493667125701904296875;
    float _532 = fma(_500, _498, _500);
    float _534 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[196].z, _512);
    float _536 = _518 * 0.15915493667125701904296875;
    float _538 = _480 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _540 = _458 * 6.283185482025146484375;
    float _542 = cos(_540);
    float _544 = fma(_532, _444, _534);
    float _546 = _484 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _548 = _538 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _550 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _552 = _544 * 0.15915493667125701904296875;
    float _554 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _556 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _558 = _536 * 6.283185482025146484375;
    float _560 = sin(_558);
    float _562 = _522 * _312;
    float _564 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _566 = fma(_308, _506, _550);
    float _568 = fma(_308, _508, _554);
    float _570 = fma(_308, _510, _556);
    bool _572 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _574 = isnan(0.5);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _580 = _576 || _578;
    float _582 = _536 * 6.283185482025146484375;
    float _584 = cos(_582);
    float _586 = _542 * _312;
    float _588 = -_562;
    float _590 = fma(_542, _398, _588);
    float _592 = fma(_570, _420, _528);
    float _594 = fma(_566, _420, _524);
    float _596 = fma(_522, _398, _586);
    float _598 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _590);
    float _600 = fma(_568, _420, _526);
    float _602 = _530 * 6.283185482025146484375;
    float _604 = sin(_602);
    float _606 = _482 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _608 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _496);
    float _610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _596);
    float _612 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _614 = _608 * _548;
    float _616 = _610 * _564;
    float _618 = _530 * 6.283185482025146484375;
    float _620 = cos(_618);
    float _622 = _598 * _612;
    float _624 = _552 * 6.283185482025146484375;
    float _626 = cos(_624);
    float _628 = _560 * _604;
    float _630 = _584 * _604;
    float _632 = _552 * 6.283185482025146484375;
    float _634 = sin(_632);
    float _636 = _584 * _620;
    float _638 = _560 * _620;
    float _640 = _584 * _626;
    float _642 = _620 * _626;
    float _644 = _560 * _626;
    float _646 = _604 * _626;
    float _648 = _640 * _622;
    float _650 = fma(_634, _636, _628);
    float _652 = -_622;
    float _654 = _634 * _652;
    float _656 = _644 * _622;
    float _658 = -_630;
    float _660 = fma(_634, _638, _658);
    float _662 = -_638;
    float _664 = fma(_634, _630, _662);
    float _666 = fma(_650, _614, _648);
    float _668 = fma(_634, _628, _636);
    float _670 = fma(_642, _614, _654);
    float _672 = fma(_660, _614, _656);
    float _674 = _600 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _676 = fma(_664, _616, _666);
    float _678 = fma(_646, _616, _670);
    float _680 = fma(_668, _616, _672);
    float _682 = _600 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _684 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[6].x, _674);
    float _686 = _676 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _688 = _600 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _690 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[4].x, _682);
    float _692 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[6].z, _684);
    float _694 = _676 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _696 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[10].x, _686);
    float _698 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[4].z, _690);
    float _700 = _692 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _702 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[8].x, _694);
    float _704 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[10].z, _696);
    float _706 = _698 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _708 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[5].x, _688);
    float _710 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[8].z, _702);
    float _712 = _700 + _704;
    float _714 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[5].z, _708);
    float _716 = _706 + _710;
    float _718 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _720 = _712 + _718;
    float _722 = _714 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _724 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _726 = _716 + _724;
    float _728 = _720 * _720;
    float _730 = _722 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _732 = fma(_726, _726, _728);
    float _734 = _722 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _736 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[11].x, _730);
    float _738 = sqrt(_732);
    float _740 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[10].x, _734);
    float _742 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[11].z, _736);
    float _744 = _742 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _746 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[10].z, _740);
    float _748 = _676 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _750 = 1.0 / _744;
    float _752 = _746 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _754 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[9].x, _748);
    float _756 = _752 + _744;
    bool _758 = _738 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _760 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[9].z, _754);
    float _762 = _722 + _760;
    float _764 = _722;
    float _766 = _748;
    float _768 = _744;
    float _770 = _756;
    float _772 = _726;
    float _774 = _700;
    if (_580)
    {
        _764 = 1.0;
    }
    float _776 = _764;
    float _778 = _756 * _750;
    float _780 = _778 * 0.5;
    float _782 = _776;
    if (!_758)
    {
        _766 = _716;
    }
    float _784 = _766;
    float _786 = _784;
    if (!_758)
    {
        _768 = _712;
    }
    float _788 = _768;
    float _790 = _788;
    if (!_758)
    {
        _770 = _762;
    }
    float _792 = _770;
    bool _794 = !_758;
    float _796 = _792;
    if (!_794)
    {
        float _798 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _800 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _802 = _738 + _800;
        float _804 = _762 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _806 = rsqrt(_732);
        float _808 = _802 * _798;
        float _810 = _808 * 0.15915493667125701904296875;
        float _812 = _810 * 6.283185482025146484375;
        float _814 = cos(_812);
        float _816 = _810 * 6.283185482025146484375;
        float _818 = sin(_816);
        float _820 = _814 + (-1.0);
        float _822 = _820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _824 = fma(_818, _804, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _826 = fma(_762, _814, _822);
        float _828 = _806 * _824;
        float _830 = fma(_726, _828, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _832 = fma(_720, _828, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _796 = _826;
        _786 = _830;
        _790 = _832;
    }
    float _834 = _796;
    float _836 = _786;
    float _838 = _790;
    if (!_580)
    {
        float _840 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _842 = _840 * 0.15915493667125701904296875;
        float _844 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _846 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _848 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[30].w, _846);
        float _850 = _842 * 6.283185482025146484375;
        float _852 = cos(_850);
        float _854 = _844 * 0.15915493667125701904296875;
        float _856 = _842 * 6.283185482025146484375;
        float _858 = sin(_856);
        float _860 = 1.0 / _852;
        float _862 = _854 * 6.283185482025146484375;
        float _864 = cos(_862);
        float _866 = _858 * _860;
        float _868 = _854 * 6.283185482025146484375;
        float _870 = sin(_868);
        float _872 = _864 * _866;
        float _874 = 1.0 / _848;
        float _876 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _878 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _876;
        float _880 = 1.0 / _872;
        float _882 = 1.0 / _878;
        float _884 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _886 = _874 * _884;
        float _888 = _870 * _880;
        float _890 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _892 = fma(_888, _886, _890);
        float _894 = _892 * _882;
        float _896 = precise::clamp(_894, 0.0, 1.0);
        _772 = _882;
        _782 = _896;
    }
    float _898 = _772;
    float _900 = _782;
    float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _904 = _834 + _902;
    float _906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _908 = _836 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _912 = _838 + _910;
    float _914 = _904 * _904;
    float _916 = fma(_908, _908, _914);
    float _918 = fma(_912, _912, _916);
    float _920 = rsqrt(_918);
    float _922 = sqrt(_918);
    float _924 = _920 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _926 = _908 * _924;
    float _928 = _912 * _924;
    float _930 = _926 * _926;
    float _932 = _928 * _928;
    float _934 = _930 + _932;
    float _936 = sqrt(_934);
    bool _938 = _936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _942 = _936 + _940;
    float _944 = _920;
    float _946 = _934;
    float _948 = _942;
    float _950 = _898;
    float _952 = _904;
    if (_938)
    {
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _944 = _954;
    }
    float _956 = _944;
    if (_938)
    {
        float _958 = rsqrt(_934);
        _946 = _958;
    }
    float _960 = _946;
    float _962 = _960;
    if (_938)
    {
        float _964 = _942 * _956;
        _948 = _964;
    }
    float _966 = _948;
    if (_938)
    {
        float _968 = _966 * 0.15915493667125701904296875;
        _950 = _968;
    }
    float _970 = _950;
    float _972 = _912;
    if (_938)
    {
        float _974 = _970 * 6.283185482025146484375;
        float _976 = sin(_974);
        _972 = _976;
    }
    float _978 = _972;
    float _980 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _982 = precise::max(0.0, _980);
    float _984 = _956;
    float _986 = _982;
    if (_938)
    {
        float _988 = _970 * 6.283185482025146484375;
        float _990 = cos(_988);
        _984 = _990;
    }
    float _992 = _984;
    float _994 = -_924;
    float _996 = -_982;
    float _998 = fma(_904, _994, _996);
    if (_938)
    {
        float _1000 = _998 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _952 = _1000;
    }
    float _1002 = _952;
    float _1004 = _834 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1006 = _1002;
    float _1008 = _978;
    if (_938)
    {
        float _1010 = fma(_978, _1002, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1006 = _1010;
    }
    float _1012 = _1006;
    float _1014 = _1012;
    if (!_938)
    {
        _1008 = _926;
    }
    float _1016 = _1008;
    float _1018 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1004);
    float _1020 = _1016;
    float _1022 = _992;
    if (_938)
    {
        float _1024 = _992 + (-1.0);
        _986 = _1024;
    }
    float _1026 = _986;
    float _1028 = 0.0;
    float _1030 = _1026;
    if (_938)
    {
        float _1032 = _960 * _1012;
        _1028 = _1032;
    }
    float _1034 = _1028;
    if (!_938)
    {
        _1014 = _998;
    }
    float _1036 = _1014;
    float _1038 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1018);
    float _1040 = _1036;
    if (_938)
    {
        float _1042 = _1026 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _774 = _1042;
    }
    float _1044 = _774;
    if (_938)
    {
        float _1046 = _926 * _1034;
        _1020 = _1046;
    }
    float _1048 = _1020;
    if (!_938)
    {
        _1030 = _928;
    }
    float _1050 = _1030;
    float _1052 = _1050;
    if (_938)
    {
        float _1054 = _928 * _1034;
        _1052 = _1054;
    }
    float _1056 = _1052;
    if (!_938)
    {
        _962 = _930;
    }
    float _1058 = _962;
    float _1060 = _1058;
    if (_938)
    {
        float _1062 = fma(_998, _992, _1044);
        _1040 = _1062;
    }
    float _1064 = _1040;
    if (_938)
    {
        float _1066 = _1048 * _1048;
        _1060 = _1066;
    }
    float _1068 = _1060;
    if (!_938)
    {
        _1022 = _932;
    }
    float _1070 = _1022;
    float _1072 = _1070;
    if (_938)
    {
        float _1074 = _1056 * _1056;
        _1072 = _1074;
    }
    float _1076 = _1072;
    float _1078 = fma(_1064, _1064, _1068);
    float _1080 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1082 = _834 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1084 = _1078 + _1076;
    float _1086 = _834 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1090 = fma(_922, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1088);
    float _1092 = precise::clamp(_1090, 0.0, 1.0);
    float _1094 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1096 = rsqrt(_1084);
    float _1098 = _834 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1100 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1086);
    float _1102 = -_1092;
    float _1104 = _1102 + 1.0;
    float _1106 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1082);
    float _1108 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1098);
    float _1110 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1100);
    float _1112 = abs(_1104);
    float _1114 = log2(_1112);
    float _1116 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1108);
    float _1118 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1120 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1106);
    float _1122 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1124 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1126 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1128 = _1096 * _1048;
    float _1130 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1132 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1126);
    float _1134 = _1096 * _1064;
    float _1136 = _1128 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1138 = _1096 * _1056;
    float _1140 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1132);
    float _1142 = -_1122;
    float _1144 = fma(_1142, _1094, 1.0);
    float _1146 = -_1136;
    float _1148 = fma(_1134, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1146);
    float _1150 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1152 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1140);
    float _1154 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1156 = -_1138;
    float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1148);
    float _1160 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1162 = 1.0 / _1152;
    float _1164 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1154);
    float _1166 = fma(_1158, -0.5, 0.5);
    float _1168 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1160);
    float _1170 = fma(_1158, 0.5, 0.5);
    float _1172 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1164);
    float _1174 = _1134 + 1.0;
    float _1176 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1168);
    float _1178 = log2(_1144);
    float _1180 = fma(_1170, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1182 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1176);
    float _1184 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1172);
    float _1186 = fma(_1170, _1180, -0.212114393711090087890625);
    float _1188 = exp2(_1150);
    float _1190 = _1182 * _1162;
    float _1192 = _1184 * _1162;
    float _1194 = fma(_1170, _1186, 1.570728778839111328125);
    float _1196 = fma(_1192, -0.5, 0.5);
    float _1198 = sqrt(_1166);
    float _1200 = _1178 * 0.693147182464599609375;
    float _1202 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1204 = -_1134;
    float _1206 = fma(_1188, _1174, _1204);
    float _1208 = fma(_1190, 0.5, 0.5);
    float _1210 = fma(_1206, 0.5, 0.5);
    float _1212 = _1198 * 0.636619746685028076171875;
    float3 _3194 = float3(_1208, _1196, _1202);
    float _1214 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3194, float3(0.0), isnan(_3194)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3194, float3(0.0), isnan(_3194)), level(0.0)).x;
    float3 _3205 = float3(_1208, _1196, _1202);
    float4 _1217 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3205, float3(0.0), isnan(_3205)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3205, float3(0.0), isnan(_3205)), level(0.0)).xyzw;
    float _1219 = _1217.x;
    float _1221 = _1217.y;
    float _1223 = _1217.z;
    float _1225 = _1217.w;
    float _1227 = -_1194;
    float _1229 = fma(_1212, _1227, 1.0);
    float2 _3227 = float2(_1229, _1210);
    float3 _1233 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3227, float2(0.0), isnan(_3227)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3227, float2(0.0), isnan(_3227)), level(0.0)).xyz;
    float _1235 = _1233.x;
    float _1237 = _1233.y;
    float _1239 = _1233.z;
    float _1241 = in.m_57.z;
    bool _1243 = _590 != 0.0;
    bool _1245 = isnan(_590);
    bool _1247 = _1243 || _1245;
    bool _1249 = isnan(0.0);
    bool _1251 = _1247 || _1249;
    float _1253 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1255 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1257 = in.m_57.y;
    bool _1259 = _496 == 0.0;
    bool _1261 = !_1251;
    bool _1263 = _1259 && _1261;
    float _1265 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1255);
    float _1267 = in.m_57.x;
    bool _1269 = _596 == 0.0;
    bool _1271 = _1269 && _1263;
    float _1273 = exp2(_1253);
    float _1275 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1265);
    out.m_59.x = _836;
    out.m_59.y = _834;
    out.m_59.z = _838;
    float _1277 = _522 * _1241;
    float _1279 = -_1273;
    float _1281 = _1279 + 1.0;
    float _1283 = -_1277;
    float _1285 = fma(_542, _1257, _1283);
    float _1287 = _542 * _1241;
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1291 = _1285;
    if (!_1271)
    {
        float _1293 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1285);
        _1291 = _1293;
    }
    float _1295 = _1291;
    float _1297 = _1267;
    if (!_1271)
    {
        float _1299 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1267);
        _1297 = _1299;
    }
    float _1301 = _1297;
    float _1303 = fma(_522, _1257, _1287);
    float _1305 = _640 * _1295;
    float _1307 = -_1295;
    float _1309 = _634 * _1307;
    float _1311 = _1303;
    if (!_1271)
    {
        float _1313 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1303);
        _1311 = _1313;
    }
    float _1315 = _1311;
    float _1317 = _644 * _1295;
    float _1319 = fma(_650, _1301, _1305);
    float _1321 = fma(_642, _1301, _1309);
    float _1323 = in.m_61.w;
    float _1325 = fma(_660, _1301, _1317);
    float _1327 = fma(_664, _1315, _1319);
    float _1329 = fma(_646, _1315, _1321);
    float _1331 = fma(_668, _1315, _1325);
    float _1333 = _1327 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1335 = _1327 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1337 = _1327 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1339 = fma(_1329, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1333);
    float _1341 = fma(_1329, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1335);
    float _1343 = fma(_1329, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1337);
    float _1345 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1339);
    float _1347 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1341);
    float _1349 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1343);
    float _1351 = _1152 * 0.5;
    float _1353 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1275);
    float _1355 = fma(_1184, -0.5, _1351);
    float _1357 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1359 = _900 > 0.0;
    bool _1361 = isnan(_900);
    bool _1363 = _1359 || _1361;
    bool _1365 = isnan(0.0);
    bool _1367 = _1363 || _1365;
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1379 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1381 = _1353 + _1152;
    float _1383 = _1182 + _1152;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1387 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1389 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1391 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1393 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1395 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1397 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1399 = _1381 * 0.5;
    float _1401 = _1383 * 0.5;
    float _1403 = _1379 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _1387;
    out.m_63.y = _1389;
    out.m_63.z = _1391;
    out.m_63.w = _1385;
    out.m_65.x = _1393;
    out.m_65.y = _1395;
    out.m_65.z = _1397;
    out.m_67.w = _1323;
    out.m_69.x = _1345;
    out.m_69.y = _1347;
    out.m_69.z = _1349;
    out.gl_Position.x = _1182;
    out.gl_Position.y = _1184;
    out.gl_Position.z = _1353;
    out.gl_Position.w = _1152;
    out.m_71.x = _1401;
    out.m_71.y = _1355;
    out.m_71.z = _1399;
    out.m_71.w = _1152;
    out.m_45.x = _1403;
    float _1405 = _1289 * _1214;
    float _1407 = -_1289;
    float _1409 = _1407 + 1.0;
    float _1411 = _1225 * _1405;
    float _1413 = _1239 * _1405;
    float _1415 = fma(_1235, _1411, _1219);
    float _1417 = fma(_1237, _1411, _1221);
    float _1419 = _1225 * _1409;
    float _1421 = fma(_1225, _1413, _1223);
    out.m_73.x = _1415;
    out.m_73.y = _1417;
    out.m_73.z = _1421;
    out.m_73.w = _1419;
    if (_1367)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1423 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1423;
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
        float _1480 = as_type<float>(_108);
        out.gl_Position.z = _1480;
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
        float _1550 = as_type<float>(_146);
        out.gl_Position.z = _1550;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_49.z;
    float _150 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _152 = log2(_150);
    float _154 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _156 = in.m_49.x;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.y;
    float _170 = 0.0;
    float _172 = _154;
    if (!_166)
    {
        float _174 = _154 * _154;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_166)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    float _186 = _148 * 2.0;
    float _188 = _156 * 2.0;
    float _190 = floor(_186);
    float _192 = _168 * 2.0;
    float _194 = floor(_188);
    float _196 = floor(_192);
    bool _198 = _190 > 0.0;
    bool _200 = _190 >= 0.0;
    bool _202 = isnan(_190);
    bool _204 = _200 || _202;
    bool _206 = isnan(0.0);
    bool _208 = _204 || _206;
    int _210 = _208 ? 0 : 1;
    bool _212 = _194 > 0.0;
    int _214 = ~_210;
    int _216 = _214 + 1;
    int _218 = _216 + 1;
    bool _220 = _194 >= 0.0;
    bool _222 = isnan(_194);
    bool _224 = _220 || _222;
    bool _226 = isnan(0.0);
    bool _228 = _224 || _226;
    int _230 = _218;
    float _232 = _184;
    if (!_198)
    {
        int _234 = ~_210;
        int _236 = _234 + 1;
        _230 = _236;
    }
    int _238 = _230;
    bool _240 = _196 > 0.0;
    bool _242 = _196 >= 0.0;
    bool _244 = isnan(_196);
    bool _246 = _242 || _244;
    bool _248 = isnan(0.0);
    bool _250 = _246 || _248;
    bool _252 = !_166;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _264 = _154 * _256;
        float _266 = 1.0 / _260;
        float _268 = _262 * 0.693147182464599609375;
        float _270 = exp2(_264);
        float _272 = 1.0 / _268;
        float _274 = _270 + (-1.0);
        float _276 = -_274;
        float _278 = fma(_276, _272, _154);
        float _280 = _278 * _266;
        float _282 = _280 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _232 = _282;
    }
    float _284 = _232;
    bool _286 = !_166;
    if (!_286)
    {
        float _288 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _290 = log2(_288);
        float _292 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _294 = _292 + 1.0;
        float _296 = 1.0 / _294;
        float _298 = _154 * _290;
        float _300 = exp2(_298);
        float _302 = -_300;
        float _304 = _302 + 1.0;
        float _306 = _304 * _296;
        _172 = _306;
    }
    float _308 = _172;
    float _310 = _152 * _126;
    float _312 = in.m_51.z;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _316 = _314 != 0;
    int _318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _320 = _318 != 0;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _324 = _322 != 0;
    float _326 = exp2(_310);
    float _328 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    bool _330 = !_316;
    int _332 = _330 ? 0 : 1;
    float _334 = in.m_53.x;
    float _336 = in.m_53.y;
    float _338 = in.m_53.z;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _342 = 1.0 + _340;
    float _344 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[191].y, _156);
    int _346 = abs(_332);
    float _348 = _156 + _168;
    float _350 = float(_238);
    float _352 = _344 * 0.15915493667125701904296875;
    float _354 = float(_346);
    float _356 = 1.0 / _342;
    float _358 = _348 + (-1.0);
    bool _360 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _362 = isnan(1.0);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _368 = _364 || _366;
    float _370 = _354 * _350;
    float _372 = -_326;
    float _374 = _372 + 1.0;
    float _376 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _378 = _228 ? 0 : 1;
    float _380 = _352 * 6.283185482025146484375;
    float _382 = sin(_380);
    int _384 = _250 ? 0 : 1;
    float _386 = _370 * (-2.0);
    bool _388 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _390 = isnan(0.0);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _396 = _392 || _394;
    float _398 = in.m_51.y;
    int _400 = ~_384;
    int _402 = _400 + 1;
    int _404 = _402 + 1;
    int _406 = _404;
    if (!_240)
    {
        int _408 = ~_384;
        int _410 = _408 + 1;
        _406 = _410;
    }
    int _412 = _406;
    float _414 = fma(_386, _334, _334);
    bool _416 = !_320;
    int _418 = _416 ? 0 : 1;
    float _420 = in.m_55.w;
    float _422 = _396 ? _374 : 0.0;
    int _424 = abs(_418);
    int _426 = ~_378;
    int _428 = _426 + 1;
    int _430 = _428 + 1;
    float _432 = _382 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _434 = _430;
    if (!_212)
    {
        int _436 = ~_378;
        int _438 = _436 + 1;
        _434 = _438;
    }
    int _440 = _434;
    if (_368)
    {
        float _442 = _422 * _356;
        _128 = _442;
    }
    float _444 = _128;
    float _446 = _168 + _148;
    float _448 = _432 * 0.01745329238474369049072265625;
    bool _450 = !_324;
    int _452 = _450 ? 0 : 1;
    float _454 = fma(_376, _386, _376);
    float _456 = float(_440);
    float _458 = _448 * 0.15915493667125701904296875;
    float _460 = _156 + (-0.5);
    float _462 = _446 + (-1.0);
    float _464 = float(_424);
    float _466 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[196].x, _414);
    int _468 = abs(_452);
    float _470 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _472 = float(_412);
    float _474 = _464 * _456;
    float _476 = float(_468);
    float _478 = _156 + _148;
    float _480 = in.m_55.x;
    float _482 = in.m_55.y;
    float _484 = in.m_55.z;
    float _486 = _474 * (-2.0);
    float _488 = _476 * _472;
    float _490 = _168 + (-0.5);
    float _492 = _478 + (-1.0);
    float _494 = fma(_486, _336, _336);
    float _496 = in.m_51.x;
    float _498 = _488 * (-2.0);
    float _500 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _502 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[196].y, _494);
    float _504 = fma(_470, _486, _470);
    float _506 = in.m_47.x;
    float _508 = in.m_47.y;
    float _510 = in.m_47.z;
    float _512 = fma(_498, _338, _338);
    float _514 = _148 + (-0.5);
    float _516 = fma(_504, _444, _502);
    float _518 = fma(_454, _444, _466);
    float _520 = _458 * 6.283185482025146484375;
    float _522 = sin(_520);
    float _524 = in.m_42.x;
    float _526 = in.m_42.y;
    float _528 = in.m_42.z;
    float _530 = _516 * 0.15915493667125701904296875;
    float _532 = fma(_500, _498, _500);
    float _534 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[196].z, _512);
    float _536 = _518 * 0.15915493667125701904296875;
    float _538 = _480 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _540 = _458 * 6.283185482025146484375;
    float _542 = cos(_540);
    float _544 = fma(_532, _444, _534);
    float _546 = _484 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _548 = _538 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _550 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _552 = _544 * 0.15915493667125701904296875;
    float _554 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _556 = _284 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _558 = _536 * 6.283185482025146484375;
    float _560 = sin(_558);
    float _562 = _522 * _312;
    float _564 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _566 = fma(_308, _506, _550);
    float _568 = fma(_308, _508, _554);
    float _570 = fma(_308, _510, _556);
    bool _572 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _574 = isnan(0.5);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _580 = _576 || _578;
    float _582 = _536 * 6.283185482025146484375;
    float _584 = cos(_582);
    float _586 = _542 * _312;
    float _588 = -_562;
    float _590 = fma(_542, _398, _588);
    float _592 = fma(_570, _420, _528);
    float _594 = fma(_566, _420, _524);
    float _596 = fma(_522, _398, _586);
    float _598 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _590);
    float _600 = fma(_568, _420, _526);
    float _602 = _530 * 6.283185482025146484375;
    float _604 = sin(_602);
    float _606 = _482 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _608 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _496);
    float _610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _596);
    float _612 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _614 = _608 * _548;
    float _616 = _610 * _564;
    float _618 = _530 * 6.283185482025146484375;
    float _620 = cos(_618);
    float _622 = _598 * _612;
    float _624 = _552 * 6.283185482025146484375;
    float _626 = cos(_624);
    float _628 = _560 * _604;
    float _630 = _584 * _604;
    float _632 = _552 * 6.283185482025146484375;
    float _634 = sin(_632);
    float _636 = _584 * _620;
    float _638 = _560 * _620;
    float _640 = _584 * _626;
    float _642 = _620 * _626;
    float _644 = _560 * _626;
    float _646 = _604 * _626;
    float _648 = _640 * _622;
    float _650 = fma(_634, _636, _628);
    float _652 = -_622;
    float _654 = _634 * _652;
    float _656 = _644 * _622;
    float _658 = -_630;
    float _660 = fma(_634, _638, _658);
    float _662 = -_638;
    float _664 = fma(_634, _630, _662);
    float _666 = fma(_650, _614, _648);
    float _668 = fma(_634, _628, _636);
    float _670 = fma(_642, _614, _654);
    float _672 = fma(_660, _614, _656);
    float _674 = _600 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _676 = fma(_664, _616, _666);
    float _678 = fma(_646, _616, _670);
    float _680 = fma(_668, _616, _672);
    float _682 = _600 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _684 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[6].x, _674);
    float _686 = _676 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _688 = _600 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _690 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[4].x, _682);
    float _692 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[6].z, _684);
    float _694 = _676 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _696 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[10].x, _686);
    float _698 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[4].z, _690);
    float _700 = _692 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _702 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[8].x, _694);
    float _704 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[10].z, _696);
    float _706 = _698 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _708 = fma(_594, (*spvDescriptorSet0.vp_c10)._m0[5].x, _688);
    float _710 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[8].z, _702);
    float _712 = _700 + _704;
    float _714 = fma(_592, (*spvDescriptorSet0.vp_c10)._m0[5].z, _708);
    float _716 = _706 + _710;
    float _718 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _720 = _712 + _718;
    float _722 = _714 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _724 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _726 = _716 + _724;
    float _728 = _720 * _720;
    float _730 = _722 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _732 = fma(_726, _726, _728);
    float _734 = _722 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _736 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[11].x, _730);
    float _738 = sqrt(_732);
    float _740 = fma(_706, (*spvDescriptorSet0.vp_c8)._m0[10].x, _734);
    float _742 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[11].z, _736);
    float _744 = _742 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _746 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[10].z, _740);
    float _748 = _676 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _750 = 1.0 / _744;
    float _752 = _746 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _754 = fma(_678, (*spvDescriptorSet0.vp_c10)._m0[9].x, _748);
    float _756 = _752 + _744;
    bool _758 = _738 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _760 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[9].z, _754);
    float _762 = _722 + _760;
    float _764 = _722;
    float _766 = _748;
    float _768 = _744;
    float _770 = _756;
    float _772 = _726;
    float _774 = _700;
    if (_580)
    {
        _764 = 1.0;
    }
    float _776 = _764;
    float _778 = _756 * _750;
    float _780 = _778 * 0.5;
    float _782 = _776;
    if (!_758)
    {
        _766 = _716;
    }
    float _784 = _766;
    float _786 = _784;
    if (!_758)
    {
        _768 = _712;
    }
    float _788 = _768;
    float _790 = _788;
    if (!_758)
    {
        _770 = _762;
    }
    float _792 = _770;
    bool _794 = !_758;
    float _796 = _792;
    if (!_794)
    {
        float _798 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _800 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _802 = _738 + _800;
        float _804 = _762 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _806 = rsqrt(_732);
        float _808 = _802 * _798;
        float _810 = _808 * 0.15915493667125701904296875;
        float _812 = _810 * 6.283185482025146484375;
        float _814 = cos(_812);
        float _816 = _810 * 6.283185482025146484375;
        float _818 = sin(_816);
        float _820 = _814 + (-1.0);
        float _822 = _820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _824 = fma(_818, _804, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _826 = fma(_762, _814, _822);
        float _828 = _806 * _824;
        float _830 = fma(_726, _828, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _832 = fma(_720, _828, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _796 = _826;
        _786 = _830;
        _790 = _832;
    }
    float _834 = _796;
    float _836 = _786;
    float _838 = _790;
    if (!_580)
    {
        float _840 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _842 = _840 * 0.15915493667125701904296875;
        float _844 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _846 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _848 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[30].w, _846);
        float _850 = _842 * 6.283185482025146484375;
        float _852 = cos(_850);
        float _854 = _844 * 0.15915493667125701904296875;
        float _856 = _842 * 6.283185482025146484375;
        float _858 = sin(_856);
        float _860 = 1.0 / _852;
        float _862 = _854 * 6.283185482025146484375;
        float _864 = cos(_862);
        float _866 = _858 * _860;
        float _868 = _854 * 6.283185482025146484375;
        float _870 = sin(_868);
        float _872 = _864 * _866;
        float _874 = 1.0 / _848;
        float _876 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _878 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _876;
        float _880 = 1.0 / _872;
        float _882 = 1.0 / _878;
        float _884 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _886 = _874 * _884;
        float _888 = _870 * _880;
        float _890 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _892 = fma(_888, _886, _890);
        float _894 = _892 * _882;
        float _896 = precise::clamp(_894, 0.0, 1.0);
        _772 = _882;
        _782 = _896;
    }
    float _898 = _772;
    float _900 = _782;
    float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _904 = _834 + _902;
    float _906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _908 = _836 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _912 = _838 + _910;
    float _914 = _904 * _904;
    float _916 = fma(_908, _908, _914);
    float _918 = fma(_912, _912, _916);
    float _920 = rsqrt(_918);
    float _922 = sqrt(_918);
    float _924 = _920 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _926 = _908 * _924;
    float _928 = _912 * _924;
    float _930 = _926 * _926;
    float _932 = _928 * _928;
    float _934 = _930 + _932;
    float _936 = sqrt(_934);
    bool _938 = _936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _942 = _936 + _940;
    float _944 = _920;
    float _946 = _934;
    float _948 = _942;
    float _950 = _898;
    float _952 = _904;
    if (_938)
    {
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _944 = _954;
    }
    float _956 = _944;
    if (_938)
    {
        float _958 = rsqrt(_934);
        _946 = _958;
    }
    float _960 = _946;
    float _962 = _960;
    if (_938)
    {
        float _964 = _942 * _956;
        _948 = _964;
    }
    float _966 = _948;
    if (_938)
    {
        float _968 = _966 * 0.15915493667125701904296875;
        _950 = _968;
    }
    float _970 = _950;
    float _972 = _912;
    if (_938)
    {
        float _974 = _970 * 6.283185482025146484375;
        float _976 = sin(_974);
        _972 = _976;
    }
    float _978 = _972;
    float _980 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _982 = precise::max(0.0, _980);
    float _984 = _956;
    float _986 = _982;
    if (_938)
    {
        float _988 = _970 * 6.283185482025146484375;
        float _990 = cos(_988);
        _984 = _990;
    }
    float _992 = _984;
    float _994 = -_924;
    float _996 = -_982;
    float _998 = fma(_904, _994, _996);
    if (_938)
    {
        float _1000 = _998 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _952 = _1000;
    }
    float _1002 = _952;
    float _1004 = _834 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1006 = _1002;
    float _1008 = _978;
    if (_938)
    {
        float _1010 = fma(_978, _1002, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1006 = _1010;
    }
    float _1012 = _1006;
    float _1014 = _1012;
    if (!_938)
    {
        _1008 = _926;
    }
    float _1016 = _1008;
    float _1018 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1004);
    float _1020 = _1016;
    float _1022 = _992;
    if (_938)
    {
        float _1024 = _992 + (-1.0);
        _986 = _1024;
    }
    float _1026 = _986;
    float _1028 = 0.0;
    float _1030 = _1026;
    if (_938)
    {
        float _1032 = _960 * _1012;
        _1028 = _1032;
    }
    float _1034 = _1028;
    if (!_938)
    {
        _1014 = _998;
    }
    float _1036 = _1014;
    float _1038 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1018);
    float _1040 = _1036;
    if (_938)
    {
        float _1042 = _1026 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _774 = _1042;
    }
    float _1044 = _774;
    if (_938)
    {
        float _1046 = _926 * _1034;
        _1020 = _1046;
    }
    float _1048 = _1020;
    if (!_938)
    {
        _1030 = _928;
    }
    float _1050 = _1030;
    float _1052 = _1050;
    if (_938)
    {
        float _1054 = _928 * _1034;
        _1052 = _1054;
    }
    float _1056 = _1052;
    if (!_938)
    {
        _962 = _930;
    }
    float _1058 = _962;
    float _1060 = _1058;
    if (_938)
    {
        float _1062 = fma(_998, _992, _1044);
        _1040 = _1062;
    }
    float _1064 = _1040;
    if (_938)
    {
        float _1066 = _1048 * _1048;
        _1060 = _1066;
    }
    float _1068 = _1060;
    if (!_938)
    {
        _1022 = _932;
    }
    float _1070 = _1022;
    float _1072 = _1070;
    if (_938)
    {
        float _1074 = _1056 * _1056;
        _1072 = _1074;
    }
    float _1076 = _1072;
    float _1078 = fma(_1064, _1064, _1068);
    float _1080 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1082 = _834 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1084 = _1078 + _1076;
    float _1086 = _834 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1090 = fma(_922, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1088);
    float _1092 = precise::clamp(_1090, 0.0, 1.0);
    float _1094 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1096 = rsqrt(_1084);
    float _1098 = _834 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1100 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1086);
    float _1102 = -_1092;
    float _1104 = _1102 + 1.0;
    float _1106 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1082);
    float _1108 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1098);
    float _1110 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1100);
    float _1112 = abs(_1104);
    float _1114 = log2(_1112);
    float _1116 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1108);
    float _1118 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1120 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1106);
    float _1122 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1124 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1126 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1128 = _1096 * _1048;
    float _1130 = _1120 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1132 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1126);
    float _1134 = _1096 * _1064;
    float _1136 = _1128 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1138 = _1096 * _1056;
    float _1140 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1132);
    float _1142 = -_1122;
    float _1144 = fma(_1142, _1094, 1.0);
    float _1146 = -_1136;
    float _1148 = fma(_1134, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1146);
    float _1150 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1152 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1140);
    float _1154 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1156 = -_1138;
    float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1148);
    float _1160 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1162 = 1.0 / _1152;
    float _1164 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1154);
    float _1166 = fma(_1158, -0.5, 0.5);
    float _1168 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1160);
    float _1170 = fma(_1158, 0.5, 0.5);
    float _1172 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1164);
    float _1174 = _1134 + 1.0;
    float _1176 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1168);
    float _1178 = log2(_1144);
    float _1180 = fma(_1170, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1182 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1176);
    float _1184 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1172);
    float _1186 = fma(_1170, _1180, -0.212114393711090087890625);
    float _1188 = exp2(_1150);
    float _1190 = _1182 * _1162;
    float _1192 = _1184 * _1162;
    float _1194 = fma(_1170, _1186, 1.570728778839111328125);
    float _1196 = fma(_1192, -0.5, 0.5);
    float _1198 = sqrt(_1166);
    float _1200 = _1178 * 0.693147182464599609375;
    float _1202 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1204 = -_1134;
    float _1206 = fma(_1188, _1174, _1204);
    float _1208 = fma(_1190, 0.5, 0.5);
    float _1210 = fma(_1206, 0.5, 0.5);
    float _1212 = _1198 * 0.636619746685028076171875;
    float3 _3194 = float3(_1208, _1196, _1202);
    float _1214 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3194, float3(0.0), isnan(_3194)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3194, float3(0.0), isnan(_3194)), level(0.0)).x;
    float3 _3205 = float3(_1208, _1196, _1202);
    float4 _1217 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3205, float3(0.0), isnan(_3205)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3205, float3(0.0), isnan(_3205)), level(0.0)).xyzw;
    float _1219 = _1217.x;
    float _1221 = _1217.y;
    float _1223 = _1217.z;
    float _1225 = _1217.w;
    float _1227 = -_1194;
    float _1229 = fma(_1212, _1227, 1.0);
    float2 _3227 = float2(_1229, _1210);
    float3 _1233 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3227, float2(0.0), isnan(_3227)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3227, float2(0.0), isnan(_3227)), level(0.0)).xyz;
    float _1235 = _1233.x;
    float _1237 = _1233.y;
    float _1239 = _1233.z;
    float _1241 = in.m_57.z;
    bool _1243 = _590 != 0.0;
    bool _1245 = isnan(_590);
    bool _1247 = _1243 || _1245;
    bool _1249 = isnan(0.0);
    bool _1251 = _1247 || _1249;
    float _1253 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1255 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1257 = in.m_57.y;
    bool _1259 = _496 == 0.0;
    bool _1261 = !_1251;
    bool _1263 = _1259 && _1261;
    float _1265 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1255);
    float _1267 = in.m_57.x;
    bool _1269 = _596 == 0.0;
    bool _1271 = _1269 && _1263;
    float _1273 = exp2(_1253);
    float _1275 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1265);
    out.m_59.x = _836;
    out.m_59.y = _834;
    out.m_59.z = _838;
    float _1277 = _522 * _1241;
    float _1279 = -_1273;
    float _1281 = _1279 + 1.0;
    float _1283 = -_1277;
    float _1285 = fma(_542, _1257, _1283);
    float _1287 = _542 * _1241;
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1291 = _1285;
    if (!_1271)
    {
        float _1293 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1285);
        _1291 = _1293;
    }
    float _1295 = _1291;
    float _1297 = _1267;
    if (!_1271)
    {
        float _1299 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1267);
        _1297 = _1299;
    }
    float _1301 = _1297;
    float _1303 = fma(_522, _1257, _1287);
    float _1305 = _640 * _1295;
    float _1307 = -_1295;
    float _1309 = _634 * _1307;
    float _1311 = _1303;
    if (!_1271)
    {
        float _1313 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1303);
        _1311 = _1313;
    }
    float _1315 = _1311;
    float _1317 = _644 * _1295;
    float _1319 = fma(_650, _1301, _1305);
    float _1321 = fma(_642, _1301, _1309);
    float _1323 = in.m_61.w;
    float _1325 = fma(_660, _1301, _1317);
    float _1327 = fma(_664, _1315, _1319);
    float _1329 = fma(_646, _1315, _1321);
    float _1331 = fma(_668, _1315, _1325);
    float _1333 = _1327 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1335 = _1327 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1337 = _1327 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1339 = fma(_1329, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1333);
    float _1341 = fma(_1329, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1335);
    float _1343 = fma(_1329, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1337);
    float _1345 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1339);
    float _1347 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1341);
    float _1349 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1343);
    float _1351 = _1152 * 0.5;
    float _1353 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1275);
    float _1355 = fma(_1184, -0.5, _1351);
    float _1357 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1359 = _900 > 0.0;
    bool _1361 = isnan(_900);
    bool _1363 = _1359 || _1361;
    bool _1365 = isnan(0.0);
    bool _1367 = _1363 || _1365;
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1379 = _900 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1381 = _1353 + _1152;
    float _1383 = _1182 + _1152;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1387 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1389 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1391 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1393 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1395 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1397 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1399 = _1381 * 0.5;
    float _1401 = _1383 * 0.5;
    float _1403 = _1379 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.x = _1387;
    out.m_63.y = _1389;
    out.m_63.z = _1391;
    out.m_63.w = _1385;
    out.m_65.x = _1393;
    out.m_65.y = _1395;
    out.m_65.z = _1397;
    out.m_67.w = _1323;
    out.m_69.x = _1345;
    out.m_69.y = _1347;
    out.m_69.z = _1349;
    out.gl_Position.x = _1182;
    out.gl_Position.y = _1184;
    out.gl_Position.z = _1353;
    out.gl_Position.w = _1152;
    out.m_71.x = _1401;
    out.m_71.y = _1355;
    out.m_71.z = _1399;
    out.m_71.w = _1152;
    out.m_45.x = _1403;
    float _1405 = _1289 * _1214;
    float _1407 = -_1289;
    float _1409 = _1407 + 1.0;
    float _1411 = _1225 * _1405;
    float _1413 = _1239 * _1405;
    float _1415 = fma(_1235, _1411, _1219);
    float _1417 = fma(_1237, _1411, _1221);
    float _1419 = _1225 * _1409;
    float _1421 = fma(_1225, _1413, _1223);
    out.m_73.x = _1415;
    out.m_73.y = _1417;
    out.m_73.z = _1421;
    out.m_73.w = _1419;
    if (_1367)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1423 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1423;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

