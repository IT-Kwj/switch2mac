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
    float4 m_65 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _552 = false;
    bool _374 = false;
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
        float _2194 = as_type<float>(_106);
        out.gl_Position.z = _2194;
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
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2264 = as_type<float>(_144);
        out.gl_Position.z = _2264;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_49.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _124 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _152 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    int _164 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _166 = _164 != 0;
    float _168 = _150 * _148;
    float _170 = 0.0;
    float _172 = _152;
    if (!_162)
    {
        float _174 = _152 * _152;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    float _182 = _178;
    if (!_162)
    {
        float _184 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    float _188 = in.m_47.x;
    float _190 = in.m_47.y;
    float _192 = in.m_47.z;
    float _194 = _180 * 6.283185482025146484375;
    float _196 = floor(_180);
    float _198 = _194 * 0.15915493667125701904296875;
    float _200 = _198 * 6.283185482025146484375;
    float _202 = cos(_200);
    float _204 = -_196;
    float _206 = _180 + _204;
    bool _208 = !_162;
    float _210 = _186;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _152 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _152);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_162;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _152 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _172 = _264;
    }
    float _266 = _172;
    float _268 = in.m_51.w;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _276 = _274 != 0;
    float _278 = in.m_42.x;
    float _280 = in.m_42.y;
    float _282 = in.m_42.z;
    float _284 = -_206;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _288 = _206 < 0.5;
    float _290 = float(_288);
    bool _292 = !_272;
    int _294 = _292 ? 0 : 1;
    float _296 = fma(_202, 0.5, 0.5);
    bool _298 = !_166;
    int _300 = _298 ? 0 : 1;
    float _302 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _304 = abs(_294);
    float _306 = -_290;
    float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _310 = -_296;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _314 = fma(_266, _188, _302);
    int _316 = abs(_300);
    float _318 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _320 = !_276;
    int _322 = _320 ? 0 : 1;
    float _324 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _326 = fma(_266, _190, _318);
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _330 = fma(_266, _192, _324);
    int _332 = abs(_322);
    float _334 = float(_304);
    float _336 = fma(_314, _268, _278);
    float _338 = float(_316);
    float _340 = fma(_326, _268, _280);
    float _342 = abs(_286);
    float _344 = _334 * _342;
    float _346 = fma(_330, _268, _282);
    float _348 = float(_332);
    float _350 = fma(_338, _312, _344);
    float _352 = abs(_308);
    float _354 = fma(_348, _352, _350);
    bool _356 = !_328;
    float _372;
    if (!_356)
    {
        float _358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _360 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _362 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _364 = _362 * _358;
        float _366 = floor(_364);
        float _368 = -_366;
        float _370 = _364 + _368;
        _372 = _370;
        _374 = true;
    }
    else
    {
        float _376 = float(_90);
        float _378 = 1.0 / _376;
        float _380 = _124 * _378;
        _372 = _380;
    }
    _374 = false;
    float _382 = _372;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _386 = _382 + _384;
    bool _388 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _390 = isnan(_382);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _402 = _382 + _400;
    bool _404 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _406 = isnan(_382);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _424 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _426 = isnan(_382);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -_398;
    float _438 = _436 + 1.0;
    float _440 = 1.0 / _422;
    float _442 = _434 * _438;
    float _444 = -_434;
    float _446 = _444 + 1.0;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _448;
    bool _452 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _454 = 1.0 / _418;
    float _456 = _414 * _446;
    float _458 = -_414;
    float _460 = _458 + 1.0;
    float _462 = _402 * _440;
    float _464 = _386 * _454;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _470;
    float _474 = fma(_450, _464, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _476 = fma(_468, _464, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _478 = fma(_472, _464, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _480 = in.m_51.x;
    float _482 = in.m_51.y;
    float _484 = in.m_51.z;
    float _486 = _474 * _456;
    float _488 = _476 * _456;
    float _490 = _478 * _456;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _504 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].x, _486);
    float _506 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].y, _488);
    float _508 = fma(_494, _462, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = fma(_498, _462, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _512 = fma(_502, _462, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _514 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].z, _490);
    float _516 = fma(_508, _442, _504);
    float _518 = fma(_510, _442, _506);
    float _520 = fma(_512, _442, _514);
    float _522 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[145].x, _516);
    float _524 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[145].y, _518);
    float _526 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[145].z, _520);
    float _528 = _522 * _480;
    float _530 = _524 * _482;
    float _532 = _526 * _484;
    bool _534 = !_452;
    float _550;
    if (!_534)
    {
        float _536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _538 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _542 = _540 * _536;
        float _544 = floor(_542);
        float _546 = -_544;
        float _548 = _542 + _546;
        _550 = _548;
        _552 = true;
    }
    else
    {
        float _554 = float(_90);
        float _556 = 1.0 / _554;
        float _558 = _124 * _556;
        _550 = _558;
    }
    _552 = false;
    float _560 = _550;
    float _562 = in.m_49.z;
    float _564 = _340 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _568 = _566 != 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _576 = _574 != 0;
    float _578 = in.m_49.y;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _582 = _580 != 0;
    float _584 = _340 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _586 = _340 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _588 = _146 * 2.0;
    float _590 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[5].x, _564);
    float _592 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[4].x, _584);
    float _594 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[6].x, _586);
    float _596 = floor(_588);
    float _598 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _600 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[6].z, _594);
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _606 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[4].z, _592);
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _610 = !_568;
    int _612 = _610 ? 0 : 1;
    float _614 = _562 * 2.0;
    float _616 = -_604;
    float _618 = fma(_598, 2.0, _616);
    float _620 = _598;
    if (!_582)
    {
        _620 = _562;
    }
    float _622 = _620;
    float _624 = _606 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _626 = _578 * 2.0;
    float _628 = _578 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _630 = floor(_614);
    float _632 = _578 + _562;
    bool _634 = _596 > 0.0;
    float _636 = fma(_628, -2.0, _602);
    float _638 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[5].z, _590);
    bool _640 = _596 >= 0.0;
    bool _642 = isnan(_596);
    bool _644 = _640 || _642;
    bool _646 = isnan(0.0);
    bool _648 = _644 || _646;
    float _650 = _632 + (-1.0);
    float _652 = floor(_626);
    float _654 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _636);
    bool _656 = !_572;
    int _658 = _656 ? 0 : 1;
    float _660 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _662 = _648 ? 0 : 1;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _666 = -_124;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[76].x, _618);
    float _670 = _626;
    float _672 = _632;
    float _674 = _622;
    if (!_582)
    {
        _670 = _578;
    }
    float _676 = _670;
    float _678 = _600 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _680 = _676;
    if (_582)
    {
        _680 = _146;
    }
    float _682 = _680;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _686 = _630 > 0.0;
    float _688 = -_624;
    float _690 = _688 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _692 = _630 >= 0.0;
    bool _694 = isnan(_630);
    bool _696 = _692 || _694;
    bool _698 = isnan(0.0);
    bool _700 = _696 || _698;
    float _702 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[83].z, _664);
    float _704 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _706 = log2(_704);
    bool _708 = _686;
    if (!_582)
    {
        _672 = _562;
    }
    float _710 = _672;
    float _712 = _682 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _714 = _710;
    if (_582)
    {
        _674 = _578;
    }
    float _716 = _674;
    float _718 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _702);
    if (_582)
    {
        _714 = _578;
    }
    float _720 = _714;
    float _722 = -_684;
    float _724 = fma(_712, 2.0, _722);
    bool _726 = _652 > 0.0;
    float _728 = _716 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _730 = _652 >= 0.0;
    bool _732 = isnan(_652);
    bool _734 = _730 || _732;
    bool _736 = isnan(0.0);
    bool _738 = _734 || _736;
    float _740 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[83].w, _608);
    int _742 = ~_662;
    int _744 = _742 + 1;
    int _746 = _744 + 1;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _750 = abs(_658);
    float _752 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _740);
    int _754 = _746;
    if (!_634)
    {
        int _756 = ~_662;
        int _758 = _756 + 1;
        _754 = _758;
    }
    int _760 = _754;
    float _762 = _706 * _124;
    float _764 = float(_750);
    float _766 = -_124;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[81].x, _724);
    float _770 = float(_760);
    float _772 = fma(_728, -2.0, _748);
    int _774 = _700 ? 0 : 1;
    float _776 = exp2(_762);
    float _778 = _764 * _770;
    float _780 = in.m_53.x;
    float _782 = in.m_53.y;
    float _784 = in.m_53.z;
    int _786 = ~_774;
    int _788 = _786 + 1;
    int _790 = _788 + 1;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _794 = 1.0 + _792;
    int _796 = _790;
    if (!_686)
    {
        int _798 = ~_774;
        int _800 = _798 + 1;
        _796 = _800;
    }
    int _802 = _796;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _806 = abs(_612);
    float _808 = 1.0 / _794;
    int _810 = _738 ? 0 : 1;
    float _812 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _804);
    float _814 = float(_802);
    float _816 = _778 * (-2.0);
    int _818 = ~_810;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    float _824 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _812);
    float _826 = -_776;
    float _828 = _826 + 1.0;
    int _830 = _822;
    if (!_726)
    {
        int _832 = ~_810;
        int _834 = _832 + 1;
        _830 = _834;
    }
    int _836 = _830;
    float _838 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _772);
    float _840 = _578 + (-0.5);
    float _842 = float(_806);
    float _844 = -_678;
    float _846 = _844 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _848 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _850 = isnan(1.0);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _856 = _852 || _854;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _860 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _868 = _864 || _866;
    float _870 = _842 * _814;
    float _872 = _638 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _874 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[78].w, _858);
    float _876 = _868 ? _828 : 0.0;
    float _878 = fma(_816, _782, _782);
    float _880 = -_872;
    float _882 = _880 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _884 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _874);
    float _886 = fma(_660, _816, _660);
    float _888 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[196].y, _878);
    float _890 = _882 * _882;
    float _892 = _872;
    if (_856)
    {
        float _894 = _876 * _808;
        _126 = _894;
    }
    float _896 = _126;
    bool _898 = !_576;
    int _900 = _898 ? 0 : 1;
    float _902 = _870 * (-2.0);
    float _904 = fma(_690, _690, _890);
    float _906 = fma(_886, _896, _888);
    int _908 = abs(_900);
    float _910 = _146 + _578;
    float _912 = fma(_846, _846, _904);
    float _914 = _906 * 0.15915493667125701904296875;
    float _916 = _910 + (-1.0);
    float _918 = float(_908);
    float _920 = fma(_902, _780, _780);
    float _922 = float(_836);
    float _924 = rsqrt(_912);
    float _926 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _928 = _146 + (-0.5);
    float _930 = _146 + _562;
    float _932 = _918 * _922;
    float _934 = fma(_926, _902, _926);
    float _936 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[196].x, _920);
    float _938 = _930 + (-1.0);
    float _940 = _932 * (-2.0);
    float _942 = fma(_934, _896, _936);
    float _944 = _914 * 6.283185482025146484375;
    float _946 = sin(_944);
    float _948 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _950 = fma(_940, _784, _784);
    float _952 = _562 + (-0.5);
    float _954 = _942 * 0.15915493667125701904296875;
    float _956 = fma(_948, _940, _948);
    float _958 = _690 * _924;
    float _960 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[196].z, _950);
    float _962 = _846 * _924;
    float _964 = in.m_55.x;
    float _966 = in.m_55.y;
    float _968 = in.m_55.z;
    float _970 = _882 * _924;
    float _972 = fma(_956, _896, _960);
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _976 = _958 * _974;
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _980 = _962 * _978;
    float _982 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _984 = _970 * _982;
    float _986 = _972 * 0.15915493667125701904296875;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _990 = -_976;
    float _992 = fma(_962, _988, _990);
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _996 = -_980;
    float _998 = fma(_970, _994, _996);
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1002 = -_984;
    float _1004 = fma(_958, _1000, _1002);
    float _1006 = _914 * 6.283185482025146484375;
    float _1008 = cos(_1006);
    float _1010 = _992 * _992;
    float _1012 = _354 * _528;
    float _1014 = _354 * _530;
    float _1016 = _354 * _532;
    float _1018 = fma(_998, _998, _1010);
    float _1020 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1022 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1024 = _954 * 6.283185482025146484375;
    float _1026 = sin(_1024);
    float _1028 = fma(_1004, _1004, _1018);
    float _1030 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1032 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1034 = isnan(0.5);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1040 = _1036 || _1038;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _964);
    float _1044 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _966);
    float _1046 = _954 * 6.283185482025146484375;
    float _1048 = cos(_1046);
    float _1050 = _1020 * _1042;
    float _1052 = _1022 * _1044;
    float _1054 = _986 * 6.283185482025146484375;
    float _1056 = cos(_1054);
    float _1058 = _1026 * _1008;
    float _1060 = _1026 * _946;
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _968);
    float _1064 = _1030 * _1062;
    float _1066 = _986 * 6.283185482025146484375;
    float _1068 = sin(_1066);
    float _1070 = _1048 * _946;
    float _1072 = _1048 * _1008;
    float _1074 = rsqrt(_1028);
    float _1076 = _1048 * _1056;
    float _1078 = _1026 * _1056;
    float _1080 = _1008 * _1056;
    float _1082 = _946 * _1056;
    float _1084 = -_1070;
    float _1086 = fma(_1068, _1058, _1084);
    float _1088 = -_1058;
    float _1090 = fma(_1068, _1070, _1088);
    float _1092 = fma(_1068, _1072, _1060);
    float _1094 = _1076 * _1052;
    float _1096 = -_1052;
    float _1098 = _1068 * _1096;
    float _1100 = fma(_1068, _1060, _1072);
    float _1102 = _1078 * _1052;
    float _1104 = fma(_1092, _1050, _1094);
    float _1106 = _998 * _1074;
    float _1108 = _992 * _1074;
    float _1110 = fma(_1080, _1050, _1098);
    float _1112 = _1004 * _1074;
    float _1114 = _970 * _1106;
    float _1116 = _962 * _1108;
    float _1118 = fma(_1086, _1050, _1102);
    float _1120 = _872 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1122 = -_1114;
    float _1124 = fma(_958, _1108, _1122);
    float _1126 = fma(_1090, _1064, _1104);
    float _1128 = -_1116;
    float _1130 = fma(_970, _1112, _1128);
    float _1132 = fma(_1082, _1064, _1110);
    float _1134 = fma(_1100, _1064, _1118);
    float _1136 = _1124 * _1126;
    float _1138 = _1130 * _1126;
    float _1140 = fma(_1112, _1132, _1136);
    float _1142 = fma(_1106, _1132, _1138);
    float _1144 = fma(_962, _1134, _1140);
    float _1146 = fma(_958, _1134, _1142);
    float _1148 = _678 + _1144;
    float _1150 = _624 + _1146;
    float _1152 = _872 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1154 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1156 = _1148 + _1154;
    float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1160 = _1150 + _1158;
    float _1162 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1152);
    float _1164 = _958 * _1112;
    float _1166 = _1156 * _1156;
    float _1168 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1120);
    float _1170 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1162);
    float _1172 = -_1164;
    float _1174 = fma(_962, _1106, _1172);
    float _1176 = fma(_1160, _1160, _1166);
    float _1178 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1168);
    float _1180 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1182 = _1174 * _1126;
    float _1184 = sqrt(_1176);
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1188 = fma(_1108, _1132, _1182);
    float _1190 = _1186 + _1180;
    float _1192 = fma(_970, _1134, _1188);
    float _1194 = 1.0 / _1180;
    float _1196 = _872 + _1192;
    float _1198 = _1192;
    float _1200 = _1132;
    float _1202 = _1126;
    int _1204 = as_type<int>(_966);
    int _1206 = as_type<int>(_968);
    if (_1040)
    {
        _1198 = 1.0;
    }
    float _1208 = _1198;
    bool _1210 = _1184 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = _1190 * _1194;
    float _1214 = _1212 * 0.5;
    float _1216 = _1184;
    float _1218 = _1208;
    if (!_1210)
    {
        _1200 = _1150;
    }
    float _1220 = _1200;
    float _1222 = _1220;
    if (!_1210)
    {
        _892 = _1148;
    }
    float _1224 = _892;
    float _1226 = _1224;
    if (!_1210)
    {
        _1202 = _1196;
    }
    float _1228 = _1202;
    bool _1230 = !_1210;
    float _1232 = _1228;
    if (!_1230)
    {
        float _1234 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1238 = _1184 + _1236;
        float _1240 = _1196 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1242 = rsqrt(_1176);
        float _1244 = _1238 * _1234;
        float _1246 = _1244 * 0.15915493667125701904296875;
        float _1248 = _1246 * 6.283185482025146484375;
        float _1250 = cos(_1248);
        float _1252 = _1246 * 6.283185482025146484375;
        float _1254 = sin(_1252);
        float _1256 = _1250 + (-1.0);
        float _1258 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1260 = fma(_1254, _1240, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1262 = fma(_1196, _1250, _1258);
        float _1264 = _1242 * _1260;
        float _1266 = fma(_1160, _1264, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1268 = fma(_1156, _1264, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1232 = _1262;
        _1222 = _1266;
        _1226 = _1268;
        _1216 = _1264;
    }
    float _1270 = _1232;
    float _1272 = _1222;
    float _1274 = _1226;
    float _1276 = _1216;
    float _1278 = _1276;
    if (!_1040)
    {
        float _1280 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1282 = _1280 * 0.15915493667125701904296875;
        float _1284 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1288 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1286);
        float _1290 = _1282 * 6.283185482025146484375;
        float _1292 = cos(_1290);
        float _1294 = _1284 * 0.15915493667125701904296875;
        float _1296 = _1282 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        float _1300 = 1.0 / _1292;
        float _1302 = _1294 * 6.283185482025146484375;
        float _1304 = cos(_1302);
        float _1306 = _1298 * _1300;
        float _1308 = _1294 * 6.283185482025146484375;
        float _1310 = sin(_1308);
        float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1314 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1312;
        float _1316 = _1304 * _1306;
        float _1318 = 1.0 / _1288;
        float _1320 = 1.0 / _1316;
        float _1322 = 1.0 / _1314;
        float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1326 = _1318 * _1324;
        float _1328 = _1310 * _1320;
        float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1332 = fma(_1328, _1326, _1330);
        float _1334 = _1332 * _1322;
        float _1336 = precise::clamp(_1334, 0.0, 1.0);
        _1278 = _1322;
        _1218 = _1336;
    }
    float _1338 = _1278;
    float _1340 = _1218;
    float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1344 = _1270 + _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1348 = _1272 + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1352 = _1274 + _1350;
    float _1354 = _1344 * _1344;
    float _1356 = fma(_1348, _1348, _1354);
    float _1358 = fma(_1352, _1352, _1356);
    float _1360 = rsqrt(_1358);
    float _1362 = sqrt(_1358);
    float _1364 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1366 = _1348 * _1364;
    float _1368 = _1352 * _1364;
    float _1370 = _1366 * _1366;
    float _1372 = _1368 * _1368;
    float _1374 = _1370 + _1372;
    float _1376 = sqrt(_1374);
    bool _1378 = _1376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1382 = _1376 + _1380;
    float _1384 = _1352;
    float _1386 = _1374;
    float _1388 = _1382;
    float _1390 = _1338;
    float _1392 = _1344;
    if (_1378)
    {
        float _1394 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1384 = _1394;
    }
    float _1396 = _1384;
    if (_1378)
    {
        float _1398 = rsqrt(_1374);
        _1386 = _1398;
    }
    float _1400 = _1386;
    if (_1378)
    {
        float _1402 = _1382 * _1396;
        _1388 = _1402;
    }
    float _1404 = _1388;
    if (_1378)
    {
        float _1406 = _1404 * 0.15915493667125701904296875;
        _1390 = _1406;
    }
    float _1408 = _1390;
    float _1410 = _1354;
    float _1412 = _1408;
    if (_1378)
    {
        float _1414 = _1408 * 6.283185482025146484375;
        float _1416 = sin(_1414);
        _1410 = _1416;
    }
    float _1418 = _1410;
    float _1420 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1422 = precise::max(0.0, _1420);
    float _1424 = _1360;
    float _1426 = _1422;
    float _1428 = _1420;
    if (_1378)
    {
        float _1430 = _1408 * 6.283185482025146484375;
        float _1432 = cos(_1430);
        _1424 = _1432;
    }
    float _1434 = _1424;
    float _1436 = -_1364;
    float _1438 = -_1422;
    float _1440 = fma(_1344, _1436, _1438);
    if (!_1378)
    {
        _1426 = _1366;
    }
    float _1442 = _1426;
    float _1444 = _1442;
    if (_1378)
    {
        float _1446 = _1440 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1428 = _1446;
    }
    float _1448 = _1428;
    float _1450 = _1418;
    float _1452 = _1448;
    if (_1378)
    {
        float _1454 = fma(_1418, _1448, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1450 = _1454;
    }
    float _1456 = _1450;
    float _1458 = _1456;
    if (!_1378)
    {
        _1452 = _1440;
    }
    float _1460 = _1452;
    float _1462 = _1460;
    float _1464 = _1434;
    if (_1378)
    {
        float _1466 = _1434 + (-1.0);
        _1392 = _1466;
    }
    float _1468 = _1392;
    float _1470 = 0.0;
    float _1472 = _1468;
    if (_1378)
    {
        float _1474 = _1400 * _1456;
        _1470 = _1474;
    }
    float _1476 = _1470;
    if (!_1378)
    {
        _1458 = _1370;
    }
    float _1478 = _1458;
    float _1480 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1482 = _1478;
    if (_1378)
    {
        float _1484 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1412 = _1484;
    }
    float _1486 = _1412;
    if (_1378)
    {
        float _1488 = _1366 * _1476;
        _1444 = _1488;
    }
    float _1490 = _1444;
    if (!_1378)
    {
        _1472 = _1368;
    }
    float _1492 = _1472;
    float _1494 = _1492;
    if (_1378)
    {
        float _1496 = _1368 * _1476;
        _1494 = _1496;
    }
    float _1498 = _1494;
    if (_1378)
    {
        float _1500 = fma(_1440, _1434, _1486);
        _1462 = _1500;
    }
    float _1502 = _1462;
    if (_1378)
    {
        float _1504 = _1490 * _1490;
        _1482 = _1504;
    }
    float _1506 = _1482;
    if (!_1378)
    {
        _1464 = _1372;
    }
    float _1508 = _1464;
    float _1510 = _1508;
    if (_1378)
    {
        float _1512 = _1498 * _1498;
        _1510 = _1512;
    }
    float _1514 = _1510;
    float _1516 = fma(_1502, _1502, _1506);
    float _1518 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1520 = _1516 + _1514;
    float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1524 = fma(_1362, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1522);
    float _1526 = precise::clamp(_1524, 0.0, 1.0);
    float _1528 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1480);
    float _1530 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1532 = -_1526;
    float _1534 = _1532 + 1.0;
    float _1536 = rsqrt(_1520);
    float _1538 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1528);
    float _1540 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1542 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1530);
    float _1544 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1546 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1548 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1540);
    float _1550 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1542);
    float _1552 = abs(_1534);
    float _1554 = log2(_1552);
    float _1556 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1558 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1548);
    float _1560 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1562 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1544);
    float _1564 = -_1556;
    float _1566 = fma(_1564, _1518, 1.0);
    float _1568 = _1558 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1570 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1572 = _1536 * _1490;
    float _1574 = _1536 * _1502;
    float _1576 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1562);
    float _1578 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1570);
    float _1580 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1582 = _1536 * _1498;
    float _1584 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1586 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1578);
    float _1588 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1590 = -_1580;
    float _1592 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1590);
    float _1594 = log2(_1566);
    float _1596 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1586);
    float _1598 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1600 = -_1582;
    float _1602 = fma(_1600, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1592);
    float _1604 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1606 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1598);
    float _1608 = fma(_1602, -0.5, 0.5);
    float _1610 = exp2(_1588);
    float _1612 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1604);
    float _1614 = fma(_1602, 0.5, 0.5);
    float _1616 = _1574 + 1.0;
    float _1618 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1606);
    float _1620 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1612);
    float _1622 = fma(_1614, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1624 = 1.0 / _1596;
    float _1626 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1618);
    float _1628 = fma(_1614, _1622, -0.212114393711090087890625);
    float _1630 = _1594 * 0.693147182464599609375;
    float _1632 = fma(_1614, _1628, 1.570728778839111328125);
    float _1634 = _1630 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1636 = sqrt(_1608);
    float _1638 = -_1574;
    float _1640 = fma(_1610, _1616, _1638);
    float _1642 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1620);
    float _1644 = fma(_1640, 0.5, 0.5);
    float _1646 = _1626 * _1624;
    float _1648 = _1642 * _1624;
    float _1650 = fma(_1646, 0.5, 0.5);
    float _1652 = fma(_1648, -0.5, 0.5);
    float _1654 = _1636 * 0.636619746685028076171875;
    float3 _4611 = float3(_1650, _1652, _1634);
    float _1656 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4611, float3(0.0), isnan(_4611)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4611, float3(0.0), isnan(_4611)), level(0.0)).x;
    float _1658 = -_1632;
    float _1660 = fma(_1654, _1658, 1.0);
    float3 _4627 = float3(_1650, _1652, _1634);
    float4 _1663 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4627, float3(0.0), isnan(_4627)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4627, float3(0.0), isnan(_4627)), level(0.0)).xyzw;
    float _1665 = _1663.x;
    float _1667 = _1663.y;
    float _1669 = _1663.z;
    float _1671 = _1663.w;
    float2 _4644 = float2(_1660, _1644);
    float3 _1675 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4644, float2(0.0), isnan(_4644)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4644, float2(0.0), isnan(_4644)), level(0.0)).xyz;
    float _1677 = _1675.x;
    float _1679 = _1675.y;
    float _1681 = _1675.z;
    float _1683 = in.m_57.y;
    float _1685 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1687 = in.m_49.w;
    float _1689 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1689;
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1695 = _1693 != 0;
    float _1697 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1699 = _560 + _1697;
    int _1701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1703 = _1701 != 0;
    float _1705 = 1.0 / _1691;
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1709 = _1707 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1711 = _578 > 0.5;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1713;
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1719 = _1717 != 0;
    float _1721 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1723 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1721;
    float _1725 = in.m_57.x;
    float _1727 = 1.0 / _1709;
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1731 = _1729 != 0;
    float _1733 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1735 = _560 + _1733;
    float _1737 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1739 = _1737 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    if (_1703)
    {
        bool _1741 = _146 > 0.5;
        _708 = _1741;
    }
    bool _1743 = _708;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1747 = _1745 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1749 = -_1683;
    float _1751 = _1749 + 1.0;
    float _1753 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1755 = _1699 * _1705;
    float _1757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1759 = _1687 > 0.5;
    float _1761 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1753);
    float _1763 = fma(_1715, _1755, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1765 = fma(_1723, _1755, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1767 = _1759 ? as_type<int>(_1751) : as_type<int>(_1683);
    out.m_59.x = _1272;
    out.m_59.y = _1270;
    out.m_59.z = _1274;
    bool _1769 = _1759;
    float _1771 = _1683;
    if (_1695)
    {
        bool _1773 = _562 > 0.5;
        _1769 = _1773;
    }
    bool _1775 = _1769;
    float _1777 = _1735 * _1727;
    float _1779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1781 = _1719 ? as_type<float>(_1767) : _1683;
    float _1783 = fma(_1739, _1777, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1785 = _966 != 0.0;
    bool _1787 = isnan(_966);
    bool _1789 = _1785 || _1787;
    bool _1791 = isnan(0.0);
    bool _1793 = _1789 || _1791;
    float _1795 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1795;
    float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1801 = _1799 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1803 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1805 = isnan(_560);
    bool _1807 = _1803 || _1805;
    bool _1809 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1811 = _1807 || _1809;
    float _1813 = float(_1811);
    float _1815 = fma(_1797, _1755, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1817 = _964 == 0.0;
    bool _1819 = !_1793;
    bool _1821 = _1817 && _1819;
    float _1823 = in.m_61.x;
    float _1825 = in.m_61.y;
    float _1827 = in.m_61.z;
    float _1829 = fma(_1801, _1777, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1831 = fma(_1747, _1777, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1833 = _968 == 0.0;
    bool _1835 = _1833 && _1821;
    float _1837 = -_1813;
    float _1839 = _1837 + 1.0;
    bool _1841 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1843 = isnan(_560);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1849 = _1845 || _1847;
    float _1851 = float(_1849);
    float _1853 = _1779 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1855 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1857 = isnan(_560);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    float _1867 = exp2(_1685);
    float _1869 = (*spvDescriptorSet0.vp_c9)._m0[124].x;
    if (_1731)
    {
        float _1871 = _1711 ? _1751 : _1683;
        _1771 = _1871;
    }
    float _1873 = _1771;
    float _1875 = _1851 * _1839;
    float _1877 = -_1851;
    float _1879 = _1877 + 1.0;
    float _1881 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1883 = _1725;
    if (!_1703)
    {
        _1869 = _1725;
    }
    float _1885 = _1869;
    float _1887 = fma(_1781, _1853, -0.5);
    float _1889 = _1865 * _1879;
    float _1891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1893 = -_1865;
    float _1895 = _1893 + 1.0;
    float _1897 = fma(_1881, _1873, -0.5);
    float _1899 = _1815 * _1889;
    float _1901 = _1763 * _1889;
    float _1903 = _1765 * _1889;
    float _1905 = -_654;
    float _1907 = fma(_884, _1897, _1905);
    float _1909 = -_838;
    float _1911 = fma(_752, _1887, _1909);
    float _1913 = _1823;
    float _1915 = _1825;
    float _1917 = _1827;
    float _1919 = _1885;
    if (!_1835)
    {
        float _1921 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1823);
        _1913 = _1921;
    }
    float _1923 = _1913;
    if (!_1835)
    {
        float _1925 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1825);
        _1915 = _1925;
    }
    float _1927 = _1915;
    float _1929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_1835)
    {
        float _1931 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1827);
        _1917 = _1931;
    }
    float _1933 = _1917;
    if (_1703)
    {
        float _1935 = -_1725;
        float _1937 = _1935 + 1.0;
        _1204 = as_type<int>(_1937);
    }
    int _1939 = _1204;
    if (_1695)
    {
        float _1941 = -_1725;
        float _1943 = _1941 + 1.0;
        _1206 = as_type<int>(_1943);
    }
    int _1945 = _1206;
    float _1947 = _1090 * _1130;
    float _1949 = _1090 * _1124;
    float _1951 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1703)
    {
        float _1953 = _1743 ? as_type<float>(_1939) : _1725;
        _1919 = _1953;
    }
    float _1955 = _1919;
    float _1957 = fma(_1895, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1901);
    if (_1695)
    {
        float _1959 = _1775 ? as_type<float>(_1945) : _1725;
        _1883 = _1959;
    }
    float _1961 = _1883;
    float _1963 = fma(_1895, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1899);
    float _1965 = fma(_1895, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1903);
    float _1967 = fma(_1951, _1955, -0.5);
    float _1969 = -_1867;
    float _1971 = _1969 + 1.0;
    float _1973 = fma(_1829, _1875, _1963);
    float _1975 = fma(_1831, _1875, _1965);
    float _1977 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1979 = fma(_1783, _1875, _1957);
    float _1981 = fma(_824, _1967, _668);
    float _1983 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1973);
    float _1985 = fma(_1977, _1961, -0.5);
    float _1987 = _1076 * _1130;
    float _1989 = _1076 * _1174;
    float _1991 = _1076 * _1124;
    float _1993 = _1092 * _1130;
    float _1995 = fma(_718, _1985, _768);
    float _1997 = _1090 * _1174;
    float _1999 = _1092 * _1174;
    float _2001 = -_1068;
    float _2003 = fma(_2001, _1108, _1989);
    float _2005 = _1092 * _1124;
    float _2007 = fma(_1080, _1106, _1993);
    float _2009 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1979);
    float _2011 = -_1068;
    float _2013 = fma(_2011, _1106, _1987);
    float _2015 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1975);
    float _2017 = -_1068;
    float _2019 = fma(_2017, _1112, _1991);
    float _2021 = fma(_1078, _970, _2003);
    float _2023 = fma(_1086, _958, _2007);
    float _2025 = _1983 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2027 = _2009 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2029 = _2015 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2031 = fma(_1080, _1108, _1999);
    float _2033 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2035 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2037 = _2029 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2039 = fma(_1082, _1108, _1997);
    float _2041 = fma(_1078, _958, _2013);
    float _2043 = fma(_1080, _1112, _2005);
    float _2045 = fma(_1078, _962, _2019);
    float _2047 = fma(_1086, _970, _2031);
    float _2049 = _2021 * _1927;
    out.m_63.x = _2033;
    out.m_63.y = _2035;
    out.m_63.z = _2037;
    float _2051 = fma(_1082, _1106, _1947);
    float _2053 = fma(_1100, _970, _2039);
    float _2055 = _2041 * _1927;
    float _2057 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1761);
    float _2059 = fma(_1086, _962, _2043);
    float _2061 = _2045 * _1927;
    float _2063 = fma(_2047, _1923, _2049);
    float _2065 = fma(_1100, _958, _2051);
    float _2067 = fma(_2023, _1923, _2055);
    float _2069 = _1911 + 0.5;
    float _2071 = fma(_1082, _1112, _1949);
    float _2073 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2075 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2057);
    bool _2077 = _1340 > 0.0;
    bool _2079 = isnan(_1340);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan(0.0);
    bool _2085 = _2081 || _2083;
    float _2087 = fma(_2059, _1923, _2061);
    float _2089 = fma(_2053, _1933, _2063);
    float _2091 = fma(_2065, _1933, _2067);
    float _2093 = _1981 + 0.5;
    float _2095 = _1596 * 0.5;
    float _2097 = fma(_1100, _962, _2071);
    float _2099 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2101 = _2075 + _1596;
    float _2103 = _1626 + _1596;
    float _2105 = _1995 + 0.5;
    float _2107 = fma(_1642, -0.5, _2095);
    float _2109 = _1907 + 0.5;
    float _2111 = fma(_2097, _1933, _2087);
    float _2113 = _2101 * 0.5;
    float _2115 = _2103 * 0.5;
    float _2117 = _2099 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _2093;
    out.m_65.y = _2109;
    out.m_65.z = _2105;
    out.m_65.w = _2069;
    out.m_67.x = _2091;
    out.m_67.y = _2089;
    out.m_67.z = _2111;
    out.gl_Position.x = _1626;
    out.gl_Position.y = _1642;
    out.gl_Position.z = _2075;
    out.gl_Position.w = _1596;
    out.m_69.x = _2115;
    out.m_69.y = _2107;
    out.m_69.z = _2113;
    out.m_69.w = _1596;
    out.m_45.x = _2117;
    float _2119 = _2073 * _1656;
    float _2121 = -_2073;
    float _2123 = _2121 + 1.0;
    float _2125 = _1671 * _2119;
    float _2127 = _1671 * _2123;
    float _2129 = _1681 * _2119;
    float _2131 = fma(_1677, _2125, _1665);
    float _2133 = fma(_1679, _2125, _1667);
    float _2135 = fma(_1671, _2129, _1669);
    out.m_71.x = _2131;
    out.m_71.y = _2133;
    out.m_71.z = _2135;
    out.m_71.w = _2127;
    if (_2085)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2137 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2137;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _552 = false;
    bool _374 = false;
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
        float _2194 = as_type<float>(_106);
        out.gl_Position.z = _2194;
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
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2264 = as_type<float>(_144);
        out.gl_Position.z = _2264;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_49.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _124 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _152 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    int _164 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _166 = _164 != 0;
    float _168 = _150 * _148;
    float _170 = 0.0;
    float _172 = _152;
    if (!_162)
    {
        float _174 = _152 * _152;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    float _182 = _178;
    if (!_162)
    {
        float _184 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    float _188 = in.m_47.x;
    float _190 = in.m_47.y;
    float _192 = in.m_47.z;
    float _194 = _180 * 6.283185482025146484375;
    float _196 = floor(_180);
    float _198 = _194 * 0.15915493667125701904296875;
    float _200 = _198 * 6.283185482025146484375;
    float _202 = cos(_200);
    float _204 = -_196;
    float _206 = _180 + _204;
    bool _208 = !_162;
    float _210 = _186;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _152 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _152);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_162;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _152 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _172 = _264;
    }
    float _266 = _172;
    float _268 = in.m_51.w;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _276 = _274 != 0;
    float _278 = in.m_42.x;
    float _280 = in.m_42.y;
    float _282 = in.m_42.z;
    float _284 = -_206;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _288 = _206 < 0.5;
    float _290 = float(_288);
    bool _292 = !_272;
    int _294 = _292 ? 0 : 1;
    float _296 = fma(_202, 0.5, 0.5);
    bool _298 = !_166;
    int _300 = _298 ? 0 : 1;
    float _302 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _304 = abs(_294);
    float _306 = -_290;
    float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _310 = -_296;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _314 = fma(_266, _188, _302);
    int _316 = abs(_300);
    float _318 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _320 = !_276;
    int _322 = _320 ? 0 : 1;
    float _324 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _326 = fma(_266, _190, _318);
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _330 = fma(_266, _192, _324);
    int _332 = abs(_322);
    float _334 = float(_304);
    float _336 = fma(_314, _268, _278);
    float _338 = float(_316);
    float _340 = fma(_326, _268, _280);
    float _342 = abs(_286);
    float _344 = _334 * _342;
    float _346 = fma(_330, _268, _282);
    float _348 = float(_332);
    float _350 = fma(_338, _312, _344);
    float _352 = abs(_308);
    float _354 = fma(_348, _352, _350);
    bool _356 = !_328;
    float _372;
    if (!_356)
    {
        float _358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _360 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _362 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _364 = _362 * _358;
        float _366 = floor(_364);
        float _368 = -_366;
        float _370 = _364 + _368;
        _372 = _370;
        _374 = true;
    }
    else
    {
        float _376 = float(_90);
        float _378 = 1.0 / _376;
        float _380 = _124 * _378;
        _372 = _380;
    }
    _374 = false;
    float _382 = _372;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _386 = _382 + _384;
    bool _388 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _390 = isnan(_382);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _402 = _382 + _400;
    bool _404 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _406 = isnan(_382);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _424 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _426 = isnan(_382);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -_398;
    float _438 = _436 + 1.0;
    float _440 = 1.0 / _422;
    float _442 = _434 * _438;
    float _444 = -_434;
    float _446 = _444 + 1.0;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _448;
    bool _452 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _454 = 1.0 / _418;
    float _456 = _414 * _446;
    float _458 = -_414;
    float _460 = _458 + 1.0;
    float _462 = _402 * _440;
    float _464 = _386 * _454;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _470;
    float _474 = fma(_450, _464, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _476 = fma(_468, _464, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _478 = fma(_472, _464, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _480 = in.m_51.x;
    float _482 = in.m_51.y;
    float _484 = in.m_51.z;
    float _486 = _474 * _456;
    float _488 = _476 * _456;
    float _490 = _478 * _456;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _504 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].x, _486);
    float _506 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].y, _488);
    float _508 = fma(_494, _462, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = fma(_498, _462, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _512 = fma(_502, _462, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _514 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].z, _490);
    float _516 = fma(_508, _442, _504);
    float _518 = fma(_510, _442, _506);
    float _520 = fma(_512, _442, _514);
    float _522 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[145].x, _516);
    float _524 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[145].y, _518);
    float _526 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[145].z, _520);
    float _528 = _522 * _480;
    float _530 = _524 * _482;
    float _532 = _526 * _484;
    bool _534 = !_452;
    float _550;
    if (!_534)
    {
        float _536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _538 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _542 = _540 * _536;
        float _544 = floor(_542);
        float _546 = -_544;
        float _548 = _542 + _546;
        _550 = _548;
        _552 = true;
    }
    else
    {
        float _554 = float(_90);
        float _556 = 1.0 / _554;
        float _558 = _124 * _556;
        _550 = _558;
    }
    _552 = false;
    float _560 = _550;
    float _562 = in.m_49.z;
    float _564 = _340 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _568 = _566 != 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _576 = _574 != 0;
    float _578 = in.m_49.y;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _582 = _580 != 0;
    float _584 = _340 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _586 = _340 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _588 = _146 * 2.0;
    float _590 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[5].x, _564);
    float _592 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[4].x, _584);
    float _594 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[6].x, _586);
    float _596 = floor(_588);
    float _598 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _600 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[6].z, _594);
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _606 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[4].z, _592);
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _610 = !_568;
    int _612 = _610 ? 0 : 1;
    float _614 = _562 * 2.0;
    float _616 = -_604;
    float _618 = fma(_598, 2.0, _616);
    float _620 = _598;
    if (!_582)
    {
        _620 = _562;
    }
    float _622 = _620;
    float _624 = _606 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _626 = _578 * 2.0;
    float _628 = _578 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _630 = floor(_614);
    float _632 = _578 + _562;
    bool _634 = _596 > 0.0;
    float _636 = fma(_628, -2.0, _602);
    float _638 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[5].z, _590);
    bool _640 = _596 >= 0.0;
    bool _642 = isnan(_596);
    bool _644 = _640 || _642;
    bool _646 = isnan(0.0);
    bool _648 = _644 || _646;
    float _650 = _632 + (-1.0);
    float _652 = floor(_626);
    float _654 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _636);
    bool _656 = !_572;
    int _658 = _656 ? 0 : 1;
    float _660 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _662 = _648 ? 0 : 1;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _666 = -_124;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[76].x, _618);
    float _670 = _626;
    float _672 = _632;
    float _674 = _622;
    if (!_582)
    {
        _670 = _578;
    }
    float _676 = _670;
    float _678 = _600 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _680 = _676;
    if (_582)
    {
        _680 = _146;
    }
    float _682 = _680;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _686 = _630 > 0.0;
    float _688 = -_624;
    float _690 = _688 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _692 = _630 >= 0.0;
    bool _694 = isnan(_630);
    bool _696 = _692 || _694;
    bool _698 = isnan(0.0);
    bool _700 = _696 || _698;
    float _702 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[83].z, _664);
    float _704 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _706 = log2(_704);
    bool _708 = _686;
    if (!_582)
    {
        _672 = _562;
    }
    float _710 = _672;
    float _712 = _682 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _714 = _710;
    if (_582)
    {
        _674 = _578;
    }
    float _716 = _674;
    float _718 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _702);
    if (_582)
    {
        _714 = _578;
    }
    float _720 = _714;
    float _722 = -_684;
    float _724 = fma(_712, 2.0, _722);
    bool _726 = _652 > 0.0;
    float _728 = _716 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _730 = _652 >= 0.0;
    bool _732 = isnan(_652);
    bool _734 = _730 || _732;
    bool _736 = isnan(0.0);
    bool _738 = _734 || _736;
    float _740 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[83].w, _608);
    int _742 = ~_662;
    int _744 = _742 + 1;
    int _746 = _744 + 1;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _750 = abs(_658);
    float _752 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _740);
    int _754 = _746;
    if (!_634)
    {
        int _756 = ~_662;
        int _758 = _756 + 1;
        _754 = _758;
    }
    int _760 = _754;
    float _762 = _706 * _124;
    float _764 = float(_750);
    float _766 = -_124;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[81].x, _724);
    float _770 = float(_760);
    float _772 = fma(_728, -2.0, _748);
    int _774 = _700 ? 0 : 1;
    float _776 = exp2(_762);
    float _778 = _764 * _770;
    float _780 = in.m_53.x;
    float _782 = in.m_53.y;
    float _784 = in.m_53.z;
    int _786 = ~_774;
    int _788 = _786 + 1;
    int _790 = _788 + 1;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _794 = 1.0 + _792;
    int _796 = _790;
    if (!_686)
    {
        int _798 = ~_774;
        int _800 = _798 + 1;
        _796 = _800;
    }
    int _802 = _796;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _806 = abs(_612);
    float _808 = 1.0 / _794;
    int _810 = _738 ? 0 : 1;
    float _812 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _804);
    float _814 = float(_802);
    float _816 = _778 * (-2.0);
    int _818 = ~_810;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    float _824 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _812);
    float _826 = -_776;
    float _828 = _826 + 1.0;
    int _830 = _822;
    if (!_726)
    {
        int _832 = ~_810;
        int _834 = _832 + 1;
        _830 = _834;
    }
    int _836 = _830;
    float _838 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _772);
    float _840 = _578 + (-0.5);
    float _842 = float(_806);
    float _844 = -_678;
    float _846 = _844 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _848 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _850 = isnan(1.0);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _856 = _852 || _854;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _860 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _868 = _864 || _866;
    float _870 = _842 * _814;
    float _872 = _638 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _874 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[78].w, _858);
    float _876 = _868 ? _828 : 0.0;
    float _878 = fma(_816, _782, _782);
    float _880 = -_872;
    float _882 = _880 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _884 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _874);
    float _886 = fma(_660, _816, _660);
    float _888 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[196].y, _878);
    float _890 = _882 * _882;
    float _892 = _872;
    if (_856)
    {
        float _894 = _876 * _808;
        _126 = _894;
    }
    float _896 = _126;
    bool _898 = !_576;
    int _900 = _898 ? 0 : 1;
    float _902 = _870 * (-2.0);
    float _904 = fma(_690, _690, _890);
    float _906 = fma(_886, _896, _888);
    int _908 = abs(_900);
    float _910 = _146 + _578;
    float _912 = fma(_846, _846, _904);
    float _914 = _906 * 0.15915493667125701904296875;
    float _916 = _910 + (-1.0);
    float _918 = float(_908);
    float _920 = fma(_902, _780, _780);
    float _922 = float(_836);
    float _924 = rsqrt(_912);
    float _926 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _928 = _146 + (-0.5);
    float _930 = _146 + _562;
    float _932 = _918 * _922;
    float _934 = fma(_926, _902, _926);
    float _936 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[196].x, _920);
    float _938 = _930 + (-1.0);
    float _940 = _932 * (-2.0);
    float _942 = fma(_934, _896, _936);
    float _944 = _914 * 6.283185482025146484375;
    float _946 = sin(_944);
    float _948 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _950 = fma(_940, _784, _784);
    float _952 = _562 + (-0.5);
    float _954 = _942 * 0.15915493667125701904296875;
    float _956 = fma(_948, _940, _948);
    float _958 = _690 * _924;
    float _960 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[196].z, _950);
    float _962 = _846 * _924;
    float _964 = in.m_55.x;
    float _966 = in.m_55.y;
    float _968 = in.m_55.z;
    float _970 = _882 * _924;
    float _972 = fma(_956, _896, _960);
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _976 = _958 * _974;
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _980 = _962 * _978;
    float _982 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _984 = _970 * _982;
    float _986 = _972 * 0.15915493667125701904296875;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _990 = -_976;
    float _992 = fma(_962, _988, _990);
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _996 = -_980;
    float _998 = fma(_970, _994, _996);
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1002 = -_984;
    float _1004 = fma(_958, _1000, _1002);
    float _1006 = _914 * 6.283185482025146484375;
    float _1008 = cos(_1006);
    float _1010 = _992 * _992;
    float _1012 = _354 * _528;
    float _1014 = _354 * _530;
    float _1016 = _354 * _532;
    float _1018 = fma(_998, _998, _1010);
    float _1020 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1022 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1024 = _954 * 6.283185482025146484375;
    float _1026 = sin(_1024);
    float _1028 = fma(_1004, _1004, _1018);
    float _1030 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1032 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1034 = isnan(0.5);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1040 = _1036 || _1038;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _964);
    float _1044 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _966);
    float _1046 = _954 * 6.283185482025146484375;
    float _1048 = cos(_1046);
    float _1050 = _1020 * _1042;
    float _1052 = _1022 * _1044;
    float _1054 = _986 * 6.283185482025146484375;
    float _1056 = cos(_1054);
    float _1058 = _1026 * _1008;
    float _1060 = _1026 * _946;
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _968);
    float _1064 = _1030 * _1062;
    float _1066 = _986 * 6.283185482025146484375;
    float _1068 = sin(_1066);
    float _1070 = _1048 * _946;
    float _1072 = _1048 * _1008;
    float _1074 = rsqrt(_1028);
    float _1076 = _1048 * _1056;
    float _1078 = _1026 * _1056;
    float _1080 = _1008 * _1056;
    float _1082 = _946 * _1056;
    float _1084 = -_1070;
    float _1086 = fma(_1068, _1058, _1084);
    float _1088 = -_1058;
    float _1090 = fma(_1068, _1070, _1088);
    float _1092 = fma(_1068, _1072, _1060);
    float _1094 = _1076 * _1052;
    float _1096 = -_1052;
    float _1098 = _1068 * _1096;
    float _1100 = fma(_1068, _1060, _1072);
    float _1102 = _1078 * _1052;
    float _1104 = fma(_1092, _1050, _1094);
    float _1106 = _998 * _1074;
    float _1108 = _992 * _1074;
    float _1110 = fma(_1080, _1050, _1098);
    float _1112 = _1004 * _1074;
    float _1114 = _970 * _1106;
    float _1116 = _962 * _1108;
    float _1118 = fma(_1086, _1050, _1102);
    float _1120 = _872 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1122 = -_1114;
    float _1124 = fma(_958, _1108, _1122);
    float _1126 = fma(_1090, _1064, _1104);
    float _1128 = -_1116;
    float _1130 = fma(_970, _1112, _1128);
    float _1132 = fma(_1082, _1064, _1110);
    float _1134 = fma(_1100, _1064, _1118);
    float _1136 = _1124 * _1126;
    float _1138 = _1130 * _1126;
    float _1140 = fma(_1112, _1132, _1136);
    float _1142 = fma(_1106, _1132, _1138);
    float _1144 = fma(_962, _1134, _1140);
    float _1146 = fma(_958, _1134, _1142);
    float _1148 = _678 + _1144;
    float _1150 = _624 + _1146;
    float _1152 = _872 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1154 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1156 = _1148 + _1154;
    float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1160 = _1150 + _1158;
    float _1162 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1152);
    float _1164 = _958 * _1112;
    float _1166 = _1156 * _1156;
    float _1168 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1120);
    float _1170 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1162);
    float _1172 = -_1164;
    float _1174 = fma(_962, _1106, _1172);
    float _1176 = fma(_1160, _1160, _1166);
    float _1178 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1168);
    float _1180 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1182 = _1174 * _1126;
    float _1184 = sqrt(_1176);
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1188 = fma(_1108, _1132, _1182);
    float _1190 = _1186 + _1180;
    float _1192 = fma(_970, _1134, _1188);
    float _1194 = 1.0 / _1180;
    float _1196 = _872 + _1192;
    float _1198 = _1192;
    float _1200 = _1132;
    float _1202 = _1126;
    int _1204 = as_type<int>(_966);
    int _1206 = as_type<int>(_968);
    if (_1040)
    {
        _1198 = 1.0;
    }
    float _1208 = _1198;
    bool _1210 = _1184 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = _1190 * _1194;
    float _1214 = _1212 * 0.5;
    float _1216 = _1184;
    float _1218 = _1208;
    if (!_1210)
    {
        _1200 = _1150;
    }
    float _1220 = _1200;
    float _1222 = _1220;
    if (!_1210)
    {
        _892 = _1148;
    }
    float _1224 = _892;
    float _1226 = _1224;
    if (!_1210)
    {
        _1202 = _1196;
    }
    float _1228 = _1202;
    bool _1230 = !_1210;
    float _1232 = _1228;
    if (!_1230)
    {
        float _1234 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1238 = _1184 + _1236;
        float _1240 = _1196 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1242 = rsqrt(_1176);
        float _1244 = _1238 * _1234;
        float _1246 = _1244 * 0.15915493667125701904296875;
        float _1248 = _1246 * 6.283185482025146484375;
        float _1250 = cos(_1248);
        float _1252 = _1246 * 6.283185482025146484375;
        float _1254 = sin(_1252);
        float _1256 = _1250 + (-1.0);
        float _1258 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1260 = fma(_1254, _1240, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1262 = fma(_1196, _1250, _1258);
        float _1264 = _1242 * _1260;
        float _1266 = fma(_1160, _1264, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1268 = fma(_1156, _1264, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1232 = _1262;
        _1222 = _1266;
        _1226 = _1268;
        _1216 = _1264;
    }
    float _1270 = _1232;
    float _1272 = _1222;
    float _1274 = _1226;
    float _1276 = _1216;
    float _1278 = _1276;
    if (!_1040)
    {
        float _1280 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1282 = _1280 * 0.15915493667125701904296875;
        float _1284 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1288 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1286);
        float _1290 = _1282 * 6.283185482025146484375;
        float _1292 = cos(_1290);
        float _1294 = _1284 * 0.15915493667125701904296875;
        float _1296 = _1282 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        float _1300 = 1.0 / _1292;
        float _1302 = _1294 * 6.283185482025146484375;
        float _1304 = cos(_1302);
        float _1306 = _1298 * _1300;
        float _1308 = _1294 * 6.283185482025146484375;
        float _1310 = sin(_1308);
        float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1314 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1312;
        float _1316 = _1304 * _1306;
        float _1318 = 1.0 / _1288;
        float _1320 = 1.0 / _1316;
        float _1322 = 1.0 / _1314;
        float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1326 = _1318 * _1324;
        float _1328 = _1310 * _1320;
        float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1332 = fma(_1328, _1326, _1330);
        float _1334 = _1332 * _1322;
        float _1336 = precise::clamp(_1334, 0.0, 1.0);
        _1278 = _1322;
        _1218 = _1336;
    }
    float _1338 = _1278;
    float _1340 = _1218;
    float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1344 = _1270 + _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1348 = _1272 + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1352 = _1274 + _1350;
    float _1354 = _1344 * _1344;
    float _1356 = fma(_1348, _1348, _1354);
    float _1358 = fma(_1352, _1352, _1356);
    float _1360 = rsqrt(_1358);
    float _1362 = sqrt(_1358);
    float _1364 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1366 = _1348 * _1364;
    float _1368 = _1352 * _1364;
    float _1370 = _1366 * _1366;
    float _1372 = _1368 * _1368;
    float _1374 = _1370 + _1372;
    float _1376 = sqrt(_1374);
    bool _1378 = _1376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1382 = _1376 + _1380;
    float _1384 = _1352;
    float _1386 = _1374;
    float _1388 = _1382;
    float _1390 = _1338;
    float _1392 = _1344;
    if (_1378)
    {
        float _1394 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1384 = _1394;
    }
    float _1396 = _1384;
    if (_1378)
    {
        float _1398 = rsqrt(_1374);
        _1386 = _1398;
    }
    float _1400 = _1386;
    if (_1378)
    {
        float _1402 = _1382 * _1396;
        _1388 = _1402;
    }
    float _1404 = _1388;
    if (_1378)
    {
        float _1406 = _1404 * 0.15915493667125701904296875;
        _1390 = _1406;
    }
    float _1408 = _1390;
    float _1410 = _1354;
    float _1412 = _1408;
    if (_1378)
    {
        float _1414 = _1408 * 6.283185482025146484375;
        float _1416 = sin(_1414);
        _1410 = _1416;
    }
    float _1418 = _1410;
    float _1420 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1422 = precise::max(0.0, _1420);
    float _1424 = _1360;
    float _1426 = _1422;
    float _1428 = _1420;
    if (_1378)
    {
        float _1430 = _1408 * 6.283185482025146484375;
        float _1432 = cos(_1430);
        _1424 = _1432;
    }
    float _1434 = _1424;
    float _1436 = -_1364;
    float _1438 = -_1422;
    float _1440 = fma(_1344, _1436, _1438);
    if (!_1378)
    {
        _1426 = _1366;
    }
    float _1442 = _1426;
    float _1444 = _1442;
    if (_1378)
    {
        float _1446 = _1440 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1428 = _1446;
    }
    float _1448 = _1428;
    float _1450 = _1418;
    float _1452 = _1448;
    if (_1378)
    {
        float _1454 = fma(_1418, _1448, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1450 = _1454;
    }
    float _1456 = _1450;
    float _1458 = _1456;
    if (!_1378)
    {
        _1452 = _1440;
    }
    float _1460 = _1452;
    float _1462 = _1460;
    float _1464 = _1434;
    if (_1378)
    {
        float _1466 = _1434 + (-1.0);
        _1392 = _1466;
    }
    float _1468 = _1392;
    float _1470 = 0.0;
    float _1472 = _1468;
    if (_1378)
    {
        float _1474 = _1400 * _1456;
        _1470 = _1474;
    }
    float _1476 = _1470;
    if (!_1378)
    {
        _1458 = _1370;
    }
    float _1478 = _1458;
    float _1480 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1482 = _1478;
    if (_1378)
    {
        float _1484 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1412 = _1484;
    }
    float _1486 = _1412;
    if (_1378)
    {
        float _1488 = _1366 * _1476;
        _1444 = _1488;
    }
    float _1490 = _1444;
    if (!_1378)
    {
        _1472 = _1368;
    }
    float _1492 = _1472;
    float _1494 = _1492;
    if (_1378)
    {
        float _1496 = _1368 * _1476;
        _1494 = _1496;
    }
    float _1498 = _1494;
    if (_1378)
    {
        float _1500 = fma(_1440, _1434, _1486);
        _1462 = _1500;
    }
    float _1502 = _1462;
    if (_1378)
    {
        float _1504 = _1490 * _1490;
        _1482 = _1504;
    }
    float _1506 = _1482;
    if (!_1378)
    {
        _1464 = _1372;
    }
    float _1508 = _1464;
    float _1510 = _1508;
    if (_1378)
    {
        float _1512 = _1498 * _1498;
        _1510 = _1512;
    }
    float _1514 = _1510;
    float _1516 = fma(_1502, _1502, _1506);
    float _1518 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1520 = _1516 + _1514;
    float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1524 = fma(_1362, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1522);
    float _1526 = precise::clamp(_1524, 0.0, 1.0);
    float _1528 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1480);
    float _1530 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1532 = -_1526;
    float _1534 = _1532 + 1.0;
    float _1536 = rsqrt(_1520);
    float _1538 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1528);
    float _1540 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1542 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1530);
    float _1544 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1546 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1548 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1540);
    float _1550 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1542);
    float _1552 = abs(_1534);
    float _1554 = log2(_1552);
    float _1556 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1558 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1548);
    float _1560 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1562 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1544);
    float _1564 = -_1556;
    float _1566 = fma(_1564, _1518, 1.0);
    float _1568 = _1558 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1570 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1572 = _1536 * _1490;
    float _1574 = _1536 * _1502;
    float _1576 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1562);
    float _1578 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1570);
    float _1580 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1582 = _1536 * _1498;
    float _1584 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1586 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1578);
    float _1588 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1590 = -_1580;
    float _1592 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1590);
    float _1594 = log2(_1566);
    float _1596 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1586);
    float _1598 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1600 = -_1582;
    float _1602 = fma(_1600, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1592);
    float _1604 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1606 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1598);
    float _1608 = fma(_1602, -0.5, 0.5);
    float _1610 = exp2(_1588);
    float _1612 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1604);
    float _1614 = fma(_1602, 0.5, 0.5);
    float _1616 = _1574 + 1.0;
    float _1618 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1606);
    float _1620 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1612);
    float _1622 = fma(_1614, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1624 = 1.0 / _1596;
    float _1626 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1618);
    float _1628 = fma(_1614, _1622, -0.212114393711090087890625);
    float _1630 = _1594 * 0.693147182464599609375;
    float _1632 = fma(_1614, _1628, 1.570728778839111328125);
    float _1634 = _1630 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1636 = sqrt(_1608);
    float _1638 = -_1574;
    float _1640 = fma(_1610, _1616, _1638);
    float _1642 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1620);
    float _1644 = fma(_1640, 0.5, 0.5);
    float _1646 = _1626 * _1624;
    float _1648 = _1642 * _1624;
    float _1650 = fma(_1646, 0.5, 0.5);
    float _1652 = fma(_1648, -0.5, 0.5);
    float _1654 = _1636 * 0.636619746685028076171875;
    float3 _4611 = float3(_1650, _1652, _1634);
    float _1656 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4611, float3(0.0), isnan(_4611)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4611, float3(0.0), isnan(_4611)), level(0.0)).x;
    float _1658 = -_1632;
    float _1660 = fma(_1654, _1658, 1.0);
    float3 _4627 = float3(_1650, _1652, _1634);
    float4 _1663 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4627, float3(0.0), isnan(_4627)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4627, float3(0.0), isnan(_4627)), level(0.0)).xyzw;
    float _1665 = _1663.x;
    float _1667 = _1663.y;
    float _1669 = _1663.z;
    float _1671 = _1663.w;
    float2 _4644 = float2(_1660, _1644);
    float3 _1675 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4644, float2(0.0), isnan(_4644)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4644, float2(0.0), isnan(_4644)), level(0.0)).xyz;
    float _1677 = _1675.x;
    float _1679 = _1675.y;
    float _1681 = _1675.z;
    float _1683 = in.m_57.y;
    float _1685 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1687 = in.m_49.w;
    float _1689 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1689;
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1695 = _1693 != 0;
    float _1697 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1699 = _560 + _1697;
    int _1701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1703 = _1701 != 0;
    float _1705 = 1.0 / _1691;
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1709 = _1707 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1711 = _578 > 0.5;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1713;
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1719 = _1717 != 0;
    float _1721 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1723 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1721;
    float _1725 = in.m_57.x;
    float _1727 = 1.0 / _1709;
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1731 = _1729 != 0;
    float _1733 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1735 = _560 + _1733;
    float _1737 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1739 = _1737 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    if (_1703)
    {
        bool _1741 = _146 > 0.5;
        _708 = _1741;
    }
    bool _1743 = _708;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1747 = _1745 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1749 = -_1683;
    float _1751 = _1749 + 1.0;
    float _1753 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1755 = _1699 * _1705;
    float _1757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1759 = _1687 > 0.5;
    float _1761 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1753);
    float _1763 = fma(_1715, _1755, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1765 = fma(_1723, _1755, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1767 = _1759 ? as_type<int>(_1751) : as_type<int>(_1683);
    out.m_59.x = _1272;
    out.m_59.y = _1270;
    out.m_59.z = _1274;
    bool _1769 = _1759;
    float _1771 = _1683;
    if (_1695)
    {
        bool _1773 = _562 > 0.5;
        _1769 = _1773;
    }
    bool _1775 = _1769;
    float _1777 = _1735 * _1727;
    float _1779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1781 = _1719 ? as_type<float>(_1767) : _1683;
    float _1783 = fma(_1739, _1777, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1785 = _966 != 0.0;
    bool _1787 = isnan(_966);
    bool _1789 = _1785 || _1787;
    bool _1791 = isnan(0.0);
    bool _1793 = _1789 || _1791;
    float _1795 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1795;
    float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1801 = _1799 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1803 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1805 = isnan(_560);
    bool _1807 = _1803 || _1805;
    bool _1809 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1811 = _1807 || _1809;
    float _1813 = float(_1811);
    float _1815 = fma(_1797, _1755, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1817 = _964 == 0.0;
    bool _1819 = !_1793;
    bool _1821 = _1817 && _1819;
    float _1823 = in.m_61.x;
    float _1825 = in.m_61.y;
    float _1827 = in.m_61.z;
    float _1829 = fma(_1801, _1777, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1831 = fma(_1747, _1777, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1833 = _968 == 0.0;
    bool _1835 = _1833 && _1821;
    float _1837 = -_1813;
    float _1839 = _1837 + 1.0;
    bool _1841 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1843 = isnan(_560);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1849 = _1845 || _1847;
    float _1851 = float(_1849);
    float _1853 = _1779 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1855 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1857 = isnan(_560);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    float _1867 = exp2(_1685);
    float _1869 = (*spvDescriptorSet0.vp_c9)._m0[124].x;
    if (_1731)
    {
        float _1871 = _1711 ? _1751 : _1683;
        _1771 = _1871;
    }
    float _1873 = _1771;
    float _1875 = _1851 * _1839;
    float _1877 = -_1851;
    float _1879 = _1877 + 1.0;
    float _1881 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1883 = _1725;
    if (!_1703)
    {
        _1869 = _1725;
    }
    float _1885 = _1869;
    float _1887 = fma(_1781, _1853, -0.5);
    float _1889 = _1865 * _1879;
    float _1891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1893 = -_1865;
    float _1895 = _1893 + 1.0;
    float _1897 = fma(_1881, _1873, -0.5);
    float _1899 = _1815 * _1889;
    float _1901 = _1763 * _1889;
    float _1903 = _1765 * _1889;
    float _1905 = -_654;
    float _1907 = fma(_884, _1897, _1905);
    float _1909 = -_838;
    float _1911 = fma(_752, _1887, _1909);
    float _1913 = _1823;
    float _1915 = _1825;
    float _1917 = _1827;
    float _1919 = _1885;
    if (!_1835)
    {
        float _1921 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1823);
        _1913 = _1921;
    }
    float _1923 = _1913;
    if (!_1835)
    {
        float _1925 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1825);
        _1915 = _1925;
    }
    float _1927 = _1915;
    float _1929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_1835)
    {
        float _1931 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1827);
        _1917 = _1931;
    }
    float _1933 = _1917;
    if (_1703)
    {
        float _1935 = -_1725;
        float _1937 = _1935 + 1.0;
        _1204 = as_type<int>(_1937);
    }
    int _1939 = _1204;
    if (_1695)
    {
        float _1941 = -_1725;
        float _1943 = _1941 + 1.0;
        _1206 = as_type<int>(_1943);
    }
    int _1945 = _1206;
    float _1947 = _1090 * _1130;
    float _1949 = _1090 * _1124;
    float _1951 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1703)
    {
        float _1953 = _1743 ? as_type<float>(_1939) : _1725;
        _1919 = _1953;
    }
    float _1955 = _1919;
    float _1957 = fma(_1895, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1901);
    if (_1695)
    {
        float _1959 = _1775 ? as_type<float>(_1945) : _1725;
        _1883 = _1959;
    }
    float _1961 = _1883;
    float _1963 = fma(_1895, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1899);
    float _1965 = fma(_1895, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1903);
    float _1967 = fma(_1951, _1955, -0.5);
    float _1969 = -_1867;
    float _1971 = _1969 + 1.0;
    float _1973 = fma(_1829, _1875, _1963);
    float _1975 = fma(_1831, _1875, _1965);
    float _1977 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1979 = fma(_1783, _1875, _1957);
    float _1981 = fma(_824, _1967, _668);
    float _1983 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1973);
    float _1985 = fma(_1977, _1961, -0.5);
    float _1987 = _1076 * _1130;
    float _1989 = _1076 * _1174;
    float _1991 = _1076 * _1124;
    float _1993 = _1092 * _1130;
    float _1995 = fma(_718, _1985, _768);
    float _1997 = _1090 * _1174;
    float _1999 = _1092 * _1174;
    float _2001 = -_1068;
    float _2003 = fma(_2001, _1108, _1989);
    float _2005 = _1092 * _1124;
    float _2007 = fma(_1080, _1106, _1993);
    float _2009 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1979);
    float _2011 = -_1068;
    float _2013 = fma(_2011, _1106, _1987);
    float _2015 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1975);
    float _2017 = -_1068;
    float _2019 = fma(_2017, _1112, _1991);
    float _2021 = fma(_1078, _970, _2003);
    float _2023 = fma(_1086, _958, _2007);
    float _2025 = _1983 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2027 = _2009 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2029 = _2015 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2031 = fma(_1080, _1108, _1999);
    float _2033 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2035 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2037 = _2029 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2039 = fma(_1082, _1108, _1997);
    float _2041 = fma(_1078, _958, _2013);
    float _2043 = fma(_1080, _1112, _2005);
    float _2045 = fma(_1078, _962, _2019);
    float _2047 = fma(_1086, _970, _2031);
    float _2049 = _2021 * _1927;
    out.m_63.x = _2033;
    out.m_63.y = _2035;
    out.m_63.z = _2037;
    float _2051 = fma(_1082, _1106, _1947);
    float _2053 = fma(_1100, _970, _2039);
    float _2055 = _2041 * _1927;
    float _2057 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1761);
    float _2059 = fma(_1086, _962, _2043);
    float _2061 = _2045 * _1927;
    float _2063 = fma(_2047, _1923, _2049);
    float _2065 = fma(_1100, _958, _2051);
    float _2067 = fma(_2023, _1923, _2055);
    float _2069 = _1911 + 0.5;
    float _2071 = fma(_1082, _1112, _1949);
    float _2073 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2075 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2057);
    bool _2077 = _1340 > 0.0;
    bool _2079 = isnan(_1340);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan(0.0);
    bool _2085 = _2081 || _2083;
    float _2087 = fma(_2059, _1923, _2061);
    float _2089 = fma(_2053, _1933, _2063);
    float _2091 = fma(_2065, _1933, _2067);
    float _2093 = _1981 + 0.5;
    float _2095 = _1596 * 0.5;
    float _2097 = fma(_1100, _962, _2071);
    float _2099 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2101 = _2075 + _1596;
    float _2103 = _1626 + _1596;
    float _2105 = _1995 + 0.5;
    float _2107 = fma(_1642, -0.5, _2095);
    float _2109 = _1907 + 0.5;
    float _2111 = fma(_2097, _1933, _2087);
    float _2113 = _2101 * 0.5;
    float _2115 = _2103 * 0.5;
    float _2117 = _2099 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _2093;
    out.m_65.y = _2109;
    out.m_65.z = _2105;
    out.m_65.w = _2069;
    out.m_67.x = _2091;
    out.m_67.y = _2089;
    out.m_67.z = _2111;
    out.gl_Position.x = _1626;
    out.gl_Position.y = _1642;
    out.gl_Position.z = _2075;
    out.gl_Position.w = _1596;
    out.m_69.x = _2115;
    out.m_69.y = _2107;
    out.m_69.z = _2113;
    out.m_69.w = _1596;
    out.m_45.x = _2117;
    float _2119 = _2073 * _1656;
    float _2121 = -_2073;
    float _2123 = _2121 + 1.0;
    float _2125 = _1671 * _2119;
    float _2127 = _1671 * _2123;
    float _2129 = _1681 * _2119;
    float _2131 = fma(_1677, _2125, _1665);
    float _2133 = fma(_1679, _2125, _1667);
    float _2135 = fma(_1671, _2129, _1669);
    out.m_71.x = _2131;
    out.m_71.y = _2133;
    out.m_71.z = _2135;
    out.m_71.w = _2127;
    if (_2085)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2137 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2137;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _552 = false;
    bool _374 = false;
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
        float _2194 = as_type<float>(_106);
        out.gl_Position.z = _2194;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2264 = as_type<float>(_144);
        out.gl_Position.z = _2264;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_49.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _124 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _152 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    int _164 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _166 = _164 != 0;
    float _168 = _150 * _148;
    float _170 = 0.0;
    float _172 = _152;
    if (!_162)
    {
        float _174 = _152 * _152;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    float _182 = _178;
    if (!_162)
    {
        float _184 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    float _188 = in.m_47.x;
    float _190 = in.m_47.y;
    float _192 = in.m_47.z;
    float _194 = _180 * 6.283185482025146484375;
    float _196 = floor(_180);
    float _198 = _194 * 0.15915493667125701904296875;
    float _200 = _198 * 6.283185482025146484375;
    float _202 = cos(_200);
    float _204 = -_196;
    float _206 = _180 + _204;
    bool _208 = !_162;
    float _210 = _186;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _152 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _152);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_162;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _152 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _172 = _264;
    }
    float _266 = _172;
    float _268 = in.m_51.w;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _276 = _274 != 0;
    float _278 = in.m_42.x;
    float _280 = in.m_42.y;
    float _282 = in.m_42.z;
    float _284 = -_206;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _288 = _206 < 0.5;
    float _290 = float(_288);
    bool _292 = !_272;
    int _294 = _292 ? 0 : 1;
    float _296 = fma(_202, 0.5, 0.5);
    bool _298 = !_166;
    int _300 = _298 ? 0 : 1;
    float _302 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _304 = abs(_294);
    float _306 = -_290;
    float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _310 = -_296;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _314 = fma(_266, _188, _302);
    int _316 = abs(_300);
    float _318 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _320 = !_276;
    int _322 = _320 ? 0 : 1;
    float _324 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _326 = fma(_266, _190, _318);
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _330 = fma(_266, _192, _324);
    int _332 = abs(_322);
    float _334 = float(_304);
    float _336 = fma(_314, _268, _278);
    float _338 = float(_316);
    float _340 = fma(_326, _268, _280);
    float _342 = abs(_286);
    float _344 = _334 * _342;
    float _346 = fma(_330, _268, _282);
    float _348 = float(_332);
    float _350 = fma(_338, _312, _344);
    float _352 = abs(_308);
    float _354 = fma(_348, _352, _350);
    bool _356 = !_328;
    float _372;
    if (!_356)
    {
        float _358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _360 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _362 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _364 = _362 * _358;
        float _366 = floor(_364);
        float _368 = -_366;
        float _370 = _364 + _368;
        _372 = _370;
        _374 = true;
    }
    else
    {
        float _376 = float(_90);
        float _378 = 1.0 / _376;
        float _380 = _124 * _378;
        _372 = _380;
    }
    _374 = false;
    float _382 = _372;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _386 = _382 + _384;
    bool _388 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _390 = isnan(_382);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _402 = _382 + _400;
    bool _404 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _406 = isnan(_382);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _424 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _426 = isnan(_382);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -_398;
    float _438 = _436 + 1.0;
    float _440 = 1.0 / _422;
    float _442 = _434 * _438;
    float _444 = -_434;
    float _446 = _444 + 1.0;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _448;
    bool _452 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _454 = 1.0 / _418;
    float _456 = _414 * _446;
    float _458 = -_414;
    float _460 = _458 + 1.0;
    float _462 = _402 * _440;
    float _464 = _386 * _454;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _470;
    float _474 = fma(_450, _464, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _476 = fma(_468, _464, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _478 = fma(_472, _464, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _480 = in.m_51.x;
    float _482 = in.m_51.y;
    float _484 = in.m_51.z;
    float _486 = _474 * _456;
    float _488 = _476 * _456;
    float _490 = _478 * _456;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _504 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].x, _486);
    float _506 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].y, _488);
    float _508 = fma(_494, _462, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _510 = fma(_498, _462, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _512 = fma(_502, _462, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _514 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[143].z, _490);
    float _516 = fma(_508, _442, _504);
    float _518 = fma(_510, _442, _506);
    float _520 = fma(_512, _442, _514);
    float _522 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[145].x, _516);
    float _524 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[145].y, _518);
    float _526 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[145].z, _520);
    float _528 = _522 * _480;
    float _530 = _524 * _482;
    float _532 = _526 * _484;
    bool _534 = !_452;
    float _550;
    if (!_534)
    {
        float _536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _538 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _540 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _542 = _540 * _536;
        float _544 = floor(_542);
        float _546 = -_544;
        float _548 = _542 + _546;
        _550 = _548;
        _552 = true;
    }
    else
    {
        float _554 = float(_90);
        float _556 = 1.0 / _554;
        float _558 = _124 * _556;
        _550 = _558;
    }
    _552 = false;
    float _560 = _550;
    float _562 = in.m_49.z;
    float _564 = _340 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _568 = _566 != 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _576 = _574 != 0;
    float _578 = in.m_49.y;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _582 = _580 != 0;
    float _584 = _340 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _586 = _340 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _588 = _146 * 2.0;
    float _590 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[5].x, _564);
    float _592 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[4].x, _584);
    float _594 = fma(_336, (*spvDescriptorSet0.vp_c10)._m0[6].x, _586);
    float _596 = floor(_588);
    float _598 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _600 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[6].z, _594);
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _606 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[4].z, _592);
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _610 = !_568;
    int _612 = _610 ? 0 : 1;
    float _614 = _562 * 2.0;
    float _616 = -_604;
    float _618 = fma(_598, 2.0, _616);
    float _620 = _598;
    if (!_582)
    {
        _620 = _562;
    }
    float _622 = _620;
    float _624 = _606 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _626 = _578 * 2.0;
    float _628 = _578 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _630 = floor(_614);
    float _632 = _578 + _562;
    bool _634 = _596 > 0.0;
    float _636 = fma(_628, -2.0, _602);
    float _638 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[5].z, _590);
    bool _640 = _596 >= 0.0;
    bool _642 = isnan(_596);
    bool _644 = _640 || _642;
    bool _646 = isnan(0.0);
    bool _648 = _644 || _646;
    float _650 = _632 + (-1.0);
    float _652 = floor(_626);
    float _654 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _636);
    bool _656 = !_572;
    int _658 = _656 ? 0 : 1;
    float _660 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _662 = _648 ? 0 : 1;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _666 = -_124;
    float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[76].x, _618);
    float _670 = _626;
    float _672 = _632;
    float _674 = _622;
    if (!_582)
    {
        _670 = _578;
    }
    float _676 = _670;
    float _678 = _600 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _680 = _676;
    if (_582)
    {
        _680 = _146;
    }
    float _682 = _680;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _686 = _630 > 0.0;
    float _688 = -_624;
    float _690 = _688 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    bool _692 = _630 >= 0.0;
    bool _694 = isnan(_630);
    bool _696 = _692 || _694;
    bool _698 = isnan(0.0);
    bool _700 = _696 || _698;
    float _702 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[83].z, _664);
    float _704 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _706 = log2(_704);
    bool _708 = _686;
    if (!_582)
    {
        _672 = _562;
    }
    float _710 = _672;
    float _712 = _682 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _714 = _710;
    if (_582)
    {
        _674 = _578;
    }
    float _716 = _674;
    float _718 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _702);
    if (_582)
    {
        _714 = _578;
    }
    float _720 = _714;
    float _722 = -_684;
    float _724 = fma(_712, 2.0, _722);
    bool _726 = _652 > 0.0;
    float _728 = _716 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _730 = _652 >= 0.0;
    bool _732 = isnan(_652);
    bool _734 = _730 || _732;
    bool _736 = isnan(0.0);
    bool _738 = _734 || _736;
    float _740 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[83].w, _608);
    int _742 = ~_662;
    int _744 = _742 + 1;
    int _746 = _744 + 1;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _750 = abs(_658);
    float _752 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _740);
    int _754 = _746;
    if (!_634)
    {
        int _756 = ~_662;
        int _758 = _756 + 1;
        _754 = _758;
    }
    int _760 = _754;
    float _762 = _706 * _124;
    float _764 = float(_750);
    float _766 = -_124;
    float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[81].x, _724);
    float _770 = float(_760);
    float _772 = fma(_728, -2.0, _748);
    int _774 = _700 ? 0 : 1;
    float _776 = exp2(_762);
    float _778 = _764 * _770;
    float _780 = in.m_53.x;
    float _782 = in.m_53.y;
    float _784 = in.m_53.z;
    int _786 = ~_774;
    int _788 = _786 + 1;
    int _790 = _788 + 1;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _794 = 1.0 + _792;
    int _796 = _790;
    if (!_686)
    {
        int _798 = ~_774;
        int _800 = _798 + 1;
        _796 = _800;
    }
    int _802 = _796;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _806 = abs(_612);
    float _808 = 1.0 / _794;
    int _810 = _738 ? 0 : 1;
    float _812 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _804);
    float _814 = float(_802);
    float _816 = _778 * (-2.0);
    int _818 = ~_810;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    float _824 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _812);
    float _826 = -_776;
    float _828 = _826 + 1.0;
    int _830 = _822;
    if (!_726)
    {
        int _832 = ~_810;
        int _834 = _832 + 1;
        _830 = _834;
    }
    int _836 = _830;
    float _838 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _772);
    float _840 = _578 + (-0.5);
    float _842 = float(_806);
    float _844 = -_678;
    float _846 = _844 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _848 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _850 = isnan(1.0);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _856 = _852 || _854;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _860 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _868 = _864 || _866;
    float _870 = _842 * _814;
    float _872 = _638 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _874 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[78].w, _858);
    float _876 = _868 ? _828 : 0.0;
    float _878 = fma(_816, _782, _782);
    float _880 = -_872;
    float _882 = _880 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _884 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _874);
    float _886 = fma(_660, _816, _660);
    float _888 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[196].y, _878);
    float _890 = _882 * _882;
    float _892 = _872;
    if (_856)
    {
        float _894 = _876 * _808;
        _126 = _894;
    }
    float _896 = _126;
    bool _898 = !_576;
    int _900 = _898 ? 0 : 1;
    float _902 = _870 * (-2.0);
    float _904 = fma(_690, _690, _890);
    float _906 = fma(_886, _896, _888);
    int _908 = abs(_900);
    float _910 = _146 + _578;
    float _912 = fma(_846, _846, _904);
    float _914 = _906 * 0.15915493667125701904296875;
    float _916 = _910 + (-1.0);
    float _918 = float(_908);
    float _920 = fma(_902, _780, _780);
    float _922 = float(_836);
    float _924 = rsqrt(_912);
    float _926 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _928 = _146 + (-0.5);
    float _930 = _146 + _562;
    float _932 = _918 * _922;
    float _934 = fma(_926, _902, _926);
    float _936 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[196].x, _920);
    float _938 = _930 + (-1.0);
    float _940 = _932 * (-2.0);
    float _942 = fma(_934, _896, _936);
    float _944 = _914 * 6.283185482025146484375;
    float _946 = sin(_944);
    float _948 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _950 = fma(_940, _784, _784);
    float _952 = _562 + (-0.5);
    float _954 = _942 * 0.15915493667125701904296875;
    float _956 = fma(_948, _940, _948);
    float _958 = _690 * _924;
    float _960 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[196].z, _950);
    float _962 = _846 * _924;
    float _964 = in.m_55.x;
    float _966 = in.m_55.y;
    float _968 = in.m_55.z;
    float _970 = _882 * _924;
    float _972 = fma(_956, _896, _960);
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _976 = _958 * _974;
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _980 = _962 * _978;
    float _982 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _984 = _970 * _982;
    float _986 = _972 * 0.15915493667125701904296875;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _990 = -_976;
    float _992 = fma(_962, _988, _990);
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _996 = -_980;
    float _998 = fma(_970, _994, _996);
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1002 = -_984;
    float _1004 = fma(_958, _1000, _1002);
    float _1006 = _914 * 6.283185482025146484375;
    float _1008 = cos(_1006);
    float _1010 = _992 * _992;
    float _1012 = _354 * _528;
    float _1014 = _354 * _530;
    float _1016 = _354 * _532;
    float _1018 = fma(_998, _998, _1010);
    float _1020 = _1012 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1022 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1024 = _954 * 6.283185482025146484375;
    float _1026 = sin(_1024);
    float _1028 = fma(_1004, _1004, _1018);
    float _1030 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1032 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1034 = isnan(0.5);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1040 = _1036 || _1038;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _964);
    float _1044 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _966);
    float _1046 = _954 * 6.283185482025146484375;
    float _1048 = cos(_1046);
    float _1050 = _1020 * _1042;
    float _1052 = _1022 * _1044;
    float _1054 = _986 * 6.283185482025146484375;
    float _1056 = cos(_1054);
    float _1058 = _1026 * _1008;
    float _1060 = _1026 * _946;
    float _1062 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _968);
    float _1064 = _1030 * _1062;
    float _1066 = _986 * 6.283185482025146484375;
    float _1068 = sin(_1066);
    float _1070 = _1048 * _946;
    float _1072 = _1048 * _1008;
    float _1074 = rsqrt(_1028);
    float _1076 = _1048 * _1056;
    float _1078 = _1026 * _1056;
    float _1080 = _1008 * _1056;
    float _1082 = _946 * _1056;
    float _1084 = -_1070;
    float _1086 = fma(_1068, _1058, _1084);
    float _1088 = -_1058;
    float _1090 = fma(_1068, _1070, _1088);
    float _1092 = fma(_1068, _1072, _1060);
    float _1094 = _1076 * _1052;
    float _1096 = -_1052;
    float _1098 = _1068 * _1096;
    float _1100 = fma(_1068, _1060, _1072);
    float _1102 = _1078 * _1052;
    float _1104 = fma(_1092, _1050, _1094);
    float _1106 = _998 * _1074;
    float _1108 = _992 * _1074;
    float _1110 = fma(_1080, _1050, _1098);
    float _1112 = _1004 * _1074;
    float _1114 = _970 * _1106;
    float _1116 = _962 * _1108;
    float _1118 = fma(_1086, _1050, _1102);
    float _1120 = _872 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1122 = -_1114;
    float _1124 = fma(_958, _1108, _1122);
    float _1126 = fma(_1090, _1064, _1104);
    float _1128 = -_1116;
    float _1130 = fma(_970, _1112, _1128);
    float _1132 = fma(_1082, _1064, _1110);
    float _1134 = fma(_1100, _1064, _1118);
    float _1136 = _1124 * _1126;
    float _1138 = _1130 * _1126;
    float _1140 = fma(_1112, _1132, _1136);
    float _1142 = fma(_1106, _1132, _1138);
    float _1144 = fma(_962, _1134, _1140);
    float _1146 = fma(_958, _1134, _1142);
    float _1148 = _678 + _1144;
    float _1150 = _624 + _1146;
    float _1152 = _872 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1154 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1156 = _1148 + _1154;
    float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1160 = _1150 + _1158;
    float _1162 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1152);
    float _1164 = _958 * _1112;
    float _1166 = _1156 * _1156;
    float _1168 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1120);
    float _1170 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1162);
    float _1172 = -_1164;
    float _1174 = fma(_962, _1106, _1172);
    float _1176 = fma(_1160, _1160, _1166);
    float _1178 = fma(_678, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1168);
    float _1180 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1182 = _1174 * _1126;
    float _1184 = sqrt(_1176);
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1188 = fma(_1108, _1132, _1182);
    float _1190 = _1186 + _1180;
    float _1192 = fma(_970, _1134, _1188);
    float _1194 = 1.0 / _1180;
    float _1196 = _872 + _1192;
    float _1198 = _1192;
    float _1200 = _1132;
    float _1202 = _1126;
    int _1204 = as_type<int>(_966);
    int _1206 = as_type<int>(_968);
    if (_1040)
    {
        _1198 = 1.0;
    }
    float _1208 = _1198;
    bool _1210 = _1184 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = _1190 * _1194;
    float _1214 = _1212 * 0.5;
    float _1216 = _1184;
    float _1218 = _1208;
    if (!_1210)
    {
        _1200 = _1150;
    }
    float _1220 = _1200;
    float _1222 = _1220;
    if (!_1210)
    {
        _892 = _1148;
    }
    float _1224 = _892;
    float _1226 = _1224;
    if (!_1210)
    {
        _1202 = _1196;
    }
    float _1228 = _1202;
    bool _1230 = !_1210;
    float _1232 = _1228;
    if (!_1230)
    {
        float _1234 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1238 = _1184 + _1236;
        float _1240 = _1196 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1242 = rsqrt(_1176);
        float _1244 = _1238 * _1234;
        float _1246 = _1244 * 0.15915493667125701904296875;
        float _1248 = _1246 * 6.283185482025146484375;
        float _1250 = cos(_1248);
        float _1252 = _1246 * 6.283185482025146484375;
        float _1254 = sin(_1252);
        float _1256 = _1250 + (-1.0);
        float _1258 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1260 = fma(_1254, _1240, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1262 = fma(_1196, _1250, _1258);
        float _1264 = _1242 * _1260;
        float _1266 = fma(_1160, _1264, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1268 = fma(_1156, _1264, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1232 = _1262;
        _1222 = _1266;
        _1226 = _1268;
        _1216 = _1264;
    }
    float _1270 = _1232;
    float _1272 = _1222;
    float _1274 = _1226;
    float _1276 = _1216;
    float _1278 = _1276;
    if (!_1040)
    {
        float _1280 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1282 = _1280 * 0.15915493667125701904296875;
        float _1284 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1288 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1286);
        float _1290 = _1282 * 6.283185482025146484375;
        float _1292 = cos(_1290);
        float _1294 = _1284 * 0.15915493667125701904296875;
        float _1296 = _1282 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        float _1300 = 1.0 / _1292;
        float _1302 = _1294 * 6.283185482025146484375;
        float _1304 = cos(_1302);
        float _1306 = _1298 * _1300;
        float _1308 = _1294 * 6.283185482025146484375;
        float _1310 = sin(_1308);
        float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1314 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1312;
        float _1316 = _1304 * _1306;
        float _1318 = 1.0 / _1288;
        float _1320 = 1.0 / _1316;
        float _1322 = 1.0 / _1314;
        float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1326 = _1318 * _1324;
        float _1328 = _1310 * _1320;
        float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1332 = fma(_1328, _1326, _1330);
        float _1334 = _1332 * _1322;
        float _1336 = precise::clamp(_1334, 0.0, 1.0);
        _1278 = _1322;
        _1218 = _1336;
    }
    float _1338 = _1278;
    float _1340 = _1218;
    float _1342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1344 = _1270 + _1342;
    float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1348 = _1272 + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1352 = _1274 + _1350;
    float _1354 = _1344 * _1344;
    float _1356 = fma(_1348, _1348, _1354);
    float _1358 = fma(_1352, _1352, _1356);
    float _1360 = rsqrt(_1358);
    float _1362 = sqrt(_1358);
    float _1364 = _1360 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1366 = _1348 * _1364;
    float _1368 = _1352 * _1364;
    float _1370 = _1366 * _1366;
    float _1372 = _1368 * _1368;
    float _1374 = _1370 + _1372;
    float _1376 = sqrt(_1374);
    bool _1378 = _1376 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1382 = _1376 + _1380;
    float _1384 = _1352;
    float _1386 = _1374;
    float _1388 = _1382;
    float _1390 = _1338;
    float _1392 = _1344;
    if (_1378)
    {
        float _1394 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1384 = _1394;
    }
    float _1396 = _1384;
    if (_1378)
    {
        float _1398 = rsqrt(_1374);
        _1386 = _1398;
    }
    float _1400 = _1386;
    if (_1378)
    {
        float _1402 = _1382 * _1396;
        _1388 = _1402;
    }
    float _1404 = _1388;
    if (_1378)
    {
        float _1406 = _1404 * 0.15915493667125701904296875;
        _1390 = _1406;
    }
    float _1408 = _1390;
    float _1410 = _1354;
    float _1412 = _1408;
    if (_1378)
    {
        float _1414 = _1408 * 6.283185482025146484375;
        float _1416 = sin(_1414);
        _1410 = _1416;
    }
    float _1418 = _1410;
    float _1420 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1422 = precise::max(0.0, _1420);
    float _1424 = _1360;
    float _1426 = _1422;
    float _1428 = _1420;
    if (_1378)
    {
        float _1430 = _1408 * 6.283185482025146484375;
        float _1432 = cos(_1430);
        _1424 = _1432;
    }
    float _1434 = _1424;
    float _1436 = -_1364;
    float _1438 = -_1422;
    float _1440 = fma(_1344, _1436, _1438);
    if (!_1378)
    {
        _1426 = _1366;
    }
    float _1442 = _1426;
    float _1444 = _1442;
    if (_1378)
    {
        float _1446 = _1440 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1428 = _1446;
    }
    float _1448 = _1428;
    float _1450 = _1418;
    float _1452 = _1448;
    if (_1378)
    {
        float _1454 = fma(_1418, _1448, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1450 = _1454;
    }
    float _1456 = _1450;
    float _1458 = _1456;
    if (!_1378)
    {
        _1452 = _1440;
    }
    float _1460 = _1452;
    float _1462 = _1460;
    float _1464 = _1434;
    if (_1378)
    {
        float _1466 = _1434 + (-1.0);
        _1392 = _1466;
    }
    float _1468 = _1392;
    float _1470 = 0.0;
    float _1472 = _1468;
    if (_1378)
    {
        float _1474 = _1400 * _1456;
        _1470 = _1474;
    }
    float _1476 = _1470;
    if (!_1378)
    {
        _1458 = _1370;
    }
    float _1478 = _1458;
    float _1480 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1482 = _1478;
    if (_1378)
    {
        float _1484 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1412 = _1484;
    }
    float _1486 = _1412;
    if (_1378)
    {
        float _1488 = _1366 * _1476;
        _1444 = _1488;
    }
    float _1490 = _1444;
    if (!_1378)
    {
        _1472 = _1368;
    }
    float _1492 = _1472;
    float _1494 = _1492;
    if (_1378)
    {
        float _1496 = _1368 * _1476;
        _1494 = _1496;
    }
    float _1498 = _1494;
    if (_1378)
    {
        float _1500 = fma(_1440, _1434, _1486);
        _1462 = _1500;
    }
    float _1502 = _1462;
    if (_1378)
    {
        float _1504 = _1490 * _1490;
        _1482 = _1504;
    }
    float _1506 = _1482;
    if (!_1378)
    {
        _1464 = _1372;
    }
    float _1508 = _1464;
    float _1510 = _1508;
    if (_1378)
    {
        float _1512 = _1498 * _1498;
        _1510 = _1512;
    }
    float _1514 = _1510;
    float _1516 = fma(_1502, _1502, _1506);
    float _1518 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1520 = _1516 + _1514;
    float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1524 = fma(_1362, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1522);
    float _1526 = precise::clamp(_1524, 0.0, 1.0);
    float _1528 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1480);
    float _1530 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1532 = -_1526;
    float _1534 = _1532 + 1.0;
    float _1536 = rsqrt(_1520);
    float _1538 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1528);
    float _1540 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1542 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1530);
    float _1544 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1546 = _1538 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1548 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1540);
    float _1550 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1542);
    float _1552 = abs(_1534);
    float _1554 = log2(_1552);
    float _1556 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1558 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1548);
    float _1560 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1562 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1544);
    float _1564 = -_1556;
    float _1566 = fma(_1564, _1518, 1.0);
    float _1568 = _1558 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1570 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1572 = _1536 * _1490;
    float _1574 = _1536 * _1502;
    float _1576 = fma(_1274, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1562);
    float _1578 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1570);
    float _1580 = _1572 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1582 = _1536 * _1498;
    float _1584 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1586 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1578);
    float _1588 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1590 = -_1580;
    float _1592 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1590);
    float _1594 = log2(_1566);
    float _1596 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1586);
    float _1598 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1600 = -_1582;
    float _1602 = fma(_1600, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1592);
    float _1604 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1606 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1598);
    float _1608 = fma(_1602, -0.5, 0.5);
    float _1610 = exp2(_1588);
    float _1612 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1604);
    float _1614 = fma(_1602, 0.5, 0.5);
    float _1616 = _1574 + 1.0;
    float _1618 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1606);
    float _1620 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1612);
    float _1622 = fma(_1614, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1624 = 1.0 / _1596;
    float _1626 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1618);
    float _1628 = fma(_1614, _1622, -0.212114393711090087890625);
    float _1630 = _1594 * 0.693147182464599609375;
    float _1632 = fma(_1614, _1628, 1.570728778839111328125);
    float _1634 = _1630 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1636 = sqrt(_1608);
    float _1638 = -_1574;
    float _1640 = fma(_1610, _1616, _1638);
    float _1642 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1620);
    float _1644 = fma(_1640, 0.5, 0.5);
    float _1646 = _1626 * _1624;
    float _1648 = _1642 * _1624;
    float _1650 = fma(_1646, 0.5, 0.5);
    float _1652 = fma(_1648, -0.5, 0.5);
    float _1654 = _1636 * 0.636619746685028076171875;
    float3 _4611 = float3(_1650, _1652, _1634);
    float _1656 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4611, float3(0.0), isnan(_4611)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4611, float3(0.0), isnan(_4611)), level(0.0)).x;
    float _1658 = -_1632;
    float _1660 = fma(_1654, _1658, 1.0);
    float3 _4627 = float3(_1650, _1652, _1634);
    float4 _1663 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4627, float3(0.0), isnan(_4627)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4627, float3(0.0), isnan(_4627)), level(0.0)).xyzw;
    float _1665 = _1663.x;
    float _1667 = _1663.y;
    float _1669 = _1663.z;
    float _1671 = _1663.w;
    float2 _4644 = float2(_1660, _1644);
    float3 _1675 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4644, float2(0.0), isnan(_4644)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4644, float2(0.0), isnan(_4644)), level(0.0)).xyz;
    float _1677 = _1675.x;
    float _1679 = _1675.y;
    float _1681 = _1675.z;
    float _1683 = in.m_57.y;
    float _1685 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1687 = in.m_49.w;
    float _1689 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1689;
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1695 = _1693 != 0;
    float _1697 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1699 = _560 + _1697;
    int _1701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1703 = _1701 != 0;
    float _1705 = 1.0 / _1691;
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1709 = _1707 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1711 = _578 > 0.5;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1713;
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1719 = _1717 != 0;
    float _1721 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1723 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1721;
    float _1725 = in.m_57.x;
    float _1727 = 1.0 / _1709;
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1731 = _1729 != 0;
    float _1733 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1735 = _560 + _1733;
    float _1737 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1739 = _1737 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    if (_1703)
    {
        bool _1741 = _146 > 0.5;
        _708 = _1741;
    }
    bool _1743 = _708;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1747 = _1745 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1749 = -_1683;
    float _1751 = _1749 + 1.0;
    float _1753 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1755 = _1699 * _1705;
    float _1757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1759 = _1687 > 0.5;
    float _1761 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1753);
    float _1763 = fma(_1715, _1755, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1765 = fma(_1723, _1755, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1767 = _1759 ? as_type<int>(_1751) : as_type<int>(_1683);
    out.m_59.x = _1272;
    out.m_59.y = _1270;
    out.m_59.z = _1274;
    bool _1769 = _1759;
    float _1771 = _1683;
    if (_1695)
    {
        bool _1773 = _562 > 0.5;
        _1769 = _1773;
    }
    bool _1775 = _1769;
    float _1777 = _1735 * _1727;
    float _1779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1781 = _1719 ? as_type<float>(_1767) : _1683;
    float _1783 = fma(_1739, _1777, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1785 = _966 != 0.0;
    bool _1787 = isnan(_966);
    bool _1789 = _1785 || _1787;
    bool _1791 = isnan(0.0);
    bool _1793 = _1789 || _1791;
    float _1795 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1797 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1795;
    float _1799 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1801 = _1799 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1803 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1805 = isnan(_560);
    bool _1807 = _1803 || _1805;
    bool _1809 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1811 = _1807 || _1809;
    float _1813 = float(_1811);
    float _1815 = fma(_1797, _1755, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1817 = _964 == 0.0;
    bool _1819 = !_1793;
    bool _1821 = _1817 && _1819;
    float _1823 = in.m_61.x;
    float _1825 = in.m_61.y;
    float _1827 = in.m_61.z;
    float _1829 = fma(_1801, _1777, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1831 = fma(_1747, _1777, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1833 = _968 == 0.0;
    bool _1835 = _1833 && _1821;
    float _1837 = -_1813;
    float _1839 = _1837 + 1.0;
    bool _1841 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1843 = isnan(_560);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1849 = _1845 || _1847;
    float _1851 = float(_1849);
    float _1853 = _1779 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1855 = _560 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1857 = isnan(_560);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    float _1867 = exp2(_1685);
    float _1869 = (*spvDescriptorSet0.vp_c9)._m0[124].x;
    if (_1731)
    {
        float _1871 = _1711 ? _1751 : _1683;
        _1771 = _1871;
    }
    float _1873 = _1771;
    float _1875 = _1851 * _1839;
    float _1877 = -_1851;
    float _1879 = _1877 + 1.0;
    float _1881 = _1757 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1883 = _1725;
    if (!_1703)
    {
        _1869 = _1725;
    }
    float _1885 = _1869;
    float _1887 = fma(_1781, _1853, -0.5);
    float _1889 = _1865 * _1879;
    float _1891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1893 = -_1865;
    float _1895 = _1893 + 1.0;
    float _1897 = fma(_1881, _1873, -0.5);
    float _1899 = _1815 * _1889;
    float _1901 = _1763 * _1889;
    float _1903 = _1765 * _1889;
    float _1905 = -_654;
    float _1907 = fma(_884, _1897, _1905);
    float _1909 = -_838;
    float _1911 = fma(_752, _1887, _1909);
    float _1913 = _1823;
    float _1915 = _1825;
    float _1917 = _1827;
    float _1919 = _1885;
    if (!_1835)
    {
        float _1921 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1823);
        _1913 = _1921;
    }
    float _1923 = _1913;
    if (!_1835)
    {
        float _1925 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1825);
        _1915 = _1925;
    }
    float _1927 = _1915;
    float _1929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_1835)
    {
        float _1931 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1827);
        _1917 = _1931;
    }
    float _1933 = _1917;
    if (_1703)
    {
        float _1935 = -_1725;
        float _1937 = _1935 + 1.0;
        _1204 = as_type<int>(_1937);
    }
    int _1939 = _1204;
    if (_1695)
    {
        float _1941 = -_1725;
        float _1943 = _1941 + 1.0;
        _1206 = as_type<int>(_1943);
    }
    int _1945 = _1206;
    float _1947 = _1090 * _1130;
    float _1949 = _1090 * _1124;
    float _1951 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1703)
    {
        float _1953 = _1743 ? as_type<float>(_1939) : _1725;
        _1919 = _1953;
    }
    float _1955 = _1919;
    float _1957 = fma(_1895, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1901);
    if (_1695)
    {
        float _1959 = _1775 ? as_type<float>(_1945) : _1725;
        _1883 = _1959;
    }
    float _1961 = _1883;
    float _1963 = fma(_1895, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1899);
    float _1965 = fma(_1895, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1903);
    float _1967 = fma(_1951, _1955, -0.5);
    float _1969 = -_1867;
    float _1971 = _1969 + 1.0;
    float _1973 = fma(_1829, _1875, _1963);
    float _1975 = fma(_1831, _1875, _1965);
    float _1977 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1979 = fma(_1783, _1875, _1957);
    float _1981 = fma(_824, _1967, _668);
    float _1983 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1973);
    float _1985 = fma(_1977, _1961, -0.5);
    float _1987 = _1076 * _1130;
    float _1989 = _1076 * _1174;
    float _1991 = _1076 * _1124;
    float _1993 = _1092 * _1130;
    float _1995 = fma(_718, _1985, _768);
    float _1997 = _1090 * _1174;
    float _1999 = _1092 * _1174;
    float _2001 = -_1068;
    float _2003 = fma(_2001, _1108, _1989);
    float _2005 = _1092 * _1124;
    float _2007 = fma(_1080, _1106, _1993);
    float _2009 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1979);
    float _2011 = -_1068;
    float _2013 = fma(_2011, _1106, _1987);
    float _2015 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1975);
    float _2017 = -_1068;
    float _2019 = fma(_2017, _1112, _1991);
    float _2021 = fma(_1078, _970, _2003);
    float _2023 = fma(_1086, _958, _2007);
    float _2025 = _1983 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2027 = _2009 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2029 = _2015 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2031 = fma(_1080, _1108, _1999);
    float _2033 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2035 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2037 = _2029 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2039 = fma(_1082, _1108, _1997);
    float _2041 = fma(_1078, _958, _2013);
    float _2043 = fma(_1080, _1112, _2005);
    float _2045 = fma(_1078, _962, _2019);
    float _2047 = fma(_1086, _970, _2031);
    float _2049 = _2021 * _1927;
    out.m_63.x = _2033;
    out.m_63.y = _2035;
    out.m_63.z = _2037;
    float _2051 = fma(_1082, _1106, _1947);
    float _2053 = fma(_1100, _970, _2039);
    float _2055 = _2041 * _1927;
    float _2057 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1761);
    float _2059 = fma(_1086, _962, _2043);
    float _2061 = _2045 * _1927;
    float _2063 = fma(_2047, _1923, _2049);
    float _2065 = fma(_1100, _958, _2051);
    float _2067 = fma(_2023, _1923, _2055);
    float _2069 = _1911 + 0.5;
    float _2071 = fma(_1082, _1112, _1949);
    float _2073 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2075 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2057);
    bool _2077 = _1340 > 0.0;
    bool _2079 = isnan(_1340);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan(0.0);
    bool _2085 = _2081 || _2083;
    float _2087 = fma(_2059, _1923, _2061);
    float _2089 = fma(_2053, _1933, _2063);
    float _2091 = fma(_2065, _1933, _2067);
    float _2093 = _1981 + 0.5;
    float _2095 = _1596 * 0.5;
    float _2097 = fma(_1100, _962, _2071);
    float _2099 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2101 = _2075 + _1596;
    float _2103 = _1626 + _1596;
    float _2105 = _1995 + 0.5;
    float _2107 = fma(_1642, -0.5, _2095);
    float _2109 = _1907 + 0.5;
    float _2111 = fma(_2097, _1933, _2087);
    float _2113 = _2101 * 0.5;
    float _2115 = _2103 * 0.5;
    float _2117 = _2099 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _2093;
    out.m_65.y = _2109;
    out.m_65.z = _2105;
    out.m_65.w = _2069;
    out.m_67.x = _2091;
    out.m_67.y = _2089;
    out.m_67.z = _2111;
    out.gl_Position.x = _1626;
    out.gl_Position.y = _1642;
    out.gl_Position.z = _2075;
    out.gl_Position.w = _1596;
    out.m_69.x = _2115;
    out.m_69.y = _2107;
    out.m_69.z = _2113;
    out.m_69.w = _1596;
    out.m_45.x = _2117;
    float _2119 = _2073 * _1656;
    float _2121 = -_2073;
    float _2123 = _2121 + 1.0;
    float _2125 = _1671 * _2119;
    float _2127 = _1671 * _2123;
    float _2129 = _1681 * _2119;
    float _2131 = fma(_1677, _2125, _1665);
    float _2133 = fma(_1679, _2125, _1667);
    float _2135 = fma(_1671, _2129, _1669);
    out.m_71.x = _2131;
    out.m_71.y = _2133;
    out.m_71.z = _2135;
    out.m_71.w = _2127;
    if (_2085)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2137 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2137;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

