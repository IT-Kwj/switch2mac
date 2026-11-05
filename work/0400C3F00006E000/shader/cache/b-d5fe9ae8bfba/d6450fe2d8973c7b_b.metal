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
    float4 m_81 [[user(locn2)]];
    float4 m_99 [[user(locn3)]];
    float4 m_109 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_75 [[user(locn11)]];
    float4 m_95 [[user(locn12)]];
    float4 m_101 [[user(locn13)]];
    float4 m_97 [[user(locn14)]];
    float4 m_107 [[user(locn15)]];
    float4 m_103 [[user(locn16)]];
    float4 m_105 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_93 [[attribute(0)]];
    float4 m_55 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_77 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_89 [[attribute(8)]];
    float4 m_87 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
    float4 m_63 [[attribute(11)]];
    float4 m_91 [[attribute(12)]];
    float4 m_71 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6554 = false;
    bool _1144 = false;
    bool _820 = false;
    bool _678 = false;
    bool _524 = false;
    bool _248 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _6853 = as_type<float>(_144);
        out.gl_Position.z = _6853;
    }
    if (!_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_51.w;
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
        out.m_49.x = 0.0;
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
        float _6922 = as_type<float>(_182);
        out.gl_Position.z = _6922;
    }
    if (_176)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _184 = in.m_53.x;
    float _186 = in.m_53.y;
    float _188 = in.m_53.z;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = in.m_55.x;
    float _194 = in.m_55.y;
    float _196 = in.m_55.z;
    float _198 = in.m_57.x;
    float _200 = in.m_57.y;
    float _202 = in.m_57.z;
    float _204 = in.m_59.x;
    float _206 = in.m_59.y;
    float _208 = in.m_59.z;
    float _210 = _186 * _194;
    float _212 = _186 * _200;
    float _214 = fma(_184, _192, _210);
    float _216 = _186 * _206;
    float _218 = fma(_184, _198, _212);
    float _220 = fma(_188, _196, _214);
    float _222 = fma(_184, _204, _216);
    float _224 = fma(_188, _202, _218);
    float _226 = fma(_188, _208, _222);
    bool _228 = !_190;
    float _246;
    if (!_228)
    {
        float _230 = in.m_61.x;
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
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = _256 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _256 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = 1.0 / _276;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _290 = 1.0 / _280;
    bool _292 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _294 = isnan(_256);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = 1.0 / _272;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _256 + _306;
    float _310 = _308 * _286;
    bool _312 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _314 = isnan(_256);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = 1.0 / _284;
    float _326 = _260 * _290;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _332;
    float _336 = _264 * _304;
    bool _338 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _340 = isnan(_256);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_322;
    float _352 = _350 + 1.0;
    float _354 = fma(_334, _326, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = fma(_330, _326, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _358 = _348 * _352;
    float _360 = -_348;
    float _362 = _360 + 1.0;
    float _364 = _268 * _324;
    bool _366 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _368 = isnan(_256);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _378;
    bool _382 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _384 = isnan(_256);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = fma(_380, _326, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = -_376;
    float _402 = _400 + 1.0;
    float _404 = _376 * _362;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = _302 * _402;
    float _416 = -_302;
    float _418 = _416 + 1.0;
    float _420 = fma(_396, _364, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_412, _364, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = fma(_408, _364, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = _392 * _418;
    float _428 = -_392;
    float _430 = _428 + 1.0;
    float _432 = _354 * _426;
    float _434 = _356 * _426;
    float _436 = _398 * _426;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _438;
    float _442 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _432);
    float _444 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _434);
    float _446 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].z, _436);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _452;
    float _456 = fma(_420, _414, _442);
    float _458 = fma(_422, _414, _444);
    float _460 = fma(_424, _414, _446);
    float _462 = fma(_440, _336, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _464 = fma(_450, _336, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _466 = fma(_454, _336, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _480 = fma(_462, _404, _456);
    float _482 = fma(_470, _310, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _484 = fma(_474, _310, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _486 = fma(_478, _310, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _488 = fma(_464, _404, _458);
    float _490 = fma(_466, _404, _460);
    float _492 = fma(_482, _358, _480);
    float _494 = fma(_484, _358, _488);
    float _496 = fma(_486, _358, _490);
    float _498 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[147].x, _492);
    float _500 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[147].y, _494);
    float _502 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[147].z, _496);
    bool _504 = !_288;
    float _522;
    if (!_504)
    {
        float _506 = in.m_61.x;
        float _508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _510 = _506 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[11].y, _162);
        float _514 = _512 * _508;
        float _516 = floor(_514);
        float _518 = -_516;
        float _520 = _514 + _518;
        _522 = _520;
        _524 = true;
    }
    else
    {
        float _526 = float(_128);
        float _528 = 1.0 / _526;
        float _530 = _162 * _528;
        _522 = _530;
    }
    _524 = false;
    float _532 = _522;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _536 = _532 + _534;
    float _538 = in.m_63.x;
    float _540 = in.m_63.y;
    float _542 = in.m_63.z;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _548 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = isnan(_532);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _564 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _566 = isnan(_532);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _576;
    bool _580 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _582 = isnan(_532);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = 1.0 / _546;
    float _594 = -_558;
    float _596 = _594 + 1.0;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _600 = _532 + _598;
    bool _602 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _604 = _574 * _596;
    float _606 = -_574;
    float _608 = _606 + 1.0;
    float _610 = 1.0 / _562;
    float _612 = _578 * _592;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _618 = fma(_612, _536, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _620 = _616 * _610;
    float _622 = -_590;
    float _624 = _622 + 1.0;
    float _626 = _618 * _604;
    float _628 = fma(_620, _600, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _630 = _558 * _624;
    float _632 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[115].x, _626);
    float _634 = _498 * _538;
    float _636 = fma(_628, _630, _632);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _642 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[117].x, _636);
    float _644 = _500 * _540;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _648 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _650 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _652 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _654 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = _502 * _542;
    out.m_65.x = _648;
    out.m_65.y = _650;
    out.m_65.z = _654;
    out.m_65.w = _652;
    bool _658 = !_602;
    float _676;
    if (!_658)
    {
        float _660 = in.m_61.x;
        float _662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _664 = _660 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[11].w, _162);
        float _668 = _666 * _662;
        float _670 = floor(_668);
        float _672 = -_670;
        float _674 = _668 + _672;
        _676 = _674;
        _678 = true;
    }
    else
    {
        float _680 = float(_128);
        float _682 = 1.0 / _680;
        float _684 = _162 * _682;
        _676 = _684;
    }
    _678 = false;
    float _686 = _676;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _690 = _686 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _696 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _698 = isnan(_686);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _712 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _714 = isnan(_686);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _724;
    bool _728 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _730 = isnan(_686);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = 1.0 / _694;
    float _742 = -_706;
    float _744 = _742 + 1.0;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _748 = _686 + _746;
    bool _750 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _752 = _722 * _744;
    float _754 = -_722;
    float _756 = _754 + 1.0;
    float _758 = 1.0 / _710;
    float _760 = _726 * _740;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _766 = fma(_760, _690, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _768 = -_738;
    float _770 = _768 + 1.0;
    float _772 = _764 * _758;
    float _774 = _766 * _752;
    float _776 = _706 * _770;
    float _778 = fma(_772, _748, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _780 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[131].x, _774);
    float _782 = fma(_778, _776, _780);
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _790 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[133].x, _782);
    float _792 = _784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _794 = _786 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _798 = _790 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.x = _792;
    out.m_67.y = _794;
    out.m_67.z = _796;
    out.m_67.w = _798;
    bool _800 = !_750;
    float _818;
    if (!_800)
    {
        float _802 = in.m_61.x;
        float _804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _806 = _802 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _808 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[14].x, _162);
        float _810 = _808 * _804;
        float _812 = floor(_810);
        float _814 = -_812;
        float _816 = _810 + _814;
        _818 = _816;
        _820 = true;
    }
    else
    {
        float _822 = float(_128);
        float _824 = 1.0 / _822;
        float _826 = _162 * _824;
        _818 = _826;
    }
    _820 = false;
    float _828 = _818;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _832 = _828 + _830;
    bool _834 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _836 = isnan(_828);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _850;
    bool _854 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _856 = isnan(_828);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = -_844;
    float _868 = _866 + 1.0;
    bool _870 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _872 = isnan(_828);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = 1.0 / _848;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _886 = _884 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _888 = _864 * _868;
    float _890 = -_880;
    float _892 = _890 + 1.0;
    float _894 = 1.0 / _886;
    bool _896 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _898 = _852 * _882;
    float _900 = -_864;
    float _902 = _900 + 1.0;
    bool _904 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _906 = isnan(_828);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = fma(_898, _832, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _918 = _880 * _902;
    bool _920 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _922 = isnan(_828);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = _914 * _892;
    float _934 = -_914;
    float _936 = _934 + 1.0;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _942 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _944 = isnan(_828);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = _930 * _936;
    float _956 = -_930;
    float _958 = _956 + 1.0;
    bool _960 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _962 = isnan(_828);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = 1.0 / _940;
    float _974 = -_952;
    float _976 = _974 + 1.0;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _982 = _952 * _958;
    float _984 = _970 * _976;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _990 = -_970;
    float _992 = _990 + 1.0;
    float _994 = 1.0 / _980;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1000 = _916 * _984;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1008 = _828 + _1006;
    float _1010 = _998 * _894;
    float _1012 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1000);
    float _1014 = 1.0 / _988;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1016;
    float _1020 = fma(_1010, _1008, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1028 = _828 + _1026;
    float _1030 = _1018 * _972;
    float _1032 = fma(_1020, _982, _1012);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1036 = _828 + _1034;
    float _1038 = 1.0 / _1004;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1044 = fma(_1030, _1028, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1046 = _1042 * _994;
    bool _1048 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1050 = isnan(_828);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1060;
    float _1064 = 1.0 / _1024;
    float _1066 = fma(_1044, _954, _1032);
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1072 = _1062 * _1014;
    float _1074 = fma(_1046, _1036, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1078 = _828 + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1082 = _828 + _1080;
    float _1084 = _1070 * _1038;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1086;
    float _1090 = fma(_1072, _1078, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1092 = fma(_1074, _932, _1066);
    float _1094 = fma(_1084, _1082, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1096 = -_1058;
    float _1098 = _1096 + 1.0;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1102 = _828 + _1100;
    float _1104 = fma(_1090, _918, _1092);
    float _1106 = _1088 * _1064;
    float _1108 = _844 * _1098;
    float _1110 = fma(_1094, _888, _1104);
    float _1112 = fma(_1106, _1102, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1114 = fma(_1112, _1108, _1110);
    float _1116 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1114);
    out.m_69.x = _1116;
    bool _1118 = !_896;
    int _1120 = as_type<int>(_888);
    float _1122 = _1014;
    float _1124 = _1064;
    float _1142;
    if (!_1118)
    {
        float _1126 = in.m_61.x;
        float _1128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1130 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[14].y, _162);
        float _1134 = _1132 * _1128;
        float _1136 = floor(_1134);
        float _1138 = -_1136;
        float _1140 = _1134 + _1138;
        _1142 = _1140;
        _1144 = true;
    }
    else
    {
        float _1146 = float(_128);
        float _1148 = 1.0 / _1146;
        float _1150 = _162 * _1148;
        _1142 = _1150;
    }
    _1144 = false;
    float _1152 = _1142;
    float _1154 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1156 = int(_1154);
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1160 = _1158 != 0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1164 = _1162 != 0;
    float _1166 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1168 = int(_1166);
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1172 = _1170 != 0;
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1176 = _1174 != 0;
    float _1178 = 0.0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _1182 = _1172;
    bool _1184 = _1176;
    if (_1160)
    {
        _1178 = 1.0;
    }
    float _1186 = _1178;
    float _1188 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1190 = int(_1188);
    float _1192 = float(_1156);
    float _1194 = 0.0;
    float _1196 = _1186;
    if (_1160)
    {
        _1194 = 1.0;
    }
    float _1198 = _1194;
    float _1200 = 0.0;
    float _1202 = _1198;
    if (_1160)
    {
        _1200 = 1.0;
    }
    float _1204 = _1200;
    int _1206 = 0;
    float _1208 = _1204;
    if (_1160)
    {
        _1206 = 0;
    }
    int _1210 = _1206;
    float _1212 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1214 = int(_1212);
    float _1216 = float(_1168);
    int _1218 = _1210;
    if (_1160)
    {
        _1180 = 0;
    }
    int _1220 = _1180;
    float _1222 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1224 = int(_1222);
    float _1226 = float(_1190);
    float _1228 = float(_1214);
    float _1230 = 1.0 / _1192;
    float _1232 = float(uint(_1224));
    float _1234 = 1.0 / _1216;
    float _1236 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1238 = int(_1236);
    float _1240 = _1230 * _162;
    float _1242 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1244 = int(_1242);
    float _1246 = _1234 * _162;
    float _1248 = _1234;
    int _1250 = _1220;
    if (_1160)
    {
        float _1252 = in.m_61.z;
        _1248 = _1252;
    }
    float _1254 = _1248;
    float _1256 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1258 = int(_1256);
    float _1260 = float(uint(_1238));
    float _1262 = 1.0 / _1226;
    float _1264 = float(uint(_1244));
    float _1266 = 1.0 / _1228;
    float _1268 = float(uint(_1258));
    int _1270 = 0;
    float _1272 = _1254;
    if (_1160)
    {
        _1270 = as_type<int>(_1254);
    }
    int _1274 = _1270;
    float _1276 = 1.0 / _1232;
    float _1278 = _1262 * _162;
    float _1280 = _1266 * _162;
    float _1282 = 1.0 / _1264;
    int _1284 = as_type<int>(_1276) + (-2);
    float _1286 = 1.0 / _1268;
    float _1288 = in.m_71.x;
    float _1290 = _1276;
    int _1292 = _1274;
    if (_1160)
    {
        float _1294 = in.m_61.x;
        _1290 = _1294;
    }
    float _1296 = _1290;
    float _1298 = trunc(_1240);
    int _1300 = int(_1298);
    int _1302 = as_type<int>(_1282) + (-2);
    float _1304 = trunc(_1246);
    int _1306 = int(_1304);
    int _1308 = as_type<int>(_1286) + (-2);
    float _1310 = 1.0 / _1260;
    float _1312 = float(uint(_1300));
    float _1314 = _1296;
    float _1316 = _1288;
    if (_1172)
    {
        float _1318 = -_1288;
        float _1320 = _1318 + 1.0;
        _1120 = as_type<int>(_1320);
    }
    int _1322 = _1120;
    if (!_1176)
    {
        _1122 = _1288;
    }
    float _1324 = _1122;
    float _1326 = 0.0;
    float _1328 = _1324;
    if (!_1172)
    {
        _1326 = _1288;
    }
    float _1330 = _1326;
    float _1332 = as_type<float>(_1302) * _1312;
    float _1334 = _1330;
    if (!_1164)
    {
        _1124 = _1288;
    }
    float _1336 = _1124;
    float _1338 = trunc(_1280);
    int _1340 = int(_1338);
    float _1342 = in.m_61.y;
    float _1344 = float(uint(_1306));
    float _1346 = as_type<float>(_1308) * _1344;
    float _1348 = trunc(_1278);
    int _1350 = int(_1348);
    int _1352 = as_type<int>(_1310) + (-2);
    float _1354 = float(uint(_1340));
    float _1356 = trunc(_1332);
    float _1358 = precise::max(_1356, 0.0);
    uint _1361 = uint(_1358);
    float _1363 = as_type<float>(_1284) * _1354;
    float _1365 = float(uint(_1350));
    float _1367 = trunc(_1346);
    float _1369 = precise::max(_1367, 0.0);
    uint _1371 = uint(_1369);
    bool _1373 = _1342 > 0.5;
    int _1375 = 0;
    float _1377 = _1336;
    if (_1160)
    {
        _1375 = as_type<int>(_1342);
    }
    int _1379 = _1375;
    float _1381 = as_type<float>(_1352) * _1365;
    float _1383 = _1381;
    int _1385 = _1379;
    if (_1172)
    {
        float _1387 = _1373 ? as_type<float>(_1322) : _1288;
        _1334 = _1387;
    }
    float _1389 = _1334;
    float _1391 = trunc(_1363);
    float _1393 = precise::max(_1391, 0.0);
    uint _1395 = uint(_1393);
    float _1397 = trunc(_1381);
    float _1399 = precise::max(_1397, 0.0);
    uint _1401 = uint(_1399);
    int _1403 = int(_1172);
    int _1405 = _1164 ? 2 : 0;
    int _1407 = _1403 | _1405;
    int _1409 = _1176 ? 4 : 0;
    int _1411 = _1407 | _1409;
    int _1413 = _1160 ? 8 : 0;
    int _1415 = _1411 | _1413;
    int _1417 = false ? 16 : 0;
    int _1419 = _1415 | _1417;
    int _1421 = _1373 ? 32 : 0;
    int _1423 = _1419 | _1421;
    int _1425 = false ? 64 : 0;
    int _1427 = _1423 | _1425;
    int _1429 = _1427 & 32;
    int _1431 = _1429;
    if (_1176)
    {
        float _1433 = -_1288;
        float _1435 = _1433 + 1.0;
        _1431 = as_type<int>(_1435);
    }
    int _1437 = _1431;
    float _1439 = as_type<float>(_1437);
    if (_1176)
    {
        float _1441 = _1373 ? as_type<float>(_1437) : _1288;
        _1328 = _1441;
    }
    float _1443 = _1328;
    if (_1160)
    {
        _1383 = _1296;
    }
    float _1445 = _1383;
    float _1447 = _1445;
    if (_1160)
    {
        _1439 = _1445;
    }
    float _1449 = _1439;
    int _1451 = 0;
    float _1453 = _1449;
    if (_1160)
    {
        _1451 = as_type<int>(_1445);
    }
    int _1455 = _1451;
    int _1457 = _1455;
    if (!_1160)
    {
        float _1459 = in.m_61.x;
        float _1461 = _1342 * 3.1415927410125732421875;
        float _1463 = in.m_61.z;
        float _1465 = _1461 * 0.15915493667125701904296875;
        float _1467 = _1465 * 6.283185482025146484375;
        float _1469 = sin(_1467);
        float _1471 = _1459 * 3.1415927410125732421875;
        float _1473 = _1471 * 0.15915493667125701904296875;
        float _1475 = _1463 * 3.1415927410125732421875;
        float _1477 = _1475 * 0.15915493667125701904296875;
        float _1479 = _1473 * 6.283185482025146484375;
        float _1481 = sin(_1479);
        float _1483 = _1477 * 6.283185482025146484375;
        float _1485 = sin(_1483);
        _1453 = _1463;
        _1208 = 5.839270114898681640625;
        _1314 = _1459;
        _1196 = 7.345489978790283203125;
        _1447 = _1342;
        _1202 = 1.2345600128173828125;
        _1218 = 1;
        _1272 = _1463;
        _1292 = as_type<int>(_1485);
        _1385 = as_type<int>(_1469);
        _1250 = 2;
        _1457 = as_type<int>(_1481);
    }
    float _1487 = _1453;
    float _1489 = _1208;
    float _1491 = _1314;
    float _1493 = _1196;
    float _1495 = _1447;
    float _1497 = _1202;
    int _1499 = _1218;
    float _1501 = _1272;
    int _1503 = _1292;
    int _1505 = _1385;
    int _1507 = _1250;
    int _1509 = _1457;
    int _1511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1513 = _1511 != 0;
    float _1515 = _1487 * _1489;
    float _1517 = 0.0;
    if (_1164)
    {
        float _1519 = in.m_61.x;
        _1517 = _1519;
    }
    float _1521 = _1517;
    int _1523 = ~_1244;
    int _1525 = _1523 + 1;
    float _1527 = _1491 * _1493;
    int _1529 = ~_1238;
    int _1531 = _1529 + 1;
    float _1533 = floor(_1515);
    int _1535 = ~_1224;
    int _1537 = _1535 + 1;
    int _1539 = _1525 * int(_1361);
    int _1541 = _1539 + _1300;
    int _1543 = ~_1258;
    int _1545 = _1543 + 1;
    int _1547 = _1531 * int(_1401);
    int _1549 = _1547 + _1350;
    float _1551 = _1495 * _1497;
    int _1553 = _1537 * int(_1395);
    int _1555 = _1553 + _1340;
    int _1557 = as_type<int>(_1487);
    if (_1513)
    {
        float _1559 = in.m_61.z;
        _1557 = as_type<int>(_1559);
    }
    int _1561 = _1557;
    float _1563 = float(uint(_1541));
    int _1565 = _1545 * int(_1371);
    int _1567 = _1565 + _1306;
    float _1569 = float(uint(_1549));
    float _1571 = _1495 * _1493;
    float _1573 = float(uint(_1555));
    float _1575 = as_type<float>(_1302) * _1563;
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1579 = _1577 != 0;
    float _1581 = as_type<float>(_1352) * _1569;
    float _1583 = floor(_1527);
    float _1585 = as_type<float>(_1284) * _1573;
    float _1587 = float(uint(_1567));
    int _1589 = 0;
    float _1591 = _1581;
    float _1593 = _1585;
    if (_1513)
    {
        float _1595 = -_1288;
        float _1597 = _1595 + 1.0;
        _1589 = as_type<int>(_1597);
    }
    int _1599 = _1589;
    if (_1164)
    {
        bool _1601 = _1521 > 0.5;
        _1182 = _1601;
    }
    bool _1603 = _1182;
    float _1605 = -_1533;
    float _1607 = _1515 + _1605;
    float _1609 = float(_1300);
    float _1611 = as_type<float>(_1308) * _1587;
    float _1613 = trunc(_1575);
    float _1615 = precise::max(_1613, 0.0);
    uint _1617 = uint(_1615);
    int _1619 = ~_1258;
    int _1621 = _1619 + 1;
    bool _1623 = _1499 != 1;
    int _1625 = 0;
    if (_1579)
    {
        float _1627 = -_1288;
        float _1629 = _1627 + 1.0;
        _1625 = as_type<int>(_1629);
    }
    int _1631 = _1625;
    float _1633 = in.m_55.w;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1637 = _1152 + _1635;
    int _1639 = ~_1238;
    int _1641 = _1639 + 1;
    int _1643 = _1561;
    if (_1513)
    {
        bool _1645 = as_type<float>(_1561) > 0.5;
        _1184 = _1645;
    }
    bool _1647 = _1184;
    if (_1164)
    {
        float _1649 = -_1288;
        float _1651 = _1649 + 1.0;
        _1643 = as_type<int>(_1651);
    }
    int _1653 = _1643;
    float _1655 = trunc(_1581);
    float _1657 = precise::max(_1655, 0.0);
    uint _1659 = uint(_1657);
    float _1661 = -_1583;
    float _1663 = _1527 + _1661;
    float _1665 = float(_1244);
    float _1667 = in.m_57.w;
    if (_1164)
    {
        float _1669 = _1603 ? as_type<float>(_1653) : _1288;
        _1377 = _1669;
    }
    float _1671 = _1377;
    float _1673 = float(_128);
    float _1675 = _1665 * _1607;
    float _1677 = floor(_1571);
    if (!_1513)
    {
        _1591 = _1288;
    }
    float _1679 = _1591;
    float _1681 = in.m_59.w;
    float _1683 = _1679;
    if (_1513)
    {
        float _1685 = _1647 ? as_type<float>(_1599) : _1288;
        _1683 = _1685;
    }
    float _1687 = _1683;
    int _1689 = int(_1361) + int(_1617);
    float _1691 = float(_1238);
    float _1693 = trunc(_1585);
    float _1695 = precise::max(_1693, 0.0);
    uint _1697 = uint(_1695);
    int _1699 = int(_1401) + int(_1659);
    int _1701 = ~_1238;
    int _1703 = _1701 + 1;
    float _1705 = _1663 * _1691;
    float _1707 = float(_1340);
    float _1709 = float(_1306);
    float _1711 = floor(_1551);
    if (!_1579)
    {
        _1593 = _1288;
    }
    float _1713 = _1593;
    float _1715 = -_1677;
    float _1717 = _1571 + _1715;
    float _1719 = _1713;
    if (_1579)
    {
        float _1721 = _1373 ? as_type<float>(_1631) : _1288;
        _1719 = _1721;
    }
    float _1723 = _1719;
    int _1725 = _1703 * _1699;
    int _1727 = _1725 + _1350;
    int _1729 = ~_1244;
    int _1731 = _1729 + 1;
    float _1733 = float(_1350);
    float _1735 = 1.0 / _1673;
    int _1737 = int(_1395) + int(_1697);
    bool _1739 = _1609 >= _1665;
    bool _1741 = isnan(_1609);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan(_1665);
    bool _1747 = _1743 || _1745;
    float _1749 = float(_1747);
    int _1751 = _1731 * _1689;
    int _1753 = _1751 + _1300;
    bool _1755 = _1733 >= _1691;
    bool _1757 = isnan(_1733);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan(_1691);
    bool _1763 = _1759 || _1761;
    float _1765 = float(_1763);
    float _1767 = _1691 * _162;
    bool _1769 = uint(_1727) >= uint(_1238);
    float _1771 = trunc(_1611);
    float _1773 = precise::max(_1771, 0.0);
    uint _1775 = uint(_1773);
    float _1777 = -_1711;
    float _1779 = _1551 + _1777;
    float _1781 = float(_1224);
    float _1783 = float(_1258);
    bool _1785 = _1707 >= _1781;
    bool _1787 = isnan(_1707);
    bool _1789 = _1785 || _1787;
    bool _1791 = isnan(_1781);
    bool _1793 = _1789 || _1791;
    float _1795 = float(_1793);
    float _1797 = _1781 * _1779;
    float _1799 = _1735 * _162;
    bool _1801 = uint(_1753) >= uint(_1244);
    float _1803 = _1767 * _1735;
    float _1805 = trunc(_1765);
    int _1807 = int(_1805);
    float _1809 = _1783 * _1799;
    bool _1811 = _1709 >= _1783;
    bool _1813 = isnan(_1709);
    bool _1815 = _1811 || _1813;
    bool _1817 = isnan(_1783);
    bool _1819 = _1815 || _1817;
    float _1821 = float(_1819);
    float _1823 = _1781 * _1799;
    bool _1825 = _1238 == 0;
    float _1827 = _1665 * _1799;
    int _1829 = int(_1371) + int(_1775);
    float _1831 = trunc(_1705);
    int _1833 = int(_1831);
    int _1835 = ~_1224;
    int _1837 = _1835 + 1;
    float _1839 = _1783 * _1717;
    bool _1841 = !_1769;
    int _1843 = _1841 ? 0 : (-1);
    int _1845 = _1621 * _1829;
    int _1847 = _1845 + _1306;
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1851 = _1849 != 0;
    int _1853 = _1837 * _1737;
    int _1855 = _1853 + _1340;
    int _1857 = ~_1699;
    int _1859 = _1857 + _1843;
    int _1861 = _1859 + 1;
    float _1863 = trunc(_1795);
    int _1865 = int(_1863);
    bool _1867 = !_1851;
    int _1869 = _1867 ? 0 : 1;
    bool _1871 = uint(_1847) >= uint(_1258);
    bool _1873 = uint(_1855) >= uint(_1224);
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1877 = _1875 != 0;
    float _1879 = trunc(_1749);
    int _1881 = int(_1879);
    bool _1883 = !_1801;
    int _1885 = _1883 ? 0 : (-1);
    int _1887 = abs(_1869);
    int _1889 = ~_1689;
    int _1891 = _1889 + _1885;
    int _1893 = _1891 + 1;
    bool _1895 = !_1871;
    int _1897 = _1895 ? 0 : (-1);
    float _1899 = trunc(_1797);
    int _1901 = int(_1899);
    bool _1903 = !_1873;
    int _1905 = _1903 ? 0 : (-1);
    int _1907 = _1833 * _1887;
    int _1909 = _1907 + _1350;
    bool _1911 = !_1877;
    int _1913 = _1911 ? 0 : 1;
    int _1915 = _1238 * _1861;
    int _1917 = _1915 + _1350;
    int _1919 = ~_1737;
    int _1921 = _1919 + _1905;
    int _1923 = _1921 + 1;
    int _1925 = ~_1829;
    int _1927 = _1925 + _1897;
    int _1929 = _1927 + 1;
    float _1931 = trunc(_1803);
    int _1933 = int(_1931);
    int _1935 = abs(_1913);
    int _1937 = _1224 * _1923;
    int _1939 = _1937 + _1340;
    int _1941 = ~_1807;
    int _1943 = _1941 + 1;
    int _1945 = _1943 + 1;
    int _1947 = _1244 * _1893;
    int _1949 = _1947 + _1300;
    bool _1951 = !_1825;
    int _1953 = _1951 ? _1917 : (-1);
    int _1955 = _1258 * _1929;
    int _1957 = _1955 + _1306;
    int _1959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1961 = _1959 != 0;
    float _1963 = trunc(_1675);
    int _1965 = int(_1963);
    int _1967 = _1901 * _1935;
    int _1969 = _1967 + _1340;
    int _1971 = _1953 * _1945;
    bool _1973 = !_1961;
    int _1975 = _1973 ? 0 : 1;
    int _1977 = _1238 + (-1);
    int _1979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1981 = _1979 != 0;
    int _1983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1985 = _1983 != 0;
    int _1987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1989 = _1987 != 0;
    float _1991 = trunc(_1821);
    int _1993 = int(_1991);
    int _1995 = abs(_1975);
    int _1997 = _1807 * _1977;
    int _1999 = _1997 + _1971;
    bool _2001 = _1224 == 0;
    bool _2003 = !_1985;
    int _2005 = _2003 ? 0 : 1;
    int _2007 = _1965 * _1995;
    int _2009 = _2007 + _1300;
    bool _2011 = !_1981;
    int _2013 = _2011 ? 0 : 1;
    float _2015 = trunc(_1809);
    int _2017 = int(_2015);
    bool _2019 = _1244 == 0;
    int _2021 = abs(_2005);
    int _2023 = ~_1865;
    int _2025 = _2023 + 1;
    int _2027 = _2025 + 1;
    bool _2029 = !_2001;
    int _2031 = _2029 ? _1939 : (-1);
    int _2033 = _1999 * _2021;
    int _2035 = abs(_2013);
    float _2037 = in.m_71.y;
    int _2039 = ~_1881;
    int _2041 = _2039 + 1;
    int _2043 = _2041 + 1;
    int _2045 = _2027 * _2031;
    bool _2047 = !_2019;
    int _2049 = _2047 ? _1949 : (-1);
    int _2051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2053 = _2051 != 0;
    int _2055 = _2043 * _2049;
    bool _2057 = !_1989;
    int _2059 = _2057 ? 0 : 1;
    int _2061 = _1933 * _2035;
    int _2063 = _2061 + _2033;
    bool _2065 = !_2053;
    int _2067 = _2065 ? 0 : 1;
    int _2069 = abs(_2059);
    int _2071 = abs(_2067);
    bool _2073 = _1258 == 0;
    int _2075 = _1224 + (-1);
    int _2077 = _1909 * _2069;
    int _2079 = _2077 + _2063;
    int _2081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2083 = _2081 != 0;
    int _2085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2087 = _2085 != 0;
    int _2089 = ~_1993;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    int _2095 = _1833 * _2071;
    int _2097 = _2095 + _2079;
    bool _2099 = !_2073;
    int _2101 = _2099 ? _1957 : (-1);
    int _2103 = _1865 * _2075;
    int _2105 = _2103 + _2045;
    bool _2107 = !_2087;
    int _2109 = _2107 ? 0 : 1;
    float _2111 = trunc(_1823);
    int _2113 = int(_2111);
    float _2115 = float(uint(_2097));
    int _2117 = _2093 * _2101;
    int _2119 = abs(_2109);
    int _2121 = _1244 + (-1);
    float _2123 = as_type<float>(_1352) * _2115;
    bool _2125 = !_2083;
    int _2127 = _2125 ? 0 : 1;
    int _2129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2131 = _2129 != 0;
    int _2133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2135 = _2133 != 0;
    int _2137 = _1881 * _2121;
    int _2139 = _2137 + _2055;
    int _2141 = abs(_2127);
    int _2143 = _2105 * _2119;
    float _2145 = trunc(_2123);
    float _2147 = precise::max(_2145, 0.0);
    uint _2149 = uint(_2147);
    bool _2151 = !_2131;
    int _2153 = _2151 ? 0 : 1;
    int _2155 = _2113 * _2141;
    int _2157 = _2155 + _2143;
    int _2159 = _1258 + (-1);
    int _2161 = abs(_2153);
    int _2163 = ~_1238;
    int _2165 = _2163 + 1;
    int _2167 = _1993 * _2159;
    int _2169 = _2167 + _2117;
    bool _2171 = !_2135;
    int _2173 = _2171 ? 0 : 1;
    int _2175 = _1969 * _2161;
    int _2177 = _2175 + _2157;
    int _2179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2181 = _2179 != 0;
    int _2183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2185 = _2183 != 0;
    float _2187 = trunc(_1827);
    int _2189 = int(_2187);
    int _2191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2193 = _2191 != 0;
    int _2195 = _2165 * int(_2149);
    int _2197 = _2195 + _2097;
    int _2199 = abs(_2173);
    bool _2201 = !_2185;
    int _2203 = _2201 ? 0 : 1;
    bool _2205 = !_2193;
    int _2207 = _2205 ? 0 : 1;
    int _2209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2211 = _2209 != 0;
    int _2213 = _1901 * _2199;
    int _2215 = _2213 + _2177;
    float _2217 = float(uint(_2197));
    int _2219 = abs(_2203);
    float _2221 = trunc(_1839);
    int _2223 = int(_2221);
    bool _2225 = !_2211;
    int _2227 = _2225 ? 0 : 1;
    float _2229 = as_type<float>(_1352) * _2217;
    int _2231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2233 = _2231 != 0;
    int _2235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2237 = _2235 != 0;
    int _2239 = _2139 * _2219;
    int _2241 = abs(_2227);
    bool _2243 = !_2181;
    int _2245 = _2243 ? 0 : 1;
    float _2247 = trunc(_2229);
    float _2249 = precise::max(_2247, 0.0);
    uint _2251 = uint(_2249);
    int _2253 = abs(_2207);
    float _2255 = float(uint(_2215));
    bool _2257 = !_2237;
    int _2259 = _2257 ? 0 : 1;
    int _2261 = abs(_2245);
    float _2263 = as_type<float>(_1284) * _2255;
    int _2265 = abs(_2259);
    float _2267 = trunc(_2263);
    float _2269 = precise::max(_2267, 0.0);
    uint _2271 = uint(_2269);
    int _2273 = _2189 * _2261;
    int _2275 = _2273 + _2239;
    int _2277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2279 = _2277 != 0;
    int _2281 = _2223 * _2241;
    int _2283 = _2281 + _1306;
    int _2285 = int(_2149) + int(_2251);
    int _2287 = _2169 * _2265;
    int _2289 = ~_1224;
    int _2291 = _2289 + 1;
    int _2293 = _2009 * _2253;
    int _2295 = _2293 + _2275;
    bool _2297 = !_2233;
    int _2299 = _2297 ? 0 : 1;
    bool _2301 = !_2279;
    int _2303 = _2301 ? 0 : 1;
    int _2305 = abs(_2299);
    int _2307 = _2291 * int(_2271);
    int _2309 = _2307 + _2215;
    int _2311 = ~_1238;
    int _2313 = _2311 + 1;
    int _2315 = abs(_2303);
    int _2317 = _2017 * _2305;
    int _2319 = _2317 + _2287;
    int _2321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2323 = _2321 != 0;
    int _2325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2327 = _2325 != 0;
    float _2329 = float(uint(_2309));
    int _2331 = _1965 * _2315;
    int _2333 = _2331 + _2295;
    bool _2335 = !_2323;
    int _2337 = _2335 ? 0 : 1;
    float _2339 = as_type<float>(_1284) * _2329;
    bool _2341 = !_2327;
    int _2343 = _2341 ? 0 : 1;
    int _2345 = _2313 * _2285;
    int _2347 = _2345 + _2097;
    float _2349 = float(uint(_2333));
    int _2351 = abs(_2337);
    float _2353 = trunc(_2339);
    float _2355 = precise::max(_2353, 0.0);
    uint _2357 = uint(_2355);
    bool _2359 = uint(_2347) >= uint(_1238);
    float _2361 = as_type<float>(_1302) * _2349;
    int _2363 = abs(_2343);
    bool _2365 = !_2359;
    int _2367 = _2365 ? 0 : (-1);
    float _2369 = trunc(_2361);
    float _2371 = precise::max(_2369, 0.0);
    uint _2373 = uint(_2371);
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2377 = _2375 != 0;
    int _2379 = _2283 * _2351;
    int _2381 = _2379 + _2319;
    int _2383 = ~_2285;
    int _2385 = _2383 + _2367;
    int _2387 = _2385 + 1;
    bool _2389 = _1238 == 0;
    int _2391 = _2223 * _2363;
    int _2393 = _2391 + _2381;
    int _2395 = ~_1244;
    int _2397 = _2395 + 1;
    int _2399 = _1238 * _2387;
    int _2401 = _2399 + _2097;
    bool _2403 = _1342 > 0.5;
    float _2405 = in.m_61.w;
    float _2407 = float(uint(_2393));
    bool _2409 = !_2389;
    int _2411 = _2409 ? _2401 : (-1);
    int _2413 = _2305;
    if (_2377)
    {
        float _2415 = -_1288;
        float _2417 = _2415 + 1.0;
        _2413 = as_type<int>(_2417);
    }
    int _2419 = _2413;
    int _2421 = int(_2271) + int(_2357);
    float _2423 = as_type<float>(_1308) * _2407;
    int _2425 = _2411 & 3;
    bool _2427 = _2425 != 0;
    int _2429 = _2397 * int(_2373);
    int _2431 = _2429 + _2333;
    if (_2377)
    {
        float _2433 = _2403 ? as_type<float>(_2419) : _1288;
        _1316 = _2433;
    }
    float _2435 = _1316;
    float _2437 = trunc(_2423);
    float _2439 = precise::max(_2437, 0.0);
    uint _2441 = uint(_2439);
    int _2443 = ~_1224;
    int _2445 = _2443 + 1;
    float _2447 = -_2037;
    float _2449 = _2447 + 1.0;
    bool _2451 = uint(_2425) > 1u;
    float _2453 = float(uint(_2431));
    int _2455 = _2445 * _2421;
    int _2457 = _2455 + _2215;
    int _2459 = _2411 & 3;
    bool _2461 = _2459 != 0;
    int _2463 = _2403 ? as_type<int>(_2449) : as_type<int>(_2037);
    float _2465 = as_type<float>(_1302) * _2453;
    int _2467 = _2461 ? 0 : 1;
    bool _2469 = uint(_2457) >= uint(_1224);
    float _2471 = trunc(_2465);
    float _2473 = precise::max(_2471, 0.0);
    uint _2475 = uint(_2473);
    int _2477 = ~_1258;
    int _2479 = _2477 + 1;
    int _2481 = ~_2467;
    int _2483 = _2481 + 1;
    int _2485 = _2483 + 1;
    int _2487 = _2485;
    if (!_2451)
    {
        int _2489 = ~_2467;
        int _2491 = _2489 + 1;
        _2487 = _2491;
    }
    int _2493 = _2487;
    int _2495 = _2479 * int(_2441);
    int _2497 = _2495 + _2393;
    bool _2499 = !_2469;
    int _2501 = _2499 ? 0 : (-1);
    bool _2503 = _2425 != 3;
    int _2505 = ~_2421;
    int _2507 = _2505 + _2501;
    int _2509 = _2507 + 1;
    float _2511 = float(uint(_2497));
    bool _2513 = uint(_2425) >= 2u;
    int _2515 = _1224 * _2509;
    int _2517 = _2515 + _2215;
    bool _2519 = _1224 == 0;
    float _2521 = as_type<float>(_1308) * _2511;
    int _2523 = _2513 ? 0 : 1;
    bool _2525 = _2405 > 0.5;
    int _2527 = ~_1244;
    int _2529 = _2527 + 1;
    float _2531 = trunc(_2521);
    float _2533 = precise::max(_2531, 0.0);
    uint _2535 = uint(_2533);
    int _2537 = int(_2373) + int(_2475);
    bool _2539 = !_2519;
    int _2541 = _2539 ? _2517 : (-1);
    int _2543 = ~_2523;
    int _2545 = _2543 + 1;
    int _2547 = _2545 + 1;
    int _2549 = _2529 * _2537;
    int _2551 = _2549 + _2333;
    int _2553 = _2547;
    if (_2503)
    {
        int _2555 = ~_2523;
        int _2557 = _2555 + 1;
        _2553 = _2557;
    }
    int _2559 = _2553;
    int _2561 = _2525 ? as_type<int>(_2449) : as_type<int>(_2037);
    int _2563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2565 = _2563 != 0;
    int _2567 = _2541 & 3;
    bool _2569 = _2567 != 0;
    bool _2571 = !_2565;
    int _2573 = _2571 ? 0 : 1;
    bool _2575 = uint(_2567) >= 2u;
    int _2577 = _2569 ? 0 : 1;
    bool _2579 = uint(_2551) >= uint(_1244);
    int _2581 = _2575 ? 0 : 1;
    bool _2583 = _2567 != 3;
    bool _2585 = !_2579;
    int _2587 = _2585 ? 0 : (-1);
    int _2589 = ~_1258;
    int _2591 = _2589 + 1;
    bool _2593 = uint(_2567) > 1u;
    int _2595 = ~_2537;
    int _2597 = _2595 + _2587;
    int _2599 = _2597 + 1;
    int _2601 = int(_2441) + int(_2535);
    int _2603 = _1244 * _2599;
    int _2605 = _2603 + _2333;
    bool _2607 = _1244 == 0;
    int _2609 = ~_2581;
    int _2611 = _2609 + 1;
    int _2613 = _2611 + 1;
    int _2615 = _2591 * _2601;
    int _2617 = _2615 + _2393;
    int _2619 = _2613;
    if (_2583)
    {
        int _2621 = ~_2581;
        int _2623 = _2621 + 1;
        _2619 = _2623;
    }
    int _2625 = _2619;
    int _2627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2629 = _2627 != 0;
    int _2631 = ~_2577;
    int _2633 = _2631 + 1;
    int _2635 = _2633 + 1;
    bool _2637 = !_2607;
    int _2639 = _2637 ? _2605 : (-1);
    int _2641 = _2635;
    if (!_2593)
    {
        int _2643 = ~_2577;
        int _2645 = _2643 + 1;
        _2641 = _2645;
    }
    int _2647 = _2641;
    bool _2649 = uint(_2617) >= uint(_1258);
    bool _2651 = !_2629;
    int _2653 = _2651 ? 0 : 1;
    int _2655 = _2639 & 3;
    bool _2657 = _2655 != 0;
    bool _2659 = !_2649;
    int _2661 = _2659 ? 0 : (-1);
    int _2663 = _2657 ? 0 : 1;
    bool _2665 = uint(_2655) >= 2u;
    bool _2667 = _2655 != 3;
    int _2669 = ~_2601;
    int _2671 = _2669 + _2661;
    int _2673 = _2671 + 1;
    int _2675 = _2665 ? 0 : 1;
    bool _2677 = uint(_2655) > 1u;
    int _2679 = _1258 * _2673;
    int _2681 = _2679 + _2393;
    bool _2683 = _1258 == 0;
    int _2685 = ~_2675;
    int _2687 = _2685 + 1;
    int _2689 = _2687 + 1;
    bool _2691 = !_2683;
    int _2693 = _2691 ? _2681 : (-1);
    int _2695 = _2689;
    if (_2667)
    {
        int _2697 = ~_2675;
        int _2699 = _2697 + 1;
        _2695 = _2699;
    }
    int _2701 = _2695;
    int _2703 = _2693 & 3;
    bool _2705 = _2703 != 0;
    int _2707 = ~_2663;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    int _2713 = _2711;
    if (!_2677)
    {
        int _2715 = ~_2663;
        int _2717 = _2715 + 1;
        _2713 = _2717;
    }
    int _2719 = _2713;
    bool _2721 = uint(_2703) >= 2u;
    int _2723 = _2705 ? 0 : 1;
    int _2725 = _2721 ? 0 : 1;
    bool _2727 = _2703 != 3;
    bool _2729 = uint(_2703) > 1u;
    int _2731 = ~_2725;
    int _2733 = _2731 + 1;
    int _2735 = _2733 + 1;
    int _2737 = ~_2723;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    float _2743 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2745 = _2743 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2747 = _2735;
    int _2749 = _2741;
    if (_2727)
    {
        int _2751 = ~_2725;
        int _2753 = _2751 + 1;
        _2747 = _2753;
    }
    int _2755 = _2747;
    float _2757 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2759 = _2757 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    if (!_2729)
    {
        int _2761 = ~_2723;
        int _2763 = _2761 + 1;
        _2749 = _2763;
    }
    int _2765 = _2749;
    float _2767 = 1.0 / _2745;
    float _2769 = in.m_46.x;
    float _2771 = in.m_46.y;
    float _2773 = in.m_46.z;
    int _2775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2777 = _2775 != 0;
    float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2781 = _2779 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    int _2783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2785 = _2783 != 0;
    bool _2787 = !_2777;
    int _2789 = _2787 ? 0 : 1;
    float _2791 = _2785 ? as_type<float>(_2463) : _2037;
    float _2793 = 1.0 / _2759;
    int _2795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2797 = _2795 != 0;
    bool _2799 = _1501 > 0.5;
    float _2801 = _2797 ? as_type<float>(_2561) : _2037;
    int _2803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2805 = _2803 != 0;
    float _2807 = 1.0 / _2781;
    int _2809 = _2799 ? as_type<int>(_2449) : as_type<int>(_2037);
    int _2811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2813 = _2811 != 0;
    float _2815 = _2805 ? as_type<float>(_2809) : _2037;
    float _2817 = _2813 ? as_type<float>(_2809) : _2037;
    float _2819 = _194 * _2771;
    int _2821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2823 = _2821 != 0;
    int _2825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2827 = _2825 != 0;
    float _2829 = _200 * _2771;
    int _2831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2833 = _2831 != 0;
    float _2835 = _206 * _2771;
    float _2837 = fma(_192, _2769, _2819);
    float _2839 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2841 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2843 = _2841 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2845 = fma(_198, _2769, _2829);
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2849 = fma(_204, _2769, _2835);
    float _2851 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2853 = _2851 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2855 = fma(_196, _2773, _2837);
    float _2857 = fma(_2839, -2.0, _2847);
    float _2859 = _1491 * 2.0;
    float _2861 = 1.0 / _2853;
    float _2863 = fma(_202, _2773, _2845);
    float _2865 = fma(_208, _2773, _2849);
    float _2867 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2869 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2867;
    float _2871 = floor(_2859);
    float _2873 = _2823 ? as_type<float>(_2809) : _2037;
    float _2875 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2877 = _2875 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2879 = _2827 ? as_type<float>(_2809) : _2037;
    float _2881 = _2869 * _2767;
    bool _2883 = !_2833;
    int _2885 = _2883 ? 0 : 1;
    float _2887 = _2855 + _1633;
    float _2889 = float(uint(_1969));
    float _2891 = 1.0 / _2843;
    float _2893 = float(uint(_2009));
    float _2895 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2857);
    int _2897 = ~_1224;
    int _2899 = _2897 + 1;
    float _2901 = float(uint(_2283));
    float _2903 = as_type<float>(_1302) * _2893;
    bool _2905 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2907 = isnan(_1152);
    bool _2909 = _2905 || _2907;
    bool _2911 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2913 = _2909 || _2911;
    float _2915 = float(_2913);
    float _2917 = 1.0 / _2877;
    float _2919 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2921 = _2919 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2923 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2925 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2923;
    bool _2927 = _2871 > 0.0;
    float _2929 = as_type<float>(_1308) * _2901;
    float _2931 = _2921 * _2793;
    float _2933 = _2925 * _2807;
    float _2935 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2937 = _2935 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2939 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2941 = _2939 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _2943 = _2871 >= 0.0;
    bool _2945 = isnan(_2871);
    bool _2947 = _2943 || _2945;
    bool _2949 = isnan(0.0);
    bool _2951 = _2947 || _2949;
    float _2953 = 1.0 / _2937;
    float _2955 = _2941 * _2861;
    float _2957 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2959 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2957;
    int _2961 = _2951 ? 0 : 1;
    float _2963 = fma(_2933, _1637, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2965 = _2959 * _2891;
    float _2967 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2969 = _2967 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2971 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2973 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2971;
    float _2975 = _1342 * 2.0;
    float _2977 = float(uint(_1909));
    float _2979 = _2969 * _2917;
    int _2981 = ~_2961;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    float _2987 = floor(_2975);
    int _2989 = _2985;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2993 = _2793;
    float _2995 = _2917;
    if (!_2927)
    {
        int _2997 = ~_2961;
        int _2999 = _2997 + 1;
        _2989 = _2999;
    }
    int _3001 = _2989;
    float _3003 = _2973 * _2953;
    bool _3005 = !_1623;
    float _3007 = _3005 ? as_type<float>(_1503) : as_type<float>(_1505);
    float _3009 = as_type<float>(_1352) * _2977;
    float _3011 = _2953;
    if (!_1623)
    {
        _2991 = _1342;
    }
    float _3013 = _2991;
    float _3015 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3017 = _1152 + _3015;
    float _3019 = _3013;
    if (!_1623)
    {
        _2993 = _1342;
    }
    float _3021 = _2993;
    float _3023 = trunc(_3009);
    float _3025 = precise::max(_3023, 0.0);
    uint _3027 = uint(_3025);
    float _3029 = _3021;
    if (!_1623)
    {
        _2995 = _1501;
    }
    float _3031 = _2995;
    float _3033 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3035 = _1152 + _3033;
    float _3037 = _3031;
    if (!_1623)
    {
        _3011 = _1501;
    }
    float _3039 = _3011;
    bool _3041 = _1507 != 2;
    bool _3043 = !_1623;
    float _3045 = _3043 ? as_type<float>(_1505) : as_type<float>(_1509);
    float _3047 = fma(_2931, _3035, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3049 = _3039;
    float _3051 = _3047;
    if (_1623)
    {
        _3019 = _1491;
    }
    float _3053 = _3019;
    float _3055 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3057 = _1152 + _3055;
    if (_1623)
    {
        _3029 = _1491;
    }
    float _3059 = _3029;
    float _3061 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3063 = _1152 + _3061;
    if (_1623)
    {
        _3037 = _1342;
    }
    float _3065 = _3037;
    float _3067 = _3053 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1623)
    {
        _3049 = _1342;
    }
    float _3069 = _3049;
    bool _3071 = _2987 > 0.0;
    int _3073 = _1641 * int(_3027);
    int _3075 = _3073 + _1909;
    bool _3077 = _2987 >= 0.0;
    bool _3079 = isnan(_2987);
    bool _3081 = _3077 || _3079;
    bool _3083 = isnan(0.0);
    bool _3085 = _3081 || _3083;
    float _3087 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3089 = _1152 + _3087;
    bool _3091 = _2703 != 3;
    float _3093 = float(uint(_3075));
    float _3095 = fma(_2881, _3089, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3097 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3099 = _1152 + _3097;
    float _3101 = as_type<float>(_1352) * _3093;
    float _3103 = fma(_2955, _3099, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3105 = fma(_2979, _3017, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3107 = fma(_3003, _3063, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3109 = _2863 + _1667;
    float _3111 = as_type<float>(_1284) * _2889;
    bool _3113 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3115 = isnan(_1152);
    bool _3117 = _3113 || _3115;
    bool _3119 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3121 = _3117 || _3119;
    float _3123 = float(_3121);
    float _3125 = fma(_2965, _3057, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _3127 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3129 = isnan(_1152);
    bool _3131 = _3127 || _3129;
    bool _3133 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3135 = _3131 || _3133;
    float _3137 = float(_3135);
    float _3139 = trunc(_3101);
    float _3141 = precise::max(_3139, 0.0);
    uint _3143 = uint(_3141);
    bool _3145 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3147 = isnan(_1152);
    bool _3149 = _3145 || _3147;
    bool _3151 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3153 = _3149 || _3151;
    float _3155 = float(_3153);
    float _3157 = -_3123;
    float _3159 = _3157 + 1.0;
    bool _3161 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3163 = isnan(_1152);
    bool _3165 = _3161 || _3163;
    bool _3167 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3169 = _3165 || _3167;
    float _3171 = float(_3169);
    float _3173 = -_3137;
    float _3175 = _3173 + 1.0;
    bool _3177 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3179 = isnan(_1152);
    bool _3181 = _3177 || _3179;
    bool _3183 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3185 = _3181 || _3183;
    float _3187 = float(_3185);
    float _3189 = _3137 * _3159;
    bool _3191 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3193 = isnan(_1152);
    bool _3195 = _3191 || _3193;
    bool _3197 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3199 = _3195 || _3197;
    float _3201 = float(_3199);
    float _3203 = trunc(_3111);
    float _3205 = precise::max(_3203, 0.0);
    uint _3207 = uint(_3205);
    float _3209 = _3155 * _3175;
    float _3211 = -_3155;
    float _3213 = _3211 + 1.0;
    bool _3215 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3217 = isnan(_1152);
    bool _3219 = _3215 || _3217;
    bool _3221 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3223 = _3219 || _3221;
    float _3225 = float(_3223);
    float _3227 = -_3201;
    float _3229 = _3227 + 1.0;
    float _3231 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3233 = _3201 * _3213;
    int _3235 = abs(_2719);
    float _3237 = trunc(_2903);
    float _3239 = precise::max(_3237, 0.0);
    uint _3241 = uint(_3239);
    float _3243 = _2915 * _3229;
    float _3245 = -_2915;
    float _3247 = _3245 + 1.0;
    int _3249 = ~_3235;
    int _3251 = _3249 + 1;
    int _3253 = _3251 + 1;
    int _3255 = abs(_2701);
    float _3257 = _3171 * _3247;
    float _3259 = -_3171;
    float _3261 = _3259 + 1.0;
    int _3263 = _2899 * int(_3207);
    int _3265 = _3263 + _1969;
    int _3267 = ~_1258;
    int _3269 = _3267 + 1;
    int _3271 = ~_1244;
    int _3273 = _3271 + 1;
    float _3275 = _3187 * _3261;
    float _3277 = float(uint(_3265));
    float _3279 = trunc(_2929);
    float _3281 = precise::max(_3279, 0.0);
    uint _3283 = uint(_3281);
    int _3285 = _3273 * int(_3241);
    int _3287 = _3285 + _2009;
    int _3289 = ~_3255;
    int _3291 = _3289 + 1;
    int _3293 = _3291 + 1;
    float _3295 = as_type<float>(_1284) * _3277;
    float _3297 = -_3187;
    float _3299 = _3297 + 1.0;
    int _3301 = abs(_2885);
    float _3303 = float(uint(_3287));
    float _3305 = _3225 * _3299;
    float _3307 = trunc(_3295);
    float _3309 = precise::max(_3307, 0.0);
    uint _3311 = uint(_3309);
    float _3313 = -_3225;
    float _3315 = _3313 + 1.0;
    float _3317 = _3095 * _3305;
    float _3319 = as_type<float>(_1302) * _3303;
    int _3321 = _3085 ? 0 : 1;
    int _3323 = _3269 * int(_3283);
    int _3325 = _3323 + _2283;
    float _3327 = fma(_3315, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3317);
    float _3329 = trunc(_3319);
    float _3331 = precise::max(_3329, 0.0);
    uint _3333 = uint(_3331);
    int _3335 = ~_1238;
    int _3337 = _3335 + 1;
    float _3339 = float(uint(_3325));
    float _3341 = _2865 + _1681;
    int _3343 = int(_3027) + int(_3143);
    float _3345 = fma(_3047, _3275, _3327);
    int _3347 = ~_1224;
    int _3349 = _3347 + 1;
    float _3351 = as_type<float>(_1308) * _3339;
    int _3353 = int(_3207) + int(_3311);
    int _3355 = _3337 * _3343;
    int _3357 = _3355 + _1909;
    float _3359 = fma(_2963, _3257, _3345);
    int _3361 = ~_3321;
    int _3363 = _3361 + 1;
    int _3365 = _3363 + 1;
    float _3367 = trunc(_3351);
    float _3369 = precise::max(_3367, 0.0);
    uint _3371 = uint(_3369);
    int _3373 = _3365;
    float _3375 = as_type<float>(_3343);
    float _3377 = _3345;
    if (!_3071)
    {
        int _3379 = ~_3321;
        int _3381 = _3379 + 1;
        _3373 = _3381;
    }
    int _3383 = _3373;
    float _3385 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3387 = _3109 + _3385;
    bool _3389 = uint(_3357) >= uint(_1238);
    int _3391 = _3349 * _3353;
    int _3393 = _3391 + _1969;
    int _3395 = int(_3241) + int(_3333);
    float _3397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3399 = _2887 + _3397;
    int _3401 = ~_1244;
    int _3403 = _3401 + 1;
    float _3405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    bool _3407 = !_3389;
    int _3409 = _3407 ? 0 : (-1);
    float _3411 = fma(_3103, _3243, _3359);
    int _3413 = ~_1258;
    int _3415 = _3413 + 1;
    int _3417 = _3403 * _3395;
    int _3419 = _3417 + _2009;
    bool _3421 = uint(_3393) >= uint(_1224);
    float _3423 = _3387 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3425 = fma(_3125, _3233, _3411);
    int _3427 = int(_3283) + int(_3371);
    float _3429 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _3431 = !_3421;
    int _3433 = _3431 ? 0 : (-1);
    float _3435 = fma(_3399, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3423);
    bool _3437 = uint(_3419) >= uint(_1244);
    int _3439 = _3415 * _3427;
    int _3441 = _3439 + _2283;
    float _3443 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3445 = _3341 + _3443;
    float _3447 = _3405 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    bool _3449 = !_3437;
    int _3451 = _3449 ? 0 : (-1);
    float _3453 = fma(_3445, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3435);
    bool _3455 = uint(_3441) >= uint(_1258);
    float _3457 = _1501 * 2.0;
    float _3459 = fma(_3447, _1389, -0.5);
    bool _3461 = !_3455;
    int _3463 = _3461 ? 0 : (-1);
    bool _3465 = _3453 >= 0.0;
    float _3467 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3469 = floor(_3457);
    float _3471 = -_3467;
    float _3473 = fma(_3429, 2.0, _3471);
    float _3475 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3477 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3479 = _1342 + _1491;
    float _3481 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3483 = fma(as_type<float>(_1509), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3475);
    float _3485 = as_type<float>(_1509) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3487 = fma(as_type<float>(_1505), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3477);
    float _3489 = as_type<float>(_1505) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _3491 = ~_3343;
    int _3493 = _3491 + _3409;
    int _3495 = _3493 + 1;
    float _3497 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3483);
    float _3499 = fma(_3489, -2.0, _3481);
    float _3501 = as_type<float>(_3383);
    if (_3465)
    {
        _3375 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3503 = _3375;
    float _3505 = _3479 + (-1.0);
    float _3507 = fma(_3105, _3209, _3425);
    bool _3509 = _3469 >= 0.0;
    bool _3511 = isnan(_3469);
    bool _3513 = _3509 || _3511;
    bool _3515 = isnan(0.0);
    bool _3517 = _3513 || _3515;
    int _3519 = as_type<int>(_3503);
    if (_3465)
    {
        float _3521 = _3503 * 5.0;
        _3519 = as_type<int>(_3521);
    }
    int _3523 = _3519;
    int _3525 = _1238 * _3495;
    int _3527 = _3525 + _1909;
    float _3529 = fma(_3107, _3189, _3507);
    if (_3465)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11739 = as_type<float>(_3523);
        out.gl_Position.z = _11739;
    }
    if (_3041)
    {
        _3051 = _1491;
    }
    float _3531 = _3051;
    float _3533 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3535 = _3531;
    if (_3041)
    {
        _3377 = _1342;
    }
    float _3537 = _3377;
    float _3539 = fma(_3123, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3529);
    float _3541 = _3537;
    if (!_3041)
    {
        _3535 = _1501;
    }
    float _3543 = _3535;
    float _3545 = -_3533;
    float _3547 = fma(_3485, 2.0, _3545);
    if (!_3041)
    {
        _3541 = _1491;
    }
    float _3549 = _3541;
    float _3551 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _3553 = _3469 > 0.0;
    out.m_73.x = _3539;
    float _3555 = _3387 * _3387;
    float _3557 = fma(_3069, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3551);
    bool _3559 = !_2427;
    int _3561 = _3559 ? 0 : 1;
    float _3563 = fma(_3399, _3399, _3555);
    float _3565 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3567 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    int _3569 = _2541 & 3;
    bool _3571 = _3569 != 0;
    float _3573 = fma(_3445, _3445, _3563);
    int _3575 = _2541 >> 31;
    float _3577 = fma(_3045, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3567);
    float _3579 = _3045 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3581 = rsqrt(_3573);
    bool _3583 = !_3571;
    int _3585 = _3583 ? 0 : 1;
    float _3587 = _3549 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3589 = -_3565;
    float _3591 = fma(_3579, 2.0, _3589);
    int _3593 = _2411 >> 31;
    float _3595 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3487);
    int _3597 = _2639 & 3;
    bool _3599 = _3597 != 0;
    float _3601 = -_162;
    float _3603 = fma(_3601, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3473);
    int _3605 = _3575 & 3;
    float _3607 = -_162;
    float _3609 = fma(_3607, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3547);
    int _3611 = _3593 & 3;
    float _3613 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3499);
    int _3615 = _2639 >> 31;
    float _3617 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3557);
    int _3619 = _2411 + _3611;
    float _3621 = -_162;
    float _3623 = fma(_3621, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3591);
    int _3625 = _3615 & 3;
    float _3627 = _3387 * _3581;
    bool _3629 = !_3599;
    int _3631 = _3629 ? 0 : 1;
    float _3633 = _3399 * _3581;
    int _3635 = _3619 >> 2;
    float _3637 = -_3627;
    float _3639 = fma(_3637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3387);
    int _3641 = _2693 & 3;
    bool _3643 = _3641 != 0;
    float _3645 = -_3633;
    float _3647 = fma(_3645, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3399);
    int _3649 = _2639 + _3625;
    float _3651 = _3639 * _3639;
    int _3653 = _2693 >> 31;
    if (_3465)
    {
        out.m_49.x = 0.0;
    }
    int _3655 = _3635 << 4;
    int _3657 = _3655 + 368;
    float _3659 = fma(_3647, _3647, _3651);
    bool _3661 = !_3643;
    int _3663 = _3661 ? 0 : 1;
    bool _3665 = _2425 != 3;
    int _3667 = _2541 + _3605;
    int _3669 = _3649 >> 2;
    int _3671 = _3653 & 3;
    uint _3673 = uint(int(uint(_3657) >> uint(2)));
    uint _3675 = uint(int(uint(int(_3673)) >> uint(2)));
    int _3677 = int(_3673) & 3;
    float _3679 = (*spvDescriptorSet0.vp_c9)._m0[int(_3675)][_3677];
    int _3681 = int(_3673) + 1;
    uint _3683 = uint(int(uint(_3681) >> uint(2)));
    int _3685 = _3681 & 3;
    float _3687 = (*spvDescriptorSet0.vp_c9)._m0[int(_3683)][_3685];
    int _3689 = ~_3353;
    int _3691 = _3689 + _3433;
    int _3693 = _3691 + 1;
    bool _3695 = !_3665;
    int _3697 = _3695 ? 0 : (-1);
    bool _3699 = _2567 != 3;
    int _3701 = _1224 * _3693;
    int _3703 = _3701 + _1969;
    int _3705 = _2693 + _3671;
    float _3707 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3709 = int(_3707);
    int _3711 = _3667 >> 2;
    int _3713 = _3705 >> 2;
    float _3715 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _3717 = !_3699;
    int _3719 = _3717 ? 0 : (-1);
    bool _3721 = _2655 != 3;
    float _3723 = -_3715;
    float _3725 = fma(_3067, 2.0, _3723);
    int _3727 = _3711 << 4;
    int _3729 = _3727 + 512;
    float _3731 = _3065 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3733 = _3713 << 4;
    int _3735 = _3733 + 800;
    float _3737 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3739 = int(_3737);
    bool _3741 = !_2389;
    int _3743 = _3741 ? _3527 : (-1);
    uint _3745 = uint(int(uint(_3729) >> uint(2)));
    uint _3747 = uint(int(uint(int(_3745)) >> uint(2)));
    int _3749 = int(_3745) & 3;
    float _3751 = (*spvDescriptorSet0.vp_c9)._m0[int(_3747)][_3749];
    int _3753 = int(_3745) + 1;
    uint _3755 = uint(int(uint(_3753) >> uint(2)));
    int _3757 = _3753 & 3;
    float _3759 = (*spvDescriptorSet0.vp_c9)._m0[int(_3755)][_3757];
    bool _3761 = !_2519;
    int _3763 = _3761 ? _3703 : (-1);
    float _3765 = -_162;
    float _3767 = fma(_3765, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3725);
    bool _3769 = !_3091;
    int _3771 = _3769 ? 0 : (-1);
    int _3773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3775 = _3773 != 0;
    int _3777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3779 = _3777 != 0;
    int _3781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3783 = _3781 != 0;
    uint _3785 = uint(int(uint(_3735) >> uint(2)));
    uint _3787 = uint(int(uint(int(_3785)) >> uint(2)));
    int _3789 = int(_3785) & 3;
    float _3791 = (*spvDescriptorSet0.vp_c9)._m0[int(_3787)][_3789];
    int _3793 = int(_3785) + 1;
    uint _3795 = uint(int(uint(_3793) >> uint(2)));
    int _3797 = _3793 & 3;
    float _3799 = (*spvDescriptorSet0.vp_c9)._m0[int(_3795)][_3797];
    float _3801 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3803 = _3517 ? 0 : 1;
    float _3805 = fma(_3505, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3807 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _3809 = fma(_3731, -2.0, _3801);
    float _3811 = _3543 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3813 = ~_3803;
    int _3815 = _3813 + 1;
    int _3817 = _3815 + 1;
    float _3819 = fma(_3007, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3807);
    float _3821 = _3007 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _3823 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    int _3825 = _3669 << 4;
    int _3827 = _3825 + 656;
    float _3829 = -_3231;
    float _3831 = fma(_3811, 2.0, _3829);
    int _3833 = _3817;
    if (!_3553)
    {
        int _3835 = ~_3803;
        int _3837 = _3835 + 1;
        _3833 = _3837;
    }
    int _3839 = _3833;
    float _3841 = fma(_3821, -2.0, _3823);
    int _3843 = ~_3395;
    int _3845 = _3843 + _3451;
    int _3847 = _3845 + 1;
    uint _3849 = uint(int(uint(_3827) >> uint(2)));
    uint _3851 = uint(int(uint(int(_3849)) >> uint(2)));
    int _3853 = int(_3849) & 3;
    float _3855 = (*spvDescriptorSet0.vp_c9)._m0[int(_3851)][_3853];
    int _3857 = int(_3849) + 1;
    uint _3859 = uint(int(uint(_3857) >> uint(2)));
    int _3861 = _3857 & 3;
    float _3863 = (*spvDescriptorSet0.vp_c9)._m0[int(_3859)][_3861];
    int _3865 = abs(_2647);
    float _3867 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3841);
    int _3869 = _1244 * _3847;
    int _3871 = _3869 + _2009;
    int _3873 = ~_3427;
    int _3875 = _3873 + _3463;
    int _3877 = _3875 + 1;
    float _3879 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3809);
    int _3881 = abs(_3585);
    int _3883 = _3657 + 8;
    uint _3885 = uint(int(uint(_3883) >> uint(2)));
    uint _3887 = uint(int(uint(int(_3885)) >> uint(2)));
    int _3889 = int(_3885) & 3;
    float _3891 = (*spvDescriptorSet0.vp_c9)._m0[int(_3887)][_3889];
    int _3893 = int(_3885) + 1;
    uint _3895 = uint(int(uint(_3893) >> uint(2)));
    int _3897 = _3893 & 3;
    float _3899 = (*spvDescriptorSet0.vp_c9)._m0[int(_3895)][_3897];
    float _3901 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3903 = _1258 * _3877;
    int _3905 = _3903 + _2283;
    int _3907 = abs(_3663);
    float _3909 = -_162;
    float _3911 = fma(_3909, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3831);
    float _3913 = fma(_3587, -2.0, _3901);
    int _3915 = abs(_2493);
    int _3917 = _3729 + 8;
    uint _3919 = uint(int(uint(_3917) >> uint(2)));
    uint _3921 = uint(int(uint(int(_3919)) >> uint(2)));
    int _3923 = int(_3919) & 3;
    float _3925 = (*spvDescriptorSet0.vp_c9)._m0[int(_3921)][_3923];
    int _3927 = int(_3919) + 1;
    uint _3929 = uint(int(uint(_3927) >> uint(2)));
    int _3931 = _3927 & 3;
    float _3933 = (*spvDescriptorSet0.vp_c9)._m0[int(_3929)][_3931];
    int _3935 = ~_3865;
    int _3937 = _3935 + 1;
    int _3939 = _3937 + 1;
    float _3941 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3943 = int(_3941);
    int _3945 = ~_3915;
    int _3947 = _3945 + 1;
    int _3949 = _3947 + 1;
    float _3951 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3913);
    int _3953 = _3939 * as_type<int>(_3759);
    bool _3955 = !_3721;
    int _3957 = _3955 ? 0 : (-1);
    int _3959 = _3827 + 8;
    uint _3961 = uint(int(uint(_3959) >> uint(2)));
    uint _3963 = uint(int(uint(int(_3961)) >> uint(2)));
    int _3965 = int(_3961) & 3;
    float _3967 = (*spvDescriptorSet0.vp_c9)._m0[int(_3963)][_3965];
    int _3969 = int(_3961) + 1;
    uint _3971 = uint(int(uint(_3969) >> uint(2)));
    int _3973 = _3969 & 3;
    float _3975 = (*spvDescriptorSet0.vp_c9)._m0[int(_3971)][_3973];
    int _3977 = _3949 * as_type<int>(_3687);
    int _3979 = abs(_3561);
    float _3981 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _3983 = abs(_3631);
    int _3985 = abs(_2765);
    float _3987 = fma(_3059, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3981);
    int _3989 = _3735 + 8;
    uint _3991 = uint(int(uint(_3989) >> uint(2)));
    uint _3993 = uint(int(uint(int(_3991)) >> uint(2)));
    int _3995 = int(_3991) & 3;
    float _3997 = (*spvDescriptorSet0.vp_c9)._m0[int(_3993)][_3995];
    int _3999 = int(_3991) + 1;
    uint _4001 = uint(int(uint(_3999) >> uint(2)));
    int _4003 = _3999 & 3;
    float _4005 = (*spvDescriptorSet0.vp_c9)._m0[int(_4001)][_4003];
    float _4007 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4009 = int(_4007);
    float _4011 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3987);
    int _4013 = ~_3985;
    int _4015 = _4013 + 1;
    int _4017 = _4015 + 1;
    int _4019 = ~_3881;
    int _4021 = _4019 + 1;
    int _4023 = _4021 + 1;
    int _4025 = ~_3907;
    int _4027 = _4025 + 1;
    int _4029 = _4027 + 1;
    int _4031 = _4017 * as_type<int>(_3799);
    int _4033 = ~_3979;
    int _4035 = _4033 + 1;
    int _4037 = _4035 + 1;
    int _4039 = _4023 * as_type<int>(_3751);
    int _4041 = _4039 + _3953;
    int _4043 = abs(_2559);
    int _4045 = _4029 * as_type<int>(_3791);
    int _4047 = _4045 + _4031;
    int _4049 = abs(_2625);
    int _4051 = _4037 * as_type<int>(_3679);
    int _4053 = _4051 + _3977;
    int _4055 = abs(_3697);
    int _4057 = _3253 * as_type<int>(_3863);
    int _4059 = ~_4043;
    int _4061 = _4059 + 1;
    int _4063 = _4061 + 1;
    float _4065 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4067 = log2(_4065);
    int _4069 = ~_4049;
    int _4071 = _4069 + 1;
    int _4073 = _4071 + 1;
    int _4075 = ~_4055;
    int _4077 = _4075 + 1;
    int _4079 = _4077 + 1;
    int _4081 = _4063 * as_type<int>(_3891);
    int _4083 = _4081 + _4053;
    int _4085 = ~_3983;
    int _4087 = _4085 + 1;
    int _4089 = _4087 + 1;
    float _4091 = float(uint(_3709));
    int _4093 = _4079 * as_type<int>(_3899);
    int _4095 = _4093 + _4083;
    int _4097 = abs(_2755);
    int _4099 = _4089 * as_type<int>(_3855);
    int _4101 = _4099 + _4057;
    int _4103 = abs(_3957);
    int _4105 = _4073 * as_type<int>(_3925);
    int _4107 = _4105 + _4041;
    int _4109 = abs(_2573);
    float _4111 = 1.0 / _4091;
    float _4113 = float(uint(_4009));
    int _4115 = ~_4109;
    int _4117 = _4115 + 1;
    int _4119 = _4117 + 1;
    int _4121 = ~_4097;
    int _4123 = _4121 + 1;
    int _4125 = _4123 + 1;
    int _4127 = _3293 * as_type<int>(_3967);
    int _4129 = _4127 + _4101;
    int _4131 = abs(_3719);
    int _4133 = _4095 * _4119;
    float _4135 = 1.0 / _4113;
    float _4137 = float(uint(_3739));
    int _4139 = _3743 * _4109;
    int _4141 = _4139 + _4133;
    int _4143 = abs(_2653);
    int _4145 = _4125 * as_type<int>(_3997);
    int _4147 = _4145 + _4047;
    int _4149 = abs(_2789);
    float _4151 = _4067 * _162;
    int _4153 = ~_4143;
    int _4155 = _4153 + 1;
    int _4157 = _4155 + 1;
    float _4159 = 1.0 / _4137;
    int _4161 = ~_4131;
    int _4163 = _4161 + 1;
    int _4165 = _4163 + 1;
    int _4167 = ~_4103;
    int _4169 = _4167 + 1;
    int _4171 = _4169 + 1;
    float _4173 = float(uint(_3943));
    int _4175 = _4165 * as_type<int>(_3933);
    int _4177 = _4175 + _4107;
    int _4179 = ~_4149;
    int _4181 = _4179 + 1;
    int _4183 = _4181 + 1;
    int _4185 = _4171 * as_type<int>(_3975);
    int _4187 = _4185 + _4129;
    bool _4189 = _1244 == 0;
    int _4191 = _4157 * _4177;
    int _4193 = abs(_3771);
    float _4195 = 1.0 / _4173;
    bool _4197 = !_4189;
    int _4199 = _4197 ? _3871 : (-1);
    int _4201 = _3763 * _4143;
    int _4203 = _4201 + _4191;
    int _4205 = ~_4193;
    int _4207 = _4205 + 1;
    int _4209 = _4207 + 1;
    int _4211 = _4183 * _4187;
    int _4213 = as_type<int>(_4135) + (-2);
    float _4215 = float(uint(_4203));
    int _4217 = _4199 * _4149;
    int _4219 = _4217 + _4211;
    int _4221 = as_type<int>(_4111) + (-2);
    int _4223 = _4209 * as_type<int>(_4005);
    int _4225 = _4223 + _4147;
    float _4227 = float(uint(_4141));
    float _4229 = as_type<float>(_4213) * _4215;
    float _4231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _4233 = as_type<int>(_4159) + (-2);
    float _4235 = as_type<float>(_4221) * _4227;
    float _4237 = float(uint(_4219));
    int _4239 = ~_3301;
    int _4241 = _4239 + 1;
    int _4243 = _4241 + 1;
    bool _4245 = _1258 == 0;
    float _4247 = trunc(_4235);
    float _4249 = precise::max(_4247, 0.0);
    uint _4251 = uint(_4249);
    int _4253 = as_type<int>(_4195) + (-2);
    float _4255 = as_type<float>(_4233) * _4237;
    bool _4257 = !_4245;
    int _4259 = _4257 ? _3905 : (-1);
    int _4261 = _4243 * _4225;
    int _4263 = ~_3709;
    int _4265 = _4263 + 1;
    int _4267 = ~_3739;
    int _4269 = _4267 + 1;
    float _4271 = trunc(_4229);
    float _4273 = precise::max(_4271, 0.0);
    uint _4275 = uint(_4273);
    int _4277 = _4259 * _3301;
    int _4279 = _4277 + _4261;
    float _4281 = _4231 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4283 = abs(_3709);
    float _4285 = _3445 * _3581;
    float _4287 = float(uint(_4279));
    float _4289 = fma(_4281, _2873, -0.5);
    float _4291 = trunc(_4255);
    float _4293 = precise::max(_4291, 0.0);
    uint _4295 = uint(_4293);
    int _4297 = ~_4009;
    int _4299 = _4297 + 1;
    int _4301 = _4265 * int(_4251);
    int _4303 = _4301 + _4141;
    float _4305 = as_type<float>(_4253) * _4287;
    float _4307 = float(uint(_4283));
    float _4309 = -_4285;
    float _4311 = fma(_4309, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3445);
    int _4313 = abs(_3739);
    int _4315 = _4299 * int(_4275);
    int _4317 = _4315 + _4203;
    float _4319 = trunc(_4305);
    float _4321 = precise::max(_4319, 0.0);
    uint _4323 = uint(_4321);
    float _4325 = float(uint(_4303));
    float _4327 = fma(_4311, _4311, _3659);
    int _4329 = ~_3943;
    int _4331 = _4329 + 1;
    float _4333 = float(uint(_4317));
    float _4335 = as_type<float>(_4221) * _4325;
    int _4337 = _4269 * int(_4295);
    int _4339 = _4337 + _4219;
    float _4341 = 1.0 / _4307;
    int _4343 = abs(_4009);
    float _4345 = as_type<float>(_4213) * _4333;
    float _4347 = float(uint(_4313));
    float _4349 = float(uint(_4339));
    float _4351 = float(uint(_4343));
    int _4353 = _4331 * int(_4323);
    int _4355 = _4353 + _4279;
    int _4357 = abs(_3943);
    float _4359 = as_type<float>(_4233) * _4349;
    float _4361 = 1.0 / _4351;
    int _4363 = as_type<int>(_4341) + (-2);
    float _4365 = float(uint(_4357));
    float _4367 = 1.0 / _4347;
    int _4369 = abs(_4141);
    float _4371 = float(uint(_4355));
    float _4373 = float(uint(_4369));
    int _4375 = abs(_4219);
    float _4377 = 1.0 / _4365;
    float _4379 = as_type<float>(_4253) * _4371;
    float _4381 = as_type<float>(_4363) * _4373;
    float _4383 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _4385 = abs(_4203);
    float _4387 = fma(_1491, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4383);
    float _4389 = exp2(_4151);
    int _4391 = as_type<int>(_4367) + (-2);
    float _4393 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4387);
    float _4395 = float(uint(_4375));
    int _4397 = as_type<int>(_4361) + (-2);
    float _4399 = float(uint(_4385));
    float _4401 = trunc(_4381);
    float _4403 = precise::max(_4401, 0.0);
    uint _4405 = uint(_4403);
    bool _4407 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4409 = isnan(1.0);
    bool _4411 = _4407 || _4409;
    bool _4413 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4415 = _4411 || _4413;
    float _4417 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4419 = 1.0 + _4417;
    float _4421 = as_type<float>(_4391) * _4395;
    int _4423 = abs(_4279);
    float _4425 = as_type<float>(_4397) * _4399;
    float _4427 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _4429 = as_type<int>(_4377) + (-2);
    float _4431 = 1.0 / _4419;
    float _4433 = float(uint(_4423));
    float _4435 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4437 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4427);
    float _4439 = -_4389;
    float _4441 = _4439 + 1.0;
    float _4443 = as_type<float>(_4429) * _4433;
    float _4445 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4435);
    float _4447 = trunc(_4335);
    float _4449 = precise::max(_4447, 0.0);
    uint _4451 = uint(_4449);
    float _4453 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3819);
    bool _4455 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4457 = isnan(0.0);
    bool _4459 = _4455 || _4457;
    bool _4461 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4463 = _4459 || _4461;
    float _4465 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _4467 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4437);
    int _4469 = ~_4283;
    int _4471 = _4469 + 1;
    float _4473 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3577);
    float _4475 = fma(_1491, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4465);
    float _4477 = trunc(_4421);
    float _4479 = precise::max(_4477, 0.0);
    uint _4481 = uint(_4479);
    float _4483 = _4463 ? _4441 : 0.0;
    int _4485 = _4471 * int(_4405);
    int _4487 = _4485 + _4369;
    int _4489 = ~_4313;
    int _4491 = _4489 + 1;
    float _4493 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4445);
    float _4495 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4475);
    float _4497 = _4285;
    if (_4415)
    {
        float _4499 = _4483 * _4431;
        _166 = _4499;
    }
    float _4501 = _166;
    int _4503 = ~_4343;
    int _4505 = _4503 + 1;
    float _4507 = trunc(_4425);
    float _4509 = precise::max(_4507, 0.0);
    uint _4511 = uint(_4509);
    int _4513 = int(_4251) + int(_4451);
    float _4515 = fma(_4473, _3459, _3623);
    int _4517 = ~_4357;
    int _4519 = _4517 + 1;
    float _4521 = -_3867;
    float _4523 = fma(_4453, _4289, _4521);
    float _4525 = float(uint(_4487));
    float _4527 = float(_3839);
    float _4529 = trunc(_4359);
    float _4531 = precise::max(_4529, 0.0);
    uint _4533 = uint(_4531);
    int _4535 = _4491 * int(_4481);
    int _4537 = _4535 + _4375;
    float _4539 = as_type<float>(_4363) * _4525;
    float _4541 = _4523 + 0.5;
    float _4543 = float(uint(_4537));
    float _4545 = trunc(_4443);
    float _4547 = precise::max(_4545, 0.0);
    uint _4549 = uint(_4547);
    int _4551 = ~_3709;
    int _4553 = _4551 + 1;
    float _4555 = as_type<float>(_4391) * _4543;
    float _4557 = trunc(_4345);
    float _4559 = precise::max(_4557, 0.0);
    uint _4561 = uint(_4559);
    float _4563 = trunc(_4379);
    float _4565 = precise::max(_4563, 0.0);
    uint _4567 = uint(_4565);
    int _4569 = _4505 * int(_4511);
    int _4571 = _4569 + _4385;
    float _4573 = float(uint(_4571));
    float _4575 = trunc(_4539);
    float _4577 = precise::max(_4575, 0.0);
    uint _4579 = uint(_4577);
    int _4581 = int(_4295) + int(_4533);
    int _4583 = _4519 * int(_4549);
    int _4585 = _4583 + _4423;
    float _4587 = as_type<float>(_4397) * _4573;
    int _4589 = int(_4275) + int(_4561);
    float _4591 = float(uint(_4585));
    float _4593 = trunc(_4587);
    float _4595 = precise::max(_4593, 0.0);
    uint _4597 = uint(_4595);
    int _4599 = int(_4323) + int(_4567);
    int _4601 = _4553 * _4513;
    int _4603 = _4601 + _4141;
    int _4605 = ~_4009;
    int _4607 = _4605 + 1;
    float _4609 = as_type<float>(_4429) * _4591;
    int _4611 = ~_3739;
    int _4613 = _4611 + 1;
    bool _4615 = uint(_4603) >= uint(_3709);
    float _4617 = trunc(_4555);
    float _4619 = precise::max(_4617, 0.0);
    uint _4621 = uint(_4619);
    int _4623 = ~_3943;
    int _4625 = _4623 + 1;
    int _4627 = _4607 * _4589;
    int _4629 = _4627 + _4203;
    int _4631 = int(_4405) + int(_4579);
    float _4633 = trunc(_4609);
    float _4635 = precise::max(_4633, 0.0);
    uint _4637 = uint(_4635);
    int _4639 = int(_4511) + int(_4597);
    int _4641 = _4613 * _4581;
    int _4643 = _4641 + _4219;
    bool _4645 = uint(_4629) >= uint(_4009);
    int _4647 = _4625 * _4599;
    int _4649 = _4647 + _4279;
    int _4651 = ~_4343;
    int _4653 = _4651 + 1;
    int _4655 = ~_4283;
    int _4657 = _4655 + 1;
    int _4659 = ~_4313;
    int _4661 = _4659 + 1;
    bool _4663 = !_4615;
    int _4665 = _4663 ? 0 : (-1);
    int _4667 = _4657 * _4631;
    int _4669 = _4667 + _4369;
    bool _4671 = uint(_4643) >= uint(_3739);
    float _4673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4675 = int(_4481) + int(_4621);
    int _4677 = int(_4549) + int(_4637);
    bool _4679 = !_4645;
    int _4681 = _4679 ? 0 : (-1);
    int _4683 = _4653 * _4639;
    int _4685 = _4683 + _4385;
    bool _4687 = uint(_4649) >= uint(_3943);
    int _4689 = _4661 * _4675;
    int _4691 = _4689 + _4375;
    int _4693 = ~_4357;
    int _4695 = _4693 + 1;
    float _4697 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _4699 = !_4671;
    int _4701 = _4699 ? 0 : (-1);
    bool _4703 = uint(_4669) >= uint(_4283);
    bool _4705 = !_4687;
    int _4707 = _4705 ? 0 : (-1);
    float _4709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4711 = uint(_4685) >= uint(_4343);
    bool _4713 = !_4703;
    int _4715 = _4713 ? 0 : (-1);
    int _4717 = _4695 * _4677;
    int _4719 = _4717 + _4423;
    int _4721 = ~_4513;
    int _4723 = _4721 + _4665;
    int _4725 = _4723 + 1;
    bool _4727 = uint(_4691) >= uint(_4313);
    int _4729 = ~_4581;
    int _4731 = _4729 + _4701;
    int _4733 = _4731 + 1;
    int _4735 = _3709 * _4725;
    int _4737 = _4735 + _4141;
    bool _4739 = !_4727;
    int _4741 = _4739 ? 0 : (-1);
    bool _4743 = _3709 == 0;
    bool _4745 = !_4711;
    int _4747 = _4745 ? 0 : (-1);
    float _4749 = _4709 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4751 = uint(_4719) >= uint(_4357);
    int _4753 = _3739 * _4733;
    int _4755 = _4753 + _4219;
    bool _4757 = !_4743;
    int _4759 = _4757 ? _4737 : (-1);
    float _4761 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    bool _4763 = _3739 == 0;
    float _4765 = fma(_4749, _1671, -0.5);
    int _4767 = ~_4589;
    int _4769 = _4767 + _4681;
    int _4771 = _4769 + 1;
    float _4773 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    bool _4775 = !_4763;
    int _4777 = _4775 ? _4755 : (-1);
    bool _4779 = _3709 == 0;
    int _4781 = _4009 * _4771;
    int _4783 = _4781 + _4203;
    int _4785 = _4141 ^ _3709;
    float _4787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4789 = _4203 ^ _4009;
    float _4791 = _4773 * _4697;
    uint _4793 = uint(int(uint(_4785) >> uint(31)));
    uint _4795 = uint(int(uint(_4789) >> uint(31)));
    int _4797 = ~_4599;
    int _4799 = _4797 + _4707;
    int _4801 = _4799 + 1;
    float _4803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _4805 = !_4751;
    int _4807 = _4805 ? 0 : (-1);
    int _4809 = ~_4715;
    int _4811 = _4631 + _4809;
    int _4813 = _4811 + 1;
    int _4815 = _3943 * _4801;
    int _4817 = _4815 + _4279;
    int _4819 = ~int(_4793);
    int _4821 = _4819 + 1;
    bool _4823 = _4009 == 0;
    int _4825 = ~_4747;
    int _4827 = _4639 + _4825;
    int _4829 = _4827 + 1;
    float _4831 = _2879 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _4833 = ~int(_4795);
    int _4835 = _4833 + 1;
    int _4837 = _4813 ^ _4821;
    float _4839 = _4831 * _4761;
    bool _4841 = !_4823;
    int _4843 = _4841 ? _4783 : (-1);
    float _4845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4847 = _3943 == 0;
    int _4849 = _4829 ^ _4835;
    out.m_75.x = _4791;
    out.m_75.y = _4839;
    int _4851 = ~_4821;
    int _4853 = _4851 + _4837;
    int _4855 = _4853 + 1;
    bool _4857 = !_4847;
    int _4859 = _4857 ? _4817 : (-1);
    bool _4861 = _4009 == 0;
    int _4863 = ~_4835;
    int _4865 = _4863 + _4849;
    int _4867 = _4865 + 1;
    bool _4869 = !_4779;
    int _4871 = _4869 ? _4855 : (-1);
    float _4873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _4875 = _3739 == 0;
    float _4877 = _4787 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4879 = _4219 ^ _3739;
    bool _4881 = !_4861;
    int _4883 = _4881 ? _4867 : (-1);
    float _4885 = fma(_4877, _1687, -0.5);
    bool _4887 = _3943 == 0;
    int _4889 = _4279 ^ _3943;
    float _4891 = _4845 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4893 = float(_4759);
    uint _4895 = uint(int(uint(_4889) >> uint(31)));
    float _4897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _4899 = ~_4807;
    int _4901 = _4677 + _4899;
    int _4903 = _4901 + 1;
    float _4905 = fma(_4749, _4893, _3603);
    int _4907 = ~int(_4895);
    int _4909 = _4907 + 1;
    float _4911 = fma(_4891, _1723, -0.5);
    float _4913 = float(_4843);
    float _4915 = fma(_4393, _4765, _4905);
    float _4917 = float(_4777);
    float _4919 = _4673 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4921 = _4903 ^ _4909;
    float _4923 = fma(_4877, _4913, _3767);
    float _4925 = float(_4859);
    float _4927 = _4803 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _4929 = fma(_4891, _4917, _3911);
    int _4931 = ~_4909;
    int _4933 = _4931 + _4921;
    int _4935 = _4933 + 1;
    float _4937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _4939 = uint(int(uint(_4879) >> uint(31)));
    float _4941 = fma(_4927, _2435, -0.5);
    float _4943 = float(_4871);
    float _4945 = fma(_4927, _4925, _3609);
    bool _4947 = !_4887;
    int _4949 = _4947 ? _4935 : (-1);
    float _4951 = fma(_4919, _2791, -0.5);
    int _4953 = ~_4741;
    int _4955 = _4675 + _4953;
    int _4957 = _4955 + 1;
    float _4959 = -_2895;
    float _4961 = fma(_4919, _4943, _4959);
    int _4963 = ~int(_4939);
    int _4965 = _4963 + 1;
    float _4967 = fma(_3497, _4941, _4945);
    float _4969 = float(_4883);
    float _4971 = fma(_4011, _4885, _4923);
    float _4973 = _4873 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4975 = float(_4949);
    float _4977 = _4897 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _4979 = _4957 ^ _4965;
    float _4981 = fma(_4495, _4911, _4929);
    float _4983 = fma(_4973, _2801, -0.5);
    float _4985 = -_3879;
    float _4987 = fma(_4973, _4969, _4985);
    int _4989 = ~_4965;
    int _4991 = _4989 + _4979;
    int _4993 = _4991 + 1;
    float _4995 = fma(_4977, _2817, -0.5);
    float _4997 = -_3613;
    float _4999 = fma(_4977, _4975, _4997);
    float _5001 = fma(_4467, _4951, _4961);
    bool _5003 = !_4875;
    int _5005 = _5003 ? _4993 : (-1);
    float _5007 = _4937 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5009 = fma(_3595, _4995, _4999);
    float _5011 = _5001 + 0.5;
    float _5013 = float(_5005);
    float _5015 = fma(_5007, _2815, -0.5);
    float _5017 = _5009 + 0.5;
    float _5019 = fma(_3617, _4983, _4987);
    float _5021 = in.m_77.x;
    float _5023 = in.m_77.y;
    float _5025 = in.m_77.z;
    float _5027 = -_3951;
    float _5029 = fma(_5007, _5013, _5027);
    float _5031 = _4915 + 0.5;
    float _5033 = _4515 + 0.5;
    float _5035 = _4981 + 0.5;
    float _5037 = fma(_4493, _5015, _5029);
    float _5039 = _4971 + 0.5;
    float _5041 = _5019 + 0.5;
    float _5043 = _4967 + 0.5;
    float _5045 = _5037 + 0.5;
    bool _5047 = !_3775;
    int _5049 = _5047 ? 0 : 1;
    out.m_79.x = _5033;
    out.m_79.y = _4541;
    bool _5051 = !_3779;
    int _5053 = _5051 ? 0 : 1;
    int _5055 = abs(_5049);
    out.m_81.x = _5031;
    out.m_81.y = _5011;
    out.m_81.z = _5039;
    out.m_81.w = _5041;
    int _5057 = abs(_5053);
    bool _5059 = !_3783;
    int _5061 = _5059 ? 0 : 1;
    out.m_83.x = _5035;
    out.m_83.y = _5045;
    float _5063 = float(_5055);
    out.m_85.x = _5043;
    out.m_85.y = _5017;
    float _5065 = as_type<float>(_4821);
    if (_3465)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5067 = -_3627;
    float _5069 = fma(_5067, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3109);
    float _5071 = -_3633;
    float _5073 = fma(_5071, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2887);
    float _5075 = _5063 * _4527;
    float _5077 = float(_3001);
    float _5079 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5081 = _5069 + _5079;
    float _5083 = float(_5057);
    float _5085 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5087 = _5073 + _5085;
    float _5089 = _5075 * (-2.0);
    float _5091 = _5081 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5093 = -_4285;
    float _5095 = fma(_5093, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3341);
    float _5097 = _5083 * _5077;
    float _5099 = _1491 + (-0.5);
    float _5101 = fma(_5087, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5091);
    float _5103 = fma(_5089, _5021, _5021);
    float _5105 = _1342 + _1501;
    float _5107 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5109 = _5095 + _5107;
    float _5111 = fma(_3805, _5089, _3805);
    float _5113 = fma(_5099, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5103);
    float _5115 = _5105 + (-1.0);
    float _5117 = _5097 * (-2.0);
    float _5119 = fma(_5109, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5101);
    float _5121 = fma(_5111, _4501, _5113);
    float _5123 = fma(_5115, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5125 = _1342 + (-0.5);
    float _5127 = fma(_5117, _5023, _5023);
    bool _5129 = _5119 >= 0.0;
    float _5131 = fma(_5123, _5117, _5123);
    int _5133 = abs(_5061);
    float _5135 = fma(_5125, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5127);
    float _5137 = _5121 * 0.15915493667125701904296875;
    float _5139 = sqrt(_4327);
    float _5141 = fma(_5131, _4501, _5135);
    float _5143 = float(_3383);
    float _5145 = _1491 + _1501;
    float _5147 = float(_5133);
    float _5149 = _5141 * 0.15915493667125701904296875;
    float _5151 = _5137 * 6.283185482025146484375;
    float _5153 = sin(_5151);
    float _5155 = _5117;
    float _5157 = _5087;
    float _5159 = _5073;
    if (_5129)
    {
        _5155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5161 = _5155;
    float _5163 = _5147 * _5143;
    int _5165 = as_type<int>(_5161);
    if (_5129)
    {
        out.m_49.x = 0.0;
    }
    float _5167 = _5145 + (-1.0);
    if (_5129)
    {
        float _5169 = _5161 * 5.0;
        _5165 = as_type<int>(_5169);
    }
    int _5171 = _5165;
    float _5173 = _5163 * (-2.0);
    float _5175 = _5137 * 6.283185482025146484375;
    float _5177 = cos(_5175);
    if (_5129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14158 = as_type<float>(_5171);
        out.gl_Position.z = _14158;
    }
    float _5179 = _5149 * 6.283185482025146484375;
    float _5181 = sin(_5179);
    if (_5129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5183 = -_3109;
    float _5185 = _5183 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5187 = -_2887;
    float _5189 = _5187 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5191 = -_3341;
    float _5193 = _5191 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5195 = fma(_5167, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5197 = _5185 * _5185;
    float _5199 = fma(_5173, _5025, _5025);
    float _5201 = _1501 + (-0.5);
    float _5203 = fma(_5195, _5173, _5195);
    float _5205 = fma(_5189, _5189, _5197);
    float _5207 = _5149 * 6.283185482025146484375;
    float _5209 = cos(_5207);
    float _5211 = fma(_5201, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5199);
    float _5213 = _3581 * _5139;
    float _5215 = fma(_5193, _5193, _5205);
    float _5217 = _5153 * _5181;
    float _5219 = fma(_5203, _4501, _5211);
    float _5221 = _634 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5223 = _5177 * _5181;
    float _5225 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5227 = rsqrt(_5215);
    float _5229 = _5219 * 0.15915493667125701904296875;
    float _5231 = _5213 * _5225;
    float _5233 = _5177 * _5209;
    float _5235 = _5229 * 6.283185482025146484375;
    float _5237 = sin(_5235);
    float _5239 = _5189 * _5227;
    float _5241 = _5193 * _5227;
    float _5243 = _5185 * _5227;
    float _5245 = in.m_87.x;
    float _5247 = in.m_87.y;
    float _5249 = in.m_87.z;
    float _5251 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5253 = _5239 * _5251;
    float _5255 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5257 = _5241 * _5255;
    float _5259 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5261 = _5243 * _5259;
    float _5263 = _5229 * 6.283185482025146484375;
    float _5265 = cos(_5263);
    float _5267 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5269 = -_5253;
    float _5271 = fma(_5241, _5267, _5269);
    float _5273 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5275 = -_5257;
    float _5277 = fma(_5243, _5273, _5275);
    float _5279 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5281 = -_5261;
    float _5283 = fma(_5239, _5279, _5281);
    float _5285 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5287 = _5271 * _5271;
    float _5289 = fma(_5237, _5233, _5217);
    float _5291 = fma(_5237, _5217, _5233);
    float _5293 = _5213 * _5285;
    float _5295 = fma(_5277, _5277, _5287);
    float _5297 = _5213 * _5221;
    float _5299 = fma(_5283, _5283, _5295);
    float _5301 = _5153 * _5209;
    float _5303 = _5177 * _5265;
    float _5305 = rsqrt(_5299);
    float _5307 = _5209 * _5265;
    float _5309 = _5153 * _5265;
    float _5311 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5247);
    float _5313 = _5181 * _5265;
    float _5315 = -_5223;
    float _5317 = fma(_5237, _5301, _5315);
    float _5319 = -_5301;
    float _5321 = fma(_5237, _5223, _5319);
    float _5323 = _5311 * _5293;
    float _5325 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5245);
    float _5327 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5249);
    float _5329 = _5303 * _5323;
    float _5331 = _5325 * _5297;
    float _5333 = _5327 * _5231;
    float _5335 = -_5323;
    float _5337 = _5237 * _5335;
    float _5339 = _5309 * _5323;
    float _5341 = _5277 * _5305;
    float _5343 = _5271 * _5305;
    float _5345 = fma(_5289, _5331, _5329);
    float _5347 = _5283 * _5305;
    float _5349 = _5243 * _5341;
    float _5351 = fma(_5307, _5331, _5337);
    float _5353 = fma(_5321, _5333, _5345);
    float _5355 = _5241 * _5343;
    float _5357 = -_5349;
    float _5359 = fma(_5239, _5343, _5357);
    float _5361 = fma(_5317, _5331, _5339);
    float _5363 = fma(_5313, _5333, _5351);
    float _5365 = -_5355;
    float _5367 = fma(_5243, _5347, _5365);
    float _5369 = _5359 * _5353;
    float _5371 = fma(_5291, _5333, _5361);
    float _5373 = _5239 * _5347;
    float _5375 = _5367 * _5353;
    float _5377 = fma(_5347, _5363, _5369);
    float _5379 = _5069 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5381 = -_5373;
    float _5383 = fma(_5241, _5341, _5381);
    float _5385 = fma(_5341, _5363, _5375);
    float _5387 = fma(_5241, _5371, _5377);
    float _5389 = fma(_5073, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5379);
    float _5391 = _5383 * _5353;
    float _5393 = fma(_5239, _5371, _5385);
    float _5395 = _3341 + _5387;
    float _5397 = fma(_5343, _5363, _5391);
    float _5399 = _2887 + _5393;
    float _5401 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5403 = _5395 + _5401;
    float _5405 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5407 = _5399 + _5405;
    float _5409 = _5403 * _5403;
    float _5411 = fma(_5407, _5407, _5409);
    float _5413 = fma(_5243, _5371, _5397);
    float _5415 = fma(_5095, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5389);
    float _5417 = sqrt(_5411);
    float _5419 = _3109 + _5413;
    bool _5421 = _5417 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5423 = _5389;
    float _5425 = _5413;
    float _5427 = _5371;
    if (!_5421)
    {
        _5423 = _5399;
    }
    float _5429 = _5423;
    float _5431 = _5429;
    if (!_5421)
    {
        _5425 = _5395;
    }
    float _5433 = _5425;
    float _5435 = _5433;
    if (!_5421)
    {
        _5427 = _5419;
    }
    float _5437 = _5427;
    bool _5439 = !_5421;
    float _5441 = _5437;
    if (!_5439)
    {
        float _5443 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5445 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5447 = _5417 + _5445;
        float _5449 = _5419 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5451 = rsqrt(_5411);
        float _5453 = _5447 * _5443;
        float _5455 = _5453 * 0.15915493667125701904296875;
        float _5457 = _5455 * 6.283185482025146484375;
        float _5459 = cos(_5457);
        float _5461 = _5455 * 6.283185482025146484375;
        float _5463 = sin(_5461);
        float _5465 = _5459 + (-1.0);
        float _5467 = _5465 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5469 = fma(_5463, _5449, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5471 = fma(_5419, _5459, _5467);
        float _5473 = _5451 * _5469;
        float _5475 = fma(_5407, _5473, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5477 = fma(_5403, _5473, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _5441 = _5471;
        _5431 = _5475;
        _5435 = _5477;
    }
    float _5479 = _5441;
    float _5481 = _5431;
    float _5483 = _5435;
    float _5485 = -_3109;
    float _5487 = _5485 + _5479;
    float _5489 = -_2887;
    float _5491 = _5489 + _5481;
    float _5493 = _5415 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5495 = _5069 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5497 = _5487 * _5487;
    float _5499 = -_3341;
    float _5501 = _5499 + _5483;
    float _5503 = 1.0 / _5493;
    float _5505 = fma(_5073, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5495);
    float _5507 = fma(_5491, _5491, _5497);
    float _5509 = fma(_5095, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5505);
    float _5511 = fma(_5501, _5501, _5507);
    bool _5513 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _5515 = isnan(0.5);
    bool _5517 = _5513 || _5515;
    bool _5519 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5521 = _5517 || _5519;
    float _5523 = _5509 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5525 = sqrt(_5511);
    bool _5527 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _5529 = isnan(0.5);
    bool _5531 = _5527 || _5529;
    bool _5533 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5535 = _5531 || _5533;
    float _5537 = _5523 + _5493;
    float _5539 = _5537 * _5503;
    float _5541 = _5539 * 0.5;
    float _5543 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5545 = fma(_5541, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5543);
    float _5547 = 1.0 / _5545;
    bool _5549 = _5525 > 0.0;
    bool _5551 = !_5549;
    float _5553 = _5481;
    float _5555 = _5483;
    float _5557 = _5479;
    float _5559 = _5511;
    if (!_5551)
    {
        float _5561 = _224 * _224;
        float _5563 = rsqrt(_5511);
        float _5565 = fma(_220, _220, _5561);
        float _5567 = fma(_226, _226, _5565);
        float _5569 = sqrt(_5567);
        float _5571 = _5491 * _5563;
        float _5573 = _5487 * _5563;
        float _5575 = _5501 * _5563;
        bool _5577 = _5569 > 0.0;
        bool _5579 = !_5577;
        if (!_5579)
        {
            float _5581 = rsqrt(_5567);
            float _5583 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5585 = _224 * _5581;
            float _5587 = _220 * _5581;
            float _5589 = _5573 * _5585;
            float _5591 = _226 * _5581;
            float _5593 = fma(_5571, _5587, _5589);
            float _5595 = _5583 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5597 = fma(_5575, _5591, _5593);
            float _5599 = _5597 * _5595;
            float _5601 = fma(_220, _5599, _5481);
            float _5603 = fma(_224, _5599, _5479);
            float _5605 = fma(_226, _5599, _5483);
            _5553 = _5601;
            _5555 = _5605;
            _5557 = _5603;
        }
    }
    float _5607 = _5553;
    float _5609 = _5555;
    float _5611 = _5557;
    float _5613 = -_3633;
    float _5615 = fma(_5613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5607);
    float _5617 = -_4285;
    float _5619 = fma(_5617, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5609);
    float _5621 = -_3627;
    float _5623 = fma(_5621, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5611);
    float _5625 = _5623;
    float _5627 = _5619;
    float _5629 = _5607;
    if (_5535)
    {
        _5559 = 1.0;
    }
    float _5631 = _5559;
    float _5633 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5635 = _5547 * _5633;
    float _5637 = _5631;
    if (_5521)
    {
        _4497 = _5615;
    }
    float _5639 = _4497;
    float _5641 = _5639;
    if (!_5521)
    {
        float _5643 = _5081 * _5081;
        float _5645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5647 = -_3341;
        float _5649 = _5647 + _5609;
        float _5651 = -_3109;
        float _5653 = _5651 + _5611;
        float _5655 = fma(_5087, _5087, _5643);
        float _5657 = -_2887;
        float _5659 = _5657 + _5607;
        float _5661 = fma(_5109, _5109, _5655);
        float _5663 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5665 = sqrt(_5661);
        float _5667 = 1.0 / _5213;
        float _5669 = _5663 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5671 = precise::min(_5665, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5673 = _5671 * _5645;
        float _5675 = _5673 * _5667;
        float _5677 = _5669 * _5675;
        float _5679 = _5649 * _5675;
        float _5681 = fma(_5653, _5677, _5069);
        float _5683 = fma(_5659, _5677, _5073);
        float _5685 = fma(_5669, _5679, _5095);
        _5625 = _5681;
        _5641 = _5683;
        _5627 = _5685;
        _5629 = _5659;
        _5157 = _5665;
    }
    float _5687 = _5625;
    float _5689 = _5641;
    float _5691 = _5627;
    float _5693 = _5629;
    float _5695 = _5157;
    float _5697 = _5693;
    float _5699 = _5695;
    if (!_5535)
    {
        float _5701 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5703 = _5701 * 0.15915493667125701904296875;
        float _5705 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5707 = _5703 * 6.283185482025146484375;
        float _5709 = cos(_5707);
        float _5711 = _5705 * 0.15915493667125701904296875;
        float _5713 = _5703 * 6.283185482025146484375;
        float _5715 = sin(_5713);
        float _5717 = 1.0 / _5709;
        float _5719 = _5711 * 6.283185482025146484375;
        float _5721 = cos(_5719);
        float _5723 = _5715 * _5717;
        float _5725 = _5711 * 6.283185482025146484375;
        float _5727 = sin(_5725);
        float _5729 = _5721 * _5723;
        float _5731 = 1.0 / _5729;
        float _5733 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5735 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5733;
        float _5737 = 1.0 / _5735;
        float _5739 = _5727 * _5731;
        float _5741 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5743 = fma(_5635, _5739, _5741);
        float _5745 = _5743 * _5737;
        float _5747 = precise::clamp(_5745, 0.0, 1.0);
        _5697 = _5703;
        _5699 = _5711;
        _5637 = _5747;
    }
    float _5749 = _5697;
    float _5751 = _5699;
    float _5753 = _5637;
    float _5755 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5757 = _5687 + _5755;
    float _5759 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5761 = _5689 + _5759;
    float _5763 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5765 = _5691 + _5763;
    float _5767 = _5757 * _5757;
    float _5769 = fma(_5761, _5761, _5767);
    float _5771 = fma(_5765, _5765, _5769);
    float _5773 = rsqrt(_5771);
    float _5775 = sqrt(_5771);
    float _5777 = _5773 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _5779 = _5761 * _5777;
    float _5781 = _5765 * _5777;
    float _5783 = _5779 * _5779;
    float _5785 = _5781 * _5781;
    float _5787 = _5783 + _5785;
    float _5789 = sqrt(_5787);
    bool _5791 = _5789 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5793 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5795 = _5789 + _5793;
    float _5797 = _5769;
    float _5799 = _5787;
    float _5801 = _5795;
    float _5803 = _5749;
    float _5805 = _5757;
    float _5807 = _5777;
    if (_5791)
    {
        float _5809 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5797 = _5809;
    }
    float _5811 = _5797;
    if (_5791)
    {
        float _5813 = rsqrt(_5787);
        _5799 = _5813;
    }
    float _5815 = _5799;
    float _5817 = _5815;
    if (_5791)
    {
        float _5819 = _5795 * _5811;
        _5801 = _5819;
    }
    float _5821 = _5801;
    if (_5791)
    {
        float _5823 = _5821 * 0.15915493667125701904296875;
        _5803 = _5823;
    }
    float _5825 = _5803;
    float _5827 = _5765;
    if (_5791)
    {
        float _5829 = _5825 * 6.283185482025146484375;
        float _5831 = sin(_5829);
        _5827 = _5831;
    }
    float _5833 = _5827;
    float _5835 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5837 = precise::max(0.0, _5835);
    float _5839 = _5751;
    if (_5791)
    {
        float _5841 = _5825 * 6.283185482025146484375;
        float _5843 = cos(_5841);
        _5839 = _5843;
    }
    float _5845 = _5839;
    float _5847 = -_5777;
    float _5849 = -_5837;
    float _5851 = fma(_5757, _5847, _5849);
    float _5853 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_5791)
    {
        float _5855 = _5851 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5805 = _5855;
    }
    float _5857 = _5805;
    float _5859 = fma(_5073, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _5861 = _5857;
    float _5863 = _5833;
    if (_5791)
    {
        float _5865 = fma(_5833, _5857, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5861 = _5865;
    }
    float _5867 = _5861;
    float _5869 = _5867;
    if (!_5791)
    {
        _5863 = _5779;
    }
    float _5871 = _5863;
    float _5873 = _5871;
    if (_5791)
    {
        float _5875 = _5845 + (-1.0);
        _5853 = _5875;
    }
    float _5877 = _5853;
    float _5879 = _5877;
    if (_5791)
    {
        float _5881 = _5815 * _5867;
        _5807 = _5881;
    }
    float _5883 = _5807;
    if (!_5791)
    {
        _5869 = _5851;
    }
    float _5885 = _5869;
    float _5887 = _5885;
    if (_5791)
    {
        float _5889 = _5877 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5159 = _5889;
    }
    float _5891 = _5159;
    float _5893 = _5891;
    if (_5791)
    {
        float _5895 = _5779 * _5883;
        _5873 = _5895;
    }
    float _5897 = _5873;
    if (!_5791)
    {
        _5879 = _5781;
    }
    float _5899 = _5879;
    float _5901 = _5899;
    if (_5791)
    {
        float _5903 = _5781 * _5883;
        _5901 = _5903;
    }
    float _5905 = _5901;
    if (!_5791)
    {
        _5817 = _5783;
    }
    float _5907 = _5817;
    float _5909 = _5907;
    if (_5791)
    {
        float _5911 = fma(_5851, _5845, _5891);
        _5887 = _5911;
    }
    float _5913 = _5887;
    if (_5791)
    {
        float _5915 = _5897 * _5897;
        _5909 = _5915;
    }
    float _5917 = _5909;
    if (!_5791)
    {
        _5893 = _5785;
    }
    float _5919 = _5893;
    float _5921 = _5919;
    if (_5791)
    {
        float _5923 = _5905 * _5905;
        _5921 = _5923;
    }
    float _5925 = _5921;
    float _5927 = fma(_5913, _5913, _5917);
    float _5929 = _5687 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _5931 = floor(_5859);
    float _5933 = _5927 + _5925;
    float _5935 = fma(_5689, (*spvDescriptorSet0.vp_c8)._m0[2].x, _5929);
    float _5937 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5939 = fma(_5775, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5937);
    float _5941 = precise::clamp(_5939, 0.0, 1.0);
    float _5943 = fma(_5691, (*spvDescriptorSet0.vp_c8)._m0[2].z, _5935);
    float _5945 = rsqrt(_5933);
    float _5947 = -_5941;
    float _5949 = _5947 + 1.0;
    float _5951 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _5953 = _5943 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _5955 = fma(_5095, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _5957 = _5687 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _5959 = _5953 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _5961 = abs(_5949);
    float _5963 = log2(_5961);
    float _5965 = _5687 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5967 = -_5931;
    float _5969 = _5859 + _5967;
    float _5971 = -_5959;
    float _5973 = fma(_5971, _5951, 1.0);
    float _5975 = _5687 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _5977 = fma(_5689, (*spvDescriptorSet0.vp_c8)._m0[1].x, _5965);
    float _5979 = fma(_5689, (*spvDescriptorSet0.vp_c8)._m0[3].x, _5957);
    float _5981 = _5945 * _5913;
    float _5983 = _5945 * _5897;
    float _5985 = fma(_5689, (*spvDescriptorSet0.vp_c8)._m0[0].x, _5975);
    float _5987 = fma(_5691, (*spvDescriptorSet0.vp_c8)._m0[1].z, _5977);
    float _5989 = _5945 * _5905;
    float _5991 = _5983 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5993 = fma(_5691, (*spvDescriptorSet0.vp_c8)._m0[0].z, _5985);
    float _5995 = _5987 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _5997 = fma(_5691, (*spvDescriptorSet0.vp_c8)._m0[3].z, _5979);
    float _5999 = -_5991;
    float _6001 = fma(_5981, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5999);
    float _6003 = _5993 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6005 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6007 = _5963 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6009 = -_5989;
    float _6011 = fma(_6009, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6001);
    float _6013 = _5997 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6015 = fma(_6003, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6005);
    float _6017 = exp2(_6007);
    float _6019 = fma(_6011, -0.5, 0.5);
    float _6021 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6023 = fma(_5953, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6015);
    float _6025 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6027 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6023);
    float _6029 = floor(_5955);
    float _6031 = fma(_6011, 0.5, 0.5);
    float _6033 = fma(_6003, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6021);
    float _6035 = fma(_6003, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6025);
    float _6037 = _5981 + 1.0;
    float _6039 = fma(_6031, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6041 = fma(_5953, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6033);
    float _6043 = fma(_5953, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6035);
    float _6045 = log2(_5973);
    float _6047 = fma(_6031, _6039, -0.212114393711090087890625);
    float _6049 = -_5981;
    float _6051 = fma(_6017, _6037, _6049);
    float _6053 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6041);
    float _6055 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6043);
    float _6057 = fma(_6031, _6047, 1.570728778839111328125);
    float _6059 = fma(_6051, 0.5, 0.5);
    float _6061 = 1.0 / _6027;
    float _6063 = -_6029;
    float _6065 = _5955 + _6063;
    float _6067 = sqrt(_6019);
    float _6069 = _6045 * 0.693147182464599609375;
    float2 _15568 = float2(_5969, _6065);
    float _6071 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_15568, float2(0.0), isnan(_15568)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_15568, float2(0.0), isnan(_15568)), level(0.0)).x;
    float _6073 = _6069 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6075 = _6053 * _6061;
    float _6077 = _6055 * _6061;
    float _6079 = fma(_6075, 0.5, 0.5);
    float _6081 = fma(_6077, -0.5, 0.5);
    float _6083 = _6067 * 0.636619746685028076171875;
    float3 _15596 = float3(_6079, _6081, _6073);
    float _6085 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_15596, float3(0.0), isnan(_15596)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_15596, float3(0.0), isnan(_15596)), level(0.0)).x;
    float3 _15607 = float3(_6079, _6081, _6073);
    float4 _6088 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_15607, float3(0.0), isnan(_15607)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_15607, float3(0.0), isnan(_15607)), level(0.0)).xyzw;
    float _6090 = _6088.x;
    float _6092 = _6088.y;
    float _6094 = _6088.z;
    float _6096 = _6088.w;
    float _6098 = -_6057;
    float _6100 = fma(_6083, _6098, 1.0);
    float2 _15628 = float2(_6100, _6059);
    float3 _6104 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_15628, float2(0.0), isnan(_15628)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_15628, float2(0.0), isnan(_15628)), level(0.0)).xyz;
    float _6106 = _6104.x;
    float _6108 = _6104.y;
    float _6110 = _6104.z;
    float _6112 = abs(_5635);
    float _6114 = log2(_6112);
    float _6116 = in.m_89.x;
    float _6118 = in.m_89.y;
    float _6120 = in.m_89.z;
    bool _6122 = _5247 != 0.0;
    bool _6124 = isnan(_5247);
    bool _6126 = _6122 || _6124;
    bool _6128 = isnan(0.0);
    bool _6130 = _6126 || _6128;
    float _6132 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6134 = in.m_91.x;
    float _6136 = in.m_91.y;
    float _6138 = in.m_91.z;
    float _6140 = in.m_91.w;
    bool _6142 = _5245 == 0.0;
    bool _6144 = !_6130;
    bool _6146 = _6142 && _6144;
    float _6148 = _5321 * _5383;
    bool _6150 = _5249 == 0.0;
    bool _6152 = _6150 && _6146;
    float _6154 = fma(_6003, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6132);
    bool _6156 = _5635 <= 8000.0;
    bool _6158 = isnan(_5635);
    bool _6160 = _6156 || _6158;
    bool _6162 = isnan(8000.0);
    bool _6164 = _6160 || _6162;
    float _6166 = float(_6164);
    float _6168 = fma(_5313, _5343, _6148);
    float _6170 = _6114 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6172 = fma(_5291, _5243, _6168);
    float _6174 = exp2(_6170);
    float _6176 = _6065;
    float _6178 = _6114;
    float _6180 = _6116;
    float _6182 = _6027;
    float _6184 = _6053;
    float _6186 = _6055;
    if (_6152)
    {
        _5065 = _6116;
    }
    float _6188 = _5065;
    float _6190 = _6188;
    if (_6152)
    {
        _3501 = _6118;
    }
    float _6192 = _3501;
    float _6194 = _6192;
    if (_6152)
    {
        _6176 = _6188;
    }
    float _6196 = _6176;
    float _6198 = _6196;
    if (!_6152)
    {
        _6190 = _6116;
    }
    float _6200 = _6190;
    if (_6152)
    {
        _6178 = _6192;
    }
    float _6202 = _6178;
    float _6204 = _6202;
    if (!_6152)
    {
        _6194 = _6118;
    }
    float _6206 = _6194;
    if (!_6152)
    {
        float _6208 = fma(_5245, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6200);
        _6198 = _6208;
    }
    float _6210 = _6198;
    if (_6152)
    {
        _6180 = _6120;
    }
    float _6212 = _6180;
    float _6214 = _6212;
    if (!_6152)
    {
        float _6216 = fma(_5249, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6120);
        _6214 = _6216;
    }
    float _6218 = _6214;
    if (!_6152)
    {
        float _6220 = fma(_5247, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6206);
        _6204 = _6220;
    }
    float _6222 = _6204;
    float _6224 = _6136 * _6120;
    float _6226 = _6138 * _6200;
    float _6228 = _6134 * _6206;
    float _6230 = fma(_6174, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6232 = precise::clamp(_6230, 0.0, 1.0);
    float _6234 = -_6224;
    float _6236 = fma(_6138, _6206, _6234);
    float _6238 = -_6226;
    float _6240 = fma(_6134, _6120, _6238);
    float _6242 = -_6228;
    float _6244 = fma(_6136, _6200, _6242);
    float _6246 = fma(_6232, -2.0, 3.0);
    float _6248 = _6232 * _6232;
    float _6250 = _6240 * _6140;
    float _6252 = _6236 * _6140;
    float _6254 = _6244 * _6140;
    float _6256 = _6248 * _6246;
    float _6258 = _5303 * _5383;
    float _6260 = _5289 * _5367;
    float _6262 = _5289 * _5383;
    float _6264 = _5289 * _5359;
    float _6266 = _5303 * _5367;
    float _6268 = _5303 * _5359;
    float _6270 = -_5237;
    float _6272 = fma(_6270, _5343, _6258);
    float _6274 = _5321 * _5367;
    float _6276 = _5321 * _5359;
    float _6278 = fma(_5307, _5343, _6262);
    float _6280 = -_5237;
    float _6282 = fma(_6280, _5341, _6266);
    float _6284 = -_5237;
    float _6286 = fma(_6284, _5347, _6268);
    float _6288 = -_6256;
    float _6290 = _6288 + 1.0;
    float _6292 = fma(_5307, _5341, _6260);
    float _6294 = fma(_5309, _5243, _6272);
    float _6296 = fma(_5307, _5347, _6264);
    float _6298 = fma(_5313, _5341, _6274);
    float _6300 = fma(_5313, _5347, _6276);
    float _6302 = fma(_5309, _5239, _6282);
    float _6304 = fma(_6290, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6256);
    float _6306 = fma(_5317, _5243, _6278);
    float _6308 = fma(_5309, _5241, _6286);
    float _6310 = fma(_5317, _5239, _6292);
    float _6312 = _6294 * _6136;
    float _6314 = _6294 * _6222;
    float _6316 = _6250 * _6294;
    float _6318 = fma(_5317, _5241, _6296);
    float _6320 = fma(_5291, _5239, _6298);
    float _6322 = fma(_5291, _5241, _6300);
    float _6324 = _6302 * _6136;
    float _6326 = _6302 * _6222;
    float _6328 = _6250 * _6302;
    float _6330 = _6250 * _6308;
    float _6332 = fma(_6306, _6134, _6312);
    float _6334 = fma(_6306, _6210, _6314);
    float _6336 = fma(_6252, _6306, _6316);
    float _6338 = _5963 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6340 = _6308 * _6136;
    float _6342 = fma(_6172, _6138, _6332);
    float _6344 = fma(_6310, _6134, _6324);
    float _6346 = in.m_93.x;
    float _6348 = fma(_6318, _6134, _6340);
    float _6350 = exp2(_6338);
    float _6352 = _6308 * _6222;
    float _6354 = _6166 * _6304;
    float _6356 = fma(_6320, _6138, _6344);
    float _6358 = fma(_6322, _6138, _6348);
    float _6360 = fma(_6310, _6210, _6326);
    float _6362 = fma(_6318, _6210, _6352);
    float _6364 = _6354 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6366 = fma(_6252, _6310, _6328);
    float _6368 = fma(_6252, _6318, _6330);
    float _6370 = fma(_6172, _6218, _6334);
    float _6372 = fma(_6320, _6218, _6360);
    float _6374 = fma(_6322, _6218, _6362);
    float _6376 = fma(_5953, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6154);
    float _6378 = fma(_6254, _6320, _6366);
    float _6380 = -_6350;
    float _6382 = _6380 + 1.0;
    float _6384 = fma(_6254, _6172, _6336);
    float _6386 = fma(_6254, _6322, _6368);
    float _6388 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6376);
    float _6390 = _6382 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6392 = _6027 * 0.5;
    float _6394 = _6053 + _6027;
    out.m_95.x = _6378;
    out.m_95.y = _6384;
    out.m_95.z = _6386;
    float _6396 = _6388 + _6027;
    float _6398 = fma(_6055, -0.5, _6392);
    float _6400 = _6394 * 0.5;
    float _6402 = _6396 * 0.5;
    out.m_97.x = _6356;
    out.m_97.y = _6342;
    out.m_97.z = _6358;
    bool _6404 = _5775 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6406 = isnan(_5775);
    bool _6408 = _6404 || _6406;
    bool _6410 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6412 = _6408 || _6410;
    out.m_99.x = _6400;
    out.m_99.y = _6398;
    out.m_99.z = _6402;
    out.m_99.w = _6027;
    out.m_101.x = _6372;
    out.m_101.y = _6370;
    out.m_101.z = _6374;
    out.gl_Position.x = _6053;
    out.gl_Position.y = _6055;
    out.gl_Position.z = _6388;
    out.gl_Position.w = _6027;
    float _6414 = _6386;
    float _6416 = _6384;
    if (!_6412)
    {
        _6414 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6418 = _6414;
    float _6420 = _6418;
    float _6422 = _6418;
    if (!_6412)
    {
        _6416 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6424 = _6416;
    float _6426 = _5753 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6428 = _6424;
    float _6430 = _6424;
    if (!_6412)
    {
        _6182 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6432 = _6182;
    float _6434 = _6432;
    float _6436 = _6432;
    if (!_6412)
    {
        _6184 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6438 = _6184;
    float _6440 = _6438;
    float _6442 = _6438;
    if (!_6412)
    {
        _6186 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6444 = _6186;
    float _6446 = -_6071;
    float _6448 = _6446 + 1.0;
    float _6450 = _6448 * _6364;
    float _6452 = precise::clamp(_6450, 0.0, 1.0);
    float _6454 = -_6452;
    float _6456 = fma(_6454, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6458 = _6456 * _6346;
    float _6460 = _6390 * _6085;
    float _6462 = -_6390;
    float _6464 = _6462 + 1.0;
    float _6466 = _6458 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6468 = _6096 * _6460;
    float _6470 = _6096 * _6464;
    out.m_103.x = _6466;
    float _6472 = _6110 * _6460;
    float _6474 = fma(_6106, _6468, _6090);
    float _6476 = fma(_6108, _6468, _6092);
    float _6478 = _6468;
    float _6480 = _6444;
    float _6482 = _6444;
    if (!_6412)
    {
        _6478 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6484 = _6478;
    float _6486 = fma(_6096, _6472, _6094);
    out.m_105.x = _6474;
    out.m_105.y = _6476;
    out.m_105.z = _6486;
    out.m_105.w = _6470;
    bool _6488 = !_6412;
    float _6490 = _6484;
    float _6492 = _6484;
    if (!_6488)
    {
        bool _6494 = _5775 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6496 = isnan(_5775);
        bool _6498 = _6494 || _6496;
        bool _6500 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6502 = _6498 || _6500;
        if (!_6502)
        {
            float _6504 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6506 = _5775 + _6504;
            float _6508 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6510 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6508;
            float _6512 = 1.0 / _6510;
            float _6514 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6516 = _6514 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6518 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6520 = _6518 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6522 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6524 = _6522 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6526 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6528 = _6526 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6530 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6532 = _6530 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6534 = _6506 * _6512;
            float _6536 = precise::clamp(_6534, 0.0, 1.0);
            float _6538 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6540 = _6538 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6542 = fma(_6536, _6520, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6544 = fma(_6536, _6540, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6546 = fma(_6536, _6516, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6548 = fma(_6536, _6524, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6550 = fma(_6536, _6528, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6552 = fma(_6536, _6532, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6430 = _6546;
            _6442 = _6550;
            _6422 = _6544;
            _6436 = _6548;
            _6492 = _6542;
            _6482 = _6552;
            _6554 = true;
        }
        else
        {
            bool _6556 = _5775 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6558 = isnan(_5775);
            bool _6560 = _6556 || _6558;
            bool _6562 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6564 = _6560 || _6562;
            if (!_6564)
            {
                _6434 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6566 = _6434;
            _6436 = _6566;
            if (!_6564)
            {
                _6440 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6568 = _6440;
            _6442 = _6568;
            if (!_6564)
            {
                _6480 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6570 = _6480;
            _6482 = _6570;
            if (!_6564)
            {
                _6420 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6572 = _6420;
            _6422 = _6572;
            if (!_6564)
            {
                _6428 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6574 = _6428;
            _6430 = _6574;
            if (!_6564)
            {
                _6490 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6576 = _6490;
            bool _6578 = !_6564;
            _6492 = _6576;
            if (!_6578)
            {
                bool _6580 = _5775 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6582 = isnan(_5775);
                bool _6584 = _6580 || _6582;
                bool _6586 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6588 = _6584 || _6586;
                if (!_6588)
                {
                    float _6590 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6592 = _5775 + _6590;
                    float _6594 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6596 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6594;
                    float _6598 = 1.0 / _6596;
                    float _6600 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6602 = _6600 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6604 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6606 = _6604 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6608 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6610 = _6608 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6612 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6614 = _6612 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6616 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6618 = _6616 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6620 = _6592 * _6598;
                    float _6622 = precise::clamp(_6620, 0.0, 1.0);
                    float _6624 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6626 = _6624 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6628 = fma(_6622, _6606, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6630 = fma(_6622, _6626, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6632 = fma(_6622, _6602, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6634 = fma(_6622, _6610, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6636 = fma(_6622, _6614, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6638 = fma(_6622, _6618, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6430 = _6632;
                    _6442 = _6636;
                    _6422 = _6630;
                    _6436 = _6634;
                    _6492 = _6628;
                    _6482 = _6638;
                    _6554 = true;
                }
                else
                {
                    _6430 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6442 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6422 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6436 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6492 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6482 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6554 = false;
    float _6640 = _6430;
    float _6642 = _6442;
    float _6644 = _6422;
    float _6646 = _6436;
    float _6648 = _6492;
    float _6650 = _6482;
    float _6652 = fma(_6370, -0.5, 0.5);
    float _6654 = precise::clamp(_6652, 0.0, 1.0);
    float _6656 = -_6640;
    float _6658 = _6642 + _6656;
    float _6660 = _6426 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6662 = -_6644;
    float _6664 = _6646 + _6662;
    float _6666 = fma(_6654, _6658, _6640);
    out.m_107.x = 0.0;
    float _6668 = -_6648;
    float _6670 = _6650 + _6668;
    float _6672 = fma(_6654, _6664, _6644);
    float _6674 = _6666 * 0.586610972881317138671875;
    out.m_49.x = _6660;
    bool _6676 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6678 = fma(_6654, _6670, _6648);
    float _6680 = fma(_6672, 0.298911988735198974609375, _6674);
    bool _6682 = _5753 > 0.0;
    bool _6684 = isnan(_5753);
    bool _6686 = _6682 || _6684;
    bool _6688 = isnan(0.0);
    bool _6690 = _6686 || _6688;
    float _6692 = fma(_6678, 0.114477999508380889892578125, _6680);
    float _6694 = -_6692;
    float _6696 = _6672 + _6694;
    float _6698 = -_6692;
    float _6700 = _6666 + _6698;
    float _6702 = -_6692;
    float _6704 = _6678 + _6702;
    float _6706 = fma(_6696, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6692);
    float _6708 = fma(_6700, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6692);
    float _6710 = fma(_6704, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6692);
    bool _6712 = !_6676;
    if (!_6712)
    {
        float _6714 = -_5687;
        float _6716 = _6714 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6718 = -_5689;
        float _6720 = _6718 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6722 = -_5691;
        float _6724 = _6722 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6726 = _6716 * _6716;
        float _6728 = fma(_6720, _6720, _6726);
        float _6730 = fma(_6724, _6724, _6728);
        float _6732 = sqrt(_6730);
        float _6734 = rsqrt(_6730);
        float _6736 = -_6732;
        float _6738 = _6736 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6740 = _6738 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6742 = precise::clamp(_6740, 0.0, 1.0);
        float _6744 = _6720 * _6734;
        float _6746 = _6716 * _6734;
        float _6748 = abs(_6742);
        float _6750 = log2(_6748);
        float _6752 = _6724 * _6734;
        float _6754 = _6744 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6756 = _6370 * _6746;
        float _6758 = -_6746;
        float _6760 = -_6754;
        float _6762 = fma(_6758, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6760);
        float _6764 = fma(_6372, _6744, _6756);
        float _6766 = -_6752;
        float _6768 = fma(_6766, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6762);
        float _6770 = fma(_6374, _6752, _6764);
        float _6772 = precise::clamp(_6770, 0.0, 1.0);
        float _6774 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6776 = _6768 + _6774;
        float _6778 = _6750 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6780 = _6776 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6782 = precise::clamp(_6780, 0.0, 1.0);
        float _6784 = exp2(_6778);
        float _6786 = _6784 * _6782;
        float _6788 = _6772 * _6786;
        float _6790 = _6788 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6792 = _6788 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6794 = _6788 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _6790;
        out.m_107.y = _6792;
        out.m_107.z = _6794;
    }
    out.m_109.x = _6706;
    out.m_109.y = _6708;
    out.m_109.z = _6710;
    if (_6690)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _6796 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6796;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6554 = false;
    bool _1144 = false;
    bool _820 = false;
    bool _678 = false;
    bool _524 = false;
    bool _248 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _6853 = as_type<float>(_144);
        out.gl_Position.z = _6853;
    }
    if (!_132)
    {
        return out;
    }
    float _148 = in.m_51.w;
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
        out.m_49.x = 0.0;
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
        float _6922 = as_type<float>(_182);
        out.gl_Position.z = _6922;
    }
    if (_176)
    {
        return out;
    }
    float _184 = in.m_53.x;
    float _186 = in.m_53.y;
    float _188 = in.m_53.z;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = in.m_55.x;
    float _194 = in.m_55.y;
    float _196 = in.m_55.z;
    float _198 = in.m_57.x;
    float _200 = in.m_57.y;
    float _202 = in.m_57.z;
    float _204 = in.m_59.x;
    float _206 = in.m_59.y;
    float _208 = in.m_59.z;
    float _210 = _186 * _194;
    float _212 = _186 * _200;
    float _214 = fma(_184, _192, _210);
    float _216 = _186 * _206;
    float _218 = fma(_184, _198, _212);
    float _220 = fma(_188, _196, _214);
    float _222 = fma(_184, _204, _216);
    float _224 = fma(_188, _202, _218);
    float _226 = fma(_188, _208, _222);
    bool _228 = !_190;
    float _246;
    if (!_228)
    {
        float _230 = in.m_61.x;
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
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = _256 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _256 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = 1.0 / _276;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _290 = 1.0 / _280;
    bool _292 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _294 = isnan(_256);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = 1.0 / _272;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _256 + _306;
    float _310 = _308 * _286;
    bool _312 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _314 = isnan(_256);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = 1.0 / _284;
    float _326 = _260 * _290;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _332;
    float _336 = _264 * _304;
    bool _338 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _340 = isnan(_256);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_322;
    float _352 = _350 + 1.0;
    float _354 = fma(_334, _326, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = fma(_330, _326, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _358 = _348 * _352;
    float _360 = -_348;
    float _362 = _360 + 1.0;
    float _364 = _268 * _324;
    bool _366 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _368 = isnan(_256);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _378;
    bool _382 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _384 = isnan(_256);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = fma(_380, _326, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = -_376;
    float _402 = _400 + 1.0;
    float _404 = _376 * _362;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = _302 * _402;
    float _416 = -_302;
    float _418 = _416 + 1.0;
    float _420 = fma(_396, _364, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_412, _364, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = fma(_408, _364, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = _392 * _418;
    float _428 = -_392;
    float _430 = _428 + 1.0;
    float _432 = _354 * _426;
    float _434 = _356 * _426;
    float _436 = _398 * _426;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _438;
    float _442 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _432);
    float _444 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _434);
    float _446 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].z, _436);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _452;
    float _456 = fma(_420, _414, _442);
    float _458 = fma(_422, _414, _444);
    float _460 = fma(_424, _414, _446);
    float _462 = fma(_440, _336, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _464 = fma(_450, _336, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _466 = fma(_454, _336, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _480 = fma(_462, _404, _456);
    float _482 = fma(_470, _310, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _484 = fma(_474, _310, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _486 = fma(_478, _310, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _488 = fma(_464, _404, _458);
    float _490 = fma(_466, _404, _460);
    float _492 = fma(_482, _358, _480);
    float _494 = fma(_484, _358, _488);
    float _496 = fma(_486, _358, _490);
    float _498 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[147].x, _492);
    float _500 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[147].y, _494);
    float _502 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[147].z, _496);
    bool _504 = !_288;
    float _522;
    if (!_504)
    {
        float _506 = in.m_61.x;
        float _508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _510 = _506 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[11].y, _162);
        float _514 = _512 * _508;
        float _516 = floor(_514);
        float _518 = -_516;
        float _520 = _514 + _518;
        _522 = _520;
        _524 = true;
    }
    else
    {
        float _526 = float(_128);
        float _528 = 1.0 / _526;
        float _530 = _162 * _528;
        _522 = _530;
    }
    _524 = false;
    float _532 = _522;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _536 = _532 + _534;
    float _538 = in.m_63.x;
    float _540 = in.m_63.y;
    float _542 = in.m_63.z;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _548 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = isnan(_532);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _564 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _566 = isnan(_532);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _576;
    bool _580 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _582 = isnan(_532);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = 1.0 / _546;
    float _594 = -_558;
    float _596 = _594 + 1.0;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _600 = _532 + _598;
    bool _602 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _604 = _574 * _596;
    float _606 = -_574;
    float _608 = _606 + 1.0;
    float _610 = 1.0 / _562;
    float _612 = _578 * _592;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _618 = fma(_612, _536, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _620 = _616 * _610;
    float _622 = -_590;
    float _624 = _622 + 1.0;
    float _626 = _618 * _604;
    float _628 = fma(_620, _600, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _630 = _558 * _624;
    float _632 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[115].x, _626);
    float _634 = _498 * _538;
    float _636 = fma(_628, _630, _632);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _642 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[117].x, _636);
    float _644 = _500 * _540;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _648 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _650 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _652 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _654 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = _502 * _542;
    out.m_65.x = _648;
    out.m_65.y = _650;
    out.m_65.z = _654;
    out.m_65.w = _652;
    bool _658 = !_602;
    float _676;
    if (!_658)
    {
        float _660 = in.m_61.x;
        float _662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _664 = _660 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[11].w, _162);
        float _668 = _666 * _662;
        float _670 = floor(_668);
        float _672 = -_670;
        float _674 = _668 + _672;
        _676 = _674;
        _678 = true;
    }
    else
    {
        float _680 = float(_128);
        float _682 = 1.0 / _680;
        float _684 = _162 * _682;
        _676 = _684;
    }
    _678 = false;
    float _686 = _676;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _690 = _686 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _696 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _698 = isnan(_686);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _712 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _714 = isnan(_686);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _724;
    bool _728 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _730 = isnan(_686);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = 1.0 / _694;
    float _742 = -_706;
    float _744 = _742 + 1.0;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _748 = _686 + _746;
    bool _750 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _752 = _722 * _744;
    float _754 = -_722;
    float _756 = _754 + 1.0;
    float _758 = 1.0 / _710;
    float _760 = _726 * _740;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _766 = fma(_760, _690, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _768 = -_738;
    float _770 = _768 + 1.0;
    float _772 = _764 * _758;
    float _774 = _766 * _752;
    float _776 = _706 * _770;
    float _778 = fma(_772, _748, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _780 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[131].x, _774);
    float _782 = fma(_778, _776, _780);
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _790 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[133].x, _782);
    float _792 = _784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _794 = _786 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _798 = _790 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.x = _792;
    out.m_67.y = _794;
    out.m_67.z = _796;
    out.m_67.w = _798;
    bool _800 = !_750;
    float _818;
    if (!_800)
    {
        float _802 = in.m_61.x;
        float _804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _806 = _802 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _808 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[14].x, _162);
        float _810 = _808 * _804;
        float _812 = floor(_810);
        float _814 = -_812;
        float _816 = _810 + _814;
        _818 = _816;
        _820 = true;
    }
    else
    {
        float _822 = float(_128);
        float _824 = 1.0 / _822;
        float _826 = _162 * _824;
        _818 = _826;
    }
    _820 = false;
    float _828 = _818;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _832 = _828 + _830;
    bool _834 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _836 = isnan(_828);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _850;
    bool _854 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _856 = isnan(_828);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = -_844;
    float _868 = _866 + 1.0;
    bool _870 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _872 = isnan(_828);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = 1.0 / _848;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _886 = _884 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _888 = _864 * _868;
    float _890 = -_880;
    float _892 = _890 + 1.0;
    float _894 = 1.0 / _886;
    bool _896 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _898 = _852 * _882;
    float _900 = -_864;
    float _902 = _900 + 1.0;
    bool _904 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _906 = isnan(_828);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = fma(_898, _832, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _918 = _880 * _902;
    bool _920 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _922 = isnan(_828);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = _914 * _892;
    float _934 = -_914;
    float _936 = _934 + 1.0;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _942 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _944 = isnan(_828);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = _930 * _936;
    float _956 = -_930;
    float _958 = _956 + 1.0;
    bool _960 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _962 = isnan(_828);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = 1.0 / _940;
    float _974 = -_952;
    float _976 = _974 + 1.0;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _982 = _952 * _958;
    float _984 = _970 * _976;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _990 = -_970;
    float _992 = _990 + 1.0;
    float _994 = 1.0 / _980;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1000 = _916 * _984;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1008 = _828 + _1006;
    float _1010 = _998 * _894;
    float _1012 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1000);
    float _1014 = 1.0 / _988;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1016;
    float _1020 = fma(_1010, _1008, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1028 = _828 + _1026;
    float _1030 = _1018 * _972;
    float _1032 = fma(_1020, _982, _1012);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1036 = _828 + _1034;
    float _1038 = 1.0 / _1004;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1044 = fma(_1030, _1028, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1046 = _1042 * _994;
    bool _1048 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1050 = isnan(_828);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1060;
    float _1064 = 1.0 / _1024;
    float _1066 = fma(_1044, _954, _1032);
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1072 = _1062 * _1014;
    float _1074 = fma(_1046, _1036, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1078 = _828 + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1082 = _828 + _1080;
    float _1084 = _1070 * _1038;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1086;
    float _1090 = fma(_1072, _1078, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1092 = fma(_1074, _932, _1066);
    float _1094 = fma(_1084, _1082, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1096 = -_1058;
    float _1098 = _1096 + 1.0;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1102 = _828 + _1100;
    float _1104 = fma(_1090, _918, _1092);
    float _1106 = _1088 * _1064;
    float _1108 = _844 * _1098;
    float _1110 = fma(_1094, _888, _1104);
    float _1112 = fma(_1106, _1102, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1114 = fma(_1112, _1108, _1110);
    float _1116 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1114);
    out.m_69.x = _1116;
    bool _1118 = !_896;
    int _1120 = as_type<int>(_888);
    float _1122 = _1014;
    float _1124 = _1064;
    float _1142;
    if (!_1118)
    {
        float _1126 = in.m_61.x;
        float _1128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1130 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[14].y, _162);
        float _1134 = _1132 * _1128;
        float _1136 = floor(_1134);
        float _1138 = -_1136;
        float _1140 = _1134 + _1138;
        _1142 = _1140;
        _1144 = true;
    }
    else
    {
        float _1146 = float(_128);
        float _1148 = 1.0 / _1146;
        float _1150 = _162 * _1148;
        _1142 = _1150;
    }
    _1144 = false;
    float _1152 = _1142;
    float _1154 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1156 = int(_1154);
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1160 = _1158 != 0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1164 = _1162 != 0;
    float _1166 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1168 = int(_1166);
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1172 = _1170 != 0;
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1176 = _1174 != 0;
    float _1178 = 0.0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _1182 = _1172;
    bool _1184 = _1176;
    if (_1160)
    {
        _1178 = 1.0;
    }
    float _1186 = _1178;
    float _1188 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1190 = int(_1188);
    float _1192 = float(_1156);
    float _1194 = 0.0;
    float _1196 = _1186;
    if (_1160)
    {
        _1194 = 1.0;
    }
    float _1198 = _1194;
    float _1200 = 0.0;
    float _1202 = _1198;
    if (_1160)
    {
        _1200 = 1.0;
    }
    float _1204 = _1200;
    int _1206 = 0;
    float _1208 = _1204;
    if (_1160)
    {
        _1206 = 0;
    }
    int _1210 = _1206;
    float _1212 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1214 = int(_1212);
    float _1216 = float(_1168);
    int _1218 = _1210;
    if (_1160)
    {
        _1180 = 0;
    }
    int _1220 = _1180;
    float _1222 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1224 = int(_1222);
    float _1226 = float(_1190);
    float _1228 = float(_1214);
    float _1230 = 1.0 / _1192;
    float _1232 = float(uint(_1224));
    float _1234 = 1.0 / _1216;
    float _1236 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1238 = int(_1236);
    float _1240 = _1230 * _162;
    float _1242 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1244 = int(_1242);
    float _1246 = _1234 * _162;
    float _1248 = _1234;
    int _1250 = _1220;
    if (_1160)
    {
        float _1252 = in.m_61.z;
        _1248 = _1252;
    }
    float _1254 = _1248;
    float _1256 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1258 = int(_1256);
    float _1260 = float(uint(_1238));
    float _1262 = 1.0 / _1226;
    float _1264 = float(uint(_1244));
    float _1266 = 1.0 / _1228;
    float _1268 = float(uint(_1258));
    int _1270 = 0;
    float _1272 = _1254;
    if (_1160)
    {
        _1270 = as_type<int>(_1254);
    }
    int _1274 = _1270;
    float _1276 = 1.0 / _1232;
    float _1278 = _1262 * _162;
    float _1280 = _1266 * _162;
    float _1282 = 1.0 / _1264;
    int _1284 = as_type<int>(_1276) + (-2);
    float _1286 = 1.0 / _1268;
    float _1288 = in.m_71.x;
    float _1290 = _1276;
    int _1292 = _1274;
    if (_1160)
    {
        float _1294 = in.m_61.x;
        _1290 = _1294;
    }
    float _1296 = _1290;
    float _1298 = trunc(_1240);
    int _1300 = int(_1298);
    int _1302 = as_type<int>(_1282) + (-2);
    float _1304 = trunc(_1246);
    int _1306 = int(_1304);
    int _1308 = as_type<int>(_1286) + (-2);
    float _1310 = 1.0 / _1260;
    float _1312 = float(uint(_1300));
    float _1314 = _1296;
    float _1316 = _1288;
    if (_1172)
    {
        float _1318 = -_1288;
        float _1320 = _1318 + 1.0;
        _1120 = as_type<int>(_1320);
    }
    int _1322 = _1120;
    if (!_1176)
    {
        _1122 = _1288;
    }
    float _1324 = _1122;
    float _1326 = 0.0;
    float _1328 = _1324;
    if (!_1172)
    {
        _1326 = _1288;
    }
    float _1330 = _1326;
    float _1332 = as_type<float>(_1302) * _1312;
    float _1334 = _1330;
    if (!_1164)
    {
        _1124 = _1288;
    }
    float _1336 = _1124;
    float _1338 = trunc(_1280);
    int _1340 = int(_1338);
    float _1342 = in.m_61.y;
    float _1344 = float(uint(_1306));
    float _1346 = as_type<float>(_1308) * _1344;
    float _1348 = trunc(_1278);
    int _1350 = int(_1348);
    int _1352 = as_type<int>(_1310) + (-2);
    float _1354 = float(uint(_1340));
    float _1356 = trunc(_1332);
    float _1358 = precise::max(_1356, 0.0);
    uint _1361 = uint(_1358);
    float _1363 = as_type<float>(_1284) * _1354;
    float _1365 = float(uint(_1350));
    float _1367 = trunc(_1346);
    float _1369 = precise::max(_1367, 0.0);
    uint _1371 = uint(_1369);
    bool _1373 = _1342 > 0.5;
    int _1375 = 0;
    float _1377 = _1336;
    if (_1160)
    {
        _1375 = as_type<int>(_1342);
    }
    int _1379 = _1375;
    float _1381 = as_type<float>(_1352) * _1365;
    float _1383 = _1381;
    int _1385 = _1379;
    if (_1172)
    {
        float _1387 = _1373 ? as_type<float>(_1322) : _1288;
        _1334 = _1387;
    }
    float _1389 = _1334;
    float _1391 = trunc(_1363);
    float _1393 = precise::max(_1391, 0.0);
    uint _1395 = uint(_1393);
    float _1397 = trunc(_1381);
    float _1399 = precise::max(_1397, 0.0);
    uint _1401 = uint(_1399);
    int _1403 = int(_1172);
    int _1405 = _1164 ? 2 : 0;
    int _1407 = _1403 | _1405;
    int _1409 = _1176 ? 4 : 0;
    int _1411 = _1407 | _1409;
    int _1413 = _1160 ? 8 : 0;
    int _1415 = _1411 | _1413;
    int _1417 = false ? 16 : 0;
    int _1419 = _1415 | _1417;
    int _1421 = _1373 ? 32 : 0;
    int _1423 = _1419 | _1421;
    int _1425 = false ? 64 : 0;
    int _1427 = _1423 | _1425;
    int _1429 = _1427 & 32;
    int _1431 = _1429;
    if (_1176)
    {
        float _1433 = -_1288;
        float _1435 = _1433 + 1.0;
        _1431 = as_type<int>(_1435);
    }
    int _1437 = _1431;
    float _1439 = as_type<float>(_1437);
    if (_1176)
    {
        float _1441 = _1373 ? as_type<float>(_1437) : _1288;
        _1328 = _1441;
    }
    float _1443 = _1328;
    if (_1160)
    {
        _1383 = _1296;
    }
    float _1445 = _1383;
    float _1447 = _1445;
    if (_1160)
    {
        _1439 = _1445;
    }
    float _1449 = _1439;
    int _1451 = 0;
    float _1453 = _1449;
    if (_1160)
    {
        _1451 = as_type<int>(_1445);
    }
    int _1455 = _1451;
    int _1457 = _1455;
    if (!_1160)
    {
        float _1459 = in.m_61.x;
        float _1461 = _1342 * 3.1415927410125732421875;
        float _1463 = in.m_61.z;
        float _1465 = _1461 * 0.15915493667125701904296875;
        float _1467 = _1465 * 6.283185482025146484375;
        float _1469 = sin(_1467);
        float _1471 = _1459 * 3.1415927410125732421875;
        float _1473 = _1471 * 0.15915493667125701904296875;
        float _1475 = _1463 * 3.1415927410125732421875;
        float _1477 = _1475 * 0.15915493667125701904296875;
        float _1479 = _1473 * 6.283185482025146484375;
        float _1481 = sin(_1479);
        float _1483 = _1477 * 6.283185482025146484375;
        float _1485 = sin(_1483);
        _1453 = _1463;
        _1208 = 5.839270114898681640625;
        _1314 = _1459;
        _1196 = 7.345489978790283203125;
        _1447 = _1342;
        _1202 = 1.2345600128173828125;
        _1218 = 1;
        _1272 = _1463;
        _1292 = as_type<int>(_1485);
        _1385 = as_type<int>(_1469);
        _1250 = 2;
        _1457 = as_type<int>(_1481);
    }
    float _1487 = _1453;
    float _1489 = _1208;
    float _1491 = _1314;
    float _1493 = _1196;
    float _1495 = _1447;
    float _1497 = _1202;
    int _1499 = _1218;
    float _1501 = _1272;
    int _1503 = _1292;
    int _1505 = _1385;
    int _1507 = _1250;
    int _1509 = _1457;
    int _1511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1513 = _1511 != 0;
    float _1515 = _1487 * _1489;
    float _1517 = 0.0;
    if (_1164)
    {
        float _1519 = in.m_61.x;
        _1517 = _1519;
    }
    float _1521 = _1517;
    int _1523 = ~_1244;
    int _1525 = _1523 + 1;
    float _1527 = _1491 * _1493;
    int _1529 = ~_1238;
    int _1531 = _1529 + 1;
    float _1533 = floor(_1515);
    int _1535 = ~_1224;
    int _1537 = _1535 + 1;
    int _1539 = _1525 * int(_1361);
    int _1541 = _1539 + _1300;
    int _1543 = ~_1258;
    int _1545 = _1543 + 1;
    int _1547 = _1531 * int(_1401);
    int _1549 = _1547 + _1350;
    float _1551 = _1495 * _1497;
    int _1553 = _1537 * int(_1395);
    int _1555 = _1553 + _1340;
    int _1557 = as_type<int>(_1487);
    if (_1513)
    {
        float _1559 = in.m_61.z;
        _1557 = as_type<int>(_1559);
    }
    int _1561 = _1557;
    float _1563 = float(uint(_1541));
    int _1565 = _1545 * int(_1371);
    int _1567 = _1565 + _1306;
    float _1569 = float(uint(_1549));
    float _1571 = _1495 * _1493;
    float _1573 = float(uint(_1555));
    float _1575 = as_type<float>(_1302) * _1563;
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1579 = _1577 != 0;
    float _1581 = as_type<float>(_1352) * _1569;
    float _1583 = floor(_1527);
    float _1585 = as_type<float>(_1284) * _1573;
    float _1587 = float(uint(_1567));
    int _1589 = 0;
    float _1591 = _1581;
    float _1593 = _1585;
    if (_1513)
    {
        float _1595 = -_1288;
        float _1597 = _1595 + 1.0;
        _1589 = as_type<int>(_1597);
    }
    int _1599 = _1589;
    if (_1164)
    {
        bool _1601 = _1521 > 0.5;
        _1182 = _1601;
    }
    bool _1603 = _1182;
    float _1605 = -_1533;
    float _1607 = _1515 + _1605;
    float _1609 = float(_1300);
    float _1611 = as_type<float>(_1308) * _1587;
    float _1613 = trunc(_1575);
    float _1615 = precise::max(_1613, 0.0);
    uint _1617 = uint(_1615);
    int _1619 = ~_1258;
    int _1621 = _1619 + 1;
    bool _1623 = _1499 != 1;
    int _1625 = 0;
    if (_1579)
    {
        float _1627 = -_1288;
        float _1629 = _1627 + 1.0;
        _1625 = as_type<int>(_1629);
    }
    int _1631 = _1625;
    float _1633 = in.m_55.w;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1637 = _1152 + _1635;
    int _1639 = ~_1238;
    int _1641 = _1639 + 1;
    int _1643 = _1561;
    if (_1513)
    {
        bool _1645 = as_type<float>(_1561) > 0.5;
        _1184 = _1645;
    }
    bool _1647 = _1184;
    if (_1164)
    {
        float _1649 = -_1288;
        float _1651 = _1649 + 1.0;
        _1643 = as_type<int>(_1651);
    }
    int _1653 = _1643;
    float _1655 = trunc(_1581);
    float _1657 = precise::max(_1655, 0.0);
    uint _1659 = uint(_1657);
    float _1661 = -_1583;
    float _1663 = _1527 + _1661;
    float _1665 = float(_1244);
    float _1667 = in.m_57.w;
    if (_1164)
    {
        float _1669 = _1603 ? as_type<float>(_1653) : _1288;
        _1377 = _1669;
    }
    float _1671 = _1377;
    float _1673 = float(_128);
    float _1675 = _1665 * _1607;
    float _1677 = floor(_1571);
    if (!_1513)
    {
        _1591 = _1288;
    }
    float _1679 = _1591;
    float _1681 = in.m_59.w;
    float _1683 = _1679;
    if (_1513)
    {
        float _1685 = _1647 ? as_type<float>(_1599) : _1288;
        _1683 = _1685;
    }
    float _1687 = _1683;
    int _1689 = int(_1361) + int(_1617);
    float _1691 = float(_1238);
    float _1693 = trunc(_1585);
    float _1695 = precise::max(_1693, 0.0);
    uint _1697 = uint(_1695);
    int _1699 = int(_1401) + int(_1659);
    int _1701 = ~_1238;
    int _1703 = _1701 + 1;
    float _1705 = _1663 * _1691;
    float _1707 = float(_1340);
    float _1709 = float(_1306);
    float _1711 = floor(_1551);
    if (!_1579)
    {
        _1593 = _1288;
    }
    float _1713 = _1593;
    float _1715 = -_1677;
    float _1717 = _1571 + _1715;
    float _1719 = _1713;
    if (_1579)
    {
        float _1721 = _1373 ? as_type<float>(_1631) : _1288;
        _1719 = _1721;
    }
    float _1723 = _1719;
    int _1725 = _1703 * _1699;
    int _1727 = _1725 + _1350;
    int _1729 = ~_1244;
    int _1731 = _1729 + 1;
    float _1733 = float(_1350);
    float _1735 = 1.0 / _1673;
    int _1737 = int(_1395) + int(_1697);
    bool _1739 = _1609 >= _1665;
    bool _1741 = isnan(_1609);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan(_1665);
    bool _1747 = _1743 || _1745;
    float _1749 = float(_1747);
    int _1751 = _1731 * _1689;
    int _1753 = _1751 + _1300;
    bool _1755 = _1733 >= _1691;
    bool _1757 = isnan(_1733);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan(_1691);
    bool _1763 = _1759 || _1761;
    float _1765 = float(_1763);
    float _1767 = _1691 * _162;
    bool _1769 = uint(_1727) >= uint(_1238);
    float _1771 = trunc(_1611);
    float _1773 = precise::max(_1771, 0.0);
    uint _1775 = uint(_1773);
    float _1777 = -_1711;
    float _1779 = _1551 + _1777;
    float _1781 = float(_1224);
    float _1783 = float(_1258);
    bool _1785 = _1707 >= _1781;
    bool _1787 = isnan(_1707);
    bool _1789 = _1785 || _1787;
    bool _1791 = isnan(_1781);
    bool _1793 = _1789 || _1791;
    float _1795 = float(_1793);
    float _1797 = _1781 * _1779;
    float _1799 = _1735 * _162;
    bool _1801 = uint(_1753) >= uint(_1244);
    float _1803 = _1767 * _1735;
    float _1805 = trunc(_1765);
    int _1807 = int(_1805);
    float _1809 = _1783 * _1799;
    bool _1811 = _1709 >= _1783;
    bool _1813 = isnan(_1709);
    bool _1815 = _1811 || _1813;
    bool _1817 = isnan(_1783);
    bool _1819 = _1815 || _1817;
    float _1821 = float(_1819);
    float _1823 = _1781 * _1799;
    bool _1825 = _1238 == 0;
    float _1827 = _1665 * _1799;
    int _1829 = int(_1371) + int(_1775);
    float _1831 = trunc(_1705);
    int _1833 = int(_1831);
    int _1835 = ~_1224;
    int _1837 = _1835 + 1;
    float _1839 = _1783 * _1717;
    bool _1841 = !_1769;
    int _1843 = _1841 ? 0 : (-1);
    int _1845 = _1621 * _1829;
    int _1847 = _1845 + _1306;
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1851 = _1849 != 0;
    int _1853 = _1837 * _1737;
    int _1855 = _1853 + _1340;
    int _1857 = ~_1699;
    int _1859 = _1857 + _1843;
    int _1861 = _1859 + 1;
    float _1863 = trunc(_1795);
    int _1865 = int(_1863);
    bool _1867 = !_1851;
    int _1869 = _1867 ? 0 : 1;
    bool _1871 = uint(_1847) >= uint(_1258);
    bool _1873 = uint(_1855) >= uint(_1224);
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1877 = _1875 != 0;
    float _1879 = trunc(_1749);
    int _1881 = int(_1879);
    bool _1883 = !_1801;
    int _1885 = _1883 ? 0 : (-1);
    int _1887 = abs(_1869);
    int _1889 = ~_1689;
    int _1891 = _1889 + _1885;
    int _1893 = _1891 + 1;
    bool _1895 = !_1871;
    int _1897 = _1895 ? 0 : (-1);
    float _1899 = trunc(_1797);
    int _1901 = int(_1899);
    bool _1903 = !_1873;
    int _1905 = _1903 ? 0 : (-1);
    int _1907 = _1833 * _1887;
    int _1909 = _1907 + _1350;
    bool _1911 = !_1877;
    int _1913 = _1911 ? 0 : 1;
    int _1915 = _1238 * _1861;
    int _1917 = _1915 + _1350;
    int _1919 = ~_1737;
    int _1921 = _1919 + _1905;
    int _1923 = _1921 + 1;
    int _1925 = ~_1829;
    int _1927 = _1925 + _1897;
    int _1929 = _1927 + 1;
    float _1931 = trunc(_1803);
    int _1933 = int(_1931);
    int _1935 = abs(_1913);
    int _1937 = _1224 * _1923;
    int _1939 = _1937 + _1340;
    int _1941 = ~_1807;
    int _1943 = _1941 + 1;
    int _1945 = _1943 + 1;
    int _1947 = _1244 * _1893;
    int _1949 = _1947 + _1300;
    bool _1951 = !_1825;
    int _1953 = _1951 ? _1917 : (-1);
    int _1955 = _1258 * _1929;
    int _1957 = _1955 + _1306;
    int _1959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1961 = _1959 != 0;
    float _1963 = trunc(_1675);
    int _1965 = int(_1963);
    int _1967 = _1901 * _1935;
    int _1969 = _1967 + _1340;
    int _1971 = _1953 * _1945;
    bool _1973 = !_1961;
    int _1975 = _1973 ? 0 : 1;
    int _1977 = _1238 + (-1);
    int _1979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1981 = _1979 != 0;
    int _1983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1985 = _1983 != 0;
    int _1987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1989 = _1987 != 0;
    float _1991 = trunc(_1821);
    int _1993 = int(_1991);
    int _1995 = abs(_1975);
    int _1997 = _1807 * _1977;
    int _1999 = _1997 + _1971;
    bool _2001 = _1224 == 0;
    bool _2003 = !_1985;
    int _2005 = _2003 ? 0 : 1;
    int _2007 = _1965 * _1995;
    int _2009 = _2007 + _1300;
    bool _2011 = !_1981;
    int _2013 = _2011 ? 0 : 1;
    float _2015 = trunc(_1809);
    int _2017 = int(_2015);
    bool _2019 = _1244 == 0;
    int _2021 = abs(_2005);
    int _2023 = ~_1865;
    int _2025 = _2023 + 1;
    int _2027 = _2025 + 1;
    bool _2029 = !_2001;
    int _2031 = _2029 ? _1939 : (-1);
    int _2033 = _1999 * _2021;
    int _2035 = abs(_2013);
    float _2037 = in.m_71.y;
    int _2039 = ~_1881;
    int _2041 = _2039 + 1;
    int _2043 = _2041 + 1;
    int _2045 = _2027 * _2031;
    bool _2047 = !_2019;
    int _2049 = _2047 ? _1949 : (-1);
    int _2051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2053 = _2051 != 0;
    int _2055 = _2043 * _2049;
    bool _2057 = !_1989;
    int _2059 = _2057 ? 0 : 1;
    int _2061 = _1933 * _2035;
    int _2063 = _2061 + _2033;
    bool _2065 = !_2053;
    int _2067 = _2065 ? 0 : 1;
    int _2069 = abs(_2059);
    int _2071 = abs(_2067);
    bool _2073 = _1258 == 0;
    int _2075 = _1224 + (-1);
    int _2077 = _1909 * _2069;
    int _2079 = _2077 + _2063;
    int _2081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2083 = _2081 != 0;
    int _2085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2087 = _2085 != 0;
    int _2089 = ~_1993;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    int _2095 = _1833 * _2071;
    int _2097 = _2095 + _2079;
    bool _2099 = !_2073;
    int _2101 = _2099 ? _1957 : (-1);
    int _2103 = _1865 * _2075;
    int _2105 = _2103 + _2045;
    bool _2107 = !_2087;
    int _2109 = _2107 ? 0 : 1;
    float _2111 = trunc(_1823);
    int _2113 = int(_2111);
    float _2115 = float(uint(_2097));
    int _2117 = _2093 * _2101;
    int _2119 = abs(_2109);
    int _2121 = _1244 + (-1);
    float _2123 = as_type<float>(_1352) * _2115;
    bool _2125 = !_2083;
    int _2127 = _2125 ? 0 : 1;
    int _2129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2131 = _2129 != 0;
    int _2133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2135 = _2133 != 0;
    int _2137 = _1881 * _2121;
    int _2139 = _2137 + _2055;
    int _2141 = abs(_2127);
    int _2143 = _2105 * _2119;
    float _2145 = trunc(_2123);
    float _2147 = precise::max(_2145, 0.0);
    uint _2149 = uint(_2147);
    bool _2151 = !_2131;
    int _2153 = _2151 ? 0 : 1;
    int _2155 = _2113 * _2141;
    int _2157 = _2155 + _2143;
    int _2159 = _1258 + (-1);
    int _2161 = abs(_2153);
    int _2163 = ~_1238;
    int _2165 = _2163 + 1;
    int _2167 = _1993 * _2159;
    int _2169 = _2167 + _2117;
    bool _2171 = !_2135;
    int _2173 = _2171 ? 0 : 1;
    int _2175 = _1969 * _2161;
    int _2177 = _2175 + _2157;
    int _2179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2181 = _2179 != 0;
    int _2183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2185 = _2183 != 0;
    float _2187 = trunc(_1827);
    int _2189 = int(_2187);
    int _2191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2193 = _2191 != 0;
    int _2195 = _2165 * int(_2149);
    int _2197 = _2195 + _2097;
    int _2199 = abs(_2173);
    bool _2201 = !_2185;
    int _2203 = _2201 ? 0 : 1;
    bool _2205 = !_2193;
    int _2207 = _2205 ? 0 : 1;
    int _2209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2211 = _2209 != 0;
    int _2213 = _1901 * _2199;
    int _2215 = _2213 + _2177;
    float _2217 = float(uint(_2197));
    int _2219 = abs(_2203);
    float _2221 = trunc(_1839);
    int _2223 = int(_2221);
    bool _2225 = !_2211;
    int _2227 = _2225 ? 0 : 1;
    float _2229 = as_type<float>(_1352) * _2217;
    int _2231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2233 = _2231 != 0;
    int _2235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2237 = _2235 != 0;
    int _2239 = _2139 * _2219;
    int _2241 = abs(_2227);
    bool _2243 = !_2181;
    int _2245 = _2243 ? 0 : 1;
    float _2247 = trunc(_2229);
    float _2249 = precise::max(_2247, 0.0);
    uint _2251 = uint(_2249);
    int _2253 = abs(_2207);
    float _2255 = float(uint(_2215));
    bool _2257 = !_2237;
    int _2259 = _2257 ? 0 : 1;
    int _2261 = abs(_2245);
    float _2263 = as_type<float>(_1284) * _2255;
    int _2265 = abs(_2259);
    float _2267 = trunc(_2263);
    float _2269 = precise::max(_2267, 0.0);
    uint _2271 = uint(_2269);
    int _2273 = _2189 * _2261;
    int _2275 = _2273 + _2239;
    int _2277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2279 = _2277 != 0;
    int _2281 = _2223 * _2241;
    int _2283 = _2281 + _1306;
    int _2285 = int(_2149) + int(_2251);
    int _2287 = _2169 * _2265;
    int _2289 = ~_1224;
    int _2291 = _2289 + 1;
    int _2293 = _2009 * _2253;
    int _2295 = _2293 + _2275;
    bool _2297 = !_2233;
    int _2299 = _2297 ? 0 : 1;
    bool _2301 = !_2279;
    int _2303 = _2301 ? 0 : 1;
    int _2305 = abs(_2299);
    int _2307 = _2291 * int(_2271);
    int _2309 = _2307 + _2215;
    int _2311 = ~_1238;
    int _2313 = _2311 + 1;
    int _2315 = abs(_2303);
    int _2317 = _2017 * _2305;
    int _2319 = _2317 + _2287;
    int _2321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2323 = _2321 != 0;
    int _2325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2327 = _2325 != 0;
    float _2329 = float(uint(_2309));
    int _2331 = _1965 * _2315;
    int _2333 = _2331 + _2295;
    bool _2335 = !_2323;
    int _2337 = _2335 ? 0 : 1;
    float _2339 = as_type<float>(_1284) * _2329;
    bool _2341 = !_2327;
    int _2343 = _2341 ? 0 : 1;
    int _2345 = _2313 * _2285;
    int _2347 = _2345 + _2097;
    float _2349 = float(uint(_2333));
    int _2351 = abs(_2337);
    float _2353 = trunc(_2339);
    float _2355 = precise::max(_2353, 0.0);
    uint _2357 = uint(_2355);
    bool _2359 = uint(_2347) >= uint(_1238);
    float _2361 = as_type<float>(_1302) * _2349;
    int _2363 = abs(_2343);
    bool _2365 = !_2359;
    int _2367 = _2365 ? 0 : (-1);
    float _2369 = trunc(_2361);
    float _2371 = precise::max(_2369, 0.0);
    uint _2373 = uint(_2371);
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2377 = _2375 != 0;
    int _2379 = _2283 * _2351;
    int _2381 = _2379 + _2319;
    int _2383 = ~_2285;
    int _2385 = _2383 + _2367;
    int _2387 = _2385 + 1;
    bool _2389 = _1238 == 0;
    int _2391 = _2223 * _2363;
    int _2393 = _2391 + _2381;
    int _2395 = ~_1244;
    int _2397 = _2395 + 1;
    int _2399 = _1238 * _2387;
    int _2401 = _2399 + _2097;
    bool _2403 = _1342 > 0.5;
    float _2405 = in.m_61.w;
    float _2407 = float(uint(_2393));
    bool _2409 = !_2389;
    int _2411 = _2409 ? _2401 : (-1);
    int _2413 = _2305;
    if (_2377)
    {
        float _2415 = -_1288;
        float _2417 = _2415 + 1.0;
        _2413 = as_type<int>(_2417);
    }
    int _2419 = _2413;
    int _2421 = int(_2271) + int(_2357);
    float _2423 = as_type<float>(_1308) * _2407;
    int _2425 = _2411 & 3;
    bool _2427 = _2425 != 0;
    int _2429 = _2397 * int(_2373);
    int _2431 = _2429 + _2333;
    if (_2377)
    {
        float _2433 = _2403 ? as_type<float>(_2419) : _1288;
        _1316 = _2433;
    }
    float _2435 = _1316;
    float _2437 = trunc(_2423);
    float _2439 = precise::max(_2437, 0.0);
    uint _2441 = uint(_2439);
    int _2443 = ~_1224;
    int _2445 = _2443 + 1;
    float _2447 = -_2037;
    float _2449 = _2447 + 1.0;
    bool _2451 = uint(_2425) > 1u;
    float _2453 = float(uint(_2431));
    int _2455 = _2445 * _2421;
    int _2457 = _2455 + _2215;
    int _2459 = _2411 & 3;
    bool _2461 = _2459 != 0;
    int _2463 = _2403 ? as_type<int>(_2449) : as_type<int>(_2037);
    float _2465 = as_type<float>(_1302) * _2453;
    int _2467 = _2461 ? 0 : 1;
    bool _2469 = uint(_2457) >= uint(_1224);
    float _2471 = trunc(_2465);
    float _2473 = precise::max(_2471, 0.0);
    uint _2475 = uint(_2473);
    int _2477 = ~_1258;
    int _2479 = _2477 + 1;
    int _2481 = ~_2467;
    int _2483 = _2481 + 1;
    int _2485 = _2483 + 1;
    int _2487 = _2485;
    if (!_2451)
    {
        int _2489 = ~_2467;
        int _2491 = _2489 + 1;
        _2487 = _2491;
    }
    int _2493 = _2487;
    int _2495 = _2479 * int(_2441);
    int _2497 = _2495 + _2393;
    bool _2499 = !_2469;
    int _2501 = _2499 ? 0 : (-1);
    bool _2503 = _2425 != 3;
    int _2505 = ~_2421;
    int _2507 = _2505 + _2501;
    int _2509 = _2507 + 1;
    float _2511 = float(uint(_2497));
    bool _2513 = uint(_2425) >= 2u;
    int _2515 = _1224 * _2509;
    int _2517 = _2515 + _2215;
    bool _2519 = _1224 == 0;
    float _2521 = as_type<float>(_1308) * _2511;
    int _2523 = _2513 ? 0 : 1;
    bool _2525 = _2405 > 0.5;
    int _2527 = ~_1244;
    int _2529 = _2527 + 1;
    float _2531 = trunc(_2521);
    float _2533 = precise::max(_2531, 0.0);
    uint _2535 = uint(_2533);
    int _2537 = int(_2373) + int(_2475);
    bool _2539 = !_2519;
    int _2541 = _2539 ? _2517 : (-1);
    int _2543 = ~_2523;
    int _2545 = _2543 + 1;
    int _2547 = _2545 + 1;
    int _2549 = _2529 * _2537;
    int _2551 = _2549 + _2333;
    int _2553 = _2547;
    if (_2503)
    {
        int _2555 = ~_2523;
        int _2557 = _2555 + 1;
        _2553 = _2557;
    }
    int _2559 = _2553;
    int _2561 = _2525 ? as_type<int>(_2449) : as_type<int>(_2037);
    int _2563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2565 = _2563 != 0;
    int _2567 = _2541 & 3;
    bool _2569 = _2567 != 0;
    bool _2571 = !_2565;
    int _2573 = _2571 ? 0 : 1;
    bool _2575 = uint(_2567) >= 2u;
    int _2577 = _2569 ? 0 : 1;
    bool _2579 = uint(_2551) >= uint(_1244);
    int _2581 = _2575 ? 0 : 1;
    bool _2583 = _2567 != 3;
    bool _2585 = !_2579;
    int _2587 = _2585 ? 0 : (-1);
    int _2589 = ~_1258;
    int _2591 = _2589 + 1;
    bool _2593 = uint(_2567) > 1u;
    int _2595 = ~_2537;
    int _2597 = _2595 + _2587;
    int _2599 = _2597 + 1;
    int _2601 = int(_2441) + int(_2535);
    int _2603 = _1244 * _2599;
    int _2605 = _2603 + _2333;
    bool _2607 = _1244 == 0;
    int _2609 = ~_2581;
    int _2611 = _2609 + 1;
    int _2613 = _2611 + 1;
    int _2615 = _2591 * _2601;
    int _2617 = _2615 + _2393;
    int _2619 = _2613;
    if (_2583)
    {
        int _2621 = ~_2581;
        int _2623 = _2621 + 1;
        _2619 = _2623;
    }
    int _2625 = _2619;
    int _2627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2629 = _2627 != 0;
    int _2631 = ~_2577;
    int _2633 = _2631 + 1;
    int _2635 = _2633 + 1;
    bool _2637 = !_2607;
    int _2639 = _2637 ? _2605 : (-1);
    int _2641 = _2635;
    if (!_2593)
    {
        int _2643 = ~_2577;
        int _2645 = _2643 + 1;
        _2641 = _2645;
    }
    int _2647 = _2641;
    bool _2649 = uint(_2617) >= uint(_1258);
    bool _2651 = !_2629;
    int _2653 = _2651 ? 0 : 1;
    int _2655 = _2639 & 3;
    bool _2657 = _2655 != 0;
    bool _2659 = !_2649;
    int _2661 = _2659 ? 0 : (-1);
    int _2663 = _2657 ? 0 : 1;
    bool _2665 = uint(_2655) >= 2u;
    bool _2667 = _2655 != 3;
    int _2669 = ~_2601;
    int _2671 = _2669 + _2661;
    int _2673 = _2671 + 1;
    int _2675 = _2665 ? 0 : 1;
    bool _2677 = uint(_2655) > 1u;
    int _2679 = _1258 * _2673;
    int _2681 = _2679 + _2393;
    bool _2683 = _1258 == 0;
    int _2685 = ~_2675;
    int _2687 = _2685 + 1;
    int _2689 = _2687 + 1;
    bool _2691 = !_2683;
    int _2693 = _2691 ? _2681 : (-1);
    int _2695 = _2689;
    if (_2667)
    {
        int _2697 = ~_2675;
        int _2699 = _2697 + 1;
        _2695 = _2699;
    }
    int _2701 = _2695;
    int _2703 = _2693 & 3;
    bool _2705 = _2703 != 0;
    int _2707 = ~_2663;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    int _2713 = _2711;
    if (!_2677)
    {
        int _2715 = ~_2663;
        int _2717 = _2715 + 1;
        _2713 = _2717;
    }
    int _2719 = _2713;
    bool _2721 = uint(_2703) >= 2u;
    int _2723 = _2705 ? 0 : 1;
    int _2725 = _2721 ? 0 : 1;
    bool _2727 = _2703 != 3;
    bool _2729 = uint(_2703) > 1u;
    int _2731 = ~_2725;
    int _2733 = _2731 + 1;
    int _2735 = _2733 + 1;
    int _2737 = ~_2723;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    float _2743 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2745 = _2743 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2747 = _2735;
    int _2749 = _2741;
    if (_2727)
    {
        int _2751 = ~_2725;
        int _2753 = _2751 + 1;
        _2747 = _2753;
    }
    int _2755 = _2747;
    float _2757 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2759 = _2757 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    if (!_2729)
    {
        int _2761 = ~_2723;
        int _2763 = _2761 + 1;
        _2749 = _2763;
    }
    int _2765 = _2749;
    float _2767 = 1.0 / _2745;
    float _2769 = in.m_46.x;
    float _2771 = in.m_46.y;
    float _2773 = in.m_46.z;
    int _2775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2777 = _2775 != 0;
    float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2781 = _2779 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    int _2783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2785 = _2783 != 0;
    bool _2787 = !_2777;
    int _2789 = _2787 ? 0 : 1;
    float _2791 = _2785 ? as_type<float>(_2463) : _2037;
    float _2793 = 1.0 / _2759;
    int _2795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2797 = _2795 != 0;
    bool _2799 = _1501 > 0.5;
    float _2801 = _2797 ? as_type<float>(_2561) : _2037;
    int _2803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2805 = _2803 != 0;
    float _2807 = 1.0 / _2781;
    int _2809 = _2799 ? as_type<int>(_2449) : as_type<int>(_2037);
    int _2811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2813 = _2811 != 0;
    float _2815 = _2805 ? as_type<float>(_2809) : _2037;
    float _2817 = _2813 ? as_type<float>(_2809) : _2037;
    float _2819 = _194 * _2771;
    int _2821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2823 = _2821 != 0;
    int _2825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2827 = _2825 != 0;
    float _2829 = _200 * _2771;
    int _2831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2833 = _2831 != 0;
    float _2835 = _206 * _2771;
    float _2837 = fma(_192, _2769, _2819);
    float _2839 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2841 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2843 = _2841 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2845 = fma(_198, _2769, _2829);
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2849 = fma(_204, _2769, _2835);
    float _2851 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2853 = _2851 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2855 = fma(_196, _2773, _2837);
    float _2857 = fma(_2839, -2.0, _2847);
    float _2859 = _1491 * 2.0;
    float _2861 = 1.0 / _2853;
    float _2863 = fma(_202, _2773, _2845);
    float _2865 = fma(_208, _2773, _2849);
    float _2867 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2869 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2867;
    float _2871 = floor(_2859);
    float _2873 = _2823 ? as_type<float>(_2809) : _2037;
    float _2875 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2877 = _2875 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2879 = _2827 ? as_type<float>(_2809) : _2037;
    float _2881 = _2869 * _2767;
    bool _2883 = !_2833;
    int _2885 = _2883 ? 0 : 1;
    float _2887 = _2855 + _1633;
    float _2889 = float(uint(_1969));
    float _2891 = 1.0 / _2843;
    float _2893 = float(uint(_2009));
    float _2895 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2857);
    int _2897 = ~_1224;
    int _2899 = _2897 + 1;
    float _2901 = float(uint(_2283));
    float _2903 = as_type<float>(_1302) * _2893;
    bool _2905 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2907 = isnan(_1152);
    bool _2909 = _2905 || _2907;
    bool _2911 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2913 = _2909 || _2911;
    float _2915 = float(_2913);
    float _2917 = 1.0 / _2877;
    float _2919 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2921 = _2919 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2923 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2925 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2923;
    bool _2927 = _2871 > 0.0;
    float _2929 = as_type<float>(_1308) * _2901;
    float _2931 = _2921 * _2793;
    float _2933 = _2925 * _2807;
    float _2935 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2937 = _2935 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2939 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2941 = _2939 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _2943 = _2871 >= 0.0;
    bool _2945 = isnan(_2871);
    bool _2947 = _2943 || _2945;
    bool _2949 = isnan(0.0);
    bool _2951 = _2947 || _2949;
    float _2953 = 1.0 / _2937;
    float _2955 = _2941 * _2861;
    float _2957 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2959 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2957;
    int _2961 = _2951 ? 0 : 1;
    float _2963 = fma(_2933, _1637, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2965 = _2959 * _2891;
    float _2967 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2969 = _2967 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2971 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2973 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2971;
    float _2975 = _1342 * 2.0;
    float _2977 = float(uint(_1909));
    float _2979 = _2969 * _2917;
    int _2981 = ~_2961;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    float _2987 = floor(_2975);
    int _2989 = _2985;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2993 = _2793;
    float _2995 = _2917;
    if (!_2927)
    {
        int _2997 = ~_2961;
        int _2999 = _2997 + 1;
        _2989 = _2999;
    }
    int _3001 = _2989;
    float _3003 = _2973 * _2953;
    bool _3005 = !_1623;
    float _3007 = _3005 ? as_type<float>(_1503) : as_type<float>(_1505);
    float _3009 = as_type<float>(_1352) * _2977;
    float _3011 = _2953;
    if (!_1623)
    {
        _2991 = _1342;
    }
    float _3013 = _2991;
    float _3015 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3017 = _1152 + _3015;
    float _3019 = _3013;
    if (!_1623)
    {
        _2993 = _1342;
    }
    float _3021 = _2993;
    float _3023 = trunc(_3009);
    float _3025 = precise::max(_3023, 0.0);
    uint _3027 = uint(_3025);
    float _3029 = _3021;
    if (!_1623)
    {
        _2995 = _1501;
    }
    float _3031 = _2995;
    float _3033 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3035 = _1152 + _3033;
    float _3037 = _3031;
    if (!_1623)
    {
        _3011 = _1501;
    }
    float _3039 = _3011;
    bool _3041 = _1507 != 2;
    bool _3043 = !_1623;
    float _3045 = _3043 ? as_type<float>(_1505) : as_type<float>(_1509);
    float _3047 = fma(_2931, _3035, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3049 = _3039;
    float _3051 = _3047;
    if (_1623)
    {
        _3019 = _1491;
    }
    float _3053 = _3019;
    float _3055 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3057 = _1152 + _3055;
    if (_1623)
    {
        _3029 = _1491;
    }
    float _3059 = _3029;
    float _3061 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3063 = _1152 + _3061;
    if (_1623)
    {
        _3037 = _1342;
    }
    float _3065 = _3037;
    float _3067 = _3053 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1623)
    {
        _3049 = _1342;
    }
    float _3069 = _3049;
    bool _3071 = _2987 > 0.0;
    int _3073 = _1641 * int(_3027);
    int _3075 = _3073 + _1909;
    bool _3077 = _2987 >= 0.0;
    bool _3079 = isnan(_2987);
    bool _3081 = _3077 || _3079;
    bool _3083 = isnan(0.0);
    bool _3085 = _3081 || _3083;
    float _3087 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3089 = _1152 + _3087;
    bool _3091 = _2703 != 3;
    float _3093 = float(uint(_3075));
    float _3095 = fma(_2881, _3089, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3097 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3099 = _1152 + _3097;
    float _3101 = as_type<float>(_1352) * _3093;
    float _3103 = fma(_2955, _3099, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3105 = fma(_2979, _3017, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3107 = fma(_3003, _3063, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3109 = _2863 + _1667;
    float _3111 = as_type<float>(_1284) * _2889;
    bool _3113 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3115 = isnan(_1152);
    bool _3117 = _3113 || _3115;
    bool _3119 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3121 = _3117 || _3119;
    float _3123 = float(_3121);
    float _3125 = fma(_2965, _3057, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _3127 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3129 = isnan(_1152);
    bool _3131 = _3127 || _3129;
    bool _3133 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3135 = _3131 || _3133;
    float _3137 = float(_3135);
    float _3139 = trunc(_3101);
    float _3141 = precise::max(_3139, 0.0);
    uint _3143 = uint(_3141);
    bool _3145 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3147 = isnan(_1152);
    bool _3149 = _3145 || _3147;
    bool _3151 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3153 = _3149 || _3151;
    float _3155 = float(_3153);
    float _3157 = -_3123;
    float _3159 = _3157 + 1.0;
    bool _3161 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3163 = isnan(_1152);
    bool _3165 = _3161 || _3163;
    bool _3167 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3169 = _3165 || _3167;
    float _3171 = float(_3169);
    float _3173 = -_3137;
    float _3175 = _3173 + 1.0;
    bool _3177 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3179 = isnan(_1152);
    bool _3181 = _3177 || _3179;
    bool _3183 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3185 = _3181 || _3183;
    float _3187 = float(_3185);
    float _3189 = _3137 * _3159;
    bool _3191 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3193 = isnan(_1152);
    bool _3195 = _3191 || _3193;
    bool _3197 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3199 = _3195 || _3197;
    float _3201 = float(_3199);
    float _3203 = trunc(_3111);
    float _3205 = precise::max(_3203, 0.0);
    uint _3207 = uint(_3205);
    float _3209 = _3155 * _3175;
    float _3211 = -_3155;
    float _3213 = _3211 + 1.0;
    bool _3215 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3217 = isnan(_1152);
    bool _3219 = _3215 || _3217;
    bool _3221 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3223 = _3219 || _3221;
    float _3225 = float(_3223);
    float _3227 = -_3201;
    float _3229 = _3227 + 1.0;
    float _3231 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3233 = _3201 * _3213;
    int _3235 = abs(_2719);
    float _3237 = trunc(_2903);
    float _3239 = precise::max(_3237, 0.0);
    uint _3241 = uint(_3239);
    float _3243 = _2915 * _3229;
    float _3245 = -_2915;
    float _3247 = _3245 + 1.0;
    int _3249 = ~_3235;
    int _3251 = _3249 + 1;
    int _3253 = _3251 + 1;
    int _3255 = abs(_2701);
    float _3257 = _3171 * _3247;
    float _3259 = -_3171;
    float _3261 = _3259 + 1.0;
    int _3263 = _2899 * int(_3207);
    int _3265 = _3263 + _1969;
    int _3267 = ~_1258;
    int _3269 = _3267 + 1;
    int _3271 = ~_1244;
    int _3273 = _3271 + 1;
    float _3275 = _3187 * _3261;
    float _3277 = float(uint(_3265));
    float _3279 = trunc(_2929);
    float _3281 = precise::max(_3279, 0.0);
    uint _3283 = uint(_3281);
    int _3285 = _3273 * int(_3241);
    int _3287 = _3285 + _2009;
    int _3289 = ~_3255;
    int _3291 = _3289 + 1;
    int _3293 = _3291 + 1;
    float _3295 = as_type<float>(_1284) * _3277;
    float _3297 = -_3187;
    float _3299 = _3297 + 1.0;
    int _3301 = abs(_2885);
    float _3303 = float(uint(_3287));
    float _3305 = _3225 * _3299;
    float _3307 = trunc(_3295);
    float _3309 = precise::max(_3307, 0.0);
    uint _3311 = uint(_3309);
    float _3313 = -_3225;
    float _3315 = _3313 + 1.0;
    float _3317 = _3095 * _3305;
    float _3319 = as_type<float>(_1302) * _3303;
    int _3321 = _3085 ? 0 : 1;
    int _3323 = _3269 * int(_3283);
    int _3325 = _3323 + _2283;
    float _3327 = fma(_3315, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3317);
    float _3329 = trunc(_3319);
    float _3331 = precise::max(_3329, 0.0);
    uint _3333 = uint(_3331);
    int _3335 = ~_1238;
    int _3337 = _3335 + 1;
    float _3339 = float(uint(_3325));
    float _3341 = _2865 + _1681;
    int _3343 = int(_3027) + int(_3143);
    float _3345 = fma(_3047, _3275, _3327);
    int _3347 = ~_1224;
    int _3349 = _3347 + 1;
    float _3351 = as_type<float>(_1308) * _3339;
    int _3353 = int(_3207) + int(_3311);
    int _3355 = _3337 * _3343;
    int _3357 = _3355 + _1909;
    float _3359 = fma(_2963, _3257, _3345);
    int _3361 = ~_3321;
    int _3363 = _3361 + 1;
    int _3365 = _3363 + 1;
    float _3367 = trunc(_3351);
    float _3369 = precise::max(_3367, 0.0);
    uint _3371 = uint(_3369);
    int _3373 = _3365;
    float _3375 = as_type<float>(_3343);
    float _3377 = _3345;
    if (!_3071)
    {
        int _3379 = ~_3321;
        int _3381 = _3379 + 1;
        _3373 = _3381;
    }
    int _3383 = _3373;
    float _3385 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3387 = _3109 + _3385;
    bool _3389 = uint(_3357) >= uint(_1238);
    int _3391 = _3349 * _3353;
    int _3393 = _3391 + _1969;
    int _3395 = int(_3241) + int(_3333);
    float _3397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3399 = _2887 + _3397;
    int _3401 = ~_1244;
    int _3403 = _3401 + 1;
    float _3405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    bool _3407 = !_3389;
    int _3409 = _3407 ? 0 : (-1);
    float _3411 = fma(_3103, _3243, _3359);
    int _3413 = ~_1258;
    int _3415 = _3413 + 1;
    int _3417 = _3403 * _3395;
    int _3419 = _3417 + _2009;
    bool _3421 = uint(_3393) >= uint(_1224);
    float _3423 = _3387 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3425 = fma(_3125, _3233, _3411);
    int _3427 = int(_3283) + int(_3371);
    float _3429 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _3431 = !_3421;
    int _3433 = _3431 ? 0 : (-1);
    float _3435 = fma(_3399, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3423);
    bool _3437 = uint(_3419) >= uint(_1244);
    int _3439 = _3415 * _3427;
    int _3441 = _3439 + _2283;
    float _3443 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3445 = _3341 + _3443;
    float _3447 = _3405 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    bool _3449 = !_3437;
    int _3451 = _3449 ? 0 : (-1);
    float _3453 = fma(_3445, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3435);
    bool _3455 = uint(_3441) >= uint(_1258);
    float _3457 = _1501 * 2.0;
    float _3459 = fma(_3447, _1389, -0.5);
    bool _3461 = !_3455;
    int _3463 = _3461 ? 0 : (-1);
    bool _3465 = _3453 >= 0.0;
    float _3467 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3469 = floor(_3457);
    float _3471 = -_3467;
    float _3473 = fma(_3429, 2.0, _3471);
    float _3475 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3477 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3479 = _1342 + _1491;
    float _3481 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3483 = fma(as_type<float>(_1509), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3475);
    float _3485 = as_type<float>(_1509) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3487 = fma(as_type<float>(_1505), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3477);
    float _3489 = as_type<float>(_1505) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _3491 = ~_3343;
    int _3493 = _3491 + _3409;
    int _3495 = _3493 + 1;
    float _3497 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3483);
    float _3499 = fma(_3489, -2.0, _3481);
    float _3501 = as_type<float>(_3383);
    if (_3465)
    {
        _3375 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3503 = _3375;
    float _3505 = _3479 + (-1.0);
    float _3507 = fma(_3105, _3209, _3425);
    bool _3509 = _3469 >= 0.0;
    bool _3511 = isnan(_3469);
    bool _3513 = _3509 || _3511;
    bool _3515 = isnan(0.0);
    bool _3517 = _3513 || _3515;
    int _3519 = as_type<int>(_3503);
    if (_3465)
    {
        float _3521 = _3503 * 5.0;
        _3519 = as_type<int>(_3521);
    }
    int _3523 = _3519;
    int _3525 = _1238 * _3495;
    int _3527 = _3525 + _1909;
    float _3529 = fma(_3107, _3189, _3507);
    if (_3465)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11739 = as_type<float>(_3523);
        out.gl_Position.z = _11739;
    }
    if (_3041)
    {
        _3051 = _1491;
    }
    float _3531 = _3051;
    float _3533 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3535 = _3531;
    if (_3041)
    {
        _3377 = _1342;
    }
    float _3537 = _3377;
    float _3539 = fma(_3123, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3529);
    float _3541 = _3537;
    if (!_3041)
    {
        _3535 = _1501;
    }
    float _3543 = _3535;
    float _3545 = -_3533;
    float _3547 = fma(_3485, 2.0, _3545);
    if (!_3041)
    {
        _3541 = _1491;
    }
    float _3549 = _3541;
    float _3551 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _3553 = _3469 > 0.0;
    out.m_73.x = _3539;
    float _3555 = _3387 * _3387;
    float _3557 = fma(_3069, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3551);
    bool _3559 = !_2427;
    int _3561 = _3559 ? 0 : 1;
    float _3563 = fma(_3399, _3399, _3555);
    float _3565 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3567 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    int _3569 = _2541 & 3;
    bool _3571 = _3569 != 0;
    float _3573 = fma(_3445, _3445, _3563);
    int _3575 = _2541 >> 31;
    float _3577 = fma(_3045, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3567);
    float _3579 = _3045 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3581 = rsqrt(_3573);
    bool _3583 = !_3571;
    int _3585 = _3583 ? 0 : 1;
    float _3587 = _3549 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3589 = -_3565;
    float _3591 = fma(_3579, 2.0, _3589);
    int _3593 = _2411 >> 31;
    float _3595 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3487);
    int _3597 = _2639 & 3;
    bool _3599 = _3597 != 0;
    float _3601 = -_162;
    float _3603 = fma(_3601, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3473);
    int _3605 = _3575 & 3;
    float _3607 = -_162;
    float _3609 = fma(_3607, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3547);
    int _3611 = _3593 & 3;
    float _3613 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3499);
    int _3615 = _2639 >> 31;
    float _3617 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3557);
    int _3619 = _2411 + _3611;
    float _3621 = -_162;
    float _3623 = fma(_3621, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3591);
    int _3625 = _3615 & 3;
    float _3627 = _3387 * _3581;
    bool _3629 = !_3599;
    int _3631 = _3629 ? 0 : 1;
    float _3633 = _3399 * _3581;
    int _3635 = _3619 >> 2;
    float _3637 = -_3627;
    float _3639 = fma(_3637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3387);
    int _3641 = _2693 & 3;
    bool _3643 = _3641 != 0;
    float _3645 = -_3633;
    float _3647 = fma(_3645, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3399);
    int _3649 = _2639 + _3625;
    float _3651 = _3639 * _3639;
    int _3653 = _2693 >> 31;
    if (_3465)
    {
        out.m_49.x = 0.0;
    }
    int _3655 = _3635 << 4;
    int _3657 = _3655 + 368;
    float _3659 = fma(_3647, _3647, _3651);
    bool _3661 = !_3643;
    int _3663 = _3661 ? 0 : 1;
    bool _3665 = _2425 != 3;
    int _3667 = _2541 + _3605;
    int _3669 = _3649 >> 2;
    int _3671 = _3653 & 3;
    uint _3673 = uint(int(uint(_3657) >> uint(2)));
    uint _3675 = uint(int(uint(int(_3673)) >> uint(2)));
    int _3677 = int(_3673) & 3;
    float _3679 = (*spvDescriptorSet0.vp_c9)._m0[int(_3675)][_3677];
    int _3681 = int(_3673) + 1;
    uint _3683 = uint(int(uint(_3681) >> uint(2)));
    int _3685 = _3681 & 3;
    float _3687 = (*spvDescriptorSet0.vp_c9)._m0[int(_3683)][_3685];
    int _3689 = ~_3353;
    int _3691 = _3689 + _3433;
    int _3693 = _3691 + 1;
    bool _3695 = !_3665;
    int _3697 = _3695 ? 0 : (-1);
    bool _3699 = _2567 != 3;
    int _3701 = _1224 * _3693;
    int _3703 = _3701 + _1969;
    int _3705 = _2693 + _3671;
    float _3707 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3709 = int(_3707);
    int _3711 = _3667 >> 2;
    int _3713 = _3705 >> 2;
    float _3715 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _3717 = !_3699;
    int _3719 = _3717 ? 0 : (-1);
    bool _3721 = _2655 != 3;
    float _3723 = -_3715;
    float _3725 = fma(_3067, 2.0, _3723);
    int _3727 = _3711 << 4;
    int _3729 = _3727 + 512;
    float _3731 = _3065 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3733 = _3713 << 4;
    int _3735 = _3733 + 800;
    float _3737 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3739 = int(_3737);
    bool _3741 = !_2389;
    int _3743 = _3741 ? _3527 : (-1);
    uint _3745 = uint(int(uint(_3729) >> uint(2)));
    uint _3747 = uint(int(uint(int(_3745)) >> uint(2)));
    int _3749 = int(_3745) & 3;
    float _3751 = (*spvDescriptorSet0.vp_c9)._m0[int(_3747)][_3749];
    int _3753 = int(_3745) + 1;
    uint _3755 = uint(int(uint(_3753) >> uint(2)));
    int _3757 = _3753 & 3;
    float _3759 = (*spvDescriptorSet0.vp_c9)._m0[int(_3755)][_3757];
    bool _3761 = !_2519;
    int _3763 = _3761 ? _3703 : (-1);
    float _3765 = -_162;
    float _3767 = fma(_3765, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3725);
    bool _3769 = !_3091;
    int _3771 = _3769 ? 0 : (-1);
    int _3773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3775 = _3773 != 0;
    int _3777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3779 = _3777 != 0;
    int _3781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3783 = _3781 != 0;
    uint _3785 = uint(int(uint(_3735) >> uint(2)));
    uint _3787 = uint(int(uint(int(_3785)) >> uint(2)));
    int _3789 = int(_3785) & 3;
    float _3791 = (*spvDescriptorSet0.vp_c9)._m0[int(_3787)][_3789];
    int _3793 = int(_3785) + 1;
    uint _3795 = uint(int(uint(_3793) >> uint(2)));
    int _3797 = _3793 & 3;
    float _3799 = (*spvDescriptorSet0.vp_c9)._m0[int(_3795)][_3797];
    float _3801 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3803 = _3517 ? 0 : 1;
    float _3805 = fma(_3505, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3807 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _3809 = fma(_3731, -2.0, _3801);
    float _3811 = _3543 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3813 = ~_3803;
    int _3815 = _3813 + 1;
    int _3817 = _3815 + 1;
    float _3819 = fma(_3007, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3807);
    float _3821 = _3007 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _3823 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    int _3825 = _3669 << 4;
    int _3827 = _3825 + 656;
    float _3829 = -_3231;
    float _3831 = fma(_3811, 2.0, _3829);
    int _3833 = _3817;
    if (!_3553)
    {
        int _3835 = ~_3803;
        int _3837 = _3835 + 1;
        _3833 = _3837;
    }
    int _3839 = _3833;
    float _3841 = fma(_3821, -2.0, _3823);
    int _3843 = ~_3395;
    int _3845 = _3843 + _3451;
    int _3847 = _3845 + 1;
    uint _3849 = uint(int(uint(_3827) >> uint(2)));
    uint _3851 = uint(int(uint(int(_3849)) >> uint(2)));
    int _3853 = int(_3849) & 3;
    float _3855 = (*spvDescriptorSet0.vp_c9)._m0[int(_3851)][_3853];
    int _3857 = int(_3849) + 1;
    uint _3859 = uint(int(uint(_3857) >> uint(2)));
    int _3861 = _3857 & 3;
    float _3863 = (*spvDescriptorSet0.vp_c9)._m0[int(_3859)][_3861];
    int _3865 = abs(_2647);
    float _3867 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3841);
    int _3869 = _1244 * _3847;
    int _3871 = _3869 + _2009;
    int _3873 = ~_3427;
    int _3875 = _3873 + _3463;
    int _3877 = _3875 + 1;
    float _3879 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3809);
    int _3881 = abs(_3585);
    int _3883 = _3657 + 8;
    uint _3885 = uint(int(uint(_3883) >> uint(2)));
    uint _3887 = uint(int(uint(int(_3885)) >> uint(2)));
    int _3889 = int(_3885) & 3;
    float _3891 = (*spvDescriptorSet0.vp_c9)._m0[int(_3887)][_3889];
    int _3893 = int(_3885) + 1;
    uint _3895 = uint(int(uint(_3893) >> uint(2)));
    int _3897 = _3893 & 3;
    float _3899 = (*spvDescriptorSet0.vp_c9)._m0[int(_3895)][_3897];
    float _3901 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3903 = _1258 * _3877;
    int _3905 = _3903 + _2283;
    int _3907 = abs(_3663);
    float _3909 = -_162;
    float _3911 = fma(_3909, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3831);
    float _3913 = fma(_3587, -2.0, _3901);
    int _3915 = abs(_2493);
    int _3917 = _3729 + 8;
    uint _3919 = uint(int(uint(_3917) >> uint(2)));
    uint _3921 = uint(int(uint(int(_3919)) >> uint(2)));
    int _3923 = int(_3919) & 3;
    float _3925 = (*spvDescriptorSet0.vp_c9)._m0[int(_3921)][_3923];
    int _3927 = int(_3919) + 1;
    uint _3929 = uint(int(uint(_3927) >> uint(2)));
    int _3931 = _3927 & 3;
    float _3933 = (*spvDescriptorSet0.vp_c9)._m0[int(_3929)][_3931];
    int _3935 = ~_3865;
    int _3937 = _3935 + 1;
    int _3939 = _3937 + 1;
    float _3941 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3943 = int(_3941);
    int _3945 = ~_3915;
    int _3947 = _3945 + 1;
    int _3949 = _3947 + 1;
    float _3951 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3913);
    int _3953 = _3939 * as_type<int>(_3759);
    bool _3955 = !_3721;
    int _3957 = _3955 ? 0 : (-1);
    int _3959 = _3827 + 8;
    uint _3961 = uint(int(uint(_3959) >> uint(2)));
    uint _3963 = uint(int(uint(int(_3961)) >> uint(2)));
    int _3965 = int(_3961) & 3;
    float _3967 = (*spvDescriptorSet0.vp_c9)._m0[int(_3963)][_3965];
    int _3969 = int(_3961) + 1;
    uint _3971 = uint(int(uint(_3969) >> uint(2)));
    int _3973 = _3969 & 3;
    float _3975 = (*spvDescriptorSet0.vp_c9)._m0[int(_3971)][_3973];
    int _3977 = _3949 * as_type<int>(_3687);
    int _3979 = abs(_3561);
    float _3981 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _3983 = abs(_3631);
    int _3985 = abs(_2765);
    float _3987 = fma(_3059, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3981);
    int _3989 = _3735 + 8;
    uint _3991 = uint(int(uint(_3989) >> uint(2)));
    uint _3993 = uint(int(uint(int(_3991)) >> uint(2)));
    int _3995 = int(_3991) & 3;
    float _3997 = (*spvDescriptorSet0.vp_c9)._m0[int(_3993)][_3995];
    int _3999 = int(_3991) + 1;
    uint _4001 = uint(int(uint(_3999) >> uint(2)));
    int _4003 = _3999 & 3;
    float _4005 = (*spvDescriptorSet0.vp_c9)._m0[int(_4001)][_4003];
    float _4007 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4009 = int(_4007);
    float _4011 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3987);
    int _4013 = ~_3985;
    int _4015 = _4013 + 1;
    int _4017 = _4015 + 1;
    int _4019 = ~_3881;
    int _4021 = _4019 + 1;
    int _4023 = _4021 + 1;
    int _4025 = ~_3907;
    int _4027 = _4025 + 1;
    int _4029 = _4027 + 1;
    int _4031 = _4017 * as_type<int>(_3799);
    int _4033 = ~_3979;
    int _4035 = _4033 + 1;
    int _4037 = _4035 + 1;
    int _4039 = _4023 * as_type<int>(_3751);
    int _4041 = _4039 + _3953;
    int _4043 = abs(_2559);
    int _4045 = _4029 * as_type<int>(_3791);
    int _4047 = _4045 + _4031;
    int _4049 = abs(_2625);
    int _4051 = _4037 * as_type<int>(_3679);
    int _4053 = _4051 + _3977;
    int _4055 = abs(_3697);
    int _4057 = _3253 * as_type<int>(_3863);
    int _4059 = ~_4043;
    int _4061 = _4059 + 1;
    int _4063 = _4061 + 1;
    float _4065 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4067 = log2(_4065);
    int _4069 = ~_4049;
    int _4071 = _4069 + 1;
    int _4073 = _4071 + 1;
    int _4075 = ~_4055;
    int _4077 = _4075 + 1;
    int _4079 = _4077 + 1;
    int _4081 = _4063 * as_type<int>(_3891);
    int _4083 = _4081 + _4053;
    int _4085 = ~_3983;
    int _4087 = _4085 + 1;
    int _4089 = _4087 + 1;
    float _4091 = float(uint(_3709));
    int _4093 = _4079 * as_type<int>(_3899);
    int _4095 = _4093 + _4083;
    int _4097 = abs(_2755);
    int _4099 = _4089 * as_type<int>(_3855);
    int _4101 = _4099 + _4057;
    int _4103 = abs(_3957);
    int _4105 = _4073 * as_type<int>(_3925);
    int _4107 = _4105 + _4041;
    int _4109 = abs(_2573);
    float _4111 = 1.0 / _4091;
    float _4113 = float(uint(_4009));
    int _4115 = ~_4109;
    int _4117 = _4115 + 1;
    int _4119 = _4117 + 1;
    int _4121 = ~_4097;
    int _4123 = _4121 + 1;
    int _4125 = _4123 + 1;
    int _4127 = _3293 * as_type<int>(_3967);
    int _4129 = _4127 + _4101;
    int _4131 = abs(_3719);
    int _4133 = _4095 * _4119;
    float _4135 = 1.0 / _4113;
    float _4137 = float(uint(_3739));
    int _4139 = _3743 * _4109;
    int _4141 = _4139 + _4133;
    int _4143 = abs(_2653);
    int _4145 = _4125 * as_type<int>(_3997);
    int _4147 = _4145 + _4047;
    int _4149 = abs(_2789);
    float _4151 = _4067 * _162;
    int _4153 = ~_4143;
    int _4155 = _4153 + 1;
    int _4157 = _4155 + 1;
    float _4159 = 1.0 / _4137;
    int _4161 = ~_4131;
    int _4163 = _4161 + 1;
    int _4165 = _4163 + 1;
    int _4167 = ~_4103;
    int _4169 = _4167 + 1;
    int _4171 = _4169 + 1;
    float _4173 = float(uint(_3943));
    int _4175 = _4165 * as_type<int>(_3933);
    int _4177 = _4175 + _4107;
    int _4179 = ~_4149;
    int _4181 = _4179 + 1;
    int _4183 = _4181 + 1;
    int _4185 = _4171 * as_type<int>(_3975);
    int _4187 = _4185 + _4129;
    bool _4189 = _1244 == 0;
    int _4191 = _4157 * _4177;
    int _4193 = abs(_3771);
    float _4195 = 1.0 / _4173;
    bool _4197 = !_4189;
    int _4199 = _4197 ? _3871 : (-1);
    int _4201 = _3763 * _4143;
    int _4203 = _4201 + _4191;
    int _4205 = ~_4193;
    int _4207 = _4205 + 1;
    int _4209 = _4207 + 1;
    int _4211 = _4183 * _4187;
    int _4213 = as_type<int>(_4135) + (-2);
    float _4215 = float(uint(_4203));
    int _4217 = _4199 * _4149;
    int _4219 = _4217 + _4211;
    int _4221 = as_type<int>(_4111) + (-2);
    int _4223 = _4209 * as_type<int>(_4005);
    int _4225 = _4223 + _4147;
    float _4227 = float(uint(_4141));
    float _4229 = as_type<float>(_4213) * _4215;
    float _4231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _4233 = as_type<int>(_4159) + (-2);
    float _4235 = as_type<float>(_4221) * _4227;
    float _4237 = float(uint(_4219));
    int _4239 = ~_3301;
    int _4241 = _4239 + 1;
    int _4243 = _4241 + 1;
    bool _4245 = _1258 == 0;
    float _4247 = trunc(_4235);
    float _4249 = precise::max(_4247, 0.0);
    uint _4251 = uint(_4249);
    int _4253 = as_type<int>(_4195) + (-2);
    float _4255 = as_type<float>(_4233) * _4237;
    bool _4257 = !_4245;
    int _4259 = _4257 ? _3905 : (-1);
    int _4261 = _4243 * _4225;
    int _4263 = ~_3709;
    int _4265 = _4263 + 1;
    int _4267 = ~_3739;
    int _4269 = _4267 + 1;
    float _4271 = trunc(_4229);
    float _4273 = precise::max(_4271, 0.0);
    uint _4275 = uint(_4273);
    int _4277 = _4259 * _3301;
    int _4279 = _4277 + _4261;
    float _4281 = _4231 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4283 = abs(_3709);
    float _4285 = _3445 * _3581;
    float _4287 = float(uint(_4279));
    float _4289 = fma(_4281, _2873, -0.5);
    float _4291 = trunc(_4255);
    float _4293 = precise::max(_4291, 0.0);
    uint _4295 = uint(_4293);
    int _4297 = ~_4009;
    int _4299 = _4297 + 1;
    int _4301 = _4265 * int(_4251);
    int _4303 = _4301 + _4141;
    float _4305 = as_type<float>(_4253) * _4287;
    float _4307 = float(uint(_4283));
    float _4309 = -_4285;
    float _4311 = fma(_4309, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3445);
    int _4313 = abs(_3739);
    int _4315 = _4299 * int(_4275);
    int _4317 = _4315 + _4203;
    float _4319 = trunc(_4305);
    float _4321 = precise::max(_4319, 0.0);
    uint _4323 = uint(_4321);
    float _4325 = float(uint(_4303));
    float _4327 = fma(_4311, _4311, _3659);
    int _4329 = ~_3943;
    int _4331 = _4329 + 1;
    float _4333 = float(uint(_4317));
    float _4335 = as_type<float>(_4221) * _4325;
    int _4337 = _4269 * int(_4295);
    int _4339 = _4337 + _4219;
    float _4341 = 1.0 / _4307;
    int _4343 = abs(_4009);
    float _4345 = as_type<float>(_4213) * _4333;
    float _4347 = float(uint(_4313));
    float _4349 = float(uint(_4339));
    float _4351 = float(uint(_4343));
    int _4353 = _4331 * int(_4323);
    int _4355 = _4353 + _4279;
    int _4357 = abs(_3943);
    float _4359 = as_type<float>(_4233) * _4349;
    float _4361 = 1.0 / _4351;
    int _4363 = as_type<int>(_4341) + (-2);
    float _4365 = float(uint(_4357));
    float _4367 = 1.0 / _4347;
    int _4369 = abs(_4141);
    float _4371 = float(uint(_4355));
    float _4373 = float(uint(_4369));
    int _4375 = abs(_4219);
    float _4377 = 1.0 / _4365;
    float _4379 = as_type<float>(_4253) * _4371;
    float _4381 = as_type<float>(_4363) * _4373;
    float _4383 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _4385 = abs(_4203);
    float _4387 = fma(_1491, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4383);
    float _4389 = exp2(_4151);
    int _4391 = as_type<int>(_4367) + (-2);
    float _4393 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4387);
    float _4395 = float(uint(_4375));
    int _4397 = as_type<int>(_4361) + (-2);
    float _4399 = float(uint(_4385));
    float _4401 = trunc(_4381);
    float _4403 = precise::max(_4401, 0.0);
    uint _4405 = uint(_4403);
    bool _4407 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4409 = isnan(1.0);
    bool _4411 = _4407 || _4409;
    bool _4413 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4415 = _4411 || _4413;
    float _4417 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4419 = 1.0 + _4417;
    float _4421 = as_type<float>(_4391) * _4395;
    int _4423 = abs(_4279);
    float _4425 = as_type<float>(_4397) * _4399;
    float _4427 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _4429 = as_type<int>(_4377) + (-2);
    float _4431 = 1.0 / _4419;
    float _4433 = float(uint(_4423));
    float _4435 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4437 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4427);
    float _4439 = -_4389;
    float _4441 = _4439 + 1.0;
    float _4443 = as_type<float>(_4429) * _4433;
    float _4445 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4435);
    float _4447 = trunc(_4335);
    float _4449 = precise::max(_4447, 0.0);
    uint _4451 = uint(_4449);
    float _4453 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3819);
    bool _4455 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4457 = isnan(0.0);
    bool _4459 = _4455 || _4457;
    bool _4461 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4463 = _4459 || _4461;
    float _4465 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _4467 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4437);
    int _4469 = ~_4283;
    int _4471 = _4469 + 1;
    float _4473 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3577);
    float _4475 = fma(_1491, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4465);
    float _4477 = trunc(_4421);
    float _4479 = precise::max(_4477, 0.0);
    uint _4481 = uint(_4479);
    float _4483 = _4463 ? _4441 : 0.0;
    int _4485 = _4471 * int(_4405);
    int _4487 = _4485 + _4369;
    int _4489 = ~_4313;
    int _4491 = _4489 + 1;
    float _4493 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4445);
    float _4495 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4475);
    float _4497 = _4285;
    if (_4415)
    {
        float _4499 = _4483 * _4431;
        _166 = _4499;
    }
    float _4501 = _166;
    int _4503 = ~_4343;
    int _4505 = _4503 + 1;
    float _4507 = trunc(_4425);
    float _4509 = precise::max(_4507, 0.0);
    uint _4511 = uint(_4509);
    int _4513 = int(_4251) + int(_4451);
    float _4515 = fma(_4473, _3459, _3623);
    int _4517 = ~_4357;
    int _4519 = _4517 + 1;
    float _4521 = -_3867;
    float _4523 = fma(_4453, _4289, _4521);
    float _4525 = float(uint(_4487));
    float _4527 = float(_3839);
    float _4529 = trunc(_4359);
    float _4531 = precise::max(_4529, 0.0);
    uint _4533 = uint(_4531);
    int _4535 = _4491 * int(_4481);
    int _4537 = _4535 + _4375;
    float _4539 = as_type<float>(_4363) * _4525;
    float _4541 = _4523 + 0.5;
    float _4543 = float(uint(_4537));
    float _4545 = trunc(_4443);
    float _4547 = precise::max(_4545, 0.0);
    uint _4549 = uint(_4547);
    int _4551 = ~_3709;
    int _4553 = _4551 + 1;
    float _4555 = as_type<float>(_4391) * _4543;
    float _4557 = trunc(_4345);
    float _4559 = precise::max(_4557, 0.0);
    uint _4561 = uint(_4559);
    float _4563 = trunc(_4379);
    float _4565 = precise::max(_4563, 0.0);
    uint _4567 = uint(_4565);
    int _4569 = _4505 * int(_4511);
    int _4571 = _4569 + _4385;
    float _4573 = float(uint(_4571));
    float _4575 = trunc(_4539);
    float _4577 = precise::max(_4575, 0.0);
    uint _4579 = uint(_4577);
    int _4581 = int(_4295) + int(_4533);
    int _4583 = _4519 * int(_4549);
    int _4585 = _4583 + _4423;
    float _4587 = as_type<float>(_4397) * _4573;
    int _4589 = int(_4275) + int(_4561);
    float _4591 = float(uint(_4585));
    float _4593 = trunc(_4587);
    float _4595 = precise::max(_4593, 0.0);
    uint _4597 = uint(_4595);
    int _4599 = int(_4323) + int(_4567);
    int _4601 = _4553 * _4513;
    int _4603 = _4601 + _4141;
    int _4605 = ~_4009;
    int _4607 = _4605 + 1;
    float _4609 = as_type<float>(_4429) * _4591;
    int _4611 = ~_3739;
    int _4613 = _4611 + 1;
    bool _4615 = uint(_4603) >= uint(_3709);
    float _4617 = trunc(_4555);
    float _4619 = precise::max(_4617, 0.0);
    uint _4621 = uint(_4619);
    int _4623 = ~_3943;
    int _4625 = _4623 + 1;
    int _4627 = _4607 * _4589;
    int _4629 = _4627 + _4203;
    int _4631 = int(_4405) + int(_4579);
    float _4633 = trunc(_4609);
    float _4635 = precise::max(_4633, 0.0);
    uint _4637 = uint(_4635);
    int _4639 = int(_4511) + int(_4597);
    int _4641 = _4613 * _4581;
    int _4643 = _4641 + _4219;
    bool _4645 = uint(_4629) >= uint(_4009);
    int _4647 = _4625 * _4599;
    int _4649 = _4647 + _4279;
    int _4651 = ~_4343;
    int _4653 = _4651 + 1;
    int _4655 = ~_4283;
    int _4657 = _4655 + 1;
    int _4659 = ~_4313;
    int _4661 = _4659 + 1;
    bool _4663 = !_4615;
    int _4665 = _4663 ? 0 : (-1);
    int _4667 = _4657 * _4631;
    int _4669 = _4667 + _4369;
    bool _4671 = uint(_4643) >= uint(_3739);
    float _4673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4675 = int(_4481) + int(_4621);
    int _4677 = int(_4549) + int(_4637);
    bool _4679 = !_4645;
    int _4681 = _4679 ? 0 : (-1);
    int _4683 = _4653 * _4639;
    int _4685 = _4683 + _4385;
    bool _4687 = uint(_4649) >= uint(_3943);
    int _4689 = _4661 * _4675;
    int _4691 = _4689 + _4375;
    int _4693 = ~_4357;
    int _4695 = _4693 + 1;
    float _4697 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _4699 = !_4671;
    int _4701 = _4699 ? 0 : (-1);
    bool _4703 = uint(_4669) >= uint(_4283);
    bool _4705 = !_4687;
    int _4707 = _4705 ? 0 : (-1);
    float _4709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4711 = uint(_4685) >= uint(_4343);
    bool _4713 = !_4703;
    int _4715 = _4713 ? 0 : (-1);
    int _4717 = _4695 * _4677;
    int _4719 = _4717 + _4423;
    int _4721 = ~_4513;
    int _4723 = _4721 + _4665;
    int _4725 = _4723 + 1;
    bool _4727 = uint(_4691) >= uint(_4313);
    int _4729 = ~_4581;
    int _4731 = _4729 + _4701;
    int _4733 = _4731 + 1;
    int _4735 = _3709 * _4725;
    int _4737 = _4735 + _4141;
    bool _4739 = !_4727;
    int _4741 = _4739 ? 0 : (-1);
    bool _4743 = _3709 == 0;
    bool _4745 = !_4711;
    int _4747 = _4745 ? 0 : (-1);
    float _4749 = _4709 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4751 = uint(_4719) >= uint(_4357);
    int _4753 = _3739 * _4733;
    int _4755 = _4753 + _4219;
    bool _4757 = !_4743;
    int _4759 = _4757 ? _4737 : (-1);
    float _4761 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    bool _4763 = _3739 == 0;
    float _4765 = fma(_4749, _1671, -0.5);
    int _4767 = ~_4589;
    int _4769 = _4767 + _4681;
    int _4771 = _4769 + 1;
    float _4773 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    bool _4775 = !_4763;
    int _4777 = _4775 ? _4755 : (-1);
    bool _4779 = _3709 == 0;
    int _4781 = _4009 * _4771;
    int _4783 = _4781 + _4203;
    int _4785 = _4141 ^ _3709;
    float _4787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4789 = _4203 ^ _4009;
    float _4791 = _4773 * _4697;
    uint _4793 = uint(int(uint(_4785) >> uint(31)));
    uint _4795 = uint(int(uint(_4789) >> uint(31)));
    int _4797 = ~_4599;
    int _4799 = _4797 + _4707;
    int _4801 = _4799 + 1;
    float _4803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _4805 = !_4751;
    int _4807 = _4805 ? 0 : (-1);
    int _4809 = ~_4715;
    int _4811 = _4631 + _4809;
    int _4813 = _4811 + 1;
    int _4815 = _3943 * _4801;
    int _4817 = _4815 + _4279;
    int _4819 = ~int(_4793);
    int _4821 = _4819 + 1;
    bool _4823 = _4009 == 0;
    int _4825 = ~_4747;
    int _4827 = _4639 + _4825;
    int _4829 = _4827 + 1;
    float _4831 = _2879 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _4833 = ~int(_4795);
    int _4835 = _4833 + 1;
    int _4837 = _4813 ^ _4821;
    float _4839 = _4831 * _4761;
    bool _4841 = !_4823;
    int _4843 = _4841 ? _4783 : (-1);
    float _4845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4847 = _3943 == 0;
    int _4849 = _4829 ^ _4835;
    out.m_75.x = _4791;
    out.m_75.y = _4839;
    int _4851 = ~_4821;
    int _4853 = _4851 + _4837;
    int _4855 = _4853 + 1;
    bool _4857 = !_4847;
    int _4859 = _4857 ? _4817 : (-1);
    bool _4861 = _4009 == 0;
    int _4863 = ~_4835;
    int _4865 = _4863 + _4849;
    int _4867 = _4865 + 1;
    bool _4869 = !_4779;
    int _4871 = _4869 ? _4855 : (-1);
    float _4873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _4875 = _3739 == 0;
    float _4877 = _4787 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4879 = _4219 ^ _3739;
    bool _4881 = !_4861;
    int _4883 = _4881 ? _4867 : (-1);
    float _4885 = fma(_4877, _1687, -0.5);
    bool _4887 = _3943 == 0;
    int _4889 = _4279 ^ _3943;
    float _4891 = _4845 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4893 = float(_4759);
    uint _4895 = uint(int(uint(_4889) >> uint(31)));
    float _4897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _4899 = ~_4807;
    int _4901 = _4677 + _4899;
    int _4903 = _4901 + 1;
    float _4905 = fma(_4749, _4893, _3603);
    int _4907 = ~int(_4895);
    int _4909 = _4907 + 1;
    float _4911 = fma(_4891, _1723, -0.5);
    float _4913 = float(_4843);
    float _4915 = fma(_4393, _4765, _4905);
    float _4917 = float(_4777);
    float _4919 = _4673 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4921 = _4903 ^ _4909;
    float _4923 = fma(_4877, _4913, _3767);
    float _4925 = float(_4859);
    float _4927 = _4803 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _4929 = fma(_4891, _4917, _3911);
    int _4931 = ~_4909;
    int _4933 = _4931 + _4921;
    int _4935 = _4933 + 1;
    float _4937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _4939 = uint(int(uint(_4879) >> uint(31)));
    float _4941 = fma(_4927, _2435, -0.5);
    float _4943 = float(_4871);
    float _4945 = fma(_4927, _4925, _3609);
    bool _4947 = !_4887;
    int _4949 = _4947 ? _4935 : (-1);
    float _4951 = fma(_4919, _2791, -0.5);
    int _4953 = ~_4741;
    int _4955 = _4675 + _4953;
    int _4957 = _4955 + 1;
    float _4959 = -_2895;
    float _4961 = fma(_4919, _4943, _4959);
    int _4963 = ~int(_4939);
    int _4965 = _4963 + 1;
    float _4967 = fma(_3497, _4941, _4945);
    float _4969 = float(_4883);
    float _4971 = fma(_4011, _4885, _4923);
    float _4973 = _4873 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4975 = float(_4949);
    float _4977 = _4897 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _4979 = _4957 ^ _4965;
    float _4981 = fma(_4495, _4911, _4929);
    float _4983 = fma(_4973, _2801, -0.5);
    float _4985 = -_3879;
    float _4987 = fma(_4973, _4969, _4985);
    int _4989 = ~_4965;
    int _4991 = _4989 + _4979;
    int _4993 = _4991 + 1;
    float _4995 = fma(_4977, _2817, -0.5);
    float _4997 = -_3613;
    float _4999 = fma(_4977, _4975, _4997);
    float _5001 = fma(_4467, _4951, _4961);
    bool _5003 = !_4875;
    int _5005 = _5003 ? _4993 : (-1);
    float _5007 = _4937 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5009 = fma(_3595, _4995, _4999);
    float _5011 = _5001 + 0.5;
    float _5013 = float(_5005);
    float _5015 = fma(_5007, _2815, -0.5);
    float _5017 = _5009 + 0.5;
    float _5019 = fma(_3617, _4983, _4987);
    float _5021 = in.m_77.x;
    float _5023 = in.m_77.y;
    float _5025 = in.m_77.z;
    float _5027 = -_3951;
    float _5029 = fma(_5007, _5013, _5027);
    float _5031 = _4915 + 0.5;
    float _5033 = _4515 + 0.5;
    float _5035 = _4981 + 0.5;
    float _5037 = fma(_4493, _5015, _5029);
    float _5039 = _4971 + 0.5;
    float _5041 = _5019 + 0.5;
    float _5043 = _4967 + 0.5;
    float _5045 = _5037 + 0.5;
    bool _5047 = !_3775;
    int _5049 = _5047 ? 0 : 1;
    out.m_79.x = _5033;
    out.m_79.y = _4541;
    bool _5051 = !_3779;
    int _5053 = _5051 ? 0 : 1;
    int _5055 = abs(_5049);
    out.m_81.x = _5031;
    out.m_81.y = _5011;
    out.m_81.z = _5039;
    out.m_81.w = _5041;
    int _5057 = abs(_5053);
    bool _5059 = !_3783;
    int _5061 = _5059 ? 0 : 1;
    out.m_83.x = _5035;
    out.m_83.y = _5045;
    float _5063 = float(_5055);
    out.m_85.x = _5043;
    out.m_85.y = _5017;
    float _5065 = as_type<float>(_4821);
    if (_3465)
    {
        return out;
    }
    float _5067 = -_3627;
    float _5069 = fma(_5067, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3109);
    float _5071 = -_3633;
    float _5073 = fma(_5071, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2887);
    float _5075 = _5063 * _4527;
    float _5077 = float(_3001);
    float _5079 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5081 = _5069 + _5079;
    float _5083 = float(_5057);
    float _5085 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5087 = _5073 + _5085;
    float _5089 = _5075 * (-2.0);
    float _5091 = _5081 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5093 = -_4285;
    float _5095 = fma(_5093, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3341);
    float _5097 = _5083 * _5077;
    float _5099 = _1491 + (-0.5);
    float _5101 = fma(_5087, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5091);
    float _5103 = fma(_5089, _5021, _5021);
    float _5105 = _1342 + _1501;
    float _5107 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5109 = _5095 + _5107;
    float _5111 = fma(_3805, _5089, _3805);
    float _5113 = fma(_5099, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5103);
    float _5115 = _5105 + (-1.0);
    float _5117 = _5097 * (-2.0);
    float _5119 = fma(_5109, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5101);
    float _5121 = fma(_5111, _4501, _5113);
    float _5123 = fma(_5115, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5125 = _1342 + (-0.5);
    float _5127 = fma(_5117, _5023, _5023);
    bool _5129 = _5119 >= 0.0;
    float _5131 = fma(_5123, _5117, _5123);
    int _5133 = abs(_5061);
    float _5135 = fma(_5125, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5127);
    float _5137 = _5121 * 0.15915493667125701904296875;
    float _5139 = sqrt(_4327);
    float _5141 = fma(_5131, _4501, _5135);
    float _5143 = float(_3383);
    float _5145 = _1491 + _1501;
    float _5147 = float(_5133);
    float _5149 = _5141 * 0.15915493667125701904296875;
    float _5151 = _5137 * 6.283185482025146484375;
    float _5153 = sin(_5151);
    float _5155 = _5117;
    float _5157 = _5087;
    float _5159 = _5073;
    if (_5129)
    {
        _5155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5161 = _5155;
    float _5163 = _5147 * _5143;
    int _5165 = as_type<int>(_5161);
    if (_5129)
    {
        out.m_49.x = 0.0;
    }
    float _5167 = _5145 + (-1.0);
    if (_5129)
    {
        float _5169 = _5161 * 5.0;
        _5165 = as_type<int>(_5169);
    }
    int _5171 = _5165;
    float _5173 = _5163 * (-2.0);
    float _5175 = _5137 * 6.283185482025146484375;
    float _5177 = cos(_5175);
    if (_5129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14158 = as_type<float>(_5171);
        out.gl_Position.z = _14158;
    }
    float _5179 = _5149 * 6.283185482025146484375;
    float _5181 = sin(_5179);
    if (_5129)
    {
        return out;
    }
    float _5183 = -_3109;
    float _5185 = _5183 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5187 = -_2887;
    float _5189 = _5187 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5191 = -_3341;
    float _5193 = _5191 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5195 = fma(_5167, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5197 = _5185 * _5185;
    float _5199 = fma(_5173, _5025, _5025);
    float _5201 = _1501 + (-0.5);
    float _5203 = fma(_5195, _5173, _5195);
    float _5205 = fma(_5189, _5189, _5197);
    float _5207 = _5149 * 6.283185482025146484375;
    float _5209 = cos(_5207);
    float _5211 = fma(_5201, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5199);
    float _5213 = _3581 * _5139;
    float _5215 = fma(_5193, _5193, _5205);
    float _5217 = _5153 * _5181;
    float _5219 = fma(_5203, _4501, _5211);
    float _5221 = _634 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5223 = _5177 * _5181;
    float _5225 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5227 = rsqrt(_5215);
    float _5229 = _5219 * 0.15915493667125701904296875;
    float _5231 = _5213 * _5225;
    float _5233 = _5177 * _5209;
    float _5235 = _5229 * 6.283185482025146484375;
    float _5237 = sin(_5235);
    float _5239 = _5189 * _5227;
    float _5241 = _5193 * _5227;
    float _5243 = _5185 * _5227;
    float _5245 = in.m_87.x;
    float _5247 = in.m_87.y;
    float _5249 = in.m_87.z;
    float _5251 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5253 = _5239 * _5251;
    float _5255 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5257 = _5241 * _5255;
    float _5259 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5261 = _5243 * _5259;
    float _5263 = _5229 * 6.283185482025146484375;
    float _5265 = cos(_5263);
    float _5267 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5269 = -_5253;
    float _5271 = fma(_5241, _5267, _5269);
    float _5273 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5275 = -_5257;
    float _5277 = fma(_5243, _5273, _5275);
    float _5279 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5281 = -_5261;
    float _5283 = fma(_5239, _5279, _5281);
    float _5285 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5287 = _5271 * _5271;
    float _5289 = fma(_5237, _5233, _5217);
    float _5291 = fma(_5237, _5217, _5233);
    float _5293 = _5213 * _5285;
    float _5295 = fma(_5277, _5277, _5287);
    float _5297 = _5213 * _5221;
    float _5299 = fma(_5283, _5283, _5295);
    float _5301 = _5153 * _5209;
    float _5303 = _5177 * _5265;
    float _5305 = rsqrt(_5299);
    float _5307 = _5209 * _5265;
    float _5309 = _5153 * _5265;
    float _5311 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5247);
    float _5313 = _5181 * _5265;
    float _5315 = -_5223;
    float _5317 = fma(_5237, _5301, _5315);
    float _5319 = -_5301;
    float _5321 = fma(_5237, _5223, _5319);
    float _5323 = _5311 * _5293;
    float _5325 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5245);
    float _5327 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5249);
    float _5329 = _5303 * _5323;
    float _5331 = _5325 * _5297;
    float _5333 = _5327 * _5231;
    float _5335 = -_5323;
    float _5337 = _5237 * _5335;
    float _5339 = _5309 * _5323;
    float _5341 = _5277 * _5305;
    float _5343 = _5271 * _5305;
    float _5345 = fma(_5289, _5331, _5329);
    float _5347 = _5283 * _5305;
    float _5349 = _5243 * _5341;
    float _5351 = fma(_5307, _5331, _5337);
    float _5353 = fma(_5321, _5333, _5345);
    float _5355 = _5241 * _5343;
    float _5357 = -_5349;
    float _5359 = fma(_5239, _5343, _5357);
    float _5361 = fma(_5317, _5331, _5339);
    float _5363 = fma(_5313, _5333, _5351);
    float _5365 = -_5355;
    float _5367 = fma(_5243, _5347, _5365);
    float _5369 = _5359 * _5353;
    float _5371 = fma(_5291, _5333, _5361);
    float _5373 = _5239 * _5347;
    float _5375 = _5367 * _5353;
    float _5377 = fma(_5347, _5363, _5369);
    float _5379 = _5069 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5381 = -_5373;
    float _5383 = fma(_5241, _5341, _5381);
    float _5385 = fma(_5341, _5363, _5375);
    float _5387 = fma(_5241, _5371, _5377);
    float _5389 = fma(_5073, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5379);
    float _5391 = _5383 * _5353;
    float _5393 = fma(_5239, _5371, _5385);
    float _5395 = _3341 + _5387;
    float _5397 = fma(_5343, _5363, _5391);
    float _5399 = _2887 + _5393;
    float _5401 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5403 = _5395 + _5401;
    float _5405 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5407 = _5399 + _5405;
    float _5409 = _5403 * _5403;
    float _5411 = fma(_5407, _5407, _5409);
    float _5413 = fma(_5243, _5371, _5397);
    float _5415 = fma(_5095, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5389);
    float _5417 = sqrt(_5411);
    float _5419 = _3109 + _5413;
    bool _5421 = _5417 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5423 = _5389;
    float _5425 = _5413;
    float _5427 = _5371;
    if (!_5421)
    {
        _5423 = _5399;
    }
    float _5429 = _5423;
    float _5431 = _5429;
    if (!_5421)
    {
        _5425 = _5395;
    }
    float _5433 = _5425;
    float _5435 = _5433;
    if (!_5421)
    {
        _5427 = _5419;
    }
    float _5437 = _5427;
    bool _5439 = !_5421;
    float _5441 = _5437;
    if (!_5439)
    {
        float _5443 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5445 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5447 = _5417 + _5445;
        float _5449 = _5419 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5451 = rsqrt(_5411);
        float _5453 = _5447 * _5443;
        float _5455 = _5453 * 0.15915493667125701904296875;
        float _5457 = _5455 * 6.283185482025146484375;
        float _5459 = cos(_5457);
        float _5461 = _5455 * 6.283185482025146484375;
        float _5463 = sin(_5461);
        float _5465 = _5459 + (-1.0);
        float _5467 = _5465 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5469 = fma(_5463, _5449, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5471 = fma(_5419, _5459, _5467);
        float _5473 = _5451 * _5469;
        float _5475 = fma(_5407, _5473, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5477 = fma(_5403, _5473, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _5441 = _5471;
        _5431 = _5475;
        _5435 = _5477;
    }
    float _5479 = _5441;
    float _5481 = _5431;
    float _5483 = _5435;
    float _5485 = -_3109;
    float _5487 = _5485 + _5479;
    float _5489 = -_2887;
    float _5491 = _5489 + _5481;
    float _5493 = _5415 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5495 = _5069 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5497 = _5487 * _5487;
    float _5499 = -_3341;
    float _5501 = _5499 + _5483;
    float _5503 = 1.0 / _5493;
    float _5505 = fma(_5073, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5495);
    float _5507 = fma(_5491, _5491, _5497);
    float _5509 = fma(_5095, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5505);
    float _5511 = fma(_5501, _5501, _5507);
    bool _5513 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _5515 = isnan(0.5);
    bool _5517 = _5513 || _5515;
    bool _5519 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5521 = _5517 || _5519;
    float _5523 = _5509 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5525 = sqrt(_5511);
    bool _5527 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _5529 = isnan(0.5);
    bool _5531 = _5527 || _5529;
    bool _5533 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5535 = _5531 || _5533;
    float _5537 = _5523 + _5493;
    float _5539 = _5537 * _5503;
    float _5541 = _5539 * 0.5;
    float _5543 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5545 = fma(_5541, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5543);
    float _5547 = 1.0 / _5545;
    bool _5549 = _5525 > 0.0;
    bool _5551 = !_5549;
    float _5553 = _5481;
    float _5555 = _5483;
    float _5557 = _5479;
    float _5559 = _5511;
    if (!_5551)
    {
        float _5561 = _224 * _224;
        float _5563 = rsqrt(_5511);
        float _5565 = fma(_220, _220, _5561);
        float _5567 = fma(_226, _226, _5565);
        float _5569 = sqrt(_5567);
        float _5571 = _5491 * _5563;
        float _5573 = _5487 * _5563;
        float _5575 = _5501 * _5563;
        bool _5577 = _5569 > 0.0;
        bool _5579 = !_5577;
        if (!_5579)
        {
            float _5581 = rsqrt(_5567);
            float _5583 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5585 = _224 * _5581;
            float _5587 = _220 * _5581;
            float _5589 = _5573 * _5585;
            float _5591 = _226 * _5581;
            float _5593 = fma(_5571, _5587, _5589);
            float _5595 = _5583 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5597 = fma(_5575, _5591, _5593);
            float _5599 = _5597 * _5595;
            float _5601 = fma(_220, _5599, _5481);
            float _5603 = fma(_224, _5599, _5479);
            float _5605 = fma(_226, _5599, _5483);
            _5553 = _5601;
            _5555 = _5605;
            _5557 = _5603;
        }
    }
    float _5607 = _5553;
    float _5609 = _5555;
    float _5611 = _5557;
    float _5613 = -_3633;
    float _5615 = fma(_5613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5607);
    float _5617 = -_4285;
    float _5619 = fma(_5617, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5609);
    float _5621 = -_3627;
    float _5623 = fma(_5621, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5611);
    float _5625 = _5623;
    float _5627 = _5619;
    float _5629 = _5607;
    if (_5535)
    {
        _5559 = 1.0;
    }
    float _5631 = _5559;
    float _5633 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5635 = _5547 * _5633;
    float _5637 = _5631;
    if (_5521)
    {
        _4497 = _5615;
    }
    float _5639 = _4497;
    float _5641 = _5639;
    if (!_5521)
    {
        float _5643 = _5081 * _5081;
        float _5645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5647 = -_3341;
        float _5649 = _5647 + _5609;
        float _5651 = -_3109;
        float _5653 = _5651 + _5611;
        float _5655 = fma(_5087, _5087, _5643);
        float _5657 = -_2887;
        float _5659 = _5657 + _5607;
        float _5661 = fma(_5109, _5109, _5655);
        float _5663 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5665 = sqrt(_5661);
        float _5667 = 1.0 / _5213;
        float _5669 = _5663 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5671 = precise::min(_5665, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5673 = _5671 * _5645;
        float _5675 = _5673 * _5667;
        float _5677 = _5669 * _5675;
        float _5679 = _5649 * _5675;
        float _5681 = fma(_5653, _5677, _5069);
        float _5683 = fma(_5659, _5677, _5073);
        float _5685 = fma(_5669, _5679, _5095);
        _5625 = _5681;
        _5641 = _5683;
        _5627 = _5685;
        _5629 = _5659;
        _5157 = _5665;
    }
    float _5687 = _5625;
    float _5689 = _5641;
    float _5691 = _5627;
    float _5693 = _5629;
    float _5695 = _5157;
    float _5697 = _5693;
    float _5699 = _5695;
    if (!_5535)
    {
        float _5701 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5703 = _5701 * 0.15915493667125701904296875;
        float _5705 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5707 = _5703 * 6.283185482025146484375;
        float _5709 = cos(_5707);
        float _5711 = _5705 * 0.15915493667125701904296875;
        float _5713 = _5703 * 6.283185482025146484375;
        float _5715 = sin(_5713);
        float _5717 = 1.0 / _5709;
        float _5719 = _5711 * 6.283185482025146484375;
        float _5721 = cos(_5719);
        float _5723 = _5715 * _5717;
        float _5725 = _5711 * 6.283185482025146484375;
        float _5727 = sin(_5725);
        float _5729 = _5721 * _5723;
        float _5731 = 1.0 / _5729;
        float _5733 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5735 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5733;
        float _5737 = 1.0 / _5735;
        float _5739 = _5727 * _5731;
        float _5741 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5743 = fma(_5635, _5739, _5741);
        float _5745 = _5743 * _5737;
        float _5747 = precise::clamp(_5745, 0.0, 1.0);
        _5697 = _5703;
        _5699 = _5711;
        _5637 = _5747;
    }
    float _5749 = _5697;
    float _5751 = _5699;
    float _5753 = _5637;
    float _5755 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5757 = _5687 + _5755;
    float _5759 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5761 = _5689 + _5759;
    float _5763 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5765 = _5691 + _5763;
    float _5767 = _5757 * _5757;
    float _5769 = fma(_5761, _5761, _5767);
    float _5771 = fma(_5765, _5765, _5769);
    float _5773 = rsqrt(_5771);
    float _5775 = sqrt(_5771);
    float _5777 = _5773 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _5779 = _5761 * _5777;
    float _5781 = _5765 * _5777;
    float _5783 = _5779 * _5779;
    float _5785 = _5781 * _5781;
    float _5787 = _5783 + _5785;
    float _5789 = sqrt(_5787);
    bool _5791 = _5789 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5793 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5795 = _5789 + _5793;
    float _5797 = _5769;
    float _5799 = _5787;
    float _5801 = _5795;
    float _5803 = _5749;
    float _5805 = _5757;
    float _5807 = _5777;
    if (_5791)
    {
        float _5809 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5797 = _5809;
    }
    float _5811 = _5797;
    if (_5791)
    {
        float _5813 = rsqrt(_5787);
        _5799 = _5813;
    }
    float _5815 = _5799;
    float _5817 = _5815;
    if (_5791)
    {
        float _5819 = _5795 * _5811;
        _5801 = _5819;
    }
    float _5821 = _5801;
    if (_5791)
    {
        float _5823 = _5821 * 0.15915493667125701904296875;
        _5803 = _5823;
    }
    float _5825 = _5803;
    float _5827 = _5765;
    if (_5791)
    {
        float _5829 = _5825 * 6.283185482025146484375;
        float _5831 = sin(_5829);
        _5827 = _5831;
    }
    float _5833 = _5827;
    float _5835 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5837 = precise::max(0.0, _5835);
    float _5839 = _5751;
    if (_5791)
    {
        float _5841 = _5825 * 6.283185482025146484375;
        float _5843 = cos(_5841);
        _5839 = _5843;
    }
    float _5845 = _5839;
    float _5847 = -_5777;
    float _5849 = -_5837;
    float _5851 = fma(_5757, _5847, _5849);
    float _5853 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_5791)
    {
        float _5855 = _5851 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5805 = _5855;
    }
    float _5857 = _5805;
    float _5859 = fma(_5073, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _5861 = _5857;
    float _5863 = _5833;
    if (_5791)
    {
        float _5865 = fma(_5833, _5857, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5861 = _5865;
    }
    float _5867 = _5861;
    float _5869 = _5867;
    if (!_5791)
    {
        _5863 = _5779;
    }
    float _5871 = _5863;
    float _5873 = _5871;
    if (_5791)
    {
        float _5875 = _5845 + (-1.0);
        _5853 = _5875;
    }
    float _5877 = _5853;
    float _5879 = _5877;
    if (_5791)
    {
        float _5881 = _5815 * _5867;
        _5807 = _5881;
    }
    float _5883 = _5807;
    if (!_5791)
    {
        _5869 = _5851;
    }
    float _5885 = _5869;
    float _5887 = _5885;
    if (_5791)
    {
        float _5889 = _5877 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5159 = _5889;
    }
    float _5891 = _5159;
    float _5893 = _5891;
    if (_5791)
    {
        float _5895 = _5779 * _5883;
        _5873 = _5895;
    }
    float _5897 = _5873;
    if (!_5791)
    {
        _5879 = _5781;
    }
    float _5899 = _5879;
    float _5901 = _5899;
    if (_5791)
    {
        float _5903 = _5781 * _5883;
        _5901 = _5903;
    }
    float _5905 = _5901;
    if (!_5791)
    {
        _5817 = _5783;
    }
    float _5907 = _5817;
    float _5909 = _5907;
    if (_5791)
    {
        float _5911 = fma(_5851, _5845, _5891);
        _5887 = _5911;
    }
    float _5913 = _5887;
    if (_5791)
    {
        float _5915 = _5897 * _5897;
        _5909 = _5915;
    }
    float _5917 = _5909;
    if (!_5791)
    {
        _5893 = _5785;
    }
    float _5919 = _5893;
    float _5921 = _5919;
    if (_5791)
    {
        float _5923 = _5905 * _5905;
        _5921 = _5923;
    }
    float _5925 = _5921;
    float _5927 = fma(_5913, _5913, _5917);
    float _5929 = _5687 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _5931 = floor(_5859);
    float _5933 = _5927 + _5925;
    float _5935 = fma(_5689, (*spvDescriptorSet0.vp_c8)._m0[2].x, _5929);
    float _5937 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5939 = fma(_5775, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5937);
    float _5941 = precise::clamp(_5939, 0.0, 1.0);
    float _5943 = fma(_5691, (*spvDescriptorSet0.vp_c8)._m0[2].z, _5935);
    float _5945 = rsqrt(_5933);
    float _5947 = -_5941;
    float _5949 = _5947 + 1.0;
    float _5951 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _5953 = _5943 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _5955 = fma(_5095, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _5957 = _5687 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _5959 = _5953 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _5961 = abs(_5949);
    float _5963 = log2(_5961);
    float _5965 = _5687 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5967 = -_5931;
    float _5969 = _5859 + _5967;
    float _5971 = -_5959;
    float _5973 = fma(_5971, _5951, 1.0);
    float _5975 = _5687 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _5977 = fma(_5689, (*spvDescriptorSet0.vp_c8)._m0[1].x, _5965);
    float _5979 = fma(_5689, (*spvDescriptorSet0.vp_c8)._m0[3].x, _5957);
    float _5981 = _5945 * _5913;
    float _5983 = _5945 * _5897;
    float _5985 = fma(_5689, (*spvDescriptorSet0.vp_c8)._m0[0].x, _5975);
    float _5987 = fma(_5691, (*spvDescriptorSet0.vp_c8)._m0[1].z, _5977);
    float _5989 = _5945 * _5905;
    float _5991 = _5983 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5993 = fma(_5691, (*spvDescriptorSet0.vp_c8)._m0[0].z, _5985);
    float _5995 = _5987 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _5997 = fma(_5691, (*spvDescriptorSet0.vp_c8)._m0[3].z, _5979);
    float _5999 = -_5991;
    float _6001 = fma(_5981, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5999);
    float _6003 = _5993 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6005 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6007 = _5963 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6009 = -_5989;
    float _6011 = fma(_6009, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6001);
    float _6013 = _5997 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6015 = fma(_6003, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6005);
    float _6017 = exp2(_6007);
    float _6019 = fma(_6011, -0.5, 0.5);
    float _6021 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6023 = fma(_5953, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6015);
    float _6025 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6027 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6023);
    float _6029 = floor(_5955);
    float _6031 = fma(_6011, 0.5, 0.5);
    float _6033 = fma(_6003, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6021);
    float _6035 = fma(_6003, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6025);
    float _6037 = _5981 + 1.0;
    float _6039 = fma(_6031, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6041 = fma(_5953, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6033);
    float _6043 = fma(_5953, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6035);
    float _6045 = log2(_5973);
    float _6047 = fma(_6031, _6039, -0.212114393711090087890625);
    float _6049 = -_5981;
    float _6051 = fma(_6017, _6037, _6049);
    float _6053 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6041);
    float _6055 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6043);
    float _6057 = fma(_6031, _6047, 1.570728778839111328125);
    float _6059 = fma(_6051, 0.5, 0.5);
    float _6061 = 1.0 / _6027;
    float _6063 = -_6029;
    float _6065 = _5955 + _6063;
    float _6067 = sqrt(_6019);
    float _6069 = _6045 * 0.693147182464599609375;
    float2 _15568 = float2(_5969, _6065);
    float _6071 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_15568, float2(0.0), isnan(_15568)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_15568, float2(0.0), isnan(_15568)), level(0.0)).x;
    float _6073 = _6069 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6075 = _6053 * _6061;
    float _6077 = _6055 * _6061;
    float _6079 = fma(_6075, 0.5, 0.5);
    float _6081 = fma(_6077, -0.5, 0.5);
    float _6083 = _6067 * 0.636619746685028076171875;
    float3 _15596 = float3(_6079, _6081, _6073);
    float _6085 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_15596, float3(0.0), isnan(_15596)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_15596, float3(0.0), isnan(_15596)), level(0.0)).x;
    float3 _15607 = float3(_6079, _6081, _6073);
    float4 _6088 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_15607, float3(0.0), isnan(_15607)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_15607, float3(0.0), isnan(_15607)), level(0.0)).xyzw;
    float _6090 = _6088.x;
    float _6092 = _6088.y;
    float _6094 = _6088.z;
    float _6096 = _6088.w;
    float _6098 = -_6057;
    float _6100 = fma(_6083, _6098, 1.0);
    float2 _15628 = float2(_6100, _6059);
    float3 _6104 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_15628, float2(0.0), isnan(_15628)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_15628, float2(0.0), isnan(_15628)), level(0.0)).xyz;
    float _6106 = _6104.x;
    float _6108 = _6104.y;
    float _6110 = _6104.z;
    float _6112 = abs(_5635);
    float _6114 = log2(_6112);
    float _6116 = in.m_89.x;
    float _6118 = in.m_89.y;
    float _6120 = in.m_89.z;
    bool _6122 = _5247 != 0.0;
    bool _6124 = isnan(_5247);
    bool _6126 = _6122 || _6124;
    bool _6128 = isnan(0.0);
    bool _6130 = _6126 || _6128;
    float _6132 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6134 = in.m_91.x;
    float _6136 = in.m_91.y;
    float _6138 = in.m_91.z;
    float _6140 = in.m_91.w;
    bool _6142 = _5245 == 0.0;
    bool _6144 = !_6130;
    bool _6146 = _6142 && _6144;
    float _6148 = _5321 * _5383;
    bool _6150 = _5249 == 0.0;
    bool _6152 = _6150 && _6146;
    float _6154 = fma(_6003, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6132);
    bool _6156 = _5635 <= 8000.0;
    bool _6158 = isnan(_5635);
    bool _6160 = _6156 || _6158;
    bool _6162 = isnan(8000.0);
    bool _6164 = _6160 || _6162;
    float _6166 = float(_6164);
    float _6168 = fma(_5313, _5343, _6148);
    float _6170 = _6114 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6172 = fma(_5291, _5243, _6168);
    float _6174 = exp2(_6170);
    float _6176 = _6065;
    float _6178 = _6114;
    float _6180 = _6116;
    float _6182 = _6027;
    float _6184 = _6053;
    float _6186 = _6055;
    if (_6152)
    {
        _5065 = _6116;
    }
    float _6188 = _5065;
    float _6190 = _6188;
    if (_6152)
    {
        _3501 = _6118;
    }
    float _6192 = _3501;
    float _6194 = _6192;
    if (_6152)
    {
        _6176 = _6188;
    }
    float _6196 = _6176;
    float _6198 = _6196;
    if (!_6152)
    {
        _6190 = _6116;
    }
    float _6200 = _6190;
    if (_6152)
    {
        _6178 = _6192;
    }
    float _6202 = _6178;
    float _6204 = _6202;
    if (!_6152)
    {
        _6194 = _6118;
    }
    float _6206 = _6194;
    if (!_6152)
    {
        float _6208 = fma(_5245, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6200);
        _6198 = _6208;
    }
    float _6210 = _6198;
    if (_6152)
    {
        _6180 = _6120;
    }
    float _6212 = _6180;
    float _6214 = _6212;
    if (!_6152)
    {
        float _6216 = fma(_5249, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6120);
        _6214 = _6216;
    }
    float _6218 = _6214;
    if (!_6152)
    {
        float _6220 = fma(_5247, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6206);
        _6204 = _6220;
    }
    float _6222 = _6204;
    float _6224 = _6136 * _6120;
    float _6226 = _6138 * _6200;
    float _6228 = _6134 * _6206;
    float _6230 = fma(_6174, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6232 = precise::clamp(_6230, 0.0, 1.0);
    float _6234 = -_6224;
    float _6236 = fma(_6138, _6206, _6234);
    float _6238 = -_6226;
    float _6240 = fma(_6134, _6120, _6238);
    float _6242 = -_6228;
    float _6244 = fma(_6136, _6200, _6242);
    float _6246 = fma(_6232, -2.0, 3.0);
    float _6248 = _6232 * _6232;
    float _6250 = _6240 * _6140;
    float _6252 = _6236 * _6140;
    float _6254 = _6244 * _6140;
    float _6256 = _6248 * _6246;
    float _6258 = _5303 * _5383;
    float _6260 = _5289 * _5367;
    float _6262 = _5289 * _5383;
    float _6264 = _5289 * _5359;
    float _6266 = _5303 * _5367;
    float _6268 = _5303 * _5359;
    float _6270 = -_5237;
    float _6272 = fma(_6270, _5343, _6258);
    float _6274 = _5321 * _5367;
    float _6276 = _5321 * _5359;
    float _6278 = fma(_5307, _5343, _6262);
    float _6280 = -_5237;
    float _6282 = fma(_6280, _5341, _6266);
    float _6284 = -_5237;
    float _6286 = fma(_6284, _5347, _6268);
    float _6288 = -_6256;
    float _6290 = _6288 + 1.0;
    float _6292 = fma(_5307, _5341, _6260);
    float _6294 = fma(_5309, _5243, _6272);
    float _6296 = fma(_5307, _5347, _6264);
    float _6298 = fma(_5313, _5341, _6274);
    float _6300 = fma(_5313, _5347, _6276);
    float _6302 = fma(_5309, _5239, _6282);
    float _6304 = fma(_6290, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6256);
    float _6306 = fma(_5317, _5243, _6278);
    float _6308 = fma(_5309, _5241, _6286);
    float _6310 = fma(_5317, _5239, _6292);
    float _6312 = _6294 * _6136;
    float _6314 = _6294 * _6222;
    float _6316 = _6250 * _6294;
    float _6318 = fma(_5317, _5241, _6296);
    float _6320 = fma(_5291, _5239, _6298);
    float _6322 = fma(_5291, _5241, _6300);
    float _6324 = _6302 * _6136;
    float _6326 = _6302 * _6222;
    float _6328 = _6250 * _6302;
    float _6330 = _6250 * _6308;
    float _6332 = fma(_6306, _6134, _6312);
    float _6334 = fma(_6306, _6210, _6314);
    float _6336 = fma(_6252, _6306, _6316);
    float _6338 = _5963 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6340 = _6308 * _6136;
    float _6342 = fma(_6172, _6138, _6332);
    float _6344 = fma(_6310, _6134, _6324);
    float _6346 = in.m_93.x;
    float _6348 = fma(_6318, _6134, _6340);
    float _6350 = exp2(_6338);
    float _6352 = _6308 * _6222;
    float _6354 = _6166 * _6304;
    float _6356 = fma(_6320, _6138, _6344);
    float _6358 = fma(_6322, _6138, _6348);
    float _6360 = fma(_6310, _6210, _6326);
    float _6362 = fma(_6318, _6210, _6352);
    float _6364 = _6354 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6366 = fma(_6252, _6310, _6328);
    float _6368 = fma(_6252, _6318, _6330);
    float _6370 = fma(_6172, _6218, _6334);
    float _6372 = fma(_6320, _6218, _6360);
    float _6374 = fma(_6322, _6218, _6362);
    float _6376 = fma(_5953, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6154);
    float _6378 = fma(_6254, _6320, _6366);
    float _6380 = -_6350;
    float _6382 = _6380 + 1.0;
    float _6384 = fma(_6254, _6172, _6336);
    float _6386 = fma(_6254, _6322, _6368);
    float _6388 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6376);
    float _6390 = _6382 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6392 = _6027 * 0.5;
    float _6394 = _6053 + _6027;
    out.m_95.x = _6378;
    out.m_95.y = _6384;
    out.m_95.z = _6386;
    float _6396 = _6388 + _6027;
    float _6398 = fma(_6055, -0.5, _6392);
    float _6400 = _6394 * 0.5;
    float _6402 = _6396 * 0.5;
    out.m_97.x = _6356;
    out.m_97.y = _6342;
    out.m_97.z = _6358;
    bool _6404 = _5775 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6406 = isnan(_5775);
    bool _6408 = _6404 || _6406;
    bool _6410 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6412 = _6408 || _6410;
    out.m_99.x = _6400;
    out.m_99.y = _6398;
    out.m_99.z = _6402;
    out.m_99.w = _6027;
    out.m_101.x = _6372;
    out.m_101.y = _6370;
    out.m_101.z = _6374;
    out.gl_Position.x = _6053;
    out.gl_Position.y = _6055;
    out.gl_Position.z = _6388;
    out.gl_Position.w = _6027;
    float _6414 = _6386;
    float _6416 = _6384;
    if (!_6412)
    {
        _6414 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6418 = _6414;
    float _6420 = _6418;
    float _6422 = _6418;
    if (!_6412)
    {
        _6416 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6424 = _6416;
    float _6426 = _5753 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6428 = _6424;
    float _6430 = _6424;
    if (!_6412)
    {
        _6182 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6432 = _6182;
    float _6434 = _6432;
    float _6436 = _6432;
    if (!_6412)
    {
        _6184 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6438 = _6184;
    float _6440 = _6438;
    float _6442 = _6438;
    if (!_6412)
    {
        _6186 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6444 = _6186;
    float _6446 = -_6071;
    float _6448 = _6446 + 1.0;
    float _6450 = _6448 * _6364;
    float _6452 = precise::clamp(_6450, 0.0, 1.0);
    float _6454 = -_6452;
    float _6456 = fma(_6454, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6458 = _6456 * _6346;
    float _6460 = _6390 * _6085;
    float _6462 = -_6390;
    float _6464 = _6462 + 1.0;
    float _6466 = _6458 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6468 = _6096 * _6460;
    float _6470 = _6096 * _6464;
    out.m_103.x = _6466;
    float _6472 = _6110 * _6460;
    float _6474 = fma(_6106, _6468, _6090);
    float _6476 = fma(_6108, _6468, _6092);
    float _6478 = _6468;
    float _6480 = _6444;
    float _6482 = _6444;
    if (!_6412)
    {
        _6478 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6484 = _6478;
    float _6486 = fma(_6096, _6472, _6094);
    out.m_105.x = _6474;
    out.m_105.y = _6476;
    out.m_105.z = _6486;
    out.m_105.w = _6470;
    bool _6488 = !_6412;
    float _6490 = _6484;
    float _6492 = _6484;
    if (!_6488)
    {
        bool _6494 = _5775 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6496 = isnan(_5775);
        bool _6498 = _6494 || _6496;
        bool _6500 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6502 = _6498 || _6500;
        if (!_6502)
        {
            float _6504 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6506 = _5775 + _6504;
            float _6508 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6510 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6508;
            float _6512 = 1.0 / _6510;
            float _6514 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6516 = _6514 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6518 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6520 = _6518 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6522 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6524 = _6522 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6526 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6528 = _6526 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6530 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6532 = _6530 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6534 = _6506 * _6512;
            float _6536 = precise::clamp(_6534, 0.0, 1.0);
            float _6538 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6540 = _6538 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6542 = fma(_6536, _6520, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6544 = fma(_6536, _6540, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6546 = fma(_6536, _6516, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6548 = fma(_6536, _6524, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6550 = fma(_6536, _6528, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6552 = fma(_6536, _6532, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6430 = _6546;
            _6442 = _6550;
            _6422 = _6544;
            _6436 = _6548;
            _6492 = _6542;
            _6482 = _6552;
            _6554 = true;
        }
        else
        {
            bool _6556 = _5775 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6558 = isnan(_5775);
            bool _6560 = _6556 || _6558;
            bool _6562 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6564 = _6560 || _6562;
            if (!_6564)
            {
                _6434 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6566 = _6434;
            _6436 = _6566;
            if (!_6564)
            {
                _6440 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6568 = _6440;
            _6442 = _6568;
            if (!_6564)
            {
                _6480 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6570 = _6480;
            _6482 = _6570;
            if (!_6564)
            {
                _6420 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6572 = _6420;
            _6422 = _6572;
            if (!_6564)
            {
                _6428 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6574 = _6428;
            _6430 = _6574;
            if (!_6564)
            {
                _6490 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6576 = _6490;
            bool _6578 = !_6564;
            _6492 = _6576;
            if (!_6578)
            {
                bool _6580 = _5775 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6582 = isnan(_5775);
                bool _6584 = _6580 || _6582;
                bool _6586 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6588 = _6584 || _6586;
                if (!_6588)
                {
                    float _6590 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6592 = _5775 + _6590;
                    float _6594 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6596 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6594;
                    float _6598 = 1.0 / _6596;
                    float _6600 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6602 = _6600 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6604 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6606 = _6604 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6608 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6610 = _6608 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6612 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6614 = _6612 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6616 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6618 = _6616 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6620 = _6592 * _6598;
                    float _6622 = precise::clamp(_6620, 0.0, 1.0);
                    float _6624 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6626 = _6624 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6628 = fma(_6622, _6606, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6630 = fma(_6622, _6626, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6632 = fma(_6622, _6602, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6634 = fma(_6622, _6610, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6636 = fma(_6622, _6614, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6638 = fma(_6622, _6618, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6430 = _6632;
                    _6442 = _6636;
                    _6422 = _6630;
                    _6436 = _6634;
                    _6492 = _6628;
                    _6482 = _6638;
                    _6554 = true;
                }
                else
                {
                    _6430 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6442 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6422 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6436 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6492 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6482 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6554 = false;
    float _6640 = _6430;
    float _6642 = _6442;
    float _6644 = _6422;
    float _6646 = _6436;
    float _6648 = _6492;
    float _6650 = _6482;
    float _6652 = fma(_6370, -0.5, 0.5);
    float _6654 = precise::clamp(_6652, 0.0, 1.0);
    float _6656 = -_6640;
    float _6658 = _6642 + _6656;
    float _6660 = _6426 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6662 = -_6644;
    float _6664 = _6646 + _6662;
    float _6666 = fma(_6654, _6658, _6640);
    out.m_107.x = 0.0;
    float _6668 = -_6648;
    float _6670 = _6650 + _6668;
    float _6672 = fma(_6654, _6664, _6644);
    float _6674 = _6666 * 0.586610972881317138671875;
    out.m_49.x = _6660;
    bool _6676 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6678 = fma(_6654, _6670, _6648);
    float _6680 = fma(_6672, 0.298911988735198974609375, _6674);
    bool _6682 = _5753 > 0.0;
    bool _6684 = isnan(_5753);
    bool _6686 = _6682 || _6684;
    bool _6688 = isnan(0.0);
    bool _6690 = _6686 || _6688;
    float _6692 = fma(_6678, 0.114477999508380889892578125, _6680);
    float _6694 = -_6692;
    float _6696 = _6672 + _6694;
    float _6698 = -_6692;
    float _6700 = _6666 + _6698;
    float _6702 = -_6692;
    float _6704 = _6678 + _6702;
    float _6706 = fma(_6696, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6692);
    float _6708 = fma(_6700, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6692);
    float _6710 = fma(_6704, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6692);
    bool _6712 = !_6676;
    if (!_6712)
    {
        float _6714 = -_5687;
        float _6716 = _6714 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6718 = -_5689;
        float _6720 = _6718 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6722 = -_5691;
        float _6724 = _6722 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6726 = _6716 * _6716;
        float _6728 = fma(_6720, _6720, _6726);
        float _6730 = fma(_6724, _6724, _6728);
        float _6732 = sqrt(_6730);
        float _6734 = rsqrt(_6730);
        float _6736 = -_6732;
        float _6738 = _6736 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6740 = _6738 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6742 = precise::clamp(_6740, 0.0, 1.0);
        float _6744 = _6720 * _6734;
        float _6746 = _6716 * _6734;
        float _6748 = abs(_6742);
        float _6750 = log2(_6748);
        float _6752 = _6724 * _6734;
        float _6754 = _6744 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6756 = _6370 * _6746;
        float _6758 = -_6746;
        float _6760 = -_6754;
        float _6762 = fma(_6758, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6760);
        float _6764 = fma(_6372, _6744, _6756);
        float _6766 = -_6752;
        float _6768 = fma(_6766, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6762);
        float _6770 = fma(_6374, _6752, _6764);
        float _6772 = precise::clamp(_6770, 0.0, 1.0);
        float _6774 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6776 = _6768 + _6774;
        float _6778 = _6750 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6780 = _6776 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6782 = precise::clamp(_6780, 0.0, 1.0);
        float _6784 = exp2(_6778);
        float _6786 = _6784 * _6782;
        float _6788 = _6772 * _6786;
        float _6790 = _6788 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6792 = _6788 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6794 = _6788 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _6790;
        out.m_107.y = _6792;
        out.m_107.z = _6794;
    }
    out.m_109.x = _6706;
    out.m_109.y = _6708;
    out.m_109.z = _6710;
    if (_6690)
    {
        return out;
    }
    float _6796 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6796;
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6554 = false;
    bool _1144 = false;
    bool _820 = false;
    bool _678 = false;
    bool _524 = false;
    bool _248 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _6853 = as_type<float>(_144);
        out.gl_Position.z = _6853;
    }
    if (!_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_51.w;
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
        out.m_49.x = 0.0;
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
        float _6922 = as_type<float>(_182);
        out.gl_Position.z = _6922;
    }
    if (_176)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _184 = in.m_53.x;
    float _186 = in.m_53.y;
    float _188 = in.m_53.z;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = in.m_55.x;
    float _194 = in.m_55.y;
    float _196 = in.m_55.z;
    float _198 = in.m_57.x;
    float _200 = in.m_57.y;
    float _202 = in.m_57.z;
    float _204 = in.m_59.x;
    float _206 = in.m_59.y;
    float _208 = in.m_59.z;
    float _210 = _186 * _194;
    float _212 = _186 * _200;
    float _214 = fma(_184, _192, _210);
    float _216 = _186 * _206;
    float _218 = fma(_184, _198, _212);
    float _220 = fma(_188, _196, _214);
    float _222 = fma(_184, _204, _216);
    float _224 = fma(_188, _202, _218);
    float _226 = fma(_188, _208, _222);
    bool _228 = !_190;
    float _246;
    if (!_228)
    {
        float _230 = in.m_61.x;
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
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = _256 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _256 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = 1.0 / _276;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _290 = 1.0 / _280;
    bool _292 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _294 = isnan(_256);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = 1.0 / _272;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _256 + _306;
    float _310 = _308 * _286;
    bool _312 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _314 = isnan(_256);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = 1.0 / _284;
    float _326 = _260 * _290;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _332;
    float _336 = _264 * _304;
    bool _338 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _340 = isnan(_256);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_322;
    float _352 = _350 + 1.0;
    float _354 = fma(_334, _326, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = fma(_330, _326, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _358 = _348 * _352;
    float _360 = -_348;
    float _362 = _360 + 1.0;
    float _364 = _268 * _324;
    bool _366 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _368 = isnan(_256);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _378;
    bool _382 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _384 = isnan(_256);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = fma(_380, _326, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = -_376;
    float _402 = _400 + 1.0;
    float _404 = _376 * _362;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _414 = _302 * _402;
    float _416 = -_302;
    float _418 = _416 + 1.0;
    float _420 = fma(_396, _364, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_412, _364, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _424 = fma(_408, _364, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = _392 * _418;
    float _428 = -_392;
    float _430 = _428 + 1.0;
    float _432 = _354 * _426;
    float _434 = _356 * _426;
    float _436 = _398 * _426;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _438;
    float _442 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _432);
    float _444 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _434);
    float _446 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[143].z, _436);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _452;
    float _456 = fma(_420, _414, _442);
    float _458 = fma(_422, _414, _444);
    float _460 = fma(_424, _414, _446);
    float _462 = fma(_440, _336, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _464 = fma(_450, _336, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _466 = fma(_454, _336, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _480 = fma(_462, _404, _456);
    float _482 = fma(_470, _310, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _484 = fma(_474, _310, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _486 = fma(_478, _310, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _488 = fma(_464, _404, _458);
    float _490 = fma(_466, _404, _460);
    float _492 = fma(_482, _358, _480);
    float _494 = fma(_484, _358, _488);
    float _496 = fma(_486, _358, _490);
    float _498 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[147].x, _492);
    float _500 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[147].y, _494);
    float _502 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[147].z, _496);
    bool _504 = !_288;
    float _522;
    if (!_504)
    {
        float _506 = in.m_61.x;
        float _508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _510 = _506 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[11].y, _162);
        float _514 = _512 * _508;
        float _516 = floor(_514);
        float _518 = -_516;
        float _520 = _514 + _518;
        _522 = _520;
        _524 = true;
    }
    else
    {
        float _526 = float(_128);
        float _528 = 1.0 / _526;
        float _530 = _162 * _528;
        _522 = _530;
    }
    _524 = false;
    float _532 = _522;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _536 = _532 + _534;
    float _538 = in.m_63.x;
    float _540 = in.m_63.y;
    float _542 = in.m_63.z;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _548 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = isnan(_532);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _564 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _566 = isnan(_532);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _576;
    bool _580 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _582 = isnan(_532);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = 1.0 / _546;
    float _594 = -_558;
    float _596 = _594 + 1.0;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _600 = _532 + _598;
    bool _602 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _604 = _574 * _596;
    float _606 = -_574;
    float _608 = _606 + 1.0;
    float _610 = 1.0 / _562;
    float _612 = _578 * _592;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _618 = fma(_612, _536, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _620 = _616 * _610;
    float _622 = -_590;
    float _624 = _622 + 1.0;
    float _626 = _618 * _604;
    float _628 = fma(_620, _600, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _630 = _558 * _624;
    float _632 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[115].x, _626);
    float _634 = _498 * _538;
    float _636 = fma(_628, _630, _632);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _642 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[117].x, _636);
    float _644 = _500 * _540;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _648 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _650 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _652 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _654 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = _502 * _542;
    out.m_65.x = _648;
    out.m_65.y = _650;
    out.m_65.z = _654;
    out.m_65.w = _652;
    bool _658 = !_602;
    float _676;
    if (!_658)
    {
        float _660 = in.m_61.x;
        float _662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _664 = _660 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[11].w, _162);
        float _668 = _666 * _662;
        float _670 = floor(_668);
        float _672 = -_670;
        float _674 = _668 + _672;
        _676 = _674;
        _678 = true;
    }
    else
    {
        float _680 = float(_128);
        float _682 = 1.0 / _680;
        float _684 = _162 * _682;
        _676 = _684;
    }
    _678 = false;
    float _686 = _676;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _690 = _686 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _696 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _698 = isnan(_686);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _712 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _714 = isnan(_686);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _724;
    bool _728 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _730 = isnan(_686);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = 1.0 / _694;
    float _742 = -_706;
    float _744 = _742 + 1.0;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _748 = _686 + _746;
    bool _750 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _752 = _722 * _744;
    float _754 = -_722;
    float _756 = _754 + 1.0;
    float _758 = 1.0 / _710;
    float _760 = _726 * _740;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _766 = fma(_760, _690, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _768 = -_738;
    float _770 = _768 + 1.0;
    float _772 = _764 * _758;
    float _774 = _766 * _752;
    float _776 = _706 * _770;
    float _778 = fma(_772, _748, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _780 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[131].x, _774);
    float _782 = fma(_778, _776, _780);
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _790 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[133].x, _782);
    float _792 = _784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _794 = _786 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _798 = _790 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.x = _792;
    out.m_67.y = _794;
    out.m_67.z = _796;
    out.m_67.w = _798;
    bool _800 = !_750;
    float _818;
    if (!_800)
    {
        float _802 = in.m_61.x;
        float _804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _806 = _802 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _808 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[14].x, _162);
        float _810 = _808 * _804;
        float _812 = floor(_810);
        float _814 = -_812;
        float _816 = _810 + _814;
        _818 = _816;
        _820 = true;
    }
    else
    {
        float _822 = float(_128);
        float _824 = 1.0 / _822;
        float _826 = _162 * _824;
        _818 = _826;
    }
    _820 = false;
    float _828 = _818;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _832 = _828 + _830;
    bool _834 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _836 = isnan(_828);
    bool _838 = _834 || _836;
    bool _840 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _842 = _838 || _840;
    float _844 = float(_842);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _850;
    bool _854 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _856 = isnan(_828);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = -_844;
    float _868 = _866 + 1.0;
    bool _870 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _872 = isnan(_828);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = 1.0 / _848;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _886 = _884 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _888 = _864 * _868;
    float _890 = -_880;
    float _892 = _890 + 1.0;
    float _894 = 1.0 / _886;
    bool _896 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _898 = _852 * _882;
    float _900 = -_864;
    float _902 = _900 + 1.0;
    bool _904 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _906 = isnan(_828);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = fma(_898, _832, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _918 = _880 * _902;
    bool _920 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _922 = isnan(_828);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = _914 * _892;
    float _934 = -_914;
    float _936 = _934 + 1.0;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _942 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _944 = isnan(_828);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = _930 * _936;
    float _956 = -_930;
    float _958 = _956 + 1.0;
    bool _960 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _962 = isnan(_828);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = 1.0 / _940;
    float _974 = -_952;
    float _976 = _974 + 1.0;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _982 = _952 * _958;
    float _984 = _970 * _976;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _990 = -_970;
    float _992 = _990 + 1.0;
    float _994 = 1.0 / _980;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1000 = _916 * _984;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1008 = _828 + _1006;
    float _1010 = _998 * _894;
    float _1012 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1000);
    float _1014 = 1.0 / _988;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1016;
    float _1020 = fma(_1010, _1008, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1028 = _828 + _1026;
    float _1030 = _1018 * _972;
    float _1032 = fma(_1020, _982, _1012);
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1036 = _828 + _1034;
    float _1038 = 1.0 / _1004;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1044 = fma(_1030, _1028, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1046 = _1042 * _994;
    bool _1048 = _828 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1050 = isnan(_828);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1060;
    float _1064 = 1.0 / _1024;
    float _1066 = fma(_1044, _954, _1032);
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1072 = _1062 * _1014;
    float _1074 = fma(_1046, _1036, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1078 = _828 + _1076;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1082 = _828 + _1080;
    float _1084 = _1070 * _1038;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1086;
    float _1090 = fma(_1072, _1078, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1092 = fma(_1074, _932, _1066);
    float _1094 = fma(_1084, _1082, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1096 = -_1058;
    float _1098 = _1096 + 1.0;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1102 = _828 + _1100;
    float _1104 = fma(_1090, _918, _1092);
    float _1106 = _1088 * _1064;
    float _1108 = _844 * _1098;
    float _1110 = fma(_1094, _888, _1104);
    float _1112 = fma(_1106, _1102, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1114 = fma(_1112, _1108, _1110);
    float _1116 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1114);
    out.m_69.x = _1116;
    bool _1118 = !_896;
    int _1120 = as_type<int>(_888);
    float _1122 = _1014;
    float _1124 = _1064;
    float _1142;
    if (!_1118)
    {
        float _1126 = in.m_61.x;
        float _1128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1130 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[14].y, _162);
        float _1134 = _1132 * _1128;
        float _1136 = floor(_1134);
        float _1138 = -_1136;
        float _1140 = _1134 + _1138;
        _1142 = _1140;
        _1144 = true;
    }
    else
    {
        float _1146 = float(_128);
        float _1148 = 1.0 / _1146;
        float _1150 = _162 * _1148;
        _1142 = _1150;
    }
    _1144 = false;
    float _1152 = _1142;
    float _1154 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1156 = int(_1154);
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1160 = _1158 != 0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1164 = _1162 != 0;
    float _1166 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1168 = int(_1166);
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1172 = _1170 != 0;
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1176 = _1174 != 0;
    float _1178 = 0.0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _1182 = _1172;
    bool _1184 = _1176;
    if (_1160)
    {
        _1178 = 1.0;
    }
    float _1186 = _1178;
    float _1188 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1190 = int(_1188);
    float _1192 = float(_1156);
    float _1194 = 0.0;
    float _1196 = _1186;
    if (_1160)
    {
        _1194 = 1.0;
    }
    float _1198 = _1194;
    float _1200 = 0.0;
    float _1202 = _1198;
    if (_1160)
    {
        _1200 = 1.0;
    }
    float _1204 = _1200;
    int _1206 = 0;
    float _1208 = _1204;
    if (_1160)
    {
        _1206 = 0;
    }
    int _1210 = _1206;
    float _1212 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1214 = int(_1212);
    float _1216 = float(_1168);
    int _1218 = _1210;
    if (_1160)
    {
        _1180 = 0;
    }
    int _1220 = _1180;
    float _1222 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1224 = int(_1222);
    float _1226 = float(_1190);
    float _1228 = float(_1214);
    float _1230 = 1.0 / _1192;
    float _1232 = float(uint(_1224));
    float _1234 = 1.0 / _1216;
    float _1236 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1238 = int(_1236);
    float _1240 = _1230 * _162;
    float _1242 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1244 = int(_1242);
    float _1246 = _1234 * _162;
    float _1248 = _1234;
    int _1250 = _1220;
    if (_1160)
    {
        float _1252 = in.m_61.z;
        _1248 = _1252;
    }
    float _1254 = _1248;
    float _1256 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1258 = int(_1256);
    float _1260 = float(uint(_1238));
    float _1262 = 1.0 / _1226;
    float _1264 = float(uint(_1244));
    float _1266 = 1.0 / _1228;
    float _1268 = float(uint(_1258));
    int _1270 = 0;
    float _1272 = _1254;
    if (_1160)
    {
        _1270 = as_type<int>(_1254);
    }
    int _1274 = _1270;
    float _1276 = 1.0 / _1232;
    float _1278 = _1262 * _162;
    float _1280 = _1266 * _162;
    float _1282 = 1.0 / _1264;
    int _1284 = as_type<int>(_1276) + (-2);
    float _1286 = 1.0 / _1268;
    float _1288 = in.m_71.x;
    float _1290 = _1276;
    int _1292 = _1274;
    if (_1160)
    {
        float _1294 = in.m_61.x;
        _1290 = _1294;
    }
    float _1296 = _1290;
    float _1298 = trunc(_1240);
    int _1300 = int(_1298);
    int _1302 = as_type<int>(_1282) + (-2);
    float _1304 = trunc(_1246);
    int _1306 = int(_1304);
    int _1308 = as_type<int>(_1286) + (-2);
    float _1310 = 1.0 / _1260;
    float _1312 = float(uint(_1300));
    float _1314 = _1296;
    float _1316 = _1288;
    if (_1172)
    {
        float _1318 = -_1288;
        float _1320 = _1318 + 1.0;
        _1120 = as_type<int>(_1320);
    }
    int _1322 = _1120;
    if (!_1176)
    {
        _1122 = _1288;
    }
    float _1324 = _1122;
    float _1326 = 0.0;
    float _1328 = _1324;
    if (!_1172)
    {
        _1326 = _1288;
    }
    float _1330 = _1326;
    float _1332 = as_type<float>(_1302) * _1312;
    float _1334 = _1330;
    if (!_1164)
    {
        _1124 = _1288;
    }
    float _1336 = _1124;
    float _1338 = trunc(_1280);
    int _1340 = int(_1338);
    float _1342 = in.m_61.y;
    float _1344 = float(uint(_1306));
    float _1346 = as_type<float>(_1308) * _1344;
    float _1348 = trunc(_1278);
    int _1350 = int(_1348);
    int _1352 = as_type<int>(_1310) + (-2);
    float _1354 = float(uint(_1340));
    float _1356 = trunc(_1332);
    float _1358 = precise::max(_1356, 0.0);
    uint _1361 = uint(_1358);
    float _1363 = as_type<float>(_1284) * _1354;
    float _1365 = float(uint(_1350));
    float _1367 = trunc(_1346);
    float _1369 = precise::max(_1367, 0.0);
    uint _1371 = uint(_1369);
    bool _1373 = _1342 > 0.5;
    int _1375 = 0;
    float _1377 = _1336;
    if (_1160)
    {
        _1375 = as_type<int>(_1342);
    }
    int _1379 = _1375;
    float _1381 = as_type<float>(_1352) * _1365;
    float _1383 = _1381;
    int _1385 = _1379;
    if (_1172)
    {
        float _1387 = _1373 ? as_type<float>(_1322) : _1288;
        _1334 = _1387;
    }
    float _1389 = _1334;
    float _1391 = trunc(_1363);
    float _1393 = precise::max(_1391, 0.0);
    uint _1395 = uint(_1393);
    float _1397 = trunc(_1381);
    float _1399 = precise::max(_1397, 0.0);
    uint _1401 = uint(_1399);
    int _1403 = int(_1172);
    int _1405 = _1164 ? 2 : 0;
    int _1407 = _1403 | _1405;
    int _1409 = _1176 ? 4 : 0;
    int _1411 = _1407 | _1409;
    int _1413 = _1160 ? 8 : 0;
    int _1415 = _1411 | _1413;
    int _1417 = false ? 16 : 0;
    int _1419 = _1415 | _1417;
    int _1421 = _1373 ? 32 : 0;
    int _1423 = _1419 | _1421;
    int _1425 = false ? 64 : 0;
    int _1427 = _1423 | _1425;
    int _1429 = _1427 & 32;
    int _1431 = _1429;
    if (_1176)
    {
        float _1433 = -_1288;
        float _1435 = _1433 + 1.0;
        _1431 = as_type<int>(_1435);
    }
    int _1437 = _1431;
    float _1439 = as_type<float>(_1437);
    if (_1176)
    {
        float _1441 = _1373 ? as_type<float>(_1437) : _1288;
        _1328 = _1441;
    }
    float _1443 = _1328;
    if (_1160)
    {
        _1383 = _1296;
    }
    float _1445 = _1383;
    float _1447 = _1445;
    if (_1160)
    {
        _1439 = _1445;
    }
    float _1449 = _1439;
    int _1451 = 0;
    float _1453 = _1449;
    if (_1160)
    {
        _1451 = as_type<int>(_1445);
    }
    int _1455 = _1451;
    int _1457 = _1455;
    if (!_1160)
    {
        float _1459 = in.m_61.x;
        float _1461 = _1342 * 3.1415927410125732421875;
        float _1463 = in.m_61.z;
        float _1465 = _1461 * 0.15915493667125701904296875;
        float _1467 = _1465 * 6.283185482025146484375;
        float _1469 = sin(_1467);
        float _1471 = _1459 * 3.1415927410125732421875;
        float _1473 = _1471 * 0.15915493667125701904296875;
        float _1475 = _1463 * 3.1415927410125732421875;
        float _1477 = _1475 * 0.15915493667125701904296875;
        float _1479 = _1473 * 6.283185482025146484375;
        float _1481 = sin(_1479);
        float _1483 = _1477 * 6.283185482025146484375;
        float _1485 = sin(_1483);
        _1453 = _1463;
        _1208 = 5.839270114898681640625;
        _1314 = _1459;
        _1196 = 7.345489978790283203125;
        _1447 = _1342;
        _1202 = 1.2345600128173828125;
        _1218 = 1;
        _1272 = _1463;
        _1292 = as_type<int>(_1485);
        _1385 = as_type<int>(_1469);
        _1250 = 2;
        _1457 = as_type<int>(_1481);
    }
    float _1487 = _1453;
    float _1489 = _1208;
    float _1491 = _1314;
    float _1493 = _1196;
    float _1495 = _1447;
    float _1497 = _1202;
    int _1499 = _1218;
    float _1501 = _1272;
    int _1503 = _1292;
    int _1505 = _1385;
    int _1507 = _1250;
    int _1509 = _1457;
    int _1511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1513 = _1511 != 0;
    float _1515 = _1487 * _1489;
    float _1517 = 0.0;
    if (_1164)
    {
        float _1519 = in.m_61.x;
        _1517 = _1519;
    }
    float _1521 = _1517;
    int _1523 = ~_1244;
    int _1525 = _1523 + 1;
    float _1527 = _1491 * _1493;
    int _1529 = ~_1238;
    int _1531 = _1529 + 1;
    float _1533 = floor(_1515);
    int _1535 = ~_1224;
    int _1537 = _1535 + 1;
    int _1539 = _1525 * int(_1361);
    int _1541 = _1539 + _1300;
    int _1543 = ~_1258;
    int _1545 = _1543 + 1;
    int _1547 = _1531 * int(_1401);
    int _1549 = _1547 + _1350;
    float _1551 = _1495 * _1497;
    int _1553 = _1537 * int(_1395);
    int _1555 = _1553 + _1340;
    int _1557 = as_type<int>(_1487);
    if (_1513)
    {
        float _1559 = in.m_61.z;
        _1557 = as_type<int>(_1559);
    }
    int _1561 = _1557;
    float _1563 = float(uint(_1541));
    int _1565 = _1545 * int(_1371);
    int _1567 = _1565 + _1306;
    float _1569 = float(uint(_1549));
    float _1571 = _1495 * _1493;
    float _1573 = float(uint(_1555));
    float _1575 = as_type<float>(_1302) * _1563;
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1579 = _1577 != 0;
    float _1581 = as_type<float>(_1352) * _1569;
    float _1583 = floor(_1527);
    float _1585 = as_type<float>(_1284) * _1573;
    float _1587 = float(uint(_1567));
    int _1589 = 0;
    float _1591 = _1581;
    float _1593 = _1585;
    if (_1513)
    {
        float _1595 = -_1288;
        float _1597 = _1595 + 1.0;
        _1589 = as_type<int>(_1597);
    }
    int _1599 = _1589;
    if (_1164)
    {
        bool _1601 = _1521 > 0.5;
        _1182 = _1601;
    }
    bool _1603 = _1182;
    float _1605 = -_1533;
    float _1607 = _1515 + _1605;
    float _1609 = float(_1300);
    float _1611 = as_type<float>(_1308) * _1587;
    float _1613 = trunc(_1575);
    float _1615 = precise::max(_1613, 0.0);
    uint _1617 = uint(_1615);
    int _1619 = ~_1258;
    int _1621 = _1619 + 1;
    bool _1623 = _1499 != 1;
    int _1625 = 0;
    if (_1579)
    {
        float _1627 = -_1288;
        float _1629 = _1627 + 1.0;
        _1625 = as_type<int>(_1629);
    }
    int _1631 = _1625;
    float _1633 = in.m_55.w;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1637 = _1152 + _1635;
    int _1639 = ~_1238;
    int _1641 = _1639 + 1;
    int _1643 = _1561;
    if (_1513)
    {
        bool _1645 = as_type<float>(_1561) > 0.5;
        _1184 = _1645;
    }
    bool _1647 = _1184;
    if (_1164)
    {
        float _1649 = -_1288;
        float _1651 = _1649 + 1.0;
        _1643 = as_type<int>(_1651);
    }
    int _1653 = _1643;
    float _1655 = trunc(_1581);
    float _1657 = precise::max(_1655, 0.0);
    uint _1659 = uint(_1657);
    float _1661 = -_1583;
    float _1663 = _1527 + _1661;
    float _1665 = float(_1244);
    float _1667 = in.m_57.w;
    if (_1164)
    {
        float _1669 = _1603 ? as_type<float>(_1653) : _1288;
        _1377 = _1669;
    }
    float _1671 = _1377;
    float _1673 = float(_128);
    float _1675 = _1665 * _1607;
    float _1677 = floor(_1571);
    if (!_1513)
    {
        _1591 = _1288;
    }
    float _1679 = _1591;
    float _1681 = in.m_59.w;
    float _1683 = _1679;
    if (_1513)
    {
        float _1685 = _1647 ? as_type<float>(_1599) : _1288;
        _1683 = _1685;
    }
    float _1687 = _1683;
    int _1689 = int(_1361) + int(_1617);
    float _1691 = float(_1238);
    float _1693 = trunc(_1585);
    float _1695 = precise::max(_1693, 0.0);
    uint _1697 = uint(_1695);
    int _1699 = int(_1401) + int(_1659);
    int _1701 = ~_1238;
    int _1703 = _1701 + 1;
    float _1705 = _1663 * _1691;
    float _1707 = float(_1340);
    float _1709 = float(_1306);
    float _1711 = floor(_1551);
    if (!_1579)
    {
        _1593 = _1288;
    }
    float _1713 = _1593;
    float _1715 = -_1677;
    float _1717 = _1571 + _1715;
    float _1719 = _1713;
    if (_1579)
    {
        float _1721 = _1373 ? as_type<float>(_1631) : _1288;
        _1719 = _1721;
    }
    float _1723 = _1719;
    int _1725 = _1703 * _1699;
    int _1727 = _1725 + _1350;
    int _1729 = ~_1244;
    int _1731 = _1729 + 1;
    float _1733 = float(_1350);
    float _1735 = 1.0 / _1673;
    int _1737 = int(_1395) + int(_1697);
    bool _1739 = _1609 >= _1665;
    bool _1741 = isnan(_1609);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan(_1665);
    bool _1747 = _1743 || _1745;
    float _1749 = float(_1747);
    int _1751 = _1731 * _1689;
    int _1753 = _1751 + _1300;
    bool _1755 = _1733 >= _1691;
    bool _1757 = isnan(_1733);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan(_1691);
    bool _1763 = _1759 || _1761;
    float _1765 = float(_1763);
    float _1767 = _1691 * _162;
    bool _1769 = uint(_1727) >= uint(_1238);
    float _1771 = trunc(_1611);
    float _1773 = precise::max(_1771, 0.0);
    uint _1775 = uint(_1773);
    float _1777 = -_1711;
    float _1779 = _1551 + _1777;
    float _1781 = float(_1224);
    float _1783 = float(_1258);
    bool _1785 = _1707 >= _1781;
    bool _1787 = isnan(_1707);
    bool _1789 = _1785 || _1787;
    bool _1791 = isnan(_1781);
    bool _1793 = _1789 || _1791;
    float _1795 = float(_1793);
    float _1797 = _1781 * _1779;
    float _1799 = _1735 * _162;
    bool _1801 = uint(_1753) >= uint(_1244);
    float _1803 = _1767 * _1735;
    float _1805 = trunc(_1765);
    int _1807 = int(_1805);
    float _1809 = _1783 * _1799;
    bool _1811 = _1709 >= _1783;
    bool _1813 = isnan(_1709);
    bool _1815 = _1811 || _1813;
    bool _1817 = isnan(_1783);
    bool _1819 = _1815 || _1817;
    float _1821 = float(_1819);
    float _1823 = _1781 * _1799;
    bool _1825 = _1238 == 0;
    float _1827 = _1665 * _1799;
    int _1829 = int(_1371) + int(_1775);
    float _1831 = trunc(_1705);
    int _1833 = int(_1831);
    int _1835 = ~_1224;
    int _1837 = _1835 + 1;
    float _1839 = _1783 * _1717;
    bool _1841 = !_1769;
    int _1843 = _1841 ? 0 : (-1);
    int _1845 = _1621 * _1829;
    int _1847 = _1845 + _1306;
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1851 = _1849 != 0;
    int _1853 = _1837 * _1737;
    int _1855 = _1853 + _1340;
    int _1857 = ~_1699;
    int _1859 = _1857 + _1843;
    int _1861 = _1859 + 1;
    float _1863 = trunc(_1795);
    int _1865 = int(_1863);
    bool _1867 = !_1851;
    int _1869 = _1867 ? 0 : 1;
    bool _1871 = uint(_1847) >= uint(_1258);
    bool _1873 = uint(_1855) >= uint(_1224);
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1877 = _1875 != 0;
    float _1879 = trunc(_1749);
    int _1881 = int(_1879);
    bool _1883 = !_1801;
    int _1885 = _1883 ? 0 : (-1);
    int _1887 = abs(_1869);
    int _1889 = ~_1689;
    int _1891 = _1889 + _1885;
    int _1893 = _1891 + 1;
    bool _1895 = !_1871;
    int _1897 = _1895 ? 0 : (-1);
    float _1899 = trunc(_1797);
    int _1901 = int(_1899);
    bool _1903 = !_1873;
    int _1905 = _1903 ? 0 : (-1);
    int _1907 = _1833 * _1887;
    int _1909 = _1907 + _1350;
    bool _1911 = !_1877;
    int _1913 = _1911 ? 0 : 1;
    int _1915 = _1238 * _1861;
    int _1917 = _1915 + _1350;
    int _1919 = ~_1737;
    int _1921 = _1919 + _1905;
    int _1923 = _1921 + 1;
    int _1925 = ~_1829;
    int _1927 = _1925 + _1897;
    int _1929 = _1927 + 1;
    float _1931 = trunc(_1803);
    int _1933 = int(_1931);
    int _1935 = abs(_1913);
    int _1937 = _1224 * _1923;
    int _1939 = _1937 + _1340;
    int _1941 = ~_1807;
    int _1943 = _1941 + 1;
    int _1945 = _1943 + 1;
    int _1947 = _1244 * _1893;
    int _1949 = _1947 + _1300;
    bool _1951 = !_1825;
    int _1953 = _1951 ? _1917 : (-1);
    int _1955 = _1258 * _1929;
    int _1957 = _1955 + _1306;
    int _1959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1961 = _1959 != 0;
    float _1963 = trunc(_1675);
    int _1965 = int(_1963);
    int _1967 = _1901 * _1935;
    int _1969 = _1967 + _1340;
    int _1971 = _1953 * _1945;
    bool _1973 = !_1961;
    int _1975 = _1973 ? 0 : 1;
    int _1977 = _1238 + (-1);
    int _1979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1981 = _1979 != 0;
    int _1983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1985 = _1983 != 0;
    int _1987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1989 = _1987 != 0;
    float _1991 = trunc(_1821);
    int _1993 = int(_1991);
    int _1995 = abs(_1975);
    int _1997 = _1807 * _1977;
    int _1999 = _1997 + _1971;
    bool _2001 = _1224 == 0;
    bool _2003 = !_1985;
    int _2005 = _2003 ? 0 : 1;
    int _2007 = _1965 * _1995;
    int _2009 = _2007 + _1300;
    bool _2011 = !_1981;
    int _2013 = _2011 ? 0 : 1;
    float _2015 = trunc(_1809);
    int _2017 = int(_2015);
    bool _2019 = _1244 == 0;
    int _2021 = abs(_2005);
    int _2023 = ~_1865;
    int _2025 = _2023 + 1;
    int _2027 = _2025 + 1;
    bool _2029 = !_2001;
    int _2031 = _2029 ? _1939 : (-1);
    int _2033 = _1999 * _2021;
    int _2035 = abs(_2013);
    float _2037 = in.m_71.y;
    int _2039 = ~_1881;
    int _2041 = _2039 + 1;
    int _2043 = _2041 + 1;
    int _2045 = _2027 * _2031;
    bool _2047 = !_2019;
    int _2049 = _2047 ? _1949 : (-1);
    int _2051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2053 = _2051 != 0;
    int _2055 = _2043 * _2049;
    bool _2057 = !_1989;
    int _2059 = _2057 ? 0 : 1;
    int _2061 = _1933 * _2035;
    int _2063 = _2061 + _2033;
    bool _2065 = !_2053;
    int _2067 = _2065 ? 0 : 1;
    int _2069 = abs(_2059);
    int _2071 = abs(_2067);
    bool _2073 = _1258 == 0;
    int _2075 = _1224 + (-1);
    int _2077 = _1909 * _2069;
    int _2079 = _2077 + _2063;
    int _2081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2083 = _2081 != 0;
    int _2085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2087 = _2085 != 0;
    int _2089 = ~_1993;
    int _2091 = _2089 + 1;
    int _2093 = _2091 + 1;
    int _2095 = _1833 * _2071;
    int _2097 = _2095 + _2079;
    bool _2099 = !_2073;
    int _2101 = _2099 ? _1957 : (-1);
    int _2103 = _1865 * _2075;
    int _2105 = _2103 + _2045;
    bool _2107 = !_2087;
    int _2109 = _2107 ? 0 : 1;
    float _2111 = trunc(_1823);
    int _2113 = int(_2111);
    float _2115 = float(uint(_2097));
    int _2117 = _2093 * _2101;
    int _2119 = abs(_2109);
    int _2121 = _1244 + (-1);
    float _2123 = as_type<float>(_1352) * _2115;
    bool _2125 = !_2083;
    int _2127 = _2125 ? 0 : 1;
    int _2129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2131 = _2129 != 0;
    int _2133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2135 = _2133 != 0;
    int _2137 = _1881 * _2121;
    int _2139 = _2137 + _2055;
    int _2141 = abs(_2127);
    int _2143 = _2105 * _2119;
    float _2145 = trunc(_2123);
    float _2147 = precise::max(_2145, 0.0);
    uint _2149 = uint(_2147);
    bool _2151 = !_2131;
    int _2153 = _2151 ? 0 : 1;
    int _2155 = _2113 * _2141;
    int _2157 = _2155 + _2143;
    int _2159 = _1258 + (-1);
    int _2161 = abs(_2153);
    int _2163 = ~_1238;
    int _2165 = _2163 + 1;
    int _2167 = _1993 * _2159;
    int _2169 = _2167 + _2117;
    bool _2171 = !_2135;
    int _2173 = _2171 ? 0 : 1;
    int _2175 = _1969 * _2161;
    int _2177 = _2175 + _2157;
    int _2179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2181 = _2179 != 0;
    int _2183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2185 = _2183 != 0;
    float _2187 = trunc(_1827);
    int _2189 = int(_2187);
    int _2191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2193 = _2191 != 0;
    int _2195 = _2165 * int(_2149);
    int _2197 = _2195 + _2097;
    int _2199 = abs(_2173);
    bool _2201 = !_2185;
    int _2203 = _2201 ? 0 : 1;
    bool _2205 = !_2193;
    int _2207 = _2205 ? 0 : 1;
    int _2209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2211 = _2209 != 0;
    int _2213 = _1901 * _2199;
    int _2215 = _2213 + _2177;
    float _2217 = float(uint(_2197));
    int _2219 = abs(_2203);
    float _2221 = trunc(_1839);
    int _2223 = int(_2221);
    bool _2225 = !_2211;
    int _2227 = _2225 ? 0 : 1;
    float _2229 = as_type<float>(_1352) * _2217;
    int _2231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2233 = _2231 != 0;
    int _2235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2237 = _2235 != 0;
    int _2239 = _2139 * _2219;
    int _2241 = abs(_2227);
    bool _2243 = !_2181;
    int _2245 = _2243 ? 0 : 1;
    float _2247 = trunc(_2229);
    float _2249 = precise::max(_2247, 0.0);
    uint _2251 = uint(_2249);
    int _2253 = abs(_2207);
    float _2255 = float(uint(_2215));
    bool _2257 = !_2237;
    int _2259 = _2257 ? 0 : 1;
    int _2261 = abs(_2245);
    float _2263 = as_type<float>(_1284) * _2255;
    int _2265 = abs(_2259);
    float _2267 = trunc(_2263);
    float _2269 = precise::max(_2267, 0.0);
    uint _2271 = uint(_2269);
    int _2273 = _2189 * _2261;
    int _2275 = _2273 + _2239;
    int _2277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2279 = _2277 != 0;
    int _2281 = _2223 * _2241;
    int _2283 = _2281 + _1306;
    int _2285 = int(_2149) + int(_2251);
    int _2287 = _2169 * _2265;
    int _2289 = ~_1224;
    int _2291 = _2289 + 1;
    int _2293 = _2009 * _2253;
    int _2295 = _2293 + _2275;
    bool _2297 = !_2233;
    int _2299 = _2297 ? 0 : 1;
    bool _2301 = !_2279;
    int _2303 = _2301 ? 0 : 1;
    int _2305 = abs(_2299);
    int _2307 = _2291 * int(_2271);
    int _2309 = _2307 + _2215;
    int _2311 = ~_1238;
    int _2313 = _2311 + 1;
    int _2315 = abs(_2303);
    int _2317 = _2017 * _2305;
    int _2319 = _2317 + _2287;
    int _2321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2323 = _2321 != 0;
    int _2325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2327 = _2325 != 0;
    float _2329 = float(uint(_2309));
    int _2331 = _1965 * _2315;
    int _2333 = _2331 + _2295;
    bool _2335 = !_2323;
    int _2337 = _2335 ? 0 : 1;
    float _2339 = as_type<float>(_1284) * _2329;
    bool _2341 = !_2327;
    int _2343 = _2341 ? 0 : 1;
    int _2345 = _2313 * _2285;
    int _2347 = _2345 + _2097;
    float _2349 = float(uint(_2333));
    int _2351 = abs(_2337);
    float _2353 = trunc(_2339);
    float _2355 = precise::max(_2353, 0.0);
    uint _2357 = uint(_2355);
    bool _2359 = uint(_2347) >= uint(_1238);
    float _2361 = as_type<float>(_1302) * _2349;
    int _2363 = abs(_2343);
    bool _2365 = !_2359;
    int _2367 = _2365 ? 0 : (-1);
    float _2369 = trunc(_2361);
    float _2371 = precise::max(_2369, 0.0);
    uint _2373 = uint(_2371);
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2377 = _2375 != 0;
    int _2379 = _2283 * _2351;
    int _2381 = _2379 + _2319;
    int _2383 = ~_2285;
    int _2385 = _2383 + _2367;
    int _2387 = _2385 + 1;
    bool _2389 = _1238 == 0;
    int _2391 = _2223 * _2363;
    int _2393 = _2391 + _2381;
    int _2395 = ~_1244;
    int _2397 = _2395 + 1;
    int _2399 = _1238 * _2387;
    int _2401 = _2399 + _2097;
    bool _2403 = _1342 > 0.5;
    float _2405 = in.m_61.w;
    float _2407 = float(uint(_2393));
    bool _2409 = !_2389;
    int _2411 = _2409 ? _2401 : (-1);
    int _2413 = _2305;
    if (_2377)
    {
        float _2415 = -_1288;
        float _2417 = _2415 + 1.0;
        _2413 = as_type<int>(_2417);
    }
    int _2419 = _2413;
    int _2421 = int(_2271) + int(_2357);
    float _2423 = as_type<float>(_1308) * _2407;
    int _2425 = _2411 & 3;
    bool _2427 = _2425 != 0;
    int _2429 = _2397 * int(_2373);
    int _2431 = _2429 + _2333;
    if (_2377)
    {
        float _2433 = _2403 ? as_type<float>(_2419) : _1288;
        _1316 = _2433;
    }
    float _2435 = _1316;
    float _2437 = trunc(_2423);
    float _2439 = precise::max(_2437, 0.0);
    uint _2441 = uint(_2439);
    int _2443 = ~_1224;
    int _2445 = _2443 + 1;
    float _2447 = -_2037;
    float _2449 = _2447 + 1.0;
    bool _2451 = uint(_2425) > 1u;
    float _2453 = float(uint(_2431));
    int _2455 = _2445 * _2421;
    int _2457 = _2455 + _2215;
    int _2459 = _2411 & 3;
    bool _2461 = _2459 != 0;
    int _2463 = _2403 ? as_type<int>(_2449) : as_type<int>(_2037);
    float _2465 = as_type<float>(_1302) * _2453;
    int _2467 = _2461 ? 0 : 1;
    bool _2469 = uint(_2457) >= uint(_1224);
    float _2471 = trunc(_2465);
    float _2473 = precise::max(_2471, 0.0);
    uint _2475 = uint(_2473);
    int _2477 = ~_1258;
    int _2479 = _2477 + 1;
    int _2481 = ~_2467;
    int _2483 = _2481 + 1;
    int _2485 = _2483 + 1;
    int _2487 = _2485;
    if (!_2451)
    {
        int _2489 = ~_2467;
        int _2491 = _2489 + 1;
        _2487 = _2491;
    }
    int _2493 = _2487;
    int _2495 = _2479 * int(_2441);
    int _2497 = _2495 + _2393;
    bool _2499 = !_2469;
    int _2501 = _2499 ? 0 : (-1);
    bool _2503 = _2425 != 3;
    int _2505 = ~_2421;
    int _2507 = _2505 + _2501;
    int _2509 = _2507 + 1;
    float _2511 = float(uint(_2497));
    bool _2513 = uint(_2425) >= 2u;
    int _2515 = _1224 * _2509;
    int _2517 = _2515 + _2215;
    bool _2519 = _1224 == 0;
    float _2521 = as_type<float>(_1308) * _2511;
    int _2523 = _2513 ? 0 : 1;
    bool _2525 = _2405 > 0.5;
    int _2527 = ~_1244;
    int _2529 = _2527 + 1;
    float _2531 = trunc(_2521);
    float _2533 = precise::max(_2531, 0.0);
    uint _2535 = uint(_2533);
    int _2537 = int(_2373) + int(_2475);
    bool _2539 = !_2519;
    int _2541 = _2539 ? _2517 : (-1);
    int _2543 = ~_2523;
    int _2545 = _2543 + 1;
    int _2547 = _2545 + 1;
    int _2549 = _2529 * _2537;
    int _2551 = _2549 + _2333;
    int _2553 = _2547;
    if (_2503)
    {
        int _2555 = ~_2523;
        int _2557 = _2555 + 1;
        _2553 = _2557;
    }
    int _2559 = _2553;
    int _2561 = _2525 ? as_type<int>(_2449) : as_type<int>(_2037);
    int _2563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2565 = _2563 != 0;
    int _2567 = _2541 & 3;
    bool _2569 = _2567 != 0;
    bool _2571 = !_2565;
    int _2573 = _2571 ? 0 : 1;
    bool _2575 = uint(_2567) >= 2u;
    int _2577 = _2569 ? 0 : 1;
    bool _2579 = uint(_2551) >= uint(_1244);
    int _2581 = _2575 ? 0 : 1;
    bool _2583 = _2567 != 3;
    bool _2585 = !_2579;
    int _2587 = _2585 ? 0 : (-1);
    int _2589 = ~_1258;
    int _2591 = _2589 + 1;
    bool _2593 = uint(_2567) > 1u;
    int _2595 = ~_2537;
    int _2597 = _2595 + _2587;
    int _2599 = _2597 + 1;
    int _2601 = int(_2441) + int(_2535);
    int _2603 = _1244 * _2599;
    int _2605 = _2603 + _2333;
    bool _2607 = _1244 == 0;
    int _2609 = ~_2581;
    int _2611 = _2609 + 1;
    int _2613 = _2611 + 1;
    int _2615 = _2591 * _2601;
    int _2617 = _2615 + _2393;
    int _2619 = _2613;
    if (_2583)
    {
        int _2621 = ~_2581;
        int _2623 = _2621 + 1;
        _2619 = _2623;
    }
    int _2625 = _2619;
    int _2627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2629 = _2627 != 0;
    int _2631 = ~_2577;
    int _2633 = _2631 + 1;
    int _2635 = _2633 + 1;
    bool _2637 = !_2607;
    int _2639 = _2637 ? _2605 : (-1);
    int _2641 = _2635;
    if (!_2593)
    {
        int _2643 = ~_2577;
        int _2645 = _2643 + 1;
        _2641 = _2645;
    }
    int _2647 = _2641;
    bool _2649 = uint(_2617) >= uint(_1258);
    bool _2651 = !_2629;
    int _2653 = _2651 ? 0 : 1;
    int _2655 = _2639 & 3;
    bool _2657 = _2655 != 0;
    bool _2659 = !_2649;
    int _2661 = _2659 ? 0 : (-1);
    int _2663 = _2657 ? 0 : 1;
    bool _2665 = uint(_2655) >= 2u;
    bool _2667 = _2655 != 3;
    int _2669 = ~_2601;
    int _2671 = _2669 + _2661;
    int _2673 = _2671 + 1;
    int _2675 = _2665 ? 0 : 1;
    bool _2677 = uint(_2655) > 1u;
    int _2679 = _1258 * _2673;
    int _2681 = _2679 + _2393;
    bool _2683 = _1258 == 0;
    int _2685 = ~_2675;
    int _2687 = _2685 + 1;
    int _2689 = _2687 + 1;
    bool _2691 = !_2683;
    int _2693 = _2691 ? _2681 : (-1);
    int _2695 = _2689;
    if (_2667)
    {
        int _2697 = ~_2675;
        int _2699 = _2697 + 1;
        _2695 = _2699;
    }
    int _2701 = _2695;
    int _2703 = _2693 & 3;
    bool _2705 = _2703 != 0;
    int _2707 = ~_2663;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    int _2713 = _2711;
    if (!_2677)
    {
        int _2715 = ~_2663;
        int _2717 = _2715 + 1;
        _2713 = _2717;
    }
    int _2719 = _2713;
    bool _2721 = uint(_2703) >= 2u;
    int _2723 = _2705 ? 0 : 1;
    int _2725 = _2721 ? 0 : 1;
    bool _2727 = _2703 != 3;
    bool _2729 = uint(_2703) > 1u;
    int _2731 = ~_2725;
    int _2733 = _2731 + 1;
    int _2735 = _2733 + 1;
    int _2737 = ~_2723;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    float _2743 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2745 = _2743 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2747 = _2735;
    int _2749 = _2741;
    if (_2727)
    {
        int _2751 = ~_2725;
        int _2753 = _2751 + 1;
        _2747 = _2753;
    }
    int _2755 = _2747;
    float _2757 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2759 = _2757 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    if (!_2729)
    {
        int _2761 = ~_2723;
        int _2763 = _2761 + 1;
        _2749 = _2763;
    }
    int _2765 = _2749;
    float _2767 = 1.0 / _2745;
    float _2769 = in.m_46.x;
    float _2771 = in.m_46.y;
    float _2773 = in.m_46.z;
    int _2775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2777 = _2775 != 0;
    float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2781 = _2779 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    int _2783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2785 = _2783 != 0;
    bool _2787 = !_2777;
    int _2789 = _2787 ? 0 : 1;
    float _2791 = _2785 ? as_type<float>(_2463) : _2037;
    float _2793 = 1.0 / _2759;
    int _2795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2797 = _2795 != 0;
    bool _2799 = _1501 > 0.5;
    float _2801 = _2797 ? as_type<float>(_2561) : _2037;
    int _2803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2805 = _2803 != 0;
    float _2807 = 1.0 / _2781;
    int _2809 = _2799 ? as_type<int>(_2449) : as_type<int>(_2037);
    int _2811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2813 = _2811 != 0;
    float _2815 = _2805 ? as_type<float>(_2809) : _2037;
    float _2817 = _2813 ? as_type<float>(_2809) : _2037;
    float _2819 = _194 * _2771;
    int _2821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2823 = _2821 != 0;
    int _2825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2827 = _2825 != 0;
    float _2829 = _200 * _2771;
    int _2831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2833 = _2831 != 0;
    float _2835 = _206 * _2771;
    float _2837 = fma(_192, _2769, _2819);
    float _2839 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2841 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2843 = _2841 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2845 = fma(_198, _2769, _2829);
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2849 = fma(_204, _2769, _2835);
    float _2851 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2853 = _2851 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2855 = fma(_196, _2773, _2837);
    float _2857 = fma(_2839, -2.0, _2847);
    float _2859 = _1491 * 2.0;
    float _2861 = 1.0 / _2853;
    float _2863 = fma(_202, _2773, _2845);
    float _2865 = fma(_208, _2773, _2849);
    float _2867 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2869 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2867;
    float _2871 = floor(_2859);
    float _2873 = _2823 ? as_type<float>(_2809) : _2037;
    float _2875 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2877 = _2875 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2879 = _2827 ? as_type<float>(_2809) : _2037;
    float _2881 = _2869 * _2767;
    bool _2883 = !_2833;
    int _2885 = _2883 ? 0 : 1;
    float _2887 = _2855 + _1633;
    float _2889 = float(uint(_1969));
    float _2891 = 1.0 / _2843;
    float _2893 = float(uint(_2009));
    float _2895 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2857);
    int _2897 = ~_1224;
    int _2899 = _2897 + 1;
    float _2901 = float(uint(_2283));
    float _2903 = as_type<float>(_1302) * _2893;
    bool _2905 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2907 = isnan(_1152);
    bool _2909 = _2905 || _2907;
    bool _2911 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2913 = _2909 || _2911;
    float _2915 = float(_2913);
    float _2917 = 1.0 / _2877;
    float _2919 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2921 = _2919 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2923 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2925 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2923;
    bool _2927 = _2871 > 0.0;
    float _2929 = as_type<float>(_1308) * _2901;
    float _2931 = _2921 * _2793;
    float _2933 = _2925 * _2807;
    float _2935 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2937 = _2935 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2939 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2941 = _2939 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _2943 = _2871 >= 0.0;
    bool _2945 = isnan(_2871);
    bool _2947 = _2943 || _2945;
    bool _2949 = isnan(0.0);
    bool _2951 = _2947 || _2949;
    float _2953 = 1.0 / _2937;
    float _2955 = _2941 * _2861;
    float _2957 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2959 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2957;
    int _2961 = _2951 ? 0 : 1;
    float _2963 = fma(_2933, _1637, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2965 = _2959 * _2891;
    float _2967 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2969 = _2967 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2971 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2973 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2971;
    float _2975 = _1342 * 2.0;
    float _2977 = float(uint(_1909));
    float _2979 = _2969 * _2917;
    int _2981 = ~_2961;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    float _2987 = floor(_2975);
    int _2989 = _2985;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2993 = _2793;
    float _2995 = _2917;
    if (!_2927)
    {
        int _2997 = ~_2961;
        int _2999 = _2997 + 1;
        _2989 = _2999;
    }
    int _3001 = _2989;
    float _3003 = _2973 * _2953;
    bool _3005 = !_1623;
    float _3007 = _3005 ? as_type<float>(_1503) : as_type<float>(_1505);
    float _3009 = as_type<float>(_1352) * _2977;
    float _3011 = _2953;
    if (!_1623)
    {
        _2991 = _1342;
    }
    float _3013 = _2991;
    float _3015 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3017 = _1152 + _3015;
    float _3019 = _3013;
    if (!_1623)
    {
        _2993 = _1342;
    }
    float _3021 = _2993;
    float _3023 = trunc(_3009);
    float _3025 = precise::max(_3023, 0.0);
    uint _3027 = uint(_3025);
    float _3029 = _3021;
    if (!_1623)
    {
        _2995 = _1501;
    }
    float _3031 = _2995;
    float _3033 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3035 = _1152 + _3033;
    float _3037 = _3031;
    if (!_1623)
    {
        _3011 = _1501;
    }
    float _3039 = _3011;
    bool _3041 = _1507 != 2;
    bool _3043 = !_1623;
    float _3045 = _3043 ? as_type<float>(_1505) : as_type<float>(_1509);
    float _3047 = fma(_2931, _3035, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3049 = _3039;
    float _3051 = _3047;
    if (_1623)
    {
        _3019 = _1491;
    }
    float _3053 = _3019;
    float _3055 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3057 = _1152 + _3055;
    if (_1623)
    {
        _3029 = _1491;
    }
    float _3059 = _3029;
    float _3061 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3063 = _1152 + _3061;
    if (_1623)
    {
        _3037 = _1342;
    }
    float _3065 = _3037;
    float _3067 = _3053 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1623)
    {
        _3049 = _1342;
    }
    float _3069 = _3049;
    bool _3071 = _2987 > 0.0;
    int _3073 = _1641 * int(_3027);
    int _3075 = _3073 + _1909;
    bool _3077 = _2987 >= 0.0;
    bool _3079 = isnan(_2987);
    bool _3081 = _3077 || _3079;
    bool _3083 = isnan(0.0);
    bool _3085 = _3081 || _3083;
    float _3087 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3089 = _1152 + _3087;
    bool _3091 = _2703 != 3;
    float _3093 = float(uint(_3075));
    float _3095 = fma(_2881, _3089, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3097 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3099 = _1152 + _3097;
    float _3101 = as_type<float>(_1352) * _3093;
    float _3103 = fma(_2955, _3099, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3105 = fma(_2979, _3017, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3107 = fma(_3003, _3063, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3109 = _2863 + _1667;
    float _3111 = as_type<float>(_1284) * _2889;
    bool _3113 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3115 = isnan(_1152);
    bool _3117 = _3113 || _3115;
    bool _3119 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3121 = _3117 || _3119;
    float _3123 = float(_3121);
    float _3125 = fma(_2965, _3057, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _3127 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3129 = isnan(_1152);
    bool _3131 = _3127 || _3129;
    bool _3133 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3135 = _3131 || _3133;
    float _3137 = float(_3135);
    float _3139 = trunc(_3101);
    float _3141 = precise::max(_3139, 0.0);
    uint _3143 = uint(_3141);
    bool _3145 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3147 = isnan(_1152);
    bool _3149 = _3145 || _3147;
    bool _3151 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3153 = _3149 || _3151;
    float _3155 = float(_3153);
    float _3157 = -_3123;
    float _3159 = _3157 + 1.0;
    bool _3161 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3163 = isnan(_1152);
    bool _3165 = _3161 || _3163;
    bool _3167 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3169 = _3165 || _3167;
    float _3171 = float(_3169);
    float _3173 = -_3137;
    float _3175 = _3173 + 1.0;
    bool _3177 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3179 = isnan(_1152);
    bool _3181 = _3177 || _3179;
    bool _3183 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3185 = _3181 || _3183;
    float _3187 = float(_3185);
    float _3189 = _3137 * _3159;
    bool _3191 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3193 = isnan(_1152);
    bool _3195 = _3191 || _3193;
    bool _3197 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3199 = _3195 || _3197;
    float _3201 = float(_3199);
    float _3203 = trunc(_3111);
    float _3205 = precise::max(_3203, 0.0);
    uint _3207 = uint(_3205);
    float _3209 = _3155 * _3175;
    float _3211 = -_3155;
    float _3213 = _3211 + 1.0;
    bool _3215 = _1152 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3217 = isnan(_1152);
    bool _3219 = _3215 || _3217;
    bool _3221 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3223 = _3219 || _3221;
    float _3225 = float(_3223);
    float _3227 = -_3201;
    float _3229 = _3227 + 1.0;
    float _3231 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3233 = _3201 * _3213;
    int _3235 = abs(_2719);
    float _3237 = trunc(_2903);
    float _3239 = precise::max(_3237, 0.0);
    uint _3241 = uint(_3239);
    float _3243 = _2915 * _3229;
    float _3245 = -_2915;
    float _3247 = _3245 + 1.0;
    int _3249 = ~_3235;
    int _3251 = _3249 + 1;
    int _3253 = _3251 + 1;
    int _3255 = abs(_2701);
    float _3257 = _3171 * _3247;
    float _3259 = -_3171;
    float _3261 = _3259 + 1.0;
    int _3263 = _2899 * int(_3207);
    int _3265 = _3263 + _1969;
    int _3267 = ~_1258;
    int _3269 = _3267 + 1;
    int _3271 = ~_1244;
    int _3273 = _3271 + 1;
    float _3275 = _3187 * _3261;
    float _3277 = float(uint(_3265));
    float _3279 = trunc(_2929);
    float _3281 = precise::max(_3279, 0.0);
    uint _3283 = uint(_3281);
    int _3285 = _3273 * int(_3241);
    int _3287 = _3285 + _2009;
    int _3289 = ~_3255;
    int _3291 = _3289 + 1;
    int _3293 = _3291 + 1;
    float _3295 = as_type<float>(_1284) * _3277;
    float _3297 = -_3187;
    float _3299 = _3297 + 1.0;
    int _3301 = abs(_2885);
    float _3303 = float(uint(_3287));
    float _3305 = _3225 * _3299;
    float _3307 = trunc(_3295);
    float _3309 = precise::max(_3307, 0.0);
    uint _3311 = uint(_3309);
    float _3313 = -_3225;
    float _3315 = _3313 + 1.0;
    float _3317 = _3095 * _3305;
    float _3319 = as_type<float>(_1302) * _3303;
    int _3321 = _3085 ? 0 : 1;
    int _3323 = _3269 * int(_3283);
    int _3325 = _3323 + _2283;
    float _3327 = fma(_3315, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3317);
    float _3329 = trunc(_3319);
    float _3331 = precise::max(_3329, 0.0);
    uint _3333 = uint(_3331);
    int _3335 = ~_1238;
    int _3337 = _3335 + 1;
    float _3339 = float(uint(_3325));
    float _3341 = _2865 + _1681;
    int _3343 = int(_3027) + int(_3143);
    float _3345 = fma(_3047, _3275, _3327);
    int _3347 = ~_1224;
    int _3349 = _3347 + 1;
    float _3351 = as_type<float>(_1308) * _3339;
    int _3353 = int(_3207) + int(_3311);
    int _3355 = _3337 * _3343;
    int _3357 = _3355 + _1909;
    float _3359 = fma(_2963, _3257, _3345);
    int _3361 = ~_3321;
    int _3363 = _3361 + 1;
    int _3365 = _3363 + 1;
    float _3367 = trunc(_3351);
    float _3369 = precise::max(_3367, 0.0);
    uint _3371 = uint(_3369);
    int _3373 = _3365;
    float _3375 = as_type<float>(_3343);
    float _3377 = _3345;
    if (!_3071)
    {
        int _3379 = ~_3321;
        int _3381 = _3379 + 1;
        _3373 = _3381;
    }
    int _3383 = _3373;
    float _3385 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3387 = _3109 + _3385;
    bool _3389 = uint(_3357) >= uint(_1238);
    int _3391 = _3349 * _3353;
    int _3393 = _3391 + _1969;
    int _3395 = int(_3241) + int(_3333);
    float _3397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3399 = _2887 + _3397;
    int _3401 = ~_1244;
    int _3403 = _3401 + 1;
    float _3405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    bool _3407 = !_3389;
    int _3409 = _3407 ? 0 : (-1);
    float _3411 = fma(_3103, _3243, _3359);
    int _3413 = ~_1258;
    int _3415 = _3413 + 1;
    int _3417 = _3403 * _3395;
    int _3419 = _3417 + _2009;
    bool _3421 = uint(_3393) >= uint(_1224);
    float _3423 = _3387 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3425 = fma(_3125, _3233, _3411);
    int _3427 = int(_3283) + int(_3371);
    float _3429 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _3431 = !_3421;
    int _3433 = _3431 ? 0 : (-1);
    float _3435 = fma(_3399, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3423);
    bool _3437 = uint(_3419) >= uint(_1244);
    int _3439 = _3415 * _3427;
    int _3441 = _3439 + _2283;
    float _3443 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3445 = _3341 + _3443;
    float _3447 = _3405 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    bool _3449 = !_3437;
    int _3451 = _3449 ? 0 : (-1);
    float _3453 = fma(_3445, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3435);
    bool _3455 = uint(_3441) >= uint(_1258);
    float _3457 = _1501 * 2.0;
    float _3459 = fma(_3447, _1389, -0.5);
    bool _3461 = !_3455;
    int _3463 = _3461 ? 0 : (-1);
    bool _3465 = _3453 >= 0.0;
    float _3467 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3469 = floor(_3457);
    float _3471 = -_3467;
    float _3473 = fma(_3429, 2.0, _3471);
    float _3475 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3477 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3479 = _1342 + _1491;
    float _3481 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3483 = fma(as_type<float>(_1509), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3475);
    float _3485 = as_type<float>(_1509) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3487 = fma(as_type<float>(_1505), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3477);
    float _3489 = as_type<float>(_1505) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _3491 = ~_3343;
    int _3493 = _3491 + _3409;
    int _3495 = _3493 + 1;
    float _3497 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3483);
    float _3499 = fma(_3489, -2.0, _3481);
    float _3501 = as_type<float>(_3383);
    if (_3465)
    {
        _3375 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3503 = _3375;
    float _3505 = _3479 + (-1.0);
    float _3507 = fma(_3105, _3209, _3425);
    bool _3509 = _3469 >= 0.0;
    bool _3511 = isnan(_3469);
    bool _3513 = _3509 || _3511;
    bool _3515 = isnan(0.0);
    bool _3517 = _3513 || _3515;
    int _3519 = as_type<int>(_3503);
    if (_3465)
    {
        float _3521 = _3503 * 5.0;
        _3519 = as_type<int>(_3521);
    }
    int _3523 = _3519;
    int _3525 = _1238 * _3495;
    int _3527 = _3525 + _1909;
    float _3529 = fma(_3107, _3189, _3507);
    if (_3465)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11739 = as_type<float>(_3523);
        out.gl_Position.z = _11739;
    }
    if (_3041)
    {
        _3051 = _1491;
    }
    float _3531 = _3051;
    float _3533 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3535 = _3531;
    if (_3041)
    {
        _3377 = _1342;
    }
    float _3537 = _3377;
    float _3539 = fma(_3123, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3529);
    float _3541 = _3537;
    if (!_3041)
    {
        _3535 = _1501;
    }
    float _3543 = _3535;
    float _3545 = -_3533;
    float _3547 = fma(_3485, 2.0, _3545);
    if (!_3041)
    {
        _3541 = _1491;
    }
    float _3549 = _3541;
    float _3551 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _3553 = _3469 > 0.0;
    out.m_73.x = _3539;
    float _3555 = _3387 * _3387;
    float _3557 = fma(_3069, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3551);
    bool _3559 = !_2427;
    int _3561 = _3559 ? 0 : 1;
    float _3563 = fma(_3399, _3399, _3555);
    float _3565 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3567 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    int _3569 = _2541 & 3;
    bool _3571 = _3569 != 0;
    float _3573 = fma(_3445, _3445, _3563);
    int _3575 = _2541 >> 31;
    float _3577 = fma(_3045, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3567);
    float _3579 = _3045 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3581 = rsqrt(_3573);
    bool _3583 = !_3571;
    int _3585 = _3583 ? 0 : 1;
    float _3587 = _3549 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3589 = -_3565;
    float _3591 = fma(_3579, 2.0, _3589);
    int _3593 = _2411 >> 31;
    float _3595 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3487);
    int _3597 = _2639 & 3;
    bool _3599 = _3597 != 0;
    float _3601 = -_162;
    float _3603 = fma(_3601, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3473);
    int _3605 = _3575 & 3;
    float _3607 = -_162;
    float _3609 = fma(_3607, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3547);
    int _3611 = _3593 & 3;
    float _3613 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3499);
    int _3615 = _2639 >> 31;
    float _3617 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3557);
    int _3619 = _2411 + _3611;
    float _3621 = -_162;
    float _3623 = fma(_3621, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3591);
    int _3625 = _3615 & 3;
    float _3627 = _3387 * _3581;
    bool _3629 = !_3599;
    int _3631 = _3629 ? 0 : 1;
    float _3633 = _3399 * _3581;
    int _3635 = _3619 >> 2;
    float _3637 = -_3627;
    float _3639 = fma(_3637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3387);
    int _3641 = _2693 & 3;
    bool _3643 = _3641 != 0;
    float _3645 = -_3633;
    float _3647 = fma(_3645, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3399);
    int _3649 = _2639 + _3625;
    float _3651 = _3639 * _3639;
    int _3653 = _2693 >> 31;
    if (_3465)
    {
        out.m_49.x = 0.0;
    }
    int _3655 = _3635 << 4;
    int _3657 = _3655 + 368;
    float _3659 = fma(_3647, _3647, _3651);
    bool _3661 = !_3643;
    int _3663 = _3661 ? 0 : 1;
    bool _3665 = _2425 != 3;
    int _3667 = _2541 + _3605;
    int _3669 = _3649 >> 2;
    int _3671 = _3653 & 3;
    uint _3673 = uint(int(uint(_3657) >> uint(2)));
    uint _3675 = uint(int(uint(int(_3673)) >> uint(2)));
    int _3677 = int(_3673) & 3;
    float _3679 = (*spvDescriptorSet0.vp_c9)._m0[int(_3675)][_3677];
    int _3681 = int(_3673) + 1;
    uint _3683 = uint(int(uint(_3681) >> uint(2)));
    int _3685 = _3681 & 3;
    float _3687 = (*spvDescriptorSet0.vp_c9)._m0[int(_3683)][_3685];
    int _3689 = ~_3353;
    int _3691 = _3689 + _3433;
    int _3693 = _3691 + 1;
    bool _3695 = !_3665;
    int _3697 = _3695 ? 0 : (-1);
    bool _3699 = _2567 != 3;
    int _3701 = _1224 * _3693;
    int _3703 = _3701 + _1969;
    int _3705 = _2693 + _3671;
    float _3707 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3709 = int(_3707);
    int _3711 = _3667 >> 2;
    int _3713 = _3705 >> 2;
    float _3715 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _3717 = !_3699;
    int _3719 = _3717 ? 0 : (-1);
    bool _3721 = _2655 != 3;
    float _3723 = -_3715;
    float _3725 = fma(_3067, 2.0, _3723);
    int _3727 = _3711 << 4;
    int _3729 = _3727 + 512;
    float _3731 = _3065 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3733 = _3713 << 4;
    int _3735 = _3733 + 800;
    float _3737 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3739 = int(_3737);
    bool _3741 = !_2389;
    int _3743 = _3741 ? _3527 : (-1);
    uint _3745 = uint(int(uint(_3729) >> uint(2)));
    uint _3747 = uint(int(uint(int(_3745)) >> uint(2)));
    int _3749 = int(_3745) & 3;
    float _3751 = (*spvDescriptorSet0.vp_c9)._m0[int(_3747)][_3749];
    int _3753 = int(_3745) + 1;
    uint _3755 = uint(int(uint(_3753) >> uint(2)));
    int _3757 = _3753 & 3;
    float _3759 = (*spvDescriptorSet0.vp_c9)._m0[int(_3755)][_3757];
    bool _3761 = !_2519;
    int _3763 = _3761 ? _3703 : (-1);
    float _3765 = -_162;
    float _3767 = fma(_3765, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3725);
    bool _3769 = !_3091;
    int _3771 = _3769 ? 0 : (-1);
    int _3773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3775 = _3773 != 0;
    int _3777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3779 = _3777 != 0;
    int _3781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3783 = _3781 != 0;
    uint _3785 = uint(int(uint(_3735) >> uint(2)));
    uint _3787 = uint(int(uint(int(_3785)) >> uint(2)));
    int _3789 = int(_3785) & 3;
    float _3791 = (*spvDescriptorSet0.vp_c9)._m0[int(_3787)][_3789];
    int _3793 = int(_3785) + 1;
    uint _3795 = uint(int(uint(_3793) >> uint(2)));
    int _3797 = _3793 & 3;
    float _3799 = (*spvDescriptorSet0.vp_c9)._m0[int(_3795)][_3797];
    float _3801 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3803 = _3517 ? 0 : 1;
    float _3805 = fma(_3505, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3807 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _3809 = fma(_3731, -2.0, _3801);
    float _3811 = _3543 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3813 = ~_3803;
    int _3815 = _3813 + 1;
    int _3817 = _3815 + 1;
    float _3819 = fma(_3007, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3807);
    float _3821 = _3007 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _3823 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    int _3825 = _3669 << 4;
    int _3827 = _3825 + 656;
    float _3829 = -_3231;
    float _3831 = fma(_3811, 2.0, _3829);
    int _3833 = _3817;
    if (!_3553)
    {
        int _3835 = ~_3803;
        int _3837 = _3835 + 1;
        _3833 = _3837;
    }
    int _3839 = _3833;
    float _3841 = fma(_3821, -2.0, _3823);
    int _3843 = ~_3395;
    int _3845 = _3843 + _3451;
    int _3847 = _3845 + 1;
    uint _3849 = uint(int(uint(_3827) >> uint(2)));
    uint _3851 = uint(int(uint(int(_3849)) >> uint(2)));
    int _3853 = int(_3849) & 3;
    float _3855 = (*spvDescriptorSet0.vp_c9)._m0[int(_3851)][_3853];
    int _3857 = int(_3849) + 1;
    uint _3859 = uint(int(uint(_3857) >> uint(2)));
    int _3861 = _3857 & 3;
    float _3863 = (*spvDescriptorSet0.vp_c9)._m0[int(_3859)][_3861];
    int _3865 = abs(_2647);
    float _3867 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3841);
    int _3869 = _1244 * _3847;
    int _3871 = _3869 + _2009;
    int _3873 = ~_3427;
    int _3875 = _3873 + _3463;
    int _3877 = _3875 + 1;
    float _3879 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3809);
    int _3881 = abs(_3585);
    int _3883 = _3657 + 8;
    uint _3885 = uint(int(uint(_3883) >> uint(2)));
    uint _3887 = uint(int(uint(int(_3885)) >> uint(2)));
    int _3889 = int(_3885) & 3;
    float _3891 = (*spvDescriptorSet0.vp_c9)._m0[int(_3887)][_3889];
    int _3893 = int(_3885) + 1;
    uint _3895 = uint(int(uint(_3893) >> uint(2)));
    int _3897 = _3893 & 3;
    float _3899 = (*spvDescriptorSet0.vp_c9)._m0[int(_3895)][_3897];
    float _3901 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3903 = _1258 * _3877;
    int _3905 = _3903 + _2283;
    int _3907 = abs(_3663);
    float _3909 = -_162;
    float _3911 = fma(_3909, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3831);
    float _3913 = fma(_3587, -2.0, _3901);
    int _3915 = abs(_2493);
    int _3917 = _3729 + 8;
    uint _3919 = uint(int(uint(_3917) >> uint(2)));
    uint _3921 = uint(int(uint(int(_3919)) >> uint(2)));
    int _3923 = int(_3919) & 3;
    float _3925 = (*spvDescriptorSet0.vp_c9)._m0[int(_3921)][_3923];
    int _3927 = int(_3919) + 1;
    uint _3929 = uint(int(uint(_3927) >> uint(2)));
    int _3931 = _3927 & 3;
    float _3933 = (*spvDescriptorSet0.vp_c9)._m0[int(_3929)][_3931];
    int _3935 = ~_3865;
    int _3937 = _3935 + 1;
    int _3939 = _3937 + 1;
    float _3941 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3943 = int(_3941);
    int _3945 = ~_3915;
    int _3947 = _3945 + 1;
    int _3949 = _3947 + 1;
    float _3951 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3913);
    int _3953 = _3939 * as_type<int>(_3759);
    bool _3955 = !_3721;
    int _3957 = _3955 ? 0 : (-1);
    int _3959 = _3827 + 8;
    uint _3961 = uint(int(uint(_3959) >> uint(2)));
    uint _3963 = uint(int(uint(int(_3961)) >> uint(2)));
    int _3965 = int(_3961) & 3;
    float _3967 = (*spvDescriptorSet0.vp_c9)._m0[int(_3963)][_3965];
    int _3969 = int(_3961) + 1;
    uint _3971 = uint(int(uint(_3969) >> uint(2)));
    int _3973 = _3969 & 3;
    float _3975 = (*spvDescriptorSet0.vp_c9)._m0[int(_3971)][_3973];
    int _3977 = _3949 * as_type<int>(_3687);
    int _3979 = abs(_3561);
    float _3981 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _3983 = abs(_3631);
    int _3985 = abs(_2765);
    float _3987 = fma(_3059, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3981);
    int _3989 = _3735 + 8;
    uint _3991 = uint(int(uint(_3989) >> uint(2)));
    uint _3993 = uint(int(uint(int(_3991)) >> uint(2)));
    int _3995 = int(_3991) & 3;
    float _3997 = (*spvDescriptorSet0.vp_c9)._m0[int(_3993)][_3995];
    int _3999 = int(_3991) + 1;
    uint _4001 = uint(int(uint(_3999) >> uint(2)));
    int _4003 = _3999 & 3;
    float _4005 = (*spvDescriptorSet0.vp_c9)._m0[int(_4001)][_4003];
    float _4007 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4009 = int(_4007);
    float _4011 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3987);
    int _4013 = ~_3985;
    int _4015 = _4013 + 1;
    int _4017 = _4015 + 1;
    int _4019 = ~_3881;
    int _4021 = _4019 + 1;
    int _4023 = _4021 + 1;
    int _4025 = ~_3907;
    int _4027 = _4025 + 1;
    int _4029 = _4027 + 1;
    int _4031 = _4017 * as_type<int>(_3799);
    int _4033 = ~_3979;
    int _4035 = _4033 + 1;
    int _4037 = _4035 + 1;
    int _4039 = _4023 * as_type<int>(_3751);
    int _4041 = _4039 + _3953;
    int _4043 = abs(_2559);
    int _4045 = _4029 * as_type<int>(_3791);
    int _4047 = _4045 + _4031;
    int _4049 = abs(_2625);
    int _4051 = _4037 * as_type<int>(_3679);
    int _4053 = _4051 + _3977;
    int _4055 = abs(_3697);
    int _4057 = _3253 * as_type<int>(_3863);
    int _4059 = ~_4043;
    int _4061 = _4059 + 1;
    int _4063 = _4061 + 1;
    float _4065 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4067 = log2(_4065);
    int _4069 = ~_4049;
    int _4071 = _4069 + 1;
    int _4073 = _4071 + 1;
    int _4075 = ~_4055;
    int _4077 = _4075 + 1;
    int _4079 = _4077 + 1;
    int _4081 = _4063 * as_type<int>(_3891);
    int _4083 = _4081 + _4053;
    int _4085 = ~_3983;
    int _4087 = _4085 + 1;
    int _4089 = _4087 + 1;
    float _4091 = float(uint(_3709));
    int _4093 = _4079 * as_type<int>(_3899);
    int _4095 = _4093 + _4083;
    int _4097 = abs(_2755);
    int _4099 = _4089 * as_type<int>(_3855);
    int _4101 = _4099 + _4057;
    int _4103 = abs(_3957);
    int _4105 = _4073 * as_type<int>(_3925);
    int _4107 = _4105 + _4041;
    int _4109 = abs(_2573);
    float _4111 = 1.0 / _4091;
    float _4113 = float(uint(_4009));
    int _4115 = ~_4109;
    int _4117 = _4115 + 1;
    int _4119 = _4117 + 1;
    int _4121 = ~_4097;
    int _4123 = _4121 + 1;
    int _4125 = _4123 + 1;
    int _4127 = _3293 * as_type<int>(_3967);
    int _4129 = _4127 + _4101;
    int _4131 = abs(_3719);
    int _4133 = _4095 * _4119;
    float _4135 = 1.0 / _4113;
    float _4137 = float(uint(_3739));
    int _4139 = _3743 * _4109;
    int _4141 = _4139 + _4133;
    int _4143 = abs(_2653);
    int _4145 = _4125 * as_type<int>(_3997);
    int _4147 = _4145 + _4047;
    int _4149 = abs(_2789);
    float _4151 = _4067 * _162;
    int _4153 = ~_4143;
    int _4155 = _4153 + 1;
    int _4157 = _4155 + 1;
    float _4159 = 1.0 / _4137;
    int _4161 = ~_4131;
    int _4163 = _4161 + 1;
    int _4165 = _4163 + 1;
    int _4167 = ~_4103;
    int _4169 = _4167 + 1;
    int _4171 = _4169 + 1;
    float _4173 = float(uint(_3943));
    int _4175 = _4165 * as_type<int>(_3933);
    int _4177 = _4175 + _4107;
    int _4179 = ~_4149;
    int _4181 = _4179 + 1;
    int _4183 = _4181 + 1;
    int _4185 = _4171 * as_type<int>(_3975);
    int _4187 = _4185 + _4129;
    bool _4189 = _1244 == 0;
    int _4191 = _4157 * _4177;
    int _4193 = abs(_3771);
    float _4195 = 1.0 / _4173;
    bool _4197 = !_4189;
    int _4199 = _4197 ? _3871 : (-1);
    int _4201 = _3763 * _4143;
    int _4203 = _4201 + _4191;
    int _4205 = ~_4193;
    int _4207 = _4205 + 1;
    int _4209 = _4207 + 1;
    int _4211 = _4183 * _4187;
    int _4213 = as_type<int>(_4135) + (-2);
    float _4215 = float(uint(_4203));
    int _4217 = _4199 * _4149;
    int _4219 = _4217 + _4211;
    int _4221 = as_type<int>(_4111) + (-2);
    int _4223 = _4209 * as_type<int>(_4005);
    int _4225 = _4223 + _4147;
    float _4227 = float(uint(_4141));
    float _4229 = as_type<float>(_4213) * _4215;
    float _4231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _4233 = as_type<int>(_4159) + (-2);
    float _4235 = as_type<float>(_4221) * _4227;
    float _4237 = float(uint(_4219));
    int _4239 = ~_3301;
    int _4241 = _4239 + 1;
    int _4243 = _4241 + 1;
    bool _4245 = _1258 == 0;
    float _4247 = trunc(_4235);
    float _4249 = precise::max(_4247, 0.0);
    uint _4251 = uint(_4249);
    int _4253 = as_type<int>(_4195) + (-2);
    float _4255 = as_type<float>(_4233) * _4237;
    bool _4257 = !_4245;
    int _4259 = _4257 ? _3905 : (-1);
    int _4261 = _4243 * _4225;
    int _4263 = ~_3709;
    int _4265 = _4263 + 1;
    int _4267 = ~_3739;
    int _4269 = _4267 + 1;
    float _4271 = trunc(_4229);
    float _4273 = precise::max(_4271, 0.0);
    uint _4275 = uint(_4273);
    int _4277 = _4259 * _3301;
    int _4279 = _4277 + _4261;
    float _4281 = _4231 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4283 = abs(_3709);
    float _4285 = _3445 * _3581;
    float _4287 = float(uint(_4279));
    float _4289 = fma(_4281, _2873, -0.5);
    float _4291 = trunc(_4255);
    float _4293 = precise::max(_4291, 0.0);
    uint _4295 = uint(_4293);
    int _4297 = ~_4009;
    int _4299 = _4297 + 1;
    int _4301 = _4265 * int(_4251);
    int _4303 = _4301 + _4141;
    float _4305 = as_type<float>(_4253) * _4287;
    float _4307 = float(uint(_4283));
    float _4309 = -_4285;
    float _4311 = fma(_4309, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3445);
    int _4313 = abs(_3739);
    int _4315 = _4299 * int(_4275);
    int _4317 = _4315 + _4203;
    float _4319 = trunc(_4305);
    float _4321 = precise::max(_4319, 0.0);
    uint _4323 = uint(_4321);
    float _4325 = float(uint(_4303));
    float _4327 = fma(_4311, _4311, _3659);
    int _4329 = ~_3943;
    int _4331 = _4329 + 1;
    float _4333 = float(uint(_4317));
    float _4335 = as_type<float>(_4221) * _4325;
    int _4337 = _4269 * int(_4295);
    int _4339 = _4337 + _4219;
    float _4341 = 1.0 / _4307;
    int _4343 = abs(_4009);
    float _4345 = as_type<float>(_4213) * _4333;
    float _4347 = float(uint(_4313));
    float _4349 = float(uint(_4339));
    float _4351 = float(uint(_4343));
    int _4353 = _4331 * int(_4323);
    int _4355 = _4353 + _4279;
    int _4357 = abs(_3943);
    float _4359 = as_type<float>(_4233) * _4349;
    float _4361 = 1.0 / _4351;
    int _4363 = as_type<int>(_4341) + (-2);
    float _4365 = float(uint(_4357));
    float _4367 = 1.0 / _4347;
    int _4369 = abs(_4141);
    float _4371 = float(uint(_4355));
    float _4373 = float(uint(_4369));
    int _4375 = abs(_4219);
    float _4377 = 1.0 / _4365;
    float _4379 = as_type<float>(_4253) * _4371;
    float _4381 = as_type<float>(_4363) * _4373;
    float _4383 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _4385 = abs(_4203);
    float _4387 = fma(_1491, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4383);
    float _4389 = exp2(_4151);
    int _4391 = as_type<int>(_4367) + (-2);
    float _4393 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4387);
    float _4395 = float(uint(_4375));
    int _4397 = as_type<int>(_4361) + (-2);
    float _4399 = float(uint(_4385));
    float _4401 = trunc(_4381);
    float _4403 = precise::max(_4401, 0.0);
    uint _4405 = uint(_4403);
    bool _4407 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4409 = isnan(1.0);
    bool _4411 = _4407 || _4409;
    bool _4413 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4415 = _4411 || _4413;
    float _4417 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4419 = 1.0 + _4417;
    float _4421 = as_type<float>(_4391) * _4395;
    int _4423 = abs(_4279);
    float _4425 = as_type<float>(_4397) * _4399;
    float _4427 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _4429 = as_type<int>(_4377) + (-2);
    float _4431 = 1.0 / _4419;
    float _4433 = float(uint(_4423));
    float _4435 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4437 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4427);
    float _4439 = -_4389;
    float _4441 = _4439 + 1.0;
    float _4443 = as_type<float>(_4429) * _4433;
    float _4445 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4435);
    float _4447 = trunc(_4335);
    float _4449 = precise::max(_4447, 0.0);
    uint _4451 = uint(_4449);
    float _4453 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3819);
    bool _4455 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4457 = isnan(0.0);
    bool _4459 = _4455 || _4457;
    bool _4461 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4463 = _4459 || _4461;
    float _4465 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _4467 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4437);
    int _4469 = ~_4283;
    int _4471 = _4469 + 1;
    float _4473 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3577);
    float _4475 = fma(_1491, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4465);
    float _4477 = trunc(_4421);
    float _4479 = precise::max(_4477, 0.0);
    uint _4481 = uint(_4479);
    float _4483 = _4463 ? _4441 : 0.0;
    int _4485 = _4471 * int(_4405);
    int _4487 = _4485 + _4369;
    int _4489 = ~_4313;
    int _4491 = _4489 + 1;
    float _4493 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4445);
    float _4495 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4475);
    float _4497 = _4285;
    if (_4415)
    {
        float _4499 = _4483 * _4431;
        _166 = _4499;
    }
    float _4501 = _166;
    int _4503 = ~_4343;
    int _4505 = _4503 + 1;
    float _4507 = trunc(_4425);
    float _4509 = precise::max(_4507, 0.0);
    uint _4511 = uint(_4509);
    int _4513 = int(_4251) + int(_4451);
    float _4515 = fma(_4473, _3459, _3623);
    int _4517 = ~_4357;
    int _4519 = _4517 + 1;
    float _4521 = -_3867;
    float _4523 = fma(_4453, _4289, _4521);
    float _4525 = float(uint(_4487));
    float _4527 = float(_3839);
    float _4529 = trunc(_4359);
    float _4531 = precise::max(_4529, 0.0);
    uint _4533 = uint(_4531);
    int _4535 = _4491 * int(_4481);
    int _4537 = _4535 + _4375;
    float _4539 = as_type<float>(_4363) * _4525;
    float _4541 = _4523 + 0.5;
    float _4543 = float(uint(_4537));
    float _4545 = trunc(_4443);
    float _4547 = precise::max(_4545, 0.0);
    uint _4549 = uint(_4547);
    int _4551 = ~_3709;
    int _4553 = _4551 + 1;
    float _4555 = as_type<float>(_4391) * _4543;
    float _4557 = trunc(_4345);
    float _4559 = precise::max(_4557, 0.0);
    uint _4561 = uint(_4559);
    float _4563 = trunc(_4379);
    float _4565 = precise::max(_4563, 0.0);
    uint _4567 = uint(_4565);
    int _4569 = _4505 * int(_4511);
    int _4571 = _4569 + _4385;
    float _4573 = float(uint(_4571));
    float _4575 = trunc(_4539);
    float _4577 = precise::max(_4575, 0.0);
    uint _4579 = uint(_4577);
    int _4581 = int(_4295) + int(_4533);
    int _4583 = _4519 * int(_4549);
    int _4585 = _4583 + _4423;
    float _4587 = as_type<float>(_4397) * _4573;
    int _4589 = int(_4275) + int(_4561);
    float _4591 = float(uint(_4585));
    float _4593 = trunc(_4587);
    float _4595 = precise::max(_4593, 0.0);
    uint _4597 = uint(_4595);
    int _4599 = int(_4323) + int(_4567);
    int _4601 = _4553 * _4513;
    int _4603 = _4601 + _4141;
    int _4605 = ~_4009;
    int _4607 = _4605 + 1;
    float _4609 = as_type<float>(_4429) * _4591;
    int _4611 = ~_3739;
    int _4613 = _4611 + 1;
    bool _4615 = uint(_4603) >= uint(_3709);
    float _4617 = trunc(_4555);
    float _4619 = precise::max(_4617, 0.0);
    uint _4621 = uint(_4619);
    int _4623 = ~_3943;
    int _4625 = _4623 + 1;
    int _4627 = _4607 * _4589;
    int _4629 = _4627 + _4203;
    int _4631 = int(_4405) + int(_4579);
    float _4633 = trunc(_4609);
    float _4635 = precise::max(_4633, 0.0);
    uint _4637 = uint(_4635);
    int _4639 = int(_4511) + int(_4597);
    int _4641 = _4613 * _4581;
    int _4643 = _4641 + _4219;
    bool _4645 = uint(_4629) >= uint(_4009);
    int _4647 = _4625 * _4599;
    int _4649 = _4647 + _4279;
    int _4651 = ~_4343;
    int _4653 = _4651 + 1;
    int _4655 = ~_4283;
    int _4657 = _4655 + 1;
    int _4659 = ~_4313;
    int _4661 = _4659 + 1;
    bool _4663 = !_4615;
    int _4665 = _4663 ? 0 : (-1);
    int _4667 = _4657 * _4631;
    int _4669 = _4667 + _4369;
    bool _4671 = uint(_4643) >= uint(_3739);
    float _4673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4675 = int(_4481) + int(_4621);
    int _4677 = int(_4549) + int(_4637);
    bool _4679 = !_4645;
    int _4681 = _4679 ? 0 : (-1);
    int _4683 = _4653 * _4639;
    int _4685 = _4683 + _4385;
    bool _4687 = uint(_4649) >= uint(_3943);
    int _4689 = _4661 * _4675;
    int _4691 = _4689 + _4375;
    int _4693 = ~_4357;
    int _4695 = _4693 + 1;
    float _4697 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _4699 = !_4671;
    int _4701 = _4699 ? 0 : (-1);
    bool _4703 = uint(_4669) >= uint(_4283);
    bool _4705 = !_4687;
    int _4707 = _4705 ? 0 : (-1);
    float _4709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4711 = uint(_4685) >= uint(_4343);
    bool _4713 = !_4703;
    int _4715 = _4713 ? 0 : (-1);
    int _4717 = _4695 * _4677;
    int _4719 = _4717 + _4423;
    int _4721 = ~_4513;
    int _4723 = _4721 + _4665;
    int _4725 = _4723 + 1;
    bool _4727 = uint(_4691) >= uint(_4313);
    int _4729 = ~_4581;
    int _4731 = _4729 + _4701;
    int _4733 = _4731 + 1;
    int _4735 = _3709 * _4725;
    int _4737 = _4735 + _4141;
    bool _4739 = !_4727;
    int _4741 = _4739 ? 0 : (-1);
    bool _4743 = _3709 == 0;
    bool _4745 = !_4711;
    int _4747 = _4745 ? 0 : (-1);
    float _4749 = _4709 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4751 = uint(_4719) >= uint(_4357);
    int _4753 = _3739 * _4733;
    int _4755 = _4753 + _4219;
    bool _4757 = !_4743;
    int _4759 = _4757 ? _4737 : (-1);
    float _4761 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    bool _4763 = _3739 == 0;
    float _4765 = fma(_4749, _1671, -0.5);
    int _4767 = ~_4589;
    int _4769 = _4767 + _4681;
    int _4771 = _4769 + 1;
    float _4773 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    bool _4775 = !_4763;
    int _4777 = _4775 ? _4755 : (-1);
    bool _4779 = _3709 == 0;
    int _4781 = _4009 * _4771;
    int _4783 = _4781 + _4203;
    int _4785 = _4141 ^ _3709;
    float _4787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4789 = _4203 ^ _4009;
    float _4791 = _4773 * _4697;
    uint _4793 = uint(int(uint(_4785) >> uint(31)));
    uint _4795 = uint(int(uint(_4789) >> uint(31)));
    int _4797 = ~_4599;
    int _4799 = _4797 + _4707;
    int _4801 = _4799 + 1;
    float _4803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _4805 = !_4751;
    int _4807 = _4805 ? 0 : (-1);
    int _4809 = ~_4715;
    int _4811 = _4631 + _4809;
    int _4813 = _4811 + 1;
    int _4815 = _3943 * _4801;
    int _4817 = _4815 + _4279;
    int _4819 = ~int(_4793);
    int _4821 = _4819 + 1;
    bool _4823 = _4009 == 0;
    int _4825 = ~_4747;
    int _4827 = _4639 + _4825;
    int _4829 = _4827 + 1;
    float _4831 = _2879 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _4833 = ~int(_4795);
    int _4835 = _4833 + 1;
    int _4837 = _4813 ^ _4821;
    float _4839 = _4831 * _4761;
    bool _4841 = !_4823;
    int _4843 = _4841 ? _4783 : (-1);
    float _4845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4847 = _3943 == 0;
    int _4849 = _4829 ^ _4835;
    out.m_75.x = _4791;
    out.m_75.y = _4839;
    int _4851 = ~_4821;
    int _4853 = _4851 + _4837;
    int _4855 = _4853 + 1;
    bool _4857 = !_4847;
    int _4859 = _4857 ? _4817 : (-1);
    bool _4861 = _4009 == 0;
    int _4863 = ~_4835;
    int _4865 = _4863 + _4849;
    int _4867 = _4865 + 1;
    bool _4869 = !_4779;
    int _4871 = _4869 ? _4855 : (-1);
    float _4873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _4875 = _3739 == 0;
    float _4877 = _4787 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4879 = _4219 ^ _3739;
    bool _4881 = !_4861;
    int _4883 = _4881 ? _4867 : (-1);
    float _4885 = fma(_4877, _1687, -0.5);
    bool _4887 = _3943 == 0;
    int _4889 = _4279 ^ _3943;
    float _4891 = _4845 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4893 = float(_4759);
    uint _4895 = uint(int(uint(_4889) >> uint(31)));
    float _4897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _4899 = ~_4807;
    int _4901 = _4677 + _4899;
    int _4903 = _4901 + 1;
    float _4905 = fma(_4749, _4893, _3603);
    int _4907 = ~int(_4895);
    int _4909 = _4907 + 1;
    float _4911 = fma(_4891, _1723, -0.5);
    float _4913 = float(_4843);
    float _4915 = fma(_4393, _4765, _4905);
    float _4917 = float(_4777);
    float _4919 = _4673 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4921 = _4903 ^ _4909;
    float _4923 = fma(_4877, _4913, _3767);
    float _4925 = float(_4859);
    float _4927 = _4803 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _4929 = fma(_4891, _4917, _3911);
    int _4931 = ~_4909;
    int _4933 = _4931 + _4921;
    int _4935 = _4933 + 1;
    float _4937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _4939 = uint(int(uint(_4879) >> uint(31)));
    float _4941 = fma(_4927, _2435, -0.5);
    float _4943 = float(_4871);
    float _4945 = fma(_4927, _4925, _3609);
    bool _4947 = !_4887;
    int _4949 = _4947 ? _4935 : (-1);
    float _4951 = fma(_4919, _2791, -0.5);
    int _4953 = ~_4741;
    int _4955 = _4675 + _4953;
    int _4957 = _4955 + 1;
    float _4959 = -_2895;
    float _4961 = fma(_4919, _4943, _4959);
    int _4963 = ~int(_4939);
    int _4965 = _4963 + 1;
    float _4967 = fma(_3497, _4941, _4945);
    float _4969 = float(_4883);
    float _4971 = fma(_4011, _4885, _4923);
    float _4973 = _4873 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4975 = float(_4949);
    float _4977 = _4897 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _4979 = _4957 ^ _4965;
    float _4981 = fma(_4495, _4911, _4929);
    float _4983 = fma(_4973, _2801, -0.5);
    float _4985 = -_3879;
    float _4987 = fma(_4973, _4969, _4985);
    int _4989 = ~_4965;
    int _4991 = _4989 + _4979;
    int _4993 = _4991 + 1;
    float _4995 = fma(_4977, _2817, -0.5);
    float _4997 = -_3613;
    float _4999 = fma(_4977, _4975, _4997);
    float _5001 = fma(_4467, _4951, _4961);
    bool _5003 = !_4875;
    int _5005 = _5003 ? _4993 : (-1);
    float _5007 = _4937 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5009 = fma(_3595, _4995, _4999);
    float _5011 = _5001 + 0.5;
    float _5013 = float(_5005);
    float _5015 = fma(_5007, _2815, -0.5);
    float _5017 = _5009 + 0.5;
    float _5019 = fma(_3617, _4983, _4987);
    float _5021 = in.m_77.x;
    float _5023 = in.m_77.y;
    float _5025 = in.m_77.z;
    float _5027 = -_3951;
    float _5029 = fma(_5007, _5013, _5027);
    float _5031 = _4915 + 0.5;
    float _5033 = _4515 + 0.5;
    float _5035 = _4981 + 0.5;
    float _5037 = fma(_4493, _5015, _5029);
    float _5039 = _4971 + 0.5;
    float _5041 = _5019 + 0.5;
    float _5043 = _4967 + 0.5;
    float _5045 = _5037 + 0.5;
    bool _5047 = !_3775;
    int _5049 = _5047 ? 0 : 1;
    out.m_79.x = _5033;
    out.m_79.y = _4541;
    bool _5051 = !_3779;
    int _5053 = _5051 ? 0 : 1;
    int _5055 = abs(_5049);
    out.m_81.x = _5031;
    out.m_81.y = _5011;
    out.m_81.z = _5039;
    out.m_81.w = _5041;
    int _5057 = abs(_5053);
    bool _5059 = !_3783;
    int _5061 = _5059 ? 0 : 1;
    out.m_83.x = _5035;
    out.m_83.y = _5045;
    float _5063 = float(_5055);
    out.m_85.x = _5043;
    out.m_85.y = _5017;
    float _5065 = as_type<float>(_4821);
    if (_3465)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5067 = -_3627;
    float _5069 = fma(_5067, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3109);
    float _5071 = -_3633;
    float _5073 = fma(_5071, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2887);
    float _5075 = _5063 * _4527;
    float _5077 = float(_3001);
    float _5079 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5081 = _5069 + _5079;
    float _5083 = float(_5057);
    float _5085 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5087 = _5073 + _5085;
    float _5089 = _5075 * (-2.0);
    float _5091 = _5081 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5093 = -_4285;
    float _5095 = fma(_5093, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3341);
    float _5097 = _5083 * _5077;
    float _5099 = _1491 + (-0.5);
    float _5101 = fma(_5087, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5091);
    float _5103 = fma(_5089, _5021, _5021);
    float _5105 = _1342 + _1501;
    float _5107 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5109 = _5095 + _5107;
    float _5111 = fma(_3805, _5089, _3805);
    float _5113 = fma(_5099, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5103);
    float _5115 = _5105 + (-1.0);
    float _5117 = _5097 * (-2.0);
    float _5119 = fma(_5109, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5101);
    float _5121 = fma(_5111, _4501, _5113);
    float _5123 = fma(_5115, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5125 = _1342 + (-0.5);
    float _5127 = fma(_5117, _5023, _5023);
    bool _5129 = _5119 >= 0.0;
    float _5131 = fma(_5123, _5117, _5123);
    int _5133 = abs(_5061);
    float _5135 = fma(_5125, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5127);
    float _5137 = _5121 * 0.15915493667125701904296875;
    float _5139 = sqrt(_4327);
    float _5141 = fma(_5131, _4501, _5135);
    float _5143 = float(_3383);
    float _5145 = _1491 + _1501;
    float _5147 = float(_5133);
    float _5149 = _5141 * 0.15915493667125701904296875;
    float _5151 = _5137 * 6.283185482025146484375;
    float _5153 = sin(_5151);
    float _5155 = _5117;
    float _5157 = _5087;
    float _5159 = _5073;
    if (_5129)
    {
        _5155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5161 = _5155;
    float _5163 = _5147 * _5143;
    int _5165 = as_type<int>(_5161);
    if (_5129)
    {
        out.m_49.x = 0.0;
    }
    float _5167 = _5145 + (-1.0);
    if (_5129)
    {
        float _5169 = _5161 * 5.0;
        _5165 = as_type<int>(_5169);
    }
    int _5171 = _5165;
    float _5173 = _5163 * (-2.0);
    float _5175 = _5137 * 6.283185482025146484375;
    float _5177 = cos(_5175);
    if (_5129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14158 = as_type<float>(_5171);
        out.gl_Position.z = _14158;
    }
    float _5179 = _5149 * 6.283185482025146484375;
    float _5181 = sin(_5179);
    if (_5129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5183 = -_3109;
    float _5185 = _5183 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5187 = -_2887;
    float _5189 = _5187 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5191 = -_3341;
    float _5193 = _5191 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5195 = fma(_5167, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5197 = _5185 * _5185;
    float _5199 = fma(_5173, _5025, _5025);
    float _5201 = _1501 + (-0.5);
    float _5203 = fma(_5195, _5173, _5195);
    float _5205 = fma(_5189, _5189, _5197);
    float _5207 = _5149 * 6.283185482025146484375;
    float _5209 = cos(_5207);
    float _5211 = fma(_5201, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5199);
    float _5213 = _3581 * _5139;
    float _5215 = fma(_5193, _5193, _5205);
    float _5217 = _5153 * _5181;
    float _5219 = fma(_5203, _4501, _5211);
    float _5221 = _634 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5223 = _5177 * _5181;
    float _5225 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5227 = rsqrt(_5215);
    float _5229 = _5219 * 0.15915493667125701904296875;
    float _5231 = _5213 * _5225;
    float _5233 = _5177 * _5209;
    float _5235 = _5229 * 6.283185482025146484375;
    float _5237 = sin(_5235);
    float _5239 = _5189 * _5227;
    float _5241 = _5193 * _5227;
    float _5243 = _5185 * _5227;
    float _5245 = in.m_87.x;
    float _5247 = in.m_87.y;
    float _5249 = in.m_87.z;
    float _5251 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5253 = _5239 * _5251;
    float _5255 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5257 = _5241 * _5255;
    float _5259 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5261 = _5243 * _5259;
    float _5263 = _5229 * 6.283185482025146484375;
    float _5265 = cos(_5263);
    float _5267 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5269 = -_5253;
    float _5271 = fma(_5241, _5267, _5269);
    float _5273 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5275 = -_5257;
    float _5277 = fma(_5243, _5273, _5275);
    float _5279 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5281 = -_5261;
    float _5283 = fma(_5239, _5279, _5281);
    float _5285 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5287 = _5271 * _5271;
    float _5289 = fma(_5237, _5233, _5217);
    float _5291 = fma(_5237, _5217, _5233);
    float _5293 = _5213 * _5285;
    float _5295 = fma(_5277, _5277, _5287);
    float _5297 = _5213 * _5221;
    float _5299 = fma(_5283, _5283, _5295);
    float _5301 = _5153 * _5209;
    float _5303 = _5177 * _5265;
    float _5305 = rsqrt(_5299);
    float _5307 = _5209 * _5265;
    float _5309 = _5153 * _5265;
    float _5311 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5247);
    float _5313 = _5181 * _5265;
    float _5315 = -_5223;
    float _5317 = fma(_5237, _5301, _5315);
    float _5319 = -_5301;
    float _5321 = fma(_5237, _5223, _5319);
    float _5323 = _5311 * _5293;
    float _5325 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5245);
    float _5327 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5249);
    float _5329 = _5303 * _5323;
    float _5331 = _5325 * _5297;
    float _5333 = _5327 * _5231;
    float _5335 = -_5323;
    float _5337 = _5237 * _5335;
    float _5339 = _5309 * _5323;
    float _5341 = _5277 * _5305;
    float _5343 = _5271 * _5305;
    float _5345 = fma(_5289, _5331, _5329);
    float _5347 = _5283 * _5305;
    float _5349 = _5243 * _5341;
    float _5351 = fma(_5307, _5331, _5337);
    float _5353 = fma(_5321, _5333, _5345);
    float _5355 = _5241 * _5343;
    float _5357 = -_5349;
    float _5359 = fma(_5239, _5343, _5357);
    float _5361 = fma(_5317, _5331, _5339);
    float _5363 = fma(_5313, _5333, _5351);
    float _5365 = -_5355;
    float _5367 = fma(_5243, _5347, _5365);
    float _5369 = _5359 * _5353;
    float _5371 = fma(_5291, _5333, _5361);
    float _5373 = _5239 * _5347;
    float _5375 = _5367 * _5353;
    float _5377 = fma(_5347, _5363, _5369);
    float _5379 = _5069 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5381 = -_5373;
    float _5383 = fma(_5241, _5341, _5381);
    float _5385 = fma(_5341, _5363, _5375);
    float _5387 = fma(_5241, _5371, _5377);
    float _5389 = fma(_5073, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5379);
    float _5391 = _5383 * _5353;
    float _5393 = fma(_5239, _5371, _5385);
    float _5395 = _3341 + _5387;
    float _5397 = fma(_5343, _5363, _5391);
    float _5399 = _2887 + _5393;
    float _5401 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5403 = _5395 + _5401;
    float _5405 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5407 = _5399 + _5405;
    float _5409 = _5403 * _5403;
    float _5411 = fma(_5407, _5407, _5409);
    float _5413 = fma(_5243, _5371, _5397);
    float _5415 = fma(_5095, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5389);
    float _5417 = sqrt(_5411);
    float _5419 = _3109 + _5413;
    bool _5421 = _5417 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5423 = _5389;
    float _5425 = _5413;
    float _5427 = _5371;
    if (!_5421)
    {
        _5423 = _5399;
    }
    float _5429 = _5423;
    float _5431 = _5429;
    if (!_5421)
    {
        _5425 = _5395;
    }
    float _5433 = _5425;
    float _5435 = _5433;
    if (!_5421)
    {
        _5427 = _5419;
    }
    float _5437 = _5427;
    bool _5439 = !_5421;
    float _5441 = _5437;
    if (!_5439)
    {
        float _5443 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5445 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5447 = _5417 + _5445;
        float _5449 = _5419 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5451 = rsqrt(_5411);
        float _5453 = _5447 * _5443;
        float _5455 = _5453 * 0.15915493667125701904296875;
        float _5457 = _5455 * 6.283185482025146484375;
        float _5459 = cos(_5457);
        float _5461 = _5455 * 6.283185482025146484375;
        float _5463 = sin(_5461);
        float _5465 = _5459 + (-1.0);
        float _5467 = _5465 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5469 = fma(_5463, _5449, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5471 = fma(_5419, _5459, _5467);
        float _5473 = _5451 * _5469;
        float _5475 = fma(_5407, _5473, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5477 = fma(_5403, _5473, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _5441 = _5471;
        _5431 = _5475;
        _5435 = _5477;
    }
    float _5479 = _5441;
    float _5481 = _5431;
    float _5483 = _5435;
    float _5485 = -_3109;
    float _5487 = _5485 + _5479;
    float _5489 = -_2887;
    float _5491 = _5489 + _5481;
    float _5493 = _5415 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5495 = _5069 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5497 = _5487 * _5487;
    float _5499 = -_3341;
    float _5501 = _5499 + _5483;
    float _5503 = 1.0 / _5493;
    float _5505 = fma(_5073, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5495);
    float _5507 = fma(_5491, _5491, _5497);
    float _5509 = fma(_5095, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5505);
    float _5511 = fma(_5501, _5501, _5507);
    bool _5513 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _5515 = isnan(0.5);
    bool _5517 = _5513 || _5515;
    bool _5519 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5521 = _5517 || _5519;
    float _5523 = _5509 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5525 = sqrt(_5511);
    bool _5527 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _5529 = isnan(0.5);
    bool _5531 = _5527 || _5529;
    bool _5533 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5535 = _5531 || _5533;
    float _5537 = _5523 + _5493;
    float _5539 = _5537 * _5503;
    float _5541 = _5539 * 0.5;
    float _5543 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5545 = fma(_5541, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5543);
    float _5547 = 1.0 / _5545;
    bool _5549 = _5525 > 0.0;
    bool _5551 = !_5549;
    float _5553 = _5481;
    float _5555 = _5483;
    float _5557 = _5479;
    float _5559 = _5511;
    if (!_5551)
    {
        float _5561 = _224 * _224;
        float _5563 = rsqrt(_5511);
        float _5565 = fma(_220, _220, _5561);
        float _5567 = fma(_226, _226, _5565);
        float _5569 = sqrt(_5567);
        float _5571 = _5491 * _5563;
        float _5573 = _5487 * _5563;
        float _5575 = _5501 * _5563;
        bool _5577 = _5569 > 0.0;
        bool _5579 = !_5577;
        if (!_5579)
        {
            float _5581 = rsqrt(_5567);
            float _5583 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5585 = _224 * _5581;
            float _5587 = _220 * _5581;
            float _5589 = _5573 * _5585;
            float _5591 = _226 * _5581;
            float _5593 = fma(_5571, _5587, _5589);
            float _5595 = _5583 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5597 = fma(_5575, _5591, _5593);
            float _5599 = _5597 * _5595;
            float _5601 = fma(_220, _5599, _5481);
            float _5603 = fma(_224, _5599, _5479);
            float _5605 = fma(_226, _5599, _5483);
            _5553 = _5601;
            _5555 = _5605;
            _5557 = _5603;
        }
    }
    float _5607 = _5553;
    float _5609 = _5555;
    float _5611 = _5557;
    float _5613 = -_3633;
    float _5615 = fma(_5613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5607);
    float _5617 = -_4285;
    float _5619 = fma(_5617, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5609);
    float _5621 = -_3627;
    float _5623 = fma(_5621, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5611);
    float _5625 = _5623;
    float _5627 = _5619;
    float _5629 = _5607;
    if (_5535)
    {
        _5559 = 1.0;
    }
    float _5631 = _5559;
    float _5633 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5635 = _5547 * _5633;
    float _5637 = _5631;
    if (_5521)
    {
        _4497 = _5615;
    }
    float _5639 = _4497;
    float _5641 = _5639;
    if (!_5521)
    {
        float _5643 = _5081 * _5081;
        float _5645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5647 = -_3341;
        float _5649 = _5647 + _5609;
        float _5651 = -_3109;
        float _5653 = _5651 + _5611;
        float _5655 = fma(_5087, _5087, _5643);
        float _5657 = -_2887;
        float _5659 = _5657 + _5607;
        float _5661 = fma(_5109, _5109, _5655);
        float _5663 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5665 = sqrt(_5661);
        float _5667 = 1.0 / _5213;
        float _5669 = _5663 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5671 = precise::min(_5665, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5673 = _5671 * _5645;
        float _5675 = _5673 * _5667;
        float _5677 = _5669 * _5675;
        float _5679 = _5649 * _5675;
        float _5681 = fma(_5653, _5677, _5069);
        float _5683 = fma(_5659, _5677, _5073);
        float _5685 = fma(_5669, _5679, _5095);
        _5625 = _5681;
        _5641 = _5683;
        _5627 = _5685;
        _5629 = _5659;
        _5157 = _5665;
    }
    float _5687 = _5625;
    float _5689 = _5641;
    float _5691 = _5627;
    float _5693 = _5629;
    float _5695 = _5157;
    float _5697 = _5693;
    float _5699 = _5695;
    if (!_5535)
    {
        float _5701 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5703 = _5701 * 0.15915493667125701904296875;
        float _5705 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5707 = _5703 * 6.283185482025146484375;
        float _5709 = cos(_5707);
        float _5711 = _5705 * 0.15915493667125701904296875;
        float _5713 = _5703 * 6.283185482025146484375;
        float _5715 = sin(_5713);
        float _5717 = 1.0 / _5709;
        float _5719 = _5711 * 6.283185482025146484375;
        float _5721 = cos(_5719);
        float _5723 = _5715 * _5717;
        float _5725 = _5711 * 6.283185482025146484375;
        float _5727 = sin(_5725);
        float _5729 = _5721 * _5723;
        float _5731 = 1.0 / _5729;
        float _5733 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5735 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5733;
        float _5737 = 1.0 / _5735;
        float _5739 = _5727 * _5731;
        float _5741 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5743 = fma(_5635, _5739, _5741);
        float _5745 = _5743 * _5737;
        float _5747 = precise::clamp(_5745, 0.0, 1.0);
        _5697 = _5703;
        _5699 = _5711;
        _5637 = _5747;
    }
    float _5749 = _5697;
    float _5751 = _5699;
    float _5753 = _5637;
    float _5755 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5757 = _5687 + _5755;
    float _5759 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5761 = _5689 + _5759;
    float _5763 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5765 = _5691 + _5763;
    float _5767 = _5757 * _5757;
    float _5769 = fma(_5761, _5761, _5767);
    float _5771 = fma(_5765, _5765, _5769);
    float _5773 = rsqrt(_5771);
    float _5775 = sqrt(_5771);
    float _5777 = _5773 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _5779 = _5761 * _5777;
    float _5781 = _5765 * _5777;
    float _5783 = _5779 * _5779;
    float _5785 = _5781 * _5781;
    float _5787 = _5783 + _5785;
    float _5789 = sqrt(_5787);
    bool _5791 = _5789 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5793 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5795 = _5789 + _5793;
    float _5797 = _5769;
    float _5799 = _5787;
    float _5801 = _5795;
    float _5803 = _5749;
    float _5805 = _5757;
    float _5807 = _5777;
    if (_5791)
    {
        float _5809 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5797 = _5809;
    }
    float _5811 = _5797;
    if (_5791)
    {
        float _5813 = rsqrt(_5787);
        _5799 = _5813;
    }
    float _5815 = _5799;
    float _5817 = _5815;
    if (_5791)
    {
        float _5819 = _5795 * _5811;
        _5801 = _5819;
    }
    float _5821 = _5801;
    if (_5791)
    {
        float _5823 = _5821 * 0.15915493667125701904296875;
        _5803 = _5823;
    }
    float _5825 = _5803;
    float _5827 = _5765;
    if (_5791)
    {
        float _5829 = _5825 * 6.283185482025146484375;
        float _5831 = sin(_5829);
        _5827 = _5831;
    }
    float _5833 = _5827;
    float _5835 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5837 = precise::max(0.0, _5835);
    float _5839 = _5751;
    if (_5791)
    {
        float _5841 = _5825 * 6.283185482025146484375;
        float _5843 = cos(_5841);
        _5839 = _5843;
    }
    float _5845 = _5839;
    float _5847 = -_5777;
    float _5849 = -_5837;
    float _5851 = fma(_5757, _5847, _5849);
    float _5853 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_5791)
    {
        float _5855 = _5851 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5805 = _5855;
    }
    float _5857 = _5805;
    float _5859 = fma(_5073, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _5861 = _5857;
    float _5863 = _5833;
    if (_5791)
    {
        float _5865 = fma(_5833, _5857, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5861 = _5865;
    }
    float _5867 = _5861;
    float _5869 = _5867;
    if (!_5791)
    {
        _5863 = _5779;
    }
    float _5871 = _5863;
    float _5873 = _5871;
    if (_5791)
    {
        float _5875 = _5845 + (-1.0);
        _5853 = _5875;
    }
    float _5877 = _5853;
    float _5879 = _5877;
    if (_5791)
    {
        float _5881 = _5815 * _5867;
        _5807 = _5881;
    }
    float _5883 = _5807;
    if (!_5791)
    {
        _5869 = _5851;
    }
    float _5885 = _5869;
    float _5887 = _5885;
    if (_5791)
    {
        float _5889 = _5877 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5159 = _5889;
    }
    float _5891 = _5159;
    float _5893 = _5891;
    if (_5791)
    {
        float _5895 = _5779 * _5883;
        _5873 = _5895;
    }
    float _5897 = _5873;
    if (!_5791)
    {
        _5879 = _5781;
    }
    float _5899 = _5879;
    float _5901 = _5899;
    if (_5791)
    {
        float _5903 = _5781 * _5883;
        _5901 = _5903;
    }
    float _5905 = _5901;
    if (!_5791)
    {
        _5817 = _5783;
    }
    float _5907 = _5817;
    float _5909 = _5907;
    if (_5791)
    {
        float _5911 = fma(_5851, _5845, _5891);
        _5887 = _5911;
    }
    float _5913 = _5887;
    if (_5791)
    {
        float _5915 = _5897 * _5897;
        _5909 = _5915;
    }
    float _5917 = _5909;
    if (!_5791)
    {
        _5893 = _5785;
    }
    float _5919 = _5893;
    float _5921 = _5919;
    if (_5791)
    {
        float _5923 = _5905 * _5905;
        _5921 = _5923;
    }
    float _5925 = _5921;
    float _5927 = fma(_5913, _5913, _5917);
    float _5929 = _5687 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _5931 = floor(_5859);
    float _5933 = _5927 + _5925;
    float _5935 = fma(_5689, (*spvDescriptorSet0.vp_c8)._m0[2].x, _5929);
    float _5937 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5939 = fma(_5775, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5937);
    float _5941 = precise::clamp(_5939, 0.0, 1.0);
    float _5943 = fma(_5691, (*spvDescriptorSet0.vp_c8)._m0[2].z, _5935);
    float _5945 = rsqrt(_5933);
    float _5947 = -_5941;
    float _5949 = _5947 + 1.0;
    float _5951 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _5953 = _5943 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _5955 = fma(_5095, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _5957 = _5687 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _5959 = _5953 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _5961 = abs(_5949);
    float _5963 = log2(_5961);
    float _5965 = _5687 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5967 = -_5931;
    float _5969 = _5859 + _5967;
    float _5971 = -_5959;
    float _5973 = fma(_5971, _5951, 1.0);
    float _5975 = _5687 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _5977 = fma(_5689, (*spvDescriptorSet0.vp_c8)._m0[1].x, _5965);
    float _5979 = fma(_5689, (*spvDescriptorSet0.vp_c8)._m0[3].x, _5957);
    float _5981 = _5945 * _5913;
    float _5983 = _5945 * _5897;
    float _5985 = fma(_5689, (*spvDescriptorSet0.vp_c8)._m0[0].x, _5975);
    float _5987 = fma(_5691, (*spvDescriptorSet0.vp_c8)._m0[1].z, _5977);
    float _5989 = _5945 * _5905;
    float _5991 = _5983 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5993 = fma(_5691, (*spvDescriptorSet0.vp_c8)._m0[0].z, _5985);
    float _5995 = _5987 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _5997 = fma(_5691, (*spvDescriptorSet0.vp_c8)._m0[3].z, _5979);
    float _5999 = -_5991;
    float _6001 = fma(_5981, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5999);
    float _6003 = _5993 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6005 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6007 = _5963 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6009 = -_5989;
    float _6011 = fma(_6009, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6001);
    float _6013 = _5997 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6015 = fma(_6003, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6005);
    float _6017 = exp2(_6007);
    float _6019 = fma(_6011, -0.5, 0.5);
    float _6021 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6023 = fma(_5953, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6015);
    float _6025 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6027 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6023);
    float _6029 = floor(_5955);
    float _6031 = fma(_6011, 0.5, 0.5);
    float _6033 = fma(_6003, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6021);
    float _6035 = fma(_6003, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6025);
    float _6037 = _5981 + 1.0;
    float _6039 = fma(_6031, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6041 = fma(_5953, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6033);
    float _6043 = fma(_5953, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6035);
    float _6045 = log2(_5973);
    float _6047 = fma(_6031, _6039, -0.212114393711090087890625);
    float _6049 = -_5981;
    float _6051 = fma(_6017, _6037, _6049);
    float _6053 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6041);
    float _6055 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6043);
    float _6057 = fma(_6031, _6047, 1.570728778839111328125);
    float _6059 = fma(_6051, 0.5, 0.5);
    float _6061 = 1.0 / _6027;
    float _6063 = -_6029;
    float _6065 = _5955 + _6063;
    float _6067 = sqrt(_6019);
    float _6069 = _6045 * 0.693147182464599609375;
    float2 _15568 = float2(_5969, _6065);
    float _6071 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_15568, float2(0.0), isnan(_15568)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_15568, float2(0.0), isnan(_15568)), level(0.0)).x;
    float _6073 = _6069 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6075 = _6053 * _6061;
    float _6077 = _6055 * _6061;
    float _6079 = fma(_6075, 0.5, 0.5);
    float _6081 = fma(_6077, -0.5, 0.5);
    float _6083 = _6067 * 0.636619746685028076171875;
    float3 _15596 = float3(_6079, _6081, _6073);
    float _6085 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_15596, float3(0.0), isnan(_15596)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_15596, float3(0.0), isnan(_15596)), level(0.0)).x;
    float3 _15607 = float3(_6079, _6081, _6073);
    float4 _6088 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_15607, float3(0.0), isnan(_15607)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_15607, float3(0.0), isnan(_15607)), level(0.0)).xyzw;
    float _6090 = _6088.x;
    float _6092 = _6088.y;
    float _6094 = _6088.z;
    float _6096 = _6088.w;
    float _6098 = -_6057;
    float _6100 = fma(_6083, _6098, 1.0);
    float2 _15628 = float2(_6100, _6059);
    float3 _6104 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_15628, float2(0.0), isnan(_15628)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_15628, float2(0.0), isnan(_15628)), level(0.0)).xyz;
    float _6106 = _6104.x;
    float _6108 = _6104.y;
    float _6110 = _6104.z;
    float _6112 = abs(_5635);
    float _6114 = log2(_6112);
    float _6116 = in.m_89.x;
    float _6118 = in.m_89.y;
    float _6120 = in.m_89.z;
    bool _6122 = _5247 != 0.0;
    bool _6124 = isnan(_5247);
    bool _6126 = _6122 || _6124;
    bool _6128 = isnan(0.0);
    bool _6130 = _6126 || _6128;
    float _6132 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6134 = in.m_91.x;
    float _6136 = in.m_91.y;
    float _6138 = in.m_91.z;
    float _6140 = in.m_91.w;
    bool _6142 = _5245 == 0.0;
    bool _6144 = !_6130;
    bool _6146 = _6142 && _6144;
    float _6148 = _5321 * _5383;
    bool _6150 = _5249 == 0.0;
    bool _6152 = _6150 && _6146;
    float _6154 = fma(_6003, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6132);
    bool _6156 = _5635 <= 8000.0;
    bool _6158 = isnan(_5635);
    bool _6160 = _6156 || _6158;
    bool _6162 = isnan(8000.0);
    bool _6164 = _6160 || _6162;
    float _6166 = float(_6164);
    float _6168 = fma(_5313, _5343, _6148);
    float _6170 = _6114 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6172 = fma(_5291, _5243, _6168);
    float _6174 = exp2(_6170);
    float _6176 = _6065;
    float _6178 = _6114;
    float _6180 = _6116;
    float _6182 = _6027;
    float _6184 = _6053;
    float _6186 = _6055;
    if (_6152)
    {
        _5065 = _6116;
    }
    float _6188 = _5065;
    float _6190 = _6188;
    if (_6152)
    {
        _3501 = _6118;
    }
    float _6192 = _3501;
    float _6194 = _6192;
    if (_6152)
    {
        _6176 = _6188;
    }
    float _6196 = _6176;
    float _6198 = _6196;
    if (!_6152)
    {
        _6190 = _6116;
    }
    float _6200 = _6190;
    if (_6152)
    {
        _6178 = _6192;
    }
    float _6202 = _6178;
    float _6204 = _6202;
    if (!_6152)
    {
        _6194 = _6118;
    }
    float _6206 = _6194;
    if (!_6152)
    {
        float _6208 = fma(_5245, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6200);
        _6198 = _6208;
    }
    float _6210 = _6198;
    if (_6152)
    {
        _6180 = _6120;
    }
    float _6212 = _6180;
    float _6214 = _6212;
    if (!_6152)
    {
        float _6216 = fma(_5249, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6120);
        _6214 = _6216;
    }
    float _6218 = _6214;
    if (!_6152)
    {
        float _6220 = fma(_5247, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6206);
        _6204 = _6220;
    }
    float _6222 = _6204;
    float _6224 = _6136 * _6120;
    float _6226 = _6138 * _6200;
    float _6228 = _6134 * _6206;
    float _6230 = fma(_6174, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6232 = precise::clamp(_6230, 0.0, 1.0);
    float _6234 = -_6224;
    float _6236 = fma(_6138, _6206, _6234);
    float _6238 = -_6226;
    float _6240 = fma(_6134, _6120, _6238);
    float _6242 = -_6228;
    float _6244 = fma(_6136, _6200, _6242);
    float _6246 = fma(_6232, -2.0, 3.0);
    float _6248 = _6232 * _6232;
    float _6250 = _6240 * _6140;
    float _6252 = _6236 * _6140;
    float _6254 = _6244 * _6140;
    float _6256 = _6248 * _6246;
    float _6258 = _5303 * _5383;
    float _6260 = _5289 * _5367;
    float _6262 = _5289 * _5383;
    float _6264 = _5289 * _5359;
    float _6266 = _5303 * _5367;
    float _6268 = _5303 * _5359;
    float _6270 = -_5237;
    float _6272 = fma(_6270, _5343, _6258);
    float _6274 = _5321 * _5367;
    float _6276 = _5321 * _5359;
    float _6278 = fma(_5307, _5343, _6262);
    float _6280 = -_5237;
    float _6282 = fma(_6280, _5341, _6266);
    float _6284 = -_5237;
    float _6286 = fma(_6284, _5347, _6268);
    float _6288 = -_6256;
    float _6290 = _6288 + 1.0;
    float _6292 = fma(_5307, _5341, _6260);
    float _6294 = fma(_5309, _5243, _6272);
    float _6296 = fma(_5307, _5347, _6264);
    float _6298 = fma(_5313, _5341, _6274);
    float _6300 = fma(_5313, _5347, _6276);
    float _6302 = fma(_5309, _5239, _6282);
    float _6304 = fma(_6290, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6256);
    float _6306 = fma(_5317, _5243, _6278);
    float _6308 = fma(_5309, _5241, _6286);
    float _6310 = fma(_5317, _5239, _6292);
    float _6312 = _6294 * _6136;
    float _6314 = _6294 * _6222;
    float _6316 = _6250 * _6294;
    float _6318 = fma(_5317, _5241, _6296);
    float _6320 = fma(_5291, _5239, _6298);
    float _6322 = fma(_5291, _5241, _6300);
    float _6324 = _6302 * _6136;
    float _6326 = _6302 * _6222;
    float _6328 = _6250 * _6302;
    float _6330 = _6250 * _6308;
    float _6332 = fma(_6306, _6134, _6312);
    float _6334 = fma(_6306, _6210, _6314);
    float _6336 = fma(_6252, _6306, _6316);
    float _6338 = _5963 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6340 = _6308 * _6136;
    float _6342 = fma(_6172, _6138, _6332);
    float _6344 = fma(_6310, _6134, _6324);
    float _6346 = in.m_93.x;
    float _6348 = fma(_6318, _6134, _6340);
    float _6350 = exp2(_6338);
    float _6352 = _6308 * _6222;
    float _6354 = _6166 * _6304;
    float _6356 = fma(_6320, _6138, _6344);
    float _6358 = fma(_6322, _6138, _6348);
    float _6360 = fma(_6310, _6210, _6326);
    float _6362 = fma(_6318, _6210, _6352);
    float _6364 = _6354 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6366 = fma(_6252, _6310, _6328);
    float _6368 = fma(_6252, _6318, _6330);
    float _6370 = fma(_6172, _6218, _6334);
    float _6372 = fma(_6320, _6218, _6360);
    float _6374 = fma(_6322, _6218, _6362);
    float _6376 = fma(_5953, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6154);
    float _6378 = fma(_6254, _6320, _6366);
    float _6380 = -_6350;
    float _6382 = _6380 + 1.0;
    float _6384 = fma(_6254, _6172, _6336);
    float _6386 = fma(_6254, _6322, _6368);
    float _6388 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6376);
    float _6390 = _6382 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6392 = _6027 * 0.5;
    float _6394 = _6053 + _6027;
    out.m_95.x = _6378;
    out.m_95.y = _6384;
    out.m_95.z = _6386;
    float _6396 = _6388 + _6027;
    float _6398 = fma(_6055, -0.5, _6392);
    float _6400 = _6394 * 0.5;
    float _6402 = _6396 * 0.5;
    out.m_97.x = _6356;
    out.m_97.y = _6342;
    out.m_97.z = _6358;
    bool _6404 = _5775 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6406 = isnan(_5775);
    bool _6408 = _6404 || _6406;
    bool _6410 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6412 = _6408 || _6410;
    out.m_99.x = _6400;
    out.m_99.y = _6398;
    out.m_99.z = _6402;
    out.m_99.w = _6027;
    out.m_101.x = _6372;
    out.m_101.y = _6370;
    out.m_101.z = _6374;
    out.gl_Position.x = _6053;
    out.gl_Position.y = _6055;
    out.gl_Position.z = _6388;
    out.gl_Position.w = _6027;
    float _6414 = _6386;
    float _6416 = _6384;
    if (!_6412)
    {
        _6414 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6418 = _6414;
    float _6420 = _6418;
    float _6422 = _6418;
    if (!_6412)
    {
        _6416 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6424 = _6416;
    float _6426 = _5753 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6428 = _6424;
    float _6430 = _6424;
    if (!_6412)
    {
        _6182 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6432 = _6182;
    float _6434 = _6432;
    float _6436 = _6432;
    if (!_6412)
    {
        _6184 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6438 = _6184;
    float _6440 = _6438;
    float _6442 = _6438;
    if (!_6412)
    {
        _6186 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6444 = _6186;
    float _6446 = -_6071;
    float _6448 = _6446 + 1.0;
    float _6450 = _6448 * _6364;
    float _6452 = precise::clamp(_6450, 0.0, 1.0);
    float _6454 = -_6452;
    float _6456 = fma(_6454, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6458 = _6456 * _6346;
    float _6460 = _6390 * _6085;
    float _6462 = -_6390;
    float _6464 = _6462 + 1.0;
    float _6466 = _6458 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6468 = _6096 * _6460;
    float _6470 = _6096 * _6464;
    out.m_103.x = _6466;
    float _6472 = _6110 * _6460;
    float _6474 = fma(_6106, _6468, _6090);
    float _6476 = fma(_6108, _6468, _6092);
    float _6478 = _6468;
    float _6480 = _6444;
    float _6482 = _6444;
    if (!_6412)
    {
        _6478 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6484 = _6478;
    float _6486 = fma(_6096, _6472, _6094);
    out.m_105.x = _6474;
    out.m_105.y = _6476;
    out.m_105.z = _6486;
    out.m_105.w = _6470;
    bool _6488 = !_6412;
    float _6490 = _6484;
    float _6492 = _6484;
    if (!_6488)
    {
        bool _6494 = _5775 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6496 = isnan(_5775);
        bool _6498 = _6494 || _6496;
        bool _6500 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6502 = _6498 || _6500;
        if (!_6502)
        {
            float _6504 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6506 = _5775 + _6504;
            float _6508 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6510 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6508;
            float _6512 = 1.0 / _6510;
            float _6514 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6516 = _6514 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6518 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6520 = _6518 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6522 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6524 = _6522 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6526 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6528 = _6526 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6530 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6532 = _6530 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6534 = _6506 * _6512;
            float _6536 = precise::clamp(_6534, 0.0, 1.0);
            float _6538 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6540 = _6538 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6542 = fma(_6536, _6520, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6544 = fma(_6536, _6540, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6546 = fma(_6536, _6516, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6548 = fma(_6536, _6524, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6550 = fma(_6536, _6528, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6552 = fma(_6536, _6532, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6430 = _6546;
            _6442 = _6550;
            _6422 = _6544;
            _6436 = _6548;
            _6492 = _6542;
            _6482 = _6552;
            _6554 = true;
        }
        else
        {
            bool _6556 = _5775 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6558 = isnan(_5775);
            bool _6560 = _6556 || _6558;
            bool _6562 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6564 = _6560 || _6562;
            if (!_6564)
            {
                _6434 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6566 = _6434;
            _6436 = _6566;
            if (!_6564)
            {
                _6440 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6568 = _6440;
            _6442 = _6568;
            if (!_6564)
            {
                _6480 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6570 = _6480;
            _6482 = _6570;
            if (!_6564)
            {
                _6420 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6572 = _6420;
            _6422 = _6572;
            if (!_6564)
            {
                _6428 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6574 = _6428;
            _6430 = _6574;
            if (!_6564)
            {
                _6490 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6576 = _6490;
            bool _6578 = !_6564;
            _6492 = _6576;
            if (!_6578)
            {
                bool _6580 = _5775 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6582 = isnan(_5775);
                bool _6584 = _6580 || _6582;
                bool _6586 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6588 = _6584 || _6586;
                if (!_6588)
                {
                    float _6590 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6592 = _5775 + _6590;
                    float _6594 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6596 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6594;
                    float _6598 = 1.0 / _6596;
                    float _6600 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6602 = _6600 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6604 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6606 = _6604 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6608 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6610 = _6608 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6612 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6614 = _6612 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6616 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6618 = _6616 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6620 = _6592 * _6598;
                    float _6622 = precise::clamp(_6620, 0.0, 1.0);
                    float _6624 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6626 = _6624 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6628 = fma(_6622, _6606, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6630 = fma(_6622, _6626, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6632 = fma(_6622, _6602, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6634 = fma(_6622, _6610, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6636 = fma(_6622, _6614, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6638 = fma(_6622, _6618, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6430 = _6632;
                    _6442 = _6636;
                    _6422 = _6630;
                    _6436 = _6634;
                    _6492 = _6628;
                    _6482 = _6638;
                    _6554 = true;
                }
                else
                {
                    _6430 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6442 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6422 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6436 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6492 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6482 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6554 = false;
    float _6640 = _6430;
    float _6642 = _6442;
    float _6644 = _6422;
    float _6646 = _6436;
    float _6648 = _6492;
    float _6650 = _6482;
    float _6652 = fma(_6370, -0.5, 0.5);
    float _6654 = precise::clamp(_6652, 0.0, 1.0);
    float _6656 = -_6640;
    float _6658 = _6642 + _6656;
    float _6660 = _6426 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6662 = -_6644;
    float _6664 = _6646 + _6662;
    float _6666 = fma(_6654, _6658, _6640);
    out.m_107.x = 0.0;
    float _6668 = -_6648;
    float _6670 = _6650 + _6668;
    float _6672 = fma(_6654, _6664, _6644);
    float _6674 = _6666 * 0.586610972881317138671875;
    out.m_49.x = _6660;
    bool _6676 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6678 = fma(_6654, _6670, _6648);
    float _6680 = fma(_6672, 0.298911988735198974609375, _6674);
    bool _6682 = _5753 > 0.0;
    bool _6684 = isnan(_5753);
    bool _6686 = _6682 || _6684;
    bool _6688 = isnan(0.0);
    bool _6690 = _6686 || _6688;
    float _6692 = fma(_6678, 0.114477999508380889892578125, _6680);
    float _6694 = -_6692;
    float _6696 = _6672 + _6694;
    float _6698 = -_6692;
    float _6700 = _6666 + _6698;
    float _6702 = -_6692;
    float _6704 = _6678 + _6702;
    float _6706 = fma(_6696, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6692);
    float _6708 = fma(_6700, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6692);
    float _6710 = fma(_6704, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6692);
    bool _6712 = !_6676;
    if (!_6712)
    {
        float _6714 = -_5687;
        float _6716 = _6714 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6718 = -_5689;
        float _6720 = _6718 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6722 = -_5691;
        float _6724 = _6722 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6726 = _6716 * _6716;
        float _6728 = fma(_6720, _6720, _6726);
        float _6730 = fma(_6724, _6724, _6728);
        float _6732 = sqrt(_6730);
        float _6734 = rsqrt(_6730);
        float _6736 = -_6732;
        float _6738 = _6736 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6740 = _6738 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6742 = precise::clamp(_6740, 0.0, 1.0);
        float _6744 = _6720 * _6734;
        float _6746 = _6716 * _6734;
        float _6748 = abs(_6742);
        float _6750 = log2(_6748);
        float _6752 = _6724 * _6734;
        float _6754 = _6744 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6756 = _6370 * _6746;
        float _6758 = -_6746;
        float _6760 = -_6754;
        float _6762 = fma(_6758, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6760);
        float _6764 = fma(_6372, _6744, _6756);
        float _6766 = -_6752;
        float _6768 = fma(_6766, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6762);
        float _6770 = fma(_6374, _6752, _6764);
        float _6772 = precise::clamp(_6770, 0.0, 1.0);
        float _6774 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6776 = _6768 + _6774;
        float _6778 = _6750 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6780 = _6776 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6782 = precise::clamp(_6780, 0.0, 1.0);
        float _6784 = exp2(_6778);
        float _6786 = _6784 * _6782;
        float _6788 = _6772 * _6786;
        float _6790 = _6788 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6792 = _6788 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6794 = _6788 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _6790;
        out.m_107.y = _6792;
        out.m_107.z = _6794;
    }
    out.m_109.x = _6706;
    out.m_109.y = _6708;
    out.m_109.z = _6710;
    if (_6690)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _6796 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6796;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

