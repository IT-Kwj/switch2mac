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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_63 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_65 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad5 [[user(locn5)]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad5 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _986 = false;
    bool _374 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1478 = as_type<float>(_108);
        out.gl_Position.z = _1478;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1547 = as_type<float>(_144);
        out.gl_Position.z = _1547;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _152 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _188 = in.m_49.x;
    float _190 = in.m_49.y;
    float _192 = in.m_49.z;
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
    float _268 = in.m_53.w;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _276 = _274 != 0;
    float _278 = in.m_44.x;
    float _280 = in.m_44.y;
    float _282 = in.m_44.z;
    bool _284 = _206 < 0.5;
    float _286 = float(_284);
    float _288 = -_206;
    float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _292 = fma(_202, 0.5, 0.5);
    bool _294 = !_272;
    int _296 = _294 ? 0 : 1;
    float _298 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _300 = -_286;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _304 = -_292;
    float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _308 = abs(_296);
    float _310 = fma(_266, _188, _298);
    bool _312 = !_166;
    int _314 = _312 ? 0 : 1;
    float _316 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _318 = !_276;
    int _320 = _318 ? 0 : 1;
    float _322 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _324 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _326 = fma(_266, _190, _316);
    int _328 = abs(_314);
    float _330 = fma(_266, _192, _322);
    int _332 = abs(_320);
    float _334 = float(_308);
    float _336 = float(_328);
    float _338 = abs(_290);
    float _340 = _334 * _338;
    float _342 = fma(_310, _268, _278);
    float _344 = fma(_326, _268, _280);
    float _346 = float(_332);
    float _348 = fma(_336, _306, _340);
    float _350 = fma(_330, _268, _282);
    float _352 = abs(_302);
    float _354 = fma(_346, _352, _348);
    bool _356 = !_324;
    float _372;
    if (!_356)
    {
        float _358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _360 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _362 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _364 = _362 * _358;
        float _366 = floor(_364);
        float _368 = -_366;
        float _370 = _364 + _368;
        _372 = _370;
        _374 = true;
    }
    else
    {
        float _376 = float(_92);
        float _378 = 1.0 / _376;
        float _380 = _126 * _378;
        _372 = _380;
    }
    _374 = false;
    float _382 = _372;
    float _384 = _344 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _386 = _344 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _388 = _344 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _390 = in.m_55.y;
    float _392 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _384);
    float _394 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _386);
    float _396 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _388);
    float _398 = in.m_51.y;
    float _400 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].z, _392);
    float _402 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].z, _394);
    float _404 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    float _406 = _400 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _408 = _402 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _410 = _404 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _414 = _412 != 0;
    float _416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _418 = _406 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _422 = _408 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _426 = _410 + _424;
    float _428 = _418 * _418;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _432 = _430 != 0;
    float _434 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _436 = fma(_422, _422, _428);
    float _438 = in.m_55.x;
    float _440 = fma(_426, _426, _436);
    float _442 = in.m_53.x;
    float _444 = in.m_53.y;
    float _446 = in.m_53.z;
    bool _448 = _398 > 0.5;
    float _450 = rsqrt(_440);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = 1.0 / _454;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _460 = _418 * _450;
    float _462 = _422 * _450;
    float _464 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[78].w, _458);
    float _466 = -_460;
    float _468 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _418);
    float _470 = -_462;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _422);
    float _474 = _444 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _476 = -_390;
    float _478 = _476 + 1.0;
    float _480 = _468 * _468;
    float _482 = _442 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _484 = _446 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _486 = _354 * _474;
    float _488 = fma(_472, _472, _480);
    float _490 = _426 * _450;
    float _492 = _390;
    float _494 = _438;
    float _496 = _406;
    if (_414)
    {
        float _498 = _448 ? _478 : _390;
        _492 = _498;
    }
    float _500 = _492;
    float _502 = _398 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _504 = in.m_57.x;
    float _506 = in.m_57.y;
    float _508 = in.m_57.z;
    float _510 = -_490;
    float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _426);
    float _514 = _354 * _482;
    bool _516 = _146 > 0.5;
    bool _518 = _516 && _432;
    float _520 = fma(_512, _512, _488);
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _524 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _526 = sqrt(_520);
    float _528 = _354 * _484;
    float _530 = -_522;
    float _532 = fma(_434, 2.0, _530);
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _536 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _538 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _542 = fma(_502, -2.0, _534);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _544;
    float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _550 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _540);
    float _552 = _546 * _456;
    float _554 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _506);
    float _556 = _450 * _526;
    float _558 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _504);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _564 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _550);
    float _566 = _524 * _556;
    float _568 = _536 * _556;
    float _570 = 1.0 / _562;
    float _572 = _538 * _556;
    float _574 = _566 * _554;
    float _576 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _508);
    float _578 = _568 * _558;
    float _580 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _542);
    float _582 = _574 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _584 = _574 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _586 = _572 * _576;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _592 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[8].x, _582);
    float _594 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[10].x, _584);
    float _596 = _548 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _600 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[8].z, _592);
    float _602 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[10].z, _594);
    float _604 = fma(_596, _500, -0.5);
    float _606 = _590 * _570;
    float _608 = _408 + _600;
    float _610 = _410 + _602;
    float _612 = -_126;
    float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[76].x, _532);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _618 = _382 + _616;
    float _620 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _622 = _608 + _620;
    float _624 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _626 = _610 + _624;
    float _628 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _464);
    float _630 = fma(_552, _618, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _632 = _622 * _622;
    float _634 = _626 * _626;
    float _636 = in.m_59.x;
    float _638 = in.m_59.y;
    float _640 = in.m_59.z;
    bool _642 = _506 != 0.0;
    bool _644 = isnan(_506);
    bool _646 = _642 || _644;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    float _652 = -_580;
    float _654 = fma(_628, _604, _652);
    float _656 = _632 + _634;
    bool _658 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _660 = isnan(_382);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = _574 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _672 = _580;
    float _674 = _506;
    float _676 = _508;
    float _678 = _654;
    if (!_432)
    {
        _672 = _438;
    }
    float _680 = _672;
    float _682 = sqrt(_656);
    bool _684 = _504 == 0.0;
    bool _686 = !_650;
    bool _688 = _684 && _686;
    float _690 = _680;
    if (_518)
    {
        float _692 = -_438;
        float _694 = _692 + 1.0;
        _494 = _694;
    }
    float _696 = _494;
    bool _698 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _700 = isnan(_382);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -_668;
    float _712 = _710 + 1.0;
    bool _714 = _508 == 0.0;
    bool _716 = _714 && _688;
    float _718 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[9].x, _670);
    if (_432)
    {
        _690 = _696;
    }
    float _720 = _690;
    float _722 = _708 * _712;
    bool _724 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _726 = isnan(_382);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = -_708;
    float _738 = _736 + 1.0;
    float _740 = _598 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _742 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[9].z, _718);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _746 = _382 + _744;
    float _748 = _734 * _738;
    float _750 = fma(_740, _720, -0.5);
    bool _752 = _682 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _754 = -_734;
    float _756 = _754 + 1.0;
    float _758 = _630 * _748;
    float _760 = _406 + _742;
    float _762 = _638;
    float _764 = _636;
    float _766 = _640;
    float _768 = _742;
    float _770 = _758;
    if (!_716)
    {
        float _772 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[17].y, _638);
        _762 = _772;
    }
    float _774 = _762;
    if (!_716)
    {
        float _776 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[17].y, _636);
        _764 = _776;
    }
    float _778 = _764;
    float _780 = fma(_564, _750, _614);
    float _782 = _780;
    if (!_716)
    {
        float _784 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[17].y, _640);
        _766 = _784;
    }
    float _786 = _766;
    float _788 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[115].x, _758);
    float _790 = fma(_606, _746, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _792 = _774 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (!_752)
    {
        _768 = _634;
    }
    float _794 = _768;
    float _796 = _794;
    if (!_752)
    {
        _496 = _632;
    }
    float _798 = _496;
    float _800 = _798;
    if (!_752)
    {
        _674 = _608;
    }
    float _802 = _674;
    float _804 = _802;
    if (!_752)
    {
        _676 = _610;
    }
    float _806 = _676;
    float _808 = _806;
    if (!_752)
    {
        _770 = _760;
    }
    float _810 = _770;
    bool _812 = !_752;
    float _814 = _810;
    if (!_812)
    {
        float _816 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _818 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _820 = _682 + _818;
        float _822 = _760 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _824 = rsqrt(_656);
        float _826 = _820 * _816;
        float _828 = _826 * 0.15915493667125701904296875;
        float _830 = _828 * 6.283185482025146484375;
        float _832 = sin(_830);
        float _834 = _828 * 6.283185482025146484375;
        float _836 = cos(_834);
        float _838 = fma(_832, _822, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _840 = _824 * _838;
        float _842 = _836 + (-1.0);
        float _844 = fma(_622, _840, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _846 = fma(_626, _840, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _848 = _842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _850 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _852 = _844 + _850;
        float _854 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _856 = _846 + _854;
        float _858 = fma(_760, _836, _848);
        float _860 = _852 * _852;
        float _862 = _856 * _856;
        _814 = _858;
        _800 = _860;
        _796 = _862;
        _804 = _844;
        _808 = _846;
    }
    float _864 = _814;
    float _866 = _800;
    float _868 = _796;
    float _870 = _804;
    float _872 = _808;
    float _874 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _876 = _864 + _874;
    float _878 = _774 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _880 = _774 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _882 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[8].x, _792);
    float _884 = fma(_790, _722, _788);
    float _886 = fma(_876, _876, _866);
    float _888 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[9].x, _878);
    float _890 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[10].x, _880);
    float _892 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].z, _882);
    float _894 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[117].x, _884);
    float _896 = _886 + _868;
    float _898 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[9].z, _888);
    float _900 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[10].z, _890);
    float _902 = sqrt(_896);
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _916 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _920 = _906 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = _908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _924 = _910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _926 = _912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _928 = _914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = _654 + 0.5;
    float _932 = _780 + 0.5;
    float _934 = _894 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _892;
    out.m_61.y = _898;
    out.m_61.z = _900;
    bool _936 = _902 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _938 = isnan(_902);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _944 = _940 || _942;
    out.m_63.x = _924;
    out.m_63.y = _926;
    out.m_63.z = _928;
    out.m_63.w = _918;
    out.m_65.x = _932;
    out.m_65.y = _930;
    out.m_67.x = _916;
    out.m_67.y = _920;
    out.m_67.z = _922;
    out.m_67.w = _934;
    float _946 = _926;
    float _948 = _902;
    float _950 = _864;
    if (!_944)
    {
        _782 = 1.0;
    }
    float _952 = _782;
    bool _954 = !_944;
    float _956 = _952;
    if (!_954)
    {
        bool _958 = _902 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _960 = isnan(_902);
        bool _962 = _958 || _960;
        bool _964 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _966 = _962 || _964;
        if (!_966)
        {
            float _968 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _970 = _902 + _968;
            float _972 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _974 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _972;
            float _976 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _978 = _976 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _980 = 1.0 / _974;
            float _982 = _970 * _980;
            float _984 = fma(_982, _978, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _956 = _984;
            _678 = _980;
            _986 = true;
        }
        else
        {
            bool _988 = _902 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _990 = isnan(_902);
            bool _992 = _988 || _990;
            bool _994 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _996 = _992 || _994;
            if (!_996)
            {
                float _998 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1000 = _902 + _998;
                float _1002 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1004 = _1002 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1006 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1008 = _1006 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1010 = 1.0 / _1004;
                float _1012 = _1000 * _1010;
                float _1014 = fma(_1012, _1008, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _956 = _1014;
                _678 = _1010;
                _986 = true;
            }
            else
            {
                _956 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _986 = false;
    float _1016 = _956;
    float _1018 = _678;
    float _1020 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1022 = _864 + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1026 = _870 + _1024;
    float _1028 = fma(_1022, _1016, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1032 = _872 + _1030;
    float _1034 = fma(_1026, _1016, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1036 = -_460;
    float _1038 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1028);
    float _1040 = fma(_1032, _1016, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1042 = -_462;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1034);
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1048 = _1038 + _1046;
    float _1050 = -_490;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1040);
    float _1054 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1056 = _1044 + _1054;
    float _1058 = _1048 * _1048;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1062 = _1052 + _1060;
    float _1064 = fma(_1056, _1056, _1058);
    float _1066 = fma(_1062, _1062, _1064);
    float _1068 = rsqrt(_1066);
    float _1070 = _1068 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1072 = _1056 * _1070;
    float _1074 = _1062 * _1070;
    float _1076 = _1072 * _1072;
    float _1078 = _1074 * _1074;
    float _1080 = _1076 + _1078;
    float _1082 = sqrt(_1080);
    bool _1084 = _1082 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1088 = _1082 + _1086;
    float _1090 = _1064;
    float _1092 = _1018;
    float _1094 = _1088;
    float _1096 = _1072;
    if (_1084)
    {
        float _1098 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1090 = _1098;
    }
    float _1100 = _1090;
    if (_1084)
    {
        float _1102 = rsqrt(_1080);
        _1092 = _1102;
    }
    float _1104 = _1092;
    float _1106 = _1104;
    if (_1084)
    {
        float _1108 = _1088 * _1100;
        _1094 = _1108;
    }
    float _1110 = _1094;
    if (_1084)
    {
        float _1112 = _1110 * 0.15915493667125701904296875;
        _946 = _1112;
    }
    float _1114 = _946;
    float _1116 = _1100;
    float _1118 = _1114;
    if (_1084)
    {
        float _1120 = _1114 * 6.283185482025146484375;
        float _1122 = sin(_1120);
        _1116 = _1122;
    }
    float _1124 = _1116;
    float _1126 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1128 = precise::max(0.0, _1126);
    float _1130 = _900;
    float _1132 = _1128;
    if (_1084)
    {
        float _1134 = _1114 * 6.283185482025146484375;
        float _1136 = cos(_1134);
        _1130 = _1136;
    }
    float _1138 = _1130;
    float _1140 = -_1070;
    float _1142 = -_1128;
    float _1144 = fma(_1048, _1140, _1142);
    if (_1084)
    {
        float _1146 = _1144 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1132 = _1146;
    }
    float _1148 = _1132;
    float _1150 = _1124;
    float _1152 = _1148;
    if (_1084)
    {
        float _1154 = fma(_1124, _1148, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _948 = _1154;
    }
    float _1156 = _948;
    if (!_1084)
    {
        _1150 = _1074;
    }
    float _1158 = _1150;
    float _1160 = _1158;
    float _1162 = _1138;
    if (_1084)
    {
        float _1164 = _1138 + (-1.0);
        _1152 = _1164;
    }
    float _1166 = _1152;
    float _1168 = _1166;
    if (_1084)
    {
        float _1170 = _1104 * _1156;
        _950 = _1170;
    }
    float _1172 = _950;
    if (!_1084)
    {
        _1106 = _1144;
    }
    float _1174 = _1106;
    float _1176 = sqrt(_1066);
    float _1178 = _1174;
    if (_1084)
    {
        float _1180 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1118 = _1180;
    }
    float _1182 = _1118;
    if (_1084)
    {
        float _1184 = _1072 * _1172;
        _1096 = _1184;
    }
    float _1186 = _1096;
    if (!_1084)
    {
        _1168 = _1076;
    }
    float _1188 = _1168;
    float _1190 = _1188;
    if (_1084)
    {
        float _1192 = _1074 * _1172;
        _1160 = _1192;
    }
    float _1194 = _1160;
    if (_1084)
    {
        float _1196 = fma(_1144, _1138, _1182);
        _1178 = _1196;
    }
    float _1198 = _1178;
    if (_1084)
    {
        float _1200 = _1186 * _1186;
        _1190 = _1200;
    }
    float _1202 = _1190;
    if (!_1084)
    {
        _1162 = _1078;
    }
    float _1204 = _1162;
    float _1206 = _1204;
    if (_1084)
    {
        float _1208 = _1194 * _1194;
        _1206 = _1208;
    }
    float _1210 = _1206;
    float _1212 = fma(_1198, _1198, _1202);
    float _1214 = _1212 + _1210;
    float _1216 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1220 = fma(_1176, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1218);
    float _1222 = precise::clamp(_1220, 0.0, 1.0);
    float _1224 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1226 = rsqrt(_1214);
    float _1228 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1216);
    float _1230 = -_1222;
    float _1232 = _1230 + 1.0;
    float _1234 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1236 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1224);
    float _1238 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1240 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1228);
    float _1242 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1234);
    float _1244 = abs(_1232);
    float _1246 = log2(_1244);
    float _1248 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1236);
    float _1250 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1238);
    float _1252 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1242);
    float _1254 = _1240 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1256 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1258 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1250);
    float _1260 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1262 = _1226 * _1186;
    float _1264 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1266 = _1226 * _1198;
    float _1268 = _1226 * _1194;
    float _1270 = _1262 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1272 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1264);
    float _1274 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1276 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1278 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1280 = -_1270;
    float _1282 = fma(_1266, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1280);
    float _1284 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1286 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1272);
    float _1288 = -_1276;
    float _1290 = fma(_1288, _1274, 1.0);
    float _1292 = -_1268;
    float _1294 = fma(_1292, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1282);
    float _1296 = exp2(_1278);
    float _1298 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1286);
    float _1300 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1302 = fma(_1294, -0.5, 0.5);
    float _1304 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1306 = fma(_1294, 0.5, 0.5);
    float _1308 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1300);
    float _1310 = _1266 + 1.0;
    float _1312 = log2(_1290);
    float _1314 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1304);
    float _1316 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1308);
    float _1318 = fma(_1306, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1320 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1314);
    float _1322 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1316);
    float _1324 = 1.0 / _1298;
    float _1326 = -_1266;
    float _1328 = fma(_1296, _1310, _1326);
    float _1330 = fma(_1306, _1318, -0.212114393711090087890625);
    float _1332 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1320);
    float _1334 = fma(_1328, 0.5, 0.5);
    float _1336 = fma(_1306, _1330, 1.570728778839111328125);
    float _1338 = sqrt(_1302);
    float _1340 = _1312 * 0.693147182464599609375;
    float _1342 = _1322 * _1324;
    float _1344 = _1332 * _1324;
    float _1346 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1348 = fma(_1342, 0.5, 0.5);
    float _1350 = fma(_1344, -0.5, 0.5);
    float _1352 = _1338 * 0.636619746685028076171875;
    float3 _3552 = float3(_1348, _1350, _1346);
    float _1354 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3552, float3(0.0), isnan(_3552)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3552, float3(0.0), isnan(_3552)), level(0.0)).x;
    float3 _3563 = float3(_1348, _1350, _1346);
    float4 _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3563, float3(0.0), isnan(_3563)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3563, float3(0.0), isnan(_3563)), level(0.0)).xyzw;
    float _1359 = _1357.x;
    float _1361 = _1357.y;
    float _1363 = _1357.z;
    float _1365 = _1357.w;
    float _1367 = -_1336;
    float _1369 = fma(_1352, _1367, 1.0);
    float2 _3585 = float2(_1369, _1334);
    float3 _1373 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3585, float2(0.0), isnan(_3585)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3585, float2(0.0), isnan(_3585)), level(0.0)).xyz;
    float _1375 = _1373.x;
    float _1377 = _1373.y;
    float _1379 = _1373.z;
    float _1381 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1383 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_69.x = _1056;
    out.m_69.y = _1048;
    out.m_69.z = _1062;
    float _1385 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1383);
    float _1387 = exp2(_1381);
    float _1389 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1385);
    float _1391 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1389);
    float _1393 = _1391 + _1298;
    out.gl_Position.x = _1322;
    out.gl_Position.y = _1332;
    out.gl_Position.z = _1391;
    out.gl_Position.w = _1298;
    float _1395 = _1393 * 0.5;
    float _1397 = -_1387;
    float _1399 = _1397 + 1.0;
    float _1401 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1403 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.z = _1395;
    out.m_71.w = _1298;
    out.m_47.x = _1403;
    float _1405 = _1401 * _1354;
    float _1407 = -_1401;
    float _1409 = _1407 + 1.0;
    float _1411 = _1365 * _1405;
    float _1413 = _1365 * _1409;
    float _1415 = _1379 * _1405;
    float _1417 = fma(_1375, _1411, _1359);
    float _1419 = fma(_1377, _1411, _1361);
    float _1421 = fma(_1365, _1415, _1363);
    out.m_73.x = _1417;
    out.m_73.y = _1419;
    out.m_73.z = _1421;
    out.m_73.w = _1413;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad5 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _986 = false;
    bool _374 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1478 = as_type<float>(_108);
        out.gl_Position.z = _1478;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1547 = as_type<float>(_144);
        out.gl_Position.z = _1547;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_51.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _152 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _188 = in.m_49.x;
    float _190 = in.m_49.y;
    float _192 = in.m_49.z;
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
    float _268 = in.m_53.w;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _276 = _274 != 0;
    float _278 = in.m_44.x;
    float _280 = in.m_44.y;
    float _282 = in.m_44.z;
    bool _284 = _206 < 0.5;
    float _286 = float(_284);
    float _288 = -_206;
    float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _292 = fma(_202, 0.5, 0.5);
    bool _294 = !_272;
    int _296 = _294 ? 0 : 1;
    float _298 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _300 = -_286;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _304 = -_292;
    float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _308 = abs(_296);
    float _310 = fma(_266, _188, _298);
    bool _312 = !_166;
    int _314 = _312 ? 0 : 1;
    float _316 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _318 = !_276;
    int _320 = _318 ? 0 : 1;
    float _322 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _324 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _326 = fma(_266, _190, _316);
    int _328 = abs(_314);
    float _330 = fma(_266, _192, _322);
    int _332 = abs(_320);
    float _334 = float(_308);
    float _336 = float(_328);
    float _338 = abs(_290);
    float _340 = _334 * _338;
    float _342 = fma(_310, _268, _278);
    float _344 = fma(_326, _268, _280);
    float _346 = float(_332);
    float _348 = fma(_336, _306, _340);
    float _350 = fma(_330, _268, _282);
    float _352 = abs(_302);
    float _354 = fma(_346, _352, _348);
    bool _356 = !_324;
    float _372;
    if (!_356)
    {
        float _358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _360 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _362 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _364 = _362 * _358;
        float _366 = floor(_364);
        float _368 = -_366;
        float _370 = _364 + _368;
        _372 = _370;
        _374 = true;
    }
    else
    {
        float _376 = float(_92);
        float _378 = 1.0 / _376;
        float _380 = _126 * _378;
        _372 = _380;
    }
    _374 = false;
    float _382 = _372;
    float _384 = _344 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _386 = _344 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _388 = _344 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _390 = in.m_55.y;
    float _392 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _384);
    float _394 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _386);
    float _396 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _388);
    float _398 = in.m_51.y;
    float _400 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].z, _392);
    float _402 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].z, _394);
    float _404 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    float _406 = _400 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _408 = _402 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _410 = _404 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _414 = _412 != 0;
    float _416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _418 = _406 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _422 = _408 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _426 = _410 + _424;
    float _428 = _418 * _418;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _432 = _430 != 0;
    float _434 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _436 = fma(_422, _422, _428);
    float _438 = in.m_55.x;
    float _440 = fma(_426, _426, _436);
    float _442 = in.m_53.x;
    float _444 = in.m_53.y;
    float _446 = in.m_53.z;
    bool _448 = _398 > 0.5;
    float _450 = rsqrt(_440);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = 1.0 / _454;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _460 = _418 * _450;
    float _462 = _422 * _450;
    float _464 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[78].w, _458);
    float _466 = -_460;
    float _468 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _418);
    float _470 = -_462;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _422);
    float _474 = _444 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _476 = -_390;
    float _478 = _476 + 1.0;
    float _480 = _468 * _468;
    float _482 = _442 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _484 = _446 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _486 = _354 * _474;
    float _488 = fma(_472, _472, _480);
    float _490 = _426 * _450;
    float _492 = _390;
    float _494 = _438;
    float _496 = _406;
    if (_414)
    {
        float _498 = _448 ? _478 : _390;
        _492 = _498;
    }
    float _500 = _492;
    float _502 = _398 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _504 = in.m_57.x;
    float _506 = in.m_57.y;
    float _508 = in.m_57.z;
    float _510 = -_490;
    float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _426);
    float _514 = _354 * _482;
    bool _516 = _146 > 0.5;
    bool _518 = _516 && _432;
    float _520 = fma(_512, _512, _488);
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _524 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _526 = sqrt(_520);
    float _528 = _354 * _484;
    float _530 = -_522;
    float _532 = fma(_434, 2.0, _530);
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _536 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _538 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _542 = fma(_502, -2.0, _534);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _544;
    float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _550 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _540);
    float _552 = _546 * _456;
    float _554 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _506);
    float _556 = _450 * _526;
    float _558 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _504);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _564 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _550);
    float _566 = _524 * _556;
    float _568 = _536 * _556;
    float _570 = 1.0 / _562;
    float _572 = _538 * _556;
    float _574 = _566 * _554;
    float _576 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _508);
    float _578 = _568 * _558;
    float _580 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _542);
    float _582 = _574 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _584 = _574 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _586 = _572 * _576;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _592 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[8].x, _582);
    float _594 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[10].x, _584);
    float _596 = _548 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _600 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[8].z, _592);
    float _602 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[10].z, _594);
    float _604 = fma(_596, _500, -0.5);
    float _606 = _590 * _570;
    float _608 = _408 + _600;
    float _610 = _410 + _602;
    float _612 = -_126;
    float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[76].x, _532);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _618 = _382 + _616;
    float _620 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _622 = _608 + _620;
    float _624 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _626 = _610 + _624;
    float _628 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _464);
    float _630 = fma(_552, _618, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _632 = _622 * _622;
    float _634 = _626 * _626;
    float _636 = in.m_59.x;
    float _638 = in.m_59.y;
    float _640 = in.m_59.z;
    bool _642 = _506 != 0.0;
    bool _644 = isnan(_506);
    bool _646 = _642 || _644;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    float _652 = -_580;
    float _654 = fma(_628, _604, _652);
    float _656 = _632 + _634;
    bool _658 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _660 = isnan(_382);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = _574 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _672 = _580;
    float _674 = _506;
    float _676 = _508;
    float _678 = _654;
    if (!_432)
    {
        _672 = _438;
    }
    float _680 = _672;
    float _682 = sqrt(_656);
    bool _684 = _504 == 0.0;
    bool _686 = !_650;
    bool _688 = _684 && _686;
    float _690 = _680;
    if (_518)
    {
        float _692 = -_438;
        float _694 = _692 + 1.0;
        _494 = _694;
    }
    float _696 = _494;
    bool _698 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _700 = isnan(_382);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -_668;
    float _712 = _710 + 1.0;
    bool _714 = _508 == 0.0;
    bool _716 = _714 && _688;
    float _718 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[9].x, _670);
    if (_432)
    {
        _690 = _696;
    }
    float _720 = _690;
    float _722 = _708 * _712;
    bool _724 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _726 = isnan(_382);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = -_708;
    float _738 = _736 + 1.0;
    float _740 = _598 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _742 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[9].z, _718);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _746 = _382 + _744;
    float _748 = _734 * _738;
    float _750 = fma(_740, _720, -0.5);
    bool _752 = _682 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _754 = -_734;
    float _756 = _754 + 1.0;
    float _758 = _630 * _748;
    float _760 = _406 + _742;
    float _762 = _638;
    float _764 = _636;
    float _766 = _640;
    float _768 = _742;
    float _770 = _758;
    if (!_716)
    {
        float _772 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[17].y, _638);
        _762 = _772;
    }
    float _774 = _762;
    if (!_716)
    {
        float _776 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[17].y, _636);
        _764 = _776;
    }
    float _778 = _764;
    float _780 = fma(_564, _750, _614);
    float _782 = _780;
    if (!_716)
    {
        float _784 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[17].y, _640);
        _766 = _784;
    }
    float _786 = _766;
    float _788 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[115].x, _758);
    float _790 = fma(_606, _746, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _792 = _774 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (!_752)
    {
        _768 = _634;
    }
    float _794 = _768;
    float _796 = _794;
    if (!_752)
    {
        _496 = _632;
    }
    float _798 = _496;
    float _800 = _798;
    if (!_752)
    {
        _674 = _608;
    }
    float _802 = _674;
    float _804 = _802;
    if (!_752)
    {
        _676 = _610;
    }
    float _806 = _676;
    float _808 = _806;
    if (!_752)
    {
        _770 = _760;
    }
    float _810 = _770;
    bool _812 = !_752;
    float _814 = _810;
    if (!_812)
    {
        float _816 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _818 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _820 = _682 + _818;
        float _822 = _760 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _824 = rsqrt(_656);
        float _826 = _820 * _816;
        float _828 = _826 * 0.15915493667125701904296875;
        float _830 = _828 * 6.283185482025146484375;
        float _832 = sin(_830);
        float _834 = _828 * 6.283185482025146484375;
        float _836 = cos(_834);
        float _838 = fma(_832, _822, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _840 = _824 * _838;
        float _842 = _836 + (-1.0);
        float _844 = fma(_622, _840, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _846 = fma(_626, _840, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _848 = _842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _850 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _852 = _844 + _850;
        float _854 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _856 = _846 + _854;
        float _858 = fma(_760, _836, _848);
        float _860 = _852 * _852;
        float _862 = _856 * _856;
        _814 = _858;
        _800 = _860;
        _796 = _862;
        _804 = _844;
        _808 = _846;
    }
    float _864 = _814;
    float _866 = _800;
    float _868 = _796;
    float _870 = _804;
    float _872 = _808;
    float _874 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _876 = _864 + _874;
    float _878 = _774 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _880 = _774 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _882 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[8].x, _792);
    float _884 = fma(_790, _722, _788);
    float _886 = fma(_876, _876, _866);
    float _888 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[9].x, _878);
    float _890 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[10].x, _880);
    float _892 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].z, _882);
    float _894 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[117].x, _884);
    float _896 = _886 + _868;
    float _898 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[9].z, _888);
    float _900 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[10].z, _890);
    float _902 = sqrt(_896);
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _916 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _920 = _906 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = _908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _924 = _910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _926 = _912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _928 = _914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = _654 + 0.5;
    float _932 = _780 + 0.5;
    float _934 = _894 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _892;
    out.m_61.y = _898;
    out.m_61.z = _900;
    bool _936 = _902 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _938 = isnan(_902);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _944 = _940 || _942;
    out.m_63.x = _924;
    out.m_63.y = _926;
    out.m_63.z = _928;
    out.m_63.w = _918;
    out.m_65.x = _932;
    out.m_65.y = _930;
    out.m_67.x = _916;
    out.m_67.y = _920;
    out.m_67.z = _922;
    out.m_67.w = _934;
    float _946 = _926;
    float _948 = _902;
    float _950 = _864;
    if (!_944)
    {
        _782 = 1.0;
    }
    float _952 = _782;
    bool _954 = !_944;
    float _956 = _952;
    if (!_954)
    {
        bool _958 = _902 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _960 = isnan(_902);
        bool _962 = _958 || _960;
        bool _964 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _966 = _962 || _964;
        if (!_966)
        {
            float _968 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _970 = _902 + _968;
            float _972 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _974 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _972;
            float _976 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _978 = _976 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _980 = 1.0 / _974;
            float _982 = _970 * _980;
            float _984 = fma(_982, _978, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _956 = _984;
            _678 = _980;
            _986 = true;
        }
        else
        {
            bool _988 = _902 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _990 = isnan(_902);
            bool _992 = _988 || _990;
            bool _994 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _996 = _992 || _994;
            if (!_996)
            {
                float _998 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1000 = _902 + _998;
                float _1002 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1004 = _1002 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1006 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1008 = _1006 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1010 = 1.0 / _1004;
                float _1012 = _1000 * _1010;
                float _1014 = fma(_1012, _1008, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _956 = _1014;
                _678 = _1010;
                _986 = true;
            }
            else
            {
                _956 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _986 = false;
    float _1016 = _956;
    float _1018 = _678;
    float _1020 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1022 = _864 + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1026 = _870 + _1024;
    float _1028 = fma(_1022, _1016, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1032 = _872 + _1030;
    float _1034 = fma(_1026, _1016, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1036 = -_460;
    float _1038 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1028);
    float _1040 = fma(_1032, _1016, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1042 = -_462;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1034);
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1048 = _1038 + _1046;
    float _1050 = -_490;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1040);
    float _1054 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1056 = _1044 + _1054;
    float _1058 = _1048 * _1048;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1062 = _1052 + _1060;
    float _1064 = fma(_1056, _1056, _1058);
    float _1066 = fma(_1062, _1062, _1064);
    float _1068 = rsqrt(_1066);
    float _1070 = _1068 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1072 = _1056 * _1070;
    float _1074 = _1062 * _1070;
    float _1076 = _1072 * _1072;
    float _1078 = _1074 * _1074;
    float _1080 = _1076 + _1078;
    float _1082 = sqrt(_1080);
    bool _1084 = _1082 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1088 = _1082 + _1086;
    float _1090 = _1064;
    float _1092 = _1018;
    float _1094 = _1088;
    float _1096 = _1072;
    if (_1084)
    {
        float _1098 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1090 = _1098;
    }
    float _1100 = _1090;
    if (_1084)
    {
        float _1102 = rsqrt(_1080);
        _1092 = _1102;
    }
    float _1104 = _1092;
    float _1106 = _1104;
    if (_1084)
    {
        float _1108 = _1088 * _1100;
        _1094 = _1108;
    }
    float _1110 = _1094;
    if (_1084)
    {
        float _1112 = _1110 * 0.15915493667125701904296875;
        _946 = _1112;
    }
    float _1114 = _946;
    float _1116 = _1100;
    float _1118 = _1114;
    if (_1084)
    {
        float _1120 = _1114 * 6.283185482025146484375;
        float _1122 = sin(_1120);
        _1116 = _1122;
    }
    float _1124 = _1116;
    float _1126 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1128 = precise::max(0.0, _1126);
    float _1130 = _900;
    float _1132 = _1128;
    if (_1084)
    {
        float _1134 = _1114 * 6.283185482025146484375;
        float _1136 = cos(_1134);
        _1130 = _1136;
    }
    float _1138 = _1130;
    float _1140 = -_1070;
    float _1142 = -_1128;
    float _1144 = fma(_1048, _1140, _1142);
    if (_1084)
    {
        float _1146 = _1144 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1132 = _1146;
    }
    float _1148 = _1132;
    float _1150 = _1124;
    float _1152 = _1148;
    if (_1084)
    {
        float _1154 = fma(_1124, _1148, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _948 = _1154;
    }
    float _1156 = _948;
    if (!_1084)
    {
        _1150 = _1074;
    }
    float _1158 = _1150;
    float _1160 = _1158;
    float _1162 = _1138;
    if (_1084)
    {
        float _1164 = _1138 + (-1.0);
        _1152 = _1164;
    }
    float _1166 = _1152;
    float _1168 = _1166;
    if (_1084)
    {
        float _1170 = _1104 * _1156;
        _950 = _1170;
    }
    float _1172 = _950;
    if (!_1084)
    {
        _1106 = _1144;
    }
    float _1174 = _1106;
    float _1176 = sqrt(_1066);
    float _1178 = _1174;
    if (_1084)
    {
        float _1180 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1118 = _1180;
    }
    float _1182 = _1118;
    if (_1084)
    {
        float _1184 = _1072 * _1172;
        _1096 = _1184;
    }
    float _1186 = _1096;
    if (!_1084)
    {
        _1168 = _1076;
    }
    float _1188 = _1168;
    float _1190 = _1188;
    if (_1084)
    {
        float _1192 = _1074 * _1172;
        _1160 = _1192;
    }
    float _1194 = _1160;
    if (_1084)
    {
        float _1196 = fma(_1144, _1138, _1182);
        _1178 = _1196;
    }
    float _1198 = _1178;
    if (_1084)
    {
        float _1200 = _1186 * _1186;
        _1190 = _1200;
    }
    float _1202 = _1190;
    if (!_1084)
    {
        _1162 = _1078;
    }
    float _1204 = _1162;
    float _1206 = _1204;
    if (_1084)
    {
        float _1208 = _1194 * _1194;
        _1206 = _1208;
    }
    float _1210 = _1206;
    float _1212 = fma(_1198, _1198, _1202);
    float _1214 = _1212 + _1210;
    float _1216 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1220 = fma(_1176, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1218);
    float _1222 = precise::clamp(_1220, 0.0, 1.0);
    float _1224 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1226 = rsqrt(_1214);
    float _1228 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1216);
    float _1230 = -_1222;
    float _1232 = _1230 + 1.0;
    float _1234 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1236 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1224);
    float _1238 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1240 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1228);
    float _1242 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1234);
    float _1244 = abs(_1232);
    float _1246 = log2(_1244);
    float _1248 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1236);
    float _1250 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1238);
    float _1252 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1242);
    float _1254 = _1240 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1256 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1258 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1250);
    float _1260 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1262 = _1226 * _1186;
    float _1264 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1266 = _1226 * _1198;
    float _1268 = _1226 * _1194;
    float _1270 = _1262 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1272 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1264);
    float _1274 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1276 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1278 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1280 = -_1270;
    float _1282 = fma(_1266, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1280);
    float _1284 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1286 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1272);
    float _1288 = -_1276;
    float _1290 = fma(_1288, _1274, 1.0);
    float _1292 = -_1268;
    float _1294 = fma(_1292, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1282);
    float _1296 = exp2(_1278);
    float _1298 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1286);
    float _1300 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1302 = fma(_1294, -0.5, 0.5);
    float _1304 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1306 = fma(_1294, 0.5, 0.5);
    float _1308 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1300);
    float _1310 = _1266 + 1.0;
    float _1312 = log2(_1290);
    float _1314 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1304);
    float _1316 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1308);
    float _1318 = fma(_1306, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1320 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1314);
    float _1322 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1316);
    float _1324 = 1.0 / _1298;
    float _1326 = -_1266;
    float _1328 = fma(_1296, _1310, _1326);
    float _1330 = fma(_1306, _1318, -0.212114393711090087890625);
    float _1332 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1320);
    float _1334 = fma(_1328, 0.5, 0.5);
    float _1336 = fma(_1306, _1330, 1.570728778839111328125);
    float _1338 = sqrt(_1302);
    float _1340 = _1312 * 0.693147182464599609375;
    float _1342 = _1322 * _1324;
    float _1344 = _1332 * _1324;
    float _1346 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1348 = fma(_1342, 0.5, 0.5);
    float _1350 = fma(_1344, -0.5, 0.5);
    float _1352 = _1338 * 0.636619746685028076171875;
    float3 _3552 = float3(_1348, _1350, _1346);
    float _1354 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3552, float3(0.0), isnan(_3552)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3552, float3(0.0), isnan(_3552)), level(0.0)).x;
    float3 _3563 = float3(_1348, _1350, _1346);
    float4 _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3563, float3(0.0), isnan(_3563)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3563, float3(0.0), isnan(_3563)), level(0.0)).xyzw;
    float _1359 = _1357.x;
    float _1361 = _1357.y;
    float _1363 = _1357.z;
    float _1365 = _1357.w;
    float _1367 = -_1336;
    float _1369 = fma(_1352, _1367, 1.0);
    float2 _3585 = float2(_1369, _1334);
    float3 _1373 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3585, float2(0.0), isnan(_3585)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3585, float2(0.0), isnan(_3585)), level(0.0)).xyz;
    float _1375 = _1373.x;
    float _1377 = _1373.y;
    float _1379 = _1373.z;
    float _1381 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1383 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_69.x = _1056;
    out.m_69.y = _1048;
    out.m_69.z = _1062;
    float _1385 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1383);
    float _1387 = exp2(_1381);
    float _1389 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1385);
    float _1391 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1389);
    float _1393 = _1391 + _1298;
    out.gl_Position.x = _1322;
    out.gl_Position.y = _1332;
    out.gl_Position.z = _1391;
    out.gl_Position.w = _1298;
    float _1395 = _1393 * 0.5;
    float _1397 = -_1387;
    float _1399 = _1397 + 1.0;
    float _1401 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1403 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.z = _1395;
    out.m_71.w = _1298;
    out.m_47.x = _1403;
    float _1405 = _1401 * _1354;
    float _1407 = -_1401;
    float _1409 = _1407 + 1.0;
    float _1411 = _1365 * _1405;
    float _1413 = _1365 * _1409;
    float _1415 = _1379 * _1405;
    float _1417 = fma(_1375, _1411, _1359);
    float _1419 = fma(_1377, _1411, _1361);
    float _1421 = fma(_1365, _1415, _1363);
    out.m_73.x = _1417;
    out.m_73.y = _1419;
    out.m_73.z = _1421;
    out.m_73.w = _1413;
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
    out.dm_pad5 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _986 = false;
    bool _374 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1478 = as_type<float>(_108);
        out.gl_Position.z = _1478;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1547 = as_type<float>(_144);
        out.gl_Position.z = _1547;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _152 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _188 = in.m_49.x;
    float _190 = in.m_49.y;
    float _192 = in.m_49.z;
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
    float _268 = in.m_53.w;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _276 = _274 != 0;
    float _278 = in.m_44.x;
    float _280 = in.m_44.y;
    float _282 = in.m_44.z;
    bool _284 = _206 < 0.5;
    float _286 = float(_284);
    float _288 = -_206;
    float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _292 = fma(_202, 0.5, 0.5);
    bool _294 = !_272;
    int _296 = _294 ? 0 : 1;
    float _298 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _300 = -_286;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _304 = -_292;
    float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _308 = abs(_296);
    float _310 = fma(_266, _188, _298);
    bool _312 = !_166;
    int _314 = _312 ? 0 : 1;
    float _316 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _318 = !_276;
    int _320 = _318 ? 0 : 1;
    float _322 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _324 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _326 = fma(_266, _190, _316);
    int _328 = abs(_314);
    float _330 = fma(_266, _192, _322);
    int _332 = abs(_320);
    float _334 = float(_308);
    float _336 = float(_328);
    float _338 = abs(_290);
    float _340 = _334 * _338;
    float _342 = fma(_310, _268, _278);
    float _344 = fma(_326, _268, _280);
    float _346 = float(_332);
    float _348 = fma(_336, _306, _340);
    float _350 = fma(_330, _268, _282);
    float _352 = abs(_302);
    float _354 = fma(_346, _352, _348);
    bool _356 = !_324;
    float _372;
    if (!_356)
    {
        float _358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _360 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _362 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _364 = _362 * _358;
        float _366 = floor(_364);
        float _368 = -_366;
        float _370 = _364 + _368;
        _372 = _370;
        _374 = true;
    }
    else
    {
        float _376 = float(_92);
        float _378 = 1.0 / _376;
        float _380 = _126 * _378;
        _372 = _380;
    }
    _374 = false;
    float _382 = _372;
    float _384 = _344 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _386 = _344 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _388 = _344 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _390 = in.m_55.y;
    float _392 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _384);
    float _394 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _386);
    float _396 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _388);
    float _398 = in.m_51.y;
    float _400 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].z, _392);
    float _402 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].z, _394);
    float _404 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    float _406 = _400 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _408 = _402 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _410 = _404 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _414 = _412 != 0;
    float _416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _418 = _406 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _422 = _408 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _426 = _410 + _424;
    float _428 = _418 * _418;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _432 = _430 != 0;
    float _434 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _436 = fma(_422, _422, _428);
    float _438 = in.m_55.x;
    float _440 = fma(_426, _426, _436);
    float _442 = in.m_53.x;
    float _444 = in.m_53.y;
    float _446 = in.m_53.z;
    bool _448 = _398 > 0.5;
    float _450 = rsqrt(_440);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _456 = 1.0 / _454;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _460 = _418 * _450;
    float _462 = _422 * _450;
    float _464 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[78].w, _458);
    float _466 = -_460;
    float _468 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _418);
    float _470 = -_462;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _422);
    float _474 = _444 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _476 = -_390;
    float _478 = _476 + 1.0;
    float _480 = _468 * _468;
    float _482 = _442 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _484 = _446 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _486 = _354 * _474;
    float _488 = fma(_472, _472, _480);
    float _490 = _426 * _450;
    float _492 = _390;
    float _494 = _438;
    float _496 = _406;
    if (_414)
    {
        float _498 = _448 ? _478 : _390;
        _492 = _498;
    }
    float _500 = _492;
    float _502 = _398 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _504 = in.m_57.x;
    float _506 = in.m_57.y;
    float _508 = in.m_57.z;
    float _510 = -_490;
    float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _426);
    float _514 = _354 * _482;
    bool _516 = _146 > 0.5;
    bool _518 = _516 && _432;
    float _520 = fma(_512, _512, _488);
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _524 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _526 = sqrt(_520);
    float _528 = _354 * _484;
    float _530 = -_522;
    float _532 = fma(_434, 2.0, _530);
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _536 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _538 = _528 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _542 = fma(_502, -2.0, _534);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _544;
    float _548 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _550 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _540);
    float _552 = _546 * _456;
    float _554 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _506);
    float _556 = _450 * _526;
    float _558 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _504);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _564 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _550);
    float _566 = _524 * _556;
    float _568 = _536 * _556;
    float _570 = 1.0 / _562;
    float _572 = _538 * _556;
    float _574 = _566 * _554;
    float _576 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _508);
    float _578 = _568 * _558;
    float _580 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _542);
    float _582 = _574 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _584 = _574 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _586 = _572 * _576;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _592 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[8].x, _582);
    float _594 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[10].x, _584);
    float _596 = _548 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _598 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _600 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[8].z, _592);
    float _602 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[10].z, _594);
    float _604 = fma(_596, _500, -0.5);
    float _606 = _590 * _570;
    float _608 = _408 + _600;
    float _610 = _410 + _602;
    float _612 = -_126;
    float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[76].x, _532);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _618 = _382 + _616;
    float _620 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _622 = _608 + _620;
    float _624 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _626 = _610 + _624;
    float _628 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _464);
    float _630 = fma(_552, _618, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _632 = _622 * _622;
    float _634 = _626 * _626;
    float _636 = in.m_59.x;
    float _638 = in.m_59.y;
    float _640 = in.m_59.z;
    bool _642 = _506 != 0.0;
    bool _644 = isnan(_506);
    bool _646 = _642 || _644;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    float _652 = -_580;
    float _654 = fma(_628, _604, _652);
    float _656 = _632 + _634;
    bool _658 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _660 = isnan(_382);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = _574 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _672 = _580;
    float _674 = _506;
    float _676 = _508;
    float _678 = _654;
    if (!_432)
    {
        _672 = _438;
    }
    float _680 = _672;
    float _682 = sqrt(_656);
    bool _684 = _504 == 0.0;
    bool _686 = !_650;
    bool _688 = _684 && _686;
    float _690 = _680;
    if (_518)
    {
        float _692 = -_438;
        float _694 = _692 + 1.0;
        _494 = _694;
    }
    float _696 = _494;
    bool _698 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _700 = isnan(_382);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -_668;
    float _712 = _710 + 1.0;
    bool _714 = _508 == 0.0;
    bool _716 = _714 && _688;
    float _718 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[9].x, _670);
    if (_432)
    {
        _690 = _696;
    }
    float _720 = _690;
    float _722 = _708 * _712;
    bool _724 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _726 = isnan(_382);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = -_708;
    float _738 = _736 + 1.0;
    float _740 = _598 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _742 = fma(_586, (*spvDescriptorSet0.vp_c10)._m0[9].z, _718);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _746 = _382 + _744;
    float _748 = _734 * _738;
    float _750 = fma(_740, _720, -0.5);
    bool _752 = _682 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _754 = -_734;
    float _756 = _754 + 1.0;
    float _758 = _630 * _748;
    float _760 = _406 + _742;
    float _762 = _638;
    float _764 = _636;
    float _766 = _640;
    float _768 = _742;
    float _770 = _758;
    if (!_716)
    {
        float _772 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[17].y, _638);
        _762 = _772;
    }
    float _774 = _762;
    if (!_716)
    {
        float _776 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[17].y, _636);
        _764 = _776;
    }
    float _778 = _764;
    float _780 = fma(_564, _750, _614);
    float _782 = _780;
    if (!_716)
    {
        float _784 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[17].y, _640);
        _766 = _784;
    }
    float _786 = _766;
    float _788 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[115].x, _758);
    float _790 = fma(_606, _746, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _792 = _774 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (!_752)
    {
        _768 = _634;
    }
    float _794 = _768;
    float _796 = _794;
    if (!_752)
    {
        _496 = _632;
    }
    float _798 = _496;
    float _800 = _798;
    if (!_752)
    {
        _674 = _608;
    }
    float _802 = _674;
    float _804 = _802;
    if (!_752)
    {
        _676 = _610;
    }
    float _806 = _676;
    float _808 = _806;
    if (!_752)
    {
        _770 = _760;
    }
    float _810 = _770;
    bool _812 = !_752;
    float _814 = _810;
    if (!_812)
    {
        float _816 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _818 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _820 = _682 + _818;
        float _822 = _760 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _824 = rsqrt(_656);
        float _826 = _820 * _816;
        float _828 = _826 * 0.15915493667125701904296875;
        float _830 = _828 * 6.283185482025146484375;
        float _832 = sin(_830);
        float _834 = _828 * 6.283185482025146484375;
        float _836 = cos(_834);
        float _838 = fma(_832, _822, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _840 = _824 * _838;
        float _842 = _836 + (-1.0);
        float _844 = fma(_622, _840, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _846 = fma(_626, _840, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _848 = _842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _850 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _852 = _844 + _850;
        float _854 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _856 = _846 + _854;
        float _858 = fma(_760, _836, _848);
        float _860 = _852 * _852;
        float _862 = _856 * _856;
        _814 = _858;
        _800 = _860;
        _796 = _862;
        _804 = _844;
        _808 = _846;
    }
    float _864 = _814;
    float _866 = _800;
    float _868 = _796;
    float _870 = _804;
    float _872 = _808;
    float _874 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _876 = _864 + _874;
    float _878 = _774 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _880 = _774 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _882 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[8].x, _792);
    float _884 = fma(_790, _722, _788);
    float _886 = fma(_876, _876, _866);
    float _888 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[9].x, _878);
    float _890 = fma(_778, (*spvDescriptorSet0.vp_c10)._m0[10].x, _880);
    float _892 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].z, _882);
    float _894 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[117].x, _884);
    float _896 = _886 + _868;
    float _898 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[9].z, _888);
    float _900 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[10].z, _890);
    float _902 = sqrt(_896);
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _916 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _920 = _906 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = _908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _924 = _910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _926 = _912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _928 = _914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = _654 + 0.5;
    float _932 = _780 + 0.5;
    float _934 = _894 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _892;
    out.m_61.y = _898;
    out.m_61.z = _900;
    bool _936 = _902 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _938 = isnan(_902);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _944 = _940 || _942;
    out.m_63.x = _924;
    out.m_63.y = _926;
    out.m_63.z = _928;
    out.m_63.w = _918;
    out.m_65.x = _932;
    out.m_65.y = _930;
    out.m_67.x = _916;
    out.m_67.y = _920;
    out.m_67.z = _922;
    out.m_67.w = _934;
    float _946 = _926;
    float _948 = _902;
    float _950 = _864;
    if (!_944)
    {
        _782 = 1.0;
    }
    float _952 = _782;
    bool _954 = !_944;
    float _956 = _952;
    if (!_954)
    {
        bool _958 = _902 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _960 = isnan(_902);
        bool _962 = _958 || _960;
        bool _964 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _966 = _962 || _964;
        if (!_966)
        {
            float _968 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _970 = _902 + _968;
            float _972 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _974 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _972;
            float _976 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _978 = _976 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _980 = 1.0 / _974;
            float _982 = _970 * _980;
            float _984 = fma(_982, _978, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _956 = _984;
            _678 = _980;
            _986 = true;
        }
        else
        {
            bool _988 = _902 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _990 = isnan(_902);
            bool _992 = _988 || _990;
            bool _994 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _996 = _992 || _994;
            if (!_996)
            {
                float _998 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1000 = _902 + _998;
                float _1002 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1004 = _1002 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1006 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1008 = _1006 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1010 = 1.0 / _1004;
                float _1012 = _1000 * _1010;
                float _1014 = fma(_1012, _1008, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _956 = _1014;
                _678 = _1010;
                _986 = true;
            }
            else
            {
                _956 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _986 = false;
    float _1016 = _956;
    float _1018 = _678;
    float _1020 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1022 = _864 + _1020;
    float _1024 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1026 = _870 + _1024;
    float _1028 = fma(_1022, _1016, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1032 = _872 + _1030;
    float _1034 = fma(_1026, _1016, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1036 = -_460;
    float _1038 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1028);
    float _1040 = fma(_1032, _1016, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1042 = -_462;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1034);
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1048 = _1038 + _1046;
    float _1050 = -_490;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1040);
    float _1054 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1056 = _1044 + _1054;
    float _1058 = _1048 * _1048;
    float _1060 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1062 = _1052 + _1060;
    float _1064 = fma(_1056, _1056, _1058);
    float _1066 = fma(_1062, _1062, _1064);
    float _1068 = rsqrt(_1066);
    float _1070 = _1068 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1072 = _1056 * _1070;
    float _1074 = _1062 * _1070;
    float _1076 = _1072 * _1072;
    float _1078 = _1074 * _1074;
    float _1080 = _1076 + _1078;
    float _1082 = sqrt(_1080);
    bool _1084 = _1082 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1088 = _1082 + _1086;
    float _1090 = _1064;
    float _1092 = _1018;
    float _1094 = _1088;
    float _1096 = _1072;
    if (_1084)
    {
        float _1098 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1090 = _1098;
    }
    float _1100 = _1090;
    if (_1084)
    {
        float _1102 = rsqrt(_1080);
        _1092 = _1102;
    }
    float _1104 = _1092;
    float _1106 = _1104;
    if (_1084)
    {
        float _1108 = _1088 * _1100;
        _1094 = _1108;
    }
    float _1110 = _1094;
    if (_1084)
    {
        float _1112 = _1110 * 0.15915493667125701904296875;
        _946 = _1112;
    }
    float _1114 = _946;
    float _1116 = _1100;
    float _1118 = _1114;
    if (_1084)
    {
        float _1120 = _1114 * 6.283185482025146484375;
        float _1122 = sin(_1120);
        _1116 = _1122;
    }
    float _1124 = _1116;
    float _1126 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1128 = precise::max(0.0, _1126);
    float _1130 = _900;
    float _1132 = _1128;
    if (_1084)
    {
        float _1134 = _1114 * 6.283185482025146484375;
        float _1136 = cos(_1134);
        _1130 = _1136;
    }
    float _1138 = _1130;
    float _1140 = -_1070;
    float _1142 = -_1128;
    float _1144 = fma(_1048, _1140, _1142);
    if (_1084)
    {
        float _1146 = _1144 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1132 = _1146;
    }
    float _1148 = _1132;
    float _1150 = _1124;
    float _1152 = _1148;
    if (_1084)
    {
        float _1154 = fma(_1124, _1148, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _948 = _1154;
    }
    float _1156 = _948;
    if (!_1084)
    {
        _1150 = _1074;
    }
    float _1158 = _1150;
    float _1160 = _1158;
    float _1162 = _1138;
    if (_1084)
    {
        float _1164 = _1138 + (-1.0);
        _1152 = _1164;
    }
    float _1166 = _1152;
    float _1168 = _1166;
    if (_1084)
    {
        float _1170 = _1104 * _1156;
        _950 = _1170;
    }
    float _1172 = _950;
    if (!_1084)
    {
        _1106 = _1144;
    }
    float _1174 = _1106;
    float _1176 = sqrt(_1066);
    float _1178 = _1174;
    if (_1084)
    {
        float _1180 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1118 = _1180;
    }
    float _1182 = _1118;
    if (_1084)
    {
        float _1184 = _1072 * _1172;
        _1096 = _1184;
    }
    float _1186 = _1096;
    if (!_1084)
    {
        _1168 = _1076;
    }
    float _1188 = _1168;
    float _1190 = _1188;
    if (_1084)
    {
        float _1192 = _1074 * _1172;
        _1160 = _1192;
    }
    float _1194 = _1160;
    if (_1084)
    {
        float _1196 = fma(_1144, _1138, _1182);
        _1178 = _1196;
    }
    float _1198 = _1178;
    if (_1084)
    {
        float _1200 = _1186 * _1186;
        _1190 = _1200;
    }
    float _1202 = _1190;
    if (!_1084)
    {
        _1162 = _1078;
    }
    float _1204 = _1162;
    float _1206 = _1204;
    if (_1084)
    {
        float _1208 = _1194 * _1194;
        _1206 = _1208;
    }
    float _1210 = _1206;
    float _1212 = fma(_1198, _1198, _1202);
    float _1214 = _1212 + _1210;
    float _1216 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1220 = fma(_1176, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1218);
    float _1222 = precise::clamp(_1220, 0.0, 1.0);
    float _1224 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1226 = rsqrt(_1214);
    float _1228 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1216);
    float _1230 = -_1222;
    float _1232 = _1230 + 1.0;
    float _1234 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1236 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1224);
    float _1238 = _1038 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1240 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1228);
    float _1242 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1234);
    float _1244 = abs(_1232);
    float _1246 = log2(_1244);
    float _1248 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1236);
    float _1250 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1238);
    float _1252 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1242);
    float _1254 = _1240 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1256 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1258 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1250);
    float _1260 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1262 = _1226 * _1186;
    float _1264 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1266 = _1226 * _1198;
    float _1268 = _1226 * _1194;
    float _1270 = _1262 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1272 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1264);
    float _1274 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1276 = _1254 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1278 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1280 = -_1270;
    float _1282 = fma(_1266, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1280);
    float _1284 = _1258 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1286 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1272);
    float _1288 = -_1276;
    float _1290 = fma(_1288, _1274, 1.0);
    float _1292 = -_1268;
    float _1294 = fma(_1292, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1282);
    float _1296 = exp2(_1278);
    float _1298 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1286);
    float _1300 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1302 = fma(_1294, -0.5, 0.5);
    float _1304 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1306 = fma(_1294, 0.5, 0.5);
    float _1308 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1300);
    float _1310 = _1266 + 1.0;
    float _1312 = log2(_1290);
    float _1314 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1304);
    float _1316 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1308);
    float _1318 = fma(_1306, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1320 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1314);
    float _1322 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1316);
    float _1324 = 1.0 / _1298;
    float _1326 = -_1266;
    float _1328 = fma(_1296, _1310, _1326);
    float _1330 = fma(_1306, _1318, -0.212114393711090087890625);
    float _1332 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1320);
    float _1334 = fma(_1328, 0.5, 0.5);
    float _1336 = fma(_1306, _1330, 1.570728778839111328125);
    float _1338 = sqrt(_1302);
    float _1340 = _1312 * 0.693147182464599609375;
    float _1342 = _1322 * _1324;
    float _1344 = _1332 * _1324;
    float _1346 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1348 = fma(_1342, 0.5, 0.5);
    float _1350 = fma(_1344, -0.5, 0.5);
    float _1352 = _1338 * 0.636619746685028076171875;
    float3 _3552 = float3(_1348, _1350, _1346);
    float _1354 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3552, float3(0.0), isnan(_3552)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3552, float3(0.0), isnan(_3552)), level(0.0)).x;
    float3 _3563 = float3(_1348, _1350, _1346);
    float4 _1357 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3563, float3(0.0), isnan(_3563)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3563, float3(0.0), isnan(_3563)), level(0.0)).xyzw;
    float _1359 = _1357.x;
    float _1361 = _1357.y;
    float _1363 = _1357.z;
    float _1365 = _1357.w;
    float _1367 = -_1336;
    float _1369 = fma(_1352, _1367, 1.0);
    float2 _3585 = float2(_1369, _1334);
    float3 _1373 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3585, float2(0.0), isnan(_3585)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3585, float2(0.0), isnan(_3585)), level(0.0)).xyz;
    float _1375 = _1373.x;
    float _1377 = _1373.y;
    float _1379 = _1373.z;
    float _1381 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1383 = _1256 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_69.x = _1056;
    out.m_69.y = _1048;
    out.m_69.z = _1062;
    float _1385 = fma(_1260, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1383);
    float _1387 = exp2(_1381);
    float _1389 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1385);
    float _1391 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1389);
    float _1393 = _1391 + _1298;
    out.gl_Position.x = _1322;
    out.gl_Position.y = _1332;
    out.gl_Position.z = _1391;
    out.gl_Position.w = _1298;
    float _1395 = _1393 * 0.5;
    float _1397 = -_1387;
    float _1399 = _1397 + 1.0;
    float _1401 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1403 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.z = _1395;
    out.m_71.w = _1298;
    out.m_47.x = _1403;
    float _1405 = _1401 * _1354;
    float _1407 = -_1401;
    float _1409 = _1407 + 1.0;
    float _1411 = _1365 * _1405;
    float _1413 = _1365 * _1409;
    float _1415 = _1379 * _1405;
    float _1417 = fma(_1375, _1411, _1359);
    float _1419 = fma(_1377, _1411, _1361);
    float _1421 = fma(_1365, _1415, _1363);
    out.m_73.x = _1417;
    out.m_73.y = _1419;
    out.m_73.z = _1421;
    out.m_73.w = _1413;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

