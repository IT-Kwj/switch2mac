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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_89 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_71 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_77 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_67 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3138 = false;
    bool _558 = false;
    bool _444 = false;
    bool _340 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3443 = as_type<float>(_128);
        out.gl_Position.z = _3443;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3513 = as_type<float>(_166);
        out.gl_Position.z = _3513;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _178 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _180 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _182 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _180);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _182);
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _184);
    float _192 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _186);
    bool _194 = !_174;
    float _212;
    if (!_194)
    {
        float _196 = in.m_55.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        float _216 = float(_112);
        float _218 = 1.0 / _216;
        float _220 = _146 * _218;
        _212 = _220;
    }
    _214 = false;
    float _222 = _212;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _222 + _224;
    bool _228 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _230 = isnan(_222);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    float _244 = 1.0 / _242;
    bool _246 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _248 = isnan(_222);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -_238;
    float _260 = _258 + 1.0;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _266;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _272 = _256 * _260;
    float _274 = -_256;
    float _276 = _274 + 1.0;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = _226 * _244;
    float _284 = in.m_57.x;
    float _286 = in.m_57.y;
    float _288 = in.m_57.z;
    float _290 = fma(_264, _282, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _292 = fma(_280, _282, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _294 = fma(_268, _282, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _296 = _290 * _272;
    float _298 = _292 * _272;
    float _300 = _294 * _272;
    float _302 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _304 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].y, _298);
    float _306 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].z, _300);
    float _308 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].x, _302);
    float _310 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].y, _304);
    float _312 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].z, _306);
    float _314 = _308 * _284;
    float _316 = _310 * _286;
    float _318 = _312 * _288;
    bool _320 = !_270;
    float _338;
    if (!_320)
    {
        float _322 = in.m_55.x;
        float _324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _326 = _322 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _330 = _328 * _324;
        float _332 = floor(_330);
        float _334 = -_332;
        float _336 = _330 + _334;
        _338 = _336;
        _340 = true;
    }
    else
    {
        float _342 = float(_112);
        float _344 = 1.0 / _342;
        float _346 = _146 * _344;
        _338 = _346;
    }
    _340 = false;
    float _348 = _338;
    bool _350 = _348 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _352 = isnan(_348);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _366 = _348 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _368 = isnan(_348);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _384 = _348 + _382;
    float _386 = -_360;
    float _388 = _386 + 1.0;
    bool _390 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _392 = 1.0 / _364;
    float _394 = _376 * _388;
    float _396 = -_376;
    float _398 = _396 + 1.0;
    float _400 = _380 * _392;
    float _402 = fma(_400, _384, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _404 = _402 * _394;
    float _406 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[115].x, _404);
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _414 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[116].x, _406);
    float _416 = _408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _420 = _412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _422 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _416;
    out.m_59.y = _418;
    out.m_59.z = _420;
    out.m_59.w = _422;
    bool _424 = !_390;
    float _442;
    if (!_424)
    {
        float _426 = in.m_55.x;
        float _428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _430 = _426 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[11].z, _146);
        float _434 = _432 * _428;
        float _436 = floor(_434);
        float _438 = -_436;
        float _440 = _434 + _438;
        _442 = _440;
        _444 = true;
    }
    else
    {
        float _446 = float(_112);
        float _448 = 1.0 / _446;
        float _450 = _146 * _448;
        _442 = _450;
    }
    _444 = false;
    float _452 = _442;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _456 = _452 + _454;
    bool _458 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _460 = isnan(_452);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _470;
    bool _474 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _476 = isnan(_452);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -_468;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _490;
    float _494 = 1.0 / _472;
    bool _496 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _498 = _456 * _494;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _500;
    float _504 = _484 * _488;
    float _506 = fma(_492, _498, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _508 = -_484;
    float _510 = _508 + 1.0;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _512;
    float _516 = fma(_502, _498, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _518 = _506 * _504;
    float _520 = fma(_514, _498, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _522 = _516 * _504;
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[123].x, _518);
    float _526 = _520 * _504;
    float _528 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[124].x, _524);
    float _530 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[123].y, _526);
    float _532 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[123].z, _522);
    float _534 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[124].y, _530);
    float _536 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[124].z, _532);
    bool _538 = !_496;
    float _556;
    if (!_538)
    {
        float _540 = in.m_55.x;
        float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _544 = _540 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _548 = _546 * _542;
        float _550 = floor(_548);
        float _552 = -_550;
        float _554 = _548 + _552;
        _556 = _554;
        _558 = true;
    }
    else
    {
        float _560 = float(_112);
        float _562 = 1.0 / _560;
        float _564 = _146 * _562;
        _556 = _564;
    }
    _558 = false;
    float _566 = _556;
    float _568 = in.m_55.x;
    float _570 = in.m_55.y;
    float _572 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _574 = log2(_572);
    float _576 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _578 = in.m_46.x;
    float _580 = in.m_46.y;
    float _582 = in.m_46.z;
    float _584 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _586 = in.m_55.z;
    float _588 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _590 = int(_588);
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _594 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _602 = _598 || _600;
    float _604 = _574 * _146;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _608 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _610 = int(_608);
    float _612 = _568 * 2.0;
    float _614 = _568 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _616 = _570 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _618 = exp2(_604);
    float _620 = _570 * 2.0;
    float _622 = -_606;
    float _624 = fma(_614, 2.0, _622);
    float _626 = fma(_616, -2.0, _592);
    float _628 = _580 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _630 = _580 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _632 = _580 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _634 = _570 + _568;
    float _636 = floor(_612);
    float _638 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[4].x, _628);
    float _640 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[5].x, _630);
    float _642 = _634 + (-1.0);
    float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _646 = float(_590);
    float _648 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].x, _632);
    float _650 = _570 + _586;
    float _652 = _586 * 2.0;
    float _654 = floor(_620);
    float _656 = _650 + (-1.0);
    float _658 = -_618;
    float _660 = _658 + 1.0;
    bool _662 = _636 > 0.0;
    bool _664 = _636 >= 0.0;
    bool _666 = isnan(_636);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    float _674 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _676 = floor(_652);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _680 = 1.0 + _678;
    bool _682 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _684 = isnan(1.0);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _690 = _686 || _688;
    float _692 = _602 ? _660 : 0.0;
    float _694 = 1.0 / _646;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _700 = float(_610);
    bool _702 = _654 > 0.0;
    float _704 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[78].w, _698);
    bool _706 = _654 >= 0.0;
    bool _708 = isnan(_654);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = 1.0 / _680;
    bool _718 = _676 > 0.0;
    float _720 = _700 * _146;
    bool _722 = _676 >= 0.0;
    bool _724 = isnan(_676);
    bool _726 = _722 || _724;
    bool _728 = isnan(0.0);
    bool _730 = _726 || _728;
    float _732 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[78].z, _696);
    int _734 = _672 ? 0 : 1;
    float _736 = -_146;
    float _738 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[76].x, _624);
    float _740 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _704);
    float _742 = _694 * _146;
    float _744 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _732);
    int _746 = ~_734;
    int _748 = _746 + 1;
    int _750 = _748 + 1;
    float _752 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _626);
    int _754 = _750;
    if (!_662)
    {
        int _756 = ~_734;
        int _758 = _756 + 1;
        _754 = _758;
    }
    int _760 = _754;
    float _762 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[4].z, _638);
    int _764 = _714 ? 0 : 1;
    float _766 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[5].z, _640);
    if (_690)
    {
        float _768 = _692 * _716;
        _148 = _768;
    }
    float _770 = _148;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _774 = _772 != 0;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _778 = _776 != 0;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _782 = _780 != 0;
    float _784 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[6].z, _648);
    int _786 = ~_764;
    int _788 = _786 + 1;
    int _790 = _788 + 1;
    float _792 = _766 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _794 = _790;
    if (!_702)
    {
        int _796 = ~_764;
        int _798 = _796 + 1;
        _794 = _798;
    }
    int _800 = _794;
    float _802 = _762 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _804 = !_778;
    int _806 = _804 ? 0 : 1;
    float _808 = in.m_61.x;
    float _810 = in.m_61.y;
    float _812 = in.m_61.z;
    bool _814 = !_774;
    int _816 = _814 ? 0 : 1;
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _820 = _792 + _818;
    bool _822 = !_782;
    int _824 = _822 ? 0 : 1;
    float _826 = _784 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _834 = _832 != 0;
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _838 = _836 != 0;
    float _840 = _820 * _820;
    float _842 = float(_760);
    int _844 = _730 ? 0 : 1;
    bool _846 = !_834;
    int _848 = _846 ? 0 : 1;
    bool _850 = !_830;
    int _852 = _850 ? 0 : 1;
    int _854 = abs(_848);
    int _856 = abs(_852);
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _860 = _802 + _858;
    int _862 = ~_844;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    float _868 = float(_854);
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _872 = _826 + _870;
    float _874 = fma(_860, _860, _840);
    int _876 = _866;
    if (!_718)
    {
        int _878 = ~_844;
        int _880 = _878 + 1;
        _876 = _880;
    }
    int _882 = _876;
    float _884 = _868 * _842;
    float _886 = fma(_872, _872, _874);
    float _888 = float(_882);
    float _890 = _884 * (-2.0);
    float _892 = sqrt(_886);
    float _894 = _570 + (-0.5);
    bool _896 = !_838;
    int _898 = _896 ? 0 : 1;
    float _900 = fma(_890, _810, _810);
    float _902 = float(_856);
    float _904 = fma(_674, _890, _674);
    int _906 = abs(_898);
    float _908 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[196].y, _900);
    float _910 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _912 = rsqrt(_886);
    float _914 = _902 * _888;
    float _916 = float(_800);
    float _918 = _586 + _568;
    float _920 = float(_906);
    float _922 = _910 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _924 = _892 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _926 = _918 + (-1.0);
    float _928 = _920 * _916;
    float _930 = _914 * (-2.0);
    float _932 = fma(_904, _770, _908);
    float _934 = precise::min(_922, _924);
    float _936 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _938 = _928 * (-2.0);
    float _940 = _568 + (-0.5);
    float _942 = fma(_930, _808, _808);
    float _944 = _912 * _934;
    float _946 = fma(_936, _938, _936);
    float _948 = fma(_938, _812, _812);
    float _950 = _586 + (-0.5);
    float _952 = fma(_644, _930, _644);
    float _954 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[196].x, _942);
    float _956 = _820 * _944;
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[196].z, _948);
    float _960 = _872 * _944;
    float _962 = fma(_952, _770, _954);
    float _964 = _860 * _944;
    float _966 = -_956;
    float _968 = _820 + _966;
    float _970 = fma(_946, _770, _958);
    float _972 = _932 * 0.15915493667125701904296875;
    float _974 = -_964;
    float _976 = _860 + _974;
    float _978 = _968 * _968;
    float _980 = _970 * 0.15915493667125701904296875;
    float _982 = -_960;
    float _984 = _872 + _982;
    float _986 = _962 * 0.15915493667125701904296875;
    float _988 = fma(_976, _976, _978);
    float _990 = _972 * 6.283185482025146484375;
    float _992 = sin(_990);
    float _994 = fma(_984, _984, _988);
    float _996 = in.m_63.x;
    float _998 = in.m_63.y;
    float _1000 = in.m_63.z;
    float _1002 = sqrt(_994);
    float _1004 = _972 * 6.283185482025146484375;
    float _1006 = cos(_1004);
    float _1008 = _980 * 6.283185482025146484375;
    float _1010 = cos(_1008);
    float _1012 = _912 * _1002;
    float _1014 = _576 * _1012;
    float _1016 = _910 * _1012;
    float _1018 = _986 * 6.283185482025146484375;
    float _1020 = cos(_1018);
    float _1022 = _584 * _1012;
    float _1024 = _986 * 6.283185482025146484375;
    float _1026 = sin(_1024);
    float _1028 = _1006 * _1010;
    float _1030 = _980 * 6.283185482025146484375;
    float _1032 = sin(_1030);
    float _1034 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _998);
    float _1036 = _1020 * _1006;
    float _1038 = _1020 * _992;
    float _1040 = _1020 * _1010;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _996);
    float _1044 = _1014 * _1034;
    float _1046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1000);
    float _1048 = _1026 * _992;
    float _1050 = _1026 * _1006;
    float _1052 = _1026 * _1010;
    float _1054 = _992 * _1010;
    float _1056 = _1016 * _1042;
    float _1058 = _1040 * _1044;
    float _1060 = _1022 * _1046;
    float _1062 = fma(_1032, _1036, _1048);
    float _1064 = -_1050;
    float _1066 = fma(_1032, _1038, _1064);
    float _1068 = -_1044;
    float _1070 = _1032 * _1068;
    float _1072 = -_1038;
    float _1074 = fma(_1032, _1050, _1072);
    float _1076 = fma(_1062, _1056, _1058);
    float _1078 = _1052 * _1044;
    float _1080 = fma(_1028, _1056, _1070);
    float _1082 = fma(_1032, _1048, _1036);
    float _1084 = fma(_1066, _1060, _1076);
    float _1086 = fma(_1074, _1056, _1078);
    float _1088 = fma(_1054, _1060, _1080);
    float _1090 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1092 = fma(_1082, _1060, _1086);
    float _1094 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1096 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1090);
    float _1098 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1094);
    float _1100 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1096);
    float _1102 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1098);
    float _1104 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1106 = _1102 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1108 = _826 + _1104;
    float _1110 = _802 + _1106;
    float _1112 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1114 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1116 = _1108 + _1114;
    float _1118 = -_960;
    float _1120 = _826 + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1124 = _1110 + _1122;
    float _1126 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1112);
    float _1128 = _1116 * _1116;
    float _1130 = -_956;
    float _1132 = _792 + _1130;
    float _1134 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1126);
    float _1136 = fma(_1124, _1124, _1128);
    float _1138 = -_964;
    float _1140 = _802 + _1138;
    float _1142 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1144 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1146 = sqrt(_1136);
    float _1148 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1142);
    float _1150 = _792 + _1144;
    float _1152 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1148);
    bool _1154 = _1146 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1156 = _1148;
    float _1158 = _1134;
    float _1160 = _1144;
    float _1162 = _956;
    float _1164 = _964;
    float _1166 = _960;
    float _1168 = _892;
    if (!_1154)
    {
        _1156 = _1110;
    }
    float _1170 = _1156;
    float _1172 = _1170;
    if (!_1154)
    {
        _1158 = _1108;
    }
    float _1174 = _1158;
    float _1176 = _1174;
    if (!_1154)
    {
        _1160 = _1150;
    }
    float _1178 = _1160;
    bool _1180 = !_1154;
    float _1182 = _1178;
    if (!_1180)
    {
        float _1184 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1186 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1188 = _1146 + _1186;
        float _1190 = rsqrt(_1136);
        float _1192 = _1188 * _1184;
        float _1194 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1196 = _1192 * 0.15915493667125701904296875;
        float _1198 = _1196 * 6.283185482025146484375;
        float _1200 = cos(_1198);
        float _1202 = _1196 * 6.283185482025146484375;
        float _1204 = sin(_1202);
        float _1206 = _1200 + (-1.0);
        float _1208 = _1206 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1210 = fma(_1204, _1194, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1212 = fma(_1150, _1200, _1208);
        float _1214 = _1190 * _1210;
        float _1216 = fma(_1124, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1218 = fma(_1116, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1182 = _1212;
        _1172 = _1216;
        _1176 = _1218;
    }
    float _1220 = _1182;
    float _1222 = _1172;
    float _1224 = _1176;
    float _1226 = -_792;
    float _1228 = _1226 + _1220;
    float _1230 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1232 = -_802;
    float _1234 = _1232 + _1222;
    float _1236 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1238 = _1228 * _1228;
    float _1240 = -_826;
    float _1242 = _1240 + _1224;
    float _1244 = 1.0 / _1230;
    float _1246 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1236);
    float _1248 = fma(_1234, _1234, _1238);
    float _1250 = -_956;
    float _1252 = _1250 + _1220;
    float _1254 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1246);
    float _1256 = fma(_1242, _1242, _1248);
    float _1258 = -_960;
    float _1260 = _1258 + _1224;
    float _1262 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1264 = sqrt(_1256);
    bool _1266 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1268 = isnan(0.5);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1274 = _1270 || _1272;
    float _1276 = _1262 + _1230;
    bool _1278 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1280 = isnan(0.5);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1286 = _1282 || _1284;
    float _1288 = _1276 * _1244;
    float _1290 = _1288 * 0.5;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1294 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1292);
    float _1296 = -_964;
    float _1298 = _1296 + _1222;
    float _1300 = 1.0 / _1294;
    bool _1302 = _1264 > 0.0;
    float _1304 = _1230;
    float _1306 = _1244;
    float _1308 = _1234;
    float _1310 = _1294;
    if (!_1302)
    {
        _1162 = _1298;
    }
    float _1312 = _1162;
    float _1314 = _1312;
    if (!_1302)
    {
        _1164 = _1252;
    }
    float _1316 = _1164;
    float _1318 = _1316;
    if (!_1302)
    {
        _1166 = _1260;
    }
    float _1320 = _1166;
    bool _1322 = !_1302;
    float _1324 = _1320;
    float _1326 = _1320;
    if (!_1322)
    {
        float _1328 = _190 * _190;
        float _1330 = fma(_188, _188, _1328);
        float _1332 = rsqrt(_1256);
        float _1334 = fma(_192, _192, _1330);
        float _1336 = sqrt(_1334);
        float _1338 = _1234 * _1332;
        float _1340 = _1228 * _1332;
        float _1342 = _1242 * _1332;
        bool _1344 = _1336 > 0.0;
        float _1346 = _1332;
        float _1348 = _1336;
        _1304 = _1338;
        _1306 = _1340;
        if (!_1344)
        {
            _1346 = _1298;
        }
        float _1350 = _1346;
        _1314 = _1350;
        if (!_1344)
        {
            _1348 = _1252;
        }
        float _1352 = _1348;
        _1318 = _1352;
        if (!_1344)
        {
            _1324 = _1260;
        }
        float _1354 = _1324;
        bool _1356 = !_1344;
        _1326 = _1354;
        if (!_1356)
        {
            float _1358 = rsqrt(_1334);
            float _1360 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1362 = _190 * _1358;
            float _1364 = _188 * _1358;
            float _1366 = _1340 * _1362;
            float _1368 = _192 * _1358;
            float _1370 = fma(_1338, _1364, _1366);
            float _1372 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1374 = fma(_1342, _1368, _1370);
            float _1376 = _1374 * _1372;
            float _1378 = fma(_188, _1376, _1298);
            float _1380 = fma(_190, _1376, _1252);
            float _1382 = fma(_192, _1376, _1260);
            _1314 = _1378;
            _1318 = _1380;
            _1326 = _1382;
        }
    }
    float _1384 = _1314;
    float _1386 = _1318;
    float _1388 = _1326;
    float _1390 = _1304;
    float _1392 = _1306;
    float _1394 = _1392;
    float _1396 = _1386;
    float _1398 = _1384;
    float _1400 = _1388;
    float _1402 = _1390;
    if (_1286)
    {
        _1394 = 1.0;
    }
    float _1404 = _1394;
    float _1406 = _1404;
    if (!_1274)
    {
        float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1410 = _1132 + _1408;
        float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1414 = _1140 + _1412;
        float _1416 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1418 = _1410 * _1410;
        float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1422 = _1120 + _1420;
        float _1424 = fma(_1414, _1414, _1418);
        float _1426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1428 = fma(_1422, _1422, _1424);
        float _1430 = sqrt(_1428);
        float _1432 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1434 = precise::min(_1430, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1436 = _1434 * _1426;
        float _1438 = -_1140;
        float _1440 = _1438 + _1384;
        float _1442 = _1432 * _1436;
        float _1444 = -_1132;
        float _1446 = _1444 + _1386;
        float _1448 = -_1120;
        float _1450 = _1448 + _1388;
        float _1452 = fma(_1440, _1442, _1140);
        float _1454 = fma(_1446, _1442, _1132);
        float _1456 = fma(_1450, _1442, _1120);
        _1396 = _1454;
        _1398 = _1452;
        _1400 = _1456;
    }
    float _1458 = _1396;
    float _1460 = _1398;
    float _1462 = _1400;
    if (_1286)
    {
        _1308 = 1.0;
    }
    float _1464 = _1308;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1468 = _1300 * _1466;
    float _1470 = _1464;
    if (!_1286)
    {
        float _1472 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1474 = _1472 * 0.15915493667125701904296875;
        float _1476 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1480 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1478;
        float _1482 = _1474 * 6.283185482025146484375;
        float _1484 = cos(_1482);
        float _1486 = _1476 * 0.15915493667125701904296875;
        float _1488 = _1474 * 6.283185482025146484375;
        float _1490 = sin(_1488);
        float _1492 = 1.0 / _1484;
        float _1494 = _1486 * 6.283185482025146484375;
        float _1496 = cos(_1494);
        float _1498 = _1490 * _1492;
        float _1500 = _1486 * 6.283185482025146484375;
        float _1502 = sin(_1500);
        float _1504 = _1496 * _1498;
        float _1506 = 1.0 / _1480;
        float _1508 = 1.0 / _1504;
        float _1510 = _1502 * _1508;
        float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1514 = fma(_1468, _1510, _1512);
        float _1516 = _1514 * _1506;
        float _1518 = precise::clamp(_1516, 0.0, 1.0);
        _1310 = _1486;
        _1402 = _1474;
        _1406 = _1518;
    }
    float _1520 = _1310;
    float _1522 = _1402;
    float _1524 = _1406;
    float _1526 = _1522;
    float _1528 = _1520;
    if (!_1286)
    {
        float _1530 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1532 = _1530 * 0.15915493667125701904296875;
        float _1534 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1536 = _1532 * 6.283185482025146484375;
        float _1538 = cos(_1536);
        float _1540 = _1534 * 0.15915493667125701904296875;
        float _1542 = _1532 * 6.283185482025146484375;
        float _1544 = sin(_1542);
        float _1546 = 1.0 / _1538;
        float _1548 = _1540 * 6.283185482025146484375;
        float _1550 = cos(_1548);
        float _1552 = _1544 * _1546;
        float _1554 = _1540 * 6.283185482025146484375;
        float _1556 = sin(_1554);
        float _1558 = _1550 * _1552;
        float _1560 = 1.0 / _1558;
        float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1564 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1562;
        float _1566 = 1.0 / _1564;
        float _1568 = _1556 * _1560;
        float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1572 = fma(_1468, _1568, _1570);
        float _1574 = _1572 * _1566;
        float _1576 = precise::clamp(_1574, 0.0, 1.0);
        float _1578 = -_1576;
        float _1580 = _1578 + 1.0;
        _1526 = _1558;
        _1470 = _1580;
    }
    float _1582 = _1526;
    float _1584 = _1470;
    float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1588 = _1458 + _1586;
    float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1592 = _1460 + _1590;
    float _1594 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1596 = _1462 + _1594;
    float _1598 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1600 = _1588 * _1588;
    float _1602 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1598);
    float _1604 = fma(_1592, _1592, _1600);
    float _1606 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1608 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1602);
    float _1610 = fma(_1596, _1596, _1604);
    float _1612 = _1608 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1614 = rsqrt(_1610);
    float _1616 = sqrt(_1610);
    float _1618 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1620 = _1592 * _1618;
    float _1622 = _1596 * _1618;
    float _1624 = _1620 * _1620;
    float _1626 = _1622 * _1622;
    float _1628 = _1624 + _1626;
    float _1630 = sqrt(_1628);
    bool _1632 = _1630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1636 = _1630 + _1634;
    float _1638 = _1596;
    float _1640 = _1628;
    float _1642 = _1636;
    float _1644 = _1582;
    if (_1632)
    {
        float _1646 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1638 = _1646;
    }
    float _1648 = _1638;
    if (_1632)
    {
        float _1650 = rsqrt(_1628);
        _1640 = _1650;
    }
    float _1652 = _1640;
    float _1654 = _1652;
    if (_1632)
    {
        float _1656 = _1636 * _1648;
        _1642 = _1656;
    }
    float _1658 = _1642;
    if (_1632)
    {
        float _1660 = _1658 * 0.15915493667125701904296875;
        _1528 = _1660;
    }
    float _1662 = _1528;
    float _1664 = _1648;
    float _1666 = _1662;
    if (_1632)
    {
        float _1668 = _1662 * 6.283185482025146484375;
        float _1670 = sin(_1668);
        _1664 = _1670;
    }
    float _1672 = _1664;
    float _1674 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1676 = precise::max(0.0, _1674);
    float _1678 = _1600;
    float _1680 = _1676;
    if (_1632)
    {
        float _1682 = _1662 * 6.283185482025146484375;
        float _1684 = cos(_1682);
        _1678 = _1684;
    }
    float _1686 = _1678;
    float _1688 = -_1618;
    float _1690 = -_1676;
    float _1692 = fma(_1588, _1688, _1690);
    if (_1632)
    {
        float _1694 = _1692 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1680 = _1694;
    }
    float _1696 = _1680;
    float _1698 = _1696;
    if (!_1632)
    {
        _1666 = _1692;
    }
    float _1700 = _1666;
    float _1702 = fma(_1140, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1704 = _1672;
    float _1706 = _1700;
    if (_1632)
    {
        float _1708 = fma(_1672, _1696, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1704 = _1708;
    }
    float _1710 = _1704;
    float _1712 = floor(_1702);
    float _1714 = _1710;
    float _1716 = _1686;
    if (_1632)
    {
        float _1718 = _1686 + (-1.0);
        _1698 = _1718;
    }
    float _1720 = _1698;
    float _1722 = _1720;
    if (_1632)
    {
        float _1724 = _1652 * _1710;
        _1168 = _1724;
    }
    float _1726 = _1168;
    if (!_1632)
    {
        _1714 = _1620;
    }
    float _1728 = _1714;
    float _1730 = _1728;
    if (_1632)
    {
        float _1732 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1644 = _1732;
    }
    float _1734 = _1644;
    if (_1632)
    {
        float _1736 = _1620 * _1726;
        _1730 = _1736;
    }
    float _1738 = _1730;
    if (!_1632)
    {
        _1654 = _1622;
    }
    float _1740 = _1654;
    float _1742 = _1740;
    if (_1632)
    {
        float _1744 = _1622 * _1726;
        _1742 = _1744;
    }
    float _1746 = _1742;
    if (!_1632)
    {
        _1722 = _1624;
    }
    float _1748 = _1722;
    float _1750 = _1748;
    if (_1632)
    {
        float _1752 = fma(_1692, _1686, _1734);
        _1706 = _1752;
    }
    float _1754 = _1706;
    if (_1632)
    {
        float _1756 = _1738 * _1738;
        _1750 = _1756;
    }
    float _1758 = _1750;
    float _1760 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1632)
    {
        _1716 = _1626;
    }
    float _1762 = _1716;
    float _1764 = _1762;
    if (_1632)
    {
        float _1766 = _1746 * _1746;
        _1764 = _1766;
    }
    float _1768 = _1764;
    float _1770 = fma(_1754, _1754, _1758);
    float _1772 = fma(_1120, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1774 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1776 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1760);
    float _1778 = _1770 + _1768;
    float _1780 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1782 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1774);
    float _1784 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1776);
    float _1786 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1780);
    float _1788 = rsqrt(_1778);
    float _1790 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1782);
    float _1792 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1796 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1794);
    float _1798 = precise::clamp(_1796, 0.0, 1.0);
    float _1800 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1786);
    float _1802 = _1790 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1804 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1806 = -_1798;
    float _1808 = _1806 + 1.0;
    float _1810 = _1800 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1812 = floor(_1772);
    float _1814 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1804);
    float _1816 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1818 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1814);
    float _1820 = _1788 * _1738;
    float _1822 = abs(_1808);
    float _1824 = log2(_1822);
    float _1826 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1818);
    float _1828 = _1788 * _1754;
    float _1830 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1832 = _1788 * _1746;
    float _1834 = -_1816;
    float _1836 = fma(_1834, _1606, 1.0);
    float _1838 = -_1712;
    float _1840 = _1702 + _1838;
    float _1842 = -_1830;
    float _1844 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1842);
    float _1846 = 1.0 / _1826;
    float _1848 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1850 = -_1812;
    float _1852 = _1772 + _1850;
    float _1854 = -_1832;
    float _1856 = fma(_1854, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1844);
    float _1858 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1860 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1848);
    float _1862 = _1828 + 1.0;
    float _1864 = log2(_1836);
    float _1866 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1868 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1858);
    float _1870 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1860);
    float _1872 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1868);
    float _1874 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1870);
    float _1876 = exp2(_1866);
    float _1878 = fma(_1856, -0.5, 0.5);
    float _1880 = fma(_1856, 0.5, 0.5);
    float _1882 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1872);
    float _1884 = _1874 * _1846;
    float _1886 = fma(_1880, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1888 = _1882 * _1846;
    float _1890 = sqrt(_1878);
    float _1892 = _1864 * 0.693147182464599609375;
    float _1894 = fma(_1880, _1886, -0.212114393711090087890625);
    float _1896 = fma(_1884, 0.5, 0.5);
    float _1898 = fma(_1888, -0.5, 0.5);
    float _1900 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1902 = fma(_1880, _1894, 1.570728778839111328125);
    float _1904 = -_1828;
    float _1906 = fma(_1876, _1862, _1904);
    float _1908 = _1890 * 0.636619746685028076171875;
    float _1910 = -_1902;
    float _1912 = fma(_1908, _1910, 1.0);
    float _1914 = fma(_1906, 0.5, 0.5);
    float2 _6235 = float2(_1840, _1852);
    float _1916 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6235, float2(0.0), isnan(_6235)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6235, float2(0.0), isnan(_6235)), level(0.0)).x;
    float3 _6246 = float3(_1896, _1898, _1900);
    float _1918 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6246, float3(0.0), isnan(_6246)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6246, float3(0.0), isnan(_6246)), level(0.0)).x;
    float3 _6257 = float3(_1896, _1898, _1900);
    float4 _1921 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6257, float3(0.0), isnan(_6257)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6257, float3(0.0), isnan(_6257)), level(0.0)).xyzw;
    float _1923 = _1921.x;
    float _1925 = _1921.y;
    float _1927 = _1921.z;
    float _1929 = _1921.w;
    float2 _6273 = float2(_1912, _1914);
    float3 _1933 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6273, float2(0.0), isnan(_6273)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6273, float2(0.0), isnan(_6273)), level(0.0)).xyz;
    float _1935 = _1933.x;
    float _1937 = _1933.y;
    float _1939 = _1933.z;
    float _1941 = float(uint(_610));
    float _1943 = trunc(_742);
    int _1945 = int(_1943);
    bool _1947 = _610 == 0;
    float _1949 = _536 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1951 = abs(_806);
    out.m_65.x = _1140;
    out.m_65.y = _1132;
    out.m_65.z = _1120;
    int _1953 = ~_610;
    int _1955 = _1953 + 1;
    float _1957 = _1949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1959 = _570 > 0.5;
    float _1961 = 1.0 / _1941;
    float _1963 = in.m_67.y;
    int _1965 = ~_610;
    int _1967 = _1965 + 1;
    float _1969 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_69.w = _934;
    float _1971 = float(uint(_1945));
    float _1973 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1975 = float(_112);
    float _1977 = exp2(_1969);
    float _1979 = float(_1945);
    float _1981 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1973);
    float _1983 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_71.x = _1016;
    int _1985 = as_type<int>(_1961) + (-2);
    float _1987 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1981);
    bool _1989 = _1979 >= _700;
    bool _1991 = isnan(_1979);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan(_700);
    bool _1997 = _1993 || _1995;
    float _1999 = float(_1997);
    float _2001 = 1.0 / _1975;
    out.m_73.x = _1460;
    out.m_73.y = _1458;
    out.m_73.z = _1462;
    float _2003 = as_type<float>(_1985) * _1971;
    float _2005 = -_1963;
    float _2007 = _2005 + 1.0;
    float _2009 = trunc(_2003);
    float _2011 = precise::max(_2009, 0.0);
    uint _2014 = uint(_2011);
    float _2016 = -_1977;
    float _2018 = _2016 + 1.0;
    float _2020 = trunc(_1999);
    int _2022 = int(_2020);
    int _2024 = ~_610;
    int _2026 = _2024 + 1;
    int _2028 = _1955 * int(_2014);
    int _2030 = _2028 + _1945;
    float _2032 = float(uint(_2030));
    int _2034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2036 = _2034 != 0;
    float _2038 = as_type<float>(_1985) * _2032;
    float _2040 = trunc(_2038);
    float _2042 = precise::max(_2040, 0.0);
    uint _2044 = uint(_2042);
    bool _2046 = !_2036;
    float _2048 = _2046 ? 7.345489978790283203125 : 1.0;
    float _2050 = _2048 * _568;
    float _2052 = _720 * _2001;
    float _2054 = floor(_2050);
    int _2056 = ~_2022;
    int _2058 = _2056 + 1;
    int _2060 = _2058 + 1;
    int _2062 = int(_2014) + int(_2044);
    float _2064 = trunc(_2052);
    int _2066 = int(_2064);
    int _2068 = _2026 * _2062;
    int _2070 = _2068 + _1945;
    float _2072 = -_2054;
    float _2074 = _2050 + _2072;
    bool _2076 = uint(_2070) >= uint(_610);
    float _2078 = _2074 * _700;
    bool _2080 = !_2076;
    int _2082 = _2080 ? 0 : (-1);
    int _2084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2086 = _2084 != 0;
    float _2088 = trunc(_2078);
    int _2090 = int(_2088);
    int _2092 = ~_2062;
    int _2094 = _2092 + _2082;
    int _2096 = _2094 + 1;
    int _2098 = _610 + (-1);
    int _2100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2102 = _2100 != 0;
    int _2104 = _610 * _2096;
    int _2106 = _2104 + _1945;
    int _2108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2110 = _2108 != 0;
    bool _2112 = !_1947;
    int _2114 = _2112 ? _2106 : (-1);
    bool _2116 = !_2086;
    int _2118 = _2116 ? 0 : 1;
    int _2120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2122 = _2120 != 0;
    int _2124 = _2114 * _2060;
    int _2126 = abs(_2118);
    int _2128 = abs(_824);
    int _2130 = _2022 * _2098;
    int _2132 = _2130 + _2124;
    int _2134 = abs(_816);
    bool _2136 = !_2122;
    int _2138 = _2136 ? 0 : 1;
    int _2140 = _2132 * _1951;
    int _2142 = _2090 * _2126;
    int _2144 = _2142 + _1945;
    int _2146 = abs(_2138);
    int _2148 = _2066 * _2134;
    int _2150 = _2148 + _2140;
    float _2152 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2154 = _2152 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2156 = float(uint(_2144));
    float _2158 = _1963;
    float _2160 = _1826;
    float _2162 = _1882;
    float _2164 = _1874;
    if (_2102)
    {
        float _2166 = _1959 ? _2007 : _1963;
        _2158 = _2166;
    }
    float _2168 = _2158;
    int _2170 = _2144 * _2128;
    int _2172 = _2170 + _2150;
    int _2174 = ~_610;
    int _2176 = _2174 + 1;
    float _2178 = as_type<float>(_1985) * _2156;
    int _2180 = _2090 * _2146;
    int _2182 = _2180 + _2172;
    float _2184 = trunc(_2178);
    float _2186 = precise::max(_2184, 0.0);
    uint _2188 = uint(_2186);
    float _2190 = float(uint(_2182));
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2192;
    float _2196 = as_type<float>(_1985) * _2190;
    float _2198 = trunc(_2196);
    float _2200 = precise::max(_2198, 0.0);
    uint _2202 = uint(_2200);
    int _2204 = ~_610;
    int _2206 = _2204 + 1;
    int _2208 = _2176 * int(_2202);
    int _2210 = _2208 + _2182;
    float _2212 = float(uint(_2210));
    int _2214 = ~_610;
    int _2216 = _2214 + 1;
    float _2218 = as_type<float>(_1985) * _2212;
    float _2220 = trunc(_2218);
    float _2222 = precise::max(_2220, 0.0);
    uint _2224 = uint(_2222);
    int _2226 = int(_2202) + int(_2224);
    int _2228 = _2216 * int(_2188);
    int _2230 = _2228 + _2144;
    float _2232 = 1.0 / _2154;
    int _2234 = _2206 * _2226;
    int _2236 = _2234 + _2182;
    float _2238 = float(uint(_2230));
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2242 = _2240 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2244 = uint(_2236) >= uint(_610);
    float _2246 = as_type<float>(_1985) * _2238;
    bool _2248 = !_2244;
    int _2250 = _2248 ? 0 : (-1);
    float _2252 = trunc(_2246);
    float _2254 = precise::max(_2252, 0.0);
    uint _2256 = uint(_2254);
    int _2258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2260 = _2258 != 0;
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    int _2262 = ~_2226;
    int _2264 = _2262 + _2250;
    int _2266 = _2264 + 1;
    float _2268 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2270 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2268;
    bool _2272 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2274 = isnan(_566);
    bool _2276 = _2272 || _2274;
    bool _2278 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2280 = _2276 || _2278;
    float _2282 = float(_2280);
    int _2284 = _610 * _2266;
    int _2286 = _2284 + _2182;
    float _2288 = _2270 * _2232;
    float _2290 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2292 = _566 + _2290;
    float _2294 = -_2282;
    float _2296 = _2294 + 1.0;
    bool _2298 = !_1947;
    int _2300 = _2298 ? _2286 : (-1);
    float _2302 = fma(_2288, _2292, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2304 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2306 = isnan(_566);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2312 = _2308 || _2310;
    float _2314 = float(_2312);
    float _2316 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2318 = _2316 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2320 = _2300 >> 31;
    int _2322 = int(_2188) + int(_2256);
    float _2324 = -_2314;
    float _2326 = _2324 + 1.0;
    int _2328 = _2320 & 3;
    float _2330 = 1.0 / _2318;
    bool _2332 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2334 = isnan(_566);
    bool _2336 = _2332 || _2334;
    bool _2338 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2340 = _2336 || _2338;
    float _2342 = float(_2340);
    int _2344 = _1967 * _2322;
    int _2346 = _2344 + _2144;
    int _2348 = _2300 + _2328;
    float _2350 = _2342 * _2326;
    int _2352 = _2348 >> 2;
    float _2354 = -_2342;
    float _2356 = _2354 + 1.0;
    bool _2358 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2360 = isnan(_566);
    bool _2362 = _2358 || _2360;
    bool _2364 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2366 = _2362 || _2364;
    float _2368 = float(_2366);
    float _2370 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2372 = _2370 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2374 = _2352 << 4;
    int _2376 = _2374 + 368;
    float _2378 = _2282 * _2356;
    bool _2380 = uint(_2346) >= uint(_610);
    float _2382 = _2368 * _2296;
    uint _2384 = uint(int(uint(_2376) >> uint(2)));
    uint _2386 = uint(int(uint(int(_2384)) >> uint(2)));
    int _2388 = int(_2384) & 3;
    float _2390 = (*spvDescriptorSet0.vp_c9)._m0[int(_2386)][_2388];
    int _2392 = int(_2384) + 1;
    uint _2394 = uint(int(uint(_2392) >> uint(2)));
    int _2396 = _2392 & 3;
    float _2398 = (*spvDescriptorSet0.vp_c9)._m0[int(_2394)][_2396];
    float _2400 = 1.0 / _2372;
    bool _2402 = !_2380;
    int _2404 = _2402 ? 0 : (-1);
    float _2406 = _2302 * _2382;
    int _2408 = _2300 & 3;
    bool _2410 = _2408 != 0;
    float _2412 = _2242 * _2330;
    int _2414 = _2300 & 3;
    bool _2416 = _2414 != 0;
    int _2418 = _2376 + 8;
    uint _2420 = uint(int(uint(_2418) >> uint(2)));
    uint _2422 = uint(int(uint(int(_2420)) >> uint(2)));
    int _2424 = int(_2420) & 3;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[int(_2422)][_2424];
    int _2428 = int(_2420) + 1;
    uint _2430 = uint(int(uint(_2428) >> uint(2)));
    int _2432 = _2428 & 3;
    float _2434 = (*spvDescriptorSet0.vp_c9)._m0[int(_2430)][_2432];
    bool _2436 = uint(_2408) > 1u;
    int _2438 = ~_2322;
    int _2440 = _2438 + _2404;
    int _2442 = _2440 + 1;
    int _2444 = _2416 ? 0 : 1;
    bool _2446 = _2408 != 3;
    int _2448 = _610 * _2442;
    int _2450 = _2448 + _2144;
    float _2452 = _2194 * _2400;
    float _2454 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2456 = _566 + _2454;
    float _2458 = -_2368;
    float _2460 = _2458 + 1.0;
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2464 = _566 + _2462;
    bool _2466 = uint(_2408) >= 2u;
    float _2468 = fma(_2412, _2456, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2470 = fma(_2460, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2406);
    float _2472 = fma(_2452, _2464, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2474 = ~_2444;
    int _2476 = _2474 + 1;
    int _2478 = _2476 + 1;
    float _2480 = _2456;
    int _2482 = _2478;
    if (_2110)
    {
        float _2484 = in.m_55.x;
        _2480 = _2484;
    }
    float _2486 = _2480;
    int _2488 = _2466 ? 0 : 1;
    float _2490 = fma(_2468, _2378, _2470);
    if (!_2436)
    {
        int _2492 = ~_2444;
        int _2494 = _2492 + 1;
        _2482 = _2494;
    }
    int _2496 = _2482;
    bool _2498 = !_2410;
    int _2500 = _2498 ? 0 : 1;
    float _2502 = fma(_2472, _2350, _2490);
    int _2504 = ~_2488;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    float _2510 = in.m_67.x;
    int _2512 = abs(_2496);
    float _2514 = -_1916;
    float _2516 = _2514 + 1.0;
    int _2518 = _2508;
    float _2520 = _2510;
    if (_2446)
    {
        int _2522 = ~_2488;
        int _2524 = _2522 + 1;
        _2518 = _2524;
    }
    int _2526 = _2518;
    bool _2528 = _2408 != 3;
    int _2530 = abs(_2500);
    int _2532 = abs(_2526);
    float _2534 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2536 = int(_2534);
    int _2538 = ~_2512;
    int _2540 = _2538 + 1;
    int _2542 = _2540 + 1;
    bool _2544 = !_2528;
    int _2546 = _2544 ? 0 : (-1);
    int _2548 = ~_2530;
    int _2550 = _2548 + 1;
    int _2552 = _2550 + 1;
    int _2554 = _2542 * as_type<int>(_2398);
    int _2556 = abs(_2546);
    int _2558 = ~_2532;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    int _2564 = _2552 * as_type<int>(_2390);
    int _2566 = _2564 + _2554;
    bool _2568 = !_2260;
    int _2570 = _2568 ? 0 : 1;
    float _2572 = in.m_77.x;
    float _2574 = in.m_77.y;
    float _2576 = in.m_77.z;
    int _2578 = ~_2556;
    int _2580 = _2578 + 1;
    int _2582 = _2580 + 1;
    int _2584 = _2562 * as_type<int>(_2426);
    int _2586 = _2584 + _2566;
    bool _2588 = _998 != 0.0;
    bool _2590 = isnan(_998);
    bool _2592 = _2588 || _2590;
    bool _2594 = isnan(0.0);
    bool _2596 = _2592 || _2594;
    int _2598 = abs(_2570);
    int _2600 = _2582 * as_type<int>(_2434);
    int _2602 = _2600 + _2586;
    float _2604 = float(uint(_2536));
    bool _2606 = _996 == 0.0;
    bool _2608 = !_2596;
    bool _2610 = _2606 && _2608;
    float _2612 = 1.0 / _2604;
    int _2614 = abs(_2536);
    bool _2616 = _1000 == 0.0;
    bool _2618 = _2616 && _2610;
    int _2620 = ~_2598;
    int _2622 = _2620 + 1;
    int _2624 = _2622 + 1;
    bool _2626 = !_1947;
    int _2628 = _2626 ? _2450 : (-1);
    float _2630 = fma(_2314, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2502);
    float _2632 = float(uint(_2614));
    int _2634 = _2602 * _2624;
    bool _2636 = _2486 > 0.5;
    bool _2638 = _2636 && _2110;
    float _2640 = 1.0 / _2632;
    int _2642 = _2628 * _2598;
    int _2644 = _2642 + _2634;
    float _2646 = _534 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2648 = _2572;
    float _2650 = _2574;
    float _2652 = _2576;
    float _2654 = as_type<float>(_2624);
    if (!_2618)
    {
        float _2656 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2572);
        _2648 = _2656;
    }
    float _2658 = _2648;
    int _2660 = as_type<int>(_2612) + (-2);
    float _2662 = _528 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2664 = float(uint(_2644));
    if (!_2618)
    {
        float _2666 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2574);
        _2650 = _2666;
    }
    float _2668 = _2650;
    int _2670 = abs(_2644);
    float _2672 = _2662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2674 = _2646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2676 = as_type<float>(_2660) * _2664;
    float _2678 = _2630 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (!_2618)
    {
        float _2680 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2576);
        _2652 = _2680;
    }
    float _2682 = _2652;
    float _2684 = trunc(_2676);
    float _2686 = precise::max(_2684, 0.0);
    uint _2688 = uint(_2686);
    int _2690 = as_type<int>(_2640) + (-2);
    float _2692 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2694 = float(uint(_2670));
    out.m_79.x = _2672;
    out.m_79.y = _2674;
    out.m_79.z = _1957;
    out.m_79.w = _2678;
    int _2696 = ~_2536;
    int _2698 = _2696 + 1;
    int _2700 = ~_2614;
    int _2702 = _2700 + 1;
    float _2704 = as_type<float>(_2690) * _2694;
    float _2706 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2708 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_2110)
    {
        _2654 = _2510;
    }
    float _2710 = _2654;
    float _2712 = trunc(_2704);
    float _2714 = precise::max(_2712, 0.0);
    uint _2716 = uint(_2714);
    float _2718 = _2710;
    if (_2638)
    {
        float _2720 = -_2710;
        float _2722 = _2720 + 1.0;
        _2718 = _2722;
    }
    float _2724 = _2718;
    float _2726 = -_1032;
    float _2728 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2692);
    int _2730 = _2698 * int(_2688);
    int _2732 = _2730 + _2644;
    float _2734 = -_1032;
    float _2736 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2706);
    float _2738 = -_1032;
    float _2740 = fma(_2738, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2708);
    float _2742 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2728);
    float _2744 = float(uint(_2732));
    float _2746 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2736);
    float _2748 = abs(_1468);
    float _2750 = log2(_2748);
    float _2752 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2754 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2756 = as_type<float>(_2660) * _2744;
    int _2758 = _2702 * int(_2716);
    int _2760 = _2758 + _2670;
    float _2762 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2740);
    float _2764 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2752);
    float _2766 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2754);
    float _2768 = trunc(_2756);
    float _2770 = precise::max(_2768, 0.0);
    uint _2772 = uint(_2770);
    float _2774 = float(uint(_2760));
    float _2776 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2778 = _2742 * _2668;
    float _2780 = _2746 * _2668;
    float _2782 = _2762 * _2668;
    float _2784 = as_type<float>(_2690) * _2774;
    float _2786 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2776);
    float _2788 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2790 = ~_2536;
    int _2792 = _2790 + 1;
    float _2794 = trunc(_2784);
    float _2796 = precise::max(_2794, 0.0);
    uint _2798 = uint(_2796);
    int _2800 = ~_2614;
    int _2802 = _2800 + 1;
    float _2804 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2764);
    float _2806 = fma(_1987, _2658, _2778);
    float _2808 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2766);
    int _2810 = int(_2688) + int(_2772);
    float _2812 = fma(_2804, _2658, _2780);
    float _2814 = exp2(_2788);
    if (_2110)
    {
        _2520 = _2724;
    }
    float _2816 = _2520;
    float _2818 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2820 = _2792 * _2810;
    int _2822 = _2820 + _2644;
    float _2824 = fma(_2808, _2658, _2782);
    float _2826 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2786);
    float _2828 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2818);
    bool _2830 = _1468 <= 8000.0;
    bool _2832 = isnan(_1468);
    bool _2834 = _2830 || _2832;
    bool _2836 = isnan(8000.0);
    bool _2838 = _2834 || _2836;
    float _2840 = float(_2838);
    float _2842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2844 = int(_2716) + int(_2798);
    float _2846 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1983);
    float _2848 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2828);
    bool _2850 = uint(_2822) >= uint(_2536);
    float _2852 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2846);
    int _2854 = _2802 * _2844;
    int _2856 = _2854 + _2670;
    bool _2858 = !_2850;
    int _2860 = _2858 ? 0 : (-1);
    float _2862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2864 = fma(_2814, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2866 = precise::clamp(_2864, 0.0, 1.0);
    float _2868 = fma(_2848, _2682, _2812);
    int _2870 = ~_2810;
    int _2872 = _2870 + _2860;
    int _2874 = _2872 + 1;
    bool _2876 = uint(_2856) >= uint(_2614);
    float _2878 = fma(_2866, -2.0, 3.0);
    int _2880 = _2644 ^ _2536;
    int _2882 = _2536 * _2874;
    int _2884 = _2882 + _2644;
    bool _2886 = _2536 == 0;
    float _2888 = _2866 * _2866;
    bool _2890 = !_2876;
    int _2892 = _2890 ? 0 : (-1);
    uint _2894 = uint(int(uint(_2880) >> uint(31)));
    float _2896 = _2888 * _2878;
    bool _2898 = !_2886;
    int _2900 = _2898 ? _2884 : (-1);
    float _2902 = _2862 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2904 = ~_2892;
    int _2906 = _2844 + _2904;
    int _2908 = _2906 + 1;
    float _2910 = fma(_2826, _2682, _2806);
    int _2912 = ~int(_2894);
    int _2914 = _2912 + 1;
    float _2916 = -_2896;
    float _2918 = _2916 + 1.0;
    float _2920 = float(_2900);
    float _2922 = _2842 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2924 = _2908 ^ _2914;
    float _2926 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2928 = fma(_2902, _2816, -0.5);
    float _2930 = fma(_2902, _2920, _738);
    bool _2932 = _2536 == 0;
    float _2934 = fma(_2922, _2168, -0.5);
    int _2936 = ~_2914;
    int _2938 = _2936 + _2924;
    int _2940 = _2938 + 1;
    float _2942 = fma(_2918, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2896);
    float _2944 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2926);
    float _2946 = in.m_81.x;
    bool _2948 = !_2932;
    int _2950 = _2948 ? _2940 : (-1);
    float _2952 = _2840 * _2942;
    float _2954 = _1826 * 0.5;
    float _2956 = float(_2950);
    float _2958 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2960 = fma(_744, _2928, _2930);
    float _2962 = fma(_1882, -0.5, _2954);
    float _2964 = fma(_2852, _2682, _2824);
    float _2966 = -_752;
    float _2968 = fma(_2922, _2956, _2966);
    float _2970 = _2516 * _2958;
    float _2972 = precise::clamp(_2970, 0.0, 1.0);
    float _2974 = _2960 + 0.5;
    float _2976 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2944);
    float _2978 = fma(_740, _2934, _2968);
    float _2980 = _2018 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2982 = -_2972;
    float _2984 = fma(_2982, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.x = _2910;
    out.m_83.y = _2868;
    out.m_83.z = _2964;
    float _2986 = _2978 + 0.5;
    float _2988 = _2980 * _1918;
    float _2990 = -_2980;
    float _2992 = _2990 + 1.0;
    float _2994 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2976);
    bool _2996 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2998 = isnan(_1616);
    bool _3000 = _2996 || _2998;
    bool _3002 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3004 = _3000 || _3002;
    float _3006 = _1929 * _2988;
    float _3008 = _2984 * _2946;
    float _3010 = _1939 * _2988;
    out.m_85.x = _2974;
    out.m_85.y = _2986;
    float _3012 = _1929 * _2992;
    float _3014 = _3008 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3016 = fma(_1929, _3010, _1927);
    float _3018 = _2994 + _1826;
    float _3020 = _1874 + _1826;
    out.m_87.x = _3014;
    float _3022 = _3018 * 0.5;
    float _3024 = _3020 * 0.5;
    float _3026 = fma(_1935, _3006, _1923);
    float _3028 = fma(_1937, _3006, _1925);
    float _3030 = _1524 * _1584;
    out.gl_Position.x = _1874;
    out.gl_Position.y = _1882;
    out.gl_Position.z = _2994;
    out.gl_Position.w = _1826;
    out.m_89.x = _3026;
    out.m_89.y = _3028;
    out.m_89.z = _3016;
    out.m_89.w = _3012;
    out.m_91.x = _3024;
    out.m_91.y = _2962;
    out.m_91.z = _3022;
    out.m_91.w = _1826;
    float _3032 = _2994;
    float _3034 = _3024;
    float _3036 = _3030;
    if (!_3004)
    {
        _2160 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3038 = _2160;
    float _3040 = _3038;
    float _3042 = _3038;
    if (!_3004)
    {
        _3032 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3044 = _3032;
    float _3046 = _3044;
    float _3048 = _3044;
    if (!_3004)
    {
        _2162 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3050 = _2162;
    float _3052 = _3050;
    float _3054 = _3050;
    if (!_3004)
    {
        _2164 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3056 = _2164;
    float _3058 = _3030 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3060 = _3056;
    float _3062 = _3056;
    if (!_3004)
    {
        _3034 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3064 = _3034;
    float _3066 = _3064;
    float _3068 = _3064;
    if (!_3004)
    {
        _3036 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3070 = _3036;
    bool _3072 = !_3004;
    float _3074 = _3070;
    float _3076 = _3070;
    if (!_3072)
    {
        bool _3078 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3080 = isnan(_1616);
        bool _3082 = _3078 || _3080;
        bool _3084 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3086 = _3082 || _3084;
        if (!_3086)
        {
            float _3088 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3090 = _1616 + _3088;
            float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3094 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3092;
            float _3096 = 1.0 / _3094;
            float _3098 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3100 = _3098 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3102 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3104 = _3102 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3108 = _3106 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3110 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3112 = _3110 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3116 = _3114 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3118 = _3090 * _3096;
            float _3120 = precise::clamp(_3118, 0.0, 1.0);
            float _3122 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3124 = _3122 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3126 = fma(_3120, _3100, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3128 = fma(_3120, _3124, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3130 = fma(_3120, _3104, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3132 = fma(_3120, _3108, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3134 = fma(_3120, _3112, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3136 = fma(_3120, _3116, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3042 = _3128;
            _3062 = _3134;
            _3068 = _3126;
            _3054 = _3132;
            _3048 = _3130;
            _3076 = _3136;
            _3138 = true;
        }
        else
        {
            bool _3140 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3142 = isnan(_1616);
            bool _3144 = _3140 || _3142;
            bool _3146 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3148 = _3144 || _3146;
            if (!_3148)
            {
                _3066 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3150 = _3066;
            _3068 = _3150;
            if (!_3148)
            {
                _3040 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3152 = _3040;
            _3042 = _3152;
            if (!_3148)
            {
                _3046 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3154 = _3046;
            _3048 = _3154;
            if (!_3148)
            {
                _3052 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3156 = _3052;
            _3054 = _3156;
            if (!_3148)
            {
                _3060 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3158 = _3060;
            _3062 = _3158;
            if (!_3148)
            {
                _3074 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3160 = _3074;
            bool _3162 = !_3148;
            _3076 = _3160;
            if (!_3162)
            {
                bool _3164 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3166 = isnan(_1616);
                bool _3168 = _3164 || _3166;
                bool _3170 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3172 = _3168 || _3170;
                if (!_3172)
                {
                    float _3174 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3176 = _1616 + _3174;
                    float _3178 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3180 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3178;
                    float _3182 = 1.0 / _3180;
                    float _3184 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3186 = _3184 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3188 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3190 = _3188 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3192 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3194 = _3192 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3196 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3198 = _3196 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3200 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3202 = _3200 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3204 = _3176 * _3182;
                    float _3206 = precise::clamp(_3204, 0.0, 1.0);
                    float _3208 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3210 = _3208 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3212 = fma(_3206, _3186, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3214 = fma(_3206, _3210, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3216 = fma(_3206, _3190, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3218 = fma(_3206, _3194, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3220 = fma(_3206, _3198, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3222 = fma(_3206, _3202, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3042 = _3214;
                    _3062 = _3220;
                    _3068 = _3212;
                    _3054 = _3218;
                    _3048 = _3216;
                    _3076 = _3222;
                    _3138 = true;
                }
                else
                {
                    _3042 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3062 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3068 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3054 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3048 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3076 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3138 = false;
    float _3224 = _3042;
    float _3226 = _3062;
    float _3228 = _3068;
    float _3230 = _3054;
    float _3232 = _3048;
    float _3234 = _3076;
    float _3236 = _3058 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3238 = fma(_2868, -0.5, 0.5);
    float _3240 = precise::clamp(_3238, 0.0, 1.0);
    float _3242 = -_3224;
    float _3244 = _3242 + _3226;
    float _3246 = -_3228;
    float _3248 = _3246 + _3230;
    out.m_49.x = _3236;
    float _3250 = fma(_3240, _3244, _3224);
    float _3252 = -_3232;
    float _3254 = _3252 + _3234;
    float _3256 = fma(_3240, _3248, _3228);
    float _3258 = _3250 * 0.586610972881317138671875;
    bool _3260 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3262 = fma(_3240, _3254, _3232);
    out.m_93.x = 0.0;
    float _3264 = fma(_3256, 0.298911988735198974609375, _3258);
    bool _3266 = _1524 > 0.0;
    bool _3268 = isnan(_1524);
    bool _3270 = _3266 || _3268;
    bool _3272 = isnan(0.0);
    bool _3274 = _3270 || _3272;
    float _3276 = fma(_3262, 0.114477999508380889892578125, _3264);
    bool _3278 = _1584 <= 0.0;
    bool _3280 = !_3274;
    bool _3282 = _3278 || _3280;
    float _3284 = -_3276;
    float _3286 = _3256 + _3284;
    float _3288 = -_3276;
    float _3290 = _3250 + _3288;
    float _3292 = -_3276;
    float _3294 = _3262 + _3292;
    float _3296 = fma(_3286, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3276);
    float _3298 = fma(_3290, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3276);
    float _3300 = fma(_3294, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3276);
    bool _3302 = !_3260;
    if (!_3302)
    {
        float _3304 = -_1458;
        float _3306 = _3304 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3308 = -_1460;
        float _3310 = _3308 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3312 = -_1462;
        float _3314 = _3312 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3316 = _3306 * _3306;
        float _3318 = fma(_3310, _3310, _3316);
        float _3320 = fma(_3314, _3314, _3318);
        float _3322 = sqrt(_3320);
        float _3324 = rsqrt(_3320);
        float _3326 = -_3322;
        float _3328 = _3326 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3330 = _3328 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3332 = precise::clamp(_3330, 0.0, 1.0);
        float _3334 = _3310 * _3324;
        float _3336 = _3306 * _3324;
        float _3338 = abs(_3332);
        float _3340 = log2(_3338);
        float _3342 = _3314 * _3324;
        float _3344 = _3334 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3346 = _2868 * _3336;
        float _3348 = -_3336;
        float _3350 = -_3344;
        float _3352 = fma(_3348, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3350);
        float _3354 = fma(_2910, _3334, _3346);
        float _3356 = -_3342;
        float _3358 = fma(_3356, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3352);
        float _3360 = fma(_2964, _3342, _3354);
        float _3362 = precise::clamp(_3360, 0.0, 1.0);
        float _3364 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3366 = _3358 + _3364;
        float _3368 = _3340 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3370 = _3366 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3372 = precise::clamp(_3370, 0.0, 1.0);
        float _3374 = exp2(_3368);
        float _3376 = _3374 * _3372;
        float _3378 = _3362 * _3376;
        float _3380 = _3378 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3382 = _3378 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3384 = _3378 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3380;
        out.m_93.y = _3382;
        out.m_93.z = _3384;
    }
    out.m_69.x = _3296;
    out.m_69.y = _3298;
    out.m_69.z = _3300;
    if (!_3282)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3386 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3386;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3138 = false;
    bool _558 = false;
    bool _444 = false;
    bool _340 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3443 = as_type<float>(_128);
        out.gl_Position.z = _3443;
    }
    if (!_116)
    {
        return out;
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3513 = as_type<float>(_166);
        out.gl_Position.z = _3513;
    }
    if (_158)
    {
        return out;
    }
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _178 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _180 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _182 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _180);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _182);
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _184);
    float _192 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _186);
    bool _194 = !_174;
    float _212;
    if (!_194)
    {
        float _196 = in.m_55.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        float _216 = float(_112);
        float _218 = 1.0 / _216;
        float _220 = _146 * _218;
        _212 = _220;
    }
    _214 = false;
    float _222 = _212;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _222 + _224;
    bool _228 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _230 = isnan(_222);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    float _244 = 1.0 / _242;
    bool _246 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _248 = isnan(_222);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -_238;
    float _260 = _258 + 1.0;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _266;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _272 = _256 * _260;
    float _274 = -_256;
    float _276 = _274 + 1.0;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = _226 * _244;
    float _284 = in.m_57.x;
    float _286 = in.m_57.y;
    float _288 = in.m_57.z;
    float _290 = fma(_264, _282, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _292 = fma(_280, _282, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _294 = fma(_268, _282, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _296 = _290 * _272;
    float _298 = _292 * _272;
    float _300 = _294 * _272;
    float _302 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _304 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].y, _298);
    float _306 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].z, _300);
    float _308 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].x, _302);
    float _310 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].y, _304);
    float _312 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].z, _306);
    float _314 = _308 * _284;
    float _316 = _310 * _286;
    float _318 = _312 * _288;
    bool _320 = !_270;
    float _338;
    if (!_320)
    {
        float _322 = in.m_55.x;
        float _324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _326 = _322 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _330 = _328 * _324;
        float _332 = floor(_330);
        float _334 = -_332;
        float _336 = _330 + _334;
        _338 = _336;
        _340 = true;
    }
    else
    {
        float _342 = float(_112);
        float _344 = 1.0 / _342;
        float _346 = _146 * _344;
        _338 = _346;
    }
    _340 = false;
    float _348 = _338;
    bool _350 = _348 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _352 = isnan(_348);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _366 = _348 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _368 = isnan(_348);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _384 = _348 + _382;
    float _386 = -_360;
    float _388 = _386 + 1.0;
    bool _390 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _392 = 1.0 / _364;
    float _394 = _376 * _388;
    float _396 = -_376;
    float _398 = _396 + 1.0;
    float _400 = _380 * _392;
    float _402 = fma(_400, _384, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _404 = _402 * _394;
    float _406 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[115].x, _404);
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _414 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[116].x, _406);
    float _416 = _408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _420 = _412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _422 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _416;
    out.m_59.y = _418;
    out.m_59.z = _420;
    out.m_59.w = _422;
    bool _424 = !_390;
    float _442;
    if (!_424)
    {
        float _426 = in.m_55.x;
        float _428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _430 = _426 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[11].z, _146);
        float _434 = _432 * _428;
        float _436 = floor(_434);
        float _438 = -_436;
        float _440 = _434 + _438;
        _442 = _440;
        _444 = true;
    }
    else
    {
        float _446 = float(_112);
        float _448 = 1.0 / _446;
        float _450 = _146 * _448;
        _442 = _450;
    }
    _444 = false;
    float _452 = _442;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _456 = _452 + _454;
    bool _458 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _460 = isnan(_452);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _470;
    bool _474 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _476 = isnan(_452);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -_468;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _490;
    float _494 = 1.0 / _472;
    bool _496 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _498 = _456 * _494;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _500;
    float _504 = _484 * _488;
    float _506 = fma(_492, _498, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _508 = -_484;
    float _510 = _508 + 1.0;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _512;
    float _516 = fma(_502, _498, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _518 = _506 * _504;
    float _520 = fma(_514, _498, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _522 = _516 * _504;
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[123].x, _518);
    float _526 = _520 * _504;
    float _528 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[124].x, _524);
    float _530 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[123].y, _526);
    float _532 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[123].z, _522);
    float _534 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[124].y, _530);
    float _536 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[124].z, _532);
    bool _538 = !_496;
    float _556;
    if (!_538)
    {
        float _540 = in.m_55.x;
        float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _544 = _540 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _548 = _546 * _542;
        float _550 = floor(_548);
        float _552 = -_550;
        float _554 = _548 + _552;
        _556 = _554;
        _558 = true;
    }
    else
    {
        float _560 = float(_112);
        float _562 = 1.0 / _560;
        float _564 = _146 * _562;
        _556 = _564;
    }
    _558 = false;
    float _566 = _556;
    float _568 = in.m_55.x;
    float _570 = in.m_55.y;
    float _572 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _574 = log2(_572);
    float _576 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _578 = in.m_46.x;
    float _580 = in.m_46.y;
    float _582 = in.m_46.z;
    float _584 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _586 = in.m_55.z;
    float _588 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _590 = int(_588);
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _594 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _602 = _598 || _600;
    float _604 = _574 * _146;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _608 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _610 = int(_608);
    float _612 = _568 * 2.0;
    float _614 = _568 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _616 = _570 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _618 = exp2(_604);
    float _620 = _570 * 2.0;
    float _622 = -_606;
    float _624 = fma(_614, 2.0, _622);
    float _626 = fma(_616, -2.0, _592);
    float _628 = _580 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _630 = _580 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _632 = _580 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _634 = _570 + _568;
    float _636 = floor(_612);
    float _638 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[4].x, _628);
    float _640 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[5].x, _630);
    float _642 = _634 + (-1.0);
    float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _646 = float(_590);
    float _648 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].x, _632);
    float _650 = _570 + _586;
    float _652 = _586 * 2.0;
    float _654 = floor(_620);
    float _656 = _650 + (-1.0);
    float _658 = -_618;
    float _660 = _658 + 1.0;
    bool _662 = _636 > 0.0;
    bool _664 = _636 >= 0.0;
    bool _666 = isnan(_636);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    float _674 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _676 = floor(_652);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _680 = 1.0 + _678;
    bool _682 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _684 = isnan(1.0);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _690 = _686 || _688;
    float _692 = _602 ? _660 : 0.0;
    float _694 = 1.0 / _646;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _700 = float(_610);
    bool _702 = _654 > 0.0;
    float _704 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[78].w, _698);
    bool _706 = _654 >= 0.0;
    bool _708 = isnan(_654);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = 1.0 / _680;
    bool _718 = _676 > 0.0;
    float _720 = _700 * _146;
    bool _722 = _676 >= 0.0;
    bool _724 = isnan(_676);
    bool _726 = _722 || _724;
    bool _728 = isnan(0.0);
    bool _730 = _726 || _728;
    float _732 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[78].z, _696);
    int _734 = _672 ? 0 : 1;
    float _736 = -_146;
    float _738 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[76].x, _624);
    float _740 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _704);
    float _742 = _694 * _146;
    float _744 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _732);
    int _746 = ~_734;
    int _748 = _746 + 1;
    int _750 = _748 + 1;
    float _752 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _626);
    int _754 = _750;
    if (!_662)
    {
        int _756 = ~_734;
        int _758 = _756 + 1;
        _754 = _758;
    }
    int _760 = _754;
    float _762 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[4].z, _638);
    int _764 = _714 ? 0 : 1;
    float _766 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[5].z, _640);
    if (_690)
    {
        float _768 = _692 * _716;
        _148 = _768;
    }
    float _770 = _148;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _774 = _772 != 0;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _778 = _776 != 0;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _782 = _780 != 0;
    float _784 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[6].z, _648);
    int _786 = ~_764;
    int _788 = _786 + 1;
    int _790 = _788 + 1;
    float _792 = _766 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _794 = _790;
    if (!_702)
    {
        int _796 = ~_764;
        int _798 = _796 + 1;
        _794 = _798;
    }
    int _800 = _794;
    float _802 = _762 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _804 = !_778;
    int _806 = _804 ? 0 : 1;
    float _808 = in.m_61.x;
    float _810 = in.m_61.y;
    float _812 = in.m_61.z;
    bool _814 = !_774;
    int _816 = _814 ? 0 : 1;
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _820 = _792 + _818;
    bool _822 = !_782;
    int _824 = _822 ? 0 : 1;
    float _826 = _784 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _834 = _832 != 0;
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _838 = _836 != 0;
    float _840 = _820 * _820;
    float _842 = float(_760);
    int _844 = _730 ? 0 : 1;
    bool _846 = !_834;
    int _848 = _846 ? 0 : 1;
    bool _850 = !_830;
    int _852 = _850 ? 0 : 1;
    int _854 = abs(_848);
    int _856 = abs(_852);
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _860 = _802 + _858;
    int _862 = ~_844;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    float _868 = float(_854);
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _872 = _826 + _870;
    float _874 = fma(_860, _860, _840);
    int _876 = _866;
    if (!_718)
    {
        int _878 = ~_844;
        int _880 = _878 + 1;
        _876 = _880;
    }
    int _882 = _876;
    float _884 = _868 * _842;
    float _886 = fma(_872, _872, _874);
    float _888 = float(_882);
    float _890 = _884 * (-2.0);
    float _892 = sqrt(_886);
    float _894 = _570 + (-0.5);
    bool _896 = !_838;
    int _898 = _896 ? 0 : 1;
    float _900 = fma(_890, _810, _810);
    float _902 = float(_856);
    float _904 = fma(_674, _890, _674);
    int _906 = abs(_898);
    float _908 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[196].y, _900);
    float _910 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _912 = rsqrt(_886);
    float _914 = _902 * _888;
    float _916 = float(_800);
    float _918 = _586 + _568;
    float _920 = float(_906);
    float _922 = _910 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _924 = _892 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _926 = _918 + (-1.0);
    float _928 = _920 * _916;
    float _930 = _914 * (-2.0);
    float _932 = fma(_904, _770, _908);
    float _934 = precise::min(_922, _924);
    float _936 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _938 = _928 * (-2.0);
    float _940 = _568 + (-0.5);
    float _942 = fma(_930, _808, _808);
    float _944 = _912 * _934;
    float _946 = fma(_936, _938, _936);
    float _948 = fma(_938, _812, _812);
    float _950 = _586 + (-0.5);
    float _952 = fma(_644, _930, _644);
    float _954 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[196].x, _942);
    float _956 = _820 * _944;
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[196].z, _948);
    float _960 = _872 * _944;
    float _962 = fma(_952, _770, _954);
    float _964 = _860 * _944;
    float _966 = -_956;
    float _968 = _820 + _966;
    float _970 = fma(_946, _770, _958);
    float _972 = _932 * 0.15915493667125701904296875;
    float _974 = -_964;
    float _976 = _860 + _974;
    float _978 = _968 * _968;
    float _980 = _970 * 0.15915493667125701904296875;
    float _982 = -_960;
    float _984 = _872 + _982;
    float _986 = _962 * 0.15915493667125701904296875;
    float _988 = fma(_976, _976, _978);
    float _990 = _972 * 6.283185482025146484375;
    float _992 = sin(_990);
    float _994 = fma(_984, _984, _988);
    float _996 = in.m_63.x;
    float _998 = in.m_63.y;
    float _1000 = in.m_63.z;
    float _1002 = sqrt(_994);
    float _1004 = _972 * 6.283185482025146484375;
    float _1006 = cos(_1004);
    float _1008 = _980 * 6.283185482025146484375;
    float _1010 = cos(_1008);
    float _1012 = _912 * _1002;
    float _1014 = _576 * _1012;
    float _1016 = _910 * _1012;
    float _1018 = _986 * 6.283185482025146484375;
    float _1020 = cos(_1018);
    float _1022 = _584 * _1012;
    float _1024 = _986 * 6.283185482025146484375;
    float _1026 = sin(_1024);
    float _1028 = _1006 * _1010;
    float _1030 = _980 * 6.283185482025146484375;
    float _1032 = sin(_1030);
    float _1034 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _998);
    float _1036 = _1020 * _1006;
    float _1038 = _1020 * _992;
    float _1040 = _1020 * _1010;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _996);
    float _1044 = _1014 * _1034;
    float _1046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1000);
    float _1048 = _1026 * _992;
    float _1050 = _1026 * _1006;
    float _1052 = _1026 * _1010;
    float _1054 = _992 * _1010;
    float _1056 = _1016 * _1042;
    float _1058 = _1040 * _1044;
    float _1060 = _1022 * _1046;
    float _1062 = fma(_1032, _1036, _1048);
    float _1064 = -_1050;
    float _1066 = fma(_1032, _1038, _1064);
    float _1068 = -_1044;
    float _1070 = _1032 * _1068;
    float _1072 = -_1038;
    float _1074 = fma(_1032, _1050, _1072);
    float _1076 = fma(_1062, _1056, _1058);
    float _1078 = _1052 * _1044;
    float _1080 = fma(_1028, _1056, _1070);
    float _1082 = fma(_1032, _1048, _1036);
    float _1084 = fma(_1066, _1060, _1076);
    float _1086 = fma(_1074, _1056, _1078);
    float _1088 = fma(_1054, _1060, _1080);
    float _1090 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1092 = fma(_1082, _1060, _1086);
    float _1094 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1096 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1090);
    float _1098 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1094);
    float _1100 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1096);
    float _1102 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1098);
    float _1104 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1106 = _1102 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1108 = _826 + _1104;
    float _1110 = _802 + _1106;
    float _1112 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1114 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1116 = _1108 + _1114;
    float _1118 = -_960;
    float _1120 = _826 + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1124 = _1110 + _1122;
    float _1126 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1112);
    float _1128 = _1116 * _1116;
    float _1130 = -_956;
    float _1132 = _792 + _1130;
    float _1134 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1126);
    float _1136 = fma(_1124, _1124, _1128);
    float _1138 = -_964;
    float _1140 = _802 + _1138;
    float _1142 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1144 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1146 = sqrt(_1136);
    float _1148 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1142);
    float _1150 = _792 + _1144;
    float _1152 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1148);
    bool _1154 = _1146 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1156 = _1148;
    float _1158 = _1134;
    float _1160 = _1144;
    float _1162 = _956;
    float _1164 = _964;
    float _1166 = _960;
    float _1168 = _892;
    if (!_1154)
    {
        _1156 = _1110;
    }
    float _1170 = _1156;
    float _1172 = _1170;
    if (!_1154)
    {
        _1158 = _1108;
    }
    float _1174 = _1158;
    float _1176 = _1174;
    if (!_1154)
    {
        _1160 = _1150;
    }
    float _1178 = _1160;
    bool _1180 = !_1154;
    float _1182 = _1178;
    if (!_1180)
    {
        float _1184 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1186 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1188 = _1146 + _1186;
        float _1190 = rsqrt(_1136);
        float _1192 = _1188 * _1184;
        float _1194 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1196 = _1192 * 0.15915493667125701904296875;
        float _1198 = _1196 * 6.283185482025146484375;
        float _1200 = cos(_1198);
        float _1202 = _1196 * 6.283185482025146484375;
        float _1204 = sin(_1202);
        float _1206 = _1200 + (-1.0);
        float _1208 = _1206 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1210 = fma(_1204, _1194, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1212 = fma(_1150, _1200, _1208);
        float _1214 = _1190 * _1210;
        float _1216 = fma(_1124, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1218 = fma(_1116, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1182 = _1212;
        _1172 = _1216;
        _1176 = _1218;
    }
    float _1220 = _1182;
    float _1222 = _1172;
    float _1224 = _1176;
    float _1226 = -_792;
    float _1228 = _1226 + _1220;
    float _1230 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1232 = -_802;
    float _1234 = _1232 + _1222;
    float _1236 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1238 = _1228 * _1228;
    float _1240 = -_826;
    float _1242 = _1240 + _1224;
    float _1244 = 1.0 / _1230;
    float _1246 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1236);
    float _1248 = fma(_1234, _1234, _1238);
    float _1250 = -_956;
    float _1252 = _1250 + _1220;
    float _1254 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1246);
    float _1256 = fma(_1242, _1242, _1248);
    float _1258 = -_960;
    float _1260 = _1258 + _1224;
    float _1262 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1264 = sqrt(_1256);
    bool _1266 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1268 = isnan(0.5);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1274 = _1270 || _1272;
    float _1276 = _1262 + _1230;
    bool _1278 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1280 = isnan(0.5);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1286 = _1282 || _1284;
    float _1288 = _1276 * _1244;
    float _1290 = _1288 * 0.5;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1294 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1292);
    float _1296 = -_964;
    float _1298 = _1296 + _1222;
    float _1300 = 1.0 / _1294;
    bool _1302 = _1264 > 0.0;
    float _1304 = _1230;
    float _1306 = _1244;
    float _1308 = _1234;
    float _1310 = _1294;
    if (!_1302)
    {
        _1162 = _1298;
    }
    float _1312 = _1162;
    float _1314 = _1312;
    if (!_1302)
    {
        _1164 = _1252;
    }
    float _1316 = _1164;
    float _1318 = _1316;
    if (!_1302)
    {
        _1166 = _1260;
    }
    float _1320 = _1166;
    bool _1322 = !_1302;
    float _1324 = _1320;
    float _1326 = _1320;
    if (!_1322)
    {
        float _1328 = _190 * _190;
        float _1330 = fma(_188, _188, _1328);
        float _1332 = rsqrt(_1256);
        float _1334 = fma(_192, _192, _1330);
        float _1336 = sqrt(_1334);
        float _1338 = _1234 * _1332;
        float _1340 = _1228 * _1332;
        float _1342 = _1242 * _1332;
        bool _1344 = _1336 > 0.0;
        float _1346 = _1332;
        float _1348 = _1336;
        _1304 = _1338;
        _1306 = _1340;
        if (!_1344)
        {
            _1346 = _1298;
        }
        float _1350 = _1346;
        _1314 = _1350;
        if (!_1344)
        {
            _1348 = _1252;
        }
        float _1352 = _1348;
        _1318 = _1352;
        if (!_1344)
        {
            _1324 = _1260;
        }
        float _1354 = _1324;
        bool _1356 = !_1344;
        _1326 = _1354;
        if (!_1356)
        {
            float _1358 = rsqrt(_1334);
            float _1360 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1362 = _190 * _1358;
            float _1364 = _188 * _1358;
            float _1366 = _1340 * _1362;
            float _1368 = _192 * _1358;
            float _1370 = fma(_1338, _1364, _1366);
            float _1372 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1374 = fma(_1342, _1368, _1370);
            float _1376 = _1374 * _1372;
            float _1378 = fma(_188, _1376, _1298);
            float _1380 = fma(_190, _1376, _1252);
            float _1382 = fma(_192, _1376, _1260);
            _1314 = _1378;
            _1318 = _1380;
            _1326 = _1382;
        }
    }
    float _1384 = _1314;
    float _1386 = _1318;
    float _1388 = _1326;
    float _1390 = _1304;
    float _1392 = _1306;
    float _1394 = _1392;
    float _1396 = _1386;
    float _1398 = _1384;
    float _1400 = _1388;
    float _1402 = _1390;
    if (_1286)
    {
        _1394 = 1.0;
    }
    float _1404 = _1394;
    float _1406 = _1404;
    if (!_1274)
    {
        float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1410 = _1132 + _1408;
        float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1414 = _1140 + _1412;
        float _1416 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1418 = _1410 * _1410;
        float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1422 = _1120 + _1420;
        float _1424 = fma(_1414, _1414, _1418);
        float _1426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1428 = fma(_1422, _1422, _1424);
        float _1430 = sqrt(_1428);
        float _1432 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1434 = precise::min(_1430, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1436 = _1434 * _1426;
        float _1438 = -_1140;
        float _1440 = _1438 + _1384;
        float _1442 = _1432 * _1436;
        float _1444 = -_1132;
        float _1446 = _1444 + _1386;
        float _1448 = -_1120;
        float _1450 = _1448 + _1388;
        float _1452 = fma(_1440, _1442, _1140);
        float _1454 = fma(_1446, _1442, _1132);
        float _1456 = fma(_1450, _1442, _1120);
        _1396 = _1454;
        _1398 = _1452;
        _1400 = _1456;
    }
    float _1458 = _1396;
    float _1460 = _1398;
    float _1462 = _1400;
    if (_1286)
    {
        _1308 = 1.0;
    }
    float _1464 = _1308;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1468 = _1300 * _1466;
    float _1470 = _1464;
    if (!_1286)
    {
        float _1472 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1474 = _1472 * 0.15915493667125701904296875;
        float _1476 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1480 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1478;
        float _1482 = _1474 * 6.283185482025146484375;
        float _1484 = cos(_1482);
        float _1486 = _1476 * 0.15915493667125701904296875;
        float _1488 = _1474 * 6.283185482025146484375;
        float _1490 = sin(_1488);
        float _1492 = 1.0 / _1484;
        float _1494 = _1486 * 6.283185482025146484375;
        float _1496 = cos(_1494);
        float _1498 = _1490 * _1492;
        float _1500 = _1486 * 6.283185482025146484375;
        float _1502 = sin(_1500);
        float _1504 = _1496 * _1498;
        float _1506 = 1.0 / _1480;
        float _1508 = 1.0 / _1504;
        float _1510 = _1502 * _1508;
        float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1514 = fma(_1468, _1510, _1512);
        float _1516 = _1514 * _1506;
        float _1518 = precise::clamp(_1516, 0.0, 1.0);
        _1310 = _1486;
        _1402 = _1474;
        _1406 = _1518;
    }
    float _1520 = _1310;
    float _1522 = _1402;
    float _1524 = _1406;
    float _1526 = _1522;
    float _1528 = _1520;
    if (!_1286)
    {
        float _1530 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1532 = _1530 * 0.15915493667125701904296875;
        float _1534 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1536 = _1532 * 6.283185482025146484375;
        float _1538 = cos(_1536);
        float _1540 = _1534 * 0.15915493667125701904296875;
        float _1542 = _1532 * 6.283185482025146484375;
        float _1544 = sin(_1542);
        float _1546 = 1.0 / _1538;
        float _1548 = _1540 * 6.283185482025146484375;
        float _1550 = cos(_1548);
        float _1552 = _1544 * _1546;
        float _1554 = _1540 * 6.283185482025146484375;
        float _1556 = sin(_1554);
        float _1558 = _1550 * _1552;
        float _1560 = 1.0 / _1558;
        float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1564 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1562;
        float _1566 = 1.0 / _1564;
        float _1568 = _1556 * _1560;
        float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1572 = fma(_1468, _1568, _1570);
        float _1574 = _1572 * _1566;
        float _1576 = precise::clamp(_1574, 0.0, 1.0);
        float _1578 = -_1576;
        float _1580 = _1578 + 1.0;
        _1526 = _1558;
        _1470 = _1580;
    }
    float _1582 = _1526;
    float _1584 = _1470;
    float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1588 = _1458 + _1586;
    float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1592 = _1460 + _1590;
    float _1594 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1596 = _1462 + _1594;
    float _1598 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1600 = _1588 * _1588;
    float _1602 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1598);
    float _1604 = fma(_1592, _1592, _1600);
    float _1606 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1608 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1602);
    float _1610 = fma(_1596, _1596, _1604);
    float _1612 = _1608 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1614 = rsqrt(_1610);
    float _1616 = sqrt(_1610);
    float _1618 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1620 = _1592 * _1618;
    float _1622 = _1596 * _1618;
    float _1624 = _1620 * _1620;
    float _1626 = _1622 * _1622;
    float _1628 = _1624 + _1626;
    float _1630 = sqrt(_1628);
    bool _1632 = _1630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1636 = _1630 + _1634;
    float _1638 = _1596;
    float _1640 = _1628;
    float _1642 = _1636;
    float _1644 = _1582;
    if (_1632)
    {
        float _1646 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1638 = _1646;
    }
    float _1648 = _1638;
    if (_1632)
    {
        float _1650 = rsqrt(_1628);
        _1640 = _1650;
    }
    float _1652 = _1640;
    float _1654 = _1652;
    if (_1632)
    {
        float _1656 = _1636 * _1648;
        _1642 = _1656;
    }
    float _1658 = _1642;
    if (_1632)
    {
        float _1660 = _1658 * 0.15915493667125701904296875;
        _1528 = _1660;
    }
    float _1662 = _1528;
    float _1664 = _1648;
    float _1666 = _1662;
    if (_1632)
    {
        float _1668 = _1662 * 6.283185482025146484375;
        float _1670 = sin(_1668);
        _1664 = _1670;
    }
    float _1672 = _1664;
    float _1674 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1676 = precise::max(0.0, _1674);
    float _1678 = _1600;
    float _1680 = _1676;
    if (_1632)
    {
        float _1682 = _1662 * 6.283185482025146484375;
        float _1684 = cos(_1682);
        _1678 = _1684;
    }
    float _1686 = _1678;
    float _1688 = -_1618;
    float _1690 = -_1676;
    float _1692 = fma(_1588, _1688, _1690);
    if (_1632)
    {
        float _1694 = _1692 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1680 = _1694;
    }
    float _1696 = _1680;
    float _1698 = _1696;
    if (!_1632)
    {
        _1666 = _1692;
    }
    float _1700 = _1666;
    float _1702 = fma(_1140, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1704 = _1672;
    float _1706 = _1700;
    if (_1632)
    {
        float _1708 = fma(_1672, _1696, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1704 = _1708;
    }
    float _1710 = _1704;
    float _1712 = floor(_1702);
    float _1714 = _1710;
    float _1716 = _1686;
    if (_1632)
    {
        float _1718 = _1686 + (-1.0);
        _1698 = _1718;
    }
    float _1720 = _1698;
    float _1722 = _1720;
    if (_1632)
    {
        float _1724 = _1652 * _1710;
        _1168 = _1724;
    }
    float _1726 = _1168;
    if (!_1632)
    {
        _1714 = _1620;
    }
    float _1728 = _1714;
    float _1730 = _1728;
    if (_1632)
    {
        float _1732 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1644 = _1732;
    }
    float _1734 = _1644;
    if (_1632)
    {
        float _1736 = _1620 * _1726;
        _1730 = _1736;
    }
    float _1738 = _1730;
    if (!_1632)
    {
        _1654 = _1622;
    }
    float _1740 = _1654;
    float _1742 = _1740;
    if (_1632)
    {
        float _1744 = _1622 * _1726;
        _1742 = _1744;
    }
    float _1746 = _1742;
    if (!_1632)
    {
        _1722 = _1624;
    }
    float _1748 = _1722;
    float _1750 = _1748;
    if (_1632)
    {
        float _1752 = fma(_1692, _1686, _1734);
        _1706 = _1752;
    }
    float _1754 = _1706;
    if (_1632)
    {
        float _1756 = _1738 * _1738;
        _1750 = _1756;
    }
    float _1758 = _1750;
    float _1760 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1632)
    {
        _1716 = _1626;
    }
    float _1762 = _1716;
    float _1764 = _1762;
    if (_1632)
    {
        float _1766 = _1746 * _1746;
        _1764 = _1766;
    }
    float _1768 = _1764;
    float _1770 = fma(_1754, _1754, _1758);
    float _1772 = fma(_1120, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1774 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1776 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1760);
    float _1778 = _1770 + _1768;
    float _1780 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1782 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1774);
    float _1784 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1776);
    float _1786 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1780);
    float _1788 = rsqrt(_1778);
    float _1790 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1782);
    float _1792 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1796 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1794);
    float _1798 = precise::clamp(_1796, 0.0, 1.0);
    float _1800 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1786);
    float _1802 = _1790 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1804 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1806 = -_1798;
    float _1808 = _1806 + 1.0;
    float _1810 = _1800 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1812 = floor(_1772);
    float _1814 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1804);
    float _1816 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1818 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1814);
    float _1820 = _1788 * _1738;
    float _1822 = abs(_1808);
    float _1824 = log2(_1822);
    float _1826 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1818);
    float _1828 = _1788 * _1754;
    float _1830 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1832 = _1788 * _1746;
    float _1834 = -_1816;
    float _1836 = fma(_1834, _1606, 1.0);
    float _1838 = -_1712;
    float _1840 = _1702 + _1838;
    float _1842 = -_1830;
    float _1844 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1842);
    float _1846 = 1.0 / _1826;
    float _1848 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1850 = -_1812;
    float _1852 = _1772 + _1850;
    float _1854 = -_1832;
    float _1856 = fma(_1854, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1844);
    float _1858 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1860 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1848);
    float _1862 = _1828 + 1.0;
    float _1864 = log2(_1836);
    float _1866 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1868 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1858);
    float _1870 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1860);
    float _1872 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1868);
    float _1874 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1870);
    float _1876 = exp2(_1866);
    float _1878 = fma(_1856, -0.5, 0.5);
    float _1880 = fma(_1856, 0.5, 0.5);
    float _1882 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1872);
    float _1884 = _1874 * _1846;
    float _1886 = fma(_1880, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1888 = _1882 * _1846;
    float _1890 = sqrt(_1878);
    float _1892 = _1864 * 0.693147182464599609375;
    float _1894 = fma(_1880, _1886, -0.212114393711090087890625);
    float _1896 = fma(_1884, 0.5, 0.5);
    float _1898 = fma(_1888, -0.5, 0.5);
    float _1900 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1902 = fma(_1880, _1894, 1.570728778839111328125);
    float _1904 = -_1828;
    float _1906 = fma(_1876, _1862, _1904);
    float _1908 = _1890 * 0.636619746685028076171875;
    float _1910 = -_1902;
    float _1912 = fma(_1908, _1910, 1.0);
    float _1914 = fma(_1906, 0.5, 0.5);
    float2 _6235 = float2(_1840, _1852);
    float _1916 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6235, float2(0.0), isnan(_6235)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6235, float2(0.0), isnan(_6235)), level(0.0)).x;
    float3 _6246 = float3(_1896, _1898, _1900);
    float _1918 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6246, float3(0.0), isnan(_6246)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6246, float3(0.0), isnan(_6246)), level(0.0)).x;
    float3 _6257 = float3(_1896, _1898, _1900);
    float4 _1921 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6257, float3(0.0), isnan(_6257)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6257, float3(0.0), isnan(_6257)), level(0.0)).xyzw;
    float _1923 = _1921.x;
    float _1925 = _1921.y;
    float _1927 = _1921.z;
    float _1929 = _1921.w;
    float2 _6273 = float2(_1912, _1914);
    float3 _1933 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6273, float2(0.0), isnan(_6273)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6273, float2(0.0), isnan(_6273)), level(0.0)).xyz;
    float _1935 = _1933.x;
    float _1937 = _1933.y;
    float _1939 = _1933.z;
    float _1941 = float(uint(_610));
    float _1943 = trunc(_742);
    int _1945 = int(_1943);
    bool _1947 = _610 == 0;
    float _1949 = _536 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1951 = abs(_806);
    out.m_65.x = _1140;
    out.m_65.y = _1132;
    out.m_65.z = _1120;
    int _1953 = ~_610;
    int _1955 = _1953 + 1;
    float _1957 = _1949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1959 = _570 > 0.5;
    float _1961 = 1.0 / _1941;
    float _1963 = in.m_67.y;
    int _1965 = ~_610;
    int _1967 = _1965 + 1;
    float _1969 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_69.w = _934;
    float _1971 = float(uint(_1945));
    float _1973 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1975 = float(_112);
    float _1977 = exp2(_1969);
    float _1979 = float(_1945);
    float _1981 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1973);
    float _1983 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_71.x = _1016;
    int _1985 = as_type<int>(_1961) + (-2);
    float _1987 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1981);
    bool _1989 = _1979 >= _700;
    bool _1991 = isnan(_1979);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan(_700);
    bool _1997 = _1993 || _1995;
    float _1999 = float(_1997);
    float _2001 = 1.0 / _1975;
    out.m_73.x = _1460;
    out.m_73.y = _1458;
    out.m_73.z = _1462;
    float _2003 = as_type<float>(_1985) * _1971;
    float _2005 = -_1963;
    float _2007 = _2005 + 1.0;
    float _2009 = trunc(_2003);
    float _2011 = precise::max(_2009, 0.0);
    uint _2014 = uint(_2011);
    float _2016 = -_1977;
    float _2018 = _2016 + 1.0;
    float _2020 = trunc(_1999);
    int _2022 = int(_2020);
    int _2024 = ~_610;
    int _2026 = _2024 + 1;
    int _2028 = _1955 * int(_2014);
    int _2030 = _2028 + _1945;
    float _2032 = float(uint(_2030));
    int _2034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2036 = _2034 != 0;
    float _2038 = as_type<float>(_1985) * _2032;
    float _2040 = trunc(_2038);
    float _2042 = precise::max(_2040, 0.0);
    uint _2044 = uint(_2042);
    bool _2046 = !_2036;
    float _2048 = _2046 ? 7.345489978790283203125 : 1.0;
    float _2050 = _2048 * _568;
    float _2052 = _720 * _2001;
    float _2054 = floor(_2050);
    int _2056 = ~_2022;
    int _2058 = _2056 + 1;
    int _2060 = _2058 + 1;
    int _2062 = int(_2014) + int(_2044);
    float _2064 = trunc(_2052);
    int _2066 = int(_2064);
    int _2068 = _2026 * _2062;
    int _2070 = _2068 + _1945;
    float _2072 = -_2054;
    float _2074 = _2050 + _2072;
    bool _2076 = uint(_2070) >= uint(_610);
    float _2078 = _2074 * _700;
    bool _2080 = !_2076;
    int _2082 = _2080 ? 0 : (-1);
    int _2084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2086 = _2084 != 0;
    float _2088 = trunc(_2078);
    int _2090 = int(_2088);
    int _2092 = ~_2062;
    int _2094 = _2092 + _2082;
    int _2096 = _2094 + 1;
    int _2098 = _610 + (-1);
    int _2100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2102 = _2100 != 0;
    int _2104 = _610 * _2096;
    int _2106 = _2104 + _1945;
    int _2108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2110 = _2108 != 0;
    bool _2112 = !_1947;
    int _2114 = _2112 ? _2106 : (-1);
    bool _2116 = !_2086;
    int _2118 = _2116 ? 0 : 1;
    int _2120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2122 = _2120 != 0;
    int _2124 = _2114 * _2060;
    int _2126 = abs(_2118);
    int _2128 = abs(_824);
    int _2130 = _2022 * _2098;
    int _2132 = _2130 + _2124;
    int _2134 = abs(_816);
    bool _2136 = !_2122;
    int _2138 = _2136 ? 0 : 1;
    int _2140 = _2132 * _1951;
    int _2142 = _2090 * _2126;
    int _2144 = _2142 + _1945;
    int _2146 = abs(_2138);
    int _2148 = _2066 * _2134;
    int _2150 = _2148 + _2140;
    float _2152 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2154 = _2152 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2156 = float(uint(_2144));
    float _2158 = _1963;
    float _2160 = _1826;
    float _2162 = _1882;
    float _2164 = _1874;
    if (_2102)
    {
        float _2166 = _1959 ? _2007 : _1963;
        _2158 = _2166;
    }
    float _2168 = _2158;
    int _2170 = _2144 * _2128;
    int _2172 = _2170 + _2150;
    int _2174 = ~_610;
    int _2176 = _2174 + 1;
    float _2178 = as_type<float>(_1985) * _2156;
    int _2180 = _2090 * _2146;
    int _2182 = _2180 + _2172;
    float _2184 = trunc(_2178);
    float _2186 = precise::max(_2184, 0.0);
    uint _2188 = uint(_2186);
    float _2190 = float(uint(_2182));
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2192;
    float _2196 = as_type<float>(_1985) * _2190;
    float _2198 = trunc(_2196);
    float _2200 = precise::max(_2198, 0.0);
    uint _2202 = uint(_2200);
    int _2204 = ~_610;
    int _2206 = _2204 + 1;
    int _2208 = _2176 * int(_2202);
    int _2210 = _2208 + _2182;
    float _2212 = float(uint(_2210));
    int _2214 = ~_610;
    int _2216 = _2214 + 1;
    float _2218 = as_type<float>(_1985) * _2212;
    float _2220 = trunc(_2218);
    float _2222 = precise::max(_2220, 0.0);
    uint _2224 = uint(_2222);
    int _2226 = int(_2202) + int(_2224);
    int _2228 = _2216 * int(_2188);
    int _2230 = _2228 + _2144;
    float _2232 = 1.0 / _2154;
    int _2234 = _2206 * _2226;
    int _2236 = _2234 + _2182;
    float _2238 = float(uint(_2230));
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2242 = _2240 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2244 = uint(_2236) >= uint(_610);
    float _2246 = as_type<float>(_1985) * _2238;
    bool _2248 = !_2244;
    int _2250 = _2248 ? 0 : (-1);
    float _2252 = trunc(_2246);
    float _2254 = precise::max(_2252, 0.0);
    uint _2256 = uint(_2254);
    int _2258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2260 = _2258 != 0;
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    int _2262 = ~_2226;
    int _2264 = _2262 + _2250;
    int _2266 = _2264 + 1;
    float _2268 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2270 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2268;
    bool _2272 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2274 = isnan(_566);
    bool _2276 = _2272 || _2274;
    bool _2278 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2280 = _2276 || _2278;
    float _2282 = float(_2280);
    int _2284 = _610 * _2266;
    int _2286 = _2284 + _2182;
    float _2288 = _2270 * _2232;
    float _2290 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2292 = _566 + _2290;
    float _2294 = -_2282;
    float _2296 = _2294 + 1.0;
    bool _2298 = !_1947;
    int _2300 = _2298 ? _2286 : (-1);
    float _2302 = fma(_2288, _2292, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2304 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2306 = isnan(_566);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2312 = _2308 || _2310;
    float _2314 = float(_2312);
    float _2316 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2318 = _2316 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2320 = _2300 >> 31;
    int _2322 = int(_2188) + int(_2256);
    float _2324 = -_2314;
    float _2326 = _2324 + 1.0;
    int _2328 = _2320 & 3;
    float _2330 = 1.0 / _2318;
    bool _2332 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2334 = isnan(_566);
    bool _2336 = _2332 || _2334;
    bool _2338 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2340 = _2336 || _2338;
    float _2342 = float(_2340);
    int _2344 = _1967 * _2322;
    int _2346 = _2344 + _2144;
    int _2348 = _2300 + _2328;
    float _2350 = _2342 * _2326;
    int _2352 = _2348 >> 2;
    float _2354 = -_2342;
    float _2356 = _2354 + 1.0;
    bool _2358 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2360 = isnan(_566);
    bool _2362 = _2358 || _2360;
    bool _2364 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2366 = _2362 || _2364;
    float _2368 = float(_2366);
    float _2370 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2372 = _2370 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2374 = _2352 << 4;
    int _2376 = _2374 + 368;
    float _2378 = _2282 * _2356;
    bool _2380 = uint(_2346) >= uint(_610);
    float _2382 = _2368 * _2296;
    uint _2384 = uint(int(uint(_2376) >> uint(2)));
    uint _2386 = uint(int(uint(int(_2384)) >> uint(2)));
    int _2388 = int(_2384) & 3;
    float _2390 = (*spvDescriptorSet0.vp_c9)._m0[int(_2386)][_2388];
    int _2392 = int(_2384) + 1;
    uint _2394 = uint(int(uint(_2392) >> uint(2)));
    int _2396 = _2392 & 3;
    float _2398 = (*spvDescriptorSet0.vp_c9)._m0[int(_2394)][_2396];
    float _2400 = 1.0 / _2372;
    bool _2402 = !_2380;
    int _2404 = _2402 ? 0 : (-1);
    float _2406 = _2302 * _2382;
    int _2408 = _2300 & 3;
    bool _2410 = _2408 != 0;
    float _2412 = _2242 * _2330;
    int _2414 = _2300 & 3;
    bool _2416 = _2414 != 0;
    int _2418 = _2376 + 8;
    uint _2420 = uint(int(uint(_2418) >> uint(2)));
    uint _2422 = uint(int(uint(int(_2420)) >> uint(2)));
    int _2424 = int(_2420) & 3;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[int(_2422)][_2424];
    int _2428 = int(_2420) + 1;
    uint _2430 = uint(int(uint(_2428) >> uint(2)));
    int _2432 = _2428 & 3;
    float _2434 = (*spvDescriptorSet0.vp_c9)._m0[int(_2430)][_2432];
    bool _2436 = uint(_2408) > 1u;
    int _2438 = ~_2322;
    int _2440 = _2438 + _2404;
    int _2442 = _2440 + 1;
    int _2444 = _2416 ? 0 : 1;
    bool _2446 = _2408 != 3;
    int _2448 = _610 * _2442;
    int _2450 = _2448 + _2144;
    float _2452 = _2194 * _2400;
    float _2454 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2456 = _566 + _2454;
    float _2458 = -_2368;
    float _2460 = _2458 + 1.0;
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2464 = _566 + _2462;
    bool _2466 = uint(_2408) >= 2u;
    float _2468 = fma(_2412, _2456, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2470 = fma(_2460, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2406);
    float _2472 = fma(_2452, _2464, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2474 = ~_2444;
    int _2476 = _2474 + 1;
    int _2478 = _2476 + 1;
    float _2480 = _2456;
    int _2482 = _2478;
    if (_2110)
    {
        float _2484 = in.m_55.x;
        _2480 = _2484;
    }
    float _2486 = _2480;
    int _2488 = _2466 ? 0 : 1;
    float _2490 = fma(_2468, _2378, _2470);
    if (!_2436)
    {
        int _2492 = ~_2444;
        int _2494 = _2492 + 1;
        _2482 = _2494;
    }
    int _2496 = _2482;
    bool _2498 = !_2410;
    int _2500 = _2498 ? 0 : 1;
    float _2502 = fma(_2472, _2350, _2490);
    int _2504 = ~_2488;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    float _2510 = in.m_67.x;
    int _2512 = abs(_2496);
    float _2514 = -_1916;
    float _2516 = _2514 + 1.0;
    int _2518 = _2508;
    float _2520 = _2510;
    if (_2446)
    {
        int _2522 = ~_2488;
        int _2524 = _2522 + 1;
        _2518 = _2524;
    }
    int _2526 = _2518;
    bool _2528 = _2408 != 3;
    int _2530 = abs(_2500);
    int _2532 = abs(_2526);
    float _2534 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2536 = int(_2534);
    int _2538 = ~_2512;
    int _2540 = _2538 + 1;
    int _2542 = _2540 + 1;
    bool _2544 = !_2528;
    int _2546 = _2544 ? 0 : (-1);
    int _2548 = ~_2530;
    int _2550 = _2548 + 1;
    int _2552 = _2550 + 1;
    int _2554 = _2542 * as_type<int>(_2398);
    int _2556 = abs(_2546);
    int _2558 = ~_2532;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    int _2564 = _2552 * as_type<int>(_2390);
    int _2566 = _2564 + _2554;
    bool _2568 = !_2260;
    int _2570 = _2568 ? 0 : 1;
    float _2572 = in.m_77.x;
    float _2574 = in.m_77.y;
    float _2576 = in.m_77.z;
    int _2578 = ~_2556;
    int _2580 = _2578 + 1;
    int _2582 = _2580 + 1;
    int _2584 = _2562 * as_type<int>(_2426);
    int _2586 = _2584 + _2566;
    bool _2588 = _998 != 0.0;
    bool _2590 = isnan(_998);
    bool _2592 = _2588 || _2590;
    bool _2594 = isnan(0.0);
    bool _2596 = _2592 || _2594;
    int _2598 = abs(_2570);
    int _2600 = _2582 * as_type<int>(_2434);
    int _2602 = _2600 + _2586;
    float _2604 = float(uint(_2536));
    bool _2606 = _996 == 0.0;
    bool _2608 = !_2596;
    bool _2610 = _2606 && _2608;
    float _2612 = 1.0 / _2604;
    int _2614 = abs(_2536);
    bool _2616 = _1000 == 0.0;
    bool _2618 = _2616 && _2610;
    int _2620 = ~_2598;
    int _2622 = _2620 + 1;
    int _2624 = _2622 + 1;
    bool _2626 = !_1947;
    int _2628 = _2626 ? _2450 : (-1);
    float _2630 = fma(_2314, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2502);
    float _2632 = float(uint(_2614));
    int _2634 = _2602 * _2624;
    bool _2636 = _2486 > 0.5;
    bool _2638 = _2636 && _2110;
    float _2640 = 1.0 / _2632;
    int _2642 = _2628 * _2598;
    int _2644 = _2642 + _2634;
    float _2646 = _534 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2648 = _2572;
    float _2650 = _2574;
    float _2652 = _2576;
    float _2654 = as_type<float>(_2624);
    if (!_2618)
    {
        float _2656 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2572);
        _2648 = _2656;
    }
    float _2658 = _2648;
    int _2660 = as_type<int>(_2612) + (-2);
    float _2662 = _528 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2664 = float(uint(_2644));
    if (!_2618)
    {
        float _2666 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2574);
        _2650 = _2666;
    }
    float _2668 = _2650;
    int _2670 = abs(_2644);
    float _2672 = _2662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2674 = _2646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2676 = as_type<float>(_2660) * _2664;
    float _2678 = _2630 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (!_2618)
    {
        float _2680 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2576);
        _2652 = _2680;
    }
    float _2682 = _2652;
    float _2684 = trunc(_2676);
    float _2686 = precise::max(_2684, 0.0);
    uint _2688 = uint(_2686);
    int _2690 = as_type<int>(_2640) + (-2);
    float _2692 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2694 = float(uint(_2670));
    out.m_79.x = _2672;
    out.m_79.y = _2674;
    out.m_79.z = _1957;
    out.m_79.w = _2678;
    int _2696 = ~_2536;
    int _2698 = _2696 + 1;
    int _2700 = ~_2614;
    int _2702 = _2700 + 1;
    float _2704 = as_type<float>(_2690) * _2694;
    float _2706 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2708 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_2110)
    {
        _2654 = _2510;
    }
    float _2710 = _2654;
    float _2712 = trunc(_2704);
    float _2714 = precise::max(_2712, 0.0);
    uint _2716 = uint(_2714);
    float _2718 = _2710;
    if (_2638)
    {
        float _2720 = -_2710;
        float _2722 = _2720 + 1.0;
        _2718 = _2722;
    }
    float _2724 = _2718;
    float _2726 = -_1032;
    float _2728 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2692);
    int _2730 = _2698 * int(_2688);
    int _2732 = _2730 + _2644;
    float _2734 = -_1032;
    float _2736 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2706);
    float _2738 = -_1032;
    float _2740 = fma(_2738, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2708);
    float _2742 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2728);
    float _2744 = float(uint(_2732));
    float _2746 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2736);
    float _2748 = abs(_1468);
    float _2750 = log2(_2748);
    float _2752 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2754 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2756 = as_type<float>(_2660) * _2744;
    int _2758 = _2702 * int(_2716);
    int _2760 = _2758 + _2670;
    float _2762 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2740);
    float _2764 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2752);
    float _2766 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2754);
    float _2768 = trunc(_2756);
    float _2770 = precise::max(_2768, 0.0);
    uint _2772 = uint(_2770);
    float _2774 = float(uint(_2760));
    float _2776 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2778 = _2742 * _2668;
    float _2780 = _2746 * _2668;
    float _2782 = _2762 * _2668;
    float _2784 = as_type<float>(_2690) * _2774;
    float _2786 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2776);
    float _2788 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2790 = ~_2536;
    int _2792 = _2790 + 1;
    float _2794 = trunc(_2784);
    float _2796 = precise::max(_2794, 0.0);
    uint _2798 = uint(_2796);
    int _2800 = ~_2614;
    int _2802 = _2800 + 1;
    float _2804 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2764);
    float _2806 = fma(_1987, _2658, _2778);
    float _2808 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2766);
    int _2810 = int(_2688) + int(_2772);
    float _2812 = fma(_2804, _2658, _2780);
    float _2814 = exp2(_2788);
    if (_2110)
    {
        _2520 = _2724;
    }
    float _2816 = _2520;
    float _2818 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2820 = _2792 * _2810;
    int _2822 = _2820 + _2644;
    float _2824 = fma(_2808, _2658, _2782);
    float _2826 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2786);
    float _2828 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2818);
    bool _2830 = _1468 <= 8000.0;
    bool _2832 = isnan(_1468);
    bool _2834 = _2830 || _2832;
    bool _2836 = isnan(8000.0);
    bool _2838 = _2834 || _2836;
    float _2840 = float(_2838);
    float _2842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2844 = int(_2716) + int(_2798);
    float _2846 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1983);
    float _2848 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2828);
    bool _2850 = uint(_2822) >= uint(_2536);
    float _2852 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2846);
    int _2854 = _2802 * _2844;
    int _2856 = _2854 + _2670;
    bool _2858 = !_2850;
    int _2860 = _2858 ? 0 : (-1);
    float _2862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2864 = fma(_2814, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2866 = precise::clamp(_2864, 0.0, 1.0);
    float _2868 = fma(_2848, _2682, _2812);
    int _2870 = ~_2810;
    int _2872 = _2870 + _2860;
    int _2874 = _2872 + 1;
    bool _2876 = uint(_2856) >= uint(_2614);
    float _2878 = fma(_2866, -2.0, 3.0);
    int _2880 = _2644 ^ _2536;
    int _2882 = _2536 * _2874;
    int _2884 = _2882 + _2644;
    bool _2886 = _2536 == 0;
    float _2888 = _2866 * _2866;
    bool _2890 = !_2876;
    int _2892 = _2890 ? 0 : (-1);
    uint _2894 = uint(int(uint(_2880) >> uint(31)));
    float _2896 = _2888 * _2878;
    bool _2898 = !_2886;
    int _2900 = _2898 ? _2884 : (-1);
    float _2902 = _2862 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2904 = ~_2892;
    int _2906 = _2844 + _2904;
    int _2908 = _2906 + 1;
    float _2910 = fma(_2826, _2682, _2806);
    int _2912 = ~int(_2894);
    int _2914 = _2912 + 1;
    float _2916 = -_2896;
    float _2918 = _2916 + 1.0;
    float _2920 = float(_2900);
    float _2922 = _2842 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2924 = _2908 ^ _2914;
    float _2926 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2928 = fma(_2902, _2816, -0.5);
    float _2930 = fma(_2902, _2920, _738);
    bool _2932 = _2536 == 0;
    float _2934 = fma(_2922, _2168, -0.5);
    int _2936 = ~_2914;
    int _2938 = _2936 + _2924;
    int _2940 = _2938 + 1;
    float _2942 = fma(_2918, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2896);
    float _2944 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2926);
    float _2946 = in.m_81.x;
    bool _2948 = !_2932;
    int _2950 = _2948 ? _2940 : (-1);
    float _2952 = _2840 * _2942;
    float _2954 = _1826 * 0.5;
    float _2956 = float(_2950);
    float _2958 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2960 = fma(_744, _2928, _2930);
    float _2962 = fma(_1882, -0.5, _2954);
    float _2964 = fma(_2852, _2682, _2824);
    float _2966 = -_752;
    float _2968 = fma(_2922, _2956, _2966);
    float _2970 = _2516 * _2958;
    float _2972 = precise::clamp(_2970, 0.0, 1.0);
    float _2974 = _2960 + 0.5;
    float _2976 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2944);
    float _2978 = fma(_740, _2934, _2968);
    float _2980 = _2018 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2982 = -_2972;
    float _2984 = fma(_2982, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.x = _2910;
    out.m_83.y = _2868;
    out.m_83.z = _2964;
    float _2986 = _2978 + 0.5;
    float _2988 = _2980 * _1918;
    float _2990 = -_2980;
    float _2992 = _2990 + 1.0;
    float _2994 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2976);
    bool _2996 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2998 = isnan(_1616);
    bool _3000 = _2996 || _2998;
    bool _3002 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3004 = _3000 || _3002;
    float _3006 = _1929 * _2988;
    float _3008 = _2984 * _2946;
    float _3010 = _1939 * _2988;
    out.m_85.x = _2974;
    out.m_85.y = _2986;
    float _3012 = _1929 * _2992;
    float _3014 = _3008 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3016 = fma(_1929, _3010, _1927);
    float _3018 = _2994 + _1826;
    float _3020 = _1874 + _1826;
    out.m_87.x = _3014;
    float _3022 = _3018 * 0.5;
    float _3024 = _3020 * 0.5;
    float _3026 = fma(_1935, _3006, _1923);
    float _3028 = fma(_1937, _3006, _1925);
    float _3030 = _1524 * _1584;
    out.gl_Position.x = _1874;
    out.gl_Position.y = _1882;
    out.gl_Position.z = _2994;
    out.gl_Position.w = _1826;
    out.m_89.x = _3026;
    out.m_89.y = _3028;
    out.m_89.z = _3016;
    out.m_89.w = _3012;
    out.m_91.x = _3024;
    out.m_91.y = _2962;
    out.m_91.z = _3022;
    out.m_91.w = _1826;
    float _3032 = _2994;
    float _3034 = _3024;
    float _3036 = _3030;
    if (!_3004)
    {
        _2160 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3038 = _2160;
    float _3040 = _3038;
    float _3042 = _3038;
    if (!_3004)
    {
        _3032 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3044 = _3032;
    float _3046 = _3044;
    float _3048 = _3044;
    if (!_3004)
    {
        _2162 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3050 = _2162;
    float _3052 = _3050;
    float _3054 = _3050;
    if (!_3004)
    {
        _2164 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3056 = _2164;
    float _3058 = _3030 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3060 = _3056;
    float _3062 = _3056;
    if (!_3004)
    {
        _3034 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3064 = _3034;
    float _3066 = _3064;
    float _3068 = _3064;
    if (!_3004)
    {
        _3036 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3070 = _3036;
    bool _3072 = !_3004;
    float _3074 = _3070;
    float _3076 = _3070;
    if (!_3072)
    {
        bool _3078 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3080 = isnan(_1616);
        bool _3082 = _3078 || _3080;
        bool _3084 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3086 = _3082 || _3084;
        if (!_3086)
        {
            float _3088 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3090 = _1616 + _3088;
            float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3094 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3092;
            float _3096 = 1.0 / _3094;
            float _3098 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3100 = _3098 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3102 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3104 = _3102 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3108 = _3106 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3110 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3112 = _3110 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3116 = _3114 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3118 = _3090 * _3096;
            float _3120 = precise::clamp(_3118, 0.0, 1.0);
            float _3122 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3124 = _3122 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3126 = fma(_3120, _3100, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3128 = fma(_3120, _3124, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3130 = fma(_3120, _3104, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3132 = fma(_3120, _3108, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3134 = fma(_3120, _3112, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3136 = fma(_3120, _3116, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3042 = _3128;
            _3062 = _3134;
            _3068 = _3126;
            _3054 = _3132;
            _3048 = _3130;
            _3076 = _3136;
            _3138 = true;
        }
        else
        {
            bool _3140 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3142 = isnan(_1616);
            bool _3144 = _3140 || _3142;
            bool _3146 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3148 = _3144 || _3146;
            if (!_3148)
            {
                _3066 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3150 = _3066;
            _3068 = _3150;
            if (!_3148)
            {
                _3040 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3152 = _3040;
            _3042 = _3152;
            if (!_3148)
            {
                _3046 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3154 = _3046;
            _3048 = _3154;
            if (!_3148)
            {
                _3052 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3156 = _3052;
            _3054 = _3156;
            if (!_3148)
            {
                _3060 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3158 = _3060;
            _3062 = _3158;
            if (!_3148)
            {
                _3074 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3160 = _3074;
            bool _3162 = !_3148;
            _3076 = _3160;
            if (!_3162)
            {
                bool _3164 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3166 = isnan(_1616);
                bool _3168 = _3164 || _3166;
                bool _3170 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3172 = _3168 || _3170;
                if (!_3172)
                {
                    float _3174 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3176 = _1616 + _3174;
                    float _3178 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3180 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3178;
                    float _3182 = 1.0 / _3180;
                    float _3184 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3186 = _3184 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3188 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3190 = _3188 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3192 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3194 = _3192 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3196 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3198 = _3196 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3200 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3202 = _3200 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3204 = _3176 * _3182;
                    float _3206 = precise::clamp(_3204, 0.0, 1.0);
                    float _3208 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3210 = _3208 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3212 = fma(_3206, _3186, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3214 = fma(_3206, _3210, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3216 = fma(_3206, _3190, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3218 = fma(_3206, _3194, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3220 = fma(_3206, _3198, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3222 = fma(_3206, _3202, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3042 = _3214;
                    _3062 = _3220;
                    _3068 = _3212;
                    _3054 = _3218;
                    _3048 = _3216;
                    _3076 = _3222;
                    _3138 = true;
                }
                else
                {
                    _3042 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3062 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3068 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3054 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3048 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3076 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3138 = false;
    float _3224 = _3042;
    float _3226 = _3062;
    float _3228 = _3068;
    float _3230 = _3054;
    float _3232 = _3048;
    float _3234 = _3076;
    float _3236 = _3058 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3238 = fma(_2868, -0.5, 0.5);
    float _3240 = precise::clamp(_3238, 0.0, 1.0);
    float _3242 = -_3224;
    float _3244 = _3242 + _3226;
    float _3246 = -_3228;
    float _3248 = _3246 + _3230;
    out.m_49.x = _3236;
    float _3250 = fma(_3240, _3244, _3224);
    float _3252 = -_3232;
    float _3254 = _3252 + _3234;
    float _3256 = fma(_3240, _3248, _3228);
    float _3258 = _3250 * 0.586610972881317138671875;
    bool _3260 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3262 = fma(_3240, _3254, _3232);
    out.m_93.x = 0.0;
    float _3264 = fma(_3256, 0.298911988735198974609375, _3258);
    bool _3266 = _1524 > 0.0;
    bool _3268 = isnan(_1524);
    bool _3270 = _3266 || _3268;
    bool _3272 = isnan(0.0);
    bool _3274 = _3270 || _3272;
    float _3276 = fma(_3262, 0.114477999508380889892578125, _3264);
    bool _3278 = _1584 <= 0.0;
    bool _3280 = !_3274;
    bool _3282 = _3278 || _3280;
    float _3284 = -_3276;
    float _3286 = _3256 + _3284;
    float _3288 = -_3276;
    float _3290 = _3250 + _3288;
    float _3292 = -_3276;
    float _3294 = _3262 + _3292;
    float _3296 = fma(_3286, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3276);
    float _3298 = fma(_3290, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3276);
    float _3300 = fma(_3294, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3276);
    bool _3302 = !_3260;
    if (!_3302)
    {
        float _3304 = -_1458;
        float _3306 = _3304 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3308 = -_1460;
        float _3310 = _3308 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3312 = -_1462;
        float _3314 = _3312 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3316 = _3306 * _3306;
        float _3318 = fma(_3310, _3310, _3316);
        float _3320 = fma(_3314, _3314, _3318);
        float _3322 = sqrt(_3320);
        float _3324 = rsqrt(_3320);
        float _3326 = -_3322;
        float _3328 = _3326 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3330 = _3328 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3332 = precise::clamp(_3330, 0.0, 1.0);
        float _3334 = _3310 * _3324;
        float _3336 = _3306 * _3324;
        float _3338 = abs(_3332);
        float _3340 = log2(_3338);
        float _3342 = _3314 * _3324;
        float _3344 = _3334 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3346 = _2868 * _3336;
        float _3348 = -_3336;
        float _3350 = -_3344;
        float _3352 = fma(_3348, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3350);
        float _3354 = fma(_2910, _3334, _3346);
        float _3356 = -_3342;
        float _3358 = fma(_3356, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3352);
        float _3360 = fma(_2964, _3342, _3354);
        float _3362 = precise::clamp(_3360, 0.0, 1.0);
        float _3364 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3366 = _3358 + _3364;
        float _3368 = _3340 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3370 = _3366 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3372 = precise::clamp(_3370, 0.0, 1.0);
        float _3374 = exp2(_3368);
        float _3376 = _3374 * _3372;
        float _3378 = _3362 * _3376;
        float _3380 = _3378 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3382 = _3378 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3384 = _3378 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3380;
        out.m_93.y = _3382;
        out.m_93.z = _3384;
    }
    out.m_69.x = _3296;
    out.m_69.y = _3298;
    out.m_69.z = _3300;
    if (!_3282)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3386 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3386;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3138 = false;
    bool _558 = false;
    bool _444 = false;
    bool _340 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3443 = as_type<float>(_128);
        out.gl_Position.z = _3443;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3513 = as_type<float>(_166);
        out.gl_Position.z = _3513;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = _170 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _178 = _170 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _180 = _170 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _182 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].x, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].x, _180);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].z, _182);
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].z, _184);
    float _192 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].z, _186);
    bool _194 = !_174;
    float _212;
    if (!_194)
    {
        float _196 = in.m_55.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        float _216 = float(_112);
        float _218 = 1.0 / _216;
        float _220 = _146 * _218;
        _212 = _220;
    }
    _214 = false;
    float _222 = _212;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _222 + _224;
    bool _228 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _230 = isnan(_222);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _240;
    float _244 = 1.0 / _242;
    bool _246 = _222 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _248 = isnan(_222);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -_238;
    float _260 = _258 + 1.0;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _266;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _272 = _256 * _260;
    float _274 = -_256;
    float _276 = _274 + 1.0;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = _226 * _244;
    float _284 = in.m_57.x;
    float _286 = in.m_57.y;
    float _288 = in.m_57.z;
    float _290 = fma(_264, _282, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _292 = fma(_280, _282, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _294 = fma(_268, _282, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _296 = _290 * _272;
    float _298 = _292 * _272;
    float _300 = _294 * _272;
    float _302 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _304 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].y, _298);
    float _306 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].z, _300);
    float _308 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].x, _302);
    float _310 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].y, _304);
    float _312 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[144].z, _306);
    float _314 = _308 * _284;
    float _316 = _310 * _286;
    float _318 = _312 * _288;
    bool _320 = !_270;
    float _338;
    if (!_320)
    {
        float _322 = in.m_55.x;
        float _324 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _326 = _322 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _328 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _330 = _328 * _324;
        float _332 = floor(_330);
        float _334 = -_332;
        float _336 = _330 + _334;
        _338 = _336;
        _340 = true;
    }
    else
    {
        float _342 = float(_112);
        float _344 = 1.0 / _342;
        float _346 = _146 * _344;
        _338 = _346;
    }
    _340 = false;
    float _348 = _338;
    bool _350 = _348 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _352 = isnan(_348);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _364 = _362 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _366 = _348 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _368 = isnan(_348);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _384 = _348 + _382;
    float _386 = -_360;
    float _388 = _386 + 1.0;
    bool _390 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _392 = 1.0 / _364;
    float _394 = _376 * _388;
    float _396 = -_376;
    float _398 = _396 + 1.0;
    float _400 = _380 * _392;
    float _402 = fma(_400, _384, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _404 = _402 * _394;
    float _406 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[115].x, _404);
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _414 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[116].x, _406);
    float _416 = _408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _420 = _412 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _422 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _416;
    out.m_59.y = _418;
    out.m_59.z = _420;
    out.m_59.w = _422;
    bool _424 = !_390;
    float _442;
    if (!_424)
    {
        float _426 = in.m_55.x;
        float _428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _430 = _426 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[11].z, _146);
        float _434 = _432 * _428;
        float _436 = floor(_434);
        float _438 = -_436;
        float _440 = _434 + _438;
        _442 = _440;
        _444 = true;
    }
    else
    {
        float _446 = float(_112);
        float _448 = 1.0 / _446;
        float _450 = _146 * _448;
        _442 = _450;
    }
    _444 = false;
    float _452 = _442;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _456 = _452 + _454;
    bool _458 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _460 = isnan(_452);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _470;
    bool _474 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _476 = isnan(_452);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -_468;
    float _488 = _486 + 1.0;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _490;
    float _494 = 1.0 / _472;
    bool _496 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _498 = _456 * _494;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _500;
    float _504 = _484 * _488;
    float _506 = fma(_492, _498, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _508 = -_484;
    float _510 = _508 + 1.0;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _512;
    float _516 = fma(_502, _498, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _518 = _506 * _504;
    float _520 = fma(_514, _498, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _522 = _516 * _504;
    float _524 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[123].x, _518);
    float _526 = _520 * _504;
    float _528 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[124].x, _524);
    float _530 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[123].y, _526);
    float _532 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[123].z, _522);
    float _534 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[124].y, _530);
    float _536 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[124].z, _532);
    bool _538 = !_496;
    float _556;
    if (!_538)
    {
        float _540 = in.m_55.x;
        float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _544 = _540 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _548 = _546 * _542;
        float _550 = floor(_548);
        float _552 = -_550;
        float _554 = _548 + _552;
        _556 = _554;
        _558 = true;
    }
    else
    {
        float _560 = float(_112);
        float _562 = 1.0 / _560;
        float _564 = _146 * _562;
        _556 = _564;
    }
    _558 = false;
    float _566 = _556;
    float _568 = in.m_55.x;
    float _570 = in.m_55.y;
    float _572 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _574 = log2(_572);
    float _576 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _578 = in.m_46.x;
    float _580 = in.m_46.y;
    float _582 = in.m_46.z;
    float _584 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _586 = in.m_55.z;
    float _588 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _590 = int(_588);
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _594 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _602 = _598 || _600;
    float _604 = _574 * _146;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _608 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _610 = int(_608);
    float _612 = _568 * 2.0;
    float _614 = _568 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _616 = _570 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _618 = exp2(_604);
    float _620 = _570 * 2.0;
    float _622 = -_606;
    float _624 = fma(_614, 2.0, _622);
    float _626 = fma(_616, -2.0, _592);
    float _628 = _580 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _630 = _580 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _632 = _580 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _634 = _570 + _568;
    float _636 = floor(_612);
    float _638 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[4].x, _628);
    float _640 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[5].x, _630);
    float _642 = _634 + (-1.0);
    float _644 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _646 = float(_590);
    float _648 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].x, _632);
    float _650 = _570 + _586;
    float _652 = _586 * 2.0;
    float _654 = floor(_620);
    float _656 = _650 + (-1.0);
    float _658 = -_618;
    float _660 = _658 + 1.0;
    bool _662 = _636 > 0.0;
    bool _664 = _636 >= 0.0;
    bool _666 = isnan(_636);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    float _674 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _676 = floor(_652);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _680 = 1.0 + _678;
    bool _682 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _684 = isnan(1.0);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _690 = _686 || _688;
    float _692 = _602 ? _660 : 0.0;
    float _694 = 1.0 / _646;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _700 = float(_610);
    bool _702 = _654 > 0.0;
    float _704 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[78].w, _698);
    bool _706 = _654 >= 0.0;
    bool _708 = isnan(_654);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = 1.0 / _680;
    bool _718 = _676 > 0.0;
    float _720 = _700 * _146;
    bool _722 = _676 >= 0.0;
    bool _724 = isnan(_676);
    bool _726 = _722 || _724;
    bool _728 = isnan(0.0);
    bool _730 = _726 || _728;
    float _732 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[78].z, _696);
    int _734 = _672 ? 0 : 1;
    float _736 = -_146;
    float _738 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[76].x, _624);
    float _740 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _704);
    float _742 = _694 * _146;
    float _744 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _732);
    int _746 = ~_734;
    int _748 = _746 + 1;
    int _750 = _748 + 1;
    float _752 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _626);
    int _754 = _750;
    if (!_662)
    {
        int _756 = ~_734;
        int _758 = _756 + 1;
        _754 = _758;
    }
    int _760 = _754;
    float _762 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[4].z, _638);
    int _764 = _714 ? 0 : 1;
    float _766 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[5].z, _640);
    if (_690)
    {
        float _768 = _692 * _716;
        _148 = _768;
    }
    float _770 = _148;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _774 = _772 != 0;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _778 = _776 != 0;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _782 = _780 != 0;
    float _784 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[6].z, _648);
    int _786 = ~_764;
    int _788 = _786 + 1;
    int _790 = _788 + 1;
    float _792 = _766 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _794 = _790;
    if (!_702)
    {
        int _796 = ~_764;
        int _798 = _796 + 1;
        _794 = _798;
    }
    int _800 = _794;
    float _802 = _762 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _804 = !_778;
    int _806 = _804 ? 0 : 1;
    float _808 = in.m_61.x;
    float _810 = in.m_61.y;
    float _812 = in.m_61.z;
    bool _814 = !_774;
    int _816 = _814 ? 0 : 1;
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _820 = _792 + _818;
    bool _822 = !_782;
    int _824 = _822 ? 0 : 1;
    float _826 = _784 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _834 = _832 != 0;
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _838 = _836 != 0;
    float _840 = _820 * _820;
    float _842 = float(_760);
    int _844 = _730 ? 0 : 1;
    bool _846 = !_834;
    int _848 = _846 ? 0 : 1;
    bool _850 = !_830;
    int _852 = _850 ? 0 : 1;
    int _854 = abs(_848);
    int _856 = abs(_852);
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _860 = _802 + _858;
    int _862 = ~_844;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    float _868 = float(_854);
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _872 = _826 + _870;
    float _874 = fma(_860, _860, _840);
    int _876 = _866;
    if (!_718)
    {
        int _878 = ~_844;
        int _880 = _878 + 1;
        _876 = _880;
    }
    int _882 = _876;
    float _884 = _868 * _842;
    float _886 = fma(_872, _872, _874);
    float _888 = float(_882);
    float _890 = _884 * (-2.0);
    float _892 = sqrt(_886);
    float _894 = _570 + (-0.5);
    bool _896 = !_838;
    int _898 = _896 ? 0 : 1;
    float _900 = fma(_890, _810, _810);
    float _902 = float(_856);
    float _904 = fma(_674, _890, _674);
    int _906 = abs(_898);
    float _908 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[196].y, _900);
    float _910 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _912 = rsqrt(_886);
    float _914 = _902 * _888;
    float _916 = float(_800);
    float _918 = _586 + _568;
    float _920 = float(_906);
    float _922 = _910 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _924 = _892 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _926 = _918 + (-1.0);
    float _928 = _920 * _916;
    float _930 = _914 * (-2.0);
    float _932 = fma(_904, _770, _908);
    float _934 = precise::min(_922, _924);
    float _936 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _938 = _928 * (-2.0);
    float _940 = _568 + (-0.5);
    float _942 = fma(_930, _808, _808);
    float _944 = _912 * _934;
    float _946 = fma(_936, _938, _936);
    float _948 = fma(_938, _812, _812);
    float _950 = _586 + (-0.5);
    float _952 = fma(_644, _930, _644);
    float _954 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[196].x, _942);
    float _956 = _820 * _944;
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[196].z, _948);
    float _960 = _872 * _944;
    float _962 = fma(_952, _770, _954);
    float _964 = _860 * _944;
    float _966 = -_956;
    float _968 = _820 + _966;
    float _970 = fma(_946, _770, _958);
    float _972 = _932 * 0.15915493667125701904296875;
    float _974 = -_964;
    float _976 = _860 + _974;
    float _978 = _968 * _968;
    float _980 = _970 * 0.15915493667125701904296875;
    float _982 = -_960;
    float _984 = _872 + _982;
    float _986 = _962 * 0.15915493667125701904296875;
    float _988 = fma(_976, _976, _978);
    float _990 = _972 * 6.283185482025146484375;
    float _992 = sin(_990);
    float _994 = fma(_984, _984, _988);
    float _996 = in.m_63.x;
    float _998 = in.m_63.y;
    float _1000 = in.m_63.z;
    float _1002 = sqrt(_994);
    float _1004 = _972 * 6.283185482025146484375;
    float _1006 = cos(_1004);
    float _1008 = _980 * 6.283185482025146484375;
    float _1010 = cos(_1008);
    float _1012 = _912 * _1002;
    float _1014 = _576 * _1012;
    float _1016 = _910 * _1012;
    float _1018 = _986 * 6.283185482025146484375;
    float _1020 = cos(_1018);
    float _1022 = _584 * _1012;
    float _1024 = _986 * 6.283185482025146484375;
    float _1026 = sin(_1024);
    float _1028 = _1006 * _1010;
    float _1030 = _980 * 6.283185482025146484375;
    float _1032 = sin(_1030);
    float _1034 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _998);
    float _1036 = _1020 * _1006;
    float _1038 = _1020 * _992;
    float _1040 = _1020 * _1010;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _996);
    float _1044 = _1014 * _1034;
    float _1046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1000);
    float _1048 = _1026 * _992;
    float _1050 = _1026 * _1006;
    float _1052 = _1026 * _1010;
    float _1054 = _992 * _1010;
    float _1056 = _1016 * _1042;
    float _1058 = _1040 * _1044;
    float _1060 = _1022 * _1046;
    float _1062 = fma(_1032, _1036, _1048);
    float _1064 = -_1050;
    float _1066 = fma(_1032, _1038, _1064);
    float _1068 = -_1044;
    float _1070 = _1032 * _1068;
    float _1072 = -_1038;
    float _1074 = fma(_1032, _1050, _1072);
    float _1076 = fma(_1062, _1056, _1058);
    float _1078 = _1052 * _1044;
    float _1080 = fma(_1028, _1056, _1070);
    float _1082 = fma(_1032, _1048, _1036);
    float _1084 = fma(_1066, _1060, _1076);
    float _1086 = fma(_1074, _1056, _1078);
    float _1088 = fma(_1054, _1060, _1080);
    float _1090 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1092 = fma(_1082, _1060, _1086);
    float _1094 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1096 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1090);
    float _1098 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1094);
    float _1100 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1096);
    float _1102 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1098);
    float _1104 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1106 = _1102 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1108 = _826 + _1104;
    float _1110 = _802 + _1106;
    float _1112 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1114 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1116 = _1108 + _1114;
    float _1118 = -_960;
    float _1120 = _826 + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1124 = _1110 + _1122;
    float _1126 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1112);
    float _1128 = _1116 * _1116;
    float _1130 = -_956;
    float _1132 = _792 + _1130;
    float _1134 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1126);
    float _1136 = fma(_1124, _1124, _1128);
    float _1138 = -_964;
    float _1140 = _802 + _1138;
    float _1142 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1144 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1146 = sqrt(_1136);
    float _1148 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1142);
    float _1150 = _792 + _1144;
    float _1152 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1148);
    bool _1154 = _1146 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1156 = _1148;
    float _1158 = _1134;
    float _1160 = _1144;
    float _1162 = _956;
    float _1164 = _964;
    float _1166 = _960;
    float _1168 = _892;
    if (!_1154)
    {
        _1156 = _1110;
    }
    float _1170 = _1156;
    float _1172 = _1170;
    if (!_1154)
    {
        _1158 = _1108;
    }
    float _1174 = _1158;
    float _1176 = _1174;
    if (!_1154)
    {
        _1160 = _1150;
    }
    float _1178 = _1160;
    bool _1180 = !_1154;
    float _1182 = _1178;
    if (!_1180)
    {
        float _1184 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1186 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1188 = _1146 + _1186;
        float _1190 = rsqrt(_1136);
        float _1192 = _1188 * _1184;
        float _1194 = _1150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1196 = _1192 * 0.15915493667125701904296875;
        float _1198 = _1196 * 6.283185482025146484375;
        float _1200 = cos(_1198);
        float _1202 = _1196 * 6.283185482025146484375;
        float _1204 = sin(_1202);
        float _1206 = _1200 + (-1.0);
        float _1208 = _1206 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1210 = fma(_1204, _1194, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1212 = fma(_1150, _1200, _1208);
        float _1214 = _1190 * _1210;
        float _1216 = fma(_1124, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1218 = fma(_1116, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1182 = _1212;
        _1172 = _1216;
        _1176 = _1218;
    }
    float _1220 = _1182;
    float _1222 = _1172;
    float _1224 = _1176;
    float _1226 = -_792;
    float _1228 = _1226 + _1220;
    float _1230 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1232 = -_802;
    float _1234 = _1232 + _1222;
    float _1236 = _1132 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1238 = _1228 * _1228;
    float _1240 = -_826;
    float _1242 = _1240 + _1224;
    float _1244 = 1.0 / _1230;
    float _1246 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1236);
    float _1248 = fma(_1234, _1234, _1238);
    float _1250 = -_956;
    float _1252 = _1250 + _1220;
    float _1254 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1246);
    float _1256 = fma(_1242, _1242, _1248);
    float _1258 = -_960;
    float _1260 = _1258 + _1224;
    float _1262 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1264 = sqrt(_1256);
    bool _1266 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1268 = isnan(0.5);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1274 = _1270 || _1272;
    float _1276 = _1262 + _1230;
    bool _1278 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1280 = isnan(0.5);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1286 = _1282 || _1284;
    float _1288 = _1276 * _1244;
    float _1290 = _1288 * 0.5;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1294 = fma(_1290, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1292);
    float _1296 = -_964;
    float _1298 = _1296 + _1222;
    float _1300 = 1.0 / _1294;
    bool _1302 = _1264 > 0.0;
    float _1304 = _1230;
    float _1306 = _1244;
    float _1308 = _1234;
    float _1310 = _1294;
    if (!_1302)
    {
        _1162 = _1298;
    }
    float _1312 = _1162;
    float _1314 = _1312;
    if (!_1302)
    {
        _1164 = _1252;
    }
    float _1316 = _1164;
    float _1318 = _1316;
    if (!_1302)
    {
        _1166 = _1260;
    }
    float _1320 = _1166;
    bool _1322 = !_1302;
    float _1324 = _1320;
    float _1326 = _1320;
    if (!_1322)
    {
        float _1328 = _190 * _190;
        float _1330 = fma(_188, _188, _1328);
        float _1332 = rsqrt(_1256);
        float _1334 = fma(_192, _192, _1330);
        float _1336 = sqrt(_1334);
        float _1338 = _1234 * _1332;
        float _1340 = _1228 * _1332;
        float _1342 = _1242 * _1332;
        bool _1344 = _1336 > 0.0;
        float _1346 = _1332;
        float _1348 = _1336;
        _1304 = _1338;
        _1306 = _1340;
        if (!_1344)
        {
            _1346 = _1298;
        }
        float _1350 = _1346;
        _1314 = _1350;
        if (!_1344)
        {
            _1348 = _1252;
        }
        float _1352 = _1348;
        _1318 = _1352;
        if (!_1344)
        {
            _1324 = _1260;
        }
        float _1354 = _1324;
        bool _1356 = !_1344;
        _1326 = _1354;
        if (!_1356)
        {
            float _1358 = rsqrt(_1334);
            float _1360 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1362 = _190 * _1358;
            float _1364 = _188 * _1358;
            float _1366 = _1340 * _1362;
            float _1368 = _192 * _1358;
            float _1370 = fma(_1338, _1364, _1366);
            float _1372 = _1360 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1374 = fma(_1342, _1368, _1370);
            float _1376 = _1374 * _1372;
            float _1378 = fma(_188, _1376, _1298);
            float _1380 = fma(_190, _1376, _1252);
            float _1382 = fma(_192, _1376, _1260);
            _1314 = _1378;
            _1318 = _1380;
            _1326 = _1382;
        }
    }
    float _1384 = _1314;
    float _1386 = _1318;
    float _1388 = _1326;
    float _1390 = _1304;
    float _1392 = _1306;
    float _1394 = _1392;
    float _1396 = _1386;
    float _1398 = _1384;
    float _1400 = _1388;
    float _1402 = _1390;
    if (_1286)
    {
        _1394 = 1.0;
    }
    float _1404 = _1394;
    float _1406 = _1404;
    if (!_1274)
    {
        float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1410 = _1132 + _1408;
        float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1414 = _1140 + _1412;
        float _1416 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1418 = _1410 * _1410;
        float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1422 = _1120 + _1420;
        float _1424 = fma(_1414, _1414, _1418);
        float _1426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1428 = fma(_1422, _1422, _1424);
        float _1430 = sqrt(_1428);
        float _1432 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1434 = precise::min(_1430, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1436 = _1434 * _1426;
        float _1438 = -_1140;
        float _1440 = _1438 + _1384;
        float _1442 = _1432 * _1436;
        float _1444 = -_1132;
        float _1446 = _1444 + _1386;
        float _1448 = -_1120;
        float _1450 = _1448 + _1388;
        float _1452 = fma(_1440, _1442, _1140);
        float _1454 = fma(_1446, _1442, _1132);
        float _1456 = fma(_1450, _1442, _1120);
        _1396 = _1454;
        _1398 = _1452;
        _1400 = _1456;
    }
    float _1458 = _1396;
    float _1460 = _1398;
    float _1462 = _1400;
    if (_1286)
    {
        _1308 = 1.0;
    }
    float _1464 = _1308;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1468 = _1300 * _1466;
    float _1470 = _1464;
    if (!_1286)
    {
        float _1472 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1474 = _1472 * 0.15915493667125701904296875;
        float _1476 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1480 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1478;
        float _1482 = _1474 * 6.283185482025146484375;
        float _1484 = cos(_1482);
        float _1486 = _1476 * 0.15915493667125701904296875;
        float _1488 = _1474 * 6.283185482025146484375;
        float _1490 = sin(_1488);
        float _1492 = 1.0 / _1484;
        float _1494 = _1486 * 6.283185482025146484375;
        float _1496 = cos(_1494);
        float _1498 = _1490 * _1492;
        float _1500 = _1486 * 6.283185482025146484375;
        float _1502 = sin(_1500);
        float _1504 = _1496 * _1498;
        float _1506 = 1.0 / _1480;
        float _1508 = 1.0 / _1504;
        float _1510 = _1502 * _1508;
        float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1514 = fma(_1468, _1510, _1512);
        float _1516 = _1514 * _1506;
        float _1518 = precise::clamp(_1516, 0.0, 1.0);
        _1310 = _1486;
        _1402 = _1474;
        _1406 = _1518;
    }
    float _1520 = _1310;
    float _1522 = _1402;
    float _1524 = _1406;
    float _1526 = _1522;
    float _1528 = _1520;
    if (!_1286)
    {
        float _1530 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1532 = _1530 * 0.15915493667125701904296875;
        float _1534 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1536 = _1532 * 6.283185482025146484375;
        float _1538 = cos(_1536);
        float _1540 = _1534 * 0.15915493667125701904296875;
        float _1542 = _1532 * 6.283185482025146484375;
        float _1544 = sin(_1542);
        float _1546 = 1.0 / _1538;
        float _1548 = _1540 * 6.283185482025146484375;
        float _1550 = cos(_1548);
        float _1552 = _1544 * _1546;
        float _1554 = _1540 * 6.283185482025146484375;
        float _1556 = sin(_1554);
        float _1558 = _1550 * _1552;
        float _1560 = 1.0 / _1558;
        float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1564 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1562;
        float _1566 = 1.0 / _1564;
        float _1568 = _1556 * _1560;
        float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1572 = fma(_1468, _1568, _1570);
        float _1574 = _1572 * _1566;
        float _1576 = precise::clamp(_1574, 0.0, 1.0);
        float _1578 = -_1576;
        float _1580 = _1578 + 1.0;
        _1526 = _1558;
        _1470 = _1580;
    }
    float _1582 = _1526;
    float _1584 = _1470;
    float _1586 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1588 = _1458 + _1586;
    float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1592 = _1460 + _1590;
    float _1594 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1596 = _1462 + _1594;
    float _1598 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1600 = _1588 * _1588;
    float _1602 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1598);
    float _1604 = fma(_1592, _1592, _1600);
    float _1606 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1608 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1602);
    float _1610 = fma(_1596, _1596, _1604);
    float _1612 = _1608 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1614 = rsqrt(_1610);
    float _1616 = sqrt(_1610);
    float _1618 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1620 = _1592 * _1618;
    float _1622 = _1596 * _1618;
    float _1624 = _1620 * _1620;
    float _1626 = _1622 * _1622;
    float _1628 = _1624 + _1626;
    float _1630 = sqrt(_1628);
    bool _1632 = _1630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1636 = _1630 + _1634;
    float _1638 = _1596;
    float _1640 = _1628;
    float _1642 = _1636;
    float _1644 = _1582;
    if (_1632)
    {
        float _1646 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1638 = _1646;
    }
    float _1648 = _1638;
    if (_1632)
    {
        float _1650 = rsqrt(_1628);
        _1640 = _1650;
    }
    float _1652 = _1640;
    float _1654 = _1652;
    if (_1632)
    {
        float _1656 = _1636 * _1648;
        _1642 = _1656;
    }
    float _1658 = _1642;
    if (_1632)
    {
        float _1660 = _1658 * 0.15915493667125701904296875;
        _1528 = _1660;
    }
    float _1662 = _1528;
    float _1664 = _1648;
    float _1666 = _1662;
    if (_1632)
    {
        float _1668 = _1662 * 6.283185482025146484375;
        float _1670 = sin(_1668);
        _1664 = _1670;
    }
    float _1672 = _1664;
    float _1674 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1676 = precise::max(0.0, _1674);
    float _1678 = _1600;
    float _1680 = _1676;
    if (_1632)
    {
        float _1682 = _1662 * 6.283185482025146484375;
        float _1684 = cos(_1682);
        _1678 = _1684;
    }
    float _1686 = _1678;
    float _1688 = -_1618;
    float _1690 = -_1676;
    float _1692 = fma(_1588, _1688, _1690);
    if (_1632)
    {
        float _1694 = _1692 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1680 = _1694;
    }
    float _1696 = _1680;
    float _1698 = _1696;
    if (!_1632)
    {
        _1666 = _1692;
    }
    float _1700 = _1666;
    float _1702 = fma(_1140, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1704 = _1672;
    float _1706 = _1700;
    if (_1632)
    {
        float _1708 = fma(_1672, _1696, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1704 = _1708;
    }
    float _1710 = _1704;
    float _1712 = floor(_1702);
    float _1714 = _1710;
    float _1716 = _1686;
    if (_1632)
    {
        float _1718 = _1686 + (-1.0);
        _1698 = _1718;
    }
    float _1720 = _1698;
    float _1722 = _1720;
    if (_1632)
    {
        float _1724 = _1652 * _1710;
        _1168 = _1724;
    }
    float _1726 = _1168;
    if (!_1632)
    {
        _1714 = _1620;
    }
    float _1728 = _1714;
    float _1730 = _1728;
    if (_1632)
    {
        float _1732 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1644 = _1732;
    }
    float _1734 = _1644;
    if (_1632)
    {
        float _1736 = _1620 * _1726;
        _1730 = _1736;
    }
    float _1738 = _1730;
    if (!_1632)
    {
        _1654 = _1622;
    }
    float _1740 = _1654;
    float _1742 = _1740;
    if (_1632)
    {
        float _1744 = _1622 * _1726;
        _1742 = _1744;
    }
    float _1746 = _1742;
    if (!_1632)
    {
        _1722 = _1624;
    }
    float _1748 = _1722;
    float _1750 = _1748;
    if (_1632)
    {
        float _1752 = fma(_1692, _1686, _1734);
        _1706 = _1752;
    }
    float _1754 = _1706;
    if (_1632)
    {
        float _1756 = _1738 * _1738;
        _1750 = _1756;
    }
    float _1758 = _1750;
    float _1760 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1632)
    {
        _1716 = _1626;
    }
    float _1762 = _1716;
    float _1764 = _1762;
    if (_1632)
    {
        float _1766 = _1746 * _1746;
        _1764 = _1766;
    }
    float _1768 = _1764;
    float _1770 = fma(_1754, _1754, _1758);
    float _1772 = fma(_1120, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1774 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1776 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1760);
    float _1778 = _1770 + _1768;
    float _1780 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1782 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1774);
    float _1784 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1776);
    float _1786 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1780);
    float _1788 = rsqrt(_1778);
    float _1790 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1782);
    float _1792 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1796 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1794);
    float _1798 = precise::clamp(_1796, 0.0, 1.0);
    float _1800 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1786);
    float _1802 = _1790 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1804 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1806 = -_1798;
    float _1808 = _1806 + 1.0;
    float _1810 = _1800 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1812 = floor(_1772);
    float _1814 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1804);
    float _1816 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1818 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1814);
    float _1820 = _1788 * _1738;
    float _1822 = abs(_1808);
    float _1824 = log2(_1822);
    float _1826 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1818);
    float _1828 = _1788 * _1754;
    float _1830 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1832 = _1788 * _1746;
    float _1834 = -_1816;
    float _1836 = fma(_1834, _1606, 1.0);
    float _1838 = -_1712;
    float _1840 = _1702 + _1838;
    float _1842 = -_1830;
    float _1844 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1842);
    float _1846 = 1.0 / _1826;
    float _1848 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1850 = -_1812;
    float _1852 = _1772 + _1850;
    float _1854 = -_1832;
    float _1856 = fma(_1854, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1844);
    float _1858 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1860 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1848);
    float _1862 = _1828 + 1.0;
    float _1864 = log2(_1836);
    float _1866 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1868 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1858);
    float _1870 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1860);
    float _1872 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1868);
    float _1874 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1870);
    float _1876 = exp2(_1866);
    float _1878 = fma(_1856, -0.5, 0.5);
    float _1880 = fma(_1856, 0.5, 0.5);
    float _1882 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1872);
    float _1884 = _1874 * _1846;
    float _1886 = fma(_1880, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1888 = _1882 * _1846;
    float _1890 = sqrt(_1878);
    float _1892 = _1864 * 0.693147182464599609375;
    float _1894 = fma(_1880, _1886, -0.212114393711090087890625);
    float _1896 = fma(_1884, 0.5, 0.5);
    float _1898 = fma(_1888, -0.5, 0.5);
    float _1900 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1902 = fma(_1880, _1894, 1.570728778839111328125);
    float _1904 = -_1828;
    float _1906 = fma(_1876, _1862, _1904);
    float _1908 = _1890 * 0.636619746685028076171875;
    float _1910 = -_1902;
    float _1912 = fma(_1908, _1910, 1.0);
    float _1914 = fma(_1906, 0.5, 0.5);
    float2 _6235 = float2(_1840, _1852);
    float _1916 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6235, float2(0.0), isnan(_6235)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6235, float2(0.0), isnan(_6235)), level(0.0)).x;
    float3 _6246 = float3(_1896, _1898, _1900);
    float _1918 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6246, float3(0.0), isnan(_6246)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6246, float3(0.0), isnan(_6246)), level(0.0)).x;
    float3 _6257 = float3(_1896, _1898, _1900);
    float4 _1921 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6257, float3(0.0), isnan(_6257)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6257, float3(0.0), isnan(_6257)), level(0.0)).xyzw;
    float _1923 = _1921.x;
    float _1925 = _1921.y;
    float _1927 = _1921.z;
    float _1929 = _1921.w;
    float2 _6273 = float2(_1912, _1914);
    float3 _1933 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6273, float2(0.0), isnan(_6273)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6273, float2(0.0), isnan(_6273)), level(0.0)).xyz;
    float _1935 = _1933.x;
    float _1937 = _1933.y;
    float _1939 = _1933.z;
    float _1941 = float(uint(_610));
    float _1943 = trunc(_742);
    int _1945 = int(_1943);
    bool _1947 = _610 == 0;
    float _1949 = _536 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1951 = abs(_806);
    out.m_65.x = _1140;
    out.m_65.y = _1132;
    out.m_65.z = _1120;
    int _1953 = ~_610;
    int _1955 = _1953 + 1;
    float _1957 = _1949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1959 = _570 > 0.5;
    float _1961 = 1.0 / _1941;
    float _1963 = in.m_67.y;
    int _1965 = ~_610;
    int _1967 = _1965 + 1;
    float _1969 = _1824 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_69.w = _934;
    float _1971 = float(uint(_1945));
    float _1973 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1975 = float(_112);
    float _1977 = exp2(_1969);
    float _1979 = float(_1945);
    float _1981 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1973);
    float _1983 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_71.x = _1016;
    int _1985 = as_type<int>(_1961) + (-2);
    float _1987 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1981);
    bool _1989 = _1979 >= _700;
    bool _1991 = isnan(_1979);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan(_700);
    bool _1997 = _1993 || _1995;
    float _1999 = float(_1997);
    float _2001 = 1.0 / _1975;
    out.m_73.x = _1460;
    out.m_73.y = _1458;
    out.m_73.z = _1462;
    float _2003 = as_type<float>(_1985) * _1971;
    float _2005 = -_1963;
    float _2007 = _2005 + 1.0;
    float _2009 = trunc(_2003);
    float _2011 = precise::max(_2009, 0.0);
    uint _2014 = uint(_2011);
    float _2016 = -_1977;
    float _2018 = _2016 + 1.0;
    float _2020 = trunc(_1999);
    int _2022 = int(_2020);
    int _2024 = ~_610;
    int _2026 = _2024 + 1;
    int _2028 = _1955 * int(_2014);
    int _2030 = _2028 + _1945;
    float _2032 = float(uint(_2030));
    int _2034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2036 = _2034 != 0;
    float _2038 = as_type<float>(_1985) * _2032;
    float _2040 = trunc(_2038);
    float _2042 = precise::max(_2040, 0.0);
    uint _2044 = uint(_2042);
    bool _2046 = !_2036;
    float _2048 = _2046 ? 7.345489978790283203125 : 1.0;
    float _2050 = _2048 * _568;
    float _2052 = _720 * _2001;
    float _2054 = floor(_2050);
    int _2056 = ~_2022;
    int _2058 = _2056 + 1;
    int _2060 = _2058 + 1;
    int _2062 = int(_2014) + int(_2044);
    float _2064 = trunc(_2052);
    int _2066 = int(_2064);
    int _2068 = _2026 * _2062;
    int _2070 = _2068 + _1945;
    float _2072 = -_2054;
    float _2074 = _2050 + _2072;
    bool _2076 = uint(_2070) >= uint(_610);
    float _2078 = _2074 * _700;
    bool _2080 = !_2076;
    int _2082 = _2080 ? 0 : (-1);
    int _2084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2086 = _2084 != 0;
    float _2088 = trunc(_2078);
    int _2090 = int(_2088);
    int _2092 = ~_2062;
    int _2094 = _2092 + _2082;
    int _2096 = _2094 + 1;
    int _2098 = _610 + (-1);
    int _2100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2102 = _2100 != 0;
    int _2104 = _610 * _2096;
    int _2106 = _2104 + _1945;
    int _2108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2110 = _2108 != 0;
    bool _2112 = !_1947;
    int _2114 = _2112 ? _2106 : (-1);
    bool _2116 = !_2086;
    int _2118 = _2116 ? 0 : 1;
    int _2120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2122 = _2120 != 0;
    int _2124 = _2114 * _2060;
    int _2126 = abs(_2118);
    int _2128 = abs(_824);
    int _2130 = _2022 * _2098;
    int _2132 = _2130 + _2124;
    int _2134 = abs(_816);
    bool _2136 = !_2122;
    int _2138 = _2136 ? 0 : 1;
    int _2140 = _2132 * _1951;
    int _2142 = _2090 * _2126;
    int _2144 = _2142 + _1945;
    int _2146 = abs(_2138);
    int _2148 = _2066 * _2134;
    int _2150 = _2148 + _2140;
    float _2152 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2154 = _2152 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2156 = float(uint(_2144));
    float _2158 = _1963;
    float _2160 = _1826;
    float _2162 = _1882;
    float _2164 = _1874;
    if (_2102)
    {
        float _2166 = _1959 ? _2007 : _1963;
        _2158 = _2166;
    }
    float _2168 = _2158;
    int _2170 = _2144 * _2128;
    int _2172 = _2170 + _2150;
    int _2174 = ~_610;
    int _2176 = _2174 + 1;
    float _2178 = as_type<float>(_1985) * _2156;
    int _2180 = _2090 * _2146;
    int _2182 = _2180 + _2172;
    float _2184 = trunc(_2178);
    float _2186 = precise::max(_2184, 0.0);
    uint _2188 = uint(_2186);
    float _2190 = float(uint(_2182));
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2194 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2192;
    float _2196 = as_type<float>(_1985) * _2190;
    float _2198 = trunc(_2196);
    float _2200 = precise::max(_2198, 0.0);
    uint _2202 = uint(_2200);
    int _2204 = ~_610;
    int _2206 = _2204 + 1;
    int _2208 = _2176 * int(_2202);
    int _2210 = _2208 + _2182;
    float _2212 = float(uint(_2210));
    int _2214 = ~_610;
    int _2216 = _2214 + 1;
    float _2218 = as_type<float>(_1985) * _2212;
    float _2220 = trunc(_2218);
    float _2222 = precise::max(_2220, 0.0);
    uint _2224 = uint(_2222);
    int _2226 = int(_2202) + int(_2224);
    int _2228 = _2216 * int(_2188);
    int _2230 = _2228 + _2144;
    float _2232 = 1.0 / _2154;
    int _2234 = _2206 * _2226;
    int _2236 = _2234 + _2182;
    float _2238 = float(uint(_2230));
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2242 = _2240 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2244 = uint(_2236) >= uint(_610);
    float _2246 = as_type<float>(_1985) * _2238;
    bool _2248 = !_2244;
    int _2250 = _2248 ? 0 : (-1);
    float _2252 = trunc(_2246);
    float _2254 = precise::max(_2252, 0.0);
    uint _2256 = uint(_2254);
    int _2258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2260 = _2258 != 0;
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    int _2262 = ~_2226;
    int _2264 = _2262 + _2250;
    int _2266 = _2264 + 1;
    float _2268 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2270 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2268;
    bool _2272 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2274 = isnan(_566);
    bool _2276 = _2272 || _2274;
    bool _2278 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2280 = _2276 || _2278;
    float _2282 = float(_2280);
    int _2284 = _610 * _2266;
    int _2286 = _2284 + _2182;
    float _2288 = _2270 * _2232;
    float _2290 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2292 = _566 + _2290;
    float _2294 = -_2282;
    float _2296 = _2294 + 1.0;
    bool _2298 = !_1947;
    int _2300 = _2298 ? _2286 : (-1);
    float _2302 = fma(_2288, _2292, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2304 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2306 = isnan(_566);
    bool _2308 = _2304 || _2306;
    bool _2310 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2312 = _2308 || _2310;
    float _2314 = float(_2312);
    float _2316 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2318 = _2316 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2320 = _2300 >> 31;
    int _2322 = int(_2188) + int(_2256);
    float _2324 = -_2314;
    float _2326 = _2324 + 1.0;
    int _2328 = _2320 & 3;
    float _2330 = 1.0 / _2318;
    bool _2332 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2334 = isnan(_566);
    bool _2336 = _2332 || _2334;
    bool _2338 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2340 = _2336 || _2338;
    float _2342 = float(_2340);
    int _2344 = _1967 * _2322;
    int _2346 = _2344 + _2144;
    int _2348 = _2300 + _2328;
    float _2350 = _2342 * _2326;
    int _2352 = _2348 >> 2;
    float _2354 = -_2342;
    float _2356 = _2354 + 1.0;
    bool _2358 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2360 = isnan(_566);
    bool _2362 = _2358 || _2360;
    bool _2364 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2366 = _2362 || _2364;
    float _2368 = float(_2366);
    float _2370 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2372 = _2370 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2374 = _2352 << 4;
    int _2376 = _2374 + 368;
    float _2378 = _2282 * _2356;
    bool _2380 = uint(_2346) >= uint(_610);
    float _2382 = _2368 * _2296;
    uint _2384 = uint(int(uint(_2376) >> uint(2)));
    uint _2386 = uint(int(uint(int(_2384)) >> uint(2)));
    int _2388 = int(_2384) & 3;
    float _2390 = (*spvDescriptorSet0.vp_c9)._m0[int(_2386)][_2388];
    int _2392 = int(_2384) + 1;
    uint _2394 = uint(int(uint(_2392) >> uint(2)));
    int _2396 = _2392 & 3;
    float _2398 = (*spvDescriptorSet0.vp_c9)._m0[int(_2394)][_2396];
    float _2400 = 1.0 / _2372;
    bool _2402 = !_2380;
    int _2404 = _2402 ? 0 : (-1);
    float _2406 = _2302 * _2382;
    int _2408 = _2300 & 3;
    bool _2410 = _2408 != 0;
    float _2412 = _2242 * _2330;
    int _2414 = _2300 & 3;
    bool _2416 = _2414 != 0;
    int _2418 = _2376 + 8;
    uint _2420 = uint(int(uint(_2418) >> uint(2)));
    uint _2422 = uint(int(uint(int(_2420)) >> uint(2)));
    int _2424 = int(_2420) & 3;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[int(_2422)][_2424];
    int _2428 = int(_2420) + 1;
    uint _2430 = uint(int(uint(_2428) >> uint(2)));
    int _2432 = _2428 & 3;
    float _2434 = (*spvDescriptorSet0.vp_c9)._m0[int(_2430)][_2432];
    bool _2436 = uint(_2408) > 1u;
    int _2438 = ~_2322;
    int _2440 = _2438 + _2404;
    int _2442 = _2440 + 1;
    int _2444 = _2416 ? 0 : 1;
    bool _2446 = _2408 != 3;
    int _2448 = _610 * _2442;
    int _2450 = _2448 + _2144;
    float _2452 = _2194 * _2400;
    float _2454 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2456 = _566 + _2454;
    float _2458 = -_2368;
    float _2460 = _2458 + 1.0;
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2464 = _566 + _2462;
    bool _2466 = uint(_2408) >= 2u;
    float _2468 = fma(_2412, _2456, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2470 = fma(_2460, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2406);
    float _2472 = fma(_2452, _2464, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2474 = ~_2444;
    int _2476 = _2474 + 1;
    int _2478 = _2476 + 1;
    float _2480 = _2456;
    int _2482 = _2478;
    if (_2110)
    {
        float _2484 = in.m_55.x;
        _2480 = _2484;
    }
    float _2486 = _2480;
    int _2488 = _2466 ? 0 : 1;
    float _2490 = fma(_2468, _2378, _2470);
    if (!_2436)
    {
        int _2492 = ~_2444;
        int _2494 = _2492 + 1;
        _2482 = _2494;
    }
    int _2496 = _2482;
    bool _2498 = !_2410;
    int _2500 = _2498 ? 0 : 1;
    float _2502 = fma(_2472, _2350, _2490);
    int _2504 = ~_2488;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    float _2510 = in.m_67.x;
    int _2512 = abs(_2496);
    float _2514 = -_1916;
    float _2516 = _2514 + 1.0;
    int _2518 = _2508;
    float _2520 = _2510;
    if (_2446)
    {
        int _2522 = ~_2488;
        int _2524 = _2522 + 1;
        _2518 = _2524;
    }
    int _2526 = _2518;
    bool _2528 = _2408 != 3;
    int _2530 = abs(_2500);
    int _2532 = abs(_2526);
    float _2534 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2536 = int(_2534);
    int _2538 = ~_2512;
    int _2540 = _2538 + 1;
    int _2542 = _2540 + 1;
    bool _2544 = !_2528;
    int _2546 = _2544 ? 0 : (-1);
    int _2548 = ~_2530;
    int _2550 = _2548 + 1;
    int _2552 = _2550 + 1;
    int _2554 = _2542 * as_type<int>(_2398);
    int _2556 = abs(_2546);
    int _2558 = ~_2532;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    int _2564 = _2552 * as_type<int>(_2390);
    int _2566 = _2564 + _2554;
    bool _2568 = !_2260;
    int _2570 = _2568 ? 0 : 1;
    float _2572 = in.m_77.x;
    float _2574 = in.m_77.y;
    float _2576 = in.m_77.z;
    int _2578 = ~_2556;
    int _2580 = _2578 + 1;
    int _2582 = _2580 + 1;
    int _2584 = _2562 * as_type<int>(_2426);
    int _2586 = _2584 + _2566;
    bool _2588 = _998 != 0.0;
    bool _2590 = isnan(_998);
    bool _2592 = _2588 || _2590;
    bool _2594 = isnan(0.0);
    bool _2596 = _2592 || _2594;
    int _2598 = abs(_2570);
    int _2600 = _2582 * as_type<int>(_2434);
    int _2602 = _2600 + _2586;
    float _2604 = float(uint(_2536));
    bool _2606 = _996 == 0.0;
    bool _2608 = !_2596;
    bool _2610 = _2606 && _2608;
    float _2612 = 1.0 / _2604;
    int _2614 = abs(_2536);
    bool _2616 = _1000 == 0.0;
    bool _2618 = _2616 && _2610;
    int _2620 = ~_2598;
    int _2622 = _2620 + 1;
    int _2624 = _2622 + 1;
    bool _2626 = !_1947;
    int _2628 = _2626 ? _2450 : (-1);
    float _2630 = fma(_2314, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2502);
    float _2632 = float(uint(_2614));
    int _2634 = _2602 * _2624;
    bool _2636 = _2486 > 0.5;
    bool _2638 = _2636 && _2110;
    float _2640 = 1.0 / _2632;
    int _2642 = _2628 * _2598;
    int _2644 = _2642 + _2634;
    float _2646 = _534 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2648 = _2572;
    float _2650 = _2574;
    float _2652 = _2576;
    float _2654 = as_type<float>(_2624);
    if (!_2618)
    {
        float _2656 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2572);
        _2648 = _2656;
    }
    float _2658 = _2648;
    int _2660 = as_type<int>(_2612) + (-2);
    float _2662 = _528 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2664 = float(uint(_2644));
    if (!_2618)
    {
        float _2666 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2574);
        _2650 = _2666;
    }
    float _2668 = _2650;
    int _2670 = abs(_2644);
    float _2672 = _2662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2674 = _2646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2676 = as_type<float>(_2660) * _2664;
    float _2678 = _2630 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (!_2618)
    {
        float _2680 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2576);
        _2652 = _2680;
    }
    float _2682 = _2652;
    float _2684 = trunc(_2676);
    float _2686 = precise::max(_2684, 0.0);
    uint _2688 = uint(_2686);
    int _2690 = as_type<int>(_2640) + (-2);
    float _2692 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2694 = float(uint(_2670));
    out.m_79.x = _2672;
    out.m_79.y = _2674;
    out.m_79.z = _1957;
    out.m_79.w = _2678;
    int _2696 = ~_2536;
    int _2698 = _2696 + 1;
    int _2700 = ~_2614;
    int _2702 = _2700 + 1;
    float _2704 = as_type<float>(_2690) * _2694;
    float _2706 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2708 = _1040 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_2110)
    {
        _2654 = _2510;
    }
    float _2710 = _2654;
    float _2712 = trunc(_2704);
    float _2714 = precise::max(_2712, 0.0);
    uint _2716 = uint(_2714);
    float _2718 = _2710;
    if (_2638)
    {
        float _2720 = -_2710;
        float _2722 = _2720 + 1.0;
        _2718 = _2722;
    }
    float _2724 = _2718;
    float _2726 = -_1032;
    float _2728 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2692);
    int _2730 = _2698 * int(_2688);
    int _2732 = _2730 + _2644;
    float _2734 = -_1032;
    float _2736 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2706);
    float _2738 = -_1032;
    float _2740 = fma(_2738, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2708);
    float _2742 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2728);
    float _2744 = float(uint(_2732));
    float _2746 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2736);
    float _2748 = abs(_1468);
    float _2750 = log2(_2748);
    float _2752 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2754 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2756 = as_type<float>(_2660) * _2744;
    int _2758 = _2702 * int(_2716);
    int _2760 = _2758 + _2670;
    float _2762 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2740);
    float _2764 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2752);
    float _2766 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2754);
    float _2768 = trunc(_2756);
    float _2770 = precise::max(_2768, 0.0);
    uint _2772 = uint(_2770);
    float _2774 = float(uint(_2760));
    float _2776 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2778 = _2742 * _2668;
    float _2780 = _2746 * _2668;
    float _2782 = _2762 * _2668;
    float _2784 = as_type<float>(_2690) * _2774;
    float _2786 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2776);
    float _2788 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2790 = ~_2536;
    int _2792 = _2790 + 1;
    float _2794 = trunc(_2784);
    float _2796 = precise::max(_2794, 0.0);
    uint _2798 = uint(_2796);
    int _2800 = ~_2614;
    int _2802 = _2800 + 1;
    float _2804 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2764);
    float _2806 = fma(_1987, _2658, _2778);
    float _2808 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2766);
    int _2810 = int(_2688) + int(_2772);
    float _2812 = fma(_2804, _2658, _2780);
    float _2814 = exp2(_2788);
    if (_2110)
    {
        _2520 = _2724;
    }
    float _2816 = _2520;
    float _2818 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2820 = _2792 * _2810;
    int _2822 = _2820 + _2644;
    float _2824 = fma(_2808, _2658, _2782);
    float _2826 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2786);
    float _2828 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2818);
    bool _2830 = _1468 <= 8000.0;
    bool _2832 = isnan(_1468);
    bool _2834 = _2830 || _2832;
    bool _2836 = isnan(8000.0);
    bool _2838 = _2834 || _2836;
    float _2840 = float(_2838);
    float _2842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2844 = int(_2716) + int(_2798);
    float _2846 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1983);
    float _2848 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2828);
    bool _2850 = uint(_2822) >= uint(_2536);
    float _2852 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2846);
    int _2854 = _2802 * _2844;
    int _2856 = _2854 + _2670;
    bool _2858 = !_2850;
    int _2860 = _2858 ? 0 : (-1);
    float _2862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2864 = fma(_2814, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2866 = precise::clamp(_2864, 0.0, 1.0);
    float _2868 = fma(_2848, _2682, _2812);
    int _2870 = ~_2810;
    int _2872 = _2870 + _2860;
    int _2874 = _2872 + 1;
    bool _2876 = uint(_2856) >= uint(_2614);
    float _2878 = fma(_2866, -2.0, 3.0);
    int _2880 = _2644 ^ _2536;
    int _2882 = _2536 * _2874;
    int _2884 = _2882 + _2644;
    bool _2886 = _2536 == 0;
    float _2888 = _2866 * _2866;
    bool _2890 = !_2876;
    int _2892 = _2890 ? 0 : (-1);
    uint _2894 = uint(int(uint(_2880) >> uint(31)));
    float _2896 = _2888 * _2878;
    bool _2898 = !_2886;
    int _2900 = _2898 ? _2884 : (-1);
    float _2902 = _2862 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2904 = ~_2892;
    int _2906 = _2844 + _2904;
    int _2908 = _2906 + 1;
    float _2910 = fma(_2826, _2682, _2806);
    int _2912 = ~int(_2894);
    int _2914 = _2912 + 1;
    float _2916 = -_2896;
    float _2918 = _2916 + 1.0;
    float _2920 = float(_2900);
    float _2922 = _2842 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2924 = _2908 ^ _2914;
    float _2926 = _1792 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2928 = fma(_2902, _2816, -0.5);
    float _2930 = fma(_2902, _2920, _738);
    bool _2932 = _2536 == 0;
    float _2934 = fma(_2922, _2168, -0.5);
    int _2936 = ~_2914;
    int _2938 = _2936 + _2924;
    int _2940 = _2938 + 1;
    float _2942 = fma(_2918, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2896);
    float _2944 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2926);
    float _2946 = in.m_81.x;
    bool _2948 = !_2932;
    int _2950 = _2948 ? _2940 : (-1);
    float _2952 = _2840 * _2942;
    float _2954 = _1826 * 0.5;
    float _2956 = float(_2950);
    float _2958 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2960 = fma(_744, _2928, _2930);
    float _2962 = fma(_1882, -0.5, _2954);
    float _2964 = fma(_2852, _2682, _2824);
    float _2966 = -_752;
    float _2968 = fma(_2922, _2956, _2966);
    float _2970 = _2516 * _2958;
    float _2972 = precise::clamp(_2970, 0.0, 1.0);
    float _2974 = _2960 + 0.5;
    float _2976 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2944);
    float _2978 = fma(_740, _2934, _2968);
    float _2980 = _2018 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2982 = -_2972;
    float _2984 = fma(_2982, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.x = _2910;
    out.m_83.y = _2868;
    out.m_83.z = _2964;
    float _2986 = _2978 + 0.5;
    float _2988 = _2980 * _1918;
    float _2990 = -_2980;
    float _2992 = _2990 + 1.0;
    float _2994 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2976);
    bool _2996 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2998 = isnan(_1616);
    bool _3000 = _2996 || _2998;
    bool _3002 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3004 = _3000 || _3002;
    float _3006 = _1929 * _2988;
    float _3008 = _2984 * _2946;
    float _3010 = _1939 * _2988;
    out.m_85.x = _2974;
    out.m_85.y = _2986;
    float _3012 = _1929 * _2992;
    float _3014 = _3008 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3016 = fma(_1929, _3010, _1927);
    float _3018 = _2994 + _1826;
    float _3020 = _1874 + _1826;
    out.m_87.x = _3014;
    float _3022 = _3018 * 0.5;
    float _3024 = _3020 * 0.5;
    float _3026 = fma(_1935, _3006, _1923);
    float _3028 = fma(_1937, _3006, _1925);
    float _3030 = _1524 * _1584;
    out.gl_Position.x = _1874;
    out.gl_Position.y = _1882;
    out.gl_Position.z = _2994;
    out.gl_Position.w = _1826;
    out.m_89.x = _3026;
    out.m_89.y = _3028;
    out.m_89.z = _3016;
    out.m_89.w = _3012;
    out.m_91.x = _3024;
    out.m_91.y = _2962;
    out.m_91.z = _3022;
    out.m_91.w = _1826;
    float _3032 = _2994;
    float _3034 = _3024;
    float _3036 = _3030;
    if (!_3004)
    {
        _2160 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3038 = _2160;
    float _3040 = _3038;
    float _3042 = _3038;
    if (!_3004)
    {
        _3032 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3044 = _3032;
    float _3046 = _3044;
    float _3048 = _3044;
    if (!_3004)
    {
        _2162 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3050 = _2162;
    float _3052 = _3050;
    float _3054 = _3050;
    if (!_3004)
    {
        _2164 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3056 = _2164;
    float _3058 = _3030 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3060 = _3056;
    float _3062 = _3056;
    if (!_3004)
    {
        _3034 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3064 = _3034;
    float _3066 = _3064;
    float _3068 = _3064;
    if (!_3004)
    {
        _3036 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3070 = _3036;
    bool _3072 = !_3004;
    float _3074 = _3070;
    float _3076 = _3070;
    if (!_3072)
    {
        bool _3078 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3080 = isnan(_1616);
        bool _3082 = _3078 || _3080;
        bool _3084 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3086 = _3082 || _3084;
        if (!_3086)
        {
            float _3088 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3090 = _1616 + _3088;
            float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3094 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3092;
            float _3096 = 1.0 / _3094;
            float _3098 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3100 = _3098 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3102 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3104 = _3102 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3106 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3108 = _3106 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3110 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3112 = _3110 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3114 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3116 = _3114 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3118 = _3090 * _3096;
            float _3120 = precise::clamp(_3118, 0.0, 1.0);
            float _3122 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3124 = _3122 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3126 = fma(_3120, _3100, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3128 = fma(_3120, _3124, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3130 = fma(_3120, _3104, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3132 = fma(_3120, _3108, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3134 = fma(_3120, _3112, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3136 = fma(_3120, _3116, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3042 = _3128;
            _3062 = _3134;
            _3068 = _3126;
            _3054 = _3132;
            _3048 = _3130;
            _3076 = _3136;
            _3138 = true;
        }
        else
        {
            bool _3140 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3142 = isnan(_1616);
            bool _3144 = _3140 || _3142;
            bool _3146 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3148 = _3144 || _3146;
            if (!_3148)
            {
                _3066 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3150 = _3066;
            _3068 = _3150;
            if (!_3148)
            {
                _3040 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3152 = _3040;
            _3042 = _3152;
            if (!_3148)
            {
                _3046 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3154 = _3046;
            _3048 = _3154;
            if (!_3148)
            {
                _3052 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3156 = _3052;
            _3054 = _3156;
            if (!_3148)
            {
                _3060 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3158 = _3060;
            _3062 = _3158;
            if (!_3148)
            {
                _3074 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3160 = _3074;
            bool _3162 = !_3148;
            _3076 = _3160;
            if (!_3162)
            {
                bool _3164 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3166 = isnan(_1616);
                bool _3168 = _3164 || _3166;
                bool _3170 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3172 = _3168 || _3170;
                if (!_3172)
                {
                    float _3174 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3176 = _1616 + _3174;
                    float _3178 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3180 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3178;
                    float _3182 = 1.0 / _3180;
                    float _3184 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3186 = _3184 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3188 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3190 = _3188 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3192 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3194 = _3192 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3196 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3198 = _3196 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3200 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3202 = _3200 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3204 = _3176 * _3182;
                    float _3206 = precise::clamp(_3204, 0.0, 1.0);
                    float _3208 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3210 = _3208 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3212 = fma(_3206, _3186, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3214 = fma(_3206, _3210, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3216 = fma(_3206, _3190, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3218 = fma(_3206, _3194, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3220 = fma(_3206, _3198, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3222 = fma(_3206, _3202, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3042 = _3214;
                    _3062 = _3220;
                    _3068 = _3212;
                    _3054 = _3218;
                    _3048 = _3216;
                    _3076 = _3222;
                    _3138 = true;
                }
                else
                {
                    _3042 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3062 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3068 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3054 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3048 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3076 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3138 = false;
    float _3224 = _3042;
    float _3226 = _3062;
    float _3228 = _3068;
    float _3230 = _3054;
    float _3232 = _3048;
    float _3234 = _3076;
    float _3236 = _3058 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3238 = fma(_2868, -0.5, 0.5);
    float _3240 = precise::clamp(_3238, 0.0, 1.0);
    float _3242 = -_3224;
    float _3244 = _3242 + _3226;
    float _3246 = -_3228;
    float _3248 = _3246 + _3230;
    out.m_49.x = _3236;
    float _3250 = fma(_3240, _3244, _3224);
    float _3252 = -_3232;
    float _3254 = _3252 + _3234;
    float _3256 = fma(_3240, _3248, _3228);
    float _3258 = _3250 * 0.586610972881317138671875;
    bool _3260 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3262 = fma(_3240, _3254, _3232);
    out.m_93.x = 0.0;
    float _3264 = fma(_3256, 0.298911988735198974609375, _3258);
    bool _3266 = _1524 > 0.0;
    bool _3268 = isnan(_1524);
    bool _3270 = _3266 || _3268;
    bool _3272 = isnan(0.0);
    bool _3274 = _3270 || _3272;
    float _3276 = fma(_3262, 0.114477999508380889892578125, _3264);
    bool _3278 = _1584 <= 0.0;
    bool _3280 = !_3274;
    bool _3282 = _3278 || _3280;
    float _3284 = -_3276;
    float _3286 = _3256 + _3284;
    float _3288 = -_3276;
    float _3290 = _3250 + _3288;
    float _3292 = -_3276;
    float _3294 = _3262 + _3292;
    float _3296 = fma(_3286, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3276);
    float _3298 = fma(_3290, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3276);
    float _3300 = fma(_3294, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3276);
    bool _3302 = !_3260;
    if (!_3302)
    {
        float _3304 = -_1458;
        float _3306 = _3304 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3308 = -_1460;
        float _3310 = _3308 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3312 = -_1462;
        float _3314 = _3312 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3316 = _3306 * _3306;
        float _3318 = fma(_3310, _3310, _3316);
        float _3320 = fma(_3314, _3314, _3318);
        float _3322 = sqrt(_3320);
        float _3324 = rsqrt(_3320);
        float _3326 = -_3322;
        float _3328 = _3326 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3330 = _3328 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3332 = precise::clamp(_3330, 0.0, 1.0);
        float _3334 = _3310 * _3324;
        float _3336 = _3306 * _3324;
        float _3338 = abs(_3332);
        float _3340 = log2(_3338);
        float _3342 = _3314 * _3324;
        float _3344 = _3334 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3346 = _2868 * _3336;
        float _3348 = -_3336;
        float _3350 = -_3344;
        float _3352 = fma(_3348, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3350);
        float _3354 = fma(_2910, _3334, _3346);
        float _3356 = -_3342;
        float _3358 = fma(_3356, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3352);
        float _3360 = fma(_2964, _3342, _3354);
        float _3362 = precise::clamp(_3360, 0.0, 1.0);
        float _3364 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3366 = _3358 + _3364;
        float _3368 = _3340 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3370 = _3366 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3372 = precise::clamp(_3370, 0.0, 1.0);
        float _3374 = exp2(_3368);
        float _3376 = _3374 * _3372;
        float _3378 = _3362 * _3376;
        float _3380 = _3378 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3382 = _3378 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3384 = _3378 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3380;
        out.m_93.y = _3382;
        out.m_93.z = _3384;
    }
    out.m_69.x = _3296;
    out.m_69.y = _3298;
    out.m_69.z = _3300;
    if (!_3282)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3386 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3386;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

