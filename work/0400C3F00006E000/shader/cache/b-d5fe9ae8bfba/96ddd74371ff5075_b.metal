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
    float4 m_91 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_69 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_83 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_77 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_73 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3012 = false;
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
        float _3317 = as_type<float>(_128);
        out.gl_Position.z = _3317;
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
        float _3387 = as_type<float>(_166);
        out.gl_Position.z = _3387;
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
    bool _390 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
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
        float _428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _430 = _426 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
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
    float _454 = in.m_55.x;
    float _456 = in.m_55.y;
    float _458 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _460 = log2(_458);
    float _462 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _464 = in.m_46.x;
    float _466 = in.m_46.y;
    float _468 = in.m_46.z;
    float _470 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _472 = in.m_55.z;
    float _474 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _476 = int(_474);
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _480 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _482 = isnan(0.0);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _488 = _484 || _486;
    float _490 = _462 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _492 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _494 = _460 * _146;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _498 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _500 = int(_498);
    float _502 = _454 * 2.0;
    float _504 = _454 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _506 = _456 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _508 = exp2(_494);
    float _510 = _456 * 2.0;
    float _512 = -_496;
    float _514 = fma(_504, 2.0, _512);
    float _516 = fma(_506, -2.0, _478);
    float _518 = _466 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _520 = _466 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _522 = _466 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _524 = _456 + _454;
    float _526 = floor(_502);
    float _528 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[4].x, _518);
    float _530 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[5].x, _520);
    float _532 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[6].x, _522);
    float _534 = _524 + (-1.0);
    float _536 = _456 + _472;
    float _538 = _472 * 2.0;
    float _540 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _542 = _536 + (-1.0);
    float _544 = floor(_538);
    float _546 = float(_476);
    float _548 = -_508;
    float _550 = _548 + 1.0;
    bool _552 = _526 > 0.0;
    bool _554 = _526 >= 0.0;
    bool _556 = isnan(_526);
    bool _558 = _554 || _556;
    bool _560 = isnan(0.0);
    bool _562 = _558 || _560;
    float _564 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _568 = 1.0 + _566;
    float _570 = floor(_510);
    bool _572 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _574 = isnan(1.0);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _580 = _576 || _578;
    float _582 = _488 ? _550 : 0.0;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _588 = 1.0 / _546;
    bool _590 = _544 > 0.0;
    bool _592 = _544 >= 0.0;
    bool _594 = isnan(_544);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    float _602 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[78].z, _584);
    float _604 = float(_500);
    float _606 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[78].w, _586);
    int _608 = _562 ? 0 : 1;
    float _610 = 1.0 / _568;
    bool _612 = _570 > 0.0;
    float _614 = _604 * _146;
    bool _616 = _570 >= 0.0;
    bool _618 = isnan(_570);
    bool _620 = _616 || _618;
    bool _622 = isnan(0.0);
    bool _624 = _620 || _622;
    float _626 = -_146;
    float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[76].x, _514);
    float _630 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _602);
    float _632 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _606);
    int _634 = _624 ? 0 : 1;
    float _636 = _588 * _146;
    int _638 = ~_608;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    float _644 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _516);
    int _646 = _642;
    if (!_552)
    {
        int _648 = ~_608;
        int _650 = _648 + 1;
        _646 = _650;
    }
    int _652 = _646;
    float _654 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[5].z, _530);
    float _656 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
    float _658 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[6].z, _532);
    int _660 = ~_634;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    int _666 = _664;
    if (_580)
    {
        float _668 = _582 * _610;
        _148 = _668;
    }
    float _670 = _148;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _674 = _672 != 0;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _682 = _680 != 0;
    float _684 = _654 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (!_612)
    {
        int _686 = ~_634;
        int _688 = _686 + 1;
        _666 = _688;
    }
    int _690 = _666;
    float _692 = _656 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _694 = in.m_61.x;
    float _696 = in.m_61.y;
    float _698 = in.m_61.z;
    bool _700 = !_678;
    int _702 = _700 ? 0 : 1;
    float _704 = _658 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _706 = !_674;
    int _708 = _706 ? 0 : 1;
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _712 = _692 + _710;
    bool _714 = !_682;
    int _716 = _714 ? 0 : 1;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _720 = _718 != 0;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _724 = _722 != 0;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _728 = _726 != 0;
    float _730 = float(_652);
    int _732 = _600 ? 0 : 1;
    bool _734 = !_720;
    int _736 = _734 ? 0 : 1;
    bool _738 = !_724;
    int _740 = _738 ? 0 : 1;
    int _742 = abs(_736);
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _746 = _684 + _744;
    int _748 = abs(_740);
    int _750 = ~_732;
    int _752 = _750 + 1;
    int _754 = _752 + 1;
    float _756 = _746 * _746;
    float _758 = float(_748);
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _762 = _704 + _760;
    int _764 = _754;
    if (!_590)
    {
        int _766 = ~_732;
        int _768 = _766 + 1;
        _764 = _768;
    }
    int _770 = _764;
    float _772 = fma(_712, _712, _756);
    float _774 = _758 * _730;
    float _776 = float(_742);
    float _778 = fma(_762, _762, _772);
    float _780 = float(_770);
    float _782 = _774 * (-2.0);
    float _784 = _456 + (-0.5);
    float _786 = sqrt(_778);
    bool _788 = !_728;
    int _790 = _788 ? 0 : 1;
    float _792 = fma(_782, _696, _696);
    float _794 = fma(_564, _782, _564);
    float _796 = _776 * _780;
    int _798 = abs(_790);
    float _800 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[196].y, _792);
    float _802 = _472 + _454;
    float _804 = rsqrt(_778);
    float _806 = float(_690);
    float _808 = _796 * (-2.0);
    float _810 = float(_798);
    float _812 = _802 + (-1.0);
    float _814 = _472 + (-0.5);
    float _816 = fma(_808, _694, _694);
    float _818 = fma(_540, _808, _540);
    float _820 = _786 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _822 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _824 = _810 * _806;
    float _826 = _454 + (-0.5);
    float _828 = fma(_794, _670, _800);
    float _830 = precise::min(_490, _820);
    float _832 = _824 * (-2.0);
    float _834 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[196].x, _816);
    float _836 = _828 * 0.15915493667125701904296875;
    float _838 = _804 * _830;
    float _840 = fma(_822, _832, _822);
    float _842 = fma(_832, _698, _698);
    float _844 = fma(_818, _670, _834);
    float _846 = _746 * _838;
    float _848 = _762 * _838;
    float _850 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[196].z, _842);
    float _852 = _712 * _838;
    float _854 = -_846;
    float _856 = _746 + _854;
    float _858 = -_848;
    float _860 = _762 + _858;
    float _862 = fma(_840, _670, _850);
    float _864 = -_852;
    float _866 = _712 + _864;
    float _868 = _856 * _856;
    float _870 = _844 * 0.15915493667125701904296875;
    float _872 = _862 * 0.15915493667125701904296875;
    float _874 = _836 * 6.283185482025146484375;
    float _876 = sin(_874);
    float _878 = fma(_866, _866, _868);
    float _880 = in.m_63.x;
    float _882 = in.m_63.y;
    float _884 = in.m_63.z;
    float _886 = fma(_860, _860, _878);
    float _888 = _836 * 6.283185482025146484375;
    float _890 = cos(_888);
    float _892 = sqrt(_886);
    float _894 = _870 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = _870 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = _804 * _892;
    float _904 = _470 * _902;
    float _906 = _462 * _902;
    float _908 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _910 = _872 * 6.283185482025146484375;
    float _912 = cos(_910);
    float _914 = _896 * _876;
    float _916 = _896 * _890;
    float _918 = _904 * _908;
    float _920 = _492 * _902;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    float _924 = _872 * 6.283185482025146484375;
    float _926 = sin(_924);
    float _928 = _900 * _890;
    float _930 = _900 * _876;
    float _932 = _920 * _922;
    float _934 = _896 * _912;
    float _936 = _890 * _912;
    float _938 = _900 * _912;
    float _940 = _876 * _912;
    float _942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _880);
    float _944 = _938 * _918;
    float _946 = fma(_926, _928, _914);
    float _948 = _906 * _942;
    float _950 = -_916;
    float _952 = fma(_926, _930, _950);
    float _954 = -_918;
    float _956 = _926 * _954;
    float _958 = -_930;
    float _960 = fma(_926, _916, _958);
    float _962 = fma(_946, _948, _944);
    float _964 = _934 * _918;
    float _966 = fma(_936, _948, _956);
    float _968 = fma(_926, _914, _928);
    float _970 = fma(_952, _932, _962);
    float _972 = fma(_960, _948, _964);
    float _974 = fma(_940, _932, _966);
    float _976 = _970 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _978 = fma(_968, _932, _972);
    float _980 = _970 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _982 = _970 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[26].x, _976);
    float _986 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[24].x, _980);
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[26].z, _984);
    float _990 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[24].z, _986);
    float _992 = _988 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _994 = _990 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _996 = _704 + _992;
    float _998 = _692 + _994;
    float _1000 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1002 = _996 + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1006 = _998 + _1004;
    float _1008 = _1002 * _1002;
    float _1010 = fma(_1006, _1006, _1008);
    float _1012 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[25].x, _982);
    float _1014 = -_846;
    float _1016 = _684 + _1014;
    float _1018 = -_852;
    float _1020 = _692 + _1018;
    float _1022 = sqrt(_1010);
    float _1024 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1012);
    float _1026 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1028 = -_848;
    float _1030 = _704 + _1028;
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1034 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1026);
    float _1036 = _684 + _1032;
    float _1038 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1034);
    bool _1040 = _1022 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = _1032;
    float _1044 = _998;
    float _1046 = _1034;
    float _1048 = _848;
    float _1050 = _846;
    float _1052 = _852;
    float _1054 = _880;
    if (!_1040)
    {
        _1042 = _998;
    }
    float _1056 = _1042;
    float _1058 = _1056;
    if (!_1040)
    {
        _1044 = _996;
    }
    float _1060 = _1044;
    float _1062 = _1060;
    if (!_1040)
    {
        _1046 = _1036;
    }
    float _1064 = _1046;
    bool _1066 = !_1040;
    float _1068 = _1064;
    if (!_1066)
    {
        float _1070 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1072 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1074 = _1022 + _1072;
        float _1076 = rsqrt(_1010);
        float _1078 = _1074 * _1070;
        float _1080 = _1036 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1082 = _1078 * 0.15915493667125701904296875;
        float _1084 = _1082 * 6.283185482025146484375;
        float _1086 = cos(_1084);
        float _1088 = _1082 * 6.283185482025146484375;
        float _1090 = sin(_1088);
        float _1092 = _1086 + (-1.0);
        float _1094 = fma(_1090, _1080, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1096 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = _1076 * _1094;
        float _1100 = fma(_1036, _1086, _1096);
        float _1102 = fma(_1006, _1098, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1104 = fma(_1002, _1098, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1068 = _1100;
        _1058 = _1102;
        _1062 = _1104;
    }
    float _1106 = _1068;
    float _1108 = _1058;
    float _1110 = _1062;
    float _1112 = -_684;
    float _1114 = _1112 + _1106;
    float _1116 = -_692;
    float _1118 = _1116 + _1108;
    float _1120 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1122 = -_704;
    float _1124 = _1122 + _1110;
    float _1126 = _1114 * _1114;
    float _1128 = 1.0 / _1120;
    float _1130 = fma(_1118, _1118, _1126);
    float _1132 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1134 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1136 = isnan(0.5);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1142 = _1138 || _1140;
    float _1144 = fma(_1124, _1124, _1130);
    float _1146 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1132);
    bool _1148 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1150 = isnan(0.5);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1156 = _1152 || _1154;
    float _1158 = sqrt(_1144);
    float _1160 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1146);
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1164 = _1162 + _1120;
    float _1166 = -_846;
    float _1168 = _1166 + _1106;
    float _1170 = _1164 * _1128;
    float _1172 = _1170 * 0.5;
    float _1174 = -_852;
    float _1176 = _1174 + _1108;
    float _1178 = -_848;
    float _1180 = _1178 + _1110;
    bool _1182 = _1158 > 0.0;
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1186 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1184);
    float _1188 = 1.0 / _1186;
    float _1190 = _1158;
    float _1192 = _1106;
    float _1194 = _1186;
    float _1196 = _1168;
    float _1198 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1200 = _1180;
    if (!_1182)
    {
        _1048 = _1176;
    }
    float _1202 = _1048;
    float _1204 = _1202;
    if (!_1182)
    {
        _1050 = _1168;
    }
    float _1206 = _1050;
    float _1208 = _1206;
    if (!_1182)
    {
        _1190 = _1180;
    }
    float _1210 = _1190;
    bool _1212 = !_1182;
    float _1214 = _1210;
    float _1216 = _1210;
    if (!_1212)
    {
        float _1218 = _190 * _190;
        float _1220 = fma(_188, _188, _1218);
        float _1222 = fma(_192, _192, _1220);
        float _1224 = rsqrt(_1144);
        float _1226 = sqrt(_1222);
        float _1228 = _1114 * _1224;
        float _1230 = _1118 * _1224;
        float _1232 = _1124 * _1224;
        bool _1234 = _1226 > 0.0;
        float _1236 = _1226;
        float _1238 = _1224;
        _1052 = _1222;
        _1192 = _1230;
        _1194 = _1228;
        if (!_1234)
        {
            _1236 = _1176;
        }
        float _1240 = _1236;
        _1204 = _1240;
        if (!_1234)
        {
            _1238 = _1168;
        }
        float _1242 = _1238;
        _1208 = _1242;
        if (!_1234)
        {
            _1214 = _1180;
        }
        float _1244 = _1214;
        bool _1246 = !_1234;
        _1216 = _1244;
        if (!_1246)
        {
            float _1248 = rsqrt(_1222);
            float _1250 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1252 = _190 * _1248;
            float _1254 = _188 * _1248;
            float _1256 = _192 * _1248;
            float _1258 = _1228 * _1252;
            float _1260 = fma(_1230, _1254, _1258);
            float _1262 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1264 = fma(_1232, _1256, _1260);
            float _1266 = _1264 * _1262;
            float _1268 = fma(_188, _1266, _1176);
            float _1270 = fma(_190, _1266, _1168);
            float _1272 = fma(_192, _1266, _1180);
            _1204 = _1268;
            _1208 = _1270;
            _1216 = _1272;
        }
    }
    float _1274 = _1204;
    float _1276 = _1208;
    float _1278 = _1216;
    float _1280 = _1052;
    float _1282 = _1192;
    float _1284 = _1194;
    float _1286 = _1284;
    float _1288 = _1276;
    float _1290 = _1274;
    float _1292 = _1278;
    float _1294 = _1280;
    float _1296 = _1282;
    if (_1156)
    {
        _1286 = 1.0;
    }
    float _1298 = _1286;
    float _1300 = _1298;
    if (!_1142)
    {
        float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1304 = _1016 + _1302;
        float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1308 = _1020 + _1306;
        float _1310 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1312 = _1304 * _1304;
        float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1316 = _1030 + _1314;
        float _1318 = fma(_1308, _1308, _1312);
        float _1320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1322 = fma(_1316, _1316, _1318);
        float _1324 = sqrt(_1322);
        float _1326 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1328 = precise::min(_1324, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1330 = _1328 * _1320;
        float _1332 = -_1020;
        float _1334 = _1332 + _1274;
        float _1336 = _1326 * _1330;
        float _1338 = -_1016;
        float _1340 = _1338 + _1276;
        float _1342 = -_1030;
        float _1344 = _1342 + _1278;
        float _1346 = fma(_1334, _1336, _1020);
        float _1348 = fma(_1340, _1336, _1016);
        float _1350 = fma(_1344, _1336, _1030);
        _1288 = _1348;
        _1290 = _1346;
        _1292 = _1350;
    }
    float _1352 = _1288;
    float _1354 = _1290;
    float _1356 = _1292;
    if (_1156)
    {
        _1196 = 1.0;
    }
    float _1358 = _1196;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1362 = _1188 * _1360;
    float _1364 = _1358;
    if (!_1156)
    {
        float _1366 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1368 = _1366 * 0.15915493667125701904296875;
        float _1370 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1372 = _1368 * 6.283185482025146484375;
        float _1374 = cos(_1372);
        float _1376 = _1370 * 0.15915493667125701904296875;
        float _1378 = _1368 * 6.283185482025146484375;
        float _1380 = sin(_1378);
        float _1382 = 1.0 / _1374;
        float _1384 = _1376 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        float _1388 = _1380 * _1382;
        float _1390 = _1376 * 6.283185482025146484375;
        float _1392 = sin(_1390);
        float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1396 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1394;
        float _1398 = _1386 * _1388;
        float _1400 = 1.0 / _1396;
        float _1402 = 1.0 / _1398;
        float _1404 = _1392 * _1402;
        float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1408 = fma(_1362, _1404, _1406);
        float _1410 = _1408 * _1400;
        float _1412 = precise::clamp(_1410, 0.0, 1.0);
        _1294 = _1368;
        _1300 = _1412;
    }
    float _1414 = _1294;
    float _1416 = _1300;
    if (!_1156)
    {
        float _1418 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1420 = _1418 * 0.15915493667125701904296875;
        float _1422 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1424 = _1420 * 6.283185482025146484375;
        float _1426 = cos(_1424);
        float _1428 = _1422 * 0.15915493667125701904296875;
        float _1430 = _1420 * 6.283185482025146484375;
        float _1432 = sin(_1430);
        float _1434 = 1.0 / _1426;
        float _1436 = _1428 * 6.283185482025146484375;
        float _1438 = cos(_1436);
        float _1440 = _1432 * _1434;
        float _1442 = _1428 * 6.283185482025146484375;
        float _1444 = sin(_1442);
        float _1446 = _1438 * _1440;
        float _1448 = 1.0 / _1446;
        float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1452 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1450;
        float _1454 = 1.0 / _1452;
        float _1456 = _1444 * _1448;
        float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1460 = fma(_1362, _1456, _1458);
        float _1462 = _1460 * _1454;
        float _1464 = precise::clamp(_1462, 0.0, 1.0);
        float _1466 = -_1464;
        float _1468 = _1466 + 1.0;
        _1364 = _1468;
    }
    float _1470 = _1364;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1474 = _1352 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1478 = _1354 + _1476;
    float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1482 = _1356 + _1480;
    float _1484 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1486 = _1474 * _1474;
    float _1488 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1490 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1484);
    float _1492 = fma(_1478, _1478, _1486);
    float _1494 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1488);
    float _1496 = fma(_1482, _1482, _1492);
    float _1498 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1494);
    float _1500 = rsqrt(_1496);
    float _1502 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1504 = sqrt(_1496);
    float _1506 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1508 = _1478 * _1506;
    float _1510 = _1482 * _1506;
    float _1512 = _1508 * _1508;
    float _1514 = _1510 * _1510;
    float _1516 = _1512 + _1514;
    float _1518 = sqrt(_1516);
    bool _1520 = _1518 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1524 = _1518 + _1522;
    float _1526 = _1486;
    float _1528 = _1516;
    float _1530 = _1524;
    float _1532 = _1508;
    float _1534 = _1510;
    float _1536 = _1512;
    if (_1520)
    {
        float _1538 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1526 = _1538;
    }
    float _1540 = _1526;
    if (_1520)
    {
        float _1542 = rsqrt(_1516);
        _1528 = _1542;
    }
    float _1544 = _1528;
    float _1546 = _1544;
    if (_1520)
    {
        float _1548 = _1524 * _1540;
        _1530 = _1548;
    }
    float _1550 = _1530;
    if (_1520)
    {
        float _1552 = _1550 * 0.15915493667125701904296875;
        _1198 = _1552;
    }
    float _1554 = _1198;
    float _1556 = _1540;
    if (_1520)
    {
        float _1558 = _1554 * 6.283185482025146484375;
        float _1560 = sin(_1558);
        _1556 = _1560;
    }
    float _1562 = _1556;
    float _1564 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1566 = precise::max(0.0, _1564);
    float _1568 = _1414;
    if (_1520)
    {
        float _1570 = _1554 * 6.283185482025146484375;
        float _1572 = cos(_1570);
        _1568 = _1572;
    }
    float _1574 = _1568;
    float _1576 = -_1506;
    float _1578 = -_1566;
    float _1580 = fma(_1474, _1576, _1578);
    if (_1520)
    {
        float _1582 = _1580 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1200 = _1582;
    }
    float _1584 = _1200;
    float _1586 = fma(_1020, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1588 = _1562;
    float _1590 = _1584;
    if (_1520)
    {
        float _1592 = fma(_1562, _1584, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1296 = _1592;
    }
    float _1594 = _1296;
    float _1596 = _1594;
    if (!_1520)
    {
        _1588 = _1580;
    }
    float _1598 = _1588;
    float _1600 = floor(_1586);
    float _1602 = _1598;
    float _1604 = _1574;
    if (_1520)
    {
        float _1606 = _1574 + (-1.0);
        _1590 = _1606;
    }
    float _1608 = _1590;
    if (_1520)
    {
        float _1610 = _1544 * _1594;
        _1596 = _1610;
    }
    float _1612 = _1596;
    if (_1520)
    {
        float _1614 = _1608 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1546 = _1614;
    }
    float _1616 = _1546;
    if (_1520)
    {
        float _1618 = _1508 * _1612;
        _1532 = _1618;
    }
    float _1620 = _1532;
    if (_1520)
    {
        float _1622 = _1510 * _1612;
        _1534 = _1622;
    }
    float _1624 = _1534;
    if (_1520)
    {
        float _1626 = fma(_1580, _1574, _1616);
        _1602 = _1626;
    }
    float _1628 = _1602;
    if (_1520)
    {
        float _1630 = _1620 * _1620;
        _1536 = _1630;
    }
    float _1632 = _1536;
    if (!_1520)
    {
        _1604 = _1514;
    }
    float _1634 = _1604;
    float _1636 = _1634;
    if (_1520)
    {
        float _1638 = _1624 * _1624;
        _1636 = _1638;
    }
    float _1640 = _1636;
    float _1642 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1644 = fma(_1628, _1628, _1632);
    float _1646 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1642);
    float _1648 = _1644 + _1640;
    float _1650 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1652 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1654 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1646);
    float _1656 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1490);
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1660 = fma(_1504, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1658);
    float _1662 = precise::clamp(_1660, 0.0, 1.0);
    float _1664 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1652);
    float _1666 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1668 = rsqrt(_1648);
    float _1670 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1672 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1664);
    float _1674 = -_1662;
    float _1676 = _1674 + 1.0;
    float _1678 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1680 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1682 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1684 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1686 = -_1678;
    float _1688 = fma(_1686, _1650, 1.0);
    float _1690 = abs(_1676);
    float _1692 = log2(_1690);
    float _1694 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1682);
    float _1696 = fma(_1030, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1698 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1694);
    float _1700 = _1668 * _1620;
    float _1702 = _1668 * _1628;
    float _1704 = floor(_1696);
    float _1706 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1698);
    float _1708 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1710 = _1668 * _1624;
    float _1712 = -_1600;
    float _1714 = _1586 + _1712;
    float _1716 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1718 = -_1708;
    float _1720 = fma(_1702, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1718);
    float _1722 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1724 = log2(_1688);
    float _1726 = -_1710;
    float _1728 = fma(_1726, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1720);
    float _1730 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1716);
    float _1732 = fma(_1728, -0.5, 0.5);
    float _1734 = fma(_1728, 0.5, 0.5);
    float _1736 = -_1704;
    float _1738 = _1696 + _1736;
    float _1740 = 1.0 / _1706;
    float _1742 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1684);
    float _1744 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1730);
    float _1746 = fma(_1734, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1748 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1742);
    float _1750 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1744);
    float _1752 = fma(_1734, _1746, -0.212114393711090087890625);
    float _1754 = exp2(_1722);
    float _1756 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1748);
    float _1758 = _1724 * 0.693147182464599609375;
    float _1760 = fma(_1734, _1752, 1.570728778839111328125);
    float _1762 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1764 = sqrt(_1732);
    float _1766 = _1702 + 1.0;
    float _1768 = _1750 * _1740;
    float _1770 = _1756 * _1740;
    float _1772 = -_1702;
    float _1774 = fma(_1754, _1766, _1772);
    float2 _5889 = float2(_1714, _1738);
    float _1776 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5889, float2(0.0), isnan(_5889)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5889, float2(0.0), isnan(_5889)), level(0.0)).x;
    float _1778 = fma(_1774, 0.5, 0.5);
    float _1780 = _1764 * 0.636619746685028076171875;
    float _1782 = fma(_1768, 0.5, 0.5);
    float _1784 = fma(_1770, -0.5, 0.5);
    float _1786 = -_1760;
    float _1788 = fma(_1780, _1786, 1.0);
    float3 _5914 = float3(_1782, _1784, _1762);
    float _1790 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5914, float3(0.0), isnan(_5914)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5914, float3(0.0), isnan(_5914)), level(0.0)).x;
    float3 _5925 = float3(_1782, _1784, _1762);
    float4 _1793 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5925, float3(0.0), isnan(_5925)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5925, float3(0.0), isnan(_5925)), level(0.0)).xyzw;
    float _1795 = _1793.x;
    float _1797 = _1793.y;
    float _1799 = _1793.z;
    float _1801 = _1793.w;
    float2 _5941 = float2(_1788, _1778);
    float3 _1805 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5941, float2(0.0), isnan(_5941)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5941, float2(0.0), isnan(_5941)), level(0.0)).xyz;
    float _1807 = _1805.x;
    float _1809 = _1805.y;
    float _1811 = _1805.z;
    float _1813 = float(uint(_500));
    float _1815 = trunc(_636);
    int _1817 = int(_1815);
    bool _1819 = _500 == 0;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1823 = _452 + _1821;
    int _1825 = abs(_708);
    out.m_65.x = _1020;
    out.m_65.y = _1016;
    out.m_65.z = _1030;
    int _1827 = abs(_716);
    float _1829 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1831 = _456 > 0.5;
    float _1833 = 1.0 / _1813;
    out.m_67.w = _830;
    out.m_69.x = _906;
    float _1835 = float(uint(_1817));
    float _1837 = exp2(_1829);
    int _1839 = ~_500;
    int _1841 = _1839 + 1;
    out.m_71.x = _1354;
    out.m_71.y = _1352;
    out.m_71.z = _1356;
    int _1843 = ~_500;
    int _1845 = _1843 + 1;
    int _1847 = as_type<int>(_1833) + (-2);
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1851 = _1849 != 0;
    float _1853 = as_type<float>(_1847) * _1835;
    bool _1855 = !_1851;
    float _1857 = _1855 ? 7.345489978790283203125 : 1.0;
    float _1859 = -_1837;
    float _1861 = _1859 + 1.0;
    float _1863 = trunc(_1853);
    float _1865 = precise::max(_1863, 0.0);
    uint _1868 = uint(_1865);
    float _1870 = _1857 * _454;
    float _1872 = float(_112);
    float _1874 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1876 = float(_1817);
    bool _1878 = _1876 >= _604;
    bool _1880 = isnan(_1876);
    bool _1882 = _1878 || _1880;
    bool _1884 = isnan(_604);
    bool _1886 = _1882 || _1884;
    float _1888 = float(_1886);
    float _1890 = 1.0 / _1872;
    int _1892 = _1841 * int(_1868);
    int _1894 = _1892 + _1817;
    float _1896 = floor(_1870);
    float _1898 = float(uint(_1894));
    float _1900 = as_type<float>(_1847) * _1898;
    float _1902 = trunc(_1888);
    int _1904 = int(_1902);
    float _1906 = _614 * _1890;
    int _1908 = _500 + (-1);
    float _1910 = -_1896;
    float _1912 = _1870 + _1910;
    float _1914 = trunc(_1900);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    float _1920 = _1912 * _604;
    int _1922 = ~_1904;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    float _1928 = trunc(_1920);
    int _1930 = int(_1928);
    int _1932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1934 = _1932 != 0;
    int _1936 = int(_1868) + int(_1918);
    float _1938 = trunc(_1906);
    int _1940 = int(_1938);
    int _1942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1944 = _1942 != 0;
    int _1946 = _1845 * _1936;
    int _1948 = _1946 + _1817;
    bool _1950 = uint(_1948) >= uint(_500);
    bool _1952 = !_1950;
    int _1954 = _1952 ? 0 : (-1);
    int _1956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1958 = _1956 != 0;
    int _1960 = ~_1936;
    int _1962 = _1960 + _1954;
    int _1964 = _1962 + 1;
    bool _1966 = !_1958;
    int _1968 = _1966 ? 0 : 1;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1972 = _1970 != 0;
    int _1974 = _500 * _1964;
    int _1976 = _1974 + _1817;
    int _1978 = abs(_702);
    int _1980 = abs(_1968);
    bool _1982 = !_1819;
    int _1984 = _1982 ? _1976 : (-1);
    int _1986 = _1930 * _1980;
    int _1988 = _1986 + _1817;
    int _1990 = _1984 * _1926;
    float _1992 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1994 = _452 + _1992;
    float _1996 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1998 = _1996 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2000 = _1904 * _1908;
    int _2002 = _2000 + _1990;
    bool _2004 = !_1972;
    int _2006 = _2004 ? 0 : 1;
    float _2008 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2010 = _2008 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2012 = _2002 * _1978;
    int _2014 = abs(_2006);
    float _2016 = 1.0 / _1998;
    int _2018 = _1940 * _1825;
    int _2020 = _2018 + _2012;
    int _2022 = _1988 * _1827;
    int _2024 = _2022 + _2020;
    int _2026 = ~_500;
    int _2028 = _2026 + 1;
    float _2030 = 1.0 / _2010;
    int _2032 = _1930 * _2014;
    int _2034 = _2032 + _2024;
    float _2036 = float(uint(_2034));
    float _2038 = as_type<float>(_1847) * _2036;
    float _2040 = trunc(_2038);
    float _2042 = precise::max(_2040, 0.0);
    uint _2044 = uint(_2042);
    int _2046 = _2028 * int(_2044);
    int _2048 = _2046 + _2034;
    float _2050 = float(uint(_2048));
    float _2052 = as_type<float>(_1847) * _2050;
    int _2054 = ~_500;
    int _2056 = _2054 + 1;
    float _2058 = trunc(_2052);
    float _2060 = precise::max(_2058, 0.0);
    uint _2062 = uint(_2060);
    float _2064 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2066 = _2064 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2068 = float(uint(_1988));
    int _2070 = int(_2044) + int(_2062);
    float _2072 = as_type<float>(_1847) * _2068;
    float _2074 = in.m_73.y;
    float _2076 = 1.0 / _2066;
    int _2078 = _2056 * _2070;
    int _2080 = _2078 + _2034;
    bool _2082 = uint(_2080) >= uint(_500);
    float _2084 = trunc(_2072);
    float _2086 = precise::max(_2084, 0.0);
    uint _2088 = uint(_2086);
    bool _2090 = !_2082;
    int _2092 = _2090 ? 0 : (-1);
    int _2094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2096 = _2094 != 0;
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    int _2098 = ~_2070;
    int _2100 = _2098 + _2092;
    int _2102 = _2100 + 1;
    bool _2104 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2106 = isnan(_452);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2112 = _2108 || _2110;
    float _2114 = float(_2112);
    int _2116 = _500 * _2102;
    int _2118 = _2116 + _2034;
    float _2120 = -_2114;
    float _2122 = _2120 + 1.0;
    bool _2124 = !_1819;
    int _2126 = _2124 ? _2118 : (-1);
    float _2128 = -_2074;
    float _2130 = _2128 + 1.0;
    float _2132 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2132;
    float _2136 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2138 = _2136 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2140 = _2126 >> 31;
    float _2142 = _2074;
    float _2144 = _1706;
    float _2146 = _1756;
    if (_1934)
    {
        float _2148 = _1831 ? _2130 : _2074;
        _2142 = _2148;
    }
    float _2150 = _2142;
    float _2152 = _2134 * _2030;
    int _2154 = _2140 & 3;
    float _2156 = _2138 * _2076;
    int _2158 = ~_500;
    int _2160 = _2158 + 1;
    float _2162 = fma(_2152, _1994, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2164 = _2126 + _2154;
    bool _2166 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2168 = isnan(_452);
    bool _2170 = _2166 || _2168;
    bool _2172 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2174 = _2170 || _2172;
    float _2176 = float(_2174);
    int _2178 = _2160 * int(_2088);
    int _2180 = _2178 + _1988;
    int _2182 = _2164 >> 2;
    int _2184 = _2126 & 3;
    bool _2186 = _2184 != 0;
    float _2188 = -_2176;
    float _2190 = _2188 + 1.0;
    int _2192 = _2182 << 4;
    int _2194 = _2192 + 368;
    float _2196 = _2176 * _2122;
    float _2198 = float(uint(_2180));
    uint _2200 = uint(int(uint(_2194) >> uint(2)));
    uint _2202 = uint(int(uint(int(_2200)) >> uint(2)));
    int _2204 = int(_2200) & 3;
    float _2206 = (*spvDescriptorSet0.vp_c9)._m0[int(_2202)][_2204];
    int _2208 = int(_2200) + 1;
    uint _2210 = uint(int(uint(_2208) >> uint(2)));
    int _2212 = _2208 & 3;
    float _2214 = (*spvDescriptorSet0.vp_c9)._m0[int(_2210)][_2212];
    bool _2216 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2218 = isnan(_452);
    bool _2220 = _2216 || _2218;
    bool _2222 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2224 = _2220 || _2222;
    float _2226 = float(_2224);
    int _2228 = _2126 & 3;
    bool _2230 = _2228 != 0;
    float _2232 = as_type<float>(_1847) * _2198;
    float _2234 = _2226 * _2190;
    float _2236 = -_2226;
    float _2238 = _2236 + 1.0;
    bool _2240 = uint(_2228) > 1u;
    int _2242 = _2194 + 8;
    uint _2244 = uint(int(uint(_2242) >> uint(2)));
    uint _2246 = uint(int(uint(int(_2244)) >> uint(2)));
    int _2248 = int(_2244) & 3;
    float _2250 = (*spvDescriptorSet0.vp_c9)._m0[int(_2246)][_2248];
    int _2252 = int(_2244) + 1;
    uint _2254 = uint(int(uint(_2252) >> uint(2)));
    int _2256 = _2252 & 3;
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[int(_2254)][_2256];
    float _2260 = trunc(_2232);
    float _2262 = precise::max(_2260, 0.0);
    uint _2264 = uint(_2262);
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2268 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2266;
    bool _2270 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2272 = isnan(_452);
    bool _2274 = _2270 || _2272;
    bool _2276 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2278 = _2274 || _2276;
    float _2280 = float(_2278);
    int _2282 = _2186 ? 0 : 1;
    float _2284 = _2268 * _2016;
    float _2286 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2288 = _452 + _2286;
    float _2290 = _2280 * _2238;
    int _2292 = ~_2282;
    int _2294 = _2292 + 1;
    int _2296 = _2294 + 1;
    float _2298 = -_2280;
    float _2300 = _2298 + 1.0;
    bool _2302 = uint(_2228) >= 2u;
    float _2304 = _2162 * _2290;
    int _2306 = _2296;
    if (!_2240)
    {
        int _2308 = ~_2282;
        int _2310 = _2308 + 1;
        _2306 = _2310;
    }
    int _2312 = _2306;
    float _2314 = fma(_2156, _2288, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2316 = _2228 != 3;
    float _2318 = fma(_2300, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2304);
    int _2320 = ~_500;
    int _2322 = _2320 + 1;
    float _2324 = fma(_2284, _1823, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2326 = int(_2088) + int(_2264);
    float _2328 = fma(_2314, _2234, _2318);
    bool _2330 = !_2230;
    int _2332 = _2330 ? 0 : 1;
    float _2334 = -_1776;
    float _2336 = _2334 + 1.0;
    int _2338 = abs(_2312);
    int _2340 = _2302 ? 0 : 1;
    float _2342 = _1874 * _1790;
    int _2344 = abs(_2332);
    int _2346 = ~_2338;
    int _2348 = _2346 + 1;
    int _2350 = _2348 + 1;
    int _2352 = _2322 * _2326;
    int _2354 = _2352 + _1988;
    int _2356 = ~_2340;
    int _2358 = _2356 + 1;
    int _2360 = _2358 + 1;
    float _2362 = fma(_2324, _2196, _2328);
    int _2364 = _2360;
    if (_2316)
    {
        int _2366 = ~_2340;
        int _2368 = _2366 + 1;
        _2364 = _2368;
    }
    int _2370 = _2364;
    float _2372 = _938 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2374 = ~_2344;
    int _2376 = _2374 + 1;
    int _2378 = _2376 + 1;
    float _2380 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2362);
    int _2382 = _2350 * as_type<int>(_2214);
    int _2384 = abs(_2370);
    bool _2386 = _2228 != 3;
    int _2388 = _2378 * as_type<int>(_2206);
    int _2390 = _2388 + _2382;
    bool _2392 = uint(_2354) >= uint(_500);
    float _2394 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2396 = int(_2394);
    float _2398 = as_type<float>(_2354);
    if (_1944)
    {
        float _2400 = in.m_55.x;
        _2398 = _2400;
    }
    float _2402 = _2398;
    bool _2404 = !_2386;
    int _2406 = _2404 ? 0 : (-1);
    float _2408 = _2380 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2410 = !_2392;
    int _2412 = _2410 ? 0 : (-1);
    int _2414 = ~_2384;
    int _2416 = _2414 + 1;
    int _2418 = _2416 + 1;
    int _2420 = abs(_2406);
    bool _2422 = !_2096;
    int _2424 = _2422 ? 0 : 1;
    int _2426 = ~_2326;
    int _2428 = _2426 + _2412;
    int _2430 = _2428 + 1;
    int _2432 = _2418 * as_type<int>(_2250);
    int _2434 = _2432 + _2390;
    int _2436 = abs(_2424);
    float _2438 = in.m_73.x;
    int _2440 = ~_2420;
    int _2442 = _2440 + 1;
    int _2444 = _2442 + 1;
    int _2446 = _500 * _2430;
    int _2448 = _2446 + _1988;
    bool _2450 = _882 != 0.0;
    bool _2452 = isnan(_882);
    bool _2454 = _2450 || _2452;
    bool _2456 = isnan(0.0);
    bool _2458 = _2454 || _2456;
    float _2460 = in.m_77.x;
    float _2462 = in.m_77.y;
    float _2464 = in.m_77.z;
    int _2466 = ~_2436;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    int _2472 = _2444 * as_type<int>(_2258);
    int _2474 = _2472 + _2434;
    float _2476 = float(uint(_2396));
    int _2478 = abs(_2396);
    int _2480 = _2474 * _2470;
    bool _2482 = _880 == 0.0;
    bool _2484 = !_2458;
    bool _2486 = _2482 && _2484;
    float _2488 = 1.0 / _2476;
    bool _2490 = _884 == 0.0;
    bool _2492 = _2490 && _2486;
    float _2494 = float(uint(_2478));
    bool _2496 = !_1819;
    int _2498 = _2496 ? _2448 : (-1);
    bool _2500 = _2402 > 0.5;
    bool _2502 = _2500 && _1944;
    float _2504 = 1.0 / _2494;
    int _2506 = _2498 * _2436;
    int _2508 = _2506 + _2480;
    float _2510 = _2402;
    if (_1944)
    {
        _2510 = _2438;
    }
    float _2512 = _2510;
    float _2514 = _2460;
    float _2516 = _2464;
    float _2518 = _2512;
    float _2520 = _2462;
    if (!_2492)
    {
        float _2522 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2460);
        _2514 = _2522;
    }
    float _2524 = _2514;
    if (!_1944)
    {
        _1054 = _2438;
    }
    float _2526 = _1054;
    float _2528 = _2526;
    if (!_2492)
    {
        float _2530 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2464);
        _2516 = _2530;
    }
    float _2532 = _2516;
    int _2534 = as_type<int>(_2488) + (-2);
    float _2536 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2538 = float(uint(_2508));
    if (_2502)
    {
        float _2540 = -_2512;
        float _2542 = _2540 + 1.0;
        _2518 = _2542;
    }
    float _2544 = _2518;
    int _2546 = abs(_2508);
    float _2548 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2550 = as_type<float>(_2534) * _2538;
    float _2552 = _938 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2554 = as_type<int>(_2504) + (-2);
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2558 = float(uint(_2546));
    float _2560 = trunc(_2550);
    float _2562 = precise::max(_2560, 0.0);
    uint _2564 = uint(_2562);
    float _2566 = _2556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1944)
    {
        _2528 = _2544;
    }
    float _2568 = _2528;
    float _2570 = as_type<float>(_2554) * _2558;
    int _2572 = ~_2396;
    int _2574 = _2572 + 1;
    float _2576 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2578 = ~_2478;
    int _2580 = _2578 + 1;
    if (!_2492)
    {
        float _2582 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2462);
        _2520 = _2582;
    }
    float _2584 = _2520;
    float _2586 = -_926;
    float _2588 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2552);
    float _2590 = trunc(_2570);
    float _2592 = precise::max(_2590, 0.0);
    uint _2594 = uint(_2592);
    float _2596 = _2576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2598 = _938 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2600 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2588);
    out.m_79.x = _2548;
    out.m_79.y = _2566;
    out.m_79.z = _2596;
    out.m_79.w = _2408;
    float _2602 = abs(_1362);
    float _2604 = log2(_2602);
    bool _2606 = _1362 <= 8000.0;
    bool _2608 = isnan(_1362);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan(8000.0);
    bool _2614 = _2610 || _2612;
    float _2616 = float(_2614);
    int _2618 = _2574 * int(_2564);
    int _2620 = _2618 + _2508;
    float _2622 = -_926;
    float _2624 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2372);
    float _2626 = -_926;
    float _2628 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2598);
    float _2630 = float(uint(_2620));
    float _2632 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2624);
    int _2634 = _2580 * int(_2594);
    int _2636 = _2634 + _2546;
    float _2638 = _946 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2640 = _946 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2642 = as_type<float>(_2534) * _2630;
    float _2644 = _946 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2646 = float(uint(_2636));
    float _2648 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2638);
    float _2650 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2640);
    float _2652 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2644);
    float _2654 = trunc(_2642);
    float _2656 = precise::max(_2654, 0.0);
    uint _2658 = uint(_2656);
    float _2660 = as_type<float>(_2554) * _2646;
    float _2662 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2628);
    float _2664 = _952 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2666 = _952 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2668 = _952 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2670 = _2662 * _2584;
    float _2672 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2674 = trunc(_2660);
    float _2676 = precise::max(_2674, 0.0);
    uint _2678 = uint(_2676);
    float _2680 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2664);
    float _2682 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2666);
    float _2684 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2668);
    int _2686 = ~_2396;
    int _2688 = _2686 + 1;
    float _2690 = _2600 * _2584;
    int _2692 = ~_2478;
    int _2694 = _2692 + 1;
    float _2696 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2648);
    float _2698 = exp2(_2672);
    int _2700 = int(_2564) + int(_2658);
    float _2702 = _2632 * _2584;
    float _2704 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2650);
    float _2706 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2680);
    int _2708 = _2688 * _2700;
    int _2710 = _2708 + _2508;
    int _2712 = int(_2594) + int(_2678);
    float _2714 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2682);
    float _2716 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2652);
    float _2718 = fma(_2696, _2524, _2690);
    bool _2720 = uint(_2710) >= uint(_2396);
    int _2722 = _2694 * _2712;
    int _2724 = _2722 + _2546;
    float _2726 = fma(_2716, _2524, _2670);
    float _2728 = fma(_2698, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2730 = precise::clamp(_2728, 0.0, 1.0);
    bool _2732 = !_2720;
    int _2734 = _2732 ? 0 : (-1);
    float _2736 = fma(_2704, _2524, _2702);
    bool _2738 = uint(_2724) >= uint(_2478);
    float _2740 = fma(_2706, _2532, _2718);
    int _2742 = _2508 ^ _2396;
    float _2744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2746 = ~_2700;
    int _2748 = _2746 + _2734;
    int _2750 = _2748 + 1;
    float _2752 = fma(_2714, _2532, _2736);
    bool _2754 = !_2738;
    int _2756 = _2754 ? 0 : (-1);
    float _2758 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2684);
    uint _2760 = uint(int(uint(_2742) >> uint(31)));
    bool _2762 = _2396 == 0;
    float _2764 = _1811 * _2342;
    bool _2766 = _2396 == 0;
    int _2768 = _2396 * _2750;
    int _2770 = _2768 + _2508;
    int _2772 = ~_2756;
    int _2774 = _2712 + _2772;
    int _2776 = _2774 + 1;
    float _2778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2780 = ~int(_2760);
    int _2782 = _2780 + 1;
    float _2784 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2786 = _2744 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2788 = _2776 ^ _2782;
    float _2790 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2784);
    float _2792 = fma(_2758, _2532, _2726);
    float _2794 = fma(_2730, -2.0, 3.0);
    float _2796 = _2730 * _2730;
    int _2798 = ~_2782;
    int _2800 = _2798 + _2788;
    int _2802 = _2800 + 1;
    float _2804 = fma(_2786, _2568, -0.5);
    float _2806 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2790);
    float _2808 = _2796 * _2794;
    bool _2810 = !_2762;
    int _2812 = _2810 ? _2770 : (-1);
    out.m_81.x = _2740;
    out.m_81.y = _2752;
    out.m_81.z = _2792;
    bool _2814 = !_2766;
    int _2816 = _2814 ? _2802 : (-1);
    float _2818 = -_2808;
    float _2820 = _2818 + 1.0;
    float _2822 = float(_2812);
    float _2824 = _2778 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2826 = float(_2816);
    float _2828 = fma(_2820, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2808);
    bool _2830 = _1504 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2832 = isnan(_1504);
    bool _2834 = _2830 || _2832;
    bool _2836 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2838 = _2834 || _2836;
    float _2840 = fma(_2824, _2150, -0.5);
    float _2842 = fma(_2786, _2822, _628);
    float _2844 = -_644;
    float _2846 = fma(_2824, _2826, _2844);
    float _2848 = _2616 * _2828;
    float _2850 = _1706 * 0.5;
    float _2852 = fma(_630, _2804, _2842);
    float _2854 = fma(_632, _2840, _2846);
    float _2856 = _2848 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2858 = in.m_83.x;
    float _2860 = fma(_1756, -0.5, _2850);
    float _2862 = _2852 + 0.5;
    float _2864 = _2336 * _2856;
    float _2866 = precise::clamp(_2864, 0.0, 1.0);
    float _2868 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2806);
    float _2870 = _2854 + 0.5;
    float _2872 = _1750 + _1706;
    float _2874 = -_2866;
    float _2876 = fma(_2874, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2878 = _1801 * _2342;
    out.gl_Position.x = _1750;
    out.gl_Position.y = _1756;
    out.gl_Position.z = _2868;
    out.gl_Position.w = _1706;
    float _2880 = fma(_1801, _2764, _1799);
    float _2882 = _2868 + _1706;
    out.m_85.x = _2862;
    out.m_85.y = _2870;
    float _2884 = _2872 * 0.5;
    float _2886 = _2882 * 0.5;
    out.m_87.x = _2884;
    out.m_87.y = _2860;
    out.m_87.z = _2886;
    out.m_87.w = _1706;
    float _2888 = _2876 * _2858;
    float _2890 = -_1874;
    float _2892 = _2890 + 1.0;
    float _2894 = fma(_1807, _2878, _1795);
    float _2896 = fma(_1809, _2878, _1797);
    float _2898 = _2888 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2900 = _1801 * _2892;
    float _2902 = _1416 * _1470;
    float _2904 = _2868;
    float _2906 = _2884;
    float _2908 = _2892;
    float _2910 = _2902;
    if (!_2838)
    {
        _2144 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2912 = _2144;
    out.m_89.x = _2898;
    float _2914 = _2912;
    float _2916 = _2912;
    if (!_2838)
    {
        _2904 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2918 = _2904;
    float _2920 = _2902 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2922 = _2918;
    float _2924 = _2918;
    if (!_2838)
    {
        _2906 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2926 = _2906;
    out.m_91.x = _2894;
    out.m_91.y = _2896;
    out.m_91.z = _2880;
    out.m_91.w = _2900;
    float _2928 = _2926;
    float _2930 = _2926;
    if (!_2838)
    {
        _2146 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2932 = _2146;
    float _2934 = _2932;
    float _2936 = _2932;
    if (!_2838)
    {
        _2908 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2938 = _2908;
    float _2940 = _2938;
    float _2942 = _2938;
    if (!_2838)
    {
        _2910 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2944 = _2910;
    bool _2946 = !_2838;
    float _2948 = _2944;
    float _2950 = _2944;
    if (!_2946)
    {
        bool _2952 = _1504 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2954 = isnan(_1504);
        bool _2956 = _2952 || _2954;
        bool _2958 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2960 = _2956 || _2958;
        if (!_2960)
        {
            float _2962 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2964 = _1504 + _2962;
            float _2966 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2968 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2966;
            float _2970 = 1.0 / _2968;
            float _2972 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2974 = _2972 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2976 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2978 = _2976 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2980 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2982 = _2980 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2986 = _2984 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2990 = _2988 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2992 = _2964 * _2970;
            float _2994 = precise::clamp(_2992, 0.0, 1.0);
            float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2998 = _2996 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3000 = fma(_2994, _2974, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3002 = fma(_2994, _2998, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3004 = fma(_2994, _2978, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3006 = fma(_2994, _2982, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3008 = fma(_2994, _2986, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3010 = fma(_2994, _2990, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2916 = _3002;
            _2942 = _3008;
            _2930 = _3000;
            _2936 = _3006;
            _2924 = _3004;
            _2950 = _3010;
            _3012 = true;
        }
        else
        {
            bool _3014 = _1504 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3016 = isnan(_1504);
            bool _3018 = _3014 || _3016;
            bool _3020 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3022 = _3018 || _3020;
            if (!_3022)
            {
                _2928 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3024 = _2928;
            _2930 = _3024;
            if (!_3022)
            {
                _2914 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3026 = _2914;
            _2916 = _3026;
            if (!_3022)
            {
                _2922 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3028 = _2922;
            _2924 = _3028;
            if (!_3022)
            {
                _2934 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3030 = _2934;
            _2936 = _3030;
            if (!_3022)
            {
                _2940 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3032 = _2940;
            _2942 = _3032;
            if (!_3022)
            {
                _2948 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3034 = _2948;
            bool _3036 = !_3022;
            _2950 = _3034;
            if (!_3036)
            {
                bool _3038 = _1504 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3040 = isnan(_1504);
                bool _3042 = _3038 || _3040;
                bool _3044 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3046 = _3042 || _3044;
                if (!_3046)
                {
                    float _3048 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3050 = _1504 + _3048;
                    float _3052 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3054 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3052;
                    float _3056 = 1.0 / _3054;
                    float _3058 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3062 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3066 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3068 = _3066 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3070 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3072 = _3070 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3074 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3076 = _3074 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3078 = _3050 * _3056;
                    float _3080 = precise::clamp(_3078, 0.0, 1.0);
                    float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3084 = _3082 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3086 = fma(_3080, _3060, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3088 = fma(_3080, _3084, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3090 = fma(_3080, _3064, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3092 = fma(_3080, _3068, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3094 = fma(_3080, _3072, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3096 = fma(_3080, _3076, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2916 = _3088;
                    _2942 = _3094;
                    _2930 = _3086;
                    _2936 = _3092;
                    _2924 = _3090;
                    _2950 = _3096;
                    _3012 = true;
                }
                else
                {
                    _2916 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2942 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2930 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2936 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2924 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2950 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3012 = false;
    float _3098 = _2916;
    float _3100 = _2942;
    float _3102 = _2930;
    float _3104 = _2936;
    float _3106 = _2924;
    float _3108 = _2950;
    float _3110 = _2920 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3112 = fma(_2752, -0.5, 0.5);
    float _3114 = precise::clamp(_3112, 0.0, 1.0);
    float _3116 = -_3098;
    float _3118 = _3116 + _3100;
    float _3120 = -_3102;
    float _3122 = _3120 + _3104;
    out.m_49.x = _3110;
    float _3124 = fma(_3114, _3118, _3098);
    float _3126 = -_3106;
    float _3128 = _3126 + _3108;
    float _3130 = fma(_3114, _3122, _3102);
    float _3132 = _3124 * 0.586610972881317138671875;
    bool _3134 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3136 = fma(_3114, _3128, _3106);
    out.m_93.x = 0.0;
    float _3138 = fma(_3130, 0.298911988735198974609375, _3132);
    bool _3140 = _1416 > 0.0;
    bool _3142 = isnan(_1416);
    bool _3144 = _3140 || _3142;
    bool _3146 = isnan(0.0);
    bool _3148 = _3144 || _3146;
    float _3150 = fma(_3136, 0.114477999508380889892578125, _3138);
    bool _3152 = _1470 <= 0.0;
    bool _3154 = !_3148;
    bool _3156 = _3152 || _3154;
    float _3158 = -_3150;
    float _3160 = _3130 + _3158;
    float _3162 = -_3150;
    float _3164 = _3124 + _3162;
    float _3166 = -_3150;
    float _3168 = _3136 + _3166;
    float _3170 = fma(_3160, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3150);
    float _3172 = fma(_3164, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3150);
    float _3174 = fma(_3168, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3150);
    bool _3176 = !_3134;
    if (!_3176)
    {
        float _3178 = -_1352;
        float _3180 = _3178 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3182 = -_1354;
        float _3184 = _3182 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3186 = -_1356;
        float _3188 = _3186 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3190 = _3180 * _3180;
        float _3192 = fma(_3184, _3184, _3190);
        float _3194 = fma(_3188, _3188, _3192);
        float _3196 = sqrt(_3194);
        float _3198 = rsqrt(_3194);
        float _3200 = -_3196;
        float _3202 = _3200 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3204 = _3202 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3206 = precise::clamp(_3204, 0.0, 1.0);
        float _3208 = _3184 * _3198;
        float _3210 = _3180 * _3198;
        float _3212 = abs(_3206);
        float _3214 = log2(_3212);
        float _3216 = _3188 * _3198;
        float _3218 = _3208 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3220 = _2752 * _3210;
        float _3222 = -_3210;
        float _3224 = -_3218;
        float _3226 = fma(_3222, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3224);
        float _3228 = fma(_2740, _3208, _3220);
        float _3230 = -_3216;
        float _3232 = fma(_3230, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3226);
        float _3234 = fma(_2792, _3216, _3228);
        float _3236 = precise::clamp(_3234, 0.0, 1.0);
        float _3238 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3240 = _3232 + _3238;
        float _3242 = _3214 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3244 = _3240 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3246 = precise::clamp(_3244, 0.0, 1.0);
        float _3248 = exp2(_3242);
        float _3250 = _3248 * _3246;
        float _3252 = _3236 * _3250;
        float _3254 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3256 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3258 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3254;
        out.m_93.y = _3256;
        out.m_93.z = _3258;
    }
    out.m_67.x = _3170;
    out.m_67.y = _3172;
    out.m_67.z = _3174;
    if (!_3156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3260 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3260;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3012 = false;
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
        float _3317 = as_type<float>(_128);
        out.gl_Position.z = _3317;
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
        float _3387 = as_type<float>(_166);
        out.gl_Position.z = _3387;
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
    bool _390 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
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
        float _428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _430 = _426 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
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
    float _454 = in.m_55.x;
    float _456 = in.m_55.y;
    float _458 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _460 = log2(_458);
    float _462 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _464 = in.m_46.x;
    float _466 = in.m_46.y;
    float _468 = in.m_46.z;
    float _470 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _472 = in.m_55.z;
    float _474 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _476 = int(_474);
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _480 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _482 = isnan(0.0);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _488 = _484 || _486;
    float _490 = _462 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _492 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _494 = _460 * _146;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _498 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _500 = int(_498);
    float _502 = _454 * 2.0;
    float _504 = _454 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _506 = _456 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _508 = exp2(_494);
    float _510 = _456 * 2.0;
    float _512 = -_496;
    float _514 = fma(_504, 2.0, _512);
    float _516 = fma(_506, -2.0, _478);
    float _518 = _466 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _520 = _466 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _522 = _466 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _524 = _456 + _454;
    float _526 = floor(_502);
    float _528 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[4].x, _518);
    float _530 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[5].x, _520);
    float _532 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[6].x, _522);
    float _534 = _524 + (-1.0);
    float _536 = _456 + _472;
    float _538 = _472 * 2.0;
    float _540 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _542 = _536 + (-1.0);
    float _544 = floor(_538);
    float _546 = float(_476);
    float _548 = -_508;
    float _550 = _548 + 1.0;
    bool _552 = _526 > 0.0;
    bool _554 = _526 >= 0.0;
    bool _556 = isnan(_526);
    bool _558 = _554 || _556;
    bool _560 = isnan(0.0);
    bool _562 = _558 || _560;
    float _564 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _568 = 1.0 + _566;
    float _570 = floor(_510);
    bool _572 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _574 = isnan(1.0);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _580 = _576 || _578;
    float _582 = _488 ? _550 : 0.0;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _588 = 1.0 / _546;
    bool _590 = _544 > 0.0;
    bool _592 = _544 >= 0.0;
    bool _594 = isnan(_544);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    float _602 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[78].z, _584);
    float _604 = float(_500);
    float _606 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[78].w, _586);
    int _608 = _562 ? 0 : 1;
    float _610 = 1.0 / _568;
    bool _612 = _570 > 0.0;
    float _614 = _604 * _146;
    bool _616 = _570 >= 0.0;
    bool _618 = isnan(_570);
    bool _620 = _616 || _618;
    bool _622 = isnan(0.0);
    bool _624 = _620 || _622;
    float _626 = -_146;
    float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[76].x, _514);
    float _630 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _602);
    float _632 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _606);
    int _634 = _624 ? 0 : 1;
    float _636 = _588 * _146;
    int _638 = ~_608;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    float _644 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _516);
    int _646 = _642;
    if (!_552)
    {
        int _648 = ~_608;
        int _650 = _648 + 1;
        _646 = _650;
    }
    int _652 = _646;
    float _654 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[5].z, _530);
    float _656 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
    float _658 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[6].z, _532);
    int _660 = ~_634;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    int _666 = _664;
    if (_580)
    {
        float _668 = _582 * _610;
        _148 = _668;
    }
    float _670 = _148;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _674 = _672 != 0;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _682 = _680 != 0;
    float _684 = _654 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (!_612)
    {
        int _686 = ~_634;
        int _688 = _686 + 1;
        _666 = _688;
    }
    int _690 = _666;
    float _692 = _656 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _694 = in.m_61.x;
    float _696 = in.m_61.y;
    float _698 = in.m_61.z;
    bool _700 = !_678;
    int _702 = _700 ? 0 : 1;
    float _704 = _658 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _706 = !_674;
    int _708 = _706 ? 0 : 1;
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _712 = _692 + _710;
    bool _714 = !_682;
    int _716 = _714 ? 0 : 1;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _720 = _718 != 0;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _724 = _722 != 0;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _728 = _726 != 0;
    float _730 = float(_652);
    int _732 = _600 ? 0 : 1;
    bool _734 = !_720;
    int _736 = _734 ? 0 : 1;
    bool _738 = !_724;
    int _740 = _738 ? 0 : 1;
    int _742 = abs(_736);
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _746 = _684 + _744;
    int _748 = abs(_740);
    int _750 = ~_732;
    int _752 = _750 + 1;
    int _754 = _752 + 1;
    float _756 = _746 * _746;
    float _758 = float(_748);
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _762 = _704 + _760;
    int _764 = _754;
    if (!_590)
    {
        int _766 = ~_732;
        int _768 = _766 + 1;
        _764 = _768;
    }
    int _770 = _764;
    float _772 = fma(_712, _712, _756);
    float _774 = _758 * _730;
    float _776 = float(_742);
    float _778 = fma(_762, _762, _772);
    float _780 = float(_770);
    float _782 = _774 * (-2.0);
    float _784 = _456 + (-0.5);
    float _786 = sqrt(_778);
    bool _788 = !_728;
    int _790 = _788 ? 0 : 1;
    float _792 = fma(_782, _696, _696);
    float _794 = fma(_564, _782, _564);
    float _796 = _776 * _780;
    int _798 = abs(_790);
    float _800 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[196].y, _792);
    float _802 = _472 + _454;
    float _804 = rsqrt(_778);
    float _806 = float(_690);
    float _808 = _796 * (-2.0);
    float _810 = float(_798);
    float _812 = _802 + (-1.0);
    float _814 = _472 + (-0.5);
    float _816 = fma(_808, _694, _694);
    float _818 = fma(_540, _808, _540);
    float _820 = _786 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _822 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _824 = _810 * _806;
    float _826 = _454 + (-0.5);
    float _828 = fma(_794, _670, _800);
    float _830 = precise::min(_490, _820);
    float _832 = _824 * (-2.0);
    float _834 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[196].x, _816);
    float _836 = _828 * 0.15915493667125701904296875;
    float _838 = _804 * _830;
    float _840 = fma(_822, _832, _822);
    float _842 = fma(_832, _698, _698);
    float _844 = fma(_818, _670, _834);
    float _846 = _746 * _838;
    float _848 = _762 * _838;
    float _850 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[196].z, _842);
    float _852 = _712 * _838;
    float _854 = -_846;
    float _856 = _746 + _854;
    float _858 = -_848;
    float _860 = _762 + _858;
    float _862 = fma(_840, _670, _850);
    float _864 = -_852;
    float _866 = _712 + _864;
    float _868 = _856 * _856;
    float _870 = _844 * 0.15915493667125701904296875;
    float _872 = _862 * 0.15915493667125701904296875;
    float _874 = _836 * 6.283185482025146484375;
    float _876 = sin(_874);
    float _878 = fma(_866, _866, _868);
    float _880 = in.m_63.x;
    float _882 = in.m_63.y;
    float _884 = in.m_63.z;
    float _886 = fma(_860, _860, _878);
    float _888 = _836 * 6.283185482025146484375;
    float _890 = cos(_888);
    float _892 = sqrt(_886);
    float _894 = _870 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = _870 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = _804 * _892;
    float _904 = _470 * _902;
    float _906 = _462 * _902;
    float _908 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _910 = _872 * 6.283185482025146484375;
    float _912 = cos(_910);
    float _914 = _896 * _876;
    float _916 = _896 * _890;
    float _918 = _904 * _908;
    float _920 = _492 * _902;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    float _924 = _872 * 6.283185482025146484375;
    float _926 = sin(_924);
    float _928 = _900 * _890;
    float _930 = _900 * _876;
    float _932 = _920 * _922;
    float _934 = _896 * _912;
    float _936 = _890 * _912;
    float _938 = _900 * _912;
    float _940 = _876 * _912;
    float _942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _880);
    float _944 = _938 * _918;
    float _946 = fma(_926, _928, _914);
    float _948 = _906 * _942;
    float _950 = -_916;
    float _952 = fma(_926, _930, _950);
    float _954 = -_918;
    float _956 = _926 * _954;
    float _958 = -_930;
    float _960 = fma(_926, _916, _958);
    float _962 = fma(_946, _948, _944);
    float _964 = _934 * _918;
    float _966 = fma(_936, _948, _956);
    float _968 = fma(_926, _914, _928);
    float _970 = fma(_952, _932, _962);
    float _972 = fma(_960, _948, _964);
    float _974 = fma(_940, _932, _966);
    float _976 = _970 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _978 = fma(_968, _932, _972);
    float _980 = _970 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _982 = _970 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[26].x, _976);
    float _986 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[24].x, _980);
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[26].z, _984);
    float _990 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[24].z, _986);
    float _992 = _988 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _994 = _990 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _996 = _704 + _992;
    float _998 = _692 + _994;
    float _1000 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1002 = _996 + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1006 = _998 + _1004;
    float _1008 = _1002 * _1002;
    float _1010 = fma(_1006, _1006, _1008);
    float _1012 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[25].x, _982);
    float _1014 = -_846;
    float _1016 = _684 + _1014;
    float _1018 = -_852;
    float _1020 = _692 + _1018;
    float _1022 = sqrt(_1010);
    float _1024 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1012);
    float _1026 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1028 = -_848;
    float _1030 = _704 + _1028;
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1034 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1026);
    float _1036 = _684 + _1032;
    float _1038 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1034);
    bool _1040 = _1022 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = _1032;
    float _1044 = _998;
    float _1046 = _1034;
    float _1048 = _848;
    float _1050 = _846;
    float _1052 = _852;
    float _1054 = _880;
    if (!_1040)
    {
        _1042 = _998;
    }
    float _1056 = _1042;
    float _1058 = _1056;
    if (!_1040)
    {
        _1044 = _996;
    }
    float _1060 = _1044;
    float _1062 = _1060;
    if (!_1040)
    {
        _1046 = _1036;
    }
    float _1064 = _1046;
    bool _1066 = !_1040;
    float _1068 = _1064;
    if (!_1066)
    {
        float _1070 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1072 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1074 = _1022 + _1072;
        float _1076 = rsqrt(_1010);
        float _1078 = _1074 * _1070;
        float _1080 = _1036 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1082 = _1078 * 0.15915493667125701904296875;
        float _1084 = _1082 * 6.283185482025146484375;
        float _1086 = cos(_1084);
        float _1088 = _1082 * 6.283185482025146484375;
        float _1090 = sin(_1088);
        float _1092 = _1086 + (-1.0);
        float _1094 = fma(_1090, _1080, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1096 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = _1076 * _1094;
        float _1100 = fma(_1036, _1086, _1096);
        float _1102 = fma(_1006, _1098, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1104 = fma(_1002, _1098, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1068 = _1100;
        _1058 = _1102;
        _1062 = _1104;
    }
    float _1106 = _1068;
    float _1108 = _1058;
    float _1110 = _1062;
    float _1112 = -_684;
    float _1114 = _1112 + _1106;
    float _1116 = -_692;
    float _1118 = _1116 + _1108;
    float _1120 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1122 = -_704;
    float _1124 = _1122 + _1110;
    float _1126 = _1114 * _1114;
    float _1128 = 1.0 / _1120;
    float _1130 = fma(_1118, _1118, _1126);
    float _1132 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1134 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1136 = isnan(0.5);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1142 = _1138 || _1140;
    float _1144 = fma(_1124, _1124, _1130);
    float _1146 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1132);
    bool _1148 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1150 = isnan(0.5);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1156 = _1152 || _1154;
    float _1158 = sqrt(_1144);
    float _1160 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1146);
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1164 = _1162 + _1120;
    float _1166 = -_846;
    float _1168 = _1166 + _1106;
    float _1170 = _1164 * _1128;
    float _1172 = _1170 * 0.5;
    float _1174 = -_852;
    float _1176 = _1174 + _1108;
    float _1178 = -_848;
    float _1180 = _1178 + _1110;
    bool _1182 = _1158 > 0.0;
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1186 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1184);
    float _1188 = 1.0 / _1186;
    float _1190 = _1158;
    float _1192 = _1106;
    float _1194 = _1186;
    float _1196 = _1168;
    float _1198 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1200 = _1180;
    if (!_1182)
    {
        _1048 = _1176;
    }
    float _1202 = _1048;
    float _1204 = _1202;
    if (!_1182)
    {
        _1050 = _1168;
    }
    float _1206 = _1050;
    float _1208 = _1206;
    if (!_1182)
    {
        _1190 = _1180;
    }
    float _1210 = _1190;
    bool _1212 = !_1182;
    float _1214 = _1210;
    float _1216 = _1210;
    if (!_1212)
    {
        float _1218 = _190 * _190;
        float _1220 = fma(_188, _188, _1218);
        float _1222 = fma(_192, _192, _1220);
        float _1224 = rsqrt(_1144);
        float _1226 = sqrt(_1222);
        float _1228 = _1114 * _1224;
        float _1230 = _1118 * _1224;
        float _1232 = _1124 * _1224;
        bool _1234 = _1226 > 0.0;
        float _1236 = _1226;
        float _1238 = _1224;
        _1052 = _1222;
        _1192 = _1230;
        _1194 = _1228;
        if (!_1234)
        {
            _1236 = _1176;
        }
        float _1240 = _1236;
        _1204 = _1240;
        if (!_1234)
        {
            _1238 = _1168;
        }
        float _1242 = _1238;
        _1208 = _1242;
        if (!_1234)
        {
            _1214 = _1180;
        }
        float _1244 = _1214;
        bool _1246 = !_1234;
        _1216 = _1244;
        if (!_1246)
        {
            float _1248 = rsqrt(_1222);
            float _1250 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1252 = _190 * _1248;
            float _1254 = _188 * _1248;
            float _1256 = _192 * _1248;
            float _1258 = _1228 * _1252;
            float _1260 = fma(_1230, _1254, _1258);
            float _1262 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1264 = fma(_1232, _1256, _1260);
            float _1266 = _1264 * _1262;
            float _1268 = fma(_188, _1266, _1176);
            float _1270 = fma(_190, _1266, _1168);
            float _1272 = fma(_192, _1266, _1180);
            _1204 = _1268;
            _1208 = _1270;
            _1216 = _1272;
        }
    }
    float _1274 = _1204;
    float _1276 = _1208;
    float _1278 = _1216;
    float _1280 = _1052;
    float _1282 = _1192;
    float _1284 = _1194;
    float _1286 = _1284;
    float _1288 = _1276;
    float _1290 = _1274;
    float _1292 = _1278;
    float _1294 = _1280;
    float _1296 = _1282;
    if (_1156)
    {
        _1286 = 1.0;
    }
    float _1298 = _1286;
    float _1300 = _1298;
    if (!_1142)
    {
        float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1304 = _1016 + _1302;
        float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1308 = _1020 + _1306;
        float _1310 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1312 = _1304 * _1304;
        float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1316 = _1030 + _1314;
        float _1318 = fma(_1308, _1308, _1312);
        float _1320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1322 = fma(_1316, _1316, _1318);
        float _1324 = sqrt(_1322);
        float _1326 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1328 = precise::min(_1324, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1330 = _1328 * _1320;
        float _1332 = -_1020;
        float _1334 = _1332 + _1274;
        float _1336 = _1326 * _1330;
        float _1338 = -_1016;
        float _1340 = _1338 + _1276;
        float _1342 = -_1030;
        float _1344 = _1342 + _1278;
        float _1346 = fma(_1334, _1336, _1020);
        float _1348 = fma(_1340, _1336, _1016);
        float _1350 = fma(_1344, _1336, _1030);
        _1288 = _1348;
        _1290 = _1346;
        _1292 = _1350;
    }
    float _1352 = _1288;
    float _1354 = _1290;
    float _1356 = _1292;
    if (_1156)
    {
        _1196 = 1.0;
    }
    float _1358 = _1196;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1362 = _1188 * _1360;
    float _1364 = _1358;
    if (!_1156)
    {
        float _1366 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1368 = _1366 * 0.15915493667125701904296875;
        float _1370 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1372 = _1368 * 6.283185482025146484375;
        float _1374 = cos(_1372);
        float _1376 = _1370 * 0.15915493667125701904296875;
        float _1378 = _1368 * 6.283185482025146484375;
        float _1380 = sin(_1378);
        float _1382 = 1.0 / _1374;
        float _1384 = _1376 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        float _1388 = _1380 * _1382;
        float _1390 = _1376 * 6.283185482025146484375;
        float _1392 = sin(_1390);
        float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1396 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1394;
        float _1398 = _1386 * _1388;
        float _1400 = 1.0 / _1396;
        float _1402 = 1.0 / _1398;
        float _1404 = _1392 * _1402;
        float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1408 = fma(_1362, _1404, _1406);
        float _1410 = _1408 * _1400;
        float _1412 = precise::clamp(_1410, 0.0, 1.0);
        _1294 = _1368;
        _1300 = _1412;
    }
    float _1414 = _1294;
    float _1416 = _1300;
    if (!_1156)
    {
        float _1418 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1420 = _1418 * 0.15915493667125701904296875;
        float _1422 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1424 = _1420 * 6.283185482025146484375;
        float _1426 = cos(_1424);
        float _1428 = _1422 * 0.15915493667125701904296875;
        float _1430 = _1420 * 6.283185482025146484375;
        float _1432 = sin(_1430);
        float _1434 = 1.0 / _1426;
        float _1436 = _1428 * 6.283185482025146484375;
        float _1438 = cos(_1436);
        float _1440 = _1432 * _1434;
        float _1442 = _1428 * 6.283185482025146484375;
        float _1444 = sin(_1442);
        float _1446 = _1438 * _1440;
        float _1448 = 1.0 / _1446;
        float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1452 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1450;
        float _1454 = 1.0 / _1452;
        float _1456 = _1444 * _1448;
        float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1460 = fma(_1362, _1456, _1458);
        float _1462 = _1460 * _1454;
        float _1464 = precise::clamp(_1462, 0.0, 1.0);
        float _1466 = -_1464;
        float _1468 = _1466 + 1.0;
        _1364 = _1468;
    }
    float _1470 = _1364;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1474 = _1352 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1478 = _1354 + _1476;
    float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1482 = _1356 + _1480;
    float _1484 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1486 = _1474 * _1474;
    float _1488 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1490 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1484);
    float _1492 = fma(_1478, _1478, _1486);
    float _1494 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1488);
    float _1496 = fma(_1482, _1482, _1492);
    float _1498 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1494);
    float _1500 = rsqrt(_1496);
    float _1502 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1504 = sqrt(_1496);
    float _1506 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1508 = _1478 * _1506;
    float _1510 = _1482 * _1506;
    float _1512 = _1508 * _1508;
    float _1514 = _1510 * _1510;
    float _1516 = _1512 + _1514;
    float _1518 = sqrt(_1516);
    bool _1520 = _1518 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1524 = _1518 + _1522;
    float _1526 = _1486;
    float _1528 = _1516;
    float _1530 = _1524;
    float _1532 = _1508;
    float _1534 = _1510;
    float _1536 = _1512;
    if (_1520)
    {
        float _1538 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1526 = _1538;
    }
    float _1540 = _1526;
    if (_1520)
    {
        float _1542 = rsqrt(_1516);
        _1528 = _1542;
    }
    float _1544 = _1528;
    float _1546 = _1544;
    if (_1520)
    {
        float _1548 = _1524 * _1540;
        _1530 = _1548;
    }
    float _1550 = _1530;
    if (_1520)
    {
        float _1552 = _1550 * 0.15915493667125701904296875;
        _1198 = _1552;
    }
    float _1554 = _1198;
    float _1556 = _1540;
    if (_1520)
    {
        float _1558 = _1554 * 6.283185482025146484375;
        float _1560 = sin(_1558);
        _1556 = _1560;
    }
    float _1562 = _1556;
    float _1564 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1566 = precise::max(0.0, _1564);
    float _1568 = _1414;
    if (_1520)
    {
        float _1570 = _1554 * 6.283185482025146484375;
        float _1572 = cos(_1570);
        _1568 = _1572;
    }
    float _1574 = _1568;
    float _1576 = -_1506;
    float _1578 = -_1566;
    float _1580 = fma(_1474, _1576, _1578);
    if (_1520)
    {
        float _1582 = _1580 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1200 = _1582;
    }
    float _1584 = _1200;
    float _1586 = fma(_1020, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1588 = _1562;
    float _1590 = _1584;
    if (_1520)
    {
        float _1592 = fma(_1562, _1584, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1296 = _1592;
    }
    float _1594 = _1296;
    float _1596 = _1594;
    if (!_1520)
    {
        _1588 = _1580;
    }
    float _1598 = _1588;
    float _1600 = floor(_1586);
    float _1602 = _1598;
    float _1604 = _1574;
    if (_1520)
    {
        float _1606 = _1574 + (-1.0);
        _1590 = _1606;
    }
    float _1608 = _1590;
    if (_1520)
    {
        float _1610 = _1544 * _1594;
        _1596 = _1610;
    }
    float _1612 = _1596;
    if (_1520)
    {
        float _1614 = _1608 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1546 = _1614;
    }
    float _1616 = _1546;
    if (_1520)
    {
        float _1618 = _1508 * _1612;
        _1532 = _1618;
    }
    float _1620 = _1532;
    if (_1520)
    {
        float _1622 = _1510 * _1612;
        _1534 = _1622;
    }
    float _1624 = _1534;
    if (_1520)
    {
        float _1626 = fma(_1580, _1574, _1616);
        _1602 = _1626;
    }
    float _1628 = _1602;
    if (_1520)
    {
        float _1630 = _1620 * _1620;
        _1536 = _1630;
    }
    float _1632 = _1536;
    if (!_1520)
    {
        _1604 = _1514;
    }
    float _1634 = _1604;
    float _1636 = _1634;
    if (_1520)
    {
        float _1638 = _1624 * _1624;
        _1636 = _1638;
    }
    float _1640 = _1636;
    float _1642 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1644 = fma(_1628, _1628, _1632);
    float _1646 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1642);
    float _1648 = _1644 + _1640;
    float _1650 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1652 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1654 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1646);
    float _1656 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1490);
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1660 = fma(_1504, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1658);
    float _1662 = precise::clamp(_1660, 0.0, 1.0);
    float _1664 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1652);
    float _1666 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1668 = rsqrt(_1648);
    float _1670 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1672 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1664);
    float _1674 = -_1662;
    float _1676 = _1674 + 1.0;
    float _1678 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1680 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1682 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1684 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1686 = -_1678;
    float _1688 = fma(_1686, _1650, 1.0);
    float _1690 = abs(_1676);
    float _1692 = log2(_1690);
    float _1694 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1682);
    float _1696 = fma(_1030, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1698 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1694);
    float _1700 = _1668 * _1620;
    float _1702 = _1668 * _1628;
    float _1704 = floor(_1696);
    float _1706 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1698);
    float _1708 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1710 = _1668 * _1624;
    float _1712 = -_1600;
    float _1714 = _1586 + _1712;
    float _1716 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1718 = -_1708;
    float _1720 = fma(_1702, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1718);
    float _1722 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1724 = log2(_1688);
    float _1726 = -_1710;
    float _1728 = fma(_1726, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1720);
    float _1730 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1716);
    float _1732 = fma(_1728, -0.5, 0.5);
    float _1734 = fma(_1728, 0.5, 0.5);
    float _1736 = -_1704;
    float _1738 = _1696 + _1736;
    float _1740 = 1.0 / _1706;
    float _1742 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1684);
    float _1744 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1730);
    float _1746 = fma(_1734, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1748 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1742);
    float _1750 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1744);
    float _1752 = fma(_1734, _1746, -0.212114393711090087890625);
    float _1754 = exp2(_1722);
    float _1756 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1748);
    float _1758 = _1724 * 0.693147182464599609375;
    float _1760 = fma(_1734, _1752, 1.570728778839111328125);
    float _1762 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1764 = sqrt(_1732);
    float _1766 = _1702 + 1.0;
    float _1768 = _1750 * _1740;
    float _1770 = _1756 * _1740;
    float _1772 = -_1702;
    float _1774 = fma(_1754, _1766, _1772);
    float2 _5889 = float2(_1714, _1738);
    float _1776 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5889, float2(0.0), isnan(_5889)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5889, float2(0.0), isnan(_5889)), level(0.0)).x;
    float _1778 = fma(_1774, 0.5, 0.5);
    float _1780 = _1764 * 0.636619746685028076171875;
    float _1782 = fma(_1768, 0.5, 0.5);
    float _1784 = fma(_1770, -0.5, 0.5);
    float _1786 = -_1760;
    float _1788 = fma(_1780, _1786, 1.0);
    float3 _5914 = float3(_1782, _1784, _1762);
    float _1790 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5914, float3(0.0), isnan(_5914)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5914, float3(0.0), isnan(_5914)), level(0.0)).x;
    float3 _5925 = float3(_1782, _1784, _1762);
    float4 _1793 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5925, float3(0.0), isnan(_5925)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5925, float3(0.0), isnan(_5925)), level(0.0)).xyzw;
    float _1795 = _1793.x;
    float _1797 = _1793.y;
    float _1799 = _1793.z;
    float _1801 = _1793.w;
    float2 _5941 = float2(_1788, _1778);
    float3 _1805 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5941, float2(0.0), isnan(_5941)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5941, float2(0.0), isnan(_5941)), level(0.0)).xyz;
    float _1807 = _1805.x;
    float _1809 = _1805.y;
    float _1811 = _1805.z;
    float _1813 = float(uint(_500));
    float _1815 = trunc(_636);
    int _1817 = int(_1815);
    bool _1819 = _500 == 0;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1823 = _452 + _1821;
    int _1825 = abs(_708);
    out.m_65.x = _1020;
    out.m_65.y = _1016;
    out.m_65.z = _1030;
    int _1827 = abs(_716);
    float _1829 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1831 = _456 > 0.5;
    float _1833 = 1.0 / _1813;
    out.m_67.w = _830;
    out.m_69.x = _906;
    float _1835 = float(uint(_1817));
    float _1837 = exp2(_1829);
    int _1839 = ~_500;
    int _1841 = _1839 + 1;
    out.m_71.x = _1354;
    out.m_71.y = _1352;
    out.m_71.z = _1356;
    int _1843 = ~_500;
    int _1845 = _1843 + 1;
    int _1847 = as_type<int>(_1833) + (-2);
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1851 = _1849 != 0;
    float _1853 = as_type<float>(_1847) * _1835;
    bool _1855 = !_1851;
    float _1857 = _1855 ? 7.345489978790283203125 : 1.0;
    float _1859 = -_1837;
    float _1861 = _1859 + 1.0;
    float _1863 = trunc(_1853);
    float _1865 = precise::max(_1863, 0.0);
    uint _1868 = uint(_1865);
    float _1870 = _1857 * _454;
    float _1872 = float(_112);
    float _1874 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1876 = float(_1817);
    bool _1878 = _1876 >= _604;
    bool _1880 = isnan(_1876);
    bool _1882 = _1878 || _1880;
    bool _1884 = isnan(_604);
    bool _1886 = _1882 || _1884;
    float _1888 = float(_1886);
    float _1890 = 1.0 / _1872;
    int _1892 = _1841 * int(_1868);
    int _1894 = _1892 + _1817;
    float _1896 = floor(_1870);
    float _1898 = float(uint(_1894));
    float _1900 = as_type<float>(_1847) * _1898;
    float _1902 = trunc(_1888);
    int _1904 = int(_1902);
    float _1906 = _614 * _1890;
    int _1908 = _500 + (-1);
    float _1910 = -_1896;
    float _1912 = _1870 + _1910;
    float _1914 = trunc(_1900);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    float _1920 = _1912 * _604;
    int _1922 = ~_1904;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    float _1928 = trunc(_1920);
    int _1930 = int(_1928);
    int _1932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1934 = _1932 != 0;
    int _1936 = int(_1868) + int(_1918);
    float _1938 = trunc(_1906);
    int _1940 = int(_1938);
    int _1942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1944 = _1942 != 0;
    int _1946 = _1845 * _1936;
    int _1948 = _1946 + _1817;
    bool _1950 = uint(_1948) >= uint(_500);
    bool _1952 = !_1950;
    int _1954 = _1952 ? 0 : (-1);
    int _1956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1958 = _1956 != 0;
    int _1960 = ~_1936;
    int _1962 = _1960 + _1954;
    int _1964 = _1962 + 1;
    bool _1966 = !_1958;
    int _1968 = _1966 ? 0 : 1;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1972 = _1970 != 0;
    int _1974 = _500 * _1964;
    int _1976 = _1974 + _1817;
    int _1978 = abs(_702);
    int _1980 = abs(_1968);
    bool _1982 = !_1819;
    int _1984 = _1982 ? _1976 : (-1);
    int _1986 = _1930 * _1980;
    int _1988 = _1986 + _1817;
    int _1990 = _1984 * _1926;
    float _1992 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1994 = _452 + _1992;
    float _1996 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1998 = _1996 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2000 = _1904 * _1908;
    int _2002 = _2000 + _1990;
    bool _2004 = !_1972;
    int _2006 = _2004 ? 0 : 1;
    float _2008 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2010 = _2008 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2012 = _2002 * _1978;
    int _2014 = abs(_2006);
    float _2016 = 1.0 / _1998;
    int _2018 = _1940 * _1825;
    int _2020 = _2018 + _2012;
    int _2022 = _1988 * _1827;
    int _2024 = _2022 + _2020;
    int _2026 = ~_500;
    int _2028 = _2026 + 1;
    float _2030 = 1.0 / _2010;
    int _2032 = _1930 * _2014;
    int _2034 = _2032 + _2024;
    float _2036 = float(uint(_2034));
    float _2038 = as_type<float>(_1847) * _2036;
    float _2040 = trunc(_2038);
    float _2042 = precise::max(_2040, 0.0);
    uint _2044 = uint(_2042);
    int _2046 = _2028 * int(_2044);
    int _2048 = _2046 + _2034;
    float _2050 = float(uint(_2048));
    float _2052 = as_type<float>(_1847) * _2050;
    int _2054 = ~_500;
    int _2056 = _2054 + 1;
    float _2058 = trunc(_2052);
    float _2060 = precise::max(_2058, 0.0);
    uint _2062 = uint(_2060);
    float _2064 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2066 = _2064 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2068 = float(uint(_1988));
    int _2070 = int(_2044) + int(_2062);
    float _2072 = as_type<float>(_1847) * _2068;
    float _2074 = in.m_73.y;
    float _2076 = 1.0 / _2066;
    int _2078 = _2056 * _2070;
    int _2080 = _2078 + _2034;
    bool _2082 = uint(_2080) >= uint(_500);
    float _2084 = trunc(_2072);
    float _2086 = precise::max(_2084, 0.0);
    uint _2088 = uint(_2086);
    bool _2090 = !_2082;
    int _2092 = _2090 ? 0 : (-1);
    int _2094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2096 = _2094 != 0;
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    int _2098 = ~_2070;
    int _2100 = _2098 + _2092;
    int _2102 = _2100 + 1;
    bool _2104 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2106 = isnan(_452);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2112 = _2108 || _2110;
    float _2114 = float(_2112);
    int _2116 = _500 * _2102;
    int _2118 = _2116 + _2034;
    float _2120 = -_2114;
    float _2122 = _2120 + 1.0;
    bool _2124 = !_1819;
    int _2126 = _2124 ? _2118 : (-1);
    float _2128 = -_2074;
    float _2130 = _2128 + 1.0;
    float _2132 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2132;
    float _2136 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2138 = _2136 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2140 = _2126 >> 31;
    float _2142 = _2074;
    float _2144 = _1706;
    float _2146 = _1756;
    if (_1934)
    {
        float _2148 = _1831 ? _2130 : _2074;
        _2142 = _2148;
    }
    float _2150 = _2142;
    float _2152 = _2134 * _2030;
    int _2154 = _2140 & 3;
    float _2156 = _2138 * _2076;
    int _2158 = ~_500;
    int _2160 = _2158 + 1;
    float _2162 = fma(_2152, _1994, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2164 = _2126 + _2154;
    bool _2166 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2168 = isnan(_452);
    bool _2170 = _2166 || _2168;
    bool _2172 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2174 = _2170 || _2172;
    float _2176 = float(_2174);
    int _2178 = _2160 * int(_2088);
    int _2180 = _2178 + _1988;
    int _2182 = _2164 >> 2;
    int _2184 = _2126 & 3;
    bool _2186 = _2184 != 0;
    float _2188 = -_2176;
    float _2190 = _2188 + 1.0;
    int _2192 = _2182 << 4;
    int _2194 = _2192 + 368;
    float _2196 = _2176 * _2122;
    float _2198 = float(uint(_2180));
    uint _2200 = uint(int(uint(_2194) >> uint(2)));
    uint _2202 = uint(int(uint(int(_2200)) >> uint(2)));
    int _2204 = int(_2200) & 3;
    float _2206 = (*spvDescriptorSet0.vp_c9)._m0[int(_2202)][_2204];
    int _2208 = int(_2200) + 1;
    uint _2210 = uint(int(uint(_2208) >> uint(2)));
    int _2212 = _2208 & 3;
    float _2214 = (*spvDescriptorSet0.vp_c9)._m0[int(_2210)][_2212];
    bool _2216 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2218 = isnan(_452);
    bool _2220 = _2216 || _2218;
    bool _2222 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2224 = _2220 || _2222;
    float _2226 = float(_2224);
    int _2228 = _2126 & 3;
    bool _2230 = _2228 != 0;
    float _2232 = as_type<float>(_1847) * _2198;
    float _2234 = _2226 * _2190;
    float _2236 = -_2226;
    float _2238 = _2236 + 1.0;
    bool _2240 = uint(_2228) > 1u;
    int _2242 = _2194 + 8;
    uint _2244 = uint(int(uint(_2242) >> uint(2)));
    uint _2246 = uint(int(uint(int(_2244)) >> uint(2)));
    int _2248 = int(_2244) & 3;
    float _2250 = (*spvDescriptorSet0.vp_c9)._m0[int(_2246)][_2248];
    int _2252 = int(_2244) + 1;
    uint _2254 = uint(int(uint(_2252) >> uint(2)));
    int _2256 = _2252 & 3;
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[int(_2254)][_2256];
    float _2260 = trunc(_2232);
    float _2262 = precise::max(_2260, 0.0);
    uint _2264 = uint(_2262);
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2268 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2266;
    bool _2270 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2272 = isnan(_452);
    bool _2274 = _2270 || _2272;
    bool _2276 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2278 = _2274 || _2276;
    float _2280 = float(_2278);
    int _2282 = _2186 ? 0 : 1;
    float _2284 = _2268 * _2016;
    float _2286 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2288 = _452 + _2286;
    float _2290 = _2280 * _2238;
    int _2292 = ~_2282;
    int _2294 = _2292 + 1;
    int _2296 = _2294 + 1;
    float _2298 = -_2280;
    float _2300 = _2298 + 1.0;
    bool _2302 = uint(_2228) >= 2u;
    float _2304 = _2162 * _2290;
    int _2306 = _2296;
    if (!_2240)
    {
        int _2308 = ~_2282;
        int _2310 = _2308 + 1;
        _2306 = _2310;
    }
    int _2312 = _2306;
    float _2314 = fma(_2156, _2288, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2316 = _2228 != 3;
    float _2318 = fma(_2300, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2304);
    int _2320 = ~_500;
    int _2322 = _2320 + 1;
    float _2324 = fma(_2284, _1823, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2326 = int(_2088) + int(_2264);
    float _2328 = fma(_2314, _2234, _2318);
    bool _2330 = !_2230;
    int _2332 = _2330 ? 0 : 1;
    float _2334 = -_1776;
    float _2336 = _2334 + 1.0;
    int _2338 = abs(_2312);
    int _2340 = _2302 ? 0 : 1;
    float _2342 = _1874 * _1790;
    int _2344 = abs(_2332);
    int _2346 = ~_2338;
    int _2348 = _2346 + 1;
    int _2350 = _2348 + 1;
    int _2352 = _2322 * _2326;
    int _2354 = _2352 + _1988;
    int _2356 = ~_2340;
    int _2358 = _2356 + 1;
    int _2360 = _2358 + 1;
    float _2362 = fma(_2324, _2196, _2328);
    int _2364 = _2360;
    if (_2316)
    {
        int _2366 = ~_2340;
        int _2368 = _2366 + 1;
        _2364 = _2368;
    }
    int _2370 = _2364;
    float _2372 = _938 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2374 = ~_2344;
    int _2376 = _2374 + 1;
    int _2378 = _2376 + 1;
    float _2380 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2362);
    int _2382 = _2350 * as_type<int>(_2214);
    int _2384 = abs(_2370);
    bool _2386 = _2228 != 3;
    int _2388 = _2378 * as_type<int>(_2206);
    int _2390 = _2388 + _2382;
    bool _2392 = uint(_2354) >= uint(_500);
    float _2394 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2396 = int(_2394);
    float _2398 = as_type<float>(_2354);
    if (_1944)
    {
        float _2400 = in.m_55.x;
        _2398 = _2400;
    }
    float _2402 = _2398;
    bool _2404 = !_2386;
    int _2406 = _2404 ? 0 : (-1);
    float _2408 = _2380 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2410 = !_2392;
    int _2412 = _2410 ? 0 : (-1);
    int _2414 = ~_2384;
    int _2416 = _2414 + 1;
    int _2418 = _2416 + 1;
    int _2420 = abs(_2406);
    bool _2422 = !_2096;
    int _2424 = _2422 ? 0 : 1;
    int _2426 = ~_2326;
    int _2428 = _2426 + _2412;
    int _2430 = _2428 + 1;
    int _2432 = _2418 * as_type<int>(_2250);
    int _2434 = _2432 + _2390;
    int _2436 = abs(_2424);
    float _2438 = in.m_73.x;
    int _2440 = ~_2420;
    int _2442 = _2440 + 1;
    int _2444 = _2442 + 1;
    int _2446 = _500 * _2430;
    int _2448 = _2446 + _1988;
    bool _2450 = _882 != 0.0;
    bool _2452 = isnan(_882);
    bool _2454 = _2450 || _2452;
    bool _2456 = isnan(0.0);
    bool _2458 = _2454 || _2456;
    float _2460 = in.m_77.x;
    float _2462 = in.m_77.y;
    float _2464 = in.m_77.z;
    int _2466 = ~_2436;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    int _2472 = _2444 * as_type<int>(_2258);
    int _2474 = _2472 + _2434;
    float _2476 = float(uint(_2396));
    int _2478 = abs(_2396);
    int _2480 = _2474 * _2470;
    bool _2482 = _880 == 0.0;
    bool _2484 = !_2458;
    bool _2486 = _2482 && _2484;
    float _2488 = 1.0 / _2476;
    bool _2490 = _884 == 0.0;
    bool _2492 = _2490 && _2486;
    float _2494 = float(uint(_2478));
    bool _2496 = !_1819;
    int _2498 = _2496 ? _2448 : (-1);
    bool _2500 = _2402 > 0.5;
    bool _2502 = _2500 && _1944;
    float _2504 = 1.0 / _2494;
    int _2506 = _2498 * _2436;
    int _2508 = _2506 + _2480;
    float _2510 = _2402;
    if (_1944)
    {
        _2510 = _2438;
    }
    float _2512 = _2510;
    float _2514 = _2460;
    float _2516 = _2464;
    float _2518 = _2512;
    float _2520 = _2462;
    if (!_2492)
    {
        float _2522 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2460);
        _2514 = _2522;
    }
    float _2524 = _2514;
    if (!_1944)
    {
        _1054 = _2438;
    }
    float _2526 = _1054;
    float _2528 = _2526;
    if (!_2492)
    {
        float _2530 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2464);
        _2516 = _2530;
    }
    float _2532 = _2516;
    int _2534 = as_type<int>(_2488) + (-2);
    float _2536 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2538 = float(uint(_2508));
    if (_2502)
    {
        float _2540 = -_2512;
        float _2542 = _2540 + 1.0;
        _2518 = _2542;
    }
    float _2544 = _2518;
    int _2546 = abs(_2508);
    float _2548 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2550 = as_type<float>(_2534) * _2538;
    float _2552 = _938 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2554 = as_type<int>(_2504) + (-2);
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2558 = float(uint(_2546));
    float _2560 = trunc(_2550);
    float _2562 = precise::max(_2560, 0.0);
    uint _2564 = uint(_2562);
    float _2566 = _2556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1944)
    {
        _2528 = _2544;
    }
    float _2568 = _2528;
    float _2570 = as_type<float>(_2554) * _2558;
    int _2572 = ~_2396;
    int _2574 = _2572 + 1;
    float _2576 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2578 = ~_2478;
    int _2580 = _2578 + 1;
    if (!_2492)
    {
        float _2582 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2462);
        _2520 = _2582;
    }
    float _2584 = _2520;
    float _2586 = -_926;
    float _2588 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2552);
    float _2590 = trunc(_2570);
    float _2592 = precise::max(_2590, 0.0);
    uint _2594 = uint(_2592);
    float _2596 = _2576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2598 = _938 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2600 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2588);
    out.m_79.x = _2548;
    out.m_79.y = _2566;
    out.m_79.z = _2596;
    out.m_79.w = _2408;
    float _2602 = abs(_1362);
    float _2604 = log2(_2602);
    bool _2606 = _1362 <= 8000.0;
    bool _2608 = isnan(_1362);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan(8000.0);
    bool _2614 = _2610 || _2612;
    float _2616 = float(_2614);
    int _2618 = _2574 * int(_2564);
    int _2620 = _2618 + _2508;
    float _2622 = -_926;
    float _2624 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2372);
    float _2626 = -_926;
    float _2628 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2598);
    float _2630 = float(uint(_2620));
    float _2632 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2624);
    int _2634 = _2580 * int(_2594);
    int _2636 = _2634 + _2546;
    float _2638 = _946 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2640 = _946 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2642 = as_type<float>(_2534) * _2630;
    float _2644 = _946 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2646 = float(uint(_2636));
    float _2648 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2638);
    float _2650 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2640);
    float _2652 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2644);
    float _2654 = trunc(_2642);
    float _2656 = precise::max(_2654, 0.0);
    uint _2658 = uint(_2656);
    float _2660 = as_type<float>(_2554) * _2646;
    float _2662 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2628);
    float _2664 = _952 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2666 = _952 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2668 = _952 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2670 = _2662 * _2584;
    float _2672 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2674 = trunc(_2660);
    float _2676 = precise::max(_2674, 0.0);
    uint _2678 = uint(_2676);
    float _2680 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2664);
    float _2682 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2666);
    float _2684 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2668);
    int _2686 = ~_2396;
    int _2688 = _2686 + 1;
    float _2690 = _2600 * _2584;
    int _2692 = ~_2478;
    int _2694 = _2692 + 1;
    float _2696 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2648);
    float _2698 = exp2(_2672);
    int _2700 = int(_2564) + int(_2658);
    float _2702 = _2632 * _2584;
    float _2704 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2650);
    float _2706 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2680);
    int _2708 = _2688 * _2700;
    int _2710 = _2708 + _2508;
    int _2712 = int(_2594) + int(_2678);
    float _2714 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2682);
    float _2716 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2652);
    float _2718 = fma(_2696, _2524, _2690);
    bool _2720 = uint(_2710) >= uint(_2396);
    int _2722 = _2694 * _2712;
    int _2724 = _2722 + _2546;
    float _2726 = fma(_2716, _2524, _2670);
    float _2728 = fma(_2698, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2730 = precise::clamp(_2728, 0.0, 1.0);
    bool _2732 = !_2720;
    int _2734 = _2732 ? 0 : (-1);
    float _2736 = fma(_2704, _2524, _2702);
    bool _2738 = uint(_2724) >= uint(_2478);
    float _2740 = fma(_2706, _2532, _2718);
    int _2742 = _2508 ^ _2396;
    float _2744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2746 = ~_2700;
    int _2748 = _2746 + _2734;
    int _2750 = _2748 + 1;
    float _2752 = fma(_2714, _2532, _2736);
    bool _2754 = !_2738;
    int _2756 = _2754 ? 0 : (-1);
    float _2758 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2684);
    uint _2760 = uint(int(uint(_2742) >> uint(31)));
    bool _2762 = _2396 == 0;
    float _2764 = _1811 * _2342;
    bool _2766 = _2396 == 0;
    int _2768 = _2396 * _2750;
    int _2770 = _2768 + _2508;
    int _2772 = ~_2756;
    int _2774 = _2712 + _2772;
    int _2776 = _2774 + 1;
    float _2778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2780 = ~int(_2760);
    int _2782 = _2780 + 1;
    float _2784 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2786 = _2744 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2788 = _2776 ^ _2782;
    float _2790 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2784);
    float _2792 = fma(_2758, _2532, _2726);
    float _2794 = fma(_2730, -2.0, 3.0);
    float _2796 = _2730 * _2730;
    int _2798 = ~_2782;
    int _2800 = _2798 + _2788;
    int _2802 = _2800 + 1;
    float _2804 = fma(_2786, _2568, -0.5);
    float _2806 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2790);
    float _2808 = _2796 * _2794;
    bool _2810 = !_2762;
    int _2812 = _2810 ? _2770 : (-1);
    out.m_81.x = _2740;
    out.m_81.y = _2752;
    out.m_81.z = _2792;
    bool _2814 = !_2766;
    int _2816 = _2814 ? _2802 : (-1);
    float _2818 = -_2808;
    float _2820 = _2818 + 1.0;
    float _2822 = float(_2812);
    float _2824 = _2778 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2826 = float(_2816);
    float _2828 = fma(_2820, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2808);
    bool _2830 = _1504 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2832 = isnan(_1504);
    bool _2834 = _2830 || _2832;
    bool _2836 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2838 = _2834 || _2836;
    float _2840 = fma(_2824, _2150, -0.5);
    float _2842 = fma(_2786, _2822, _628);
    float _2844 = -_644;
    float _2846 = fma(_2824, _2826, _2844);
    float _2848 = _2616 * _2828;
    float _2850 = _1706 * 0.5;
    float _2852 = fma(_630, _2804, _2842);
    float _2854 = fma(_632, _2840, _2846);
    float _2856 = _2848 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2858 = in.m_83.x;
    float _2860 = fma(_1756, -0.5, _2850);
    float _2862 = _2852 + 0.5;
    float _2864 = _2336 * _2856;
    float _2866 = precise::clamp(_2864, 0.0, 1.0);
    float _2868 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2806);
    float _2870 = _2854 + 0.5;
    float _2872 = _1750 + _1706;
    float _2874 = -_2866;
    float _2876 = fma(_2874, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2878 = _1801 * _2342;
    out.gl_Position.x = _1750;
    out.gl_Position.y = _1756;
    out.gl_Position.z = _2868;
    out.gl_Position.w = _1706;
    float _2880 = fma(_1801, _2764, _1799);
    float _2882 = _2868 + _1706;
    out.m_85.x = _2862;
    out.m_85.y = _2870;
    float _2884 = _2872 * 0.5;
    float _2886 = _2882 * 0.5;
    out.m_87.x = _2884;
    out.m_87.y = _2860;
    out.m_87.z = _2886;
    out.m_87.w = _1706;
    float _2888 = _2876 * _2858;
    float _2890 = -_1874;
    float _2892 = _2890 + 1.0;
    float _2894 = fma(_1807, _2878, _1795);
    float _2896 = fma(_1809, _2878, _1797);
    float _2898 = _2888 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2900 = _1801 * _2892;
    float _2902 = _1416 * _1470;
    float _2904 = _2868;
    float _2906 = _2884;
    float _2908 = _2892;
    float _2910 = _2902;
    if (!_2838)
    {
        _2144 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2912 = _2144;
    out.m_89.x = _2898;
    float _2914 = _2912;
    float _2916 = _2912;
    if (!_2838)
    {
        _2904 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2918 = _2904;
    float _2920 = _2902 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2922 = _2918;
    float _2924 = _2918;
    if (!_2838)
    {
        _2906 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2926 = _2906;
    out.m_91.x = _2894;
    out.m_91.y = _2896;
    out.m_91.z = _2880;
    out.m_91.w = _2900;
    float _2928 = _2926;
    float _2930 = _2926;
    if (!_2838)
    {
        _2146 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2932 = _2146;
    float _2934 = _2932;
    float _2936 = _2932;
    if (!_2838)
    {
        _2908 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2938 = _2908;
    float _2940 = _2938;
    float _2942 = _2938;
    if (!_2838)
    {
        _2910 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2944 = _2910;
    bool _2946 = !_2838;
    float _2948 = _2944;
    float _2950 = _2944;
    if (!_2946)
    {
        bool _2952 = _1504 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2954 = isnan(_1504);
        bool _2956 = _2952 || _2954;
        bool _2958 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2960 = _2956 || _2958;
        if (!_2960)
        {
            float _2962 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2964 = _1504 + _2962;
            float _2966 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2968 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2966;
            float _2970 = 1.0 / _2968;
            float _2972 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2974 = _2972 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2976 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2978 = _2976 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2980 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2982 = _2980 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2986 = _2984 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2990 = _2988 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2992 = _2964 * _2970;
            float _2994 = precise::clamp(_2992, 0.0, 1.0);
            float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2998 = _2996 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3000 = fma(_2994, _2974, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3002 = fma(_2994, _2998, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3004 = fma(_2994, _2978, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3006 = fma(_2994, _2982, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3008 = fma(_2994, _2986, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3010 = fma(_2994, _2990, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2916 = _3002;
            _2942 = _3008;
            _2930 = _3000;
            _2936 = _3006;
            _2924 = _3004;
            _2950 = _3010;
            _3012 = true;
        }
        else
        {
            bool _3014 = _1504 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3016 = isnan(_1504);
            bool _3018 = _3014 || _3016;
            bool _3020 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3022 = _3018 || _3020;
            if (!_3022)
            {
                _2928 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3024 = _2928;
            _2930 = _3024;
            if (!_3022)
            {
                _2914 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3026 = _2914;
            _2916 = _3026;
            if (!_3022)
            {
                _2922 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3028 = _2922;
            _2924 = _3028;
            if (!_3022)
            {
                _2934 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3030 = _2934;
            _2936 = _3030;
            if (!_3022)
            {
                _2940 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3032 = _2940;
            _2942 = _3032;
            if (!_3022)
            {
                _2948 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3034 = _2948;
            bool _3036 = !_3022;
            _2950 = _3034;
            if (!_3036)
            {
                bool _3038 = _1504 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3040 = isnan(_1504);
                bool _3042 = _3038 || _3040;
                bool _3044 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3046 = _3042 || _3044;
                if (!_3046)
                {
                    float _3048 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3050 = _1504 + _3048;
                    float _3052 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3054 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3052;
                    float _3056 = 1.0 / _3054;
                    float _3058 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3062 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3066 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3068 = _3066 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3070 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3072 = _3070 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3074 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3076 = _3074 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3078 = _3050 * _3056;
                    float _3080 = precise::clamp(_3078, 0.0, 1.0);
                    float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3084 = _3082 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3086 = fma(_3080, _3060, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3088 = fma(_3080, _3084, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3090 = fma(_3080, _3064, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3092 = fma(_3080, _3068, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3094 = fma(_3080, _3072, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3096 = fma(_3080, _3076, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2916 = _3088;
                    _2942 = _3094;
                    _2930 = _3086;
                    _2936 = _3092;
                    _2924 = _3090;
                    _2950 = _3096;
                    _3012 = true;
                }
                else
                {
                    _2916 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2942 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2930 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2936 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2924 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2950 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3012 = false;
    float _3098 = _2916;
    float _3100 = _2942;
    float _3102 = _2930;
    float _3104 = _2936;
    float _3106 = _2924;
    float _3108 = _2950;
    float _3110 = _2920 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3112 = fma(_2752, -0.5, 0.5);
    float _3114 = precise::clamp(_3112, 0.0, 1.0);
    float _3116 = -_3098;
    float _3118 = _3116 + _3100;
    float _3120 = -_3102;
    float _3122 = _3120 + _3104;
    out.m_49.x = _3110;
    float _3124 = fma(_3114, _3118, _3098);
    float _3126 = -_3106;
    float _3128 = _3126 + _3108;
    float _3130 = fma(_3114, _3122, _3102);
    float _3132 = _3124 * 0.586610972881317138671875;
    bool _3134 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3136 = fma(_3114, _3128, _3106);
    out.m_93.x = 0.0;
    float _3138 = fma(_3130, 0.298911988735198974609375, _3132);
    bool _3140 = _1416 > 0.0;
    bool _3142 = isnan(_1416);
    bool _3144 = _3140 || _3142;
    bool _3146 = isnan(0.0);
    bool _3148 = _3144 || _3146;
    float _3150 = fma(_3136, 0.114477999508380889892578125, _3138);
    bool _3152 = _1470 <= 0.0;
    bool _3154 = !_3148;
    bool _3156 = _3152 || _3154;
    float _3158 = -_3150;
    float _3160 = _3130 + _3158;
    float _3162 = -_3150;
    float _3164 = _3124 + _3162;
    float _3166 = -_3150;
    float _3168 = _3136 + _3166;
    float _3170 = fma(_3160, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3150);
    float _3172 = fma(_3164, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3150);
    float _3174 = fma(_3168, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3150);
    bool _3176 = !_3134;
    if (!_3176)
    {
        float _3178 = -_1352;
        float _3180 = _3178 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3182 = -_1354;
        float _3184 = _3182 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3186 = -_1356;
        float _3188 = _3186 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3190 = _3180 * _3180;
        float _3192 = fma(_3184, _3184, _3190);
        float _3194 = fma(_3188, _3188, _3192);
        float _3196 = sqrt(_3194);
        float _3198 = rsqrt(_3194);
        float _3200 = -_3196;
        float _3202 = _3200 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3204 = _3202 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3206 = precise::clamp(_3204, 0.0, 1.0);
        float _3208 = _3184 * _3198;
        float _3210 = _3180 * _3198;
        float _3212 = abs(_3206);
        float _3214 = log2(_3212);
        float _3216 = _3188 * _3198;
        float _3218 = _3208 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3220 = _2752 * _3210;
        float _3222 = -_3210;
        float _3224 = -_3218;
        float _3226 = fma(_3222, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3224);
        float _3228 = fma(_2740, _3208, _3220);
        float _3230 = -_3216;
        float _3232 = fma(_3230, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3226);
        float _3234 = fma(_2792, _3216, _3228);
        float _3236 = precise::clamp(_3234, 0.0, 1.0);
        float _3238 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3240 = _3232 + _3238;
        float _3242 = _3214 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3244 = _3240 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3246 = precise::clamp(_3244, 0.0, 1.0);
        float _3248 = exp2(_3242);
        float _3250 = _3248 * _3246;
        float _3252 = _3236 * _3250;
        float _3254 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3256 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3258 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3254;
        out.m_93.y = _3256;
        out.m_93.z = _3258;
    }
    out.m_67.x = _3170;
    out.m_67.y = _3172;
    out.m_67.z = _3174;
    if (!_3156)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3260 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3260;
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
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3012 = false;
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
        float _3317 = as_type<float>(_128);
        out.gl_Position.z = _3317;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3387 = as_type<float>(_166);
        out.gl_Position.z = _3387;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _390 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
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
        float _428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _430 = _426 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _432 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
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
    float _454 = in.m_55.x;
    float _456 = in.m_55.y;
    float _458 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _460 = log2(_458);
    float _462 = _314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _464 = in.m_46.x;
    float _466 = in.m_46.y;
    float _468 = in.m_46.z;
    float _470 = _316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _472 = in.m_55.z;
    float _474 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _476 = int(_474);
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _480 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _482 = isnan(0.0);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _488 = _484 || _486;
    float _490 = _462 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _492 = _318 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _494 = _460 * _146;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _498 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _500 = int(_498);
    float _502 = _454 * 2.0;
    float _504 = _454 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _506 = _456 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _508 = exp2(_494);
    float _510 = _456 * 2.0;
    float _512 = -_496;
    float _514 = fma(_504, 2.0, _512);
    float _516 = fma(_506, -2.0, _478);
    float _518 = _466 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _520 = _466 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _522 = _466 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _524 = _456 + _454;
    float _526 = floor(_502);
    float _528 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[4].x, _518);
    float _530 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[5].x, _520);
    float _532 = fma(_464, (*spvDescriptorSet0.vp_c10)._m0[6].x, _522);
    float _534 = _524 + (-1.0);
    float _536 = _456 + _472;
    float _538 = _472 * 2.0;
    float _540 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _542 = _536 + (-1.0);
    float _544 = floor(_538);
    float _546 = float(_476);
    float _548 = -_508;
    float _550 = _548 + 1.0;
    bool _552 = _526 > 0.0;
    bool _554 = _526 >= 0.0;
    bool _556 = isnan(_526);
    bool _558 = _554 || _556;
    bool _560 = isnan(0.0);
    bool _562 = _558 || _560;
    float _564 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _568 = 1.0 + _566;
    float _570 = floor(_510);
    bool _572 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _574 = isnan(1.0);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _580 = _576 || _578;
    float _582 = _488 ? _550 : 0.0;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _588 = 1.0 / _546;
    bool _590 = _544 > 0.0;
    bool _592 = _544 >= 0.0;
    bool _594 = isnan(_544);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    float _602 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[78].z, _584);
    float _604 = float(_500);
    float _606 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[78].w, _586);
    int _608 = _562 ? 0 : 1;
    float _610 = 1.0 / _568;
    bool _612 = _570 > 0.0;
    float _614 = _604 * _146;
    bool _616 = _570 >= 0.0;
    bool _618 = isnan(_570);
    bool _620 = _616 || _618;
    bool _622 = isnan(0.0);
    bool _624 = _620 || _622;
    float _626 = -_146;
    float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[76].x, _514);
    float _630 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _602);
    float _632 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _606);
    int _634 = _624 ? 0 : 1;
    float _636 = _588 * _146;
    int _638 = ~_608;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    float _644 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _516);
    int _646 = _642;
    if (!_552)
    {
        int _648 = ~_608;
        int _650 = _648 + 1;
        _646 = _650;
    }
    int _652 = _646;
    float _654 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[5].z, _530);
    float _656 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
    float _658 = fma(_468, (*spvDescriptorSet0.vp_c10)._m0[6].z, _532);
    int _660 = ~_634;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    int _666 = _664;
    if (_580)
    {
        float _668 = _582 * _610;
        _148 = _668;
    }
    float _670 = _148;
    int _672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _674 = _672 != 0;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _682 = _680 != 0;
    float _684 = _654 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (!_612)
    {
        int _686 = ~_634;
        int _688 = _686 + 1;
        _666 = _688;
    }
    int _690 = _666;
    float _692 = _656 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _694 = in.m_61.x;
    float _696 = in.m_61.y;
    float _698 = in.m_61.z;
    bool _700 = !_678;
    int _702 = _700 ? 0 : 1;
    float _704 = _658 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _706 = !_674;
    int _708 = _706 ? 0 : 1;
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _712 = _692 + _710;
    bool _714 = !_682;
    int _716 = _714 ? 0 : 1;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _720 = _718 != 0;
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _724 = _722 != 0;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _728 = _726 != 0;
    float _730 = float(_652);
    int _732 = _600 ? 0 : 1;
    bool _734 = !_720;
    int _736 = _734 ? 0 : 1;
    bool _738 = !_724;
    int _740 = _738 ? 0 : 1;
    int _742 = abs(_736);
    float _744 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _746 = _684 + _744;
    int _748 = abs(_740);
    int _750 = ~_732;
    int _752 = _750 + 1;
    int _754 = _752 + 1;
    float _756 = _746 * _746;
    float _758 = float(_748);
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _762 = _704 + _760;
    int _764 = _754;
    if (!_590)
    {
        int _766 = ~_732;
        int _768 = _766 + 1;
        _764 = _768;
    }
    int _770 = _764;
    float _772 = fma(_712, _712, _756);
    float _774 = _758 * _730;
    float _776 = float(_742);
    float _778 = fma(_762, _762, _772);
    float _780 = float(_770);
    float _782 = _774 * (-2.0);
    float _784 = _456 + (-0.5);
    float _786 = sqrt(_778);
    bool _788 = !_728;
    int _790 = _788 ? 0 : 1;
    float _792 = fma(_782, _696, _696);
    float _794 = fma(_564, _782, _564);
    float _796 = _776 * _780;
    int _798 = abs(_790);
    float _800 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[196].y, _792);
    float _802 = _472 + _454;
    float _804 = rsqrt(_778);
    float _806 = float(_690);
    float _808 = _796 * (-2.0);
    float _810 = float(_798);
    float _812 = _802 + (-1.0);
    float _814 = _472 + (-0.5);
    float _816 = fma(_808, _694, _694);
    float _818 = fma(_540, _808, _540);
    float _820 = _786 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _822 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _824 = _810 * _806;
    float _826 = _454 + (-0.5);
    float _828 = fma(_794, _670, _800);
    float _830 = precise::min(_490, _820);
    float _832 = _824 * (-2.0);
    float _834 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[196].x, _816);
    float _836 = _828 * 0.15915493667125701904296875;
    float _838 = _804 * _830;
    float _840 = fma(_822, _832, _822);
    float _842 = fma(_832, _698, _698);
    float _844 = fma(_818, _670, _834);
    float _846 = _746 * _838;
    float _848 = _762 * _838;
    float _850 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[196].z, _842);
    float _852 = _712 * _838;
    float _854 = -_846;
    float _856 = _746 + _854;
    float _858 = -_848;
    float _860 = _762 + _858;
    float _862 = fma(_840, _670, _850);
    float _864 = -_852;
    float _866 = _712 + _864;
    float _868 = _856 * _856;
    float _870 = _844 * 0.15915493667125701904296875;
    float _872 = _862 * 0.15915493667125701904296875;
    float _874 = _836 * 6.283185482025146484375;
    float _876 = sin(_874);
    float _878 = fma(_866, _866, _868);
    float _880 = in.m_63.x;
    float _882 = in.m_63.y;
    float _884 = in.m_63.z;
    float _886 = fma(_860, _860, _878);
    float _888 = _836 * 6.283185482025146484375;
    float _890 = cos(_888);
    float _892 = sqrt(_886);
    float _894 = _870 * 6.283185482025146484375;
    float _896 = sin(_894);
    float _898 = _870 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = _804 * _892;
    float _904 = _470 * _902;
    float _906 = _462 * _902;
    float _908 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _882);
    float _910 = _872 * 6.283185482025146484375;
    float _912 = cos(_910);
    float _914 = _896 * _876;
    float _916 = _896 * _890;
    float _918 = _904 * _908;
    float _920 = _492 * _902;
    float _922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _884);
    float _924 = _872 * 6.283185482025146484375;
    float _926 = sin(_924);
    float _928 = _900 * _890;
    float _930 = _900 * _876;
    float _932 = _920 * _922;
    float _934 = _896 * _912;
    float _936 = _890 * _912;
    float _938 = _900 * _912;
    float _940 = _876 * _912;
    float _942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _880);
    float _944 = _938 * _918;
    float _946 = fma(_926, _928, _914);
    float _948 = _906 * _942;
    float _950 = -_916;
    float _952 = fma(_926, _930, _950);
    float _954 = -_918;
    float _956 = _926 * _954;
    float _958 = -_930;
    float _960 = fma(_926, _916, _958);
    float _962 = fma(_946, _948, _944);
    float _964 = _934 * _918;
    float _966 = fma(_936, _948, _956);
    float _968 = fma(_926, _914, _928);
    float _970 = fma(_952, _932, _962);
    float _972 = fma(_960, _948, _964);
    float _974 = fma(_940, _932, _966);
    float _976 = _970 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _978 = fma(_968, _932, _972);
    float _980 = _970 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _982 = _970 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _984 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[26].x, _976);
    float _986 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[24].x, _980);
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[26].z, _984);
    float _990 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[24].z, _986);
    float _992 = _988 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _994 = _990 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _996 = _704 + _992;
    float _998 = _692 + _994;
    float _1000 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1002 = _996 + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1006 = _998 + _1004;
    float _1008 = _1002 * _1002;
    float _1010 = fma(_1006, _1006, _1008);
    float _1012 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[25].x, _982);
    float _1014 = -_846;
    float _1016 = _684 + _1014;
    float _1018 = -_852;
    float _1020 = _692 + _1018;
    float _1022 = sqrt(_1010);
    float _1024 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1012);
    float _1026 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1028 = -_848;
    float _1030 = _704 + _1028;
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1034 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1026);
    float _1036 = _684 + _1032;
    float _1038 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1034);
    bool _1040 = _1022 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = _1032;
    float _1044 = _998;
    float _1046 = _1034;
    float _1048 = _848;
    float _1050 = _846;
    float _1052 = _852;
    float _1054 = _880;
    if (!_1040)
    {
        _1042 = _998;
    }
    float _1056 = _1042;
    float _1058 = _1056;
    if (!_1040)
    {
        _1044 = _996;
    }
    float _1060 = _1044;
    float _1062 = _1060;
    if (!_1040)
    {
        _1046 = _1036;
    }
    float _1064 = _1046;
    bool _1066 = !_1040;
    float _1068 = _1064;
    if (!_1066)
    {
        float _1070 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1072 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1074 = _1022 + _1072;
        float _1076 = rsqrt(_1010);
        float _1078 = _1074 * _1070;
        float _1080 = _1036 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1082 = _1078 * 0.15915493667125701904296875;
        float _1084 = _1082 * 6.283185482025146484375;
        float _1086 = cos(_1084);
        float _1088 = _1082 * 6.283185482025146484375;
        float _1090 = sin(_1088);
        float _1092 = _1086 + (-1.0);
        float _1094 = fma(_1090, _1080, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1096 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = _1076 * _1094;
        float _1100 = fma(_1036, _1086, _1096);
        float _1102 = fma(_1006, _1098, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1104 = fma(_1002, _1098, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1068 = _1100;
        _1058 = _1102;
        _1062 = _1104;
    }
    float _1106 = _1068;
    float _1108 = _1058;
    float _1110 = _1062;
    float _1112 = -_684;
    float _1114 = _1112 + _1106;
    float _1116 = -_692;
    float _1118 = _1116 + _1108;
    float _1120 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1122 = -_704;
    float _1124 = _1122 + _1110;
    float _1126 = _1114 * _1114;
    float _1128 = 1.0 / _1120;
    float _1130 = fma(_1118, _1118, _1126);
    float _1132 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1134 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1136 = isnan(0.5);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1142 = _1138 || _1140;
    float _1144 = fma(_1124, _1124, _1130);
    float _1146 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1132);
    bool _1148 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1150 = isnan(0.5);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1156 = _1152 || _1154;
    float _1158 = sqrt(_1144);
    float _1160 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1146);
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1164 = _1162 + _1120;
    float _1166 = -_846;
    float _1168 = _1166 + _1106;
    float _1170 = _1164 * _1128;
    float _1172 = _1170 * 0.5;
    float _1174 = -_852;
    float _1176 = _1174 + _1108;
    float _1178 = -_848;
    float _1180 = _1178 + _1110;
    bool _1182 = _1158 > 0.0;
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1186 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1184);
    float _1188 = 1.0 / _1186;
    float _1190 = _1158;
    float _1192 = _1106;
    float _1194 = _1186;
    float _1196 = _1168;
    float _1198 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1200 = _1180;
    if (!_1182)
    {
        _1048 = _1176;
    }
    float _1202 = _1048;
    float _1204 = _1202;
    if (!_1182)
    {
        _1050 = _1168;
    }
    float _1206 = _1050;
    float _1208 = _1206;
    if (!_1182)
    {
        _1190 = _1180;
    }
    float _1210 = _1190;
    bool _1212 = !_1182;
    float _1214 = _1210;
    float _1216 = _1210;
    if (!_1212)
    {
        float _1218 = _190 * _190;
        float _1220 = fma(_188, _188, _1218);
        float _1222 = fma(_192, _192, _1220);
        float _1224 = rsqrt(_1144);
        float _1226 = sqrt(_1222);
        float _1228 = _1114 * _1224;
        float _1230 = _1118 * _1224;
        float _1232 = _1124 * _1224;
        bool _1234 = _1226 > 0.0;
        float _1236 = _1226;
        float _1238 = _1224;
        _1052 = _1222;
        _1192 = _1230;
        _1194 = _1228;
        if (!_1234)
        {
            _1236 = _1176;
        }
        float _1240 = _1236;
        _1204 = _1240;
        if (!_1234)
        {
            _1238 = _1168;
        }
        float _1242 = _1238;
        _1208 = _1242;
        if (!_1234)
        {
            _1214 = _1180;
        }
        float _1244 = _1214;
        bool _1246 = !_1234;
        _1216 = _1244;
        if (!_1246)
        {
            float _1248 = rsqrt(_1222);
            float _1250 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1252 = _190 * _1248;
            float _1254 = _188 * _1248;
            float _1256 = _192 * _1248;
            float _1258 = _1228 * _1252;
            float _1260 = fma(_1230, _1254, _1258);
            float _1262 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1264 = fma(_1232, _1256, _1260);
            float _1266 = _1264 * _1262;
            float _1268 = fma(_188, _1266, _1176);
            float _1270 = fma(_190, _1266, _1168);
            float _1272 = fma(_192, _1266, _1180);
            _1204 = _1268;
            _1208 = _1270;
            _1216 = _1272;
        }
    }
    float _1274 = _1204;
    float _1276 = _1208;
    float _1278 = _1216;
    float _1280 = _1052;
    float _1282 = _1192;
    float _1284 = _1194;
    float _1286 = _1284;
    float _1288 = _1276;
    float _1290 = _1274;
    float _1292 = _1278;
    float _1294 = _1280;
    float _1296 = _1282;
    if (_1156)
    {
        _1286 = 1.0;
    }
    float _1298 = _1286;
    float _1300 = _1298;
    if (!_1142)
    {
        float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1304 = _1016 + _1302;
        float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1308 = _1020 + _1306;
        float _1310 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1312 = _1304 * _1304;
        float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1316 = _1030 + _1314;
        float _1318 = fma(_1308, _1308, _1312);
        float _1320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1322 = fma(_1316, _1316, _1318);
        float _1324 = sqrt(_1322);
        float _1326 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1328 = precise::min(_1324, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1330 = _1328 * _1320;
        float _1332 = -_1020;
        float _1334 = _1332 + _1274;
        float _1336 = _1326 * _1330;
        float _1338 = -_1016;
        float _1340 = _1338 + _1276;
        float _1342 = -_1030;
        float _1344 = _1342 + _1278;
        float _1346 = fma(_1334, _1336, _1020);
        float _1348 = fma(_1340, _1336, _1016);
        float _1350 = fma(_1344, _1336, _1030);
        _1288 = _1348;
        _1290 = _1346;
        _1292 = _1350;
    }
    float _1352 = _1288;
    float _1354 = _1290;
    float _1356 = _1292;
    if (_1156)
    {
        _1196 = 1.0;
    }
    float _1358 = _1196;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1362 = _1188 * _1360;
    float _1364 = _1358;
    if (!_1156)
    {
        float _1366 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1368 = _1366 * 0.15915493667125701904296875;
        float _1370 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1372 = _1368 * 6.283185482025146484375;
        float _1374 = cos(_1372);
        float _1376 = _1370 * 0.15915493667125701904296875;
        float _1378 = _1368 * 6.283185482025146484375;
        float _1380 = sin(_1378);
        float _1382 = 1.0 / _1374;
        float _1384 = _1376 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        float _1388 = _1380 * _1382;
        float _1390 = _1376 * 6.283185482025146484375;
        float _1392 = sin(_1390);
        float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1396 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1394;
        float _1398 = _1386 * _1388;
        float _1400 = 1.0 / _1396;
        float _1402 = 1.0 / _1398;
        float _1404 = _1392 * _1402;
        float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1408 = fma(_1362, _1404, _1406);
        float _1410 = _1408 * _1400;
        float _1412 = precise::clamp(_1410, 0.0, 1.0);
        _1294 = _1368;
        _1300 = _1412;
    }
    float _1414 = _1294;
    float _1416 = _1300;
    if (!_1156)
    {
        float _1418 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1420 = _1418 * 0.15915493667125701904296875;
        float _1422 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1424 = _1420 * 6.283185482025146484375;
        float _1426 = cos(_1424);
        float _1428 = _1422 * 0.15915493667125701904296875;
        float _1430 = _1420 * 6.283185482025146484375;
        float _1432 = sin(_1430);
        float _1434 = 1.0 / _1426;
        float _1436 = _1428 * 6.283185482025146484375;
        float _1438 = cos(_1436);
        float _1440 = _1432 * _1434;
        float _1442 = _1428 * 6.283185482025146484375;
        float _1444 = sin(_1442);
        float _1446 = _1438 * _1440;
        float _1448 = 1.0 / _1446;
        float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1452 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1450;
        float _1454 = 1.0 / _1452;
        float _1456 = _1444 * _1448;
        float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1460 = fma(_1362, _1456, _1458);
        float _1462 = _1460 * _1454;
        float _1464 = precise::clamp(_1462, 0.0, 1.0);
        float _1466 = -_1464;
        float _1468 = _1466 + 1.0;
        _1364 = _1468;
    }
    float _1470 = _1364;
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1474 = _1352 + _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1478 = _1354 + _1476;
    float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1482 = _1356 + _1480;
    float _1484 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1486 = _1474 * _1474;
    float _1488 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1490 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1484);
    float _1492 = fma(_1478, _1478, _1486);
    float _1494 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1488);
    float _1496 = fma(_1482, _1482, _1492);
    float _1498 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1494);
    float _1500 = rsqrt(_1496);
    float _1502 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1504 = sqrt(_1496);
    float _1506 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1508 = _1478 * _1506;
    float _1510 = _1482 * _1506;
    float _1512 = _1508 * _1508;
    float _1514 = _1510 * _1510;
    float _1516 = _1512 + _1514;
    float _1518 = sqrt(_1516);
    bool _1520 = _1518 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1524 = _1518 + _1522;
    float _1526 = _1486;
    float _1528 = _1516;
    float _1530 = _1524;
    float _1532 = _1508;
    float _1534 = _1510;
    float _1536 = _1512;
    if (_1520)
    {
        float _1538 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1526 = _1538;
    }
    float _1540 = _1526;
    if (_1520)
    {
        float _1542 = rsqrt(_1516);
        _1528 = _1542;
    }
    float _1544 = _1528;
    float _1546 = _1544;
    if (_1520)
    {
        float _1548 = _1524 * _1540;
        _1530 = _1548;
    }
    float _1550 = _1530;
    if (_1520)
    {
        float _1552 = _1550 * 0.15915493667125701904296875;
        _1198 = _1552;
    }
    float _1554 = _1198;
    float _1556 = _1540;
    if (_1520)
    {
        float _1558 = _1554 * 6.283185482025146484375;
        float _1560 = sin(_1558);
        _1556 = _1560;
    }
    float _1562 = _1556;
    float _1564 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1566 = precise::max(0.0, _1564);
    float _1568 = _1414;
    if (_1520)
    {
        float _1570 = _1554 * 6.283185482025146484375;
        float _1572 = cos(_1570);
        _1568 = _1572;
    }
    float _1574 = _1568;
    float _1576 = -_1506;
    float _1578 = -_1566;
    float _1580 = fma(_1474, _1576, _1578);
    if (_1520)
    {
        float _1582 = _1580 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1200 = _1582;
    }
    float _1584 = _1200;
    float _1586 = fma(_1020, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1588 = _1562;
    float _1590 = _1584;
    if (_1520)
    {
        float _1592 = fma(_1562, _1584, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1296 = _1592;
    }
    float _1594 = _1296;
    float _1596 = _1594;
    if (!_1520)
    {
        _1588 = _1580;
    }
    float _1598 = _1588;
    float _1600 = floor(_1586);
    float _1602 = _1598;
    float _1604 = _1574;
    if (_1520)
    {
        float _1606 = _1574 + (-1.0);
        _1590 = _1606;
    }
    float _1608 = _1590;
    if (_1520)
    {
        float _1610 = _1544 * _1594;
        _1596 = _1610;
    }
    float _1612 = _1596;
    if (_1520)
    {
        float _1614 = _1608 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1546 = _1614;
    }
    float _1616 = _1546;
    if (_1520)
    {
        float _1618 = _1508 * _1612;
        _1532 = _1618;
    }
    float _1620 = _1532;
    if (_1520)
    {
        float _1622 = _1510 * _1612;
        _1534 = _1622;
    }
    float _1624 = _1534;
    if (_1520)
    {
        float _1626 = fma(_1580, _1574, _1616);
        _1602 = _1626;
    }
    float _1628 = _1602;
    if (_1520)
    {
        float _1630 = _1620 * _1620;
        _1536 = _1630;
    }
    float _1632 = _1536;
    if (!_1520)
    {
        _1604 = _1514;
    }
    float _1634 = _1604;
    float _1636 = _1634;
    if (_1520)
    {
        float _1638 = _1624 * _1624;
        _1636 = _1638;
    }
    float _1640 = _1636;
    float _1642 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1644 = fma(_1628, _1628, _1632);
    float _1646 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1642);
    float _1648 = _1644 + _1640;
    float _1650 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1652 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1654 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1646);
    float _1656 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1490);
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1660 = fma(_1504, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1658);
    float _1662 = precise::clamp(_1660, 0.0, 1.0);
    float _1664 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1652);
    float _1666 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1668 = rsqrt(_1648);
    float _1670 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1672 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1664);
    float _1674 = -_1662;
    float _1676 = _1674 + 1.0;
    float _1678 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1680 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1682 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1684 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1686 = -_1678;
    float _1688 = fma(_1686, _1650, 1.0);
    float _1690 = abs(_1676);
    float _1692 = log2(_1690);
    float _1694 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1682);
    float _1696 = fma(_1030, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1698 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1694);
    float _1700 = _1668 * _1620;
    float _1702 = _1668 * _1628;
    float _1704 = floor(_1696);
    float _1706 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1698);
    float _1708 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1710 = _1668 * _1624;
    float _1712 = -_1600;
    float _1714 = _1586 + _1712;
    float _1716 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1718 = -_1708;
    float _1720 = fma(_1702, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1718);
    float _1722 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1724 = log2(_1688);
    float _1726 = -_1710;
    float _1728 = fma(_1726, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1720);
    float _1730 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1716);
    float _1732 = fma(_1728, -0.5, 0.5);
    float _1734 = fma(_1728, 0.5, 0.5);
    float _1736 = -_1704;
    float _1738 = _1696 + _1736;
    float _1740 = 1.0 / _1706;
    float _1742 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1684);
    float _1744 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1730);
    float _1746 = fma(_1734, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1748 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1742);
    float _1750 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1744);
    float _1752 = fma(_1734, _1746, -0.212114393711090087890625);
    float _1754 = exp2(_1722);
    float _1756 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1748);
    float _1758 = _1724 * 0.693147182464599609375;
    float _1760 = fma(_1734, _1752, 1.570728778839111328125);
    float _1762 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1764 = sqrt(_1732);
    float _1766 = _1702 + 1.0;
    float _1768 = _1750 * _1740;
    float _1770 = _1756 * _1740;
    float _1772 = -_1702;
    float _1774 = fma(_1754, _1766, _1772);
    float2 _5889 = float2(_1714, _1738);
    float _1776 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5889, float2(0.0), isnan(_5889)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5889, float2(0.0), isnan(_5889)), level(0.0)).x;
    float _1778 = fma(_1774, 0.5, 0.5);
    float _1780 = _1764 * 0.636619746685028076171875;
    float _1782 = fma(_1768, 0.5, 0.5);
    float _1784 = fma(_1770, -0.5, 0.5);
    float _1786 = -_1760;
    float _1788 = fma(_1780, _1786, 1.0);
    float3 _5914 = float3(_1782, _1784, _1762);
    float _1790 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5914, float3(0.0), isnan(_5914)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5914, float3(0.0), isnan(_5914)), level(0.0)).x;
    float3 _5925 = float3(_1782, _1784, _1762);
    float4 _1793 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5925, float3(0.0), isnan(_5925)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5925, float3(0.0), isnan(_5925)), level(0.0)).xyzw;
    float _1795 = _1793.x;
    float _1797 = _1793.y;
    float _1799 = _1793.z;
    float _1801 = _1793.w;
    float2 _5941 = float2(_1788, _1778);
    float3 _1805 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5941, float2(0.0), isnan(_5941)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5941, float2(0.0), isnan(_5941)), level(0.0)).xyz;
    float _1807 = _1805.x;
    float _1809 = _1805.y;
    float _1811 = _1805.z;
    float _1813 = float(uint(_500));
    float _1815 = trunc(_636);
    int _1817 = int(_1815);
    bool _1819 = _500 == 0;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1823 = _452 + _1821;
    int _1825 = abs(_708);
    out.m_65.x = _1020;
    out.m_65.y = _1016;
    out.m_65.z = _1030;
    int _1827 = abs(_716);
    float _1829 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1831 = _456 > 0.5;
    float _1833 = 1.0 / _1813;
    out.m_67.w = _830;
    out.m_69.x = _906;
    float _1835 = float(uint(_1817));
    float _1837 = exp2(_1829);
    int _1839 = ~_500;
    int _1841 = _1839 + 1;
    out.m_71.x = _1354;
    out.m_71.y = _1352;
    out.m_71.z = _1356;
    int _1843 = ~_500;
    int _1845 = _1843 + 1;
    int _1847 = as_type<int>(_1833) + (-2);
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1851 = _1849 != 0;
    float _1853 = as_type<float>(_1847) * _1835;
    bool _1855 = !_1851;
    float _1857 = _1855 ? 7.345489978790283203125 : 1.0;
    float _1859 = -_1837;
    float _1861 = _1859 + 1.0;
    float _1863 = trunc(_1853);
    float _1865 = precise::max(_1863, 0.0);
    uint _1868 = uint(_1865);
    float _1870 = _1857 * _454;
    float _1872 = float(_112);
    float _1874 = _1861 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1876 = float(_1817);
    bool _1878 = _1876 >= _604;
    bool _1880 = isnan(_1876);
    bool _1882 = _1878 || _1880;
    bool _1884 = isnan(_604);
    bool _1886 = _1882 || _1884;
    float _1888 = float(_1886);
    float _1890 = 1.0 / _1872;
    int _1892 = _1841 * int(_1868);
    int _1894 = _1892 + _1817;
    float _1896 = floor(_1870);
    float _1898 = float(uint(_1894));
    float _1900 = as_type<float>(_1847) * _1898;
    float _1902 = trunc(_1888);
    int _1904 = int(_1902);
    float _1906 = _614 * _1890;
    int _1908 = _500 + (-1);
    float _1910 = -_1896;
    float _1912 = _1870 + _1910;
    float _1914 = trunc(_1900);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    float _1920 = _1912 * _604;
    int _1922 = ~_1904;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    float _1928 = trunc(_1920);
    int _1930 = int(_1928);
    int _1932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1934 = _1932 != 0;
    int _1936 = int(_1868) + int(_1918);
    float _1938 = trunc(_1906);
    int _1940 = int(_1938);
    int _1942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1944 = _1942 != 0;
    int _1946 = _1845 * _1936;
    int _1948 = _1946 + _1817;
    bool _1950 = uint(_1948) >= uint(_500);
    bool _1952 = !_1950;
    int _1954 = _1952 ? 0 : (-1);
    int _1956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1958 = _1956 != 0;
    int _1960 = ~_1936;
    int _1962 = _1960 + _1954;
    int _1964 = _1962 + 1;
    bool _1966 = !_1958;
    int _1968 = _1966 ? 0 : 1;
    int _1970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1972 = _1970 != 0;
    int _1974 = _500 * _1964;
    int _1976 = _1974 + _1817;
    int _1978 = abs(_702);
    int _1980 = abs(_1968);
    bool _1982 = !_1819;
    int _1984 = _1982 ? _1976 : (-1);
    int _1986 = _1930 * _1980;
    int _1988 = _1986 + _1817;
    int _1990 = _1984 * _1926;
    float _1992 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1994 = _452 + _1992;
    float _1996 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1998 = _1996 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2000 = _1904 * _1908;
    int _2002 = _2000 + _1990;
    bool _2004 = !_1972;
    int _2006 = _2004 ? 0 : 1;
    float _2008 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2010 = _2008 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2012 = _2002 * _1978;
    int _2014 = abs(_2006);
    float _2016 = 1.0 / _1998;
    int _2018 = _1940 * _1825;
    int _2020 = _2018 + _2012;
    int _2022 = _1988 * _1827;
    int _2024 = _2022 + _2020;
    int _2026 = ~_500;
    int _2028 = _2026 + 1;
    float _2030 = 1.0 / _2010;
    int _2032 = _1930 * _2014;
    int _2034 = _2032 + _2024;
    float _2036 = float(uint(_2034));
    float _2038 = as_type<float>(_1847) * _2036;
    float _2040 = trunc(_2038);
    float _2042 = precise::max(_2040, 0.0);
    uint _2044 = uint(_2042);
    int _2046 = _2028 * int(_2044);
    int _2048 = _2046 + _2034;
    float _2050 = float(uint(_2048));
    float _2052 = as_type<float>(_1847) * _2050;
    int _2054 = ~_500;
    int _2056 = _2054 + 1;
    float _2058 = trunc(_2052);
    float _2060 = precise::max(_2058, 0.0);
    uint _2062 = uint(_2060);
    float _2064 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2066 = _2064 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2068 = float(uint(_1988));
    int _2070 = int(_2044) + int(_2062);
    float _2072 = as_type<float>(_1847) * _2068;
    float _2074 = in.m_73.y;
    float _2076 = 1.0 / _2066;
    int _2078 = _2056 * _2070;
    int _2080 = _2078 + _2034;
    bool _2082 = uint(_2080) >= uint(_500);
    float _2084 = trunc(_2072);
    float _2086 = precise::max(_2084, 0.0);
    uint _2088 = uint(_2086);
    bool _2090 = !_2082;
    int _2092 = _2090 ? 0 : (-1);
    int _2094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2096 = _2094 != 0;
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    int _2098 = ~_2070;
    int _2100 = _2098 + _2092;
    int _2102 = _2100 + 1;
    bool _2104 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2106 = isnan(_452);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2112 = _2108 || _2110;
    float _2114 = float(_2112);
    int _2116 = _500 * _2102;
    int _2118 = _2116 + _2034;
    float _2120 = -_2114;
    float _2122 = _2120 + 1.0;
    bool _2124 = !_1819;
    int _2126 = _2124 ? _2118 : (-1);
    float _2128 = -_2074;
    float _2130 = _2128 + 1.0;
    float _2132 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2132;
    float _2136 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2138 = _2136 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2140 = _2126 >> 31;
    float _2142 = _2074;
    float _2144 = _1706;
    float _2146 = _1756;
    if (_1934)
    {
        float _2148 = _1831 ? _2130 : _2074;
        _2142 = _2148;
    }
    float _2150 = _2142;
    float _2152 = _2134 * _2030;
    int _2154 = _2140 & 3;
    float _2156 = _2138 * _2076;
    int _2158 = ~_500;
    int _2160 = _2158 + 1;
    float _2162 = fma(_2152, _1994, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2164 = _2126 + _2154;
    bool _2166 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2168 = isnan(_452);
    bool _2170 = _2166 || _2168;
    bool _2172 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2174 = _2170 || _2172;
    float _2176 = float(_2174);
    int _2178 = _2160 * int(_2088);
    int _2180 = _2178 + _1988;
    int _2182 = _2164 >> 2;
    int _2184 = _2126 & 3;
    bool _2186 = _2184 != 0;
    float _2188 = -_2176;
    float _2190 = _2188 + 1.0;
    int _2192 = _2182 << 4;
    int _2194 = _2192 + 368;
    float _2196 = _2176 * _2122;
    float _2198 = float(uint(_2180));
    uint _2200 = uint(int(uint(_2194) >> uint(2)));
    uint _2202 = uint(int(uint(int(_2200)) >> uint(2)));
    int _2204 = int(_2200) & 3;
    float _2206 = (*spvDescriptorSet0.vp_c9)._m0[int(_2202)][_2204];
    int _2208 = int(_2200) + 1;
    uint _2210 = uint(int(uint(_2208) >> uint(2)));
    int _2212 = _2208 & 3;
    float _2214 = (*spvDescriptorSet0.vp_c9)._m0[int(_2210)][_2212];
    bool _2216 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2218 = isnan(_452);
    bool _2220 = _2216 || _2218;
    bool _2222 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2224 = _2220 || _2222;
    float _2226 = float(_2224);
    int _2228 = _2126 & 3;
    bool _2230 = _2228 != 0;
    float _2232 = as_type<float>(_1847) * _2198;
    float _2234 = _2226 * _2190;
    float _2236 = -_2226;
    float _2238 = _2236 + 1.0;
    bool _2240 = uint(_2228) > 1u;
    int _2242 = _2194 + 8;
    uint _2244 = uint(int(uint(_2242) >> uint(2)));
    uint _2246 = uint(int(uint(int(_2244)) >> uint(2)));
    int _2248 = int(_2244) & 3;
    float _2250 = (*spvDescriptorSet0.vp_c9)._m0[int(_2246)][_2248];
    int _2252 = int(_2244) + 1;
    uint _2254 = uint(int(uint(_2252) >> uint(2)));
    int _2256 = _2252 & 3;
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[int(_2254)][_2256];
    float _2260 = trunc(_2232);
    float _2262 = precise::max(_2260, 0.0);
    uint _2264 = uint(_2262);
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2268 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2266;
    bool _2270 = _452 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2272 = isnan(_452);
    bool _2274 = _2270 || _2272;
    bool _2276 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2278 = _2274 || _2276;
    float _2280 = float(_2278);
    int _2282 = _2186 ? 0 : 1;
    float _2284 = _2268 * _2016;
    float _2286 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2288 = _452 + _2286;
    float _2290 = _2280 * _2238;
    int _2292 = ~_2282;
    int _2294 = _2292 + 1;
    int _2296 = _2294 + 1;
    float _2298 = -_2280;
    float _2300 = _2298 + 1.0;
    bool _2302 = uint(_2228) >= 2u;
    float _2304 = _2162 * _2290;
    int _2306 = _2296;
    if (!_2240)
    {
        int _2308 = ~_2282;
        int _2310 = _2308 + 1;
        _2306 = _2310;
    }
    int _2312 = _2306;
    float _2314 = fma(_2156, _2288, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2316 = _2228 != 3;
    float _2318 = fma(_2300, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2304);
    int _2320 = ~_500;
    int _2322 = _2320 + 1;
    float _2324 = fma(_2284, _1823, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2326 = int(_2088) + int(_2264);
    float _2328 = fma(_2314, _2234, _2318);
    bool _2330 = !_2230;
    int _2332 = _2330 ? 0 : 1;
    float _2334 = -_1776;
    float _2336 = _2334 + 1.0;
    int _2338 = abs(_2312);
    int _2340 = _2302 ? 0 : 1;
    float _2342 = _1874 * _1790;
    int _2344 = abs(_2332);
    int _2346 = ~_2338;
    int _2348 = _2346 + 1;
    int _2350 = _2348 + 1;
    int _2352 = _2322 * _2326;
    int _2354 = _2352 + _1988;
    int _2356 = ~_2340;
    int _2358 = _2356 + 1;
    int _2360 = _2358 + 1;
    float _2362 = fma(_2324, _2196, _2328);
    int _2364 = _2360;
    if (_2316)
    {
        int _2366 = ~_2340;
        int _2368 = _2366 + 1;
        _2364 = _2368;
    }
    int _2370 = _2364;
    float _2372 = _938 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2374 = ~_2344;
    int _2376 = _2374 + 1;
    int _2378 = _2376 + 1;
    float _2380 = fma(_2114, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2362);
    int _2382 = _2350 * as_type<int>(_2214);
    int _2384 = abs(_2370);
    bool _2386 = _2228 != 3;
    int _2388 = _2378 * as_type<int>(_2206);
    int _2390 = _2388 + _2382;
    bool _2392 = uint(_2354) >= uint(_500);
    float _2394 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2396 = int(_2394);
    float _2398 = as_type<float>(_2354);
    if (_1944)
    {
        float _2400 = in.m_55.x;
        _2398 = _2400;
    }
    float _2402 = _2398;
    bool _2404 = !_2386;
    int _2406 = _2404 ? 0 : (-1);
    float _2408 = _2380 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2410 = !_2392;
    int _2412 = _2410 ? 0 : (-1);
    int _2414 = ~_2384;
    int _2416 = _2414 + 1;
    int _2418 = _2416 + 1;
    int _2420 = abs(_2406);
    bool _2422 = !_2096;
    int _2424 = _2422 ? 0 : 1;
    int _2426 = ~_2326;
    int _2428 = _2426 + _2412;
    int _2430 = _2428 + 1;
    int _2432 = _2418 * as_type<int>(_2250);
    int _2434 = _2432 + _2390;
    int _2436 = abs(_2424);
    float _2438 = in.m_73.x;
    int _2440 = ~_2420;
    int _2442 = _2440 + 1;
    int _2444 = _2442 + 1;
    int _2446 = _500 * _2430;
    int _2448 = _2446 + _1988;
    bool _2450 = _882 != 0.0;
    bool _2452 = isnan(_882);
    bool _2454 = _2450 || _2452;
    bool _2456 = isnan(0.0);
    bool _2458 = _2454 || _2456;
    float _2460 = in.m_77.x;
    float _2462 = in.m_77.y;
    float _2464 = in.m_77.z;
    int _2466 = ~_2436;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    int _2472 = _2444 * as_type<int>(_2258);
    int _2474 = _2472 + _2434;
    float _2476 = float(uint(_2396));
    int _2478 = abs(_2396);
    int _2480 = _2474 * _2470;
    bool _2482 = _880 == 0.0;
    bool _2484 = !_2458;
    bool _2486 = _2482 && _2484;
    float _2488 = 1.0 / _2476;
    bool _2490 = _884 == 0.0;
    bool _2492 = _2490 && _2486;
    float _2494 = float(uint(_2478));
    bool _2496 = !_1819;
    int _2498 = _2496 ? _2448 : (-1);
    bool _2500 = _2402 > 0.5;
    bool _2502 = _2500 && _1944;
    float _2504 = 1.0 / _2494;
    int _2506 = _2498 * _2436;
    int _2508 = _2506 + _2480;
    float _2510 = _2402;
    if (_1944)
    {
        _2510 = _2438;
    }
    float _2512 = _2510;
    float _2514 = _2460;
    float _2516 = _2464;
    float _2518 = _2512;
    float _2520 = _2462;
    if (!_2492)
    {
        float _2522 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2460);
        _2514 = _2522;
    }
    float _2524 = _2514;
    if (!_1944)
    {
        _1054 = _2438;
    }
    float _2526 = _1054;
    float _2528 = _2526;
    if (!_2492)
    {
        float _2530 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2464);
        _2516 = _2530;
    }
    float _2532 = _2516;
    int _2534 = as_type<int>(_2488) + (-2);
    float _2536 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2538 = float(uint(_2508));
    if (_2502)
    {
        float _2540 = -_2512;
        float _2542 = _2540 + 1.0;
        _2518 = _2542;
    }
    float _2544 = _2518;
    int _2546 = abs(_2508);
    float _2548 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2550 = as_type<float>(_2534) * _2538;
    float _2552 = _938 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2554 = as_type<int>(_2504) + (-2);
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2558 = float(uint(_2546));
    float _2560 = trunc(_2550);
    float _2562 = precise::max(_2560, 0.0);
    uint _2564 = uint(_2562);
    float _2566 = _2556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1944)
    {
        _2528 = _2544;
    }
    float _2568 = _2528;
    float _2570 = as_type<float>(_2554) * _2558;
    int _2572 = ~_2396;
    int _2574 = _2572 + 1;
    float _2576 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2578 = ~_2478;
    int _2580 = _2578 + 1;
    if (!_2492)
    {
        float _2582 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2462);
        _2520 = _2582;
    }
    float _2584 = _2520;
    float _2586 = -_926;
    float _2588 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2552);
    float _2590 = trunc(_2570);
    float _2592 = precise::max(_2590, 0.0);
    uint _2594 = uint(_2592);
    float _2596 = _2576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2598 = _938 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2600 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2588);
    out.m_79.x = _2548;
    out.m_79.y = _2566;
    out.m_79.z = _2596;
    out.m_79.w = _2408;
    float _2602 = abs(_1362);
    float _2604 = log2(_2602);
    bool _2606 = _1362 <= 8000.0;
    bool _2608 = isnan(_1362);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan(8000.0);
    bool _2614 = _2610 || _2612;
    float _2616 = float(_2614);
    int _2618 = _2574 * int(_2564);
    int _2620 = _2618 + _2508;
    float _2622 = -_926;
    float _2624 = fma(_2622, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2372);
    float _2626 = -_926;
    float _2628 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2598);
    float _2630 = float(uint(_2620));
    float _2632 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2624);
    int _2634 = _2580 * int(_2594);
    int _2636 = _2634 + _2546;
    float _2638 = _946 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2640 = _946 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2642 = as_type<float>(_2534) * _2630;
    float _2644 = _946 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2646 = float(uint(_2636));
    float _2648 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2638);
    float _2650 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2640);
    float _2652 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2644);
    float _2654 = trunc(_2642);
    float _2656 = precise::max(_2654, 0.0);
    uint _2658 = uint(_2656);
    float _2660 = as_type<float>(_2554) * _2646;
    float _2662 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2628);
    float _2664 = _952 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2666 = _952 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2668 = _952 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2670 = _2662 * _2584;
    float _2672 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2674 = trunc(_2660);
    float _2676 = precise::max(_2674, 0.0);
    uint _2678 = uint(_2676);
    float _2680 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2664);
    float _2682 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2666);
    float _2684 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2668);
    int _2686 = ~_2396;
    int _2688 = _2686 + 1;
    float _2690 = _2600 * _2584;
    int _2692 = ~_2478;
    int _2694 = _2692 + 1;
    float _2696 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2648);
    float _2698 = exp2(_2672);
    int _2700 = int(_2564) + int(_2658);
    float _2702 = _2632 * _2584;
    float _2704 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2650);
    float _2706 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2680);
    int _2708 = _2688 * _2700;
    int _2710 = _2708 + _2508;
    int _2712 = int(_2594) + int(_2678);
    float _2714 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2682);
    float _2716 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2652);
    float _2718 = fma(_2696, _2524, _2690);
    bool _2720 = uint(_2710) >= uint(_2396);
    int _2722 = _2694 * _2712;
    int _2724 = _2722 + _2546;
    float _2726 = fma(_2716, _2524, _2670);
    float _2728 = fma(_2698, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2730 = precise::clamp(_2728, 0.0, 1.0);
    bool _2732 = !_2720;
    int _2734 = _2732 ? 0 : (-1);
    float _2736 = fma(_2704, _2524, _2702);
    bool _2738 = uint(_2724) >= uint(_2478);
    float _2740 = fma(_2706, _2532, _2718);
    int _2742 = _2508 ^ _2396;
    float _2744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2746 = ~_2700;
    int _2748 = _2746 + _2734;
    int _2750 = _2748 + 1;
    float _2752 = fma(_2714, _2532, _2736);
    bool _2754 = !_2738;
    int _2756 = _2754 ? 0 : (-1);
    float _2758 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2684);
    uint _2760 = uint(int(uint(_2742) >> uint(31)));
    bool _2762 = _2396 == 0;
    float _2764 = _1811 * _2342;
    bool _2766 = _2396 == 0;
    int _2768 = _2396 * _2750;
    int _2770 = _2768 + _2508;
    int _2772 = ~_2756;
    int _2774 = _2712 + _2772;
    int _2776 = _2774 + 1;
    float _2778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2780 = ~int(_2760);
    int _2782 = _2780 + 1;
    float _2784 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2786 = _2744 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2788 = _2776 ^ _2782;
    float _2790 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2784);
    float _2792 = fma(_2758, _2532, _2726);
    float _2794 = fma(_2730, -2.0, 3.0);
    float _2796 = _2730 * _2730;
    int _2798 = ~_2782;
    int _2800 = _2798 + _2788;
    int _2802 = _2800 + 1;
    float _2804 = fma(_2786, _2568, -0.5);
    float _2806 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2790);
    float _2808 = _2796 * _2794;
    bool _2810 = !_2762;
    int _2812 = _2810 ? _2770 : (-1);
    out.m_81.x = _2740;
    out.m_81.y = _2752;
    out.m_81.z = _2792;
    bool _2814 = !_2766;
    int _2816 = _2814 ? _2802 : (-1);
    float _2818 = -_2808;
    float _2820 = _2818 + 1.0;
    float _2822 = float(_2812);
    float _2824 = _2778 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2826 = float(_2816);
    float _2828 = fma(_2820, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2808);
    bool _2830 = _1504 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2832 = isnan(_1504);
    bool _2834 = _2830 || _2832;
    bool _2836 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2838 = _2834 || _2836;
    float _2840 = fma(_2824, _2150, -0.5);
    float _2842 = fma(_2786, _2822, _628);
    float _2844 = -_644;
    float _2846 = fma(_2824, _2826, _2844);
    float _2848 = _2616 * _2828;
    float _2850 = _1706 * 0.5;
    float _2852 = fma(_630, _2804, _2842);
    float _2854 = fma(_632, _2840, _2846);
    float _2856 = _2848 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2858 = in.m_83.x;
    float _2860 = fma(_1756, -0.5, _2850);
    float _2862 = _2852 + 0.5;
    float _2864 = _2336 * _2856;
    float _2866 = precise::clamp(_2864, 0.0, 1.0);
    float _2868 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2806);
    float _2870 = _2854 + 0.5;
    float _2872 = _1750 + _1706;
    float _2874 = -_2866;
    float _2876 = fma(_2874, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2878 = _1801 * _2342;
    out.gl_Position.x = _1750;
    out.gl_Position.y = _1756;
    out.gl_Position.z = _2868;
    out.gl_Position.w = _1706;
    float _2880 = fma(_1801, _2764, _1799);
    float _2882 = _2868 + _1706;
    out.m_85.x = _2862;
    out.m_85.y = _2870;
    float _2884 = _2872 * 0.5;
    float _2886 = _2882 * 0.5;
    out.m_87.x = _2884;
    out.m_87.y = _2860;
    out.m_87.z = _2886;
    out.m_87.w = _1706;
    float _2888 = _2876 * _2858;
    float _2890 = -_1874;
    float _2892 = _2890 + 1.0;
    float _2894 = fma(_1807, _2878, _1795);
    float _2896 = fma(_1809, _2878, _1797);
    float _2898 = _2888 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2900 = _1801 * _2892;
    float _2902 = _1416 * _1470;
    float _2904 = _2868;
    float _2906 = _2884;
    float _2908 = _2892;
    float _2910 = _2902;
    if (!_2838)
    {
        _2144 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2912 = _2144;
    out.m_89.x = _2898;
    float _2914 = _2912;
    float _2916 = _2912;
    if (!_2838)
    {
        _2904 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2918 = _2904;
    float _2920 = _2902 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2922 = _2918;
    float _2924 = _2918;
    if (!_2838)
    {
        _2906 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2926 = _2906;
    out.m_91.x = _2894;
    out.m_91.y = _2896;
    out.m_91.z = _2880;
    out.m_91.w = _2900;
    float _2928 = _2926;
    float _2930 = _2926;
    if (!_2838)
    {
        _2146 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2932 = _2146;
    float _2934 = _2932;
    float _2936 = _2932;
    if (!_2838)
    {
        _2908 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2938 = _2908;
    float _2940 = _2938;
    float _2942 = _2938;
    if (!_2838)
    {
        _2910 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2944 = _2910;
    bool _2946 = !_2838;
    float _2948 = _2944;
    float _2950 = _2944;
    if (!_2946)
    {
        bool _2952 = _1504 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2954 = isnan(_1504);
        bool _2956 = _2952 || _2954;
        bool _2958 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2960 = _2956 || _2958;
        if (!_2960)
        {
            float _2962 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2964 = _1504 + _2962;
            float _2966 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2968 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2966;
            float _2970 = 1.0 / _2968;
            float _2972 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2974 = _2972 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2976 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2978 = _2976 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2980 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2982 = _2980 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2984 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2986 = _2984 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2988 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2990 = _2988 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2992 = _2964 * _2970;
            float _2994 = precise::clamp(_2992, 0.0, 1.0);
            float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2998 = _2996 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3000 = fma(_2994, _2974, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3002 = fma(_2994, _2998, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3004 = fma(_2994, _2978, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3006 = fma(_2994, _2982, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3008 = fma(_2994, _2986, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3010 = fma(_2994, _2990, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2916 = _3002;
            _2942 = _3008;
            _2930 = _3000;
            _2936 = _3006;
            _2924 = _3004;
            _2950 = _3010;
            _3012 = true;
        }
        else
        {
            bool _3014 = _1504 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3016 = isnan(_1504);
            bool _3018 = _3014 || _3016;
            bool _3020 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3022 = _3018 || _3020;
            if (!_3022)
            {
                _2928 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3024 = _2928;
            _2930 = _3024;
            if (!_3022)
            {
                _2914 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3026 = _2914;
            _2916 = _3026;
            if (!_3022)
            {
                _2922 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3028 = _2922;
            _2924 = _3028;
            if (!_3022)
            {
                _2934 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3030 = _2934;
            _2936 = _3030;
            if (!_3022)
            {
                _2940 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3032 = _2940;
            _2942 = _3032;
            if (!_3022)
            {
                _2948 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3034 = _2948;
            bool _3036 = !_3022;
            _2950 = _3034;
            if (!_3036)
            {
                bool _3038 = _1504 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3040 = isnan(_1504);
                bool _3042 = _3038 || _3040;
                bool _3044 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3046 = _3042 || _3044;
                if (!_3046)
                {
                    float _3048 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3050 = _1504 + _3048;
                    float _3052 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3054 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3052;
                    float _3056 = 1.0 / _3054;
                    float _3058 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3060 = _3058 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3062 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3066 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3068 = _3066 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3070 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3072 = _3070 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3074 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3076 = _3074 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3078 = _3050 * _3056;
                    float _3080 = precise::clamp(_3078, 0.0, 1.0);
                    float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3084 = _3082 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3086 = fma(_3080, _3060, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3088 = fma(_3080, _3084, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3090 = fma(_3080, _3064, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3092 = fma(_3080, _3068, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3094 = fma(_3080, _3072, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3096 = fma(_3080, _3076, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2916 = _3088;
                    _2942 = _3094;
                    _2930 = _3086;
                    _2936 = _3092;
                    _2924 = _3090;
                    _2950 = _3096;
                    _3012 = true;
                }
                else
                {
                    _2916 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2942 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2930 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2936 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2924 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2950 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3012 = false;
    float _3098 = _2916;
    float _3100 = _2942;
    float _3102 = _2930;
    float _3104 = _2936;
    float _3106 = _2924;
    float _3108 = _2950;
    float _3110 = _2920 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3112 = fma(_2752, -0.5, 0.5);
    float _3114 = precise::clamp(_3112, 0.0, 1.0);
    float _3116 = -_3098;
    float _3118 = _3116 + _3100;
    float _3120 = -_3102;
    float _3122 = _3120 + _3104;
    out.m_49.x = _3110;
    float _3124 = fma(_3114, _3118, _3098);
    float _3126 = -_3106;
    float _3128 = _3126 + _3108;
    float _3130 = fma(_3114, _3122, _3102);
    float _3132 = _3124 * 0.586610972881317138671875;
    bool _3134 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3136 = fma(_3114, _3128, _3106);
    out.m_93.x = 0.0;
    float _3138 = fma(_3130, 0.298911988735198974609375, _3132);
    bool _3140 = _1416 > 0.0;
    bool _3142 = isnan(_1416);
    bool _3144 = _3140 || _3142;
    bool _3146 = isnan(0.0);
    bool _3148 = _3144 || _3146;
    float _3150 = fma(_3136, 0.114477999508380889892578125, _3138);
    bool _3152 = _1470 <= 0.0;
    bool _3154 = !_3148;
    bool _3156 = _3152 || _3154;
    float _3158 = -_3150;
    float _3160 = _3130 + _3158;
    float _3162 = -_3150;
    float _3164 = _3124 + _3162;
    float _3166 = -_3150;
    float _3168 = _3136 + _3166;
    float _3170 = fma(_3160, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3150);
    float _3172 = fma(_3164, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3150);
    float _3174 = fma(_3168, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3150);
    bool _3176 = !_3134;
    if (!_3176)
    {
        float _3178 = -_1352;
        float _3180 = _3178 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3182 = -_1354;
        float _3184 = _3182 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3186 = -_1356;
        float _3188 = _3186 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3190 = _3180 * _3180;
        float _3192 = fma(_3184, _3184, _3190);
        float _3194 = fma(_3188, _3188, _3192);
        float _3196 = sqrt(_3194);
        float _3198 = rsqrt(_3194);
        float _3200 = -_3196;
        float _3202 = _3200 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3204 = _3202 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3206 = precise::clamp(_3204, 0.0, 1.0);
        float _3208 = _3184 * _3198;
        float _3210 = _3180 * _3198;
        float _3212 = abs(_3206);
        float _3214 = log2(_3212);
        float _3216 = _3188 * _3198;
        float _3218 = _3208 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3220 = _2752 * _3210;
        float _3222 = -_3210;
        float _3224 = -_3218;
        float _3226 = fma(_3222, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3224);
        float _3228 = fma(_2740, _3208, _3220);
        float _3230 = -_3216;
        float _3232 = fma(_3230, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3226);
        float _3234 = fma(_2792, _3216, _3228);
        float _3236 = precise::clamp(_3234, 0.0, 1.0);
        float _3238 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3240 = _3232 + _3238;
        float _3242 = _3214 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3244 = _3240 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3246 = precise::clamp(_3244, 0.0, 1.0);
        float _3248 = exp2(_3242);
        float _3250 = _3248 * _3246;
        float _3252 = _3236 * _3250;
        float _3254 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3256 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3258 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3254;
        out.m_93.y = _3256;
        out.m_93.z = _3258;
    }
    out.m_67.x = _3170;
    out.m_67.y = _3172;
    out.m_67.z = _3174;
    if (!_3156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3260 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3260;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

