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
    texture2d<float> vp_t_tcb_C [[id(6)]];
    sampler vp_t_tcb_CSmplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_CSmplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_67 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_53 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1637 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_46.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    float _116 = _114;
    if (!_108)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_108)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1938 = as_type<float>(_122);
        out.gl_Position.z = _1938;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_51.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_104);
        _116 = _142;
    }
    float _144 = _116;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    if (_150)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _112;
    if (_150)
    {
        out.m_49.x = 0.0;
    }
    if (_150)
    {
        float _154 = _152 * 5.0;
        _124 = as_type<int>(_154);
    }
    int _156 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2006 = as_type<float>(_156);
        out.gl_Position.z = _2006;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_53.y;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _162 = in.m_55.z;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _166 = _164 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _170 = _168 != 0;
    float _172 = in.m_55.x;
    int _174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _176 = _174 != 0;
    float _178 = in.m_55.y;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _182 = in.m_53.x;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _186 = _184 != 0;
    float _188 = _160 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _194 = -_158;
    float _196 = _194 + 1.0;
    bool _198 = _162 > 0.5;
    int _200 = _198 ? as_type<int>(_196) : as_type<int>(_158);
    float _202 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[88].z, _190);
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _206 = _188;
    float _208 = _158;
    float _210 = _162;
    if (_166)
    {
        _204 = _172;
    }
    float _212 = _204;
    float _214 = _170 ? as_type<float>(_200) : _158;
    float _216 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[88].w, _192);
    float _218 = _212;
    if (!_166)
    {
        _218 = _162;
    }
    float _220 = _218;
    int _222 = 0;
    if (_176)
    {
        float _224 = -_182;
        float _226 = _224 + 1.0;
        _222 = as_type<int>(_226);
    }
    int _228 = _222;
    float _230 = fma(_214, _188, -0.5);
    bool _232 = _178 > 0.5;
    float _234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _236 = _220 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _238 = _236;
    if (!_176)
    {
        _206 = _182;
    }
    float _240 = _206;
    float _242 = _240;
    if (_176)
    {
        float _244 = _232 ? as_type<float>(_228) : _182;
        _242 = _244;
    }
    float _246 = _242;
    float _248 = -_180;
    float _250 = fma(_236, 2.0, _248);
    if (_166)
    {
        _238 = _178;
    }
    float _252 = _238;
    float _254 = -_140;
    float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[86].x, _250);
    float _258 = _252;
    if (!_166)
    {
        _258 = _172;
    }
    float _260 = _258;
    float _262 = 0.0;
    if (!_186)
    {
        _262 = _182;
    }
    float _264 = _262;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _268 = 0.0;
    float _270 = _264;
    if (!_166)
    {
        _268 = _178;
    }
    float _272 = _268;
    float _274 = _260 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _276 = _234 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _278 = fma(_274, -2.0, _266);
    float _280 = fma(_276, _246, -0.5);
    float _282 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _202);
    float _284 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _216);
    float _286 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _278);
    float _288 = fma(_282, _280, _256);
    float _290 = -_286;
    float _292 = fma(_284, _230, _290);
    float _294 = _288 + 0.5;
    float _296 = _292 + 0.5;
    float2 _2251 = float2(_294, _296);
    float _298 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, select(_2251, float2(0.0), isnan(_2251)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, select(_2251, float2(0.0), isnan(_2251)), level(0.0)).w;
    float _300 = in.m_51.x;
    float _302 = in.m_51.y;
    float _304 = in.m_51.z;
    float _306 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _308 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _312 = _308 || _310;
    bool _314 = isnan(1.0);
    bool _316 = _312 || _314;
    float _318 = in.m_46.x;
    float _320 = in.m_46.y;
    float _322 = in.m_46.z;
    float _324 = in.m_57.x;
    float _326 = in.m_57.y;
    float _328 = in.m_57.z;
    float _330 = in.m_57.w;
    float _332 = 0.0;
    float _334 = _306;
    float _336 = _272;
    float _338 = _296;
    if (!_316)
    {
        float _340 = _306 * _306;
        float _342 = _340 * 0.5;
        _332 = _342;
    }
    float _344 = _332;
    float _346 = _344;
    if (!_316)
    {
        float _348 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _346 = _348;
    }
    float _350 = _346;
    bool _352 = !_316;
    float _354 = _350;
    if (!_352)
    {
        float _356 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = log2(_356);
        float _360 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _362 = _360 + 1.0;
        float _364 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _366 = _306 * _358;
        float _368 = 1.0 / _362;
        float _370 = _364 * 0.693147182464599609375;
        float _372 = exp2(_366);
        float _374 = 1.0 / _370;
        float _376 = _372 + (-1.0);
        float _378 = -_376;
        float _380 = fma(_378, _374, _306);
        float _382 = _380 * _368;
        float _384 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _354 = _384;
    }
    float _386 = _354;
    bool _388 = !_316;
    if (!_388)
    {
        float _390 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _392 = log2(_390);
        float _394 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _396 = _394 + 1.0;
        float _398 = 1.0 / _396;
        float _400 = _306 * _392;
        float _402 = exp2(_400);
        float _404 = -_402;
        float _406 = _404 + 1.0;
        float _408 = _406 * _398;
        _334 = _408;
    }
    float _410 = _334;
    float _412 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _414 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _416 = _326 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _418 = _324 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _420 = fma(_410, _302, _412);
    float _422 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _424 = fma(_410, _300, _414);
    float _426 = _298 * _298;
    float _428 = fma(_420, _330, _320);
    float _430 = fma(_410, _304, _422);
    float _432 = fma(_424, _330, _318);
    float _434 = _328 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _436 = _428 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _438 = _428 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _440 = fma(_430, _330, _322);
    float _442 = _428 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _444 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[5].x, _436);
    float _446 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].x, _438);
    float _448 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[6].x, _442);
    float _450 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[5].z, _444);
    float _452 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[4].z, _446);
    float _454 = _416 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _456 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[6].z, _448);
    float _458 = _450 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _460 = _452 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _462 = _418 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _464 = _456 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _468 = _458 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _472 = _460 + _470;
    float _474 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _476 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _478 = _464 + _476;
    float _480 = _468 * _468;
    float _482 = fma(_472, _472, _480);
    float _484 = fma(_478, _478, _482);
    float _486 = in.m_59.w;
    float _488 = rsqrt(_484);
    float _490 = in.m_61.x;
    float _492 = in.m_61.y;
    float _494 = in.m_61.z;
    float _496 = _468 * _488;
    float _498 = _472 * _488;
    float _500 = _478 * _488;
    float _502 = -_496;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _468);
    float _506 = -_498;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _472);
    float _510 = -_500;
    float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _478);
    float _514 = _426 * _486;
    float _516 = _504 * _504;
    float _518 = _514 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _520 = fma(_508, _508, _516);
    float _522 = fma(_512, _512, _520);
    float _524 = in.m_63.x;
    float _526 = in.m_63.y;
    float _528 = in.m_63.z;
    float _530 = sqrt(_522);
    float _532 = _488 * _530;
    float _534 = _454 * _532;
    float _536 = _462 * _532;
    float _538 = fma(_526, _518, _492);
    float _540 = fma(_524, _518, _490);
    float _542 = _474 * _532;
    float _544 = fma(_528, _518, _494);
    float _546 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _538);
    float _548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _540);
    bool _550 = _538 != 0.0;
    bool _552 = isnan(_538);
    bool _554 = _550 || _552;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    float _560 = _534 * _546;
    float _562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _544);
    float _564 = _536 * _548;
    bool _566 = _540 == 0.0;
    bool _568 = !_558;
    bool _570 = _566 && _568;
    float _572 = _560 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _574 = _560 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _576 = _542 * _562;
    float _578 = _560 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _580 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[9].x, _572);
    float _582 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[8].x, _574);
    float _584 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[10].x, _578);
    float _586 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[9].z, _580);
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[8].z, _582);
    bool _590 = _544 == 0.0;
    bool _592 = _590 && _570;
    float _594 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[10].z, _584);
    float _596 = _458 + _586;
    float _598 = _460 + _588;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[191].z + _600;
    float _604 = _464 + _594;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _608 = _596 + _606;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _598 + _610;
    float _614 = 1.0 / _602;
    float _616 = _608 * _608;
    float _618 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _620 = _604 + _618;
    float _622 = fma(_612, _612, _616);
    float _624 = _612;
    float _626 = _526;
    float _628 = _620;
    float _630 = _596;
    float _632 = _486;
    if (_592)
    {
        _624 = _526;
    }
    float _634 = _624;
    float _636 = _634;
    if (!_592)
    {
        float _638 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[17].y, _526);
        _636 = _638;
    }
    float _640 = _636;
    float _642 = _640;
    if (_592)
    {
        _626 = _528;
    }
    float _644 = _626;
    float _646 = fma(_620, _620, _622);
    float _648 = _644;
    if (_592)
    {
        _628 = _524;
    }
    float _650 = _628;
    float _652 = _650;
    if (!_592)
    {
        float _654 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[17].y, _524);
        _652 = _654;
    }
    float _656 = _652;
    float _658 = _640 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _660 = sqrt(_646);
    if (!_592)
    {
        float _662 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[17].y, _528);
        _648 = _662;
    }
    float _664 = _648;
    float _666 = _640 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _668 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[10].x, _658);
    float _670 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[8].x, _666);
    float _672 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[10].z, _668);
    float _674 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[8].z, _670);
    float _676 = precise::max(_660, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _678 = precise::min(_676, (*spvDescriptorSet0.vp_c9)._m0[191].z);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _682 = _678 + _680;
    float _684 = -_682;
    float _686 = fma(_684, _614, 1.0);
    float _688 = _686 * (*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _690 = -_672;
    float _692 = fma(_690, _688, _604);
    float _694 = -_674;
    float _696 = fma(_694, _688, _598);
    float _698 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _700 = _692 + _698;
    float _702 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _704 = _696 + _702;
    float _706 = _700 * _700;
    float _708 = fma(_704, _704, _706);
    float _710 = _640 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _712 = sqrt(_708);
    float _714 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[9].x, _710);
    float _716 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[9].z, _714);
    float _718 = -_716;
    float _720 = fma(_718, _688, _596);
    bool _722 = _712 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _724 = _710;
    float _726 = _696;
    float _728 = _720;
    if (!_722)
    {
        _724 = _696;
    }
    float _730 = _724;
    float _732 = _730;
    if (!_722)
    {
        _630 = _692;
    }
    float _734 = _630;
    float _736 = _734;
    if (!_722)
    {
        _642 = _720;
    }
    float _738 = _642;
    bool _740 = !_722;
    float _742 = _738;
    if (!_740)
    {
        float _744 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _746 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _748 = _712 + _746;
        float _750 = _720 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _752 = rsqrt(_708);
        float _754 = _748 * _744;
        float _756 = _754 * 0.15915493667125701904296875;
        float _758 = _756 * 6.283185482025146484375;
        float _760 = cos(_758);
        float _762 = _756 * 6.283185482025146484375;
        float _764 = sin(_762);
        float _766 = _760 + (-1.0);
        float _768 = _766 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _770 = fma(_764, _750, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _772 = fma(_720, _760, _768);
        float _774 = _752 * _770;
        float _776 = fma(_704, _774, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _778 = fma(_700, _774, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _742 = _772;
        _732 = _776;
        _736 = _778;
        _726 = _774;
    }
    float _780 = _742;
    float _782 = _732;
    float _784 = _736;
    float _786 = _726;
    float _788 = -_496;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[18].w, _780);
    float _792 = -_498;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[18].w, _782);
    float _796 = -_500;
    float _798 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _784);
    float _800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _802 = _790 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _806 = _794 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _810 = _798 + _808;
    float _812 = _802 * _802;
    float _814 = fma(_806, _806, _812);
    float _816 = fma(_810, _810, _814);
    float _818 = rsqrt(_816);
    float _820 = sqrt(_816);
    float _822 = _818 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _824 = _806 * _822;
    float _826 = _810 * _822;
    float _828 = _824 * _824;
    float _830 = _826 * _826;
    float _832 = _828 + _830;
    float _834 = sqrt(_832);
    bool _836 = _834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _838 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _840 = _834 + _838;
    float _842 = _818;
    float _844 = _832;
    float _846 = _840;
    float _848 = _822;
    float _850 = _802;
    float _852 = _786;
    if (_836)
    {
        float _854 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _842 = _854;
    }
    float _856 = _842;
    if (_836)
    {
        float _858 = rsqrt(_832);
        _844 = _858;
    }
    float _860 = _844;
    if (_836)
    {
        float _862 = _840 * _856;
        _846 = _862;
    }
    float _864 = _846;
    if (_836)
    {
        float _866 = _864 * 0.15915493667125701904296875;
        _728 = _866;
    }
    float _868 = _728;
    float _870 = _856;
    if (_836)
    {
        float _872 = _868 * 6.283185482025146484375;
        float _874 = sin(_872);
        _870 = _874;
    }
    float _876 = _870;
    float _878 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _880 = precise::max(0.0, _878);
    float _882 = _810;
    float _884 = _880;
    if (_836)
    {
        float _886 = _868 * 6.283185482025146484375;
        float _888 = cos(_886);
        _882 = _888;
    }
    float _890 = _882;
    float _892 = -_822;
    float _894 = -_880;
    float _896 = fma(_802, _892, _894);
    if (_836)
    {
        float _898 = _896 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _884 = _898;
    }
    float _900 = _884;
    float _902 = _876;
    float _904 = _900;
    if (_836)
    {
        float _906 = fma(_876, _900, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _848 = _906;
    }
    float _908 = _848;
    float _910 = _908;
    if (!_836)
    {
        _902 = _824;
    }
    float _912 = _902;
    float _914 = _912;
    if (!_836)
    {
        _904 = _896;
    }
    float _916 = _904;
    float _918 = _916;
    float _920 = _890;
    if (_836)
    {
        float _922 = _890 + (-1.0);
        _850 = _922;
    }
    float _924 = _850;
    float _926 = 0.0;
    float _928 = _924;
    if (_836)
    {
        float _930 = _860 * _908;
        _926 = _930;
    }
    float _932 = _926;
    if (!_836)
    {
        _910 = _828;
    }
    float _934 = _910;
    float _936 = _790 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _938 = _934;
    if (_836)
    {
        float _940 = _924 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _852 = _940;
    }
    float _942 = _852;
    if (_836)
    {
        float _944 = _824 * _932;
        _914 = _944;
    }
    float _946 = _914;
    if (!_836)
    {
        _928 = _826;
    }
    float _948 = _928;
    float _950 = _948;
    if (_836)
    {
        float _952 = _826 * _932;
        _950 = _952;
    }
    float _954 = _950;
    if (_836)
    {
        float _956 = fma(_896, _890, _942);
        _918 = _956;
    }
    float _958 = _918;
    if (_836)
    {
        float _960 = _946 * _946;
        _938 = _960;
    }
    float _962 = _938;
    if (!_836)
    {
        _920 = _830;
    }
    float _964 = _920;
    float _966 = _964;
    if (_836)
    {
        float _968 = _954 * _954;
        _966 = _968;
    }
    float _970 = _966;
    float _972 = _790 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _974 = fma(_958, _958, _962);
    float _976 = _790 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _978 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[2].x, _972);
    float _980 = _974 + _970;
    float _982 = _790 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _984 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[1].x, _976);
    float _986 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[2].z, _978);
    float _988 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[3].x, _936);
    float _990 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[0].x, _982);
    float _992 = rsqrt(_980);
    float _994 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _996 = fma(_820, (*spvDescriptorSet0.vp_c15)._m0[23].w, _994);
    float _998 = precise::clamp(_996, 0.0, 1.0);
    float _1000 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[1].z, _984);
    float _1002 = _986 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1004 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[0].z, _990);
    float _1006 = -_998;
    float _1008 = _1006 + 1.0;
    float _1010 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1012 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1014 = _1004 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1016 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[3].z, _988);
    float _1018 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1020 = abs(_1008);
    float _1022 = log2(_1020);
    float _1024 = _1002 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1026 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1028 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1018);
    float _1030 = _992 * _946;
    float _1032 = _992 * _958;
    float _1034 = _992 * _954;
    float _1036 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1028);
    float _1038 = _1030 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1040 = -_1024;
    float _1042 = fma(_1040, _1012, 1.0);
    float _1044 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1036);
    float _1046 = -_1038;
    float _1048 = fma(_1032, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1046);
    float _1050 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1052 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1054 = -_1034;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1048);
    float _1058 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1060 = log2(_1042);
    float _1062 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1050);
    float _1064 = fma(_1056, -0.5, 0.5);
    float _1066 = fma(_1056, 0.5, 0.5);
    float _1068 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1058);
    float _1070 = _1032 + 1.0;
    float _1072 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1062);
    float _1074 = fma(_1066, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1076 = exp2(_1052);
    float _1078 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1068);
    float _1080 = fma(_1066, _1074, -0.212114393711090087890625);
    float _1082 = 1.0 / _1044;
    float _1084 = _1060 * 0.693147182464599609375;
    float _1086 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1088 = sqrt(_1064);
    float _1090 = -_1032;
    float _1092 = fma(_1076, _1070, _1090);
    float _1094 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1078);
    float _1096 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1072);
    float _1098 = fma(_1066, _1080, 1.570728778839111328125);
    float _1100 = fma(_1092, 0.5, 0.5);
    float _1102 = _1094 * _1082;
    float _1104 = _1096 * _1082;
    float _1106 = fma(_1102, 0.5, 0.5);
    float _1108 = fma(_1104, -0.5, 0.5);
    float _1110 = _1088 * 0.636619746685028076171875;
    float _1112 = -_1098;
    float _1114 = fma(_1110, _1112, 1.0);
    float3 _3591 = float3(_1106, _1108, _1086);
    float _1116 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3591, float3(0.0), isnan(_3591)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3591, float3(0.0), isnan(_3591)), level(0.0)).x;
    float3 _3602 = float3(_1106, _1108, _1086);
    float4 _1119 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3602, float3(0.0), isnan(_3602)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3602, float3(0.0), isnan(_3602)), level(0.0)).xyzw;
    float _1121 = _1119.x;
    float _1123 = _1119.y;
    float _1125 = _1119.z;
    float _1127 = _1119.w;
    float2 _3618 = float2(_1114, _1100);
    float3 _1131 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3618, float2(0.0), isnan(_3618)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3618, float2(0.0), isnan(_3618)), level(0.0)).xyz;
    float _1133 = _1131.x;
    float _1135 = _1131.y;
    float _1137 = _1131.z;
    float _1139 = in.m_55.w;
    float _1141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1145 = _1143 != 0;
    float _1147 = -_496;
    float _1149 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[18].w, _458);
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1153 = _1151 != 0;
    float _1155 = -_498;
    float _1157 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[18].w, _460);
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1161 = _1159 != 0;
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1165 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1167 = _232 ? as_type<int>(_196) : as_type<int>(_158);
    float _1169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1171 = -_1163;
    float _1173 = fma(_1165, 2.0, _1171);
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1177 = _1153 ? as_type<float>(_1167) : _158;
    int _1179 = 0;
    float _1181 = _1044;
    float _1183 = _1096;
    float _1185 = _1094;
    if (_1145)
    {
        float _1187 = -_182;
        float _1189 = _1187 + 1.0;
        _1179 = as_type<int>(_1189);
    }
    int _1191 = _1179;
    float _1193 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (_166)
    {
        _336 = _172;
    }
    float _1197 = _336;
    float _1199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1201 = fma(_1193, _1177, -0.5);
    float _1203 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1195);
    bool _1205 = _1139 > 0.5;
    float _1207 = _178 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1209 = -_140;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1173);
    float _1213 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1203);
    bool _1215 = _1205;
    int _1217 = as_type<int>(_1197);
    if (_1161)
    {
        float _1219 = _1205 ? _196 : _158;
        _208 = _1219;
    }
    float _1221 = _208;
    float _1223 = fma(_1207, -2.0, _1175);
    float _1225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_186)
    {
        bool _1227 = _172 > 0.5;
        _1215 = _1227;
    }
    bool _1229 = _1215;
    float _1231 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1235 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1223);
    float _1237 = fma(_1231, _1221, -0.5);
    float _1239 = -_500;
    float _1241 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[18].w, _464);
    float _1243 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1233);
    float _1245 = -_1235;
    float _1247 = fma(_1213, _1201, _1245);
    float _1249 = _1197 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1251 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1255 = _1235;
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_1145)
    {
        _1255 = _182;
    }
    float _1259 = _1255;
    float _1261 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1263 = _1259;
    if (!_166)
    {
        _1257 = _162;
    }
    float _1265 = _1257;
    float _1267 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1253);
    float _1269 = _1265;
    if (_186)
    {
        float _1271 = -_182;
        float _1273 = _1271 + 1.0;
        _1217 = as_type<int>(_1273);
    }
    int _1275 = _1217;
    if (_1145)
    {
        float _1277 = _198 ? as_type<float>(_1191) : _182;
        _1263 = _1277;
    }
    float _1279 = _1263;
    float _1281 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (_166)
    {
        _210 = _178;
    }
    float _1283 = _210;
    float _1285 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1267);
    if (_186)
    {
        float _1287 = _1229 ? as_type<float>(_1275) : _182;
        _270 = _1287;
    }
    float _1289 = _270;
    float _1291 = -_1251;
    float _1293 = fma(_1249, 2.0, _1291);
    if (_166)
    {
        _1269 = _178;
    }
    float _1295 = _1269;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1299 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1301 = fma(_1261, _1289, -0.5);
    float _1303 = fma(_1283, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1297);
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1307 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1309 = fma(_1299, _1279, -0.5);
    float _1311 = fma(_1307, -2.0, _1305);
    float _1313 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1319 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1243);
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1323 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1325 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1327 = _1317 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1329 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1303);
    float _1331 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1311);
    float _1333 = -_140;
    float _1335 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1293);
    float _1337 = fma(_1319, _1301, _1211);
    float _1339 = _1149 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1341 = -_1331;
    float _1343 = fma(_1329, _1237, _1341);
    out.m_65.x = _1323;
    out.m_65.y = _1325;
    out.m_65.z = _1327;
    out.m_65.w = _1321;
    float _1345 = fma(_1285, _1309, _1335);
    float _1347 = _1149 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1349 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1351 = exp2(_1281);
    out.m_67.x = _660;
    float _1353 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1349);
    float _1355 = _1337 + 0.5;
    bool _1357 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1359 = isnan(0.5);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1365 = _1361 || _1363;
    float _1367 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1353);
    out.m_69.x = _294;
    out.m_69.y = _296;
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1371 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1339);
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1375 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1347);
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1379 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1371);
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1383 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1375);
    float _1385 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1387 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1389 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1391 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1393 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1395 = 1.0 / _1387;
    float _1397 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1367);
    float _1399 = _1247 + 0.5;
    float _1401 = _1345 + 0.5;
    float _1403 = _1343 + 0.5;
    out.m_71.x = _1385;
    out.m_71.y = _1389;
    out.m_71.z = _1391;
    out.m_71.w = _1381;
    float _1405 = _1393 + _1387;
    float _1407 = _1044 * 0.5;
    float _1409 = -_1351;
    float _1411 = _1409 + 1.0;
    out.m_73.w = _486;
    out.m_75.x = _1355;
    out.m_75.y = _1399;
    out.m_75.z = _1401;
    out.m_75.w = _1403;
    float _1413 = _1405 * _1395;
    float _1415 = _1413 * 0.5;
    float _1417 = _1407;
    float _1419 = _1397;
    if (_1365)
    {
        _632 = 1.0;
    }
    float _1421 = _632;
    float _1423 = _1397 + _1044;
    float _1425 = _1094 + _1044;
    float _1427 = fma(_1096, -0.5, _1407);
    float _1429 = _1423 * 0.5;
    float _1431 = _1425 * 0.5;
    float _1433 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1435 = _1421;
    if (!_1365)
    {
        float _1437 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1439 = _1437 * 0.15915493667125701904296875;
        float _1441 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1443 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1445 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1443);
        float _1447 = _1439 * 6.283185482025146484375;
        float _1449 = cos(_1447);
        float _1451 = _1441 * 0.15915493667125701904296875;
        float _1453 = _1439 * 6.283185482025146484375;
        float _1455 = sin(_1453);
        float _1457 = 1.0 / _1449;
        float _1459 = _1451 * 6.283185482025146484375;
        float _1461 = cos(_1459);
        float _1463 = _1455 * _1457;
        float _1465 = _1451 * 6.283185482025146484375;
        float _1467 = sin(_1465);
        float _1469 = _1461 * _1463;
        float _1471 = 1.0 / _1445;
        float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1475 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1473;
        float _1477 = 1.0 / _1469;
        float _1479 = 1.0 / _1475;
        float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1483 = _1471 * _1481;
        float _1485 = _1467 * _1477;
        float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1489 = fma(_1485, _1483, _1487);
        float _1491 = _1489 * _1479;
        float _1493 = precise::clamp(_1491, 0.0, 1.0);
        float _1495 = -_1493;
        float _1497 = _1495 + 1.0;
        _1435 = _1497;
        _1417 = _1477;
        _338 = _1475;
    }
    float _1499 = _1435;
    float _1501 = _1417;
    float _1503 = _338;
    float _1505 = _1433 * _1116;
    float _1507 = -_1433;
    float _1509 = _1507 + 1.0;
    out.m_77.x = _1431;
    out.m_77.y = _1427;
    out.m_77.z = _1429;
    out.m_77.w = _1044;
    bool _1511 = _820 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1513 = isnan(_820);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1519 = _1515 || _1517;
    float _1521 = _1127 * _1505;
    float _1523 = _1137 * _1505;
    float _1525 = _1127 * _1509;
    out.m_79.x = _674;
    out.m_79.y = _716;
    out.m_79.z = _672;
    float _1527 = fma(_1133, _1521, _1121);
    float _1529 = fma(_1135, _1521, _1123);
    float _1531 = fma(_1127, _1523, _1125);
    out.gl_Position.x = _1094;
    out.gl_Position.y = _1096;
    out.gl_Position.z = _1397;
    out.gl_Position.w = _1044;
    float _1533 = _1499 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_81.x = _1527;
    out.m_81.y = _1529;
    out.m_81.z = _1531;
    out.m_81.w = _1525;
    float _1535 = _1503;
    float _1537 = _1501;
    if (!_1519)
    {
        _1535 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1539 = _1535;
    float _1541 = _1539;
    float _1543 = _1539;
    if (!_1519)
    {
        _1537 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1545 = _1537;
    float _1547 = _1545;
    float _1549 = _1545;
    if (!_1519)
    {
        _1181 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1551 = _1181;
    float _1553 = _1551;
    float _1555 = _1551;
    if (!_1519)
    {
        _1419 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1557 = _1419;
    float _1559 = _1557;
    float _1561 = _1557;
    if (!_1519)
    {
        _1183 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1563 = _1183;
    float _1565 = _1563;
    float _1567 = _1563;
    if (!_1519)
    {
        _1185 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1569 = _1185;
    bool _1571 = !_1519;
    float _1573 = _1569;
    float _1575 = _1569;
    if (!_1571)
    {
        bool _1577 = _820 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1579 = isnan(_820);
        bool _1581 = _1577 || _1579;
        bool _1583 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1585 = _1581 || _1583;
        if (!_1585)
        {
            float _1587 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1589 = _820 + _1587;
            float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1593 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1591;
            float _1595 = 1.0 / _1593;
            float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1599 = _1597 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1603 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1607 = _1605 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1611 = _1609 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1615 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1617 = _1589 * _1595;
            float _1619 = precise::clamp(_1617, 0.0, 1.0);
            float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1623 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1625 = fma(_1619, _1599, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1627 = fma(_1619, _1623, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1629 = fma(_1619, _1603, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1631 = fma(_1619, _1607, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1633 = fma(_1619, _1611, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1635 = fma(_1619, _1615, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1549 = _1627;
            _1567 = _1633;
            _1543 = _1625;
            _1561 = _1631;
            _1555 = _1629;
            _1575 = _1635;
            _1637 = true;
        }
        else
        {
            bool _1639 = _820 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1641 = isnan(_820);
            bool _1643 = _1639 || _1641;
            bool _1645 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1647 = _1643 || _1645;
            if (!_1647)
            {
                _1541 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1649 = _1541;
            _1543 = _1649;
            if (!_1647)
            {
                _1547 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1651 = _1547;
            _1549 = _1651;
            if (!_1647)
            {
                _1553 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1653 = _1553;
            _1555 = _1653;
            if (!_1647)
            {
                _1559 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1655 = _1559;
            _1561 = _1655;
            if (!_1647)
            {
                _1565 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1657 = _1565;
            _1567 = _1657;
            if (!_1647)
            {
                _1573 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1659 = _1573;
            bool _1661 = !_1647;
            _1575 = _1659;
            if (!_1661)
            {
                bool _1663 = _820 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1665 = isnan(_820);
                bool _1667 = _1663 || _1665;
                bool _1669 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1671 = _1667 || _1669;
                if (!_1671)
                {
                    float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1675 = _820 + _1673;
                    float _1677 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1679 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1677;
                    float _1681 = 1.0 / _1679;
                    float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1693 = _1691 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1697 = _1695 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1703 = _1675 * _1681;
                    float _1705 = precise::clamp(_1703, 0.0, 1.0);
                    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1711 = fma(_1705, _1685, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1713 = fma(_1705, _1709, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1715 = fma(_1705, _1689, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1717 = fma(_1705, _1693, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1719 = fma(_1705, _1697, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1721 = fma(_1705, _1701, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1549 = _1713;
                    _1567 = _1719;
                    _1543 = _1711;
                    _1561 = _1717;
                    _1555 = _1715;
                    _1575 = _1721;
                    _1637 = true;
                }
                else
                {
                    _1549 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1567 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1543 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1561 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1555 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1575 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1637 = false;
    float _1723 = _1549;
    float _1725 = _1567;
    float _1727 = _1543;
    float _1729 = _1561;
    float _1731 = _1555;
    float _1733 = _1575;
    float _1735 = fma(_716, -0.5, 0.5);
    float _1737 = precise::clamp(_1735, 0.0, 1.0);
    float _1739 = -_1723;
    float _1741 = _1739 + _1725;
    float _1743 = -_1727;
    float _1745 = _1743 + _1729;
    out.m_83.x = 0.0;
    float _1747 = fma(_1737, _1741, _1723);
    float _1749 = -_1731;
    float _1751 = _1749 + _1733;
    float _1753 = fma(_1737, _1745, _1727);
    float _1755 = _1747 * 0.586610972881317138671875;
    bool _1757 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1759 = fma(_1737, _1751, _1731);
    float _1761 = _1533 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1763 = fma(_1753, 0.298911988735198974609375, _1755);
    bool _1765 = _1499 > 0.0;
    bool _1767 = isnan(_1499);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan(0.0);
    bool _1773 = _1769 || _1771;
    float _1775 = fma(_1759, 0.114477999508380889892578125, _1763);
    out.m_49.x = _1761;
    float _1777 = -_1775;
    float _1779 = _1753 + _1777;
    float _1781 = -_1775;
    float _1783 = _1747 + _1781;
    float _1785 = -_1775;
    float _1787 = _1759 + _1785;
    float _1789 = fma(_1779, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1775);
    float _1791 = fma(_1783, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1775);
    float _1793 = fma(_1787, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1775);
    bool _1795 = !_1757;
    if (!_1795)
    {
        float _1797 = -_790;
        float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1801 = -_794;
        float _1803 = _1801 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1805 = -_798;
        float _1807 = _1805 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1809 = _1799 * _1799;
        float _1811 = fma(_1803, _1803, _1809);
        float _1813 = fma(_1807, _1807, _1811);
        float _1815 = sqrt(_1813);
        float _1817 = rsqrt(_1813);
        float _1819 = -_1815;
        float _1821 = _1819 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1823 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1825 = precise::clamp(_1823, 0.0, 1.0);
        float _1827 = _1803 * _1817;
        float _1829 = _1799 * _1817;
        float _1831 = abs(_1825);
        float _1833 = log2(_1831);
        float _1835 = _1807 * _1817;
        float _1837 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1839 = _716 * _1829;
        float _1841 = -_1829;
        float _1843 = -_1837;
        float _1845 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1843);
        float _1847 = fma(_674, _1827, _1839);
        float _1849 = -_1835;
        float _1851 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1845);
        float _1853 = fma(_672, _1835, _1847);
        float _1855 = precise::clamp(_1853, 0.0, 1.0);
        float _1857 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1859 = _1851 + _1857;
        float _1861 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1863 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1865 = precise::clamp(_1863, 0.0, 1.0);
        float _1867 = exp2(_1861);
        float _1869 = _1867 * _1865;
        float _1871 = _1855 * _1869;
        float _1873 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1875 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1877 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_83.x = _1873;
        out.m_83.y = _1875;
        out.m_83.z = _1877;
    }
    out.m_85.x = _1789;
    out.m_85.y = _1791;
    out.m_85.z = _1793;
    if (_1773)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _1879 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1879;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1637 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_46.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    float _116 = _114;
    if (!_108)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_108)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1938 = as_type<float>(_122);
        out.gl_Position.z = _1938;
    }
    if (!_108)
    {
        return out;
    }
    float _126 = in.m_51.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_104);
        _116 = _142;
    }
    float _144 = _116;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    if (_150)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _112;
    if (_150)
    {
        out.m_49.x = 0.0;
    }
    if (_150)
    {
        float _154 = _152 * 5.0;
        _124 = as_type<int>(_154);
    }
    int _156 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2006 = as_type<float>(_156);
        out.gl_Position.z = _2006;
    }
    if (_150)
    {
        return out;
    }
    float _158 = in.m_53.y;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _162 = in.m_55.z;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _166 = _164 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _170 = _168 != 0;
    float _172 = in.m_55.x;
    int _174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _176 = _174 != 0;
    float _178 = in.m_55.y;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _182 = in.m_53.x;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _186 = _184 != 0;
    float _188 = _160 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _194 = -_158;
    float _196 = _194 + 1.0;
    bool _198 = _162 > 0.5;
    int _200 = _198 ? as_type<int>(_196) : as_type<int>(_158);
    float _202 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[88].z, _190);
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _206 = _188;
    float _208 = _158;
    float _210 = _162;
    if (_166)
    {
        _204 = _172;
    }
    float _212 = _204;
    float _214 = _170 ? as_type<float>(_200) : _158;
    float _216 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[88].w, _192);
    float _218 = _212;
    if (!_166)
    {
        _218 = _162;
    }
    float _220 = _218;
    int _222 = 0;
    if (_176)
    {
        float _224 = -_182;
        float _226 = _224 + 1.0;
        _222 = as_type<int>(_226);
    }
    int _228 = _222;
    float _230 = fma(_214, _188, -0.5);
    bool _232 = _178 > 0.5;
    float _234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _236 = _220 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _238 = _236;
    if (!_176)
    {
        _206 = _182;
    }
    float _240 = _206;
    float _242 = _240;
    if (_176)
    {
        float _244 = _232 ? as_type<float>(_228) : _182;
        _242 = _244;
    }
    float _246 = _242;
    float _248 = -_180;
    float _250 = fma(_236, 2.0, _248);
    if (_166)
    {
        _238 = _178;
    }
    float _252 = _238;
    float _254 = -_140;
    float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[86].x, _250);
    float _258 = _252;
    if (!_166)
    {
        _258 = _172;
    }
    float _260 = _258;
    float _262 = 0.0;
    if (!_186)
    {
        _262 = _182;
    }
    float _264 = _262;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _268 = 0.0;
    float _270 = _264;
    if (!_166)
    {
        _268 = _178;
    }
    float _272 = _268;
    float _274 = _260 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _276 = _234 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _278 = fma(_274, -2.0, _266);
    float _280 = fma(_276, _246, -0.5);
    float _282 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _202);
    float _284 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _216);
    float _286 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _278);
    float _288 = fma(_282, _280, _256);
    float _290 = -_286;
    float _292 = fma(_284, _230, _290);
    float _294 = _288 + 0.5;
    float _296 = _292 + 0.5;
    float2 _2251 = float2(_294, _296);
    float _298 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, select(_2251, float2(0.0), isnan(_2251)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, select(_2251, float2(0.0), isnan(_2251)), level(0.0)).w;
    float _300 = in.m_51.x;
    float _302 = in.m_51.y;
    float _304 = in.m_51.z;
    float _306 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _308 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _312 = _308 || _310;
    bool _314 = isnan(1.0);
    bool _316 = _312 || _314;
    float _318 = in.m_46.x;
    float _320 = in.m_46.y;
    float _322 = in.m_46.z;
    float _324 = in.m_57.x;
    float _326 = in.m_57.y;
    float _328 = in.m_57.z;
    float _330 = in.m_57.w;
    float _332 = 0.0;
    float _334 = _306;
    float _336 = _272;
    float _338 = _296;
    if (!_316)
    {
        float _340 = _306 * _306;
        float _342 = _340 * 0.5;
        _332 = _342;
    }
    float _344 = _332;
    float _346 = _344;
    if (!_316)
    {
        float _348 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _346 = _348;
    }
    float _350 = _346;
    bool _352 = !_316;
    float _354 = _350;
    if (!_352)
    {
        float _356 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = log2(_356);
        float _360 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _362 = _360 + 1.0;
        float _364 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _366 = _306 * _358;
        float _368 = 1.0 / _362;
        float _370 = _364 * 0.693147182464599609375;
        float _372 = exp2(_366);
        float _374 = 1.0 / _370;
        float _376 = _372 + (-1.0);
        float _378 = -_376;
        float _380 = fma(_378, _374, _306);
        float _382 = _380 * _368;
        float _384 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _354 = _384;
    }
    float _386 = _354;
    bool _388 = !_316;
    if (!_388)
    {
        float _390 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _392 = log2(_390);
        float _394 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _396 = _394 + 1.0;
        float _398 = 1.0 / _396;
        float _400 = _306 * _392;
        float _402 = exp2(_400);
        float _404 = -_402;
        float _406 = _404 + 1.0;
        float _408 = _406 * _398;
        _334 = _408;
    }
    float _410 = _334;
    float _412 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _414 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _416 = _326 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _418 = _324 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _420 = fma(_410, _302, _412);
    float _422 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _424 = fma(_410, _300, _414);
    float _426 = _298 * _298;
    float _428 = fma(_420, _330, _320);
    float _430 = fma(_410, _304, _422);
    float _432 = fma(_424, _330, _318);
    float _434 = _328 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _436 = _428 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _438 = _428 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _440 = fma(_430, _330, _322);
    float _442 = _428 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _444 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[5].x, _436);
    float _446 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].x, _438);
    float _448 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[6].x, _442);
    float _450 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[5].z, _444);
    float _452 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[4].z, _446);
    float _454 = _416 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _456 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[6].z, _448);
    float _458 = _450 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _460 = _452 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _462 = _418 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _464 = _456 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _468 = _458 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _472 = _460 + _470;
    float _474 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _476 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _478 = _464 + _476;
    float _480 = _468 * _468;
    float _482 = fma(_472, _472, _480);
    float _484 = fma(_478, _478, _482);
    float _486 = in.m_59.w;
    float _488 = rsqrt(_484);
    float _490 = in.m_61.x;
    float _492 = in.m_61.y;
    float _494 = in.m_61.z;
    float _496 = _468 * _488;
    float _498 = _472 * _488;
    float _500 = _478 * _488;
    float _502 = -_496;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _468);
    float _506 = -_498;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _472);
    float _510 = -_500;
    float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _478);
    float _514 = _426 * _486;
    float _516 = _504 * _504;
    float _518 = _514 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _520 = fma(_508, _508, _516);
    float _522 = fma(_512, _512, _520);
    float _524 = in.m_63.x;
    float _526 = in.m_63.y;
    float _528 = in.m_63.z;
    float _530 = sqrt(_522);
    float _532 = _488 * _530;
    float _534 = _454 * _532;
    float _536 = _462 * _532;
    float _538 = fma(_526, _518, _492);
    float _540 = fma(_524, _518, _490);
    float _542 = _474 * _532;
    float _544 = fma(_528, _518, _494);
    float _546 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _538);
    float _548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _540);
    bool _550 = _538 != 0.0;
    bool _552 = isnan(_538);
    bool _554 = _550 || _552;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    float _560 = _534 * _546;
    float _562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _544);
    float _564 = _536 * _548;
    bool _566 = _540 == 0.0;
    bool _568 = !_558;
    bool _570 = _566 && _568;
    float _572 = _560 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _574 = _560 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _576 = _542 * _562;
    float _578 = _560 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _580 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[9].x, _572);
    float _582 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[8].x, _574);
    float _584 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[10].x, _578);
    float _586 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[9].z, _580);
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[8].z, _582);
    bool _590 = _544 == 0.0;
    bool _592 = _590 && _570;
    float _594 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[10].z, _584);
    float _596 = _458 + _586;
    float _598 = _460 + _588;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[191].z + _600;
    float _604 = _464 + _594;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _608 = _596 + _606;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _598 + _610;
    float _614 = 1.0 / _602;
    float _616 = _608 * _608;
    float _618 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _620 = _604 + _618;
    float _622 = fma(_612, _612, _616);
    float _624 = _612;
    float _626 = _526;
    float _628 = _620;
    float _630 = _596;
    float _632 = _486;
    if (_592)
    {
        _624 = _526;
    }
    float _634 = _624;
    float _636 = _634;
    if (!_592)
    {
        float _638 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[17].y, _526);
        _636 = _638;
    }
    float _640 = _636;
    float _642 = _640;
    if (_592)
    {
        _626 = _528;
    }
    float _644 = _626;
    float _646 = fma(_620, _620, _622);
    float _648 = _644;
    if (_592)
    {
        _628 = _524;
    }
    float _650 = _628;
    float _652 = _650;
    if (!_592)
    {
        float _654 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[17].y, _524);
        _652 = _654;
    }
    float _656 = _652;
    float _658 = _640 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _660 = sqrt(_646);
    if (!_592)
    {
        float _662 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[17].y, _528);
        _648 = _662;
    }
    float _664 = _648;
    float _666 = _640 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _668 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[10].x, _658);
    float _670 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[8].x, _666);
    float _672 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[10].z, _668);
    float _674 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[8].z, _670);
    float _676 = precise::max(_660, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _678 = precise::min(_676, (*spvDescriptorSet0.vp_c9)._m0[191].z);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _682 = _678 + _680;
    float _684 = -_682;
    float _686 = fma(_684, _614, 1.0);
    float _688 = _686 * (*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _690 = -_672;
    float _692 = fma(_690, _688, _604);
    float _694 = -_674;
    float _696 = fma(_694, _688, _598);
    float _698 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _700 = _692 + _698;
    float _702 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _704 = _696 + _702;
    float _706 = _700 * _700;
    float _708 = fma(_704, _704, _706);
    float _710 = _640 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _712 = sqrt(_708);
    float _714 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[9].x, _710);
    float _716 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[9].z, _714);
    float _718 = -_716;
    float _720 = fma(_718, _688, _596);
    bool _722 = _712 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _724 = _710;
    float _726 = _696;
    float _728 = _720;
    if (!_722)
    {
        _724 = _696;
    }
    float _730 = _724;
    float _732 = _730;
    if (!_722)
    {
        _630 = _692;
    }
    float _734 = _630;
    float _736 = _734;
    if (!_722)
    {
        _642 = _720;
    }
    float _738 = _642;
    bool _740 = !_722;
    float _742 = _738;
    if (!_740)
    {
        float _744 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _746 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _748 = _712 + _746;
        float _750 = _720 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _752 = rsqrt(_708);
        float _754 = _748 * _744;
        float _756 = _754 * 0.15915493667125701904296875;
        float _758 = _756 * 6.283185482025146484375;
        float _760 = cos(_758);
        float _762 = _756 * 6.283185482025146484375;
        float _764 = sin(_762);
        float _766 = _760 + (-1.0);
        float _768 = _766 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _770 = fma(_764, _750, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _772 = fma(_720, _760, _768);
        float _774 = _752 * _770;
        float _776 = fma(_704, _774, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _778 = fma(_700, _774, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _742 = _772;
        _732 = _776;
        _736 = _778;
        _726 = _774;
    }
    float _780 = _742;
    float _782 = _732;
    float _784 = _736;
    float _786 = _726;
    float _788 = -_496;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[18].w, _780);
    float _792 = -_498;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[18].w, _782);
    float _796 = -_500;
    float _798 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _784);
    float _800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _802 = _790 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _806 = _794 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _810 = _798 + _808;
    float _812 = _802 * _802;
    float _814 = fma(_806, _806, _812);
    float _816 = fma(_810, _810, _814);
    float _818 = rsqrt(_816);
    float _820 = sqrt(_816);
    float _822 = _818 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _824 = _806 * _822;
    float _826 = _810 * _822;
    float _828 = _824 * _824;
    float _830 = _826 * _826;
    float _832 = _828 + _830;
    float _834 = sqrt(_832);
    bool _836 = _834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _838 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _840 = _834 + _838;
    float _842 = _818;
    float _844 = _832;
    float _846 = _840;
    float _848 = _822;
    float _850 = _802;
    float _852 = _786;
    if (_836)
    {
        float _854 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _842 = _854;
    }
    float _856 = _842;
    if (_836)
    {
        float _858 = rsqrt(_832);
        _844 = _858;
    }
    float _860 = _844;
    if (_836)
    {
        float _862 = _840 * _856;
        _846 = _862;
    }
    float _864 = _846;
    if (_836)
    {
        float _866 = _864 * 0.15915493667125701904296875;
        _728 = _866;
    }
    float _868 = _728;
    float _870 = _856;
    if (_836)
    {
        float _872 = _868 * 6.283185482025146484375;
        float _874 = sin(_872);
        _870 = _874;
    }
    float _876 = _870;
    float _878 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _880 = precise::max(0.0, _878);
    float _882 = _810;
    float _884 = _880;
    if (_836)
    {
        float _886 = _868 * 6.283185482025146484375;
        float _888 = cos(_886);
        _882 = _888;
    }
    float _890 = _882;
    float _892 = -_822;
    float _894 = -_880;
    float _896 = fma(_802, _892, _894);
    if (_836)
    {
        float _898 = _896 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _884 = _898;
    }
    float _900 = _884;
    float _902 = _876;
    float _904 = _900;
    if (_836)
    {
        float _906 = fma(_876, _900, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _848 = _906;
    }
    float _908 = _848;
    float _910 = _908;
    if (!_836)
    {
        _902 = _824;
    }
    float _912 = _902;
    float _914 = _912;
    if (!_836)
    {
        _904 = _896;
    }
    float _916 = _904;
    float _918 = _916;
    float _920 = _890;
    if (_836)
    {
        float _922 = _890 + (-1.0);
        _850 = _922;
    }
    float _924 = _850;
    float _926 = 0.0;
    float _928 = _924;
    if (_836)
    {
        float _930 = _860 * _908;
        _926 = _930;
    }
    float _932 = _926;
    if (!_836)
    {
        _910 = _828;
    }
    float _934 = _910;
    float _936 = _790 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _938 = _934;
    if (_836)
    {
        float _940 = _924 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _852 = _940;
    }
    float _942 = _852;
    if (_836)
    {
        float _944 = _824 * _932;
        _914 = _944;
    }
    float _946 = _914;
    if (!_836)
    {
        _928 = _826;
    }
    float _948 = _928;
    float _950 = _948;
    if (_836)
    {
        float _952 = _826 * _932;
        _950 = _952;
    }
    float _954 = _950;
    if (_836)
    {
        float _956 = fma(_896, _890, _942);
        _918 = _956;
    }
    float _958 = _918;
    if (_836)
    {
        float _960 = _946 * _946;
        _938 = _960;
    }
    float _962 = _938;
    if (!_836)
    {
        _920 = _830;
    }
    float _964 = _920;
    float _966 = _964;
    if (_836)
    {
        float _968 = _954 * _954;
        _966 = _968;
    }
    float _970 = _966;
    float _972 = _790 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _974 = fma(_958, _958, _962);
    float _976 = _790 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _978 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[2].x, _972);
    float _980 = _974 + _970;
    float _982 = _790 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _984 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[1].x, _976);
    float _986 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[2].z, _978);
    float _988 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[3].x, _936);
    float _990 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[0].x, _982);
    float _992 = rsqrt(_980);
    float _994 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _996 = fma(_820, (*spvDescriptorSet0.vp_c15)._m0[23].w, _994);
    float _998 = precise::clamp(_996, 0.0, 1.0);
    float _1000 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[1].z, _984);
    float _1002 = _986 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1004 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[0].z, _990);
    float _1006 = -_998;
    float _1008 = _1006 + 1.0;
    float _1010 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1012 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1014 = _1004 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1016 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[3].z, _988);
    float _1018 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1020 = abs(_1008);
    float _1022 = log2(_1020);
    float _1024 = _1002 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1026 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1028 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1018);
    float _1030 = _992 * _946;
    float _1032 = _992 * _958;
    float _1034 = _992 * _954;
    float _1036 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1028);
    float _1038 = _1030 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1040 = -_1024;
    float _1042 = fma(_1040, _1012, 1.0);
    float _1044 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1036);
    float _1046 = -_1038;
    float _1048 = fma(_1032, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1046);
    float _1050 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1052 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1054 = -_1034;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1048);
    float _1058 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1060 = log2(_1042);
    float _1062 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1050);
    float _1064 = fma(_1056, -0.5, 0.5);
    float _1066 = fma(_1056, 0.5, 0.5);
    float _1068 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1058);
    float _1070 = _1032 + 1.0;
    float _1072 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1062);
    float _1074 = fma(_1066, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1076 = exp2(_1052);
    float _1078 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1068);
    float _1080 = fma(_1066, _1074, -0.212114393711090087890625);
    float _1082 = 1.0 / _1044;
    float _1084 = _1060 * 0.693147182464599609375;
    float _1086 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1088 = sqrt(_1064);
    float _1090 = -_1032;
    float _1092 = fma(_1076, _1070, _1090);
    float _1094 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1078);
    float _1096 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1072);
    float _1098 = fma(_1066, _1080, 1.570728778839111328125);
    float _1100 = fma(_1092, 0.5, 0.5);
    float _1102 = _1094 * _1082;
    float _1104 = _1096 * _1082;
    float _1106 = fma(_1102, 0.5, 0.5);
    float _1108 = fma(_1104, -0.5, 0.5);
    float _1110 = _1088 * 0.636619746685028076171875;
    float _1112 = -_1098;
    float _1114 = fma(_1110, _1112, 1.0);
    float3 _3591 = float3(_1106, _1108, _1086);
    float _1116 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3591, float3(0.0), isnan(_3591)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3591, float3(0.0), isnan(_3591)), level(0.0)).x;
    float3 _3602 = float3(_1106, _1108, _1086);
    float4 _1119 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3602, float3(0.0), isnan(_3602)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3602, float3(0.0), isnan(_3602)), level(0.0)).xyzw;
    float _1121 = _1119.x;
    float _1123 = _1119.y;
    float _1125 = _1119.z;
    float _1127 = _1119.w;
    float2 _3618 = float2(_1114, _1100);
    float3 _1131 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3618, float2(0.0), isnan(_3618)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3618, float2(0.0), isnan(_3618)), level(0.0)).xyz;
    float _1133 = _1131.x;
    float _1135 = _1131.y;
    float _1137 = _1131.z;
    float _1139 = in.m_55.w;
    float _1141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1145 = _1143 != 0;
    float _1147 = -_496;
    float _1149 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[18].w, _458);
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1153 = _1151 != 0;
    float _1155 = -_498;
    float _1157 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[18].w, _460);
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1161 = _1159 != 0;
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1165 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1167 = _232 ? as_type<int>(_196) : as_type<int>(_158);
    float _1169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1171 = -_1163;
    float _1173 = fma(_1165, 2.0, _1171);
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1177 = _1153 ? as_type<float>(_1167) : _158;
    int _1179 = 0;
    float _1181 = _1044;
    float _1183 = _1096;
    float _1185 = _1094;
    if (_1145)
    {
        float _1187 = -_182;
        float _1189 = _1187 + 1.0;
        _1179 = as_type<int>(_1189);
    }
    int _1191 = _1179;
    float _1193 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (_166)
    {
        _336 = _172;
    }
    float _1197 = _336;
    float _1199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1201 = fma(_1193, _1177, -0.5);
    float _1203 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1195);
    bool _1205 = _1139 > 0.5;
    float _1207 = _178 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1209 = -_140;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1173);
    float _1213 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1203);
    bool _1215 = _1205;
    int _1217 = as_type<int>(_1197);
    if (_1161)
    {
        float _1219 = _1205 ? _196 : _158;
        _208 = _1219;
    }
    float _1221 = _208;
    float _1223 = fma(_1207, -2.0, _1175);
    float _1225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_186)
    {
        bool _1227 = _172 > 0.5;
        _1215 = _1227;
    }
    bool _1229 = _1215;
    float _1231 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1235 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1223);
    float _1237 = fma(_1231, _1221, -0.5);
    float _1239 = -_500;
    float _1241 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[18].w, _464);
    float _1243 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1233);
    float _1245 = -_1235;
    float _1247 = fma(_1213, _1201, _1245);
    float _1249 = _1197 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1251 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1255 = _1235;
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_1145)
    {
        _1255 = _182;
    }
    float _1259 = _1255;
    float _1261 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1263 = _1259;
    if (!_166)
    {
        _1257 = _162;
    }
    float _1265 = _1257;
    float _1267 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1253);
    float _1269 = _1265;
    if (_186)
    {
        float _1271 = -_182;
        float _1273 = _1271 + 1.0;
        _1217 = as_type<int>(_1273);
    }
    int _1275 = _1217;
    if (_1145)
    {
        float _1277 = _198 ? as_type<float>(_1191) : _182;
        _1263 = _1277;
    }
    float _1279 = _1263;
    float _1281 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (_166)
    {
        _210 = _178;
    }
    float _1283 = _210;
    float _1285 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1267);
    if (_186)
    {
        float _1287 = _1229 ? as_type<float>(_1275) : _182;
        _270 = _1287;
    }
    float _1289 = _270;
    float _1291 = -_1251;
    float _1293 = fma(_1249, 2.0, _1291);
    if (_166)
    {
        _1269 = _178;
    }
    float _1295 = _1269;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1299 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1301 = fma(_1261, _1289, -0.5);
    float _1303 = fma(_1283, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1297);
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1307 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1309 = fma(_1299, _1279, -0.5);
    float _1311 = fma(_1307, -2.0, _1305);
    float _1313 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1319 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1243);
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1323 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1325 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1327 = _1317 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1329 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1303);
    float _1331 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1311);
    float _1333 = -_140;
    float _1335 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1293);
    float _1337 = fma(_1319, _1301, _1211);
    float _1339 = _1149 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1341 = -_1331;
    float _1343 = fma(_1329, _1237, _1341);
    out.m_65.x = _1323;
    out.m_65.y = _1325;
    out.m_65.z = _1327;
    out.m_65.w = _1321;
    float _1345 = fma(_1285, _1309, _1335);
    float _1347 = _1149 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1349 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1351 = exp2(_1281);
    out.m_67.x = _660;
    float _1353 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1349);
    float _1355 = _1337 + 0.5;
    bool _1357 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1359 = isnan(0.5);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1365 = _1361 || _1363;
    float _1367 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1353);
    out.m_69.x = _294;
    out.m_69.y = _296;
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1371 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1339);
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1375 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1347);
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1379 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1371);
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1383 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1375);
    float _1385 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1387 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1389 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1391 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1393 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1395 = 1.0 / _1387;
    float _1397 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1367);
    float _1399 = _1247 + 0.5;
    float _1401 = _1345 + 0.5;
    float _1403 = _1343 + 0.5;
    out.m_71.x = _1385;
    out.m_71.y = _1389;
    out.m_71.z = _1391;
    out.m_71.w = _1381;
    float _1405 = _1393 + _1387;
    float _1407 = _1044 * 0.5;
    float _1409 = -_1351;
    float _1411 = _1409 + 1.0;
    out.m_73.w = _486;
    out.m_75.x = _1355;
    out.m_75.y = _1399;
    out.m_75.z = _1401;
    out.m_75.w = _1403;
    float _1413 = _1405 * _1395;
    float _1415 = _1413 * 0.5;
    float _1417 = _1407;
    float _1419 = _1397;
    if (_1365)
    {
        _632 = 1.0;
    }
    float _1421 = _632;
    float _1423 = _1397 + _1044;
    float _1425 = _1094 + _1044;
    float _1427 = fma(_1096, -0.5, _1407);
    float _1429 = _1423 * 0.5;
    float _1431 = _1425 * 0.5;
    float _1433 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1435 = _1421;
    if (!_1365)
    {
        float _1437 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1439 = _1437 * 0.15915493667125701904296875;
        float _1441 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1443 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1445 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1443);
        float _1447 = _1439 * 6.283185482025146484375;
        float _1449 = cos(_1447);
        float _1451 = _1441 * 0.15915493667125701904296875;
        float _1453 = _1439 * 6.283185482025146484375;
        float _1455 = sin(_1453);
        float _1457 = 1.0 / _1449;
        float _1459 = _1451 * 6.283185482025146484375;
        float _1461 = cos(_1459);
        float _1463 = _1455 * _1457;
        float _1465 = _1451 * 6.283185482025146484375;
        float _1467 = sin(_1465);
        float _1469 = _1461 * _1463;
        float _1471 = 1.0 / _1445;
        float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1475 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1473;
        float _1477 = 1.0 / _1469;
        float _1479 = 1.0 / _1475;
        float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1483 = _1471 * _1481;
        float _1485 = _1467 * _1477;
        float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1489 = fma(_1485, _1483, _1487);
        float _1491 = _1489 * _1479;
        float _1493 = precise::clamp(_1491, 0.0, 1.0);
        float _1495 = -_1493;
        float _1497 = _1495 + 1.0;
        _1435 = _1497;
        _1417 = _1477;
        _338 = _1475;
    }
    float _1499 = _1435;
    float _1501 = _1417;
    float _1503 = _338;
    float _1505 = _1433 * _1116;
    float _1507 = -_1433;
    float _1509 = _1507 + 1.0;
    out.m_77.x = _1431;
    out.m_77.y = _1427;
    out.m_77.z = _1429;
    out.m_77.w = _1044;
    bool _1511 = _820 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1513 = isnan(_820);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1519 = _1515 || _1517;
    float _1521 = _1127 * _1505;
    float _1523 = _1137 * _1505;
    float _1525 = _1127 * _1509;
    out.m_79.x = _674;
    out.m_79.y = _716;
    out.m_79.z = _672;
    float _1527 = fma(_1133, _1521, _1121);
    float _1529 = fma(_1135, _1521, _1123);
    float _1531 = fma(_1127, _1523, _1125);
    out.gl_Position.x = _1094;
    out.gl_Position.y = _1096;
    out.gl_Position.z = _1397;
    out.gl_Position.w = _1044;
    float _1533 = _1499 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_81.x = _1527;
    out.m_81.y = _1529;
    out.m_81.z = _1531;
    out.m_81.w = _1525;
    float _1535 = _1503;
    float _1537 = _1501;
    if (!_1519)
    {
        _1535 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1539 = _1535;
    float _1541 = _1539;
    float _1543 = _1539;
    if (!_1519)
    {
        _1537 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1545 = _1537;
    float _1547 = _1545;
    float _1549 = _1545;
    if (!_1519)
    {
        _1181 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1551 = _1181;
    float _1553 = _1551;
    float _1555 = _1551;
    if (!_1519)
    {
        _1419 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1557 = _1419;
    float _1559 = _1557;
    float _1561 = _1557;
    if (!_1519)
    {
        _1183 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1563 = _1183;
    float _1565 = _1563;
    float _1567 = _1563;
    if (!_1519)
    {
        _1185 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1569 = _1185;
    bool _1571 = !_1519;
    float _1573 = _1569;
    float _1575 = _1569;
    if (!_1571)
    {
        bool _1577 = _820 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1579 = isnan(_820);
        bool _1581 = _1577 || _1579;
        bool _1583 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1585 = _1581 || _1583;
        if (!_1585)
        {
            float _1587 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1589 = _820 + _1587;
            float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1593 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1591;
            float _1595 = 1.0 / _1593;
            float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1599 = _1597 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1603 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1607 = _1605 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1611 = _1609 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1615 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1617 = _1589 * _1595;
            float _1619 = precise::clamp(_1617, 0.0, 1.0);
            float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1623 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1625 = fma(_1619, _1599, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1627 = fma(_1619, _1623, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1629 = fma(_1619, _1603, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1631 = fma(_1619, _1607, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1633 = fma(_1619, _1611, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1635 = fma(_1619, _1615, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1549 = _1627;
            _1567 = _1633;
            _1543 = _1625;
            _1561 = _1631;
            _1555 = _1629;
            _1575 = _1635;
            _1637 = true;
        }
        else
        {
            bool _1639 = _820 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1641 = isnan(_820);
            bool _1643 = _1639 || _1641;
            bool _1645 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1647 = _1643 || _1645;
            if (!_1647)
            {
                _1541 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1649 = _1541;
            _1543 = _1649;
            if (!_1647)
            {
                _1547 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1651 = _1547;
            _1549 = _1651;
            if (!_1647)
            {
                _1553 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1653 = _1553;
            _1555 = _1653;
            if (!_1647)
            {
                _1559 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1655 = _1559;
            _1561 = _1655;
            if (!_1647)
            {
                _1565 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1657 = _1565;
            _1567 = _1657;
            if (!_1647)
            {
                _1573 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1659 = _1573;
            bool _1661 = !_1647;
            _1575 = _1659;
            if (!_1661)
            {
                bool _1663 = _820 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1665 = isnan(_820);
                bool _1667 = _1663 || _1665;
                bool _1669 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1671 = _1667 || _1669;
                if (!_1671)
                {
                    float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1675 = _820 + _1673;
                    float _1677 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1679 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1677;
                    float _1681 = 1.0 / _1679;
                    float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1693 = _1691 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1697 = _1695 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1703 = _1675 * _1681;
                    float _1705 = precise::clamp(_1703, 0.0, 1.0);
                    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1711 = fma(_1705, _1685, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1713 = fma(_1705, _1709, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1715 = fma(_1705, _1689, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1717 = fma(_1705, _1693, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1719 = fma(_1705, _1697, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1721 = fma(_1705, _1701, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1549 = _1713;
                    _1567 = _1719;
                    _1543 = _1711;
                    _1561 = _1717;
                    _1555 = _1715;
                    _1575 = _1721;
                    _1637 = true;
                }
                else
                {
                    _1549 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1567 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1543 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1561 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1555 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1575 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1637 = false;
    float _1723 = _1549;
    float _1725 = _1567;
    float _1727 = _1543;
    float _1729 = _1561;
    float _1731 = _1555;
    float _1733 = _1575;
    float _1735 = fma(_716, -0.5, 0.5);
    float _1737 = precise::clamp(_1735, 0.0, 1.0);
    float _1739 = -_1723;
    float _1741 = _1739 + _1725;
    float _1743 = -_1727;
    float _1745 = _1743 + _1729;
    out.m_83.x = 0.0;
    float _1747 = fma(_1737, _1741, _1723);
    float _1749 = -_1731;
    float _1751 = _1749 + _1733;
    float _1753 = fma(_1737, _1745, _1727);
    float _1755 = _1747 * 0.586610972881317138671875;
    bool _1757 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1759 = fma(_1737, _1751, _1731);
    float _1761 = _1533 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1763 = fma(_1753, 0.298911988735198974609375, _1755);
    bool _1765 = _1499 > 0.0;
    bool _1767 = isnan(_1499);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan(0.0);
    bool _1773 = _1769 || _1771;
    float _1775 = fma(_1759, 0.114477999508380889892578125, _1763);
    out.m_49.x = _1761;
    float _1777 = -_1775;
    float _1779 = _1753 + _1777;
    float _1781 = -_1775;
    float _1783 = _1747 + _1781;
    float _1785 = -_1775;
    float _1787 = _1759 + _1785;
    float _1789 = fma(_1779, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1775);
    float _1791 = fma(_1783, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1775);
    float _1793 = fma(_1787, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1775);
    bool _1795 = !_1757;
    if (!_1795)
    {
        float _1797 = -_790;
        float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1801 = -_794;
        float _1803 = _1801 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1805 = -_798;
        float _1807 = _1805 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1809 = _1799 * _1799;
        float _1811 = fma(_1803, _1803, _1809);
        float _1813 = fma(_1807, _1807, _1811);
        float _1815 = sqrt(_1813);
        float _1817 = rsqrt(_1813);
        float _1819 = -_1815;
        float _1821 = _1819 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1823 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1825 = precise::clamp(_1823, 0.0, 1.0);
        float _1827 = _1803 * _1817;
        float _1829 = _1799 * _1817;
        float _1831 = abs(_1825);
        float _1833 = log2(_1831);
        float _1835 = _1807 * _1817;
        float _1837 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1839 = _716 * _1829;
        float _1841 = -_1829;
        float _1843 = -_1837;
        float _1845 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1843);
        float _1847 = fma(_674, _1827, _1839);
        float _1849 = -_1835;
        float _1851 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1845);
        float _1853 = fma(_672, _1835, _1847);
        float _1855 = precise::clamp(_1853, 0.0, 1.0);
        float _1857 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1859 = _1851 + _1857;
        float _1861 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1863 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1865 = precise::clamp(_1863, 0.0, 1.0);
        float _1867 = exp2(_1861);
        float _1869 = _1867 * _1865;
        float _1871 = _1855 * _1869;
        float _1873 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1875 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1877 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_83.x = _1873;
        out.m_83.y = _1875;
        out.m_83.z = _1877;
    }
    out.m_85.x = _1789;
    out.m_85.y = _1791;
    out.m_85.z = _1793;
    if (_1773)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _1879 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1879;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1637 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_46.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    float _116 = _114;
    if (!_108)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_108)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1938 = as_type<float>(_122);
        out.gl_Position.z = _1938;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_51.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_104);
        _116 = _142;
    }
    float _144 = _116;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    if (_150)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _112;
    if (_150)
    {
        out.m_49.x = 0.0;
    }
    if (_150)
    {
        float _154 = _152 * 5.0;
        _124 = as_type<int>(_154);
    }
    int _156 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2006 = as_type<float>(_156);
        out.gl_Position.z = _2006;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_53.y;
    float _160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _162 = in.m_55.z;
    int _164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _166 = _164 != 0;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _170 = _168 != 0;
    float _172 = in.m_55.x;
    int _174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _176 = _174 != 0;
    float _178 = in.m_55.y;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _182 = in.m_53.x;
    int _184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _186 = _184 != 0;
    float _188 = _160 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _194 = -_158;
    float _196 = _194 + 1.0;
    bool _198 = _162 > 0.5;
    int _200 = _198 ? as_type<int>(_196) : as_type<int>(_158);
    float _202 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[88].z, _190);
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _206 = _188;
    float _208 = _158;
    float _210 = _162;
    if (_166)
    {
        _204 = _172;
    }
    float _212 = _204;
    float _214 = _170 ? as_type<float>(_200) : _158;
    float _216 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[88].w, _192);
    float _218 = _212;
    if (!_166)
    {
        _218 = _162;
    }
    float _220 = _218;
    int _222 = 0;
    if (_176)
    {
        float _224 = -_182;
        float _226 = _224 + 1.0;
        _222 = as_type<int>(_226);
    }
    int _228 = _222;
    float _230 = fma(_214, _188, -0.5);
    bool _232 = _178 > 0.5;
    float _234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _236 = _220 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _238 = _236;
    if (!_176)
    {
        _206 = _182;
    }
    float _240 = _206;
    float _242 = _240;
    if (_176)
    {
        float _244 = _232 ? as_type<float>(_228) : _182;
        _242 = _244;
    }
    float _246 = _242;
    float _248 = -_180;
    float _250 = fma(_236, 2.0, _248);
    if (_166)
    {
        _238 = _178;
    }
    float _252 = _238;
    float _254 = -_140;
    float _256 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[86].x, _250);
    float _258 = _252;
    if (!_166)
    {
        _258 = _172;
    }
    float _260 = _258;
    float _262 = 0.0;
    if (!_186)
    {
        _262 = _182;
    }
    float _264 = _262;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _268 = 0.0;
    float _270 = _264;
    if (!_166)
    {
        _268 = _178;
    }
    float _272 = _268;
    float _274 = _260 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _276 = _234 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _278 = fma(_274, -2.0, _266);
    float _280 = fma(_276, _246, -0.5);
    float _282 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _202);
    float _284 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _216);
    float _286 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _278);
    float _288 = fma(_282, _280, _256);
    float _290 = -_286;
    float _292 = fma(_284, _230, _290);
    float _294 = _288 + 0.5;
    float _296 = _292 + 0.5;
    float2 _2251 = float2(_294, _296);
    float _298 = dm_bs(spvDescriptorSet0.vp_t_tcb_C.sample(spvDescriptorSet0.vp_t_tcb_CSmplr, select(_2251, float2(0.0), isnan(_2251)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_C, spvDescriptorSet0.vp_t_tcb_CSmplr_w, select(_2251, float2(0.0), isnan(_2251)), level(0.0)).w;
    float _300 = in.m_51.x;
    float _302 = in.m_51.y;
    float _304 = in.m_51.z;
    float _306 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _308 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _312 = _308 || _310;
    bool _314 = isnan(1.0);
    bool _316 = _312 || _314;
    float _318 = in.m_46.x;
    float _320 = in.m_46.y;
    float _322 = in.m_46.z;
    float _324 = in.m_57.x;
    float _326 = in.m_57.y;
    float _328 = in.m_57.z;
    float _330 = in.m_57.w;
    float _332 = 0.0;
    float _334 = _306;
    float _336 = _272;
    float _338 = _296;
    if (!_316)
    {
        float _340 = _306 * _306;
        float _342 = _340 * 0.5;
        _332 = _342;
    }
    float _344 = _332;
    float _346 = _344;
    if (!_316)
    {
        float _348 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _346 = _348;
    }
    float _350 = _346;
    bool _352 = !_316;
    float _354 = _350;
    if (!_352)
    {
        float _356 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = log2(_356);
        float _360 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _362 = _360 + 1.0;
        float _364 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _366 = _306 * _358;
        float _368 = 1.0 / _362;
        float _370 = _364 * 0.693147182464599609375;
        float _372 = exp2(_366);
        float _374 = 1.0 / _370;
        float _376 = _372 + (-1.0);
        float _378 = -_376;
        float _380 = fma(_378, _374, _306);
        float _382 = _380 * _368;
        float _384 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _354 = _384;
    }
    float _386 = _354;
    bool _388 = !_316;
    if (!_388)
    {
        float _390 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _392 = log2(_390);
        float _394 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _396 = _394 + 1.0;
        float _398 = 1.0 / _396;
        float _400 = _306 * _392;
        float _402 = exp2(_400);
        float _404 = -_402;
        float _406 = _404 + 1.0;
        float _408 = _406 * _398;
        _334 = _408;
    }
    float _410 = _334;
    float _412 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _414 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _416 = _326 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _418 = _324 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _420 = fma(_410, _302, _412);
    float _422 = _386 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _424 = fma(_410, _300, _414);
    float _426 = _298 * _298;
    float _428 = fma(_420, _330, _320);
    float _430 = fma(_410, _304, _422);
    float _432 = fma(_424, _330, _318);
    float _434 = _328 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _436 = _428 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _438 = _428 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _440 = fma(_430, _330, _322);
    float _442 = _428 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _444 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[5].x, _436);
    float _446 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[4].x, _438);
    float _448 = fma(_432, (*spvDescriptorSet0.vp_c10)._m0[6].x, _442);
    float _450 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[5].z, _444);
    float _452 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[4].z, _446);
    float _454 = _416 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _456 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[6].z, _448);
    float _458 = _450 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _460 = _452 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _462 = _418 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _464 = _456 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _466 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _468 = _458 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _472 = _460 + _470;
    float _474 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _476 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _478 = _464 + _476;
    float _480 = _468 * _468;
    float _482 = fma(_472, _472, _480);
    float _484 = fma(_478, _478, _482);
    float _486 = in.m_59.w;
    float _488 = rsqrt(_484);
    float _490 = in.m_61.x;
    float _492 = in.m_61.y;
    float _494 = in.m_61.z;
    float _496 = _468 * _488;
    float _498 = _472 * _488;
    float _500 = _478 * _488;
    float _502 = -_496;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _468);
    float _506 = -_498;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _472);
    float _510 = -_500;
    float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _478);
    float _514 = _426 * _486;
    float _516 = _504 * _504;
    float _518 = _514 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _520 = fma(_508, _508, _516);
    float _522 = fma(_512, _512, _520);
    float _524 = in.m_63.x;
    float _526 = in.m_63.y;
    float _528 = in.m_63.z;
    float _530 = sqrt(_522);
    float _532 = _488 * _530;
    float _534 = _454 * _532;
    float _536 = _462 * _532;
    float _538 = fma(_526, _518, _492);
    float _540 = fma(_524, _518, _490);
    float _542 = _474 * _532;
    float _544 = fma(_528, _518, _494);
    float _546 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _538);
    float _548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _540);
    bool _550 = _538 != 0.0;
    bool _552 = isnan(_538);
    bool _554 = _550 || _552;
    bool _556 = isnan(0.0);
    bool _558 = _554 || _556;
    float _560 = _534 * _546;
    float _562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _544);
    float _564 = _536 * _548;
    bool _566 = _540 == 0.0;
    bool _568 = !_558;
    bool _570 = _566 && _568;
    float _572 = _560 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _574 = _560 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _576 = _542 * _562;
    float _578 = _560 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _580 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[9].x, _572);
    float _582 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[8].x, _574);
    float _584 = fma(_564, (*spvDescriptorSet0.vp_c10)._m0[10].x, _578);
    float _586 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[9].z, _580);
    float _588 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[8].z, _582);
    bool _590 = _544 == 0.0;
    bool _592 = _590 && _570;
    float _594 = fma(_576, (*spvDescriptorSet0.vp_c10)._m0[10].z, _584);
    float _596 = _458 + _586;
    float _598 = _460 + _588;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[191].z + _600;
    float _604 = _464 + _594;
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _608 = _596 + _606;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _598 + _610;
    float _614 = 1.0 / _602;
    float _616 = _608 * _608;
    float _618 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _620 = _604 + _618;
    float _622 = fma(_612, _612, _616);
    float _624 = _612;
    float _626 = _526;
    float _628 = _620;
    float _630 = _596;
    float _632 = _486;
    if (_592)
    {
        _624 = _526;
    }
    float _634 = _624;
    float _636 = _634;
    if (!_592)
    {
        float _638 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[17].y, _526);
        _636 = _638;
    }
    float _640 = _636;
    float _642 = _640;
    if (_592)
    {
        _626 = _528;
    }
    float _644 = _626;
    float _646 = fma(_620, _620, _622);
    float _648 = _644;
    if (_592)
    {
        _628 = _524;
    }
    float _650 = _628;
    float _652 = _650;
    if (!_592)
    {
        float _654 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[17].y, _524);
        _652 = _654;
    }
    float _656 = _652;
    float _658 = _640 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _660 = sqrt(_646);
    if (!_592)
    {
        float _662 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[17].y, _528);
        _648 = _662;
    }
    float _664 = _648;
    float _666 = _640 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _668 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[10].x, _658);
    float _670 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[8].x, _666);
    float _672 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[10].z, _668);
    float _674 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[8].z, _670);
    float _676 = precise::max(_660, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _678 = precise::min(_676, (*spvDescriptorSet0.vp_c9)._m0[191].z);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _682 = _678 + _680;
    float _684 = -_682;
    float _686 = fma(_684, _614, 1.0);
    float _688 = _686 * (*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _690 = -_672;
    float _692 = fma(_690, _688, _604);
    float _694 = -_674;
    float _696 = fma(_694, _688, _598);
    float _698 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _700 = _692 + _698;
    float _702 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _704 = _696 + _702;
    float _706 = _700 * _700;
    float _708 = fma(_704, _704, _706);
    float _710 = _640 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _712 = sqrt(_708);
    float _714 = fma(_656, (*spvDescriptorSet0.vp_c10)._m0[9].x, _710);
    float _716 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[9].z, _714);
    float _718 = -_716;
    float _720 = fma(_718, _688, _596);
    bool _722 = _712 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _724 = _710;
    float _726 = _696;
    float _728 = _720;
    if (!_722)
    {
        _724 = _696;
    }
    float _730 = _724;
    float _732 = _730;
    if (!_722)
    {
        _630 = _692;
    }
    float _734 = _630;
    float _736 = _734;
    if (!_722)
    {
        _642 = _720;
    }
    float _738 = _642;
    bool _740 = !_722;
    float _742 = _738;
    if (!_740)
    {
        float _744 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _746 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _748 = _712 + _746;
        float _750 = _720 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _752 = rsqrt(_708);
        float _754 = _748 * _744;
        float _756 = _754 * 0.15915493667125701904296875;
        float _758 = _756 * 6.283185482025146484375;
        float _760 = cos(_758);
        float _762 = _756 * 6.283185482025146484375;
        float _764 = sin(_762);
        float _766 = _760 + (-1.0);
        float _768 = _766 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _770 = fma(_764, _750, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _772 = fma(_720, _760, _768);
        float _774 = _752 * _770;
        float _776 = fma(_704, _774, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _778 = fma(_700, _774, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _742 = _772;
        _732 = _776;
        _736 = _778;
        _726 = _774;
    }
    float _780 = _742;
    float _782 = _732;
    float _784 = _736;
    float _786 = _726;
    float _788 = -_496;
    float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[18].w, _780);
    float _792 = -_498;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[18].w, _782);
    float _796 = -_500;
    float _798 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _784);
    float _800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _802 = _790 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _806 = _794 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _810 = _798 + _808;
    float _812 = _802 * _802;
    float _814 = fma(_806, _806, _812);
    float _816 = fma(_810, _810, _814);
    float _818 = rsqrt(_816);
    float _820 = sqrt(_816);
    float _822 = _818 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _824 = _806 * _822;
    float _826 = _810 * _822;
    float _828 = _824 * _824;
    float _830 = _826 * _826;
    float _832 = _828 + _830;
    float _834 = sqrt(_832);
    bool _836 = _834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _838 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _840 = _834 + _838;
    float _842 = _818;
    float _844 = _832;
    float _846 = _840;
    float _848 = _822;
    float _850 = _802;
    float _852 = _786;
    if (_836)
    {
        float _854 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _842 = _854;
    }
    float _856 = _842;
    if (_836)
    {
        float _858 = rsqrt(_832);
        _844 = _858;
    }
    float _860 = _844;
    if (_836)
    {
        float _862 = _840 * _856;
        _846 = _862;
    }
    float _864 = _846;
    if (_836)
    {
        float _866 = _864 * 0.15915493667125701904296875;
        _728 = _866;
    }
    float _868 = _728;
    float _870 = _856;
    if (_836)
    {
        float _872 = _868 * 6.283185482025146484375;
        float _874 = sin(_872);
        _870 = _874;
    }
    float _876 = _870;
    float _878 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _880 = precise::max(0.0, _878);
    float _882 = _810;
    float _884 = _880;
    if (_836)
    {
        float _886 = _868 * 6.283185482025146484375;
        float _888 = cos(_886);
        _882 = _888;
    }
    float _890 = _882;
    float _892 = -_822;
    float _894 = -_880;
    float _896 = fma(_802, _892, _894);
    if (_836)
    {
        float _898 = _896 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _884 = _898;
    }
    float _900 = _884;
    float _902 = _876;
    float _904 = _900;
    if (_836)
    {
        float _906 = fma(_876, _900, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _848 = _906;
    }
    float _908 = _848;
    float _910 = _908;
    if (!_836)
    {
        _902 = _824;
    }
    float _912 = _902;
    float _914 = _912;
    if (!_836)
    {
        _904 = _896;
    }
    float _916 = _904;
    float _918 = _916;
    float _920 = _890;
    if (_836)
    {
        float _922 = _890 + (-1.0);
        _850 = _922;
    }
    float _924 = _850;
    float _926 = 0.0;
    float _928 = _924;
    if (_836)
    {
        float _930 = _860 * _908;
        _926 = _930;
    }
    float _932 = _926;
    if (!_836)
    {
        _910 = _828;
    }
    float _934 = _910;
    float _936 = _790 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _938 = _934;
    if (_836)
    {
        float _940 = _924 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _852 = _940;
    }
    float _942 = _852;
    if (_836)
    {
        float _944 = _824 * _932;
        _914 = _944;
    }
    float _946 = _914;
    if (!_836)
    {
        _928 = _826;
    }
    float _948 = _928;
    float _950 = _948;
    if (_836)
    {
        float _952 = _826 * _932;
        _950 = _952;
    }
    float _954 = _950;
    if (_836)
    {
        float _956 = fma(_896, _890, _942);
        _918 = _956;
    }
    float _958 = _918;
    if (_836)
    {
        float _960 = _946 * _946;
        _938 = _960;
    }
    float _962 = _938;
    if (!_836)
    {
        _920 = _830;
    }
    float _964 = _920;
    float _966 = _964;
    if (_836)
    {
        float _968 = _954 * _954;
        _966 = _968;
    }
    float _970 = _966;
    float _972 = _790 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _974 = fma(_958, _958, _962);
    float _976 = _790 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _978 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[2].x, _972);
    float _980 = _974 + _970;
    float _982 = _790 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _984 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[1].x, _976);
    float _986 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[2].z, _978);
    float _988 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[3].x, _936);
    float _990 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[0].x, _982);
    float _992 = rsqrt(_980);
    float _994 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _996 = fma(_820, (*spvDescriptorSet0.vp_c15)._m0[23].w, _994);
    float _998 = precise::clamp(_996, 0.0, 1.0);
    float _1000 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[1].z, _984);
    float _1002 = _986 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1004 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[0].z, _990);
    float _1006 = -_998;
    float _1008 = _1006 + 1.0;
    float _1010 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1012 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1014 = _1004 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1016 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[3].z, _988);
    float _1018 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1020 = abs(_1008);
    float _1022 = log2(_1020);
    float _1024 = _1002 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1026 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1028 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1018);
    float _1030 = _992 * _946;
    float _1032 = _992 * _958;
    float _1034 = _992 * _954;
    float _1036 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1028);
    float _1038 = _1030 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1040 = -_1024;
    float _1042 = fma(_1040, _1012, 1.0);
    float _1044 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1036);
    float _1046 = -_1038;
    float _1048 = fma(_1032, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1046);
    float _1050 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1052 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1054 = -_1034;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1048);
    float _1058 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1060 = log2(_1042);
    float _1062 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1050);
    float _1064 = fma(_1056, -0.5, 0.5);
    float _1066 = fma(_1056, 0.5, 0.5);
    float _1068 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1058);
    float _1070 = _1032 + 1.0;
    float _1072 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1062);
    float _1074 = fma(_1066, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1076 = exp2(_1052);
    float _1078 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1068);
    float _1080 = fma(_1066, _1074, -0.212114393711090087890625);
    float _1082 = 1.0 / _1044;
    float _1084 = _1060 * 0.693147182464599609375;
    float _1086 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1088 = sqrt(_1064);
    float _1090 = -_1032;
    float _1092 = fma(_1076, _1070, _1090);
    float _1094 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1078);
    float _1096 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1072);
    float _1098 = fma(_1066, _1080, 1.570728778839111328125);
    float _1100 = fma(_1092, 0.5, 0.5);
    float _1102 = _1094 * _1082;
    float _1104 = _1096 * _1082;
    float _1106 = fma(_1102, 0.5, 0.5);
    float _1108 = fma(_1104, -0.5, 0.5);
    float _1110 = _1088 * 0.636619746685028076171875;
    float _1112 = -_1098;
    float _1114 = fma(_1110, _1112, 1.0);
    float3 _3591 = float3(_1106, _1108, _1086);
    float _1116 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3591, float3(0.0), isnan(_3591)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3591, float3(0.0), isnan(_3591)), level(0.0)).x;
    float3 _3602 = float3(_1106, _1108, _1086);
    float4 _1119 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3602, float3(0.0), isnan(_3602)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3602, float3(0.0), isnan(_3602)), level(0.0)).xyzw;
    float _1121 = _1119.x;
    float _1123 = _1119.y;
    float _1125 = _1119.z;
    float _1127 = _1119.w;
    float2 _3618 = float2(_1114, _1100);
    float3 _1131 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3618, float2(0.0), isnan(_3618)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3618, float2(0.0), isnan(_3618)), level(0.0)).xyz;
    float _1133 = _1131.x;
    float _1135 = _1131.y;
    float _1137 = _1131.z;
    float _1139 = in.m_55.w;
    float _1141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1145 = _1143 != 0;
    float _1147 = -_496;
    float _1149 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[18].w, _458);
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1153 = _1151 != 0;
    float _1155 = -_498;
    float _1157 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[18].w, _460);
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1161 = _1159 != 0;
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1165 = _172 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1167 = _232 ? as_type<int>(_196) : as_type<int>(_158);
    float _1169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1171 = -_1163;
    float _1173 = fma(_1165, 2.0, _1171);
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1177 = _1153 ? as_type<float>(_1167) : _158;
    int _1179 = 0;
    float _1181 = _1044;
    float _1183 = _1096;
    float _1185 = _1094;
    if (_1145)
    {
        float _1187 = -_182;
        float _1189 = _1187 + 1.0;
        _1179 = as_type<int>(_1189);
    }
    int _1191 = _1179;
    float _1193 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (_166)
    {
        _336 = _172;
    }
    float _1197 = _336;
    float _1199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1201 = fma(_1193, _1177, -0.5);
    float _1203 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1195);
    bool _1205 = _1139 > 0.5;
    float _1207 = _178 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1209 = -_140;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1173);
    float _1213 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1203);
    bool _1215 = _1205;
    int _1217 = as_type<int>(_1197);
    if (_1161)
    {
        float _1219 = _1205 ? _196 : _158;
        _208 = _1219;
    }
    float _1221 = _208;
    float _1223 = fma(_1207, -2.0, _1175);
    float _1225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_186)
    {
        bool _1227 = _172 > 0.5;
        _1215 = _1227;
    }
    bool _1229 = _1215;
    float _1231 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1233 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1235 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1223);
    float _1237 = fma(_1231, _1221, -0.5);
    float _1239 = -_500;
    float _1241 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[18].w, _464);
    float _1243 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1233);
    float _1245 = -_1235;
    float _1247 = fma(_1213, _1201, _1245);
    float _1249 = _1197 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1251 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1255 = _1235;
    float _1257 = (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_1145)
    {
        _1255 = _182;
    }
    float _1259 = _1255;
    float _1261 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1263 = _1259;
    if (!_166)
    {
        _1257 = _162;
    }
    float _1265 = _1257;
    float _1267 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1253);
    float _1269 = _1265;
    if (_186)
    {
        float _1271 = -_182;
        float _1273 = _1271 + 1.0;
        _1217 = as_type<int>(_1273);
    }
    int _1275 = _1217;
    if (_1145)
    {
        float _1277 = _198 ? as_type<float>(_1191) : _182;
        _1263 = _1277;
    }
    float _1279 = _1263;
    float _1281 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (_166)
    {
        _210 = _178;
    }
    float _1283 = _210;
    float _1285 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1267);
    if (_186)
    {
        float _1287 = _1229 ? as_type<float>(_1275) : _182;
        _270 = _1287;
    }
    float _1289 = _270;
    float _1291 = -_1251;
    float _1293 = fma(_1249, 2.0, _1291);
    if (_166)
    {
        _1269 = _178;
    }
    float _1295 = _1269;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1299 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1301 = fma(_1261, _1289, -0.5);
    float _1303 = fma(_1283, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1297);
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1307 = _1295 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1309 = fma(_1299, _1279, -0.5);
    float _1311 = fma(_1307, -2.0, _1305);
    float _1313 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1315 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1319 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1243);
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1323 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1325 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1327 = _1317 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1329 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1303);
    float _1331 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1311);
    float _1333 = -_140;
    float _1335 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1293);
    float _1337 = fma(_1319, _1301, _1211);
    float _1339 = _1149 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1341 = -_1331;
    float _1343 = fma(_1329, _1237, _1341);
    out.m_65.x = _1323;
    out.m_65.y = _1325;
    out.m_65.z = _1327;
    out.m_65.w = _1321;
    float _1345 = fma(_1285, _1309, _1335);
    float _1347 = _1149 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1349 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1351 = exp2(_1281);
    out.m_67.x = _660;
    float _1353 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1349);
    float _1355 = _1337 + 0.5;
    bool _1357 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1359 = isnan(0.5);
    bool _1361 = _1357 || _1359;
    bool _1363 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1365 = _1361 || _1363;
    float _1367 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1353);
    out.m_69.x = _294;
    out.m_69.y = _296;
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1371 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1339);
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1375 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1347);
    float _1377 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1379 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1371);
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1383 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1375);
    float _1385 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1387 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1389 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1391 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1393 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1395 = 1.0 / _1387;
    float _1397 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1367);
    float _1399 = _1247 + 0.5;
    float _1401 = _1345 + 0.5;
    float _1403 = _1343 + 0.5;
    out.m_71.x = _1385;
    out.m_71.y = _1389;
    out.m_71.z = _1391;
    out.m_71.w = _1381;
    float _1405 = _1393 + _1387;
    float _1407 = _1044 * 0.5;
    float _1409 = -_1351;
    float _1411 = _1409 + 1.0;
    out.m_73.w = _486;
    out.m_75.x = _1355;
    out.m_75.y = _1399;
    out.m_75.z = _1401;
    out.m_75.w = _1403;
    float _1413 = _1405 * _1395;
    float _1415 = _1413 * 0.5;
    float _1417 = _1407;
    float _1419 = _1397;
    if (_1365)
    {
        _632 = 1.0;
    }
    float _1421 = _632;
    float _1423 = _1397 + _1044;
    float _1425 = _1094 + _1044;
    float _1427 = fma(_1096, -0.5, _1407);
    float _1429 = _1423 * 0.5;
    float _1431 = _1425 * 0.5;
    float _1433 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1435 = _1421;
    if (!_1365)
    {
        float _1437 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1439 = _1437 * 0.15915493667125701904296875;
        float _1441 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1443 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1445 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1443);
        float _1447 = _1439 * 6.283185482025146484375;
        float _1449 = cos(_1447);
        float _1451 = _1441 * 0.15915493667125701904296875;
        float _1453 = _1439 * 6.283185482025146484375;
        float _1455 = sin(_1453);
        float _1457 = 1.0 / _1449;
        float _1459 = _1451 * 6.283185482025146484375;
        float _1461 = cos(_1459);
        float _1463 = _1455 * _1457;
        float _1465 = _1451 * 6.283185482025146484375;
        float _1467 = sin(_1465);
        float _1469 = _1461 * _1463;
        float _1471 = 1.0 / _1445;
        float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1475 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1473;
        float _1477 = 1.0 / _1469;
        float _1479 = 1.0 / _1475;
        float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1483 = _1471 * _1481;
        float _1485 = _1467 * _1477;
        float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1489 = fma(_1485, _1483, _1487);
        float _1491 = _1489 * _1479;
        float _1493 = precise::clamp(_1491, 0.0, 1.0);
        float _1495 = -_1493;
        float _1497 = _1495 + 1.0;
        _1435 = _1497;
        _1417 = _1477;
        _338 = _1475;
    }
    float _1499 = _1435;
    float _1501 = _1417;
    float _1503 = _338;
    float _1505 = _1433 * _1116;
    float _1507 = -_1433;
    float _1509 = _1507 + 1.0;
    out.m_77.x = _1431;
    out.m_77.y = _1427;
    out.m_77.z = _1429;
    out.m_77.w = _1044;
    bool _1511 = _820 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1513 = isnan(_820);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1519 = _1515 || _1517;
    float _1521 = _1127 * _1505;
    float _1523 = _1137 * _1505;
    float _1525 = _1127 * _1509;
    out.m_79.x = _674;
    out.m_79.y = _716;
    out.m_79.z = _672;
    float _1527 = fma(_1133, _1521, _1121);
    float _1529 = fma(_1135, _1521, _1123);
    float _1531 = fma(_1127, _1523, _1125);
    out.gl_Position.x = _1094;
    out.gl_Position.y = _1096;
    out.gl_Position.z = _1397;
    out.gl_Position.w = _1044;
    float _1533 = _1499 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_81.x = _1527;
    out.m_81.y = _1529;
    out.m_81.z = _1531;
    out.m_81.w = _1525;
    float _1535 = _1503;
    float _1537 = _1501;
    if (!_1519)
    {
        _1535 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1539 = _1535;
    float _1541 = _1539;
    float _1543 = _1539;
    if (!_1519)
    {
        _1537 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1545 = _1537;
    float _1547 = _1545;
    float _1549 = _1545;
    if (!_1519)
    {
        _1181 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1551 = _1181;
    float _1553 = _1551;
    float _1555 = _1551;
    if (!_1519)
    {
        _1419 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1557 = _1419;
    float _1559 = _1557;
    float _1561 = _1557;
    if (!_1519)
    {
        _1183 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1563 = _1183;
    float _1565 = _1563;
    float _1567 = _1563;
    if (!_1519)
    {
        _1185 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1569 = _1185;
    bool _1571 = !_1519;
    float _1573 = _1569;
    float _1575 = _1569;
    if (!_1571)
    {
        bool _1577 = _820 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1579 = isnan(_820);
        bool _1581 = _1577 || _1579;
        bool _1583 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1585 = _1581 || _1583;
        if (!_1585)
        {
            float _1587 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1589 = _820 + _1587;
            float _1591 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1593 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1591;
            float _1595 = 1.0 / _1593;
            float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1599 = _1597 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1603 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1607 = _1605 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1611 = _1609 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1613 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1615 = _1613 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1617 = _1589 * _1595;
            float _1619 = precise::clamp(_1617, 0.0, 1.0);
            float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1623 = _1621 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1625 = fma(_1619, _1599, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1627 = fma(_1619, _1623, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1629 = fma(_1619, _1603, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1631 = fma(_1619, _1607, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1633 = fma(_1619, _1611, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1635 = fma(_1619, _1615, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1549 = _1627;
            _1567 = _1633;
            _1543 = _1625;
            _1561 = _1631;
            _1555 = _1629;
            _1575 = _1635;
            _1637 = true;
        }
        else
        {
            bool _1639 = _820 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1641 = isnan(_820);
            bool _1643 = _1639 || _1641;
            bool _1645 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1647 = _1643 || _1645;
            if (!_1647)
            {
                _1541 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1649 = _1541;
            _1543 = _1649;
            if (!_1647)
            {
                _1547 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1651 = _1547;
            _1549 = _1651;
            if (!_1647)
            {
                _1553 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1653 = _1553;
            _1555 = _1653;
            if (!_1647)
            {
                _1559 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1655 = _1559;
            _1561 = _1655;
            if (!_1647)
            {
                _1565 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1657 = _1565;
            _1567 = _1657;
            if (!_1647)
            {
                _1573 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1659 = _1573;
            bool _1661 = !_1647;
            _1575 = _1659;
            if (!_1661)
            {
                bool _1663 = _820 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1665 = isnan(_820);
                bool _1667 = _1663 || _1665;
                bool _1669 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1671 = _1667 || _1669;
                if (!_1671)
                {
                    float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1675 = _820 + _1673;
                    float _1677 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1679 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1677;
                    float _1681 = 1.0 / _1679;
                    float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1693 = _1691 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1697 = _1695 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1703 = _1675 * _1681;
                    float _1705 = precise::clamp(_1703, 0.0, 1.0);
                    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1711 = fma(_1705, _1685, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1713 = fma(_1705, _1709, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1715 = fma(_1705, _1689, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1717 = fma(_1705, _1693, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1719 = fma(_1705, _1697, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1721 = fma(_1705, _1701, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1549 = _1713;
                    _1567 = _1719;
                    _1543 = _1711;
                    _1561 = _1717;
                    _1555 = _1715;
                    _1575 = _1721;
                    _1637 = true;
                }
                else
                {
                    _1549 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1567 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1543 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1561 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1555 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1575 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1637 = false;
    float _1723 = _1549;
    float _1725 = _1567;
    float _1727 = _1543;
    float _1729 = _1561;
    float _1731 = _1555;
    float _1733 = _1575;
    float _1735 = fma(_716, -0.5, 0.5);
    float _1737 = precise::clamp(_1735, 0.0, 1.0);
    float _1739 = -_1723;
    float _1741 = _1739 + _1725;
    float _1743 = -_1727;
    float _1745 = _1743 + _1729;
    out.m_83.x = 0.0;
    float _1747 = fma(_1737, _1741, _1723);
    float _1749 = -_1731;
    float _1751 = _1749 + _1733;
    float _1753 = fma(_1737, _1745, _1727);
    float _1755 = _1747 * 0.586610972881317138671875;
    bool _1757 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1759 = fma(_1737, _1751, _1731);
    float _1761 = _1533 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1763 = fma(_1753, 0.298911988735198974609375, _1755);
    bool _1765 = _1499 > 0.0;
    bool _1767 = isnan(_1499);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan(0.0);
    bool _1773 = _1769 || _1771;
    float _1775 = fma(_1759, 0.114477999508380889892578125, _1763);
    out.m_49.x = _1761;
    float _1777 = -_1775;
    float _1779 = _1753 + _1777;
    float _1781 = -_1775;
    float _1783 = _1747 + _1781;
    float _1785 = -_1775;
    float _1787 = _1759 + _1785;
    float _1789 = fma(_1779, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1775);
    float _1791 = fma(_1783, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1775);
    float _1793 = fma(_1787, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1775);
    bool _1795 = !_1757;
    if (!_1795)
    {
        float _1797 = -_790;
        float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1801 = -_794;
        float _1803 = _1801 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1805 = -_798;
        float _1807 = _1805 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1809 = _1799 * _1799;
        float _1811 = fma(_1803, _1803, _1809);
        float _1813 = fma(_1807, _1807, _1811);
        float _1815 = sqrt(_1813);
        float _1817 = rsqrt(_1813);
        float _1819 = -_1815;
        float _1821 = _1819 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1823 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1825 = precise::clamp(_1823, 0.0, 1.0);
        float _1827 = _1803 * _1817;
        float _1829 = _1799 * _1817;
        float _1831 = abs(_1825);
        float _1833 = log2(_1831);
        float _1835 = _1807 * _1817;
        float _1837 = _1827 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1839 = _716 * _1829;
        float _1841 = -_1829;
        float _1843 = -_1837;
        float _1845 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1843);
        float _1847 = fma(_674, _1827, _1839);
        float _1849 = -_1835;
        float _1851 = fma(_1849, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1845);
        float _1853 = fma(_672, _1835, _1847);
        float _1855 = precise::clamp(_1853, 0.0, 1.0);
        float _1857 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1859 = _1851 + _1857;
        float _1861 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1863 = _1859 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1865 = precise::clamp(_1863, 0.0, 1.0);
        float _1867 = exp2(_1861);
        float _1869 = _1867 * _1865;
        float _1871 = _1855 * _1869;
        float _1873 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1875 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1877 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_83.x = _1873;
        out.m_83.y = _1875;
        out.m_83.z = _1877;
    }
    out.m_85.x = _1789;
    out.m_85.y = _1791;
    out.m_85.z = _1793;
    if (_1773)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _1879 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1879;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

