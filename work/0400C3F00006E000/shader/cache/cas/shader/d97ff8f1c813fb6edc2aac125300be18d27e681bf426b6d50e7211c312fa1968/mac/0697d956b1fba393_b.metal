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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    sampler vp_t_tcb_24Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_57 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
    float4 m_55 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(0)]];
    float4 m_39 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1246 = false;
    bool _882 = false;
    bool _182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_39.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_42.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1530 = as_type<float>(_104);
        out.gl_Position.z = _1530;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _106 = in.m_44.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_88);
        _98 = _122;
    }
    float _124 = _98;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_42.x = 0.0;
    }
    int _136 = 0;
    if (_130)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1599 = as_type<float>(_140);
        out.gl_Position.z = _1599;
    }
    if (_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = as_type<float>(int(gl_VertexIndex));
    bool _144 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _146 = as_type<int>(_142) & 1;
    bool _148 = _146 != 0;
    int _150 = as_type<int>(_142) & 2;
    bool _152 = _150 != 0;
    bool _154 = !_148;
    float _156 = _154 ? (-0.5) : 0.5;
    bool _158 = !_152;
    float _160 = _158 ? (-0.5) : 0.5;
    bool _162 = !_144;
    float _180;
    if (!_162)
    {
        float _164 = in.m_49.x;
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _170 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _172 = _170 * _166;
        float _174 = floor(_172);
        float _176 = -_174;
        float _178 = _172 + _176;
        _180 = _178;
        _182 = true;
    }
    else
    {
        float _184 = float(_88);
        float _186 = 1.0 / _184;
        float _188 = _120 * _186;
        _180 = _188;
    }
    _182 = false;
    float _190 = _180;
    float _192 = in.m_39.x;
    float _194 = in.m_39.y;
    float _196 = in.m_39.z;
    float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _200 = in.m_49.x;
    float _202 = in.m_49.y;
    float _204 = in.m_49.z;
    float _206 = in.m_49.w;
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _210 = _208 != 0;
    float _212 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _216 = _214 != 0;
    float _218 = in.m_51.x;
    float _220 = in.m_51.y;
    float _222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _226 = _224 != 0;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _230 = _228 != 0;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _234 = _194 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _236 = _222 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _238 = _206 > 0.5;
    float _240 = _194 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _242 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[5].x, _234);
    float _244 = _194 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _246 = _200 > 0.5;
    float _248 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[4].x, _240);
    float _250 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[5].z, _242);
    float _252 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[6].x, _244);
    float _254 = -_156;
    int _256 = _246 ? as_type<int>(_254) : as_type<int>(_156);
    float _258 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[4].z, _248);
    float _260 = _250 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _262 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[6].z, _252);
    bool _264 = !_210;
    float _266 = _264 ? _156 : as_type<float>(_256);
    float _268 = _258 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _270 = -_260;
    float _272 = _270 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _274 = _262 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _276 = -_268;
    float _278 = _276 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _280 = _272 * _272;
    float _282 = -_274;
    float _284 = _282 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _286 = _202 > 0.5;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _290 = _288 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _292 = fma(_278, _278, _280);
    float _294 = _218 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _296 = 1.0 / _290;
    float _298 = fma(_284, _284, _292);
    float _300 = _294 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _302 = _204 > 0.5;
    float _304 = _220 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _306 = 0.0;
    if (!_216)
    {
        _306 = _204;
    }
    float _308 = _306;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _312 = rsqrt(_298);
    float _314 = _200 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _316 = 0.0;
    float _318 = _308;
    if (!_216)
    {
        _316 = _204;
    }
    float _320 = _316;
    float _322 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[78].w, _310);
    float _324 = -_160;
    int _326 = _286 ? as_type<int>(_324) : as_type<int>(_160);
    float _328 = -_232;
    float _330 = fma(_314, 2.0, _328);
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _334 = _332 != 0;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _338 = 0.0;
    float _340 = _320;
    if (!_216)
    {
        _338 = _202;
    }
    float _342 = _338;
    float _344 = _202 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _346 = !_226;
    float _348 = _346 ? _160 : as_type<float>(_326);
    float _350 = _304 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _352 = _342;
    if (_216)
    {
        _352 = _200;
    }
    float _354 = _352;
    float _356 = fma(_344, -2.0, _336);
    if (_216)
    {
        _318 = _202;
    }
    float _358 = _318;
    if (_216)
    {
        _340 = _202;
    }
    float _360 = _340;
    float _362 = _278 * _312;
    int _364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _366 = _364 != 0;
    int _368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _370 = _368 != 0;
    float _372 = _284 * _312;
    float _374 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _376 = _362 * _374;
    float _378 = _272 * _312;
    float _380 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _382 = _372 * _380;
    float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _388 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _390 = -_376;
    float _392 = fma(_372, _388, _390);
    float _394 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _396 = -_382;
    float _398 = fma(_378, _394, _396);
    float _400 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _402 = _378 * _400;
    float _404 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[78].z, _386);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _406;
    float _410 = _392 * _392;
    float _412 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _156);
    float _414 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _160);
    float _416 = _408 * _296;
    float _418 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _420 = -_402;
    float _422 = fma(_362, _418, _420);
    float _424 = fma(_398, _398, _410);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _428 = _190 + _426;
    float _430 = _300 * _412;
    bool _432 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _434 = isnan(_190);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = fma(_422, _422, _424);
    float _446 = fma(_416, _428, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _448 = _198 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _450 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _452 = isnan(_190);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = _384 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _464 = rsqrt(_444);
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _468 = -_442;
    float _470 = _468 + 1.0;
    float _472 = -_120;
    float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[76].x, _330);
    float _476 = _266 + 0.5;
    float _478 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _356);
    float _480 = _348 + (-0.5);
    float _482 = _350 * _414;
    float _484 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[83].w, _466);
    float _486 = _460 * _470;
    float _488 = fma(_448, _476, _474);
    float _490 = -_462;
    float _492 = -_478;
    float _494 = fma(_490, _480, _492);
    float _496 = _446 * _486;
    float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _500 = _398 * _464;
    float _502 = _392 * _464;
    float _504 = _422 * _464;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _508 = _378 * _500;
    float _510 = _372 * _502;
    float _512 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[83].z, _506);
    float _514 = -_508;
    float _516 = fma(_362, _502, _514);
    float _518 = -_510;
    float _520 = fma(_378, _504, _518);
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _524 = _358 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _526 = _482 * _516;
    float _528 = _482 * _520;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _532 = _354 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _534 = fma(_430, _504, _526);
    float _536 = fma(_430, _500, _528);
    float _538 = -_156;
    int _540 = _302 ? as_type<int>(_538) : as_type<int>(_156);
    float _542 = -_530;
    float _544 = fma(_532, 2.0, _542);
    float _546 = fma(_212, _372, _534);
    float _548 = fma(_212, _362, _536);
    float _550 = fma(_524, -2.0, _522);
    float _552 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _484);
    float _554 = _274 + _546;
    float _556 = _268 + _548;
    float _558 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _322);
    float _560 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _512);
    float _562 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _564 = _554 + _562;
    float _566 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _568 = _556 + _566;
    float _570 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _404);
    float _572 = -_120;
    float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[81].x, _544);
    float _576 = _564 * _564;
    float _578 = _568 * _568;
    float _580 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _550);
    bool _582 = !_334;
    float _584 = _582 ? _156 : as_type<float>(_540);
    float _586 = _362 * _504;
    float _588 = _578 + _576;
    float _590 = -_160;
    int _592 = _238 ? as_type<int>(_590) : as_type<int>(_160);
    float _594 = -_460;
    float _596 = _594 + 1.0;
    float _598 = _498 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _600 = sqrt(_588);
    bool _602 = !_230;
    float _604 = _602 ? _160 : as_type<float>(_592);
    float _606 = _584 + 0.5;
    float _608 = -_586;
    float _610 = fma(_372, _500, _608);
    float _612 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[115].x, _496);
    float _614 = _604 + (-0.5);
    float _616 = fma(_598, _606, _574);
    float _618 = _482 * _610;
    float _620 = -_160;
    int _622 = _302 ? as_type<int>(_620) : as_type<int>(_160);
    float _624 = -_236;
    float _626 = -_580;
    float _628 = fma(_624, _614, _626);
    float _630 = -_156;
    int _632 = _286 ? as_type<int>(_630) : as_type<int>(_156);
    float _634 = fma(_430, _502, _618);
    bool _636 = !_370;
    float _638 = _636 ? _160 : as_type<float>(_622);
    float _640 = _160 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _642 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[116].x, _612);
    bool _644 = _600 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _646 = _156 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _648 = !_366;
    float _650 = _648 ? _156 : as_type<float>(_632);
    float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _654 = _640 * _520;
    float _656 = fma(_212, _378, _634);
    float _658 = _640 * _610;
    float _660 = _640 * _516;
    float _662 = fma(_646, _500, _654);
    float _664 = _260 + _656;
    float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _668 = _654;
    float _670 = _640;
    float _672 = _664;
    float _674 = _576;
    float _676 = _554;
    float _678 = _372;
    if (!_644)
    {
        _668 = _578;
    }
    float _680 = _668;
    float _682 = _680;
    if (!_644)
    {
        _670 = _556;
    }
    float _684 = _670;
    bool _686 = !_644;
    float _688 = _684;
    if (!_686)
    {
        float _690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _694 = _600 + _692;
        float _696 = rsqrt(_588);
        float _698 = _694 * _690;
        float _700 = _664 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _702 = _698 * 0.15915493667125701904296875;
        float _704 = _702 * 6.283185482025146484375;
        float _706 = sin(_704);
        float _708 = _702 * 6.283185482025146484375;
        float _710 = cos(_708);
        float _712 = fma(_706, _700, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _714 = _696 * _712;
        float _716 = fma(_568, _714, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _718 = _710 + (-1.0);
        float _720 = fma(_564, _714, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _722 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _724 = _716 + _722;
        float _726 = _718 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _728 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _730 = _720 + _728;
        float _732 = _724 * _724;
        float _734 = fma(_664, _710, _726);
        float _736 = _730 * _730;
        _672 = _734;
        _682 = _732;
        _674 = _736;
        _676 = _720;
        _688 = _716;
    }
    float _738 = _672;
    float _740 = _682;
    float _742 = _674;
    float _744 = _676;
    float _746 = _688;
    float _748 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _750 = _738 + _748;
    float _752 = -_570;
    float _754 = _752 + 1.0;
    float _756 = -_558;
    float _758 = _756 + 1.0;
    float _760 = -_560;
    float _762 = _760 + 1.0;
    float _764 = fma(_750, _750, _740);
    float _766 = -_552;
    float _768 = _766 + 1.0;
    float _770 = -_754;
    float _772 = fma(_266, _770, _488);
    float _774 = fma(_348, _758, _494);
    float _776 = _764 + _742;
    float _778 = fma(_646, _502, _658);
    float _780 = -_762;
    float _782 = fma(_584, _780, _616);
    float _784 = fma(_604, _768, _628);
    float _786 = _650 + 0.5;
    float _788 = -_638;
    float _790 = _788 + 0.5;
    float _792 = sqrt(_776);
    float _794 = _786 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _796 = _790 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _798 = fma(_646, _504, _660);
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _812 = _794 * _652;
    float _814 = _796 * _666;
    float _816 = _362 + _662;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _820 = _800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _822 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _824 = _806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _826 = _808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _828 = _810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _830 = _804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _832 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _834 = _378 + _778;
    float _836 = _372 + _798;
    out.m_53.x = _824;
    out.m_53.y = _826;
    out.m_53.z = _828;
    out.m_53.w = _818;
    bool _838 = _792 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _840 = isnan(_792);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _846 = _842 || _844;
    out.m_55.x = _812;
    out.m_55.y = _814;
    out.m_57.x = _820;
    out.m_57.y = _822;
    out.m_57.z = _830;
    out.m_57.w = _832;
    out.m_59.x = _772;
    out.m_59.y = _774;
    out.m_59.z = _782;
    out.m_59.w = _784;
    if (!_846)
    {
        _678 = 1.0;
    }
    float _848 = _678;
    out.m_61.x = _816;
    out.m_61.y = _834;
    out.m_61.z = _836;
    bool _850 = !_846;
    float _852 = _848;
    if (!_850)
    {
        bool _854 = _792 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _856 = isnan(_792);
        bool _858 = _854 || _856;
        bool _860 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _862 = _858 || _860;
        if (!_862)
        {
            float _864 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _866 = _792 + _864;
            float _868 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _870 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _868;
            float _872 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _874 = _872 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _876 = 1.0 / _870;
            float _878 = _866 * _876;
            float _880 = fma(_878, _874, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _852 = _880;
            _882 = true;
        }
        else
        {
            bool _884 = _792 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _886 = isnan(_792);
            bool _888 = _884 || _886;
            bool _890 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _892 = _888 || _890;
            if (!_892)
            {
                float _894 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _896 = _792 + _894;
                float _898 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _900 = _898 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _902 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _904 = _902 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _906 = 1.0 / _900;
                float _908 = _896 * _906;
                float _910 = fma(_908, _904, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _852 = _910;
                _882 = true;
            }
            else
            {
                _852 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _882 = false;
    float _912 = _852;
    float _914 = fma(_268, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _916 = fma(_274, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _918 = floor(_914);
    float _920 = floor(_916);
    float _922 = -_918;
    float _924 = _914 + _922;
    float _926 = -_920;
    float _928 = _916 + _926;
    float2 _2957 = float2(_924, _928);
    float _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2957, float2(0.0), isnan(_2957)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2957, float2(0.0), isnan(_2957)), level(0.0)).x;
    float _932 = _260 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _934 = _260 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _936 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _938 = _744 + _936;
    float _940 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[11].x, _932);
    float _942 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[10].x, _934);
    float _944 = fma(_274, (*spvDescriptorSet0.vp_c8)._m0[11].z, _940);
    float _946 = fma(_274, (*spvDescriptorSet0.vp_c8)._m0[10].z, _942);
    float _948 = _944 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _950 = _946 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _952 = 1.0 / _948;
    float _954 = _950 + _948;
    float _956 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _958 = _738 + _956;
    float _960 = fma(_958, _912, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _962 = _954 * _952;
    float _964 = _962 * 0.5;
    float _966 = _960 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _968 = _960 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _970 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _972 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[30].w, _970);
    float _974 = 1.0 / _972;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _978 = _974 * _976;
    float _980 = abs(_978);
    float _982 = log2(_980);
    bool _984 = _978 <= 8000.0;
    bool _986 = isnan(_978);
    bool _988 = _984 || _986;
    bool _990 = isnan(8000.0);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = _982 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _998 = exp2(_996);
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1002 = precise::clamp(_1000, 0.0, 1.0);
    float _1004 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1006 = _746 + _1004;
    float _1008 = fma(_1002, -2.0, 3.0);
    float _1010 = _1002 * _1002;
    float _1012 = fma(_1006, _912, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1014 = fma(_938, _912, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1016 = _1010 * _1008;
    float _1018 = _960 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1020 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[1].x, _966);
    float _1022 = _960 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1024 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[2].x, _968);
    float _1026 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1018);
    float _1028 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1020);
    float _1030 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1022);
    float _1032 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1024);
    float _1034 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1026);
    float _1036 = _1028 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1038 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1030);
    float _1040 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1042 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1044 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1046 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1048 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1050 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1052 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1044);
    float _1054 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1046);
    float _1056 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1048);
    float _1058 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1060 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1052);
    float _1062 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1054);
    float _1064 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1050);
    float _1066 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1056);
    float _1068 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1060);
    float _1070 = -_1016;
    float _1072 = _1070 + 1.0;
    float _1074 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1062);
    float _1076 = in.m_63.x;
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1080 = _960 + _1078;
    float _1082 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1016);
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1012 + _1084;
    float _1088 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1064);
    float _1090 = _1080 * _1080;
    float _1092 = _994 * _1082;
    float _1094 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1066);
    float _1096 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1088);
    float _1098 = fma(_1086, _1086, _1090);
    float _1100 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1102 = _1014 + _1100;
    float _1104 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1074;
    out.gl_Position.y = _1068;
    out.gl_Position.z = _1094;
    out.gl_Position.w = _1096;
    float _1106 = fma(_1102, _1102, _1098);
    float _1108 = sqrt(_1106);
    bool _1110 = _1108 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1112 = isnan(_1108);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1118 = _1114 || _1116;
    float _1120 = _1074;
    float _1122 = _1068;
    float _1124 = _1102;
    float _1126 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_1118)
    {
        _1120 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1128 = _1120;
    float _1130 = _1128;
    float _1132 = _1128;
    if (!_1118)
    {
        _1122 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1134 = _1122;
    float _1136 = _1134;
    float _1138 = _1134;
    if (!_1118)
    {
        _1124 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1140 = _1124;
    float _1142 = -_930;
    float _1144 = _1142 + 1.0;
    float _1146 = _1144 * _1104;
    float _1148 = precise::clamp(_1146, 0.0, 1.0);
    float _1150 = -_1148;
    float _1152 = fma(_1150, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1154 = _1140;
    float _1156 = _1140;
    if (!_1118)
    {
        _1126 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1158 = _1126;
    float _1160 = _1152 * _1076;
    float _1162 = _1076;
    float _1164 = _1160;
    float _1166 = _1158;
    float _1168 = _1158;
    if (!_1118)
    {
        _1162 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1170 = _1162;
    float _1172 = _1160 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1174 = _1170;
    float _1176 = _1170;
    if (!_1118)
    {
        _1164 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1178 = _1164;
    out.m_65.x = _1172;
    bool _1180 = !_1118;
    float _1182 = _1178;
    float _1184 = _1178;
    if (!_1180)
    {
        bool _1186 = _1108 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1188 = isnan(_1108);
        bool _1190 = _1186 || _1188;
        bool _1192 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1194 = _1190 || _1192;
        if (!_1194)
        {
            float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1198 = _1108 + _1196;
            float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1202 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1200;
            float _1204 = 1.0 / _1202;
            float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1208 = _1206 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1212 = _1210 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1214 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1216 = _1214 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1220 = _1218 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1222 = _1198 * _1204;
            float _1224 = precise::clamp(_1222, 0.0, 1.0);
            float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1228 = _1226 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1232 = _1230 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1234 = fma(_1224, _1208, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1236 = fma(_1224, _1228, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1238 = fma(_1224, _1232, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1240 = fma(_1224, _1212, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1242 = fma(_1224, _1216, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1244 = fma(_1224, _1220, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1138 = _1234;
            _1156 = _1242;
            _1132 = _1236;
            _1168 = _1240;
            _1176 = _1238;
            _1184 = _1244;
            _1246 = true;
        }
        else
        {
            bool _1248 = _1108 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1250 = isnan(_1108);
            bool _1252 = _1248 || _1250;
            bool _1254 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1256 = _1252 || _1254;
            if (!_1256)
            {
                _1130 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1258 = _1130;
            _1132 = _1258;
            if (!_1256)
            {
                _1136 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1260 = _1136;
            _1138 = _1260;
            if (!_1256)
            {
                _1174 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1262 = _1174;
            _1176 = _1262;
            if (!_1256)
            {
                _1166 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1264 = _1166;
            _1168 = _1264;
            if (!_1256)
            {
                _1154 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1266 = _1154;
            _1156 = _1266;
            if (!_1256)
            {
                _1182 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1268 = _1182;
            bool _1270 = !_1256;
            _1184 = _1268;
            if (!_1270)
            {
                bool _1272 = _1108 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1274 = isnan(_1108);
                bool _1276 = _1272 || _1274;
                bool _1278 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1280 = _1276 || _1278;
                if (!_1280)
                {
                    float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1284 = _1108 + _1282;
                    float _1286 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1288 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1286;
                    float _1290 = 1.0 / _1288;
                    float _1292 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1294 = _1292 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1296 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1298 = _1296 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1300 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1302 = _1300 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1304 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1306 = _1304 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1308 = _1284 * _1290;
                    float _1310 = precise::clamp(_1308, 0.0, 1.0);
                    float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1314 = _1312 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1316 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1318 = _1316 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1320 = fma(_1310, _1294, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1322 = fma(_1310, _1314, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1324 = fma(_1310, _1318, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1326 = fma(_1310, _1298, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1328 = fma(_1310, _1302, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1330 = fma(_1310, _1306, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1138 = _1320;
                    _1156 = _1328;
                    _1132 = _1322;
                    _1168 = _1326;
                    _1176 = _1324;
                    _1184 = _1330;
                    _1246 = true;
                }
                else
                {
                    _1138 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1156 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1132 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1168 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1176 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1184 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1246 = false;
    float _1332 = _1138;
    float _1334 = _1156;
    float _1336 = _1132;
    float _1338 = _1168;
    float _1340 = _1176;
    float _1342 = _1184;
    float _1344 = fma(_834, -0.5, 0.5);
    float _1346 = precise::clamp(_1344, 0.0, 1.0);
    float _1348 = -_1332;
    float _1350 = _1348 + _1334;
    float _1352 = -_1336;
    float _1354 = _1352 + _1338;
    float _1356 = -_1340;
    float _1358 = _1356 + _1342;
    bool _1360 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1362 = fma(_1346, _1350, _1332);
    float _1364 = fma(_1346, _1354, _1336);
    float _1366 = fma(_1346, _1358, _1340);
    float _1368 = _1362 * 0.586610972881317138671875;
    out.m_67.x = 0.0;
    float _1370 = fma(_1364, 0.298911988735198974609375, _1368);
    out.m_42.x = 1.0;
    float _1372 = fma(_1366, 0.114477999508380889892578125, _1370);
    float _1374 = -_1372;
    float _1376 = _1364 + _1374;
    float _1378 = -_1372;
    float _1380 = _1362 + _1378;
    float _1382 = -_1372;
    float _1384 = _1366 + _1382;
    float _1386 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1388 = fma(_1376, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1372);
    float _1390 = fma(_1380, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1372);
    float _1392 = fma(_1384, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1372);
    out.m_65.w = _1386;
    out.m_69.x = _1388;
    out.m_69.y = _1390;
    out.m_69.z = _1392;
    if (!_1360)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1394 = -_960;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1398 = -_1012;
    float _1400 = _1398 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1402 = -_1014;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1406 = _1396 * _1396;
    float _1408 = fma(_1400, _1400, _1406);
    float _1410 = fma(_1404, _1404, _1408);
    float _1412 = sqrt(_1410);
    float _1414 = rsqrt(_1410);
    float _1416 = -_1412;
    float _1418 = _1416 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1420 = _1418 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1422 = precise::clamp(_1420, 0.0, 1.0);
    float _1424 = _1400 * _1414;
    float _1426 = _1396 * _1414;
    float _1428 = abs(_1422);
    float _1430 = log2(_1428);
    float _1432 = _1404 * _1414;
    float _1434 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1436 = _834 * _1426;
    float _1438 = -_1426;
    float _1440 = -_1434;
    float _1442 = fma(_1438, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1440);
    float _1444 = fma(_816, _1424, _1436);
    float _1446 = -_1432;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1442);
    float _1450 = fma(_836, _1432, _1444);
    float _1452 = precise::clamp(_1450, 0.0, 1.0);
    float _1454 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1456 = _1448 + _1454;
    float _1458 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1460 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1462 = precise::clamp(_1460, 0.0, 1.0);
    float _1464 = exp2(_1458);
    float _1466 = _1464 * _1462;
    float _1468 = _1452 * _1466;
    float _1470 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1472 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1474 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_67.x = _1470;
    out.m_67.y = _1472;
    out.m_67.z = _1474;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1246 = false;
    bool _882 = false;
    bool _182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_39.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_42.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1530 = as_type<float>(_104);
        out.gl_Position.z = _1530;
    }
    if (!_92)
    {
        return out;
    }
    float _106 = in.m_44.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_88);
        _98 = _122;
    }
    float _124 = _98;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_42.x = 0.0;
    }
    int _136 = 0;
    if (_130)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1599 = as_type<float>(_140);
        out.gl_Position.z = _1599;
    }
    if (_130)
    {
        return out;
    }
    float _142 = as_type<float>(int(gl_VertexIndex));
    bool _144 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _146 = as_type<int>(_142) & 1;
    bool _148 = _146 != 0;
    int _150 = as_type<int>(_142) & 2;
    bool _152 = _150 != 0;
    bool _154 = !_148;
    float _156 = _154 ? (-0.5) : 0.5;
    bool _158 = !_152;
    float _160 = _158 ? (-0.5) : 0.5;
    bool _162 = !_144;
    float _180;
    if (!_162)
    {
        float _164 = in.m_49.x;
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _170 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _172 = _170 * _166;
        float _174 = floor(_172);
        float _176 = -_174;
        float _178 = _172 + _176;
        _180 = _178;
        _182 = true;
    }
    else
    {
        float _184 = float(_88);
        float _186 = 1.0 / _184;
        float _188 = _120 * _186;
        _180 = _188;
    }
    _182 = false;
    float _190 = _180;
    float _192 = in.m_39.x;
    float _194 = in.m_39.y;
    float _196 = in.m_39.z;
    float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _200 = in.m_49.x;
    float _202 = in.m_49.y;
    float _204 = in.m_49.z;
    float _206 = in.m_49.w;
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _210 = _208 != 0;
    float _212 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _216 = _214 != 0;
    float _218 = in.m_51.x;
    float _220 = in.m_51.y;
    float _222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _226 = _224 != 0;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _230 = _228 != 0;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _234 = _194 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _236 = _222 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _238 = _206 > 0.5;
    float _240 = _194 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _242 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[5].x, _234);
    float _244 = _194 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _246 = _200 > 0.5;
    float _248 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[4].x, _240);
    float _250 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[5].z, _242);
    float _252 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[6].x, _244);
    float _254 = -_156;
    int _256 = _246 ? as_type<int>(_254) : as_type<int>(_156);
    float _258 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[4].z, _248);
    float _260 = _250 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _262 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[6].z, _252);
    bool _264 = !_210;
    float _266 = _264 ? _156 : as_type<float>(_256);
    float _268 = _258 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _270 = -_260;
    float _272 = _270 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _274 = _262 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _276 = -_268;
    float _278 = _276 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _280 = _272 * _272;
    float _282 = -_274;
    float _284 = _282 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _286 = _202 > 0.5;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _290 = _288 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _292 = fma(_278, _278, _280);
    float _294 = _218 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _296 = 1.0 / _290;
    float _298 = fma(_284, _284, _292);
    float _300 = _294 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _302 = _204 > 0.5;
    float _304 = _220 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _306 = 0.0;
    if (!_216)
    {
        _306 = _204;
    }
    float _308 = _306;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _312 = rsqrt(_298);
    float _314 = _200 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _316 = 0.0;
    float _318 = _308;
    if (!_216)
    {
        _316 = _204;
    }
    float _320 = _316;
    float _322 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[78].w, _310);
    float _324 = -_160;
    int _326 = _286 ? as_type<int>(_324) : as_type<int>(_160);
    float _328 = -_232;
    float _330 = fma(_314, 2.0, _328);
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _334 = _332 != 0;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _338 = 0.0;
    float _340 = _320;
    if (!_216)
    {
        _338 = _202;
    }
    float _342 = _338;
    float _344 = _202 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _346 = !_226;
    float _348 = _346 ? _160 : as_type<float>(_326);
    float _350 = _304 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _352 = _342;
    if (_216)
    {
        _352 = _200;
    }
    float _354 = _352;
    float _356 = fma(_344, -2.0, _336);
    if (_216)
    {
        _318 = _202;
    }
    float _358 = _318;
    if (_216)
    {
        _340 = _202;
    }
    float _360 = _340;
    float _362 = _278 * _312;
    int _364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _366 = _364 != 0;
    int _368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _370 = _368 != 0;
    float _372 = _284 * _312;
    float _374 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _376 = _362 * _374;
    float _378 = _272 * _312;
    float _380 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _382 = _372 * _380;
    float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _388 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _390 = -_376;
    float _392 = fma(_372, _388, _390);
    float _394 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _396 = -_382;
    float _398 = fma(_378, _394, _396);
    float _400 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _402 = _378 * _400;
    float _404 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[78].z, _386);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _406;
    float _410 = _392 * _392;
    float _412 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _156);
    float _414 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _160);
    float _416 = _408 * _296;
    float _418 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _420 = -_402;
    float _422 = fma(_362, _418, _420);
    float _424 = fma(_398, _398, _410);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _428 = _190 + _426;
    float _430 = _300 * _412;
    bool _432 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _434 = isnan(_190);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = fma(_422, _422, _424);
    float _446 = fma(_416, _428, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _448 = _198 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _450 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _452 = isnan(_190);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = _384 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _464 = rsqrt(_444);
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _468 = -_442;
    float _470 = _468 + 1.0;
    float _472 = -_120;
    float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[76].x, _330);
    float _476 = _266 + 0.5;
    float _478 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _356);
    float _480 = _348 + (-0.5);
    float _482 = _350 * _414;
    float _484 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[83].w, _466);
    float _486 = _460 * _470;
    float _488 = fma(_448, _476, _474);
    float _490 = -_462;
    float _492 = -_478;
    float _494 = fma(_490, _480, _492);
    float _496 = _446 * _486;
    float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _500 = _398 * _464;
    float _502 = _392 * _464;
    float _504 = _422 * _464;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _508 = _378 * _500;
    float _510 = _372 * _502;
    float _512 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[83].z, _506);
    float _514 = -_508;
    float _516 = fma(_362, _502, _514);
    float _518 = -_510;
    float _520 = fma(_378, _504, _518);
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _524 = _358 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _526 = _482 * _516;
    float _528 = _482 * _520;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _532 = _354 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _534 = fma(_430, _504, _526);
    float _536 = fma(_430, _500, _528);
    float _538 = -_156;
    int _540 = _302 ? as_type<int>(_538) : as_type<int>(_156);
    float _542 = -_530;
    float _544 = fma(_532, 2.0, _542);
    float _546 = fma(_212, _372, _534);
    float _548 = fma(_212, _362, _536);
    float _550 = fma(_524, -2.0, _522);
    float _552 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _484);
    float _554 = _274 + _546;
    float _556 = _268 + _548;
    float _558 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _322);
    float _560 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _512);
    float _562 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _564 = _554 + _562;
    float _566 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _568 = _556 + _566;
    float _570 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _404);
    float _572 = -_120;
    float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[81].x, _544);
    float _576 = _564 * _564;
    float _578 = _568 * _568;
    float _580 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _550);
    bool _582 = !_334;
    float _584 = _582 ? _156 : as_type<float>(_540);
    float _586 = _362 * _504;
    float _588 = _578 + _576;
    float _590 = -_160;
    int _592 = _238 ? as_type<int>(_590) : as_type<int>(_160);
    float _594 = -_460;
    float _596 = _594 + 1.0;
    float _598 = _498 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _600 = sqrt(_588);
    bool _602 = !_230;
    float _604 = _602 ? _160 : as_type<float>(_592);
    float _606 = _584 + 0.5;
    float _608 = -_586;
    float _610 = fma(_372, _500, _608);
    float _612 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[115].x, _496);
    float _614 = _604 + (-0.5);
    float _616 = fma(_598, _606, _574);
    float _618 = _482 * _610;
    float _620 = -_160;
    int _622 = _302 ? as_type<int>(_620) : as_type<int>(_160);
    float _624 = -_236;
    float _626 = -_580;
    float _628 = fma(_624, _614, _626);
    float _630 = -_156;
    int _632 = _286 ? as_type<int>(_630) : as_type<int>(_156);
    float _634 = fma(_430, _502, _618);
    bool _636 = !_370;
    float _638 = _636 ? _160 : as_type<float>(_622);
    float _640 = _160 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _642 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[116].x, _612);
    bool _644 = _600 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _646 = _156 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _648 = !_366;
    float _650 = _648 ? _156 : as_type<float>(_632);
    float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _654 = _640 * _520;
    float _656 = fma(_212, _378, _634);
    float _658 = _640 * _610;
    float _660 = _640 * _516;
    float _662 = fma(_646, _500, _654);
    float _664 = _260 + _656;
    float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _668 = _654;
    float _670 = _640;
    float _672 = _664;
    float _674 = _576;
    float _676 = _554;
    float _678 = _372;
    if (!_644)
    {
        _668 = _578;
    }
    float _680 = _668;
    float _682 = _680;
    if (!_644)
    {
        _670 = _556;
    }
    float _684 = _670;
    bool _686 = !_644;
    float _688 = _684;
    if (!_686)
    {
        float _690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _694 = _600 + _692;
        float _696 = rsqrt(_588);
        float _698 = _694 * _690;
        float _700 = _664 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _702 = _698 * 0.15915493667125701904296875;
        float _704 = _702 * 6.283185482025146484375;
        float _706 = sin(_704);
        float _708 = _702 * 6.283185482025146484375;
        float _710 = cos(_708);
        float _712 = fma(_706, _700, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _714 = _696 * _712;
        float _716 = fma(_568, _714, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _718 = _710 + (-1.0);
        float _720 = fma(_564, _714, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _722 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _724 = _716 + _722;
        float _726 = _718 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _728 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _730 = _720 + _728;
        float _732 = _724 * _724;
        float _734 = fma(_664, _710, _726);
        float _736 = _730 * _730;
        _672 = _734;
        _682 = _732;
        _674 = _736;
        _676 = _720;
        _688 = _716;
    }
    float _738 = _672;
    float _740 = _682;
    float _742 = _674;
    float _744 = _676;
    float _746 = _688;
    float _748 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _750 = _738 + _748;
    float _752 = -_570;
    float _754 = _752 + 1.0;
    float _756 = -_558;
    float _758 = _756 + 1.0;
    float _760 = -_560;
    float _762 = _760 + 1.0;
    float _764 = fma(_750, _750, _740);
    float _766 = -_552;
    float _768 = _766 + 1.0;
    float _770 = -_754;
    float _772 = fma(_266, _770, _488);
    float _774 = fma(_348, _758, _494);
    float _776 = _764 + _742;
    float _778 = fma(_646, _502, _658);
    float _780 = -_762;
    float _782 = fma(_584, _780, _616);
    float _784 = fma(_604, _768, _628);
    float _786 = _650 + 0.5;
    float _788 = -_638;
    float _790 = _788 + 0.5;
    float _792 = sqrt(_776);
    float _794 = _786 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _796 = _790 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _798 = fma(_646, _504, _660);
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _812 = _794 * _652;
    float _814 = _796 * _666;
    float _816 = _362 + _662;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _820 = _800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _822 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _824 = _806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _826 = _808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _828 = _810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _830 = _804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _832 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _834 = _378 + _778;
    float _836 = _372 + _798;
    out.m_53.x = _824;
    out.m_53.y = _826;
    out.m_53.z = _828;
    out.m_53.w = _818;
    bool _838 = _792 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _840 = isnan(_792);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _846 = _842 || _844;
    out.m_55.x = _812;
    out.m_55.y = _814;
    out.m_57.x = _820;
    out.m_57.y = _822;
    out.m_57.z = _830;
    out.m_57.w = _832;
    out.m_59.x = _772;
    out.m_59.y = _774;
    out.m_59.z = _782;
    out.m_59.w = _784;
    if (!_846)
    {
        _678 = 1.0;
    }
    float _848 = _678;
    out.m_61.x = _816;
    out.m_61.y = _834;
    out.m_61.z = _836;
    bool _850 = !_846;
    float _852 = _848;
    if (!_850)
    {
        bool _854 = _792 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _856 = isnan(_792);
        bool _858 = _854 || _856;
        bool _860 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _862 = _858 || _860;
        if (!_862)
        {
            float _864 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _866 = _792 + _864;
            float _868 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _870 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _868;
            float _872 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _874 = _872 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _876 = 1.0 / _870;
            float _878 = _866 * _876;
            float _880 = fma(_878, _874, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _852 = _880;
            _882 = true;
        }
        else
        {
            bool _884 = _792 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _886 = isnan(_792);
            bool _888 = _884 || _886;
            bool _890 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _892 = _888 || _890;
            if (!_892)
            {
                float _894 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _896 = _792 + _894;
                float _898 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _900 = _898 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _902 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _904 = _902 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _906 = 1.0 / _900;
                float _908 = _896 * _906;
                float _910 = fma(_908, _904, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _852 = _910;
                _882 = true;
            }
            else
            {
                _852 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _882 = false;
    float _912 = _852;
    float _914 = fma(_268, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _916 = fma(_274, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _918 = floor(_914);
    float _920 = floor(_916);
    float _922 = -_918;
    float _924 = _914 + _922;
    float _926 = -_920;
    float _928 = _916 + _926;
    float2 _2957 = float2(_924, _928);
    float _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2957, float2(0.0), isnan(_2957)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2957, float2(0.0), isnan(_2957)), level(0.0)).x;
    float _932 = _260 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _934 = _260 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _936 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _938 = _744 + _936;
    float _940 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[11].x, _932);
    float _942 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[10].x, _934);
    float _944 = fma(_274, (*spvDescriptorSet0.vp_c8)._m0[11].z, _940);
    float _946 = fma(_274, (*spvDescriptorSet0.vp_c8)._m0[10].z, _942);
    float _948 = _944 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _950 = _946 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _952 = 1.0 / _948;
    float _954 = _950 + _948;
    float _956 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _958 = _738 + _956;
    float _960 = fma(_958, _912, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _962 = _954 * _952;
    float _964 = _962 * 0.5;
    float _966 = _960 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _968 = _960 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _970 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _972 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[30].w, _970);
    float _974 = 1.0 / _972;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _978 = _974 * _976;
    float _980 = abs(_978);
    float _982 = log2(_980);
    bool _984 = _978 <= 8000.0;
    bool _986 = isnan(_978);
    bool _988 = _984 || _986;
    bool _990 = isnan(8000.0);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = _982 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _998 = exp2(_996);
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1002 = precise::clamp(_1000, 0.0, 1.0);
    float _1004 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1006 = _746 + _1004;
    float _1008 = fma(_1002, -2.0, 3.0);
    float _1010 = _1002 * _1002;
    float _1012 = fma(_1006, _912, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1014 = fma(_938, _912, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1016 = _1010 * _1008;
    float _1018 = _960 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1020 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[1].x, _966);
    float _1022 = _960 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1024 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[2].x, _968);
    float _1026 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1018);
    float _1028 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1020);
    float _1030 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1022);
    float _1032 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1024);
    float _1034 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1026);
    float _1036 = _1028 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1038 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1030);
    float _1040 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1042 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1044 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1046 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1048 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1050 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1052 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1044);
    float _1054 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1046);
    float _1056 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1048);
    float _1058 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1060 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1052);
    float _1062 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1054);
    float _1064 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1050);
    float _1066 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1056);
    float _1068 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1060);
    float _1070 = -_1016;
    float _1072 = _1070 + 1.0;
    float _1074 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1062);
    float _1076 = in.m_63.x;
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1080 = _960 + _1078;
    float _1082 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1016);
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1012 + _1084;
    float _1088 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1064);
    float _1090 = _1080 * _1080;
    float _1092 = _994 * _1082;
    float _1094 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1066);
    float _1096 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1088);
    float _1098 = fma(_1086, _1086, _1090);
    float _1100 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1102 = _1014 + _1100;
    float _1104 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1074;
    out.gl_Position.y = _1068;
    out.gl_Position.z = _1094;
    out.gl_Position.w = _1096;
    float _1106 = fma(_1102, _1102, _1098);
    float _1108 = sqrt(_1106);
    bool _1110 = _1108 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1112 = isnan(_1108);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1118 = _1114 || _1116;
    float _1120 = _1074;
    float _1122 = _1068;
    float _1124 = _1102;
    float _1126 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_1118)
    {
        _1120 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1128 = _1120;
    float _1130 = _1128;
    float _1132 = _1128;
    if (!_1118)
    {
        _1122 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1134 = _1122;
    float _1136 = _1134;
    float _1138 = _1134;
    if (!_1118)
    {
        _1124 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1140 = _1124;
    float _1142 = -_930;
    float _1144 = _1142 + 1.0;
    float _1146 = _1144 * _1104;
    float _1148 = precise::clamp(_1146, 0.0, 1.0);
    float _1150 = -_1148;
    float _1152 = fma(_1150, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1154 = _1140;
    float _1156 = _1140;
    if (!_1118)
    {
        _1126 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1158 = _1126;
    float _1160 = _1152 * _1076;
    float _1162 = _1076;
    float _1164 = _1160;
    float _1166 = _1158;
    float _1168 = _1158;
    if (!_1118)
    {
        _1162 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1170 = _1162;
    float _1172 = _1160 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1174 = _1170;
    float _1176 = _1170;
    if (!_1118)
    {
        _1164 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1178 = _1164;
    out.m_65.x = _1172;
    bool _1180 = !_1118;
    float _1182 = _1178;
    float _1184 = _1178;
    if (!_1180)
    {
        bool _1186 = _1108 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1188 = isnan(_1108);
        bool _1190 = _1186 || _1188;
        bool _1192 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1194 = _1190 || _1192;
        if (!_1194)
        {
            float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1198 = _1108 + _1196;
            float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1202 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1200;
            float _1204 = 1.0 / _1202;
            float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1208 = _1206 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1212 = _1210 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1214 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1216 = _1214 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1220 = _1218 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1222 = _1198 * _1204;
            float _1224 = precise::clamp(_1222, 0.0, 1.0);
            float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1228 = _1226 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1232 = _1230 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1234 = fma(_1224, _1208, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1236 = fma(_1224, _1228, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1238 = fma(_1224, _1232, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1240 = fma(_1224, _1212, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1242 = fma(_1224, _1216, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1244 = fma(_1224, _1220, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1138 = _1234;
            _1156 = _1242;
            _1132 = _1236;
            _1168 = _1240;
            _1176 = _1238;
            _1184 = _1244;
            _1246 = true;
        }
        else
        {
            bool _1248 = _1108 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1250 = isnan(_1108);
            bool _1252 = _1248 || _1250;
            bool _1254 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1256 = _1252 || _1254;
            if (!_1256)
            {
                _1130 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1258 = _1130;
            _1132 = _1258;
            if (!_1256)
            {
                _1136 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1260 = _1136;
            _1138 = _1260;
            if (!_1256)
            {
                _1174 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1262 = _1174;
            _1176 = _1262;
            if (!_1256)
            {
                _1166 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1264 = _1166;
            _1168 = _1264;
            if (!_1256)
            {
                _1154 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1266 = _1154;
            _1156 = _1266;
            if (!_1256)
            {
                _1182 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1268 = _1182;
            bool _1270 = !_1256;
            _1184 = _1268;
            if (!_1270)
            {
                bool _1272 = _1108 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1274 = isnan(_1108);
                bool _1276 = _1272 || _1274;
                bool _1278 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1280 = _1276 || _1278;
                if (!_1280)
                {
                    float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1284 = _1108 + _1282;
                    float _1286 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1288 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1286;
                    float _1290 = 1.0 / _1288;
                    float _1292 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1294 = _1292 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1296 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1298 = _1296 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1300 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1302 = _1300 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1304 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1306 = _1304 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1308 = _1284 * _1290;
                    float _1310 = precise::clamp(_1308, 0.0, 1.0);
                    float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1314 = _1312 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1316 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1318 = _1316 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1320 = fma(_1310, _1294, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1322 = fma(_1310, _1314, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1324 = fma(_1310, _1318, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1326 = fma(_1310, _1298, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1328 = fma(_1310, _1302, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1330 = fma(_1310, _1306, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1138 = _1320;
                    _1156 = _1328;
                    _1132 = _1322;
                    _1168 = _1326;
                    _1176 = _1324;
                    _1184 = _1330;
                    _1246 = true;
                }
                else
                {
                    _1138 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1156 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1132 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1168 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1176 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1184 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1246 = false;
    float _1332 = _1138;
    float _1334 = _1156;
    float _1336 = _1132;
    float _1338 = _1168;
    float _1340 = _1176;
    float _1342 = _1184;
    float _1344 = fma(_834, -0.5, 0.5);
    float _1346 = precise::clamp(_1344, 0.0, 1.0);
    float _1348 = -_1332;
    float _1350 = _1348 + _1334;
    float _1352 = -_1336;
    float _1354 = _1352 + _1338;
    float _1356 = -_1340;
    float _1358 = _1356 + _1342;
    bool _1360 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1362 = fma(_1346, _1350, _1332);
    float _1364 = fma(_1346, _1354, _1336);
    float _1366 = fma(_1346, _1358, _1340);
    float _1368 = _1362 * 0.586610972881317138671875;
    out.m_67.x = 0.0;
    float _1370 = fma(_1364, 0.298911988735198974609375, _1368);
    out.m_42.x = 1.0;
    float _1372 = fma(_1366, 0.114477999508380889892578125, _1370);
    float _1374 = -_1372;
    float _1376 = _1364 + _1374;
    float _1378 = -_1372;
    float _1380 = _1362 + _1378;
    float _1382 = -_1372;
    float _1384 = _1366 + _1382;
    float _1386 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1388 = fma(_1376, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1372);
    float _1390 = fma(_1380, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1372);
    float _1392 = fma(_1384, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1372);
    out.m_65.w = _1386;
    out.m_69.x = _1388;
    out.m_69.y = _1390;
    out.m_69.z = _1392;
    if (!_1360)
    {
        return out;
    }
    float _1394 = -_960;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1398 = -_1012;
    float _1400 = _1398 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1402 = -_1014;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1406 = _1396 * _1396;
    float _1408 = fma(_1400, _1400, _1406);
    float _1410 = fma(_1404, _1404, _1408);
    float _1412 = sqrt(_1410);
    float _1414 = rsqrt(_1410);
    float _1416 = -_1412;
    float _1418 = _1416 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1420 = _1418 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1422 = precise::clamp(_1420, 0.0, 1.0);
    float _1424 = _1400 * _1414;
    float _1426 = _1396 * _1414;
    float _1428 = abs(_1422);
    float _1430 = log2(_1428);
    float _1432 = _1404 * _1414;
    float _1434 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1436 = _834 * _1426;
    float _1438 = -_1426;
    float _1440 = -_1434;
    float _1442 = fma(_1438, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1440);
    float _1444 = fma(_816, _1424, _1436);
    float _1446 = -_1432;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1442);
    float _1450 = fma(_836, _1432, _1444);
    float _1452 = precise::clamp(_1450, 0.0, 1.0);
    float _1454 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1456 = _1448 + _1454;
    float _1458 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1460 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1462 = precise::clamp(_1460, 0.0, 1.0);
    float _1464 = exp2(_1458);
    float _1466 = _1464 * _1462;
    float _1468 = _1452 * _1466;
    float _1470 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1472 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1474 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_67.x = _1470;
    out.m_67.y = _1472;
    out.m_67.z = _1474;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1246 = false;
    bool _882 = false;
    bool _182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_39.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_42.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1530 = as_type<float>(_104);
        out.gl_Position.z = _1530;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _106 = in.m_44.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_88);
        _98 = _122;
    }
    float _124 = _98;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_42.x = 0.0;
    }
    int _136 = 0;
    if (_130)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1599 = as_type<float>(_140);
        out.gl_Position.z = _1599;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = as_type<float>(int(gl_VertexIndex));
    bool _144 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _146 = as_type<int>(_142) & 1;
    bool _148 = _146 != 0;
    int _150 = as_type<int>(_142) & 2;
    bool _152 = _150 != 0;
    bool _154 = !_148;
    float _156 = _154 ? (-0.5) : 0.5;
    bool _158 = !_152;
    float _160 = _158 ? (-0.5) : 0.5;
    bool _162 = !_144;
    float _180;
    if (!_162)
    {
        float _164 = in.m_49.x;
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _170 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _172 = _170 * _166;
        float _174 = floor(_172);
        float _176 = -_174;
        float _178 = _172 + _176;
        _180 = _178;
        _182 = true;
    }
    else
    {
        float _184 = float(_88);
        float _186 = 1.0 / _184;
        float _188 = _120 * _186;
        _180 = _188;
    }
    _182 = false;
    float _190 = _180;
    float _192 = in.m_39.x;
    float _194 = in.m_39.y;
    float _196 = in.m_39.z;
    float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _200 = in.m_49.x;
    float _202 = in.m_49.y;
    float _204 = in.m_49.z;
    float _206 = in.m_49.w;
    int _208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _210 = _208 != 0;
    float _212 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _216 = _214 != 0;
    float _218 = in.m_51.x;
    float _220 = in.m_51.y;
    float _222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _226 = _224 != 0;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _230 = _228 != 0;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _234 = _194 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _236 = _222 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _238 = _206 > 0.5;
    float _240 = _194 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _242 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[5].x, _234);
    float _244 = _194 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _246 = _200 > 0.5;
    float _248 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[4].x, _240);
    float _250 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[5].z, _242);
    float _252 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[6].x, _244);
    float _254 = -_156;
    int _256 = _246 ? as_type<int>(_254) : as_type<int>(_156);
    float _258 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[4].z, _248);
    float _260 = _250 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _262 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[6].z, _252);
    bool _264 = !_210;
    float _266 = _264 ? _156 : as_type<float>(_256);
    float _268 = _258 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _270 = -_260;
    float _272 = _270 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _274 = _262 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _276 = -_268;
    float _278 = _276 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _280 = _272 * _272;
    float _282 = -_274;
    float _284 = _282 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _286 = _202 > 0.5;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _290 = _288 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _292 = fma(_278, _278, _280);
    float _294 = _218 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _296 = 1.0 / _290;
    float _298 = fma(_284, _284, _292);
    float _300 = _294 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _302 = _204 > 0.5;
    float _304 = _220 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _306 = 0.0;
    if (!_216)
    {
        _306 = _204;
    }
    float _308 = _306;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _312 = rsqrt(_298);
    float _314 = _200 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _316 = 0.0;
    float _318 = _308;
    if (!_216)
    {
        _316 = _204;
    }
    float _320 = _316;
    float _322 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[78].w, _310);
    float _324 = -_160;
    int _326 = _286 ? as_type<int>(_324) : as_type<int>(_160);
    float _328 = -_232;
    float _330 = fma(_314, 2.0, _328);
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _334 = _332 != 0;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _338 = 0.0;
    float _340 = _320;
    if (!_216)
    {
        _338 = _202;
    }
    float _342 = _338;
    float _344 = _202 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _346 = !_226;
    float _348 = _346 ? _160 : as_type<float>(_326);
    float _350 = _304 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _352 = _342;
    if (_216)
    {
        _352 = _200;
    }
    float _354 = _352;
    float _356 = fma(_344, -2.0, _336);
    if (_216)
    {
        _318 = _202;
    }
    float _358 = _318;
    if (_216)
    {
        _340 = _202;
    }
    float _360 = _340;
    float _362 = _278 * _312;
    int _364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _366 = _364 != 0;
    int _368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _370 = _368 != 0;
    float _372 = _284 * _312;
    float _374 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _376 = _362 * _374;
    float _378 = _272 * _312;
    float _380 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _382 = _372 * _380;
    float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _388 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _390 = -_376;
    float _392 = fma(_372, _388, _390);
    float _394 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _396 = -_382;
    float _398 = fma(_378, _394, _396);
    float _400 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _402 = _378 * _400;
    float _404 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[78].z, _386);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _406;
    float _410 = _392 * _392;
    float _412 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _156);
    float _414 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _160);
    float _416 = _408 * _296;
    float _418 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _420 = -_402;
    float _422 = fma(_362, _418, _420);
    float _424 = fma(_398, _398, _410);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _428 = _190 + _426;
    float _430 = _300 * _412;
    bool _432 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _434 = isnan(_190);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = fma(_422, _422, _424);
    float _446 = fma(_416, _428, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _448 = _198 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _450 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _452 = isnan(_190);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = _384 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _464 = rsqrt(_444);
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _468 = -_442;
    float _470 = _468 + 1.0;
    float _472 = -_120;
    float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[76].x, _330);
    float _476 = _266 + 0.5;
    float _478 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _356);
    float _480 = _348 + (-0.5);
    float _482 = _350 * _414;
    float _484 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[83].w, _466);
    float _486 = _460 * _470;
    float _488 = fma(_448, _476, _474);
    float _490 = -_462;
    float _492 = -_478;
    float _494 = fma(_490, _480, _492);
    float _496 = _446 * _486;
    float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _500 = _398 * _464;
    float _502 = _392 * _464;
    float _504 = _422 * _464;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _508 = _378 * _500;
    float _510 = _372 * _502;
    float _512 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[83].z, _506);
    float _514 = -_508;
    float _516 = fma(_362, _502, _514);
    float _518 = -_510;
    float _520 = fma(_378, _504, _518);
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _524 = _358 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _526 = _482 * _516;
    float _528 = _482 * _520;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _532 = _354 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _534 = fma(_430, _504, _526);
    float _536 = fma(_430, _500, _528);
    float _538 = -_156;
    int _540 = _302 ? as_type<int>(_538) : as_type<int>(_156);
    float _542 = -_530;
    float _544 = fma(_532, 2.0, _542);
    float _546 = fma(_212, _372, _534);
    float _548 = fma(_212, _362, _536);
    float _550 = fma(_524, -2.0, _522);
    float _552 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _484);
    float _554 = _274 + _546;
    float _556 = _268 + _548;
    float _558 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _322);
    float _560 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _512);
    float _562 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _564 = _554 + _562;
    float _566 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _568 = _556 + _566;
    float _570 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _404);
    float _572 = -_120;
    float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[81].x, _544);
    float _576 = _564 * _564;
    float _578 = _568 * _568;
    float _580 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _550);
    bool _582 = !_334;
    float _584 = _582 ? _156 : as_type<float>(_540);
    float _586 = _362 * _504;
    float _588 = _578 + _576;
    float _590 = -_160;
    int _592 = _238 ? as_type<int>(_590) : as_type<int>(_160);
    float _594 = -_460;
    float _596 = _594 + 1.0;
    float _598 = _498 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _600 = sqrt(_588);
    bool _602 = !_230;
    float _604 = _602 ? _160 : as_type<float>(_592);
    float _606 = _584 + 0.5;
    float _608 = -_586;
    float _610 = fma(_372, _500, _608);
    float _612 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[115].x, _496);
    float _614 = _604 + (-0.5);
    float _616 = fma(_598, _606, _574);
    float _618 = _482 * _610;
    float _620 = -_160;
    int _622 = _302 ? as_type<int>(_620) : as_type<int>(_160);
    float _624 = -_236;
    float _626 = -_580;
    float _628 = fma(_624, _614, _626);
    float _630 = -_156;
    int _632 = _286 ? as_type<int>(_630) : as_type<int>(_156);
    float _634 = fma(_430, _502, _618);
    bool _636 = !_370;
    float _638 = _636 ? _160 : as_type<float>(_622);
    float _640 = _160 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _642 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[116].x, _612);
    bool _644 = _600 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _646 = _156 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _648 = !_366;
    float _650 = _648 ? _156 : as_type<float>(_632);
    float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _654 = _640 * _520;
    float _656 = fma(_212, _378, _634);
    float _658 = _640 * _610;
    float _660 = _640 * _516;
    float _662 = fma(_646, _500, _654);
    float _664 = _260 + _656;
    float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _668 = _654;
    float _670 = _640;
    float _672 = _664;
    float _674 = _576;
    float _676 = _554;
    float _678 = _372;
    if (!_644)
    {
        _668 = _578;
    }
    float _680 = _668;
    float _682 = _680;
    if (!_644)
    {
        _670 = _556;
    }
    float _684 = _670;
    bool _686 = !_644;
    float _688 = _684;
    if (!_686)
    {
        float _690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _694 = _600 + _692;
        float _696 = rsqrt(_588);
        float _698 = _694 * _690;
        float _700 = _664 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _702 = _698 * 0.15915493667125701904296875;
        float _704 = _702 * 6.283185482025146484375;
        float _706 = sin(_704);
        float _708 = _702 * 6.283185482025146484375;
        float _710 = cos(_708);
        float _712 = fma(_706, _700, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _714 = _696 * _712;
        float _716 = fma(_568, _714, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _718 = _710 + (-1.0);
        float _720 = fma(_564, _714, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _722 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _724 = _716 + _722;
        float _726 = _718 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _728 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _730 = _720 + _728;
        float _732 = _724 * _724;
        float _734 = fma(_664, _710, _726);
        float _736 = _730 * _730;
        _672 = _734;
        _682 = _732;
        _674 = _736;
        _676 = _720;
        _688 = _716;
    }
    float _738 = _672;
    float _740 = _682;
    float _742 = _674;
    float _744 = _676;
    float _746 = _688;
    float _748 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _750 = _738 + _748;
    float _752 = -_570;
    float _754 = _752 + 1.0;
    float _756 = -_558;
    float _758 = _756 + 1.0;
    float _760 = -_560;
    float _762 = _760 + 1.0;
    float _764 = fma(_750, _750, _740);
    float _766 = -_552;
    float _768 = _766 + 1.0;
    float _770 = -_754;
    float _772 = fma(_266, _770, _488);
    float _774 = fma(_348, _758, _494);
    float _776 = _764 + _742;
    float _778 = fma(_646, _502, _658);
    float _780 = -_762;
    float _782 = fma(_584, _780, _616);
    float _784 = fma(_604, _768, _628);
    float _786 = _650 + 0.5;
    float _788 = -_638;
    float _790 = _788 + 0.5;
    float _792 = sqrt(_776);
    float _794 = _786 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _796 = _790 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _798 = fma(_646, _504, _660);
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _812 = _794 * _652;
    float _814 = _796 * _666;
    float _816 = _362 + _662;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _820 = _800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _822 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _824 = _806 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _826 = _808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _828 = _810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _830 = _804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _832 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _834 = _378 + _778;
    float _836 = _372 + _798;
    out.m_53.x = _824;
    out.m_53.y = _826;
    out.m_53.z = _828;
    out.m_53.w = _818;
    bool _838 = _792 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _840 = isnan(_792);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _846 = _842 || _844;
    out.m_55.x = _812;
    out.m_55.y = _814;
    out.m_57.x = _820;
    out.m_57.y = _822;
    out.m_57.z = _830;
    out.m_57.w = _832;
    out.m_59.x = _772;
    out.m_59.y = _774;
    out.m_59.z = _782;
    out.m_59.w = _784;
    if (!_846)
    {
        _678 = 1.0;
    }
    float _848 = _678;
    out.m_61.x = _816;
    out.m_61.y = _834;
    out.m_61.z = _836;
    bool _850 = !_846;
    float _852 = _848;
    if (!_850)
    {
        bool _854 = _792 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _856 = isnan(_792);
        bool _858 = _854 || _856;
        bool _860 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _862 = _858 || _860;
        if (!_862)
        {
            float _864 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _866 = _792 + _864;
            float _868 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _870 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _868;
            float _872 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _874 = _872 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _876 = 1.0 / _870;
            float _878 = _866 * _876;
            float _880 = fma(_878, _874, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _852 = _880;
            _882 = true;
        }
        else
        {
            bool _884 = _792 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _886 = isnan(_792);
            bool _888 = _884 || _886;
            bool _890 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _892 = _888 || _890;
            if (!_892)
            {
                float _894 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _896 = _792 + _894;
                float _898 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _900 = _898 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _902 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _904 = _902 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _906 = 1.0 / _900;
                float _908 = _896 * _906;
                float _910 = fma(_908, _904, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _852 = _910;
                _882 = true;
            }
            else
            {
                _852 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _882 = false;
    float _912 = _852;
    float _914 = fma(_268, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _916 = fma(_274, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _918 = floor(_914);
    float _920 = floor(_916);
    float _922 = -_918;
    float _924 = _914 + _922;
    float _926 = -_920;
    float _928 = _916 + _926;
    float2 _2957 = float2(_924, _928);
    float _930 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2957, float2(0.0), isnan(_2957)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2957, float2(0.0), isnan(_2957)), level(0.0)).x;
    float _932 = _260 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _934 = _260 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _936 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _938 = _744 + _936;
    float _940 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[11].x, _932);
    float _942 = fma(_268, (*spvDescriptorSet0.vp_c8)._m0[10].x, _934);
    float _944 = fma(_274, (*spvDescriptorSet0.vp_c8)._m0[11].z, _940);
    float _946 = fma(_274, (*spvDescriptorSet0.vp_c8)._m0[10].z, _942);
    float _948 = _944 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _950 = _946 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _952 = 1.0 / _948;
    float _954 = _950 + _948;
    float _956 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _958 = _738 + _956;
    float _960 = fma(_958, _912, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _962 = _954 * _952;
    float _964 = _962 * 0.5;
    float _966 = _960 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _968 = _960 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _970 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _972 = fma(_964, (*spvDescriptorSet0.vp_c8)._m0[30].w, _970);
    float _974 = 1.0 / _972;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _978 = _974 * _976;
    float _980 = abs(_978);
    float _982 = log2(_980);
    bool _984 = _978 <= 8000.0;
    bool _986 = isnan(_978);
    bool _988 = _984 || _986;
    bool _990 = isnan(8000.0);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = _982 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _998 = exp2(_996);
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1002 = precise::clamp(_1000, 0.0, 1.0);
    float _1004 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1006 = _746 + _1004;
    float _1008 = fma(_1002, -2.0, 3.0);
    float _1010 = _1002 * _1002;
    float _1012 = fma(_1006, _912, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1014 = fma(_938, _912, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1016 = _1010 * _1008;
    float _1018 = _960 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1020 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[1].x, _966);
    float _1022 = _960 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1024 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[2].x, _968);
    float _1026 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1018);
    float _1028 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1020);
    float _1030 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1022);
    float _1032 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1024);
    float _1034 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1026);
    float _1036 = _1028 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1038 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1030);
    float _1040 = _1032 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1042 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1044 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1046 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1048 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1050 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1052 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1044);
    float _1054 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1046);
    float _1056 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1048);
    float _1058 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1060 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1052);
    float _1062 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1054);
    float _1064 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1050);
    float _1066 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1056);
    float _1068 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1060);
    float _1070 = -_1016;
    float _1072 = _1070 + 1.0;
    float _1074 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1062);
    float _1076 = in.m_63.x;
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1080 = _960 + _1078;
    float _1082 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1016);
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1012 + _1084;
    float _1088 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1064);
    float _1090 = _1080 * _1080;
    float _1092 = _994 * _1082;
    float _1094 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1066);
    float _1096 = fma(_1058, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1088);
    float _1098 = fma(_1086, _1086, _1090);
    float _1100 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1102 = _1014 + _1100;
    float _1104 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1074;
    out.gl_Position.y = _1068;
    out.gl_Position.z = _1094;
    out.gl_Position.w = _1096;
    float _1106 = fma(_1102, _1102, _1098);
    float _1108 = sqrt(_1106);
    bool _1110 = _1108 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1112 = isnan(_1108);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1118 = _1114 || _1116;
    float _1120 = _1074;
    float _1122 = _1068;
    float _1124 = _1102;
    float _1126 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_1118)
    {
        _1120 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1128 = _1120;
    float _1130 = _1128;
    float _1132 = _1128;
    if (!_1118)
    {
        _1122 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1134 = _1122;
    float _1136 = _1134;
    float _1138 = _1134;
    if (!_1118)
    {
        _1124 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1140 = _1124;
    float _1142 = -_930;
    float _1144 = _1142 + 1.0;
    float _1146 = _1144 * _1104;
    float _1148 = precise::clamp(_1146, 0.0, 1.0);
    float _1150 = -_1148;
    float _1152 = fma(_1150, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1154 = _1140;
    float _1156 = _1140;
    if (!_1118)
    {
        _1126 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1158 = _1126;
    float _1160 = _1152 * _1076;
    float _1162 = _1076;
    float _1164 = _1160;
    float _1166 = _1158;
    float _1168 = _1158;
    if (!_1118)
    {
        _1162 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1170 = _1162;
    float _1172 = _1160 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1174 = _1170;
    float _1176 = _1170;
    if (!_1118)
    {
        _1164 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1178 = _1164;
    out.m_65.x = _1172;
    bool _1180 = !_1118;
    float _1182 = _1178;
    float _1184 = _1178;
    if (!_1180)
    {
        bool _1186 = _1108 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1188 = isnan(_1108);
        bool _1190 = _1186 || _1188;
        bool _1192 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1194 = _1190 || _1192;
        if (!_1194)
        {
            float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1198 = _1108 + _1196;
            float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1202 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1200;
            float _1204 = 1.0 / _1202;
            float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1208 = _1206 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1212 = _1210 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1214 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1216 = _1214 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1220 = _1218 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1222 = _1198 * _1204;
            float _1224 = precise::clamp(_1222, 0.0, 1.0);
            float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1228 = _1226 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1232 = _1230 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1234 = fma(_1224, _1208, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1236 = fma(_1224, _1228, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1238 = fma(_1224, _1232, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1240 = fma(_1224, _1212, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1242 = fma(_1224, _1216, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1244 = fma(_1224, _1220, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1138 = _1234;
            _1156 = _1242;
            _1132 = _1236;
            _1168 = _1240;
            _1176 = _1238;
            _1184 = _1244;
            _1246 = true;
        }
        else
        {
            bool _1248 = _1108 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1250 = isnan(_1108);
            bool _1252 = _1248 || _1250;
            bool _1254 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1256 = _1252 || _1254;
            if (!_1256)
            {
                _1130 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1258 = _1130;
            _1132 = _1258;
            if (!_1256)
            {
                _1136 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1260 = _1136;
            _1138 = _1260;
            if (!_1256)
            {
                _1174 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1262 = _1174;
            _1176 = _1262;
            if (!_1256)
            {
                _1166 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1264 = _1166;
            _1168 = _1264;
            if (!_1256)
            {
                _1154 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1266 = _1154;
            _1156 = _1266;
            if (!_1256)
            {
                _1182 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1268 = _1182;
            bool _1270 = !_1256;
            _1184 = _1268;
            if (!_1270)
            {
                bool _1272 = _1108 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1274 = isnan(_1108);
                bool _1276 = _1272 || _1274;
                bool _1278 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1280 = _1276 || _1278;
                if (!_1280)
                {
                    float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1284 = _1108 + _1282;
                    float _1286 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1288 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1286;
                    float _1290 = 1.0 / _1288;
                    float _1292 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1294 = _1292 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1296 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1298 = _1296 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1300 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1302 = _1300 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1304 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1306 = _1304 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1308 = _1284 * _1290;
                    float _1310 = precise::clamp(_1308, 0.0, 1.0);
                    float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1314 = _1312 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1316 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1318 = _1316 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1320 = fma(_1310, _1294, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1322 = fma(_1310, _1314, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1324 = fma(_1310, _1318, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1326 = fma(_1310, _1298, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1328 = fma(_1310, _1302, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1330 = fma(_1310, _1306, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1138 = _1320;
                    _1156 = _1328;
                    _1132 = _1322;
                    _1168 = _1326;
                    _1176 = _1324;
                    _1184 = _1330;
                    _1246 = true;
                }
                else
                {
                    _1138 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1156 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1132 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1168 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1176 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1184 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1246 = false;
    float _1332 = _1138;
    float _1334 = _1156;
    float _1336 = _1132;
    float _1338 = _1168;
    float _1340 = _1176;
    float _1342 = _1184;
    float _1344 = fma(_834, -0.5, 0.5);
    float _1346 = precise::clamp(_1344, 0.0, 1.0);
    float _1348 = -_1332;
    float _1350 = _1348 + _1334;
    float _1352 = -_1336;
    float _1354 = _1352 + _1338;
    float _1356 = -_1340;
    float _1358 = _1356 + _1342;
    bool _1360 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1362 = fma(_1346, _1350, _1332);
    float _1364 = fma(_1346, _1354, _1336);
    float _1366 = fma(_1346, _1358, _1340);
    float _1368 = _1362 * 0.586610972881317138671875;
    out.m_67.x = 0.0;
    float _1370 = fma(_1364, 0.298911988735198974609375, _1368);
    out.m_42.x = 1.0;
    float _1372 = fma(_1366, 0.114477999508380889892578125, _1370);
    float _1374 = -_1372;
    float _1376 = _1364 + _1374;
    float _1378 = -_1372;
    float _1380 = _1362 + _1378;
    float _1382 = -_1372;
    float _1384 = _1366 + _1382;
    float _1386 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1388 = fma(_1376, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1372);
    float _1390 = fma(_1380, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1372);
    float _1392 = fma(_1384, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1372);
    out.m_65.w = _1386;
    out.m_69.x = _1388;
    out.m_69.y = _1390;
    out.m_69.z = _1392;
    if (!_1360)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1394 = -_960;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1398 = -_1012;
    float _1400 = _1398 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1402 = -_1014;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1406 = _1396 * _1396;
    float _1408 = fma(_1400, _1400, _1406);
    float _1410 = fma(_1404, _1404, _1408);
    float _1412 = sqrt(_1410);
    float _1414 = rsqrt(_1410);
    float _1416 = -_1412;
    float _1418 = _1416 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1420 = _1418 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1422 = precise::clamp(_1420, 0.0, 1.0);
    float _1424 = _1400 * _1414;
    float _1426 = _1396 * _1414;
    float _1428 = abs(_1422);
    float _1430 = log2(_1428);
    float _1432 = _1404 * _1414;
    float _1434 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1436 = _834 * _1426;
    float _1438 = -_1426;
    float _1440 = -_1434;
    float _1442 = fma(_1438, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1440);
    float _1444 = fma(_816, _1424, _1436);
    float _1446 = -_1432;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1442);
    float _1450 = fma(_836, _1432, _1444);
    float _1452 = precise::clamp(_1450, 0.0, 1.0);
    float _1454 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1456 = _1448 + _1454;
    float _1458 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1460 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1462 = precise::clamp(_1460, 0.0, 1.0);
    float _1464 = exp2(_1458);
    float _1466 = _1464 * _1462;
    float _1468 = _1452 * _1466;
    float _1470 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1472 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1474 = _1468 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_67.x = _1470;
    out.m_67.y = _1472;
    out.m_67.z = _1474;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

