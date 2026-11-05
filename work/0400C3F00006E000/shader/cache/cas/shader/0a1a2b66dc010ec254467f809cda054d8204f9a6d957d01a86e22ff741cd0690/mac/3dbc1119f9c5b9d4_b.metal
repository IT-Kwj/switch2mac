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
    float4 m_61 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1176 = false;
    bool _478 = false;
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
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
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1779 = as_type<float>(_106);
        out.gl_Position.z = _1779;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    float _126 = _122;
    if (_118)
    {
        float _128 = float(_90);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    if (_136)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _100;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    int _140 = 0;
    if (_136)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1848 = as_type<float>(_144);
        out.gl_Position.z = _1848;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    int _162 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _164 = _162 != 0;
    float _166 = _150 * _148;
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _168 * 6.283185482025146484375;
    float _178 = floor(_168);
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _184 = 0.0;
    float _186 = _182;
    if (!_160)
    {
        float _188 = _182 * _182;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _180 * 6.283185482025146484375;
    float _196 = cos(_194);
    float _198 = _192;
    if (!_160)
    {
        float _200 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    float _204 = -_178;
    float _206 = _168 + _204;
    bool _208 = !_160;
    float _210 = _202;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _182 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _182);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_160;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _182 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _186 = _264;
    }
    float _266 = _186;
    float _268 = in.m_53.w;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _276 = _274 != 0;
    float _278 = -_206;
    float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _282 = _206 < 0.5;
    float _284 = float(_282);
    float _286 = fma(_196, 0.5, 0.5);
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    bool _294 = !_272;
    int _296 = _294 ? 0 : 1;
    float _298 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _300 = -_284;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _304 = !_164;
    int _306 = _304 ? 0 : 1;
    float _308 = -_286;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _312 = abs(_296);
    float _314 = fma(_266, _170, _298);
    int _316 = abs(_306);
    float _318 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _320 = !_276;
    int _322 = _320 ? 0 : 1;
    float _324 = fma(_266, _172, _318);
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _328 = abs(_322);
    float _330 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _332 = float(_312);
    float _334 = float(_316);
    float _336 = fma(_266, _174, _330);
    float _338 = abs(_280);
    float _340 = _332 * _338;
    float _342 = fma(_314, _268, _288);
    float _344 = fma(_324, _268, _290);
    float _346 = float(_328);
    float _348 = fma(_334, _310, _340);
    float _350 = fma(_336, _268, _292);
    float _352 = abs(_302);
    float _354 = fma(_346, _352, _348);
    bool _356 = !_326;
    bool _358 = false;
    float _374;
    if (!_356)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _362 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_90);
        float _380 = 1.0 / _378;
        float _382 = _122 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    bool _386 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _388 = isnan(_384);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _402 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _404 = isnan(_384);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _420 = _384 + _418;
    float _422 = -_396;
    float _424 = _422 + 1.0;
    bool _426 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _428 = 1.0 / _400;
    float _430 = _412 * _424;
    float _432 = -_412;
    float _434 = _432 + 1.0;
    float _436 = _416 * _428;
    float _438 = fma(_436, _420, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _440 = _438 * _430;
    float _442 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[115].x, _440);
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _450 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[116].x, _442);
    float _452 = _444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _454 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _456 = _448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _458 = _450 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _460 = !_426;
    float _476;
    if (!_460)
    {
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _464 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _468 = _466 * _462;
        float _470 = floor(_468);
        float _472 = -_470;
        float _474 = _468 + _472;
        _476 = _474;
        _478 = true;
    }
    else
    {
        float _480 = float(_90);
        float _482 = 1.0 / _480;
        float _484 = _122 * _482;
        _476 = _484;
    }
    _478 = false;
    float _486 = _476;
    float _488 = in.m_51.w;
    float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _492 = in.m_53.x;
    float _494 = in.m_53.y;
    float _496 = in.m_53.z;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _504 = _502 != 0;
    float _506 = in.m_55.x;
    float _508 = in.m_55.y;
    float _510 = in.m_55.z;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _514 = _512 != 0;
    float _516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _520 = _518 != 0;
    float _522 = in.m_51.y;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _526 = _524 != 0;
    float _528 = _344 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _530 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _528);
    float _532 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _534 = 0.0;
    if (_504)
    {
        float _536 = in.m_51.z;
        _534 = _536;
    }
    float _538 = _534;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _542 = _488 > 0.5;
    float _544 = _344 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _546 = _344 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _548 = _492 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _550 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _544);
    float _552 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _546);
    float _554 = in.m_57.y;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _560;
    float _564 = _494 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _566 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _506);
    float _568 = 1.0 / _562;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _508);
    float _574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _510);
    float _576 = _496 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _578 = -_570;
    float _580 = fma(_532, 2.0, _578);
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _584 = 1.0 / _558;
    float _586 = _522 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _588 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].z, _530);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _592 = _486 + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _596 = _486 + _594;
    float _598 = _530;
    float _600 = _564;
    bool _602 = _542;
    if (!_526)
    {
        float _604 = in.m_51.z;
        _598 = _604;
    }
    float _606 = _598;
    float _608 = fma(_586, -2.0, _582);
    float _610 = _354 * _576;
    float _612 = _592 * _568;
    float _614 = -_554;
    float _616 = _614 + 1.0;
    float _618 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].z, _550);
    float _620 = _354 * _548;
    float _622 = _354 * _564;
    float _624 = _596 * _584;
    float _626 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].z, _552);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _636;
    int _640 = _542 ? as_type<int>(_616) : as_type<int>(_554);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _644 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _642;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _648 = fma(_630, _612, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _650 = fma(_634, _612, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _652 = fma(_638, _612, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _654 = _514 ? as_type<float>(_640) : _554;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _658 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _656;
    float _660 = -_644;
    float _662 = _660 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _664 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _646);
    float _666 = _554;
    float _668 = _624;
    if (!_526)
    {
        _600 = _522;
    }
    float _670 = _600;
    float _672 = _662 * _662;
    float _674 = _670;
    float _676 = _672;
    if (_500)
    {
        bool _678 = _146 > 0.5;
        _602 = _678;
    }
    bool _680 = _602;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _684 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _682;
    float _686 = _684;
    if (_526)
    {
        _674 = _146;
    }
    float _688 = _674;
    float _690 = -_658;
    float _692 = _690 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    if (_504)
    {
        bool _694 = _538 > 0.5;
        _358 = _694;
    }
    bool _696 = _358;
    float _698 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[78].w, _540);
    bool _700 = _522 > 0.5;
    float _702 = fma(_692, _692, _672);
    float _704 = -_684;
    float _706 = _704 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _708 = _606;
    if (!_526)
    {
        _676 = _606;
    }
    float _710 = _676;
    float _712 = _620 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _714 = _710;
    if (_526)
    {
        _714 = _522;
    }
    float _716 = _714;
    float _718 = _622 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_526)
    {
        _708 = _522;
    }
    float _720 = _708;
    float _722 = _490 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _724 = fma(_706, _706, _702);
    if (_520)
    {
        float _726 = _700 ? _616 : _554;
        _666 = _726;
    }
    float _728 = _666;
    float _730 = _712 * _566;
    bool _732 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _734 = isnan(_486);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _718 * _572;
    bool _746 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _748 = isnan(_486);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = sqrt(_724);
    float _760 = -_742;
    float _762 = _760 + 1.0;
    float _764 = in.m_57.x;
    float _766 = -_756;
    float _768 = _766 + 1.0;
    bool _770 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _772 = isnan(_486);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = _756 * _762;
    float _784 = _516 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _786 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _788 = fma(_654, _722, -0.5);
    float _790 = _780 * _768;
    float _792 = fma(_784, _728, -0.5);
    float _794 = _744 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _796 = _786 * _574;
    float _798 = _648 * _790;
    float _800 = _650 * _790;
    float _802 = fma(_758, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _804 = _744 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _806 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[24].x, _794);
    float _808 = _618 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _810 = _652 * _790;
    float _812 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[26].x, _804);
    float _814 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[24].z, _806);
    float _816 = _626 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _818 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[26].z, _812);
    float _820 = _814 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _824 = _818 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _830 = precise::max(_802, 0.3499999940395355224609375);
    float _832 = _808 + _820;
    float _834 = _816 + _824;
    float _836 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[83].z, _822);
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _842 = _688 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _844 = precise::min(_830, 1.0);
    float _846 = -_658;
    float _848 = _832 + _846;
    float _850 = -_684;
    float _852 = _834 + _850;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _862 = as_type<int>(_820);
    if (_500)
    {
        float _864 = -_764;
        float _866 = _864 + 1.0;
        _862 = as_type<int>(_866);
    }
    int _868 = _862;
    float _870 = -_838;
    float _872 = fma(_842, 2.0, _870);
    float _874 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[83].w, _840);
    float _876 = fma(_848, _844, _658);
    float _878 = fma(_852, _844, _684);
    float _880 = fma(_828, _624, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _882 = fma(_856, _624, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _884 = fma(_860, _624, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _886 = _876;
    float _888 = _878;
    if (!_500)
    {
        _668 = _764;
    }
    float _890 = _668;
    float _892 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _894 = _876 + _892;
    float _896 = _890;
    if (_500)
    {
        float _898 = _680 ? as_type<float>(_868) : _764;
        _896 = _898;
    }
    float _900 = _896;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _904 = _878 + _902;
    int _906 = 0;
    if (_504)
    {
        float _908 = -_764;
        float _910 = _908 + 1.0;
        _906 = as_type<int>(_910);
    }
    int _912 = _906;
    float _914 = _894 * _894;
    float _916 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _698);
    float _918 = _904 * _904;
    float _920 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _608);
    float _922 = _914;
    float _924 = _918;
    if (!_504)
    {
        _686 = _764;
    }
    float _926 = _686;
    float _928 = _744 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _930 = _914 + _918;
    float _932 = _926;
    if (_504)
    {
        float _934 = _696 ? as_type<float>(_912) : _764;
        _932 = _934;
    }
    float _936 = _932;
    float _938 = -_920;
    float _940 = fma(_916, _792, _938);
    float _942 = -_780;
    float _944 = _942 + 1.0;
    float _946 = sqrt(_930);
    float _948 = _716 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _950 = _588 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _952 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[123].x, _798);
    float _954 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[123].y, _800);
    float _956 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[123].z, _810);
    float _958 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[25].x, _928);
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _964 = fma(_882, _782, _954);
    float _966 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[25].z, _958);
    float _968 = fma(_948, -2.0, _960);
    float _970 = fma(_880, _782, _952);
    float _972 = fma(_884, _782, _956);
    float _974 = _966 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _976 = -_122;
    float _978 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[76].x, _580);
    float _980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _982 = _946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _984 = _950 + _974;
    float _986 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _836);
    float _988 = -_122;
    float _990 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[81].x, _872);
    float _992 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _874);
    float _994 = -_644;
    float _996 = _984 + _994;
    float _998 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _968);
    float _1000 = _962 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1002 = fma(_996, _844, _644);
    float _1004 = fma(_1000, _900, -0.5);
    float _1006 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _664);
    float _1008 = _992;
    if (!_982)
    {
        _126 = _1002;
    }
    float _1010 = _126;
    float _1012 = _980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1014 = fma(_1012, _936, -0.5);
    bool _1016 = !_982;
    float _1018 = _1010;
    if (!_1016)
    {
        float _1020 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1024 = _946 + _1022;
        float _1026 = _1002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1028 = rsqrt(_930);
        float _1030 = _1024 * _1020;
        float _1032 = _1030 * 0.15915493667125701904296875;
        float _1034 = _1032 * 6.283185482025146484375;
        float _1036 = sin(_1034);
        float _1038 = _1032 * 6.283185482025146484375;
        float _1040 = cos(_1038);
        float _1042 = fma(_1036, _1026, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1044 = _1028 * _1042;
        float _1046 = _1040 + (-1.0);
        float _1048 = fma(_894, _1044, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1050 = fma(_904, _1044, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1052 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1056 = _1048 + _1054;
        float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1060 = _1050 + _1058;
        float _1062 = fma(_1002, _1040, _1052);
        float _1064 = _1056 * _1056;
        float _1066 = _1060 * _1060;
        _1018 = _1062;
        _922 = _1064;
        _924 = _1066;
        _886 = _1048;
        _888 = _1050;
    }
    float _1068 = _1018;
    float _1070 = _922;
    float _1072 = _924;
    float _1074 = _886;
    float _1076 = _888;
    float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1080 = _1068 + _1078;
    float _1082 = in.m_59.w;
    float _1084 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[125].x, _970);
    float _1086 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[125].y, _964);
    float _1088 = fma(_1080, _1080, _1070);
    float _1090 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[125].z, _972);
    float _1092 = fma(_1006, _1004, _978);
    float _1094 = -_998;
    float _1096 = fma(_992, _788, _1094);
    float _1098 = _1088 + _1072;
    float _1100 = fma(_986, _1014, _990);
    float _1102 = _1084 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1104 = _1086 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1106 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1108 = sqrt(_1098);
    float _1110 = _1096 + 0.5;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1114 = _940 + 0.5;
    float _1116 = _1092 + 0.5;
    float _1118 = _1100 + 0.5;
    float _1120 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1122 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1124 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _452;
    out.m_61.y = _454;
    out.m_61.z = _456;
    out.m_61.w = _458;
    out.m_63.w = _1082;
    bool _1126 = _1108 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1128 = isnan(_1108);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1134 = _1130 || _1132;
    out.m_65.x = _1116;
    out.m_65.y = _1114;
    out.m_65.z = _1118;
    out.m_65.w = _1110;
    out.m_67.x = _1120;
    out.m_67.y = _1122;
    out.m_67.z = _1124;
    out.m_67.w = _1112;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1138 = _1122;
    float _1140 = _1124;
    if (!_1134)
    {
        _1136 = 1.0;
    }
    float _1142 = _1136;
    bool _1144 = !_1134;
    float _1146 = _1142;
    if (!_1144)
    {
        bool _1148 = _1108 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1150 = isnan(_1108);
        bool _1152 = _1148 || _1150;
        bool _1154 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1156 = _1152 || _1154;
        if (!_1156)
        {
            float _1158 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1160 = _1108 + _1158;
            float _1162 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1164 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1162;
            float _1166 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1168 = _1166 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1170 = 1.0 / _1164;
            float _1172 = _1160 * _1170;
            float _1174 = fma(_1172, _1168, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1146 = _1174;
            _1176 = true;
        }
        else
        {
            bool _1178 = _1108 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1180 = isnan(_1108);
            bool _1182 = _1178 || _1180;
            bool _1184 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1186 = _1182 || _1184;
            if (!_1186)
            {
                float _1188 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1190 = _1108 + _1188;
                float _1192 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1194 = _1192 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1196 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1198 = _1196 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1200 = 1.0 / _1194;
                float _1202 = _1190 * _1200;
                float _1204 = fma(_1202, _1198, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1146 = _1204;
                _1176 = true;
            }
            else
            {
                _1146 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1176 = false;
    float _1206 = _1146;
    float _1208 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1210 = _1068 + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1214 = _1074 + _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1218 = _1076 + _1216;
    float _1220 = fma(_1210, _1206, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1222 = fma(_1214, _1206, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1224 = fma(_1218, _1206, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1228 = _1220 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1232 = _1222 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1236 = _1224 + _1234;
    float _1238 = _1228 * _1228;
    float _1240 = fma(_1232, _1232, _1238);
    float _1242 = fma(_1236, _1236, _1240);
    float _1244 = rsqrt(_1242);
    float _1246 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1248 = _1232 * _1246;
    float _1250 = _1236 * _1246;
    float _1252 = _1248 * _1248;
    float _1254 = _1250 * _1250;
    float _1256 = _1252 + _1254;
    float _1258 = sqrt(_1256);
    bool _1260 = _1258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = _1258 + _1262;
    float _1266 = _1236;
    float _1268 = _1264;
    float _1270 = _1228;
    float _1272 = _1248;
    if (_1260)
    {
        float _1274 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1266 = _1274;
    }
    float _1276 = _1266;
    if (_1260)
    {
        float _1278 = rsqrt(_1256);
        _1138 = _1278;
    }
    float _1280 = _1138;
    float _1282 = _1280;
    if (_1260)
    {
        float _1284 = _1264 * _1276;
        _1268 = _1284;
    }
    float _1286 = _1268;
    if (_1260)
    {
        float _1288 = _1286 * 0.15915493667125701904296875;
        _1140 = _1288;
    }
    float _1290 = _1140;
    float _1292 = _1244;
    if (_1260)
    {
        float _1294 = _1290 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        _1292 = _1296;
    }
    float _1298 = _1292;
    float _1300 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1302 = precise::max(0.0, _1300);
    float _1304 = _1120;
    float _1306 = _1302;
    float _1308 = _1300;
    if (_1260)
    {
        float _1310 = _1290 * 6.283185482025146484375;
        float _1312 = cos(_1310);
        _1304 = _1312;
    }
    float _1314 = _1304;
    float _1316 = -_1246;
    float _1318 = -_1302;
    float _1320 = fma(_1228, _1316, _1318);
    if (!_1260)
    {
        _1270 = _1250;
    }
    float _1322 = _1270;
    float _1324 = _1322;
    if (_1260)
    {
        float _1326 = _1320 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1306 = _1326;
    }
    float _1328 = _1306;
    float _1330 = sqrt(_1242);
    float _1332 = _1298;
    float _1334 = _1328;
    if (_1260)
    {
        float _1336 = fma(_1298, _1328, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1332 = _1336;
    }
    float _1338 = _1332;
    float _1340 = _1338;
    if (!_1260)
    {
        _1334 = _1252;
    }
    float _1342 = _1334;
    float _1344 = _1342;
    if (_1260)
    {
        float _1346 = _1314 + (-1.0);
        _1308 = _1346;
    }
    float _1348 = _1308;
    float _1350 = _1348;
    if (_1260)
    {
        float _1352 = _1280 * _1338;
        _1008 = _1352;
    }
    float _1354 = _1008;
    if (!_1260)
    {
        _1340 = _1320;
    }
    float _1356 = _1340;
    float _1358 = _1356;
    if (_1260)
    {
        float _1360 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1282 = _1360;
    }
    float _1362 = _1282;
    if (_1260)
    {
        float _1364 = _1248 * _1354;
        _1272 = _1364;
    }
    float _1366 = _1272;
    if (_1260)
    {
        float _1368 = _1250 * _1354;
        _1324 = _1368;
    }
    float _1370 = _1324;
    if (!_1260)
    {
        _1350 = _1254;
    }
    float _1372 = _1350;
    float _1374 = _1372;
    if (_1260)
    {
        float _1376 = fma(_1320, _1314, _1362);
        _1358 = _1376;
    }
    float _1378 = _1358;
    if (_1260)
    {
        float _1380 = _1366 * _1366;
        _1344 = _1380;
    }
    float _1382 = _1344;
    if (_1260)
    {
        float _1384 = _1370 * _1370;
        _1374 = _1384;
    }
    float _1386 = _1374;
    float _1388 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1390 = fma(_1378, _1378, _1382);
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1394 = fma(_1330, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1392);
    float _1396 = precise::clamp(_1394, 0.0, 1.0);
    float _1398 = _1390 + _1386;
    float _1400 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1402 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1404 = -_1396;
    float _1406 = _1404 + 1.0;
    float _1408 = rsqrt(_1398);
    float _1410 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1400);
    float _1412 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1414 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1416 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1388);
    float _1418 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1410);
    float _1420 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1412);
    float _1422 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1414);
    float _1424 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1416);
    float _1426 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1428 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1420);
    float _1430 = abs(_1406);
    float _1432 = log2(_1430);
    float _1434 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1436 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1438 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1440 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1422);
    float _1442 = _1408 * _1366;
    float _1444 = _1408 * _1378;
    float _1446 = _1438 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1448 = _1408 * _1370;
    float _1450 = _1442 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1452 = -_1436;
    float _1454 = fma(_1452, _1402, 1.0);
    float _1456 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1446);
    float _1458 = _1440 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1460 = -_1450;
    float _1462 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1460);
    float _1464 = _1438 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1466 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1456);
    float _1468 = _1432 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1470 = -_1448;
    float _1472 = fma(_1470, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1462);
    float _1474 = log2(_1454);
    float _1476 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1466);
    float _1478 = _1438 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1480 = fma(_1472, -0.5, 0.5);
    float _1482 = fma(_1472, 0.5, 0.5);
    float _1484 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1464);
    float _1486 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1478);
    float _1488 = exp2(_1468);
    float _1490 = fma(_1482, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1492 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1484);
    float _1494 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1486);
    float _1496 = _1444 + 1.0;
    float _1498 = fma(_1482, _1490, -0.212114393711090087890625);
    float _1500 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1492);
    float _1502 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1494);
    float _1504 = 1.0 / _1476;
    float _1506 = _1474 * 0.693147182464599609375;
    float _1508 = fma(_1482, _1498, 1.570728778839111328125);
    float _1510 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1512 = sqrt(_1480);
    float _1514 = -_1444;
    float _1516 = fma(_1488, _1496, _1514);
    float _1518 = fma(_1516, 0.5, 0.5);
    float _1520 = _1500 * _1504;
    float _1522 = _1502 * _1504;
    float _1524 = fma(_1520, 0.5, 0.5);
    float _1526 = fma(_1522, -0.5, 0.5);
    float _1528 = _1512 * 0.636619746685028076171875;
    float _1530 = -_1508;
    float _1532 = fma(_1528, _1530, 1.0);
    float3 _4159 = float3(_1524, _1526, _1510);
    float _1534 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4159, float3(0.0), isnan(_4159)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4159, float3(0.0), isnan(_4159)), level(0.0)).x;
    float3 _4170 = float3(_1524, _1526, _1510);
    float4 _1537 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4170, float3(0.0), isnan(_4170)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4170, float3(0.0), isnan(_4170)), level(0.0)).xyzw;
    float _1539 = _1537.x;
    float _1541 = _1537.y;
    float _1543 = _1537.z;
    float _1545 = _1537.w;
    float2 _4187 = float2(_1532, _1518);
    float3 _1549 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4187, float2(0.0), isnan(_4187)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4187, float2(0.0), isnan(_4187)), level(0.0)).xyz;
    float _1551 = _1549.x;
    float _1553 = _1549.y;
    float _1555 = _1549.z;
    float _1557 = _950 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1559 = _1432 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1561 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1557);
    float _1563 = _950 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1565 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1561);
    float _1567 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1563);
    bool _1569 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan(0.5);
    bool _1577 = _1573 || _1575;
    float _1579 = exp2(_1559);
    float _1581 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1583 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1567);
    float _1585 = _1438 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1587 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1589 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1585);
    float _1591 = 1.0 / _1581;
    float _1593 = _1587 + _1581;
    float _1595 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1589);
    float _1597 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1595);
    float _1599 = _1593 * _1591;
    float _1601 = _1599 * 0.5;
    float _1603 = _1593;
    if (_1577)
    {
        _1603 = 1.0;
    }
    float _1605 = _1603;
    float _1607 = _1605;
    if (!_1577)
    {
        float _1609 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1613 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1611);
        float _1615 = _1609 * 0.15915493667125701904296875;
        float _1617 = _1615 * 6.283185482025146484375;
        float _1619 = cos(_1617);
        float _1621 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1623 = _1621 * 0.15915493667125701904296875;
        float _1625 = _1615 * 6.283185482025146484375;
        float _1627 = sin(_1625);
        float _1629 = 1.0 / _1619;
        float _1631 = _1623 * 6.283185482025146484375;
        float _1633 = cos(_1631);
        float _1635 = _1627 * _1629;
        float _1637 = 1.0 / _1613;
        float _1639 = _1633 * _1635;
        float _1641 = _1623 * 6.283185482025146484375;
        float _1643 = sin(_1641);
        float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1647 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1645;
        float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1651 = _1637 * _1649;
        float _1653 = 1.0 / _1639;
        float _1655 = 1.0 / _1647;
        float _1657 = _1643 * _1653;
        float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1661 = fma(_1657, _1651, _1659);
        float _1663 = _1661 * _1655;
        float _1665 = precise::clamp(_1663, 0.0, 1.0);
        float _1667 = -_1665;
        float _1669 = _1667 + 1.0;
        _1607 = _1669;
    }
    float _1671 = _1607;
    float _1673 = _1476 * 0.5;
    float _1675 = -_1579;
    float _1677 = _1675 + 1.0;
    bool _1679 = _1671 > 0.0;
    bool _1681 = isnan(_1671);
    bool _1683 = _1679 || _1681;
    bool _1685 = isnan(0.0);
    bool _1687 = _1683 || _1685;
    float _1689 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1691 = fma(_1502, -0.5, _1673);
    float _1693 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1695 = _1597 + _1476;
    float _1697 = _1500 + _1476;
    out.gl_Position.x = _1500;
    out.gl_Position.y = _1502;
    out.gl_Position.z = _1597;
    out.gl_Position.w = _1476;
    float _1699 = _1693 * _1534;
    float _1701 = -_1693;
    float _1703 = _1701 + 1.0;
    float _1705 = _1695 * 0.5;
    float _1707 = _1545 * _1699;
    float _1709 = _1555 * _1699;
    float _1711 = _1697 * 0.5;
    float _1713 = _1689 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1715 = fma(_1551, _1707, _1539);
    float _1717 = fma(_1553, _1707, _1541);
    float _1719 = _1545 * _1703;
    float _1721 = fma(_1545, _1709, _1543);
    out.m_69.x = _1711;
    out.m_69.y = _1691;
    out.m_69.z = _1705;
    out.m_69.w = _1476;
    out.m_47.x = _1713;
    out.m_71.x = _1715;
    out.m_71.y = _1717;
    out.m_71.z = _1721;
    out.m_71.w = _1719;
    if (_1687)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1723 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1723;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1176 = false;
    bool _478 = false;
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
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
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1779 = as_type<float>(_106);
        out.gl_Position.z = _1779;
    }
    if (!_94)
    {
        return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    float _126 = _122;
    if (_118)
    {
        float _128 = float(_90);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    if (_136)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _100;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    int _140 = 0;
    if (_136)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1848 = as_type<float>(_144);
        out.gl_Position.z = _1848;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_51.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    int _162 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _164 = _162 != 0;
    float _166 = _150 * _148;
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _168 * 6.283185482025146484375;
    float _178 = floor(_168);
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _184 = 0.0;
    float _186 = _182;
    if (!_160)
    {
        float _188 = _182 * _182;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _180 * 6.283185482025146484375;
    float _196 = cos(_194);
    float _198 = _192;
    if (!_160)
    {
        float _200 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    float _204 = -_178;
    float _206 = _168 + _204;
    bool _208 = !_160;
    float _210 = _202;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _182 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _182);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_160;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _182 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _186 = _264;
    }
    float _266 = _186;
    float _268 = in.m_53.w;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _276 = _274 != 0;
    float _278 = -_206;
    float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _282 = _206 < 0.5;
    float _284 = float(_282);
    float _286 = fma(_196, 0.5, 0.5);
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    bool _294 = !_272;
    int _296 = _294 ? 0 : 1;
    float _298 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _300 = -_284;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _304 = !_164;
    int _306 = _304 ? 0 : 1;
    float _308 = -_286;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _312 = abs(_296);
    float _314 = fma(_266, _170, _298);
    int _316 = abs(_306);
    float _318 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _320 = !_276;
    int _322 = _320 ? 0 : 1;
    float _324 = fma(_266, _172, _318);
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _328 = abs(_322);
    float _330 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _332 = float(_312);
    float _334 = float(_316);
    float _336 = fma(_266, _174, _330);
    float _338 = abs(_280);
    float _340 = _332 * _338;
    float _342 = fma(_314, _268, _288);
    float _344 = fma(_324, _268, _290);
    float _346 = float(_328);
    float _348 = fma(_334, _310, _340);
    float _350 = fma(_336, _268, _292);
    float _352 = abs(_302);
    float _354 = fma(_346, _352, _348);
    bool _356 = !_326;
    bool _358 = false;
    float _374;
    if (!_356)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _362 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_90);
        float _380 = 1.0 / _378;
        float _382 = _122 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    bool _386 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _388 = isnan(_384);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _402 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _404 = isnan(_384);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _420 = _384 + _418;
    float _422 = -_396;
    float _424 = _422 + 1.0;
    bool _426 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _428 = 1.0 / _400;
    float _430 = _412 * _424;
    float _432 = -_412;
    float _434 = _432 + 1.0;
    float _436 = _416 * _428;
    float _438 = fma(_436, _420, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _440 = _438 * _430;
    float _442 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[115].x, _440);
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _450 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[116].x, _442);
    float _452 = _444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _454 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _456 = _448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _458 = _450 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _460 = !_426;
    float _476;
    if (!_460)
    {
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _464 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _468 = _466 * _462;
        float _470 = floor(_468);
        float _472 = -_470;
        float _474 = _468 + _472;
        _476 = _474;
        _478 = true;
    }
    else
    {
        float _480 = float(_90);
        float _482 = 1.0 / _480;
        float _484 = _122 * _482;
        _476 = _484;
    }
    _478 = false;
    float _486 = _476;
    float _488 = in.m_51.w;
    float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _492 = in.m_53.x;
    float _494 = in.m_53.y;
    float _496 = in.m_53.z;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _504 = _502 != 0;
    float _506 = in.m_55.x;
    float _508 = in.m_55.y;
    float _510 = in.m_55.z;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _514 = _512 != 0;
    float _516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _520 = _518 != 0;
    float _522 = in.m_51.y;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _526 = _524 != 0;
    float _528 = _344 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _530 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _528);
    float _532 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _534 = 0.0;
    if (_504)
    {
        float _536 = in.m_51.z;
        _534 = _536;
    }
    float _538 = _534;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _542 = _488 > 0.5;
    float _544 = _344 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _546 = _344 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _548 = _492 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _550 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _544);
    float _552 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _546);
    float _554 = in.m_57.y;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _560;
    float _564 = _494 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _566 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _506);
    float _568 = 1.0 / _562;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _508);
    float _574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _510);
    float _576 = _496 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _578 = -_570;
    float _580 = fma(_532, 2.0, _578);
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _584 = 1.0 / _558;
    float _586 = _522 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _588 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].z, _530);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _592 = _486 + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _596 = _486 + _594;
    float _598 = _530;
    float _600 = _564;
    bool _602 = _542;
    if (!_526)
    {
        float _604 = in.m_51.z;
        _598 = _604;
    }
    float _606 = _598;
    float _608 = fma(_586, -2.0, _582);
    float _610 = _354 * _576;
    float _612 = _592 * _568;
    float _614 = -_554;
    float _616 = _614 + 1.0;
    float _618 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].z, _550);
    float _620 = _354 * _548;
    float _622 = _354 * _564;
    float _624 = _596 * _584;
    float _626 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].z, _552);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _636;
    int _640 = _542 ? as_type<int>(_616) : as_type<int>(_554);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _644 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _642;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _648 = fma(_630, _612, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _650 = fma(_634, _612, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _652 = fma(_638, _612, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _654 = _514 ? as_type<float>(_640) : _554;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _658 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _656;
    float _660 = -_644;
    float _662 = _660 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _664 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _646);
    float _666 = _554;
    float _668 = _624;
    if (!_526)
    {
        _600 = _522;
    }
    float _670 = _600;
    float _672 = _662 * _662;
    float _674 = _670;
    float _676 = _672;
    if (_500)
    {
        bool _678 = _146 > 0.5;
        _602 = _678;
    }
    bool _680 = _602;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _684 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _682;
    float _686 = _684;
    if (_526)
    {
        _674 = _146;
    }
    float _688 = _674;
    float _690 = -_658;
    float _692 = _690 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    if (_504)
    {
        bool _694 = _538 > 0.5;
        _358 = _694;
    }
    bool _696 = _358;
    float _698 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[78].w, _540);
    bool _700 = _522 > 0.5;
    float _702 = fma(_692, _692, _672);
    float _704 = -_684;
    float _706 = _704 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _708 = _606;
    if (!_526)
    {
        _676 = _606;
    }
    float _710 = _676;
    float _712 = _620 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _714 = _710;
    if (_526)
    {
        _714 = _522;
    }
    float _716 = _714;
    float _718 = _622 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_526)
    {
        _708 = _522;
    }
    float _720 = _708;
    float _722 = _490 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _724 = fma(_706, _706, _702);
    if (_520)
    {
        float _726 = _700 ? _616 : _554;
        _666 = _726;
    }
    float _728 = _666;
    float _730 = _712 * _566;
    bool _732 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _734 = isnan(_486);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _718 * _572;
    bool _746 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _748 = isnan(_486);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = sqrt(_724);
    float _760 = -_742;
    float _762 = _760 + 1.0;
    float _764 = in.m_57.x;
    float _766 = -_756;
    float _768 = _766 + 1.0;
    bool _770 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _772 = isnan(_486);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = _756 * _762;
    float _784 = _516 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _786 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _788 = fma(_654, _722, -0.5);
    float _790 = _780 * _768;
    float _792 = fma(_784, _728, -0.5);
    float _794 = _744 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _796 = _786 * _574;
    float _798 = _648 * _790;
    float _800 = _650 * _790;
    float _802 = fma(_758, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _804 = _744 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _806 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[24].x, _794);
    float _808 = _618 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _810 = _652 * _790;
    float _812 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[26].x, _804);
    float _814 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[24].z, _806);
    float _816 = _626 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _818 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[26].z, _812);
    float _820 = _814 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _824 = _818 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _830 = precise::max(_802, 0.3499999940395355224609375);
    float _832 = _808 + _820;
    float _834 = _816 + _824;
    float _836 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[83].z, _822);
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _842 = _688 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _844 = precise::min(_830, 1.0);
    float _846 = -_658;
    float _848 = _832 + _846;
    float _850 = -_684;
    float _852 = _834 + _850;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _862 = as_type<int>(_820);
    if (_500)
    {
        float _864 = -_764;
        float _866 = _864 + 1.0;
        _862 = as_type<int>(_866);
    }
    int _868 = _862;
    float _870 = -_838;
    float _872 = fma(_842, 2.0, _870);
    float _874 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[83].w, _840);
    float _876 = fma(_848, _844, _658);
    float _878 = fma(_852, _844, _684);
    float _880 = fma(_828, _624, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _882 = fma(_856, _624, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _884 = fma(_860, _624, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _886 = _876;
    float _888 = _878;
    if (!_500)
    {
        _668 = _764;
    }
    float _890 = _668;
    float _892 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _894 = _876 + _892;
    float _896 = _890;
    if (_500)
    {
        float _898 = _680 ? as_type<float>(_868) : _764;
        _896 = _898;
    }
    float _900 = _896;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _904 = _878 + _902;
    int _906 = 0;
    if (_504)
    {
        float _908 = -_764;
        float _910 = _908 + 1.0;
        _906 = as_type<int>(_910);
    }
    int _912 = _906;
    float _914 = _894 * _894;
    float _916 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _698);
    float _918 = _904 * _904;
    float _920 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _608);
    float _922 = _914;
    float _924 = _918;
    if (!_504)
    {
        _686 = _764;
    }
    float _926 = _686;
    float _928 = _744 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _930 = _914 + _918;
    float _932 = _926;
    if (_504)
    {
        float _934 = _696 ? as_type<float>(_912) : _764;
        _932 = _934;
    }
    float _936 = _932;
    float _938 = -_920;
    float _940 = fma(_916, _792, _938);
    float _942 = -_780;
    float _944 = _942 + 1.0;
    float _946 = sqrt(_930);
    float _948 = _716 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _950 = _588 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _952 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[123].x, _798);
    float _954 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[123].y, _800);
    float _956 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[123].z, _810);
    float _958 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[25].x, _928);
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _964 = fma(_882, _782, _954);
    float _966 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[25].z, _958);
    float _968 = fma(_948, -2.0, _960);
    float _970 = fma(_880, _782, _952);
    float _972 = fma(_884, _782, _956);
    float _974 = _966 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _976 = -_122;
    float _978 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[76].x, _580);
    float _980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _982 = _946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _984 = _950 + _974;
    float _986 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _836);
    float _988 = -_122;
    float _990 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[81].x, _872);
    float _992 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _874);
    float _994 = -_644;
    float _996 = _984 + _994;
    float _998 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _968);
    float _1000 = _962 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1002 = fma(_996, _844, _644);
    float _1004 = fma(_1000, _900, -0.5);
    float _1006 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _664);
    float _1008 = _992;
    if (!_982)
    {
        _126 = _1002;
    }
    float _1010 = _126;
    float _1012 = _980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1014 = fma(_1012, _936, -0.5);
    bool _1016 = !_982;
    float _1018 = _1010;
    if (!_1016)
    {
        float _1020 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1024 = _946 + _1022;
        float _1026 = _1002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1028 = rsqrt(_930);
        float _1030 = _1024 * _1020;
        float _1032 = _1030 * 0.15915493667125701904296875;
        float _1034 = _1032 * 6.283185482025146484375;
        float _1036 = sin(_1034);
        float _1038 = _1032 * 6.283185482025146484375;
        float _1040 = cos(_1038);
        float _1042 = fma(_1036, _1026, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1044 = _1028 * _1042;
        float _1046 = _1040 + (-1.0);
        float _1048 = fma(_894, _1044, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1050 = fma(_904, _1044, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1052 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1056 = _1048 + _1054;
        float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1060 = _1050 + _1058;
        float _1062 = fma(_1002, _1040, _1052);
        float _1064 = _1056 * _1056;
        float _1066 = _1060 * _1060;
        _1018 = _1062;
        _922 = _1064;
        _924 = _1066;
        _886 = _1048;
        _888 = _1050;
    }
    float _1068 = _1018;
    float _1070 = _922;
    float _1072 = _924;
    float _1074 = _886;
    float _1076 = _888;
    float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1080 = _1068 + _1078;
    float _1082 = in.m_59.w;
    float _1084 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[125].x, _970);
    float _1086 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[125].y, _964);
    float _1088 = fma(_1080, _1080, _1070);
    float _1090 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[125].z, _972);
    float _1092 = fma(_1006, _1004, _978);
    float _1094 = -_998;
    float _1096 = fma(_992, _788, _1094);
    float _1098 = _1088 + _1072;
    float _1100 = fma(_986, _1014, _990);
    float _1102 = _1084 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1104 = _1086 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1106 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1108 = sqrt(_1098);
    float _1110 = _1096 + 0.5;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1114 = _940 + 0.5;
    float _1116 = _1092 + 0.5;
    float _1118 = _1100 + 0.5;
    float _1120 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1122 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1124 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _452;
    out.m_61.y = _454;
    out.m_61.z = _456;
    out.m_61.w = _458;
    out.m_63.w = _1082;
    bool _1126 = _1108 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1128 = isnan(_1108);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1134 = _1130 || _1132;
    out.m_65.x = _1116;
    out.m_65.y = _1114;
    out.m_65.z = _1118;
    out.m_65.w = _1110;
    out.m_67.x = _1120;
    out.m_67.y = _1122;
    out.m_67.z = _1124;
    out.m_67.w = _1112;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1138 = _1122;
    float _1140 = _1124;
    if (!_1134)
    {
        _1136 = 1.0;
    }
    float _1142 = _1136;
    bool _1144 = !_1134;
    float _1146 = _1142;
    if (!_1144)
    {
        bool _1148 = _1108 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1150 = isnan(_1108);
        bool _1152 = _1148 || _1150;
        bool _1154 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1156 = _1152 || _1154;
        if (!_1156)
        {
            float _1158 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1160 = _1108 + _1158;
            float _1162 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1164 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1162;
            float _1166 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1168 = _1166 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1170 = 1.0 / _1164;
            float _1172 = _1160 * _1170;
            float _1174 = fma(_1172, _1168, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1146 = _1174;
            _1176 = true;
        }
        else
        {
            bool _1178 = _1108 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1180 = isnan(_1108);
            bool _1182 = _1178 || _1180;
            bool _1184 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1186 = _1182 || _1184;
            if (!_1186)
            {
                float _1188 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1190 = _1108 + _1188;
                float _1192 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1194 = _1192 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1196 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1198 = _1196 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1200 = 1.0 / _1194;
                float _1202 = _1190 * _1200;
                float _1204 = fma(_1202, _1198, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1146 = _1204;
                _1176 = true;
            }
            else
            {
                _1146 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1176 = false;
    float _1206 = _1146;
    float _1208 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1210 = _1068 + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1214 = _1074 + _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1218 = _1076 + _1216;
    float _1220 = fma(_1210, _1206, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1222 = fma(_1214, _1206, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1224 = fma(_1218, _1206, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1228 = _1220 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1232 = _1222 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1236 = _1224 + _1234;
    float _1238 = _1228 * _1228;
    float _1240 = fma(_1232, _1232, _1238);
    float _1242 = fma(_1236, _1236, _1240);
    float _1244 = rsqrt(_1242);
    float _1246 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1248 = _1232 * _1246;
    float _1250 = _1236 * _1246;
    float _1252 = _1248 * _1248;
    float _1254 = _1250 * _1250;
    float _1256 = _1252 + _1254;
    float _1258 = sqrt(_1256);
    bool _1260 = _1258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = _1258 + _1262;
    float _1266 = _1236;
    float _1268 = _1264;
    float _1270 = _1228;
    float _1272 = _1248;
    if (_1260)
    {
        float _1274 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1266 = _1274;
    }
    float _1276 = _1266;
    if (_1260)
    {
        float _1278 = rsqrt(_1256);
        _1138 = _1278;
    }
    float _1280 = _1138;
    float _1282 = _1280;
    if (_1260)
    {
        float _1284 = _1264 * _1276;
        _1268 = _1284;
    }
    float _1286 = _1268;
    if (_1260)
    {
        float _1288 = _1286 * 0.15915493667125701904296875;
        _1140 = _1288;
    }
    float _1290 = _1140;
    float _1292 = _1244;
    if (_1260)
    {
        float _1294 = _1290 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        _1292 = _1296;
    }
    float _1298 = _1292;
    float _1300 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1302 = precise::max(0.0, _1300);
    float _1304 = _1120;
    float _1306 = _1302;
    float _1308 = _1300;
    if (_1260)
    {
        float _1310 = _1290 * 6.283185482025146484375;
        float _1312 = cos(_1310);
        _1304 = _1312;
    }
    float _1314 = _1304;
    float _1316 = -_1246;
    float _1318 = -_1302;
    float _1320 = fma(_1228, _1316, _1318);
    if (!_1260)
    {
        _1270 = _1250;
    }
    float _1322 = _1270;
    float _1324 = _1322;
    if (_1260)
    {
        float _1326 = _1320 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1306 = _1326;
    }
    float _1328 = _1306;
    float _1330 = sqrt(_1242);
    float _1332 = _1298;
    float _1334 = _1328;
    if (_1260)
    {
        float _1336 = fma(_1298, _1328, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1332 = _1336;
    }
    float _1338 = _1332;
    float _1340 = _1338;
    if (!_1260)
    {
        _1334 = _1252;
    }
    float _1342 = _1334;
    float _1344 = _1342;
    if (_1260)
    {
        float _1346 = _1314 + (-1.0);
        _1308 = _1346;
    }
    float _1348 = _1308;
    float _1350 = _1348;
    if (_1260)
    {
        float _1352 = _1280 * _1338;
        _1008 = _1352;
    }
    float _1354 = _1008;
    if (!_1260)
    {
        _1340 = _1320;
    }
    float _1356 = _1340;
    float _1358 = _1356;
    if (_1260)
    {
        float _1360 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1282 = _1360;
    }
    float _1362 = _1282;
    if (_1260)
    {
        float _1364 = _1248 * _1354;
        _1272 = _1364;
    }
    float _1366 = _1272;
    if (_1260)
    {
        float _1368 = _1250 * _1354;
        _1324 = _1368;
    }
    float _1370 = _1324;
    if (!_1260)
    {
        _1350 = _1254;
    }
    float _1372 = _1350;
    float _1374 = _1372;
    if (_1260)
    {
        float _1376 = fma(_1320, _1314, _1362);
        _1358 = _1376;
    }
    float _1378 = _1358;
    if (_1260)
    {
        float _1380 = _1366 * _1366;
        _1344 = _1380;
    }
    float _1382 = _1344;
    if (_1260)
    {
        float _1384 = _1370 * _1370;
        _1374 = _1384;
    }
    float _1386 = _1374;
    float _1388 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1390 = fma(_1378, _1378, _1382);
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1394 = fma(_1330, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1392);
    float _1396 = precise::clamp(_1394, 0.0, 1.0);
    float _1398 = _1390 + _1386;
    float _1400 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1402 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1404 = -_1396;
    float _1406 = _1404 + 1.0;
    float _1408 = rsqrt(_1398);
    float _1410 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1400);
    float _1412 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1414 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1416 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1388);
    float _1418 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1410);
    float _1420 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1412);
    float _1422 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1414);
    float _1424 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1416);
    float _1426 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1428 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1420);
    float _1430 = abs(_1406);
    float _1432 = log2(_1430);
    float _1434 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1436 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1438 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1440 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1422);
    float _1442 = _1408 * _1366;
    float _1444 = _1408 * _1378;
    float _1446 = _1438 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1448 = _1408 * _1370;
    float _1450 = _1442 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1452 = -_1436;
    float _1454 = fma(_1452, _1402, 1.0);
    float _1456 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1446);
    float _1458 = _1440 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1460 = -_1450;
    float _1462 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1460);
    float _1464 = _1438 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1466 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1456);
    float _1468 = _1432 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1470 = -_1448;
    float _1472 = fma(_1470, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1462);
    float _1474 = log2(_1454);
    float _1476 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1466);
    float _1478 = _1438 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1480 = fma(_1472, -0.5, 0.5);
    float _1482 = fma(_1472, 0.5, 0.5);
    float _1484 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1464);
    float _1486 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1478);
    float _1488 = exp2(_1468);
    float _1490 = fma(_1482, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1492 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1484);
    float _1494 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1486);
    float _1496 = _1444 + 1.0;
    float _1498 = fma(_1482, _1490, -0.212114393711090087890625);
    float _1500 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1492);
    float _1502 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1494);
    float _1504 = 1.0 / _1476;
    float _1506 = _1474 * 0.693147182464599609375;
    float _1508 = fma(_1482, _1498, 1.570728778839111328125);
    float _1510 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1512 = sqrt(_1480);
    float _1514 = -_1444;
    float _1516 = fma(_1488, _1496, _1514);
    float _1518 = fma(_1516, 0.5, 0.5);
    float _1520 = _1500 * _1504;
    float _1522 = _1502 * _1504;
    float _1524 = fma(_1520, 0.5, 0.5);
    float _1526 = fma(_1522, -0.5, 0.5);
    float _1528 = _1512 * 0.636619746685028076171875;
    float _1530 = -_1508;
    float _1532 = fma(_1528, _1530, 1.0);
    float3 _4159 = float3(_1524, _1526, _1510);
    float _1534 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4159, float3(0.0), isnan(_4159)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4159, float3(0.0), isnan(_4159)), level(0.0)).x;
    float3 _4170 = float3(_1524, _1526, _1510);
    float4 _1537 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4170, float3(0.0), isnan(_4170)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4170, float3(0.0), isnan(_4170)), level(0.0)).xyzw;
    float _1539 = _1537.x;
    float _1541 = _1537.y;
    float _1543 = _1537.z;
    float _1545 = _1537.w;
    float2 _4187 = float2(_1532, _1518);
    float3 _1549 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4187, float2(0.0), isnan(_4187)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4187, float2(0.0), isnan(_4187)), level(0.0)).xyz;
    float _1551 = _1549.x;
    float _1553 = _1549.y;
    float _1555 = _1549.z;
    float _1557 = _950 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1559 = _1432 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1561 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1557);
    float _1563 = _950 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1565 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1561);
    float _1567 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1563);
    bool _1569 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan(0.5);
    bool _1577 = _1573 || _1575;
    float _1579 = exp2(_1559);
    float _1581 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1583 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1567);
    float _1585 = _1438 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1587 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1589 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1585);
    float _1591 = 1.0 / _1581;
    float _1593 = _1587 + _1581;
    float _1595 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1589);
    float _1597 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1595);
    float _1599 = _1593 * _1591;
    float _1601 = _1599 * 0.5;
    float _1603 = _1593;
    if (_1577)
    {
        _1603 = 1.0;
    }
    float _1605 = _1603;
    float _1607 = _1605;
    if (!_1577)
    {
        float _1609 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1613 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1611);
        float _1615 = _1609 * 0.15915493667125701904296875;
        float _1617 = _1615 * 6.283185482025146484375;
        float _1619 = cos(_1617);
        float _1621 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1623 = _1621 * 0.15915493667125701904296875;
        float _1625 = _1615 * 6.283185482025146484375;
        float _1627 = sin(_1625);
        float _1629 = 1.0 / _1619;
        float _1631 = _1623 * 6.283185482025146484375;
        float _1633 = cos(_1631);
        float _1635 = _1627 * _1629;
        float _1637 = 1.0 / _1613;
        float _1639 = _1633 * _1635;
        float _1641 = _1623 * 6.283185482025146484375;
        float _1643 = sin(_1641);
        float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1647 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1645;
        float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1651 = _1637 * _1649;
        float _1653 = 1.0 / _1639;
        float _1655 = 1.0 / _1647;
        float _1657 = _1643 * _1653;
        float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1661 = fma(_1657, _1651, _1659);
        float _1663 = _1661 * _1655;
        float _1665 = precise::clamp(_1663, 0.0, 1.0);
        float _1667 = -_1665;
        float _1669 = _1667 + 1.0;
        _1607 = _1669;
    }
    float _1671 = _1607;
    float _1673 = _1476 * 0.5;
    float _1675 = -_1579;
    float _1677 = _1675 + 1.0;
    bool _1679 = _1671 > 0.0;
    bool _1681 = isnan(_1671);
    bool _1683 = _1679 || _1681;
    bool _1685 = isnan(0.0);
    bool _1687 = _1683 || _1685;
    float _1689 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1691 = fma(_1502, -0.5, _1673);
    float _1693 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1695 = _1597 + _1476;
    float _1697 = _1500 + _1476;
    out.gl_Position.x = _1500;
    out.gl_Position.y = _1502;
    out.gl_Position.z = _1597;
    out.gl_Position.w = _1476;
    float _1699 = _1693 * _1534;
    float _1701 = -_1693;
    float _1703 = _1701 + 1.0;
    float _1705 = _1695 * 0.5;
    float _1707 = _1545 * _1699;
    float _1709 = _1555 * _1699;
    float _1711 = _1697 * 0.5;
    float _1713 = _1689 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1715 = fma(_1551, _1707, _1539);
    float _1717 = fma(_1553, _1707, _1541);
    float _1719 = _1545 * _1703;
    float _1721 = fma(_1545, _1709, _1543);
    out.m_69.x = _1711;
    out.m_69.y = _1691;
    out.m_69.z = _1705;
    out.m_69.w = _1476;
    out.m_47.x = _1713;
    out.m_71.x = _1715;
    out.m_71.y = _1717;
    out.m_71.z = _1721;
    out.m_71.w = _1719;
    if (_1687)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1723 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1723;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1176 = false;
    bool _478 = false;
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
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
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1779 = as_type<float>(_106);
        out.gl_Position.z = _1779;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    float _126 = _122;
    if (_118)
    {
        float _128 = float(_90);
        _124 = _128;
    }
    float _130 = _124;
    bool _132 = _122 >= _130;
    bool _134 = !_118;
    bool _136 = _132 || _134;
    if (_136)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _100;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    int _140 = 0;
    if (_136)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1848 = as_type<float>(_144);
        out.gl_Position.z = _1848;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    int _162 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _164 = _162 != 0;
    float _166 = _150 * _148;
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _168 * 6.283185482025146484375;
    float _178 = floor(_168);
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _184 = 0.0;
    float _186 = _182;
    if (!_160)
    {
        float _188 = _182 * _182;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _180 * 6.283185482025146484375;
    float _196 = cos(_194);
    float _198 = _192;
    if (!_160)
    {
        float _200 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    float _204 = -_178;
    float _206 = _168 + _204;
    bool _208 = !_160;
    float _210 = _202;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _182 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _182);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_160;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _182 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _186 = _264;
    }
    float _266 = _186;
    float _268 = in.m_53.w;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _276 = _274 != 0;
    float _278 = -_206;
    float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _282 = _206 < 0.5;
    float _284 = float(_282);
    float _286 = fma(_196, 0.5, 0.5);
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    bool _294 = !_272;
    int _296 = _294 ? 0 : 1;
    float _298 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _300 = -_284;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _304 = !_164;
    int _306 = _304 ? 0 : 1;
    float _308 = -_286;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _312 = abs(_296);
    float _314 = fma(_266, _170, _298);
    int _316 = abs(_306);
    float _318 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _320 = !_276;
    int _322 = _320 ? 0 : 1;
    float _324 = fma(_266, _172, _318);
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _328 = abs(_322);
    float _330 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _332 = float(_312);
    float _334 = float(_316);
    float _336 = fma(_266, _174, _330);
    float _338 = abs(_280);
    float _340 = _332 * _338;
    float _342 = fma(_314, _268, _288);
    float _344 = fma(_324, _268, _290);
    float _346 = float(_328);
    float _348 = fma(_334, _310, _340);
    float _350 = fma(_336, _268, _292);
    float _352 = abs(_302);
    float _354 = fma(_346, _352, _348);
    bool _356 = !_326;
    bool _358 = false;
    float _374;
    if (!_356)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _362 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_90);
        float _380 = 1.0 / _378;
        float _382 = _122 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    bool _386 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _388 = isnan(_384);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _402 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _404 = isnan(_384);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _420 = _384 + _418;
    float _422 = -_396;
    float _424 = _422 + 1.0;
    bool _426 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _428 = 1.0 / _400;
    float _430 = _412 * _424;
    float _432 = -_412;
    float _434 = _432 + 1.0;
    float _436 = _416 * _428;
    float _438 = fma(_436, _420, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _440 = _438 * _430;
    float _442 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[115].x, _440);
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _450 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[116].x, _442);
    float _452 = _444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _454 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _456 = _448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _458 = _450 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _460 = !_426;
    float _476;
    if (!_460)
    {
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _464 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _468 = _466 * _462;
        float _470 = floor(_468);
        float _472 = -_470;
        float _474 = _468 + _472;
        _476 = _474;
        _478 = true;
    }
    else
    {
        float _480 = float(_90);
        float _482 = 1.0 / _480;
        float _484 = _122 * _482;
        _476 = _484;
    }
    _478 = false;
    float _486 = _476;
    float _488 = in.m_51.w;
    float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _492 = in.m_53.x;
    float _494 = in.m_53.y;
    float _496 = in.m_53.z;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _504 = _502 != 0;
    float _506 = in.m_55.x;
    float _508 = in.m_55.y;
    float _510 = in.m_55.z;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _514 = _512 != 0;
    float _516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _520 = _518 != 0;
    float _522 = in.m_51.y;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _526 = _524 != 0;
    float _528 = _344 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _530 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _528);
    float _532 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _534 = 0.0;
    if (_504)
    {
        float _536 = in.m_51.z;
        _534 = _536;
    }
    float _538 = _534;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _542 = _488 > 0.5;
    float _544 = _344 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _546 = _344 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _548 = _492 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _550 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _544);
    float _552 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _546);
    float _554 = in.m_57.y;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _560;
    float _564 = _494 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _566 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _506);
    float _568 = 1.0 / _562;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _508);
    float _574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _510);
    float _576 = _496 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _578 = -_570;
    float _580 = fma(_532, 2.0, _578);
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _584 = 1.0 / _558;
    float _586 = _522 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _588 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].z, _530);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _592 = _486 + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _596 = _486 + _594;
    float _598 = _530;
    float _600 = _564;
    bool _602 = _542;
    if (!_526)
    {
        float _604 = in.m_51.z;
        _598 = _604;
    }
    float _606 = _598;
    float _608 = fma(_586, -2.0, _582);
    float _610 = _354 * _576;
    float _612 = _592 * _568;
    float _614 = -_554;
    float _616 = _614 + 1.0;
    float _618 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].z, _550);
    float _620 = _354 * _548;
    float _622 = _354 * _564;
    float _624 = _596 * _584;
    float _626 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].z, _552);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _636;
    int _640 = _542 ? as_type<int>(_616) : as_type<int>(_554);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _644 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _642;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _648 = fma(_630, _612, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _650 = fma(_634, _612, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _652 = fma(_638, _612, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _654 = _514 ? as_type<float>(_640) : _554;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _658 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _656;
    float _660 = -_644;
    float _662 = _660 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _664 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _646);
    float _666 = _554;
    float _668 = _624;
    if (!_526)
    {
        _600 = _522;
    }
    float _670 = _600;
    float _672 = _662 * _662;
    float _674 = _670;
    float _676 = _672;
    if (_500)
    {
        bool _678 = _146 > 0.5;
        _602 = _678;
    }
    bool _680 = _602;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _684 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _682;
    float _686 = _684;
    if (_526)
    {
        _674 = _146;
    }
    float _688 = _674;
    float _690 = -_658;
    float _692 = _690 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    if (_504)
    {
        bool _694 = _538 > 0.5;
        _358 = _694;
    }
    bool _696 = _358;
    float _698 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[78].w, _540);
    bool _700 = _522 > 0.5;
    float _702 = fma(_692, _692, _672);
    float _704 = -_684;
    float _706 = _704 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _708 = _606;
    if (!_526)
    {
        _676 = _606;
    }
    float _710 = _676;
    float _712 = _620 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _714 = _710;
    if (_526)
    {
        _714 = _522;
    }
    float _716 = _714;
    float _718 = _622 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_526)
    {
        _708 = _522;
    }
    float _720 = _708;
    float _722 = _490 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _724 = fma(_706, _706, _702);
    if (_520)
    {
        float _726 = _700 ? _616 : _554;
        _666 = _726;
    }
    float _728 = _666;
    float _730 = _712 * _566;
    bool _732 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _734 = isnan(_486);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _718 * _572;
    bool _746 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _748 = isnan(_486);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = sqrt(_724);
    float _760 = -_742;
    float _762 = _760 + 1.0;
    float _764 = in.m_57.x;
    float _766 = -_756;
    float _768 = _766 + 1.0;
    bool _770 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _772 = isnan(_486);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = _756 * _762;
    float _784 = _516 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _786 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _788 = fma(_654, _722, -0.5);
    float _790 = _780 * _768;
    float _792 = fma(_784, _728, -0.5);
    float _794 = _744 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _796 = _786 * _574;
    float _798 = _648 * _790;
    float _800 = _650 * _790;
    float _802 = fma(_758, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _804 = _744 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _806 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[24].x, _794);
    float _808 = _618 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _810 = _652 * _790;
    float _812 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[26].x, _804);
    float _814 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[24].z, _806);
    float _816 = _626 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _818 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[26].z, _812);
    float _820 = _814 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _824 = _818 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _830 = precise::max(_802, 0.3499999940395355224609375);
    float _832 = _808 + _820;
    float _834 = _816 + _824;
    float _836 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[83].z, _822);
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _842 = _688 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _844 = precise::min(_830, 1.0);
    float _846 = -_658;
    float _848 = _832 + _846;
    float _850 = -_684;
    float _852 = _834 + _850;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _862 = as_type<int>(_820);
    if (_500)
    {
        float _864 = -_764;
        float _866 = _864 + 1.0;
        _862 = as_type<int>(_866);
    }
    int _868 = _862;
    float _870 = -_838;
    float _872 = fma(_842, 2.0, _870);
    float _874 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[83].w, _840);
    float _876 = fma(_848, _844, _658);
    float _878 = fma(_852, _844, _684);
    float _880 = fma(_828, _624, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _882 = fma(_856, _624, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _884 = fma(_860, _624, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _886 = _876;
    float _888 = _878;
    if (!_500)
    {
        _668 = _764;
    }
    float _890 = _668;
    float _892 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _894 = _876 + _892;
    float _896 = _890;
    if (_500)
    {
        float _898 = _680 ? as_type<float>(_868) : _764;
        _896 = _898;
    }
    float _900 = _896;
    float _902 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _904 = _878 + _902;
    int _906 = 0;
    if (_504)
    {
        float _908 = -_764;
        float _910 = _908 + 1.0;
        _906 = as_type<int>(_910);
    }
    int _912 = _906;
    float _914 = _894 * _894;
    float _916 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _698);
    float _918 = _904 * _904;
    float _920 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _608);
    float _922 = _914;
    float _924 = _918;
    if (!_504)
    {
        _686 = _764;
    }
    float _926 = _686;
    float _928 = _744 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _930 = _914 + _918;
    float _932 = _926;
    if (_504)
    {
        float _934 = _696 ? as_type<float>(_912) : _764;
        _932 = _934;
    }
    float _936 = _932;
    float _938 = -_920;
    float _940 = fma(_916, _792, _938);
    float _942 = -_780;
    float _944 = _942 + 1.0;
    float _946 = sqrt(_930);
    float _948 = _716 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _950 = _588 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _952 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[123].x, _798);
    float _954 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[123].y, _800);
    float _956 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[123].z, _810);
    float _958 = fma(_730, (*spvDescriptorSet0.vp_c8)._m0[25].x, _928);
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _964 = fma(_882, _782, _954);
    float _966 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[25].z, _958);
    float _968 = fma(_948, -2.0, _960);
    float _970 = fma(_880, _782, _952);
    float _972 = fma(_884, _782, _956);
    float _974 = _966 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _976 = -_122;
    float _978 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[76].x, _580);
    float _980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _982 = _946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _984 = _950 + _974;
    float _986 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _836);
    float _988 = -_122;
    float _990 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[81].x, _872);
    float _992 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _874);
    float _994 = -_644;
    float _996 = _984 + _994;
    float _998 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _968);
    float _1000 = _962 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1002 = fma(_996, _844, _644);
    float _1004 = fma(_1000, _900, -0.5);
    float _1006 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _664);
    float _1008 = _992;
    if (!_982)
    {
        _126 = _1002;
    }
    float _1010 = _126;
    float _1012 = _980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1014 = fma(_1012, _936, -0.5);
    bool _1016 = !_982;
    float _1018 = _1010;
    if (!_1016)
    {
        float _1020 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1024 = _946 + _1022;
        float _1026 = _1002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1028 = rsqrt(_930);
        float _1030 = _1024 * _1020;
        float _1032 = _1030 * 0.15915493667125701904296875;
        float _1034 = _1032 * 6.283185482025146484375;
        float _1036 = sin(_1034);
        float _1038 = _1032 * 6.283185482025146484375;
        float _1040 = cos(_1038);
        float _1042 = fma(_1036, _1026, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1044 = _1028 * _1042;
        float _1046 = _1040 + (-1.0);
        float _1048 = fma(_894, _1044, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1050 = fma(_904, _1044, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1052 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1056 = _1048 + _1054;
        float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1060 = _1050 + _1058;
        float _1062 = fma(_1002, _1040, _1052);
        float _1064 = _1056 * _1056;
        float _1066 = _1060 * _1060;
        _1018 = _1062;
        _922 = _1064;
        _924 = _1066;
        _886 = _1048;
        _888 = _1050;
    }
    float _1068 = _1018;
    float _1070 = _922;
    float _1072 = _924;
    float _1074 = _886;
    float _1076 = _888;
    float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1080 = _1068 + _1078;
    float _1082 = in.m_59.w;
    float _1084 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[125].x, _970);
    float _1086 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[125].y, _964);
    float _1088 = fma(_1080, _1080, _1070);
    float _1090 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[125].z, _972);
    float _1092 = fma(_1006, _1004, _978);
    float _1094 = -_998;
    float _1096 = fma(_992, _788, _1094);
    float _1098 = _1088 + _1072;
    float _1100 = fma(_986, _1014, _990);
    float _1102 = _1084 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1104 = _1086 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1106 = _1090 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1108 = sqrt(_1098);
    float _1110 = _1096 + 0.5;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1114 = _940 + 0.5;
    float _1116 = _1092 + 0.5;
    float _1118 = _1100 + 0.5;
    float _1120 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1122 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1124 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_61.x = _452;
    out.m_61.y = _454;
    out.m_61.z = _456;
    out.m_61.w = _458;
    out.m_63.w = _1082;
    bool _1126 = _1108 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1128 = isnan(_1108);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1134 = _1130 || _1132;
    out.m_65.x = _1116;
    out.m_65.y = _1114;
    out.m_65.z = _1118;
    out.m_65.w = _1110;
    out.m_67.x = _1120;
    out.m_67.y = _1122;
    out.m_67.z = _1124;
    out.m_67.w = _1112;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1138 = _1122;
    float _1140 = _1124;
    if (!_1134)
    {
        _1136 = 1.0;
    }
    float _1142 = _1136;
    bool _1144 = !_1134;
    float _1146 = _1142;
    if (!_1144)
    {
        bool _1148 = _1108 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1150 = isnan(_1108);
        bool _1152 = _1148 || _1150;
        bool _1154 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1156 = _1152 || _1154;
        if (!_1156)
        {
            float _1158 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1160 = _1108 + _1158;
            float _1162 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1164 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1162;
            float _1166 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1168 = _1166 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1170 = 1.0 / _1164;
            float _1172 = _1160 * _1170;
            float _1174 = fma(_1172, _1168, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1146 = _1174;
            _1176 = true;
        }
        else
        {
            bool _1178 = _1108 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1180 = isnan(_1108);
            bool _1182 = _1178 || _1180;
            bool _1184 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1186 = _1182 || _1184;
            if (!_1186)
            {
                float _1188 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1190 = _1108 + _1188;
                float _1192 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1194 = _1192 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1196 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1198 = _1196 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1200 = 1.0 / _1194;
                float _1202 = _1190 * _1200;
                float _1204 = fma(_1202, _1198, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1146 = _1204;
                _1176 = true;
            }
            else
            {
                _1146 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1176 = false;
    float _1206 = _1146;
    float _1208 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1210 = _1068 + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1214 = _1074 + _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1218 = _1076 + _1216;
    float _1220 = fma(_1210, _1206, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1222 = fma(_1214, _1206, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1224 = fma(_1218, _1206, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1228 = _1220 + _1226;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1232 = _1222 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1236 = _1224 + _1234;
    float _1238 = _1228 * _1228;
    float _1240 = fma(_1232, _1232, _1238);
    float _1242 = fma(_1236, _1236, _1240);
    float _1244 = rsqrt(_1242);
    float _1246 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1248 = _1232 * _1246;
    float _1250 = _1236 * _1246;
    float _1252 = _1248 * _1248;
    float _1254 = _1250 * _1250;
    float _1256 = _1252 + _1254;
    float _1258 = sqrt(_1256);
    bool _1260 = _1258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = _1258 + _1262;
    float _1266 = _1236;
    float _1268 = _1264;
    float _1270 = _1228;
    float _1272 = _1248;
    if (_1260)
    {
        float _1274 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1266 = _1274;
    }
    float _1276 = _1266;
    if (_1260)
    {
        float _1278 = rsqrt(_1256);
        _1138 = _1278;
    }
    float _1280 = _1138;
    float _1282 = _1280;
    if (_1260)
    {
        float _1284 = _1264 * _1276;
        _1268 = _1284;
    }
    float _1286 = _1268;
    if (_1260)
    {
        float _1288 = _1286 * 0.15915493667125701904296875;
        _1140 = _1288;
    }
    float _1290 = _1140;
    float _1292 = _1244;
    if (_1260)
    {
        float _1294 = _1290 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        _1292 = _1296;
    }
    float _1298 = _1292;
    float _1300 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1302 = precise::max(0.0, _1300);
    float _1304 = _1120;
    float _1306 = _1302;
    float _1308 = _1300;
    if (_1260)
    {
        float _1310 = _1290 * 6.283185482025146484375;
        float _1312 = cos(_1310);
        _1304 = _1312;
    }
    float _1314 = _1304;
    float _1316 = -_1246;
    float _1318 = -_1302;
    float _1320 = fma(_1228, _1316, _1318);
    if (!_1260)
    {
        _1270 = _1250;
    }
    float _1322 = _1270;
    float _1324 = _1322;
    if (_1260)
    {
        float _1326 = _1320 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1306 = _1326;
    }
    float _1328 = _1306;
    float _1330 = sqrt(_1242);
    float _1332 = _1298;
    float _1334 = _1328;
    if (_1260)
    {
        float _1336 = fma(_1298, _1328, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1332 = _1336;
    }
    float _1338 = _1332;
    float _1340 = _1338;
    if (!_1260)
    {
        _1334 = _1252;
    }
    float _1342 = _1334;
    float _1344 = _1342;
    if (_1260)
    {
        float _1346 = _1314 + (-1.0);
        _1308 = _1346;
    }
    float _1348 = _1308;
    float _1350 = _1348;
    if (_1260)
    {
        float _1352 = _1280 * _1338;
        _1008 = _1352;
    }
    float _1354 = _1008;
    if (!_1260)
    {
        _1340 = _1320;
    }
    float _1356 = _1340;
    float _1358 = _1356;
    if (_1260)
    {
        float _1360 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1282 = _1360;
    }
    float _1362 = _1282;
    if (_1260)
    {
        float _1364 = _1248 * _1354;
        _1272 = _1364;
    }
    float _1366 = _1272;
    if (_1260)
    {
        float _1368 = _1250 * _1354;
        _1324 = _1368;
    }
    float _1370 = _1324;
    if (!_1260)
    {
        _1350 = _1254;
    }
    float _1372 = _1350;
    float _1374 = _1372;
    if (_1260)
    {
        float _1376 = fma(_1320, _1314, _1362);
        _1358 = _1376;
    }
    float _1378 = _1358;
    if (_1260)
    {
        float _1380 = _1366 * _1366;
        _1344 = _1380;
    }
    float _1382 = _1344;
    if (_1260)
    {
        float _1384 = _1370 * _1370;
        _1374 = _1384;
    }
    float _1386 = _1374;
    float _1388 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1390 = fma(_1378, _1378, _1382);
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1394 = fma(_1330, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1392);
    float _1396 = precise::clamp(_1394, 0.0, 1.0);
    float _1398 = _1390 + _1386;
    float _1400 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1402 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1404 = -_1396;
    float _1406 = _1404 + 1.0;
    float _1408 = rsqrt(_1398);
    float _1410 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1400);
    float _1412 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1414 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1416 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1388);
    float _1418 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1410);
    float _1420 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1412);
    float _1422 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1414);
    float _1424 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1416);
    float _1426 = _1418 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1428 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1420);
    float _1430 = abs(_1406);
    float _1432 = log2(_1430);
    float _1434 = _1424 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1436 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1438 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1440 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1422);
    float _1442 = _1408 * _1366;
    float _1444 = _1408 * _1378;
    float _1446 = _1438 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1448 = _1408 * _1370;
    float _1450 = _1442 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1452 = -_1436;
    float _1454 = fma(_1452, _1402, 1.0);
    float _1456 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1446);
    float _1458 = _1440 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1460 = -_1450;
    float _1462 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1460);
    float _1464 = _1438 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1466 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1456);
    float _1468 = _1432 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1470 = -_1448;
    float _1472 = fma(_1470, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1462);
    float _1474 = log2(_1454);
    float _1476 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1466);
    float _1478 = _1438 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1480 = fma(_1472, -0.5, 0.5);
    float _1482 = fma(_1472, 0.5, 0.5);
    float _1484 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1464);
    float _1486 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1478);
    float _1488 = exp2(_1468);
    float _1490 = fma(_1482, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1492 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1484);
    float _1494 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1486);
    float _1496 = _1444 + 1.0;
    float _1498 = fma(_1482, _1490, -0.212114393711090087890625);
    float _1500 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1492);
    float _1502 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1494);
    float _1504 = 1.0 / _1476;
    float _1506 = _1474 * 0.693147182464599609375;
    float _1508 = fma(_1482, _1498, 1.570728778839111328125);
    float _1510 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1512 = sqrt(_1480);
    float _1514 = -_1444;
    float _1516 = fma(_1488, _1496, _1514);
    float _1518 = fma(_1516, 0.5, 0.5);
    float _1520 = _1500 * _1504;
    float _1522 = _1502 * _1504;
    float _1524 = fma(_1520, 0.5, 0.5);
    float _1526 = fma(_1522, -0.5, 0.5);
    float _1528 = _1512 * 0.636619746685028076171875;
    float _1530 = -_1508;
    float _1532 = fma(_1528, _1530, 1.0);
    float3 _4159 = float3(_1524, _1526, _1510);
    float _1534 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4159, float3(0.0), isnan(_4159)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4159, float3(0.0), isnan(_4159)), level(0.0)).x;
    float3 _4170 = float3(_1524, _1526, _1510);
    float4 _1537 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4170, float3(0.0), isnan(_4170)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4170, float3(0.0), isnan(_4170)), level(0.0)).xyzw;
    float _1539 = _1537.x;
    float _1541 = _1537.y;
    float _1543 = _1537.z;
    float _1545 = _1537.w;
    float2 _4187 = float2(_1532, _1518);
    float3 _1549 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4187, float2(0.0), isnan(_4187)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4187, float2(0.0), isnan(_4187)), level(0.0)).xyz;
    float _1551 = _1549.x;
    float _1553 = _1549.y;
    float _1555 = _1549.z;
    float _1557 = _950 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1559 = _1432 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1561 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1557);
    float _1563 = _950 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1565 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1561);
    float _1567 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1563);
    bool _1569 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1571 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan(0.5);
    bool _1577 = _1573 || _1575;
    float _1579 = exp2(_1559);
    float _1581 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1583 = fma(_816, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1567);
    float _1585 = _1438 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1587 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1589 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1585);
    float _1591 = 1.0 / _1581;
    float _1593 = _1587 + _1581;
    float _1595 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1589);
    float _1597 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1595);
    float _1599 = _1593 * _1591;
    float _1601 = _1599 * 0.5;
    float _1603 = _1593;
    if (_1577)
    {
        _1603 = 1.0;
    }
    float _1605 = _1603;
    float _1607 = _1605;
    if (!_1577)
    {
        float _1609 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1611 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1613 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1611);
        float _1615 = _1609 * 0.15915493667125701904296875;
        float _1617 = _1615 * 6.283185482025146484375;
        float _1619 = cos(_1617);
        float _1621 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1623 = _1621 * 0.15915493667125701904296875;
        float _1625 = _1615 * 6.283185482025146484375;
        float _1627 = sin(_1625);
        float _1629 = 1.0 / _1619;
        float _1631 = _1623 * 6.283185482025146484375;
        float _1633 = cos(_1631);
        float _1635 = _1627 * _1629;
        float _1637 = 1.0 / _1613;
        float _1639 = _1633 * _1635;
        float _1641 = _1623 * 6.283185482025146484375;
        float _1643 = sin(_1641);
        float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1647 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1645;
        float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1651 = _1637 * _1649;
        float _1653 = 1.0 / _1639;
        float _1655 = 1.0 / _1647;
        float _1657 = _1643 * _1653;
        float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1661 = fma(_1657, _1651, _1659);
        float _1663 = _1661 * _1655;
        float _1665 = precise::clamp(_1663, 0.0, 1.0);
        float _1667 = -_1665;
        float _1669 = _1667 + 1.0;
        _1607 = _1669;
    }
    float _1671 = _1607;
    float _1673 = _1476 * 0.5;
    float _1675 = -_1579;
    float _1677 = _1675 + 1.0;
    bool _1679 = _1671 > 0.0;
    bool _1681 = isnan(_1671);
    bool _1683 = _1679 || _1681;
    bool _1685 = isnan(0.0);
    bool _1687 = _1683 || _1685;
    float _1689 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1691 = fma(_1502, -0.5, _1673);
    float _1693 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1695 = _1597 + _1476;
    float _1697 = _1500 + _1476;
    out.gl_Position.x = _1500;
    out.gl_Position.y = _1502;
    out.gl_Position.z = _1597;
    out.gl_Position.w = _1476;
    float _1699 = _1693 * _1534;
    float _1701 = -_1693;
    float _1703 = _1701 + 1.0;
    float _1705 = _1695 * 0.5;
    float _1707 = _1545 * _1699;
    float _1709 = _1555 * _1699;
    float _1711 = _1697 * 0.5;
    float _1713 = _1689 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1715 = fma(_1551, _1707, _1539);
    float _1717 = fma(_1553, _1707, _1541);
    float _1719 = _1545 * _1703;
    float _1721 = fma(_1545, _1709, _1543);
    out.m_69.x = _1711;
    out.m_69.y = _1691;
    out.m_69.z = _1705;
    out.m_69.w = _1476;
    out.m_47.x = _1713;
    out.m_71.x = _1715;
    out.m_71.y = _1717;
    out.m_71.z = _1721;
    out.m_71.w = _1719;
    if (_1687)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1723 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1723;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

