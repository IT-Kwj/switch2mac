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
    float4 m_57 [[user(locn0)]];
    float4 m_45 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_61 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _404 = false;
    bool _278 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_42.w;
    float _77 = trunc(_75);
    int _80 = int(_77);
    bool _84 = _80 >= 1;
    float _86 = 0.0;
    if (!_84)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _88 = _86;
    float _90 = _88;
    if (!_84)
    {
        out.m_45.x = 0.0;
    }
    int _92 = 0;
    if (!_84)
    {
        float _94 = _88 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_84)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1736 = as_type<float>(_96);
        out.gl_Position.z = _1736;
    }
    if (!_84)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _100 = in.m_47.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _116 = _114;
    if (_110)
    {
        float _118 = float(_80);
        _90 = _118;
    }
    float _120 = _90;
    bool _122 = _114 >= _120;
    bool _124 = !_110;
    bool _126 = _122 || _124;
    float _128 = _120;
    if (_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    if (_126)
    {
        out.m_45.x = 0.0;
    }
    if (_126)
    {
        float _132 = _130 * 5.0;
        _98 = as_type<int>(_132);
    }
    int _134 = _98;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1806 = as_type<float>(_134);
        out.gl_Position.z = _1806;
    }
    if (_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_49.w;
    float _138 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = in.m_47.x;
    float _152 = in.m_47.y;
    float _154 = in.m_47.z;
    float _156 = in.m_42.x;
    float _158 = in.m_42.y;
    float _160 = in.m_42.z;
    float _162 = 0.0;
    float _164 = _138;
    if (!_148)
    {
        float _166 = _138 * _138;
        float _168 = _166 * 0.5;
        _162 = _168;
    }
    float _170 = _162;
    float _172 = _170;
    if (!_148)
    {
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    bool _178 = !_148;
    float _180 = _176;
    if (!_178)
    {
        float _182 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = log2(_182);
        float _186 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _188 = _186 + 1.0;
        float _190 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = _138 * _184;
        float _194 = 1.0 / _188;
        float _196 = _190 * 0.693147182464599609375;
        float _198 = exp2(_192);
        float _200 = 1.0 / _196;
        float _202 = _198 + (-1.0);
        float _204 = -_202;
        float _206 = fma(_204, _200, _138);
        float _208 = _206 * _194;
        float _210 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _210;
    }
    float _212 = _180;
    bool _214 = !_148;
    if (!_214)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = 1.0 / _222;
        float _226 = _138 * _218;
        float _228 = exp2(_226);
        float _230 = -_228;
        float _232 = _230 + 1.0;
        float _234 = _232 * _224;
        _164 = _234;
    }
    float _236 = _164;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _240 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _242 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _244 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _246 = fma(_236, _150, _240);
    float _248 = fma(_236, _152, _242);
    float _250 = fma(_236, _154, _244);
    float _252 = fma(_246, _136, _156);
    float _254 = fma(_248, _136, _158);
    float _256 = fma(_250, _136, _160);
    bool _258 = !_238;
    float _276;
    if (!_258)
    {
        float _260 = in.m_51.x;
        float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _264 = _260 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _268 = _266 * _262;
        float _270 = floor(_268);
        float _272 = -_270;
        float _274 = _268 + _272;
        _276 = _274;
        _278 = true;
    }
    else
    {
        float _280 = float(_80);
        float _282 = 1.0 / _280;
        float _284 = _114 * _282;
        _276 = _284;
    }
    _278 = false;
    float _286 = _276;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = _286 + _288;
    bool _292 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _294 = isnan(_286);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _304;
    float _308 = -_302;
    float _310 = _308 + 1.0;
    bool _312 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _314 = isnan(_286);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = 1.0 / _306;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _330;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _336 = _290 * _324;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _338;
    float _342 = in.m_49.x;
    float _344 = in.m_49.y;
    float _346 = in.m_49.z;
    float _348 = _322 * _310;
    float _350 = fma(_328, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _352 = fma(_340, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _354 = fma(_332, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _356 = -_322;
    float _358 = _356 + 1.0;
    float _360 = _350 * _348;
    float _362 = _352 * _348;
    float _364 = _354 * _348;
    float _366 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[143].x, _360);
    float _368 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[143].y, _362);
    float _370 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[143].z, _364);
    float _372 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[144].x, _366);
    float _374 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[144].y, _368);
    float _376 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[144].z, _370);
    float _378 = _372 * _342;
    float _380 = _374 * _344;
    float _382 = _376 * _346;
    bool _384 = !_334;
    float _402;
    if (!_384)
    {
        float _386 = in.m_51.x;
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _390 = _386 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _394 = _392 * _388;
        float _396 = floor(_394);
        float _398 = -_396;
        float _400 = _394 + _398;
        _402 = _400;
        _404 = true;
    }
    else
    {
        float _406 = float(_80);
        float _408 = 1.0 / _406;
        float _410 = _114 * _408;
        _402 = _410;
    }
    _404 = false;
    float _412 = _402;
    float _414 = in.m_51.x;
    float _416 = in.m_51.y;
    float _418 = in.m_51.z;
    float _420 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _422 = log2(_420);
    float _424 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _426 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _428 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _430 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _424);
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _434 = _432 != 0;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _438 = _436 != 0;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _442 = _440 != 0;
    float _444 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _426);
    float _446 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _428);
    float _448 = _380 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _450 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _444);
    float _452 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _446);
    float _454 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _456 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _458 = _450 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _460 = _452 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _462 = _418 * 2.0;
    float _464 = _414 * 2.0;
    float _466 = _416 * 2.0;
    float _468 = _416 + _418;
    float _470 = floor(_464);
    float _472 = _468 + (-1.0);
    float _474 = floor(_462);
    float _476 = _422 * _114;
    float _478 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _480 = exp2(_476);
    bool _482 = _470 >= 0.0;
    bool _484 = isnan(_470);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    int _492 = _490 ? 0 : 1;
    bool _494 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _496 = isnan(0.0);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _502 = _498 || _500;
    float _504 = floor(_466);
    bool _506 = _474 > 0.0;
    bool _508 = _474 >= 0.0;
    bool _510 = isnan(_474);
    bool _512 = _508 || _510;
    bool _514 = isnan(0.0);
    bool _516 = _512 || _514;
    float _518 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _430);
    int _520 = _516 ? 0 : 1;
    float _522 = -_480;
    float _524 = _522 + 1.0;
    bool _526 = _470 > 0.0;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _530 = 1.0 + _528;
    bool _532 = !_434;
    int _534 = _532 ? 0 : 1;
    float _536 = _518 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _538 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _540 = isnan(1.0);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _546 = _542 || _544;
    float _548 = 1.0 / _530;
    int _550 = abs(_534);
    float _552 = in.m_53.x;
    float _554 = in.m_53.y;
    float _556 = in.m_53.z;
    int _558 = ~_520;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    int _564 = _562;
    if (!_506)
    {
        int _566 = ~_520;
        int _568 = _566 + 1;
        _564 = _568;
    }
    int _570 = _564;
    float _572 = _416 + _414;
    bool _574 = _504 > 0.0;
    float _576 = _416 + (-0.5);
    bool _578 = _504 >= 0.0;
    bool _580 = isnan(_504);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    float _588 = _572 + (-1.0);
    float _590 = _502 ? _524 : 0.0;
    float _592 = float(_550);
    float _594 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _596 = float(_570);
    if (_546)
    {
        float _598 = _590 * _548;
        _116 = _598;
    }
    float _600 = _116;
    bool _602 = !_438;
    int _604 = _602 ? 0 : 1;
    int _606 = ~_492;
    int _608 = _606 + 1;
    int _610 = _608 + 1;
    float _612 = _592 * _596;
    int _614 = _586 ? 0 : 1;
    float _616 = _414 + (-0.5);
    int _618 = _610;
    if (!_526)
    {
        int _620 = ~_492;
        int _622 = _620 + 1;
        _618 = _622;
    }
    int _624 = _618;
    float _626 = _612 * (-2.0);
    int _628 = abs(_604);
    float _630 = -_458;
    float _632 = _630 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _634 = ~_614;
    int _636 = _634 + 1;
    int _638 = _636 + 1;
    float _640 = fma(_626, _552, _552);
    int _642 = _638;
    if (!_574)
    {
        int _644 = ~_614;
        int _646 = _644 + 1;
        _642 = _646;
    }
    int _648 = _642;
    float _650 = -_536;
    float _652 = _650 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _654 = !_442;
    int _656 = _654 ? 0 : 1;
    float _658 = _632 * _632;
    float _660 = float(_628);
    float _662 = fma(_594, _626, _594);
    float _664 = float(_624);
    float _666 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[196].x, _640);
    float _668 = -_460;
    float _670 = _668 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _672 = fma(_652, _652, _658);
    int _674 = abs(_656);
    float _676 = _660 * _664;
    float _678 = fma(_662, _600, _666);
    float _680 = fma(_670, _670, _672);
    float _682 = _676 * (-2.0);
    float _684 = _678 * 0.15915493667125701904296875;
    float _686 = float(_648);
    float _688 = _418 + _414;
    float _690 = float(_674);
    float _692 = rsqrt(_680);
    float _694 = fma(_682, _554, _554);
    float _696 = fma(_478, _682, _478);
    float _698 = _690 * _686;
    float _700 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[196].y, _694);
    float _702 = _688 + (-1.0);
    float _704 = _698 * (-2.0);
    float _706 = fma(_696, _600, _700);
    float _708 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _710 = _418 + (-0.5);
    float _712 = fma(_704, _556, _556);
    float _714 = _706 * 0.15915493667125701904296875;
    float _716 = fma(_708, _704, _708);
    float _718 = in.m_55.x;
    float _720 = in.m_55.y;
    float _722 = in.m_55.z;
    float _724 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[196].z, _712);
    float _726 = _652 * _692;
    float _728 = _684 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = _632 * _692;
    float _734 = fma(_716, _600, _724);
    float _736 = _670 * _692;
    float _738 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _740 = _726 * _738;
    float _742 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _744 = _732 * _742;
    float _746 = _734 * 0.15915493667125701904296875;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _750 = _736 * _748;
    float _752 = _684 * 6.283185482025146484375;
    float _754 = cos(_752);
    float _756 = _714 * 6.283185482025146484375;
    float _758 = sin(_756);
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _762 = -_740;
    float _764 = fma(_736, _760, _762);
    float _766 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _768 = -_750;
    float _770 = fma(_732, _766, _768);
    float _772 = _764 * _764;
    bool _774 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _776 = isnan(0.5);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _782 = _778 || _780;
    float _784 = _714 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = fma(_770, _770, _772);
    float _790 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _720);
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _718);
    float _794 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _722);
    float _796 = _448 * _790;
    float _798 = _454 * _792;
    float _800 = _746 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _806 = -_744;
    float _808 = fma(_726, _804, _806);
    float _810 = _754 * _758;
    float _812 = _456 * _794;
    float _814 = fma(_808, _808, _788);
    float _816 = _746 * 6.283185482025146484375;
    float _818 = cos(_816);
    float _820 = _730 * _786;
    float _822 = rsqrt(_814);
    float _824 = -_810;
    float _826 = fma(_802, _820, _824);
    float _828 = -_820;
    float _830 = fma(_802, _810, _828);
    float _832 = _730 * _758;
    float _834 = _754 * _786;
    float _836 = _818 * _796;
    float _838 = fma(_802, _834, _832);
    float _840 = _758 * _818;
    float _842 = _786 * _818;
    float _844 = _754 * _836;
    float _846 = -_796;
    float _848 = _802 * _846;
    float _850 = fma(_802, _832, _834);
    float _852 = _730 * _836;
    float _854 = _770 * _822;
    float _856 = fma(_838, _798, _844);
    float _858 = _764 * _822;
    float _860 = fma(_842, _798, _848);
    float _862 = _732 * _854;
    float _864 = _808 * _822;
    float _866 = fma(_830, _812, _856);
    float _868 = _736 * _858;
    float _870 = -_862;
    float _872 = fma(_726, _858, _870);
    float _874 = fma(_826, _798, _852);
    float _876 = fma(_840, _812, _860);
    float _878 = -_868;
    float _880 = fma(_732, _864, _878);
    float _882 = _872 * _866;
    float _884 = fma(_850, _812, _874);
    float _886 = _880 * _866;
    float _888 = fma(_864, _876, _882);
    float _890 = fma(_854, _876, _886);
    float _892 = fma(_736, _884, _888);
    float _894 = fma(_726, _884, _890);
    float _896 = _460 + _892;
    float _898 = _726 * _864;
    float _900 = _536 + _894;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _904 = _896 + _902;
    float _906 = -_898;
    float _908 = fma(_736, _854, _906);
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _912 = _900 + _910;
    float _914 = _904 * _904;
    float _916 = _908 * _866;
    float _918 = fma(_912, _912, _914);
    float _920 = fma(_858, _876, _916);
    float _922 = sqrt(_918);
    float _924 = fma(_732, _884, _920);
    float _926 = _458 + _924;
    bool _928 = _922 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _930 = _736;
    float _932 = _900;
    float _934 = _888;
    float _936 = _732;
    float _938 = _812;
    if (!_928)
    {
        _930 = _900;
    }
    float _940 = _930;
    float _942 = _940;
    if (!_928)
    {
        _932 = _896;
    }
    float _944 = _932;
    float _946 = _944;
    if (!_928)
    {
        _934 = _926;
    }
    float _948 = _934;
    bool _950 = !_928;
    float _952 = _948;
    if (!_950)
    {
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _958 = _922 + _956;
        float _960 = rsqrt(_918);
        float _962 = _958 * _954;
        float _964 = _926 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _966 = _962 * 0.15915493667125701904296875;
        float _968 = _966 * 6.283185482025146484375;
        float _970 = cos(_968);
        float _972 = _966 * 6.283185482025146484375;
        float _974 = sin(_972);
        float _976 = _970 + (-1.0);
        float _978 = fma(_974, _964, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _980 = _976 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _982 = _960 * _978;
        float _984 = fma(_926, _970, _980);
        float _986 = fma(_912, _982, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _988 = fma(_904, _982, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _946 = _988;
        _942 = _986;
        _952 = _984;
    }
    float _990 = _946;
    float _992 = _942;
    float _994 = _952;
    float _996 = _994;
    float _998 = _992;
    float _1000 = _990;
    if (!_782)
    {
        float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1004 = _458 + _1002;
        float _1006 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1008 = _536 + _1006;
        float _1010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1012 = -_460;
        float _1014 = _1012 + _990;
        float _1016 = _1004 * _1004;
        float _1018 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1020 = _460 + _1018;
        float _1022 = fma(_1008, _1008, _1016);
        float _1024 = -_536;
        float _1026 = _1024 + _992;
        float _1028 = fma(_1020, _1020, _1022);
        float _1030 = sqrt(_1028);
        float _1032 = precise::min(_1030, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1034 = _1032 * _1010;
        float _1036 = -_458;
        float _1038 = _1036 + _994;
        float _1040 = fma(_1026, _1034, _536);
        float _1042 = fma(_1038, _1034, _458);
        float _1044 = fma(_1014, _1034, _460);
        _996 = _1042;
        _998 = _1040;
        _1000 = _1044;
    }
    float _1046 = _996;
    float _1048 = _998;
    float _1050 = _1000;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1054 = _1046 + _1052;
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1058 = _1048 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1062 = _1050 + _1060;
    float _1064 = _1054 * _1054;
    float _1066 = fma(_1058, _1058, _1064);
    float _1068 = fma(_1062, _1062, _1066);
    float _1070 = rsqrt(_1068);
    float _1072 = sqrt(_1068);
    float _1074 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1076 = _1058 * _1074;
    float _1078 = _1062 * _1074;
    float _1080 = _1076 * _1076;
    float _1082 = _1078 * _1078;
    float _1084 = _1080 + _1082;
    float _1086 = sqrt(_1084);
    bool _1088 = _1086 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1090 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1092 = _1086 + _1090;
    float _1094 = _1062;
    float _1096 = _1064;
    float _1098 = _1092;
    float _1100 = _1074;
    float _1102 = _1080;
    if (_1088)
    {
        float _1104 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1094 = _1104;
    }
    float _1106 = _1094;
    if (_1088)
    {
        float _1108 = rsqrt(_1084);
        _1096 = _1108;
    }
    float _1110 = _1096;
    float _1112 = _1110;
    if (_1088)
    {
        float _1114 = _1092 * _1106;
        _1098 = _1114;
    }
    float _1116 = _1098;
    if (_1088)
    {
        float _1118 = _1116 * 0.15915493667125701904296875;
        _936 = _1118;
    }
    float _1120 = _936;
    float _1122 = _904;
    if (_1088)
    {
        float _1124 = _1120 * 6.283185482025146484375;
        float _1126 = sin(_1124);
        _1122 = _1126;
    }
    float _1128 = _1122;
    float _1130 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1132 = precise::max(0.0, _1130);
    float _1134 = _1070;
    float _1136 = _1132;
    float _1138 = _1130;
    if (_1088)
    {
        float _1140 = _1120 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        _1134 = _1142;
    }
    float _1144 = _1134;
    float _1146 = -_1074;
    float _1148 = -_1132;
    float _1150 = fma(_1054, _1146, _1148);
    if (_1088)
    {
        float _1152 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1136 = _1152;
    }
    float _1154 = _1136;
    float _1156 = _1128;
    float _1158 = _1154;
    if (_1088)
    {
        float _1160 = fma(_1128, _1154, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1156 = _1160;
    }
    float _1162 = _1156;
    float _1164 = _1162;
    if (!_1088)
    {
        _1158 = _1078;
    }
    float _1166 = _1158;
    float _1168 = _1166;
    if (_1088)
    {
        float _1170 = _1144 + (-1.0);
        _1138 = _1170;
    }
    float _1172 = _1138;
    float _1174 = _1172;
    if (_1088)
    {
        float _1176 = _1110 * _1162;
        _938 = _1176;
    }
    float _1178 = _938;
    if (!_1088)
    {
        _1112 = _1076;
    }
    float _1180 = _1112;
    float _1182 = _1180;
    if (_1088)
    {
        float _1184 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1100 = _1184;
    }
    float _1186 = _1100;
    if (_1088)
    {
        float _1188 = _1076 * _1178;
        _1182 = _1188;
    }
    float _1190 = _1182;
    if (!_1088)
    {
        _1164 = _1150;
    }
    float _1192 = _1164;
    float _1194 = _1192;
    if (_1088)
    {
        float _1196 = _1078 * _1178;
        _1168 = _1196;
    }
    float _1198 = _1168;
    if (_1088)
    {
        float _1200 = fma(_1150, _1144, _1186);
        _1194 = _1200;
    }
    float _1202 = _1194;
    if (_1088)
    {
        float _1204 = _1190 * _1190;
        _1102 = _1204;
    }
    float _1206 = _1102;
    if (!_1088)
    {
        _1174 = _1082;
    }
    float _1208 = _1174;
    float _1210 = _1208;
    if (_1088)
    {
        float _1212 = _1198 * _1198;
        _1210 = _1212;
    }
    float _1214 = _1210;
    float _1216 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1218 = fma(_1202, _1202, _1206);
    float _1220 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1222 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1216);
    float _1224 = _1218 + _1214;
    float _1226 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1228 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1230 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1228);
    float _1232 = precise::clamp(_1230, 0.0, 1.0);
    float _1234 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1222);
    float _1236 = rsqrt(_1224);
    float _1238 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1240 = -_1232;
    float _1242 = _1240 + 1.0;
    float _1244 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1226);
    float _1246 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1248 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1220);
    float _1250 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1238);
    float _1252 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1244);
    float _1254 = abs(_1242);
    float _1256 = log2(_1254);
    float _1258 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1248);
    float _1260 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1250);
    float _1262 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1264 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1266 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1268 = _1260 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1270 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1272 = _1236 * _1190;
    float _1274 = _1236 * _1202;
    float _1276 = _1236 * _1198;
    float _1278 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1270);
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1282 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1284 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1278);
    float _1286 = -_1280;
    float _1288 = fma(_1274, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1286);
    float _1290 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1292 = -_1282;
    float _1294 = fma(_1292, _1264, 1.0);
    float _1296 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1284);
    float _1298 = -_1276;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1288);
    float _1302 = exp2(_1290);
    float _1304 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1306 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1308 = fma(_1300, -0.5, 0.5);
    float _1310 = fma(_1300, 0.5, 0.5);
    float _1312 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1304);
    float _1314 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1306);
    float _1316 = log2(_1294);
    float _1318 = _1274 + 1.0;
    float _1320 = fma(_1310, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1322 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1312);
    float _1324 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1314);
    float _1326 = 1.0 / _1296;
    float _1328 = -_1274;
    float _1330 = fma(_1302, _1318, _1328);
    float _1332 = fma(_1310, _1320, -0.212114393711090087890625);
    float _1334 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1322);
    float _1336 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1324);
    float _1338 = fma(_1330, 0.5, 0.5);
    float _1340 = fma(_1310, _1332, 1.570728778839111328125);
    float _1342 = sqrt(_1308);
    float _1344 = _1316 * 0.693147182464599609375;
    float _1346 = _1344 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1348 = _1334 * _1326;
    float _1350 = _1336 * _1326;
    float _1352 = fma(_1348, 0.5, 0.5);
    float _1354 = fma(_1350, -0.5, 0.5);
    float _1356 = _1342 * 0.636619746685028076171875;
    float _1358 = -_1340;
    float _1360 = fma(_1356, _1358, 1.0);
    float3 _3689 = float3(_1352, _1354, _1346);
    float _1362 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3689, float3(0.0), isnan(_3689)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3689, float3(0.0), isnan(_3689)), level(0.0)).x;
    float3 _3700 = float3(_1352, _1354, _1346);
    float4 _1365 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3700, float3(0.0), isnan(_3700)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3700, float3(0.0), isnan(_3700)), level(0.0)).xyzw;
    float _1367 = _1365.x;
    float _1369 = _1365.y;
    float _1371 = _1365.z;
    float _1373 = _1365.w;
    float2 _3717 = float2(_1360, _1338);
    float3 _1377 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3717, float2(0.0), isnan(_3717)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3717, float2(0.0), isnan(_3717)), level(0.0)).xyz;
    float _1379 = _1377.x;
    float _1381 = _1377.y;
    float _1383 = _1377.z;
    float _1385 = _458 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1391 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1393 = isnan(0.5);
    bool _1395 = _1391 || _1393;
    bool _1397 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1399 = _1395 || _1397;
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1403 = _1401 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1405 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1385);
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1411 = 1.0 / _1389;
    float _1413 = _458 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1415 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1405);
    float _1417 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1413);
    float _1419 = 1.0 / _1403;
    float _1421 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1417);
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1423;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1427;
    bool _1431 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1433 = isnan(_412);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1439 = _1435 || _1437;
    float _1441 = float(_1439);
    float _1443 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1447 = _1445 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1449 = 1.0 / _1409;
    float _1451 = _1425 * _1411;
    bool _1453 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1455 = isnan(_412);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1461 = _1457 || _1459;
    float _1463 = float(_1461);
    float _1465 = _1429 * _1419;
    float _1467 = _1415 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1469 = -_1441;
    float _1471 = _1469 + 1.0;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1475 = _412 + _1473;
    float _1477 = 1.0 / _1467;
    float _1479 = _1443 + _1467;
    float _1481 = _1463 * _1471;
    float _1483 = -_1463;
    float _1485 = _1483 + 1.0;
    float _1487 = _1447 * _1449;
    float _1489 = _1449;
    float _1491 = _1479;
    if (!_1399)
    {
        _1489 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1493 = _1489;
    float _1495 = fma(_1451, _1475, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1499 = _412 + _1497;
    bool _1501 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1503 = isnan(_412);
    bool _1505 = _1501 || _1503;
    bool _1507 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1509 = _1505 || _1507;
    float _1511 = float(_1509);
    float _1513 = fma(_1487, _1499, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1515 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1517 = isnan(_412);
    bool _1519 = _1515 || _1517;
    bool _1521 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1523 = _1519 || _1521;
    float _1525 = float(_1523);
    float _1527 = _1511 * _1485;
    float _1529 = -_1511;
    float _1531 = _1529 + 1.0;
    float _1533 = _1479 * _1477;
    float _1535 = _1533 * 0.5;
    float _1537 = -_1525;
    float _1539 = _1537 + 1.0;
    float _1541 = _1495 * _1527;
    float _1543 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1545 = _412 + _1543;
    float _1547 = _1535;
    float _1549 = _1531;
    float _1551 = _1513;
    if (!_1399)
    {
        float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1555 = fma(_1535, _1493, _1553);
        _1491 = _1555;
    }
    float _1557 = _1491;
    if (!_1399)
    {
        _1547 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1559 = _1547;
    float _1561 = fma(_1531, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1541);
    float _1563 = fma(_1465, _1545, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1565 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1567 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1569 = _1557;
    float _1571 = _1565;
    if (!_1399)
    {
        float _1573 = 1.0 / _1557;
        _1569 = _1573;
    }
    float _1575 = _1569;
    if (!_1399)
    {
        float _1577 = -_1559;
        float _1579 = _1577 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1549 = _1579;
    }
    float _1581 = _1549;
    float _1583 = _1441 * _1539;
    float _1585 = fma(_1513, _1481, _1561);
    float _1587 = fma(_1563, _1583, _1585);
    float _1589 = _1465;
    if (!_1399)
    {
        float _1591 = 1.0 / _1581;
        _1589 = _1591;
    }
    float _1593 = _1589;
    float _1595 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1565);
    if (_1399)
    {
        _1571 = 1.0;
    }
    float _1597 = _1571;
    float _1599 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1587);
    float _1601 = _1599 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1603 = exp2(_1567);
    float _1605 = _1597;
    if (!_1399)
    {
        float _1607 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1609 = -_1559;
        float _1611 = fma(_1575, _1607, _1609);
        _1551 = _1611;
    }
    float _1613 = _1551;
    if (!_1399)
    {
        float _1615 = _1613 * _1593;
        float _1617 = precise::clamp(_1615, 0.0, 1.0);
        _1605 = _1617;
    }
    float _1619 = _1605;
    float _1621 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1595);
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1629 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1621);
    bool _1631 = _1619 > 0.0;
    bool _1633 = isnan(_1619);
    bool _1635 = _1631 || _1633;
    bool _1637 = isnan(0.0);
    bool _1639 = _1635 || _1637;
    float _1641 = _1619 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1643 = -_1603;
    float _1645 = _1643 + 1.0;
    float _1647 = _1629 + _1296;
    float _1649 = _1623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1651 = _1645 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1653 = _1647 * 0.5;
    float _1655 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1334;
    out.gl_Position.y = _1336;
    out.gl_Position.z = _1629;
    out.gl_Position.w = _1296;
    float _1657 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1659 = _1641 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_57.x = _1649;
    out.m_57.y = _1655;
    out.m_57.z = _1657;
    out.m_57.w = _1601;
    out.m_59.z = _1653;
    out.m_59.w = _1296;
    out.m_45.x = _1659;
    float _1661 = _1651 * _1362;
    float _1663 = -_1651;
    float _1665 = _1663 + 1.0;
    float _1667 = _1373 * _1661;
    float _1669 = _1383 * _1661;
    float _1671 = _1373 * _1665;
    float _1673 = fma(_1379, _1667, _1367);
    float _1675 = fma(_1381, _1667, _1369);
    float _1677 = fma(_1373, _1669, _1371);
    out.m_61.x = _1673;
    out.m_61.y = _1675;
    out.m_61.z = _1677;
    out.m_61.w = _1671;
    if (_1639)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1679 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1679;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _404 = false;
    bool _278 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_42.w;
    float _77 = trunc(_75);
    int _80 = int(_77);
    bool _84 = _80 >= 1;
    float _86 = 0.0;
    if (!_84)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _88 = _86;
    float _90 = _88;
    if (!_84)
    {
        out.m_45.x = 0.0;
    }
    int _92 = 0;
    if (!_84)
    {
        float _94 = _88 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_84)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1736 = as_type<float>(_96);
        out.gl_Position.z = _1736;
    }
    if (!_84)
    {
        return out;
    }
    float _100 = in.m_47.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _116 = _114;
    if (_110)
    {
        float _118 = float(_80);
        _90 = _118;
    }
    float _120 = _90;
    bool _122 = _114 >= _120;
    bool _124 = !_110;
    bool _126 = _122 || _124;
    float _128 = _120;
    if (_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    if (_126)
    {
        out.m_45.x = 0.0;
    }
    if (_126)
    {
        float _132 = _130 * 5.0;
        _98 = as_type<int>(_132);
    }
    int _134 = _98;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1806 = as_type<float>(_134);
        out.gl_Position.z = _1806;
    }
    if (_126)
    {
        return out;
    }
    float _136 = in.m_49.w;
    float _138 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = in.m_47.x;
    float _152 = in.m_47.y;
    float _154 = in.m_47.z;
    float _156 = in.m_42.x;
    float _158 = in.m_42.y;
    float _160 = in.m_42.z;
    float _162 = 0.0;
    float _164 = _138;
    if (!_148)
    {
        float _166 = _138 * _138;
        float _168 = _166 * 0.5;
        _162 = _168;
    }
    float _170 = _162;
    float _172 = _170;
    if (!_148)
    {
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    bool _178 = !_148;
    float _180 = _176;
    if (!_178)
    {
        float _182 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = log2(_182);
        float _186 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _188 = _186 + 1.0;
        float _190 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = _138 * _184;
        float _194 = 1.0 / _188;
        float _196 = _190 * 0.693147182464599609375;
        float _198 = exp2(_192);
        float _200 = 1.0 / _196;
        float _202 = _198 + (-1.0);
        float _204 = -_202;
        float _206 = fma(_204, _200, _138);
        float _208 = _206 * _194;
        float _210 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _210;
    }
    float _212 = _180;
    bool _214 = !_148;
    if (!_214)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = 1.0 / _222;
        float _226 = _138 * _218;
        float _228 = exp2(_226);
        float _230 = -_228;
        float _232 = _230 + 1.0;
        float _234 = _232 * _224;
        _164 = _234;
    }
    float _236 = _164;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _240 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _242 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _244 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _246 = fma(_236, _150, _240);
    float _248 = fma(_236, _152, _242);
    float _250 = fma(_236, _154, _244);
    float _252 = fma(_246, _136, _156);
    float _254 = fma(_248, _136, _158);
    float _256 = fma(_250, _136, _160);
    bool _258 = !_238;
    float _276;
    if (!_258)
    {
        float _260 = in.m_51.x;
        float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _264 = _260 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _268 = _266 * _262;
        float _270 = floor(_268);
        float _272 = -_270;
        float _274 = _268 + _272;
        _276 = _274;
        _278 = true;
    }
    else
    {
        float _280 = float(_80);
        float _282 = 1.0 / _280;
        float _284 = _114 * _282;
        _276 = _284;
    }
    _278 = false;
    float _286 = _276;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = _286 + _288;
    bool _292 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _294 = isnan(_286);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _304;
    float _308 = -_302;
    float _310 = _308 + 1.0;
    bool _312 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _314 = isnan(_286);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = 1.0 / _306;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _330;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _336 = _290 * _324;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _338;
    float _342 = in.m_49.x;
    float _344 = in.m_49.y;
    float _346 = in.m_49.z;
    float _348 = _322 * _310;
    float _350 = fma(_328, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _352 = fma(_340, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _354 = fma(_332, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _356 = -_322;
    float _358 = _356 + 1.0;
    float _360 = _350 * _348;
    float _362 = _352 * _348;
    float _364 = _354 * _348;
    float _366 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[143].x, _360);
    float _368 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[143].y, _362);
    float _370 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[143].z, _364);
    float _372 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[144].x, _366);
    float _374 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[144].y, _368);
    float _376 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[144].z, _370);
    float _378 = _372 * _342;
    float _380 = _374 * _344;
    float _382 = _376 * _346;
    bool _384 = !_334;
    float _402;
    if (!_384)
    {
        float _386 = in.m_51.x;
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _390 = _386 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _394 = _392 * _388;
        float _396 = floor(_394);
        float _398 = -_396;
        float _400 = _394 + _398;
        _402 = _400;
        _404 = true;
    }
    else
    {
        float _406 = float(_80);
        float _408 = 1.0 / _406;
        float _410 = _114 * _408;
        _402 = _410;
    }
    _404 = false;
    float _412 = _402;
    float _414 = in.m_51.x;
    float _416 = in.m_51.y;
    float _418 = in.m_51.z;
    float _420 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _422 = log2(_420);
    float _424 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _426 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _428 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _430 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _424);
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _434 = _432 != 0;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _438 = _436 != 0;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _442 = _440 != 0;
    float _444 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _426);
    float _446 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _428);
    float _448 = _380 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _450 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _444);
    float _452 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _446);
    float _454 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _456 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _458 = _450 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _460 = _452 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _462 = _418 * 2.0;
    float _464 = _414 * 2.0;
    float _466 = _416 * 2.0;
    float _468 = _416 + _418;
    float _470 = floor(_464);
    float _472 = _468 + (-1.0);
    float _474 = floor(_462);
    float _476 = _422 * _114;
    float _478 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _480 = exp2(_476);
    bool _482 = _470 >= 0.0;
    bool _484 = isnan(_470);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    int _492 = _490 ? 0 : 1;
    bool _494 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _496 = isnan(0.0);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _502 = _498 || _500;
    float _504 = floor(_466);
    bool _506 = _474 > 0.0;
    bool _508 = _474 >= 0.0;
    bool _510 = isnan(_474);
    bool _512 = _508 || _510;
    bool _514 = isnan(0.0);
    bool _516 = _512 || _514;
    float _518 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _430);
    int _520 = _516 ? 0 : 1;
    float _522 = -_480;
    float _524 = _522 + 1.0;
    bool _526 = _470 > 0.0;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _530 = 1.0 + _528;
    bool _532 = !_434;
    int _534 = _532 ? 0 : 1;
    float _536 = _518 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _538 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _540 = isnan(1.0);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _546 = _542 || _544;
    float _548 = 1.0 / _530;
    int _550 = abs(_534);
    float _552 = in.m_53.x;
    float _554 = in.m_53.y;
    float _556 = in.m_53.z;
    int _558 = ~_520;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    int _564 = _562;
    if (!_506)
    {
        int _566 = ~_520;
        int _568 = _566 + 1;
        _564 = _568;
    }
    int _570 = _564;
    float _572 = _416 + _414;
    bool _574 = _504 > 0.0;
    float _576 = _416 + (-0.5);
    bool _578 = _504 >= 0.0;
    bool _580 = isnan(_504);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    float _588 = _572 + (-1.0);
    float _590 = _502 ? _524 : 0.0;
    float _592 = float(_550);
    float _594 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _596 = float(_570);
    if (_546)
    {
        float _598 = _590 * _548;
        _116 = _598;
    }
    float _600 = _116;
    bool _602 = !_438;
    int _604 = _602 ? 0 : 1;
    int _606 = ~_492;
    int _608 = _606 + 1;
    int _610 = _608 + 1;
    float _612 = _592 * _596;
    int _614 = _586 ? 0 : 1;
    float _616 = _414 + (-0.5);
    int _618 = _610;
    if (!_526)
    {
        int _620 = ~_492;
        int _622 = _620 + 1;
        _618 = _622;
    }
    int _624 = _618;
    float _626 = _612 * (-2.0);
    int _628 = abs(_604);
    float _630 = -_458;
    float _632 = _630 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _634 = ~_614;
    int _636 = _634 + 1;
    int _638 = _636 + 1;
    float _640 = fma(_626, _552, _552);
    int _642 = _638;
    if (!_574)
    {
        int _644 = ~_614;
        int _646 = _644 + 1;
        _642 = _646;
    }
    int _648 = _642;
    float _650 = -_536;
    float _652 = _650 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _654 = !_442;
    int _656 = _654 ? 0 : 1;
    float _658 = _632 * _632;
    float _660 = float(_628);
    float _662 = fma(_594, _626, _594);
    float _664 = float(_624);
    float _666 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[196].x, _640);
    float _668 = -_460;
    float _670 = _668 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _672 = fma(_652, _652, _658);
    int _674 = abs(_656);
    float _676 = _660 * _664;
    float _678 = fma(_662, _600, _666);
    float _680 = fma(_670, _670, _672);
    float _682 = _676 * (-2.0);
    float _684 = _678 * 0.15915493667125701904296875;
    float _686 = float(_648);
    float _688 = _418 + _414;
    float _690 = float(_674);
    float _692 = rsqrt(_680);
    float _694 = fma(_682, _554, _554);
    float _696 = fma(_478, _682, _478);
    float _698 = _690 * _686;
    float _700 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[196].y, _694);
    float _702 = _688 + (-1.0);
    float _704 = _698 * (-2.0);
    float _706 = fma(_696, _600, _700);
    float _708 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _710 = _418 + (-0.5);
    float _712 = fma(_704, _556, _556);
    float _714 = _706 * 0.15915493667125701904296875;
    float _716 = fma(_708, _704, _708);
    float _718 = in.m_55.x;
    float _720 = in.m_55.y;
    float _722 = in.m_55.z;
    float _724 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[196].z, _712);
    float _726 = _652 * _692;
    float _728 = _684 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = _632 * _692;
    float _734 = fma(_716, _600, _724);
    float _736 = _670 * _692;
    float _738 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _740 = _726 * _738;
    float _742 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _744 = _732 * _742;
    float _746 = _734 * 0.15915493667125701904296875;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _750 = _736 * _748;
    float _752 = _684 * 6.283185482025146484375;
    float _754 = cos(_752);
    float _756 = _714 * 6.283185482025146484375;
    float _758 = sin(_756);
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _762 = -_740;
    float _764 = fma(_736, _760, _762);
    float _766 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _768 = -_750;
    float _770 = fma(_732, _766, _768);
    float _772 = _764 * _764;
    bool _774 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _776 = isnan(0.5);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _782 = _778 || _780;
    float _784 = _714 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = fma(_770, _770, _772);
    float _790 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _720);
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _718);
    float _794 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _722);
    float _796 = _448 * _790;
    float _798 = _454 * _792;
    float _800 = _746 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _806 = -_744;
    float _808 = fma(_726, _804, _806);
    float _810 = _754 * _758;
    float _812 = _456 * _794;
    float _814 = fma(_808, _808, _788);
    float _816 = _746 * 6.283185482025146484375;
    float _818 = cos(_816);
    float _820 = _730 * _786;
    float _822 = rsqrt(_814);
    float _824 = -_810;
    float _826 = fma(_802, _820, _824);
    float _828 = -_820;
    float _830 = fma(_802, _810, _828);
    float _832 = _730 * _758;
    float _834 = _754 * _786;
    float _836 = _818 * _796;
    float _838 = fma(_802, _834, _832);
    float _840 = _758 * _818;
    float _842 = _786 * _818;
    float _844 = _754 * _836;
    float _846 = -_796;
    float _848 = _802 * _846;
    float _850 = fma(_802, _832, _834);
    float _852 = _730 * _836;
    float _854 = _770 * _822;
    float _856 = fma(_838, _798, _844);
    float _858 = _764 * _822;
    float _860 = fma(_842, _798, _848);
    float _862 = _732 * _854;
    float _864 = _808 * _822;
    float _866 = fma(_830, _812, _856);
    float _868 = _736 * _858;
    float _870 = -_862;
    float _872 = fma(_726, _858, _870);
    float _874 = fma(_826, _798, _852);
    float _876 = fma(_840, _812, _860);
    float _878 = -_868;
    float _880 = fma(_732, _864, _878);
    float _882 = _872 * _866;
    float _884 = fma(_850, _812, _874);
    float _886 = _880 * _866;
    float _888 = fma(_864, _876, _882);
    float _890 = fma(_854, _876, _886);
    float _892 = fma(_736, _884, _888);
    float _894 = fma(_726, _884, _890);
    float _896 = _460 + _892;
    float _898 = _726 * _864;
    float _900 = _536 + _894;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _904 = _896 + _902;
    float _906 = -_898;
    float _908 = fma(_736, _854, _906);
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _912 = _900 + _910;
    float _914 = _904 * _904;
    float _916 = _908 * _866;
    float _918 = fma(_912, _912, _914);
    float _920 = fma(_858, _876, _916);
    float _922 = sqrt(_918);
    float _924 = fma(_732, _884, _920);
    float _926 = _458 + _924;
    bool _928 = _922 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _930 = _736;
    float _932 = _900;
    float _934 = _888;
    float _936 = _732;
    float _938 = _812;
    if (!_928)
    {
        _930 = _900;
    }
    float _940 = _930;
    float _942 = _940;
    if (!_928)
    {
        _932 = _896;
    }
    float _944 = _932;
    float _946 = _944;
    if (!_928)
    {
        _934 = _926;
    }
    float _948 = _934;
    bool _950 = !_928;
    float _952 = _948;
    if (!_950)
    {
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _958 = _922 + _956;
        float _960 = rsqrt(_918);
        float _962 = _958 * _954;
        float _964 = _926 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _966 = _962 * 0.15915493667125701904296875;
        float _968 = _966 * 6.283185482025146484375;
        float _970 = cos(_968);
        float _972 = _966 * 6.283185482025146484375;
        float _974 = sin(_972);
        float _976 = _970 + (-1.0);
        float _978 = fma(_974, _964, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _980 = _976 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _982 = _960 * _978;
        float _984 = fma(_926, _970, _980);
        float _986 = fma(_912, _982, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _988 = fma(_904, _982, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _946 = _988;
        _942 = _986;
        _952 = _984;
    }
    float _990 = _946;
    float _992 = _942;
    float _994 = _952;
    float _996 = _994;
    float _998 = _992;
    float _1000 = _990;
    if (!_782)
    {
        float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1004 = _458 + _1002;
        float _1006 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1008 = _536 + _1006;
        float _1010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1012 = -_460;
        float _1014 = _1012 + _990;
        float _1016 = _1004 * _1004;
        float _1018 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1020 = _460 + _1018;
        float _1022 = fma(_1008, _1008, _1016);
        float _1024 = -_536;
        float _1026 = _1024 + _992;
        float _1028 = fma(_1020, _1020, _1022);
        float _1030 = sqrt(_1028);
        float _1032 = precise::min(_1030, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1034 = _1032 * _1010;
        float _1036 = -_458;
        float _1038 = _1036 + _994;
        float _1040 = fma(_1026, _1034, _536);
        float _1042 = fma(_1038, _1034, _458);
        float _1044 = fma(_1014, _1034, _460);
        _996 = _1042;
        _998 = _1040;
        _1000 = _1044;
    }
    float _1046 = _996;
    float _1048 = _998;
    float _1050 = _1000;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1054 = _1046 + _1052;
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1058 = _1048 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1062 = _1050 + _1060;
    float _1064 = _1054 * _1054;
    float _1066 = fma(_1058, _1058, _1064);
    float _1068 = fma(_1062, _1062, _1066);
    float _1070 = rsqrt(_1068);
    float _1072 = sqrt(_1068);
    float _1074 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1076 = _1058 * _1074;
    float _1078 = _1062 * _1074;
    float _1080 = _1076 * _1076;
    float _1082 = _1078 * _1078;
    float _1084 = _1080 + _1082;
    float _1086 = sqrt(_1084);
    bool _1088 = _1086 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1090 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1092 = _1086 + _1090;
    float _1094 = _1062;
    float _1096 = _1064;
    float _1098 = _1092;
    float _1100 = _1074;
    float _1102 = _1080;
    if (_1088)
    {
        float _1104 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1094 = _1104;
    }
    float _1106 = _1094;
    if (_1088)
    {
        float _1108 = rsqrt(_1084);
        _1096 = _1108;
    }
    float _1110 = _1096;
    float _1112 = _1110;
    if (_1088)
    {
        float _1114 = _1092 * _1106;
        _1098 = _1114;
    }
    float _1116 = _1098;
    if (_1088)
    {
        float _1118 = _1116 * 0.15915493667125701904296875;
        _936 = _1118;
    }
    float _1120 = _936;
    float _1122 = _904;
    if (_1088)
    {
        float _1124 = _1120 * 6.283185482025146484375;
        float _1126 = sin(_1124);
        _1122 = _1126;
    }
    float _1128 = _1122;
    float _1130 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1132 = precise::max(0.0, _1130);
    float _1134 = _1070;
    float _1136 = _1132;
    float _1138 = _1130;
    if (_1088)
    {
        float _1140 = _1120 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        _1134 = _1142;
    }
    float _1144 = _1134;
    float _1146 = -_1074;
    float _1148 = -_1132;
    float _1150 = fma(_1054, _1146, _1148);
    if (_1088)
    {
        float _1152 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1136 = _1152;
    }
    float _1154 = _1136;
    float _1156 = _1128;
    float _1158 = _1154;
    if (_1088)
    {
        float _1160 = fma(_1128, _1154, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1156 = _1160;
    }
    float _1162 = _1156;
    float _1164 = _1162;
    if (!_1088)
    {
        _1158 = _1078;
    }
    float _1166 = _1158;
    float _1168 = _1166;
    if (_1088)
    {
        float _1170 = _1144 + (-1.0);
        _1138 = _1170;
    }
    float _1172 = _1138;
    float _1174 = _1172;
    if (_1088)
    {
        float _1176 = _1110 * _1162;
        _938 = _1176;
    }
    float _1178 = _938;
    if (!_1088)
    {
        _1112 = _1076;
    }
    float _1180 = _1112;
    float _1182 = _1180;
    if (_1088)
    {
        float _1184 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1100 = _1184;
    }
    float _1186 = _1100;
    if (_1088)
    {
        float _1188 = _1076 * _1178;
        _1182 = _1188;
    }
    float _1190 = _1182;
    if (!_1088)
    {
        _1164 = _1150;
    }
    float _1192 = _1164;
    float _1194 = _1192;
    if (_1088)
    {
        float _1196 = _1078 * _1178;
        _1168 = _1196;
    }
    float _1198 = _1168;
    if (_1088)
    {
        float _1200 = fma(_1150, _1144, _1186);
        _1194 = _1200;
    }
    float _1202 = _1194;
    if (_1088)
    {
        float _1204 = _1190 * _1190;
        _1102 = _1204;
    }
    float _1206 = _1102;
    if (!_1088)
    {
        _1174 = _1082;
    }
    float _1208 = _1174;
    float _1210 = _1208;
    if (_1088)
    {
        float _1212 = _1198 * _1198;
        _1210 = _1212;
    }
    float _1214 = _1210;
    float _1216 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1218 = fma(_1202, _1202, _1206);
    float _1220 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1222 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1216);
    float _1224 = _1218 + _1214;
    float _1226 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1228 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1230 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1228);
    float _1232 = precise::clamp(_1230, 0.0, 1.0);
    float _1234 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1222);
    float _1236 = rsqrt(_1224);
    float _1238 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1240 = -_1232;
    float _1242 = _1240 + 1.0;
    float _1244 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1226);
    float _1246 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1248 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1220);
    float _1250 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1238);
    float _1252 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1244);
    float _1254 = abs(_1242);
    float _1256 = log2(_1254);
    float _1258 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1248);
    float _1260 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1250);
    float _1262 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1264 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1266 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1268 = _1260 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1270 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1272 = _1236 * _1190;
    float _1274 = _1236 * _1202;
    float _1276 = _1236 * _1198;
    float _1278 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1270);
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1282 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1284 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1278);
    float _1286 = -_1280;
    float _1288 = fma(_1274, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1286);
    float _1290 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1292 = -_1282;
    float _1294 = fma(_1292, _1264, 1.0);
    float _1296 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1284);
    float _1298 = -_1276;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1288);
    float _1302 = exp2(_1290);
    float _1304 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1306 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1308 = fma(_1300, -0.5, 0.5);
    float _1310 = fma(_1300, 0.5, 0.5);
    float _1312 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1304);
    float _1314 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1306);
    float _1316 = log2(_1294);
    float _1318 = _1274 + 1.0;
    float _1320 = fma(_1310, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1322 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1312);
    float _1324 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1314);
    float _1326 = 1.0 / _1296;
    float _1328 = -_1274;
    float _1330 = fma(_1302, _1318, _1328);
    float _1332 = fma(_1310, _1320, -0.212114393711090087890625);
    float _1334 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1322);
    float _1336 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1324);
    float _1338 = fma(_1330, 0.5, 0.5);
    float _1340 = fma(_1310, _1332, 1.570728778839111328125);
    float _1342 = sqrt(_1308);
    float _1344 = _1316 * 0.693147182464599609375;
    float _1346 = _1344 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1348 = _1334 * _1326;
    float _1350 = _1336 * _1326;
    float _1352 = fma(_1348, 0.5, 0.5);
    float _1354 = fma(_1350, -0.5, 0.5);
    float _1356 = _1342 * 0.636619746685028076171875;
    float _1358 = -_1340;
    float _1360 = fma(_1356, _1358, 1.0);
    float3 _3689 = float3(_1352, _1354, _1346);
    float _1362 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3689, float3(0.0), isnan(_3689)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3689, float3(0.0), isnan(_3689)), level(0.0)).x;
    float3 _3700 = float3(_1352, _1354, _1346);
    float4 _1365 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3700, float3(0.0), isnan(_3700)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3700, float3(0.0), isnan(_3700)), level(0.0)).xyzw;
    float _1367 = _1365.x;
    float _1369 = _1365.y;
    float _1371 = _1365.z;
    float _1373 = _1365.w;
    float2 _3717 = float2(_1360, _1338);
    float3 _1377 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3717, float2(0.0), isnan(_3717)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3717, float2(0.0), isnan(_3717)), level(0.0)).xyz;
    float _1379 = _1377.x;
    float _1381 = _1377.y;
    float _1383 = _1377.z;
    float _1385 = _458 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1391 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1393 = isnan(0.5);
    bool _1395 = _1391 || _1393;
    bool _1397 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1399 = _1395 || _1397;
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1403 = _1401 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1405 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1385);
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1411 = 1.0 / _1389;
    float _1413 = _458 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1415 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1405);
    float _1417 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1413);
    float _1419 = 1.0 / _1403;
    float _1421 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1417);
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1423;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1427;
    bool _1431 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1433 = isnan(_412);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1439 = _1435 || _1437;
    float _1441 = float(_1439);
    float _1443 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1447 = _1445 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1449 = 1.0 / _1409;
    float _1451 = _1425 * _1411;
    bool _1453 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1455 = isnan(_412);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1461 = _1457 || _1459;
    float _1463 = float(_1461);
    float _1465 = _1429 * _1419;
    float _1467 = _1415 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1469 = -_1441;
    float _1471 = _1469 + 1.0;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1475 = _412 + _1473;
    float _1477 = 1.0 / _1467;
    float _1479 = _1443 + _1467;
    float _1481 = _1463 * _1471;
    float _1483 = -_1463;
    float _1485 = _1483 + 1.0;
    float _1487 = _1447 * _1449;
    float _1489 = _1449;
    float _1491 = _1479;
    if (!_1399)
    {
        _1489 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1493 = _1489;
    float _1495 = fma(_1451, _1475, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1499 = _412 + _1497;
    bool _1501 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1503 = isnan(_412);
    bool _1505 = _1501 || _1503;
    bool _1507 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1509 = _1505 || _1507;
    float _1511 = float(_1509);
    float _1513 = fma(_1487, _1499, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1515 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1517 = isnan(_412);
    bool _1519 = _1515 || _1517;
    bool _1521 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1523 = _1519 || _1521;
    float _1525 = float(_1523);
    float _1527 = _1511 * _1485;
    float _1529 = -_1511;
    float _1531 = _1529 + 1.0;
    float _1533 = _1479 * _1477;
    float _1535 = _1533 * 0.5;
    float _1537 = -_1525;
    float _1539 = _1537 + 1.0;
    float _1541 = _1495 * _1527;
    float _1543 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1545 = _412 + _1543;
    float _1547 = _1535;
    float _1549 = _1531;
    float _1551 = _1513;
    if (!_1399)
    {
        float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1555 = fma(_1535, _1493, _1553);
        _1491 = _1555;
    }
    float _1557 = _1491;
    if (!_1399)
    {
        _1547 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1559 = _1547;
    float _1561 = fma(_1531, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1541);
    float _1563 = fma(_1465, _1545, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1565 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1567 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1569 = _1557;
    float _1571 = _1565;
    if (!_1399)
    {
        float _1573 = 1.0 / _1557;
        _1569 = _1573;
    }
    float _1575 = _1569;
    if (!_1399)
    {
        float _1577 = -_1559;
        float _1579 = _1577 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1549 = _1579;
    }
    float _1581 = _1549;
    float _1583 = _1441 * _1539;
    float _1585 = fma(_1513, _1481, _1561);
    float _1587 = fma(_1563, _1583, _1585);
    float _1589 = _1465;
    if (!_1399)
    {
        float _1591 = 1.0 / _1581;
        _1589 = _1591;
    }
    float _1593 = _1589;
    float _1595 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1565);
    if (_1399)
    {
        _1571 = 1.0;
    }
    float _1597 = _1571;
    float _1599 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1587);
    float _1601 = _1599 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1603 = exp2(_1567);
    float _1605 = _1597;
    if (!_1399)
    {
        float _1607 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1609 = -_1559;
        float _1611 = fma(_1575, _1607, _1609);
        _1551 = _1611;
    }
    float _1613 = _1551;
    if (!_1399)
    {
        float _1615 = _1613 * _1593;
        float _1617 = precise::clamp(_1615, 0.0, 1.0);
        _1605 = _1617;
    }
    float _1619 = _1605;
    float _1621 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1595);
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1629 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1621);
    bool _1631 = _1619 > 0.0;
    bool _1633 = isnan(_1619);
    bool _1635 = _1631 || _1633;
    bool _1637 = isnan(0.0);
    bool _1639 = _1635 || _1637;
    float _1641 = _1619 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1643 = -_1603;
    float _1645 = _1643 + 1.0;
    float _1647 = _1629 + _1296;
    float _1649 = _1623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1651 = _1645 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1653 = _1647 * 0.5;
    float _1655 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1334;
    out.gl_Position.y = _1336;
    out.gl_Position.z = _1629;
    out.gl_Position.w = _1296;
    float _1657 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1659 = _1641 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_57.x = _1649;
    out.m_57.y = _1655;
    out.m_57.z = _1657;
    out.m_57.w = _1601;
    out.m_59.z = _1653;
    out.m_59.w = _1296;
    out.m_45.x = _1659;
    float _1661 = _1651 * _1362;
    float _1663 = -_1651;
    float _1665 = _1663 + 1.0;
    float _1667 = _1373 * _1661;
    float _1669 = _1383 * _1661;
    float _1671 = _1373 * _1665;
    float _1673 = fma(_1379, _1667, _1367);
    float _1675 = fma(_1381, _1667, _1369);
    float _1677 = fma(_1373, _1669, _1371);
    out.m_61.x = _1673;
    out.m_61.y = _1675;
    out.m_61.z = _1677;
    out.m_61.w = _1671;
    if (_1639)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1679 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1679;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _404 = false;
    bool _278 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_42.w;
    float _77 = trunc(_75);
    int _80 = int(_77);
    bool _84 = _80 >= 1;
    float _86 = 0.0;
    if (!_84)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _88 = _86;
    float _90 = _88;
    if (!_84)
    {
        out.m_45.x = 0.0;
    }
    int _92 = 0;
    if (!_84)
    {
        float _94 = _88 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_84)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1736 = as_type<float>(_96);
        out.gl_Position.z = _1736;
    }
    if (!_84)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _100 = in.m_47.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _116 = _114;
    if (_110)
    {
        float _118 = float(_80);
        _90 = _118;
    }
    float _120 = _90;
    bool _122 = _114 >= _120;
    bool _124 = !_110;
    bool _126 = _122 || _124;
    float _128 = _120;
    if (_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    if (_126)
    {
        out.m_45.x = 0.0;
    }
    if (_126)
    {
        float _132 = _130 * 5.0;
        _98 = as_type<int>(_132);
    }
    int _134 = _98;
    if (_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1806 = as_type<float>(_134);
        out.gl_Position.z = _1806;
    }
    if (_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_49.w;
    float _138 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _140 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _142 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _144 = _140 || _142;
    bool _146 = isnan(1.0);
    bool _148 = _144 || _146;
    float _150 = in.m_47.x;
    float _152 = in.m_47.y;
    float _154 = in.m_47.z;
    float _156 = in.m_42.x;
    float _158 = in.m_42.y;
    float _160 = in.m_42.z;
    float _162 = 0.0;
    float _164 = _138;
    if (!_148)
    {
        float _166 = _138 * _138;
        float _168 = _166 * 0.5;
        _162 = _168;
    }
    float _170 = _162;
    float _172 = _170;
    if (!_148)
    {
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _172 = _174;
    }
    float _176 = _172;
    bool _178 = !_148;
    float _180 = _176;
    if (!_178)
    {
        float _182 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _184 = log2(_182);
        float _186 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _188 = _186 + 1.0;
        float _190 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = _138 * _184;
        float _194 = 1.0 / _188;
        float _196 = _190 * 0.693147182464599609375;
        float _198 = exp2(_192);
        float _200 = 1.0 / _196;
        float _202 = _198 + (-1.0);
        float _204 = -_202;
        float _206 = fma(_204, _200, _138);
        float _208 = _206 * _194;
        float _210 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _210;
    }
    float _212 = _180;
    bool _214 = !_148;
    if (!_214)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = 1.0 / _222;
        float _226 = _138 * _218;
        float _228 = exp2(_226);
        float _230 = -_228;
        float _232 = _230 + 1.0;
        float _234 = _232 * _224;
        _164 = _234;
    }
    float _236 = _164;
    bool _238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _240 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _242 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _244 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _246 = fma(_236, _150, _240);
    float _248 = fma(_236, _152, _242);
    float _250 = fma(_236, _154, _244);
    float _252 = fma(_246, _136, _156);
    float _254 = fma(_248, _136, _158);
    float _256 = fma(_250, _136, _160);
    bool _258 = !_238;
    float _276;
    if (!_258)
    {
        float _260 = in.m_51.x;
        float _262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _264 = _260 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _268 = _266 * _262;
        float _270 = floor(_268);
        float _272 = -_270;
        float _274 = _268 + _272;
        _276 = _274;
        _278 = true;
    }
    else
    {
        float _280 = float(_80);
        float _282 = 1.0 / _280;
        float _284 = _114 * _282;
        _276 = _284;
    }
    _278 = false;
    float _286 = _276;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = _286 + _288;
    bool _292 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _294 = isnan(_286);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _304;
    float _308 = -_302;
    float _310 = _308 + 1.0;
    bool _312 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _314 = isnan(_286);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = 1.0 / _306;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _330;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _336 = _290 * _324;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _338;
    float _342 = in.m_49.x;
    float _344 = in.m_49.y;
    float _346 = in.m_49.z;
    float _348 = _322 * _310;
    float _350 = fma(_328, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _352 = fma(_340, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _354 = fma(_332, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _356 = -_322;
    float _358 = _356 + 1.0;
    float _360 = _350 * _348;
    float _362 = _352 * _348;
    float _364 = _354 * _348;
    float _366 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[143].x, _360);
    float _368 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[143].y, _362);
    float _370 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[143].z, _364);
    float _372 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[144].x, _366);
    float _374 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[144].y, _368);
    float _376 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[144].z, _370);
    float _378 = _372 * _342;
    float _380 = _374 * _344;
    float _382 = _376 * _346;
    bool _384 = !_334;
    float _402;
    if (!_384)
    {
        float _386 = in.m_51.x;
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _390 = _386 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _394 = _392 * _388;
        float _396 = floor(_394);
        float _398 = -_396;
        float _400 = _394 + _398;
        _402 = _400;
        _404 = true;
    }
    else
    {
        float _406 = float(_80);
        float _408 = 1.0 / _406;
        float _410 = _114 * _408;
        _402 = _410;
    }
    _404 = false;
    float _412 = _402;
    float _414 = in.m_51.x;
    float _416 = in.m_51.y;
    float _418 = in.m_51.z;
    float _420 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _422 = log2(_420);
    float _424 = _254 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _426 = _254 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _428 = _254 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _430 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[4].x, _424);
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _434 = _432 != 0;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _438 = _436 != 0;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _442 = _440 != 0;
    float _444 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[5].x, _426);
    float _446 = fma(_252, (*spvDescriptorSet0.vp_c10)._m0[6].x, _428);
    float _448 = _380 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _450 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].z, _444);
    float _452 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].z, _446);
    float _454 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _456 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _458 = _450 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _460 = _452 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _462 = _418 * 2.0;
    float _464 = _414 * 2.0;
    float _466 = _416 * 2.0;
    float _468 = _416 + _418;
    float _470 = floor(_464);
    float _472 = _468 + (-1.0);
    float _474 = floor(_462);
    float _476 = _422 * _114;
    float _478 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _480 = exp2(_476);
    bool _482 = _470 >= 0.0;
    bool _484 = isnan(_470);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    int _492 = _490 ? 0 : 1;
    bool _494 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _496 = isnan(0.0);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _502 = _498 || _500;
    float _504 = floor(_466);
    bool _506 = _474 > 0.0;
    bool _508 = _474 >= 0.0;
    bool _510 = isnan(_474);
    bool _512 = _508 || _510;
    bool _514 = isnan(0.0);
    bool _516 = _512 || _514;
    float _518 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].z, _430);
    int _520 = _516 ? 0 : 1;
    float _522 = -_480;
    float _524 = _522 + 1.0;
    bool _526 = _470 > 0.0;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _530 = 1.0 + _528;
    bool _532 = !_434;
    int _534 = _532 ? 0 : 1;
    float _536 = _518 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _538 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _540 = isnan(1.0);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _546 = _542 || _544;
    float _548 = 1.0 / _530;
    int _550 = abs(_534);
    float _552 = in.m_53.x;
    float _554 = in.m_53.y;
    float _556 = in.m_53.z;
    int _558 = ~_520;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    int _564 = _562;
    if (!_506)
    {
        int _566 = ~_520;
        int _568 = _566 + 1;
        _564 = _568;
    }
    int _570 = _564;
    float _572 = _416 + _414;
    bool _574 = _504 > 0.0;
    float _576 = _416 + (-0.5);
    bool _578 = _504 >= 0.0;
    bool _580 = isnan(_504);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    float _588 = _572 + (-1.0);
    float _590 = _502 ? _524 : 0.0;
    float _592 = float(_550);
    float _594 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _596 = float(_570);
    if (_546)
    {
        float _598 = _590 * _548;
        _116 = _598;
    }
    float _600 = _116;
    bool _602 = !_438;
    int _604 = _602 ? 0 : 1;
    int _606 = ~_492;
    int _608 = _606 + 1;
    int _610 = _608 + 1;
    float _612 = _592 * _596;
    int _614 = _586 ? 0 : 1;
    float _616 = _414 + (-0.5);
    int _618 = _610;
    if (!_526)
    {
        int _620 = ~_492;
        int _622 = _620 + 1;
        _618 = _622;
    }
    int _624 = _618;
    float _626 = _612 * (-2.0);
    int _628 = abs(_604);
    float _630 = -_458;
    float _632 = _630 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _634 = ~_614;
    int _636 = _634 + 1;
    int _638 = _636 + 1;
    float _640 = fma(_626, _552, _552);
    int _642 = _638;
    if (!_574)
    {
        int _644 = ~_614;
        int _646 = _644 + 1;
        _642 = _646;
    }
    int _648 = _642;
    float _650 = -_536;
    float _652 = _650 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _654 = !_442;
    int _656 = _654 ? 0 : 1;
    float _658 = _632 * _632;
    float _660 = float(_628);
    float _662 = fma(_594, _626, _594);
    float _664 = float(_624);
    float _666 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[196].x, _640);
    float _668 = -_460;
    float _670 = _668 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _672 = fma(_652, _652, _658);
    int _674 = abs(_656);
    float _676 = _660 * _664;
    float _678 = fma(_662, _600, _666);
    float _680 = fma(_670, _670, _672);
    float _682 = _676 * (-2.0);
    float _684 = _678 * 0.15915493667125701904296875;
    float _686 = float(_648);
    float _688 = _418 + _414;
    float _690 = float(_674);
    float _692 = rsqrt(_680);
    float _694 = fma(_682, _554, _554);
    float _696 = fma(_478, _682, _478);
    float _698 = _690 * _686;
    float _700 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[196].y, _694);
    float _702 = _688 + (-1.0);
    float _704 = _698 * (-2.0);
    float _706 = fma(_696, _600, _700);
    float _708 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _710 = _418 + (-0.5);
    float _712 = fma(_704, _556, _556);
    float _714 = _706 * 0.15915493667125701904296875;
    float _716 = fma(_708, _704, _708);
    float _718 = in.m_55.x;
    float _720 = in.m_55.y;
    float _722 = in.m_55.z;
    float _724 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[196].z, _712);
    float _726 = _652 * _692;
    float _728 = _684 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = _632 * _692;
    float _734 = fma(_716, _600, _724);
    float _736 = _670 * _692;
    float _738 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _740 = _726 * _738;
    float _742 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _744 = _732 * _742;
    float _746 = _734 * 0.15915493667125701904296875;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _750 = _736 * _748;
    float _752 = _684 * 6.283185482025146484375;
    float _754 = cos(_752);
    float _756 = _714 * 6.283185482025146484375;
    float _758 = sin(_756);
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _762 = -_740;
    float _764 = fma(_736, _760, _762);
    float _766 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _768 = -_750;
    float _770 = fma(_732, _766, _768);
    float _772 = _764 * _764;
    bool _774 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _776 = isnan(0.5);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _782 = _778 || _780;
    float _784 = _714 * 6.283185482025146484375;
    float _786 = cos(_784);
    float _788 = fma(_770, _770, _772);
    float _790 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _720);
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _718);
    float _794 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _722);
    float _796 = _448 * _790;
    float _798 = _454 * _792;
    float _800 = _746 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _806 = -_744;
    float _808 = fma(_726, _804, _806);
    float _810 = _754 * _758;
    float _812 = _456 * _794;
    float _814 = fma(_808, _808, _788);
    float _816 = _746 * 6.283185482025146484375;
    float _818 = cos(_816);
    float _820 = _730 * _786;
    float _822 = rsqrt(_814);
    float _824 = -_810;
    float _826 = fma(_802, _820, _824);
    float _828 = -_820;
    float _830 = fma(_802, _810, _828);
    float _832 = _730 * _758;
    float _834 = _754 * _786;
    float _836 = _818 * _796;
    float _838 = fma(_802, _834, _832);
    float _840 = _758 * _818;
    float _842 = _786 * _818;
    float _844 = _754 * _836;
    float _846 = -_796;
    float _848 = _802 * _846;
    float _850 = fma(_802, _832, _834);
    float _852 = _730 * _836;
    float _854 = _770 * _822;
    float _856 = fma(_838, _798, _844);
    float _858 = _764 * _822;
    float _860 = fma(_842, _798, _848);
    float _862 = _732 * _854;
    float _864 = _808 * _822;
    float _866 = fma(_830, _812, _856);
    float _868 = _736 * _858;
    float _870 = -_862;
    float _872 = fma(_726, _858, _870);
    float _874 = fma(_826, _798, _852);
    float _876 = fma(_840, _812, _860);
    float _878 = -_868;
    float _880 = fma(_732, _864, _878);
    float _882 = _872 * _866;
    float _884 = fma(_850, _812, _874);
    float _886 = _880 * _866;
    float _888 = fma(_864, _876, _882);
    float _890 = fma(_854, _876, _886);
    float _892 = fma(_736, _884, _888);
    float _894 = fma(_726, _884, _890);
    float _896 = _460 + _892;
    float _898 = _726 * _864;
    float _900 = _536 + _894;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _904 = _896 + _902;
    float _906 = -_898;
    float _908 = fma(_736, _854, _906);
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _912 = _900 + _910;
    float _914 = _904 * _904;
    float _916 = _908 * _866;
    float _918 = fma(_912, _912, _914);
    float _920 = fma(_858, _876, _916);
    float _922 = sqrt(_918);
    float _924 = fma(_732, _884, _920);
    float _926 = _458 + _924;
    bool _928 = _922 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _930 = _736;
    float _932 = _900;
    float _934 = _888;
    float _936 = _732;
    float _938 = _812;
    if (!_928)
    {
        _930 = _900;
    }
    float _940 = _930;
    float _942 = _940;
    if (!_928)
    {
        _932 = _896;
    }
    float _944 = _932;
    float _946 = _944;
    if (!_928)
    {
        _934 = _926;
    }
    float _948 = _934;
    bool _950 = !_928;
    float _952 = _948;
    if (!_950)
    {
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _956 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _958 = _922 + _956;
        float _960 = rsqrt(_918);
        float _962 = _958 * _954;
        float _964 = _926 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _966 = _962 * 0.15915493667125701904296875;
        float _968 = _966 * 6.283185482025146484375;
        float _970 = cos(_968);
        float _972 = _966 * 6.283185482025146484375;
        float _974 = sin(_972);
        float _976 = _970 + (-1.0);
        float _978 = fma(_974, _964, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _980 = _976 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _982 = _960 * _978;
        float _984 = fma(_926, _970, _980);
        float _986 = fma(_912, _982, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _988 = fma(_904, _982, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _946 = _988;
        _942 = _986;
        _952 = _984;
    }
    float _990 = _946;
    float _992 = _942;
    float _994 = _952;
    float _996 = _994;
    float _998 = _992;
    float _1000 = _990;
    if (!_782)
    {
        float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1004 = _458 + _1002;
        float _1006 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1008 = _536 + _1006;
        float _1010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1012 = -_460;
        float _1014 = _1012 + _990;
        float _1016 = _1004 * _1004;
        float _1018 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1020 = _460 + _1018;
        float _1022 = fma(_1008, _1008, _1016);
        float _1024 = -_536;
        float _1026 = _1024 + _992;
        float _1028 = fma(_1020, _1020, _1022);
        float _1030 = sqrt(_1028);
        float _1032 = precise::min(_1030, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1034 = _1032 * _1010;
        float _1036 = -_458;
        float _1038 = _1036 + _994;
        float _1040 = fma(_1026, _1034, _536);
        float _1042 = fma(_1038, _1034, _458);
        float _1044 = fma(_1014, _1034, _460);
        _996 = _1042;
        _998 = _1040;
        _1000 = _1044;
    }
    float _1046 = _996;
    float _1048 = _998;
    float _1050 = _1000;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1054 = _1046 + _1052;
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1058 = _1048 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1062 = _1050 + _1060;
    float _1064 = _1054 * _1054;
    float _1066 = fma(_1058, _1058, _1064);
    float _1068 = fma(_1062, _1062, _1066);
    float _1070 = rsqrt(_1068);
    float _1072 = sqrt(_1068);
    float _1074 = _1070 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1076 = _1058 * _1074;
    float _1078 = _1062 * _1074;
    float _1080 = _1076 * _1076;
    float _1082 = _1078 * _1078;
    float _1084 = _1080 + _1082;
    float _1086 = sqrt(_1084);
    bool _1088 = _1086 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1090 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1092 = _1086 + _1090;
    float _1094 = _1062;
    float _1096 = _1064;
    float _1098 = _1092;
    float _1100 = _1074;
    float _1102 = _1080;
    if (_1088)
    {
        float _1104 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1094 = _1104;
    }
    float _1106 = _1094;
    if (_1088)
    {
        float _1108 = rsqrt(_1084);
        _1096 = _1108;
    }
    float _1110 = _1096;
    float _1112 = _1110;
    if (_1088)
    {
        float _1114 = _1092 * _1106;
        _1098 = _1114;
    }
    float _1116 = _1098;
    if (_1088)
    {
        float _1118 = _1116 * 0.15915493667125701904296875;
        _936 = _1118;
    }
    float _1120 = _936;
    float _1122 = _904;
    if (_1088)
    {
        float _1124 = _1120 * 6.283185482025146484375;
        float _1126 = sin(_1124);
        _1122 = _1126;
    }
    float _1128 = _1122;
    float _1130 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1132 = precise::max(0.0, _1130);
    float _1134 = _1070;
    float _1136 = _1132;
    float _1138 = _1130;
    if (_1088)
    {
        float _1140 = _1120 * 6.283185482025146484375;
        float _1142 = cos(_1140);
        _1134 = _1142;
    }
    float _1144 = _1134;
    float _1146 = -_1074;
    float _1148 = -_1132;
    float _1150 = fma(_1054, _1146, _1148);
    if (_1088)
    {
        float _1152 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1136 = _1152;
    }
    float _1154 = _1136;
    float _1156 = _1128;
    float _1158 = _1154;
    if (_1088)
    {
        float _1160 = fma(_1128, _1154, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1156 = _1160;
    }
    float _1162 = _1156;
    float _1164 = _1162;
    if (!_1088)
    {
        _1158 = _1078;
    }
    float _1166 = _1158;
    float _1168 = _1166;
    if (_1088)
    {
        float _1170 = _1144 + (-1.0);
        _1138 = _1170;
    }
    float _1172 = _1138;
    float _1174 = _1172;
    if (_1088)
    {
        float _1176 = _1110 * _1162;
        _938 = _1176;
    }
    float _1178 = _938;
    if (!_1088)
    {
        _1112 = _1076;
    }
    float _1180 = _1112;
    float _1182 = _1180;
    if (_1088)
    {
        float _1184 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1100 = _1184;
    }
    float _1186 = _1100;
    if (_1088)
    {
        float _1188 = _1076 * _1178;
        _1182 = _1188;
    }
    float _1190 = _1182;
    if (!_1088)
    {
        _1164 = _1150;
    }
    float _1192 = _1164;
    float _1194 = _1192;
    if (_1088)
    {
        float _1196 = _1078 * _1178;
        _1168 = _1196;
    }
    float _1198 = _1168;
    if (_1088)
    {
        float _1200 = fma(_1150, _1144, _1186);
        _1194 = _1200;
    }
    float _1202 = _1194;
    if (_1088)
    {
        float _1204 = _1190 * _1190;
        _1102 = _1204;
    }
    float _1206 = _1102;
    if (!_1088)
    {
        _1174 = _1082;
    }
    float _1208 = _1174;
    float _1210 = _1208;
    if (_1088)
    {
        float _1212 = _1198 * _1198;
        _1210 = _1212;
    }
    float _1214 = _1210;
    float _1216 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1218 = fma(_1202, _1202, _1206);
    float _1220 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1222 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1216);
    float _1224 = _1218 + _1214;
    float _1226 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1228 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1230 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1228);
    float _1232 = precise::clamp(_1230, 0.0, 1.0);
    float _1234 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1222);
    float _1236 = rsqrt(_1224);
    float _1238 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1240 = -_1232;
    float _1242 = _1240 + 1.0;
    float _1244 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1226);
    float _1246 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1248 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1220);
    float _1250 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1238);
    float _1252 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1244);
    float _1254 = abs(_1242);
    float _1256 = log2(_1254);
    float _1258 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1248);
    float _1260 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1250);
    float _1262 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1264 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1266 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1268 = _1260 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1270 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1272 = _1236 * _1190;
    float _1274 = _1236 * _1202;
    float _1276 = _1236 * _1198;
    float _1278 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1270);
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1282 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1284 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1278);
    float _1286 = -_1280;
    float _1288 = fma(_1274, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1286);
    float _1290 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1292 = -_1282;
    float _1294 = fma(_1292, _1264, 1.0);
    float _1296 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1284);
    float _1298 = -_1276;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1288);
    float _1302 = exp2(_1290);
    float _1304 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1306 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1308 = fma(_1300, -0.5, 0.5);
    float _1310 = fma(_1300, 0.5, 0.5);
    float _1312 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1304);
    float _1314 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1306);
    float _1316 = log2(_1294);
    float _1318 = _1274 + 1.0;
    float _1320 = fma(_1310, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1322 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1312);
    float _1324 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1314);
    float _1326 = 1.0 / _1296;
    float _1328 = -_1274;
    float _1330 = fma(_1302, _1318, _1328);
    float _1332 = fma(_1310, _1320, -0.212114393711090087890625);
    float _1334 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1322);
    float _1336 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1324);
    float _1338 = fma(_1330, 0.5, 0.5);
    float _1340 = fma(_1310, _1332, 1.570728778839111328125);
    float _1342 = sqrt(_1308);
    float _1344 = _1316 * 0.693147182464599609375;
    float _1346 = _1344 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1348 = _1334 * _1326;
    float _1350 = _1336 * _1326;
    float _1352 = fma(_1348, 0.5, 0.5);
    float _1354 = fma(_1350, -0.5, 0.5);
    float _1356 = _1342 * 0.636619746685028076171875;
    float _1358 = -_1340;
    float _1360 = fma(_1356, _1358, 1.0);
    float3 _3689 = float3(_1352, _1354, _1346);
    float _1362 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3689, float3(0.0), isnan(_3689)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3689, float3(0.0), isnan(_3689)), level(0.0)).x;
    float3 _3700 = float3(_1352, _1354, _1346);
    float4 _1365 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3700, float3(0.0), isnan(_3700)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3700, float3(0.0), isnan(_3700)), level(0.0)).xyzw;
    float _1367 = _1365.x;
    float _1369 = _1365.y;
    float _1371 = _1365.z;
    float _1373 = _1365.w;
    float2 _3717 = float2(_1360, _1338);
    float3 _1377 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3717, float2(0.0), isnan(_3717)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3717, float2(0.0), isnan(_3717)), level(0.0)).xyz;
    float _1379 = _1377.x;
    float _1381 = _1377.y;
    float _1383 = _1377.z;
    float _1385 = _458 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1391 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1393 = isnan(0.5);
    bool _1395 = _1391 || _1393;
    bool _1397 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1399 = _1395 || _1397;
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1403 = _1401 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1405 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1385);
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1411 = 1.0 / _1389;
    float _1413 = _458 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1415 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1405);
    float _1417 = fma(_536, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1413);
    float _1419 = 1.0 / _1403;
    float _1421 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1417);
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1423;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1427;
    bool _1431 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1433 = isnan(_412);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1439 = _1435 || _1437;
    float _1441 = float(_1439);
    float _1443 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1447 = _1445 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1449 = 1.0 / _1409;
    float _1451 = _1425 * _1411;
    bool _1453 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1455 = isnan(_412);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1461 = _1457 || _1459;
    float _1463 = float(_1461);
    float _1465 = _1429 * _1419;
    float _1467 = _1415 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1469 = -_1441;
    float _1471 = _1469 + 1.0;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1475 = _412 + _1473;
    float _1477 = 1.0 / _1467;
    float _1479 = _1443 + _1467;
    float _1481 = _1463 * _1471;
    float _1483 = -_1463;
    float _1485 = _1483 + 1.0;
    float _1487 = _1447 * _1449;
    float _1489 = _1449;
    float _1491 = _1479;
    if (!_1399)
    {
        _1489 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1493 = _1489;
    float _1495 = fma(_1451, _1475, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1499 = _412 + _1497;
    bool _1501 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1503 = isnan(_412);
    bool _1505 = _1501 || _1503;
    bool _1507 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1509 = _1505 || _1507;
    float _1511 = float(_1509);
    float _1513 = fma(_1487, _1499, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1515 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1517 = isnan(_412);
    bool _1519 = _1515 || _1517;
    bool _1521 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1523 = _1519 || _1521;
    float _1525 = float(_1523);
    float _1527 = _1511 * _1485;
    float _1529 = -_1511;
    float _1531 = _1529 + 1.0;
    float _1533 = _1479 * _1477;
    float _1535 = _1533 * 0.5;
    float _1537 = -_1525;
    float _1539 = _1537 + 1.0;
    float _1541 = _1495 * _1527;
    float _1543 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1545 = _412 + _1543;
    float _1547 = _1535;
    float _1549 = _1531;
    float _1551 = _1513;
    if (!_1399)
    {
        float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1555 = fma(_1535, _1493, _1553);
        _1491 = _1555;
    }
    float _1557 = _1491;
    if (!_1399)
    {
        _1547 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1559 = _1547;
    float _1561 = fma(_1531, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1541);
    float _1563 = fma(_1465, _1545, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1565 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1567 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1569 = _1557;
    float _1571 = _1565;
    if (!_1399)
    {
        float _1573 = 1.0 / _1557;
        _1569 = _1573;
    }
    float _1575 = _1569;
    if (!_1399)
    {
        float _1577 = -_1559;
        float _1579 = _1577 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1549 = _1579;
    }
    float _1581 = _1549;
    float _1583 = _1441 * _1539;
    float _1585 = fma(_1513, _1481, _1561);
    float _1587 = fma(_1563, _1583, _1585);
    float _1589 = _1465;
    if (!_1399)
    {
        float _1591 = 1.0 / _1581;
        _1589 = _1591;
    }
    float _1593 = _1589;
    float _1595 = fma(_1266, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1565);
    if (_1399)
    {
        _1571 = 1.0;
    }
    float _1597 = _1571;
    float _1599 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1587);
    float _1601 = _1599 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1603 = exp2(_1567);
    float _1605 = _1597;
    if (!_1399)
    {
        float _1607 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1609 = -_1559;
        float _1611 = fma(_1575, _1607, _1609);
        _1551 = _1611;
    }
    float _1613 = _1551;
    if (!_1399)
    {
        float _1615 = _1613 * _1593;
        float _1617 = precise::clamp(_1615, 0.0, 1.0);
        _1605 = _1617;
    }
    float _1619 = _1605;
    float _1621 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1595);
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1629 = fma(_1268, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1621);
    bool _1631 = _1619 > 0.0;
    bool _1633 = isnan(_1619);
    bool _1635 = _1631 || _1633;
    bool _1637 = isnan(0.0);
    bool _1639 = _1635 || _1637;
    float _1641 = _1619 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1643 = -_1603;
    float _1645 = _1643 + 1.0;
    float _1647 = _1629 + _1296;
    float _1649 = _1623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1651 = _1645 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1653 = _1647 * 0.5;
    float _1655 = _1625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1334;
    out.gl_Position.y = _1336;
    out.gl_Position.z = _1629;
    out.gl_Position.w = _1296;
    float _1657 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1659 = _1641 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_57.x = _1649;
    out.m_57.y = _1655;
    out.m_57.z = _1657;
    out.m_57.w = _1601;
    out.m_59.z = _1653;
    out.m_59.w = _1296;
    out.m_45.x = _1659;
    float _1661 = _1651 * _1362;
    float _1663 = -_1651;
    float _1665 = _1663 + 1.0;
    float _1667 = _1373 * _1661;
    float _1669 = _1383 * _1661;
    float _1671 = _1373 * _1665;
    float _1673 = fma(_1379, _1667, _1367);
    float _1675 = fma(_1381, _1667, _1369);
    float _1677 = fma(_1373, _1669, _1371);
    out.m_61.x = _1673;
    out.m_61.y = _1675;
    out.m_61.z = _1677;
    out.m_61.w = _1671;
    if (_1639)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1679 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1679;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

