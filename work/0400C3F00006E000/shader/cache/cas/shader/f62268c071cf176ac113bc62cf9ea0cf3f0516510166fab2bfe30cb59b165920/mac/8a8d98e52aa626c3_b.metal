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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_69 [[user(locn1)]];
    float4 m_83 [[user(locn2)]];
    float4 m_103 [[user(locn3)]];
    float4 m_111 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_77 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 m_99 [[user(locn13)]];
    float4 m_95 [[user(locn14)]];
    float4 m_109 [[user(locn15)]];
    float4 m_105 [[user(locn16)]];
    float4 m_107 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_101 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_81 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_91 [[attribute(8)]];
    float4 m_89 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
    float4 m_93 [[attribute(12)]];
    float4 m_73 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6646 = false;
    bool _5727 = false;
    bool _1092 = false;
    bool _768 = false;
    bool _626 = false;
    bool _472 = false;
    bool _250 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_48.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (!_134)
    {
        out.m_51.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _138 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6945 = as_type<float>(_146);
        out.gl_Position.z = _6945;
    }
    if (!_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_53.w;
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
        float _170 = float(_130);
        _166 = _170;
    }
    float _172 = _166;
    bool _174 = _164 >= _172;
    bool _176 = !_160;
    bool _178 = _174 || _176;
    if (_178)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _180 = _140;
    if (_178)
    {
        out.m_51.x = 0.0;
    }
    if (_178)
    {
        float _182 = _180 * 5.0;
        _148 = as_type<int>(_182);
    }
    int _184 = _148;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7014 = as_type<float>(_184);
        out.gl_Position.z = _7014;
    }
    if (_178)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _186 = in.m_55.x;
    float _188 = in.m_55.y;
    float _190 = in.m_55.z;
    bool _192 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _194 = in.m_57.x;
    float _196 = in.m_57.y;
    float _198 = in.m_57.z;
    float _200 = in.m_59.x;
    float _202 = in.m_59.y;
    float _204 = in.m_59.z;
    float _206 = in.m_61.x;
    float _208 = in.m_61.y;
    float _210 = in.m_61.z;
    float _212 = _188 * _196;
    float _214 = _188 * _202;
    float _216 = fma(_186, _194, _212);
    float _218 = _188 * _208;
    float _220 = fma(_186, _200, _214);
    float _222 = fma(_190, _198, _216);
    float _224 = fma(_186, _206, _218);
    float _226 = fma(_190, _204, _220);
    float _228 = fma(_190, _210, _224);
    bool _230 = !_192;
    float _248;
    if (!_230)
    {
        float _232 = in.m_63.x;
        float _234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _236 = _232 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _238 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _240 = _238 * _234;
        float _242 = floor(_240);
        float _244 = -_242;
        float _246 = _240 + _244;
        _248 = _246;
        _250 = true;
    }
    else
    {
        float _252 = float(_130);
        float _254 = 1.0 / _252;
        float _256 = _164 * _254;
        _248 = _256;
    }
    _250 = false;
    float _258 = _248;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _262 = _258 + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _266 = _258 + _264;
    bool _268 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _270 = isnan(_258);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _286 = _258 + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = 1.0 / _282;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _300 = 1.0 / _294;
    float _302 = 1.0 / _290;
    float _304 = _262 * _296;
    bool _306 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _308 = isnan(_258);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -_278;
    float _320 = _318 + 1.0;
    float _322 = _316 * _320;
    float _324 = _266 * _300;
    bool _326 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _328 = isnan(_258);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _338;
    bool _342 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _344 = isnan(_258);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = -_316;
    float _360 = _358 + 1.0;
    float _362 = -_336;
    float _364 = _362 + 1.0;
    float _366 = _286 * _302;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _372;
    float _376 = _352 * _364;
    float _378 = fma(_340, _366, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _380 = fma(_370, _366, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _382 = fma(_374, _366, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _384 = _336 * _360;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _390 = _380 * _376;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = _382 * _376;
    float _398 = -_352;
    float _400 = _398 + 1.0;
    float _402 = _378 * _376;
    float _404 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[143].x, _396);
    float _406 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[143].y, _390);
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _410;
    float _414 = fma(_356, _324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = fma(_388, _324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_394, _324, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _424;
    float _428 = fma(_414, _384, _404);
    float _430 = fma(_412, _304, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _432 = fma(_422, _304, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _434 = fma(_426, _304, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _436 = fma(_416, _384, _406);
    float _438 = fma(_418, _384, _408);
    float _440 = fma(_430, _322, _428);
    float _442 = fma(_432, _322, _436);
    float _444 = fma(_434, _322, _438);
    float _446 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[146].x, _440);
    float _448 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[146].y, _442);
    float _450 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[146].z, _444);
    bool _452 = !_298;
    float _470;
    if (!_452)
    {
        float _454 = in.m_63.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_130);
        float _476 = 1.0 / _474;
        float _478 = _164 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _484 = _480 + _482;
    float _486 = in.m_65.x;
    float _488 = in.m_65.y;
    float _490 = in.m_65.z;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _496 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _498 = isnan(_480);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _512 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _514 = isnan(_480);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _524;
    bool _528 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _530 = isnan(_480);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = 1.0 / _494;
    float _542 = -_506;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _480 + _546;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _552 = _522 * _544;
    float _554 = -_522;
    float _556 = _554 + 1.0;
    float _558 = 1.0 / _510;
    float _560 = _526 * _540;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _566 = fma(_560, _484, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _568 = _564 * _558;
    float _570 = -_538;
    float _572 = _570 + 1.0;
    float _574 = _566 * _552;
    float _576 = fma(_568, _548, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _578 = _506 * _572;
    float _580 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[115].x, _574);
    float _582 = _450 * _490;
    float _584 = fma(_576, _578, _580);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _590 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[117].x, _584);
    float _592 = _448 * _488;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _596 = _586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _598 = _588 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = _590 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _602 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _446 * _486;
    out.m_67.x = _596;
    out.m_67.y = _598;
    out.m_67.z = _602;
    out.m_67.w = _600;
    bool _606 = !_550;
    float _624;
    if (!_606)
    {
        float _608 = in.m_63.x;
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _612 = _608 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[11].w, _164);
        float _616 = _614 * _610;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _624 = _622;
        _626 = true;
    }
    else
    {
        float _628 = float(_130);
        float _630 = 1.0 / _628;
        float _632 = _164 * _630;
        _624 = _632;
    }
    _626 = false;
    float _634 = _624;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _638 = _634 + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _644 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _646 = isnan(_634);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _660 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _662 = isnan(_634);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _672;
    bool _676 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _678 = isnan(_634);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = 1.0 / _642;
    float _690 = -_654;
    float _692 = _690 + 1.0;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _696 = _634 + _694;
    bool _698 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _700 = _670 * _692;
    float _702 = -_670;
    float _704 = _702 + 1.0;
    float _706 = 1.0 / _658;
    float _708 = _674 * _688;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _714 = fma(_708, _638, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _716 = -_686;
    float _718 = _716 + 1.0;
    float _720 = _712 * _706;
    float _722 = _714 * _700;
    float _724 = _654 * _718;
    float _726 = fma(_720, _696, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _728 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[131].x, _722);
    float _730 = fma(_726, _724, _728);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _738 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[133].x, _730);
    float _740 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = _734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _738 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.x = _740;
    out.m_69.y = _742;
    out.m_69.z = _744;
    out.m_69.w = _746;
    bool _748 = !_698;
    float _766;
    if (!_748)
    {
        float _750 = in.m_63.x;
        float _752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _754 = _750 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _756 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[14].x, _164);
        float _758 = _756 * _752;
        float _760 = floor(_758);
        float _762 = -_760;
        float _764 = _758 + _762;
        _766 = _764;
        _768 = true;
    }
    else
    {
        float _770 = float(_130);
        float _772 = 1.0 / _770;
        float _774 = _164 * _772;
        _766 = _774;
    }
    _768 = false;
    float _776 = _766;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _780 = _776 + _778;
    bool _782 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _784 = isnan(_776);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _798;
    bool _802 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _804 = isnan(_776);
    bool _806 = _802 || _804;
    bool _808 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = -_792;
    float _816 = _814 + 1.0;
    bool _818 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _820 = isnan(_776);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = 1.0 / _796;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _836 = _812 * _816;
    float _838 = -_828;
    float _840 = _838 + 1.0;
    float _842 = 1.0 / _834;
    bool _844 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _846 = _800 * _830;
    float _848 = -_812;
    float _850 = _848 + 1.0;
    bool _852 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _854 = isnan(_776);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = fma(_846, _780, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _866 = _828 * _850;
    bool _868 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _870 = isnan(_776);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = _862 * _840;
    float _882 = -_862;
    float _884 = _882 + 1.0;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _890 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _892 = isnan(_776);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    float _902 = _878 * _884;
    float _904 = -_878;
    float _906 = _904 + 1.0;
    bool _908 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _910 = isnan(_776);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = 1.0 / _888;
    float _922 = -_900;
    float _924 = _922 + 1.0;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _930 = _900 * _906;
    float _932 = _918 * _924;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _938 = -_918;
    float _940 = _938 + 1.0;
    float _942 = 1.0 / _928;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _948 = _864 * _932;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _956 = _776 + _954;
    float _958 = _946 * _842;
    float _960 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[159].x, _948);
    float _962 = 1.0 / _936;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _964;
    float _968 = fma(_958, _956, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _972 = _970 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _976 = _776 + _974;
    float _978 = _966 * _920;
    float _980 = fma(_968, _930, _960);
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _984 = _776 + _982;
    float _986 = 1.0 / _952;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _992 = fma(_978, _976, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _994 = _990 * _942;
    bool _996 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _998 = isnan(_776);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1004 = _1000 || _1002;
    int _1006 = _1004 ? 1065353216 : 0;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1008;
    float _1012 = 1.0 / _972;
    float _1014 = fma(_992, _902, _980);
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1020 = _1010 * _962;
    float _1022 = fma(_994, _984, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1026 = _776 + _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1030 = _776 + _1028;
    float _1032 = _1018 * _986;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1034;
    float _1038 = fma(_1020, _1026, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1040 = fma(_1022, _880, _1014);
    float _1042 = fma(_1032, _1030, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1044 = -as_type<float>(_1006);
    float _1046 = _1044 + 1.0;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1050 = _776 + _1048;
    float _1052 = fma(_1038, _866, _1040);
    float _1054 = _1036 * _1012;
    float _1056 = _792 * _1046;
    float _1058 = fma(_1042, _836, _1052);
    float _1060 = fma(_1054, _1050, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1062 = fma(_1060, _1056, _1058);
    float _1064 = fma(as_type<float>(_1006), (*spvDescriptorSet0.vp_c9)._m0[166].x, _1062);
    out.m_71.x = _1064;
    bool _1066 = !_844;
    float _1068 = _836;
    int _1070 = _1006;
    int _1072 = as_type<int>(_1056);
    float _1090;
    if (!_1066)
    {
        float _1074 = in.m_63.x;
        float _1076 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1078 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[14].y, _164);
        float _1082 = _1080 * _1076;
        float _1084 = floor(_1082);
        float _1086 = -_1084;
        float _1088 = _1082 + _1086;
        _1090 = _1088;
        _1092 = true;
    }
    else
    {
        float _1094 = float(_130);
        float _1096 = 1.0 / _1094;
        float _1098 = _164 * _1096;
        _1090 = _1098;
    }
    _1092 = false;
    float _1100 = _1090;
    float _1102 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1104 = int(_1102);
    float _1106 = in.m_73.x;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1110 = _1108 != 0;
    float _1112 = in.m_63.y;
    float _1114 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1116 = int(_1114);
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1120 = _1118 != 0;
    float _1122 = 0.0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1110)
    {
        _1122 = 1.0;
    }
    float _1126 = _1122;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1130 = _1128 != 0;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1134 = _1132 != 0;
    float _1136 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1138 = int(_1136);
    float _1140 = float(_1104);
    float _1142 = 0.0;
    float _1144 = _1126;
    bool _1146 = _1130;
    bool _1148 = _1134;
    if (_1110)
    {
        _1142 = 1.0;
    }
    float _1150 = _1142;
    float _1152 = 0.0;
    float _1154 = _1150;
    if (_1110)
    {
        _1152 = 1.0;
    }
    float _1156 = _1152;
    int _1158 = 0;
    float _1160 = _1156;
    if (_1110)
    {
        _1158 = 0;
    }
    int _1162 = _1158;
    float _1164 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1166 = int(_1164);
    float _1168 = float(_1116);
    int _1170 = _1162;
    if (_1110)
    {
        _1124 = 0;
    }
    int _1172 = _1124;
    int _1174 = _1172;
    float _1176 = _1106;
    if (!_1120)
    {
        _1068 = _1106;
    }
    float _1178 = _1068;
    float _1180 = _1178;
    if (_1130)
    {
        float _1182 = -_1106;
        float _1184 = _1182 + 1.0;
        _1070 = as_type<int>(_1184);
    }
    int _1186 = _1070;
    if (_1134)
    {
        float _1188 = -_1106;
        float _1190 = _1188 + 1.0;
        _1072 = as_type<int>(_1190);
    }
    int _1192 = _1072;
    bool _1194 = _1112 > 0.5;
    float _1196 = 1.0 / _1140;
    float _1198 = float(_1138);
    float _1200 = 0.0;
    if (!_1130)
    {
        _1200 = _1106;
    }
    float _1202 = _1200;
    float _1204 = 0.0;
    float _1206 = _1202;
    if (!_1134)
    {
        _1204 = _1106;
    }
    float _1208 = _1204;
    float _1210 = _1208;
    if (_1130)
    {
        float _1212 = _1194 ? as_type<float>(_1186) : _1106;
        _1206 = _1212;
    }
    float _1214 = _1206;
    float _1216 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1218 = int(_1216);
    float _1220 = float(uint(_1166));
    if (_1134)
    {
        float _1222 = _1194 ? as_type<float>(_1192) : _1106;
        _1210 = _1222;
    }
    float _1224 = _1210;
    int _1226 = 0;
    if (_1110)
    {
        _1226 = as_type<int>(_1112);
    }
    int _1228 = _1226;
    float _1230 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1232 = int(_1230);
    float _1234 = _1196 * _164;
    float _1236 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1238 = int(_1236);
    float _1240 = float(uint(_1218));
    float _1242 = 1.0 / _1168;
    float _1244 = float(_1232);
    float _1246 = 1.0 / _1198;
    float _1248 = float(uint(_1238));
    float _1250 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1252 = int(_1250);
    float _1254 = _1242 * _164;
    float _1256 = 1.0 / _1220;
    float _1258 = _1246 * _164;
    float _1260 = 1.0 / _1240;
    float _1262 = float(uint(_1252));
    float _1264 = trunc(_1234);
    int _1266 = int(_1264);
    float _1268 = _1240;
    int _1270 = _1228;
    if (_1110)
    {
        float _1272 = in.m_63.x;
        _1268 = _1272;
    }
    float _1274 = _1268;
    int _1276 = as_type<int>(_1256) + (-2);
    float _1278 = 1.0 / _1244;
    int _1280 = as_type<int>(_1260) + (-2);
    float _1282 = 1.0 / _1248;
    float _1284 = float(uint(_1266));
    float _1286 = as_type<float>(_1280) * _1284;
    float _1288 = trunc(_1254);
    int _1290 = int(_1288);
    float _1292 = _1278 * _164;
    float _1294 = trunc(_1258);
    int _1296 = int(_1294);
    int _1298 = as_type<int>(_1282) + (-2);
    float _1300 = 1.0 / _1262;
    float _1302 = float(uint(_1290));
    float _1304 = as_type<float>(_1298) * _1302;
    float _1306 = trunc(_1292);
    int _1308 = int(_1306);
    float _1310 = _1262;
    int _1312 = as_type<int>(_1304);
    if (_1110)
    {
        float _1314 = in.m_63.z;
        _1310 = _1314;
    }
    float _1316 = _1310;
    float _1318 = float(uint(_1296));
    float _1320 = as_type<float>(_1276) * _1318;
    float _1322 = trunc(_1286);
    float _1324 = precise::max(_1322, 0.0);
    uint _1327 = uint(_1324);
    float _1329 = trunc(_1304);
    float _1331 = precise::max(_1329, 0.0);
    uint _1333 = uint(_1331);
    float _1335 = trunc(_1320);
    float _1337 = precise::max(_1335, 0.0);
    uint _1339 = uint(_1337);
    float _1341 = _1274;
    if (_1110)
    {
        _1312 = as_type<int>(_1274);
    }
    int _1343 = _1312;
    int _1345 = 0;
    float _1347 = as_type<float>(_1343);
    float _1349 = _1316;
    if (_1110)
    {
        _1345 = as_type<int>(_1316);
    }
    int _1351 = _1345;
    int _1353 = 0;
    int _1355 = _1351;
    if (_1110)
    {
        _1353 = _1343;
    }
    int _1357 = _1353;
    int _1359 = int(_1130);
    int _1361 = _1120 ? 2 : 0;
    int _1363 = _1359 | _1361;
    int _1365 = _1134 ? 4 : 0;
    int _1367 = _1363 | _1365;
    int _1369 = _1110 ? 8 : 0;
    int _1371 = _1367 | _1369;
    int _1373 = false ? 16 : 0;
    int _1375 = _1371 | _1373;
    int _1377 = _1194 ? 32 : 0;
    int _1379 = _1375 | _1377;
    int _1381 = false ? 64 : 0;
    int _1383 = _1379 | _1381;
    int _1385 = _1383 & 32;
    float _1387 = as_type<float>(_1385);
    int _1389 = _1357;
    if (_1110)
    {
        _1387 = as_type<float>(_1343);
    }
    float _1391 = _1387;
    float _1393 = _1391;
    if (!_1110)
    {
        float _1395 = in.m_63.x;
        float _1397 = _1112 * 3.1415927410125732421875;
        float _1399 = in.m_63.z;
        float _1401 = _1397 * 0.15915493667125701904296875;
        float _1403 = _1401 * 6.283185482025146484375;
        float _1405 = sin(_1403);
        float _1407 = _1395 * 3.1415927410125732421875;
        float _1409 = _1407 * 0.15915493667125701904296875;
        float _1411 = _1399 * 3.1415927410125732421875;
        float _1413 = _1411 * 0.15915493667125701904296875;
        float _1415 = _1409 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = _1413 * 6.283185482025146484375;
        float _1421 = sin(_1419);
        _1393 = _1399;
        _1160 = 5.839270114898681640625;
        _1341 = _1395;
        _1144 = 7.345489978790283203125;
        _1347 = _1112;
        _1154 = 1.2345600128173828125;
        _1170 = 1;
        _1174 = 2;
        _1349 = _1399;
        _1270 = as_type<int>(_1405);
        _1389 = as_type<int>(_1417);
        _1355 = as_type<int>(_1421);
    }
    float _1423 = _1393;
    float _1425 = _1160;
    float _1427 = _1341;
    float _1429 = _1144;
    float _1431 = _1347;
    float _1433 = _1154;
    int _1435 = _1170;
    int _1437 = _1174;
    float _1439 = _1349;
    int _1441 = _1270;
    int _1443 = _1389;
    int _1445 = _1355;
    int _1447 = ~_1166;
    int _1449 = _1447 + 1;
    float _1451 = _1012;
    if (_1120)
    {
        float _1453 = in.m_63.x;
        _1451 = _1453;
    }
    float _1455 = _1451;
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1459 = _1457 != 0;
    float _1461 = _1423 * _1425;
    int _1463 = ~_1238;
    int _1465 = _1463 + 1;
    int _1467 = _1449 * int(_1339);
    int _1469 = _1467 + _1296;
    int _1471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1473 = _1471 != 0;
    float _1475 = _1427 * _1429;
    float _1477 = _1431 * _1433;
    int _1479 = as_type<int>(_1300) + (-2);
    float _1481 = floor(_1461);
    float _1483 = float(uint(_1469));
    int _1485 = _1465 * int(_1333);
    int _1487 = _1485 + _1290;
    float _1489 = float(uint(_1308));
    float _1491 = _1431 * _1429;
    float _1493 = _1423;
    if (_1459)
    {
        float _1495 = in.m_63.z;
        _1493 = _1495;
    }
    float _1497 = _1493;
    int _1499 = ~_1218;
    int _1501 = _1499 + 1;
    float _1503 = as_type<float>(_1276) * _1483;
    float _1505 = float(uint(_1487));
    float _1507 = floor(_1475);
    int _1509 = 0;
    float _1511 = _1503;
    if (_1473)
    {
        float _1513 = -_1106;
        float _1515 = _1513 + 1.0;
        _1509 = as_type<int>(_1515);
    }
    int _1517 = _1509;
    int _1519 = _1501 * int(_1327);
    int _1521 = _1519 + _1266;
    int _1523 = 0;
    if (_1459)
    {
        float _1525 = -_1106;
        float _1527 = _1525 + 1.0;
        _1523 = as_type<int>(_1527);
    }
    int _1529 = _1523;
    float _1531 = as_type<float>(_1298) * _1505;
    int _1533 = ~_1166;
    int _1535 = _1533 + 1;
    bool _1537 = _1435 != 1;
    float _1539 = _1455;
    if (_1120)
    {
        bool _1541 = _1455 > 0.5;
        _1146 = _1541;
    }
    bool _1543 = _1146;
    float _1545 = floor(_1477);
    if (!_1473)
    {
        _1539 = _1106;
    }
    float _1547 = _1539;
    bool _1549 = _1437 != 2;
    float _1551 = _1547;
    if (_1473)
    {
        float _1553 = _1194 ? as_type<float>(_1517) : _1106;
        _1551 = _1553;
    }
    float _1555 = _1551;
    float _1557 = _1112 * 2.0;
    float _1559 = float(uint(_1521));
    float _1561 = in.m_59.w;
    int _1563 = ~_1218;
    int _1565 = _1563 + 1;
    float _1567 = trunc(_1531);
    float _1569 = precise::max(_1567, 0.0);
    uint _1571 = uint(_1569);
    float _1573 = -_1507;
    float _1575 = _1475 + _1573;
    float _1577 = as_type<float>(_1280) * _1559;
    int _1579 = ~_1252;
    int _1581 = _1579 + 1;
    int _1583 = as_type<int>(_1559);
    float _1585 = as_type<float>(_1565);
    if (_1120)
    {
        float _1587 = -_1106;
        float _1589 = _1587 + 1.0;
        _1583 = as_type<int>(_1589);
    }
    int _1591 = _1583;
    if (_1459)
    {
        bool _1593 = _1497 > 0.5;
        _1148 = _1593;
    }
    bool _1595 = _1148;
    float _1597 = in.m_61.w;
    int _1599 = ~_1238;
    int _1601 = _1599 + 1;
    float _1603 = -_1545;
    float _1605 = _1477 + _1603;
    float _1607 = as_type<float>(_1479) * _1489;
    float _1609 = float(_130);
    float _1611 = trunc(_1577);
    float _1613 = precise::max(_1611, 0.0);
    uint _1615 = uint(_1613);
    float _1617 = float(_1166);
    float _1619 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1621 = as_type<float>(_1601);
    if (_1120)
    {
        float _1623 = _1543 ? as_type<float>(_1591) : _1106;
        _1180 = _1623;
    }
    float _1625 = _1180;
    int _1627 = int(_1333) + int(_1571);
    float _1629 = _1575 * _1617;
    float _1631 = float(_1296);
    float _1633 = trunc(_1607);
    float _1635 = precise::max(_1633, 0.0);
    uint _1637 = uint(_1635);
    float _1639 = -_1481;
    float _1641 = _1461 + _1639;
    float _1643 = float(_1238);
    bool _1645 = _1631 >= _1617;
    bool _1647 = isnan(_1631);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan(_1617);
    bool _1653 = _1649 || _1651;
    float _1655 = float(_1653);
    float _1657 = float(_1252);
    float _1659 = floor(_1491);
    int _1661 = int(_1327) + int(_1615);
    int _1663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1665 = _1663 != 0;
    int _1667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1669 = _1667 != 0;
    float _1671 = 1.0 / _1609;
    int _1673 = _1581 * int(_1637);
    int _1675 = _1673 + _1308;
    float _1677 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _1679 = float(uint(_1675));
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1683 = trunc(_1503);
    float _1685 = precise::max(_1683, 0.0);
    uint _1687 = uint(_1685);
    float _1689 = _1617 * _164;
    float _1691 = -_1659;
    float _1693 = _1491 + _1691;
    float _1695 = as_type<float>(_1479) * _1679;
    float _1697 = float(_1290);
    float _1699 = _1643 * _1605;
    float _1701 = float(_1218);
    float _1703 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _1705 = trunc(_1695);
    float _1707 = precise::max(_1705, 0.0);
    uint _1709 = uint(_1707);
    if (!_1459)
    {
        _1511 = _1106;
    }
    float _1711 = _1511;
    float _1713 = _1689 * _1671;
    float _1715 = _1711;
    if (_1459)
    {
        float _1717 = _1595 ? as_type<float>(_1529) : _1106;
        _1715 = _1717;
    }
    float _1719 = _1715;
    float _1721 = _1671 * _164;
    float _1723 = float(_1266);
    float _1725 = _1701 * _1641;
    bool _1727 = _1697 >= _1643;
    bool _1729 = isnan(_1697);
    bool _1731 = _1727 || _1729;
    bool _1733 = isnan(_1643);
    bool _1735 = _1731 || _1733;
    float _1737 = float(_1735);
    float _1739 = _1701 * _1721;
    int _1741 = int(_1339) + int(_1687);
    float _1743 = _1657 * _1721;
    float _1745 = float(_1308);
    float _1747 = trunc(_1737);
    int _1749 = int(_1747);
    bool _1751 = _1723 >= _1701;
    bool _1753 = isnan(_1723);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan(_1701);
    bool _1759 = _1755 || _1757;
    float _1761 = float(_1759);
    float _1763 = _1657 * _1693;
    bool _1765 = _1745 >= _1657;
    bool _1767 = isnan(_1745);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan(_1657);
    bool _1773 = _1769 || _1771;
    float _1775 = float(_1773);
    int _1777 = _1535 * _1741;
    int _1779 = _1777 + _1296;
    int _1781 = _1601 * _1627;
    int _1783 = _1781 + _1290;
    int _1785 = int(_1637) + int(_1709);
    float _1787 = trunc(_1655);
    int _1789 = int(_1787);
    bool _1791 = !_1665;
    int _1793 = _1791 ? 0 : 1;
    float _1795 = _1643 * _1721;
    bool _1797 = uint(_1779) >= uint(_1166);
    int _1799 = _1565 * _1661;
    int _1801 = _1799 + _1266;
    int _1803 = abs(_1793);
    int _1805 = ~_1252;
    int _1807 = _1805 + 1;
    float _1809 = trunc(_1629);
    int _1811 = int(_1809);
    bool _1813 = uint(_1783) >= uint(_1238);
    bool _1815 = uint(_1801) >= uint(_1218);
    int _1817 = _1807 * _1785;
    int _1819 = _1817 + _1308;
    bool _1821 = !_1669;
    int _1823 = _1821 ? 0 : 1;
    bool _1825 = !_1797;
    int _1827 = _1825 ? 0 : (-1);
    float _1829 = trunc(_1699);
    int _1831 = int(_1829);
    bool _1833 = !_1813;
    int _1835 = _1833 ? 0 : (-1);
    int _1837 = abs(_1823);
    int _1839 = ~_1741;
    int _1841 = _1839 + _1827;
    int _1843 = _1841 + 1;
    bool _1845 = !_1815;
    int _1847 = _1845 ? 0 : (-1);
    float _1849 = trunc(_1761);
    int _1851 = int(_1849);
    bool _1853 = uint(_1819) >= uint(_1252);
    int _1855 = _1811 * _1803;
    int _1857 = _1855 + _1296;
    int _1859 = ~_1627;
    int _1861 = _1859 + _1835;
    int _1863 = _1861 + 1;
    int _1865 = ~_1661;
    int _1867 = _1865 + _1847;
    int _1869 = _1867 + 1;
    int _1871 = _1166 * _1843;
    int _1873 = _1871 + _1296;
    bool _1875 = !_1853;
    int _1877 = _1875 ? 0 : (-1);
    int _1879 = _1831 * _1837;
    int _1881 = _1879 + _1290;
    int _1883 = _1238 * _1863;
    int _1885 = _1883 + _1290;
    int _1887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1889 = _1887 != 0;
    float _1891 = trunc(_1725);
    int _1893 = int(_1891);
    int _1895 = ~_1785;
    int _1897 = _1895 + _1877;
    int _1899 = _1897 + 1;
    int _1901 = _1218 * _1869;
    int _1903 = _1901 + _1266;
    int _1905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1907 = _1905 != 0;
    int _1909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1911 = _1909 != 0;
    int _1913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1915 = _1913 != 0;
    bool _1917 = _1238 == 0;
    int _1919 = _1252 * _1899;
    int _1921 = _1919 + _1308;
    bool _1923 = !_1889;
    int _1925 = _1923 ? 0 : 1;
    float _1927 = trunc(_1775);
    int _1929 = int(_1927);
    bool _1931 = _1166 == 0;
    bool _1933 = _1218 == 0;
    int _1935 = ~_1749;
    int _1937 = _1935 + 1;
    int _1939 = _1937 + 1;
    bool _1941 = _1252 == 0;
    float _1943 = trunc(_1713);
    int _1945 = int(_1943);
    bool _1947 = !_1917;
    int _1949 = _1947 ? _1885 : (-1);
    int _1951 = ~_1789;
    int _1953 = _1951 + 1;
    int _1955 = _1953 + 1;
    bool _1957 = !_1931;
    int _1959 = _1957 ? _1873 : (-1);
    int _1961 = _1939 * _1949;
    int _1963 = abs(_1925);
    float _1965 = trunc(_1795);
    int _1967 = int(_1965);
    int _1969 = ~_1851;
    int _1971 = _1969 + 1;
    int _1973 = _1971 + 1;
    int _1975 = _1959 * _1955;
    bool _1977 = !_1933;
    int _1979 = _1977 ? _1903 : (-1);
    int _1981 = _1893 * _1963;
    int _1983 = _1981 + _1266;
    bool _1985 = !_1941;
    int _1987 = _1985 ? _1921 : (-1);
    int _1989 = _1166 + (-1);
    int _1991 = _1973 * _1979;
    bool _1993 = !_1911;
    int _1995 = _1993 ? 0 : 1;
    float _1997 = floor(_1557);
    int _1999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2001 = _1999 != 0;
    int _2003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2005 = _2003 != 0;
    int _2007 = _1789 * _1989;
    int _2009 = _2007 + _1975;
    int _2011 = _1238 + (-1);
    int _2013 = abs(_1995);
    bool _2015 = !_1907;
    int _2017 = _2015 ? 0 : 1;
    int _2019 = _1749 * _2011;
    int _2021 = _2019 + _1961;
    bool _2023 = !_2005;
    int _2025 = _2023 ? 0 : 1;
    int _2027 = _2009 * _2013;
    int _2029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2031 = _2029 != 0;
    int _2033 = abs(_2017);
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2037 = _2035 != 0;
    int _2039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2041 = _2039 != 0;
    bool _2043 = !_1915;
    int _2045 = _2043 ? 0 : 1;
    int _2047 = _1945 * _2033;
    int _2049 = _2047 + _2027;
    int _2051 = abs(_2025);
    bool _2053 = !_2037;
    int _2055 = _2053 ? 0 : 1;
    int _2057 = abs(_2045);
    int _2059 = _2021 * _2051;
    bool _2061 = !_2031;
    int _2063 = _2061 ? 0 : 1;
    int _2065 = abs(_2055);
    bool _2067 = !_2001;
    int _2069 = _2067 ? 0 : 1;
    int _2071 = abs(_2063);
    int _2073 = _1857 * _2057;
    int _2075 = _2073 + _2049;
    int _2077 = abs(_2069);
    int _2079 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2081 = _2079 != 0;
    int _2083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2085 = _2083 != 0;
    int _2087 = _1967 * _2077;
    int _2089 = _2087 + _2059;
    bool _2091 = !_2041;
    int _2093 = _2091 ? 0 : 1;
    int _2095 = _1811 * _2071;
    int _2097 = _2095 + _2075;
    float _2099 = trunc(_1763);
    int _2101 = int(_2099);
    int _2103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2105 = _2103 != 0;
    int _2107 = abs(_2093);
    int _2109 = _1881 * _2065;
    int _2111 = _2109 + _2089;
    bool _2113 = !_2105;
    int _2115 = _2113 ? 0 : 1;
    bool _2117 = !_2085;
    int _2119 = _2117 ? 0 : 1;
    float _2121 = trunc(_1739);
    int _2123 = int(_2121);
    float _2125 = float(uint(_2097));
    int _2127 = abs(_2115);
    int _2129 = _1831 * _2107;
    int _2131 = _2129 + _2111;
    int _2133 = abs(_2119);
    float _2135 = as_type<float>(_1276) * _2125;
    int _2137 = _1218 + (-1);
    bool _2139 = !_2081;
    int _2141 = _2139 ? 0 : 1;
    float _2143 = trunc(_2135);
    float _2145 = precise::max(_2143, 0.0);
    uint _2147 = uint(_2145);
    int _2149 = ~_1929;
    int _2151 = _2149 + 1;
    int _2153 = _2151 + 1;
    int _2155 = _1851 * _2137;
    int _2157 = _2155 + _1991;
    int _2159 = abs(_2141);
    float _2161 = in.m_73.y;
    int _2163 = _2153 * _1987;
    float _2165 = float(uint(_2131));
    int _2167 = _2157 * _2133;
    int _2169 = _1252 + (-1);
    int _2171 = _2101 * _2127;
    int _2173 = _2171 + _1308;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2177 = _2175 != 0;
    float _2179 = as_type<float>(_1298) * _2165;
    int _2181 = _2123 * _2159;
    int _2183 = _2181 + _2167;
    int _2185 = ~_1166;
    int _2187 = _2185 + 1;
    int _2189 = _1929 * _2169;
    int _2191 = _2189 + _2163;
    bool _2193 = !_2177;
    int _2195 = _2193 ? 0 : 1;
    float _2197 = trunc(_2179);
    float _2199 = precise::max(_2197, 0.0);
    uint _2201 = uint(_2199);
    int _2203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2205 = _2203 != 0;
    int _2207 = abs(_2195);
    int _2209 = _2187 * int(_2147);
    int _2211 = _2209 + _2097;
    bool _2213 = !_2205;
    int _2215 = _2213 ? 0 : 1;
    int _2217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2219 = _2217 != 0;
    int _2221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2223 = _2221 != 0;
    float _2225 = trunc(_1743);
    int _2227 = int(_2225);
    int _2229 = ~_1238;
    int _2231 = _2229 + 1;
    float _2233 = float(uint(_2211));
    int _2235 = _1983 * _2207;
    int _2237 = _2235 + _2183;
    bool _2239 = !_2223;
    int _2241 = _2239 ? 0 : 1;
    float _2243 = -_2161;
    float _2245 = _2243 + 1.0;
    float _2247 = as_type<float>(_1276) * _2233;
    bool _2249 = !_2219;
    int _2251 = _2249 ? 0 : 1;
    int _2253 = abs(_2241);
    int _2255 = _2231 * int(_2201);
    int _2257 = _2255 + _2131;
    int _2259 = abs(_2215);
    float _2261 = trunc(_2247);
    float _2263 = precise::max(_2261, 0.0);
    uint _2265 = uint(_2263);
    int _2267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2269 = _2267 != 0;
    int _2271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2273 = _2271 != 0;
    int _2275 = abs(_2251);
    float _2277 = float(uint(_2257));
    int _2279 = _2191 * _2253;
    bool _2281 = !_2269;
    int _2283 = _2281 ? 0 : 1;
    int _2285 = _1893 * _2259;
    int _2287 = _2285 + _2237;
    int _2289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2291 = _2289 != 0;
    float _2293 = as_type<float>(_1298) * _2277;
    int _2295 = abs(_2283);
    float _2297 = float(uint(_2287));
    float _2299 = trunc(_2293);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    int _2305 = _2227 * _2275;
    int _2307 = _2305 + _2279;
    bool _2309 = !_2273;
    int _2311 = _2309 ? 0 : 1;
    float _2313 = as_type<float>(_1280) * _2297;
    int _2315 = int(_2147) + int(_2265);
    int _2317 = _2173 * _2295;
    int _2319 = _2317 + _2307;
    int _2321 = ~_1166;
    int _2323 = _2321 + 1;
    float _2325 = trunc(_2313);
    float _2327 = precise::max(_2325, 0.0);
    uint _2329 = uint(_2327);
    int _2331 = abs(_2311);
    float _2333 = in.m_63.w;
    int _2335 = _2323 * _2315;
    int _2337 = _2335 + _2097;
    int _2339 = ~_1218;
    int _2341 = _2339 + 1;
    int _2343 = _2101 * _2331;
    int _2345 = _2343 + _2319;
    int _2347 = ~_1238;
    int _2349 = _2347 + 1;
    int _2351 = _2101;
    float _2353 = as_type<float>(_1903);
    float _2355 = as_type<float>(_1785);
    if (_2291)
    {
        float _2357 = -_1106;
        float _2359 = _2357 + 1.0;
        _2351 = as_type<int>(_2359);
    }
    int _2361 = _2351;
    bool _2363 = uint(_2337) >= uint(_1166);
    int _2365 = int(_2201) + int(_2303);
    bool _2367 = !_2363;
    int _2369 = _2367 ? 0 : (-1);
    int _2371 = _2349 * _2365;
    int _2373 = _2371 + _2131;
    float _2375 = float(uint(_2345));
    int _2377 = _2341 * int(_2329);
    int _2379 = _2377 + _2287;
    bool _2381 = _1112 > 0.5;
    int _2383 = ~_2315;
    int _2385 = _2383 + _2369;
    int _2387 = _2385 + 1;
    float _2389 = as_type<float>(_1479) * _2375;
    if (_2291)
    {
        float _2391 = _2381 ? as_type<float>(_2361) : _1106;
        _1176 = _2391;
    }
    float _2393 = _1176;
    bool _2395 = uint(_2373) >= uint(_1238);
    int _2397 = _1166 * _2387;
    int _2399 = _2397 + _2097;
    float _2401 = float(uint(_2379));
    float _2403 = trunc(_2389);
    float _2405 = precise::max(_2403, 0.0);
    uint _2407 = uint(_2405);
    bool _2409 = _1166 == 0;
    bool _2411 = !_2395;
    int _2413 = _2411 ? 0 : (-1);
    bool _2415 = _2333 > 0.5;
    float _2417 = as_type<float>(_1280) * _2401;
    bool _2419 = !_2409;
    int _2421 = _2419 ? _2399 : (-1);
    int _2423 = _2415 ? as_type<int>(_2245) : as_type<int>(_2161);
    float _2425 = trunc(_2417);
    float _2427 = precise::max(_2425, 0.0);
    uint _2429 = uint(_2427);
    int _2431 = _2421 & 3;
    bool _2433 = _2431 != 0;
    int _2435 = _2421 & 3;
    bool _2437 = _2435 != 0;
    bool _2439 = uint(_2431) >= 2u;
    int _2441 = _2437 ? 0 : 1;
    int _2443 = ~_2365;
    int _2445 = _2443 + _2413;
    int _2447 = _2445 + 1;
    bool _2449 = uint(_2431) > 1u;
    int _2451 = ~_1252;
    int _2453 = _2451 + 1;
    int _2455 = _1238 * _2447;
    int _2457 = _2455 + _2131;
    int _2459 = _2439 ? 0 : 1;
    bool _2461 = _2431 != 3;
    int _2463 = _2453 * int(_2407);
    int _2465 = _2463 + _2345;
    int _2467 = _2381 ? as_type<int>(_2245) : as_type<int>(_2161);
    bool _2469 = _1238 == 0;
    int _2471 = ~_1218;
    int _2473 = _2471 + 1;
    bool _2475 = !_2469;
    int _2477 = _2475 ? _2457 : (-1);
    int _2479 = int(_2329) + int(_2429);
    float _2481 = float(uint(_2465));
    int _2483 = ~_2441;
    int _2485 = _2483 + 1;
    int _2487 = _2485 + 1;
    float _2489 = as_type<float>(_1479) * _2481;
    int _2491 = _2487;
    if (!_2449)
    {
        int _2493 = ~_2441;
        int _2495 = _2493 + 1;
        _2491 = _2495;
    }
    int _2497 = _2491;
    int _2499 = _2477 & 3;
    bool _2501 = _2499 != 0;
    int _2503 = _2473 * _2479;
    int _2505 = _2503 + _2287;
    int _2507 = ~_2459;
    int _2509 = _2507 + 1;
    int _2511 = _2509 + 1;
    int _2513 = _2511;
    if (_2461)
    {
        int _2515 = ~_2459;
        int _2517 = _2515 + 1;
        _2513 = _2517;
    }
    int _2519 = _2513;
    bool _2521 = uint(_2499) >= 2u;
    float _2523 = trunc(_2489);
    float _2525 = precise::max(_2523, 0.0);
    uint _2527 = uint(_2525);
    int _2529 = _2501 ? 0 : 1;
    bool _2531 = uint(_2505) >= uint(_1218);
    int _2533 = _2521 ? 0 : 1;
    bool _2535 = _2499 != 3;
    bool _2537 = !_2531;
    int _2539 = _2537 ? 0 : (-1);
    bool _2541 = uint(_2499) > 1u;
    int _2543 = ~_2479;
    int _2545 = _2543 + _2539;
    int _2547 = _2545 + 1;
    int _2549 = ~_2533;
    int _2551 = _2549 + 1;
    int _2553 = _2551 + 1;
    bool _2555 = _1218 == 0;
    int _2557 = _1218 * _2547;
    int _2559 = _2557 + _2287;
    int _2561 = ~_2529;
    int _2563 = _2561 + 1;
    int _2565 = _2563 + 1;
    int _2567 = _2553;
    int _2569 = _2565;
    if (_2535)
    {
        int _2571 = ~_2533;
        int _2573 = _2571 + 1;
        _2567 = _2573;
    }
    int _2575 = _2567;
    int _2577 = ~_1252;
    int _2579 = _2577 + 1;
    int _2581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2583 = _2581 != 0;
    if (!_2541)
    {
        int _2585 = ~_2529;
        int _2587 = _2585 + 1;
        _2569 = _2587;
    }
    int _2589 = _2569;
    bool _2591 = !_2555;
    int _2593 = _2591 ? _2559 : (-1);
    int _2595 = int(_2407) + int(_2527);
    bool _2597 = !_2583;
    int _2599 = _2597 ? 0 : 1;
    int _2601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2603 = _2601 != 0;
    int _2605 = _2579 * _2595;
    int _2607 = _2605 + _2345;
    int _2609 = _2593 & 3;
    bool _2611 = _2609 != 0;
    bool _2613 = !_2603;
    int _2615 = _2613 ? 0 : 1;
    bool _2617 = uint(_2609) >= 2u;
    int _2619 = _2611 ? 0 : 1;
    bool _2621 = uint(_2607) >= uint(_1252);
    int _2623 = _2617 ? 0 : 1;
    bool _2625 = _2609 != 3;
    bool _2627 = !_2621;
    int _2629 = _2627 ? 0 : (-1);
    bool _2631 = uint(_2609) > 1u;
    int _2633 = ~_2595;
    int _2635 = _2633 + _2629;
    int _2637 = _2635 + 1;
    int _2639 = ~_2623;
    int _2641 = _2639 + 1;
    int _2643 = _2641 + 1;
    bool _2645 = _1252 == 0;
    int _2647 = _1252 * _2637;
    int _2649 = _2647 + _2345;
    int _2651 = ~_2619;
    int _2653 = _2651 + 1;
    int _2655 = _2653 + 1;
    int _2657 = _2643;
    int _2659 = _2655;
    if (_2625)
    {
        int _2661 = ~_2623;
        int _2663 = _2661 + 1;
        _2657 = _2663;
    }
    int _2665 = _2657;
    int _2667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2669 = _2667 != 0;
    bool _2671 = !_2645;
    int _2673 = _2671 ? _2649 : (-1);
    float _2675 = _2669 ? as_type<float>(_2467) : _2161;
    if (!_2631)
    {
        int _2677 = ~_2619;
        int _2679 = _2677 + 1;
        _2659 = _2679;
    }
    int _2681 = _2659;
    int _2683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2685 = _2683 != 0;
    int _2687 = _2673 & 3;
    bool _2689 = _2687 != 0;
    bool _2691 = !_2685;
    int _2693 = _2691 ? 0 : 1;
    bool _2695 = uint(_2687) >= 2u;
    int _2697 = _2689 ? 0 : 1;
    int _2699 = _2695 ? 0 : 1;
    bool _2701 = _2687 != 3;
    bool _2703 = uint(_2687) > 1u;
    int _2705 = ~_2699;
    int _2707 = _2705 + 1;
    int _2709 = _2707 + 1;
    int _2711 = ~_2697;
    int _2713 = _2711 + 1;
    int _2715 = _2713 + 1;
    float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2719 = _2717 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2721 = _2709;
    int _2723 = _2715;
    if (_2701)
    {
        int _2725 = ~_2699;
        int _2727 = _2725 + 1;
        _2721 = _2727;
    }
    int _2729 = _2721;
    float _2731 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2733 = _2731 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    if (!_2703)
    {
        int _2735 = ~_2697;
        int _2737 = _2735 + 1;
        _2723 = _2737;
    }
    int _2739 = _2723;
    float _2741 = 1.0 / _2719;
    float _2743 = in.m_48.x;
    float _2745 = in.m_48.y;
    float _2747 = in.m_48.z;
    bool _2749 = _1439 > 0.5;
    float _2751 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2755 = _2753 != 0;
    int _2757 = _2749 ? as_type<int>(_2245) : as_type<int>(_2161);
    float _2759 = _2755 ? as_type<float>(_2423) : _2161;
    float _2761 = 1.0 / _2733;
    int _2763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2765 = _2763 != 0;
    int _2767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2769 = _2767 != 0;
    float _2771 = _2765 ? as_type<float>(_2757) : _2161;
    float _2773 = _2769 ? as_type<float>(_2757) : _2161;
    bool _2775 = !_1537;
    float _2777 = _2775 ? as_type<float>(_1441) : as_type<float>(_1443);
    bool _2779 = !_1537;
    float _2781 = _2779 ? as_type<float>(_1445) : as_type<float>(_1441);
    float _2783 = _202 * _2745;
    float _2785 = _196 * _2745;
    float _2787 = _208 * _2745;
    float _2789 = fma(_200, _2743, _2783);
    float _2791 = fma(_194, _2743, _2785);
    float _2793 = fma(_206, _2743, _2787);
    if (!_1537)
    {
        _1621 = _1439;
    }
    float _2795 = _1621;
    float _2797 = fma(_204, _2747, _2789);
    float _2799 = fma(_198, _2747, _2791);
    float _2801 = 0.0;
    float _2803 = _2795;
    if (!_1537)
    {
        _2801 = _1439;
    }
    float _2805 = _2801;
    float _2807 = as_type<float>(_1441) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2809 = _2805;
    if (!_1537)
    {
        _1585 = _1112;
    }
    float _2811 = _1585;
    float _2813 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2815 = 0.0;
    float _2817 = _2811;
    if (!_1537)
    {
        _2815 = _1112;
    }
    float _2819 = _2815;
    float _2821 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2823 = _2819;
    if (_1549)
    {
        _2353 = _1427;
    }
    float _2825 = _2353;
    float _2827 = fma(as_type<float>(_1441), (*spvDescriptorSet0.vp_c9)._m0[93].w, _2813);
    float _2829 = _2825;
    if (_1537)
    {
        _2803 = _1112;
    }
    float _2831 = _2803;
    float _2833 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2835 = log2(_2833);
    if (_1537)
    {
        _2809 = _1112;
    }
    float _2837 = _2809;
    float _2839 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_1549)
    {
        _2355 = _1112;
    }
    float _2841 = _2355;
    float _2843 = fma(_210, _2747, _2793);
    float _2845 = _2841;
    if (_1537)
    {
        _2817 = _1427;
    }
    float _2847 = _2817;
    float _2849 = fma(_2781, (*spvDescriptorSet0.vp_c9)._m0[98].w, _1677);
    if (_1537)
    {
        _2823 = _1427;
    }
    float _2851 = _2823;
    float _2853 = _2781 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    if (!_1549)
    {
        _2829 = _1439;
    }
    float _2855 = _2829;
    float _2857 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    if (!_1549)
    {
        _2845 = _1427;
    }
    float _2859 = _2845;
    float _2861 = fma(_2853, -2.0, _1703);
    int _2863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2865 = _2863 != 0;
    int _2867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2869 = _2867 != 0;
    float _2871 = fma(as_type<float>(_1443), (*spvDescriptorSet0.vp_c9)._m0[93].z, _2857);
    int _2873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2875 = _2873 != 0;
    float _2877 = _2835 * _164;
    float _2879 = as_type<float>(_1443) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2881 = _2847 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2883 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2885 = exp2(_2877);
    float _2887 = _2865 ? as_type<float>(_2757) : _2161;
    float _2889 = fma(_2821, -2.0, _2883);
    bool _2891 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2893 = isnan(0.0);
    bool _2895 = _2891 || _2893;
    bool _2897 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2899 = _2895 || _2897;
    float _2901 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2903 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2901;
    float _2905 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2907 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2909 = _2903 * _2741;
    float _2911 = fma(_2807, -2.0, _2905);
    float _2913 = fma(_2851, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2907);
    float _2915 = _2855 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2917 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2919 = -_2885;
    float _2921 = _2919 + 1.0;
    float _2923 = -_2917;
    float _2925 = fma(_2839, 2.0, _2923);
    float _2927 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2929 = _2899 ? _2921 : 0.0;
    float _2931 = -_2751;
    float _2933 = fma(_2915, 2.0, _2931);
    float _2935 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2937 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2939 = -_2927;
    float _2941 = fma(_2879, 2.0, _2939);
    float _2943 = fma(_2837, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2935);
    float _2945 = _2831 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2947 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2949 = _2947 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2951 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2953 = fma(_2945, -2.0, _1681);
    float _2955 = _2869 ? as_type<float>(_2757) : _2161;
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _2959 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2961 = _2959 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2963 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2965 = _2963 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2967 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2969 = isnan(1.0);
    bool _2971 = _2967 || _2969;
    bool _2973 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2975 = _2971 || _2973;
    float _2977 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2979 = 1.0 + _2977;
    float _2981 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2937);
    float _2983 = 1.0 / _2979;
    float _2985 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2951);
    float _2987 = _1427 * 2.0;
    float _2989 = fma(_2777, (*spvDescriptorSet0.vp_c9)._m0[98].z, _2957);
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2993 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2995 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _2997 = _2777 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _2999 = 1.0 / _2949;
    float _3001 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3003 = _2859 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3007 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2985);
    float _3009 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2991);
    float _3011 = -_2995;
    float _3013 = fma(_2997, 2.0, _3011);
    float _3015 = floor(_2987);
    float _3017 = -_2993;
    float _3019 = fma(_2881, 2.0, _3017);
    float _3021 = fma(_3003, -2.0, _3001);
    float _3023 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3005);
    float _3025 = _2961 * _2761;
    float _3027 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3029 = _3027 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3031 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3009);
    float _3033 = 1.0 / _2965;
    float _3035 = -_164;
    float _3037 = fma(_3035, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2941);
    float _3039 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2911);
    float _3041 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2889);
    float _3043 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2981);
    float _3045 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3023);
    float _3047 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2871);
    float _3049 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2827);
    float _3051 = -_164;
    float _3053 = fma(_3051, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2925);
    float _3055 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].z, _2989);
    float _3057 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2849);
    float _3059 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2913);
    float _3061 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2943);
    float _3063 = -_164;
    float _3065 = fma(_3063, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3013);
    float _3067 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2861);
    float _3069 = -_164;
    float _3071 = fma(_3069, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3019);
    float _3073 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2953);
    float _3075 = -_164;
    float _3077 = fma(_3075, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2933);
    float _3079 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3021);
    if (_2975)
    {
        float _3081 = _2929 * _2983;
        _168 = _3081;
    }
    float _3083 = _168;
    float _3085 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3087 = _3085 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3089 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3091 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3089;
    float _3093 = 1.0 / _3029;
    float _3095 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3097 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3095;
    float _3099 = _3091 * _2999;
    bool _3101 = _3015 >= 0.0;
    bool _3103 = isnan(_3015);
    bool _3105 = _3101 || _3103;
    bool _3107 = isnan(0.0);
    bool _3109 = _3105 || _3107;
    float _3111 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3113 = _3111 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _3115 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3117 = _3115 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3119 = _3097 * _3033;
    float _3121 = float(uint(_1881));
    float _3123 = 1.0 / _3087;
    int _3125 = _3109 ? 0 : 1;
    float _3127 = in.m_57.w;
    bool _3129 = _3015 > 0.0;
    float _3131 = as_type<float>(_1298) * _3121;
    float _3133 = float(uint(_1857));
    float _3135 = _3117 * _3093;
    float _3137 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3139 = _3137 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3141 = 1.0 / _3113;
    float _3143 = as_type<float>(_1276) * _3133;
    int _3145 = ~_1238;
    int _3147 = _3145 + 1;
    float _3149 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3151 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3149;
    int _3153 = ~_1218;
    int _3155 = _3153 + 1;
    float _3157 = _3139 * _3123;
    int _3159 = ~_3125;
    int _3161 = _3159 + 1;
    int _3163 = _3161 + 1;
    float _3165 = trunc(_3131);
    float _3167 = precise::max(_3165, 0.0);
    uint _3169 = uint(_3167);
    int _3171 = _3163;
    if (!_3129)
    {
        int _3173 = ~_3125;
        int _3175 = _3173 + 1;
        _3171 = _3175;
    }
    int _3177 = _3171;
    float _3179 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3181 = _1100 + _3179;
    float _3183 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3185 = _1100 + _3183;
    bool _3187 = _1997 >= 0.0;
    bool _3189 = isnan(_1997);
    bool _3191 = _3187 || _3189;
    bool _3193 = isnan(0.0);
    bool _3195 = _3191 || _3193;
    float _3197 = fma(_2909, _3181, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3199 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3201 = _1100 + _3199;
    float _3203 = trunc(_3143);
    float _3205 = precise::max(_3203, 0.0);
    uint _3207 = uint(_3205);
    float _3209 = fma(_3025, _3185, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3211 = _3151 * _3141;
    float _3213 = fma(_3135, _3201, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3215 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3217 = _1100 + _3215;
    int _3219 = ~_1166;
    int _3221 = _3219 + 1;
    int _3223 = _3195 ? 0 : 1;
    int _3225 = _3147 * int(_3169);
    int _3227 = _3225 + _1881;
    float _3229 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3231 = _1100 + _3229;
    bool _3233 = _1997 > 0.0;
    float _3235 = float(uint(_2173));
    float _3237 = fma(_3099, _3231, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3239 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3241 = _1100 + _3239;
    int _3243 = ~_1252;
    int _3245 = _3243 + 1;
    int _3247 = _3221 * int(_3207);
    int _3249 = _3247 + _1857;
    float _3251 = as_type<float>(_1479) * _3235;
    float _3253 = fma(_3119, _3241, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3255 = fma(_3157, _3217, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3257 = float(uint(_3227));
    float _3259 = float(uint(_1983));
    float _3261 = trunc(_3251);
    float _3263 = precise::max(_3261, 0.0);
    uint _3265 = uint(_3263);
    float _3267 = float(uint(_3249));
    float _3269 = as_type<float>(_1298) * _3257;
    bool _3271 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3273 = isnan(_1100);
    bool _3275 = _3271 || _3273;
    bool _3277 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3279 = _3275 || _3277;
    float _3281 = float(_3279);
    float _3283 = as_type<float>(_1280) * _3259;
    bool _3285 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3287 = isnan(_1100);
    bool _3289 = _3285 || _3287;
    bool _3291 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3293 = _3289 || _3291;
    float _3295 = float(_3293);
    float _3297 = as_type<float>(_1276) * _3267;
    bool _3299 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3301 = isnan(_1100);
    bool _3303 = _3299 || _3301;
    bool _3305 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3307 = _3303 || _3305;
    float _3309 = float(_3307);
    float _3311 = -_3281;
    float _3313 = _3311 + 1.0;
    bool _3315 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3317 = isnan(_1100);
    bool _3319 = _3315 || _3317;
    bool _3321 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3323 = _3319 || _3321;
    float _3325 = float(_3323);
    float _3327 = trunc(_3283);
    float _3329 = precise::max(_3327, 0.0);
    uint _3331 = uint(_3329);
    int _3333 = _2477 & 3;
    bool _3335 = _3333 != 0;
    float _3337 = -_3309;
    float _3339 = _3337 + 1.0;
    float _3341 = _3309 * _3313;
    bool _3343 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3345 = isnan(_1100);
    bool _3347 = _3343 || _3345;
    bool _3349 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3351 = _3347 || _3349;
    float _3353 = float(_3351);
    float _3355 = _3295 * _3339;
    float _3357 = -_3295;
    float _3359 = _3357 + 1.0;
    float _3361 = trunc(_3297);
    float _3363 = precise::max(_3361, 0.0);
    uint _3365 = uint(_3363);
    bool _3367 = _2687 != 3;
    float _3369 = _3325 * _3359;
    float _3371 = -_3325;
    float _3373 = _3371 + 1.0;
    bool _3375 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3377 = isnan(_1100);
    bool _3379 = _3375 || _3377;
    bool _3381 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3383 = _3379 || _3381;
    float _3385 = float(_3383);
    bool _3387 = !_3367;
    int _3389 = _3387 ? 0 : (-1);
    int _3391 = _3155 * int(_3331);
    int _3393 = _3391 + _1983;
    float _3395 = _3353 * _3373;
    float _3397 = -_3353;
    float _3399 = _3397 + 1.0;
    bool _3401 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3403 = isnan(_1100);
    bool _3405 = _3401 || _3403;
    bool _3407 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3409 = _3405 || _3407;
    float _3411 = float(_3409);
    float _3413 = -_3385;
    float _3415 = _3413 + 1.0;
    float _3417 = float(uint(_3393));
    float _3419 = _3385 * _3399;
    bool _3421 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3423 = isnan(_1100);
    bool _3425 = _3421 || _3423;
    bool _3427 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3429 = _3425 || _3427;
    float _3431 = float(_3429);
    float _3433 = _3411 * _3415;
    float _3435 = -_3411;
    float _3437 = _3435 + 1.0;
    float _3439 = as_type<float>(_1280) * _3417;
    float _3441 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3443 = _1100 + _3441;
    float _3445 = _2799 + _3127;
    float _3447 = trunc(_3269);
    float _3449 = precise::max(_3447, 0.0);
    uint _3451 = uint(_3449);
    int _3453 = _3245 * int(_3265);
    int _3455 = _3453 + _2173;
    float _3457 = _3431 * _3437;
    float _3459 = fma(_3211, _3443, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3461 = _2797 + _1561;
    float _3463 = -_3431;
    float _3465 = _3463 + 1.0;
    float _3467 = float(uint(_3455));
    float _3469 = _3197 * _3457;
    float _3471 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3473 = ~_3223;
    int _3475 = _3473 + 1;
    int _3477 = _3475 + 1;
    float _3479 = fma(_3465, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3469);
    float _3481 = as_type<float>(_1479) * _3467;
    float _3483 = _2843 + _1597;
    int _3485 = _3477;
    if (!_3233)
    {
        int _3487 = ~_3223;
        int _3489 = _3487 + 1;
        _3485 = _3489;
    }
    int _3491 = _3485;
    float _3493 = fma(_3209, _3433, _3479);
    float _3495 = trunc(_3439);
    float _3497 = precise::max(_3495, 0.0);
    uint _3499 = uint(_3497);
    int _3501 = ~_1166;
    int _3503 = _3501 + 1;
    int _3505 = int(_3207) + int(_3365);
    float _3507 = fma(_3237, _3419, _3493);
    int _3509 = ~_1238;
    int _3511 = _3509 + 1;
    int _3513 = int(_3169) + int(_3451);
    float _3515 = trunc(_3481);
    float _3517 = precise::max(_3515, 0.0);
    uint _3519 = uint(_3517);
    int _3521 = _3503 * _3505;
    int _3523 = _3521 + _1857;
    float _3525 = _3471 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    bool _3527 = !_2875;
    int _3529 = _3527 ? 0 : 1;
    float _3531 = fma(_3213, _3395, _3507);
    int _3533 = ~_1218;
    int _3535 = _3533 + 1;
    int _3537 = _3511 * _3513;
    int _3539 = _3537 + _1881;
    int _3541 = int(_3331) + int(_3499);
    float _3543 = fma(_3525, _1214, -0.5);
    bool _3545 = uint(_3523) >= uint(_1166);
    float _3547 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3549 = _3461 + _3547;
    int _3551 = ~_1252;
    int _3553 = _3551 + 1;
    int _3555 = _3535 * _3541;
    int _3557 = _3555 + _1983;
    bool _3559 = !_3545;
    int _3561 = _3559 ? 0 : (-1);
    float _3563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3565 = _3445 + _3563;
    bool _3567 = uint(_3539) >= uint(_1238);
    float _3569 = _1439 * 2.0;
    int _3571 = int(_3265) + int(_3519);
    float _3573 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3575 = _3483 + _3573;
    float _3577 = fma(_3253, _3369, _3531);
    bool _3579 = !_3567;
    int _3581 = _3579 ? 0 : (-1);
    float _3583 = floor(_3569);
    bool _3585 = uint(_3557) >= uint(_1218);
    float _3587 = _3549 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3589 = _3553 * _3571;
    int _3591 = _3589 + _2173;
    int _3593 = ~_3505;
    int _3595 = _3593 + _3561;
    int _3597 = _3595 + 1;
    float _3599 = fma(_3255, _3355, _3577);
    float _3601 = fma(_3565, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3587);
    bool _3603 = !_3585;
    int _3605 = _3603 ? 0 : (-1);
    float _3607 = _1112 + _1439;
    bool _3609 = uint(_3591) >= uint(_1252);
    float _3611 = fma(_3575, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3601);
    int _3613 = ~_3513;
    int _3615 = _3613 + _3581;
    int _3617 = _3615 + 1;
    float _3619 = _1112 + _1427;
    bool _3621 = !_3609;
    int _3623 = _3621 ? 0 : (-1);
    float _3625 = fma(_3459, _3341, _3599);
    bool _3627 = _3611 >= 0.0;
    int _3629 = _1166 * _3597;
    int _3631 = _3629 + _1857;
    float _3633 = _3619 + (-1.0);
    int _3635 = _1238 * _3617;
    int _3637 = _3635 + _1881;
    bool _3639 = !_3335;
    int _3641 = _3639 ? 0 : 1;
    float _3643 = fma(_3281, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3625);
    float _3645 = fma(_3633, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3647 = _3549 * _3549;
    int _3649 = _2593 & 3;
    bool _3651 = _3649 != 0;
    float _3653 = _3607 + (-1.0);
    int _3655 = _2421 >> 31;
    float _3657 = fma(_3565, _3565, _3647);
    bool _3659 = !_3651;
    int _3661 = _3659 ? 0 : 1;
    float _3663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    int _3665 = _2673 & 3;
    bool _3667 = _3665 != 0;
    float _3669 = fma(_3575, _3575, _3657);
    bool _3671 = !_2433;
    int _3673 = _3671 ? 0 : 1;
    out.m_75.x = _3643;
    bool _3675 = !_3667;
    int _3677 = _3675 ? 0 : 1;
    float _3679 = _1112 + (-0.5);
    bool _3681 = _2431 != 3;
    float _3683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    if (_3627)
    {
        out.m_51.x = 0.0;
    }
    bool _3685 = _3583 > 0.0;
    bool _3687 = _3583 >= 0.0;
    bool _3689 = isnan(_3583);
    bool _3691 = _3687 || _3689;
    bool _3693 = isnan(0.0);
    bool _3695 = _3691 || _3693;
    float _3697 = fma(_3653, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3699 = _3583;
    if (_3627)
    {
        _3699 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3701 = _3699;
    float _3703 = rsqrt(_3669);
    int _3705 = _3655 & 3;
    int _3707 = _2477 >> 31;
    int _3709 = as_type<int>(_3701);
    if (_3627)
    {
        float _3711 = _3701 * 5.0;
        _3709 = as_type<int>(_3711);
    }
    int _3713 = _3709;
    int _3715 = _2421 + _3705;
    int _3717 = _2593 >> 31;
    int _3719 = _3715 >> 2;
    if (_3627)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _12190 = as_type<float>(_3713);
        out.gl_Position.z = _12190;
    }
    int _3721 = _3707 & 3;
    int _3723 = _3717 & 3;
    int _3725 = _3719 << 4;
    int _3727 = _3725 + 368;
    float _3729 = _3549 * _3703;
    int _3731 = _2593 + _3723;
    float _3733 = _3565 * _3703;
    int _3735 = _2477 + _3721;
    float _3737 = -_3729;
    float _3739 = fma(_3737, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3549);
    float _3741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3743 = _2673 >> 31;
    float _3745 = -_3733;
    float _3747 = fma(_3745, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3565);
    float _3749 = _3739 * _3739;
    int _3751 = _3731 >> 2;
    float _3753 = _3575 * _3703;
    int _3755 = _3743 & 3;
    float _3757 = fma(_3747, _3747, _3749);
    uint _3759 = uint(int(uint(_3727) >> uint(2)));
    uint _3761 = uint(int(uint(int(_3759)) >> uint(2)));
    int _3763 = int(_3759) & 3;
    float _3765 = (*spvDescriptorSet0.vp_c9)._m0[int(_3761)][_3763];
    int _3767 = int(_3759) + 1;
    uint _3769 = uint(int(uint(_3767) >> uint(2)));
    int _3771 = _3767 & 3;
    float _3773 = (*spvDescriptorSet0.vp_c9)._m0[int(_3769)][_3771];
    int _3775 = _3751 << 4;
    int _3777 = _3775 + 656;
    float _3779 = -_3753;
    float _3781 = fma(_3779, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3575);
    int _3783 = _2673 + _3755;
    bool _3785 = !_3681;
    int _3787 = _3785 ? 0 : (-1);
    int _3789 = _3783 >> 2;
    float _3791 = _3741 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    uint _3793 = uint(int(uint(_3777) >> uint(2)));
    uint _3795 = uint(int(uint(int(_3793)) >> uint(2)));
    int _3797 = int(_3793) & 3;
    float _3799 = (*spvDescriptorSet0.vp_c9)._m0[int(_3795)][_3797];
    int _3801 = int(_3793) + 1;
    uint _3803 = uint(int(uint(_3801) >> uint(2)));
    int _3805 = _3801 & 3;
    float _3807 = (*spvDescriptorSet0.vp_c9)._m0[int(_3803)][_3805];
    int _3809 = _3735 >> 2;
    bool _3811 = _2499 != 3;
    float _3813 = fma(_3791, _2887, -0.5);
    int _3815 = _3809 << 4;
    int _3817 = _3815 + 512;
    float _3819 = fma(_3781, _3781, _3757);
    bool _3821 = !_3811;
    int _3823 = _3821 ? 0 : (-1);
    float _3825 = -_3067;
    float _3827 = fma(_3057, _3813, _3825);
    bool _3829 = _2609 != 3;
    uint _3831 = uint(int(uint(_3817) >> uint(2)));
    uint _3833 = uint(int(uint(int(_3831)) >> uint(2)));
    int _3835 = int(_3831) & 3;
    float _3837 = (*spvDescriptorSet0.vp_c9)._m0[int(_3833)][_3835];
    int _3839 = int(_3831) + 1;
    uint _3841 = uint(int(uint(_3839) >> uint(2)));
    int _3843 = _3839 & 3;
    float _3845 = (*spvDescriptorSet0.vp_c9)._m0[int(_3841)][_3843];
    int _3847 = _3789 << 4;
    int _3849 = _3847 + 800;
    float _3851 = _2955 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _3853 = ~_3571;
    int _3855 = _3853 + _3623;
    int _3857 = _3855 + 1;
    float _3859 = _1619 * _3663;
    int _3861 = ~_3541;
    int _3863 = _3861 + _3605;
    int _3865 = _3863 + 1;
    float _3867 = _3851 * _3683;
    int _3869 = abs(_2497);
    float _3871 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3873 = int(_3871);
    bool _3875 = !_2409;
    int _3877 = _3875 ? _3631 : (-1);
    int _3879 = _3777 + 8;
    uint _3881 = uint(int(uint(_3879) >> uint(2)));
    uint _3883 = uint(int(uint(int(_3881)) >> uint(2)));
    int _3885 = int(_3881) & 3;
    float _3887 = (*spvDescriptorSet0.vp_c9)._m0[int(_3883)][_3885];
    int _3889 = int(_3881) + 1;
    uint _3891 = uint(int(uint(_3889) >> uint(2)));
    int _3893 = _3889 & 3;
    float _3895 = (*spvDescriptorSet0.vp_c9)._m0[int(_3891)][_3893];
    bool _3897 = !_2469;
    int _3899 = _3897 ? _3637 : (-1);
    out.m_77.x = _3859;
    out.m_77.y = _3867;
    int _3901 = _3695 ? 0 : 1;
    int _3903 = _1218 * _3865;
    int _3905 = _3903 + _1983;
    int _3907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3909 = _3907 != 0;
    int _3911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3913 = _3911 != 0;
    int _3915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3917 = _3915 != 0;
    int _3919 = _1252 * _3857;
    int _3921 = _3919 + _2173;
    int _3923 = ~_3901;
    int _3925 = _3923 + 1;
    int _3927 = _3925 + 1;
    uint _3929 = uint(int(uint(_3849) >> uint(2)));
    uint _3931 = uint(int(uint(int(_3929)) >> uint(2)));
    int _3933 = int(_3929) & 3;
    float _3935 = (*spvDescriptorSet0.vp_c9)._m0[int(_3931)][_3933];
    int _3937 = int(_3929) + 1;
    uint _3939 = uint(int(uint(_3937) >> uint(2)));
    int _3941 = _3937 & 3;
    float _3943 = (*spvDescriptorSet0.vp_c9)._m0[int(_3939)][_3941];
    int _3945 = _3927;
    if (!_3685)
    {
        int _3947 = ~_3901;
        int _3949 = _3947 + 1;
        _3945 = _3949;
    }
    int _3951 = _3945;
    float _3953 = fma(_3055, _3543, _3065);
    int _3955 = abs(_2589);
    float _3957 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3959 = int(_3957);
    int _3961 = ~_3869;
    int _3963 = _3961 + 1;
    int _3965 = _3963 + 1;
    int _3967 = abs(_2681);
    int _3969 = _3727 + 8;
    uint _3971 = uint(int(uint(_3969) >> uint(2)));
    uint _3973 = uint(int(uint(int(_3971)) >> uint(2)));
    int _3975 = int(_3971) & 3;
    float _3977 = (*spvDescriptorSet0.vp_c9)._m0[int(_3973)][_3975];
    int _3979 = int(_3971) + 1;
    uint _3981 = uint(int(uint(_3979) >> uint(2)));
    int _3983 = _3979 & 3;
    float _3985 = (*spvDescriptorSet0.vp_c9)._m0[int(_3981)][_3983];
    int _3987 = abs(_3661);
    int _3989 = _3965 * as_type<int>(_3773);
    int _3991 = abs(_3673);
    int _3993 = abs(_2739);
    int _3995 = _3817 + 8;
    uint _3997 = uint(int(uint(_3995) >> uint(2)));
    uint _3999 = uint(int(uint(int(_3997)) >> uint(2)));
    int _4001 = int(_3997) & 3;
    float _4003 = (*spvDescriptorSet0.vp_c9)._m0[int(_3999)][_4001];
    int _4005 = int(_3997) + 1;
    uint _4007 = uint(int(uint(_4005) >> uint(2)));
    int _4009 = _4005 & 3;
    float _4011 = (*spvDescriptorSet0.vp_c9)._m0[int(_4007)][_4009];
    int _4013 = ~_3991;
    int _4015 = _4013 + 1;
    int _4017 = _4015 + 1;
    int _4019 = ~_3967;
    int _4021 = _4019 + 1;
    int _4023 = _4021 + 1;
    int _4025 = ~_3987;
    int _4027 = _4025 + 1;
    int _4029 = _4027 + 1;
    int _4031 = _3849 + 8;
    uint _4033 = uint(int(uint(_4031) >> uint(2)));
    uint _4035 = uint(int(uint(int(_4033)) >> uint(2)));
    int _4037 = int(_4033) & 3;
    float _4039 = (*spvDescriptorSet0.vp_c9)._m0[int(_4035)][_4037];
    int _4041 = int(_4033) + 1;
    uint _4043 = uint(int(uint(_4041) >> uint(2)));
    int _4045 = _4041 & 3;
    float _4047 = (*spvDescriptorSet0.vp_c9)._m0[int(_4043)][_4045];
    int _4049 = abs(_3641);
    int _4051 = _4023 * as_type<int>(_3807);
    int _4053 = abs(_2665);
    int _4055 = _4017 * as_type<int>(_3765);
    int _4057 = _4055 + _3989;
    int _4059 = abs(_2519);
    int _4061 = _4029 * as_type<int>(_3799);
    int _4063 = _4061 + _4051;
    int _4065 = abs(_3677);
    int _4067 = ~_3955;
    int _4069 = _4067 + 1;
    int _4071 = _4069 + 1;
    int _4073 = abs(_2575);
    int _4075 = _4071 * as_type<int>(_3845);
    int _4077 = ~_4053;
    int _4079 = _4077 + 1;
    int _4081 = _4079 + 1;
    float _4083 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4085 = int(_4083);
    int _4087 = ~_3993;
    int _4089 = _4087 + 1;
    int _4091 = _4089 + 1;
    int _4093 = ~_4065;
    int _4095 = _4093 + 1;
    int _4097 = _4095 + 1;
    int _4099 = _4081 * as_type<int>(_3887);
    int _4101 = _4099 + _4063;
    int _4103 = ~_4049;
    int _4105 = _4103 + 1;
    int _4107 = _4105 + 1;
    int _4109 = _4091 * as_type<int>(_3943);
    int _4111 = ~_4059;
    int _4113 = _4111 + 1;
    int _4115 = _4113 + 1;
    int _4117 = _4107 * as_type<int>(_3837);
    int _4119 = _4117 + _4075;
    int _4121 = abs(_3787);
    int _4123 = _4097 * as_type<int>(_3935);
    int _4125 = _4123 + _4109;
    int _4127 = ~_4073;
    int _4129 = _4127 + 1;
    int _4131 = _4129 + 1;
    float _4133 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4135 = int(_4133);
    int _4137 = abs(_2729);
    int _4139 = _4115 * as_type<int>(_3977);
    int _4141 = _4139 + _4057;
    bool _4143 = !_3829;
    int _4145 = _4143 ? 0 : (-1);
    int _4147 = ~_4121;
    int _4149 = _4147 + 1;
    int _4151 = _4149 + 1;
    int _4153 = ~_4137;
    int _4155 = _4153 + 1;
    int _4157 = _4155 + 1;
    int _4159 = abs(_3823);
    int _4161 = _4131 * as_type<int>(_4003);
    int _4163 = _4161 + _4119;
    int _4165 = abs(_4145);
    int _4167 = _4151 * as_type<int>(_3985);
    int _4169 = _4167 + _4141;
    float _4171 = float(uint(_3959));
    int _4173 = ~_4159;
    int _4175 = _4173 + 1;
    int _4177 = _4175 + 1;
    int _4179 = abs(_3389);
    int _4181 = _4157 * as_type<int>(_4039);
    int _4183 = _4181 + _4125;
    float _4185 = float(uint(_3873));
    float _4187 = 1.0 / _4171;
    int _4189 = ~_4165;
    int _4191 = _4189 + 1;
    int _4193 = _4191 + 1;
    int _4195 = _4177 * as_type<int>(_4011);
    int _4197 = _4195 + _4163;
    int _4199 = abs(_2599);
    int _4201 = ~_4179;
    int _4203 = _4201 + 1;
    int _4205 = _4203 + 1;
    int _4207 = _4193 * as_type<int>(_3895);
    int _4209 = _4207 + _4101;
    int _4211 = abs(_3959);
    float _4213 = 1.0 / _4185;
    int _4215 = abs(_2615);
    int _4217 = _4205 * as_type<int>(_4047);
    int _4219 = _4217 + _4183;
    int _4221 = ~_4199;
    int _4223 = _4221 + 1;
    int _4225 = _4223 + 1;
    float _4227 = float(uint(_4085));
    float _4229 = float(uint(_4211));
    int _4231 = _4169 * _4225;
    int _4233 = abs(_4085);
    int _4235 = ~_4215;
    int _4237 = _4235 + 1;
    int _4239 = _4237 + 1;
    float _4241 = 1.0 / _4229;
    int _4243 = _3877 * _4199;
    int _4245 = _4243 + _4231;
    int _4247 = abs(_2693);
    int _4249 = _4239 * _4197;
    float _4251 = float(uint(_4135));
    int _4253 = abs(_3873);
    float _4255 = 1.0 / _4227;
    int _4257 = abs(_4135);
    int _4259 = _3899 * _4215;
    int _4261 = _4259 + _4249;
    int _4263 = ~_4247;
    int _4265 = _4263 + 1;
    int _4267 = _4265 + 1;
    bool _4269 = _1218 == 0;
    int _4271 = _4267 * _4209;
    int _4273 = as_type<int>(_4187) + (-2);
    float _4275 = 1.0 / _4251;
    float _4277 = float(uint(_4245));
    float _4279 = float(uint(_4233));
    float _4281 = float(uint(_4253));
    float _4283 = as_type<float>(_4273) * _4277;
    int _4285 = abs(_3529);
    float _4287 = 1.0 / _4279;
    bool _4289 = !_4269;
    int _4291 = _4289 ? _3905 : (-1);
    int _4293 = as_type<int>(_4213) + (-2);
    float _4295 = float(uint(_4261));
    bool _4297 = _1252 == 0;
    float _4299 = 1.0 / _4281;
    int _4301 = ~_4285;
    int _4303 = _4301 + 1;
    int _4305 = _4303 + 1;
    float _4307 = as_type<float>(_4293) * _4295;
    bool _4309 = !_4297;
    int _4311 = _4309 ? _3921 : (-1);
    int _4313 = as_type<int>(_4255) + (-2);
    int _4315 = _4305 * _4219;
    float _4317 = float(uint(_4257));
    float _4319 = trunc(_4283);
    float _4321 = precise::max(_4319, 0.0);
    uint _4323 = uint(_4321);
    int _4325 = _4291 * _4247;
    int _4327 = _4325 + _4271;
    int _4329 = abs(_4245);
    int _4331 = _4311 * _4285;
    int _4333 = _4331 + _4315;
    int _4335 = abs(_4261);
    float _4337 = _3953 + 0.5;
    float _4339 = float(uint(_4327));
    float _4341 = trunc(_4307);
    float _4343 = precise::max(_4341, 0.0);
    uint _4345 = uint(_4343);
    int _4347 = as_type<int>(_4275) + (-2);
    float _4349 = as_type<float>(_4313) * _4339;
    float _4351 = float(uint(_4333));
    int _4353 = as_type<int>(_4241) + (-2);
    float _4355 = 1.0 / _4317;
    float _4357 = float(uint(_4329));
    float _4359 = as_type<float>(_4347) * _4351;
    int _4361 = ~_3959;
    int _4363 = _4361 + 1;
    float _4365 = _3827 + 0.5;
    int _4367 = as_type<int>(_4299) + (-2);
    float _4369 = as_type<float>(_4353) * _4357;
    int _4371 = ~_3873;
    int _4373 = _4371 + 1;
    float _4375 = trunc(_4349);
    float _4377 = precise::max(_4375, 0.0);
    uint _4379 = uint(_4377);
    int _4381 = _4363 * int(_4323);
    int _4383 = _4381 + _4245;
    out.m_79.x = _4337;
    out.m_79.y = _4365;
    int _4385 = abs(_4327);
    int _4387 = as_type<int>(_4287) + (-2);
    float _4389 = float(uint(_4383));
    float _4391 = trunc(_4359);
    float _4393 = precise::max(_4391, 0.0);
    uint _4395 = uint(_4393);
    float _4397 = float(uint(_4335));
    int _4399 = as_type<int>(_4355) + (-2);
    bool _4401 = !_3913;
    int _4403 = _4401 ? 0 : 1;
    float _4405 = as_type<float>(_4367) * _4397;
    int _4407 = _4373 * int(_4345);
    int _4409 = _4407 + _4261;
    bool _4411 = !_3909;
    int _4413 = _4411 ? 0 : 1;
    float _4415 = trunc(_4369);
    float _4417 = precise::max(_4415, 0.0);
    uint _4419 = uint(_4417);
    int _4421 = abs(_4333);
    float _4423 = as_type<float>(_4273) * _4389;
    float _4425 = float(uint(_4409));
    float _4427 = float(uint(_4421));
    float _4429 = in.m_81.x;
    float _4431 = in.m_81.y;
    float _4433 = in.m_81.z;
    float _4435 = float(uint(_4385));
    float _4437 = as_type<float>(_4293) * _4425;
    float _4439 = trunc(_4405);
    float _4441 = precise::max(_4439, 0.0);
    uint _4443 = uint(_4441);
    float _4445 = as_type<float>(_4399) * _4427;
    int _4447 = abs(_4403);
    float _4449 = as_type<float>(_4387) * _4435;
    int _4451 = abs(_4413);
    int _4453 = ~_4135;
    int _4455 = _4453 + 1;
    float _4457 = trunc(_4449);
    float _4459 = precise::max(_4457, 0.0);
    uint _4461 = uint(_4459);
    float _4463 = float(_3177);
    float _4465 = float(_4447);
    int _4467 = _4455 * int(_4395);
    int _4469 = _4467 + _4333;
    int _4471 = ~_4085;
    int _4473 = _4471 + 1;
    int _4475 = ~_4211;
    int _4477 = _4475 + 1;
    float _4479 = _4465 * _4463;
    float _4481 = float(_3951);
    int _4483 = _4473 * int(_4379);
    int _4485 = _4483 + _4327;
    float _4487 = float(_4451);
    float _4489 = trunc(_4445);
    float _4491 = precise::max(_4489, 0.0);
    uint _4493 = uint(_4491);
    float _4495 = float(uint(_4469));
    float _4497 = _4487 * _4481;
    float _4499 = float(uint(_4485));
    int _4501 = _4477 * int(_4419);
    int _4503 = _4501 + _4329;
    int _4505 = ~_4253;
    int _4507 = _4505 + 1;
    float _4509 = _4497 * (-2.0);
    float _4511 = as_type<float>(_4347) * _4495;
    float _4513 = as_type<float>(_4313) * _4499;
    float _4515 = float(uint(_4503));
    int _4517 = _4507 * int(_4443);
    int _4519 = _4517 + _4335;
    int _4521 = ~_4233;
    int _4523 = _4521 + 1;
    float _4525 = trunc(_4423);
    float _4527 = precise::max(_4525, 0.0);
    uint _4529 = uint(_4527);
    float _4531 = fma(_3645, _4509, _3645);
    float _4533 = fma(_4509, _4429, _4429);
    float _4535 = as_type<float>(_4353) * _4515;
    float _4537 = _1427 + (-0.5);
    float _4539 = float(uint(_4519));
    int _4541 = _4523 * int(_4461);
    int _4543 = _4541 + _4385;
    int _4545 = ~_3873;
    int _4547 = _4545 + 1;
    float _4549 = trunc(_4511);
    float _4551 = precise::max(_4549, 0.0);
    uint _4553 = uint(_4551);
    int _4555 = ~_4257;
    int _4557 = _4555 + 1;
    float _4559 = fma(_4537, (*spvDescriptorSet0.vp_c9)._m0[196].x, _4533);
    float _4561 = as_type<float>(_4367) * _4539;
    float _4563 = float(uint(_4543));
    float _4565 = fma(_4531, _3083, _4559);
    float _4567 = trunc(_4513);
    float _4569 = precise::max(_4567, 0.0);
    uint _4571 = uint(_4569);
    float _4573 = as_type<float>(_4387) * _4563;
    int _4575 = int(_4323) + int(_4529);
    int _4577 = _4557 * int(_4493);
    int _4579 = _4577 + _4421;
    int _4581 = ~_3959;
    int _4583 = _4581 + 1;
    int _4585 = ~_4135;
    int _4587 = _4585 + 1;
    float _4589 = trunc(_4437);
    float _4591 = precise::max(_4589, 0.0);
    uint _4593 = uint(_4591);
    int _4595 = int(_4395) + int(_4553);
    int _4597 = _4583 * _4575;
    int _4599 = _4597 + _4245;
    float _4601 = float(uint(_4579));
    bool _4603 = _4135 == 0;
    bool _4605 = uint(_4599) >= uint(_3959);
    float _4607 = trunc(_4561);
    float _4609 = precise::max(_4607, 0.0);
    uint _4611 = uint(_4609);
    int _4613 = int(_4379) + int(_4571);
    float _4615 = as_type<float>(_4399) * _4601;
    bool _4617 = !_3917;
    int _4619 = _4617 ? 0 : 1;
    float _4621 = trunc(_4535);
    float _4623 = precise::max(_4621, 0.0);
    uint _4625 = uint(_4623);
    int _4627 = ~_4085;
    int _4629 = _4627 + 1;
    int _4631 = int(_4345) + int(_4593);
    int _4633 = _4629 * _4613;
    int _4635 = _4633 + _4327;
    float _4637 = trunc(_4573);
    float _4639 = precise::max(_4637, 0.0);
    uint _4641 = uint(_4639);
    int _4643 = int(_4443) + int(_4611);
    int _4645 = _4547 * _4631;
    int _4647 = _4645 + _4261;
    int _4649 = ~_4211;
    int _4651 = _4649 + 1;
    int _4653 = _4587 * _4595;
    int _4655 = _4653 + _4333;
    bool _4657 = uint(_4635) >= uint(_4085);
    int _4659 = ~_4253;
    int _4661 = _4659 + 1;
    float _4663 = trunc(_4615);
    float _4665 = precise::max(_4663, 0.0);
    uint _4667 = uint(_4665);
    int _4669 = int(_4419) + int(_4625);
    int _4671 = ~_4233;
    int _4673 = _4671 + 1;
    int _4675 = _4661 * _4643;
    int _4677 = _4675 + _4335;
    bool _4679 = uint(_4647) >= uint(_3873);
    int _4681 = _4651 * _4669;
    int _4683 = _4681 + _4329;
    bool _4685 = uint(_4655) >= uint(_4135);
    float _4687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _4689 = int(_4461) + int(_4641);
    int _4691 = ~_4257;
    int _4693 = _4691 + 1;
    int _4695 = _4673 * _4689;
    int _4697 = _4695 + _4385;
    bool _4699 = !_4605;
    int _4701 = _4699 ? 0 : (-1);
    bool _4703 = uint(_4683) >= uint(_4211);
    bool _4705 = !_4679;
    int _4707 = _4705 ? 0 : (-1);
    bool _4709 = uint(_4677) >= uint(_4253);
    bool _4711 = !_4657;
    int _4713 = _4711 ? 0 : (-1);
    float _4715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4717 = uint(_4697) >= uint(_4233);
    bool _4719 = !_4685;
    int _4721 = _4719 ? 0 : (-1);
    int _4723 = ~_4575;
    int _4725 = _4723 + _4701;
    int _4727 = _4725 + 1;
    int _4729 = int(_4493) + int(_4667);
    int _4731 = ~_4631;
    int _4733 = _4731 + _4707;
    int _4735 = _4733 + 1;
    int _4737 = _3959 * _4727;
    int _4739 = _4737 + _4245;
    int _4741 = ~_4595;
    int _4743 = _4741 + _4721;
    int _4745 = _4743 + 1;
    float _4747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    int _4749 = ~_4613;
    int _4751 = _4749 + _4713;
    int _4753 = _4751 + 1;
    int _4755 = _4693 * _4729;
    int _4757 = _4755 + _4421;
    bool _4759 = !_4703;
    int _4761 = _4759 ? 0 : (-1);
    int _4763 = _3873 * _4735;
    int _4765 = _4763 + _4261;
    bool _4767 = _3959 == 0;
    int _4769 = _4085 * _4753;
    int _4771 = _4769 + _4327;
    int _4773 = _4245 ^ _3959;
    float _4775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4777 = !_4717;
    int _4779 = _4777 ? 0 : (-1);
    int _4781 = _4135 * _4745;
    int _4783 = _4781 + _4333;
    bool _4785 = _3873 == 0;
    bool _4787 = !_4767;
    int _4789 = _4787 ? _4739 : (-1);
    bool _4791 = _4085 == 0;
    float _4793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _4795 = uint(int(uint(_4773) >> uint(31)));
    bool _4797 = uint(_4757) >= uint(_4257);
    bool _4799 = !_4785;
    int _4801 = _4799 ? _4765 : (-1);
    float _4803 = _4687 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4805 = !_4791;
    int _4807 = _4805 ? _4771 : (-1);
    int _4809 = ~_4761;
    int _4811 = _4669 + _4809;
    int _4813 = _4811 + 1;
    float _4815 = fma(_4803, _1625, -0.5);
    float _4817 = float(_4789);
    float _4819 = _4775 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4821 = ~int(_4795);
    int _4823 = _4821 + 1;
    bool _4825 = !_4603;
    int _4827 = _4825 ? _4783 : (-1);
    float _4829 = fma(_4803, _4817, _3053);
    int _4831 = _4261 ^ _3873;
    float _4833 = _4747 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    bool _4835 = _4085 == 0;
    float _4837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4839 = _4327 ^ _4085;
    float _4841 = _4715 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4843 = _4333 ^ _4135;
    float _4845 = fma(_4833, _2393, -0.5);
    float _4847 = float(_4801);
    float _4849 = fma(_4841, _1719, -0.5);
    int _4851 = _4813 ^ _4823;
    float _4853 = fma(_4819, _1555, -0.5);
    float _4855 = float(_4827);
    float _4857 = fma(_4841, _4847, _3071);
    bool _4859 = !_4709;
    int _4861 = _4859 ? 0 : (-1);
    float _4863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4865 = !_4797;
    int _4867 = _4865 ? 0 : (-1);
    float _4869 = fma(_4833, _4855, _3037);
    uint _4871 = uint(int(uint(_4831) >> uint(31)));
    float _4873 = fma(_3059, _4849, _4857);
    uint _4875 = uint(int(uint(_4839) >> uint(31)));
    float _4877 = fma(_3031, _4815, _4829);
    uint _4879 = uint(int(uint(_4843) >> uint(31)));
    float _4881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _4883 = _3959 == 0;
    float _4885 = fma(_3047, _4845, _4869);
    int _4887 = ~_4823;
    int _4889 = _4887 + _4851;
    int _4891 = _4889 + 1;
    bool _4893 = _4135 == 0;
    int _4895 = ~_4861;
    int _4897 = _4643 + _4895;
    int _4899 = _4897 + 1;
    int _4901 = ~_4779;
    int _4903 = _4689 + _4901;
    int _4905 = _4903 + 1;
    int _4907 = ~_4867;
    int _4909 = _4729 + _4907;
    int _4911 = _4909 + 1;
    int _4913 = ~int(_4871);
    int _4915 = _4913 + 1;
    int _4917 = ~int(_4875);
    int _4919 = _4917 + 1;
    float _4921 = _4881 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _4923 = ~int(_4879);
    int _4925 = _4923 + 1;
    float _4927 = float(_4807);
    float _4929 = fma(_4921, _2771, -0.5);
    bool _4931 = !_4883;
    int _4933 = _4931 ? _4891 : (-1);
    int _4935 = _4899 ^ _4915;
    float _4937 = fma(_4819, _4927, _3077);
    int _4939 = _4905 ^ _4919;
    float _4941 = _4793 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4943 = _4911 ^ _4925;
    float _4945 = _4837 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4947 = float(_4933);
    float _4949 = fma(_4941, _2675, -0.5);
    bool _4951 = _3873 == 0;
    float _4953 = _4863 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _4955 = ~_4915;
    int _4957 = _4955 + _4935;
    int _4959 = _4957 + 1;
    float _4961 = -_3041;
    float _4963 = fma(_4941, _4947, _4961);
    int _4965 = ~_4919;
    int _4967 = _4965 + _4939;
    int _4969 = _4967 + 1;
    float _4971 = fma(_4945, _2759, -0.5);
    int _4973 = ~_4925;
    int _4975 = _4973 + _4943;
    int _4977 = _4975 + 1;
    float _4979 = fma(_3045, _4853, _4937);
    bool _4981 = !_4951;
    int _4983 = _4981 ? _4959 : (-1);
    float _4985 = fma(_3007, _4949, _4963);
    bool _4987 = !_4835;
    int _4989 = _4987 ? _4969 : (-1);
    float _4991 = _4979 + 0.5;
    bool _4993 = !_4893;
    int _4995 = _4993 ? _4977 : (-1);
    float _4997 = float(_4983);
    float _4999 = float(_4989);
    float _5001 = fma(_4953, _2773, -0.5);
    float _5003 = float(_4995);
    float _5005 = -_3073;
    float _5007 = fma(_4945, _4997, _5005);
    float _5009 = _4479 * (-2.0);
    float _5011 = -_3079;
    float _5013 = fma(_4953, _4999, _5011);
    float _5015 = _4885 + 0.5;
    float _5017 = -_3039;
    float _5019 = fma(_4921, _5003, _5017);
    float _5021 = fma(_3061, _4971, _5007);
    float _5023 = fma(_3043, _5001, _5013);
    float _5025 = _4877 + 0.5;
    float _5027 = fma(_3049, _4929, _5019);
    float _5029 = _4873 + 0.5;
    float _5031 = _4985 + 0.5;
    float _5033 = _5021 + 0.5;
    float _5035 = _5023 + 0.5;
    float _5037 = _5027 + 0.5;
    float _5039 = fma(_3697, _5009, _3697);
    float _5041 = fma(_5009, _4431, _4431);
    out.m_83.x = _5025;
    out.m_83.y = _5031;
    out.m_83.z = _5029;
    out.m_83.w = _5033;
    out.m_85.x = _4991;
    out.m_85.y = _5035;
    out.m_87.x = _5015;
    out.m_87.y = _5037;
    int _5043 = as_type<int>(_5029);
    if (_3627)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5045 = -_3729;
    float _5047 = fma(_5045, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3461);
    float _5049 = -_3733;
    float _5051 = fma(_5049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3445);
    float _5053 = -_3753;
    float _5055 = fma(_5053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3483);
    int _5057 = abs(_4619);
    float _5059 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5061 = _5047 + _5059;
    float _5063 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5065 = _5051 + _5063;
    float _5067 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5069 = _5055 + _5067;
    float _5071 = float(_3491);
    float _5073 = _5061 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5075 = float(_5057);
    float _5077 = _1427 + _1439;
    float _5079 = fma(_3679, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5041);
    float _5081 = fma(_5065, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5073);
    float _5083 = _1439 + (-0.5);
    float _5085 = _5075 * _5071;
    float _5087 = _5077 + (-1.0);
    float _5089 = fma(_5069, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5081);
    float _5091 = fma(_5039, _3083, _5079);
    float _5093 = _5085 * (-2.0);
    float _5095 = _4565 * 0.15915493667125701904296875;
    float _5097 = sqrt(_3819);
    bool _5099 = _5089 >= 0.0;
    float _5101 = fma(_5093, _4433, _4433);
    float _5103 = _5091 * 0.15915493667125701904296875;
    float _5105 = fma(_5083, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5101);
    float _5107 = fma(_5087, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5109 = _5095 * 6.283185482025146484375;
    float _5111 = sin(_5109);
    float _5113 = fma(_5107, _5093, _5107);
    float _5115 = _5085;
    float _5117 = _5051;
    float _5119 = _5069;
    if (_5099)
    {
        _5115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5121 = _5115;
    if (_5099)
    {
        out.m_51.x = 0.0;
    }
    float _5123 = fma(_5113, _3083, _5105);
    float _5125 = _5103 * 6.283185482025146484375;
    float _5127 = sin(_5125);
    if (_5099)
    {
        float _5129 = _5121 * 5.0;
        _5043 = as_type<int>(_5129);
    }
    int _5131 = _5043;
    float _5133 = _5123 * 0.15915493667125701904296875;
    if (_5099)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14185 = as_type<float>(_5131);
        out.gl_Position.z = _14185;
    }
    float _5135 = _5095 * 6.283185482025146484375;
    float _5137 = cos(_5135);
    float _5139 = _5103 * 6.283185482025146484375;
    float _5141 = cos(_5139);
    float _5143 = _5111 * _5127;
    float _5145 = _5133 * 6.283185482025146484375;
    float _5147 = sin(_5145);
    if (_5099)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5149 = -_3461;
    float _5151 = _5149 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5153 = -_3445;
    float _5155 = _5153 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5157 = in.m_89.x;
    float _5159 = in.m_89.y;
    float _5161 = in.m_89.z;
    float _5163 = -_3483;
    float _5165 = _5163 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5167 = _5151 * _5151;
    float _5169 = _5133 * 6.283185482025146484375;
    float _5171 = cos(_5169);
    float _5173 = _5137 * _5141;
    float _5175 = _592 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5177 = fma(_5155, _5155, _5167);
    float _5179 = fma(_5147, _5173, _5143);
    float _5181 = fma(_5147, _5143, _5173);
    float _5183 = fma(_5165, _5165, _5177);
    float _5185 = _3703 * _5097;
    float _5187 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5189 = _5137 * _5127;
    float _5191 = rsqrt(_5183);
    float _5193 = _5111 * _5141;
    float _5195 = _5137 * _5171;
    float _5197 = _5141 * _5171;
    float _5199 = _5111 * _5171;
    float _5201 = _5127 * _5171;
    float _5203 = _5185 * _5187;
    float _5205 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5157);
    float _5207 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5209 = _5185 * _5175;
    float _5211 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5159);
    float _5213 = _5205 * _5203;
    float _5215 = -_5189;
    float _5217 = fma(_5147, _5193, _5215);
    float _5219 = _5155 * _5191;
    float _5221 = -_5193;
    float _5223 = fma(_5147, _5189, _5221);
    float _5225 = _5185 * _5207;
    float _5227 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5161);
    float _5229 = _5165 * _5191;
    float _5231 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5233 = _5219 * _5231;
    float _5235 = _5211 * _5209;
    float _5237 = _5227 * _5225;
    float _5239 = in.m_91.x;
    float _5241 = in.m_91.y;
    float _5243 = in.m_91.z;
    float _5245 = _5151 * _5191;
    float _5247 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5249 = _5229 * _5247;
    float _5251 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5253 = -_5233;
    float _5255 = fma(_5229, _5251, _5253);
    bool _5257 = _5159 != 0.0;
    bool _5259 = isnan(_5159);
    bool _5261 = _5257 || _5259;
    bool _5263 = isnan(0.0);
    bool _5265 = _5261 || _5263;
    float _5267 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5269 = _5245 * _5267;
    float _5271 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5273 = -_5249;
    float _5275 = fma(_5245, _5271, _5273);
    float _5277 = _5255 * _5255;
    bool _5279 = _5157 == 0.0;
    bool _5281 = !_5265;
    bool _5283 = _5279 && _5281;
    float _5285 = in.m_93.x;
    float _5287 = in.m_93.y;
    float _5289 = in.m_93.z;
    float _5291 = in.m_93.w;
    float _5293 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5295 = -_5269;
    float _5297 = fma(_5219, _5293, _5295);
    float _5299 = fma(_5275, _5275, _5277);
    bool _5301 = _5161 == 0.0;
    bool _5303 = _5301 && _5283;
    float _5305 = -_5235;
    float _5307 = _5147 * _5305;
    float _5309 = _5195 * _5235;
    float _5311 = fma(_5297, _5297, _5299);
    float _5313 = _5199 * _5235;
    float _5315 = fma(_5197, _5213, _5307);
    float _5317 = fma(_5179, _5213, _5309);
    float _5319 = fma(_5217, _5213, _5313);
    float _5321 = rsqrt(_5311);
    float _5323 = fma(_5201, _5237, _5315);
    float _5325 = fma(_5223, _5237, _5317);
    float _5327 = fma(_5181, _5237, _5319);
    float _5329 = _5213;
    float _5331 = _5307;
    float _5333 = _5309;
    float _5335 = _5155;
    float _5337 = _5239;
    float _5339 = _5181;
    if (_5303)
    {
        _5329 = _5239;
    }
    float _5341 = _5329;
    float _5343 = _5341;
    if (_5303)
    {
        _5331 = _5243;
    }
    float _5345 = _5331;
    float _5347 = _5345;
    if (_5303)
    {
        _5333 = _5341;
    }
    float _5349 = _5333;
    float _5351 = _5349;
    if (!_5303)
    {
        _5343 = _5239;
    }
    float _5353 = _5343;
    if (_5303)
    {
        _5335 = _5241;
    }
    float _5355 = _5335;
    float _5357 = _5355;
    if (!_5303)
    {
        float _5359 = fma(_5159, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5241);
        _5357 = _5359;
    }
    float _5361 = _5357;
    if (_5303)
    {
        _5337 = _5345;
    }
    float _5363 = _5337;
    float _5365 = _5289 * _5353;
    float _5367 = _5363;
    if (!_5303)
    {
        _5347 = _5243;
    }
    float _5369 = _5347;
    float _5371 = _5275 * _5321;
    float _5373 = _5255 * _5321;
    if (!_5303)
    {
        float _5375 = fma(_5157, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5353);
        _5351 = _5375;
    }
    float _5377 = _5351;
    float _5379 = _5285 * _5241;
    float _5381 = -_5365;
    float _5383 = fma(_5285, _5369, _5381);
    float _5385 = _5287 * _5369;
    float _5387 = _5297 * _5321;
    float _5389 = _5229 * _5373;
    float _5391 = _5245 * _5371;
    if (!_5303)
    {
        float _5393 = fma(_5161, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5369);
        _5367 = _5393;
    }
    float _5395 = _5367;
    float _5397 = -_5385;
    float _5399 = fma(_5289, _5241, _5397);
    float _5401 = -_5379;
    float _5403 = fma(_5287, _5353, _5401);
    float _5405 = -_5389;
    float _5407 = fma(_5245, _5387, _5405);
    float _5409 = -_5391;
    float _5411 = fma(_5219, _5373, _5409);
    float _5413 = _5383 * _5291;
    float _5415 = _5399 * _5291;
    float _5417 = _5407 * _5325;
    float _5419 = _5411 * _5325;
    float _5421 = _5403 * _5291;
    float _5423 = _5219 * _5387;
    float _5425 = fma(_5371, _5323, _5417);
    float _5427 = fma(_5387, _5323, _5419);
    float _5429 = _5179 * _5407;
    float _5431 = -_5423;
    float _5433 = fma(_5229, _5371, _5431);
    float _5435 = fma(_5219, _5327, _5425);
    float _5437 = fma(_5229, _5327, _5427);
    float _5439 = _5179 * _5411;
    float _5441 = _5179 * _5433;
    float _5443 = _3445 + _5435;
    float _5445 = _3483 + _5437;
    float _5447 = _5433 * _5325;
    float _5449 = fma(_5197, _5373, _5441);
    float _5451 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5453 = _5443 + _5451;
    float _5455 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5457 = _5445 + _5455;
    float _5459 = _5195 * _5407;
    float _5461 = _5195 * _5433;
    float _5463 = _5453 * _5453;
    float _5465 = _5457 * _5457;
    float _5467 = _5195 * _5411;
    float _5469 = _5223 * _5407;
    float _5471 = _5223 * _5411;
    float _5473 = _5463 + _5465;
    float _5475 = _5223 * _5433;
    float _5477 = fma(_5201, _5371, _5469);
    float _5479 = -_5147;
    float _5481 = fma(_5479, _5373, _5461);
    float _5483 = sqrt(_5473);
    float _5485 = fma(_5201, _5373, _5475);
    float _5487 = fma(_5373, _5323, _5447);
    float _5489 = -_5147;
    float _5491 = fma(_5489, _5371, _5459);
    float _5493 = -_5147;
    float _5495 = fma(_5493, _5387, _5467);
    float _5497 = fma(_5197, _5371, _5429);
    float _5499 = fma(_5245, _5327, _5487);
    float _5501 = fma(_5197, _5387, _5439);
    float _5503 = fma(_5201, _5387, _5471);
    float _5505 = fma(_5199, _5219, _5491);
    float _5507 = fma(_5199, _5245, _5481);
    float _5509 = fma(_5199, _5229, _5495);
    float _5511 = _3461 + _5499;
    float _5513 = fma(_5217, _5219, _5497);
    float _5515 = fma(_5217, _5245, _5449);
    float _5517 = fma(_5217, _5229, _5501);
    bool _5519 = _5483 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5521 = fma(_5181, _5229, _5503);
    float _5523 = _5505 * _5287;
    float _5525 = _5507 * _5287;
    float _5527 = _5509 * _5287;
    float _5529 = _5507 * _5361;
    float _5531 = fma(_5181, _5219, _5477);
    float _5533 = fma(_5181, _5245, _5485);
    float _5535 = _5505 * _5361;
    float _5537 = _5413 * _5505;
    float _5539 = _5413 * _5507;
    float _5541 = _5413 * _5509;
    float _5543 = _5509 * _5361;
    float _5545 = _5449;
    float _5547 = _5505;
    float _5549 = _5477;
    float _5551 = _5413;
    float _5553 = _5421;
    if (!_5519)
    {
        _5545 = _5465;
    }
    float _5555 = _5545;
    float _5557 = _5555;
    if (!_5519)
    {
        _5547 = _5463;
    }
    float _5559 = _5547;
    float _5561 = _5559;
    if (!_5519)
    {
        _5339 = _5443;
    }
    float _5563 = _5339;
    float _5565 = _5563;
    if (!_5519)
    {
        _5549 = _5445;
    }
    float _5567 = _5549;
    float _5569 = _5567;
    if (!_5519)
    {
        _5551 = _5511;
    }
    float _5571 = _5551;
    bool _5573 = !_5519;
    float _5575 = _5571;
    if (!_5573)
    {
        float _5577 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5579 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5581 = _5483 + _5579;
        float _5583 = rsqrt(_5473);
        float _5585 = _5581 * _5577;
        float _5587 = _5511 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5589 = _5585 * 0.15915493667125701904296875;
        float _5591 = _5589 * 6.283185482025146484375;
        float _5593 = sin(_5591);
        float _5595 = _5589 * 6.283185482025146484375;
        float _5597 = cos(_5595);
        float _5599 = fma(_5593, _5587, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5601 = _5583 * _5599;
        float _5603 = _5597 + (-1.0);
        float _5605 = fma(_5453, _5601, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5607 = fma(_5457, _5601, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5609 = _5603 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5611 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5613 = _5605 + _5611;
        float _5615 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5617 = _5607 + _5615;
        float _5619 = fma(_5511, _5597, _5609);
        float _5621 = _5613 * _5613;
        float _5623 = _5617 * _5617;
        _5575 = _5619;
        _5561 = _5621;
        _5557 = _5623;
        _5565 = _5605;
        _5569 = _5607;
    }
    float _5625 = _5575;
    float _5627 = _5561;
    float _5629 = _5557;
    float _5631 = _5565;
    float _5633 = _5569;
    float _5635 = fma(_5513, _5285, _5523);
    float _5637 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5639 = _5625 + _5637;
    float _5641 = fma(_5513, _5377, _5535);
    float _5643 = fma(_5517, _5377, _5543);
    float _5645 = fma(_5515, _5285, _5525);
    float _5647 = fma(_5639, _5639, _5627);
    float _5649 = fma(_5515, _5377, _5529);
    float _5651 = fma(_5415, _5515, _5539);
    float _5653 = fma(_5517, _5285, _5527);
    float _5655 = _5647 + _5629;
    float _5657 = fma(_5415, _5513, _5537);
    float _5659 = fma(_5415, _5517, _5541);
    float _5661 = fma(_5531, _5289, _5635);
    float _5663 = fma(_5533, _5289, _5645);
    float _5665 = fma(_5533, _5395, _5649);
    float _5667 = sqrt(_5655);
    float _5669 = fma(_5521, _5289, _5653);
    float _5671 = fma(_5531, _5395, _5641);
    float _5673 = fma(_5421, _5531, _5657);
    float _5675 = fma(_5421, _5533, _5651);
    float _5677 = fma(_5421, _5521, _5659);
    float _5679 = fma(_5521, _5395, _5643);
    out.m_95.x = _5661;
    out.m_95.y = _5663;
    out.m_95.z = _5669;
    out.m_97.x = _5673;
    out.m_97.y = _5675;
    out.m_97.z = _5677;
    out.m_99.x = _5671;
    out.m_99.y = _5665;
    out.m_99.z = _5679;
    bool _5681 = _5667 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5683 = isnan(_5667);
    bool _5685 = _5681 || _5683;
    bool _5687 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5689 = _5685 || _5687;
    float _5691 = _5641;
    if (!_5689)
    {
        _5553 = 1.0;
    }
    float _5693 = _5553;
    bool _5695 = !_5689;
    float _5697 = _5693;
    if (!_5695)
    {
        bool _5699 = _5667 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5701 = isnan(_5667);
        bool _5703 = _5699 || _5701;
        bool _5705 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5707 = _5703 || _5705;
        if (!_5707)
        {
            float _5709 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5711 = _5667 + _5709;
            float _5713 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5715 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5713;
            float _5717 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5719 = _5717 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5721 = 1.0 / _5715;
            float _5723 = _5711 * _5721;
            float _5725 = fma(_5723, _5719, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5697 = _5725;
            _5727 = true;
        }
        else
        {
            bool _5729 = _5667 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5731 = isnan(_5667);
            bool _5733 = _5729 || _5731;
            bool _5735 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5737 = _5733 || _5735;
            if (!_5737)
            {
                float _5739 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5741 = _5667 + _5739;
                float _5743 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5745 = _5743 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5747 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5749 = _5747 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5751 = 1.0 / _5745;
                float _5753 = _5741 * _5751;
                float _5755 = fma(_5753, _5749, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5697 = _5755;
                _5727 = true;
            }
            else
            {
                _5697 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5727 = false;
    float _5757 = _5697;
    float _5759 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5761 = _5625 + _5759;
    float _5763 = _5047 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5765 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5767 = _5631 + _5765;
    float _5769 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5771 = _5633 + _5769;
    float _5773 = fma(_5761, _5757, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5775 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5763);
    float _5777 = fma(_5767, _5757, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5779 = fma(_5771, _5757, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5781 = -_3461;
    float _5783 = _5781 + _5773;
    float _5785 = fma(_5055, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5775);
    float _5787 = -_3445;
    float _5789 = _5787 + _5777;
    float _5791 = _5047 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5793 = _5783 * _5783;
    float _5795 = _5785 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5797 = -_3483;
    float _5799 = _5797 + _5779;
    float _5801 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5791);
    float _5803 = fma(_5789, _5789, _5793);
    float _5805 = 1.0 / _5795;
    float _5807 = fma(_5055, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5801);
    float _5809 = fma(_5799, _5799, _5803);
    float _5811 = _5807 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5813 = sqrt(_5809);
    float _5815 = _5811 + _5795;
    float _5817 = _5815 * _5805;
    float _5819 = _5817 * 0.5;
    float _5821 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5823 = fma(_5819, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5821);
    bool _5825 = _5813 > 0.0;
    float _5827 = 1.0 / _5823;
    bool _5829 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5831 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5833 = _5829 || _5831;
    bool _5835 = isnan(0.5);
    bool _5837 = _5833 || _5835;
    bool _5839 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5841 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5843 = _5839 || _5841;
    bool _5845 = isnan(0.5);
    bool _5847 = _5843 || _5845;
    float _5849 = _5819;
    float _5851 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5853 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5855 = _5777;
    if (!_5825)
    {
        _5849 = _5777;
    }
    float _5857 = _5849;
    float _5859 = _5857;
    float _5861 = _5857;
    if (!_5825)
    {
        _5851 = _5773;
    }
    float _5863 = _5851;
    float _5865 = _5863;
    if (!_5825)
    {
        _5853 = _5779;
    }
    float _5867 = _5853;
    bool _5869 = !_5825;
    float _5871 = _5867;
    float _5873 = _5827;
    if (!_5869)
    {
        float _5875 = _226 * _226;
        float _5877 = fma(_222, _222, _5875);
        float _5879 = fma(_228, _228, _5877);
        float _5881 = rsqrt(_5809);
        float _5883 = sqrt(_5879);
        float _5885 = _5789 * _5881;
        float _5887 = _5783 * _5881;
        float _5889 = _5799 * _5881;
        bool _5891 = _5883 > 0.0;
        float _5893 = _5883;
        float _5895 = _5881;
        if (!_5891)
        {
            _5859 = _5777;
        }
        float _5897 = _5859;
        _5861 = _5897;
        if (!_5891)
        {
            _5893 = _5773;
        }
        float _5899 = _5893;
        _5865 = _5899;
        if (!_5891)
        {
            _5895 = _5779;
        }
        float _5901 = _5895;
        bool _5903 = !_5891;
        _5871 = _5901;
        if (!_5903)
        {
            float _5905 = rsqrt(_5879);
            float _5907 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5909 = _226 * _5905;
            float _5911 = _222 * _5905;
            float _5913 = _228 * _5905;
            float _5915 = _5887 * _5909;
            float _5917 = fma(_5885, _5911, _5915);
            float _5919 = _5907 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5921 = fma(_5889, _5913, _5917);
            float _5923 = _5921 * _5919;
            float _5925 = fma(_222, _5923, _5777);
            float _5927 = fma(_226, _5923, _5773);
            float _5929 = fma(_228, _5923, _5779);
            _5861 = _5925;
            _5865 = _5927;
            _5871 = _5929;
        }
    }
    float _5931 = _5861;
    float _5933 = _5865;
    float _5935 = _5871;
    float _5937 = -_3733;
    float _5939 = fma(_5937, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5931);
    float _5941 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5943 = _5827 * _5941;
    float _5945 = -_3729;
    float _5947 = fma(_5945, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5933);
    float _5949 = -_3753;
    float _5951 = fma(_5949, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5935);
    float _5953 = _5947;
    float _5955 = _5951;
    if (_5837)
    {
        _5855 = 1.0;
    }
    float _5957 = _5855;
    float _5959 = _5957;
    if (_5847)
    {
        _5873 = _5939;
    }
    float _5961 = _5873;
    float _5963 = _5961;
    if (!_5847)
    {
        float _5965 = _5061 * _5061;
        float _5967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5969 = -_3483;
        float _5971 = _5969 + _5935;
        float _5973 = -_3445;
        float _5975 = _5973 + _5931;
        float _5977 = fma(_5065, _5065, _5965);
        float _5979 = fma(_5069, _5069, _5977);
        float _5981 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5983 = sqrt(_5979);
        float _5985 = 1.0 / _5185;
        float _5987 = _5981 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5989 = precise::min(_5983, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5991 = _5989 * _5967;
        float _5993 = -_3461;
        float _5995 = _5993 + _5933;
        float _5997 = _5991 * _5985;
        float _5999 = _5987 * _5997;
        float _6001 = _5971 * _5997;
        float _6003 = fma(_5995, _5999, _5047);
        float _6005 = fma(_5975, _5999, _5051);
        float _6007 = fma(_5987, _6001, _5055);
        _5953 = _6003;
        _5963 = _6005;
        _5955 = _6007;
    }
    float _6009 = _5953;
    float _6011 = _5963;
    float _6013 = _5955;
    if (!_5837)
    {
        float _6015 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6017 = _6015 * 0.15915493667125701904296875;
        float _6019 = _6017 * 6.283185482025146484375;
        float _6021 = cos(_6019);
        float _6023 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6025 = _6023 * 0.15915493667125701904296875;
        float _6027 = _6017 * 6.283185482025146484375;
        float _6029 = sin(_6027);
        float _6031 = 1.0 / _6021;
        float _6033 = _6025 * 6.283185482025146484375;
        float _6035 = cos(_6033);
        float _6037 = _6029 * _6031;
        float _6039 = _6025 * 6.283185482025146484375;
        float _6041 = sin(_6039);
        float _6043 = _6035 * _6037;
        float _6045 = 1.0 / _6043;
        float _6047 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6049 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6047;
        float _6051 = 1.0 / _6049;
        float _6053 = _6041 * _6045;
        float _6055 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6057 = fma(_5943, _6053, _6055);
        float _6059 = _6057 * _6051;
        float _6061 = precise::clamp(_6059, 0.0, 1.0);
        _5959 = _6061;
    }
    float _6063 = _5959;
    float _6065 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6067 = _6009 + _6065;
    float _6069 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6071 = _6011 + _6069;
    float _6073 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6075 = _6013 + _6073;
    float _6077 = _6067 * _6067;
    float _6079 = fma(_6071, _6071, _6077);
    float _6081 = fma(_5051, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6083 = fma(_6075, _6075, _6079);
    float _6085 = rsqrt(_6083);
    float _6087 = sqrt(_6083);
    float _6089 = _6085 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6091 = _6071 * _6089;
    float _6093 = _6075 * _6089;
    float _6095 = _6091 * _6091;
    float _6097 = _6093 * _6093;
    float _6099 = _6095 + _6097;
    float _6101 = sqrt(_6099);
    bool _6103 = _6101 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6105 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6107 = _6101 + _6105;
    float _6109 = _6085;
    float _6111 = _6099;
    float _6113 = _6107;
    float _6115 = _6067;
    if (_6103)
    {
        float _6117 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6109 = _6117;
    }
    float _6119 = _6109;
    if (!_6103)
    {
        _5117 = _6095;
    }
    float _6121 = _5117;
    float _6123 = _6121;
    if (_6103)
    {
        float _6125 = rsqrt(_6099);
        _6111 = _6125;
    }
    float _6127 = _6111;
    float _6129 = _6127;
    if (_6103)
    {
        float _6131 = _6107 * _6119;
        _6113 = _6131;
    }
    float _6133 = _6113;
    float _6135 = floor(_6081);
    if (_6103)
    {
        float _6137 = _6133 * 0.15915493667125701904296875;
        _5119 = _6137;
    }
    float _6139 = _5119;
    float _6141 = _6075;
    if (_6103)
    {
        float _6143 = _6139 * 6.283185482025146484375;
        float _6145 = sin(_6143);
        _6141 = _6145;
    }
    float _6147 = _6141;
    float _6149 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6151 = precise::max(0.0, _6149);
    float _6153 = _6119;
    float _6155 = _6151;
    if (_6103)
    {
        float _6157 = _6139 * 6.283185482025146484375;
        float _6159 = cos(_6157);
        _6153 = _6159;
    }
    float _6161 = _6153;
    float _6163 = -_6135;
    float _6165 = _6081 + _6163;
    float _6167 = -_6089;
    float _6169 = -_6151;
    float _6171 = fma(_6067, _6167, _6169);
    if (_6103)
    {
        float _6173 = _6171 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6115 = _6173;
    }
    float _6175 = _6115;
    float _6177 = _6175;
    float _6179 = _6147;
    if (_6103)
    {
        float _6181 = fma(_6147, _6175, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6177 = _6181;
    }
    float _6183 = _6177;
    float _6185 = _6183;
    if (!_6103)
    {
        _6179 = _6091;
    }
    float _6187 = _6179;
    float _6189 = _6187;
    if (_6103)
    {
        float _6191 = _6127 * _6183;
        _5691 = _6191;
    }
    float _6193 = _5691;
    float _6195 = _6161;
    if (_6103)
    {
        float _6197 = _6161 + (-1.0);
        _6155 = _6197;
    }
    float _6199 = _6155;
    float _6201 = _6199;
    if (!_6103)
    {
        _6185 = _6171;
    }
    float _6203 = _6185;
    float _6205 = _6203;
    if (_6103)
    {
        float _6207 = _6091 * _6193;
        _6189 = _6207;
    }
    float _6209 = _6189;
    if (_6103)
    {
        float _6211 = _6199 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6129 = _6211;
    }
    float _6213 = _6129;
    if (!_6103)
    {
        _6201 = _6093;
    }
    float _6215 = _6201;
    float _6217 = _6215;
    if (_6103)
    {
        float _6219 = _6093 * _6193;
        _6217 = _6219;
    }
    float _6221 = _6217;
    if (_6103)
    {
        float _6223 = _6209 * _6209;
        _6123 = _6223;
    }
    float _6225 = _6123;
    if (_6103)
    {
        float _6227 = fma(_6171, _6161, _6213);
        _6205 = _6227;
    }
    float _6229 = _6205;
    if (!_6103)
    {
        _6195 = _6097;
    }
    float _6231 = _6195;
    float _6233 = _6231;
    if (_6103)
    {
        float _6235 = _6221 * _6221;
        _6233 = _6235;
    }
    float _6237 = _6233;
    float _6239 = fma(_6229, _6229, _6225);
    float _6241 = _6009 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6243 = _6239 + _6237;
    float _6245 = fma(_6011, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6241);
    float _6247 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6249 = fma(_6087, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6247);
    float _6251 = precise::clamp(_6249, 0.0, 1.0);
    float _6253 = rsqrt(_6243);
    float _6255 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6245);
    float _6257 = -_6251;
    float _6259 = _6257 + 1.0;
    float _6261 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6263 = fma(_5055, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6265 = _6255 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6267 = _6009 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6269 = abs(_6259);
    float _6271 = log2(_6269);
    float _6273 = _6265 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6275 = _6009 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6277 = -_6273;
    float _6279 = fma(_6277, _6261, 1.0);
    float _6281 = _6009 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6283 = fma(_6011, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6275);
    float _6285 = _6253 * _6209;
    float _6287 = _6253 * _6229;
    float _6289 = fma(_6011, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6281);
    float _6291 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6283);
    float _6293 = _6285 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6295 = _6253 * _6221;
    float _6297 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6289);
    float _6299 = _6291 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6301 = -_6293;
    float _6303 = fma(_6287, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6301);
    float _6305 = fma(_6011, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6267);
    float _6307 = _6297 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6309 = _6299 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6311 = floor(_6263);
    float _6313 = -_6295;
    float _6315 = fma(_6313, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6303);
    float _6317 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6305);
    float _6319 = fma(_6307, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6309);
    float _6321 = _6271 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6323 = fma(_6315, -0.5, 0.5);
    float _6325 = _6317 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6327 = fma(_6265, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6319);
    float _6329 = exp2(_6321);
    float _6331 = _6299 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6333 = fma(_6315, 0.5, 0.5);
    float _6335 = fma(_6325, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6327);
    float _6337 = _6299 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6339 = fma(_6307, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6331);
    float _6341 = sqrt(_6323);
    float _6343 = -_6311;
    float _6345 = _6263 + _6343;
    float _6347 = fma(_6333, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6349 = fma(_6307, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6337);
    float _6351 = fma(_6265, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6339);
    float _6353 = _6287 + 1.0;
    float _6355 = fma(_6333, _6347, -0.212114393711090087890625);
    float _6357 = fma(_6265, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6349);
    float _6359 = log2(_6279);
    float _6361 = fma(_6325, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6351);
    float _6363 = fma(_6333, _6355, 1.570728778839111328125);
    float _6365 = fma(_6325, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6357);
    float _6367 = -_6287;
    float _6369 = fma(_6329, _6353, _6367);
    float _6371 = 1.0 / _6335;
    float _6373 = _6341 * 0.636619746685028076171875;
    float _6375 = fma(_6369, 0.5, 0.5);
    float _6377 = -_6363;
    float _6379 = fma(_6373, _6377, 1.0);
    float2 _16205 = float2(_6165, _6345);
    float _6381 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16205, float2(0.0), isnan(_16205)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16205, float2(0.0), isnan(_16205)), level(0.0)).x;
    float _6383 = _6359 * 0.693147182464599609375;
    float _6385 = _6361 * _6371;
    float _6387 = _6365 * _6371;
    float _6389 = _6383 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6391 = fma(_6385, 0.5, 0.5);
    float _6393 = fma(_6387, -0.5, 0.5);
    float3 _16233 = float3(_6391, _6393, _6389);
    float _6395 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16233, float3(0.0), isnan(_16233)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16233, float3(0.0), isnan(_16233)), level(0.0)).x;
    float3 _16244 = float3(_6391, _6393, _6389);
    float4 _6398 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16244, float3(0.0), isnan(_16244)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16244, float3(0.0), isnan(_16244)), level(0.0)).xyzw;
    float _6400 = _6398.x;
    float _6402 = _6398.y;
    float _6404 = _6398.z;
    float _6406 = _6398.w;
    float2 _16260 = float2(_6379, _6375);
    float3 _6410 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16260, float2(0.0), isnan(_16260)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16260, float2(0.0), isnan(_16260)), level(0.0)).xyz;
    float _6412 = _6410.x;
    float _6414 = _6410.y;
    float _6416 = _6410.z;
    float _6418 = abs(_5943);
    float _6420 = log2(_6418);
    float _6422 = _6271 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6424 = _6335 * 0.5;
    float _6426 = _6299 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _6428 = _6087 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6430 = isnan(_6087);
    bool _6432 = _6428 || _6430;
    bool _6434 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6436 = _6432 || _6434;
    float _6438 = exp2(_6422);
    bool _6440 = _5943 <= 8000.0;
    bool _6442 = isnan(_5943);
    bool _6444 = _6440 || _6442;
    bool _6446 = isnan(8000.0);
    bool _6448 = _6444 || _6446;
    float _6450 = float(_6448);
    float _6452 = fma(_6307, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6426);
    float _6454 = in.m_101.x;
    float _6456 = fma(_6265, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6452);
    float _6458 = _6420 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6460 = fma(_6325, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6456);
    float _6462 = _6361 + _6335;
    float _6464 = exp2(_6458);
    float _6466 = _6462 * 0.5;
    float _6468 = -_6438;
    float _6470 = _6468 + 1.0;
    out.gl_Position.x = _6361;
    out.gl_Position.y = _6365;
    out.gl_Position.z = _6460;
    out.gl_Position.w = _6335;
    float _6472 = _6462;
    float _6474 = _6365;
    float _6476 = _6361;
    float _6478 = _6335;
    float _6480 = _6460;
    float _6482 = _6466;
    if (!_6436)
    {
        _6472 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6484 = _6472;
    float _6486 = _6470 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6488 = fma(_6464, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6490 = precise::clamp(_6488, 0.0, 1.0);
    float _6492 = fma(_6365, -0.5, _6424);
    float _6494 = fma(_6490, -2.0, 3.0);
    float _6496 = _6490 * _6490;
    float _6498 = _6484;
    float _6500 = _6484;
    if (!_6436)
    {
        _6474 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6502 = _6474;
    float _6504 = _6502;
    float _6506 = _6502;
    if (!_6436)
    {
        _6476 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6508 = _6476;
    float _6510 = _6496 * _6494;
    float _6512 = -_6510;
    float _6514 = _6512 + 1.0;
    float _6516 = fma(_6514, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6510);
    float _6518 = _6460 + _6335;
    float _6520 = _6450 * _6516;
    float _6522 = _6518 * 0.5;
    float _6524 = _6508;
    float _6526 = _6508;
    if (!_6436)
    {
        _6478 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6528 = _6478;
    float _6530 = _6520 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6532 = _6528;
    float _6534 = _6528;
    if (!_6436)
    {
        _6480 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6536 = _6480;
    out.m_103.x = _6466;
    out.m_103.y = _6492;
    out.m_103.z = _6522;
    out.m_103.w = _6335;
    float _6538 = _6063 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6540 = _6536;
    float _6542 = _6536;
    if (!_6436)
    {
        _6482 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6544 = _6482;
    float _6546 = -_6381;
    float _6548 = _6546 + 1.0;
    float _6550 = _6548 * _6530;
    float _6552 = precise::clamp(_6550, 0.0, 1.0);
    float _6554 = -_6552;
    float _6556 = fma(_6554, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6558 = _6556 * _6454;
    float _6560 = _6558 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6562 = _6486 * _6395;
    float _6564 = -_6486;
    float _6566 = _6564 + 1.0;
    out.m_105.x = _6560;
    float _6568 = _6406 * _6562;
    float _6570 = _6416 * _6562;
    float _6572 = _6406 * _6566;
    float _6574 = fma(_6412, _6568, _6400);
    float _6576 = fma(_6414, _6568, _6402);
    float _6578 = fma(_6406, _6570, _6404);
    out.m_107.x = _6574;
    out.m_107.y = _6576;
    out.m_107.z = _6578;
    out.m_107.w = _6572;
    bool _6580 = !_6436;
    float _6582 = _6544;
    float _6584 = _6544;
    if (!_6580)
    {
        bool _6586 = _6087 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6588 = isnan(_6087);
        bool _6590 = _6586 || _6588;
        bool _6592 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6594 = _6590 || _6592;
        if (!_6594)
        {
            float _6596 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6598 = _6087 + _6596;
            float _6600 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6602 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6600;
            float _6604 = 1.0 / _6602;
            float _6606 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6608 = _6606 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6610 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6612 = _6610 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6614 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6616 = _6614 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6618 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6620 = _6618 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6622 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6624 = _6622 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6626 = _6598 * _6604;
            float _6628 = precise::clamp(_6626, 0.0, 1.0);
            float _6630 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6632 = _6630 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6634 = fma(_6628, _6612, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6636 = fma(_6628, _6632, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6638 = fma(_6628, _6608, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6640 = fma(_6628, _6616, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6642 = fma(_6628, _6620, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6644 = fma(_6628, _6624, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6526 = _6638;
            _6534 = _6642;
            _6506 = _6636;
            _6584 = _6640;
            _6500 = _6634;
            _6542 = _6644;
            _6646 = true;
        }
        else
        {
            bool _6648 = _6087 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6650 = isnan(_6087);
            bool _6652 = _6648 || _6650;
            bool _6654 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6656 = _6652 || _6654;
            if (!_6656)
            {
                _6582 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6658 = _6582;
            _6584 = _6658;
            if (!_6656)
            {
                _6532 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6660 = _6532;
            _6534 = _6660;
            if (!_6656)
            {
                _6540 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6662 = _6540;
            _6542 = _6662;
            if (!_6656)
            {
                _6504 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6664 = _6504;
            _6506 = _6664;
            if (!_6656)
            {
                _6524 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6666 = _6524;
            _6526 = _6666;
            if (!_6656)
            {
                _6498 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6668 = _6498;
            bool _6670 = !_6656;
            _6500 = _6668;
            if (!_6670)
            {
                bool _6672 = _6087 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6674 = isnan(_6087);
                bool _6676 = _6672 || _6674;
                bool _6678 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6680 = _6676 || _6678;
                if (!_6680)
                {
                    float _6682 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6684 = _6087 + _6682;
                    float _6686 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6688 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6686;
                    float _6690 = 1.0 / _6688;
                    float _6692 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6694 = _6692 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6696 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6698 = _6696 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6700 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6702 = _6700 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6704 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6706 = _6704 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6708 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6710 = _6708 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6712 = _6684 * _6690;
                    float _6714 = precise::clamp(_6712, 0.0, 1.0);
                    float _6716 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6718 = _6716 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6720 = fma(_6714, _6698, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6722 = fma(_6714, _6718, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6724 = fma(_6714, _6694, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6726 = fma(_6714, _6702, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6728 = fma(_6714, _6706, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6730 = fma(_6714, _6710, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6526 = _6724;
                    _6534 = _6728;
                    _6506 = _6722;
                    _6584 = _6726;
                    _6500 = _6720;
                    _6542 = _6730;
                    _6646 = true;
                }
                else
                {
                    _6526 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6534 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6506 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6584 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6500 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6542 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6646 = false;
    float _6732 = _6526;
    float _6734 = _6534;
    float _6736 = _6506;
    float _6738 = _6584;
    float _6740 = _6500;
    float _6742 = _6542;
    float _6744 = _6538 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6746 = fma(_5665, -0.5, 0.5);
    float _6748 = precise::clamp(_6746, 0.0, 1.0);
    float _6750 = -_6732;
    float _6752 = _6734 + _6750;
    float _6754 = -_6736;
    float _6756 = _6738 + _6754;
    out.m_51.x = _6744;
    float _6758 = fma(_6748, _6752, _6732);
    float _6760 = -_6740;
    float _6762 = _6742 + _6760;
    float _6764 = fma(_6748, _6756, _6736);
    float _6766 = _6758 * 0.586610972881317138671875;
    bool _6768 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6770 = fma(_6748, _6762, _6740);
    out.m_109.x = 0.0;
    float _6772 = fma(_6764, 0.298911988735198974609375, _6766);
    bool _6774 = _6063 > 0.0;
    bool _6776 = isnan(_6063);
    bool _6778 = _6774 || _6776;
    bool _6780 = isnan(0.0);
    bool _6782 = _6778 || _6780;
    float _6784 = fma(_6770, 0.114477999508380889892578125, _6772);
    float _6786 = -_6784;
    float _6788 = _6764 + _6786;
    float _6790 = -_6784;
    float _6792 = _6758 + _6790;
    float _6794 = -_6784;
    float _6796 = _6770 + _6794;
    float _6798 = fma(_6788, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6784);
    float _6800 = fma(_6792, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6784);
    float _6802 = fma(_6796, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6784);
    bool _6804 = !_6768;
    if (!_6804)
    {
        float _6806 = -_6009;
        float _6808 = _6806 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6810 = -_6011;
        float _6812 = _6810 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6814 = -_6013;
        float _6816 = _6814 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6818 = _6808 * _6808;
        float _6820 = fma(_6812, _6812, _6818);
        float _6822 = fma(_6816, _6816, _6820);
        float _6824 = sqrt(_6822);
        float _6826 = rsqrt(_6822);
        float _6828 = -_6824;
        float _6830 = _6828 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6832 = _6830 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6834 = precise::clamp(_6832, 0.0, 1.0);
        float _6836 = _6812 * _6826;
        float _6838 = _6808 * _6826;
        float _6840 = abs(_6834);
        float _6842 = log2(_6840);
        float _6844 = _6816 * _6826;
        float _6846 = _6836 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6848 = _5665 * _6838;
        float _6850 = -_6838;
        float _6852 = -_6846;
        float _6854 = fma(_6850, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6852);
        float _6856 = fma(_5671, _6836, _6848);
        float _6858 = -_6844;
        float _6860 = fma(_6858, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6854);
        float _6862 = fma(_5679, _6844, _6856);
        float _6864 = precise::clamp(_6862, 0.0, 1.0);
        float _6866 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6868 = _6860 + _6866;
        float _6870 = _6842 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6872 = _6868 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6874 = precise::clamp(_6872, 0.0, 1.0);
        float _6876 = exp2(_6870);
        float _6878 = _6876 * _6874;
        float _6880 = _6864 * _6878;
        float _6882 = _6880 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6884 = _6880 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6886 = _6880 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _6882;
        out.m_109.y = _6884;
        out.m_109.z = _6886;
    }
    out.m_111.x = _6798;
    out.m_111.y = _6800;
    out.m_111.z = _6802;
    if (_6782)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _6888 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6888;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6646 = false;
    bool _5727 = false;
    bool _1092 = false;
    bool _768 = false;
    bool _626 = false;
    bool _472 = false;
    bool _250 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_48.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (!_134)
    {
        out.m_51.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _138 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6945 = as_type<float>(_146);
        out.gl_Position.z = _6945;
    }
    if (!_134)
    {
        return out;
    }
    float _150 = in.m_53.w;
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
        float _170 = float(_130);
        _166 = _170;
    }
    float _172 = _166;
    bool _174 = _164 >= _172;
    bool _176 = !_160;
    bool _178 = _174 || _176;
    if (_178)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _180 = _140;
    if (_178)
    {
        out.m_51.x = 0.0;
    }
    if (_178)
    {
        float _182 = _180 * 5.0;
        _148 = as_type<int>(_182);
    }
    int _184 = _148;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7014 = as_type<float>(_184);
        out.gl_Position.z = _7014;
    }
    if (_178)
    {
        return out;
    }
    float _186 = in.m_55.x;
    float _188 = in.m_55.y;
    float _190 = in.m_55.z;
    bool _192 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _194 = in.m_57.x;
    float _196 = in.m_57.y;
    float _198 = in.m_57.z;
    float _200 = in.m_59.x;
    float _202 = in.m_59.y;
    float _204 = in.m_59.z;
    float _206 = in.m_61.x;
    float _208 = in.m_61.y;
    float _210 = in.m_61.z;
    float _212 = _188 * _196;
    float _214 = _188 * _202;
    float _216 = fma(_186, _194, _212);
    float _218 = _188 * _208;
    float _220 = fma(_186, _200, _214);
    float _222 = fma(_190, _198, _216);
    float _224 = fma(_186, _206, _218);
    float _226 = fma(_190, _204, _220);
    float _228 = fma(_190, _210, _224);
    bool _230 = !_192;
    float _248;
    if (!_230)
    {
        float _232 = in.m_63.x;
        float _234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _236 = _232 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _238 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _240 = _238 * _234;
        float _242 = floor(_240);
        float _244 = -_242;
        float _246 = _240 + _244;
        _248 = _246;
        _250 = true;
    }
    else
    {
        float _252 = float(_130);
        float _254 = 1.0 / _252;
        float _256 = _164 * _254;
        _248 = _256;
    }
    _250 = false;
    float _258 = _248;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _262 = _258 + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _266 = _258 + _264;
    bool _268 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _270 = isnan(_258);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _286 = _258 + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = 1.0 / _282;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _300 = 1.0 / _294;
    float _302 = 1.0 / _290;
    float _304 = _262 * _296;
    bool _306 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _308 = isnan(_258);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -_278;
    float _320 = _318 + 1.0;
    float _322 = _316 * _320;
    float _324 = _266 * _300;
    bool _326 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _328 = isnan(_258);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _338;
    bool _342 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _344 = isnan(_258);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = -_316;
    float _360 = _358 + 1.0;
    float _362 = -_336;
    float _364 = _362 + 1.0;
    float _366 = _286 * _302;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _372;
    float _376 = _352 * _364;
    float _378 = fma(_340, _366, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _380 = fma(_370, _366, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _382 = fma(_374, _366, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _384 = _336 * _360;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _390 = _380 * _376;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = _382 * _376;
    float _398 = -_352;
    float _400 = _398 + 1.0;
    float _402 = _378 * _376;
    float _404 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[143].x, _396);
    float _406 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[143].y, _390);
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _410;
    float _414 = fma(_356, _324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = fma(_388, _324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_394, _324, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _424;
    float _428 = fma(_414, _384, _404);
    float _430 = fma(_412, _304, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _432 = fma(_422, _304, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _434 = fma(_426, _304, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _436 = fma(_416, _384, _406);
    float _438 = fma(_418, _384, _408);
    float _440 = fma(_430, _322, _428);
    float _442 = fma(_432, _322, _436);
    float _444 = fma(_434, _322, _438);
    float _446 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[146].x, _440);
    float _448 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[146].y, _442);
    float _450 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[146].z, _444);
    bool _452 = !_298;
    float _470;
    if (!_452)
    {
        float _454 = in.m_63.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_130);
        float _476 = 1.0 / _474;
        float _478 = _164 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _484 = _480 + _482;
    float _486 = in.m_65.x;
    float _488 = in.m_65.y;
    float _490 = in.m_65.z;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _496 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _498 = isnan(_480);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _512 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _514 = isnan(_480);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _524;
    bool _528 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _530 = isnan(_480);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = 1.0 / _494;
    float _542 = -_506;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _480 + _546;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _552 = _522 * _544;
    float _554 = -_522;
    float _556 = _554 + 1.0;
    float _558 = 1.0 / _510;
    float _560 = _526 * _540;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _566 = fma(_560, _484, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _568 = _564 * _558;
    float _570 = -_538;
    float _572 = _570 + 1.0;
    float _574 = _566 * _552;
    float _576 = fma(_568, _548, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _578 = _506 * _572;
    float _580 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[115].x, _574);
    float _582 = _450 * _490;
    float _584 = fma(_576, _578, _580);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _590 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[117].x, _584);
    float _592 = _448 * _488;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _596 = _586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _598 = _588 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = _590 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _602 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _446 * _486;
    out.m_67.x = _596;
    out.m_67.y = _598;
    out.m_67.z = _602;
    out.m_67.w = _600;
    bool _606 = !_550;
    float _624;
    if (!_606)
    {
        float _608 = in.m_63.x;
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _612 = _608 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[11].w, _164);
        float _616 = _614 * _610;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _624 = _622;
        _626 = true;
    }
    else
    {
        float _628 = float(_130);
        float _630 = 1.0 / _628;
        float _632 = _164 * _630;
        _624 = _632;
    }
    _626 = false;
    float _634 = _624;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _638 = _634 + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _644 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _646 = isnan(_634);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _660 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _662 = isnan(_634);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _672;
    bool _676 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _678 = isnan(_634);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = 1.0 / _642;
    float _690 = -_654;
    float _692 = _690 + 1.0;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _696 = _634 + _694;
    bool _698 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _700 = _670 * _692;
    float _702 = -_670;
    float _704 = _702 + 1.0;
    float _706 = 1.0 / _658;
    float _708 = _674 * _688;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _714 = fma(_708, _638, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _716 = -_686;
    float _718 = _716 + 1.0;
    float _720 = _712 * _706;
    float _722 = _714 * _700;
    float _724 = _654 * _718;
    float _726 = fma(_720, _696, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _728 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[131].x, _722);
    float _730 = fma(_726, _724, _728);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _738 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[133].x, _730);
    float _740 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = _734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _738 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.x = _740;
    out.m_69.y = _742;
    out.m_69.z = _744;
    out.m_69.w = _746;
    bool _748 = !_698;
    float _766;
    if (!_748)
    {
        float _750 = in.m_63.x;
        float _752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _754 = _750 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _756 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[14].x, _164);
        float _758 = _756 * _752;
        float _760 = floor(_758);
        float _762 = -_760;
        float _764 = _758 + _762;
        _766 = _764;
        _768 = true;
    }
    else
    {
        float _770 = float(_130);
        float _772 = 1.0 / _770;
        float _774 = _164 * _772;
        _766 = _774;
    }
    _768 = false;
    float _776 = _766;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _780 = _776 + _778;
    bool _782 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _784 = isnan(_776);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _798;
    bool _802 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _804 = isnan(_776);
    bool _806 = _802 || _804;
    bool _808 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = -_792;
    float _816 = _814 + 1.0;
    bool _818 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _820 = isnan(_776);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = 1.0 / _796;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _836 = _812 * _816;
    float _838 = -_828;
    float _840 = _838 + 1.0;
    float _842 = 1.0 / _834;
    bool _844 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _846 = _800 * _830;
    float _848 = -_812;
    float _850 = _848 + 1.0;
    bool _852 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _854 = isnan(_776);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = fma(_846, _780, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _866 = _828 * _850;
    bool _868 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _870 = isnan(_776);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = _862 * _840;
    float _882 = -_862;
    float _884 = _882 + 1.0;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _890 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _892 = isnan(_776);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    float _902 = _878 * _884;
    float _904 = -_878;
    float _906 = _904 + 1.0;
    bool _908 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _910 = isnan(_776);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = 1.0 / _888;
    float _922 = -_900;
    float _924 = _922 + 1.0;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _930 = _900 * _906;
    float _932 = _918 * _924;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _938 = -_918;
    float _940 = _938 + 1.0;
    float _942 = 1.0 / _928;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _948 = _864 * _932;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _956 = _776 + _954;
    float _958 = _946 * _842;
    float _960 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[159].x, _948);
    float _962 = 1.0 / _936;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _964;
    float _968 = fma(_958, _956, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _972 = _970 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _976 = _776 + _974;
    float _978 = _966 * _920;
    float _980 = fma(_968, _930, _960);
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _984 = _776 + _982;
    float _986 = 1.0 / _952;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _992 = fma(_978, _976, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _994 = _990 * _942;
    bool _996 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _998 = isnan(_776);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1004 = _1000 || _1002;
    int _1006 = _1004 ? 1065353216 : 0;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1008;
    float _1012 = 1.0 / _972;
    float _1014 = fma(_992, _902, _980);
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1020 = _1010 * _962;
    float _1022 = fma(_994, _984, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1026 = _776 + _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1030 = _776 + _1028;
    float _1032 = _1018 * _986;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1034;
    float _1038 = fma(_1020, _1026, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1040 = fma(_1022, _880, _1014);
    float _1042 = fma(_1032, _1030, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1044 = -as_type<float>(_1006);
    float _1046 = _1044 + 1.0;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1050 = _776 + _1048;
    float _1052 = fma(_1038, _866, _1040);
    float _1054 = _1036 * _1012;
    float _1056 = _792 * _1046;
    float _1058 = fma(_1042, _836, _1052);
    float _1060 = fma(_1054, _1050, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1062 = fma(_1060, _1056, _1058);
    float _1064 = fma(as_type<float>(_1006), (*spvDescriptorSet0.vp_c9)._m0[166].x, _1062);
    out.m_71.x = _1064;
    bool _1066 = !_844;
    float _1068 = _836;
    int _1070 = _1006;
    int _1072 = as_type<int>(_1056);
    float _1090;
    if (!_1066)
    {
        float _1074 = in.m_63.x;
        float _1076 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1078 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[14].y, _164);
        float _1082 = _1080 * _1076;
        float _1084 = floor(_1082);
        float _1086 = -_1084;
        float _1088 = _1082 + _1086;
        _1090 = _1088;
        _1092 = true;
    }
    else
    {
        float _1094 = float(_130);
        float _1096 = 1.0 / _1094;
        float _1098 = _164 * _1096;
        _1090 = _1098;
    }
    _1092 = false;
    float _1100 = _1090;
    float _1102 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1104 = int(_1102);
    float _1106 = in.m_73.x;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1110 = _1108 != 0;
    float _1112 = in.m_63.y;
    float _1114 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1116 = int(_1114);
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1120 = _1118 != 0;
    float _1122 = 0.0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1110)
    {
        _1122 = 1.0;
    }
    float _1126 = _1122;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1130 = _1128 != 0;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1134 = _1132 != 0;
    float _1136 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1138 = int(_1136);
    float _1140 = float(_1104);
    float _1142 = 0.0;
    float _1144 = _1126;
    bool _1146 = _1130;
    bool _1148 = _1134;
    if (_1110)
    {
        _1142 = 1.0;
    }
    float _1150 = _1142;
    float _1152 = 0.0;
    float _1154 = _1150;
    if (_1110)
    {
        _1152 = 1.0;
    }
    float _1156 = _1152;
    int _1158 = 0;
    float _1160 = _1156;
    if (_1110)
    {
        _1158 = 0;
    }
    int _1162 = _1158;
    float _1164 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1166 = int(_1164);
    float _1168 = float(_1116);
    int _1170 = _1162;
    if (_1110)
    {
        _1124 = 0;
    }
    int _1172 = _1124;
    int _1174 = _1172;
    float _1176 = _1106;
    if (!_1120)
    {
        _1068 = _1106;
    }
    float _1178 = _1068;
    float _1180 = _1178;
    if (_1130)
    {
        float _1182 = -_1106;
        float _1184 = _1182 + 1.0;
        _1070 = as_type<int>(_1184);
    }
    int _1186 = _1070;
    if (_1134)
    {
        float _1188 = -_1106;
        float _1190 = _1188 + 1.0;
        _1072 = as_type<int>(_1190);
    }
    int _1192 = _1072;
    bool _1194 = _1112 > 0.5;
    float _1196 = 1.0 / _1140;
    float _1198 = float(_1138);
    float _1200 = 0.0;
    if (!_1130)
    {
        _1200 = _1106;
    }
    float _1202 = _1200;
    float _1204 = 0.0;
    float _1206 = _1202;
    if (!_1134)
    {
        _1204 = _1106;
    }
    float _1208 = _1204;
    float _1210 = _1208;
    if (_1130)
    {
        float _1212 = _1194 ? as_type<float>(_1186) : _1106;
        _1206 = _1212;
    }
    float _1214 = _1206;
    float _1216 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1218 = int(_1216);
    float _1220 = float(uint(_1166));
    if (_1134)
    {
        float _1222 = _1194 ? as_type<float>(_1192) : _1106;
        _1210 = _1222;
    }
    float _1224 = _1210;
    int _1226 = 0;
    if (_1110)
    {
        _1226 = as_type<int>(_1112);
    }
    int _1228 = _1226;
    float _1230 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1232 = int(_1230);
    float _1234 = _1196 * _164;
    float _1236 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1238 = int(_1236);
    float _1240 = float(uint(_1218));
    float _1242 = 1.0 / _1168;
    float _1244 = float(_1232);
    float _1246 = 1.0 / _1198;
    float _1248 = float(uint(_1238));
    float _1250 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1252 = int(_1250);
    float _1254 = _1242 * _164;
    float _1256 = 1.0 / _1220;
    float _1258 = _1246 * _164;
    float _1260 = 1.0 / _1240;
    float _1262 = float(uint(_1252));
    float _1264 = trunc(_1234);
    int _1266 = int(_1264);
    float _1268 = _1240;
    int _1270 = _1228;
    if (_1110)
    {
        float _1272 = in.m_63.x;
        _1268 = _1272;
    }
    float _1274 = _1268;
    int _1276 = as_type<int>(_1256) + (-2);
    float _1278 = 1.0 / _1244;
    int _1280 = as_type<int>(_1260) + (-2);
    float _1282 = 1.0 / _1248;
    float _1284 = float(uint(_1266));
    float _1286 = as_type<float>(_1280) * _1284;
    float _1288 = trunc(_1254);
    int _1290 = int(_1288);
    float _1292 = _1278 * _164;
    float _1294 = trunc(_1258);
    int _1296 = int(_1294);
    int _1298 = as_type<int>(_1282) + (-2);
    float _1300 = 1.0 / _1262;
    float _1302 = float(uint(_1290));
    float _1304 = as_type<float>(_1298) * _1302;
    float _1306 = trunc(_1292);
    int _1308 = int(_1306);
    float _1310 = _1262;
    int _1312 = as_type<int>(_1304);
    if (_1110)
    {
        float _1314 = in.m_63.z;
        _1310 = _1314;
    }
    float _1316 = _1310;
    float _1318 = float(uint(_1296));
    float _1320 = as_type<float>(_1276) * _1318;
    float _1322 = trunc(_1286);
    float _1324 = precise::max(_1322, 0.0);
    uint _1327 = uint(_1324);
    float _1329 = trunc(_1304);
    float _1331 = precise::max(_1329, 0.0);
    uint _1333 = uint(_1331);
    float _1335 = trunc(_1320);
    float _1337 = precise::max(_1335, 0.0);
    uint _1339 = uint(_1337);
    float _1341 = _1274;
    if (_1110)
    {
        _1312 = as_type<int>(_1274);
    }
    int _1343 = _1312;
    int _1345 = 0;
    float _1347 = as_type<float>(_1343);
    float _1349 = _1316;
    if (_1110)
    {
        _1345 = as_type<int>(_1316);
    }
    int _1351 = _1345;
    int _1353 = 0;
    int _1355 = _1351;
    if (_1110)
    {
        _1353 = _1343;
    }
    int _1357 = _1353;
    int _1359 = int(_1130);
    int _1361 = _1120 ? 2 : 0;
    int _1363 = _1359 | _1361;
    int _1365 = _1134 ? 4 : 0;
    int _1367 = _1363 | _1365;
    int _1369 = _1110 ? 8 : 0;
    int _1371 = _1367 | _1369;
    int _1373 = false ? 16 : 0;
    int _1375 = _1371 | _1373;
    int _1377 = _1194 ? 32 : 0;
    int _1379 = _1375 | _1377;
    int _1381 = false ? 64 : 0;
    int _1383 = _1379 | _1381;
    int _1385 = _1383 & 32;
    float _1387 = as_type<float>(_1385);
    int _1389 = _1357;
    if (_1110)
    {
        _1387 = as_type<float>(_1343);
    }
    float _1391 = _1387;
    float _1393 = _1391;
    if (!_1110)
    {
        float _1395 = in.m_63.x;
        float _1397 = _1112 * 3.1415927410125732421875;
        float _1399 = in.m_63.z;
        float _1401 = _1397 * 0.15915493667125701904296875;
        float _1403 = _1401 * 6.283185482025146484375;
        float _1405 = sin(_1403);
        float _1407 = _1395 * 3.1415927410125732421875;
        float _1409 = _1407 * 0.15915493667125701904296875;
        float _1411 = _1399 * 3.1415927410125732421875;
        float _1413 = _1411 * 0.15915493667125701904296875;
        float _1415 = _1409 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = _1413 * 6.283185482025146484375;
        float _1421 = sin(_1419);
        _1393 = _1399;
        _1160 = 5.839270114898681640625;
        _1341 = _1395;
        _1144 = 7.345489978790283203125;
        _1347 = _1112;
        _1154 = 1.2345600128173828125;
        _1170 = 1;
        _1174 = 2;
        _1349 = _1399;
        _1270 = as_type<int>(_1405);
        _1389 = as_type<int>(_1417);
        _1355 = as_type<int>(_1421);
    }
    float _1423 = _1393;
    float _1425 = _1160;
    float _1427 = _1341;
    float _1429 = _1144;
    float _1431 = _1347;
    float _1433 = _1154;
    int _1435 = _1170;
    int _1437 = _1174;
    float _1439 = _1349;
    int _1441 = _1270;
    int _1443 = _1389;
    int _1445 = _1355;
    int _1447 = ~_1166;
    int _1449 = _1447 + 1;
    float _1451 = _1012;
    if (_1120)
    {
        float _1453 = in.m_63.x;
        _1451 = _1453;
    }
    float _1455 = _1451;
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1459 = _1457 != 0;
    float _1461 = _1423 * _1425;
    int _1463 = ~_1238;
    int _1465 = _1463 + 1;
    int _1467 = _1449 * int(_1339);
    int _1469 = _1467 + _1296;
    int _1471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1473 = _1471 != 0;
    float _1475 = _1427 * _1429;
    float _1477 = _1431 * _1433;
    int _1479 = as_type<int>(_1300) + (-2);
    float _1481 = floor(_1461);
    float _1483 = float(uint(_1469));
    int _1485 = _1465 * int(_1333);
    int _1487 = _1485 + _1290;
    float _1489 = float(uint(_1308));
    float _1491 = _1431 * _1429;
    float _1493 = _1423;
    if (_1459)
    {
        float _1495 = in.m_63.z;
        _1493 = _1495;
    }
    float _1497 = _1493;
    int _1499 = ~_1218;
    int _1501 = _1499 + 1;
    float _1503 = as_type<float>(_1276) * _1483;
    float _1505 = float(uint(_1487));
    float _1507 = floor(_1475);
    int _1509 = 0;
    float _1511 = _1503;
    if (_1473)
    {
        float _1513 = -_1106;
        float _1515 = _1513 + 1.0;
        _1509 = as_type<int>(_1515);
    }
    int _1517 = _1509;
    int _1519 = _1501 * int(_1327);
    int _1521 = _1519 + _1266;
    int _1523 = 0;
    if (_1459)
    {
        float _1525 = -_1106;
        float _1527 = _1525 + 1.0;
        _1523 = as_type<int>(_1527);
    }
    int _1529 = _1523;
    float _1531 = as_type<float>(_1298) * _1505;
    int _1533 = ~_1166;
    int _1535 = _1533 + 1;
    bool _1537 = _1435 != 1;
    float _1539 = _1455;
    if (_1120)
    {
        bool _1541 = _1455 > 0.5;
        _1146 = _1541;
    }
    bool _1543 = _1146;
    float _1545 = floor(_1477);
    if (!_1473)
    {
        _1539 = _1106;
    }
    float _1547 = _1539;
    bool _1549 = _1437 != 2;
    float _1551 = _1547;
    if (_1473)
    {
        float _1553 = _1194 ? as_type<float>(_1517) : _1106;
        _1551 = _1553;
    }
    float _1555 = _1551;
    float _1557 = _1112 * 2.0;
    float _1559 = float(uint(_1521));
    float _1561 = in.m_59.w;
    int _1563 = ~_1218;
    int _1565 = _1563 + 1;
    float _1567 = trunc(_1531);
    float _1569 = precise::max(_1567, 0.0);
    uint _1571 = uint(_1569);
    float _1573 = -_1507;
    float _1575 = _1475 + _1573;
    float _1577 = as_type<float>(_1280) * _1559;
    int _1579 = ~_1252;
    int _1581 = _1579 + 1;
    int _1583 = as_type<int>(_1559);
    float _1585 = as_type<float>(_1565);
    if (_1120)
    {
        float _1587 = -_1106;
        float _1589 = _1587 + 1.0;
        _1583 = as_type<int>(_1589);
    }
    int _1591 = _1583;
    if (_1459)
    {
        bool _1593 = _1497 > 0.5;
        _1148 = _1593;
    }
    bool _1595 = _1148;
    float _1597 = in.m_61.w;
    int _1599 = ~_1238;
    int _1601 = _1599 + 1;
    float _1603 = -_1545;
    float _1605 = _1477 + _1603;
    float _1607 = as_type<float>(_1479) * _1489;
    float _1609 = float(_130);
    float _1611 = trunc(_1577);
    float _1613 = precise::max(_1611, 0.0);
    uint _1615 = uint(_1613);
    float _1617 = float(_1166);
    float _1619 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1621 = as_type<float>(_1601);
    if (_1120)
    {
        float _1623 = _1543 ? as_type<float>(_1591) : _1106;
        _1180 = _1623;
    }
    float _1625 = _1180;
    int _1627 = int(_1333) + int(_1571);
    float _1629 = _1575 * _1617;
    float _1631 = float(_1296);
    float _1633 = trunc(_1607);
    float _1635 = precise::max(_1633, 0.0);
    uint _1637 = uint(_1635);
    float _1639 = -_1481;
    float _1641 = _1461 + _1639;
    float _1643 = float(_1238);
    bool _1645 = _1631 >= _1617;
    bool _1647 = isnan(_1631);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan(_1617);
    bool _1653 = _1649 || _1651;
    float _1655 = float(_1653);
    float _1657 = float(_1252);
    float _1659 = floor(_1491);
    int _1661 = int(_1327) + int(_1615);
    int _1663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1665 = _1663 != 0;
    int _1667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1669 = _1667 != 0;
    float _1671 = 1.0 / _1609;
    int _1673 = _1581 * int(_1637);
    int _1675 = _1673 + _1308;
    float _1677 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _1679 = float(uint(_1675));
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1683 = trunc(_1503);
    float _1685 = precise::max(_1683, 0.0);
    uint _1687 = uint(_1685);
    float _1689 = _1617 * _164;
    float _1691 = -_1659;
    float _1693 = _1491 + _1691;
    float _1695 = as_type<float>(_1479) * _1679;
    float _1697 = float(_1290);
    float _1699 = _1643 * _1605;
    float _1701 = float(_1218);
    float _1703 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _1705 = trunc(_1695);
    float _1707 = precise::max(_1705, 0.0);
    uint _1709 = uint(_1707);
    if (!_1459)
    {
        _1511 = _1106;
    }
    float _1711 = _1511;
    float _1713 = _1689 * _1671;
    float _1715 = _1711;
    if (_1459)
    {
        float _1717 = _1595 ? as_type<float>(_1529) : _1106;
        _1715 = _1717;
    }
    float _1719 = _1715;
    float _1721 = _1671 * _164;
    float _1723 = float(_1266);
    float _1725 = _1701 * _1641;
    bool _1727 = _1697 >= _1643;
    bool _1729 = isnan(_1697);
    bool _1731 = _1727 || _1729;
    bool _1733 = isnan(_1643);
    bool _1735 = _1731 || _1733;
    float _1737 = float(_1735);
    float _1739 = _1701 * _1721;
    int _1741 = int(_1339) + int(_1687);
    float _1743 = _1657 * _1721;
    float _1745 = float(_1308);
    float _1747 = trunc(_1737);
    int _1749 = int(_1747);
    bool _1751 = _1723 >= _1701;
    bool _1753 = isnan(_1723);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan(_1701);
    bool _1759 = _1755 || _1757;
    float _1761 = float(_1759);
    float _1763 = _1657 * _1693;
    bool _1765 = _1745 >= _1657;
    bool _1767 = isnan(_1745);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan(_1657);
    bool _1773 = _1769 || _1771;
    float _1775 = float(_1773);
    int _1777 = _1535 * _1741;
    int _1779 = _1777 + _1296;
    int _1781 = _1601 * _1627;
    int _1783 = _1781 + _1290;
    int _1785 = int(_1637) + int(_1709);
    float _1787 = trunc(_1655);
    int _1789 = int(_1787);
    bool _1791 = !_1665;
    int _1793 = _1791 ? 0 : 1;
    float _1795 = _1643 * _1721;
    bool _1797 = uint(_1779) >= uint(_1166);
    int _1799 = _1565 * _1661;
    int _1801 = _1799 + _1266;
    int _1803 = abs(_1793);
    int _1805 = ~_1252;
    int _1807 = _1805 + 1;
    float _1809 = trunc(_1629);
    int _1811 = int(_1809);
    bool _1813 = uint(_1783) >= uint(_1238);
    bool _1815 = uint(_1801) >= uint(_1218);
    int _1817 = _1807 * _1785;
    int _1819 = _1817 + _1308;
    bool _1821 = !_1669;
    int _1823 = _1821 ? 0 : 1;
    bool _1825 = !_1797;
    int _1827 = _1825 ? 0 : (-1);
    float _1829 = trunc(_1699);
    int _1831 = int(_1829);
    bool _1833 = !_1813;
    int _1835 = _1833 ? 0 : (-1);
    int _1837 = abs(_1823);
    int _1839 = ~_1741;
    int _1841 = _1839 + _1827;
    int _1843 = _1841 + 1;
    bool _1845 = !_1815;
    int _1847 = _1845 ? 0 : (-1);
    float _1849 = trunc(_1761);
    int _1851 = int(_1849);
    bool _1853 = uint(_1819) >= uint(_1252);
    int _1855 = _1811 * _1803;
    int _1857 = _1855 + _1296;
    int _1859 = ~_1627;
    int _1861 = _1859 + _1835;
    int _1863 = _1861 + 1;
    int _1865 = ~_1661;
    int _1867 = _1865 + _1847;
    int _1869 = _1867 + 1;
    int _1871 = _1166 * _1843;
    int _1873 = _1871 + _1296;
    bool _1875 = !_1853;
    int _1877 = _1875 ? 0 : (-1);
    int _1879 = _1831 * _1837;
    int _1881 = _1879 + _1290;
    int _1883 = _1238 * _1863;
    int _1885 = _1883 + _1290;
    int _1887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1889 = _1887 != 0;
    float _1891 = trunc(_1725);
    int _1893 = int(_1891);
    int _1895 = ~_1785;
    int _1897 = _1895 + _1877;
    int _1899 = _1897 + 1;
    int _1901 = _1218 * _1869;
    int _1903 = _1901 + _1266;
    int _1905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1907 = _1905 != 0;
    int _1909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1911 = _1909 != 0;
    int _1913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1915 = _1913 != 0;
    bool _1917 = _1238 == 0;
    int _1919 = _1252 * _1899;
    int _1921 = _1919 + _1308;
    bool _1923 = !_1889;
    int _1925 = _1923 ? 0 : 1;
    float _1927 = trunc(_1775);
    int _1929 = int(_1927);
    bool _1931 = _1166 == 0;
    bool _1933 = _1218 == 0;
    int _1935 = ~_1749;
    int _1937 = _1935 + 1;
    int _1939 = _1937 + 1;
    bool _1941 = _1252 == 0;
    float _1943 = trunc(_1713);
    int _1945 = int(_1943);
    bool _1947 = !_1917;
    int _1949 = _1947 ? _1885 : (-1);
    int _1951 = ~_1789;
    int _1953 = _1951 + 1;
    int _1955 = _1953 + 1;
    bool _1957 = !_1931;
    int _1959 = _1957 ? _1873 : (-1);
    int _1961 = _1939 * _1949;
    int _1963 = abs(_1925);
    float _1965 = trunc(_1795);
    int _1967 = int(_1965);
    int _1969 = ~_1851;
    int _1971 = _1969 + 1;
    int _1973 = _1971 + 1;
    int _1975 = _1959 * _1955;
    bool _1977 = !_1933;
    int _1979 = _1977 ? _1903 : (-1);
    int _1981 = _1893 * _1963;
    int _1983 = _1981 + _1266;
    bool _1985 = !_1941;
    int _1987 = _1985 ? _1921 : (-1);
    int _1989 = _1166 + (-1);
    int _1991 = _1973 * _1979;
    bool _1993 = !_1911;
    int _1995 = _1993 ? 0 : 1;
    float _1997 = floor(_1557);
    int _1999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2001 = _1999 != 0;
    int _2003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2005 = _2003 != 0;
    int _2007 = _1789 * _1989;
    int _2009 = _2007 + _1975;
    int _2011 = _1238 + (-1);
    int _2013 = abs(_1995);
    bool _2015 = !_1907;
    int _2017 = _2015 ? 0 : 1;
    int _2019 = _1749 * _2011;
    int _2021 = _2019 + _1961;
    bool _2023 = !_2005;
    int _2025 = _2023 ? 0 : 1;
    int _2027 = _2009 * _2013;
    int _2029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2031 = _2029 != 0;
    int _2033 = abs(_2017);
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2037 = _2035 != 0;
    int _2039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2041 = _2039 != 0;
    bool _2043 = !_1915;
    int _2045 = _2043 ? 0 : 1;
    int _2047 = _1945 * _2033;
    int _2049 = _2047 + _2027;
    int _2051 = abs(_2025);
    bool _2053 = !_2037;
    int _2055 = _2053 ? 0 : 1;
    int _2057 = abs(_2045);
    int _2059 = _2021 * _2051;
    bool _2061 = !_2031;
    int _2063 = _2061 ? 0 : 1;
    int _2065 = abs(_2055);
    bool _2067 = !_2001;
    int _2069 = _2067 ? 0 : 1;
    int _2071 = abs(_2063);
    int _2073 = _1857 * _2057;
    int _2075 = _2073 + _2049;
    int _2077 = abs(_2069);
    int _2079 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2081 = _2079 != 0;
    int _2083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2085 = _2083 != 0;
    int _2087 = _1967 * _2077;
    int _2089 = _2087 + _2059;
    bool _2091 = !_2041;
    int _2093 = _2091 ? 0 : 1;
    int _2095 = _1811 * _2071;
    int _2097 = _2095 + _2075;
    float _2099 = trunc(_1763);
    int _2101 = int(_2099);
    int _2103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2105 = _2103 != 0;
    int _2107 = abs(_2093);
    int _2109 = _1881 * _2065;
    int _2111 = _2109 + _2089;
    bool _2113 = !_2105;
    int _2115 = _2113 ? 0 : 1;
    bool _2117 = !_2085;
    int _2119 = _2117 ? 0 : 1;
    float _2121 = trunc(_1739);
    int _2123 = int(_2121);
    float _2125 = float(uint(_2097));
    int _2127 = abs(_2115);
    int _2129 = _1831 * _2107;
    int _2131 = _2129 + _2111;
    int _2133 = abs(_2119);
    float _2135 = as_type<float>(_1276) * _2125;
    int _2137 = _1218 + (-1);
    bool _2139 = !_2081;
    int _2141 = _2139 ? 0 : 1;
    float _2143 = trunc(_2135);
    float _2145 = precise::max(_2143, 0.0);
    uint _2147 = uint(_2145);
    int _2149 = ~_1929;
    int _2151 = _2149 + 1;
    int _2153 = _2151 + 1;
    int _2155 = _1851 * _2137;
    int _2157 = _2155 + _1991;
    int _2159 = abs(_2141);
    float _2161 = in.m_73.y;
    int _2163 = _2153 * _1987;
    float _2165 = float(uint(_2131));
    int _2167 = _2157 * _2133;
    int _2169 = _1252 + (-1);
    int _2171 = _2101 * _2127;
    int _2173 = _2171 + _1308;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2177 = _2175 != 0;
    float _2179 = as_type<float>(_1298) * _2165;
    int _2181 = _2123 * _2159;
    int _2183 = _2181 + _2167;
    int _2185 = ~_1166;
    int _2187 = _2185 + 1;
    int _2189 = _1929 * _2169;
    int _2191 = _2189 + _2163;
    bool _2193 = !_2177;
    int _2195 = _2193 ? 0 : 1;
    float _2197 = trunc(_2179);
    float _2199 = precise::max(_2197, 0.0);
    uint _2201 = uint(_2199);
    int _2203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2205 = _2203 != 0;
    int _2207 = abs(_2195);
    int _2209 = _2187 * int(_2147);
    int _2211 = _2209 + _2097;
    bool _2213 = !_2205;
    int _2215 = _2213 ? 0 : 1;
    int _2217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2219 = _2217 != 0;
    int _2221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2223 = _2221 != 0;
    float _2225 = trunc(_1743);
    int _2227 = int(_2225);
    int _2229 = ~_1238;
    int _2231 = _2229 + 1;
    float _2233 = float(uint(_2211));
    int _2235 = _1983 * _2207;
    int _2237 = _2235 + _2183;
    bool _2239 = !_2223;
    int _2241 = _2239 ? 0 : 1;
    float _2243 = -_2161;
    float _2245 = _2243 + 1.0;
    float _2247 = as_type<float>(_1276) * _2233;
    bool _2249 = !_2219;
    int _2251 = _2249 ? 0 : 1;
    int _2253 = abs(_2241);
    int _2255 = _2231 * int(_2201);
    int _2257 = _2255 + _2131;
    int _2259 = abs(_2215);
    float _2261 = trunc(_2247);
    float _2263 = precise::max(_2261, 0.0);
    uint _2265 = uint(_2263);
    int _2267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2269 = _2267 != 0;
    int _2271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2273 = _2271 != 0;
    int _2275 = abs(_2251);
    float _2277 = float(uint(_2257));
    int _2279 = _2191 * _2253;
    bool _2281 = !_2269;
    int _2283 = _2281 ? 0 : 1;
    int _2285 = _1893 * _2259;
    int _2287 = _2285 + _2237;
    int _2289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2291 = _2289 != 0;
    float _2293 = as_type<float>(_1298) * _2277;
    int _2295 = abs(_2283);
    float _2297 = float(uint(_2287));
    float _2299 = trunc(_2293);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    int _2305 = _2227 * _2275;
    int _2307 = _2305 + _2279;
    bool _2309 = !_2273;
    int _2311 = _2309 ? 0 : 1;
    float _2313 = as_type<float>(_1280) * _2297;
    int _2315 = int(_2147) + int(_2265);
    int _2317 = _2173 * _2295;
    int _2319 = _2317 + _2307;
    int _2321 = ~_1166;
    int _2323 = _2321 + 1;
    float _2325 = trunc(_2313);
    float _2327 = precise::max(_2325, 0.0);
    uint _2329 = uint(_2327);
    int _2331 = abs(_2311);
    float _2333 = in.m_63.w;
    int _2335 = _2323 * _2315;
    int _2337 = _2335 + _2097;
    int _2339 = ~_1218;
    int _2341 = _2339 + 1;
    int _2343 = _2101 * _2331;
    int _2345 = _2343 + _2319;
    int _2347 = ~_1238;
    int _2349 = _2347 + 1;
    int _2351 = _2101;
    float _2353 = as_type<float>(_1903);
    float _2355 = as_type<float>(_1785);
    if (_2291)
    {
        float _2357 = -_1106;
        float _2359 = _2357 + 1.0;
        _2351 = as_type<int>(_2359);
    }
    int _2361 = _2351;
    bool _2363 = uint(_2337) >= uint(_1166);
    int _2365 = int(_2201) + int(_2303);
    bool _2367 = !_2363;
    int _2369 = _2367 ? 0 : (-1);
    int _2371 = _2349 * _2365;
    int _2373 = _2371 + _2131;
    float _2375 = float(uint(_2345));
    int _2377 = _2341 * int(_2329);
    int _2379 = _2377 + _2287;
    bool _2381 = _1112 > 0.5;
    int _2383 = ~_2315;
    int _2385 = _2383 + _2369;
    int _2387 = _2385 + 1;
    float _2389 = as_type<float>(_1479) * _2375;
    if (_2291)
    {
        float _2391 = _2381 ? as_type<float>(_2361) : _1106;
        _1176 = _2391;
    }
    float _2393 = _1176;
    bool _2395 = uint(_2373) >= uint(_1238);
    int _2397 = _1166 * _2387;
    int _2399 = _2397 + _2097;
    float _2401 = float(uint(_2379));
    float _2403 = trunc(_2389);
    float _2405 = precise::max(_2403, 0.0);
    uint _2407 = uint(_2405);
    bool _2409 = _1166 == 0;
    bool _2411 = !_2395;
    int _2413 = _2411 ? 0 : (-1);
    bool _2415 = _2333 > 0.5;
    float _2417 = as_type<float>(_1280) * _2401;
    bool _2419 = !_2409;
    int _2421 = _2419 ? _2399 : (-1);
    int _2423 = _2415 ? as_type<int>(_2245) : as_type<int>(_2161);
    float _2425 = trunc(_2417);
    float _2427 = precise::max(_2425, 0.0);
    uint _2429 = uint(_2427);
    int _2431 = _2421 & 3;
    bool _2433 = _2431 != 0;
    int _2435 = _2421 & 3;
    bool _2437 = _2435 != 0;
    bool _2439 = uint(_2431) >= 2u;
    int _2441 = _2437 ? 0 : 1;
    int _2443 = ~_2365;
    int _2445 = _2443 + _2413;
    int _2447 = _2445 + 1;
    bool _2449 = uint(_2431) > 1u;
    int _2451 = ~_1252;
    int _2453 = _2451 + 1;
    int _2455 = _1238 * _2447;
    int _2457 = _2455 + _2131;
    int _2459 = _2439 ? 0 : 1;
    bool _2461 = _2431 != 3;
    int _2463 = _2453 * int(_2407);
    int _2465 = _2463 + _2345;
    int _2467 = _2381 ? as_type<int>(_2245) : as_type<int>(_2161);
    bool _2469 = _1238 == 0;
    int _2471 = ~_1218;
    int _2473 = _2471 + 1;
    bool _2475 = !_2469;
    int _2477 = _2475 ? _2457 : (-1);
    int _2479 = int(_2329) + int(_2429);
    float _2481 = float(uint(_2465));
    int _2483 = ~_2441;
    int _2485 = _2483 + 1;
    int _2487 = _2485 + 1;
    float _2489 = as_type<float>(_1479) * _2481;
    int _2491 = _2487;
    if (!_2449)
    {
        int _2493 = ~_2441;
        int _2495 = _2493 + 1;
        _2491 = _2495;
    }
    int _2497 = _2491;
    int _2499 = _2477 & 3;
    bool _2501 = _2499 != 0;
    int _2503 = _2473 * _2479;
    int _2505 = _2503 + _2287;
    int _2507 = ~_2459;
    int _2509 = _2507 + 1;
    int _2511 = _2509 + 1;
    int _2513 = _2511;
    if (_2461)
    {
        int _2515 = ~_2459;
        int _2517 = _2515 + 1;
        _2513 = _2517;
    }
    int _2519 = _2513;
    bool _2521 = uint(_2499) >= 2u;
    float _2523 = trunc(_2489);
    float _2525 = precise::max(_2523, 0.0);
    uint _2527 = uint(_2525);
    int _2529 = _2501 ? 0 : 1;
    bool _2531 = uint(_2505) >= uint(_1218);
    int _2533 = _2521 ? 0 : 1;
    bool _2535 = _2499 != 3;
    bool _2537 = !_2531;
    int _2539 = _2537 ? 0 : (-1);
    bool _2541 = uint(_2499) > 1u;
    int _2543 = ~_2479;
    int _2545 = _2543 + _2539;
    int _2547 = _2545 + 1;
    int _2549 = ~_2533;
    int _2551 = _2549 + 1;
    int _2553 = _2551 + 1;
    bool _2555 = _1218 == 0;
    int _2557 = _1218 * _2547;
    int _2559 = _2557 + _2287;
    int _2561 = ~_2529;
    int _2563 = _2561 + 1;
    int _2565 = _2563 + 1;
    int _2567 = _2553;
    int _2569 = _2565;
    if (_2535)
    {
        int _2571 = ~_2533;
        int _2573 = _2571 + 1;
        _2567 = _2573;
    }
    int _2575 = _2567;
    int _2577 = ~_1252;
    int _2579 = _2577 + 1;
    int _2581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2583 = _2581 != 0;
    if (!_2541)
    {
        int _2585 = ~_2529;
        int _2587 = _2585 + 1;
        _2569 = _2587;
    }
    int _2589 = _2569;
    bool _2591 = !_2555;
    int _2593 = _2591 ? _2559 : (-1);
    int _2595 = int(_2407) + int(_2527);
    bool _2597 = !_2583;
    int _2599 = _2597 ? 0 : 1;
    int _2601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2603 = _2601 != 0;
    int _2605 = _2579 * _2595;
    int _2607 = _2605 + _2345;
    int _2609 = _2593 & 3;
    bool _2611 = _2609 != 0;
    bool _2613 = !_2603;
    int _2615 = _2613 ? 0 : 1;
    bool _2617 = uint(_2609) >= 2u;
    int _2619 = _2611 ? 0 : 1;
    bool _2621 = uint(_2607) >= uint(_1252);
    int _2623 = _2617 ? 0 : 1;
    bool _2625 = _2609 != 3;
    bool _2627 = !_2621;
    int _2629 = _2627 ? 0 : (-1);
    bool _2631 = uint(_2609) > 1u;
    int _2633 = ~_2595;
    int _2635 = _2633 + _2629;
    int _2637 = _2635 + 1;
    int _2639 = ~_2623;
    int _2641 = _2639 + 1;
    int _2643 = _2641 + 1;
    bool _2645 = _1252 == 0;
    int _2647 = _1252 * _2637;
    int _2649 = _2647 + _2345;
    int _2651 = ~_2619;
    int _2653 = _2651 + 1;
    int _2655 = _2653 + 1;
    int _2657 = _2643;
    int _2659 = _2655;
    if (_2625)
    {
        int _2661 = ~_2623;
        int _2663 = _2661 + 1;
        _2657 = _2663;
    }
    int _2665 = _2657;
    int _2667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2669 = _2667 != 0;
    bool _2671 = !_2645;
    int _2673 = _2671 ? _2649 : (-1);
    float _2675 = _2669 ? as_type<float>(_2467) : _2161;
    if (!_2631)
    {
        int _2677 = ~_2619;
        int _2679 = _2677 + 1;
        _2659 = _2679;
    }
    int _2681 = _2659;
    int _2683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2685 = _2683 != 0;
    int _2687 = _2673 & 3;
    bool _2689 = _2687 != 0;
    bool _2691 = !_2685;
    int _2693 = _2691 ? 0 : 1;
    bool _2695 = uint(_2687) >= 2u;
    int _2697 = _2689 ? 0 : 1;
    int _2699 = _2695 ? 0 : 1;
    bool _2701 = _2687 != 3;
    bool _2703 = uint(_2687) > 1u;
    int _2705 = ~_2699;
    int _2707 = _2705 + 1;
    int _2709 = _2707 + 1;
    int _2711 = ~_2697;
    int _2713 = _2711 + 1;
    int _2715 = _2713 + 1;
    float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2719 = _2717 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2721 = _2709;
    int _2723 = _2715;
    if (_2701)
    {
        int _2725 = ~_2699;
        int _2727 = _2725 + 1;
        _2721 = _2727;
    }
    int _2729 = _2721;
    float _2731 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2733 = _2731 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    if (!_2703)
    {
        int _2735 = ~_2697;
        int _2737 = _2735 + 1;
        _2723 = _2737;
    }
    int _2739 = _2723;
    float _2741 = 1.0 / _2719;
    float _2743 = in.m_48.x;
    float _2745 = in.m_48.y;
    float _2747 = in.m_48.z;
    bool _2749 = _1439 > 0.5;
    float _2751 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2755 = _2753 != 0;
    int _2757 = _2749 ? as_type<int>(_2245) : as_type<int>(_2161);
    float _2759 = _2755 ? as_type<float>(_2423) : _2161;
    float _2761 = 1.0 / _2733;
    int _2763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2765 = _2763 != 0;
    int _2767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2769 = _2767 != 0;
    float _2771 = _2765 ? as_type<float>(_2757) : _2161;
    float _2773 = _2769 ? as_type<float>(_2757) : _2161;
    bool _2775 = !_1537;
    float _2777 = _2775 ? as_type<float>(_1441) : as_type<float>(_1443);
    bool _2779 = !_1537;
    float _2781 = _2779 ? as_type<float>(_1445) : as_type<float>(_1441);
    float _2783 = _202 * _2745;
    float _2785 = _196 * _2745;
    float _2787 = _208 * _2745;
    float _2789 = fma(_200, _2743, _2783);
    float _2791 = fma(_194, _2743, _2785);
    float _2793 = fma(_206, _2743, _2787);
    if (!_1537)
    {
        _1621 = _1439;
    }
    float _2795 = _1621;
    float _2797 = fma(_204, _2747, _2789);
    float _2799 = fma(_198, _2747, _2791);
    float _2801 = 0.0;
    float _2803 = _2795;
    if (!_1537)
    {
        _2801 = _1439;
    }
    float _2805 = _2801;
    float _2807 = as_type<float>(_1441) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2809 = _2805;
    if (!_1537)
    {
        _1585 = _1112;
    }
    float _2811 = _1585;
    float _2813 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2815 = 0.0;
    float _2817 = _2811;
    if (!_1537)
    {
        _2815 = _1112;
    }
    float _2819 = _2815;
    float _2821 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2823 = _2819;
    if (_1549)
    {
        _2353 = _1427;
    }
    float _2825 = _2353;
    float _2827 = fma(as_type<float>(_1441), (*spvDescriptorSet0.vp_c9)._m0[93].w, _2813);
    float _2829 = _2825;
    if (_1537)
    {
        _2803 = _1112;
    }
    float _2831 = _2803;
    float _2833 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2835 = log2(_2833);
    if (_1537)
    {
        _2809 = _1112;
    }
    float _2837 = _2809;
    float _2839 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_1549)
    {
        _2355 = _1112;
    }
    float _2841 = _2355;
    float _2843 = fma(_210, _2747, _2793);
    float _2845 = _2841;
    if (_1537)
    {
        _2817 = _1427;
    }
    float _2847 = _2817;
    float _2849 = fma(_2781, (*spvDescriptorSet0.vp_c9)._m0[98].w, _1677);
    if (_1537)
    {
        _2823 = _1427;
    }
    float _2851 = _2823;
    float _2853 = _2781 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    if (!_1549)
    {
        _2829 = _1439;
    }
    float _2855 = _2829;
    float _2857 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    if (!_1549)
    {
        _2845 = _1427;
    }
    float _2859 = _2845;
    float _2861 = fma(_2853, -2.0, _1703);
    int _2863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2865 = _2863 != 0;
    int _2867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2869 = _2867 != 0;
    float _2871 = fma(as_type<float>(_1443), (*spvDescriptorSet0.vp_c9)._m0[93].z, _2857);
    int _2873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2875 = _2873 != 0;
    float _2877 = _2835 * _164;
    float _2879 = as_type<float>(_1443) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2881 = _2847 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2883 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2885 = exp2(_2877);
    float _2887 = _2865 ? as_type<float>(_2757) : _2161;
    float _2889 = fma(_2821, -2.0, _2883);
    bool _2891 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2893 = isnan(0.0);
    bool _2895 = _2891 || _2893;
    bool _2897 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2899 = _2895 || _2897;
    float _2901 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2903 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2901;
    float _2905 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2907 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2909 = _2903 * _2741;
    float _2911 = fma(_2807, -2.0, _2905);
    float _2913 = fma(_2851, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2907);
    float _2915 = _2855 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2917 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2919 = -_2885;
    float _2921 = _2919 + 1.0;
    float _2923 = -_2917;
    float _2925 = fma(_2839, 2.0, _2923);
    float _2927 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2929 = _2899 ? _2921 : 0.0;
    float _2931 = -_2751;
    float _2933 = fma(_2915, 2.0, _2931);
    float _2935 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2937 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2939 = -_2927;
    float _2941 = fma(_2879, 2.0, _2939);
    float _2943 = fma(_2837, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2935);
    float _2945 = _2831 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2947 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2949 = _2947 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2951 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2953 = fma(_2945, -2.0, _1681);
    float _2955 = _2869 ? as_type<float>(_2757) : _2161;
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _2959 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2961 = _2959 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2963 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2965 = _2963 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2967 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2969 = isnan(1.0);
    bool _2971 = _2967 || _2969;
    bool _2973 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2975 = _2971 || _2973;
    float _2977 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2979 = 1.0 + _2977;
    float _2981 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2937);
    float _2983 = 1.0 / _2979;
    float _2985 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2951);
    float _2987 = _1427 * 2.0;
    float _2989 = fma(_2777, (*spvDescriptorSet0.vp_c9)._m0[98].z, _2957);
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2993 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2995 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _2997 = _2777 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _2999 = 1.0 / _2949;
    float _3001 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3003 = _2859 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3007 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2985);
    float _3009 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2991);
    float _3011 = -_2995;
    float _3013 = fma(_2997, 2.0, _3011);
    float _3015 = floor(_2987);
    float _3017 = -_2993;
    float _3019 = fma(_2881, 2.0, _3017);
    float _3021 = fma(_3003, -2.0, _3001);
    float _3023 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3005);
    float _3025 = _2961 * _2761;
    float _3027 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3029 = _3027 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3031 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3009);
    float _3033 = 1.0 / _2965;
    float _3035 = -_164;
    float _3037 = fma(_3035, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2941);
    float _3039 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2911);
    float _3041 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2889);
    float _3043 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2981);
    float _3045 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3023);
    float _3047 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2871);
    float _3049 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2827);
    float _3051 = -_164;
    float _3053 = fma(_3051, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2925);
    float _3055 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].z, _2989);
    float _3057 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2849);
    float _3059 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2913);
    float _3061 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2943);
    float _3063 = -_164;
    float _3065 = fma(_3063, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3013);
    float _3067 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2861);
    float _3069 = -_164;
    float _3071 = fma(_3069, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3019);
    float _3073 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2953);
    float _3075 = -_164;
    float _3077 = fma(_3075, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2933);
    float _3079 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3021);
    if (_2975)
    {
        float _3081 = _2929 * _2983;
        _168 = _3081;
    }
    float _3083 = _168;
    float _3085 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3087 = _3085 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3089 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3091 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3089;
    float _3093 = 1.0 / _3029;
    float _3095 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3097 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3095;
    float _3099 = _3091 * _2999;
    bool _3101 = _3015 >= 0.0;
    bool _3103 = isnan(_3015);
    bool _3105 = _3101 || _3103;
    bool _3107 = isnan(0.0);
    bool _3109 = _3105 || _3107;
    float _3111 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3113 = _3111 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _3115 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3117 = _3115 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3119 = _3097 * _3033;
    float _3121 = float(uint(_1881));
    float _3123 = 1.0 / _3087;
    int _3125 = _3109 ? 0 : 1;
    float _3127 = in.m_57.w;
    bool _3129 = _3015 > 0.0;
    float _3131 = as_type<float>(_1298) * _3121;
    float _3133 = float(uint(_1857));
    float _3135 = _3117 * _3093;
    float _3137 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3139 = _3137 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3141 = 1.0 / _3113;
    float _3143 = as_type<float>(_1276) * _3133;
    int _3145 = ~_1238;
    int _3147 = _3145 + 1;
    float _3149 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3151 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3149;
    int _3153 = ~_1218;
    int _3155 = _3153 + 1;
    float _3157 = _3139 * _3123;
    int _3159 = ~_3125;
    int _3161 = _3159 + 1;
    int _3163 = _3161 + 1;
    float _3165 = trunc(_3131);
    float _3167 = precise::max(_3165, 0.0);
    uint _3169 = uint(_3167);
    int _3171 = _3163;
    if (!_3129)
    {
        int _3173 = ~_3125;
        int _3175 = _3173 + 1;
        _3171 = _3175;
    }
    int _3177 = _3171;
    float _3179 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3181 = _1100 + _3179;
    float _3183 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3185 = _1100 + _3183;
    bool _3187 = _1997 >= 0.0;
    bool _3189 = isnan(_1997);
    bool _3191 = _3187 || _3189;
    bool _3193 = isnan(0.0);
    bool _3195 = _3191 || _3193;
    float _3197 = fma(_2909, _3181, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3199 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3201 = _1100 + _3199;
    float _3203 = trunc(_3143);
    float _3205 = precise::max(_3203, 0.0);
    uint _3207 = uint(_3205);
    float _3209 = fma(_3025, _3185, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3211 = _3151 * _3141;
    float _3213 = fma(_3135, _3201, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3215 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3217 = _1100 + _3215;
    int _3219 = ~_1166;
    int _3221 = _3219 + 1;
    int _3223 = _3195 ? 0 : 1;
    int _3225 = _3147 * int(_3169);
    int _3227 = _3225 + _1881;
    float _3229 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3231 = _1100 + _3229;
    bool _3233 = _1997 > 0.0;
    float _3235 = float(uint(_2173));
    float _3237 = fma(_3099, _3231, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3239 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3241 = _1100 + _3239;
    int _3243 = ~_1252;
    int _3245 = _3243 + 1;
    int _3247 = _3221 * int(_3207);
    int _3249 = _3247 + _1857;
    float _3251 = as_type<float>(_1479) * _3235;
    float _3253 = fma(_3119, _3241, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3255 = fma(_3157, _3217, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3257 = float(uint(_3227));
    float _3259 = float(uint(_1983));
    float _3261 = trunc(_3251);
    float _3263 = precise::max(_3261, 0.0);
    uint _3265 = uint(_3263);
    float _3267 = float(uint(_3249));
    float _3269 = as_type<float>(_1298) * _3257;
    bool _3271 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3273 = isnan(_1100);
    bool _3275 = _3271 || _3273;
    bool _3277 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3279 = _3275 || _3277;
    float _3281 = float(_3279);
    float _3283 = as_type<float>(_1280) * _3259;
    bool _3285 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3287 = isnan(_1100);
    bool _3289 = _3285 || _3287;
    bool _3291 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3293 = _3289 || _3291;
    float _3295 = float(_3293);
    float _3297 = as_type<float>(_1276) * _3267;
    bool _3299 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3301 = isnan(_1100);
    bool _3303 = _3299 || _3301;
    bool _3305 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3307 = _3303 || _3305;
    float _3309 = float(_3307);
    float _3311 = -_3281;
    float _3313 = _3311 + 1.0;
    bool _3315 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3317 = isnan(_1100);
    bool _3319 = _3315 || _3317;
    bool _3321 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3323 = _3319 || _3321;
    float _3325 = float(_3323);
    float _3327 = trunc(_3283);
    float _3329 = precise::max(_3327, 0.0);
    uint _3331 = uint(_3329);
    int _3333 = _2477 & 3;
    bool _3335 = _3333 != 0;
    float _3337 = -_3309;
    float _3339 = _3337 + 1.0;
    float _3341 = _3309 * _3313;
    bool _3343 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3345 = isnan(_1100);
    bool _3347 = _3343 || _3345;
    bool _3349 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3351 = _3347 || _3349;
    float _3353 = float(_3351);
    float _3355 = _3295 * _3339;
    float _3357 = -_3295;
    float _3359 = _3357 + 1.0;
    float _3361 = trunc(_3297);
    float _3363 = precise::max(_3361, 0.0);
    uint _3365 = uint(_3363);
    bool _3367 = _2687 != 3;
    float _3369 = _3325 * _3359;
    float _3371 = -_3325;
    float _3373 = _3371 + 1.0;
    bool _3375 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3377 = isnan(_1100);
    bool _3379 = _3375 || _3377;
    bool _3381 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3383 = _3379 || _3381;
    float _3385 = float(_3383);
    bool _3387 = !_3367;
    int _3389 = _3387 ? 0 : (-1);
    int _3391 = _3155 * int(_3331);
    int _3393 = _3391 + _1983;
    float _3395 = _3353 * _3373;
    float _3397 = -_3353;
    float _3399 = _3397 + 1.0;
    bool _3401 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3403 = isnan(_1100);
    bool _3405 = _3401 || _3403;
    bool _3407 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3409 = _3405 || _3407;
    float _3411 = float(_3409);
    float _3413 = -_3385;
    float _3415 = _3413 + 1.0;
    float _3417 = float(uint(_3393));
    float _3419 = _3385 * _3399;
    bool _3421 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3423 = isnan(_1100);
    bool _3425 = _3421 || _3423;
    bool _3427 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3429 = _3425 || _3427;
    float _3431 = float(_3429);
    float _3433 = _3411 * _3415;
    float _3435 = -_3411;
    float _3437 = _3435 + 1.0;
    float _3439 = as_type<float>(_1280) * _3417;
    float _3441 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3443 = _1100 + _3441;
    float _3445 = _2799 + _3127;
    float _3447 = trunc(_3269);
    float _3449 = precise::max(_3447, 0.0);
    uint _3451 = uint(_3449);
    int _3453 = _3245 * int(_3265);
    int _3455 = _3453 + _2173;
    float _3457 = _3431 * _3437;
    float _3459 = fma(_3211, _3443, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3461 = _2797 + _1561;
    float _3463 = -_3431;
    float _3465 = _3463 + 1.0;
    float _3467 = float(uint(_3455));
    float _3469 = _3197 * _3457;
    float _3471 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3473 = ~_3223;
    int _3475 = _3473 + 1;
    int _3477 = _3475 + 1;
    float _3479 = fma(_3465, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3469);
    float _3481 = as_type<float>(_1479) * _3467;
    float _3483 = _2843 + _1597;
    int _3485 = _3477;
    if (!_3233)
    {
        int _3487 = ~_3223;
        int _3489 = _3487 + 1;
        _3485 = _3489;
    }
    int _3491 = _3485;
    float _3493 = fma(_3209, _3433, _3479);
    float _3495 = trunc(_3439);
    float _3497 = precise::max(_3495, 0.0);
    uint _3499 = uint(_3497);
    int _3501 = ~_1166;
    int _3503 = _3501 + 1;
    int _3505 = int(_3207) + int(_3365);
    float _3507 = fma(_3237, _3419, _3493);
    int _3509 = ~_1238;
    int _3511 = _3509 + 1;
    int _3513 = int(_3169) + int(_3451);
    float _3515 = trunc(_3481);
    float _3517 = precise::max(_3515, 0.0);
    uint _3519 = uint(_3517);
    int _3521 = _3503 * _3505;
    int _3523 = _3521 + _1857;
    float _3525 = _3471 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    bool _3527 = !_2875;
    int _3529 = _3527 ? 0 : 1;
    float _3531 = fma(_3213, _3395, _3507);
    int _3533 = ~_1218;
    int _3535 = _3533 + 1;
    int _3537 = _3511 * _3513;
    int _3539 = _3537 + _1881;
    int _3541 = int(_3331) + int(_3499);
    float _3543 = fma(_3525, _1214, -0.5);
    bool _3545 = uint(_3523) >= uint(_1166);
    float _3547 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3549 = _3461 + _3547;
    int _3551 = ~_1252;
    int _3553 = _3551 + 1;
    int _3555 = _3535 * _3541;
    int _3557 = _3555 + _1983;
    bool _3559 = !_3545;
    int _3561 = _3559 ? 0 : (-1);
    float _3563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3565 = _3445 + _3563;
    bool _3567 = uint(_3539) >= uint(_1238);
    float _3569 = _1439 * 2.0;
    int _3571 = int(_3265) + int(_3519);
    float _3573 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3575 = _3483 + _3573;
    float _3577 = fma(_3253, _3369, _3531);
    bool _3579 = !_3567;
    int _3581 = _3579 ? 0 : (-1);
    float _3583 = floor(_3569);
    bool _3585 = uint(_3557) >= uint(_1218);
    float _3587 = _3549 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3589 = _3553 * _3571;
    int _3591 = _3589 + _2173;
    int _3593 = ~_3505;
    int _3595 = _3593 + _3561;
    int _3597 = _3595 + 1;
    float _3599 = fma(_3255, _3355, _3577);
    float _3601 = fma(_3565, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3587);
    bool _3603 = !_3585;
    int _3605 = _3603 ? 0 : (-1);
    float _3607 = _1112 + _1439;
    bool _3609 = uint(_3591) >= uint(_1252);
    float _3611 = fma(_3575, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3601);
    int _3613 = ~_3513;
    int _3615 = _3613 + _3581;
    int _3617 = _3615 + 1;
    float _3619 = _1112 + _1427;
    bool _3621 = !_3609;
    int _3623 = _3621 ? 0 : (-1);
    float _3625 = fma(_3459, _3341, _3599);
    bool _3627 = _3611 >= 0.0;
    int _3629 = _1166 * _3597;
    int _3631 = _3629 + _1857;
    float _3633 = _3619 + (-1.0);
    int _3635 = _1238 * _3617;
    int _3637 = _3635 + _1881;
    bool _3639 = !_3335;
    int _3641 = _3639 ? 0 : 1;
    float _3643 = fma(_3281, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3625);
    float _3645 = fma(_3633, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3647 = _3549 * _3549;
    int _3649 = _2593 & 3;
    bool _3651 = _3649 != 0;
    float _3653 = _3607 + (-1.0);
    int _3655 = _2421 >> 31;
    float _3657 = fma(_3565, _3565, _3647);
    bool _3659 = !_3651;
    int _3661 = _3659 ? 0 : 1;
    float _3663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    int _3665 = _2673 & 3;
    bool _3667 = _3665 != 0;
    float _3669 = fma(_3575, _3575, _3657);
    bool _3671 = !_2433;
    int _3673 = _3671 ? 0 : 1;
    out.m_75.x = _3643;
    bool _3675 = !_3667;
    int _3677 = _3675 ? 0 : 1;
    float _3679 = _1112 + (-0.5);
    bool _3681 = _2431 != 3;
    float _3683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    if (_3627)
    {
        out.m_51.x = 0.0;
    }
    bool _3685 = _3583 > 0.0;
    bool _3687 = _3583 >= 0.0;
    bool _3689 = isnan(_3583);
    bool _3691 = _3687 || _3689;
    bool _3693 = isnan(0.0);
    bool _3695 = _3691 || _3693;
    float _3697 = fma(_3653, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3699 = _3583;
    if (_3627)
    {
        _3699 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3701 = _3699;
    float _3703 = rsqrt(_3669);
    int _3705 = _3655 & 3;
    int _3707 = _2477 >> 31;
    int _3709 = as_type<int>(_3701);
    if (_3627)
    {
        float _3711 = _3701 * 5.0;
        _3709 = as_type<int>(_3711);
    }
    int _3713 = _3709;
    int _3715 = _2421 + _3705;
    int _3717 = _2593 >> 31;
    int _3719 = _3715 >> 2;
    if (_3627)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _12190 = as_type<float>(_3713);
        out.gl_Position.z = _12190;
    }
    int _3721 = _3707 & 3;
    int _3723 = _3717 & 3;
    int _3725 = _3719 << 4;
    int _3727 = _3725 + 368;
    float _3729 = _3549 * _3703;
    int _3731 = _2593 + _3723;
    float _3733 = _3565 * _3703;
    int _3735 = _2477 + _3721;
    float _3737 = -_3729;
    float _3739 = fma(_3737, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3549);
    float _3741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3743 = _2673 >> 31;
    float _3745 = -_3733;
    float _3747 = fma(_3745, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3565);
    float _3749 = _3739 * _3739;
    int _3751 = _3731 >> 2;
    float _3753 = _3575 * _3703;
    int _3755 = _3743 & 3;
    float _3757 = fma(_3747, _3747, _3749);
    uint _3759 = uint(int(uint(_3727) >> uint(2)));
    uint _3761 = uint(int(uint(int(_3759)) >> uint(2)));
    int _3763 = int(_3759) & 3;
    float _3765 = (*spvDescriptorSet0.vp_c9)._m0[int(_3761)][_3763];
    int _3767 = int(_3759) + 1;
    uint _3769 = uint(int(uint(_3767) >> uint(2)));
    int _3771 = _3767 & 3;
    float _3773 = (*spvDescriptorSet0.vp_c9)._m0[int(_3769)][_3771];
    int _3775 = _3751 << 4;
    int _3777 = _3775 + 656;
    float _3779 = -_3753;
    float _3781 = fma(_3779, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3575);
    int _3783 = _2673 + _3755;
    bool _3785 = !_3681;
    int _3787 = _3785 ? 0 : (-1);
    int _3789 = _3783 >> 2;
    float _3791 = _3741 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    uint _3793 = uint(int(uint(_3777) >> uint(2)));
    uint _3795 = uint(int(uint(int(_3793)) >> uint(2)));
    int _3797 = int(_3793) & 3;
    float _3799 = (*spvDescriptorSet0.vp_c9)._m0[int(_3795)][_3797];
    int _3801 = int(_3793) + 1;
    uint _3803 = uint(int(uint(_3801) >> uint(2)));
    int _3805 = _3801 & 3;
    float _3807 = (*spvDescriptorSet0.vp_c9)._m0[int(_3803)][_3805];
    int _3809 = _3735 >> 2;
    bool _3811 = _2499 != 3;
    float _3813 = fma(_3791, _2887, -0.5);
    int _3815 = _3809 << 4;
    int _3817 = _3815 + 512;
    float _3819 = fma(_3781, _3781, _3757);
    bool _3821 = !_3811;
    int _3823 = _3821 ? 0 : (-1);
    float _3825 = -_3067;
    float _3827 = fma(_3057, _3813, _3825);
    bool _3829 = _2609 != 3;
    uint _3831 = uint(int(uint(_3817) >> uint(2)));
    uint _3833 = uint(int(uint(int(_3831)) >> uint(2)));
    int _3835 = int(_3831) & 3;
    float _3837 = (*spvDescriptorSet0.vp_c9)._m0[int(_3833)][_3835];
    int _3839 = int(_3831) + 1;
    uint _3841 = uint(int(uint(_3839) >> uint(2)));
    int _3843 = _3839 & 3;
    float _3845 = (*spvDescriptorSet0.vp_c9)._m0[int(_3841)][_3843];
    int _3847 = _3789 << 4;
    int _3849 = _3847 + 800;
    float _3851 = _2955 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _3853 = ~_3571;
    int _3855 = _3853 + _3623;
    int _3857 = _3855 + 1;
    float _3859 = _1619 * _3663;
    int _3861 = ~_3541;
    int _3863 = _3861 + _3605;
    int _3865 = _3863 + 1;
    float _3867 = _3851 * _3683;
    int _3869 = abs(_2497);
    float _3871 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3873 = int(_3871);
    bool _3875 = !_2409;
    int _3877 = _3875 ? _3631 : (-1);
    int _3879 = _3777 + 8;
    uint _3881 = uint(int(uint(_3879) >> uint(2)));
    uint _3883 = uint(int(uint(int(_3881)) >> uint(2)));
    int _3885 = int(_3881) & 3;
    float _3887 = (*spvDescriptorSet0.vp_c9)._m0[int(_3883)][_3885];
    int _3889 = int(_3881) + 1;
    uint _3891 = uint(int(uint(_3889) >> uint(2)));
    int _3893 = _3889 & 3;
    float _3895 = (*spvDescriptorSet0.vp_c9)._m0[int(_3891)][_3893];
    bool _3897 = !_2469;
    int _3899 = _3897 ? _3637 : (-1);
    out.m_77.x = _3859;
    out.m_77.y = _3867;
    int _3901 = _3695 ? 0 : 1;
    int _3903 = _1218 * _3865;
    int _3905 = _3903 + _1983;
    int _3907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3909 = _3907 != 0;
    int _3911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3913 = _3911 != 0;
    int _3915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3917 = _3915 != 0;
    int _3919 = _1252 * _3857;
    int _3921 = _3919 + _2173;
    int _3923 = ~_3901;
    int _3925 = _3923 + 1;
    int _3927 = _3925 + 1;
    uint _3929 = uint(int(uint(_3849) >> uint(2)));
    uint _3931 = uint(int(uint(int(_3929)) >> uint(2)));
    int _3933 = int(_3929) & 3;
    float _3935 = (*spvDescriptorSet0.vp_c9)._m0[int(_3931)][_3933];
    int _3937 = int(_3929) + 1;
    uint _3939 = uint(int(uint(_3937) >> uint(2)));
    int _3941 = _3937 & 3;
    float _3943 = (*spvDescriptorSet0.vp_c9)._m0[int(_3939)][_3941];
    int _3945 = _3927;
    if (!_3685)
    {
        int _3947 = ~_3901;
        int _3949 = _3947 + 1;
        _3945 = _3949;
    }
    int _3951 = _3945;
    float _3953 = fma(_3055, _3543, _3065);
    int _3955 = abs(_2589);
    float _3957 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3959 = int(_3957);
    int _3961 = ~_3869;
    int _3963 = _3961 + 1;
    int _3965 = _3963 + 1;
    int _3967 = abs(_2681);
    int _3969 = _3727 + 8;
    uint _3971 = uint(int(uint(_3969) >> uint(2)));
    uint _3973 = uint(int(uint(int(_3971)) >> uint(2)));
    int _3975 = int(_3971) & 3;
    float _3977 = (*spvDescriptorSet0.vp_c9)._m0[int(_3973)][_3975];
    int _3979 = int(_3971) + 1;
    uint _3981 = uint(int(uint(_3979) >> uint(2)));
    int _3983 = _3979 & 3;
    float _3985 = (*spvDescriptorSet0.vp_c9)._m0[int(_3981)][_3983];
    int _3987 = abs(_3661);
    int _3989 = _3965 * as_type<int>(_3773);
    int _3991 = abs(_3673);
    int _3993 = abs(_2739);
    int _3995 = _3817 + 8;
    uint _3997 = uint(int(uint(_3995) >> uint(2)));
    uint _3999 = uint(int(uint(int(_3997)) >> uint(2)));
    int _4001 = int(_3997) & 3;
    float _4003 = (*spvDescriptorSet0.vp_c9)._m0[int(_3999)][_4001];
    int _4005 = int(_3997) + 1;
    uint _4007 = uint(int(uint(_4005) >> uint(2)));
    int _4009 = _4005 & 3;
    float _4011 = (*spvDescriptorSet0.vp_c9)._m0[int(_4007)][_4009];
    int _4013 = ~_3991;
    int _4015 = _4013 + 1;
    int _4017 = _4015 + 1;
    int _4019 = ~_3967;
    int _4021 = _4019 + 1;
    int _4023 = _4021 + 1;
    int _4025 = ~_3987;
    int _4027 = _4025 + 1;
    int _4029 = _4027 + 1;
    int _4031 = _3849 + 8;
    uint _4033 = uint(int(uint(_4031) >> uint(2)));
    uint _4035 = uint(int(uint(int(_4033)) >> uint(2)));
    int _4037 = int(_4033) & 3;
    float _4039 = (*spvDescriptorSet0.vp_c9)._m0[int(_4035)][_4037];
    int _4041 = int(_4033) + 1;
    uint _4043 = uint(int(uint(_4041) >> uint(2)));
    int _4045 = _4041 & 3;
    float _4047 = (*spvDescriptorSet0.vp_c9)._m0[int(_4043)][_4045];
    int _4049 = abs(_3641);
    int _4051 = _4023 * as_type<int>(_3807);
    int _4053 = abs(_2665);
    int _4055 = _4017 * as_type<int>(_3765);
    int _4057 = _4055 + _3989;
    int _4059 = abs(_2519);
    int _4061 = _4029 * as_type<int>(_3799);
    int _4063 = _4061 + _4051;
    int _4065 = abs(_3677);
    int _4067 = ~_3955;
    int _4069 = _4067 + 1;
    int _4071 = _4069 + 1;
    int _4073 = abs(_2575);
    int _4075 = _4071 * as_type<int>(_3845);
    int _4077 = ~_4053;
    int _4079 = _4077 + 1;
    int _4081 = _4079 + 1;
    float _4083 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4085 = int(_4083);
    int _4087 = ~_3993;
    int _4089 = _4087 + 1;
    int _4091 = _4089 + 1;
    int _4093 = ~_4065;
    int _4095 = _4093 + 1;
    int _4097 = _4095 + 1;
    int _4099 = _4081 * as_type<int>(_3887);
    int _4101 = _4099 + _4063;
    int _4103 = ~_4049;
    int _4105 = _4103 + 1;
    int _4107 = _4105 + 1;
    int _4109 = _4091 * as_type<int>(_3943);
    int _4111 = ~_4059;
    int _4113 = _4111 + 1;
    int _4115 = _4113 + 1;
    int _4117 = _4107 * as_type<int>(_3837);
    int _4119 = _4117 + _4075;
    int _4121 = abs(_3787);
    int _4123 = _4097 * as_type<int>(_3935);
    int _4125 = _4123 + _4109;
    int _4127 = ~_4073;
    int _4129 = _4127 + 1;
    int _4131 = _4129 + 1;
    float _4133 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4135 = int(_4133);
    int _4137 = abs(_2729);
    int _4139 = _4115 * as_type<int>(_3977);
    int _4141 = _4139 + _4057;
    bool _4143 = !_3829;
    int _4145 = _4143 ? 0 : (-1);
    int _4147 = ~_4121;
    int _4149 = _4147 + 1;
    int _4151 = _4149 + 1;
    int _4153 = ~_4137;
    int _4155 = _4153 + 1;
    int _4157 = _4155 + 1;
    int _4159 = abs(_3823);
    int _4161 = _4131 * as_type<int>(_4003);
    int _4163 = _4161 + _4119;
    int _4165 = abs(_4145);
    int _4167 = _4151 * as_type<int>(_3985);
    int _4169 = _4167 + _4141;
    float _4171 = float(uint(_3959));
    int _4173 = ~_4159;
    int _4175 = _4173 + 1;
    int _4177 = _4175 + 1;
    int _4179 = abs(_3389);
    int _4181 = _4157 * as_type<int>(_4039);
    int _4183 = _4181 + _4125;
    float _4185 = float(uint(_3873));
    float _4187 = 1.0 / _4171;
    int _4189 = ~_4165;
    int _4191 = _4189 + 1;
    int _4193 = _4191 + 1;
    int _4195 = _4177 * as_type<int>(_4011);
    int _4197 = _4195 + _4163;
    int _4199 = abs(_2599);
    int _4201 = ~_4179;
    int _4203 = _4201 + 1;
    int _4205 = _4203 + 1;
    int _4207 = _4193 * as_type<int>(_3895);
    int _4209 = _4207 + _4101;
    int _4211 = abs(_3959);
    float _4213 = 1.0 / _4185;
    int _4215 = abs(_2615);
    int _4217 = _4205 * as_type<int>(_4047);
    int _4219 = _4217 + _4183;
    int _4221 = ~_4199;
    int _4223 = _4221 + 1;
    int _4225 = _4223 + 1;
    float _4227 = float(uint(_4085));
    float _4229 = float(uint(_4211));
    int _4231 = _4169 * _4225;
    int _4233 = abs(_4085);
    int _4235 = ~_4215;
    int _4237 = _4235 + 1;
    int _4239 = _4237 + 1;
    float _4241 = 1.0 / _4229;
    int _4243 = _3877 * _4199;
    int _4245 = _4243 + _4231;
    int _4247 = abs(_2693);
    int _4249 = _4239 * _4197;
    float _4251 = float(uint(_4135));
    int _4253 = abs(_3873);
    float _4255 = 1.0 / _4227;
    int _4257 = abs(_4135);
    int _4259 = _3899 * _4215;
    int _4261 = _4259 + _4249;
    int _4263 = ~_4247;
    int _4265 = _4263 + 1;
    int _4267 = _4265 + 1;
    bool _4269 = _1218 == 0;
    int _4271 = _4267 * _4209;
    int _4273 = as_type<int>(_4187) + (-2);
    float _4275 = 1.0 / _4251;
    float _4277 = float(uint(_4245));
    float _4279 = float(uint(_4233));
    float _4281 = float(uint(_4253));
    float _4283 = as_type<float>(_4273) * _4277;
    int _4285 = abs(_3529);
    float _4287 = 1.0 / _4279;
    bool _4289 = !_4269;
    int _4291 = _4289 ? _3905 : (-1);
    int _4293 = as_type<int>(_4213) + (-2);
    float _4295 = float(uint(_4261));
    bool _4297 = _1252 == 0;
    float _4299 = 1.0 / _4281;
    int _4301 = ~_4285;
    int _4303 = _4301 + 1;
    int _4305 = _4303 + 1;
    float _4307 = as_type<float>(_4293) * _4295;
    bool _4309 = !_4297;
    int _4311 = _4309 ? _3921 : (-1);
    int _4313 = as_type<int>(_4255) + (-2);
    int _4315 = _4305 * _4219;
    float _4317 = float(uint(_4257));
    float _4319 = trunc(_4283);
    float _4321 = precise::max(_4319, 0.0);
    uint _4323 = uint(_4321);
    int _4325 = _4291 * _4247;
    int _4327 = _4325 + _4271;
    int _4329 = abs(_4245);
    int _4331 = _4311 * _4285;
    int _4333 = _4331 + _4315;
    int _4335 = abs(_4261);
    float _4337 = _3953 + 0.5;
    float _4339 = float(uint(_4327));
    float _4341 = trunc(_4307);
    float _4343 = precise::max(_4341, 0.0);
    uint _4345 = uint(_4343);
    int _4347 = as_type<int>(_4275) + (-2);
    float _4349 = as_type<float>(_4313) * _4339;
    float _4351 = float(uint(_4333));
    int _4353 = as_type<int>(_4241) + (-2);
    float _4355 = 1.0 / _4317;
    float _4357 = float(uint(_4329));
    float _4359 = as_type<float>(_4347) * _4351;
    int _4361 = ~_3959;
    int _4363 = _4361 + 1;
    float _4365 = _3827 + 0.5;
    int _4367 = as_type<int>(_4299) + (-2);
    float _4369 = as_type<float>(_4353) * _4357;
    int _4371 = ~_3873;
    int _4373 = _4371 + 1;
    float _4375 = trunc(_4349);
    float _4377 = precise::max(_4375, 0.0);
    uint _4379 = uint(_4377);
    int _4381 = _4363 * int(_4323);
    int _4383 = _4381 + _4245;
    out.m_79.x = _4337;
    out.m_79.y = _4365;
    int _4385 = abs(_4327);
    int _4387 = as_type<int>(_4287) + (-2);
    float _4389 = float(uint(_4383));
    float _4391 = trunc(_4359);
    float _4393 = precise::max(_4391, 0.0);
    uint _4395 = uint(_4393);
    float _4397 = float(uint(_4335));
    int _4399 = as_type<int>(_4355) + (-2);
    bool _4401 = !_3913;
    int _4403 = _4401 ? 0 : 1;
    float _4405 = as_type<float>(_4367) * _4397;
    int _4407 = _4373 * int(_4345);
    int _4409 = _4407 + _4261;
    bool _4411 = !_3909;
    int _4413 = _4411 ? 0 : 1;
    float _4415 = trunc(_4369);
    float _4417 = precise::max(_4415, 0.0);
    uint _4419 = uint(_4417);
    int _4421 = abs(_4333);
    float _4423 = as_type<float>(_4273) * _4389;
    float _4425 = float(uint(_4409));
    float _4427 = float(uint(_4421));
    float _4429 = in.m_81.x;
    float _4431 = in.m_81.y;
    float _4433 = in.m_81.z;
    float _4435 = float(uint(_4385));
    float _4437 = as_type<float>(_4293) * _4425;
    float _4439 = trunc(_4405);
    float _4441 = precise::max(_4439, 0.0);
    uint _4443 = uint(_4441);
    float _4445 = as_type<float>(_4399) * _4427;
    int _4447 = abs(_4403);
    float _4449 = as_type<float>(_4387) * _4435;
    int _4451 = abs(_4413);
    int _4453 = ~_4135;
    int _4455 = _4453 + 1;
    float _4457 = trunc(_4449);
    float _4459 = precise::max(_4457, 0.0);
    uint _4461 = uint(_4459);
    float _4463 = float(_3177);
    float _4465 = float(_4447);
    int _4467 = _4455 * int(_4395);
    int _4469 = _4467 + _4333;
    int _4471 = ~_4085;
    int _4473 = _4471 + 1;
    int _4475 = ~_4211;
    int _4477 = _4475 + 1;
    float _4479 = _4465 * _4463;
    float _4481 = float(_3951);
    int _4483 = _4473 * int(_4379);
    int _4485 = _4483 + _4327;
    float _4487 = float(_4451);
    float _4489 = trunc(_4445);
    float _4491 = precise::max(_4489, 0.0);
    uint _4493 = uint(_4491);
    float _4495 = float(uint(_4469));
    float _4497 = _4487 * _4481;
    float _4499 = float(uint(_4485));
    int _4501 = _4477 * int(_4419);
    int _4503 = _4501 + _4329;
    int _4505 = ~_4253;
    int _4507 = _4505 + 1;
    float _4509 = _4497 * (-2.0);
    float _4511 = as_type<float>(_4347) * _4495;
    float _4513 = as_type<float>(_4313) * _4499;
    float _4515 = float(uint(_4503));
    int _4517 = _4507 * int(_4443);
    int _4519 = _4517 + _4335;
    int _4521 = ~_4233;
    int _4523 = _4521 + 1;
    float _4525 = trunc(_4423);
    float _4527 = precise::max(_4525, 0.0);
    uint _4529 = uint(_4527);
    float _4531 = fma(_3645, _4509, _3645);
    float _4533 = fma(_4509, _4429, _4429);
    float _4535 = as_type<float>(_4353) * _4515;
    float _4537 = _1427 + (-0.5);
    float _4539 = float(uint(_4519));
    int _4541 = _4523 * int(_4461);
    int _4543 = _4541 + _4385;
    int _4545 = ~_3873;
    int _4547 = _4545 + 1;
    float _4549 = trunc(_4511);
    float _4551 = precise::max(_4549, 0.0);
    uint _4553 = uint(_4551);
    int _4555 = ~_4257;
    int _4557 = _4555 + 1;
    float _4559 = fma(_4537, (*spvDescriptorSet0.vp_c9)._m0[196].x, _4533);
    float _4561 = as_type<float>(_4367) * _4539;
    float _4563 = float(uint(_4543));
    float _4565 = fma(_4531, _3083, _4559);
    float _4567 = trunc(_4513);
    float _4569 = precise::max(_4567, 0.0);
    uint _4571 = uint(_4569);
    float _4573 = as_type<float>(_4387) * _4563;
    int _4575 = int(_4323) + int(_4529);
    int _4577 = _4557 * int(_4493);
    int _4579 = _4577 + _4421;
    int _4581 = ~_3959;
    int _4583 = _4581 + 1;
    int _4585 = ~_4135;
    int _4587 = _4585 + 1;
    float _4589 = trunc(_4437);
    float _4591 = precise::max(_4589, 0.0);
    uint _4593 = uint(_4591);
    int _4595 = int(_4395) + int(_4553);
    int _4597 = _4583 * _4575;
    int _4599 = _4597 + _4245;
    float _4601 = float(uint(_4579));
    bool _4603 = _4135 == 0;
    bool _4605 = uint(_4599) >= uint(_3959);
    float _4607 = trunc(_4561);
    float _4609 = precise::max(_4607, 0.0);
    uint _4611 = uint(_4609);
    int _4613 = int(_4379) + int(_4571);
    float _4615 = as_type<float>(_4399) * _4601;
    bool _4617 = !_3917;
    int _4619 = _4617 ? 0 : 1;
    float _4621 = trunc(_4535);
    float _4623 = precise::max(_4621, 0.0);
    uint _4625 = uint(_4623);
    int _4627 = ~_4085;
    int _4629 = _4627 + 1;
    int _4631 = int(_4345) + int(_4593);
    int _4633 = _4629 * _4613;
    int _4635 = _4633 + _4327;
    float _4637 = trunc(_4573);
    float _4639 = precise::max(_4637, 0.0);
    uint _4641 = uint(_4639);
    int _4643 = int(_4443) + int(_4611);
    int _4645 = _4547 * _4631;
    int _4647 = _4645 + _4261;
    int _4649 = ~_4211;
    int _4651 = _4649 + 1;
    int _4653 = _4587 * _4595;
    int _4655 = _4653 + _4333;
    bool _4657 = uint(_4635) >= uint(_4085);
    int _4659 = ~_4253;
    int _4661 = _4659 + 1;
    float _4663 = trunc(_4615);
    float _4665 = precise::max(_4663, 0.0);
    uint _4667 = uint(_4665);
    int _4669 = int(_4419) + int(_4625);
    int _4671 = ~_4233;
    int _4673 = _4671 + 1;
    int _4675 = _4661 * _4643;
    int _4677 = _4675 + _4335;
    bool _4679 = uint(_4647) >= uint(_3873);
    int _4681 = _4651 * _4669;
    int _4683 = _4681 + _4329;
    bool _4685 = uint(_4655) >= uint(_4135);
    float _4687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _4689 = int(_4461) + int(_4641);
    int _4691 = ~_4257;
    int _4693 = _4691 + 1;
    int _4695 = _4673 * _4689;
    int _4697 = _4695 + _4385;
    bool _4699 = !_4605;
    int _4701 = _4699 ? 0 : (-1);
    bool _4703 = uint(_4683) >= uint(_4211);
    bool _4705 = !_4679;
    int _4707 = _4705 ? 0 : (-1);
    bool _4709 = uint(_4677) >= uint(_4253);
    bool _4711 = !_4657;
    int _4713 = _4711 ? 0 : (-1);
    float _4715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4717 = uint(_4697) >= uint(_4233);
    bool _4719 = !_4685;
    int _4721 = _4719 ? 0 : (-1);
    int _4723 = ~_4575;
    int _4725 = _4723 + _4701;
    int _4727 = _4725 + 1;
    int _4729 = int(_4493) + int(_4667);
    int _4731 = ~_4631;
    int _4733 = _4731 + _4707;
    int _4735 = _4733 + 1;
    int _4737 = _3959 * _4727;
    int _4739 = _4737 + _4245;
    int _4741 = ~_4595;
    int _4743 = _4741 + _4721;
    int _4745 = _4743 + 1;
    float _4747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    int _4749 = ~_4613;
    int _4751 = _4749 + _4713;
    int _4753 = _4751 + 1;
    int _4755 = _4693 * _4729;
    int _4757 = _4755 + _4421;
    bool _4759 = !_4703;
    int _4761 = _4759 ? 0 : (-1);
    int _4763 = _3873 * _4735;
    int _4765 = _4763 + _4261;
    bool _4767 = _3959 == 0;
    int _4769 = _4085 * _4753;
    int _4771 = _4769 + _4327;
    int _4773 = _4245 ^ _3959;
    float _4775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4777 = !_4717;
    int _4779 = _4777 ? 0 : (-1);
    int _4781 = _4135 * _4745;
    int _4783 = _4781 + _4333;
    bool _4785 = _3873 == 0;
    bool _4787 = !_4767;
    int _4789 = _4787 ? _4739 : (-1);
    bool _4791 = _4085 == 0;
    float _4793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _4795 = uint(int(uint(_4773) >> uint(31)));
    bool _4797 = uint(_4757) >= uint(_4257);
    bool _4799 = !_4785;
    int _4801 = _4799 ? _4765 : (-1);
    float _4803 = _4687 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4805 = !_4791;
    int _4807 = _4805 ? _4771 : (-1);
    int _4809 = ~_4761;
    int _4811 = _4669 + _4809;
    int _4813 = _4811 + 1;
    float _4815 = fma(_4803, _1625, -0.5);
    float _4817 = float(_4789);
    float _4819 = _4775 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4821 = ~int(_4795);
    int _4823 = _4821 + 1;
    bool _4825 = !_4603;
    int _4827 = _4825 ? _4783 : (-1);
    float _4829 = fma(_4803, _4817, _3053);
    int _4831 = _4261 ^ _3873;
    float _4833 = _4747 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    bool _4835 = _4085 == 0;
    float _4837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4839 = _4327 ^ _4085;
    float _4841 = _4715 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4843 = _4333 ^ _4135;
    float _4845 = fma(_4833, _2393, -0.5);
    float _4847 = float(_4801);
    float _4849 = fma(_4841, _1719, -0.5);
    int _4851 = _4813 ^ _4823;
    float _4853 = fma(_4819, _1555, -0.5);
    float _4855 = float(_4827);
    float _4857 = fma(_4841, _4847, _3071);
    bool _4859 = !_4709;
    int _4861 = _4859 ? 0 : (-1);
    float _4863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4865 = !_4797;
    int _4867 = _4865 ? 0 : (-1);
    float _4869 = fma(_4833, _4855, _3037);
    uint _4871 = uint(int(uint(_4831) >> uint(31)));
    float _4873 = fma(_3059, _4849, _4857);
    uint _4875 = uint(int(uint(_4839) >> uint(31)));
    float _4877 = fma(_3031, _4815, _4829);
    uint _4879 = uint(int(uint(_4843) >> uint(31)));
    float _4881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _4883 = _3959 == 0;
    float _4885 = fma(_3047, _4845, _4869);
    int _4887 = ~_4823;
    int _4889 = _4887 + _4851;
    int _4891 = _4889 + 1;
    bool _4893 = _4135 == 0;
    int _4895 = ~_4861;
    int _4897 = _4643 + _4895;
    int _4899 = _4897 + 1;
    int _4901 = ~_4779;
    int _4903 = _4689 + _4901;
    int _4905 = _4903 + 1;
    int _4907 = ~_4867;
    int _4909 = _4729 + _4907;
    int _4911 = _4909 + 1;
    int _4913 = ~int(_4871);
    int _4915 = _4913 + 1;
    int _4917 = ~int(_4875);
    int _4919 = _4917 + 1;
    float _4921 = _4881 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _4923 = ~int(_4879);
    int _4925 = _4923 + 1;
    float _4927 = float(_4807);
    float _4929 = fma(_4921, _2771, -0.5);
    bool _4931 = !_4883;
    int _4933 = _4931 ? _4891 : (-1);
    int _4935 = _4899 ^ _4915;
    float _4937 = fma(_4819, _4927, _3077);
    int _4939 = _4905 ^ _4919;
    float _4941 = _4793 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4943 = _4911 ^ _4925;
    float _4945 = _4837 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4947 = float(_4933);
    float _4949 = fma(_4941, _2675, -0.5);
    bool _4951 = _3873 == 0;
    float _4953 = _4863 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _4955 = ~_4915;
    int _4957 = _4955 + _4935;
    int _4959 = _4957 + 1;
    float _4961 = -_3041;
    float _4963 = fma(_4941, _4947, _4961);
    int _4965 = ~_4919;
    int _4967 = _4965 + _4939;
    int _4969 = _4967 + 1;
    float _4971 = fma(_4945, _2759, -0.5);
    int _4973 = ~_4925;
    int _4975 = _4973 + _4943;
    int _4977 = _4975 + 1;
    float _4979 = fma(_3045, _4853, _4937);
    bool _4981 = !_4951;
    int _4983 = _4981 ? _4959 : (-1);
    float _4985 = fma(_3007, _4949, _4963);
    bool _4987 = !_4835;
    int _4989 = _4987 ? _4969 : (-1);
    float _4991 = _4979 + 0.5;
    bool _4993 = !_4893;
    int _4995 = _4993 ? _4977 : (-1);
    float _4997 = float(_4983);
    float _4999 = float(_4989);
    float _5001 = fma(_4953, _2773, -0.5);
    float _5003 = float(_4995);
    float _5005 = -_3073;
    float _5007 = fma(_4945, _4997, _5005);
    float _5009 = _4479 * (-2.0);
    float _5011 = -_3079;
    float _5013 = fma(_4953, _4999, _5011);
    float _5015 = _4885 + 0.5;
    float _5017 = -_3039;
    float _5019 = fma(_4921, _5003, _5017);
    float _5021 = fma(_3061, _4971, _5007);
    float _5023 = fma(_3043, _5001, _5013);
    float _5025 = _4877 + 0.5;
    float _5027 = fma(_3049, _4929, _5019);
    float _5029 = _4873 + 0.5;
    float _5031 = _4985 + 0.5;
    float _5033 = _5021 + 0.5;
    float _5035 = _5023 + 0.5;
    float _5037 = _5027 + 0.5;
    float _5039 = fma(_3697, _5009, _3697);
    float _5041 = fma(_5009, _4431, _4431);
    out.m_83.x = _5025;
    out.m_83.y = _5031;
    out.m_83.z = _5029;
    out.m_83.w = _5033;
    out.m_85.x = _4991;
    out.m_85.y = _5035;
    out.m_87.x = _5015;
    out.m_87.y = _5037;
    int _5043 = as_type<int>(_5029);
    if (_3627)
    {
        return out;
    }
    float _5045 = -_3729;
    float _5047 = fma(_5045, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3461);
    float _5049 = -_3733;
    float _5051 = fma(_5049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3445);
    float _5053 = -_3753;
    float _5055 = fma(_5053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3483);
    int _5057 = abs(_4619);
    float _5059 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5061 = _5047 + _5059;
    float _5063 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5065 = _5051 + _5063;
    float _5067 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5069 = _5055 + _5067;
    float _5071 = float(_3491);
    float _5073 = _5061 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5075 = float(_5057);
    float _5077 = _1427 + _1439;
    float _5079 = fma(_3679, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5041);
    float _5081 = fma(_5065, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5073);
    float _5083 = _1439 + (-0.5);
    float _5085 = _5075 * _5071;
    float _5087 = _5077 + (-1.0);
    float _5089 = fma(_5069, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5081);
    float _5091 = fma(_5039, _3083, _5079);
    float _5093 = _5085 * (-2.0);
    float _5095 = _4565 * 0.15915493667125701904296875;
    float _5097 = sqrt(_3819);
    bool _5099 = _5089 >= 0.0;
    float _5101 = fma(_5093, _4433, _4433);
    float _5103 = _5091 * 0.15915493667125701904296875;
    float _5105 = fma(_5083, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5101);
    float _5107 = fma(_5087, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5109 = _5095 * 6.283185482025146484375;
    float _5111 = sin(_5109);
    float _5113 = fma(_5107, _5093, _5107);
    float _5115 = _5085;
    float _5117 = _5051;
    float _5119 = _5069;
    if (_5099)
    {
        _5115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5121 = _5115;
    if (_5099)
    {
        out.m_51.x = 0.0;
    }
    float _5123 = fma(_5113, _3083, _5105);
    float _5125 = _5103 * 6.283185482025146484375;
    float _5127 = sin(_5125);
    if (_5099)
    {
        float _5129 = _5121 * 5.0;
        _5043 = as_type<int>(_5129);
    }
    int _5131 = _5043;
    float _5133 = _5123 * 0.15915493667125701904296875;
    if (_5099)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14185 = as_type<float>(_5131);
        out.gl_Position.z = _14185;
    }
    float _5135 = _5095 * 6.283185482025146484375;
    float _5137 = cos(_5135);
    float _5139 = _5103 * 6.283185482025146484375;
    float _5141 = cos(_5139);
    float _5143 = _5111 * _5127;
    float _5145 = _5133 * 6.283185482025146484375;
    float _5147 = sin(_5145);
    if (_5099)
    {
        return out;
    }
    float _5149 = -_3461;
    float _5151 = _5149 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5153 = -_3445;
    float _5155 = _5153 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5157 = in.m_89.x;
    float _5159 = in.m_89.y;
    float _5161 = in.m_89.z;
    float _5163 = -_3483;
    float _5165 = _5163 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5167 = _5151 * _5151;
    float _5169 = _5133 * 6.283185482025146484375;
    float _5171 = cos(_5169);
    float _5173 = _5137 * _5141;
    float _5175 = _592 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5177 = fma(_5155, _5155, _5167);
    float _5179 = fma(_5147, _5173, _5143);
    float _5181 = fma(_5147, _5143, _5173);
    float _5183 = fma(_5165, _5165, _5177);
    float _5185 = _3703 * _5097;
    float _5187 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5189 = _5137 * _5127;
    float _5191 = rsqrt(_5183);
    float _5193 = _5111 * _5141;
    float _5195 = _5137 * _5171;
    float _5197 = _5141 * _5171;
    float _5199 = _5111 * _5171;
    float _5201 = _5127 * _5171;
    float _5203 = _5185 * _5187;
    float _5205 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5157);
    float _5207 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5209 = _5185 * _5175;
    float _5211 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5159);
    float _5213 = _5205 * _5203;
    float _5215 = -_5189;
    float _5217 = fma(_5147, _5193, _5215);
    float _5219 = _5155 * _5191;
    float _5221 = -_5193;
    float _5223 = fma(_5147, _5189, _5221);
    float _5225 = _5185 * _5207;
    float _5227 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5161);
    float _5229 = _5165 * _5191;
    float _5231 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5233 = _5219 * _5231;
    float _5235 = _5211 * _5209;
    float _5237 = _5227 * _5225;
    float _5239 = in.m_91.x;
    float _5241 = in.m_91.y;
    float _5243 = in.m_91.z;
    float _5245 = _5151 * _5191;
    float _5247 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5249 = _5229 * _5247;
    float _5251 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5253 = -_5233;
    float _5255 = fma(_5229, _5251, _5253);
    bool _5257 = _5159 != 0.0;
    bool _5259 = isnan(_5159);
    bool _5261 = _5257 || _5259;
    bool _5263 = isnan(0.0);
    bool _5265 = _5261 || _5263;
    float _5267 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5269 = _5245 * _5267;
    float _5271 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5273 = -_5249;
    float _5275 = fma(_5245, _5271, _5273);
    float _5277 = _5255 * _5255;
    bool _5279 = _5157 == 0.0;
    bool _5281 = !_5265;
    bool _5283 = _5279 && _5281;
    float _5285 = in.m_93.x;
    float _5287 = in.m_93.y;
    float _5289 = in.m_93.z;
    float _5291 = in.m_93.w;
    float _5293 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5295 = -_5269;
    float _5297 = fma(_5219, _5293, _5295);
    float _5299 = fma(_5275, _5275, _5277);
    bool _5301 = _5161 == 0.0;
    bool _5303 = _5301 && _5283;
    float _5305 = -_5235;
    float _5307 = _5147 * _5305;
    float _5309 = _5195 * _5235;
    float _5311 = fma(_5297, _5297, _5299);
    float _5313 = _5199 * _5235;
    float _5315 = fma(_5197, _5213, _5307);
    float _5317 = fma(_5179, _5213, _5309);
    float _5319 = fma(_5217, _5213, _5313);
    float _5321 = rsqrt(_5311);
    float _5323 = fma(_5201, _5237, _5315);
    float _5325 = fma(_5223, _5237, _5317);
    float _5327 = fma(_5181, _5237, _5319);
    float _5329 = _5213;
    float _5331 = _5307;
    float _5333 = _5309;
    float _5335 = _5155;
    float _5337 = _5239;
    float _5339 = _5181;
    if (_5303)
    {
        _5329 = _5239;
    }
    float _5341 = _5329;
    float _5343 = _5341;
    if (_5303)
    {
        _5331 = _5243;
    }
    float _5345 = _5331;
    float _5347 = _5345;
    if (_5303)
    {
        _5333 = _5341;
    }
    float _5349 = _5333;
    float _5351 = _5349;
    if (!_5303)
    {
        _5343 = _5239;
    }
    float _5353 = _5343;
    if (_5303)
    {
        _5335 = _5241;
    }
    float _5355 = _5335;
    float _5357 = _5355;
    if (!_5303)
    {
        float _5359 = fma(_5159, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5241);
        _5357 = _5359;
    }
    float _5361 = _5357;
    if (_5303)
    {
        _5337 = _5345;
    }
    float _5363 = _5337;
    float _5365 = _5289 * _5353;
    float _5367 = _5363;
    if (!_5303)
    {
        _5347 = _5243;
    }
    float _5369 = _5347;
    float _5371 = _5275 * _5321;
    float _5373 = _5255 * _5321;
    if (!_5303)
    {
        float _5375 = fma(_5157, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5353);
        _5351 = _5375;
    }
    float _5377 = _5351;
    float _5379 = _5285 * _5241;
    float _5381 = -_5365;
    float _5383 = fma(_5285, _5369, _5381);
    float _5385 = _5287 * _5369;
    float _5387 = _5297 * _5321;
    float _5389 = _5229 * _5373;
    float _5391 = _5245 * _5371;
    if (!_5303)
    {
        float _5393 = fma(_5161, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5369);
        _5367 = _5393;
    }
    float _5395 = _5367;
    float _5397 = -_5385;
    float _5399 = fma(_5289, _5241, _5397);
    float _5401 = -_5379;
    float _5403 = fma(_5287, _5353, _5401);
    float _5405 = -_5389;
    float _5407 = fma(_5245, _5387, _5405);
    float _5409 = -_5391;
    float _5411 = fma(_5219, _5373, _5409);
    float _5413 = _5383 * _5291;
    float _5415 = _5399 * _5291;
    float _5417 = _5407 * _5325;
    float _5419 = _5411 * _5325;
    float _5421 = _5403 * _5291;
    float _5423 = _5219 * _5387;
    float _5425 = fma(_5371, _5323, _5417);
    float _5427 = fma(_5387, _5323, _5419);
    float _5429 = _5179 * _5407;
    float _5431 = -_5423;
    float _5433 = fma(_5229, _5371, _5431);
    float _5435 = fma(_5219, _5327, _5425);
    float _5437 = fma(_5229, _5327, _5427);
    float _5439 = _5179 * _5411;
    float _5441 = _5179 * _5433;
    float _5443 = _3445 + _5435;
    float _5445 = _3483 + _5437;
    float _5447 = _5433 * _5325;
    float _5449 = fma(_5197, _5373, _5441);
    float _5451 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5453 = _5443 + _5451;
    float _5455 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5457 = _5445 + _5455;
    float _5459 = _5195 * _5407;
    float _5461 = _5195 * _5433;
    float _5463 = _5453 * _5453;
    float _5465 = _5457 * _5457;
    float _5467 = _5195 * _5411;
    float _5469 = _5223 * _5407;
    float _5471 = _5223 * _5411;
    float _5473 = _5463 + _5465;
    float _5475 = _5223 * _5433;
    float _5477 = fma(_5201, _5371, _5469);
    float _5479 = -_5147;
    float _5481 = fma(_5479, _5373, _5461);
    float _5483 = sqrt(_5473);
    float _5485 = fma(_5201, _5373, _5475);
    float _5487 = fma(_5373, _5323, _5447);
    float _5489 = -_5147;
    float _5491 = fma(_5489, _5371, _5459);
    float _5493 = -_5147;
    float _5495 = fma(_5493, _5387, _5467);
    float _5497 = fma(_5197, _5371, _5429);
    float _5499 = fma(_5245, _5327, _5487);
    float _5501 = fma(_5197, _5387, _5439);
    float _5503 = fma(_5201, _5387, _5471);
    float _5505 = fma(_5199, _5219, _5491);
    float _5507 = fma(_5199, _5245, _5481);
    float _5509 = fma(_5199, _5229, _5495);
    float _5511 = _3461 + _5499;
    float _5513 = fma(_5217, _5219, _5497);
    float _5515 = fma(_5217, _5245, _5449);
    float _5517 = fma(_5217, _5229, _5501);
    bool _5519 = _5483 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5521 = fma(_5181, _5229, _5503);
    float _5523 = _5505 * _5287;
    float _5525 = _5507 * _5287;
    float _5527 = _5509 * _5287;
    float _5529 = _5507 * _5361;
    float _5531 = fma(_5181, _5219, _5477);
    float _5533 = fma(_5181, _5245, _5485);
    float _5535 = _5505 * _5361;
    float _5537 = _5413 * _5505;
    float _5539 = _5413 * _5507;
    float _5541 = _5413 * _5509;
    float _5543 = _5509 * _5361;
    float _5545 = _5449;
    float _5547 = _5505;
    float _5549 = _5477;
    float _5551 = _5413;
    float _5553 = _5421;
    if (!_5519)
    {
        _5545 = _5465;
    }
    float _5555 = _5545;
    float _5557 = _5555;
    if (!_5519)
    {
        _5547 = _5463;
    }
    float _5559 = _5547;
    float _5561 = _5559;
    if (!_5519)
    {
        _5339 = _5443;
    }
    float _5563 = _5339;
    float _5565 = _5563;
    if (!_5519)
    {
        _5549 = _5445;
    }
    float _5567 = _5549;
    float _5569 = _5567;
    if (!_5519)
    {
        _5551 = _5511;
    }
    float _5571 = _5551;
    bool _5573 = !_5519;
    float _5575 = _5571;
    if (!_5573)
    {
        float _5577 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5579 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5581 = _5483 + _5579;
        float _5583 = rsqrt(_5473);
        float _5585 = _5581 * _5577;
        float _5587 = _5511 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5589 = _5585 * 0.15915493667125701904296875;
        float _5591 = _5589 * 6.283185482025146484375;
        float _5593 = sin(_5591);
        float _5595 = _5589 * 6.283185482025146484375;
        float _5597 = cos(_5595);
        float _5599 = fma(_5593, _5587, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5601 = _5583 * _5599;
        float _5603 = _5597 + (-1.0);
        float _5605 = fma(_5453, _5601, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5607 = fma(_5457, _5601, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5609 = _5603 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5611 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5613 = _5605 + _5611;
        float _5615 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5617 = _5607 + _5615;
        float _5619 = fma(_5511, _5597, _5609);
        float _5621 = _5613 * _5613;
        float _5623 = _5617 * _5617;
        _5575 = _5619;
        _5561 = _5621;
        _5557 = _5623;
        _5565 = _5605;
        _5569 = _5607;
    }
    float _5625 = _5575;
    float _5627 = _5561;
    float _5629 = _5557;
    float _5631 = _5565;
    float _5633 = _5569;
    float _5635 = fma(_5513, _5285, _5523);
    float _5637 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5639 = _5625 + _5637;
    float _5641 = fma(_5513, _5377, _5535);
    float _5643 = fma(_5517, _5377, _5543);
    float _5645 = fma(_5515, _5285, _5525);
    float _5647 = fma(_5639, _5639, _5627);
    float _5649 = fma(_5515, _5377, _5529);
    float _5651 = fma(_5415, _5515, _5539);
    float _5653 = fma(_5517, _5285, _5527);
    float _5655 = _5647 + _5629;
    float _5657 = fma(_5415, _5513, _5537);
    float _5659 = fma(_5415, _5517, _5541);
    float _5661 = fma(_5531, _5289, _5635);
    float _5663 = fma(_5533, _5289, _5645);
    float _5665 = fma(_5533, _5395, _5649);
    float _5667 = sqrt(_5655);
    float _5669 = fma(_5521, _5289, _5653);
    float _5671 = fma(_5531, _5395, _5641);
    float _5673 = fma(_5421, _5531, _5657);
    float _5675 = fma(_5421, _5533, _5651);
    float _5677 = fma(_5421, _5521, _5659);
    float _5679 = fma(_5521, _5395, _5643);
    out.m_95.x = _5661;
    out.m_95.y = _5663;
    out.m_95.z = _5669;
    out.m_97.x = _5673;
    out.m_97.y = _5675;
    out.m_97.z = _5677;
    out.m_99.x = _5671;
    out.m_99.y = _5665;
    out.m_99.z = _5679;
    bool _5681 = _5667 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5683 = isnan(_5667);
    bool _5685 = _5681 || _5683;
    bool _5687 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5689 = _5685 || _5687;
    float _5691 = _5641;
    if (!_5689)
    {
        _5553 = 1.0;
    }
    float _5693 = _5553;
    bool _5695 = !_5689;
    float _5697 = _5693;
    if (!_5695)
    {
        bool _5699 = _5667 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5701 = isnan(_5667);
        bool _5703 = _5699 || _5701;
        bool _5705 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5707 = _5703 || _5705;
        if (!_5707)
        {
            float _5709 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5711 = _5667 + _5709;
            float _5713 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5715 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5713;
            float _5717 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5719 = _5717 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5721 = 1.0 / _5715;
            float _5723 = _5711 * _5721;
            float _5725 = fma(_5723, _5719, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5697 = _5725;
            _5727 = true;
        }
        else
        {
            bool _5729 = _5667 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5731 = isnan(_5667);
            bool _5733 = _5729 || _5731;
            bool _5735 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5737 = _5733 || _5735;
            if (!_5737)
            {
                float _5739 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5741 = _5667 + _5739;
                float _5743 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5745 = _5743 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5747 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5749 = _5747 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5751 = 1.0 / _5745;
                float _5753 = _5741 * _5751;
                float _5755 = fma(_5753, _5749, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5697 = _5755;
                _5727 = true;
            }
            else
            {
                _5697 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5727 = false;
    float _5757 = _5697;
    float _5759 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5761 = _5625 + _5759;
    float _5763 = _5047 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5765 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5767 = _5631 + _5765;
    float _5769 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5771 = _5633 + _5769;
    float _5773 = fma(_5761, _5757, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5775 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5763);
    float _5777 = fma(_5767, _5757, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5779 = fma(_5771, _5757, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5781 = -_3461;
    float _5783 = _5781 + _5773;
    float _5785 = fma(_5055, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5775);
    float _5787 = -_3445;
    float _5789 = _5787 + _5777;
    float _5791 = _5047 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5793 = _5783 * _5783;
    float _5795 = _5785 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5797 = -_3483;
    float _5799 = _5797 + _5779;
    float _5801 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5791);
    float _5803 = fma(_5789, _5789, _5793);
    float _5805 = 1.0 / _5795;
    float _5807 = fma(_5055, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5801);
    float _5809 = fma(_5799, _5799, _5803);
    float _5811 = _5807 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5813 = sqrt(_5809);
    float _5815 = _5811 + _5795;
    float _5817 = _5815 * _5805;
    float _5819 = _5817 * 0.5;
    float _5821 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5823 = fma(_5819, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5821);
    bool _5825 = _5813 > 0.0;
    float _5827 = 1.0 / _5823;
    bool _5829 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5831 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5833 = _5829 || _5831;
    bool _5835 = isnan(0.5);
    bool _5837 = _5833 || _5835;
    bool _5839 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5841 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5843 = _5839 || _5841;
    bool _5845 = isnan(0.5);
    bool _5847 = _5843 || _5845;
    float _5849 = _5819;
    float _5851 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5853 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5855 = _5777;
    if (!_5825)
    {
        _5849 = _5777;
    }
    float _5857 = _5849;
    float _5859 = _5857;
    float _5861 = _5857;
    if (!_5825)
    {
        _5851 = _5773;
    }
    float _5863 = _5851;
    float _5865 = _5863;
    if (!_5825)
    {
        _5853 = _5779;
    }
    float _5867 = _5853;
    bool _5869 = !_5825;
    float _5871 = _5867;
    float _5873 = _5827;
    if (!_5869)
    {
        float _5875 = _226 * _226;
        float _5877 = fma(_222, _222, _5875);
        float _5879 = fma(_228, _228, _5877);
        float _5881 = rsqrt(_5809);
        float _5883 = sqrt(_5879);
        float _5885 = _5789 * _5881;
        float _5887 = _5783 * _5881;
        float _5889 = _5799 * _5881;
        bool _5891 = _5883 > 0.0;
        float _5893 = _5883;
        float _5895 = _5881;
        if (!_5891)
        {
            _5859 = _5777;
        }
        float _5897 = _5859;
        _5861 = _5897;
        if (!_5891)
        {
            _5893 = _5773;
        }
        float _5899 = _5893;
        _5865 = _5899;
        if (!_5891)
        {
            _5895 = _5779;
        }
        float _5901 = _5895;
        bool _5903 = !_5891;
        _5871 = _5901;
        if (!_5903)
        {
            float _5905 = rsqrt(_5879);
            float _5907 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5909 = _226 * _5905;
            float _5911 = _222 * _5905;
            float _5913 = _228 * _5905;
            float _5915 = _5887 * _5909;
            float _5917 = fma(_5885, _5911, _5915);
            float _5919 = _5907 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5921 = fma(_5889, _5913, _5917);
            float _5923 = _5921 * _5919;
            float _5925 = fma(_222, _5923, _5777);
            float _5927 = fma(_226, _5923, _5773);
            float _5929 = fma(_228, _5923, _5779);
            _5861 = _5925;
            _5865 = _5927;
            _5871 = _5929;
        }
    }
    float _5931 = _5861;
    float _5933 = _5865;
    float _5935 = _5871;
    float _5937 = -_3733;
    float _5939 = fma(_5937, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5931);
    float _5941 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5943 = _5827 * _5941;
    float _5945 = -_3729;
    float _5947 = fma(_5945, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5933);
    float _5949 = -_3753;
    float _5951 = fma(_5949, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5935);
    float _5953 = _5947;
    float _5955 = _5951;
    if (_5837)
    {
        _5855 = 1.0;
    }
    float _5957 = _5855;
    float _5959 = _5957;
    if (_5847)
    {
        _5873 = _5939;
    }
    float _5961 = _5873;
    float _5963 = _5961;
    if (!_5847)
    {
        float _5965 = _5061 * _5061;
        float _5967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5969 = -_3483;
        float _5971 = _5969 + _5935;
        float _5973 = -_3445;
        float _5975 = _5973 + _5931;
        float _5977 = fma(_5065, _5065, _5965);
        float _5979 = fma(_5069, _5069, _5977);
        float _5981 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5983 = sqrt(_5979);
        float _5985 = 1.0 / _5185;
        float _5987 = _5981 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5989 = precise::min(_5983, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5991 = _5989 * _5967;
        float _5993 = -_3461;
        float _5995 = _5993 + _5933;
        float _5997 = _5991 * _5985;
        float _5999 = _5987 * _5997;
        float _6001 = _5971 * _5997;
        float _6003 = fma(_5995, _5999, _5047);
        float _6005 = fma(_5975, _5999, _5051);
        float _6007 = fma(_5987, _6001, _5055);
        _5953 = _6003;
        _5963 = _6005;
        _5955 = _6007;
    }
    float _6009 = _5953;
    float _6011 = _5963;
    float _6013 = _5955;
    if (!_5837)
    {
        float _6015 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6017 = _6015 * 0.15915493667125701904296875;
        float _6019 = _6017 * 6.283185482025146484375;
        float _6021 = cos(_6019);
        float _6023 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6025 = _6023 * 0.15915493667125701904296875;
        float _6027 = _6017 * 6.283185482025146484375;
        float _6029 = sin(_6027);
        float _6031 = 1.0 / _6021;
        float _6033 = _6025 * 6.283185482025146484375;
        float _6035 = cos(_6033);
        float _6037 = _6029 * _6031;
        float _6039 = _6025 * 6.283185482025146484375;
        float _6041 = sin(_6039);
        float _6043 = _6035 * _6037;
        float _6045 = 1.0 / _6043;
        float _6047 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6049 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6047;
        float _6051 = 1.0 / _6049;
        float _6053 = _6041 * _6045;
        float _6055 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6057 = fma(_5943, _6053, _6055);
        float _6059 = _6057 * _6051;
        float _6061 = precise::clamp(_6059, 0.0, 1.0);
        _5959 = _6061;
    }
    float _6063 = _5959;
    float _6065 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6067 = _6009 + _6065;
    float _6069 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6071 = _6011 + _6069;
    float _6073 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6075 = _6013 + _6073;
    float _6077 = _6067 * _6067;
    float _6079 = fma(_6071, _6071, _6077);
    float _6081 = fma(_5051, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6083 = fma(_6075, _6075, _6079);
    float _6085 = rsqrt(_6083);
    float _6087 = sqrt(_6083);
    float _6089 = _6085 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6091 = _6071 * _6089;
    float _6093 = _6075 * _6089;
    float _6095 = _6091 * _6091;
    float _6097 = _6093 * _6093;
    float _6099 = _6095 + _6097;
    float _6101 = sqrt(_6099);
    bool _6103 = _6101 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6105 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6107 = _6101 + _6105;
    float _6109 = _6085;
    float _6111 = _6099;
    float _6113 = _6107;
    float _6115 = _6067;
    if (_6103)
    {
        float _6117 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6109 = _6117;
    }
    float _6119 = _6109;
    if (!_6103)
    {
        _5117 = _6095;
    }
    float _6121 = _5117;
    float _6123 = _6121;
    if (_6103)
    {
        float _6125 = rsqrt(_6099);
        _6111 = _6125;
    }
    float _6127 = _6111;
    float _6129 = _6127;
    if (_6103)
    {
        float _6131 = _6107 * _6119;
        _6113 = _6131;
    }
    float _6133 = _6113;
    float _6135 = floor(_6081);
    if (_6103)
    {
        float _6137 = _6133 * 0.15915493667125701904296875;
        _5119 = _6137;
    }
    float _6139 = _5119;
    float _6141 = _6075;
    if (_6103)
    {
        float _6143 = _6139 * 6.283185482025146484375;
        float _6145 = sin(_6143);
        _6141 = _6145;
    }
    float _6147 = _6141;
    float _6149 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6151 = precise::max(0.0, _6149);
    float _6153 = _6119;
    float _6155 = _6151;
    if (_6103)
    {
        float _6157 = _6139 * 6.283185482025146484375;
        float _6159 = cos(_6157);
        _6153 = _6159;
    }
    float _6161 = _6153;
    float _6163 = -_6135;
    float _6165 = _6081 + _6163;
    float _6167 = -_6089;
    float _6169 = -_6151;
    float _6171 = fma(_6067, _6167, _6169);
    if (_6103)
    {
        float _6173 = _6171 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6115 = _6173;
    }
    float _6175 = _6115;
    float _6177 = _6175;
    float _6179 = _6147;
    if (_6103)
    {
        float _6181 = fma(_6147, _6175, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6177 = _6181;
    }
    float _6183 = _6177;
    float _6185 = _6183;
    if (!_6103)
    {
        _6179 = _6091;
    }
    float _6187 = _6179;
    float _6189 = _6187;
    if (_6103)
    {
        float _6191 = _6127 * _6183;
        _5691 = _6191;
    }
    float _6193 = _5691;
    float _6195 = _6161;
    if (_6103)
    {
        float _6197 = _6161 + (-1.0);
        _6155 = _6197;
    }
    float _6199 = _6155;
    float _6201 = _6199;
    if (!_6103)
    {
        _6185 = _6171;
    }
    float _6203 = _6185;
    float _6205 = _6203;
    if (_6103)
    {
        float _6207 = _6091 * _6193;
        _6189 = _6207;
    }
    float _6209 = _6189;
    if (_6103)
    {
        float _6211 = _6199 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6129 = _6211;
    }
    float _6213 = _6129;
    if (!_6103)
    {
        _6201 = _6093;
    }
    float _6215 = _6201;
    float _6217 = _6215;
    if (_6103)
    {
        float _6219 = _6093 * _6193;
        _6217 = _6219;
    }
    float _6221 = _6217;
    if (_6103)
    {
        float _6223 = _6209 * _6209;
        _6123 = _6223;
    }
    float _6225 = _6123;
    if (_6103)
    {
        float _6227 = fma(_6171, _6161, _6213);
        _6205 = _6227;
    }
    float _6229 = _6205;
    if (!_6103)
    {
        _6195 = _6097;
    }
    float _6231 = _6195;
    float _6233 = _6231;
    if (_6103)
    {
        float _6235 = _6221 * _6221;
        _6233 = _6235;
    }
    float _6237 = _6233;
    float _6239 = fma(_6229, _6229, _6225);
    float _6241 = _6009 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6243 = _6239 + _6237;
    float _6245 = fma(_6011, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6241);
    float _6247 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6249 = fma(_6087, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6247);
    float _6251 = precise::clamp(_6249, 0.0, 1.0);
    float _6253 = rsqrt(_6243);
    float _6255 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6245);
    float _6257 = -_6251;
    float _6259 = _6257 + 1.0;
    float _6261 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6263 = fma(_5055, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6265 = _6255 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6267 = _6009 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6269 = abs(_6259);
    float _6271 = log2(_6269);
    float _6273 = _6265 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6275 = _6009 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6277 = -_6273;
    float _6279 = fma(_6277, _6261, 1.0);
    float _6281 = _6009 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6283 = fma(_6011, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6275);
    float _6285 = _6253 * _6209;
    float _6287 = _6253 * _6229;
    float _6289 = fma(_6011, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6281);
    float _6291 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6283);
    float _6293 = _6285 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6295 = _6253 * _6221;
    float _6297 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6289);
    float _6299 = _6291 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6301 = -_6293;
    float _6303 = fma(_6287, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6301);
    float _6305 = fma(_6011, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6267);
    float _6307 = _6297 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6309 = _6299 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6311 = floor(_6263);
    float _6313 = -_6295;
    float _6315 = fma(_6313, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6303);
    float _6317 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6305);
    float _6319 = fma(_6307, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6309);
    float _6321 = _6271 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6323 = fma(_6315, -0.5, 0.5);
    float _6325 = _6317 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6327 = fma(_6265, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6319);
    float _6329 = exp2(_6321);
    float _6331 = _6299 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6333 = fma(_6315, 0.5, 0.5);
    float _6335 = fma(_6325, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6327);
    float _6337 = _6299 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6339 = fma(_6307, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6331);
    float _6341 = sqrt(_6323);
    float _6343 = -_6311;
    float _6345 = _6263 + _6343;
    float _6347 = fma(_6333, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6349 = fma(_6307, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6337);
    float _6351 = fma(_6265, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6339);
    float _6353 = _6287 + 1.0;
    float _6355 = fma(_6333, _6347, -0.212114393711090087890625);
    float _6357 = fma(_6265, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6349);
    float _6359 = log2(_6279);
    float _6361 = fma(_6325, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6351);
    float _6363 = fma(_6333, _6355, 1.570728778839111328125);
    float _6365 = fma(_6325, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6357);
    float _6367 = -_6287;
    float _6369 = fma(_6329, _6353, _6367);
    float _6371 = 1.0 / _6335;
    float _6373 = _6341 * 0.636619746685028076171875;
    float _6375 = fma(_6369, 0.5, 0.5);
    float _6377 = -_6363;
    float _6379 = fma(_6373, _6377, 1.0);
    float2 _16205 = float2(_6165, _6345);
    float _6381 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16205, float2(0.0), isnan(_16205)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16205, float2(0.0), isnan(_16205)), level(0.0)).x;
    float _6383 = _6359 * 0.693147182464599609375;
    float _6385 = _6361 * _6371;
    float _6387 = _6365 * _6371;
    float _6389 = _6383 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6391 = fma(_6385, 0.5, 0.5);
    float _6393 = fma(_6387, -0.5, 0.5);
    float3 _16233 = float3(_6391, _6393, _6389);
    float _6395 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16233, float3(0.0), isnan(_16233)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16233, float3(0.0), isnan(_16233)), level(0.0)).x;
    float3 _16244 = float3(_6391, _6393, _6389);
    float4 _6398 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16244, float3(0.0), isnan(_16244)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16244, float3(0.0), isnan(_16244)), level(0.0)).xyzw;
    float _6400 = _6398.x;
    float _6402 = _6398.y;
    float _6404 = _6398.z;
    float _6406 = _6398.w;
    float2 _16260 = float2(_6379, _6375);
    float3 _6410 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16260, float2(0.0), isnan(_16260)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16260, float2(0.0), isnan(_16260)), level(0.0)).xyz;
    float _6412 = _6410.x;
    float _6414 = _6410.y;
    float _6416 = _6410.z;
    float _6418 = abs(_5943);
    float _6420 = log2(_6418);
    float _6422 = _6271 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6424 = _6335 * 0.5;
    float _6426 = _6299 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _6428 = _6087 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6430 = isnan(_6087);
    bool _6432 = _6428 || _6430;
    bool _6434 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6436 = _6432 || _6434;
    float _6438 = exp2(_6422);
    bool _6440 = _5943 <= 8000.0;
    bool _6442 = isnan(_5943);
    bool _6444 = _6440 || _6442;
    bool _6446 = isnan(8000.0);
    bool _6448 = _6444 || _6446;
    float _6450 = float(_6448);
    float _6452 = fma(_6307, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6426);
    float _6454 = in.m_101.x;
    float _6456 = fma(_6265, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6452);
    float _6458 = _6420 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6460 = fma(_6325, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6456);
    float _6462 = _6361 + _6335;
    float _6464 = exp2(_6458);
    float _6466 = _6462 * 0.5;
    float _6468 = -_6438;
    float _6470 = _6468 + 1.0;
    out.gl_Position.x = _6361;
    out.gl_Position.y = _6365;
    out.gl_Position.z = _6460;
    out.gl_Position.w = _6335;
    float _6472 = _6462;
    float _6474 = _6365;
    float _6476 = _6361;
    float _6478 = _6335;
    float _6480 = _6460;
    float _6482 = _6466;
    if (!_6436)
    {
        _6472 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6484 = _6472;
    float _6486 = _6470 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6488 = fma(_6464, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6490 = precise::clamp(_6488, 0.0, 1.0);
    float _6492 = fma(_6365, -0.5, _6424);
    float _6494 = fma(_6490, -2.0, 3.0);
    float _6496 = _6490 * _6490;
    float _6498 = _6484;
    float _6500 = _6484;
    if (!_6436)
    {
        _6474 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6502 = _6474;
    float _6504 = _6502;
    float _6506 = _6502;
    if (!_6436)
    {
        _6476 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6508 = _6476;
    float _6510 = _6496 * _6494;
    float _6512 = -_6510;
    float _6514 = _6512 + 1.0;
    float _6516 = fma(_6514, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6510);
    float _6518 = _6460 + _6335;
    float _6520 = _6450 * _6516;
    float _6522 = _6518 * 0.5;
    float _6524 = _6508;
    float _6526 = _6508;
    if (!_6436)
    {
        _6478 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6528 = _6478;
    float _6530 = _6520 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6532 = _6528;
    float _6534 = _6528;
    if (!_6436)
    {
        _6480 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6536 = _6480;
    out.m_103.x = _6466;
    out.m_103.y = _6492;
    out.m_103.z = _6522;
    out.m_103.w = _6335;
    float _6538 = _6063 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6540 = _6536;
    float _6542 = _6536;
    if (!_6436)
    {
        _6482 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6544 = _6482;
    float _6546 = -_6381;
    float _6548 = _6546 + 1.0;
    float _6550 = _6548 * _6530;
    float _6552 = precise::clamp(_6550, 0.0, 1.0);
    float _6554 = -_6552;
    float _6556 = fma(_6554, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6558 = _6556 * _6454;
    float _6560 = _6558 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6562 = _6486 * _6395;
    float _6564 = -_6486;
    float _6566 = _6564 + 1.0;
    out.m_105.x = _6560;
    float _6568 = _6406 * _6562;
    float _6570 = _6416 * _6562;
    float _6572 = _6406 * _6566;
    float _6574 = fma(_6412, _6568, _6400);
    float _6576 = fma(_6414, _6568, _6402);
    float _6578 = fma(_6406, _6570, _6404);
    out.m_107.x = _6574;
    out.m_107.y = _6576;
    out.m_107.z = _6578;
    out.m_107.w = _6572;
    bool _6580 = !_6436;
    float _6582 = _6544;
    float _6584 = _6544;
    if (!_6580)
    {
        bool _6586 = _6087 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6588 = isnan(_6087);
        bool _6590 = _6586 || _6588;
        bool _6592 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6594 = _6590 || _6592;
        if (!_6594)
        {
            float _6596 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6598 = _6087 + _6596;
            float _6600 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6602 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6600;
            float _6604 = 1.0 / _6602;
            float _6606 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6608 = _6606 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6610 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6612 = _6610 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6614 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6616 = _6614 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6618 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6620 = _6618 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6622 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6624 = _6622 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6626 = _6598 * _6604;
            float _6628 = precise::clamp(_6626, 0.0, 1.0);
            float _6630 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6632 = _6630 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6634 = fma(_6628, _6612, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6636 = fma(_6628, _6632, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6638 = fma(_6628, _6608, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6640 = fma(_6628, _6616, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6642 = fma(_6628, _6620, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6644 = fma(_6628, _6624, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6526 = _6638;
            _6534 = _6642;
            _6506 = _6636;
            _6584 = _6640;
            _6500 = _6634;
            _6542 = _6644;
            _6646 = true;
        }
        else
        {
            bool _6648 = _6087 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6650 = isnan(_6087);
            bool _6652 = _6648 || _6650;
            bool _6654 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6656 = _6652 || _6654;
            if (!_6656)
            {
                _6582 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6658 = _6582;
            _6584 = _6658;
            if (!_6656)
            {
                _6532 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6660 = _6532;
            _6534 = _6660;
            if (!_6656)
            {
                _6540 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6662 = _6540;
            _6542 = _6662;
            if (!_6656)
            {
                _6504 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6664 = _6504;
            _6506 = _6664;
            if (!_6656)
            {
                _6524 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6666 = _6524;
            _6526 = _6666;
            if (!_6656)
            {
                _6498 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6668 = _6498;
            bool _6670 = !_6656;
            _6500 = _6668;
            if (!_6670)
            {
                bool _6672 = _6087 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6674 = isnan(_6087);
                bool _6676 = _6672 || _6674;
                bool _6678 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6680 = _6676 || _6678;
                if (!_6680)
                {
                    float _6682 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6684 = _6087 + _6682;
                    float _6686 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6688 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6686;
                    float _6690 = 1.0 / _6688;
                    float _6692 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6694 = _6692 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6696 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6698 = _6696 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6700 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6702 = _6700 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6704 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6706 = _6704 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6708 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6710 = _6708 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6712 = _6684 * _6690;
                    float _6714 = precise::clamp(_6712, 0.0, 1.0);
                    float _6716 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6718 = _6716 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6720 = fma(_6714, _6698, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6722 = fma(_6714, _6718, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6724 = fma(_6714, _6694, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6726 = fma(_6714, _6702, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6728 = fma(_6714, _6706, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6730 = fma(_6714, _6710, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6526 = _6724;
                    _6534 = _6728;
                    _6506 = _6722;
                    _6584 = _6726;
                    _6500 = _6720;
                    _6542 = _6730;
                    _6646 = true;
                }
                else
                {
                    _6526 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6534 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6506 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6584 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6500 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6542 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6646 = false;
    float _6732 = _6526;
    float _6734 = _6534;
    float _6736 = _6506;
    float _6738 = _6584;
    float _6740 = _6500;
    float _6742 = _6542;
    float _6744 = _6538 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6746 = fma(_5665, -0.5, 0.5);
    float _6748 = precise::clamp(_6746, 0.0, 1.0);
    float _6750 = -_6732;
    float _6752 = _6734 + _6750;
    float _6754 = -_6736;
    float _6756 = _6738 + _6754;
    out.m_51.x = _6744;
    float _6758 = fma(_6748, _6752, _6732);
    float _6760 = -_6740;
    float _6762 = _6742 + _6760;
    float _6764 = fma(_6748, _6756, _6736);
    float _6766 = _6758 * 0.586610972881317138671875;
    bool _6768 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6770 = fma(_6748, _6762, _6740);
    out.m_109.x = 0.0;
    float _6772 = fma(_6764, 0.298911988735198974609375, _6766);
    bool _6774 = _6063 > 0.0;
    bool _6776 = isnan(_6063);
    bool _6778 = _6774 || _6776;
    bool _6780 = isnan(0.0);
    bool _6782 = _6778 || _6780;
    float _6784 = fma(_6770, 0.114477999508380889892578125, _6772);
    float _6786 = -_6784;
    float _6788 = _6764 + _6786;
    float _6790 = -_6784;
    float _6792 = _6758 + _6790;
    float _6794 = -_6784;
    float _6796 = _6770 + _6794;
    float _6798 = fma(_6788, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6784);
    float _6800 = fma(_6792, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6784);
    float _6802 = fma(_6796, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6784);
    bool _6804 = !_6768;
    if (!_6804)
    {
        float _6806 = -_6009;
        float _6808 = _6806 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6810 = -_6011;
        float _6812 = _6810 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6814 = -_6013;
        float _6816 = _6814 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6818 = _6808 * _6808;
        float _6820 = fma(_6812, _6812, _6818);
        float _6822 = fma(_6816, _6816, _6820);
        float _6824 = sqrt(_6822);
        float _6826 = rsqrt(_6822);
        float _6828 = -_6824;
        float _6830 = _6828 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6832 = _6830 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6834 = precise::clamp(_6832, 0.0, 1.0);
        float _6836 = _6812 * _6826;
        float _6838 = _6808 * _6826;
        float _6840 = abs(_6834);
        float _6842 = log2(_6840);
        float _6844 = _6816 * _6826;
        float _6846 = _6836 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6848 = _5665 * _6838;
        float _6850 = -_6838;
        float _6852 = -_6846;
        float _6854 = fma(_6850, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6852);
        float _6856 = fma(_5671, _6836, _6848);
        float _6858 = -_6844;
        float _6860 = fma(_6858, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6854);
        float _6862 = fma(_5679, _6844, _6856);
        float _6864 = precise::clamp(_6862, 0.0, 1.0);
        float _6866 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6868 = _6860 + _6866;
        float _6870 = _6842 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6872 = _6868 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6874 = precise::clamp(_6872, 0.0, 1.0);
        float _6876 = exp2(_6870);
        float _6878 = _6876 * _6874;
        float _6880 = _6864 * _6878;
        float _6882 = _6880 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6884 = _6880 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6886 = _6880 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _6882;
        out.m_109.y = _6884;
        out.m_109.z = _6886;
    }
    out.m_111.x = _6798;
    out.m_111.y = _6800;
    out.m_111.z = _6802;
    if (_6782)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _6888 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6888;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6646 = false;
    bool _5727 = false;
    bool _1092 = false;
    bool _768 = false;
    bool _626 = false;
    bool _472 = false;
    bool _250 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_48.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (!_134)
    {
        out.m_51.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _138 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6945 = as_type<float>(_146);
        out.gl_Position.z = _6945;
    }
    if (!_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_53.w;
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
        float _170 = float(_130);
        _166 = _170;
    }
    float _172 = _166;
    bool _174 = _164 >= _172;
    bool _176 = !_160;
    bool _178 = _174 || _176;
    if (_178)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _180 = _140;
    if (_178)
    {
        out.m_51.x = 0.0;
    }
    if (_178)
    {
        float _182 = _180 * 5.0;
        _148 = as_type<int>(_182);
    }
    int _184 = _148;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7014 = as_type<float>(_184);
        out.gl_Position.z = _7014;
    }
    if (_178)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _186 = in.m_55.x;
    float _188 = in.m_55.y;
    float _190 = in.m_55.z;
    bool _192 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _194 = in.m_57.x;
    float _196 = in.m_57.y;
    float _198 = in.m_57.z;
    float _200 = in.m_59.x;
    float _202 = in.m_59.y;
    float _204 = in.m_59.z;
    float _206 = in.m_61.x;
    float _208 = in.m_61.y;
    float _210 = in.m_61.z;
    float _212 = _188 * _196;
    float _214 = _188 * _202;
    float _216 = fma(_186, _194, _212);
    float _218 = _188 * _208;
    float _220 = fma(_186, _200, _214);
    float _222 = fma(_190, _198, _216);
    float _224 = fma(_186, _206, _218);
    float _226 = fma(_190, _204, _220);
    float _228 = fma(_190, _210, _224);
    bool _230 = !_192;
    float _248;
    if (!_230)
    {
        float _232 = in.m_63.x;
        float _234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _236 = _232 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _238 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _240 = _238 * _234;
        float _242 = floor(_240);
        float _244 = -_242;
        float _246 = _240 + _244;
        _248 = _246;
        _250 = true;
    }
    else
    {
        float _252 = float(_130);
        float _254 = 1.0 / _252;
        float _256 = _164 * _254;
        _248 = _256;
    }
    _250 = false;
    float _258 = _248;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _262 = _258 + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _266 = _258 + _264;
    bool _268 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _270 = isnan(_258);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _286 = _258 + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _294 = _292 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _296 = 1.0 / _282;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _300 = 1.0 / _294;
    float _302 = 1.0 / _290;
    float _304 = _262 * _296;
    bool _306 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _308 = isnan(_258);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -_278;
    float _320 = _318 + 1.0;
    float _322 = _316 * _320;
    float _324 = _266 * _300;
    bool _326 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _328 = isnan(_258);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _338;
    bool _342 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _344 = isnan(_258);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = -_316;
    float _360 = _358 + 1.0;
    float _362 = -_336;
    float _364 = _362 + 1.0;
    float _366 = _286 * _302;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _372;
    float _376 = _352 * _364;
    float _378 = fma(_340, _366, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _380 = fma(_370, _366, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _382 = fma(_374, _366, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _384 = _336 * _360;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _390 = _380 * _376;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = _382 * _376;
    float _398 = -_352;
    float _400 = _398 + 1.0;
    float _402 = _378 * _376;
    float _404 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[143].x, _396);
    float _406 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[143].y, _390);
    float _408 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _410;
    float _414 = fma(_356, _324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = fma(_388, _324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_394, _324, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _424;
    float _428 = fma(_414, _384, _404);
    float _430 = fma(_412, _304, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _432 = fma(_422, _304, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _434 = fma(_426, _304, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _436 = fma(_416, _384, _406);
    float _438 = fma(_418, _384, _408);
    float _440 = fma(_430, _322, _428);
    float _442 = fma(_432, _322, _436);
    float _444 = fma(_434, _322, _438);
    float _446 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[146].x, _440);
    float _448 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[146].y, _442);
    float _450 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[146].z, _444);
    bool _452 = !_298;
    float _470;
    if (!_452)
    {
        float _454 = in.m_63.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_130);
        float _476 = 1.0 / _474;
        float _478 = _164 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _484 = _480 + _482;
    float _486 = in.m_65.x;
    float _488 = in.m_65.y;
    float _490 = in.m_65.z;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _496 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _498 = isnan(_480);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _512 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _514 = isnan(_480);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _524;
    bool _528 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _530 = isnan(_480);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = 1.0 / _494;
    float _542 = -_506;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _480 + _546;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _552 = _522 * _544;
    float _554 = -_522;
    float _556 = _554 + 1.0;
    float _558 = 1.0 / _510;
    float _560 = _526 * _540;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _566 = fma(_560, _484, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _568 = _564 * _558;
    float _570 = -_538;
    float _572 = _570 + 1.0;
    float _574 = _566 * _552;
    float _576 = fma(_568, _548, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _578 = _506 * _572;
    float _580 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[115].x, _574);
    float _582 = _450 * _490;
    float _584 = fma(_576, _578, _580);
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _590 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[117].x, _584);
    float _592 = _448 * _488;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _596 = _586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _598 = _588 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = _590 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _602 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _446 * _486;
    out.m_67.x = _596;
    out.m_67.y = _598;
    out.m_67.z = _602;
    out.m_67.w = _600;
    bool _606 = !_550;
    float _624;
    if (!_606)
    {
        float _608 = in.m_63.x;
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _612 = _608 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[11].w, _164);
        float _616 = _614 * _610;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _624 = _622;
        _626 = true;
    }
    else
    {
        float _628 = float(_130);
        float _630 = 1.0 / _628;
        float _632 = _164 * _630;
        _624 = _632;
    }
    _626 = false;
    float _634 = _624;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _638 = _634 + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _644 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _646 = isnan(_634);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _660 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _662 = isnan(_634);
    bool _664 = _660 || _662;
    bool _666 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _672;
    bool _676 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _678 = isnan(_634);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = 1.0 / _642;
    float _690 = -_654;
    float _692 = _690 + 1.0;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _696 = _634 + _694;
    bool _698 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _700 = _670 * _692;
    float _702 = -_670;
    float _704 = _702 + 1.0;
    float _706 = 1.0 / _658;
    float _708 = _674 * _688;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _714 = fma(_708, _638, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _716 = -_686;
    float _718 = _716 + 1.0;
    float _720 = _712 * _706;
    float _722 = _714 * _700;
    float _724 = _654 * _718;
    float _726 = fma(_720, _696, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _728 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[131].x, _722);
    float _730 = fma(_726, _724, _728);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _738 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[133].x, _730);
    float _740 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = _734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _738 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.x = _740;
    out.m_69.y = _742;
    out.m_69.z = _744;
    out.m_69.w = _746;
    bool _748 = !_698;
    float _766;
    if (!_748)
    {
        float _750 = in.m_63.x;
        float _752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _754 = _750 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _756 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[14].x, _164);
        float _758 = _756 * _752;
        float _760 = floor(_758);
        float _762 = -_760;
        float _764 = _758 + _762;
        _766 = _764;
        _768 = true;
    }
    else
    {
        float _770 = float(_130);
        float _772 = 1.0 / _770;
        float _774 = _164 * _772;
        _766 = _774;
    }
    _768 = false;
    float _776 = _766;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _780 = _776 + _778;
    bool _782 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _784 = isnan(_776);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _796 = _794 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _798;
    bool _802 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _804 = isnan(_776);
    bool _806 = _802 || _804;
    bool _808 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = -_792;
    float _816 = _814 + 1.0;
    bool _818 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _820 = isnan(_776);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    float _830 = 1.0 / _796;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _836 = _812 * _816;
    float _838 = -_828;
    float _840 = _838 + 1.0;
    float _842 = 1.0 / _834;
    bool _844 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _846 = _800 * _830;
    float _848 = -_812;
    float _850 = _848 + 1.0;
    bool _852 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _854 = isnan(_776);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = fma(_846, _780, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _866 = _828 * _850;
    bool _868 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _870 = isnan(_776);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = _862 * _840;
    float _882 = -_862;
    float _884 = _882 + 1.0;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _890 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _892 = isnan(_776);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    float _902 = _878 * _884;
    float _904 = -_878;
    float _906 = _904 + 1.0;
    bool _908 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _910 = isnan(_776);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = 1.0 / _888;
    float _922 = -_900;
    float _924 = _922 + 1.0;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _930 = _900 * _906;
    float _932 = _918 * _924;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _938 = -_918;
    float _940 = _938 + 1.0;
    float _942 = 1.0 / _928;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _948 = _864 * _932;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _956 = _776 + _954;
    float _958 = _946 * _842;
    float _960 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[159].x, _948);
    float _962 = 1.0 / _936;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _964;
    float _968 = fma(_958, _956, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _972 = _970 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _976 = _776 + _974;
    float _978 = _966 * _920;
    float _980 = fma(_968, _930, _960);
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _984 = _776 + _982;
    float _986 = 1.0 / _952;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _992 = fma(_978, _976, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _994 = _990 * _942;
    bool _996 = _776 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _998 = isnan(_776);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1004 = _1000 || _1002;
    int _1006 = _1004 ? 1065353216 : 0;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1008;
    float _1012 = 1.0 / _972;
    float _1014 = fma(_992, _902, _980);
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1020 = _1010 * _962;
    float _1022 = fma(_994, _984, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1026 = _776 + _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1030 = _776 + _1028;
    float _1032 = _1018 * _986;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1034;
    float _1038 = fma(_1020, _1026, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1040 = fma(_1022, _880, _1014);
    float _1042 = fma(_1032, _1030, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1044 = -as_type<float>(_1006);
    float _1046 = _1044 + 1.0;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1050 = _776 + _1048;
    float _1052 = fma(_1038, _866, _1040);
    float _1054 = _1036 * _1012;
    float _1056 = _792 * _1046;
    float _1058 = fma(_1042, _836, _1052);
    float _1060 = fma(_1054, _1050, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1062 = fma(_1060, _1056, _1058);
    float _1064 = fma(as_type<float>(_1006), (*spvDescriptorSet0.vp_c9)._m0[166].x, _1062);
    out.m_71.x = _1064;
    bool _1066 = !_844;
    float _1068 = _836;
    int _1070 = _1006;
    int _1072 = as_type<int>(_1056);
    float _1090;
    if (!_1066)
    {
        float _1074 = in.m_63.x;
        float _1076 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1078 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[14].y, _164);
        float _1082 = _1080 * _1076;
        float _1084 = floor(_1082);
        float _1086 = -_1084;
        float _1088 = _1082 + _1086;
        _1090 = _1088;
        _1092 = true;
    }
    else
    {
        float _1094 = float(_130);
        float _1096 = 1.0 / _1094;
        float _1098 = _164 * _1096;
        _1090 = _1098;
    }
    _1092 = false;
    float _1100 = _1090;
    float _1102 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1104 = int(_1102);
    float _1106 = in.m_73.x;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1110 = _1108 != 0;
    float _1112 = in.m_63.y;
    float _1114 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1116 = int(_1114);
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1120 = _1118 != 0;
    float _1122 = 0.0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1110)
    {
        _1122 = 1.0;
    }
    float _1126 = _1122;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1130 = _1128 != 0;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1134 = _1132 != 0;
    float _1136 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1138 = int(_1136);
    float _1140 = float(_1104);
    float _1142 = 0.0;
    float _1144 = _1126;
    bool _1146 = _1130;
    bool _1148 = _1134;
    if (_1110)
    {
        _1142 = 1.0;
    }
    float _1150 = _1142;
    float _1152 = 0.0;
    float _1154 = _1150;
    if (_1110)
    {
        _1152 = 1.0;
    }
    float _1156 = _1152;
    int _1158 = 0;
    float _1160 = _1156;
    if (_1110)
    {
        _1158 = 0;
    }
    int _1162 = _1158;
    float _1164 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1166 = int(_1164);
    float _1168 = float(_1116);
    int _1170 = _1162;
    if (_1110)
    {
        _1124 = 0;
    }
    int _1172 = _1124;
    int _1174 = _1172;
    float _1176 = _1106;
    if (!_1120)
    {
        _1068 = _1106;
    }
    float _1178 = _1068;
    float _1180 = _1178;
    if (_1130)
    {
        float _1182 = -_1106;
        float _1184 = _1182 + 1.0;
        _1070 = as_type<int>(_1184);
    }
    int _1186 = _1070;
    if (_1134)
    {
        float _1188 = -_1106;
        float _1190 = _1188 + 1.0;
        _1072 = as_type<int>(_1190);
    }
    int _1192 = _1072;
    bool _1194 = _1112 > 0.5;
    float _1196 = 1.0 / _1140;
    float _1198 = float(_1138);
    float _1200 = 0.0;
    if (!_1130)
    {
        _1200 = _1106;
    }
    float _1202 = _1200;
    float _1204 = 0.0;
    float _1206 = _1202;
    if (!_1134)
    {
        _1204 = _1106;
    }
    float _1208 = _1204;
    float _1210 = _1208;
    if (_1130)
    {
        float _1212 = _1194 ? as_type<float>(_1186) : _1106;
        _1206 = _1212;
    }
    float _1214 = _1206;
    float _1216 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1218 = int(_1216);
    float _1220 = float(uint(_1166));
    if (_1134)
    {
        float _1222 = _1194 ? as_type<float>(_1192) : _1106;
        _1210 = _1222;
    }
    float _1224 = _1210;
    int _1226 = 0;
    if (_1110)
    {
        _1226 = as_type<int>(_1112);
    }
    int _1228 = _1226;
    float _1230 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1232 = int(_1230);
    float _1234 = _1196 * _164;
    float _1236 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1238 = int(_1236);
    float _1240 = float(uint(_1218));
    float _1242 = 1.0 / _1168;
    float _1244 = float(_1232);
    float _1246 = 1.0 / _1198;
    float _1248 = float(uint(_1238));
    float _1250 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1252 = int(_1250);
    float _1254 = _1242 * _164;
    float _1256 = 1.0 / _1220;
    float _1258 = _1246 * _164;
    float _1260 = 1.0 / _1240;
    float _1262 = float(uint(_1252));
    float _1264 = trunc(_1234);
    int _1266 = int(_1264);
    float _1268 = _1240;
    int _1270 = _1228;
    if (_1110)
    {
        float _1272 = in.m_63.x;
        _1268 = _1272;
    }
    float _1274 = _1268;
    int _1276 = as_type<int>(_1256) + (-2);
    float _1278 = 1.0 / _1244;
    int _1280 = as_type<int>(_1260) + (-2);
    float _1282 = 1.0 / _1248;
    float _1284 = float(uint(_1266));
    float _1286 = as_type<float>(_1280) * _1284;
    float _1288 = trunc(_1254);
    int _1290 = int(_1288);
    float _1292 = _1278 * _164;
    float _1294 = trunc(_1258);
    int _1296 = int(_1294);
    int _1298 = as_type<int>(_1282) + (-2);
    float _1300 = 1.0 / _1262;
    float _1302 = float(uint(_1290));
    float _1304 = as_type<float>(_1298) * _1302;
    float _1306 = trunc(_1292);
    int _1308 = int(_1306);
    float _1310 = _1262;
    int _1312 = as_type<int>(_1304);
    if (_1110)
    {
        float _1314 = in.m_63.z;
        _1310 = _1314;
    }
    float _1316 = _1310;
    float _1318 = float(uint(_1296));
    float _1320 = as_type<float>(_1276) * _1318;
    float _1322 = trunc(_1286);
    float _1324 = precise::max(_1322, 0.0);
    uint _1327 = uint(_1324);
    float _1329 = trunc(_1304);
    float _1331 = precise::max(_1329, 0.0);
    uint _1333 = uint(_1331);
    float _1335 = trunc(_1320);
    float _1337 = precise::max(_1335, 0.0);
    uint _1339 = uint(_1337);
    float _1341 = _1274;
    if (_1110)
    {
        _1312 = as_type<int>(_1274);
    }
    int _1343 = _1312;
    int _1345 = 0;
    float _1347 = as_type<float>(_1343);
    float _1349 = _1316;
    if (_1110)
    {
        _1345 = as_type<int>(_1316);
    }
    int _1351 = _1345;
    int _1353 = 0;
    int _1355 = _1351;
    if (_1110)
    {
        _1353 = _1343;
    }
    int _1357 = _1353;
    int _1359 = int(_1130);
    int _1361 = _1120 ? 2 : 0;
    int _1363 = _1359 | _1361;
    int _1365 = _1134 ? 4 : 0;
    int _1367 = _1363 | _1365;
    int _1369 = _1110 ? 8 : 0;
    int _1371 = _1367 | _1369;
    int _1373 = false ? 16 : 0;
    int _1375 = _1371 | _1373;
    int _1377 = _1194 ? 32 : 0;
    int _1379 = _1375 | _1377;
    int _1381 = false ? 64 : 0;
    int _1383 = _1379 | _1381;
    int _1385 = _1383 & 32;
    float _1387 = as_type<float>(_1385);
    int _1389 = _1357;
    if (_1110)
    {
        _1387 = as_type<float>(_1343);
    }
    float _1391 = _1387;
    float _1393 = _1391;
    if (!_1110)
    {
        float _1395 = in.m_63.x;
        float _1397 = _1112 * 3.1415927410125732421875;
        float _1399 = in.m_63.z;
        float _1401 = _1397 * 0.15915493667125701904296875;
        float _1403 = _1401 * 6.283185482025146484375;
        float _1405 = sin(_1403);
        float _1407 = _1395 * 3.1415927410125732421875;
        float _1409 = _1407 * 0.15915493667125701904296875;
        float _1411 = _1399 * 3.1415927410125732421875;
        float _1413 = _1411 * 0.15915493667125701904296875;
        float _1415 = _1409 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = _1413 * 6.283185482025146484375;
        float _1421 = sin(_1419);
        _1393 = _1399;
        _1160 = 5.839270114898681640625;
        _1341 = _1395;
        _1144 = 7.345489978790283203125;
        _1347 = _1112;
        _1154 = 1.2345600128173828125;
        _1170 = 1;
        _1174 = 2;
        _1349 = _1399;
        _1270 = as_type<int>(_1405);
        _1389 = as_type<int>(_1417);
        _1355 = as_type<int>(_1421);
    }
    float _1423 = _1393;
    float _1425 = _1160;
    float _1427 = _1341;
    float _1429 = _1144;
    float _1431 = _1347;
    float _1433 = _1154;
    int _1435 = _1170;
    int _1437 = _1174;
    float _1439 = _1349;
    int _1441 = _1270;
    int _1443 = _1389;
    int _1445 = _1355;
    int _1447 = ~_1166;
    int _1449 = _1447 + 1;
    float _1451 = _1012;
    if (_1120)
    {
        float _1453 = in.m_63.x;
        _1451 = _1453;
    }
    float _1455 = _1451;
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1459 = _1457 != 0;
    float _1461 = _1423 * _1425;
    int _1463 = ~_1238;
    int _1465 = _1463 + 1;
    int _1467 = _1449 * int(_1339);
    int _1469 = _1467 + _1296;
    int _1471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1473 = _1471 != 0;
    float _1475 = _1427 * _1429;
    float _1477 = _1431 * _1433;
    int _1479 = as_type<int>(_1300) + (-2);
    float _1481 = floor(_1461);
    float _1483 = float(uint(_1469));
    int _1485 = _1465 * int(_1333);
    int _1487 = _1485 + _1290;
    float _1489 = float(uint(_1308));
    float _1491 = _1431 * _1429;
    float _1493 = _1423;
    if (_1459)
    {
        float _1495 = in.m_63.z;
        _1493 = _1495;
    }
    float _1497 = _1493;
    int _1499 = ~_1218;
    int _1501 = _1499 + 1;
    float _1503 = as_type<float>(_1276) * _1483;
    float _1505 = float(uint(_1487));
    float _1507 = floor(_1475);
    int _1509 = 0;
    float _1511 = _1503;
    if (_1473)
    {
        float _1513 = -_1106;
        float _1515 = _1513 + 1.0;
        _1509 = as_type<int>(_1515);
    }
    int _1517 = _1509;
    int _1519 = _1501 * int(_1327);
    int _1521 = _1519 + _1266;
    int _1523 = 0;
    if (_1459)
    {
        float _1525 = -_1106;
        float _1527 = _1525 + 1.0;
        _1523 = as_type<int>(_1527);
    }
    int _1529 = _1523;
    float _1531 = as_type<float>(_1298) * _1505;
    int _1533 = ~_1166;
    int _1535 = _1533 + 1;
    bool _1537 = _1435 != 1;
    float _1539 = _1455;
    if (_1120)
    {
        bool _1541 = _1455 > 0.5;
        _1146 = _1541;
    }
    bool _1543 = _1146;
    float _1545 = floor(_1477);
    if (!_1473)
    {
        _1539 = _1106;
    }
    float _1547 = _1539;
    bool _1549 = _1437 != 2;
    float _1551 = _1547;
    if (_1473)
    {
        float _1553 = _1194 ? as_type<float>(_1517) : _1106;
        _1551 = _1553;
    }
    float _1555 = _1551;
    float _1557 = _1112 * 2.0;
    float _1559 = float(uint(_1521));
    float _1561 = in.m_59.w;
    int _1563 = ~_1218;
    int _1565 = _1563 + 1;
    float _1567 = trunc(_1531);
    float _1569 = precise::max(_1567, 0.0);
    uint _1571 = uint(_1569);
    float _1573 = -_1507;
    float _1575 = _1475 + _1573;
    float _1577 = as_type<float>(_1280) * _1559;
    int _1579 = ~_1252;
    int _1581 = _1579 + 1;
    int _1583 = as_type<int>(_1559);
    float _1585 = as_type<float>(_1565);
    if (_1120)
    {
        float _1587 = -_1106;
        float _1589 = _1587 + 1.0;
        _1583 = as_type<int>(_1589);
    }
    int _1591 = _1583;
    if (_1459)
    {
        bool _1593 = _1497 > 0.5;
        _1148 = _1593;
    }
    bool _1595 = _1148;
    float _1597 = in.m_61.w;
    int _1599 = ~_1238;
    int _1601 = _1599 + 1;
    float _1603 = -_1545;
    float _1605 = _1477 + _1603;
    float _1607 = as_type<float>(_1479) * _1489;
    float _1609 = float(_130);
    float _1611 = trunc(_1577);
    float _1613 = precise::max(_1611, 0.0);
    uint _1615 = uint(_1613);
    float _1617 = float(_1166);
    float _1619 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1621 = as_type<float>(_1601);
    if (_1120)
    {
        float _1623 = _1543 ? as_type<float>(_1591) : _1106;
        _1180 = _1623;
    }
    float _1625 = _1180;
    int _1627 = int(_1333) + int(_1571);
    float _1629 = _1575 * _1617;
    float _1631 = float(_1296);
    float _1633 = trunc(_1607);
    float _1635 = precise::max(_1633, 0.0);
    uint _1637 = uint(_1635);
    float _1639 = -_1481;
    float _1641 = _1461 + _1639;
    float _1643 = float(_1238);
    bool _1645 = _1631 >= _1617;
    bool _1647 = isnan(_1631);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan(_1617);
    bool _1653 = _1649 || _1651;
    float _1655 = float(_1653);
    float _1657 = float(_1252);
    float _1659 = floor(_1491);
    int _1661 = int(_1327) + int(_1615);
    int _1663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1665 = _1663 != 0;
    int _1667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1669 = _1667 != 0;
    float _1671 = 1.0 / _1609;
    int _1673 = _1581 * int(_1637);
    int _1675 = _1673 + _1308;
    float _1677 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _1679 = float(uint(_1675));
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1683 = trunc(_1503);
    float _1685 = precise::max(_1683, 0.0);
    uint _1687 = uint(_1685);
    float _1689 = _1617 * _164;
    float _1691 = -_1659;
    float _1693 = _1491 + _1691;
    float _1695 = as_type<float>(_1479) * _1679;
    float _1697 = float(_1290);
    float _1699 = _1643 * _1605;
    float _1701 = float(_1218);
    float _1703 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _1705 = trunc(_1695);
    float _1707 = precise::max(_1705, 0.0);
    uint _1709 = uint(_1707);
    if (!_1459)
    {
        _1511 = _1106;
    }
    float _1711 = _1511;
    float _1713 = _1689 * _1671;
    float _1715 = _1711;
    if (_1459)
    {
        float _1717 = _1595 ? as_type<float>(_1529) : _1106;
        _1715 = _1717;
    }
    float _1719 = _1715;
    float _1721 = _1671 * _164;
    float _1723 = float(_1266);
    float _1725 = _1701 * _1641;
    bool _1727 = _1697 >= _1643;
    bool _1729 = isnan(_1697);
    bool _1731 = _1727 || _1729;
    bool _1733 = isnan(_1643);
    bool _1735 = _1731 || _1733;
    float _1737 = float(_1735);
    float _1739 = _1701 * _1721;
    int _1741 = int(_1339) + int(_1687);
    float _1743 = _1657 * _1721;
    float _1745 = float(_1308);
    float _1747 = trunc(_1737);
    int _1749 = int(_1747);
    bool _1751 = _1723 >= _1701;
    bool _1753 = isnan(_1723);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan(_1701);
    bool _1759 = _1755 || _1757;
    float _1761 = float(_1759);
    float _1763 = _1657 * _1693;
    bool _1765 = _1745 >= _1657;
    bool _1767 = isnan(_1745);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan(_1657);
    bool _1773 = _1769 || _1771;
    float _1775 = float(_1773);
    int _1777 = _1535 * _1741;
    int _1779 = _1777 + _1296;
    int _1781 = _1601 * _1627;
    int _1783 = _1781 + _1290;
    int _1785 = int(_1637) + int(_1709);
    float _1787 = trunc(_1655);
    int _1789 = int(_1787);
    bool _1791 = !_1665;
    int _1793 = _1791 ? 0 : 1;
    float _1795 = _1643 * _1721;
    bool _1797 = uint(_1779) >= uint(_1166);
    int _1799 = _1565 * _1661;
    int _1801 = _1799 + _1266;
    int _1803 = abs(_1793);
    int _1805 = ~_1252;
    int _1807 = _1805 + 1;
    float _1809 = trunc(_1629);
    int _1811 = int(_1809);
    bool _1813 = uint(_1783) >= uint(_1238);
    bool _1815 = uint(_1801) >= uint(_1218);
    int _1817 = _1807 * _1785;
    int _1819 = _1817 + _1308;
    bool _1821 = !_1669;
    int _1823 = _1821 ? 0 : 1;
    bool _1825 = !_1797;
    int _1827 = _1825 ? 0 : (-1);
    float _1829 = trunc(_1699);
    int _1831 = int(_1829);
    bool _1833 = !_1813;
    int _1835 = _1833 ? 0 : (-1);
    int _1837 = abs(_1823);
    int _1839 = ~_1741;
    int _1841 = _1839 + _1827;
    int _1843 = _1841 + 1;
    bool _1845 = !_1815;
    int _1847 = _1845 ? 0 : (-1);
    float _1849 = trunc(_1761);
    int _1851 = int(_1849);
    bool _1853 = uint(_1819) >= uint(_1252);
    int _1855 = _1811 * _1803;
    int _1857 = _1855 + _1296;
    int _1859 = ~_1627;
    int _1861 = _1859 + _1835;
    int _1863 = _1861 + 1;
    int _1865 = ~_1661;
    int _1867 = _1865 + _1847;
    int _1869 = _1867 + 1;
    int _1871 = _1166 * _1843;
    int _1873 = _1871 + _1296;
    bool _1875 = !_1853;
    int _1877 = _1875 ? 0 : (-1);
    int _1879 = _1831 * _1837;
    int _1881 = _1879 + _1290;
    int _1883 = _1238 * _1863;
    int _1885 = _1883 + _1290;
    int _1887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1889 = _1887 != 0;
    float _1891 = trunc(_1725);
    int _1893 = int(_1891);
    int _1895 = ~_1785;
    int _1897 = _1895 + _1877;
    int _1899 = _1897 + 1;
    int _1901 = _1218 * _1869;
    int _1903 = _1901 + _1266;
    int _1905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1907 = _1905 != 0;
    int _1909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1911 = _1909 != 0;
    int _1913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1915 = _1913 != 0;
    bool _1917 = _1238 == 0;
    int _1919 = _1252 * _1899;
    int _1921 = _1919 + _1308;
    bool _1923 = !_1889;
    int _1925 = _1923 ? 0 : 1;
    float _1927 = trunc(_1775);
    int _1929 = int(_1927);
    bool _1931 = _1166 == 0;
    bool _1933 = _1218 == 0;
    int _1935 = ~_1749;
    int _1937 = _1935 + 1;
    int _1939 = _1937 + 1;
    bool _1941 = _1252 == 0;
    float _1943 = trunc(_1713);
    int _1945 = int(_1943);
    bool _1947 = !_1917;
    int _1949 = _1947 ? _1885 : (-1);
    int _1951 = ~_1789;
    int _1953 = _1951 + 1;
    int _1955 = _1953 + 1;
    bool _1957 = !_1931;
    int _1959 = _1957 ? _1873 : (-1);
    int _1961 = _1939 * _1949;
    int _1963 = abs(_1925);
    float _1965 = trunc(_1795);
    int _1967 = int(_1965);
    int _1969 = ~_1851;
    int _1971 = _1969 + 1;
    int _1973 = _1971 + 1;
    int _1975 = _1959 * _1955;
    bool _1977 = !_1933;
    int _1979 = _1977 ? _1903 : (-1);
    int _1981 = _1893 * _1963;
    int _1983 = _1981 + _1266;
    bool _1985 = !_1941;
    int _1987 = _1985 ? _1921 : (-1);
    int _1989 = _1166 + (-1);
    int _1991 = _1973 * _1979;
    bool _1993 = !_1911;
    int _1995 = _1993 ? 0 : 1;
    float _1997 = floor(_1557);
    int _1999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2001 = _1999 != 0;
    int _2003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2005 = _2003 != 0;
    int _2007 = _1789 * _1989;
    int _2009 = _2007 + _1975;
    int _2011 = _1238 + (-1);
    int _2013 = abs(_1995);
    bool _2015 = !_1907;
    int _2017 = _2015 ? 0 : 1;
    int _2019 = _1749 * _2011;
    int _2021 = _2019 + _1961;
    bool _2023 = !_2005;
    int _2025 = _2023 ? 0 : 1;
    int _2027 = _2009 * _2013;
    int _2029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2031 = _2029 != 0;
    int _2033 = abs(_2017);
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2037 = _2035 != 0;
    int _2039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2041 = _2039 != 0;
    bool _2043 = !_1915;
    int _2045 = _2043 ? 0 : 1;
    int _2047 = _1945 * _2033;
    int _2049 = _2047 + _2027;
    int _2051 = abs(_2025);
    bool _2053 = !_2037;
    int _2055 = _2053 ? 0 : 1;
    int _2057 = abs(_2045);
    int _2059 = _2021 * _2051;
    bool _2061 = !_2031;
    int _2063 = _2061 ? 0 : 1;
    int _2065 = abs(_2055);
    bool _2067 = !_2001;
    int _2069 = _2067 ? 0 : 1;
    int _2071 = abs(_2063);
    int _2073 = _1857 * _2057;
    int _2075 = _2073 + _2049;
    int _2077 = abs(_2069);
    int _2079 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2081 = _2079 != 0;
    int _2083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2085 = _2083 != 0;
    int _2087 = _1967 * _2077;
    int _2089 = _2087 + _2059;
    bool _2091 = !_2041;
    int _2093 = _2091 ? 0 : 1;
    int _2095 = _1811 * _2071;
    int _2097 = _2095 + _2075;
    float _2099 = trunc(_1763);
    int _2101 = int(_2099);
    int _2103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2105 = _2103 != 0;
    int _2107 = abs(_2093);
    int _2109 = _1881 * _2065;
    int _2111 = _2109 + _2089;
    bool _2113 = !_2105;
    int _2115 = _2113 ? 0 : 1;
    bool _2117 = !_2085;
    int _2119 = _2117 ? 0 : 1;
    float _2121 = trunc(_1739);
    int _2123 = int(_2121);
    float _2125 = float(uint(_2097));
    int _2127 = abs(_2115);
    int _2129 = _1831 * _2107;
    int _2131 = _2129 + _2111;
    int _2133 = abs(_2119);
    float _2135 = as_type<float>(_1276) * _2125;
    int _2137 = _1218 + (-1);
    bool _2139 = !_2081;
    int _2141 = _2139 ? 0 : 1;
    float _2143 = trunc(_2135);
    float _2145 = precise::max(_2143, 0.0);
    uint _2147 = uint(_2145);
    int _2149 = ~_1929;
    int _2151 = _2149 + 1;
    int _2153 = _2151 + 1;
    int _2155 = _1851 * _2137;
    int _2157 = _2155 + _1991;
    int _2159 = abs(_2141);
    float _2161 = in.m_73.y;
    int _2163 = _2153 * _1987;
    float _2165 = float(uint(_2131));
    int _2167 = _2157 * _2133;
    int _2169 = _1252 + (-1);
    int _2171 = _2101 * _2127;
    int _2173 = _2171 + _1308;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2177 = _2175 != 0;
    float _2179 = as_type<float>(_1298) * _2165;
    int _2181 = _2123 * _2159;
    int _2183 = _2181 + _2167;
    int _2185 = ~_1166;
    int _2187 = _2185 + 1;
    int _2189 = _1929 * _2169;
    int _2191 = _2189 + _2163;
    bool _2193 = !_2177;
    int _2195 = _2193 ? 0 : 1;
    float _2197 = trunc(_2179);
    float _2199 = precise::max(_2197, 0.0);
    uint _2201 = uint(_2199);
    int _2203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2205 = _2203 != 0;
    int _2207 = abs(_2195);
    int _2209 = _2187 * int(_2147);
    int _2211 = _2209 + _2097;
    bool _2213 = !_2205;
    int _2215 = _2213 ? 0 : 1;
    int _2217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2219 = _2217 != 0;
    int _2221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2223 = _2221 != 0;
    float _2225 = trunc(_1743);
    int _2227 = int(_2225);
    int _2229 = ~_1238;
    int _2231 = _2229 + 1;
    float _2233 = float(uint(_2211));
    int _2235 = _1983 * _2207;
    int _2237 = _2235 + _2183;
    bool _2239 = !_2223;
    int _2241 = _2239 ? 0 : 1;
    float _2243 = -_2161;
    float _2245 = _2243 + 1.0;
    float _2247 = as_type<float>(_1276) * _2233;
    bool _2249 = !_2219;
    int _2251 = _2249 ? 0 : 1;
    int _2253 = abs(_2241);
    int _2255 = _2231 * int(_2201);
    int _2257 = _2255 + _2131;
    int _2259 = abs(_2215);
    float _2261 = trunc(_2247);
    float _2263 = precise::max(_2261, 0.0);
    uint _2265 = uint(_2263);
    int _2267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2269 = _2267 != 0;
    int _2271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2273 = _2271 != 0;
    int _2275 = abs(_2251);
    float _2277 = float(uint(_2257));
    int _2279 = _2191 * _2253;
    bool _2281 = !_2269;
    int _2283 = _2281 ? 0 : 1;
    int _2285 = _1893 * _2259;
    int _2287 = _2285 + _2237;
    int _2289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2291 = _2289 != 0;
    float _2293 = as_type<float>(_1298) * _2277;
    int _2295 = abs(_2283);
    float _2297 = float(uint(_2287));
    float _2299 = trunc(_2293);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    int _2305 = _2227 * _2275;
    int _2307 = _2305 + _2279;
    bool _2309 = !_2273;
    int _2311 = _2309 ? 0 : 1;
    float _2313 = as_type<float>(_1280) * _2297;
    int _2315 = int(_2147) + int(_2265);
    int _2317 = _2173 * _2295;
    int _2319 = _2317 + _2307;
    int _2321 = ~_1166;
    int _2323 = _2321 + 1;
    float _2325 = trunc(_2313);
    float _2327 = precise::max(_2325, 0.0);
    uint _2329 = uint(_2327);
    int _2331 = abs(_2311);
    float _2333 = in.m_63.w;
    int _2335 = _2323 * _2315;
    int _2337 = _2335 + _2097;
    int _2339 = ~_1218;
    int _2341 = _2339 + 1;
    int _2343 = _2101 * _2331;
    int _2345 = _2343 + _2319;
    int _2347 = ~_1238;
    int _2349 = _2347 + 1;
    int _2351 = _2101;
    float _2353 = as_type<float>(_1903);
    float _2355 = as_type<float>(_1785);
    if (_2291)
    {
        float _2357 = -_1106;
        float _2359 = _2357 + 1.0;
        _2351 = as_type<int>(_2359);
    }
    int _2361 = _2351;
    bool _2363 = uint(_2337) >= uint(_1166);
    int _2365 = int(_2201) + int(_2303);
    bool _2367 = !_2363;
    int _2369 = _2367 ? 0 : (-1);
    int _2371 = _2349 * _2365;
    int _2373 = _2371 + _2131;
    float _2375 = float(uint(_2345));
    int _2377 = _2341 * int(_2329);
    int _2379 = _2377 + _2287;
    bool _2381 = _1112 > 0.5;
    int _2383 = ~_2315;
    int _2385 = _2383 + _2369;
    int _2387 = _2385 + 1;
    float _2389 = as_type<float>(_1479) * _2375;
    if (_2291)
    {
        float _2391 = _2381 ? as_type<float>(_2361) : _1106;
        _1176 = _2391;
    }
    float _2393 = _1176;
    bool _2395 = uint(_2373) >= uint(_1238);
    int _2397 = _1166 * _2387;
    int _2399 = _2397 + _2097;
    float _2401 = float(uint(_2379));
    float _2403 = trunc(_2389);
    float _2405 = precise::max(_2403, 0.0);
    uint _2407 = uint(_2405);
    bool _2409 = _1166 == 0;
    bool _2411 = !_2395;
    int _2413 = _2411 ? 0 : (-1);
    bool _2415 = _2333 > 0.5;
    float _2417 = as_type<float>(_1280) * _2401;
    bool _2419 = !_2409;
    int _2421 = _2419 ? _2399 : (-1);
    int _2423 = _2415 ? as_type<int>(_2245) : as_type<int>(_2161);
    float _2425 = trunc(_2417);
    float _2427 = precise::max(_2425, 0.0);
    uint _2429 = uint(_2427);
    int _2431 = _2421 & 3;
    bool _2433 = _2431 != 0;
    int _2435 = _2421 & 3;
    bool _2437 = _2435 != 0;
    bool _2439 = uint(_2431) >= 2u;
    int _2441 = _2437 ? 0 : 1;
    int _2443 = ~_2365;
    int _2445 = _2443 + _2413;
    int _2447 = _2445 + 1;
    bool _2449 = uint(_2431) > 1u;
    int _2451 = ~_1252;
    int _2453 = _2451 + 1;
    int _2455 = _1238 * _2447;
    int _2457 = _2455 + _2131;
    int _2459 = _2439 ? 0 : 1;
    bool _2461 = _2431 != 3;
    int _2463 = _2453 * int(_2407);
    int _2465 = _2463 + _2345;
    int _2467 = _2381 ? as_type<int>(_2245) : as_type<int>(_2161);
    bool _2469 = _1238 == 0;
    int _2471 = ~_1218;
    int _2473 = _2471 + 1;
    bool _2475 = !_2469;
    int _2477 = _2475 ? _2457 : (-1);
    int _2479 = int(_2329) + int(_2429);
    float _2481 = float(uint(_2465));
    int _2483 = ~_2441;
    int _2485 = _2483 + 1;
    int _2487 = _2485 + 1;
    float _2489 = as_type<float>(_1479) * _2481;
    int _2491 = _2487;
    if (!_2449)
    {
        int _2493 = ~_2441;
        int _2495 = _2493 + 1;
        _2491 = _2495;
    }
    int _2497 = _2491;
    int _2499 = _2477 & 3;
    bool _2501 = _2499 != 0;
    int _2503 = _2473 * _2479;
    int _2505 = _2503 + _2287;
    int _2507 = ~_2459;
    int _2509 = _2507 + 1;
    int _2511 = _2509 + 1;
    int _2513 = _2511;
    if (_2461)
    {
        int _2515 = ~_2459;
        int _2517 = _2515 + 1;
        _2513 = _2517;
    }
    int _2519 = _2513;
    bool _2521 = uint(_2499) >= 2u;
    float _2523 = trunc(_2489);
    float _2525 = precise::max(_2523, 0.0);
    uint _2527 = uint(_2525);
    int _2529 = _2501 ? 0 : 1;
    bool _2531 = uint(_2505) >= uint(_1218);
    int _2533 = _2521 ? 0 : 1;
    bool _2535 = _2499 != 3;
    bool _2537 = !_2531;
    int _2539 = _2537 ? 0 : (-1);
    bool _2541 = uint(_2499) > 1u;
    int _2543 = ~_2479;
    int _2545 = _2543 + _2539;
    int _2547 = _2545 + 1;
    int _2549 = ~_2533;
    int _2551 = _2549 + 1;
    int _2553 = _2551 + 1;
    bool _2555 = _1218 == 0;
    int _2557 = _1218 * _2547;
    int _2559 = _2557 + _2287;
    int _2561 = ~_2529;
    int _2563 = _2561 + 1;
    int _2565 = _2563 + 1;
    int _2567 = _2553;
    int _2569 = _2565;
    if (_2535)
    {
        int _2571 = ~_2533;
        int _2573 = _2571 + 1;
        _2567 = _2573;
    }
    int _2575 = _2567;
    int _2577 = ~_1252;
    int _2579 = _2577 + 1;
    int _2581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2583 = _2581 != 0;
    if (!_2541)
    {
        int _2585 = ~_2529;
        int _2587 = _2585 + 1;
        _2569 = _2587;
    }
    int _2589 = _2569;
    bool _2591 = !_2555;
    int _2593 = _2591 ? _2559 : (-1);
    int _2595 = int(_2407) + int(_2527);
    bool _2597 = !_2583;
    int _2599 = _2597 ? 0 : 1;
    int _2601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2603 = _2601 != 0;
    int _2605 = _2579 * _2595;
    int _2607 = _2605 + _2345;
    int _2609 = _2593 & 3;
    bool _2611 = _2609 != 0;
    bool _2613 = !_2603;
    int _2615 = _2613 ? 0 : 1;
    bool _2617 = uint(_2609) >= 2u;
    int _2619 = _2611 ? 0 : 1;
    bool _2621 = uint(_2607) >= uint(_1252);
    int _2623 = _2617 ? 0 : 1;
    bool _2625 = _2609 != 3;
    bool _2627 = !_2621;
    int _2629 = _2627 ? 0 : (-1);
    bool _2631 = uint(_2609) > 1u;
    int _2633 = ~_2595;
    int _2635 = _2633 + _2629;
    int _2637 = _2635 + 1;
    int _2639 = ~_2623;
    int _2641 = _2639 + 1;
    int _2643 = _2641 + 1;
    bool _2645 = _1252 == 0;
    int _2647 = _1252 * _2637;
    int _2649 = _2647 + _2345;
    int _2651 = ~_2619;
    int _2653 = _2651 + 1;
    int _2655 = _2653 + 1;
    int _2657 = _2643;
    int _2659 = _2655;
    if (_2625)
    {
        int _2661 = ~_2623;
        int _2663 = _2661 + 1;
        _2657 = _2663;
    }
    int _2665 = _2657;
    int _2667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2669 = _2667 != 0;
    bool _2671 = !_2645;
    int _2673 = _2671 ? _2649 : (-1);
    float _2675 = _2669 ? as_type<float>(_2467) : _2161;
    if (!_2631)
    {
        int _2677 = ~_2619;
        int _2679 = _2677 + 1;
        _2659 = _2679;
    }
    int _2681 = _2659;
    int _2683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2685 = _2683 != 0;
    int _2687 = _2673 & 3;
    bool _2689 = _2687 != 0;
    bool _2691 = !_2685;
    int _2693 = _2691 ? 0 : 1;
    bool _2695 = uint(_2687) >= 2u;
    int _2697 = _2689 ? 0 : 1;
    int _2699 = _2695 ? 0 : 1;
    bool _2701 = _2687 != 3;
    bool _2703 = uint(_2687) > 1u;
    int _2705 = ~_2699;
    int _2707 = _2705 + 1;
    int _2709 = _2707 + 1;
    int _2711 = ~_2697;
    int _2713 = _2711 + 1;
    int _2715 = _2713 + 1;
    float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2719 = _2717 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2721 = _2709;
    int _2723 = _2715;
    if (_2701)
    {
        int _2725 = ~_2699;
        int _2727 = _2725 + 1;
        _2721 = _2727;
    }
    int _2729 = _2721;
    float _2731 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2733 = _2731 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    if (!_2703)
    {
        int _2735 = ~_2697;
        int _2737 = _2735 + 1;
        _2723 = _2737;
    }
    int _2739 = _2723;
    float _2741 = 1.0 / _2719;
    float _2743 = in.m_48.x;
    float _2745 = in.m_48.y;
    float _2747 = in.m_48.z;
    bool _2749 = _1439 > 0.5;
    float _2751 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2755 = _2753 != 0;
    int _2757 = _2749 ? as_type<int>(_2245) : as_type<int>(_2161);
    float _2759 = _2755 ? as_type<float>(_2423) : _2161;
    float _2761 = 1.0 / _2733;
    int _2763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2765 = _2763 != 0;
    int _2767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2769 = _2767 != 0;
    float _2771 = _2765 ? as_type<float>(_2757) : _2161;
    float _2773 = _2769 ? as_type<float>(_2757) : _2161;
    bool _2775 = !_1537;
    float _2777 = _2775 ? as_type<float>(_1441) : as_type<float>(_1443);
    bool _2779 = !_1537;
    float _2781 = _2779 ? as_type<float>(_1445) : as_type<float>(_1441);
    float _2783 = _202 * _2745;
    float _2785 = _196 * _2745;
    float _2787 = _208 * _2745;
    float _2789 = fma(_200, _2743, _2783);
    float _2791 = fma(_194, _2743, _2785);
    float _2793 = fma(_206, _2743, _2787);
    if (!_1537)
    {
        _1621 = _1439;
    }
    float _2795 = _1621;
    float _2797 = fma(_204, _2747, _2789);
    float _2799 = fma(_198, _2747, _2791);
    float _2801 = 0.0;
    float _2803 = _2795;
    if (!_1537)
    {
        _2801 = _1439;
    }
    float _2805 = _2801;
    float _2807 = as_type<float>(_1441) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2809 = _2805;
    if (!_1537)
    {
        _1585 = _1112;
    }
    float _2811 = _1585;
    float _2813 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2815 = 0.0;
    float _2817 = _2811;
    if (!_1537)
    {
        _2815 = _1112;
    }
    float _2819 = _2815;
    float _2821 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2823 = _2819;
    if (_1549)
    {
        _2353 = _1427;
    }
    float _2825 = _2353;
    float _2827 = fma(as_type<float>(_1441), (*spvDescriptorSet0.vp_c9)._m0[93].w, _2813);
    float _2829 = _2825;
    if (_1537)
    {
        _2803 = _1112;
    }
    float _2831 = _2803;
    float _2833 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2835 = log2(_2833);
    if (_1537)
    {
        _2809 = _1112;
    }
    float _2837 = _2809;
    float _2839 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_1549)
    {
        _2355 = _1112;
    }
    float _2841 = _2355;
    float _2843 = fma(_210, _2747, _2793);
    float _2845 = _2841;
    if (_1537)
    {
        _2817 = _1427;
    }
    float _2847 = _2817;
    float _2849 = fma(_2781, (*spvDescriptorSet0.vp_c9)._m0[98].w, _1677);
    if (_1537)
    {
        _2823 = _1427;
    }
    float _2851 = _2823;
    float _2853 = _2781 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    if (!_1549)
    {
        _2829 = _1439;
    }
    float _2855 = _2829;
    float _2857 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    if (!_1549)
    {
        _2845 = _1427;
    }
    float _2859 = _2845;
    float _2861 = fma(_2853, -2.0, _1703);
    int _2863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2865 = _2863 != 0;
    int _2867 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2869 = _2867 != 0;
    float _2871 = fma(as_type<float>(_1443), (*spvDescriptorSet0.vp_c9)._m0[93].z, _2857);
    int _2873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2875 = _2873 != 0;
    float _2877 = _2835 * _164;
    float _2879 = as_type<float>(_1443) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2881 = _2847 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2883 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2885 = exp2(_2877);
    float _2887 = _2865 ? as_type<float>(_2757) : _2161;
    float _2889 = fma(_2821, -2.0, _2883);
    bool _2891 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2893 = isnan(0.0);
    bool _2895 = _2891 || _2893;
    bool _2897 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2899 = _2895 || _2897;
    float _2901 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2903 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2901;
    float _2905 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2907 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2909 = _2903 * _2741;
    float _2911 = fma(_2807, -2.0, _2905);
    float _2913 = fma(_2851, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2907);
    float _2915 = _2855 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2917 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2919 = -_2885;
    float _2921 = _2919 + 1.0;
    float _2923 = -_2917;
    float _2925 = fma(_2839, 2.0, _2923);
    float _2927 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2929 = _2899 ? _2921 : 0.0;
    float _2931 = -_2751;
    float _2933 = fma(_2915, 2.0, _2931);
    float _2935 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2937 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2939 = -_2927;
    float _2941 = fma(_2879, 2.0, _2939);
    float _2943 = fma(_2837, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2935);
    float _2945 = _2831 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2947 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2949 = _2947 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2951 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2953 = fma(_2945, -2.0, _1681);
    float _2955 = _2869 ? as_type<float>(_2757) : _2161;
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _2959 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2961 = _2959 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2963 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2965 = _2963 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2967 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2969 = isnan(1.0);
    bool _2971 = _2967 || _2969;
    bool _2973 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2975 = _2971 || _2973;
    float _2977 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2979 = 1.0 + _2977;
    float _2981 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2937);
    float _2983 = 1.0 / _2979;
    float _2985 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2951);
    float _2987 = _1427 * 2.0;
    float _2989 = fma(_2777, (*spvDescriptorSet0.vp_c9)._m0[98].z, _2957);
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2993 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2995 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _2997 = _2777 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _2999 = 1.0 / _2949;
    float _3001 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3003 = _2859 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3007 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2985);
    float _3009 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2991);
    float _3011 = -_2995;
    float _3013 = fma(_2997, 2.0, _3011);
    float _3015 = floor(_2987);
    float _3017 = -_2993;
    float _3019 = fma(_2881, 2.0, _3017);
    float _3021 = fma(_3003, -2.0, _3001);
    float _3023 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3005);
    float _3025 = _2961 * _2761;
    float _3027 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3029 = _3027 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3031 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3009);
    float _3033 = 1.0 / _2965;
    float _3035 = -_164;
    float _3037 = fma(_3035, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2941);
    float _3039 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2911);
    float _3041 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2889);
    float _3043 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2981);
    float _3045 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3023);
    float _3047 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2871);
    float _3049 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2827);
    float _3051 = -_164;
    float _3053 = fma(_3051, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2925);
    float _3055 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].z, _2989);
    float _3057 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2849);
    float _3059 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2913);
    float _3061 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2943);
    float _3063 = -_164;
    float _3065 = fma(_3063, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3013);
    float _3067 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2861);
    float _3069 = -_164;
    float _3071 = fma(_3069, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3019);
    float _3073 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2953);
    float _3075 = -_164;
    float _3077 = fma(_3075, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2933);
    float _3079 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3021);
    if (_2975)
    {
        float _3081 = _2929 * _2983;
        _168 = _3081;
    }
    float _3083 = _168;
    float _3085 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3087 = _3085 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3089 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3091 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3089;
    float _3093 = 1.0 / _3029;
    float _3095 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3097 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3095;
    float _3099 = _3091 * _2999;
    bool _3101 = _3015 >= 0.0;
    bool _3103 = isnan(_3015);
    bool _3105 = _3101 || _3103;
    bool _3107 = isnan(0.0);
    bool _3109 = _3105 || _3107;
    float _3111 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3113 = _3111 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _3115 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3117 = _3115 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3119 = _3097 * _3033;
    float _3121 = float(uint(_1881));
    float _3123 = 1.0 / _3087;
    int _3125 = _3109 ? 0 : 1;
    float _3127 = in.m_57.w;
    bool _3129 = _3015 > 0.0;
    float _3131 = as_type<float>(_1298) * _3121;
    float _3133 = float(uint(_1857));
    float _3135 = _3117 * _3093;
    float _3137 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3139 = _3137 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3141 = 1.0 / _3113;
    float _3143 = as_type<float>(_1276) * _3133;
    int _3145 = ~_1238;
    int _3147 = _3145 + 1;
    float _3149 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3151 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3149;
    int _3153 = ~_1218;
    int _3155 = _3153 + 1;
    float _3157 = _3139 * _3123;
    int _3159 = ~_3125;
    int _3161 = _3159 + 1;
    int _3163 = _3161 + 1;
    float _3165 = trunc(_3131);
    float _3167 = precise::max(_3165, 0.0);
    uint _3169 = uint(_3167);
    int _3171 = _3163;
    if (!_3129)
    {
        int _3173 = ~_3125;
        int _3175 = _3173 + 1;
        _3171 = _3175;
    }
    int _3177 = _3171;
    float _3179 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3181 = _1100 + _3179;
    float _3183 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3185 = _1100 + _3183;
    bool _3187 = _1997 >= 0.0;
    bool _3189 = isnan(_1997);
    bool _3191 = _3187 || _3189;
    bool _3193 = isnan(0.0);
    bool _3195 = _3191 || _3193;
    float _3197 = fma(_2909, _3181, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3199 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3201 = _1100 + _3199;
    float _3203 = trunc(_3143);
    float _3205 = precise::max(_3203, 0.0);
    uint _3207 = uint(_3205);
    float _3209 = fma(_3025, _3185, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3211 = _3151 * _3141;
    float _3213 = fma(_3135, _3201, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3215 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3217 = _1100 + _3215;
    int _3219 = ~_1166;
    int _3221 = _3219 + 1;
    int _3223 = _3195 ? 0 : 1;
    int _3225 = _3147 * int(_3169);
    int _3227 = _3225 + _1881;
    float _3229 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3231 = _1100 + _3229;
    bool _3233 = _1997 > 0.0;
    float _3235 = float(uint(_2173));
    float _3237 = fma(_3099, _3231, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3239 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3241 = _1100 + _3239;
    int _3243 = ~_1252;
    int _3245 = _3243 + 1;
    int _3247 = _3221 * int(_3207);
    int _3249 = _3247 + _1857;
    float _3251 = as_type<float>(_1479) * _3235;
    float _3253 = fma(_3119, _3241, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3255 = fma(_3157, _3217, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3257 = float(uint(_3227));
    float _3259 = float(uint(_1983));
    float _3261 = trunc(_3251);
    float _3263 = precise::max(_3261, 0.0);
    uint _3265 = uint(_3263);
    float _3267 = float(uint(_3249));
    float _3269 = as_type<float>(_1298) * _3257;
    bool _3271 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3273 = isnan(_1100);
    bool _3275 = _3271 || _3273;
    bool _3277 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3279 = _3275 || _3277;
    float _3281 = float(_3279);
    float _3283 = as_type<float>(_1280) * _3259;
    bool _3285 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3287 = isnan(_1100);
    bool _3289 = _3285 || _3287;
    bool _3291 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3293 = _3289 || _3291;
    float _3295 = float(_3293);
    float _3297 = as_type<float>(_1276) * _3267;
    bool _3299 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3301 = isnan(_1100);
    bool _3303 = _3299 || _3301;
    bool _3305 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3307 = _3303 || _3305;
    float _3309 = float(_3307);
    float _3311 = -_3281;
    float _3313 = _3311 + 1.0;
    bool _3315 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3317 = isnan(_1100);
    bool _3319 = _3315 || _3317;
    bool _3321 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3323 = _3319 || _3321;
    float _3325 = float(_3323);
    float _3327 = trunc(_3283);
    float _3329 = precise::max(_3327, 0.0);
    uint _3331 = uint(_3329);
    int _3333 = _2477 & 3;
    bool _3335 = _3333 != 0;
    float _3337 = -_3309;
    float _3339 = _3337 + 1.0;
    float _3341 = _3309 * _3313;
    bool _3343 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3345 = isnan(_1100);
    bool _3347 = _3343 || _3345;
    bool _3349 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3351 = _3347 || _3349;
    float _3353 = float(_3351);
    float _3355 = _3295 * _3339;
    float _3357 = -_3295;
    float _3359 = _3357 + 1.0;
    float _3361 = trunc(_3297);
    float _3363 = precise::max(_3361, 0.0);
    uint _3365 = uint(_3363);
    bool _3367 = _2687 != 3;
    float _3369 = _3325 * _3359;
    float _3371 = -_3325;
    float _3373 = _3371 + 1.0;
    bool _3375 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3377 = isnan(_1100);
    bool _3379 = _3375 || _3377;
    bool _3381 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3383 = _3379 || _3381;
    float _3385 = float(_3383);
    bool _3387 = !_3367;
    int _3389 = _3387 ? 0 : (-1);
    int _3391 = _3155 * int(_3331);
    int _3393 = _3391 + _1983;
    float _3395 = _3353 * _3373;
    float _3397 = -_3353;
    float _3399 = _3397 + 1.0;
    bool _3401 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3403 = isnan(_1100);
    bool _3405 = _3401 || _3403;
    bool _3407 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3409 = _3405 || _3407;
    float _3411 = float(_3409);
    float _3413 = -_3385;
    float _3415 = _3413 + 1.0;
    float _3417 = float(uint(_3393));
    float _3419 = _3385 * _3399;
    bool _3421 = _1100 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3423 = isnan(_1100);
    bool _3425 = _3421 || _3423;
    bool _3427 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3429 = _3425 || _3427;
    float _3431 = float(_3429);
    float _3433 = _3411 * _3415;
    float _3435 = -_3411;
    float _3437 = _3435 + 1.0;
    float _3439 = as_type<float>(_1280) * _3417;
    float _3441 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3443 = _1100 + _3441;
    float _3445 = _2799 + _3127;
    float _3447 = trunc(_3269);
    float _3449 = precise::max(_3447, 0.0);
    uint _3451 = uint(_3449);
    int _3453 = _3245 * int(_3265);
    int _3455 = _3453 + _2173;
    float _3457 = _3431 * _3437;
    float _3459 = fma(_3211, _3443, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3461 = _2797 + _1561;
    float _3463 = -_3431;
    float _3465 = _3463 + 1.0;
    float _3467 = float(uint(_3455));
    float _3469 = _3197 * _3457;
    float _3471 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3473 = ~_3223;
    int _3475 = _3473 + 1;
    int _3477 = _3475 + 1;
    float _3479 = fma(_3465, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3469);
    float _3481 = as_type<float>(_1479) * _3467;
    float _3483 = _2843 + _1597;
    int _3485 = _3477;
    if (!_3233)
    {
        int _3487 = ~_3223;
        int _3489 = _3487 + 1;
        _3485 = _3489;
    }
    int _3491 = _3485;
    float _3493 = fma(_3209, _3433, _3479);
    float _3495 = trunc(_3439);
    float _3497 = precise::max(_3495, 0.0);
    uint _3499 = uint(_3497);
    int _3501 = ~_1166;
    int _3503 = _3501 + 1;
    int _3505 = int(_3207) + int(_3365);
    float _3507 = fma(_3237, _3419, _3493);
    int _3509 = ~_1238;
    int _3511 = _3509 + 1;
    int _3513 = int(_3169) + int(_3451);
    float _3515 = trunc(_3481);
    float _3517 = precise::max(_3515, 0.0);
    uint _3519 = uint(_3517);
    int _3521 = _3503 * _3505;
    int _3523 = _3521 + _1857;
    float _3525 = _3471 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    bool _3527 = !_2875;
    int _3529 = _3527 ? 0 : 1;
    float _3531 = fma(_3213, _3395, _3507);
    int _3533 = ~_1218;
    int _3535 = _3533 + 1;
    int _3537 = _3511 * _3513;
    int _3539 = _3537 + _1881;
    int _3541 = int(_3331) + int(_3499);
    float _3543 = fma(_3525, _1214, -0.5);
    bool _3545 = uint(_3523) >= uint(_1166);
    float _3547 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3549 = _3461 + _3547;
    int _3551 = ~_1252;
    int _3553 = _3551 + 1;
    int _3555 = _3535 * _3541;
    int _3557 = _3555 + _1983;
    bool _3559 = !_3545;
    int _3561 = _3559 ? 0 : (-1);
    float _3563 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3565 = _3445 + _3563;
    bool _3567 = uint(_3539) >= uint(_1238);
    float _3569 = _1439 * 2.0;
    int _3571 = int(_3265) + int(_3519);
    float _3573 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3575 = _3483 + _3573;
    float _3577 = fma(_3253, _3369, _3531);
    bool _3579 = !_3567;
    int _3581 = _3579 ? 0 : (-1);
    float _3583 = floor(_3569);
    bool _3585 = uint(_3557) >= uint(_1218);
    float _3587 = _3549 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3589 = _3553 * _3571;
    int _3591 = _3589 + _2173;
    int _3593 = ~_3505;
    int _3595 = _3593 + _3561;
    int _3597 = _3595 + 1;
    float _3599 = fma(_3255, _3355, _3577);
    float _3601 = fma(_3565, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3587);
    bool _3603 = !_3585;
    int _3605 = _3603 ? 0 : (-1);
    float _3607 = _1112 + _1439;
    bool _3609 = uint(_3591) >= uint(_1252);
    float _3611 = fma(_3575, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3601);
    int _3613 = ~_3513;
    int _3615 = _3613 + _3581;
    int _3617 = _3615 + 1;
    float _3619 = _1112 + _1427;
    bool _3621 = !_3609;
    int _3623 = _3621 ? 0 : (-1);
    float _3625 = fma(_3459, _3341, _3599);
    bool _3627 = _3611 >= 0.0;
    int _3629 = _1166 * _3597;
    int _3631 = _3629 + _1857;
    float _3633 = _3619 + (-1.0);
    int _3635 = _1238 * _3617;
    int _3637 = _3635 + _1881;
    bool _3639 = !_3335;
    int _3641 = _3639 ? 0 : 1;
    float _3643 = fma(_3281, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3625);
    float _3645 = fma(_3633, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3647 = _3549 * _3549;
    int _3649 = _2593 & 3;
    bool _3651 = _3649 != 0;
    float _3653 = _3607 + (-1.0);
    int _3655 = _2421 >> 31;
    float _3657 = fma(_3565, _3565, _3647);
    bool _3659 = !_3651;
    int _3661 = _3659 ? 0 : 1;
    float _3663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    int _3665 = _2673 & 3;
    bool _3667 = _3665 != 0;
    float _3669 = fma(_3575, _3575, _3657);
    bool _3671 = !_2433;
    int _3673 = _3671 ? 0 : 1;
    out.m_75.x = _3643;
    bool _3675 = !_3667;
    int _3677 = _3675 ? 0 : 1;
    float _3679 = _1112 + (-0.5);
    bool _3681 = _2431 != 3;
    float _3683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    if (_3627)
    {
        out.m_51.x = 0.0;
    }
    bool _3685 = _3583 > 0.0;
    bool _3687 = _3583 >= 0.0;
    bool _3689 = isnan(_3583);
    bool _3691 = _3687 || _3689;
    bool _3693 = isnan(0.0);
    bool _3695 = _3691 || _3693;
    float _3697 = fma(_3653, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3699 = _3583;
    if (_3627)
    {
        _3699 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3701 = _3699;
    float _3703 = rsqrt(_3669);
    int _3705 = _3655 & 3;
    int _3707 = _2477 >> 31;
    int _3709 = as_type<int>(_3701);
    if (_3627)
    {
        float _3711 = _3701 * 5.0;
        _3709 = as_type<int>(_3711);
    }
    int _3713 = _3709;
    int _3715 = _2421 + _3705;
    int _3717 = _2593 >> 31;
    int _3719 = _3715 >> 2;
    if (_3627)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _12190 = as_type<float>(_3713);
        out.gl_Position.z = _12190;
    }
    int _3721 = _3707 & 3;
    int _3723 = _3717 & 3;
    int _3725 = _3719 << 4;
    int _3727 = _3725 + 368;
    float _3729 = _3549 * _3703;
    int _3731 = _2593 + _3723;
    float _3733 = _3565 * _3703;
    int _3735 = _2477 + _3721;
    float _3737 = -_3729;
    float _3739 = fma(_3737, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3549);
    float _3741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3743 = _2673 >> 31;
    float _3745 = -_3733;
    float _3747 = fma(_3745, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3565);
    float _3749 = _3739 * _3739;
    int _3751 = _3731 >> 2;
    float _3753 = _3575 * _3703;
    int _3755 = _3743 & 3;
    float _3757 = fma(_3747, _3747, _3749);
    uint _3759 = uint(int(uint(_3727) >> uint(2)));
    uint _3761 = uint(int(uint(int(_3759)) >> uint(2)));
    int _3763 = int(_3759) & 3;
    float _3765 = (*spvDescriptorSet0.vp_c9)._m0[int(_3761)][_3763];
    int _3767 = int(_3759) + 1;
    uint _3769 = uint(int(uint(_3767) >> uint(2)));
    int _3771 = _3767 & 3;
    float _3773 = (*spvDescriptorSet0.vp_c9)._m0[int(_3769)][_3771];
    int _3775 = _3751 << 4;
    int _3777 = _3775 + 656;
    float _3779 = -_3753;
    float _3781 = fma(_3779, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3575);
    int _3783 = _2673 + _3755;
    bool _3785 = !_3681;
    int _3787 = _3785 ? 0 : (-1);
    int _3789 = _3783 >> 2;
    float _3791 = _3741 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    uint _3793 = uint(int(uint(_3777) >> uint(2)));
    uint _3795 = uint(int(uint(int(_3793)) >> uint(2)));
    int _3797 = int(_3793) & 3;
    float _3799 = (*spvDescriptorSet0.vp_c9)._m0[int(_3795)][_3797];
    int _3801 = int(_3793) + 1;
    uint _3803 = uint(int(uint(_3801) >> uint(2)));
    int _3805 = _3801 & 3;
    float _3807 = (*spvDescriptorSet0.vp_c9)._m0[int(_3803)][_3805];
    int _3809 = _3735 >> 2;
    bool _3811 = _2499 != 3;
    float _3813 = fma(_3791, _2887, -0.5);
    int _3815 = _3809 << 4;
    int _3817 = _3815 + 512;
    float _3819 = fma(_3781, _3781, _3757);
    bool _3821 = !_3811;
    int _3823 = _3821 ? 0 : (-1);
    float _3825 = -_3067;
    float _3827 = fma(_3057, _3813, _3825);
    bool _3829 = _2609 != 3;
    uint _3831 = uint(int(uint(_3817) >> uint(2)));
    uint _3833 = uint(int(uint(int(_3831)) >> uint(2)));
    int _3835 = int(_3831) & 3;
    float _3837 = (*spvDescriptorSet0.vp_c9)._m0[int(_3833)][_3835];
    int _3839 = int(_3831) + 1;
    uint _3841 = uint(int(uint(_3839) >> uint(2)));
    int _3843 = _3839 & 3;
    float _3845 = (*spvDescriptorSet0.vp_c9)._m0[int(_3841)][_3843];
    int _3847 = _3789 << 4;
    int _3849 = _3847 + 800;
    float _3851 = _2955 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _3853 = ~_3571;
    int _3855 = _3853 + _3623;
    int _3857 = _3855 + 1;
    float _3859 = _1619 * _3663;
    int _3861 = ~_3541;
    int _3863 = _3861 + _3605;
    int _3865 = _3863 + 1;
    float _3867 = _3851 * _3683;
    int _3869 = abs(_2497);
    float _3871 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3873 = int(_3871);
    bool _3875 = !_2409;
    int _3877 = _3875 ? _3631 : (-1);
    int _3879 = _3777 + 8;
    uint _3881 = uint(int(uint(_3879) >> uint(2)));
    uint _3883 = uint(int(uint(int(_3881)) >> uint(2)));
    int _3885 = int(_3881) & 3;
    float _3887 = (*spvDescriptorSet0.vp_c9)._m0[int(_3883)][_3885];
    int _3889 = int(_3881) + 1;
    uint _3891 = uint(int(uint(_3889) >> uint(2)));
    int _3893 = _3889 & 3;
    float _3895 = (*spvDescriptorSet0.vp_c9)._m0[int(_3891)][_3893];
    bool _3897 = !_2469;
    int _3899 = _3897 ? _3637 : (-1);
    out.m_77.x = _3859;
    out.m_77.y = _3867;
    int _3901 = _3695 ? 0 : 1;
    int _3903 = _1218 * _3865;
    int _3905 = _3903 + _1983;
    int _3907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3909 = _3907 != 0;
    int _3911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3913 = _3911 != 0;
    int _3915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3917 = _3915 != 0;
    int _3919 = _1252 * _3857;
    int _3921 = _3919 + _2173;
    int _3923 = ~_3901;
    int _3925 = _3923 + 1;
    int _3927 = _3925 + 1;
    uint _3929 = uint(int(uint(_3849) >> uint(2)));
    uint _3931 = uint(int(uint(int(_3929)) >> uint(2)));
    int _3933 = int(_3929) & 3;
    float _3935 = (*spvDescriptorSet0.vp_c9)._m0[int(_3931)][_3933];
    int _3937 = int(_3929) + 1;
    uint _3939 = uint(int(uint(_3937) >> uint(2)));
    int _3941 = _3937 & 3;
    float _3943 = (*spvDescriptorSet0.vp_c9)._m0[int(_3939)][_3941];
    int _3945 = _3927;
    if (!_3685)
    {
        int _3947 = ~_3901;
        int _3949 = _3947 + 1;
        _3945 = _3949;
    }
    int _3951 = _3945;
    float _3953 = fma(_3055, _3543, _3065);
    int _3955 = abs(_2589);
    float _3957 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3959 = int(_3957);
    int _3961 = ~_3869;
    int _3963 = _3961 + 1;
    int _3965 = _3963 + 1;
    int _3967 = abs(_2681);
    int _3969 = _3727 + 8;
    uint _3971 = uint(int(uint(_3969) >> uint(2)));
    uint _3973 = uint(int(uint(int(_3971)) >> uint(2)));
    int _3975 = int(_3971) & 3;
    float _3977 = (*spvDescriptorSet0.vp_c9)._m0[int(_3973)][_3975];
    int _3979 = int(_3971) + 1;
    uint _3981 = uint(int(uint(_3979) >> uint(2)));
    int _3983 = _3979 & 3;
    float _3985 = (*spvDescriptorSet0.vp_c9)._m0[int(_3981)][_3983];
    int _3987 = abs(_3661);
    int _3989 = _3965 * as_type<int>(_3773);
    int _3991 = abs(_3673);
    int _3993 = abs(_2739);
    int _3995 = _3817 + 8;
    uint _3997 = uint(int(uint(_3995) >> uint(2)));
    uint _3999 = uint(int(uint(int(_3997)) >> uint(2)));
    int _4001 = int(_3997) & 3;
    float _4003 = (*spvDescriptorSet0.vp_c9)._m0[int(_3999)][_4001];
    int _4005 = int(_3997) + 1;
    uint _4007 = uint(int(uint(_4005) >> uint(2)));
    int _4009 = _4005 & 3;
    float _4011 = (*spvDescriptorSet0.vp_c9)._m0[int(_4007)][_4009];
    int _4013 = ~_3991;
    int _4015 = _4013 + 1;
    int _4017 = _4015 + 1;
    int _4019 = ~_3967;
    int _4021 = _4019 + 1;
    int _4023 = _4021 + 1;
    int _4025 = ~_3987;
    int _4027 = _4025 + 1;
    int _4029 = _4027 + 1;
    int _4031 = _3849 + 8;
    uint _4033 = uint(int(uint(_4031) >> uint(2)));
    uint _4035 = uint(int(uint(int(_4033)) >> uint(2)));
    int _4037 = int(_4033) & 3;
    float _4039 = (*spvDescriptorSet0.vp_c9)._m0[int(_4035)][_4037];
    int _4041 = int(_4033) + 1;
    uint _4043 = uint(int(uint(_4041) >> uint(2)));
    int _4045 = _4041 & 3;
    float _4047 = (*spvDescriptorSet0.vp_c9)._m0[int(_4043)][_4045];
    int _4049 = abs(_3641);
    int _4051 = _4023 * as_type<int>(_3807);
    int _4053 = abs(_2665);
    int _4055 = _4017 * as_type<int>(_3765);
    int _4057 = _4055 + _3989;
    int _4059 = abs(_2519);
    int _4061 = _4029 * as_type<int>(_3799);
    int _4063 = _4061 + _4051;
    int _4065 = abs(_3677);
    int _4067 = ~_3955;
    int _4069 = _4067 + 1;
    int _4071 = _4069 + 1;
    int _4073 = abs(_2575);
    int _4075 = _4071 * as_type<int>(_3845);
    int _4077 = ~_4053;
    int _4079 = _4077 + 1;
    int _4081 = _4079 + 1;
    float _4083 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4085 = int(_4083);
    int _4087 = ~_3993;
    int _4089 = _4087 + 1;
    int _4091 = _4089 + 1;
    int _4093 = ~_4065;
    int _4095 = _4093 + 1;
    int _4097 = _4095 + 1;
    int _4099 = _4081 * as_type<int>(_3887);
    int _4101 = _4099 + _4063;
    int _4103 = ~_4049;
    int _4105 = _4103 + 1;
    int _4107 = _4105 + 1;
    int _4109 = _4091 * as_type<int>(_3943);
    int _4111 = ~_4059;
    int _4113 = _4111 + 1;
    int _4115 = _4113 + 1;
    int _4117 = _4107 * as_type<int>(_3837);
    int _4119 = _4117 + _4075;
    int _4121 = abs(_3787);
    int _4123 = _4097 * as_type<int>(_3935);
    int _4125 = _4123 + _4109;
    int _4127 = ~_4073;
    int _4129 = _4127 + 1;
    int _4131 = _4129 + 1;
    float _4133 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4135 = int(_4133);
    int _4137 = abs(_2729);
    int _4139 = _4115 * as_type<int>(_3977);
    int _4141 = _4139 + _4057;
    bool _4143 = !_3829;
    int _4145 = _4143 ? 0 : (-1);
    int _4147 = ~_4121;
    int _4149 = _4147 + 1;
    int _4151 = _4149 + 1;
    int _4153 = ~_4137;
    int _4155 = _4153 + 1;
    int _4157 = _4155 + 1;
    int _4159 = abs(_3823);
    int _4161 = _4131 * as_type<int>(_4003);
    int _4163 = _4161 + _4119;
    int _4165 = abs(_4145);
    int _4167 = _4151 * as_type<int>(_3985);
    int _4169 = _4167 + _4141;
    float _4171 = float(uint(_3959));
    int _4173 = ~_4159;
    int _4175 = _4173 + 1;
    int _4177 = _4175 + 1;
    int _4179 = abs(_3389);
    int _4181 = _4157 * as_type<int>(_4039);
    int _4183 = _4181 + _4125;
    float _4185 = float(uint(_3873));
    float _4187 = 1.0 / _4171;
    int _4189 = ~_4165;
    int _4191 = _4189 + 1;
    int _4193 = _4191 + 1;
    int _4195 = _4177 * as_type<int>(_4011);
    int _4197 = _4195 + _4163;
    int _4199 = abs(_2599);
    int _4201 = ~_4179;
    int _4203 = _4201 + 1;
    int _4205 = _4203 + 1;
    int _4207 = _4193 * as_type<int>(_3895);
    int _4209 = _4207 + _4101;
    int _4211 = abs(_3959);
    float _4213 = 1.0 / _4185;
    int _4215 = abs(_2615);
    int _4217 = _4205 * as_type<int>(_4047);
    int _4219 = _4217 + _4183;
    int _4221 = ~_4199;
    int _4223 = _4221 + 1;
    int _4225 = _4223 + 1;
    float _4227 = float(uint(_4085));
    float _4229 = float(uint(_4211));
    int _4231 = _4169 * _4225;
    int _4233 = abs(_4085);
    int _4235 = ~_4215;
    int _4237 = _4235 + 1;
    int _4239 = _4237 + 1;
    float _4241 = 1.0 / _4229;
    int _4243 = _3877 * _4199;
    int _4245 = _4243 + _4231;
    int _4247 = abs(_2693);
    int _4249 = _4239 * _4197;
    float _4251 = float(uint(_4135));
    int _4253 = abs(_3873);
    float _4255 = 1.0 / _4227;
    int _4257 = abs(_4135);
    int _4259 = _3899 * _4215;
    int _4261 = _4259 + _4249;
    int _4263 = ~_4247;
    int _4265 = _4263 + 1;
    int _4267 = _4265 + 1;
    bool _4269 = _1218 == 0;
    int _4271 = _4267 * _4209;
    int _4273 = as_type<int>(_4187) + (-2);
    float _4275 = 1.0 / _4251;
    float _4277 = float(uint(_4245));
    float _4279 = float(uint(_4233));
    float _4281 = float(uint(_4253));
    float _4283 = as_type<float>(_4273) * _4277;
    int _4285 = abs(_3529);
    float _4287 = 1.0 / _4279;
    bool _4289 = !_4269;
    int _4291 = _4289 ? _3905 : (-1);
    int _4293 = as_type<int>(_4213) + (-2);
    float _4295 = float(uint(_4261));
    bool _4297 = _1252 == 0;
    float _4299 = 1.0 / _4281;
    int _4301 = ~_4285;
    int _4303 = _4301 + 1;
    int _4305 = _4303 + 1;
    float _4307 = as_type<float>(_4293) * _4295;
    bool _4309 = !_4297;
    int _4311 = _4309 ? _3921 : (-1);
    int _4313 = as_type<int>(_4255) + (-2);
    int _4315 = _4305 * _4219;
    float _4317 = float(uint(_4257));
    float _4319 = trunc(_4283);
    float _4321 = precise::max(_4319, 0.0);
    uint _4323 = uint(_4321);
    int _4325 = _4291 * _4247;
    int _4327 = _4325 + _4271;
    int _4329 = abs(_4245);
    int _4331 = _4311 * _4285;
    int _4333 = _4331 + _4315;
    int _4335 = abs(_4261);
    float _4337 = _3953 + 0.5;
    float _4339 = float(uint(_4327));
    float _4341 = trunc(_4307);
    float _4343 = precise::max(_4341, 0.0);
    uint _4345 = uint(_4343);
    int _4347 = as_type<int>(_4275) + (-2);
    float _4349 = as_type<float>(_4313) * _4339;
    float _4351 = float(uint(_4333));
    int _4353 = as_type<int>(_4241) + (-2);
    float _4355 = 1.0 / _4317;
    float _4357 = float(uint(_4329));
    float _4359 = as_type<float>(_4347) * _4351;
    int _4361 = ~_3959;
    int _4363 = _4361 + 1;
    float _4365 = _3827 + 0.5;
    int _4367 = as_type<int>(_4299) + (-2);
    float _4369 = as_type<float>(_4353) * _4357;
    int _4371 = ~_3873;
    int _4373 = _4371 + 1;
    float _4375 = trunc(_4349);
    float _4377 = precise::max(_4375, 0.0);
    uint _4379 = uint(_4377);
    int _4381 = _4363 * int(_4323);
    int _4383 = _4381 + _4245;
    out.m_79.x = _4337;
    out.m_79.y = _4365;
    int _4385 = abs(_4327);
    int _4387 = as_type<int>(_4287) + (-2);
    float _4389 = float(uint(_4383));
    float _4391 = trunc(_4359);
    float _4393 = precise::max(_4391, 0.0);
    uint _4395 = uint(_4393);
    float _4397 = float(uint(_4335));
    int _4399 = as_type<int>(_4355) + (-2);
    bool _4401 = !_3913;
    int _4403 = _4401 ? 0 : 1;
    float _4405 = as_type<float>(_4367) * _4397;
    int _4407 = _4373 * int(_4345);
    int _4409 = _4407 + _4261;
    bool _4411 = !_3909;
    int _4413 = _4411 ? 0 : 1;
    float _4415 = trunc(_4369);
    float _4417 = precise::max(_4415, 0.0);
    uint _4419 = uint(_4417);
    int _4421 = abs(_4333);
    float _4423 = as_type<float>(_4273) * _4389;
    float _4425 = float(uint(_4409));
    float _4427 = float(uint(_4421));
    float _4429 = in.m_81.x;
    float _4431 = in.m_81.y;
    float _4433 = in.m_81.z;
    float _4435 = float(uint(_4385));
    float _4437 = as_type<float>(_4293) * _4425;
    float _4439 = trunc(_4405);
    float _4441 = precise::max(_4439, 0.0);
    uint _4443 = uint(_4441);
    float _4445 = as_type<float>(_4399) * _4427;
    int _4447 = abs(_4403);
    float _4449 = as_type<float>(_4387) * _4435;
    int _4451 = abs(_4413);
    int _4453 = ~_4135;
    int _4455 = _4453 + 1;
    float _4457 = trunc(_4449);
    float _4459 = precise::max(_4457, 0.0);
    uint _4461 = uint(_4459);
    float _4463 = float(_3177);
    float _4465 = float(_4447);
    int _4467 = _4455 * int(_4395);
    int _4469 = _4467 + _4333;
    int _4471 = ~_4085;
    int _4473 = _4471 + 1;
    int _4475 = ~_4211;
    int _4477 = _4475 + 1;
    float _4479 = _4465 * _4463;
    float _4481 = float(_3951);
    int _4483 = _4473 * int(_4379);
    int _4485 = _4483 + _4327;
    float _4487 = float(_4451);
    float _4489 = trunc(_4445);
    float _4491 = precise::max(_4489, 0.0);
    uint _4493 = uint(_4491);
    float _4495 = float(uint(_4469));
    float _4497 = _4487 * _4481;
    float _4499 = float(uint(_4485));
    int _4501 = _4477 * int(_4419);
    int _4503 = _4501 + _4329;
    int _4505 = ~_4253;
    int _4507 = _4505 + 1;
    float _4509 = _4497 * (-2.0);
    float _4511 = as_type<float>(_4347) * _4495;
    float _4513 = as_type<float>(_4313) * _4499;
    float _4515 = float(uint(_4503));
    int _4517 = _4507 * int(_4443);
    int _4519 = _4517 + _4335;
    int _4521 = ~_4233;
    int _4523 = _4521 + 1;
    float _4525 = trunc(_4423);
    float _4527 = precise::max(_4525, 0.0);
    uint _4529 = uint(_4527);
    float _4531 = fma(_3645, _4509, _3645);
    float _4533 = fma(_4509, _4429, _4429);
    float _4535 = as_type<float>(_4353) * _4515;
    float _4537 = _1427 + (-0.5);
    float _4539 = float(uint(_4519));
    int _4541 = _4523 * int(_4461);
    int _4543 = _4541 + _4385;
    int _4545 = ~_3873;
    int _4547 = _4545 + 1;
    float _4549 = trunc(_4511);
    float _4551 = precise::max(_4549, 0.0);
    uint _4553 = uint(_4551);
    int _4555 = ~_4257;
    int _4557 = _4555 + 1;
    float _4559 = fma(_4537, (*spvDescriptorSet0.vp_c9)._m0[196].x, _4533);
    float _4561 = as_type<float>(_4367) * _4539;
    float _4563 = float(uint(_4543));
    float _4565 = fma(_4531, _3083, _4559);
    float _4567 = trunc(_4513);
    float _4569 = precise::max(_4567, 0.0);
    uint _4571 = uint(_4569);
    float _4573 = as_type<float>(_4387) * _4563;
    int _4575 = int(_4323) + int(_4529);
    int _4577 = _4557 * int(_4493);
    int _4579 = _4577 + _4421;
    int _4581 = ~_3959;
    int _4583 = _4581 + 1;
    int _4585 = ~_4135;
    int _4587 = _4585 + 1;
    float _4589 = trunc(_4437);
    float _4591 = precise::max(_4589, 0.0);
    uint _4593 = uint(_4591);
    int _4595 = int(_4395) + int(_4553);
    int _4597 = _4583 * _4575;
    int _4599 = _4597 + _4245;
    float _4601 = float(uint(_4579));
    bool _4603 = _4135 == 0;
    bool _4605 = uint(_4599) >= uint(_3959);
    float _4607 = trunc(_4561);
    float _4609 = precise::max(_4607, 0.0);
    uint _4611 = uint(_4609);
    int _4613 = int(_4379) + int(_4571);
    float _4615 = as_type<float>(_4399) * _4601;
    bool _4617 = !_3917;
    int _4619 = _4617 ? 0 : 1;
    float _4621 = trunc(_4535);
    float _4623 = precise::max(_4621, 0.0);
    uint _4625 = uint(_4623);
    int _4627 = ~_4085;
    int _4629 = _4627 + 1;
    int _4631 = int(_4345) + int(_4593);
    int _4633 = _4629 * _4613;
    int _4635 = _4633 + _4327;
    float _4637 = trunc(_4573);
    float _4639 = precise::max(_4637, 0.0);
    uint _4641 = uint(_4639);
    int _4643 = int(_4443) + int(_4611);
    int _4645 = _4547 * _4631;
    int _4647 = _4645 + _4261;
    int _4649 = ~_4211;
    int _4651 = _4649 + 1;
    int _4653 = _4587 * _4595;
    int _4655 = _4653 + _4333;
    bool _4657 = uint(_4635) >= uint(_4085);
    int _4659 = ~_4253;
    int _4661 = _4659 + 1;
    float _4663 = trunc(_4615);
    float _4665 = precise::max(_4663, 0.0);
    uint _4667 = uint(_4665);
    int _4669 = int(_4419) + int(_4625);
    int _4671 = ~_4233;
    int _4673 = _4671 + 1;
    int _4675 = _4661 * _4643;
    int _4677 = _4675 + _4335;
    bool _4679 = uint(_4647) >= uint(_3873);
    int _4681 = _4651 * _4669;
    int _4683 = _4681 + _4329;
    bool _4685 = uint(_4655) >= uint(_4135);
    float _4687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _4689 = int(_4461) + int(_4641);
    int _4691 = ~_4257;
    int _4693 = _4691 + 1;
    int _4695 = _4673 * _4689;
    int _4697 = _4695 + _4385;
    bool _4699 = !_4605;
    int _4701 = _4699 ? 0 : (-1);
    bool _4703 = uint(_4683) >= uint(_4211);
    bool _4705 = !_4679;
    int _4707 = _4705 ? 0 : (-1);
    bool _4709 = uint(_4677) >= uint(_4253);
    bool _4711 = !_4657;
    int _4713 = _4711 ? 0 : (-1);
    float _4715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4717 = uint(_4697) >= uint(_4233);
    bool _4719 = !_4685;
    int _4721 = _4719 ? 0 : (-1);
    int _4723 = ~_4575;
    int _4725 = _4723 + _4701;
    int _4727 = _4725 + 1;
    int _4729 = int(_4493) + int(_4667);
    int _4731 = ~_4631;
    int _4733 = _4731 + _4707;
    int _4735 = _4733 + 1;
    int _4737 = _3959 * _4727;
    int _4739 = _4737 + _4245;
    int _4741 = ~_4595;
    int _4743 = _4741 + _4721;
    int _4745 = _4743 + 1;
    float _4747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    int _4749 = ~_4613;
    int _4751 = _4749 + _4713;
    int _4753 = _4751 + 1;
    int _4755 = _4693 * _4729;
    int _4757 = _4755 + _4421;
    bool _4759 = !_4703;
    int _4761 = _4759 ? 0 : (-1);
    int _4763 = _3873 * _4735;
    int _4765 = _4763 + _4261;
    bool _4767 = _3959 == 0;
    int _4769 = _4085 * _4753;
    int _4771 = _4769 + _4327;
    int _4773 = _4245 ^ _3959;
    float _4775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4777 = !_4717;
    int _4779 = _4777 ? 0 : (-1);
    int _4781 = _4135 * _4745;
    int _4783 = _4781 + _4333;
    bool _4785 = _3873 == 0;
    bool _4787 = !_4767;
    int _4789 = _4787 ? _4739 : (-1);
    bool _4791 = _4085 == 0;
    float _4793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _4795 = uint(int(uint(_4773) >> uint(31)));
    bool _4797 = uint(_4757) >= uint(_4257);
    bool _4799 = !_4785;
    int _4801 = _4799 ? _4765 : (-1);
    float _4803 = _4687 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4805 = !_4791;
    int _4807 = _4805 ? _4771 : (-1);
    int _4809 = ~_4761;
    int _4811 = _4669 + _4809;
    int _4813 = _4811 + 1;
    float _4815 = fma(_4803, _1625, -0.5);
    float _4817 = float(_4789);
    float _4819 = _4775 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4821 = ~int(_4795);
    int _4823 = _4821 + 1;
    bool _4825 = !_4603;
    int _4827 = _4825 ? _4783 : (-1);
    float _4829 = fma(_4803, _4817, _3053);
    int _4831 = _4261 ^ _3873;
    float _4833 = _4747 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    bool _4835 = _4085 == 0;
    float _4837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4839 = _4327 ^ _4085;
    float _4841 = _4715 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4843 = _4333 ^ _4135;
    float _4845 = fma(_4833, _2393, -0.5);
    float _4847 = float(_4801);
    float _4849 = fma(_4841, _1719, -0.5);
    int _4851 = _4813 ^ _4823;
    float _4853 = fma(_4819, _1555, -0.5);
    float _4855 = float(_4827);
    float _4857 = fma(_4841, _4847, _3071);
    bool _4859 = !_4709;
    int _4861 = _4859 ? 0 : (-1);
    float _4863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4865 = !_4797;
    int _4867 = _4865 ? 0 : (-1);
    float _4869 = fma(_4833, _4855, _3037);
    uint _4871 = uint(int(uint(_4831) >> uint(31)));
    float _4873 = fma(_3059, _4849, _4857);
    uint _4875 = uint(int(uint(_4839) >> uint(31)));
    float _4877 = fma(_3031, _4815, _4829);
    uint _4879 = uint(int(uint(_4843) >> uint(31)));
    float _4881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _4883 = _3959 == 0;
    float _4885 = fma(_3047, _4845, _4869);
    int _4887 = ~_4823;
    int _4889 = _4887 + _4851;
    int _4891 = _4889 + 1;
    bool _4893 = _4135 == 0;
    int _4895 = ~_4861;
    int _4897 = _4643 + _4895;
    int _4899 = _4897 + 1;
    int _4901 = ~_4779;
    int _4903 = _4689 + _4901;
    int _4905 = _4903 + 1;
    int _4907 = ~_4867;
    int _4909 = _4729 + _4907;
    int _4911 = _4909 + 1;
    int _4913 = ~int(_4871);
    int _4915 = _4913 + 1;
    int _4917 = ~int(_4875);
    int _4919 = _4917 + 1;
    float _4921 = _4881 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _4923 = ~int(_4879);
    int _4925 = _4923 + 1;
    float _4927 = float(_4807);
    float _4929 = fma(_4921, _2771, -0.5);
    bool _4931 = !_4883;
    int _4933 = _4931 ? _4891 : (-1);
    int _4935 = _4899 ^ _4915;
    float _4937 = fma(_4819, _4927, _3077);
    int _4939 = _4905 ^ _4919;
    float _4941 = _4793 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4943 = _4911 ^ _4925;
    float _4945 = _4837 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4947 = float(_4933);
    float _4949 = fma(_4941, _2675, -0.5);
    bool _4951 = _3873 == 0;
    float _4953 = _4863 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _4955 = ~_4915;
    int _4957 = _4955 + _4935;
    int _4959 = _4957 + 1;
    float _4961 = -_3041;
    float _4963 = fma(_4941, _4947, _4961);
    int _4965 = ~_4919;
    int _4967 = _4965 + _4939;
    int _4969 = _4967 + 1;
    float _4971 = fma(_4945, _2759, -0.5);
    int _4973 = ~_4925;
    int _4975 = _4973 + _4943;
    int _4977 = _4975 + 1;
    float _4979 = fma(_3045, _4853, _4937);
    bool _4981 = !_4951;
    int _4983 = _4981 ? _4959 : (-1);
    float _4985 = fma(_3007, _4949, _4963);
    bool _4987 = !_4835;
    int _4989 = _4987 ? _4969 : (-1);
    float _4991 = _4979 + 0.5;
    bool _4993 = !_4893;
    int _4995 = _4993 ? _4977 : (-1);
    float _4997 = float(_4983);
    float _4999 = float(_4989);
    float _5001 = fma(_4953, _2773, -0.5);
    float _5003 = float(_4995);
    float _5005 = -_3073;
    float _5007 = fma(_4945, _4997, _5005);
    float _5009 = _4479 * (-2.0);
    float _5011 = -_3079;
    float _5013 = fma(_4953, _4999, _5011);
    float _5015 = _4885 + 0.5;
    float _5017 = -_3039;
    float _5019 = fma(_4921, _5003, _5017);
    float _5021 = fma(_3061, _4971, _5007);
    float _5023 = fma(_3043, _5001, _5013);
    float _5025 = _4877 + 0.5;
    float _5027 = fma(_3049, _4929, _5019);
    float _5029 = _4873 + 0.5;
    float _5031 = _4985 + 0.5;
    float _5033 = _5021 + 0.5;
    float _5035 = _5023 + 0.5;
    float _5037 = _5027 + 0.5;
    float _5039 = fma(_3697, _5009, _3697);
    float _5041 = fma(_5009, _4431, _4431);
    out.m_83.x = _5025;
    out.m_83.y = _5031;
    out.m_83.z = _5029;
    out.m_83.w = _5033;
    out.m_85.x = _4991;
    out.m_85.y = _5035;
    out.m_87.x = _5015;
    out.m_87.y = _5037;
    int _5043 = as_type<int>(_5029);
    if (_3627)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5045 = -_3729;
    float _5047 = fma(_5045, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3461);
    float _5049 = -_3733;
    float _5051 = fma(_5049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3445);
    float _5053 = -_3753;
    float _5055 = fma(_5053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3483);
    int _5057 = abs(_4619);
    float _5059 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5061 = _5047 + _5059;
    float _5063 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5065 = _5051 + _5063;
    float _5067 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5069 = _5055 + _5067;
    float _5071 = float(_3491);
    float _5073 = _5061 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5075 = float(_5057);
    float _5077 = _1427 + _1439;
    float _5079 = fma(_3679, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5041);
    float _5081 = fma(_5065, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5073);
    float _5083 = _1439 + (-0.5);
    float _5085 = _5075 * _5071;
    float _5087 = _5077 + (-1.0);
    float _5089 = fma(_5069, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5081);
    float _5091 = fma(_5039, _3083, _5079);
    float _5093 = _5085 * (-2.0);
    float _5095 = _4565 * 0.15915493667125701904296875;
    float _5097 = sqrt(_3819);
    bool _5099 = _5089 >= 0.0;
    float _5101 = fma(_5093, _4433, _4433);
    float _5103 = _5091 * 0.15915493667125701904296875;
    float _5105 = fma(_5083, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5101);
    float _5107 = fma(_5087, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5109 = _5095 * 6.283185482025146484375;
    float _5111 = sin(_5109);
    float _5113 = fma(_5107, _5093, _5107);
    float _5115 = _5085;
    float _5117 = _5051;
    float _5119 = _5069;
    if (_5099)
    {
        _5115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5121 = _5115;
    if (_5099)
    {
        out.m_51.x = 0.0;
    }
    float _5123 = fma(_5113, _3083, _5105);
    float _5125 = _5103 * 6.283185482025146484375;
    float _5127 = sin(_5125);
    if (_5099)
    {
        float _5129 = _5121 * 5.0;
        _5043 = as_type<int>(_5129);
    }
    int _5131 = _5043;
    float _5133 = _5123 * 0.15915493667125701904296875;
    if (_5099)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14185 = as_type<float>(_5131);
        out.gl_Position.z = _14185;
    }
    float _5135 = _5095 * 6.283185482025146484375;
    float _5137 = cos(_5135);
    float _5139 = _5103 * 6.283185482025146484375;
    float _5141 = cos(_5139);
    float _5143 = _5111 * _5127;
    float _5145 = _5133 * 6.283185482025146484375;
    float _5147 = sin(_5145);
    if (_5099)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5149 = -_3461;
    float _5151 = _5149 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5153 = -_3445;
    float _5155 = _5153 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5157 = in.m_89.x;
    float _5159 = in.m_89.y;
    float _5161 = in.m_89.z;
    float _5163 = -_3483;
    float _5165 = _5163 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5167 = _5151 * _5151;
    float _5169 = _5133 * 6.283185482025146484375;
    float _5171 = cos(_5169);
    float _5173 = _5137 * _5141;
    float _5175 = _592 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5177 = fma(_5155, _5155, _5167);
    float _5179 = fma(_5147, _5173, _5143);
    float _5181 = fma(_5147, _5143, _5173);
    float _5183 = fma(_5165, _5165, _5177);
    float _5185 = _3703 * _5097;
    float _5187 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5189 = _5137 * _5127;
    float _5191 = rsqrt(_5183);
    float _5193 = _5111 * _5141;
    float _5195 = _5137 * _5171;
    float _5197 = _5141 * _5171;
    float _5199 = _5111 * _5171;
    float _5201 = _5127 * _5171;
    float _5203 = _5185 * _5187;
    float _5205 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5157);
    float _5207 = _582 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5209 = _5185 * _5175;
    float _5211 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5159);
    float _5213 = _5205 * _5203;
    float _5215 = -_5189;
    float _5217 = fma(_5147, _5193, _5215);
    float _5219 = _5155 * _5191;
    float _5221 = -_5193;
    float _5223 = fma(_5147, _5189, _5221);
    float _5225 = _5185 * _5207;
    float _5227 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5161);
    float _5229 = _5165 * _5191;
    float _5231 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5233 = _5219 * _5231;
    float _5235 = _5211 * _5209;
    float _5237 = _5227 * _5225;
    float _5239 = in.m_91.x;
    float _5241 = in.m_91.y;
    float _5243 = in.m_91.z;
    float _5245 = _5151 * _5191;
    float _5247 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5249 = _5229 * _5247;
    float _5251 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5253 = -_5233;
    float _5255 = fma(_5229, _5251, _5253);
    bool _5257 = _5159 != 0.0;
    bool _5259 = isnan(_5159);
    bool _5261 = _5257 || _5259;
    bool _5263 = isnan(0.0);
    bool _5265 = _5261 || _5263;
    float _5267 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5269 = _5245 * _5267;
    float _5271 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5273 = -_5249;
    float _5275 = fma(_5245, _5271, _5273);
    float _5277 = _5255 * _5255;
    bool _5279 = _5157 == 0.0;
    bool _5281 = !_5265;
    bool _5283 = _5279 && _5281;
    float _5285 = in.m_93.x;
    float _5287 = in.m_93.y;
    float _5289 = in.m_93.z;
    float _5291 = in.m_93.w;
    float _5293 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5295 = -_5269;
    float _5297 = fma(_5219, _5293, _5295);
    float _5299 = fma(_5275, _5275, _5277);
    bool _5301 = _5161 == 0.0;
    bool _5303 = _5301 && _5283;
    float _5305 = -_5235;
    float _5307 = _5147 * _5305;
    float _5309 = _5195 * _5235;
    float _5311 = fma(_5297, _5297, _5299);
    float _5313 = _5199 * _5235;
    float _5315 = fma(_5197, _5213, _5307);
    float _5317 = fma(_5179, _5213, _5309);
    float _5319 = fma(_5217, _5213, _5313);
    float _5321 = rsqrt(_5311);
    float _5323 = fma(_5201, _5237, _5315);
    float _5325 = fma(_5223, _5237, _5317);
    float _5327 = fma(_5181, _5237, _5319);
    float _5329 = _5213;
    float _5331 = _5307;
    float _5333 = _5309;
    float _5335 = _5155;
    float _5337 = _5239;
    float _5339 = _5181;
    if (_5303)
    {
        _5329 = _5239;
    }
    float _5341 = _5329;
    float _5343 = _5341;
    if (_5303)
    {
        _5331 = _5243;
    }
    float _5345 = _5331;
    float _5347 = _5345;
    if (_5303)
    {
        _5333 = _5341;
    }
    float _5349 = _5333;
    float _5351 = _5349;
    if (!_5303)
    {
        _5343 = _5239;
    }
    float _5353 = _5343;
    if (_5303)
    {
        _5335 = _5241;
    }
    float _5355 = _5335;
    float _5357 = _5355;
    if (!_5303)
    {
        float _5359 = fma(_5159, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5241);
        _5357 = _5359;
    }
    float _5361 = _5357;
    if (_5303)
    {
        _5337 = _5345;
    }
    float _5363 = _5337;
    float _5365 = _5289 * _5353;
    float _5367 = _5363;
    if (!_5303)
    {
        _5347 = _5243;
    }
    float _5369 = _5347;
    float _5371 = _5275 * _5321;
    float _5373 = _5255 * _5321;
    if (!_5303)
    {
        float _5375 = fma(_5157, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5353);
        _5351 = _5375;
    }
    float _5377 = _5351;
    float _5379 = _5285 * _5241;
    float _5381 = -_5365;
    float _5383 = fma(_5285, _5369, _5381);
    float _5385 = _5287 * _5369;
    float _5387 = _5297 * _5321;
    float _5389 = _5229 * _5373;
    float _5391 = _5245 * _5371;
    if (!_5303)
    {
        float _5393 = fma(_5161, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5369);
        _5367 = _5393;
    }
    float _5395 = _5367;
    float _5397 = -_5385;
    float _5399 = fma(_5289, _5241, _5397);
    float _5401 = -_5379;
    float _5403 = fma(_5287, _5353, _5401);
    float _5405 = -_5389;
    float _5407 = fma(_5245, _5387, _5405);
    float _5409 = -_5391;
    float _5411 = fma(_5219, _5373, _5409);
    float _5413 = _5383 * _5291;
    float _5415 = _5399 * _5291;
    float _5417 = _5407 * _5325;
    float _5419 = _5411 * _5325;
    float _5421 = _5403 * _5291;
    float _5423 = _5219 * _5387;
    float _5425 = fma(_5371, _5323, _5417);
    float _5427 = fma(_5387, _5323, _5419);
    float _5429 = _5179 * _5407;
    float _5431 = -_5423;
    float _5433 = fma(_5229, _5371, _5431);
    float _5435 = fma(_5219, _5327, _5425);
    float _5437 = fma(_5229, _5327, _5427);
    float _5439 = _5179 * _5411;
    float _5441 = _5179 * _5433;
    float _5443 = _3445 + _5435;
    float _5445 = _3483 + _5437;
    float _5447 = _5433 * _5325;
    float _5449 = fma(_5197, _5373, _5441);
    float _5451 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5453 = _5443 + _5451;
    float _5455 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5457 = _5445 + _5455;
    float _5459 = _5195 * _5407;
    float _5461 = _5195 * _5433;
    float _5463 = _5453 * _5453;
    float _5465 = _5457 * _5457;
    float _5467 = _5195 * _5411;
    float _5469 = _5223 * _5407;
    float _5471 = _5223 * _5411;
    float _5473 = _5463 + _5465;
    float _5475 = _5223 * _5433;
    float _5477 = fma(_5201, _5371, _5469);
    float _5479 = -_5147;
    float _5481 = fma(_5479, _5373, _5461);
    float _5483 = sqrt(_5473);
    float _5485 = fma(_5201, _5373, _5475);
    float _5487 = fma(_5373, _5323, _5447);
    float _5489 = -_5147;
    float _5491 = fma(_5489, _5371, _5459);
    float _5493 = -_5147;
    float _5495 = fma(_5493, _5387, _5467);
    float _5497 = fma(_5197, _5371, _5429);
    float _5499 = fma(_5245, _5327, _5487);
    float _5501 = fma(_5197, _5387, _5439);
    float _5503 = fma(_5201, _5387, _5471);
    float _5505 = fma(_5199, _5219, _5491);
    float _5507 = fma(_5199, _5245, _5481);
    float _5509 = fma(_5199, _5229, _5495);
    float _5511 = _3461 + _5499;
    float _5513 = fma(_5217, _5219, _5497);
    float _5515 = fma(_5217, _5245, _5449);
    float _5517 = fma(_5217, _5229, _5501);
    bool _5519 = _5483 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5521 = fma(_5181, _5229, _5503);
    float _5523 = _5505 * _5287;
    float _5525 = _5507 * _5287;
    float _5527 = _5509 * _5287;
    float _5529 = _5507 * _5361;
    float _5531 = fma(_5181, _5219, _5477);
    float _5533 = fma(_5181, _5245, _5485);
    float _5535 = _5505 * _5361;
    float _5537 = _5413 * _5505;
    float _5539 = _5413 * _5507;
    float _5541 = _5413 * _5509;
    float _5543 = _5509 * _5361;
    float _5545 = _5449;
    float _5547 = _5505;
    float _5549 = _5477;
    float _5551 = _5413;
    float _5553 = _5421;
    if (!_5519)
    {
        _5545 = _5465;
    }
    float _5555 = _5545;
    float _5557 = _5555;
    if (!_5519)
    {
        _5547 = _5463;
    }
    float _5559 = _5547;
    float _5561 = _5559;
    if (!_5519)
    {
        _5339 = _5443;
    }
    float _5563 = _5339;
    float _5565 = _5563;
    if (!_5519)
    {
        _5549 = _5445;
    }
    float _5567 = _5549;
    float _5569 = _5567;
    if (!_5519)
    {
        _5551 = _5511;
    }
    float _5571 = _5551;
    bool _5573 = !_5519;
    float _5575 = _5571;
    if (!_5573)
    {
        float _5577 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5579 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5581 = _5483 + _5579;
        float _5583 = rsqrt(_5473);
        float _5585 = _5581 * _5577;
        float _5587 = _5511 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5589 = _5585 * 0.15915493667125701904296875;
        float _5591 = _5589 * 6.283185482025146484375;
        float _5593 = sin(_5591);
        float _5595 = _5589 * 6.283185482025146484375;
        float _5597 = cos(_5595);
        float _5599 = fma(_5593, _5587, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5601 = _5583 * _5599;
        float _5603 = _5597 + (-1.0);
        float _5605 = fma(_5453, _5601, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5607 = fma(_5457, _5601, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5609 = _5603 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5611 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5613 = _5605 + _5611;
        float _5615 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5617 = _5607 + _5615;
        float _5619 = fma(_5511, _5597, _5609);
        float _5621 = _5613 * _5613;
        float _5623 = _5617 * _5617;
        _5575 = _5619;
        _5561 = _5621;
        _5557 = _5623;
        _5565 = _5605;
        _5569 = _5607;
    }
    float _5625 = _5575;
    float _5627 = _5561;
    float _5629 = _5557;
    float _5631 = _5565;
    float _5633 = _5569;
    float _5635 = fma(_5513, _5285, _5523);
    float _5637 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5639 = _5625 + _5637;
    float _5641 = fma(_5513, _5377, _5535);
    float _5643 = fma(_5517, _5377, _5543);
    float _5645 = fma(_5515, _5285, _5525);
    float _5647 = fma(_5639, _5639, _5627);
    float _5649 = fma(_5515, _5377, _5529);
    float _5651 = fma(_5415, _5515, _5539);
    float _5653 = fma(_5517, _5285, _5527);
    float _5655 = _5647 + _5629;
    float _5657 = fma(_5415, _5513, _5537);
    float _5659 = fma(_5415, _5517, _5541);
    float _5661 = fma(_5531, _5289, _5635);
    float _5663 = fma(_5533, _5289, _5645);
    float _5665 = fma(_5533, _5395, _5649);
    float _5667 = sqrt(_5655);
    float _5669 = fma(_5521, _5289, _5653);
    float _5671 = fma(_5531, _5395, _5641);
    float _5673 = fma(_5421, _5531, _5657);
    float _5675 = fma(_5421, _5533, _5651);
    float _5677 = fma(_5421, _5521, _5659);
    float _5679 = fma(_5521, _5395, _5643);
    out.m_95.x = _5661;
    out.m_95.y = _5663;
    out.m_95.z = _5669;
    out.m_97.x = _5673;
    out.m_97.y = _5675;
    out.m_97.z = _5677;
    out.m_99.x = _5671;
    out.m_99.y = _5665;
    out.m_99.z = _5679;
    bool _5681 = _5667 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5683 = isnan(_5667);
    bool _5685 = _5681 || _5683;
    bool _5687 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5689 = _5685 || _5687;
    float _5691 = _5641;
    if (!_5689)
    {
        _5553 = 1.0;
    }
    float _5693 = _5553;
    bool _5695 = !_5689;
    float _5697 = _5693;
    if (!_5695)
    {
        bool _5699 = _5667 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5701 = isnan(_5667);
        bool _5703 = _5699 || _5701;
        bool _5705 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5707 = _5703 || _5705;
        if (!_5707)
        {
            float _5709 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5711 = _5667 + _5709;
            float _5713 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5715 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5713;
            float _5717 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5719 = _5717 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5721 = 1.0 / _5715;
            float _5723 = _5711 * _5721;
            float _5725 = fma(_5723, _5719, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5697 = _5725;
            _5727 = true;
        }
        else
        {
            bool _5729 = _5667 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5731 = isnan(_5667);
            bool _5733 = _5729 || _5731;
            bool _5735 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5737 = _5733 || _5735;
            if (!_5737)
            {
                float _5739 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5741 = _5667 + _5739;
                float _5743 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5745 = _5743 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5747 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5749 = _5747 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5751 = 1.0 / _5745;
                float _5753 = _5741 * _5751;
                float _5755 = fma(_5753, _5749, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5697 = _5755;
                _5727 = true;
            }
            else
            {
                _5697 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5727 = false;
    float _5757 = _5697;
    float _5759 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5761 = _5625 + _5759;
    float _5763 = _5047 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5765 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5767 = _5631 + _5765;
    float _5769 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5771 = _5633 + _5769;
    float _5773 = fma(_5761, _5757, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5775 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5763);
    float _5777 = fma(_5767, _5757, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5779 = fma(_5771, _5757, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5781 = -_3461;
    float _5783 = _5781 + _5773;
    float _5785 = fma(_5055, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5775);
    float _5787 = -_3445;
    float _5789 = _5787 + _5777;
    float _5791 = _5047 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5793 = _5783 * _5783;
    float _5795 = _5785 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5797 = -_3483;
    float _5799 = _5797 + _5779;
    float _5801 = fma(_5051, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5791);
    float _5803 = fma(_5789, _5789, _5793);
    float _5805 = 1.0 / _5795;
    float _5807 = fma(_5055, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5801);
    float _5809 = fma(_5799, _5799, _5803);
    float _5811 = _5807 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5813 = sqrt(_5809);
    float _5815 = _5811 + _5795;
    float _5817 = _5815 * _5805;
    float _5819 = _5817 * 0.5;
    float _5821 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5823 = fma(_5819, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5821);
    bool _5825 = _5813 > 0.0;
    float _5827 = 1.0 / _5823;
    bool _5829 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5831 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5833 = _5829 || _5831;
    bool _5835 = isnan(0.5);
    bool _5837 = _5833 || _5835;
    bool _5839 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5841 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5843 = _5839 || _5841;
    bool _5845 = isnan(0.5);
    bool _5847 = _5843 || _5845;
    float _5849 = _5819;
    float _5851 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5853 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5855 = _5777;
    if (!_5825)
    {
        _5849 = _5777;
    }
    float _5857 = _5849;
    float _5859 = _5857;
    float _5861 = _5857;
    if (!_5825)
    {
        _5851 = _5773;
    }
    float _5863 = _5851;
    float _5865 = _5863;
    if (!_5825)
    {
        _5853 = _5779;
    }
    float _5867 = _5853;
    bool _5869 = !_5825;
    float _5871 = _5867;
    float _5873 = _5827;
    if (!_5869)
    {
        float _5875 = _226 * _226;
        float _5877 = fma(_222, _222, _5875);
        float _5879 = fma(_228, _228, _5877);
        float _5881 = rsqrt(_5809);
        float _5883 = sqrt(_5879);
        float _5885 = _5789 * _5881;
        float _5887 = _5783 * _5881;
        float _5889 = _5799 * _5881;
        bool _5891 = _5883 > 0.0;
        float _5893 = _5883;
        float _5895 = _5881;
        if (!_5891)
        {
            _5859 = _5777;
        }
        float _5897 = _5859;
        _5861 = _5897;
        if (!_5891)
        {
            _5893 = _5773;
        }
        float _5899 = _5893;
        _5865 = _5899;
        if (!_5891)
        {
            _5895 = _5779;
        }
        float _5901 = _5895;
        bool _5903 = !_5891;
        _5871 = _5901;
        if (!_5903)
        {
            float _5905 = rsqrt(_5879);
            float _5907 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5909 = _226 * _5905;
            float _5911 = _222 * _5905;
            float _5913 = _228 * _5905;
            float _5915 = _5887 * _5909;
            float _5917 = fma(_5885, _5911, _5915);
            float _5919 = _5907 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5921 = fma(_5889, _5913, _5917);
            float _5923 = _5921 * _5919;
            float _5925 = fma(_222, _5923, _5777);
            float _5927 = fma(_226, _5923, _5773);
            float _5929 = fma(_228, _5923, _5779);
            _5861 = _5925;
            _5865 = _5927;
            _5871 = _5929;
        }
    }
    float _5931 = _5861;
    float _5933 = _5865;
    float _5935 = _5871;
    float _5937 = -_3733;
    float _5939 = fma(_5937, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5931);
    float _5941 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5943 = _5827 * _5941;
    float _5945 = -_3729;
    float _5947 = fma(_5945, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5933);
    float _5949 = -_3753;
    float _5951 = fma(_5949, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5935);
    float _5953 = _5947;
    float _5955 = _5951;
    if (_5837)
    {
        _5855 = 1.0;
    }
    float _5957 = _5855;
    float _5959 = _5957;
    if (_5847)
    {
        _5873 = _5939;
    }
    float _5961 = _5873;
    float _5963 = _5961;
    if (!_5847)
    {
        float _5965 = _5061 * _5061;
        float _5967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5969 = -_3483;
        float _5971 = _5969 + _5935;
        float _5973 = -_3445;
        float _5975 = _5973 + _5931;
        float _5977 = fma(_5065, _5065, _5965);
        float _5979 = fma(_5069, _5069, _5977);
        float _5981 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5983 = sqrt(_5979);
        float _5985 = 1.0 / _5185;
        float _5987 = _5981 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5989 = precise::min(_5983, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5991 = _5989 * _5967;
        float _5993 = -_3461;
        float _5995 = _5993 + _5933;
        float _5997 = _5991 * _5985;
        float _5999 = _5987 * _5997;
        float _6001 = _5971 * _5997;
        float _6003 = fma(_5995, _5999, _5047);
        float _6005 = fma(_5975, _5999, _5051);
        float _6007 = fma(_5987, _6001, _5055);
        _5953 = _6003;
        _5963 = _6005;
        _5955 = _6007;
    }
    float _6009 = _5953;
    float _6011 = _5963;
    float _6013 = _5955;
    if (!_5837)
    {
        float _6015 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6017 = _6015 * 0.15915493667125701904296875;
        float _6019 = _6017 * 6.283185482025146484375;
        float _6021 = cos(_6019);
        float _6023 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6025 = _6023 * 0.15915493667125701904296875;
        float _6027 = _6017 * 6.283185482025146484375;
        float _6029 = sin(_6027);
        float _6031 = 1.0 / _6021;
        float _6033 = _6025 * 6.283185482025146484375;
        float _6035 = cos(_6033);
        float _6037 = _6029 * _6031;
        float _6039 = _6025 * 6.283185482025146484375;
        float _6041 = sin(_6039);
        float _6043 = _6035 * _6037;
        float _6045 = 1.0 / _6043;
        float _6047 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6049 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6047;
        float _6051 = 1.0 / _6049;
        float _6053 = _6041 * _6045;
        float _6055 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6057 = fma(_5943, _6053, _6055);
        float _6059 = _6057 * _6051;
        float _6061 = precise::clamp(_6059, 0.0, 1.0);
        _5959 = _6061;
    }
    float _6063 = _5959;
    float _6065 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6067 = _6009 + _6065;
    float _6069 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6071 = _6011 + _6069;
    float _6073 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6075 = _6013 + _6073;
    float _6077 = _6067 * _6067;
    float _6079 = fma(_6071, _6071, _6077);
    float _6081 = fma(_5051, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6083 = fma(_6075, _6075, _6079);
    float _6085 = rsqrt(_6083);
    float _6087 = sqrt(_6083);
    float _6089 = _6085 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6091 = _6071 * _6089;
    float _6093 = _6075 * _6089;
    float _6095 = _6091 * _6091;
    float _6097 = _6093 * _6093;
    float _6099 = _6095 + _6097;
    float _6101 = sqrt(_6099);
    bool _6103 = _6101 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6105 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6107 = _6101 + _6105;
    float _6109 = _6085;
    float _6111 = _6099;
    float _6113 = _6107;
    float _6115 = _6067;
    if (_6103)
    {
        float _6117 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6109 = _6117;
    }
    float _6119 = _6109;
    if (!_6103)
    {
        _5117 = _6095;
    }
    float _6121 = _5117;
    float _6123 = _6121;
    if (_6103)
    {
        float _6125 = rsqrt(_6099);
        _6111 = _6125;
    }
    float _6127 = _6111;
    float _6129 = _6127;
    if (_6103)
    {
        float _6131 = _6107 * _6119;
        _6113 = _6131;
    }
    float _6133 = _6113;
    float _6135 = floor(_6081);
    if (_6103)
    {
        float _6137 = _6133 * 0.15915493667125701904296875;
        _5119 = _6137;
    }
    float _6139 = _5119;
    float _6141 = _6075;
    if (_6103)
    {
        float _6143 = _6139 * 6.283185482025146484375;
        float _6145 = sin(_6143);
        _6141 = _6145;
    }
    float _6147 = _6141;
    float _6149 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6151 = precise::max(0.0, _6149);
    float _6153 = _6119;
    float _6155 = _6151;
    if (_6103)
    {
        float _6157 = _6139 * 6.283185482025146484375;
        float _6159 = cos(_6157);
        _6153 = _6159;
    }
    float _6161 = _6153;
    float _6163 = -_6135;
    float _6165 = _6081 + _6163;
    float _6167 = -_6089;
    float _6169 = -_6151;
    float _6171 = fma(_6067, _6167, _6169);
    if (_6103)
    {
        float _6173 = _6171 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6115 = _6173;
    }
    float _6175 = _6115;
    float _6177 = _6175;
    float _6179 = _6147;
    if (_6103)
    {
        float _6181 = fma(_6147, _6175, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6177 = _6181;
    }
    float _6183 = _6177;
    float _6185 = _6183;
    if (!_6103)
    {
        _6179 = _6091;
    }
    float _6187 = _6179;
    float _6189 = _6187;
    if (_6103)
    {
        float _6191 = _6127 * _6183;
        _5691 = _6191;
    }
    float _6193 = _5691;
    float _6195 = _6161;
    if (_6103)
    {
        float _6197 = _6161 + (-1.0);
        _6155 = _6197;
    }
    float _6199 = _6155;
    float _6201 = _6199;
    if (!_6103)
    {
        _6185 = _6171;
    }
    float _6203 = _6185;
    float _6205 = _6203;
    if (_6103)
    {
        float _6207 = _6091 * _6193;
        _6189 = _6207;
    }
    float _6209 = _6189;
    if (_6103)
    {
        float _6211 = _6199 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6129 = _6211;
    }
    float _6213 = _6129;
    if (!_6103)
    {
        _6201 = _6093;
    }
    float _6215 = _6201;
    float _6217 = _6215;
    if (_6103)
    {
        float _6219 = _6093 * _6193;
        _6217 = _6219;
    }
    float _6221 = _6217;
    if (_6103)
    {
        float _6223 = _6209 * _6209;
        _6123 = _6223;
    }
    float _6225 = _6123;
    if (_6103)
    {
        float _6227 = fma(_6171, _6161, _6213);
        _6205 = _6227;
    }
    float _6229 = _6205;
    if (!_6103)
    {
        _6195 = _6097;
    }
    float _6231 = _6195;
    float _6233 = _6231;
    if (_6103)
    {
        float _6235 = _6221 * _6221;
        _6233 = _6235;
    }
    float _6237 = _6233;
    float _6239 = fma(_6229, _6229, _6225);
    float _6241 = _6009 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6243 = _6239 + _6237;
    float _6245 = fma(_6011, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6241);
    float _6247 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6249 = fma(_6087, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6247);
    float _6251 = precise::clamp(_6249, 0.0, 1.0);
    float _6253 = rsqrt(_6243);
    float _6255 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6245);
    float _6257 = -_6251;
    float _6259 = _6257 + 1.0;
    float _6261 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6263 = fma(_5055, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6265 = _6255 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6267 = _6009 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6269 = abs(_6259);
    float _6271 = log2(_6269);
    float _6273 = _6265 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6275 = _6009 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6277 = -_6273;
    float _6279 = fma(_6277, _6261, 1.0);
    float _6281 = _6009 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6283 = fma(_6011, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6275);
    float _6285 = _6253 * _6209;
    float _6287 = _6253 * _6229;
    float _6289 = fma(_6011, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6281);
    float _6291 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6283);
    float _6293 = _6285 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6295 = _6253 * _6221;
    float _6297 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6289);
    float _6299 = _6291 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6301 = -_6293;
    float _6303 = fma(_6287, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6301);
    float _6305 = fma(_6011, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6267);
    float _6307 = _6297 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6309 = _6299 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6311 = floor(_6263);
    float _6313 = -_6295;
    float _6315 = fma(_6313, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6303);
    float _6317 = fma(_6013, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6305);
    float _6319 = fma(_6307, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6309);
    float _6321 = _6271 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6323 = fma(_6315, -0.5, 0.5);
    float _6325 = _6317 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6327 = fma(_6265, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6319);
    float _6329 = exp2(_6321);
    float _6331 = _6299 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6333 = fma(_6315, 0.5, 0.5);
    float _6335 = fma(_6325, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6327);
    float _6337 = _6299 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6339 = fma(_6307, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6331);
    float _6341 = sqrt(_6323);
    float _6343 = -_6311;
    float _6345 = _6263 + _6343;
    float _6347 = fma(_6333, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6349 = fma(_6307, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6337);
    float _6351 = fma(_6265, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6339);
    float _6353 = _6287 + 1.0;
    float _6355 = fma(_6333, _6347, -0.212114393711090087890625);
    float _6357 = fma(_6265, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6349);
    float _6359 = log2(_6279);
    float _6361 = fma(_6325, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6351);
    float _6363 = fma(_6333, _6355, 1.570728778839111328125);
    float _6365 = fma(_6325, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6357);
    float _6367 = -_6287;
    float _6369 = fma(_6329, _6353, _6367);
    float _6371 = 1.0 / _6335;
    float _6373 = _6341 * 0.636619746685028076171875;
    float _6375 = fma(_6369, 0.5, 0.5);
    float _6377 = -_6363;
    float _6379 = fma(_6373, _6377, 1.0);
    float2 _16205 = float2(_6165, _6345);
    float _6381 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16205, float2(0.0), isnan(_16205)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16205, float2(0.0), isnan(_16205)), level(0.0)).x;
    float _6383 = _6359 * 0.693147182464599609375;
    float _6385 = _6361 * _6371;
    float _6387 = _6365 * _6371;
    float _6389 = _6383 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6391 = fma(_6385, 0.5, 0.5);
    float _6393 = fma(_6387, -0.5, 0.5);
    float3 _16233 = float3(_6391, _6393, _6389);
    float _6395 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16233, float3(0.0), isnan(_16233)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16233, float3(0.0), isnan(_16233)), level(0.0)).x;
    float3 _16244 = float3(_6391, _6393, _6389);
    float4 _6398 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16244, float3(0.0), isnan(_16244)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16244, float3(0.0), isnan(_16244)), level(0.0)).xyzw;
    float _6400 = _6398.x;
    float _6402 = _6398.y;
    float _6404 = _6398.z;
    float _6406 = _6398.w;
    float2 _16260 = float2(_6379, _6375);
    float3 _6410 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16260, float2(0.0), isnan(_16260)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16260, float2(0.0), isnan(_16260)), level(0.0)).xyz;
    float _6412 = _6410.x;
    float _6414 = _6410.y;
    float _6416 = _6410.z;
    float _6418 = abs(_5943);
    float _6420 = log2(_6418);
    float _6422 = _6271 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6424 = _6335 * 0.5;
    float _6426 = _6299 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _6428 = _6087 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6430 = isnan(_6087);
    bool _6432 = _6428 || _6430;
    bool _6434 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6436 = _6432 || _6434;
    float _6438 = exp2(_6422);
    bool _6440 = _5943 <= 8000.0;
    bool _6442 = isnan(_5943);
    bool _6444 = _6440 || _6442;
    bool _6446 = isnan(8000.0);
    bool _6448 = _6444 || _6446;
    float _6450 = float(_6448);
    float _6452 = fma(_6307, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6426);
    float _6454 = in.m_101.x;
    float _6456 = fma(_6265, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6452);
    float _6458 = _6420 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6460 = fma(_6325, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6456);
    float _6462 = _6361 + _6335;
    float _6464 = exp2(_6458);
    float _6466 = _6462 * 0.5;
    float _6468 = -_6438;
    float _6470 = _6468 + 1.0;
    out.gl_Position.x = _6361;
    out.gl_Position.y = _6365;
    out.gl_Position.z = _6460;
    out.gl_Position.w = _6335;
    float _6472 = _6462;
    float _6474 = _6365;
    float _6476 = _6361;
    float _6478 = _6335;
    float _6480 = _6460;
    float _6482 = _6466;
    if (!_6436)
    {
        _6472 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6484 = _6472;
    float _6486 = _6470 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6488 = fma(_6464, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6490 = precise::clamp(_6488, 0.0, 1.0);
    float _6492 = fma(_6365, -0.5, _6424);
    float _6494 = fma(_6490, -2.0, 3.0);
    float _6496 = _6490 * _6490;
    float _6498 = _6484;
    float _6500 = _6484;
    if (!_6436)
    {
        _6474 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6502 = _6474;
    float _6504 = _6502;
    float _6506 = _6502;
    if (!_6436)
    {
        _6476 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6508 = _6476;
    float _6510 = _6496 * _6494;
    float _6512 = -_6510;
    float _6514 = _6512 + 1.0;
    float _6516 = fma(_6514, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6510);
    float _6518 = _6460 + _6335;
    float _6520 = _6450 * _6516;
    float _6522 = _6518 * 0.5;
    float _6524 = _6508;
    float _6526 = _6508;
    if (!_6436)
    {
        _6478 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6528 = _6478;
    float _6530 = _6520 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6532 = _6528;
    float _6534 = _6528;
    if (!_6436)
    {
        _6480 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6536 = _6480;
    out.m_103.x = _6466;
    out.m_103.y = _6492;
    out.m_103.z = _6522;
    out.m_103.w = _6335;
    float _6538 = _6063 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6540 = _6536;
    float _6542 = _6536;
    if (!_6436)
    {
        _6482 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6544 = _6482;
    float _6546 = -_6381;
    float _6548 = _6546 + 1.0;
    float _6550 = _6548 * _6530;
    float _6552 = precise::clamp(_6550, 0.0, 1.0);
    float _6554 = -_6552;
    float _6556 = fma(_6554, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6558 = _6556 * _6454;
    float _6560 = _6558 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6562 = _6486 * _6395;
    float _6564 = -_6486;
    float _6566 = _6564 + 1.0;
    out.m_105.x = _6560;
    float _6568 = _6406 * _6562;
    float _6570 = _6416 * _6562;
    float _6572 = _6406 * _6566;
    float _6574 = fma(_6412, _6568, _6400);
    float _6576 = fma(_6414, _6568, _6402);
    float _6578 = fma(_6406, _6570, _6404);
    out.m_107.x = _6574;
    out.m_107.y = _6576;
    out.m_107.z = _6578;
    out.m_107.w = _6572;
    bool _6580 = !_6436;
    float _6582 = _6544;
    float _6584 = _6544;
    if (!_6580)
    {
        bool _6586 = _6087 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6588 = isnan(_6087);
        bool _6590 = _6586 || _6588;
        bool _6592 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6594 = _6590 || _6592;
        if (!_6594)
        {
            float _6596 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6598 = _6087 + _6596;
            float _6600 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6602 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6600;
            float _6604 = 1.0 / _6602;
            float _6606 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6608 = _6606 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6610 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6612 = _6610 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6614 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6616 = _6614 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6618 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6620 = _6618 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6622 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6624 = _6622 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6626 = _6598 * _6604;
            float _6628 = precise::clamp(_6626, 0.0, 1.0);
            float _6630 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6632 = _6630 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6634 = fma(_6628, _6612, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6636 = fma(_6628, _6632, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6638 = fma(_6628, _6608, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6640 = fma(_6628, _6616, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6642 = fma(_6628, _6620, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6644 = fma(_6628, _6624, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6526 = _6638;
            _6534 = _6642;
            _6506 = _6636;
            _6584 = _6640;
            _6500 = _6634;
            _6542 = _6644;
            _6646 = true;
        }
        else
        {
            bool _6648 = _6087 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6650 = isnan(_6087);
            bool _6652 = _6648 || _6650;
            bool _6654 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6656 = _6652 || _6654;
            if (!_6656)
            {
                _6582 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6658 = _6582;
            _6584 = _6658;
            if (!_6656)
            {
                _6532 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6660 = _6532;
            _6534 = _6660;
            if (!_6656)
            {
                _6540 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6662 = _6540;
            _6542 = _6662;
            if (!_6656)
            {
                _6504 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6664 = _6504;
            _6506 = _6664;
            if (!_6656)
            {
                _6524 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6666 = _6524;
            _6526 = _6666;
            if (!_6656)
            {
                _6498 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6668 = _6498;
            bool _6670 = !_6656;
            _6500 = _6668;
            if (!_6670)
            {
                bool _6672 = _6087 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6674 = isnan(_6087);
                bool _6676 = _6672 || _6674;
                bool _6678 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6680 = _6676 || _6678;
                if (!_6680)
                {
                    float _6682 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6684 = _6087 + _6682;
                    float _6686 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6688 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6686;
                    float _6690 = 1.0 / _6688;
                    float _6692 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6694 = _6692 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6696 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6698 = _6696 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6700 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6702 = _6700 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6704 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6706 = _6704 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6708 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6710 = _6708 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6712 = _6684 * _6690;
                    float _6714 = precise::clamp(_6712, 0.0, 1.0);
                    float _6716 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6718 = _6716 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6720 = fma(_6714, _6698, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6722 = fma(_6714, _6718, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6724 = fma(_6714, _6694, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6726 = fma(_6714, _6702, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6728 = fma(_6714, _6706, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6730 = fma(_6714, _6710, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6526 = _6724;
                    _6534 = _6728;
                    _6506 = _6722;
                    _6584 = _6726;
                    _6500 = _6720;
                    _6542 = _6730;
                    _6646 = true;
                }
                else
                {
                    _6526 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6534 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6506 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6584 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6500 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6542 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6646 = false;
    float _6732 = _6526;
    float _6734 = _6534;
    float _6736 = _6506;
    float _6738 = _6584;
    float _6740 = _6500;
    float _6742 = _6542;
    float _6744 = _6538 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6746 = fma(_5665, -0.5, 0.5);
    float _6748 = precise::clamp(_6746, 0.0, 1.0);
    float _6750 = -_6732;
    float _6752 = _6734 + _6750;
    float _6754 = -_6736;
    float _6756 = _6738 + _6754;
    out.m_51.x = _6744;
    float _6758 = fma(_6748, _6752, _6732);
    float _6760 = -_6740;
    float _6762 = _6742 + _6760;
    float _6764 = fma(_6748, _6756, _6736);
    float _6766 = _6758 * 0.586610972881317138671875;
    bool _6768 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6770 = fma(_6748, _6762, _6740);
    out.m_109.x = 0.0;
    float _6772 = fma(_6764, 0.298911988735198974609375, _6766);
    bool _6774 = _6063 > 0.0;
    bool _6776 = isnan(_6063);
    bool _6778 = _6774 || _6776;
    bool _6780 = isnan(0.0);
    bool _6782 = _6778 || _6780;
    float _6784 = fma(_6770, 0.114477999508380889892578125, _6772);
    float _6786 = -_6784;
    float _6788 = _6764 + _6786;
    float _6790 = -_6784;
    float _6792 = _6758 + _6790;
    float _6794 = -_6784;
    float _6796 = _6770 + _6794;
    float _6798 = fma(_6788, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6784);
    float _6800 = fma(_6792, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6784);
    float _6802 = fma(_6796, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6784);
    bool _6804 = !_6768;
    if (!_6804)
    {
        float _6806 = -_6009;
        float _6808 = _6806 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6810 = -_6011;
        float _6812 = _6810 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6814 = -_6013;
        float _6816 = _6814 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6818 = _6808 * _6808;
        float _6820 = fma(_6812, _6812, _6818);
        float _6822 = fma(_6816, _6816, _6820);
        float _6824 = sqrt(_6822);
        float _6826 = rsqrt(_6822);
        float _6828 = -_6824;
        float _6830 = _6828 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6832 = _6830 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6834 = precise::clamp(_6832, 0.0, 1.0);
        float _6836 = _6812 * _6826;
        float _6838 = _6808 * _6826;
        float _6840 = abs(_6834);
        float _6842 = log2(_6840);
        float _6844 = _6816 * _6826;
        float _6846 = _6836 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6848 = _5665 * _6838;
        float _6850 = -_6838;
        float _6852 = -_6846;
        float _6854 = fma(_6850, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6852);
        float _6856 = fma(_5671, _6836, _6848);
        float _6858 = -_6844;
        float _6860 = fma(_6858, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6854);
        float _6862 = fma(_5679, _6844, _6856);
        float _6864 = precise::clamp(_6862, 0.0, 1.0);
        float _6866 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6868 = _6860 + _6866;
        float _6870 = _6842 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6872 = _6868 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6874 = precise::clamp(_6872, 0.0, 1.0);
        float _6876 = exp2(_6870);
        float _6878 = _6876 * _6874;
        float _6880 = _6864 * _6878;
        float _6882 = _6880 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6884 = _6880 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6886 = _6880 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _6882;
        out.m_109.y = _6884;
        out.m_109.z = _6886;
    }
    out.m_111.x = _6798;
    out.m_111.y = _6800;
    out.m_111.z = _6802;
    if (_6782)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _6888 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6888;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

