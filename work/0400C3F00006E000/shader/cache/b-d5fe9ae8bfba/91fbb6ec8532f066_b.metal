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
    float4 m_63 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_87 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
    float4 m_67 [[attribute(9)]];
    float4 m_51 [[attribute(10)]];
    float4 m_61 [[attribute(11)]];
    float4 m_69 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2405 = false;
    bool _826 = false;
    bool _690 = false;
    bool _362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2690 = as_type<float>(_122);
        out.gl_Position.z = _2690;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_49.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = _140;
    if (_136)
    {
        float _144 = float(_106);
        _116 = _144;
    }
    float _146 = _116;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2760 = as_type<float>(_160);
        out.gl_Position.z = _2760;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = in.m_51.x;
    float _166 = _140 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    float _182 = in.m_57.x;
    float _184 = in.m_57.y;
    float _186 = in.m_57.z;
    float _188 = _166 * _162;
    float _190 = _140 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _192 = _190 * _174;
    float _194 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[20].x, _188);
    float _196 = in.m_59.x;
    float _198 = in.m_59.y;
    float _200 = in.m_59.z;
    float _202 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[20].y, _192);
    float _204 = floor(_194);
    int _206 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _208 = _206 != 0;
    float _210 = _194 * 6.283185482025146484375;
    float _212 = floor(_202);
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _216 = _214 != 0;
    int _218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _220 = _218 != 0;
    float _222 = _210 * 0.15915493667125701904296875;
    float _224 = _170 * _184;
    bool _226 = !_216;
    int _228 = _226 ? 0 : 1;
    float _230 = fma(_168, _182, _224);
    float _232 = -_204;
    float _234 = _194 + _232;
    float _236 = _170 * _178;
    int _238 = abs(_228);
    float _240 = fma(_168, _176, _236);
    float _242 = _170 * _198;
    bool _244 = !_208;
    int _246 = _244 ? 0 : 1;
    float _248 = -_212;
    float _250 = _202 + _248;
    float _252 = _202 * 6.283185482025146484375;
    float _254 = _222 * 6.283185482025146484375;
    float _256 = cos(_254);
    float _258 = float(_238);
    float _260 = fma(_168, _196, _242);
    float _262 = _252 * 0.15915493667125701904296875;
    float _264 = -_234;
    float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _268 = abs(_246);
    float _270 = fma(_172, _180, _240);
    float _272 = abs(_266);
    float _274 = _258 * _272;
    float _276 = _262 * 6.283185482025146484375;
    float _278 = cos(_276);
    float _280 = -_250;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _284 = _234 < 0.5;
    float _286 = float(_284);
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _290 = abs(_282);
    float _292 = _258 * _290;
    bool _294 = !_220;
    int _296 = _294 ? 0 : 1;
    float _298 = fma(_256, 0.5, 0.5);
    bool _300 = _250 < 0.5;
    float _302 = float(_300);
    int _304 = abs(_296);
    float _306 = float(_268);
    float _308 = -_286;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _312 = -_298;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _316 = -_302;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _320 = fma(_278, 0.5, 0.5);
    float _322 = fma(_306, _314, _274);
    float _324 = float(_304);
    float _326 = -_320;
    float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _330 = fma(_306, _328, _292);
    float _332 = fma(_172, _186, _230);
    float _334 = abs(_310);
    float _336 = fma(_324, _334, _322);
    float _338 = fma(_172, _200, _260);
    float _340 = abs(_318);
    float _342 = fma(_324, _340, _330);
    bool _344 = !_288;
    float _360;
    if (!_344)
    {
        float _346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _348 = _164 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _352 = _350 * _346;
        float _354 = floor(_352);
        float _356 = -_354;
        float _358 = _352 + _356;
        _360 = _358;
        _362 = true;
    }
    else
    {
        float _364 = float(_106);
        float _366 = 1.0 / _364;
        float _368 = _140 * _366;
        _360 = _368;
    }
    _362 = false;
    float _370 = _360;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _374 = _370 + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _392 = 1.0 / _378;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _394;
    float _398 = 1.0 / _390;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _402 = _370 + _400;
    bool _404 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _406 = isnan(_370);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    bool _416 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _418 = isnan(_370);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = 1.0 / _382;
    float _430 = _402 * _392;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _434 = _370 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _438 = _370 + _436;
    bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _442 = 1.0 / _396;
    float _444 = _434 * _398;
    bool _446 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _448 = isnan(_370);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _458;
    float _462 = fma(_460, _430, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _464 = 1.0 / _386;
    float _466 = _374 * _428;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _470 = _370 + _468;
    float _472 = -_456;
    float _474 = _472 + 1.0;
    float _476 = _470 * _442;
    bool _478 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _480 = isnan(_370);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    bool _490 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _492 = isnan(_370);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = _488 * _474;
    float _504 = -_488;
    float _506 = _504 + 1.0;
    float _508 = _438 * _464;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _514;
    float _518 = _500 * _506;
    float _520 = -_500;
    float _522 = _520 + 1.0;
    float _524 = fma(_512, _430, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _526 = fma(_516, _430, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _528 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _530 = isnan(_370);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = _414 * _522;
    float _542 = -_414;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _554 = -_538;
    float _556 = _554 + 1.0;
    float _558 = _538 * _544;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _564 = fma(_548, _466, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _566 = _426 * _556;
    float _568 = fma(_562, _466, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _570 = fma(_552, _466, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _572 = _526 * _566;
    float _574 = _524 * _566;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _576;
    float _580 = _462 * _566;
    float _582 = -_426;
    float _584 = _582 + 1.0;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _590;
    float _594 = fma(_578, _508, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _596 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[143].x, _574);
    float _598 = fma(_588, _508, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _600 = fma(_592, _508, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _602 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[143].y, _580);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _608 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[143].z, _572);
    float _610 = fma(_564, _558, _596);
    float _612 = fma(_568, _558, _602);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _618 = fma(_570, _558, _608);
    float _620 = fma(_594, _540, _610);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _626 = fma(_600, _540, _618);
    float _628 = fma(_606, _444, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _630 = fma(_616, _444, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _632 = fma(_598, _540, _612);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _638;
    float _642 = fma(_624, _444, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _644;
    float _648 = fma(_636, _476, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _650 = fma(_640, _476, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _652 = fma(_628, _518, _620);
    float _654 = fma(_646, _476, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _656 = fma(_630, _518, _632);
    float _658 = fma(_642, _518, _626);
    float _660 = fma(_648, _502, _652);
    float _662 = fma(_650, _502, _656);
    float _664 = fma(_654, _502, _658);
    float _666 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[148].x, _660);
    float _668 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[148].y, _662);
    float _670 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[148].z, _664);
    bool _672 = !_440;
    float _688;
    if (!_672)
    {
        float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _676 = _164 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[11].x, _140);
        float _680 = _678 * _674;
        float _682 = floor(_680);
        float _684 = -_682;
        float _686 = _680 + _684;
        _688 = _686;
        _690 = true;
    }
    else
    {
        float _692 = float(_106);
        float _694 = 1.0 / _692;
        float _696 = _140 * _694;
        _688 = _696;
    }
    _690 = false;
    float _698 = _688;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _702 = _698 + _700;
    float _704 = in.m_61.x;
    float _706 = in.m_61.y;
    bool _708 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _710 = isnan(_698);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _720;
    bool _724 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _726 = isnan(_698);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = -_718;
    float _738 = _736 + 1.0;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _740;
    float _744 = 1.0 / _722;
    bool _746 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _748 = _734 * _738;
    float _750 = -_734;
    float _752 = _750 + 1.0;
    float _754 = _702 * _744;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _756;
    float _760 = _668 * _706;
    float _762 = fma(_742, _754, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _764;
    float _768 = fma(_758, _754, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _770 = fma(_766, _754, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _772 = _762 * _748;
    float _774 = _770 * _748;
    float _776 = _768 * _748;
    float _778 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[107].x, _772);
    float _780 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[107].y, _774);
    float _782 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[107].z, _776);
    float _784 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[108].x, _778);
    float _786 = in.m_61.z;
    float _788 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[108].y, _780);
    float _790 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[108].z, _782);
    float _792 = _784 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _794 = _666 * _704;
    float _796 = _788 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _798 = _790 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _800 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _802 = _796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = _798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _800;
    out.m_63.y = _802;
    out.m_63.z = _804;
    float _806 = _670 * _786;
    bool _808 = !_746;
    float _824;
    if (!_808)
    {
        float _810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _812 = _164 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _814 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[11].z, _140);
        float _816 = _814 * _810;
        float _818 = floor(_816);
        float _820 = -_818;
        float _822 = _816 + _820;
        _824 = _822;
        _826 = true;
    }
    else
    {
        float _828 = float(_106);
        float _830 = 1.0 / _828;
        float _832 = _140 * _830;
        _824 = _832;
    }
    _826 = false;
    float _834 = _824;
    float _836 = in.m_44.x;
    float _838 = in.m_44.y;
    float _840 = in.m_44.z;
    float _842 = _164 * 2.0;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _850 = _848 != 0;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _854 = _852 != 0;
    float _856 = _342 * _760;
    float _858 = in.m_51.z;
    float _860 = _336 * _794;
    float _862 = floor(_842);
    float _864 = in.m_51.y;
    float _866 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _868 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _870 = in.m_57.w;
    float _872 = in.m_59.w;
    float _874 = in.m_55.w;
    bool _876 = _862 > 0.0;
    float _878 = _178 * _838;
    float _880 = _184 * _838;
    float _882 = _198 * _838;
    float _884 = fma(_176, _836, _878);
    float _886 = _858 * 2.0;
    float _888 = fma(_182, _836, _880);
    float _890 = _164 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _896 = _864 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _898 = fma(_196, _836, _882);
    float _900 = floor(_886);
    float _902 = _864 + _858;
    float _904 = -_892;
    float _906 = fma(_890, 2.0, _904);
    float _908 = fma(_896, -2.0, _894);
    float _910 = _902 + (-1.0);
    float _912 = _864 * 2.0;
    bool _914 = _862 >= 0.0;
    bool _916 = isnan(_862);
    bool _918 = _914 || _916;
    bool _920 = isnan(0.0);
    bool _922 = _918 || _920;
    float _924 = fma(_180, _840, _884);
    float _926 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _928 = floor(_912);
    int _930 = _922 ? 0 : 1;
    float _932 = fma(_200, _840, _898);
    float _934 = fma(_186, _840, _888);
    float _936 = _924 + _874;
    bool _938 = _900 > 0.0;
    float _940 = _932 + _872;
    float _942 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _944 = log2(_942);
    bool _946 = !_850;
    int _948 = _946 ? 0 : 1;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _952 = ~_930;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    float _958 = -_140;
    float _960 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[76].x, _906);
    bool _962 = _900 >= 0.0;
    bool _964 = isnan(_900);
    bool _966 = _962 || _964;
    bool _968 = isnan(0.0);
    bool _970 = _966 || _968;
    float _972 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[78].z, _950);
    int _974 = abs(_948);
    float _976 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _908);
    int _978 = _956;
    if (!_876)
    {
        int _980 = ~_930;
        int _982 = _980 + 1;
        _978 = _982;
    }
    int _984 = _978;
    float _986 = _934 + _870;
    int _988 = _970 ? 0 : 1;
    float _990 = _864 + (-0.5);
    float _992 = float(_974);
    float _994 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _972);
    float _996 = float(_984);
    float _998 = _944 * _140;
    int _1000 = ~_988;
    int _1002 = _1000 + 1;
    int _1004 = _1002 + 1;
    int _1006 = _1004;
    if (!_938)
    {
        int _1008 = ~_988;
        int _1010 = _1008 + 1;
        _1006 = _1010;
    }
    int _1012 = _1006;
    float _1014 = _992 * _996;
    float _1016 = in.m_65.x;
    float _1018 = in.m_65.y;
    float _1020 = in.m_65.z;
    float _1022 = exp2(_998);
    bool _1024 = _928 > 0.0;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1028 = _928 >= 0.0;
    bool _1030 = isnan(_928);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan(0.0);
    bool _1036 = _1032 || _1034;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1040 = 1.0 + _1038;
    bool _1042 = !_846;
    int _1044 = _1042 ? 0 : 1;
    float _1046 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1026);
    bool _1048 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1050 = isnan(1.0);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1056 = _1052 || _1054;
    int _1058 = abs(_1044);
    float _1060 = 1.0 / _1040;
    float _1062 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1046);
    int _1064 = _1036 ? 0 : 1;
    float _1066 = -_1022;
    float _1068 = _1066 + 1.0;
    float _1070 = float(_1012);
    float _1072 = _1014 * (-2.0);
    float _1074 = float(_1058);
    bool _1076 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1078 = isnan(0.0);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1084 = _1080 || _1082;
    float _1086 = fma(_1072, _1018, _1018);
    int _1088 = ~_1064;
    int _1090 = _1088 + 1;
    int _1092 = _1090 + 1;
    int _1094 = _1092;
    if (!_1024)
    {
        int _1096 = ~_1064;
        int _1098 = _1096 + 1;
        _1094 = _1098;
    }
    int _1100 = _1094;
    float _1102 = _1074 * _1070;
    float _1104 = _1084 ? _1068 : 0.0;
    float _1106 = fma(_926, _1072, _926);
    float _1108 = -_986;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1112 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1086);
    float _1114 = -_936;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    if (_1056)
    {
        float _1118 = _1104 * _1060;
        _142 = _1118;
    }
    float _1120 = _142;
    float _1122 = _1110 * _1110;
    bool _1124 = !_854;
    int _1126 = _1124 ? 0 : 1;
    float _1128 = -_940;
    float _1130 = _1128 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1132 = fma(_1106, _1120, _1112);
    float _1134 = fma(_1116, _1116, _1122);
    int _1136 = abs(_1126);
    float _1138 = _164 + _864;
    float _1140 = fma(_1130, _1130, _1134);
    float _1142 = _1102 * (-2.0);
    float _1144 = _1138 + (-1.0);
    float _1146 = float(_1136);
    float _1148 = _1132 * 0.15915493667125701904296875;
    float _1150 = float(_1100);
    float _1152 = rsqrt(_1140);
    float _1154 = fma(_1142, _1016, _1016);
    float _1156 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1158 = _164 + _858;
    float _1160 = _1146 * _1150;
    float _1162 = _164 + (-0.5);
    float _1164 = fma(_1156, _1142, _1156);
    float _1166 = _1158 + (-1.0);
    float _1168 = _1160 * (-2.0);
    float _1170 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1154);
    float _1172 = _858 + (-0.5);
    float _1174 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1176 = fma(_1168, _1020, _1020);
    float _1178 = fma(_1164, _1120, _1170);
    float _1180 = _1148 * 6.283185482025146484375;
    float _1182 = sin(_1180);
    float _1184 = _1130 * _1152;
    float _1186 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1176);
    float _1188 = _1116 * _1152;
    float _1190 = _1178 * 0.15915493667125701904296875;
    float _1192 = fma(_1174, _1168, _1174);
    float _1194 = in.m_67.x;
    float _1196 = in.m_67.y;
    float _1198 = in.m_67.z;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1202 = _1188 * _1200;
    float _1204 = _1110 * _1152;
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1208 = _1184 * _1206;
    float _1210 = fma(_1192, _1120, _1186);
    float _1212 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1214 = -_1202;
    float _1216 = fma(_1184, _1212, _1214);
    float _1218 = _1148 * 6.283185482025146484375;
    float _1220 = cos(_1218);
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1224 = _1204 * _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1228 = -_1208;
    float _1230 = fma(_1204, _1226, _1228);
    float _1232 = _1216 * _1216;
    float _1234 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1238 = -_1224;
    float _1240 = fma(_1188, _1236, _1238);
    float _1242 = _1190 * 6.283185482025146484375;
    float _1244 = sin(_1242);
    float _1246 = _1210 * 0.15915493667125701904296875;
    float _1248 = _1190 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1198);
    float _1254 = _1234 * _1252;
    float _1256 = _1246 * 6.283185482025146484375;
    float _1258 = cos(_1256);
    float _1260 = fma(_1230, _1230, _1232);
    float _1262 = _1244 * _1220;
    float _1264 = fma(_1240, _1240, _1260);
    float _1266 = _1244 * _1182;
    float _1268 = _1246 * 6.283185482025146484375;
    float _1270 = sin(_1268);
    float _1272 = _1250 * _1220;
    float _1274 = _1250 * _1182;
    float _1276 = rsqrt(_1264);
    float _1278 = _1220 * _1258;
    float _1280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1196);
    float _1282 = _1244 * _1258;
    float _1284 = _1250 * _1258;
    float _1286 = _1182 * _1258;
    float _1288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1194);
    float _1290 = fma(_1270, _1272, _1266);
    float _1292 = fma(_1270, _1266, _1272);
    float _1294 = _866 * _1280;
    float _1296 = _868 * _1288;
    float _1298 = -_1274;
    float _1300 = fma(_1270, _1262, _1298);
    float _1302 = -_1262;
    float _1304 = fma(_1270, _1274, _1302);
    float _1306 = _1284 * _1294;
    float _1308 = -_1294;
    float _1310 = _1270 * _1308;
    float _1312 = _1230 * _1276;
    float _1314 = _1216 * _1276;
    float _1316 = fma(_1290, _1296, _1306);
    float _1318 = _1240 * _1276;
    float _1320 = _1204 * _1312;
    float _1322 = fma(_1278, _1296, _1310);
    float _1324 = _1184 * _1314;
    float _1326 = _1282 * _1294;
    float _1328 = fma(_1304, _1254, _1316);
    float _1330 = -_1320;
    float _1332 = fma(_1188, _1314, _1330);
    float _1334 = fma(_1286, _1254, _1322);
    float _1336 = -_1324;
    float _1338 = fma(_1204, _1318, _1336);
    float _1340 = fma(_1300, _1296, _1326);
    float _1342 = _1332 * _1328;
    float _1344 = _1338 * _1328;
    float _1346 = fma(_1292, _1254, _1340);
    float _1348 = fma(_1318, _1334, _1342);
    float _1350 = fma(_1312, _1334, _1344);
    float _1352 = fma(_1184, _1346, _1348);
    float _1354 = _1188 * _1318;
    float _1356 = fma(_1188, _1346, _1350);
    float _1358 = _940 + _1352;
    float _1360 = -_1354;
    float _1362 = fma(_1184, _1312, _1360);
    float _1364 = _936 + _1356;
    float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1368 = _1358 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1372 = _1364 + _1370;
    float _1374 = _1368 * _1368;
    float _1376 = fma(_1372, _1372, _1374);
    float _1378 = _1362 * _1328;
    float _1380 = sqrt(_1376);
    float _1382 = fma(_1314, _1334, _1378);
    float _1384 = fma(_1204, _1346, _1382);
    float _1386 = _986 + _1384;
    bool _1388 = _1380 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1390 = _1384;
    float _1392 = _1328;
    float _1394 = _1334;
    float _1396 = _1368;
    if (!_1388)
    {
        _1390 = _1364;
    }
    float _1398 = _1390;
    float _1400 = _1398;
    if (!_1388)
    {
        _1392 = _1358;
    }
    float _1402 = _1392;
    float _1404 = _1402;
    if (!_1388)
    {
        _1394 = _1386;
    }
    float _1406 = _1394;
    bool _1408 = !_1388;
    float _1410 = _1406;
    if (!_1408)
    {
        float _1412 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1414 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1416 = _1380 + _1414;
        float _1418 = _1386 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1420 = rsqrt(_1376);
        float _1422 = _1416 * _1412;
        float _1424 = _1422 * 0.15915493667125701904296875;
        float _1426 = _1424 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = _1424 * 6.283185482025146484375;
        float _1432 = sin(_1430);
        float _1434 = _1428 + (-1.0);
        float _1436 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1438 = fma(_1432, _1418, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1440 = fma(_1386, _1428, _1436);
        float _1442 = _1420 * _1438;
        float _1444 = fma(_1372, _1442, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1446 = fma(_1368, _1442, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1410 = _1440;
        _1400 = _1444;
        _1404 = _1446;
    }
    float _1448 = _1410;
    float _1450 = _1400;
    float _1452 = _1404;
    float _1454 = -_986;
    float _1456 = _1454 + _1448;
    float _1458 = -_936;
    float _1460 = _1458 + _1450;
    float _1462 = -_940;
    float _1464 = _1462 + _1452;
    float _1466 = _1456 * _1456;
    bool _1468 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1470 = isnan(0.5);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1476 = _1472 || _1474;
    float _1478 = fma(_1460, _1460, _1466);
    float _1480 = fma(_1464, _1464, _1478);
    float _1482 = sqrt(_1480);
    bool _1484 = _1482 > 0.0;
    float _1486 = _1482;
    float _1488 = _1448;
    float _1490 = _1452;
    float _1492 = _1456;
    float _1494 = _1464;
    float _1496 = _1460;
    float _1498 = _1480;
    float _1500 = _1450;
    if (!_1484)
    {
        _1486 = _1450;
    }
    float _1502 = _1486;
    bool _1504 = !_1484;
    float _1506 = _1502;
    if (!_1504)
    {
        float _1508 = _332 * _332;
        float _1510 = fma(_270, _270, _1508);
        float _1512 = fma(_338, _338, _1510);
        float _1514 = rsqrt(_1480);
        float _1516 = sqrt(_1512);
        float _1518 = _1460 * _1514;
        float _1520 = _1464 * _1514;
        bool _1522 = _1516 > 0.0;
        float _1524 = _1456 * _1514;
        float _1526 = _1514;
        _1396 = _1512;
        if (!_1522)
        {
            _1526 = _1450;
        }
        float _1528 = _1526;
        bool _1530 = !_1522;
        _1506 = _1528;
        if (!_1530)
        {
            float _1532 = rsqrt(_1512);
            float _1534 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1536 = _332 * _1532;
            float _1538 = _270 * _1532;
            float _1540 = _338 * _1532;
            float _1542 = _1524 * _1536;
            float _1544 = fma(_1518, _1538, _1542);
            float _1546 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1548 = fma(_1520, _1540, _1544);
            float _1550 = _1548 * _1546;
            float _1552 = fma(_270, _1550, _1450);
            float _1554 = fma(_332, _1550, _1448);
            float _1556 = fma(_338, _1550, _1452);
            _1488 = _1554;
            _1490 = _1556;
            _1506 = _1552;
            _1492 = _1536;
            _1494 = _1550;
            _1496 = _1544;
            _1498 = _1542;
        }
    }
    float _1558 = _1488;
    float _1560 = _1490;
    float _1562 = _1506;
    float _1564 = _1396;
    float _1566 = _1492;
    float _1568 = _1494;
    float _1570 = _1496;
    float _1572 = _1498;
    float _1574 = _1564;
    float _1576 = _1562;
    float _1578 = _1568;
    float _1580 = _1572;
    if (_1476)
    {
        _1574 = _1558;
    }
    float _1582 = _1574;
    float _1584 = _1582;
    if (_1476)
    {
        _1500 = _1560;
    }
    float _1586 = _1500;
    float _1588 = _1586;
    if (!_1476)
    {
        float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1592 = _986 + _1590;
        float _1594 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1596 = _936 + _1594;
        float _1598 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1600 = _1592 * _1592;
        float _1602 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1604 = _940 + _1602;
        float _1606 = fma(_1596, _1596, _1600);
        float _1608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1610 = fma(_1604, _1604, _1606);
        float _1612 = sqrt(_1610);
        float _1614 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1616 = precise::min(_1612, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1618 = _1616 * _1608;
        float _1620 = -_936;
        float _1622 = _1620 + _1562;
        float _1624 = _1614 * _1618;
        float _1626 = -_986;
        float _1628 = _1626 + _1558;
        float _1630 = -_940;
        float _1632 = _1630 + _1560;
        float _1634 = fma(_1622, _1624, _936);
        float _1636 = fma(_1628, _1624, _986);
        float _1638 = fma(_1632, _1624, _940);
        _1584 = _1636;
        _1576 = _1634;
        _1588 = _1638;
    }
    float _1640 = _1584;
    float _1642 = _1576;
    float _1644 = _1588;
    float _1646 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1648 = _1640 + _1646;
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1652 = _1642 + _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1656 = _1644 + _1654;
    float _1658 = _1648 * _1648;
    float _1660 = fma(_1652, _1652, _1658);
    float _1662 = fma(_1656, _1656, _1660);
    float _1664 = rsqrt(_1662);
    float _1666 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1668 = _1652 * _1666;
    float _1670 = _1656 * _1666;
    float _1672 = _1668 * _1668;
    float _1674 = _1670 * _1670;
    float _1676 = _1672 + _1674;
    float _1678 = sqrt(_1676);
    bool _1680 = _1678 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1684 = _1678 + _1682;
    float _1686 = _1560;
    float _1688 = _1684;
    float _1690 = _1668;
    float _1692 = _1670;
    float _1694 = _1672;
    float _1696 = _1674;
    if (_1680)
    {
        float _1698 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1686 = _1698;
    }
    float _1700 = _1686;
    if (_1680)
    {
        float _1702 = _1684 * _1700;
        _1688 = _1702;
    }
    float _1704 = _1688;
    if (_1680)
    {
        float _1706 = _1704 * 0.15915493667125701904296875;
        _1578 = _1706;
    }
    float _1708 = _1578;
    float _1710 = _1566;
    if (_1680)
    {
        float _1712 = _1708 * 6.283185482025146484375;
        float _1714 = sin(_1712);
        _1710 = _1714;
    }
    float _1716 = _1710;
    float _1718 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1720 = precise::max(0.0, _1718);
    float _1722 = _1570;
    float _1724 = _1720;
    if (_1680)
    {
        float _1726 = _1708 * 6.283185482025146484375;
        float _1728 = cos(_1726);
        _1722 = _1728;
    }
    float _1730 = _1722;
    float _1732 = -_1666;
    float _1734 = -_1720;
    float _1736 = fma(_1648, _1732, _1734);
    float _1738 = _1718;
    if (_1680)
    {
        float _1740 = rsqrt(_1676);
        _1738 = _1740;
    }
    float _1742 = _1738;
    if (_1680)
    {
        float _1744 = _1736 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1724 = _1744;
    }
    float _1746 = _1724;
    float _1748 = _1746;
    float _1750 = _1716;
    if (_1680)
    {
        float _1752 = fma(_1716, _1746, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1580 = _1752;
    }
    float _1754 = _1580;
    if (_1680)
    {
        float _1756 = _1730 + (-1.0);
        _1748 = _1756;
    }
    float _1758 = _1748;
    float _1760 = sqrt(_1662);
    float _1762 = _1758;
    if (_1680)
    {
        float _1764 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1762 = _1764;
    }
    float _1766 = _1762;
    float _1768 = _1742;
    if (_1680)
    {
        float _1770 = _1742 * _1754;
        _1750 = _1770;
    }
    float _1772 = _1750;
    if (!_1680)
    {
        _1768 = _1736;
    }
    float _1774 = _1768;
    float _1776 = _1774;
    if (_1680)
    {
        float _1778 = fma(_1736, _1730, _1766);
        _1776 = _1778;
    }
    float _1780 = _1776;
    if (_1680)
    {
        float _1782 = _1668 * _1772;
        _1690 = _1782;
    }
    float _1784 = _1690;
    if (_1680)
    {
        float _1786 = _1670 * _1772;
        _1692 = _1786;
    }
    float _1788 = _1692;
    float _1790 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1792 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_1680)
    {
        float _1794 = _1784 * _1784;
        _1694 = _1794;
    }
    float _1796 = _1694;
    if (_1680)
    {
        float _1798 = _1788 * _1788;
        _1696 = _1798;
    }
    float _1800 = _1696;
    float _1802 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1790);
    float _1804 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1806 = fma(_1780, _1780, _1796);
    float _1808 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1810 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1802);
    float _1812 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1804);
    float _1814 = _1806 + _1800;
    float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1818 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1816);
    float _1820 = precise::clamp(_1818, 0.0, 1.0);
    float _1822 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1808);
    float _1824 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1812);
    float _1826 = _1810 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1828 = -_1820;
    float _1830 = _1828 + 1.0;
    float _1832 = rsqrt(_1814);
    float _1834 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1836 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1822);
    float _1838 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1840 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1842 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1844 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1838);
    float _1846 = abs(_1830);
    float _1848 = log2(_1846);
    float _1850 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1852 = -_1840;
    float _1854 = fma(_1852, _1792, 1.0);
    float _1856 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1844);
    float _1858 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1860 = _1856 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1862 = _1832 * _1784;
    float _1864 = _1832 * _1780;
    float _1866 = _1832 * _1788;
    float _1868 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1850);
    float _1870 = _1862 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1872 = log2(_1854);
    float _1874 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1876 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1868);
    float _1878 = -_1870;
    float _1880 = fma(_1864, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1878);
    float _1882 = _1848 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1884 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1858);
    float _1886 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1876);
    float _1888 = -_1866;
    float _1890 = fma(_1888, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1880);
    float _1892 = exp2(_1882);
    float _1894 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1884);
    float _1896 = fma(_1890, -0.5, 0.5);
    float _1898 = fma(_1890, 0.5, 0.5);
    float _1900 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1874);
    float _1902 = 1.0 / _1886;
    float _1904 = _1864 + 1.0;
    float _1906 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1900);
    float _1908 = fma(_1898, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1910 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1906);
    float _1912 = fma(_1898, _1908, -0.212114393711090087890625);
    float _1914 = sqrt(_1896);
    float _1916 = -_1864;
    float _1918 = fma(_1892, _1904, _1916);
    float _1920 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1894);
    float _1922 = _1872 * 0.693147182464599609375;
    float _1924 = fma(_1898, _1912, 1.570728778839111328125);
    float _1926 = _1922 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1928 = _1910 * _1902;
    float _1930 = _1920 * _1902;
    float _1932 = fma(_1928, 0.5, 0.5);
    float _1934 = _1914 * 0.636619746685028076171875;
    float _1936 = fma(_1930, -0.5, 0.5);
    float _1938 = -_1924;
    float _1940 = fma(_1934, _1938, 1.0);
    float _1942 = fma(_1918, 0.5, 0.5);
    float3 _5514 = float3(_1932, _1936, _1926);
    float _1944 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5514, float3(0.0), isnan(_5514)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5514, float3(0.0), isnan(_5514)), level(0.0)).x;
    float3 _5525 = float3(_1932, _1936, _1926);
    float4 _1947 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5525, float3(0.0), isnan(_5525)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5525, float3(0.0), isnan(_5525)), level(0.0)).xyzw;
    float _1949 = _1947.x;
    float _1951 = _1947.y;
    float _1953 = _1947.z;
    float _1955 = _1947.w;
    float2 _5542 = float2(_1940, _1942);
    float3 _1959 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5542, float2(0.0), isnan(_5542)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5542, float2(0.0), isnan(_5542)), level(0.0)).xyz;
    float _1961 = _1959.x;
    float _1963 = _1959.y;
    float _1965 = _1959.z;
    float _1967 = in.m_69.x;
    float _1969 = in.m_69.y;
    float _1971 = _1848 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_71.x = _1642;
    out.m_71.y = _1640;
    out.m_71.z = _1644;
    bool _1973 = _164 > 0.5;
    float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1975;
    int _1979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1981 = _1979 != 0;
    float _1983 = exp2(_1971);
    int _1985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1987 = _1985 != 0;
    float _1989 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1991 = _834 + _1989;
    bool _1993 = _864 > 0.5;
    float _1995 = 1.0 / _1977;
    bool _1997 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1999 = isnan(_834);
    bool _2001 = _1997 || _1999;
    bool _2003 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2005 = _2001 || _2003;
    float _2007 = float(_2005);
    float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2009;
    bool _2013 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2015 = isnan(_834);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2021 = _2017 || _2019;
    float _2023 = float(_2021);
    float _2025 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2025;
    float _2029 = -_2007;
    float _2031 = _2029 + 1.0;
    float _2033 = _868 * _1967;
    float _2035 = _866 * _1969;
    float _2037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2039 = -_1983;
    float _2041 = _2039 + 1.0;
    float _2043 = -_2035;
    float _2045 = _2043 + 1.0;
    float _2047 = _1991 * _1995;
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2049;
    float _2053 = -_2033;
    float _2055 = _2053 + 1.0;
    float _2057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2059 = fma(_2011, _2047, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2061 = fma(_2051, _2047, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2063 = fma(_2027, _2047, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2065 = _2023 * _2031;
    float _2067 = _2033;
    float _2069 = _2035;
    float _2071 = _1886;
    float _2073 = _1910;
    float _2075 = _1920;
    if (_1981)
    {
        float _2077 = _1973 ? _2055 : _2033;
        _2067 = _2077;
    }
    float _2079 = _2067;
    float _2081 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1987)
    {
        float _2083 = _1993 ? _2045 : _2035;
        _2069 = _2083;
    }
    float _2085 = _2069;
    float _2087 = _2037 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2089 = _2061 * _2065;
    float _2091 = _2059 * _2065;
    bool _2093 = _1196 != 0.0;
    bool _2095 = isnan(_1196);
    bool _2097 = _2093 || _2095;
    bool _2099 = isnan(0.0);
    bool _2101 = _2097 || _2099;
    float _2103 = in.m_73.x;
    float _2105 = in.m_73.y;
    float _2107 = in.m_73.z;
    float _2109 = _2063 * _2065;
    float _2111 = fma(_2087, _2079, -0.5);
    bool _2113 = _1194 == 0.0;
    bool _2115 = !_2101;
    bool _2117 = _2113 && _2115;
    float _2119 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2121 = -_2023;
    float _2123 = _2121 + 1.0;
    float _2125 = fma(_994, _2111, _960);
    bool _2127 = _1198 == 0.0;
    bool _2129 = _2127 && _2117;
    float _2131 = fma(_2119, _2085, -0.5);
    float _2133 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2091);
    float _2135 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2089);
    float _2137 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2109);
    float _2139 = -_976;
    float _2141 = fma(_1062, _2131, _2139);
    float _2143 = _2125 + 0.5;
    float _2145 = _1304 * _1338;
    float _2147 = _1290 * _1362;
    float _2149 = _2141 + 0.5;
    float _2151 = _1284 * _1362;
    float _2153 = fma(_2007, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2133);
    float _2155 = fma(_2007, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2135);
    float _2157 = fma(_2007, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2137);
    out.m_75.x = _2143;
    out.m_75.y = _2149;
    float _2159 = -_1270;
    float _2161 = fma(_2159, _1314, _2151);
    float _2163 = _1304 * _1362;
    float _2165 = _2103;
    float _2167 = _2105;
    float _2169 = _2107;
    if (!_2129)
    {
        float _2171 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2103);
        _2165 = _2171;
    }
    float _2173 = _2165;
    if (!_2129)
    {
        float _2175 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2105);
        _2167 = _2175;
    }
    float _2177 = _2167;
    float _2179 = _1284 * _1338;
    float _2181 = _1290 * _1338;
    if (!_2129)
    {
        float _2183 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2107);
        _2169 = _2183;
    }
    float _2185 = _2169;
    float _2187 = _1284 * _1332;
    float _2189 = -_1270;
    float _2191 = fma(_2189, _1312, _2179);
    float _2193 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2195 = fma(_1278, _1312, _2181);
    float _2197 = fma(_1286, _1312, _2145);
    float _2199 = fma(_1278, _1314, _2147);
    float _2201 = fma(_1282, _1204, _2161);
    float _2203 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2205 = _1290 * _1332;
    float _2207 = -_1270;
    float _2209 = fma(_2207, _1318, _2187);
    float _2211 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2193);
    float _2213 = _2155 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2215 = _2157 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2217 = fma(_1300, _1188, _2195);
    float _2219 = fma(_1286, _1314, _2163);
    float _2221 = fma(_1282, _1188, _2191);
    float _2223 = fma(_1300, _1204, _2199);
    float _2225 = _2201 * _2177;
    float _2227 = _1304 * _1332;
    float _2229 = fma(_1278, _1318, _2205);
    float _2231 = fma(_1282, _1184, _2209);
    float _2233 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2211);
    float _2235 = _2213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2237 = _2203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2239 = _2215 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2241 = fma(_1292, _1204, _2219);
    float _2243 = _2221 * _2177;
    float _2245 = fma(_2223, _2173, _2225);
    float _2247 = fma(_1286, _1318, _2227);
    float _2249 = fma(_1300, _1184, _2229);
    float _2251 = _2231 * _2177;
    float _2253 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2233);
    out.m_77.x = _2235;
    out.m_77.y = _2237;
    out.m_77.z = _2239;
    float _2255 = fma(_2217, _2173, _2243);
    float _2257 = fma(_2241, _2185, _2245);
    float _2259 = fma(_1292, _1184, _2247);
    float _2261 = fma(_2249, _2173, _2251);
    float _2263 = _2253 + _1886;
    bool _2265 = _1760 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2267 = isnan(_1760);
    bool _2269 = _2265 || _2267;
    bool _2271 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2273 = _2269 || _2271;
    out.gl_Position.x = _1910;
    out.gl_Position.y = _1920;
    out.gl_Position.z = _2253;
    out.gl_Position.w = _1886;
    float _2275 = fma(_1292, _1188, _2197);
    float _2277 = _2263 * 0.5;
    float _2279 = fma(_2275, _2185, _2255);
    float _2281 = fma(_2259, _2185, _2261);
    float _2283 = _2255;
    float _2285 = _2263;
    if (!_2273)
    {
        _2283 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2287 = _2283;
    float _2289 = _2287;
    float _2291 = _2287;
    if (!_2273)
    {
        _2071 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2293 = _2071;
    out.m_79.z = _2277;
    out.m_79.w = _1886;
    float _2295 = _2293;
    float _2297 = _2293;
    if (!_2273)
    {
        _2073 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2299 = _2073;
    float _2301 = _2299;
    float _2303 = _2299;
    if (!_2273)
    {
        _2075 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2305 = _2075;
    out.m_81.x = _2279;
    out.m_81.y = _2257;
    out.m_81.z = _2281;
    float _2307 = _2305;
    float _2309 = _2305;
    if (!_2273)
    {
        _2285 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2311 = _2285;
    float _2313 = _2081 * _1944;
    float _2315 = -_2081;
    float _2317 = _2315 + 1.0;
    float _2319 = _1955 * _2313;
    float _2321 = _1965 * _2313;
    float _2323 = _1955 * _2317;
    float _2325 = fma(_1961, _2319, _1949);
    float _2327 = fma(_1963, _2319, _1951);
    float _2329 = fma(_1955, _2321, _1953);
    float _2331 = _2319;
    float _2333 = _2311;
    float _2335 = _2311;
    if (!_2273)
    {
        _2331 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2337 = _2331;
    out.m_83.x = _2325;
    out.m_83.y = _2327;
    out.m_83.z = _2329;
    out.m_83.w = _2323;
    bool _2339 = !_2273;
    float _2341 = _2337;
    float _2343 = _2337;
    if (!_2339)
    {
        bool _2345 = _1760 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2347 = isnan(_1760);
        bool _2349 = _2345 || _2347;
        bool _2351 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2353 = _2349 || _2351;
        if (!_2353)
        {
            float _2355 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2357 = _1760 + _2355;
            float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2361 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2359;
            float _2363 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2365 = _2363 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2367 = 1.0 / _2361;
            float _2369 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2371 = _2369 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2375 = _2373 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2379 = _2377 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2385 = _2357 * _2367;
            float _2387 = precise::clamp(_2385, 0.0, 1.0);
            float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2393 = fma(_2387, _2365, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2395 = fma(_2387, _2391, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2397 = fma(_2387, _2371, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2399 = fma(_2387, _2375, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2401 = fma(_2387, _2379, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2403 = fma(_2387, _2383, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2303 = _2397;
            _2335 = _2401;
            _2297 = _2393;
            _2291 = _2399;
            _2309 = _2395;
            _2343 = _2403;
            _2405 = true;
        }
        else
        {
            bool _2407 = _1760 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2409 = isnan(_1760);
            bool _2411 = _2407 || _2409;
            bool _2413 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2415 = _2411 || _2413;
            if (!_2415)
            {
                _2295 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2417 = _2295;
            _2297 = _2417;
            if (!_2415)
            {
                _2301 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2419 = _2301;
            _2303 = _2419;
            if (!_2415)
            {
                _2307 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2421 = _2307;
            _2309 = _2421;
            if (!_2415)
            {
                _2289 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2423 = _2289;
            _2291 = _2423;
            if (!_2415)
            {
                _2333 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2425 = _2333;
            _2335 = _2425;
            if (!_2415)
            {
                _2341 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2427 = _2341;
            bool _2429 = !_2415;
            _2343 = _2427;
            if (!_2429)
            {
                bool _2431 = _1760 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2433 = isnan(_1760);
                bool _2435 = _2431 || _2433;
                bool _2437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2439 = _2435 || _2437;
                if (!_2439)
                {
                    float _2441 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2443 = _1760 + _2441;
                    float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2447 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2445;
                    float _2449 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2453 = 1.0 / _2447;
                    float _2455 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2457 = _2455 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2461 = _2459 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2465 = _2463 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2469 = _2467 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2471 = _2443 * _2453;
                    float _2473 = precise::clamp(_2471, 0.0, 1.0);
                    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2477 = _2475 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2479 = fma(_2473, _2451, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2481 = fma(_2473, _2477, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2483 = fma(_2473, _2457, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2485 = fma(_2473, _2461, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2487 = fma(_2473, _2465, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2489 = fma(_2473, _2469, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2303 = _2483;
                    _2335 = _2487;
                    _2297 = _2479;
                    _2291 = _2485;
                    _2309 = _2481;
                    _2343 = _2489;
                    _2405 = true;
                }
                else
                {
                    _2303 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2335 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2297 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2291 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2309 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2343 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2405 = false;
    float _2491 = _2303;
    float _2493 = _2335;
    float _2495 = _2297;
    float _2497 = _2291;
    float _2499 = _2309;
    float _2501 = _2343;
    float _2503 = fma(_2257, -0.5, 0.5);
    float _2505 = precise::clamp(_2503, 0.0, 1.0);
    float _2507 = -_2491;
    float _2509 = _2507 + _2493;
    float _2511 = -_2495;
    float _2513 = _2511 + _2497;
    float _2515 = -_2499;
    float _2517 = _2515 + _2501;
    bool _2519 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2521 = fma(_2505, _2509, _2491);
    float _2523 = fma(_2505, _2513, _2495);
    float _2525 = fma(_2505, _2517, _2499);
    float _2527 = _2521 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _2529 = fma(_2523, 0.298911988735198974609375, _2527);
    float _2531 = fma(_2525, 0.114477999508380889892578125, _2529);
    float _2533 = -_2531;
    float _2535 = _2523 + _2533;
    float _2537 = -_2531;
    float _2539 = _2521 + _2537;
    float _2541 = -_2531;
    float _2543 = _2525 + _2541;
    float _2545 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2547 = fma(_2535, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2531);
    float _2549 = fma(_2539, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2531);
    float _2551 = fma(_2543, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2531);
    out.m_47.x = _2545;
    out.m_87.x = _2547;
    out.m_87.y = _2549;
    out.m_87.z = _2551;
    if (!_2519)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2553 = -_1640;
    float _2555 = _2553 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2557 = -_1642;
    float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2561 = -_1644;
    float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2565 = _2555 * _2555;
    float _2567 = fma(_2559, _2559, _2565);
    float _2569 = fma(_2563, _2563, _2567);
    float _2571 = sqrt(_2569);
    float _2573 = rsqrt(_2569);
    float _2575 = -_2571;
    float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2579 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2581 = precise::clamp(_2579, 0.0, 1.0);
    float _2583 = _2559 * _2573;
    float _2585 = _2555 * _2573;
    float _2587 = abs(_2581);
    float _2589 = log2(_2587);
    float _2591 = _2563 * _2573;
    float _2593 = _2583 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2595 = _2257 * _2585;
    float _2597 = -_2585;
    float _2599 = -_2593;
    float _2601 = fma(_2597, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2599);
    float _2603 = fma(_2279, _2583, _2595);
    float _2605 = -_2591;
    float _2607 = fma(_2605, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2601);
    float _2609 = fma(_2281, _2591, _2603);
    float _2611 = precise::clamp(_2609, 0.0, 1.0);
    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2615 = _2607 + _2613;
    float _2617 = _2589 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2619 = _2615 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2621 = precise::clamp(_2619, 0.0, 1.0);
    float _2623 = exp2(_2617);
    float _2625 = _2623 * _2621;
    float _2627 = _2611 * _2625;
    float _2629 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2631 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2633 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2629;
    out.m_85.y = _2631;
    out.m_85.z = _2633;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2405 = false;
    bool _826 = false;
    bool _690 = false;
    bool _362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2690 = as_type<float>(_122);
        out.gl_Position.z = _2690;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_49.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = _140;
    if (_136)
    {
        float _144 = float(_106);
        _116 = _144;
    }
    float _146 = _116;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2760 = as_type<float>(_160);
        out.gl_Position.z = _2760;
    }
    if (_152)
    {
        return out;
    }
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = in.m_51.x;
    float _166 = _140 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    float _182 = in.m_57.x;
    float _184 = in.m_57.y;
    float _186 = in.m_57.z;
    float _188 = _166 * _162;
    float _190 = _140 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _192 = _190 * _174;
    float _194 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[20].x, _188);
    float _196 = in.m_59.x;
    float _198 = in.m_59.y;
    float _200 = in.m_59.z;
    float _202 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[20].y, _192);
    float _204 = floor(_194);
    int _206 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _208 = _206 != 0;
    float _210 = _194 * 6.283185482025146484375;
    float _212 = floor(_202);
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _216 = _214 != 0;
    int _218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _220 = _218 != 0;
    float _222 = _210 * 0.15915493667125701904296875;
    float _224 = _170 * _184;
    bool _226 = !_216;
    int _228 = _226 ? 0 : 1;
    float _230 = fma(_168, _182, _224);
    float _232 = -_204;
    float _234 = _194 + _232;
    float _236 = _170 * _178;
    int _238 = abs(_228);
    float _240 = fma(_168, _176, _236);
    float _242 = _170 * _198;
    bool _244 = !_208;
    int _246 = _244 ? 0 : 1;
    float _248 = -_212;
    float _250 = _202 + _248;
    float _252 = _202 * 6.283185482025146484375;
    float _254 = _222 * 6.283185482025146484375;
    float _256 = cos(_254);
    float _258 = float(_238);
    float _260 = fma(_168, _196, _242);
    float _262 = _252 * 0.15915493667125701904296875;
    float _264 = -_234;
    float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _268 = abs(_246);
    float _270 = fma(_172, _180, _240);
    float _272 = abs(_266);
    float _274 = _258 * _272;
    float _276 = _262 * 6.283185482025146484375;
    float _278 = cos(_276);
    float _280 = -_250;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _284 = _234 < 0.5;
    float _286 = float(_284);
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _290 = abs(_282);
    float _292 = _258 * _290;
    bool _294 = !_220;
    int _296 = _294 ? 0 : 1;
    float _298 = fma(_256, 0.5, 0.5);
    bool _300 = _250 < 0.5;
    float _302 = float(_300);
    int _304 = abs(_296);
    float _306 = float(_268);
    float _308 = -_286;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _312 = -_298;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _316 = -_302;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _320 = fma(_278, 0.5, 0.5);
    float _322 = fma(_306, _314, _274);
    float _324 = float(_304);
    float _326 = -_320;
    float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _330 = fma(_306, _328, _292);
    float _332 = fma(_172, _186, _230);
    float _334 = abs(_310);
    float _336 = fma(_324, _334, _322);
    float _338 = fma(_172, _200, _260);
    float _340 = abs(_318);
    float _342 = fma(_324, _340, _330);
    bool _344 = !_288;
    float _360;
    if (!_344)
    {
        float _346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _348 = _164 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _352 = _350 * _346;
        float _354 = floor(_352);
        float _356 = -_354;
        float _358 = _352 + _356;
        _360 = _358;
        _362 = true;
    }
    else
    {
        float _364 = float(_106);
        float _366 = 1.0 / _364;
        float _368 = _140 * _366;
        _360 = _368;
    }
    _362 = false;
    float _370 = _360;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _374 = _370 + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _392 = 1.0 / _378;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _394;
    float _398 = 1.0 / _390;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _402 = _370 + _400;
    bool _404 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _406 = isnan(_370);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    bool _416 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _418 = isnan(_370);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = 1.0 / _382;
    float _430 = _402 * _392;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _434 = _370 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _438 = _370 + _436;
    bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _442 = 1.0 / _396;
    float _444 = _434 * _398;
    bool _446 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _448 = isnan(_370);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _458;
    float _462 = fma(_460, _430, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _464 = 1.0 / _386;
    float _466 = _374 * _428;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _470 = _370 + _468;
    float _472 = -_456;
    float _474 = _472 + 1.0;
    float _476 = _470 * _442;
    bool _478 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _480 = isnan(_370);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    bool _490 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _492 = isnan(_370);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = _488 * _474;
    float _504 = -_488;
    float _506 = _504 + 1.0;
    float _508 = _438 * _464;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _514;
    float _518 = _500 * _506;
    float _520 = -_500;
    float _522 = _520 + 1.0;
    float _524 = fma(_512, _430, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _526 = fma(_516, _430, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _528 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _530 = isnan(_370);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = _414 * _522;
    float _542 = -_414;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _554 = -_538;
    float _556 = _554 + 1.0;
    float _558 = _538 * _544;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _564 = fma(_548, _466, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _566 = _426 * _556;
    float _568 = fma(_562, _466, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _570 = fma(_552, _466, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _572 = _526 * _566;
    float _574 = _524 * _566;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _576;
    float _580 = _462 * _566;
    float _582 = -_426;
    float _584 = _582 + 1.0;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _590;
    float _594 = fma(_578, _508, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _596 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[143].x, _574);
    float _598 = fma(_588, _508, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _600 = fma(_592, _508, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _602 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[143].y, _580);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _608 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[143].z, _572);
    float _610 = fma(_564, _558, _596);
    float _612 = fma(_568, _558, _602);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _618 = fma(_570, _558, _608);
    float _620 = fma(_594, _540, _610);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _626 = fma(_600, _540, _618);
    float _628 = fma(_606, _444, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _630 = fma(_616, _444, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _632 = fma(_598, _540, _612);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _638;
    float _642 = fma(_624, _444, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _644;
    float _648 = fma(_636, _476, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _650 = fma(_640, _476, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _652 = fma(_628, _518, _620);
    float _654 = fma(_646, _476, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _656 = fma(_630, _518, _632);
    float _658 = fma(_642, _518, _626);
    float _660 = fma(_648, _502, _652);
    float _662 = fma(_650, _502, _656);
    float _664 = fma(_654, _502, _658);
    float _666 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[148].x, _660);
    float _668 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[148].y, _662);
    float _670 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[148].z, _664);
    bool _672 = !_440;
    float _688;
    if (!_672)
    {
        float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _676 = _164 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[11].x, _140);
        float _680 = _678 * _674;
        float _682 = floor(_680);
        float _684 = -_682;
        float _686 = _680 + _684;
        _688 = _686;
        _690 = true;
    }
    else
    {
        float _692 = float(_106);
        float _694 = 1.0 / _692;
        float _696 = _140 * _694;
        _688 = _696;
    }
    _690 = false;
    float _698 = _688;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _702 = _698 + _700;
    float _704 = in.m_61.x;
    float _706 = in.m_61.y;
    bool _708 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _710 = isnan(_698);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _720;
    bool _724 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _726 = isnan(_698);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = -_718;
    float _738 = _736 + 1.0;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _740;
    float _744 = 1.0 / _722;
    bool _746 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _748 = _734 * _738;
    float _750 = -_734;
    float _752 = _750 + 1.0;
    float _754 = _702 * _744;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _756;
    float _760 = _668 * _706;
    float _762 = fma(_742, _754, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _764;
    float _768 = fma(_758, _754, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _770 = fma(_766, _754, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _772 = _762 * _748;
    float _774 = _770 * _748;
    float _776 = _768 * _748;
    float _778 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[107].x, _772);
    float _780 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[107].y, _774);
    float _782 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[107].z, _776);
    float _784 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[108].x, _778);
    float _786 = in.m_61.z;
    float _788 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[108].y, _780);
    float _790 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[108].z, _782);
    float _792 = _784 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _794 = _666 * _704;
    float _796 = _788 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _798 = _790 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _800 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _802 = _796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = _798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _800;
    out.m_63.y = _802;
    out.m_63.z = _804;
    float _806 = _670 * _786;
    bool _808 = !_746;
    float _824;
    if (!_808)
    {
        float _810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _812 = _164 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _814 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[11].z, _140);
        float _816 = _814 * _810;
        float _818 = floor(_816);
        float _820 = -_818;
        float _822 = _816 + _820;
        _824 = _822;
        _826 = true;
    }
    else
    {
        float _828 = float(_106);
        float _830 = 1.0 / _828;
        float _832 = _140 * _830;
        _824 = _832;
    }
    _826 = false;
    float _834 = _824;
    float _836 = in.m_44.x;
    float _838 = in.m_44.y;
    float _840 = in.m_44.z;
    float _842 = _164 * 2.0;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _850 = _848 != 0;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _854 = _852 != 0;
    float _856 = _342 * _760;
    float _858 = in.m_51.z;
    float _860 = _336 * _794;
    float _862 = floor(_842);
    float _864 = in.m_51.y;
    float _866 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _868 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _870 = in.m_57.w;
    float _872 = in.m_59.w;
    float _874 = in.m_55.w;
    bool _876 = _862 > 0.0;
    float _878 = _178 * _838;
    float _880 = _184 * _838;
    float _882 = _198 * _838;
    float _884 = fma(_176, _836, _878);
    float _886 = _858 * 2.0;
    float _888 = fma(_182, _836, _880);
    float _890 = _164 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _896 = _864 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _898 = fma(_196, _836, _882);
    float _900 = floor(_886);
    float _902 = _864 + _858;
    float _904 = -_892;
    float _906 = fma(_890, 2.0, _904);
    float _908 = fma(_896, -2.0, _894);
    float _910 = _902 + (-1.0);
    float _912 = _864 * 2.0;
    bool _914 = _862 >= 0.0;
    bool _916 = isnan(_862);
    bool _918 = _914 || _916;
    bool _920 = isnan(0.0);
    bool _922 = _918 || _920;
    float _924 = fma(_180, _840, _884);
    float _926 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _928 = floor(_912);
    int _930 = _922 ? 0 : 1;
    float _932 = fma(_200, _840, _898);
    float _934 = fma(_186, _840, _888);
    float _936 = _924 + _874;
    bool _938 = _900 > 0.0;
    float _940 = _932 + _872;
    float _942 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _944 = log2(_942);
    bool _946 = !_850;
    int _948 = _946 ? 0 : 1;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _952 = ~_930;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    float _958 = -_140;
    float _960 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[76].x, _906);
    bool _962 = _900 >= 0.0;
    bool _964 = isnan(_900);
    bool _966 = _962 || _964;
    bool _968 = isnan(0.0);
    bool _970 = _966 || _968;
    float _972 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[78].z, _950);
    int _974 = abs(_948);
    float _976 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _908);
    int _978 = _956;
    if (!_876)
    {
        int _980 = ~_930;
        int _982 = _980 + 1;
        _978 = _982;
    }
    int _984 = _978;
    float _986 = _934 + _870;
    int _988 = _970 ? 0 : 1;
    float _990 = _864 + (-0.5);
    float _992 = float(_974);
    float _994 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _972);
    float _996 = float(_984);
    float _998 = _944 * _140;
    int _1000 = ~_988;
    int _1002 = _1000 + 1;
    int _1004 = _1002 + 1;
    int _1006 = _1004;
    if (!_938)
    {
        int _1008 = ~_988;
        int _1010 = _1008 + 1;
        _1006 = _1010;
    }
    int _1012 = _1006;
    float _1014 = _992 * _996;
    float _1016 = in.m_65.x;
    float _1018 = in.m_65.y;
    float _1020 = in.m_65.z;
    float _1022 = exp2(_998);
    bool _1024 = _928 > 0.0;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1028 = _928 >= 0.0;
    bool _1030 = isnan(_928);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan(0.0);
    bool _1036 = _1032 || _1034;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1040 = 1.0 + _1038;
    bool _1042 = !_846;
    int _1044 = _1042 ? 0 : 1;
    float _1046 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1026);
    bool _1048 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1050 = isnan(1.0);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1056 = _1052 || _1054;
    int _1058 = abs(_1044);
    float _1060 = 1.0 / _1040;
    float _1062 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1046);
    int _1064 = _1036 ? 0 : 1;
    float _1066 = -_1022;
    float _1068 = _1066 + 1.0;
    float _1070 = float(_1012);
    float _1072 = _1014 * (-2.0);
    float _1074 = float(_1058);
    bool _1076 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1078 = isnan(0.0);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1084 = _1080 || _1082;
    float _1086 = fma(_1072, _1018, _1018);
    int _1088 = ~_1064;
    int _1090 = _1088 + 1;
    int _1092 = _1090 + 1;
    int _1094 = _1092;
    if (!_1024)
    {
        int _1096 = ~_1064;
        int _1098 = _1096 + 1;
        _1094 = _1098;
    }
    int _1100 = _1094;
    float _1102 = _1074 * _1070;
    float _1104 = _1084 ? _1068 : 0.0;
    float _1106 = fma(_926, _1072, _926);
    float _1108 = -_986;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1112 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1086);
    float _1114 = -_936;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    if (_1056)
    {
        float _1118 = _1104 * _1060;
        _142 = _1118;
    }
    float _1120 = _142;
    float _1122 = _1110 * _1110;
    bool _1124 = !_854;
    int _1126 = _1124 ? 0 : 1;
    float _1128 = -_940;
    float _1130 = _1128 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1132 = fma(_1106, _1120, _1112);
    float _1134 = fma(_1116, _1116, _1122);
    int _1136 = abs(_1126);
    float _1138 = _164 + _864;
    float _1140 = fma(_1130, _1130, _1134);
    float _1142 = _1102 * (-2.0);
    float _1144 = _1138 + (-1.0);
    float _1146 = float(_1136);
    float _1148 = _1132 * 0.15915493667125701904296875;
    float _1150 = float(_1100);
    float _1152 = rsqrt(_1140);
    float _1154 = fma(_1142, _1016, _1016);
    float _1156 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1158 = _164 + _858;
    float _1160 = _1146 * _1150;
    float _1162 = _164 + (-0.5);
    float _1164 = fma(_1156, _1142, _1156);
    float _1166 = _1158 + (-1.0);
    float _1168 = _1160 * (-2.0);
    float _1170 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1154);
    float _1172 = _858 + (-0.5);
    float _1174 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1176 = fma(_1168, _1020, _1020);
    float _1178 = fma(_1164, _1120, _1170);
    float _1180 = _1148 * 6.283185482025146484375;
    float _1182 = sin(_1180);
    float _1184 = _1130 * _1152;
    float _1186 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1176);
    float _1188 = _1116 * _1152;
    float _1190 = _1178 * 0.15915493667125701904296875;
    float _1192 = fma(_1174, _1168, _1174);
    float _1194 = in.m_67.x;
    float _1196 = in.m_67.y;
    float _1198 = in.m_67.z;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1202 = _1188 * _1200;
    float _1204 = _1110 * _1152;
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1208 = _1184 * _1206;
    float _1210 = fma(_1192, _1120, _1186);
    float _1212 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1214 = -_1202;
    float _1216 = fma(_1184, _1212, _1214);
    float _1218 = _1148 * 6.283185482025146484375;
    float _1220 = cos(_1218);
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1224 = _1204 * _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1228 = -_1208;
    float _1230 = fma(_1204, _1226, _1228);
    float _1232 = _1216 * _1216;
    float _1234 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1238 = -_1224;
    float _1240 = fma(_1188, _1236, _1238);
    float _1242 = _1190 * 6.283185482025146484375;
    float _1244 = sin(_1242);
    float _1246 = _1210 * 0.15915493667125701904296875;
    float _1248 = _1190 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1198);
    float _1254 = _1234 * _1252;
    float _1256 = _1246 * 6.283185482025146484375;
    float _1258 = cos(_1256);
    float _1260 = fma(_1230, _1230, _1232);
    float _1262 = _1244 * _1220;
    float _1264 = fma(_1240, _1240, _1260);
    float _1266 = _1244 * _1182;
    float _1268 = _1246 * 6.283185482025146484375;
    float _1270 = sin(_1268);
    float _1272 = _1250 * _1220;
    float _1274 = _1250 * _1182;
    float _1276 = rsqrt(_1264);
    float _1278 = _1220 * _1258;
    float _1280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1196);
    float _1282 = _1244 * _1258;
    float _1284 = _1250 * _1258;
    float _1286 = _1182 * _1258;
    float _1288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1194);
    float _1290 = fma(_1270, _1272, _1266);
    float _1292 = fma(_1270, _1266, _1272);
    float _1294 = _866 * _1280;
    float _1296 = _868 * _1288;
    float _1298 = -_1274;
    float _1300 = fma(_1270, _1262, _1298);
    float _1302 = -_1262;
    float _1304 = fma(_1270, _1274, _1302);
    float _1306 = _1284 * _1294;
    float _1308 = -_1294;
    float _1310 = _1270 * _1308;
    float _1312 = _1230 * _1276;
    float _1314 = _1216 * _1276;
    float _1316 = fma(_1290, _1296, _1306);
    float _1318 = _1240 * _1276;
    float _1320 = _1204 * _1312;
    float _1322 = fma(_1278, _1296, _1310);
    float _1324 = _1184 * _1314;
    float _1326 = _1282 * _1294;
    float _1328 = fma(_1304, _1254, _1316);
    float _1330 = -_1320;
    float _1332 = fma(_1188, _1314, _1330);
    float _1334 = fma(_1286, _1254, _1322);
    float _1336 = -_1324;
    float _1338 = fma(_1204, _1318, _1336);
    float _1340 = fma(_1300, _1296, _1326);
    float _1342 = _1332 * _1328;
    float _1344 = _1338 * _1328;
    float _1346 = fma(_1292, _1254, _1340);
    float _1348 = fma(_1318, _1334, _1342);
    float _1350 = fma(_1312, _1334, _1344);
    float _1352 = fma(_1184, _1346, _1348);
    float _1354 = _1188 * _1318;
    float _1356 = fma(_1188, _1346, _1350);
    float _1358 = _940 + _1352;
    float _1360 = -_1354;
    float _1362 = fma(_1184, _1312, _1360);
    float _1364 = _936 + _1356;
    float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1368 = _1358 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1372 = _1364 + _1370;
    float _1374 = _1368 * _1368;
    float _1376 = fma(_1372, _1372, _1374);
    float _1378 = _1362 * _1328;
    float _1380 = sqrt(_1376);
    float _1382 = fma(_1314, _1334, _1378);
    float _1384 = fma(_1204, _1346, _1382);
    float _1386 = _986 + _1384;
    bool _1388 = _1380 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1390 = _1384;
    float _1392 = _1328;
    float _1394 = _1334;
    float _1396 = _1368;
    if (!_1388)
    {
        _1390 = _1364;
    }
    float _1398 = _1390;
    float _1400 = _1398;
    if (!_1388)
    {
        _1392 = _1358;
    }
    float _1402 = _1392;
    float _1404 = _1402;
    if (!_1388)
    {
        _1394 = _1386;
    }
    float _1406 = _1394;
    bool _1408 = !_1388;
    float _1410 = _1406;
    if (!_1408)
    {
        float _1412 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1414 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1416 = _1380 + _1414;
        float _1418 = _1386 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1420 = rsqrt(_1376);
        float _1422 = _1416 * _1412;
        float _1424 = _1422 * 0.15915493667125701904296875;
        float _1426 = _1424 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = _1424 * 6.283185482025146484375;
        float _1432 = sin(_1430);
        float _1434 = _1428 + (-1.0);
        float _1436 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1438 = fma(_1432, _1418, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1440 = fma(_1386, _1428, _1436);
        float _1442 = _1420 * _1438;
        float _1444 = fma(_1372, _1442, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1446 = fma(_1368, _1442, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1410 = _1440;
        _1400 = _1444;
        _1404 = _1446;
    }
    float _1448 = _1410;
    float _1450 = _1400;
    float _1452 = _1404;
    float _1454 = -_986;
    float _1456 = _1454 + _1448;
    float _1458 = -_936;
    float _1460 = _1458 + _1450;
    float _1462 = -_940;
    float _1464 = _1462 + _1452;
    float _1466 = _1456 * _1456;
    bool _1468 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1470 = isnan(0.5);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1476 = _1472 || _1474;
    float _1478 = fma(_1460, _1460, _1466);
    float _1480 = fma(_1464, _1464, _1478);
    float _1482 = sqrt(_1480);
    bool _1484 = _1482 > 0.0;
    float _1486 = _1482;
    float _1488 = _1448;
    float _1490 = _1452;
    float _1492 = _1456;
    float _1494 = _1464;
    float _1496 = _1460;
    float _1498 = _1480;
    float _1500 = _1450;
    if (!_1484)
    {
        _1486 = _1450;
    }
    float _1502 = _1486;
    bool _1504 = !_1484;
    float _1506 = _1502;
    if (!_1504)
    {
        float _1508 = _332 * _332;
        float _1510 = fma(_270, _270, _1508);
        float _1512 = fma(_338, _338, _1510);
        float _1514 = rsqrt(_1480);
        float _1516 = sqrt(_1512);
        float _1518 = _1460 * _1514;
        float _1520 = _1464 * _1514;
        bool _1522 = _1516 > 0.0;
        float _1524 = _1456 * _1514;
        float _1526 = _1514;
        _1396 = _1512;
        if (!_1522)
        {
            _1526 = _1450;
        }
        float _1528 = _1526;
        bool _1530 = !_1522;
        _1506 = _1528;
        if (!_1530)
        {
            float _1532 = rsqrt(_1512);
            float _1534 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1536 = _332 * _1532;
            float _1538 = _270 * _1532;
            float _1540 = _338 * _1532;
            float _1542 = _1524 * _1536;
            float _1544 = fma(_1518, _1538, _1542);
            float _1546 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1548 = fma(_1520, _1540, _1544);
            float _1550 = _1548 * _1546;
            float _1552 = fma(_270, _1550, _1450);
            float _1554 = fma(_332, _1550, _1448);
            float _1556 = fma(_338, _1550, _1452);
            _1488 = _1554;
            _1490 = _1556;
            _1506 = _1552;
            _1492 = _1536;
            _1494 = _1550;
            _1496 = _1544;
            _1498 = _1542;
        }
    }
    float _1558 = _1488;
    float _1560 = _1490;
    float _1562 = _1506;
    float _1564 = _1396;
    float _1566 = _1492;
    float _1568 = _1494;
    float _1570 = _1496;
    float _1572 = _1498;
    float _1574 = _1564;
    float _1576 = _1562;
    float _1578 = _1568;
    float _1580 = _1572;
    if (_1476)
    {
        _1574 = _1558;
    }
    float _1582 = _1574;
    float _1584 = _1582;
    if (_1476)
    {
        _1500 = _1560;
    }
    float _1586 = _1500;
    float _1588 = _1586;
    if (!_1476)
    {
        float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1592 = _986 + _1590;
        float _1594 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1596 = _936 + _1594;
        float _1598 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1600 = _1592 * _1592;
        float _1602 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1604 = _940 + _1602;
        float _1606 = fma(_1596, _1596, _1600);
        float _1608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1610 = fma(_1604, _1604, _1606);
        float _1612 = sqrt(_1610);
        float _1614 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1616 = precise::min(_1612, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1618 = _1616 * _1608;
        float _1620 = -_936;
        float _1622 = _1620 + _1562;
        float _1624 = _1614 * _1618;
        float _1626 = -_986;
        float _1628 = _1626 + _1558;
        float _1630 = -_940;
        float _1632 = _1630 + _1560;
        float _1634 = fma(_1622, _1624, _936);
        float _1636 = fma(_1628, _1624, _986);
        float _1638 = fma(_1632, _1624, _940);
        _1584 = _1636;
        _1576 = _1634;
        _1588 = _1638;
    }
    float _1640 = _1584;
    float _1642 = _1576;
    float _1644 = _1588;
    float _1646 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1648 = _1640 + _1646;
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1652 = _1642 + _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1656 = _1644 + _1654;
    float _1658 = _1648 * _1648;
    float _1660 = fma(_1652, _1652, _1658);
    float _1662 = fma(_1656, _1656, _1660);
    float _1664 = rsqrt(_1662);
    float _1666 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1668 = _1652 * _1666;
    float _1670 = _1656 * _1666;
    float _1672 = _1668 * _1668;
    float _1674 = _1670 * _1670;
    float _1676 = _1672 + _1674;
    float _1678 = sqrt(_1676);
    bool _1680 = _1678 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1684 = _1678 + _1682;
    float _1686 = _1560;
    float _1688 = _1684;
    float _1690 = _1668;
    float _1692 = _1670;
    float _1694 = _1672;
    float _1696 = _1674;
    if (_1680)
    {
        float _1698 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1686 = _1698;
    }
    float _1700 = _1686;
    if (_1680)
    {
        float _1702 = _1684 * _1700;
        _1688 = _1702;
    }
    float _1704 = _1688;
    if (_1680)
    {
        float _1706 = _1704 * 0.15915493667125701904296875;
        _1578 = _1706;
    }
    float _1708 = _1578;
    float _1710 = _1566;
    if (_1680)
    {
        float _1712 = _1708 * 6.283185482025146484375;
        float _1714 = sin(_1712);
        _1710 = _1714;
    }
    float _1716 = _1710;
    float _1718 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1720 = precise::max(0.0, _1718);
    float _1722 = _1570;
    float _1724 = _1720;
    if (_1680)
    {
        float _1726 = _1708 * 6.283185482025146484375;
        float _1728 = cos(_1726);
        _1722 = _1728;
    }
    float _1730 = _1722;
    float _1732 = -_1666;
    float _1734 = -_1720;
    float _1736 = fma(_1648, _1732, _1734);
    float _1738 = _1718;
    if (_1680)
    {
        float _1740 = rsqrt(_1676);
        _1738 = _1740;
    }
    float _1742 = _1738;
    if (_1680)
    {
        float _1744 = _1736 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1724 = _1744;
    }
    float _1746 = _1724;
    float _1748 = _1746;
    float _1750 = _1716;
    if (_1680)
    {
        float _1752 = fma(_1716, _1746, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1580 = _1752;
    }
    float _1754 = _1580;
    if (_1680)
    {
        float _1756 = _1730 + (-1.0);
        _1748 = _1756;
    }
    float _1758 = _1748;
    float _1760 = sqrt(_1662);
    float _1762 = _1758;
    if (_1680)
    {
        float _1764 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1762 = _1764;
    }
    float _1766 = _1762;
    float _1768 = _1742;
    if (_1680)
    {
        float _1770 = _1742 * _1754;
        _1750 = _1770;
    }
    float _1772 = _1750;
    if (!_1680)
    {
        _1768 = _1736;
    }
    float _1774 = _1768;
    float _1776 = _1774;
    if (_1680)
    {
        float _1778 = fma(_1736, _1730, _1766);
        _1776 = _1778;
    }
    float _1780 = _1776;
    if (_1680)
    {
        float _1782 = _1668 * _1772;
        _1690 = _1782;
    }
    float _1784 = _1690;
    if (_1680)
    {
        float _1786 = _1670 * _1772;
        _1692 = _1786;
    }
    float _1788 = _1692;
    float _1790 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1792 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_1680)
    {
        float _1794 = _1784 * _1784;
        _1694 = _1794;
    }
    float _1796 = _1694;
    if (_1680)
    {
        float _1798 = _1788 * _1788;
        _1696 = _1798;
    }
    float _1800 = _1696;
    float _1802 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1790);
    float _1804 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1806 = fma(_1780, _1780, _1796);
    float _1808 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1810 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1802);
    float _1812 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1804);
    float _1814 = _1806 + _1800;
    float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1818 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1816);
    float _1820 = precise::clamp(_1818, 0.0, 1.0);
    float _1822 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1808);
    float _1824 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1812);
    float _1826 = _1810 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1828 = -_1820;
    float _1830 = _1828 + 1.0;
    float _1832 = rsqrt(_1814);
    float _1834 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1836 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1822);
    float _1838 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1840 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1842 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1844 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1838);
    float _1846 = abs(_1830);
    float _1848 = log2(_1846);
    float _1850 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1852 = -_1840;
    float _1854 = fma(_1852, _1792, 1.0);
    float _1856 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1844);
    float _1858 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1860 = _1856 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1862 = _1832 * _1784;
    float _1864 = _1832 * _1780;
    float _1866 = _1832 * _1788;
    float _1868 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1850);
    float _1870 = _1862 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1872 = log2(_1854);
    float _1874 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1876 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1868);
    float _1878 = -_1870;
    float _1880 = fma(_1864, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1878);
    float _1882 = _1848 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1884 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1858);
    float _1886 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1876);
    float _1888 = -_1866;
    float _1890 = fma(_1888, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1880);
    float _1892 = exp2(_1882);
    float _1894 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1884);
    float _1896 = fma(_1890, -0.5, 0.5);
    float _1898 = fma(_1890, 0.5, 0.5);
    float _1900 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1874);
    float _1902 = 1.0 / _1886;
    float _1904 = _1864 + 1.0;
    float _1906 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1900);
    float _1908 = fma(_1898, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1910 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1906);
    float _1912 = fma(_1898, _1908, -0.212114393711090087890625);
    float _1914 = sqrt(_1896);
    float _1916 = -_1864;
    float _1918 = fma(_1892, _1904, _1916);
    float _1920 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1894);
    float _1922 = _1872 * 0.693147182464599609375;
    float _1924 = fma(_1898, _1912, 1.570728778839111328125);
    float _1926 = _1922 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1928 = _1910 * _1902;
    float _1930 = _1920 * _1902;
    float _1932 = fma(_1928, 0.5, 0.5);
    float _1934 = _1914 * 0.636619746685028076171875;
    float _1936 = fma(_1930, -0.5, 0.5);
    float _1938 = -_1924;
    float _1940 = fma(_1934, _1938, 1.0);
    float _1942 = fma(_1918, 0.5, 0.5);
    float3 _5514 = float3(_1932, _1936, _1926);
    float _1944 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5514, float3(0.0), isnan(_5514)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5514, float3(0.0), isnan(_5514)), level(0.0)).x;
    float3 _5525 = float3(_1932, _1936, _1926);
    float4 _1947 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5525, float3(0.0), isnan(_5525)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5525, float3(0.0), isnan(_5525)), level(0.0)).xyzw;
    float _1949 = _1947.x;
    float _1951 = _1947.y;
    float _1953 = _1947.z;
    float _1955 = _1947.w;
    float2 _5542 = float2(_1940, _1942);
    float3 _1959 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5542, float2(0.0), isnan(_5542)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5542, float2(0.0), isnan(_5542)), level(0.0)).xyz;
    float _1961 = _1959.x;
    float _1963 = _1959.y;
    float _1965 = _1959.z;
    float _1967 = in.m_69.x;
    float _1969 = in.m_69.y;
    float _1971 = _1848 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_71.x = _1642;
    out.m_71.y = _1640;
    out.m_71.z = _1644;
    bool _1973 = _164 > 0.5;
    float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1975;
    int _1979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1981 = _1979 != 0;
    float _1983 = exp2(_1971);
    int _1985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1987 = _1985 != 0;
    float _1989 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1991 = _834 + _1989;
    bool _1993 = _864 > 0.5;
    float _1995 = 1.0 / _1977;
    bool _1997 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1999 = isnan(_834);
    bool _2001 = _1997 || _1999;
    bool _2003 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2005 = _2001 || _2003;
    float _2007 = float(_2005);
    float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2009;
    bool _2013 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2015 = isnan(_834);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2021 = _2017 || _2019;
    float _2023 = float(_2021);
    float _2025 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2025;
    float _2029 = -_2007;
    float _2031 = _2029 + 1.0;
    float _2033 = _868 * _1967;
    float _2035 = _866 * _1969;
    float _2037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2039 = -_1983;
    float _2041 = _2039 + 1.0;
    float _2043 = -_2035;
    float _2045 = _2043 + 1.0;
    float _2047 = _1991 * _1995;
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2049;
    float _2053 = -_2033;
    float _2055 = _2053 + 1.0;
    float _2057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2059 = fma(_2011, _2047, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2061 = fma(_2051, _2047, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2063 = fma(_2027, _2047, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2065 = _2023 * _2031;
    float _2067 = _2033;
    float _2069 = _2035;
    float _2071 = _1886;
    float _2073 = _1910;
    float _2075 = _1920;
    if (_1981)
    {
        float _2077 = _1973 ? _2055 : _2033;
        _2067 = _2077;
    }
    float _2079 = _2067;
    float _2081 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1987)
    {
        float _2083 = _1993 ? _2045 : _2035;
        _2069 = _2083;
    }
    float _2085 = _2069;
    float _2087 = _2037 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2089 = _2061 * _2065;
    float _2091 = _2059 * _2065;
    bool _2093 = _1196 != 0.0;
    bool _2095 = isnan(_1196);
    bool _2097 = _2093 || _2095;
    bool _2099 = isnan(0.0);
    bool _2101 = _2097 || _2099;
    float _2103 = in.m_73.x;
    float _2105 = in.m_73.y;
    float _2107 = in.m_73.z;
    float _2109 = _2063 * _2065;
    float _2111 = fma(_2087, _2079, -0.5);
    bool _2113 = _1194 == 0.0;
    bool _2115 = !_2101;
    bool _2117 = _2113 && _2115;
    float _2119 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2121 = -_2023;
    float _2123 = _2121 + 1.0;
    float _2125 = fma(_994, _2111, _960);
    bool _2127 = _1198 == 0.0;
    bool _2129 = _2127 && _2117;
    float _2131 = fma(_2119, _2085, -0.5);
    float _2133 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2091);
    float _2135 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2089);
    float _2137 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2109);
    float _2139 = -_976;
    float _2141 = fma(_1062, _2131, _2139);
    float _2143 = _2125 + 0.5;
    float _2145 = _1304 * _1338;
    float _2147 = _1290 * _1362;
    float _2149 = _2141 + 0.5;
    float _2151 = _1284 * _1362;
    float _2153 = fma(_2007, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2133);
    float _2155 = fma(_2007, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2135);
    float _2157 = fma(_2007, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2137);
    out.m_75.x = _2143;
    out.m_75.y = _2149;
    float _2159 = -_1270;
    float _2161 = fma(_2159, _1314, _2151);
    float _2163 = _1304 * _1362;
    float _2165 = _2103;
    float _2167 = _2105;
    float _2169 = _2107;
    if (!_2129)
    {
        float _2171 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2103);
        _2165 = _2171;
    }
    float _2173 = _2165;
    if (!_2129)
    {
        float _2175 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2105);
        _2167 = _2175;
    }
    float _2177 = _2167;
    float _2179 = _1284 * _1338;
    float _2181 = _1290 * _1338;
    if (!_2129)
    {
        float _2183 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2107);
        _2169 = _2183;
    }
    float _2185 = _2169;
    float _2187 = _1284 * _1332;
    float _2189 = -_1270;
    float _2191 = fma(_2189, _1312, _2179);
    float _2193 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2195 = fma(_1278, _1312, _2181);
    float _2197 = fma(_1286, _1312, _2145);
    float _2199 = fma(_1278, _1314, _2147);
    float _2201 = fma(_1282, _1204, _2161);
    float _2203 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2205 = _1290 * _1332;
    float _2207 = -_1270;
    float _2209 = fma(_2207, _1318, _2187);
    float _2211 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2193);
    float _2213 = _2155 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2215 = _2157 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2217 = fma(_1300, _1188, _2195);
    float _2219 = fma(_1286, _1314, _2163);
    float _2221 = fma(_1282, _1188, _2191);
    float _2223 = fma(_1300, _1204, _2199);
    float _2225 = _2201 * _2177;
    float _2227 = _1304 * _1332;
    float _2229 = fma(_1278, _1318, _2205);
    float _2231 = fma(_1282, _1184, _2209);
    float _2233 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2211);
    float _2235 = _2213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2237 = _2203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2239 = _2215 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2241 = fma(_1292, _1204, _2219);
    float _2243 = _2221 * _2177;
    float _2245 = fma(_2223, _2173, _2225);
    float _2247 = fma(_1286, _1318, _2227);
    float _2249 = fma(_1300, _1184, _2229);
    float _2251 = _2231 * _2177;
    float _2253 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2233);
    out.m_77.x = _2235;
    out.m_77.y = _2237;
    out.m_77.z = _2239;
    float _2255 = fma(_2217, _2173, _2243);
    float _2257 = fma(_2241, _2185, _2245);
    float _2259 = fma(_1292, _1184, _2247);
    float _2261 = fma(_2249, _2173, _2251);
    float _2263 = _2253 + _1886;
    bool _2265 = _1760 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2267 = isnan(_1760);
    bool _2269 = _2265 || _2267;
    bool _2271 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2273 = _2269 || _2271;
    out.gl_Position.x = _1910;
    out.gl_Position.y = _1920;
    out.gl_Position.z = _2253;
    out.gl_Position.w = _1886;
    float _2275 = fma(_1292, _1188, _2197);
    float _2277 = _2263 * 0.5;
    float _2279 = fma(_2275, _2185, _2255);
    float _2281 = fma(_2259, _2185, _2261);
    float _2283 = _2255;
    float _2285 = _2263;
    if (!_2273)
    {
        _2283 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2287 = _2283;
    float _2289 = _2287;
    float _2291 = _2287;
    if (!_2273)
    {
        _2071 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2293 = _2071;
    out.m_79.z = _2277;
    out.m_79.w = _1886;
    float _2295 = _2293;
    float _2297 = _2293;
    if (!_2273)
    {
        _2073 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2299 = _2073;
    float _2301 = _2299;
    float _2303 = _2299;
    if (!_2273)
    {
        _2075 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2305 = _2075;
    out.m_81.x = _2279;
    out.m_81.y = _2257;
    out.m_81.z = _2281;
    float _2307 = _2305;
    float _2309 = _2305;
    if (!_2273)
    {
        _2285 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2311 = _2285;
    float _2313 = _2081 * _1944;
    float _2315 = -_2081;
    float _2317 = _2315 + 1.0;
    float _2319 = _1955 * _2313;
    float _2321 = _1965 * _2313;
    float _2323 = _1955 * _2317;
    float _2325 = fma(_1961, _2319, _1949);
    float _2327 = fma(_1963, _2319, _1951);
    float _2329 = fma(_1955, _2321, _1953);
    float _2331 = _2319;
    float _2333 = _2311;
    float _2335 = _2311;
    if (!_2273)
    {
        _2331 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2337 = _2331;
    out.m_83.x = _2325;
    out.m_83.y = _2327;
    out.m_83.z = _2329;
    out.m_83.w = _2323;
    bool _2339 = !_2273;
    float _2341 = _2337;
    float _2343 = _2337;
    if (!_2339)
    {
        bool _2345 = _1760 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2347 = isnan(_1760);
        bool _2349 = _2345 || _2347;
        bool _2351 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2353 = _2349 || _2351;
        if (!_2353)
        {
            float _2355 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2357 = _1760 + _2355;
            float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2361 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2359;
            float _2363 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2365 = _2363 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2367 = 1.0 / _2361;
            float _2369 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2371 = _2369 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2375 = _2373 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2379 = _2377 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2385 = _2357 * _2367;
            float _2387 = precise::clamp(_2385, 0.0, 1.0);
            float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2393 = fma(_2387, _2365, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2395 = fma(_2387, _2391, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2397 = fma(_2387, _2371, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2399 = fma(_2387, _2375, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2401 = fma(_2387, _2379, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2403 = fma(_2387, _2383, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2303 = _2397;
            _2335 = _2401;
            _2297 = _2393;
            _2291 = _2399;
            _2309 = _2395;
            _2343 = _2403;
            _2405 = true;
        }
        else
        {
            bool _2407 = _1760 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2409 = isnan(_1760);
            bool _2411 = _2407 || _2409;
            bool _2413 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2415 = _2411 || _2413;
            if (!_2415)
            {
                _2295 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2417 = _2295;
            _2297 = _2417;
            if (!_2415)
            {
                _2301 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2419 = _2301;
            _2303 = _2419;
            if (!_2415)
            {
                _2307 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2421 = _2307;
            _2309 = _2421;
            if (!_2415)
            {
                _2289 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2423 = _2289;
            _2291 = _2423;
            if (!_2415)
            {
                _2333 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2425 = _2333;
            _2335 = _2425;
            if (!_2415)
            {
                _2341 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2427 = _2341;
            bool _2429 = !_2415;
            _2343 = _2427;
            if (!_2429)
            {
                bool _2431 = _1760 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2433 = isnan(_1760);
                bool _2435 = _2431 || _2433;
                bool _2437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2439 = _2435 || _2437;
                if (!_2439)
                {
                    float _2441 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2443 = _1760 + _2441;
                    float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2447 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2445;
                    float _2449 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2453 = 1.0 / _2447;
                    float _2455 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2457 = _2455 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2461 = _2459 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2465 = _2463 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2469 = _2467 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2471 = _2443 * _2453;
                    float _2473 = precise::clamp(_2471, 0.0, 1.0);
                    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2477 = _2475 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2479 = fma(_2473, _2451, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2481 = fma(_2473, _2477, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2483 = fma(_2473, _2457, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2485 = fma(_2473, _2461, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2487 = fma(_2473, _2465, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2489 = fma(_2473, _2469, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2303 = _2483;
                    _2335 = _2487;
                    _2297 = _2479;
                    _2291 = _2485;
                    _2309 = _2481;
                    _2343 = _2489;
                    _2405 = true;
                }
                else
                {
                    _2303 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2335 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2297 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2291 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2309 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2343 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2405 = false;
    float _2491 = _2303;
    float _2493 = _2335;
    float _2495 = _2297;
    float _2497 = _2291;
    float _2499 = _2309;
    float _2501 = _2343;
    float _2503 = fma(_2257, -0.5, 0.5);
    float _2505 = precise::clamp(_2503, 0.0, 1.0);
    float _2507 = -_2491;
    float _2509 = _2507 + _2493;
    float _2511 = -_2495;
    float _2513 = _2511 + _2497;
    float _2515 = -_2499;
    float _2517 = _2515 + _2501;
    bool _2519 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2521 = fma(_2505, _2509, _2491);
    float _2523 = fma(_2505, _2513, _2495);
    float _2525 = fma(_2505, _2517, _2499);
    float _2527 = _2521 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _2529 = fma(_2523, 0.298911988735198974609375, _2527);
    float _2531 = fma(_2525, 0.114477999508380889892578125, _2529);
    float _2533 = -_2531;
    float _2535 = _2523 + _2533;
    float _2537 = -_2531;
    float _2539 = _2521 + _2537;
    float _2541 = -_2531;
    float _2543 = _2525 + _2541;
    float _2545 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2547 = fma(_2535, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2531);
    float _2549 = fma(_2539, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2531);
    float _2551 = fma(_2543, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2531);
    out.m_47.x = _2545;
    out.m_87.x = _2547;
    out.m_87.y = _2549;
    out.m_87.z = _2551;
    if (!_2519)
    {
        return out;
    }
    float _2553 = -_1640;
    float _2555 = _2553 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2557 = -_1642;
    float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2561 = -_1644;
    float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2565 = _2555 * _2555;
    float _2567 = fma(_2559, _2559, _2565);
    float _2569 = fma(_2563, _2563, _2567);
    float _2571 = sqrt(_2569);
    float _2573 = rsqrt(_2569);
    float _2575 = -_2571;
    float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2579 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2581 = precise::clamp(_2579, 0.0, 1.0);
    float _2583 = _2559 * _2573;
    float _2585 = _2555 * _2573;
    float _2587 = abs(_2581);
    float _2589 = log2(_2587);
    float _2591 = _2563 * _2573;
    float _2593 = _2583 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2595 = _2257 * _2585;
    float _2597 = -_2585;
    float _2599 = -_2593;
    float _2601 = fma(_2597, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2599);
    float _2603 = fma(_2279, _2583, _2595);
    float _2605 = -_2591;
    float _2607 = fma(_2605, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2601);
    float _2609 = fma(_2281, _2591, _2603);
    float _2611 = precise::clamp(_2609, 0.0, 1.0);
    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2615 = _2607 + _2613;
    float _2617 = _2589 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2619 = _2615 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2621 = precise::clamp(_2619, 0.0, 1.0);
    float _2623 = exp2(_2617);
    float _2625 = _2623 * _2621;
    float _2627 = _2611 * _2625;
    float _2629 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2631 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2633 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2629;
    out.m_85.y = _2631;
    out.m_85.z = _2633;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2405 = false;
    bool _826 = false;
    bool _690 = false;
    bool _362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2690 = as_type<float>(_122);
        out.gl_Position.z = _2690;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_49.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = _140;
    if (_136)
    {
        float _144 = float(_106);
        _116 = _144;
    }
    float _146 = _116;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2760 = as_type<float>(_160);
        out.gl_Position.z = _2760;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = in.m_51.x;
    float _166 = _140 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    float _182 = in.m_57.x;
    float _184 = in.m_57.y;
    float _186 = in.m_57.z;
    float _188 = _166 * _162;
    float _190 = _140 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _192 = _190 * _174;
    float _194 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[20].x, _188);
    float _196 = in.m_59.x;
    float _198 = in.m_59.y;
    float _200 = in.m_59.z;
    float _202 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[20].y, _192);
    float _204 = floor(_194);
    int _206 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _208 = _206 != 0;
    float _210 = _194 * 6.283185482025146484375;
    float _212 = floor(_202);
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _216 = _214 != 0;
    int _218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _220 = _218 != 0;
    float _222 = _210 * 0.15915493667125701904296875;
    float _224 = _170 * _184;
    bool _226 = !_216;
    int _228 = _226 ? 0 : 1;
    float _230 = fma(_168, _182, _224);
    float _232 = -_204;
    float _234 = _194 + _232;
    float _236 = _170 * _178;
    int _238 = abs(_228);
    float _240 = fma(_168, _176, _236);
    float _242 = _170 * _198;
    bool _244 = !_208;
    int _246 = _244 ? 0 : 1;
    float _248 = -_212;
    float _250 = _202 + _248;
    float _252 = _202 * 6.283185482025146484375;
    float _254 = _222 * 6.283185482025146484375;
    float _256 = cos(_254);
    float _258 = float(_238);
    float _260 = fma(_168, _196, _242);
    float _262 = _252 * 0.15915493667125701904296875;
    float _264 = -_234;
    float _266 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _268 = abs(_246);
    float _270 = fma(_172, _180, _240);
    float _272 = abs(_266);
    float _274 = _258 * _272;
    float _276 = _262 * 6.283185482025146484375;
    float _278 = cos(_276);
    float _280 = -_250;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _284 = _234 < 0.5;
    float _286 = float(_284);
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _290 = abs(_282);
    float _292 = _258 * _290;
    bool _294 = !_220;
    int _296 = _294 ? 0 : 1;
    float _298 = fma(_256, 0.5, 0.5);
    bool _300 = _250 < 0.5;
    float _302 = float(_300);
    int _304 = abs(_296);
    float _306 = float(_268);
    float _308 = -_286;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _312 = -_298;
    float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _316 = -_302;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _320 = fma(_278, 0.5, 0.5);
    float _322 = fma(_306, _314, _274);
    float _324 = float(_304);
    float _326 = -_320;
    float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _330 = fma(_306, _328, _292);
    float _332 = fma(_172, _186, _230);
    float _334 = abs(_310);
    float _336 = fma(_324, _334, _322);
    float _338 = fma(_172, _200, _260);
    float _340 = abs(_318);
    float _342 = fma(_324, _340, _330);
    bool _344 = !_288;
    float _360;
    if (!_344)
    {
        float _346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _348 = _164 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _352 = _350 * _346;
        float _354 = floor(_352);
        float _356 = -_354;
        float _358 = _352 + _356;
        _360 = _358;
        _362 = true;
    }
    else
    {
        float _364 = float(_106);
        float _366 = 1.0 / _364;
        float _368 = _140 * _366;
        _360 = _368;
    }
    _362 = false;
    float _370 = _360;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _374 = _370 + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _392 = 1.0 / _378;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _394;
    float _398 = 1.0 / _390;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _402 = _370 + _400;
    bool _404 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _406 = isnan(_370);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    bool _416 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _418 = isnan(_370);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = 1.0 / _382;
    float _430 = _402 * _392;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _434 = _370 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _438 = _370 + _436;
    bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _442 = 1.0 / _396;
    float _444 = _434 * _398;
    bool _446 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _448 = isnan(_370);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _458;
    float _462 = fma(_460, _430, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _464 = 1.0 / _386;
    float _466 = _374 * _428;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _470 = _370 + _468;
    float _472 = -_456;
    float _474 = _472 + 1.0;
    float _476 = _470 * _442;
    bool _478 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _480 = isnan(_370);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    bool _490 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _492 = isnan(_370);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = _488 * _474;
    float _504 = -_488;
    float _506 = _504 + 1.0;
    float _508 = _438 * _464;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _514;
    float _518 = _500 * _506;
    float _520 = -_500;
    float _522 = _520 + 1.0;
    float _524 = fma(_512, _430, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _526 = fma(_516, _430, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _528 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _530 = isnan(_370);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = _414 * _522;
    float _542 = -_414;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _554 = -_538;
    float _556 = _554 + 1.0;
    float _558 = _538 * _544;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _564 = fma(_548, _466, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _566 = _426 * _556;
    float _568 = fma(_562, _466, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _570 = fma(_552, _466, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _572 = _526 * _566;
    float _574 = _524 * _566;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _576;
    float _580 = _462 * _566;
    float _582 = -_426;
    float _584 = _582 + 1.0;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _590;
    float _594 = fma(_578, _508, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _596 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[143].x, _574);
    float _598 = fma(_588, _508, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _600 = fma(_592, _508, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _602 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[143].y, _580);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _608 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[143].z, _572);
    float _610 = fma(_564, _558, _596);
    float _612 = fma(_568, _558, _602);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _618 = fma(_570, _558, _608);
    float _620 = fma(_594, _540, _610);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _626 = fma(_600, _540, _618);
    float _628 = fma(_606, _444, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _630 = fma(_616, _444, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _632 = fma(_598, _540, _612);
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _634;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _638;
    float _642 = fma(_624, _444, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _644;
    float _648 = fma(_636, _476, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _650 = fma(_640, _476, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _652 = fma(_628, _518, _620);
    float _654 = fma(_646, _476, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _656 = fma(_630, _518, _632);
    float _658 = fma(_642, _518, _626);
    float _660 = fma(_648, _502, _652);
    float _662 = fma(_650, _502, _656);
    float _664 = fma(_654, _502, _658);
    float _666 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[148].x, _660);
    float _668 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[148].y, _662);
    float _670 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[148].z, _664);
    bool _672 = !_440;
    float _688;
    if (!_672)
    {
        float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _676 = _164 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _678 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[11].x, _140);
        float _680 = _678 * _674;
        float _682 = floor(_680);
        float _684 = -_682;
        float _686 = _680 + _684;
        _688 = _686;
        _690 = true;
    }
    else
    {
        float _692 = float(_106);
        float _694 = 1.0 / _692;
        float _696 = _140 * _694;
        _688 = _696;
    }
    _690 = false;
    float _698 = _688;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _702 = _698 + _700;
    float _704 = in.m_61.x;
    float _706 = in.m_61.y;
    bool _708 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _710 = isnan(_698);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _720;
    bool _724 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _726 = isnan(_698);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = -_718;
    float _738 = _736 + 1.0;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _740;
    float _744 = 1.0 / _722;
    bool _746 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _748 = _734 * _738;
    float _750 = -_734;
    float _752 = _750 + 1.0;
    float _754 = _702 * _744;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _756;
    float _760 = _668 * _706;
    float _762 = fma(_742, _754, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _764;
    float _768 = fma(_758, _754, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _770 = fma(_766, _754, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _772 = _762 * _748;
    float _774 = _770 * _748;
    float _776 = _768 * _748;
    float _778 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[107].x, _772);
    float _780 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[107].y, _774);
    float _782 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[107].z, _776);
    float _784 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[108].x, _778);
    float _786 = in.m_61.z;
    float _788 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[108].y, _780);
    float _790 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[108].z, _782);
    float _792 = _784 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _794 = _666 * _704;
    float _796 = _788 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _798 = _790 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _800 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _802 = _796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = _798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _800;
    out.m_63.y = _802;
    out.m_63.z = _804;
    float _806 = _670 * _786;
    bool _808 = !_746;
    float _824;
    if (!_808)
    {
        float _810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _812 = _164 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _814 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[11].z, _140);
        float _816 = _814 * _810;
        float _818 = floor(_816);
        float _820 = -_818;
        float _822 = _816 + _820;
        _824 = _822;
        _826 = true;
    }
    else
    {
        float _828 = float(_106);
        float _830 = 1.0 / _828;
        float _832 = _140 * _830;
        _824 = _832;
    }
    _826 = false;
    float _834 = _824;
    float _836 = in.m_44.x;
    float _838 = in.m_44.y;
    float _840 = in.m_44.z;
    float _842 = _164 * 2.0;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _850 = _848 != 0;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _854 = _852 != 0;
    float _856 = _342 * _760;
    float _858 = in.m_51.z;
    float _860 = _336 * _794;
    float _862 = floor(_842);
    float _864 = in.m_51.y;
    float _866 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _868 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _870 = in.m_57.w;
    float _872 = in.m_59.w;
    float _874 = in.m_55.w;
    bool _876 = _862 > 0.0;
    float _878 = _178 * _838;
    float _880 = _184 * _838;
    float _882 = _198 * _838;
    float _884 = fma(_176, _836, _878);
    float _886 = _858 * 2.0;
    float _888 = fma(_182, _836, _880);
    float _890 = _164 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _896 = _864 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _898 = fma(_196, _836, _882);
    float _900 = floor(_886);
    float _902 = _864 + _858;
    float _904 = -_892;
    float _906 = fma(_890, 2.0, _904);
    float _908 = fma(_896, -2.0, _894);
    float _910 = _902 + (-1.0);
    float _912 = _864 * 2.0;
    bool _914 = _862 >= 0.0;
    bool _916 = isnan(_862);
    bool _918 = _914 || _916;
    bool _920 = isnan(0.0);
    bool _922 = _918 || _920;
    float _924 = fma(_180, _840, _884);
    float _926 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _928 = floor(_912);
    int _930 = _922 ? 0 : 1;
    float _932 = fma(_200, _840, _898);
    float _934 = fma(_186, _840, _888);
    float _936 = _924 + _874;
    bool _938 = _900 > 0.0;
    float _940 = _932 + _872;
    float _942 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _944 = log2(_942);
    bool _946 = !_850;
    int _948 = _946 ? 0 : 1;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _952 = ~_930;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    float _958 = -_140;
    float _960 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[76].x, _906);
    bool _962 = _900 >= 0.0;
    bool _964 = isnan(_900);
    bool _966 = _962 || _964;
    bool _968 = isnan(0.0);
    bool _970 = _966 || _968;
    float _972 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[78].z, _950);
    int _974 = abs(_948);
    float _976 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _908);
    int _978 = _956;
    if (!_876)
    {
        int _980 = ~_930;
        int _982 = _980 + 1;
        _978 = _982;
    }
    int _984 = _978;
    float _986 = _934 + _870;
    int _988 = _970 ? 0 : 1;
    float _990 = _864 + (-0.5);
    float _992 = float(_974);
    float _994 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _972);
    float _996 = float(_984);
    float _998 = _944 * _140;
    int _1000 = ~_988;
    int _1002 = _1000 + 1;
    int _1004 = _1002 + 1;
    int _1006 = _1004;
    if (!_938)
    {
        int _1008 = ~_988;
        int _1010 = _1008 + 1;
        _1006 = _1010;
    }
    int _1012 = _1006;
    float _1014 = _992 * _996;
    float _1016 = in.m_65.x;
    float _1018 = in.m_65.y;
    float _1020 = in.m_65.z;
    float _1022 = exp2(_998);
    bool _1024 = _928 > 0.0;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1028 = _928 >= 0.0;
    bool _1030 = isnan(_928);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan(0.0);
    bool _1036 = _1032 || _1034;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1040 = 1.0 + _1038;
    bool _1042 = !_846;
    int _1044 = _1042 ? 0 : 1;
    float _1046 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1026);
    bool _1048 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1050 = isnan(1.0);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1056 = _1052 || _1054;
    int _1058 = abs(_1044);
    float _1060 = 1.0 / _1040;
    float _1062 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1046);
    int _1064 = _1036 ? 0 : 1;
    float _1066 = -_1022;
    float _1068 = _1066 + 1.0;
    float _1070 = float(_1012);
    float _1072 = _1014 * (-2.0);
    float _1074 = float(_1058);
    bool _1076 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1078 = isnan(0.0);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1084 = _1080 || _1082;
    float _1086 = fma(_1072, _1018, _1018);
    int _1088 = ~_1064;
    int _1090 = _1088 + 1;
    int _1092 = _1090 + 1;
    int _1094 = _1092;
    if (!_1024)
    {
        int _1096 = ~_1064;
        int _1098 = _1096 + 1;
        _1094 = _1098;
    }
    int _1100 = _1094;
    float _1102 = _1074 * _1070;
    float _1104 = _1084 ? _1068 : 0.0;
    float _1106 = fma(_926, _1072, _926);
    float _1108 = -_986;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1112 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1086);
    float _1114 = -_936;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    if (_1056)
    {
        float _1118 = _1104 * _1060;
        _142 = _1118;
    }
    float _1120 = _142;
    float _1122 = _1110 * _1110;
    bool _1124 = !_854;
    int _1126 = _1124 ? 0 : 1;
    float _1128 = -_940;
    float _1130 = _1128 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1132 = fma(_1106, _1120, _1112);
    float _1134 = fma(_1116, _1116, _1122);
    int _1136 = abs(_1126);
    float _1138 = _164 + _864;
    float _1140 = fma(_1130, _1130, _1134);
    float _1142 = _1102 * (-2.0);
    float _1144 = _1138 + (-1.0);
    float _1146 = float(_1136);
    float _1148 = _1132 * 0.15915493667125701904296875;
    float _1150 = float(_1100);
    float _1152 = rsqrt(_1140);
    float _1154 = fma(_1142, _1016, _1016);
    float _1156 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1158 = _164 + _858;
    float _1160 = _1146 * _1150;
    float _1162 = _164 + (-0.5);
    float _1164 = fma(_1156, _1142, _1156);
    float _1166 = _1158 + (-1.0);
    float _1168 = _1160 * (-2.0);
    float _1170 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1154);
    float _1172 = _858 + (-0.5);
    float _1174 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1176 = fma(_1168, _1020, _1020);
    float _1178 = fma(_1164, _1120, _1170);
    float _1180 = _1148 * 6.283185482025146484375;
    float _1182 = sin(_1180);
    float _1184 = _1130 * _1152;
    float _1186 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1176);
    float _1188 = _1116 * _1152;
    float _1190 = _1178 * 0.15915493667125701904296875;
    float _1192 = fma(_1174, _1168, _1174);
    float _1194 = in.m_67.x;
    float _1196 = in.m_67.y;
    float _1198 = in.m_67.z;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1202 = _1188 * _1200;
    float _1204 = _1110 * _1152;
    float _1206 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1208 = _1184 * _1206;
    float _1210 = fma(_1192, _1120, _1186);
    float _1212 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1214 = -_1202;
    float _1216 = fma(_1184, _1212, _1214);
    float _1218 = _1148 * 6.283185482025146484375;
    float _1220 = cos(_1218);
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1224 = _1204 * _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1228 = -_1208;
    float _1230 = fma(_1204, _1226, _1228);
    float _1232 = _1216 * _1216;
    float _1234 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1238 = -_1224;
    float _1240 = fma(_1188, _1236, _1238);
    float _1242 = _1190 * 6.283185482025146484375;
    float _1244 = sin(_1242);
    float _1246 = _1210 * 0.15915493667125701904296875;
    float _1248 = _1190 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1198);
    float _1254 = _1234 * _1252;
    float _1256 = _1246 * 6.283185482025146484375;
    float _1258 = cos(_1256);
    float _1260 = fma(_1230, _1230, _1232);
    float _1262 = _1244 * _1220;
    float _1264 = fma(_1240, _1240, _1260);
    float _1266 = _1244 * _1182;
    float _1268 = _1246 * 6.283185482025146484375;
    float _1270 = sin(_1268);
    float _1272 = _1250 * _1220;
    float _1274 = _1250 * _1182;
    float _1276 = rsqrt(_1264);
    float _1278 = _1220 * _1258;
    float _1280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1196);
    float _1282 = _1244 * _1258;
    float _1284 = _1250 * _1258;
    float _1286 = _1182 * _1258;
    float _1288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1194);
    float _1290 = fma(_1270, _1272, _1266);
    float _1292 = fma(_1270, _1266, _1272);
    float _1294 = _866 * _1280;
    float _1296 = _868 * _1288;
    float _1298 = -_1274;
    float _1300 = fma(_1270, _1262, _1298);
    float _1302 = -_1262;
    float _1304 = fma(_1270, _1274, _1302);
    float _1306 = _1284 * _1294;
    float _1308 = -_1294;
    float _1310 = _1270 * _1308;
    float _1312 = _1230 * _1276;
    float _1314 = _1216 * _1276;
    float _1316 = fma(_1290, _1296, _1306);
    float _1318 = _1240 * _1276;
    float _1320 = _1204 * _1312;
    float _1322 = fma(_1278, _1296, _1310);
    float _1324 = _1184 * _1314;
    float _1326 = _1282 * _1294;
    float _1328 = fma(_1304, _1254, _1316);
    float _1330 = -_1320;
    float _1332 = fma(_1188, _1314, _1330);
    float _1334 = fma(_1286, _1254, _1322);
    float _1336 = -_1324;
    float _1338 = fma(_1204, _1318, _1336);
    float _1340 = fma(_1300, _1296, _1326);
    float _1342 = _1332 * _1328;
    float _1344 = _1338 * _1328;
    float _1346 = fma(_1292, _1254, _1340);
    float _1348 = fma(_1318, _1334, _1342);
    float _1350 = fma(_1312, _1334, _1344);
    float _1352 = fma(_1184, _1346, _1348);
    float _1354 = _1188 * _1318;
    float _1356 = fma(_1188, _1346, _1350);
    float _1358 = _940 + _1352;
    float _1360 = -_1354;
    float _1362 = fma(_1184, _1312, _1360);
    float _1364 = _936 + _1356;
    float _1366 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1368 = _1358 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1372 = _1364 + _1370;
    float _1374 = _1368 * _1368;
    float _1376 = fma(_1372, _1372, _1374);
    float _1378 = _1362 * _1328;
    float _1380 = sqrt(_1376);
    float _1382 = fma(_1314, _1334, _1378);
    float _1384 = fma(_1204, _1346, _1382);
    float _1386 = _986 + _1384;
    bool _1388 = _1380 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1390 = _1384;
    float _1392 = _1328;
    float _1394 = _1334;
    float _1396 = _1368;
    if (!_1388)
    {
        _1390 = _1364;
    }
    float _1398 = _1390;
    float _1400 = _1398;
    if (!_1388)
    {
        _1392 = _1358;
    }
    float _1402 = _1392;
    float _1404 = _1402;
    if (!_1388)
    {
        _1394 = _1386;
    }
    float _1406 = _1394;
    bool _1408 = !_1388;
    float _1410 = _1406;
    if (!_1408)
    {
        float _1412 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1414 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1416 = _1380 + _1414;
        float _1418 = _1386 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1420 = rsqrt(_1376);
        float _1422 = _1416 * _1412;
        float _1424 = _1422 * 0.15915493667125701904296875;
        float _1426 = _1424 * 6.283185482025146484375;
        float _1428 = cos(_1426);
        float _1430 = _1424 * 6.283185482025146484375;
        float _1432 = sin(_1430);
        float _1434 = _1428 + (-1.0);
        float _1436 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1438 = fma(_1432, _1418, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1440 = fma(_1386, _1428, _1436);
        float _1442 = _1420 * _1438;
        float _1444 = fma(_1372, _1442, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1446 = fma(_1368, _1442, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1410 = _1440;
        _1400 = _1444;
        _1404 = _1446;
    }
    float _1448 = _1410;
    float _1450 = _1400;
    float _1452 = _1404;
    float _1454 = -_986;
    float _1456 = _1454 + _1448;
    float _1458 = -_936;
    float _1460 = _1458 + _1450;
    float _1462 = -_940;
    float _1464 = _1462 + _1452;
    float _1466 = _1456 * _1456;
    bool _1468 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1470 = isnan(0.5);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1476 = _1472 || _1474;
    float _1478 = fma(_1460, _1460, _1466);
    float _1480 = fma(_1464, _1464, _1478);
    float _1482 = sqrt(_1480);
    bool _1484 = _1482 > 0.0;
    float _1486 = _1482;
    float _1488 = _1448;
    float _1490 = _1452;
    float _1492 = _1456;
    float _1494 = _1464;
    float _1496 = _1460;
    float _1498 = _1480;
    float _1500 = _1450;
    if (!_1484)
    {
        _1486 = _1450;
    }
    float _1502 = _1486;
    bool _1504 = !_1484;
    float _1506 = _1502;
    if (!_1504)
    {
        float _1508 = _332 * _332;
        float _1510 = fma(_270, _270, _1508);
        float _1512 = fma(_338, _338, _1510);
        float _1514 = rsqrt(_1480);
        float _1516 = sqrt(_1512);
        float _1518 = _1460 * _1514;
        float _1520 = _1464 * _1514;
        bool _1522 = _1516 > 0.0;
        float _1524 = _1456 * _1514;
        float _1526 = _1514;
        _1396 = _1512;
        if (!_1522)
        {
            _1526 = _1450;
        }
        float _1528 = _1526;
        bool _1530 = !_1522;
        _1506 = _1528;
        if (!_1530)
        {
            float _1532 = rsqrt(_1512);
            float _1534 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1536 = _332 * _1532;
            float _1538 = _270 * _1532;
            float _1540 = _338 * _1532;
            float _1542 = _1524 * _1536;
            float _1544 = fma(_1518, _1538, _1542);
            float _1546 = _1534 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1548 = fma(_1520, _1540, _1544);
            float _1550 = _1548 * _1546;
            float _1552 = fma(_270, _1550, _1450);
            float _1554 = fma(_332, _1550, _1448);
            float _1556 = fma(_338, _1550, _1452);
            _1488 = _1554;
            _1490 = _1556;
            _1506 = _1552;
            _1492 = _1536;
            _1494 = _1550;
            _1496 = _1544;
            _1498 = _1542;
        }
    }
    float _1558 = _1488;
    float _1560 = _1490;
    float _1562 = _1506;
    float _1564 = _1396;
    float _1566 = _1492;
    float _1568 = _1494;
    float _1570 = _1496;
    float _1572 = _1498;
    float _1574 = _1564;
    float _1576 = _1562;
    float _1578 = _1568;
    float _1580 = _1572;
    if (_1476)
    {
        _1574 = _1558;
    }
    float _1582 = _1574;
    float _1584 = _1582;
    if (_1476)
    {
        _1500 = _1560;
    }
    float _1586 = _1500;
    float _1588 = _1586;
    if (!_1476)
    {
        float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1592 = _986 + _1590;
        float _1594 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1596 = _936 + _1594;
        float _1598 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1600 = _1592 * _1592;
        float _1602 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1604 = _940 + _1602;
        float _1606 = fma(_1596, _1596, _1600);
        float _1608 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1610 = fma(_1604, _1604, _1606);
        float _1612 = sqrt(_1610);
        float _1614 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1616 = precise::min(_1612, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1618 = _1616 * _1608;
        float _1620 = -_936;
        float _1622 = _1620 + _1562;
        float _1624 = _1614 * _1618;
        float _1626 = -_986;
        float _1628 = _1626 + _1558;
        float _1630 = -_940;
        float _1632 = _1630 + _1560;
        float _1634 = fma(_1622, _1624, _936);
        float _1636 = fma(_1628, _1624, _986);
        float _1638 = fma(_1632, _1624, _940);
        _1584 = _1636;
        _1576 = _1634;
        _1588 = _1638;
    }
    float _1640 = _1584;
    float _1642 = _1576;
    float _1644 = _1588;
    float _1646 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1648 = _1640 + _1646;
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1652 = _1642 + _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1656 = _1644 + _1654;
    float _1658 = _1648 * _1648;
    float _1660 = fma(_1652, _1652, _1658);
    float _1662 = fma(_1656, _1656, _1660);
    float _1664 = rsqrt(_1662);
    float _1666 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1668 = _1652 * _1666;
    float _1670 = _1656 * _1666;
    float _1672 = _1668 * _1668;
    float _1674 = _1670 * _1670;
    float _1676 = _1672 + _1674;
    float _1678 = sqrt(_1676);
    bool _1680 = _1678 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1684 = _1678 + _1682;
    float _1686 = _1560;
    float _1688 = _1684;
    float _1690 = _1668;
    float _1692 = _1670;
    float _1694 = _1672;
    float _1696 = _1674;
    if (_1680)
    {
        float _1698 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1686 = _1698;
    }
    float _1700 = _1686;
    if (_1680)
    {
        float _1702 = _1684 * _1700;
        _1688 = _1702;
    }
    float _1704 = _1688;
    if (_1680)
    {
        float _1706 = _1704 * 0.15915493667125701904296875;
        _1578 = _1706;
    }
    float _1708 = _1578;
    float _1710 = _1566;
    if (_1680)
    {
        float _1712 = _1708 * 6.283185482025146484375;
        float _1714 = sin(_1712);
        _1710 = _1714;
    }
    float _1716 = _1710;
    float _1718 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1720 = precise::max(0.0, _1718);
    float _1722 = _1570;
    float _1724 = _1720;
    if (_1680)
    {
        float _1726 = _1708 * 6.283185482025146484375;
        float _1728 = cos(_1726);
        _1722 = _1728;
    }
    float _1730 = _1722;
    float _1732 = -_1666;
    float _1734 = -_1720;
    float _1736 = fma(_1648, _1732, _1734);
    float _1738 = _1718;
    if (_1680)
    {
        float _1740 = rsqrt(_1676);
        _1738 = _1740;
    }
    float _1742 = _1738;
    if (_1680)
    {
        float _1744 = _1736 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1724 = _1744;
    }
    float _1746 = _1724;
    float _1748 = _1746;
    float _1750 = _1716;
    if (_1680)
    {
        float _1752 = fma(_1716, _1746, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1580 = _1752;
    }
    float _1754 = _1580;
    if (_1680)
    {
        float _1756 = _1730 + (-1.0);
        _1748 = _1756;
    }
    float _1758 = _1748;
    float _1760 = sqrt(_1662);
    float _1762 = _1758;
    if (_1680)
    {
        float _1764 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1762 = _1764;
    }
    float _1766 = _1762;
    float _1768 = _1742;
    if (_1680)
    {
        float _1770 = _1742 * _1754;
        _1750 = _1770;
    }
    float _1772 = _1750;
    if (!_1680)
    {
        _1768 = _1736;
    }
    float _1774 = _1768;
    float _1776 = _1774;
    if (_1680)
    {
        float _1778 = fma(_1736, _1730, _1766);
        _1776 = _1778;
    }
    float _1780 = _1776;
    if (_1680)
    {
        float _1782 = _1668 * _1772;
        _1690 = _1782;
    }
    float _1784 = _1690;
    if (_1680)
    {
        float _1786 = _1670 * _1772;
        _1692 = _1786;
    }
    float _1788 = _1692;
    float _1790 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1792 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_1680)
    {
        float _1794 = _1784 * _1784;
        _1694 = _1794;
    }
    float _1796 = _1694;
    if (_1680)
    {
        float _1798 = _1788 * _1788;
        _1696 = _1798;
    }
    float _1800 = _1696;
    float _1802 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1790);
    float _1804 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1806 = fma(_1780, _1780, _1796);
    float _1808 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1810 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1802);
    float _1812 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1804);
    float _1814 = _1806 + _1800;
    float _1816 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1818 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1816);
    float _1820 = precise::clamp(_1818, 0.0, 1.0);
    float _1822 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1808);
    float _1824 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1812);
    float _1826 = _1810 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1828 = -_1820;
    float _1830 = _1828 + 1.0;
    float _1832 = rsqrt(_1814);
    float _1834 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1836 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1822);
    float _1838 = _1640 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1840 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1842 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1844 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1838);
    float _1846 = abs(_1830);
    float _1848 = log2(_1846);
    float _1850 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1852 = -_1840;
    float _1854 = fma(_1852, _1792, 1.0);
    float _1856 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1844);
    float _1858 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1860 = _1856 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1862 = _1832 * _1784;
    float _1864 = _1832 * _1780;
    float _1866 = _1832 * _1788;
    float _1868 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1850);
    float _1870 = _1862 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1872 = log2(_1854);
    float _1874 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1876 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1868);
    float _1878 = -_1870;
    float _1880 = fma(_1864, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1878);
    float _1882 = _1848 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1884 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1858);
    float _1886 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1876);
    float _1888 = -_1866;
    float _1890 = fma(_1888, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1880);
    float _1892 = exp2(_1882);
    float _1894 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1884);
    float _1896 = fma(_1890, -0.5, 0.5);
    float _1898 = fma(_1890, 0.5, 0.5);
    float _1900 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1874);
    float _1902 = 1.0 / _1886;
    float _1904 = _1864 + 1.0;
    float _1906 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1900);
    float _1908 = fma(_1898, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1910 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1906);
    float _1912 = fma(_1898, _1908, -0.212114393711090087890625);
    float _1914 = sqrt(_1896);
    float _1916 = -_1864;
    float _1918 = fma(_1892, _1904, _1916);
    float _1920 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1894);
    float _1922 = _1872 * 0.693147182464599609375;
    float _1924 = fma(_1898, _1912, 1.570728778839111328125);
    float _1926 = _1922 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1928 = _1910 * _1902;
    float _1930 = _1920 * _1902;
    float _1932 = fma(_1928, 0.5, 0.5);
    float _1934 = _1914 * 0.636619746685028076171875;
    float _1936 = fma(_1930, -0.5, 0.5);
    float _1938 = -_1924;
    float _1940 = fma(_1934, _1938, 1.0);
    float _1942 = fma(_1918, 0.5, 0.5);
    float3 _5514 = float3(_1932, _1936, _1926);
    float _1944 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5514, float3(0.0), isnan(_5514)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5514, float3(0.0), isnan(_5514)), level(0.0)).x;
    float3 _5525 = float3(_1932, _1936, _1926);
    float4 _1947 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5525, float3(0.0), isnan(_5525)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5525, float3(0.0), isnan(_5525)), level(0.0)).xyzw;
    float _1949 = _1947.x;
    float _1951 = _1947.y;
    float _1953 = _1947.z;
    float _1955 = _1947.w;
    float2 _5542 = float2(_1940, _1942);
    float3 _1959 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5542, float2(0.0), isnan(_5542)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5542, float2(0.0), isnan(_5542)), level(0.0)).xyz;
    float _1961 = _1959.x;
    float _1963 = _1959.y;
    float _1965 = _1959.z;
    float _1967 = in.m_69.x;
    float _1969 = in.m_69.y;
    float _1971 = _1848 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_71.x = _1642;
    out.m_71.y = _1640;
    out.m_71.z = _1644;
    bool _1973 = _164 > 0.5;
    float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1975;
    int _1979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1981 = _1979 != 0;
    float _1983 = exp2(_1971);
    int _1985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1987 = _1985 != 0;
    float _1989 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1991 = _834 + _1989;
    bool _1993 = _864 > 0.5;
    float _1995 = 1.0 / _1977;
    bool _1997 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1999 = isnan(_834);
    bool _2001 = _1997 || _1999;
    bool _2003 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2005 = _2001 || _2003;
    float _2007 = float(_2005);
    float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2009;
    bool _2013 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2015 = isnan(_834);
    bool _2017 = _2013 || _2015;
    bool _2019 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2021 = _2017 || _2019;
    float _2023 = float(_2021);
    float _2025 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2025;
    float _2029 = -_2007;
    float _2031 = _2029 + 1.0;
    float _2033 = _868 * _1967;
    float _2035 = _866 * _1969;
    float _2037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2039 = -_1983;
    float _2041 = _2039 + 1.0;
    float _2043 = -_2035;
    float _2045 = _2043 + 1.0;
    float _2047 = _1991 * _1995;
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2051 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2049;
    float _2053 = -_2033;
    float _2055 = _2053 + 1.0;
    float _2057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2059 = fma(_2011, _2047, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2061 = fma(_2051, _2047, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2063 = fma(_2027, _2047, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2065 = _2023 * _2031;
    float _2067 = _2033;
    float _2069 = _2035;
    float _2071 = _1886;
    float _2073 = _1910;
    float _2075 = _1920;
    if (_1981)
    {
        float _2077 = _1973 ? _2055 : _2033;
        _2067 = _2077;
    }
    float _2079 = _2067;
    float _2081 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_1987)
    {
        float _2083 = _1993 ? _2045 : _2035;
        _2069 = _2083;
    }
    float _2085 = _2069;
    float _2087 = _2037 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2089 = _2061 * _2065;
    float _2091 = _2059 * _2065;
    bool _2093 = _1196 != 0.0;
    bool _2095 = isnan(_1196);
    bool _2097 = _2093 || _2095;
    bool _2099 = isnan(0.0);
    bool _2101 = _2097 || _2099;
    float _2103 = in.m_73.x;
    float _2105 = in.m_73.y;
    float _2107 = in.m_73.z;
    float _2109 = _2063 * _2065;
    float _2111 = fma(_2087, _2079, -0.5);
    bool _2113 = _1194 == 0.0;
    bool _2115 = !_2101;
    bool _2117 = _2113 && _2115;
    float _2119 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2121 = -_2023;
    float _2123 = _2121 + 1.0;
    float _2125 = fma(_994, _2111, _960);
    bool _2127 = _1198 == 0.0;
    bool _2129 = _2127 && _2117;
    float _2131 = fma(_2119, _2085, -0.5);
    float _2133 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2091);
    float _2135 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2089);
    float _2137 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2109);
    float _2139 = -_976;
    float _2141 = fma(_1062, _2131, _2139);
    float _2143 = _2125 + 0.5;
    float _2145 = _1304 * _1338;
    float _2147 = _1290 * _1362;
    float _2149 = _2141 + 0.5;
    float _2151 = _1284 * _1362;
    float _2153 = fma(_2007, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2133);
    float _2155 = fma(_2007, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2135);
    float _2157 = fma(_2007, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2137);
    out.m_75.x = _2143;
    out.m_75.y = _2149;
    float _2159 = -_1270;
    float _2161 = fma(_2159, _1314, _2151);
    float _2163 = _1304 * _1362;
    float _2165 = _2103;
    float _2167 = _2105;
    float _2169 = _2107;
    if (!_2129)
    {
        float _2171 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2103);
        _2165 = _2171;
    }
    float _2173 = _2165;
    if (!_2129)
    {
        float _2175 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2105);
        _2167 = _2175;
    }
    float _2177 = _2167;
    float _2179 = _1284 * _1338;
    float _2181 = _1290 * _1338;
    if (!_2129)
    {
        float _2183 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2107);
        _2169 = _2183;
    }
    float _2185 = _2169;
    float _2187 = _1284 * _1332;
    float _2189 = -_1270;
    float _2191 = fma(_2189, _1312, _2179);
    float _2193 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2195 = fma(_1278, _1312, _2181);
    float _2197 = fma(_1286, _1312, _2145);
    float _2199 = fma(_1278, _1314, _2147);
    float _2201 = fma(_1282, _1204, _2161);
    float _2203 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2205 = _1290 * _1332;
    float _2207 = -_1270;
    float _2209 = fma(_2207, _1318, _2187);
    float _2211 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2193);
    float _2213 = _2155 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2215 = _2157 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2217 = fma(_1300, _1188, _2195);
    float _2219 = fma(_1286, _1314, _2163);
    float _2221 = fma(_1282, _1188, _2191);
    float _2223 = fma(_1300, _1204, _2199);
    float _2225 = _2201 * _2177;
    float _2227 = _1304 * _1332;
    float _2229 = fma(_1278, _1318, _2205);
    float _2231 = fma(_1282, _1184, _2209);
    float _2233 = fma(_1826, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2211);
    float _2235 = _2213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2237 = _2203 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2239 = _2215 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2241 = fma(_1292, _1204, _2219);
    float _2243 = _2221 * _2177;
    float _2245 = fma(_2223, _2173, _2225);
    float _2247 = fma(_1286, _1318, _2227);
    float _2249 = fma(_1300, _1184, _2229);
    float _2251 = _2231 * _2177;
    float _2253 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2233);
    out.m_77.x = _2235;
    out.m_77.y = _2237;
    out.m_77.z = _2239;
    float _2255 = fma(_2217, _2173, _2243);
    float _2257 = fma(_2241, _2185, _2245);
    float _2259 = fma(_1292, _1184, _2247);
    float _2261 = fma(_2249, _2173, _2251);
    float _2263 = _2253 + _1886;
    bool _2265 = _1760 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2267 = isnan(_1760);
    bool _2269 = _2265 || _2267;
    bool _2271 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2273 = _2269 || _2271;
    out.gl_Position.x = _1910;
    out.gl_Position.y = _1920;
    out.gl_Position.z = _2253;
    out.gl_Position.w = _1886;
    float _2275 = fma(_1292, _1188, _2197);
    float _2277 = _2263 * 0.5;
    float _2279 = fma(_2275, _2185, _2255);
    float _2281 = fma(_2259, _2185, _2261);
    float _2283 = _2255;
    float _2285 = _2263;
    if (!_2273)
    {
        _2283 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2287 = _2283;
    float _2289 = _2287;
    float _2291 = _2287;
    if (!_2273)
    {
        _2071 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2293 = _2071;
    out.m_79.z = _2277;
    out.m_79.w = _1886;
    float _2295 = _2293;
    float _2297 = _2293;
    if (!_2273)
    {
        _2073 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2299 = _2073;
    float _2301 = _2299;
    float _2303 = _2299;
    if (!_2273)
    {
        _2075 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2305 = _2075;
    out.m_81.x = _2279;
    out.m_81.y = _2257;
    out.m_81.z = _2281;
    float _2307 = _2305;
    float _2309 = _2305;
    if (!_2273)
    {
        _2285 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2311 = _2285;
    float _2313 = _2081 * _1944;
    float _2315 = -_2081;
    float _2317 = _2315 + 1.0;
    float _2319 = _1955 * _2313;
    float _2321 = _1965 * _2313;
    float _2323 = _1955 * _2317;
    float _2325 = fma(_1961, _2319, _1949);
    float _2327 = fma(_1963, _2319, _1951);
    float _2329 = fma(_1955, _2321, _1953);
    float _2331 = _2319;
    float _2333 = _2311;
    float _2335 = _2311;
    if (!_2273)
    {
        _2331 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2337 = _2331;
    out.m_83.x = _2325;
    out.m_83.y = _2327;
    out.m_83.z = _2329;
    out.m_83.w = _2323;
    bool _2339 = !_2273;
    float _2341 = _2337;
    float _2343 = _2337;
    if (!_2339)
    {
        bool _2345 = _1760 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2347 = isnan(_1760);
        bool _2349 = _2345 || _2347;
        bool _2351 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2353 = _2349 || _2351;
        if (!_2353)
        {
            float _2355 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2357 = _1760 + _2355;
            float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2361 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2359;
            float _2363 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2365 = _2363 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2367 = 1.0 / _2361;
            float _2369 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2371 = _2369 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2375 = _2373 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2379 = _2377 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2385 = _2357 * _2367;
            float _2387 = precise::clamp(_2385, 0.0, 1.0);
            float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2393 = fma(_2387, _2365, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2395 = fma(_2387, _2391, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2397 = fma(_2387, _2371, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2399 = fma(_2387, _2375, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2401 = fma(_2387, _2379, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2403 = fma(_2387, _2383, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2303 = _2397;
            _2335 = _2401;
            _2297 = _2393;
            _2291 = _2399;
            _2309 = _2395;
            _2343 = _2403;
            _2405 = true;
        }
        else
        {
            bool _2407 = _1760 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2409 = isnan(_1760);
            bool _2411 = _2407 || _2409;
            bool _2413 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2415 = _2411 || _2413;
            if (!_2415)
            {
                _2295 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2417 = _2295;
            _2297 = _2417;
            if (!_2415)
            {
                _2301 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2419 = _2301;
            _2303 = _2419;
            if (!_2415)
            {
                _2307 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2421 = _2307;
            _2309 = _2421;
            if (!_2415)
            {
                _2289 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2423 = _2289;
            _2291 = _2423;
            if (!_2415)
            {
                _2333 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2425 = _2333;
            _2335 = _2425;
            if (!_2415)
            {
                _2341 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2427 = _2341;
            bool _2429 = !_2415;
            _2343 = _2427;
            if (!_2429)
            {
                bool _2431 = _1760 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2433 = isnan(_1760);
                bool _2435 = _2431 || _2433;
                bool _2437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2439 = _2435 || _2437;
                if (!_2439)
                {
                    float _2441 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2443 = _1760 + _2441;
                    float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2447 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2445;
                    float _2449 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2451 = _2449 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2453 = 1.0 / _2447;
                    float _2455 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2457 = _2455 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2461 = _2459 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2465 = _2463 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2469 = _2467 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2471 = _2443 * _2453;
                    float _2473 = precise::clamp(_2471, 0.0, 1.0);
                    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2477 = _2475 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2479 = fma(_2473, _2451, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2481 = fma(_2473, _2477, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2483 = fma(_2473, _2457, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2485 = fma(_2473, _2461, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2487 = fma(_2473, _2465, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2489 = fma(_2473, _2469, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2303 = _2483;
                    _2335 = _2487;
                    _2297 = _2479;
                    _2291 = _2485;
                    _2309 = _2481;
                    _2343 = _2489;
                    _2405 = true;
                }
                else
                {
                    _2303 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2335 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2297 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2291 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2309 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2343 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2405 = false;
    float _2491 = _2303;
    float _2493 = _2335;
    float _2495 = _2297;
    float _2497 = _2291;
    float _2499 = _2309;
    float _2501 = _2343;
    float _2503 = fma(_2257, -0.5, 0.5);
    float _2505 = precise::clamp(_2503, 0.0, 1.0);
    float _2507 = -_2491;
    float _2509 = _2507 + _2493;
    float _2511 = -_2495;
    float _2513 = _2511 + _2497;
    float _2515 = -_2499;
    float _2517 = _2515 + _2501;
    bool _2519 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2521 = fma(_2505, _2509, _2491);
    float _2523 = fma(_2505, _2513, _2495);
    float _2525 = fma(_2505, _2517, _2499);
    float _2527 = _2521 * 0.586610972881317138671875;
    out.m_85.x = 0.0;
    float _2529 = fma(_2523, 0.298911988735198974609375, _2527);
    float _2531 = fma(_2525, 0.114477999508380889892578125, _2529);
    float _2533 = -_2531;
    float _2535 = _2523 + _2533;
    float _2537 = -_2531;
    float _2539 = _2521 + _2537;
    float _2541 = -_2531;
    float _2543 = _2525 + _2541;
    float _2545 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2547 = fma(_2535, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2531);
    float _2549 = fma(_2539, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2531);
    float _2551 = fma(_2543, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2531);
    out.m_47.x = _2545;
    out.m_87.x = _2547;
    out.m_87.y = _2549;
    out.m_87.z = _2551;
    if (!_2519)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2553 = -_1640;
    float _2555 = _2553 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2557 = -_1642;
    float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2561 = -_1644;
    float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2565 = _2555 * _2555;
    float _2567 = fma(_2559, _2559, _2565);
    float _2569 = fma(_2563, _2563, _2567);
    float _2571 = sqrt(_2569);
    float _2573 = rsqrt(_2569);
    float _2575 = -_2571;
    float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2579 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2581 = precise::clamp(_2579, 0.0, 1.0);
    float _2583 = _2559 * _2573;
    float _2585 = _2555 * _2573;
    float _2587 = abs(_2581);
    float _2589 = log2(_2587);
    float _2591 = _2563 * _2573;
    float _2593 = _2583 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2595 = _2257 * _2585;
    float _2597 = -_2585;
    float _2599 = -_2593;
    float _2601 = fma(_2597, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2599);
    float _2603 = fma(_2279, _2583, _2595);
    float _2605 = -_2591;
    float _2607 = fma(_2605, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2601);
    float _2609 = fma(_2281, _2591, _2603);
    float _2611 = precise::clamp(_2609, 0.0, 1.0);
    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2615 = _2607 + _2613;
    float _2617 = _2589 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2619 = _2615 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2621 = precise::clamp(_2619, 0.0, 1.0);
    float _2623 = exp2(_2617);
    float _2625 = _2623 * _2621;
    float _2627 = _2611 * _2625;
    float _2629 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2631 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2633 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2629;
    out.m_85.y = _2631;
    out.m_85.z = _2633;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

