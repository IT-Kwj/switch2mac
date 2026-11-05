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
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_28 [[id(7)]];
    sampler vp_t_tcb_28Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_28Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_73 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_111 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_105 [[user(locn9)]];
    float4 m_99 [[user(locn10)]];
    float4 m_107 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_101 [[user(locn13)]];
    float4 m_103 [[user(locn14)]];
    float4 m_97 [[user(locn15)]];
    float4 m_113 [[user(locn16)]];
    float4 m_109 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_79 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_50 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_93 [[attribute(8)]];
    float4 m_91 [[attribute(9)]];
    float4 m_69 [[attribute(10)]];
    float4 m_71 [[attribute(11)]];
    float4 m_95 [[attribute(12)]];
    float4 m_57 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4676 = false;
    bool _3633 = false;
    bool _632 = false;
    bool _528 = false;
    bool _386 = false;
    bool _260 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_50.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_53.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4981 = as_type<float>(_148);
        out.gl_Position.z = _4981;
    }
    if (!_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_55.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_53.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5051 = as_type<float>(_186);
        out.gl_Position.z = _5051;
    }
    if (_178)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _188 = in.m_57.x;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = in.m_57.y;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = in.m_61.x;
    float _202 = in.m_61.y;
    float _204 = in.m_61.z;
    float _206 = in.m_63.x;
    float _208 = in.m_63.y;
    float _210 = in.m_63.z;
    float _212 = in.m_65.x;
    float _214 = in.m_65.y;
    float _216 = in.m_65.z;
    out.m_67.x = _188;
    out.m_67.y = _192;
    float _218 = _196 * _202;
    float _220 = _196 * _208;
    float _222 = fma(_194, _200, _218);
    float _224 = _196 * _214;
    float _226 = fma(_194, _206, _220);
    float _228 = fma(_194, _212, _224);
    float _230 = fma(_198, _204, _222);
    float _232 = fma(_198, _210, _226);
    float _234 = fma(_198, _216, _228);
    bool _236 = !_190;
    float _238 = _192;
    float _240 = _188;
    float _258;
    if (!_236)
    {
        float _242 = in.m_69.x;
        float _244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _246 = _242 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _248 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _250 = _248 * _244;
        float _252 = floor(_250);
        float _254 = -_252;
        float _256 = _250 + _254;
        _258 = _256;
        _260 = true;
    }
    else
    {
        float _262 = float(_132);
        float _264 = 1.0 / _262;
        float _266 = _166 * _264;
        _258 = _266;
    }
    _260 = false;
    float _268 = _258;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = _268 + _270;
    bool _274 = _268 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _276 = isnan(_268);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _286;
    float _290 = -_284;
    float _292 = _290 + 1.0;
    bool _294 = _268 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _296 = isnan(_268);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = 1.0 / _288;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _312;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = _272 * _306;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = in.m_71.x;
    float _326 = in.m_71.y;
    float _328 = in.m_71.z;
    float _330 = _304 * _292;
    float _332 = fma(_310, _318, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _334 = fma(_322, _318, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _336 = fma(_314, _318, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _338 = -_304;
    float _340 = _338 + 1.0;
    float _342 = _332 * _330;
    float _344 = _334 * _330;
    float _346 = _336 * _330;
    float _348 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].x, _342);
    float _350 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].y, _344);
    float _352 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].z, _346);
    float _354 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[144].x, _348);
    float _356 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[144].y, _350);
    float _358 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[144].z, _352);
    float _360 = _354 * _324;
    float _362 = _356 * _326;
    float _364 = _358 * _328;
    bool _366 = !_316;
    float _384;
    if (!_366)
    {
        float _368 = in.m_69.x;
        float _370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _372 = _368 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _374 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _376 = _374 * _370;
        float _378 = floor(_376);
        float _380 = -_378;
        float _382 = _376 + _380;
        _384 = _382;
        _386 = true;
    }
    else
    {
        float _388 = float(_132);
        float _390 = 1.0 / _388;
        float _392 = _166 * _390;
        _384 = _392;
    }
    _386 = false;
    float _394 = _384;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _398 = _394 + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _404 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _406 = isnan(_394);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _420 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _422 = isnan(_394);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _432;
    bool _436 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _438 = isnan(_394);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = 1.0 / _402;
    float _450 = -_414;
    float _452 = _450 + 1.0;
    bool _454 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _456 = 1.0 / _418;
    float _458 = _434 * _448;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _464 = -_446;
    float _466 = _464 + 1.0;
    float _468 = fma(_458, _398, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _470 = _430 * _452;
    float _472 = -_430;
    float _474 = _472 + 1.0;
    float _476 = _414 * _466;
    float _478 = _462 * _456;
    float _480 = _468 * _470;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _484 = _394 + _482;
    float _486 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[115].x, _480);
    float _488 = fma(_478, _484, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _492 = fma(_488, _476, _486);
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _496 = _490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _500 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[117].x, _492);
    float _502 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _500 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_73.x = _496;
    out.m_73.y = _502;
    out.m_73.z = _504;
    out.m_73.w = _506;
    bool _508 = !_454;
    float _526;
    if (!_508)
    {
        float _510 = in.m_69.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_132);
        float _532 = 1.0 / _530;
        float _534 = _166 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    bool _538 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _540 = isnan(_536);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _554 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _556 = isnan(_536);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _566;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _572 = _536 + _570;
    float _574 = -_548;
    float _576 = _574 + 1.0;
    bool _578 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _580 = 1.0 / _552;
    float _582 = _564 * _576;
    float _584 = -_564;
    float _586 = _584 + 1.0;
    float _588 = _568 * _580;
    float _590 = fma(_588, _572, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _592 = _590 * _582;
    float _594 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[131].x, _592);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _602 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[132].x, _594);
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _602 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_75.x = _604;
    out.m_75.y = _606;
    out.m_75.z = _608;
    out.m_75.w = _610;
    bool _612 = !_578;
    float _630;
    if (!_612)
    {
        float _614 = in.m_69.x;
        float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _618 = _614 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _620 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[14].x, _166);
        float _622 = _620 * _616;
        float _624 = floor(_622);
        float _626 = -_624;
        float _628 = _622 + _626;
        _630 = _628;
        _632 = true;
    }
    else
    {
        float _634 = float(_132);
        float _636 = 1.0 / _634;
        float _638 = _166 * _636;
        _630 = _638;
    }
    _632 = false;
    float _640 = _630;
    float _642 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _644 = int(_642);
    float _646 = in.m_77.y;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _650 = _640 + _648;
    float _652 = in.m_61.w;
    float _654 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _656 = int(_654);
    bool _658 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _660 = isnan(_640);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _674 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _676 = isnan(_640);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _690 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _692 = isnan(_640);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = in.m_65.w;
    bool _704 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _706 = isnan(_640);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _718 = int(_716);
    float _720 = float(_644);
    float _722 = -_684;
    float _724 = _722 + 1.0;
    float _726 = in.m_63.w;
    float _728 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _730 = 1.0 / _720;
    float _732 = float(uint(_656));
    float _734 = _728 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _736 = ~_656;
    int _738 = _736 + 1;
    int _740 = ~_656;
    int _742 = _740 + 1;
    bool _744 = _656 == 0;
    float _746 = 1.0 / _732;
    float _748 = float(_718);
    int _750 = ~_656;
    int _752 = _750 + 1;
    float _754 = _730 * _166;
    float _756 = 1.0 / _748;
    int _758 = as_type<int>(_746) + (-2);
    float _760 = trunc(_754);
    int _762 = int(_760);
    float _764 = float(_656);
    float _766 = _756 * _166;
    float _768 = 1.0 / _672;
    float _770 = float(uint(_762));
    float _772 = trunc(_766);
    int _774 = int(_772);
    float _776 = as_type<float>(_758) * _770;
    float _778 = trunc(_776);
    float _780 = precise::max(_778, 0.0);
    uint _783 = uint(_780);
    float _785 = 1.0 / _688;
    int _787 = _738 * int(_783);
    int _789 = _787 + _762;
    float _791 = in.m_69.x;
    float _793 = float(uint(_789));
    float _795 = as_type<float>(_758) * _793;
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _799 = _797 != 0;
    float _801 = trunc(_795);
    float _803 = precise::max(_801, 0.0);
    uint _805 = uint(_803);
    float _807 = _754;
    if (_799)
    {
        _807 = 1.0;
    }
    float _809 = _807;
    float _811 = _809;
    if (!_799)
    {
        _811 = 7.345489978790283203125;
    }
    float _813 = _811;
    float _815 = _813 * _791;
    int _817 = int(_783) + int(_805);
    float _819 = float(_762);
    int _821 = _742 * _817;
    int _823 = _821 + _762;
    bool _825 = _819 >= _764;
    bool _827 = isnan(_819);
    bool _829 = _825 || _827;
    bool _831 = isnan(_764);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = floor(_815);
    bool _839 = uint(_823) >= uint(_656);
    bool _841 = !_839;
    int _843 = _841 ? 0 : (-1);
    float _845 = trunc(_835);
    int _847 = int(_845);
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _851 = _849 != 0;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _855 = _853 != 0;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _859 = _857 != 0;
    int _861 = ~_817;
    int _863 = _861 + _843;
    int _865 = _863 + 1;
    float _867 = float(_132);
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _871 = _869 != 0;
    int _873 = _656 * _865;
    int _875 = _873 + _762;
    float _877 = -_837;
    float _879 = _815 + _877;
    bool _881 = !_855;
    int _883 = _881 ? 0 : 1;
    float _885 = 1.0 / _867;
    int _887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _889 = _887 != 0;
    float _891 = _879 * _764;
    bool _893 = !_744;
    int _895 = _893 ? _875 : (-1);
    int _897 = ~_847;
    int _899 = _897 + 1;
    int _901 = _899 + 1;
    int _903 = _656 + (-1);
    float _905 = trunc(_891);
    int _907 = int(_905);
    bool _909 = _656 == 0;
    int _911 = _895 * _901;
    float _913 = _764 * _166;
    int _915 = _847 * _903;
    int _917 = _915 + _911;
    bool _919 = !_871;
    int _921 = _919 ? 0 : 1;
    float _923 = _913 * _885;
    bool _925 = !_851;
    int _927 = _925 ? 0 : 1;
    int _929 = abs(_883);
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _933 = _931 != 0;
    float _935 = trunc(_923);
    int _937 = int(_935);
    bool _939 = !_859;
    int _941 = _939 ? 0 : 1;
    int _943 = _917 * _929;
    int _945 = abs(_927);
    float _947 = in.m_69.w;
    int _949 = abs(_921);
    bool _951 = !_933;
    int _953 = _951 ? 0 : 1;
    int _955 = abs(_941);
    int _957 = _907 * _949;
    int _959 = _957 + _762;
    int _961 = abs(_953);
    int _963 = _937 * _945;
    int _965 = _963 + _943;
    float _967 = float(uint(_774));
    int _969 = _959 * _955;
    int _971 = _969 + _965;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _975 = _973 != 0;
    float _977 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _979 = int(_977);
    bool _981 = _744;
    if (_889)
    {
        bool _983 = _791 > 0.5;
        _981 = _983;
    }
    bool _985 = _981;
    int _987 = _907 * _961;
    int _989 = _987 + _971;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _993 = _991 != 0;
    float _995 = float(uint(_989));
    float _997 = as_type<float>(_758) * _995;
    int _999 = ~_656;
    int _1001 = _999 + 1;
    float _1003 = float(uint(_979));
    float _1005 = trunc(_997);
    float _1007 = precise::max(_1005, 0.0);
    uint _1009 = uint(_1007);
    int _1011 = ~_979;
    int _1013 = _1011 + 1;
    int _1015 = ~_979;
    int _1017 = _1015 + 1;
    float _1019 = float(_979);
    float _1021 = 1.0 / _1003;
    float _1023 = _1019 * _166;
    float _1025 = _1023 * _885;
    int _1027 = _1001 * int(_1009);
    int _1029 = _1027 + _989;
    float _1031 = trunc(_1025);
    int _1033 = int(_1031);
    float _1035 = float(uint(_1029));
    int _1037 = as_type<int>(_1021) + (-2);
    float _1039 = as_type<float>(_758) * _1035;
    float _1041 = in.m_69.y;
    float _1043 = as_type<float>(_1037) * _967;
    float _1045 = trunc(_1039);
    float _1047 = precise::max(_1045, 0.0);
    uint _1049 = uint(_1047);
    float _1051 = in.m_69.z;
    float _1053 = trunc(_1043);
    float _1055 = precise::max(_1053, 0.0);
    uint _1057 = uint(_1055);
    int _1059 = int(_1009) + int(_1049);
    int _1061 = int(_1009);
    float _1063 = _1043;
    int _1065 = _1013;
    if (_889)
    {
        float _1067 = -_188;
        float _1069 = _1067 + 1.0;
        _1061 = as_type<int>(_1069);
    }
    int _1071 = _1061;
    if (!_889)
    {
        _1063 = _188;
    }
    float _1073 = _1063;
    float _1075 = _1073;
    if (_889)
    {
        float _1077 = _985 ? as_type<float>(_1071) : _188;
        _1075 = _1077;
    }
    float _1079 = _1075;
    int _1081 = _752 * _1059;
    int _1083 = _1081 + _989;
    float _1085 = -_192;
    float _1087 = _1085 + 1.0;
    int _1089 = _1013 * int(_1057);
    int _1091 = _1089 + _774;
    float _1093 = _1087;
    if (_975)
    {
        float _1095 = -_188;
        float _1097 = _1095 + 1.0;
        _1065 = as_type<int>(_1097);
    }
    int _1099 = _1065;
    bool _1101 = _1051 > 0.5;
    bool _1103 = uint(_1083) >= uint(_656);
    float _1105 = float(uint(_1091));
    bool _1107 = !_1103;
    int _1109 = _1107 ? 0 : (-1);
    bool _1111 = _1041 > 0.5;
    float _1113 = as_type<float>(_1037) * _1105;
    int _1115 = ~_1059;
    int _1117 = _1115 + _1109;
    int _1119 = _1117 + 1;
    bool _1121 = _947 > 0.5;
    float _1123 = _1105;
    if (!_975)
    {
        _1123 = _188;
    }
    float _1125 = _1123;
    int _1127 = _656 * _1119;
    int _1129 = _1127 + _989;
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1133 = _1131 != 0;
    float _1135 = trunc(_1113);
    float _1137 = precise::max(_1135, 0.0);
    uint _1139 = uint(_1137);
    float _1141 = _1125;
    float _1143 = as_type<float>(_1129);
    if (_975)
    {
        float _1145 = _1101 ? as_type<float>(_1099) : _188;
        _1141 = _1145;
    }
    float _1147 = _1141;
    int _1149 = _1111 ? as_type<int>(_1087) : as_type<int>(_192);
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1153 = _1151 != 0;
    int _1155 = _1121 ? as_type<int>(_1087) : as_type<int>(_192);
    bool _1157 = !_909;
    int _1159 = _1157 ? _1129 : (-1);
    int _1161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1163 = _1161 != 0;
    float _1165 = _1153 ? as_type<float>(_1155) : _192;
    int _1167 = _1159 & 3;
    bool _1169 = _1167 != 0;
    float _1171 = _1163 ? as_type<float>(_1149) : _192;
    bool _1173 = uint(_1167) > 1u;
    if (_1133)
    {
        float _1175 = _1101 ? _1087 : _192;
        _238 = _1175;
    }
    float _1177 = _238;
    int _1179 = _1159 & 3;
    bool _1181 = _1179 != 0;
    if (_993)
    {
        _1093 = _791;
    }
    float _1183 = _1093;
    float _1185 = _1183;
    if (_993)
    {
        _1143 = 1.0;
    }
    float _1187 = _1143;
    float _1189 = _1187;
    if (!_993)
    {
        _1185 = _1041;
    }
    float _1191 = _1185;
    if (!_993)
    {
        _1189 = 1.2345600128173828125;
    }
    float _1193 = _1189;
    int _1195 = _1181 ? 0 : 1;
    int _1197 = int(_1057) + int(_1139);
    float _1199 = _1191 * _1193;
    bool _1201 = _1167 != 3;
    float _1203 = in.m_50.x;
    float _1205 = in.m_50.y;
    int _1207 = ~_1195;
    int _1209 = _1207 + 1;
    int _1211 = _1209 + 1;
    int _1213 = _1017 * _1197;
    int _1215 = _1213 + _774;
    bool _1217 = uint(_1167) >= 2u;
    float _1219 = floor(_1199);
    int _1221 = _1211;
    if (!_1173)
    {
        int _1223 = ~_1195;
        int _1225 = _1223 + 1;
        _1221 = _1225;
    }
    int _1227 = _1221;
    float _1229 = float(_774);
    int _1231 = _1217 ? 0 : 1;
    bool _1233 = _1229 >= _1019;
    bool _1235 = isnan(_1229);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan(_1019);
    bool _1241 = _1237 || _1239;
    float _1243 = float(_1241);
    bool _1245 = uint(_1215) >= uint(_979);
    int _1247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1249 = _1247 != 0;
    float _1251 = trunc(_1243);
    int _1253 = int(_1251);
    int _1255 = ~_1231;
    int _1257 = _1255 + 1;
    int _1259 = _1257 + 1;
    int _1261 = _1259;
    if (_1201)
    {
        int _1263 = ~_1231;
        int _1265 = _1263 + 1;
        _1261 = _1265;
    }
    int _1267 = _1261;
    float _1269 = -_1219;
    float _1271 = _1199 + _1269;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1275 = _1273 != 0;
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1279 = _1277 != 0;
    bool _1281 = !_1245;
    int _1283 = _1281 ? 0 : (-1);
    float _1285 = _1019 * _1271;
    bool _1287 = !_1249;
    int _1289 = _1287 ? 0 : 1;
    float _1291 = _214 * _1205;
    int _1293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1295 = _1293 != 0;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1299 = _1297 != 0;
    float _1301 = _208 * _1205;
    int _1303 = ~_1197;
    int _1305 = _1303 + _1283;
    int _1307 = _1305 + 1;
    float _1309 = _202 * _1205;
    bool _1311 = !_1279;
    int _1313 = _1311 ? 0 : 1;
    float _1315 = _1205 + _646;
    bool _1317 = !_1275;
    int _1319 = _1317 ? 0 : 1;
    float _1321 = trunc(_1285);
    int _1323 = int(_1321);
    int _1325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1327 = _1325 != 0;
    float _1329 = fma(_206, _1203, _1301);
    int _1331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1333 = _1331 != 0;
    float _1335 = fma(_212, _1203, _1291);
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1339 = _1337 != 0;
    int _1341 = _979 * _1307;
    int _1343 = _1341 + _774;
    bool _1345 = !_1295;
    int _1347 = _1345 ? 0 : 1;
    bool _1349 = _979 == 0;
    int _1351 = ~_1253;
    int _1353 = _1351 + 1;
    int _1355 = _1353 + 1;
    bool _1357 = !_1349;
    int _1359 = _1357 ? _1343 : (-1);
    int _1361 = _979 + (-1);
    int _1363 = abs(_1313);
    int _1365 = _1355 * _1359;
    float _1367 = fma(_200, _1203, _1309);
    int _1369 = abs(_1289);
    int _1371 = _1253 * _1361;
    int _1373 = _1371 + _1365;
    float _1375 = float(uint(_959));
    int _1377 = abs(_1319);
    int _1379 = _1373 * _1363;
    int _1381 = abs(_1347);
    float _1383 = as_type<float>(_758) * _1375;
    bool _1385 = !_1299;
    int _1387 = _1385 ? 0 : 1;
    float _1389 = trunc(_1383);
    float _1391 = precise::max(_1389, 0.0);
    uint _1393 = uint(_1391);
    int _1395 = _1323 * _1369;
    int _1397 = _1395 + _774;
    int _1399 = ~_656;
    int _1401 = _1399 + 1;
    int _1403 = _1033 * _1377;
    int _1405 = _1403 + _1379;
    float _1407 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1409 = abs(_1387);
    int _1411 = _1397 * _1381;
    int _1413 = _1411 + _1405;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1417 = _1415 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1419 = _1041 > 0.5;
    bool _1421 = _1419 && _1333;
    int _1423 = _1323 * _1409;
    int _1425 = _1423 + _1413;
    float _1427 = _791 * 2.0;
    int _1429 = _1401 * int(_1393);
    int _1431 = _1429 + _959;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1435 = _1433 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1437 = 1.0 / _1417;
    float _1439 = float(uint(_1425));
    float _1441 = _791 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1443 = float(uint(_1431));
    float _1445 = as_type<float>(_1037) * _1439;
    float _1447 = as_type<float>(_758) * _1443;
    float _1449 = floor(_1427);
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1451;
    int _1455 = ~_656;
    int _1457 = _1455 + 1;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1461 = _1459 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1463;
    float _1467 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1469 = _1467 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1471 = _1041 * 2.0;
    float _1473 = trunc(_1445);
    float _1475 = precise::max(_1473, 0.0);
    uint _1477 = uint(_1475);
    float _1479 = _1465 * _768;
    int _1481 = ~_979;
    int _1483 = _1481 + 1;
    float _1485 = _1469 * _1437;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1489 = _1487 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1491 = 1.0 / _1435;
    float _1493 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1495 = abs(_1227);
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1499 = -_1493;
    float _1501 = fma(_1441, 2.0, _1499);
    float _1503 = trunc(_1447);
    float _1505 = precise::max(_1503, 0.0);
    uint _1507 = uint(_1505);
    int _1509 = _1483 * int(_1477);
    int _1511 = _1509 + _1425;
    float _1513 = fma(_1407, -2.0, _1497);
    int _1515 = as_type<int>(_1407);
    int _1517 = as_type<int>(_1441);
    float _1519 = _1447;
    float _1521 = _1501;
    if (_993)
    {
        _1515 = 0;
    }
    int _1523 = _1515;
    int _1525 = _1523;
    if (_993)
    {
        _1517 = 0;
    }
    int _1527 = _1517;
    float _1529 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1513);
    float _1531 = float(uint(_1511));
    float _1533 = _1453 * _1491;
    int _1535 = _1527;
    if (!_1333)
    {
        _1519 = _188;
    }
    float _1537 = _1519;
    float _1539 = _1537;
    if (_1421)
    {
        float _1541 = -_188;
        float _1543 = _1541 + 1.0;
        _240 = _1543;
    }
    float _1545 = _240;
    bool _1547 = _1449 >= 0.0;
    bool _1549 = isnan(_1449);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan(0.0);
    bool _1555 = _1551 || _1553;
    float _1557 = floor(_1471);
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    if (!_993)
    {
        _1525 = 1;
    }
    int _1563 = _1525;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1567 = _640 + _1565;
    int _1569 = _1555 ? 0 : 1;
    bool _1571 = _1449 > 0.0;
    float _1573 = fma(_1533, _1567, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1575 = int(_1393) + int(_1507);
    float _1577 = 1.0 / _1461;
    float _1579 = as_type<float>(_1037) * _1531;
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1583 = _1581 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1585 = in.m_50.z;
    if (_1333)
    {
        _1539 = _1545;
    }
    float _1587 = _1539;
    int _1589 = _1457 * _1575;
    int _1591 = _1589 + _959;
    int _1593 = ~_1569;
    int _1595 = _1593 + 1;
    int _1597 = _1595 + 1;
    float _1599 = trunc(_1579);
    float _1601 = precise::max(_1599, 0.0);
    uint _1603 = uint(_1601);
    bool _1605 = uint(_1591) >= uint(_656);
    int _1607 = _1597;
    if (!_1571)
    {
        int _1609 = ~_1569;
        int _1611 = _1609 + 1;
        _1607 = _1611;
    }
    int _1613 = _1607;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1617 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1615;
    float _1619 = 1.0 / _1489;
    bool _1621 = !_1605;
    int _1623 = _1621 ? 0 : (-1);
    float _1625 = _1561 * _1577;
    bool _1627 = _1557 > 0.0;
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1629;
    bool _1633 = _1557 >= 0.0;
    bool _1635 = isnan(_1557);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan(0.0);
    bool _1641 = _1637 || _1639;
    float _1643 = _1051 * 2.0;
    int _1645 = ~_979;
    int _1647 = _1645 + 1;
    float _1649 = 1.0 / _1583;
    int _1651 = int(_1477) + int(_1603);
    float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1655 = _1653 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1657 = _1631 * _785;
    float _1659 = fma(_210, _1585, _1329);
    if (!_993)
    {
        _1535 = 2;
    }
    int _1661 = _1535;
    float _1663 = fma(_216, _1585, _1335);
    float _1665 = _1655 * _1619;
    int _1667 = _1641 ? 0 : 1;
    int _1669 = _1647 * _1651;
    int _1671 = _1669 + _1425;
    float _1673 = floor(_1643);
    float _1675 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1677 = _640 + _1675;
    bool _1679 = !_1169;
    int _1681 = _1679 ? 0 : 1;
    float _1683 = _1659 + _726;
    float _1685 = _1617 * _1649;
    float _1687 = fma(_204, _1585, _1367);
    int _1689 = ~_1667;
    int _1691 = _1689 + 1;
    int _1693 = _1691 + 1;
    float _1695 = _791 + _1041;
    bool _1697 = uint(_1671) >= uint(_979);
    float _1699 = _1041 + _1051;
    int _1701 = _1693;
    if (!_1627)
    {
        int _1703 = ~_1667;
        int _1705 = _1703 + 1;
        _1701 = _1705;
    }
    int _1707 = _1701;
    float _1709 = _1695 + (-1.0);
    bool _1711 = _1167 != 3;
    float _1713 = _1699 + (-1.0);
    bool _1715 = !_1697;
    int _1717 = _1715 ? 0 : (-1);
    float _1719 = fma(_1479, _1677, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1723 = _1721 != 0;
    int _1725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1727 = _1725 != 0;
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1731 = _1729 != 0;
    float _1733 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1735 = fma(_1685, _650, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1737 = !_1711;
    int _1739 = _1737 ? 0 : (-1);
    float _1741 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1743 = _1683 + _1741;
    bool _1745 = !_1727;
    int _1747 = _1745 ? 0 : 1;
    float _1749 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1751 = _1673 > 0.0;
    float _1753 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1755 = _640 + _1753;
    bool _1757 = _1673 >= 0.0;
    bool _1759 = isnan(_1673);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan(0.0);
    bool _1765 = _1761 || _1763;
    bool _1767 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1769 = isnan(_640);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1775 = _1771 || _1773;
    float _1777 = float(_1775);
    float _1779 = fma(_1485, _1755, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1781 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1783 = isnan(_640);
    bool _1785 = _1781 || _1783;
    bool _1787 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1789 = _1785 || _1787;
    float _1791 = float(_1789);
    float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1795 = _640 + _1793;
    bool _1797 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1799 = isnan(_640);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1805 = _1801 || _1803;
    float _1807 = float(_1805);
    float _1809 = -_1777;
    float _1811 = _1809 + 1.0;
    int _1813 = _1765 ? 0 : 1;
    float _1815 = -_1791;
    float _1817 = _1815 + 1.0;
    float _1819 = fma(_1625, _1795, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1821 = _1791 * _1811;
    float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1825 = _640 + _1823;
    bool _1827 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1829 = isnan(_640);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1835 = _1831 || _1833;
    float _1837 = float(_1835);
    float _1839 = _668 * _1817;
    float _1841 = -_668;
    float _1843 = _1841 + 1.0;
    float _1845 = fma(_1657, _1825, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1849 = _1661 != 2;
    float _1851 = _1837 * _1843;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1855 = _640 + _1853;
    bool _1857 = !_1723;
    int _1859 = _1857 ? 0 : 1;
    float _1861 = -_1837;
    float _1863 = _1861 + 1.0;
    bool _1865 = _1563 != 1;
    float _1867 = fma(_1665, _1855, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1869 = _700 * _724;
    float _1871 = -_700;
    float _1873 = _1871 + 1.0;
    float _1875 = _1687 + _652;
    float _1877 = _1663 + _702;
    bool _1879 = !_1731;
    int _1881 = _1879 ? 0 : 1;
    float _1883 = _714 * _1873;
    float _1885 = -_714;
    float _1887 = _1885 + 1.0;
    int _1889 = abs(_1747);
    float _1891 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1893 = _1807 * _1887;
    float _1895 = -_1807;
    float _1897 = _1895 + 1.0;
    float _1899 = fma(_1891, _1177, -0.5);
    float _1901 = _1891;
    if (_1849)
    {
        _1901 = _791;
    }
    float _1903 = _1901;
    float _1905 = _1719 * _1893;
    int _1907 = abs(_1881);
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1911 = _1903;
    if (!_1849)
    {
        _1911 = _1051;
    }
    float _1913 = _1911;
    float _1915 = fma(_1897, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1905);
    float _1917 = _684 * _1863;
    int _1919 = ~_1651;
    int _1921 = _1919 + _1717;
    int _1923 = _1921 + 1;
    float _1925 = fma(_1779, _1883, _1915);
    float _1927 = _1913 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1929 = ~_979;
    int _1931 = _1929 + 1;
    float _1933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1935 = fma(_1573, _1869, _1925);
    float _1937 = float(uint(_1397));
    int _1939 = _979 * _1923;
    int _1941 = _1939 + _1425;
    float _1943 = float(_1613);
    float _1945 = -_1909;
    float _1947 = fma(_1927, 2.0, _1945);
    float _1949 = float(_1889);
    float _1951 = as_type<float>(_1037) * _1937;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1955 = _1315 + _1953;
    float _1957 = float(_1707);
    float _1959 = _1949 * _1943;
    float _1961 = float(_1907);
    float _1963 = trunc(_1951);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    bool _1969 = !_1349;
    int _1971 = _1969 ? _1941 : (-1);
    float _1973 = _1955 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1977 = _1875 + _1975;
    int _1979 = ~_1813;
    int _1981 = _1979 + 1;
    int _1983 = _1981 + 1;
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1987 = _1877 + _1985;
    int _1989 = _1983;
    if (!_1751)
    {
        int _1991 = ~_1813;
        int _1993 = _1991 + 1;
        _1989 = _1993;
    }
    int _1995 = _1989;
    float _1997 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1973);
    int _1999 = _1971 & 3;
    bool _2001 = _1999 != 0;
    float _2003 = _1933 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _2005 = abs(_1859);
    float _2007 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1997);
    float _2009 = _2001 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2011 = fma(_1819, _1917, _1935);
    bool _2013 = uint(_1999) >= 2u;
    float _2015 = fma(_2003, _1587, -0.5);
    int _2017 = _1931 * int(_1967);
    int _2019 = _2017 + _1397;
    float _2021 = -_166;
    float _2023 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1947);
    float _2025 = _1977 * _1977;
    float _2027 = float(uint(_2019));
    float _2029 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2031 = float(_2005);
    float _2033 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2035 = float(_1995);
    float _2037 = as_type<float>(_1037) * _2027;
    float _2039 = _2027;
    float _2041 = _2007;
    float _2043 = _2035;
    float _2045 = _2009;
    if (!_1865)
    {
        _2039 = _1041;
    }
    float _2047 = _2039;
    float _2049 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2029);
    int _2051 = _2013 ? 0 : 1;
    float _2053 = _2031 * _2035;
    bool _2055 = _2007 >= 0.0;
    float _2057 = trunc(_2037);
    float _2059 = precise::max(_2057, 0.0);
    uint _2061 = uint(_2059);
    float _2063 = _2047;
    if (!_1865)
    {
        _2041 = _2047;
    }
    float _2065 = _2041;
    float _2067 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2049);
    float _2069 = _1961 * _1957;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    float _2073 = _2065;
    float _2075 = _2069;
    if (_1865)
    {
        _2063 = _791;
    }
    float _2077 = _2063;
    float _2079 = fma(_2067, _2015, _2023);
    if (!_1865)
    {
        _2043 = _1051;
    }
    float _2081 = _2043;
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2085 = _2081;
    if (_1865)
    {
        _2085 = _1041;
    }
    float _2087 = _2085;
    float _2089 = fma(_2077, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2033);
    int _2091 = _1159 >> 31;
    float _2093 = fma(_1845, _1851, _2011);
    int _2095 = _1971 >> 31;
    float _2097 = fma(_2087, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2083);
    int _2099 = _2091 & 3;
    float _2101 = fma(_1743, _1743, _2025);
    int _2103 = int(_1967) + int(_2061);
    float _2105 = fma(_1867, _1839, _2093);
    int _2107 = _1159 + _2099;
    float _2109 = fma(_1987, _1987, _2101);
    int _2111 = _2095 & 3;
    float _2113 = in.m_79.x;
    float _2115 = in.m_79.y;
    float _2117 = in.m_79.z;
    int _2119 = _2107 >> 2;
    float _2121 = sqrt(_2109);
    int _2123 = _1971 + _2111;
    float _2125 = _2053 * (-2.0);
    int _2127 = _2119 << 4;
    int _2129 = _2127 + 368;
    float _2131 = fma(_1735, _1821, _2105);
    int _2133 = _2123 >> 2;
    float _2135 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2097);
    uint _2137 = uint(int(uint(_2129) >> uint(2)));
    uint _2139 = uint(int(uint(int(_2137)) >> uint(2)));
    int _2141 = int(_2137) & 3;
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[int(_2139)][_2141];
    int _2145 = int(_2137) + 1;
    uint _2147 = uint(int(uint(_2145) >> uint(2)));
    int _2149 = _2145 & 3;
    float _2151 = (*spvDescriptorSet0.vp_c9)._m0[int(_2147)][_2149];
    if (!_1865)
    {
        _2071 = _1051;
    }
    float _2153 = _2071;
    float _2155 = rsqrt(_2109);
    int _2157 = _2133 << 4;
    int _2159 = _2157 + 512;
    float _2161 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2131);
    float _2163 = _2153;
    if (_1865)
    {
        _2073 = _791;
    }
    float _2165 = _2073;
    if (_2055)
    {
        out.m_53.x = 0.0;
    }
    if (_1865)
    {
        _2163 = _1041;
    }
    float _2167 = _2163;
    uint _2169 = uint(int(uint(_2159) >> uint(2)));
    uint _2171 = uint(int(uint(int(_2169)) >> uint(2)));
    int _2173 = int(_2169) & 3;
    float _2175 = (*spvDescriptorSet0.vp_c9)._m0[int(_2171)][_2173];
    int _2177 = int(_2169) + 1;
    uint _2179 = uint(int(uint(_2177) >> uint(2)));
    int _2181 = _2177 & 3;
    float _2183 = (*spvDescriptorSet0.vp_c9)._m0[int(_2179)][_2181];
    bool _2185 = uint(_1999) > 1u;
    float _2187 = _2121 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2189 = ~_979;
    int _2191 = _2189 + 1;
    float _2193 = _2167 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2195 = _2165 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2197 = precise::min(_734, _2187);
    int _2199 = _2191 * _2103;
    int _2201 = _2199 + _1397;
    int _2203 = _2159 + 8;
    uint _2205 = uint(int(uint(_2203) >> uint(2)));
    uint _2207 = uint(int(uint(int(_2205)) >> uint(2)));
    int _2209 = int(_2205) & 3;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[int(_2207)][_2209];
    int _2213 = int(_2205) + 1;
    uint _2215 = uint(int(uint(_2213) >> uint(2)));
    int _2217 = _2213 & 3;
    float _2219 = (*spvDescriptorSet0.vp_c9)._m0[int(_2215)][_2217];
    int _2221 = ~as_type<int>(_2009);
    int _2223 = _2221 + 1;
    int _2225 = _2223 + 1;
    float _2227 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2229 = _2155 * _2197;
    int _2231 = _2225;
    if (!_2185)
    {
        int _2233 = ~as_type<int>(_2009);
        int _2235 = _2233 + 1;
        _2231 = _2235;
    }
    int _2237 = _2231;
    float _2239 = fma(_2193, -2.0, _2227);
    bool _2241 = uint(_2201) >= uint(_979);
    float _2243 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2245 = _2129 + 8;
    uint _2247 = uint(int(uint(_2245) >> uint(2)));
    uint _2249 = uint(int(uint(int(_2247)) >> uint(2)));
    int _2251 = int(_2247) & 3;
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[int(_2249)][_2251];
    int _2255 = int(_2247) + 1;
    uint _2257 = uint(int(uint(_2255) >> uint(2)));
    int _2259 = _2255 & 3;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[int(_2257)][_2259];
    int _2263 = ~_1575;
    int _2265 = _2263 + _1623;
    int _2267 = _2265 + 1;
    float _2269 = _1743 * _2229;
    bool _2271 = !_2241;
    int _2273 = _2271 ? 0 : (-1);
    float _2275 = -_2243;
    float _2277 = fma(_2195, 2.0, _2275);
    bool _2279 = _1999 != 3;
    int _2281 = _656 * _2267;
    int _2283 = _2281 + _959;
    if (_2055)
    {
        _2045 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2285 = _2045;
    int _2287 = ~_2103;
    int _2289 = _2287 + _2273;
    int _2291 = _2289 + 1;
    float _2293 = _1977 * _2229;
    int _2295 = ~_2051;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    int _2301 = as_type<int>(_2285);
    int _2303 = _2299;
    if (_2055)
    {
        float _2305 = _2285 * 5.0;
        _2301 = as_type<int>(_2305);
    }
    int _2307 = _2301;
    int _2309 = abs(_2237);
    int _2311 = _979 * _2291;
    int _2313 = _2311 + _1397;
    float _2315 = -_2269;
    float _2317 = _1743 + _2315;
    if (_2055)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8203 = as_type<float>(_2307);
        out.gl_Position.z = _8203;
    }
    if (_2279)
    {
        int _2319 = ~_2051;
        int _2321 = _2319 + 1;
        _2303 = _2321;
    }
    int _2323 = _2303;
    float _2325 = -_2293;
    float _2327 = _1977 + _2325;
    int _2329 = _1971 & 3;
    bool _2331 = _2329 != 0;
    float _2333 = _2317 * _2317;
    float _2335 = _1987 * _2229;
    int _2337 = abs(_1681);
    float _2339 = fma(_2327, _2327, _2333);
    int _2341 = ~_2309;
    int _2343 = _2341 + 1;
    int _2345 = _2343 + 1;
    float _2347 = fma(_2125, _2113, _2113);
    int _2349 = abs(_2323);
    float _2351 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2353 = int(_2351);
    int _2355 = ~_1495;
    int _2357 = _2355 + 1;
    int _2359 = _2357 + 1;
    int _2361 = _2345 * as_type<int>(_2183);
    bool _2363 = !_2331;
    int _2365 = _2363 ? 0 : 1;
    float _2367 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2239);
    int _2369 = abs(_1267);
    int _2371 = _2359 * as_type<int>(_2151);
    int _2373 = abs(_2365);
    out.m_81.w = _2197;
    float _2375 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2377 = int(_2375);
    out.m_83.x = _2161;
    int _2379 = ~_2337;
    int _2381 = _2379 + 1;
    int _2383 = _2381 + 1;
    float _2385 = fma(_1749, _2125, _1749);
    int _2387 = ~_2373;
    int _2389 = _2387 + 1;
    int _2391 = _2389 + 1;
    bool _2393 = _1999 != 3;
    int _2395 = _2383 * as_type<int>(_2143);
    int _2397 = _2395 + _2371;
    int _2399 = ~_2349;
    int _2401 = _2399 + 1;
    int _2403 = _2401 + 1;
    int _2405 = _2391 * as_type<int>(_2175);
    int _2407 = _2405 + _2361;
    float _2409 = float(uint(_2353));
    bool _2411 = !_2393;
    int _2413 = _2411 ? 0 : (-1);
    int _2415 = _2403 * as_type<int>(_2211);
    int _2417 = _2415 + _2407;
    int _2419 = abs(_1739);
    float _2421 = 1.0 / _2409;
    bool _2423 = !_1327;
    int _2425 = _2423 ? 0 : 1;
    int _2427 = ~_2369;
    int _2429 = _2427 + 1;
    int _2431 = _2429 + 1;
    bool _2433 = !_1339;
    int _2435 = _2433 ? 0 : 1;
    int _2437 = abs(_2425);
    int _2439 = _2431 * as_type<int>(_2253);
    int _2441 = _2439 + _2397;
    int _2443 = abs(_2413);
    float _2445 = float(uint(_2377));
    int _2447 = ~_2419;
    int _2449 = _2447 + 1;
    int _2451 = _2449 + 1;
    int _2453 = abs(_2435);
    float _2455 = 1.0 / _2445;
    int _2457 = _2451 * as_type<int>(_2261);
    int _2459 = _2457 + _2441;
    float _2461 = fma(_1955, _1955, _2025);
    bool _2463 = _656 == 0;
    float _2465 = -_2335;
    float _2467 = _1987 + _2465;
    int _2469 = abs(_2353);
    int _2471 = ~_2443;
    int _2473 = _2471 + 1;
    int _2475 = _2473 + 1;
    float _2477 = fma(_2467, _2467, _2339);
    int _2479 = ~_2437;
    int _2481 = _2479 + 1;
    int _2483 = _2481 + 1;
    bool _2485 = !_1349;
    int _2487 = _2485 ? _2313 : (-1);
    int _2489 = _2475 * as_type<int>(_2219);
    int _2491 = _2489 + _2417;
    int _2493 = ~_2453;
    int _2495 = _2493 + 1;
    int _2497 = _2495 + 1;
    int _2499 = _2459 * _2483;
    bool _2501 = !_2463;
    int _2503 = _2501 ? _2283 : (-1);
    float _2505 = sqrt(_2477);
    float _2507 = float(uint(_2469));
    int _2509 = _2497 * _2491;
    int _2511 = abs(_2377);
    int _2513 = _2503 * _2437;
    int _2515 = _2513 + _2499;
    int _2517 = as_type<int>(_2455) + (-2);
    int _2519 = _2487 * _2453;
    int _2521 = _2519 + _2509;
    int _2523 = as_type<int>(_2421) + (-2);
    float _2525 = 1.0 / _2507;
    float _2527 = float(uint(_2515));
    float _2529 = fma(_1987, _1987, _2461);
    float _2531 = float(uint(_2511));
    float _2533 = float(uint(_2521));
    float _2535 = as_type<float>(_2523) * _2527;
    float _2537 = as_type<float>(_2499);
    if (_1849)
    {
        _2537 = _1041;
    }
    float _2539 = _2537;
    float _2541 = _2155 * _2505;
    float _2543 = 1.0 / _2531;
    float _2545 = as_type<float>(_2517) * _2533;
    float _2547 = _2539;
    if (!_1849)
    {
        _2547 = _791;
    }
    float _2549 = _2547;
    int _2551 = abs(_2515);
    float _2553 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2555 = as_type<int>(_2525) + (-2);
    float _2557 = trunc(_2535);
    float _2559 = precise::max(_2557, 0.0);
    uint _2561 = uint(_2559);
    float _2563 = float(uint(_2551));
    float _2565 = _2549 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2567 = abs(_2521);
    int _2569 = ~_2353;
    int _2571 = _2569 + 1;
    float _2573 = fma(_2565, -2.0, _2553);
    float _2575 = as_type<float>(_2555) * _2563;
    float _2577 = trunc(_2545);
    float _2579 = precise::max(_2577, 0.0);
    uint _2581 = uint(_2579);
    int _2583 = as_type<int>(_2543) + (-2);
    float _2585 = _791 + (-0.5);
    float _2587 = float(uint(_2567));
    float _2589 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2573);
    int _2591 = ~_2377;
    int _2593 = _2591 + 1;
    float _2595 = fma(_2585, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2347);
    int _2597 = ~_2377;
    int _2599 = _2597 + 1;
    int _2601 = _2571 * int(_2561);
    int _2603 = _2601 + _2515;
    float _2605 = trunc(_2575);
    float _2607 = precise::max(_2605, 0.0);
    uint _2609 = uint(_2607);
    float _2611 = as_type<float>(_2583) * _2587;
    float _2613 = float(uint(_2603));
    int _2615 = ~_2469;
    int _2617 = _2615 + 1;
    int _2619 = _2593 * int(_2581);
    int _2621 = _2619 + _2521;
    float _2623 = rsqrt(_2529);
    float _2625 = as_type<float>(_2523) * _2613;
    float _2627 = _728 * _2541;
    float _2629 = float(uint(_2621));
    float _2631 = _2627 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2633 = trunc(_2611);
    float _2635 = precise::max(_2633, 0.0);
    uint _2637 = uint(_2635);
    int _2639 = _2617 * int(_2609);
    int _2641 = _2639 + _2551;
    float _2643 = as_type<float>(_2517) * _2629;
    float _2645 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _2647 = ~_2469;
    int _2649 = _2647 + 1;
    float _2651 = float(uint(_2641));
    float _2653 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2645);
    float _2655 = _2631 * _2623;
    int _2657 = ~_2511;
    int _2659 = _2657 + 1;
    float _2661 = trunc(_2625);
    float _2663 = precise::max(_2661, 0.0);
    uint _2665 = uint(_2663);
    float _2667 = as_type<float>(_2555) * _2651;
    bool _2669 = _2377 == 0;
    float _2671 = _1955 * _2655;
    bool _2673 = _2377 == 0;
    float _2675 = _1977 * _2655;
    int _2677 = _2659 * int(_2637);
    int _2679 = _2677 + _2567;
    float _2681 = -_2671;
    float _2683 = _1955 + _2681;
    float _2685 = trunc(_2643);
    float _2687 = precise::max(_2685, 0.0);
    uint _2689 = uint(_2687);
    float _2691 = -_2675;
    float _2693 = _1977 + _2691;
    float _2695 = float(uint(_2679));
    float _2697 = _2683 * _2683;
    float _2699 = as_type<float>(_2583) * _2695;
    float _2701 = trunc(_2667);
    float _2703 = precise::max(_2701, 0.0);
    uint _2705 = uint(_2703);
    float _2707 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2653);
    int _2709 = int(_2561) + int(_2665);
    float _2711 = _1987 * _2655;
    float _2713 = fma(_2693, _2693, _2697);
    float _2715 = -_2589;
    float _2717 = fma(_2707, _1899, _2715);
    int _2719 = int(_2581) + int(_2689);
    float _2721 = trunc(_2699);
    float _2723 = precise::max(_2721, 0.0);
    uint _2725 = uint(_2723);
    int _2727 = ~_2353;
    int _2729 = _2727 + 1;
    float _2731 = -_2711;
    float _2733 = _1987 + _2731;
    int _2735 = _2599 * _2719;
    int _2737 = _2735 + _2521;
    int _2739 = _2729 * _2709;
    int _2741 = _2739 + _2515;
    float _2743 = fma(_2733, _2733, _2713);
    int _2745 = int(_2609) + int(_2705);
    bool _2747 = uint(_2737) >= uint(_2377);
    bool _2749 = uint(_2741) >= uint(_2353);
    int _2751 = _2649 * _2745;
    int _2753 = _2751 + _2551;
    bool _2755 = !_2747;
    int _2757 = _2755 ? 0 : (-1);
    float _2759 = sqrt(_2743);
    int _2761 = int(_2637) + int(_2725);
    int _2763 = ~_2511;
    int _2765 = _2763 + 1;
    bool _2767 = !_2749;
    int _2769 = _2767 ? 0 : (-1);
    bool _2771 = uint(_2753) >= uint(_2469);
    int _2773 = _2765 * _2761;
    int _2775 = _2773 + _2567;
    int _2777 = ~_2709;
    int _2779 = _2777 + _2769;
    int _2781 = _2779 + 1;
    float _2783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2785 = _2353 == 0;
    bool _2787 = _2353 == 0;
    int _2789 = _2515 ^ _2353;
    int _2791 = _2353 * _2781;
    int _2793 = _2791 + _2515;
    int _2795 = ~_2719;
    int _2797 = _2795 + _2757;
    int _2799 = _2797 + 1;
    float _2801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2803 = _2521 ^ _2377;
    float _2805 = _2623 * _2759;
    bool _2807 = !_2785;
    int _2809 = _2807 ? _2793 : (-1);
    int _2811 = _2377 * _2799;
    int _2813 = _2811 + _2521;
    bool _2815 = !_2771;
    int _2817 = _2815 ? 0 : (-1);
    float _2819 = -_166;
    float _2821 = fma(_2819, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1501);
    float _2823 = float(_2809);
    float _2825 = _2783 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2827 = ~_2817;
    int _2829 = _2745 + _2827;
    int _2831 = _2829 + 1;
    float _2833 = _2627 * _2805;
    bool _2835 = uint(_2775) >= uint(_2511);
    float _2837 = fma(_2825, _2823, _2821);
    bool _2839 = !_2669;
    int _2841 = _2839 ? _2813 : (-1);
    float _2843 = fma(_2825, _1079, -0.5);
    uint _2845 = uint(int(uint(_2789) >> uint(31)));
    float _2847 = _2801 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2849 = float(_2841);
    float _2851 = -_166;
    float _2853 = fma(_2851, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2277);
    bool _2855 = !_2835;
    int _2857 = _2855 ? 0 : (-1);
    float _2859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2861 = ~int(_2845);
    int _2863 = _2861 + 1;
    float _2865 = fma(_2847, _1147, -0.5);
    float _2867 = fma(_2847, _2849, _2853);
    uint _2869 = uint(int(uint(_2803) >> uint(31)));
    out.m_85.x = _2833;
    int _2871 = _2831 ^ _2863;
    float _2873 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2875 = ~_2857;
    int _2877 = _2761 + _2875;
    int _2879 = _2877 + 1;
    float _2881 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2883 = log2(_2881);
    int _2885 = ~int(_2869);
    int _2887 = _2885 + 1;
    float _2889 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2873);
    int _2891 = ~_2863;
    int _2893 = _2891 + _2871;
    int _2895 = _2893 + 1;
    int _2897 = _2879 ^ _2887;
    float _2899 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2889);
    bool _2901 = !_2787;
    int _2903 = _2901 ? _2895 : (-1);
    float _2905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2907 = ~_2887;
    int _2909 = _2907 + _2897;
    int _2911 = _2909 + 1;
    float _2913 = _2859 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2915 = float(_2903);
    float _2917 = fma(_2899, _2843, _2837);
    bool _2919 = !_2673;
    int _2921 = _2919 ? _2911 : (-1);
    float _2923 = fma(_1171, _2913, -0.5);
    float _2925 = -_1529;
    float _2927 = fma(_2913, _2915, _2925);
    float _2929 = _2883 * _166;
    bool _2931 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2933 = isnan(0.0);
    bool _2935 = _2931 || _2933;
    bool _2937 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2939 = _2935 || _2937;
    bool _2941 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2943 = isnan(1.0);
    bool _2945 = _2941 || _2943;
    bool _2947 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2949 = _2945 || _2947;
    float _2951 = exp2(_2929);
    float _2953 = _2905 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2955 = float(_2921);
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2959 = fma(_1165, _2953, -0.5);
    float _2961 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2957);
    float _2963 = -_2367;
    float _2965 = fma(_2953, _2955, _2963);
    float _2967 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2089);
    float _2969 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2971 = 1.0 + _2969;
    float _2973 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2961);
    float _2975 = fma(_2135, _2959, _2965);
    float _2977 = fma(_2967, _2865, _2867);
    float _2979 = _2079 + 0.5;
    float _2981 = fma(_2973, _2923, _2927);
    float _2983 = _2717 + 0.5;
    float _2985 = 1.0 / _2971;
    float _2987 = _2977 + 0.5;
    float _2989 = _2917 + 0.5;
    float _2991 = _2981 + 0.5;
    float _2993 = _2975 + 0.5;
    float _2995 = -_2951;
    float _2997 = _2995 + 1.0;
    out.m_87.x = _2979;
    out.m_87.y = _2983;
    out.m_89.x = _2989;
    out.m_89.y = _2991;
    out.m_89.z = _2987;
    out.m_89.w = _2993;
    float _2999 = _2939 ? _2997 : 0.0;
    float _3001 = as_type<float>(_2813);
    float _3003 = _2671;
    if (_2055)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3005 = -_2671;
    float _3007 = _1315 + _3005;
    float _3009 = -_2675;
    float _3011 = _1875 + _3009;
    if (_2949)
    {
        float _3013 = _2999 * _2985;
        _168 = _3013;
    }
    float _3015 = _168;
    float _3017 = _1959 * (-2.0);
    float _3019 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3021 = _3007 + _3019;
    float _3023 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3025 = _3011 + _3023;
    float _3027 = fma(_1733, _3017, _1733);
    float _3029 = _3021 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3031 = _791 + _1051;
    float _3033 = fma(_3017, _2115, _2115);
    float _3035 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _3037 = (*spvDescriptorSet0.vp_c9)._m0[191].y + _3035;
    float _3039 = fma(_3025, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3029);
    float _3041 = -_2711;
    float _3043 = _1877 + _3041;
    float _3045 = _1041 + (-0.5);
    float _3047 = _3031 + (-1.0);
    float _3049 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3051 = _3043 + _3049;
    float _3053 = _2069 * (-2.0);
    float _3055 = 1.0 / _3037;
    float _3057 = fma(_3045, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3033);
    float _3059 = fma(_3051, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3039);
    float _3061 = fma(_3047, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3063 = _1051 + (-0.5);
    float _3065 = precise::max(_1585, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _3067 = fma(_3027, _3015, _3057);
    bool _3069 = _3059 >= 0.0;
    float _3071 = fma(_2385, _3015, _2595);
    float _3073 = fma(_3053, _2117, _2117);
    float _3075 = fma(_3061, _3053, _3061);
    float _3077 = precise::min(_3065, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _3079 = _3067 * 0.15915493667125701904296875;
    float _3081 = fma(_3063, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3073);
    float _3083 = in.m_91.x;
    float _3085 = in.m_91.y;
    float _3087 = in.m_91.z;
    float _3089 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _3091 = _3077 + _3089;
    float _3093 = fma(_3075, _3015, _3081);
    float _3095 = _3071 * 0.15915493667125701904296875;
    float _3097 = _3079 * 6.283185482025146484375;
    float _3099 = sin(_3097);
    float _3101 = _3091 * _3055;
    float _3103 = _3093 * 0.15915493667125701904296875;
    float _3105 = _3055;
    if (_3069)
    {
        _3105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3107 = _3105;
    float _3109 = (*spvDescriptorSet0.vp_c9)._m0[191].z + (-1.0);
    int _3111 = as_type<int>(_3107);
    if (_3069)
    {
        out.m_53.x = 0.0;
    }
    float _3113 = _3079 * 6.283185482025146484375;
    float _3115 = cos(_3113);
    if (_3069)
    {
        float _3117 = _3107 * 5.0;
        _3111 = as_type<int>(_3117);
    }
    int _3119 = _3111;
    float _3121 = fma(_3101, _3109, 1.0);
    float _3123 = _3103 * 6.283185482025146484375;
    float _3125 = sin(_3123);
    float _3127 = _3095 * 6.283185482025146484375;
    float _3129 = sin(_3127);
    float _3131 = _3095 * 6.283185482025146484375;
    float _3133 = cos(_3131);
    if (_3069)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9392 = as_type<float>(_3119);
        out.gl_Position.z = _9392;
    }
    if (_3069)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3135 = _3103 * 6.283185482025146484375;
    float _3137 = cos(_3135);
    float _3139 = _3121 * _3083;
    float _3141 = _3121 * _3085;
    float _3143 = _3121 * _3087;
    float _3145 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3147 = _2541 * _2805;
    float _3149 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3151 = _3129 * _3099;
    float _3153 = _3133 * _3115;
    float _3155 = _3145 * _3147;
    float _3157 = _3149 * _3147;
    float _3159 = fma(_3125, _3153, _3151);
    float _3161 = fma(_3125, _3151, _3153);
    float _3163 = _3133 * _3099;
    float _3165 = _3129 * _3115;
    float _3167 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3139);
    float _3169 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3141);
    float _3171 = _3115 * _3137;
    float _3173 = _3133 * _3137;
    float _3175 = _2833 * _3167;
    float _3177 = _3129 * _3137;
    float _3179 = _3099 * _3137;
    float _3181 = _3155 * _3169;
    float _3183 = -_3163;
    float _3185 = fma(_3125, _3165, _3183);
    float _3187 = -_3165;
    float _3189 = fma(_3125, _3163, _3187);
    float _3191 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3143);
    float _3193 = _3173 * _3181;
    float _3195 = _3159 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3197 = _3159 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3199 = _3159 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3201 = _3157 * _3191;
    float _3203 = -_3181;
    float _3205 = _3125 * _3203;
    float _3207 = fma(_3159, _3175, _3193);
    float _3209 = fma(_3171, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3195);
    float _3211 = fma(_3171, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3197);
    float _3213 = fma(_3171, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3199);
    float _3215 = _3177 * _3181;
    float _3217 = fma(_3171, _3175, _3205);
    float _3219 = fma(_3189, _3201, _3207);
    float _3221 = fma(_3185, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3209);
    float _3223 = fma(_3185, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3211);
    float _3225 = fma(_3185, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3213);
    float _3227 = fma(_3185, _3175, _3215);
    float _3229 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3231 = fma(_3179, _3201, _3217);
    float _3233 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3235 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3237 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3239 = -_3125;
    float _3241 = fma(_3239, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3229);
    float _3243 = fma(_3161, _3201, _3227);
    float _3245 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3247 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3233);
    float _3249 = in.m_93.x;
    float _3251 = in.m_93.y;
    float _3253 = in.m_93.z;
    float _3255 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3257 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3245);
    float _3259 = fma(_3243, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3247);
    bool _3261 = _3141 != 0.0;
    bool _3263 = isnan(_3141);
    bool _3265 = _3261 || _3263;
    bool _3267 = isnan(0.0);
    bool _3269 = _3265 || _3267;
    float _3271 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3255);
    float _3273 = fma(_3243, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3257);
    float _3275 = _3259 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _3277 = _3139 == 0.0;
    bool _3279 = !_3269;
    bool _3281 = _3277 && _3279;
    float _3283 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3285 = _3273 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3287 = _1877 + _3275;
    float _3289 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3291 = _3143 == 0.0;
    bool _3293 = _3291 && _3281;
    float _3295 = _1875 + _3285;
    float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3299 = _3287 + _3297;
    float _3301 = -_3125;
    float _3303 = fma(_3301, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3235);
    float _3305 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3283);
    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3309 = _3295 + _3307;
    float _3311 = _3299 * _3299;
    float _3313 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3289);
    float _3315 = -_3125;
    float _3317 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3237);
    float _3319 = in.m_95.x;
    float _3321 = in.m_95.y;
    float _3323 = in.m_95.z;
    float _3325 = in.m_95.w;
    float _3327 = fma(_3309, _3309, _3311);
    float _3329 = fma(_3177, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3303);
    float _3331 = fma(_3177, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3241);
    float _3333 = _3311;
    float _3335 = _3241;
    float _3337 = _3317;
    if (_3293)
    {
        _2075 = _3249;
    }
    float _3339 = _2075;
    float _3341 = sqrt(_3327);
    float _3343 = _3339;
    if (_3293)
    {
        _3001 = _3251;
    }
    float _3345 = _3001;
    float _3347 = fma(_3177, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3317);
    float _3349 = _3345;
    if (_3293)
    {
        _1521 = _3253;
    }
    float _3351 = _1521;
    float _3353 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3355 = _3351;
    if (_3293)
    {
        _3333 = _3339;
    }
    float _3357 = _3333;
    float _3359 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3271);
    float _3361 = _3357;
    if (_3293)
    {
        _3335 = _3345;
    }
    float _3363 = _3335;
    float _3365 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3353);
    float _3367 = _3363;
    if (_3293)
    {
        _3337 = _3351;
    }
    float _3369 = _3337;
    float _3371 = _3369;
    if (!_3293)
    {
        _3343 = _3249;
    }
    float _3373 = _3343;
    float _3375 = fma(_3243, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3365);
    if (!_3293)
    {
        _3349 = _3251;
    }
    float _3377 = _3349;
    float _3379 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3305);
    if (!_3293)
    {
        _3355 = _3253;
    }
    float _3381 = _3355;
    if (!_3293)
    {
        float _3383 = fma(_3139, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3373);
        _3361 = _3383;
    }
    float _3385 = _3361;
    float _3387 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3313);
    if (!_3293)
    {
        float _3389 = fma(_3141, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3377);
        _3367 = _3389;
    }
    float _3391 = _3367;
    float _3393 = _3331 * _3321;
    float _3395 = _3319;
    if (!_3293)
    {
        float _3397 = fma(_3143, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3381);
        _3371 = _3397;
    }
    float _3399 = _3371;
    bool _3401 = _3341 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3403 = _3375 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3405 = _3347 * _3321;
    float _3407 = fma(_3221, _3319, _3393);
    float _3409 = _3329 * _3321;
    float _3411 = _3323 * _3373;
    float _3413 = _3319 * _3377;
    float _3415 = _1315 + _3403;
    float _3417 = fma(_3225, _3319, _3405);
    float _3419 = fma(_3223, _3319, _3409);
    float _3421 = -_3411;
    float _3423 = fma(_3319, _3381, _3421);
    float _3425 = -_3413;
    float _3427 = fma(_3321, _3373, _3425);
    float _3429 = _3321 * _3381;
    float _3431 = _3403;
    float _3433 = _3413;
    if (!_3401)
    {
        _3431 = _3295;
    }
    float _3435 = _3431;
    float _3437 = _3435;
    if (!_3401)
    {
        _3433 = _3287;
    }
    float _3439 = _3433;
    float _3441 = _3439;
    if (!_3401)
    {
        _3395 = _3415;
    }
    float _3443 = _3395;
    bool _3445 = !_3401;
    float _3447 = _3443;
    if (!_3445)
    {
        float _3449 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3451 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3453 = _3341 + _3451;
        float _3455 = rsqrt(_3327);
        float _3457 = _3453 * _3449;
        float _3459 = _3415 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3461 = _3457 * 0.15915493667125701904296875;
        float _3463 = _3461 * 6.283185482025146484375;
        float _3465 = cos(_3463);
        float _3467 = _3461 * 6.283185482025146484375;
        float _3469 = sin(_3467);
        float _3471 = _3465 + (-1.0);
        float _3473 = _3471 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3475 = fma(_3469, _3459, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3477 = fma(_3415, _3465, _3473);
        float _3479 = _3455 * _3475;
        float _3481 = fma(_3309, _3479, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3483 = fma(_3299, _3479, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3447 = _3477;
        _3437 = _3481;
        _3441 = _3483;
    }
    float _3485 = _3447;
    float _3487 = _3437;
    float _3489 = _3441;
    float _3491 = -_2269;
    float _3493 = _3491 + _3485;
    float _3495 = -_3429;
    float _3497 = fma(_3323, _3377, _3495);
    float _3499 = -_2293;
    float _3501 = _3499 + _3487;
    float _3503 = fma(_3379, _3323, _3407);
    float _3505 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3507 = _3493 + _3505;
    float _3509 = fma(_3359, _3323, _3419);
    float _3511 = fma(_3387, _3323, _3417);
    float _3513 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3515 = _3501 + _3513;
    float _3517 = _3507 * _3507;
    float _3519 = -_2335;
    float _3521 = _3519 + _3489;
    float _3523 = _3423 * _3325;
    float _3525 = _3497 * _3325;
    float _3527 = fma(_3515, _3515, _3517);
    float _3529 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3531 = _3521 + _3529;
    float _3533 = _3427 * _3325;
    float _3535 = _3331 * _3391;
    float _3537 = _3329 * _3391;
    float _3539 = fma(_3531, _3531, _3527);
    float _3541 = _3523 * _3331;
    float _3543 = _3347 * _3391;
    float _3545 = _3523 * _3329;
    float _3547 = _3523 * _3347;
    float _3549 = fma(_3221, _3385, _3535);
    float _3551 = fma(_3223, _3385, _3537);
    float _3553 = fma(_3525, _3221, _3541);
    float _3555 = fma(_3525, _3223, _3545);
    float _3557 = sqrt(_3539);
    float _3559 = fma(_3525, _3225, _3547);
    float _3561 = fma(_3225, _3385, _3543);
    float _3563 = fma(_3379, _3399, _3549);
    float _3565 = fma(_3533, _3379, _3553);
    float _3567 = fma(_3359, _3399, _3551);
    float _3569 = fma(_3533, _3359, _3555);
    float _3571 = fma(_3533, _3387, _3559);
    float _3573 = fma(_3387, _3399, _3561);
    out.m_97.x = _3503;
    out.m_97.y = _3509;
    out.m_97.z = _3511;
    float _3575 = -_2293;
    float _3577 = _1875 + _3575;
    float _3579 = -_2269;
    float _3581 = _3579 + _1315;
    out.m_99.x = _3565;
    out.m_99.y = _3569;
    out.m_99.z = _3571;
    float _3583 = -_2335;
    float _3585 = _1877 + _3583;
    bool _3587 = _3557 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3589 = isnan(_3557);
    bool _3591 = _3587 || _3589;
    bool _3593 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3595 = _3591 || _3593;
    out.m_101.x = _3563;
    out.m_101.y = _3567;
    out.m_101.z = _3573;
    float _3597 = _3559;
    if (!_3595)
    {
        _3597 = 1.0;
    }
    float _3599 = _3597;
    bool _3601 = !_3595;
    float _3603 = _3599;
    if (!_3601)
    {
        bool _3605 = _3557 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3607 = isnan(_3557);
        bool _3609 = _3605 || _3607;
        bool _3611 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3613 = _3609 || _3611;
        if (!_3613)
        {
            float _3615 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3617 = _3557 + _3615;
            float _3619 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3621 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3619;
            float _3623 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3625 = _3623 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3627 = 1.0 / _3621;
            float _3629 = _3617 * _3627;
            float _3631 = fma(_3629, _3625, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3603 = _3631;
            _3633 = true;
        }
        else
        {
            bool _3635 = _3557 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3637 = isnan(_3557);
            bool _3639 = _3635 || _3637;
            bool _3641 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3643 = _3639 || _3641;
            if (!_3643)
            {
                float _3645 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3647 = _3557 + _3645;
                float _3649 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3651 = _3649 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3653 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3655 = _3653 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3657 = 1.0 / _3651;
                float _3659 = _3647 * _3657;
                float _3661 = fma(_3659, _3655, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3603 = _3661;
                _3633 = true;
            }
            else
            {
                _3603 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3633 = false;
    float _3663 = _3603;
    float _3665 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3667 = _3501 + _3665;
    float _3669 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3671 = _3521 + _3669;
    float _3673 = fma(_3667, _3663, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3675 = fma(_3671, _3663, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3677 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _3679 = _3673 + _3677;
    float _3681 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _3683 = _3675 + _3681;
    float _3685 = fma(_3679, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _3687 = fma(_3683, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _10364 = float2(_3685, _3687);
    float _3689 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_10364, float2(0.0), isnan(_10364)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_10364, float2(0.0), isnan(_10364)), level(0.0)).x;
    float _3691 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3693 = _3493 + _3691;
    float _3695 = -_2711;
    float _3697 = _3695 + _3585;
    float _3699 = -_3577;
    float _3701 = _3699 + _3673;
    float _3703 = -_3585;
    float _3705 = _3703 + _3675;
    float _3707 = fma(_3693, _3663, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3709 = -_2675;
    float _3711 = _3709 + _3577;
    float _3713 = -_3581;
    float _3715 = _3713 + _3707;
    float _3717 = _3715 * _3715;
    float _3719 = fma(_3701, _3701, _3717);
    float _3721 = fma(_3705, _3705, _3719);
    float _3723 = sqrt(_3721);
    bool _3725 = _3723 > 0.0;
    bool _3727 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3729 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3731 = _3727 || _3729;
    bool _3733 = isnan(0.5);
    bool _3735 = _3731 || _3733;
    float _3737 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _3739 = _3707;
    float _3741 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _3743 = _3711;
    if (!_3725)
    {
        _3737 = _3675;
    }
    float _3745 = _3737;
    float _3747 = fma(_3689, 100.0, _3581);
    float _3749 = -_2671;
    float _3751 = _3749 + _3747;
    float _3753 = _3751 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3755 = fma(_3711, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3753);
    float _3757 = fma(_3697, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3755);
    float _3759 = _3757 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3761 = _3751 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3763 = 1.0 / _3759;
    float _3765 = fma(_3711, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3761);
    float _3767 = fma(_3697, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3765);
    float _3769 = _3767 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3771 = _3769 + _3759;
    float _3773 = fma(_3689, 100.0, _3707);
    float _3775 = _3771 * _3763;
    float _3777 = _3775 * 0.5;
    float _3779 = _3745;
    float _3781 = _3747;
    if (!_3725)
    {
        _3739 = _3773;
    }
    float _3783 = _3739;
    float _3785 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3787 = fma(_3777, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3785);
    float _3789 = 1.0 / _3787;
    bool _3791 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3793 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3795 = _3791 || _3793;
    bool _3797 = isnan(0.5);
    bool _3799 = _3795 || _3797;
    float _3801 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _3803 = _3783;
    float _3805 = _3787;
    if (!_3725)
    {
        _3801 = _3673;
    }
    float _3807 = _3801;
    bool _3809 = !_3725;
    float _3811 = _3807;
    float _3813 = _3807;
    if (!_3809)
    {
        float _3815 = _232 * _232;
        float _3817 = fma(_230, _230, _3815);
        float _3819 = fma(_234, _234, _3817);
        float _3821 = rsqrt(_3721);
        float _3823 = sqrt(_3819);
        float _3825 = _3701 * _3821;
        float _3827 = _3715 * _3821;
        float _3829 = _3705 * _3821;
        bool _3831 = _3823 > 0.0;
        float _3833 = _3823;
        float _3835 = _3821;
        _3805 = _3819;
        if (!_3831)
        {
            _3811 = _3673;
        }
        float _3837 = _3811;
        _3813 = _3837;
        if (!_3831)
        {
            _3833 = _3773;
        }
        float _3839 = _3833;
        _3803 = _3839;
        if (!_3831)
        {
            _3835 = _3675;
        }
        float _3841 = _3835;
        bool _3843 = !_3831;
        _3779 = _3841;
        if (!_3843)
        {
            float _3845 = rsqrt(_3819);
            float _3847 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3849 = _232 * _3845;
            float _3851 = _230 * _3845;
            float _3853 = _3827 * _3849;
            float _3855 = _234 * _3845;
            float _3857 = fma(_3825, _3851, _3853);
            float _3859 = _3847 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3861 = fma(_3829, _3855, _3857);
            float _3863 = _3861 * _3859;
            float _3865 = fma(_230, _3863, _3673);
            float _3867 = fma(_232, _3863, _3773);
            float _3869 = fma(_234, _3863, _3675);
            _3803 = _3867;
            _3813 = _3865;
            _3779 = _3869;
            _3805 = _3845;
        }
    }
    float _3871 = _3803;
    float _3873 = _3813;
    float _3875 = _3779;
    float _3877 = _3805;
    float _3879 = -_2671;
    float _3881 = _3879 + _3871;
    float _3883 = -_2675;
    float _3885 = _3883 + _3873;
    float _3887 = -_2711;
    float _3889 = _3887 + _3875;
    float _3891 = _3873;
    float _3893 = _3881;
    float _3895 = _3885;
    float _3897 = _3889;
    float _3899 = _3877;
    if (_3799)
    {
        _3003 = 1.0;
    }
    float _3901 = _3003;
    float _3903 = _3901;
    if (!_3735)
    {
        float _3905 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3907 = _3751 + _3905;
        float _3909 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3911 = _3711 + _3909;
        float _3913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3915 = -_3585;
        float _3917 = _3915 + _3875;
        float _3919 = _3907 * _3907;
        float _3921 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3923 = _3697 + _3921;
        float _3925 = -_3577;
        float _3927 = _3925 + _3873;
        float _3929 = fma(_3911, _3911, _3919);
        float _3931 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3933 = fma(_3923, _3923, _3929);
        float _3935 = sqrt(_3933);
        float _3937 = 1.0 / _2805;
        float _3939 = precise::min(_3935, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3941 = _3939 * _3913;
        float _3943 = _3931 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3945 = -_3747;
        float _3947 = _3945 + _3871;
        float _3949 = _3941 * _3937;
        float _3951 = _3943 * _3949;
        float _3953 = _3917 * _3949;
        float _3955 = fma(_3927, _3951, _3711);
        float _3957 = fma(_3947, _3951, _3751);
        float _3959 = fma(_3943, _3953, _3697);
        _3891 = _3927;
        _3893 = _3957;
        _3895 = _3955;
        _3897 = _3959;
        _3899 = _3941;
    }
    float _3961 = _3891;
    float _3963 = _3893;
    float _3965 = _3895;
    float _3967 = _3897;
    float _3969 = _3899;
    float _3971 = _3961;
    float _3973 = _3969;
    if (_3799)
    {
        _3781 = 1.0;
    }
    float _3975 = _3781;
    float _3977 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3979 = _3789 * _3977;
    float _3981 = _3975;
    if (!_3799)
    {
        float _3983 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3985 = _3983 * 0.15915493667125701904296875;
        float _3987 = _3985 * 6.283185482025146484375;
        float _3989 = cos(_3987);
        float _3991 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3993 = _3991 * 0.15915493667125701904296875;
        float _3995 = _3985 * 6.283185482025146484375;
        float _3997 = sin(_3995);
        float _3999 = 1.0 / _3989;
        float _4001 = _3993 * 6.283185482025146484375;
        float _4003 = cos(_4001);
        float _4005 = _3997 * _3999;
        float _4007 = _3993 * 6.283185482025146484375;
        float _4009 = sin(_4007);
        float _4011 = _4003 * _4005;
        float _4013 = 1.0 / _4011;
        float _4015 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4017 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4015;
        float _4019 = 1.0 / _4017;
        float _4021 = _4009 * _4013;
        float _4023 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4025 = fma(_3979, _4021, _4023);
        float _4027 = _4025 * _4019;
        float _4029 = precise::clamp(_4027, 0.0, 1.0);
        _3971 = _4019;
        _3903 = _4029;
    }
    float _4031 = _3971;
    float _4033 = _3903;
    float _4035 = _4031;
    if (!_3799)
    {
        float _4037 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4039 = _4037 * 0.15915493667125701904296875;
        float _4041 = _4039 * 6.283185482025146484375;
        float _4043 = cos(_4041);
        float _4045 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4047 = _4045 * 0.15915493667125701904296875;
        float _4049 = _4039 * 6.283185482025146484375;
        float _4051 = sin(_4049);
        float _4053 = 1.0 / _4043;
        float _4055 = _4047 * 6.283185482025146484375;
        float _4057 = cos(_4055);
        float _4059 = _4051 * _4053;
        float _4061 = _4047 * 6.283185482025146484375;
        float _4063 = sin(_4061);
        float _4065 = _4057 * _4059;
        float _4067 = 1.0 / _4065;
        float _4069 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4071 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _4069;
        float _4073 = 1.0 / _4071;
        float _4075 = _4063 * _4067;
        float _4077 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4079 = fma(_3979, _4075, _4077);
        float _4081 = _4079 * _4073;
        float _4083 = precise::clamp(_4081, 0.0, 1.0);
        float _4085 = -_4083;
        float _4087 = _4085 + 1.0;
        _4035 = _4053;
        _3981 = _4087;
    }
    float _4089 = _4035;
    float _4091 = _3981;
    float _4093 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4095 = _3963 + _4093;
    float _4097 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4099 = _3965 + _4097;
    float _4101 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4103 = _3967 + _4101;
    float _4105 = _4095 * _4095;
    float _4107 = fma(_4099, _4099, _4105);
    float _4109 = fma(_4103, _4103, _4107);
    float _4111 = rsqrt(_4109);
    float _4113 = _4111 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4115 = _4099 * _4113;
    float _4117 = _4103 * _4113;
    float _4119 = _4115 * _4115;
    float _4121 = _4117 * _4117;
    float _4123 = _4119 + _4121;
    float _4125 = sqrt(_4123);
    bool _4127 = _4125 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4129 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4131 = _4125 + _4129;
    float _4133 = _4111;
    float _4135 = _4089;
    float _4137 = _4131;
    float _4139 = _4095;
    if (_4127)
    {
        float _4141 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4133 = _4141;
    }
    float _4143 = _4133;
    if (_4127)
    {
        float _4145 = rsqrt(_4123);
        _4135 = _4145;
    }
    float _4147 = _4135;
    float _4149 = _4147;
    if (_4127)
    {
        float _4151 = _4131 * _4143;
        _4137 = _4151;
    }
    float _4153 = _4137;
    if (_4127)
    {
        float _4155 = _4153 * 0.15915493667125701904296875;
        _3973 = _4155;
    }
    float _4157 = _3973;
    float _4159 = _4103;
    if (_4127)
    {
        float _4161 = _4157 * 6.283185482025146484375;
        float _4163 = sin(_4161);
        _4159 = _4163;
    }
    float _4165 = _4159;
    float _4167 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4169 = precise::max(0.0, _4167);
    float _4171 = _4143;
    float _4173 = _4169;
    if (_4127)
    {
        float _4175 = _4157 * 6.283185482025146484375;
        float _4177 = cos(_4175);
        _4171 = _4177;
    }
    float _4179 = _4171;
    float _4181 = -_4113;
    float _4183 = -_4169;
    float _4185 = fma(_4095, _4181, _4183);
    if (_4127)
    {
        float _4187 = _4185 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4139 = _4187;
    }
    float _4189 = _4139;
    float _4191 = _4189;
    float _4193 = _4165;
    float _4195 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4127)
    {
        float _4197 = fma(_4165, _4189, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4191 = _4197;
    }
    float _4199 = _4191;
    float _4201 = _4199;
    if (!_4127)
    {
        _4193 = _4185;
    }
    float _4203 = _4193;
    float _4205 = _4203;
    float _4207 = _4179;
    if (_4127)
    {
        float _4209 = _4179 + (-1.0);
        _4173 = _4209;
    }
    float _4211 = _4173;
    float _4213 = _4211;
    if (_4127)
    {
        float _4215 = _4147 * _4199;
        _3741 = _4215;
    }
    float _4217 = _3741;
    if (!_4127)
    {
        _4149 = _4115;
    }
    float _4219 = _4149;
    float _4221 = _4219;
    if (_4127)
    {
        float _4223 = _4211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4213 = _4223;
    }
    float _4225 = _4213;
    if (_4127)
    {
        float _4227 = _4115 * _4217;
        _4221 = _4227;
    }
    float _4229 = _4221;
    if (!_4127)
    {
        _4201 = _4117;
    }
    float _4231 = _4201;
    float _4233 = _4231;
    if (_4127)
    {
        float _4235 = _4117 * _4217;
        _4233 = _4235;
    }
    float _4237 = _4233;
    if (_4127)
    {
        float _4239 = fma(_4185, _4179, _4225);
        _4205 = _4239;
    }
    float _4241 = _4205;
    if (!_4127)
    {
        _4207 = _4119;
    }
    float _4243 = _4207;
    float _4245 = sqrt(_4109);
    float _4247 = _4243;
    if (_4127)
    {
        float _4249 = _4229 * _4229;
        _4247 = _4249;
    }
    float _4251 = _4247;
    float _4253 = fma(_3711, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_4127)
    {
        _4195 = _4121;
    }
    float _4255 = _4195;
    float _4257 = _4255;
    if (_4127)
    {
        float _4259 = _4237 * _4237;
        _4257 = _4259;
    }
    float _4261 = _4257;
    float _4263 = fma(_4241, _4241, _4251);
    float _4265 = _3963 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4267 = _4263 + _4261;
    float _4269 = floor(_4253);
    float _4271 = fma(_3965, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4265);
    float _4273 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4275 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4277 = fma(_4245, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4275);
    float _4279 = precise::clamp(_4277, 0.0, 1.0);
    float _4281 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4271);
    float _4283 = fma(_3697, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4285 = _3963 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4287 = rsqrt(_4267);
    float _4289 = _4281 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4291 = -_4279;
    float _4293 = _4291 + 1.0;
    float _4295 = fma(_3965, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4285);
    float _4297 = _4289 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4299 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4295);
    float _4301 = abs(_4293);
    float _4303 = log2(_4301);
    float _4305 = _3963 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4307 = -_4297;
    float _4309 = fma(_4307, _4273, 1.0);
    float _4311 = _3963 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4313 = fma(_3965, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4305);
    float _4315 = fma(_3965, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4311);
    float _4317 = _4287 * _4229;
    float _4319 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4313);
    float _4321 = _4287 * _4237;
    float _4323 = _4287 * _4241;
    float _4325 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4327 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4315);
    float _4329 = _4319 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4331 = floor(_4283);
    float _4333 = -_4325;
    float _4335 = fma(_4323, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4333);
    float _4337 = _4327 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4339 = _4329 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4341 = _4303 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4343 = -_4321;
    float _4345 = fma(_4343, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4335);
    float _4347 = _4299 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4349 = fma(_4337, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4339);
    float _4351 = -_4269;
    float _4353 = _4253 + _4351;
    float _4355 = fma(_4345, -0.5, 0.5);
    float _4357 = exp2(_4341);
    float _4359 = fma(_4289, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4349);
    float _4361 = _4329 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4363 = fma(_4345, 0.5, 0.5);
    float _4365 = _4323 + 1.0;
    float _4367 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4359);
    float _4369 = _4329 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4371 = fma(_4337, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4361);
    float _4373 = log2(_4309);
    float _4375 = -_4331;
    float _4377 = _4283 + _4375;
    float _4379 = fma(_4337, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4369);
    float _4381 = fma(_4363, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4383 = fma(_4289, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4371);
    float _4385 = fma(_4289, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4379);
    float _4387 = fma(_4363, _4381, -0.212114393711090087890625);
    float _4389 = 1.0 / _4367;
    float _4391 = -_4323;
    float _4393 = fma(_4357, _4365, _4391);
    float _4395 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4385);
    float _4397 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4383);
    float _4399 = fma(_4363, _4387, 1.570728778839111328125);
    float _4401 = sqrt(_4355);
    float _4403 = _4373 * 0.693147182464599609375;
    float2 _11476 = float2(_4353, _4377);
    float _4405 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11476, float2(0.0), isnan(_11476)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11476, float2(0.0), isnan(_11476)), level(0.0)).x;
    float _4407 = fma(_4393, 0.5, 0.5);
    float _4409 = _4403 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4411 = _4395 * _4389;
    float _4413 = _4397 * _4389;
    float _4415 = fma(_4411, 0.5, 0.5);
    float _4417 = fma(_4413, -0.5, 0.5);
    float _4419 = _4401 * 0.636619746685028076171875;
    float3 _11504 = float3(_4415, _4417, _4409);
    float _4421 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11504, float3(0.0), isnan(_11504)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11504, float3(0.0), isnan(_11504)), level(0.0)).x;
    float _4423 = -_4399;
    float _4425 = fma(_4419, _4423, 1.0);
    float3 _11520 = float3(_4415, _4417, _4409);
    float4 _4428 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11520, float3(0.0), isnan(_11520)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11520, float3(0.0), isnan(_11520)), level(0.0)).xyzw;
    float _4430 = _4428.x;
    float _4432 = _4428.y;
    float _4434 = _4428.z;
    float _4436 = _4428.w;
    float2 _11536 = float2(_4425, _4407);
    float3 _4440 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11536, float2(0.0), isnan(_11536)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11536, float2(0.0), isnan(_11536)), level(0.0)).xyz;
    float _4442 = _4440.x;
    float _4444 = _4440.y;
    float _4446 = _4440.z;
    float _4448 = abs(_3979);
    float _4450 = log2(_4448);
    float _4452 = _4329 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_103.x = _3965;
    out.m_103.y = _3963;
    out.m_103.z = _3967;
    float _4454 = fma(_4337, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4452);
    bool _4456 = _4245 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4458 = isnan(_4245);
    bool _4460 = _4456 || _4458;
    bool _4462 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4464 = _4460 || _4462;
    float _4466 = in.m_77.x;
    float _4468 = fma(_4289, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4454);
    float _4470 = _4303 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4472 = _3979 <= 8000.0;
    bool _4474 = isnan(_3979);
    bool _4476 = _4472 || _4474;
    bool _4478 = isnan(8000.0);
    bool _4480 = _4476 || _4478;
    float _4482 = float(_4480);
    out.m_105.x = _3711;
    out.m_105.y = _3751;
    out.m_105.z = _3697;
    float _4484 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4468);
    float _4486 = _4367 * 0.5;
    float _4488 = _4450 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4490 = exp2(_4470);
    out.gl_Position.x = _4395;
    out.gl_Position.y = _4397;
    out.gl_Position.z = _4484;
    out.gl_Position.w = _4367;
    float _4492 = _4397;
    float _4494 = _4484;
    float _4496 = _4367;
    if (!_4464)
    {
        _3743 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4498 = _3743;
    float _4500 = exp2(_4488);
    float _4502 = fma(_4397, -0.5, _4486);
    float _4504 = _4498;
    float _4506 = _4498;
    if (!_4464)
    {
        _4492 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4508 = _4492;
    float _4510 = -_4490;
    float _4512 = _4510 + 1.0;
    float _4514 = _4512 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4516 = fma(_4500, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4518 = precise::clamp(_4516, 0.0, 1.0);
    float _4520 = _4484 + _4367;
    float _4522 = _4508;
    float _4524 = _4508;
    if (!_4464)
    {
        _4494 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4526 = _4494;
    float _4528 = fma(_4518, -2.0, 3.0);
    float _4530 = _4518 * _4518;
    float _4532 = _4520 * 0.5;
    float _4534 = _4530 * _4528;
    float _4536 = -_4534;
    float _4538 = _4536 + 1.0;
    float _4540 = fma(_4538, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4534);
    float _4542 = _4395 + _4367;
    float _4544 = -_4514;
    float _4546 = _4544 + 1.0;
    float _4548 = _4482 * _4540;
    float _4550 = _4542 * 0.5;
    float _4552 = _4546;
    float _4554 = _4526;
    float _4556 = _4526;
    if (!_4464)
    {
        _4496 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4558 = _4496;
    float _4560 = _4548 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_107.x = _4550;
    out.m_107.y = _4502;
    out.m_107.z = _4532;
    out.m_107.w = _4367;
    float _4562 = -_4405;
    float _4564 = _4562 + 1.0;
    float _4566 = _4564 * _4560;
    float _4568 = precise::clamp(_4566, 0.0, 1.0);
    float _4570 = -_4568;
    float _4572 = fma(_4570, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4574 = _4033 * _4091;
    float _4576 = _4572 * _4466;
    float _4578 = _4574 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4580 = _4574;
    float _4582 = _4558;
    float _4584 = _4558;
    if (!_4464)
    {
        _4580 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4586 = _4580;
    float _4588 = _4514 * _4421;
    float _4590 = _4576 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4592 = _4436 * _4588;
    float _4594 = _4436 * _4546;
    out.m_109.x = _4590;
    float _4596 = _4586;
    float _4598 = _4586;
    if (!_4464)
    {
        _4552 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4600 = _4552;
    float _4602 = _4446 * _4588;
    float _4604 = fma(_4442, _4592, _4430);
    float _4606 = fma(_4444, _4592, _4432);
    float _4608 = fma(_4436, _4602, _4434);
    out.m_111.x = _4604;
    out.m_111.y = _4606;
    out.m_111.z = _4608;
    out.m_111.w = _4594;
    bool _4610 = !_4464;
    float _4612 = _4600;
    float _4614 = _4600;
    if (!_4610)
    {
        bool _4616 = _4245 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4618 = isnan(_4245);
        bool _4620 = _4616 || _4618;
        bool _4622 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4624 = _4620 || _4622;
        if (!_4624)
        {
            float _4626 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4628 = _4245 + _4626;
            float _4630 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4632 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4630;
            float _4634 = 1.0 / _4632;
            float _4636 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4638 = _4636 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4640 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4642 = _4640 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4644 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4646 = _4644 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4648 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4650 = _4648 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4652 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4654 = _4652 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4656 = _4628 * _4634;
            float _4658 = precise::clamp(_4656, 0.0, 1.0);
            float _4660 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4662 = _4660 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4664 = fma(_4658, _4638, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4666 = fma(_4658, _4662, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4668 = fma(_4658, _4642, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4670 = fma(_4658, _4646, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4672 = fma(_4658, _4650, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4674 = fma(_4658, _4654, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4584 = _4666;
            _4614 = _4672;
            _4506 = _4664;
            _4524 = _4670;
            _4556 = _4668;
            _4598 = _4674;
            _4676 = true;
        }
        else
        {
            bool _4678 = _4245 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4680 = isnan(_4245);
            bool _4682 = _4678 || _4680;
            bool _4684 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4686 = _4682 || _4684;
            if (!_4686)
            {
                _4504 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4688 = _4504;
            _4506 = _4688;
            if (!_4686)
            {
                _4582 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4690 = _4582;
            _4584 = _4690;
            if (!_4686)
            {
                _4554 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4692 = _4554;
            _4556 = _4692;
            if (!_4686)
            {
                _4522 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4694 = _4522;
            _4524 = _4694;
            if (!_4686)
            {
                _4612 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4696 = _4612;
            _4614 = _4696;
            if (!_4686)
            {
                _4596 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4698 = _4596;
            bool _4700 = !_4686;
            _4598 = _4698;
            if (!_4700)
            {
                bool _4702 = _4245 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4704 = isnan(_4245);
                bool _4706 = _4702 || _4704;
                bool _4708 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4710 = _4706 || _4708;
                if (!_4710)
                {
                    float _4712 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4714 = _4245 + _4712;
                    float _4716 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4718 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4716;
                    float _4720 = 1.0 / _4718;
                    float _4722 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4724 = _4722 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4726 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4728 = _4726 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4730 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4732 = _4730 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4734 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4736 = _4734 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4738 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4740 = _4738 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4742 = _4714 * _4720;
                    float _4744 = precise::clamp(_4742, 0.0, 1.0);
                    float _4746 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4748 = _4746 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4750 = fma(_4744, _4724, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4752 = fma(_4744, _4748, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4754 = fma(_4744, _4728, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4756 = fma(_4744, _4732, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4758 = fma(_4744, _4736, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4760 = fma(_4744, _4740, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4584 = _4752;
                    _4614 = _4758;
                    _4506 = _4750;
                    _4524 = _4756;
                    _4556 = _4754;
                    _4598 = _4760;
                    _4676 = true;
                }
                else
                {
                    _4584 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4614 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4506 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4524 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4556 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4598 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4676 = false;
    float _4762 = _4584;
    float _4764 = _4614;
    float _4766 = _4506;
    float _4768 = _4524;
    float _4770 = _4556;
    float _4772 = _4598;
    float _4774 = fma(_3567, -0.5, 0.5);
    float _4776 = precise::clamp(_4774, 0.0, 1.0);
    float _4778 = -_4762;
    float _4780 = _4778 + _4764;
    float _4782 = _4578 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4784 = -_4766;
    float _4786 = _4784 + _4768;
    out.m_113.x = 0.0;
    float _4788 = fma(_4776, _4780, _4762);
    float _4790 = fma(_4776, _4786, _4766);
    out.m_53.x = _4782;
    float _4792 = -_4770;
    float _4794 = _4792 + _4772;
    float _4796 = _4788 * 0.586610972881317138671875;
    bool _4798 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4800 = fma(_4776, _4794, _4770);
    float _4802 = fma(_4790, 0.298911988735198974609375, _4796);
    bool _4804 = _4033 > 0.0;
    bool _4806 = isnan(_4033);
    bool _4808 = _4804 || _4806;
    bool _4810 = isnan(0.0);
    bool _4812 = _4808 || _4810;
    float _4814 = fma(_4800, 0.114477999508380889892578125, _4802);
    bool _4816 = _4091 <= 0.0;
    bool _4818 = !_4812;
    bool _4820 = _4816 || _4818;
    float _4822 = -_4814;
    float _4824 = _4790 + _4822;
    float _4826 = -_4814;
    float _4828 = _4788 + _4826;
    float _4830 = -_4814;
    float _4832 = _4800 + _4830;
    float _4834 = fma(_4824, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4814);
    float _4836 = fma(_4828, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4814);
    float _4838 = fma(_4832, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4814);
    bool _4840 = !_4798;
    if (!_4840)
    {
        float _4842 = -_3963;
        float _4844 = _4842 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4846 = -_3965;
        float _4848 = _4846 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4850 = -_3967;
        float _4852 = _4850 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4854 = _4844 * _4844;
        float _4856 = fma(_4848, _4848, _4854);
        float _4858 = fma(_4852, _4852, _4856);
        float _4860 = sqrt(_4858);
        float _4862 = rsqrt(_4858);
        float _4864 = -_4860;
        float _4866 = _4864 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4868 = _4866 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4870 = precise::clamp(_4868, 0.0, 1.0);
        float _4872 = _4848 * _4862;
        float _4874 = _4844 * _4862;
        float _4876 = abs(_4870);
        float _4878 = log2(_4876);
        float _4880 = _4852 * _4862;
        float _4882 = _4872 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4884 = _3567 * _4874;
        float _4886 = -_4874;
        float _4888 = -_4882;
        float _4890 = fma(_4886, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4888);
        float _4892 = fma(_3563, _4872, _4884);
        float _4894 = -_4880;
        float _4896 = fma(_4894, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4890);
        float _4898 = fma(_3573, _4880, _4892);
        float _4900 = precise::clamp(_4898, 0.0, 1.0);
        float _4902 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4904 = _4896 + _4902;
        float _4906 = _4878 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4908 = _4904 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4910 = precise::clamp(_4908, 0.0, 1.0);
        float _4912 = exp2(_4906);
        float _4914 = _4912 * _4910;
        float _4916 = _4900 * _4914;
        float _4918 = _4916 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4920 = _4916 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4922 = _4916 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _4918;
        out.m_113.y = _4920;
        out.m_113.z = _4922;
    }
    out.m_81.x = _4834;
    out.m_81.y = _4836;
    out.m_81.z = _4838;
    if (!_4820)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _4924 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4924;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4676 = false;
    bool _3633 = false;
    bool _632 = false;
    bool _528 = false;
    bool _386 = false;
    bool _260 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_50.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_53.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4981 = as_type<float>(_148);
        out.gl_Position.z = _4981;
    }
    if (!_136)
    {
        return out;
    }
    float _152 = in.m_55.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_53.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5051 = as_type<float>(_186);
        out.gl_Position.z = _5051;
    }
    if (_178)
    {
        return out;
    }
    float _188 = in.m_57.x;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = in.m_57.y;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = in.m_61.x;
    float _202 = in.m_61.y;
    float _204 = in.m_61.z;
    float _206 = in.m_63.x;
    float _208 = in.m_63.y;
    float _210 = in.m_63.z;
    float _212 = in.m_65.x;
    float _214 = in.m_65.y;
    float _216 = in.m_65.z;
    out.m_67.x = _188;
    out.m_67.y = _192;
    float _218 = _196 * _202;
    float _220 = _196 * _208;
    float _222 = fma(_194, _200, _218);
    float _224 = _196 * _214;
    float _226 = fma(_194, _206, _220);
    float _228 = fma(_194, _212, _224);
    float _230 = fma(_198, _204, _222);
    float _232 = fma(_198, _210, _226);
    float _234 = fma(_198, _216, _228);
    bool _236 = !_190;
    float _238 = _192;
    float _240 = _188;
    float _258;
    if (!_236)
    {
        float _242 = in.m_69.x;
        float _244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _246 = _242 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _248 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _250 = _248 * _244;
        float _252 = floor(_250);
        float _254 = -_252;
        float _256 = _250 + _254;
        _258 = _256;
        _260 = true;
    }
    else
    {
        float _262 = float(_132);
        float _264 = 1.0 / _262;
        float _266 = _166 * _264;
        _258 = _266;
    }
    _260 = false;
    float _268 = _258;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = _268 + _270;
    bool _274 = _268 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _276 = isnan(_268);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _286;
    float _290 = -_284;
    float _292 = _290 + 1.0;
    bool _294 = _268 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _296 = isnan(_268);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = 1.0 / _288;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _312;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = _272 * _306;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = in.m_71.x;
    float _326 = in.m_71.y;
    float _328 = in.m_71.z;
    float _330 = _304 * _292;
    float _332 = fma(_310, _318, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _334 = fma(_322, _318, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _336 = fma(_314, _318, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _338 = -_304;
    float _340 = _338 + 1.0;
    float _342 = _332 * _330;
    float _344 = _334 * _330;
    float _346 = _336 * _330;
    float _348 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].x, _342);
    float _350 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].y, _344);
    float _352 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].z, _346);
    float _354 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[144].x, _348);
    float _356 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[144].y, _350);
    float _358 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[144].z, _352);
    float _360 = _354 * _324;
    float _362 = _356 * _326;
    float _364 = _358 * _328;
    bool _366 = !_316;
    float _384;
    if (!_366)
    {
        float _368 = in.m_69.x;
        float _370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _372 = _368 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _374 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _376 = _374 * _370;
        float _378 = floor(_376);
        float _380 = -_378;
        float _382 = _376 + _380;
        _384 = _382;
        _386 = true;
    }
    else
    {
        float _388 = float(_132);
        float _390 = 1.0 / _388;
        float _392 = _166 * _390;
        _384 = _392;
    }
    _386 = false;
    float _394 = _384;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _398 = _394 + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _404 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _406 = isnan(_394);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _420 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _422 = isnan(_394);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _432;
    bool _436 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _438 = isnan(_394);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = 1.0 / _402;
    float _450 = -_414;
    float _452 = _450 + 1.0;
    bool _454 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _456 = 1.0 / _418;
    float _458 = _434 * _448;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _464 = -_446;
    float _466 = _464 + 1.0;
    float _468 = fma(_458, _398, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _470 = _430 * _452;
    float _472 = -_430;
    float _474 = _472 + 1.0;
    float _476 = _414 * _466;
    float _478 = _462 * _456;
    float _480 = _468 * _470;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _484 = _394 + _482;
    float _486 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[115].x, _480);
    float _488 = fma(_478, _484, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _492 = fma(_488, _476, _486);
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _496 = _490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _500 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[117].x, _492);
    float _502 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _500 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_73.x = _496;
    out.m_73.y = _502;
    out.m_73.z = _504;
    out.m_73.w = _506;
    bool _508 = !_454;
    float _526;
    if (!_508)
    {
        float _510 = in.m_69.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_132);
        float _532 = 1.0 / _530;
        float _534 = _166 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    bool _538 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _540 = isnan(_536);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _554 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _556 = isnan(_536);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _566;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _572 = _536 + _570;
    float _574 = -_548;
    float _576 = _574 + 1.0;
    bool _578 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _580 = 1.0 / _552;
    float _582 = _564 * _576;
    float _584 = -_564;
    float _586 = _584 + 1.0;
    float _588 = _568 * _580;
    float _590 = fma(_588, _572, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _592 = _590 * _582;
    float _594 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[131].x, _592);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _602 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[132].x, _594);
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _602 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_75.x = _604;
    out.m_75.y = _606;
    out.m_75.z = _608;
    out.m_75.w = _610;
    bool _612 = !_578;
    float _630;
    if (!_612)
    {
        float _614 = in.m_69.x;
        float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _618 = _614 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _620 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[14].x, _166);
        float _622 = _620 * _616;
        float _624 = floor(_622);
        float _626 = -_624;
        float _628 = _622 + _626;
        _630 = _628;
        _632 = true;
    }
    else
    {
        float _634 = float(_132);
        float _636 = 1.0 / _634;
        float _638 = _166 * _636;
        _630 = _638;
    }
    _632 = false;
    float _640 = _630;
    float _642 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _644 = int(_642);
    float _646 = in.m_77.y;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _650 = _640 + _648;
    float _652 = in.m_61.w;
    float _654 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _656 = int(_654);
    bool _658 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _660 = isnan(_640);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _674 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _676 = isnan(_640);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _690 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _692 = isnan(_640);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = in.m_65.w;
    bool _704 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _706 = isnan(_640);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _718 = int(_716);
    float _720 = float(_644);
    float _722 = -_684;
    float _724 = _722 + 1.0;
    float _726 = in.m_63.w;
    float _728 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _730 = 1.0 / _720;
    float _732 = float(uint(_656));
    float _734 = _728 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _736 = ~_656;
    int _738 = _736 + 1;
    int _740 = ~_656;
    int _742 = _740 + 1;
    bool _744 = _656 == 0;
    float _746 = 1.0 / _732;
    float _748 = float(_718);
    int _750 = ~_656;
    int _752 = _750 + 1;
    float _754 = _730 * _166;
    float _756 = 1.0 / _748;
    int _758 = as_type<int>(_746) + (-2);
    float _760 = trunc(_754);
    int _762 = int(_760);
    float _764 = float(_656);
    float _766 = _756 * _166;
    float _768 = 1.0 / _672;
    float _770 = float(uint(_762));
    float _772 = trunc(_766);
    int _774 = int(_772);
    float _776 = as_type<float>(_758) * _770;
    float _778 = trunc(_776);
    float _780 = precise::max(_778, 0.0);
    uint _783 = uint(_780);
    float _785 = 1.0 / _688;
    int _787 = _738 * int(_783);
    int _789 = _787 + _762;
    float _791 = in.m_69.x;
    float _793 = float(uint(_789));
    float _795 = as_type<float>(_758) * _793;
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _799 = _797 != 0;
    float _801 = trunc(_795);
    float _803 = precise::max(_801, 0.0);
    uint _805 = uint(_803);
    float _807 = _754;
    if (_799)
    {
        _807 = 1.0;
    }
    float _809 = _807;
    float _811 = _809;
    if (!_799)
    {
        _811 = 7.345489978790283203125;
    }
    float _813 = _811;
    float _815 = _813 * _791;
    int _817 = int(_783) + int(_805);
    float _819 = float(_762);
    int _821 = _742 * _817;
    int _823 = _821 + _762;
    bool _825 = _819 >= _764;
    bool _827 = isnan(_819);
    bool _829 = _825 || _827;
    bool _831 = isnan(_764);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = floor(_815);
    bool _839 = uint(_823) >= uint(_656);
    bool _841 = !_839;
    int _843 = _841 ? 0 : (-1);
    float _845 = trunc(_835);
    int _847 = int(_845);
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _851 = _849 != 0;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _855 = _853 != 0;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _859 = _857 != 0;
    int _861 = ~_817;
    int _863 = _861 + _843;
    int _865 = _863 + 1;
    float _867 = float(_132);
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _871 = _869 != 0;
    int _873 = _656 * _865;
    int _875 = _873 + _762;
    float _877 = -_837;
    float _879 = _815 + _877;
    bool _881 = !_855;
    int _883 = _881 ? 0 : 1;
    float _885 = 1.0 / _867;
    int _887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _889 = _887 != 0;
    float _891 = _879 * _764;
    bool _893 = !_744;
    int _895 = _893 ? _875 : (-1);
    int _897 = ~_847;
    int _899 = _897 + 1;
    int _901 = _899 + 1;
    int _903 = _656 + (-1);
    float _905 = trunc(_891);
    int _907 = int(_905);
    bool _909 = _656 == 0;
    int _911 = _895 * _901;
    float _913 = _764 * _166;
    int _915 = _847 * _903;
    int _917 = _915 + _911;
    bool _919 = !_871;
    int _921 = _919 ? 0 : 1;
    float _923 = _913 * _885;
    bool _925 = !_851;
    int _927 = _925 ? 0 : 1;
    int _929 = abs(_883);
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _933 = _931 != 0;
    float _935 = trunc(_923);
    int _937 = int(_935);
    bool _939 = !_859;
    int _941 = _939 ? 0 : 1;
    int _943 = _917 * _929;
    int _945 = abs(_927);
    float _947 = in.m_69.w;
    int _949 = abs(_921);
    bool _951 = !_933;
    int _953 = _951 ? 0 : 1;
    int _955 = abs(_941);
    int _957 = _907 * _949;
    int _959 = _957 + _762;
    int _961 = abs(_953);
    int _963 = _937 * _945;
    int _965 = _963 + _943;
    float _967 = float(uint(_774));
    int _969 = _959 * _955;
    int _971 = _969 + _965;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _975 = _973 != 0;
    float _977 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _979 = int(_977);
    bool _981 = _744;
    if (_889)
    {
        bool _983 = _791 > 0.5;
        _981 = _983;
    }
    bool _985 = _981;
    int _987 = _907 * _961;
    int _989 = _987 + _971;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _993 = _991 != 0;
    float _995 = float(uint(_989));
    float _997 = as_type<float>(_758) * _995;
    int _999 = ~_656;
    int _1001 = _999 + 1;
    float _1003 = float(uint(_979));
    float _1005 = trunc(_997);
    float _1007 = precise::max(_1005, 0.0);
    uint _1009 = uint(_1007);
    int _1011 = ~_979;
    int _1013 = _1011 + 1;
    int _1015 = ~_979;
    int _1017 = _1015 + 1;
    float _1019 = float(_979);
    float _1021 = 1.0 / _1003;
    float _1023 = _1019 * _166;
    float _1025 = _1023 * _885;
    int _1027 = _1001 * int(_1009);
    int _1029 = _1027 + _989;
    float _1031 = trunc(_1025);
    int _1033 = int(_1031);
    float _1035 = float(uint(_1029));
    int _1037 = as_type<int>(_1021) + (-2);
    float _1039 = as_type<float>(_758) * _1035;
    float _1041 = in.m_69.y;
    float _1043 = as_type<float>(_1037) * _967;
    float _1045 = trunc(_1039);
    float _1047 = precise::max(_1045, 0.0);
    uint _1049 = uint(_1047);
    float _1051 = in.m_69.z;
    float _1053 = trunc(_1043);
    float _1055 = precise::max(_1053, 0.0);
    uint _1057 = uint(_1055);
    int _1059 = int(_1009) + int(_1049);
    int _1061 = int(_1009);
    float _1063 = _1043;
    int _1065 = _1013;
    if (_889)
    {
        float _1067 = -_188;
        float _1069 = _1067 + 1.0;
        _1061 = as_type<int>(_1069);
    }
    int _1071 = _1061;
    if (!_889)
    {
        _1063 = _188;
    }
    float _1073 = _1063;
    float _1075 = _1073;
    if (_889)
    {
        float _1077 = _985 ? as_type<float>(_1071) : _188;
        _1075 = _1077;
    }
    float _1079 = _1075;
    int _1081 = _752 * _1059;
    int _1083 = _1081 + _989;
    float _1085 = -_192;
    float _1087 = _1085 + 1.0;
    int _1089 = _1013 * int(_1057);
    int _1091 = _1089 + _774;
    float _1093 = _1087;
    if (_975)
    {
        float _1095 = -_188;
        float _1097 = _1095 + 1.0;
        _1065 = as_type<int>(_1097);
    }
    int _1099 = _1065;
    bool _1101 = _1051 > 0.5;
    bool _1103 = uint(_1083) >= uint(_656);
    float _1105 = float(uint(_1091));
    bool _1107 = !_1103;
    int _1109 = _1107 ? 0 : (-1);
    bool _1111 = _1041 > 0.5;
    float _1113 = as_type<float>(_1037) * _1105;
    int _1115 = ~_1059;
    int _1117 = _1115 + _1109;
    int _1119 = _1117 + 1;
    bool _1121 = _947 > 0.5;
    float _1123 = _1105;
    if (!_975)
    {
        _1123 = _188;
    }
    float _1125 = _1123;
    int _1127 = _656 * _1119;
    int _1129 = _1127 + _989;
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1133 = _1131 != 0;
    float _1135 = trunc(_1113);
    float _1137 = precise::max(_1135, 0.0);
    uint _1139 = uint(_1137);
    float _1141 = _1125;
    float _1143 = as_type<float>(_1129);
    if (_975)
    {
        float _1145 = _1101 ? as_type<float>(_1099) : _188;
        _1141 = _1145;
    }
    float _1147 = _1141;
    int _1149 = _1111 ? as_type<int>(_1087) : as_type<int>(_192);
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1153 = _1151 != 0;
    int _1155 = _1121 ? as_type<int>(_1087) : as_type<int>(_192);
    bool _1157 = !_909;
    int _1159 = _1157 ? _1129 : (-1);
    int _1161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1163 = _1161 != 0;
    float _1165 = _1153 ? as_type<float>(_1155) : _192;
    int _1167 = _1159 & 3;
    bool _1169 = _1167 != 0;
    float _1171 = _1163 ? as_type<float>(_1149) : _192;
    bool _1173 = uint(_1167) > 1u;
    if (_1133)
    {
        float _1175 = _1101 ? _1087 : _192;
        _238 = _1175;
    }
    float _1177 = _238;
    int _1179 = _1159 & 3;
    bool _1181 = _1179 != 0;
    if (_993)
    {
        _1093 = _791;
    }
    float _1183 = _1093;
    float _1185 = _1183;
    if (_993)
    {
        _1143 = 1.0;
    }
    float _1187 = _1143;
    float _1189 = _1187;
    if (!_993)
    {
        _1185 = _1041;
    }
    float _1191 = _1185;
    if (!_993)
    {
        _1189 = 1.2345600128173828125;
    }
    float _1193 = _1189;
    int _1195 = _1181 ? 0 : 1;
    int _1197 = int(_1057) + int(_1139);
    float _1199 = _1191 * _1193;
    bool _1201 = _1167 != 3;
    float _1203 = in.m_50.x;
    float _1205 = in.m_50.y;
    int _1207 = ~_1195;
    int _1209 = _1207 + 1;
    int _1211 = _1209 + 1;
    int _1213 = _1017 * _1197;
    int _1215 = _1213 + _774;
    bool _1217 = uint(_1167) >= 2u;
    float _1219 = floor(_1199);
    int _1221 = _1211;
    if (!_1173)
    {
        int _1223 = ~_1195;
        int _1225 = _1223 + 1;
        _1221 = _1225;
    }
    int _1227 = _1221;
    float _1229 = float(_774);
    int _1231 = _1217 ? 0 : 1;
    bool _1233 = _1229 >= _1019;
    bool _1235 = isnan(_1229);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan(_1019);
    bool _1241 = _1237 || _1239;
    float _1243 = float(_1241);
    bool _1245 = uint(_1215) >= uint(_979);
    int _1247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1249 = _1247 != 0;
    float _1251 = trunc(_1243);
    int _1253 = int(_1251);
    int _1255 = ~_1231;
    int _1257 = _1255 + 1;
    int _1259 = _1257 + 1;
    int _1261 = _1259;
    if (_1201)
    {
        int _1263 = ~_1231;
        int _1265 = _1263 + 1;
        _1261 = _1265;
    }
    int _1267 = _1261;
    float _1269 = -_1219;
    float _1271 = _1199 + _1269;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1275 = _1273 != 0;
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1279 = _1277 != 0;
    bool _1281 = !_1245;
    int _1283 = _1281 ? 0 : (-1);
    float _1285 = _1019 * _1271;
    bool _1287 = !_1249;
    int _1289 = _1287 ? 0 : 1;
    float _1291 = _214 * _1205;
    int _1293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1295 = _1293 != 0;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1299 = _1297 != 0;
    float _1301 = _208 * _1205;
    int _1303 = ~_1197;
    int _1305 = _1303 + _1283;
    int _1307 = _1305 + 1;
    float _1309 = _202 * _1205;
    bool _1311 = !_1279;
    int _1313 = _1311 ? 0 : 1;
    float _1315 = _1205 + _646;
    bool _1317 = !_1275;
    int _1319 = _1317 ? 0 : 1;
    float _1321 = trunc(_1285);
    int _1323 = int(_1321);
    int _1325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1327 = _1325 != 0;
    float _1329 = fma(_206, _1203, _1301);
    int _1331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1333 = _1331 != 0;
    float _1335 = fma(_212, _1203, _1291);
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1339 = _1337 != 0;
    int _1341 = _979 * _1307;
    int _1343 = _1341 + _774;
    bool _1345 = !_1295;
    int _1347 = _1345 ? 0 : 1;
    bool _1349 = _979 == 0;
    int _1351 = ~_1253;
    int _1353 = _1351 + 1;
    int _1355 = _1353 + 1;
    bool _1357 = !_1349;
    int _1359 = _1357 ? _1343 : (-1);
    int _1361 = _979 + (-1);
    int _1363 = abs(_1313);
    int _1365 = _1355 * _1359;
    float _1367 = fma(_200, _1203, _1309);
    int _1369 = abs(_1289);
    int _1371 = _1253 * _1361;
    int _1373 = _1371 + _1365;
    float _1375 = float(uint(_959));
    int _1377 = abs(_1319);
    int _1379 = _1373 * _1363;
    int _1381 = abs(_1347);
    float _1383 = as_type<float>(_758) * _1375;
    bool _1385 = !_1299;
    int _1387 = _1385 ? 0 : 1;
    float _1389 = trunc(_1383);
    float _1391 = precise::max(_1389, 0.0);
    uint _1393 = uint(_1391);
    int _1395 = _1323 * _1369;
    int _1397 = _1395 + _774;
    int _1399 = ~_656;
    int _1401 = _1399 + 1;
    int _1403 = _1033 * _1377;
    int _1405 = _1403 + _1379;
    float _1407 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1409 = abs(_1387);
    int _1411 = _1397 * _1381;
    int _1413 = _1411 + _1405;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1417 = _1415 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1419 = _1041 > 0.5;
    bool _1421 = _1419 && _1333;
    int _1423 = _1323 * _1409;
    int _1425 = _1423 + _1413;
    float _1427 = _791 * 2.0;
    int _1429 = _1401 * int(_1393);
    int _1431 = _1429 + _959;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1435 = _1433 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1437 = 1.0 / _1417;
    float _1439 = float(uint(_1425));
    float _1441 = _791 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1443 = float(uint(_1431));
    float _1445 = as_type<float>(_1037) * _1439;
    float _1447 = as_type<float>(_758) * _1443;
    float _1449 = floor(_1427);
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1451;
    int _1455 = ~_656;
    int _1457 = _1455 + 1;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1461 = _1459 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1463;
    float _1467 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1469 = _1467 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1471 = _1041 * 2.0;
    float _1473 = trunc(_1445);
    float _1475 = precise::max(_1473, 0.0);
    uint _1477 = uint(_1475);
    float _1479 = _1465 * _768;
    int _1481 = ~_979;
    int _1483 = _1481 + 1;
    float _1485 = _1469 * _1437;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1489 = _1487 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1491 = 1.0 / _1435;
    float _1493 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1495 = abs(_1227);
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1499 = -_1493;
    float _1501 = fma(_1441, 2.0, _1499);
    float _1503 = trunc(_1447);
    float _1505 = precise::max(_1503, 0.0);
    uint _1507 = uint(_1505);
    int _1509 = _1483 * int(_1477);
    int _1511 = _1509 + _1425;
    float _1513 = fma(_1407, -2.0, _1497);
    int _1515 = as_type<int>(_1407);
    int _1517 = as_type<int>(_1441);
    float _1519 = _1447;
    float _1521 = _1501;
    if (_993)
    {
        _1515 = 0;
    }
    int _1523 = _1515;
    int _1525 = _1523;
    if (_993)
    {
        _1517 = 0;
    }
    int _1527 = _1517;
    float _1529 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1513);
    float _1531 = float(uint(_1511));
    float _1533 = _1453 * _1491;
    int _1535 = _1527;
    if (!_1333)
    {
        _1519 = _188;
    }
    float _1537 = _1519;
    float _1539 = _1537;
    if (_1421)
    {
        float _1541 = -_188;
        float _1543 = _1541 + 1.0;
        _240 = _1543;
    }
    float _1545 = _240;
    bool _1547 = _1449 >= 0.0;
    bool _1549 = isnan(_1449);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan(0.0);
    bool _1555 = _1551 || _1553;
    float _1557 = floor(_1471);
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    if (!_993)
    {
        _1525 = 1;
    }
    int _1563 = _1525;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1567 = _640 + _1565;
    int _1569 = _1555 ? 0 : 1;
    bool _1571 = _1449 > 0.0;
    float _1573 = fma(_1533, _1567, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1575 = int(_1393) + int(_1507);
    float _1577 = 1.0 / _1461;
    float _1579 = as_type<float>(_1037) * _1531;
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1583 = _1581 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1585 = in.m_50.z;
    if (_1333)
    {
        _1539 = _1545;
    }
    float _1587 = _1539;
    int _1589 = _1457 * _1575;
    int _1591 = _1589 + _959;
    int _1593 = ~_1569;
    int _1595 = _1593 + 1;
    int _1597 = _1595 + 1;
    float _1599 = trunc(_1579);
    float _1601 = precise::max(_1599, 0.0);
    uint _1603 = uint(_1601);
    bool _1605 = uint(_1591) >= uint(_656);
    int _1607 = _1597;
    if (!_1571)
    {
        int _1609 = ~_1569;
        int _1611 = _1609 + 1;
        _1607 = _1611;
    }
    int _1613 = _1607;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1617 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1615;
    float _1619 = 1.0 / _1489;
    bool _1621 = !_1605;
    int _1623 = _1621 ? 0 : (-1);
    float _1625 = _1561 * _1577;
    bool _1627 = _1557 > 0.0;
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1629;
    bool _1633 = _1557 >= 0.0;
    bool _1635 = isnan(_1557);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan(0.0);
    bool _1641 = _1637 || _1639;
    float _1643 = _1051 * 2.0;
    int _1645 = ~_979;
    int _1647 = _1645 + 1;
    float _1649 = 1.0 / _1583;
    int _1651 = int(_1477) + int(_1603);
    float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1655 = _1653 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1657 = _1631 * _785;
    float _1659 = fma(_210, _1585, _1329);
    if (!_993)
    {
        _1535 = 2;
    }
    int _1661 = _1535;
    float _1663 = fma(_216, _1585, _1335);
    float _1665 = _1655 * _1619;
    int _1667 = _1641 ? 0 : 1;
    int _1669 = _1647 * _1651;
    int _1671 = _1669 + _1425;
    float _1673 = floor(_1643);
    float _1675 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1677 = _640 + _1675;
    bool _1679 = !_1169;
    int _1681 = _1679 ? 0 : 1;
    float _1683 = _1659 + _726;
    float _1685 = _1617 * _1649;
    float _1687 = fma(_204, _1585, _1367);
    int _1689 = ~_1667;
    int _1691 = _1689 + 1;
    int _1693 = _1691 + 1;
    float _1695 = _791 + _1041;
    bool _1697 = uint(_1671) >= uint(_979);
    float _1699 = _1041 + _1051;
    int _1701 = _1693;
    if (!_1627)
    {
        int _1703 = ~_1667;
        int _1705 = _1703 + 1;
        _1701 = _1705;
    }
    int _1707 = _1701;
    float _1709 = _1695 + (-1.0);
    bool _1711 = _1167 != 3;
    float _1713 = _1699 + (-1.0);
    bool _1715 = !_1697;
    int _1717 = _1715 ? 0 : (-1);
    float _1719 = fma(_1479, _1677, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1723 = _1721 != 0;
    int _1725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1727 = _1725 != 0;
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1731 = _1729 != 0;
    float _1733 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1735 = fma(_1685, _650, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1737 = !_1711;
    int _1739 = _1737 ? 0 : (-1);
    float _1741 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1743 = _1683 + _1741;
    bool _1745 = !_1727;
    int _1747 = _1745 ? 0 : 1;
    float _1749 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1751 = _1673 > 0.0;
    float _1753 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1755 = _640 + _1753;
    bool _1757 = _1673 >= 0.0;
    bool _1759 = isnan(_1673);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan(0.0);
    bool _1765 = _1761 || _1763;
    bool _1767 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1769 = isnan(_640);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1775 = _1771 || _1773;
    float _1777 = float(_1775);
    float _1779 = fma(_1485, _1755, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1781 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1783 = isnan(_640);
    bool _1785 = _1781 || _1783;
    bool _1787 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1789 = _1785 || _1787;
    float _1791 = float(_1789);
    float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1795 = _640 + _1793;
    bool _1797 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1799 = isnan(_640);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1805 = _1801 || _1803;
    float _1807 = float(_1805);
    float _1809 = -_1777;
    float _1811 = _1809 + 1.0;
    int _1813 = _1765 ? 0 : 1;
    float _1815 = -_1791;
    float _1817 = _1815 + 1.0;
    float _1819 = fma(_1625, _1795, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1821 = _1791 * _1811;
    float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1825 = _640 + _1823;
    bool _1827 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1829 = isnan(_640);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1835 = _1831 || _1833;
    float _1837 = float(_1835);
    float _1839 = _668 * _1817;
    float _1841 = -_668;
    float _1843 = _1841 + 1.0;
    float _1845 = fma(_1657, _1825, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1849 = _1661 != 2;
    float _1851 = _1837 * _1843;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1855 = _640 + _1853;
    bool _1857 = !_1723;
    int _1859 = _1857 ? 0 : 1;
    float _1861 = -_1837;
    float _1863 = _1861 + 1.0;
    bool _1865 = _1563 != 1;
    float _1867 = fma(_1665, _1855, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1869 = _700 * _724;
    float _1871 = -_700;
    float _1873 = _1871 + 1.0;
    float _1875 = _1687 + _652;
    float _1877 = _1663 + _702;
    bool _1879 = !_1731;
    int _1881 = _1879 ? 0 : 1;
    float _1883 = _714 * _1873;
    float _1885 = -_714;
    float _1887 = _1885 + 1.0;
    int _1889 = abs(_1747);
    float _1891 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1893 = _1807 * _1887;
    float _1895 = -_1807;
    float _1897 = _1895 + 1.0;
    float _1899 = fma(_1891, _1177, -0.5);
    float _1901 = _1891;
    if (_1849)
    {
        _1901 = _791;
    }
    float _1903 = _1901;
    float _1905 = _1719 * _1893;
    int _1907 = abs(_1881);
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1911 = _1903;
    if (!_1849)
    {
        _1911 = _1051;
    }
    float _1913 = _1911;
    float _1915 = fma(_1897, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1905);
    float _1917 = _684 * _1863;
    int _1919 = ~_1651;
    int _1921 = _1919 + _1717;
    int _1923 = _1921 + 1;
    float _1925 = fma(_1779, _1883, _1915);
    float _1927 = _1913 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1929 = ~_979;
    int _1931 = _1929 + 1;
    float _1933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1935 = fma(_1573, _1869, _1925);
    float _1937 = float(uint(_1397));
    int _1939 = _979 * _1923;
    int _1941 = _1939 + _1425;
    float _1943 = float(_1613);
    float _1945 = -_1909;
    float _1947 = fma(_1927, 2.0, _1945);
    float _1949 = float(_1889);
    float _1951 = as_type<float>(_1037) * _1937;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1955 = _1315 + _1953;
    float _1957 = float(_1707);
    float _1959 = _1949 * _1943;
    float _1961 = float(_1907);
    float _1963 = trunc(_1951);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    bool _1969 = !_1349;
    int _1971 = _1969 ? _1941 : (-1);
    float _1973 = _1955 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1977 = _1875 + _1975;
    int _1979 = ~_1813;
    int _1981 = _1979 + 1;
    int _1983 = _1981 + 1;
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1987 = _1877 + _1985;
    int _1989 = _1983;
    if (!_1751)
    {
        int _1991 = ~_1813;
        int _1993 = _1991 + 1;
        _1989 = _1993;
    }
    int _1995 = _1989;
    float _1997 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1973);
    int _1999 = _1971 & 3;
    bool _2001 = _1999 != 0;
    float _2003 = _1933 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _2005 = abs(_1859);
    float _2007 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1997);
    float _2009 = _2001 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2011 = fma(_1819, _1917, _1935);
    bool _2013 = uint(_1999) >= 2u;
    float _2015 = fma(_2003, _1587, -0.5);
    int _2017 = _1931 * int(_1967);
    int _2019 = _2017 + _1397;
    float _2021 = -_166;
    float _2023 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1947);
    float _2025 = _1977 * _1977;
    float _2027 = float(uint(_2019));
    float _2029 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2031 = float(_2005);
    float _2033 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2035 = float(_1995);
    float _2037 = as_type<float>(_1037) * _2027;
    float _2039 = _2027;
    float _2041 = _2007;
    float _2043 = _2035;
    float _2045 = _2009;
    if (!_1865)
    {
        _2039 = _1041;
    }
    float _2047 = _2039;
    float _2049 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2029);
    int _2051 = _2013 ? 0 : 1;
    float _2053 = _2031 * _2035;
    bool _2055 = _2007 >= 0.0;
    float _2057 = trunc(_2037);
    float _2059 = precise::max(_2057, 0.0);
    uint _2061 = uint(_2059);
    float _2063 = _2047;
    if (!_1865)
    {
        _2041 = _2047;
    }
    float _2065 = _2041;
    float _2067 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2049);
    float _2069 = _1961 * _1957;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    float _2073 = _2065;
    float _2075 = _2069;
    if (_1865)
    {
        _2063 = _791;
    }
    float _2077 = _2063;
    float _2079 = fma(_2067, _2015, _2023);
    if (!_1865)
    {
        _2043 = _1051;
    }
    float _2081 = _2043;
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2085 = _2081;
    if (_1865)
    {
        _2085 = _1041;
    }
    float _2087 = _2085;
    float _2089 = fma(_2077, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2033);
    int _2091 = _1159 >> 31;
    float _2093 = fma(_1845, _1851, _2011);
    int _2095 = _1971 >> 31;
    float _2097 = fma(_2087, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2083);
    int _2099 = _2091 & 3;
    float _2101 = fma(_1743, _1743, _2025);
    int _2103 = int(_1967) + int(_2061);
    float _2105 = fma(_1867, _1839, _2093);
    int _2107 = _1159 + _2099;
    float _2109 = fma(_1987, _1987, _2101);
    int _2111 = _2095 & 3;
    float _2113 = in.m_79.x;
    float _2115 = in.m_79.y;
    float _2117 = in.m_79.z;
    int _2119 = _2107 >> 2;
    float _2121 = sqrt(_2109);
    int _2123 = _1971 + _2111;
    float _2125 = _2053 * (-2.0);
    int _2127 = _2119 << 4;
    int _2129 = _2127 + 368;
    float _2131 = fma(_1735, _1821, _2105);
    int _2133 = _2123 >> 2;
    float _2135 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2097);
    uint _2137 = uint(int(uint(_2129) >> uint(2)));
    uint _2139 = uint(int(uint(int(_2137)) >> uint(2)));
    int _2141 = int(_2137) & 3;
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[int(_2139)][_2141];
    int _2145 = int(_2137) + 1;
    uint _2147 = uint(int(uint(_2145) >> uint(2)));
    int _2149 = _2145 & 3;
    float _2151 = (*spvDescriptorSet0.vp_c9)._m0[int(_2147)][_2149];
    if (!_1865)
    {
        _2071 = _1051;
    }
    float _2153 = _2071;
    float _2155 = rsqrt(_2109);
    int _2157 = _2133 << 4;
    int _2159 = _2157 + 512;
    float _2161 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2131);
    float _2163 = _2153;
    if (_1865)
    {
        _2073 = _791;
    }
    float _2165 = _2073;
    if (_2055)
    {
        out.m_53.x = 0.0;
    }
    if (_1865)
    {
        _2163 = _1041;
    }
    float _2167 = _2163;
    uint _2169 = uint(int(uint(_2159) >> uint(2)));
    uint _2171 = uint(int(uint(int(_2169)) >> uint(2)));
    int _2173 = int(_2169) & 3;
    float _2175 = (*spvDescriptorSet0.vp_c9)._m0[int(_2171)][_2173];
    int _2177 = int(_2169) + 1;
    uint _2179 = uint(int(uint(_2177) >> uint(2)));
    int _2181 = _2177 & 3;
    float _2183 = (*spvDescriptorSet0.vp_c9)._m0[int(_2179)][_2181];
    bool _2185 = uint(_1999) > 1u;
    float _2187 = _2121 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2189 = ~_979;
    int _2191 = _2189 + 1;
    float _2193 = _2167 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2195 = _2165 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2197 = precise::min(_734, _2187);
    int _2199 = _2191 * _2103;
    int _2201 = _2199 + _1397;
    int _2203 = _2159 + 8;
    uint _2205 = uint(int(uint(_2203) >> uint(2)));
    uint _2207 = uint(int(uint(int(_2205)) >> uint(2)));
    int _2209 = int(_2205) & 3;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[int(_2207)][_2209];
    int _2213 = int(_2205) + 1;
    uint _2215 = uint(int(uint(_2213) >> uint(2)));
    int _2217 = _2213 & 3;
    float _2219 = (*spvDescriptorSet0.vp_c9)._m0[int(_2215)][_2217];
    int _2221 = ~as_type<int>(_2009);
    int _2223 = _2221 + 1;
    int _2225 = _2223 + 1;
    float _2227 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2229 = _2155 * _2197;
    int _2231 = _2225;
    if (!_2185)
    {
        int _2233 = ~as_type<int>(_2009);
        int _2235 = _2233 + 1;
        _2231 = _2235;
    }
    int _2237 = _2231;
    float _2239 = fma(_2193, -2.0, _2227);
    bool _2241 = uint(_2201) >= uint(_979);
    float _2243 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2245 = _2129 + 8;
    uint _2247 = uint(int(uint(_2245) >> uint(2)));
    uint _2249 = uint(int(uint(int(_2247)) >> uint(2)));
    int _2251 = int(_2247) & 3;
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[int(_2249)][_2251];
    int _2255 = int(_2247) + 1;
    uint _2257 = uint(int(uint(_2255) >> uint(2)));
    int _2259 = _2255 & 3;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[int(_2257)][_2259];
    int _2263 = ~_1575;
    int _2265 = _2263 + _1623;
    int _2267 = _2265 + 1;
    float _2269 = _1743 * _2229;
    bool _2271 = !_2241;
    int _2273 = _2271 ? 0 : (-1);
    float _2275 = -_2243;
    float _2277 = fma(_2195, 2.0, _2275);
    bool _2279 = _1999 != 3;
    int _2281 = _656 * _2267;
    int _2283 = _2281 + _959;
    if (_2055)
    {
        _2045 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2285 = _2045;
    int _2287 = ~_2103;
    int _2289 = _2287 + _2273;
    int _2291 = _2289 + 1;
    float _2293 = _1977 * _2229;
    int _2295 = ~_2051;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    int _2301 = as_type<int>(_2285);
    int _2303 = _2299;
    if (_2055)
    {
        float _2305 = _2285 * 5.0;
        _2301 = as_type<int>(_2305);
    }
    int _2307 = _2301;
    int _2309 = abs(_2237);
    int _2311 = _979 * _2291;
    int _2313 = _2311 + _1397;
    float _2315 = -_2269;
    float _2317 = _1743 + _2315;
    if (_2055)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8203 = as_type<float>(_2307);
        out.gl_Position.z = _8203;
    }
    if (_2279)
    {
        int _2319 = ~_2051;
        int _2321 = _2319 + 1;
        _2303 = _2321;
    }
    int _2323 = _2303;
    float _2325 = -_2293;
    float _2327 = _1977 + _2325;
    int _2329 = _1971 & 3;
    bool _2331 = _2329 != 0;
    float _2333 = _2317 * _2317;
    float _2335 = _1987 * _2229;
    int _2337 = abs(_1681);
    float _2339 = fma(_2327, _2327, _2333);
    int _2341 = ~_2309;
    int _2343 = _2341 + 1;
    int _2345 = _2343 + 1;
    float _2347 = fma(_2125, _2113, _2113);
    int _2349 = abs(_2323);
    float _2351 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2353 = int(_2351);
    int _2355 = ~_1495;
    int _2357 = _2355 + 1;
    int _2359 = _2357 + 1;
    int _2361 = _2345 * as_type<int>(_2183);
    bool _2363 = !_2331;
    int _2365 = _2363 ? 0 : 1;
    float _2367 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2239);
    int _2369 = abs(_1267);
    int _2371 = _2359 * as_type<int>(_2151);
    int _2373 = abs(_2365);
    out.m_81.w = _2197;
    float _2375 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2377 = int(_2375);
    out.m_83.x = _2161;
    int _2379 = ~_2337;
    int _2381 = _2379 + 1;
    int _2383 = _2381 + 1;
    float _2385 = fma(_1749, _2125, _1749);
    int _2387 = ~_2373;
    int _2389 = _2387 + 1;
    int _2391 = _2389 + 1;
    bool _2393 = _1999 != 3;
    int _2395 = _2383 * as_type<int>(_2143);
    int _2397 = _2395 + _2371;
    int _2399 = ~_2349;
    int _2401 = _2399 + 1;
    int _2403 = _2401 + 1;
    int _2405 = _2391 * as_type<int>(_2175);
    int _2407 = _2405 + _2361;
    float _2409 = float(uint(_2353));
    bool _2411 = !_2393;
    int _2413 = _2411 ? 0 : (-1);
    int _2415 = _2403 * as_type<int>(_2211);
    int _2417 = _2415 + _2407;
    int _2419 = abs(_1739);
    float _2421 = 1.0 / _2409;
    bool _2423 = !_1327;
    int _2425 = _2423 ? 0 : 1;
    int _2427 = ~_2369;
    int _2429 = _2427 + 1;
    int _2431 = _2429 + 1;
    bool _2433 = !_1339;
    int _2435 = _2433 ? 0 : 1;
    int _2437 = abs(_2425);
    int _2439 = _2431 * as_type<int>(_2253);
    int _2441 = _2439 + _2397;
    int _2443 = abs(_2413);
    float _2445 = float(uint(_2377));
    int _2447 = ~_2419;
    int _2449 = _2447 + 1;
    int _2451 = _2449 + 1;
    int _2453 = abs(_2435);
    float _2455 = 1.0 / _2445;
    int _2457 = _2451 * as_type<int>(_2261);
    int _2459 = _2457 + _2441;
    float _2461 = fma(_1955, _1955, _2025);
    bool _2463 = _656 == 0;
    float _2465 = -_2335;
    float _2467 = _1987 + _2465;
    int _2469 = abs(_2353);
    int _2471 = ~_2443;
    int _2473 = _2471 + 1;
    int _2475 = _2473 + 1;
    float _2477 = fma(_2467, _2467, _2339);
    int _2479 = ~_2437;
    int _2481 = _2479 + 1;
    int _2483 = _2481 + 1;
    bool _2485 = !_1349;
    int _2487 = _2485 ? _2313 : (-1);
    int _2489 = _2475 * as_type<int>(_2219);
    int _2491 = _2489 + _2417;
    int _2493 = ~_2453;
    int _2495 = _2493 + 1;
    int _2497 = _2495 + 1;
    int _2499 = _2459 * _2483;
    bool _2501 = !_2463;
    int _2503 = _2501 ? _2283 : (-1);
    float _2505 = sqrt(_2477);
    float _2507 = float(uint(_2469));
    int _2509 = _2497 * _2491;
    int _2511 = abs(_2377);
    int _2513 = _2503 * _2437;
    int _2515 = _2513 + _2499;
    int _2517 = as_type<int>(_2455) + (-2);
    int _2519 = _2487 * _2453;
    int _2521 = _2519 + _2509;
    int _2523 = as_type<int>(_2421) + (-2);
    float _2525 = 1.0 / _2507;
    float _2527 = float(uint(_2515));
    float _2529 = fma(_1987, _1987, _2461);
    float _2531 = float(uint(_2511));
    float _2533 = float(uint(_2521));
    float _2535 = as_type<float>(_2523) * _2527;
    float _2537 = as_type<float>(_2499);
    if (_1849)
    {
        _2537 = _1041;
    }
    float _2539 = _2537;
    float _2541 = _2155 * _2505;
    float _2543 = 1.0 / _2531;
    float _2545 = as_type<float>(_2517) * _2533;
    float _2547 = _2539;
    if (!_1849)
    {
        _2547 = _791;
    }
    float _2549 = _2547;
    int _2551 = abs(_2515);
    float _2553 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2555 = as_type<int>(_2525) + (-2);
    float _2557 = trunc(_2535);
    float _2559 = precise::max(_2557, 0.0);
    uint _2561 = uint(_2559);
    float _2563 = float(uint(_2551));
    float _2565 = _2549 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2567 = abs(_2521);
    int _2569 = ~_2353;
    int _2571 = _2569 + 1;
    float _2573 = fma(_2565, -2.0, _2553);
    float _2575 = as_type<float>(_2555) * _2563;
    float _2577 = trunc(_2545);
    float _2579 = precise::max(_2577, 0.0);
    uint _2581 = uint(_2579);
    int _2583 = as_type<int>(_2543) + (-2);
    float _2585 = _791 + (-0.5);
    float _2587 = float(uint(_2567));
    float _2589 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2573);
    int _2591 = ~_2377;
    int _2593 = _2591 + 1;
    float _2595 = fma(_2585, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2347);
    int _2597 = ~_2377;
    int _2599 = _2597 + 1;
    int _2601 = _2571 * int(_2561);
    int _2603 = _2601 + _2515;
    float _2605 = trunc(_2575);
    float _2607 = precise::max(_2605, 0.0);
    uint _2609 = uint(_2607);
    float _2611 = as_type<float>(_2583) * _2587;
    float _2613 = float(uint(_2603));
    int _2615 = ~_2469;
    int _2617 = _2615 + 1;
    int _2619 = _2593 * int(_2581);
    int _2621 = _2619 + _2521;
    float _2623 = rsqrt(_2529);
    float _2625 = as_type<float>(_2523) * _2613;
    float _2627 = _728 * _2541;
    float _2629 = float(uint(_2621));
    float _2631 = _2627 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2633 = trunc(_2611);
    float _2635 = precise::max(_2633, 0.0);
    uint _2637 = uint(_2635);
    int _2639 = _2617 * int(_2609);
    int _2641 = _2639 + _2551;
    float _2643 = as_type<float>(_2517) * _2629;
    float _2645 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _2647 = ~_2469;
    int _2649 = _2647 + 1;
    float _2651 = float(uint(_2641));
    float _2653 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2645);
    float _2655 = _2631 * _2623;
    int _2657 = ~_2511;
    int _2659 = _2657 + 1;
    float _2661 = trunc(_2625);
    float _2663 = precise::max(_2661, 0.0);
    uint _2665 = uint(_2663);
    float _2667 = as_type<float>(_2555) * _2651;
    bool _2669 = _2377 == 0;
    float _2671 = _1955 * _2655;
    bool _2673 = _2377 == 0;
    float _2675 = _1977 * _2655;
    int _2677 = _2659 * int(_2637);
    int _2679 = _2677 + _2567;
    float _2681 = -_2671;
    float _2683 = _1955 + _2681;
    float _2685 = trunc(_2643);
    float _2687 = precise::max(_2685, 0.0);
    uint _2689 = uint(_2687);
    float _2691 = -_2675;
    float _2693 = _1977 + _2691;
    float _2695 = float(uint(_2679));
    float _2697 = _2683 * _2683;
    float _2699 = as_type<float>(_2583) * _2695;
    float _2701 = trunc(_2667);
    float _2703 = precise::max(_2701, 0.0);
    uint _2705 = uint(_2703);
    float _2707 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2653);
    int _2709 = int(_2561) + int(_2665);
    float _2711 = _1987 * _2655;
    float _2713 = fma(_2693, _2693, _2697);
    float _2715 = -_2589;
    float _2717 = fma(_2707, _1899, _2715);
    int _2719 = int(_2581) + int(_2689);
    float _2721 = trunc(_2699);
    float _2723 = precise::max(_2721, 0.0);
    uint _2725 = uint(_2723);
    int _2727 = ~_2353;
    int _2729 = _2727 + 1;
    float _2731 = -_2711;
    float _2733 = _1987 + _2731;
    int _2735 = _2599 * _2719;
    int _2737 = _2735 + _2521;
    int _2739 = _2729 * _2709;
    int _2741 = _2739 + _2515;
    float _2743 = fma(_2733, _2733, _2713);
    int _2745 = int(_2609) + int(_2705);
    bool _2747 = uint(_2737) >= uint(_2377);
    bool _2749 = uint(_2741) >= uint(_2353);
    int _2751 = _2649 * _2745;
    int _2753 = _2751 + _2551;
    bool _2755 = !_2747;
    int _2757 = _2755 ? 0 : (-1);
    float _2759 = sqrt(_2743);
    int _2761 = int(_2637) + int(_2725);
    int _2763 = ~_2511;
    int _2765 = _2763 + 1;
    bool _2767 = !_2749;
    int _2769 = _2767 ? 0 : (-1);
    bool _2771 = uint(_2753) >= uint(_2469);
    int _2773 = _2765 * _2761;
    int _2775 = _2773 + _2567;
    int _2777 = ~_2709;
    int _2779 = _2777 + _2769;
    int _2781 = _2779 + 1;
    float _2783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2785 = _2353 == 0;
    bool _2787 = _2353 == 0;
    int _2789 = _2515 ^ _2353;
    int _2791 = _2353 * _2781;
    int _2793 = _2791 + _2515;
    int _2795 = ~_2719;
    int _2797 = _2795 + _2757;
    int _2799 = _2797 + 1;
    float _2801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2803 = _2521 ^ _2377;
    float _2805 = _2623 * _2759;
    bool _2807 = !_2785;
    int _2809 = _2807 ? _2793 : (-1);
    int _2811 = _2377 * _2799;
    int _2813 = _2811 + _2521;
    bool _2815 = !_2771;
    int _2817 = _2815 ? 0 : (-1);
    float _2819 = -_166;
    float _2821 = fma(_2819, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1501);
    float _2823 = float(_2809);
    float _2825 = _2783 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2827 = ~_2817;
    int _2829 = _2745 + _2827;
    int _2831 = _2829 + 1;
    float _2833 = _2627 * _2805;
    bool _2835 = uint(_2775) >= uint(_2511);
    float _2837 = fma(_2825, _2823, _2821);
    bool _2839 = !_2669;
    int _2841 = _2839 ? _2813 : (-1);
    float _2843 = fma(_2825, _1079, -0.5);
    uint _2845 = uint(int(uint(_2789) >> uint(31)));
    float _2847 = _2801 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2849 = float(_2841);
    float _2851 = -_166;
    float _2853 = fma(_2851, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2277);
    bool _2855 = !_2835;
    int _2857 = _2855 ? 0 : (-1);
    float _2859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2861 = ~int(_2845);
    int _2863 = _2861 + 1;
    float _2865 = fma(_2847, _1147, -0.5);
    float _2867 = fma(_2847, _2849, _2853);
    uint _2869 = uint(int(uint(_2803) >> uint(31)));
    out.m_85.x = _2833;
    int _2871 = _2831 ^ _2863;
    float _2873 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2875 = ~_2857;
    int _2877 = _2761 + _2875;
    int _2879 = _2877 + 1;
    float _2881 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2883 = log2(_2881);
    int _2885 = ~int(_2869);
    int _2887 = _2885 + 1;
    float _2889 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2873);
    int _2891 = ~_2863;
    int _2893 = _2891 + _2871;
    int _2895 = _2893 + 1;
    int _2897 = _2879 ^ _2887;
    float _2899 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2889);
    bool _2901 = !_2787;
    int _2903 = _2901 ? _2895 : (-1);
    float _2905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2907 = ~_2887;
    int _2909 = _2907 + _2897;
    int _2911 = _2909 + 1;
    float _2913 = _2859 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2915 = float(_2903);
    float _2917 = fma(_2899, _2843, _2837);
    bool _2919 = !_2673;
    int _2921 = _2919 ? _2911 : (-1);
    float _2923 = fma(_1171, _2913, -0.5);
    float _2925 = -_1529;
    float _2927 = fma(_2913, _2915, _2925);
    float _2929 = _2883 * _166;
    bool _2931 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2933 = isnan(0.0);
    bool _2935 = _2931 || _2933;
    bool _2937 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2939 = _2935 || _2937;
    bool _2941 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2943 = isnan(1.0);
    bool _2945 = _2941 || _2943;
    bool _2947 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2949 = _2945 || _2947;
    float _2951 = exp2(_2929);
    float _2953 = _2905 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2955 = float(_2921);
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2959 = fma(_1165, _2953, -0.5);
    float _2961 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2957);
    float _2963 = -_2367;
    float _2965 = fma(_2953, _2955, _2963);
    float _2967 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2089);
    float _2969 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2971 = 1.0 + _2969;
    float _2973 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2961);
    float _2975 = fma(_2135, _2959, _2965);
    float _2977 = fma(_2967, _2865, _2867);
    float _2979 = _2079 + 0.5;
    float _2981 = fma(_2973, _2923, _2927);
    float _2983 = _2717 + 0.5;
    float _2985 = 1.0 / _2971;
    float _2987 = _2977 + 0.5;
    float _2989 = _2917 + 0.5;
    float _2991 = _2981 + 0.5;
    float _2993 = _2975 + 0.5;
    float _2995 = -_2951;
    float _2997 = _2995 + 1.0;
    out.m_87.x = _2979;
    out.m_87.y = _2983;
    out.m_89.x = _2989;
    out.m_89.y = _2991;
    out.m_89.z = _2987;
    out.m_89.w = _2993;
    float _2999 = _2939 ? _2997 : 0.0;
    float _3001 = as_type<float>(_2813);
    float _3003 = _2671;
    if (_2055)
    {
        return out;
    }
    float _3005 = -_2671;
    float _3007 = _1315 + _3005;
    float _3009 = -_2675;
    float _3011 = _1875 + _3009;
    if (_2949)
    {
        float _3013 = _2999 * _2985;
        _168 = _3013;
    }
    float _3015 = _168;
    float _3017 = _1959 * (-2.0);
    float _3019 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3021 = _3007 + _3019;
    float _3023 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3025 = _3011 + _3023;
    float _3027 = fma(_1733, _3017, _1733);
    float _3029 = _3021 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3031 = _791 + _1051;
    float _3033 = fma(_3017, _2115, _2115);
    float _3035 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _3037 = (*spvDescriptorSet0.vp_c9)._m0[191].y + _3035;
    float _3039 = fma(_3025, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3029);
    float _3041 = -_2711;
    float _3043 = _1877 + _3041;
    float _3045 = _1041 + (-0.5);
    float _3047 = _3031 + (-1.0);
    float _3049 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3051 = _3043 + _3049;
    float _3053 = _2069 * (-2.0);
    float _3055 = 1.0 / _3037;
    float _3057 = fma(_3045, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3033);
    float _3059 = fma(_3051, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3039);
    float _3061 = fma(_3047, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3063 = _1051 + (-0.5);
    float _3065 = precise::max(_1585, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _3067 = fma(_3027, _3015, _3057);
    bool _3069 = _3059 >= 0.0;
    float _3071 = fma(_2385, _3015, _2595);
    float _3073 = fma(_3053, _2117, _2117);
    float _3075 = fma(_3061, _3053, _3061);
    float _3077 = precise::min(_3065, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _3079 = _3067 * 0.15915493667125701904296875;
    float _3081 = fma(_3063, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3073);
    float _3083 = in.m_91.x;
    float _3085 = in.m_91.y;
    float _3087 = in.m_91.z;
    float _3089 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _3091 = _3077 + _3089;
    float _3093 = fma(_3075, _3015, _3081);
    float _3095 = _3071 * 0.15915493667125701904296875;
    float _3097 = _3079 * 6.283185482025146484375;
    float _3099 = sin(_3097);
    float _3101 = _3091 * _3055;
    float _3103 = _3093 * 0.15915493667125701904296875;
    float _3105 = _3055;
    if (_3069)
    {
        _3105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3107 = _3105;
    float _3109 = (*spvDescriptorSet0.vp_c9)._m0[191].z + (-1.0);
    int _3111 = as_type<int>(_3107);
    if (_3069)
    {
        out.m_53.x = 0.0;
    }
    float _3113 = _3079 * 6.283185482025146484375;
    float _3115 = cos(_3113);
    if (_3069)
    {
        float _3117 = _3107 * 5.0;
        _3111 = as_type<int>(_3117);
    }
    int _3119 = _3111;
    float _3121 = fma(_3101, _3109, 1.0);
    float _3123 = _3103 * 6.283185482025146484375;
    float _3125 = sin(_3123);
    float _3127 = _3095 * 6.283185482025146484375;
    float _3129 = sin(_3127);
    float _3131 = _3095 * 6.283185482025146484375;
    float _3133 = cos(_3131);
    if (_3069)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9392 = as_type<float>(_3119);
        out.gl_Position.z = _9392;
    }
    if (_3069)
    {
        return out;
    }
    float _3135 = _3103 * 6.283185482025146484375;
    float _3137 = cos(_3135);
    float _3139 = _3121 * _3083;
    float _3141 = _3121 * _3085;
    float _3143 = _3121 * _3087;
    float _3145 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3147 = _2541 * _2805;
    float _3149 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3151 = _3129 * _3099;
    float _3153 = _3133 * _3115;
    float _3155 = _3145 * _3147;
    float _3157 = _3149 * _3147;
    float _3159 = fma(_3125, _3153, _3151);
    float _3161 = fma(_3125, _3151, _3153);
    float _3163 = _3133 * _3099;
    float _3165 = _3129 * _3115;
    float _3167 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3139);
    float _3169 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3141);
    float _3171 = _3115 * _3137;
    float _3173 = _3133 * _3137;
    float _3175 = _2833 * _3167;
    float _3177 = _3129 * _3137;
    float _3179 = _3099 * _3137;
    float _3181 = _3155 * _3169;
    float _3183 = -_3163;
    float _3185 = fma(_3125, _3165, _3183);
    float _3187 = -_3165;
    float _3189 = fma(_3125, _3163, _3187);
    float _3191 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3143);
    float _3193 = _3173 * _3181;
    float _3195 = _3159 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3197 = _3159 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3199 = _3159 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3201 = _3157 * _3191;
    float _3203 = -_3181;
    float _3205 = _3125 * _3203;
    float _3207 = fma(_3159, _3175, _3193);
    float _3209 = fma(_3171, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3195);
    float _3211 = fma(_3171, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3197);
    float _3213 = fma(_3171, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3199);
    float _3215 = _3177 * _3181;
    float _3217 = fma(_3171, _3175, _3205);
    float _3219 = fma(_3189, _3201, _3207);
    float _3221 = fma(_3185, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3209);
    float _3223 = fma(_3185, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3211);
    float _3225 = fma(_3185, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3213);
    float _3227 = fma(_3185, _3175, _3215);
    float _3229 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3231 = fma(_3179, _3201, _3217);
    float _3233 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3235 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3237 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3239 = -_3125;
    float _3241 = fma(_3239, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3229);
    float _3243 = fma(_3161, _3201, _3227);
    float _3245 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3247 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3233);
    float _3249 = in.m_93.x;
    float _3251 = in.m_93.y;
    float _3253 = in.m_93.z;
    float _3255 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3257 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3245);
    float _3259 = fma(_3243, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3247);
    bool _3261 = _3141 != 0.0;
    bool _3263 = isnan(_3141);
    bool _3265 = _3261 || _3263;
    bool _3267 = isnan(0.0);
    bool _3269 = _3265 || _3267;
    float _3271 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3255);
    float _3273 = fma(_3243, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3257);
    float _3275 = _3259 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _3277 = _3139 == 0.0;
    bool _3279 = !_3269;
    bool _3281 = _3277 && _3279;
    float _3283 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3285 = _3273 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3287 = _1877 + _3275;
    float _3289 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3291 = _3143 == 0.0;
    bool _3293 = _3291 && _3281;
    float _3295 = _1875 + _3285;
    float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3299 = _3287 + _3297;
    float _3301 = -_3125;
    float _3303 = fma(_3301, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3235);
    float _3305 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3283);
    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3309 = _3295 + _3307;
    float _3311 = _3299 * _3299;
    float _3313 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3289);
    float _3315 = -_3125;
    float _3317 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3237);
    float _3319 = in.m_95.x;
    float _3321 = in.m_95.y;
    float _3323 = in.m_95.z;
    float _3325 = in.m_95.w;
    float _3327 = fma(_3309, _3309, _3311);
    float _3329 = fma(_3177, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3303);
    float _3331 = fma(_3177, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3241);
    float _3333 = _3311;
    float _3335 = _3241;
    float _3337 = _3317;
    if (_3293)
    {
        _2075 = _3249;
    }
    float _3339 = _2075;
    float _3341 = sqrt(_3327);
    float _3343 = _3339;
    if (_3293)
    {
        _3001 = _3251;
    }
    float _3345 = _3001;
    float _3347 = fma(_3177, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3317);
    float _3349 = _3345;
    if (_3293)
    {
        _1521 = _3253;
    }
    float _3351 = _1521;
    float _3353 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3355 = _3351;
    if (_3293)
    {
        _3333 = _3339;
    }
    float _3357 = _3333;
    float _3359 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3271);
    float _3361 = _3357;
    if (_3293)
    {
        _3335 = _3345;
    }
    float _3363 = _3335;
    float _3365 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3353);
    float _3367 = _3363;
    if (_3293)
    {
        _3337 = _3351;
    }
    float _3369 = _3337;
    float _3371 = _3369;
    if (!_3293)
    {
        _3343 = _3249;
    }
    float _3373 = _3343;
    float _3375 = fma(_3243, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3365);
    if (!_3293)
    {
        _3349 = _3251;
    }
    float _3377 = _3349;
    float _3379 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3305);
    if (!_3293)
    {
        _3355 = _3253;
    }
    float _3381 = _3355;
    if (!_3293)
    {
        float _3383 = fma(_3139, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3373);
        _3361 = _3383;
    }
    float _3385 = _3361;
    float _3387 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3313);
    if (!_3293)
    {
        float _3389 = fma(_3141, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3377);
        _3367 = _3389;
    }
    float _3391 = _3367;
    float _3393 = _3331 * _3321;
    float _3395 = _3319;
    if (!_3293)
    {
        float _3397 = fma(_3143, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3381);
        _3371 = _3397;
    }
    float _3399 = _3371;
    bool _3401 = _3341 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3403 = _3375 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3405 = _3347 * _3321;
    float _3407 = fma(_3221, _3319, _3393);
    float _3409 = _3329 * _3321;
    float _3411 = _3323 * _3373;
    float _3413 = _3319 * _3377;
    float _3415 = _1315 + _3403;
    float _3417 = fma(_3225, _3319, _3405);
    float _3419 = fma(_3223, _3319, _3409);
    float _3421 = -_3411;
    float _3423 = fma(_3319, _3381, _3421);
    float _3425 = -_3413;
    float _3427 = fma(_3321, _3373, _3425);
    float _3429 = _3321 * _3381;
    float _3431 = _3403;
    float _3433 = _3413;
    if (!_3401)
    {
        _3431 = _3295;
    }
    float _3435 = _3431;
    float _3437 = _3435;
    if (!_3401)
    {
        _3433 = _3287;
    }
    float _3439 = _3433;
    float _3441 = _3439;
    if (!_3401)
    {
        _3395 = _3415;
    }
    float _3443 = _3395;
    bool _3445 = !_3401;
    float _3447 = _3443;
    if (!_3445)
    {
        float _3449 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3451 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3453 = _3341 + _3451;
        float _3455 = rsqrt(_3327);
        float _3457 = _3453 * _3449;
        float _3459 = _3415 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3461 = _3457 * 0.15915493667125701904296875;
        float _3463 = _3461 * 6.283185482025146484375;
        float _3465 = cos(_3463);
        float _3467 = _3461 * 6.283185482025146484375;
        float _3469 = sin(_3467);
        float _3471 = _3465 + (-1.0);
        float _3473 = _3471 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3475 = fma(_3469, _3459, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3477 = fma(_3415, _3465, _3473);
        float _3479 = _3455 * _3475;
        float _3481 = fma(_3309, _3479, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3483 = fma(_3299, _3479, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3447 = _3477;
        _3437 = _3481;
        _3441 = _3483;
    }
    float _3485 = _3447;
    float _3487 = _3437;
    float _3489 = _3441;
    float _3491 = -_2269;
    float _3493 = _3491 + _3485;
    float _3495 = -_3429;
    float _3497 = fma(_3323, _3377, _3495);
    float _3499 = -_2293;
    float _3501 = _3499 + _3487;
    float _3503 = fma(_3379, _3323, _3407);
    float _3505 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3507 = _3493 + _3505;
    float _3509 = fma(_3359, _3323, _3419);
    float _3511 = fma(_3387, _3323, _3417);
    float _3513 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3515 = _3501 + _3513;
    float _3517 = _3507 * _3507;
    float _3519 = -_2335;
    float _3521 = _3519 + _3489;
    float _3523 = _3423 * _3325;
    float _3525 = _3497 * _3325;
    float _3527 = fma(_3515, _3515, _3517);
    float _3529 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3531 = _3521 + _3529;
    float _3533 = _3427 * _3325;
    float _3535 = _3331 * _3391;
    float _3537 = _3329 * _3391;
    float _3539 = fma(_3531, _3531, _3527);
    float _3541 = _3523 * _3331;
    float _3543 = _3347 * _3391;
    float _3545 = _3523 * _3329;
    float _3547 = _3523 * _3347;
    float _3549 = fma(_3221, _3385, _3535);
    float _3551 = fma(_3223, _3385, _3537);
    float _3553 = fma(_3525, _3221, _3541);
    float _3555 = fma(_3525, _3223, _3545);
    float _3557 = sqrt(_3539);
    float _3559 = fma(_3525, _3225, _3547);
    float _3561 = fma(_3225, _3385, _3543);
    float _3563 = fma(_3379, _3399, _3549);
    float _3565 = fma(_3533, _3379, _3553);
    float _3567 = fma(_3359, _3399, _3551);
    float _3569 = fma(_3533, _3359, _3555);
    float _3571 = fma(_3533, _3387, _3559);
    float _3573 = fma(_3387, _3399, _3561);
    out.m_97.x = _3503;
    out.m_97.y = _3509;
    out.m_97.z = _3511;
    float _3575 = -_2293;
    float _3577 = _1875 + _3575;
    float _3579 = -_2269;
    float _3581 = _3579 + _1315;
    out.m_99.x = _3565;
    out.m_99.y = _3569;
    out.m_99.z = _3571;
    float _3583 = -_2335;
    float _3585 = _1877 + _3583;
    bool _3587 = _3557 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3589 = isnan(_3557);
    bool _3591 = _3587 || _3589;
    bool _3593 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3595 = _3591 || _3593;
    out.m_101.x = _3563;
    out.m_101.y = _3567;
    out.m_101.z = _3573;
    float _3597 = _3559;
    if (!_3595)
    {
        _3597 = 1.0;
    }
    float _3599 = _3597;
    bool _3601 = !_3595;
    float _3603 = _3599;
    if (!_3601)
    {
        bool _3605 = _3557 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3607 = isnan(_3557);
        bool _3609 = _3605 || _3607;
        bool _3611 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3613 = _3609 || _3611;
        if (!_3613)
        {
            float _3615 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3617 = _3557 + _3615;
            float _3619 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3621 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3619;
            float _3623 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3625 = _3623 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3627 = 1.0 / _3621;
            float _3629 = _3617 * _3627;
            float _3631 = fma(_3629, _3625, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3603 = _3631;
            _3633 = true;
        }
        else
        {
            bool _3635 = _3557 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3637 = isnan(_3557);
            bool _3639 = _3635 || _3637;
            bool _3641 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3643 = _3639 || _3641;
            if (!_3643)
            {
                float _3645 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3647 = _3557 + _3645;
                float _3649 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3651 = _3649 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3653 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3655 = _3653 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3657 = 1.0 / _3651;
                float _3659 = _3647 * _3657;
                float _3661 = fma(_3659, _3655, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3603 = _3661;
                _3633 = true;
            }
            else
            {
                _3603 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3633 = false;
    float _3663 = _3603;
    float _3665 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3667 = _3501 + _3665;
    float _3669 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3671 = _3521 + _3669;
    float _3673 = fma(_3667, _3663, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3675 = fma(_3671, _3663, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3677 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _3679 = _3673 + _3677;
    float _3681 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _3683 = _3675 + _3681;
    float _3685 = fma(_3679, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _3687 = fma(_3683, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _10364 = float2(_3685, _3687);
    float _3689 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_10364, float2(0.0), isnan(_10364)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_10364, float2(0.0), isnan(_10364)), level(0.0)).x;
    float _3691 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3693 = _3493 + _3691;
    float _3695 = -_2711;
    float _3697 = _3695 + _3585;
    float _3699 = -_3577;
    float _3701 = _3699 + _3673;
    float _3703 = -_3585;
    float _3705 = _3703 + _3675;
    float _3707 = fma(_3693, _3663, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3709 = -_2675;
    float _3711 = _3709 + _3577;
    float _3713 = -_3581;
    float _3715 = _3713 + _3707;
    float _3717 = _3715 * _3715;
    float _3719 = fma(_3701, _3701, _3717);
    float _3721 = fma(_3705, _3705, _3719);
    float _3723 = sqrt(_3721);
    bool _3725 = _3723 > 0.0;
    bool _3727 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3729 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3731 = _3727 || _3729;
    bool _3733 = isnan(0.5);
    bool _3735 = _3731 || _3733;
    float _3737 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _3739 = _3707;
    float _3741 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _3743 = _3711;
    if (!_3725)
    {
        _3737 = _3675;
    }
    float _3745 = _3737;
    float _3747 = fma(_3689, 100.0, _3581);
    float _3749 = -_2671;
    float _3751 = _3749 + _3747;
    float _3753 = _3751 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3755 = fma(_3711, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3753);
    float _3757 = fma(_3697, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3755);
    float _3759 = _3757 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3761 = _3751 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3763 = 1.0 / _3759;
    float _3765 = fma(_3711, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3761);
    float _3767 = fma(_3697, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3765);
    float _3769 = _3767 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3771 = _3769 + _3759;
    float _3773 = fma(_3689, 100.0, _3707);
    float _3775 = _3771 * _3763;
    float _3777 = _3775 * 0.5;
    float _3779 = _3745;
    float _3781 = _3747;
    if (!_3725)
    {
        _3739 = _3773;
    }
    float _3783 = _3739;
    float _3785 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3787 = fma(_3777, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3785);
    float _3789 = 1.0 / _3787;
    bool _3791 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3793 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3795 = _3791 || _3793;
    bool _3797 = isnan(0.5);
    bool _3799 = _3795 || _3797;
    float _3801 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _3803 = _3783;
    float _3805 = _3787;
    if (!_3725)
    {
        _3801 = _3673;
    }
    float _3807 = _3801;
    bool _3809 = !_3725;
    float _3811 = _3807;
    float _3813 = _3807;
    if (!_3809)
    {
        float _3815 = _232 * _232;
        float _3817 = fma(_230, _230, _3815);
        float _3819 = fma(_234, _234, _3817);
        float _3821 = rsqrt(_3721);
        float _3823 = sqrt(_3819);
        float _3825 = _3701 * _3821;
        float _3827 = _3715 * _3821;
        float _3829 = _3705 * _3821;
        bool _3831 = _3823 > 0.0;
        float _3833 = _3823;
        float _3835 = _3821;
        _3805 = _3819;
        if (!_3831)
        {
            _3811 = _3673;
        }
        float _3837 = _3811;
        _3813 = _3837;
        if (!_3831)
        {
            _3833 = _3773;
        }
        float _3839 = _3833;
        _3803 = _3839;
        if (!_3831)
        {
            _3835 = _3675;
        }
        float _3841 = _3835;
        bool _3843 = !_3831;
        _3779 = _3841;
        if (!_3843)
        {
            float _3845 = rsqrt(_3819);
            float _3847 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3849 = _232 * _3845;
            float _3851 = _230 * _3845;
            float _3853 = _3827 * _3849;
            float _3855 = _234 * _3845;
            float _3857 = fma(_3825, _3851, _3853);
            float _3859 = _3847 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3861 = fma(_3829, _3855, _3857);
            float _3863 = _3861 * _3859;
            float _3865 = fma(_230, _3863, _3673);
            float _3867 = fma(_232, _3863, _3773);
            float _3869 = fma(_234, _3863, _3675);
            _3803 = _3867;
            _3813 = _3865;
            _3779 = _3869;
            _3805 = _3845;
        }
    }
    float _3871 = _3803;
    float _3873 = _3813;
    float _3875 = _3779;
    float _3877 = _3805;
    float _3879 = -_2671;
    float _3881 = _3879 + _3871;
    float _3883 = -_2675;
    float _3885 = _3883 + _3873;
    float _3887 = -_2711;
    float _3889 = _3887 + _3875;
    float _3891 = _3873;
    float _3893 = _3881;
    float _3895 = _3885;
    float _3897 = _3889;
    float _3899 = _3877;
    if (_3799)
    {
        _3003 = 1.0;
    }
    float _3901 = _3003;
    float _3903 = _3901;
    if (!_3735)
    {
        float _3905 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3907 = _3751 + _3905;
        float _3909 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3911 = _3711 + _3909;
        float _3913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3915 = -_3585;
        float _3917 = _3915 + _3875;
        float _3919 = _3907 * _3907;
        float _3921 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3923 = _3697 + _3921;
        float _3925 = -_3577;
        float _3927 = _3925 + _3873;
        float _3929 = fma(_3911, _3911, _3919);
        float _3931 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3933 = fma(_3923, _3923, _3929);
        float _3935 = sqrt(_3933);
        float _3937 = 1.0 / _2805;
        float _3939 = precise::min(_3935, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3941 = _3939 * _3913;
        float _3943 = _3931 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3945 = -_3747;
        float _3947 = _3945 + _3871;
        float _3949 = _3941 * _3937;
        float _3951 = _3943 * _3949;
        float _3953 = _3917 * _3949;
        float _3955 = fma(_3927, _3951, _3711);
        float _3957 = fma(_3947, _3951, _3751);
        float _3959 = fma(_3943, _3953, _3697);
        _3891 = _3927;
        _3893 = _3957;
        _3895 = _3955;
        _3897 = _3959;
        _3899 = _3941;
    }
    float _3961 = _3891;
    float _3963 = _3893;
    float _3965 = _3895;
    float _3967 = _3897;
    float _3969 = _3899;
    float _3971 = _3961;
    float _3973 = _3969;
    if (_3799)
    {
        _3781 = 1.0;
    }
    float _3975 = _3781;
    float _3977 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3979 = _3789 * _3977;
    float _3981 = _3975;
    if (!_3799)
    {
        float _3983 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3985 = _3983 * 0.15915493667125701904296875;
        float _3987 = _3985 * 6.283185482025146484375;
        float _3989 = cos(_3987);
        float _3991 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3993 = _3991 * 0.15915493667125701904296875;
        float _3995 = _3985 * 6.283185482025146484375;
        float _3997 = sin(_3995);
        float _3999 = 1.0 / _3989;
        float _4001 = _3993 * 6.283185482025146484375;
        float _4003 = cos(_4001);
        float _4005 = _3997 * _3999;
        float _4007 = _3993 * 6.283185482025146484375;
        float _4009 = sin(_4007);
        float _4011 = _4003 * _4005;
        float _4013 = 1.0 / _4011;
        float _4015 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4017 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4015;
        float _4019 = 1.0 / _4017;
        float _4021 = _4009 * _4013;
        float _4023 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4025 = fma(_3979, _4021, _4023);
        float _4027 = _4025 * _4019;
        float _4029 = precise::clamp(_4027, 0.0, 1.0);
        _3971 = _4019;
        _3903 = _4029;
    }
    float _4031 = _3971;
    float _4033 = _3903;
    float _4035 = _4031;
    if (!_3799)
    {
        float _4037 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4039 = _4037 * 0.15915493667125701904296875;
        float _4041 = _4039 * 6.283185482025146484375;
        float _4043 = cos(_4041);
        float _4045 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4047 = _4045 * 0.15915493667125701904296875;
        float _4049 = _4039 * 6.283185482025146484375;
        float _4051 = sin(_4049);
        float _4053 = 1.0 / _4043;
        float _4055 = _4047 * 6.283185482025146484375;
        float _4057 = cos(_4055);
        float _4059 = _4051 * _4053;
        float _4061 = _4047 * 6.283185482025146484375;
        float _4063 = sin(_4061);
        float _4065 = _4057 * _4059;
        float _4067 = 1.0 / _4065;
        float _4069 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4071 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _4069;
        float _4073 = 1.0 / _4071;
        float _4075 = _4063 * _4067;
        float _4077 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4079 = fma(_3979, _4075, _4077);
        float _4081 = _4079 * _4073;
        float _4083 = precise::clamp(_4081, 0.0, 1.0);
        float _4085 = -_4083;
        float _4087 = _4085 + 1.0;
        _4035 = _4053;
        _3981 = _4087;
    }
    float _4089 = _4035;
    float _4091 = _3981;
    float _4093 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4095 = _3963 + _4093;
    float _4097 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4099 = _3965 + _4097;
    float _4101 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4103 = _3967 + _4101;
    float _4105 = _4095 * _4095;
    float _4107 = fma(_4099, _4099, _4105);
    float _4109 = fma(_4103, _4103, _4107);
    float _4111 = rsqrt(_4109);
    float _4113 = _4111 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4115 = _4099 * _4113;
    float _4117 = _4103 * _4113;
    float _4119 = _4115 * _4115;
    float _4121 = _4117 * _4117;
    float _4123 = _4119 + _4121;
    float _4125 = sqrt(_4123);
    bool _4127 = _4125 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4129 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4131 = _4125 + _4129;
    float _4133 = _4111;
    float _4135 = _4089;
    float _4137 = _4131;
    float _4139 = _4095;
    if (_4127)
    {
        float _4141 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4133 = _4141;
    }
    float _4143 = _4133;
    if (_4127)
    {
        float _4145 = rsqrt(_4123);
        _4135 = _4145;
    }
    float _4147 = _4135;
    float _4149 = _4147;
    if (_4127)
    {
        float _4151 = _4131 * _4143;
        _4137 = _4151;
    }
    float _4153 = _4137;
    if (_4127)
    {
        float _4155 = _4153 * 0.15915493667125701904296875;
        _3973 = _4155;
    }
    float _4157 = _3973;
    float _4159 = _4103;
    if (_4127)
    {
        float _4161 = _4157 * 6.283185482025146484375;
        float _4163 = sin(_4161);
        _4159 = _4163;
    }
    float _4165 = _4159;
    float _4167 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4169 = precise::max(0.0, _4167);
    float _4171 = _4143;
    float _4173 = _4169;
    if (_4127)
    {
        float _4175 = _4157 * 6.283185482025146484375;
        float _4177 = cos(_4175);
        _4171 = _4177;
    }
    float _4179 = _4171;
    float _4181 = -_4113;
    float _4183 = -_4169;
    float _4185 = fma(_4095, _4181, _4183);
    if (_4127)
    {
        float _4187 = _4185 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4139 = _4187;
    }
    float _4189 = _4139;
    float _4191 = _4189;
    float _4193 = _4165;
    float _4195 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4127)
    {
        float _4197 = fma(_4165, _4189, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4191 = _4197;
    }
    float _4199 = _4191;
    float _4201 = _4199;
    if (!_4127)
    {
        _4193 = _4185;
    }
    float _4203 = _4193;
    float _4205 = _4203;
    float _4207 = _4179;
    if (_4127)
    {
        float _4209 = _4179 + (-1.0);
        _4173 = _4209;
    }
    float _4211 = _4173;
    float _4213 = _4211;
    if (_4127)
    {
        float _4215 = _4147 * _4199;
        _3741 = _4215;
    }
    float _4217 = _3741;
    if (!_4127)
    {
        _4149 = _4115;
    }
    float _4219 = _4149;
    float _4221 = _4219;
    if (_4127)
    {
        float _4223 = _4211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4213 = _4223;
    }
    float _4225 = _4213;
    if (_4127)
    {
        float _4227 = _4115 * _4217;
        _4221 = _4227;
    }
    float _4229 = _4221;
    if (!_4127)
    {
        _4201 = _4117;
    }
    float _4231 = _4201;
    float _4233 = _4231;
    if (_4127)
    {
        float _4235 = _4117 * _4217;
        _4233 = _4235;
    }
    float _4237 = _4233;
    if (_4127)
    {
        float _4239 = fma(_4185, _4179, _4225);
        _4205 = _4239;
    }
    float _4241 = _4205;
    if (!_4127)
    {
        _4207 = _4119;
    }
    float _4243 = _4207;
    float _4245 = sqrt(_4109);
    float _4247 = _4243;
    if (_4127)
    {
        float _4249 = _4229 * _4229;
        _4247 = _4249;
    }
    float _4251 = _4247;
    float _4253 = fma(_3711, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_4127)
    {
        _4195 = _4121;
    }
    float _4255 = _4195;
    float _4257 = _4255;
    if (_4127)
    {
        float _4259 = _4237 * _4237;
        _4257 = _4259;
    }
    float _4261 = _4257;
    float _4263 = fma(_4241, _4241, _4251);
    float _4265 = _3963 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4267 = _4263 + _4261;
    float _4269 = floor(_4253);
    float _4271 = fma(_3965, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4265);
    float _4273 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4275 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4277 = fma(_4245, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4275);
    float _4279 = precise::clamp(_4277, 0.0, 1.0);
    float _4281 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4271);
    float _4283 = fma(_3697, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4285 = _3963 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4287 = rsqrt(_4267);
    float _4289 = _4281 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4291 = -_4279;
    float _4293 = _4291 + 1.0;
    float _4295 = fma(_3965, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4285);
    float _4297 = _4289 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4299 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4295);
    float _4301 = abs(_4293);
    float _4303 = log2(_4301);
    float _4305 = _3963 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4307 = -_4297;
    float _4309 = fma(_4307, _4273, 1.0);
    float _4311 = _3963 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4313 = fma(_3965, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4305);
    float _4315 = fma(_3965, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4311);
    float _4317 = _4287 * _4229;
    float _4319 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4313);
    float _4321 = _4287 * _4237;
    float _4323 = _4287 * _4241;
    float _4325 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4327 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4315);
    float _4329 = _4319 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4331 = floor(_4283);
    float _4333 = -_4325;
    float _4335 = fma(_4323, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4333);
    float _4337 = _4327 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4339 = _4329 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4341 = _4303 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4343 = -_4321;
    float _4345 = fma(_4343, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4335);
    float _4347 = _4299 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4349 = fma(_4337, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4339);
    float _4351 = -_4269;
    float _4353 = _4253 + _4351;
    float _4355 = fma(_4345, -0.5, 0.5);
    float _4357 = exp2(_4341);
    float _4359 = fma(_4289, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4349);
    float _4361 = _4329 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4363 = fma(_4345, 0.5, 0.5);
    float _4365 = _4323 + 1.0;
    float _4367 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4359);
    float _4369 = _4329 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4371 = fma(_4337, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4361);
    float _4373 = log2(_4309);
    float _4375 = -_4331;
    float _4377 = _4283 + _4375;
    float _4379 = fma(_4337, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4369);
    float _4381 = fma(_4363, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4383 = fma(_4289, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4371);
    float _4385 = fma(_4289, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4379);
    float _4387 = fma(_4363, _4381, -0.212114393711090087890625);
    float _4389 = 1.0 / _4367;
    float _4391 = -_4323;
    float _4393 = fma(_4357, _4365, _4391);
    float _4395 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4385);
    float _4397 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4383);
    float _4399 = fma(_4363, _4387, 1.570728778839111328125);
    float _4401 = sqrt(_4355);
    float _4403 = _4373 * 0.693147182464599609375;
    float2 _11476 = float2(_4353, _4377);
    float _4405 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11476, float2(0.0), isnan(_11476)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11476, float2(0.0), isnan(_11476)), level(0.0)).x;
    float _4407 = fma(_4393, 0.5, 0.5);
    float _4409 = _4403 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4411 = _4395 * _4389;
    float _4413 = _4397 * _4389;
    float _4415 = fma(_4411, 0.5, 0.5);
    float _4417 = fma(_4413, -0.5, 0.5);
    float _4419 = _4401 * 0.636619746685028076171875;
    float3 _11504 = float3(_4415, _4417, _4409);
    float _4421 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11504, float3(0.0), isnan(_11504)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11504, float3(0.0), isnan(_11504)), level(0.0)).x;
    float _4423 = -_4399;
    float _4425 = fma(_4419, _4423, 1.0);
    float3 _11520 = float3(_4415, _4417, _4409);
    float4 _4428 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11520, float3(0.0), isnan(_11520)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11520, float3(0.0), isnan(_11520)), level(0.0)).xyzw;
    float _4430 = _4428.x;
    float _4432 = _4428.y;
    float _4434 = _4428.z;
    float _4436 = _4428.w;
    float2 _11536 = float2(_4425, _4407);
    float3 _4440 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11536, float2(0.0), isnan(_11536)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11536, float2(0.0), isnan(_11536)), level(0.0)).xyz;
    float _4442 = _4440.x;
    float _4444 = _4440.y;
    float _4446 = _4440.z;
    float _4448 = abs(_3979);
    float _4450 = log2(_4448);
    float _4452 = _4329 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_103.x = _3965;
    out.m_103.y = _3963;
    out.m_103.z = _3967;
    float _4454 = fma(_4337, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4452);
    bool _4456 = _4245 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4458 = isnan(_4245);
    bool _4460 = _4456 || _4458;
    bool _4462 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4464 = _4460 || _4462;
    float _4466 = in.m_77.x;
    float _4468 = fma(_4289, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4454);
    float _4470 = _4303 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4472 = _3979 <= 8000.0;
    bool _4474 = isnan(_3979);
    bool _4476 = _4472 || _4474;
    bool _4478 = isnan(8000.0);
    bool _4480 = _4476 || _4478;
    float _4482 = float(_4480);
    out.m_105.x = _3711;
    out.m_105.y = _3751;
    out.m_105.z = _3697;
    float _4484 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4468);
    float _4486 = _4367 * 0.5;
    float _4488 = _4450 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4490 = exp2(_4470);
    out.gl_Position.x = _4395;
    out.gl_Position.y = _4397;
    out.gl_Position.z = _4484;
    out.gl_Position.w = _4367;
    float _4492 = _4397;
    float _4494 = _4484;
    float _4496 = _4367;
    if (!_4464)
    {
        _3743 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4498 = _3743;
    float _4500 = exp2(_4488);
    float _4502 = fma(_4397, -0.5, _4486);
    float _4504 = _4498;
    float _4506 = _4498;
    if (!_4464)
    {
        _4492 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4508 = _4492;
    float _4510 = -_4490;
    float _4512 = _4510 + 1.0;
    float _4514 = _4512 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4516 = fma(_4500, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4518 = precise::clamp(_4516, 0.0, 1.0);
    float _4520 = _4484 + _4367;
    float _4522 = _4508;
    float _4524 = _4508;
    if (!_4464)
    {
        _4494 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4526 = _4494;
    float _4528 = fma(_4518, -2.0, 3.0);
    float _4530 = _4518 * _4518;
    float _4532 = _4520 * 0.5;
    float _4534 = _4530 * _4528;
    float _4536 = -_4534;
    float _4538 = _4536 + 1.0;
    float _4540 = fma(_4538, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4534);
    float _4542 = _4395 + _4367;
    float _4544 = -_4514;
    float _4546 = _4544 + 1.0;
    float _4548 = _4482 * _4540;
    float _4550 = _4542 * 0.5;
    float _4552 = _4546;
    float _4554 = _4526;
    float _4556 = _4526;
    if (!_4464)
    {
        _4496 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4558 = _4496;
    float _4560 = _4548 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_107.x = _4550;
    out.m_107.y = _4502;
    out.m_107.z = _4532;
    out.m_107.w = _4367;
    float _4562 = -_4405;
    float _4564 = _4562 + 1.0;
    float _4566 = _4564 * _4560;
    float _4568 = precise::clamp(_4566, 0.0, 1.0);
    float _4570 = -_4568;
    float _4572 = fma(_4570, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4574 = _4033 * _4091;
    float _4576 = _4572 * _4466;
    float _4578 = _4574 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4580 = _4574;
    float _4582 = _4558;
    float _4584 = _4558;
    if (!_4464)
    {
        _4580 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4586 = _4580;
    float _4588 = _4514 * _4421;
    float _4590 = _4576 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4592 = _4436 * _4588;
    float _4594 = _4436 * _4546;
    out.m_109.x = _4590;
    float _4596 = _4586;
    float _4598 = _4586;
    if (!_4464)
    {
        _4552 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4600 = _4552;
    float _4602 = _4446 * _4588;
    float _4604 = fma(_4442, _4592, _4430);
    float _4606 = fma(_4444, _4592, _4432);
    float _4608 = fma(_4436, _4602, _4434);
    out.m_111.x = _4604;
    out.m_111.y = _4606;
    out.m_111.z = _4608;
    out.m_111.w = _4594;
    bool _4610 = !_4464;
    float _4612 = _4600;
    float _4614 = _4600;
    if (!_4610)
    {
        bool _4616 = _4245 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4618 = isnan(_4245);
        bool _4620 = _4616 || _4618;
        bool _4622 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4624 = _4620 || _4622;
        if (!_4624)
        {
            float _4626 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4628 = _4245 + _4626;
            float _4630 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4632 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4630;
            float _4634 = 1.0 / _4632;
            float _4636 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4638 = _4636 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4640 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4642 = _4640 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4644 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4646 = _4644 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4648 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4650 = _4648 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4652 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4654 = _4652 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4656 = _4628 * _4634;
            float _4658 = precise::clamp(_4656, 0.0, 1.0);
            float _4660 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4662 = _4660 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4664 = fma(_4658, _4638, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4666 = fma(_4658, _4662, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4668 = fma(_4658, _4642, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4670 = fma(_4658, _4646, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4672 = fma(_4658, _4650, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4674 = fma(_4658, _4654, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4584 = _4666;
            _4614 = _4672;
            _4506 = _4664;
            _4524 = _4670;
            _4556 = _4668;
            _4598 = _4674;
            _4676 = true;
        }
        else
        {
            bool _4678 = _4245 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4680 = isnan(_4245);
            bool _4682 = _4678 || _4680;
            bool _4684 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4686 = _4682 || _4684;
            if (!_4686)
            {
                _4504 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4688 = _4504;
            _4506 = _4688;
            if (!_4686)
            {
                _4582 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4690 = _4582;
            _4584 = _4690;
            if (!_4686)
            {
                _4554 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4692 = _4554;
            _4556 = _4692;
            if (!_4686)
            {
                _4522 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4694 = _4522;
            _4524 = _4694;
            if (!_4686)
            {
                _4612 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4696 = _4612;
            _4614 = _4696;
            if (!_4686)
            {
                _4596 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4698 = _4596;
            bool _4700 = !_4686;
            _4598 = _4698;
            if (!_4700)
            {
                bool _4702 = _4245 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4704 = isnan(_4245);
                bool _4706 = _4702 || _4704;
                bool _4708 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4710 = _4706 || _4708;
                if (!_4710)
                {
                    float _4712 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4714 = _4245 + _4712;
                    float _4716 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4718 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4716;
                    float _4720 = 1.0 / _4718;
                    float _4722 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4724 = _4722 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4726 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4728 = _4726 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4730 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4732 = _4730 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4734 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4736 = _4734 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4738 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4740 = _4738 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4742 = _4714 * _4720;
                    float _4744 = precise::clamp(_4742, 0.0, 1.0);
                    float _4746 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4748 = _4746 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4750 = fma(_4744, _4724, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4752 = fma(_4744, _4748, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4754 = fma(_4744, _4728, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4756 = fma(_4744, _4732, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4758 = fma(_4744, _4736, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4760 = fma(_4744, _4740, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4584 = _4752;
                    _4614 = _4758;
                    _4506 = _4750;
                    _4524 = _4756;
                    _4556 = _4754;
                    _4598 = _4760;
                    _4676 = true;
                }
                else
                {
                    _4584 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4614 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4506 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4524 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4556 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4598 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4676 = false;
    float _4762 = _4584;
    float _4764 = _4614;
    float _4766 = _4506;
    float _4768 = _4524;
    float _4770 = _4556;
    float _4772 = _4598;
    float _4774 = fma(_3567, -0.5, 0.5);
    float _4776 = precise::clamp(_4774, 0.0, 1.0);
    float _4778 = -_4762;
    float _4780 = _4778 + _4764;
    float _4782 = _4578 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4784 = -_4766;
    float _4786 = _4784 + _4768;
    out.m_113.x = 0.0;
    float _4788 = fma(_4776, _4780, _4762);
    float _4790 = fma(_4776, _4786, _4766);
    out.m_53.x = _4782;
    float _4792 = -_4770;
    float _4794 = _4792 + _4772;
    float _4796 = _4788 * 0.586610972881317138671875;
    bool _4798 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4800 = fma(_4776, _4794, _4770);
    float _4802 = fma(_4790, 0.298911988735198974609375, _4796);
    bool _4804 = _4033 > 0.0;
    bool _4806 = isnan(_4033);
    bool _4808 = _4804 || _4806;
    bool _4810 = isnan(0.0);
    bool _4812 = _4808 || _4810;
    float _4814 = fma(_4800, 0.114477999508380889892578125, _4802);
    bool _4816 = _4091 <= 0.0;
    bool _4818 = !_4812;
    bool _4820 = _4816 || _4818;
    float _4822 = -_4814;
    float _4824 = _4790 + _4822;
    float _4826 = -_4814;
    float _4828 = _4788 + _4826;
    float _4830 = -_4814;
    float _4832 = _4800 + _4830;
    float _4834 = fma(_4824, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4814);
    float _4836 = fma(_4828, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4814);
    float _4838 = fma(_4832, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4814);
    bool _4840 = !_4798;
    if (!_4840)
    {
        float _4842 = -_3963;
        float _4844 = _4842 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4846 = -_3965;
        float _4848 = _4846 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4850 = -_3967;
        float _4852 = _4850 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4854 = _4844 * _4844;
        float _4856 = fma(_4848, _4848, _4854);
        float _4858 = fma(_4852, _4852, _4856);
        float _4860 = sqrt(_4858);
        float _4862 = rsqrt(_4858);
        float _4864 = -_4860;
        float _4866 = _4864 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4868 = _4866 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4870 = precise::clamp(_4868, 0.0, 1.0);
        float _4872 = _4848 * _4862;
        float _4874 = _4844 * _4862;
        float _4876 = abs(_4870);
        float _4878 = log2(_4876);
        float _4880 = _4852 * _4862;
        float _4882 = _4872 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4884 = _3567 * _4874;
        float _4886 = -_4874;
        float _4888 = -_4882;
        float _4890 = fma(_4886, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4888);
        float _4892 = fma(_3563, _4872, _4884);
        float _4894 = -_4880;
        float _4896 = fma(_4894, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4890);
        float _4898 = fma(_3573, _4880, _4892);
        float _4900 = precise::clamp(_4898, 0.0, 1.0);
        float _4902 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4904 = _4896 + _4902;
        float _4906 = _4878 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4908 = _4904 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4910 = precise::clamp(_4908, 0.0, 1.0);
        float _4912 = exp2(_4906);
        float _4914 = _4912 * _4910;
        float _4916 = _4900 * _4914;
        float _4918 = _4916 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4920 = _4916 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4922 = _4916 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _4918;
        out.m_113.y = _4920;
        out.m_113.z = _4922;
    }
    out.m_81.x = _4834;
    out.m_81.y = _4836;
    out.m_81.z = _4838;
    if (!_4820)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _4924 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4924;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4676 = false;
    bool _3633 = false;
    bool _632 = false;
    bool _528 = false;
    bool _386 = false;
    bool _260 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_50.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_53.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4981 = as_type<float>(_148);
        out.gl_Position.z = _4981;
    }
    if (!_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_55.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_53.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5051 = as_type<float>(_186);
        out.gl_Position.z = _5051;
    }
    if (_178)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _188 = in.m_57.x;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = in.m_57.y;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = in.m_61.x;
    float _202 = in.m_61.y;
    float _204 = in.m_61.z;
    float _206 = in.m_63.x;
    float _208 = in.m_63.y;
    float _210 = in.m_63.z;
    float _212 = in.m_65.x;
    float _214 = in.m_65.y;
    float _216 = in.m_65.z;
    out.m_67.x = _188;
    out.m_67.y = _192;
    float _218 = _196 * _202;
    float _220 = _196 * _208;
    float _222 = fma(_194, _200, _218);
    float _224 = _196 * _214;
    float _226 = fma(_194, _206, _220);
    float _228 = fma(_194, _212, _224);
    float _230 = fma(_198, _204, _222);
    float _232 = fma(_198, _210, _226);
    float _234 = fma(_198, _216, _228);
    bool _236 = !_190;
    float _238 = _192;
    float _240 = _188;
    float _258;
    if (!_236)
    {
        float _242 = in.m_69.x;
        float _244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _246 = _242 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _248 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _250 = _248 * _244;
        float _252 = floor(_250);
        float _254 = -_252;
        float _256 = _250 + _254;
        _258 = _256;
        _260 = true;
    }
    else
    {
        float _262 = float(_132);
        float _264 = 1.0 / _262;
        float _266 = _166 * _264;
        _258 = _266;
    }
    _260 = false;
    float _268 = _258;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = _268 + _270;
    bool _274 = _268 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _276 = isnan(_268);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _286;
    float _290 = -_284;
    float _292 = _290 + 1.0;
    bool _294 = _268 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _296 = isnan(_268);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = 1.0 / _288;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _312;
    bool _316 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _318 = _272 * _306;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = in.m_71.x;
    float _326 = in.m_71.y;
    float _328 = in.m_71.z;
    float _330 = _304 * _292;
    float _332 = fma(_310, _318, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _334 = fma(_322, _318, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _336 = fma(_314, _318, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _338 = -_304;
    float _340 = _338 + 1.0;
    float _342 = _332 * _330;
    float _344 = _334 * _330;
    float _346 = _336 * _330;
    float _348 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].x, _342);
    float _350 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].y, _344);
    float _352 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].z, _346);
    float _354 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[144].x, _348);
    float _356 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[144].y, _350);
    float _358 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[144].z, _352);
    float _360 = _354 * _324;
    float _362 = _356 * _326;
    float _364 = _358 * _328;
    bool _366 = !_316;
    float _384;
    if (!_366)
    {
        float _368 = in.m_69.x;
        float _370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _372 = _368 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _374 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _376 = _374 * _370;
        float _378 = floor(_376);
        float _380 = -_378;
        float _382 = _376 + _380;
        _384 = _382;
        _386 = true;
    }
    else
    {
        float _388 = float(_132);
        float _390 = 1.0 / _388;
        float _392 = _166 * _390;
        _384 = _392;
    }
    _386 = false;
    float _394 = _384;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _398 = _394 + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _404 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _406 = isnan(_394);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _420 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _422 = isnan(_394);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _432;
    bool _436 = _394 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _438 = isnan(_394);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = 1.0 / _402;
    float _450 = -_414;
    float _452 = _450 + 1.0;
    bool _454 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _456 = 1.0 / _418;
    float _458 = _434 * _448;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _464 = -_446;
    float _466 = _464 + 1.0;
    float _468 = fma(_458, _398, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _470 = _430 * _452;
    float _472 = -_430;
    float _474 = _472 + 1.0;
    float _476 = _414 * _466;
    float _478 = _462 * _456;
    float _480 = _468 * _470;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _484 = _394 + _482;
    float _486 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[115].x, _480);
    float _488 = fma(_478, _484, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _492 = fma(_488, _476, _486);
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _496 = _490 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _500 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[117].x, _492);
    float _502 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _500 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_73.x = _496;
    out.m_73.y = _502;
    out.m_73.z = _504;
    out.m_73.w = _506;
    bool _508 = !_454;
    float _526;
    if (!_508)
    {
        float _510 = in.m_69.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_132);
        float _532 = 1.0 / _530;
        float _534 = _166 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    bool _538 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _540 = isnan(_536);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _554 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _556 = isnan(_536);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _566;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _572 = _536 + _570;
    float _574 = -_548;
    float _576 = _574 + 1.0;
    bool _578 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _580 = 1.0 / _552;
    float _582 = _564 * _576;
    float _584 = -_564;
    float _586 = _584 + 1.0;
    float _588 = _568 * _580;
    float _590 = fma(_588, _572, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _592 = _590 * _582;
    float _594 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[131].x, _592);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _602 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[132].x, _594);
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _602 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_75.x = _604;
    out.m_75.y = _606;
    out.m_75.z = _608;
    out.m_75.w = _610;
    bool _612 = !_578;
    float _630;
    if (!_612)
    {
        float _614 = in.m_69.x;
        float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _618 = _614 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _620 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[14].x, _166);
        float _622 = _620 * _616;
        float _624 = floor(_622);
        float _626 = -_624;
        float _628 = _622 + _626;
        _630 = _628;
        _632 = true;
    }
    else
    {
        float _634 = float(_132);
        float _636 = 1.0 / _634;
        float _638 = _166 * _636;
        _630 = _638;
    }
    _632 = false;
    float _640 = _630;
    float _642 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _644 = int(_642);
    float _646 = in.m_77.y;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _650 = _640 + _648;
    float _652 = in.m_61.w;
    float _654 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _656 = int(_654);
    bool _658 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _660 = isnan(_640);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _674 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _676 = isnan(_640);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _690 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _692 = isnan(_640);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = in.m_65.w;
    bool _704 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _706 = isnan(_640);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _718 = int(_716);
    float _720 = float(_644);
    float _722 = -_684;
    float _724 = _722 + 1.0;
    float _726 = in.m_63.w;
    float _728 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _730 = 1.0 / _720;
    float _732 = float(uint(_656));
    float _734 = _728 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _736 = ~_656;
    int _738 = _736 + 1;
    int _740 = ~_656;
    int _742 = _740 + 1;
    bool _744 = _656 == 0;
    float _746 = 1.0 / _732;
    float _748 = float(_718);
    int _750 = ~_656;
    int _752 = _750 + 1;
    float _754 = _730 * _166;
    float _756 = 1.0 / _748;
    int _758 = as_type<int>(_746) + (-2);
    float _760 = trunc(_754);
    int _762 = int(_760);
    float _764 = float(_656);
    float _766 = _756 * _166;
    float _768 = 1.0 / _672;
    float _770 = float(uint(_762));
    float _772 = trunc(_766);
    int _774 = int(_772);
    float _776 = as_type<float>(_758) * _770;
    float _778 = trunc(_776);
    float _780 = precise::max(_778, 0.0);
    uint _783 = uint(_780);
    float _785 = 1.0 / _688;
    int _787 = _738 * int(_783);
    int _789 = _787 + _762;
    float _791 = in.m_69.x;
    float _793 = float(uint(_789));
    float _795 = as_type<float>(_758) * _793;
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _799 = _797 != 0;
    float _801 = trunc(_795);
    float _803 = precise::max(_801, 0.0);
    uint _805 = uint(_803);
    float _807 = _754;
    if (_799)
    {
        _807 = 1.0;
    }
    float _809 = _807;
    float _811 = _809;
    if (!_799)
    {
        _811 = 7.345489978790283203125;
    }
    float _813 = _811;
    float _815 = _813 * _791;
    int _817 = int(_783) + int(_805);
    float _819 = float(_762);
    int _821 = _742 * _817;
    int _823 = _821 + _762;
    bool _825 = _819 >= _764;
    bool _827 = isnan(_819);
    bool _829 = _825 || _827;
    bool _831 = isnan(_764);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = floor(_815);
    bool _839 = uint(_823) >= uint(_656);
    bool _841 = !_839;
    int _843 = _841 ? 0 : (-1);
    float _845 = trunc(_835);
    int _847 = int(_845);
    int _849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _851 = _849 != 0;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _855 = _853 != 0;
    int _857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _859 = _857 != 0;
    int _861 = ~_817;
    int _863 = _861 + _843;
    int _865 = _863 + 1;
    float _867 = float(_132);
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _871 = _869 != 0;
    int _873 = _656 * _865;
    int _875 = _873 + _762;
    float _877 = -_837;
    float _879 = _815 + _877;
    bool _881 = !_855;
    int _883 = _881 ? 0 : 1;
    float _885 = 1.0 / _867;
    int _887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _889 = _887 != 0;
    float _891 = _879 * _764;
    bool _893 = !_744;
    int _895 = _893 ? _875 : (-1);
    int _897 = ~_847;
    int _899 = _897 + 1;
    int _901 = _899 + 1;
    int _903 = _656 + (-1);
    float _905 = trunc(_891);
    int _907 = int(_905);
    bool _909 = _656 == 0;
    int _911 = _895 * _901;
    float _913 = _764 * _166;
    int _915 = _847 * _903;
    int _917 = _915 + _911;
    bool _919 = !_871;
    int _921 = _919 ? 0 : 1;
    float _923 = _913 * _885;
    bool _925 = !_851;
    int _927 = _925 ? 0 : 1;
    int _929 = abs(_883);
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _933 = _931 != 0;
    float _935 = trunc(_923);
    int _937 = int(_935);
    bool _939 = !_859;
    int _941 = _939 ? 0 : 1;
    int _943 = _917 * _929;
    int _945 = abs(_927);
    float _947 = in.m_69.w;
    int _949 = abs(_921);
    bool _951 = !_933;
    int _953 = _951 ? 0 : 1;
    int _955 = abs(_941);
    int _957 = _907 * _949;
    int _959 = _957 + _762;
    int _961 = abs(_953);
    int _963 = _937 * _945;
    int _965 = _963 + _943;
    float _967 = float(uint(_774));
    int _969 = _959 * _955;
    int _971 = _969 + _965;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _975 = _973 != 0;
    float _977 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _979 = int(_977);
    bool _981 = _744;
    if (_889)
    {
        bool _983 = _791 > 0.5;
        _981 = _983;
    }
    bool _985 = _981;
    int _987 = _907 * _961;
    int _989 = _987 + _971;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _993 = _991 != 0;
    float _995 = float(uint(_989));
    float _997 = as_type<float>(_758) * _995;
    int _999 = ~_656;
    int _1001 = _999 + 1;
    float _1003 = float(uint(_979));
    float _1005 = trunc(_997);
    float _1007 = precise::max(_1005, 0.0);
    uint _1009 = uint(_1007);
    int _1011 = ~_979;
    int _1013 = _1011 + 1;
    int _1015 = ~_979;
    int _1017 = _1015 + 1;
    float _1019 = float(_979);
    float _1021 = 1.0 / _1003;
    float _1023 = _1019 * _166;
    float _1025 = _1023 * _885;
    int _1027 = _1001 * int(_1009);
    int _1029 = _1027 + _989;
    float _1031 = trunc(_1025);
    int _1033 = int(_1031);
    float _1035 = float(uint(_1029));
    int _1037 = as_type<int>(_1021) + (-2);
    float _1039 = as_type<float>(_758) * _1035;
    float _1041 = in.m_69.y;
    float _1043 = as_type<float>(_1037) * _967;
    float _1045 = trunc(_1039);
    float _1047 = precise::max(_1045, 0.0);
    uint _1049 = uint(_1047);
    float _1051 = in.m_69.z;
    float _1053 = trunc(_1043);
    float _1055 = precise::max(_1053, 0.0);
    uint _1057 = uint(_1055);
    int _1059 = int(_1009) + int(_1049);
    int _1061 = int(_1009);
    float _1063 = _1043;
    int _1065 = _1013;
    if (_889)
    {
        float _1067 = -_188;
        float _1069 = _1067 + 1.0;
        _1061 = as_type<int>(_1069);
    }
    int _1071 = _1061;
    if (!_889)
    {
        _1063 = _188;
    }
    float _1073 = _1063;
    float _1075 = _1073;
    if (_889)
    {
        float _1077 = _985 ? as_type<float>(_1071) : _188;
        _1075 = _1077;
    }
    float _1079 = _1075;
    int _1081 = _752 * _1059;
    int _1083 = _1081 + _989;
    float _1085 = -_192;
    float _1087 = _1085 + 1.0;
    int _1089 = _1013 * int(_1057);
    int _1091 = _1089 + _774;
    float _1093 = _1087;
    if (_975)
    {
        float _1095 = -_188;
        float _1097 = _1095 + 1.0;
        _1065 = as_type<int>(_1097);
    }
    int _1099 = _1065;
    bool _1101 = _1051 > 0.5;
    bool _1103 = uint(_1083) >= uint(_656);
    float _1105 = float(uint(_1091));
    bool _1107 = !_1103;
    int _1109 = _1107 ? 0 : (-1);
    bool _1111 = _1041 > 0.5;
    float _1113 = as_type<float>(_1037) * _1105;
    int _1115 = ~_1059;
    int _1117 = _1115 + _1109;
    int _1119 = _1117 + 1;
    bool _1121 = _947 > 0.5;
    float _1123 = _1105;
    if (!_975)
    {
        _1123 = _188;
    }
    float _1125 = _1123;
    int _1127 = _656 * _1119;
    int _1129 = _1127 + _989;
    int _1131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1133 = _1131 != 0;
    float _1135 = trunc(_1113);
    float _1137 = precise::max(_1135, 0.0);
    uint _1139 = uint(_1137);
    float _1141 = _1125;
    float _1143 = as_type<float>(_1129);
    if (_975)
    {
        float _1145 = _1101 ? as_type<float>(_1099) : _188;
        _1141 = _1145;
    }
    float _1147 = _1141;
    int _1149 = _1111 ? as_type<int>(_1087) : as_type<int>(_192);
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1153 = _1151 != 0;
    int _1155 = _1121 ? as_type<int>(_1087) : as_type<int>(_192);
    bool _1157 = !_909;
    int _1159 = _1157 ? _1129 : (-1);
    int _1161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1163 = _1161 != 0;
    float _1165 = _1153 ? as_type<float>(_1155) : _192;
    int _1167 = _1159 & 3;
    bool _1169 = _1167 != 0;
    float _1171 = _1163 ? as_type<float>(_1149) : _192;
    bool _1173 = uint(_1167) > 1u;
    if (_1133)
    {
        float _1175 = _1101 ? _1087 : _192;
        _238 = _1175;
    }
    float _1177 = _238;
    int _1179 = _1159 & 3;
    bool _1181 = _1179 != 0;
    if (_993)
    {
        _1093 = _791;
    }
    float _1183 = _1093;
    float _1185 = _1183;
    if (_993)
    {
        _1143 = 1.0;
    }
    float _1187 = _1143;
    float _1189 = _1187;
    if (!_993)
    {
        _1185 = _1041;
    }
    float _1191 = _1185;
    if (!_993)
    {
        _1189 = 1.2345600128173828125;
    }
    float _1193 = _1189;
    int _1195 = _1181 ? 0 : 1;
    int _1197 = int(_1057) + int(_1139);
    float _1199 = _1191 * _1193;
    bool _1201 = _1167 != 3;
    float _1203 = in.m_50.x;
    float _1205 = in.m_50.y;
    int _1207 = ~_1195;
    int _1209 = _1207 + 1;
    int _1211 = _1209 + 1;
    int _1213 = _1017 * _1197;
    int _1215 = _1213 + _774;
    bool _1217 = uint(_1167) >= 2u;
    float _1219 = floor(_1199);
    int _1221 = _1211;
    if (!_1173)
    {
        int _1223 = ~_1195;
        int _1225 = _1223 + 1;
        _1221 = _1225;
    }
    int _1227 = _1221;
    float _1229 = float(_774);
    int _1231 = _1217 ? 0 : 1;
    bool _1233 = _1229 >= _1019;
    bool _1235 = isnan(_1229);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan(_1019);
    bool _1241 = _1237 || _1239;
    float _1243 = float(_1241);
    bool _1245 = uint(_1215) >= uint(_979);
    int _1247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1249 = _1247 != 0;
    float _1251 = trunc(_1243);
    int _1253 = int(_1251);
    int _1255 = ~_1231;
    int _1257 = _1255 + 1;
    int _1259 = _1257 + 1;
    int _1261 = _1259;
    if (_1201)
    {
        int _1263 = ~_1231;
        int _1265 = _1263 + 1;
        _1261 = _1265;
    }
    int _1267 = _1261;
    float _1269 = -_1219;
    float _1271 = _1199 + _1269;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1275 = _1273 != 0;
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1279 = _1277 != 0;
    bool _1281 = !_1245;
    int _1283 = _1281 ? 0 : (-1);
    float _1285 = _1019 * _1271;
    bool _1287 = !_1249;
    int _1289 = _1287 ? 0 : 1;
    float _1291 = _214 * _1205;
    int _1293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1295 = _1293 != 0;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1299 = _1297 != 0;
    float _1301 = _208 * _1205;
    int _1303 = ~_1197;
    int _1305 = _1303 + _1283;
    int _1307 = _1305 + 1;
    float _1309 = _202 * _1205;
    bool _1311 = !_1279;
    int _1313 = _1311 ? 0 : 1;
    float _1315 = _1205 + _646;
    bool _1317 = !_1275;
    int _1319 = _1317 ? 0 : 1;
    float _1321 = trunc(_1285);
    int _1323 = int(_1321);
    int _1325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1327 = _1325 != 0;
    float _1329 = fma(_206, _1203, _1301);
    int _1331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1333 = _1331 != 0;
    float _1335 = fma(_212, _1203, _1291);
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1339 = _1337 != 0;
    int _1341 = _979 * _1307;
    int _1343 = _1341 + _774;
    bool _1345 = !_1295;
    int _1347 = _1345 ? 0 : 1;
    bool _1349 = _979 == 0;
    int _1351 = ~_1253;
    int _1353 = _1351 + 1;
    int _1355 = _1353 + 1;
    bool _1357 = !_1349;
    int _1359 = _1357 ? _1343 : (-1);
    int _1361 = _979 + (-1);
    int _1363 = abs(_1313);
    int _1365 = _1355 * _1359;
    float _1367 = fma(_200, _1203, _1309);
    int _1369 = abs(_1289);
    int _1371 = _1253 * _1361;
    int _1373 = _1371 + _1365;
    float _1375 = float(uint(_959));
    int _1377 = abs(_1319);
    int _1379 = _1373 * _1363;
    int _1381 = abs(_1347);
    float _1383 = as_type<float>(_758) * _1375;
    bool _1385 = !_1299;
    int _1387 = _1385 ? 0 : 1;
    float _1389 = trunc(_1383);
    float _1391 = precise::max(_1389, 0.0);
    uint _1393 = uint(_1391);
    int _1395 = _1323 * _1369;
    int _1397 = _1395 + _774;
    int _1399 = ~_656;
    int _1401 = _1399 + 1;
    int _1403 = _1033 * _1377;
    int _1405 = _1403 + _1379;
    float _1407 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1409 = abs(_1387);
    int _1411 = _1397 * _1381;
    int _1413 = _1411 + _1405;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1417 = _1415 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1419 = _1041 > 0.5;
    bool _1421 = _1419 && _1333;
    int _1423 = _1323 * _1409;
    int _1425 = _1423 + _1413;
    float _1427 = _791 * 2.0;
    int _1429 = _1401 * int(_1393);
    int _1431 = _1429 + _959;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1435 = _1433 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1437 = 1.0 / _1417;
    float _1439 = float(uint(_1425));
    float _1441 = _791 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1443 = float(uint(_1431));
    float _1445 = as_type<float>(_1037) * _1439;
    float _1447 = as_type<float>(_758) * _1443;
    float _1449 = floor(_1427);
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1451;
    int _1455 = ~_656;
    int _1457 = _1455 + 1;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1461 = _1459 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1463;
    float _1467 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1469 = _1467 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1471 = _1041 * 2.0;
    float _1473 = trunc(_1445);
    float _1475 = precise::max(_1473, 0.0);
    uint _1477 = uint(_1475);
    float _1479 = _1465 * _768;
    int _1481 = ~_979;
    int _1483 = _1481 + 1;
    float _1485 = _1469 * _1437;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1489 = _1487 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1491 = 1.0 / _1435;
    float _1493 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1495 = abs(_1227);
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1499 = -_1493;
    float _1501 = fma(_1441, 2.0, _1499);
    float _1503 = trunc(_1447);
    float _1505 = precise::max(_1503, 0.0);
    uint _1507 = uint(_1505);
    int _1509 = _1483 * int(_1477);
    int _1511 = _1509 + _1425;
    float _1513 = fma(_1407, -2.0, _1497);
    int _1515 = as_type<int>(_1407);
    int _1517 = as_type<int>(_1441);
    float _1519 = _1447;
    float _1521 = _1501;
    if (_993)
    {
        _1515 = 0;
    }
    int _1523 = _1515;
    int _1525 = _1523;
    if (_993)
    {
        _1517 = 0;
    }
    int _1527 = _1517;
    float _1529 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1513);
    float _1531 = float(uint(_1511));
    float _1533 = _1453 * _1491;
    int _1535 = _1527;
    if (!_1333)
    {
        _1519 = _188;
    }
    float _1537 = _1519;
    float _1539 = _1537;
    if (_1421)
    {
        float _1541 = -_188;
        float _1543 = _1541 + 1.0;
        _240 = _1543;
    }
    float _1545 = _240;
    bool _1547 = _1449 >= 0.0;
    bool _1549 = isnan(_1449);
    bool _1551 = _1547 || _1549;
    bool _1553 = isnan(0.0);
    bool _1555 = _1551 || _1553;
    float _1557 = floor(_1471);
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    if (!_993)
    {
        _1525 = 1;
    }
    int _1563 = _1525;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1567 = _640 + _1565;
    int _1569 = _1555 ? 0 : 1;
    bool _1571 = _1449 > 0.0;
    float _1573 = fma(_1533, _1567, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1575 = int(_1393) + int(_1507);
    float _1577 = 1.0 / _1461;
    float _1579 = as_type<float>(_1037) * _1531;
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1583 = _1581 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1585 = in.m_50.z;
    if (_1333)
    {
        _1539 = _1545;
    }
    float _1587 = _1539;
    int _1589 = _1457 * _1575;
    int _1591 = _1589 + _959;
    int _1593 = ~_1569;
    int _1595 = _1593 + 1;
    int _1597 = _1595 + 1;
    float _1599 = trunc(_1579);
    float _1601 = precise::max(_1599, 0.0);
    uint _1603 = uint(_1601);
    bool _1605 = uint(_1591) >= uint(_656);
    int _1607 = _1597;
    if (!_1571)
    {
        int _1609 = ~_1569;
        int _1611 = _1609 + 1;
        _1607 = _1611;
    }
    int _1613 = _1607;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1617 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1615;
    float _1619 = 1.0 / _1489;
    bool _1621 = !_1605;
    int _1623 = _1621 ? 0 : (-1);
    float _1625 = _1561 * _1577;
    bool _1627 = _1557 > 0.0;
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1631 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1629;
    bool _1633 = _1557 >= 0.0;
    bool _1635 = isnan(_1557);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan(0.0);
    bool _1641 = _1637 || _1639;
    float _1643 = _1051 * 2.0;
    int _1645 = ~_979;
    int _1647 = _1645 + 1;
    float _1649 = 1.0 / _1583;
    int _1651 = int(_1477) + int(_1603);
    float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1655 = _1653 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1657 = _1631 * _785;
    float _1659 = fma(_210, _1585, _1329);
    if (!_993)
    {
        _1535 = 2;
    }
    int _1661 = _1535;
    float _1663 = fma(_216, _1585, _1335);
    float _1665 = _1655 * _1619;
    int _1667 = _1641 ? 0 : 1;
    int _1669 = _1647 * _1651;
    int _1671 = _1669 + _1425;
    float _1673 = floor(_1643);
    float _1675 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1677 = _640 + _1675;
    bool _1679 = !_1169;
    int _1681 = _1679 ? 0 : 1;
    float _1683 = _1659 + _726;
    float _1685 = _1617 * _1649;
    float _1687 = fma(_204, _1585, _1367);
    int _1689 = ~_1667;
    int _1691 = _1689 + 1;
    int _1693 = _1691 + 1;
    float _1695 = _791 + _1041;
    bool _1697 = uint(_1671) >= uint(_979);
    float _1699 = _1041 + _1051;
    int _1701 = _1693;
    if (!_1627)
    {
        int _1703 = ~_1667;
        int _1705 = _1703 + 1;
        _1701 = _1705;
    }
    int _1707 = _1701;
    float _1709 = _1695 + (-1.0);
    bool _1711 = _1167 != 3;
    float _1713 = _1699 + (-1.0);
    bool _1715 = !_1697;
    int _1717 = _1715 ? 0 : (-1);
    float _1719 = fma(_1479, _1677, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1723 = _1721 != 0;
    int _1725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1727 = _1725 != 0;
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1731 = _1729 != 0;
    float _1733 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1735 = fma(_1685, _650, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1737 = !_1711;
    int _1739 = _1737 ? 0 : (-1);
    float _1741 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1743 = _1683 + _1741;
    bool _1745 = !_1727;
    int _1747 = _1745 ? 0 : 1;
    float _1749 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1751 = _1673 > 0.0;
    float _1753 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1755 = _640 + _1753;
    bool _1757 = _1673 >= 0.0;
    bool _1759 = isnan(_1673);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan(0.0);
    bool _1765 = _1761 || _1763;
    bool _1767 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1769 = isnan(_640);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1775 = _1771 || _1773;
    float _1777 = float(_1775);
    float _1779 = fma(_1485, _1755, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1781 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1783 = isnan(_640);
    bool _1785 = _1781 || _1783;
    bool _1787 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1789 = _1785 || _1787;
    float _1791 = float(_1789);
    float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1795 = _640 + _1793;
    bool _1797 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1799 = isnan(_640);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1805 = _1801 || _1803;
    float _1807 = float(_1805);
    float _1809 = -_1777;
    float _1811 = _1809 + 1.0;
    int _1813 = _1765 ? 0 : 1;
    float _1815 = -_1791;
    float _1817 = _1815 + 1.0;
    float _1819 = fma(_1625, _1795, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1821 = _1791 * _1811;
    float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1825 = _640 + _1823;
    bool _1827 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1829 = isnan(_640);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1835 = _1831 || _1833;
    float _1837 = float(_1835);
    float _1839 = _668 * _1817;
    float _1841 = -_668;
    float _1843 = _1841 + 1.0;
    float _1845 = fma(_1657, _1825, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1849 = _1661 != 2;
    float _1851 = _1837 * _1843;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1855 = _640 + _1853;
    bool _1857 = !_1723;
    int _1859 = _1857 ? 0 : 1;
    float _1861 = -_1837;
    float _1863 = _1861 + 1.0;
    bool _1865 = _1563 != 1;
    float _1867 = fma(_1665, _1855, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1869 = _700 * _724;
    float _1871 = -_700;
    float _1873 = _1871 + 1.0;
    float _1875 = _1687 + _652;
    float _1877 = _1663 + _702;
    bool _1879 = !_1731;
    int _1881 = _1879 ? 0 : 1;
    float _1883 = _714 * _1873;
    float _1885 = -_714;
    float _1887 = _1885 + 1.0;
    int _1889 = abs(_1747);
    float _1891 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1893 = _1807 * _1887;
    float _1895 = -_1807;
    float _1897 = _1895 + 1.0;
    float _1899 = fma(_1891, _1177, -0.5);
    float _1901 = _1891;
    if (_1849)
    {
        _1901 = _791;
    }
    float _1903 = _1901;
    float _1905 = _1719 * _1893;
    int _1907 = abs(_1881);
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1911 = _1903;
    if (!_1849)
    {
        _1911 = _1051;
    }
    float _1913 = _1911;
    float _1915 = fma(_1897, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1905);
    float _1917 = _684 * _1863;
    int _1919 = ~_1651;
    int _1921 = _1919 + _1717;
    int _1923 = _1921 + 1;
    float _1925 = fma(_1779, _1883, _1915);
    float _1927 = _1913 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1929 = ~_979;
    int _1931 = _1929 + 1;
    float _1933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1935 = fma(_1573, _1869, _1925);
    float _1937 = float(uint(_1397));
    int _1939 = _979 * _1923;
    int _1941 = _1939 + _1425;
    float _1943 = float(_1613);
    float _1945 = -_1909;
    float _1947 = fma(_1927, 2.0, _1945);
    float _1949 = float(_1889);
    float _1951 = as_type<float>(_1037) * _1937;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1955 = _1315 + _1953;
    float _1957 = float(_1707);
    float _1959 = _1949 * _1943;
    float _1961 = float(_1907);
    float _1963 = trunc(_1951);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    bool _1969 = !_1349;
    int _1971 = _1969 ? _1941 : (-1);
    float _1973 = _1955 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1977 = _1875 + _1975;
    int _1979 = ~_1813;
    int _1981 = _1979 + 1;
    int _1983 = _1981 + 1;
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1987 = _1877 + _1985;
    int _1989 = _1983;
    if (!_1751)
    {
        int _1991 = ~_1813;
        int _1993 = _1991 + 1;
        _1989 = _1993;
    }
    int _1995 = _1989;
    float _1997 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1973);
    int _1999 = _1971 & 3;
    bool _2001 = _1999 != 0;
    float _2003 = _1933 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _2005 = abs(_1859);
    float _2007 = fma(_1987, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1997);
    float _2009 = _2001 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2011 = fma(_1819, _1917, _1935);
    bool _2013 = uint(_1999) >= 2u;
    float _2015 = fma(_2003, _1587, -0.5);
    int _2017 = _1931 * int(_1967);
    int _2019 = _2017 + _1397;
    float _2021 = -_166;
    float _2023 = fma(_2021, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1947);
    float _2025 = _1977 * _1977;
    float _2027 = float(uint(_2019));
    float _2029 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2031 = float(_2005);
    float _2033 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2035 = float(_1995);
    float _2037 = as_type<float>(_1037) * _2027;
    float _2039 = _2027;
    float _2041 = _2007;
    float _2043 = _2035;
    float _2045 = _2009;
    if (!_1865)
    {
        _2039 = _1041;
    }
    float _2047 = _2039;
    float _2049 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2029);
    int _2051 = _2013 ? 0 : 1;
    float _2053 = _2031 * _2035;
    bool _2055 = _2007 >= 0.0;
    float _2057 = trunc(_2037);
    float _2059 = precise::max(_2057, 0.0);
    uint _2061 = uint(_2059);
    float _2063 = _2047;
    if (!_1865)
    {
        _2041 = _2047;
    }
    float _2065 = _2041;
    float _2067 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2049);
    float _2069 = _1961 * _1957;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    float _2073 = _2065;
    float _2075 = _2069;
    if (_1865)
    {
        _2063 = _791;
    }
    float _2077 = _2063;
    float _2079 = fma(_2067, _2015, _2023);
    if (!_1865)
    {
        _2043 = _1051;
    }
    float _2081 = _2043;
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2085 = _2081;
    if (_1865)
    {
        _2085 = _1041;
    }
    float _2087 = _2085;
    float _2089 = fma(_2077, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2033);
    int _2091 = _1159 >> 31;
    float _2093 = fma(_1845, _1851, _2011);
    int _2095 = _1971 >> 31;
    float _2097 = fma(_2087, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2083);
    int _2099 = _2091 & 3;
    float _2101 = fma(_1743, _1743, _2025);
    int _2103 = int(_1967) + int(_2061);
    float _2105 = fma(_1867, _1839, _2093);
    int _2107 = _1159 + _2099;
    float _2109 = fma(_1987, _1987, _2101);
    int _2111 = _2095 & 3;
    float _2113 = in.m_79.x;
    float _2115 = in.m_79.y;
    float _2117 = in.m_79.z;
    int _2119 = _2107 >> 2;
    float _2121 = sqrt(_2109);
    int _2123 = _1971 + _2111;
    float _2125 = _2053 * (-2.0);
    int _2127 = _2119 << 4;
    int _2129 = _2127 + 368;
    float _2131 = fma(_1735, _1821, _2105);
    int _2133 = _2123 >> 2;
    float _2135 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2097);
    uint _2137 = uint(int(uint(_2129) >> uint(2)));
    uint _2139 = uint(int(uint(int(_2137)) >> uint(2)));
    int _2141 = int(_2137) & 3;
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[int(_2139)][_2141];
    int _2145 = int(_2137) + 1;
    uint _2147 = uint(int(uint(_2145) >> uint(2)));
    int _2149 = _2145 & 3;
    float _2151 = (*spvDescriptorSet0.vp_c9)._m0[int(_2147)][_2149];
    if (!_1865)
    {
        _2071 = _1051;
    }
    float _2153 = _2071;
    float _2155 = rsqrt(_2109);
    int _2157 = _2133 << 4;
    int _2159 = _2157 + 512;
    float _2161 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2131);
    float _2163 = _2153;
    if (_1865)
    {
        _2073 = _791;
    }
    float _2165 = _2073;
    if (_2055)
    {
        out.m_53.x = 0.0;
    }
    if (_1865)
    {
        _2163 = _1041;
    }
    float _2167 = _2163;
    uint _2169 = uint(int(uint(_2159) >> uint(2)));
    uint _2171 = uint(int(uint(int(_2169)) >> uint(2)));
    int _2173 = int(_2169) & 3;
    float _2175 = (*spvDescriptorSet0.vp_c9)._m0[int(_2171)][_2173];
    int _2177 = int(_2169) + 1;
    uint _2179 = uint(int(uint(_2177) >> uint(2)));
    int _2181 = _2177 & 3;
    float _2183 = (*spvDescriptorSet0.vp_c9)._m0[int(_2179)][_2181];
    bool _2185 = uint(_1999) > 1u;
    float _2187 = _2121 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2189 = ~_979;
    int _2191 = _2189 + 1;
    float _2193 = _2167 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2195 = _2165 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2197 = precise::min(_734, _2187);
    int _2199 = _2191 * _2103;
    int _2201 = _2199 + _1397;
    int _2203 = _2159 + 8;
    uint _2205 = uint(int(uint(_2203) >> uint(2)));
    uint _2207 = uint(int(uint(int(_2205)) >> uint(2)));
    int _2209 = int(_2205) & 3;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[int(_2207)][_2209];
    int _2213 = int(_2205) + 1;
    uint _2215 = uint(int(uint(_2213) >> uint(2)));
    int _2217 = _2213 & 3;
    float _2219 = (*spvDescriptorSet0.vp_c9)._m0[int(_2215)][_2217];
    int _2221 = ~as_type<int>(_2009);
    int _2223 = _2221 + 1;
    int _2225 = _2223 + 1;
    float _2227 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2229 = _2155 * _2197;
    int _2231 = _2225;
    if (!_2185)
    {
        int _2233 = ~as_type<int>(_2009);
        int _2235 = _2233 + 1;
        _2231 = _2235;
    }
    int _2237 = _2231;
    float _2239 = fma(_2193, -2.0, _2227);
    bool _2241 = uint(_2201) >= uint(_979);
    float _2243 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2245 = _2129 + 8;
    uint _2247 = uint(int(uint(_2245) >> uint(2)));
    uint _2249 = uint(int(uint(int(_2247)) >> uint(2)));
    int _2251 = int(_2247) & 3;
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[int(_2249)][_2251];
    int _2255 = int(_2247) + 1;
    uint _2257 = uint(int(uint(_2255) >> uint(2)));
    int _2259 = _2255 & 3;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[int(_2257)][_2259];
    int _2263 = ~_1575;
    int _2265 = _2263 + _1623;
    int _2267 = _2265 + 1;
    float _2269 = _1743 * _2229;
    bool _2271 = !_2241;
    int _2273 = _2271 ? 0 : (-1);
    float _2275 = -_2243;
    float _2277 = fma(_2195, 2.0, _2275);
    bool _2279 = _1999 != 3;
    int _2281 = _656 * _2267;
    int _2283 = _2281 + _959;
    if (_2055)
    {
        _2045 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2285 = _2045;
    int _2287 = ~_2103;
    int _2289 = _2287 + _2273;
    int _2291 = _2289 + 1;
    float _2293 = _1977 * _2229;
    int _2295 = ~_2051;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    int _2301 = as_type<int>(_2285);
    int _2303 = _2299;
    if (_2055)
    {
        float _2305 = _2285 * 5.0;
        _2301 = as_type<int>(_2305);
    }
    int _2307 = _2301;
    int _2309 = abs(_2237);
    int _2311 = _979 * _2291;
    int _2313 = _2311 + _1397;
    float _2315 = -_2269;
    float _2317 = _1743 + _2315;
    if (_2055)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8203 = as_type<float>(_2307);
        out.gl_Position.z = _8203;
    }
    if (_2279)
    {
        int _2319 = ~_2051;
        int _2321 = _2319 + 1;
        _2303 = _2321;
    }
    int _2323 = _2303;
    float _2325 = -_2293;
    float _2327 = _1977 + _2325;
    int _2329 = _1971 & 3;
    bool _2331 = _2329 != 0;
    float _2333 = _2317 * _2317;
    float _2335 = _1987 * _2229;
    int _2337 = abs(_1681);
    float _2339 = fma(_2327, _2327, _2333);
    int _2341 = ~_2309;
    int _2343 = _2341 + 1;
    int _2345 = _2343 + 1;
    float _2347 = fma(_2125, _2113, _2113);
    int _2349 = abs(_2323);
    float _2351 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2353 = int(_2351);
    int _2355 = ~_1495;
    int _2357 = _2355 + 1;
    int _2359 = _2357 + 1;
    int _2361 = _2345 * as_type<int>(_2183);
    bool _2363 = !_2331;
    int _2365 = _2363 ? 0 : 1;
    float _2367 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2239);
    int _2369 = abs(_1267);
    int _2371 = _2359 * as_type<int>(_2151);
    int _2373 = abs(_2365);
    out.m_81.w = _2197;
    float _2375 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2377 = int(_2375);
    out.m_83.x = _2161;
    int _2379 = ~_2337;
    int _2381 = _2379 + 1;
    int _2383 = _2381 + 1;
    float _2385 = fma(_1749, _2125, _1749);
    int _2387 = ~_2373;
    int _2389 = _2387 + 1;
    int _2391 = _2389 + 1;
    bool _2393 = _1999 != 3;
    int _2395 = _2383 * as_type<int>(_2143);
    int _2397 = _2395 + _2371;
    int _2399 = ~_2349;
    int _2401 = _2399 + 1;
    int _2403 = _2401 + 1;
    int _2405 = _2391 * as_type<int>(_2175);
    int _2407 = _2405 + _2361;
    float _2409 = float(uint(_2353));
    bool _2411 = !_2393;
    int _2413 = _2411 ? 0 : (-1);
    int _2415 = _2403 * as_type<int>(_2211);
    int _2417 = _2415 + _2407;
    int _2419 = abs(_1739);
    float _2421 = 1.0 / _2409;
    bool _2423 = !_1327;
    int _2425 = _2423 ? 0 : 1;
    int _2427 = ~_2369;
    int _2429 = _2427 + 1;
    int _2431 = _2429 + 1;
    bool _2433 = !_1339;
    int _2435 = _2433 ? 0 : 1;
    int _2437 = abs(_2425);
    int _2439 = _2431 * as_type<int>(_2253);
    int _2441 = _2439 + _2397;
    int _2443 = abs(_2413);
    float _2445 = float(uint(_2377));
    int _2447 = ~_2419;
    int _2449 = _2447 + 1;
    int _2451 = _2449 + 1;
    int _2453 = abs(_2435);
    float _2455 = 1.0 / _2445;
    int _2457 = _2451 * as_type<int>(_2261);
    int _2459 = _2457 + _2441;
    float _2461 = fma(_1955, _1955, _2025);
    bool _2463 = _656 == 0;
    float _2465 = -_2335;
    float _2467 = _1987 + _2465;
    int _2469 = abs(_2353);
    int _2471 = ~_2443;
    int _2473 = _2471 + 1;
    int _2475 = _2473 + 1;
    float _2477 = fma(_2467, _2467, _2339);
    int _2479 = ~_2437;
    int _2481 = _2479 + 1;
    int _2483 = _2481 + 1;
    bool _2485 = !_1349;
    int _2487 = _2485 ? _2313 : (-1);
    int _2489 = _2475 * as_type<int>(_2219);
    int _2491 = _2489 + _2417;
    int _2493 = ~_2453;
    int _2495 = _2493 + 1;
    int _2497 = _2495 + 1;
    int _2499 = _2459 * _2483;
    bool _2501 = !_2463;
    int _2503 = _2501 ? _2283 : (-1);
    float _2505 = sqrt(_2477);
    float _2507 = float(uint(_2469));
    int _2509 = _2497 * _2491;
    int _2511 = abs(_2377);
    int _2513 = _2503 * _2437;
    int _2515 = _2513 + _2499;
    int _2517 = as_type<int>(_2455) + (-2);
    int _2519 = _2487 * _2453;
    int _2521 = _2519 + _2509;
    int _2523 = as_type<int>(_2421) + (-2);
    float _2525 = 1.0 / _2507;
    float _2527 = float(uint(_2515));
    float _2529 = fma(_1987, _1987, _2461);
    float _2531 = float(uint(_2511));
    float _2533 = float(uint(_2521));
    float _2535 = as_type<float>(_2523) * _2527;
    float _2537 = as_type<float>(_2499);
    if (_1849)
    {
        _2537 = _1041;
    }
    float _2539 = _2537;
    float _2541 = _2155 * _2505;
    float _2543 = 1.0 / _2531;
    float _2545 = as_type<float>(_2517) * _2533;
    float _2547 = _2539;
    if (!_1849)
    {
        _2547 = _791;
    }
    float _2549 = _2547;
    int _2551 = abs(_2515);
    float _2553 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2555 = as_type<int>(_2525) + (-2);
    float _2557 = trunc(_2535);
    float _2559 = precise::max(_2557, 0.0);
    uint _2561 = uint(_2559);
    float _2563 = float(uint(_2551));
    float _2565 = _2549 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2567 = abs(_2521);
    int _2569 = ~_2353;
    int _2571 = _2569 + 1;
    float _2573 = fma(_2565, -2.0, _2553);
    float _2575 = as_type<float>(_2555) * _2563;
    float _2577 = trunc(_2545);
    float _2579 = precise::max(_2577, 0.0);
    uint _2581 = uint(_2579);
    int _2583 = as_type<int>(_2543) + (-2);
    float _2585 = _791 + (-0.5);
    float _2587 = float(uint(_2567));
    float _2589 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2573);
    int _2591 = ~_2377;
    int _2593 = _2591 + 1;
    float _2595 = fma(_2585, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2347);
    int _2597 = ~_2377;
    int _2599 = _2597 + 1;
    int _2601 = _2571 * int(_2561);
    int _2603 = _2601 + _2515;
    float _2605 = trunc(_2575);
    float _2607 = precise::max(_2605, 0.0);
    uint _2609 = uint(_2607);
    float _2611 = as_type<float>(_2583) * _2587;
    float _2613 = float(uint(_2603));
    int _2615 = ~_2469;
    int _2617 = _2615 + 1;
    int _2619 = _2593 * int(_2581);
    int _2621 = _2619 + _2521;
    float _2623 = rsqrt(_2529);
    float _2625 = as_type<float>(_2523) * _2613;
    float _2627 = _728 * _2541;
    float _2629 = float(uint(_2621));
    float _2631 = _2627 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2633 = trunc(_2611);
    float _2635 = precise::max(_2633, 0.0);
    uint _2637 = uint(_2635);
    int _2639 = _2617 * int(_2609);
    int _2641 = _2639 + _2551;
    float _2643 = as_type<float>(_2517) * _2629;
    float _2645 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _2647 = ~_2469;
    int _2649 = _2647 + 1;
    float _2651 = float(uint(_2641));
    float _2653 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2645);
    float _2655 = _2631 * _2623;
    int _2657 = ~_2511;
    int _2659 = _2657 + 1;
    float _2661 = trunc(_2625);
    float _2663 = precise::max(_2661, 0.0);
    uint _2665 = uint(_2663);
    float _2667 = as_type<float>(_2555) * _2651;
    bool _2669 = _2377 == 0;
    float _2671 = _1955 * _2655;
    bool _2673 = _2377 == 0;
    float _2675 = _1977 * _2655;
    int _2677 = _2659 * int(_2637);
    int _2679 = _2677 + _2567;
    float _2681 = -_2671;
    float _2683 = _1955 + _2681;
    float _2685 = trunc(_2643);
    float _2687 = precise::max(_2685, 0.0);
    uint _2689 = uint(_2687);
    float _2691 = -_2675;
    float _2693 = _1977 + _2691;
    float _2695 = float(uint(_2679));
    float _2697 = _2683 * _2683;
    float _2699 = as_type<float>(_2583) * _2695;
    float _2701 = trunc(_2667);
    float _2703 = precise::max(_2701, 0.0);
    uint _2705 = uint(_2703);
    float _2707 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2653);
    int _2709 = int(_2561) + int(_2665);
    float _2711 = _1987 * _2655;
    float _2713 = fma(_2693, _2693, _2697);
    float _2715 = -_2589;
    float _2717 = fma(_2707, _1899, _2715);
    int _2719 = int(_2581) + int(_2689);
    float _2721 = trunc(_2699);
    float _2723 = precise::max(_2721, 0.0);
    uint _2725 = uint(_2723);
    int _2727 = ~_2353;
    int _2729 = _2727 + 1;
    float _2731 = -_2711;
    float _2733 = _1987 + _2731;
    int _2735 = _2599 * _2719;
    int _2737 = _2735 + _2521;
    int _2739 = _2729 * _2709;
    int _2741 = _2739 + _2515;
    float _2743 = fma(_2733, _2733, _2713);
    int _2745 = int(_2609) + int(_2705);
    bool _2747 = uint(_2737) >= uint(_2377);
    bool _2749 = uint(_2741) >= uint(_2353);
    int _2751 = _2649 * _2745;
    int _2753 = _2751 + _2551;
    bool _2755 = !_2747;
    int _2757 = _2755 ? 0 : (-1);
    float _2759 = sqrt(_2743);
    int _2761 = int(_2637) + int(_2725);
    int _2763 = ~_2511;
    int _2765 = _2763 + 1;
    bool _2767 = !_2749;
    int _2769 = _2767 ? 0 : (-1);
    bool _2771 = uint(_2753) >= uint(_2469);
    int _2773 = _2765 * _2761;
    int _2775 = _2773 + _2567;
    int _2777 = ~_2709;
    int _2779 = _2777 + _2769;
    int _2781 = _2779 + 1;
    float _2783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2785 = _2353 == 0;
    bool _2787 = _2353 == 0;
    int _2789 = _2515 ^ _2353;
    int _2791 = _2353 * _2781;
    int _2793 = _2791 + _2515;
    int _2795 = ~_2719;
    int _2797 = _2795 + _2757;
    int _2799 = _2797 + 1;
    float _2801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2803 = _2521 ^ _2377;
    float _2805 = _2623 * _2759;
    bool _2807 = !_2785;
    int _2809 = _2807 ? _2793 : (-1);
    int _2811 = _2377 * _2799;
    int _2813 = _2811 + _2521;
    bool _2815 = !_2771;
    int _2817 = _2815 ? 0 : (-1);
    float _2819 = -_166;
    float _2821 = fma(_2819, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1501);
    float _2823 = float(_2809);
    float _2825 = _2783 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2827 = ~_2817;
    int _2829 = _2745 + _2827;
    int _2831 = _2829 + 1;
    float _2833 = _2627 * _2805;
    bool _2835 = uint(_2775) >= uint(_2511);
    float _2837 = fma(_2825, _2823, _2821);
    bool _2839 = !_2669;
    int _2841 = _2839 ? _2813 : (-1);
    float _2843 = fma(_2825, _1079, -0.5);
    uint _2845 = uint(int(uint(_2789) >> uint(31)));
    float _2847 = _2801 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2849 = float(_2841);
    float _2851 = -_166;
    float _2853 = fma(_2851, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2277);
    bool _2855 = !_2835;
    int _2857 = _2855 ? 0 : (-1);
    float _2859 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2861 = ~int(_2845);
    int _2863 = _2861 + 1;
    float _2865 = fma(_2847, _1147, -0.5);
    float _2867 = fma(_2847, _2849, _2853);
    uint _2869 = uint(int(uint(_2803) >> uint(31)));
    out.m_85.x = _2833;
    int _2871 = _2831 ^ _2863;
    float _2873 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2875 = ~_2857;
    int _2877 = _2761 + _2875;
    int _2879 = _2877 + 1;
    float _2881 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2883 = log2(_2881);
    int _2885 = ~int(_2869);
    int _2887 = _2885 + 1;
    float _2889 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2873);
    int _2891 = ~_2863;
    int _2893 = _2891 + _2871;
    int _2895 = _2893 + 1;
    int _2897 = _2879 ^ _2887;
    float _2899 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2889);
    bool _2901 = !_2787;
    int _2903 = _2901 ? _2895 : (-1);
    float _2905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2907 = ~_2887;
    int _2909 = _2907 + _2897;
    int _2911 = _2909 + 1;
    float _2913 = _2859 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2915 = float(_2903);
    float _2917 = fma(_2899, _2843, _2837);
    bool _2919 = !_2673;
    int _2921 = _2919 ? _2911 : (-1);
    float _2923 = fma(_1171, _2913, -0.5);
    float _2925 = -_1529;
    float _2927 = fma(_2913, _2915, _2925);
    float _2929 = _2883 * _166;
    bool _2931 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2933 = isnan(0.0);
    bool _2935 = _2931 || _2933;
    bool _2937 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2939 = _2935 || _2937;
    bool _2941 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2943 = isnan(1.0);
    bool _2945 = _2941 || _2943;
    bool _2947 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2949 = _2945 || _2947;
    float _2951 = exp2(_2929);
    float _2953 = _2905 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2955 = float(_2921);
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2959 = fma(_1165, _2953, -0.5);
    float _2961 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2957);
    float _2963 = -_2367;
    float _2965 = fma(_2953, _2955, _2963);
    float _2967 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2089);
    float _2969 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2971 = 1.0 + _2969;
    float _2973 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2961);
    float _2975 = fma(_2135, _2959, _2965);
    float _2977 = fma(_2967, _2865, _2867);
    float _2979 = _2079 + 0.5;
    float _2981 = fma(_2973, _2923, _2927);
    float _2983 = _2717 + 0.5;
    float _2985 = 1.0 / _2971;
    float _2987 = _2977 + 0.5;
    float _2989 = _2917 + 0.5;
    float _2991 = _2981 + 0.5;
    float _2993 = _2975 + 0.5;
    float _2995 = -_2951;
    float _2997 = _2995 + 1.0;
    out.m_87.x = _2979;
    out.m_87.y = _2983;
    out.m_89.x = _2989;
    out.m_89.y = _2991;
    out.m_89.z = _2987;
    out.m_89.w = _2993;
    float _2999 = _2939 ? _2997 : 0.0;
    float _3001 = as_type<float>(_2813);
    float _3003 = _2671;
    if (_2055)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3005 = -_2671;
    float _3007 = _1315 + _3005;
    float _3009 = -_2675;
    float _3011 = _1875 + _3009;
    if (_2949)
    {
        float _3013 = _2999 * _2985;
        _168 = _3013;
    }
    float _3015 = _168;
    float _3017 = _1959 * (-2.0);
    float _3019 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3021 = _3007 + _3019;
    float _3023 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3025 = _3011 + _3023;
    float _3027 = fma(_1733, _3017, _1733);
    float _3029 = _3021 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3031 = _791 + _1051;
    float _3033 = fma(_3017, _2115, _2115);
    float _3035 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _3037 = (*spvDescriptorSet0.vp_c9)._m0[191].y + _3035;
    float _3039 = fma(_3025, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3029);
    float _3041 = -_2711;
    float _3043 = _1877 + _3041;
    float _3045 = _1041 + (-0.5);
    float _3047 = _3031 + (-1.0);
    float _3049 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3051 = _3043 + _3049;
    float _3053 = _2069 * (-2.0);
    float _3055 = 1.0 / _3037;
    float _3057 = fma(_3045, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3033);
    float _3059 = fma(_3051, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3039);
    float _3061 = fma(_3047, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3063 = _1051 + (-0.5);
    float _3065 = precise::max(_1585, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _3067 = fma(_3027, _3015, _3057);
    bool _3069 = _3059 >= 0.0;
    float _3071 = fma(_2385, _3015, _2595);
    float _3073 = fma(_3053, _2117, _2117);
    float _3075 = fma(_3061, _3053, _3061);
    float _3077 = precise::min(_3065, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _3079 = _3067 * 0.15915493667125701904296875;
    float _3081 = fma(_3063, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3073);
    float _3083 = in.m_91.x;
    float _3085 = in.m_91.y;
    float _3087 = in.m_91.z;
    float _3089 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _3091 = _3077 + _3089;
    float _3093 = fma(_3075, _3015, _3081);
    float _3095 = _3071 * 0.15915493667125701904296875;
    float _3097 = _3079 * 6.283185482025146484375;
    float _3099 = sin(_3097);
    float _3101 = _3091 * _3055;
    float _3103 = _3093 * 0.15915493667125701904296875;
    float _3105 = _3055;
    if (_3069)
    {
        _3105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3107 = _3105;
    float _3109 = (*spvDescriptorSet0.vp_c9)._m0[191].z + (-1.0);
    int _3111 = as_type<int>(_3107);
    if (_3069)
    {
        out.m_53.x = 0.0;
    }
    float _3113 = _3079 * 6.283185482025146484375;
    float _3115 = cos(_3113);
    if (_3069)
    {
        float _3117 = _3107 * 5.0;
        _3111 = as_type<int>(_3117);
    }
    int _3119 = _3111;
    float _3121 = fma(_3101, _3109, 1.0);
    float _3123 = _3103 * 6.283185482025146484375;
    float _3125 = sin(_3123);
    float _3127 = _3095 * 6.283185482025146484375;
    float _3129 = sin(_3127);
    float _3131 = _3095 * 6.283185482025146484375;
    float _3133 = cos(_3131);
    if (_3069)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9392 = as_type<float>(_3119);
        out.gl_Position.z = _9392;
    }
    if (_3069)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3135 = _3103 * 6.283185482025146484375;
    float _3137 = cos(_3135);
    float _3139 = _3121 * _3083;
    float _3141 = _3121 * _3085;
    float _3143 = _3121 * _3087;
    float _3145 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3147 = _2541 * _2805;
    float _3149 = _364 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3151 = _3129 * _3099;
    float _3153 = _3133 * _3115;
    float _3155 = _3145 * _3147;
    float _3157 = _3149 * _3147;
    float _3159 = fma(_3125, _3153, _3151);
    float _3161 = fma(_3125, _3151, _3153);
    float _3163 = _3133 * _3099;
    float _3165 = _3129 * _3115;
    float _3167 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3139);
    float _3169 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3141);
    float _3171 = _3115 * _3137;
    float _3173 = _3133 * _3137;
    float _3175 = _2833 * _3167;
    float _3177 = _3129 * _3137;
    float _3179 = _3099 * _3137;
    float _3181 = _3155 * _3169;
    float _3183 = -_3163;
    float _3185 = fma(_3125, _3165, _3183);
    float _3187 = -_3165;
    float _3189 = fma(_3125, _3163, _3187);
    float _3191 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3143);
    float _3193 = _3173 * _3181;
    float _3195 = _3159 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3197 = _3159 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3199 = _3159 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3201 = _3157 * _3191;
    float _3203 = -_3181;
    float _3205 = _3125 * _3203;
    float _3207 = fma(_3159, _3175, _3193);
    float _3209 = fma(_3171, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3195);
    float _3211 = fma(_3171, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3197);
    float _3213 = fma(_3171, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3199);
    float _3215 = _3177 * _3181;
    float _3217 = fma(_3171, _3175, _3205);
    float _3219 = fma(_3189, _3201, _3207);
    float _3221 = fma(_3185, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3209);
    float _3223 = fma(_3185, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3211);
    float _3225 = fma(_3185, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3213);
    float _3227 = fma(_3185, _3175, _3215);
    float _3229 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3231 = fma(_3179, _3201, _3217);
    float _3233 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3235 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3237 = _3173 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3239 = -_3125;
    float _3241 = fma(_3239, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3229);
    float _3243 = fma(_3161, _3201, _3227);
    float _3245 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3247 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3233);
    float _3249 = in.m_93.x;
    float _3251 = in.m_93.y;
    float _3253 = in.m_93.z;
    float _3255 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3257 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3245);
    float _3259 = fma(_3243, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3247);
    bool _3261 = _3141 != 0.0;
    bool _3263 = isnan(_3141);
    bool _3265 = _3261 || _3263;
    bool _3267 = isnan(0.0);
    bool _3269 = _3265 || _3267;
    float _3271 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3255);
    float _3273 = fma(_3243, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3257);
    float _3275 = _3259 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _3277 = _3139 == 0.0;
    bool _3279 = !_3269;
    bool _3281 = _3277 && _3279;
    float _3283 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3285 = _3273 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3287 = _1877 + _3275;
    float _3289 = _3189 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3291 = _3143 == 0.0;
    bool _3293 = _3291 && _3281;
    float _3295 = _1875 + _3285;
    float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3299 = _3287 + _3297;
    float _3301 = -_3125;
    float _3303 = fma(_3301, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3235);
    float _3305 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3283);
    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3309 = _3295 + _3307;
    float _3311 = _3299 * _3299;
    float _3313 = fma(_3179, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3289);
    float _3315 = -_3125;
    float _3317 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3237);
    float _3319 = in.m_95.x;
    float _3321 = in.m_95.y;
    float _3323 = in.m_95.z;
    float _3325 = in.m_95.w;
    float _3327 = fma(_3309, _3309, _3311);
    float _3329 = fma(_3177, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3303);
    float _3331 = fma(_3177, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3241);
    float _3333 = _3311;
    float _3335 = _3241;
    float _3337 = _3317;
    if (_3293)
    {
        _2075 = _3249;
    }
    float _3339 = _2075;
    float _3341 = sqrt(_3327);
    float _3343 = _3339;
    if (_3293)
    {
        _3001 = _3251;
    }
    float _3345 = _3001;
    float _3347 = fma(_3177, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3317);
    float _3349 = _3345;
    if (_3293)
    {
        _1521 = _3253;
    }
    float _3351 = _1521;
    float _3353 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3355 = _3351;
    if (_3293)
    {
        _3333 = _3339;
    }
    float _3357 = _3333;
    float _3359 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3271);
    float _3361 = _3357;
    if (_3293)
    {
        _3335 = _3345;
    }
    float _3363 = _3335;
    float _3365 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3353);
    float _3367 = _3363;
    if (_3293)
    {
        _3337 = _3351;
    }
    float _3369 = _3337;
    float _3371 = _3369;
    if (!_3293)
    {
        _3343 = _3249;
    }
    float _3373 = _3343;
    float _3375 = fma(_3243, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3365);
    if (!_3293)
    {
        _3349 = _3251;
    }
    float _3377 = _3349;
    float _3379 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3305);
    if (!_3293)
    {
        _3355 = _3253;
    }
    float _3381 = _3355;
    if (!_3293)
    {
        float _3383 = fma(_3139, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3373);
        _3361 = _3383;
    }
    float _3385 = _3361;
    float _3387 = fma(_3161, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3313);
    if (!_3293)
    {
        float _3389 = fma(_3141, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3377);
        _3367 = _3389;
    }
    float _3391 = _3367;
    float _3393 = _3331 * _3321;
    float _3395 = _3319;
    if (!_3293)
    {
        float _3397 = fma(_3143, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3381);
        _3371 = _3397;
    }
    float _3399 = _3371;
    bool _3401 = _3341 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3403 = _3375 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3405 = _3347 * _3321;
    float _3407 = fma(_3221, _3319, _3393);
    float _3409 = _3329 * _3321;
    float _3411 = _3323 * _3373;
    float _3413 = _3319 * _3377;
    float _3415 = _1315 + _3403;
    float _3417 = fma(_3225, _3319, _3405);
    float _3419 = fma(_3223, _3319, _3409);
    float _3421 = -_3411;
    float _3423 = fma(_3319, _3381, _3421);
    float _3425 = -_3413;
    float _3427 = fma(_3321, _3373, _3425);
    float _3429 = _3321 * _3381;
    float _3431 = _3403;
    float _3433 = _3413;
    if (!_3401)
    {
        _3431 = _3295;
    }
    float _3435 = _3431;
    float _3437 = _3435;
    if (!_3401)
    {
        _3433 = _3287;
    }
    float _3439 = _3433;
    float _3441 = _3439;
    if (!_3401)
    {
        _3395 = _3415;
    }
    float _3443 = _3395;
    bool _3445 = !_3401;
    float _3447 = _3443;
    if (!_3445)
    {
        float _3449 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3451 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3453 = _3341 + _3451;
        float _3455 = rsqrt(_3327);
        float _3457 = _3453 * _3449;
        float _3459 = _3415 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3461 = _3457 * 0.15915493667125701904296875;
        float _3463 = _3461 * 6.283185482025146484375;
        float _3465 = cos(_3463);
        float _3467 = _3461 * 6.283185482025146484375;
        float _3469 = sin(_3467);
        float _3471 = _3465 + (-1.0);
        float _3473 = _3471 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3475 = fma(_3469, _3459, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3477 = fma(_3415, _3465, _3473);
        float _3479 = _3455 * _3475;
        float _3481 = fma(_3309, _3479, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3483 = fma(_3299, _3479, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3447 = _3477;
        _3437 = _3481;
        _3441 = _3483;
    }
    float _3485 = _3447;
    float _3487 = _3437;
    float _3489 = _3441;
    float _3491 = -_2269;
    float _3493 = _3491 + _3485;
    float _3495 = -_3429;
    float _3497 = fma(_3323, _3377, _3495);
    float _3499 = -_2293;
    float _3501 = _3499 + _3487;
    float _3503 = fma(_3379, _3323, _3407);
    float _3505 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3507 = _3493 + _3505;
    float _3509 = fma(_3359, _3323, _3419);
    float _3511 = fma(_3387, _3323, _3417);
    float _3513 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3515 = _3501 + _3513;
    float _3517 = _3507 * _3507;
    float _3519 = -_2335;
    float _3521 = _3519 + _3489;
    float _3523 = _3423 * _3325;
    float _3525 = _3497 * _3325;
    float _3527 = fma(_3515, _3515, _3517);
    float _3529 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3531 = _3521 + _3529;
    float _3533 = _3427 * _3325;
    float _3535 = _3331 * _3391;
    float _3537 = _3329 * _3391;
    float _3539 = fma(_3531, _3531, _3527);
    float _3541 = _3523 * _3331;
    float _3543 = _3347 * _3391;
    float _3545 = _3523 * _3329;
    float _3547 = _3523 * _3347;
    float _3549 = fma(_3221, _3385, _3535);
    float _3551 = fma(_3223, _3385, _3537);
    float _3553 = fma(_3525, _3221, _3541);
    float _3555 = fma(_3525, _3223, _3545);
    float _3557 = sqrt(_3539);
    float _3559 = fma(_3525, _3225, _3547);
    float _3561 = fma(_3225, _3385, _3543);
    float _3563 = fma(_3379, _3399, _3549);
    float _3565 = fma(_3533, _3379, _3553);
    float _3567 = fma(_3359, _3399, _3551);
    float _3569 = fma(_3533, _3359, _3555);
    float _3571 = fma(_3533, _3387, _3559);
    float _3573 = fma(_3387, _3399, _3561);
    out.m_97.x = _3503;
    out.m_97.y = _3509;
    out.m_97.z = _3511;
    float _3575 = -_2293;
    float _3577 = _1875 + _3575;
    float _3579 = -_2269;
    float _3581 = _3579 + _1315;
    out.m_99.x = _3565;
    out.m_99.y = _3569;
    out.m_99.z = _3571;
    float _3583 = -_2335;
    float _3585 = _1877 + _3583;
    bool _3587 = _3557 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3589 = isnan(_3557);
    bool _3591 = _3587 || _3589;
    bool _3593 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3595 = _3591 || _3593;
    out.m_101.x = _3563;
    out.m_101.y = _3567;
    out.m_101.z = _3573;
    float _3597 = _3559;
    if (!_3595)
    {
        _3597 = 1.0;
    }
    float _3599 = _3597;
    bool _3601 = !_3595;
    float _3603 = _3599;
    if (!_3601)
    {
        bool _3605 = _3557 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3607 = isnan(_3557);
        bool _3609 = _3605 || _3607;
        bool _3611 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3613 = _3609 || _3611;
        if (!_3613)
        {
            float _3615 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3617 = _3557 + _3615;
            float _3619 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3621 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3619;
            float _3623 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3625 = _3623 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3627 = 1.0 / _3621;
            float _3629 = _3617 * _3627;
            float _3631 = fma(_3629, _3625, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3603 = _3631;
            _3633 = true;
        }
        else
        {
            bool _3635 = _3557 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3637 = isnan(_3557);
            bool _3639 = _3635 || _3637;
            bool _3641 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3643 = _3639 || _3641;
            if (!_3643)
            {
                float _3645 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3647 = _3557 + _3645;
                float _3649 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3651 = _3649 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3653 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3655 = _3653 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3657 = 1.0 / _3651;
                float _3659 = _3647 * _3657;
                float _3661 = fma(_3659, _3655, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3603 = _3661;
                _3633 = true;
            }
            else
            {
                _3603 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3633 = false;
    float _3663 = _3603;
    float _3665 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3667 = _3501 + _3665;
    float _3669 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3671 = _3521 + _3669;
    float _3673 = fma(_3667, _3663, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3675 = fma(_3671, _3663, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3677 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _3679 = _3673 + _3677;
    float _3681 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _3683 = _3675 + _3681;
    float _3685 = fma(_3679, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _3687 = fma(_3683, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _10364 = float2(_3685, _3687);
    float _3689 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_10364, float2(0.0), isnan(_10364)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_10364, float2(0.0), isnan(_10364)), level(0.0)).x;
    float _3691 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3693 = _3493 + _3691;
    float _3695 = -_2711;
    float _3697 = _3695 + _3585;
    float _3699 = -_3577;
    float _3701 = _3699 + _3673;
    float _3703 = -_3585;
    float _3705 = _3703 + _3675;
    float _3707 = fma(_3693, _3663, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3709 = -_2675;
    float _3711 = _3709 + _3577;
    float _3713 = -_3581;
    float _3715 = _3713 + _3707;
    float _3717 = _3715 * _3715;
    float _3719 = fma(_3701, _3701, _3717);
    float _3721 = fma(_3705, _3705, _3719);
    float _3723 = sqrt(_3721);
    bool _3725 = _3723 > 0.0;
    bool _3727 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3729 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3731 = _3727 || _3729;
    bool _3733 = isnan(0.5);
    bool _3735 = _3731 || _3733;
    float _3737 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _3739 = _3707;
    float _3741 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _3743 = _3711;
    if (!_3725)
    {
        _3737 = _3675;
    }
    float _3745 = _3737;
    float _3747 = fma(_3689, 100.0, _3581);
    float _3749 = -_2671;
    float _3751 = _3749 + _3747;
    float _3753 = _3751 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3755 = fma(_3711, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3753);
    float _3757 = fma(_3697, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3755);
    float _3759 = _3757 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3761 = _3751 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3763 = 1.0 / _3759;
    float _3765 = fma(_3711, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3761);
    float _3767 = fma(_3697, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3765);
    float _3769 = _3767 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3771 = _3769 + _3759;
    float _3773 = fma(_3689, 100.0, _3707);
    float _3775 = _3771 * _3763;
    float _3777 = _3775 * 0.5;
    float _3779 = _3745;
    float _3781 = _3747;
    if (!_3725)
    {
        _3739 = _3773;
    }
    float _3783 = _3739;
    float _3785 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3787 = fma(_3777, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3785);
    float _3789 = 1.0 / _3787;
    bool _3791 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3793 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3795 = _3791 || _3793;
    bool _3797 = isnan(0.5);
    bool _3799 = _3795 || _3797;
    float _3801 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _3803 = _3783;
    float _3805 = _3787;
    if (!_3725)
    {
        _3801 = _3673;
    }
    float _3807 = _3801;
    bool _3809 = !_3725;
    float _3811 = _3807;
    float _3813 = _3807;
    if (!_3809)
    {
        float _3815 = _232 * _232;
        float _3817 = fma(_230, _230, _3815);
        float _3819 = fma(_234, _234, _3817);
        float _3821 = rsqrt(_3721);
        float _3823 = sqrt(_3819);
        float _3825 = _3701 * _3821;
        float _3827 = _3715 * _3821;
        float _3829 = _3705 * _3821;
        bool _3831 = _3823 > 0.0;
        float _3833 = _3823;
        float _3835 = _3821;
        _3805 = _3819;
        if (!_3831)
        {
            _3811 = _3673;
        }
        float _3837 = _3811;
        _3813 = _3837;
        if (!_3831)
        {
            _3833 = _3773;
        }
        float _3839 = _3833;
        _3803 = _3839;
        if (!_3831)
        {
            _3835 = _3675;
        }
        float _3841 = _3835;
        bool _3843 = !_3831;
        _3779 = _3841;
        if (!_3843)
        {
            float _3845 = rsqrt(_3819);
            float _3847 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3849 = _232 * _3845;
            float _3851 = _230 * _3845;
            float _3853 = _3827 * _3849;
            float _3855 = _234 * _3845;
            float _3857 = fma(_3825, _3851, _3853);
            float _3859 = _3847 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3861 = fma(_3829, _3855, _3857);
            float _3863 = _3861 * _3859;
            float _3865 = fma(_230, _3863, _3673);
            float _3867 = fma(_232, _3863, _3773);
            float _3869 = fma(_234, _3863, _3675);
            _3803 = _3867;
            _3813 = _3865;
            _3779 = _3869;
            _3805 = _3845;
        }
    }
    float _3871 = _3803;
    float _3873 = _3813;
    float _3875 = _3779;
    float _3877 = _3805;
    float _3879 = -_2671;
    float _3881 = _3879 + _3871;
    float _3883 = -_2675;
    float _3885 = _3883 + _3873;
    float _3887 = -_2711;
    float _3889 = _3887 + _3875;
    float _3891 = _3873;
    float _3893 = _3881;
    float _3895 = _3885;
    float _3897 = _3889;
    float _3899 = _3877;
    if (_3799)
    {
        _3003 = 1.0;
    }
    float _3901 = _3003;
    float _3903 = _3901;
    if (!_3735)
    {
        float _3905 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3907 = _3751 + _3905;
        float _3909 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3911 = _3711 + _3909;
        float _3913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3915 = -_3585;
        float _3917 = _3915 + _3875;
        float _3919 = _3907 * _3907;
        float _3921 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3923 = _3697 + _3921;
        float _3925 = -_3577;
        float _3927 = _3925 + _3873;
        float _3929 = fma(_3911, _3911, _3919);
        float _3931 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3933 = fma(_3923, _3923, _3929);
        float _3935 = sqrt(_3933);
        float _3937 = 1.0 / _2805;
        float _3939 = precise::min(_3935, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3941 = _3939 * _3913;
        float _3943 = _3931 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3945 = -_3747;
        float _3947 = _3945 + _3871;
        float _3949 = _3941 * _3937;
        float _3951 = _3943 * _3949;
        float _3953 = _3917 * _3949;
        float _3955 = fma(_3927, _3951, _3711);
        float _3957 = fma(_3947, _3951, _3751);
        float _3959 = fma(_3943, _3953, _3697);
        _3891 = _3927;
        _3893 = _3957;
        _3895 = _3955;
        _3897 = _3959;
        _3899 = _3941;
    }
    float _3961 = _3891;
    float _3963 = _3893;
    float _3965 = _3895;
    float _3967 = _3897;
    float _3969 = _3899;
    float _3971 = _3961;
    float _3973 = _3969;
    if (_3799)
    {
        _3781 = 1.0;
    }
    float _3975 = _3781;
    float _3977 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3979 = _3789 * _3977;
    float _3981 = _3975;
    if (!_3799)
    {
        float _3983 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3985 = _3983 * 0.15915493667125701904296875;
        float _3987 = _3985 * 6.283185482025146484375;
        float _3989 = cos(_3987);
        float _3991 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3993 = _3991 * 0.15915493667125701904296875;
        float _3995 = _3985 * 6.283185482025146484375;
        float _3997 = sin(_3995);
        float _3999 = 1.0 / _3989;
        float _4001 = _3993 * 6.283185482025146484375;
        float _4003 = cos(_4001);
        float _4005 = _3997 * _3999;
        float _4007 = _3993 * 6.283185482025146484375;
        float _4009 = sin(_4007);
        float _4011 = _4003 * _4005;
        float _4013 = 1.0 / _4011;
        float _4015 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4017 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4015;
        float _4019 = 1.0 / _4017;
        float _4021 = _4009 * _4013;
        float _4023 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4025 = fma(_3979, _4021, _4023);
        float _4027 = _4025 * _4019;
        float _4029 = precise::clamp(_4027, 0.0, 1.0);
        _3971 = _4019;
        _3903 = _4029;
    }
    float _4031 = _3971;
    float _4033 = _3903;
    float _4035 = _4031;
    if (!_3799)
    {
        float _4037 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4039 = _4037 * 0.15915493667125701904296875;
        float _4041 = _4039 * 6.283185482025146484375;
        float _4043 = cos(_4041);
        float _4045 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4047 = _4045 * 0.15915493667125701904296875;
        float _4049 = _4039 * 6.283185482025146484375;
        float _4051 = sin(_4049);
        float _4053 = 1.0 / _4043;
        float _4055 = _4047 * 6.283185482025146484375;
        float _4057 = cos(_4055);
        float _4059 = _4051 * _4053;
        float _4061 = _4047 * 6.283185482025146484375;
        float _4063 = sin(_4061);
        float _4065 = _4057 * _4059;
        float _4067 = 1.0 / _4065;
        float _4069 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4071 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _4069;
        float _4073 = 1.0 / _4071;
        float _4075 = _4063 * _4067;
        float _4077 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _4079 = fma(_3979, _4075, _4077);
        float _4081 = _4079 * _4073;
        float _4083 = precise::clamp(_4081, 0.0, 1.0);
        float _4085 = -_4083;
        float _4087 = _4085 + 1.0;
        _4035 = _4053;
        _3981 = _4087;
    }
    float _4089 = _4035;
    float _4091 = _3981;
    float _4093 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4095 = _3963 + _4093;
    float _4097 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4099 = _3965 + _4097;
    float _4101 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4103 = _3967 + _4101;
    float _4105 = _4095 * _4095;
    float _4107 = fma(_4099, _4099, _4105);
    float _4109 = fma(_4103, _4103, _4107);
    float _4111 = rsqrt(_4109);
    float _4113 = _4111 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4115 = _4099 * _4113;
    float _4117 = _4103 * _4113;
    float _4119 = _4115 * _4115;
    float _4121 = _4117 * _4117;
    float _4123 = _4119 + _4121;
    float _4125 = sqrt(_4123);
    bool _4127 = _4125 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4129 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4131 = _4125 + _4129;
    float _4133 = _4111;
    float _4135 = _4089;
    float _4137 = _4131;
    float _4139 = _4095;
    if (_4127)
    {
        float _4141 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4133 = _4141;
    }
    float _4143 = _4133;
    if (_4127)
    {
        float _4145 = rsqrt(_4123);
        _4135 = _4145;
    }
    float _4147 = _4135;
    float _4149 = _4147;
    if (_4127)
    {
        float _4151 = _4131 * _4143;
        _4137 = _4151;
    }
    float _4153 = _4137;
    if (_4127)
    {
        float _4155 = _4153 * 0.15915493667125701904296875;
        _3973 = _4155;
    }
    float _4157 = _3973;
    float _4159 = _4103;
    if (_4127)
    {
        float _4161 = _4157 * 6.283185482025146484375;
        float _4163 = sin(_4161);
        _4159 = _4163;
    }
    float _4165 = _4159;
    float _4167 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4169 = precise::max(0.0, _4167);
    float _4171 = _4143;
    float _4173 = _4169;
    if (_4127)
    {
        float _4175 = _4157 * 6.283185482025146484375;
        float _4177 = cos(_4175);
        _4171 = _4177;
    }
    float _4179 = _4171;
    float _4181 = -_4113;
    float _4183 = -_4169;
    float _4185 = fma(_4095, _4181, _4183);
    if (_4127)
    {
        float _4187 = _4185 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4139 = _4187;
    }
    float _4189 = _4139;
    float _4191 = _4189;
    float _4193 = _4165;
    float _4195 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4127)
    {
        float _4197 = fma(_4165, _4189, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4191 = _4197;
    }
    float _4199 = _4191;
    float _4201 = _4199;
    if (!_4127)
    {
        _4193 = _4185;
    }
    float _4203 = _4193;
    float _4205 = _4203;
    float _4207 = _4179;
    if (_4127)
    {
        float _4209 = _4179 + (-1.0);
        _4173 = _4209;
    }
    float _4211 = _4173;
    float _4213 = _4211;
    if (_4127)
    {
        float _4215 = _4147 * _4199;
        _3741 = _4215;
    }
    float _4217 = _3741;
    if (!_4127)
    {
        _4149 = _4115;
    }
    float _4219 = _4149;
    float _4221 = _4219;
    if (_4127)
    {
        float _4223 = _4211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4213 = _4223;
    }
    float _4225 = _4213;
    if (_4127)
    {
        float _4227 = _4115 * _4217;
        _4221 = _4227;
    }
    float _4229 = _4221;
    if (!_4127)
    {
        _4201 = _4117;
    }
    float _4231 = _4201;
    float _4233 = _4231;
    if (_4127)
    {
        float _4235 = _4117 * _4217;
        _4233 = _4235;
    }
    float _4237 = _4233;
    if (_4127)
    {
        float _4239 = fma(_4185, _4179, _4225);
        _4205 = _4239;
    }
    float _4241 = _4205;
    if (!_4127)
    {
        _4207 = _4119;
    }
    float _4243 = _4207;
    float _4245 = sqrt(_4109);
    float _4247 = _4243;
    if (_4127)
    {
        float _4249 = _4229 * _4229;
        _4247 = _4249;
    }
    float _4251 = _4247;
    float _4253 = fma(_3711, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_4127)
    {
        _4195 = _4121;
    }
    float _4255 = _4195;
    float _4257 = _4255;
    if (_4127)
    {
        float _4259 = _4237 * _4237;
        _4257 = _4259;
    }
    float _4261 = _4257;
    float _4263 = fma(_4241, _4241, _4251);
    float _4265 = _3963 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4267 = _4263 + _4261;
    float _4269 = floor(_4253);
    float _4271 = fma(_3965, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4265);
    float _4273 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4275 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4277 = fma(_4245, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4275);
    float _4279 = precise::clamp(_4277, 0.0, 1.0);
    float _4281 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4271);
    float _4283 = fma(_3697, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4285 = _3963 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4287 = rsqrt(_4267);
    float _4289 = _4281 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4291 = -_4279;
    float _4293 = _4291 + 1.0;
    float _4295 = fma(_3965, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4285);
    float _4297 = _4289 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4299 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4295);
    float _4301 = abs(_4293);
    float _4303 = log2(_4301);
    float _4305 = _3963 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4307 = -_4297;
    float _4309 = fma(_4307, _4273, 1.0);
    float _4311 = _3963 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4313 = fma(_3965, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4305);
    float _4315 = fma(_3965, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4311);
    float _4317 = _4287 * _4229;
    float _4319 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4313);
    float _4321 = _4287 * _4237;
    float _4323 = _4287 * _4241;
    float _4325 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4327 = fma(_3967, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4315);
    float _4329 = _4319 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4331 = floor(_4283);
    float _4333 = -_4325;
    float _4335 = fma(_4323, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4333);
    float _4337 = _4327 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4339 = _4329 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4341 = _4303 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4343 = -_4321;
    float _4345 = fma(_4343, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4335);
    float _4347 = _4299 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4349 = fma(_4337, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4339);
    float _4351 = -_4269;
    float _4353 = _4253 + _4351;
    float _4355 = fma(_4345, -0.5, 0.5);
    float _4357 = exp2(_4341);
    float _4359 = fma(_4289, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4349);
    float _4361 = _4329 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4363 = fma(_4345, 0.5, 0.5);
    float _4365 = _4323 + 1.0;
    float _4367 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4359);
    float _4369 = _4329 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4371 = fma(_4337, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4361);
    float _4373 = log2(_4309);
    float _4375 = -_4331;
    float _4377 = _4283 + _4375;
    float _4379 = fma(_4337, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4369);
    float _4381 = fma(_4363, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4383 = fma(_4289, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4371);
    float _4385 = fma(_4289, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4379);
    float _4387 = fma(_4363, _4381, -0.212114393711090087890625);
    float _4389 = 1.0 / _4367;
    float _4391 = -_4323;
    float _4393 = fma(_4357, _4365, _4391);
    float _4395 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4385);
    float _4397 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4383);
    float _4399 = fma(_4363, _4387, 1.570728778839111328125);
    float _4401 = sqrt(_4355);
    float _4403 = _4373 * 0.693147182464599609375;
    float2 _11476 = float2(_4353, _4377);
    float _4405 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11476, float2(0.0), isnan(_11476)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11476, float2(0.0), isnan(_11476)), level(0.0)).x;
    float _4407 = fma(_4393, 0.5, 0.5);
    float _4409 = _4403 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4411 = _4395 * _4389;
    float _4413 = _4397 * _4389;
    float _4415 = fma(_4411, 0.5, 0.5);
    float _4417 = fma(_4413, -0.5, 0.5);
    float _4419 = _4401 * 0.636619746685028076171875;
    float3 _11504 = float3(_4415, _4417, _4409);
    float _4421 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11504, float3(0.0), isnan(_11504)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11504, float3(0.0), isnan(_11504)), level(0.0)).x;
    float _4423 = -_4399;
    float _4425 = fma(_4419, _4423, 1.0);
    float3 _11520 = float3(_4415, _4417, _4409);
    float4 _4428 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11520, float3(0.0), isnan(_11520)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11520, float3(0.0), isnan(_11520)), level(0.0)).xyzw;
    float _4430 = _4428.x;
    float _4432 = _4428.y;
    float _4434 = _4428.z;
    float _4436 = _4428.w;
    float2 _11536 = float2(_4425, _4407);
    float3 _4440 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11536, float2(0.0), isnan(_11536)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11536, float2(0.0), isnan(_11536)), level(0.0)).xyz;
    float _4442 = _4440.x;
    float _4444 = _4440.y;
    float _4446 = _4440.z;
    float _4448 = abs(_3979);
    float _4450 = log2(_4448);
    float _4452 = _4329 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_103.x = _3965;
    out.m_103.y = _3963;
    out.m_103.z = _3967;
    float _4454 = fma(_4337, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4452);
    bool _4456 = _4245 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4458 = isnan(_4245);
    bool _4460 = _4456 || _4458;
    bool _4462 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4464 = _4460 || _4462;
    float _4466 = in.m_77.x;
    float _4468 = fma(_4289, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4454);
    float _4470 = _4303 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4472 = _3979 <= 8000.0;
    bool _4474 = isnan(_3979);
    bool _4476 = _4472 || _4474;
    bool _4478 = isnan(8000.0);
    bool _4480 = _4476 || _4478;
    float _4482 = float(_4480);
    out.m_105.x = _3711;
    out.m_105.y = _3751;
    out.m_105.z = _3697;
    float _4484 = fma(_4347, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4468);
    float _4486 = _4367 * 0.5;
    float _4488 = _4450 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4490 = exp2(_4470);
    out.gl_Position.x = _4395;
    out.gl_Position.y = _4397;
    out.gl_Position.z = _4484;
    out.gl_Position.w = _4367;
    float _4492 = _4397;
    float _4494 = _4484;
    float _4496 = _4367;
    if (!_4464)
    {
        _3743 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4498 = _3743;
    float _4500 = exp2(_4488);
    float _4502 = fma(_4397, -0.5, _4486);
    float _4504 = _4498;
    float _4506 = _4498;
    if (!_4464)
    {
        _4492 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4508 = _4492;
    float _4510 = -_4490;
    float _4512 = _4510 + 1.0;
    float _4514 = _4512 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4516 = fma(_4500, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4518 = precise::clamp(_4516, 0.0, 1.0);
    float _4520 = _4484 + _4367;
    float _4522 = _4508;
    float _4524 = _4508;
    if (!_4464)
    {
        _4494 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4526 = _4494;
    float _4528 = fma(_4518, -2.0, 3.0);
    float _4530 = _4518 * _4518;
    float _4532 = _4520 * 0.5;
    float _4534 = _4530 * _4528;
    float _4536 = -_4534;
    float _4538 = _4536 + 1.0;
    float _4540 = fma(_4538, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4534);
    float _4542 = _4395 + _4367;
    float _4544 = -_4514;
    float _4546 = _4544 + 1.0;
    float _4548 = _4482 * _4540;
    float _4550 = _4542 * 0.5;
    float _4552 = _4546;
    float _4554 = _4526;
    float _4556 = _4526;
    if (!_4464)
    {
        _4496 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4558 = _4496;
    float _4560 = _4548 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_107.x = _4550;
    out.m_107.y = _4502;
    out.m_107.z = _4532;
    out.m_107.w = _4367;
    float _4562 = -_4405;
    float _4564 = _4562 + 1.0;
    float _4566 = _4564 * _4560;
    float _4568 = precise::clamp(_4566, 0.0, 1.0);
    float _4570 = -_4568;
    float _4572 = fma(_4570, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4574 = _4033 * _4091;
    float _4576 = _4572 * _4466;
    float _4578 = _4574 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4580 = _4574;
    float _4582 = _4558;
    float _4584 = _4558;
    if (!_4464)
    {
        _4580 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4586 = _4580;
    float _4588 = _4514 * _4421;
    float _4590 = _4576 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4592 = _4436 * _4588;
    float _4594 = _4436 * _4546;
    out.m_109.x = _4590;
    float _4596 = _4586;
    float _4598 = _4586;
    if (!_4464)
    {
        _4552 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4600 = _4552;
    float _4602 = _4446 * _4588;
    float _4604 = fma(_4442, _4592, _4430);
    float _4606 = fma(_4444, _4592, _4432);
    float _4608 = fma(_4436, _4602, _4434);
    out.m_111.x = _4604;
    out.m_111.y = _4606;
    out.m_111.z = _4608;
    out.m_111.w = _4594;
    bool _4610 = !_4464;
    float _4612 = _4600;
    float _4614 = _4600;
    if (!_4610)
    {
        bool _4616 = _4245 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4618 = isnan(_4245);
        bool _4620 = _4616 || _4618;
        bool _4622 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4624 = _4620 || _4622;
        if (!_4624)
        {
            float _4626 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4628 = _4245 + _4626;
            float _4630 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4632 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4630;
            float _4634 = 1.0 / _4632;
            float _4636 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4638 = _4636 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4640 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4642 = _4640 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4644 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4646 = _4644 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4648 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4650 = _4648 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4652 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4654 = _4652 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4656 = _4628 * _4634;
            float _4658 = precise::clamp(_4656, 0.0, 1.0);
            float _4660 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4662 = _4660 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4664 = fma(_4658, _4638, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4666 = fma(_4658, _4662, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4668 = fma(_4658, _4642, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4670 = fma(_4658, _4646, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4672 = fma(_4658, _4650, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4674 = fma(_4658, _4654, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4584 = _4666;
            _4614 = _4672;
            _4506 = _4664;
            _4524 = _4670;
            _4556 = _4668;
            _4598 = _4674;
            _4676 = true;
        }
        else
        {
            bool _4678 = _4245 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4680 = isnan(_4245);
            bool _4682 = _4678 || _4680;
            bool _4684 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4686 = _4682 || _4684;
            if (!_4686)
            {
                _4504 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4688 = _4504;
            _4506 = _4688;
            if (!_4686)
            {
                _4582 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4690 = _4582;
            _4584 = _4690;
            if (!_4686)
            {
                _4554 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4692 = _4554;
            _4556 = _4692;
            if (!_4686)
            {
                _4522 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4694 = _4522;
            _4524 = _4694;
            if (!_4686)
            {
                _4612 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4696 = _4612;
            _4614 = _4696;
            if (!_4686)
            {
                _4596 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4698 = _4596;
            bool _4700 = !_4686;
            _4598 = _4698;
            if (!_4700)
            {
                bool _4702 = _4245 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4704 = isnan(_4245);
                bool _4706 = _4702 || _4704;
                bool _4708 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4710 = _4706 || _4708;
                if (!_4710)
                {
                    float _4712 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4714 = _4245 + _4712;
                    float _4716 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4718 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4716;
                    float _4720 = 1.0 / _4718;
                    float _4722 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4724 = _4722 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4726 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4728 = _4726 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4730 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4732 = _4730 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4734 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4736 = _4734 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4738 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4740 = _4738 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4742 = _4714 * _4720;
                    float _4744 = precise::clamp(_4742, 0.0, 1.0);
                    float _4746 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4748 = _4746 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4750 = fma(_4744, _4724, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4752 = fma(_4744, _4748, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4754 = fma(_4744, _4728, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4756 = fma(_4744, _4732, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4758 = fma(_4744, _4736, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4760 = fma(_4744, _4740, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4584 = _4752;
                    _4614 = _4758;
                    _4506 = _4750;
                    _4524 = _4756;
                    _4556 = _4754;
                    _4598 = _4760;
                    _4676 = true;
                }
                else
                {
                    _4584 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4614 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4506 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4524 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4556 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4598 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4676 = false;
    float _4762 = _4584;
    float _4764 = _4614;
    float _4766 = _4506;
    float _4768 = _4524;
    float _4770 = _4556;
    float _4772 = _4598;
    float _4774 = fma(_3567, -0.5, 0.5);
    float _4776 = precise::clamp(_4774, 0.0, 1.0);
    float _4778 = -_4762;
    float _4780 = _4778 + _4764;
    float _4782 = _4578 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4784 = -_4766;
    float _4786 = _4784 + _4768;
    out.m_113.x = 0.0;
    float _4788 = fma(_4776, _4780, _4762);
    float _4790 = fma(_4776, _4786, _4766);
    out.m_53.x = _4782;
    float _4792 = -_4770;
    float _4794 = _4792 + _4772;
    float _4796 = _4788 * 0.586610972881317138671875;
    bool _4798 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4800 = fma(_4776, _4794, _4770);
    float _4802 = fma(_4790, 0.298911988735198974609375, _4796);
    bool _4804 = _4033 > 0.0;
    bool _4806 = isnan(_4033);
    bool _4808 = _4804 || _4806;
    bool _4810 = isnan(0.0);
    bool _4812 = _4808 || _4810;
    float _4814 = fma(_4800, 0.114477999508380889892578125, _4802);
    bool _4816 = _4091 <= 0.0;
    bool _4818 = !_4812;
    bool _4820 = _4816 || _4818;
    float _4822 = -_4814;
    float _4824 = _4790 + _4822;
    float _4826 = -_4814;
    float _4828 = _4788 + _4826;
    float _4830 = -_4814;
    float _4832 = _4800 + _4830;
    float _4834 = fma(_4824, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4814);
    float _4836 = fma(_4828, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4814);
    float _4838 = fma(_4832, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4814);
    bool _4840 = !_4798;
    if (!_4840)
    {
        float _4842 = -_3963;
        float _4844 = _4842 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4846 = -_3965;
        float _4848 = _4846 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4850 = -_3967;
        float _4852 = _4850 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4854 = _4844 * _4844;
        float _4856 = fma(_4848, _4848, _4854);
        float _4858 = fma(_4852, _4852, _4856);
        float _4860 = sqrt(_4858);
        float _4862 = rsqrt(_4858);
        float _4864 = -_4860;
        float _4866 = _4864 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4868 = _4866 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4870 = precise::clamp(_4868, 0.0, 1.0);
        float _4872 = _4848 * _4862;
        float _4874 = _4844 * _4862;
        float _4876 = abs(_4870);
        float _4878 = log2(_4876);
        float _4880 = _4852 * _4862;
        float _4882 = _4872 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4884 = _3567 * _4874;
        float _4886 = -_4874;
        float _4888 = -_4882;
        float _4890 = fma(_4886, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4888);
        float _4892 = fma(_3563, _4872, _4884);
        float _4894 = -_4880;
        float _4896 = fma(_4894, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4890);
        float _4898 = fma(_3573, _4880, _4892);
        float _4900 = precise::clamp(_4898, 0.0, 1.0);
        float _4902 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4904 = _4896 + _4902;
        float _4906 = _4878 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4908 = _4904 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4910 = precise::clamp(_4908, 0.0, 1.0);
        float _4912 = exp2(_4906);
        float _4914 = _4912 * _4910;
        float _4916 = _4900 * _4914;
        float _4918 = _4916 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4920 = _4916 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4922 = _4916 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _4918;
        out.m_113.y = _4920;
        out.m_113.z = _4922;
    }
    out.m_81.x = _4834;
    out.m_81.y = _4836;
    out.m_81.z = _4838;
    if (!_4820)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _4924 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4924;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

