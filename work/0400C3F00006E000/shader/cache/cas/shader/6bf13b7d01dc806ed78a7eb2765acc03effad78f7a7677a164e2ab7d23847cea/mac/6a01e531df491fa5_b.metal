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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
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
    float4 m_65 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_85 [[user(locn4)]];
    float4 m_87 [[user(locn5)]];
    float4 m_95 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_101 [[user(locn9)]];
    float4 m_105 [[user(locn10)]];
    float4 m_103 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_99 [[user(locn13)]];
    float4 m_111 [[user(locn14)]];
    float4 m_107 [[user(locn15)]];
    float4 m_109 [[user(locn16)]];
    float4 m_113 [[user(locn17)]];
    float4 m_69 [[user(locn18)]];
    float4 m_71 [[user(locn19)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_97 [[attribute(0)]];
    float4 m_55 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_79 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_91 [[attribute(8)]];
    float4 m_89 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
    float4 m_63 [[attribute(11)]];
    float4 m_93 [[attribute(12)]];
    float4 m_75 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _7118 = false;
    bool _1806 = false;
    bool _1482 = false;
    bool _1164 = false;
    bool _846 = false;
    bool _704 = false;
    bool _590 = false;
    bool _474 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_46.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (!_136)
    {
        out.m_49.x = 0.0;
    }
    int _142 = 0;
    if (!_136)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7416 = as_type<float>(_146);
        out.gl_Position.z = _7416;
    }
    if (!_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_51.w;
    bool _152 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_150;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _166 = 0.0;
    float _168 = _164;
    if (_160)
    {
        float _170 = float(_132);
        _166 = _170;
    }
    float _172 = _166;
    bool _174 = _164 >= _172;
    bool _176 = !_160;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_49.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _148 = as_type<int>(_184);
    }
    int _186 = _148;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7486 = as_type<float>(_186);
        out.gl_Position.z = _7486;
    }
    if (_178)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _188 = in.m_53.x;
    float _190 = in.m_53.y;
    float _192 = in.m_53.z;
    bool _194 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _196 = in.m_55.x;
    float _198 = in.m_55.y;
    float _200 = in.m_55.z;
    float _202 = in.m_57.x;
    float _204 = in.m_57.y;
    float _206 = in.m_57.z;
    float _208 = in.m_59.x;
    float _210 = in.m_59.y;
    float _212 = in.m_59.z;
    float _214 = _190 * _198;
    float _216 = _190 * _204;
    float _218 = fma(_188, _196, _214);
    float _220 = _190 * _210;
    float _222 = fma(_188, _202, _216);
    float _224 = fma(_192, _200, _218);
    float _226 = fma(_188, _208, _220);
    float _228 = fma(_192, _206, _222);
    float _230 = fma(_192, _212, _226);
    bool _232 = !_194;
    float _250;
    if (!_232)
    {
        float _234 = in.m_61.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_132);
        float _256 = 1.0 / _254;
        float _258 = _164 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _260 + _266;
    bool _270 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _272 = isnan(_260);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = _260 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = 1.0 / _284;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _302 = 1.0 / _296;
    float _304 = 1.0 / _292;
    float _306 = _264 * _298;
    bool _308 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_260);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -_280;
    float _322 = _320 + 1.0;
    float _324 = _318 * _322;
    float _326 = _268 * _302;
    bool _328 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _330 = isnan(_260);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _340;
    bool _344 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _346 = isnan(_260);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _360 = -_318;
    float _362 = _360 + 1.0;
    float _364 = -_338;
    float _366 = _364 + 1.0;
    float _368 = _288 * _304;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _374;
    float _378 = _354 * _366;
    float _380 = fma(_342, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _382 = fma(_372, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _384 = fma(_376, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _386 = _338 * _362;
    float _388 = -_354;
    float _390 = _388 + 1.0;
    float _392 = _382 * _378;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = _384 * _378;
    float _404 = _380 * _378;
    float _406 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].x, _392);
    float _408 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _410 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].z, _404);
    float _412 = fma(_358, _326, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _414 = fma(_396, _326, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = fma(_400, _326, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _426;
    float _430 = fma(_412, _386, _406);
    float _432 = fma(_420, _306, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _434 = fma(_424, _306, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _436 = fma(_428, _306, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _438 = fma(_414, _386, _408);
    float _440 = fma(_416, _386, _410);
    float _442 = fma(_432, _324, _430);
    float _444 = fma(_434, _324, _438);
    float _446 = fma(_436, _324, _440);
    float _448 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[146].x, _442);
    float _450 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[146].y, _444);
    float _452 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[146].z, _446);
    bool _454 = !_300;
    float _472;
    if (!_454)
    {
        float _456 = in.m_61.x;
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _460 = _456 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _464 = _462 * _458;
        float _466 = floor(_464);
        float _468 = -_466;
        float _470 = _464 + _468;
        _472 = _470;
        _474 = true;
    }
    else
    {
        float _476 = float(_132);
        float _478 = 1.0 / _476;
        float _480 = _164 * _478;
        _472 = _480;
    }
    _474 = false;
    float _482 = _472;
    float _484 = in.m_63.x;
    float _486 = in.m_63.y;
    float _488 = in.m_63.z;
    bool _490 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _492 = isnan(_482);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _506 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _508 = isnan(_482);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _524 = _482 + _522;
    float _526 = -_500;
    float _528 = _526 + 1.0;
    bool _530 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _532 = 1.0 / _504;
    float _534 = _516 * _528;
    float _536 = -_516;
    float _538 = _536 + 1.0;
    float _540 = _520 * _532;
    float _542 = fma(_540, _524, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _546 = _542 * _534;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _550 = _544 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _552 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[115].x, _546);
    float _554 = _448 * _484;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _558 = _548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _560 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[116].x, _552);
    float _562 = _450 * _486;
    float _564 = _556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = _452 * _488;
    float _568 = _560 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_65.x = _564;
    out.m_65.y = _558;
    out.m_65.z = _550;
    out.m_65.w = _568;
    bool _570 = !_530;
    float _588;
    if (!_570)
    {
        float _572 = in.m_61.x;
        float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _576 = _572 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[11].z, _164);
        float _580 = _578 * _574;
        float _582 = floor(_580);
        float _584 = -_582;
        float _586 = _580 + _584;
        _588 = _586;
        _590 = true;
    }
    else
    {
        float _592 = float(_132);
        float _594 = 1.0 / _592;
        float _596 = _164 * _594;
        _588 = _596;
    }
    _590 = false;
    float _598 = _588;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _602 = _598 + _600;
    bool _604 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _606 = isnan(_598);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _616;
    bool _620 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _622 = isnan(_598);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -_614;
    float _634 = _632 + 1.0;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _636;
    float _640 = 1.0 / _618;
    bool _642 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _644 = _630 * _634;
    float _646 = -_630;
    float _648 = _646 + 1.0;
    float _650 = _602 * _640;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _652;
    float _656 = fma(_638, _650, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _658;
    float _662 = fma(_654, _650, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _664 = _656 * _644;
    float _666 = fma(_660, _650, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _668 = _662 * _644;
    float _670 = _666 * _644;
    float _672 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[123].x, _664);
    float _674 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[123].y, _670);
    float _676 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[123].z, _668);
    float _678 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[124].x, _672);
    float _680 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[124].y, _674);
    float _682 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[124].z, _676);
    bool _684 = !_642;
    float _702;
    if (!_684)
    {
        float _686 = in.m_61.x;
        float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _690 = _686 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[11].w, _164);
        float _694 = _692 * _688;
        float _696 = floor(_694);
        float _698 = -_696;
        float _700 = _694 + _698;
        _702 = _700;
        _704 = true;
    }
    else
    {
        float _706 = float(_132);
        float _708 = 1.0 / _706;
        float _710 = _164 * _708;
        _702 = _710;
    }
    _704 = false;
    float _712 = _702;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _716 = _712 + _714;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _722 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _724 = isnan(_712);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _738 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _740 = isnan(_712);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _750;
    bool _754 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _756 = isnan(_712);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = 1.0 / _720;
    float _768 = -_732;
    float _770 = _768 + 1.0;
    bool _772 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _774 = _748 * _770;
    float _776 = -_748;
    float _778 = _776 + 1.0;
    float _780 = 1.0 / _736;
    float _782 = _752 * _766;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _788 = fma(_782, _716, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _790 = _786 * _780;
    float _792 = _788 * _774;
    float _794 = -_764;
    float _796 = _794 + 1.0;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _800 = _712 + _798;
    float _802 = _678 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _804 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[131].x, _792);
    float _806 = _732 * _796;
    float _808 = fma(_790, _800, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _810 = _682 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _812 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _814 = fma(_808, _806, _804);
    float _816 = _680 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _818 = _810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _820 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[133].x, _814);
    float _822 = _816 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _824 = _820 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.x = _812;
    out.m_67.y = _822;
    out.m_67.z = _818;
    out.m_67.w = _824;
    bool _826 = !_772;
    float _844;
    if (!_826)
    {
        float _828 = in.m_61.x;
        float _830 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _832 = _828 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _834 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[14].x, _164);
        float _836 = _834 * _830;
        float _838 = floor(_836);
        float _840 = -_838;
        float _842 = _836 + _840;
        _844 = _842;
        _846 = true;
    }
    else
    {
        float _848 = float(_132);
        float _850 = 1.0 / _848;
        float _852 = _164 * _850;
        _844 = _852;
    }
    _846 = false;
    float _854 = _844;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _858 = _854 + _856;
    bool _860 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _862 = isnan(_854);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _876 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _878 = isnan(_854);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _888;
    bool _892 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _894 = isnan(_854);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = -_870;
    float _906 = _904 + 1.0;
    float _908 = 1.0 / _874;
    float _910 = _886 * _906;
    float _912 = -_902;
    float _914 = _912 + 1.0;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _920 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _922 = 1.0 / _918;
    float _924 = _890 * _908;
    float _926 = -_886;
    float _928 = _926 + 1.0;
    bool _930 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _932 = isnan(_854);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = fma(_924, _858, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _944 = _902 * _928;
    bool _946 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _948 = isnan(_854);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = _940 * _914;
    float _960 = -_940;
    float _962 = _960 + 1.0;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _966 = _964 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _968 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _970 = isnan(_854);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    float _980 = _956 * _962;
    float _982 = -_956;
    float _984 = _982 + 1.0;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _990 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _992 = isnan(_854);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = 1.0 / _966;
    float _1004 = _978 * _984;
    float _1006 = -_978;
    float _1008 = _1006 + 1.0;
    float _1010 = 1.0 / _988;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1016 = _1000 * _1008;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1022 = _1014 * _922;
    float _1024 = _942 * _1016;
    float _1026 = -_1000;
    float _1028 = _1026 + 1.0;
    float _1030 = 1.0 / _1020;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1038 = _854 + _1036;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1040;
    float _1044 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1024);
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1050 = fma(_1022, _1038, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1052 = _1042 * _1002;
    float _1054 = 1.0 / _1034;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1058 = _854 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1064 = fma(_1050, _1004, _1044);
    float _1066 = fma(_1052, _1058, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1070 = _854 + _1068;
    float _1072 = _1062 * _1010;
    float _1074 = 1.0 / _1048;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1082 = _1080 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1084 = fma(_1066, _980, _1064);
    float _1086 = _1078 * _1030;
    float _1088 = fma(_1072, _1070, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1092 = _854 + _1090;
    float _1094 = _1082 * _1054;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1096;
    bool _1100 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1102 = isnan(_854);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1114 = _854 + _1112;
    float _1116 = fma(_1086, _1092, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1118 = fma(_1088, _958, _1084);
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1122 = _854 + _1120;
    float _1124 = fma(_1094, _1114, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1126 = _1098 * _1074;
    float _1128 = -_1110;
    float _1130 = _1128 + 1.0;
    float _1132 = fma(_1116, _944, _1118);
    float _1134 = fma(_1126, _1122, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1136 = _870 * _1130;
    float _1138 = fma(_1124, _910, _1132);
    float _1140 = fma(_1134, _1136, _1138);
    float _1142 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1140);
    out.m_69.x = _1142;
    bool _1144 = !_920;
    float _1162;
    if (!_1144)
    {
        float _1146 = in.m_61.x;
        float _1148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1150 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1152 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[14].y, _164);
        float _1154 = _1152 * _1148;
        float _1156 = floor(_1154);
        float _1158 = -_1156;
        float _1160 = _1154 + _1158;
        _1162 = _1160;
        _1164 = true;
    }
    else
    {
        float _1166 = float(_132);
        float _1168 = 1.0 / _1166;
        float _1170 = _164 * _1168;
        _1162 = _1170;
    }
    _1164 = false;
    float _1172 = _1162;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1176 = _1172 + _1174;
    bool _1178 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1180 = isnan(_1172);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1192 = _1190 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1194 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1196 = isnan(_1172);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1206;
    bool _1210 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1212 = isnan(_1172);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    float _1222 = -_1188;
    float _1224 = _1222 + 1.0;
    float _1226 = 1.0 / _1192;
    float _1228 = _1204 * _1224;
    float _1230 = -_1220;
    float _1232 = _1230 + 1.0;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1236 = _1234 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1240 = 1.0 / _1236;
    float _1242 = _1208 * _1226;
    float _1244 = -_1204;
    float _1246 = _1244 + 1.0;
    bool _1248 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1250 = isnan(_1172);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1256 = _1252 || _1254;
    float _1258 = float(_1256);
    float _1260 = fma(_1242, _1176, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1262 = _1220 * _1246;
    bool _1264 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1266 = isnan(_1172);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = _1258 * _1232;
    float _1278 = -_1258;
    float _1280 = _1278 + 1.0;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1286 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1288 = isnan(_1172);
    bool _1290 = _1286 || _1288;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1294 = _1290 || _1292;
    float _1296 = float(_1294);
    float _1298 = _1274 * _1280;
    float _1300 = -_1274;
    float _1302 = _1300 + 1.0;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1306 = _1304 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1308 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1310 = isnan(_1172);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    float _1320 = 1.0 / _1284;
    float _1322 = _1296 * _1302;
    float _1324 = -_1296;
    float _1326 = _1324 + 1.0;
    float _1328 = 1.0 / _1306;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1332 = _1330 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1334 = _1318 * _1326;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1338 = _1336 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1340 = _1332 * _1240;
    float _1342 = _1260 * _1334;
    float _1344 = -_1318;
    float _1346 = _1344 + 1.0;
    float _1348 = 1.0 / _1338;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1356 = _1172 + _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1358;
    float _1362 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1342);
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1366 = _1364 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1368 = fma(_1340, _1356, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1370 = _1360 * _1320;
    float _1372 = 1.0 / _1352;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1376 = _1172 + _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1380 = _1378 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1382 = fma(_1368, _1322, _1362);
    float _1384 = fma(_1370, _1376, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1388 = _1172 + _1386;
    float _1390 = _1380 * _1328;
    float _1392 = 1.0 / _1366;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1400 = _1398 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1402 = fma(_1384, _1298, _1382);
    float _1404 = _1396 * _1348;
    float _1406 = fma(_1390, _1388, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1410 = _1172 + _1408;
    float _1412 = _1400 * _1372;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1414;
    bool _1418 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1420 = isnan(_1172);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1426 = _1422 || _1424;
    float _1428 = float(_1426);
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1432 = _1172 + _1430;
    float _1434 = fma(_1404, _1410, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1436 = fma(_1406, _1276, _1402);
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1440 = _1172 + _1438;
    float _1442 = fma(_1412, _1432, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1444 = _1416 * _1392;
    float _1446 = -_1428;
    float _1448 = _1446 + 1.0;
    float _1450 = fma(_1434, _1262, _1436);
    float _1452 = fma(_1444, _1440, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1454 = _1188 * _1448;
    float _1456 = fma(_1442, _1228, _1450);
    float _1458 = fma(_1452, _1454, _1456);
    float _1460 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1458);
    out.m_71.x = _1460;
    bool _1462 = !_1238;
    float _1480;
    if (!_1462)
    {
        float _1464 = in.m_61.x;
        float _1466 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1468 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1470 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[14].z, _164);
        float _1472 = _1470 * _1466;
        float _1474 = floor(_1472);
        float _1476 = -_1474;
        float _1478 = _1472 + _1476;
        _1480 = _1478;
        _1482 = true;
    }
    else
    {
        float _1484 = float(_132);
        float _1486 = 1.0 / _1484;
        float _1488 = _164 * _1486;
        _1480 = _1488;
    }
    _1482 = false;
    float _1490 = _1480;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1494 = _1490 + _1492;
    bool _1496 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1498 = isnan(_1490);
    bool _1500 = _1496 || _1498;
    bool _1502 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1504 = _1500 || _1502;
    float _1506 = float(_1504);
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1510 = _1508 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1512 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1514 = isnan(_1490);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1524;
    bool _1528 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1530 = isnan(_1490);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    float _1540 = -_1506;
    float _1542 = _1540 + 1.0;
    float _1544 = 1.0 / _1510;
    float _1546 = _1522 * _1542;
    float _1548 = -_1538;
    float _1550 = _1548 + 1.0;
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1554 = _1552 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].w;
    float _1558 = 1.0 / _1554;
    float _1560 = _1526 * _1544;
    float _1562 = -_1522;
    float _1564 = _1562 + 1.0;
    bool _1566 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1568 = isnan(_1490);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1574 = _1570 || _1572;
    float _1576 = float(_1574);
    float _1578 = fma(_1560, _1494, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1580 = _1538 * _1564;
    bool _1582 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1584 = isnan(_1490);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = _1576 * _1550;
    float _1596 = -_1576;
    float _1598 = _1596 + 1.0;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1602 = _1600 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1604 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1606 = isnan(_1490);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    float _1616 = _1592 * _1598;
    float _1618 = -_1592;
    float _1620 = _1618 + 1.0;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1624 = _1622 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1626 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1628 = isnan(_1490);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1634 = _1630 || _1632;
    float _1636 = float(_1634);
    float _1638 = 1.0 / _1602;
    float _1640 = _1614 * _1620;
    float _1642 = -_1614;
    float _1644 = _1642 + 1.0;
    float _1646 = 1.0 / _1624;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1652 = _1636 * _1644;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1658 = _1650 * _1558;
    float _1660 = _1578 * _1652;
    float _1662 = -_1636;
    float _1664 = _1662 + 1.0;
    float _1666 = 1.0 / _1656;
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1670 = _1668 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1674 = _1490 + _1672;
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1676;
    float _1680 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1660);
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1684 = _1682 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1686 = fma(_1658, _1674, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1688 = _1678 * _1638;
    float _1690 = 1.0 / _1670;
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1694 = _1490 + _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1698 = _1696 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1700 = fma(_1686, _1640, _1680);
    float _1702 = fma(_1688, _1694, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1706 = _1490 + _1704;
    float _1708 = _1698 * _1646;
    float _1710 = 1.0 / _1684;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1712;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1718 = _1716 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1720 = fma(_1702, _1616, _1700);
    float _1722 = _1714 * _1666;
    float _1724 = fma(_1708, _1706, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1726 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1728 = _1490 + _1726;
    float _1730 = _1718 * _1690;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1732;
    bool _1736 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1738 = isnan(_1490);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1744 = _1740 || _1742;
    float _1746 = float(_1744);
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1750 = _1490 + _1748;
    float _1752 = fma(_1722, _1728, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1754 = fma(_1724, _1594, _1720);
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1758 = _1490 + _1756;
    float _1760 = fma(_1730, _1750, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1762 = _1734 * _1710;
    float _1764 = -_1746;
    float _1766 = _1764 + 1.0;
    float _1768 = fma(_1752, _1580, _1754);
    float _1770 = fma(_1762, _1758, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1772 = _1506 * _1766;
    float _1774 = fma(_1760, _1546, _1768);
    float _1776 = fma(_1770, _1772, _1774);
    float _1778 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1776);
    out.m_73.x = _1778;
    bool _1780 = !_1556;
    float _1782 = _1710;
    float _1784 = _1646;
    int _1786 = as_type<int>(_1690);
    float _1804;
    if (!_1780)
    {
        float _1788 = in.m_61.x;
        float _1790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].w;
        float _1792 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[15].w;
        float _1794 = fma(_1792, (*spvDescriptorSet0.vp_c9)._m0[14].w, _164);
        float _1796 = _1794 * _1790;
        float _1798 = floor(_1796);
        float _1800 = -_1798;
        float _1802 = _1796 + _1800;
        _1804 = _1802;
        _1806 = true;
    }
    else
    {
        float _1808 = float(_132);
        float _1810 = 1.0 / _1808;
        float _1812 = _164 * _1810;
        _1804 = _1812;
    }
    _1806 = false;
    float _1814 = _1804;
    float _1816 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1818 = int(_1816);
    float _1820 = float(_132);
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1824 = _1822 != 0;
    float _1826 = in.m_75.x;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1830 = _1828 != 0;
    float _1832 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1834 = int(_1832);
    int _1836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1838 = _1836 != 0;
    float _1840 = 0.0;
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _1844 = _1826;
    if (_1824)
    {
        _1840 = 1.0;
    }
    float _1846 = _1840;
    float _1848 = float(_1818);
    float _1850 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1852 = int(_1850);
    float _1854 = 0.0;
    float _1856 = _1846;
    if (_1824)
    {
        _1854 = 1.0;
    }
    float _1858 = _1854;
    float _1860 = _1746;
    float _1862 = _1858;
    if (_1830)
    {
        float _1864 = in.m_61.z;
        _1860 = _1864;
    }
    float _1866 = _1860;
    float _1868 = 0.0;
    if (_1824)
    {
        _1868 = 1.0;
    }
    float _1870 = _1868;
    int _1872 = 0;
    float _1874 = _1870;
    if (_1824)
    {
        _1872 = 0;
    }
    int _1876 = _1872;
    float _1878 = float(uint(_1834));
    float _1880 = 1.0 / _1848;
    float _1882 = float(_1834);
    float _1884 = _1720;
    int _1886 = _1876;
    if (_1838)
    {
        float _1888 = in.m_61.x;
        _1884 = _1888;
    }
    float _1890 = _1884;
    int _1892 = ~_1834;
    int _1894 = _1892 + 1;
    int _1896 = _1894;
    if (_1824)
    {
        _1842 = 0;
    }
    int _1898 = _1842;
    float _1900 = 1.0 / _1820;
    float _1902 = _1882 * _164;
    float _1904 = float(_1852);
    float _1906 = _1880 * _164;
    float _1908 = 1.0 / _1878;
    bool _1910 = false;
    int _1912 = _1898;
    if (_1830)
    {
        bool _1914 = _1866 > 0.5;
        _1910 = _1914;
    }
    bool _1916 = _1910;
    float _1918 = _1902 * _1900;
    float _1920 = trunc(_1906);
    int _1922 = int(_1920);
    bool _1924 = false;
    float _1926 = _1890;
    if (_1838)
    {
        bool _1928 = _1890 > 0.5;
        _1924 = _1928;
    }
    bool _1930 = _1924;
    if (!_1838)
    {
        _1926 = _1826;
    }
    float _1932 = _1926;
    float _1934 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1936 = int(_1934);
    int _1938 = as_type<int>(_1908) + (-2);
    float _1940 = in.m_61.y;
    float _1942 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1944 = int(_1942);
    float _1946 = float(uint(_1922));
    float _1948 = as_type<float>(_1938) * _1946;
    float _1950 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1952 = int(_1950);
    float _1954 = float(_1936);
    float _1956 = _1946;
    float _1958 = _1932;
    if (_1824)
    {
        float _1960 = in.m_61.x;
        _1956 = _1960;
    }
    float _1962 = _1956;
    float _1964 = 1.0 / _1904;
    float _1966 = float(_1944);
    int _1968 = 0;
    if (_1824)
    {
        _1968 = as_type<int>(_1940);
    }
    int _1970 = _1968;
    float _1972 = trunc(_1948);
    float _1974 = precise::max(_1972, 0.0);
    uint _1977 = uint(_1974);
    float _1979 = float(uint(_1952));
    float _1981 = in.m_61.w;
    float _1983 = 1.0 / _1954;
    float _1985 = _1962;
    int _1987 = _1970;
    if (_1824)
    {
        _1782 = _1962;
    }
    float _1989 = _1782;
    float _1991 = _1989;
    if (_1824)
    {
        _1784 = _1989;
    }
    float _1993 = _1784;
    float _1995 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1997 = int(_1995);
    int _1999 = 0;
    float _2001 = _1993;
    if (_1824)
    {
        _1999 = as_type<int>(_1989);
    }
    int _2003 = _1999;
    float _2005 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2007 = int(_2005);
    float _2009 = _1983 * _164;
    float _2011 = _1983;
    int _2013 = _2003;
    if (_1824)
    {
        float _2015 = in.m_61.z;
        _2011 = _2015;
    }
    float _2017 = _2011;
    float _2019 = 1.0 / _1966;
    float _2021 = float(uint(_1997));
    int _2023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2025 = _2023 != 0;
    float _2027 = 1.0 / _1979;
    float _2029 = float(uint(_2007));
    float _2031 = _2019 * _164;
    float _2033 = _1964 * _164;
    float _2035 = 1.0 / _2021;
    int _2037 = as_type<int>(_2019);
    if (_1838)
    {
        float _2039 = -_1826;
        float _2041 = _2039 + 1.0;
        _2037 = as_type<int>(_2041);
    }
    int _2043 = _2037;
    int _2045 = _2043;
    if (_1830)
    {
        float _2047 = -_1826;
        float _2049 = _2047 + 1.0;
        _1896 = as_type<int>(_2049);
    }
    int _2051 = _1896;
    int _2053 = 0;
    float _2055 = _2017;
    float _2057 = as_type<float>(_2051);
    if (_1824)
    {
        _2053 = as_type<int>(_2017);
    }
    int _2059 = _2053;
    int _2061 = _1894 * int(_1977);
    int _2063 = _2061 + _1922;
    float _2065 = 1.0 / _2029;
    float _2067 = float(uint(_2063));
    float _2069 = as_type<float>(_1938) * _2067;
    float _2071 = _2067;
    int _2073 = _2059;
    if (!_1830)
    {
        _2071 = _1826;
    }
    float _2075 = _2071;
    float _2077 = trunc(_1918);
    int _2079 = int(_2077);
    float _2081 = trunc(_2009);
    int _2083 = int(_2081);
    float _2085 = trunc(_2033);
    int _2087 = int(_2085);
    float _2089 = trunc(_2031);
    int _2091 = int(_2089);
    float _2093 = trunc(_2069);
    float _2095 = precise::max(_2093, 0.0);
    uint _2097 = uint(_2095);
    float _2099 = _2075;
    if (!_1824)
    {
        float _2101 = in.m_61.x;
        float _2103 = _1940 * 3.1415927410125732421875;
        float _2105 = in.m_61.z;
        float _2107 = _2103 * 0.15915493667125701904296875;
        float _2109 = _2107 * 6.283185482025146484375;
        float _2111 = sin(_2109);
        float _2113 = _2101 * 3.1415927410125732421875;
        float _2115 = _2113 * 0.15915493667125701904296875;
        float _2117 = _2105 * 3.1415927410125732421875;
        float _2119 = _2117 * 0.15915493667125701904296875;
        float _2121 = _2115 * 6.283185482025146484375;
        float _2123 = sin(_2121);
        float _2125 = _2119 * 6.283185482025146484375;
        float _2127 = sin(_2125);
        _1985 = _2101;
        _1856 = 7.345489978790283203125;
        _1991 = _1940;
        _1862 = 1.2345600128173828125;
        _1886 = 1;
        _2001 = _2105;
        _1874 = 5.839270114898681640625;
        _2055 = _2105;
        _1912 = 2;
        _2073 = as_type<int>(_2127);
        _1987 = as_type<int>(_2111);
        _2013 = as_type<int>(_2123);
    }
    float _2129 = _1985;
    float _2131 = _1856;
    float _2133 = _1991;
    float _2135 = _1862;
    int _2137 = _1886;
    float _2139 = _2001;
    float _2141 = _1874;
    float _2143 = _2055;
    int _2145 = _1912;
    int _2147 = _2073;
    int _2149 = _1987;
    int _2151 = _2013;
    float _2153 = _2129 * _2131;
    int _2155 = ~_1834;
    int _2157 = _2155 + 1;
    float _2159 = _2133 * _2135;
    int _2161 = int(_1977) + int(_2097);
    float _2163 = floor(_2153);
    float _2165 = float(_1922);
    float _2167 = _1900 * _164;
    if (_1838)
    {
        float _2169 = _1930 ? as_type<float>(_2043) : _1826;
        _1958 = _2169;
    }
    float _2171 = _1958;
    if (_2025)
    {
        float _2173 = -_1826;
        float _2175 = _2173 + 1.0;
        _2045 = as_type<int>(_2175);
    }
    int _2177 = _2045;
    bool _2179 = _1940 > 0.5;
    int _2181 = _2157 * _2161;
    int _2183 = _2181 + _1922;
    int _2185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2187 = _2185 != 0;
    float _2189 = floor(_2159);
    bool _2191 = _2165 >= _1882;
    bool _2193 = isnan(_2165);
    bool _2195 = _2191 || _2193;
    bool _2197 = isnan(_1882);
    bool _2199 = _2195 || _2197;
    float _2201 = float(_2199);
    bool _2203 = _2137 != 1;
    float _2205 = as_type<float>(_2177);
    if (_1830)
    {
        float _2207 = _1916 ? as_type<float>(_2051) : _1826;
        _2099 = _2207;
    }
    float _2209 = _2099;
    float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _2213 = _1814 + _2211;
    if (!_2025)
    {
        _2057 = _1826;
    }
    float _2215 = _2057;
    float _2217 = _2215;
    if (_2025)
    {
        float _2219 = _2179 ? as_type<float>(_2177) : _1826;
        _2217 = _2219;
    }
    float _2221 = _2217;
    float _2223 = trunc(_2201);
    int _2225 = int(_2223);
    int _2227 = as_type<int>(_2035) + (-2);
    float _2229 = -_2163;
    float _2231 = _2153 + _2229;
    float _2233 = float(uint(_2083));
    if (_2187)
    {
        float _2235 = -_1826;
        float _2237 = _2235 + 1.0;
        _1786 = as_type<int>(_2237);
    }
    int _2239 = _1786;
    int _2241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2243 = _2241 != 0;
    float _2245 = _2231 * _1882;
    bool _2247 = uint(_2183) >= uint(_1834);
    float _2249 = as_type<float>(_2227) * _2233;
    int _2251 = as_type<int>(_2027) + (-2);
    float _2253 = -_2189;
    float _2255 = _2159 + _2253;
    bool _2257 = !_2247;
    int _2259 = _2257 ? 0 : (-1);
    float _2261 = trunc(_2245);
    int _2263 = int(_2261);
    if (!_2187)
    {
        _2205 = _1826;
    }
    float _2265 = _2205;
    int _2267 = ~_2161;
    int _2269 = _2267 + _2259;
    int _2271 = _2269 + 1;
    float _2273 = float(uint(_2087));
    int _2275 = 0;
    float _2277 = _2265;
    if (_2243)
    {
        float _2279 = -_1826;
        float _2281 = _2279 + 1.0;
        _2275 = as_type<int>(_2281);
    }
    int _2283 = _2275;
    if (_2187)
    {
        float _2285 = _2179 ? as_type<float>(_2239) : _1826;
        _2277 = _2285;
    }
    float _2287 = _2277;
    float _2289 = trunc(_2249);
    float _2291 = precise::max(_2289, 0.0);
    uint _2293 = uint(_2291);
    int _2295 = _1834 * _2271;
    int _2297 = _2295 + _1922;
    bool _2299 = _1834 == 0;
    float _2301 = as_type<float>(_2251) * _2273;
    int _2303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2305 = _2303 != 0;
    float _2307 = _2139 * _2141;
    if (_2243)
    {
        float _2309 = _2179 ? as_type<float>(_2283) : _1826;
        _1844 = _2309;
    }
    float _2311 = _1844;
    float _2313 = trunc(_2301);
    float _2315 = precise::max(_2313, 0.0);
    uint _2317 = uint(_2315);
    bool _2319 = !_2305;
    int _2321 = _2319 ? 0 : 1;
    int _2323 = ~_2225;
    int _2325 = _2323 + 1;
    int _2327 = _2325 + 1;
    bool _2329 = !_2299;
    int _2331 = _2329 ? _2297 : (-1);
    int _2333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _2335 = _2333 != 0;
    int _2337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _2339 = _2337 != 0;
    int _2341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2343 = _2341 != 0;
    float _2345 = floor(_2307);
    int _2347 = ~_1997;
    int _2349 = _2347 + 1;
    int _2351 = _2331 * _2327;
    int _2353 = abs(_2321);
    float _2355 = _2133 * _2131;
    bool _2357 = !_2339;
    int _2359 = _2357 ? 0 : 1;
    int _2361 = _2349 * int(_2293);
    int _2363 = _2361 + _2083;
    int _2365 = _1834 + (-1);
    int _2367 = _2263 * _2353;
    int _2369 = _2367 + _1922;
    int _2371 = abs(_2359);
    float _2373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _2375 = as_type<int>(_2065) + (-2);
    int _2377 = _2225 * _2365;
    int _2379 = _2377 + _2351;
    float _2381 = float(uint(_2091));
    float _2383 = float(uint(_2363));
    float _2385 = as_type<float>(_2375) * _2381;
    bool _2387 = !_2335;
    int _2389 = _2387 ? 0 : 1;
    float _2391 = as_type<float>(_2227) * _2383;
    int _2393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2395 = _2393 != 0;
    int _2397 = _2379 * _2371;
    int _2399 = abs(_2389);
    float _2401 = trunc(_2391);
    float _2403 = precise::max(_2401, 0.0);
    uint _2405 = uint(_2403);
    bool _2407 = !_2343;
    int _2409 = _2407 ? 0 : 1;
    int _2411 = ~_1952;
    int _2413 = _2411 + 1;
    int _2415 = _2079 * _2399;
    int _2417 = _2415 + _2397;
    int _2419 = abs(_2409);
    float _2421 = -_2345;
    float _2423 = _2307 + _2421;
    bool _2425 = !_2395;
    int _2427 = _2425 ? 0 : 1;
    float _2429 = trunc(_2385);
    float _2431 = precise::max(_2429, 0.0);
    uint _2433 = uint(_2431);
    int _2435 = ~_2007;
    int _2437 = _2435 + 1;
    int _2439 = abs(_2427);
    int _2441 = _2413 * int(_2317);
    int _2443 = _2441 + _2087;
    float _2445 = floor(_2355);
    int _2447 = _2369 * _2419;
    int _2449 = _2447 + _2417;
    int _2451 = int(_2293) + int(_2405);
    float _2453 = float(uint(_2443));
    int _2455 = _2437 * int(_2433);
    int _2457 = _2455 + _2091;
    float _2459 = float(_2083);
    int _2461 = _2263 * _2439;
    int _2463 = _2461 + _2449;
    float _2465 = float(_1997);
    float _2467 = float(uint(_2457));
    float _2469 = float(_2007);
    float _2471 = -_2445;
    float _2473 = _2355 + _2471;
    float _2475 = as_type<float>(_2251) * _2453;
    float _2477 = as_type<float>(_2375) * _2467;
    float _2479 = float(_1952);
    float _2481 = _2465 * _2255;
    float _2483 = trunc(_2475);
    float _2485 = precise::max(_2483, 0.0);
    uint _2487 = uint(_2485);
    float _2489 = float(_2087);
    float _2491 = _2465 * _2167;
    float _2493 = float(_2091);
    float _2495 = _2479 * _2423;
    bool _2497 = _2459 >= _2465;
    bool _2499 = isnan(_2459);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan(_2465);
    bool _2505 = _2501 || _2503;
    float _2507 = float(_2505);
    float _2509 = _2479 * _2167;
    int _2511 = ~_1997;
    int _2513 = _2511 + 1;
    float _2515 = trunc(_2477);
    float _2517 = precise::max(_2515, 0.0);
    uint _2519 = uint(_2517);
    float _2521 = float(uint(_2463));
    float _2523 = _2469 * _2167;
    bool _2525 = _2489 >= _2479;
    bool _2527 = isnan(_2489);
    bool _2529 = _2525 || _2527;
    bool _2531 = isnan(_2479);
    bool _2533 = _2529 || _2531;
    float _2535 = float(_2533);
    int _2537 = _2513 * _2451;
    int _2539 = _2537 + _2083;
    bool _2541 = _2493 >= _2469;
    bool _2543 = isnan(_2493);
    bool _2545 = _2541 || _2543;
    bool _2547 = isnan(_2469);
    bool _2549 = _2545 || _2547;
    float _2551 = float(_2549);
    float _2553 = _2469 * _2473;
    int _2555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2557 = _2555 != 0;
    float _2559 = trunc(_2481);
    int _2561 = int(_2559);
    float _2563 = as_type<float>(_1938) * _2521;
    int _2565 = ~_1952;
    int _2567 = _2565 + 1;
    bool _2569 = !_2557;
    int _2571 = _2569 ? 0 : 1;
    bool _2573 = uint(_2539) >= uint(_1997);
    float _2575 = trunc(_2563);
    float _2577 = precise::max(_2575, 0.0);
    uint _2579 = uint(_2577);
    int _2581 = int(_2317) + int(_2487);
    int _2583 = abs(_2571);
    bool _2585 = !_2573;
    int _2587 = _2585 ? 0 : (-1);
    float _2589 = trunc(_2507);
    int _2591 = int(_2589);
    int _2593 = ~_1834;
    int _2595 = _2593 + 1;
    int _2597 = _2567 * _2581;
    int _2599 = _2597 + _2087;
    int _2601 = ~_2451;
    int _2603 = _2601 + _2587;
    int _2605 = _2603 + 1;
    int _2607 = _2561 * _2583;
    int _2609 = _2607 + _2083;
    int _2611 = int(_2433) + int(_2519);
    bool _2613 = uint(_2599) >= uint(_1952);
    int _2615 = _2595 * int(_2579);
    int _2617 = _2615 + _2463;
    bool _2619 = _1997 == 0;
    int _2621 = _1997 * _2605;
    int _2623 = _2621 + _2083;
    int _2625 = ~_2007;
    int _2627 = _2625 + 1;
    float _2629 = trunc(_2491);
    int _2631 = int(_2629);
    float _2633 = float(uint(_2617));
    int _2635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2637 = _2635 != 0;
    int _2639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2641 = _2639 != 0;
    int _2643 = _2627 * _2611;
    int _2645 = _2643 + _2091;
    int _2647 = ~_2591;
    int _2649 = _2647 + 1;
    int _2651 = _2649 + 1;
    float _2653 = as_type<float>(_1938) * _2633;
    bool _2655 = !_2619;
    int _2657 = _2655 ? _2623 : (-1);
    float _2659 = trunc(_2495);
    int _2661 = int(_2659);
    bool _2663 = !_2641;
    int _2665 = _2663 ? 0 : 1;
    int _2667 = _1997 + (-1);
    int _2669 = _2651 * _2657;
    bool _2671 = !_2637;
    int _2673 = _2671 ? 0 : 1;
    int _2675 = abs(_2665);
    float _2677 = trunc(_2653);
    float _2679 = precise::max(_2677, 0.0);
    uint _2681 = uint(_2679);
    bool _2683 = uint(_2645) >= uint(_2007);
    int _2685 = _2591 * _2667;
    int _2687 = _2685 + _2669;
    int _2689 = abs(_2673);
    bool _2691 = !_2613;
    int _2693 = _2691 ? 0 : (-1);
    float _2695 = trunc(_2535);
    int _2697 = int(_2695);
    int _2699 = _2687 * _2675;
    bool _2701 = !_2683;
    int _2703 = _2701 ? 0 : (-1);
    int _2705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2707 = _2705 != 0;
    int _2709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2711 = _2709 != 0;
    int _2713 = _2631 * _2689;
    int _2715 = _2713 + _2699;
    int _2717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2719 = _2717 != 0;
    float _2721 = trunc(_2551);
    int _2723 = int(_2721);
    int _2725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2727 = _2725 != 0;
    int _2729 = ~_2581;
    int _2731 = _2729 + _2693;
    int _2733 = _2731 + 1;
    bool _2735 = !_2719;
    int _2737 = _2735 ? 0 : 1;
    bool _2739 = !_2727;
    int _2741 = _2739 ? 0 : 1;
    int _2743 = _1952 * _2733;
    int _2745 = _2743 + _2087;
    int _2747 = int(_2579) + int(_2681);
    float _2749 = trunc(_2509);
    int _2751 = int(_2749);
    bool _2753 = !_2707;
    int _2755 = _2753 ? 0 : 1;
    int _2757 = ~_1834;
    int _2759 = _2757 + 1;
    int _2761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2763 = _2761 != 0;
    int _2765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2767 = _2765 != 0;
    float _2769 = trunc(_2523);
    int _2771 = int(_2769);
    int _2773 = abs(_2737);
    int _2775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2777 = _2775 != 0;
    int _2779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2781 = _2779 != 0;
    int _2783 = abs(_2755);
    int _2785 = _2759 * _2747;
    int _2787 = _2785 + _2463;
    int _2789 = ~_2611;
    int _2791 = _2789 + _2703;
    int _2793 = _2791 + 1;
    bool _2795 = !_2763;
    int _2797 = _2795 ? 0 : 1;
    bool _2799 = !_2767;
    int _2801 = _2799 ? 0 : 1;
    int _2803 = _2007 * _2793;
    int _2805 = _2803 + _2091;
    int _2807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2809 = _2807 != 0;
    int _2811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2813 = _2811 != 0;
    bool _2815 = uint(_2787) >= uint(_1834);
    int _2817 = _2661 * _2773;
    int _2819 = _2817 + _2087;
    bool _2821 = !_2711;
    int _2823 = _2821 ? 0 : 1;
    int _2825 = _2609 * _2783;
    int _2827 = _2825 + _2715;
    bool _2829 = !_2815;
    int _2831 = _2829 ? 0 : (-1);
    int _2833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2835 = _2833 != 0;
    int _2837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2839 = _2837 != 0;
    bool _2841 = !_2809;
    int _2843 = _2841 ? 0 : 1;
    int _2845 = abs(_2823);
    bool _2847 = _1952 == 0;
    int _2849 = ~_2697;
    int _2851 = _2849 + 1;
    int _2853 = _2851 + 1;
    int _2855 = _2561 * _2845;
    int _2857 = _2855 + _2827;
    bool _2859 = !_2847;
    int _2861 = _2859 ? _2745 : (-1);
    bool _2863 = !_2781;
    int _2865 = _2863 ? 0 : 1;
    int _2867 = _1952 + (-1);
    int _2869 = _2853 * _2861;
    float _2871 = float(uint(_2857));
    bool _2873 = !_2813;
    int _2875 = _2873 ? 0 : 1;
    int _2877 = _2697 * _2867;
    int _2879 = _2877 + _2869;
    bool _2881 = _2007 == 0;
    float _2883 = as_type<float>(_2227) * _2871;
    bool _2885 = !_2777;
    int _2887 = _2885 ? 0 : 1;
    int _2889 = abs(_2865);
    int _2891 = ~_2723;
    int _2893 = _2891 + 1;
    int _2895 = _2893 + 1;
    float _2897 = trunc(_2883);
    float _2899 = precise::max(_2897, 0.0);
    uint _2901 = uint(_2899);
    bool _2903 = !_2881;
    int _2905 = _2903 ? _2805 : (-1);
    int _2907 = _2879 * _2889;
    int _2909 = abs(_2887);
    int _2911 = abs(_2741);
    int _2913 = _2895 * _2905;
    int _2915 = _2007 + (-1);
    float _2917 = trunc(_2553);
    int _2919 = int(_2917);
    int _2921 = _2751 * _2909;
    int _2923 = _2921 + _2907;
    int _2925 = abs(_2801);
    float _2927 = in.m_75.y;
    int _2929 = _2723 * _2915;
    int _2931 = _2929 + _2913;
    int _2933 = abs(_2875);
    int _2935 = _2819 * _2911;
    int _2937 = _2935 + _2923;
    int _2939 = ~_1997;
    int _2941 = _2939 + 1;
    int _2943 = abs(_2797);
    int _2945 = abs(_2843);
    int _2947 = ~_2747;
    int _2949 = _2947 + _2831;
    int _2951 = _2949 + 1;
    int _2953 = _2661 * _2943;
    int _2955 = _2953 + _2937;
    int _2957 = _1834 * _2951;
    int _2959 = _2957 + _2463;
    int _2961 = _2919 * _2925;
    int _2963 = _2961 + _2091;
    float _2965 = float(uint(_2955));
    int _2967 = _2931 * _2933;
    bool _2969 = !_2835;
    int _2971 = _2969 ? 0 : 1;
    int _2973 = _2941 * int(_2901);
    int _2975 = _2973 + _2857;
    float _2977 = as_type<float>(_2251) * _2965;
    int _2979 = abs(_2971);
    float _2981 = -_2927;
    float _2983 = _2981 + 1.0;
    float _2985 = float(uint(_2975));
    float _2987 = trunc(_2977);
    float _2989 = precise::max(_2987, 0.0);
    uint _2991 = uint(_2989);
    bool _2993 = _1834 == 0;
    int _2995 = _2771 * _2945;
    int _2997 = _2995 + _2967;
    float _2999 = as_type<float>(_2227) * _2985;
    bool _3001 = !_2839;
    int _3003 = _3001 ? 0 : 1;
    bool _3005 = _1981 > 0.5;
    int _3007 = _2963 * _2979;
    int _3009 = _3007 + _2997;
    bool _3011 = !_2993;
    int _3013 = _3011 ? _2959 : (-1);
    float _3015 = trunc(_2999);
    float _3017 = precise::max(_3015, 0.0);
    uint _3019 = uint(_3017);
    int _3021 = abs(_3003);
    int _3023 = _3005 ? as_type<int>(_2983) : as_type<int>(_2927);
    int _3025 = _3013 & 3;
    bool _3027 = _3025 != 0;
    int _3029 = _2919 * _3021;
    int _3031 = _3029 + _3009;
    int _3033 = ~_1952;
    int _3035 = _3033 + 1;
    int _3037 = _3013 & 3;
    bool _3039 = _3037 != 0;
    int _3041 = _3027 ? 0 : 1;
    int _3043 = _3035 * int(_2991);
    int _3045 = _3043 + _2955;
    bool _3047 = uint(_3037) > 1u;
    int _3049 = ~_1997;
    int _3051 = _3049 + 1;
    int _3053 = int(_2901) + int(_3019);
    float _3055 = float(uint(_3031));
    float _3057 = float(uint(_3045));
    int _3059 = ~_3041;
    int _3061 = _3059 + 1;
    int _3063 = _3061 + 1;
    float _3065 = as_type<float>(_2375) * _3055;
    int _3067 = _3051 * _3053;
    int _3069 = _3067 + _2857;
    float _3071 = as_type<float>(_2251) * _3057;
    int _3073 = _3063;
    if (!_3047)
    {
        int _3075 = ~_3041;
        int _3077 = _3075 + 1;
        _3073 = _3077;
    }
    int _3079 = _3073;
    float _3081 = trunc(_3065);
    float _3083 = precise::max(_3081, 0.0);
    uint _3085 = uint(_3083);
    bool _3087 = uint(_3037) >= 2u;
    int _3089 = ~_2007;
    int _3091 = _3089 + 1;
    int _3093 = _3087 ? 0 : 1;
    bool _3095 = uint(_3069) >= uint(_1997);
    float _3097 = trunc(_3071);
    float _3099 = precise::max(_3097, 0.0);
    uint _3101 = uint(_3099);
    int _3103 = ~_1952;
    int _3105 = _3103 + 1;
    bool _3107 = !_3095;
    int _3109 = _3107 ? 0 : (-1);
    bool _3111 = _3037 != 3;
    int _3113 = ~_3053;
    int _3115 = _3113 + _3109;
    int _3117 = _3115 + 1;
    int _3119 = _3091 * int(_3085);
    int _3121 = _3119 + _3031;
    bool _3123 = _1940 > 0.5;
    int _3125 = _1997 * _3117;
    int _3127 = _3125 + _2857;
    float _3129 = float(uint(_3121));
    int _3131 = _3123 ? as_type<int>(_2983) : as_type<int>(_2927);
    int _3133 = int(_2991) + int(_3101);
    float _3135 = as_type<float>(_2375) * _3129;
    int _3137 = ~_3093;
    int _3139 = _3137 + 1;
    int _3141 = _3139 + 1;
    int _3143 = _3141;
    if (_3111)
    {
        int _3145 = ~_3093;
        int _3147 = _3145 + 1;
        _3143 = _3147;
    }
    int _3149 = _3143;
    int _3151 = _3105 * _3133;
    int _3153 = _3151 + _2955;
    int _3155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3157 = _3155 != 0;
    float _3159 = trunc(_3135);
    float _3161 = precise::max(_3159, 0.0);
    uint _3163 = uint(_3161);
    bool _3165 = !_2619;
    int _3167 = _3165 ? _3127 : (-1);
    bool _3169 = !_3157;
    int _3171 = _3169 ? 0 : 1;
    bool _3173 = uint(_3153) >= uint(_1952);
    int _3175 = _3167 & 3;
    bool _3177 = _3175 != 0;
    bool _3179 = !_3173;
    int _3181 = _3179 ? 0 : (-1);
    int _3183 = _3177 ? 0 : 1;
    bool _3185 = uint(_3175) >= 2u;
    bool _3187 = _3175 != 3;
    int _3189 = ~_3133;
    int _3191 = _3189 + _3181;
    int _3193 = _3191 + 1;
    int _3195 = _3185 ? 0 : 1;
    bool _3197 = uint(_3175) > 1u;
    int _3199 = _1952 * _3193;
    int _3201 = _3199 + _2955;
    int _3203 = ~_2007;
    int _3205 = _3203 + 1;
    int _3207 = int(_3085) + int(_3163);
    bool _3209 = !_2847;
    int _3211 = _3209 ? _3201 : (-1);
    int _3213 = ~_3195;
    int _3215 = _3213 + 1;
    int _3217 = _3215 + 1;
    int _3219 = _3217;
    if (_3187)
    {
        int _3221 = ~_3195;
        int _3223 = _3221 + 1;
        _3219 = _3223;
    }
    int _3225 = _3219;
    int _3227 = _3205 * _3207;
    int _3229 = _3227 + _3031;
    int _3231 = _3211 & 3;
    bool _3233 = _3231 != 0;
    int _3235 = ~_3183;
    int _3237 = _3235 + 1;
    int _3239 = _3237 + 1;
    int _3241 = _3239;
    if (!_3197)
    {
        int _3243 = ~_3183;
        int _3245 = _3243 + 1;
        _3241 = _3245;
    }
    int _3247 = _3241;
    bool _3249 = uint(_3231) >= 2u;
    int _3251 = _3233 ? 0 : 1;
    bool _3253 = uint(_3229) >= uint(_2007);
    int _3255 = _3249 ? 0 : 1;
    bool _3257 = _3231 != 3;
    bool _3259 = !_3253;
    int _3261 = _3259 ? 0 : (-1);
    bool _3263 = uint(_3231) > 1u;
    int _3265 = ~_3207;
    int _3267 = _3265 + _3261;
    int _3269 = _3267 + 1;
    int _3271 = ~_3255;
    int _3273 = _3271 + 1;
    int _3275 = _3273 + 1;
    float _3277 = in.m_46.x;
    float _3279 = in.m_46.y;
    float _3281 = in.m_46.z;
    int _3283 = ~_3251;
    int _3285 = _3283 + 1;
    int _3287 = _3285 + 1;
    int _3289 = _2007 * _3269;
    int _3291 = _3289 + _3031;
    int _3293 = _3275;
    int _3295 = _3287;
    if (_3257)
    {
        int _3297 = ~_3255;
        int _3299 = _3297 + 1;
        _3293 = _3299;
    }
    int _3301 = _3293;
    int _3303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3305 = _3303 != 0;
    float _3307 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _3309 = _3307 + (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _3311 = !_2881;
    int _3313 = _3311 ? _3291 : (-1);
    if (!_3263)
    {
        int _3315 = ~_3251;
        int _3317 = _3315 + 1;
        _3295 = _3317;
    }
    int _3319 = _3295;
    bool _3321 = !_3305;
    int _3323 = _3321 ? 0 : 1;
    float _3325 = 1.0 / _3309;
    int _3327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3329 = _3327 != 0;
    int _3331 = _3313 & 3;
    bool _3333 = _3331 != 0;
    bool _3335 = !_3329;
    int _3337 = _3335 ? 0 : 1;
    int _3339 = _3333 ? 0 : 1;
    bool _3341 = uint(_3331) >= 2u;
    float _3343 = _204 * _3279;
    bool _3345 = _3331 != 3;
    int _3347 = _3341 ? 0 : 1;
    float _3349 = fma(_202, _3277, _3343);
    bool _3351 = uint(_3331) > 1u;
    int _3353 = ~_3347;
    int _3355 = _3353 + 1;
    int _3357 = _3355 + 1;
    int _3359 = ~_3339;
    int _3361 = _3359 + 1;
    int _3363 = _3361 + 1;
    int _3365 = _3357;
    int _3367 = _3363;
    float _3369 = _3349;
    if (_3345)
    {
        int _3371 = ~_3347;
        int _3373 = _3371 + 1;
        _3365 = _3373;
    }
    int _3375 = _3365;
    float _3377 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _3379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3381 = _3379 != 0;
    float _3383 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _3385 = _3383 + (*spvDescriptorSet0.vp_c9)._m0[185].w;
    if (!_3351)
    {
        int _3387 = ~_3339;
        int _3389 = _3387 + 1;
        _3367 = _3389;
    }
    int _3391 = _3367;
    float _3393 = _3381 ? as_type<float>(_3131) : _2927;
    int _3395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3397 = _3395 != 0;
    float _3399 = 1.0 / _3385;
    bool _3401 = _2143 > 0.5;
    float _3403 = _3397 ? as_type<float>(_3023) : _2927;
    int _3405 = _3401 ? as_type<int>(_2983) : as_type<int>(_2927);
    float _3407 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _3409 = _3407 + (*spvDescriptorSet0.vp_c9)._m0[186].w;
    int _3411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _3413 = _3411 != 0;
    int _3415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _3417 = _3415 != 0;
    float _3419 = _3413 ? as_type<float>(_3405) : _2927;
    float _3421 = 1.0 / _3409;
    float _3423 = _3417 ? as_type<float>(_3405) : _2927;
    int _3425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3427 = _3425 != 0;
    int _3429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _3431 = _3429 != 0;
    float _3433 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _3435 = _3433 + (*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3437 = _198 * _3279;
    float _3439 = _210 * _3279;
    float _3441 = 1.0 / _3435;
    float _3443 = fma(_196, _3277, _3437);
    float _3445 = fma(_208, _3277, _3439);
    float _3447 = _2129 * 2.0;
    float _3449 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3451 = _3449 + (*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3453 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _3455 = fma(_200, _3281, _3443);
    float _3457 = floor(_3447);
    float _3459 = -(*spvDescriptorSet0.vp_c9)._m0[183].x;
    float _3461 = (*spvDescriptorSet0.vp_c9)._m0[184].x + _3459;
    float _3463 = fma(_3453, -2.0, _3377);
    float _3465 = fma(_206, _3281, _3349);
    float _3467 = fma(_212, _3281, _3445);
    float _3469 = _3461 * _3325;
    float _3471 = -(*spvDescriptorSet0.vp_c9)._m0[184].x;
    float _3473 = _3471 + (*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _3475 = 1.0 / _3451;
    float _3477 = -(*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _3479 = (*spvDescriptorSet0.vp_c9)._m0[186].x + _3477;
    float _3481 = _3473 * _3399;
    float _3483 = _3431 ? as_type<float>(_3405) : _2927;
    float _3485 = _3479 * _3421;
    bool _3487 = !_3427;
    int _3489 = _3487 ? 0 : 1;
    float _3491 = -(*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _3493 = (*spvDescriptorSet0.vp_c9)._m0[188].x + _3491;
    bool _3495 = _3457 > 0.0;
    float _3497 = -(*spvDescriptorSet0.vp_c9)._m0[186].x;
    float _3499 = _3497 + (*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _3501 = in.m_55.w;
    bool _3503 = _3457 >= 0.0;
    bool _3505 = isnan(_3457);
    bool _3507 = _3503 || _3505;
    bool _3509 = isnan(0.0);
    bool _3511 = _3507 || _3509;
    float _3513 = _3499 * _3441;
    float _3515 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3517 = _3515 + (*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3519 = _3493 * _3475;
    int _3521 = _3511 ? 0 : 1;
    float _3523 = in.m_57.w;
    float _3525 = 1.0 / _3517;
    float _3527 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3529 = _3527 + (*spvDescriptorSet0.vp_c9)._m0[190].w;
    float _3531 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _3533 = _1814 + _3531;
    float _3535 = -(*spvDescriptorSet0.vp_c9)._m0[188].x;
    float _3537 = _3535 + (*spvDescriptorSet0.vp_c9)._m0[189].x;
    int _3539 = ~_1834;
    int _3541 = _3539 + 1;
    float _3543 = -(*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _3545 = (*spvDescriptorSet0.vp_c9)._m0[190].x + _3543;
    float _3547 = 1.0 / _3529;
    int _3549 = ~_3521;
    int _3551 = _3549 + 1;
    int _3553 = _3551 + 1;
    float _3555 = fma(_3485, _3533, (*spvDescriptorSet0.vp_c9)._m0[185].x);
    int _3557 = _3553;
    float _3559 = (*spvDescriptorSet0.vp_c9)._m0[186].x;
    if (!_3495)
    {
        int _3561 = ~_3521;
        int _3563 = _3561 + 1;
        _3557 = _3563;
    }
    int _3565 = _3557;
    bool _3567 = _2145 != 2;
    float _3569 = float(uint(_2369));
    float _3571 = float(uint(_2819));
    float _3573 = _3537 * _3525;
    float _3575 = _1940 * 2.0;
    float _3577 = as_type<float>(_1938) * _3569;
    float _3579 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _3581 = _1814 + _3579;
    float _3583 = 0.0;
    if (!_2203)
    {
        _3583 = _1940;
    }
    float _3585 = _3583;
    float _3587 = _3585;
    if (!_2203)
    {
        _3369 = _1940;
    }
    float _3589 = _3369;
    float _3591 = floor(_3575);
    float _3593 = _3545 * _3547;
    bool _3595 = !_2203;
    float _3597 = _3595 ? as_type<float>(_2147) : as_type<float>(_2149);
    float _3599 = fma(_3481, _3581, (*spvDescriptorSet0.vp_c9)._m0[184].x);
    float _3601 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _3603 = _1814 + _3601;
    float _3605 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3607 = _1814 + _3605;
    float _3609 = 0.0;
    float _3611 = _3589;
    if (!_2203)
    {
        _3609 = _2143;
    }
    float _3613 = _3609;
    float _3615 = fma(_3593, _2213, (*spvDescriptorSet0.vp_c9)._m0[189].x);
    float _3617 = trunc(_3577);
    float _3619 = precise::max(_3617, 0.0);
    uint _3621 = uint(_3619);
    float _3623 = fma(_3469, _3603, (*spvDescriptorSet0.vp_c9)._m0[183].x);
    float _3625 = fma(_3519, _3607, (*spvDescriptorSet0.vp_c9)._m0[187].x);
    float _3627 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _3629 = _1814 + _3627;
    float _3631 = _3613;
    if (!_2203)
    {
        _3559 = _2143;
    }
    float _3633 = _3559;
    float _3635 = _3465 + _3523;
    bool _3637 = !_2203;
    float _3639 = _3637 ? as_type<float>(_2149) : as_type<float>(_2151);
    float _3641 = fma(_3513, _3629, (*spvDescriptorSet0.vp_c9)._m0[186].x);
    float _3643 = _3633;
    if (_2203)
    {
        _3587 = _2129;
    }
    float _3645 = _3587;
    if (_2203)
    {
        _3611 = _2129;
    }
    float _3647 = _3611;
    if (_2203)
    {
        _3631 = _1940;
    }
    float _3649 = _3631;
    float _3651 = _3645 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2203)
    {
        _3643 = _1940;
    }
    float _3653 = _3643;
    int _3655 = _3541 * int(_3621);
    int _3657 = _3655 + _2369;
    bool _3659 = _3591 > 0.0;
    float _3661 = _3649 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _3663 = _3591 >= 0.0;
    bool _3665 = isnan(_3591);
    bool _3667 = _3663 || _3665;
    bool _3669 = isnan(0.0);
    bool _3671 = _3667 || _3669;
    float _3673 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3675 = _1814 + _3673;
    float _3677 = float(uint(_3657));
    float _3679 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3681 = int(_3679);
    bool _3683 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _3685 = isnan(_1814);
    bool _3687 = _3683 || _3685;
    bool _3689 = isnan((*spvDescriptorSet0.vp_c9)._m0[190].w);
    bool _3691 = _3687 || _3689;
    float _3693 = float(_3691);
    float _3695 = fma(_3573, _3675, (*spvDescriptorSet0.vp_c9)._m0[188].x);
    float _3697 = float(uint(_2609));
    float _3699 = as_type<float>(_1938) * _3677;
    bool _3701 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[189].w;
    bool _3703 = isnan(_1814);
    bool _3705 = _3701 || _3703;
    bool _3707 = isnan((*spvDescriptorSet0.vp_c9)._m0[189].w);
    bool _3709 = _3705 || _3707;
    float _3711 = float(_3709);
    float _3713 = _3455 + _3501;
    float _3715 = -_3693;
    float _3717 = _3715 + 1.0;
    bool _3719 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[188].w;
    bool _3721 = isnan(_1814);
    bool _3723 = _3719 || _3721;
    bool _3725 = isnan((*spvDescriptorSet0.vp_c9)._m0[188].w);
    bool _3727 = _3723 || _3725;
    float _3729 = float(_3727);
    float _3731 = as_type<float>(_2227) * _3697;
    float _3733 = as_type<float>(_2251) * _3571;
    float _3735 = -_3711;
    float _3737 = _3735 + 1.0;
    float _3739 = _3711 * _3717;
    bool _3741 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[187].w;
    bool _3743 = isnan(_1814);
    bool _3745 = _3741 || _3743;
    bool _3747 = isnan((*spvDescriptorSet0.vp_c9)._m0[187].w);
    bool _3749 = _3745 || _3747;
    float _3751 = float(_3749);
    float _3753 = _3729 * _3737;
    float _3755 = -_3729;
    float _3757 = _3755 + 1.0;
    float _3759 = float(uint(_2963));
    float _3761 = trunc(_3733);
    float _3763 = precise::max(_3761, 0.0);
    uint _3765 = uint(_3763);
    bool _3767 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _3769 = isnan(_1814);
    bool _3771 = _3767 || _3769;
    bool _3773 = isnan((*spvDescriptorSet0.vp_c9)._m0[186].w);
    bool _3775 = _3771 || _3773;
    float _3777 = float(_3775);
    float _3779 = _3751 * _3757;
    float _3781 = -_3751;
    float _3783 = _3781 + 1.0;
    bool _3785 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _3787 = isnan(_1814);
    bool _3789 = _3785 || _3787;
    bool _3791 = isnan((*spvDescriptorSet0.vp_c9)._m0[185].w);
    bool _3793 = _3789 || _3791;
    float _3795 = float(_3793);
    float _3797 = in.m_59.w;
    float _3799 = as_type<float>(_2375) * _3759;
    float _3801 = -_3777;
    float _3803 = _3801 + 1.0;
    float _3805 = trunc(_3731);
    float _3807 = precise::max(_3805, 0.0);
    uint _3809 = uint(_3807);
    bool _3811 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _3813 = isnan(_1814);
    bool _3815 = _3811 || _3813;
    bool _3817 = isnan((*spvDescriptorSet0.vp_c9)._m0[184].w);
    bool _3819 = _3815 || _3817;
    float _3821 = float(_3819);
    float _3823 = _3777 * _3783;
    float _3825 = _3795 * _3803;
    int _3827 = ~_1952;
    int _3829 = _3827 + 1;
    float _3831 = -_3795;
    float _3833 = _3831 + 1.0;
    int _3835 = ~_1997;
    int _3837 = _3835 + 1;
    bool _3839 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[183].w;
    bool _3841 = isnan(_1814);
    bool _3843 = _3839 || _3841;
    bool _3845 = isnan((*spvDescriptorSet0.vp_c9)._m0[183].w);
    bool _3847 = _3843 || _3845;
    float _3849 = float(_3847);
    float _3851 = _3821 * _3833;
    float _3853 = -_3821;
    float _3855 = _3853 + 1.0;
    int _3857 = _3829 * int(_3765);
    int _3859 = _3857 + _2819;
    float _3861 = trunc(_3799);
    float _3863 = precise::max(_3861, 0.0);
    uint _3865 = uint(_3863);
    float _3867 = _3849 * _3855;
    int _3869 = abs(_3149);
    int _3871 = _3837 * int(_3809);
    int _3873 = _3871 + _2609;
    float _3875 = float(uint(_3859));
    float _3877 = _3623 * _3867;
    int _3879 = _3671 ? 0 : 1;
    float _3881 = trunc(_3699);
    float _3883 = precise::max(_3881, 0.0);
    uint _3885 = uint(_3883);
    float _3887 = float(uint(_3873));
    float _3889 = as_type<float>(_2251) * _3875;
    float _3891 = -_3849;
    float _3893 = _3891 + 1.0;
    float _3895 = _3467 + _3797;
    int _3897 = ~_3879;
    int _3899 = _3897 + 1;
    int _3901 = _3899 + 1;
    float _3903 = as_type<float>(_2227) * _3887;
    int _3905 = ~_2007;
    int _3907 = _3905 + 1;
    float _3909 = trunc(_3889);
    float _3911 = precise::max(_3909, 0.0);
    uint _3913 = uint(_3911);
    float _3915 = fma(_3893, (*spvDescriptorSet0.vp_c9)._m0[183].x, _3877);
    int _3917 = _3901;
    float _3919 = _3849;
    if (!_3659)
    {
        int _3921 = ~_3879;
        int _3923 = _3921 + 1;
        _3917 = _3923;
    }
    int _3925 = _3917;
    float _3927 = _2373 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    int _3929 = _3907 * int(_3865);
    int _3931 = _3929 + _2963;
    float _3933 = fma(_3599, _3851, _3915);
    float _3935 = _2143 * 2.0;
    float _3937 = fma(_3927, _2311, -0.5);
    float _3939 = trunc(_3903);
    float _3941 = precise::max(_3939, 0.0);
    uint _3943 = uint(_3941);
    float _3945 = float(uint(_3931));
    float _3947 = fma(_3555, _3825, _3933);
    int _3949 = ~_1834;
    int _3951 = _3949 + 1;
    float _3953 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3955 = as_type<float>(_2375) * _3945;
    int _3957 = int(_3621) + int(_3885);
    float _3959 = fma(_3641, _3823, _3947);
    float _3961 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _3963 = int(_3765) + int(_3913);
    float _3965 = trunc(_3955);
    float _3967 = precise::max(_3965, 0.0);
    uint _3969 = uint(_3967);
    int _3971 = _3951 * _3957;
    int _3973 = _3971 + _2369;
    int _3975 = int(_3809) + int(_3943);
    float _3977 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3979 = _3895 + _3977;
    int _3981 = ~_1997;
    int _3983 = _3981 + 1;
    bool _3985 = uint(_3973) >= uint(_1834);
    float _3987 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3989 = _2129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _3991 = _3983 * _3975;
    int _3993 = _3991 + _2609;
    int _3995 = ~_1952;
    int _3997 = _3995 + 1;
    float _3999 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4001 = _3635 + _3999;
    float _4003 = -_3987;
    float _4005 = fma(_3989, 2.0, _4003);
    bool _4007 = !_3985;
    int _4009 = _4007 ? 0 : (-1);
    int _4011 = int(_3865) + int(_3969);
    float _4013 = _4001 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _4015 = -_164;
    float _4017 = fma(_4015, (*spvDescriptorSet0.vp_c9)._m0[76].x, _4005);
    bool _4019 = uint(_3993) >= uint(_1997);
    int _4021 = _3997 * _3963;
    int _4023 = _4021 + _2819;
    int _4025 = ~_2007;
    int _4027 = _4025 + 1;
    float _4029 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4031 = _3713 + _4029;
    float _4033 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _4035 = !_4019;
    int _4037 = _4035 ? 0 : (-1);
    int _4039 = _4027 * _4011;
    int _4041 = _4039 + _2963;
    bool _4043 = uint(_4023) >= uint(_1952);
    float _4045 = fma(_4031, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4013);
    float _4047 = fma(as_type<float>(_2151), (*spvDescriptorSet0.vp_c9)._m0[93].z, _4033);
    float _4049 = as_type<float>(_2151) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _4051 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _4053 = !_4043;
    int _4055 = _4053 ? 0 : (-1);
    float _4057 = fma(_3979, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4045);
    bool _4059 = uint(_4041) >= uint(_2007);
    float _4061 = -_4051;
    float _4063 = fma(_4049, 2.0, _4061);
    float _4065 = floor(_3935);
    int _4067 = ~_3957;
    int _4069 = _4067 + _4009;
    int _4071 = _4069 + 1;
    float _4073 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].z, _4047);
    int _4075 = ~_3975;
    int _4077 = _4075 + _4037;
    int _4079 = _4077 + 1;
    float _4081 = fma(as_type<float>(_2149), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3961);
    float _4083 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _4085 = as_type<float>(_2149) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _4087 = !_4059;
    int _4089 = _4087 ? 0 : (-1);
    int _4091 = _1834 * _4071;
    int _4093 = _4091 + _2369;
    bool _4095 = _4057 >= 0.0;
    float _4097 = fma(_4085, -2.0, _4083);
    int _4099 = _1997 * _4079;
    int _4101 = _4099 + _2609;
    float _4103 = fma(_3625, _3779, _3959);
    float _4105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    bool _4107 = !_2993;
    int _4109 = _4107 ? _4093 : (-1);
    float _4111 = fma(_3695, _3753, _4103);
    float _4113 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _4115 = _3927;
    float _4117 = _4073;
    if (_3567)
    {
        _3919 = _2129;
    }
    float _4119 = _3919;
    float _4121 = fma(_3615, _3739, _4111);
    float _4123 = _4119;
    if (_3567)
    {
        _4115 = _1940;
    }
    float _4125 = _4115;
    float _4127 = fma(_3647, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4113);
    float _4129 = _4125;
    if (!_3567)
    {
        _4123 = _2143;
    }
    float _4131 = _4123;
    float _4133 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_3567)
    {
        _4129 = _2129;
    }
    float _4135 = _4129;
    bool _4137 = _4065 > 0.0;
    float _4139 = fma(_3653, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4133);
    bool _4141 = _4065 >= 0.0;
    bool _4143 = isnan(_4065);
    bool _4145 = _4141 || _4143;
    bool _4147 = isnan(0.0);
    bool _4149 = _4145 || _4147;
    float _4151 = _4105 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _4153 = _4065;
    if (_4095)
    {
        _4153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _4155 = _4153;
    float _4157 = _1940 + _2129;
    float _4159 = fma(_4151, _3483, -0.5);
    bool _4161 = !_3039;
    int _4163 = _4161 ? 0 : 1;
    int _4165 = as_type<int>(_4155);
    if (_4095)
    {
        float _4167 = _4155 * 5.0;
        _4165 = as_type<int>(_4167);
    }
    int _4169 = _4165;
    int _4171 = _3167 & 3;
    bool _4173 = _4171 != 0;
    float _4175 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4177 = _4157 + (-1.0);
    bool _4179 = !_4173;
    int _4181 = _4179 ? 0 : 1;
    if (_4095)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _13322 = as_type<float>(_4169);
        out.gl_Position.z = _13322;
    }
    int _4183 = _3211 & 3;
    bool _4185 = _4183 != 0;
    float _4187 = fma(_3639, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4175);
    float _4189 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _4191 = _3639 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _4193 = fma(_3693, (*spvDescriptorSet0.vp_c9)._m0[190].x, _4121);
    float _4195 = -_4189;
    float _4197 = fma(_4191, 2.0, _4195);
    float _4199 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _4201 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _4203 = !_4185;
    int _4205 = _4203 ? 0 : 1;
    float _4207 = fma(_3597, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4199);
    int _4209 = _3313 & 3;
    bool _4211 = _4209 != 0;
    float _4213 = _3597 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _4215 = _3013 >> 31;
    float _4217 = fma(_4177, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _4219 = !_4211;
    int _4221 = _4219 ? 0 : 1;
    float _4223 = fma(_4213, -2.0, _4201);
    bool _4225 = _3037 != 3;
    float _4227 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _4229 = _3167 >> 31;
    float _4231 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4207);
    int _4233 = _4215 & 3;
    float _4235 = -_4227;
    float _4237 = fma(_3651, 2.0, _4235);
    int _4239 = _4229 & 3;
    float _4241 = _4131 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _4243 = !_4225;
    int _4245 = _4243 ? 0 : (-1);
    float _4247 = _4135 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _4249 = _3167 + _4239;
    float _4251 = -_164;
    float _4253 = fma(_4251, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4197);
    bool _4255 = _3175 != 3;
    float _4257 = fma(_4247, -2.0, _3953);
    int _4259 = _3013 + _4233;
    float _4261 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].w, _4081);
    int _4263 = _4249 >> 2;
    float _4265 = -_164;
    float _4267 = fma(_4265, (*spvDescriptorSet0.vp_c9)._m0[91].x, _4063);
    int _4269 = _3211 >> 31;
    float _4271 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[91].y, _4097);
    bool _4273 = !_4255;
    int _4275 = _4273 ? 0 : (-1);
    float _4277 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4127);
    bool _4279 = _3231 != 3;
    float _4281 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4139);
    int _4283 = _4259 >> 2;
    float _4285 = -_164;
    float _4287 = fma(_4285, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4237);
    int _4289 = _3313 >> 31;
    float _4291 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4257);
    int _4293 = _4269 & 3;
    out.m_77.x = _4193;
    int _4295 = _4263 << 4;
    int _4297 = _4295 + 512;
    int _4299 = _4289 & 3;
    float _4301 = _4267;
    if (_4095)
    {
        out.m_49.x = 0.0;
    }
    int _4303 = _3211 + _4293;
    uint _4305 = uint(int(uint(_4297) >> uint(2)));
    uint _4307 = uint(int(uint(int(_4305)) >> uint(2)));
    int _4309 = int(_4305) & 3;
    float _4311 = (*spvDescriptorSet0.vp_c9)._m0[int(_4307)][_4309];
    int _4313 = int(_4305) + 1;
    uint _4315 = uint(int(uint(_4313) >> uint(2)));
    int _4317 = _4313 & 3;
    float _4319 = (*spvDescriptorSet0.vp_c9)._m0[int(_4315)][_4317];
    int _4321 = _4283 << 4;
    int _4323 = _4321 + 368;
    int _4325 = _3313 + _4299;
    int _4327 = _4303 >> 2;
    uint _4329 = uint(int(uint(_4323) >> uint(2)));
    uint _4331 = uint(int(uint(int(_4329)) >> uint(2)));
    int _4333 = int(_4329) & 3;
    float _4335 = (*spvDescriptorSet0.vp_c9)._m0[int(_4331)][_4333];
    int _4337 = int(_4329) + 1;
    uint _4339 = uint(int(uint(_4337) >> uint(2)));
    int _4341 = _4337 & 3;
    float _4343 = (*spvDescriptorSet0.vp_c9)._m0[int(_4339)][_4341];
    int _4345 = _4327 << 4;
    int _4347 = _4345 + 656;
    float _4349 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _4351 = _4325 >> 2;
    float _4353 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _4355 = !_2619;
    int _4357 = _4355 ? _4101 : (-1);
    uint _4359 = uint(int(uint(_4347) >> uint(2)));
    uint _4361 = uint(int(uint(int(_4359)) >> uint(2)));
    int _4363 = int(_4359) & 3;
    float _4365 = (*spvDescriptorSet0.vp_c9)._m0[int(_4361)][_4363];
    int _4367 = int(_4359) + 1;
    uint _4369 = uint(int(uint(_4367) >> uint(2)));
    int _4371 = _4367 & 3;
    float _4373 = (*spvDescriptorSet0.vp_c9)._m0[int(_4369)][_4371];
    bool _4375 = _3331 != 3;
    float _4377 = fma(_3661, -2.0, _4349);
    int _4379 = _4351 << 4;
    int _4381 = _4379 + 800;
    float _4383 = -_4353;
    float _4385 = fma(_4241, 2.0, _4383);
    int _4387 = ~_3963;
    int _4389 = _4387 + _4055;
    int _4391 = _4389 + 1;
    float _4393 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4377);
    int _4395 = ~_4011;
    int _4397 = _4395 + _4089;
    int _4399 = _4397 + 1;
    float _4401 = -_164;
    float _4403 = fma(_4401, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4385);
    int _4405 = _4149 ? 0 : 1;
    int _4407 = _4323 + 8;
    uint _4409 = uint(int(uint(_4407) >> uint(2)));
    uint _4411 = uint(int(uint(int(_4409)) >> uint(2)));
    int _4413 = int(_4409) & 3;
    float _4415 = (*spvDescriptorSet0.vp_c9)._m0[int(_4411)][_4413];
    int _4417 = int(_4409) + 1;
    uint _4419 = uint(int(uint(_4417) >> uint(2)));
    int _4421 = _4417 & 3;
    float _4423 = (*spvDescriptorSet0.vp_c9)._m0[int(_4419)][_4421];
    bool _4425 = !_4279;
    int _4427 = _4425 ? 0 : (-1);
    int _4429 = _2007 * _4399;
    int _4431 = _4429 + _2963;
    bool _4433 = !_4375;
    int _4435 = _4433 ? 0 : (-1);
    int _4437 = _1952 * _4391;
    int _4439 = _4437 + _2819;
    int _4441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _4443 = _4441 != 0;
    int _4445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _4447 = _4445 != 0;
    int _4449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _4451 = _4449 != 0;
    int _4453 = abs(_3247);
    uint _4455 = uint(int(uint(_4381) >> uint(2)));
    uint _4457 = uint(int(uint(int(_4455)) >> uint(2)));
    int _4459 = int(_4455) & 3;
    float _4461 = (*spvDescriptorSet0.vp_c9)._m0[int(_4457)][_4459];
    int _4463 = int(_4455) + 1;
    uint _4465 = uint(int(uint(_4463) >> uint(2)));
    int _4467 = _4463 & 3;
    float _4469 = (*spvDescriptorSet0.vp_c9)._m0[int(_4465)][_4467];
    int _4471 = ~_4405;
    int _4473 = _4471 + 1;
    int _4475 = _4473 + 1;
    int _4477 = _4475;
    if (!_4137)
    {
        int _4479 = ~_4405;
        int _4481 = _4479 + 1;
        _4477 = _4481;
    }
    int _4483 = _4477;
    int _4485 = abs(_3319);
    int _4487 = ~_4453;
    int _4489 = _4487 + 1;
    int _4491 = _4489 + 1;
    int _4493 = _4297 + 8;
    uint _4495 = uint(int(uint(_4493) >> uint(2)));
    uint _4497 = uint(int(uint(int(_4495)) >> uint(2)));
    int _4499 = int(_4495) & 3;
    float _4501 = (*spvDescriptorSet0.vp_c9)._m0[int(_4497)][_4499];
    int _4503 = int(_4495) + 1;
    uint _4505 = uint(int(uint(_4503) >> uint(2)));
    int _4507 = _4503 & 3;
    float _4509 = (*spvDescriptorSet0.vp_c9)._m0[int(_4505)][_4507];
    int _4511 = abs(_3079);
    int _4513 = abs(_4163);
    float _4515 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4517 = int(_4515);
    int _4519 = ~_4511;
    int _4521 = _4519 + 1;
    int _4523 = _4521 + 1;
    int _4525 = _4491 * as_type<int>(_4319);
    int _4527 = abs(_4181);
    int _4529 = _4381 + 8;
    uint _4531 = uint(int(uint(_4529) >> uint(2)));
    uint _4533 = uint(int(uint(int(_4531)) >> uint(2)));
    int _4535 = int(_4531) & 3;
    float _4537 = (*spvDescriptorSet0.vp_c9)._m0[int(_4533)][_4535];
    int _4539 = int(_4531) + 1;
    uint _4541 = uint(int(uint(_4539) >> uint(2)));
    int _4543 = _4539 & 3;
    float _4545 = (*spvDescriptorSet0.vp_c9)._m0[int(_4541)][_4543];
    int _4547 = ~_4513;
    int _4549 = _4547 + 1;
    int _4551 = _4549 + 1;
    int _4553 = ~_4485;
    int _4555 = _4553 + 1;
    int _4557 = _4555 + 1;
    int _4559 = ~_4527;
    int _4561 = _4559 + 1;
    int _4563 = _4561 + 1;
    int _4565 = _4523 * as_type<int>(_4343);
    int _4567 = abs(_4205);
    int _4569 = _4347 + 8;
    uint _4571 = uint(int(uint(_4569) >> uint(2)));
    uint _4573 = uint(int(uint(int(_4571)) >> uint(2)));
    int _4575 = int(_4571) & 3;
    float _4577 = (*spvDescriptorSet0.vp_c9)._m0[int(_4573)][_4575];
    int _4579 = int(_4571) + 1;
    uint _4581 = uint(int(uint(_4579) >> uint(2)));
    int _4583 = _4579 & 3;
    float _4585 = (*spvDescriptorSet0.vp_c9)._m0[int(_4581)][_4583];
    int _4587 = abs(_3391);
    int _4589 = _4551 * as_type<int>(_4335);
    int _4591 = _4589 + _4565;
    int _4593 = ~_3869;
    int _4595 = _4593 + 1;
    int _4597 = _4595 + 1;
    int _4599 = _4563 * as_type<int>(_4311);
    int _4601 = _4599 + _4525;
    int _4603 = ~_4567;
    int _4605 = _4603 + 1;
    int _4607 = _4605 + 1;
    int _4609 = _4557 * as_type<int>(_4373);
    int _4611 = ~_4587;
    int _4613 = _4611 + 1;
    int _4615 = _4613 + 1;
    float _4617 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4619 = int(_4617);
    int _4621 = abs(_4221);
    int _4623 = _4607 * as_type<int>(_4365);
    int _4625 = _4623 + _4609;
    int _4627 = abs(_3225);
    int _4629 = ~_4621;
    int _4631 = _4629 + 1;
    int _4633 = _4631 + 1;
    int _4635 = ~_4627;
    int _4637 = _4635 + 1;
    int _4639 = _4637 + 1;
    int _4641 = _4597 * as_type<int>(_4415);
    int _4643 = _4641 + _4591;
    int _4645 = abs(_3375);
    float _4647 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4649 = int(_4647);
    int _4651 = abs(_3301);
    int _4653 = ~_4645;
    int _4655 = _4653 + 1;
    int _4657 = _4655 + 1;
    int _4659 = abs(_4275);
    int _4661 = _4615 * as_type<int>(_4469);
    float _4663 = float(uint(_3681));
    float _4665 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4667 = log2(_4665);
    int _4669 = abs(_4245);
    int _4671 = _4633 * as_type<int>(_4461);
    int _4673 = _4671 + _4661;
    int _4675 = abs(_3337);
    int _4677 = ~_4669;
    int _4679 = _4677 + 1;
    int _4681 = _4679 + 1;
    int _4683 = _4639 * as_type<int>(_4501);
    int _4685 = _4683 + _4601;
    float _4687 = 1.0 / _4663;
    int _4689 = abs(_4619);
    int _4691 = _4681 * as_type<int>(_4423);
    int _4693 = _4691 + _4643;
    int _4695 = ~_4651;
    int _4697 = _4695 + 1;
    int _4699 = _4697 + 1;
    int _4701 = abs(_4435);
    int _4703 = _4657 * as_type<int>(_4537);
    int _4705 = _4703 + _4673;
    int _4707 = ~_4659;
    int _4709 = _4707 + 1;
    int _4711 = _4709 + 1;
    int _4713 = abs(_4427);
    int _4715 = abs(_3171);
    int _4717 = _4711 * as_type<int>(_4509);
    int _4719 = _4717 + _4685;
    int _4721 = ~_4713;
    int _4723 = _4721 + 1;
    int _4725 = _4723 + 1;
    int _4727 = _4699 * as_type<int>(_4577);
    int _4729 = _4727 + _4625;
    int _4731 = abs(_3681);
    int _4733 = abs(_3323);
    int _4735 = _4725 * as_type<int>(_4585);
    int _4737 = _4735 + _4729;
    int _4739 = ~_4715;
    int _4741 = _4739 + 1;
    int _4743 = _4741 + 1;
    float _4745 = _4001 * _4001;
    int _4747 = abs(_3489);
    int _4749 = _4693 * _4743;
    int _4751 = ~_4675;
    int _4753 = _4751 + 1;
    int _4755 = _4753 + 1;
    float _4757 = fma(_4031, _4031, _4745);
    int _4759 = ~_4701;
    int _4761 = _4759 + 1;
    int _4763 = _4761 + 1;
    int _4765 = _4109 * _4715;
    int _4767 = _4765 + _4749;
    int _4769 = _4755 * _4737;
    int _4771 = as_type<int>(_4687) + (-2);
    float _4773 = fma(_3979, _3979, _4757);
    float _4775 = float(uint(_4767));
    int _4777 = _4763 * as_type<int>(_4545);
    int _4779 = _4777 + _4705;
    float _4781 = float(uint(_4517));
    float _4783 = rsqrt(_4773);
    float _4785 = float(uint(_4649));
    float _4787 = as_type<float>(_4771) * _4775;
    int _4789 = abs(_4517);
    float _4791 = float(uint(_4731));
    int _4793 = ~_4733;
    int _4795 = _4793 + 1;
    int _4797 = _4795 + 1;
    float _4799 = 1.0 / _4781;
    float _4801 = float(uint(_4619));
    int _4803 = _4797 * _4719;
    float _4805 = float(uint(_4789));
    int _4807 = ~_4747;
    int _4809 = _4807 + 1;
    int _4811 = _4809 + 1;
    float _4813 = 1.0 / _4785;
    bool _4815 = !_2881;
    int _4817 = _4815 ? _4431 : (-1);
    int _4819 = _4357 * _4733;
    int _4821 = _4819 + _4803;
    bool _4823 = !_2847;
    int _4825 = _4823 ? _4439 : (-1);
    int _4827 = _4811 * _4779;
    float _4829 = float(uint(_4689));
    int _4831 = ~_3681;
    int _4833 = _4831 + 1;
    float _4835 = 1.0 / _4791;
    int _4837 = _4817 * _4747;
    int _4839 = _4837 + _4827;
    float _4841 = _4001 * _4783;
    int _4843 = abs(_4649);
    int _4845 = _4825 * _4675;
    int _4847 = _4845 + _4769;
    int _4849 = as_type<int>(_4799) + (-2);
    float _4851 = -_4841;
    float _4853 = fma(_4851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4001);
    float _4855 = float(uint(_4821));
    float _4857 = trunc(_4787);
    float _4859 = precise::max(_4857, 0.0);
    uint _4861 = uint(_4859);
    int _4863 = as_type<int>(_4813) + (-2);
    float _4865 = _4031 * _4783;
    float _4867 = float(uint(_4839));
    float _4869 = as_type<float>(_4849) * _4855;
    float _4871 = float(uint(_4843));
    float _4873 = -_4865;
    float _4875 = fma(_4873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4031);
    int _4877 = abs(_4821);
    float _4879 = 1.0 / _4801;
    int _4881 = as_type<int>(_4835) + (-2);
    float _4883 = as_type<float>(_4863) * _4867;
    int _4885 = abs(_4767);
    float _4887 = _4853 * _4853;
    float _4889 = float(uint(_4847));
    float _4891 = float(uint(_4885));
    float _4893 = 1.0 / _4805;
    int _4895 = _4833 * int(_4861);
    int _4897 = _4895 + _4767;
    float _4899 = fma(_4875, _4875, _4887);
    int _4901 = ~_4649;
    int _4903 = _4901 + 1;
    float _4905 = as_type<float>(_4881) * _4891;
    int _4907 = ~_4619;
    int _4909 = _4907 + 1;
    float _4911 = float(uint(_4897));
    float _4913 = 1.0 / _4829;
    int _4915 = as_type<int>(_4879) + (-2);
    float _4917 = float(uint(_4877));
    float _4919 = as_type<float>(_4771) * _4911;
    bool _4921 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4923 = isnan(0.0);
    bool _4925 = _4921 || _4923;
    bool _4927 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4929 = _4925 || _4927;
    float _4931 = as_type<float>(_4915) * _4889;
    int _4933 = as_type<int>(_4893) + (-2);
    float _4935 = 1.0 / _4871;
    int _4937 = ~_4517;
    int _4939 = _4937 + 1;
    float _4941 = as_type<float>(_4933) * _4917;
    int _4943 = abs(_4847);
    float _4945 = trunc(_4869);
    float _4947 = precise::max(_4945, 0.0);
    uint _4949 = uint(_4947);
    int _4951 = as_type<int>(_4913) + (-2);
    float _4953 = float(uint(_4943));
    int _4955 = abs(_4839);
    float _4957 = trunc(_4883);
    float _4959 = precise::max(_4957, 0.0);
    uint _4961 = uint(_4959);
    float _4963 = as_type<float>(_4951) * _4953;
    int _4965 = as_type<int>(_4935) + (-2);
    float _4967 = float(uint(_4955));
    float _4969 = trunc(_4931);
    float _4971 = precise::max(_4969, 0.0);
    uint _4973 = uint(_4971);
    float _4975 = as_type<float>(_4965) * _4967;
    float _4977 = trunc(_4905);
    float _4979 = precise::max(_4977, 0.0);
    uint _4981 = uint(_4979);
    int _4983 = _4903 * int(_4961);
    int _4985 = _4983 + _4839;
    float _4987 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4223);
    float _4989 = float(uint(_4985));
    float _4991 = -_4987;
    float _4993 = fma(_4231, _4159, _4991);
    float _4995 = trunc(_4919);
    float _4997 = precise::max(_4995, 0.0);
    uint _4999 = uint(_4997);
    float _5001 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4187);
    int _5003 = _4939 * int(_4949);
    int _5005 = _5003 + _4821;
    float _5007 = _4667 * _164;
    int _5009 = _4909 * int(_4973);
    int _5011 = _5009 + _4847;
    float _5013 = fma(_5001, _3937, _4253);
    float _5015 = as_type<float>(_4863) * _4989;
    float _5017 = float(uint(_5005));
    float _5019 = trunc(_4941);
    float _5021 = precise::max(_5019, 0.0);
    uint _5023 = uint(_5021);
    float _5025 = float(uint(_5011));
    float _5027 = as_type<float>(_4849) * _5017;
    int _5029 = ~_4789;
    int _5031 = _5029 + 1;
    float _5033 = as_type<float>(_4915) * _5025;
    bool _5035 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _5037 = isnan(1.0);
    bool _5039 = _5035 || _5037;
    bool _5041 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _5043 = _5039 || _5041;
    float _5045 = trunc(_4975);
    float _5047 = precise::max(_5045, 0.0);
    uint _5049 = uint(_5047);
    int _5051 = int(_4861) + int(_4999);
    float _5053 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _5055 = 1.0 + _5053;
    int _5057 = ~_4731;
    int _5059 = _5057 + 1;
    int _5061 = ~_4689;
    int _5063 = _5061 + 1;
    float _5065 = trunc(_4963);
    float _5067 = precise::max(_5065, 0.0);
    uint _5069 = uint(_5067);
    int _5071 = _5031 * int(_5023);
    int _5073 = _5071 + _4877;
    int _5075 = _5059 * int(_4981);
    int _5077 = _5075 + _4885;
    float _5079 = trunc(_5027);
    float _5081 = precise::max(_5079, 0.0);
    uint _5083 = uint(_5081);
    int _5085 = ~_4843;
    int _5087 = _5085 + 1;
    int _5089 = _5087 * int(_5049);
    int _5091 = _5089 + _4955;
    float _5093 = exp2(_5007);
    float _5095 = float(uint(_5073));
    int _5097 = _5063 * int(_5069);
    int _5099 = _5097 + _4943;
    float _5101 = float(uint(_5091));
    float _5103 = float(uint(_5077));
    float _5105 = as_type<float>(_4933) * _5095;
    float _5107 = 1.0 / _5055;
    int _5109 = int(_4949) + int(_5083);
    float _5111 = as_type<float>(_4965) * _5101;
    float _5113 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _5115 = as_type<float>(_4881) * _5103;
    float _5117 = trunc(_5033);
    float _5119 = precise::max(_5117, 0.0);
    uint _5121 = uint(_5119);
    float _5123 = float(uint(_5099));
    float _5125 = -_5093;
    float _5127 = _5125 + 1.0;
    float _5129 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _5131 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _5133 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _5135 = as_type<float>(_4951) * _5123;
    float _5137 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[78].w, _5129);
    float _5139 = trunc(_5015);
    float _5141 = precise::max(_5139, 0.0);
    uint _5143 = uint(_5141);
    float _5145 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[88].w, _5133);
    float _5147 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _5113);
    float _5149 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[88].z, _5131);
    float _5151 = _4929 ? _5127 : 0.0;
    float _5153 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _3463);
    int _5155 = ~_3681;
    int _5157 = _5155 + 1;
    float _5159 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _5137);
    float _5161 = trunc(_5115);
    float _5163 = precise::max(_5161, 0.0);
    uint _5165 = uint(_5163);
    int _5167 = ~_4517;
    int _5169 = _5167 + 1;
    float _5171 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].w, _5145);
    float _5173 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _5147);
    int _5175 = ~_4619;
    int _5177 = _5175 + 1;
    int _5179 = int(_4973) + int(_5121);
    int _5181 = _5169 * _5109;
    int _5183 = _5181 + _4821;
    float _5185 = trunc(_5105);
    float _5187 = precise::max(_5185, 0.0);
    uint _5189 = uint(_5187);
    float _5191 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].z, _5149);
    float _5193 = _4841;
    if (_5043)
    {
        float _5195 = _5151 * _5107;
        _168 = _5195;
    }
    float _5197 = _168;
    int _5199 = _5157 * _5051;
    int _5201 = _5199 + _4767;
    bool _5203 = uint(_5183) >= uint(_4517);
    int _5205 = _5177 * _5179;
    int _5207 = _5205 + _4847;
    int _5209 = int(_4961) + int(_5143);
    float _5211 = trunc(_5135);
    float _5213 = precise::max(_5211, 0.0);
    uint _5215 = uint(_5213);
    bool _5217 = uint(_5201) >= uint(_3681);
    int _5219 = ~_4649;
    int _5221 = _5219 + 1;
    bool _5223 = !_5217;
    int _5225 = _5223 ? 0 : (-1);
    bool _5227 = uint(_5207) >= uint(_4619);
    float _5229 = trunc(_5111);
    float _5231 = precise::max(_5229, 0.0);
    uint _5233 = uint(_5231);
    int _5235 = int(_4981) + int(_5165);
    int _5237 = _5221 * _5209;
    int _5239 = _5237 + _4839;
    int _5241 = ~_4731;
    int _5243 = _5241 + 1;
    int _5245 = int(_5023) + int(_5189);
    int _5247 = ~_4789;
    int _5249 = _5247 + 1;
    int _5251 = _5243 * _5235;
    int _5253 = _5251 + _4885;
    int _5255 = int(_5069) + int(_5215);
    int _5257 = ~_4689;
    int _5259 = _5257 + 1;
    int _5261 = _5249 * _5245;
    int _5263 = _5261 + _4877;
    bool _5265 = !_5203;
    int _5267 = _5265 ? 0 : (-1);
    int _5269 = ~_4843;
    int _5271 = _5269 + 1;
    int _5273 = _5259 * _5255;
    int _5275 = _5273 + _4943;
    int _5277 = int(_5049) + int(_5233);
    bool _5279 = uint(_5239) >= uint(_4649);
    bool _5281 = !_5227;
    int _5283 = _5281 ? 0 : (-1);
    int _5285 = _5271 * _5277;
    int _5287 = _5285 + _4955;
    bool _5289 = uint(_5253) >= uint(_4731);
    bool _5291 = !_5279;
    int _5293 = _5291 ? 0 : (-1);
    float _5295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _5297 = uint(_5263) >= uint(_4789);
    bool _5299 = !_5289;
    int _5301 = _5299 ? 0 : (-1);
    bool _5303 = uint(_5275) >= uint(_4689);
    int _5305 = ~_5051;
    int _5307 = _5305 + _5225;
    int _5309 = _5307 + 1;
    float _5311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _5313 = !_5297;
    int _5315 = _5313 ? 0 : (-1);
    int _5317 = ~_5109;
    int _5319 = _5317 + _5267;
    int _5321 = _5319 + 1;
    int _5323 = _3681 * _5309;
    int _5325 = _5323 + _4767;
    bool _5327 = uint(_5287) >= uint(_4843);
    int _5329 = ~_5179;
    int _5331 = _5329 + _5283;
    int _5333 = _5331 + 1;
    int _5335 = _4517 * _5321;
    int _5337 = _5335 + _4821;
    bool _5339 = !_5303;
    int _5341 = _5339 ? 0 : (-1);
    float _5343 = _5295 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _5345 = ~_5209;
    int _5347 = _5345 + _5293;
    int _5349 = _5347 + 1;
    int _5351 = _4619 * _5333;
    int _5353 = _5351 + _4847;
    bool _5355 = _3681 == 0;
    float _5357 = fma(_5343, _2171, -0.5);
    bool _5359 = !_5327;
    int _5361 = _5359 ? 0 : (-1);
    float _5363 = _5311 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _5365 = _4517 == 0;
    int _5367 = _4821 ^ _4517;
    int _5369 = _4767 ^ _3681;
    bool _5371 = !_5355;
    int _5373 = _5371 ? _5325 : (-1);
    int _5375 = _4649 * _5349;
    int _5377 = _5375 + _4839;
    bool _5379 = !_5365;
    int _5381 = _5379 ? _5337 : (-1);
    uint _5383 = uint(int(uint(_5367) >> uint(31)));
    bool _5385 = _4649 == 0;
    uint _5387 = uint(int(uint(_5369) >> uint(31)));
    int _5389 = ~_5315;
    int _5391 = _5245 + _5389;
    int _5393 = _5391 + 1;
    float _5395 = _3979 * _4783;
    int _5397 = ~int(_5383);
    int _5399 = _5397 + 1;
    bool _5401 = !_5385;
    int _5403 = _5401 ? _5377 : (-1);
    float _5405 = -_5395;
    float _5407 = fma(_5405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3979);
    int _5409 = ~_5301;
    int _5411 = _5235 + _5409;
    int _5413 = _5411 + 1;
    int _5415 = ~int(_5387);
    int _5417 = _5415 + 1;
    float _5419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _5421 = _4517 == 0;
    float _5423 = fma(_5407, _5407, _4899);
    bool _5425 = _4619 == 0;
    int _5427 = _5393 ^ _5399;
    int _5429 = _5413 ^ _5417;
    float _5431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _5433 = !_5425;
    int _5435 = _5433 ? _5353 : (-1);
    bool _5437 = _3681 == 0;
    int _5439 = ~_5417;
    int _5441 = _5439 + _5429;
    int _5443 = _5441 + 1;
    int _5445 = ~_5399;
    int _5447 = _5445 + _5427;
    int _5449 = _5447 + 1;
    float _5451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _5453 = !_5437;
    int _5455 = _5453 ? _5443 : (-1);
    bool _5457 = _4619 == 0;
    int _5459 = _4847 ^ _4619;
    bool _5461 = !_5421;
    int _5463 = _5461 ? _5449 : (-1);
    int _5465 = ~_5361;
    int _5467 = _5277 + _5465;
    int _5469 = _5467 + 1;
    float _5471 = _5419 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _5473 = float(_5435);
    bool _5475 = _4649 == 0;
    float _5477 = fma(_5471, _2221, -0.5);
    int _5479 = _4839 ^ _4649;
    float _5481 = _5431 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _5483 = ~_5341;
    int _5485 = _5255 + _5483;
    int _5487 = _5485 + 1;
    float _5489 = fma(_5471, _5473, _4403);
    float _5491 = float(_5373);
    float _5493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _5495 = float(_5381);
    float _5497 = fma(_5481, _2209, -0.5);
    uint _5499 = uint(int(uint(_5459) >> uint(31)));
    float _5501 = fma(_5343, _5491, _4017);
    float _5503 = float(_5403);
    float _5505 = fma(_5481, _5495, _4287);
    int _5507 = ~int(_5499);
    int _5509 = _5507 + 1;
    float _5511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _5513 = _5451 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    uint _5515 = uint(int(uint(_5479) >> uint(31)));
    float _5517 = fma(_5173, _5357, _5501);
    int _5519 = _5487 ^ _5509;
    float _5521 = fma(_5513, _2287, -0.5);
    float _5523 = fma(_5513, _5503, _4267);
    int _5525 = ~int(_5515);
    int _5527 = _5525 + 1;
    float _5529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _5531 = ~_5509;
    int _5533 = _5531 + _5519;
    int _5535 = _5533 + 1;
    float _5537 = fma(_4073, _5521, _5523);
    float _5539 = fma(_5363, _3393, -0.5);
    int _5541 = _5469 ^ _5527;
    float _5543 = _5493 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _5545 = !_5457;
    int _5547 = _5545 ? _5535 : (-1);
    float _5549 = fma(_4277, _5497, _5505);
    float _5551 = float(_5455);
    float _5553 = _5511 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5555 = float(_5547);
    float _5557 = fma(_5543, _3423, -0.5);
    int _5559 = ~_5527;
    int _5561 = _5559 + _5541;
    int _5563 = _5561 + 1;
    float _5565 = fma(_5553, _3419, -0.5);
    float _5567 = -_5153;
    float _5569 = fma(_5363, _5551, _5567);
    float _5571 = -_4291;
    float _5573 = fma(_5553, _5555, _5571);
    bool _5575 = !_4443;
    int _5577 = _5575 ? 0 : 1;
    float _5579 = _5529 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _5581 = !_5475;
    int _5583 = _5581 ? _5563 : (-1);
    float _5585 = fma(_5159, _5539, _5569);
    float _5587 = float(_5463);
    float _5589 = fma(_5579, _3403, -0.5);
    float _5591 = float(_5583);
    float _5593 = fma(_5171, _5565, _5573);
    int _5595 = abs(_5577);
    float _5597 = -_4393;
    float _5599 = fma(_5579, _5587, _5597);
    float _5601 = in.m_79.x;
    float _5603 = in.m_79.y;
    float _5605 = in.m_79.z;
    float _5607 = -_4271;
    float _5609 = fma(_5543, _5591, _5607);
    float _5611 = fma(_5191, _5477, _5489);
    float _5613 = fma(_4281, _5589, _5599);
    bool _5615 = !_4447;
    int _5617 = _5615 ? 0 : 1;
    float _5619 = fma(_4261, _5557, _5609);
    float _5621 = _5013 + 0.5;
    float _5623 = _4993 + 0.5;
    float _5625 = _5611 + 0.5;
    float _5627 = _5517 + 0.5;
    float _5629 = _5549 + 0.5;
    float _5631 = _5585 + 0.5;
    float _5633 = _5613 + 0.5;
    float _5635 = _5537 + 0.5;
    float _5637 = _5593 + 0.5;
    float _5639 = _5619 + 0.5;
    int _5641 = abs(_5617);
    out.m_81.x = _5621;
    out.m_81.y = _5623;
    bool _5643 = !_4451;
    int _5645 = _5643 ? 0 : 1;
    out.m_83.x = _5627;
    out.m_83.y = _5631;
    out.m_83.z = _5629;
    out.m_83.w = _5633;
    out.m_85.x = _5625;
    out.m_85.y = _5637;
    out.m_87.x = _5635;
    out.m_87.y = _5639;
    float _5647 = float(_4483);
    float _5649 = float(_5595);
    float _5651 = as_type<float>(_5563);
    if (_4095)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5653 = -_4841;
    float _5655 = fma(_5653, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3635);
    float _5657 = _5649 * _5647;
    float _5659 = float(_5641);
    float _5661 = -_4865;
    float _5663 = fma(_5661, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3713);
    float _5665 = float(_3565);
    float _5667 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5669 = _5655 + _5667;
    float _5671 = _5657 * (-2.0);
    float _5673 = -_5395;
    float _5675 = fma(_5673, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3895);
    float _5677 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5679 = _5663 + _5677;
    float _5681 = _5669 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5683 = _5659 * _5665;
    float _5685 = _2129 + (-0.5);
    float _5687 = fma(_5671, _5601, _5601);
    float _5689 = _1940 + _2143;
    float _5691 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5693 = _5675 + _5691;
    float _5695 = fma(_5679, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5681);
    float _5697 = fma(_4217, _5671, _4217);
    float _5699 = fma(_5685, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5687);
    float _5701 = _5689 + (-1.0);
    float _5703 = _5683 * (-2.0);
    float _5705 = fma(_5693, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5695);
    float _5707 = fma(_5697, _5197, _5699);
    float _5709 = fma(_5701, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5711 = _1940 + (-0.5);
    float _5713 = fma(_5703, _5603, _5603);
    bool _5715 = _5705 >= 0.0;
    float _5717 = fma(_5709, _5703, _5709);
    int _5719 = abs(_5645);
    float _5721 = fma(_5711, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5713);
    float _5723 = _5707 * 0.15915493667125701904296875;
    float _5725 = sqrt(_5423);
    float _5727 = fma(_5717, _5197, _5721);
    float _5729 = float(_3925);
    float _5731 = float(_5719);
    float _5733 = _5727 * 0.15915493667125701904296875;
    float _5735 = _2129 + _2143;
    float _5737 = _5681;
    if (_5715)
    {
        _5737 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5739 = _5737;
    float _5741 = _5723 * 6.283185482025146484375;
    float _5743 = sin(_5741);
    float _5745 = _5731 * _5729;
    int _5747 = as_type<int>(_5739);
    if (_5715)
    {
        out.m_49.x = 0.0;
    }
    if (_5715)
    {
        float _5749 = _5739 * 5.0;
        _5747 = as_type<int>(_5749);
    }
    int _5751 = _5747;
    float _5753 = _5735 + (-1.0);
    float _5755 = _5745 * (-2.0);
    float _5757 = _5723 * 6.283185482025146484375;
    float _5759 = cos(_5757);
    if (_5715)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _15614 = as_type<float>(_5751);
        out.gl_Position.z = _15614;
    }
    float _5761 = _5733 * 6.283185482025146484375;
    float _5763 = sin(_5761);
    if (_5715)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5765 = -_3635;
    float _5767 = _5765 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5769 = fma(_5753, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5771 = -_3713;
    float _5773 = _5771 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5775 = -_3895;
    float _5777 = _5775 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5779 = _5767 * _5767;
    float _5781 = fma(_5755, _5605, _5605);
    float _5783 = _2143 + (-0.5);
    float _5785 = fma(_5769, _5755, _5769);
    float _5787 = fma(_5773, _5773, _5779);
    float _5789 = _5733 * 6.283185482025146484375;
    float _5791 = cos(_5789);
    float _5793 = fma(_5783, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5781);
    float _5795 = _4783 * _5725;
    float _5797 = fma(_5777, _5777, _5787);
    float _5799 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5801 = fma(_5785, _5197, _5793);
    float _5803 = in.m_89.x;
    float _5805 = in.m_89.y;
    float _5807 = in.m_89.z;
    float _5809 = _5743 * _5763;
    float _5811 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5813 = rsqrt(_5797);
    float _5815 = _5801 * 0.15915493667125701904296875;
    float _5817 = _5795 * _5799;
    float _5819 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5821 = _5795 * _5811;
    float _5823 = _5759 * _5791;
    float _5825 = _5815 * 6.283185482025146484375;
    float _5827 = sin(_5825);
    float _5829 = _5743 * _5791;
    float _5831 = _5795 * _5819;
    float _5833 = _5773 * _5813;
    float _5835 = _5777 * _5813;
    float _5837 = _5767 * _5813;
    float _5839 = _5815 * 6.283185482025146484375;
    float _5841 = cos(_5839);
    float _5843 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5845 = _5833 * _5843;
    float _5847 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5849 = _5835 * _5847;
    float _5851 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5853 = _5837 * _5851;
    float _5855 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5857 = -_5845;
    float _5859 = fma(_5835, _5855, _5857);
    float _5861 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5863 = -_5849;
    float _5865 = fma(_5837, _5861, _5863);
    float _5867 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5869 = -_5853;
    float _5871 = fma(_5833, _5867, _5869);
    float _5873 = _5859 * _5859;
    float _5875 = fma(_5827, _5823, _5809);
    float _5877 = fma(_5827, _5809, _5823);
    float _5879 = _5759 * _5763;
    float _5881 = fma(_5865, _5865, _5873);
    float _5883 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5805);
    float _5885 = _5759 * _5841;
    float _5887 = fma(_5871, _5871, _5881);
    float _5889 = _5883 * _5817;
    float _5891 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5803);
    float _5893 = -_5879;
    float _5895 = fma(_5827, _5829, _5893);
    float _5897 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5807);
    float _5899 = -_5829;
    float _5901 = fma(_5827, _5879, _5899);
    float _5903 = rsqrt(_5887);
    float _5905 = _5891 * _5831;
    float _5907 = _5885 * _5889;
    float _5909 = _5791 * _5841;
    float _5911 = _5743 * _5841;
    float _5913 = _5897 * _5821;
    float _5915 = -_5889;
    float _5917 = _5827 * _5915;
    float _5919 = fma(_5875, _5905, _5907);
    float _5921 = _5763 * _5841;
    float _5923 = fma(_5909, _5905, _5917);
    float _5925 = _5865 * _5903;
    float _5927 = _5859 * _5903;
    float _5929 = _5871 * _5903;
    float _5931 = _5911 * _5889;
    float _5933 = _5837 * _5925;
    float _5935 = fma(_5901, _5913, _5919);
    float _5937 = _5835 * _5927;
    float _5939 = fma(_5895, _5905, _5931);
    float _5941 = -_5933;
    float _5943 = fma(_5833, _5927, _5941);
    float _5945 = fma(_5921, _5913, _5923);
    float _5947 = -_5937;
    float _5949 = fma(_5837, _5929, _5947);
    float _5951 = fma(_5877, _5913, _5939);
    float _5953 = _5943 * _5935;
    float _5955 = _5655 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5957 = _5949 * _5935;
    float _5959 = fma(_5929, _5945, _5953);
    float _5961 = fma(_5663, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5955);
    float _5963 = fma(_5925, _5945, _5957);
    float _5965 = fma(_5835, _5951, _5959);
    float _5967 = fma(_5675, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5961);
    float _5969 = fma(_5833, _5951, _5963);
    float _5971 = _3895 + _5965;
    float _5973 = _3713 + _5969;
    float _5975 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5977 = _5971 + _5975;
    float _5979 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5981 = _5973 + _5979;
    float _5983 = _5977 * _5977;
    float _5985 = fma(_5981, _5981, _5983);
    float _5987 = _5833 * _5929;
    float _5989 = sqrt(_5985);
    float _5991 = -_5987;
    float _5993 = fma(_5835, _5925, _5991);
    float _5995 = _5993 * _5935;
    float _5997 = fma(_5927, _5945, _5995);
    float _5999 = fma(_5837, _5951, _5997);
    bool _6001 = _5989 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6003 = _3635 + _5999;
    float _6005 = _5951;
    float _6007 = _5987;
    float _6009 = _5973;
    if (!_6001)
    {
        _6005 = _5971;
    }
    float _6011 = _6005;
    float _6013 = _6011;
    if (!_6001)
    {
        _6007 = _6003;
    }
    float _6015 = _6007;
    bool _6017 = !_6001;
    float _6019 = _6015;
    if (!_6017)
    {
        float _6021 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6023 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _6025 = _5989 + _6023;
        float _6027 = _6003 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6029 = _6025 * _6021;
        float _6031 = rsqrt(_5985);
        float _6033 = _6029 * 0.15915493667125701904296875;
        float _6035 = _6033 * 6.283185482025146484375;
        float _6037 = cos(_6035);
        float _6039 = _6033 * 6.283185482025146484375;
        float _6041 = sin(_6039);
        float _6043 = _6037 + (-1.0);
        float _6045 = _6043 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6047 = fma(_6041, _6027, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _6049 = fma(_6003, _6037, _6045);
        float _6051 = _6031 * _6047;
        float _6053 = fma(_5981, _6051, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _6055 = fma(_5977, _6051, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _6019 = _6049;
        _6009 = _6053;
        _6013 = _6055;
    }
    float _6057 = _6019;
    float _6059 = _6009;
    float _6061 = _6013;
    float _6063 = -_3635;
    float _6065 = _6063 + _6057;
    float _6067 = -_3713;
    float _6069 = _6067 + _6059;
    float _6071 = -_3895;
    float _6073 = _6071 + _6061;
    float _6075 = _5967 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _6077 = _6065 * _6065;
    float _6079 = _5655 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _6081 = 1.0 / _6075;
    float _6083 = fma(_6069, _6069, _6077);
    bool _6085 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _6087 = isnan(0.5);
    bool _6089 = _6085 || _6087;
    bool _6091 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _6093 = _6089 || _6091;
    bool _6095 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _6097 = isnan(0.5);
    bool _6099 = _6095 || _6097;
    bool _6101 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _6103 = _6099 || _6101;
    float _6105 = fma(_6073, _6073, _6083);
    float _6107 = fma(_5663, (*spvDescriptorSet0.vp_c8)._m0[10].x, _6079);
    float _6109 = sqrt(_6105);
    float _6111 = fma(_5675, (*spvDescriptorSet0.vp_c8)._m0[10].z, _6107);
    float _6113 = _6111 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _6115 = _6113 + _6075;
    float _6117 = _6115 * _6081;
    float _6119 = _6117 * 0.5;
    bool _6121 = _6109 > 0.0;
    float _6123 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6125 = fma(_6119, (*spvDescriptorSet0.vp_c8)._m0[30].w, _6123);
    float _6127 = 1.0 / _6125;
    bool _6129 = !_6121;
    float _6131 = _6057;
    float _6133 = _6059;
    float _6135 = _6061;
    float _6137 = _6115;
    if (!_6129)
    {
        float _6139 = _228 * _228;
        float _6141 = rsqrt(_6105);
        float _6143 = fma(_224, _224, _6139);
        float _6145 = fma(_230, _230, _6143);
        float _6147 = sqrt(_6145);
        float _6149 = _6069 * _6141;
        float _6151 = _6065 * _6141;
        float _6153 = _6073 * _6141;
        bool _6155 = _6147 > 0.0;
        bool _6157 = !_6155;
        _6137 = _6147;
        if (!_6157)
        {
            float _6159 = rsqrt(_6145);
            float _6161 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _6163 = _228 * _6159;
            float _6165 = _224 * _6159;
            float _6167 = _6151 * _6163;
            float _6169 = _230 * _6159;
            float _6171 = fma(_6149, _6165, _6167);
            float _6173 = _6161 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6175 = fma(_6153, _6169, _6171);
            float _6177 = _6175 * _6173;
            float _6179 = fma(_224, _6177, _6059);
            float _6181 = fma(_228, _6177, _6057);
            float _6183 = fma(_230, _6177, _6061);
            _6131 = _6181;
            _6133 = _6179;
            _6135 = _6183;
            _6137 = _6177;
        }
    }
    float _6185 = _6131;
    float _6187 = _6133;
    float _6189 = _6135;
    float _6191 = _6137;
    float _6193 = -_4841;
    float _6195 = fma(_6193, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6185);
    float _6197 = -_4865;
    float _6199 = fma(_6197, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6187);
    float _6201 = -_5395;
    float _6203 = fma(_6201, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6189);
    float _6205 = _6195;
    float _6207 = _6199;
    float _6209 = _6203;
    float _6211 = _6191;
    if (_6103)
    {
        _5193 = 1.0;
    }
    float _6213 = _5193;
    float _6215 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6217 = _6127 * _6215;
    float _6219 = _6213;
    if (!_6093)
    {
        float _6221 = _5669 * _5669;
        float _6223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6225 = -_3895;
        float _6227 = _6225 + _6189;
        float _6229 = -_3635;
        float _6231 = _6229 + _6185;
        float _6233 = fma(_5679, _5679, _6221);
        float _6235 = fma(_5693, _5693, _6233);
        float _6237 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6239 = sqrt(_6235);
        float _6241 = 1.0 / _5795;
        float _6243 = precise::min(_6239, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6245 = _6243 * _6223;
        float _6247 = _6237 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6249 = -_3713;
        float _6251 = _6249 + _6187;
        float _6253 = _6245 * _6241;
        float _6255 = _6247 * _6253;
        float _6257 = _6227 * _6253;
        float _6259 = fma(_6251, _6255, _5663);
        float _6261 = fma(_6231, _6255, _5655);
        float _6263 = fma(_6247, _6257, _5675);
        _6205 = _6261;
        _6207 = _6259;
        _6209 = _6263;
    }
    float _6265 = _6205;
    float _6267 = _6207;
    float _6269 = _6209;
    if (!_6103)
    {
        float _6271 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6273 = _6271 * 0.15915493667125701904296875;
        float _6275 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6277 = _6273 * 6.283185482025146484375;
        float _6279 = cos(_6277);
        float _6281 = _6275 * 0.15915493667125701904296875;
        float _6283 = _6273 * 6.283185482025146484375;
        float _6285 = sin(_6283);
        float _6287 = 1.0 / _6279;
        float _6289 = _6281 * 6.283185482025146484375;
        float _6291 = cos(_6289);
        float _6293 = _6285 * _6287;
        float _6295 = _6281 * 6.283185482025146484375;
        float _6297 = sin(_6295);
        float _6299 = _6291 * _6293;
        float _6301 = 1.0 / _6299;
        float _6303 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6305 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6303;
        float _6307 = 1.0 / _6305;
        float _6309 = _6297 * _6301;
        float _6311 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6313 = fma(_6217, _6309, _6311);
        float _6315 = _6313 * _6307;
        float _6317 = precise::clamp(_6315, 0.0, 1.0);
        _6211 = _6273;
        _6219 = _6317;
    }
    float _6319 = _6211;
    float _6321 = _6219;
    float _6323 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6325 = _6265 + _6323;
    float _6327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6329 = _6267 + _6327;
    float _6331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6333 = _6269 + _6331;
    float _6335 = _6325 * _6325;
    float _6337 = fma(_6329, _6329, _6335);
    float _6339 = fma(_6333, _6333, _6337);
    float _6341 = rsqrt(_6339);
    float _6343 = sqrt(_6339);
    float _6345 = _6341 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6347 = _6329 * _6345;
    float _6349 = _6333 * _6345;
    float _6351 = _6347 * _6347;
    float _6353 = _6349 * _6349;
    float _6355 = _6351 + _6353;
    float _6357 = sqrt(_6355);
    bool _6359 = _6357 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6361 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6363 = _6357 + _6361;
    float _6365 = _6333;
    float _6367 = _6355;
    float _6369 = _6363;
    float _6371 = _6319;
    float _6373 = _6345;
    if (_6359)
    {
        float _6375 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6365 = _6375;
    }
    float _6377 = _6365;
    if (_6359)
    {
        float _6379 = rsqrt(_6355);
        _6367 = _6379;
    }
    float _6381 = _6367;
    if (_6359)
    {
        float _6383 = _6363 * _6377;
        _6369 = _6383;
    }
    float _6385 = _6369;
    if (_6359)
    {
        float _6387 = _6385 * 0.15915493667125701904296875;
        _6371 = _6387;
    }
    float _6389 = _6371;
    float _6391 = _6335;
    if (_6359)
    {
        float _6393 = _6389 * 6.283185482025146484375;
        float _6395 = sin(_6393);
        _6391 = _6395;
    }
    float _6397 = _6391;
    float _6399 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6401 = precise::max(0.0, _6399);
    float _6403 = _6341;
    float _6405 = _6399;
    float _6407 = _6401;
    if (_6359)
    {
        float _6409 = _6389 * 6.283185482025146484375;
        float _6411 = cos(_6409);
        _6403 = _6411;
    }
    float _6413 = _6403;
    float _6415 = -_6345;
    float _6417 = -_6401;
    float _6419 = fma(_6325, _6415, _6417);
    float _6421 = _6419;
    if (_6359)
    {
        float _6423 = _6419 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6405 = _6423;
    }
    float _6425 = _6405;
    float _6427 = _6425;
    float _6429 = _6397;
    if (_6359)
    {
        float _6431 = fma(_6397, _6425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6427 = _6431;
    }
    float _6433 = _6427;
    float _6435 = fma(_5663, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6437 = _6433;
    float _6439 = _6413;
    if (_6359)
    {
        float _6441 = _6413 + (-1.0);
        _6407 = _6441;
    }
    float _6443 = _6407;
    float _6445 = _6443;
    if (_6359)
    {
        float _6447 = _6381 * _6433;
        _6373 = _6447;
    }
    float _6449 = _6373;
    if (!_6359)
    {
        _6437 = _6349;
    }
    float _6451 = _6437;
    float _6453 = _6451;
    if (_6359)
    {
        float _6455 = _6443 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6429 = _6455;
    }
    float _6457 = _6429;
    float _6459 = _6457;
    if (!_6359)
    {
        _6445 = _6347;
    }
    float _6461 = _6445;
    float _6463 = _6461;
    if (_6359)
    {
        float _6465 = _6347 * _6449;
        _6463 = _6465;
    }
    float _6467 = _6463;
    if (_6359)
    {
        float _6469 = _6349 * _6449;
        _6453 = _6469;
    }
    float _6471 = _6453;
    if (_6359)
    {
        float _6473 = fma(_6419, _6413, _6457);
        _6421 = _6473;
    }
    float _6475 = _6421;
    if (!_6359)
    {
        _6459 = _6351;
    }
    float _6477 = _6459;
    float _6479 = _6477;
    if (_6359)
    {
        float _6481 = _6467 * _6467;
        _6479 = _6481;
    }
    float _6483 = _6479;
    if (!_6359)
    {
        _6439 = _6353;
    }
    float _6485 = _6439;
    float _6487 = _6485;
    if (_6359)
    {
        float _6489 = _6471 * _6471;
        _6487 = _6489;
    }
    float _6491 = _6487;
    float _6493 = fma(_6475, _6475, _6483);
    float _6495 = _6265 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6497 = floor(_6435);
    float _6499 = _6493 + _6491;
    float _6501 = fma(_6267, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6495);
    float _6503 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6505 = fma(_6343, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6503);
    float _6507 = precise::clamp(_6505, 0.0, 1.0);
    float _6509 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6501);
    float _6511 = -_6507;
    float _6513 = _6511 + 1.0;
    float _6515 = rsqrt(_6499);
    float _6517 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6519 = _6509 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6521 = _6265 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6523 = fma(_5675, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6525 = _6519 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6527 = abs(_6513);
    float _6529 = log2(_6527);
    float _6531 = _6265 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6533 = -_6525;
    float _6535 = fma(_6533, _6517, 1.0);
    float _6537 = _6265 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6539 = -_6497;
    float _6541 = _6435 + _6539;
    float _6543 = fma(_6267, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6531);
    float _6545 = _6515 * _6467;
    float _6547 = _6515 * _6475;
    float _6549 = _6515 * _6471;
    float _6551 = fma(_6267, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6537);
    float _6553 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6543);
    float _6555 = fma(_6267, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6521);
    float _6557 = _6545 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6559 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6551);
    float _6561 = _6553 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6563 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6555);
    float _6565 = -_6557;
    float _6567 = fma(_6547, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6565);
    float _6569 = _6559 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6571 = _6561 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6573 = _6563 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6575 = -_6549;
    float _6577 = fma(_6575, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6567);
    float _6579 = _6529 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6581 = fma(_6569, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6571);
    float _6583 = floor(_6523);
    float _6585 = fma(_6577, -0.5, 0.5);
    float _6587 = _6561 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6589 = fma(_6519, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6581);
    float _6591 = fma(_6577, 0.5, 0.5);
    float _6593 = fma(_6569, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6587);
    float _6595 = fma(_6573, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6589);
    float _6597 = exp2(_6579);
    float _6599 = _6561 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6601 = fma(_6519, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6593);
    float _6603 = fma(_6591, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6605 = fma(_6569, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6599);
    float _6607 = fma(_6591, _6603, -0.212114393711090087890625);
    float _6609 = log2(_6535);
    float _6611 = fma(_6519, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6605);
    float _6613 = _6547 + 1.0;
    float _6615 = -_6583;
    float _6617 = _6523 + _6615;
    float _6619 = fma(_6591, _6607, 1.570728778839111328125);
    float _6621 = fma(_6573, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6611);
    float _6623 = fma(_6573, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6601);
    float _6625 = 1.0 / _6595;
    float _6627 = -_6547;
    float _6629 = fma(_6597, _6613, _6627);
    float _6631 = sqrt(_6585);
    float _6633 = _6609 * 0.693147182464599609375;
    float2 _16998 = float2(_6541, _6617);
    float _6635 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16998, float2(0.0), isnan(_16998)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16998, float2(0.0), isnan(_16998)), level(0.0)).x;
    float _6637 = fma(_6629, 0.5, 0.5);
    float _6639 = _6633 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6641 = _6621 * _6625;
    float _6643 = _6623 * _6625;
    float _6645 = fma(_6641, 0.5, 0.5);
    float _6647 = fma(_6643, -0.5, 0.5);
    float _6649 = _6631 * 0.636619746685028076171875;
    float3 _17028 = float3(_6645, _6647, _6639);
    float _6651 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_17028, float3(0.0), isnan(_17028)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_17028, float3(0.0), isnan(_17028)), level(0.0)).x;
    float3 _17039 = float3(_6645, _6647, _6639);
    float4 _6654 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_17039, float3(0.0), isnan(_17039)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_17039, float3(0.0), isnan(_17039)), level(0.0)).xyzw;
    float _6656 = _6654.x;
    float _6658 = _6654.y;
    float _6660 = _6654.z;
    float _6662 = _6654.w;
    float _6664 = -_6619;
    float _6666 = fma(_6649, _6664, 1.0);
    float2 _17060 = float2(_6666, _6637);
    float3 _6670 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_17060, float2(0.0), isnan(_17060)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_17060, float2(0.0), isnan(_17060)), level(0.0)).xyz;
    float _6672 = _6670.x;
    float _6674 = _6670.y;
    float _6676 = _6670.z;
    float _6678 = abs(_6217);
    float _6680 = log2(_6678);
    float _6682 = in.m_91.x;
    float _6684 = in.m_91.y;
    float _6686 = in.m_91.z;
    bool _6688 = _5805 != 0.0;
    bool _6690 = isnan(_5805);
    bool _6692 = _6688 || _6690;
    bool _6694 = isnan(0.0);
    bool _6696 = _6692 || _6694;
    float _6698 = _6529 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6700 = in.m_93.x;
    float _6702 = in.m_93.y;
    float _6704 = in.m_93.z;
    float _6706 = in.m_93.w;
    bool _6708 = _5803 == 0.0;
    bool _6710 = !_6696;
    bool _6712 = _6708 && _6710;
    float _6714 = exp2(_6698);
    bool _6716 = _5807 == 0.0;
    bool _6718 = _6716 && _6712;
    out.m_95.x = _5663;
    out.m_95.y = _5655;
    out.m_95.z = _5675;
    bool _6720 = _6217 <= 8000.0;
    bool _6722 = isnan(_6217);
    bool _6724 = _6720 || _6722;
    bool _6726 = isnan(8000.0);
    bool _6728 = _6724 || _6726;
    float _6730 = float(_6728);
    float _6732 = _6680 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6734 = exp2(_6732);
    float _6736 = _6645;
    float _6738 = _6647;
    float _6740 = _6682;
    float _6742 = _6595;
    float _6744 = _6623;
    if (_6718)
    {
        _4117 = _6682;
    }
    float _6746 = _4117;
    float _6748 = -_6714;
    float _6750 = _6748 + 1.0;
    float _6752 = _6746;
    if (_6718)
    {
        _5651 = _6684;
    }
    float _6754 = _5651;
    float _6756 = _6754;
    if (_6718)
    {
        _4301 = _6686;
    }
    float _6758 = _4301;
    float _6760 = _6750 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6762 = _6758;
    if (_6718)
    {
        _6736 = _6746;
    }
    float _6764 = _6736;
    float _6766 = _6764;
    if (!_6718)
    {
        _6752 = _6682;
    }
    float _6768 = _6752;
    if (_6718)
    {
        _6738 = _6754;
    }
    float _6770 = _6738;
    float _6772 = _6770;
    if (_6718)
    {
        _6740 = _6758;
    }
    float _6774 = _6740;
    float _6776 = fma(_6734, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6778 = precise::clamp(_6776, 0.0, 1.0);
    float _6780 = _6774;
    if (!_6718)
    {
        _6756 = _6684;
    }
    float _6782 = _6756;
    if (!_6718)
    {
        float _6784 = fma(_5803, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6768);
        _6766 = _6784;
    }
    float _6786 = _6766;
    if (!_6718)
    {
        _6762 = _6686;
    }
    float _6788 = _6762;
    if (!_6718)
    {
        float _6790 = fma(_5805, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6782);
        _6772 = _6790;
    }
    float _6792 = _6772;
    float _6794 = _6704 * _6768;
    float _6796 = _6702 * _6788;
    float _6798 = _6700 * _6782;
    if (!_6718)
    {
        float _6800 = fma(_5807, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6788);
        _6780 = _6800;
    }
    float _6802 = _6780;
    float _6804 = -_6794;
    float _6806 = fma(_6700, _6788, _6804);
    float _6808 = -_6796;
    float _6810 = fma(_6704, _6782, _6808);
    float _6812 = fma(_6778, -2.0, 3.0);
    float _6814 = -_6798;
    float _6816 = fma(_6702, _6768, _6814);
    float _6818 = _6778 * _6778;
    float _6820 = _6806 * _6706;
    float _6822 = _6810 * _6706;
    float _6824 = _6816 * _6706;
    float _6826 = _6818 * _6812;
    float _6828 = _5875 * _5993;
    float _6830 = _5885 * _5949;
    float _6832 = _5885 * _5993;
    float _6834 = _5885 * _5943;
    float _6836 = _5875 * _5949;
    float _6838 = _5901 * _5949;
    float _6840 = _5901 * _5993;
    float _6842 = _5875 * _5943;
    float _6844 = _5901 * _5943;
    float _6846 = fma(_5909, _5927, _6828);
    float _6848 = -_5827;
    float _6850 = fma(_6848, _5925, _6830);
    float _6852 = -_5827;
    float _6854 = fma(_6852, _5927, _6832);
    float _6856 = -_5827;
    float _6858 = fma(_6856, _5929, _6834);
    float _6860 = -_6826;
    float _6862 = _6860 + 1.0;
    float _6864 = fma(_5909, _5925, _6836);
    float _6866 = fma(_5909, _5929, _6842);
    float _6868 = fma(_5921, _5927, _6840);
    float _6870 = fma(_6862, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6826);
    float _6872 = fma(_5921, _5925, _6838);
    float _6874 = fma(_5911, _5833, _6850);
    float _6876 = fma(_5911, _5837, _6854);
    float _6878 = fma(_5911, _5835, _6858);
    float _6880 = fma(_5921, _5929, _6844);
    float _6882 = fma(_5895, _5833, _6864);
    float _6884 = fma(_5895, _5837, _6846);
    float _6886 = fma(_5895, _5835, _6866);
    float _6888 = fma(_5877, _5837, _6868);
    float _6890 = fma(_5877, _5833, _6872);
    float _6892 = _6874 * _6702;
    float _6894 = _6876 * _6702;
    float _6896 = _6878 * _6702;
    float _6898 = fma(_5877, _5835, _6880);
    float _6900 = _6561 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6902 = _6820 * _6874;
    float _6904 = _6820 * _6876;
    float _6906 = _6730 * _6870;
    float _6908 = _6820 * _6878;
    float _6910 = _6874 * _6792;
    float _6912 = _6876 * _6792;
    float _6914 = fma(_6569, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6900);
    float _6916 = _6878 * _6792;
    float _6918 = fma(_6884, _6700, _6894);
    float _6920 = fma(_6822, _6882, _6902);
    float _6922 = fma(_6822, _6884, _6904);
    float _6924 = fma(_6822, _6886, _6908);
    float _6926 = fma(_6882, _6700, _6892);
    float _6928 = fma(_6882, _6786, _6910);
    float _6930 = fma(_6884, _6786, _6912);
    float _6932 = fma(_6519, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6914);
    float _6934 = fma(_6886, _6786, _6916);
    float _6936 = fma(_6888, _6704, _6918);
    float _6938 = fma(_6824, _6890, _6920);
    float _6940 = fma(_6824, _6888, _6922);
    float _6942 = fma(_6824, _6898, _6924);
    float _6944 = fma(_6573, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6932);
    float _6946 = in.m_97.x;
    float _6948 = fma(_6886, _6700, _6896);
    float _6950 = fma(_6890, _6704, _6926);
    float _6952 = _6944 + _6595;
    float _6954 = _6906 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6956 = fma(_6898, _6704, _6948);
    float _6958 = _6952 * 0.5;
    float _6960 = fma(_6888, _6802, _6930);
    out.gl_Position.x = _6621;
    out.gl_Position.y = _6623;
    out.gl_Position.z = _6944;
    out.gl_Position.w = _6595;
    float _6962 = fma(_6890, _6802, _6928);
    float _6964 = fma(_6898, _6802, _6934);
    out.m_99.x = _6950;
    out.m_99.y = _6936;
    out.m_99.z = _6956;
    bool _6966 = _6343 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6968 = isnan(_6343);
    bool _6970 = _6966 || _6968;
    bool _6972 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6974 = _6970 || _6972;
    float _6976 = _6321 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_101.x = _6938;
    out.m_101.y = _6940;
    out.m_101.z = _6942;
    out.m_103.z = _6958;
    out.m_103.w = _6595;
    out.m_105.x = _6962;
    out.m_105.y = _6960;
    out.m_105.z = _6964;
    float _6978 = _6802;
    float _6980 = _6944;
    float _6982 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_6974)
    {
        _6978 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6984 = _6978;
    float _6986 = _6984;
    float _6988 = _6984;
    if (!_6974)
    {
        _6742 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6990 = _6742;
    float _6992 = _6990;
    float _6994 = _6990;
    if (!_6974)
    {
        _6980 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6996 = _6980;
    float _6998 = _6996;
    float _7000 = _6996;
    if (!_6974)
    {
        _6744 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _7002 = _6744;
    float _7004 = -_6635;
    float _7006 = _7004 + 1.0;
    float _7008 = _7006 * _6954;
    float _7010 = precise::clamp(_7008, 0.0, 1.0);
    float _7012 = -_7010;
    float _7014 = fma(_7012, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _7016 = _7002;
    float _7018 = _7002;
    if (!_6974)
    {
        _6982 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _7020 = _6982;
    float _7022 = _7014 * _6946;
    float _7024 = _6760 * _6651;
    float _7026 = -_6760;
    float _7028 = _7026 + 1.0;
    float _7030 = _7022 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _7032 = _6662 * _7024;
    float _7034 = _6662 * _7028;
    out.m_107.x = _7030;
    float _7036 = _6676 * _7024;
    float _7038 = fma(_6672, _7032, _6656);
    float _7040 = fma(_6674, _7032, _6658);
    float _7042 = _7024;
    float _7044 = _7020;
    float _7046 = _7020;
    if (!_6974)
    {
        _7042 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _7048 = _7042;
    float _7050 = fma(_6662, _7036, _6660);
    out.m_109.x = _7038;
    out.m_109.y = _7040;
    out.m_109.z = _7050;
    out.m_109.w = _7034;
    bool _7052 = !_6974;
    float _7054 = _7048;
    float _7056 = _7048;
    if (!_7052)
    {
        bool _7058 = _6343 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _7060 = isnan(_6343);
        bool _7062 = _7058 || _7060;
        bool _7064 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _7066 = _7062 || _7064;
        if (!_7066)
        {
            float _7068 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7070 = _6343 + _7068;
            float _7072 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7074 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _7072;
            float _7076 = 1.0 / _7074;
            float _7078 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _7080 = _7078 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _7082 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _7084 = _7082 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _7086 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _7088 = _7086 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _7090 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _7092 = _7090 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _7094 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _7096 = _7094 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _7098 = _7070 * _7076;
            float _7100 = precise::clamp(_7098, 0.0, 1.0);
            float _7102 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _7104 = _7102 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _7106 = fma(_7100, _7084, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _7108 = fma(_7100, _7104, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _7110 = fma(_7100, _7080, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _7112 = fma(_7100, _7088, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _7114 = fma(_7100, _7092, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _7116 = fma(_7100, _7096, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _7018 = _7110;
            _6988 = _7114;
            _7000 = _7108;
            _7046 = _7112;
            _7056 = _7106;
            _6994 = _7116;
            _7118 = true;
        }
        else
        {
            bool _7120 = _6343 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _7122 = isnan(_6343);
            bool _7124 = _7120 || _7122;
            bool _7126 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _7128 = _7124 || _7126;
            if (!_7128)
            {
                _7044 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _7130 = _7044;
            _7046 = _7130;
            if (!_7128)
            {
                _6986 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _7132 = _6986;
            _6988 = _7132;
            if (!_7128)
            {
                _6992 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _7134 = _6992;
            _6994 = _7134;
            if (!_7128)
            {
                _6998 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _7136 = _6998;
            _7000 = _7136;
            if (!_7128)
            {
                _7016 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _7138 = _7016;
            _7018 = _7138;
            if (!_7128)
            {
                _7054 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _7140 = _7054;
            bool _7142 = !_7128;
            _7056 = _7140;
            if (!_7142)
            {
                bool _7144 = _6343 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _7146 = isnan(_6343);
                bool _7148 = _7144 || _7146;
                bool _7150 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _7152 = _7148 || _7150;
                if (!_7152)
                {
                    float _7154 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7156 = _6343 + _7154;
                    float _7158 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7160 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _7158;
                    float _7162 = 1.0 / _7160;
                    float _7164 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _7166 = _7164 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _7168 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _7170 = _7168 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _7172 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _7174 = _7172 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _7176 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _7178 = _7176 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _7180 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _7182 = _7180 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _7184 = _7156 * _7162;
                    float _7186 = precise::clamp(_7184, 0.0, 1.0);
                    float _7188 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _7190 = _7188 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _7192 = fma(_7186, _7170, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _7194 = fma(_7186, _7190, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _7196 = fma(_7186, _7166, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _7198 = fma(_7186, _7174, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _7200 = fma(_7186, _7178, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _7202 = fma(_7186, _7182, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _7018 = _7196;
                    _6988 = _7200;
                    _7000 = _7194;
                    _7046 = _7198;
                    _7056 = _7192;
                    _6994 = _7202;
                    _7118 = true;
                }
                else
                {
                    _7018 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6988 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _7000 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _7046 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _7056 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6994 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _7118 = false;
    float _7204 = _7018;
    float _7206 = _6988;
    float _7208 = _7000;
    float _7210 = _7046;
    float _7212 = _7056;
    float _7214 = _6994;
    float _7216 = fma(_6960, -0.5, 0.5);
    float _7218 = precise::clamp(_7216, 0.0, 1.0);
    float _7220 = -_7204;
    float _7222 = _7206 + _7220;
    float _7224 = _6976 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _7226 = -_7208;
    float _7228 = _7210 + _7226;
    float _7230 = fma(_7218, _7222, _7204);
    out.m_111.x = 0.0;
    float _7232 = -_7212;
    float _7234 = _7214 + _7232;
    float _7236 = fma(_7218, _7228, _7208);
    float _7238 = _7230 * 0.586610972881317138671875;
    out.m_49.x = _7224;
    bool _7240 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _7242 = fma(_7218, _7234, _7212);
    float _7244 = fma(_7236, 0.298911988735198974609375, _7238);
    bool _7246 = _6321 > 0.0;
    bool _7248 = isnan(_6321);
    bool _7250 = _7246 || _7248;
    bool _7252 = isnan(0.0);
    bool _7254 = _7250 || _7252;
    float _7256 = fma(_7242, 0.114477999508380889892578125, _7244);
    float _7258 = -_7256;
    float _7260 = _7236 + _7258;
    float _7262 = -_7256;
    float _7264 = _7230 + _7262;
    float _7266 = -_7256;
    float _7268 = _7242 + _7266;
    float _7270 = fma(_7260, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7256);
    float _7272 = fma(_7264, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7256);
    float _7274 = fma(_7268, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7256);
    bool _7276 = !_7240;
    if (!_7276)
    {
        float _7278 = -_6265;
        float _7280 = _7278 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _7282 = -_6267;
        float _7284 = _7282 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _7286 = -_6269;
        float _7288 = _7286 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _7290 = _7280 * _7280;
        float _7292 = fma(_7284, _7284, _7290);
        float _7294 = fma(_7288, _7288, _7292);
        float _7296 = sqrt(_7294);
        float _7298 = rsqrt(_7294);
        float _7300 = -_7296;
        float _7302 = _7300 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _7304 = _7302 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _7306 = precise::clamp(_7304, 0.0, 1.0);
        float _7308 = _7284 * _7298;
        float _7310 = _7280 * _7298;
        float _7312 = abs(_7306);
        float _7314 = log2(_7312);
        float _7316 = _7288 * _7298;
        float _7318 = _7308 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _7320 = _6960 * _7310;
        float _7322 = -_7310;
        float _7324 = -_7318;
        float _7326 = fma(_7322, (*spvDescriptorSet0.vp_c15)._m0[656].y, _7324);
        float _7328 = fma(_6962, _7308, _7320);
        float _7330 = -_7316;
        float _7332 = fma(_7330, (*spvDescriptorSet0.vp_c15)._m0[656].z, _7326);
        float _7334 = fma(_6964, _7316, _7328);
        float _7336 = precise::clamp(_7334, 0.0, 1.0);
        float _7338 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _7340 = _7332 + _7338;
        float _7342 = _7314 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _7344 = _7340 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _7346 = precise::clamp(_7344, 0.0, 1.0);
        float _7348 = exp2(_7342);
        float _7350 = _7348 * _7346;
        float _7352 = _7336 * _7350;
        float _7354 = _7352 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _7356 = _7352 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _7358 = _7352 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _7354;
        out.m_111.y = _7356;
        out.m_111.z = _7358;
    }
    out.m_113.x = _7270;
    out.m_113.y = _7272;
    out.m_113.z = _7274;
    if (_7254)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _7360 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _7360;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _7118 = false;
    bool _1806 = false;
    bool _1482 = false;
    bool _1164 = false;
    bool _846 = false;
    bool _704 = false;
    bool _590 = false;
    bool _474 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_46.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (!_136)
    {
        out.m_49.x = 0.0;
    }
    int _142 = 0;
    if (!_136)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7416 = as_type<float>(_146);
        out.gl_Position.z = _7416;
    }
    if (!_136)
    {
        return out;
    }
    float _150 = in.m_51.w;
    bool _152 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_150;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _166 = 0.0;
    float _168 = _164;
    if (_160)
    {
        float _170 = float(_132);
        _166 = _170;
    }
    float _172 = _166;
    bool _174 = _164 >= _172;
    bool _176 = !_160;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_49.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _148 = as_type<int>(_184);
    }
    int _186 = _148;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7486 = as_type<float>(_186);
        out.gl_Position.z = _7486;
    }
    if (_178)
    {
        return out;
    }
    float _188 = in.m_53.x;
    float _190 = in.m_53.y;
    float _192 = in.m_53.z;
    bool _194 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _196 = in.m_55.x;
    float _198 = in.m_55.y;
    float _200 = in.m_55.z;
    float _202 = in.m_57.x;
    float _204 = in.m_57.y;
    float _206 = in.m_57.z;
    float _208 = in.m_59.x;
    float _210 = in.m_59.y;
    float _212 = in.m_59.z;
    float _214 = _190 * _198;
    float _216 = _190 * _204;
    float _218 = fma(_188, _196, _214);
    float _220 = _190 * _210;
    float _222 = fma(_188, _202, _216);
    float _224 = fma(_192, _200, _218);
    float _226 = fma(_188, _208, _220);
    float _228 = fma(_192, _206, _222);
    float _230 = fma(_192, _212, _226);
    bool _232 = !_194;
    float _250;
    if (!_232)
    {
        float _234 = in.m_61.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_132);
        float _256 = 1.0 / _254;
        float _258 = _164 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _260 + _266;
    bool _270 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _272 = isnan(_260);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = _260 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = 1.0 / _284;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _302 = 1.0 / _296;
    float _304 = 1.0 / _292;
    float _306 = _264 * _298;
    bool _308 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_260);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -_280;
    float _322 = _320 + 1.0;
    float _324 = _318 * _322;
    float _326 = _268 * _302;
    bool _328 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _330 = isnan(_260);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _340;
    bool _344 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _346 = isnan(_260);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _360 = -_318;
    float _362 = _360 + 1.0;
    float _364 = -_338;
    float _366 = _364 + 1.0;
    float _368 = _288 * _304;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _374;
    float _378 = _354 * _366;
    float _380 = fma(_342, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _382 = fma(_372, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _384 = fma(_376, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _386 = _338 * _362;
    float _388 = -_354;
    float _390 = _388 + 1.0;
    float _392 = _382 * _378;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = _384 * _378;
    float _404 = _380 * _378;
    float _406 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].x, _392);
    float _408 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _410 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].z, _404);
    float _412 = fma(_358, _326, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _414 = fma(_396, _326, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = fma(_400, _326, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _426;
    float _430 = fma(_412, _386, _406);
    float _432 = fma(_420, _306, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _434 = fma(_424, _306, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _436 = fma(_428, _306, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _438 = fma(_414, _386, _408);
    float _440 = fma(_416, _386, _410);
    float _442 = fma(_432, _324, _430);
    float _444 = fma(_434, _324, _438);
    float _446 = fma(_436, _324, _440);
    float _448 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[146].x, _442);
    float _450 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[146].y, _444);
    float _452 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[146].z, _446);
    bool _454 = !_300;
    float _472;
    if (!_454)
    {
        float _456 = in.m_61.x;
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _460 = _456 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _464 = _462 * _458;
        float _466 = floor(_464);
        float _468 = -_466;
        float _470 = _464 + _468;
        _472 = _470;
        _474 = true;
    }
    else
    {
        float _476 = float(_132);
        float _478 = 1.0 / _476;
        float _480 = _164 * _478;
        _472 = _480;
    }
    _474 = false;
    float _482 = _472;
    float _484 = in.m_63.x;
    float _486 = in.m_63.y;
    float _488 = in.m_63.z;
    bool _490 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _492 = isnan(_482);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _506 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _508 = isnan(_482);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _524 = _482 + _522;
    float _526 = -_500;
    float _528 = _526 + 1.0;
    bool _530 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _532 = 1.0 / _504;
    float _534 = _516 * _528;
    float _536 = -_516;
    float _538 = _536 + 1.0;
    float _540 = _520 * _532;
    float _542 = fma(_540, _524, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _546 = _542 * _534;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _550 = _544 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _552 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[115].x, _546);
    float _554 = _448 * _484;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _558 = _548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _560 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[116].x, _552);
    float _562 = _450 * _486;
    float _564 = _556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = _452 * _488;
    float _568 = _560 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_65.x = _564;
    out.m_65.y = _558;
    out.m_65.z = _550;
    out.m_65.w = _568;
    bool _570 = !_530;
    float _588;
    if (!_570)
    {
        float _572 = in.m_61.x;
        float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _576 = _572 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[11].z, _164);
        float _580 = _578 * _574;
        float _582 = floor(_580);
        float _584 = -_582;
        float _586 = _580 + _584;
        _588 = _586;
        _590 = true;
    }
    else
    {
        float _592 = float(_132);
        float _594 = 1.0 / _592;
        float _596 = _164 * _594;
        _588 = _596;
    }
    _590 = false;
    float _598 = _588;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _602 = _598 + _600;
    bool _604 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _606 = isnan(_598);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _616;
    bool _620 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _622 = isnan(_598);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -_614;
    float _634 = _632 + 1.0;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _636;
    float _640 = 1.0 / _618;
    bool _642 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _644 = _630 * _634;
    float _646 = -_630;
    float _648 = _646 + 1.0;
    float _650 = _602 * _640;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _652;
    float _656 = fma(_638, _650, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _658;
    float _662 = fma(_654, _650, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _664 = _656 * _644;
    float _666 = fma(_660, _650, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _668 = _662 * _644;
    float _670 = _666 * _644;
    float _672 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[123].x, _664);
    float _674 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[123].y, _670);
    float _676 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[123].z, _668);
    float _678 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[124].x, _672);
    float _680 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[124].y, _674);
    float _682 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[124].z, _676);
    bool _684 = !_642;
    float _702;
    if (!_684)
    {
        float _686 = in.m_61.x;
        float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _690 = _686 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[11].w, _164);
        float _694 = _692 * _688;
        float _696 = floor(_694);
        float _698 = -_696;
        float _700 = _694 + _698;
        _702 = _700;
        _704 = true;
    }
    else
    {
        float _706 = float(_132);
        float _708 = 1.0 / _706;
        float _710 = _164 * _708;
        _702 = _710;
    }
    _704 = false;
    float _712 = _702;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _716 = _712 + _714;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _722 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _724 = isnan(_712);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _738 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _740 = isnan(_712);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _750;
    bool _754 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _756 = isnan(_712);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = 1.0 / _720;
    float _768 = -_732;
    float _770 = _768 + 1.0;
    bool _772 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _774 = _748 * _770;
    float _776 = -_748;
    float _778 = _776 + 1.0;
    float _780 = 1.0 / _736;
    float _782 = _752 * _766;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _788 = fma(_782, _716, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _790 = _786 * _780;
    float _792 = _788 * _774;
    float _794 = -_764;
    float _796 = _794 + 1.0;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _800 = _712 + _798;
    float _802 = _678 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _804 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[131].x, _792);
    float _806 = _732 * _796;
    float _808 = fma(_790, _800, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _810 = _682 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _812 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _814 = fma(_808, _806, _804);
    float _816 = _680 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _818 = _810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _820 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[133].x, _814);
    float _822 = _816 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _824 = _820 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.x = _812;
    out.m_67.y = _822;
    out.m_67.z = _818;
    out.m_67.w = _824;
    bool _826 = !_772;
    float _844;
    if (!_826)
    {
        float _828 = in.m_61.x;
        float _830 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _832 = _828 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _834 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[14].x, _164);
        float _836 = _834 * _830;
        float _838 = floor(_836);
        float _840 = -_838;
        float _842 = _836 + _840;
        _844 = _842;
        _846 = true;
    }
    else
    {
        float _848 = float(_132);
        float _850 = 1.0 / _848;
        float _852 = _164 * _850;
        _844 = _852;
    }
    _846 = false;
    float _854 = _844;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _858 = _854 + _856;
    bool _860 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _862 = isnan(_854);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _876 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _878 = isnan(_854);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _888;
    bool _892 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _894 = isnan(_854);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = -_870;
    float _906 = _904 + 1.0;
    float _908 = 1.0 / _874;
    float _910 = _886 * _906;
    float _912 = -_902;
    float _914 = _912 + 1.0;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _920 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _922 = 1.0 / _918;
    float _924 = _890 * _908;
    float _926 = -_886;
    float _928 = _926 + 1.0;
    bool _930 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _932 = isnan(_854);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = fma(_924, _858, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _944 = _902 * _928;
    bool _946 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _948 = isnan(_854);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = _940 * _914;
    float _960 = -_940;
    float _962 = _960 + 1.0;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _966 = _964 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _968 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _970 = isnan(_854);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    float _980 = _956 * _962;
    float _982 = -_956;
    float _984 = _982 + 1.0;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _990 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _992 = isnan(_854);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = 1.0 / _966;
    float _1004 = _978 * _984;
    float _1006 = -_978;
    float _1008 = _1006 + 1.0;
    float _1010 = 1.0 / _988;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1016 = _1000 * _1008;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1022 = _1014 * _922;
    float _1024 = _942 * _1016;
    float _1026 = -_1000;
    float _1028 = _1026 + 1.0;
    float _1030 = 1.0 / _1020;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1038 = _854 + _1036;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1040;
    float _1044 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1024);
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1050 = fma(_1022, _1038, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1052 = _1042 * _1002;
    float _1054 = 1.0 / _1034;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1058 = _854 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1064 = fma(_1050, _1004, _1044);
    float _1066 = fma(_1052, _1058, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1070 = _854 + _1068;
    float _1072 = _1062 * _1010;
    float _1074 = 1.0 / _1048;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1082 = _1080 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1084 = fma(_1066, _980, _1064);
    float _1086 = _1078 * _1030;
    float _1088 = fma(_1072, _1070, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1092 = _854 + _1090;
    float _1094 = _1082 * _1054;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1096;
    bool _1100 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1102 = isnan(_854);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1114 = _854 + _1112;
    float _1116 = fma(_1086, _1092, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1118 = fma(_1088, _958, _1084);
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1122 = _854 + _1120;
    float _1124 = fma(_1094, _1114, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1126 = _1098 * _1074;
    float _1128 = -_1110;
    float _1130 = _1128 + 1.0;
    float _1132 = fma(_1116, _944, _1118);
    float _1134 = fma(_1126, _1122, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1136 = _870 * _1130;
    float _1138 = fma(_1124, _910, _1132);
    float _1140 = fma(_1134, _1136, _1138);
    float _1142 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1140);
    out.m_69.x = _1142;
    bool _1144 = !_920;
    float _1162;
    if (!_1144)
    {
        float _1146 = in.m_61.x;
        float _1148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1150 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1152 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[14].y, _164);
        float _1154 = _1152 * _1148;
        float _1156 = floor(_1154);
        float _1158 = -_1156;
        float _1160 = _1154 + _1158;
        _1162 = _1160;
        _1164 = true;
    }
    else
    {
        float _1166 = float(_132);
        float _1168 = 1.0 / _1166;
        float _1170 = _164 * _1168;
        _1162 = _1170;
    }
    _1164 = false;
    float _1172 = _1162;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1176 = _1172 + _1174;
    bool _1178 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1180 = isnan(_1172);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1192 = _1190 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1194 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1196 = isnan(_1172);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1206;
    bool _1210 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1212 = isnan(_1172);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    float _1222 = -_1188;
    float _1224 = _1222 + 1.0;
    float _1226 = 1.0 / _1192;
    float _1228 = _1204 * _1224;
    float _1230 = -_1220;
    float _1232 = _1230 + 1.0;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1236 = _1234 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1240 = 1.0 / _1236;
    float _1242 = _1208 * _1226;
    float _1244 = -_1204;
    float _1246 = _1244 + 1.0;
    bool _1248 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1250 = isnan(_1172);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1256 = _1252 || _1254;
    float _1258 = float(_1256);
    float _1260 = fma(_1242, _1176, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1262 = _1220 * _1246;
    bool _1264 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1266 = isnan(_1172);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = _1258 * _1232;
    float _1278 = -_1258;
    float _1280 = _1278 + 1.0;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1286 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1288 = isnan(_1172);
    bool _1290 = _1286 || _1288;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1294 = _1290 || _1292;
    float _1296 = float(_1294);
    float _1298 = _1274 * _1280;
    float _1300 = -_1274;
    float _1302 = _1300 + 1.0;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1306 = _1304 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1308 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1310 = isnan(_1172);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    float _1320 = 1.0 / _1284;
    float _1322 = _1296 * _1302;
    float _1324 = -_1296;
    float _1326 = _1324 + 1.0;
    float _1328 = 1.0 / _1306;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1332 = _1330 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1334 = _1318 * _1326;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1338 = _1336 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1340 = _1332 * _1240;
    float _1342 = _1260 * _1334;
    float _1344 = -_1318;
    float _1346 = _1344 + 1.0;
    float _1348 = 1.0 / _1338;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1356 = _1172 + _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1358;
    float _1362 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1342);
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1366 = _1364 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1368 = fma(_1340, _1356, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1370 = _1360 * _1320;
    float _1372 = 1.0 / _1352;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1376 = _1172 + _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1380 = _1378 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1382 = fma(_1368, _1322, _1362);
    float _1384 = fma(_1370, _1376, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1388 = _1172 + _1386;
    float _1390 = _1380 * _1328;
    float _1392 = 1.0 / _1366;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1400 = _1398 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1402 = fma(_1384, _1298, _1382);
    float _1404 = _1396 * _1348;
    float _1406 = fma(_1390, _1388, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1410 = _1172 + _1408;
    float _1412 = _1400 * _1372;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1414;
    bool _1418 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1420 = isnan(_1172);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1426 = _1422 || _1424;
    float _1428 = float(_1426);
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1432 = _1172 + _1430;
    float _1434 = fma(_1404, _1410, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1436 = fma(_1406, _1276, _1402);
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1440 = _1172 + _1438;
    float _1442 = fma(_1412, _1432, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1444 = _1416 * _1392;
    float _1446 = -_1428;
    float _1448 = _1446 + 1.0;
    float _1450 = fma(_1434, _1262, _1436);
    float _1452 = fma(_1444, _1440, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1454 = _1188 * _1448;
    float _1456 = fma(_1442, _1228, _1450);
    float _1458 = fma(_1452, _1454, _1456);
    float _1460 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1458);
    out.m_71.x = _1460;
    bool _1462 = !_1238;
    float _1480;
    if (!_1462)
    {
        float _1464 = in.m_61.x;
        float _1466 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1468 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1470 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[14].z, _164);
        float _1472 = _1470 * _1466;
        float _1474 = floor(_1472);
        float _1476 = -_1474;
        float _1478 = _1472 + _1476;
        _1480 = _1478;
        _1482 = true;
    }
    else
    {
        float _1484 = float(_132);
        float _1486 = 1.0 / _1484;
        float _1488 = _164 * _1486;
        _1480 = _1488;
    }
    _1482 = false;
    float _1490 = _1480;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1494 = _1490 + _1492;
    bool _1496 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1498 = isnan(_1490);
    bool _1500 = _1496 || _1498;
    bool _1502 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1504 = _1500 || _1502;
    float _1506 = float(_1504);
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1510 = _1508 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1512 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1514 = isnan(_1490);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1524;
    bool _1528 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1530 = isnan(_1490);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    float _1540 = -_1506;
    float _1542 = _1540 + 1.0;
    float _1544 = 1.0 / _1510;
    float _1546 = _1522 * _1542;
    float _1548 = -_1538;
    float _1550 = _1548 + 1.0;
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1554 = _1552 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].w;
    float _1558 = 1.0 / _1554;
    float _1560 = _1526 * _1544;
    float _1562 = -_1522;
    float _1564 = _1562 + 1.0;
    bool _1566 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1568 = isnan(_1490);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1574 = _1570 || _1572;
    float _1576 = float(_1574);
    float _1578 = fma(_1560, _1494, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1580 = _1538 * _1564;
    bool _1582 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1584 = isnan(_1490);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = _1576 * _1550;
    float _1596 = -_1576;
    float _1598 = _1596 + 1.0;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1602 = _1600 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1604 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1606 = isnan(_1490);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    float _1616 = _1592 * _1598;
    float _1618 = -_1592;
    float _1620 = _1618 + 1.0;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1624 = _1622 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1626 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1628 = isnan(_1490);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1634 = _1630 || _1632;
    float _1636 = float(_1634);
    float _1638 = 1.0 / _1602;
    float _1640 = _1614 * _1620;
    float _1642 = -_1614;
    float _1644 = _1642 + 1.0;
    float _1646 = 1.0 / _1624;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1652 = _1636 * _1644;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1658 = _1650 * _1558;
    float _1660 = _1578 * _1652;
    float _1662 = -_1636;
    float _1664 = _1662 + 1.0;
    float _1666 = 1.0 / _1656;
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1670 = _1668 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1674 = _1490 + _1672;
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1676;
    float _1680 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1660);
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1684 = _1682 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1686 = fma(_1658, _1674, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1688 = _1678 * _1638;
    float _1690 = 1.0 / _1670;
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1694 = _1490 + _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1698 = _1696 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1700 = fma(_1686, _1640, _1680);
    float _1702 = fma(_1688, _1694, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1706 = _1490 + _1704;
    float _1708 = _1698 * _1646;
    float _1710 = 1.0 / _1684;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1712;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1718 = _1716 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1720 = fma(_1702, _1616, _1700);
    float _1722 = _1714 * _1666;
    float _1724 = fma(_1708, _1706, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1726 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1728 = _1490 + _1726;
    float _1730 = _1718 * _1690;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1732;
    bool _1736 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1738 = isnan(_1490);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1744 = _1740 || _1742;
    float _1746 = float(_1744);
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1750 = _1490 + _1748;
    float _1752 = fma(_1722, _1728, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1754 = fma(_1724, _1594, _1720);
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1758 = _1490 + _1756;
    float _1760 = fma(_1730, _1750, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1762 = _1734 * _1710;
    float _1764 = -_1746;
    float _1766 = _1764 + 1.0;
    float _1768 = fma(_1752, _1580, _1754);
    float _1770 = fma(_1762, _1758, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1772 = _1506 * _1766;
    float _1774 = fma(_1760, _1546, _1768);
    float _1776 = fma(_1770, _1772, _1774);
    float _1778 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1776);
    out.m_73.x = _1778;
    bool _1780 = !_1556;
    float _1782 = _1710;
    float _1784 = _1646;
    int _1786 = as_type<int>(_1690);
    float _1804;
    if (!_1780)
    {
        float _1788 = in.m_61.x;
        float _1790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].w;
        float _1792 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[15].w;
        float _1794 = fma(_1792, (*spvDescriptorSet0.vp_c9)._m0[14].w, _164);
        float _1796 = _1794 * _1790;
        float _1798 = floor(_1796);
        float _1800 = -_1798;
        float _1802 = _1796 + _1800;
        _1804 = _1802;
        _1806 = true;
    }
    else
    {
        float _1808 = float(_132);
        float _1810 = 1.0 / _1808;
        float _1812 = _164 * _1810;
        _1804 = _1812;
    }
    _1806 = false;
    float _1814 = _1804;
    float _1816 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1818 = int(_1816);
    float _1820 = float(_132);
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1824 = _1822 != 0;
    float _1826 = in.m_75.x;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1830 = _1828 != 0;
    float _1832 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1834 = int(_1832);
    int _1836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1838 = _1836 != 0;
    float _1840 = 0.0;
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _1844 = _1826;
    if (_1824)
    {
        _1840 = 1.0;
    }
    float _1846 = _1840;
    float _1848 = float(_1818);
    float _1850 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1852 = int(_1850);
    float _1854 = 0.0;
    float _1856 = _1846;
    if (_1824)
    {
        _1854 = 1.0;
    }
    float _1858 = _1854;
    float _1860 = _1746;
    float _1862 = _1858;
    if (_1830)
    {
        float _1864 = in.m_61.z;
        _1860 = _1864;
    }
    float _1866 = _1860;
    float _1868 = 0.0;
    if (_1824)
    {
        _1868 = 1.0;
    }
    float _1870 = _1868;
    int _1872 = 0;
    float _1874 = _1870;
    if (_1824)
    {
        _1872 = 0;
    }
    int _1876 = _1872;
    float _1878 = float(uint(_1834));
    float _1880 = 1.0 / _1848;
    float _1882 = float(_1834);
    float _1884 = _1720;
    int _1886 = _1876;
    if (_1838)
    {
        float _1888 = in.m_61.x;
        _1884 = _1888;
    }
    float _1890 = _1884;
    int _1892 = ~_1834;
    int _1894 = _1892 + 1;
    int _1896 = _1894;
    if (_1824)
    {
        _1842 = 0;
    }
    int _1898 = _1842;
    float _1900 = 1.0 / _1820;
    float _1902 = _1882 * _164;
    float _1904 = float(_1852);
    float _1906 = _1880 * _164;
    float _1908 = 1.0 / _1878;
    bool _1910 = false;
    int _1912 = _1898;
    if (_1830)
    {
        bool _1914 = _1866 > 0.5;
        _1910 = _1914;
    }
    bool _1916 = _1910;
    float _1918 = _1902 * _1900;
    float _1920 = trunc(_1906);
    int _1922 = int(_1920);
    bool _1924 = false;
    float _1926 = _1890;
    if (_1838)
    {
        bool _1928 = _1890 > 0.5;
        _1924 = _1928;
    }
    bool _1930 = _1924;
    if (!_1838)
    {
        _1926 = _1826;
    }
    float _1932 = _1926;
    float _1934 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1936 = int(_1934);
    int _1938 = as_type<int>(_1908) + (-2);
    float _1940 = in.m_61.y;
    float _1942 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1944 = int(_1942);
    float _1946 = float(uint(_1922));
    float _1948 = as_type<float>(_1938) * _1946;
    float _1950 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1952 = int(_1950);
    float _1954 = float(_1936);
    float _1956 = _1946;
    float _1958 = _1932;
    if (_1824)
    {
        float _1960 = in.m_61.x;
        _1956 = _1960;
    }
    float _1962 = _1956;
    float _1964 = 1.0 / _1904;
    float _1966 = float(_1944);
    int _1968 = 0;
    if (_1824)
    {
        _1968 = as_type<int>(_1940);
    }
    int _1970 = _1968;
    float _1972 = trunc(_1948);
    float _1974 = precise::max(_1972, 0.0);
    uint _1977 = uint(_1974);
    float _1979 = float(uint(_1952));
    float _1981 = in.m_61.w;
    float _1983 = 1.0 / _1954;
    float _1985 = _1962;
    int _1987 = _1970;
    if (_1824)
    {
        _1782 = _1962;
    }
    float _1989 = _1782;
    float _1991 = _1989;
    if (_1824)
    {
        _1784 = _1989;
    }
    float _1993 = _1784;
    float _1995 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1997 = int(_1995);
    int _1999 = 0;
    float _2001 = _1993;
    if (_1824)
    {
        _1999 = as_type<int>(_1989);
    }
    int _2003 = _1999;
    float _2005 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2007 = int(_2005);
    float _2009 = _1983 * _164;
    float _2011 = _1983;
    int _2013 = _2003;
    if (_1824)
    {
        float _2015 = in.m_61.z;
        _2011 = _2015;
    }
    float _2017 = _2011;
    float _2019 = 1.0 / _1966;
    float _2021 = float(uint(_1997));
    int _2023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2025 = _2023 != 0;
    float _2027 = 1.0 / _1979;
    float _2029 = float(uint(_2007));
    float _2031 = _2019 * _164;
    float _2033 = _1964 * _164;
    float _2035 = 1.0 / _2021;
    int _2037 = as_type<int>(_2019);
    if (_1838)
    {
        float _2039 = -_1826;
        float _2041 = _2039 + 1.0;
        _2037 = as_type<int>(_2041);
    }
    int _2043 = _2037;
    int _2045 = _2043;
    if (_1830)
    {
        float _2047 = -_1826;
        float _2049 = _2047 + 1.0;
        _1896 = as_type<int>(_2049);
    }
    int _2051 = _1896;
    int _2053 = 0;
    float _2055 = _2017;
    float _2057 = as_type<float>(_2051);
    if (_1824)
    {
        _2053 = as_type<int>(_2017);
    }
    int _2059 = _2053;
    int _2061 = _1894 * int(_1977);
    int _2063 = _2061 + _1922;
    float _2065 = 1.0 / _2029;
    float _2067 = float(uint(_2063));
    float _2069 = as_type<float>(_1938) * _2067;
    float _2071 = _2067;
    int _2073 = _2059;
    if (!_1830)
    {
        _2071 = _1826;
    }
    float _2075 = _2071;
    float _2077 = trunc(_1918);
    int _2079 = int(_2077);
    float _2081 = trunc(_2009);
    int _2083 = int(_2081);
    float _2085 = trunc(_2033);
    int _2087 = int(_2085);
    float _2089 = trunc(_2031);
    int _2091 = int(_2089);
    float _2093 = trunc(_2069);
    float _2095 = precise::max(_2093, 0.0);
    uint _2097 = uint(_2095);
    float _2099 = _2075;
    if (!_1824)
    {
        float _2101 = in.m_61.x;
        float _2103 = _1940 * 3.1415927410125732421875;
        float _2105 = in.m_61.z;
        float _2107 = _2103 * 0.15915493667125701904296875;
        float _2109 = _2107 * 6.283185482025146484375;
        float _2111 = sin(_2109);
        float _2113 = _2101 * 3.1415927410125732421875;
        float _2115 = _2113 * 0.15915493667125701904296875;
        float _2117 = _2105 * 3.1415927410125732421875;
        float _2119 = _2117 * 0.15915493667125701904296875;
        float _2121 = _2115 * 6.283185482025146484375;
        float _2123 = sin(_2121);
        float _2125 = _2119 * 6.283185482025146484375;
        float _2127 = sin(_2125);
        _1985 = _2101;
        _1856 = 7.345489978790283203125;
        _1991 = _1940;
        _1862 = 1.2345600128173828125;
        _1886 = 1;
        _2001 = _2105;
        _1874 = 5.839270114898681640625;
        _2055 = _2105;
        _1912 = 2;
        _2073 = as_type<int>(_2127);
        _1987 = as_type<int>(_2111);
        _2013 = as_type<int>(_2123);
    }
    float _2129 = _1985;
    float _2131 = _1856;
    float _2133 = _1991;
    float _2135 = _1862;
    int _2137 = _1886;
    float _2139 = _2001;
    float _2141 = _1874;
    float _2143 = _2055;
    int _2145 = _1912;
    int _2147 = _2073;
    int _2149 = _1987;
    int _2151 = _2013;
    float _2153 = _2129 * _2131;
    int _2155 = ~_1834;
    int _2157 = _2155 + 1;
    float _2159 = _2133 * _2135;
    int _2161 = int(_1977) + int(_2097);
    float _2163 = floor(_2153);
    float _2165 = float(_1922);
    float _2167 = _1900 * _164;
    if (_1838)
    {
        float _2169 = _1930 ? as_type<float>(_2043) : _1826;
        _1958 = _2169;
    }
    float _2171 = _1958;
    if (_2025)
    {
        float _2173 = -_1826;
        float _2175 = _2173 + 1.0;
        _2045 = as_type<int>(_2175);
    }
    int _2177 = _2045;
    bool _2179 = _1940 > 0.5;
    int _2181 = _2157 * _2161;
    int _2183 = _2181 + _1922;
    int _2185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2187 = _2185 != 0;
    float _2189 = floor(_2159);
    bool _2191 = _2165 >= _1882;
    bool _2193 = isnan(_2165);
    bool _2195 = _2191 || _2193;
    bool _2197 = isnan(_1882);
    bool _2199 = _2195 || _2197;
    float _2201 = float(_2199);
    bool _2203 = _2137 != 1;
    float _2205 = as_type<float>(_2177);
    if (_1830)
    {
        float _2207 = _1916 ? as_type<float>(_2051) : _1826;
        _2099 = _2207;
    }
    float _2209 = _2099;
    float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _2213 = _1814 + _2211;
    if (!_2025)
    {
        _2057 = _1826;
    }
    float _2215 = _2057;
    float _2217 = _2215;
    if (_2025)
    {
        float _2219 = _2179 ? as_type<float>(_2177) : _1826;
        _2217 = _2219;
    }
    float _2221 = _2217;
    float _2223 = trunc(_2201);
    int _2225 = int(_2223);
    int _2227 = as_type<int>(_2035) + (-2);
    float _2229 = -_2163;
    float _2231 = _2153 + _2229;
    float _2233 = float(uint(_2083));
    if (_2187)
    {
        float _2235 = -_1826;
        float _2237 = _2235 + 1.0;
        _1786 = as_type<int>(_2237);
    }
    int _2239 = _1786;
    int _2241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2243 = _2241 != 0;
    float _2245 = _2231 * _1882;
    bool _2247 = uint(_2183) >= uint(_1834);
    float _2249 = as_type<float>(_2227) * _2233;
    int _2251 = as_type<int>(_2027) + (-2);
    float _2253 = -_2189;
    float _2255 = _2159 + _2253;
    bool _2257 = !_2247;
    int _2259 = _2257 ? 0 : (-1);
    float _2261 = trunc(_2245);
    int _2263 = int(_2261);
    if (!_2187)
    {
        _2205 = _1826;
    }
    float _2265 = _2205;
    int _2267 = ~_2161;
    int _2269 = _2267 + _2259;
    int _2271 = _2269 + 1;
    float _2273 = float(uint(_2087));
    int _2275 = 0;
    float _2277 = _2265;
    if (_2243)
    {
        float _2279 = -_1826;
        float _2281 = _2279 + 1.0;
        _2275 = as_type<int>(_2281);
    }
    int _2283 = _2275;
    if (_2187)
    {
        float _2285 = _2179 ? as_type<float>(_2239) : _1826;
        _2277 = _2285;
    }
    float _2287 = _2277;
    float _2289 = trunc(_2249);
    float _2291 = precise::max(_2289, 0.0);
    uint _2293 = uint(_2291);
    int _2295 = _1834 * _2271;
    int _2297 = _2295 + _1922;
    bool _2299 = _1834 == 0;
    float _2301 = as_type<float>(_2251) * _2273;
    int _2303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2305 = _2303 != 0;
    float _2307 = _2139 * _2141;
    if (_2243)
    {
        float _2309 = _2179 ? as_type<float>(_2283) : _1826;
        _1844 = _2309;
    }
    float _2311 = _1844;
    float _2313 = trunc(_2301);
    float _2315 = precise::max(_2313, 0.0);
    uint _2317 = uint(_2315);
    bool _2319 = !_2305;
    int _2321 = _2319 ? 0 : 1;
    int _2323 = ~_2225;
    int _2325 = _2323 + 1;
    int _2327 = _2325 + 1;
    bool _2329 = !_2299;
    int _2331 = _2329 ? _2297 : (-1);
    int _2333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _2335 = _2333 != 0;
    int _2337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _2339 = _2337 != 0;
    int _2341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2343 = _2341 != 0;
    float _2345 = floor(_2307);
    int _2347 = ~_1997;
    int _2349 = _2347 + 1;
    int _2351 = _2331 * _2327;
    int _2353 = abs(_2321);
    float _2355 = _2133 * _2131;
    bool _2357 = !_2339;
    int _2359 = _2357 ? 0 : 1;
    int _2361 = _2349 * int(_2293);
    int _2363 = _2361 + _2083;
    int _2365 = _1834 + (-1);
    int _2367 = _2263 * _2353;
    int _2369 = _2367 + _1922;
    int _2371 = abs(_2359);
    float _2373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _2375 = as_type<int>(_2065) + (-2);
    int _2377 = _2225 * _2365;
    int _2379 = _2377 + _2351;
    float _2381 = float(uint(_2091));
    float _2383 = float(uint(_2363));
    float _2385 = as_type<float>(_2375) * _2381;
    bool _2387 = !_2335;
    int _2389 = _2387 ? 0 : 1;
    float _2391 = as_type<float>(_2227) * _2383;
    int _2393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2395 = _2393 != 0;
    int _2397 = _2379 * _2371;
    int _2399 = abs(_2389);
    float _2401 = trunc(_2391);
    float _2403 = precise::max(_2401, 0.0);
    uint _2405 = uint(_2403);
    bool _2407 = !_2343;
    int _2409 = _2407 ? 0 : 1;
    int _2411 = ~_1952;
    int _2413 = _2411 + 1;
    int _2415 = _2079 * _2399;
    int _2417 = _2415 + _2397;
    int _2419 = abs(_2409);
    float _2421 = -_2345;
    float _2423 = _2307 + _2421;
    bool _2425 = !_2395;
    int _2427 = _2425 ? 0 : 1;
    float _2429 = trunc(_2385);
    float _2431 = precise::max(_2429, 0.0);
    uint _2433 = uint(_2431);
    int _2435 = ~_2007;
    int _2437 = _2435 + 1;
    int _2439 = abs(_2427);
    int _2441 = _2413 * int(_2317);
    int _2443 = _2441 + _2087;
    float _2445 = floor(_2355);
    int _2447 = _2369 * _2419;
    int _2449 = _2447 + _2417;
    int _2451 = int(_2293) + int(_2405);
    float _2453 = float(uint(_2443));
    int _2455 = _2437 * int(_2433);
    int _2457 = _2455 + _2091;
    float _2459 = float(_2083);
    int _2461 = _2263 * _2439;
    int _2463 = _2461 + _2449;
    float _2465 = float(_1997);
    float _2467 = float(uint(_2457));
    float _2469 = float(_2007);
    float _2471 = -_2445;
    float _2473 = _2355 + _2471;
    float _2475 = as_type<float>(_2251) * _2453;
    float _2477 = as_type<float>(_2375) * _2467;
    float _2479 = float(_1952);
    float _2481 = _2465 * _2255;
    float _2483 = trunc(_2475);
    float _2485 = precise::max(_2483, 0.0);
    uint _2487 = uint(_2485);
    float _2489 = float(_2087);
    float _2491 = _2465 * _2167;
    float _2493 = float(_2091);
    float _2495 = _2479 * _2423;
    bool _2497 = _2459 >= _2465;
    bool _2499 = isnan(_2459);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan(_2465);
    bool _2505 = _2501 || _2503;
    float _2507 = float(_2505);
    float _2509 = _2479 * _2167;
    int _2511 = ~_1997;
    int _2513 = _2511 + 1;
    float _2515 = trunc(_2477);
    float _2517 = precise::max(_2515, 0.0);
    uint _2519 = uint(_2517);
    float _2521 = float(uint(_2463));
    float _2523 = _2469 * _2167;
    bool _2525 = _2489 >= _2479;
    bool _2527 = isnan(_2489);
    bool _2529 = _2525 || _2527;
    bool _2531 = isnan(_2479);
    bool _2533 = _2529 || _2531;
    float _2535 = float(_2533);
    int _2537 = _2513 * _2451;
    int _2539 = _2537 + _2083;
    bool _2541 = _2493 >= _2469;
    bool _2543 = isnan(_2493);
    bool _2545 = _2541 || _2543;
    bool _2547 = isnan(_2469);
    bool _2549 = _2545 || _2547;
    float _2551 = float(_2549);
    float _2553 = _2469 * _2473;
    int _2555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2557 = _2555 != 0;
    float _2559 = trunc(_2481);
    int _2561 = int(_2559);
    float _2563 = as_type<float>(_1938) * _2521;
    int _2565 = ~_1952;
    int _2567 = _2565 + 1;
    bool _2569 = !_2557;
    int _2571 = _2569 ? 0 : 1;
    bool _2573 = uint(_2539) >= uint(_1997);
    float _2575 = trunc(_2563);
    float _2577 = precise::max(_2575, 0.0);
    uint _2579 = uint(_2577);
    int _2581 = int(_2317) + int(_2487);
    int _2583 = abs(_2571);
    bool _2585 = !_2573;
    int _2587 = _2585 ? 0 : (-1);
    float _2589 = trunc(_2507);
    int _2591 = int(_2589);
    int _2593 = ~_1834;
    int _2595 = _2593 + 1;
    int _2597 = _2567 * _2581;
    int _2599 = _2597 + _2087;
    int _2601 = ~_2451;
    int _2603 = _2601 + _2587;
    int _2605 = _2603 + 1;
    int _2607 = _2561 * _2583;
    int _2609 = _2607 + _2083;
    int _2611 = int(_2433) + int(_2519);
    bool _2613 = uint(_2599) >= uint(_1952);
    int _2615 = _2595 * int(_2579);
    int _2617 = _2615 + _2463;
    bool _2619 = _1997 == 0;
    int _2621 = _1997 * _2605;
    int _2623 = _2621 + _2083;
    int _2625 = ~_2007;
    int _2627 = _2625 + 1;
    float _2629 = trunc(_2491);
    int _2631 = int(_2629);
    float _2633 = float(uint(_2617));
    int _2635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2637 = _2635 != 0;
    int _2639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2641 = _2639 != 0;
    int _2643 = _2627 * _2611;
    int _2645 = _2643 + _2091;
    int _2647 = ~_2591;
    int _2649 = _2647 + 1;
    int _2651 = _2649 + 1;
    float _2653 = as_type<float>(_1938) * _2633;
    bool _2655 = !_2619;
    int _2657 = _2655 ? _2623 : (-1);
    float _2659 = trunc(_2495);
    int _2661 = int(_2659);
    bool _2663 = !_2641;
    int _2665 = _2663 ? 0 : 1;
    int _2667 = _1997 + (-1);
    int _2669 = _2651 * _2657;
    bool _2671 = !_2637;
    int _2673 = _2671 ? 0 : 1;
    int _2675 = abs(_2665);
    float _2677 = trunc(_2653);
    float _2679 = precise::max(_2677, 0.0);
    uint _2681 = uint(_2679);
    bool _2683 = uint(_2645) >= uint(_2007);
    int _2685 = _2591 * _2667;
    int _2687 = _2685 + _2669;
    int _2689 = abs(_2673);
    bool _2691 = !_2613;
    int _2693 = _2691 ? 0 : (-1);
    float _2695 = trunc(_2535);
    int _2697 = int(_2695);
    int _2699 = _2687 * _2675;
    bool _2701 = !_2683;
    int _2703 = _2701 ? 0 : (-1);
    int _2705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2707 = _2705 != 0;
    int _2709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2711 = _2709 != 0;
    int _2713 = _2631 * _2689;
    int _2715 = _2713 + _2699;
    int _2717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2719 = _2717 != 0;
    float _2721 = trunc(_2551);
    int _2723 = int(_2721);
    int _2725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2727 = _2725 != 0;
    int _2729 = ~_2581;
    int _2731 = _2729 + _2693;
    int _2733 = _2731 + 1;
    bool _2735 = !_2719;
    int _2737 = _2735 ? 0 : 1;
    bool _2739 = !_2727;
    int _2741 = _2739 ? 0 : 1;
    int _2743 = _1952 * _2733;
    int _2745 = _2743 + _2087;
    int _2747 = int(_2579) + int(_2681);
    float _2749 = trunc(_2509);
    int _2751 = int(_2749);
    bool _2753 = !_2707;
    int _2755 = _2753 ? 0 : 1;
    int _2757 = ~_1834;
    int _2759 = _2757 + 1;
    int _2761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2763 = _2761 != 0;
    int _2765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2767 = _2765 != 0;
    float _2769 = trunc(_2523);
    int _2771 = int(_2769);
    int _2773 = abs(_2737);
    int _2775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2777 = _2775 != 0;
    int _2779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2781 = _2779 != 0;
    int _2783 = abs(_2755);
    int _2785 = _2759 * _2747;
    int _2787 = _2785 + _2463;
    int _2789 = ~_2611;
    int _2791 = _2789 + _2703;
    int _2793 = _2791 + 1;
    bool _2795 = !_2763;
    int _2797 = _2795 ? 0 : 1;
    bool _2799 = !_2767;
    int _2801 = _2799 ? 0 : 1;
    int _2803 = _2007 * _2793;
    int _2805 = _2803 + _2091;
    int _2807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2809 = _2807 != 0;
    int _2811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2813 = _2811 != 0;
    bool _2815 = uint(_2787) >= uint(_1834);
    int _2817 = _2661 * _2773;
    int _2819 = _2817 + _2087;
    bool _2821 = !_2711;
    int _2823 = _2821 ? 0 : 1;
    int _2825 = _2609 * _2783;
    int _2827 = _2825 + _2715;
    bool _2829 = !_2815;
    int _2831 = _2829 ? 0 : (-1);
    int _2833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2835 = _2833 != 0;
    int _2837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2839 = _2837 != 0;
    bool _2841 = !_2809;
    int _2843 = _2841 ? 0 : 1;
    int _2845 = abs(_2823);
    bool _2847 = _1952 == 0;
    int _2849 = ~_2697;
    int _2851 = _2849 + 1;
    int _2853 = _2851 + 1;
    int _2855 = _2561 * _2845;
    int _2857 = _2855 + _2827;
    bool _2859 = !_2847;
    int _2861 = _2859 ? _2745 : (-1);
    bool _2863 = !_2781;
    int _2865 = _2863 ? 0 : 1;
    int _2867 = _1952 + (-1);
    int _2869 = _2853 * _2861;
    float _2871 = float(uint(_2857));
    bool _2873 = !_2813;
    int _2875 = _2873 ? 0 : 1;
    int _2877 = _2697 * _2867;
    int _2879 = _2877 + _2869;
    bool _2881 = _2007 == 0;
    float _2883 = as_type<float>(_2227) * _2871;
    bool _2885 = !_2777;
    int _2887 = _2885 ? 0 : 1;
    int _2889 = abs(_2865);
    int _2891 = ~_2723;
    int _2893 = _2891 + 1;
    int _2895 = _2893 + 1;
    float _2897 = trunc(_2883);
    float _2899 = precise::max(_2897, 0.0);
    uint _2901 = uint(_2899);
    bool _2903 = !_2881;
    int _2905 = _2903 ? _2805 : (-1);
    int _2907 = _2879 * _2889;
    int _2909 = abs(_2887);
    int _2911 = abs(_2741);
    int _2913 = _2895 * _2905;
    int _2915 = _2007 + (-1);
    float _2917 = trunc(_2553);
    int _2919 = int(_2917);
    int _2921 = _2751 * _2909;
    int _2923 = _2921 + _2907;
    int _2925 = abs(_2801);
    float _2927 = in.m_75.y;
    int _2929 = _2723 * _2915;
    int _2931 = _2929 + _2913;
    int _2933 = abs(_2875);
    int _2935 = _2819 * _2911;
    int _2937 = _2935 + _2923;
    int _2939 = ~_1997;
    int _2941 = _2939 + 1;
    int _2943 = abs(_2797);
    int _2945 = abs(_2843);
    int _2947 = ~_2747;
    int _2949 = _2947 + _2831;
    int _2951 = _2949 + 1;
    int _2953 = _2661 * _2943;
    int _2955 = _2953 + _2937;
    int _2957 = _1834 * _2951;
    int _2959 = _2957 + _2463;
    int _2961 = _2919 * _2925;
    int _2963 = _2961 + _2091;
    float _2965 = float(uint(_2955));
    int _2967 = _2931 * _2933;
    bool _2969 = !_2835;
    int _2971 = _2969 ? 0 : 1;
    int _2973 = _2941 * int(_2901);
    int _2975 = _2973 + _2857;
    float _2977 = as_type<float>(_2251) * _2965;
    int _2979 = abs(_2971);
    float _2981 = -_2927;
    float _2983 = _2981 + 1.0;
    float _2985 = float(uint(_2975));
    float _2987 = trunc(_2977);
    float _2989 = precise::max(_2987, 0.0);
    uint _2991 = uint(_2989);
    bool _2993 = _1834 == 0;
    int _2995 = _2771 * _2945;
    int _2997 = _2995 + _2967;
    float _2999 = as_type<float>(_2227) * _2985;
    bool _3001 = !_2839;
    int _3003 = _3001 ? 0 : 1;
    bool _3005 = _1981 > 0.5;
    int _3007 = _2963 * _2979;
    int _3009 = _3007 + _2997;
    bool _3011 = !_2993;
    int _3013 = _3011 ? _2959 : (-1);
    float _3015 = trunc(_2999);
    float _3017 = precise::max(_3015, 0.0);
    uint _3019 = uint(_3017);
    int _3021 = abs(_3003);
    int _3023 = _3005 ? as_type<int>(_2983) : as_type<int>(_2927);
    int _3025 = _3013 & 3;
    bool _3027 = _3025 != 0;
    int _3029 = _2919 * _3021;
    int _3031 = _3029 + _3009;
    int _3033 = ~_1952;
    int _3035 = _3033 + 1;
    int _3037 = _3013 & 3;
    bool _3039 = _3037 != 0;
    int _3041 = _3027 ? 0 : 1;
    int _3043 = _3035 * int(_2991);
    int _3045 = _3043 + _2955;
    bool _3047 = uint(_3037) > 1u;
    int _3049 = ~_1997;
    int _3051 = _3049 + 1;
    int _3053 = int(_2901) + int(_3019);
    float _3055 = float(uint(_3031));
    float _3057 = float(uint(_3045));
    int _3059 = ~_3041;
    int _3061 = _3059 + 1;
    int _3063 = _3061 + 1;
    float _3065 = as_type<float>(_2375) * _3055;
    int _3067 = _3051 * _3053;
    int _3069 = _3067 + _2857;
    float _3071 = as_type<float>(_2251) * _3057;
    int _3073 = _3063;
    if (!_3047)
    {
        int _3075 = ~_3041;
        int _3077 = _3075 + 1;
        _3073 = _3077;
    }
    int _3079 = _3073;
    float _3081 = trunc(_3065);
    float _3083 = precise::max(_3081, 0.0);
    uint _3085 = uint(_3083);
    bool _3087 = uint(_3037) >= 2u;
    int _3089 = ~_2007;
    int _3091 = _3089 + 1;
    int _3093 = _3087 ? 0 : 1;
    bool _3095 = uint(_3069) >= uint(_1997);
    float _3097 = trunc(_3071);
    float _3099 = precise::max(_3097, 0.0);
    uint _3101 = uint(_3099);
    int _3103 = ~_1952;
    int _3105 = _3103 + 1;
    bool _3107 = !_3095;
    int _3109 = _3107 ? 0 : (-1);
    bool _3111 = _3037 != 3;
    int _3113 = ~_3053;
    int _3115 = _3113 + _3109;
    int _3117 = _3115 + 1;
    int _3119 = _3091 * int(_3085);
    int _3121 = _3119 + _3031;
    bool _3123 = _1940 > 0.5;
    int _3125 = _1997 * _3117;
    int _3127 = _3125 + _2857;
    float _3129 = float(uint(_3121));
    int _3131 = _3123 ? as_type<int>(_2983) : as_type<int>(_2927);
    int _3133 = int(_2991) + int(_3101);
    float _3135 = as_type<float>(_2375) * _3129;
    int _3137 = ~_3093;
    int _3139 = _3137 + 1;
    int _3141 = _3139 + 1;
    int _3143 = _3141;
    if (_3111)
    {
        int _3145 = ~_3093;
        int _3147 = _3145 + 1;
        _3143 = _3147;
    }
    int _3149 = _3143;
    int _3151 = _3105 * _3133;
    int _3153 = _3151 + _2955;
    int _3155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3157 = _3155 != 0;
    float _3159 = trunc(_3135);
    float _3161 = precise::max(_3159, 0.0);
    uint _3163 = uint(_3161);
    bool _3165 = !_2619;
    int _3167 = _3165 ? _3127 : (-1);
    bool _3169 = !_3157;
    int _3171 = _3169 ? 0 : 1;
    bool _3173 = uint(_3153) >= uint(_1952);
    int _3175 = _3167 & 3;
    bool _3177 = _3175 != 0;
    bool _3179 = !_3173;
    int _3181 = _3179 ? 0 : (-1);
    int _3183 = _3177 ? 0 : 1;
    bool _3185 = uint(_3175) >= 2u;
    bool _3187 = _3175 != 3;
    int _3189 = ~_3133;
    int _3191 = _3189 + _3181;
    int _3193 = _3191 + 1;
    int _3195 = _3185 ? 0 : 1;
    bool _3197 = uint(_3175) > 1u;
    int _3199 = _1952 * _3193;
    int _3201 = _3199 + _2955;
    int _3203 = ~_2007;
    int _3205 = _3203 + 1;
    int _3207 = int(_3085) + int(_3163);
    bool _3209 = !_2847;
    int _3211 = _3209 ? _3201 : (-1);
    int _3213 = ~_3195;
    int _3215 = _3213 + 1;
    int _3217 = _3215 + 1;
    int _3219 = _3217;
    if (_3187)
    {
        int _3221 = ~_3195;
        int _3223 = _3221 + 1;
        _3219 = _3223;
    }
    int _3225 = _3219;
    int _3227 = _3205 * _3207;
    int _3229 = _3227 + _3031;
    int _3231 = _3211 & 3;
    bool _3233 = _3231 != 0;
    int _3235 = ~_3183;
    int _3237 = _3235 + 1;
    int _3239 = _3237 + 1;
    int _3241 = _3239;
    if (!_3197)
    {
        int _3243 = ~_3183;
        int _3245 = _3243 + 1;
        _3241 = _3245;
    }
    int _3247 = _3241;
    bool _3249 = uint(_3231) >= 2u;
    int _3251 = _3233 ? 0 : 1;
    bool _3253 = uint(_3229) >= uint(_2007);
    int _3255 = _3249 ? 0 : 1;
    bool _3257 = _3231 != 3;
    bool _3259 = !_3253;
    int _3261 = _3259 ? 0 : (-1);
    bool _3263 = uint(_3231) > 1u;
    int _3265 = ~_3207;
    int _3267 = _3265 + _3261;
    int _3269 = _3267 + 1;
    int _3271 = ~_3255;
    int _3273 = _3271 + 1;
    int _3275 = _3273 + 1;
    float _3277 = in.m_46.x;
    float _3279 = in.m_46.y;
    float _3281 = in.m_46.z;
    int _3283 = ~_3251;
    int _3285 = _3283 + 1;
    int _3287 = _3285 + 1;
    int _3289 = _2007 * _3269;
    int _3291 = _3289 + _3031;
    int _3293 = _3275;
    int _3295 = _3287;
    if (_3257)
    {
        int _3297 = ~_3255;
        int _3299 = _3297 + 1;
        _3293 = _3299;
    }
    int _3301 = _3293;
    int _3303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3305 = _3303 != 0;
    float _3307 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _3309 = _3307 + (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _3311 = !_2881;
    int _3313 = _3311 ? _3291 : (-1);
    if (!_3263)
    {
        int _3315 = ~_3251;
        int _3317 = _3315 + 1;
        _3295 = _3317;
    }
    int _3319 = _3295;
    bool _3321 = !_3305;
    int _3323 = _3321 ? 0 : 1;
    float _3325 = 1.0 / _3309;
    int _3327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3329 = _3327 != 0;
    int _3331 = _3313 & 3;
    bool _3333 = _3331 != 0;
    bool _3335 = !_3329;
    int _3337 = _3335 ? 0 : 1;
    int _3339 = _3333 ? 0 : 1;
    bool _3341 = uint(_3331) >= 2u;
    float _3343 = _204 * _3279;
    bool _3345 = _3331 != 3;
    int _3347 = _3341 ? 0 : 1;
    float _3349 = fma(_202, _3277, _3343);
    bool _3351 = uint(_3331) > 1u;
    int _3353 = ~_3347;
    int _3355 = _3353 + 1;
    int _3357 = _3355 + 1;
    int _3359 = ~_3339;
    int _3361 = _3359 + 1;
    int _3363 = _3361 + 1;
    int _3365 = _3357;
    int _3367 = _3363;
    float _3369 = _3349;
    if (_3345)
    {
        int _3371 = ~_3347;
        int _3373 = _3371 + 1;
        _3365 = _3373;
    }
    int _3375 = _3365;
    float _3377 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _3379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3381 = _3379 != 0;
    float _3383 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _3385 = _3383 + (*spvDescriptorSet0.vp_c9)._m0[185].w;
    if (!_3351)
    {
        int _3387 = ~_3339;
        int _3389 = _3387 + 1;
        _3367 = _3389;
    }
    int _3391 = _3367;
    float _3393 = _3381 ? as_type<float>(_3131) : _2927;
    int _3395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3397 = _3395 != 0;
    float _3399 = 1.0 / _3385;
    bool _3401 = _2143 > 0.5;
    float _3403 = _3397 ? as_type<float>(_3023) : _2927;
    int _3405 = _3401 ? as_type<int>(_2983) : as_type<int>(_2927);
    float _3407 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _3409 = _3407 + (*spvDescriptorSet0.vp_c9)._m0[186].w;
    int _3411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _3413 = _3411 != 0;
    int _3415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _3417 = _3415 != 0;
    float _3419 = _3413 ? as_type<float>(_3405) : _2927;
    float _3421 = 1.0 / _3409;
    float _3423 = _3417 ? as_type<float>(_3405) : _2927;
    int _3425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3427 = _3425 != 0;
    int _3429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _3431 = _3429 != 0;
    float _3433 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _3435 = _3433 + (*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3437 = _198 * _3279;
    float _3439 = _210 * _3279;
    float _3441 = 1.0 / _3435;
    float _3443 = fma(_196, _3277, _3437);
    float _3445 = fma(_208, _3277, _3439);
    float _3447 = _2129 * 2.0;
    float _3449 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3451 = _3449 + (*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3453 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _3455 = fma(_200, _3281, _3443);
    float _3457 = floor(_3447);
    float _3459 = -(*spvDescriptorSet0.vp_c9)._m0[183].x;
    float _3461 = (*spvDescriptorSet0.vp_c9)._m0[184].x + _3459;
    float _3463 = fma(_3453, -2.0, _3377);
    float _3465 = fma(_206, _3281, _3349);
    float _3467 = fma(_212, _3281, _3445);
    float _3469 = _3461 * _3325;
    float _3471 = -(*spvDescriptorSet0.vp_c9)._m0[184].x;
    float _3473 = _3471 + (*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _3475 = 1.0 / _3451;
    float _3477 = -(*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _3479 = (*spvDescriptorSet0.vp_c9)._m0[186].x + _3477;
    float _3481 = _3473 * _3399;
    float _3483 = _3431 ? as_type<float>(_3405) : _2927;
    float _3485 = _3479 * _3421;
    bool _3487 = !_3427;
    int _3489 = _3487 ? 0 : 1;
    float _3491 = -(*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _3493 = (*spvDescriptorSet0.vp_c9)._m0[188].x + _3491;
    bool _3495 = _3457 > 0.0;
    float _3497 = -(*spvDescriptorSet0.vp_c9)._m0[186].x;
    float _3499 = _3497 + (*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _3501 = in.m_55.w;
    bool _3503 = _3457 >= 0.0;
    bool _3505 = isnan(_3457);
    bool _3507 = _3503 || _3505;
    bool _3509 = isnan(0.0);
    bool _3511 = _3507 || _3509;
    float _3513 = _3499 * _3441;
    float _3515 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3517 = _3515 + (*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3519 = _3493 * _3475;
    int _3521 = _3511 ? 0 : 1;
    float _3523 = in.m_57.w;
    float _3525 = 1.0 / _3517;
    float _3527 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3529 = _3527 + (*spvDescriptorSet0.vp_c9)._m0[190].w;
    float _3531 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _3533 = _1814 + _3531;
    float _3535 = -(*spvDescriptorSet0.vp_c9)._m0[188].x;
    float _3537 = _3535 + (*spvDescriptorSet0.vp_c9)._m0[189].x;
    int _3539 = ~_1834;
    int _3541 = _3539 + 1;
    float _3543 = -(*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _3545 = (*spvDescriptorSet0.vp_c9)._m0[190].x + _3543;
    float _3547 = 1.0 / _3529;
    int _3549 = ~_3521;
    int _3551 = _3549 + 1;
    int _3553 = _3551 + 1;
    float _3555 = fma(_3485, _3533, (*spvDescriptorSet0.vp_c9)._m0[185].x);
    int _3557 = _3553;
    float _3559 = (*spvDescriptorSet0.vp_c9)._m0[186].x;
    if (!_3495)
    {
        int _3561 = ~_3521;
        int _3563 = _3561 + 1;
        _3557 = _3563;
    }
    int _3565 = _3557;
    bool _3567 = _2145 != 2;
    float _3569 = float(uint(_2369));
    float _3571 = float(uint(_2819));
    float _3573 = _3537 * _3525;
    float _3575 = _1940 * 2.0;
    float _3577 = as_type<float>(_1938) * _3569;
    float _3579 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _3581 = _1814 + _3579;
    float _3583 = 0.0;
    if (!_2203)
    {
        _3583 = _1940;
    }
    float _3585 = _3583;
    float _3587 = _3585;
    if (!_2203)
    {
        _3369 = _1940;
    }
    float _3589 = _3369;
    float _3591 = floor(_3575);
    float _3593 = _3545 * _3547;
    bool _3595 = !_2203;
    float _3597 = _3595 ? as_type<float>(_2147) : as_type<float>(_2149);
    float _3599 = fma(_3481, _3581, (*spvDescriptorSet0.vp_c9)._m0[184].x);
    float _3601 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _3603 = _1814 + _3601;
    float _3605 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3607 = _1814 + _3605;
    float _3609 = 0.0;
    float _3611 = _3589;
    if (!_2203)
    {
        _3609 = _2143;
    }
    float _3613 = _3609;
    float _3615 = fma(_3593, _2213, (*spvDescriptorSet0.vp_c9)._m0[189].x);
    float _3617 = trunc(_3577);
    float _3619 = precise::max(_3617, 0.0);
    uint _3621 = uint(_3619);
    float _3623 = fma(_3469, _3603, (*spvDescriptorSet0.vp_c9)._m0[183].x);
    float _3625 = fma(_3519, _3607, (*spvDescriptorSet0.vp_c9)._m0[187].x);
    float _3627 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _3629 = _1814 + _3627;
    float _3631 = _3613;
    if (!_2203)
    {
        _3559 = _2143;
    }
    float _3633 = _3559;
    float _3635 = _3465 + _3523;
    bool _3637 = !_2203;
    float _3639 = _3637 ? as_type<float>(_2149) : as_type<float>(_2151);
    float _3641 = fma(_3513, _3629, (*spvDescriptorSet0.vp_c9)._m0[186].x);
    float _3643 = _3633;
    if (_2203)
    {
        _3587 = _2129;
    }
    float _3645 = _3587;
    if (_2203)
    {
        _3611 = _2129;
    }
    float _3647 = _3611;
    if (_2203)
    {
        _3631 = _1940;
    }
    float _3649 = _3631;
    float _3651 = _3645 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2203)
    {
        _3643 = _1940;
    }
    float _3653 = _3643;
    int _3655 = _3541 * int(_3621);
    int _3657 = _3655 + _2369;
    bool _3659 = _3591 > 0.0;
    float _3661 = _3649 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _3663 = _3591 >= 0.0;
    bool _3665 = isnan(_3591);
    bool _3667 = _3663 || _3665;
    bool _3669 = isnan(0.0);
    bool _3671 = _3667 || _3669;
    float _3673 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3675 = _1814 + _3673;
    float _3677 = float(uint(_3657));
    float _3679 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3681 = int(_3679);
    bool _3683 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _3685 = isnan(_1814);
    bool _3687 = _3683 || _3685;
    bool _3689 = isnan((*spvDescriptorSet0.vp_c9)._m0[190].w);
    bool _3691 = _3687 || _3689;
    float _3693 = float(_3691);
    float _3695 = fma(_3573, _3675, (*spvDescriptorSet0.vp_c9)._m0[188].x);
    float _3697 = float(uint(_2609));
    float _3699 = as_type<float>(_1938) * _3677;
    bool _3701 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[189].w;
    bool _3703 = isnan(_1814);
    bool _3705 = _3701 || _3703;
    bool _3707 = isnan((*spvDescriptorSet0.vp_c9)._m0[189].w);
    bool _3709 = _3705 || _3707;
    float _3711 = float(_3709);
    float _3713 = _3455 + _3501;
    float _3715 = -_3693;
    float _3717 = _3715 + 1.0;
    bool _3719 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[188].w;
    bool _3721 = isnan(_1814);
    bool _3723 = _3719 || _3721;
    bool _3725 = isnan((*spvDescriptorSet0.vp_c9)._m0[188].w);
    bool _3727 = _3723 || _3725;
    float _3729 = float(_3727);
    float _3731 = as_type<float>(_2227) * _3697;
    float _3733 = as_type<float>(_2251) * _3571;
    float _3735 = -_3711;
    float _3737 = _3735 + 1.0;
    float _3739 = _3711 * _3717;
    bool _3741 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[187].w;
    bool _3743 = isnan(_1814);
    bool _3745 = _3741 || _3743;
    bool _3747 = isnan((*spvDescriptorSet0.vp_c9)._m0[187].w);
    bool _3749 = _3745 || _3747;
    float _3751 = float(_3749);
    float _3753 = _3729 * _3737;
    float _3755 = -_3729;
    float _3757 = _3755 + 1.0;
    float _3759 = float(uint(_2963));
    float _3761 = trunc(_3733);
    float _3763 = precise::max(_3761, 0.0);
    uint _3765 = uint(_3763);
    bool _3767 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _3769 = isnan(_1814);
    bool _3771 = _3767 || _3769;
    bool _3773 = isnan((*spvDescriptorSet0.vp_c9)._m0[186].w);
    bool _3775 = _3771 || _3773;
    float _3777 = float(_3775);
    float _3779 = _3751 * _3757;
    float _3781 = -_3751;
    float _3783 = _3781 + 1.0;
    bool _3785 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _3787 = isnan(_1814);
    bool _3789 = _3785 || _3787;
    bool _3791 = isnan((*spvDescriptorSet0.vp_c9)._m0[185].w);
    bool _3793 = _3789 || _3791;
    float _3795 = float(_3793);
    float _3797 = in.m_59.w;
    float _3799 = as_type<float>(_2375) * _3759;
    float _3801 = -_3777;
    float _3803 = _3801 + 1.0;
    float _3805 = trunc(_3731);
    float _3807 = precise::max(_3805, 0.0);
    uint _3809 = uint(_3807);
    bool _3811 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _3813 = isnan(_1814);
    bool _3815 = _3811 || _3813;
    bool _3817 = isnan((*spvDescriptorSet0.vp_c9)._m0[184].w);
    bool _3819 = _3815 || _3817;
    float _3821 = float(_3819);
    float _3823 = _3777 * _3783;
    float _3825 = _3795 * _3803;
    int _3827 = ~_1952;
    int _3829 = _3827 + 1;
    float _3831 = -_3795;
    float _3833 = _3831 + 1.0;
    int _3835 = ~_1997;
    int _3837 = _3835 + 1;
    bool _3839 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[183].w;
    bool _3841 = isnan(_1814);
    bool _3843 = _3839 || _3841;
    bool _3845 = isnan((*spvDescriptorSet0.vp_c9)._m0[183].w);
    bool _3847 = _3843 || _3845;
    float _3849 = float(_3847);
    float _3851 = _3821 * _3833;
    float _3853 = -_3821;
    float _3855 = _3853 + 1.0;
    int _3857 = _3829 * int(_3765);
    int _3859 = _3857 + _2819;
    float _3861 = trunc(_3799);
    float _3863 = precise::max(_3861, 0.0);
    uint _3865 = uint(_3863);
    float _3867 = _3849 * _3855;
    int _3869 = abs(_3149);
    int _3871 = _3837 * int(_3809);
    int _3873 = _3871 + _2609;
    float _3875 = float(uint(_3859));
    float _3877 = _3623 * _3867;
    int _3879 = _3671 ? 0 : 1;
    float _3881 = trunc(_3699);
    float _3883 = precise::max(_3881, 0.0);
    uint _3885 = uint(_3883);
    float _3887 = float(uint(_3873));
    float _3889 = as_type<float>(_2251) * _3875;
    float _3891 = -_3849;
    float _3893 = _3891 + 1.0;
    float _3895 = _3467 + _3797;
    int _3897 = ~_3879;
    int _3899 = _3897 + 1;
    int _3901 = _3899 + 1;
    float _3903 = as_type<float>(_2227) * _3887;
    int _3905 = ~_2007;
    int _3907 = _3905 + 1;
    float _3909 = trunc(_3889);
    float _3911 = precise::max(_3909, 0.0);
    uint _3913 = uint(_3911);
    float _3915 = fma(_3893, (*spvDescriptorSet0.vp_c9)._m0[183].x, _3877);
    int _3917 = _3901;
    float _3919 = _3849;
    if (!_3659)
    {
        int _3921 = ~_3879;
        int _3923 = _3921 + 1;
        _3917 = _3923;
    }
    int _3925 = _3917;
    float _3927 = _2373 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    int _3929 = _3907 * int(_3865);
    int _3931 = _3929 + _2963;
    float _3933 = fma(_3599, _3851, _3915);
    float _3935 = _2143 * 2.0;
    float _3937 = fma(_3927, _2311, -0.5);
    float _3939 = trunc(_3903);
    float _3941 = precise::max(_3939, 0.0);
    uint _3943 = uint(_3941);
    float _3945 = float(uint(_3931));
    float _3947 = fma(_3555, _3825, _3933);
    int _3949 = ~_1834;
    int _3951 = _3949 + 1;
    float _3953 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3955 = as_type<float>(_2375) * _3945;
    int _3957 = int(_3621) + int(_3885);
    float _3959 = fma(_3641, _3823, _3947);
    float _3961 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _3963 = int(_3765) + int(_3913);
    float _3965 = trunc(_3955);
    float _3967 = precise::max(_3965, 0.0);
    uint _3969 = uint(_3967);
    int _3971 = _3951 * _3957;
    int _3973 = _3971 + _2369;
    int _3975 = int(_3809) + int(_3943);
    float _3977 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3979 = _3895 + _3977;
    int _3981 = ~_1997;
    int _3983 = _3981 + 1;
    bool _3985 = uint(_3973) >= uint(_1834);
    float _3987 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3989 = _2129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _3991 = _3983 * _3975;
    int _3993 = _3991 + _2609;
    int _3995 = ~_1952;
    int _3997 = _3995 + 1;
    float _3999 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4001 = _3635 + _3999;
    float _4003 = -_3987;
    float _4005 = fma(_3989, 2.0, _4003);
    bool _4007 = !_3985;
    int _4009 = _4007 ? 0 : (-1);
    int _4011 = int(_3865) + int(_3969);
    float _4013 = _4001 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _4015 = -_164;
    float _4017 = fma(_4015, (*spvDescriptorSet0.vp_c9)._m0[76].x, _4005);
    bool _4019 = uint(_3993) >= uint(_1997);
    int _4021 = _3997 * _3963;
    int _4023 = _4021 + _2819;
    int _4025 = ~_2007;
    int _4027 = _4025 + 1;
    float _4029 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4031 = _3713 + _4029;
    float _4033 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _4035 = !_4019;
    int _4037 = _4035 ? 0 : (-1);
    int _4039 = _4027 * _4011;
    int _4041 = _4039 + _2963;
    bool _4043 = uint(_4023) >= uint(_1952);
    float _4045 = fma(_4031, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4013);
    float _4047 = fma(as_type<float>(_2151), (*spvDescriptorSet0.vp_c9)._m0[93].z, _4033);
    float _4049 = as_type<float>(_2151) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _4051 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _4053 = !_4043;
    int _4055 = _4053 ? 0 : (-1);
    float _4057 = fma(_3979, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4045);
    bool _4059 = uint(_4041) >= uint(_2007);
    float _4061 = -_4051;
    float _4063 = fma(_4049, 2.0, _4061);
    float _4065 = floor(_3935);
    int _4067 = ~_3957;
    int _4069 = _4067 + _4009;
    int _4071 = _4069 + 1;
    float _4073 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].z, _4047);
    int _4075 = ~_3975;
    int _4077 = _4075 + _4037;
    int _4079 = _4077 + 1;
    float _4081 = fma(as_type<float>(_2149), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3961);
    float _4083 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _4085 = as_type<float>(_2149) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _4087 = !_4059;
    int _4089 = _4087 ? 0 : (-1);
    int _4091 = _1834 * _4071;
    int _4093 = _4091 + _2369;
    bool _4095 = _4057 >= 0.0;
    float _4097 = fma(_4085, -2.0, _4083);
    int _4099 = _1997 * _4079;
    int _4101 = _4099 + _2609;
    float _4103 = fma(_3625, _3779, _3959);
    float _4105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    bool _4107 = !_2993;
    int _4109 = _4107 ? _4093 : (-1);
    float _4111 = fma(_3695, _3753, _4103);
    float _4113 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _4115 = _3927;
    float _4117 = _4073;
    if (_3567)
    {
        _3919 = _2129;
    }
    float _4119 = _3919;
    float _4121 = fma(_3615, _3739, _4111);
    float _4123 = _4119;
    if (_3567)
    {
        _4115 = _1940;
    }
    float _4125 = _4115;
    float _4127 = fma(_3647, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4113);
    float _4129 = _4125;
    if (!_3567)
    {
        _4123 = _2143;
    }
    float _4131 = _4123;
    float _4133 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_3567)
    {
        _4129 = _2129;
    }
    float _4135 = _4129;
    bool _4137 = _4065 > 0.0;
    float _4139 = fma(_3653, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4133);
    bool _4141 = _4065 >= 0.0;
    bool _4143 = isnan(_4065);
    bool _4145 = _4141 || _4143;
    bool _4147 = isnan(0.0);
    bool _4149 = _4145 || _4147;
    float _4151 = _4105 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _4153 = _4065;
    if (_4095)
    {
        _4153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _4155 = _4153;
    float _4157 = _1940 + _2129;
    float _4159 = fma(_4151, _3483, -0.5);
    bool _4161 = !_3039;
    int _4163 = _4161 ? 0 : 1;
    int _4165 = as_type<int>(_4155);
    if (_4095)
    {
        float _4167 = _4155 * 5.0;
        _4165 = as_type<int>(_4167);
    }
    int _4169 = _4165;
    int _4171 = _3167 & 3;
    bool _4173 = _4171 != 0;
    float _4175 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4177 = _4157 + (-1.0);
    bool _4179 = !_4173;
    int _4181 = _4179 ? 0 : 1;
    if (_4095)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _13322 = as_type<float>(_4169);
        out.gl_Position.z = _13322;
    }
    int _4183 = _3211 & 3;
    bool _4185 = _4183 != 0;
    float _4187 = fma(_3639, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4175);
    float _4189 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _4191 = _3639 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _4193 = fma(_3693, (*spvDescriptorSet0.vp_c9)._m0[190].x, _4121);
    float _4195 = -_4189;
    float _4197 = fma(_4191, 2.0, _4195);
    float _4199 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _4201 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _4203 = !_4185;
    int _4205 = _4203 ? 0 : 1;
    float _4207 = fma(_3597, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4199);
    int _4209 = _3313 & 3;
    bool _4211 = _4209 != 0;
    float _4213 = _3597 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _4215 = _3013 >> 31;
    float _4217 = fma(_4177, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _4219 = !_4211;
    int _4221 = _4219 ? 0 : 1;
    float _4223 = fma(_4213, -2.0, _4201);
    bool _4225 = _3037 != 3;
    float _4227 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _4229 = _3167 >> 31;
    float _4231 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4207);
    int _4233 = _4215 & 3;
    float _4235 = -_4227;
    float _4237 = fma(_3651, 2.0, _4235);
    int _4239 = _4229 & 3;
    float _4241 = _4131 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _4243 = !_4225;
    int _4245 = _4243 ? 0 : (-1);
    float _4247 = _4135 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _4249 = _3167 + _4239;
    float _4251 = -_164;
    float _4253 = fma(_4251, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4197);
    bool _4255 = _3175 != 3;
    float _4257 = fma(_4247, -2.0, _3953);
    int _4259 = _3013 + _4233;
    float _4261 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].w, _4081);
    int _4263 = _4249 >> 2;
    float _4265 = -_164;
    float _4267 = fma(_4265, (*spvDescriptorSet0.vp_c9)._m0[91].x, _4063);
    int _4269 = _3211 >> 31;
    float _4271 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[91].y, _4097);
    bool _4273 = !_4255;
    int _4275 = _4273 ? 0 : (-1);
    float _4277 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4127);
    bool _4279 = _3231 != 3;
    float _4281 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4139);
    int _4283 = _4259 >> 2;
    float _4285 = -_164;
    float _4287 = fma(_4285, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4237);
    int _4289 = _3313 >> 31;
    float _4291 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4257);
    int _4293 = _4269 & 3;
    out.m_77.x = _4193;
    int _4295 = _4263 << 4;
    int _4297 = _4295 + 512;
    int _4299 = _4289 & 3;
    float _4301 = _4267;
    if (_4095)
    {
        out.m_49.x = 0.0;
    }
    int _4303 = _3211 + _4293;
    uint _4305 = uint(int(uint(_4297) >> uint(2)));
    uint _4307 = uint(int(uint(int(_4305)) >> uint(2)));
    int _4309 = int(_4305) & 3;
    float _4311 = (*spvDescriptorSet0.vp_c9)._m0[int(_4307)][_4309];
    int _4313 = int(_4305) + 1;
    uint _4315 = uint(int(uint(_4313) >> uint(2)));
    int _4317 = _4313 & 3;
    float _4319 = (*spvDescriptorSet0.vp_c9)._m0[int(_4315)][_4317];
    int _4321 = _4283 << 4;
    int _4323 = _4321 + 368;
    int _4325 = _3313 + _4299;
    int _4327 = _4303 >> 2;
    uint _4329 = uint(int(uint(_4323) >> uint(2)));
    uint _4331 = uint(int(uint(int(_4329)) >> uint(2)));
    int _4333 = int(_4329) & 3;
    float _4335 = (*spvDescriptorSet0.vp_c9)._m0[int(_4331)][_4333];
    int _4337 = int(_4329) + 1;
    uint _4339 = uint(int(uint(_4337) >> uint(2)));
    int _4341 = _4337 & 3;
    float _4343 = (*spvDescriptorSet0.vp_c9)._m0[int(_4339)][_4341];
    int _4345 = _4327 << 4;
    int _4347 = _4345 + 656;
    float _4349 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _4351 = _4325 >> 2;
    float _4353 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _4355 = !_2619;
    int _4357 = _4355 ? _4101 : (-1);
    uint _4359 = uint(int(uint(_4347) >> uint(2)));
    uint _4361 = uint(int(uint(int(_4359)) >> uint(2)));
    int _4363 = int(_4359) & 3;
    float _4365 = (*spvDescriptorSet0.vp_c9)._m0[int(_4361)][_4363];
    int _4367 = int(_4359) + 1;
    uint _4369 = uint(int(uint(_4367) >> uint(2)));
    int _4371 = _4367 & 3;
    float _4373 = (*spvDescriptorSet0.vp_c9)._m0[int(_4369)][_4371];
    bool _4375 = _3331 != 3;
    float _4377 = fma(_3661, -2.0, _4349);
    int _4379 = _4351 << 4;
    int _4381 = _4379 + 800;
    float _4383 = -_4353;
    float _4385 = fma(_4241, 2.0, _4383);
    int _4387 = ~_3963;
    int _4389 = _4387 + _4055;
    int _4391 = _4389 + 1;
    float _4393 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4377);
    int _4395 = ~_4011;
    int _4397 = _4395 + _4089;
    int _4399 = _4397 + 1;
    float _4401 = -_164;
    float _4403 = fma(_4401, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4385);
    int _4405 = _4149 ? 0 : 1;
    int _4407 = _4323 + 8;
    uint _4409 = uint(int(uint(_4407) >> uint(2)));
    uint _4411 = uint(int(uint(int(_4409)) >> uint(2)));
    int _4413 = int(_4409) & 3;
    float _4415 = (*spvDescriptorSet0.vp_c9)._m0[int(_4411)][_4413];
    int _4417 = int(_4409) + 1;
    uint _4419 = uint(int(uint(_4417) >> uint(2)));
    int _4421 = _4417 & 3;
    float _4423 = (*spvDescriptorSet0.vp_c9)._m0[int(_4419)][_4421];
    bool _4425 = !_4279;
    int _4427 = _4425 ? 0 : (-1);
    int _4429 = _2007 * _4399;
    int _4431 = _4429 + _2963;
    bool _4433 = !_4375;
    int _4435 = _4433 ? 0 : (-1);
    int _4437 = _1952 * _4391;
    int _4439 = _4437 + _2819;
    int _4441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _4443 = _4441 != 0;
    int _4445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _4447 = _4445 != 0;
    int _4449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _4451 = _4449 != 0;
    int _4453 = abs(_3247);
    uint _4455 = uint(int(uint(_4381) >> uint(2)));
    uint _4457 = uint(int(uint(int(_4455)) >> uint(2)));
    int _4459 = int(_4455) & 3;
    float _4461 = (*spvDescriptorSet0.vp_c9)._m0[int(_4457)][_4459];
    int _4463 = int(_4455) + 1;
    uint _4465 = uint(int(uint(_4463) >> uint(2)));
    int _4467 = _4463 & 3;
    float _4469 = (*spvDescriptorSet0.vp_c9)._m0[int(_4465)][_4467];
    int _4471 = ~_4405;
    int _4473 = _4471 + 1;
    int _4475 = _4473 + 1;
    int _4477 = _4475;
    if (!_4137)
    {
        int _4479 = ~_4405;
        int _4481 = _4479 + 1;
        _4477 = _4481;
    }
    int _4483 = _4477;
    int _4485 = abs(_3319);
    int _4487 = ~_4453;
    int _4489 = _4487 + 1;
    int _4491 = _4489 + 1;
    int _4493 = _4297 + 8;
    uint _4495 = uint(int(uint(_4493) >> uint(2)));
    uint _4497 = uint(int(uint(int(_4495)) >> uint(2)));
    int _4499 = int(_4495) & 3;
    float _4501 = (*spvDescriptorSet0.vp_c9)._m0[int(_4497)][_4499];
    int _4503 = int(_4495) + 1;
    uint _4505 = uint(int(uint(_4503) >> uint(2)));
    int _4507 = _4503 & 3;
    float _4509 = (*spvDescriptorSet0.vp_c9)._m0[int(_4505)][_4507];
    int _4511 = abs(_3079);
    int _4513 = abs(_4163);
    float _4515 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4517 = int(_4515);
    int _4519 = ~_4511;
    int _4521 = _4519 + 1;
    int _4523 = _4521 + 1;
    int _4525 = _4491 * as_type<int>(_4319);
    int _4527 = abs(_4181);
    int _4529 = _4381 + 8;
    uint _4531 = uint(int(uint(_4529) >> uint(2)));
    uint _4533 = uint(int(uint(int(_4531)) >> uint(2)));
    int _4535 = int(_4531) & 3;
    float _4537 = (*spvDescriptorSet0.vp_c9)._m0[int(_4533)][_4535];
    int _4539 = int(_4531) + 1;
    uint _4541 = uint(int(uint(_4539) >> uint(2)));
    int _4543 = _4539 & 3;
    float _4545 = (*spvDescriptorSet0.vp_c9)._m0[int(_4541)][_4543];
    int _4547 = ~_4513;
    int _4549 = _4547 + 1;
    int _4551 = _4549 + 1;
    int _4553 = ~_4485;
    int _4555 = _4553 + 1;
    int _4557 = _4555 + 1;
    int _4559 = ~_4527;
    int _4561 = _4559 + 1;
    int _4563 = _4561 + 1;
    int _4565 = _4523 * as_type<int>(_4343);
    int _4567 = abs(_4205);
    int _4569 = _4347 + 8;
    uint _4571 = uint(int(uint(_4569) >> uint(2)));
    uint _4573 = uint(int(uint(int(_4571)) >> uint(2)));
    int _4575 = int(_4571) & 3;
    float _4577 = (*spvDescriptorSet0.vp_c9)._m0[int(_4573)][_4575];
    int _4579 = int(_4571) + 1;
    uint _4581 = uint(int(uint(_4579) >> uint(2)));
    int _4583 = _4579 & 3;
    float _4585 = (*spvDescriptorSet0.vp_c9)._m0[int(_4581)][_4583];
    int _4587 = abs(_3391);
    int _4589 = _4551 * as_type<int>(_4335);
    int _4591 = _4589 + _4565;
    int _4593 = ~_3869;
    int _4595 = _4593 + 1;
    int _4597 = _4595 + 1;
    int _4599 = _4563 * as_type<int>(_4311);
    int _4601 = _4599 + _4525;
    int _4603 = ~_4567;
    int _4605 = _4603 + 1;
    int _4607 = _4605 + 1;
    int _4609 = _4557 * as_type<int>(_4373);
    int _4611 = ~_4587;
    int _4613 = _4611 + 1;
    int _4615 = _4613 + 1;
    float _4617 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4619 = int(_4617);
    int _4621 = abs(_4221);
    int _4623 = _4607 * as_type<int>(_4365);
    int _4625 = _4623 + _4609;
    int _4627 = abs(_3225);
    int _4629 = ~_4621;
    int _4631 = _4629 + 1;
    int _4633 = _4631 + 1;
    int _4635 = ~_4627;
    int _4637 = _4635 + 1;
    int _4639 = _4637 + 1;
    int _4641 = _4597 * as_type<int>(_4415);
    int _4643 = _4641 + _4591;
    int _4645 = abs(_3375);
    float _4647 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4649 = int(_4647);
    int _4651 = abs(_3301);
    int _4653 = ~_4645;
    int _4655 = _4653 + 1;
    int _4657 = _4655 + 1;
    int _4659 = abs(_4275);
    int _4661 = _4615 * as_type<int>(_4469);
    float _4663 = float(uint(_3681));
    float _4665 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4667 = log2(_4665);
    int _4669 = abs(_4245);
    int _4671 = _4633 * as_type<int>(_4461);
    int _4673 = _4671 + _4661;
    int _4675 = abs(_3337);
    int _4677 = ~_4669;
    int _4679 = _4677 + 1;
    int _4681 = _4679 + 1;
    int _4683 = _4639 * as_type<int>(_4501);
    int _4685 = _4683 + _4601;
    float _4687 = 1.0 / _4663;
    int _4689 = abs(_4619);
    int _4691 = _4681 * as_type<int>(_4423);
    int _4693 = _4691 + _4643;
    int _4695 = ~_4651;
    int _4697 = _4695 + 1;
    int _4699 = _4697 + 1;
    int _4701 = abs(_4435);
    int _4703 = _4657 * as_type<int>(_4537);
    int _4705 = _4703 + _4673;
    int _4707 = ~_4659;
    int _4709 = _4707 + 1;
    int _4711 = _4709 + 1;
    int _4713 = abs(_4427);
    int _4715 = abs(_3171);
    int _4717 = _4711 * as_type<int>(_4509);
    int _4719 = _4717 + _4685;
    int _4721 = ~_4713;
    int _4723 = _4721 + 1;
    int _4725 = _4723 + 1;
    int _4727 = _4699 * as_type<int>(_4577);
    int _4729 = _4727 + _4625;
    int _4731 = abs(_3681);
    int _4733 = abs(_3323);
    int _4735 = _4725 * as_type<int>(_4585);
    int _4737 = _4735 + _4729;
    int _4739 = ~_4715;
    int _4741 = _4739 + 1;
    int _4743 = _4741 + 1;
    float _4745 = _4001 * _4001;
    int _4747 = abs(_3489);
    int _4749 = _4693 * _4743;
    int _4751 = ~_4675;
    int _4753 = _4751 + 1;
    int _4755 = _4753 + 1;
    float _4757 = fma(_4031, _4031, _4745);
    int _4759 = ~_4701;
    int _4761 = _4759 + 1;
    int _4763 = _4761 + 1;
    int _4765 = _4109 * _4715;
    int _4767 = _4765 + _4749;
    int _4769 = _4755 * _4737;
    int _4771 = as_type<int>(_4687) + (-2);
    float _4773 = fma(_3979, _3979, _4757);
    float _4775 = float(uint(_4767));
    int _4777 = _4763 * as_type<int>(_4545);
    int _4779 = _4777 + _4705;
    float _4781 = float(uint(_4517));
    float _4783 = rsqrt(_4773);
    float _4785 = float(uint(_4649));
    float _4787 = as_type<float>(_4771) * _4775;
    int _4789 = abs(_4517);
    float _4791 = float(uint(_4731));
    int _4793 = ~_4733;
    int _4795 = _4793 + 1;
    int _4797 = _4795 + 1;
    float _4799 = 1.0 / _4781;
    float _4801 = float(uint(_4619));
    int _4803 = _4797 * _4719;
    float _4805 = float(uint(_4789));
    int _4807 = ~_4747;
    int _4809 = _4807 + 1;
    int _4811 = _4809 + 1;
    float _4813 = 1.0 / _4785;
    bool _4815 = !_2881;
    int _4817 = _4815 ? _4431 : (-1);
    int _4819 = _4357 * _4733;
    int _4821 = _4819 + _4803;
    bool _4823 = !_2847;
    int _4825 = _4823 ? _4439 : (-1);
    int _4827 = _4811 * _4779;
    float _4829 = float(uint(_4689));
    int _4831 = ~_3681;
    int _4833 = _4831 + 1;
    float _4835 = 1.0 / _4791;
    int _4837 = _4817 * _4747;
    int _4839 = _4837 + _4827;
    float _4841 = _4001 * _4783;
    int _4843 = abs(_4649);
    int _4845 = _4825 * _4675;
    int _4847 = _4845 + _4769;
    int _4849 = as_type<int>(_4799) + (-2);
    float _4851 = -_4841;
    float _4853 = fma(_4851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4001);
    float _4855 = float(uint(_4821));
    float _4857 = trunc(_4787);
    float _4859 = precise::max(_4857, 0.0);
    uint _4861 = uint(_4859);
    int _4863 = as_type<int>(_4813) + (-2);
    float _4865 = _4031 * _4783;
    float _4867 = float(uint(_4839));
    float _4869 = as_type<float>(_4849) * _4855;
    float _4871 = float(uint(_4843));
    float _4873 = -_4865;
    float _4875 = fma(_4873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4031);
    int _4877 = abs(_4821);
    float _4879 = 1.0 / _4801;
    int _4881 = as_type<int>(_4835) + (-2);
    float _4883 = as_type<float>(_4863) * _4867;
    int _4885 = abs(_4767);
    float _4887 = _4853 * _4853;
    float _4889 = float(uint(_4847));
    float _4891 = float(uint(_4885));
    float _4893 = 1.0 / _4805;
    int _4895 = _4833 * int(_4861);
    int _4897 = _4895 + _4767;
    float _4899 = fma(_4875, _4875, _4887);
    int _4901 = ~_4649;
    int _4903 = _4901 + 1;
    float _4905 = as_type<float>(_4881) * _4891;
    int _4907 = ~_4619;
    int _4909 = _4907 + 1;
    float _4911 = float(uint(_4897));
    float _4913 = 1.0 / _4829;
    int _4915 = as_type<int>(_4879) + (-2);
    float _4917 = float(uint(_4877));
    float _4919 = as_type<float>(_4771) * _4911;
    bool _4921 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4923 = isnan(0.0);
    bool _4925 = _4921 || _4923;
    bool _4927 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4929 = _4925 || _4927;
    float _4931 = as_type<float>(_4915) * _4889;
    int _4933 = as_type<int>(_4893) + (-2);
    float _4935 = 1.0 / _4871;
    int _4937 = ~_4517;
    int _4939 = _4937 + 1;
    float _4941 = as_type<float>(_4933) * _4917;
    int _4943 = abs(_4847);
    float _4945 = trunc(_4869);
    float _4947 = precise::max(_4945, 0.0);
    uint _4949 = uint(_4947);
    int _4951 = as_type<int>(_4913) + (-2);
    float _4953 = float(uint(_4943));
    int _4955 = abs(_4839);
    float _4957 = trunc(_4883);
    float _4959 = precise::max(_4957, 0.0);
    uint _4961 = uint(_4959);
    float _4963 = as_type<float>(_4951) * _4953;
    int _4965 = as_type<int>(_4935) + (-2);
    float _4967 = float(uint(_4955));
    float _4969 = trunc(_4931);
    float _4971 = precise::max(_4969, 0.0);
    uint _4973 = uint(_4971);
    float _4975 = as_type<float>(_4965) * _4967;
    float _4977 = trunc(_4905);
    float _4979 = precise::max(_4977, 0.0);
    uint _4981 = uint(_4979);
    int _4983 = _4903 * int(_4961);
    int _4985 = _4983 + _4839;
    float _4987 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4223);
    float _4989 = float(uint(_4985));
    float _4991 = -_4987;
    float _4993 = fma(_4231, _4159, _4991);
    float _4995 = trunc(_4919);
    float _4997 = precise::max(_4995, 0.0);
    uint _4999 = uint(_4997);
    float _5001 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4187);
    int _5003 = _4939 * int(_4949);
    int _5005 = _5003 + _4821;
    float _5007 = _4667 * _164;
    int _5009 = _4909 * int(_4973);
    int _5011 = _5009 + _4847;
    float _5013 = fma(_5001, _3937, _4253);
    float _5015 = as_type<float>(_4863) * _4989;
    float _5017 = float(uint(_5005));
    float _5019 = trunc(_4941);
    float _5021 = precise::max(_5019, 0.0);
    uint _5023 = uint(_5021);
    float _5025 = float(uint(_5011));
    float _5027 = as_type<float>(_4849) * _5017;
    int _5029 = ~_4789;
    int _5031 = _5029 + 1;
    float _5033 = as_type<float>(_4915) * _5025;
    bool _5035 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _5037 = isnan(1.0);
    bool _5039 = _5035 || _5037;
    bool _5041 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _5043 = _5039 || _5041;
    float _5045 = trunc(_4975);
    float _5047 = precise::max(_5045, 0.0);
    uint _5049 = uint(_5047);
    int _5051 = int(_4861) + int(_4999);
    float _5053 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _5055 = 1.0 + _5053;
    int _5057 = ~_4731;
    int _5059 = _5057 + 1;
    int _5061 = ~_4689;
    int _5063 = _5061 + 1;
    float _5065 = trunc(_4963);
    float _5067 = precise::max(_5065, 0.0);
    uint _5069 = uint(_5067);
    int _5071 = _5031 * int(_5023);
    int _5073 = _5071 + _4877;
    int _5075 = _5059 * int(_4981);
    int _5077 = _5075 + _4885;
    float _5079 = trunc(_5027);
    float _5081 = precise::max(_5079, 0.0);
    uint _5083 = uint(_5081);
    int _5085 = ~_4843;
    int _5087 = _5085 + 1;
    int _5089 = _5087 * int(_5049);
    int _5091 = _5089 + _4955;
    float _5093 = exp2(_5007);
    float _5095 = float(uint(_5073));
    int _5097 = _5063 * int(_5069);
    int _5099 = _5097 + _4943;
    float _5101 = float(uint(_5091));
    float _5103 = float(uint(_5077));
    float _5105 = as_type<float>(_4933) * _5095;
    float _5107 = 1.0 / _5055;
    int _5109 = int(_4949) + int(_5083);
    float _5111 = as_type<float>(_4965) * _5101;
    float _5113 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _5115 = as_type<float>(_4881) * _5103;
    float _5117 = trunc(_5033);
    float _5119 = precise::max(_5117, 0.0);
    uint _5121 = uint(_5119);
    float _5123 = float(uint(_5099));
    float _5125 = -_5093;
    float _5127 = _5125 + 1.0;
    float _5129 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _5131 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _5133 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _5135 = as_type<float>(_4951) * _5123;
    float _5137 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[78].w, _5129);
    float _5139 = trunc(_5015);
    float _5141 = precise::max(_5139, 0.0);
    uint _5143 = uint(_5141);
    float _5145 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[88].w, _5133);
    float _5147 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _5113);
    float _5149 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[88].z, _5131);
    float _5151 = _4929 ? _5127 : 0.0;
    float _5153 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _3463);
    int _5155 = ~_3681;
    int _5157 = _5155 + 1;
    float _5159 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _5137);
    float _5161 = trunc(_5115);
    float _5163 = precise::max(_5161, 0.0);
    uint _5165 = uint(_5163);
    int _5167 = ~_4517;
    int _5169 = _5167 + 1;
    float _5171 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].w, _5145);
    float _5173 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _5147);
    int _5175 = ~_4619;
    int _5177 = _5175 + 1;
    int _5179 = int(_4973) + int(_5121);
    int _5181 = _5169 * _5109;
    int _5183 = _5181 + _4821;
    float _5185 = trunc(_5105);
    float _5187 = precise::max(_5185, 0.0);
    uint _5189 = uint(_5187);
    float _5191 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].z, _5149);
    float _5193 = _4841;
    if (_5043)
    {
        float _5195 = _5151 * _5107;
        _168 = _5195;
    }
    float _5197 = _168;
    int _5199 = _5157 * _5051;
    int _5201 = _5199 + _4767;
    bool _5203 = uint(_5183) >= uint(_4517);
    int _5205 = _5177 * _5179;
    int _5207 = _5205 + _4847;
    int _5209 = int(_4961) + int(_5143);
    float _5211 = trunc(_5135);
    float _5213 = precise::max(_5211, 0.0);
    uint _5215 = uint(_5213);
    bool _5217 = uint(_5201) >= uint(_3681);
    int _5219 = ~_4649;
    int _5221 = _5219 + 1;
    bool _5223 = !_5217;
    int _5225 = _5223 ? 0 : (-1);
    bool _5227 = uint(_5207) >= uint(_4619);
    float _5229 = trunc(_5111);
    float _5231 = precise::max(_5229, 0.0);
    uint _5233 = uint(_5231);
    int _5235 = int(_4981) + int(_5165);
    int _5237 = _5221 * _5209;
    int _5239 = _5237 + _4839;
    int _5241 = ~_4731;
    int _5243 = _5241 + 1;
    int _5245 = int(_5023) + int(_5189);
    int _5247 = ~_4789;
    int _5249 = _5247 + 1;
    int _5251 = _5243 * _5235;
    int _5253 = _5251 + _4885;
    int _5255 = int(_5069) + int(_5215);
    int _5257 = ~_4689;
    int _5259 = _5257 + 1;
    int _5261 = _5249 * _5245;
    int _5263 = _5261 + _4877;
    bool _5265 = !_5203;
    int _5267 = _5265 ? 0 : (-1);
    int _5269 = ~_4843;
    int _5271 = _5269 + 1;
    int _5273 = _5259 * _5255;
    int _5275 = _5273 + _4943;
    int _5277 = int(_5049) + int(_5233);
    bool _5279 = uint(_5239) >= uint(_4649);
    bool _5281 = !_5227;
    int _5283 = _5281 ? 0 : (-1);
    int _5285 = _5271 * _5277;
    int _5287 = _5285 + _4955;
    bool _5289 = uint(_5253) >= uint(_4731);
    bool _5291 = !_5279;
    int _5293 = _5291 ? 0 : (-1);
    float _5295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _5297 = uint(_5263) >= uint(_4789);
    bool _5299 = !_5289;
    int _5301 = _5299 ? 0 : (-1);
    bool _5303 = uint(_5275) >= uint(_4689);
    int _5305 = ~_5051;
    int _5307 = _5305 + _5225;
    int _5309 = _5307 + 1;
    float _5311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _5313 = !_5297;
    int _5315 = _5313 ? 0 : (-1);
    int _5317 = ~_5109;
    int _5319 = _5317 + _5267;
    int _5321 = _5319 + 1;
    int _5323 = _3681 * _5309;
    int _5325 = _5323 + _4767;
    bool _5327 = uint(_5287) >= uint(_4843);
    int _5329 = ~_5179;
    int _5331 = _5329 + _5283;
    int _5333 = _5331 + 1;
    int _5335 = _4517 * _5321;
    int _5337 = _5335 + _4821;
    bool _5339 = !_5303;
    int _5341 = _5339 ? 0 : (-1);
    float _5343 = _5295 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _5345 = ~_5209;
    int _5347 = _5345 + _5293;
    int _5349 = _5347 + 1;
    int _5351 = _4619 * _5333;
    int _5353 = _5351 + _4847;
    bool _5355 = _3681 == 0;
    float _5357 = fma(_5343, _2171, -0.5);
    bool _5359 = !_5327;
    int _5361 = _5359 ? 0 : (-1);
    float _5363 = _5311 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _5365 = _4517 == 0;
    int _5367 = _4821 ^ _4517;
    int _5369 = _4767 ^ _3681;
    bool _5371 = !_5355;
    int _5373 = _5371 ? _5325 : (-1);
    int _5375 = _4649 * _5349;
    int _5377 = _5375 + _4839;
    bool _5379 = !_5365;
    int _5381 = _5379 ? _5337 : (-1);
    uint _5383 = uint(int(uint(_5367) >> uint(31)));
    bool _5385 = _4649 == 0;
    uint _5387 = uint(int(uint(_5369) >> uint(31)));
    int _5389 = ~_5315;
    int _5391 = _5245 + _5389;
    int _5393 = _5391 + 1;
    float _5395 = _3979 * _4783;
    int _5397 = ~int(_5383);
    int _5399 = _5397 + 1;
    bool _5401 = !_5385;
    int _5403 = _5401 ? _5377 : (-1);
    float _5405 = -_5395;
    float _5407 = fma(_5405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3979);
    int _5409 = ~_5301;
    int _5411 = _5235 + _5409;
    int _5413 = _5411 + 1;
    int _5415 = ~int(_5387);
    int _5417 = _5415 + 1;
    float _5419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _5421 = _4517 == 0;
    float _5423 = fma(_5407, _5407, _4899);
    bool _5425 = _4619 == 0;
    int _5427 = _5393 ^ _5399;
    int _5429 = _5413 ^ _5417;
    float _5431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _5433 = !_5425;
    int _5435 = _5433 ? _5353 : (-1);
    bool _5437 = _3681 == 0;
    int _5439 = ~_5417;
    int _5441 = _5439 + _5429;
    int _5443 = _5441 + 1;
    int _5445 = ~_5399;
    int _5447 = _5445 + _5427;
    int _5449 = _5447 + 1;
    float _5451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _5453 = !_5437;
    int _5455 = _5453 ? _5443 : (-1);
    bool _5457 = _4619 == 0;
    int _5459 = _4847 ^ _4619;
    bool _5461 = !_5421;
    int _5463 = _5461 ? _5449 : (-1);
    int _5465 = ~_5361;
    int _5467 = _5277 + _5465;
    int _5469 = _5467 + 1;
    float _5471 = _5419 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _5473 = float(_5435);
    bool _5475 = _4649 == 0;
    float _5477 = fma(_5471, _2221, -0.5);
    int _5479 = _4839 ^ _4649;
    float _5481 = _5431 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _5483 = ~_5341;
    int _5485 = _5255 + _5483;
    int _5487 = _5485 + 1;
    float _5489 = fma(_5471, _5473, _4403);
    float _5491 = float(_5373);
    float _5493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _5495 = float(_5381);
    float _5497 = fma(_5481, _2209, -0.5);
    uint _5499 = uint(int(uint(_5459) >> uint(31)));
    float _5501 = fma(_5343, _5491, _4017);
    float _5503 = float(_5403);
    float _5505 = fma(_5481, _5495, _4287);
    int _5507 = ~int(_5499);
    int _5509 = _5507 + 1;
    float _5511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _5513 = _5451 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    uint _5515 = uint(int(uint(_5479) >> uint(31)));
    float _5517 = fma(_5173, _5357, _5501);
    int _5519 = _5487 ^ _5509;
    float _5521 = fma(_5513, _2287, -0.5);
    float _5523 = fma(_5513, _5503, _4267);
    int _5525 = ~int(_5515);
    int _5527 = _5525 + 1;
    float _5529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _5531 = ~_5509;
    int _5533 = _5531 + _5519;
    int _5535 = _5533 + 1;
    float _5537 = fma(_4073, _5521, _5523);
    float _5539 = fma(_5363, _3393, -0.5);
    int _5541 = _5469 ^ _5527;
    float _5543 = _5493 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _5545 = !_5457;
    int _5547 = _5545 ? _5535 : (-1);
    float _5549 = fma(_4277, _5497, _5505);
    float _5551 = float(_5455);
    float _5553 = _5511 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5555 = float(_5547);
    float _5557 = fma(_5543, _3423, -0.5);
    int _5559 = ~_5527;
    int _5561 = _5559 + _5541;
    int _5563 = _5561 + 1;
    float _5565 = fma(_5553, _3419, -0.5);
    float _5567 = -_5153;
    float _5569 = fma(_5363, _5551, _5567);
    float _5571 = -_4291;
    float _5573 = fma(_5553, _5555, _5571);
    bool _5575 = !_4443;
    int _5577 = _5575 ? 0 : 1;
    float _5579 = _5529 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _5581 = !_5475;
    int _5583 = _5581 ? _5563 : (-1);
    float _5585 = fma(_5159, _5539, _5569);
    float _5587 = float(_5463);
    float _5589 = fma(_5579, _3403, -0.5);
    float _5591 = float(_5583);
    float _5593 = fma(_5171, _5565, _5573);
    int _5595 = abs(_5577);
    float _5597 = -_4393;
    float _5599 = fma(_5579, _5587, _5597);
    float _5601 = in.m_79.x;
    float _5603 = in.m_79.y;
    float _5605 = in.m_79.z;
    float _5607 = -_4271;
    float _5609 = fma(_5543, _5591, _5607);
    float _5611 = fma(_5191, _5477, _5489);
    float _5613 = fma(_4281, _5589, _5599);
    bool _5615 = !_4447;
    int _5617 = _5615 ? 0 : 1;
    float _5619 = fma(_4261, _5557, _5609);
    float _5621 = _5013 + 0.5;
    float _5623 = _4993 + 0.5;
    float _5625 = _5611 + 0.5;
    float _5627 = _5517 + 0.5;
    float _5629 = _5549 + 0.5;
    float _5631 = _5585 + 0.5;
    float _5633 = _5613 + 0.5;
    float _5635 = _5537 + 0.5;
    float _5637 = _5593 + 0.5;
    float _5639 = _5619 + 0.5;
    int _5641 = abs(_5617);
    out.m_81.x = _5621;
    out.m_81.y = _5623;
    bool _5643 = !_4451;
    int _5645 = _5643 ? 0 : 1;
    out.m_83.x = _5627;
    out.m_83.y = _5631;
    out.m_83.z = _5629;
    out.m_83.w = _5633;
    out.m_85.x = _5625;
    out.m_85.y = _5637;
    out.m_87.x = _5635;
    out.m_87.y = _5639;
    float _5647 = float(_4483);
    float _5649 = float(_5595);
    float _5651 = as_type<float>(_5563);
    if (_4095)
    {
        return out;
    }
    float _5653 = -_4841;
    float _5655 = fma(_5653, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3635);
    float _5657 = _5649 * _5647;
    float _5659 = float(_5641);
    float _5661 = -_4865;
    float _5663 = fma(_5661, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3713);
    float _5665 = float(_3565);
    float _5667 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5669 = _5655 + _5667;
    float _5671 = _5657 * (-2.0);
    float _5673 = -_5395;
    float _5675 = fma(_5673, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3895);
    float _5677 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5679 = _5663 + _5677;
    float _5681 = _5669 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5683 = _5659 * _5665;
    float _5685 = _2129 + (-0.5);
    float _5687 = fma(_5671, _5601, _5601);
    float _5689 = _1940 + _2143;
    float _5691 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5693 = _5675 + _5691;
    float _5695 = fma(_5679, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5681);
    float _5697 = fma(_4217, _5671, _4217);
    float _5699 = fma(_5685, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5687);
    float _5701 = _5689 + (-1.0);
    float _5703 = _5683 * (-2.0);
    float _5705 = fma(_5693, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5695);
    float _5707 = fma(_5697, _5197, _5699);
    float _5709 = fma(_5701, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5711 = _1940 + (-0.5);
    float _5713 = fma(_5703, _5603, _5603);
    bool _5715 = _5705 >= 0.0;
    float _5717 = fma(_5709, _5703, _5709);
    int _5719 = abs(_5645);
    float _5721 = fma(_5711, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5713);
    float _5723 = _5707 * 0.15915493667125701904296875;
    float _5725 = sqrt(_5423);
    float _5727 = fma(_5717, _5197, _5721);
    float _5729 = float(_3925);
    float _5731 = float(_5719);
    float _5733 = _5727 * 0.15915493667125701904296875;
    float _5735 = _2129 + _2143;
    float _5737 = _5681;
    if (_5715)
    {
        _5737 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5739 = _5737;
    float _5741 = _5723 * 6.283185482025146484375;
    float _5743 = sin(_5741);
    float _5745 = _5731 * _5729;
    int _5747 = as_type<int>(_5739);
    if (_5715)
    {
        out.m_49.x = 0.0;
    }
    if (_5715)
    {
        float _5749 = _5739 * 5.0;
        _5747 = as_type<int>(_5749);
    }
    int _5751 = _5747;
    float _5753 = _5735 + (-1.0);
    float _5755 = _5745 * (-2.0);
    float _5757 = _5723 * 6.283185482025146484375;
    float _5759 = cos(_5757);
    if (_5715)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _15614 = as_type<float>(_5751);
        out.gl_Position.z = _15614;
    }
    float _5761 = _5733 * 6.283185482025146484375;
    float _5763 = sin(_5761);
    if (_5715)
    {
        return out;
    }
    float _5765 = -_3635;
    float _5767 = _5765 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5769 = fma(_5753, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5771 = -_3713;
    float _5773 = _5771 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5775 = -_3895;
    float _5777 = _5775 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5779 = _5767 * _5767;
    float _5781 = fma(_5755, _5605, _5605);
    float _5783 = _2143 + (-0.5);
    float _5785 = fma(_5769, _5755, _5769);
    float _5787 = fma(_5773, _5773, _5779);
    float _5789 = _5733 * 6.283185482025146484375;
    float _5791 = cos(_5789);
    float _5793 = fma(_5783, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5781);
    float _5795 = _4783 * _5725;
    float _5797 = fma(_5777, _5777, _5787);
    float _5799 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5801 = fma(_5785, _5197, _5793);
    float _5803 = in.m_89.x;
    float _5805 = in.m_89.y;
    float _5807 = in.m_89.z;
    float _5809 = _5743 * _5763;
    float _5811 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5813 = rsqrt(_5797);
    float _5815 = _5801 * 0.15915493667125701904296875;
    float _5817 = _5795 * _5799;
    float _5819 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5821 = _5795 * _5811;
    float _5823 = _5759 * _5791;
    float _5825 = _5815 * 6.283185482025146484375;
    float _5827 = sin(_5825);
    float _5829 = _5743 * _5791;
    float _5831 = _5795 * _5819;
    float _5833 = _5773 * _5813;
    float _5835 = _5777 * _5813;
    float _5837 = _5767 * _5813;
    float _5839 = _5815 * 6.283185482025146484375;
    float _5841 = cos(_5839);
    float _5843 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5845 = _5833 * _5843;
    float _5847 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5849 = _5835 * _5847;
    float _5851 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5853 = _5837 * _5851;
    float _5855 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5857 = -_5845;
    float _5859 = fma(_5835, _5855, _5857);
    float _5861 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5863 = -_5849;
    float _5865 = fma(_5837, _5861, _5863);
    float _5867 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5869 = -_5853;
    float _5871 = fma(_5833, _5867, _5869);
    float _5873 = _5859 * _5859;
    float _5875 = fma(_5827, _5823, _5809);
    float _5877 = fma(_5827, _5809, _5823);
    float _5879 = _5759 * _5763;
    float _5881 = fma(_5865, _5865, _5873);
    float _5883 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5805);
    float _5885 = _5759 * _5841;
    float _5887 = fma(_5871, _5871, _5881);
    float _5889 = _5883 * _5817;
    float _5891 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5803);
    float _5893 = -_5879;
    float _5895 = fma(_5827, _5829, _5893);
    float _5897 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5807);
    float _5899 = -_5829;
    float _5901 = fma(_5827, _5879, _5899);
    float _5903 = rsqrt(_5887);
    float _5905 = _5891 * _5831;
    float _5907 = _5885 * _5889;
    float _5909 = _5791 * _5841;
    float _5911 = _5743 * _5841;
    float _5913 = _5897 * _5821;
    float _5915 = -_5889;
    float _5917 = _5827 * _5915;
    float _5919 = fma(_5875, _5905, _5907);
    float _5921 = _5763 * _5841;
    float _5923 = fma(_5909, _5905, _5917);
    float _5925 = _5865 * _5903;
    float _5927 = _5859 * _5903;
    float _5929 = _5871 * _5903;
    float _5931 = _5911 * _5889;
    float _5933 = _5837 * _5925;
    float _5935 = fma(_5901, _5913, _5919);
    float _5937 = _5835 * _5927;
    float _5939 = fma(_5895, _5905, _5931);
    float _5941 = -_5933;
    float _5943 = fma(_5833, _5927, _5941);
    float _5945 = fma(_5921, _5913, _5923);
    float _5947 = -_5937;
    float _5949 = fma(_5837, _5929, _5947);
    float _5951 = fma(_5877, _5913, _5939);
    float _5953 = _5943 * _5935;
    float _5955 = _5655 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5957 = _5949 * _5935;
    float _5959 = fma(_5929, _5945, _5953);
    float _5961 = fma(_5663, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5955);
    float _5963 = fma(_5925, _5945, _5957);
    float _5965 = fma(_5835, _5951, _5959);
    float _5967 = fma(_5675, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5961);
    float _5969 = fma(_5833, _5951, _5963);
    float _5971 = _3895 + _5965;
    float _5973 = _3713 + _5969;
    float _5975 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5977 = _5971 + _5975;
    float _5979 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5981 = _5973 + _5979;
    float _5983 = _5977 * _5977;
    float _5985 = fma(_5981, _5981, _5983);
    float _5987 = _5833 * _5929;
    float _5989 = sqrt(_5985);
    float _5991 = -_5987;
    float _5993 = fma(_5835, _5925, _5991);
    float _5995 = _5993 * _5935;
    float _5997 = fma(_5927, _5945, _5995);
    float _5999 = fma(_5837, _5951, _5997);
    bool _6001 = _5989 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6003 = _3635 + _5999;
    float _6005 = _5951;
    float _6007 = _5987;
    float _6009 = _5973;
    if (!_6001)
    {
        _6005 = _5971;
    }
    float _6011 = _6005;
    float _6013 = _6011;
    if (!_6001)
    {
        _6007 = _6003;
    }
    float _6015 = _6007;
    bool _6017 = !_6001;
    float _6019 = _6015;
    if (!_6017)
    {
        float _6021 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6023 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _6025 = _5989 + _6023;
        float _6027 = _6003 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6029 = _6025 * _6021;
        float _6031 = rsqrt(_5985);
        float _6033 = _6029 * 0.15915493667125701904296875;
        float _6035 = _6033 * 6.283185482025146484375;
        float _6037 = cos(_6035);
        float _6039 = _6033 * 6.283185482025146484375;
        float _6041 = sin(_6039);
        float _6043 = _6037 + (-1.0);
        float _6045 = _6043 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6047 = fma(_6041, _6027, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _6049 = fma(_6003, _6037, _6045);
        float _6051 = _6031 * _6047;
        float _6053 = fma(_5981, _6051, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _6055 = fma(_5977, _6051, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _6019 = _6049;
        _6009 = _6053;
        _6013 = _6055;
    }
    float _6057 = _6019;
    float _6059 = _6009;
    float _6061 = _6013;
    float _6063 = -_3635;
    float _6065 = _6063 + _6057;
    float _6067 = -_3713;
    float _6069 = _6067 + _6059;
    float _6071 = -_3895;
    float _6073 = _6071 + _6061;
    float _6075 = _5967 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _6077 = _6065 * _6065;
    float _6079 = _5655 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _6081 = 1.0 / _6075;
    float _6083 = fma(_6069, _6069, _6077);
    bool _6085 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _6087 = isnan(0.5);
    bool _6089 = _6085 || _6087;
    bool _6091 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _6093 = _6089 || _6091;
    bool _6095 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _6097 = isnan(0.5);
    bool _6099 = _6095 || _6097;
    bool _6101 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _6103 = _6099 || _6101;
    float _6105 = fma(_6073, _6073, _6083);
    float _6107 = fma(_5663, (*spvDescriptorSet0.vp_c8)._m0[10].x, _6079);
    float _6109 = sqrt(_6105);
    float _6111 = fma(_5675, (*spvDescriptorSet0.vp_c8)._m0[10].z, _6107);
    float _6113 = _6111 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _6115 = _6113 + _6075;
    float _6117 = _6115 * _6081;
    float _6119 = _6117 * 0.5;
    bool _6121 = _6109 > 0.0;
    float _6123 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6125 = fma(_6119, (*spvDescriptorSet0.vp_c8)._m0[30].w, _6123);
    float _6127 = 1.0 / _6125;
    bool _6129 = !_6121;
    float _6131 = _6057;
    float _6133 = _6059;
    float _6135 = _6061;
    float _6137 = _6115;
    if (!_6129)
    {
        float _6139 = _228 * _228;
        float _6141 = rsqrt(_6105);
        float _6143 = fma(_224, _224, _6139);
        float _6145 = fma(_230, _230, _6143);
        float _6147 = sqrt(_6145);
        float _6149 = _6069 * _6141;
        float _6151 = _6065 * _6141;
        float _6153 = _6073 * _6141;
        bool _6155 = _6147 > 0.0;
        bool _6157 = !_6155;
        _6137 = _6147;
        if (!_6157)
        {
            float _6159 = rsqrt(_6145);
            float _6161 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _6163 = _228 * _6159;
            float _6165 = _224 * _6159;
            float _6167 = _6151 * _6163;
            float _6169 = _230 * _6159;
            float _6171 = fma(_6149, _6165, _6167);
            float _6173 = _6161 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6175 = fma(_6153, _6169, _6171);
            float _6177 = _6175 * _6173;
            float _6179 = fma(_224, _6177, _6059);
            float _6181 = fma(_228, _6177, _6057);
            float _6183 = fma(_230, _6177, _6061);
            _6131 = _6181;
            _6133 = _6179;
            _6135 = _6183;
            _6137 = _6177;
        }
    }
    float _6185 = _6131;
    float _6187 = _6133;
    float _6189 = _6135;
    float _6191 = _6137;
    float _6193 = -_4841;
    float _6195 = fma(_6193, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6185);
    float _6197 = -_4865;
    float _6199 = fma(_6197, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6187);
    float _6201 = -_5395;
    float _6203 = fma(_6201, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6189);
    float _6205 = _6195;
    float _6207 = _6199;
    float _6209 = _6203;
    float _6211 = _6191;
    if (_6103)
    {
        _5193 = 1.0;
    }
    float _6213 = _5193;
    float _6215 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6217 = _6127 * _6215;
    float _6219 = _6213;
    if (!_6093)
    {
        float _6221 = _5669 * _5669;
        float _6223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6225 = -_3895;
        float _6227 = _6225 + _6189;
        float _6229 = -_3635;
        float _6231 = _6229 + _6185;
        float _6233 = fma(_5679, _5679, _6221);
        float _6235 = fma(_5693, _5693, _6233);
        float _6237 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6239 = sqrt(_6235);
        float _6241 = 1.0 / _5795;
        float _6243 = precise::min(_6239, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6245 = _6243 * _6223;
        float _6247 = _6237 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6249 = -_3713;
        float _6251 = _6249 + _6187;
        float _6253 = _6245 * _6241;
        float _6255 = _6247 * _6253;
        float _6257 = _6227 * _6253;
        float _6259 = fma(_6251, _6255, _5663);
        float _6261 = fma(_6231, _6255, _5655);
        float _6263 = fma(_6247, _6257, _5675);
        _6205 = _6261;
        _6207 = _6259;
        _6209 = _6263;
    }
    float _6265 = _6205;
    float _6267 = _6207;
    float _6269 = _6209;
    if (!_6103)
    {
        float _6271 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6273 = _6271 * 0.15915493667125701904296875;
        float _6275 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6277 = _6273 * 6.283185482025146484375;
        float _6279 = cos(_6277);
        float _6281 = _6275 * 0.15915493667125701904296875;
        float _6283 = _6273 * 6.283185482025146484375;
        float _6285 = sin(_6283);
        float _6287 = 1.0 / _6279;
        float _6289 = _6281 * 6.283185482025146484375;
        float _6291 = cos(_6289);
        float _6293 = _6285 * _6287;
        float _6295 = _6281 * 6.283185482025146484375;
        float _6297 = sin(_6295);
        float _6299 = _6291 * _6293;
        float _6301 = 1.0 / _6299;
        float _6303 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6305 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6303;
        float _6307 = 1.0 / _6305;
        float _6309 = _6297 * _6301;
        float _6311 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6313 = fma(_6217, _6309, _6311);
        float _6315 = _6313 * _6307;
        float _6317 = precise::clamp(_6315, 0.0, 1.0);
        _6211 = _6273;
        _6219 = _6317;
    }
    float _6319 = _6211;
    float _6321 = _6219;
    float _6323 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6325 = _6265 + _6323;
    float _6327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6329 = _6267 + _6327;
    float _6331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6333 = _6269 + _6331;
    float _6335 = _6325 * _6325;
    float _6337 = fma(_6329, _6329, _6335);
    float _6339 = fma(_6333, _6333, _6337);
    float _6341 = rsqrt(_6339);
    float _6343 = sqrt(_6339);
    float _6345 = _6341 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6347 = _6329 * _6345;
    float _6349 = _6333 * _6345;
    float _6351 = _6347 * _6347;
    float _6353 = _6349 * _6349;
    float _6355 = _6351 + _6353;
    float _6357 = sqrt(_6355);
    bool _6359 = _6357 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6361 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6363 = _6357 + _6361;
    float _6365 = _6333;
    float _6367 = _6355;
    float _6369 = _6363;
    float _6371 = _6319;
    float _6373 = _6345;
    if (_6359)
    {
        float _6375 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6365 = _6375;
    }
    float _6377 = _6365;
    if (_6359)
    {
        float _6379 = rsqrt(_6355);
        _6367 = _6379;
    }
    float _6381 = _6367;
    if (_6359)
    {
        float _6383 = _6363 * _6377;
        _6369 = _6383;
    }
    float _6385 = _6369;
    if (_6359)
    {
        float _6387 = _6385 * 0.15915493667125701904296875;
        _6371 = _6387;
    }
    float _6389 = _6371;
    float _6391 = _6335;
    if (_6359)
    {
        float _6393 = _6389 * 6.283185482025146484375;
        float _6395 = sin(_6393);
        _6391 = _6395;
    }
    float _6397 = _6391;
    float _6399 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6401 = precise::max(0.0, _6399);
    float _6403 = _6341;
    float _6405 = _6399;
    float _6407 = _6401;
    if (_6359)
    {
        float _6409 = _6389 * 6.283185482025146484375;
        float _6411 = cos(_6409);
        _6403 = _6411;
    }
    float _6413 = _6403;
    float _6415 = -_6345;
    float _6417 = -_6401;
    float _6419 = fma(_6325, _6415, _6417);
    float _6421 = _6419;
    if (_6359)
    {
        float _6423 = _6419 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6405 = _6423;
    }
    float _6425 = _6405;
    float _6427 = _6425;
    float _6429 = _6397;
    if (_6359)
    {
        float _6431 = fma(_6397, _6425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6427 = _6431;
    }
    float _6433 = _6427;
    float _6435 = fma(_5663, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6437 = _6433;
    float _6439 = _6413;
    if (_6359)
    {
        float _6441 = _6413 + (-1.0);
        _6407 = _6441;
    }
    float _6443 = _6407;
    float _6445 = _6443;
    if (_6359)
    {
        float _6447 = _6381 * _6433;
        _6373 = _6447;
    }
    float _6449 = _6373;
    if (!_6359)
    {
        _6437 = _6349;
    }
    float _6451 = _6437;
    float _6453 = _6451;
    if (_6359)
    {
        float _6455 = _6443 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6429 = _6455;
    }
    float _6457 = _6429;
    float _6459 = _6457;
    if (!_6359)
    {
        _6445 = _6347;
    }
    float _6461 = _6445;
    float _6463 = _6461;
    if (_6359)
    {
        float _6465 = _6347 * _6449;
        _6463 = _6465;
    }
    float _6467 = _6463;
    if (_6359)
    {
        float _6469 = _6349 * _6449;
        _6453 = _6469;
    }
    float _6471 = _6453;
    if (_6359)
    {
        float _6473 = fma(_6419, _6413, _6457);
        _6421 = _6473;
    }
    float _6475 = _6421;
    if (!_6359)
    {
        _6459 = _6351;
    }
    float _6477 = _6459;
    float _6479 = _6477;
    if (_6359)
    {
        float _6481 = _6467 * _6467;
        _6479 = _6481;
    }
    float _6483 = _6479;
    if (!_6359)
    {
        _6439 = _6353;
    }
    float _6485 = _6439;
    float _6487 = _6485;
    if (_6359)
    {
        float _6489 = _6471 * _6471;
        _6487 = _6489;
    }
    float _6491 = _6487;
    float _6493 = fma(_6475, _6475, _6483);
    float _6495 = _6265 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6497 = floor(_6435);
    float _6499 = _6493 + _6491;
    float _6501 = fma(_6267, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6495);
    float _6503 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6505 = fma(_6343, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6503);
    float _6507 = precise::clamp(_6505, 0.0, 1.0);
    float _6509 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6501);
    float _6511 = -_6507;
    float _6513 = _6511 + 1.0;
    float _6515 = rsqrt(_6499);
    float _6517 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6519 = _6509 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6521 = _6265 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6523 = fma(_5675, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6525 = _6519 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6527 = abs(_6513);
    float _6529 = log2(_6527);
    float _6531 = _6265 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6533 = -_6525;
    float _6535 = fma(_6533, _6517, 1.0);
    float _6537 = _6265 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6539 = -_6497;
    float _6541 = _6435 + _6539;
    float _6543 = fma(_6267, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6531);
    float _6545 = _6515 * _6467;
    float _6547 = _6515 * _6475;
    float _6549 = _6515 * _6471;
    float _6551 = fma(_6267, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6537);
    float _6553 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6543);
    float _6555 = fma(_6267, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6521);
    float _6557 = _6545 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6559 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6551);
    float _6561 = _6553 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6563 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6555);
    float _6565 = -_6557;
    float _6567 = fma(_6547, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6565);
    float _6569 = _6559 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6571 = _6561 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6573 = _6563 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6575 = -_6549;
    float _6577 = fma(_6575, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6567);
    float _6579 = _6529 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6581 = fma(_6569, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6571);
    float _6583 = floor(_6523);
    float _6585 = fma(_6577, -0.5, 0.5);
    float _6587 = _6561 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6589 = fma(_6519, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6581);
    float _6591 = fma(_6577, 0.5, 0.5);
    float _6593 = fma(_6569, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6587);
    float _6595 = fma(_6573, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6589);
    float _6597 = exp2(_6579);
    float _6599 = _6561 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6601 = fma(_6519, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6593);
    float _6603 = fma(_6591, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6605 = fma(_6569, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6599);
    float _6607 = fma(_6591, _6603, -0.212114393711090087890625);
    float _6609 = log2(_6535);
    float _6611 = fma(_6519, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6605);
    float _6613 = _6547 + 1.0;
    float _6615 = -_6583;
    float _6617 = _6523 + _6615;
    float _6619 = fma(_6591, _6607, 1.570728778839111328125);
    float _6621 = fma(_6573, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6611);
    float _6623 = fma(_6573, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6601);
    float _6625 = 1.0 / _6595;
    float _6627 = -_6547;
    float _6629 = fma(_6597, _6613, _6627);
    float _6631 = sqrt(_6585);
    float _6633 = _6609 * 0.693147182464599609375;
    float2 _16998 = float2(_6541, _6617);
    float _6635 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16998, float2(0.0), isnan(_16998)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16998, float2(0.0), isnan(_16998)), level(0.0)).x;
    float _6637 = fma(_6629, 0.5, 0.5);
    float _6639 = _6633 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6641 = _6621 * _6625;
    float _6643 = _6623 * _6625;
    float _6645 = fma(_6641, 0.5, 0.5);
    float _6647 = fma(_6643, -0.5, 0.5);
    float _6649 = _6631 * 0.636619746685028076171875;
    float3 _17028 = float3(_6645, _6647, _6639);
    float _6651 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_17028, float3(0.0), isnan(_17028)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_17028, float3(0.0), isnan(_17028)), level(0.0)).x;
    float3 _17039 = float3(_6645, _6647, _6639);
    float4 _6654 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_17039, float3(0.0), isnan(_17039)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_17039, float3(0.0), isnan(_17039)), level(0.0)).xyzw;
    float _6656 = _6654.x;
    float _6658 = _6654.y;
    float _6660 = _6654.z;
    float _6662 = _6654.w;
    float _6664 = -_6619;
    float _6666 = fma(_6649, _6664, 1.0);
    float2 _17060 = float2(_6666, _6637);
    float3 _6670 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_17060, float2(0.0), isnan(_17060)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_17060, float2(0.0), isnan(_17060)), level(0.0)).xyz;
    float _6672 = _6670.x;
    float _6674 = _6670.y;
    float _6676 = _6670.z;
    float _6678 = abs(_6217);
    float _6680 = log2(_6678);
    float _6682 = in.m_91.x;
    float _6684 = in.m_91.y;
    float _6686 = in.m_91.z;
    bool _6688 = _5805 != 0.0;
    bool _6690 = isnan(_5805);
    bool _6692 = _6688 || _6690;
    bool _6694 = isnan(0.0);
    bool _6696 = _6692 || _6694;
    float _6698 = _6529 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6700 = in.m_93.x;
    float _6702 = in.m_93.y;
    float _6704 = in.m_93.z;
    float _6706 = in.m_93.w;
    bool _6708 = _5803 == 0.0;
    bool _6710 = !_6696;
    bool _6712 = _6708 && _6710;
    float _6714 = exp2(_6698);
    bool _6716 = _5807 == 0.0;
    bool _6718 = _6716 && _6712;
    out.m_95.x = _5663;
    out.m_95.y = _5655;
    out.m_95.z = _5675;
    bool _6720 = _6217 <= 8000.0;
    bool _6722 = isnan(_6217);
    bool _6724 = _6720 || _6722;
    bool _6726 = isnan(8000.0);
    bool _6728 = _6724 || _6726;
    float _6730 = float(_6728);
    float _6732 = _6680 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6734 = exp2(_6732);
    float _6736 = _6645;
    float _6738 = _6647;
    float _6740 = _6682;
    float _6742 = _6595;
    float _6744 = _6623;
    if (_6718)
    {
        _4117 = _6682;
    }
    float _6746 = _4117;
    float _6748 = -_6714;
    float _6750 = _6748 + 1.0;
    float _6752 = _6746;
    if (_6718)
    {
        _5651 = _6684;
    }
    float _6754 = _5651;
    float _6756 = _6754;
    if (_6718)
    {
        _4301 = _6686;
    }
    float _6758 = _4301;
    float _6760 = _6750 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6762 = _6758;
    if (_6718)
    {
        _6736 = _6746;
    }
    float _6764 = _6736;
    float _6766 = _6764;
    if (!_6718)
    {
        _6752 = _6682;
    }
    float _6768 = _6752;
    if (_6718)
    {
        _6738 = _6754;
    }
    float _6770 = _6738;
    float _6772 = _6770;
    if (_6718)
    {
        _6740 = _6758;
    }
    float _6774 = _6740;
    float _6776 = fma(_6734, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6778 = precise::clamp(_6776, 0.0, 1.0);
    float _6780 = _6774;
    if (!_6718)
    {
        _6756 = _6684;
    }
    float _6782 = _6756;
    if (!_6718)
    {
        float _6784 = fma(_5803, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6768);
        _6766 = _6784;
    }
    float _6786 = _6766;
    if (!_6718)
    {
        _6762 = _6686;
    }
    float _6788 = _6762;
    if (!_6718)
    {
        float _6790 = fma(_5805, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6782);
        _6772 = _6790;
    }
    float _6792 = _6772;
    float _6794 = _6704 * _6768;
    float _6796 = _6702 * _6788;
    float _6798 = _6700 * _6782;
    if (!_6718)
    {
        float _6800 = fma(_5807, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6788);
        _6780 = _6800;
    }
    float _6802 = _6780;
    float _6804 = -_6794;
    float _6806 = fma(_6700, _6788, _6804);
    float _6808 = -_6796;
    float _6810 = fma(_6704, _6782, _6808);
    float _6812 = fma(_6778, -2.0, 3.0);
    float _6814 = -_6798;
    float _6816 = fma(_6702, _6768, _6814);
    float _6818 = _6778 * _6778;
    float _6820 = _6806 * _6706;
    float _6822 = _6810 * _6706;
    float _6824 = _6816 * _6706;
    float _6826 = _6818 * _6812;
    float _6828 = _5875 * _5993;
    float _6830 = _5885 * _5949;
    float _6832 = _5885 * _5993;
    float _6834 = _5885 * _5943;
    float _6836 = _5875 * _5949;
    float _6838 = _5901 * _5949;
    float _6840 = _5901 * _5993;
    float _6842 = _5875 * _5943;
    float _6844 = _5901 * _5943;
    float _6846 = fma(_5909, _5927, _6828);
    float _6848 = -_5827;
    float _6850 = fma(_6848, _5925, _6830);
    float _6852 = -_5827;
    float _6854 = fma(_6852, _5927, _6832);
    float _6856 = -_5827;
    float _6858 = fma(_6856, _5929, _6834);
    float _6860 = -_6826;
    float _6862 = _6860 + 1.0;
    float _6864 = fma(_5909, _5925, _6836);
    float _6866 = fma(_5909, _5929, _6842);
    float _6868 = fma(_5921, _5927, _6840);
    float _6870 = fma(_6862, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6826);
    float _6872 = fma(_5921, _5925, _6838);
    float _6874 = fma(_5911, _5833, _6850);
    float _6876 = fma(_5911, _5837, _6854);
    float _6878 = fma(_5911, _5835, _6858);
    float _6880 = fma(_5921, _5929, _6844);
    float _6882 = fma(_5895, _5833, _6864);
    float _6884 = fma(_5895, _5837, _6846);
    float _6886 = fma(_5895, _5835, _6866);
    float _6888 = fma(_5877, _5837, _6868);
    float _6890 = fma(_5877, _5833, _6872);
    float _6892 = _6874 * _6702;
    float _6894 = _6876 * _6702;
    float _6896 = _6878 * _6702;
    float _6898 = fma(_5877, _5835, _6880);
    float _6900 = _6561 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6902 = _6820 * _6874;
    float _6904 = _6820 * _6876;
    float _6906 = _6730 * _6870;
    float _6908 = _6820 * _6878;
    float _6910 = _6874 * _6792;
    float _6912 = _6876 * _6792;
    float _6914 = fma(_6569, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6900);
    float _6916 = _6878 * _6792;
    float _6918 = fma(_6884, _6700, _6894);
    float _6920 = fma(_6822, _6882, _6902);
    float _6922 = fma(_6822, _6884, _6904);
    float _6924 = fma(_6822, _6886, _6908);
    float _6926 = fma(_6882, _6700, _6892);
    float _6928 = fma(_6882, _6786, _6910);
    float _6930 = fma(_6884, _6786, _6912);
    float _6932 = fma(_6519, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6914);
    float _6934 = fma(_6886, _6786, _6916);
    float _6936 = fma(_6888, _6704, _6918);
    float _6938 = fma(_6824, _6890, _6920);
    float _6940 = fma(_6824, _6888, _6922);
    float _6942 = fma(_6824, _6898, _6924);
    float _6944 = fma(_6573, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6932);
    float _6946 = in.m_97.x;
    float _6948 = fma(_6886, _6700, _6896);
    float _6950 = fma(_6890, _6704, _6926);
    float _6952 = _6944 + _6595;
    float _6954 = _6906 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6956 = fma(_6898, _6704, _6948);
    float _6958 = _6952 * 0.5;
    float _6960 = fma(_6888, _6802, _6930);
    out.gl_Position.x = _6621;
    out.gl_Position.y = _6623;
    out.gl_Position.z = _6944;
    out.gl_Position.w = _6595;
    float _6962 = fma(_6890, _6802, _6928);
    float _6964 = fma(_6898, _6802, _6934);
    out.m_99.x = _6950;
    out.m_99.y = _6936;
    out.m_99.z = _6956;
    bool _6966 = _6343 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6968 = isnan(_6343);
    bool _6970 = _6966 || _6968;
    bool _6972 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6974 = _6970 || _6972;
    float _6976 = _6321 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_101.x = _6938;
    out.m_101.y = _6940;
    out.m_101.z = _6942;
    out.m_103.z = _6958;
    out.m_103.w = _6595;
    out.m_105.x = _6962;
    out.m_105.y = _6960;
    out.m_105.z = _6964;
    float _6978 = _6802;
    float _6980 = _6944;
    float _6982 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_6974)
    {
        _6978 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6984 = _6978;
    float _6986 = _6984;
    float _6988 = _6984;
    if (!_6974)
    {
        _6742 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6990 = _6742;
    float _6992 = _6990;
    float _6994 = _6990;
    if (!_6974)
    {
        _6980 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6996 = _6980;
    float _6998 = _6996;
    float _7000 = _6996;
    if (!_6974)
    {
        _6744 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _7002 = _6744;
    float _7004 = -_6635;
    float _7006 = _7004 + 1.0;
    float _7008 = _7006 * _6954;
    float _7010 = precise::clamp(_7008, 0.0, 1.0);
    float _7012 = -_7010;
    float _7014 = fma(_7012, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _7016 = _7002;
    float _7018 = _7002;
    if (!_6974)
    {
        _6982 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _7020 = _6982;
    float _7022 = _7014 * _6946;
    float _7024 = _6760 * _6651;
    float _7026 = -_6760;
    float _7028 = _7026 + 1.0;
    float _7030 = _7022 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _7032 = _6662 * _7024;
    float _7034 = _6662 * _7028;
    out.m_107.x = _7030;
    float _7036 = _6676 * _7024;
    float _7038 = fma(_6672, _7032, _6656);
    float _7040 = fma(_6674, _7032, _6658);
    float _7042 = _7024;
    float _7044 = _7020;
    float _7046 = _7020;
    if (!_6974)
    {
        _7042 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _7048 = _7042;
    float _7050 = fma(_6662, _7036, _6660);
    out.m_109.x = _7038;
    out.m_109.y = _7040;
    out.m_109.z = _7050;
    out.m_109.w = _7034;
    bool _7052 = !_6974;
    float _7054 = _7048;
    float _7056 = _7048;
    if (!_7052)
    {
        bool _7058 = _6343 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _7060 = isnan(_6343);
        bool _7062 = _7058 || _7060;
        bool _7064 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _7066 = _7062 || _7064;
        if (!_7066)
        {
            float _7068 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7070 = _6343 + _7068;
            float _7072 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7074 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _7072;
            float _7076 = 1.0 / _7074;
            float _7078 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _7080 = _7078 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _7082 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _7084 = _7082 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _7086 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _7088 = _7086 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _7090 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _7092 = _7090 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _7094 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _7096 = _7094 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _7098 = _7070 * _7076;
            float _7100 = precise::clamp(_7098, 0.0, 1.0);
            float _7102 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _7104 = _7102 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _7106 = fma(_7100, _7084, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _7108 = fma(_7100, _7104, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _7110 = fma(_7100, _7080, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _7112 = fma(_7100, _7088, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _7114 = fma(_7100, _7092, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _7116 = fma(_7100, _7096, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _7018 = _7110;
            _6988 = _7114;
            _7000 = _7108;
            _7046 = _7112;
            _7056 = _7106;
            _6994 = _7116;
            _7118 = true;
        }
        else
        {
            bool _7120 = _6343 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _7122 = isnan(_6343);
            bool _7124 = _7120 || _7122;
            bool _7126 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _7128 = _7124 || _7126;
            if (!_7128)
            {
                _7044 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _7130 = _7044;
            _7046 = _7130;
            if (!_7128)
            {
                _6986 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _7132 = _6986;
            _6988 = _7132;
            if (!_7128)
            {
                _6992 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _7134 = _6992;
            _6994 = _7134;
            if (!_7128)
            {
                _6998 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _7136 = _6998;
            _7000 = _7136;
            if (!_7128)
            {
                _7016 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _7138 = _7016;
            _7018 = _7138;
            if (!_7128)
            {
                _7054 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _7140 = _7054;
            bool _7142 = !_7128;
            _7056 = _7140;
            if (!_7142)
            {
                bool _7144 = _6343 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _7146 = isnan(_6343);
                bool _7148 = _7144 || _7146;
                bool _7150 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _7152 = _7148 || _7150;
                if (!_7152)
                {
                    float _7154 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7156 = _6343 + _7154;
                    float _7158 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7160 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _7158;
                    float _7162 = 1.0 / _7160;
                    float _7164 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _7166 = _7164 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _7168 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _7170 = _7168 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _7172 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _7174 = _7172 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _7176 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _7178 = _7176 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _7180 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _7182 = _7180 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _7184 = _7156 * _7162;
                    float _7186 = precise::clamp(_7184, 0.0, 1.0);
                    float _7188 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _7190 = _7188 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _7192 = fma(_7186, _7170, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _7194 = fma(_7186, _7190, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _7196 = fma(_7186, _7166, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _7198 = fma(_7186, _7174, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _7200 = fma(_7186, _7178, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _7202 = fma(_7186, _7182, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _7018 = _7196;
                    _6988 = _7200;
                    _7000 = _7194;
                    _7046 = _7198;
                    _7056 = _7192;
                    _6994 = _7202;
                    _7118 = true;
                }
                else
                {
                    _7018 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6988 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _7000 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _7046 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _7056 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6994 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _7118 = false;
    float _7204 = _7018;
    float _7206 = _6988;
    float _7208 = _7000;
    float _7210 = _7046;
    float _7212 = _7056;
    float _7214 = _6994;
    float _7216 = fma(_6960, -0.5, 0.5);
    float _7218 = precise::clamp(_7216, 0.0, 1.0);
    float _7220 = -_7204;
    float _7222 = _7206 + _7220;
    float _7224 = _6976 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _7226 = -_7208;
    float _7228 = _7210 + _7226;
    float _7230 = fma(_7218, _7222, _7204);
    out.m_111.x = 0.0;
    float _7232 = -_7212;
    float _7234 = _7214 + _7232;
    float _7236 = fma(_7218, _7228, _7208);
    float _7238 = _7230 * 0.586610972881317138671875;
    out.m_49.x = _7224;
    bool _7240 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _7242 = fma(_7218, _7234, _7212);
    float _7244 = fma(_7236, 0.298911988735198974609375, _7238);
    bool _7246 = _6321 > 0.0;
    bool _7248 = isnan(_6321);
    bool _7250 = _7246 || _7248;
    bool _7252 = isnan(0.0);
    bool _7254 = _7250 || _7252;
    float _7256 = fma(_7242, 0.114477999508380889892578125, _7244);
    float _7258 = -_7256;
    float _7260 = _7236 + _7258;
    float _7262 = -_7256;
    float _7264 = _7230 + _7262;
    float _7266 = -_7256;
    float _7268 = _7242 + _7266;
    float _7270 = fma(_7260, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7256);
    float _7272 = fma(_7264, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7256);
    float _7274 = fma(_7268, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7256);
    bool _7276 = !_7240;
    if (!_7276)
    {
        float _7278 = -_6265;
        float _7280 = _7278 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _7282 = -_6267;
        float _7284 = _7282 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _7286 = -_6269;
        float _7288 = _7286 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _7290 = _7280 * _7280;
        float _7292 = fma(_7284, _7284, _7290);
        float _7294 = fma(_7288, _7288, _7292);
        float _7296 = sqrt(_7294);
        float _7298 = rsqrt(_7294);
        float _7300 = -_7296;
        float _7302 = _7300 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _7304 = _7302 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _7306 = precise::clamp(_7304, 0.0, 1.0);
        float _7308 = _7284 * _7298;
        float _7310 = _7280 * _7298;
        float _7312 = abs(_7306);
        float _7314 = log2(_7312);
        float _7316 = _7288 * _7298;
        float _7318 = _7308 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _7320 = _6960 * _7310;
        float _7322 = -_7310;
        float _7324 = -_7318;
        float _7326 = fma(_7322, (*spvDescriptorSet0.vp_c15)._m0[656].y, _7324);
        float _7328 = fma(_6962, _7308, _7320);
        float _7330 = -_7316;
        float _7332 = fma(_7330, (*spvDescriptorSet0.vp_c15)._m0[656].z, _7326);
        float _7334 = fma(_6964, _7316, _7328);
        float _7336 = precise::clamp(_7334, 0.0, 1.0);
        float _7338 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _7340 = _7332 + _7338;
        float _7342 = _7314 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _7344 = _7340 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _7346 = precise::clamp(_7344, 0.0, 1.0);
        float _7348 = exp2(_7342);
        float _7350 = _7348 * _7346;
        float _7352 = _7336 * _7350;
        float _7354 = _7352 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _7356 = _7352 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _7358 = _7352 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _7354;
        out.m_111.y = _7356;
        out.m_111.z = _7358;
    }
    out.m_113.x = _7270;
    out.m_113.y = _7272;
    out.m_113.z = _7274;
    if (_7254)
    {
        return out;
    }
    float _7360 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _7360;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _7118 = false;
    bool _1806 = false;
    bool _1482 = false;
    bool _1164 = false;
    bool _846 = false;
    bool _704 = false;
    bool _590 = false;
    bool _474 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_46.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (!_136)
    {
        out.m_49.x = 0.0;
    }
    int _142 = 0;
    if (!_136)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7416 = as_type<float>(_146);
        out.gl_Position.z = _7416;
    }
    if (!_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_51.w;
    bool _152 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_150;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _166 = 0.0;
    float _168 = _164;
    if (_160)
    {
        float _170 = float(_132);
        _166 = _170;
    }
    float _172 = _166;
    bool _174 = _164 >= _172;
    bool _176 = !_160;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_49.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _148 = as_type<int>(_184);
    }
    int _186 = _148;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7486 = as_type<float>(_186);
        out.gl_Position.z = _7486;
    }
    if (_178)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _188 = in.m_53.x;
    float _190 = in.m_53.y;
    float _192 = in.m_53.z;
    bool _194 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _196 = in.m_55.x;
    float _198 = in.m_55.y;
    float _200 = in.m_55.z;
    float _202 = in.m_57.x;
    float _204 = in.m_57.y;
    float _206 = in.m_57.z;
    float _208 = in.m_59.x;
    float _210 = in.m_59.y;
    float _212 = in.m_59.z;
    float _214 = _190 * _198;
    float _216 = _190 * _204;
    float _218 = fma(_188, _196, _214);
    float _220 = _190 * _210;
    float _222 = fma(_188, _202, _216);
    float _224 = fma(_192, _200, _218);
    float _226 = fma(_188, _208, _220);
    float _228 = fma(_192, _206, _222);
    float _230 = fma(_192, _212, _226);
    bool _232 = !_194;
    float _250;
    if (!_232)
    {
        float _234 = in.m_61.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_132);
        float _256 = 1.0 / _254;
        float _258 = _164 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _260 + _266;
    bool _270 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _272 = isnan(_260);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = _260 + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _292 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _290;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _298 = 1.0 / _284;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _302 = 1.0 / _296;
    float _304 = 1.0 / _292;
    float _306 = _264 * _298;
    bool _308 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_260);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -_280;
    float _322 = _320 + 1.0;
    float _324 = _318 * _322;
    float _326 = _268 * _302;
    bool _328 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _330 = isnan(_260);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _340;
    bool _344 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _346 = isnan(_260);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _360 = -_318;
    float _362 = _360 + 1.0;
    float _364 = -_338;
    float _366 = _364 + 1.0;
    float _368 = _288 * _304;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _374;
    float _378 = _354 * _366;
    float _380 = fma(_342, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _382 = fma(_372, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _384 = fma(_376, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _386 = _338 * _362;
    float _388 = -_354;
    float _390 = _388 + 1.0;
    float _392 = _382 * _378;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _402 = _384 * _378;
    float _404 = _380 * _378;
    float _406 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].x, _392);
    float _408 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _410 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].z, _404);
    float _412 = fma(_358, _326, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _414 = fma(_396, _326, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _416 = fma(_400, _326, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _426;
    float _430 = fma(_412, _386, _406);
    float _432 = fma(_420, _306, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _434 = fma(_424, _306, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _436 = fma(_428, _306, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _438 = fma(_414, _386, _408);
    float _440 = fma(_416, _386, _410);
    float _442 = fma(_432, _324, _430);
    float _444 = fma(_434, _324, _438);
    float _446 = fma(_436, _324, _440);
    float _448 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[146].x, _442);
    float _450 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[146].y, _444);
    float _452 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[146].z, _446);
    bool _454 = !_300;
    float _472;
    if (!_454)
    {
        float _456 = in.m_61.x;
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _460 = _456 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _464 = _462 * _458;
        float _466 = floor(_464);
        float _468 = -_466;
        float _470 = _464 + _468;
        _472 = _470;
        _474 = true;
    }
    else
    {
        float _476 = float(_132);
        float _478 = 1.0 / _476;
        float _480 = _164 * _478;
        _472 = _480;
    }
    _474 = false;
    float _482 = _472;
    float _484 = in.m_63.x;
    float _486 = in.m_63.y;
    float _488 = in.m_63.z;
    bool _490 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _492 = isnan(_482);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _506 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _508 = isnan(_482);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _524 = _482 + _522;
    float _526 = -_500;
    float _528 = _526 + 1.0;
    bool _530 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _532 = 1.0 / _504;
    float _534 = _516 * _528;
    float _536 = -_516;
    float _538 = _536 + 1.0;
    float _540 = _520 * _532;
    float _542 = fma(_540, _524, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _546 = _542 * _534;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _550 = _544 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _552 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[115].x, _546);
    float _554 = _448 * _484;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _558 = _548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _560 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[116].x, _552);
    float _562 = _450 * _486;
    float _564 = _556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = _452 * _488;
    float _568 = _560 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_65.x = _564;
    out.m_65.y = _558;
    out.m_65.z = _550;
    out.m_65.w = _568;
    bool _570 = !_530;
    float _588;
    if (!_570)
    {
        float _572 = in.m_61.x;
        float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _576 = _572 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[11].z, _164);
        float _580 = _578 * _574;
        float _582 = floor(_580);
        float _584 = -_582;
        float _586 = _580 + _584;
        _588 = _586;
        _590 = true;
    }
    else
    {
        float _592 = float(_132);
        float _594 = 1.0 / _592;
        float _596 = _164 * _594;
        _588 = _596;
    }
    _590 = false;
    float _598 = _588;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _602 = _598 + _600;
    bool _604 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _606 = isnan(_598);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _616;
    bool _620 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _622 = isnan(_598);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -_614;
    float _634 = _632 + 1.0;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _636;
    float _640 = 1.0 / _618;
    bool _642 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _644 = _630 * _634;
    float _646 = -_630;
    float _648 = _646 + 1.0;
    float _650 = _602 * _640;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _652;
    float _656 = fma(_638, _650, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _658;
    float _662 = fma(_654, _650, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _664 = _656 * _644;
    float _666 = fma(_660, _650, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _668 = _662 * _644;
    float _670 = _666 * _644;
    float _672 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[123].x, _664);
    float _674 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[123].y, _670);
    float _676 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[123].z, _668);
    float _678 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[124].x, _672);
    float _680 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[124].y, _674);
    float _682 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[124].z, _676);
    bool _684 = !_642;
    float _702;
    if (!_684)
    {
        float _686 = in.m_61.x;
        float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _690 = _686 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[11].w, _164);
        float _694 = _692 * _688;
        float _696 = floor(_694);
        float _698 = -_696;
        float _700 = _694 + _698;
        _702 = _700;
        _704 = true;
    }
    else
    {
        float _706 = float(_132);
        float _708 = 1.0 / _706;
        float _710 = _164 * _708;
        _702 = _710;
    }
    _704 = false;
    float _712 = _702;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _716 = _712 + _714;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _722 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _724 = isnan(_712);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _738 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _740 = isnan(_712);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _750;
    bool _754 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _756 = isnan(_712);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = 1.0 / _720;
    float _768 = -_732;
    float _770 = _768 + 1.0;
    bool _772 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _774 = _748 * _770;
    float _776 = -_748;
    float _778 = _776 + 1.0;
    float _780 = 1.0 / _736;
    float _782 = _752 * _766;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _788 = fma(_782, _716, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _790 = _786 * _780;
    float _792 = _788 * _774;
    float _794 = -_764;
    float _796 = _794 + 1.0;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _800 = _712 + _798;
    float _802 = _678 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _804 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[131].x, _792);
    float _806 = _732 * _796;
    float _808 = fma(_790, _800, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _810 = _682 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _812 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _814 = fma(_808, _806, _804);
    float _816 = _680 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _818 = _810 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _820 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[133].x, _814);
    float _822 = _816 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _824 = _820 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.x = _812;
    out.m_67.y = _822;
    out.m_67.z = _818;
    out.m_67.w = _824;
    bool _826 = !_772;
    float _844;
    if (!_826)
    {
        float _828 = in.m_61.x;
        float _830 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _832 = _828 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _834 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[14].x, _164);
        float _836 = _834 * _830;
        float _838 = floor(_836);
        float _840 = -_838;
        float _842 = _836 + _840;
        _844 = _842;
        _846 = true;
    }
    else
    {
        float _848 = float(_132);
        float _850 = 1.0 / _848;
        float _852 = _164 * _850;
        _844 = _852;
    }
    _846 = false;
    float _854 = _844;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _858 = _854 + _856;
    bool _860 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _862 = isnan(_854);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _876 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _878 = isnan(_854);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _888;
    bool _892 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _894 = isnan(_854);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = -_870;
    float _906 = _904 + 1.0;
    float _908 = 1.0 / _874;
    float _910 = _886 * _906;
    float _912 = -_902;
    float _914 = _912 + 1.0;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _920 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _922 = 1.0 / _918;
    float _924 = _890 * _908;
    float _926 = -_886;
    float _928 = _926 + 1.0;
    bool _930 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _932 = isnan(_854);
    bool _934 = _930 || _932;
    bool _936 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = fma(_924, _858, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _944 = _902 * _928;
    bool _946 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _948 = isnan(_854);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = _940 * _914;
    float _960 = -_940;
    float _962 = _960 + 1.0;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _966 = _964 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _968 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _970 = isnan(_854);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    float _980 = _956 * _962;
    float _982 = -_956;
    float _984 = _982 + 1.0;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _990 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _992 = isnan(_854);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _998 = _994 || _996;
    float _1000 = float(_998);
    float _1002 = 1.0 / _966;
    float _1004 = _978 * _984;
    float _1006 = -_978;
    float _1008 = _1006 + 1.0;
    float _1010 = 1.0 / _988;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1016 = _1000 * _1008;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1022 = _1014 * _922;
    float _1024 = _942 * _1016;
    float _1026 = -_1000;
    float _1028 = _1026 + 1.0;
    float _1030 = 1.0 / _1020;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1038 = _854 + _1036;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1040;
    float _1044 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1024);
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1050 = fma(_1022, _1038, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1052 = _1042 * _1002;
    float _1054 = 1.0 / _1034;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1058 = _854 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1064 = fma(_1050, _1004, _1044);
    float _1066 = fma(_1052, _1058, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1070 = _854 + _1068;
    float _1072 = _1062 * _1010;
    float _1074 = 1.0 / _1048;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1082 = _1080 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1084 = fma(_1066, _980, _1064);
    float _1086 = _1078 * _1030;
    float _1088 = fma(_1072, _1070, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1092 = _854 + _1090;
    float _1094 = _1082 * _1054;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1096;
    bool _1100 = _854 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1102 = isnan(_854);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1114 = _854 + _1112;
    float _1116 = fma(_1086, _1092, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1118 = fma(_1088, _958, _1084);
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1122 = _854 + _1120;
    float _1124 = fma(_1094, _1114, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1126 = _1098 * _1074;
    float _1128 = -_1110;
    float _1130 = _1128 + 1.0;
    float _1132 = fma(_1116, _944, _1118);
    float _1134 = fma(_1126, _1122, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1136 = _870 * _1130;
    float _1138 = fma(_1124, _910, _1132);
    float _1140 = fma(_1134, _1136, _1138);
    float _1142 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1140);
    out.m_69.x = _1142;
    bool _1144 = !_920;
    float _1162;
    if (!_1144)
    {
        float _1146 = in.m_61.x;
        float _1148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1150 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1152 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[14].y, _164);
        float _1154 = _1152 * _1148;
        float _1156 = floor(_1154);
        float _1158 = -_1156;
        float _1160 = _1154 + _1158;
        _1162 = _1160;
        _1164 = true;
    }
    else
    {
        float _1166 = float(_132);
        float _1168 = 1.0 / _1166;
        float _1170 = _164 * _1168;
        _1162 = _1170;
    }
    _1164 = false;
    float _1172 = _1162;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1176 = _1172 + _1174;
    bool _1178 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1180 = isnan(_1172);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1192 = _1190 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1194 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1196 = isnan(_1172);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1206;
    bool _1210 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1212 = isnan(_1172);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    float _1222 = -_1188;
    float _1224 = _1222 + 1.0;
    float _1226 = 1.0 / _1192;
    float _1228 = _1204 * _1224;
    float _1230 = -_1220;
    float _1232 = _1230 + 1.0;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1236 = _1234 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1238 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1240 = 1.0 / _1236;
    float _1242 = _1208 * _1226;
    float _1244 = -_1204;
    float _1246 = _1244 + 1.0;
    bool _1248 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1250 = isnan(_1172);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1256 = _1252 || _1254;
    float _1258 = float(_1256);
    float _1260 = fma(_1242, _1176, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1262 = _1220 * _1246;
    bool _1264 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1266 = isnan(_1172);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = _1258 * _1232;
    float _1278 = -_1258;
    float _1280 = _1278 + 1.0;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1286 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1288 = isnan(_1172);
    bool _1290 = _1286 || _1288;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1294 = _1290 || _1292;
    float _1296 = float(_1294);
    float _1298 = _1274 * _1280;
    float _1300 = -_1274;
    float _1302 = _1300 + 1.0;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1306 = _1304 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1308 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1310 = isnan(_1172);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    float _1320 = 1.0 / _1284;
    float _1322 = _1296 * _1302;
    float _1324 = -_1296;
    float _1326 = _1324 + 1.0;
    float _1328 = 1.0 / _1306;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1332 = _1330 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1334 = _1318 * _1326;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1338 = _1336 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1340 = _1332 * _1240;
    float _1342 = _1260 * _1334;
    float _1344 = -_1318;
    float _1346 = _1344 + 1.0;
    float _1348 = 1.0 / _1338;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1356 = _1172 + _1354;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1358;
    float _1362 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1342);
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1366 = _1364 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1368 = fma(_1340, _1356, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1370 = _1360 * _1320;
    float _1372 = 1.0 / _1352;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1376 = _1172 + _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1380 = _1378 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1382 = fma(_1368, _1322, _1362);
    float _1384 = fma(_1370, _1376, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1388 = _1172 + _1386;
    float _1390 = _1380 * _1328;
    float _1392 = 1.0 / _1366;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1400 = _1398 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1402 = fma(_1384, _1298, _1382);
    float _1404 = _1396 * _1348;
    float _1406 = fma(_1390, _1388, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1410 = _1172 + _1408;
    float _1412 = _1400 * _1372;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1414;
    bool _1418 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1420 = isnan(_1172);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1426 = _1422 || _1424;
    float _1428 = float(_1426);
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1432 = _1172 + _1430;
    float _1434 = fma(_1404, _1410, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1436 = fma(_1406, _1276, _1402);
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1440 = _1172 + _1438;
    float _1442 = fma(_1412, _1432, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1444 = _1416 * _1392;
    float _1446 = -_1428;
    float _1448 = _1446 + 1.0;
    float _1450 = fma(_1434, _1262, _1436);
    float _1452 = fma(_1444, _1440, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1454 = _1188 * _1448;
    float _1456 = fma(_1442, _1228, _1450);
    float _1458 = fma(_1452, _1454, _1456);
    float _1460 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1458);
    out.m_71.x = _1460;
    bool _1462 = !_1238;
    float _1480;
    if (!_1462)
    {
        float _1464 = in.m_61.x;
        float _1466 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1468 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1470 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[14].z, _164);
        float _1472 = _1470 * _1466;
        float _1474 = floor(_1472);
        float _1476 = -_1474;
        float _1478 = _1472 + _1476;
        _1480 = _1478;
        _1482 = true;
    }
    else
    {
        float _1484 = float(_132);
        float _1486 = 1.0 / _1484;
        float _1488 = _164 * _1486;
        _1480 = _1488;
    }
    _1482 = false;
    float _1490 = _1480;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1494 = _1490 + _1492;
    bool _1496 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1498 = isnan(_1490);
    bool _1500 = _1496 || _1498;
    bool _1502 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1504 = _1500 || _1502;
    float _1506 = float(_1504);
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1510 = _1508 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1512 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1514 = isnan(_1490);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1524;
    bool _1528 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1530 = isnan(_1490);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    float _1540 = -_1506;
    float _1542 = _1540 + 1.0;
    float _1544 = 1.0 / _1510;
    float _1546 = _1522 * _1542;
    float _1548 = -_1538;
    float _1550 = _1548 + 1.0;
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1554 = _1552 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1556 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].w;
    float _1558 = 1.0 / _1554;
    float _1560 = _1526 * _1544;
    float _1562 = -_1522;
    float _1564 = _1562 + 1.0;
    bool _1566 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1568 = isnan(_1490);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1574 = _1570 || _1572;
    float _1576 = float(_1574);
    float _1578 = fma(_1560, _1494, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1580 = _1538 * _1564;
    bool _1582 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1584 = isnan(_1490);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = _1576 * _1550;
    float _1596 = -_1576;
    float _1598 = _1596 + 1.0;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1602 = _1600 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1604 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1606 = isnan(_1490);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    float _1616 = _1592 * _1598;
    float _1618 = -_1592;
    float _1620 = _1618 + 1.0;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1624 = _1622 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1626 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1628 = isnan(_1490);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1634 = _1630 || _1632;
    float _1636 = float(_1634);
    float _1638 = 1.0 / _1602;
    float _1640 = _1614 * _1620;
    float _1642 = -_1614;
    float _1644 = _1642 + 1.0;
    float _1646 = 1.0 / _1624;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1650 = _1648 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1652 = _1636 * _1644;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1658 = _1650 * _1558;
    float _1660 = _1578 * _1652;
    float _1662 = -_1636;
    float _1664 = _1662 + 1.0;
    float _1666 = 1.0 / _1656;
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1670 = _1668 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1674 = _1490 + _1672;
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1676;
    float _1680 = fma(_1664, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1660);
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1684 = _1682 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1686 = fma(_1658, _1674, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1688 = _1678 * _1638;
    float _1690 = 1.0 / _1670;
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1694 = _1490 + _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1698 = _1696 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1700 = fma(_1686, _1640, _1680);
    float _1702 = fma(_1688, _1694, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1706 = _1490 + _1704;
    float _1708 = _1698 * _1646;
    float _1710 = 1.0 / _1684;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1712;
    float _1716 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1718 = _1716 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1720 = fma(_1702, _1616, _1700);
    float _1722 = _1714 * _1666;
    float _1724 = fma(_1708, _1706, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1726 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1728 = _1490 + _1726;
    float _1730 = _1718 * _1690;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1732;
    bool _1736 = _1490 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1738 = isnan(_1490);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1744 = _1740 || _1742;
    float _1746 = float(_1744);
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1750 = _1490 + _1748;
    float _1752 = fma(_1722, _1728, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1754 = fma(_1724, _1594, _1720);
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1758 = _1490 + _1756;
    float _1760 = fma(_1730, _1750, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1762 = _1734 * _1710;
    float _1764 = -_1746;
    float _1766 = _1764 + 1.0;
    float _1768 = fma(_1752, _1580, _1754);
    float _1770 = fma(_1762, _1758, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _1772 = _1506 * _1766;
    float _1774 = fma(_1760, _1546, _1768);
    float _1776 = fma(_1770, _1772, _1774);
    float _1778 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[182].x, _1776);
    out.m_73.x = _1778;
    bool _1780 = !_1556;
    float _1782 = _1710;
    float _1784 = _1646;
    int _1786 = as_type<int>(_1690);
    float _1804;
    if (!_1780)
    {
        float _1788 = in.m_61.x;
        float _1790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].w;
        float _1792 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[15].w;
        float _1794 = fma(_1792, (*spvDescriptorSet0.vp_c9)._m0[14].w, _164);
        float _1796 = _1794 * _1790;
        float _1798 = floor(_1796);
        float _1800 = -_1798;
        float _1802 = _1796 + _1800;
        _1804 = _1802;
        _1806 = true;
    }
    else
    {
        float _1808 = float(_132);
        float _1810 = 1.0 / _1808;
        float _1812 = _164 * _1810;
        _1804 = _1812;
    }
    _1806 = false;
    float _1814 = _1804;
    float _1816 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1818 = int(_1816);
    float _1820 = float(_132);
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1824 = _1822 != 0;
    float _1826 = in.m_75.x;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1830 = _1828 != 0;
    float _1832 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1834 = int(_1832);
    int _1836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1838 = _1836 != 0;
    float _1840 = 0.0;
    int _1842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _1844 = _1826;
    if (_1824)
    {
        _1840 = 1.0;
    }
    float _1846 = _1840;
    float _1848 = float(_1818);
    float _1850 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1852 = int(_1850);
    float _1854 = 0.0;
    float _1856 = _1846;
    if (_1824)
    {
        _1854 = 1.0;
    }
    float _1858 = _1854;
    float _1860 = _1746;
    float _1862 = _1858;
    if (_1830)
    {
        float _1864 = in.m_61.z;
        _1860 = _1864;
    }
    float _1866 = _1860;
    float _1868 = 0.0;
    if (_1824)
    {
        _1868 = 1.0;
    }
    float _1870 = _1868;
    int _1872 = 0;
    float _1874 = _1870;
    if (_1824)
    {
        _1872 = 0;
    }
    int _1876 = _1872;
    float _1878 = float(uint(_1834));
    float _1880 = 1.0 / _1848;
    float _1882 = float(_1834);
    float _1884 = _1720;
    int _1886 = _1876;
    if (_1838)
    {
        float _1888 = in.m_61.x;
        _1884 = _1888;
    }
    float _1890 = _1884;
    int _1892 = ~_1834;
    int _1894 = _1892 + 1;
    int _1896 = _1894;
    if (_1824)
    {
        _1842 = 0;
    }
    int _1898 = _1842;
    float _1900 = 1.0 / _1820;
    float _1902 = _1882 * _164;
    float _1904 = float(_1852);
    float _1906 = _1880 * _164;
    float _1908 = 1.0 / _1878;
    bool _1910 = false;
    int _1912 = _1898;
    if (_1830)
    {
        bool _1914 = _1866 > 0.5;
        _1910 = _1914;
    }
    bool _1916 = _1910;
    float _1918 = _1902 * _1900;
    float _1920 = trunc(_1906);
    int _1922 = int(_1920);
    bool _1924 = false;
    float _1926 = _1890;
    if (_1838)
    {
        bool _1928 = _1890 > 0.5;
        _1924 = _1928;
    }
    bool _1930 = _1924;
    if (!_1838)
    {
        _1926 = _1826;
    }
    float _1932 = _1926;
    float _1934 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1936 = int(_1934);
    int _1938 = as_type<int>(_1908) + (-2);
    float _1940 = in.m_61.y;
    float _1942 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1944 = int(_1942);
    float _1946 = float(uint(_1922));
    float _1948 = as_type<float>(_1938) * _1946;
    float _1950 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1952 = int(_1950);
    float _1954 = float(_1936);
    float _1956 = _1946;
    float _1958 = _1932;
    if (_1824)
    {
        float _1960 = in.m_61.x;
        _1956 = _1960;
    }
    float _1962 = _1956;
    float _1964 = 1.0 / _1904;
    float _1966 = float(_1944);
    int _1968 = 0;
    if (_1824)
    {
        _1968 = as_type<int>(_1940);
    }
    int _1970 = _1968;
    float _1972 = trunc(_1948);
    float _1974 = precise::max(_1972, 0.0);
    uint _1977 = uint(_1974);
    float _1979 = float(uint(_1952));
    float _1981 = in.m_61.w;
    float _1983 = 1.0 / _1954;
    float _1985 = _1962;
    int _1987 = _1970;
    if (_1824)
    {
        _1782 = _1962;
    }
    float _1989 = _1782;
    float _1991 = _1989;
    if (_1824)
    {
        _1784 = _1989;
    }
    float _1993 = _1784;
    float _1995 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1997 = int(_1995);
    int _1999 = 0;
    float _2001 = _1993;
    if (_1824)
    {
        _1999 = as_type<int>(_1989);
    }
    int _2003 = _1999;
    float _2005 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2007 = int(_2005);
    float _2009 = _1983 * _164;
    float _2011 = _1983;
    int _2013 = _2003;
    if (_1824)
    {
        float _2015 = in.m_61.z;
        _2011 = _2015;
    }
    float _2017 = _2011;
    float _2019 = 1.0 / _1966;
    float _2021 = float(uint(_1997));
    int _2023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2025 = _2023 != 0;
    float _2027 = 1.0 / _1979;
    float _2029 = float(uint(_2007));
    float _2031 = _2019 * _164;
    float _2033 = _1964 * _164;
    float _2035 = 1.0 / _2021;
    int _2037 = as_type<int>(_2019);
    if (_1838)
    {
        float _2039 = -_1826;
        float _2041 = _2039 + 1.0;
        _2037 = as_type<int>(_2041);
    }
    int _2043 = _2037;
    int _2045 = _2043;
    if (_1830)
    {
        float _2047 = -_1826;
        float _2049 = _2047 + 1.0;
        _1896 = as_type<int>(_2049);
    }
    int _2051 = _1896;
    int _2053 = 0;
    float _2055 = _2017;
    float _2057 = as_type<float>(_2051);
    if (_1824)
    {
        _2053 = as_type<int>(_2017);
    }
    int _2059 = _2053;
    int _2061 = _1894 * int(_1977);
    int _2063 = _2061 + _1922;
    float _2065 = 1.0 / _2029;
    float _2067 = float(uint(_2063));
    float _2069 = as_type<float>(_1938) * _2067;
    float _2071 = _2067;
    int _2073 = _2059;
    if (!_1830)
    {
        _2071 = _1826;
    }
    float _2075 = _2071;
    float _2077 = trunc(_1918);
    int _2079 = int(_2077);
    float _2081 = trunc(_2009);
    int _2083 = int(_2081);
    float _2085 = trunc(_2033);
    int _2087 = int(_2085);
    float _2089 = trunc(_2031);
    int _2091 = int(_2089);
    float _2093 = trunc(_2069);
    float _2095 = precise::max(_2093, 0.0);
    uint _2097 = uint(_2095);
    float _2099 = _2075;
    if (!_1824)
    {
        float _2101 = in.m_61.x;
        float _2103 = _1940 * 3.1415927410125732421875;
        float _2105 = in.m_61.z;
        float _2107 = _2103 * 0.15915493667125701904296875;
        float _2109 = _2107 * 6.283185482025146484375;
        float _2111 = sin(_2109);
        float _2113 = _2101 * 3.1415927410125732421875;
        float _2115 = _2113 * 0.15915493667125701904296875;
        float _2117 = _2105 * 3.1415927410125732421875;
        float _2119 = _2117 * 0.15915493667125701904296875;
        float _2121 = _2115 * 6.283185482025146484375;
        float _2123 = sin(_2121);
        float _2125 = _2119 * 6.283185482025146484375;
        float _2127 = sin(_2125);
        _1985 = _2101;
        _1856 = 7.345489978790283203125;
        _1991 = _1940;
        _1862 = 1.2345600128173828125;
        _1886 = 1;
        _2001 = _2105;
        _1874 = 5.839270114898681640625;
        _2055 = _2105;
        _1912 = 2;
        _2073 = as_type<int>(_2127);
        _1987 = as_type<int>(_2111);
        _2013 = as_type<int>(_2123);
    }
    float _2129 = _1985;
    float _2131 = _1856;
    float _2133 = _1991;
    float _2135 = _1862;
    int _2137 = _1886;
    float _2139 = _2001;
    float _2141 = _1874;
    float _2143 = _2055;
    int _2145 = _1912;
    int _2147 = _2073;
    int _2149 = _1987;
    int _2151 = _2013;
    float _2153 = _2129 * _2131;
    int _2155 = ~_1834;
    int _2157 = _2155 + 1;
    float _2159 = _2133 * _2135;
    int _2161 = int(_1977) + int(_2097);
    float _2163 = floor(_2153);
    float _2165 = float(_1922);
    float _2167 = _1900 * _164;
    if (_1838)
    {
        float _2169 = _1930 ? as_type<float>(_2043) : _1826;
        _1958 = _2169;
    }
    float _2171 = _1958;
    if (_2025)
    {
        float _2173 = -_1826;
        float _2175 = _2173 + 1.0;
        _2045 = as_type<int>(_2175);
    }
    int _2177 = _2045;
    bool _2179 = _1940 > 0.5;
    int _2181 = _2157 * _2161;
    int _2183 = _2181 + _1922;
    int _2185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2187 = _2185 != 0;
    float _2189 = floor(_2159);
    bool _2191 = _2165 >= _1882;
    bool _2193 = isnan(_2165);
    bool _2195 = _2191 || _2193;
    bool _2197 = isnan(_1882);
    bool _2199 = _2195 || _2197;
    float _2201 = float(_2199);
    bool _2203 = _2137 != 1;
    float _2205 = as_type<float>(_2177);
    if (_1830)
    {
        float _2207 = _1916 ? as_type<float>(_2051) : _1826;
        _2099 = _2207;
    }
    float _2209 = _2099;
    float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _2213 = _1814 + _2211;
    if (!_2025)
    {
        _2057 = _1826;
    }
    float _2215 = _2057;
    float _2217 = _2215;
    if (_2025)
    {
        float _2219 = _2179 ? as_type<float>(_2177) : _1826;
        _2217 = _2219;
    }
    float _2221 = _2217;
    float _2223 = trunc(_2201);
    int _2225 = int(_2223);
    int _2227 = as_type<int>(_2035) + (-2);
    float _2229 = -_2163;
    float _2231 = _2153 + _2229;
    float _2233 = float(uint(_2083));
    if (_2187)
    {
        float _2235 = -_1826;
        float _2237 = _2235 + 1.0;
        _1786 = as_type<int>(_2237);
    }
    int _2239 = _1786;
    int _2241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2243 = _2241 != 0;
    float _2245 = _2231 * _1882;
    bool _2247 = uint(_2183) >= uint(_1834);
    float _2249 = as_type<float>(_2227) * _2233;
    int _2251 = as_type<int>(_2027) + (-2);
    float _2253 = -_2189;
    float _2255 = _2159 + _2253;
    bool _2257 = !_2247;
    int _2259 = _2257 ? 0 : (-1);
    float _2261 = trunc(_2245);
    int _2263 = int(_2261);
    if (!_2187)
    {
        _2205 = _1826;
    }
    float _2265 = _2205;
    int _2267 = ~_2161;
    int _2269 = _2267 + _2259;
    int _2271 = _2269 + 1;
    float _2273 = float(uint(_2087));
    int _2275 = 0;
    float _2277 = _2265;
    if (_2243)
    {
        float _2279 = -_1826;
        float _2281 = _2279 + 1.0;
        _2275 = as_type<int>(_2281);
    }
    int _2283 = _2275;
    if (_2187)
    {
        float _2285 = _2179 ? as_type<float>(_2239) : _1826;
        _2277 = _2285;
    }
    float _2287 = _2277;
    float _2289 = trunc(_2249);
    float _2291 = precise::max(_2289, 0.0);
    uint _2293 = uint(_2291);
    int _2295 = _1834 * _2271;
    int _2297 = _2295 + _1922;
    bool _2299 = _1834 == 0;
    float _2301 = as_type<float>(_2251) * _2273;
    int _2303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2305 = _2303 != 0;
    float _2307 = _2139 * _2141;
    if (_2243)
    {
        float _2309 = _2179 ? as_type<float>(_2283) : _1826;
        _1844 = _2309;
    }
    float _2311 = _1844;
    float _2313 = trunc(_2301);
    float _2315 = precise::max(_2313, 0.0);
    uint _2317 = uint(_2315);
    bool _2319 = !_2305;
    int _2321 = _2319 ? 0 : 1;
    int _2323 = ~_2225;
    int _2325 = _2323 + 1;
    int _2327 = _2325 + 1;
    bool _2329 = !_2299;
    int _2331 = _2329 ? _2297 : (-1);
    int _2333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _2335 = _2333 != 0;
    int _2337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _2339 = _2337 != 0;
    int _2341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2343 = _2341 != 0;
    float _2345 = floor(_2307);
    int _2347 = ~_1997;
    int _2349 = _2347 + 1;
    int _2351 = _2331 * _2327;
    int _2353 = abs(_2321);
    float _2355 = _2133 * _2131;
    bool _2357 = !_2339;
    int _2359 = _2357 ? 0 : 1;
    int _2361 = _2349 * int(_2293);
    int _2363 = _2361 + _2083;
    int _2365 = _1834 + (-1);
    int _2367 = _2263 * _2353;
    int _2369 = _2367 + _1922;
    int _2371 = abs(_2359);
    float _2373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _2375 = as_type<int>(_2065) + (-2);
    int _2377 = _2225 * _2365;
    int _2379 = _2377 + _2351;
    float _2381 = float(uint(_2091));
    float _2383 = float(uint(_2363));
    float _2385 = as_type<float>(_2375) * _2381;
    bool _2387 = !_2335;
    int _2389 = _2387 ? 0 : 1;
    float _2391 = as_type<float>(_2227) * _2383;
    int _2393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2395 = _2393 != 0;
    int _2397 = _2379 * _2371;
    int _2399 = abs(_2389);
    float _2401 = trunc(_2391);
    float _2403 = precise::max(_2401, 0.0);
    uint _2405 = uint(_2403);
    bool _2407 = !_2343;
    int _2409 = _2407 ? 0 : 1;
    int _2411 = ~_1952;
    int _2413 = _2411 + 1;
    int _2415 = _2079 * _2399;
    int _2417 = _2415 + _2397;
    int _2419 = abs(_2409);
    float _2421 = -_2345;
    float _2423 = _2307 + _2421;
    bool _2425 = !_2395;
    int _2427 = _2425 ? 0 : 1;
    float _2429 = trunc(_2385);
    float _2431 = precise::max(_2429, 0.0);
    uint _2433 = uint(_2431);
    int _2435 = ~_2007;
    int _2437 = _2435 + 1;
    int _2439 = abs(_2427);
    int _2441 = _2413 * int(_2317);
    int _2443 = _2441 + _2087;
    float _2445 = floor(_2355);
    int _2447 = _2369 * _2419;
    int _2449 = _2447 + _2417;
    int _2451 = int(_2293) + int(_2405);
    float _2453 = float(uint(_2443));
    int _2455 = _2437 * int(_2433);
    int _2457 = _2455 + _2091;
    float _2459 = float(_2083);
    int _2461 = _2263 * _2439;
    int _2463 = _2461 + _2449;
    float _2465 = float(_1997);
    float _2467 = float(uint(_2457));
    float _2469 = float(_2007);
    float _2471 = -_2445;
    float _2473 = _2355 + _2471;
    float _2475 = as_type<float>(_2251) * _2453;
    float _2477 = as_type<float>(_2375) * _2467;
    float _2479 = float(_1952);
    float _2481 = _2465 * _2255;
    float _2483 = trunc(_2475);
    float _2485 = precise::max(_2483, 0.0);
    uint _2487 = uint(_2485);
    float _2489 = float(_2087);
    float _2491 = _2465 * _2167;
    float _2493 = float(_2091);
    float _2495 = _2479 * _2423;
    bool _2497 = _2459 >= _2465;
    bool _2499 = isnan(_2459);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan(_2465);
    bool _2505 = _2501 || _2503;
    float _2507 = float(_2505);
    float _2509 = _2479 * _2167;
    int _2511 = ~_1997;
    int _2513 = _2511 + 1;
    float _2515 = trunc(_2477);
    float _2517 = precise::max(_2515, 0.0);
    uint _2519 = uint(_2517);
    float _2521 = float(uint(_2463));
    float _2523 = _2469 * _2167;
    bool _2525 = _2489 >= _2479;
    bool _2527 = isnan(_2489);
    bool _2529 = _2525 || _2527;
    bool _2531 = isnan(_2479);
    bool _2533 = _2529 || _2531;
    float _2535 = float(_2533);
    int _2537 = _2513 * _2451;
    int _2539 = _2537 + _2083;
    bool _2541 = _2493 >= _2469;
    bool _2543 = isnan(_2493);
    bool _2545 = _2541 || _2543;
    bool _2547 = isnan(_2469);
    bool _2549 = _2545 || _2547;
    float _2551 = float(_2549);
    float _2553 = _2469 * _2473;
    int _2555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2557 = _2555 != 0;
    float _2559 = trunc(_2481);
    int _2561 = int(_2559);
    float _2563 = as_type<float>(_1938) * _2521;
    int _2565 = ~_1952;
    int _2567 = _2565 + 1;
    bool _2569 = !_2557;
    int _2571 = _2569 ? 0 : 1;
    bool _2573 = uint(_2539) >= uint(_1997);
    float _2575 = trunc(_2563);
    float _2577 = precise::max(_2575, 0.0);
    uint _2579 = uint(_2577);
    int _2581 = int(_2317) + int(_2487);
    int _2583 = abs(_2571);
    bool _2585 = !_2573;
    int _2587 = _2585 ? 0 : (-1);
    float _2589 = trunc(_2507);
    int _2591 = int(_2589);
    int _2593 = ~_1834;
    int _2595 = _2593 + 1;
    int _2597 = _2567 * _2581;
    int _2599 = _2597 + _2087;
    int _2601 = ~_2451;
    int _2603 = _2601 + _2587;
    int _2605 = _2603 + 1;
    int _2607 = _2561 * _2583;
    int _2609 = _2607 + _2083;
    int _2611 = int(_2433) + int(_2519);
    bool _2613 = uint(_2599) >= uint(_1952);
    int _2615 = _2595 * int(_2579);
    int _2617 = _2615 + _2463;
    bool _2619 = _1997 == 0;
    int _2621 = _1997 * _2605;
    int _2623 = _2621 + _2083;
    int _2625 = ~_2007;
    int _2627 = _2625 + 1;
    float _2629 = trunc(_2491);
    int _2631 = int(_2629);
    float _2633 = float(uint(_2617));
    int _2635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2637 = _2635 != 0;
    int _2639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2641 = _2639 != 0;
    int _2643 = _2627 * _2611;
    int _2645 = _2643 + _2091;
    int _2647 = ~_2591;
    int _2649 = _2647 + 1;
    int _2651 = _2649 + 1;
    float _2653 = as_type<float>(_1938) * _2633;
    bool _2655 = !_2619;
    int _2657 = _2655 ? _2623 : (-1);
    float _2659 = trunc(_2495);
    int _2661 = int(_2659);
    bool _2663 = !_2641;
    int _2665 = _2663 ? 0 : 1;
    int _2667 = _1997 + (-1);
    int _2669 = _2651 * _2657;
    bool _2671 = !_2637;
    int _2673 = _2671 ? 0 : 1;
    int _2675 = abs(_2665);
    float _2677 = trunc(_2653);
    float _2679 = precise::max(_2677, 0.0);
    uint _2681 = uint(_2679);
    bool _2683 = uint(_2645) >= uint(_2007);
    int _2685 = _2591 * _2667;
    int _2687 = _2685 + _2669;
    int _2689 = abs(_2673);
    bool _2691 = !_2613;
    int _2693 = _2691 ? 0 : (-1);
    float _2695 = trunc(_2535);
    int _2697 = int(_2695);
    int _2699 = _2687 * _2675;
    bool _2701 = !_2683;
    int _2703 = _2701 ? 0 : (-1);
    int _2705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2707 = _2705 != 0;
    int _2709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2711 = _2709 != 0;
    int _2713 = _2631 * _2689;
    int _2715 = _2713 + _2699;
    int _2717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2719 = _2717 != 0;
    float _2721 = trunc(_2551);
    int _2723 = int(_2721);
    int _2725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2727 = _2725 != 0;
    int _2729 = ~_2581;
    int _2731 = _2729 + _2693;
    int _2733 = _2731 + 1;
    bool _2735 = !_2719;
    int _2737 = _2735 ? 0 : 1;
    bool _2739 = !_2727;
    int _2741 = _2739 ? 0 : 1;
    int _2743 = _1952 * _2733;
    int _2745 = _2743 + _2087;
    int _2747 = int(_2579) + int(_2681);
    float _2749 = trunc(_2509);
    int _2751 = int(_2749);
    bool _2753 = !_2707;
    int _2755 = _2753 ? 0 : 1;
    int _2757 = ~_1834;
    int _2759 = _2757 + 1;
    int _2761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2763 = _2761 != 0;
    int _2765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2767 = _2765 != 0;
    float _2769 = trunc(_2523);
    int _2771 = int(_2769);
    int _2773 = abs(_2737);
    int _2775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2777 = _2775 != 0;
    int _2779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2781 = _2779 != 0;
    int _2783 = abs(_2755);
    int _2785 = _2759 * _2747;
    int _2787 = _2785 + _2463;
    int _2789 = ~_2611;
    int _2791 = _2789 + _2703;
    int _2793 = _2791 + 1;
    bool _2795 = !_2763;
    int _2797 = _2795 ? 0 : 1;
    bool _2799 = !_2767;
    int _2801 = _2799 ? 0 : 1;
    int _2803 = _2007 * _2793;
    int _2805 = _2803 + _2091;
    int _2807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2809 = _2807 != 0;
    int _2811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2813 = _2811 != 0;
    bool _2815 = uint(_2787) >= uint(_1834);
    int _2817 = _2661 * _2773;
    int _2819 = _2817 + _2087;
    bool _2821 = !_2711;
    int _2823 = _2821 ? 0 : 1;
    int _2825 = _2609 * _2783;
    int _2827 = _2825 + _2715;
    bool _2829 = !_2815;
    int _2831 = _2829 ? 0 : (-1);
    int _2833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2835 = _2833 != 0;
    int _2837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2839 = _2837 != 0;
    bool _2841 = !_2809;
    int _2843 = _2841 ? 0 : 1;
    int _2845 = abs(_2823);
    bool _2847 = _1952 == 0;
    int _2849 = ~_2697;
    int _2851 = _2849 + 1;
    int _2853 = _2851 + 1;
    int _2855 = _2561 * _2845;
    int _2857 = _2855 + _2827;
    bool _2859 = !_2847;
    int _2861 = _2859 ? _2745 : (-1);
    bool _2863 = !_2781;
    int _2865 = _2863 ? 0 : 1;
    int _2867 = _1952 + (-1);
    int _2869 = _2853 * _2861;
    float _2871 = float(uint(_2857));
    bool _2873 = !_2813;
    int _2875 = _2873 ? 0 : 1;
    int _2877 = _2697 * _2867;
    int _2879 = _2877 + _2869;
    bool _2881 = _2007 == 0;
    float _2883 = as_type<float>(_2227) * _2871;
    bool _2885 = !_2777;
    int _2887 = _2885 ? 0 : 1;
    int _2889 = abs(_2865);
    int _2891 = ~_2723;
    int _2893 = _2891 + 1;
    int _2895 = _2893 + 1;
    float _2897 = trunc(_2883);
    float _2899 = precise::max(_2897, 0.0);
    uint _2901 = uint(_2899);
    bool _2903 = !_2881;
    int _2905 = _2903 ? _2805 : (-1);
    int _2907 = _2879 * _2889;
    int _2909 = abs(_2887);
    int _2911 = abs(_2741);
    int _2913 = _2895 * _2905;
    int _2915 = _2007 + (-1);
    float _2917 = trunc(_2553);
    int _2919 = int(_2917);
    int _2921 = _2751 * _2909;
    int _2923 = _2921 + _2907;
    int _2925 = abs(_2801);
    float _2927 = in.m_75.y;
    int _2929 = _2723 * _2915;
    int _2931 = _2929 + _2913;
    int _2933 = abs(_2875);
    int _2935 = _2819 * _2911;
    int _2937 = _2935 + _2923;
    int _2939 = ~_1997;
    int _2941 = _2939 + 1;
    int _2943 = abs(_2797);
    int _2945 = abs(_2843);
    int _2947 = ~_2747;
    int _2949 = _2947 + _2831;
    int _2951 = _2949 + 1;
    int _2953 = _2661 * _2943;
    int _2955 = _2953 + _2937;
    int _2957 = _1834 * _2951;
    int _2959 = _2957 + _2463;
    int _2961 = _2919 * _2925;
    int _2963 = _2961 + _2091;
    float _2965 = float(uint(_2955));
    int _2967 = _2931 * _2933;
    bool _2969 = !_2835;
    int _2971 = _2969 ? 0 : 1;
    int _2973 = _2941 * int(_2901);
    int _2975 = _2973 + _2857;
    float _2977 = as_type<float>(_2251) * _2965;
    int _2979 = abs(_2971);
    float _2981 = -_2927;
    float _2983 = _2981 + 1.0;
    float _2985 = float(uint(_2975));
    float _2987 = trunc(_2977);
    float _2989 = precise::max(_2987, 0.0);
    uint _2991 = uint(_2989);
    bool _2993 = _1834 == 0;
    int _2995 = _2771 * _2945;
    int _2997 = _2995 + _2967;
    float _2999 = as_type<float>(_2227) * _2985;
    bool _3001 = !_2839;
    int _3003 = _3001 ? 0 : 1;
    bool _3005 = _1981 > 0.5;
    int _3007 = _2963 * _2979;
    int _3009 = _3007 + _2997;
    bool _3011 = !_2993;
    int _3013 = _3011 ? _2959 : (-1);
    float _3015 = trunc(_2999);
    float _3017 = precise::max(_3015, 0.0);
    uint _3019 = uint(_3017);
    int _3021 = abs(_3003);
    int _3023 = _3005 ? as_type<int>(_2983) : as_type<int>(_2927);
    int _3025 = _3013 & 3;
    bool _3027 = _3025 != 0;
    int _3029 = _2919 * _3021;
    int _3031 = _3029 + _3009;
    int _3033 = ~_1952;
    int _3035 = _3033 + 1;
    int _3037 = _3013 & 3;
    bool _3039 = _3037 != 0;
    int _3041 = _3027 ? 0 : 1;
    int _3043 = _3035 * int(_2991);
    int _3045 = _3043 + _2955;
    bool _3047 = uint(_3037) > 1u;
    int _3049 = ~_1997;
    int _3051 = _3049 + 1;
    int _3053 = int(_2901) + int(_3019);
    float _3055 = float(uint(_3031));
    float _3057 = float(uint(_3045));
    int _3059 = ~_3041;
    int _3061 = _3059 + 1;
    int _3063 = _3061 + 1;
    float _3065 = as_type<float>(_2375) * _3055;
    int _3067 = _3051 * _3053;
    int _3069 = _3067 + _2857;
    float _3071 = as_type<float>(_2251) * _3057;
    int _3073 = _3063;
    if (!_3047)
    {
        int _3075 = ~_3041;
        int _3077 = _3075 + 1;
        _3073 = _3077;
    }
    int _3079 = _3073;
    float _3081 = trunc(_3065);
    float _3083 = precise::max(_3081, 0.0);
    uint _3085 = uint(_3083);
    bool _3087 = uint(_3037) >= 2u;
    int _3089 = ~_2007;
    int _3091 = _3089 + 1;
    int _3093 = _3087 ? 0 : 1;
    bool _3095 = uint(_3069) >= uint(_1997);
    float _3097 = trunc(_3071);
    float _3099 = precise::max(_3097, 0.0);
    uint _3101 = uint(_3099);
    int _3103 = ~_1952;
    int _3105 = _3103 + 1;
    bool _3107 = !_3095;
    int _3109 = _3107 ? 0 : (-1);
    bool _3111 = _3037 != 3;
    int _3113 = ~_3053;
    int _3115 = _3113 + _3109;
    int _3117 = _3115 + 1;
    int _3119 = _3091 * int(_3085);
    int _3121 = _3119 + _3031;
    bool _3123 = _1940 > 0.5;
    int _3125 = _1997 * _3117;
    int _3127 = _3125 + _2857;
    float _3129 = float(uint(_3121));
    int _3131 = _3123 ? as_type<int>(_2983) : as_type<int>(_2927);
    int _3133 = int(_2991) + int(_3101);
    float _3135 = as_type<float>(_2375) * _3129;
    int _3137 = ~_3093;
    int _3139 = _3137 + 1;
    int _3141 = _3139 + 1;
    int _3143 = _3141;
    if (_3111)
    {
        int _3145 = ~_3093;
        int _3147 = _3145 + 1;
        _3143 = _3147;
    }
    int _3149 = _3143;
    int _3151 = _3105 * _3133;
    int _3153 = _3151 + _2955;
    int _3155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3157 = _3155 != 0;
    float _3159 = trunc(_3135);
    float _3161 = precise::max(_3159, 0.0);
    uint _3163 = uint(_3161);
    bool _3165 = !_2619;
    int _3167 = _3165 ? _3127 : (-1);
    bool _3169 = !_3157;
    int _3171 = _3169 ? 0 : 1;
    bool _3173 = uint(_3153) >= uint(_1952);
    int _3175 = _3167 & 3;
    bool _3177 = _3175 != 0;
    bool _3179 = !_3173;
    int _3181 = _3179 ? 0 : (-1);
    int _3183 = _3177 ? 0 : 1;
    bool _3185 = uint(_3175) >= 2u;
    bool _3187 = _3175 != 3;
    int _3189 = ~_3133;
    int _3191 = _3189 + _3181;
    int _3193 = _3191 + 1;
    int _3195 = _3185 ? 0 : 1;
    bool _3197 = uint(_3175) > 1u;
    int _3199 = _1952 * _3193;
    int _3201 = _3199 + _2955;
    int _3203 = ~_2007;
    int _3205 = _3203 + 1;
    int _3207 = int(_3085) + int(_3163);
    bool _3209 = !_2847;
    int _3211 = _3209 ? _3201 : (-1);
    int _3213 = ~_3195;
    int _3215 = _3213 + 1;
    int _3217 = _3215 + 1;
    int _3219 = _3217;
    if (_3187)
    {
        int _3221 = ~_3195;
        int _3223 = _3221 + 1;
        _3219 = _3223;
    }
    int _3225 = _3219;
    int _3227 = _3205 * _3207;
    int _3229 = _3227 + _3031;
    int _3231 = _3211 & 3;
    bool _3233 = _3231 != 0;
    int _3235 = ~_3183;
    int _3237 = _3235 + 1;
    int _3239 = _3237 + 1;
    int _3241 = _3239;
    if (!_3197)
    {
        int _3243 = ~_3183;
        int _3245 = _3243 + 1;
        _3241 = _3245;
    }
    int _3247 = _3241;
    bool _3249 = uint(_3231) >= 2u;
    int _3251 = _3233 ? 0 : 1;
    bool _3253 = uint(_3229) >= uint(_2007);
    int _3255 = _3249 ? 0 : 1;
    bool _3257 = _3231 != 3;
    bool _3259 = !_3253;
    int _3261 = _3259 ? 0 : (-1);
    bool _3263 = uint(_3231) > 1u;
    int _3265 = ~_3207;
    int _3267 = _3265 + _3261;
    int _3269 = _3267 + 1;
    int _3271 = ~_3255;
    int _3273 = _3271 + 1;
    int _3275 = _3273 + 1;
    float _3277 = in.m_46.x;
    float _3279 = in.m_46.y;
    float _3281 = in.m_46.z;
    int _3283 = ~_3251;
    int _3285 = _3283 + 1;
    int _3287 = _3285 + 1;
    int _3289 = _2007 * _3269;
    int _3291 = _3289 + _3031;
    int _3293 = _3275;
    int _3295 = _3287;
    if (_3257)
    {
        int _3297 = ~_3255;
        int _3299 = _3297 + 1;
        _3293 = _3299;
    }
    int _3301 = _3293;
    int _3303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3305 = _3303 != 0;
    float _3307 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _3309 = _3307 + (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _3311 = !_2881;
    int _3313 = _3311 ? _3291 : (-1);
    if (!_3263)
    {
        int _3315 = ~_3251;
        int _3317 = _3315 + 1;
        _3295 = _3317;
    }
    int _3319 = _3295;
    bool _3321 = !_3305;
    int _3323 = _3321 ? 0 : 1;
    float _3325 = 1.0 / _3309;
    int _3327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3329 = _3327 != 0;
    int _3331 = _3313 & 3;
    bool _3333 = _3331 != 0;
    bool _3335 = !_3329;
    int _3337 = _3335 ? 0 : 1;
    int _3339 = _3333 ? 0 : 1;
    bool _3341 = uint(_3331) >= 2u;
    float _3343 = _204 * _3279;
    bool _3345 = _3331 != 3;
    int _3347 = _3341 ? 0 : 1;
    float _3349 = fma(_202, _3277, _3343);
    bool _3351 = uint(_3331) > 1u;
    int _3353 = ~_3347;
    int _3355 = _3353 + 1;
    int _3357 = _3355 + 1;
    int _3359 = ~_3339;
    int _3361 = _3359 + 1;
    int _3363 = _3361 + 1;
    int _3365 = _3357;
    int _3367 = _3363;
    float _3369 = _3349;
    if (_3345)
    {
        int _3371 = ~_3347;
        int _3373 = _3371 + 1;
        _3365 = _3373;
    }
    int _3375 = _3365;
    float _3377 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _3379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3381 = _3379 != 0;
    float _3383 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _3385 = _3383 + (*spvDescriptorSet0.vp_c9)._m0[185].w;
    if (!_3351)
    {
        int _3387 = ~_3339;
        int _3389 = _3387 + 1;
        _3367 = _3389;
    }
    int _3391 = _3367;
    float _3393 = _3381 ? as_type<float>(_3131) : _2927;
    int _3395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3397 = _3395 != 0;
    float _3399 = 1.0 / _3385;
    bool _3401 = _2143 > 0.5;
    float _3403 = _3397 ? as_type<float>(_3023) : _2927;
    int _3405 = _3401 ? as_type<int>(_2983) : as_type<int>(_2927);
    float _3407 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _3409 = _3407 + (*spvDescriptorSet0.vp_c9)._m0[186].w;
    int _3411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _3413 = _3411 != 0;
    int _3415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _3417 = _3415 != 0;
    float _3419 = _3413 ? as_type<float>(_3405) : _2927;
    float _3421 = 1.0 / _3409;
    float _3423 = _3417 ? as_type<float>(_3405) : _2927;
    int _3425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3427 = _3425 != 0;
    int _3429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _3431 = _3429 != 0;
    float _3433 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _3435 = _3433 + (*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3437 = _198 * _3279;
    float _3439 = _210 * _3279;
    float _3441 = 1.0 / _3435;
    float _3443 = fma(_196, _3277, _3437);
    float _3445 = fma(_208, _3277, _3439);
    float _3447 = _2129 * 2.0;
    float _3449 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3451 = _3449 + (*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3453 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _3455 = fma(_200, _3281, _3443);
    float _3457 = floor(_3447);
    float _3459 = -(*spvDescriptorSet0.vp_c9)._m0[183].x;
    float _3461 = (*spvDescriptorSet0.vp_c9)._m0[184].x + _3459;
    float _3463 = fma(_3453, -2.0, _3377);
    float _3465 = fma(_206, _3281, _3349);
    float _3467 = fma(_212, _3281, _3445);
    float _3469 = _3461 * _3325;
    float _3471 = -(*spvDescriptorSet0.vp_c9)._m0[184].x;
    float _3473 = _3471 + (*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _3475 = 1.0 / _3451;
    float _3477 = -(*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _3479 = (*spvDescriptorSet0.vp_c9)._m0[186].x + _3477;
    float _3481 = _3473 * _3399;
    float _3483 = _3431 ? as_type<float>(_3405) : _2927;
    float _3485 = _3479 * _3421;
    bool _3487 = !_3427;
    int _3489 = _3487 ? 0 : 1;
    float _3491 = -(*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _3493 = (*spvDescriptorSet0.vp_c9)._m0[188].x + _3491;
    bool _3495 = _3457 > 0.0;
    float _3497 = -(*spvDescriptorSet0.vp_c9)._m0[186].x;
    float _3499 = _3497 + (*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _3501 = in.m_55.w;
    bool _3503 = _3457 >= 0.0;
    bool _3505 = isnan(_3457);
    bool _3507 = _3503 || _3505;
    bool _3509 = isnan(0.0);
    bool _3511 = _3507 || _3509;
    float _3513 = _3499 * _3441;
    float _3515 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3517 = _3515 + (*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3519 = _3493 * _3475;
    int _3521 = _3511 ? 0 : 1;
    float _3523 = in.m_57.w;
    float _3525 = 1.0 / _3517;
    float _3527 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3529 = _3527 + (*spvDescriptorSet0.vp_c9)._m0[190].w;
    float _3531 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _3533 = _1814 + _3531;
    float _3535 = -(*spvDescriptorSet0.vp_c9)._m0[188].x;
    float _3537 = _3535 + (*spvDescriptorSet0.vp_c9)._m0[189].x;
    int _3539 = ~_1834;
    int _3541 = _3539 + 1;
    float _3543 = -(*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _3545 = (*spvDescriptorSet0.vp_c9)._m0[190].x + _3543;
    float _3547 = 1.0 / _3529;
    int _3549 = ~_3521;
    int _3551 = _3549 + 1;
    int _3553 = _3551 + 1;
    float _3555 = fma(_3485, _3533, (*spvDescriptorSet0.vp_c9)._m0[185].x);
    int _3557 = _3553;
    float _3559 = (*spvDescriptorSet0.vp_c9)._m0[186].x;
    if (!_3495)
    {
        int _3561 = ~_3521;
        int _3563 = _3561 + 1;
        _3557 = _3563;
    }
    int _3565 = _3557;
    bool _3567 = _2145 != 2;
    float _3569 = float(uint(_2369));
    float _3571 = float(uint(_2819));
    float _3573 = _3537 * _3525;
    float _3575 = _1940 * 2.0;
    float _3577 = as_type<float>(_1938) * _3569;
    float _3579 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _3581 = _1814 + _3579;
    float _3583 = 0.0;
    if (!_2203)
    {
        _3583 = _1940;
    }
    float _3585 = _3583;
    float _3587 = _3585;
    if (!_2203)
    {
        _3369 = _1940;
    }
    float _3589 = _3369;
    float _3591 = floor(_3575);
    float _3593 = _3545 * _3547;
    bool _3595 = !_2203;
    float _3597 = _3595 ? as_type<float>(_2147) : as_type<float>(_2149);
    float _3599 = fma(_3481, _3581, (*spvDescriptorSet0.vp_c9)._m0[184].x);
    float _3601 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _3603 = _1814 + _3601;
    float _3605 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _3607 = _1814 + _3605;
    float _3609 = 0.0;
    float _3611 = _3589;
    if (!_2203)
    {
        _3609 = _2143;
    }
    float _3613 = _3609;
    float _3615 = fma(_3593, _2213, (*spvDescriptorSet0.vp_c9)._m0[189].x);
    float _3617 = trunc(_3577);
    float _3619 = precise::max(_3617, 0.0);
    uint _3621 = uint(_3619);
    float _3623 = fma(_3469, _3603, (*spvDescriptorSet0.vp_c9)._m0[183].x);
    float _3625 = fma(_3519, _3607, (*spvDescriptorSet0.vp_c9)._m0[187].x);
    float _3627 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _3629 = _1814 + _3627;
    float _3631 = _3613;
    if (!_2203)
    {
        _3559 = _2143;
    }
    float _3633 = _3559;
    float _3635 = _3465 + _3523;
    bool _3637 = !_2203;
    float _3639 = _3637 ? as_type<float>(_2149) : as_type<float>(_2151);
    float _3641 = fma(_3513, _3629, (*spvDescriptorSet0.vp_c9)._m0[186].x);
    float _3643 = _3633;
    if (_2203)
    {
        _3587 = _2129;
    }
    float _3645 = _3587;
    if (_2203)
    {
        _3611 = _2129;
    }
    float _3647 = _3611;
    if (_2203)
    {
        _3631 = _1940;
    }
    float _3649 = _3631;
    float _3651 = _3645 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2203)
    {
        _3643 = _1940;
    }
    float _3653 = _3643;
    int _3655 = _3541 * int(_3621);
    int _3657 = _3655 + _2369;
    bool _3659 = _3591 > 0.0;
    float _3661 = _3649 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _3663 = _3591 >= 0.0;
    bool _3665 = isnan(_3591);
    bool _3667 = _3663 || _3665;
    bool _3669 = isnan(0.0);
    bool _3671 = _3667 || _3669;
    float _3673 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _3675 = _1814 + _3673;
    float _3677 = float(uint(_3657));
    float _3679 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3681 = int(_3679);
    bool _3683 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _3685 = isnan(_1814);
    bool _3687 = _3683 || _3685;
    bool _3689 = isnan((*spvDescriptorSet0.vp_c9)._m0[190].w);
    bool _3691 = _3687 || _3689;
    float _3693 = float(_3691);
    float _3695 = fma(_3573, _3675, (*spvDescriptorSet0.vp_c9)._m0[188].x);
    float _3697 = float(uint(_2609));
    float _3699 = as_type<float>(_1938) * _3677;
    bool _3701 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[189].w;
    bool _3703 = isnan(_1814);
    bool _3705 = _3701 || _3703;
    bool _3707 = isnan((*spvDescriptorSet0.vp_c9)._m0[189].w);
    bool _3709 = _3705 || _3707;
    float _3711 = float(_3709);
    float _3713 = _3455 + _3501;
    float _3715 = -_3693;
    float _3717 = _3715 + 1.0;
    bool _3719 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[188].w;
    bool _3721 = isnan(_1814);
    bool _3723 = _3719 || _3721;
    bool _3725 = isnan((*spvDescriptorSet0.vp_c9)._m0[188].w);
    bool _3727 = _3723 || _3725;
    float _3729 = float(_3727);
    float _3731 = as_type<float>(_2227) * _3697;
    float _3733 = as_type<float>(_2251) * _3571;
    float _3735 = -_3711;
    float _3737 = _3735 + 1.0;
    float _3739 = _3711 * _3717;
    bool _3741 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[187].w;
    bool _3743 = isnan(_1814);
    bool _3745 = _3741 || _3743;
    bool _3747 = isnan((*spvDescriptorSet0.vp_c9)._m0[187].w);
    bool _3749 = _3745 || _3747;
    float _3751 = float(_3749);
    float _3753 = _3729 * _3737;
    float _3755 = -_3729;
    float _3757 = _3755 + 1.0;
    float _3759 = float(uint(_2963));
    float _3761 = trunc(_3733);
    float _3763 = precise::max(_3761, 0.0);
    uint _3765 = uint(_3763);
    bool _3767 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _3769 = isnan(_1814);
    bool _3771 = _3767 || _3769;
    bool _3773 = isnan((*spvDescriptorSet0.vp_c9)._m0[186].w);
    bool _3775 = _3771 || _3773;
    float _3777 = float(_3775);
    float _3779 = _3751 * _3757;
    float _3781 = -_3751;
    float _3783 = _3781 + 1.0;
    bool _3785 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _3787 = isnan(_1814);
    bool _3789 = _3785 || _3787;
    bool _3791 = isnan((*spvDescriptorSet0.vp_c9)._m0[185].w);
    bool _3793 = _3789 || _3791;
    float _3795 = float(_3793);
    float _3797 = in.m_59.w;
    float _3799 = as_type<float>(_2375) * _3759;
    float _3801 = -_3777;
    float _3803 = _3801 + 1.0;
    float _3805 = trunc(_3731);
    float _3807 = precise::max(_3805, 0.0);
    uint _3809 = uint(_3807);
    bool _3811 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _3813 = isnan(_1814);
    bool _3815 = _3811 || _3813;
    bool _3817 = isnan((*spvDescriptorSet0.vp_c9)._m0[184].w);
    bool _3819 = _3815 || _3817;
    float _3821 = float(_3819);
    float _3823 = _3777 * _3783;
    float _3825 = _3795 * _3803;
    int _3827 = ~_1952;
    int _3829 = _3827 + 1;
    float _3831 = -_3795;
    float _3833 = _3831 + 1.0;
    int _3835 = ~_1997;
    int _3837 = _3835 + 1;
    bool _3839 = _1814 >= (*spvDescriptorSet0.vp_c9)._m0[183].w;
    bool _3841 = isnan(_1814);
    bool _3843 = _3839 || _3841;
    bool _3845 = isnan((*spvDescriptorSet0.vp_c9)._m0[183].w);
    bool _3847 = _3843 || _3845;
    float _3849 = float(_3847);
    float _3851 = _3821 * _3833;
    float _3853 = -_3821;
    float _3855 = _3853 + 1.0;
    int _3857 = _3829 * int(_3765);
    int _3859 = _3857 + _2819;
    float _3861 = trunc(_3799);
    float _3863 = precise::max(_3861, 0.0);
    uint _3865 = uint(_3863);
    float _3867 = _3849 * _3855;
    int _3869 = abs(_3149);
    int _3871 = _3837 * int(_3809);
    int _3873 = _3871 + _2609;
    float _3875 = float(uint(_3859));
    float _3877 = _3623 * _3867;
    int _3879 = _3671 ? 0 : 1;
    float _3881 = trunc(_3699);
    float _3883 = precise::max(_3881, 0.0);
    uint _3885 = uint(_3883);
    float _3887 = float(uint(_3873));
    float _3889 = as_type<float>(_2251) * _3875;
    float _3891 = -_3849;
    float _3893 = _3891 + 1.0;
    float _3895 = _3467 + _3797;
    int _3897 = ~_3879;
    int _3899 = _3897 + 1;
    int _3901 = _3899 + 1;
    float _3903 = as_type<float>(_2227) * _3887;
    int _3905 = ~_2007;
    int _3907 = _3905 + 1;
    float _3909 = trunc(_3889);
    float _3911 = precise::max(_3909, 0.0);
    uint _3913 = uint(_3911);
    float _3915 = fma(_3893, (*spvDescriptorSet0.vp_c9)._m0[183].x, _3877);
    int _3917 = _3901;
    float _3919 = _3849;
    if (!_3659)
    {
        int _3921 = ~_3879;
        int _3923 = _3921 + 1;
        _3917 = _3923;
    }
    int _3925 = _3917;
    float _3927 = _2373 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    int _3929 = _3907 * int(_3865);
    int _3931 = _3929 + _2963;
    float _3933 = fma(_3599, _3851, _3915);
    float _3935 = _2143 * 2.0;
    float _3937 = fma(_3927, _2311, -0.5);
    float _3939 = trunc(_3903);
    float _3941 = precise::max(_3939, 0.0);
    uint _3943 = uint(_3941);
    float _3945 = float(uint(_3931));
    float _3947 = fma(_3555, _3825, _3933);
    int _3949 = ~_1834;
    int _3951 = _3949 + 1;
    float _3953 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3955 = as_type<float>(_2375) * _3945;
    int _3957 = int(_3621) + int(_3885);
    float _3959 = fma(_3641, _3823, _3947);
    float _3961 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _3963 = int(_3765) + int(_3913);
    float _3965 = trunc(_3955);
    float _3967 = precise::max(_3965, 0.0);
    uint _3969 = uint(_3967);
    int _3971 = _3951 * _3957;
    int _3973 = _3971 + _2369;
    int _3975 = int(_3809) + int(_3943);
    float _3977 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3979 = _3895 + _3977;
    int _3981 = ~_1997;
    int _3983 = _3981 + 1;
    bool _3985 = uint(_3973) >= uint(_1834);
    float _3987 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3989 = _2129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _3991 = _3983 * _3975;
    int _3993 = _3991 + _2609;
    int _3995 = ~_1952;
    int _3997 = _3995 + 1;
    float _3999 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4001 = _3635 + _3999;
    float _4003 = -_3987;
    float _4005 = fma(_3989, 2.0, _4003);
    bool _4007 = !_3985;
    int _4009 = _4007 ? 0 : (-1);
    int _4011 = int(_3865) + int(_3969);
    float _4013 = _4001 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _4015 = -_164;
    float _4017 = fma(_4015, (*spvDescriptorSet0.vp_c9)._m0[76].x, _4005);
    bool _4019 = uint(_3993) >= uint(_1997);
    int _4021 = _3997 * _3963;
    int _4023 = _4021 + _2819;
    int _4025 = ~_2007;
    int _4027 = _4025 + 1;
    float _4029 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4031 = _3713 + _4029;
    float _4033 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _4035 = !_4019;
    int _4037 = _4035 ? 0 : (-1);
    int _4039 = _4027 * _4011;
    int _4041 = _4039 + _2963;
    bool _4043 = uint(_4023) >= uint(_1952);
    float _4045 = fma(_4031, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4013);
    float _4047 = fma(as_type<float>(_2151), (*spvDescriptorSet0.vp_c9)._m0[93].z, _4033);
    float _4049 = as_type<float>(_2151) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _4051 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _4053 = !_4043;
    int _4055 = _4053 ? 0 : (-1);
    float _4057 = fma(_3979, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4045);
    bool _4059 = uint(_4041) >= uint(_2007);
    float _4061 = -_4051;
    float _4063 = fma(_4049, 2.0, _4061);
    float _4065 = floor(_3935);
    int _4067 = ~_3957;
    int _4069 = _4067 + _4009;
    int _4071 = _4069 + 1;
    float _4073 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].z, _4047);
    int _4075 = ~_3975;
    int _4077 = _4075 + _4037;
    int _4079 = _4077 + 1;
    float _4081 = fma(as_type<float>(_2149), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3961);
    float _4083 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _4085 = as_type<float>(_2149) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _4087 = !_4059;
    int _4089 = _4087 ? 0 : (-1);
    int _4091 = _1834 * _4071;
    int _4093 = _4091 + _2369;
    bool _4095 = _4057 >= 0.0;
    float _4097 = fma(_4085, -2.0, _4083);
    int _4099 = _1997 * _4079;
    int _4101 = _4099 + _2609;
    float _4103 = fma(_3625, _3779, _3959);
    float _4105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    bool _4107 = !_2993;
    int _4109 = _4107 ? _4093 : (-1);
    float _4111 = fma(_3695, _3753, _4103);
    float _4113 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _4115 = _3927;
    float _4117 = _4073;
    if (_3567)
    {
        _3919 = _2129;
    }
    float _4119 = _3919;
    float _4121 = fma(_3615, _3739, _4111);
    float _4123 = _4119;
    if (_3567)
    {
        _4115 = _1940;
    }
    float _4125 = _4115;
    float _4127 = fma(_3647, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4113);
    float _4129 = _4125;
    if (!_3567)
    {
        _4123 = _2143;
    }
    float _4131 = _4123;
    float _4133 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_3567)
    {
        _4129 = _2129;
    }
    float _4135 = _4129;
    bool _4137 = _4065 > 0.0;
    float _4139 = fma(_3653, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4133);
    bool _4141 = _4065 >= 0.0;
    bool _4143 = isnan(_4065);
    bool _4145 = _4141 || _4143;
    bool _4147 = isnan(0.0);
    bool _4149 = _4145 || _4147;
    float _4151 = _4105 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _4153 = _4065;
    if (_4095)
    {
        _4153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _4155 = _4153;
    float _4157 = _1940 + _2129;
    float _4159 = fma(_4151, _3483, -0.5);
    bool _4161 = !_3039;
    int _4163 = _4161 ? 0 : 1;
    int _4165 = as_type<int>(_4155);
    if (_4095)
    {
        float _4167 = _4155 * 5.0;
        _4165 = as_type<int>(_4167);
    }
    int _4169 = _4165;
    int _4171 = _3167 & 3;
    bool _4173 = _4171 != 0;
    float _4175 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4177 = _4157 + (-1.0);
    bool _4179 = !_4173;
    int _4181 = _4179 ? 0 : 1;
    if (_4095)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _13322 = as_type<float>(_4169);
        out.gl_Position.z = _13322;
    }
    int _4183 = _3211 & 3;
    bool _4185 = _4183 != 0;
    float _4187 = fma(_3639, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4175);
    float _4189 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _4191 = _3639 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _4193 = fma(_3693, (*spvDescriptorSet0.vp_c9)._m0[190].x, _4121);
    float _4195 = -_4189;
    float _4197 = fma(_4191, 2.0, _4195);
    float _4199 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _4201 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _4203 = !_4185;
    int _4205 = _4203 ? 0 : 1;
    float _4207 = fma(_3597, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4199);
    int _4209 = _3313 & 3;
    bool _4211 = _4209 != 0;
    float _4213 = _3597 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _4215 = _3013 >> 31;
    float _4217 = fma(_4177, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _4219 = !_4211;
    int _4221 = _4219 ? 0 : 1;
    float _4223 = fma(_4213, -2.0, _4201);
    bool _4225 = _3037 != 3;
    float _4227 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _4229 = _3167 >> 31;
    float _4231 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4207);
    int _4233 = _4215 & 3;
    float _4235 = -_4227;
    float _4237 = fma(_3651, 2.0, _4235);
    int _4239 = _4229 & 3;
    float _4241 = _4131 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _4243 = !_4225;
    int _4245 = _4243 ? 0 : (-1);
    float _4247 = _4135 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _4249 = _3167 + _4239;
    float _4251 = -_164;
    float _4253 = fma(_4251, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4197);
    bool _4255 = _3175 != 3;
    float _4257 = fma(_4247, -2.0, _3953);
    int _4259 = _3013 + _4233;
    float _4261 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].w, _4081);
    int _4263 = _4249 >> 2;
    float _4265 = -_164;
    float _4267 = fma(_4265, (*spvDescriptorSet0.vp_c9)._m0[91].x, _4063);
    int _4269 = _3211 >> 31;
    float _4271 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[91].y, _4097);
    bool _4273 = !_4255;
    int _4275 = _4273 ? 0 : (-1);
    float _4277 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4127);
    bool _4279 = _3231 != 3;
    float _4281 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4139);
    int _4283 = _4259 >> 2;
    float _4285 = -_164;
    float _4287 = fma(_4285, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4237);
    int _4289 = _3313 >> 31;
    float _4291 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4257);
    int _4293 = _4269 & 3;
    out.m_77.x = _4193;
    int _4295 = _4263 << 4;
    int _4297 = _4295 + 512;
    int _4299 = _4289 & 3;
    float _4301 = _4267;
    if (_4095)
    {
        out.m_49.x = 0.0;
    }
    int _4303 = _3211 + _4293;
    uint _4305 = uint(int(uint(_4297) >> uint(2)));
    uint _4307 = uint(int(uint(int(_4305)) >> uint(2)));
    int _4309 = int(_4305) & 3;
    float _4311 = (*spvDescriptorSet0.vp_c9)._m0[int(_4307)][_4309];
    int _4313 = int(_4305) + 1;
    uint _4315 = uint(int(uint(_4313) >> uint(2)));
    int _4317 = _4313 & 3;
    float _4319 = (*spvDescriptorSet0.vp_c9)._m0[int(_4315)][_4317];
    int _4321 = _4283 << 4;
    int _4323 = _4321 + 368;
    int _4325 = _3313 + _4299;
    int _4327 = _4303 >> 2;
    uint _4329 = uint(int(uint(_4323) >> uint(2)));
    uint _4331 = uint(int(uint(int(_4329)) >> uint(2)));
    int _4333 = int(_4329) & 3;
    float _4335 = (*spvDescriptorSet0.vp_c9)._m0[int(_4331)][_4333];
    int _4337 = int(_4329) + 1;
    uint _4339 = uint(int(uint(_4337) >> uint(2)));
    int _4341 = _4337 & 3;
    float _4343 = (*spvDescriptorSet0.vp_c9)._m0[int(_4339)][_4341];
    int _4345 = _4327 << 4;
    int _4347 = _4345 + 656;
    float _4349 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _4351 = _4325 >> 2;
    float _4353 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _4355 = !_2619;
    int _4357 = _4355 ? _4101 : (-1);
    uint _4359 = uint(int(uint(_4347) >> uint(2)));
    uint _4361 = uint(int(uint(int(_4359)) >> uint(2)));
    int _4363 = int(_4359) & 3;
    float _4365 = (*spvDescriptorSet0.vp_c9)._m0[int(_4361)][_4363];
    int _4367 = int(_4359) + 1;
    uint _4369 = uint(int(uint(_4367) >> uint(2)));
    int _4371 = _4367 & 3;
    float _4373 = (*spvDescriptorSet0.vp_c9)._m0[int(_4369)][_4371];
    bool _4375 = _3331 != 3;
    float _4377 = fma(_3661, -2.0, _4349);
    int _4379 = _4351 << 4;
    int _4381 = _4379 + 800;
    float _4383 = -_4353;
    float _4385 = fma(_4241, 2.0, _4383);
    int _4387 = ~_3963;
    int _4389 = _4387 + _4055;
    int _4391 = _4389 + 1;
    float _4393 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4377);
    int _4395 = ~_4011;
    int _4397 = _4395 + _4089;
    int _4399 = _4397 + 1;
    float _4401 = -_164;
    float _4403 = fma(_4401, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4385);
    int _4405 = _4149 ? 0 : 1;
    int _4407 = _4323 + 8;
    uint _4409 = uint(int(uint(_4407) >> uint(2)));
    uint _4411 = uint(int(uint(int(_4409)) >> uint(2)));
    int _4413 = int(_4409) & 3;
    float _4415 = (*spvDescriptorSet0.vp_c9)._m0[int(_4411)][_4413];
    int _4417 = int(_4409) + 1;
    uint _4419 = uint(int(uint(_4417) >> uint(2)));
    int _4421 = _4417 & 3;
    float _4423 = (*spvDescriptorSet0.vp_c9)._m0[int(_4419)][_4421];
    bool _4425 = !_4279;
    int _4427 = _4425 ? 0 : (-1);
    int _4429 = _2007 * _4399;
    int _4431 = _4429 + _2963;
    bool _4433 = !_4375;
    int _4435 = _4433 ? 0 : (-1);
    int _4437 = _1952 * _4391;
    int _4439 = _4437 + _2819;
    int _4441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _4443 = _4441 != 0;
    int _4445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _4447 = _4445 != 0;
    int _4449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _4451 = _4449 != 0;
    int _4453 = abs(_3247);
    uint _4455 = uint(int(uint(_4381) >> uint(2)));
    uint _4457 = uint(int(uint(int(_4455)) >> uint(2)));
    int _4459 = int(_4455) & 3;
    float _4461 = (*spvDescriptorSet0.vp_c9)._m0[int(_4457)][_4459];
    int _4463 = int(_4455) + 1;
    uint _4465 = uint(int(uint(_4463) >> uint(2)));
    int _4467 = _4463 & 3;
    float _4469 = (*spvDescriptorSet0.vp_c9)._m0[int(_4465)][_4467];
    int _4471 = ~_4405;
    int _4473 = _4471 + 1;
    int _4475 = _4473 + 1;
    int _4477 = _4475;
    if (!_4137)
    {
        int _4479 = ~_4405;
        int _4481 = _4479 + 1;
        _4477 = _4481;
    }
    int _4483 = _4477;
    int _4485 = abs(_3319);
    int _4487 = ~_4453;
    int _4489 = _4487 + 1;
    int _4491 = _4489 + 1;
    int _4493 = _4297 + 8;
    uint _4495 = uint(int(uint(_4493) >> uint(2)));
    uint _4497 = uint(int(uint(int(_4495)) >> uint(2)));
    int _4499 = int(_4495) & 3;
    float _4501 = (*spvDescriptorSet0.vp_c9)._m0[int(_4497)][_4499];
    int _4503 = int(_4495) + 1;
    uint _4505 = uint(int(uint(_4503) >> uint(2)));
    int _4507 = _4503 & 3;
    float _4509 = (*spvDescriptorSet0.vp_c9)._m0[int(_4505)][_4507];
    int _4511 = abs(_3079);
    int _4513 = abs(_4163);
    float _4515 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4517 = int(_4515);
    int _4519 = ~_4511;
    int _4521 = _4519 + 1;
    int _4523 = _4521 + 1;
    int _4525 = _4491 * as_type<int>(_4319);
    int _4527 = abs(_4181);
    int _4529 = _4381 + 8;
    uint _4531 = uint(int(uint(_4529) >> uint(2)));
    uint _4533 = uint(int(uint(int(_4531)) >> uint(2)));
    int _4535 = int(_4531) & 3;
    float _4537 = (*spvDescriptorSet0.vp_c9)._m0[int(_4533)][_4535];
    int _4539 = int(_4531) + 1;
    uint _4541 = uint(int(uint(_4539) >> uint(2)));
    int _4543 = _4539 & 3;
    float _4545 = (*spvDescriptorSet0.vp_c9)._m0[int(_4541)][_4543];
    int _4547 = ~_4513;
    int _4549 = _4547 + 1;
    int _4551 = _4549 + 1;
    int _4553 = ~_4485;
    int _4555 = _4553 + 1;
    int _4557 = _4555 + 1;
    int _4559 = ~_4527;
    int _4561 = _4559 + 1;
    int _4563 = _4561 + 1;
    int _4565 = _4523 * as_type<int>(_4343);
    int _4567 = abs(_4205);
    int _4569 = _4347 + 8;
    uint _4571 = uint(int(uint(_4569) >> uint(2)));
    uint _4573 = uint(int(uint(int(_4571)) >> uint(2)));
    int _4575 = int(_4571) & 3;
    float _4577 = (*spvDescriptorSet0.vp_c9)._m0[int(_4573)][_4575];
    int _4579 = int(_4571) + 1;
    uint _4581 = uint(int(uint(_4579) >> uint(2)));
    int _4583 = _4579 & 3;
    float _4585 = (*spvDescriptorSet0.vp_c9)._m0[int(_4581)][_4583];
    int _4587 = abs(_3391);
    int _4589 = _4551 * as_type<int>(_4335);
    int _4591 = _4589 + _4565;
    int _4593 = ~_3869;
    int _4595 = _4593 + 1;
    int _4597 = _4595 + 1;
    int _4599 = _4563 * as_type<int>(_4311);
    int _4601 = _4599 + _4525;
    int _4603 = ~_4567;
    int _4605 = _4603 + 1;
    int _4607 = _4605 + 1;
    int _4609 = _4557 * as_type<int>(_4373);
    int _4611 = ~_4587;
    int _4613 = _4611 + 1;
    int _4615 = _4613 + 1;
    float _4617 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4619 = int(_4617);
    int _4621 = abs(_4221);
    int _4623 = _4607 * as_type<int>(_4365);
    int _4625 = _4623 + _4609;
    int _4627 = abs(_3225);
    int _4629 = ~_4621;
    int _4631 = _4629 + 1;
    int _4633 = _4631 + 1;
    int _4635 = ~_4627;
    int _4637 = _4635 + 1;
    int _4639 = _4637 + 1;
    int _4641 = _4597 * as_type<int>(_4415);
    int _4643 = _4641 + _4591;
    int _4645 = abs(_3375);
    float _4647 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4649 = int(_4647);
    int _4651 = abs(_3301);
    int _4653 = ~_4645;
    int _4655 = _4653 + 1;
    int _4657 = _4655 + 1;
    int _4659 = abs(_4275);
    int _4661 = _4615 * as_type<int>(_4469);
    float _4663 = float(uint(_3681));
    float _4665 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4667 = log2(_4665);
    int _4669 = abs(_4245);
    int _4671 = _4633 * as_type<int>(_4461);
    int _4673 = _4671 + _4661;
    int _4675 = abs(_3337);
    int _4677 = ~_4669;
    int _4679 = _4677 + 1;
    int _4681 = _4679 + 1;
    int _4683 = _4639 * as_type<int>(_4501);
    int _4685 = _4683 + _4601;
    float _4687 = 1.0 / _4663;
    int _4689 = abs(_4619);
    int _4691 = _4681 * as_type<int>(_4423);
    int _4693 = _4691 + _4643;
    int _4695 = ~_4651;
    int _4697 = _4695 + 1;
    int _4699 = _4697 + 1;
    int _4701 = abs(_4435);
    int _4703 = _4657 * as_type<int>(_4537);
    int _4705 = _4703 + _4673;
    int _4707 = ~_4659;
    int _4709 = _4707 + 1;
    int _4711 = _4709 + 1;
    int _4713 = abs(_4427);
    int _4715 = abs(_3171);
    int _4717 = _4711 * as_type<int>(_4509);
    int _4719 = _4717 + _4685;
    int _4721 = ~_4713;
    int _4723 = _4721 + 1;
    int _4725 = _4723 + 1;
    int _4727 = _4699 * as_type<int>(_4577);
    int _4729 = _4727 + _4625;
    int _4731 = abs(_3681);
    int _4733 = abs(_3323);
    int _4735 = _4725 * as_type<int>(_4585);
    int _4737 = _4735 + _4729;
    int _4739 = ~_4715;
    int _4741 = _4739 + 1;
    int _4743 = _4741 + 1;
    float _4745 = _4001 * _4001;
    int _4747 = abs(_3489);
    int _4749 = _4693 * _4743;
    int _4751 = ~_4675;
    int _4753 = _4751 + 1;
    int _4755 = _4753 + 1;
    float _4757 = fma(_4031, _4031, _4745);
    int _4759 = ~_4701;
    int _4761 = _4759 + 1;
    int _4763 = _4761 + 1;
    int _4765 = _4109 * _4715;
    int _4767 = _4765 + _4749;
    int _4769 = _4755 * _4737;
    int _4771 = as_type<int>(_4687) + (-2);
    float _4773 = fma(_3979, _3979, _4757);
    float _4775 = float(uint(_4767));
    int _4777 = _4763 * as_type<int>(_4545);
    int _4779 = _4777 + _4705;
    float _4781 = float(uint(_4517));
    float _4783 = rsqrt(_4773);
    float _4785 = float(uint(_4649));
    float _4787 = as_type<float>(_4771) * _4775;
    int _4789 = abs(_4517);
    float _4791 = float(uint(_4731));
    int _4793 = ~_4733;
    int _4795 = _4793 + 1;
    int _4797 = _4795 + 1;
    float _4799 = 1.0 / _4781;
    float _4801 = float(uint(_4619));
    int _4803 = _4797 * _4719;
    float _4805 = float(uint(_4789));
    int _4807 = ~_4747;
    int _4809 = _4807 + 1;
    int _4811 = _4809 + 1;
    float _4813 = 1.0 / _4785;
    bool _4815 = !_2881;
    int _4817 = _4815 ? _4431 : (-1);
    int _4819 = _4357 * _4733;
    int _4821 = _4819 + _4803;
    bool _4823 = !_2847;
    int _4825 = _4823 ? _4439 : (-1);
    int _4827 = _4811 * _4779;
    float _4829 = float(uint(_4689));
    int _4831 = ~_3681;
    int _4833 = _4831 + 1;
    float _4835 = 1.0 / _4791;
    int _4837 = _4817 * _4747;
    int _4839 = _4837 + _4827;
    float _4841 = _4001 * _4783;
    int _4843 = abs(_4649);
    int _4845 = _4825 * _4675;
    int _4847 = _4845 + _4769;
    int _4849 = as_type<int>(_4799) + (-2);
    float _4851 = -_4841;
    float _4853 = fma(_4851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4001);
    float _4855 = float(uint(_4821));
    float _4857 = trunc(_4787);
    float _4859 = precise::max(_4857, 0.0);
    uint _4861 = uint(_4859);
    int _4863 = as_type<int>(_4813) + (-2);
    float _4865 = _4031 * _4783;
    float _4867 = float(uint(_4839));
    float _4869 = as_type<float>(_4849) * _4855;
    float _4871 = float(uint(_4843));
    float _4873 = -_4865;
    float _4875 = fma(_4873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4031);
    int _4877 = abs(_4821);
    float _4879 = 1.0 / _4801;
    int _4881 = as_type<int>(_4835) + (-2);
    float _4883 = as_type<float>(_4863) * _4867;
    int _4885 = abs(_4767);
    float _4887 = _4853 * _4853;
    float _4889 = float(uint(_4847));
    float _4891 = float(uint(_4885));
    float _4893 = 1.0 / _4805;
    int _4895 = _4833 * int(_4861);
    int _4897 = _4895 + _4767;
    float _4899 = fma(_4875, _4875, _4887);
    int _4901 = ~_4649;
    int _4903 = _4901 + 1;
    float _4905 = as_type<float>(_4881) * _4891;
    int _4907 = ~_4619;
    int _4909 = _4907 + 1;
    float _4911 = float(uint(_4897));
    float _4913 = 1.0 / _4829;
    int _4915 = as_type<int>(_4879) + (-2);
    float _4917 = float(uint(_4877));
    float _4919 = as_type<float>(_4771) * _4911;
    bool _4921 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4923 = isnan(0.0);
    bool _4925 = _4921 || _4923;
    bool _4927 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4929 = _4925 || _4927;
    float _4931 = as_type<float>(_4915) * _4889;
    int _4933 = as_type<int>(_4893) + (-2);
    float _4935 = 1.0 / _4871;
    int _4937 = ~_4517;
    int _4939 = _4937 + 1;
    float _4941 = as_type<float>(_4933) * _4917;
    int _4943 = abs(_4847);
    float _4945 = trunc(_4869);
    float _4947 = precise::max(_4945, 0.0);
    uint _4949 = uint(_4947);
    int _4951 = as_type<int>(_4913) + (-2);
    float _4953 = float(uint(_4943));
    int _4955 = abs(_4839);
    float _4957 = trunc(_4883);
    float _4959 = precise::max(_4957, 0.0);
    uint _4961 = uint(_4959);
    float _4963 = as_type<float>(_4951) * _4953;
    int _4965 = as_type<int>(_4935) + (-2);
    float _4967 = float(uint(_4955));
    float _4969 = trunc(_4931);
    float _4971 = precise::max(_4969, 0.0);
    uint _4973 = uint(_4971);
    float _4975 = as_type<float>(_4965) * _4967;
    float _4977 = trunc(_4905);
    float _4979 = precise::max(_4977, 0.0);
    uint _4981 = uint(_4979);
    int _4983 = _4903 * int(_4961);
    int _4985 = _4983 + _4839;
    float _4987 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4223);
    float _4989 = float(uint(_4985));
    float _4991 = -_4987;
    float _4993 = fma(_4231, _4159, _4991);
    float _4995 = trunc(_4919);
    float _4997 = precise::max(_4995, 0.0);
    uint _4999 = uint(_4997);
    float _5001 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4187);
    int _5003 = _4939 * int(_4949);
    int _5005 = _5003 + _4821;
    float _5007 = _4667 * _164;
    int _5009 = _4909 * int(_4973);
    int _5011 = _5009 + _4847;
    float _5013 = fma(_5001, _3937, _4253);
    float _5015 = as_type<float>(_4863) * _4989;
    float _5017 = float(uint(_5005));
    float _5019 = trunc(_4941);
    float _5021 = precise::max(_5019, 0.0);
    uint _5023 = uint(_5021);
    float _5025 = float(uint(_5011));
    float _5027 = as_type<float>(_4849) * _5017;
    int _5029 = ~_4789;
    int _5031 = _5029 + 1;
    float _5033 = as_type<float>(_4915) * _5025;
    bool _5035 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _5037 = isnan(1.0);
    bool _5039 = _5035 || _5037;
    bool _5041 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _5043 = _5039 || _5041;
    float _5045 = trunc(_4975);
    float _5047 = precise::max(_5045, 0.0);
    uint _5049 = uint(_5047);
    int _5051 = int(_4861) + int(_4999);
    float _5053 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _5055 = 1.0 + _5053;
    int _5057 = ~_4731;
    int _5059 = _5057 + 1;
    int _5061 = ~_4689;
    int _5063 = _5061 + 1;
    float _5065 = trunc(_4963);
    float _5067 = precise::max(_5065, 0.0);
    uint _5069 = uint(_5067);
    int _5071 = _5031 * int(_5023);
    int _5073 = _5071 + _4877;
    int _5075 = _5059 * int(_4981);
    int _5077 = _5075 + _4885;
    float _5079 = trunc(_5027);
    float _5081 = precise::max(_5079, 0.0);
    uint _5083 = uint(_5081);
    int _5085 = ~_4843;
    int _5087 = _5085 + 1;
    int _5089 = _5087 * int(_5049);
    int _5091 = _5089 + _4955;
    float _5093 = exp2(_5007);
    float _5095 = float(uint(_5073));
    int _5097 = _5063 * int(_5069);
    int _5099 = _5097 + _4943;
    float _5101 = float(uint(_5091));
    float _5103 = float(uint(_5077));
    float _5105 = as_type<float>(_4933) * _5095;
    float _5107 = 1.0 / _5055;
    int _5109 = int(_4949) + int(_5083);
    float _5111 = as_type<float>(_4965) * _5101;
    float _5113 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _5115 = as_type<float>(_4881) * _5103;
    float _5117 = trunc(_5033);
    float _5119 = precise::max(_5117, 0.0);
    uint _5121 = uint(_5119);
    float _5123 = float(uint(_5099));
    float _5125 = -_5093;
    float _5127 = _5125 + 1.0;
    float _5129 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _5131 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _5133 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _5135 = as_type<float>(_4951) * _5123;
    float _5137 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[78].w, _5129);
    float _5139 = trunc(_5015);
    float _5141 = precise::max(_5139, 0.0);
    uint _5143 = uint(_5141);
    float _5145 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[88].w, _5133);
    float _5147 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _5113);
    float _5149 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[88].z, _5131);
    float _5151 = _4929 ? _5127 : 0.0;
    float _5153 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _3463);
    int _5155 = ~_3681;
    int _5157 = _5155 + 1;
    float _5159 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _5137);
    float _5161 = trunc(_5115);
    float _5163 = precise::max(_5161, 0.0);
    uint _5165 = uint(_5163);
    int _5167 = ~_4517;
    int _5169 = _5167 + 1;
    float _5171 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].w, _5145);
    float _5173 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _5147);
    int _5175 = ~_4619;
    int _5177 = _5175 + 1;
    int _5179 = int(_4973) + int(_5121);
    int _5181 = _5169 * _5109;
    int _5183 = _5181 + _4821;
    float _5185 = trunc(_5105);
    float _5187 = precise::max(_5185, 0.0);
    uint _5189 = uint(_5187);
    float _5191 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].z, _5149);
    float _5193 = _4841;
    if (_5043)
    {
        float _5195 = _5151 * _5107;
        _168 = _5195;
    }
    float _5197 = _168;
    int _5199 = _5157 * _5051;
    int _5201 = _5199 + _4767;
    bool _5203 = uint(_5183) >= uint(_4517);
    int _5205 = _5177 * _5179;
    int _5207 = _5205 + _4847;
    int _5209 = int(_4961) + int(_5143);
    float _5211 = trunc(_5135);
    float _5213 = precise::max(_5211, 0.0);
    uint _5215 = uint(_5213);
    bool _5217 = uint(_5201) >= uint(_3681);
    int _5219 = ~_4649;
    int _5221 = _5219 + 1;
    bool _5223 = !_5217;
    int _5225 = _5223 ? 0 : (-1);
    bool _5227 = uint(_5207) >= uint(_4619);
    float _5229 = trunc(_5111);
    float _5231 = precise::max(_5229, 0.0);
    uint _5233 = uint(_5231);
    int _5235 = int(_4981) + int(_5165);
    int _5237 = _5221 * _5209;
    int _5239 = _5237 + _4839;
    int _5241 = ~_4731;
    int _5243 = _5241 + 1;
    int _5245 = int(_5023) + int(_5189);
    int _5247 = ~_4789;
    int _5249 = _5247 + 1;
    int _5251 = _5243 * _5235;
    int _5253 = _5251 + _4885;
    int _5255 = int(_5069) + int(_5215);
    int _5257 = ~_4689;
    int _5259 = _5257 + 1;
    int _5261 = _5249 * _5245;
    int _5263 = _5261 + _4877;
    bool _5265 = !_5203;
    int _5267 = _5265 ? 0 : (-1);
    int _5269 = ~_4843;
    int _5271 = _5269 + 1;
    int _5273 = _5259 * _5255;
    int _5275 = _5273 + _4943;
    int _5277 = int(_5049) + int(_5233);
    bool _5279 = uint(_5239) >= uint(_4649);
    bool _5281 = !_5227;
    int _5283 = _5281 ? 0 : (-1);
    int _5285 = _5271 * _5277;
    int _5287 = _5285 + _4955;
    bool _5289 = uint(_5253) >= uint(_4731);
    bool _5291 = !_5279;
    int _5293 = _5291 ? 0 : (-1);
    float _5295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _5297 = uint(_5263) >= uint(_4789);
    bool _5299 = !_5289;
    int _5301 = _5299 ? 0 : (-1);
    bool _5303 = uint(_5275) >= uint(_4689);
    int _5305 = ~_5051;
    int _5307 = _5305 + _5225;
    int _5309 = _5307 + 1;
    float _5311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _5313 = !_5297;
    int _5315 = _5313 ? 0 : (-1);
    int _5317 = ~_5109;
    int _5319 = _5317 + _5267;
    int _5321 = _5319 + 1;
    int _5323 = _3681 * _5309;
    int _5325 = _5323 + _4767;
    bool _5327 = uint(_5287) >= uint(_4843);
    int _5329 = ~_5179;
    int _5331 = _5329 + _5283;
    int _5333 = _5331 + 1;
    int _5335 = _4517 * _5321;
    int _5337 = _5335 + _4821;
    bool _5339 = !_5303;
    int _5341 = _5339 ? 0 : (-1);
    float _5343 = _5295 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _5345 = ~_5209;
    int _5347 = _5345 + _5293;
    int _5349 = _5347 + 1;
    int _5351 = _4619 * _5333;
    int _5353 = _5351 + _4847;
    bool _5355 = _3681 == 0;
    float _5357 = fma(_5343, _2171, -0.5);
    bool _5359 = !_5327;
    int _5361 = _5359 ? 0 : (-1);
    float _5363 = _5311 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _5365 = _4517 == 0;
    int _5367 = _4821 ^ _4517;
    int _5369 = _4767 ^ _3681;
    bool _5371 = !_5355;
    int _5373 = _5371 ? _5325 : (-1);
    int _5375 = _4649 * _5349;
    int _5377 = _5375 + _4839;
    bool _5379 = !_5365;
    int _5381 = _5379 ? _5337 : (-1);
    uint _5383 = uint(int(uint(_5367) >> uint(31)));
    bool _5385 = _4649 == 0;
    uint _5387 = uint(int(uint(_5369) >> uint(31)));
    int _5389 = ~_5315;
    int _5391 = _5245 + _5389;
    int _5393 = _5391 + 1;
    float _5395 = _3979 * _4783;
    int _5397 = ~int(_5383);
    int _5399 = _5397 + 1;
    bool _5401 = !_5385;
    int _5403 = _5401 ? _5377 : (-1);
    float _5405 = -_5395;
    float _5407 = fma(_5405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3979);
    int _5409 = ~_5301;
    int _5411 = _5235 + _5409;
    int _5413 = _5411 + 1;
    int _5415 = ~int(_5387);
    int _5417 = _5415 + 1;
    float _5419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _5421 = _4517 == 0;
    float _5423 = fma(_5407, _5407, _4899);
    bool _5425 = _4619 == 0;
    int _5427 = _5393 ^ _5399;
    int _5429 = _5413 ^ _5417;
    float _5431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _5433 = !_5425;
    int _5435 = _5433 ? _5353 : (-1);
    bool _5437 = _3681 == 0;
    int _5439 = ~_5417;
    int _5441 = _5439 + _5429;
    int _5443 = _5441 + 1;
    int _5445 = ~_5399;
    int _5447 = _5445 + _5427;
    int _5449 = _5447 + 1;
    float _5451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _5453 = !_5437;
    int _5455 = _5453 ? _5443 : (-1);
    bool _5457 = _4619 == 0;
    int _5459 = _4847 ^ _4619;
    bool _5461 = !_5421;
    int _5463 = _5461 ? _5449 : (-1);
    int _5465 = ~_5361;
    int _5467 = _5277 + _5465;
    int _5469 = _5467 + 1;
    float _5471 = _5419 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _5473 = float(_5435);
    bool _5475 = _4649 == 0;
    float _5477 = fma(_5471, _2221, -0.5);
    int _5479 = _4839 ^ _4649;
    float _5481 = _5431 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _5483 = ~_5341;
    int _5485 = _5255 + _5483;
    int _5487 = _5485 + 1;
    float _5489 = fma(_5471, _5473, _4403);
    float _5491 = float(_5373);
    float _5493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _5495 = float(_5381);
    float _5497 = fma(_5481, _2209, -0.5);
    uint _5499 = uint(int(uint(_5459) >> uint(31)));
    float _5501 = fma(_5343, _5491, _4017);
    float _5503 = float(_5403);
    float _5505 = fma(_5481, _5495, _4287);
    int _5507 = ~int(_5499);
    int _5509 = _5507 + 1;
    float _5511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _5513 = _5451 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    uint _5515 = uint(int(uint(_5479) >> uint(31)));
    float _5517 = fma(_5173, _5357, _5501);
    int _5519 = _5487 ^ _5509;
    float _5521 = fma(_5513, _2287, -0.5);
    float _5523 = fma(_5513, _5503, _4267);
    int _5525 = ~int(_5515);
    int _5527 = _5525 + 1;
    float _5529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _5531 = ~_5509;
    int _5533 = _5531 + _5519;
    int _5535 = _5533 + 1;
    float _5537 = fma(_4073, _5521, _5523);
    float _5539 = fma(_5363, _3393, -0.5);
    int _5541 = _5469 ^ _5527;
    float _5543 = _5493 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _5545 = !_5457;
    int _5547 = _5545 ? _5535 : (-1);
    float _5549 = fma(_4277, _5497, _5505);
    float _5551 = float(_5455);
    float _5553 = _5511 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5555 = float(_5547);
    float _5557 = fma(_5543, _3423, -0.5);
    int _5559 = ~_5527;
    int _5561 = _5559 + _5541;
    int _5563 = _5561 + 1;
    float _5565 = fma(_5553, _3419, -0.5);
    float _5567 = -_5153;
    float _5569 = fma(_5363, _5551, _5567);
    float _5571 = -_4291;
    float _5573 = fma(_5553, _5555, _5571);
    bool _5575 = !_4443;
    int _5577 = _5575 ? 0 : 1;
    float _5579 = _5529 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _5581 = !_5475;
    int _5583 = _5581 ? _5563 : (-1);
    float _5585 = fma(_5159, _5539, _5569);
    float _5587 = float(_5463);
    float _5589 = fma(_5579, _3403, -0.5);
    float _5591 = float(_5583);
    float _5593 = fma(_5171, _5565, _5573);
    int _5595 = abs(_5577);
    float _5597 = -_4393;
    float _5599 = fma(_5579, _5587, _5597);
    float _5601 = in.m_79.x;
    float _5603 = in.m_79.y;
    float _5605 = in.m_79.z;
    float _5607 = -_4271;
    float _5609 = fma(_5543, _5591, _5607);
    float _5611 = fma(_5191, _5477, _5489);
    float _5613 = fma(_4281, _5589, _5599);
    bool _5615 = !_4447;
    int _5617 = _5615 ? 0 : 1;
    float _5619 = fma(_4261, _5557, _5609);
    float _5621 = _5013 + 0.5;
    float _5623 = _4993 + 0.5;
    float _5625 = _5611 + 0.5;
    float _5627 = _5517 + 0.5;
    float _5629 = _5549 + 0.5;
    float _5631 = _5585 + 0.5;
    float _5633 = _5613 + 0.5;
    float _5635 = _5537 + 0.5;
    float _5637 = _5593 + 0.5;
    float _5639 = _5619 + 0.5;
    int _5641 = abs(_5617);
    out.m_81.x = _5621;
    out.m_81.y = _5623;
    bool _5643 = !_4451;
    int _5645 = _5643 ? 0 : 1;
    out.m_83.x = _5627;
    out.m_83.y = _5631;
    out.m_83.z = _5629;
    out.m_83.w = _5633;
    out.m_85.x = _5625;
    out.m_85.y = _5637;
    out.m_87.x = _5635;
    out.m_87.y = _5639;
    float _5647 = float(_4483);
    float _5649 = float(_5595);
    float _5651 = as_type<float>(_5563);
    if (_4095)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5653 = -_4841;
    float _5655 = fma(_5653, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3635);
    float _5657 = _5649 * _5647;
    float _5659 = float(_5641);
    float _5661 = -_4865;
    float _5663 = fma(_5661, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3713);
    float _5665 = float(_3565);
    float _5667 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5669 = _5655 + _5667;
    float _5671 = _5657 * (-2.0);
    float _5673 = -_5395;
    float _5675 = fma(_5673, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3895);
    float _5677 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5679 = _5663 + _5677;
    float _5681 = _5669 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5683 = _5659 * _5665;
    float _5685 = _2129 + (-0.5);
    float _5687 = fma(_5671, _5601, _5601);
    float _5689 = _1940 + _2143;
    float _5691 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5693 = _5675 + _5691;
    float _5695 = fma(_5679, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5681);
    float _5697 = fma(_4217, _5671, _4217);
    float _5699 = fma(_5685, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5687);
    float _5701 = _5689 + (-1.0);
    float _5703 = _5683 * (-2.0);
    float _5705 = fma(_5693, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5695);
    float _5707 = fma(_5697, _5197, _5699);
    float _5709 = fma(_5701, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5711 = _1940 + (-0.5);
    float _5713 = fma(_5703, _5603, _5603);
    bool _5715 = _5705 >= 0.0;
    float _5717 = fma(_5709, _5703, _5709);
    int _5719 = abs(_5645);
    float _5721 = fma(_5711, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5713);
    float _5723 = _5707 * 0.15915493667125701904296875;
    float _5725 = sqrt(_5423);
    float _5727 = fma(_5717, _5197, _5721);
    float _5729 = float(_3925);
    float _5731 = float(_5719);
    float _5733 = _5727 * 0.15915493667125701904296875;
    float _5735 = _2129 + _2143;
    float _5737 = _5681;
    if (_5715)
    {
        _5737 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5739 = _5737;
    float _5741 = _5723 * 6.283185482025146484375;
    float _5743 = sin(_5741);
    float _5745 = _5731 * _5729;
    int _5747 = as_type<int>(_5739);
    if (_5715)
    {
        out.m_49.x = 0.0;
    }
    if (_5715)
    {
        float _5749 = _5739 * 5.0;
        _5747 = as_type<int>(_5749);
    }
    int _5751 = _5747;
    float _5753 = _5735 + (-1.0);
    float _5755 = _5745 * (-2.0);
    float _5757 = _5723 * 6.283185482025146484375;
    float _5759 = cos(_5757);
    if (_5715)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _15614 = as_type<float>(_5751);
        out.gl_Position.z = _15614;
    }
    float _5761 = _5733 * 6.283185482025146484375;
    float _5763 = sin(_5761);
    if (_5715)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5765 = -_3635;
    float _5767 = _5765 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5769 = fma(_5753, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5771 = -_3713;
    float _5773 = _5771 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5775 = -_3895;
    float _5777 = _5775 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5779 = _5767 * _5767;
    float _5781 = fma(_5755, _5605, _5605);
    float _5783 = _2143 + (-0.5);
    float _5785 = fma(_5769, _5755, _5769);
    float _5787 = fma(_5773, _5773, _5779);
    float _5789 = _5733 * 6.283185482025146484375;
    float _5791 = cos(_5789);
    float _5793 = fma(_5783, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5781);
    float _5795 = _4783 * _5725;
    float _5797 = fma(_5777, _5777, _5787);
    float _5799 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5801 = fma(_5785, _5197, _5793);
    float _5803 = in.m_89.x;
    float _5805 = in.m_89.y;
    float _5807 = in.m_89.z;
    float _5809 = _5743 * _5763;
    float _5811 = _566 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5813 = rsqrt(_5797);
    float _5815 = _5801 * 0.15915493667125701904296875;
    float _5817 = _5795 * _5799;
    float _5819 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5821 = _5795 * _5811;
    float _5823 = _5759 * _5791;
    float _5825 = _5815 * 6.283185482025146484375;
    float _5827 = sin(_5825);
    float _5829 = _5743 * _5791;
    float _5831 = _5795 * _5819;
    float _5833 = _5773 * _5813;
    float _5835 = _5777 * _5813;
    float _5837 = _5767 * _5813;
    float _5839 = _5815 * 6.283185482025146484375;
    float _5841 = cos(_5839);
    float _5843 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5845 = _5833 * _5843;
    float _5847 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5849 = _5835 * _5847;
    float _5851 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5853 = _5837 * _5851;
    float _5855 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5857 = -_5845;
    float _5859 = fma(_5835, _5855, _5857);
    float _5861 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5863 = -_5849;
    float _5865 = fma(_5837, _5861, _5863);
    float _5867 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5869 = -_5853;
    float _5871 = fma(_5833, _5867, _5869);
    float _5873 = _5859 * _5859;
    float _5875 = fma(_5827, _5823, _5809);
    float _5877 = fma(_5827, _5809, _5823);
    float _5879 = _5759 * _5763;
    float _5881 = fma(_5865, _5865, _5873);
    float _5883 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5805);
    float _5885 = _5759 * _5841;
    float _5887 = fma(_5871, _5871, _5881);
    float _5889 = _5883 * _5817;
    float _5891 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5803);
    float _5893 = -_5879;
    float _5895 = fma(_5827, _5829, _5893);
    float _5897 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5807);
    float _5899 = -_5829;
    float _5901 = fma(_5827, _5879, _5899);
    float _5903 = rsqrt(_5887);
    float _5905 = _5891 * _5831;
    float _5907 = _5885 * _5889;
    float _5909 = _5791 * _5841;
    float _5911 = _5743 * _5841;
    float _5913 = _5897 * _5821;
    float _5915 = -_5889;
    float _5917 = _5827 * _5915;
    float _5919 = fma(_5875, _5905, _5907);
    float _5921 = _5763 * _5841;
    float _5923 = fma(_5909, _5905, _5917);
    float _5925 = _5865 * _5903;
    float _5927 = _5859 * _5903;
    float _5929 = _5871 * _5903;
    float _5931 = _5911 * _5889;
    float _5933 = _5837 * _5925;
    float _5935 = fma(_5901, _5913, _5919);
    float _5937 = _5835 * _5927;
    float _5939 = fma(_5895, _5905, _5931);
    float _5941 = -_5933;
    float _5943 = fma(_5833, _5927, _5941);
    float _5945 = fma(_5921, _5913, _5923);
    float _5947 = -_5937;
    float _5949 = fma(_5837, _5929, _5947);
    float _5951 = fma(_5877, _5913, _5939);
    float _5953 = _5943 * _5935;
    float _5955 = _5655 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5957 = _5949 * _5935;
    float _5959 = fma(_5929, _5945, _5953);
    float _5961 = fma(_5663, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5955);
    float _5963 = fma(_5925, _5945, _5957);
    float _5965 = fma(_5835, _5951, _5959);
    float _5967 = fma(_5675, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5961);
    float _5969 = fma(_5833, _5951, _5963);
    float _5971 = _3895 + _5965;
    float _5973 = _3713 + _5969;
    float _5975 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5977 = _5971 + _5975;
    float _5979 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5981 = _5973 + _5979;
    float _5983 = _5977 * _5977;
    float _5985 = fma(_5981, _5981, _5983);
    float _5987 = _5833 * _5929;
    float _5989 = sqrt(_5985);
    float _5991 = -_5987;
    float _5993 = fma(_5835, _5925, _5991);
    float _5995 = _5993 * _5935;
    float _5997 = fma(_5927, _5945, _5995);
    float _5999 = fma(_5837, _5951, _5997);
    bool _6001 = _5989 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6003 = _3635 + _5999;
    float _6005 = _5951;
    float _6007 = _5987;
    float _6009 = _5973;
    if (!_6001)
    {
        _6005 = _5971;
    }
    float _6011 = _6005;
    float _6013 = _6011;
    if (!_6001)
    {
        _6007 = _6003;
    }
    float _6015 = _6007;
    bool _6017 = !_6001;
    float _6019 = _6015;
    if (!_6017)
    {
        float _6021 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6023 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _6025 = _5989 + _6023;
        float _6027 = _6003 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6029 = _6025 * _6021;
        float _6031 = rsqrt(_5985);
        float _6033 = _6029 * 0.15915493667125701904296875;
        float _6035 = _6033 * 6.283185482025146484375;
        float _6037 = cos(_6035);
        float _6039 = _6033 * 6.283185482025146484375;
        float _6041 = sin(_6039);
        float _6043 = _6037 + (-1.0);
        float _6045 = _6043 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _6047 = fma(_6041, _6027, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _6049 = fma(_6003, _6037, _6045);
        float _6051 = _6031 * _6047;
        float _6053 = fma(_5981, _6051, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _6055 = fma(_5977, _6051, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _6019 = _6049;
        _6009 = _6053;
        _6013 = _6055;
    }
    float _6057 = _6019;
    float _6059 = _6009;
    float _6061 = _6013;
    float _6063 = -_3635;
    float _6065 = _6063 + _6057;
    float _6067 = -_3713;
    float _6069 = _6067 + _6059;
    float _6071 = -_3895;
    float _6073 = _6071 + _6061;
    float _6075 = _5967 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _6077 = _6065 * _6065;
    float _6079 = _5655 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _6081 = 1.0 / _6075;
    float _6083 = fma(_6069, _6069, _6077);
    bool _6085 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _6087 = isnan(0.5);
    bool _6089 = _6085 || _6087;
    bool _6091 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _6093 = _6089 || _6091;
    bool _6095 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _6097 = isnan(0.5);
    bool _6099 = _6095 || _6097;
    bool _6101 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _6103 = _6099 || _6101;
    float _6105 = fma(_6073, _6073, _6083);
    float _6107 = fma(_5663, (*spvDescriptorSet0.vp_c8)._m0[10].x, _6079);
    float _6109 = sqrt(_6105);
    float _6111 = fma(_5675, (*spvDescriptorSet0.vp_c8)._m0[10].z, _6107);
    float _6113 = _6111 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _6115 = _6113 + _6075;
    float _6117 = _6115 * _6081;
    float _6119 = _6117 * 0.5;
    bool _6121 = _6109 > 0.0;
    float _6123 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6125 = fma(_6119, (*spvDescriptorSet0.vp_c8)._m0[30].w, _6123);
    float _6127 = 1.0 / _6125;
    bool _6129 = !_6121;
    float _6131 = _6057;
    float _6133 = _6059;
    float _6135 = _6061;
    float _6137 = _6115;
    if (!_6129)
    {
        float _6139 = _228 * _228;
        float _6141 = rsqrt(_6105);
        float _6143 = fma(_224, _224, _6139);
        float _6145 = fma(_230, _230, _6143);
        float _6147 = sqrt(_6145);
        float _6149 = _6069 * _6141;
        float _6151 = _6065 * _6141;
        float _6153 = _6073 * _6141;
        bool _6155 = _6147 > 0.0;
        bool _6157 = !_6155;
        _6137 = _6147;
        if (!_6157)
        {
            float _6159 = rsqrt(_6145);
            float _6161 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _6163 = _228 * _6159;
            float _6165 = _224 * _6159;
            float _6167 = _6151 * _6163;
            float _6169 = _230 * _6159;
            float _6171 = fma(_6149, _6165, _6167);
            float _6173 = _6161 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6175 = fma(_6153, _6169, _6171);
            float _6177 = _6175 * _6173;
            float _6179 = fma(_224, _6177, _6059);
            float _6181 = fma(_228, _6177, _6057);
            float _6183 = fma(_230, _6177, _6061);
            _6131 = _6181;
            _6133 = _6179;
            _6135 = _6183;
            _6137 = _6177;
        }
    }
    float _6185 = _6131;
    float _6187 = _6133;
    float _6189 = _6135;
    float _6191 = _6137;
    float _6193 = -_4841;
    float _6195 = fma(_6193, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6185);
    float _6197 = -_4865;
    float _6199 = fma(_6197, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6187);
    float _6201 = -_5395;
    float _6203 = fma(_6201, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6189);
    float _6205 = _6195;
    float _6207 = _6199;
    float _6209 = _6203;
    float _6211 = _6191;
    if (_6103)
    {
        _5193 = 1.0;
    }
    float _6213 = _5193;
    float _6215 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6217 = _6127 * _6215;
    float _6219 = _6213;
    if (!_6093)
    {
        float _6221 = _5669 * _5669;
        float _6223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6225 = -_3895;
        float _6227 = _6225 + _6189;
        float _6229 = -_3635;
        float _6231 = _6229 + _6185;
        float _6233 = fma(_5679, _5679, _6221);
        float _6235 = fma(_5693, _5693, _6233);
        float _6237 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6239 = sqrt(_6235);
        float _6241 = 1.0 / _5795;
        float _6243 = precise::min(_6239, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6245 = _6243 * _6223;
        float _6247 = _6237 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6249 = -_3713;
        float _6251 = _6249 + _6187;
        float _6253 = _6245 * _6241;
        float _6255 = _6247 * _6253;
        float _6257 = _6227 * _6253;
        float _6259 = fma(_6251, _6255, _5663);
        float _6261 = fma(_6231, _6255, _5655);
        float _6263 = fma(_6247, _6257, _5675);
        _6205 = _6261;
        _6207 = _6259;
        _6209 = _6263;
    }
    float _6265 = _6205;
    float _6267 = _6207;
    float _6269 = _6209;
    if (!_6103)
    {
        float _6271 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6273 = _6271 * 0.15915493667125701904296875;
        float _6275 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6277 = _6273 * 6.283185482025146484375;
        float _6279 = cos(_6277);
        float _6281 = _6275 * 0.15915493667125701904296875;
        float _6283 = _6273 * 6.283185482025146484375;
        float _6285 = sin(_6283);
        float _6287 = 1.0 / _6279;
        float _6289 = _6281 * 6.283185482025146484375;
        float _6291 = cos(_6289);
        float _6293 = _6285 * _6287;
        float _6295 = _6281 * 6.283185482025146484375;
        float _6297 = sin(_6295);
        float _6299 = _6291 * _6293;
        float _6301 = 1.0 / _6299;
        float _6303 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6305 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6303;
        float _6307 = 1.0 / _6305;
        float _6309 = _6297 * _6301;
        float _6311 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6313 = fma(_6217, _6309, _6311);
        float _6315 = _6313 * _6307;
        float _6317 = precise::clamp(_6315, 0.0, 1.0);
        _6211 = _6273;
        _6219 = _6317;
    }
    float _6319 = _6211;
    float _6321 = _6219;
    float _6323 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6325 = _6265 + _6323;
    float _6327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6329 = _6267 + _6327;
    float _6331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6333 = _6269 + _6331;
    float _6335 = _6325 * _6325;
    float _6337 = fma(_6329, _6329, _6335);
    float _6339 = fma(_6333, _6333, _6337);
    float _6341 = rsqrt(_6339);
    float _6343 = sqrt(_6339);
    float _6345 = _6341 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6347 = _6329 * _6345;
    float _6349 = _6333 * _6345;
    float _6351 = _6347 * _6347;
    float _6353 = _6349 * _6349;
    float _6355 = _6351 + _6353;
    float _6357 = sqrt(_6355);
    bool _6359 = _6357 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6361 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6363 = _6357 + _6361;
    float _6365 = _6333;
    float _6367 = _6355;
    float _6369 = _6363;
    float _6371 = _6319;
    float _6373 = _6345;
    if (_6359)
    {
        float _6375 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6365 = _6375;
    }
    float _6377 = _6365;
    if (_6359)
    {
        float _6379 = rsqrt(_6355);
        _6367 = _6379;
    }
    float _6381 = _6367;
    if (_6359)
    {
        float _6383 = _6363 * _6377;
        _6369 = _6383;
    }
    float _6385 = _6369;
    if (_6359)
    {
        float _6387 = _6385 * 0.15915493667125701904296875;
        _6371 = _6387;
    }
    float _6389 = _6371;
    float _6391 = _6335;
    if (_6359)
    {
        float _6393 = _6389 * 6.283185482025146484375;
        float _6395 = sin(_6393);
        _6391 = _6395;
    }
    float _6397 = _6391;
    float _6399 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6401 = precise::max(0.0, _6399);
    float _6403 = _6341;
    float _6405 = _6399;
    float _6407 = _6401;
    if (_6359)
    {
        float _6409 = _6389 * 6.283185482025146484375;
        float _6411 = cos(_6409);
        _6403 = _6411;
    }
    float _6413 = _6403;
    float _6415 = -_6345;
    float _6417 = -_6401;
    float _6419 = fma(_6325, _6415, _6417);
    float _6421 = _6419;
    if (_6359)
    {
        float _6423 = _6419 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6405 = _6423;
    }
    float _6425 = _6405;
    float _6427 = _6425;
    float _6429 = _6397;
    if (_6359)
    {
        float _6431 = fma(_6397, _6425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6427 = _6431;
    }
    float _6433 = _6427;
    float _6435 = fma(_5663, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6437 = _6433;
    float _6439 = _6413;
    if (_6359)
    {
        float _6441 = _6413 + (-1.0);
        _6407 = _6441;
    }
    float _6443 = _6407;
    float _6445 = _6443;
    if (_6359)
    {
        float _6447 = _6381 * _6433;
        _6373 = _6447;
    }
    float _6449 = _6373;
    if (!_6359)
    {
        _6437 = _6349;
    }
    float _6451 = _6437;
    float _6453 = _6451;
    if (_6359)
    {
        float _6455 = _6443 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6429 = _6455;
    }
    float _6457 = _6429;
    float _6459 = _6457;
    if (!_6359)
    {
        _6445 = _6347;
    }
    float _6461 = _6445;
    float _6463 = _6461;
    if (_6359)
    {
        float _6465 = _6347 * _6449;
        _6463 = _6465;
    }
    float _6467 = _6463;
    if (_6359)
    {
        float _6469 = _6349 * _6449;
        _6453 = _6469;
    }
    float _6471 = _6453;
    if (_6359)
    {
        float _6473 = fma(_6419, _6413, _6457);
        _6421 = _6473;
    }
    float _6475 = _6421;
    if (!_6359)
    {
        _6459 = _6351;
    }
    float _6477 = _6459;
    float _6479 = _6477;
    if (_6359)
    {
        float _6481 = _6467 * _6467;
        _6479 = _6481;
    }
    float _6483 = _6479;
    if (!_6359)
    {
        _6439 = _6353;
    }
    float _6485 = _6439;
    float _6487 = _6485;
    if (_6359)
    {
        float _6489 = _6471 * _6471;
        _6487 = _6489;
    }
    float _6491 = _6487;
    float _6493 = fma(_6475, _6475, _6483);
    float _6495 = _6265 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6497 = floor(_6435);
    float _6499 = _6493 + _6491;
    float _6501 = fma(_6267, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6495);
    float _6503 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6505 = fma(_6343, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6503);
    float _6507 = precise::clamp(_6505, 0.0, 1.0);
    float _6509 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6501);
    float _6511 = -_6507;
    float _6513 = _6511 + 1.0;
    float _6515 = rsqrt(_6499);
    float _6517 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6519 = _6509 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6521 = _6265 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6523 = fma(_5675, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6525 = _6519 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6527 = abs(_6513);
    float _6529 = log2(_6527);
    float _6531 = _6265 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6533 = -_6525;
    float _6535 = fma(_6533, _6517, 1.0);
    float _6537 = _6265 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6539 = -_6497;
    float _6541 = _6435 + _6539;
    float _6543 = fma(_6267, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6531);
    float _6545 = _6515 * _6467;
    float _6547 = _6515 * _6475;
    float _6549 = _6515 * _6471;
    float _6551 = fma(_6267, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6537);
    float _6553 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6543);
    float _6555 = fma(_6267, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6521);
    float _6557 = _6545 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6559 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6551);
    float _6561 = _6553 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6563 = fma(_6269, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6555);
    float _6565 = -_6557;
    float _6567 = fma(_6547, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6565);
    float _6569 = _6559 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6571 = _6561 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6573 = _6563 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6575 = -_6549;
    float _6577 = fma(_6575, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6567);
    float _6579 = _6529 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6581 = fma(_6569, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6571);
    float _6583 = floor(_6523);
    float _6585 = fma(_6577, -0.5, 0.5);
    float _6587 = _6561 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6589 = fma(_6519, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6581);
    float _6591 = fma(_6577, 0.5, 0.5);
    float _6593 = fma(_6569, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6587);
    float _6595 = fma(_6573, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6589);
    float _6597 = exp2(_6579);
    float _6599 = _6561 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6601 = fma(_6519, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6593);
    float _6603 = fma(_6591, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6605 = fma(_6569, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6599);
    float _6607 = fma(_6591, _6603, -0.212114393711090087890625);
    float _6609 = log2(_6535);
    float _6611 = fma(_6519, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6605);
    float _6613 = _6547 + 1.0;
    float _6615 = -_6583;
    float _6617 = _6523 + _6615;
    float _6619 = fma(_6591, _6607, 1.570728778839111328125);
    float _6621 = fma(_6573, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6611);
    float _6623 = fma(_6573, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6601);
    float _6625 = 1.0 / _6595;
    float _6627 = -_6547;
    float _6629 = fma(_6597, _6613, _6627);
    float _6631 = sqrt(_6585);
    float _6633 = _6609 * 0.693147182464599609375;
    float2 _16998 = float2(_6541, _6617);
    float _6635 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16998, float2(0.0), isnan(_16998)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16998, float2(0.0), isnan(_16998)), level(0.0)).x;
    float _6637 = fma(_6629, 0.5, 0.5);
    float _6639 = _6633 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6641 = _6621 * _6625;
    float _6643 = _6623 * _6625;
    float _6645 = fma(_6641, 0.5, 0.5);
    float _6647 = fma(_6643, -0.5, 0.5);
    float _6649 = _6631 * 0.636619746685028076171875;
    float3 _17028 = float3(_6645, _6647, _6639);
    float _6651 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_17028, float3(0.0), isnan(_17028)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_17028, float3(0.0), isnan(_17028)), level(0.0)).x;
    float3 _17039 = float3(_6645, _6647, _6639);
    float4 _6654 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_17039, float3(0.0), isnan(_17039)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_17039, float3(0.0), isnan(_17039)), level(0.0)).xyzw;
    float _6656 = _6654.x;
    float _6658 = _6654.y;
    float _6660 = _6654.z;
    float _6662 = _6654.w;
    float _6664 = -_6619;
    float _6666 = fma(_6649, _6664, 1.0);
    float2 _17060 = float2(_6666, _6637);
    float3 _6670 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_17060, float2(0.0), isnan(_17060)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_17060, float2(0.0), isnan(_17060)), level(0.0)).xyz;
    float _6672 = _6670.x;
    float _6674 = _6670.y;
    float _6676 = _6670.z;
    float _6678 = abs(_6217);
    float _6680 = log2(_6678);
    float _6682 = in.m_91.x;
    float _6684 = in.m_91.y;
    float _6686 = in.m_91.z;
    bool _6688 = _5805 != 0.0;
    bool _6690 = isnan(_5805);
    bool _6692 = _6688 || _6690;
    bool _6694 = isnan(0.0);
    bool _6696 = _6692 || _6694;
    float _6698 = _6529 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6700 = in.m_93.x;
    float _6702 = in.m_93.y;
    float _6704 = in.m_93.z;
    float _6706 = in.m_93.w;
    bool _6708 = _5803 == 0.0;
    bool _6710 = !_6696;
    bool _6712 = _6708 && _6710;
    float _6714 = exp2(_6698);
    bool _6716 = _5807 == 0.0;
    bool _6718 = _6716 && _6712;
    out.m_95.x = _5663;
    out.m_95.y = _5655;
    out.m_95.z = _5675;
    bool _6720 = _6217 <= 8000.0;
    bool _6722 = isnan(_6217);
    bool _6724 = _6720 || _6722;
    bool _6726 = isnan(8000.0);
    bool _6728 = _6724 || _6726;
    float _6730 = float(_6728);
    float _6732 = _6680 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6734 = exp2(_6732);
    float _6736 = _6645;
    float _6738 = _6647;
    float _6740 = _6682;
    float _6742 = _6595;
    float _6744 = _6623;
    if (_6718)
    {
        _4117 = _6682;
    }
    float _6746 = _4117;
    float _6748 = -_6714;
    float _6750 = _6748 + 1.0;
    float _6752 = _6746;
    if (_6718)
    {
        _5651 = _6684;
    }
    float _6754 = _5651;
    float _6756 = _6754;
    if (_6718)
    {
        _4301 = _6686;
    }
    float _6758 = _4301;
    float _6760 = _6750 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6762 = _6758;
    if (_6718)
    {
        _6736 = _6746;
    }
    float _6764 = _6736;
    float _6766 = _6764;
    if (!_6718)
    {
        _6752 = _6682;
    }
    float _6768 = _6752;
    if (_6718)
    {
        _6738 = _6754;
    }
    float _6770 = _6738;
    float _6772 = _6770;
    if (_6718)
    {
        _6740 = _6758;
    }
    float _6774 = _6740;
    float _6776 = fma(_6734, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6778 = precise::clamp(_6776, 0.0, 1.0);
    float _6780 = _6774;
    if (!_6718)
    {
        _6756 = _6684;
    }
    float _6782 = _6756;
    if (!_6718)
    {
        float _6784 = fma(_5803, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6768);
        _6766 = _6784;
    }
    float _6786 = _6766;
    if (!_6718)
    {
        _6762 = _6686;
    }
    float _6788 = _6762;
    if (!_6718)
    {
        float _6790 = fma(_5805, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6782);
        _6772 = _6790;
    }
    float _6792 = _6772;
    float _6794 = _6704 * _6768;
    float _6796 = _6702 * _6788;
    float _6798 = _6700 * _6782;
    if (!_6718)
    {
        float _6800 = fma(_5807, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6788);
        _6780 = _6800;
    }
    float _6802 = _6780;
    float _6804 = -_6794;
    float _6806 = fma(_6700, _6788, _6804);
    float _6808 = -_6796;
    float _6810 = fma(_6704, _6782, _6808);
    float _6812 = fma(_6778, -2.0, 3.0);
    float _6814 = -_6798;
    float _6816 = fma(_6702, _6768, _6814);
    float _6818 = _6778 * _6778;
    float _6820 = _6806 * _6706;
    float _6822 = _6810 * _6706;
    float _6824 = _6816 * _6706;
    float _6826 = _6818 * _6812;
    float _6828 = _5875 * _5993;
    float _6830 = _5885 * _5949;
    float _6832 = _5885 * _5993;
    float _6834 = _5885 * _5943;
    float _6836 = _5875 * _5949;
    float _6838 = _5901 * _5949;
    float _6840 = _5901 * _5993;
    float _6842 = _5875 * _5943;
    float _6844 = _5901 * _5943;
    float _6846 = fma(_5909, _5927, _6828);
    float _6848 = -_5827;
    float _6850 = fma(_6848, _5925, _6830);
    float _6852 = -_5827;
    float _6854 = fma(_6852, _5927, _6832);
    float _6856 = -_5827;
    float _6858 = fma(_6856, _5929, _6834);
    float _6860 = -_6826;
    float _6862 = _6860 + 1.0;
    float _6864 = fma(_5909, _5925, _6836);
    float _6866 = fma(_5909, _5929, _6842);
    float _6868 = fma(_5921, _5927, _6840);
    float _6870 = fma(_6862, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6826);
    float _6872 = fma(_5921, _5925, _6838);
    float _6874 = fma(_5911, _5833, _6850);
    float _6876 = fma(_5911, _5837, _6854);
    float _6878 = fma(_5911, _5835, _6858);
    float _6880 = fma(_5921, _5929, _6844);
    float _6882 = fma(_5895, _5833, _6864);
    float _6884 = fma(_5895, _5837, _6846);
    float _6886 = fma(_5895, _5835, _6866);
    float _6888 = fma(_5877, _5837, _6868);
    float _6890 = fma(_5877, _5833, _6872);
    float _6892 = _6874 * _6702;
    float _6894 = _6876 * _6702;
    float _6896 = _6878 * _6702;
    float _6898 = fma(_5877, _5835, _6880);
    float _6900 = _6561 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6902 = _6820 * _6874;
    float _6904 = _6820 * _6876;
    float _6906 = _6730 * _6870;
    float _6908 = _6820 * _6878;
    float _6910 = _6874 * _6792;
    float _6912 = _6876 * _6792;
    float _6914 = fma(_6569, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6900);
    float _6916 = _6878 * _6792;
    float _6918 = fma(_6884, _6700, _6894);
    float _6920 = fma(_6822, _6882, _6902);
    float _6922 = fma(_6822, _6884, _6904);
    float _6924 = fma(_6822, _6886, _6908);
    float _6926 = fma(_6882, _6700, _6892);
    float _6928 = fma(_6882, _6786, _6910);
    float _6930 = fma(_6884, _6786, _6912);
    float _6932 = fma(_6519, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6914);
    float _6934 = fma(_6886, _6786, _6916);
    float _6936 = fma(_6888, _6704, _6918);
    float _6938 = fma(_6824, _6890, _6920);
    float _6940 = fma(_6824, _6888, _6922);
    float _6942 = fma(_6824, _6898, _6924);
    float _6944 = fma(_6573, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6932);
    float _6946 = in.m_97.x;
    float _6948 = fma(_6886, _6700, _6896);
    float _6950 = fma(_6890, _6704, _6926);
    float _6952 = _6944 + _6595;
    float _6954 = _6906 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6956 = fma(_6898, _6704, _6948);
    float _6958 = _6952 * 0.5;
    float _6960 = fma(_6888, _6802, _6930);
    out.gl_Position.x = _6621;
    out.gl_Position.y = _6623;
    out.gl_Position.z = _6944;
    out.gl_Position.w = _6595;
    float _6962 = fma(_6890, _6802, _6928);
    float _6964 = fma(_6898, _6802, _6934);
    out.m_99.x = _6950;
    out.m_99.y = _6936;
    out.m_99.z = _6956;
    bool _6966 = _6343 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6968 = isnan(_6343);
    bool _6970 = _6966 || _6968;
    bool _6972 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6974 = _6970 || _6972;
    float _6976 = _6321 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_101.x = _6938;
    out.m_101.y = _6940;
    out.m_101.z = _6942;
    out.m_103.z = _6958;
    out.m_103.w = _6595;
    out.m_105.x = _6962;
    out.m_105.y = _6960;
    out.m_105.z = _6964;
    float _6978 = _6802;
    float _6980 = _6944;
    float _6982 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_6974)
    {
        _6978 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6984 = _6978;
    float _6986 = _6984;
    float _6988 = _6984;
    if (!_6974)
    {
        _6742 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6990 = _6742;
    float _6992 = _6990;
    float _6994 = _6990;
    if (!_6974)
    {
        _6980 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6996 = _6980;
    float _6998 = _6996;
    float _7000 = _6996;
    if (!_6974)
    {
        _6744 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _7002 = _6744;
    float _7004 = -_6635;
    float _7006 = _7004 + 1.0;
    float _7008 = _7006 * _6954;
    float _7010 = precise::clamp(_7008, 0.0, 1.0);
    float _7012 = -_7010;
    float _7014 = fma(_7012, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _7016 = _7002;
    float _7018 = _7002;
    if (!_6974)
    {
        _6982 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _7020 = _6982;
    float _7022 = _7014 * _6946;
    float _7024 = _6760 * _6651;
    float _7026 = -_6760;
    float _7028 = _7026 + 1.0;
    float _7030 = _7022 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _7032 = _6662 * _7024;
    float _7034 = _6662 * _7028;
    out.m_107.x = _7030;
    float _7036 = _6676 * _7024;
    float _7038 = fma(_6672, _7032, _6656);
    float _7040 = fma(_6674, _7032, _6658);
    float _7042 = _7024;
    float _7044 = _7020;
    float _7046 = _7020;
    if (!_6974)
    {
        _7042 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _7048 = _7042;
    float _7050 = fma(_6662, _7036, _6660);
    out.m_109.x = _7038;
    out.m_109.y = _7040;
    out.m_109.z = _7050;
    out.m_109.w = _7034;
    bool _7052 = !_6974;
    float _7054 = _7048;
    float _7056 = _7048;
    if (!_7052)
    {
        bool _7058 = _6343 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _7060 = isnan(_6343);
        bool _7062 = _7058 || _7060;
        bool _7064 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _7066 = _7062 || _7064;
        if (!_7066)
        {
            float _7068 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7070 = _6343 + _7068;
            float _7072 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7074 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _7072;
            float _7076 = 1.0 / _7074;
            float _7078 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _7080 = _7078 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _7082 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _7084 = _7082 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _7086 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _7088 = _7086 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _7090 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _7092 = _7090 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _7094 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _7096 = _7094 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _7098 = _7070 * _7076;
            float _7100 = precise::clamp(_7098, 0.0, 1.0);
            float _7102 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _7104 = _7102 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _7106 = fma(_7100, _7084, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _7108 = fma(_7100, _7104, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _7110 = fma(_7100, _7080, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _7112 = fma(_7100, _7088, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _7114 = fma(_7100, _7092, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _7116 = fma(_7100, _7096, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _7018 = _7110;
            _6988 = _7114;
            _7000 = _7108;
            _7046 = _7112;
            _7056 = _7106;
            _6994 = _7116;
            _7118 = true;
        }
        else
        {
            bool _7120 = _6343 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _7122 = isnan(_6343);
            bool _7124 = _7120 || _7122;
            bool _7126 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _7128 = _7124 || _7126;
            if (!_7128)
            {
                _7044 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _7130 = _7044;
            _7046 = _7130;
            if (!_7128)
            {
                _6986 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _7132 = _6986;
            _6988 = _7132;
            if (!_7128)
            {
                _6992 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _7134 = _6992;
            _6994 = _7134;
            if (!_7128)
            {
                _6998 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _7136 = _6998;
            _7000 = _7136;
            if (!_7128)
            {
                _7016 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _7138 = _7016;
            _7018 = _7138;
            if (!_7128)
            {
                _7054 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _7140 = _7054;
            bool _7142 = !_7128;
            _7056 = _7140;
            if (!_7142)
            {
                bool _7144 = _6343 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _7146 = isnan(_6343);
                bool _7148 = _7144 || _7146;
                bool _7150 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _7152 = _7148 || _7150;
                if (!_7152)
                {
                    float _7154 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7156 = _6343 + _7154;
                    float _7158 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7160 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _7158;
                    float _7162 = 1.0 / _7160;
                    float _7164 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _7166 = _7164 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _7168 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _7170 = _7168 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _7172 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _7174 = _7172 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _7176 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _7178 = _7176 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _7180 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _7182 = _7180 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _7184 = _7156 * _7162;
                    float _7186 = precise::clamp(_7184, 0.0, 1.0);
                    float _7188 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _7190 = _7188 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _7192 = fma(_7186, _7170, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _7194 = fma(_7186, _7190, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _7196 = fma(_7186, _7166, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _7198 = fma(_7186, _7174, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _7200 = fma(_7186, _7178, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _7202 = fma(_7186, _7182, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _7018 = _7196;
                    _6988 = _7200;
                    _7000 = _7194;
                    _7046 = _7198;
                    _7056 = _7192;
                    _6994 = _7202;
                    _7118 = true;
                }
                else
                {
                    _7018 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6988 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _7000 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _7046 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _7056 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6994 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _7118 = false;
    float _7204 = _7018;
    float _7206 = _6988;
    float _7208 = _7000;
    float _7210 = _7046;
    float _7212 = _7056;
    float _7214 = _6994;
    float _7216 = fma(_6960, -0.5, 0.5);
    float _7218 = precise::clamp(_7216, 0.0, 1.0);
    float _7220 = -_7204;
    float _7222 = _7206 + _7220;
    float _7224 = _6976 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _7226 = -_7208;
    float _7228 = _7210 + _7226;
    float _7230 = fma(_7218, _7222, _7204);
    out.m_111.x = 0.0;
    float _7232 = -_7212;
    float _7234 = _7214 + _7232;
    float _7236 = fma(_7218, _7228, _7208);
    float _7238 = _7230 * 0.586610972881317138671875;
    out.m_49.x = _7224;
    bool _7240 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _7242 = fma(_7218, _7234, _7212);
    float _7244 = fma(_7236, 0.298911988735198974609375, _7238);
    bool _7246 = _6321 > 0.0;
    bool _7248 = isnan(_6321);
    bool _7250 = _7246 || _7248;
    bool _7252 = isnan(0.0);
    bool _7254 = _7250 || _7252;
    float _7256 = fma(_7242, 0.114477999508380889892578125, _7244);
    float _7258 = -_7256;
    float _7260 = _7236 + _7258;
    float _7262 = -_7256;
    float _7264 = _7230 + _7262;
    float _7266 = -_7256;
    float _7268 = _7242 + _7266;
    float _7270 = fma(_7260, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7256);
    float _7272 = fma(_7264, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7256);
    float _7274 = fma(_7268, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7256);
    bool _7276 = !_7240;
    if (!_7276)
    {
        float _7278 = -_6265;
        float _7280 = _7278 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _7282 = -_6267;
        float _7284 = _7282 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _7286 = -_6269;
        float _7288 = _7286 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _7290 = _7280 * _7280;
        float _7292 = fma(_7284, _7284, _7290);
        float _7294 = fma(_7288, _7288, _7292);
        float _7296 = sqrt(_7294);
        float _7298 = rsqrt(_7294);
        float _7300 = -_7296;
        float _7302 = _7300 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _7304 = _7302 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _7306 = precise::clamp(_7304, 0.0, 1.0);
        float _7308 = _7284 * _7298;
        float _7310 = _7280 * _7298;
        float _7312 = abs(_7306);
        float _7314 = log2(_7312);
        float _7316 = _7288 * _7298;
        float _7318 = _7308 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _7320 = _6960 * _7310;
        float _7322 = -_7310;
        float _7324 = -_7318;
        float _7326 = fma(_7322, (*spvDescriptorSet0.vp_c15)._m0[656].y, _7324);
        float _7328 = fma(_6962, _7308, _7320);
        float _7330 = -_7316;
        float _7332 = fma(_7330, (*spvDescriptorSet0.vp_c15)._m0[656].z, _7326);
        float _7334 = fma(_6964, _7316, _7328);
        float _7336 = precise::clamp(_7334, 0.0, 1.0);
        float _7338 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _7340 = _7332 + _7338;
        float _7342 = _7314 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _7344 = _7340 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _7346 = precise::clamp(_7344, 0.0, 1.0);
        float _7348 = exp2(_7342);
        float _7350 = _7348 * _7346;
        float _7352 = _7336 * _7350;
        float _7354 = _7352 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _7356 = _7352 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _7358 = _7352 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _7354;
        out.m_111.y = _7356;
        out.m_111.z = _7358;
    }
    out.m_113.x = _7270;
    out.m_113.y = _7272;
    out.m_113.z = _7274;
    if (_7254)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _7360 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _7360;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

