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
    float4 m_57 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_87 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_99 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_95 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 m_91 [[user(locn12)]];
    float4 m_93 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_61 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_73 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_53 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
    float4 m_75 [[attribute(11)]];
    float4 m_69 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4406 = false;
    bool _534 = false;
    bool _418 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_46.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_49.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4690 = as_type<float>(_134);
        out.gl_Position.z = _4690;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_51.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_118);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    if (_164)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _128;
    if (_164)
    {
        out.m_49.x = 0.0;
    }
    int _168 = 0;
    if (_164)
    {
        float _170 = _166 * 5.0;
        _168 = as_type<int>(_170);
    }
    int _172 = _168;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4759 = as_type<float>(_172);
        out.gl_Position.z = _4759;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _176 = !_174;
    float _194;
    if (!_176)
    {
        float _178 = in.m_53.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_118);
        float _200 = 1.0 / _198;
        float _202 = _150 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _204 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = _204 + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = _204 + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _226;
    float _230 = 1.0 / _224;
    bool _232 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _234 = 1.0 / _228;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _236;
    float _240 = 1.0 / _220;
    float _242 = _208 * _230;
    bool _244 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _246 = isnan(_204);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    bool _256 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _258 = isnan(_204);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = _212 * _234;
    bool _270 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _272 = isnan(_204);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -_254;
    float _284 = _282 + 1.0;
    float _286 = _280 * _284;
    bool _288 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _290 = isnan(_204);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = _216 * _240;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _306;
    float _310 = -_280;
    float _312 = _310 + 1.0;
    float _314 = fma(_238, _300, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _316 = fma(_304, _300, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _318 = fma(_308, _300, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _320 = -_266;
    float _322 = _320 + 1.0;
    float _324 = _266 * _312;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _334 = _298 * _322;
    float _336 = -_298;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _344 = _316 * _334;
    float _346 = _318 * _334;
    float _348 = _314 * _334;
    float _350 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _344);
    float _352 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _346);
    float _354 = fma(_342, _242, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _356 = fma(_328, _242, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _362;
    float _366 = fma(_332, _242, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _368 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _348);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _370;
    float _374 = fma(_354, _324, _350);
    float _376 = fma(_360, _268, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _378 = fma(_364, _268, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _380 = fma(_356, _324, _352);
    float _382 = fma(_372, _268, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _384 = fma(_366, _324, _368);
    float _386 = fma(_376, _286, _374);
    float _388 = fma(_378, _286, _380);
    float _390 = fma(_382, _286, _384);
    float _392 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[146].x, _386);
    float _394 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[146].y, _388);
    float _396 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[146].z, _390);
    bool _398 = !_232;
    float _416;
    if (!_398)
    {
        float _400 = in.m_53.x;
        float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _404 = _400 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _406 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _408 = _406 * _402;
        float _410 = floor(_408);
        float _412 = -_410;
        float _414 = _408 + _412;
        _416 = _414;
        _418 = true;
    }
    else
    {
        float _420 = float(_118);
        float _422 = 1.0 / _420;
        float _424 = _150 * _422;
        _416 = _424;
    }
    _418 = false;
    float _426 = _416;
    float _428 = in.m_55.x;
    float _430 = in.m_55.y;
    float _432 = in.m_55.z;
    bool _434 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _436 = isnan(_426);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _450 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _452 = isnan(_426);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _426 + _466;
    float _470 = -_444;
    float _472 = _470 + 1.0;
    bool _474 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _476 = 1.0 / _448;
    float _478 = _460 * _472;
    float _480 = -_460;
    float _482 = _480 + 1.0;
    float _484 = _396 * _432;
    float _486 = _392 * _428;
    float _488 = _464 * _476;
    float _490 = fma(_488, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _494 = _490 * _478;
    float _496 = _394 * _430;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _500 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _502 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[115].x, _494);
    float _504 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[116].x, _502);
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _510 = _506 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _512 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _504;
    out.m_57.y = _500;
    out.m_57.z = _512;
    out.m_57.w = _510;
    bool _514 = !_474;
    float _532;
    if (!_514)
    {
        float _516 = in.m_53.x;
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _520 = _516 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _524 = _522 * _518;
        float _526 = floor(_524);
        float _528 = -_526;
        float _530 = _524 + _528;
        _532 = _530;
        _534 = true;
    }
    else
    {
        float _536 = float(_118);
        float _538 = 1.0 / _536;
        float _540 = _150 * _538;
        _532 = _540;
    }
    _534 = false;
    float _542 = _532;
    float _544 = in.m_53.y;
    float _546 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _548 = log2(_546);
    float _550 = in.m_53.x;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _556 = _554 != 0;
    float _558 = in.m_53.z;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _562 = in.m_46.x;
    float _564 = in.m_46.y;
    float _566 = in.m_46.z;
    float _568 = float(_118);
    float _570 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _572 = int(_570);
    float _574 = in.m_59.x;
    float _576 = in.m_59.y;
    float _578 = in.m_59.z;
    float _580 = in.m_59.w;
    float _582 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _584 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _586 = in.m_61.x;
    float _588 = in.m_61.y;
    float _590 = in.m_61.z;
    float _592 = in.m_61.w;
    float _594 = 1.0 / _568;
    float _596 = in.m_63.x;
    float _598 = in.m_63.y;
    float _600 = in.m_63.z;
    float _602 = in.m_63.w;
    float _604 = _544 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _606 = _544 * 2.0;
    float _608 = _550 * 2.0;
    float _610 = fma(_604, -2.0, _552);
    float _612 = _550 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _614 = _558 * 2.0;
    float _616 = floor(_608);
    float _618 = -_560;
    float _620 = fma(_612, 2.0, _618);
    float _622 = _550 + _544;
    float _624 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _610);
    float _626 = -_150;
    float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[76].x, _620);
    float _630 = _622 + (-1.0);
    float _632 = _564 * _576;
    float _634 = floor(_606);
    float _636 = _544 + _558;
    float _638 = _564 * _588;
    float _640 = fma(_562, _574, _632);
    float _642 = _636 + (-1.0);
    float _644 = _564 * _598;
    float _646 = floor(_614);
    float _648 = fma(_562, _586, _638);
    float _650 = fma(_566, _578, _640);
    float _652 = fma(_562, _596, _644);
    float _654 = fma(_566, _590, _648);
    bool _656 = _616 >= 0.0;
    bool _658 = isnan(_616);
    bool _660 = _656 || _658;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    float _666 = fma(_566, _600, _652);
    float _668 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _670 = as_type<int>(_630);
    int _672 = as_type<int>(_642);
    float _674 = _550;
    if (_556)
    {
        _670 = 0;
    }
    int _676 = _670;
    float _678 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _680 = int(_678);
    int _682 = _676;
    if (!_556)
    {
        _682 = 2;
    }
    int _684 = _682;
    float _686 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _688 = _634 >= 0.0;
    bool _690 = isnan(_634);
    bool _692 = _688 || _690;
    bool _694 = isnan(0.0);
    bool _696 = _692 || _694;
    float _698 = _650 + _580;
    if (_556)
    {
        _672 = 0;
    }
    int _700 = _672;
    float _702 = _654 + _592;
    bool _704 = _646 > 0.0;
    float _706 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _708 = int(_706);
    bool _710 = _646 >= 0.0;
    bool _712 = isnan(_646);
    bool _714 = _710 || _712;
    bool _716 = isnan(0.0);
    bool _718 = _714 || _716;
    float _720 = -_702;
    float _722 = _720 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _724 = _700;
    if (!_556)
    {
        _724 = 1;
    }
    int _726 = _724;
    float _728 = -_698;
    float _730 = _728 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _732 = _664 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _734 = _594 * _150;
    bool _736 = _634 > 0.0;
    bool _738 = _684 != 2;
    float _740 = _696 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _742 = _726 != 1;
    bool _744 = _616 > 0.0;
    int _746 = ~as_type<int>(_740);
    int _748 = _746 + 1;
    int _750 = _748 + 1;
    int _752 = _750;
    float _754 = _740;
    float _756 = as_type<float>(_726);
    float _758 = _732;
    if (!_736)
    {
        int _760 = ~as_type<int>(_740);
        int _762 = _760 + 1;
        _752 = _762;
    }
    int _764 = _752;
    if (_738)
    {
        _754 = _550;
    }
    float _766 = _754;
    float _768 = _766;
    if (!_738)
    {
        _768 = _558;
    }
    float _770 = _768;
    if (!_742)
    {
        _756 = _544;
    }
    float _772 = _756;
    int _774 = ~as_type<int>(_732);
    int _776 = _774 + 1;
    int _778 = _776 + 1;
    float _780 = _770 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _784 = _778;
    float _786 = _772;
    float _788 = _782;
    if (!_744)
    {
        int _790 = ~as_type<int>(_732);
        int _792 = _790 + 1;
        _784 = _792;
    }
    int _794 = _784;
    float _796 = _666 + _602;
    int _798 = _718 ? 0 : 1;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _804 = _802 != 0;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _808 = _806 != 0;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _812 = _810 != 0;
    float _814 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _816 = int(_814);
    if (!_742)
    {
        _758 = _772;
    }
    float _818 = _758;
    float _820 = -_800;
    float _822 = fma(_780, 2.0, _820);
    float _824 = _818;
    if (_742)
    {
        _786 = _550;
    }
    float _826 = _786;
    float _828 = -_796;
    float _830 = _828 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _832 = !_808;
    int _834 = _832 ? 0 : 1;
    float _836 = -_150;
    float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[86].x, _822);
    bool _840 = !_804;
    int _842 = _840 ? 0 : 1;
    float _844 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[83].z, _782);
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _852 = _850 != 0;
    float _854 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _844);
    if (_742)
    {
        _824 = _550;
    }
    float _856 = _824;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _860 = ~_798;
    int _862 = _860 + 1;
    int _864 = _862 + 1;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _868 = _864;
    float _870 = _866;
    if (!_704)
    {
        int _872 = ~_798;
        int _874 = _872 + 1;
        _868 = _874;
    }
    int _876 = _868;
    float _878 = _856 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _880 = !_812;
    int _882 = _880 ? 0 : 1;
    bool _884 = !_852;
    int _886 = _884 ? 0 : 1;
    float _888 = -_858;
    float _890 = fma(_878, 2.0, _888);
    float _892 = _878;
    if (!_742)
    {
        _788 = _558;
    }
    float _894 = _788;
    bool _896 = !_848;
    int _898 = _896 ? 0 : 1;
    float _900 = -_150;
    float _902 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[81].x, _890);
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _906 = _904 != 0;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _910 = _908 != 0;
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _914 = _912 != 0;
    float _916 = _894;
    if (_742)
    {
        _916 = _544;
    }
    float _918 = _916;
    float _920 = float(_876);
    bool _922 = !_906;
    int _924 = _922 ? 0 : 1;
    float _926 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[83].w, _866);
    if (!_742)
    {
        _870 = _558;
    }
    float _928 = _870;
    float _930 = in.m_65.x;
    float _932 = in.m_65.y;
    float _934 = in.m_65.z;
    int _936 = abs(_924);
    float _938 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _926);
    float _940 = _928;
    if (_742)
    {
        _940 = _544;
    }
    float _942 = _940;
    float _944 = float(_936);
    if (_738)
    {
        _892 = _544;
    }
    float _946 = _892;
    float _948 = _942 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _950 = float(_680);
    float _952 = _944 * _920;
    float _954 = _946;
    if (!_738)
    {
        _954 = _550;
    }
    float _956 = _954;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _960 = 1.0 / _950;
    float _962 = _956 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _964 = _952 * (-2.0);
    float _966 = fma(_948, -2.0, _958);
    float _968 = _548 * _150;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _972 = fma(_668, _964, _668);
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _976 = fma(_964, _930, _930);
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _980 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[78].w, _974);
    float _982 = fma(_962, -2.0, _970);
    float _984 = float(_816);
    float _986 = exp2(_968);
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _990 = _960 * _150;
    float _992 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _980);
    float _994 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[88].z, _978);
    bool _996 = !_914;
    int _998 = _996 ? 0 : 1;
    float _1000 = 1.0 / _984;
    float _1002 = float(_708);
    float _1004 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[78].z, _988);
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1008 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _994);
    int _1010 = abs(_998);
    float _1012 = _722 * _722;
    float _1014 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1004);
    float _1016 = 1.0 / _1002;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1020 = 1.0 + _1018;
    bool _1022 = !_910;
    int _1024 = _1022 ? 0 : 1;
    float _1026 = -_986;
    float _1028 = _1026 + 1.0;
    bool _1030 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1032 = isnan(1.0);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1038 = _1034 || _1036;
    float _1040 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1006);
    int _1042 = abs(_1024);
    float _1044 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _966);
    float _1046 = 1.0 / _1020;
    bool _1048 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1050 = isnan(0.0);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1056 = _1052 || _1054;
    float _1058 = _550 + (-0.5);
    float _1060 = float(_1042);
    float _1062 = _1000 * _150;
    float _1064 = float(_572);
    float _1066 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1040);
    float _1068 = _1056 ? _1028 : 0.0;
    float _1070 = _1016 * _150;
    float _1072 = float(_794);
    float _1074 = _1064 * _150;
    float _1076 = fma(_730, _730, _1012);
    float _1078 = float(_764);
    float _1080 = _1060 * _1072;
    float _1082 = float(_1010);
    float _1084 = fma(_830, _830, _1076);
    float _1086 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _982);
    if (_1038)
    {
        float _1088 = _1068 * _1046;
        _154 = _1088;
    }
    float _1090 = _154;
    float _1092 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[196].x, _976);
    float _1094 = rsqrt(_1084);
    float _1096 = _550 + _558;
    float _1098 = _1080 * (-2.0);
    float _1100 = _1082 * _1078;
    float _1102 = fma(_972, _1090, _1092);
    float _1104 = _544 + (-0.5);
    float _1106 = _1096 + (-1.0);
    float _1108 = fma(_1098, _932, _932);
    float _1110 = _1102 * 0.15915493667125701904296875;
    float _1112 = _1100 * (-2.0);
    float _1114 = fma(_686, _1098, _686);
    float _1116 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1108);
    float _1118 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1120 = fma(_1112, _934, _934);
    float _1122 = _558 + (-0.5);
    float _1124 = _730 * _1094;
    float _1126 = fma(_1114, _1090, _1116);
    float _1128 = fma(_1118, _1112, _1118);
    float _1130 = _830 * _1094;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1134 = _1124 * _1132;
    float _1136 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1120);
    float _1138 = _1126 * 0.15915493667125701904296875;
    float _1140 = _722 * _1094;
    float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1144 = _1130 * _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1148 = -_1134;
    float _1150 = fma(_1130, _1146, _1148);
    float _1152 = in.m_67.x;
    float _1154 = in.m_67.y;
    float _1156 = in.m_67.z;
    float _1158 = _1110 * 6.283185482025146484375;
    float _1160 = sin(_1158);
    float _1162 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1164 = -_1144;
    float _1166 = fma(_1140, _1162, _1164);
    float _1168 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1170 = _1110 * 6.283185482025146484375;
    float _1172 = cos(_1170);
    float _1174 = _1138 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    float _1178 = fma(_1128, _1090, _1136);
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1182 = _1140 * _1180;
    float _1184 = _1150 * _1150;
    float _1186 = _1178 * 0.15915493667125701904296875;
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1190 = -_1182;
    float _1192 = fma(_1124, _1188, _1190);
    float _1194 = fma(_1166, _1166, _1184);
    float _1196 = _1138 * 6.283185482025146484375;
    float _1198 = cos(_1196);
    float _1200 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1152);
    float _1202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1156);
    float _1204 = fma(_1192, _1192, _1194);
    float _1206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1154);
    float _1208 = _1200 * _582;
    float _1210 = _1202 * _584;
    float _1212 = _1186 * 6.283185482025146484375;
    float _1214 = cos(_1212);
    float _1216 = _1206 * _1168;
    float _1218 = _1160 * _1176;
    float _1220 = _1172 * _1176;
    float _1222 = rsqrt(_1204);
    float _1224 = _1172 * _1198;
    float _1226 = _1160 * _1198;
    float _1228 = _1186 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    float _1232 = _1172 * _1214;
    float _1234 = _1160 * _1214;
    float _1236 = _1198 * _1214;
    float _1238 = _1176 * _1214;
    float _1240 = _1232 * _1216;
    float _1242 = _1166 * _1222;
    float _1244 = _1150 * _1222;
    float _1246 = _1192 * _1222;
    float _1248 = _1140 * _1242;
    float _1250 = _1130 * _1244;
    float _1252 = fma(_1230, _1224, _1218);
    float _1254 = -_1220;
    float _1256 = fma(_1230, _1226, _1254);
    float _1258 = -_1216;
    float _1260 = _1230 * _1258;
    float _1262 = -_1226;
    float _1264 = fma(_1230, _1220, _1262);
    float _1266 = fma(_1252, _1208, _1240);
    float _1268 = fma(_1230, _1218, _1224);
    float _1270 = _1234 * _1216;
    float _1272 = fma(_1236, _1208, _1260);
    float _1274 = -_1248;
    float _1276 = fma(_1124, _1244, _1274);
    float _1278 = fma(_1264, _1210, _1266);
    float _1280 = fma(_1256, _1208, _1270);
    float _1282 = -_1250;
    float _1284 = fma(_1140, _1246, _1282);
    float _1286 = fma(_1238, _1210, _1272);
    float _1288 = _1276 * _1278;
    float _1290 = fma(_1268, _1210, _1280);
    float _1292 = _1284 * _1278;
    float _1294 = fma(_1246, _1286, _1288);
    float _1296 = fma(_1242, _1286, _1292);
    float _1298 = fma(_1130, _1290, _1294);
    float _1300 = fma(_1124, _1290, _1296);
    float _1302 = _796 + _1298;
    float _1304 = _698 + _1300;
    float _1306 = _1124 * _1246;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1310 = _1302 + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1314 = _1304 + _1312;
    float _1316 = -_1306;
    float _1318 = fma(_1130, _1242, _1316);
    float _1320 = _1310 * _1310;
    float _1322 = _1318 * _1278;
    float _1324 = fma(_1314, _1314, _1320);
    float _1326 = fma(_1244, _1286, _1322);
    float _1328 = sqrt(_1324);
    float _1330 = fma(_1140, _1290, _1326);
    float _1332 = _702 + _1330;
    bool _1334 = _1328 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1338 = _1336 != 0;
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1342 = _1340 != 0;
    int _1344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1346 = _1344 != 0;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1350 = _1348 != 0;
    bool _1352 = !_1342;
    int _1354 = _1352 ? 0 : 1;
    bool _1356 = !_1338;
    int _1358 = _1356 ? 0 : 1;
    bool _1360 = !_1346;
    int _1362 = _1360 ? 0 : 1;
    bool _1364 = !_1350;
    int _1366 = _1364 ? 0 : 1;
    float _1368 = _1330;
    float _1370 = _1290;
    float _1372 = _1306;
    float _1374 = _1332;
    float _1376 = _1310;
    bool _1378 = _1350;
    if (!_1334)
    {
        _1368 = _1304;
    }
    float _1380 = _1368;
    float _1382 = _1380;
    if (!_1334)
    {
        _1370 = _1302;
    }
    float _1384 = _1370;
    float _1386 = _1384;
    if (!_1334)
    {
        _1372 = _1332;
    }
    float _1388 = _1372;
    bool _1390 = !_1334;
    float _1392 = _1388;
    if (!_1390)
    {
        float _1394 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1398 = _1328 + _1396;
        float _1400 = _1332 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = rsqrt(_1324);
        float _1404 = _1398 * _1394;
        float _1406 = _1404 * 0.15915493667125701904296875;
        float _1408 = _1406 * 6.283185482025146484375;
        float _1410 = cos(_1408);
        float _1412 = _1406 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        float _1416 = _1410 + (-1.0);
        float _1418 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1420 = fma(_1414, _1400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1422 = fma(_1332, _1410, _1418);
        float _1424 = _1402 * _1420;
        float _1426 = fma(_1314, _1424, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1428 = fma(_1310, _1424, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1392 = _1422;
        _1382 = _1426;
        _1386 = _1428;
    }
    float _1430 = _1392;
    float _1432 = _1382;
    float _1434 = _1386;
    float _1436 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1438 = _1430 + _1436;
    float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1442 = _1432 + _1440;
    float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1446 = _1434 + _1444;
    float _1448 = _1438 * _1438;
    float _1450 = fma(_1442, _1442, _1448);
    float _1452 = fma(_1446, _1446, _1450);
    float _1454 = rsqrt(_1452);
    float _1456 = sqrt(_1452);
    float _1458 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1460 = _1442 * _1458;
    float _1462 = _1446 * _1458;
    float _1464 = _1460 * _1460;
    float _1466 = _1462 * _1462;
    float _1468 = _1464 + _1466;
    float _1470 = sqrt(_1468);
    bool _1472 = _1470 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1476 = _1470 + _1474;
    float _1478 = _1446;
    float _1480 = _1476;
    float _1482 = _1438;
    float _1484 = _1448;
    if (_1472)
    {
        float _1486 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1478 = _1486;
    }
    float _1488 = _1478;
    if (_1472)
    {
        float _1490 = rsqrt(_1468);
        _1374 = _1490;
    }
    float _1492 = _1374;
    float _1494 = _1492;
    if (_1472)
    {
        float _1496 = _1476 * _1488;
        _1480 = _1496;
    }
    float _1498 = _1480;
    if (_1472)
    {
        float _1500 = _1498 * 0.15915493667125701904296875;
        _1376 = _1500;
    }
    float _1502 = _1376;
    float _1504 = _1454;
    float _1506 = _1502;
    if (_1472)
    {
        float _1508 = _1502 * 6.283185482025146484375;
        float _1510 = sin(_1508);
        _1504 = _1510;
    }
    float _1512 = _1504;
    float _1514 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1516 = precise::max(0.0, _1514);
    float _1518 = _1314;
    float _1520 = _1516;
    if (_1472)
    {
        float _1522 = _1502 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        _1518 = _1524;
    }
    float _1526 = _1518;
    float _1528 = -_1458;
    float _1530 = -_1516;
    float _1532 = fma(_1438, _1528, _1530);
    if (!_1472)
    {
        _1482 = _1460;
    }
    float _1534 = _1482;
    float _1536 = fma(_698, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1538 = _1534;
    if (_1472)
    {
        float _1540 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1520 = _1540;
    }
    float _1542 = _1520;
    float _1544 = _1512;
    if (_1472)
    {
        float _1546 = fma(_1512, _1542, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1484 = _1546;
    }
    float _1548 = _1484;
    float _1550 = floor(_1536);
    float _1552 = _1548;
    float _1554 = _1526;
    if (_1472)
    {
        float _1556 = _1526 + (-1.0);
        _1544 = _1556;
    }
    float _1558 = _1544;
    float _1560 = 0.0;
    float _1562 = _1558;
    if (_1472)
    {
        float _1564 = _1492 * _1548;
        _1560 = _1564;
    }
    float _1566 = _1560;
    if (!_1472)
    {
        _1494 = _1532;
    }
    float _1568 = _1494;
    float _1570 = _1568;
    if (_1472)
    {
        float _1572 = _1558 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1506 = _1572;
    }
    float _1574 = _1506;
    if (_1472)
    {
        float _1576 = _1460 * _1566;
        _1538 = _1576;
    }
    float _1578 = _1538;
    if (!_1472)
    {
        _1562 = _1462;
    }
    float _1580 = _1562;
    float _1582 = _1580;
    if (_1472)
    {
        float _1584 = _1462 * _1566;
        _1582 = _1584;
    }
    float _1586 = _1582;
    if (!_1472)
    {
        _1552 = _1464;
    }
    float _1588 = _1552;
    float _1590 = _1588;
    if (_1472)
    {
        float _1592 = fma(_1532, _1526, _1574);
        _1570 = _1592;
    }
    float _1594 = _1570;
    if (_1472)
    {
        float _1596 = _1578 * _1578;
        _1590 = _1596;
    }
    float _1598 = _1590;
    if (!_1472)
    {
        _1554 = _1466;
    }
    float _1600 = _1554;
    float _1602 = _1600;
    if (_1472)
    {
        float _1604 = _1586 * _1586;
        _1602 = _1604;
    }
    float _1606 = _1602;
    float _1608 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1610 = fma(_1594, _1594, _1598);
    float _1612 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1614 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1616 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1608);
    float _1618 = _1610 + _1606;
    float _1620 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1624 = fma(_1456, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1622);
    float _1626 = precise::clamp(_1624, 0.0, 1.0);
    float _1628 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1612);
    float _1630 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1616);
    float _1632 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1620);
    float _1634 = rsqrt(_1618);
    float _1636 = -_1626;
    float _1638 = _1636 + 1.0;
    float _1640 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1628);
    float _1642 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1632);
    float _1644 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1646 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1614);
    float _1648 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1650 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1652 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1654 = abs(_1638);
    float _1656 = log2(_1654);
    float _1658 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1660 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1662 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1646);
    float _1664 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1652);
    float _1666 = _1634 * _1578;
    float _1668 = -_1660;
    float _1670 = fma(_1668, _1658, 1.0);
    float _1672 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1674 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1664);
    float _1676 = _1634 * _1594;
    float _1678 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1680 = _1634 * _1586;
    float _1682 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1674);
    float _1684 = fma(_796, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1686 = -_1678;
    float _1688 = fma(_1676, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1686);
    float _1690 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1692 = -_1550;
    float _1694 = _1536 + _1692;
    float _1696 = floor(_1684);
    float _1698 = -_1680;
    float _1700 = fma(_1698, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1688);
    float _1702 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1704 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1706 = fma(_1700, -0.5, 0.5);
    float _1708 = fma(_1700, 0.5, 0.5);
    float _1710 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1702);
    float _1712 = exp2(_1690);
    float _1714 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1704);
    float _1716 = _1676 + 1.0;
    float _1718 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1710);
    float _1720 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1714);
    float _1722 = log2(_1670);
    float _1724 = -_1696;
    float _1726 = _1684 + _1724;
    float _1728 = fma(_1708, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1730 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1718);
    float _1732 = fma(_1708, _1728, -0.212114393711090087890625);
    float _1734 = 1.0 / _1682;
    float _1736 = -_1676;
    float _1738 = fma(_1712, _1716, _1736);
    float _1740 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1720);
    float _1742 = fma(_1708, _1732, 1.570728778839111328125);
    float _1744 = fma(_1738, 0.5, 0.5);
    float _1746 = sqrt(_1706);
    float _1748 = _1722 * 0.693147182464599609375;
    float2 _7250 = float2(_1694, _1726);
    float _1750 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7250, float2(0.0), isnan(_7250)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7250, float2(0.0), isnan(_7250)), level(0.0)).x;
    float _1752 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1754 = _1730 * _1734;
    float _1756 = _1740 * _1734;
    float _1758 = fma(_1754, 0.5, 0.5);
    float _1760 = fma(_1756, -0.5, 0.5);
    float _1762 = _1746 * 0.636619746685028076171875;
    float _1764 = -_1742;
    float _1766 = fma(_1762, _1764, 1.0);
    float3 _7283 = float3(_1758, _1760, _1752);
    float _1768 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7283, float3(0.0), isnan(_7283)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7283, float3(0.0), isnan(_7283)), level(0.0)).x;
    float3 _7294 = float3(_1758, _1760, _1752);
    float4 _1771 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7294, float3(0.0), isnan(_7294)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7294, float3(0.0), isnan(_7294)), level(0.0)).xyzw;
    float _1773 = _1771.x;
    float _1775 = _1771.y;
    float _1777 = _1771.z;
    float _1779 = _1771.w;
    float2 _7310 = float2(_1766, _1744);
    float3 _1783 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7310, float2(0.0), isnan(_7310)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7310, float2(0.0), isnan(_7310)), level(0.0)).xyz;
    float _1785 = _1783.x;
    float _1787 = _1783.y;
    float _1789 = _1783.z;
    float _1791 = in.m_69.x;
    float _1793 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1795 = int(_1793);
    float _1797 = _1074 * _594;
    float _1799 = in.m_53.w;
    float _1801 = _1264 * _1284;
    float _1803 = float(uint(_572));
    float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1807 = _1805 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1811 = _1809 != 0;
    float _1813 = trunc(_990);
    int _1815 = int(_1813);
    int _1817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1819 = _1817 != 0;
    float _1821 = _1264 * _1318;
    bool _1823 = _544 > 0.5;
    float _1825 = _1264 * _1276;
    bool _1827 = _558 > 0.5;
    float _1829 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1831 = float(uint(_1795));
    float _1833 = 1.0 / _1803;
    float _1835 = fma(_1238, _1246, _1825);
    int _1837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1839 = _1837 != 0;
    out.m_71.x = _1432;
    out.m_71.y = _1430;
    out.m_71.z = _1434;
    float _1841 = _1758;
    float _1843 = _1803;
    float _1845 = _1682;
    float _1847 = _1740;
    if (_1811)
    {
        bool _1849 = _550 > 0.5;
        _1378 = _1849;
    }
    bool _1851 = _1378;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1855 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1853;
    if (_1819)
    {
        _1841 = 1.0;
    }
    float _1857 = _1841;
    float _1859 = 1.0 / _1831;
    float _1861 = _1857;
    if (!_1811)
    {
        _1843 = _1791;
    }
    float _1863 = _1843;
    float _1865 = _1863;
    if (!_1819)
    {
        _1861 = 7.345489978790283203125;
    }
    float _1867 = _1861;
    bool _1869 = _1799 > 0.5;
    float _1871 = _1799;
    if (!_1811)
    {
        _1871 = _1863;
    }
    float _1873 = _1871;
    float _1875 = trunc(_1070);
    int _1877 = int(_1875);
    float _1879 = _1873;
    if (_1811)
    {
        _1865 = _1791;
    }
    float _1881 = _1865;
    float _1883 = _1867 * _550;
    int _1885 = as_type<int>(_1833) + (-2);
    float _1887 = float(uint(_1815));
    float _1889 = 0.0;
    if (_1819)
    {
        _1889 = _550;
    }
    float _1891 = _1889;
    float _1893 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1895 = int(_1893);
    float _1897 = 0.0;
    float _1899 = _1891;
    if (_1819)
    {
        _1897 = 1.0;
    }
    float _1901 = _1897;
    float _1903 = as_type<float>(_1885) * _1887;
    float _1905 = _1901;
    if (!_1819)
    {
        _1899 = _544;
    }
    float _1907 = _1899;
    if (!_1819)
    {
        _1905 = 1.2345600128173828125;
    }
    float _1909 = _1905;
    float _1911 = in.m_69.y;
    int _1913 = as_type<int>(_1859) + (-2);
    float _1915 = trunc(_1903);
    float _1917 = precise::max(_1915, 0.0);
    uint _1920 = uint(_1917);
    float _1922 = float(uint(_1877));
    float _1924 = _1907 * _1909;
    float _1926 = 0.0;
    int _1928 = as_type<int>(_1922);
    if (_1819)
    {
        _1926 = 1.0;
    }
    float _1930 = _1926;
    float _1932 = _1930;
    if (!_1819)
    {
        _674 = _558;
    }
    float _1934 = _674;
    float _1936 = as_type<float>(_1913) * _1922;
    if (!_1819)
    {
        _1932 = 5.839270114898681640625;
    }
    float _1938 = _1932;
    float _1940 = 1.0 / _1807;
    float _1942 = float(uint(_1895));
    if (_1811)
    {
        float _1944 = -_1881;
        float _1946 = _1944 + 1.0;
        _1928 = as_type<int>(_1946);
    }
    int _1948 = _1928;
    int _1950 = ~_572;
    int _1952 = _1950 + 1;
    float _1954 = _1934 * _1938;
    int _1956 = ~_1795;
    int _1958 = _1956 + 1;
    if (_1811)
    {
        float _1960 = _1851 ? as_type<float>(_1948) : _1881;
        _1879 = _1960;
    }
    float _1962 = _1879;
    float _1964 = trunc(_1936);
    float _1966 = precise::max(_1964, 0.0);
    uint _1968 = uint(_1966);
    int _1970 = _1952 * int(_1920);
    int _1972 = _1970 + _1815;
    int _1974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1976 = _1974 != 0;
    int _1978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1980 = _1978 != 0;
    float _1982 = float(uint(_1972));
    float _1984 = -_1911;
    float _1986 = _1984 + 1.0;
    float _1988 = 1.0 / _1942;
    float _1990 = _1855 * _1940;
    int _1992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1994 = _1992 != 0;
    float _1996 = as_type<float>(_1885) * _1982;
    int _1998 = _1869 ? as_type<int>(_1986) : as_type<int>(_1911);
    int _2000 = _1823 ? as_type<int>(_1986) : as_type<int>(_1911);
    float _2002 = trunc(_1062);
    int _2004 = int(_2002);
    int _2006 = _1958 * int(_1968);
    int _2008 = _2006 + _1877;
    float _2010 = _1839 ? as_type<float>(_1998) : _1911;
    int _2012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2014 = _2012 != 0;
    float _2016 = float(uint(_2008));
    int _2018 = as_type<int>(_1988) + (-2);
    float _2020 = trunc(_1996);
    float _2022 = precise::max(_2020, 0.0);
    uint _2024 = uint(_2022);
    int _2026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2028 = _2026 != 0;
    float _2030 = as_type<float>(_1913) * _2016;
    float _2032 = _1976 ? as_type<float>(_2000) : _1911;
    float _2034 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2036 = _542 + _2034;
    int _2038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2040 = _2038 != 0;
    float _2042 = float(uint(_2004));
    float _2044 = floor(_1883);
    int _2046 = as_type<int>(_1996);
    float _2048 = _2036;
    float _2050 = _1911;
    if (_1980)
    {
        float _2052 = -_1881;
        float _2054 = _2052 + 1.0;
        _2046 = as_type<int>(_2054);
    }
    int _2056 = _2046;
    float _2058 = fma(_1990, _2036, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2060 = float(_1815);
    float _2062 = as_type<float>(_2018) * _2042;
    if (!_1980)
    {
        _2048 = _1881;
    }
    float _2064 = _2048;
    float _2066 = _2064;
    if (_1980)
    {
        float _2068 = _1827 ? as_type<float>(_2056) : _1881;
        _2066 = _2068;
    }
    float _2070 = _2066;
    float _2072 = floor(_1924);
    bool _2074 = _2060 >= _1064;
    bool _2076 = isnan(_2060);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan(_1064);
    bool _2082 = _2078 || _2080;
    float _2084 = float(_2082);
    if (_2040)
    {
        float _2086 = _1827 ? _1986 : _1911;
        _2050 = _2086;
    }
    float _2088 = _2050;
    int _2090 = int(_1920) + int(_2024);
    int _2092 = ~_572;
    int _2094 = _2092 + 1;
    float _2096 = floor(_1954);
    float _2098 = -_2044;
    float _2100 = _1883 + _2098;
    int _2102 = ~_1795;
    int _2104 = _2102 + 1;
    int _2106 = _2094 * _2090;
    int _2108 = _2106 + _1815;
    float _2110 = _2100 * _1064;
    float _2112 = float(_1877);
    float _2114 = trunc(_2030);
    float _2116 = precise::max(_2114, 0.0);
    uint _2118 = uint(_2116);
    float _2120 = -_2072;
    float _2122 = _1924 + _2120;
    int _2124 = ~_1895;
    int _2126 = _2124 + 1;
    float _2128 = float(_1895);
    int _2130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2132 = _2130 != 0;
    float _2134 = trunc(_2062);
    float _2136 = precise::max(_2134, 0.0);
    uint _2138 = uint(_2136);
    float _2140 = -_2096;
    float _2142 = _1954 + _2140;
    float _2144 = float(_1795);
    float _2146 = float(_2004);
    bool _2148 = uint(_2108) >= uint(_572);
    float _2150 = _2144 * _2122;
    int _2152 = int(_1968) + int(_2118);
    float _2154 = trunc(_2110);
    int _2156 = int(_2154);
    bool _2158 = _2112 >= _2144;
    bool _2160 = isnan(_2112);
    bool _2162 = _2158 || _2160;
    bool _2164 = isnan(_2144);
    bool _2166 = _2162 || _2164;
    float _2168 = float(_2166);
    float _2170 = _2144 * _734;
    int _2172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2174 = _2172 != 0;
    int _2176 = abs(_834);
    int _2178 = abs(_1354);
    float _2180 = trunc(_2084);
    int _2182 = int(_2180);
    int _2184 = _2104 * _2152;
    int _2186 = _2184 + _1877;
    int _2188 = abs(_1358);
    int _2190 = abs(_1362);
    int _2192 = abs(_886);
    float _2194 = trunc(_2150);
    int _2196 = int(_2194);
    int _2198 = _2126 * int(_2138);
    int _2200 = _2198 + _2004;
    bool _2202 = _2146 >= _2128;
    bool _2204 = isnan(_2146);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan(_2128);
    bool _2210 = _2206 || _2208;
    float _2212 = float(_2210);
    bool _2214 = !_2148;
    int _2216 = _2214 ? 0 : (-1);
    float _2218 = float(uint(_2200));
    float _2220 = _2128 * _734;
    bool _2222 = !_2132;
    int _2224 = _2222 ? 0 : 1;
    float _2226 = trunc(_2168);
    int _2228 = int(_2226);
    bool _2230 = uint(_2186) >= uint(_1795);
    float _2232 = as_type<float>(_2018) * _2218;
    bool _2234 = !_2174;
    int _2236 = _2234 ? 0 : 1;
    float _2238 = _2128 * _2142;
    int _2240 = ~_2090;
    int _2242 = _2240 + _2216;
    int _2244 = _2242 + 1;
    int _2246 = abs(_2236);
    float _2248 = trunc(_1797);
    int _2250 = int(_2248);
    bool _2252 = !_2230;
    int _2254 = _2252 ? 0 : (-1);
    int _2256 = _572 * _2244;
    int _2258 = _2256 + _1815;
    int _2260 = abs(_2224);
    bool _2262 = _572 == 0;
    int _2264 = ~_2152;
    int _2266 = _2264 + _2254;
    int _2268 = _2266 + 1;
    int _2270 = _2156 * _2260;
    int _2272 = _2270 + _1815;
    int _2274 = ~_2182;
    int _2276 = _2274 + 1;
    int _2278 = _2276 + 1;
    int _2280 = _2196 * _2246;
    int _2282 = _2280 + _1877;
    bool _2284 = !_2262;
    int _2286 = _2284 ? _2258 : (-1);
    int _2288 = _1795 * _2268;
    int _2290 = _2288 + _1877;
    bool _2292 = _1795 == 0;
    float _2294 = trunc(_2232);
    float _2296 = precise::max(_2294, 0.0);
    uint _2298 = uint(_2296);
    int _2300 = ~_2228;
    int _2302 = _2300 + 1;
    int _2304 = _2302 + 1;
    int _2306 = _2286 * _2278;
    bool _2308 = !_2292;
    int _2310 = _2308 ? _2290 : (-1);
    int _2312 = _572 + (-1);
    int _2314 = _1795 + (-1);
    int _2316 = _2304 * _2310;
    int _2318 = ~_1895;
    int _2320 = _2318 + 1;
    int _2322 = _2182 * _2312;
    int _2324 = _2322 + _2306;
    int _2326 = abs(_842);
    int _2328 = _2228 * _2314;
    int _2330 = _2328 + _2316;
    int _2332 = abs(_882);
    int _2334 = _2324 * _2176;
    float _2336 = trunc(_2170);
    int _2338 = int(_2336);
    int _2340 = _2330 * _2178;
    int _2342 = int(_2138) + int(_2298);
    int _2344 = _2250 * _2326;
    int _2346 = _2344 + _2334;
    bool _2348 = !_1994;
    int _2350 = _2348 ? 0 : 1;
    int _2352 = _2272 * _2332;
    int _2354 = _2352 + _2346;
    int _2356 = abs(_2350);
    float _2358 = trunc(_2212);
    int _2360 = int(_2358);
    int _2362 = abs(_1366);
    int _2364 = _2320 * _2342;
    int _2366 = _2364 + _2004;
    int _2368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2370 = _2368 != 0;
    int _2372 = _2156 * _2356;
    int _2374 = _2372 + _2354;
    int _2376 = ~_1895;
    int _2378 = _2376 + 1;
    bool _2380 = uint(_2366) >= uint(_1895);
    int _2382 = _2338 * _2188;
    int _2384 = _2382 + _2340;
    float _2386 = float(uint(_2374));
    float _2388 = trunc(_2220);
    int _2390 = int(_2388);
    bool _2392 = !_2380;
    int _2394 = _2392 ? 0 : (-1);
    bool _2396 = !_2370;
    int _2398 = _2396 ? 0 : 1;
    float _2400 = as_type<float>(_1885) * _2386;
    int _2402 = ~_2342;
    int _2404 = _2402 + _2394;
    int _2406 = _2404 + 1;
    int _2408 = _2282 * _2190;
    int _2410 = _2408 + _2384;
    int _2412 = abs(_2398);
    float _2414 = _702 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2416 = _1895 == 0;
    float _2418 = trunc(_2400);
    float _2420 = precise::max(_2418, 0.0);
    uint _2422 = uint(_2420);
    int _2424 = _1895 * _2406;
    int _2426 = _2424 + _2004;
    float _2428 = _702 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2430 = ~_2360;
    int _2432 = _2430 + 1;
    int _2434 = _2432 + 1;
    float _2436 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2414);
    float _2438 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2428);
    bool _2440 = !_2416;
    int _2442 = _2440 ? _2426 : (-1);
    float _2444 = trunc(_2238);
    int _2446 = int(_2444);
    int _2448 = ~_572;
    int _2450 = _2448 + 1;
    float _2452 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2438);
    int _2454 = _1895 + (-1);
    int _2456 = _2434 * _2442;
    int _2458 = ~_1795;
    int _2460 = _2458 + 1;
    int _2462 = _2196 * _2362;
    int _2464 = _2462 + _2410;
    int _2466 = abs(_898);
    int _2468 = _2360 * _2454;
    int _2470 = _2468 + _2456;
    int _2472 = _2450 * int(_2422);
    int _2474 = _2472 + _2374;
    bool _2476 = !_2014;
    int _2478 = _2476 ? 0 : 1;
    float _2480 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2436);
    int _2482 = _2470 * _2192;
    float _2484 = float(uint(_2474));
    int _2486 = _2446 * _2412;
    int _2488 = _2486 + _2004;
    float _2490 = float(uint(_2464));
    int _2492 = _2390 * _2466;
    int _2494 = _2492 + _2482;
    int _2496 = abs(_2478);
    float _2498 = as_type<float>(_1885) * _2484;
    bool _2500 = !_2028;
    int _2502 = _2500 ? 0 : 1;
    float _2504 = as_type<float>(_1913) * _2490;
    float _2506 = trunc(_2498);
    float _2508 = precise::max(_2506, 0.0);
    uint _2510 = uint(_2508);
    int _2512 = abs(_2502);
    float _2514 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2516 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2518 = isnan(_542);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2524 = _2520 || _2522;
    float _2526 = float(_2524);
    int _2528 = _2488 * _2496;
    int _2530 = _2528 + _2494;
    float _2532 = float(uint(_2272));
    float _2534 = _2480 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2538 = _2536 != 0;
    float _2540 = trunc(_2504);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    int _2546 = ~_572;
    int _2548 = _2546 + 1;
    float _2550 = as_type<float>(_1885) * _2532;
    float _2552 = _2534 + _2514;
    float _2554 = -_1750;
    float _2556 = _2554 + 1.0;
    float _2558 = trunc(_2550);
    float _2560 = precise::max(_2558, 0.0);
    uint _2562 = uint(_2560);
    bool _2564 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2566 = isnan(_542);
    bool _2568 = _2564 || _2566;
    bool _2570 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2572 = _2568 || _2570;
    float _2574 = float(_2572);
    float _2576 = -_2526;
    float _2578 = _2576 + 1.0;
    int _2580 = int(_2422) + int(_2510);
    float _2582 = float(uint(_2282));
    int _2584 = _2446 * _2512;
    int _2586 = _2584 + _2530;
    float _2588 = _2574 * _2578;
    int _2590 = _2460;
    float _2592 = _2588;
    float _2594 = as_type<float>(_2298);
    float _2596 = as_type<float>(_2228);
    if (_2538)
    {
        float _2598 = -_1881;
        float _2600 = _2598 + 1.0;
        _2590 = as_type<int>(_2600);
    }
    int _2602 = _2590;
    float _2604 = 1.0 / _2514;
    float _2606 = float(uint(_2586));
    float _2608 = _2058 * _2588;
    int _2610 = _2460 * int(_2544);
    int _2612 = _2610 + _2464;
    if (!_2538)
    {
        _2592 = _1881;
    }
    float _2614 = _2592;
    float _2616 = as_type<float>(_1913) * _2582;
    float _2618 = as_type<float>(_2018) * _2606;
    int _2620 = ~_572;
    int _2622 = _2620 + 1;
    float _2624 = -_2574;
    float _2626 = _2624 + 1.0;
    float _2628 = float(uint(_2612));
    float _2630 = exp2(_1829);
    float _2632 = _2614;
    float _2634 = _2626;
    if (_2538)
    {
        float _2636 = _1823 ? as_type<float>(_2602) : _1881;
        _2632 = _2636;
    }
    float _2638 = _2632;
    float _2640 = as_type<float>(_1913) * _2628;
    float _2642 = float(uint(_2488));
    int _2644 = _2622 * _2580;
    int _2646 = _2644 + _2374;
    float _2648 = trunc(_2618);
    float _2650 = precise::max(_2648, 0.0);
    uint _2652 = uint(_2650);
    int _2654 = ~_1895;
    int _2656 = _2654 + 1;
    float _2658 = as_type<float>(_2018) * _2642;
    bool _2660 = uint(_2646) >= uint(_572);
    int _2662 = _2548 * int(_2562);
    int _2664 = _2662 + _2272;
    float _2666 = fma(_2626, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2608);
    bool _2668 = !_2660;
    int _2670 = _2668 ? 0 : (-1);
    float _2672 = trunc(_2640);
    float _2674 = precise::max(_2672, 0.0);
    uint _2676 = uint(_2674);
    float _2678 = -_2630;
    float _2680 = _2678 + 1.0;
    int _2682 = ~_2580;
    int _2684 = _2682 + _2670;
    int _2686 = _2684 + 1;
    int _2688 = ~_1895;
    int _2690 = _2688 + 1;
    float _2692 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2694 = trunc(_2658);
    float _2696 = precise::max(_2694, 0.0);
    uint _2698 = uint(_2696);
    float _2700 = float(uint(_2664));
    int _2702 = _572 * _2686;
    int _2704 = _2702 + _2374;
    float _2706 = _2552 * _2604;
    float _2708 = _2706 * 0.5;
    float _2710 = _2692 * _1768;
    float _2712 = as_type<float>(_1885) * _2700;
    int _2714 = _2656 * int(_2652);
    int _2716 = _2714 + _2586;
    int _2718 = int(_2544) + int(_2676);
    float _2720 = trunc(_2616);
    float _2722 = precise::max(_2720, 0.0);
    uint _2724 = uint(_2722);
    int _2726 = ~_1795;
    int _2728 = _2726 + 1;
    float _2730 = -_2692;
    float _2732 = _2730 + 1.0;
    float _2734 = float(uint(_2716));
    bool _2736 = !_2262;
    int _2738 = _2736 ? _2704 : (-1);
    float _2740 = as_type<float>(_2018) * _2734;
    float _2742 = trunc(_2712);
    float _2744 = precise::max(_2742, 0.0);
    uint _2746 = uint(_2744);
    int _2748 = ~_1795;
    int _2750 = _2748 + 1;
    int _2752 = _2690 * int(_2698);
    int _2754 = _2752 + _2488;
    int _2756 = _2738 & 3;
    bool _2758 = _2756 != 0;
    int _2760 = _2738 & 3;
    bool _2762 = _2760 != 0;
    int _2764 = _2728 * int(_2724);
    int _2766 = _2764 + _2282;
    float _2768 = trunc(_2740);
    float _2770 = precise::max(_2768, 0.0);
    uint _2772 = uint(_2770);
    float _2774 = float(uint(_2754));
    int _2776 = _2750 * _2718;
    int _2778 = _2776 + _2464;
    bool _2780 = uint(_2756) > 1u;
    float _2782 = float(uint(_2766));
    float _2784 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2786 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2784);
    bool _2788 = uint(_2778) >= uint(_1795);
    float _2790 = as_type<float>(_2018) * _2774;
    int _2792 = int(_2562) + int(_2746);
    float _2794 = as_type<float>(_1913) * _2782;
    int _2796 = ~_1895;
    int _2798 = _2796 + 1;
    float _2800 = 1.0 / _2786;
    bool _2802 = !_2788;
    int _2804 = _2802 ? 0 : (-1);
    int _2806 = _2762 ? 0 : 1;
    int _2808 = int(_2652) + int(_2772);
    float _2810 = trunc(_2794);
    float _2812 = precise::max(_2810, 0.0);
    uint _2814 = uint(_2812);
    int _2816 = ~_572;
    int _2818 = _2816 + 1;
    bool _2820 = uint(_2756) >= 2u;
    int _2822 = _2798 * _2808;
    int _2824 = _2822 + _2586;
    bool _2826 = _2756 != 3;
    int _2828 = _2818 * _2792;
    int _2830 = _2828 + _2272;
    int _2832 = ~_2718;
    int _2834 = _2832 + _2804;
    int _2836 = _2834 + 1;
    int _2838 = ~_2806;
    int _2840 = _2838 + 1;
    int _2842 = _2840 + 1;
    float _2844 = in.m_73.x;
    float _2846 = in.m_73.y;
    float _2848 = in.m_73.z;
    int _2850 = _2842;
    if (!_2780)
    {
        int _2852 = ~_2806;
        int _2854 = _2852 + 1;
        _2850 = _2854;
    }
    int _2856 = _2850;
    int _2858 = _1795 * _2836;
    int _2860 = _2858 + _2464;
    int _2862 = _2820 ? 0 : 1;
    bool _2864 = uint(_2824) >= uint(_1895);
    bool _2866 = !_2292;
    int _2868 = _2866 ? _2860 : (-1);
    bool _2870 = !_2864;
    int _2872 = _2870 ? 0 : (-1);
    bool _2874 = uint(_2830) >= uint(_572);
    int _2876 = ~_2862;
    int _2878 = _2876 + 1;
    int _2880 = _2878 + 1;
    int _2882 = _2880;
    float _2884 = as_type<float>(_2860);
    if (_2826)
    {
        int _2886 = ~_2862;
        int _2888 = _2886 + 1;
        _2882 = _2888;
    }
    int _2890 = _2882;
    int _2892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2894 = _2892 != 0;
    bool _2896 = !_2874;
    int _2898 = _2896 ? 0 : (-1);
    int _2900 = _2868 & 3;
    bool _2902 = _2900 != 0;
    int _2904 = ~_2808;
    int _2906 = _2904 + _2872;
    int _2908 = _2906 + 1;
    bool _2910 = !_2894;
    int _2912 = _2910 ? 0 : 1;
    bool _2914 = uint(_2900) >= 2u;
    int _2916 = _1895 * _2908;
    int _2918 = _2916 + _2586;
    int _2920 = int(_2724) + int(_2814);
    float _2922 = trunc(_2790);
    float _2924 = precise::max(_2922, 0.0);
    uint _2926 = uint(_2924);
    int _2928 = _2914 ? 0 : 1;
    bool _2930 = uint(_2900) > 1u;
    int _2932 = _2902 ? 0 : 1;
    bool _2934 = _2900 != 3;
    bool _2936 = _1154 != 0.0;
    bool _2938 = isnan(_1154);
    bool _2940 = _2936 || _2938;
    bool _2942 = isnan(0.0);
    bool _2944 = _2940 || _2942;
    int _2946 = ~_1795;
    int _2948 = _2946 + 1;
    bool _2950 = !_2416;
    int _2952 = _2950 ? _2918 : (-1);
    bool _2954 = _1152 == 0.0;
    bool _2956 = !_2944;
    bool _2958 = _2954 && _2956;
    int _2960 = _2948 * _2920;
    int _2962 = _2960 + _2282;
    int _2964 = ~_2932;
    int _2966 = _2964 + 1;
    int _2968 = _2966 + 1;
    int _2970 = _2968;
    if (!_2930)
    {
        int _2972 = ~_2932;
        int _2974 = _2972 + 1;
        _2970 = _2974;
    }
    int _2976 = _2970;
    int _2978 = int(_2698) + int(_2926);
    float _2980 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2982 = _2800 * _2980;
    int _2984 = _2952 & 3;
    bool _2986 = _2984 != 0;
    bool _2988 = _1156 == 0.0;
    bool _2990 = _2988 && _2958;
    float _2992 = abs(_2982);
    float _2994 = log2(_2992);
    int _2996 = ~_2928;
    int _2998 = _2996 + 1;
    int _3000 = _2998 + 1;
    int _3002 = _2378 * _2978;
    int _3004 = _3002 + _2488;
    int _3006 = _3000;
    if (_2934)
    {
        int _3008 = ~_2928;
        int _3010 = _3008 + 1;
        _3006 = _3010;
    }
    int _3012 = _3006;
    bool _3014 = uint(_2962) >= uint(_1795);
    int _3016 = _2986 ? 0 : 1;
    float _3018 = in.m_75.x;
    float _3020 = in.m_75.y;
    float _3022 = in.m_75.z;
    float _3024 = in.m_75.w;
    bool _3026 = _2984 != 3;
    bool _3028 = !_3014;
    int _3030 = _3028 ? 0 : (-1);
    bool _3032 = uint(_2984) >= 2u;
    if (_2990)
    {
        _2594 = _2846;
    }
    float _3034 = _2594;
    float _3036 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3038 = _3032 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _3040 = _3038;
    float _3042 = _3034;
    if (_2990)
    {
        _2596 = _2848;
    }
    float _3044 = _2596;
    bool _3046 = uint(_2984) > 1u;
    float _3048 = exp2(_3036);
    int _3050 = ~as_type<int>(_3038);
    int _3052 = _3050 + 1;
    int _3054 = _3052 + 1;
    int _3056 = _3054;
    float _3058 = _3044;
    if (_3026)
    {
        int _3060 = ~as_type<int>(_3038);
        int _3062 = _3060 + 1;
        _3056 = _3062;
    }
    int _3064 = _3056;
    if (_2990)
    {
        _2884 = _3034;
    }
    float _3066 = _2884;
    float _3068 = _3066;
    if (_2990)
    {
        _3040 = _3044;
    }
    float _3070 = _3040;
    float _3072 = _3070;
    if (!_2990)
    {
        _3042 = _2846;
    }
    float _3074 = _3042;
    float _3076 = _3022 * _2844;
    if (!_2990)
    {
        _3058 = _2848;
    }
    float _3078 = _3058;
    if (_2990)
    {
        _2634 = _2844;
    }
    float _3080 = _2634;
    float _3082 = _3080;
    if (!_2990)
    {
        float _3084 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2844);
        _3082 = _3084;
    }
    float _3086 = _3082;
    bool _3088 = uint(_3004) >= uint(_1895);
    if (!_2990)
    {
        float _3090 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3074);
        _3068 = _3090;
    }
    float _3092 = _3068;
    if (!_2990)
    {
        float _3094 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3078);
        _3072 = _3094;
    }
    float _3096 = _3072;
    float _3098 = -_3076;
    float _3100 = fma(_3018, _3078, _3098);
    float _3102 = _3020 * _3078;
    float _3104 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3106 = ~_3016;
    int _3108 = _3106 + 1;
    int _3110 = _3108 + 1;
    float _3112 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3114 = _3110;
    if (!_3046)
    {
        int _3116 = ~_3016;
        int _3118 = _3116 + 1;
        _3114 = _3118;
    }
    int _3120 = _3114;
    float _3122 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3124 = !_3088;
    int _3126 = _3124 ? 0 : (-1);
    float _3128 = _3104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3132 = _3130 != 0;
    float _3134 = _3112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3138 = _3136 != 0;
    float _3140 = fma(_2526, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2666);
    float _3142 = _3122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3144 = _3018 * _3074;
    float _3146 = -_3102;
    float _3148 = fma(_3022, _3074, _3146);
    float _3150 = _3140 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3152 = _2738 >> 31;
    float _3154 = fma(_3048, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3156 = precise::clamp(_3154, 0.0, 1.0);
    float _3158 = -_3144;
    float _3160 = fma(_3020, _2844, _3158);
    out.m_77.x = _3128;
    out.m_77.y = _3134;
    out.m_77.z = _3142;
    out.m_77.w = _3150;
    int _3162 = _3152 & 3;
    float _3164 = _3100 * _3024;
    int _3166 = _2868 & 3;
    bool _3168 = _3166 != 0;
    float _3170 = fma(_3156, -2.0, 3.0);
    int _3172 = _2738 + _3162;
    float _3174 = _3148 * _3024;
    float _3176 = _3160 * _3024;
    float _3178 = _1252 * _1284;
    float _3180 = _3156 * _3156;
    float _3182 = _1252 * _1318;
    int _3184 = ~_2978;
    int _3186 = _3184 + _3126;
    int _3188 = _3186 + 1;
    float _3190 = fma(_1236, _1242, _3178);
    float _3192 = _3180 * _3170;
    int _3194 = _2868 >> 31;
    float _3196 = _1252 * _1276;
    int _3198 = _2952 >> 31;
    float _3200 = _1232 * _1284;
    int _3202 = _3194 & 3;
    float _3204 = _1232 * _1318;
    int _3206 = _3198 & 3;
    float _3208 = _1232 * _1276;
    int _3210 = _2868 + _3202;
    float _3212 = fma(_1236, _1244, _3182);
    int _3214 = _2952 + _3206;
    float _3216 = -_1230;
    float _3218 = fma(_3216, _1244, _3204);
    int _3220 = _3172 >> 2;
    float _3222 = fma(_1236, _1246, _3196);
    int _3224 = _3210 >> 2;
    float _3226 = -_1230;
    float _3228 = fma(_3226, _1242, _3200);
    int _3230 = _3214 >> 2;
    float _3232 = -_1230;
    float _3234 = fma(_3232, _1246, _3208);
    int _3236 = _3220 << 4;
    int _3238 = _3236 + 368;
    float _3240 = fma(_1238, _1242, _1801);
    int _3242 = _3224 << 4;
    int _3244 = _3242 + 512;
    float _3246 = fma(_1238, _1244, _1821);
    uint _3248 = uint(int(uint(_3238) >> uint(2)));
    uint _3250 = uint(int(uint(int(_3248)) >> uint(2)));
    int _3252 = int(_3248) & 3;
    float _3254 = (*spvDescriptorSet0.vp_c9)._m0[int(_3250)][_3252];
    int _3256 = int(_3248) + 1;
    uint _3258 = uint(int(uint(_3256) >> uint(2)));
    int _3260 = _3256 & 3;
    float _3262 = (*spvDescriptorSet0.vp_c9)._m0[int(_3258)][_3260];
    int _3264 = _3230 << 4;
    int _3266 = _3264 + 656;
    int _3268 = _1895 * _3188;
    int _3270 = _3268 + _2488;
    int _3272 = ~_2792;
    int _3274 = _3272 + _2898;
    int _3276 = _3274 + 1;
    float _3278 = -_3192;
    float _3280 = _3278 + 1.0;
    bool _3282 = !_3168;
    int _3284 = _3282 ? 0 : 1;
    float _3286 = fma(_1256, _1124, _3190);
    int _3288 = _2952 & 3;
    bool _3290 = _3288 != 0;
    uint _3292 = uint(int(uint(_3244) >> uint(2)));
    uint _3294 = uint(int(uint(int(_3292)) >> uint(2)));
    int _3296 = int(_3292) & 3;
    float _3298 = (*spvDescriptorSet0.vp_c9)._m0[int(_3294)][_3296];
    int _3300 = int(_3292) + 1;
    uint _3302 = uint(int(uint(_3300) >> uint(2)));
    int _3304 = _3300 & 3;
    float _3306 = (*spvDescriptorSet0.vp_c9)._m0[int(_3302)][_3304];
    int _3308 = ~_2920;
    int _3310 = _3308 + _3030;
    int _3312 = _3310 + 1;
    float _3314 = fma(_3280, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3192);
    bool _3316 = !_3290;
    int _3318 = _3316 ? 0 : 1;
    int _3320 = _572 * _3276;
    int _3322 = _3320 + _2272;
    bool _3324 = _2756 != 3;
    int _3326 = _1795 * _3312;
    int _3328 = _3326 + _2282;
    int _3330 = abs(_2856);
    uint _3332 = uint(int(uint(_3266) >> uint(2)));
    uint _3334 = uint(int(uint(int(_3332)) >> uint(2)));
    int _3336 = int(_3332) & 3;
    float _3338 = (*spvDescriptorSet0.vp_c9)._m0[int(_3334)][_3336];
    int _3340 = int(_3332) + 1;
    uint _3342 = uint(int(uint(_3340) >> uint(2)));
    int _3344 = _3340 & 3;
    float _3346 = (*spvDescriptorSet0.vp_c9)._m0[int(_3342)][_3344];
    bool _3348 = !_3324;
    int _3350 = _3348 ? 0 : (-1);
    float _3352 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3354 = int(_3352);
    bool _3356 = _2900 != 3;
    float _3358 = fma(_1256, _1130, _3222);
    int _3360 = abs(_3284);
    float _3362 = fma(_1268, _1140, _3246);
    bool _3364 = !_3356;
    int _3366 = _3364 ? 0 : (-1);
    int _3368 = _3244 + 8;
    uint _3370 = uint(int(uint(_3368) >> uint(2)));
    uint _3372 = uint(int(uint(int(_3370)) >> uint(2)));
    int _3374 = int(_3370) & 3;
    float _3376 = (*spvDescriptorSet0.vp_c9)._m0[int(_3372)][_3374];
    int _3378 = int(_3370) + 1;
    uint _3380 = uint(int(uint(_3378) >> uint(2)));
    int _3382 = _3378 & 3;
    float _3384 = (*spvDescriptorSet0.vp_c9)._m0[int(_3380)][_3382];
    bool _3386 = _2984 != 3;
    int _3388 = abs(_2976);
    int _3390 = ~_3330;
    int _3392 = _3390 + 1;
    int _3394 = _3392 + 1;
    int _3396 = _3266 + 8;
    uint _3398 = uint(int(uint(_3396) >> uint(2)));
    uint _3400 = uint(int(uint(int(_3398)) >> uint(2)));
    int _3402 = int(_3398) & 3;
    float _3404 = (*spvDescriptorSet0.vp_c9)._m0[int(_3400)][_3402];
    int _3406 = int(_3398) + 1;
    uint _3408 = uint(int(uint(_3406) >> uint(2)));
    int _3410 = _3406 & 3;
    float _3412 = (*spvDescriptorSet0.vp_c9)._m0[int(_3408)][_3410];
    int _3414 = ~_3388;
    int _3416 = _3414 + 1;
    int _3418 = _3416 + 1;
    int _3420 = abs(_3120);
    int _3422 = abs(_3318);
    bool _3424 = !_2758;
    int _3426 = _3424 ? 0 : 1;
    int _3428 = _3238 + 8;
    uint _3430 = uint(int(uint(_3428) >> uint(2)));
    uint _3432 = uint(int(uint(int(_3430)) >> uint(2)));
    int _3434 = int(_3430) & 3;
    float _3436 = (*spvDescriptorSet0.vp_c9)._m0[int(_3432)][_3434];
    int _3438 = int(_3430) + 1;
    uint _3440 = uint(int(uint(_3438) >> uint(2)));
    int _3442 = _3438 & 3;
    float _3444 = (*spvDescriptorSet0.vp_c9)._m0[int(_3440)][_3442];
    int _3446 = ~_3420;
    int _3448 = _3446 + 1;
    int _3450 = _3448 + 1;
    int _3452 = abs(_3426);
    int _3454 = abs(_3366);
    int _3456 = _3394 * as_type<int>(_3262);
    int _3458 = ~_3360;
    int _3460 = _3458 + 1;
    int _3462 = _3460 + 1;
    int _3464 = abs(_3064);
    int _3466 = ~_3452;
    int _3468 = _3466 + 1;
    int _3470 = _3468 + 1;
    int _3472 = ~_3464;
    int _3474 = _3472 + 1;
    int _3476 = _3474 + 1;
    int _3478 = _3418 * as_type<int>(_3306);
    bool _3480 = !_2416;
    int _3482 = _3480 ? _3270 : (-1);
    int _3484 = _3470 * as_type<int>(_3254);
    int _3486 = _3484 + _3456;
    bool _3488 = _3354 == 0;
    int _3490 = _3462 * as_type<int>(_3298);
    int _3492 = _3490 + _3478;
    float _3494 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3496 = int(_3494);
    int _3498 = abs(_2890);
    int _3500 = _3450 * as_type<int>(_3346);
    int _3502 = abs(_3012);
    int _3504 = ~_3422;
    int _3506 = _3504 + 1;
    int _3508 = _3506 + 1;
    int _3510 = ~_3502;
    int _3512 = _3510 + 1;
    int _3514 = _3512 + 1;
    float _3516 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3518 = int(_3516);
    int _3520 = ~_3498;
    int _3522 = _3520 + 1;
    int _3524 = _3522 + 1;
    int _3526 = _3508 * as_type<int>(_3338);
    int _3528 = _3526 + _3500;
    int _3530 = _3514 * as_type<int>(_3376);
    int _3532 = _3530 + _3492;
    bool _3534 = !_3386;
    int _3536 = _3534 ? 0 : (-1);
    float _3538 = float(uint(_3496));
    int _3540 = _3476 * as_type<int>(_3404);
    int _3542 = _3540 + _3528;
    int _3544 = abs(_3350);
    int _3546 = abs(_3536);
    int _3548 = ~_3544;
    int _3550 = _3548 + 1;
    int _3552 = _3550 + 1;
    int _3554 = ~_3454;
    int _3556 = _3554 + 1;
    int _3558 = _3556 + 1;
    int _3560 = _3524 * as_type<int>(_3436);
    int _3562 = _3560 + _3486;
    float _3564 = float(uint(_3354));
    int _3566 = abs(_2912);
    int _3568 = _3552 * as_type<int>(_3444);
    int _3570 = _3568 + _3562;
    float _3572 = 1.0 / _3564;
    int _3574 = _3558 * as_type<int>(_3384);
    int _3576 = _3574 + _3532;
    int _3578 = ~_3566;
    int _3580 = _3578 + 1;
    int _3582 = _3580 + 1;
    int _3584 = abs(_3354);
    float _3586 = float(uint(_3518));
    int _3588 = _3570 * _3582;
    float _3590 = 1.0 / _3538;
    int _3592 = ~_3546;
    int _3594 = _3592 + 1;
    int _3596 = _3594 + 1;
    bool _3598 = !_3132;
    int _3600 = _3598 ? 0 : 1;
    int _3602 = abs(_3496);
    int _3604 = _3596 * as_type<int>(_3412);
    int _3606 = _3604 + _3542;
    bool _3608 = !_3138;
    int _3610 = _3608 ? 0 : 1;
    float _3612 = 1.0 / _3586;
    int _3614 = abs(_3600);
    int _3616 = abs(_3610);
    bool _3618 = !_2262;
    int _3620 = _3618 ? _3322 : (-1);
    int _3622 = abs(_3518);
    int _3624 = ~_3614;
    int _3626 = _3624 + 1;
    int _3628 = _3626 + 1;
    int _3630 = _3620 * _3566;
    int _3632 = _3630 + _3588;
    int _3634 = ~_3616;
    int _3636 = _3634 + 1;
    int _3638 = _3636 + 1;
    float _3640 = float(uint(_3584));
    int _3642 = _3628 * _3576;
    int _3644 = _3638 * _3606;
    bool _3646 = !_2292;
    int _3648 = _3646 ? _3328 : (-1);
    float _3650 = fma(_1256, _1140, _3212);
    int _3652 = as_type<int>(_3572) + (-2);
    float _3654 = 1.0 / _3640;
    float _3656 = float(uint(_3632));
    int _3658 = _3648 * _3614;
    int _3660 = _3658 + _3642;
    float _3662 = float(uint(_3602));
    int _3664 = _3482 * _3616;
    int _3666 = _3664 + _3644;
    float _3668 = float(uint(_3622));
    float _3670 = as_type<float>(_3652) * _3656;
    int _3672 = as_type<int>(_3590) + (-2);
    float _3674 = 1.0 / _3662;
    float _3676 = float(uint(_3660));
    float _3678 = fma(_1234, _1140, _3218);
    int _3680 = as_type<int>(_3612) + (-2);
    float _3682 = float(uint(_3666));
    int _3684 = abs(_3632);
    float _3686 = 1.0 / _3668;
    float _3688 = fma(_1234, _1124, _3228);
    float _3690 = as_type<float>(_3680) * _3682;
    int _3692 = abs(_3660);
    int _3694 = ~_3518;
    int _3696 = _3694 + 1;
    int _3698 = ~_3496;
    int _3700 = _3698 + 1;
    float _3702 = trunc(_3670);
    float _3704 = precise::max(_3702, 0.0);
    uint _3706 = uint(_3704);
    float _3708 = fma(_1234, _1130, _3234);
    float _3710 = as_type<float>(_3672) * _3676;
    float _3712 = fma(_1268, _1124, _3240);
    float _3714 = fma(_1268, _1130, _1835);
    int _3716 = ~_3354;
    int _3718 = _3716 + 1;
    float _3720 = float(uint(_3684));
    float _3722 = trunc(_3690);
    float _3724 = precise::max(_3722, 0.0);
    uint _3726 = uint(_3724);
    int _3728 = as_type<int>(_3654) + (-2);
    int _3730 = as_type<int>(_3674) + (-2);
    float _3732 = as_type<float>(_3728) * _3720;
    int _3734 = abs(_3666);
    float _3736 = trunc(_3710);
    float _3738 = precise::max(_3736, 0.0);
    uint _3740 = uint(_3738);
    int _3742 = as_type<int>(_3686) + (-2);
    int _3744 = _3718 * int(_3706);
    int _3746 = _3744 + _3632;
    float _3748 = float(uint(_3734));
    float _3750 = float(uint(_3692));
    bool _3752 = _2982 <= 8000.0;
    bool _3754 = isnan(_2982);
    bool _3756 = _3752 || _3754;
    bool _3758 = isnan(8000.0);
    bool _3760 = _3756 || _3758;
    float _3762 = float(_3760);
    float _3764 = as_type<float>(_3742) * _3748;
    float _3766 = float(uint(_3746));
    float _3768 = trunc(_3732);
    float _3770 = precise::max(_3768, 0.0);
    uint _3772 = uint(_3770);
    float _3774 = as_type<float>(_3730) * _3750;
    int _3776 = _3696 * int(_3726);
    int _3778 = _3776 + _3666;
    int _3780 = ~_3584;
    int _3782 = _3780 + 1;
    float _3784 = as_type<float>(_3652) * _3766;
    int _3786 = ~_3602;
    int _3788 = _3786 + 1;
    int _3790 = _3700 * int(_3740);
    int _3792 = _3790 + _3660;
    float _3794 = float(uint(_3778));
    float _3796 = trunc(_3774);
    float _3798 = precise::max(_3796, 0.0);
    uint _3800 = uint(_3798);
    int _3802 = ~_3622;
    int _3804 = _3802 + 1;
    float _3806 = _3762 * _3314;
    float _3808 = float(uint(_3792));
    float _3810 = as_type<float>(_3680) * _3794;
    float _3812 = _3678 * _3020;
    float _3814 = _3688 * _3092;
    float _3816 = trunc(_3764);
    float _3818 = precise::max(_3816, 0.0);
    uint _3820 = uint(_3818);
    float _3822 = as_type<float>(_3672) * _3808;
    float _3824 = _3688 * _3020;
    float _3826 = _3164 * _3688;
    float _3828 = _3164 * _3678;
    float _3830 = _3708 * _3092;
    float _3832 = trunc(_3784);
    float _3834 = precise::max(_3832, 0.0);
    uint _3836 = uint(_3834);
    float _3838 = _3708 * _3020;
    int _3840 = _3782 * int(_3772);
    int _3842 = _3840 + _3684;
    float _3844 = float(uint(_3842));
    int _3846 = _3788 * int(_3800);
    int _3848 = _3846 + _3692;
    float _3850 = _3678 * _3092;
    float _3852 = _3164 * _3708;
    float _3854 = as_type<float>(_3728) * _3844;
    float _3856 = float(uint(_3848));
    float _3858 = fma(_3650, _3086, _3850);
    float _3860 = fma(_3286, _3086, _3814);
    int _3862 = _3804 * int(_3820);
    int _3864 = _3862 + _3734;
    float _3866 = trunc(_3822);
    float _3868 = precise::max(_3866, 0.0);
    uint _3870 = uint(_3868);
    float _3872 = as_type<float>(_3730) * _3856;
    float _3874 = fma(_3286, _3018, _3824);
    float _3876 = fma(_3174, _3286, _3826);
    float _3878 = float(uint(_3864));
    float _3880 = fma(_3650, _3018, _3812);
    float _3882 = fma(_3358, _3018, _3838);
    float _3884 = fma(_3712, _3022, _3874);
    float _3886 = trunc(_3810);
    float _3888 = precise::max(_3886, 0.0);
    uint _3890 = uint(_3888);
    float _3892 = as_type<float>(_3742) * _3878;
    float _3894 = fma(_3362, _3022, _3880);
    float _3896 = fma(_3714, _3022, _3882);
    float _3898 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3900 = ~_3496;
    int _3902 = _3900 + 1;
    float _3904 = fma(_3358, _3086, _3830);
    int _3906 = int(_3706) + int(_3836);
    float _3908 = trunc(_3854);
    float _3910 = precise::max(_3908, 0.0);
    uint _3912 = uint(_3910);
    out.m_79.x = _3884;
    out.m_79.y = _3894;
    out.m_79.z = _3896;
    int _3914 = int(_3740) + int(_3870);
    float _3916 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3898);
    float _3918 = fma(_3174, _3650, _3828);
    float _3920 = fma(_3174, _3358, _3852);
    float _3922 = _1789 * _2710;
    float _3924 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3916);
    float _3926 = trunc(_3872);
    float _3928 = precise::max(_3926, 0.0);
    uint _3930 = uint(_3928);
    int _3932 = ~_3354;
    int _3934 = _3932 + 1;
    float _3936 = fma(_3362, _3096, _3858);
    int _3938 = int(_3726) + int(_3890);
    int _3940 = _3934 * _3906;
    int _3942 = _3940 + _3632;
    int _3944 = ~_3584;
    int _3946 = _3944 + 1;
    float _3948 = trunc(_3892);
    float _3950 = precise::max(_3948, 0.0);
    uint _3952 = uint(_3950);
    int _3954 = ~_3518;
    int _3956 = _3954 + 1;
    int _3958 = _3902 * _3914;
    int _3960 = _3958 + _3660;
    int _3962 = int(_3772) + int(_3912);
    int _3964 = ~_3602;
    int _3966 = _3964 + 1;
    int _3968 = _3946 * _3962;
    int _3970 = _3968 + _3684;
    int _3972 = int(_3800) + int(_3930);
    int _3974 = _3956 * _3938;
    int _3976 = _3974 + _3666;
    bool _3978 = uint(_3942) >= uint(_3354);
    float _3980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3982 = uint(_3960) >= uint(_3496);
    int _3984 = _3966 * _3972;
    int _3986 = _3984 + _3692;
    bool _3988 = uint(_3976) >= uint(_3518);
    bool _3990 = !_3978;
    int _3992 = _3990 ? 0 : (-1);
    int _3994 = int(_3820) + int(_3952);
    int _3996 = ~_3622;
    int _3998 = _3996 + 1;
    bool _4000 = uint(_3986) >= uint(_3602);
    bool _4002 = !_3988;
    int _4004 = _4002 ? 0 : (-1);
    int _4006 = _3998 * _3994;
    int _4008 = _4006 + _3734;
    int _4010 = ~_3906;
    int _4012 = _4010 + _3992;
    int _4014 = _4012 + 1;
    float _4016 = _3980 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _4018 = ~_3938;
    int _4020 = _4018 + _4004;
    int _4022 = _4020 + 1;
    float _4024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _4026 = uint(_4008) >= uint(_3622);
    int _4028 = _3354 * _4014;
    int _4030 = _4028 + _3632;
    bool _4032 = uint(_3970) >= uint(_3584);
    int _4034 = _3518 * _4022;
    int _4036 = _4034 + _3666;
    bool _4038 = !_3982;
    int _4040 = _4038 ? 0 : (-1);
    float _4042 = fma(_4016, _1962, -0.5);
    bool _4044 = !_3488;
    int _4046 = _4044 ? _4030 : (-1);
    float _4048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4050 = ~_3914;
    int _4052 = _4050 + _4040;
    int _4054 = _4052 + 1;
    int _4056 = _3632 ^ _3354;
    float _4058 = float(_4046);
    int _4060 = _3496 * _4054;
    int _4062 = _4060 + _3660;
    bool _4064 = !_4000;
    int _4066 = _4064 ? 0 : (-1);
    float _4068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4070 = _3518 == 0;
    float _4072 = fma(_4016, _4058, _628);
    bool _4074 = !_4032;
    int _4076 = _4074 ? 0 : (-1);
    int _4078 = _3666 ^ _3518;
    float _4080 = fma(_1014, _4042, _4072);
    uint _4082 = uint(int(uint(_4056) >> uint(31)));
    float _4084 = _4048 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _4086 = _3354 == 0;
    bool _4088 = _3496 == 0;
    float _4090 = fma(_4084, _2638, -0.5);
    bool _4092 = !_4070;
    int _4094 = _4092 ? _4036 : (-1);
    int _4096 = _3660 ^ _3496;
    int _4098 = ~_4076;
    int _4100 = _3962 + _4098;
    int _4102 = _4100 + 1;
    bool _4104 = !_4026;
    int _4106 = _4104 ? 0 : (-1);
    uint _4108 = uint(int(uint(_4078) >> uint(31)));
    int _4110 = ~int(_4082);
    int _4112 = _4110 + 1;
    bool _4114 = _3518 == 0;
    int _4116 = ~_4066;
    int _4118 = _3972 + _4116;
    int _4120 = _4118 + 1;
    float _4122 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _4124 = !_4088;
    int _4126 = _4124 ? _4062 : (-1);
    float _4128 = float(_4094);
    uint _4130 = uint(int(uint(_4096) >> uint(31)));
    bool _4132 = _3496 == 0;
    float _4134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _4136 = ~_4106;
    int _4138 = _3994 + _4136;
    int _4140 = _4138 + 1;
    float _4142 = _4068 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4144 = ~int(_4108);
    int _4146 = _4144 + 1;
    float _4148 = fma(_4084, _4128, _838);
    int _4150 = _4102 ^ _4112;
    float _4152 = fma(_4142, _2070, -0.5);
    float _4154 = float(_4126);
    float _4156 = _4024 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4158 = ~int(_4130);
    int _4160 = _4158 + 1;
    float _4162 = fma(_1008, _4090, _4148);
    int _4164 = _4140 ^ _4146;
    float _4166 = fma(_4142, _4154, _902);
    int _4168 = ~_4112;
    int _4170 = _4168 + _4150;
    int _4172 = _4170 + 1;
    float _4174 = _4122 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _4176 = _4120 ^ _4160;
    float _4178 = _4134 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _4180 = ~_4146;
    int _4182 = _4180 + _4164;
    int _4184 = _4182 + 1;
    float _4186 = fma(_2032, _4156, -0.5);
    bool _4188 = !_4086;
    int _4190 = _4188 ? _4172 : (-1);
    float _4192 = fma(_2010, _4174, -0.5);
    int _4194 = ~_4160;
    int _4196 = _4194 + _4176;
    int _4198 = _4196 + 1;
    float _4200 = fma(_4178, _2088, -0.5);
    bool _4202 = !_4114;
    int _4204 = _4202 ? _4184 : (-1);
    float _4206 = fma(_854, _4152, _4166);
    float _4208 = float(_4190);
    float _4210 = _4162 + 0.5;
    bool _4212 = !_4132;
    int _4214 = _4212 ? _4198 : (-1);
    float _4216 = float(_4204);
    float _4218 = -_624;
    float _4220 = fma(_4156, _4208, _4218);
    float _4222 = fma(_3176, _3712, _3876);
    float _4224 = float(_4214);
    float _4226 = in.m_81.x;
    float _4228 = -_1086;
    float _4230 = fma(_4178, _4216, _4228);
    float _4232 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3924);
    float _4234 = fma(_992, _4186, _4220);
    float _4236 = -_1044;
    float _4238 = fma(_4174, _4224, _4236);
    float _4240 = fma(_3176, _3362, _3918);
    float _4242 = fma(_3176, _3714, _3920);
    float _4244 = _4232 + _1682;
    float _4246 = fma(_938, _4192, _4238);
    float _4248 = fma(_1066, _4200, _4230);
    float _4250 = _4244 * 0.5;
    float _4252 = _3806 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = _4222;
    out.m_83.y = _4240;
    out.m_83.z = _4242;
    float _4254 = _4248 + 0.5;
    float _4256 = _2556 * _4252;
    float _4258 = precise::clamp(_4256, 0.0, 1.0);
    out.gl_Position.x = _1730;
    out.gl_Position.y = _1740;
    out.gl_Position.z = _4232;
    out.gl_Position.w = _1682;
    float _4260 = _4080 + 0.5;
    float _4262 = _4206 + 0.5;
    float _4264 = _4234 + 0.5;
    float _4266 = _4246 + 0.5;
    float _4268 = fma(_3712, _3096, _3860);
    float _4270 = fma(_3714, _3096, _3904);
    float _4272 = _1779 * _2732;
    out.m_85.z = _4250;
    out.m_85.w = _1682;
    bool _4274 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4276 = isnan(_1456);
    bool _4278 = _4274 || _4276;
    bool _4280 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4282 = _4278 || _4280;
    float _4284 = -_4258;
    float _4286 = fma(_4284, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4288 = _1779 * _2710;
    out.m_87.x = _4260;
    out.m_87.y = _4264;
    out.m_87.z = _4262;
    out.m_87.w = _4266;
    float _4290 = _4286 * _4226;
    float _4292 = fma(_1785, _4288, _1773);
    float _4294 = fma(_1787, _4288, _1775);
    float _4296 = fma(_1779, _3922, _1777);
    float _4298 = _4290 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.x = _4210;
    out.m_89.y = _4254;
    float _4300 = _4240;
    float _4302 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _4304 = _4232;
    float _4306 = _4288;
    if (!_4282)
    {
        _4300 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4308 = _4300;
    float _4310 = _4308;
    float _4312 = _4308;
    if (!_4282)
    {
        _4302 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4314 = _4302;
    out.m_91.x = _4298;
    float _4316 = _4314;
    float _4318 = _4314;
    if (!_4282)
    {
        _1845 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4320 = _1845;
    float _4322 = _4320;
    float _4324 = _4320;
    if (!_4282)
    {
        _4304 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4326 = _4304;
    out.m_93.x = _4292;
    out.m_93.y = _4294;
    out.m_93.z = _4296;
    out.m_93.w = _4272;
    float _4328 = _4326;
    float _4330 = _4326;
    if (!_4282)
    {
        _1847 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4332 = _1847;
    float _4334 = _4332;
    float _4336 = _4332;
    if (!_4282)
    {
        _4306 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4338 = _4306;
    out.m_95.x = _4268;
    out.m_95.y = _3936;
    out.m_95.z = _4270;
    bool _4340 = !_4282;
    float _4342 = _4338;
    float _4344 = _4338;
    if (!_4340)
    {
        bool _4346 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4348 = isnan(_1456);
        bool _4350 = _4346 || _4348;
        bool _4352 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4354 = _4350 || _4352;
        if (!_4354)
        {
            float _4356 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4358 = _1456 + _4356;
            float _4360 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4362 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4360;
            float _4364 = 1.0 / _4362;
            float _4366 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4368 = _4366 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4370 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4372 = _4370 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4374 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4376 = _4374 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4378 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4380 = _4378 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4382 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4384 = _4382 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4386 = _4358 * _4364;
            float _4388 = precise::clamp(_4386, 0.0, 1.0);
            float _4390 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4392 = _4390 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4394 = fma(_4388, _4368, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4396 = fma(_4388, _4392, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4398 = fma(_4388, _4372, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4400 = fma(_4388, _4376, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4402 = fma(_4388, _4380, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4404 = fma(_4388, _4384, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4318 = _4396;
            _4336 = _4402;
            _4312 = _4394;
            _4330 = _4400;
            _4324 = _4398;
            _4344 = _4404;
            _4406 = true;
        }
        else
        {
            bool _4408 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4410 = isnan(_1456);
            bool _4412 = _4408 || _4410;
            bool _4414 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4416 = _4412 || _4414;
            if (!_4416)
            {
                _4310 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4418 = _4310;
            _4312 = _4418;
            if (!_4416)
            {
                _4316 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4420 = _4316;
            _4318 = _4420;
            if (!_4416)
            {
                _4322 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4422 = _4322;
            _4324 = _4422;
            if (!_4416)
            {
                _4328 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4424 = _4328;
            _4330 = _4424;
            if (!_4416)
            {
                _4334 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4426 = _4334;
            _4336 = _4426;
            if (!_4416)
            {
                _4342 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4428 = _4342;
            bool _4430 = !_4416;
            _4344 = _4428;
            if (!_4430)
            {
                bool _4432 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4434 = isnan(_1456);
                bool _4436 = _4432 || _4434;
                bool _4438 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4440 = _4436 || _4438;
                if (!_4440)
                {
                    float _4442 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4444 = _1456 + _4442;
                    float _4446 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4448 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4446;
                    float _4450 = 1.0 / _4448;
                    float _4452 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4454 = _4452 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4456 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4458 = _4456 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4460 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4462 = _4460 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4464 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4466 = _4464 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4468 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4470 = _4468 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4472 = _4444 * _4450;
                    float _4474 = precise::clamp(_4472, 0.0, 1.0);
                    float _4476 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4478 = _4476 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4480 = fma(_4474, _4454, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4482 = fma(_4474, _4478, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4484 = fma(_4474, _4458, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4486 = fma(_4474, _4462, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4488 = fma(_4474, _4466, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4490 = fma(_4474, _4470, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4318 = _4482;
                    _4336 = _4488;
                    _4312 = _4480;
                    _4330 = _4486;
                    _4324 = _4484;
                    _4344 = _4490;
                    _4406 = true;
                }
                else
                {
                    _4318 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4336 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4312 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4330 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4324 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4344 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4406 = false;
    float _4492 = _4318;
    float _4494 = _4336;
    float _4496 = _4312;
    float _4498 = _4330;
    float _4500 = _4324;
    float _4502 = _4344;
    float _4504 = fma(_3936, -0.5, 0.5);
    float _4506 = precise::clamp(_4504, 0.0, 1.0);
    float _4508 = -_4492;
    float _4510 = _4508 + _4494;
    float _4512 = -_4496;
    float _4514 = _4512 + _4498;
    float _4516 = -_4500;
    float _4518 = _4516 + _4502;
    bool _4520 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4522 = fma(_4506, _4510, _4492);
    float _4524 = fma(_4506, _4514, _4496);
    float _4526 = fma(_4506, _4518, _4500);
    float _4528 = _4522 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _4530 = fma(_4524, 0.298911988735198974609375, _4528);
    float _4532 = fma(_4526, 0.114477999508380889892578125, _4530);
    out.m_97.x = 0.0;
    float _4534 = -_4532;
    float _4536 = _4524 + _4534;
    float _4538 = -_4532;
    float _4540 = _4522 + _4538;
    float _4542 = -_4532;
    float _4544 = _4526 + _4542;
    float _4546 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4548 = fma(_4536, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4532);
    float _4550 = fma(_4540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4532);
    float _4552 = fma(_4544, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4532);
    out.m_91.w = _4546;
    out.m_99.x = _4548;
    out.m_99.y = _4550;
    out.m_99.z = _4552;
    if (!_4520)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4554 = -_1430;
    float _4556 = _4554 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4558 = -_1432;
    float _4560 = _4558 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4562 = -_1434;
    float _4564 = _4562 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4566 = _4556 * _4556;
    float _4568 = fma(_4560, _4560, _4566);
    float _4570 = fma(_4564, _4564, _4568);
    float _4572 = sqrt(_4570);
    float _4574 = rsqrt(_4570);
    float _4576 = -_4572;
    float _4578 = _4576 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4580 = _4578 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4582 = precise::clamp(_4580, 0.0, 1.0);
    float _4584 = _4560 * _4574;
    float _4586 = _4556 * _4574;
    float _4588 = abs(_4582);
    float _4590 = log2(_4588);
    float _4592 = _4564 * _4574;
    float _4594 = _4584 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4596 = _3936 * _4586;
    float _4598 = -_4586;
    float _4600 = -_4594;
    float _4602 = fma(_4598, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4600);
    float _4604 = fma(_4268, _4584, _4596);
    float _4606 = -_4592;
    float _4608 = fma(_4606, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4602);
    float _4610 = fma(_4270, _4592, _4604);
    float _4612 = precise::clamp(_4610, 0.0, 1.0);
    float _4614 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4616 = _4608 + _4614;
    float _4618 = _4590 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4620 = _4616 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4622 = precise::clamp(_4620, 0.0, 1.0);
    float _4624 = exp2(_4618);
    float _4626 = _4624 * _4622;
    float _4628 = _4612 * _4626;
    float _4630 = _4628 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4632 = _4628 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4634 = _4628 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _4630;
    out.m_97.y = _4632;
    out.m_97.z = _4634;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4406 = false;
    bool _534 = false;
    bool _418 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_46.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_49.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4690 = as_type<float>(_134);
        out.gl_Position.z = _4690;
    }
    if (!_122)
    {
        return out;
    }
    float _136 = in.m_51.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_118);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    if (_164)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _128;
    if (_164)
    {
        out.m_49.x = 0.0;
    }
    int _168 = 0;
    if (_164)
    {
        float _170 = _166 * 5.0;
        _168 = as_type<int>(_170);
    }
    int _172 = _168;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4759 = as_type<float>(_172);
        out.gl_Position.z = _4759;
    }
    if (_164)
    {
        return out;
    }
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _176 = !_174;
    float _194;
    if (!_176)
    {
        float _178 = in.m_53.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_118);
        float _200 = 1.0 / _198;
        float _202 = _150 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _204 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = _204 + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = _204 + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _226;
    float _230 = 1.0 / _224;
    bool _232 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _234 = 1.0 / _228;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _236;
    float _240 = 1.0 / _220;
    float _242 = _208 * _230;
    bool _244 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _246 = isnan(_204);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    bool _256 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _258 = isnan(_204);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = _212 * _234;
    bool _270 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _272 = isnan(_204);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -_254;
    float _284 = _282 + 1.0;
    float _286 = _280 * _284;
    bool _288 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _290 = isnan(_204);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = _216 * _240;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _306;
    float _310 = -_280;
    float _312 = _310 + 1.0;
    float _314 = fma(_238, _300, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _316 = fma(_304, _300, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _318 = fma(_308, _300, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _320 = -_266;
    float _322 = _320 + 1.0;
    float _324 = _266 * _312;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _334 = _298 * _322;
    float _336 = -_298;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _344 = _316 * _334;
    float _346 = _318 * _334;
    float _348 = _314 * _334;
    float _350 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _344);
    float _352 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _346);
    float _354 = fma(_342, _242, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _356 = fma(_328, _242, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _362;
    float _366 = fma(_332, _242, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _368 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _348);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _370;
    float _374 = fma(_354, _324, _350);
    float _376 = fma(_360, _268, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _378 = fma(_364, _268, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _380 = fma(_356, _324, _352);
    float _382 = fma(_372, _268, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _384 = fma(_366, _324, _368);
    float _386 = fma(_376, _286, _374);
    float _388 = fma(_378, _286, _380);
    float _390 = fma(_382, _286, _384);
    float _392 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[146].x, _386);
    float _394 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[146].y, _388);
    float _396 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[146].z, _390);
    bool _398 = !_232;
    float _416;
    if (!_398)
    {
        float _400 = in.m_53.x;
        float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _404 = _400 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _406 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _408 = _406 * _402;
        float _410 = floor(_408);
        float _412 = -_410;
        float _414 = _408 + _412;
        _416 = _414;
        _418 = true;
    }
    else
    {
        float _420 = float(_118);
        float _422 = 1.0 / _420;
        float _424 = _150 * _422;
        _416 = _424;
    }
    _418 = false;
    float _426 = _416;
    float _428 = in.m_55.x;
    float _430 = in.m_55.y;
    float _432 = in.m_55.z;
    bool _434 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _436 = isnan(_426);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _450 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _452 = isnan(_426);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _426 + _466;
    float _470 = -_444;
    float _472 = _470 + 1.0;
    bool _474 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _476 = 1.0 / _448;
    float _478 = _460 * _472;
    float _480 = -_460;
    float _482 = _480 + 1.0;
    float _484 = _396 * _432;
    float _486 = _392 * _428;
    float _488 = _464 * _476;
    float _490 = fma(_488, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _494 = _490 * _478;
    float _496 = _394 * _430;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _500 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _502 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[115].x, _494);
    float _504 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[116].x, _502);
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _510 = _506 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _512 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _504;
    out.m_57.y = _500;
    out.m_57.z = _512;
    out.m_57.w = _510;
    bool _514 = !_474;
    float _532;
    if (!_514)
    {
        float _516 = in.m_53.x;
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _520 = _516 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _524 = _522 * _518;
        float _526 = floor(_524);
        float _528 = -_526;
        float _530 = _524 + _528;
        _532 = _530;
        _534 = true;
    }
    else
    {
        float _536 = float(_118);
        float _538 = 1.0 / _536;
        float _540 = _150 * _538;
        _532 = _540;
    }
    _534 = false;
    float _542 = _532;
    float _544 = in.m_53.y;
    float _546 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _548 = log2(_546);
    float _550 = in.m_53.x;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _556 = _554 != 0;
    float _558 = in.m_53.z;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _562 = in.m_46.x;
    float _564 = in.m_46.y;
    float _566 = in.m_46.z;
    float _568 = float(_118);
    float _570 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _572 = int(_570);
    float _574 = in.m_59.x;
    float _576 = in.m_59.y;
    float _578 = in.m_59.z;
    float _580 = in.m_59.w;
    float _582 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _584 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _586 = in.m_61.x;
    float _588 = in.m_61.y;
    float _590 = in.m_61.z;
    float _592 = in.m_61.w;
    float _594 = 1.0 / _568;
    float _596 = in.m_63.x;
    float _598 = in.m_63.y;
    float _600 = in.m_63.z;
    float _602 = in.m_63.w;
    float _604 = _544 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _606 = _544 * 2.0;
    float _608 = _550 * 2.0;
    float _610 = fma(_604, -2.0, _552);
    float _612 = _550 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _614 = _558 * 2.0;
    float _616 = floor(_608);
    float _618 = -_560;
    float _620 = fma(_612, 2.0, _618);
    float _622 = _550 + _544;
    float _624 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _610);
    float _626 = -_150;
    float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[76].x, _620);
    float _630 = _622 + (-1.0);
    float _632 = _564 * _576;
    float _634 = floor(_606);
    float _636 = _544 + _558;
    float _638 = _564 * _588;
    float _640 = fma(_562, _574, _632);
    float _642 = _636 + (-1.0);
    float _644 = _564 * _598;
    float _646 = floor(_614);
    float _648 = fma(_562, _586, _638);
    float _650 = fma(_566, _578, _640);
    float _652 = fma(_562, _596, _644);
    float _654 = fma(_566, _590, _648);
    bool _656 = _616 >= 0.0;
    bool _658 = isnan(_616);
    bool _660 = _656 || _658;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    float _666 = fma(_566, _600, _652);
    float _668 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _670 = as_type<int>(_630);
    int _672 = as_type<int>(_642);
    float _674 = _550;
    if (_556)
    {
        _670 = 0;
    }
    int _676 = _670;
    float _678 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _680 = int(_678);
    int _682 = _676;
    if (!_556)
    {
        _682 = 2;
    }
    int _684 = _682;
    float _686 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _688 = _634 >= 0.0;
    bool _690 = isnan(_634);
    bool _692 = _688 || _690;
    bool _694 = isnan(0.0);
    bool _696 = _692 || _694;
    float _698 = _650 + _580;
    if (_556)
    {
        _672 = 0;
    }
    int _700 = _672;
    float _702 = _654 + _592;
    bool _704 = _646 > 0.0;
    float _706 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _708 = int(_706);
    bool _710 = _646 >= 0.0;
    bool _712 = isnan(_646);
    bool _714 = _710 || _712;
    bool _716 = isnan(0.0);
    bool _718 = _714 || _716;
    float _720 = -_702;
    float _722 = _720 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _724 = _700;
    if (!_556)
    {
        _724 = 1;
    }
    int _726 = _724;
    float _728 = -_698;
    float _730 = _728 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _732 = _664 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _734 = _594 * _150;
    bool _736 = _634 > 0.0;
    bool _738 = _684 != 2;
    float _740 = _696 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _742 = _726 != 1;
    bool _744 = _616 > 0.0;
    int _746 = ~as_type<int>(_740);
    int _748 = _746 + 1;
    int _750 = _748 + 1;
    int _752 = _750;
    float _754 = _740;
    float _756 = as_type<float>(_726);
    float _758 = _732;
    if (!_736)
    {
        int _760 = ~as_type<int>(_740);
        int _762 = _760 + 1;
        _752 = _762;
    }
    int _764 = _752;
    if (_738)
    {
        _754 = _550;
    }
    float _766 = _754;
    float _768 = _766;
    if (!_738)
    {
        _768 = _558;
    }
    float _770 = _768;
    if (!_742)
    {
        _756 = _544;
    }
    float _772 = _756;
    int _774 = ~as_type<int>(_732);
    int _776 = _774 + 1;
    int _778 = _776 + 1;
    float _780 = _770 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _784 = _778;
    float _786 = _772;
    float _788 = _782;
    if (!_744)
    {
        int _790 = ~as_type<int>(_732);
        int _792 = _790 + 1;
        _784 = _792;
    }
    int _794 = _784;
    float _796 = _666 + _602;
    int _798 = _718 ? 0 : 1;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _804 = _802 != 0;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _808 = _806 != 0;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _812 = _810 != 0;
    float _814 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _816 = int(_814);
    if (!_742)
    {
        _758 = _772;
    }
    float _818 = _758;
    float _820 = -_800;
    float _822 = fma(_780, 2.0, _820);
    float _824 = _818;
    if (_742)
    {
        _786 = _550;
    }
    float _826 = _786;
    float _828 = -_796;
    float _830 = _828 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _832 = !_808;
    int _834 = _832 ? 0 : 1;
    float _836 = -_150;
    float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[86].x, _822);
    bool _840 = !_804;
    int _842 = _840 ? 0 : 1;
    float _844 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[83].z, _782);
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _852 = _850 != 0;
    float _854 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _844);
    if (_742)
    {
        _824 = _550;
    }
    float _856 = _824;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _860 = ~_798;
    int _862 = _860 + 1;
    int _864 = _862 + 1;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _868 = _864;
    float _870 = _866;
    if (!_704)
    {
        int _872 = ~_798;
        int _874 = _872 + 1;
        _868 = _874;
    }
    int _876 = _868;
    float _878 = _856 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _880 = !_812;
    int _882 = _880 ? 0 : 1;
    bool _884 = !_852;
    int _886 = _884 ? 0 : 1;
    float _888 = -_858;
    float _890 = fma(_878, 2.0, _888);
    float _892 = _878;
    if (!_742)
    {
        _788 = _558;
    }
    float _894 = _788;
    bool _896 = !_848;
    int _898 = _896 ? 0 : 1;
    float _900 = -_150;
    float _902 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[81].x, _890);
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _906 = _904 != 0;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _910 = _908 != 0;
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _914 = _912 != 0;
    float _916 = _894;
    if (_742)
    {
        _916 = _544;
    }
    float _918 = _916;
    float _920 = float(_876);
    bool _922 = !_906;
    int _924 = _922 ? 0 : 1;
    float _926 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[83].w, _866);
    if (!_742)
    {
        _870 = _558;
    }
    float _928 = _870;
    float _930 = in.m_65.x;
    float _932 = in.m_65.y;
    float _934 = in.m_65.z;
    int _936 = abs(_924);
    float _938 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _926);
    float _940 = _928;
    if (_742)
    {
        _940 = _544;
    }
    float _942 = _940;
    float _944 = float(_936);
    if (_738)
    {
        _892 = _544;
    }
    float _946 = _892;
    float _948 = _942 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _950 = float(_680);
    float _952 = _944 * _920;
    float _954 = _946;
    if (!_738)
    {
        _954 = _550;
    }
    float _956 = _954;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _960 = 1.0 / _950;
    float _962 = _956 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _964 = _952 * (-2.0);
    float _966 = fma(_948, -2.0, _958);
    float _968 = _548 * _150;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _972 = fma(_668, _964, _668);
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _976 = fma(_964, _930, _930);
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _980 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[78].w, _974);
    float _982 = fma(_962, -2.0, _970);
    float _984 = float(_816);
    float _986 = exp2(_968);
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _990 = _960 * _150;
    float _992 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _980);
    float _994 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[88].z, _978);
    bool _996 = !_914;
    int _998 = _996 ? 0 : 1;
    float _1000 = 1.0 / _984;
    float _1002 = float(_708);
    float _1004 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[78].z, _988);
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1008 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _994);
    int _1010 = abs(_998);
    float _1012 = _722 * _722;
    float _1014 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1004);
    float _1016 = 1.0 / _1002;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1020 = 1.0 + _1018;
    bool _1022 = !_910;
    int _1024 = _1022 ? 0 : 1;
    float _1026 = -_986;
    float _1028 = _1026 + 1.0;
    bool _1030 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1032 = isnan(1.0);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1038 = _1034 || _1036;
    float _1040 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1006);
    int _1042 = abs(_1024);
    float _1044 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _966);
    float _1046 = 1.0 / _1020;
    bool _1048 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1050 = isnan(0.0);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1056 = _1052 || _1054;
    float _1058 = _550 + (-0.5);
    float _1060 = float(_1042);
    float _1062 = _1000 * _150;
    float _1064 = float(_572);
    float _1066 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1040);
    float _1068 = _1056 ? _1028 : 0.0;
    float _1070 = _1016 * _150;
    float _1072 = float(_794);
    float _1074 = _1064 * _150;
    float _1076 = fma(_730, _730, _1012);
    float _1078 = float(_764);
    float _1080 = _1060 * _1072;
    float _1082 = float(_1010);
    float _1084 = fma(_830, _830, _1076);
    float _1086 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _982);
    if (_1038)
    {
        float _1088 = _1068 * _1046;
        _154 = _1088;
    }
    float _1090 = _154;
    float _1092 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[196].x, _976);
    float _1094 = rsqrt(_1084);
    float _1096 = _550 + _558;
    float _1098 = _1080 * (-2.0);
    float _1100 = _1082 * _1078;
    float _1102 = fma(_972, _1090, _1092);
    float _1104 = _544 + (-0.5);
    float _1106 = _1096 + (-1.0);
    float _1108 = fma(_1098, _932, _932);
    float _1110 = _1102 * 0.15915493667125701904296875;
    float _1112 = _1100 * (-2.0);
    float _1114 = fma(_686, _1098, _686);
    float _1116 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1108);
    float _1118 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1120 = fma(_1112, _934, _934);
    float _1122 = _558 + (-0.5);
    float _1124 = _730 * _1094;
    float _1126 = fma(_1114, _1090, _1116);
    float _1128 = fma(_1118, _1112, _1118);
    float _1130 = _830 * _1094;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1134 = _1124 * _1132;
    float _1136 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1120);
    float _1138 = _1126 * 0.15915493667125701904296875;
    float _1140 = _722 * _1094;
    float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1144 = _1130 * _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1148 = -_1134;
    float _1150 = fma(_1130, _1146, _1148);
    float _1152 = in.m_67.x;
    float _1154 = in.m_67.y;
    float _1156 = in.m_67.z;
    float _1158 = _1110 * 6.283185482025146484375;
    float _1160 = sin(_1158);
    float _1162 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1164 = -_1144;
    float _1166 = fma(_1140, _1162, _1164);
    float _1168 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1170 = _1110 * 6.283185482025146484375;
    float _1172 = cos(_1170);
    float _1174 = _1138 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    float _1178 = fma(_1128, _1090, _1136);
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1182 = _1140 * _1180;
    float _1184 = _1150 * _1150;
    float _1186 = _1178 * 0.15915493667125701904296875;
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1190 = -_1182;
    float _1192 = fma(_1124, _1188, _1190);
    float _1194 = fma(_1166, _1166, _1184);
    float _1196 = _1138 * 6.283185482025146484375;
    float _1198 = cos(_1196);
    float _1200 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1152);
    float _1202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1156);
    float _1204 = fma(_1192, _1192, _1194);
    float _1206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1154);
    float _1208 = _1200 * _582;
    float _1210 = _1202 * _584;
    float _1212 = _1186 * 6.283185482025146484375;
    float _1214 = cos(_1212);
    float _1216 = _1206 * _1168;
    float _1218 = _1160 * _1176;
    float _1220 = _1172 * _1176;
    float _1222 = rsqrt(_1204);
    float _1224 = _1172 * _1198;
    float _1226 = _1160 * _1198;
    float _1228 = _1186 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    float _1232 = _1172 * _1214;
    float _1234 = _1160 * _1214;
    float _1236 = _1198 * _1214;
    float _1238 = _1176 * _1214;
    float _1240 = _1232 * _1216;
    float _1242 = _1166 * _1222;
    float _1244 = _1150 * _1222;
    float _1246 = _1192 * _1222;
    float _1248 = _1140 * _1242;
    float _1250 = _1130 * _1244;
    float _1252 = fma(_1230, _1224, _1218);
    float _1254 = -_1220;
    float _1256 = fma(_1230, _1226, _1254);
    float _1258 = -_1216;
    float _1260 = _1230 * _1258;
    float _1262 = -_1226;
    float _1264 = fma(_1230, _1220, _1262);
    float _1266 = fma(_1252, _1208, _1240);
    float _1268 = fma(_1230, _1218, _1224);
    float _1270 = _1234 * _1216;
    float _1272 = fma(_1236, _1208, _1260);
    float _1274 = -_1248;
    float _1276 = fma(_1124, _1244, _1274);
    float _1278 = fma(_1264, _1210, _1266);
    float _1280 = fma(_1256, _1208, _1270);
    float _1282 = -_1250;
    float _1284 = fma(_1140, _1246, _1282);
    float _1286 = fma(_1238, _1210, _1272);
    float _1288 = _1276 * _1278;
    float _1290 = fma(_1268, _1210, _1280);
    float _1292 = _1284 * _1278;
    float _1294 = fma(_1246, _1286, _1288);
    float _1296 = fma(_1242, _1286, _1292);
    float _1298 = fma(_1130, _1290, _1294);
    float _1300 = fma(_1124, _1290, _1296);
    float _1302 = _796 + _1298;
    float _1304 = _698 + _1300;
    float _1306 = _1124 * _1246;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1310 = _1302 + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1314 = _1304 + _1312;
    float _1316 = -_1306;
    float _1318 = fma(_1130, _1242, _1316);
    float _1320 = _1310 * _1310;
    float _1322 = _1318 * _1278;
    float _1324 = fma(_1314, _1314, _1320);
    float _1326 = fma(_1244, _1286, _1322);
    float _1328 = sqrt(_1324);
    float _1330 = fma(_1140, _1290, _1326);
    float _1332 = _702 + _1330;
    bool _1334 = _1328 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1338 = _1336 != 0;
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1342 = _1340 != 0;
    int _1344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1346 = _1344 != 0;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1350 = _1348 != 0;
    bool _1352 = !_1342;
    int _1354 = _1352 ? 0 : 1;
    bool _1356 = !_1338;
    int _1358 = _1356 ? 0 : 1;
    bool _1360 = !_1346;
    int _1362 = _1360 ? 0 : 1;
    bool _1364 = !_1350;
    int _1366 = _1364 ? 0 : 1;
    float _1368 = _1330;
    float _1370 = _1290;
    float _1372 = _1306;
    float _1374 = _1332;
    float _1376 = _1310;
    bool _1378 = _1350;
    if (!_1334)
    {
        _1368 = _1304;
    }
    float _1380 = _1368;
    float _1382 = _1380;
    if (!_1334)
    {
        _1370 = _1302;
    }
    float _1384 = _1370;
    float _1386 = _1384;
    if (!_1334)
    {
        _1372 = _1332;
    }
    float _1388 = _1372;
    bool _1390 = !_1334;
    float _1392 = _1388;
    if (!_1390)
    {
        float _1394 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1398 = _1328 + _1396;
        float _1400 = _1332 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = rsqrt(_1324);
        float _1404 = _1398 * _1394;
        float _1406 = _1404 * 0.15915493667125701904296875;
        float _1408 = _1406 * 6.283185482025146484375;
        float _1410 = cos(_1408);
        float _1412 = _1406 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        float _1416 = _1410 + (-1.0);
        float _1418 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1420 = fma(_1414, _1400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1422 = fma(_1332, _1410, _1418);
        float _1424 = _1402 * _1420;
        float _1426 = fma(_1314, _1424, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1428 = fma(_1310, _1424, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1392 = _1422;
        _1382 = _1426;
        _1386 = _1428;
    }
    float _1430 = _1392;
    float _1432 = _1382;
    float _1434 = _1386;
    float _1436 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1438 = _1430 + _1436;
    float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1442 = _1432 + _1440;
    float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1446 = _1434 + _1444;
    float _1448 = _1438 * _1438;
    float _1450 = fma(_1442, _1442, _1448);
    float _1452 = fma(_1446, _1446, _1450);
    float _1454 = rsqrt(_1452);
    float _1456 = sqrt(_1452);
    float _1458 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1460 = _1442 * _1458;
    float _1462 = _1446 * _1458;
    float _1464 = _1460 * _1460;
    float _1466 = _1462 * _1462;
    float _1468 = _1464 + _1466;
    float _1470 = sqrt(_1468);
    bool _1472 = _1470 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1476 = _1470 + _1474;
    float _1478 = _1446;
    float _1480 = _1476;
    float _1482 = _1438;
    float _1484 = _1448;
    if (_1472)
    {
        float _1486 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1478 = _1486;
    }
    float _1488 = _1478;
    if (_1472)
    {
        float _1490 = rsqrt(_1468);
        _1374 = _1490;
    }
    float _1492 = _1374;
    float _1494 = _1492;
    if (_1472)
    {
        float _1496 = _1476 * _1488;
        _1480 = _1496;
    }
    float _1498 = _1480;
    if (_1472)
    {
        float _1500 = _1498 * 0.15915493667125701904296875;
        _1376 = _1500;
    }
    float _1502 = _1376;
    float _1504 = _1454;
    float _1506 = _1502;
    if (_1472)
    {
        float _1508 = _1502 * 6.283185482025146484375;
        float _1510 = sin(_1508);
        _1504 = _1510;
    }
    float _1512 = _1504;
    float _1514 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1516 = precise::max(0.0, _1514);
    float _1518 = _1314;
    float _1520 = _1516;
    if (_1472)
    {
        float _1522 = _1502 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        _1518 = _1524;
    }
    float _1526 = _1518;
    float _1528 = -_1458;
    float _1530 = -_1516;
    float _1532 = fma(_1438, _1528, _1530);
    if (!_1472)
    {
        _1482 = _1460;
    }
    float _1534 = _1482;
    float _1536 = fma(_698, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1538 = _1534;
    if (_1472)
    {
        float _1540 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1520 = _1540;
    }
    float _1542 = _1520;
    float _1544 = _1512;
    if (_1472)
    {
        float _1546 = fma(_1512, _1542, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1484 = _1546;
    }
    float _1548 = _1484;
    float _1550 = floor(_1536);
    float _1552 = _1548;
    float _1554 = _1526;
    if (_1472)
    {
        float _1556 = _1526 + (-1.0);
        _1544 = _1556;
    }
    float _1558 = _1544;
    float _1560 = 0.0;
    float _1562 = _1558;
    if (_1472)
    {
        float _1564 = _1492 * _1548;
        _1560 = _1564;
    }
    float _1566 = _1560;
    if (!_1472)
    {
        _1494 = _1532;
    }
    float _1568 = _1494;
    float _1570 = _1568;
    if (_1472)
    {
        float _1572 = _1558 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1506 = _1572;
    }
    float _1574 = _1506;
    if (_1472)
    {
        float _1576 = _1460 * _1566;
        _1538 = _1576;
    }
    float _1578 = _1538;
    if (!_1472)
    {
        _1562 = _1462;
    }
    float _1580 = _1562;
    float _1582 = _1580;
    if (_1472)
    {
        float _1584 = _1462 * _1566;
        _1582 = _1584;
    }
    float _1586 = _1582;
    if (!_1472)
    {
        _1552 = _1464;
    }
    float _1588 = _1552;
    float _1590 = _1588;
    if (_1472)
    {
        float _1592 = fma(_1532, _1526, _1574);
        _1570 = _1592;
    }
    float _1594 = _1570;
    if (_1472)
    {
        float _1596 = _1578 * _1578;
        _1590 = _1596;
    }
    float _1598 = _1590;
    if (!_1472)
    {
        _1554 = _1466;
    }
    float _1600 = _1554;
    float _1602 = _1600;
    if (_1472)
    {
        float _1604 = _1586 * _1586;
        _1602 = _1604;
    }
    float _1606 = _1602;
    float _1608 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1610 = fma(_1594, _1594, _1598);
    float _1612 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1614 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1616 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1608);
    float _1618 = _1610 + _1606;
    float _1620 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1624 = fma(_1456, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1622);
    float _1626 = precise::clamp(_1624, 0.0, 1.0);
    float _1628 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1612);
    float _1630 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1616);
    float _1632 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1620);
    float _1634 = rsqrt(_1618);
    float _1636 = -_1626;
    float _1638 = _1636 + 1.0;
    float _1640 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1628);
    float _1642 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1632);
    float _1644 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1646 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1614);
    float _1648 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1650 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1652 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1654 = abs(_1638);
    float _1656 = log2(_1654);
    float _1658 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1660 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1662 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1646);
    float _1664 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1652);
    float _1666 = _1634 * _1578;
    float _1668 = -_1660;
    float _1670 = fma(_1668, _1658, 1.0);
    float _1672 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1674 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1664);
    float _1676 = _1634 * _1594;
    float _1678 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1680 = _1634 * _1586;
    float _1682 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1674);
    float _1684 = fma(_796, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1686 = -_1678;
    float _1688 = fma(_1676, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1686);
    float _1690 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1692 = -_1550;
    float _1694 = _1536 + _1692;
    float _1696 = floor(_1684);
    float _1698 = -_1680;
    float _1700 = fma(_1698, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1688);
    float _1702 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1704 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1706 = fma(_1700, -0.5, 0.5);
    float _1708 = fma(_1700, 0.5, 0.5);
    float _1710 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1702);
    float _1712 = exp2(_1690);
    float _1714 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1704);
    float _1716 = _1676 + 1.0;
    float _1718 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1710);
    float _1720 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1714);
    float _1722 = log2(_1670);
    float _1724 = -_1696;
    float _1726 = _1684 + _1724;
    float _1728 = fma(_1708, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1730 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1718);
    float _1732 = fma(_1708, _1728, -0.212114393711090087890625);
    float _1734 = 1.0 / _1682;
    float _1736 = -_1676;
    float _1738 = fma(_1712, _1716, _1736);
    float _1740 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1720);
    float _1742 = fma(_1708, _1732, 1.570728778839111328125);
    float _1744 = fma(_1738, 0.5, 0.5);
    float _1746 = sqrt(_1706);
    float _1748 = _1722 * 0.693147182464599609375;
    float2 _7250 = float2(_1694, _1726);
    float _1750 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7250, float2(0.0), isnan(_7250)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7250, float2(0.0), isnan(_7250)), level(0.0)).x;
    float _1752 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1754 = _1730 * _1734;
    float _1756 = _1740 * _1734;
    float _1758 = fma(_1754, 0.5, 0.5);
    float _1760 = fma(_1756, -0.5, 0.5);
    float _1762 = _1746 * 0.636619746685028076171875;
    float _1764 = -_1742;
    float _1766 = fma(_1762, _1764, 1.0);
    float3 _7283 = float3(_1758, _1760, _1752);
    float _1768 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7283, float3(0.0), isnan(_7283)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7283, float3(0.0), isnan(_7283)), level(0.0)).x;
    float3 _7294 = float3(_1758, _1760, _1752);
    float4 _1771 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7294, float3(0.0), isnan(_7294)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7294, float3(0.0), isnan(_7294)), level(0.0)).xyzw;
    float _1773 = _1771.x;
    float _1775 = _1771.y;
    float _1777 = _1771.z;
    float _1779 = _1771.w;
    float2 _7310 = float2(_1766, _1744);
    float3 _1783 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7310, float2(0.0), isnan(_7310)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7310, float2(0.0), isnan(_7310)), level(0.0)).xyz;
    float _1785 = _1783.x;
    float _1787 = _1783.y;
    float _1789 = _1783.z;
    float _1791 = in.m_69.x;
    float _1793 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1795 = int(_1793);
    float _1797 = _1074 * _594;
    float _1799 = in.m_53.w;
    float _1801 = _1264 * _1284;
    float _1803 = float(uint(_572));
    float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1807 = _1805 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1811 = _1809 != 0;
    float _1813 = trunc(_990);
    int _1815 = int(_1813);
    int _1817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1819 = _1817 != 0;
    float _1821 = _1264 * _1318;
    bool _1823 = _544 > 0.5;
    float _1825 = _1264 * _1276;
    bool _1827 = _558 > 0.5;
    float _1829 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1831 = float(uint(_1795));
    float _1833 = 1.0 / _1803;
    float _1835 = fma(_1238, _1246, _1825);
    int _1837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1839 = _1837 != 0;
    out.m_71.x = _1432;
    out.m_71.y = _1430;
    out.m_71.z = _1434;
    float _1841 = _1758;
    float _1843 = _1803;
    float _1845 = _1682;
    float _1847 = _1740;
    if (_1811)
    {
        bool _1849 = _550 > 0.5;
        _1378 = _1849;
    }
    bool _1851 = _1378;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1855 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1853;
    if (_1819)
    {
        _1841 = 1.0;
    }
    float _1857 = _1841;
    float _1859 = 1.0 / _1831;
    float _1861 = _1857;
    if (!_1811)
    {
        _1843 = _1791;
    }
    float _1863 = _1843;
    float _1865 = _1863;
    if (!_1819)
    {
        _1861 = 7.345489978790283203125;
    }
    float _1867 = _1861;
    bool _1869 = _1799 > 0.5;
    float _1871 = _1799;
    if (!_1811)
    {
        _1871 = _1863;
    }
    float _1873 = _1871;
    float _1875 = trunc(_1070);
    int _1877 = int(_1875);
    float _1879 = _1873;
    if (_1811)
    {
        _1865 = _1791;
    }
    float _1881 = _1865;
    float _1883 = _1867 * _550;
    int _1885 = as_type<int>(_1833) + (-2);
    float _1887 = float(uint(_1815));
    float _1889 = 0.0;
    if (_1819)
    {
        _1889 = _550;
    }
    float _1891 = _1889;
    float _1893 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1895 = int(_1893);
    float _1897 = 0.0;
    float _1899 = _1891;
    if (_1819)
    {
        _1897 = 1.0;
    }
    float _1901 = _1897;
    float _1903 = as_type<float>(_1885) * _1887;
    float _1905 = _1901;
    if (!_1819)
    {
        _1899 = _544;
    }
    float _1907 = _1899;
    if (!_1819)
    {
        _1905 = 1.2345600128173828125;
    }
    float _1909 = _1905;
    float _1911 = in.m_69.y;
    int _1913 = as_type<int>(_1859) + (-2);
    float _1915 = trunc(_1903);
    float _1917 = precise::max(_1915, 0.0);
    uint _1920 = uint(_1917);
    float _1922 = float(uint(_1877));
    float _1924 = _1907 * _1909;
    float _1926 = 0.0;
    int _1928 = as_type<int>(_1922);
    if (_1819)
    {
        _1926 = 1.0;
    }
    float _1930 = _1926;
    float _1932 = _1930;
    if (!_1819)
    {
        _674 = _558;
    }
    float _1934 = _674;
    float _1936 = as_type<float>(_1913) * _1922;
    if (!_1819)
    {
        _1932 = 5.839270114898681640625;
    }
    float _1938 = _1932;
    float _1940 = 1.0 / _1807;
    float _1942 = float(uint(_1895));
    if (_1811)
    {
        float _1944 = -_1881;
        float _1946 = _1944 + 1.0;
        _1928 = as_type<int>(_1946);
    }
    int _1948 = _1928;
    int _1950 = ~_572;
    int _1952 = _1950 + 1;
    float _1954 = _1934 * _1938;
    int _1956 = ~_1795;
    int _1958 = _1956 + 1;
    if (_1811)
    {
        float _1960 = _1851 ? as_type<float>(_1948) : _1881;
        _1879 = _1960;
    }
    float _1962 = _1879;
    float _1964 = trunc(_1936);
    float _1966 = precise::max(_1964, 0.0);
    uint _1968 = uint(_1966);
    int _1970 = _1952 * int(_1920);
    int _1972 = _1970 + _1815;
    int _1974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1976 = _1974 != 0;
    int _1978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1980 = _1978 != 0;
    float _1982 = float(uint(_1972));
    float _1984 = -_1911;
    float _1986 = _1984 + 1.0;
    float _1988 = 1.0 / _1942;
    float _1990 = _1855 * _1940;
    int _1992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1994 = _1992 != 0;
    float _1996 = as_type<float>(_1885) * _1982;
    int _1998 = _1869 ? as_type<int>(_1986) : as_type<int>(_1911);
    int _2000 = _1823 ? as_type<int>(_1986) : as_type<int>(_1911);
    float _2002 = trunc(_1062);
    int _2004 = int(_2002);
    int _2006 = _1958 * int(_1968);
    int _2008 = _2006 + _1877;
    float _2010 = _1839 ? as_type<float>(_1998) : _1911;
    int _2012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2014 = _2012 != 0;
    float _2016 = float(uint(_2008));
    int _2018 = as_type<int>(_1988) + (-2);
    float _2020 = trunc(_1996);
    float _2022 = precise::max(_2020, 0.0);
    uint _2024 = uint(_2022);
    int _2026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2028 = _2026 != 0;
    float _2030 = as_type<float>(_1913) * _2016;
    float _2032 = _1976 ? as_type<float>(_2000) : _1911;
    float _2034 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2036 = _542 + _2034;
    int _2038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2040 = _2038 != 0;
    float _2042 = float(uint(_2004));
    float _2044 = floor(_1883);
    int _2046 = as_type<int>(_1996);
    float _2048 = _2036;
    float _2050 = _1911;
    if (_1980)
    {
        float _2052 = -_1881;
        float _2054 = _2052 + 1.0;
        _2046 = as_type<int>(_2054);
    }
    int _2056 = _2046;
    float _2058 = fma(_1990, _2036, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2060 = float(_1815);
    float _2062 = as_type<float>(_2018) * _2042;
    if (!_1980)
    {
        _2048 = _1881;
    }
    float _2064 = _2048;
    float _2066 = _2064;
    if (_1980)
    {
        float _2068 = _1827 ? as_type<float>(_2056) : _1881;
        _2066 = _2068;
    }
    float _2070 = _2066;
    float _2072 = floor(_1924);
    bool _2074 = _2060 >= _1064;
    bool _2076 = isnan(_2060);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan(_1064);
    bool _2082 = _2078 || _2080;
    float _2084 = float(_2082);
    if (_2040)
    {
        float _2086 = _1827 ? _1986 : _1911;
        _2050 = _2086;
    }
    float _2088 = _2050;
    int _2090 = int(_1920) + int(_2024);
    int _2092 = ~_572;
    int _2094 = _2092 + 1;
    float _2096 = floor(_1954);
    float _2098 = -_2044;
    float _2100 = _1883 + _2098;
    int _2102 = ~_1795;
    int _2104 = _2102 + 1;
    int _2106 = _2094 * _2090;
    int _2108 = _2106 + _1815;
    float _2110 = _2100 * _1064;
    float _2112 = float(_1877);
    float _2114 = trunc(_2030);
    float _2116 = precise::max(_2114, 0.0);
    uint _2118 = uint(_2116);
    float _2120 = -_2072;
    float _2122 = _1924 + _2120;
    int _2124 = ~_1895;
    int _2126 = _2124 + 1;
    float _2128 = float(_1895);
    int _2130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2132 = _2130 != 0;
    float _2134 = trunc(_2062);
    float _2136 = precise::max(_2134, 0.0);
    uint _2138 = uint(_2136);
    float _2140 = -_2096;
    float _2142 = _1954 + _2140;
    float _2144 = float(_1795);
    float _2146 = float(_2004);
    bool _2148 = uint(_2108) >= uint(_572);
    float _2150 = _2144 * _2122;
    int _2152 = int(_1968) + int(_2118);
    float _2154 = trunc(_2110);
    int _2156 = int(_2154);
    bool _2158 = _2112 >= _2144;
    bool _2160 = isnan(_2112);
    bool _2162 = _2158 || _2160;
    bool _2164 = isnan(_2144);
    bool _2166 = _2162 || _2164;
    float _2168 = float(_2166);
    float _2170 = _2144 * _734;
    int _2172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2174 = _2172 != 0;
    int _2176 = abs(_834);
    int _2178 = abs(_1354);
    float _2180 = trunc(_2084);
    int _2182 = int(_2180);
    int _2184 = _2104 * _2152;
    int _2186 = _2184 + _1877;
    int _2188 = abs(_1358);
    int _2190 = abs(_1362);
    int _2192 = abs(_886);
    float _2194 = trunc(_2150);
    int _2196 = int(_2194);
    int _2198 = _2126 * int(_2138);
    int _2200 = _2198 + _2004;
    bool _2202 = _2146 >= _2128;
    bool _2204 = isnan(_2146);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan(_2128);
    bool _2210 = _2206 || _2208;
    float _2212 = float(_2210);
    bool _2214 = !_2148;
    int _2216 = _2214 ? 0 : (-1);
    float _2218 = float(uint(_2200));
    float _2220 = _2128 * _734;
    bool _2222 = !_2132;
    int _2224 = _2222 ? 0 : 1;
    float _2226 = trunc(_2168);
    int _2228 = int(_2226);
    bool _2230 = uint(_2186) >= uint(_1795);
    float _2232 = as_type<float>(_2018) * _2218;
    bool _2234 = !_2174;
    int _2236 = _2234 ? 0 : 1;
    float _2238 = _2128 * _2142;
    int _2240 = ~_2090;
    int _2242 = _2240 + _2216;
    int _2244 = _2242 + 1;
    int _2246 = abs(_2236);
    float _2248 = trunc(_1797);
    int _2250 = int(_2248);
    bool _2252 = !_2230;
    int _2254 = _2252 ? 0 : (-1);
    int _2256 = _572 * _2244;
    int _2258 = _2256 + _1815;
    int _2260 = abs(_2224);
    bool _2262 = _572 == 0;
    int _2264 = ~_2152;
    int _2266 = _2264 + _2254;
    int _2268 = _2266 + 1;
    int _2270 = _2156 * _2260;
    int _2272 = _2270 + _1815;
    int _2274 = ~_2182;
    int _2276 = _2274 + 1;
    int _2278 = _2276 + 1;
    int _2280 = _2196 * _2246;
    int _2282 = _2280 + _1877;
    bool _2284 = !_2262;
    int _2286 = _2284 ? _2258 : (-1);
    int _2288 = _1795 * _2268;
    int _2290 = _2288 + _1877;
    bool _2292 = _1795 == 0;
    float _2294 = trunc(_2232);
    float _2296 = precise::max(_2294, 0.0);
    uint _2298 = uint(_2296);
    int _2300 = ~_2228;
    int _2302 = _2300 + 1;
    int _2304 = _2302 + 1;
    int _2306 = _2286 * _2278;
    bool _2308 = !_2292;
    int _2310 = _2308 ? _2290 : (-1);
    int _2312 = _572 + (-1);
    int _2314 = _1795 + (-1);
    int _2316 = _2304 * _2310;
    int _2318 = ~_1895;
    int _2320 = _2318 + 1;
    int _2322 = _2182 * _2312;
    int _2324 = _2322 + _2306;
    int _2326 = abs(_842);
    int _2328 = _2228 * _2314;
    int _2330 = _2328 + _2316;
    int _2332 = abs(_882);
    int _2334 = _2324 * _2176;
    float _2336 = trunc(_2170);
    int _2338 = int(_2336);
    int _2340 = _2330 * _2178;
    int _2342 = int(_2138) + int(_2298);
    int _2344 = _2250 * _2326;
    int _2346 = _2344 + _2334;
    bool _2348 = !_1994;
    int _2350 = _2348 ? 0 : 1;
    int _2352 = _2272 * _2332;
    int _2354 = _2352 + _2346;
    int _2356 = abs(_2350);
    float _2358 = trunc(_2212);
    int _2360 = int(_2358);
    int _2362 = abs(_1366);
    int _2364 = _2320 * _2342;
    int _2366 = _2364 + _2004;
    int _2368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2370 = _2368 != 0;
    int _2372 = _2156 * _2356;
    int _2374 = _2372 + _2354;
    int _2376 = ~_1895;
    int _2378 = _2376 + 1;
    bool _2380 = uint(_2366) >= uint(_1895);
    int _2382 = _2338 * _2188;
    int _2384 = _2382 + _2340;
    float _2386 = float(uint(_2374));
    float _2388 = trunc(_2220);
    int _2390 = int(_2388);
    bool _2392 = !_2380;
    int _2394 = _2392 ? 0 : (-1);
    bool _2396 = !_2370;
    int _2398 = _2396 ? 0 : 1;
    float _2400 = as_type<float>(_1885) * _2386;
    int _2402 = ~_2342;
    int _2404 = _2402 + _2394;
    int _2406 = _2404 + 1;
    int _2408 = _2282 * _2190;
    int _2410 = _2408 + _2384;
    int _2412 = abs(_2398);
    float _2414 = _702 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2416 = _1895 == 0;
    float _2418 = trunc(_2400);
    float _2420 = precise::max(_2418, 0.0);
    uint _2422 = uint(_2420);
    int _2424 = _1895 * _2406;
    int _2426 = _2424 + _2004;
    float _2428 = _702 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2430 = ~_2360;
    int _2432 = _2430 + 1;
    int _2434 = _2432 + 1;
    float _2436 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2414);
    float _2438 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2428);
    bool _2440 = !_2416;
    int _2442 = _2440 ? _2426 : (-1);
    float _2444 = trunc(_2238);
    int _2446 = int(_2444);
    int _2448 = ~_572;
    int _2450 = _2448 + 1;
    float _2452 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2438);
    int _2454 = _1895 + (-1);
    int _2456 = _2434 * _2442;
    int _2458 = ~_1795;
    int _2460 = _2458 + 1;
    int _2462 = _2196 * _2362;
    int _2464 = _2462 + _2410;
    int _2466 = abs(_898);
    int _2468 = _2360 * _2454;
    int _2470 = _2468 + _2456;
    int _2472 = _2450 * int(_2422);
    int _2474 = _2472 + _2374;
    bool _2476 = !_2014;
    int _2478 = _2476 ? 0 : 1;
    float _2480 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2436);
    int _2482 = _2470 * _2192;
    float _2484 = float(uint(_2474));
    int _2486 = _2446 * _2412;
    int _2488 = _2486 + _2004;
    float _2490 = float(uint(_2464));
    int _2492 = _2390 * _2466;
    int _2494 = _2492 + _2482;
    int _2496 = abs(_2478);
    float _2498 = as_type<float>(_1885) * _2484;
    bool _2500 = !_2028;
    int _2502 = _2500 ? 0 : 1;
    float _2504 = as_type<float>(_1913) * _2490;
    float _2506 = trunc(_2498);
    float _2508 = precise::max(_2506, 0.0);
    uint _2510 = uint(_2508);
    int _2512 = abs(_2502);
    float _2514 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2516 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2518 = isnan(_542);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2524 = _2520 || _2522;
    float _2526 = float(_2524);
    int _2528 = _2488 * _2496;
    int _2530 = _2528 + _2494;
    float _2532 = float(uint(_2272));
    float _2534 = _2480 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2538 = _2536 != 0;
    float _2540 = trunc(_2504);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    int _2546 = ~_572;
    int _2548 = _2546 + 1;
    float _2550 = as_type<float>(_1885) * _2532;
    float _2552 = _2534 + _2514;
    float _2554 = -_1750;
    float _2556 = _2554 + 1.0;
    float _2558 = trunc(_2550);
    float _2560 = precise::max(_2558, 0.0);
    uint _2562 = uint(_2560);
    bool _2564 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2566 = isnan(_542);
    bool _2568 = _2564 || _2566;
    bool _2570 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2572 = _2568 || _2570;
    float _2574 = float(_2572);
    float _2576 = -_2526;
    float _2578 = _2576 + 1.0;
    int _2580 = int(_2422) + int(_2510);
    float _2582 = float(uint(_2282));
    int _2584 = _2446 * _2512;
    int _2586 = _2584 + _2530;
    float _2588 = _2574 * _2578;
    int _2590 = _2460;
    float _2592 = _2588;
    float _2594 = as_type<float>(_2298);
    float _2596 = as_type<float>(_2228);
    if (_2538)
    {
        float _2598 = -_1881;
        float _2600 = _2598 + 1.0;
        _2590 = as_type<int>(_2600);
    }
    int _2602 = _2590;
    float _2604 = 1.0 / _2514;
    float _2606 = float(uint(_2586));
    float _2608 = _2058 * _2588;
    int _2610 = _2460 * int(_2544);
    int _2612 = _2610 + _2464;
    if (!_2538)
    {
        _2592 = _1881;
    }
    float _2614 = _2592;
    float _2616 = as_type<float>(_1913) * _2582;
    float _2618 = as_type<float>(_2018) * _2606;
    int _2620 = ~_572;
    int _2622 = _2620 + 1;
    float _2624 = -_2574;
    float _2626 = _2624 + 1.0;
    float _2628 = float(uint(_2612));
    float _2630 = exp2(_1829);
    float _2632 = _2614;
    float _2634 = _2626;
    if (_2538)
    {
        float _2636 = _1823 ? as_type<float>(_2602) : _1881;
        _2632 = _2636;
    }
    float _2638 = _2632;
    float _2640 = as_type<float>(_1913) * _2628;
    float _2642 = float(uint(_2488));
    int _2644 = _2622 * _2580;
    int _2646 = _2644 + _2374;
    float _2648 = trunc(_2618);
    float _2650 = precise::max(_2648, 0.0);
    uint _2652 = uint(_2650);
    int _2654 = ~_1895;
    int _2656 = _2654 + 1;
    float _2658 = as_type<float>(_2018) * _2642;
    bool _2660 = uint(_2646) >= uint(_572);
    int _2662 = _2548 * int(_2562);
    int _2664 = _2662 + _2272;
    float _2666 = fma(_2626, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2608);
    bool _2668 = !_2660;
    int _2670 = _2668 ? 0 : (-1);
    float _2672 = trunc(_2640);
    float _2674 = precise::max(_2672, 0.0);
    uint _2676 = uint(_2674);
    float _2678 = -_2630;
    float _2680 = _2678 + 1.0;
    int _2682 = ~_2580;
    int _2684 = _2682 + _2670;
    int _2686 = _2684 + 1;
    int _2688 = ~_1895;
    int _2690 = _2688 + 1;
    float _2692 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2694 = trunc(_2658);
    float _2696 = precise::max(_2694, 0.0);
    uint _2698 = uint(_2696);
    float _2700 = float(uint(_2664));
    int _2702 = _572 * _2686;
    int _2704 = _2702 + _2374;
    float _2706 = _2552 * _2604;
    float _2708 = _2706 * 0.5;
    float _2710 = _2692 * _1768;
    float _2712 = as_type<float>(_1885) * _2700;
    int _2714 = _2656 * int(_2652);
    int _2716 = _2714 + _2586;
    int _2718 = int(_2544) + int(_2676);
    float _2720 = trunc(_2616);
    float _2722 = precise::max(_2720, 0.0);
    uint _2724 = uint(_2722);
    int _2726 = ~_1795;
    int _2728 = _2726 + 1;
    float _2730 = -_2692;
    float _2732 = _2730 + 1.0;
    float _2734 = float(uint(_2716));
    bool _2736 = !_2262;
    int _2738 = _2736 ? _2704 : (-1);
    float _2740 = as_type<float>(_2018) * _2734;
    float _2742 = trunc(_2712);
    float _2744 = precise::max(_2742, 0.0);
    uint _2746 = uint(_2744);
    int _2748 = ~_1795;
    int _2750 = _2748 + 1;
    int _2752 = _2690 * int(_2698);
    int _2754 = _2752 + _2488;
    int _2756 = _2738 & 3;
    bool _2758 = _2756 != 0;
    int _2760 = _2738 & 3;
    bool _2762 = _2760 != 0;
    int _2764 = _2728 * int(_2724);
    int _2766 = _2764 + _2282;
    float _2768 = trunc(_2740);
    float _2770 = precise::max(_2768, 0.0);
    uint _2772 = uint(_2770);
    float _2774 = float(uint(_2754));
    int _2776 = _2750 * _2718;
    int _2778 = _2776 + _2464;
    bool _2780 = uint(_2756) > 1u;
    float _2782 = float(uint(_2766));
    float _2784 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2786 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2784);
    bool _2788 = uint(_2778) >= uint(_1795);
    float _2790 = as_type<float>(_2018) * _2774;
    int _2792 = int(_2562) + int(_2746);
    float _2794 = as_type<float>(_1913) * _2782;
    int _2796 = ~_1895;
    int _2798 = _2796 + 1;
    float _2800 = 1.0 / _2786;
    bool _2802 = !_2788;
    int _2804 = _2802 ? 0 : (-1);
    int _2806 = _2762 ? 0 : 1;
    int _2808 = int(_2652) + int(_2772);
    float _2810 = trunc(_2794);
    float _2812 = precise::max(_2810, 0.0);
    uint _2814 = uint(_2812);
    int _2816 = ~_572;
    int _2818 = _2816 + 1;
    bool _2820 = uint(_2756) >= 2u;
    int _2822 = _2798 * _2808;
    int _2824 = _2822 + _2586;
    bool _2826 = _2756 != 3;
    int _2828 = _2818 * _2792;
    int _2830 = _2828 + _2272;
    int _2832 = ~_2718;
    int _2834 = _2832 + _2804;
    int _2836 = _2834 + 1;
    int _2838 = ~_2806;
    int _2840 = _2838 + 1;
    int _2842 = _2840 + 1;
    float _2844 = in.m_73.x;
    float _2846 = in.m_73.y;
    float _2848 = in.m_73.z;
    int _2850 = _2842;
    if (!_2780)
    {
        int _2852 = ~_2806;
        int _2854 = _2852 + 1;
        _2850 = _2854;
    }
    int _2856 = _2850;
    int _2858 = _1795 * _2836;
    int _2860 = _2858 + _2464;
    int _2862 = _2820 ? 0 : 1;
    bool _2864 = uint(_2824) >= uint(_1895);
    bool _2866 = !_2292;
    int _2868 = _2866 ? _2860 : (-1);
    bool _2870 = !_2864;
    int _2872 = _2870 ? 0 : (-1);
    bool _2874 = uint(_2830) >= uint(_572);
    int _2876 = ~_2862;
    int _2878 = _2876 + 1;
    int _2880 = _2878 + 1;
    int _2882 = _2880;
    float _2884 = as_type<float>(_2860);
    if (_2826)
    {
        int _2886 = ~_2862;
        int _2888 = _2886 + 1;
        _2882 = _2888;
    }
    int _2890 = _2882;
    int _2892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2894 = _2892 != 0;
    bool _2896 = !_2874;
    int _2898 = _2896 ? 0 : (-1);
    int _2900 = _2868 & 3;
    bool _2902 = _2900 != 0;
    int _2904 = ~_2808;
    int _2906 = _2904 + _2872;
    int _2908 = _2906 + 1;
    bool _2910 = !_2894;
    int _2912 = _2910 ? 0 : 1;
    bool _2914 = uint(_2900) >= 2u;
    int _2916 = _1895 * _2908;
    int _2918 = _2916 + _2586;
    int _2920 = int(_2724) + int(_2814);
    float _2922 = trunc(_2790);
    float _2924 = precise::max(_2922, 0.0);
    uint _2926 = uint(_2924);
    int _2928 = _2914 ? 0 : 1;
    bool _2930 = uint(_2900) > 1u;
    int _2932 = _2902 ? 0 : 1;
    bool _2934 = _2900 != 3;
    bool _2936 = _1154 != 0.0;
    bool _2938 = isnan(_1154);
    bool _2940 = _2936 || _2938;
    bool _2942 = isnan(0.0);
    bool _2944 = _2940 || _2942;
    int _2946 = ~_1795;
    int _2948 = _2946 + 1;
    bool _2950 = !_2416;
    int _2952 = _2950 ? _2918 : (-1);
    bool _2954 = _1152 == 0.0;
    bool _2956 = !_2944;
    bool _2958 = _2954 && _2956;
    int _2960 = _2948 * _2920;
    int _2962 = _2960 + _2282;
    int _2964 = ~_2932;
    int _2966 = _2964 + 1;
    int _2968 = _2966 + 1;
    int _2970 = _2968;
    if (!_2930)
    {
        int _2972 = ~_2932;
        int _2974 = _2972 + 1;
        _2970 = _2974;
    }
    int _2976 = _2970;
    int _2978 = int(_2698) + int(_2926);
    float _2980 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2982 = _2800 * _2980;
    int _2984 = _2952 & 3;
    bool _2986 = _2984 != 0;
    bool _2988 = _1156 == 0.0;
    bool _2990 = _2988 && _2958;
    float _2992 = abs(_2982);
    float _2994 = log2(_2992);
    int _2996 = ~_2928;
    int _2998 = _2996 + 1;
    int _3000 = _2998 + 1;
    int _3002 = _2378 * _2978;
    int _3004 = _3002 + _2488;
    int _3006 = _3000;
    if (_2934)
    {
        int _3008 = ~_2928;
        int _3010 = _3008 + 1;
        _3006 = _3010;
    }
    int _3012 = _3006;
    bool _3014 = uint(_2962) >= uint(_1795);
    int _3016 = _2986 ? 0 : 1;
    float _3018 = in.m_75.x;
    float _3020 = in.m_75.y;
    float _3022 = in.m_75.z;
    float _3024 = in.m_75.w;
    bool _3026 = _2984 != 3;
    bool _3028 = !_3014;
    int _3030 = _3028 ? 0 : (-1);
    bool _3032 = uint(_2984) >= 2u;
    if (_2990)
    {
        _2594 = _2846;
    }
    float _3034 = _2594;
    float _3036 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3038 = _3032 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _3040 = _3038;
    float _3042 = _3034;
    if (_2990)
    {
        _2596 = _2848;
    }
    float _3044 = _2596;
    bool _3046 = uint(_2984) > 1u;
    float _3048 = exp2(_3036);
    int _3050 = ~as_type<int>(_3038);
    int _3052 = _3050 + 1;
    int _3054 = _3052 + 1;
    int _3056 = _3054;
    float _3058 = _3044;
    if (_3026)
    {
        int _3060 = ~as_type<int>(_3038);
        int _3062 = _3060 + 1;
        _3056 = _3062;
    }
    int _3064 = _3056;
    if (_2990)
    {
        _2884 = _3034;
    }
    float _3066 = _2884;
    float _3068 = _3066;
    if (_2990)
    {
        _3040 = _3044;
    }
    float _3070 = _3040;
    float _3072 = _3070;
    if (!_2990)
    {
        _3042 = _2846;
    }
    float _3074 = _3042;
    float _3076 = _3022 * _2844;
    if (!_2990)
    {
        _3058 = _2848;
    }
    float _3078 = _3058;
    if (_2990)
    {
        _2634 = _2844;
    }
    float _3080 = _2634;
    float _3082 = _3080;
    if (!_2990)
    {
        float _3084 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2844);
        _3082 = _3084;
    }
    float _3086 = _3082;
    bool _3088 = uint(_3004) >= uint(_1895);
    if (!_2990)
    {
        float _3090 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3074);
        _3068 = _3090;
    }
    float _3092 = _3068;
    if (!_2990)
    {
        float _3094 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3078);
        _3072 = _3094;
    }
    float _3096 = _3072;
    float _3098 = -_3076;
    float _3100 = fma(_3018, _3078, _3098);
    float _3102 = _3020 * _3078;
    float _3104 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3106 = ~_3016;
    int _3108 = _3106 + 1;
    int _3110 = _3108 + 1;
    float _3112 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3114 = _3110;
    if (!_3046)
    {
        int _3116 = ~_3016;
        int _3118 = _3116 + 1;
        _3114 = _3118;
    }
    int _3120 = _3114;
    float _3122 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3124 = !_3088;
    int _3126 = _3124 ? 0 : (-1);
    float _3128 = _3104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3132 = _3130 != 0;
    float _3134 = _3112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3138 = _3136 != 0;
    float _3140 = fma(_2526, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2666);
    float _3142 = _3122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3144 = _3018 * _3074;
    float _3146 = -_3102;
    float _3148 = fma(_3022, _3074, _3146);
    float _3150 = _3140 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3152 = _2738 >> 31;
    float _3154 = fma(_3048, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3156 = precise::clamp(_3154, 0.0, 1.0);
    float _3158 = -_3144;
    float _3160 = fma(_3020, _2844, _3158);
    out.m_77.x = _3128;
    out.m_77.y = _3134;
    out.m_77.z = _3142;
    out.m_77.w = _3150;
    int _3162 = _3152 & 3;
    float _3164 = _3100 * _3024;
    int _3166 = _2868 & 3;
    bool _3168 = _3166 != 0;
    float _3170 = fma(_3156, -2.0, 3.0);
    int _3172 = _2738 + _3162;
    float _3174 = _3148 * _3024;
    float _3176 = _3160 * _3024;
    float _3178 = _1252 * _1284;
    float _3180 = _3156 * _3156;
    float _3182 = _1252 * _1318;
    int _3184 = ~_2978;
    int _3186 = _3184 + _3126;
    int _3188 = _3186 + 1;
    float _3190 = fma(_1236, _1242, _3178);
    float _3192 = _3180 * _3170;
    int _3194 = _2868 >> 31;
    float _3196 = _1252 * _1276;
    int _3198 = _2952 >> 31;
    float _3200 = _1232 * _1284;
    int _3202 = _3194 & 3;
    float _3204 = _1232 * _1318;
    int _3206 = _3198 & 3;
    float _3208 = _1232 * _1276;
    int _3210 = _2868 + _3202;
    float _3212 = fma(_1236, _1244, _3182);
    int _3214 = _2952 + _3206;
    float _3216 = -_1230;
    float _3218 = fma(_3216, _1244, _3204);
    int _3220 = _3172 >> 2;
    float _3222 = fma(_1236, _1246, _3196);
    int _3224 = _3210 >> 2;
    float _3226 = -_1230;
    float _3228 = fma(_3226, _1242, _3200);
    int _3230 = _3214 >> 2;
    float _3232 = -_1230;
    float _3234 = fma(_3232, _1246, _3208);
    int _3236 = _3220 << 4;
    int _3238 = _3236 + 368;
    float _3240 = fma(_1238, _1242, _1801);
    int _3242 = _3224 << 4;
    int _3244 = _3242 + 512;
    float _3246 = fma(_1238, _1244, _1821);
    uint _3248 = uint(int(uint(_3238) >> uint(2)));
    uint _3250 = uint(int(uint(int(_3248)) >> uint(2)));
    int _3252 = int(_3248) & 3;
    float _3254 = (*spvDescriptorSet0.vp_c9)._m0[int(_3250)][_3252];
    int _3256 = int(_3248) + 1;
    uint _3258 = uint(int(uint(_3256) >> uint(2)));
    int _3260 = _3256 & 3;
    float _3262 = (*spvDescriptorSet0.vp_c9)._m0[int(_3258)][_3260];
    int _3264 = _3230 << 4;
    int _3266 = _3264 + 656;
    int _3268 = _1895 * _3188;
    int _3270 = _3268 + _2488;
    int _3272 = ~_2792;
    int _3274 = _3272 + _2898;
    int _3276 = _3274 + 1;
    float _3278 = -_3192;
    float _3280 = _3278 + 1.0;
    bool _3282 = !_3168;
    int _3284 = _3282 ? 0 : 1;
    float _3286 = fma(_1256, _1124, _3190);
    int _3288 = _2952 & 3;
    bool _3290 = _3288 != 0;
    uint _3292 = uint(int(uint(_3244) >> uint(2)));
    uint _3294 = uint(int(uint(int(_3292)) >> uint(2)));
    int _3296 = int(_3292) & 3;
    float _3298 = (*spvDescriptorSet0.vp_c9)._m0[int(_3294)][_3296];
    int _3300 = int(_3292) + 1;
    uint _3302 = uint(int(uint(_3300) >> uint(2)));
    int _3304 = _3300 & 3;
    float _3306 = (*spvDescriptorSet0.vp_c9)._m0[int(_3302)][_3304];
    int _3308 = ~_2920;
    int _3310 = _3308 + _3030;
    int _3312 = _3310 + 1;
    float _3314 = fma(_3280, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3192);
    bool _3316 = !_3290;
    int _3318 = _3316 ? 0 : 1;
    int _3320 = _572 * _3276;
    int _3322 = _3320 + _2272;
    bool _3324 = _2756 != 3;
    int _3326 = _1795 * _3312;
    int _3328 = _3326 + _2282;
    int _3330 = abs(_2856);
    uint _3332 = uint(int(uint(_3266) >> uint(2)));
    uint _3334 = uint(int(uint(int(_3332)) >> uint(2)));
    int _3336 = int(_3332) & 3;
    float _3338 = (*spvDescriptorSet0.vp_c9)._m0[int(_3334)][_3336];
    int _3340 = int(_3332) + 1;
    uint _3342 = uint(int(uint(_3340) >> uint(2)));
    int _3344 = _3340 & 3;
    float _3346 = (*spvDescriptorSet0.vp_c9)._m0[int(_3342)][_3344];
    bool _3348 = !_3324;
    int _3350 = _3348 ? 0 : (-1);
    float _3352 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3354 = int(_3352);
    bool _3356 = _2900 != 3;
    float _3358 = fma(_1256, _1130, _3222);
    int _3360 = abs(_3284);
    float _3362 = fma(_1268, _1140, _3246);
    bool _3364 = !_3356;
    int _3366 = _3364 ? 0 : (-1);
    int _3368 = _3244 + 8;
    uint _3370 = uint(int(uint(_3368) >> uint(2)));
    uint _3372 = uint(int(uint(int(_3370)) >> uint(2)));
    int _3374 = int(_3370) & 3;
    float _3376 = (*spvDescriptorSet0.vp_c9)._m0[int(_3372)][_3374];
    int _3378 = int(_3370) + 1;
    uint _3380 = uint(int(uint(_3378) >> uint(2)));
    int _3382 = _3378 & 3;
    float _3384 = (*spvDescriptorSet0.vp_c9)._m0[int(_3380)][_3382];
    bool _3386 = _2984 != 3;
    int _3388 = abs(_2976);
    int _3390 = ~_3330;
    int _3392 = _3390 + 1;
    int _3394 = _3392 + 1;
    int _3396 = _3266 + 8;
    uint _3398 = uint(int(uint(_3396) >> uint(2)));
    uint _3400 = uint(int(uint(int(_3398)) >> uint(2)));
    int _3402 = int(_3398) & 3;
    float _3404 = (*spvDescriptorSet0.vp_c9)._m0[int(_3400)][_3402];
    int _3406 = int(_3398) + 1;
    uint _3408 = uint(int(uint(_3406) >> uint(2)));
    int _3410 = _3406 & 3;
    float _3412 = (*spvDescriptorSet0.vp_c9)._m0[int(_3408)][_3410];
    int _3414 = ~_3388;
    int _3416 = _3414 + 1;
    int _3418 = _3416 + 1;
    int _3420 = abs(_3120);
    int _3422 = abs(_3318);
    bool _3424 = !_2758;
    int _3426 = _3424 ? 0 : 1;
    int _3428 = _3238 + 8;
    uint _3430 = uint(int(uint(_3428) >> uint(2)));
    uint _3432 = uint(int(uint(int(_3430)) >> uint(2)));
    int _3434 = int(_3430) & 3;
    float _3436 = (*spvDescriptorSet0.vp_c9)._m0[int(_3432)][_3434];
    int _3438 = int(_3430) + 1;
    uint _3440 = uint(int(uint(_3438) >> uint(2)));
    int _3442 = _3438 & 3;
    float _3444 = (*spvDescriptorSet0.vp_c9)._m0[int(_3440)][_3442];
    int _3446 = ~_3420;
    int _3448 = _3446 + 1;
    int _3450 = _3448 + 1;
    int _3452 = abs(_3426);
    int _3454 = abs(_3366);
    int _3456 = _3394 * as_type<int>(_3262);
    int _3458 = ~_3360;
    int _3460 = _3458 + 1;
    int _3462 = _3460 + 1;
    int _3464 = abs(_3064);
    int _3466 = ~_3452;
    int _3468 = _3466 + 1;
    int _3470 = _3468 + 1;
    int _3472 = ~_3464;
    int _3474 = _3472 + 1;
    int _3476 = _3474 + 1;
    int _3478 = _3418 * as_type<int>(_3306);
    bool _3480 = !_2416;
    int _3482 = _3480 ? _3270 : (-1);
    int _3484 = _3470 * as_type<int>(_3254);
    int _3486 = _3484 + _3456;
    bool _3488 = _3354 == 0;
    int _3490 = _3462 * as_type<int>(_3298);
    int _3492 = _3490 + _3478;
    float _3494 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3496 = int(_3494);
    int _3498 = abs(_2890);
    int _3500 = _3450 * as_type<int>(_3346);
    int _3502 = abs(_3012);
    int _3504 = ~_3422;
    int _3506 = _3504 + 1;
    int _3508 = _3506 + 1;
    int _3510 = ~_3502;
    int _3512 = _3510 + 1;
    int _3514 = _3512 + 1;
    float _3516 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3518 = int(_3516);
    int _3520 = ~_3498;
    int _3522 = _3520 + 1;
    int _3524 = _3522 + 1;
    int _3526 = _3508 * as_type<int>(_3338);
    int _3528 = _3526 + _3500;
    int _3530 = _3514 * as_type<int>(_3376);
    int _3532 = _3530 + _3492;
    bool _3534 = !_3386;
    int _3536 = _3534 ? 0 : (-1);
    float _3538 = float(uint(_3496));
    int _3540 = _3476 * as_type<int>(_3404);
    int _3542 = _3540 + _3528;
    int _3544 = abs(_3350);
    int _3546 = abs(_3536);
    int _3548 = ~_3544;
    int _3550 = _3548 + 1;
    int _3552 = _3550 + 1;
    int _3554 = ~_3454;
    int _3556 = _3554 + 1;
    int _3558 = _3556 + 1;
    int _3560 = _3524 * as_type<int>(_3436);
    int _3562 = _3560 + _3486;
    float _3564 = float(uint(_3354));
    int _3566 = abs(_2912);
    int _3568 = _3552 * as_type<int>(_3444);
    int _3570 = _3568 + _3562;
    float _3572 = 1.0 / _3564;
    int _3574 = _3558 * as_type<int>(_3384);
    int _3576 = _3574 + _3532;
    int _3578 = ~_3566;
    int _3580 = _3578 + 1;
    int _3582 = _3580 + 1;
    int _3584 = abs(_3354);
    float _3586 = float(uint(_3518));
    int _3588 = _3570 * _3582;
    float _3590 = 1.0 / _3538;
    int _3592 = ~_3546;
    int _3594 = _3592 + 1;
    int _3596 = _3594 + 1;
    bool _3598 = !_3132;
    int _3600 = _3598 ? 0 : 1;
    int _3602 = abs(_3496);
    int _3604 = _3596 * as_type<int>(_3412);
    int _3606 = _3604 + _3542;
    bool _3608 = !_3138;
    int _3610 = _3608 ? 0 : 1;
    float _3612 = 1.0 / _3586;
    int _3614 = abs(_3600);
    int _3616 = abs(_3610);
    bool _3618 = !_2262;
    int _3620 = _3618 ? _3322 : (-1);
    int _3622 = abs(_3518);
    int _3624 = ~_3614;
    int _3626 = _3624 + 1;
    int _3628 = _3626 + 1;
    int _3630 = _3620 * _3566;
    int _3632 = _3630 + _3588;
    int _3634 = ~_3616;
    int _3636 = _3634 + 1;
    int _3638 = _3636 + 1;
    float _3640 = float(uint(_3584));
    int _3642 = _3628 * _3576;
    int _3644 = _3638 * _3606;
    bool _3646 = !_2292;
    int _3648 = _3646 ? _3328 : (-1);
    float _3650 = fma(_1256, _1140, _3212);
    int _3652 = as_type<int>(_3572) + (-2);
    float _3654 = 1.0 / _3640;
    float _3656 = float(uint(_3632));
    int _3658 = _3648 * _3614;
    int _3660 = _3658 + _3642;
    float _3662 = float(uint(_3602));
    int _3664 = _3482 * _3616;
    int _3666 = _3664 + _3644;
    float _3668 = float(uint(_3622));
    float _3670 = as_type<float>(_3652) * _3656;
    int _3672 = as_type<int>(_3590) + (-2);
    float _3674 = 1.0 / _3662;
    float _3676 = float(uint(_3660));
    float _3678 = fma(_1234, _1140, _3218);
    int _3680 = as_type<int>(_3612) + (-2);
    float _3682 = float(uint(_3666));
    int _3684 = abs(_3632);
    float _3686 = 1.0 / _3668;
    float _3688 = fma(_1234, _1124, _3228);
    float _3690 = as_type<float>(_3680) * _3682;
    int _3692 = abs(_3660);
    int _3694 = ~_3518;
    int _3696 = _3694 + 1;
    int _3698 = ~_3496;
    int _3700 = _3698 + 1;
    float _3702 = trunc(_3670);
    float _3704 = precise::max(_3702, 0.0);
    uint _3706 = uint(_3704);
    float _3708 = fma(_1234, _1130, _3234);
    float _3710 = as_type<float>(_3672) * _3676;
    float _3712 = fma(_1268, _1124, _3240);
    float _3714 = fma(_1268, _1130, _1835);
    int _3716 = ~_3354;
    int _3718 = _3716 + 1;
    float _3720 = float(uint(_3684));
    float _3722 = trunc(_3690);
    float _3724 = precise::max(_3722, 0.0);
    uint _3726 = uint(_3724);
    int _3728 = as_type<int>(_3654) + (-2);
    int _3730 = as_type<int>(_3674) + (-2);
    float _3732 = as_type<float>(_3728) * _3720;
    int _3734 = abs(_3666);
    float _3736 = trunc(_3710);
    float _3738 = precise::max(_3736, 0.0);
    uint _3740 = uint(_3738);
    int _3742 = as_type<int>(_3686) + (-2);
    int _3744 = _3718 * int(_3706);
    int _3746 = _3744 + _3632;
    float _3748 = float(uint(_3734));
    float _3750 = float(uint(_3692));
    bool _3752 = _2982 <= 8000.0;
    bool _3754 = isnan(_2982);
    bool _3756 = _3752 || _3754;
    bool _3758 = isnan(8000.0);
    bool _3760 = _3756 || _3758;
    float _3762 = float(_3760);
    float _3764 = as_type<float>(_3742) * _3748;
    float _3766 = float(uint(_3746));
    float _3768 = trunc(_3732);
    float _3770 = precise::max(_3768, 0.0);
    uint _3772 = uint(_3770);
    float _3774 = as_type<float>(_3730) * _3750;
    int _3776 = _3696 * int(_3726);
    int _3778 = _3776 + _3666;
    int _3780 = ~_3584;
    int _3782 = _3780 + 1;
    float _3784 = as_type<float>(_3652) * _3766;
    int _3786 = ~_3602;
    int _3788 = _3786 + 1;
    int _3790 = _3700 * int(_3740);
    int _3792 = _3790 + _3660;
    float _3794 = float(uint(_3778));
    float _3796 = trunc(_3774);
    float _3798 = precise::max(_3796, 0.0);
    uint _3800 = uint(_3798);
    int _3802 = ~_3622;
    int _3804 = _3802 + 1;
    float _3806 = _3762 * _3314;
    float _3808 = float(uint(_3792));
    float _3810 = as_type<float>(_3680) * _3794;
    float _3812 = _3678 * _3020;
    float _3814 = _3688 * _3092;
    float _3816 = trunc(_3764);
    float _3818 = precise::max(_3816, 0.0);
    uint _3820 = uint(_3818);
    float _3822 = as_type<float>(_3672) * _3808;
    float _3824 = _3688 * _3020;
    float _3826 = _3164 * _3688;
    float _3828 = _3164 * _3678;
    float _3830 = _3708 * _3092;
    float _3832 = trunc(_3784);
    float _3834 = precise::max(_3832, 0.0);
    uint _3836 = uint(_3834);
    float _3838 = _3708 * _3020;
    int _3840 = _3782 * int(_3772);
    int _3842 = _3840 + _3684;
    float _3844 = float(uint(_3842));
    int _3846 = _3788 * int(_3800);
    int _3848 = _3846 + _3692;
    float _3850 = _3678 * _3092;
    float _3852 = _3164 * _3708;
    float _3854 = as_type<float>(_3728) * _3844;
    float _3856 = float(uint(_3848));
    float _3858 = fma(_3650, _3086, _3850);
    float _3860 = fma(_3286, _3086, _3814);
    int _3862 = _3804 * int(_3820);
    int _3864 = _3862 + _3734;
    float _3866 = trunc(_3822);
    float _3868 = precise::max(_3866, 0.0);
    uint _3870 = uint(_3868);
    float _3872 = as_type<float>(_3730) * _3856;
    float _3874 = fma(_3286, _3018, _3824);
    float _3876 = fma(_3174, _3286, _3826);
    float _3878 = float(uint(_3864));
    float _3880 = fma(_3650, _3018, _3812);
    float _3882 = fma(_3358, _3018, _3838);
    float _3884 = fma(_3712, _3022, _3874);
    float _3886 = trunc(_3810);
    float _3888 = precise::max(_3886, 0.0);
    uint _3890 = uint(_3888);
    float _3892 = as_type<float>(_3742) * _3878;
    float _3894 = fma(_3362, _3022, _3880);
    float _3896 = fma(_3714, _3022, _3882);
    float _3898 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3900 = ~_3496;
    int _3902 = _3900 + 1;
    float _3904 = fma(_3358, _3086, _3830);
    int _3906 = int(_3706) + int(_3836);
    float _3908 = trunc(_3854);
    float _3910 = precise::max(_3908, 0.0);
    uint _3912 = uint(_3910);
    out.m_79.x = _3884;
    out.m_79.y = _3894;
    out.m_79.z = _3896;
    int _3914 = int(_3740) + int(_3870);
    float _3916 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3898);
    float _3918 = fma(_3174, _3650, _3828);
    float _3920 = fma(_3174, _3358, _3852);
    float _3922 = _1789 * _2710;
    float _3924 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3916);
    float _3926 = trunc(_3872);
    float _3928 = precise::max(_3926, 0.0);
    uint _3930 = uint(_3928);
    int _3932 = ~_3354;
    int _3934 = _3932 + 1;
    float _3936 = fma(_3362, _3096, _3858);
    int _3938 = int(_3726) + int(_3890);
    int _3940 = _3934 * _3906;
    int _3942 = _3940 + _3632;
    int _3944 = ~_3584;
    int _3946 = _3944 + 1;
    float _3948 = trunc(_3892);
    float _3950 = precise::max(_3948, 0.0);
    uint _3952 = uint(_3950);
    int _3954 = ~_3518;
    int _3956 = _3954 + 1;
    int _3958 = _3902 * _3914;
    int _3960 = _3958 + _3660;
    int _3962 = int(_3772) + int(_3912);
    int _3964 = ~_3602;
    int _3966 = _3964 + 1;
    int _3968 = _3946 * _3962;
    int _3970 = _3968 + _3684;
    int _3972 = int(_3800) + int(_3930);
    int _3974 = _3956 * _3938;
    int _3976 = _3974 + _3666;
    bool _3978 = uint(_3942) >= uint(_3354);
    float _3980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3982 = uint(_3960) >= uint(_3496);
    int _3984 = _3966 * _3972;
    int _3986 = _3984 + _3692;
    bool _3988 = uint(_3976) >= uint(_3518);
    bool _3990 = !_3978;
    int _3992 = _3990 ? 0 : (-1);
    int _3994 = int(_3820) + int(_3952);
    int _3996 = ~_3622;
    int _3998 = _3996 + 1;
    bool _4000 = uint(_3986) >= uint(_3602);
    bool _4002 = !_3988;
    int _4004 = _4002 ? 0 : (-1);
    int _4006 = _3998 * _3994;
    int _4008 = _4006 + _3734;
    int _4010 = ~_3906;
    int _4012 = _4010 + _3992;
    int _4014 = _4012 + 1;
    float _4016 = _3980 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _4018 = ~_3938;
    int _4020 = _4018 + _4004;
    int _4022 = _4020 + 1;
    float _4024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _4026 = uint(_4008) >= uint(_3622);
    int _4028 = _3354 * _4014;
    int _4030 = _4028 + _3632;
    bool _4032 = uint(_3970) >= uint(_3584);
    int _4034 = _3518 * _4022;
    int _4036 = _4034 + _3666;
    bool _4038 = !_3982;
    int _4040 = _4038 ? 0 : (-1);
    float _4042 = fma(_4016, _1962, -0.5);
    bool _4044 = !_3488;
    int _4046 = _4044 ? _4030 : (-1);
    float _4048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4050 = ~_3914;
    int _4052 = _4050 + _4040;
    int _4054 = _4052 + 1;
    int _4056 = _3632 ^ _3354;
    float _4058 = float(_4046);
    int _4060 = _3496 * _4054;
    int _4062 = _4060 + _3660;
    bool _4064 = !_4000;
    int _4066 = _4064 ? 0 : (-1);
    float _4068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4070 = _3518 == 0;
    float _4072 = fma(_4016, _4058, _628);
    bool _4074 = !_4032;
    int _4076 = _4074 ? 0 : (-1);
    int _4078 = _3666 ^ _3518;
    float _4080 = fma(_1014, _4042, _4072);
    uint _4082 = uint(int(uint(_4056) >> uint(31)));
    float _4084 = _4048 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _4086 = _3354 == 0;
    bool _4088 = _3496 == 0;
    float _4090 = fma(_4084, _2638, -0.5);
    bool _4092 = !_4070;
    int _4094 = _4092 ? _4036 : (-1);
    int _4096 = _3660 ^ _3496;
    int _4098 = ~_4076;
    int _4100 = _3962 + _4098;
    int _4102 = _4100 + 1;
    bool _4104 = !_4026;
    int _4106 = _4104 ? 0 : (-1);
    uint _4108 = uint(int(uint(_4078) >> uint(31)));
    int _4110 = ~int(_4082);
    int _4112 = _4110 + 1;
    bool _4114 = _3518 == 0;
    int _4116 = ~_4066;
    int _4118 = _3972 + _4116;
    int _4120 = _4118 + 1;
    float _4122 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _4124 = !_4088;
    int _4126 = _4124 ? _4062 : (-1);
    float _4128 = float(_4094);
    uint _4130 = uint(int(uint(_4096) >> uint(31)));
    bool _4132 = _3496 == 0;
    float _4134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _4136 = ~_4106;
    int _4138 = _3994 + _4136;
    int _4140 = _4138 + 1;
    float _4142 = _4068 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4144 = ~int(_4108);
    int _4146 = _4144 + 1;
    float _4148 = fma(_4084, _4128, _838);
    int _4150 = _4102 ^ _4112;
    float _4152 = fma(_4142, _2070, -0.5);
    float _4154 = float(_4126);
    float _4156 = _4024 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4158 = ~int(_4130);
    int _4160 = _4158 + 1;
    float _4162 = fma(_1008, _4090, _4148);
    int _4164 = _4140 ^ _4146;
    float _4166 = fma(_4142, _4154, _902);
    int _4168 = ~_4112;
    int _4170 = _4168 + _4150;
    int _4172 = _4170 + 1;
    float _4174 = _4122 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _4176 = _4120 ^ _4160;
    float _4178 = _4134 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _4180 = ~_4146;
    int _4182 = _4180 + _4164;
    int _4184 = _4182 + 1;
    float _4186 = fma(_2032, _4156, -0.5);
    bool _4188 = !_4086;
    int _4190 = _4188 ? _4172 : (-1);
    float _4192 = fma(_2010, _4174, -0.5);
    int _4194 = ~_4160;
    int _4196 = _4194 + _4176;
    int _4198 = _4196 + 1;
    float _4200 = fma(_4178, _2088, -0.5);
    bool _4202 = !_4114;
    int _4204 = _4202 ? _4184 : (-1);
    float _4206 = fma(_854, _4152, _4166);
    float _4208 = float(_4190);
    float _4210 = _4162 + 0.5;
    bool _4212 = !_4132;
    int _4214 = _4212 ? _4198 : (-1);
    float _4216 = float(_4204);
    float _4218 = -_624;
    float _4220 = fma(_4156, _4208, _4218);
    float _4222 = fma(_3176, _3712, _3876);
    float _4224 = float(_4214);
    float _4226 = in.m_81.x;
    float _4228 = -_1086;
    float _4230 = fma(_4178, _4216, _4228);
    float _4232 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3924);
    float _4234 = fma(_992, _4186, _4220);
    float _4236 = -_1044;
    float _4238 = fma(_4174, _4224, _4236);
    float _4240 = fma(_3176, _3362, _3918);
    float _4242 = fma(_3176, _3714, _3920);
    float _4244 = _4232 + _1682;
    float _4246 = fma(_938, _4192, _4238);
    float _4248 = fma(_1066, _4200, _4230);
    float _4250 = _4244 * 0.5;
    float _4252 = _3806 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = _4222;
    out.m_83.y = _4240;
    out.m_83.z = _4242;
    float _4254 = _4248 + 0.5;
    float _4256 = _2556 * _4252;
    float _4258 = precise::clamp(_4256, 0.0, 1.0);
    out.gl_Position.x = _1730;
    out.gl_Position.y = _1740;
    out.gl_Position.z = _4232;
    out.gl_Position.w = _1682;
    float _4260 = _4080 + 0.5;
    float _4262 = _4206 + 0.5;
    float _4264 = _4234 + 0.5;
    float _4266 = _4246 + 0.5;
    float _4268 = fma(_3712, _3096, _3860);
    float _4270 = fma(_3714, _3096, _3904);
    float _4272 = _1779 * _2732;
    out.m_85.z = _4250;
    out.m_85.w = _1682;
    bool _4274 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4276 = isnan(_1456);
    bool _4278 = _4274 || _4276;
    bool _4280 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4282 = _4278 || _4280;
    float _4284 = -_4258;
    float _4286 = fma(_4284, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4288 = _1779 * _2710;
    out.m_87.x = _4260;
    out.m_87.y = _4264;
    out.m_87.z = _4262;
    out.m_87.w = _4266;
    float _4290 = _4286 * _4226;
    float _4292 = fma(_1785, _4288, _1773);
    float _4294 = fma(_1787, _4288, _1775);
    float _4296 = fma(_1779, _3922, _1777);
    float _4298 = _4290 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.x = _4210;
    out.m_89.y = _4254;
    float _4300 = _4240;
    float _4302 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _4304 = _4232;
    float _4306 = _4288;
    if (!_4282)
    {
        _4300 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4308 = _4300;
    float _4310 = _4308;
    float _4312 = _4308;
    if (!_4282)
    {
        _4302 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4314 = _4302;
    out.m_91.x = _4298;
    float _4316 = _4314;
    float _4318 = _4314;
    if (!_4282)
    {
        _1845 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4320 = _1845;
    float _4322 = _4320;
    float _4324 = _4320;
    if (!_4282)
    {
        _4304 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4326 = _4304;
    out.m_93.x = _4292;
    out.m_93.y = _4294;
    out.m_93.z = _4296;
    out.m_93.w = _4272;
    float _4328 = _4326;
    float _4330 = _4326;
    if (!_4282)
    {
        _1847 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4332 = _1847;
    float _4334 = _4332;
    float _4336 = _4332;
    if (!_4282)
    {
        _4306 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4338 = _4306;
    out.m_95.x = _4268;
    out.m_95.y = _3936;
    out.m_95.z = _4270;
    bool _4340 = !_4282;
    float _4342 = _4338;
    float _4344 = _4338;
    if (!_4340)
    {
        bool _4346 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4348 = isnan(_1456);
        bool _4350 = _4346 || _4348;
        bool _4352 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4354 = _4350 || _4352;
        if (!_4354)
        {
            float _4356 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4358 = _1456 + _4356;
            float _4360 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4362 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4360;
            float _4364 = 1.0 / _4362;
            float _4366 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4368 = _4366 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4370 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4372 = _4370 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4374 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4376 = _4374 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4378 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4380 = _4378 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4382 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4384 = _4382 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4386 = _4358 * _4364;
            float _4388 = precise::clamp(_4386, 0.0, 1.0);
            float _4390 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4392 = _4390 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4394 = fma(_4388, _4368, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4396 = fma(_4388, _4392, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4398 = fma(_4388, _4372, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4400 = fma(_4388, _4376, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4402 = fma(_4388, _4380, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4404 = fma(_4388, _4384, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4318 = _4396;
            _4336 = _4402;
            _4312 = _4394;
            _4330 = _4400;
            _4324 = _4398;
            _4344 = _4404;
            _4406 = true;
        }
        else
        {
            bool _4408 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4410 = isnan(_1456);
            bool _4412 = _4408 || _4410;
            bool _4414 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4416 = _4412 || _4414;
            if (!_4416)
            {
                _4310 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4418 = _4310;
            _4312 = _4418;
            if (!_4416)
            {
                _4316 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4420 = _4316;
            _4318 = _4420;
            if (!_4416)
            {
                _4322 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4422 = _4322;
            _4324 = _4422;
            if (!_4416)
            {
                _4328 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4424 = _4328;
            _4330 = _4424;
            if (!_4416)
            {
                _4334 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4426 = _4334;
            _4336 = _4426;
            if (!_4416)
            {
                _4342 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4428 = _4342;
            bool _4430 = !_4416;
            _4344 = _4428;
            if (!_4430)
            {
                bool _4432 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4434 = isnan(_1456);
                bool _4436 = _4432 || _4434;
                bool _4438 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4440 = _4436 || _4438;
                if (!_4440)
                {
                    float _4442 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4444 = _1456 + _4442;
                    float _4446 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4448 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4446;
                    float _4450 = 1.0 / _4448;
                    float _4452 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4454 = _4452 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4456 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4458 = _4456 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4460 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4462 = _4460 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4464 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4466 = _4464 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4468 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4470 = _4468 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4472 = _4444 * _4450;
                    float _4474 = precise::clamp(_4472, 0.0, 1.0);
                    float _4476 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4478 = _4476 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4480 = fma(_4474, _4454, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4482 = fma(_4474, _4478, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4484 = fma(_4474, _4458, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4486 = fma(_4474, _4462, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4488 = fma(_4474, _4466, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4490 = fma(_4474, _4470, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4318 = _4482;
                    _4336 = _4488;
                    _4312 = _4480;
                    _4330 = _4486;
                    _4324 = _4484;
                    _4344 = _4490;
                    _4406 = true;
                }
                else
                {
                    _4318 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4336 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4312 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4330 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4324 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4344 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4406 = false;
    float _4492 = _4318;
    float _4494 = _4336;
    float _4496 = _4312;
    float _4498 = _4330;
    float _4500 = _4324;
    float _4502 = _4344;
    float _4504 = fma(_3936, -0.5, 0.5);
    float _4506 = precise::clamp(_4504, 0.0, 1.0);
    float _4508 = -_4492;
    float _4510 = _4508 + _4494;
    float _4512 = -_4496;
    float _4514 = _4512 + _4498;
    float _4516 = -_4500;
    float _4518 = _4516 + _4502;
    bool _4520 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4522 = fma(_4506, _4510, _4492);
    float _4524 = fma(_4506, _4514, _4496);
    float _4526 = fma(_4506, _4518, _4500);
    float _4528 = _4522 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _4530 = fma(_4524, 0.298911988735198974609375, _4528);
    float _4532 = fma(_4526, 0.114477999508380889892578125, _4530);
    out.m_97.x = 0.0;
    float _4534 = -_4532;
    float _4536 = _4524 + _4534;
    float _4538 = -_4532;
    float _4540 = _4522 + _4538;
    float _4542 = -_4532;
    float _4544 = _4526 + _4542;
    float _4546 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4548 = fma(_4536, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4532);
    float _4550 = fma(_4540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4532);
    float _4552 = fma(_4544, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4532);
    out.m_91.w = _4546;
    out.m_99.x = _4548;
    out.m_99.y = _4550;
    out.m_99.z = _4552;
    if (!_4520)
    {
        return out;
    }
    float _4554 = -_1430;
    float _4556 = _4554 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4558 = -_1432;
    float _4560 = _4558 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4562 = -_1434;
    float _4564 = _4562 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4566 = _4556 * _4556;
    float _4568 = fma(_4560, _4560, _4566);
    float _4570 = fma(_4564, _4564, _4568);
    float _4572 = sqrt(_4570);
    float _4574 = rsqrt(_4570);
    float _4576 = -_4572;
    float _4578 = _4576 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4580 = _4578 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4582 = precise::clamp(_4580, 0.0, 1.0);
    float _4584 = _4560 * _4574;
    float _4586 = _4556 * _4574;
    float _4588 = abs(_4582);
    float _4590 = log2(_4588);
    float _4592 = _4564 * _4574;
    float _4594 = _4584 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4596 = _3936 * _4586;
    float _4598 = -_4586;
    float _4600 = -_4594;
    float _4602 = fma(_4598, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4600);
    float _4604 = fma(_4268, _4584, _4596);
    float _4606 = -_4592;
    float _4608 = fma(_4606, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4602);
    float _4610 = fma(_4270, _4592, _4604);
    float _4612 = precise::clamp(_4610, 0.0, 1.0);
    float _4614 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4616 = _4608 + _4614;
    float _4618 = _4590 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4620 = _4616 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4622 = precise::clamp(_4620, 0.0, 1.0);
    float _4624 = exp2(_4618);
    float _4626 = _4624 * _4622;
    float _4628 = _4612 * _4626;
    float _4630 = _4628 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4632 = _4628 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4634 = _4628 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _4630;
    out.m_97.y = _4632;
    out.m_97.z = _4634;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4406 = false;
    bool _534 = false;
    bool _418 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_46.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_49.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4690 = as_type<float>(_134);
        out.gl_Position.z = _4690;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_51.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_118);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    if (_164)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _128;
    if (_164)
    {
        out.m_49.x = 0.0;
    }
    int _168 = 0;
    if (_164)
    {
        float _170 = _166 * 5.0;
        _168 = as_type<int>(_170);
    }
    int _172 = _168;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4759 = as_type<float>(_172);
        out.gl_Position.z = _4759;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _176 = !_174;
    float _194;
    if (!_176)
    {
        float _178 = in.m_53.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_118);
        float _200 = 1.0 / _198;
        float _202 = _150 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _204 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = _204 + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = _204 + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _226;
    float _230 = 1.0 / _224;
    bool _232 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _234 = 1.0 / _228;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _236;
    float _240 = 1.0 / _220;
    float _242 = _208 * _230;
    bool _244 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _246 = isnan(_204);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    bool _256 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _258 = isnan(_204);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = _212 * _234;
    bool _270 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _272 = isnan(_204);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -_254;
    float _284 = _282 + 1.0;
    float _286 = _280 * _284;
    bool _288 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _290 = isnan(_204);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = _216 * _240;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _306;
    float _310 = -_280;
    float _312 = _310 + 1.0;
    float _314 = fma(_238, _300, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _316 = fma(_304, _300, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _318 = fma(_308, _300, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _320 = -_266;
    float _322 = _320 + 1.0;
    float _324 = _266 * _312;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _328 = _326 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _334 = _298 * _322;
    float _336 = -_298;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _344 = _316 * _334;
    float _346 = _318 * _334;
    float _348 = _314 * _334;
    float _350 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _344);
    float _352 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _346);
    float _354 = fma(_342, _242, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _356 = fma(_328, _242, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _362;
    float _366 = fma(_332, _242, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _368 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _348);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _370;
    float _374 = fma(_354, _324, _350);
    float _376 = fma(_360, _268, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _378 = fma(_364, _268, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _380 = fma(_356, _324, _352);
    float _382 = fma(_372, _268, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _384 = fma(_366, _324, _368);
    float _386 = fma(_376, _286, _374);
    float _388 = fma(_378, _286, _380);
    float _390 = fma(_382, _286, _384);
    float _392 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[146].x, _386);
    float _394 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[146].y, _388);
    float _396 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[146].z, _390);
    bool _398 = !_232;
    float _416;
    if (!_398)
    {
        float _400 = in.m_53.x;
        float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _404 = _400 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _406 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _408 = _406 * _402;
        float _410 = floor(_408);
        float _412 = -_410;
        float _414 = _408 + _412;
        _416 = _414;
        _418 = true;
    }
    else
    {
        float _420 = float(_118);
        float _422 = 1.0 / _420;
        float _424 = _150 * _422;
        _416 = _424;
    }
    _418 = false;
    float _426 = _416;
    float _428 = in.m_55.x;
    float _430 = in.m_55.y;
    float _432 = in.m_55.z;
    bool _434 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _436 = isnan(_426);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _450 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _452 = isnan(_426);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _426 + _466;
    float _470 = -_444;
    float _472 = _470 + 1.0;
    bool _474 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _476 = 1.0 / _448;
    float _478 = _460 * _472;
    float _480 = -_460;
    float _482 = _480 + 1.0;
    float _484 = _396 * _432;
    float _486 = _392 * _428;
    float _488 = _464 * _476;
    float _490 = fma(_488, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _494 = _490 * _478;
    float _496 = _394 * _430;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _500 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _502 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[115].x, _494);
    float _504 = _498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[116].x, _502);
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _510 = _506 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _512 = _508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _504;
    out.m_57.y = _500;
    out.m_57.z = _512;
    out.m_57.w = _510;
    bool _514 = !_474;
    float _532;
    if (!_514)
    {
        float _516 = in.m_53.x;
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _520 = _516 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _524 = _522 * _518;
        float _526 = floor(_524);
        float _528 = -_526;
        float _530 = _524 + _528;
        _532 = _530;
        _534 = true;
    }
    else
    {
        float _536 = float(_118);
        float _538 = 1.0 / _536;
        float _540 = _150 * _538;
        _532 = _540;
    }
    _534 = false;
    float _542 = _532;
    float _544 = in.m_53.y;
    float _546 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _548 = log2(_546);
    float _550 = in.m_53.x;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _556 = _554 != 0;
    float _558 = in.m_53.z;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _562 = in.m_46.x;
    float _564 = in.m_46.y;
    float _566 = in.m_46.z;
    float _568 = float(_118);
    float _570 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _572 = int(_570);
    float _574 = in.m_59.x;
    float _576 = in.m_59.y;
    float _578 = in.m_59.z;
    float _580 = in.m_59.w;
    float _582 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _584 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _586 = in.m_61.x;
    float _588 = in.m_61.y;
    float _590 = in.m_61.z;
    float _592 = in.m_61.w;
    float _594 = 1.0 / _568;
    float _596 = in.m_63.x;
    float _598 = in.m_63.y;
    float _600 = in.m_63.z;
    float _602 = in.m_63.w;
    float _604 = _544 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _606 = _544 * 2.0;
    float _608 = _550 * 2.0;
    float _610 = fma(_604, -2.0, _552);
    float _612 = _550 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _614 = _558 * 2.0;
    float _616 = floor(_608);
    float _618 = -_560;
    float _620 = fma(_612, 2.0, _618);
    float _622 = _550 + _544;
    float _624 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _610);
    float _626 = -_150;
    float _628 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[76].x, _620);
    float _630 = _622 + (-1.0);
    float _632 = _564 * _576;
    float _634 = floor(_606);
    float _636 = _544 + _558;
    float _638 = _564 * _588;
    float _640 = fma(_562, _574, _632);
    float _642 = _636 + (-1.0);
    float _644 = _564 * _598;
    float _646 = floor(_614);
    float _648 = fma(_562, _586, _638);
    float _650 = fma(_566, _578, _640);
    float _652 = fma(_562, _596, _644);
    float _654 = fma(_566, _590, _648);
    bool _656 = _616 >= 0.0;
    bool _658 = isnan(_616);
    bool _660 = _656 || _658;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    float _666 = fma(_566, _600, _652);
    float _668 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _670 = as_type<int>(_630);
    int _672 = as_type<int>(_642);
    float _674 = _550;
    if (_556)
    {
        _670 = 0;
    }
    int _676 = _670;
    float _678 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _680 = int(_678);
    int _682 = _676;
    if (!_556)
    {
        _682 = 2;
    }
    int _684 = _682;
    float _686 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _688 = _634 >= 0.0;
    bool _690 = isnan(_634);
    bool _692 = _688 || _690;
    bool _694 = isnan(0.0);
    bool _696 = _692 || _694;
    float _698 = _650 + _580;
    if (_556)
    {
        _672 = 0;
    }
    int _700 = _672;
    float _702 = _654 + _592;
    bool _704 = _646 > 0.0;
    float _706 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _708 = int(_706);
    bool _710 = _646 >= 0.0;
    bool _712 = isnan(_646);
    bool _714 = _710 || _712;
    bool _716 = isnan(0.0);
    bool _718 = _714 || _716;
    float _720 = -_702;
    float _722 = _720 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _724 = _700;
    if (!_556)
    {
        _724 = 1;
    }
    int _726 = _724;
    float _728 = -_698;
    float _730 = _728 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _732 = _664 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _734 = _594 * _150;
    bool _736 = _634 > 0.0;
    bool _738 = _684 != 2;
    float _740 = _696 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _742 = _726 != 1;
    bool _744 = _616 > 0.0;
    int _746 = ~as_type<int>(_740);
    int _748 = _746 + 1;
    int _750 = _748 + 1;
    int _752 = _750;
    float _754 = _740;
    float _756 = as_type<float>(_726);
    float _758 = _732;
    if (!_736)
    {
        int _760 = ~as_type<int>(_740);
        int _762 = _760 + 1;
        _752 = _762;
    }
    int _764 = _752;
    if (_738)
    {
        _754 = _550;
    }
    float _766 = _754;
    float _768 = _766;
    if (!_738)
    {
        _768 = _558;
    }
    float _770 = _768;
    if (!_742)
    {
        _756 = _544;
    }
    float _772 = _756;
    int _774 = ~as_type<int>(_732);
    int _776 = _774 + 1;
    int _778 = _776 + 1;
    float _780 = _770 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _784 = _778;
    float _786 = _772;
    float _788 = _782;
    if (!_744)
    {
        int _790 = ~as_type<int>(_732);
        int _792 = _790 + 1;
        _784 = _792;
    }
    int _794 = _784;
    float _796 = _666 + _602;
    int _798 = _718 ? 0 : 1;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _804 = _802 != 0;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _808 = _806 != 0;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _812 = _810 != 0;
    float _814 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _816 = int(_814);
    if (!_742)
    {
        _758 = _772;
    }
    float _818 = _758;
    float _820 = -_800;
    float _822 = fma(_780, 2.0, _820);
    float _824 = _818;
    if (_742)
    {
        _786 = _550;
    }
    float _826 = _786;
    float _828 = -_796;
    float _830 = _828 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _832 = !_808;
    int _834 = _832 ? 0 : 1;
    float _836 = -_150;
    float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[86].x, _822);
    bool _840 = !_804;
    int _842 = _840 ? 0 : 1;
    float _844 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[83].z, _782);
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _852 = _850 != 0;
    float _854 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _844);
    if (_742)
    {
        _824 = _550;
    }
    float _856 = _824;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _860 = ~_798;
    int _862 = _860 + 1;
    int _864 = _862 + 1;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _868 = _864;
    float _870 = _866;
    if (!_704)
    {
        int _872 = ~_798;
        int _874 = _872 + 1;
        _868 = _874;
    }
    int _876 = _868;
    float _878 = _856 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _880 = !_812;
    int _882 = _880 ? 0 : 1;
    bool _884 = !_852;
    int _886 = _884 ? 0 : 1;
    float _888 = -_858;
    float _890 = fma(_878, 2.0, _888);
    float _892 = _878;
    if (!_742)
    {
        _788 = _558;
    }
    float _894 = _788;
    bool _896 = !_848;
    int _898 = _896 ? 0 : 1;
    float _900 = -_150;
    float _902 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[81].x, _890);
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _906 = _904 != 0;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _910 = _908 != 0;
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _914 = _912 != 0;
    float _916 = _894;
    if (_742)
    {
        _916 = _544;
    }
    float _918 = _916;
    float _920 = float(_876);
    bool _922 = !_906;
    int _924 = _922 ? 0 : 1;
    float _926 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[83].w, _866);
    if (!_742)
    {
        _870 = _558;
    }
    float _928 = _870;
    float _930 = in.m_65.x;
    float _932 = in.m_65.y;
    float _934 = in.m_65.z;
    int _936 = abs(_924);
    float _938 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _926);
    float _940 = _928;
    if (_742)
    {
        _940 = _544;
    }
    float _942 = _940;
    float _944 = float(_936);
    if (_738)
    {
        _892 = _544;
    }
    float _946 = _892;
    float _948 = _942 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _950 = float(_680);
    float _952 = _944 * _920;
    float _954 = _946;
    if (!_738)
    {
        _954 = _550;
    }
    float _956 = _954;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _960 = 1.0 / _950;
    float _962 = _956 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _964 = _952 * (-2.0);
    float _966 = fma(_948, -2.0, _958);
    float _968 = _548 * _150;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _972 = fma(_668, _964, _668);
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _976 = fma(_964, _930, _930);
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _980 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[78].w, _974);
    float _982 = fma(_962, -2.0, _970);
    float _984 = float(_816);
    float _986 = exp2(_968);
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _990 = _960 * _150;
    float _992 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _980);
    float _994 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[88].z, _978);
    bool _996 = !_914;
    int _998 = _996 ? 0 : 1;
    float _1000 = 1.0 / _984;
    float _1002 = float(_708);
    float _1004 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[78].z, _988);
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1008 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _994);
    int _1010 = abs(_998);
    float _1012 = _722 * _722;
    float _1014 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1004);
    float _1016 = 1.0 / _1002;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1020 = 1.0 + _1018;
    bool _1022 = !_910;
    int _1024 = _1022 ? 0 : 1;
    float _1026 = -_986;
    float _1028 = _1026 + 1.0;
    bool _1030 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1032 = isnan(1.0);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1038 = _1034 || _1036;
    float _1040 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1006);
    int _1042 = abs(_1024);
    float _1044 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _966);
    float _1046 = 1.0 / _1020;
    bool _1048 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1050 = isnan(0.0);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1056 = _1052 || _1054;
    float _1058 = _550 + (-0.5);
    float _1060 = float(_1042);
    float _1062 = _1000 * _150;
    float _1064 = float(_572);
    float _1066 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1040);
    float _1068 = _1056 ? _1028 : 0.0;
    float _1070 = _1016 * _150;
    float _1072 = float(_794);
    float _1074 = _1064 * _150;
    float _1076 = fma(_730, _730, _1012);
    float _1078 = float(_764);
    float _1080 = _1060 * _1072;
    float _1082 = float(_1010);
    float _1084 = fma(_830, _830, _1076);
    float _1086 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _982);
    if (_1038)
    {
        float _1088 = _1068 * _1046;
        _154 = _1088;
    }
    float _1090 = _154;
    float _1092 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[196].x, _976);
    float _1094 = rsqrt(_1084);
    float _1096 = _550 + _558;
    float _1098 = _1080 * (-2.0);
    float _1100 = _1082 * _1078;
    float _1102 = fma(_972, _1090, _1092);
    float _1104 = _544 + (-0.5);
    float _1106 = _1096 + (-1.0);
    float _1108 = fma(_1098, _932, _932);
    float _1110 = _1102 * 0.15915493667125701904296875;
    float _1112 = _1100 * (-2.0);
    float _1114 = fma(_686, _1098, _686);
    float _1116 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1108);
    float _1118 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1120 = fma(_1112, _934, _934);
    float _1122 = _558 + (-0.5);
    float _1124 = _730 * _1094;
    float _1126 = fma(_1114, _1090, _1116);
    float _1128 = fma(_1118, _1112, _1118);
    float _1130 = _830 * _1094;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1134 = _1124 * _1132;
    float _1136 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1120);
    float _1138 = _1126 * 0.15915493667125701904296875;
    float _1140 = _722 * _1094;
    float _1142 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1144 = _1130 * _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1148 = -_1134;
    float _1150 = fma(_1130, _1146, _1148);
    float _1152 = in.m_67.x;
    float _1154 = in.m_67.y;
    float _1156 = in.m_67.z;
    float _1158 = _1110 * 6.283185482025146484375;
    float _1160 = sin(_1158);
    float _1162 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1164 = -_1144;
    float _1166 = fma(_1140, _1162, _1164);
    float _1168 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1170 = _1110 * 6.283185482025146484375;
    float _1172 = cos(_1170);
    float _1174 = _1138 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    float _1178 = fma(_1128, _1090, _1136);
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1182 = _1140 * _1180;
    float _1184 = _1150 * _1150;
    float _1186 = _1178 * 0.15915493667125701904296875;
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1190 = -_1182;
    float _1192 = fma(_1124, _1188, _1190);
    float _1194 = fma(_1166, _1166, _1184);
    float _1196 = _1138 * 6.283185482025146484375;
    float _1198 = cos(_1196);
    float _1200 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1152);
    float _1202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1156);
    float _1204 = fma(_1192, _1192, _1194);
    float _1206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1154);
    float _1208 = _1200 * _582;
    float _1210 = _1202 * _584;
    float _1212 = _1186 * 6.283185482025146484375;
    float _1214 = cos(_1212);
    float _1216 = _1206 * _1168;
    float _1218 = _1160 * _1176;
    float _1220 = _1172 * _1176;
    float _1222 = rsqrt(_1204);
    float _1224 = _1172 * _1198;
    float _1226 = _1160 * _1198;
    float _1228 = _1186 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    float _1232 = _1172 * _1214;
    float _1234 = _1160 * _1214;
    float _1236 = _1198 * _1214;
    float _1238 = _1176 * _1214;
    float _1240 = _1232 * _1216;
    float _1242 = _1166 * _1222;
    float _1244 = _1150 * _1222;
    float _1246 = _1192 * _1222;
    float _1248 = _1140 * _1242;
    float _1250 = _1130 * _1244;
    float _1252 = fma(_1230, _1224, _1218);
    float _1254 = -_1220;
    float _1256 = fma(_1230, _1226, _1254);
    float _1258 = -_1216;
    float _1260 = _1230 * _1258;
    float _1262 = -_1226;
    float _1264 = fma(_1230, _1220, _1262);
    float _1266 = fma(_1252, _1208, _1240);
    float _1268 = fma(_1230, _1218, _1224);
    float _1270 = _1234 * _1216;
    float _1272 = fma(_1236, _1208, _1260);
    float _1274 = -_1248;
    float _1276 = fma(_1124, _1244, _1274);
    float _1278 = fma(_1264, _1210, _1266);
    float _1280 = fma(_1256, _1208, _1270);
    float _1282 = -_1250;
    float _1284 = fma(_1140, _1246, _1282);
    float _1286 = fma(_1238, _1210, _1272);
    float _1288 = _1276 * _1278;
    float _1290 = fma(_1268, _1210, _1280);
    float _1292 = _1284 * _1278;
    float _1294 = fma(_1246, _1286, _1288);
    float _1296 = fma(_1242, _1286, _1292);
    float _1298 = fma(_1130, _1290, _1294);
    float _1300 = fma(_1124, _1290, _1296);
    float _1302 = _796 + _1298;
    float _1304 = _698 + _1300;
    float _1306 = _1124 * _1246;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1310 = _1302 + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1314 = _1304 + _1312;
    float _1316 = -_1306;
    float _1318 = fma(_1130, _1242, _1316);
    float _1320 = _1310 * _1310;
    float _1322 = _1318 * _1278;
    float _1324 = fma(_1314, _1314, _1320);
    float _1326 = fma(_1244, _1286, _1322);
    float _1328 = sqrt(_1324);
    float _1330 = fma(_1140, _1290, _1326);
    float _1332 = _702 + _1330;
    bool _1334 = _1328 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1336 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1338 = _1336 != 0;
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1342 = _1340 != 0;
    int _1344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1346 = _1344 != 0;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1350 = _1348 != 0;
    bool _1352 = !_1342;
    int _1354 = _1352 ? 0 : 1;
    bool _1356 = !_1338;
    int _1358 = _1356 ? 0 : 1;
    bool _1360 = !_1346;
    int _1362 = _1360 ? 0 : 1;
    bool _1364 = !_1350;
    int _1366 = _1364 ? 0 : 1;
    float _1368 = _1330;
    float _1370 = _1290;
    float _1372 = _1306;
    float _1374 = _1332;
    float _1376 = _1310;
    bool _1378 = _1350;
    if (!_1334)
    {
        _1368 = _1304;
    }
    float _1380 = _1368;
    float _1382 = _1380;
    if (!_1334)
    {
        _1370 = _1302;
    }
    float _1384 = _1370;
    float _1386 = _1384;
    if (!_1334)
    {
        _1372 = _1332;
    }
    float _1388 = _1372;
    bool _1390 = !_1334;
    float _1392 = _1388;
    if (!_1390)
    {
        float _1394 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1398 = _1328 + _1396;
        float _1400 = _1332 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1402 = rsqrt(_1324);
        float _1404 = _1398 * _1394;
        float _1406 = _1404 * 0.15915493667125701904296875;
        float _1408 = _1406 * 6.283185482025146484375;
        float _1410 = cos(_1408);
        float _1412 = _1406 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        float _1416 = _1410 + (-1.0);
        float _1418 = _1416 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1420 = fma(_1414, _1400, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1422 = fma(_1332, _1410, _1418);
        float _1424 = _1402 * _1420;
        float _1426 = fma(_1314, _1424, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1428 = fma(_1310, _1424, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1392 = _1422;
        _1382 = _1426;
        _1386 = _1428;
    }
    float _1430 = _1392;
    float _1432 = _1382;
    float _1434 = _1386;
    float _1436 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1438 = _1430 + _1436;
    float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1442 = _1432 + _1440;
    float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1446 = _1434 + _1444;
    float _1448 = _1438 * _1438;
    float _1450 = fma(_1442, _1442, _1448);
    float _1452 = fma(_1446, _1446, _1450);
    float _1454 = rsqrt(_1452);
    float _1456 = sqrt(_1452);
    float _1458 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1460 = _1442 * _1458;
    float _1462 = _1446 * _1458;
    float _1464 = _1460 * _1460;
    float _1466 = _1462 * _1462;
    float _1468 = _1464 + _1466;
    float _1470 = sqrt(_1468);
    bool _1472 = _1470 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1476 = _1470 + _1474;
    float _1478 = _1446;
    float _1480 = _1476;
    float _1482 = _1438;
    float _1484 = _1448;
    if (_1472)
    {
        float _1486 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1478 = _1486;
    }
    float _1488 = _1478;
    if (_1472)
    {
        float _1490 = rsqrt(_1468);
        _1374 = _1490;
    }
    float _1492 = _1374;
    float _1494 = _1492;
    if (_1472)
    {
        float _1496 = _1476 * _1488;
        _1480 = _1496;
    }
    float _1498 = _1480;
    if (_1472)
    {
        float _1500 = _1498 * 0.15915493667125701904296875;
        _1376 = _1500;
    }
    float _1502 = _1376;
    float _1504 = _1454;
    float _1506 = _1502;
    if (_1472)
    {
        float _1508 = _1502 * 6.283185482025146484375;
        float _1510 = sin(_1508);
        _1504 = _1510;
    }
    float _1512 = _1504;
    float _1514 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1516 = precise::max(0.0, _1514);
    float _1518 = _1314;
    float _1520 = _1516;
    if (_1472)
    {
        float _1522 = _1502 * 6.283185482025146484375;
        float _1524 = cos(_1522);
        _1518 = _1524;
    }
    float _1526 = _1518;
    float _1528 = -_1458;
    float _1530 = -_1516;
    float _1532 = fma(_1438, _1528, _1530);
    if (!_1472)
    {
        _1482 = _1460;
    }
    float _1534 = _1482;
    float _1536 = fma(_698, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1538 = _1534;
    if (_1472)
    {
        float _1540 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1520 = _1540;
    }
    float _1542 = _1520;
    float _1544 = _1512;
    if (_1472)
    {
        float _1546 = fma(_1512, _1542, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1484 = _1546;
    }
    float _1548 = _1484;
    float _1550 = floor(_1536);
    float _1552 = _1548;
    float _1554 = _1526;
    if (_1472)
    {
        float _1556 = _1526 + (-1.0);
        _1544 = _1556;
    }
    float _1558 = _1544;
    float _1560 = 0.0;
    float _1562 = _1558;
    if (_1472)
    {
        float _1564 = _1492 * _1548;
        _1560 = _1564;
    }
    float _1566 = _1560;
    if (!_1472)
    {
        _1494 = _1532;
    }
    float _1568 = _1494;
    float _1570 = _1568;
    if (_1472)
    {
        float _1572 = _1558 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1506 = _1572;
    }
    float _1574 = _1506;
    if (_1472)
    {
        float _1576 = _1460 * _1566;
        _1538 = _1576;
    }
    float _1578 = _1538;
    if (!_1472)
    {
        _1562 = _1462;
    }
    float _1580 = _1562;
    float _1582 = _1580;
    if (_1472)
    {
        float _1584 = _1462 * _1566;
        _1582 = _1584;
    }
    float _1586 = _1582;
    if (!_1472)
    {
        _1552 = _1464;
    }
    float _1588 = _1552;
    float _1590 = _1588;
    if (_1472)
    {
        float _1592 = fma(_1532, _1526, _1574);
        _1570 = _1592;
    }
    float _1594 = _1570;
    if (_1472)
    {
        float _1596 = _1578 * _1578;
        _1590 = _1596;
    }
    float _1598 = _1590;
    if (!_1472)
    {
        _1554 = _1466;
    }
    float _1600 = _1554;
    float _1602 = _1600;
    if (_1472)
    {
        float _1604 = _1586 * _1586;
        _1602 = _1604;
    }
    float _1606 = _1602;
    float _1608 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1610 = fma(_1594, _1594, _1598);
    float _1612 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1614 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1616 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1608);
    float _1618 = _1610 + _1606;
    float _1620 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1624 = fma(_1456, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1622);
    float _1626 = precise::clamp(_1624, 0.0, 1.0);
    float _1628 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1612);
    float _1630 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1616);
    float _1632 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1620);
    float _1634 = rsqrt(_1618);
    float _1636 = -_1626;
    float _1638 = _1636 + 1.0;
    float _1640 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1628);
    float _1642 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1632);
    float _1644 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1646 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1614);
    float _1648 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1650 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1652 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1654 = abs(_1638);
    float _1656 = log2(_1654);
    float _1658 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1660 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1662 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1646);
    float _1664 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1652);
    float _1666 = _1634 * _1578;
    float _1668 = -_1660;
    float _1670 = fma(_1668, _1658, 1.0);
    float _1672 = _1662 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1674 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1664);
    float _1676 = _1634 * _1594;
    float _1678 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1680 = _1634 * _1586;
    float _1682 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1674);
    float _1684 = fma(_796, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1686 = -_1678;
    float _1688 = fma(_1676, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1686);
    float _1690 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1692 = -_1550;
    float _1694 = _1536 + _1692;
    float _1696 = floor(_1684);
    float _1698 = -_1680;
    float _1700 = fma(_1698, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1688);
    float _1702 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1704 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1706 = fma(_1700, -0.5, 0.5);
    float _1708 = fma(_1700, 0.5, 0.5);
    float _1710 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1702);
    float _1712 = exp2(_1690);
    float _1714 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1704);
    float _1716 = _1676 + 1.0;
    float _1718 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1710);
    float _1720 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1714);
    float _1722 = log2(_1670);
    float _1724 = -_1696;
    float _1726 = _1684 + _1724;
    float _1728 = fma(_1708, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1730 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1718);
    float _1732 = fma(_1708, _1728, -0.212114393711090087890625);
    float _1734 = 1.0 / _1682;
    float _1736 = -_1676;
    float _1738 = fma(_1712, _1716, _1736);
    float _1740 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1720);
    float _1742 = fma(_1708, _1732, 1.570728778839111328125);
    float _1744 = fma(_1738, 0.5, 0.5);
    float _1746 = sqrt(_1706);
    float _1748 = _1722 * 0.693147182464599609375;
    float2 _7250 = float2(_1694, _1726);
    float _1750 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7250, float2(0.0), isnan(_7250)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7250, float2(0.0), isnan(_7250)), level(0.0)).x;
    float _1752 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1754 = _1730 * _1734;
    float _1756 = _1740 * _1734;
    float _1758 = fma(_1754, 0.5, 0.5);
    float _1760 = fma(_1756, -0.5, 0.5);
    float _1762 = _1746 * 0.636619746685028076171875;
    float _1764 = -_1742;
    float _1766 = fma(_1762, _1764, 1.0);
    float3 _7283 = float3(_1758, _1760, _1752);
    float _1768 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7283, float3(0.0), isnan(_7283)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7283, float3(0.0), isnan(_7283)), level(0.0)).x;
    float3 _7294 = float3(_1758, _1760, _1752);
    float4 _1771 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7294, float3(0.0), isnan(_7294)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7294, float3(0.0), isnan(_7294)), level(0.0)).xyzw;
    float _1773 = _1771.x;
    float _1775 = _1771.y;
    float _1777 = _1771.z;
    float _1779 = _1771.w;
    float2 _7310 = float2(_1766, _1744);
    float3 _1783 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7310, float2(0.0), isnan(_7310)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7310, float2(0.0), isnan(_7310)), level(0.0)).xyz;
    float _1785 = _1783.x;
    float _1787 = _1783.y;
    float _1789 = _1783.z;
    float _1791 = in.m_69.x;
    float _1793 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1795 = int(_1793);
    float _1797 = _1074 * _594;
    float _1799 = in.m_53.w;
    float _1801 = _1264 * _1284;
    float _1803 = float(uint(_572));
    float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1807 = _1805 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1811 = _1809 != 0;
    float _1813 = trunc(_990);
    int _1815 = int(_1813);
    int _1817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1819 = _1817 != 0;
    float _1821 = _1264 * _1318;
    bool _1823 = _544 > 0.5;
    float _1825 = _1264 * _1276;
    bool _1827 = _558 > 0.5;
    float _1829 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1831 = float(uint(_1795));
    float _1833 = 1.0 / _1803;
    float _1835 = fma(_1238, _1246, _1825);
    int _1837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1839 = _1837 != 0;
    out.m_71.x = _1432;
    out.m_71.y = _1430;
    out.m_71.z = _1434;
    float _1841 = _1758;
    float _1843 = _1803;
    float _1845 = _1682;
    float _1847 = _1740;
    if (_1811)
    {
        bool _1849 = _550 > 0.5;
        _1378 = _1849;
    }
    bool _1851 = _1378;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1855 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1853;
    if (_1819)
    {
        _1841 = 1.0;
    }
    float _1857 = _1841;
    float _1859 = 1.0 / _1831;
    float _1861 = _1857;
    if (!_1811)
    {
        _1843 = _1791;
    }
    float _1863 = _1843;
    float _1865 = _1863;
    if (!_1819)
    {
        _1861 = 7.345489978790283203125;
    }
    float _1867 = _1861;
    bool _1869 = _1799 > 0.5;
    float _1871 = _1799;
    if (!_1811)
    {
        _1871 = _1863;
    }
    float _1873 = _1871;
    float _1875 = trunc(_1070);
    int _1877 = int(_1875);
    float _1879 = _1873;
    if (_1811)
    {
        _1865 = _1791;
    }
    float _1881 = _1865;
    float _1883 = _1867 * _550;
    int _1885 = as_type<int>(_1833) + (-2);
    float _1887 = float(uint(_1815));
    float _1889 = 0.0;
    if (_1819)
    {
        _1889 = _550;
    }
    float _1891 = _1889;
    float _1893 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1895 = int(_1893);
    float _1897 = 0.0;
    float _1899 = _1891;
    if (_1819)
    {
        _1897 = 1.0;
    }
    float _1901 = _1897;
    float _1903 = as_type<float>(_1885) * _1887;
    float _1905 = _1901;
    if (!_1819)
    {
        _1899 = _544;
    }
    float _1907 = _1899;
    if (!_1819)
    {
        _1905 = 1.2345600128173828125;
    }
    float _1909 = _1905;
    float _1911 = in.m_69.y;
    int _1913 = as_type<int>(_1859) + (-2);
    float _1915 = trunc(_1903);
    float _1917 = precise::max(_1915, 0.0);
    uint _1920 = uint(_1917);
    float _1922 = float(uint(_1877));
    float _1924 = _1907 * _1909;
    float _1926 = 0.0;
    int _1928 = as_type<int>(_1922);
    if (_1819)
    {
        _1926 = 1.0;
    }
    float _1930 = _1926;
    float _1932 = _1930;
    if (!_1819)
    {
        _674 = _558;
    }
    float _1934 = _674;
    float _1936 = as_type<float>(_1913) * _1922;
    if (!_1819)
    {
        _1932 = 5.839270114898681640625;
    }
    float _1938 = _1932;
    float _1940 = 1.0 / _1807;
    float _1942 = float(uint(_1895));
    if (_1811)
    {
        float _1944 = -_1881;
        float _1946 = _1944 + 1.0;
        _1928 = as_type<int>(_1946);
    }
    int _1948 = _1928;
    int _1950 = ~_572;
    int _1952 = _1950 + 1;
    float _1954 = _1934 * _1938;
    int _1956 = ~_1795;
    int _1958 = _1956 + 1;
    if (_1811)
    {
        float _1960 = _1851 ? as_type<float>(_1948) : _1881;
        _1879 = _1960;
    }
    float _1962 = _1879;
    float _1964 = trunc(_1936);
    float _1966 = precise::max(_1964, 0.0);
    uint _1968 = uint(_1966);
    int _1970 = _1952 * int(_1920);
    int _1972 = _1970 + _1815;
    int _1974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1976 = _1974 != 0;
    int _1978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1980 = _1978 != 0;
    float _1982 = float(uint(_1972));
    float _1984 = -_1911;
    float _1986 = _1984 + 1.0;
    float _1988 = 1.0 / _1942;
    float _1990 = _1855 * _1940;
    int _1992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1994 = _1992 != 0;
    float _1996 = as_type<float>(_1885) * _1982;
    int _1998 = _1869 ? as_type<int>(_1986) : as_type<int>(_1911);
    int _2000 = _1823 ? as_type<int>(_1986) : as_type<int>(_1911);
    float _2002 = trunc(_1062);
    int _2004 = int(_2002);
    int _2006 = _1958 * int(_1968);
    int _2008 = _2006 + _1877;
    float _2010 = _1839 ? as_type<float>(_1998) : _1911;
    int _2012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2014 = _2012 != 0;
    float _2016 = float(uint(_2008));
    int _2018 = as_type<int>(_1988) + (-2);
    float _2020 = trunc(_1996);
    float _2022 = precise::max(_2020, 0.0);
    uint _2024 = uint(_2022);
    int _2026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2028 = _2026 != 0;
    float _2030 = as_type<float>(_1913) * _2016;
    float _2032 = _1976 ? as_type<float>(_2000) : _1911;
    float _2034 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2036 = _542 + _2034;
    int _2038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2040 = _2038 != 0;
    float _2042 = float(uint(_2004));
    float _2044 = floor(_1883);
    int _2046 = as_type<int>(_1996);
    float _2048 = _2036;
    float _2050 = _1911;
    if (_1980)
    {
        float _2052 = -_1881;
        float _2054 = _2052 + 1.0;
        _2046 = as_type<int>(_2054);
    }
    int _2056 = _2046;
    float _2058 = fma(_1990, _2036, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2060 = float(_1815);
    float _2062 = as_type<float>(_2018) * _2042;
    if (!_1980)
    {
        _2048 = _1881;
    }
    float _2064 = _2048;
    float _2066 = _2064;
    if (_1980)
    {
        float _2068 = _1827 ? as_type<float>(_2056) : _1881;
        _2066 = _2068;
    }
    float _2070 = _2066;
    float _2072 = floor(_1924);
    bool _2074 = _2060 >= _1064;
    bool _2076 = isnan(_2060);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan(_1064);
    bool _2082 = _2078 || _2080;
    float _2084 = float(_2082);
    if (_2040)
    {
        float _2086 = _1827 ? _1986 : _1911;
        _2050 = _2086;
    }
    float _2088 = _2050;
    int _2090 = int(_1920) + int(_2024);
    int _2092 = ~_572;
    int _2094 = _2092 + 1;
    float _2096 = floor(_1954);
    float _2098 = -_2044;
    float _2100 = _1883 + _2098;
    int _2102 = ~_1795;
    int _2104 = _2102 + 1;
    int _2106 = _2094 * _2090;
    int _2108 = _2106 + _1815;
    float _2110 = _2100 * _1064;
    float _2112 = float(_1877);
    float _2114 = trunc(_2030);
    float _2116 = precise::max(_2114, 0.0);
    uint _2118 = uint(_2116);
    float _2120 = -_2072;
    float _2122 = _1924 + _2120;
    int _2124 = ~_1895;
    int _2126 = _2124 + 1;
    float _2128 = float(_1895);
    int _2130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2132 = _2130 != 0;
    float _2134 = trunc(_2062);
    float _2136 = precise::max(_2134, 0.0);
    uint _2138 = uint(_2136);
    float _2140 = -_2096;
    float _2142 = _1954 + _2140;
    float _2144 = float(_1795);
    float _2146 = float(_2004);
    bool _2148 = uint(_2108) >= uint(_572);
    float _2150 = _2144 * _2122;
    int _2152 = int(_1968) + int(_2118);
    float _2154 = trunc(_2110);
    int _2156 = int(_2154);
    bool _2158 = _2112 >= _2144;
    bool _2160 = isnan(_2112);
    bool _2162 = _2158 || _2160;
    bool _2164 = isnan(_2144);
    bool _2166 = _2162 || _2164;
    float _2168 = float(_2166);
    float _2170 = _2144 * _734;
    int _2172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2174 = _2172 != 0;
    int _2176 = abs(_834);
    int _2178 = abs(_1354);
    float _2180 = trunc(_2084);
    int _2182 = int(_2180);
    int _2184 = _2104 * _2152;
    int _2186 = _2184 + _1877;
    int _2188 = abs(_1358);
    int _2190 = abs(_1362);
    int _2192 = abs(_886);
    float _2194 = trunc(_2150);
    int _2196 = int(_2194);
    int _2198 = _2126 * int(_2138);
    int _2200 = _2198 + _2004;
    bool _2202 = _2146 >= _2128;
    bool _2204 = isnan(_2146);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan(_2128);
    bool _2210 = _2206 || _2208;
    float _2212 = float(_2210);
    bool _2214 = !_2148;
    int _2216 = _2214 ? 0 : (-1);
    float _2218 = float(uint(_2200));
    float _2220 = _2128 * _734;
    bool _2222 = !_2132;
    int _2224 = _2222 ? 0 : 1;
    float _2226 = trunc(_2168);
    int _2228 = int(_2226);
    bool _2230 = uint(_2186) >= uint(_1795);
    float _2232 = as_type<float>(_2018) * _2218;
    bool _2234 = !_2174;
    int _2236 = _2234 ? 0 : 1;
    float _2238 = _2128 * _2142;
    int _2240 = ~_2090;
    int _2242 = _2240 + _2216;
    int _2244 = _2242 + 1;
    int _2246 = abs(_2236);
    float _2248 = trunc(_1797);
    int _2250 = int(_2248);
    bool _2252 = !_2230;
    int _2254 = _2252 ? 0 : (-1);
    int _2256 = _572 * _2244;
    int _2258 = _2256 + _1815;
    int _2260 = abs(_2224);
    bool _2262 = _572 == 0;
    int _2264 = ~_2152;
    int _2266 = _2264 + _2254;
    int _2268 = _2266 + 1;
    int _2270 = _2156 * _2260;
    int _2272 = _2270 + _1815;
    int _2274 = ~_2182;
    int _2276 = _2274 + 1;
    int _2278 = _2276 + 1;
    int _2280 = _2196 * _2246;
    int _2282 = _2280 + _1877;
    bool _2284 = !_2262;
    int _2286 = _2284 ? _2258 : (-1);
    int _2288 = _1795 * _2268;
    int _2290 = _2288 + _1877;
    bool _2292 = _1795 == 0;
    float _2294 = trunc(_2232);
    float _2296 = precise::max(_2294, 0.0);
    uint _2298 = uint(_2296);
    int _2300 = ~_2228;
    int _2302 = _2300 + 1;
    int _2304 = _2302 + 1;
    int _2306 = _2286 * _2278;
    bool _2308 = !_2292;
    int _2310 = _2308 ? _2290 : (-1);
    int _2312 = _572 + (-1);
    int _2314 = _1795 + (-1);
    int _2316 = _2304 * _2310;
    int _2318 = ~_1895;
    int _2320 = _2318 + 1;
    int _2322 = _2182 * _2312;
    int _2324 = _2322 + _2306;
    int _2326 = abs(_842);
    int _2328 = _2228 * _2314;
    int _2330 = _2328 + _2316;
    int _2332 = abs(_882);
    int _2334 = _2324 * _2176;
    float _2336 = trunc(_2170);
    int _2338 = int(_2336);
    int _2340 = _2330 * _2178;
    int _2342 = int(_2138) + int(_2298);
    int _2344 = _2250 * _2326;
    int _2346 = _2344 + _2334;
    bool _2348 = !_1994;
    int _2350 = _2348 ? 0 : 1;
    int _2352 = _2272 * _2332;
    int _2354 = _2352 + _2346;
    int _2356 = abs(_2350);
    float _2358 = trunc(_2212);
    int _2360 = int(_2358);
    int _2362 = abs(_1366);
    int _2364 = _2320 * _2342;
    int _2366 = _2364 + _2004;
    int _2368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2370 = _2368 != 0;
    int _2372 = _2156 * _2356;
    int _2374 = _2372 + _2354;
    int _2376 = ~_1895;
    int _2378 = _2376 + 1;
    bool _2380 = uint(_2366) >= uint(_1895);
    int _2382 = _2338 * _2188;
    int _2384 = _2382 + _2340;
    float _2386 = float(uint(_2374));
    float _2388 = trunc(_2220);
    int _2390 = int(_2388);
    bool _2392 = !_2380;
    int _2394 = _2392 ? 0 : (-1);
    bool _2396 = !_2370;
    int _2398 = _2396 ? 0 : 1;
    float _2400 = as_type<float>(_1885) * _2386;
    int _2402 = ~_2342;
    int _2404 = _2402 + _2394;
    int _2406 = _2404 + 1;
    int _2408 = _2282 * _2190;
    int _2410 = _2408 + _2384;
    int _2412 = abs(_2398);
    float _2414 = _702 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2416 = _1895 == 0;
    float _2418 = trunc(_2400);
    float _2420 = precise::max(_2418, 0.0);
    uint _2422 = uint(_2420);
    int _2424 = _1895 * _2406;
    int _2426 = _2424 + _2004;
    float _2428 = _702 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2430 = ~_2360;
    int _2432 = _2430 + 1;
    int _2434 = _2432 + 1;
    float _2436 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2414);
    float _2438 = fma(_698, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2428);
    bool _2440 = !_2416;
    int _2442 = _2440 ? _2426 : (-1);
    float _2444 = trunc(_2238);
    int _2446 = int(_2444);
    int _2448 = ~_572;
    int _2450 = _2448 + 1;
    float _2452 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2438);
    int _2454 = _1895 + (-1);
    int _2456 = _2434 * _2442;
    int _2458 = ~_1795;
    int _2460 = _2458 + 1;
    int _2462 = _2196 * _2362;
    int _2464 = _2462 + _2410;
    int _2466 = abs(_898);
    int _2468 = _2360 * _2454;
    int _2470 = _2468 + _2456;
    int _2472 = _2450 * int(_2422);
    int _2474 = _2472 + _2374;
    bool _2476 = !_2014;
    int _2478 = _2476 ? 0 : 1;
    float _2480 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2436);
    int _2482 = _2470 * _2192;
    float _2484 = float(uint(_2474));
    int _2486 = _2446 * _2412;
    int _2488 = _2486 + _2004;
    float _2490 = float(uint(_2464));
    int _2492 = _2390 * _2466;
    int _2494 = _2492 + _2482;
    int _2496 = abs(_2478);
    float _2498 = as_type<float>(_1885) * _2484;
    bool _2500 = !_2028;
    int _2502 = _2500 ? 0 : 1;
    float _2504 = as_type<float>(_1913) * _2490;
    float _2506 = trunc(_2498);
    float _2508 = precise::max(_2506, 0.0);
    uint _2510 = uint(_2508);
    int _2512 = abs(_2502);
    float _2514 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2516 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2518 = isnan(_542);
    bool _2520 = _2516 || _2518;
    bool _2522 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2524 = _2520 || _2522;
    float _2526 = float(_2524);
    int _2528 = _2488 * _2496;
    int _2530 = _2528 + _2494;
    float _2532 = float(uint(_2272));
    float _2534 = _2480 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2538 = _2536 != 0;
    float _2540 = trunc(_2504);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    int _2546 = ~_572;
    int _2548 = _2546 + 1;
    float _2550 = as_type<float>(_1885) * _2532;
    float _2552 = _2534 + _2514;
    float _2554 = -_1750;
    float _2556 = _2554 + 1.0;
    float _2558 = trunc(_2550);
    float _2560 = precise::max(_2558, 0.0);
    uint _2562 = uint(_2560);
    bool _2564 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2566 = isnan(_542);
    bool _2568 = _2564 || _2566;
    bool _2570 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2572 = _2568 || _2570;
    float _2574 = float(_2572);
    float _2576 = -_2526;
    float _2578 = _2576 + 1.0;
    int _2580 = int(_2422) + int(_2510);
    float _2582 = float(uint(_2282));
    int _2584 = _2446 * _2512;
    int _2586 = _2584 + _2530;
    float _2588 = _2574 * _2578;
    int _2590 = _2460;
    float _2592 = _2588;
    float _2594 = as_type<float>(_2298);
    float _2596 = as_type<float>(_2228);
    if (_2538)
    {
        float _2598 = -_1881;
        float _2600 = _2598 + 1.0;
        _2590 = as_type<int>(_2600);
    }
    int _2602 = _2590;
    float _2604 = 1.0 / _2514;
    float _2606 = float(uint(_2586));
    float _2608 = _2058 * _2588;
    int _2610 = _2460 * int(_2544);
    int _2612 = _2610 + _2464;
    if (!_2538)
    {
        _2592 = _1881;
    }
    float _2614 = _2592;
    float _2616 = as_type<float>(_1913) * _2582;
    float _2618 = as_type<float>(_2018) * _2606;
    int _2620 = ~_572;
    int _2622 = _2620 + 1;
    float _2624 = -_2574;
    float _2626 = _2624 + 1.0;
    float _2628 = float(uint(_2612));
    float _2630 = exp2(_1829);
    float _2632 = _2614;
    float _2634 = _2626;
    if (_2538)
    {
        float _2636 = _1823 ? as_type<float>(_2602) : _1881;
        _2632 = _2636;
    }
    float _2638 = _2632;
    float _2640 = as_type<float>(_1913) * _2628;
    float _2642 = float(uint(_2488));
    int _2644 = _2622 * _2580;
    int _2646 = _2644 + _2374;
    float _2648 = trunc(_2618);
    float _2650 = precise::max(_2648, 0.0);
    uint _2652 = uint(_2650);
    int _2654 = ~_1895;
    int _2656 = _2654 + 1;
    float _2658 = as_type<float>(_2018) * _2642;
    bool _2660 = uint(_2646) >= uint(_572);
    int _2662 = _2548 * int(_2562);
    int _2664 = _2662 + _2272;
    float _2666 = fma(_2626, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2608);
    bool _2668 = !_2660;
    int _2670 = _2668 ? 0 : (-1);
    float _2672 = trunc(_2640);
    float _2674 = precise::max(_2672, 0.0);
    uint _2676 = uint(_2674);
    float _2678 = -_2630;
    float _2680 = _2678 + 1.0;
    int _2682 = ~_2580;
    int _2684 = _2682 + _2670;
    int _2686 = _2684 + 1;
    int _2688 = ~_1895;
    int _2690 = _2688 + 1;
    float _2692 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2694 = trunc(_2658);
    float _2696 = precise::max(_2694, 0.0);
    uint _2698 = uint(_2696);
    float _2700 = float(uint(_2664));
    int _2702 = _572 * _2686;
    int _2704 = _2702 + _2374;
    float _2706 = _2552 * _2604;
    float _2708 = _2706 * 0.5;
    float _2710 = _2692 * _1768;
    float _2712 = as_type<float>(_1885) * _2700;
    int _2714 = _2656 * int(_2652);
    int _2716 = _2714 + _2586;
    int _2718 = int(_2544) + int(_2676);
    float _2720 = trunc(_2616);
    float _2722 = precise::max(_2720, 0.0);
    uint _2724 = uint(_2722);
    int _2726 = ~_1795;
    int _2728 = _2726 + 1;
    float _2730 = -_2692;
    float _2732 = _2730 + 1.0;
    float _2734 = float(uint(_2716));
    bool _2736 = !_2262;
    int _2738 = _2736 ? _2704 : (-1);
    float _2740 = as_type<float>(_2018) * _2734;
    float _2742 = trunc(_2712);
    float _2744 = precise::max(_2742, 0.0);
    uint _2746 = uint(_2744);
    int _2748 = ~_1795;
    int _2750 = _2748 + 1;
    int _2752 = _2690 * int(_2698);
    int _2754 = _2752 + _2488;
    int _2756 = _2738 & 3;
    bool _2758 = _2756 != 0;
    int _2760 = _2738 & 3;
    bool _2762 = _2760 != 0;
    int _2764 = _2728 * int(_2724);
    int _2766 = _2764 + _2282;
    float _2768 = trunc(_2740);
    float _2770 = precise::max(_2768, 0.0);
    uint _2772 = uint(_2770);
    float _2774 = float(uint(_2754));
    int _2776 = _2750 * _2718;
    int _2778 = _2776 + _2464;
    bool _2780 = uint(_2756) > 1u;
    float _2782 = float(uint(_2766));
    float _2784 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2786 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2784);
    bool _2788 = uint(_2778) >= uint(_1795);
    float _2790 = as_type<float>(_2018) * _2774;
    int _2792 = int(_2562) + int(_2746);
    float _2794 = as_type<float>(_1913) * _2782;
    int _2796 = ~_1895;
    int _2798 = _2796 + 1;
    float _2800 = 1.0 / _2786;
    bool _2802 = !_2788;
    int _2804 = _2802 ? 0 : (-1);
    int _2806 = _2762 ? 0 : 1;
    int _2808 = int(_2652) + int(_2772);
    float _2810 = trunc(_2794);
    float _2812 = precise::max(_2810, 0.0);
    uint _2814 = uint(_2812);
    int _2816 = ~_572;
    int _2818 = _2816 + 1;
    bool _2820 = uint(_2756) >= 2u;
    int _2822 = _2798 * _2808;
    int _2824 = _2822 + _2586;
    bool _2826 = _2756 != 3;
    int _2828 = _2818 * _2792;
    int _2830 = _2828 + _2272;
    int _2832 = ~_2718;
    int _2834 = _2832 + _2804;
    int _2836 = _2834 + 1;
    int _2838 = ~_2806;
    int _2840 = _2838 + 1;
    int _2842 = _2840 + 1;
    float _2844 = in.m_73.x;
    float _2846 = in.m_73.y;
    float _2848 = in.m_73.z;
    int _2850 = _2842;
    if (!_2780)
    {
        int _2852 = ~_2806;
        int _2854 = _2852 + 1;
        _2850 = _2854;
    }
    int _2856 = _2850;
    int _2858 = _1795 * _2836;
    int _2860 = _2858 + _2464;
    int _2862 = _2820 ? 0 : 1;
    bool _2864 = uint(_2824) >= uint(_1895);
    bool _2866 = !_2292;
    int _2868 = _2866 ? _2860 : (-1);
    bool _2870 = !_2864;
    int _2872 = _2870 ? 0 : (-1);
    bool _2874 = uint(_2830) >= uint(_572);
    int _2876 = ~_2862;
    int _2878 = _2876 + 1;
    int _2880 = _2878 + 1;
    int _2882 = _2880;
    float _2884 = as_type<float>(_2860);
    if (_2826)
    {
        int _2886 = ~_2862;
        int _2888 = _2886 + 1;
        _2882 = _2888;
    }
    int _2890 = _2882;
    int _2892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2894 = _2892 != 0;
    bool _2896 = !_2874;
    int _2898 = _2896 ? 0 : (-1);
    int _2900 = _2868 & 3;
    bool _2902 = _2900 != 0;
    int _2904 = ~_2808;
    int _2906 = _2904 + _2872;
    int _2908 = _2906 + 1;
    bool _2910 = !_2894;
    int _2912 = _2910 ? 0 : 1;
    bool _2914 = uint(_2900) >= 2u;
    int _2916 = _1895 * _2908;
    int _2918 = _2916 + _2586;
    int _2920 = int(_2724) + int(_2814);
    float _2922 = trunc(_2790);
    float _2924 = precise::max(_2922, 0.0);
    uint _2926 = uint(_2924);
    int _2928 = _2914 ? 0 : 1;
    bool _2930 = uint(_2900) > 1u;
    int _2932 = _2902 ? 0 : 1;
    bool _2934 = _2900 != 3;
    bool _2936 = _1154 != 0.0;
    bool _2938 = isnan(_1154);
    bool _2940 = _2936 || _2938;
    bool _2942 = isnan(0.0);
    bool _2944 = _2940 || _2942;
    int _2946 = ~_1795;
    int _2948 = _2946 + 1;
    bool _2950 = !_2416;
    int _2952 = _2950 ? _2918 : (-1);
    bool _2954 = _1152 == 0.0;
    bool _2956 = !_2944;
    bool _2958 = _2954 && _2956;
    int _2960 = _2948 * _2920;
    int _2962 = _2960 + _2282;
    int _2964 = ~_2932;
    int _2966 = _2964 + 1;
    int _2968 = _2966 + 1;
    int _2970 = _2968;
    if (!_2930)
    {
        int _2972 = ~_2932;
        int _2974 = _2972 + 1;
        _2970 = _2974;
    }
    int _2976 = _2970;
    int _2978 = int(_2698) + int(_2926);
    float _2980 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2982 = _2800 * _2980;
    int _2984 = _2952 & 3;
    bool _2986 = _2984 != 0;
    bool _2988 = _1156 == 0.0;
    bool _2990 = _2988 && _2958;
    float _2992 = abs(_2982);
    float _2994 = log2(_2992);
    int _2996 = ~_2928;
    int _2998 = _2996 + 1;
    int _3000 = _2998 + 1;
    int _3002 = _2378 * _2978;
    int _3004 = _3002 + _2488;
    int _3006 = _3000;
    if (_2934)
    {
        int _3008 = ~_2928;
        int _3010 = _3008 + 1;
        _3006 = _3010;
    }
    int _3012 = _3006;
    bool _3014 = uint(_2962) >= uint(_1795);
    int _3016 = _2986 ? 0 : 1;
    float _3018 = in.m_75.x;
    float _3020 = in.m_75.y;
    float _3022 = in.m_75.z;
    float _3024 = in.m_75.w;
    bool _3026 = _2984 != 3;
    bool _3028 = !_3014;
    int _3030 = _3028 ? 0 : (-1);
    bool _3032 = uint(_2984) >= 2u;
    if (_2990)
    {
        _2594 = _2846;
    }
    float _3034 = _2594;
    float _3036 = _2994 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3038 = _3032 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _3040 = _3038;
    float _3042 = _3034;
    if (_2990)
    {
        _2596 = _2848;
    }
    float _3044 = _2596;
    bool _3046 = uint(_2984) > 1u;
    float _3048 = exp2(_3036);
    int _3050 = ~as_type<int>(_3038);
    int _3052 = _3050 + 1;
    int _3054 = _3052 + 1;
    int _3056 = _3054;
    float _3058 = _3044;
    if (_3026)
    {
        int _3060 = ~as_type<int>(_3038);
        int _3062 = _3060 + 1;
        _3056 = _3062;
    }
    int _3064 = _3056;
    if (_2990)
    {
        _2884 = _3034;
    }
    float _3066 = _2884;
    float _3068 = _3066;
    if (_2990)
    {
        _3040 = _3044;
    }
    float _3070 = _3040;
    float _3072 = _3070;
    if (!_2990)
    {
        _3042 = _2846;
    }
    float _3074 = _3042;
    float _3076 = _3022 * _2844;
    if (!_2990)
    {
        _3058 = _2848;
    }
    float _3078 = _3058;
    if (_2990)
    {
        _2634 = _2844;
    }
    float _3080 = _2634;
    float _3082 = _3080;
    if (!_2990)
    {
        float _3084 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2844);
        _3082 = _3084;
    }
    float _3086 = _3082;
    bool _3088 = uint(_3004) >= uint(_1895);
    if (!_2990)
    {
        float _3090 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3074);
        _3068 = _3090;
    }
    float _3092 = _3068;
    if (!_2990)
    {
        float _3094 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3078);
        _3072 = _3094;
    }
    float _3096 = _3072;
    float _3098 = -_3076;
    float _3100 = fma(_3018, _3078, _3098);
    float _3102 = _3020 * _3078;
    float _3104 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3106 = ~_3016;
    int _3108 = _3106 + 1;
    int _3110 = _3108 + 1;
    float _3112 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3114 = _3110;
    if (!_3046)
    {
        int _3116 = ~_3016;
        int _3118 = _3116 + 1;
        _3114 = _3118;
    }
    int _3120 = _3114;
    float _3122 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3124 = !_3088;
    int _3126 = _3124 ? 0 : (-1);
    float _3128 = _3104 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3132 = _3130 != 0;
    float _3134 = _3112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3138 = _3136 != 0;
    float _3140 = fma(_2526, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2666);
    float _3142 = _3122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3144 = _3018 * _3074;
    float _3146 = -_3102;
    float _3148 = fma(_3022, _3074, _3146);
    float _3150 = _3140 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3152 = _2738 >> 31;
    float _3154 = fma(_3048, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3156 = precise::clamp(_3154, 0.0, 1.0);
    float _3158 = -_3144;
    float _3160 = fma(_3020, _2844, _3158);
    out.m_77.x = _3128;
    out.m_77.y = _3134;
    out.m_77.z = _3142;
    out.m_77.w = _3150;
    int _3162 = _3152 & 3;
    float _3164 = _3100 * _3024;
    int _3166 = _2868 & 3;
    bool _3168 = _3166 != 0;
    float _3170 = fma(_3156, -2.0, 3.0);
    int _3172 = _2738 + _3162;
    float _3174 = _3148 * _3024;
    float _3176 = _3160 * _3024;
    float _3178 = _1252 * _1284;
    float _3180 = _3156 * _3156;
    float _3182 = _1252 * _1318;
    int _3184 = ~_2978;
    int _3186 = _3184 + _3126;
    int _3188 = _3186 + 1;
    float _3190 = fma(_1236, _1242, _3178);
    float _3192 = _3180 * _3170;
    int _3194 = _2868 >> 31;
    float _3196 = _1252 * _1276;
    int _3198 = _2952 >> 31;
    float _3200 = _1232 * _1284;
    int _3202 = _3194 & 3;
    float _3204 = _1232 * _1318;
    int _3206 = _3198 & 3;
    float _3208 = _1232 * _1276;
    int _3210 = _2868 + _3202;
    float _3212 = fma(_1236, _1244, _3182);
    int _3214 = _2952 + _3206;
    float _3216 = -_1230;
    float _3218 = fma(_3216, _1244, _3204);
    int _3220 = _3172 >> 2;
    float _3222 = fma(_1236, _1246, _3196);
    int _3224 = _3210 >> 2;
    float _3226 = -_1230;
    float _3228 = fma(_3226, _1242, _3200);
    int _3230 = _3214 >> 2;
    float _3232 = -_1230;
    float _3234 = fma(_3232, _1246, _3208);
    int _3236 = _3220 << 4;
    int _3238 = _3236 + 368;
    float _3240 = fma(_1238, _1242, _1801);
    int _3242 = _3224 << 4;
    int _3244 = _3242 + 512;
    float _3246 = fma(_1238, _1244, _1821);
    uint _3248 = uint(int(uint(_3238) >> uint(2)));
    uint _3250 = uint(int(uint(int(_3248)) >> uint(2)));
    int _3252 = int(_3248) & 3;
    float _3254 = (*spvDescriptorSet0.vp_c9)._m0[int(_3250)][_3252];
    int _3256 = int(_3248) + 1;
    uint _3258 = uint(int(uint(_3256) >> uint(2)));
    int _3260 = _3256 & 3;
    float _3262 = (*spvDescriptorSet0.vp_c9)._m0[int(_3258)][_3260];
    int _3264 = _3230 << 4;
    int _3266 = _3264 + 656;
    int _3268 = _1895 * _3188;
    int _3270 = _3268 + _2488;
    int _3272 = ~_2792;
    int _3274 = _3272 + _2898;
    int _3276 = _3274 + 1;
    float _3278 = -_3192;
    float _3280 = _3278 + 1.0;
    bool _3282 = !_3168;
    int _3284 = _3282 ? 0 : 1;
    float _3286 = fma(_1256, _1124, _3190);
    int _3288 = _2952 & 3;
    bool _3290 = _3288 != 0;
    uint _3292 = uint(int(uint(_3244) >> uint(2)));
    uint _3294 = uint(int(uint(int(_3292)) >> uint(2)));
    int _3296 = int(_3292) & 3;
    float _3298 = (*spvDescriptorSet0.vp_c9)._m0[int(_3294)][_3296];
    int _3300 = int(_3292) + 1;
    uint _3302 = uint(int(uint(_3300) >> uint(2)));
    int _3304 = _3300 & 3;
    float _3306 = (*spvDescriptorSet0.vp_c9)._m0[int(_3302)][_3304];
    int _3308 = ~_2920;
    int _3310 = _3308 + _3030;
    int _3312 = _3310 + 1;
    float _3314 = fma(_3280, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3192);
    bool _3316 = !_3290;
    int _3318 = _3316 ? 0 : 1;
    int _3320 = _572 * _3276;
    int _3322 = _3320 + _2272;
    bool _3324 = _2756 != 3;
    int _3326 = _1795 * _3312;
    int _3328 = _3326 + _2282;
    int _3330 = abs(_2856);
    uint _3332 = uint(int(uint(_3266) >> uint(2)));
    uint _3334 = uint(int(uint(int(_3332)) >> uint(2)));
    int _3336 = int(_3332) & 3;
    float _3338 = (*spvDescriptorSet0.vp_c9)._m0[int(_3334)][_3336];
    int _3340 = int(_3332) + 1;
    uint _3342 = uint(int(uint(_3340) >> uint(2)));
    int _3344 = _3340 & 3;
    float _3346 = (*spvDescriptorSet0.vp_c9)._m0[int(_3342)][_3344];
    bool _3348 = !_3324;
    int _3350 = _3348 ? 0 : (-1);
    float _3352 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3354 = int(_3352);
    bool _3356 = _2900 != 3;
    float _3358 = fma(_1256, _1130, _3222);
    int _3360 = abs(_3284);
    float _3362 = fma(_1268, _1140, _3246);
    bool _3364 = !_3356;
    int _3366 = _3364 ? 0 : (-1);
    int _3368 = _3244 + 8;
    uint _3370 = uint(int(uint(_3368) >> uint(2)));
    uint _3372 = uint(int(uint(int(_3370)) >> uint(2)));
    int _3374 = int(_3370) & 3;
    float _3376 = (*spvDescriptorSet0.vp_c9)._m0[int(_3372)][_3374];
    int _3378 = int(_3370) + 1;
    uint _3380 = uint(int(uint(_3378) >> uint(2)));
    int _3382 = _3378 & 3;
    float _3384 = (*spvDescriptorSet0.vp_c9)._m0[int(_3380)][_3382];
    bool _3386 = _2984 != 3;
    int _3388 = abs(_2976);
    int _3390 = ~_3330;
    int _3392 = _3390 + 1;
    int _3394 = _3392 + 1;
    int _3396 = _3266 + 8;
    uint _3398 = uint(int(uint(_3396) >> uint(2)));
    uint _3400 = uint(int(uint(int(_3398)) >> uint(2)));
    int _3402 = int(_3398) & 3;
    float _3404 = (*spvDescriptorSet0.vp_c9)._m0[int(_3400)][_3402];
    int _3406 = int(_3398) + 1;
    uint _3408 = uint(int(uint(_3406) >> uint(2)));
    int _3410 = _3406 & 3;
    float _3412 = (*spvDescriptorSet0.vp_c9)._m0[int(_3408)][_3410];
    int _3414 = ~_3388;
    int _3416 = _3414 + 1;
    int _3418 = _3416 + 1;
    int _3420 = abs(_3120);
    int _3422 = abs(_3318);
    bool _3424 = !_2758;
    int _3426 = _3424 ? 0 : 1;
    int _3428 = _3238 + 8;
    uint _3430 = uint(int(uint(_3428) >> uint(2)));
    uint _3432 = uint(int(uint(int(_3430)) >> uint(2)));
    int _3434 = int(_3430) & 3;
    float _3436 = (*spvDescriptorSet0.vp_c9)._m0[int(_3432)][_3434];
    int _3438 = int(_3430) + 1;
    uint _3440 = uint(int(uint(_3438) >> uint(2)));
    int _3442 = _3438 & 3;
    float _3444 = (*spvDescriptorSet0.vp_c9)._m0[int(_3440)][_3442];
    int _3446 = ~_3420;
    int _3448 = _3446 + 1;
    int _3450 = _3448 + 1;
    int _3452 = abs(_3426);
    int _3454 = abs(_3366);
    int _3456 = _3394 * as_type<int>(_3262);
    int _3458 = ~_3360;
    int _3460 = _3458 + 1;
    int _3462 = _3460 + 1;
    int _3464 = abs(_3064);
    int _3466 = ~_3452;
    int _3468 = _3466 + 1;
    int _3470 = _3468 + 1;
    int _3472 = ~_3464;
    int _3474 = _3472 + 1;
    int _3476 = _3474 + 1;
    int _3478 = _3418 * as_type<int>(_3306);
    bool _3480 = !_2416;
    int _3482 = _3480 ? _3270 : (-1);
    int _3484 = _3470 * as_type<int>(_3254);
    int _3486 = _3484 + _3456;
    bool _3488 = _3354 == 0;
    int _3490 = _3462 * as_type<int>(_3298);
    int _3492 = _3490 + _3478;
    float _3494 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3496 = int(_3494);
    int _3498 = abs(_2890);
    int _3500 = _3450 * as_type<int>(_3346);
    int _3502 = abs(_3012);
    int _3504 = ~_3422;
    int _3506 = _3504 + 1;
    int _3508 = _3506 + 1;
    int _3510 = ~_3502;
    int _3512 = _3510 + 1;
    int _3514 = _3512 + 1;
    float _3516 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3518 = int(_3516);
    int _3520 = ~_3498;
    int _3522 = _3520 + 1;
    int _3524 = _3522 + 1;
    int _3526 = _3508 * as_type<int>(_3338);
    int _3528 = _3526 + _3500;
    int _3530 = _3514 * as_type<int>(_3376);
    int _3532 = _3530 + _3492;
    bool _3534 = !_3386;
    int _3536 = _3534 ? 0 : (-1);
    float _3538 = float(uint(_3496));
    int _3540 = _3476 * as_type<int>(_3404);
    int _3542 = _3540 + _3528;
    int _3544 = abs(_3350);
    int _3546 = abs(_3536);
    int _3548 = ~_3544;
    int _3550 = _3548 + 1;
    int _3552 = _3550 + 1;
    int _3554 = ~_3454;
    int _3556 = _3554 + 1;
    int _3558 = _3556 + 1;
    int _3560 = _3524 * as_type<int>(_3436);
    int _3562 = _3560 + _3486;
    float _3564 = float(uint(_3354));
    int _3566 = abs(_2912);
    int _3568 = _3552 * as_type<int>(_3444);
    int _3570 = _3568 + _3562;
    float _3572 = 1.0 / _3564;
    int _3574 = _3558 * as_type<int>(_3384);
    int _3576 = _3574 + _3532;
    int _3578 = ~_3566;
    int _3580 = _3578 + 1;
    int _3582 = _3580 + 1;
    int _3584 = abs(_3354);
    float _3586 = float(uint(_3518));
    int _3588 = _3570 * _3582;
    float _3590 = 1.0 / _3538;
    int _3592 = ~_3546;
    int _3594 = _3592 + 1;
    int _3596 = _3594 + 1;
    bool _3598 = !_3132;
    int _3600 = _3598 ? 0 : 1;
    int _3602 = abs(_3496);
    int _3604 = _3596 * as_type<int>(_3412);
    int _3606 = _3604 + _3542;
    bool _3608 = !_3138;
    int _3610 = _3608 ? 0 : 1;
    float _3612 = 1.0 / _3586;
    int _3614 = abs(_3600);
    int _3616 = abs(_3610);
    bool _3618 = !_2262;
    int _3620 = _3618 ? _3322 : (-1);
    int _3622 = abs(_3518);
    int _3624 = ~_3614;
    int _3626 = _3624 + 1;
    int _3628 = _3626 + 1;
    int _3630 = _3620 * _3566;
    int _3632 = _3630 + _3588;
    int _3634 = ~_3616;
    int _3636 = _3634 + 1;
    int _3638 = _3636 + 1;
    float _3640 = float(uint(_3584));
    int _3642 = _3628 * _3576;
    int _3644 = _3638 * _3606;
    bool _3646 = !_2292;
    int _3648 = _3646 ? _3328 : (-1);
    float _3650 = fma(_1256, _1140, _3212);
    int _3652 = as_type<int>(_3572) + (-2);
    float _3654 = 1.0 / _3640;
    float _3656 = float(uint(_3632));
    int _3658 = _3648 * _3614;
    int _3660 = _3658 + _3642;
    float _3662 = float(uint(_3602));
    int _3664 = _3482 * _3616;
    int _3666 = _3664 + _3644;
    float _3668 = float(uint(_3622));
    float _3670 = as_type<float>(_3652) * _3656;
    int _3672 = as_type<int>(_3590) + (-2);
    float _3674 = 1.0 / _3662;
    float _3676 = float(uint(_3660));
    float _3678 = fma(_1234, _1140, _3218);
    int _3680 = as_type<int>(_3612) + (-2);
    float _3682 = float(uint(_3666));
    int _3684 = abs(_3632);
    float _3686 = 1.0 / _3668;
    float _3688 = fma(_1234, _1124, _3228);
    float _3690 = as_type<float>(_3680) * _3682;
    int _3692 = abs(_3660);
    int _3694 = ~_3518;
    int _3696 = _3694 + 1;
    int _3698 = ~_3496;
    int _3700 = _3698 + 1;
    float _3702 = trunc(_3670);
    float _3704 = precise::max(_3702, 0.0);
    uint _3706 = uint(_3704);
    float _3708 = fma(_1234, _1130, _3234);
    float _3710 = as_type<float>(_3672) * _3676;
    float _3712 = fma(_1268, _1124, _3240);
    float _3714 = fma(_1268, _1130, _1835);
    int _3716 = ~_3354;
    int _3718 = _3716 + 1;
    float _3720 = float(uint(_3684));
    float _3722 = trunc(_3690);
    float _3724 = precise::max(_3722, 0.0);
    uint _3726 = uint(_3724);
    int _3728 = as_type<int>(_3654) + (-2);
    int _3730 = as_type<int>(_3674) + (-2);
    float _3732 = as_type<float>(_3728) * _3720;
    int _3734 = abs(_3666);
    float _3736 = trunc(_3710);
    float _3738 = precise::max(_3736, 0.0);
    uint _3740 = uint(_3738);
    int _3742 = as_type<int>(_3686) + (-2);
    int _3744 = _3718 * int(_3706);
    int _3746 = _3744 + _3632;
    float _3748 = float(uint(_3734));
    float _3750 = float(uint(_3692));
    bool _3752 = _2982 <= 8000.0;
    bool _3754 = isnan(_2982);
    bool _3756 = _3752 || _3754;
    bool _3758 = isnan(8000.0);
    bool _3760 = _3756 || _3758;
    float _3762 = float(_3760);
    float _3764 = as_type<float>(_3742) * _3748;
    float _3766 = float(uint(_3746));
    float _3768 = trunc(_3732);
    float _3770 = precise::max(_3768, 0.0);
    uint _3772 = uint(_3770);
    float _3774 = as_type<float>(_3730) * _3750;
    int _3776 = _3696 * int(_3726);
    int _3778 = _3776 + _3666;
    int _3780 = ~_3584;
    int _3782 = _3780 + 1;
    float _3784 = as_type<float>(_3652) * _3766;
    int _3786 = ~_3602;
    int _3788 = _3786 + 1;
    int _3790 = _3700 * int(_3740);
    int _3792 = _3790 + _3660;
    float _3794 = float(uint(_3778));
    float _3796 = trunc(_3774);
    float _3798 = precise::max(_3796, 0.0);
    uint _3800 = uint(_3798);
    int _3802 = ~_3622;
    int _3804 = _3802 + 1;
    float _3806 = _3762 * _3314;
    float _3808 = float(uint(_3792));
    float _3810 = as_type<float>(_3680) * _3794;
    float _3812 = _3678 * _3020;
    float _3814 = _3688 * _3092;
    float _3816 = trunc(_3764);
    float _3818 = precise::max(_3816, 0.0);
    uint _3820 = uint(_3818);
    float _3822 = as_type<float>(_3672) * _3808;
    float _3824 = _3688 * _3020;
    float _3826 = _3164 * _3688;
    float _3828 = _3164 * _3678;
    float _3830 = _3708 * _3092;
    float _3832 = trunc(_3784);
    float _3834 = precise::max(_3832, 0.0);
    uint _3836 = uint(_3834);
    float _3838 = _3708 * _3020;
    int _3840 = _3782 * int(_3772);
    int _3842 = _3840 + _3684;
    float _3844 = float(uint(_3842));
    int _3846 = _3788 * int(_3800);
    int _3848 = _3846 + _3692;
    float _3850 = _3678 * _3092;
    float _3852 = _3164 * _3708;
    float _3854 = as_type<float>(_3728) * _3844;
    float _3856 = float(uint(_3848));
    float _3858 = fma(_3650, _3086, _3850);
    float _3860 = fma(_3286, _3086, _3814);
    int _3862 = _3804 * int(_3820);
    int _3864 = _3862 + _3734;
    float _3866 = trunc(_3822);
    float _3868 = precise::max(_3866, 0.0);
    uint _3870 = uint(_3868);
    float _3872 = as_type<float>(_3730) * _3856;
    float _3874 = fma(_3286, _3018, _3824);
    float _3876 = fma(_3174, _3286, _3826);
    float _3878 = float(uint(_3864));
    float _3880 = fma(_3650, _3018, _3812);
    float _3882 = fma(_3358, _3018, _3838);
    float _3884 = fma(_3712, _3022, _3874);
    float _3886 = trunc(_3810);
    float _3888 = precise::max(_3886, 0.0);
    uint _3890 = uint(_3888);
    float _3892 = as_type<float>(_3742) * _3878;
    float _3894 = fma(_3362, _3022, _3880);
    float _3896 = fma(_3714, _3022, _3882);
    float _3898 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _3900 = ~_3496;
    int _3902 = _3900 + 1;
    float _3904 = fma(_3358, _3086, _3830);
    int _3906 = int(_3706) + int(_3836);
    float _3908 = trunc(_3854);
    float _3910 = precise::max(_3908, 0.0);
    uint _3912 = uint(_3910);
    out.m_79.x = _3884;
    out.m_79.y = _3894;
    out.m_79.z = _3896;
    int _3914 = int(_3740) + int(_3870);
    float _3916 = fma(_1648, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3898);
    float _3918 = fma(_3174, _3650, _3828);
    float _3920 = fma(_3174, _3358, _3852);
    float _3922 = _1789 * _2710;
    float _3924 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3916);
    float _3926 = trunc(_3872);
    float _3928 = precise::max(_3926, 0.0);
    uint _3930 = uint(_3928);
    int _3932 = ~_3354;
    int _3934 = _3932 + 1;
    float _3936 = fma(_3362, _3096, _3858);
    int _3938 = int(_3726) + int(_3890);
    int _3940 = _3934 * _3906;
    int _3942 = _3940 + _3632;
    int _3944 = ~_3584;
    int _3946 = _3944 + 1;
    float _3948 = trunc(_3892);
    float _3950 = precise::max(_3948, 0.0);
    uint _3952 = uint(_3950);
    int _3954 = ~_3518;
    int _3956 = _3954 + 1;
    int _3958 = _3902 * _3914;
    int _3960 = _3958 + _3660;
    int _3962 = int(_3772) + int(_3912);
    int _3964 = ~_3602;
    int _3966 = _3964 + 1;
    int _3968 = _3946 * _3962;
    int _3970 = _3968 + _3684;
    int _3972 = int(_3800) + int(_3930);
    int _3974 = _3956 * _3938;
    int _3976 = _3974 + _3666;
    bool _3978 = uint(_3942) >= uint(_3354);
    float _3980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3982 = uint(_3960) >= uint(_3496);
    int _3984 = _3966 * _3972;
    int _3986 = _3984 + _3692;
    bool _3988 = uint(_3976) >= uint(_3518);
    bool _3990 = !_3978;
    int _3992 = _3990 ? 0 : (-1);
    int _3994 = int(_3820) + int(_3952);
    int _3996 = ~_3622;
    int _3998 = _3996 + 1;
    bool _4000 = uint(_3986) >= uint(_3602);
    bool _4002 = !_3988;
    int _4004 = _4002 ? 0 : (-1);
    int _4006 = _3998 * _3994;
    int _4008 = _4006 + _3734;
    int _4010 = ~_3906;
    int _4012 = _4010 + _3992;
    int _4014 = _4012 + 1;
    float _4016 = _3980 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _4018 = ~_3938;
    int _4020 = _4018 + _4004;
    int _4022 = _4020 + 1;
    float _4024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _4026 = uint(_4008) >= uint(_3622);
    int _4028 = _3354 * _4014;
    int _4030 = _4028 + _3632;
    bool _4032 = uint(_3970) >= uint(_3584);
    int _4034 = _3518 * _4022;
    int _4036 = _4034 + _3666;
    bool _4038 = !_3982;
    int _4040 = _4038 ? 0 : (-1);
    float _4042 = fma(_4016, _1962, -0.5);
    bool _4044 = !_3488;
    int _4046 = _4044 ? _4030 : (-1);
    float _4048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4050 = ~_3914;
    int _4052 = _4050 + _4040;
    int _4054 = _4052 + 1;
    int _4056 = _3632 ^ _3354;
    float _4058 = float(_4046);
    int _4060 = _3496 * _4054;
    int _4062 = _4060 + _3660;
    bool _4064 = !_4000;
    int _4066 = _4064 ? 0 : (-1);
    float _4068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4070 = _3518 == 0;
    float _4072 = fma(_4016, _4058, _628);
    bool _4074 = !_4032;
    int _4076 = _4074 ? 0 : (-1);
    int _4078 = _3666 ^ _3518;
    float _4080 = fma(_1014, _4042, _4072);
    uint _4082 = uint(int(uint(_4056) >> uint(31)));
    float _4084 = _4048 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _4086 = _3354 == 0;
    bool _4088 = _3496 == 0;
    float _4090 = fma(_4084, _2638, -0.5);
    bool _4092 = !_4070;
    int _4094 = _4092 ? _4036 : (-1);
    int _4096 = _3660 ^ _3496;
    int _4098 = ~_4076;
    int _4100 = _3962 + _4098;
    int _4102 = _4100 + 1;
    bool _4104 = !_4026;
    int _4106 = _4104 ? 0 : (-1);
    uint _4108 = uint(int(uint(_4078) >> uint(31)));
    int _4110 = ~int(_4082);
    int _4112 = _4110 + 1;
    bool _4114 = _3518 == 0;
    int _4116 = ~_4066;
    int _4118 = _3972 + _4116;
    int _4120 = _4118 + 1;
    float _4122 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _4124 = !_4088;
    int _4126 = _4124 ? _4062 : (-1);
    float _4128 = float(_4094);
    uint _4130 = uint(int(uint(_4096) >> uint(31)));
    bool _4132 = _3496 == 0;
    float _4134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _4136 = ~_4106;
    int _4138 = _3994 + _4136;
    int _4140 = _4138 + 1;
    float _4142 = _4068 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4144 = ~int(_4108);
    int _4146 = _4144 + 1;
    float _4148 = fma(_4084, _4128, _838);
    int _4150 = _4102 ^ _4112;
    float _4152 = fma(_4142, _2070, -0.5);
    float _4154 = float(_4126);
    float _4156 = _4024 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4158 = ~int(_4130);
    int _4160 = _4158 + 1;
    float _4162 = fma(_1008, _4090, _4148);
    int _4164 = _4140 ^ _4146;
    float _4166 = fma(_4142, _4154, _902);
    int _4168 = ~_4112;
    int _4170 = _4168 + _4150;
    int _4172 = _4170 + 1;
    float _4174 = _4122 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _4176 = _4120 ^ _4160;
    float _4178 = _4134 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _4180 = ~_4146;
    int _4182 = _4180 + _4164;
    int _4184 = _4182 + 1;
    float _4186 = fma(_2032, _4156, -0.5);
    bool _4188 = !_4086;
    int _4190 = _4188 ? _4172 : (-1);
    float _4192 = fma(_2010, _4174, -0.5);
    int _4194 = ~_4160;
    int _4196 = _4194 + _4176;
    int _4198 = _4196 + 1;
    float _4200 = fma(_4178, _2088, -0.5);
    bool _4202 = !_4114;
    int _4204 = _4202 ? _4184 : (-1);
    float _4206 = fma(_854, _4152, _4166);
    float _4208 = float(_4190);
    float _4210 = _4162 + 0.5;
    bool _4212 = !_4132;
    int _4214 = _4212 ? _4198 : (-1);
    float _4216 = float(_4204);
    float _4218 = -_624;
    float _4220 = fma(_4156, _4208, _4218);
    float _4222 = fma(_3176, _3712, _3876);
    float _4224 = float(_4214);
    float _4226 = in.m_81.x;
    float _4228 = -_1086;
    float _4230 = fma(_4178, _4216, _4228);
    float _4232 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3924);
    float _4234 = fma(_992, _4186, _4220);
    float _4236 = -_1044;
    float _4238 = fma(_4174, _4224, _4236);
    float _4240 = fma(_3176, _3362, _3918);
    float _4242 = fma(_3176, _3714, _3920);
    float _4244 = _4232 + _1682;
    float _4246 = fma(_938, _4192, _4238);
    float _4248 = fma(_1066, _4200, _4230);
    float _4250 = _4244 * 0.5;
    float _4252 = _3806 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.x = _4222;
    out.m_83.y = _4240;
    out.m_83.z = _4242;
    float _4254 = _4248 + 0.5;
    float _4256 = _2556 * _4252;
    float _4258 = precise::clamp(_4256, 0.0, 1.0);
    out.gl_Position.x = _1730;
    out.gl_Position.y = _1740;
    out.gl_Position.z = _4232;
    out.gl_Position.w = _1682;
    float _4260 = _4080 + 0.5;
    float _4262 = _4206 + 0.5;
    float _4264 = _4234 + 0.5;
    float _4266 = _4246 + 0.5;
    float _4268 = fma(_3712, _3096, _3860);
    float _4270 = fma(_3714, _3096, _3904);
    float _4272 = _1779 * _2732;
    out.m_85.z = _4250;
    out.m_85.w = _1682;
    bool _4274 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4276 = isnan(_1456);
    bool _4278 = _4274 || _4276;
    bool _4280 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4282 = _4278 || _4280;
    float _4284 = -_4258;
    float _4286 = fma(_4284, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4288 = _1779 * _2710;
    out.m_87.x = _4260;
    out.m_87.y = _4264;
    out.m_87.z = _4262;
    out.m_87.w = _4266;
    float _4290 = _4286 * _4226;
    float _4292 = fma(_1785, _4288, _1773);
    float _4294 = fma(_1787, _4288, _1775);
    float _4296 = fma(_1779, _3922, _1777);
    float _4298 = _4290 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.x = _4210;
    out.m_89.y = _4254;
    float _4300 = _4240;
    float _4302 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _4304 = _4232;
    float _4306 = _4288;
    if (!_4282)
    {
        _4300 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4308 = _4300;
    float _4310 = _4308;
    float _4312 = _4308;
    if (!_4282)
    {
        _4302 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4314 = _4302;
    out.m_91.x = _4298;
    float _4316 = _4314;
    float _4318 = _4314;
    if (!_4282)
    {
        _1845 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4320 = _1845;
    float _4322 = _4320;
    float _4324 = _4320;
    if (!_4282)
    {
        _4304 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4326 = _4304;
    out.m_93.x = _4292;
    out.m_93.y = _4294;
    out.m_93.z = _4296;
    out.m_93.w = _4272;
    float _4328 = _4326;
    float _4330 = _4326;
    if (!_4282)
    {
        _1847 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4332 = _1847;
    float _4334 = _4332;
    float _4336 = _4332;
    if (!_4282)
    {
        _4306 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4338 = _4306;
    out.m_95.x = _4268;
    out.m_95.y = _3936;
    out.m_95.z = _4270;
    bool _4340 = !_4282;
    float _4342 = _4338;
    float _4344 = _4338;
    if (!_4340)
    {
        bool _4346 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4348 = isnan(_1456);
        bool _4350 = _4346 || _4348;
        bool _4352 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4354 = _4350 || _4352;
        if (!_4354)
        {
            float _4356 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4358 = _1456 + _4356;
            float _4360 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4362 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4360;
            float _4364 = 1.0 / _4362;
            float _4366 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4368 = _4366 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4370 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4372 = _4370 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4374 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4376 = _4374 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4378 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4380 = _4378 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4382 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4384 = _4382 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4386 = _4358 * _4364;
            float _4388 = precise::clamp(_4386, 0.0, 1.0);
            float _4390 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4392 = _4390 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4394 = fma(_4388, _4368, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4396 = fma(_4388, _4392, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4398 = fma(_4388, _4372, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4400 = fma(_4388, _4376, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4402 = fma(_4388, _4380, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4404 = fma(_4388, _4384, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4318 = _4396;
            _4336 = _4402;
            _4312 = _4394;
            _4330 = _4400;
            _4324 = _4398;
            _4344 = _4404;
            _4406 = true;
        }
        else
        {
            bool _4408 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4410 = isnan(_1456);
            bool _4412 = _4408 || _4410;
            bool _4414 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4416 = _4412 || _4414;
            if (!_4416)
            {
                _4310 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4418 = _4310;
            _4312 = _4418;
            if (!_4416)
            {
                _4316 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4420 = _4316;
            _4318 = _4420;
            if (!_4416)
            {
                _4322 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4422 = _4322;
            _4324 = _4422;
            if (!_4416)
            {
                _4328 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4424 = _4328;
            _4330 = _4424;
            if (!_4416)
            {
                _4334 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4426 = _4334;
            _4336 = _4426;
            if (!_4416)
            {
                _4342 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4428 = _4342;
            bool _4430 = !_4416;
            _4344 = _4428;
            if (!_4430)
            {
                bool _4432 = _1456 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4434 = isnan(_1456);
                bool _4436 = _4432 || _4434;
                bool _4438 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4440 = _4436 || _4438;
                if (!_4440)
                {
                    float _4442 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4444 = _1456 + _4442;
                    float _4446 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4448 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4446;
                    float _4450 = 1.0 / _4448;
                    float _4452 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4454 = _4452 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4456 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4458 = _4456 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4460 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4462 = _4460 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4464 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4466 = _4464 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4468 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4470 = _4468 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4472 = _4444 * _4450;
                    float _4474 = precise::clamp(_4472, 0.0, 1.0);
                    float _4476 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4478 = _4476 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4480 = fma(_4474, _4454, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4482 = fma(_4474, _4478, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4484 = fma(_4474, _4458, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4486 = fma(_4474, _4462, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4488 = fma(_4474, _4466, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4490 = fma(_4474, _4470, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4318 = _4482;
                    _4336 = _4488;
                    _4312 = _4480;
                    _4330 = _4486;
                    _4324 = _4484;
                    _4344 = _4490;
                    _4406 = true;
                }
                else
                {
                    _4318 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4336 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4312 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4330 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4324 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4344 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4406 = false;
    float _4492 = _4318;
    float _4494 = _4336;
    float _4496 = _4312;
    float _4498 = _4330;
    float _4500 = _4324;
    float _4502 = _4344;
    float _4504 = fma(_3936, -0.5, 0.5);
    float _4506 = precise::clamp(_4504, 0.0, 1.0);
    float _4508 = -_4492;
    float _4510 = _4508 + _4494;
    float _4512 = -_4496;
    float _4514 = _4512 + _4498;
    float _4516 = -_4500;
    float _4518 = _4516 + _4502;
    bool _4520 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4522 = fma(_4506, _4510, _4492);
    float _4524 = fma(_4506, _4514, _4496);
    float _4526 = fma(_4506, _4518, _4500);
    float _4528 = _4522 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _4530 = fma(_4524, 0.298911988735198974609375, _4528);
    float _4532 = fma(_4526, 0.114477999508380889892578125, _4530);
    out.m_97.x = 0.0;
    float _4534 = -_4532;
    float _4536 = _4524 + _4534;
    float _4538 = -_4532;
    float _4540 = _4522 + _4538;
    float _4542 = -_4532;
    float _4544 = _4526 + _4542;
    float _4546 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4548 = fma(_4536, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4532);
    float _4550 = fma(_4540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4532);
    float _4552 = fma(_4544, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4532);
    out.m_91.w = _4546;
    out.m_99.x = _4548;
    out.m_99.y = _4550;
    out.m_99.z = _4552;
    if (!_4520)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4554 = -_1430;
    float _4556 = _4554 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4558 = -_1432;
    float _4560 = _4558 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4562 = -_1434;
    float _4564 = _4562 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4566 = _4556 * _4556;
    float _4568 = fma(_4560, _4560, _4566);
    float _4570 = fma(_4564, _4564, _4568);
    float _4572 = sqrt(_4570);
    float _4574 = rsqrt(_4570);
    float _4576 = -_4572;
    float _4578 = _4576 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4580 = _4578 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4582 = precise::clamp(_4580, 0.0, 1.0);
    float _4584 = _4560 * _4574;
    float _4586 = _4556 * _4574;
    float _4588 = abs(_4582);
    float _4590 = log2(_4588);
    float _4592 = _4564 * _4574;
    float _4594 = _4584 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4596 = _3936 * _4586;
    float _4598 = -_4586;
    float _4600 = -_4594;
    float _4602 = fma(_4598, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4600);
    float _4604 = fma(_4268, _4584, _4596);
    float _4606 = -_4592;
    float _4608 = fma(_4606, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4602);
    float _4610 = fma(_4270, _4592, _4604);
    float _4612 = precise::clamp(_4610, 0.0, 1.0);
    float _4614 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4616 = _4608 + _4614;
    float _4618 = _4590 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4620 = _4616 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4622 = precise::clamp(_4620, 0.0, 1.0);
    float _4624 = exp2(_4618);
    float _4626 = _4624 * _4622;
    float _4628 = _4612 * _4626;
    float _4630 = _4628 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4632 = _4628 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4634 = _4628 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _4630;
    out.m_97.y = _4632;
    out.m_97.z = _4634;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

