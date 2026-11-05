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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_89 [[user(locn1)]];
    float4 m_109 [[user(locn2)]];
    float4 m_105 [[user(locn3)]];
    float4 m_107 [[user(locn4)]];
    float4 m_87 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_93 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_99 [[user(locn10)]];
    float4 m_103 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_95 [[user(locn13)]];
    float4 m_101 [[user(locn14)]];
    float4 m_73 [[user(locn15)]];
    float4 m_77 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_97 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_81 [[attribute(8)]];
    float4 m_79 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
    float4 m_75 [[attribute(12)]];
    float4 m_69 [[attribute(13)]];
    float4 m_71 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2425 = false;
    bool _1588 = false;
    bool _682 = false;
    bool _538 = false;
    bool _248 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_48.w;
    float _125 = trunc(_123);
    int _128 = int(_125);
    bool _132 = _128 >= 1;
    float _134 = 0.0;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    float _138 = _136;
    if (!_132)
    {
        out.m_51.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _136 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2724 = as_type<float>(_144);
        out.gl_Position.z = _2724;
    }
    if (!_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_53.w;
    bool _150 = _148 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_148);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = -_148;
    float _162 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _164 = 0.0;
    float _166 = _162;
    if (_158)
    {
        float _168 = float(_128);
        _164 = _168;
    }
    float _170 = _164;
    bool _172 = _162 >= _170;
    bool _174 = !_158;
    bool _176 = _172 || _174;
    if (_176)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _138;
    if (_176)
    {
        out.m_51.x = 0.0;
    }
    if (_176)
    {
        float _180 = _178 * 5.0;
        _146 = as_type<int>(_180);
    }
    int _182 = _146;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2793 = as_type<float>(_182);
        out.gl_Position.z = _2793;
    }
    if (_176)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _184 = in.m_55.x;
    float _186 = in.m_55.y;
    float _188 = in.m_55.z;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = in.m_59.x;
    float _200 = in.m_59.y;
    float _202 = in.m_59.z;
    float _204 = in.m_61.x;
    float _206 = in.m_61.y;
    float _208 = in.m_61.z;
    float _210 = _186 * _194;
    float _212 = _186 * _200;
    float _214 = fma(_184, _192, _210);
    float _216 = _186 * _206;
    float _218 = fma(_184, _198, _212);
    float _220 = fma(_184, _204, _216);
    float _222 = fma(_188, _196, _214);
    float _224 = fma(_188, _202, _218);
    float _226 = fma(_188, _208, _220);
    bool _228 = !_190;
    float _246;
    if (!_228)
    {
        float _230 = in.m_63.x;
        float _232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _234 = _230 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[12].x, _162);
        float _238 = _236 * _232;
        float _240 = floor(_238);
        float _242 = -_240;
        float _244 = _238 + _242;
        _246 = _244;
        _248 = true;
    }
    else
    {
        float _250 = float(_128);
        float _252 = 1.0 / _250;
        float _254 = _162 * _252;
        _246 = _254;
    }
    _248 = false;
    float _256 = _246;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = _256 + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _256 + _262;
    bool _266 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _268 = isnan(_256);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _294 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _296 = isnan(_256);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = _256 + _306;
    float _310 = 1.0 / _280;
    bool _312 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _314 = isnan(_256);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = 1.0 / _292;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _328 = 1.0 / _284;
    float _330 = _260 * _310;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _334 = _256 + _332;
    float _336 = 1.0 / _288;
    float _338 = _264 * _328;
    float _340 = _334 * _324;
    bool _342 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _344 = isnan(_256);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    bool _354 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _356 = isnan(_256);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _370 = -_352;
    float _372 = _370 + 1.0;
    float _374 = _308 * _336;
    float _376 = -_364;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _380;
    float _384 = _276 * _372;
    float _386 = -_276;
    float _388 = _386 + 1.0;
    float _390 = _352 * _378;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _396;
    float _400 = _304 * _388;
    float _402 = -_304;
    float _404 = _402 + 1.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = fma(_382, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = _322 * _404;
    float _418 = fma(_394, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _420 = fma(_398, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _422 = fma(_368, _338, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = _410 * _416;
    float _426 = fma(_408, _338, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _428 = fma(_414, _338, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _430;
    float _434 = _418 * _416;
    float _436 = _420 * _416;
    float _438 = -_322;
    float _440 = _438 + 1.0;
    float _442 = in.m_65.x;
    float _444 = in.m_65.y;
    float _446 = in.m_65.z;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _452;
    float _456 = fma(_432, _374, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _458 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].x, _434);
    float _460 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].y, _436);
    float _462 = fma(_450, _374, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _464 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].z, _424);
    float _466 = fma(_454, _374, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _468 = fma(_422, _400, _458);
    float _470 = fma(_426, _400, _460);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _484 = fma(_428, _400, _464);
    float _486 = fma(_474, _340, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _488 = fma(_478, _340, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _490 = fma(_482, _340, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _492 = fma(_456, _384, _468);
    float _494 = fma(_462, _384, _470);
    float _496 = fma(_466, _384, _484);
    float _498 = fma(_486, _390, _492);
    float _500 = fma(_488, _390, _494);
    float _502 = fma(_490, _390, _496);
    float _504 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[147].x, _498);
    float _506 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[147].y, _500);
    float _508 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[147].z, _502);
    float _510 = _504 * _442;
    float _512 = _506 * _444;
    float _514 = _508 * _446;
    bool _516 = !_326;
    float _518 = _504;
    float _536;
    if (!_516)
    {
        float _520 = in.m_63.x;
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _524 = _520 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[11].y, _162);
        float _528 = _526 * _522;
        float _530 = floor(_528);
        float _532 = -_530;
        float _534 = _528 + _532;
        _536 = _534;
        _538 = true;
    }
    else
    {
        float _540 = float(_128);
        float _542 = 1.0 / _540;
        float _544 = _162 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _550 = _546 + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _556 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _558 = isnan(_546);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _572 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _574 = isnan(_546);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _584;
    bool _588 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _590 = isnan(_546);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = 1.0 / _554;
    float _602 = -_566;
    float _604 = _602 + 1.0;
    bool _606 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _608 = -_598;
    float _610 = _608 + 1.0;
    float _612 = 1.0 / _570;
    float _614 = _566 * _610;
    float _616 = _586 * _600;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _622 = fma(_616, _550, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _624 = _582 * _604;
    float _626 = -_582;
    float _628 = _626 + 1.0;
    float _630 = _620 * _612;
    float _632 = _622 * _624;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _636 = _546 + _634;
    float _638 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[115].x, _632);
    float _640 = fma(_630, _636, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _644 = fma(_640, _614, _638);
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _648 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _652 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[117].x, _644);
    float _654 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _652 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _648;
    out.m_67.y = _654;
    out.m_67.z = _656;
    out.m_67.w = _658;
    bool _660 = !_606;
    float _662 = _656;
    float _680;
    if (!_660)
    {
        float _664 = in.m_63.x;
        float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _668 = _664 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[11].w, _162);
        float _672 = _670 * _666;
        float _674 = floor(_672);
        float _676 = -_674;
        float _678 = _672 + _676;
        _680 = _678;
        _682 = true;
    }
    else
    {
        float _684 = float(_128);
        float _686 = 1.0 / _684;
        float _688 = _162 * _686;
        _680 = _688;
    }
    _682 = false;
    float _690 = _680;
    float _692 = in.m_69.y;
    float _694 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _696 = in.m_63.w;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _700 = _698 != 0;
    float _702 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _706 = _704 != 0;
    float _708 = in.m_48.x;
    float _710 = in.m_48.y;
    float _712 = in.m_48.z;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _716 = _714 != 0;
    float _718 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _722 = _720 != 0;
    float _724 = in.m_63.z;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _728 = _726 != 0;
    float _730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _732 = in.m_63.y;
    float _734 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _736 = in.m_63.x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _740 = in.m_71.x;
    float _742 = -_692;
    float _744 = _742 + 1.0;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _748 = in.m_71.y;
    bool _750 = _696 > 0.5;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _754 = _730 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _756 = in.m_71.z;
    float _758 = _194 * _710;
    int _760 = _750 ? as_type<int>(_744) : as_type<int>(_692);
    float _762 = _200 * _710;
    float _764 = in.m_71.w;
    bool _766 = _724 > 0.5;
    float _768 = _206 * _710;
    float _770 = _724;
    float _772 = _692;
    if (!_700)
    {
        _518 = _724;
    }
    float _774 = _518;
    float _776 = fma(_198, _708, _762);
    float _778 = _774;
    if (!_700)
    {
        _662 = _732;
    }
    float _780 = _662;
    float _782 = fma(_204, _708, _768);
    float _784 = _780;
    if (_700)
    {
        _770 = _732;
    }
    float _786 = _770;
    float _788 = _736 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_700)
    {
        _784 = _736;
    }
    float _790 = _784;
    float _792 = in.m_61.w;
    if (_700)
    {
        _778 = _732;
    }
    float _794 = _778;
    float _796 = -_738;
    float _798 = fma(_788, 2.0, _796);
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _802 = _800 != 0;
    out.m_73.x = _740;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _806 = _804 != 0;
    float _808 = fma(_192, _708, _758);
    out.m_73.y = _748;
    float _810 = fma(_208, _712, _782);
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _816 = _722 ? as_type<float>(_760) : _692;
    out.m_73.z = _756;
    bool _818 = _732 > 0.5;
    float _820 = 1.0 / _814;
    float _822 = in.m_75.x;
    float _824 = in.m_75.y;
    float _826 = in.m_75.z;
    float _828 = in.m_75.w;
    int _830 = _818 ? as_type<int>(_744) : as_type<int>(_692);
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _834 = fma(_202, _712, _776);
    out.m_73.w = _764;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _840 = _802 ? as_type<float>(_830) : _692;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _844 = 1.0 / _838;
    bool _846 = _802;
    float _848 = _834;
    float _850 = _798;
    if (_706)
    {
        bool _852 = _736 > 0.5;
        _846 = _852;
    }
    bool _854 = _846;
    float _856 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[78].w, _842);
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _860 = _732 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _868 = _690 + _866;
    float _870 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[78].z, _858);
    float _872 = fma(_860, -2.0, _832);
    float _874 = fma(_196, _712, _808);
    float _876 = 1.0 / _864;
    float _878 = in.m_59.w;
    float _880 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _856);
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _882;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _890 = _824 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _892 = _828;
    if (_806)
    {
        float _894 = _766 ? _744 : _692;
        _772 = _894;
    }
    float _896 = _772;
    float _898 = _884 * _820;
    float _900 = in.m_57.w;
    float _902 = _824 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _904 = _888 * _844;
    float _906 = _824 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _908;
    float _912 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[26].x, _902);
    float _914 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[25].x, _890);
    float _916 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[24].x, _906);
    float _918 = _910 * _876;
    float _920 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[26].z, _912);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _924 = _690 + _922;
    float _926 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[24].z, _916);
    float _928 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[25].z, _914);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _932 = _690 + _930;
    float _934 = fma(_898, _924, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _938 = _834 + _878;
    float _940 = fma(_918, _932, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _942 = _810 + _792;
    out.m_77.x = _926;
    out.m_77.y = _928;
    out.m_77.z = _920;
    float _944 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _946 = _938 + _944;
    float _948 = fma(_904, _868, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _952 = _942 + _950;
    float _954 = _874 + _900;
    float _956 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _872);
    bool _958 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _960 = isnan(_690);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = in.m_69.x;
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _974 = _954 + _972;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _978 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[83].z, _746);
    float _980 = _946 * _946;
    float _982 = _936 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _984 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[83].w, _976);
    bool _986 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _988 = isnan(_690);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = fma(_974, _974, _980);
    float _1000 = fma(_982, _840, -0.5);
    float _1002 = _694 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1004 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1006 = isnan(_690);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1012 = _1008 || _1010;
    float _1014 = float(_1012);
    float _1016 = fma(_952, _952, _998);
    float _1018 = -_956;
    float _1020 = fma(_880, _1000, _1018);
    bool _1022 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1024 = isnan(_690);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1030 = _1026 || _1028;
    float _1032 = float(_1030);
    float _1034 = -_996;
    float _1036 = _1034 + 1.0;
    float _1038 = sqrt(_1016);
    float _1040 = fma(_816, _1002, -0.5);
    float _1042 = _790 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1044 = in.m_79.x;
    float _1046 = in.m_79.y;
    float _1048 = in.m_79.z;
    float _1050 = _1032 * _1036;
    float _1052 = -_1032;
    float _1054 = _1052 + 1.0;
    float _1056 = _702 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1058 = -_752;
    float _1060 = fma(_1042, 2.0, _1058);
    float _1062 = rsqrt(_1016);
    float _1064 = _1014 * _1054;
    float _1066 = -_1014;
    float _1068 = _1066 + 1.0;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1072 = _786 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1074 = as_type<int>(_946);
    float _1076 = _970;
    float _1078 = _984;
    float _1080 = _968;
    if (!_706)
    {
        _848 = _970;
    }
    float _1082 = _848;
    float _1084 = _968 * _1068;
    int _1086 = 0;
    float _1088 = _1082;
    if (_728)
    {
        float _1090 = -_970;
        float _1092 = _1090 + 1.0;
        _1086 = as_type<int>(_1092);
    }
    int _1094 = _1086;
    float _1096 = _1038 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1098 = fma(_1072, -2.0, _1070);
    float _1100 = _934 * _1084;
    float _1102 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _870);
    float _1104 = precise::min(_1056, _1096);
    float _1106 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1098);
    float _1108 = in.m_81.x;
    float _1110 = in.m_81.y;
    float _1112 = in.m_81.z;
    float _1114 = _1062 * _1104;
    bool _1116 = _1046 != 0.0;
    bool _1118 = isnan(_1046);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(0.0);
    bool _1124 = _1120 || _1122;
    float _1126 = _946 * _1114;
    float _1128 = _974 * _1114;
    float _1130 = _952 * _1114;
    bool _1132 = _1044 == 0.0;
    bool _1134 = !_1124;
    bool _1136 = _1132 && _1134;
    float _1138 = -_1126;
    float _1140 = _946 + _1138;
    float _1142 = -_1128;
    float _1144 = _974 + _1142;
    float _1146 = -_1130;
    float _1148 = _952 + _1146;
    bool _1150 = _1048 == 0.0;
    bool _1152 = _1150 && _1136;
    float _1154 = _1140 * _1140;
    float _1156 = _1140;
    float _1158 = _1144;
    float _1160 = _1128;
    if (_706)
    {
        float _1162 = -_970;
        float _1164 = _1162 + 1.0;
        _1074 = as_type<int>(_1164);
    }
    int _1166 = _1074;
    float _1168 = -_968;
    float _1170 = _1168 + 1.0;
    int _1172 = _1166;
    if (!_728)
    {
        _1156 = _970;
    }
    float _1174 = _1156;
    float _1176 = fma(_1144, _1144, _1154);
    float _1178 = _1174;
    if (!_716)
    {
        _1158 = _970;
    }
    float _1180 = _1158;
    float _1182 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1100);
    float _1184 = _1180;
    if (_706)
    {
        float _1186 = _854 ? as_type<float>(_1166) : _970;
        _1088 = _1186;
    }
    float _1188 = _1088;
    float _1190 = fma(_1148, _1148, _1176);
    if (_716)
    {
        float _1192 = -_970;
        float _1194 = _1192 + 1.0;
        _1172 = as_type<int>(_1194);
    }
    int _1196 = _1172;
    float _1198 = -_162;
    float _1200 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[76].x, _798);
    float _1202 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].z, _978);
    float _1204 = sqrt(_1190);
    float _1206 = _1110;
    if (_1152)
    {
        _850 = _1108;
    }
    float _1208 = _850;
    float _1210 = -_162;
    float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1060);
    float _1214 = _1208;
    if (_716)
    {
        float _1216 = _766 ? as_type<float>(_1196) : _970;
        _1184 = _1216;
    }
    float _1218 = _1184;
    float _1220 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].w, _984);
    if (_1152)
    {
        _166 = _1208;
    }
    float _1222 = _166;
    float _1224 = fma(_754, _1188, -0.5);
    float _1226 = _1222;
    if (!_1152)
    {
        _1214 = _1108;
    }
    float _1228 = _1214;
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_728)
    {
        float _1232 = _818 ? as_type<float>(_1094) : _970;
        _1178 = _1232;
    }
    float _1234 = _1178;
    float _1236 = -_1106;
    float _1238 = fma(_1220, _1040, _1236);
    if (!_1152)
    {
        float _1240 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1228);
        _1226 = _1240;
    }
    float _1242 = _1226;
    if (_1152)
    {
        _1076 = _1110;
    }
    float _1244 = _1076;
    float _1246 = _1244;
    if (_1152)
    {
        _1078 = _1112;
    }
    float _1248 = _1078;
    float _1250 = _1062 * _1204;
    float _1252 = fma(_948, _1064, _1182);
    float _1254 = _1248;
    if (_1152)
    {
        _1080 = _1244;
    }
    float _1256 = _1080;
    float _1258 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1046);
    float _1260 = _718 * _1250;
    float _1262 = _1256;
    if (!_1152)
    {
        _1246 = _1110;
    }
    float _1264 = _1246;
    float _1266 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1044);
    if (_1152)
    {
        _1206 = _1248;
    }
    float _1268 = _1206;
    float _1270 = _1260 * _1258;
    float _1272 = _1268;
    if (!_1152)
    {
        _1254 = _1112;
    }
    float _1274 = _1254;
    float _1276 = _702 * _1250;
    float _1278 = _734 * _1250;
    float _1280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1048);
    float _1282 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1284 = _1276 * _1266;
    float _1286 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1288 = _1278 * _1280;
    float _1290 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1292 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1282);
    float _1294 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1286);
    float _1296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (!_1152)
    {
        float _1298 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1274);
        _1272 = _1298;
    }
    float _1300 = _1272;
    float _1302 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1292);
    float _1304 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1294);
    float _1306 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1308 = _1300;
    if (!_1152)
    {
        float _1310 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1264);
        _1262 = _1310;
    }
    float _1312 = _1262;
    float _1314 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1316 = fma(_1290, _1218, -0.5);
    float _1318 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1322 = _942 + _1314;
    float _1324 = fma(_940, _1050, _1252);
    float _1326 = _954 + _1318;
    float _1328 = _896 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1332 = _1322 + _1330;
    float _1334 = _826 * _1228;
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1338 = _1326 + _1336;
    float _1340 = fma(_1102, _1224, _1200);
    float _1342 = _1332 * _1332;
    float _1344 = _824 * _1274;
    float _1346 = _1328 * _1296;
    float _1348 = -_1334;
    float _1350 = fma(_822, _1274, _1348);
    float _1352 = fma(_1338, _1338, _1342);
    float _1354 = _822 * _1264;
    float _1356 = -_1344;
    float _1358 = fma(_826, _1264, _1356);
    float _1360 = _1306 * _1320;
    float _1362 = sqrt(_1352);
    float _1364 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1366 = fma(_1202, _1316, _1212);
    float _1368 = _1020 + 0.5;
    out.m_83.x = _1360;
    out.m_83.y = _1346;
    float _1370 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1364);
    float _1372 = _1238 + 0.5;
    float _1374 = _1366 + 0.5;
    float _1376 = _1340 + 0.5;
    float _1378 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1370);
    float _1380 = -_1354;
    float _1382 = fma(_824, _1228, _1380);
    float _1384 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1386 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1388 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1390 = _1378 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_85.x = _1376;
    out.m_85.y = _1368;
    out.m_85.z = _1374;
    out.m_85.w = _1372;
    bool _1392 = _1362 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1394 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1384);
    float _1396 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1386);
    float _1398 = _1350 * _828;
    float _1400 = _1358 * _828;
    float _1402 = _1382 * _828;
    float _1404 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1324);
    float _1406 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1388);
    float _1408 = _938 + _1390;
    float _1410 = _1326;
    float _1412 = _1322;
    if (!_1392)
    {
        _892 = _1408;
    }
    float _1414 = _892;
    bool _1416 = !_1392;
    float _1418 = _1414;
    if (!_1416)
    {
        float _1420 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1424 = _1362 + _1422;
        float _1426 = _1408 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1428 = rsqrt(_1352);
        float _1430 = _1424 * _1420;
        float _1432 = _1430 * 0.15915493667125701904296875;
        float _1434 = _1432 * 6.283185482025146484375;
        float _1436 = cos(_1434);
        float _1438 = _1432 * 6.283185482025146484375;
        float _1440 = sin(_1438);
        float _1442 = _1436 + (-1.0);
        float _1444 = _1442 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1446 = fma(_1440, _1426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1448 = fma(_1408, _1436, _1444);
        float _1450 = _1428 * _1446;
        float _1452 = fma(_1338, _1450, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1454 = fma(_1332, _1450, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1418 = _1448;
        _1410 = _1452;
        _1412 = _1454;
    }
    float _1456 = _1418;
    float _1458 = _1410;
    float _1460 = _1412;
    float _1462 = -_1126;
    float _1464 = _1462 + _1456;
    float _1466 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1468 = -_1128;
    float _1470 = _1468 + _1458;
    float _1472 = -_1130;
    float _1474 = _1472 + _1460;
    float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1478 = _1464 + _1476;
    float _1480 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1466);
    float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1484 = _1470 + _1482;
    float _1486 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1488 = _1478 * _1478;
    float _1490 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1492 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1486);
    float _1494 = fma(_1484, _1484, _1488);
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1498 = _1474 + _1496;
    float _1500 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1490);
    float _1502 = fma(_1498, _1498, _1494);
    float _1504 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1492);
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1510 = sqrt(_1502);
    float _1512 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1514 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1480);
    float _1516 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1500);
    float _1518 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1396);
    float _1520 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1522 = _1508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1524 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1526 = _1404 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1528 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1394);
    float _1530 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1406);
    out.m_87.w = _1104;
    float _1532 = -_1128;
    float _1534 = _954 + _1532;
    float _1536 = -_1126;
    float _1538 = _938 + _1536;
    out.m_89.x = _1520;
    out.m_89.y = _1522;
    out.m_89.z = _1524;
    out.m_89.w = _1526;
    bool _1540 = _1510 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1542 = isnan(_1510);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1548 = _1544 || _1546;
    float _1550 = -_1130;
    float _1552 = _942 + _1550;
    out.m_91.x = _1514;
    out.m_91.y = _1504;
    out.m_91.z = _1516;
    out.m_93.x = _1276;
    out.m_95.x = _1528;
    out.m_95.y = _1518;
    out.m_95.z = _1530;
    if (!_1548)
    {
        _1308 = 1.0;
    }
    float _1554 = _1308;
    bool _1556 = !_1548;
    float _1558 = _1554;
    if (!_1556)
    {
        bool _1560 = _1510 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1562 = isnan(_1510);
        bool _1564 = _1560 || _1562;
        bool _1566 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1568 = _1564 || _1566;
        if (!_1568)
        {
            float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1572 = _1510 + _1570;
            float _1574 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1576 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1574;
            float _1578 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1580 = _1578 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1582 = 1.0 / _1576;
            float _1584 = _1572 * _1582;
            float _1586 = fma(_1584, _1580, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1558 = _1586;
            _1588 = true;
        }
        else
        {
            bool _1590 = _1510 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1592 = isnan(_1510);
            bool _1594 = _1590 || _1592;
            bool _1596 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1598 = _1594 || _1596;
            if (!_1598)
            {
                float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1602 = _1510 + _1600;
                float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1606 = _1604 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1610 = _1608 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1612 = 1.0 / _1606;
                float _1614 = _1602 * _1612;
                float _1616 = fma(_1614, _1610, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1558 = _1616;
                _1588 = true;
            }
            else
            {
                _1558 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1588 = false;
    float _1618 = _1558;
    float _1620 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1622 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1624 = _1464 + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1628 = _1470 + _1626;
    float _1630 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1632 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1620);
    float _1634 = fma(_1624, _1618, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1636 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1638 = _1474 + _1636;
    float _1640 = fma(_1628, _1618, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1642 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1632);
    float _1644 = -_1538;
    float _1646 = _1644 + _1634;
    float _1648 = fma(_1638, _1618, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1650 = -_1534;
    float _1652 = _1650 + _1640;
    float _1654 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1656 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1630);
    float _1658 = _1646 * _1646;
    float _1660 = -_1552;
    float _1662 = _1660 + _1648;
    float _1664 = 1.0 / _1654;
    float _1666 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1656);
    float _1668 = fma(_1652, _1652, _1658);
    float _1670 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1672 = fma(_1662, _1662, _1668);
    float _1674 = _1670 + _1654;
    float _1676 = sqrt(_1672);
    bool _1678 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1680 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan(0.5);
    bool _1686 = _1682 || _1684;
    float _1688 = _1674 * _1664;
    float _1690 = _1688 * 0.5;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1694 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1692);
    float _1696 = 1.0 / _1694;
    bool _1698 = _1676 > 0.0;
    float _1700 = _1676;
    float _1702 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1704 = _1690;
    float _1706 = _1664;
    float _1708 = _1648;
    if (_1686)
    {
        _1700 = 1.0;
    }
    float _1710 = _1700;
    float _1712 = _1710;
    if (!_1698)
    {
        _1702 = _1640;
    }
    float _1714 = _1702;
    float _1716 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1718 = _1696 * _1716;
    float _1720 = _1714;
    if (!_1698)
    {
        _1704 = _1634;
    }
    float _1722 = _1704;
    float _1724 = _1722;
    if (!_1698)
    {
        _1706 = _1648;
    }
    float _1726 = _1706;
    bool _1728 = !_1698;
    float _1730 = _1726;
    float _1732 = _1726;
    if (!_1728)
    {
        float _1734 = _224 * _224;
        float _1736 = fma(_222, _222, _1734);
        float _1738 = rsqrt(_1672);
        float _1740 = fma(_226, _226, _1736);
        float _1742 = sqrt(_1740);
        float _1744 = _1652 * _1738;
        float _1746 = _1646 * _1738;
        float _1748 = _1662 * _1738;
        bool _1750 = _1742 > 0.0;
        float _1752 = _1738;
        float _1754 = _1742;
        if (!_1750)
        {
            _1752 = _1640;
        }
        float _1756 = _1752;
        _1720 = _1756;
        if (!_1750)
        {
            _1754 = _1634;
        }
        float _1758 = _1754;
        _1724 = _1758;
        if (!_1750)
        {
            _1730 = _1648;
        }
        float _1760 = _1730;
        bool _1762 = !_1750;
        _1732 = _1760;
        if (!_1762)
        {
            float _1764 = rsqrt(_1740);
            float _1766 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1768 = _224 * _1764;
            float _1770 = _222 * _1764;
            float _1772 = _1746 * _1768;
            float _1774 = _226 * _1764;
            float _1776 = fma(_1744, _1770, _1772);
            float _1778 = _1766 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1780 = fma(_1748, _1774, _1776);
            float _1782 = _1780 * _1778;
            float _1784 = fma(_222, _1782, _1640);
            float _1786 = fma(_224, _1782, _1634);
            float _1788 = fma(_226, _1782, _1648);
            _1724 = _1786;
            _1720 = _1784;
            _1732 = _1788;
        }
    }
    float _1790 = _1724;
    float _1792 = _1720;
    float _1794 = _1732;
    if (!_1686)
    {
        float _1796 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1800 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1798;
        float _1802 = _1796 * 0.15915493667125701904296875;
        float _1804 = _1802 * 6.283185482025146484375;
        float _1806 = cos(_1804);
        float _1808 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1810 = _1808 * 0.15915493667125701904296875;
        float _1812 = _1802 * 6.283185482025146484375;
        float _1814 = sin(_1812);
        float _1816 = 1.0 / _1806;
        float _1818 = _1810 * 6.283185482025146484375;
        float _1820 = cos(_1818);
        float _1822 = _1814 * _1816;
        float _1824 = _1810 * 6.283185482025146484375;
        float _1826 = sin(_1824);
        float _1828 = _1820 * _1822;
        float _1830 = 1.0 / _1800;
        float _1832 = 1.0 / _1828;
        float _1834 = _1826 * _1832;
        float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1838 = fma(_1718, _1834, _1836);
        float _1840 = _1838 * _1830;
        float _1842 = precise::clamp(_1840, 0.0, 1.0);
        _1712 = _1842;
    }
    float _1844 = _1712;
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1848 = _1790 + _1846;
    float _1850 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1852 = _1792 + _1850;
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1856 = _1794 + _1854;
    float _1858 = _1848 * _1848;
    float _1860 = fma(_1852, _1852, _1858);
    float _1862 = fma(_1856, _1856, _1860);
    float _1864 = rsqrt(_1862);
    float _1866 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1868 = _1852 * _1866;
    float _1870 = _1856 * _1866;
    float _1872 = _1868 * _1868;
    float _1874 = _1870 * _1870;
    float _1876 = _1872 + _1874;
    float _1878 = sqrt(_1876);
    bool _1880 = _1878 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1884 = _1878 + _1882;
    float _1886 = _1864;
    float _1888 = _1876;
    float _1890 = _1884;
    float _1892 = _1848;
    float _1894 = _1868;
    if (_1880)
    {
        float _1896 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1886 = _1896;
    }
    float _1898 = _1886;
    if (_1880)
    {
        float _1900 = rsqrt(_1876);
        _1888 = _1900;
    }
    float _1902 = _1888;
    float _1904 = _1902;
    if (_1880)
    {
        float _1906 = _1884 * _1898;
        _1890 = _1906;
    }
    float _1908 = _1890;
    if (_1880)
    {
        float _1910 = _1908 * 0.15915493667125701904296875;
        _1708 = _1910;
    }
    float _1912 = _1708;
    float _1914 = _1898;
    float _1916 = _1912;
    if (_1880)
    {
        float _1918 = _1912 * 6.283185482025146484375;
        float _1920 = sin(_1918);
        _1914 = _1920;
    }
    float _1922 = _1914;
    float _1924 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1926 = precise::max(0.0, _1924);
    float _1928 = _1856;
    float _1930 = _1926;
    if (_1880)
    {
        float _1932 = _1912 * 6.283185482025146484375;
        float _1934 = cos(_1932);
        _1928 = _1934;
    }
    float _1936 = _1928;
    float _1938 = -_1866;
    float _1940 = -_1926;
    float _1942 = fma(_1848, _1938, _1940);
    float _1944 = _1942;
    if (_1880)
    {
        float _1946 = _1942 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1930 = _1946;
    }
    float _1948 = _1930;
    float _1950 = _1948;
    if (!_1880)
    {
        _1916 = _1868;
    }
    float _1952 = _1916;
    float _1954 = _1922;
    float _1956 = _1952;
    if (_1880)
    {
        float _1958 = fma(_1922, _1948, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1950 = _1958;
    }
    float _1960 = _1950;
    if (!_1880)
    {
        _1954 = _1870;
    }
    float _1962 = _1954;
    float _1964 = _1962;
    if (_1880)
    {
        float _1966 = _1936 + (-1.0);
        _1892 = _1966;
    }
    float _1968 = _1892;
    float _1970 = _1968;
    if (_1880)
    {
        float _1972 = _1902 * _1960;
        _1160 = _1972;
    }
    float _1974 = _1160;
    if (!_1880)
    {
        _1904 = _1872;
    }
    float _1976 = _1904;
    float _1978 = sqrt(_1862);
    float _1980 = _1976;
    if (_1880)
    {
        float _1982 = _1968 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1970 = _1982;
    }
    float _1984 = _1970;
    if (_1880)
    {
        float _1986 = _1868 * _1974;
        _1956 = _1986;
    }
    float _1988 = _1956;
    if (_1880)
    {
        float _1990 = _1870 * _1974;
        _1964 = _1990;
    }
    float _1992 = _1964;
    if (!_1880)
    {
        _1894 = _1874;
    }
    float _1994 = _1894;
    float _1996 = _1994;
    if (_1880)
    {
        float _1998 = fma(_1942, _1936, _1984);
        _1944 = _1998;
    }
    float _2000 = _1944;
    if (_1880)
    {
        float _2002 = _1988 * _1988;
        _1980 = _2002;
    }
    float _2004 = _1980;
    if (_1880)
    {
        float _2006 = _1992 * _1992;
        _1996 = _2006;
    }
    float _2008 = _1996;
    float _2010 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2012 = fma(_2000, _2000, _2004);
    float _2014 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2010);
    float _2016 = _2012 + _2008;
    float _2018 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2022 = fma(_1978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2020);
    float _2024 = precise::clamp(_2022, 0.0, 1.0);
    float _2026 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2014);
    float _2028 = rsqrt(_2016);
    float _2030 = -_2024;
    float _2032 = _2030 + 1.0;
    float _2034 = _2026 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2036 = fma(_1534, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2038 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2040 = abs(_2032);
    float _2042 = log2(_2040);
    float _2044 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2046 = fma(_1552, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2048 = -_2038;
    float _2050 = fma(_2048, _2018, 1.0);
    float _2052 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2054 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2044);
    float _2056 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2058 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2052);
    float _2060 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2054);
    float _2062 = _2028 * _1988;
    float _2064 = floor(_2036);
    float _2066 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2058);
    float _2068 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2070 = _2028 * _2000;
    float _2072 = _2028 * _1992;
    float _2074 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2076 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2056);
    float _2078 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2080 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2082 = -_2074;
    float _2084 = fma(_2070, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2082);
    float _2086 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2076);
    float _2088 = floor(_2046);
    float _2090 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2080);
    float _2092 = -_2072;
    float _2094 = fma(_2092, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2084);
    float _2096 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2098 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2100 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2090);
    float _2102 = fma(_2094, -0.5, 0.5);
    float _2104 = -_2064;
    float _2106 = _2036 + _2104;
    float _2108 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2100);
    float _2110 = fma(_2094, 0.5, 0.5);
    float _2112 = log2(_2050);
    float _2114 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2116 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2118 = fma(_2110, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2120 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2114);
    float _2122 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2116);
    float _2124 = fma(_2110, _2118, -0.212114393711090087890625);
    float _2126 = 1.0 / _2108;
    float _2128 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2120);
    float _2130 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2122);
    float _2132 = -_2088;
    float _2134 = _2046 + _2132;
    float _2136 = _2070 + 1.0;
    float _2138 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2128);
    float _2140 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2130);
    float _2142 = fma(_2110, _2124, 1.570728778839111328125);
    float _2144 = exp2(_2098);
    float _2146 = _2112 * 0.693147182464599609375;
    float _2148 = sqrt(_2102);
    float _2150 = _2138 * _2126;
    float _2152 = _2140 * _2126;
    float2 _6097 = float2(_2106, _2134);
    float _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6097, float2(0.0), isnan(_6097)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6097, float2(0.0), isnan(_6097)), level(0.0)).x;
    float _2156 = _2146 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2158 = fma(_2150, 0.5, 0.5);
    float _2160 = fma(_2152, -0.5, 0.5);
    float _2162 = -_2070;
    float _2164 = fma(_2144, _2136, _2162);
    float _2166 = fma(_2164, 0.5, 0.5);
    float _2168 = _2148 * 0.636619746685028076171875;
    float3 _6127 = float3(_2158, _2160, _2156);
    float _2170 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6127, float3(0.0), isnan(_6127)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6127, float3(0.0), isnan(_6127)), level(0.0)).x;
    float3 _6138 = float3(_2158, _2160, _2156);
    float4 _2173 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6138, float3(0.0), isnan(_6138)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6138, float3(0.0), isnan(_6138)), level(0.0)).xyzw;
    float _2175 = _2173.x;
    float _2177 = _2173.y;
    float _2179 = _2173.z;
    float _2181 = _2173.w;
    float _2183 = -_2142;
    float _2185 = fma(_2168, _2183, 1.0);
    float2 _6159 = float2(_2185, _2166);
    float3 _2189 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6159, float2(0.0), isnan(_6159)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6159, float2(0.0), isnan(_6159)), level(0.0)).xyz;
    float _2191 = _2189.x;
    float _2193 = _2189.y;
    float _2195 = _2189.z;
    float _2197 = abs(_1718);
    float _2199 = log2(_2197);
    float _2201 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2203 = in.m_97.x;
    bool _2205 = _1978 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2207 = isnan(_1978);
    bool _2209 = _2205 || _2207;
    bool _2211 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2213 = _2209 || _2211;
    float _2215 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2201);
    out.m_99.x = _1534;
    out.m_99.y = _1538;
    out.m_99.z = _1552;
    bool _2217 = _1718 <= 8000.0;
    bool _2219 = isnan(_1718);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan(8000.0);
    bool _2225 = _2221 || _2223;
    float _2227 = float(_2225);
    float _2229 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2215);
    out.m_101.x = _1792;
    out.m_101.y = _1790;
    out.m_101.z = _1794;
    float _2231 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2233 = exp2(_2231);
    float _2235 = fma(_2233, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2237 = precise::clamp(_2235, 0.0, 1.0);
    float _2239 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2241 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2229);
    float _2243 = _2138 + _2108;
    float _2245 = fma(_2237, -2.0, 3.0);
    float _2247 = _2237 * _2237;
    float _2249 = _2241 + _2108;
    float _2251 = exp2(_2239);
    float _2253 = _2247 * _2245;
    float _2255 = _2249 * 0.5;
    float _2257 = _2243 * 0.5;
    out.gl_Position.x = _2138;
    out.gl_Position.y = _2140;
    out.gl_Position.z = _2241;
    out.gl_Position.w = _2108;
    float _2259 = -_2253;
    float _2261 = _2259 + 1.0;
    float _2263 = fma(_2261, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2253);
    float _2265 = _2108 * 0.5;
    float _2267 = _2227 * _2263;
    float _2269 = fma(_2140, -0.5, _2265);
    float _2271 = -_2251;
    float _2273 = _2271 + 1.0;
    float _2275 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2277 = _2241;
    float _2279 = _2140;
    float _2281 = _2138;
    if (!_2213)
    {
        _2277 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2283 = _2277;
    float _2285 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_103.x = _2257;
    out.m_103.y = _2269;
    out.m_103.z = _2255;
    out.m_103.w = _2108;
    float _2287 = _2283;
    float _2289 = _2283;
    if (!_2213)
    {
        _2279 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2291 = _2279;
    float _2293 = _2291;
    float _2295 = _2291;
    if (!_2213)
    {
        _2281 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2297 = _2281;
    float _2299 = -_2154;
    float _2301 = _2299 + 1.0;
    float _2303 = _2301 * _2275;
    float _2305 = precise::clamp(_2303, 0.0, 1.0);
    float _2307 = -_2305;
    float _2309 = fma(_2307, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2311 = _2309 * _2203;
    float _2313 = _2285 * _2170;
    float _2315 = -_2285;
    float _2317 = _2315 + 1.0;
    float _2319 = _2311 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2321 = _2311;
    float _2323 = _2177;
    float _2325 = _2175;
    float _2327 = _2297;
    float _2329 = _2297;
    if (!_2213)
    {
        _2321 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2331 = _2321;
    float _2333 = _2181 * _2313;
    float _2335 = _2181 * _2317;
    out.m_105.x = _2319;
    float _2337 = _2195 * _2313;
    float _2339 = fma(_2191, _2333, _2175);
    float _2341 = fma(_2193, _2333, _2177);
    float _2343 = _2331;
    float _2345 = _2331;
    if (!_2213)
    {
        _2323 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2347 = _2323;
    float _2349 = fma(_2181, _2337, _2179);
    float _2351 = _1844 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2353 = _2347;
    float _2355 = _2347;
    if (!_2213)
    {
        _2325 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2357 = _2325;
    out.m_107.x = _2339;
    out.m_107.y = _2341;
    out.m_107.z = _2349;
    out.m_107.w = _2335;
    bool _2359 = !_2213;
    float _2361 = _2357;
    float _2363 = _2357;
    if (!_2359)
    {
        bool _2365 = _1978 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2367 = isnan(_1978);
        bool _2369 = _2365 || _2367;
        bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2373 = _2369 || _2371;
        if (!_2373)
        {
            float _2375 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2377 = _1978 + _2375;
            float _2379 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2381 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2379;
            float _2383 = 1.0 / _2381;
            float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2405 = _2377 * _2383;
            float _2407 = precise::clamp(_2405, 0.0, 1.0);
            float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2413 = fma(_2407, _2387, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2415 = fma(_2407, _2411, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2417 = fma(_2407, _2391, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2419 = fma(_2407, _2395, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2421 = fma(_2407, _2399, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2423 = fma(_2407, _2403, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2295 = _2415;
            _2363 = _2421;
            _2289 = _2413;
            _2355 = _2419;
            _2329 = _2417;
            _2345 = _2423;
            _2425 = true;
        }
        else
        {
            bool _2427 = _1978 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2429 = isnan(_1978);
            bool _2431 = _2427 || _2429;
            bool _2433 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2435 = _2431 || _2433;
            if (!_2435)
            {
                _2287 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2437 = _2287;
            _2289 = _2437;
            if (!_2435)
            {
                _2293 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2439 = _2293;
            _2295 = _2439;
            if (!_2435)
            {
                _2327 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2441 = _2327;
            _2329 = _2441;
            if (!_2435)
            {
                _2353 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2443 = _2353;
            _2355 = _2443;
            if (!_2435)
            {
                _2361 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2445 = _2361;
            _2363 = _2445;
            if (!_2435)
            {
                _2343 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2447 = _2343;
            bool _2449 = !_2435;
            _2345 = _2447;
            if (!_2449)
            {
                bool _2451 = _1978 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2453 = isnan(_1978);
                bool _2455 = _2451 || _2453;
                bool _2457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2459 = _2455 || _2457;
                if (!_2459)
                {
                    float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2463 = _1978 + _2461;
                    float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2467 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2465;
                    float _2469 = 1.0 / _2467;
                    float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2477 = _2475 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2491 = _2463 * _2469;
                    float _2493 = precise::clamp(_2491, 0.0, 1.0);
                    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2499 = fma(_2493, _2473, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2501 = fma(_2493, _2497, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2503 = fma(_2493, _2477, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2505 = fma(_2493, _2481, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2507 = fma(_2493, _2485, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2509 = fma(_2493, _2489, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2295 = _2501;
                    _2363 = _2507;
                    _2289 = _2499;
                    _2355 = _2505;
                    _2329 = _2503;
                    _2345 = _2509;
                    _2425 = true;
                }
                else
                {
                    _2295 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2363 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2289 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2355 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2329 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2345 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2425 = false;
    float _2511 = _2295;
    float _2513 = _2363;
    float _2515 = _2289;
    float _2517 = _2355;
    float _2519 = _2329;
    float _2521 = _2345;
    float _2523 = fma(_1518, -0.5, 0.5);
    float _2525 = precise::clamp(_2523, 0.0, 1.0);
    float _2527 = -_2511;
    float _2529 = _2527 + _2513;
    float _2531 = _2351 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2533 = -_2515;
    float _2535 = _2533 + _2517;
    out.m_109.x = 0.0;
    float _2537 = fma(_2525, _2529, _2511);
    float _2539 = fma(_2525, _2535, _2515);
    out.m_51.x = _2531;
    float _2541 = -_2519;
    float _2543 = _2541 + _2521;
    float _2545 = _2537 * 0.586610972881317138671875;
    bool _2547 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2549 = fma(_2525, _2543, _2519);
    float _2551 = fma(_2539, 0.298911988735198974609375, _2545);
    bool _2553 = _1844 > 0.0;
    bool _2555 = isnan(_1844);
    bool _2557 = _2553 || _2555;
    bool _2559 = isnan(0.0);
    bool _2561 = _2557 || _2559;
    float _2563 = fma(_2549, 0.114477999508380889892578125, _2551);
    float _2565 = -_2563;
    float _2567 = _2539 + _2565;
    float _2569 = -_2563;
    float _2571 = _2537 + _2569;
    float _2573 = -_2563;
    float _2575 = _2549 + _2573;
    float _2577 = fma(_2567, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2563);
    float _2579 = fma(_2571, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2563);
    float _2581 = fma(_2575, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2563);
    bool _2583 = !_2547;
    if (!_2583)
    {
        float _2585 = -_1790;
        float _2587 = _2585 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2589 = -_1792;
        float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2593 = -_1794;
        float _2595 = _2593 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2597 = _2587 * _2587;
        float _2599 = fma(_2591, _2591, _2597);
        float _2601 = fma(_2595, _2595, _2599);
        float _2603 = sqrt(_2601);
        float _2605 = rsqrt(_2601);
        float _2607 = -_2603;
        float _2609 = _2607 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2611 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2613 = precise::clamp(_2611, 0.0, 1.0);
        float _2615 = _2591 * _2605;
        float _2617 = _2587 * _2605;
        float _2619 = abs(_2613);
        float _2621 = log2(_2619);
        float _2623 = _2595 * _2605;
        float _2625 = _2615 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2627 = _1518 * _2617;
        float _2629 = -_2617;
        float _2631 = -_2625;
        float _2633 = fma(_2629, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2631);
        float _2635 = fma(_1528, _2615, _2627);
        float _2637 = -_2623;
        float _2639 = fma(_2637, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2633);
        float _2641 = fma(_1530, _2623, _2635);
        float _2643 = precise::clamp(_2641, 0.0, 1.0);
        float _2645 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2647 = _2639 + _2645;
        float _2649 = _2621 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2651 = _2647 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2653 = precise::clamp(_2651, 0.0, 1.0);
        float _2655 = exp2(_2649);
        float _2657 = _2655 * _2653;
        float _2659 = _2643 * _2657;
        float _2661 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2663 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2665 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _2661;
        out.m_109.y = _2663;
        out.m_109.z = _2665;
    }
    out.m_87.x = _2577;
    out.m_87.y = _2579;
    out.m_87.z = _2581;
    if (_2561)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2667 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2667;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2425 = false;
    bool _1588 = false;
    bool _682 = false;
    bool _538 = false;
    bool _248 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_48.w;
    float _125 = trunc(_123);
    int _128 = int(_125);
    bool _132 = _128 >= 1;
    float _134 = 0.0;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    float _138 = _136;
    if (!_132)
    {
        out.m_51.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _136 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2724 = as_type<float>(_144);
        out.gl_Position.z = _2724;
    }
    if (!_132)
    {
        return out;
    }
    float _148 = in.m_53.w;
    bool _150 = _148 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_148);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = -_148;
    float _162 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _164 = 0.0;
    float _166 = _162;
    if (_158)
    {
        float _168 = float(_128);
        _164 = _168;
    }
    float _170 = _164;
    bool _172 = _162 >= _170;
    bool _174 = !_158;
    bool _176 = _172 || _174;
    if (_176)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _138;
    if (_176)
    {
        out.m_51.x = 0.0;
    }
    if (_176)
    {
        float _180 = _178 * 5.0;
        _146 = as_type<int>(_180);
    }
    int _182 = _146;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2793 = as_type<float>(_182);
        out.gl_Position.z = _2793;
    }
    if (_176)
    {
        return out;
    }
    float _184 = in.m_55.x;
    float _186 = in.m_55.y;
    float _188 = in.m_55.z;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = in.m_59.x;
    float _200 = in.m_59.y;
    float _202 = in.m_59.z;
    float _204 = in.m_61.x;
    float _206 = in.m_61.y;
    float _208 = in.m_61.z;
    float _210 = _186 * _194;
    float _212 = _186 * _200;
    float _214 = fma(_184, _192, _210);
    float _216 = _186 * _206;
    float _218 = fma(_184, _198, _212);
    float _220 = fma(_184, _204, _216);
    float _222 = fma(_188, _196, _214);
    float _224 = fma(_188, _202, _218);
    float _226 = fma(_188, _208, _220);
    bool _228 = !_190;
    float _246;
    if (!_228)
    {
        float _230 = in.m_63.x;
        float _232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _234 = _230 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[12].x, _162);
        float _238 = _236 * _232;
        float _240 = floor(_238);
        float _242 = -_240;
        float _244 = _238 + _242;
        _246 = _244;
        _248 = true;
    }
    else
    {
        float _250 = float(_128);
        float _252 = 1.0 / _250;
        float _254 = _162 * _252;
        _246 = _254;
    }
    _248 = false;
    float _256 = _246;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = _256 + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _256 + _262;
    bool _266 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _268 = isnan(_256);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _294 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _296 = isnan(_256);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = _256 + _306;
    float _310 = 1.0 / _280;
    bool _312 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _314 = isnan(_256);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = 1.0 / _292;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _328 = 1.0 / _284;
    float _330 = _260 * _310;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _334 = _256 + _332;
    float _336 = 1.0 / _288;
    float _338 = _264 * _328;
    float _340 = _334 * _324;
    bool _342 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _344 = isnan(_256);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    bool _354 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _356 = isnan(_256);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _370 = -_352;
    float _372 = _370 + 1.0;
    float _374 = _308 * _336;
    float _376 = -_364;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _380;
    float _384 = _276 * _372;
    float _386 = -_276;
    float _388 = _386 + 1.0;
    float _390 = _352 * _378;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _396;
    float _400 = _304 * _388;
    float _402 = -_304;
    float _404 = _402 + 1.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = fma(_382, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = _322 * _404;
    float _418 = fma(_394, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _420 = fma(_398, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _422 = fma(_368, _338, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = _410 * _416;
    float _426 = fma(_408, _338, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _428 = fma(_414, _338, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _430;
    float _434 = _418 * _416;
    float _436 = _420 * _416;
    float _438 = -_322;
    float _440 = _438 + 1.0;
    float _442 = in.m_65.x;
    float _444 = in.m_65.y;
    float _446 = in.m_65.z;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _452;
    float _456 = fma(_432, _374, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _458 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].x, _434);
    float _460 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].y, _436);
    float _462 = fma(_450, _374, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _464 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].z, _424);
    float _466 = fma(_454, _374, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _468 = fma(_422, _400, _458);
    float _470 = fma(_426, _400, _460);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _484 = fma(_428, _400, _464);
    float _486 = fma(_474, _340, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _488 = fma(_478, _340, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _490 = fma(_482, _340, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _492 = fma(_456, _384, _468);
    float _494 = fma(_462, _384, _470);
    float _496 = fma(_466, _384, _484);
    float _498 = fma(_486, _390, _492);
    float _500 = fma(_488, _390, _494);
    float _502 = fma(_490, _390, _496);
    float _504 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[147].x, _498);
    float _506 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[147].y, _500);
    float _508 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[147].z, _502);
    float _510 = _504 * _442;
    float _512 = _506 * _444;
    float _514 = _508 * _446;
    bool _516 = !_326;
    float _518 = _504;
    float _536;
    if (!_516)
    {
        float _520 = in.m_63.x;
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _524 = _520 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[11].y, _162);
        float _528 = _526 * _522;
        float _530 = floor(_528);
        float _532 = -_530;
        float _534 = _528 + _532;
        _536 = _534;
        _538 = true;
    }
    else
    {
        float _540 = float(_128);
        float _542 = 1.0 / _540;
        float _544 = _162 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _550 = _546 + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _556 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _558 = isnan(_546);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _572 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _574 = isnan(_546);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _584;
    bool _588 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _590 = isnan(_546);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = 1.0 / _554;
    float _602 = -_566;
    float _604 = _602 + 1.0;
    bool _606 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _608 = -_598;
    float _610 = _608 + 1.0;
    float _612 = 1.0 / _570;
    float _614 = _566 * _610;
    float _616 = _586 * _600;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _622 = fma(_616, _550, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _624 = _582 * _604;
    float _626 = -_582;
    float _628 = _626 + 1.0;
    float _630 = _620 * _612;
    float _632 = _622 * _624;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _636 = _546 + _634;
    float _638 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[115].x, _632);
    float _640 = fma(_630, _636, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _644 = fma(_640, _614, _638);
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _648 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _652 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[117].x, _644);
    float _654 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _652 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _648;
    out.m_67.y = _654;
    out.m_67.z = _656;
    out.m_67.w = _658;
    bool _660 = !_606;
    float _662 = _656;
    float _680;
    if (!_660)
    {
        float _664 = in.m_63.x;
        float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _668 = _664 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[11].w, _162);
        float _672 = _670 * _666;
        float _674 = floor(_672);
        float _676 = -_674;
        float _678 = _672 + _676;
        _680 = _678;
        _682 = true;
    }
    else
    {
        float _684 = float(_128);
        float _686 = 1.0 / _684;
        float _688 = _162 * _686;
        _680 = _688;
    }
    _682 = false;
    float _690 = _680;
    float _692 = in.m_69.y;
    float _694 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _696 = in.m_63.w;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _700 = _698 != 0;
    float _702 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _706 = _704 != 0;
    float _708 = in.m_48.x;
    float _710 = in.m_48.y;
    float _712 = in.m_48.z;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _716 = _714 != 0;
    float _718 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _722 = _720 != 0;
    float _724 = in.m_63.z;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _728 = _726 != 0;
    float _730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _732 = in.m_63.y;
    float _734 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _736 = in.m_63.x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _740 = in.m_71.x;
    float _742 = -_692;
    float _744 = _742 + 1.0;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _748 = in.m_71.y;
    bool _750 = _696 > 0.5;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _754 = _730 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _756 = in.m_71.z;
    float _758 = _194 * _710;
    int _760 = _750 ? as_type<int>(_744) : as_type<int>(_692);
    float _762 = _200 * _710;
    float _764 = in.m_71.w;
    bool _766 = _724 > 0.5;
    float _768 = _206 * _710;
    float _770 = _724;
    float _772 = _692;
    if (!_700)
    {
        _518 = _724;
    }
    float _774 = _518;
    float _776 = fma(_198, _708, _762);
    float _778 = _774;
    if (!_700)
    {
        _662 = _732;
    }
    float _780 = _662;
    float _782 = fma(_204, _708, _768);
    float _784 = _780;
    if (_700)
    {
        _770 = _732;
    }
    float _786 = _770;
    float _788 = _736 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_700)
    {
        _784 = _736;
    }
    float _790 = _784;
    float _792 = in.m_61.w;
    if (_700)
    {
        _778 = _732;
    }
    float _794 = _778;
    float _796 = -_738;
    float _798 = fma(_788, 2.0, _796);
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _802 = _800 != 0;
    out.m_73.x = _740;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _806 = _804 != 0;
    float _808 = fma(_192, _708, _758);
    out.m_73.y = _748;
    float _810 = fma(_208, _712, _782);
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _816 = _722 ? as_type<float>(_760) : _692;
    out.m_73.z = _756;
    bool _818 = _732 > 0.5;
    float _820 = 1.0 / _814;
    float _822 = in.m_75.x;
    float _824 = in.m_75.y;
    float _826 = in.m_75.z;
    float _828 = in.m_75.w;
    int _830 = _818 ? as_type<int>(_744) : as_type<int>(_692);
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _834 = fma(_202, _712, _776);
    out.m_73.w = _764;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _840 = _802 ? as_type<float>(_830) : _692;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _844 = 1.0 / _838;
    bool _846 = _802;
    float _848 = _834;
    float _850 = _798;
    if (_706)
    {
        bool _852 = _736 > 0.5;
        _846 = _852;
    }
    bool _854 = _846;
    float _856 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[78].w, _842);
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _860 = _732 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _868 = _690 + _866;
    float _870 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[78].z, _858);
    float _872 = fma(_860, -2.0, _832);
    float _874 = fma(_196, _712, _808);
    float _876 = 1.0 / _864;
    float _878 = in.m_59.w;
    float _880 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _856);
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _882;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _890 = _824 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _892 = _828;
    if (_806)
    {
        float _894 = _766 ? _744 : _692;
        _772 = _894;
    }
    float _896 = _772;
    float _898 = _884 * _820;
    float _900 = in.m_57.w;
    float _902 = _824 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _904 = _888 * _844;
    float _906 = _824 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _908;
    float _912 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[26].x, _902);
    float _914 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[25].x, _890);
    float _916 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[24].x, _906);
    float _918 = _910 * _876;
    float _920 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[26].z, _912);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _924 = _690 + _922;
    float _926 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[24].z, _916);
    float _928 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[25].z, _914);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _932 = _690 + _930;
    float _934 = fma(_898, _924, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _938 = _834 + _878;
    float _940 = fma(_918, _932, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _942 = _810 + _792;
    out.m_77.x = _926;
    out.m_77.y = _928;
    out.m_77.z = _920;
    float _944 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _946 = _938 + _944;
    float _948 = fma(_904, _868, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _952 = _942 + _950;
    float _954 = _874 + _900;
    float _956 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _872);
    bool _958 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _960 = isnan(_690);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = in.m_69.x;
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _974 = _954 + _972;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _978 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[83].z, _746);
    float _980 = _946 * _946;
    float _982 = _936 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _984 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[83].w, _976);
    bool _986 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _988 = isnan(_690);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = fma(_974, _974, _980);
    float _1000 = fma(_982, _840, -0.5);
    float _1002 = _694 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1004 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1006 = isnan(_690);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1012 = _1008 || _1010;
    float _1014 = float(_1012);
    float _1016 = fma(_952, _952, _998);
    float _1018 = -_956;
    float _1020 = fma(_880, _1000, _1018);
    bool _1022 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1024 = isnan(_690);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1030 = _1026 || _1028;
    float _1032 = float(_1030);
    float _1034 = -_996;
    float _1036 = _1034 + 1.0;
    float _1038 = sqrt(_1016);
    float _1040 = fma(_816, _1002, -0.5);
    float _1042 = _790 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1044 = in.m_79.x;
    float _1046 = in.m_79.y;
    float _1048 = in.m_79.z;
    float _1050 = _1032 * _1036;
    float _1052 = -_1032;
    float _1054 = _1052 + 1.0;
    float _1056 = _702 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1058 = -_752;
    float _1060 = fma(_1042, 2.0, _1058);
    float _1062 = rsqrt(_1016);
    float _1064 = _1014 * _1054;
    float _1066 = -_1014;
    float _1068 = _1066 + 1.0;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1072 = _786 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1074 = as_type<int>(_946);
    float _1076 = _970;
    float _1078 = _984;
    float _1080 = _968;
    if (!_706)
    {
        _848 = _970;
    }
    float _1082 = _848;
    float _1084 = _968 * _1068;
    int _1086 = 0;
    float _1088 = _1082;
    if (_728)
    {
        float _1090 = -_970;
        float _1092 = _1090 + 1.0;
        _1086 = as_type<int>(_1092);
    }
    int _1094 = _1086;
    float _1096 = _1038 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1098 = fma(_1072, -2.0, _1070);
    float _1100 = _934 * _1084;
    float _1102 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _870);
    float _1104 = precise::min(_1056, _1096);
    float _1106 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1098);
    float _1108 = in.m_81.x;
    float _1110 = in.m_81.y;
    float _1112 = in.m_81.z;
    float _1114 = _1062 * _1104;
    bool _1116 = _1046 != 0.0;
    bool _1118 = isnan(_1046);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(0.0);
    bool _1124 = _1120 || _1122;
    float _1126 = _946 * _1114;
    float _1128 = _974 * _1114;
    float _1130 = _952 * _1114;
    bool _1132 = _1044 == 0.0;
    bool _1134 = !_1124;
    bool _1136 = _1132 && _1134;
    float _1138 = -_1126;
    float _1140 = _946 + _1138;
    float _1142 = -_1128;
    float _1144 = _974 + _1142;
    float _1146 = -_1130;
    float _1148 = _952 + _1146;
    bool _1150 = _1048 == 0.0;
    bool _1152 = _1150 && _1136;
    float _1154 = _1140 * _1140;
    float _1156 = _1140;
    float _1158 = _1144;
    float _1160 = _1128;
    if (_706)
    {
        float _1162 = -_970;
        float _1164 = _1162 + 1.0;
        _1074 = as_type<int>(_1164);
    }
    int _1166 = _1074;
    float _1168 = -_968;
    float _1170 = _1168 + 1.0;
    int _1172 = _1166;
    if (!_728)
    {
        _1156 = _970;
    }
    float _1174 = _1156;
    float _1176 = fma(_1144, _1144, _1154);
    float _1178 = _1174;
    if (!_716)
    {
        _1158 = _970;
    }
    float _1180 = _1158;
    float _1182 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1100);
    float _1184 = _1180;
    if (_706)
    {
        float _1186 = _854 ? as_type<float>(_1166) : _970;
        _1088 = _1186;
    }
    float _1188 = _1088;
    float _1190 = fma(_1148, _1148, _1176);
    if (_716)
    {
        float _1192 = -_970;
        float _1194 = _1192 + 1.0;
        _1172 = as_type<int>(_1194);
    }
    int _1196 = _1172;
    float _1198 = -_162;
    float _1200 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[76].x, _798);
    float _1202 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].z, _978);
    float _1204 = sqrt(_1190);
    float _1206 = _1110;
    if (_1152)
    {
        _850 = _1108;
    }
    float _1208 = _850;
    float _1210 = -_162;
    float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1060);
    float _1214 = _1208;
    if (_716)
    {
        float _1216 = _766 ? as_type<float>(_1196) : _970;
        _1184 = _1216;
    }
    float _1218 = _1184;
    float _1220 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].w, _984);
    if (_1152)
    {
        _166 = _1208;
    }
    float _1222 = _166;
    float _1224 = fma(_754, _1188, -0.5);
    float _1226 = _1222;
    if (!_1152)
    {
        _1214 = _1108;
    }
    float _1228 = _1214;
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_728)
    {
        float _1232 = _818 ? as_type<float>(_1094) : _970;
        _1178 = _1232;
    }
    float _1234 = _1178;
    float _1236 = -_1106;
    float _1238 = fma(_1220, _1040, _1236);
    if (!_1152)
    {
        float _1240 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1228);
        _1226 = _1240;
    }
    float _1242 = _1226;
    if (_1152)
    {
        _1076 = _1110;
    }
    float _1244 = _1076;
    float _1246 = _1244;
    if (_1152)
    {
        _1078 = _1112;
    }
    float _1248 = _1078;
    float _1250 = _1062 * _1204;
    float _1252 = fma(_948, _1064, _1182);
    float _1254 = _1248;
    if (_1152)
    {
        _1080 = _1244;
    }
    float _1256 = _1080;
    float _1258 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1046);
    float _1260 = _718 * _1250;
    float _1262 = _1256;
    if (!_1152)
    {
        _1246 = _1110;
    }
    float _1264 = _1246;
    float _1266 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1044);
    if (_1152)
    {
        _1206 = _1248;
    }
    float _1268 = _1206;
    float _1270 = _1260 * _1258;
    float _1272 = _1268;
    if (!_1152)
    {
        _1254 = _1112;
    }
    float _1274 = _1254;
    float _1276 = _702 * _1250;
    float _1278 = _734 * _1250;
    float _1280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1048);
    float _1282 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1284 = _1276 * _1266;
    float _1286 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1288 = _1278 * _1280;
    float _1290 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1292 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1282);
    float _1294 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1286);
    float _1296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (!_1152)
    {
        float _1298 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1274);
        _1272 = _1298;
    }
    float _1300 = _1272;
    float _1302 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1292);
    float _1304 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1294);
    float _1306 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1308 = _1300;
    if (!_1152)
    {
        float _1310 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1264);
        _1262 = _1310;
    }
    float _1312 = _1262;
    float _1314 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1316 = fma(_1290, _1218, -0.5);
    float _1318 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1322 = _942 + _1314;
    float _1324 = fma(_940, _1050, _1252);
    float _1326 = _954 + _1318;
    float _1328 = _896 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1332 = _1322 + _1330;
    float _1334 = _826 * _1228;
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1338 = _1326 + _1336;
    float _1340 = fma(_1102, _1224, _1200);
    float _1342 = _1332 * _1332;
    float _1344 = _824 * _1274;
    float _1346 = _1328 * _1296;
    float _1348 = -_1334;
    float _1350 = fma(_822, _1274, _1348);
    float _1352 = fma(_1338, _1338, _1342);
    float _1354 = _822 * _1264;
    float _1356 = -_1344;
    float _1358 = fma(_826, _1264, _1356);
    float _1360 = _1306 * _1320;
    float _1362 = sqrt(_1352);
    float _1364 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1366 = fma(_1202, _1316, _1212);
    float _1368 = _1020 + 0.5;
    out.m_83.x = _1360;
    out.m_83.y = _1346;
    float _1370 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1364);
    float _1372 = _1238 + 0.5;
    float _1374 = _1366 + 0.5;
    float _1376 = _1340 + 0.5;
    float _1378 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1370);
    float _1380 = -_1354;
    float _1382 = fma(_824, _1228, _1380);
    float _1384 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1386 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1388 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1390 = _1378 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_85.x = _1376;
    out.m_85.y = _1368;
    out.m_85.z = _1374;
    out.m_85.w = _1372;
    bool _1392 = _1362 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1394 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1384);
    float _1396 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1386);
    float _1398 = _1350 * _828;
    float _1400 = _1358 * _828;
    float _1402 = _1382 * _828;
    float _1404 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1324);
    float _1406 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1388);
    float _1408 = _938 + _1390;
    float _1410 = _1326;
    float _1412 = _1322;
    if (!_1392)
    {
        _892 = _1408;
    }
    float _1414 = _892;
    bool _1416 = !_1392;
    float _1418 = _1414;
    if (!_1416)
    {
        float _1420 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1424 = _1362 + _1422;
        float _1426 = _1408 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1428 = rsqrt(_1352);
        float _1430 = _1424 * _1420;
        float _1432 = _1430 * 0.15915493667125701904296875;
        float _1434 = _1432 * 6.283185482025146484375;
        float _1436 = cos(_1434);
        float _1438 = _1432 * 6.283185482025146484375;
        float _1440 = sin(_1438);
        float _1442 = _1436 + (-1.0);
        float _1444 = _1442 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1446 = fma(_1440, _1426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1448 = fma(_1408, _1436, _1444);
        float _1450 = _1428 * _1446;
        float _1452 = fma(_1338, _1450, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1454 = fma(_1332, _1450, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1418 = _1448;
        _1410 = _1452;
        _1412 = _1454;
    }
    float _1456 = _1418;
    float _1458 = _1410;
    float _1460 = _1412;
    float _1462 = -_1126;
    float _1464 = _1462 + _1456;
    float _1466 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1468 = -_1128;
    float _1470 = _1468 + _1458;
    float _1472 = -_1130;
    float _1474 = _1472 + _1460;
    float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1478 = _1464 + _1476;
    float _1480 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1466);
    float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1484 = _1470 + _1482;
    float _1486 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1488 = _1478 * _1478;
    float _1490 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1492 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1486);
    float _1494 = fma(_1484, _1484, _1488);
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1498 = _1474 + _1496;
    float _1500 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1490);
    float _1502 = fma(_1498, _1498, _1494);
    float _1504 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1492);
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1510 = sqrt(_1502);
    float _1512 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1514 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1480);
    float _1516 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1500);
    float _1518 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1396);
    float _1520 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1522 = _1508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1524 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1526 = _1404 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1528 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1394);
    float _1530 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1406);
    out.m_87.w = _1104;
    float _1532 = -_1128;
    float _1534 = _954 + _1532;
    float _1536 = -_1126;
    float _1538 = _938 + _1536;
    out.m_89.x = _1520;
    out.m_89.y = _1522;
    out.m_89.z = _1524;
    out.m_89.w = _1526;
    bool _1540 = _1510 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1542 = isnan(_1510);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1548 = _1544 || _1546;
    float _1550 = -_1130;
    float _1552 = _942 + _1550;
    out.m_91.x = _1514;
    out.m_91.y = _1504;
    out.m_91.z = _1516;
    out.m_93.x = _1276;
    out.m_95.x = _1528;
    out.m_95.y = _1518;
    out.m_95.z = _1530;
    if (!_1548)
    {
        _1308 = 1.0;
    }
    float _1554 = _1308;
    bool _1556 = !_1548;
    float _1558 = _1554;
    if (!_1556)
    {
        bool _1560 = _1510 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1562 = isnan(_1510);
        bool _1564 = _1560 || _1562;
        bool _1566 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1568 = _1564 || _1566;
        if (!_1568)
        {
            float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1572 = _1510 + _1570;
            float _1574 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1576 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1574;
            float _1578 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1580 = _1578 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1582 = 1.0 / _1576;
            float _1584 = _1572 * _1582;
            float _1586 = fma(_1584, _1580, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1558 = _1586;
            _1588 = true;
        }
        else
        {
            bool _1590 = _1510 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1592 = isnan(_1510);
            bool _1594 = _1590 || _1592;
            bool _1596 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1598 = _1594 || _1596;
            if (!_1598)
            {
                float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1602 = _1510 + _1600;
                float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1606 = _1604 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1610 = _1608 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1612 = 1.0 / _1606;
                float _1614 = _1602 * _1612;
                float _1616 = fma(_1614, _1610, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1558 = _1616;
                _1588 = true;
            }
            else
            {
                _1558 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1588 = false;
    float _1618 = _1558;
    float _1620 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1622 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1624 = _1464 + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1628 = _1470 + _1626;
    float _1630 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1632 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1620);
    float _1634 = fma(_1624, _1618, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1636 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1638 = _1474 + _1636;
    float _1640 = fma(_1628, _1618, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1642 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1632);
    float _1644 = -_1538;
    float _1646 = _1644 + _1634;
    float _1648 = fma(_1638, _1618, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1650 = -_1534;
    float _1652 = _1650 + _1640;
    float _1654 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1656 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1630);
    float _1658 = _1646 * _1646;
    float _1660 = -_1552;
    float _1662 = _1660 + _1648;
    float _1664 = 1.0 / _1654;
    float _1666 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1656);
    float _1668 = fma(_1652, _1652, _1658);
    float _1670 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1672 = fma(_1662, _1662, _1668);
    float _1674 = _1670 + _1654;
    float _1676 = sqrt(_1672);
    bool _1678 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1680 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan(0.5);
    bool _1686 = _1682 || _1684;
    float _1688 = _1674 * _1664;
    float _1690 = _1688 * 0.5;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1694 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1692);
    float _1696 = 1.0 / _1694;
    bool _1698 = _1676 > 0.0;
    float _1700 = _1676;
    float _1702 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1704 = _1690;
    float _1706 = _1664;
    float _1708 = _1648;
    if (_1686)
    {
        _1700 = 1.0;
    }
    float _1710 = _1700;
    float _1712 = _1710;
    if (!_1698)
    {
        _1702 = _1640;
    }
    float _1714 = _1702;
    float _1716 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1718 = _1696 * _1716;
    float _1720 = _1714;
    if (!_1698)
    {
        _1704 = _1634;
    }
    float _1722 = _1704;
    float _1724 = _1722;
    if (!_1698)
    {
        _1706 = _1648;
    }
    float _1726 = _1706;
    bool _1728 = !_1698;
    float _1730 = _1726;
    float _1732 = _1726;
    if (!_1728)
    {
        float _1734 = _224 * _224;
        float _1736 = fma(_222, _222, _1734);
        float _1738 = rsqrt(_1672);
        float _1740 = fma(_226, _226, _1736);
        float _1742 = sqrt(_1740);
        float _1744 = _1652 * _1738;
        float _1746 = _1646 * _1738;
        float _1748 = _1662 * _1738;
        bool _1750 = _1742 > 0.0;
        float _1752 = _1738;
        float _1754 = _1742;
        if (!_1750)
        {
            _1752 = _1640;
        }
        float _1756 = _1752;
        _1720 = _1756;
        if (!_1750)
        {
            _1754 = _1634;
        }
        float _1758 = _1754;
        _1724 = _1758;
        if (!_1750)
        {
            _1730 = _1648;
        }
        float _1760 = _1730;
        bool _1762 = !_1750;
        _1732 = _1760;
        if (!_1762)
        {
            float _1764 = rsqrt(_1740);
            float _1766 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1768 = _224 * _1764;
            float _1770 = _222 * _1764;
            float _1772 = _1746 * _1768;
            float _1774 = _226 * _1764;
            float _1776 = fma(_1744, _1770, _1772);
            float _1778 = _1766 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1780 = fma(_1748, _1774, _1776);
            float _1782 = _1780 * _1778;
            float _1784 = fma(_222, _1782, _1640);
            float _1786 = fma(_224, _1782, _1634);
            float _1788 = fma(_226, _1782, _1648);
            _1724 = _1786;
            _1720 = _1784;
            _1732 = _1788;
        }
    }
    float _1790 = _1724;
    float _1792 = _1720;
    float _1794 = _1732;
    if (!_1686)
    {
        float _1796 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1800 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1798;
        float _1802 = _1796 * 0.15915493667125701904296875;
        float _1804 = _1802 * 6.283185482025146484375;
        float _1806 = cos(_1804);
        float _1808 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1810 = _1808 * 0.15915493667125701904296875;
        float _1812 = _1802 * 6.283185482025146484375;
        float _1814 = sin(_1812);
        float _1816 = 1.0 / _1806;
        float _1818 = _1810 * 6.283185482025146484375;
        float _1820 = cos(_1818);
        float _1822 = _1814 * _1816;
        float _1824 = _1810 * 6.283185482025146484375;
        float _1826 = sin(_1824);
        float _1828 = _1820 * _1822;
        float _1830 = 1.0 / _1800;
        float _1832 = 1.0 / _1828;
        float _1834 = _1826 * _1832;
        float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1838 = fma(_1718, _1834, _1836);
        float _1840 = _1838 * _1830;
        float _1842 = precise::clamp(_1840, 0.0, 1.0);
        _1712 = _1842;
    }
    float _1844 = _1712;
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1848 = _1790 + _1846;
    float _1850 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1852 = _1792 + _1850;
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1856 = _1794 + _1854;
    float _1858 = _1848 * _1848;
    float _1860 = fma(_1852, _1852, _1858);
    float _1862 = fma(_1856, _1856, _1860);
    float _1864 = rsqrt(_1862);
    float _1866 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1868 = _1852 * _1866;
    float _1870 = _1856 * _1866;
    float _1872 = _1868 * _1868;
    float _1874 = _1870 * _1870;
    float _1876 = _1872 + _1874;
    float _1878 = sqrt(_1876);
    bool _1880 = _1878 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1884 = _1878 + _1882;
    float _1886 = _1864;
    float _1888 = _1876;
    float _1890 = _1884;
    float _1892 = _1848;
    float _1894 = _1868;
    if (_1880)
    {
        float _1896 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1886 = _1896;
    }
    float _1898 = _1886;
    if (_1880)
    {
        float _1900 = rsqrt(_1876);
        _1888 = _1900;
    }
    float _1902 = _1888;
    float _1904 = _1902;
    if (_1880)
    {
        float _1906 = _1884 * _1898;
        _1890 = _1906;
    }
    float _1908 = _1890;
    if (_1880)
    {
        float _1910 = _1908 * 0.15915493667125701904296875;
        _1708 = _1910;
    }
    float _1912 = _1708;
    float _1914 = _1898;
    float _1916 = _1912;
    if (_1880)
    {
        float _1918 = _1912 * 6.283185482025146484375;
        float _1920 = sin(_1918);
        _1914 = _1920;
    }
    float _1922 = _1914;
    float _1924 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1926 = precise::max(0.0, _1924);
    float _1928 = _1856;
    float _1930 = _1926;
    if (_1880)
    {
        float _1932 = _1912 * 6.283185482025146484375;
        float _1934 = cos(_1932);
        _1928 = _1934;
    }
    float _1936 = _1928;
    float _1938 = -_1866;
    float _1940 = -_1926;
    float _1942 = fma(_1848, _1938, _1940);
    float _1944 = _1942;
    if (_1880)
    {
        float _1946 = _1942 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1930 = _1946;
    }
    float _1948 = _1930;
    float _1950 = _1948;
    if (!_1880)
    {
        _1916 = _1868;
    }
    float _1952 = _1916;
    float _1954 = _1922;
    float _1956 = _1952;
    if (_1880)
    {
        float _1958 = fma(_1922, _1948, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1950 = _1958;
    }
    float _1960 = _1950;
    if (!_1880)
    {
        _1954 = _1870;
    }
    float _1962 = _1954;
    float _1964 = _1962;
    if (_1880)
    {
        float _1966 = _1936 + (-1.0);
        _1892 = _1966;
    }
    float _1968 = _1892;
    float _1970 = _1968;
    if (_1880)
    {
        float _1972 = _1902 * _1960;
        _1160 = _1972;
    }
    float _1974 = _1160;
    if (!_1880)
    {
        _1904 = _1872;
    }
    float _1976 = _1904;
    float _1978 = sqrt(_1862);
    float _1980 = _1976;
    if (_1880)
    {
        float _1982 = _1968 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1970 = _1982;
    }
    float _1984 = _1970;
    if (_1880)
    {
        float _1986 = _1868 * _1974;
        _1956 = _1986;
    }
    float _1988 = _1956;
    if (_1880)
    {
        float _1990 = _1870 * _1974;
        _1964 = _1990;
    }
    float _1992 = _1964;
    if (!_1880)
    {
        _1894 = _1874;
    }
    float _1994 = _1894;
    float _1996 = _1994;
    if (_1880)
    {
        float _1998 = fma(_1942, _1936, _1984);
        _1944 = _1998;
    }
    float _2000 = _1944;
    if (_1880)
    {
        float _2002 = _1988 * _1988;
        _1980 = _2002;
    }
    float _2004 = _1980;
    if (_1880)
    {
        float _2006 = _1992 * _1992;
        _1996 = _2006;
    }
    float _2008 = _1996;
    float _2010 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2012 = fma(_2000, _2000, _2004);
    float _2014 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2010);
    float _2016 = _2012 + _2008;
    float _2018 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2022 = fma(_1978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2020);
    float _2024 = precise::clamp(_2022, 0.0, 1.0);
    float _2026 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2014);
    float _2028 = rsqrt(_2016);
    float _2030 = -_2024;
    float _2032 = _2030 + 1.0;
    float _2034 = _2026 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2036 = fma(_1534, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2038 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2040 = abs(_2032);
    float _2042 = log2(_2040);
    float _2044 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2046 = fma(_1552, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2048 = -_2038;
    float _2050 = fma(_2048, _2018, 1.0);
    float _2052 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2054 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2044);
    float _2056 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2058 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2052);
    float _2060 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2054);
    float _2062 = _2028 * _1988;
    float _2064 = floor(_2036);
    float _2066 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2058);
    float _2068 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2070 = _2028 * _2000;
    float _2072 = _2028 * _1992;
    float _2074 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2076 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2056);
    float _2078 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2080 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2082 = -_2074;
    float _2084 = fma(_2070, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2082);
    float _2086 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2076);
    float _2088 = floor(_2046);
    float _2090 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2080);
    float _2092 = -_2072;
    float _2094 = fma(_2092, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2084);
    float _2096 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2098 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2100 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2090);
    float _2102 = fma(_2094, -0.5, 0.5);
    float _2104 = -_2064;
    float _2106 = _2036 + _2104;
    float _2108 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2100);
    float _2110 = fma(_2094, 0.5, 0.5);
    float _2112 = log2(_2050);
    float _2114 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2116 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2118 = fma(_2110, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2120 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2114);
    float _2122 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2116);
    float _2124 = fma(_2110, _2118, -0.212114393711090087890625);
    float _2126 = 1.0 / _2108;
    float _2128 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2120);
    float _2130 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2122);
    float _2132 = -_2088;
    float _2134 = _2046 + _2132;
    float _2136 = _2070 + 1.0;
    float _2138 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2128);
    float _2140 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2130);
    float _2142 = fma(_2110, _2124, 1.570728778839111328125);
    float _2144 = exp2(_2098);
    float _2146 = _2112 * 0.693147182464599609375;
    float _2148 = sqrt(_2102);
    float _2150 = _2138 * _2126;
    float _2152 = _2140 * _2126;
    float2 _6097 = float2(_2106, _2134);
    float _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6097, float2(0.0), isnan(_6097)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6097, float2(0.0), isnan(_6097)), level(0.0)).x;
    float _2156 = _2146 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2158 = fma(_2150, 0.5, 0.5);
    float _2160 = fma(_2152, -0.5, 0.5);
    float _2162 = -_2070;
    float _2164 = fma(_2144, _2136, _2162);
    float _2166 = fma(_2164, 0.5, 0.5);
    float _2168 = _2148 * 0.636619746685028076171875;
    float3 _6127 = float3(_2158, _2160, _2156);
    float _2170 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6127, float3(0.0), isnan(_6127)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6127, float3(0.0), isnan(_6127)), level(0.0)).x;
    float3 _6138 = float3(_2158, _2160, _2156);
    float4 _2173 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6138, float3(0.0), isnan(_6138)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6138, float3(0.0), isnan(_6138)), level(0.0)).xyzw;
    float _2175 = _2173.x;
    float _2177 = _2173.y;
    float _2179 = _2173.z;
    float _2181 = _2173.w;
    float _2183 = -_2142;
    float _2185 = fma(_2168, _2183, 1.0);
    float2 _6159 = float2(_2185, _2166);
    float3 _2189 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6159, float2(0.0), isnan(_6159)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6159, float2(0.0), isnan(_6159)), level(0.0)).xyz;
    float _2191 = _2189.x;
    float _2193 = _2189.y;
    float _2195 = _2189.z;
    float _2197 = abs(_1718);
    float _2199 = log2(_2197);
    float _2201 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2203 = in.m_97.x;
    bool _2205 = _1978 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2207 = isnan(_1978);
    bool _2209 = _2205 || _2207;
    bool _2211 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2213 = _2209 || _2211;
    float _2215 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2201);
    out.m_99.x = _1534;
    out.m_99.y = _1538;
    out.m_99.z = _1552;
    bool _2217 = _1718 <= 8000.0;
    bool _2219 = isnan(_1718);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan(8000.0);
    bool _2225 = _2221 || _2223;
    float _2227 = float(_2225);
    float _2229 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2215);
    out.m_101.x = _1792;
    out.m_101.y = _1790;
    out.m_101.z = _1794;
    float _2231 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2233 = exp2(_2231);
    float _2235 = fma(_2233, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2237 = precise::clamp(_2235, 0.0, 1.0);
    float _2239 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2241 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2229);
    float _2243 = _2138 + _2108;
    float _2245 = fma(_2237, -2.0, 3.0);
    float _2247 = _2237 * _2237;
    float _2249 = _2241 + _2108;
    float _2251 = exp2(_2239);
    float _2253 = _2247 * _2245;
    float _2255 = _2249 * 0.5;
    float _2257 = _2243 * 0.5;
    out.gl_Position.x = _2138;
    out.gl_Position.y = _2140;
    out.gl_Position.z = _2241;
    out.gl_Position.w = _2108;
    float _2259 = -_2253;
    float _2261 = _2259 + 1.0;
    float _2263 = fma(_2261, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2253);
    float _2265 = _2108 * 0.5;
    float _2267 = _2227 * _2263;
    float _2269 = fma(_2140, -0.5, _2265);
    float _2271 = -_2251;
    float _2273 = _2271 + 1.0;
    float _2275 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2277 = _2241;
    float _2279 = _2140;
    float _2281 = _2138;
    if (!_2213)
    {
        _2277 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2283 = _2277;
    float _2285 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_103.x = _2257;
    out.m_103.y = _2269;
    out.m_103.z = _2255;
    out.m_103.w = _2108;
    float _2287 = _2283;
    float _2289 = _2283;
    if (!_2213)
    {
        _2279 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2291 = _2279;
    float _2293 = _2291;
    float _2295 = _2291;
    if (!_2213)
    {
        _2281 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2297 = _2281;
    float _2299 = -_2154;
    float _2301 = _2299 + 1.0;
    float _2303 = _2301 * _2275;
    float _2305 = precise::clamp(_2303, 0.0, 1.0);
    float _2307 = -_2305;
    float _2309 = fma(_2307, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2311 = _2309 * _2203;
    float _2313 = _2285 * _2170;
    float _2315 = -_2285;
    float _2317 = _2315 + 1.0;
    float _2319 = _2311 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2321 = _2311;
    float _2323 = _2177;
    float _2325 = _2175;
    float _2327 = _2297;
    float _2329 = _2297;
    if (!_2213)
    {
        _2321 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2331 = _2321;
    float _2333 = _2181 * _2313;
    float _2335 = _2181 * _2317;
    out.m_105.x = _2319;
    float _2337 = _2195 * _2313;
    float _2339 = fma(_2191, _2333, _2175);
    float _2341 = fma(_2193, _2333, _2177);
    float _2343 = _2331;
    float _2345 = _2331;
    if (!_2213)
    {
        _2323 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2347 = _2323;
    float _2349 = fma(_2181, _2337, _2179);
    float _2351 = _1844 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2353 = _2347;
    float _2355 = _2347;
    if (!_2213)
    {
        _2325 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2357 = _2325;
    out.m_107.x = _2339;
    out.m_107.y = _2341;
    out.m_107.z = _2349;
    out.m_107.w = _2335;
    bool _2359 = !_2213;
    float _2361 = _2357;
    float _2363 = _2357;
    if (!_2359)
    {
        bool _2365 = _1978 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2367 = isnan(_1978);
        bool _2369 = _2365 || _2367;
        bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2373 = _2369 || _2371;
        if (!_2373)
        {
            float _2375 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2377 = _1978 + _2375;
            float _2379 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2381 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2379;
            float _2383 = 1.0 / _2381;
            float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2405 = _2377 * _2383;
            float _2407 = precise::clamp(_2405, 0.0, 1.0);
            float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2413 = fma(_2407, _2387, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2415 = fma(_2407, _2411, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2417 = fma(_2407, _2391, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2419 = fma(_2407, _2395, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2421 = fma(_2407, _2399, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2423 = fma(_2407, _2403, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2295 = _2415;
            _2363 = _2421;
            _2289 = _2413;
            _2355 = _2419;
            _2329 = _2417;
            _2345 = _2423;
            _2425 = true;
        }
        else
        {
            bool _2427 = _1978 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2429 = isnan(_1978);
            bool _2431 = _2427 || _2429;
            bool _2433 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2435 = _2431 || _2433;
            if (!_2435)
            {
                _2287 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2437 = _2287;
            _2289 = _2437;
            if (!_2435)
            {
                _2293 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2439 = _2293;
            _2295 = _2439;
            if (!_2435)
            {
                _2327 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2441 = _2327;
            _2329 = _2441;
            if (!_2435)
            {
                _2353 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2443 = _2353;
            _2355 = _2443;
            if (!_2435)
            {
                _2361 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2445 = _2361;
            _2363 = _2445;
            if (!_2435)
            {
                _2343 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2447 = _2343;
            bool _2449 = !_2435;
            _2345 = _2447;
            if (!_2449)
            {
                bool _2451 = _1978 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2453 = isnan(_1978);
                bool _2455 = _2451 || _2453;
                bool _2457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2459 = _2455 || _2457;
                if (!_2459)
                {
                    float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2463 = _1978 + _2461;
                    float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2467 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2465;
                    float _2469 = 1.0 / _2467;
                    float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2477 = _2475 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2491 = _2463 * _2469;
                    float _2493 = precise::clamp(_2491, 0.0, 1.0);
                    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2499 = fma(_2493, _2473, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2501 = fma(_2493, _2497, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2503 = fma(_2493, _2477, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2505 = fma(_2493, _2481, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2507 = fma(_2493, _2485, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2509 = fma(_2493, _2489, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2295 = _2501;
                    _2363 = _2507;
                    _2289 = _2499;
                    _2355 = _2505;
                    _2329 = _2503;
                    _2345 = _2509;
                    _2425 = true;
                }
                else
                {
                    _2295 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2363 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2289 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2355 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2329 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2345 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2425 = false;
    float _2511 = _2295;
    float _2513 = _2363;
    float _2515 = _2289;
    float _2517 = _2355;
    float _2519 = _2329;
    float _2521 = _2345;
    float _2523 = fma(_1518, -0.5, 0.5);
    float _2525 = precise::clamp(_2523, 0.0, 1.0);
    float _2527 = -_2511;
    float _2529 = _2527 + _2513;
    float _2531 = _2351 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2533 = -_2515;
    float _2535 = _2533 + _2517;
    out.m_109.x = 0.0;
    float _2537 = fma(_2525, _2529, _2511);
    float _2539 = fma(_2525, _2535, _2515);
    out.m_51.x = _2531;
    float _2541 = -_2519;
    float _2543 = _2541 + _2521;
    float _2545 = _2537 * 0.586610972881317138671875;
    bool _2547 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2549 = fma(_2525, _2543, _2519);
    float _2551 = fma(_2539, 0.298911988735198974609375, _2545);
    bool _2553 = _1844 > 0.0;
    bool _2555 = isnan(_1844);
    bool _2557 = _2553 || _2555;
    bool _2559 = isnan(0.0);
    bool _2561 = _2557 || _2559;
    float _2563 = fma(_2549, 0.114477999508380889892578125, _2551);
    float _2565 = -_2563;
    float _2567 = _2539 + _2565;
    float _2569 = -_2563;
    float _2571 = _2537 + _2569;
    float _2573 = -_2563;
    float _2575 = _2549 + _2573;
    float _2577 = fma(_2567, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2563);
    float _2579 = fma(_2571, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2563);
    float _2581 = fma(_2575, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2563);
    bool _2583 = !_2547;
    if (!_2583)
    {
        float _2585 = -_1790;
        float _2587 = _2585 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2589 = -_1792;
        float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2593 = -_1794;
        float _2595 = _2593 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2597 = _2587 * _2587;
        float _2599 = fma(_2591, _2591, _2597);
        float _2601 = fma(_2595, _2595, _2599);
        float _2603 = sqrt(_2601);
        float _2605 = rsqrt(_2601);
        float _2607 = -_2603;
        float _2609 = _2607 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2611 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2613 = precise::clamp(_2611, 0.0, 1.0);
        float _2615 = _2591 * _2605;
        float _2617 = _2587 * _2605;
        float _2619 = abs(_2613);
        float _2621 = log2(_2619);
        float _2623 = _2595 * _2605;
        float _2625 = _2615 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2627 = _1518 * _2617;
        float _2629 = -_2617;
        float _2631 = -_2625;
        float _2633 = fma(_2629, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2631);
        float _2635 = fma(_1528, _2615, _2627);
        float _2637 = -_2623;
        float _2639 = fma(_2637, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2633);
        float _2641 = fma(_1530, _2623, _2635);
        float _2643 = precise::clamp(_2641, 0.0, 1.0);
        float _2645 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2647 = _2639 + _2645;
        float _2649 = _2621 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2651 = _2647 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2653 = precise::clamp(_2651, 0.0, 1.0);
        float _2655 = exp2(_2649);
        float _2657 = _2655 * _2653;
        float _2659 = _2643 * _2657;
        float _2661 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2663 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2665 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _2661;
        out.m_109.y = _2663;
        out.m_109.z = _2665;
    }
    out.m_87.x = _2577;
    out.m_87.y = _2579;
    out.m_87.z = _2581;
    if (_2561)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2667 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2667;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2425 = false;
    bool _1588 = false;
    bool _682 = false;
    bool _538 = false;
    bool _248 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_48.w;
    float _125 = trunc(_123);
    int _128 = int(_125);
    bool _132 = _128 >= 1;
    float _134 = 0.0;
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    float _138 = _136;
    if (!_132)
    {
        out.m_51.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _136 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2724 = as_type<float>(_144);
        out.gl_Position.z = _2724;
    }
    if (!_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_53.w;
    bool _150 = _148 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _152 = isnan(_148);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _158 = _154 || _156;
    float _160 = -_148;
    float _162 = _160 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _164 = 0.0;
    float _166 = _162;
    if (_158)
    {
        float _168 = float(_128);
        _164 = _168;
    }
    float _170 = _164;
    bool _172 = _162 >= _170;
    bool _174 = !_158;
    bool _176 = _172 || _174;
    if (_176)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _138;
    if (_176)
    {
        out.m_51.x = 0.0;
    }
    if (_176)
    {
        float _180 = _178 * 5.0;
        _146 = as_type<int>(_180);
    }
    int _182 = _146;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2793 = as_type<float>(_182);
        out.gl_Position.z = _2793;
    }
    if (_176)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _184 = in.m_55.x;
    float _186 = in.m_55.y;
    float _188 = in.m_55.z;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = in.m_57.x;
    float _194 = in.m_57.y;
    float _196 = in.m_57.z;
    float _198 = in.m_59.x;
    float _200 = in.m_59.y;
    float _202 = in.m_59.z;
    float _204 = in.m_61.x;
    float _206 = in.m_61.y;
    float _208 = in.m_61.z;
    float _210 = _186 * _194;
    float _212 = _186 * _200;
    float _214 = fma(_184, _192, _210);
    float _216 = _186 * _206;
    float _218 = fma(_184, _198, _212);
    float _220 = fma(_184, _204, _216);
    float _222 = fma(_188, _196, _214);
    float _224 = fma(_188, _202, _218);
    float _226 = fma(_188, _208, _220);
    bool _228 = !_190;
    float _246;
    if (!_228)
    {
        float _230 = in.m_63.x;
        float _232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _234 = _230 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _236 = fma(_234, (*spvDescriptorSet0.vp_c9)._m0[12].x, _162);
        float _238 = _236 * _232;
        float _240 = floor(_238);
        float _242 = -_240;
        float _244 = _238 + _242;
        _246 = _244;
        _248 = true;
    }
    else
    {
        float _250 = float(_128);
        float _252 = 1.0 / _250;
        float _254 = _162 * _252;
        _246 = _254;
    }
    _248 = false;
    float _256 = _246;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = _256 + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _256 + _262;
    bool _266 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _268 = isnan(_256);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _294 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _296 = isnan(_256);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = _256 + _306;
    float _310 = 1.0 / _280;
    bool _312 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _314 = isnan(_256);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = 1.0 / _292;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _328 = 1.0 / _284;
    float _330 = _260 * _310;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _334 = _256 + _332;
    float _336 = 1.0 / _288;
    float _338 = _264 * _328;
    float _340 = _334 * _324;
    bool _342 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _344 = isnan(_256);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    bool _354 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _356 = isnan(_256);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _370 = -_352;
    float _372 = _370 + 1.0;
    float _374 = _308 * _336;
    float _376 = -_364;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _380;
    float _384 = _276 * _372;
    float _386 = -_276;
    float _388 = _386 + 1.0;
    float _390 = _352 * _378;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _396;
    float _400 = _304 * _388;
    float _402 = -_304;
    float _404 = _402 + 1.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _410 = fma(_382, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = _322 * _404;
    float _418 = fma(_394, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _420 = fma(_398, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _422 = fma(_368, _338, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = _410 * _416;
    float _426 = fma(_408, _338, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _428 = fma(_414, _338, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _430;
    float _434 = _418 * _416;
    float _436 = _420 * _416;
    float _438 = -_322;
    float _440 = _438 + 1.0;
    float _442 = in.m_65.x;
    float _444 = in.m_65.y;
    float _446 = in.m_65.z;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _452;
    float _456 = fma(_432, _374, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _458 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].x, _434);
    float _460 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].y, _436);
    float _462 = fma(_450, _374, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _464 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].z, _424);
    float _466 = fma(_454, _374, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _468 = fma(_422, _400, _458);
    float _470 = fma(_426, _400, _460);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _484 = fma(_428, _400, _464);
    float _486 = fma(_474, _340, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _488 = fma(_478, _340, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _490 = fma(_482, _340, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _492 = fma(_456, _384, _468);
    float _494 = fma(_462, _384, _470);
    float _496 = fma(_466, _384, _484);
    float _498 = fma(_486, _390, _492);
    float _500 = fma(_488, _390, _494);
    float _502 = fma(_490, _390, _496);
    float _504 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[147].x, _498);
    float _506 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[147].y, _500);
    float _508 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[147].z, _502);
    float _510 = _504 * _442;
    float _512 = _506 * _444;
    float _514 = _508 * _446;
    bool _516 = !_326;
    float _518 = _504;
    float _536;
    if (!_516)
    {
        float _520 = in.m_63.x;
        float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _524 = _520 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[11].y, _162);
        float _528 = _526 * _522;
        float _530 = floor(_528);
        float _532 = -_530;
        float _534 = _528 + _532;
        _536 = _534;
        _538 = true;
    }
    else
    {
        float _540 = float(_128);
        float _542 = 1.0 / _540;
        float _544 = _162 * _542;
        _536 = _544;
    }
    _538 = false;
    float _546 = _536;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _550 = _546 + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _556 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _558 = isnan(_546);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _572 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _574 = isnan(_546);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _584;
    bool _588 = _546 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _590 = isnan(_546);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = 1.0 / _554;
    float _602 = -_566;
    float _604 = _602 + 1.0;
    bool _606 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _608 = -_598;
    float _610 = _608 + 1.0;
    float _612 = 1.0 / _570;
    float _614 = _566 * _610;
    float _616 = _586 * _600;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _622 = fma(_616, _550, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _624 = _582 * _604;
    float _626 = -_582;
    float _628 = _626 + 1.0;
    float _630 = _620 * _612;
    float _632 = _622 * _624;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _636 = _546 + _634;
    float _638 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[115].x, _632);
    float _640 = fma(_630, _636, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _644 = fma(_640, _614, _638);
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _648 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _652 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[117].x, _644);
    float _654 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _652 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _648;
    out.m_67.y = _654;
    out.m_67.z = _656;
    out.m_67.w = _658;
    bool _660 = !_606;
    float _662 = _656;
    float _680;
    if (!_660)
    {
        float _664 = in.m_63.x;
        float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _668 = _664 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[11].w, _162);
        float _672 = _670 * _666;
        float _674 = floor(_672);
        float _676 = -_674;
        float _678 = _672 + _676;
        _680 = _678;
        _682 = true;
    }
    else
    {
        float _684 = float(_128);
        float _686 = 1.0 / _684;
        float _688 = _162 * _686;
        _680 = _688;
    }
    _682 = false;
    float _690 = _680;
    float _692 = in.m_69.y;
    float _694 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _696 = in.m_63.w;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _700 = _698 != 0;
    float _702 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _706 = _704 != 0;
    float _708 = in.m_48.x;
    float _710 = in.m_48.y;
    float _712 = in.m_48.z;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _716 = _714 != 0;
    float _718 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _722 = _720 != 0;
    float _724 = in.m_63.z;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _728 = _726 != 0;
    float _730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _732 = in.m_63.y;
    float _734 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _736 = in.m_63.x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _740 = in.m_71.x;
    float _742 = -_692;
    float _744 = _742 + 1.0;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _748 = in.m_71.y;
    bool _750 = _696 > 0.5;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _754 = _730 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _756 = in.m_71.z;
    float _758 = _194 * _710;
    int _760 = _750 ? as_type<int>(_744) : as_type<int>(_692);
    float _762 = _200 * _710;
    float _764 = in.m_71.w;
    bool _766 = _724 > 0.5;
    float _768 = _206 * _710;
    float _770 = _724;
    float _772 = _692;
    if (!_700)
    {
        _518 = _724;
    }
    float _774 = _518;
    float _776 = fma(_198, _708, _762);
    float _778 = _774;
    if (!_700)
    {
        _662 = _732;
    }
    float _780 = _662;
    float _782 = fma(_204, _708, _768);
    float _784 = _780;
    if (_700)
    {
        _770 = _732;
    }
    float _786 = _770;
    float _788 = _736 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_700)
    {
        _784 = _736;
    }
    float _790 = _784;
    float _792 = in.m_61.w;
    if (_700)
    {
        _778 = _732;
    }
    float _794 = _778;
    float _796 = -_738;
    float _798 = fma(_788, 2.0, _796);
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _802 = _800 != 0;
    out.m_73.x = _740;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _806 = _804 != 0;
    float _808 = fma(_192, _708, _758);
    out.m_73.y = _748;
    float _810 = fma(_208, _712, _782);
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _816 = _722 ? as_type<float>(_760) : _692;
    out.m_73.z = _756;
    bool _818 = _732 > 0.5;
    float _820 = 1.0 / _814;
    float _822 = in.m_75.x;
    float _824 = in.m_75.y;
    float _826 = in.m_75.z;
    float _828 = in.m_75.w;
    int _830 = _818 ? as_type<int>(_744) : as_type<int>(_692);
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _834 = fma(_202, _712, _776);
    out.m_73.w = _764;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _840 = _802 ? as_type<float>(_830) : _692;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _844 = 1.0 / _838;
    bool _846 = _802;
    float _848 = _834;
    float _850 = _798;
    if (_706)
    {
        bool _852 = _736 > 0.5;
        _846 = _852;
    }
    bool _854 = _846;
    float _856 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[78].w, _842);
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _860 = _732 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _864 = _862 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _868 = _690 + _866;
    float _870 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[78].z, _858);
    float _872 = fma(_860, -2.0, _832);
    float _874 = fma(_196, _712, _808);
    float _876 = 1.0 / _864;
    float _878 = in.m_59.w;
    float _880 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _856);
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _882;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _890 = _824 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _892 = _828;
    if (_806)
    {
        float _894 = _766 ? _744 : _692;
        _772 = _894;
    }
    float _896 = _772;
    float _898 = _884 * _820;
    float _900 = in.m_57.w;
    float _902 = _824 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _904 = _888 * _844;
    float _906 = _824 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _908;
    float _912 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[26].x, _902);
    float _914 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[25].x, _890);
    float _916 = fma(_822, (*spvDescriptorSet0.vp_c8)._m0[24].x, _906);
    float _918 = _910 * _876;
    float _920 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[26].z, _912);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _924 = _690 + _922;
    float _926 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[24].z, _916);
    float _928 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[25].z, _914);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _932 = _690 + _930;
    float _934 = fma(_898, _924, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _938 = _834 + _878;
    float _940 = fma(_918, _932, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _942 = _810 + _792;
    out.m_77.x = _926;
    out.m_77.y = _928;
    out.m_77.z = _920;
    float _944 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _946 = _938 + _944;
    float _948 = fma(_904, _868, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _952 = _942 + _950;
    float _954 = _874 + _900;
    float _956 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _872);
    bool _958 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _960 = isnan(_690);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = in.m_69.x;
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _974 = _954 + _972;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _978 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[83].z, _746);
    float _980 = _946 * _946;
    float _982 = _936 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _984 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[83].w, _976);
    bool _986 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _988 = isnan(_690);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = fma(_974, _974, _980);
    float _1000 = fma(_982, _840, -0.5);
    float _1002 = _694 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1004 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1006 = isnan(_690);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1012 = _1008 || _1010;
    float _1014 = float(_1012);
    float _1016 = fma(_952, _952, _998);
    float _1018 = -_956;
    float _1020 = fma(_880, _1000, _1018);
    bool _1022 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1024 = isnan(_690);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1030 = _1026 || _1028;
    float _1032 = float(_1030);
    float _1034 = -_996;
    float _1036 = _1034 + 1.0;
    float _1038 = sqrt(_1016);
    float _1040 = fma(_816, _1002, -0.5);
    float _1042 = _790 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1044 = in.m_79.x;
    float _1046 = in.m_79.y;
    float _1048 = in.m_79.z;
    float _1050 = _1032 * _1036;
    float _1052 = -_1032;
    float _1054 = _1052 + 1.0;
    float _1056 = _702 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1058 = -_752;
    float _1060 = fma(_1042, 2.0, _1058);
    float _1062 = rsqrt(_1016);
    float _1064 = _1014 * _1054;
    float _1066 = -_1014;
    float _1068 = _1066 + 1.0;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1072 = _786 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1074 = as_type<int>(_946);
    float _1076 = _970;
    float _1078 = _984;
    float _1080 = _968;
    if (!_706)
    {
        _848 = _970;
    }
    float _1082 = _848;
    float _1084 = _968 * _1068;
    int _1086 = 0;
    float _1088 = _1082;
    if (_728)
    {
        float _1090 = -_970;
        float _1092 = _1090 + 1.0;
        _1086 = as_type<int>(_1092);
    }
    int _1094 = _1086;
    float _1096 = _1038 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1098 = fma(_1072, -2.0, _1070);
    float _1100 = _934 * _1084;
    float _1102 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _870);
    float _1104 = precise::min(_1056, _1096);
    float _1106 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1098);
    float _1108 = in.m_81.x;
    float _1110 = in.m_81.y;
    float _1112 = in.m_81.z;
    float _1114 = _1062 * _1104;
    bool _1116 = _1046 != 0.0;
    bool _1118 = isnan(_1046);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(0.0);
    bool _1124 = _1120 || _1122;
    float _1126 = _946 * _1114;
    float _1128 = _974 * _1114;
    float _1130 = _952 * _1114;
    bool _1132 = _1044 == 0.0;
    bool _1134 = !_1124;
    bool _1136 = _1132 && _1134;
    float _1138 = -_1126;
    float _1140 = _946 + _1138;
    float _1142 = -_1128;
    float _1144 = _974 + _1142;
    float _1146 = -_1130;
    float _1148 = _952 + _1146;
    bool _1150 = _1048 == 0.0;
    bool _1152 = _1150 && _1136;
    float _1154 = _1140 * _1140;
    float _1156 = _1140;
    float _1158 = _1144;
    float _1160 = _1128;
    if (_706)
    {
        float _1162 = -_970;
        float _1164 = _1162 + 1.0;
        _1074 = as_type<int>(_1164);
    }
    int _1166 = _1074;
    float _1168 = -_968;
    float _1170 = _1168 + 1.0;
    int _1172 = _1166;
    if (!_728)
    {
        _1156 = _970;
    }
    float _1174 = _1156;
    float _1176 = fma(_1144, _1144, _1154);
    float _1178 = _1174;
    if (!_716)
    {
        _1158 = _970;
    }
    float _1180 = _1158;
    float _1182 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1100);
    float _1184 = _1180;
    if (_706)
    {
        float _1186 = _854 ? as_type<float>(_1166) : _970;
        _1088 = _1186;
    }
    float _1188 = _1088;
    float _1190 = fma(_1148, _1148, _1176);
    if (_716)
    {
        float _1192 = -_970;
        float _1194 = _1192 + 1.0;
        _1172 = as_type<int>(_1194);
    }
    int _1196 = _1172;
    float _1198 = -_162;
    float _1200 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[76].x, _798);
    float _1202 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].z, _978);
    float _1204 = sqrt(_1190);
    float _1206 = _1110;
    if (_1152)
    {
        _850 = _1108;
    }
    float _1208 = _850;
    float _1210 = -_162;
    float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1060);
    float _1214 = _1208;
    if (_716)
    {
        float _1216 = _766 ? as_type<float>(_1196) : _970;
        _1184 = _1216;
    }
    float _1218 = _1184;
    float _1220 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].w, _984);
    if (_1152)
    {
        _166 = _1208;
    }
    float _1222 = _166;
    float _1224 = fma(_754, _1188, -0.5);
    float _1226 = _1222;
    if (!_1152)
    {
        _1214 = _1108;
    }
    float _1228 = _1214;
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_728)
    {
        float _1232 = _818 ? as_type<float>(_1094) : _970;
        _1178 = _1232;
    }
    float _1234 = _1178;
    float _1236 = -_1106;
    float _1238 = fma(_1220, _1040, _1236);
    if (!_1152)
    {
        float _1240 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1228);
        _1226 = _1240;
    }
    float _1242 = _1226;
    if (_1152)
    {
        _1076 = _1110;
    }
    float _1244 = _1076;
    float _1246 = _1244;
    if (_1152)
    {
        _1078 = _1112;
    }
    float _1248 = _1078;
    float _1250 = _1062 * _1204;
    float _1252 = fma(_948, _1064, _1182);
    float _1254 = _1248;
    if (_1152)
    {
        _1080 = _1244;
    }
    float _1256 = _1080;
    float _1258 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1046);
    float _1260 = _718 * _1250;
    float _1262 = _1256;
    if (!_1152)
    {
        _1246 = _1110;
    }
    float _1264 = _1246;
    float _1266 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1044);
    if (_1152)
    {
        _1206 = _1248;
    }
    float _1268 = _1206;
    float _1270 = _1260 * _1258;
    float _1272 = _1268;
    if (!_1152)
    {
        _1254 = _1112;
    }
    float _1274 = _1254;
    float _1276 = _702 * _1250;
    float _1278 = _734 * _1250;
    float _1280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1048);
    float _1282 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1284 = _1276 * _1266;
    float _1286 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1288 = _1278 * _1280;
    float _1290 = _1230 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1292 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1282);
    float _1294 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1286);
    float _1296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    if (!_1152)
    {
        float _1298 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1274);
        _1272 = _1298;
    }
    float _1300 = _1272;
    float _1302 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1292);
    float _1304 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1294);
    float _1306 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1308 = _1300;
    if (!_1152)
    {
        float _1310 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1264);
        _1262 = _1310;
    }
    float _1312 = _1262;
    float _1314 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1316 = fma(_1290, _1218, -0.5);
    float _1318 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1322 = _942 + _1314;
    float _1324 = fma(_940, _1050, _1252);
    float _1326 = _954 + _1318;
    float _1328 = _896 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1330 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1332 = _1322 + _1330;
    float _1334 = _826 * _1228;
    float _1336 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1338 = _1326 + _1336;
    float _1340 = fma(_1102, _1224, _1200);
    float _1342 = _1332 * _1332;
    float _1344 = _824 * _1274;
    float _1346 = _1328 * _1296;
    float _1348 = -_1334;
    float _1350 = fma(_822, _1274, _1348);
    float _1352 = fma(_1338, _1338, _1342);
    float _1354 = _822 * _1264;
    float _1356 = -_1344;
    float _1358 = fma(_826, _1264, _1356);
    float _1360 = _1306 * _1320;
    float _1362 = sqrt(_1352);
    float _1364 = _1270 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1366 = fma(_1202, _1316, _1212);
    float _1368 = _1020 + 0.5;
    out.m_83.x = _1360;
    out.m_83.y = _1346;
    float _1370 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1364);
    float _1372 = _1238 + 0.5;
    float _1374 = _1366 + 0.5;
    float _1376 = _1340 + 0.5;
    float _1378 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1370);
    float _1380 = -_1354;
    float _1382 = fma(_824, _1228, _1380);
    float _1384 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1386 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1388 = _1312 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1390 = _1378 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_85.x = _1376;
    out.m_85.y = _1368;
    out.m_85.z = _1374;
    out.m_85.w = _1372;
    bool _1392 = _1362 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1394 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1384);
    float _1396 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1386);
    float _1398 = _1350 * _828;
    float _1400 = _1358 * _828;
    float _1402 = _1382 * _828;
    float _1404 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1324);
    float _1406 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1388);
    float _1408 = _938 + _1390;
    float _1410 = _1326;
    float _1412 = _1322;
    if (!_1392)
    {
        _892 = _1408;
    }
    float _1414 = _892;
    bool _1416 = !_1392;
    float _1418 = _1414;
    if (!_1416)
    {
        float _1420 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1424 = _1362 + _1422;
        float _1426 = _1408 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1428 = rsqrt(_1352);
        float _1430 = _1424 * _1420;
        float _1432 = _1430 * 0.15915493667125701904296875;
        float _1434 = _1432 * 6.283185482025146484375;
        float _1436 = cos(_1434);
        float _1438 = _1432 * 6.283185482025146484375;
        float _1440 = sin(_1438);
        float _1442 = _1436 + (-1.0);
        float _1444 = _1442 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1446 = fma(_1440, _1426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1448 = fma(_1408, _1436, _1444);
        float _1450 = _1428 * _1446;
        float _1452 = fma(_1338, _1450, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1454 = fma(_1332, _1450, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1418 = _1448;
        _1410 = _1452;
        _1412 = _1454;
    }
    float _1456 = _1418;
    float _1458 = _1410;
    float _1460 = _1412;
    float _1462 = -_1126;
    float _1464 = _1462 + _1456;
    float _1466 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1468 = -_1128;
    float _1470 = _1468 + _1458;
    float _1472 = -_1130;
    float _1474 = _1472 + _1460;
    float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1478 = _1464 + _1476;
    float _1480 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1466);
    float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1484 = _1470 + _1482;
    float _1486 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1488 = _1478 * _1478;
    float _1490 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1492 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1486);
    float _1494 = fma(_1484, _1484, _1488);
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1498 = _1474 + _1496;
    float _1500 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1490);
    float _1502 = fma(_1498, _1498, _1494);
    float _1504 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1492);
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1510 = sqrt(_1502);
    float _1512 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1514 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1480);
    float _1516 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1500);
    float _1518 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1396);
    float _1520 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1522 = _1508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1524 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1526 = _1404 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1528 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1394);
    float _1530 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1406);
    out.m_87.w = _1104;
    float _1532 = -_1128;
    float _1534 = _954 + _1532;
    float _1536 = -_1126;
    float _1538 = _938 + _1536;
    out.m_89.x = _1520;
    out.m_89.y = _1522;
    out.m_89.z = _1524;
    out.m_89.w = _1526;
    bool _1540 = _1510 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1542 = isnan(_1510);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1548 = _1544 || _1546;
    float _1550 = -_1130;
    float _1552 = _942 + _1550;
    out.m_91.x = _1514;
    out.m_91.y = _1504;
    out.m_91.z = _1516;
    out.m_93.x = _1276;
    out.m_95.x = _1528;
    out.m_95.y = _1518;
    out.m_95.z = _1530;
    if (!_1548)
    {
        _1308 = 1.0;
    }
    float _1554 = _1308;
    bool _1556 = !_1548;
    float _1558 = _1554;
    if (!_1556)
    {
        bool _1560 = _1510 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1562 = isnan(_1510);
        bool _1564 = _1560 || _1562;
        bool _1566 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1568 = _1564 || _1566;
        if (!_1568)
        {
            float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1572 = _1510 + _1570;
            float _1574 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1576 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1574;
            float _1578 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1580 = _1578 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1582 = 1.0 / _1576;
            float _1584 = _1572 * _1582;
            float _1586 = fma(_1584, _1580, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1558 = _1586;
            _1588 = true;
        }
        else
        {
            bool _1590 = _1510 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1592 = isnan(_1510);
            bool _1594 = _1590 || _1592;
            bool _1596 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1598 = _1594 || _1596;
            if (!_1598)
            {
                float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1602 = _1510 + _1600;
                float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1606 = _1604 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1610 = _1608 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1612 = 1.0 / _1606;
                float _1614 = _1602 * _1612;
                float _1616 = fma(_1614, _1610, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1558 = _1616;
                _1588 = true;
            }
            else
            {
                _1558 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1588 = false;
    float _1618 = _1558;
    float _1620 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1622 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1624 = _1464 + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1628 = _1470 + _1626;
    float _1630 = _1538 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1632 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1620);
    float _1634 = fma(_1624, _1618, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1636 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1638 = _1474 + _1636;
    float _1640 = fma(_1628, _1618, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1642 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1632);
    float _1644 = -_1538;
    float _1646 = _1644 + _1634;
    float _1648 = fma(_1638, _1618, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1650 = -_1534;
    float _1652 = _1650 + _1640;
    float _1654 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1656 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1630);
    float _1658 = _1646 * _1646;
    float _1660 = -_1552;
    float _1662 = _1660 + _1648;
    float _1664 = 1.0 / _1654;
    float _1666 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1656);
    float _1668 = fma(_1652, _1652, _1658);
    float _1670 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1672 = fma(_1662, _1662, _1668);
    float _1674 = _1670 + _1654;
    float _1676 = sqrt(_1672);
    bool _1678 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1680 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan(0.5);
    bool _1686 = _1682 || _1684;
    float _1688 = _1674 * _1664;
    float _1690 = _1688 * 0.5;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1694 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1692);
    float _1696 = 1.0 / _1694;
    bool _1698 = _1676 > 0.0;
    float _1700 = _1676;
    float _1702 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1704 = _1690;
    float _1706 = _1664;
    float _1708 = _1648;
    if (_1686)
    {
        _1700 = 1.0;
    }
    float _1710 = _1700;
    float _1712 = _1710;
    if (!_1698)
    {
        _1702 = _1640;
    }
    float _1714 = _1702;
    float _1716 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1718 = _1696 * _1716;
    float _1720 = _1714;
    if (!_1698)
    {
        _1704 = _1634;
    }
    float _1722 = _1704;
    float _1724 = _1722;
    if (!_1698)
    {
        _1706 = _1648;
    }
    float _1726 = _1706;
    bool _1728 = !_1698;
    float _1730 = _1726;
    float _1732 = _1726;
    if (!_1728)
    {
        float _1734 = _224 * _224;
        float _1736 = fma(_222, _222, _1734);
        float _1738 = rsqrt(_1672);
        float _1740 = fma(_226, _226, _1736);
        float _1742 = sqrt(_1740);
        float _1744 = _1652 * _1738;
        float _1746 = _1646 * _1738;
        float _1748 = _1662 * _1738;
        bool _1750 = _1742 > 0.0;
        float _1752 = _1738;
        float _1754 = _1742;
        if (!_1750)
        {
            _1752 = _1640;
        }
        float _1756 = _1752;
        _1720 = _1756;
        if (!_1750)
        {
            _1754 = _1634;
        }
        float _1758 = _1754;
        _1724 = _1758;
        if (!_1750)
        {
            _1730 = _1648;
        }
        float _1760 = _1730;
        bool _1762 = !_1750;
        _1732 = _1760;
        if (!_1762)
        {
            float _1764 = rsqrt(_1740);
            float _1766 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1768 = _224 * _1764;
            float _1770 = _222 * _1764;
            float _1772 = _1746 * _1768;
            float _1774 = _226 * _1764;
            float _1776 = fma(_1744, _1770, _1772);
            float _1778 = _1766 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1780 = fma(_1748, _1774, _1776);
            float _1782 = _1780 * _1778;
            float _1784 = fma(_222, _1782, _1640);
            float _1786 = fma(_224, _1782, _1634);
            float _1788 = fma(_226, _1782, _1648);
            _1724 = _1786;
            _1720 = _1784;
            _1732 = _1788;
        }
    }
    float _1790 = _1724;
    float _1792 = _1720;
    float _1794 = _1732;
    if (!_1686)
    {
        float _1796 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1798 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1800 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1798;
        float _1802 = _1796 * 0.15915493667125701904296875;
        float _1804 = _1802 * 6.283185482025146484375;
        float _1806 = cos(_1804);
        float _1808 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1810 = _1808 * 0.15915493667125701904296875;
        float _1812 = _1802 * 6.283185482025146484375;
        float _1814 = sin(_1812);
        float _1816 = 1.0 / _1806;
        float _1818 = _1810 * 6.283185482025146484375;
        float _1820 = cos(_1818);
        float _1822 = _1814 * _1816;
        float _1824 = _1810 * 6.283185482025146484375;
        float _1826 = sin(_1824);
        float _1828 = _1820 * _1822;
        float _1830 = 1.0 / _1800;
        float _1832 = 1.0 / _1828;
        float _1834 = _1826 * _1832;
        float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1838 = fma(_1718, _1834, _1836);
        float _1840 = _1838 * _1830;
        float _1842 = precise::clamp(_1840, 0.0, 1.0);
        _1712 = _1842;
    }
    float _1844 = _1712;
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1848 = _1790 + _1846;
    float _1850 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1852 = _1792 + _1850;
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1856 = _1794 + _1854;
    float _1858 = _1848 * _1848;
    float _1860 = fma(_1852, _1852, _1858);
    float _1862 = fma(_1856, _1856, _1860);
    float _1864 = rsqrt(_1862);
    float _1866 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1868 = _1852 * _1866;
    float _1870 = _1856 * _1866;
    float _1872 = _1868 * _1868;
    float _1874 = _1870 * _1870;
    float _1876 = _1872 + _1874;
    float _1878 = sqrt(_1876);
    bool _1880 = _1878 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1884 = _1878 + _1882;
    float _1886 = _1864;
    float _1888 = _1876;
    float _1890 = _1884;
    float _1892 = _1848;
    float _1894 = _1868;
    if (_1880)
    {
        float _1896 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1886 = _1896;
    }
    float _1898 = _1886;
    if (_1880)
    {
        float _1900 = rsqrt(_1876);
        _1888 = _1900;
    }
    float _1902 = _1888;
    float _1904 = _1902;
    if (_1880)
    {
        float _1906 = _1884 * _1898;
        _1890 = _1906;
    }
    float _1908 = _1890;
    if (_1880)
    {
        float _1910 = _1908 * 0.15915493667125701904296875;
        _1708 = _1910;
    }
    float _1912 = _1708;
    float _1914 = _1898;
    float _1916 = _1912;
    if (_1880)
    {
        float _1918 = _1912 * 6.283185482025146484375;
        float _1920 = sin(_1918);
        _1914 = _1920;
    }
    float _1922 = _1914;
    float _1924 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1926 = precise::max(0.0, _1924);
    float _1928 = _1856;
    float _1930 = _1926;
    if (_1880)
    {
        float _1932 = _1912 * 6.283185482025146484375;
        float _1934 = cos(_1932);
        _1928 = _1934;
    }
    float _1936 = _1928;
    float _1938 = -_1866;
    float _1940 = -_1926;
    float _1942 = fma(_1848, _1938, _1940);
    float _1944 = _1942;
    if (_1880)
    {
        float _1946 = _1942 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1930 = _1946;
    }
    float _1948 = _1930;
    float _1950 = _1948;
    if (!_1880)
    {
        _1916 = _1868;
    }
    float _1952 = _1916;
    float _1954 = _1922;
    float _1956 = _1952;
    if (_1880)
    {
        float _1958 = fma(_1922, _1948, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1950 = _1958;
    }
    float _1960 = _1950;
    if (!_1880)
    {
        _1954 = _1870;
    }
    float _1962 = _1954;
    float _1964 = _1962;
    if (_1880)
    {
        float _1966 = _1936 + (-1.0);
        _1892 = _1966;
    }
    float _1968 = _1892;
    float _1970 = _1968;
    if (_1880)
    {
        float _1972 = _1902 * _1960;
        _1160 = _1972;
    }
    float _1974 = _1160;
    if (!_1880)
    {
        _1904 = _1872;
    }
    float _1976 = _1904;
    float _1978 = sqrt(_1862);
    float _1980 = _1976;
    if (_1880)
    {
        float _1982 = _1968 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1970 = _1982;
    }
    float _1984 = _1970;
    if (_1880)
    {
        float _1986 = _1868 * _1974;
        _1956 = _1986;
    }
    float _1988 = _1956;
    if (_1880)
    {
        float _1990 = _1870 * _1974;
        _1964 = _1990;
    }
    float _1992 = _1964;
    if (!_1880)
    {
        _1894 = _1874;
    }
    float _1994 = _1894;
    float _1996 = _1994;
    if (_1880)
    {
        float _1998 = fma(_1942, _1936, _1984);
        _1944 = _1998;
    }
    float _2000 = _1944;
    if (_1880)
    {
        float _2002 = _1988 * _1988;
        _1980 = _2002;
    }
    float _2004 = _1980;
    if (_1880)
    {
        float _2006 = _1992 * _1992;
        _1996 = _2006;
    }
    float _2008 = _1996;
    float _2010 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2012 = fma(_2000, _2000, _2004);
    float _2014 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2010);
    float _2016 = _2012 + _2008;
    float _2018 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2022 = fma(_1978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2020);
    float _2024 = precise::clamp(_2022, 0.0, 1.0);
    float _2026 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2014);
    float _2028 = rsqrt(_2016);
    float _2030 = -_2024;
    float _2032 = _2030 + 1.0;
    float _2034 = _2026 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2036 = fma(_1534, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2038 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2040 = abs(_2032);
    float _2042 = log2(_2040);
    float _2044 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2046 = fma(_1552, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2048 = -_2038;
    float _2050 = fma(_2048, _2018, 1.0);
    float _2052 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2054 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2044);
    float _2056 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2058 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2052);
    float _2060 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2054);
    float _2062 = _2028 * _1988;
    float _2064 = floor(_2036);
    float _2066 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2058);
    float _2068 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2070 = _2028 * _2000;
    float _2072 = _2028 * _1992;
    float _2074 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2076 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2056);
    float _2078 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2080 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2082 = -_2074;
    float _2084 = fma(_2070, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2082);
    float _2086 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2076);
    float _2088 = floor(_2046);
    float _2090 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2080);
    float _2092 = -_2072;
    float _2094 = fma(_2092, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2084);
    float _2096 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2098 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2100 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2090);
    float _2102 = fma(_2094, -0.5, 0.5);
    float _2104 = -_2064;
    float _2106 = _2036 + _2104;
    float _2108 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2100);
    float _2110 = fma(_2094, 0.5, 0.5);
    float _2112 = log2(_2050);
    float _2114 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2116 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2118 = fma(_2110, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2120 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2114);
    float _2122 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2116);
    float _2124 = fma(_2110, _2118, -0.212114393711090087890625);
    float _2126 = 1.0 / _2108;
    float _2128 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2120);
    float _2130 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2122);
    float _2132 = -_2088;
    float _2134 = _2046 + _2132;
    float _2136 = _2070 + 1.0;
    float _2138 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2128);
    float _2140 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2130);
    float _2142 = fma(_2110, _2124, 1.570728778839111328125);
    float _2144 = exp2(_2098);
    float _2146 = _2112 * 0.693147182464599609375;
    float _2148 = sqrt(_2102);
    float _2150 = _2138 * _2126;
    float _2152 = _2140 * _2126;
    float2 _6097 = float2(_2106, _2134);
    float _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6097, float2(0.0), isnan(_6097)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6097, float2(0.0), isnan(_6097)), level(0.0)).x;
    float _2156 = _2146 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2158 = fma(_2150, 0.5, 0.5);
    float _2160 = fma(_2152, -0.5, 0.5);
    float _2162 = -_2070;
    float _2164 = fma(_2144, _2136, _2162);
    float _2166 = fma(_2164, 0.5, 0.5);
    float _2168 = _2148 * 0.636619746685028076171875;
    float3 _6127 = float3(_2158, _2160, _2156);
    float _2170 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6127, float3(0.0), isnan(_6127)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6127, float3(0.0), isnan(_6127)), level(0.0)).x;
    float3 _6138 = float3(_2158, _2160, _2156);
    float4 _2173 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6138, float3(0.0), isnan(_6138)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6138, float3(0.0), isnan(_6138)), level(0.0)).xyzw;
    float _2175 = _2173.x;
    float _2177 = _2173.y;
    float _2179 = _2173.z;
    float _2181 = _2173.w;
    float _2183 = -_2142;
    float _2185 = fma(_2168, _2183, 1.0);
    float2 _6159 = float2(_2185, _2166);
    float3 _2189 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6159, float2(0.0), isnan(_6159)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6159, float2(0.0), isnan(_6159)), level(0.0)).xyz;
    float _2191 = _2189.x;
    float _2193 = _2189.y;
    float _2195 = _2189.z;
    float _2197 = abs(_1718);
    float _2199 = log2(_2197);
    float _2201 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2203 = in.m_97.x;
    bool _2205 = _1978 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2207 = isnan(_1978);
    bool _2209 = _2205 || _2207;
    bool _2211 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2213 = _2209 || _2211;
    float _2215 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2201);
    out.m_99.x = _1534;
    out.m_99.y = _1538;
    out.m_99.z = _1552;
    bool _2217 = _1718 <= 8000.0;
    bool _2219 = isnan(_1718);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan(8000.0);
    bool _2225 = _2221 || _2223;
    float _2227 = float(_2225);
    float _2229 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2215);
    out.m_101.x = _1792;
    out.m_101.y = _1790;
    out.m_101.z = _1794;
    float _2231 = _2199 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2233 = exp2(_2231);
    float _2235 = fma(_2233, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2237 = precise::clamp(_2235, 0.0, 1.0);
    float _2239 = _2042 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2241 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2229);
    float _2243 = _2138 + _2108;
    float _2245 = fma(_2237, -2.0, 3.0);
    float _2247 = _2237 * _2237;
    float _2249 = _2241 + _2108;
    float _2251 = exp2(_2239);
    float _2253 = _2247 * _2245;
    float _2255 = _2249 * 0.5;
    float _2257 = _2243 * 0.5;
    out.gl_Position.x = _2138;
    out.gl_Position.y = _2140;
    out.gl_Position.z = _2241;
    out.gl_Position.w = _2108;
    float _2259 = -_2253;
    float _2261 = _2259 + 1.0;
    float _2263 = fma(_2261, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2253);
    float _2265 = _2108 * 0.5;
    float _2267 = _2227 * _2263;
    float _2269 = fma(_2140, -0.5, _2265);
    float _2271 = -_2251;
    float _2273 = _2271 + 1.0;
    float _2275 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2277 = _2241;
    float _2279 = _2140;
    float _2281 = _2138;
    if (!_2213)
    {
        _2277 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2283 = _2277;
    float _2285 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_103.x = _2257;
    out.m_103.y = _2269;
    out.m_103.z = _2255;
    out.m_103.w = _2108;
    float _2287 = _2283;
    float _2289 = _2283;
    if (!_2213)
    {
        _2279 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2291 = _2279;
    float _2293 = _2291;
    float _2295 = _2291;
    if (!_2213)
    {
        _2281 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2297 = _2281;
    float _2299 = -_2154;
    float _2301 = _2299 + 1.0;
    float _2303 = _2301 * _2275;
    float _2305 = precise::clamp(_2303, 0.0, 1.0);
    float _2307 = -_2305;
    float _2309 = fma(_2307, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2311 = _2309 * _2203;
    float _2313 = _2285 * _2170;
    float _2315 = -_2285;
    float _2317 = _2315 + 1.0;
    float _2319 = _2311 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2321 = _2311;
    float _2323 = _2177;
    float _2325 = _2175;
    float _2327 = _2297;
    float _2329 = _2297;
    if (!_2213)
    {
        _2321 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2331 = _2321;
    float _2333 = _2181 * _2313;
    float _2335 = _2181 * _2317;
    out.m_105.x = _2319;
    float _2337 = _2195 * _2313;
    float _2339 = fma(_2191, _2333, _2175);
    float _2341 = fma(_2193, _2333, _2177);
    float _2343 = _2331;
    float _2345 = _2331;
    if (!_2213)
    {
        _2323 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2347 = _2323;
    float _2349 = fma(_2181, _2337, _2179);
    float _2351 = _1844 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2353 = _2347;
    float _2355 = _2347;
    if (!_2213)
    {
        _2325 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2357 = _2325;
    out.m_107.x = _2339;
    out.m_107.y = _2341;
    out.m_107.z = _2349;
    out.m_107.w = _2335;
    bool _2359 = !_2213;
    float _2361 = _2357;
    float _2363 = _2357;
    if (!_2359)
    {
        bool _2365 = _1978 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2367 = isnan(_1978);
        bool _2369 = _2365 || _2367;
        bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2373 = _2369 || _2371;
        if (!_2373)
        {
            float _2375 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2377 = _1978 + _2375;
            float _2379 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2381 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2379;
            float _2383 = 1.0 / _2381;
            float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2405 = _2377 * _2383;
            float _2407 = precise::clamp(_2405, 0.0, 1.0);
            float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2413 = fma(_2407, _2387, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2415 = fma(_2407, _2411, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2417 = fma(_2407, _2391, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2419 = fma(_2407, _2395, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2421 = fma(_2407, _2399, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2423 = fma(_2407, _2403, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2295 = _2415;
            _2363 = _2421;
            _2289 = _2413;
            _2355 = _2419;
            _2329 = _2417;
            _2345 = _2423;
            _2425 = true;
        }
        else
        {
            bool _2427 = _1978 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2429 = isnan(_1978);
            bool _2431 = _2427 || _2429;
            bool _2433 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2435 = _2431 || _2433;
            if (!_2435)
            {
                _2287 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2437 = _2287;
            _2289 = _2437;
            if (!_2435)
            {
                _2293 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2439 = _2293;
            _2295 = _2439;
            if (!_2435)
            {
                _2327 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2441 = _2327;
            _2329 = _2441;
            if (!_2435)
            {
                _2353 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2443 = _2353;
            _2355 = _2443;
            if (!_2435)
            {
                _2361 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2445 = _2361;
            _2363 = _2445;
            if (!_2435)
            {
                _2343 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2447 = _2343;
            bool _2449 = !_2435;
            _2345 = _2447;
            if (!_2449)
            {
                bool _2451 = _1978 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2453 = isnan(_1978);
                bool _2455 = _2451 || _2453;
                bool _2457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2459 = _2455 || _2457;
                if (!_2459)
                {
                    float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2463 = _1978 + _2461;
                    float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2467 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2465;
                    float _2469 = 1.0 / _2467;
                    float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2477 = _2475 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2491 = _2463 * _2469;
                    float _2493 = precise::clamp(_2491, 0.0, 1.0);
                    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2499 = fma(_2493, _2473, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2501 = fma(_2493, _2497, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2503 = fma(_2493, _2477, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2505 = fma(_2493, _2481, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2507 = fma(_2493, _2485, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2509 = fma(_2493, _2489, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2295 = _2501;
                    _2363 = _2507;
                    _2289 = _2499;
                    _2355 = _2505;
                    _2329 = _2503;
                    _2345 = _2509;
                    _2425 = true;
                }
                else
                {
                    _2295 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2363 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2289 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2355 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2329 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2345 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2425 = false;
    float _2511 = _2295;
    float _2513 = _2363;
    float _2515 = _2289;
    float _2517 = _2355;
    float _2519 = _2329;
    float _2521 = _2345;
    float _2523 = fma(_1518, -0.5, 0.5);
    float _2525 = precise::clamp(_2523, 0.0, 1.0);
    float _2527 = -_2511;
    float _2529 = _2527 + _2513;
    float _2531 = _2351 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2533 = -_2515;
    float _2535 = _2533 + _2517;
    out.m_109.x = 0.0;
    float _2537 = fma(_2525, _2529, _2511);
    float _2539 = fma(_2525, _2535, _2515);
    out.m_51.x = _2531;
    float _2541 = -_2519;
    float _2543 = _2541 + _2521;
    float _2545 = _2537 * 0.586610972881317138671875;
    bool _2547 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2549 = fma(_2525, _2543, _2519);
    float _2551 = fma(_2539, 0.298911988735198974609375, _2545);
    bool _2553 = _1844 > 0.0;
    bool _2555 = isnan(_1844);
    bool _2557 = _2553 || _2555;
    bool _2559 = isnan(0.0);
    bool _2561 = _2557 || _2559;
    float _2563 = fma(_2549, 0.114477999508380889892578125, _2551);
    float _2565 = -_2563;
    float _2567 = _2539 + _2565;
    float _2569 = -_2563;
    float _2571 = _2537 + _2569;
    float _2573 = -_2563;
    float _2575 = _2549 + _2573;
    float _2577 = fma(_2567, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2563);
    float _2579 = fma(_2571, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2563);
    float _2581 = fma(_2575, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2563);
    bool _2583 = !_2547;
    if (!_2583)
    {
        float _2585 = -_1790;
        float _2587 = _2585 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2589 = -_1792;
        float _2591 = _2589 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2593 = -_1794;
        float _2595 = _2593 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2597 = _2587 * _2587;
        float _2599 = fma(_2591, _2591, _2597);
        float _2601 = fma(_2595, _2595, _2599);
        float _2603 = sqrt(_2601);
        float _2605 = rsqrt(_2601);
        float _2607 = -_2603;
        float _2609 = _2607 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2611 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2613 = precise::clamp(_2611, 0.0, 1.0);
        float _2615 = _2591 * _2605;
        float _2617 = _2587 * _2605;
        float _2619 = abs(_2613);
        float _2621 = log2(_2619);
        float _2623 = _2595 * _2605;
        float _2625 = _2615 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2627 = _1518 * _2617;
        float _2629 = -_2617;
        float _2631 = -_2625;
        float _2633 = fma(_2629, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2631);
        float _2635 = fma(_1528, _2615, _2627);
        float _2637 = -_2623;
        float _2639 = fma(_2637, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2633);
        float _2641 = fma(_1530, _2623, _2635);
        float _2643 = precise::clamp(_2641, 0.0, 1.0);
        float _2645 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2647 = _2639 + _2645;
        float _2649 = _2621 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2651 = _2647 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2653 = precise::clamp(_2651, 0.0, 1.0);
        float _2655 = exp2(_2649);
        float _2657 = _2655 * _2653;
        float _2659 = _2643 * _2657;
        float _2661 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2663 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2665 = _2659 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _2661;
        out.m_109.y = _2663;
        out.m_109.z = _2665;
    }
    out.m_87.x = _2577;
    out.m_87.y = _2579;
    out.m_87.z = _2581;
    if (_2561)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2667 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2667;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

