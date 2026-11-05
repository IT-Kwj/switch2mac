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
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_63 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_101 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_95 [[user(locn6)]];
    float4 m_85 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_99 [[user(locn11)]];
    float4 m_89 [[user(locn12)]];
    float4 m_93 [[user(locn13)]];
    float4 m_97 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_91 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_73 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_77 [[attribute(9)]];
    float4 m_69 [[attribute(10)]];
    float4 m_71 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2397 = false;
    bool _1602 = false;
    bool _508 = false;
    bool _392 = false;
    bool _224 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_50.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_53.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2695 = as_type<float>(_136);
        out.gl_Position.z = _2695;
    }
    if (!_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_55.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = _152;
    if (_148)
    {
        float _156 = float(_120);
        _130 = _156;
    }
    float _158 = _130;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    float _166 = _158;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_53.x = 0.0;
    }
    int _170 = 0;
    if (_164)
    {
        float _172 = _168 * 5.0;
        _170 = as_type<int>(_172);
    }
    int _174 = _170;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2765 = as_type<float>(_174);
        out.gl_Position.z = _2765;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = _178 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _186 = _178 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _188 = _178 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _190 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].x, _184);
    float _192 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].x, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].x, _188);
    float _196 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].z, _190);
    float _198 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].z, _192);
    float _200 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].z, _194);
    bool _202 = !_182;
    float _204 = _200;
    float _222;
    if (!_202)
    {
        float _206 = in.m_59.x;
        float _208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _210 = _206 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _212 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _214 = _212 * _208;
        float _216 = floor(_214);
        float _218 = -_216;
        float _220 = _214 + _218;
        _222 = _220;
        _224 = true;
    }
    else
    {
        float _226 = float(_120);
        float _228 = 1.0 / _226;
        float _230 = _152 * _228;
        _222 = _230;
    }
    _224 = false;
    float _232 = _222;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = _232 + _234;
    bool _238 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _240 = isnan(_232);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _232 + _250;
    bool _254 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _256 = isnan(_232);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _270 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _274 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _276 = isnan(_232);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = -_248;
    float _288 = _286 + 1.0;
    float _290 = 1.0 / _272;
    float _292 = _284 * _288;
    float _294 = -_284;
    float _296 = _294 + 1.0;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _298;
    bool _302 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _304 = 1.0 / _268;
    float _306 = _264 * _296;
    float _308 = -_264;
    float _310 = _308 + 1.0;
    float _312 = _252 * _290;
    float _314 = _236 * _304;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _320;
    float _324 = fma(_300, _314, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _326 = fma(_318, _314, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _328 = fma(_322, _314, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _330 = _324 * _306;
    float _332 = _326 * _306;
    float _334 = _328 * _306;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _348 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[143].x, _330);
    float _350 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[143].y, _332);
    float _352 = fma(_338, _312, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _354 = fma(_342, _312, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _356 = fma(_346, _312, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _358 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[143].z, _334);
    float _360 = fma(_352, _292, _348);
    float _362 = fma(_354, _292, _350);
    float _364 = fma(_356, _292, _358);
    float _366 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[145].x, _360);
    float _368 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[145].y, _362);
    float _370 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[145].z, _364);
    bool _372 = !_302;
    float _390;
    if (!_372)
    {
        float _374 = in.m_59.x;
        float _376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _378 = _374 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _380 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _382 = _380 * _376;
        float _384 = floor(_382);
        float _386 = -_384;
        float _388 = _382 + _386;
        _390 = _388;
        _392 = true;
    }
    else
    {
        float _394 = float(_120);
        float _396 = 1.0 / _394;
        float _398 = _152 * _396;
        _390 = _398;
    }
    _392 = false;
    float _400 = _390;
    bool _402 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _404 = isnan(_400);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _418 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _420 = isnan(_400);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _436 = _400 + _434;
    float _438 = -_412;
    float _440 = _438 + 1.0;
    bool _442 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _444 = 1.0 / _416;
    float _446 = _428 * _440;
    float _448 = -_428;
    float _450 = _448 + 1.0;
    float _452 = _432 * _444;
    float _454 = fma(_452, _436, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _456 = _454 * _446;
    float _458 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[115].x, _456);
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _466 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[116].x, _458);
    float _468 = _460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _470 = _462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _472 = _464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _474 = _466 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _476 = in.m_61.x;
    float _478 = in.m_61.y;
    float _480 = in.m_61.z;
    out.m_63.x = _468;
    out.m_63.y = _470;
    out.m_63.z = _472;
    out.m_63.w = _474;
    float _482 = _370 * _480;
    float _484 = _368 * _478;
    float _486 = _366 * _476;
    bool _488 = !_442;
    float _506;
    if (!_488)
    {
        float _490 = in.m_59.x;
        float _492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _494 = _490 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _496 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[11].w, _152);
        float _498 = _496 * _492;
        float _500 = floor(_498);
        float _502 = -_500;
        float _504 = _498 + _502;
        _506 = _504;
        _508 = true;
    }
    else
    {
        float _510 = float(_120);
        float _512 = 1.0 / _510;
        float _514 = _152 * _512;
        _506 = _514;
    }
    _508 = false;
    float _516 = _506;
    float _518 = in.m_59.z;
    float _520 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _522 = log2(_520);
    float _524 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _526 = in.m_59.x;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _534 = _532 != 0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _538 = _536 != 0;
    float _540 = in.m_59.y;
    bool _542 = !_534;
    int _544 = _542 ? 0 : 1;
    float _546 = _518 * 2.0;
    float _548 = _526 * 2.0;
    float _550 = floor(_546);
    float _552 = _540 * 2.0;
    float _554 = _540 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _556 = floor(_548);
    float _558 = floor(_552);
    bool _560 = _550 > 0.0;
    float _562 = _526 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _564 = _550 >= 0.0;
    bool _566 = isnan(_550);
    bool _568 = _564 || _566;
    bool _570 = isnan(0.0);
    bool _572 = _568 || _570;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _578 = _526 + _540;
    int _580 = _572 ? 0 : 1;
    float _582 = -_574;
    float _584 = fma(_562, 2.0, _582);
    float _586 = _522 * _152;
    float _588 = _578 + (-1.0);
    int _590 = ~_580;
    int _592 = _590 + 1;
    int _594 = _592 + 1;
    float _596 = fma(_554, -2.0, _576);
    bool _598 = _556 >= 0.0;
    bool _600 = isnan(_556);
    bool _602 = _598 || _600;
    bool _604 = isnan(0.0);
    bool _606 = _602 || _604;
    float _608 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _610 = _594;
    int _612 = as_type<int>(_518);
    if (!_560)
    {
        int _614 = ~_580;
        int _616 = _614 + 1;
        _610 = _616;
    }
    int _618 = _610;
    bool _620 = _558 > 0.0;
    float _622 = exp2(_586);
    bool _624 = _558 >= 0.0;
    bool _626 = isnan(_558);
    bool _628 = _624 || _626;
    bool _630 = isnan(0.0);
    bool _632 = _628 || _630;
    int _634 = _606 ? 0 : 1;
    bool _636 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _638 = isnan(1.0);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _644 = _640 || _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _648 = 1.0 + _646;
    float _650 = in.m_65.x;
    float _652 = in.m_65.y;
    float _654 = in.m_65.z;
    bool _656 = _556 > 0.0;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _660 = 1.0 / _648;
    bool _662 = !_530;
    int _664 = _662 ? 0 : 1;
    float _666 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[78].w, _658);
    float _668 = -_622;
    float _670 = _668 + 1.0;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _674 = abs(_664);
    float _676 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _666);
    bool _678 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _680 = isnan(0.0);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _686 = _682 || _684;
    float _688 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[78].z, _672);
    float _690 = float(_674);
    float _692 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _596);
    float _694 = float(_618);
    float _696 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _688);
    float _698 = _686 ? _670 : 0.0;
    float _700 = -_152;
    float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[76].x, _584);
    int _704 = ~_634;
    int _706 = _704 + 1;
    int _708 = _706 + 1;
    float _710 = _690 * _694;
    int _712 = _708;
    if (!_656)
    {
        int _714 = ~_634;
        int _716 = _714 + 1;
        _712 = _716;
    }
    int _718 = _712;
    if (_644)
    {
        float _720 = _698 * _660;
        _154 = _720;
    }
    float _722 = _154;
    int _724 = abs(_544);
    float _726 = _710 * (-2.0);
    float _728 = float(_718);
    float _730 = _526 + (-0.5);
    int _732 = _632 ? 0 : 1;
    float _734 = fma(_726, _650, _650);
    bool _736 = !_538;
    int _738 = _736 ? 0 : 1;
    float _740 = fma(_608, _726, _608);
    float _742 = float(_724);
    float _744 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[196].x, _734);
    int _746 = ~_732;
    int _748 = _746 + 1;
    int _750 = _748 + 1;
    float _752 = _540 + _518;
    int _754 = _750;
    if (!_620)
    {
        int _756 = ~_732;
        int _758 = _756 + 1;
        _754 = _758;
    }
    int _760 = _754;
    float _762 = _742 * _728;
    int _764 = abs(_738);
    float _766 = fma(_740, _722, _744);
    float _768 = float(_760);
    float _770 = _752 + (-1.0);
    float _772 = float(_764);
    float _774 = _762 * (-2.0);
    float _776 = _766 * 0.15915493667125701904296875;
    float _778 = _772 * _768;
    float _780 = _540 + (-0.5);
    float _782 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _784 = fma(_774, _652, _652);
    float _786 = _526 + _518;
    float _788 = _778 * (-2.0);
    float _790 = fma(_782, _774, _782);
    float _792 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[196].y, _784);
    float _794 = _786 + (-1.0);
    float _796 = fma(_788, _654, _654);
    float _798 = fma(_790, _722, _792);
    float _800 = _776 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = in.m_67.x;
    float _806 = in.m_67.y;
    float _808 = in.m_67.z;
    float _810 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _812 = _518 + (-0.5);
    float _814 = _798 * 0.15915493667125701904296875;
    float _816 = fma(_810, _788, _810);
    float _818 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[196].z, _796);
    float _820 = _776 * 6.283185482025146484375;
    float _822 = cos(_820);
    float _824 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _826 = fma(_816, _722, _818);
    float _828 = _826 * 0.15915493667125701904296875;
    float _830 = _814 * 6.283185482025146484375;
    float _832 = sin(_830);
    float _834 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _836 = _814 * 6.283185482025146484375;
    float _838 = cos(_836);
    float _840 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _804);
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _806);
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _808);
    float _846 = _840 * _824;
    float _848 = _842 * _524;
    float _850 = _844 * _834;
    float _852 = _828 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = in.m_50.x;
    float _858 = in.m_50.y;
    float _860 = in.m_50.z;
    float _862 = _802 * _832;
    float _864 = _822 * _832;
    float _866 = _828 * 6.283185482025146484375;
    float _868 = sin(_866);
    float _870 = _822 * _838;
    float _872 = _802 * _838;
    float _874 = _822 * _854;
    float _876 = _802 * _854;
    float _878 = _838 * _854;
    float _880 = _832 * _854;
    float _882 = _874 * _848;
    float _884 = fma(_868, _870, _862);
    float _886 = -_864;
    float _888 = fma(_868, _872, _886);
    float _890 = fma(_868, _862, _870);
    float _892 = -_872;
    float _894 = fma(_868, _864, _892);
    float _896 = -_848;
    float _898 = _868 * _896;
    float _900 = fma(_884, _846, _882);
    float _902 = _876 * _848;
    float _904 = _858 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _906 = fma(_878, _846, _898);
    float _908 = fma(_894, _850, _900);
    float _910 = fma(_888, _846, _902);
    float _912 = _858 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _914 = fma(_880, _850, _906);
    float _916 = _908 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _918 = _908 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _920 = fma(_890, _850, _910);
    float _922 = fma(_856, (*spvDescriptorSet0.vp_c10)._m0[4].x, _912);
    float _924 = fma(_856, (*spvDescriptorSet0.vp_c10)._m0[6].x, _904);
    float _926 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[24].x, _916);
    float _928 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[26].x, _918);
    float _930 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[4].z, _922);
    float _932 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[6].z, _924);
    float _934 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[24].z, _926);
    float _936 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[26].z, _928);
    float _938 = _930 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _940 = _932 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _942 = _934 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _944 = _936 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _946 = _858 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _948 = _938 + _942;
    float _950 = _940 + _944;
    float _952 = fma(_856, (*spvDescriptorSet0.vp_c10)._m0[5].x, _946);
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _956 = _948 + _954;
    float _958 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _960 = _950 + _958;
    float _962 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[5].z, _952);
    float _964 = _956 * _956;
    float _966 = _960 * _960;
    float _968 = _964 + _966;
    float _970 = sqrt(_968);
    bool _972 = _970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _974 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _976 = _970 + _974;
    float _978 = 0.0;
    float _980 = _968;
    float _982 = _948;
    float _984 = _950;
    float _986 = _890;
    float _988 = _964;
    float _990 = _966;
    if (_972)
    {
        float _992 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _978 = _992;
    }
    float _994 = _978;
    if (_972)
    {
        float _996 = rsqrt(_968);
        _980 = _996;
    }
    float _998 = _980;
    float _1000 = _994;
    if (_972)
    {
        float _1002 = _976 * _994;
        _1000 = _1002;
    }
    float _1004 = _1000;
    float _1006 = _908 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1008 = _962 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1010 = _1004;
    if (_972)
    {
        float _1012 = _1004 * 0.15915493667125701904296875;
        _1010 = _1012;
    }
    float _1014 = _1010;
    float _1016 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1006);
    float _1018 = _856;
    if (_972)
    {
        float _1020 = _1014 * 6.283185482025146484375;
        float _1022 = sin(_1020);
        _1018 = _1022;
    }
    float _1024 = _1018;
    float _1026 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1016);
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1030 = fma(_940, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1032 = fma(_938, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1034 = _1008 + _1028;
    float _1036 = floor(_1030);
    float _1038 = _1028;
    float _1040 = _1034;
    if (_972)
    {
        float _1042 = _1034 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1038 = _1042;
    }
    float _1044 = _1038;
    float _1046 = _1024;
    if (_972)
    {
        float _1048 = fma(_1024, _1044, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1046 = _1048;
    }
    float _1050 = _1046;
    float _1052 = floor(_1032);
    float _1054 = _1050;
    if (_972)
    {
        float _1056 = _998 * _1050;
        _1054 = _1056;
    }
    float _1058 = _1054;
    if (_972)
    {
        float _1060 = fma(_956, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _982 = _1060;
    }
    float _1062 = _982;
    if (_972)
    {
        float _1064 = fma(_960, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _984 = _1064;
    }
    float _1066 = _984;
    float _1068 = -_1036;
    float _1070 = _1030 + _1068;
    float _1072 = fma(_1062, 6.2500002968590706586837768554688e-05, 0.5);
    float _1074 = fma(_1066, 6.2500002968590706586837768554688e-05, 0.5);
    float _1076 = -_1052;
    float _1078 = _1032 + _1076;
    float2 _4196 = float2(_1072, _1074);
    float3 _1082 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4196, float2(0.0), isnan(_4196)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4196, float2(0.0), isnan(_4196)), level(0.0)).xyz;
    float _1084 = _1082.x;
    float _1086 = _1082.y;
    float _1088 = _1082.z;
    float2 _4212 = float2(_1078, _1070);
    float _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4212, float2(0.0), isnan(_4212)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4212, float2(0.0), isnan(_4212)), level(0.0)).x;
    float _1092 = in.m_69.y;
    float _1094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1096 = in.m_59.w;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1100 = _1098 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1104 = _1102 != 0;
    float _1106 = in.m_69.x;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1108;
    bool _1112 = _540 > 0.5;
    float _1114 = 1.0 / _1100;
    float _1116 = in.m_71.w;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1120 = _1118 != 0;
    bool _1122 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1124 = isnan(_516);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1136 = _1134 != 0;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1140 = _1138 != 0;
    float _1142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1144 = -_1092;
    float _1146 = _1144 + 1.0;
    float _1148 = _1110 * _1114;
    bool _1150 = _1096 > 0.5;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1154 = _516 + _1152;
    bool _1156 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1158 = isnan(_516);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = -_1132;
    float _1170 = _1168 + 1.0;
    int _1172 = _1150 ? as_type<int>(_1146) : as_type<int>(_1092);
    float _1174 = fma(_1148, _1154, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1176 = _1150;
    float _1178 = _1092;
    bool _1180 = _1120;
    int _1182 = as_type<int>(_1146);
    float _1184 = _1094;
    if (_1104)
    {
        bool _1186 = _526 > 0.5;
        _1176 = _1186;
    }
    bool _1188 = _1176;
    float _1190 = _1166 * _1170;
    float _1192 = in.m_73.x;
    float _1194 = in.m_73.y;
    float _1196 = in.m_73.z;
    float _1198 = _1140 ? as_type<float>(_1172) : _1092;
    float _1200 = -_1166;
    float _1202 = _1200 + 1.0;
    bool _1204 = _806 != 0.0;
    bool _1206 = isnan(_806);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan(0.0);
    bool _1212 = _1208 || _1210;
    float _1214 = _1174 * _1190;
    float _1216 = _1190;
    if (_1120)
    {
        float _1218 = _1112 ? _1146 : _1092;
        _1178 = _1218;
    }
    float _1220 = _1178;
    float _1222 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1224 = _804 == 0.0;
    bool _1226 = !_1212;
    bool _1228 = _1224 && _1226;
    out.m_75.w = _1116;
    float _1230 = _1116;
    if (_1136)
    {
        bool _1232 = _518 > 0.5;
        _1180 = _1232;
    }
    bool _1234 = _1180;
    if (_1104)
    {
        float _1236 = -_1106;
        float _1238 = _1236 + 1.0;
        _612 = as_type<int>(_1238);
    }
    int _1240 = _612;
    bool _1242 = _808 == 0.0;
    bool _1244 = _1242 && _1228;
    float _1246 = fma(_1222, _1220, -0.5);
    float _1248 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1214);
    float _1250 = _1246;
    if (_1136)
    {
        float _1252 = -_1106;
        float _1254 = _1252 + 1.0;
        _1182 = as_type<int>(_1254);
    }
    int _1256 = _1182;
    float _1258 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1260 = as_type<float>(_1256);
    if (!_1104)
    {
        _1230 = _1106;
    }
    float _1262 = _1230;
    float _1264 = -_692;
    float _1266 = fma(_676, _1246, _1264);
    float _1268 = _1262;
    if (_1104)
    {
        float _1270 = _1188 ? as_type<float>(_1240) : _1106;
        _1268 = _1270;
    }
    float _1272 = _1268;
    float _1274 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1248);
    float _1276 = in.m_77.x;
    float _1278 = in.m_77.y;
    float _1280 = in.m_77.z;
    float _1282 = in.m_77.w;
    if (!_1136)
    {
        _1216 = _1106;
    }
    float _1284 = _1216;
    float _1286 = _1284;
    if (_1136)
    {
        float _1288 = _1234 ? as_type<float>(_1256) : _1106;
        _1286 = _1288;
    }
    float _1290 = _1286;
    float _1292 = fma(_1258, _1272, -0.5);
    float _1294 = _1192;
    if (_1244)
    {
        _1184 = _1192;
    }
    float _1296 = _1184;
    float _1298 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1300 = fma(_696, _1292, _702);
    float _1302 = _1296;
    if (_1244)
    {
        _1260 = _1296;
    }
    float _1304 = _1260;
    float _1306 = _874 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1308 = _1304;
    if (!_1244)
    {
        _1302 = _1192;
    }
    float _1310 = _1302;
    if (!_1244)
    {
        float _1312 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1310);
        _1308 = _1312;
    }
    float _1314 = _1308;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1244)
    {
        _1250 = _1196;
    }
    float _1320 = _1250;
    float _1322 = _1320;
    if (!_1244)
    {
        float _1324 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1196);
        _1322 = _1324;
    }
    float _1326 = _1322;
    if (_1244)
    {
        _1294 = _1194;
    }
    float _1328 = _1294;
    float _1330 = _1328;
    if (!_1244)
    {
        float _1332 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1194);
        _1330 = _1332;
    }
    float _1334 = _1330;
    float _1336 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1340 = _1278 * _1196;
    float _1342 = _1276 * _1194;
    float _1344 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1346 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1348 = _1280 * _1310;
    float _1350 = -_1340;
    float _1352 = fma(_1280, _1194, _1350);
    float _1354 = -_1342;
    float _1356 = fma(_1278, _1310, _1354);
    float _1358 = _874 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1360 = _874 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1362 = _884 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1364 = _1352 * _1282;
    out.m_79.x = _1344;
    out.m_79.y = _1346;
    out.m_79.z = _1336;
    out.m_79.w = _1298;
    float _1366 = _884 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1368 = -_1348;
    float _1370 = fma(_1276, _1196, _1368);
    float _1372 = _884 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1374 = _1370 * _1282;
    float _1376 = _1356 * _1282;
    float _1378 = -_868;
    float _1380 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1358);
    float _1382 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1362);
    float _1384 = _894 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1386 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1366);
    float _1388 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1372);
    float _1390 = _894 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1392 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1384);
    float _1394 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1382);
    float _1396 = -_868;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1306);
    float _1400 = _1382;
    float _1402 = _1376;
    if (_972)
    {
        float _1404 = _1014 * 6.283185482025146484375;
        float _1406 = cos(_1404);
        _1400 = _1406;
    }
    float _1408 = _1400;
    float _1410 = _894 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1412 = -_868;
    float _1414 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1360);
    float _1416 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1390);
    float _1418 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1380);
    float _1420 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1398);
    float _1422 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1410);
    float _1424 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1414);
    float _1426 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1386);
    float _1428 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1388);
    float _1430 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1416);
    float _1432 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1392);
    float _1434 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1422);
    float _1436 = _1422;
    if (_972)
    {
        float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1440 = _1062 + _1438;
        _1436 = _1440;
    }
    float _1442 = _1436;
    float _1444 = _1418 * _1278;
    float _1446 = _1420 * _1278;
    float _1448 = _1408;
    if (_972)
    {
        float _1450 = _1408 + (-1.0);
        _986 = _1450;
    }
    float _1452 = _986;
    float _1454 = _1452;
    if (_972)
    {
        float _1456 = _1442 * _1442;
        _988 = _1456;
    }
    float _1458 = _988;
    float _1460 = _1424 * _1278;
    float _1462 = _1418 * _1334;
    if (_972)
    {
        float _1464 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1454 = _1464;
    }
    float _1466 = _1454;
    float _1468 = _1374 * _1418;
    float _1470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1472 = _1420 * _1334;
    if (_972)
    {
        float _1474 = fma(_1034, _1408, _1466);
        _1040 = _1474;
    }
    float _1476 = _1040;
    if (_972)
    {
        float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1480 = _1066 + _1478;
        _1448 = _1480;
    }
    float _1482 = _1448;
    float _1484 = _1424 * _1334;
    float _1486 = _1374 * _1420;
    float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1490 = _1476 + _1488;
    if (_972)
    {
        float _1492 = _1482 * _1482;
        _990 = _1492;
    }
    float _1494 = _990;
    float _1496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1498 = _1374 * _1424;
    float _1500 = fma(_1490, _1490, _1458);
    float _1502 = fma(_1426, _1314, _1462);
    float _1504 = fma(_1394, _1314, _1472);
    float _1506 = fma(_1426, _1276, _1444);
    float _1508 = _1500 + _1494;
    float _1510 = fma(_1364, _1426, _1468);
    float _1512 = fma(_1394, _1276, _1446);
    float _1514 = fma(_1428, _1276, _1460);
    float _1516 = fma(_1364, _1394, _1486);
    float _1518 = fma(_1428, _1314, _1484);
    float _1520 = sqrt(_1508);
    float _1522 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1524 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1526 = fma(_1364, _1428, _1498);
    float _1528 = _1300 + 0.5;
    float _1530 = fma(_1432, _1326, _1502);
    float _1532 = fma(_1432, _1280, _1506);
    float _1534 = fma(_1430, _1280, _1512);
    float _1536 = fma(_1434, _1280, _1514);
    float _1538 = fma(_1376, _1430, _1516);
    float _1540 = _1522 * _1470;
    float _1542 = _1524 * _1496;
    float _1544 = fma(_1376, _1432, _1510);
    float _1546 = _1266 + 0.5;
    float _1548 = fma(_1376, _1434, _1526);
    float _1550 = fma(_1430, _1326, _1504);
    float _1552 = fma(_1434, _1326, _1518);
    out.m_81.x = _1532;
    out.m_81.y = _1534;
    out.m_81.z = _1536;
    bool _1554 = _1520 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1556 = isnan(_1520);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1562 = _1558 || _1560;
    out.m_83.x = _1528;
    out.m_83.y = _1546;
    out.m_83.z = _1542;
    out.m_83.w = _1540;
    out.m_85.x = _1544;
    out.m_85.y = _1538;
    out.m_85.z = _1548;
    out.m_87.x = _1530;
    out.m_87.y = _1550;
    out.m_87.z = _1552;
    float _1564 = _1528;
    float _1566 = _1532;
    if (!_1562)
    {
        _1402 = 1.0;
    }
    float _1568 = _1402;
    out.m_89.x = _1084;
    out.m_89.y = _1086;
    out.m_89.z = _1088;
    bool _1570 = !_1562;
    float _1572 = _1568;
    if (!_1570)
    {
        bool _1574 = _1520 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1576 = isnan(_1520);
        bool _1578 = _1574 || _1576;
        bool _1580 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1582 = _1578 || _1580;
        if (!_1582)
        {
            float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1586 = _1520 + _1584;
            float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1590 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1588;
            float _1592 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1594 = _1592 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1596 = 1.0 / _1590;
            float _1598 = _1586 * _1596;
            float _1600 = fma(_1598, _1594, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1572 = _1600;
            _1602 = true;
        }
        else
        {
            bool _1604 = _1520 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1606 = isnan(_1520);
            bool _1608 = _1604 || _1606;
            bool _1610 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1612 = _1608 || _1610;
            if (!_1612)
            {
                float _1614 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1616 = _1520 + _1614;
                float _1618 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1620 = _1618 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1622 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1624 = _1622 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1626 = 1.0 / _1620;
                float _1628 = _1616 * _1626;
                float _1630 = fma(_1628, _1624, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1572 = _1630;
                _1602 = true;
            }
            else
            {
                _1572 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1602 = false;
    float _1632 = _1572;
    float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1636 = _1476 + _1634;
    float _1638 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1640 = _1062 + _1638;
    float _1642 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1644 = _1066 + _1642;
    float _1646 = fma(_1636, _1632, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1648 = fma(_1640, _1632, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1650 = fma(_1644, _1632, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1652 = -_1008;
    float _1654 = _1652 + _1646;
    float _1656 = -_938;
    float _1658 = _1656 + _1648;
    float _1660 = -_940;
    float _1662 = _1660 + _1650;
    float _1664 = _1654 * _1654;
    float _1666 = fma(_1658, _1658, _1664);
    float _1668 = fma(_1662, _1662, _1666);
    float _1670 = sqrt(_1668);
    bool _1672 = _1670 > 0.0;
    float _1674 = _1632;
    float _1676 = _1650;
    float _1678 = _1658;
    float _1680 = _1654;
    if (!_1672)
    {
        _1674 = _1648;
    }
    float _1682 = _1674;
    float _1684 = _1682;
    if (!_1672)
    {
        _1564 = _1646;
    }
    float _1686 = _1564;
    bool _1688 = !_1672;
    float _1690 = _1686;
    float _1692 = _1686;
    if (!_1688)
    {
        float _1694 = _198 * _198;
        float _1696 = fma(_196, _196, _1694);
        float _1698 = fma(_200, _200, _1696);
        float _1700 = rsqrt(_1668);
        float _1702 = sqrt(_1698);
        float _1704 = _1658 * _1700;
        float _1706 = _1654 * _1700;
        float _1708 = _1662 * _1700;
        bool _1710 = _1702 > 0.0;
        float _1712 = _1702;
        _1566 = _1706;
        if (!_1710)
        {
            _1712 = _1648;
        }
        float _1714 = _1712;
        _1684 = _1714;
        if (!_1710)
        {
            _1690 = _1646;
        }
        float _1716 = _1690;
        bool _1718 = !_1710;
        _1692 = _1716;
        if (!_1718)
        {
            float _1720 = rsqrt(_1698);
            float _1722 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1724 = _198 * _1720;
            float _1726 = _196 * _1720;
            float _1728 = _200 * _1720;
            float _1730 = _1706 * _1724;
            float _1732 = fma(_1704, _1726, _1730);
            float _1734 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1736 = fma(_1708, _1728, _1732);
            float _1738 = _1736 * _1734;
            float _1740 = fma(_196, _1738, _1648);
            float _1742 = fma(_198, _1738, _1646);
            float _1744 = fma(_200, _1738, _1650);
            _1692 = _1742;
            _1684 = _1740;
            _1676 = _1744;
            _1678 = _1734;
        }
    }
    float _1746 = _1692;
    float _1748 = _1684;
    float _1750 = _1676;
    float _1752 = _1678;
    float _1754 = _1566;
    float _1756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1758 = _1746 + _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1762 = _1748 + _1760;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1766 = _1750 + _1764;
    float _1768 = _1758 * _1758;
    float _1770 = fma(_1762, _1762, _1768);
    float _1772 = fma(_1766, _1766, _1770);
    float _1774 = rsqrt(_1772);
    float _1776 = sqrt(_1772);
    float _1778 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1780 = _1762 * _1778;
    float _1782 = _1766 * _1778;
    float _1784 = _1780 * _1780;
    float _1786 = _1782 * _1782;
    float _1788 = _1784 + _1786;
    float _1790 = sqrt(_1788);
    bool _1792 = _1790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1796 = _1790 + _1794;
    float _1798 = _1752;
    float _1800 = _1754;
    float _1802 = _1796;
    float _1804 = _1758;
    float _1806 = _1780;
    if (_1792)
    {
        float _1808 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1798 = _1808;
    }
    float _1810 = _1798;
    if (_1792)
    {
        float _1812 = rsqrt(_1788);
        _1800 = _1812;
    }
    float _1814 = _1800;
    float _1816 = _1814;
    if (_1792)
    {
        float _1818 = _1796 * _1810;
        _1802 = _1818;
    }
    float _1820 = _1802;
    if (_1792)
    {
        float _1822 = _1820 * 0.15915493667125701904296875;
        _1680 = _1822;
    }
    float _1824 = _1680;
    float _1826 = _1766;
    if (_1792)
    {
        float _1828 = _1824 * 6.283185482025146484375;
        float _1830 = sin(_1828);
        _1826 = _1830;
    }
    float _1832 = _1826;
    float _1834 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1836 = precise::max(0.0, _1834);
    float _1838 = _1810;
    float _1840 = _1836;
    if (_1792)
    {
        float _1842 = _1824 * 6.283185482025146484375;
        float _1844 = cos(_1842);
        _1838 = _1844;
    }
    float _1846 = _1838;
    float _1848 = -_1778;
    float _1850 = -_1836;
    float _1852 = fma(_1758, _1848, _1850);
    if (_1792)
    {
        float _1854 = _1852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1804 = _1854;
    }
    float _1856 = _1804;
    float _1858 = _1856;
    float _1860 = _1832;
    if (_1792)
    {
        float _1862 = fma(_1832, _1856, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1858 = _1862;
    }
    float _1864 = _1858;
    float _1866 = _1864;
    if (!_1792)
    {
        _1860 = _1784;
    }
    float _1868 = _1860;
    float _1870 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1872 = _1868;
    float _1874 = _1846;
    if (_1792)
    {
        float _1876 = _1846 + (-1.0);
        _1840 = _1876;
    }
    float _1878 = _1840;
    float _1880 = _1878;
    if (_1792)
    {
        float _1882 = _1814 * _1864;
        _204 = _1882;
    }
    float _1884 = _204;
    if (!_1792)
    {
        _1866 = _1852;
    }
    float _1886 = _1866;
    float _1888 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1870);
    float _1890 = _1886;
    if (_1792)
    {
        float _1892 = _1878 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1816 = _1892;
    }
    float _1894 = _1816;
    if (_1792)
    {
        float _1896 = _1780 * _1884;
        _1806 = _1896;
    }
    float _1898 = _1806;
    if (!_1792)
    {
        _1880 = _1782;
    }
    float _1900 = _1880;
    float _1902 = _1900;
    if (_1792)
    {
        float _1904 = _1782 * _1884;
        _1902 = _1904;
    }
    float _1906 = _1902;
    if (_1792)
    {
        float _1908 = fma(_1852, _1846, _1894);
        _1890 = _1908;
    }
    float _1910 = _1890;
    if (_1792)
    {
        float _1912 = _1898 * _1898;
        _1872 = _1912;
    }
    float _1914 = _1872;
    if (!_1792)
    {
        _1874 = _1786;
    }
    float _1916 = _1874;
    float _1918 = _1916;
    if (_1792)
    {
        float _1920 = _1906 * _1906;
        _1918 = _1920;
    }
    float _1922 = _1918;
    float _1924 = fma(_1910, _1910, _1914);
    float _1926 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1928 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1888);
    float _1930 = _1924 + _1922;
    float _1932 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1926);
    float _1934 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1936 = fma(_1776, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1934);
    float _1938 = precise::clamp(_1936, 0.0, 1.0);
    float _1940 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1942 = rsqrt(_1930);
    float _1944 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1932);
    float _1946 = -_1938;
    float _1948 = _1946 + 1.0;
    float _1950 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1952 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1940);
    float _1954 = _1944 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1956 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1958 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1950);
    float _1960 = abs(_1948);
    float _1962 = log2(_1960);
    float _1964 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1952);
    float _1966 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1968 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1958);
    float _1970 = _1964 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1972 = -_1966;
    float _1974 = fma(_1972, _1956, 1.0);
    float _1976 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1978 = _1942 * _1898;
    float _1980 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1982 = _1942 * _1910;
    float _1984 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1986 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1988 = _1942 * _1906;
    float _1990 = log2(_1974);
    float _1992 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1984);
    float _1994 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1996 = -_1986;
    float _1998 = fma(_1982, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1996);
    float _2000 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1992);
    float _2002 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2004 = -_1988;
    float _2006 = fma(_2004, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1998);
    float _2008 = exp2(_1994);
    float _2010 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2000);
    float _2012 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2014 = fma(_2006, -0.5, 0.5);
    float _2016 = fma(_2006, 0.5, 0.5);
    float _2018 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2002);
    float _2020 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2012);
    float _2022 = _1982 + 1.0;
    float _2024 = 1.0 / _2010;
    float _2026 = fma(_2016, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2028 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2020);
    float _2030 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2018);
    float _2032 = _1990 * 0.693147182464599609375;
    float _2034 = fma(_2016, _2026, -0.212114393711090087890625);
    float _2036 = sqrt(_2014);
    float _2038 = -_1982;
    float _2040 = fma(_2008, _2022, _2038);
    float _2042 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2028);
    float _2044 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2030);
    float _2046 = fma(_2016, _2034, 1.570728778839111328125);
    float _2048 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2050 = fma(_2040, 0.5, 0.5);
    float _2052 = _2042 * _2024;
    float _2054 = _2044 * _2024;
    float _2056 = fma(_2052, 0.5, 0.5);
    float _2058 = fma(_2054, -0.5, 0.5);
    float _2060 = _2036 * 0.636619746685028076171875;
    float _2062 = -_2046;
    float _2064 = fma(_2060, _2062, 1.0);
    float3 _5881 = float3(_2056, _2058, _2048);
    float _2066 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5881, float3(0.0), isnan(_5881)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5881, float3(0.0), isnan(_5881)), level(0.0)).x;
    float3 _5892 = float3(_2056, _2058, _2048);
    float4 _2069 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5892, float3(0.0), isnan(_5892)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5892, float3(0.0), isnan(_5892)), level(0.0)).xyzw;
    float _2071 = _2069.x;
    float _2073 = _2069.y;
    float _2075 = _2069.z;
    float _2077 = _2069.w;
    float2 _5908 = float2(_2064, _2050);
    float3 _2079 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5908, float2(0.0), isnan(_5908)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5908, float2(0.0), isnan(_5908)), level(0.0)).xyz;
    float _2081 = _2079.x;
    float _2083 = _2079.y;
    float _2085 = _2079.z;
    float _2087 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2089 = -_1090;
    float _2091 = _2089 + 1.0;
    float _2093 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2095 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2087);
    float _2097 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2093);
    float _2099 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2095);
    float _2101 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2103 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2097);
    float _2105 = _2099 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2107 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2101);
    float _2109 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2103);
    float _2111 = 1.0 / _2105;
    float _2113 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2107);
    float _2115 = _2109 + _2010;
    float _2117 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2119 = _2042 + _2010;
    float _2121 = _2115 * 0.5;
    bool _2123 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2125 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2127 = _2123 || _2125;
    bool _2129 = isnan(0.5);
    bool _2131 = _2127 || _2129;
    float _2133 = _2117 + _2105;
    float _2135 = _2119 * 0.5;
    out.gl_Position.x = _2042;
    out.gl_Position.y = _2044;
    out.gl_Position.z = _2109;
    out.gl_Position.w = _2010;
    float _2137 = _2133 * _2111;
    float _2139 = _2137 * 0.5;
    float _2141 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2143 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2141);
    float _2145 = 1.0 / _2143;
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2149 = _2145 * _2147;
    float _2151 = abs(_2149);
    float _2153 = log2(_2151);
    bool _2155 = _2149 <= 8000.0;
    bool _2157 = isnan(_2149);
    bool _2159 = _2155 || _2157;
    bool _2161 = isnan(8000.0);
    bool _2163 = _2159 || _2161;
    float _2165 = float(_2163);
    float _2167 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2169 = exp2(_2167);
    float _2171 = fma(_2169, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2173 = precise::clamp(_2171, 0.0, 1.0);
    float _2175 = fma(_2173, -2.0, 3.0);
    float _2177 = _2173 * _2173;
    float _2179 = in.m_91.x;
    float _2181 = _2177 * _2175;
    float _2183 = -_2181;
    float _2185 = _2183 + 1.0;
    float _2187 = fma(_2185, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2181);
    float _2189 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2191 = _1962;
    float _2193 = _2091;
    float _2195 = _2135;
    float _2197 = _2010;
    float _2199 = _2109;
    float _2201 = _2044;
    float _2203 = _2042;
    if (!_2131)
    {
        _2191 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2205 = _2191;
    float _2207 = _2165 * _2187;
    float _2209 = exp2(_2189);
    float _2211 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2213 = _2091 * _2211;
    float _2215 = precise::clamp(_2213, 0.0, 1.0);
    float _2217 = _2205;
    if (!_2131)
    {
        float _2219 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2221 = _2205 + _2219;
        _2193 = _2221;
    }
    float _2223 = _2193;
    if (_2131)
    {
        _2217 = 1.0;
    }
    float _2225 = _2217;
    float _2227 = -_2215;
    float _2229 = fma(_2227, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2231 = _2223;
    float _2233 = _2229;
    float _2235 = _2225;
    if (!_2131)
    {
        float _2237 = 1.0 / _2223;
        _2231 = _2237;
    }
    float _2239 = _2231;
    float _2241 = _2229 * _2179;
    if (!_2131)
    {
        float _2243 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2245 = _2149 + _2243;
        _2233 = _2245;
    }
    float _2247 = _2233;
    float _2249 = _2010 * 0.5;
    float _2251 = -_2209;
    float _2253 = _2251 + 1.0;
    float _2255 = _2241 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2257 = fma(_2044, -0.5, _2249);
    float _2259 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_93.x = _2255;
    float _2261 = -_2259;
    float _2263 = _2261 + 1.0;
    out.m_95.x = _2135;
    out.m_95.y = _2257;
    out.m_95.z = _2121;
    out.m_95.w = _2010;
    float _2265 = _2257;
    if (!_2131)
    {
        float _2267 = _2247 * _2239;
        float _2269 = precise::clamp(_2267, 0.0, 1.0);
        _2235 = _2269;
    }
    float _2271 = _2235;
    bool _2273 = _1776 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2275 = isnan(_1776);
    bool _2277 = _2273 || _2275;
    bool _2279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2281 = _2277 || _2279;
    float _2283 = _2271 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    if (!_2281)
    {
        _2265 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2285 = _2265;
    float _2287 = _2285;
    float _2289 = _2285;
    if (!_2281)
    {
        _2195 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2291 = _2195;
    float _2293 = _2291;
    float _2295 = _2291;
    if (!_2281)
    {
        _2197 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2297 = _2197;
    float _2299 = _2297;
    float _2301 = _2297;
    if (!_2281)
    {
        _2199 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2303 = _2199;
    float _2305 = _2303;
    float _2307 = _2303;
    if (!_2281)
    {
        _2201 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2309 = _2201;
    float _2311 = _2309;
    float _2313 = _2309;
    if (!_2281)
    {
        _2203 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2315 = _2203;
    float _2317 = _2259 * _2066;
    float _2319 = _2077 * _2263;
    float _2321 = _2077 * _2317;
    float _2323 = _2085 * _2317;
    float _2325 = fma(_2081, _2321, _2071);
    float _2327 = fma(_2083, _2321, _2073);
    float _2329 = fma(_2077, _2323, _2075);
    out.m_97.x = _2325;
    out.m_97.y = _2327;
    out.m_97.z = _2329;
    out.m_97.w = _2319;
    bool _2331 = !_2281;
    float _2333 = _2315;
    float _2335 = _2315;
    if (!_2331)
    {
        bool _2337 = _1776 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2339 = isnan(_1776);
        bool _2341 = _2337 || _2339;
        bool _2343 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2345 = _2341 || _2343;
        if (!_2345)
        {
            float _2347 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2349 = _1776 + _2347;
            float _2351 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2353 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2351;
            float _2355 = 1.0 / _2353;
            float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2359 = _2357 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2363 = _2361 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2367 = _2365 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2369 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2371 = _2369 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2375 = _2373 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2377 = _2349 * _2355;
            float _2379 = precise::clamp(_2377, 0.0, 1.0);
            float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2385 = fma(_2379, _2359, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2387 = fma(_2379, _2383, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2389 = fma(_2379, _2363, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2391 = fma(_2379, _2367, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2393 = fma(_2379, _2371, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2395 = fma(_2379, _2375, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2295 = _2387;
            _2313 = _2393;
            _2289 = _2385;
            _2307 = _2391;
            _2301 = _2389;
            _2335 = _2395;
            _2397 = true;
        }
        else
        {
            bool _2399 = _1776 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2401 = isnan(_1776);
            bool _2403 = _2399 || _2401;
            bool _2405 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2407 = _2403 || _2405;
            if (!_2407)
            {
                _2287 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2409 = _2287;
            _2289 = _2409;
            if (!_2407)
            {
                _2293 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2411 = _2293;
            _2295 = _2411;
            if (!_2407)
            {
                _2299 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2413 = _2299;
            _2301 = _2413;
            if (!_2407)
            {
                _2305 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2415 = _2305;
            _2307 = _2415;
            if (!_2407)
            {
                _2311 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2417 = _2311;
            _2313 = _2417;
            if (!_2407)
            {
                _2333 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2419 = _2333;
            bool _2421 = !_2407;
            _2335 = _2419;
            if (!_2421)
            {
                bool _2423 = _1776 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2425 = isnan(_1776);
                bool _2427 = _2423 || _2425;
                bool _2429 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2431 = _2427 || _2429;
                if (!_2431)
                {
                    float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2435 = _1776 + _2433;
                    float _2437 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2439 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2437;
                    float _2441 = 1.0 / _2439;
                    float _2443 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2445 = _2443 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2447 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2449 = _2447 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2455 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2457 = _2455 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2461 = _2459 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2463 = _2435 * _2441;
                    float _2465 = precise::clamp(_2463, 0.0, 1.0);
                    float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2469 = _2467 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2471 = fma(_2465, _2445, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2473 = fma(_2465, _2469, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2475 = fma(_2465, _2449, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2477 = fma(_2465, _2453, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2479 = fma(_2465, _2457, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2481 = fma(_2465, _2461, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2295 = _2473;
                    _2313 = _2479;
                    _2289 = _2471;
                    _2307 = _2477;
                    _2301 = _2475;
                    _2335 = _2481;
                    _2397 = true;
                }
                else
                {
                    _2295 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2313 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2289 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2307 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2301 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2335 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2397 = false;
    float _2483 = _2295;
    float _2485 = _2313;
    float _2487 = _2289;
    float _2489 = _2307;
    float _2491 = _2301;
    float _2493 = _2335;
    float _2495 = fma(_1550, -0.5, 0.5);
    float _2497 = precise::clamp(_2495, 0.0, 1.0);
    float _2499 = -_2483;
    float _2501 = _2499 + _2485;
    float _2503 = _2283 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2505 = -_2487;
    float _2507 = _2505 + _2489;
    float _2509 = fma(_2497, _2501, _2483);
    out.m_99.x = 0.0;
    float _2511 = -_2491;
    float _2513 = _2511 + _2493;
    float _2515 = fma(_2497, _2507, _2487);
    float _2517 = _2509 * 0.586610972881317138671875;
    out.m_53.x = _2503;
    bool _2519 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2521 = fma(_2497, _2513, _2491);
    float _2523 = fma(_2515, 0.298911988735198974609375, _2517);
    bool _2525 = _2271 > 0.0;
    bool _2527 = isnan(_2271);
    bool _2529 = _2525 || _2527;
    bool _2531 = isnan(0.0);
    bool _2533 = _2529 || _2531;
    float _2535 = fma(_2521, 0.114477999508380889892578125, _2523);
    float _2537 = -_2535;
    float _2539 = _2515 + _2537;
    float _2541 = -_2535;
    float _2543 = _2509 + _2541;
    float _2545 = -_2535;
    float _2547 = _2521 + _2545;
    float _2549 = fma(_2539, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2535);
    float _2551 = fma(_2543, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2535);
    float _2553 = fma(_2547, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2535);
    bool _2555 = !_2519;
    if (!_2555)
    {
        float _2557 = -_1746;
        float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2561 = -_1748;
        float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2565 = -_1750;
        float _2567 = _2565 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2569 = _2559 * _2559;
        float _2571 = fma(_2563, _2563, _2569);
        float _2573 = fma(_2567, _2567, _2571);
        float _2575 = sqrt(_2573);
        float _2577 = rsqrt(_2573);
        float _2579 = -_2575;
        float _2581 = _2579 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2583 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2585 = precise::clamp(_2583, 0.0, 1.0);
        float _2587 = _2563 * _2577;
        float _2589 = _2559 * _2577;
        float _2591 = abs(_2585);
        float _2593 = log2(_2591);
        float _2595 = _2567 * _2577;
        float _2597 = _2587 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2599 = _1550 * _2589;
        float _2601 = -_2589;
        float _2603 = -_2597;
        float _2605 = fma(_2601, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2603);
        float _2607 = fma(_1530, _2587, _2599);
        float _2609 = -_2595;
        float _2611 = fma(_2609, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2605);
        float _2613 = fma(_1552, _2595, _2607);
        float _2615 = precise::clamp(_2613, 0.0, 1.0);
        float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2619 = _2611 + _2617;
        float _2621 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2623 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2625 = precise::clamp(_2623, 0.0, 1.0);
        float _2627 = exp2(_2621);
        float _2629 = _2627 * _2625;
        float _2631 = _2615 * _2629;
        float _2633 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2635 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2637 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _2633;
        out.m_99.y = _2635;
        out.m_99.z = _2637;
    }
    out.m_101.x = _2549;
    out.m_101.y = _2551;
    out.m_101.z = _2553;
    if (_2533)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2639 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2639;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2397 = false;
    bool _1602 = false;
    bool _508 = false;
    bool _392 = false;
    bool _224 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_50.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_53.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2695 = as_type<float>(_136);
        out.gl_Position.z = _2695;
    }
    if (!_124)
    {
        return out;
    }
    float _138 = in.m_55.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = _152;
    if (_148)
    {
        float _156 = float(_120);
        _130 = _156;
    }
    float _158 = _130;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    float _166 = _158;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_53.x = 0.0;
    }
    int _170 = 0;
    if (_164)
    {
        float _172 = _168 * 5.0;
        _170 = as_type<int>(_172);
    }
    int _174 = _170;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2765 = as_type<float>(_174);
        out.gl_Position.z = _2765;
    }
    if (_164)
    {
        return out;
    }
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = _178 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _186 = _178 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _188 = _178 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _190 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].x, _184);
    float _192 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].x, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].x, _188);
    float _196 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].z, _190);
    float _198 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].z, _192);
    float _200 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].z, _194);
    bool _202 = !_182;
    float _204 = _200;
    float _222;
    if (!_202)
    {
        float _206 = in.m_59.x;
        float _208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _210 = _206 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _212 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _214 = _212 * _208;
        float _216 = floor(_214);
        float _218 = -_216;
        float _220 = _214 + _218;
        _222 = _220;
        _224 = true;
    }
    else
    {
        float _226 = float(_120);
        float _228 = 1.0 / _226;
        float _230 = _152 * _228;
        _222 = _230;
    }
    _224 = false;
    float _232 = _222;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = _232 + _234;
    bool _238 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _240 = isnan(_232);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _232 + _250;
    bool _254 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _256 = isnan(_232);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _270 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _274 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _276 = isnan(_232);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = -_248;
    float _288 = _286 + 1.0;
    float _290 = 1.0 / _272;
    float _292 = _284 * _288;
    float _294 = -_284;
    float _296 = _294 + 1.0;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _298;
    bool _302 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _304 = 1.0 / _268;
    float _306 = _264 * _296;
    float _308 = -_264;
    float _310 = _308 + 1.0;
    float _312 = _252 * _290;
    float _314 = _236 * _304;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _320;
    float _324 = fma(_300, _314, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _326 = fma(_318, _314, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _328 = fma(_322, _314, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _330 = _324 * _306;
    float _332 = _326 * _306;
    float _334 = _328 * _306;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _348 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[143].x, _330);
    float _350 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[143].y, _332);
    float _352 = fma(_338, _312, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _354 = fma(_342, _312, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _356 = fma(_346, _312, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _358 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[143].z, _334);
    float _360 = fma(_352, _292, _348);
    float _362 = fma(_354, _292, _350);
    float _364 = fma(_356, _292, _358);
    float _366 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[145].x, _360);
    float _368 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[145].y, _362);
    float _370 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[145].z, _364);
    bool _372 = !_302;
    float _390;
    if (!_372)
    {
        float _374 = in.m_59.x;
        float _376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _378 = _374 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _380 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _382 = _380 * _376;
        float _384 = floor(_382);
        float _386 = -_384;
        float _388 = _382 + _386;
        _390 = _388;
        _392 = true;
    }
    else
    {
        float _394 = float(_120);
        float _396 = 1.0 / _394;
        float _398 = _152 * _396;
        _390 = _398;
    }
    _392 = false;
    float _400 = _390;
    bool _402 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _404 = isnan(_400);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _418 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _420 = isnan(_400);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _436 = _400 + _434;
    float _438 = -_412;
    float _440 = _438 + 1.0;
    bool _442 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _444 = 1.0 / _416;
    float _446 = _428 * _440;
    float _448 = -_428;
    float _450 = _448 + 1.0;
    float _452 = _432 * _444;
    float _454 = fma(_452, _436, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _456 = _454 * _446;
    float _458 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[115].x, _456);
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _466 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[116].x, _458);
    float _468 = _460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _470 = _462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _472 = _464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _474 = _466 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _476 = in.m_61.x;
    float _478 = in.m_61.y;
    float _480 = in.m_61.z;
    out.m_63.x = _468;
    out.m_63.y = _470;
    out.m_63.z = _472;
    out.m_63.w = _474;
    float _482 = _370 * _480;
    float _484 = _368 * _478;
    float _486 = _366 * _476;
    bool _488 = !_442;
    float _506;
    if (!_488)
    {
        float _490 = in.m_59.x;
        float _492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _494 = _490 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _496 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[11].w, _152);
        float _498 = _496 * _492;
        float _500 = floor(_498);
        float _502 = -_500;
        float _504 = _498 + _502;
        _506 = _504;
        _508 = true;
    }
    else
    {
        float _510 = float(_120);
        float _512 = 1.0 / _510;
        float _514 = _152 * _512;
        _506 = _514;
    }
    _508 = false;
    float _516 = _506;
    float _518 = in.m_59.z;
    float _520 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _522 = log2(_520);
    float _524 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _526 = in.m_59.x;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _534 = _532 != 0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _538 = _536 != 0;
    float _540 = in.m_59.y;
    bool _542 = !_534;
    int _544 = _542 ? 0 : 1;
    float _546 = _518 * 2.0;
    float _548 = _526 * 2.0;
    float _550 = floor(_546);
    float _552 = _540 * 2.0;
    float _554 = _540 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _556 = floor(_548);
    float _558 = floor(_552);
    bool _560 = _550 > 0.0;
    float _562 = _526 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _564 = _550 >= 0.0;
    bool _566 = isnan(_550);
    bool _568 = _564 || _566;
    bool _570 = isnan(0.0);
    bool _572 = _568 || _570;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _578 = _526 + _540;
    int _580 = _572 ? 0 : 1;
    float _582 = -_574;
    float _584 = fma(_562, 2.0, _582);
    float _586 = _522 * _152;
    float _588 = _578 + (-1.0);
    int _590 = ~_580;
    int _592 = _590 + 1;
    int _594 = _592 + 1;
    float _596 = fma(_554, -2.0, _576);
    bool _598 = _556 >= 0.0;
    bool _600 = isnan(_556);
    bool _602 = _598 || _600;
    bool _604 = isnan(0.0);
    bool _606 = _602 || _604;
    float _608 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _610 = _594;
    int _612 = as_type<int>(_518);
    if (!_560)
    {
        int _614 = ~_580;
        int _616 = _614 + 1;
        _610 = _616;
    }
    int _618 = _610;
    bool _620 = _558 > 0.0;
    float _622 = exp2(_586);
    bool _624 = _558 >= 0.0;
    bool _626 = isnan(_558);
    bool _628 = _624 || _626;
    bool _630 = isnan(0.0);
    bool _632 = _628 || _630;
    int _634 = _606 ? 0 : 1;
    bool _636 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _638 = isnan(1.0);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _644 = _640 || _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _648 = 1.0 + _646;
    float _650 = in.m_65.x;
    float _652 = in.m_65.y;
    float _654 = in.m_65.z;
    bool _656 = _556 > 0.0;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _660 = 1.0 / _648;
    bool _662 = !_530;
    int _664 = _662 ? 0 : 1;
    float _666 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[78].w, _658);
    float _668 = -_622;
    float _670 = _668 + 1.0;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _674 = abs(_664);
    float _676 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _666);
    bool _678 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _680 = isnan(0.0);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _686 = _682 || _684;
    float _688 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[78].z, _672);
    float _690 = float(_674);
    float _692 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _596);
    float _694 = float(_618);
    float _696 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _688);
    float _698 = _686 ? _670 : 0.0;
    float _700 = -_152;
    float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[76].x, _584);
    int _704 = ~_634;
    int _706 = _704 + 1;
    int _708 = _706 + 1;
    float _710 = _690 * _694;
    int _712 = _708;
    if (!_656)
    {
        int _714 = ~_634;
        int _716 = _714 + 1;
        _712 = _716;
    }
    int _718 = _712;
    if (_644)
    {
        float _720 = _698 * _660;
        _154 = _720;
    }
    float _722 = _154;
    int _724 = abs(_544);
    float _726 = _710 * (-2.0);
    float _728 = float(_718);
    float _730 = _526 + (-0.5);
    int _732 = _632 ? 0 : 1;
    float _734 = fma(_726, _650, _650);
    bool _736 = !_538;
    int _738 = _736 ? 0 : 1;
    float _740 = fma(_608, _726, _608);
    float _742 = float(_724);
    float _744 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[196].x, _734);
    int _746 = ~_732;
    int _748 = _746 + 1;
    int _750 = _748 + 1;
    float _752 = _540 + _518;
    int _754 = _750;
    if (!_620)
    {
        int _756 = ~_732;
        int _758 = _756 + 1;
        _754 = _758;
    }
    int _760 = _754;
    float _762 = _742 * _728;
    int _764 = abs(_738);
    float _766 = fma(_740, _722, _744);
    float _768 = float(_760);
    float _770 = _752 + (-1.0);
    float _772 = float(_764);
    float _774 = _762 * (-2.0);
    float _776 = _766 * 0.15915493667125701904296875;
    float _778 = _772 * _768;
    float _780 = _540 + (-0.5);
    float _782 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _784 = fma(_774, _652, _652);
    float _786 = _526 + _518;
    float _788 = _778 * (-2.0);
    float _790 = fma(_782, _774, _782);
    float _792 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[196].y, _784);
    float _794 = _786 + (-1.0);
    float _796 = fma(_788, _654, _654);
    float _798 = fma(_790, _722, _792);
    float _800 = _776 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = in.m_67.x;
    float _806 = in.m_67.y;
    float _808 = in.m_67.z;
    float _810 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _812 = _518 + (-0.5);
    float _814 = _798 * 0.15915493667125701904296875;
    float _816 = fma(_810, _788, _810);
    float _818 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[196].z, _796);
    float _820 = _776 * 6.283185482025146484375;
    float _822 = cos(_820);
    float _824 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _826 = fma(_816, _722, _818);
    float _828 = _826 * 0.15915493667125701904296875;
    float _830 = _814 * 6.283185482025146484375;
    float _832 = sin(_830);
    float _834 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _836 = _814 * 6.283185482025146484375;
    float _838 = cos(_836);
    float _840 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _804);
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _806);
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _808);
    float _846 = _840 * _824;
    float _848 = _842 * _524;
    float _850 = _844 * _834;
    float _852 = _828 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = in.m_50.x;
    float _858 = in.m_50.y;
    float _860 = in.m_50.z;
    float _862 = _802 * _832;
    float _864 = _822 * _832;
    float _866 = _828 * 6.283185482025146484375;
    float _868 = sin(_866);
    float _870 = _822 * _838;
    float _872 = _802 * _838;
    float _874 = _822 * _854;
    float _876 = _802 * _854;
    float _878 = _838 * _854;
    float _880 = _832 * _854;
    float _882 = _874 * _848;
    float _884 = fma(_868, _870, _862);
    float _886 = -_864;
    float _888 = fma(_868, _872, _886);
    float _890 = fma(_868, _862, _870);
    float _892 = -_872;
    float _894 = fma(_868, _864, _892);
    float _896 = -_848;
    float _898 = _868 * _896;
    float _900 = fma(_884, _846, _882);
    float _902 = _876 * _848;
    float _904 = _858 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _906 = fma(_878, _846, _898);
    float _908 = fma(_894, _850, _900);
    float _910 = fma(_888, _846, _902);
    float _912 = _858 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _914 = fma(_880, _850, _906);
    float _916 = _908 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _918 = _908 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _920 = fma(_890, _850, _910);
    float _922 = fma(_856, (*spvDescriptorSet0.vp_c10)._m0[4].x, _912);
    float _924 = fma(_856, (*spvDescriptorSet0.vp_c10)._m0[6].x, _904);
    float _926 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[24].x, _916);
    float _928 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[26].x, _918);
    float _930 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[4].z, _922);
    float _932 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[6].z, _924);
    float _934 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[24].z, _926);
    float _936 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[26].z, _928);
    float _938 = _930 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _940 = _932 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _942 = _934 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _944 = _936 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _946 = _858 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _948 = _938 + _942;
    float _950 = _940 + _944;
    float _952 = fma(_856, (*spvDescriptorSet0.vp_c10)._m0[5].x, _946);
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _956 = _948 + _954;
    float _958 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _960 = _950 + _958;
    float _962 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[5].z, _952);
    float _964 = _956 * _956;
    float _966 = _960 * _960;
    float _968 = _964 + _966;
    float _970 = sqrt(_968);
    bool _972 = _970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _974 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _976 = _970 + _974;
    float _978 = 0.0;
    float _980 = _968;
    float _982 = _948;
    float _984 = _950;
    float _986 = _890;
    float _988 = _964;
    float _990 = _966;
    if (_972)
    {
        float _992 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _978 = _992;
    }
    float _994 = _978;
    if (_972)
    {
        float _996 = rsqrt(_968);
        _980 = _996;
    }
    float _998 = _980;
    float _1000 = _994;
    if (_972)
    {
        float _1002 = _976 * _994;
        _1000 = _1002;
    }
    float _1004 = _1000;
    float _1006 = _908 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1008 = _962 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1010 = _1004;
    if (_972)
    {
        float _1012 = _1004 * 0.15915493667125701904296875;
        _1010 = _1012;
    }
    float _1014 = _1010;
    float _1016 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1006);
    float _1018 = _856;
    if (_972)
    {
        float _1020 = _1014 * 6.283185482025146484375;
        float _1022 = sin(_1020);
        _1018 = _1022;
    }
    float _1024 = _1018;
    float _1026 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1016);
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1030 = fma(_940, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1032 = fma(_938, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1034 = _1008 + _1028;
    float _1036 = floor(_1030);
    float _1038 = _1028;
    float _1040 = _1034;
    if (_972)
    {
        float _1042 = _1034 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1038 = _1042;
    }
    float _1044 = _1038;
    float _1046 = _1024;
    if (_972)
    {
        float _1048 = fma(_1024, _1044, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1046 = _1048;
    }
    float _1050 = _1046;
    float _1052 = floor(_1032);
    float _1054 = _1050;
    if (_972)
    {
        float _1056 = _998 * _1050;
        _1054 = _1056;
    }
    float _1058 = _1054;
    if (_972)
    {
        float _1060 = fma(_956, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _982 = _1060;
    }
    float _1062 = _982;
    if (_972)
    {
        float _1064 = fma(_960, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _984 = _1064;
    }
    float _1066 = _984;
    float _1068 = -_1036;
    float _1070 = _1030 + _1068;
    float _1072 = fma(_1062, 6.2500002968590706586837768554688e-05, 0.5);
    float _1074 = fma(_1066, 6.2500002968590706586837768554688e-05, 0.5);
    float _1076 = -_1052;
    float _1078 = _1032 + _1076;
    float2 _4196 = float2(_1072, _1074);
    float3 _1082 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4196, float2(0.0), isnan(_4196)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4196, float2(0.0), isnan(_4196)), level(0.0)).xyz;
    float _1084 = _1082.x;
    float _1086 = _1082.y;
    float _1088 = _1082.z;
    float2 _4212 = float2(_1078, _1070);
    float _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4212, float2(0.0), isnan(_4212)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4212, float2(0.0), isnan(_4212)), level(0.0)).x;
    float _1092 = in.m_69.y;
    float _1094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1096 = in.m_59.w;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1100 = _1098 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1104 = _1102 != 0;
    float _1106 = in.m_69.x;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1108;
    bool _1112 = _540 > 0.5;
    float _1114 = 1.0 / _1100;
    float _1116 = in.m_71.w;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1120 = _1118 != 0;
    bool _1122 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1124 = isnan(_516);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1136 = _1134 != 0;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1140 = _1138 != 0;
    float _1142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1144 = -_1092;
    float _1146 = _1144 + 1.0;
    float _1148 = _1110 * _1114;
    bool _1150 = _1096 > 0.5;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1154 = _516 + _1152;
    bool _1156 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1158 = isnan(_516);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = -_1132;
    float _1170 = _1168 + 1.0;
    int _1172 = _1150 ? as_type<int>(_1146) : as_type<int>(_1092);
    float _1174 = fma(_1148, _1154, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1176 = _1150;
    float _1178 = _1092;
    bool _1180 = _1120;
    int _1182 = as_type<int>(_1146);
    float _1184 = _1094;
    if (_1104)
    {
        bool _1186 = _526 > 0.5;
        _1176 = _1186;
    }
    bool _1188 = _1176;
    float _1190 = _1166 * _1170;
    float _1192 = in.m_73.x;
    float _1194 = in.m_73.y;
    float _1196 = in.m_73.z;
    float _1198 = _1140 ? as_type<float>(_1172) : _1092;
    float _1200 = -_1166;
    float _1202 = _1200 + 1.0;
    bool _1204 = _806 != 0.0;
    bool _1206 = isnan(_806);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan(0.0);
    bool _1212 = _1208 || _1210;
    float _1214 = _1174 * _1190;
    float _1216 = _1190;
    if (_1120)
    {
        float _1218 = _1112 ? _1146 : _1092;
        _1178 = _1218;
    }
    float _1220 = _1178;
    float _1222 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1224 = _804 == 0.0;
    bool _1226 = !_1212;
    bool _1228 = _1224 && _1226;
    out.m_75.w = _1116;
    float _1230 = _1116;
    if (_1136)
    {
        bool _1232 = _518 > 0.5;
        _1180 = _1232;
    }
    bool _1234 = _1180;
    if (_1104)
    {
        float _1236 = -_1106;
        float _1238 = _1236 + 1.0;
        _612 = as_type<int>(_1238);
    }
    int _1240 = _612;
    bool _1242 = _808 == 0.0;
    bool _1244 = _1242 && _1228;
    float _1246 = fma(_1222, _1220, -0.5);
    float _1248 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1214);
    float _1250 = _1246;
    if (_1136)
    {
        float _1252 = -_1106;
        float _1254 = _1252 + 1.0;
        _1182 = as_type<int>(_1254);
    }
    int _1256 = _1182;
    float _1258 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1260 = as_type<float>(_1256);
    if (!_1104)
    {
        _1230 = _1106;
    }
    float _1262 = _1230;
    float _1264 = -_692;
    float _1266 = fma(_676, _1246, _1264);
    float _1268 = _1262;
    if (_1104)
    {
        float _1270 = _1188 ? as_type<float>(_1240) : _1106;
        _1268 = _1270;
    }
    float _1272 = _1268;
    float _1274 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1248);
    float _1276 = in.m_77.x;
    float _1278 = in.m_77.y;
    float _1280 = in.m_77.z;
    float _1282 = in.m_77.w;
    if (!_1136)
    {
        _1216 = _1106;
    }
    float _1284 = _1216;
    float _1286 = _1284;
    if (_1136)
    {
        float _1288 = _1234 ? as_type<float>(_1256) : _1106;
        _1286 = _1288;
    }
    float _1290 = _1286;
    float _1292 = fma(_1258, _1272, -0.5);
    float _1294 = _1192;
    if (_1244)
    {
        _1184 = _1192;
    }
    float _1296 = _1184;
    float _1298 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1300 = fma(_696, _1292, _702);
    float _1302 = _1296;
    if (_1244)
    {
        _1260 = _1296;
    }
    float _1304 = _1260;
    float _1306 = _874 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1308 = _1304;
    if (!_1244)
    {
        _1302 = _1192;
    }
    float _1310 = _1302;
    if (!_1244)
    {
        float _1312 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1310);
        _1308 = _1312;
    }
    float _1314 = _1308;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1244)
    {
        _1250 = _1196;
    }
    float _1320 = _1250;
    float _1322 = _1320;
    if (!_1244)
    {
        float _1324 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1196);
        _1322 = _1324;
    }
    float _1326 = _1322;
    if (_1244)
    {
        _1294 = _1194;
    }
    float _1328 = _1294;
    float _1330 = _1328;
    if (!_1244)
    {
        float _1332 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1194);
        _1330 = _1332;
    }
    float _1334 = _1330;
    float _1336 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1340 = _1278 * _1196;
    float _1342 = _1276 * _1194;
    float _1344 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1346 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1348 = _1280 * _1310;
    float _1350 = -_1340;
    float _1352 = fma(_1280, _1194, _1350);
    float _1354 = -_1342;
    float _1356 = fma(_1278, _1310, _1354);
    float _1358 = _874 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1360 = _874 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1362 = _884 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1364 = _1352 * _1282;
    out.m_79.x = _1344;
    out.m_79.y = _1346;
    out.m_79.z = _1336;
    out.m_79.w = _1298;
    float _1366 = _884 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1368 = -_1348;
    float _1370 = fma(_1276, _1196, _1368);
    float _1372 = _884 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1374 = _1370 * _1282;
    float _1376 = _1356 * _1282;
    float _1378 = -_868;
    float _1380 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1358);
    float _1382 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1362);
    float _1384 = _894 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1386 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1366);
    float _1388 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1372);
    float _1390 = _894 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1392 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1384);
    float _1394 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1382);
    float _1396 = -_868;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1306);
    float _1400 = _1382;
    float _1402 = _1376;
    if (_972)
    {
        float _1404 = _1014 * 6.283185482025146484375;
        float _1406 = cos(_1404);
        _1400 = _1406;
    }
    float _1408 = _1400;
    float _1410 = _894 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1412 = -_868;
    float _1414 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1360);
    float _1416 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1390);
    float _1418 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1380);
    float _1420 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1398);
    float _1422 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1410);
    float _1424 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1414);
    float _1426 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1386);
    float _1428 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1388);
    float _1430 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1416);
    float _1432 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1392);
    float _1434 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1422);
    float _1436 = _1422;
    if (_972)
    {
        float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1440 = _1062 + _1438;
        _1436 = _1440;
    }
    float _1442 = _1436;
    float _1444 = _1418 * _1278;
    float _1446 = _1420 * _1278;
    float _1448 = _1408;
    if (_972)
    {
        float _1450 = _1408 + (-1.0);
        _986 = _1450;
    }
    float _1452 = _986;
    float _1454 = _1452;
    if (_972)
    {
        float _1456 = _1442 * _1442;
        _988 = _1456;
    }
    float _1458 = _988;
    float _1460 = _1424 * _1278;
    float _1462 = _1418 * _1334;
    if (_972)
    {
        float _1464 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1454 = _1464;
    }
    float _1466 = _1454;
    float _1468 = _1374 * _1418;
    float _1470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1472 = _1420 * _1334;
    if (_972)
    {
        float _1474 = fma(_1034, _1408, _1466);
        _1040 = _1474;
    }
    float _1476 = _1040;
    if (_972)
    {
        float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1480 = _1066 + _1478;
        _1448 = _1480;
    }
    float _1482 = _1448;
    float _1484 = _1424 * _1334;
    float _1486 = _1374 * _1420;
    float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1490 = _1476 + _1488;
    if (_972)
    {
        float _1492 = _1482 * _1482;
        _990 = _1492;
    }
    float _1494 = _990;
    float _1496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1498 = _1374 * _1424;
    float _1500 = fma(_1490, _1490, _1458);
    float _1502 = fma(_1426, _1314, _1462);
    float _1504 = fma(_1394, _1314, _1472);
    float _1506 = fma(_1426, _1276, _1444);
    float _1508 = _1500 + _1494;
    float _1510 = fma(_1364, _1426, _1468);
    float _1512 = fma(_1394, _1276, _1446);
    float _1514 = fma(_1428, _1276, _1460);
    float _1516 = fma(_1364, _1394, _1486);
    float _1518 = fma(_1428, _1314, _1484);
    float _1520 = sqrt(_1508);
    float _1522 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1524 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1526 = fma(_1364, _1428, _1498);
    float _1528 = _1300 + 0.5;
    float _1530 = fma(_1432, _1326, _1502);
    float _1532 = fma(_1432, _1280, _1506);
    float _1534 = fma(_1430, _1280, _1512);
    float _1536 = fma(_1434, _1280, _1514);
    float _1538 = fma(_1376, _1430, _1516);
    float _1540 = _1522 * _1470;
    float _1542 = _1524 * _1496;
    float _1544 = fma(_1376, _1432, _1510);
    float _1546 = _1266 + 0.5;
    float _1548 = fma(_1376, _1434, _1526);
    float _1550 = fma(_1430, _1326, _1504);
    float _1552 = fma(_1434, _1326, _1518);
    out.m_81.x = _1532;
    out.m_81.y = _1534;
    out.m_81.z = _1536;
    bool _1554 = _1520 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1556 = isnan(_1520);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1562 = _1558 || _1560;
    out.m_83.x = _1528;
    out.m_83.y = _1546;
    out.m_83.z = _1542;
    out.m_83.w = _1540;
    out.m_85.x = _1544;
    out.m_85.y = _1538;
    out.m_85.z = _1548;
    out.m_87.x = _1530;
    out.m_87.y = _1550;
    out.m_87.z = _1552;
    float _1564 = _1528;
    float _1566 = _1532;
    if (!_1562)
    {
        _1402 = 1.0;
    }
    float _1568 = _1402;
    out.m_89.x = _1084;
    out.m_89.y = _1086;
    out.m_89.z = _1088;
    bool _1570 = !_1562;
    float _1572 = _1568;
    if (!_1570)
    {
        bool _1574 = _1520 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1576 = isnan(_1520);
        bool _1578 = _1574 || _1576;
        bool _1580 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1582 = _1578 || _1580;
        if (!_1582)
        {
            float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1586 = _1520 + _1584;
            float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1590 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1588;
            float _1592 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1594 = _1592 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1596 = 1.0 / _1590;
            float _1598 = _1586 * _1596;
            float _1600 = fma(_1598, _1594, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1572 = _1600;
            _1602 = true;
        }
        else
        {
            bool _1604 = _1520 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1606 = isnan(_1520);
            bool _1608 = _1604 || _1606;
            bool _1610 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1612 = _1608 || _1610;
            if (!_1612)
            {
                float _1614 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1616 = _1520 + _1614;
                float _1618 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1620 = _1618 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1622 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1624 = _1622 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1626 = 1.0 / _1620;
                float _1628 = _1616 * _1626;
                float _1630 = fma(_1628, _1624, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1572 = _1630;
                _1602 = true;
            }
            else
            {
                _1572 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1602 = false;
    float _1632 = _1572;
    float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1636 = _1476 + _1634;
    float _1638 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1640 = _1062 + _1638;
    float _1642 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1644 = _1066 + _1642;
    float _1646 = fma(_1636, _1632, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1648 = fma(_1640, _1632, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1650 = fma(_1644, _1632, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1652 = -_1008;
    float _1654 = _1652 + _1646;
    float _1656 = -_938;
    float _1658 = _1656 + _1648;
    float _1660 = -_940;
    float _1662 = _1660 + _1650;
    float _1664 = _1654 * _1654;
    float _1666 = fma(_1658, _1658, _1664);
    float _1668 = fma(_1662, _1662, _1666);
    float _1670 = sqrt(_1668);
    bool _1672 = _1670 > 0.0;
    float _1674 = _1632;
    float _1676 = _1650;
    float _1678 = _1658;
    float _1680 = _1654;
    if (!_1672)
    {
        _1674 = _1648;
    }
    float _1682 = _1674;
    float _1684 = _1682;
    if (!_1672)
    {
        _1564 = _1646;
    }
    float _1686 = _1564;
    bool _1688 = !_1672;
    float _1690 = _1686;
    float _1692 = _1686;
    if (!_1688)
    {
        float _1694 = _198 * _198;
        float _1696 = fma(_196, _196, _1694);
        float _1698 = fma(_200, _200, _1696);
        float _1700 = rsqrt(_1668);
        float _1702 = sqrt(_1698);
        float _1704 = _1658 * _1700;
        float _1706 = _1654 * _1700;
        float _1708 = _1662 * _1700;
        bool _1710 = _1702 > 0.0;
        float _1712 = _1702;
        _1566 = _1706;
        if (!_1710)
        {
            _1712 = _1648;
        }
        float _1714 = _1712;
        _1684 = _1714;
        if (!_1710)
        {
            _1690 = _1646;
        }
        float _1716 = _1690;
        bool _1718 = !_1710;
        _1692 = _1716;
        if (!_1718)
        {
            float _1720 = rsqrt(_1698);
            float _1722 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1724 = _198 * _1720;
            float _1726 = _196 * _1720;
            float _1728 = _200 * _1720;
            float _1730 = _1706 * _1724;
            float _1732 = fma(_1704, _1726, _1730);
            float _1734 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1736 = fma(_1708, _1728, _1732);
            float _1738 = _1736 * _1734;
            float _1740 = fma(_196, _1738, _1648);
            float _1742 = fma(_198, _1738, _1646);
            float _1744 = fma(_200, _1738, _1650);
            _1692 = _1742;
            _1684 = _1740;
            _1676 = _1744;
            _1678 = _1734;
        }
    }
    float _1746 = _1692;
    float _1748 = _1684;
    float _1750 = _1676;
    float _1752 = _1678;
    float _1754 = _1566;
    float _1756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1758 = _1746 + _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1762 = _1748 + _1760;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1766 = _1750 + _1764;
    float _1768 = _1758 * _1758;
    float _1770 = fma(_1762, _1762, _1768);
    float _1772 = fma(_1766, _1766, _1770);
    float _1774 = rsqrt(_1772);
    float _1776 = sqrt(_1772);
    float _1778 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1780 = _1762 * _1778;
    float _1782 = _1766 * _1778;
    float _1784 = _1780 * _1780;
    float _1786 = _1782 * _1782;
    float _1788 = _1784 + _1786;
    float _1790 = sqrt(_1788);
    bool _1792 = _1790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1796 = _1790 + _1794;
    float _1798 = _1752;
    float _1800 = _1754;
    float _1802 = _1796;
    float _1804 = _1758;
    float _1806 = _1780;
    if (_1792)
    {
        float _1808 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1798 = _1808;
    }
    float _1810 = _1798;
    if (_1792)
    {
        float _1812 = rsqrt(_1788);
        _1800 = _1812;
    }
    float _1814 = _1800;
    float _1816 = _1814;
    if (_1792)
    {
        float _1818 = _1796 * _1810;
        _1802 = _1818;
    }
    float _1820 = _1802;
    if (_1792)
    {
        float _1822 = _1820 * 0.15915493667125701904296875;
        _1680 = _1822;
    }
    float _1824 = _1680;
    float _1826 = _1766;
    if (_1792)
    {
        float _1828 = _1824 * 6.283185482025146484375;
        float _1830 = sin(_1828);
        _1826 = _1830;
    }
    float _1832 = _1826;
    float _1834 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1836 = precise::max(0.0, _1834);
    float _1838 = _1810;
    float _1840 = _1836;
    if (_1792)
    {
        float _1842 = _1824 * 6.283185482025146484375;
        float _1844 = cos(_1842);
        _1838 = _1844;
    }
    float _1846 = _1838;
    float _1848 = -_1778;
    float _1850 = -_1836;
    float _1852 = fma(_1758, _1848, _1850);
    if (_1792)
    {
        float _1854 = _1852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1804 = _1854;
    }
    float _1856 = _1804;
    float _1858 = _1856;
    float _1860 = _1832;
    if (_1792)
    {
        float _1862 = fma(_1832, _1856, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1858 = _1862;
    }
    float _1864 = _1858;
    float _1866 = _1864;
    if (!_1792)
    {
        _1860 = _1784;
    }
    float _1868 = _1860;
    float _1870 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1872 = _1868;
    float _1874 = _1846;
    if (_1792)
    {
        float _1876 = _1846 + (-1.0);
        _1840 = _1876;
    }
    float _1878 = _1840;
    float _1880 = _1878;
    if (_1792)
    {
        float _1882 = _1814 * _1864;
        _204 = _1882;
    }
    float _1884 = _204;
    if (!_1792)
    {
        _1866 = _1852;
    }
    float _1886 = _1866;
    float _1888 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1870);
    float _1890 = _1886;
    if (_1792)
    {
        float _1892 = _1878 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1816 = _1892;
    }
    float _1894 = _1816;
    if (_1792)
    {
        float _1896 = _1780 * _1884;
        _1806 = _1896;
    }
    float _1898 = _1806;
    if (!_1792)
    {
        _1880 = _1782;
    }
    float _1900 = _1880;
    float _1902 = _1900;
    if (_1792)
    {
        float _1904 = _1782 * _1884;
        _1902 = _1904;
    }
    float _1906 = _1902;
    if (_1792)
    {
        float _1908 = fma(_1852, _1846, _1894);
        _1890 = _1908;
    }
    float _1910 = _1890;
    if (_1792)
    {
        float _1912 = _1898 * _1898;
        _1872 = _1912;
    }
    float _1914 = _1872;
    if (!_1792)
    {
        _1874 = _1786;
    }
    float _1916 = _1874;
    float _1918 = _1916;
    if (_1792)
    {
        float _1920 = _1906 * _1906;
        _1918 = _1920;
    }
    float _1922 = _1918;
    float _1924 = fma(_1910, _1910, _1914);
    float _1926 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1928 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1888);
    float _1930 = _1924 + _1922;
    float _1932 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1926);
    float _1934 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1936 = fma(_1776, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1934);
    float _1938 = precise::clamp(_1936, 0.0, 1.0);
    float _1940 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1942 = rsqrt(_1930);
    float _1944 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1932);
    float _1946 = -_1938;
    float _1948 = _1946 + 1.0;
    float _1950 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1952 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1940);
    float _1954 = _1944 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1956 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1958 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1950);
    float _1960 = abs(_1948);
    float _1962 = log2(_1960);
    float _1964 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1952);
    float _1966 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1968 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1958);
    float _1970 = _1964 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1972 = -_1966;
    float _1974 = fma(_1972, _1956, 1.0);
    float _1976 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1978 = _1942 * _1898;
    float _1980 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1982 = _1942 * _1910;
    float _1984 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1986 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1988 = _1942 * _1906;
    float _1990 = log2(_1974);
    float _1992 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1984);
    float _1994 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1996 = -_1986;
    float _1998 = fma(_1982, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1996);
    float _2000 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1992);
    float _2002 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2004 = -_1988;
    float _2006 = fma(_2004, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1998);
    float _2008 = exp2(_1994);
    float _2010 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2000);
    float _2012 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2014 = fma(_2006, -0.5, 0.5);
    float _2016 = fma(_2006, 0.5, 0.5);
    float _2018 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2002);
    float _2020 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2012);
    float _2022 = _1982 + 1.0;
    float _2024 = 1.0 / _2010;
    float _2026 = fma(_2016, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2028 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2020);
    float _2030 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2018);
    float _2032 = _1990 * 0.693147182464599609375;
    float _2034 = fma(_2016, _2026, -0.212114393711090087890625);
    float _2036 = sqrt(_2014);
    float _2038 = -_1982;
    float _2040 = fma(_2008, _2022, _2038);
    float _2042 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2028);
    float _2044 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2030);
    float _2046 = fma(_2016, _2034, 1.570728778839111328125);
    float _2048 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2050 = fma(_2040, 0.5, 0.5);
    float _2052 = _2042 * _2024;
    float _2054 = _2044 * _2024;
    float _2056 = fma(_2052, 0.5, 0.5);
    float _2058 = fma(_2054, -0.5, 0.5);
    float _2060 = _2036 * 0.636619746685028076171875;
    float _2062 = -_2046;
    float _2064 = fma(_2060, _2062, 1.0);
    float3 _5881 = float3(_2056, _2058, _2048);
    float _2066 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5881, float3(0.0), isnan(_5881)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5881, float3(0.0), isnan(_5881)), level(0.0)).x;
    float3 _5892 = float3(_2056, _2058, _2048);
    float4 _2069 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5892, float3(0.0), isnan(_5892)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5892, float3(0.0), isnan(_5892)), level(0.0)).xyzw;
    float _2071 = _2069.x;
    float _2073 = _2069.y;
    float _2075 = _2069.z;
    float _2077 = _2069.w;
    float2 _5908 = float2(_2064, _2050);
    float3 _2079 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5908, float2(0.0), isnan(_5908)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5908, float2(0.0), isnan(_5908)), level(0.0)).xyz;
    float _2081 = _2079.x;
    float _2083 = _2079.y;
    float _2085 = _2079.z;
    float _2087 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2089 = -_1090;
    float _2091 = _2089 + 1.0;
    float _2093 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2095 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2087);
    float _2097 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2093);
    float _2099 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2095);
    float _2101 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2103 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2097);
    float _2105 = _2099 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2107 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2101);
    float _2109 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2103);
    float _2111 = 1.0 / _2105;
    float _2113 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2107);
    float _2115 = _2109 + _2010;
    float _2117 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2119 = _2042 + _2010;
    float _2121 = _2115 * 0.5;
    bool _2123 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2125 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2127 = _2123 || _2125;
    bool _2129 = isnan(0.5);
    bool _2131 = _2127 || _2129;
    float _2133 = _2117 + _2105;
    float _2135 = _2119 * 0.5;
    out.gl_Position.x = _2042;
    out.gl_Position.y = _2044;
    out.gl_Position.z = _2109;
    out.gl_Position.w = _2010;
    float _2137 = _2133 * _2111;
    float _2139 = _2137 * 0.5;
    float _2141 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2143 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2141);
    float _2145 = 1.0 / _2143;
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2149 = _2145 * _2147;
    float _2151 = abs(_2149);
    float _2153 = log2(_2151);
    bool _2155 = _2149 <= 8000.0;
    bool _2157 = isnan(_2149);
    bool _2159 = _2155 || _2157;
    bool _2161 = isnan(8000.0);
    bool _2163 = _2159 || _2161;
    float _2165 = float(_2163);
    float _2167 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2169 = exp2(_2167);
    float _2171 = fma(_2169, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2173 = precise::clamp(_2171, 0.0, 1.0);
    float _2175 = fma(_2173, -2.0, 3.0);
    float _2177 = _2173 * _2173;
    float _2179 = in.m_91.x;
    float _2181 = _2177 * _2175;
    float _2183 = -_2181;
    float _2185 = _2183 + 1.0;
    float _2187 = fma(_2185, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2181);
    float _2189 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2191 = _1962;
    float _2193 = _2091;
    float _2195 = _2135;
    float _2197 = _2010;
    float _2199 = _2109;
    float _2201 = _2044;
    float _2203 = _2042;
    if (!_2131)
    {
        _2191 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2205 = _2191;
    float _2207 = _2165 * _2187;
    float _2209 = exp2(_2189);
    float _2211 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2213 = _2091 * _2211;
    float _2215 = precise::clamp(_2213, 0.0, 1.0);
    float _2217 = _2205;
    if (!_2131)
    {
        float _2219 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2221 = _2205 + _2219;
        _2193 = _2221;
    }
    float _2223 = _2193;
    if (_2131)
    {
        _2217 = 1.0;
    }
    float _2225 = _2217;
    float _2227 = -_2215;
    float _2229 = fma(_2227, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2231 = _2223;
    float _2233 = _2229;
    float _2235 = _2225;
    if (!_2131)
    {
        float _2237 = 1.0 / _2223;
        _2231 = _2237;
    }
    float _2239 = _2231;
    float _2241 = _2229 * _2179;
    if (!_2131)
    {
        float _2243 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2245 = _2149 + _2243;
        _2233 = _2245;
    }
    float _2247 = _2233;
    float _2249 = _2010 * 0.5;
    float _2251 = -_2209;
    float _2253 = _2251 + 1.0;
    float _2255 = _2241 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2257 = fma(_2044, -0.5, _2249);
    float _2259 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_93.x = _2255;
    float _2261 = -_2259;
    float _2263 = _2261 + 1.0;
    out.m_95.x = _2135;
    out.m_95.y = _2257;
    out.m_95.z = _2121;
    out.m_95.w = _2010;
    float _2265 = _2257;
    if (!_2131)
    {
        float _2267 = _2247 * _2239;
        float _2269 = precise::clamp(_2267, 0.0, 1.0);
        _2235 = _2269;
    }
    float _2271 = _2235;
    bool _2273 = _1776 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2275 = isnan(_1776);
    bool _2277 = _2273 || _2275;
    bool _2279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2281 = _2277 || _2279;
    float _2283 = _2271 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    if (!_2281)
    {
        _2265 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2285 = _2265;
    float _2287 = _2285;
    float _2289 = _2285;
    if (!_2281)
    {
        _2195 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2291 = _2195;
    float _2293 = _2291;
    float _2295 = _2291;
    if (!_2281)
    {
        _2197 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2297 = _2197;
    float _2299 = _2297;
    float _2301 = _2297;
    if (!_2281)
    {
        _2199 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2303 = _2199;
    float _2305 = _2303;
    float _2307 = _2303;
    if (!_2281)
    {
        _2201 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2309 = _2201;
    float _2311 = _2309;
    float _2313 = _2309;
    if (!_2281)
    {
        _2203 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2315 = _2203;
    float _2317 = _2259 * _2066;
    float _2319 = _2077 * _2263;
    float _2321 = _2077 * _2317;
    float _2323 = _2085 * _2317;
    float _2325 = fma(_2081, _2321, _2071);
    float _2327 = fma(_2083, _2321, _2073);
    float _2329 = fma(_2077, _2323, _2075);
    out.m_97.x = _2325;
    out.m_97.y = _2327;
    out.m_97.z = _2329;
    out.m_97.w = _2319;
    bool _2331 = !_2281;
    float _2333 = _2315;
    float _2335 = _2315;
    if (!_2331)
    {
        bool _2337 = _1776 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2339 = isnan(_1776);
        bool _2341 = _2337 || _2339;
        bool _2343 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2345 = _2341 || _2343;
        if (!_2345)
        {
            float _2347 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2349 = _1776 + _2347;
            float _2351 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2353 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2351;
            float _2355 = 1.0 / _2353;
            float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2359 = _2357 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2363 = _2361 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2367 = _2365 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2369 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2371 = _2369 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2375 = _2373 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2377 = _2349 * _2355;
            float _2379 = precise::clamp(_2377, 0.0, 1.0);
            float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2385 = fma(_2379, _2359, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2387 = fma(_2379, _2383, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2389 = fma(_2379, _2363, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2391 = fma(_2379, _2367, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2393 = fma(_2379, _2371, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2395 = fma(_2379, _2375, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2295 = _2387;
            _2313 = _2393;
            _2289 = _2385;
            _2307 = _2391;
            _2301 = _2389;
            _2335 = _2395;
            _2397 = true;
        }
        else
        {
            bool _2399 = _1776 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2401 = isnan(_1776);
            bool _2403 = _2399 || _2401;
            bool _2405 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2407 = _2403 || _2405;
            if (!_2407)
            {
                _2287 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2409 = _2287;
            _2289 = _2409;
            if (!_2407)
            {
                _2293 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2411 = _2293;
            _2295 = _2411;
            if (!_2407)
            {
                _2299 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2413 = _2299;
            _2301 = _2413;
            if (!_2407)
            {
                _2305 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2415 = _2305;
            _2307 = _2415;
            if (!_2407)
            {
                _2311 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2417 = _2311;
            _2313 = _2417;
            if (!_2407)
            {
                _2333 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2419 = _2333;
            bool _2421 = !_2407;
            _2335 = _2419;
            if (!_2421)
            {
                bool _2423 = _1776 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2425 = isnan(_1776);
                bool _2427 = _2423 || _2425;
                bool _2429 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2431 = _2427 || _2429;
                if (!_2431)
                {
                    float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2435 = _1776 + _2433;
                    float _2437 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2439 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2437;
                    float _2441 = 1.0 / _2439;
                    float _2443 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2445 = _2443 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2447 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2449 = _2447 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2455 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2457 = _2455 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2461 = _2459 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2463 = _2435 * _2441;
                    float _2465 = precise::clamp(_2463, 0.0, 1.0);
                    float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2469 = _2467 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2471 = fma(_2465, _2445, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2473 = fma(_2465, _2469, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2475 = fma(_2465, _2449, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2477 = fma(_2465, _2453, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2479 = fma(_2465, _2457, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2481 = fma(_2465, _2461, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2295 = _2473;
                    _2313 = _2479;
                    _2289 = _2471;
                    _2307 = _2477;
                    _2301 = _2475;
                    _2335 = _2481;
                    _2397 = true;
                }
                else
                {
                    _2295 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2313 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2289 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2307 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2301 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2335 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2397 = false;
    float _2483 = _2295;
    float _2485 = _2313;
    float _2487 = _2289;
    float _2489 = _2307;
    float _2491 = _2301;
    float _2493 = _2335;
    float _2495 = fma(_1550, -0.5, 0.5);
    float _2497 = precise::clamp(_2495, 0.0, 1.0);
    float _2499 = -_2483;
    float _2501 = _2499 + _2485;
    float _2503 = _2283 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2505 = -_2487;
    float _2507 = _2505 + _2489;
    float _2509 = fma(_2497, _2501, _2483);
    out.m_99.x = 0.0;
    float _2511 = -_2491;
    float _2513 = _2511 + _2493;
    float _2515 = fma(_2497, _2507, _2487);
    float _2517 = _2509 * 0.586610972881317138671875;
    out.m_53.x = _2503;
    bool _2519 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2521 = fma(_2497, _2513, _2491);
    float _2523 = fma(_2515, 0.298911988735198974609375, _2517);
    bool _2525 = _2271 > 0.0;
    bool _2527 = isnan(_2271);
    bool _2529 = _2525 || _2527;
    bool _2531 = isnan(0.0);
    bool _2533 = _2529 || _2531;
    float _2535 = fma(_2521, 0.114477999508380889892578125, _2523);
    float _2537 = -_2535;
    float _2539 = _2515 + _2537;
    float _2541 = -_2535;
    float _2543 = _2509 + _2541;
    float _2545 = -_2535;
    float _2547 = _2521 + _2545;
    float _2549 = fma(_2539, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2535);
    float _2551 = fma(_2543, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2535);
    float _2553 = fma(_2547, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2535);
    bool _2555 = !_2519;
    if (!_2555)
    {
        float _2557 = -_1746;
        float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2561 = -_1748;
        float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2565 = -_1750;
        float _2567 = _2565 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2569 = _2559 * _2559;
        float _2571 = fma(_2563, _2563, _2569);
        float _2573 = fma(_2567, _2567, _2571);
        float _2575 = sqrt(_2573);
        float _2577 = rsqrt(_2573);
        float _2579 = -_2575;
        float _2581 = _2579 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2583 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2585 = precise::clamp(_2583, 0.0, 1.0);
        float _2587 = _2563 * _2577;
        float _2589 = _2559 * _2577;
        float _2591 = abs(_2585);
        float _2593 = log2(_2591);
        float _2595 = _2567 * _2577;
        float _2597 = _2587 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2599 = _1550 * _2589;
        float _2601 = -_2589;
        float _2603 = -_2597;
        float _2605 = fma(_2601, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2603);
        float _2607 = fma(_1530, _2587, _2599);
        float _2609 = -_2595;
        float _2611 = fma(_2609, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2605);
        float _2613 = fma(_1552, _2595, _2607);
        float _2615 = precise::clamp(_2613, 0.0, 1.0);
        float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2619 = _2611 + _2617;
        float _2621 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2623 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2625 = precise::clamp(_2623, 0.0, 1.0);
        float _2627 = exp2(_2621);
        float _2629 = _2627 * _2625;
        float _2631 = _2615 * _2629;
        float _2633 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2635 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2637 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _2633;
        out.m_99.y = _2635;
        out.m_99.z = _2637;
    }
    out.m_101.x = _2549;
    out.m_101.y = _2551;
    out.m_101.z = _2553;
    if (_2533)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2639 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2639;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2397 = false;
    bool _1602 = false;
    bool _508 = false;
    bool _392 = false;
    bool _224 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_50.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_53.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2695 = as_type<float>(_136);
        out.gl_Position.z = _2695;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_55.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = _152;
    if (_148)
    {
        float _156 = float(_120);
        _130 = _156;
    }
    float _158 = _130;
    bool _160 = _152 >= _158;
    bool _162 = !_148;
    bool _164 = _160 || _162;
    float _166 = _158;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_53.x = 0.0;
    }
    int _170 = 0;
    if (_164)
    {
        float _172 = _168 * 5.0;
        _170 = as_type<int>(_172);
    }
    int _174 = _170;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2765 = as_type<float>(_174);
        out.gl_Position.z = _2765;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = _178 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _186 = _178 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _188 = _178 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _190 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].x, _184);
    float _192 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].x, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].x, _188);
    float _196 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[4].z, _190);
    float _198 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[5].z, _192);
    float _200 = fma(_180, (*spvDescriptorSet0.vp_c10)._m0[6].z, _194);
    bool _202 = !_182;
    float _204 = _200;
    float _222;
    if (!_202)
    {
        float _206 = in.m_59.x;
        float _208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _210 = _206 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _212 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _214 = _212 * _208;
        float _216 = floor(_214);
        float _218 = -_216;
        float _220 = _214 + _218;
        _222 = _220;
        _224 = true;
    }
    else
    {
        float _226 = float(_120);
        float _228 = 1.0 / _226;
        float _230 = _152 * _228;
        _222 = _230;
    }
    _224 = false;
    float _232 = _222;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = _232 + _234;
    bool _238 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _240 = isnan(_232);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _252 = _232 + _250;
    bool _254 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _256 = isnan(_232);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _270 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _274 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _276 = isnan(_232);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = -_248;
    float _288 = _286 + 1.0;
    float _290 = 1.0 / _272;
    float _292 = _284 * _288;
    float _294 = -_284;
    float _296 = _294 + 1.0;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _298;
    bool _302 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _304 = 1.0 / _268;
    float _306 = _264 * _296;
    float _308 = -_264;
    float _310 = _308 + 1.0;
    float _312 = _252 * _290;
    float _314 = _236 * _304;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _320;
    float _324 = fma(_300, _314, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _326 = fma(_318, _314, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _328 = fma(_322, _314, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _330 = _324 * _306;
    float _332 = _326 * _306;
    float _334 = _328 * _306;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _348 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[143].x, _330);
    float _350 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[143].y, _332);
    float _352 = fma(_338, _312, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _354 = fma(_342, _312, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _356 = fma(_346, _312, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _358 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[143].z, _334);
    float _360 = fma(_352, _292, _348);
    float _362 = fma(_354, _292, _350);
    float _364 = fma(_356, _292, _358);
    float _366 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[145].x, _360);
    float _368 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[145].y, _362);
    float _370 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[145].z, _364);
    bool _372 = !_302;
    float _390;
    if (!_372)
    {
        float _374 = in.m_59.x;
        float _376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _378 = _374 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _380 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _382 = _380 * _376;
        float _384 = floor(_382);
        float _386 = -_384;
        float _388 = _382 + _386;
        _390 = _388;
        _392 = true;
    }
    else
    {
        float _394 = float(_120);
        float _396 = 1.0 / _394;
        float _398 = _152 * _396;
        _390 = _398;
    }
    _392 = false;
    float _400 = _390;
    bool _402 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _404 = isnan(_400);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _418 = _400 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _420 = isnan(_400);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _436 = _400 + _434;
    float _438 = -_412;
    float _440 = _438 + 1.0;
    bool _442 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _444 = 1.0 / _416;
    float _446 = _428 * _440;
    float _448 = -_428;
    float _450 = _448 + 1.0;
    float _452 = _432 * _444;
    float _454 = fma(_452, _436, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _456 = _454 * _446;
    float _458 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[115].x, _456);
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _466 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[116].x, _458);
    float _468 = _460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _470 = _462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _472 = _464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _474 = _466 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _476 = in.m_61.x;
    float _478 = in.m_61.y;
    float _480 = in.m_61.z;
    out.m_63.x = _468;
    out.m_63.y = _470;
    out.m_63.z = _472;
    out.m_63.w = _474;
    float _482 = _370 * _480;
    float _484 = _368 * _478;
    float _486 = _366 * _476;
    bool _488 = !_442;
    float _506;
    if (!_488)
    {
        float _490 = in.m_59.x;
        float _492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _494 = _490 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _496 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[11].w, _152);
        float _498 = _496 * _492;
        float _500 = floor(_498);
        float _502 = -_500;
        float _504 = _498 + _502;
        _506 = _504;
        _508 = true;
    }
    else
    {
        float _510 = float(_120);
        float _512 = 1.0 / _510;
        float _514 = _152 * _512;
        _506 = _514;
    }
    _508 = false;
    float _516 = _506;
    float _518 = in.m_59.z;
    float _520 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _522 = log2(_520);
    float _524 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _526 = in.m_59.x;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _534 = _532 != 0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _538 = _536 != 0;
    float _540 = in.m_59.y;
    bool _542 = !_534;
    int _544 = _542 ? 0 : 1;
    float _546 = _518 * 2.0;
    float _548 = _526 * 2.0;
    float _550 = floor(_546);
    float _552 = _540 * 2.0;
    float _554 = _540 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _556 = floor(_548);
    float _558 = floor(_552);
    bool _560 = _550 > 0.0;
    float _562 = _526 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _564 = _550 >= 0.0;
    bool _566 = isnan(_550);
    bool _568 = _564 || _566;
    bool _570 = isnan(0.0);
    bool _572 = _568 || _570;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _578 = _526 + _540;
    int _580 = _572 ? 0 : 1;
    float _582 = -_574;
    float _584 = fma(_562, 2.0, _582);
    float _586 = _522 * _152;
    float _588 = _578 + (-1.0);
    int _590 = ~_580;
    int _592 = _590 + 1;
    int _594 = _592 + 1;
    float _596 = fma(_554, -2.0, _576);
    bool _598 = _556 >= 0.0;
    bool _600 = isnan(_556);
    bool _602 = _598 || _600;
    bool _604 = isnan(0.0);
    bool _606 = _602 || _604;
    float _608 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _610 = _594;
    int _612 = as_type<int>(_518);
    if (!_560)
    {
        int _614 = ~_580;
        int _616 = _614 + 1;
        _610 = _616;
    }
    int _618 = _610;
    bool _620 = _558 > 0.0;
    float _622 = exp2(_586);
    bool _624 = _558 >= 0.0;
    bool _626 = isnan(_558);
    bool _628 = _624 || _626;
    bool _630 = isnan(0.0);
    bool _632 = _628 || _630;
    int _634 = _606 ? 0 : 1;
    bool _636 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _638 = isnan(1.0);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _644 = _640 || _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _648 = 1.0 + _646;
    float _650 = in.m_65.x;
    float _652 = in.m_65.y;
    float _654 = in.m_65.z;
    bool _656 = _556 > 0.0;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _660 = 1.0 / _648;
    bool _662 = !_530;
    int _664 = _662 ? 0 : 1;
    float _666 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[78].w, _658);
    float _668 = -_622;
    float _670 = _668 + 1.0;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _674 = abs(_664);
    float _676 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _666);
    bool _678 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _680 = isnan(0.0);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _686 = _682 || _684;
    float _688 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[78].z, _672);
    float _690 = float(_674);
    float _692 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _596);
    float _694 = float(_618);
    float _696 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _688);
    float _698 = _686 ? _670 : 0.0;
    float _700 = -_152;
    float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[76].x, _584);
    int _704 = ~_634;
    int _706 = _704 + 1;
    int _708 = _706 + 1;
    float _710 = _690 * _694;
    int _712 = _708;
    if (!_656)
    {
        int _714 = ~_634;
        int _716 = _714 + 1;
        _712 = _716;
    }
    int _718 = _712;
    if (_644)
    {
        float _720 = _698 * _660;
        _154 = _720;
    }
    float _722 = _154;
    int _724 = abs(_544);
    float _726 = _710 * (-2.0);
    float _728 = float(_718);
    float _730 = _526 + (-0.5);
    int _732 = _632 ? 0 : 1;
    float _734 = fma(_726, _650, _650);
    bool _736 = !_538;
    int _738 = _736 ? 0 : 1;
    float _740 = fma(_608, _726, _608);
    float _742 = float(_724);
    float _744 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[196].x, _734);
    int _746 = ~_732;
    int _748 = _746 + 1;
    int _750 = _748 + 1;
    float _752 = _540 + _518;
    int _754 = _750;
    if (!_620)
    {
        int _756 = ~_732;
        int _758 = _756 + 1;
        _754 = _758;
    }
    int _760 = _754;
    float _762 = _742 * _728;
    int _764 = abs(_738);
    float _766 = fma(_740, _722, _744);
    float _768 = float(_760);
    float _770 = _752 + (-1.0);
    float _772 = float(_764);
    float _774 = _762 * (-2.0);
    float _776 = _766 * 0.15915493667125701904296875;
    float _778 = _772 * _768;
    float _780 = _540 + (-0.5);
    float _782 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _784 = fma(_774, _652, _652);
    float _786 = _526 + _518;
    float _788 = _778 * (-2.0);
    float _790 = fma(_782, _774, _782);
    float _792 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[196].y, _784);
    float _794 = _786 + (-1.0);
    float _796 = fma(_788, _654, _654);
    float _798 = fma(_790, _722, _792);
    float _800 = _776 * 6.283185482025146484375;
    float _802 = sin(_800);
    float _804 = in.m_67.x;
    float _806 = in.m_67.y;
    float _808 = in.m_67.z;
    float _810 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _812 = _518 + (-0.5);
    float _814 = _798 * 0.15915493667125701904296875;
    float _816 = fma(_810, _788, _810);
    float _818 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[196].z, _796);
    float _820 = _776 * 6.283185482025146484375;
    float _822 = cos(_820);
    float _824 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _826 = fma(_816, _722, _818);
    float _828 = _826 * 0.15915493667125701904296875;
    float _830 = _814 * 6.283185482025146484375;
    float _832 = sin(_830);
    float _834 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _836 = _814 * 6.283185482025146484375;
    float _838 = cos(_836);
    float _840 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _804);
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _806);
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _808);
    float _846 = _840 * _824;
    float _848 = _842 * _524;
    float _850 = _844 * _834;
    float _852 = _828 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = in.m_50.x;
    float _858 = in.m_50.y;
    float _860 = in.m_50.z;
    float _862 = _802 * _832;
    float _864 = _822 * _832;
    float _866 = _828 * 6.283185482025146484375;
    float _868 = sin(_866);
    float _870 = _822 * _838;
    float _872 = _802 * _838;
    float _874 = _822 * _854;
    float _876 = _802 * _854;
    float _878 = _838 * _854;
    float _880 = _832 * _854;
    float _882 = _874 * _848;
    float _884 = fma(_868, _870, _862);
    float _886 = -_864;
    float _888 = fma(_868, _872, _886);
    float _890 = fma(_868, _862, _870);
    float _892 = -_872;
    float _894 = fma(_868, _864, _892);
    float _896 = -_848;
    float _898 = _868 * _896;
    float _900 = fma(_884, _846, _882);
    float _902 = _876 * _848;
    float _904 = _858 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _906 = fma(_878, _846, _898);
    float _908 = fma(_894, _850, _900);
    float _910 = fma(_888, _846, _902);
    float _912 = _858 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _914 = fma(_880, _850, _906);
    float _916 = _908 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _918 = _908 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _920 = fma(_890, _850, _910);
    float _922 = fma(_856, (*spvDescriptorSet0.vp_c10)._m0[4].x, _912);
    float _924 = fma(_856, (*spvDescriptorSet0.vp_c10)._m0[6].x, _904);
    float _926 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[24].x, _916);
    float _928 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[26].x, _918);
    float _930 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[4].z, _922);
    float _932 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[6].z, _924);
    float _934 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[24].z, _926);
    float _936 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[26].z, _928);
    float _938 = _930 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _940 = _932 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _942 = _934 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _944 = _936 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _946 = _858 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _948 = _938 + _942;
    float _950 = _940 + _944;
    float _952 = fma(_856, (*spvDescriptorSet0.vp_c10)._m0[5].x, _946);
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _956 = _948 + _954;
    float _958 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _960 = _950 + _958;
    float _962 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[5].z, _952);
    float _964 = _956 * _956;
    float _966 = _960 * _960;
    float _968 = _964 + _966;
    float _970 = sqrt(_968);
    bool _972 = _970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _974 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _976 = _970 + _974;
    float _978 = 0.0;
    float _980 = _968;
    float _982 = _948;
    float _984 = _950;
    float _986 = _890;
    float _988 = _964;
    float _990 = _966;
    if (_972)
    {
        float _992 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _978 = _992;
    }
    float _994 = _978;
    if (_972)
    {
        float _996 = rsqrt(_968);
        _980 = _996;
    }
    float _998 = _980;
    float _1000 = _994;
    if (_972)
    {
        float _1002 = _976 * _994;
        _1000 = _1002;
    }
    float _1004 = _1000;
    float _1006 = _908 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1008 = _962 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1010 = _1004;
    if (_972)
    {
        float _1012 = _1004 * 0.15915493667125701904296875;
        _1010 = _1012;
    }
    float _1014 = _1010;
    float _1016 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1006);
    float _1018 = _856;
    if (_972)
    {
        float _1020 = _1014 * 6.283185482025146484375;
        float _1022 = sin(_1020);
        _1018 = _1022;
    }
    float _1024 = _1018;
    float _1026 = fma(_920, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1016);
    float _1028 = _1026 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1030 = fma(_940, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1032 = fma(_938, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1034 = _1008 + _1028;
    float _1036 = floor(_1030);
    float _1038 = _1028;
    float _1040 = _1034;
    if (_972)
    {
        float _1042 = _1034 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1038 = _1042;
    }
    float _1044 = _1038;
    float _1046 = _1024;
    if (_972)
    {
        float _1048 = fma(_1024, _1044, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1046 = _1048;
    }
    float _1050 = _1046;
    float _1052 = floor(_1032);
    float _1054 = _1050;
    if (_972)
    {
        float _1056 = _998 * _1050;
        _1054 = _1056;
    }
    float _1058 = _1054;
    if (_972)
    {
        float _1060 = fma(_956, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _982 = _1060;
    }
    float _1062 = _982;
    if (_972)
    {
        float _1064 = fma(_960, _1058, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _984 = _1064;
    }
    float _1066 = _984;
    float _1068 = -_1036;
    float _1070 = _1030 + _1068;
    float _1072 = fma(_1062, 6.2500002968590706586837768554688e-05, 0.5);
    float _1074 = fma(_1066, 6.2500002968590706586837768554688e-05, 0.5);
    float _1076 = -_1052;
    float _1078 = _1032 + _1076;
    float2 _4196 = float2(_1072, _1074);
    float3 _1082 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4196, float2(0.0), isnan(_4196)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4196, float2(0.0), isnan(_4196)), level(0.0)).xyz;
    float _1084 = _1082.x;
    float _1086 = _1082.y;
    float _1088 = _1082.z;
    float2 _4212 = float2(_1078, _1070);
    float _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4212, float2(0.0), isnan(_4212)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4212, float2(0.0), isnan(_4212)), level(0.0)).x;
    float _1092 = in.m_69.y;
    float _1094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1096 = in.m_59.w;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1100 = _1098 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1104 = _1102 != 0;
    float _1106 = in.m_69.x;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1108;
    bool _1112 = _540 > 0.5;
    float _1114 = 1.0 / _1100;
    float _1116 = in.m_71.w;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1120 = _1118 != 0;
    bool _1122 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1124 = isnan(_516);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1136 = _1134 != 0;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1140 = _1138 != 0;
    float _1142 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1144 = -_1092;
    float _1146 = _1144 + 1.0;
    float _1148 = _1110 * _1114;
    bool _1150 = _1096 > 0.5;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1154 = _516 + _1152;
    bool _1156 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1158 = isnan(_516);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = -_1132;
    float _1170 = _1168 + 1.0;
    int _1172 = _1150 ? as_type<int>(_1146) : as_type<int>(_1092);
    float _1174 = fma(_1148, _1154, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1176 = _1150;
    float _1178 = _1092;
    bool _1180 = _1120;
    int _1182 = as_type<int>(_1146);
    float _1184 = _1094;
    if (_1104)
    {
        bool _1186 = _526 > 0.5;
        _1176 = _1186;
    }
    bool _1188 = _1176;
    float _1190 = _1166 * _1170;
    float _1192 = in.m_73.x;
    float _1194 = in.m_73.y;
    float _1196 = in.m_73.z;
    float _1198 = _1140 ? as_type<float>(_1172) : _1092;
    float _1200 = -_1166;
    float _1202 = _1200 + 1.0;
    bool _1204 = _806 != 0.0;
    bool _1206 = isnan(_806);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan(0.0);
    bool _1212 = _1208 || _1210;
    float _1214 = _1174 * _1190;
    float _1216 = _1190;
    if (_1120)
    {
        float _1218 = _1112 ? _1146 : _1092;
        _1178 = _1218;
    }
    float _1220 = _1178;
    float _1222 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1224 = _804 == 0.0;
    bool _1226 = !_1212;
    bool _1228 = _1224 && _1226;
    out.m_75.w = _1116;
    float _1230 = _1116;
    if (_1136)
    {
        bool _1232 = _518 > 0.5;
        _1180 = _1232;
    }
    bool _1234 = _1180;
    if (_1104)
    {
        float _1236 = -_1106;
        float _1238 = _1236 + 1.0;
        _612 = as_type<int>(_1238);
    }
    int _1240 = _612;
    bool _1242 = _808 == 0.0;
    bool _1244 = _1242 && _1228;
    float _1246 = fma(_1222, _1220, -0.5);
    float _1248 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1214);
    float _1250 = _1246;
    if (_1136)
    {
        float _1252 = -_1106;
        float _1254 = _1252 + 1.0;
        _1182 = as_type<int>(_1254);
    }
    int _1256 = _1182;
    float _1258 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1260 = as_type<float>(_1256);
    if (!_1104)
    {
        _1230 = _1106;
    }
    float _1262 = _1230;
    float _1264 = -_692;
    float _1266 = fma(_676, _1246, _1264);
    float _1268 = _1262;
    if (_1104)
    {
        float _1270 = _1188 ? as_type<float>(_1240) : _1106;
        _1268 = _1270;
    }
    float _1272 = _1268;
    float _1274 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1248);
    float _1276 = in.m_77.x;
    float _1278 = in.m_77.y;
    float _1280 = in.m_77.z;
    float _1282 = in.m_77.w;
    if (!_1136)
    {
        _1216 = _1106;
    }
    float _1284 = _1216;
    float _1286 = _1284;
    if (_1136)
    {
        float _1288 = _1234 ? as_type<float>(_1256) : _1106;
        _1286 = _1288;
    }
    float _1290 = _1286;
    float _1292 = fma(_1258, _1272, -0.5);
    float _1294 = _1192;
    if (_1244)
    {
        _1184 = _1192;
    }
    float _1296 = _1184;
    float _1298 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1300 = fma(_696, _1292, _702);
    float _1302 = _1296;
    if (_1244)
    {
        _1260 = _1296;
    }
    float _1304 = _1260;
    float _1306 = _874 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1308 = _1304;
    if (!_1244)
    {
        _1302 = _1192;
    }
    float _1310 = _1302;
    if (!_1244)
    {
        float _1312 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1310);
        _1308 = _1312;
    }
    float _1314 = _1308;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1244)
    {
        _1250 = _1196;
    }
    float _1320 = _1250;
    float _1322 = _1320;
    if (!_1244)
    {
        float _1324 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1196);
        _1322 = _1324;
    }
    float _1326 = _1322;
    if (_1244)
    {
        _1294 = _1194;
    }
    float _1328 = _1294;
    float _1330 = _1328;
    if (!_1244)
    {
        float _1332 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1194);
        _1330 = _1332;
    }
    float _1334 = _1330;
    float _1336 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1340 = _1278 * _1196;
    float _1342 = _1276 * _1194;
    float _1344 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1346 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1348 = _1280 * _1310;
    float _1350 = -_1340;
    float _1352 = fma(_1280, _1194, _1350);
    float _1354 = -_1342;
    float _1356 = fma(_1278, _1310, _1354);
    float _1358 = _874 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1360 = _874 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1362 = _884 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1364 = _1352 * _1282;
    out.m_79.x = _1344;
    out.m_79.y = _1346;
    out.m_79.z = _1336;
    out.m_79.w = _1298;
    float _1366 = _884 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1368 = -_1348;
    float _1370 = fma(_1276, _1196, _1368);
    float _1372 = _884 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1374 = _1370 * _1282;
    float _1376 = _1356 * _1282;
    float _1378 = -_868;
    float _1380 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1358);
    float _1382 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1362);
    float _1384 = _894 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1386 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1366);
    float _1388 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1372);
    float _1390 = _894 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1392 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1384);
    float _1394 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1382);
    float _1396 = -_868;
    float _1398 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1306);
    float _1400 = _1382;
    float _1402 = _1376;
    if (_972)
    {
        float _1404 = _1014 * 6.283185482025146484375;
        float _1406 = cos(_1404);
        _1400 = _1406;
    }
    float _1408 = _1400;
    float _1410 = _894 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1412 = -_868;
    float _1414 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1360);
    float _1416 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1390);
    float _1418 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1380);
    float _1420 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1398);
    float _1422 = fma(_880, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1410);
    float _1424 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1414);
    float _1426 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1386);
    float _1428 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1388);
    float _1430 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1416);
    float _1432 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1392);
    float _1434 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1422);
    float _1436 = _1422;
    if (_972)
    {
        float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1440 = _1062 + _1438;
        _1436 = _1440;
    }
    float _1442 = _1436;
    float _1444 = _1418 * _1278;
    float _1446 = _1420 * _1278;
    float _1448 = _1408;
    if (_972)
    {
        float _1450 = _1408 + (-1.0);
        _986 = _1450;
    }
    float _1452 = _986;
    float _1454 = _1452;
    if (_972)
    {
        float _1456 = _1442 * _1442;
        _988 = _1456;
    }
    float _1458 = _988;
    float _1460 = _1424 * _1278;
    float _1462 = _1418 * _1334;
    if (_972)
    {
        float _1464 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1454 = _1464;
    }
    float _1466 = _1454;
    float _1468 = _1374 * _1418;
    float _1470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1472 = _1420 * _1334;
    if (_972)
    {
        float _1474 = fma(_1034, _1408, _1466);
        _1040 = _1474;
    }
    float _1476 = _1040;
    if (_972)
    {
        float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1480 = _1066 + _1478;
        _1448 = _1480;
    }
    float _1482 = _1448;
    float _1484 = _1424 * _1334;
    float _1486 = _1374 * _1420;
    float _1488 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1490 = _1476 + _1488;
    if (_972)
    {
        float _1492 = _1482 * _1482;
        _990 = _1492;
    }
    float _1494 = _990;
    float _1496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1498 = _1374 * _1424;
    float _1500 = fma(_1490, _1490, _1458);
    float _1502 = fma(_1426, _1314, _1462);
    float _1504 = fma(_1394, _1314, _1472);
    float _1506 = fma(_1426, _1276, _1444);
    float _1508 = _1500 + _1494;
    float _1510 = fma(_1364, _1426, _1468);
    float _1512 = fma(_1394, _1276, _1446);
    float _1514 = fma(_1428, _1276, _1460);
    float _1516 = fma(_1364, _1394, _1486);
    float _1518 = fma(_1428, _1314, _1484);
    float _1520 = sqrt(_1508);
    float _1522 = _1198 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1524 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1526 = fma(_1364, _1428, _1498);
    float _1528 = _1300 + 0.5;
    float _1530 = fma(_1432, _1326, _1502);
    float _1532 = fma(_1432, _1280, _1506);
    float _1534 = fma(_1430, _1280, _1512);
    float _1536 = fma(_1434, _1280, _1514);
    float _1538 = fma(_1376, _1430, _1516);
    float _1540 = _1522 * _1470;
    float _1542 = _1524 * _1496;
    float _1544 = fma(_1376, _1432, _1510);
    float _1546 = _1266 + 0.5;
    float _1548 = fma(_1376, _1434, _1526);
    float _1550 = fma(_1430, _1326, _1504);
    float _1552 = fma(_1434, _1326, _1518);
    out.m_81.x = _1532;
    out.m_81.y = _1534;
    out.m_81.z = _1536;
    bool _1554 = _1520 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1556 = isnan(_1520);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1562 = _1558 || _1560;
    out.m_83.x = _1528;
    out.m_83.y = _1546;
    out.m_83.z = _1542;
    out.m_83.w = _1540;
    out.m_85.x = _1544;
    out.m_85.y = _1538;
    out.m_85.z = _1548;
    out.m_87.x = _1530;
    out.m_87.y = _1550;
    out.m_87.z = _1552;
    float _1564 = _1528;
    float _1566 = _1532;
    if (!_1562)
    {
        _1402 = 1.0;
    }
    float _1568 = _1402;
    out.m_89.x = _1084;
    out.m_89.y = _1086;
    out.m_89.z = _1088;
    bool _1570 = !_1562;
    float _1572 = _1568;
    if (!_1570)
    {
        bool _1574 = _1520 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1576 = isnan(_1520);
        bool _1578 = _1574 || _1576;
        bool _1580 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1582 = _1578 || _1580;
        if (!_1582)
        {
            float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1586 = _1520 + _1584;
            float _1588 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1590 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1588;
            float _1592 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1594 = _1592 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1596 = 1.0 / _1590;
            float _1598 = _1586 * _1596;
            float _1600 = fma(_1598, _1594, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1572 = _1600;
            _1602 = true;
        }
        else
        {
            bool _1604 = _1520 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1606 = isnan(_1520);
            bool _1608 = _1604 || _1606;
            bool _1610 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1612 = _1608 || _1610;
            if (!_1612)
            {
                float _1614 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1616 = _1520 + _1614;
                float _1618 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1620 = _1618 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1622 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1624 = _1622 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1626 = 1.0 / _1620;
                float _1628 = _1616 * _1626;
                float _1630 = fma(_1628, _1624, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1572 = _1630;
                _1602 = true;
            }
            else
            {
                _1572 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1602 = false;
    float _1632 = _1572;
    float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1636 = _1476 + _1634;
    float _1638 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1640 = _1062 + _1638;
    float _1642 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1644 = _1066 + _1642;
    float _1646 = fma(_1636, _1632, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1648 = fma(_1640, _1632, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1650 = fma(_1644, _1632, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1652 = -_1008;
    float _1654 = _1652 + _1646;
    float _1656 = -_938;
    float _1658 = _1656 + _1648;
    float _1660 = -_940;
    float _1662 = _1660 + _1650;
    float _1664 = _1654 * _1654;
    float _1666 = fma(_1658, _1658, _1664);
    float _1668 = fma(_1662, _1662, _1666);
    float _1670 = sqrt(_1668);
    bool _1672 = _1670 > 0.0;
    float _1674 = _1632;
    float _1676 = _1650;
    float _1678 = _1658;
    float _1680 = _1654;
    if (!_1672)
    {
        _1674 = _1648;
    }
    float _1682 = _1674;
    float _1684 = _1682;
    if (!_1672)
    {
        _1564 = _1646;
    }
    float _1686 = _1564;
    bool _1688 = !_1672;
    float _1690 = _1686;
    float _1692 = _1686;
    if (!_1688)
    {
        float _1694 = _198 * _198;
        float _1696 = fma(_196, _196, _1694);
        float _1698 = fma(_200, _200, _1696);
        float _1700 = rsqrt(_1668);
        float _1702 = sqrt(_1698);
        float _1704 = _1658 * _1700;
        float _1706 = _1654 * _1700;
        float _1708 = _1662 * _1700;
        bool _1710 = _1702 > 0.0;
        float _1712 = _1702;
        _1566 = _1706;
        if (!_1710)
        {
            _1712 = _1648;
        }
        float _1714 = _1712;
        _1684 = _1714;
        if (!_1710)
        {
            _1690 = _1646;
        }
        float _1716 = _1690;
        bool _1718 = !_1710;
        _1692 = _1716;
        if (!_1718)
        {
            float _1720 = rsqrt(_1698);
            float _1722 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1724 = _198 * _1720;
            float _1726 = _196 * _1720;
            float _1728 = _200 * _1720;
            float _1730 = _1706 * _1724;
            float _1732 = fma(_1704, _1726, _1730);
            float _1734 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1736 = fma(_1708, _1728, _1732);
            float _1738 = _1736 * _1734;
            float _1740 = fma(_196, _1738, _1648);
            float _1742 = fma(_198, _1738, _1646);
            float _1744 = fma(_200, _1738, _1650);
            _1692 = _1742;
            _1684 = _1740;
            _1676 = _1744;
            _1678 = _1734;
        }
    }
    float _1746 = _1692;
    float _1748 = _1684;
    float _1750 = _1676;
    float _1752 = _1678;
    float _1754 = _1566;
    float _1756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1758 = _1746 + _1756;
    float _1760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1762 = _1748 + _1760;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1766 = _1750 + _1764;
    float _1768 = _1758 * _1758;
    float _1770 = fma(_1762, _1762, _1768);
    float _1772 = fma(_1766, _1766, _1770);
    float _1774 = rsqrt(_1772);
    float _1776 = sqrt(_1772);
    float _1778 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1780 = _1762 * _1778;
    float _1782 = _1766 * _1778;
    float _1784 = _1780 * _1780;
    float _1786 = _1782 * _1782;
    float _1788 = _1784 + _1786;
    float _1790 = sqrt(_1788);
    bool _1792 = _1790 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1796 = _1790 + _1794;
    float _1798 = _1752;
    float _1800 = _1754;
    float _1802 = _1796;
    float _1804 = _1758;
    float _1806 = _1780;
    if (_1792)
    {
        float _1808 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1798 = _1808;
    }
    float _1810 = _1798;
    if (_1792)
    {
        float _1812 = rsqrt(_1788);
        _1800 = _1812;
    }
    float _1814 = _1800;
    float _1816 = _1814;
    if (_1792)
    {
        float _1818 = _1796 * _1810;
        _1802 = _1818;
    }
    float _1820 = _1802;
    if (_1792)
    {
        float _1822 = _1820 * 0.15915493667125701904296875;
        _1680 = _1822;
    }
    float _1824 = _1680;
    float _1826 = _1766;
    if (_1792)
    {
        float _1828 = _1824 * 6.283185482025146484375;
        float _1830 = sin(_1828);
        _1826 = _1830;
    }
    float _1832 = _1826;
    float _1834 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1836 = precise::max(0.0, _1834);
    float _1838 = _1810;
    float _1840 = _1836;
    if (_1792)
    {
        float _1842 = _1824 * 6.283185482025146484375;
        float _1844 = cos(_1842);
        _1838 = _1844;
    }
    float _1846 = _1838;
    float _1848 = -_1778;
    float _1850 = -_1836;
    float _1852 = fma(_1758, _1848, _1850);
    if (_1792)
    {
        float _1854 = _1852 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1804 = _1854;
    }
    float _1856 = _1804;
    float _1858 = _1856;
    float _1860 = _1832;
    if (_1792)
    {
        float _1862 = fma(_1832, _1856, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1858 = _1862;
    }
    float _1864 = _1858;
    float _1866 = _1864;
    if (!_1792)
    {
        _1860 = _1784;
    }
    float _1868 = _1860;
    float _1870 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1872 = _1868;
    float _1874 = _1846;
    if (_1792)
    {
        float _1876 = _1846 + (-1.0);
        _1840 = _1876;
    }
    float _1878 = _1840;
    float _1880 = _1878;
    if (_1792)
    {
        float _1882 = _1814 * _1864;
        _204 = _1882;
    }
    float _1884 = _204;
    if (!_1792)
    {
        _1866 = _1852;
    }
    float _1886 = _1866;
    float _1888 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1870);
    float _1890 = _1886;
    if (_1792)
    {
        float _1892 = _1878 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1816 = _1892;
    }
    float _1894 = _1816;
    if (_1792)
    {
        float _1896 = _1780 * _1884;
        _1806 = _1896;
    }
    float _1898 = _1806;
    if (!_1792)
    {
        _1880 = _1782;
    }
    float _1900 = _1880;
    float _1902 = _1900;
    if (_1792)
    {
        float _1904 = _1782 * _1884;
        _1902 = _1904;
    }
    float _1906 = _1902;
    if (_1792)
    {
        float _1908 = fma(_1852, _1846, _1894);
        _1890 = _1908;
    }
    float _1910 = _1890;
    if (_1792)
    {
        float _1912 = _1898 * _1898;
        _1872 = _1912;
    }
    float _1914 = _1872;
    if (!_1792)
    {
        _1874 = _1786;
    }
    float _1916 = _1874;
    float _1918 = _1916;
    if (_1792)
    {
        float _1920 = _1906 * _1906;
        _1918 = _1920;
    }
    float _1922 = _1918;
    float _1924 = fma(_1910, _1910, _1914);
    float _1926 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1928 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1888);
    float _1930 = _1924 + _1922;
    float _1932 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1926);
    float _1934 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1936 = fma(_1776, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1934);
    float _1938 = precise::clamp(_1936, 0.0, 1.0);
    float _1940 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1942 = rsqrt(_1930);
    float _1944 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1932);
    float _1946 = -_1938;
    float _1948 = _1946 + 1.0;
    float _1950 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1952 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1940);
    float _1954 = _1944 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1956 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1958 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1950);
    float _1960 = abs(_1948);
    float _1962 = log2(_1960);
    float _1964 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1952);
    float _1966 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1968 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1958);
    float _1970 = _1964 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1972 = -_1966;
    float _1974 = fma(_1972, _1956, 1.0);
    float _1976 = _1968 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1978 = _1942 * _1898;
    float _1980 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1982 = _1942 * _1910;
    float _1984 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1986 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1988 = _1942 * _1906;
    float _1990 = log2(_1974);
    float _1992 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1984);
    float _1994 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1996 = -_1986;
    float _1998 = fma(_1982, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1996);
    float _2000 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1992);
    float _2002 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2004 = -_1988;
    float _2006 = fma(_2004, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1998);
    float _2008 = exp2(_1994);
    float _2010 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2000);
    float _2012 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2014 = fma(_2006, -0.5, 0.5);
    float _2016 = fma(_2006, 0.5, 0.5);
    float _2018 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2002);
    float _2020 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2012);
    float _2022 = _1982 + 1.0;
    float _2024 = 1.0 / _2010;
    float _2026 = fma(_2016, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2028 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2020);
    float _2030 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2018);
    float _2032 = _1990 * 0.693147182464599609375;
    float _2034 = fma(_2016, _2026, -0.212114393711090087890625);
    float _2036 = sqrt(_2014);
    float _2038 = -_1982;
    float _2040 = fma(_2008, _2022, _2038);
    float _2042 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2028);
    float _2044 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2030);
    float _2046 = fma(_2016, _2034, 1.570728778839111328125);
    float _2048 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2050 = fma(_2040, 0.5, 0.5);
    float _2052 = _2042 * _2024;
    float _2054 = _2044 * _2024;
    float _2056 = fma(_2052, 0.5, 0.5);
    float _2058 = fma(_2054, -0.5, 0.5);
    float _2060 = _2036 * 0.636619746685028076171875;
    float _2062 = -_2046;
    float _2064 = fma(_2060, _2062, 1.0);
    float3 _5881 = float3(_2056, _2058, _2048);
    float _2066 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5881, float3(0.0), isnan(_5881)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5881, float3(0.0), isnan(_5881)), level(0.0)).x;
    float3 _5892 = float3(_2056, _2058, _2048);
    float4 _2069 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5892, float3(0.0), isnan(_5892)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5892, float3(0.0), isnan(_5892)), level(0.0)).xyzw;
    float _2071 = _2069.x;
    float _2073 = _2069.y;
    float _2075 = _2069.z;
    float _2077 = _2069.w;
    float2 _5908 = float2(_2064, _2050);
    float3 _2079 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5908, float2(0.0), isnan(_5908)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5908, float2(0.0), isnan(_5908)), level(0.0)).xyz;
    float _2081 = _2079.x;
    float _2083 = _2079.y;
    float _2085 = _2079.z;
    float _2087 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2089 = -_1090;
    float _2091 = _2089 + 1.0;
    float _2093 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2095 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2087);
    float _2097 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2093);
    float _2099 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2095);
    float _2101 = _1008 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2103 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2097);
    float _2105 = _2099 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2107 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2101);
    float _2109 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2103);
    float _2111 = 1.0 / _2105;
    float _2113 = fma(_940, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2107);
    float _2115 = _2109 + _2010;
    float _2117 = _2113 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2119 = _2042 + _2010;
    float _2121 = _2115 * 0.5;
    bool _2123 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2125 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2127 = _2123 || _2125;
    bool _2129 = isnan(0.5);
    bool _2131 = _2127 || _2129;
    float _2133 = _2117 + _2105;
    float _2135 = _2119 * 0.5;
    out.gl_Position.x = _2042;
    out.gl_Position.y = _2044;
    out.gl_Position.z = _2109;
    out.gl_Position.w = _2010;
    float _2137 = _2133 * _2111;
    float _2139 = _2137 * 0.5;
    float _2141 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2143 = fma(_2139, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2141);
    float _2145 = 1.0 / _2143;
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2149 = _2145 * _2147;
    float _2151 = abs(_2149);
    float _2153 = log2(_2151);
    bool _2155 = _2149 <= 8000.0;
    bool _2157 = isnan(_2149);
    bool _2159 = _2155 || _2157;
    bool _2161 = isnan(8000.0);
    bool _2163 = _2159 || _2161;
    float _2165 = float(_2163);
    float _2167 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2169 = exp2(_2167);
    float _2171 = fma(_2169, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2173 = precise::clamp(_2171, 0.0, 1.0);
    float _2175 = fma(_2173, -2.0, 3.0);
    float _2177 = _2173 * _2173;
    float _2179 = in.m_91.x;
    float _2181 = _2177 * _2175;
    float _2183 = -_2181;
    float _2185 = _2183 + 1.0;
    float _2187 = fma(_2185, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2181);
    float _2189 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2191 = _1962;
    float _2193 = _2091;
    float _2195 = _2135;
    float _2197 = _2010;
    float _2199 = _2109;
    float _2201 = _2044;
    float _2203 = _2042;
    if (!_2131)
    {
        _2191 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2205 = _2191;
    float _2207 = _2165 * _2187;
    float _2209 = exp2(_2189);
    float _2211 = _2207 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2213 = _2091 * _2211;
    float _2215 = precise::clamp(_2213, 0.0, 1.0);
    float _2217 = _2205;
    if (!_2131)
    {
        float _2219 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2221 = _2205 + _2219;
        _2193 = _2221;
    }
    float _2223 = _2193;
    if (_2131)
    {
        _2217 = 1.0;
    }
    float _2225 = _2217;
    float _2227 = -_2215;
    float _2229 = fma(_2227, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2231 = _2223;
    float _2233 = _2229;
    float _2235 = _2225;
    if (!_2131)
    {
        float _2237 = 1.0 / _2223;
        _2231 = _2237;
    }
    float _2239 = _2231;
    float _2241 = _2229 * _2179;
    if (!_2131)
    {
        float _2243 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2245 = _2149 + _2243;
        _2233 = _2245;
    }
    float _2247 = _2233;
    float _2249 = _2010 * 0.5;
    float _2251 = -_2209;
    float _2253 = _2251 + 1.0;
    float _2255 = _2241 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2257 = fma(_2044, -0.5, _2249);
    float _2259 = _2253 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_93.x = _2255;
    float _2261 = -_2259;
    float _2263 = _2261 + 1.0;
    out.m_95.x = _2135;
    out.m_95.y = _2257;
    out.m_95.z = _2121;
    out.m_95.w = _2010;
    float _2265 = _2257;
    if (!_2131)
    {
        float _2267 = _2247 * _2239;
        float _2269 = precise::clamp(_2267, 0.0, 1.0);
        _2235 = _2269;
    }
    float _2271 = _2235;
    bool _2273 = _1776 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2275 = isnan(_1776);
    bool _2277 = _2273 || _2275;
    bool _2279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2281 = _2277 || _2279;
    float _2283 = _2271 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    if (!_2281)
    {
        _2265 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2285 = _2265;
    float _2287 = _2285;
    float _2289 = _2285;
    if (!_2281)
    {
        _2195 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2291 = _2195;
    float _2293 = _2291;
    float _2295 = _2291;
    if (!_2281)
    {
        _2197 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2297 = _2197;
    float _2299 = _2297;
    float _2301 = _2297;
    if (!_2281)
    {
        _2199 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2303 = _2199;
    float _2305 = _2303;
    float _2307 = _2303;
    if (!_2281)
    {
        _2201 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2309 = _2201;
    float _2311 = _2309;
    float _2313 = _2309;
    if (!_2281)
    {
        _2203 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2315 = _2203;
    float _2317 = _2259 * _2066;
    float _2319 = _2077 * _2263;
    float _2321 = _2077 * _2317;
    float _2323 = _2085 * _2317;
    float _2325 = fma(_2081, _2321, _2071);
    float _2327 = fma(_2083, _2321, _2073);
    float _2329 = fma(_2077, _2323, _2075);
    out.m_97.x = _2325;
    out.m_97.y = _2327;
    out.m_97.z = _2329;
    out.m_97.w = _2319;
    bool _2331 = !_2281;
    float _2333 = _2315;
    float _2335 = _2315;
    if (!_2331)
    {
        bool _2337 = _1776 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2339 = isnan(_1776);
        bool _2341 = _2337 || _2339;
        bool _2343 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2345 = _2341 || _2343;
        if (!_2345)
        {
            float _2347 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2349 = _1776 + _2347;
            float _2351 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2353 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2351;
            float _2355 = 1.0 / _2353;
            float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2359 = _2357 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2363 = _2361 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2367 = _2365 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2369 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2371 = _2369 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2375 = _2373 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2377 = _2349 * _2355;
            float _2379 = precise::clamp(_2377, 0.0, 1.0);
            float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2385 = fma(_2379, _2359, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2387 = fma(_2379, _2383, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2389 = fma(_2379, _2363, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2391 = fma(_2379, _2367, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2393 = fma(_2379, _2371, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2395 = fma(_2379, _2375, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2295 = _2387;
            _2313 = _2393;
            _2289 = _2385;
            _2307 = _2391;
            _2301 = _2389;
            _2335 = _2395;
            _2397 = true;
        }
        else
        {
            bool _2399 = _1776 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2401 = isnan(_1776);
            bool _2403 = _2399 || _2401;
            bool _2405 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2407 = _2403 || _2405;
            if (!_2407)
            {
                _2287 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2409 = _2287;
            _2289 = _2409;
            if (!_2407)
            {
                _2293 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2411 = _2293;
            _2295 = _2411;
            if (!_2407)
            {
                _2299 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2413 = _2299;
            _2301 = _2413;
            if (!_2407)
            {
                _2305 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2415 = _2305;
            _2307 = _2415;
            if (!_2407)
            {
                _2311 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2417 = _2311;
            _2313 = _2417;
            if (!_2407)
            {
                _2333 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2419 = _2333;
            bool _2421 = !_2407;
            _2335 = _2419;
            if (!_2421)
            {
                bool _2423 = _1776 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2425 = isnan(_1776);
                bool _2427 = _2423 || _2425;
                bool _2429 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2431 = _2427 || _2429;
                if (!_2431)
                {
                    float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2435 = _1776 + _2433;
                    float _2437 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2439 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2437;
                    float _2441 = 1.0 / _2439;
                    float _2443 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2445 = _2443 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2447 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2449 = _2447 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2455 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2457 = _2455 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2461 = _2459 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2463 = _2435 * _2441;
                    float _2465 = precise::clamp(_2463, 0.0, 1.0);
                    float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2469 = _2467 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2471 = fma(_2465, _2445, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2473 = fma(_2465, _2469, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2475 = fma(_2465, _2449, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2477 = fma(_2465, _2453, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2479 = fma(_2465, _2457, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2481 = fma(_2465, _2461, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2295 = _2473;
                    _2313 = _2479;
                    _2289 = _2471;
                    _2307 = _2477;
                    _2301 = _2475;
                    _2335 = _2481;
                    _2397 = true;
                }
                else
                {
                    _2295 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2313 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2289 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2307 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2301 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2335 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2397 = false;
    float _2483 = _2295;
    float _2485 = _2313;
    float _2487 = _2289;
    float _2489 = _2307;
    float _2491 = _2301;
    float _2493 = _2335;
    float _2495 = fma(_1550, -0.5, 0.5);
    float _2497 = precise::clamp(_2495, 0.0, 1.0);
    float _2499 = -_2483;
    float _2501 = _2499 + _2485;
    float _2503 = _2283 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2505 = -_2487;
    float _2507 = _2505 + _2489;
    float _2509 = fma(_2497, _2501, _2483);
    out.m_99.x = 0.0;
    float _2511 = -_2491;
    float _2513 = _2511 + _2493;
    float _2515 = fma(_2497, _2507, _2487);
    float _2517 = _2509 * 0.586610972881317138671875;
    out.m_53.x = _2503;
    bool _2519 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2521 = fma(_2497, _2513, _2491);
    float _2523 = fma(_2515, 0.298911988735198974609375, _2517);
    bool _2525 = _2271 > 0.0;
    bool _2527 = isnan(_2271);
    bool _2529 = _2525 || _2527;
    bool _2531 = isnan(0.0);
    bool _2533 = _2529 || _2531;
    float _2535 = fma(_2521, 0.114477999508380889892578125, _2523);
    float _2537 = -_2535;
    float _2539 = _2515 + _2537;
    float _2541 = -_2535;
    float _2543 = _2509 + _2541;
    float _2545 = -_2535;
    float _2547 = _2521 + _2545;
    float _2549 = fma(_2539, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2535);
    float _2551 = fma(_2543, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2535);
    float _2553 = fma(_2547, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2535);
    bool _2555 = !_2519;
    if (!_2555)
    {
        float _2557 = -_1746;
        float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2561 = -_1748;
        float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2565 = -_1750;
        float _2567 = _2565 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2569 = _2559 * _2559;
        float _2571 = fma(_2563, _2563, _2569);
        float _2573 = fma(_2567, _2567, _2571);
        float _2575 = sqrt(_2573);
        float _2577 = rsqrt(_2573);
        float _2579 = -_2575;
        float _2581 = _2579 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2583 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2585 = precise::clamp(_2583, 0.0, 1.0);
        float _2587 = _2563 * _2577;
        float _2589 = _2559 * _2577;
        float _2591 = abs(_2585);
        float _2593 = log2(_2591);
        float _2595 = _2567 * _2577;
        float _2597 = _2587 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2599 = _1550 * _2589;
        float _2601 = -_2589;
        float _2603 = -_2597;
        float _2605 = fma(_2601, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2603);
        float _2607 = fma(_1530, _2587, _2599);
        float _2609 = -_2595;
        float _2611 = fma(_2609, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2605);
        float _2613 = fma(_1552, _2595, _2607);
        float _2615 = precise::clamp(_2613, 0.0, 1.0);
        float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2619 = _2611 + _2617;
        float _2621 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2623 = _2619 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2625 = precise::clamp(_2623, 0.0, 1.0);
        float _2627 = exp2(_2621);
        float _2629 = _2627 * _2625;
        float _2631 = _2615 * _2629;
        float _2633 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2635 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2637 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _2633;
        out.m_99.y = _2635;
        out.m_99.z = _2637;
    }
    out.m_101.x = _2549;
    out.m_101.y = _2551;
    out.m_101.z = _2553;
    if (_2533)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2639 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2639;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

