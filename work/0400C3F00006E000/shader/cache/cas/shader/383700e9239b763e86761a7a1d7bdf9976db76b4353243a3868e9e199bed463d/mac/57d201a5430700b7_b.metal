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
    float4 m_51 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_57 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
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
        float _1504 = as_type<float>(_108);
        out.gl_Position.z = _1504;
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
        float _1574 = as_type<float>(_146);
        out.gl_Position.z = _1574;
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
    float _170 = _156 * _126;
    float _172 = 0.0;
    float _174 = _158;
    if (!_168)
    {
        float _176 = _158 * _158;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = exp2(_170);
    float _184 = _180;
    if (!_168)
    {
        float _186 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    float _190 = _152 * 2.0;
    float _192 = _148 * 2.0;
    float _194 = _150 + _152;
    float _196 = _150 + _148;
    float _198 = _150 * 2.0;
    float _200 = floor(_192);
    float _202 = _194 + (-1.0);
    float _204 = _196 + (-1.0);
    float _206 = _148 + _152;
    float _208 = _148 + (-0.5);
    float _210 = _150 + (-0.5);
    float _212 = _152 + (-0.5);
    float _214 = floor(_190);
    float _216 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _218 = floor(_198);
    bool _220 = _214 > 0.0;
    float _222 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _224 = _214 >= 0.0;
    bool _226 = isnan(_214);
    bool _228 = _224 || _226;
    bool _230 = isnan(0.0);
    bool _232 = _228 || _230;
    bool _234 = !_168;
    float _236 = _188;
    if (!_234)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = _158 * _240;
        float _250 = 1.0 / _244;
        float _252 = _246 * 0.693147182464599609375;
        float _254 = exp2(_248);
        float _256 = 1.0 / _252;
        float _258 = _254 + (-1.0);
        float _260 = -_258;
        float _262 = fma(_260, _256, _158);
        float _264 = _262 * _250;
        float _266 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _266;
    }
    float _268 = _236;
    bool _270 = !_168;
    if (!_270)
    {
        float _272 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _274 = log2(_272);
        float _276 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _278 = _276 + 1.0;
        float _280 = 1.0 / _278;
        float _282 = _158 * _274;
        float _284 = exp2(_282);
        float _286 = -_284;
        float _288 = _286 + 1.0;
        float _290 = _288 * _280;
        _174 = _290;
    }
    float _292 = _174;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _300 = _298 != 0;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _304 = _302 != 0;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _308 = 1.0 + _306;
    bool _310 = _200 > 0.0;
    float _312 = -_182;
    float _314 = _312 + 1.0;
    bool _316 = _200 >= 0.0;
    bool _318 = isnan(_200);
    bool _320 = _316 || _318;
    bool _322 = isnan(0.0);
    bool _324 = _320 || _322;
    float _326 = 1.0 / _308;
    float _328 = in.m_51.x;
    float _330 = in.m_51.y;
    float _332 = in.m_51.z;
    int _334 = _232 ? 0 : 1;
    float _336 = _206 + (-1.0);
    bool _338 = !_296;
    int _340 = _338 ? 0 : 1;
    float _342 = in.m_53.w;
    int _344 = ~_334;
    int _346 = _344 + 1;
    int _348 = _346 + 1;
    int _350 = abs(_340);
    int _352 = _348;
    if (!_220)
    {
        int _354 = ~_334;
        int _356 = _354 + 1;
        _352 = _356;
    }
    int _358 = _352;
    float _360 = float(_350);
    float _362 = float(_358);
    bool _364 = !_300;
    int _366 = _364 ? 0 : 1;
    bool _368 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _370 = isnan(1.0);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _376 = _372 || _374;
    float _378 = _360 * _362;
    int _380 = _324 ? 0 : 1;
    int _382 = abs(_366);
    float _384 = _378 * (-2.0);
    bool _386 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _388 = isnan(0.0);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _394 = _390 || _392;
    bool _396 = _218 > 0.0;
    float _398 = fma(_222, _384, _222);
    int _400 = ~_380;
    int _402 = _400 + 1;
    int _404 = _402 + 1;
    int _406 = _404;
    if (!_310)
    {
        int _408 = ~_380;
        int _410 = _408 + 1;
        _406 = _410;
    }
    int _412 = _406;
    float _414 = fma(_384, _328, _328);
    float _416 = _394 ? _314 : 0.0;
    float _418 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[196].x, _414);
    bool _420 = _218 >= 0.0;
    bool _422 = isnan(_218);
    bool _424 = _420 || _422;
    bool _426 = isnan(0.0);
    bool _428 = _424 || _426;
    float _430 = float(_412);
    if (_376)
    {
        float _432 = _416 * _326;
        _128 = _432;
    }
    float _434 = _128;
    float _436 = float(_382);
    int _438 = _428 ? 0 : 1;
    float _440 = fma(_398, _434, _418);
    bool _442 = !_304;
    int _444 = _442 ? 0 : 1;
    float _446 = _436 * _430;
    int _448 = ~_438;
    int _450 = _448 + 1;
    int _452 = _450 + 1;
    float _454 = in.m_53.x;
    float _456 = in.m_53.y;
    float _458 = in.m_53.z;
    int _460 = _452;
    if (!_396)
    {
        int _462 = ~_438;
        int _464 = _462 + 1;
        _460 = _464;
    }
    int _466 = _460;
    float _468 = _446 * (-2.0);
    int _470 = abs(_444);
    float _472 = _440 * 0.15915493667125701904296875;
    float _474 = in.m_55.x;
    float _476 = in.m_55.y;
    float _478 = in.m_55.z;
    float _480 = float(_466);
    float _482 = fma(_468, _330, _330);
    float _484 = fma(_216, _468, _216);
    float _486 = float(_470);
    float _488 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[196].y, _482);
    float _490 = _472 * 6.283185482025146484375;
    float _492 = cos(_490);
    float _494 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _496 = _486 * _480;
    float _498 = fma(_484, _434, _488);
    float _500 = in.m_47.x;
    float _502 = in.m_47.y;
    float _504 = in.m_47.z;
    float _506 = _496 * (-2.0);
    float _508 = _498 * 0.15915493667125701904296875;
    float _510 = in.m_42.x;
    float _512 = in.m_42.y;
    float _514 = in.m_42.z;
    float _516 = _472 * 6.283185482025146484375;
    float _518 = sin(_516);
    float _520 = fma(_494, _506, _494);
    float _522 = fma(_506, _332, _332);
    float _524 = _454 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _526 = _456 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _528 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _530 = isnan(0.5);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _536 = _532 || _534;
    float _538 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[196].z, _522);
    float _540 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _474);
    float _542 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _544 = _458 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _546 = fma(_520, _434, _538);
    float _548 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _550 = _540 * _542;
    float _552 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _554 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _556 = _546 * 0.15915493667125701904296875;
    float _558 = _508 * 6.283185482025146484375;
    float _560 = sin(_558);
    float _562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _476);
    float _564 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _566 = fma(_292, _504, _552);
    float _568 = fma(_292, _502, _554);
    float _570 = fma(_292, _500, _548);
    float _572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _478);
    float _574 = fma(_566, _342, _514);
    float _576 = _508 * 6.283185482025146484375;
    float _578 = cos(_576);
    float _580 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _582 = fma(_568, _342, _512);
    float _584 = fma(_570, _342, _510);
    float _586 = _562 * _564;
    float _588 = _572 * _580;
    float _590 = _582 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _592 = _582 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _594 = _556 * 6.283185482025146484375;
    float _596 = cos(_594);
    float _598 = _582 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _600 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[4].x, _590);
    float _602 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[5].x, _592);
    float _604 = _492 * _560;
    float _606 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[6].x, _598);
    float _608 = _518 * _560;
    float _610 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[5].z, _602);
    float _612 = _556 * 6.283185482025146484375;
    float _614 = sin(_612);
    float _616 = _492 * _578;
    float _618 = _518 * _578;
    float _620 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[4].z, _600);
    float _622 = _610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _624 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[6].z, _606);
    float _626 = _620 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _628 = _492 * _596;
    float _630 = _578 * _596;
    float _632 = _518 * _596;
    float _634 = _560 * _596;
    float _636 = _628 * _586;
    float _638 = 0.0;
    if (_536)
    {
        _638 = 1.0;
    }
    float _640 = _638;
    float _642 = _632 * _586;
    float _644 = fma(_614, _616, _608);
    float _646 = -_604;
    float _648 = fma(_614, _618, _646);
    float _650 = -_618;
    float _652 = fma(_614, _604, _650);
    float _654 = -_586;
    float _656 = _614 * _654;
    float _658 = fma(_644, _550, _636);
    float _660 = fma(_614, _608, _616);
    float _662 = fma(_648, _550, _642);
    float _664 = fma(_630, _550, _656);
    float _666 = fma(_652, _588, _658);
    float _668 = _622 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _670 = fma(_660, _588, _662);
    float _672 = fma(_634, _588, _664);
    float _674 = _666 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _676 = _666 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _678 = _624 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _680 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[11].x, _668);
    float _682 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[10].x, _674);
    float _684 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[8].x, _676);
    float _686 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[11].z, _680);
    float _688 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[10].z, _682);
    float _690 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[8].z, _684);
    float _692 = _686 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _694 = _678 + _688;
    float _696 = _626 + _690;
    float _698 = _622 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _700 = 1.0 / _692;
    float _702 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _704 = _694 + _702;
    float _706 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _708 = _696 + _706;
    float _710 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[10].x, _698);
    float _712 = _704 * _704;
    float _714 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[10].z, _710);
    float _716 = fma(_708, _708, _712);
    float _718 = _714 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _720 = sqrt(_716);
    float _722 = _718 + _692;
    float _724 = _722 * _700;
    float _726 = _724 * 0.5;
    float _728 = _666 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _732 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[30].w, _730);
    float _734 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[9].x, _728);
    float _736 = 1.0 / _732;
    float _738 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[9].z, _734);
    bool _740 = _720 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _742 = _622 + _738;
    float _744 = _726;
    float _746 = _692;
    float _748 = _738;
    float _750 = _720;
    float _752 = _672;
    float _754 = _640;
    if (!_740)
    {
        _744 = _696;
    }
    float _756 = _744;
    float _758 = _756;
    if (!_740)
    {
        _746 = _694;
    }
    float _760 = _746;
    float _762 = _760;
    if (!_740)
    {
        _748 = _742;
    }
    float _764 = _748;
    bool _766 = !_740;
    float _768 = _764;
    if (!_766)
    {
        float _770 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _772 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _774 = _720 + _772;
        float _776 = rsqrt(_716);
        float _778 = _774 * _770;
        float _780 = _742 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _782 = _778 * 0.15915493667125701904296875;
        float _784 = _782 * 6.283185482025146484375;
        float _786 = cos(_784);
        float _788 = _782 * 6.283185482025146484375;
        float _790 = sin(_788);
        float _792 = _786 + (-1.0);
        float _794 = _792 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _796 = fma(_790, _780, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _798 = fma(_742, _786, _794);
        float _800 = _776 * _796;
        float _802 = fma(_708, _800, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _804 = fma(_704, _800, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _768 = _798;
        _758 = _802;
        _762 = _804;
        _750 = _796;
    }
    float _806 = _768;
    float _808 = _758;
    float _810 = _762;
    float _812 = _750;
    float _814 = _812;
    if (_536)
    {
        _814 = 1.0;
    }
    float _816 = _814;
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _820 = _736 * _818;
    float _822 = _816;
    if (!_536)
    {
        float _824 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _826 = _824 * 0.15915493667125701904296875;
        float _828 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _830 = _826 * 6.283185482025146484375;
        float _832 = cos(_830);
        float _834 = _828 * 0.15915493667125701904296875;
        float _836 = _826 * 6.283185482025146484375;
        float _838 = sin(_836);
        float _840 = 1.0 / _832;
        float _842 = _834 * 6.283185482025146484375;
        float _844 = cos(_842);
        float _846 = _838 * _840;
        float _848 = _834 * 6.283185482025146484375;
        float _850 = sin(_848);
        float _852 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _854 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _852;
        float _856 = _844 * _846;
        float _858 = 1.0 / _854;
        float _860 = 1.0 / _856;
        float _862 = _850 * _860;
        float _864 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _866 = fma(_820, _862, _864);
        float _868 = _866 * _858;
        float _870 = precise::clamp(_868, 0.0, 1.0);
        _752 = _846;
        _754 = _870;
    }
    float _872 = _752;
    float _874 = _754;
    float _876 = _872;
    if (!_536)
    {
        float _878 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _880 = _878 * 0.15915493667125701904296875;
        float _882 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _884 = _880 * 6.283185482025146484375;
        float _886 = cos(_884);
        float _888 = _882 * 0.15915493667125701904296875;
        float _890 = _880 * 6.283185482025146484375;
        float _892 = sin(_890);
        float _894 = 1.0 / _886;
        float _896 = _888 * 6.283185482025146484375;
        float _898 = cos(_896);
        float _900 = _892 * _894;
        float _902 = _888 * 6.283185482025146484375;
        float _904 = sin(_902);
        float _906 = _898 * _900;
        float _908 = 1.0 / _906;
        float _910 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _912 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _910;
        float _914 = 1.0 / _912;
        float _916 = _904 * _908;
        float _918 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _920 = fma(_820, _916, _918);
        float _922 = _920 * _914;
        float _924 = precise::clamp(_922, 0.0, 1.0);
        float _926 = -_924;
        float _928 = _926 + 1.0;
        _822 = _928;
    }
    float _930 = _822;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _934 = _806 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _938 = _808 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _942 = _810 + _940;
    float _944 = _934 * _934;
    float _946 = fma(_938, _938, _944);
    float _948 = fma(_942, _942, _946);
    float _950 = rsqrt(_948);
    float _952 = sqrt(_948);
    float _954 = _950 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _956 = _938 * _954;
    float _958 = _942 * _954;
    float _960 = _956 * _956;
    float _962 = _958 * _958;
    float _964 = _960 + _962;
    float _966 = sqrt(_964);
    bool _968 = _966 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _972 = _966 + _970;
    float _974 = _942;
    float _976 = _964;
    float _978 = _972;
    float _980 = _954;
    if (_968)
    {
        float _982 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _974 = _982;
    }
    float _984 = _974;
    if (_968)
    {
        float _986 = rsqrt(_964);
        _976 = _986;
    }
    float _988 = _976;
    float _990 = _988;
    if (_968)
    {
        float _992 = _972 * _984;
        _978 = _992;
    }
    float _994 = _978;
    if (_968)
    {
        float _996 = _994 * 0.15915493667125701904296875;
        _876 = _996;
    }
    float _998 = _876;
    float _1000 = _984;
    float _1002 = _998;
    if (_968)
    {
        float _1004 = _998 * 6.283185482025146484375;
        float _1006 = sin(_1004);
        _1000 = _1006;
    }
    float _1008 = _1000;
    float _1010 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1012 = precise::max(0.0, _1010);
    float _1014 = _944;
    float _1016 = _1012;
    if (_968)
    {
        float _1018 = _998 * 6.283185482025146484375;
        float _1020 = cos(_1018);
        _1014 = _1020;
    }
    float _1022 = _1014;
    float _1024 = -_954;
    float _1026 = -_1012;
    float _1028 = fma(_934, _1024, _1026);
    float _1030 = _1028;
    if (_968)
    {
        float _1032 = _1028 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1016 = _1032;
    }
    float _1034 = _1016;
    float _1036 = _1008;
    float _1038 = _1034;
    if (_968)
    {
        float _1040 = fma(_1008, _1034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1036 = _1040;
    }
    float _1042 = _1036;
    float _1044 = _1042;
    float _1046 = _1022;
    if (_968)
    {
        float _1048 = _1022 + (-1.0);
        _1038 = _1048;
    }
    float _1050 = _1038;
    float _1052 = _1050;
    if (_968)
    {
        float _1054 = _988 * _1042;
        _980 = _1054;
    }
    float _1056 = _980;
    if (!_968)
    {
        _1044 = _956;
    }
    float _1058 = _1044;
    float _1060 = _1058;
    if (_968)
    {
        float _1062 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1002 = _1062;
    }
    float _1064 = _1002;
    if (_968)
    {
        float _1066 = _956 * _1056;
        _1060 = _1066;
    }
    float _1068 = _1060;
    if (!_968)
    {
        _1052 = _958;
    }
    float _1070 = _1052;
    float _1072 = _1070;
    if (_968)
    {
        float _1074 = _958 * _1056;
        _1072 = _1074;
    }
    float _1076 = _1072;
    if (!_968)
    {
        _990 = _960;
    }
    float _1078 = _990;
    float _1080 = _1078;
    if (_968)
    {
        float _1082 = fma(_1028, _1022, _1064);
        _1030 = _1082;
    }
    float _1084 = _1030;
    if (_968)
    {
        float _1086 = _1068 * _1068;
        _1080 = _1086;
    }
    float _1088 = _1080;
    if (!_968)
    {
        _1046 = _962;
    }
    float _1090 = _1046;
    float _1092 = _1090;
    if (_968)
    {
        float _1094 = _1076 * _1076;
        _1092 = _1094;
    }
    float _1096 = _1092;
    float _1098 = fma(_1084, _1084, _1088);
    float _1100 = _806 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1102 = _1098 + _1096;
    float _1104 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1106 = fma(_952, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1104);
    float _1108 = precise::clamp(_1106, 0.0, 1.0);
    float _1110 = _806 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1112 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1100);
    float _1114 = rsqrt(_1102);
    float _1116 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1118 = -_1108;
    float _1120 = _1118 + 1.0;
    float _1122 = _806 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1124 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1110);
    float _1126 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1112);
    float _1128 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1122);
    float _1130 = abs(_1120);
    float _1132 = log2(_1130);
    float _1134 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1124);
    float _1136 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1138 = _806 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1140 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1128);
    float _1142 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1144 = _1136 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1146 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1138);
    float _1148 = _1114 * _1068;
    float _1150 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1152 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1154 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1146);
    float _1156 = _1114 * _1084;
    float _1158 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1160 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1152);
    float _1162 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1164 = _1114 * _1076;
    float _1166 = -_1158;
    float _1168 = fma(_1156, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1166);
    float _1170 = -_1144;
    float _1172 = fma(_1170, _1116, 1.0);
    float _1174 = _1132 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1176 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1160);
    float _1178 = -_1164;
    float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1168);
    float _1182 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1184 = exp2(_1174);
    float _1186 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1176);
    float _1188 = fma(_1180, -0.5, 0.5);
    float _1190 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1192 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1182);
    float _1194 = fma(_1180, 0.5, 0.5);
    float _1196 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1190);
    float _1198 = log2(_1172);
    float _1200 = _1156 + 1.0;
    float _1202 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1192);
    float _1204 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1196);
    float _1206 = fma(_1194, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1208 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1202);
    float _1210 = 1.0 / _1186;
    float _1212 = -_1156;
    float _1214 = fma(_1184, _1200, _1212);
    float _1216 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1204);
    float _1218 = fma(_1194, _1206, -0.212114393711090087890625);
    float _1220 = fma(_1194, _1218, 1.570728778839111328125);
    float _1222 = sqrt(_1188);
    float _1224 = _1198 * 0.693147182464599609375;
    float _1226 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1228 = _1208 * _1210;
    float _1230 = _1216 * _1210;
    float _1232 = fma(_1230, 0.5, 0.5);
    float _1234 = _1222 * 0.636619746685028076171875;
    float _1236 = fma(_1228, -0.5, 0.5);
    float _1238 = fma(_1214, 0.5, 0.5);
    float _1240 = -_1220;
    float _1242 = fma(_1234, _1240, 1.0);
    float3 _3246 = float3(_1232, _1236, _1226);
    float _1244 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3246, float3(0.0), isnan(_3246)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3246, float3(0.0), isnan(_3246)), level(0.0)).x;
    float3 _3257 = float3(_1232, _1236, _1226);
    float4 _1247 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3257, float3(0.0), isnan(_3257)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3257, float3(0.0), isnan(_3257)), level(0.0)).xyzw;
    float _1249 = _1247.x;
    float _1251 = _1247.y;
    float _1253 = _1247.z;
    float _1255 = _1247.w;
    float2 _3274 = float2(_1242, _1238);
    float3 _1259 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3274, float2(0.0), isnan(_3274)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3274, float2(0.0), isnan(_3274)), level(0.0)).xyz;
    float _1261 = _1259.x;
    float _1263 = _1259.y;
    float _1265 = _1259.z;
    float _1267 = in.m_57.x;
    float _1269 = in.m_57.y;
    float _1271 = in.m_57.z;
    bool _1273 = _476 != 0.0;
    bool _1275 = isnan(_476);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan(0.0);
    bool _1281 = _1277 || _1279;
    float _1283 = _1132 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1285 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1287 = _474 == 0.0;
    bool _1289 = !_1281;
    bool _1291 = _1287 && _1289;
    out.m_59.x = _808;
    out.m_59.y = _806;
    out.m_59.z = _810;
    float _1293 = exp2(_1283);
    bool _1295 = _478 == 0.0;
    bool _1297 = _1295 && _1291;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1303 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1285);
    float _1305 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1309 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1311 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1303);
    float _1313 = _1269;
    float _1315 = _1267;
    float _1317 = _1271;
    if (!_1297)
    {
        float _1319 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1269);
        _1313 = _1319;
    }
    float _1321 = _1313;
    if (!_1297)
    {
        float _1323 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1267);
        _1315 = _1323;
    }
    float _1325 = _1315;
    if (!_1297)
    {
        float _1327 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1271);
        _1317 = _1327;
    }
    float _1329 = _1317;
    float _1331 = _628 * _1321;
    float _1333 = -_1321;
    float _1335 = _614 * _1333;
    float _1337 = _632 * _1321;
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1341 = fma(_644, _1325, _1331);
    float _1343 = fma(_630, _1325, _1335);
    float _1345 = fma(_648, _1325, _1337);
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1349 = fma(_652, _1329, _1341);
    float _1351 = fma(_634, _1329, _1343);
    float _1353 = in.m_61.w;
    float _1355 = _1349 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1357 = -_1293;
    float _1359 = _1357 + 1.0;
    out.m_63.x = _1347;
    out.m_63.y = _1305;
    out.m_63.z = _1309;
    out.m_63.w = _1307;
    float _1361 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1355);
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1369 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1371 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1373 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1375 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1377 = _874 > 0.0;
    bool _1379 = isnan(_874);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan(0.0);
    bool _1385 = _1381 || _1383;
    float _1387 = fma(_660, _1329, _1345);
    out.m_65.x = _1373;
    out.m_65.y = _1371;
    out.m_65.z = _1375;
    float _1389 = _1349 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1391 = _1349 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1393 = _930 <= 0.0;
    bool _1395 = !_1385;
    bool _1397 = _1393 || _1395;
    float _1399 = _1216 + _1186;
    float _1401 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1389);
    float _1403 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1391);
    float _1405 = _874 * _930;
    float _1407 = _1186 * 0.5;
    float _1409 = fma(_1387, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1361);
    float _1411 = fma(_1387, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1401);
    float _1413 = _1405 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1415 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1311);
    float _1417 = fma(_1387, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1403);
    float _1419 = _1413 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1421 = _1415 + _1186;
    float _1423 = _1399 * 0.5;
    float _1425 = fma(_1208, -0.5, _1407);
    out.m_67.w = _1353;
    float _1427 = _1421 * 0.5;
    out.m_45.x = _1419;
    out.m_69.x = _1409;
    out.m_69.y = _1411;
    out.m_69.z = _1417;
    out.gl_Position.x = _1216;
    out.gl_Position.y = _1208;
    out.gl_Position.z = _1415;
    out.gl_Position.w = _1186;
    out.m_71.x = _1423;
    out.m_71.y = _1425;
    out.m_71.z = _1427;
    out.m_71.w = _1186;
    float _1429 = _1369 * _1244;
    float _1431 = -_1369;
    float _1433 = _1431 + 1.0;
    float _1435 = _1255 * _1429;
    float _1437 = _1265 * _1429;
    float _1439 = _1255 * _1433;
    float _1441 = fma(_1261, _1435, _1249);
    float _1443 = fma(_1263, _1435, _1251);
    float _1445 = fma(_1255, _1437, _1253);
    out.m_73.x = _1441;
    out.m_73.y = _1443;
    out.m_73.z = _1445;
    out.m_73.w = _1439;
    if (!_1397)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1447 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1447;
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
        float _1504 = as_type<float>(_108);
        out.gl_Position.z = _1504;
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
        float _1574 = as_type<float>(_146);
        out.gl_Position.z = _1574;
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
    float _170 = _156 * _126;
    float _172 = 0.0;
    float _174 = _158;
    if (!_168)
    {
        float _176 = _158 * _158;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = exp2(_170);
    float _184 = _180;
    if (!_168)
    {
        float _186 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    float _190 = _152 * 2.0;
    float _192 = _148 * 2.0;
    float _194 = _150 + _152;
    float _196 = _150 + _148;
    float _198 = _150 * 2.0;
    float _200 = floor(_192);
    float _202 = _194 + (-1.0);
    float _204 = _196 + (-1.0);
    float _206 = _148 + _152;
    float _208 = _148 + (-0.5);
    float _210 = _150 + (-0.5);
    float _212 = _152 + (-0.5);
    float _214 = floor(_190);
    float _216 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _218 = floor(_198);
    bool _220 = _214 > 0.0;
    float _222 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _224 = _214 >= 0.0;
    bool _226 = isnan(_214);
    bool _228 = _224 || _226;
    bool _230 = isnan(0.0);
    bool _232 = _228 || _230;
    bool _234 = !_168;
    float _236 = _188;
    if (!_234)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = _158 * _240;
        float _250 = 1.0 / _244;
        float _252 = _246 * 0.693147182464599609375;
        float _254 = exp2(_248);
        float _256 = 1.0 / _252;
        float _258 = _254 + (-1.0);
        float _260 = -_258;
        float _262 = fma(_260, _256, _158);
        float _264 = _262 * _250;
        float _266 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _266;
    }
    float _268 = _236;
    bool _270 = !_168;
    if (!_270)
    {
        float _272 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _274 = log2(_272);
        float _276 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _278 = _276 + 1.0;
        float _280 = 1.0 / _278;
        float _282 = _158 * _274;
        float _284 = exp2(_282);
        float _286 = -_284;
        float _288 = _286 + 1.0;
        float _290 = _288 * _280;
        _174 = _290;
    }
    float _292 = _174;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _300 = _298 != 0;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _304 = _302 != 0;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _308 = 1.0 + _306;
    bool _310 = _200 > 0.0;
    float _312 = -_182;
    float _314 = _312 + 1.0;
    bool _316 = _200 >= 0.0;
    bool _318 = isnan(_200);
    bool _320 = _316 || _318;
    bool _322 = isnan(0.0);
    bool _324 = _320 || _322;
    float _326 = 1.0 / _308;
    float _328 = in.m_51.x;
    float _330 = in.m_51.y;
    float _332 = in.m_51.z;
    int _334 = _232 ? 0 : 1;
    float _336 = _206 + (-1.0);
    bool _338 = !_296;
    int _340 = _338 ? 0 : 1;
    float _342 = in.m_53.w;
    int _344 = ~_334;
    int _346 = _344 + 1;
    int _348 = _346 + 1;
    int _350 = abs(_340);
    int _352 = _348;
    if (!_220)
    {
        int _354 = ~_334;
        int _356 = _354 + 1;
        _352 = _356;
    }
    int _358 = _352;
    float _360 = float(_350);
    float _362 = float(_358);
    bool _364 = !_300;
    int _366 = _364 ? 0 : 1;
    bool _368 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _370 = isnan(1.0);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _376 = _372 || _374;
    float _378 = _360 * _362;
    int _380 = _324 ? 0 : 1;
    int _382 = abs(_366);
    float _384 = _378 * (-2.0);
    bool _386 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _388 = isnan(0.0);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _394 = _390 || _392;
    bool _396 = _218 > 0.0;
    float _398 = fma(_222, _384, _222);
    int _400 = ~_380;
    int _402 = _400 + 1;
    int _404 = _402 + 1;
    int _406 = _404;
    if (!_310)
    {
        int _408 = ~_380;
        int _410 = _408 + 1;
        _406 = _410;
    }
    int _412 = _406;
    float _414 = fma(_384, _328, _328);
    float _416 = _394 ? _314 : 0.0;
    float _418 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[196].x, _414);
    bool _420 = _218 >= 0.0;
    bool _422 = isnan(_218);
    bool _424 = _420 || _422;
    bool _426 = isnan(0.0);
    bool _428 = _424 || _426;
    float _430 = float(_412);
    if (_376)
    {
        float _432 = _416 * _326;
        _128 = _432;
    }
    float _434 = _128;
    float _436 = float(_382);
    int _438 = _428 ? 0 : 1;
    float _440 = fma(_398, _434, _418);
    bool _442 = !_304;
    int _444 = _442 ? 0 : 1;
    float _446 = _436 * _430;
    int _448 = ~_438;
    int _450 = _448 + 1;
    int _452 = _450 + 1;
    float _454 = in.m_53.x;
    float _456 = in.m_53.y;
    float _458 = in.m_53.z;
    int _460 = _452;
    if (!_396)
    {
        int _462 = ~_438;
        int _464 = _462 + 1;
        _460 = _464;
    }
    int _466 = _460;
    float _468 = _446 * (-2.0);
    int _470 = abs(_444);
    float _472 = _440 * 0.15915493667125701904296875;
    float _474 = in.m_55.x;
    float _476 = in.m_55.y;
    float _478 = in.m_55.z;
    float _480 = float(_466);
    float _482 = fma(_468, _330, _330);
    float _484 = fma(_216, _468, _216);
    float _486 = float(_470);
    float _488 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[196].y, _482);
    float _490 = _472 * 6.283185482025146484375;
    float _492 = cos(_490);
    float _494 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _496 = _486 * _480;
    float _498 = fma(_484, _434, _488);
    float _500 = in.m_47.x;
    float _502 = in.m_47.y;
    float _504 = in.m_47.z;
    float _506 = _496 * (-2.0);
    float _508 = _498 * 0.15915493667125701904296875;
    float _510 = in.m_42.x;
    float _512 = in.m_42.y;
    float _514 = in.m_42.z;
    float _516 = _472 * 6.283185482025146484375;
    float _518 = sin(_516);
    float _520 = fma(_494, _506, _494);
    float _522 = fma(_506, _332, _332);
    float _524 = _454 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _526 = _456 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _528 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _530 = isnan(0.5);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _536 = _532 || _534;
    float _538 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[196].z, _522);
    float _540 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _474);
    float _542 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _544 = _458 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _546 = fma(_520, _434, _538);
    float _548 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _550 = _540 * _542;
    float _552 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _554 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _556 = _546 * 0.15915493667125701904296875;
    float _558 = _508 * 6.283185482025146484375;
    float _560 = sin(_558);
    float _562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _476);
    float _564 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _566 = fma(_292, _504, _552);
    float _568 = fma(_292, _502, _554);
    float _570 = fma(_292, _500, _548);
    float _572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _478);
    float _574 = fma(_566, _342, _514);
    float _576 = _508 * 6.283185482025146484375;
    float _578 = cos(_576);
    float _580 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _582 = fma(_568, _342, _512);
    float _584 = fma(_570, _342, _510);
    float _586 = _562 * _564;
    float _588 = _572 * _580;
    float _590 = _582 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _592 = _582 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _594 = _556 * 6.283185482025146484375;
    float _596 = cos(_594);
    float _598 = _582 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _600 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[4].x, _590);
    float _602 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[5].x, _592);
    float _604 = _492 * _560;
    float _606 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[6].x, _598);
    float _608 = _518 * _560;
    float _610 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[5].z, _602);
    float _612 = _556 * 6.283185482025146484375;
    float _614 = sin(_612);
    float _616 = _492 * _578;
    float _618 = _518 * _578;
    float _620 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[4].z, _600);
    float _622 = _610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _624 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[6].z, _606);
    float _626 = _620 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _628 = _492 * _596;
    float _630 = _578 * _596;
    float _632 = _518 * _596;
    float _634 = _560 * _596;
    float _636 = _628 * _586;
    float _638 = 0.0;
    if (_536)
    {
        _638 = 1.0;
    }
    float _640 = _638;
    float _642 = _632 * _586;
    float _644 = fma(_614, _616, _608);
    float _646 = -_604;
    float _648 = fma(_614, _618, _646);
    float _650 = -_618;
    float _652 = fma(_614, _604, _650);
    float _654 = -_586;
    float _656 = _614 * _654;
    float _658 = fma(_644, _550, _636);
    float _660 = fma(_614, _608, _616);
    float _662 = fma(_648, _550, _642);
    float _664 = fma(_630, _550, _656);
    float _666 = fma(_652, _588, _658);
    float _668 = _622 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _670 = fma(_660, _588, _662);
    float _672 = fma(_634, _588, _664);
    float _674 = _666 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _676 = _666 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _678 = _624 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _680 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[11].x, _668);
    float _682 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[10].x, _674);
    float _684 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[8].x, _676);
    float _686 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[11].z, _680);
    float _688 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[10].z, _682);
    float _690 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[8].z, _684);
    float _692 = _686 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _694 = _678 + _688;
    float _696 = _626 + _690;
    float _698 = _622 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _700 = 1.0 / _692;
    float _702 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _704 = _694 + _702;
    float _706 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _708 = _696 + _706;
    float _710 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[10].x, _698);
    float _712 = _704 * _704;
    float _714 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[10].z, _710);
    float _716 = fma(_708, _708, _712);
    float _718 = _714 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _720 = sqrt(_716);
    float _722 = _718 + _692;
    float _724 = _722 * _700;
    float _726 = _724 * 0.5;
    float _728 = _666 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _732 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[30].w, _730);
    float _734 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[9].x, _728);
    float _736 = 1.0 / _732;
    float _738 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[9].z, _734);
    bool _740 = _720 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _742 = _622 + _738;
    float _744 = _726;
    float _746 = _692;
    float _748 = _738;
    float _750 = _720;
    float _752 = _672;
    float _754 = _640;
    if (!_740)
    {
        _744 = _696;
    }
    float _756 = _744;
    float _758 = _756;
    if (!_740)
    {
        _746 = _694;
    }
    float _760 = _746;
    float _762 = _760;
    if (!_740)
    {
        _748 = _742;
    }
    float _764 = _748;
    bool _766 = !_740;
    float _768 = _764;
    if (!_766)
    {
        float _770 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _772 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _774 = _720 + _772;
        float _776 = rsqrt(_716);
        float _778 = _774 * _770;
        float _780 = _742 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _782 = _778 * 0.15915493667125701904296875;
        float _784 = _782 * 6.283185482025146484375;
        float _786 = cos(_784);
        float _788 = _782 * 6.283185482025146484375;
        float _790 = sin(_788);
        float _792 = _786 + (-1.0);
        float _794 = _792 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _796 = fma(_790, _780, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _798 = fma(_742, _786, _794);
        float _800 = _776 * _796;
        float _802 = fma(_708, _800, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _804 = fma(_704, _800, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _768 = _798;
        _758 = _802;
        _762 = _804;
        _750 = _796;
    }
    float _806 = _768;
    float _808 = _758;
    float _810 = _762;
    float _812 = _750;
    float _814 = _812;
    if (_536)
    {
        _814 = 1.0;
    }
    float _816 = _814;
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _820 = _736 * _818;
    float _822 = _816;
    if (!_536)
    {
        float _824 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _826 = _824 * 0.15915493667125701904296875;
        float _828 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _830 = _826 * 6.283185482025146484375;
        float _832 = cos(_830);
        float _834 = _828 * 0.15915493667125701904296875;
        float _836 = _826 * 6.283185482025146484375;
        float _838 = sin(_836);
        float _840 = 1.0 / _832;
        float _842 = _834 * 6.283185482025146484375;
        float _844 = cos(_842);
        float _846 = _838 * _840;
        float _848 = _834 * 6.283185482025146484375;
        float _850 = sin(_848);
        float _852 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _854 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _852;
        float _856 = _844 * _846;
        float _858 = 1.0 / _854;
        float _860 = 1.0 / _856;
        float _862 = _850 * _860;
        float _864 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _866 = fma(_820, _862, _864);
        float _868 = _866 * _858;
        float _870 = precise::clamp(_868, 0.0, 1.0);
        _752 = _846;
        _754 = _870;
    }
    float _872 = _752;
    float _874 = _754;
    float _876 = _872;
    if (!_536)
    {
        float _878 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _880 = _878 * 0.15915493667125701904296875;
        float _882 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _884 = _880 * 6.283185482025146484375;
        float _886 = cos(_884);
        float _888 = _882 * 0.15915493667125701904296875;
        float _890 = _880 * 6.283185482025146484375;
        float _892 = sin(_890);
        float _894 = 1.0 / _886;
        float _896 = _888 * 6.283185482025146484375;
        float _898 = cos(_896);
        float _900 = _892 * _894;
        float _902 = _888 * 6.283185482025146484375;
        float _904 = sin(_902);
        float _906 = _898 * _900;
        float _908 = 1.0 / _906;
        float _910 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _912 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _910;
        float _914 = 1.0 / _912;
        float _916 = _904 * _908;
        float _918 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _920 = fma(_820, _916, _918);
        float _922 = _920 * _914;
        float _924 = precise::clamp(_922, 0.0, 1.0);
        float _926 = -_924;
        float _928 = _926 + 1.0;
        _822 = _928;
    }
    float _930 = _822;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _934 = _806 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _938 = _808 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _942 = _810 + _940;
    float _944 = _934 * _934;
    float _946 = fma(_938, _938, _944);
    float _948 = fma(_942, _942, _946);
    float _950 = rsqrt(_948);
    float _952 = sqrt(_948);
    float _954 = _950 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _956 = _938 * _954;
    float _958 = _942 * _954;
    float _960 = _956 * _956;
    float _962 = _958 * _958;
    float _964 = _960 + _962;
    float _966 = sqrt(_964);
    bool _968 = _966 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _972 = _966 + _970;
    float _974 = _942;
    float _976 = _964;
    float _978 = _972;
    float _980 = _954;
    if (_968)
    {
        float _982 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _974 = _982;
    }
    float _984 = _974;
    if (_968)
    {
        float _986 = rsqrt(_964);
        _976 = _986;
    }
    float _988 = _976;
    float _990 = _988;
    if (_968)
    {
        float _992 = _972 * _984;
        _978 = _992;
    }
    float _994 = _978;
    if (_968)
    {
        float _996 = _994 * 0.15915493667125701904296875;
        _876 = _996;
    }
    float _998 = _876;
    float _1000 = _984;
    float _1002 = _998;
    if (_968)
    {
        float _1004 = _998 * 6.283185482025146484375;
        float _1006 = sin(_1004);
        _1000 = _1006;
    }
    float _1008 = _1000;
    float _1010 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1012 = precise::max(0.0, _1010);
    float _1014 = _944;
    float _1016 = _1012;
    if (_968)
    {
        float _1018 = _998 * 6.283185482025146484375;
        float _1020 = cos(_1018);
        _1014 = _1020;
    }
    float _1022 = _1014;
    float _1024 = -_954;
    float _1026 = -_1012;
    float _1028 = fma(_934, _1024, _1026);
    float _1030 = _1028;
    if (_968)
    {
        float _1032 = _1028 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1016 = _1032;
    }
    float _1034 = _1016;
    float _1036 = _1008;
    float _1038 = _1034;
    if (_968)
    {
        float _1040 = fma(_1008, _1034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1036 = _1040;
    }
    float _1042 = _1036;
    float _1044 = _1042;
    float _1046 = _1022;
    if (_968)
    {
        float _1048 = _1022 + (-1.0);
        _1038 = _1048;
    }
    float _1050 = _1038;
    float _1052 = _1050;
    if (_968)
    {
        float _1054 = _988 * _1042;
        _980 = _1054;
    }
    float _1056 = _980;
    if (!_968)
    {
        _1044 = _956;
    }
    float _1058 = _1044;
    float _1060 = _1058;
    if (_968)
    {
        float _1062 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1002 = _1062;
    }
    float _1064 = _1002;
    if (_968)
    {
        float _1066 = _956 * _1056;
        _1060 = _1066;
    }
    float _1068 = _1060;
    if (!_968)
    {
        _1052 = _958;
    }
    float _1070 = _1052;
    float _1072 = _1070;
    if (_968)
    {
        float _1074 = _958 * _1056;
        _1072 = _1074;
    }
    float _1076 = _1072;
    if (!_968)
    {
        _990 = _960;
    }
    float _1078 = _990;
    float _1080 = _1078;
    if (_968)
    {
        float _1082 = fma(_1028, _1022, _1064);
        _1030 = _1082;
    }
    float _1084 = _1030;
    if (_968)
    {
        float _1086 = _1068 * _1068;
        _1080 = _1086;
    }
    float _1088 = _1080;
    if (!_968)
    {
        _1046 = _962;
    }
    float _1090 = _1046;
    float _1092 = _1090;
    if (_968)
    {
        float _1094 = _1076 * _1076;
        _1092 = _1094;
    }
    float _1096 = _1092;
    float _1098 = fma(_1084, _1084, _1088);
    float _1100 = _806 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1102 = _1098 + _1096;
    float _1104 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1106 = fma(_952, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1104);
    float _1108 = precise::clamp(_1106, 0.0, 1.0);
    float _1110 = _806 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1112 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1100);
    float _1114 = rsqrt(_1102);
    float _1116 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1118 = -_1108;
    float _1120 = _1118 + 1.0;
    float _1122 = _806 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1124 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1110);
    float _1126 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1112);
    float _1128 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1122);
    float _1130 = abs(_1120);
    float _1132 = log2(_1130);
    float _1134 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1124);
    float _1136 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1138 = _806 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1140 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1128);
    float _1142 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1144 = _1136 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1146 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1138);
    float _1148 = _1114 * _1068;
    float _1150 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1152 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1154 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1146);
    float _1156 = _1114 * _1084;
    float _1158 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1160 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1152);
    float _1162 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1164 = _1114 * _1076;
    float _1166 = -_1158;
    float _1168 = fma(_1156, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1166);
    float _1170 = -_1144;
    float _1172 = fma(_1170, _1116, 1.0);
    float _1174 = _1132 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1176 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1160);
    float _1178 = -_1164;
    float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1168);
    float _1182 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1184 = exp2(_1174);
    float _1186 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1176);
    float _1188 = fma(_1180, -0.5, 0.5);
    float _1190 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1192 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1182);
    float _1194 = fma(_1180, 0.5, 0.5);
    float _1196 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1190);
    float _1198 = log2(_1172);
    float _1200 = _1156 + 1.0;
    float _1202 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1192);
    float _1204 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1196);
    float _1206 = fma(_1194, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1208 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1202);
    float _1210 = 1.0 / _1186;
    float _1212 = -_1156;
    float _1214 = fma(_1184, _1200, _1212);
    float _1216 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1204);
    float _1218 = fma(_1194, _1206, -0.212114393711090087890625);
    float _1220 = fma(_1194, _1218, 1.570728778839111328125);
    float _1222 = sqrt(_1188);
    float _1224 = _1198 * 0.693147182464599609375;
    float _1226 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1228 = _1208 * _1210;
    float _1230 = _1216 * _1210;
    float _1232 = fma(_1230, 0.5, 0.5);
    float _1234 = _1222 * 0.636619746685028076171875;
    float _1236 = fma(_1228, -0.5, 0.5);
    float _1238 = fma(_1214, 0.5, 0.5);
    float _1240 = -_1220;
    float _1242 = fma(_1234, _1240, 1.0);
    float3 _3246 = float3(_1232, _1236, _1226);
    float _1244 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3246, float3(0.0), isnan(_3246)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3246, float3(0.0), isnan(_3246)), level(0.0)).x;
    float3 _3257 = float3(_1232, _1236, _1226);
    float4 _1247 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3257, float3(0.0), isnan(_3257)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3257, float3(0.0), isnan(_3257)), level(0.0)).xyzw;
    float _1249 = _1247.x;
    float _1251 = _1247.y;
    float _1253 = _1247.z;
    float _1255 = _1247.w;
    float2 _3274 = float2(_1242, _1238);
    float3 _1259 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3274, float2(0.0), isnan(_3274)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3274, float2(0.0), isnan(_3274)), level(0.0)).xyz;
    float _1261 = _1259.x;
    float _1263 = _1259.y;
    float _1265 = _1259.z;
    float _1267 = in.m_57.x;
    float _1269 = in.m_57.y;
    float _1271 = in.m_57.z;
    bool _1273 = _476 != 0.0;
    bool _1275 = isnan(_476);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan(0.0);
    bool _1281 = _1277 || _1279;
    float _1283 = _1132 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1285 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1287 = _474 == 0.0;
    bool _1289 = !_1281;
    bool _1291 = _1287 && _1289;
    out.m_59.x = _808;
    out.m_59.y = _806;
    out.m_59.z = _810;
    float _1293 = exp2(_1283);
    bool _1295 = _478 == 0.0;
    bool _1297 = _1295 && _1291;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1303 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1285);
    float _1305 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1309 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1311 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1303);
    float _1313 = _1269;
    float _1315 = _1267;
    float _1317 = _1271;
    if (!_1297)
    {
        float _1319 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1269);
        _1313 = _1319;
    }
    float _1321 = _1313;
    if (!_1297)
    {
        float _1323 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1267);
        _1315 = _1323;
    }
    float _1325 = _1315;
    if (!_1297)
    {
        float _1327 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1271);
        _1317 = _1327;
    }
    float _1329 = _1317;
    float _1331 = _628 * _1321;
    float _1333 = -_1321;
    float _1335 = _614 * _1333;
    float _1337 = _632 * _1321;
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1341 = fma(_644, _1325, _1331);
    float _1343 = fma(_630, _1325, _1335);
    float _1345 = fma(_648, _1325, _1337);
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1349 = fma(_652, _1329, _1341);
    float _1351 = fma(_634, _1329, _1343);
    float _1353 = in.m_61.w;
    float _1355 = _1349 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1357 = -_1293;
    float _1359 = _1357 + 1.0;
    out.m_63.x = _1347;
    out.m_63.y = _1305;
    out.m_63.z = _1309;
    out.m_63.w = _1307;
    float _1361 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1355);
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1369 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1371 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1373 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1375 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1377 = _874 > 0.0;
    bool _1379 = isnan(_874);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan(0.0);
    bool _1385 = _1381 || _1383;
    float _1387 = fma(_660, _1329, _1345);
    out.m_65.x = _1373;
    out.m_65.y = _1371;
    out.m_65.z = _1375;
    float _1389 = _1349 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1391 = _1349 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1393 = _930 <= 0.0;
    bool _1395 = !_1385;
    bool _1397 = _1393 || _1395;
    float _1399 = _1216 + _1186;
    float _1401 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1389);
    float _1403 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1391);
    float _1405 = _874 * _930;
    float _1407 = _1186 * 0.5;
    float _1409 = fma(_1387, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1361);
    float _1411 = fma(_1387, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1401);
    float _1413 = _1405 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1415 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1311);
    float _1417 = fma(_1387, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1403);
    float _1419 = _1413 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1421 = _1415 + _1186;
    float _1423 = _1399 * 0.5;
    float _1425 = fma(_1208, -0.5, _1407);
    out.m_67.w = _1353;
    float _1427 = _1421 * 0.5;
    out.m_45.x = _1419;
    out.m_69.x = _1409;
    out.m_69.y = _1411;
    out.m_69.z = _1417;
    out.gl_Position.x = _1216;
    out.gl_Position.y = _1208;
    out.gl_Position.z = _1415;
    out.gl_Position.w = _1186;
    out.m_71.x = _1423;
    out.m_71.y = _1425;
    out.m_71.z = _1427;
    out.m_71.w = _1186;
    float _1429 = _1369 * _1244;
    float _1431 = -_1369;
    float _1433 = _1431 + 1.0;
    float _1435 = _1255 * _1429;
    float _1437 = _1265 * _1429;
    float _1439 = _1255 * _1433;
    float _1441 = fma(_1261, _1435, _1249);
    float _1443 = fma(_1263, _1435, _1251);
    float _1445 = fma(_1255, _1437, _1253);
    out.m_73.x = _1441;
    out.m_73.y = _1443;
    out.m_73.z = _1445;
    out.m_73.w = _1439;
    if (!_1397)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1447 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1447;
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
        float _1504 = as_type<float>(_108);
        out.gl_Position.z = _1504;
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
        float _1574 = as_type<float>(_146);
        out.gl_Position.z = _1574;
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
    float _170 = _156 * _126;
    float _172 = 0.0;
    float _174 = _158;
    if (!_168)
    {
        float _176 = _158 * _158;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = exp2(_170);
    float _184 = _180;
    if (!_168)
    {
        float _186 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    float _190 = _152 * 2.0;
    float _192 = _148 * 2.0;
    float _194 = _150 + _152;
    float _196 = _150 + _148;
    float _198 = _150 * 2.0;
    float _200 = floor(_192);
    float _202 = _194 + (-1.0);
    float _204 = _196 + (-1.0);
    float _206 = _148 + _152;
    float _208 = _148 + (-0.5);
    float _210 = _150 + (-0.5);
    float _212 = _152 + (-0.5);
    float _214 = floor(_190);
    float _216 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _218 = floor(_198);
    bool _220 = _214 > 0.0;
    float _222 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _224 = _214 >= 0.0;
    bool _226 = isnan(_214);
    bool _228 = _224 || _226;
    bool _230 = isnan(0.0);
    bool _232 = _228 || _230;
    bool _234 = !_168;
    float _236 = _188;
    if (!_234)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = _158 * _240;
        float _250 = 1.0 / _244;
        float _252 = _246 * 0.693147182464599609375;
        float _254 = exp2(_248);
        float _256 = 1.0 / _252;
        float _258 = _254 + (-1.0);
        float _260 = -_258;
        float _262 = fma(_260, _256, _158);
        float _264 = _262 * _250;
        float _266 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _266;
    }
    float _268 = _236;
    bool _270 = !_168;
    if (!_270)
    {
        float _272 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _274 = log2(_272);
        float _276 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _278 = _276 + 1.0;
        float _280 = 1.0 / _278;
        float _282 = _158 * _274;
        float _284 = exp2(_282);
        float _286 = -_284;
        float _288 = _286 + 1.0;
        float _290 = _288 * _280;
        _174 = _290;
    }
    float _292 = _174;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _300 = _298 != 0;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _304 = _302 != 0;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _308 = 1.0 + _306;
    bool _310 = _200 > 0.0;
    float _312 = -_182;
    float _314 = _312 + 1.0;
    bool _316 = _200 >= 0.0;
    bool _318 = isnan(_200);
    bool _320 = _316 || _318;
    bool _322 = isnan(0.0);
    bool _324 = _320 || _322;
    float _326 = 1.0 / _308;
    float _328 = in.m_51.x;
    float _330 = in.m_51.y;
    float _332 = in.m_51.z;
    int _334 = _232 ? 0 : 1;
    float _336 = _206 + (-1.0);
    bool _338 = !_296;
    int _340 = _338 ? 0 : 1;
    float _342 = in.m_53.w;
    int _344 = ~_334;
    int _346 = _344 + 1;
    int _348 = _346 + 1;
    int _350 = abs(_340);
    int _352 = _348;
    if (!_220)
    {
        int _354 = ~_334;
        int _356 = _354 + 1;
        _352 = _356;
    }
    int _358 = _352;
    float _360 = float(_350);
    float _362 = float(_358);
    bool _364 = !_300;
    int _366 = _364 ? 0 : 1;
    bool _368 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _370 = isnan(1.0);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _376 = _372 || _374;
    float _378 = _360 * _362;
    int _380 = _324 ? 0 : 1;
    int _382 = abs(_366);
    float _384 = _378 * (-2.0);
    bool _386 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _388 = isnan(0.0);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _394 = _390 || _392;
    bool _396 = _218 > 0.0;
    float _398 = fma(_222, _384, _222);
    int _400 = ~_380;
    int _402 = _400 + 1;
    int _404 = _402 + 1;
    int _406 = _404;
    if (!_310)
    {
        int _408 = ~_380;
        int _410 = _408 + 1;
        _406 = _410;
    }
    int _412 = _406;
    float _414 = fma(_384, _328, _328);
    float _416 = _394 ? _314 : 0.0;
    float _418 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[196].x, _414);
    bool _420 = _218 >= 0.0;
    bool _422 = isnan(_218);
    bool _424 = _420 || _422;
    bool _426 = isnan(0.0);
    bool _428 = _424 || _426;
    float _430 = float(_412);
    if (_376)
    {
        float _432 = _416 * _326;
        _128 = _432;
    }
    float _434 = _128;
    float _436 = float(_382);
    int _438 = _428 ? 0 : 1;
    float _440 = fma(_398, _434, _418);
    bool _442 = !_304;
    int _444 = _442 ? 0 : 1;
    float _446 = _436 * _430;
    int _448 = ~_438;
    int _450 = _448 + 1;
    int _452 = _450 + 1;
    float _454 = in.m_53.x;
    float _456 = in.m_53.y;
    float _458 = in.m_53.z;
    int _460 = _452;
    if (!_396)
    {
        int _462 = ~_438;
        int _464 = _462 + 1;
        _460 = _464;
    }
    int _466 = _460;
    float _468 = _446 * (-2.0);
    int _470 = abs(_444);
    float _472 = _440 * 0.15915493667125701904296875;
    float _474 = in.m_55.x;
    float _476 = in.m_55.y;
    float _478 = in.m_55.z;
    float _480 = float(_466);
    float _482 = fma(_468, _330, _330);
    float _484 = fma(_216, _468, _216);
    float _486 = float(_470);
    float _488 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[196].y, _482);
    float _490 = _472 * 6.283185482025146484375;
    float _492 = cos(_490);
    float _494 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _496 = _486 * _480;
    float _498 = fma(_484, _434, _488);
    float _500 = in.m_47.x;
    float _502 = in.m_47.y;
    float _504 = in.m_47.z;
    float _506 = _496 * (-2.0);
    float _508 = _498 * 0.15915493667125701904296875;
    float _510 = in.m_42.x;
    float _512 = in.m_42.y;
    float _514 = in.m_42.z;
    float _516 = _472 * 6.283185482025146484375;
    float _518 = sin(_516);
    float _520 = fma(_494, _506, _494);
    float _522 = fma(_506, _332, _332);
    float _524 = _454 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _526 = _456 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _528 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _530 = isnan(0.5);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _536 = _532 || _534;
    float _538 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[196].z, _522);
    float _540 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _474);
    float _542 = _524 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _544 = _458 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _546 = fma(_520, _434, _538);
    float _548 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _550 = _540 * _542;
    float _552 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _554 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _556 = _546 * 0.15915493667125701904296875;
    float _558 = _508 * 6.283185482025146484375;
    float _560 = sin(_558);
    float _562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _476);
    float _564 = _526 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _566 = fma(_292, _504, _552);
    float _568 = fma(_292, _502, _554);
    float _570 = fma(_292, _500, _548);
    float _572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _478);
    float _574 = fma(_566, _342, _514);
    float _576 = _508 * 6.283185482025146484375;
    float _578 = cos(_576);
    float _580 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _582 = fma(_568, _342, _512);
    float _584 = fma(_570, _342, _510);
    float _586 = _562 * _564;
    float _588 = _572 * _580;
    float _590 = _582 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _592 = _582 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _594 = _556 * 6.283185482025146484375;
    float _596 = cos(_594);
    float _598 = _582 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _600 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[4].x, _590);
    float _602 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[5].x, _592);
    float _604 = _492 * _560;
    float _606 = fma(_584, (*spvDescriptorSet0.vp_c10)._m0[6].x, _598);
    float _608 = _518 * _560;
    float _610 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[5].z, _602);
    float _612 = _556 * 6.283185482025146484375;
    float _614 = sin(_612);
    float _616 = _492 * _578;
    float _618 = _518 * _578;
    float _620 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[4].z, _600);
    float _622 = _610 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _624 = fma(_574, (*spvDescriptorSet0.vp_c10)._m0[6].z, _606);
    float _626 = _620 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _628 = _492 * _596;
    float _630 = _578 * _596;
    float _632 = _518 * _596;
    float _634 = _560 * _596;
    float _636 = _628 * _586;
    float _638 = 0.0;
    if (_536)
    {
        _638 = 1.0;
    }
    float _640 = _638;
    float _642 = _632 * _586;
    float _644 = fma(_614, _616, _608);
    float _646 = -_604;
    float _648 = fma(_614, _618, _646);
    float _650 = -_618;
    float _652 = fma(_614, _604, _650);
    float _654 = -_586;
    float _656 = _614 * _654;
    float _658 = fma(_644, _550, _636);
    float _660 = fma(_614, _608, _616);
    float _662 = fma(_648, _550, _642);
    float _664 = fma(_630, _550, _656);
    float _666 = fma(_652, _588, _658);
    float _668 = _622 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _670 = fma(_660, _588, _662);
    float _672 = fma(_634, _588, _664);
    float _674 = _666 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _676 = _666 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _678 = _624 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _680 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[11].x, _668);
    float _682 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[10].x, _674);
    float _684 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[8].x, _676);
    float _686 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[11].z, _680);
    float _688 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[10].z, _682);
    float _690 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[8].z, _684);
    float _692 = _686 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _694 = _678 + _688;
    float _696 = _626 + _690;
    float _698 = _622 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _700 = 1.0 / _692;
    float _702 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _704 = _694 + _702;
    float _706 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _708 = _696 + _706;
    float _710 = fma(_626, (*spvDescriptorSet0.vp_c8)._m0[10].x, _698);
    float _712 = _704 * _704;
    float _714 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[10].z, _710);
    float _716 = fma(_708, _708, _712);
    float _718 = _714 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _720 = sqrt(_716);
    float _722 = _718 + _692;
    float _724 = _722 * _700;
    float _726 = _724 * 0.5;
    float _728 = _666 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _732 = fma(_726, (*spvDescriptorSet0.vp_c8)._m0[30].w, _730);
    float _734 = fma(_672, (*spvDescriptorSet0.vp_c10)._m0[9].x, _728);
    float _736 = 1.0 / _732;
    float _738 = fma(_670, (*spvDescriptorSet0.vp_c10)._m0[9].z, _734);
    bool _740 = _720 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _742 = _622 + _738;
    float _744 = _726;
    float _746 = _692;
    float _748 = _738;
    float _750 = _720;
    float _752 = _672;
    float _754 = _640;
    if (!_740)
    {
        _744 = _696;
    }
    float _756 = _744;
    float _758 = _756;
    if (!_740)
    {
        _746 = _694;
    }
    float _760 = _746;
    float _762 = _760;
    if (!_740)
    {
        _748 = _742;
    }
    float _764 = _748;
    bool _766 = !_740;
    float _768 = _764;
    if (!_766)
    {
        float _770 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _772 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _774 = _720 + _772;
        float _776 = rsqrt(_716);
        float _778 = _774 * _770;
        float _780 = _742 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _782 = _778 * 0.15915493667125701904296875;
        float _784 = _782 * 6.283185482025146484375;
        float _786 = cos(_784);
        float _788 = _782 * 6.283185482025146484375;
        float _790 = sin(_788);
        float _792 = _786 + (-1.0);
        float _794 = _792 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _796 = fma(_790, _780, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _798 = fma(_742, _786, _794);
        float _800 = _776 * _796;
        float _802 = fma(_708, _800, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _804 = fma(_704, _800, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _768 = _798;
        _758 = _802;
        _762 = _804;
        _750 = _796;
    }
    float _806 = _768;
    float _808 = _758;
    float _810 = _762;
    float _812 = _750;
    float _814 = _812;
    if (_536)
    {
        _814 = 1.0;
    }
    float _816 = _814;
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _820 = _736 * _818;
    float _822 = _816;
    if (!_536)
    {
        float _824 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _826 = _824 * 0.15915493667125701904296875;
        float _828 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _830 = _826 * 6.283185482025146484375;
        float _832 = cos(_830);
        float _834 = _828 * 0.15915493667125701904296875;
        float _836 = _826 * 6.283185482025146484375;
        float _838 = sin(_836);
        float _840 = 1.0 / _832;
        float _842 = _834 * 6.283185482025146484375;
        float _844 = cos(_842);
        float _846 = _838 * _840;
        float _848 = _834 * 6.283185482025146484375;
        float _850 = sin(_848);
        float _852 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _854 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _852;
        float _856 = _844 * _846;
        float _858 = 1.0 / _854;
        float _860 = 1.0 / _856;
        float _862 = _850 * _860;
        float _864 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _866 = fma(_820, _862, _864);
        float _868 = _866 * _858;
        float _870 = precise::clamp(_868, 0.0, 1.0);
        _752 = _846;
        _754 = _870;
    }
    float _872 = _752;
    float _874 = _754;
    float _876 = _872;
    if (!_536)
    {
        float _878 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _880 = _878 * 0.15915493667125701904296875;
        float _882 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _884 = _880 * 6.283185482025146484375;
        float _886 = cos(_884);
        float _888 = _882 * 0.15915493667125701904296875;
        float _890 = _880 * 6.283185482025146484375;
        float _892 = sin(_890);
        float _894 = 1.0 / _886;
        float _896 = _888 * 6.283185482025146484375;
        float _898 = cos(_896);
        float _900 = _892 * _894;
        float _902 = _888 * 6.283185482025146484375;
        float _904 = sin(_902);
        float _906 = _898 * _900;
        float _908 = 1.0 / _906;
        float _910 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _912 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _910;
        float _914 = 1.0 / _912;
        float _916 = _904 * _908;
        float _918 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _920 = fma(_820, _916, _918);
        float _922 = _920 * _914;
        float _924 = precise::clamp(_922, 0.0, 1.0);
        float _926 = -_924;
        float _928 = _926 + 1.0;
        _822 = _928;
    }
    float _930 = _822;
    float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _934 = _806 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _938 = _808 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _942 = _810 + _940;
    float _944 = _934 * _934;
    float _946 = fma(_938, _938, _944);
    float _948 = fma(_942, _942, _946);
    float _950 = rsqrt(_948);
    float _952 = sqrt(_948);
    float _954 = _950 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _956 = _938 * _954;
    float _958 = _942 * _954;
    float _960 = _956 * _956;
    float _962 = _958 * _958;
    float _964 = _960 + _962;
    float _966 = sqrt(_964);
    bool _968 = _966 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _972 = _966 + _970;
    float _974 = _942;
    float _976 = _964;
    float _978 = _972;
    float _980 = _954;
    if (_968)
    {
        float _982 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _974 = _982;
    }
    float _984 = _974;
    if (_968)
    {
        float _986 = rsqrt(_964);
        _976 = _986;
    }
    float _988 = _976;
    float _990 = _988;
    if (_968)
    {
        float _992 = _972 * _984;
        _978 = _992;
    }
    float _994 = _978;
    if (_968)
    {
        float _996 = _994 * 0.15915493667125701904296875;
        _876 = _996;
    }
    float _998 = _876;
    float _1000 = _984;
    float _1002 = _998;
    if (_968)
    {
        float _1004 = _998 * 6.283185482025146484375;
        float _1006 = sin(_1004);
        _1000 = _1006;
    }
    float _1008 = _1000;
    float _1010 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1012 = precise::max(0.0, _1010);
    float _1014 = _944;
    float _1016 = _1012;
    if (_968)
    {
        float _1018 = _998 * 6.283185482025146484375;
        float _1020 = cos(_1018);
        _1014 = _1020;
    }
    float _1022 = _1014;
    float _1024 = -_954;
    float _1026 = -_1012;
    float _1028 = fma(_934, _1024, _1026);
    float _1030 = _1028;
    if (_968)
    {
        float _1032 = _1028 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1016 = _1032;
    }
    float _1034 = _1016;
    float _1036 = _1008;
    float _1038 = _1034;
    if (_968)
    {
        float _1040 = fma(_1008, _1034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1036 = _1040;
    }
    float _1042 = _1036;
    float _1044 = _1042;
    float _1046 = _1022;
    if (_968)
    {
        float _1048 = _1022 + (-1.0);
        _1038 = _1048;
    }
    float _1050 = _1038;
    float _1052 = _1050;
    if (_968)
    {
        float _1054 = _988 * _1042;
        _980 = _1054;
    }
    float _1056 = _980;
    if (!_968)
    {
        _1044 = _956;
    }
    float _1058 = _1044;
    float _1060 = _1058;
    if (_968)
    {
        float _1062 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1002 = _1062;
    }
    float _1064 = _1002;
    if (_968)
    {
        float _1066 = _956 * _1056;
        _1060 = _1066;
    }
    float _1068 = _1060;
    if (!_968)
    {
        _1052 = _958;
    }
    float _1070 = _1052;
    float _1072 = _1070;
    if (_968)
    {
        float _1074 = _958 * _1056;
        _1072 = _1074;
    }
    float _1076 = _1072;
    if (!_968)
    {
        _990 = _960;
    }
    float _1078 = _990;
    float _1080 = _1078;
    if (_968)
    {
        float _1082 = fma(_1028, _1022, _1064);
        _1030 = _1082;
    }
    float _1084 = _1030;
    if (_968)
    {
        float _1086 = _1068 * _1068;
        _1080 = _1086;
    }
    float _1088 = _1080;
    if (!_968)
    {
        _1046 = _962;
    }
    float _1090 = _1046;
    float _1092 = _1090;
    if (_968)
    {
        float _1094 = _1076 * _1076;
        _1092 = _1094;
    }
    float _1096 = _1092;
    float _1098 = fma(_1084, _1084, _1088);
    float _1100 = _806 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1102 = _1098 + _1096;
    float _1104 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1106 = fma(_952, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1104);
    float _1108 = precise::clamp(_1106, 0.0, 1.0);
    float _1110 = _806 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1112 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1100);
    float _1114 = rsqrt(_1102);
    float _1116 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1118 = -_1108;
    float _1120 = _1118 + 1.0;
    float _1122 = _806 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1124 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1110);
    float _1126 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1112);
    float _1128 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1122);
    float _1130 = abs(_1120);
    float _1132 = log2(_1130);
    float _1134 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1124);
    float _1136 = _1126 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1138 = _806 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1140 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1128);
    float _1142 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1144 = _1136 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1146 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1138);
    float _1148 = _1114 * _1068;
    float _1150 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1152 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1154 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1146);
    float _1156 = _1114 * _1084;
    float _1158 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1160 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1152);
    float _1162 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1164 = _1114 * _1076;
    float _1166 = -_1158;
    float _1168 = fma(_1156, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1166);
    float _1170 = -_1144;
    float _1172 = fma(_1170, _1116, 1.0);
    float _1174 = _1132 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1176 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1160);
    float _1178 = -_1164;
    float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1168);
    float _1182 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1184 = exp2(_1174);
    float _1186 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1176);
    float _1188 = fma(_1180, -0.5, 0.5);
    float _1190 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1192 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1182);
    float _1194 = fma(_1180, 0.5, 0.5);
    float _1196 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1190);
    float _1198 = log2(_1172);
    float _1200 = _1156 + 1.0;
    float _1202 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1192);
    float _1204 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1196);
    float _1206 = fma(_1194, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1208 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1202);
    float _1210 = 1.0 / _1186;
    float _1212 = -_1156;
    float _1214 = fma(_1184, _1200, _1212);
    float _1216 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1204);
    float _1218 = fma(_1194, _1206, -0.212114393711090087890625);
    float _1220 = fma(_1194, _1218, 1.570728778839111328125);
    float _1222 = sqrt(_1188);
    float _1224 = _1198 * 0.693147182464599609375;
    float _1226 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1228 = _1208 * _1210;
    float _1230 = _1216 * _1210;
    float _1232 = fma(_1230, 0.5, 0.5);
    float _1234 = _1222 * 0.636619746685028076171875;
    float _1236 = fma(_1228, -0.5, 0.5);
    float _1238 = fma(_1214, 0.5, 0.5);
    float _1240 = -_1220;
    float _1242 = fma(_1234, _1240, 1.0);
    float3 _3246 = float3(_1232, _1236, _1226);
    float _1244 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3246, float3(0.0), isnan(_3246)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3246, float3(0.0), isnan(_3246)), level(0.0)).x;
    float3 _3257 = float3(_1232, _1236, _1226);
    float4 _1247 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3257, float3(0.0), isnan(_3257)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3257, float3(0.0), isnan(_3257)), level(0.0)).xyzw;
    float _1249 = _1247.x;
    float _1251 = _1247.y;
    float _1253 = _1247.z;
    float _1255 = _1247.w;
    float2 _3274 = float2(_1242, _1238);
    float3 _1259 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3274, float2(0.0), isnan(_3274)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3274, float2(0.0), isnan(_3274)), level(0.0)).xyz;
    float _1261 = _1259.x;
    float _1263 = _1259.y;
    float _1265 = _1259.z;
    float _1267 = in.m_57.x;
    float _1269 = in.m_57.y;
    float _1271 = in.m_57.z;
    bool _1273 = _476 != 0.0;
    bool _1275 = isnan(_476);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan(0.0);
    bool _1281 = _1277 || _1279;
    float _1283 = _1132 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1285 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1287 = _474 == 0.0;
    bool _1289 = !_1281;
    bool _1291 = _1287 && _1289;
    out.m_59.x = _808;
    out.m_59.y = _806;
    out.m_59.z = _810;
    float _1293 = exp2(_1283);
    bool _1295 = _478 == 0.0;
    bool _1297 = _1295 && _1291;
    float _1299 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1303 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1285);
    float _1305 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1309 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1311 = fma(_1136, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1303);
    float _1313 = _1269;
    float _1315 = _1267;
    float _1317 = _1271;
    if (!_1297)
    {
        float _1319 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1269);
        _1313 = _1319;
    }
    float _1321 = _1313;
    if (!_1297)
    {
        float _1323 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1267);
        _1315 = _1323;
    }
    float _1325 = _1315;
    if (!_1297)
    {
        float _1327 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1271);
        _1317 = _1327;
    }
    float _1329 = _1317;
    float _1331 = _628 * _1321;
    float _1333 = -_1321;
    float _1335 = _614 * _1333;
    float _1337 = _632 * _1321;
    float _1339 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1341 = fma(_644, _1325, _1331);
    float _1343 = fma(_630, _1325, _1335);
    float _1345 = fma(_648, _1325, _1337);
    float _1347 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1349 = fma(_652, _1329, _1341);
    float _1351 = fma(_634, _1329, _1343);
    float _1353 = in.m_61.w;
    float _1355 = _1349 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1357 = -_1293;
    float _1359 = _1357 + 1.0;
    out.m_63.x = _1347;
    out.m_63.y = _1305;
    out.m_63.z = _1309;
    out.m_63.w = _1307;
    float _1361 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1355);
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1369 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1371 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1373 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1375 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1377 = _874 > 0.0;
    bool _1379 = isnan(_874);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan(0.0);
    bool _1385 = _1381 || _1383;
    float _1387 = fma(_660, _1329, _1345);
    out.m_65.x = _1373;
    out.m_65.y = _1371;
    out.m_65.z = _1375;
    float _1389 = _1349 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1391 = _1349 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1393 = _930 <= 0.0;
    bool _1395 = !_1385;
    bool _1397 = _1393 || _1395;
    float _1399 = _1216 + _1186;
    float _1401 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1389);
    float _1403 = fma(_1351, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1391);
    float _1405 = _874 * _930;
    float _1407 = _1186 * 0.5;
    float _1409 = fma(_1387, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1361);
    float _1411 = fma(_1387, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1401);
    float _1413 = _1405 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1415 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1311);
    float _1417 = fma(_1387, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1403);
    float _1419 = _1413 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1421 = _1415 + _1186;
    float _1423 = _1399 * 0.5;
    float _1425 = fma(_1208, -0.5, _1407);
    out.m_67.w = _1353;
    float _1427 = _1421 * 0.5;
    out.m_45.x = _1419;
    out.m_69.x = _1409;
    out.m_69.y = _1411;
    out.m_69.z = _1417;
    out.gl_Position.x = _1216;
    out.gl_Position.y = _1208;
    out.gl_Position.z = _1415;
    out.gl_Position.w = _1186;
    out.m_71.x = _1423;
    out.m_71.y = _1425;
    out.m_71.z = _1427;
    out.m_71.w = _1186;
    float _1429 = _1369 * _1244;
    float _1431 = -_1369;
    float _1433 = _1431 + 1.0;
    float _1435 = _1255 * _1429;
    float _1437 = _1265 * _1429;
    float _1439 = _1255 * _1433;
    float _1441 = fma(_1261, _1435, _1249);
    float _1443 = fma(_1263, _1435, _1251);
    float _1445 = fma(_1255, _1437, _1253);
    out.m_73.x = _1441;
    out.m_73.y = _1443;
    out.m_73.z = _1445;
    out.m_73.w = _1439;
    if (!_1397)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1447 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1447;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

