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
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_28Smplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_95 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_105 [[user(locn4)]];
    float4 m_101 [[user(locn5)]];
    float4 m_103 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_99 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_93 [[user(locn13)]];
    float4 m_81 [[user(locn14)]];
    float4 m_79 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_75 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_61 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_83 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_91 [[attribute(8)]];
    float4 m_89 [[attribute(9)]];
    float4 m_67 [[attribute(10)]];
    float4 m_69 [[attribute(11)]];
    float4 m_55 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3692 = false;
    bool _732 = false;
    bool _628 = false;
    bool _486 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_48.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    float _134 = _132;
    if (!_128)
    {
        out.m_51.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _132 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3997 = as_type<float>(_140);
        out.gl_Position.z = _3997;
    }
    if (!_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_53.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = 0.0;
    float _162 = _158;
    if (_154)
    {
        float _164 = float(_124);
        _160 = _164;
    }
    float _166 = _160;
    bool _168 = _158 >= _166;
    bool _170 = !_154;
    bool _172 = _168 || _170;
    if (_172)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _134;
    if (_172)
    {
        out.m_51.x = 0.0;
    }
    if (_172)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4066 = as_type<float>(_178);
        out.gl_Position.z = _4066;
    }
    if (_172)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _180 = in.m_55.x;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = in.m_55.y;
    float _186 = in.m_57.x;
    float _188 = in.m_57.y;
    float _190 = in.m_57.z;
    float _192 = in.m_59.x;
    float _194 = in.m_59.y;
    float _196 = in.m_59.z;
    float _198 = in.m_61.x;
    float _200 = in.m_61.y;
    float _202 = in.m_61.z;
    float _204 = in.m_63.x;
    float _206 = in.m_63.y;
    float _208 = in.m_63.z;
    out.m_65.x = _180;
    out.m_65.y = _184;
    float _210 = _188 * _194;
    float _212 = _188 * _200;
    float _214 = fma(_186, _192, _210);
    float _216 = _188 * _206;
    float _218 = fma(_186, _198, _212);
    float _220 = fma(_190, _196, _214);
    float _222 = fma(_186, _204, _216);
    float _224 = fma(_190, _202, _218);
    float _226 = fma(_190, _208, _222);
    bool _228 = !_182;
    float _230 = _184;
    float _232 = _180;
    float _250;
    if (!_228)
    {
        float _234 = in.m_67.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_124);
        float _256 = 1.0 / _254;
        float _258 = _158 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _260 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = _260 + _282;
    float _286 = 1.0 / _276;
    bool _288 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _290 = isnan(_260);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    bool _300 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _302 = isnan(_260);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = 1.0 / _272;
    bool _314 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _316 = isnan(_260);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _328 = -_324;
    float _330 = _328 + 1.0;
    float _332 = 1.0 / _280;
    float _334 = _268 * _286;
    float _336 = _264 * _312;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _346;
    float _350 = fma(_340, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _352 = _298 * _330;
    float _354 = fma(_348, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = _284 * _332;
    bool _358 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _360 = isnan(_260);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = fma(_344, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _372 = -_298;
    float _374 = _372 + 1.0;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _388 = -_368;
    float _390 = _388 + 1.0;
    float _392 = _368 * _374;
    float _394 = fma(_378, _334, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _396 = fma(_382, _334, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _398 = fma(_386, _334, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _400 = _310 * _390;
    float _402 = in.m_69.x;
    float _404 = in.m_69.y;
    float _406 = in.m_69.z;
    float _408 = -_310;
    float _410 = _408 + 1.0;
    float _412 = _370 * _400;
    float _414 = _354 * _400;
    float _416 = _350 * _400;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    float _426 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[143].x, _412);
    float _428 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[143].y, _414);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _430;
    float _434 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[143].z, _416);
    float _436 = fma(_420, _356, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _438 = fma(_424, _356, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _440 = fma(_394, _392, _426);
    float _442 = fma(_396, _392, _428);
    float _444 = fma(_432, _356, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _446 = fma(_398, _392, _434);
    float _448 = fma(_436, _352, _440);
    float _450 = fma(_438, _352, _442);
    float _452 = fma(_444, _352, _446);
    float _454 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].x, _448);
    float _456 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].y, _450);
    float _458 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].z, _452);
    float _460 = _454 * _402;
    float _462 = _456 * _404;
    float _464 = _458 * _406;
    bool _466 = !_326;
    float _484;
    if (!_466)
    {
        float _468 = in.m_67.x;
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _472 = _468 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[11].y, _158);
        float _476 = _474 * _470;
        float _478 = floor(_476);
        float _480 = -_478;
        float _482 = _476 + _480;
        _484 = _482;
        _486 = true;
    }
    else
    {
        float _488 = float(_124);
        float _490 = 1.0 / _488;
        float _492 = _158 * _490;
        _484 = _492;
    }
    _486 = false;
    float _494 = _484;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _498 = _494 + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _504 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _506 = isnan(_494);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _520 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _522 = isnan(_494);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _532;
    bool _536 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _538 = isnan(_494);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = 1.0 / _502;
    float _550 = -_514;
    float _552 = _550 + 1.0;
    bool _554 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _556 = _530 * _552;
    float _558 = -_530;
    float _560 = _558 + 1.0;
    float _562 = 1.0 / _518;
    float _564 = _534 * _548;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _570 = fma(_564, _498, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _572 = _568 * _562;
    float _574 = _570 * _556;
    float _576 = -_546;
    float _578 = _576 + 1.0;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _582 = _494 + _580;
    float _584 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[115].x, _574);
    float _586 = _514 * _578;
    float _588 = fma(_572, _582, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _592 = fma(_588, _586, _584);
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _598 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[117].x, _592);
    float _600 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _598 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_71.x = _600;
    out.m_71.y = _602;
    out.m_71.z = _604;
    out.m_71.w = _606;
    bool _608 = !_554;
    float _626;
    if (!_608)
    {
        float _610 = in.m_67.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].w, _158);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_124);
        float _632 = 1.0 / _630;
        float _634 = _158 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    bool _638 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _640 = isnan(_636);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _654 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _656 = isnan(_636);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _672 = _636 + _670;
    float _674 = -_648;
    float _676 = _674 + 1.0;
    float _678 = 1.0 / _652;
    float _680 = _664 * _676;
    float _682 = -_664;
    float _684 = _682 + 1.0;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _688 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _692 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _668 * _678;
    float _698 = fma(_696, _672, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _700 = _698 * _680;
    float _702 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[131].x, _700);
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _706 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[132].x, _702);
    float _708 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _706 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_73.x = _692;
    out.m_73.y = _708;
    out.m_73.z = _694;
    out.m_73.w = _710;
    bool _712 = !_688;
    float _730;
    if (!_712)
    {
        float _714 = in.m_67.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[14].x, _158);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        float _734 = float(_124);
        float _736 = 1.0 / _734;
        float _738 = _158 * _736;
        _730 = _738;
    }
    _732 = false;
    float _740 = _730;
    float _742 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _744 = int(_742);
    float _746 = in.m_59.w;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _750 = _740 + _748;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _754 = _752 != 0;
    float _756 = in.m_61.w;
    float _758 = float(_124);
    float _760 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _762 = int(_760);
    bool _764 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _766 = isnan(_740);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = float(_744);
    float _778 = 1.0 / _758;
    float _780 = float(uint(_762));
    float _782 = 1.0 / _776;
    int _784 = ~_762;
    int _786 = _784 + 1;
    bool _788 = _762 == 0;
    float _790 = 1.0 / _780;
    float _792 = _782 * _158;
    float _794 = trunc(_792);
    int _796 = int(_794);
    int _798 = as_type<int>(_790) + (-2);
    float _800 = float(uint(_796));
    float _802 = as_type<float>(_798) * _800;
    int _804 = ~_762;
    int _806 = _804 + 1;
    float _808 = trunc(_802);
    float _810 = precise::max(_808, 0.0);
    uint _813 = uint(_810);
    int _815 = _806 * int(_813);
    int _817 = _815 + _796;
    float _819 = float(uint(_817));
    float _821 = as_type<float>(_798) * _819;
    float _823 = in.m_67.x;
    float _825 = trunc(_821);
    float _827 = precise::max(_825, 0.0);
    uint _829 = uint(_827);
    bool _831 = !_754;
    float _833 = _831 ? 7.345489978790283203125 : 1.0;
    int _835 = int(_813) + int(_829);
    float _837 = float(_762);
    float _839 = float(_796);
    float _841 = _833 * _823;
    bool _843 = _839 >= _837;
    bool _845 = isnan(_839);
    bool _847 = _843 || _845;
    bool _849 = isnan(_837);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    int _855 = _786 * _835;
    int _857 = _855 + _796;
    bool _859 = uint(_857) >= uint(_762);
    float _861 = trunc(_853);
    int _863 = int(_861);
    bool _865 = !_859;
    int _867 = _865 ? 0 : (-1);
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _871 = _869 != 0;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _879 = _877 != 0;
    int _881 = ~_835;
    int _883 = _881 + _867;
    int _885 = _883 + 1;
    float _887 = floor(_841);
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _891 = _889 != 0;
    int _893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _895 = _893 != 0;
    int _897 = _762 * _885;
    int _899 = _897 + _796;
    int _901 = ~_863;
    int _903 = _901 + 1;
    int _905 = _903 + 1;
    bool _907 = !_788;
    int _909 = _907 ? _899 : (-1);
    int _911 = _909 * _905;
    float _913 = -_887;
    float _915 = _841 + _913;
    int _917 = _762 + (-1);
    float _919 = _915 * _837;
    float _921 = _837 * _158;
    bool _923 = !_875;
    int _925 = _923 ? 0 : 1;
    int _927 = _863 * _917;
    int _929 = _927 + _911;
    float _931 = trunc(_919);
    int _933 = int(_931);
    float _935 = _921 * _778;
    bool _937 = !_891;
    int _939 = _937 ? 0 : 1;
    bool _941 = !_871;
    int _943 = _941 ? 0 : 1;
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _947 = _945 != 0;
    float _949 = trunc(_935);
    int _951 = int(_949);
    int _953 = abs(_925);
    bool _955 = !_879;
    int _957 = _955 ? 0 : 1;
    int _959 = abs(_939);
    int _961 = abs(_943);
    int _963 = abs(_957);
    int _965 = _929 * _953;
    bool _967 = !_947;
    int _969 = _967 ? 0 : 1;
    int _971 = _933 * _959;
    int _973 = _971 + _796;
    int _975 = _929;
    bool _977 = _947;
    float _979 = as_type<float>(_959);
    if (_895)
    {
        float _981 = -_180;
        float _983 = _981 + 1.0;
        _975 = as_type<int>(_983);
    }
    int _985 = _975;
    int _987 = abs(_969);
    int _989 = _951 * _961;
    int _991 = _989 + _965;
    float _993 = in.m_75.y;
    int _995 = ~_762;
    int _997 = _995 + 1;
    int _999 = _973 * _963;
    int _1001 = _999 + _991;
    if (_895)
    {
        bool _1003 = _823 > 0.5;
        _977 = _1003;
    }
    bool _1005 = _977;
    if (!_895)
    {
        _979 = _180;
    }
    float _1007 = _979;
    int _1009 = _933 * _987;
    int _1011 = _1009 + _1001;
    float _1013 = _1007;
    if (_895)
    {
        float _1015 = _1005 ? as_type<float>(_985) : _180;
        _1013 = _1015;
    }
    float _1017 = _1013;
    float _1019 = in.m_67.y;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1023 = _1021 != 0;
    float _1025 = float(uint(_1011));
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1029 = _1027 != 0;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1033 = _1031 != 0;
    float _1035 = as_type<float>(_798) * _1025;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1039 = _1037 != 0;
    float _1041 = in.m_48.x;
    float _1043 = in.m_48.y;
    float _1045 = in.m_48.z;
    float _1047 = trunc(_1035);
    float _1049 = precise::max(_1047, 0.0);
    uint _1051 = uint(_1049);
    float _1053 = 0.0;
    if (!_1033)
    {
        _1053 = _180;
    }
    float _1055 = _1053;
    float _1057 = 0.0;
    float _1059 = _1055;
    if (_754)
    {
        _1057 = _1019;
    }
    float _1061 = _1057;
    float _1063 = _1061;
    if (!_754)
    {
        _1063 = _823;
    }
    float _1065 = _1063;
    int _1067 = _997 * int(_1051);
    int _1069 = _1067 + _1011;
    float _1071 = _194 * _1043;
    float _1073 = float(uint(_1069));
    float _1075 = _200 * _1043;
    float _1077 = _206 * _1043;
    float _1079 = _1043 + _993;
    float _1081 = float(uint(_973));
    float _1083 = as_type<float>(_798) * _1073;
    float _1085 = fma(_192, _1041, _1071);
    float _1087 = fma(_204, _1041, _1077);
    float _1089 = trunc(_1083);
    float _1091 = precise::max(_1089, 0.0);
    uint _1093 = uint(_1091);
    float _1095 = as_type<float>(_798) * _1081;
    float _1097 = fma(_198, _1041, _1075);
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1101 = _823 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1103 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1105 = trunc(_1095);
    float _1107 = precise::max(_1105, 0.0);
    uint _1109 = uint(_1107);
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1113 = ~_762;
    int _1115 = _1113 + 1;
    float _1117 = fma(_1103, -2.0, _1099);
    float _1119 = fma(_196, _1045, _1085);
    float _1121 = -_1111;
    float _1123 = fma(_1101, 2.0, _1121);
    float _1125 = in.m_67.z;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1131 = int(_1051) + int(_1093);
    float _1133 = -_158;
    float _1135 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1123);
    int _1137 = ~_762;
    int _1139 = _1137 + 1;
    float _1141 = 1.0 / _1129;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1147 = _1115 * int(_1109);
    int _1149 = _1147 + _973;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1151;
    float _1155 = float(uint(_1149));
    int _1157 = _1139 * _1131;
    int _1159 = _1157 + _1011;
    float _1161 = 1.0 / _1145;
    float _1163 = fma(_202, _1045, _1097);
    float _1165 = fma(_208, _1045, _1087);
    float _1167 = as_type<float>(_798) * _1155;
    bool _1169 = uint(_1159) >= uint(_762);
    float _1171 = -_184;
    float _1173 = _1171 + 1.0;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1177 = _1175 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1179 = trunc(_1167);
    float _1181 = precise::max(_1179, 0.0);
    uint _1183 = uint(_1181);
    bool _1185 = !_1169;
    int _1187 = _1185 ? 0 : (-1);
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1191 = _1189 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1193 = _1019 > 0.5;
    float _1195 = _1177 * _1141;
    int _1197 = ~_1131;
    int _1199 = _1197 + _1187;
    int _1201 = _1199 + 1;
    float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1205 = _1203 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _1207 = _1193 ? as_type<int>(_1173) : as_type<int>(_184);
    float _1209 = 1.0 / _1191;
    bool _1211 = _1125 > 0.5;
    int _1213 = _762 * _1201;
    int _1215 = _1213 + _1011;
    float _1217 = _1029 ? as_type<float>(_1207) : _184;
    float _1219 = _1153 * _1161;
    if (_1039)
    {
        float _1221 = _1211 ? _1173 : _184;
        _230 = _1221;
    }
    float _1223 = _230;
    float _1225 = _1163 + _756;
    bool _1227 = !_788;
    int _1229 = _1227 ? _1215 : (-1);
    float _1231 = 1.0 / _1205;
    int _1233 = _1229 & 3;
    bool _1235 = _1233 != 0;
    int _1237 = int(_1109) + int(_1183);
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1239;
    bool _1243 = uint(_1233) > 1u;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1249 = _1241 * _1209;
    int _1251 = _1229 & 3;
    bool _1253 = _1251 != 0;
    int _1255 = ~_762;
    int _1257 = _1255 + 1;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1261 = _1259 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _1263 = _1253 ? 0 : 1;
    float _1265 = _1247 * _1231;
    int _1267 = _1257 * _1237;
    int _1269 = _1267 + _973;
    int _1271 = ~_1263;
    int _1273 = _1271 + 1;
    int _1275 = _1273 + 1;
    float _1277 = 1.0 / _1261;
    int _1279 = _1275;
    if (!_1243)
    {
        int _1281 = ~_1263;
        int _1283 = _1281 + 1;
        _1279 = _1283;
    }
    int _1285 = _1279;
    float _1287 = _1019 * 2.0;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1293 = uint(_1269) >= uint(_762);
    float _1295 = _823 * 2.0;
    bool _1297 = uint(_1233) >= 2u;
    float _1299 = 1.0 / _1291;
    bool _1301 = !_1293;
    int _1303 = _1301 ? 0 : (-1);
    int _1305 = _1297 ? 0 : 1;
    bool _1307 = _1019 > 0.5;
    bool _1309 = _1307 && _1033;
    int _1311 = ~_1237;
    int _1313 = _1311 + _1303;
    int _1315 = _1313 + 1;
    float _1317 = floor(_1287);
    bool _1319 = _1233 != 3;
    int _1321 = _762 * _1315;
    int _1323 = _1321 + _973;
    int _1325 = _1229 >> 31;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1329 = _740 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1331;
    bool _1335 = !_788;
    int _1337 = _1335 ? _1323 : (-1);
    float _1339 = as_type<float>(_1325);
    if (_1309)
    {
        float _1341 = -_180;
        float _1343 = _1341 + 1.0;
        _232 = _1343;
    }
    float _1345 = _232;
    float _1347 = floor(_1295);
    float _1349 = _1333 * _1299;
    int _1351 = ~_1305;
    int _1353 = _1351 + 1;
    int _1355 = _1353 + 1;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _1361 = _1355;
    if (_1319)
    {
        int _1363 = ~_1305;
        int _1365 = _1363 + 1;
        _1361 = _1365;
    }
    int _1367 = _1361;
    float _1369 = _1125 * 2.0;
    bool _1371 = _1317 > 0.0;
    float _1373 = fma(_1249, _1329, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1375 = _1317 >= 0.0;
    bool _1377 = isnan(_1317);
    bool _1379 = _1375 || _1377;
    bool _1381 = isnan(0.0);
    bool _1383 = _1379 || _1381;
    float _1385 = 1.0 / _1359;
    int _1387 = _1325 & 3;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1391 = _740 + _1389;
    if (_1033)
    {
        _1059 = _1345;
    }
    float _1393 = _1059;
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1397 = _1395 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _1399 = _1229 + _1387;
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1403 = _740 + _1401;
    bool _1405 = _1233 != 3;
    float _1407 = floor(_1369);
    int _1409 = _1399 >> 2;
    float _1411 = _823 + _1019;
    bool _1413 = !_1023;
    int _1415 = _1413 ? 0 : 1;
    float _1417 = fma(_1219, _1403, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _1419 = _1409 << 4;
    int _1421 = _1419 + 368;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1425 = _740 + _1423;
    bool _1427 = _1347 >= 0.0;
    bool _1429 = isnan(_1347);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan(0.0);
    bool _1435 = _1431 || _1433;
    float _1437 = _1411 + (-1.0);
    uint _1439 = uint(int(uint(_1421) >> uint(2)));
    uint _1441 = uint(int(uint(int(_1439)) >> uint(2)));
    int _1443 = int(_1439) & 3;
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[int(_1441)][_1443];
    int _1447 = int(_1439) + 1;
    uint _1449 = uint(int(uint(_1447) >> uint(2)));
    int _1451 = _1447 & 3;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[int(_1449)][_1451];
    if (_754)
    {
        _1339 = _823;
    }
    float _1455 = _1339;
    float _1457 = fma(_1265, _1391, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1459 = !_1235;
    int _1461 = _1459 ? 0 : 1;
    float _1463 = fma(_1349, _1425, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1465 = !_1405;
    int _1467 = _1465 ? 0 : (-1);
    float _1469 = _1397 * _1277;
    float _1471 = _1455;
    if (!_754)
    {
        _1471 = _1125;
    }
    float _1473 = _1471;
    int _1475 = _1421 + 8;
    uint _1477 = uint(int(uint(_1475) >> uint(2)));
    uint _1479 = uint(int(uint(int(_1477)) >> uint(2)));
    int _1481 = int(_1477) & 3;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[int(_1479)][_1481];
    int _1485 = int(_1477) + 1;
    uint _1487 = uint(int(uint(_1485) >> uint(2)));
    int _1489 = _1485 & 3;
    float _1491 = (*spvDescriptorSet0.vp_c9)._m0[int(_1487)][_1489];
    int _1493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1495 = _1493 != 0;
    int _1497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1499 = _1497 != 0;
    int _1501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1503 = _1501 != 0;
    int _1505 = _1435 ? 0 : 1;
    bool _1507 = _1407 > 0.0;
    bool _1509 = _1407 >= 0.0;
    bool _1511 = isnan(_1407);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan(0.0);
    bool _1517 = _1513 || _1515;
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1521 = _740 + _1519;
    bool _1523 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1525 = isnan(_740);
    bool _1527 = _1523 || _1525;
    bool _1529 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1531 = _1527 || _1529;
    float _1533 = float(_1531);
    float _1535 = fma(_1195, _1521, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1537 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1539 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1541 = isnan(_740);
    bool _1543 = _1539 || _1541;
    bool _1545 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1547 = _1543 || _1545;
    float _1549 = float(_1547);
    float _1551 = -_1533;
    float _1553 = _1551 + 1.0;
    bool _1555 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1557 = isnan(_740);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1569 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1567;
    int _1571 = abs(_1461);
    float _1573 = -_1549;
    float _1575 = _1573 + 1.0;
    float _1577 = _1549 * _1553;
    float _1579 = -_1565;
    float _1581 = _1579 + 1.0;
    float _1583 = _1569 * _1385;
    float _1585 = _1565 * _1575;
    float _1587 = in.m_63.w;
    bool _1589 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1591 = isnan(_740);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1597 = _1593 || _1595;
    float _1599 = float(_1597);
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1603 = _740 + _1601;
    float _1605 = _774 * _1581;
    float _1607 = -_774;
    float _1609 = _1607 + 1.0;
    float _1611 = fma(_1583, _750, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1613 = fma(_1469, _1603, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1615 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1617 = isnan(_740);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1623 = _1619 || _1621;
    float _1625 = float(_1623);
    float _1627 = _1599 * _1609;
    float _1629 = -_1599;
    float _1631 = _1629 + 1.0;
    float _1633 = _1119 + _746;
    int _1635 = abs(_1285);
    float _1637 = _1625 * _1631;
    float _1639 = -_1625;
    float _1641 = _1639 + 1.0;
    int _1643 = ~_1635;
    int _1645 = _1643 + 1;
    int _1647 = _1645 + 1;
    float _1649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1651 = ~_1571;
    int _1653 = _1651 + 1;
    int _1655 = _1653 + 1;
    float _1657 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1659 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1661 = isnan(_740);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1667 = _1663 || _1665;
    float _1669 = float(_1667);
    int _1671 = _1647 * as_type<int>(_1453);
    int _1673 = abs(_1367);
    bool _1675 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1677 = isnan(_740);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = _1165 + _1587;
    int _1689 = _1655 * as_type<int>(_1445);
    int _1691 = _1689 + _1671;
    int _1693 = _1383 ? 0 : 1;
    float _1695 = _1685 * _1641;
    float _1697 = -_1685;
    float _1699 = _1697 + 1.0;
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1703 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1705 = _1633 + _1703;
    float _1707 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1709 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1711 = int(_1709);
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1715 = _1225 + _1713;
    float _1717 = _1705 * _1705;
    int _1719 = ~_1673;
    int _1721 = _1719 + 1;
    int _1723 = _1721 + 1;
    float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1727 = _1687 + _1725;
    float _1729 = _1669 * _1699;
    float _1731 = fma(_1715, _1715, _1717);
    float _1733 = -_1669;
    float _1735 = _1733 + 1.0;
    int _1737 = _1723 * as_type<int>(_1483);
    int _1739 = _1737 + _1691;
    int _1741 = abs(_1467);
    float _1743 = fma(_1727, _1727, _1731);
    float _1745 = _1417 * _1729;
    int _1747 = ~_1741;
    int _1749 = _1747 + 1;
    int _1751 = _1749 + 1;
    float _1753 = -_1701;
    float _1755 = fma(_1657, 2.0, _1753);
    int _1757 = abs(_1415);
    float _1759 = fma(_1707, _1223, -0.5);
    float _1761 = sqrt(_1743);
    float _1763 = float(uint(_1711));
    float _1765 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1767 = _1751 * as_type<int>(_1491);
    int _1769 = _1767 + _1739;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1773 = ~_1757;
    int _1775 = _1773 + 1;
    int _1777 = _1775 + 1;
    float _1779 = fma(_1735, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1745);
    int _1781 = abs(_1711);
    float _1783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1785 = fma(_1765, -2.0, _1771);
    int _1787 = _1769 * _1777;
    float _1789 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1791 = _1347 > 0.0;
    int _1793 = _1337 * _1757;
    int _1795 = _1793 + _1787;
    float _1797 = float(uint(_1781));
    float _1799 = 1.0 / _1763;
    float _1801 = _1789 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1803 = _1761 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1805 = float(uint(_1795));
    float _1807 = fma(_1535, _1695, _1779);
    int _1809 = ~_1693;
    int _1811 = _1809 + 1;
    int _1813 = _1811 + 1;
    float _1815 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1817 = _1079 + _1815;
    float _1819 = precise::min(_1801, _1803);
    float _1821 = rsqrt(_1743);
    float _1823 = _1783 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1825 = _1813;
    if (!_1371)
    {
        int _1827 = ~_1693;
        int _1829 = _1827 + 1;
        _1825 = _1829;
    }
    int _1831 = _1825;
    float _1833 = fma(_1373, _1637, _1807);
    int _1835 = abs(_1795);
    float _1837 = fma(_1823, _1393, -0.5);
    int _1839 = ~_1505;
    int _1841 = _1839 + 1;
    int _1843 = _1841 + 1;
    float _1845 = fma(_1817, _1817, _1717);
    float _1847 = 1.0 / _1797;
    int _1849 = as_type<int>(_1799) + (-2);
    float _1851 = fma(_1457, _1627, _1833);
    int _1853 = _1843;
    if (!_1791)
    {
        int _1855 = ~_1505;
        int _1857 = _1855 + 1;
        _1853 = _1857;
    }
    int _1859 = _1853;
    float _1861 = fma(_1727, _1727, _1845);
    int _1863 = _1517 ? 0 : 1;
    float _1865 = as_type<float>(_1849) * _1805;
    float _1867 = float(uint(_1835));
    float _1869 = _1821 * _1819;
    int _1871 = ~_1863;
    int _1873 = _1871 + 1;
    int _1875 = _1873 + 1;
    float _1877 = rsqrt(_1861);
    int _1879 = _1875;
    if (!_1507)
    {
        int _1881 = ~_1863;
        int _1883 = _1881 + 1;
        _1879 = _1883;
    }
    int _1885 = _1879;
    float _1887 = _1715 * _1869;
    float _1889 = _1705 * _1869;
    int _1891 = ~_1711;
    int _1893 = _1891 + 1;
    float _1895 = fma(_1463, _1605, _1851);
    float _1897 = -_1887;
    float _1899 = _1715 + _1897;
    int _1901 = as_type<int>(_1847) + (-2);
    float _1903 = trunc(_1865);
    float _1905 = precise::max(_1903, 0.0);
    uint _1907 = uint(_1905);
    float _1909 = -_1889;
    float _1911 = _1705 + _1909;
    float _1913 = _1899 * _1899;
    float _1915 = _1727 * _1869;
    float _1917 = as_type<float>(_1901) * _1867;
    int _1919 = ~_1711;
    int _1921 = _1919 + 1;
    float _1923 = fma(_1911, _1911, _1913);
    float _1925 = -_1915;
    float _1927 = _1727 + _1925;
    float _1929 = fma(_1613, _1585, _1895);
    float _1931 = trunc(_1917);
    float _1933 = precise::max(_1931, 0.0);
    uint _1935 = uint(_1933);
    float _1937 = fma(_1927, _1927, _1923);
    int _1939 = ~_1781;
    int _1941 = _1939 + 1;
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1945 = ~_1781;
    int _1947 = _1945 + 1;
    float _1949 = fma(_1611, _1577, _1929);
    int _1951 = _1893 * int(_1907);
    int _1953 = _1951 + _1795;
    float _1955 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1943);
    float _1957 = sqrt(_1937);
    float _1959 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1955);
    float _1961 = float(uint(_1953));
    out.m_77.w = _1819;
    float _1963 = float(_1885);
    float _1965 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1967 = _1947 * int(_1935);
    int _1969 = _1967 + _1835;
    float _1971 = as_type<float>(_1849) * _1961;
    float _1973 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1975 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1965);
    float _1977 = -_158;
    float _1979 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1755);
    float _1981 = float(uint(_1969));
    float _1983 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1973);
    float _1985 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1785);
    float _1987 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1975);
    float _1989 = trunc(_1971);
    float _1991 = precise::max(_1989, 0.0);
    uint _1993 = uint(_1991);
    float _1995 = as_type<float>(_1901) * _1981;
    float _1997 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1983);
    float _1999 = _1821 * _1957;
    float _2001 = fma(_1987, _1837, _1979);
    float _2003 = -_1985;
    float _2005 = fma(_1959, _1759, _2003);
    bool _2007 = _1711 == 0;
    float _2009 = _1789 * _1999;
    float _2011 = trunc(_1995);
    float _2013 = precise::max(_2011, 0.0);
    uint _2015 = uint(_2013);
    bool _2017 = _1997 >= 0.0;
    bool _2019 = !_1495;
    int _2021 = _2019 ? 0 : 1;
    float _2023 = _2009 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _2025 = abs(_2021);
    float _2027 = _2005 + 0.5;
    int _2029 = int(_1907) + int(_1993);
    float _2031 = _2023 * _1877;
    float _2033 = float(_2025);
    float _2035 = _2001 + 0.5;
    int _2037 = _1921 * _2029;
    int _2039 = _2037 + _1795;
    float _2041 = _1929;
    int _2043 = as_type<int>(_2035);
    float _2045 = _1915;
    if (_2017)
    {
        _2041 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2047 = _2041;
    float _2049 = _1817 * _2031;
    int _2051 = int(_1935) + int(_2015);
    out.m_79.x = _2035;
    out.m_79.y = _2027;
    bool _2053 = uint(_2039) >= uint(_1711);
    float _2055 = _2033 * _1963;
    float _2057 = -_2049;
    float _2059 = _1817 + _2057;
    int _2061 = _1941 * _2051;
    int _2063 = _2061 + _1835;
    bool _2065 = !_2053;
    int _2067 = _2065 ? 0 : (-1);
    float _2069 = _2059 * _2059;
    bool _2071 = _1711 == 0;
    float _2073 = _2049;
    if (_2017)
    {
        out.m_51.x = 0.0;
    }
    float _2075 = _1705 * _2031;
    if (_2017)
    {
        float _2077 = _2047 * 5.0;
        _2043 = as_type<int>(_2077);
    }
    int _2079 = _2043;
    bool _2081 = uint(_2063) >= uint(_1781);
    float _2083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2085 = -_2075;
    float _2087 = _1705 + _2085;
    float _2089 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1949);
    int _2091 = ~_2029;
    int _2093 = _2091 + _2067;
    int _2095 = _2093 + 1;
    if (_2017)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6948 = as_type<float>(_2079);
        out.gl_Position.z = _6948;
    }
    int _2097 = _1795 ^ _1711;
    float _2099 = fma(_2087, _2087, _2069);
    float _2101 = _1727 * _2031;
    float _2103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _2105 = uint(int(uint(_2097) >> uint(31)));
    out.m_81.x = _2089;
    float _2107 = -_2101;
    float _2109 = _1727 + _2107;
    int _2111 = ~int(_2105);
    int _2113 = _2111 + 1;
    float _2115 = fma(_2109, _2109, _2099);
    bool _2117 = !_2081;
    int _2119 = _2117 ? 0 : (-1);
    int _2121 = _1711 * _2095;
    int _2123 = _2121 + _1795;
    float _2125 = _2083 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2127 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2129 = log2(_2127);
    int _2131 = ~_2119;
    int _2133 = _2051 + _2131;
    int _2135 = _2133 + 1;
    bool _2137 = !_2071;
    int _2139 = _2137 ? _2123 : (-1);
    int _2141 = _2135 ^ _2113;
    float _2143 = _2103 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2145 = float(_2139);
    float _2147 = sqrt(_2115);
    int _2149 = ~_2113;
    int _2151 = _2149 + _2141;
    int _2153 = _2151 + 1;
    float _2155 = fma(_2125, _1017, -0.5);
    float _2157 = fma(_2125, _2145, _1135);
    float _2159 = fma(_2143, _1217, -0.5);
    bool _2161 = !_2007;
    int _2163 = _2161 ? _2153 : (-1);
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2167 = _2129 * _158;
    float _2169 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2171 = float(_2163);
    float _2173 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1117);
    float _2175 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2165);
    float _2177 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2169);
    float _2179 = exp2(_2167);
    float _2181 = -_2173;
    float _2183 = fma(_2143, _2171, _2181);
    float _2185 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2175);
    float _2187 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2177);
    bool _2189 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2191 = isnan(0.0);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2197 = _2193 || _2195;
    float _2199 = fma(_2185, _2159, _2183);
    float _2201 = fma(_2187, _2155, _2157);
    float _2203 = _2199 + 0.5;
    float _2205 = _2201 + 0.5;
    float _2207 = in.m_83.x;
    float _2209 = in.m_83.y;
    float _2211 = in.m_83.z;
    bool _2213 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2215 = isnan(1.0);
    bool _2217 = _2213 || _2215;
    bool _2219 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2221 = _2217 || _2219;
    float _2223 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2225 = 1.0 + _2223;
    float _2227 = _1877 * _2147;
    out.m_85.x = _2205;
    out.m_85.y = _2203;
    float _2229 = -_2179;
    float _2231 = _2229 + 1.0;
    float _2233 = 1.0 / _2225;
    float _2235 = _2009 * _2227;
    bool _2237 = !_1499;
    int _2239 = _2237 ? 0 : 1;
    bool _2241 = !_1503;
    int _2243 = _2241 ? 0 : 1;
    out.m_87.x = _2235;
    float _2245 = _2211;
    float _2247 = _2101;
    if (_2017)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2249 = -_2049;
    float _2251 = _1079 + _2249;
    float _2253 = _2055 * (-2.0);
    float _2255 = _2197 ? _2231 : 0.0;
    float _2257 = -_2075;
    float _2259 = _1633 + _2257;
    float _2261 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2263 = _2251 + _2261;
    float _2265 = _823 + (-0.5);
    float _2267 = fma(_2253, _2207, _2207);
    if (_2221)
    {
        float _2269 = _2255 * _2233;
        _162 = _2269;
    }
    float _2271 = _162;
    int _2273 = abs(_2243);
    float _2275 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2277 = _2259 + _2275;
    float _2279 = fma(_2265, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2267);
    int _2281 = abs(_2239);
    float _2283 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2285 = float(_1859);
    float _2287 = fma(_1537, _2253, _1537);
    float _2289 = float(_2281);
    float _2291 = -_2101;
    float _2293 = _1687 + _2291;
    float _2295 = fma(_2277, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2283);
    float _2297 = _1019 + _1125;
    float _2299 = _2289 * _2285;
    float _2301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2303 = _2293 + _2301;
    float _2305 = fma(_2287, _2271, _2279);
    float _2307 = _2297 + (-1.0);
    float _2309 = _2299 * (-2.0);
    float _2311 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2295);
    float _2313 = _1019 + (-0.5);
    float _2315 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2317 = fma(_2309, _2209, _2209);
    float _2319 = float(_1831);
    float _2321 = _823 + _1125;
    float _2323 = float(_2273);
    float _2325 = fma(_2315, _2309, _2315);
    bool _2327 = _2311 >= 0.0;
    float _2329 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2317);
    float _2331 = _2323 * _2319;
    float _2333 = _2321 + (-1.0);
    float _2335 = fma(_2325, _2271, _2329);
    float _2337 = _2305 * 0.15915493667125701904296875;
    float _2339 = _2331 * (-2.0);
    float _2341 = fma(_2333, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2343 = _2335 * 0.15915493667125701904296875;
    float _2345 = _1125 + (-0.5);
    float _2347 = fma(_2339, _2211, _2211);
    float _2349 = fma(_2341, _2339, _2341);
    if (_2327)
    {
        _2245 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2351 = _2245;
    float _2353 = _2337 * 6.283185482025146484375;
    float _2355 = sin(_2353);
    float _2357 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2347);
    int _2359 = as_type<int>(_2351);
    if (_2327)
    {
        out.m_51.x = 0.0;
    }
    if (_2327)
    {
        float _2361 = _2351 * 5.0;
        _2359 = as_type<int>(_2361);
    }
    int _2363 = _2359;
    float _2365 = fma(_2349, _2271, _2357);
    float _2367 = _2337 * 6.283185482025146484375;
    float _2369 = cos(_2367);
    if (_2327)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7379 = as_type<float>(_2363);
        out.gl_Position.z = _7379;
    }
    float _2371 = _2343 * 6.283185482025146484375;
    float _2373 = sin(_2371);
    float _2375 = _2343 * 6.283185482025146484375;
    float _2377 = cos(_2375);
    if (_2327)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2379 = in.m_89.x;
    float _2381 = in.m_89.y;
    float _2383 = in.m_89.z;
    float _2385 = _2365 * 0.15915493667125701904296875;
    float _2387 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2389 = _1999 * _2227;
    float _2391 = _2385 * 6.283185482025146484375;
    float _2393 = cos(_2391);
    float _2395 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2397 = _2369 * _2377;
    float _2399 = _2387 * _2389;
    float _2401 = _2369 * _2373;
    float _2403 = _2355 * _2373;
    float _2405 = _2395 * _2389;
    float _2407 = _2355 * _2377;
    float _2409 = _2385 * 6.283185482025146484375;
    float _2411 = sin(_2409);
    float _2413 = _2369 * _2393;
    float _2415 = _2377 * _2393;
    float _2417 = _2355 * _2393;
    float _2419 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2381);
    float _2421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2379);
    float _2423 = _2373 * _2393;
    float _2425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2383);
    float _2427 = _2399 * _2419;
    float _2429 = _2235 * _2421;
    float _2431 = fma(_2411, _2397, _2403);
    float _2433 = _2405 * _2425;
    float _2435 = _2413 * _2427;
    float _2437 = -_2407;
    float _2439 = fma(_2411, _2401, _2437);
    float _2441 = -_2427;
    float _2443 = _2411 * _2441;
    float _2445 = -_2401;
    float _2447 = fma(_2411, _2407, _2445);
    float _2449 = fma(_2431, _2429, _2435);
    float _2451 = _2417 * _2427;
    float _2453 = fma(_2415, _2429, _2443);
    float _2455 = fma(_2411, _2403, _2397);
    float _2457 = fma(_2439, _2433, _2449);
    float _2459 = fma(_2447, _2429, _2451);
    float _2461 = fma(_2423, _2433, _2453);
    float _2463 = _2457 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2465 = fma(_2455, _2433, _2459);
    float _2467 = _2457 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2469 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2463);
    float _2471 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2467);
    float _2473 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2469);
    float _2475 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2471);
    float _2477 = _2473 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2479 = _2475 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2481 = _1687 + _2477;
    float _2483 = _1633 + _2479;
    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2487 = _2481 + _2485;
    float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2491 = _2483 + _2489;
    float _2493 = _2487 * _2487;
    float _2495 = fma(_2491, _2491, _2493);
    float _2497 = _2457 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2499 = sqrt(_2495);
    float _2501 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2497);
    float _2503 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2501);
    float _2505 = _2503 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2507 = _1079 + _2505;
    bool _2509 = _2499 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2511 = _2505;
    float _2513 = _2503;
    float _2515 = _2483;
    if (!_2509)
    {
        _2511 = _2481;
    }
    float _2517 = _2511;
    float _2519 = _2517;
    if (!_2509)
    {
        _2513 = _2507;
    }
    float _2521 = _2513;
    bool _2523 = !_2509;
    float _2525 = _2521;
    if (!_2523)
    {
        float _2527 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2529 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2531 = _2499 + _2529;
        float _2533 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2535 = rsqrt(_2495);
        float _2537 = _2531 * _2527;
        float _2539 = _2537 * 0.15915493667125701904296875;
        float _2541 = _2539 * 6.283185482025146484375;
        float _2543 = sin(_2541);
        float _2545 = _2539 * 6.283185482025146484375;
        float _2547 = cos(_2545);
        float _2549 = fma(_2543, _2533, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2551 = _2535 * _2549;
        float _2553 = _2547 + (-1.0);
        float _2555 = fma(_2491, _2551, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2557 = fma(_2487, _2551, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2559 = _2553 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2561 = fma(_2507, _2547, _2559);
        _2515 = _2555;
        _2519 = _2557;
        _2525 = _2561;
    }
    float _2563 = _2515;
    float _2565 = _2519;
    float _2567 = _2525;
    float _2569 = -_1889;
    float _2571 = _2569 + _2563;
    float _2573 = -_1915;
    float _2575 = _2573 + _2565;
    float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2579 = _2571 + _2577;
    float _2581 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2583 = _2575 + _2581;
    float _2585 = fma(_2579, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2587 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _7736 = float2(_2585, _2587);
    float _2589 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_7736, float2(0.0), isnan(_7736)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_7736, float2(0.0), isnan(_7736)), level(0.0)).x;
    float _2591 = -_1887;
    float _2593 = _2591 + _1079;
    float _2595 = -_1889;
    float _2597 = _1633 + _2595;
    float _2599 = -_1079;
    float _2601 = _2599 + _2567;
    float _2603 = -_1887;
    float _2605 = _2603 + _2567;
    float _2607 = -_1687;
    float _2609 = _2607 + _2565;
    float _2611 = -_1915;
    float _2613 = _1687 + _2611;
    float _2615 = -_2075;
    float _2617 = _2615 + _2597;
    float _2619 = -_1633;
    float _2621 = _2619 + _2563;
    float _2623 = _2601 * _2601;
    float _2625 = -_2101;
    float _2627 = _2625 + _2613;
    bool _2629 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2631 = isnan(0.5);
    bool _2633 = _2629 || _2631;
    bool _2635 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2637 = _2633 || _2635;
    float _2639 = fma(_2621, _2621, _2623);
    bool _2641 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2643 = isnan(0.5);
    bool _2645 = _2641 || _2643;
    bool _2647 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2649 = _2645 || _2647;
    float _2651 = fma(_2609, _2609, _2639);
    float _2653 = sqrt(_2651);
    bool _2655 = _2653 > 0.0;
    float _2657 = _2605;
    float _2659 = _2571;
    float _2661 = _2597;
    if (!_2655)
    {
        _2045 = _2575;
    }
    float _2663 = _2045;
    float _2665 = fma(_2589, 100.0, _2593);
    float _2667 = fma(_2589, 100.0, _2605);
    float _2669 = -_2049;
    float _2671 = _2669 + _2665;
    float _2673 = _2663;
    float _2675 = _2663;
    float _2677 = _2671;
    if (!_2655)
    {
        _2657 = _2667;
    }
    float _2679 = _2657;
    float _2681 = _2671 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2683 = fma(_2617, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2681);
    float _2685 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2683);
    float _2687 = _2685 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2689 = _2671 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2691 = 1.0 / _2687;
    float _2693 = fma(_2617, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2689);
    float _2695 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2693);
    float _2697 = _2695 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2699 = _2697 + _2687;
    float _2701 = _2699 * _2691;
    float _2703 = _2701 * 0.5;
    float _2705 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2707 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2705);
    float _2709 = 1.0 / _2707;
    bool _2711 = !_2655;
    float _2713 = _2679;
    float _2715 = _2687;
    if (!_2711)
    {
        float _2717 = _224 * _224;
        float _2719 = fma(_220, _220, _2717);
        float _2721 = fma(_226, _226, _2719);
        float _2723 = rsqrt(_2651);
        float _2725 = sqrt(_2721);
        float _2727 = _2621 * _2723;
        float _2729 = _2601 * _2723;
        float _2731 = _2609 * _2723;
        bool _2733 = _2725 > 0.0;
        float _2735 = _2725;
        _2715 = _2729;
        if (!_2733)
        {
            _2735 = _2667;
        }
        float _2737 = _2735;
        _2713 = _2737;
        if (!_2733)
        {
            _2673 = _2575;
        }
        float _2739 = _2673;
        bool _2741 = !_2733;
        _2675 = _2739;
        if (!_2741)
        {
            float _2743 = rsqrt(_2721);
            float _2745 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2747 = _224 * _2743;
            float _2749 = _220 * _2743;
            float _2751 = _226 * _2743;
            float _2753 = _2729 * _2747;
            float _2755 = fma(_2727, _2749, _2753);
            float _2757 = _2745 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2759 = fma(_2731, _2751, _2755);
            float _2761 = _2759 * _2757;
            float _2763 = fma(_220, _2761, _2571);
            float _2765 = fma(_224, _2761, _2667);
            float _2767 = fma(_226, _2761, _2575);
            _2675 = _2767;
            _2659 = _2763;
            _2713 = _2765;
        }
    }
    float _2769 = _2675;
    float _2771 = _2659;
    float _2773 = _2713;
    float _2775 = _2715;
    float _2777 = -_2101;
    float _2779 = _2777 + _2769;
    float _2781 = -_2075;
    float _2783 = _2781 + _2771;
    float _2785 = -_2049;
    float _2787 = _2785 + _2773;
    float _2789 = _2787;
    float _2791 = _2783;
    float _2793 = _2779;
    float _2795 = _2771;
    float _2797 = _2775;
    if (_2649)
    {
        _2247 = 1.0;
    }
    float _2799 = _2247;
    float _2801 = _2799;
    if (!_2637)
    {
        float _2803 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2805 = _2671 + _2803;
        float _2807 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2809 = _2617 + _2807;
        float _2811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2813 = -_2613;
        float _2815 = _2813 + _2769;
        float _2817 = _2805 * _2805;
        float _2819 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2821 = _2627 + _2819;
        float _2823 = -_2665;
        float _2825 = _2823 + _2773;
        float _2827 = fma(_2809, _2809, _2817);
        float _2829 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2831 = fma(_2821, _2821, _2827);
        float _2833 = sqrt(_2831);
        float _2835 = 1.0 / _2227;
        float _2837 = _2829 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2839 = precise::min(_2833, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2841 = _2839 * _2811;
        float _2843 = _2841 * _2835;
        float _2845 = -_2597;
        float _2847 = _2845 + _2771;
        float _2849 = _2837 * _2843;
        float _2851 = _2815 * _2843;
        float _2853 = fma(_2847, _2849, _2617);
        float _2855 = fma(_2825, _2849, _2671);
        float _2857 = fma(_2837, _2851, _2627);
        _2789 = _2855;
        _2791 = _2853;
        _2793 = _2857;
    }
    float _2859 = _2789;
    float _2861 = _2791;
    float _2863 = _2793;
    if (_2649)
    {
        _2073 = 1.0;
    }
    float _2865 = _2073;
    float _2867 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2869 = _2709 * _2867;
    float _2871 = _2865;
    if (!_2649)
    {
        float _2873 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2875 = _2873 * 0.15915493667125701904296875;
        float _2877 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2879 = _2875 * 6.283185482025146484375;
        float _2881 = cos(_2879);
        float _2883 = _2877 * 0.15915493667125701904296875;
        float _2885 = _2875 * 6.283185482025146484375;
        float _2887 = sin(_2885);
        float _2889 = 1.0 / _2881;
        float _2891 = _2883 * 6.283185482025146484375;
        float _2893 = cos(_2891);
        float _2895 = _2887 * _2889;
        float _2897 = _2883 * 6.283185482025146484375;
        float _2899 = sin(_2897);
        float _2901 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2903 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2901;
        float _2905 = _2893 * _2895;
        float _2907 = 1.0 / _2903;
        float _2909 = 1.0 / _2905;
        float _2911 = _2899 * _2909;
        float _2913 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2915 = fma(_2869, _2911, _2913);
        float _2917 = _2915 * _2907;
        float _2919 = precise::clamp(_2917, 0.0, 1.0);
        _2661 = _2895;
        _2795 = _2875;
        _2801 = _2919;
    }
    float _2921 = _2661;
    float _2923 = _2795;
    float _2925 = _2801;
    float _2927 = _2923;
    float _2929 = _2921;
    if (!_2649)
    {
        float _2931 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2933 = _2931 * 0.15915493667125701904296875;
        float _2935 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2937 = _2933 * 6.283185482025146484375;
        float _2939 = cos(_2937);
        float _2941 = _2935 * 0.15915493667125701904296875;
        float _2943 = _2933 * 6.283185482025146484375;
        float _2945 = sin(_2943);
        float _2947 = 1.0 / _2939;
        float _2949 = _2941 * 6.283185482025146484375;
        float _2951 = cos(_2949);
        float _2953 = _2945 * _2947;
        float _2955 = _2941 * 6.283185482025146484375;
        float _2957 = sin(_2955);
        float _2959 = _2951 * _2953;
        float _2961 = 1.0 / _2959;
        float _2963 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2965 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2963;
        float _2967 = 1.0 / _2965;
        float _2969 = _2957 * _2961;
        float _2971 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2973 = fma(_2869, _2969, _2971);
        float _2975 = _2973 * _2967;
        float _2977 = precise::clamp(_2975, 0.0, 1.0);
        float _2979 = -_2977;
        float _2981 = _2979 + 1.0;
        _2927 = _2959;
        _2929 = _2947;
        _2871 = _2981;
    }
    float _2983 = _2927;
    float _2985 = _2929;
    float _2987 = _2871;
    float _2989 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2991 = _2859 + _2989;
    float _2993 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2995 = _2861 + _2993;
    float _2997 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2999 = _2863 + _2997;
    float _3001 = _2859 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3003 = _2991 * _2991;
    float _3005 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3001);
    float _3007 = fma(_2995, _2995, _3003);
    float _3009 = fma(_2863, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3005);
    float _3011 = fma(_2999, _2999, _3007);
    float _3013 = _3009 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3015 = rsqrt(_3011);
    float _3017 = sqrt(_3011);
    float _3019 = _3015 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3021 = _2995 * _3019;
    float _3023 = _2999 * _3019;
    float _3025 = _3021 * _3021;
    float _3027 = _3023 * _3023;
    float _3029 = _3025 + _3027;
    float _3031 = sqrt(_3029);
    bool _3033 = _3031 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3037 = _3031 + _3035;
    float _3039 = _2999;
    float _3041 = _2985;
    float _3043 = _3037;
    float _3045 = _2983;
    float _3047 = _2991;
    if (_3033)
    {
        float _3049 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3039 = _3049;
    }
    float _3051 = _3039;
    if (_3033)
    {
        float _3053 = rsqrt(_3029);
        _3041 = _3053;
    }
    float _3055 = _3041;
    float _3057 = _3055;
    if (_3033)
    {
        float _3059 = _3037 * _3051;
        _3043 = _3059;
    }
    float _3061 = _3043;
    if (_3033)
    {
        float _3063 = _3061 * 0.15915493667125701904296875;
        _3045 = _3063;
    }
    float _3065 = _3045;
    float _3067 = _3015;
    float _3069 = _3065;
    if (_3033)
    {
        float _3071 = _3065 * 6.283185482025146484375;
        float _3073 = sin(_3071);
        _3067 = _3073;
    }
    float _3075 = _3067;
    float _3077 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3079 = precise::max(0.0, _3077);
    float _3081 = _3051;
    float _3083 = _3079;
    if (_3033)
    {
        float _3085 = _3065 * 6.283185482025146484375;
        float _3087 = cos(_3085);
        _3081 = _3087;
    }
    float _3089 = _3081;
    float _3091 = -_3019;
    float _3093 = -_3079;
    float _3095 = fma(_2991, _3091, _3093);
    float _3097 = _3095;
    if (_3033)
    {
        float _3099 = _3095 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3047 = _3099;
    }
    float _3101 = _3047;
    float _3103 = _3101;
    if (!_3033)
    {
        _3069 = _3027;
    }
    float _3105 = _3069;
    float _3107 = _3075;
    float _3109 = _3105;
    if (_3033)
    {
        float _3111 = fma(_3075, _3101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3103 = _3111;
    }
    float _3113 = _3103;
    if (!_3033)
    {
        _3107 = _3025;
    }
    float _3115 = _3107;
    float _3117 = _3089;
    float _3119 = _3115;
    if (_3033)
    {
        float _3121 = _3089 + (-1.0);
        _3083 = _3121;
    }
    float _3123 = _3083;
    float _3125 = _3123;
    if (_3033)
    {
        float _3127 = _3055 * _3113;
        _2797 = _3127;
    }
    float _3129 = _2797;
    if (!_3033)
    {
        _3057 = _3021;
    }
    float _3131 = _3057;
    float _3133 = _3131;
    if (_3033)
    {
        float _3135 = _3123 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3125 = _3135;
    }
    float _3137 = _3125;
    if (_3033)
    {
        float _3139 = _3021 * _3129;
        _3133 = _3139;
    }
    float _3141 = _3133;
    float _3143 = _2859 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_3033)
    {
        float _3145 = fma(_3095, _3089, _3137);
        _3097 = _3145;
    }
    float _3147 = _3097;
    if (!_3033)
    {
        _3117 = _3023;
    }
    float _3149 = _3117;
    float _3151 = _3149;
    if (_3033)
    {
        float _3153 = _3023 * _3129;
        _3151 = _3153;
    }
    float _3155 = _3151;
    if (_3033)
    {
        float _3157 = _3141 * _3141;
        _3119 = _3157;
    }
    float _3159 = _3119;
    float _3161 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3143);
    float _3163 = fma(_2617, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_3033)
    {
        float _3165 = _3155 * _3155;
        _3109 = _3165;
    }
    float _3167 = _3109;
    float _3169 = fma(_3147, _3147, _3159);
    float _3171 = fma(_2863, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3161);
    float _3173 = floor(_3163);
    float _3175 = _3169 + _3167;
    float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3179 = fma(_3017, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3177);
    float _3181 = precise::clamp(_3179, 0.0, 1.0);
    float _3183 = _3171 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3185 = -_3181;
    float _3187 = _3185 + 1.0;
    float _3189 = rsqrt(_3175);
    float _3191 = fma(_2627, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3193 = _2859 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3195 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3197 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3199 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3193);
    float _3201 = abs(_3187);
    float _3203 = log2(_3201);
    float _3205 = _2859 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3207 = fma(_2863, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3199);
    float _3209 = -_3197;
    float _3211 = fma(_3209, _3195, 1.0);
    float _3213 = -_3173;
    float _3215 = _3163 + _3213;
    float _3217 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3205);
    float _3219 = _3207 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3221 = _3189 * _3141;
    float _3223 = fma(_2863, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3217);
    float _3225 = _3189 * _3147;
    float _3227 = _3189 * _3155;
    float _3229 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3231 = _3223 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3233 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3235 = floor(_3191);
    float _3237 = -_3229;
    float _3239 = fma(_3225, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3237);
    float _3241 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3243 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3233);
    float _3245 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3247 = -_3227;
    float _3249 = fma(_3247, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3239);
    float _3251 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3253 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3243);
    float _3255 = log2(_3211);
    float _3257 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3245);
    float _3259 = fma(_3013, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3253);
    float _3261 = _3225 + 1.0;
    float _3263 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3257);
    float _3265 = exp2(_3241);
    float _3267 = fma(_3249, -0.5, 0.5);
    float _3269 = -_3235;
    float _3271 = _3191 + _3269;
    float _3273 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3251);
    float _3275 = fma(_3249, 0.5, 0.5);
    float _3277 = fma(_3013, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3263);
    float _3279 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3273);
    float _3281 = 1.0 / _3259;
    float _3283 = fma(_3275, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3285 = _3255 * 0.693147182464599609375;
    float _3287 = fma(_3013, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3279);
    float _3289 = fma(_3275, _3283, -0.212114393711090087890625);
    float _3291 = sqrt(_3267);
    float _3293 = -_3225;
    float _3295 = fma(_3265, _3261, _3293);
    float2 _8824 = float2(_3215, _3271);
    float _3297 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8824, float2(0.0), isnan(_8824)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8824, float2(0.0), isnan(_8824)), level(0.0)).x;
    float _3299 = fma(_3275, _3289, 1.570728778839111328125);
    float _3301 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3303 = fma(_3295, 0.5, 0.5);
    float _3305 = _3277 * _3281;
    float _3307 = _3287 * _3281;
    float _3309 = fma(_3305, 0.5, 0.5);
    float _3311 = fma(_3307, -0.5, 0.5);
    float _3313 = _3291 * 0.636619746685028076171875;
    float3 _8856 = float3(_3309, _3311, _3301);
    float _3315 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8856, float3(0.0), isnan(_8856)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8856, float3(0.0), isnan(_8856)), level(0.0)).x;
    float _3317 = -_3299;
    float _3319 = fma(_3313, _3317, 1.0);
    float3 _8872 = float3(_3309, _3311, _3301);
    float4 _3322 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8872, float3(0.0), isnan(_8872)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8872, float3(0.0), isnan(_8872)), level(0.0)).xyzw;
    float _3324 = _3322.x;
    float _3326 = _3322.y;
    float _3328 = _3322.z;
    float _3330 = _3322.w;
    float2 _8888 = float2(_3319, _3303);
    float3 _3334 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8888, float2(0.0), isnan(_8888)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8888, float2(0.0), isnan(_8888)), level(0.0)).xyz;
    float _3336 = _3334.x;
    float _3338 = _3334.y;
    float _3340 = _3334.z;
    float _3342 = in.m_91.x;
    float _3344 = in.m_91.y;
    float _3346 = in.m_91.z;
    bool _3348 = _2381 != 0.0;
    bool _3350 = isnan(_2381);
    bool _3352 = _3348 || _3350;
    bool _3354 = isnan(0.0);
    bool _3356 = _3352 || _3354;
    float _3358 = _2431 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3360 = _2431 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3362 = _2431 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3364 = _2379 == 0.0;
    bool _3366 = !_3356;
    bool _3368 = _3364 && _3366;
    float _3370 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3358);
    float _3372 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3360);
    float _3374 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3362);
    bool _3376 = _2383 == 0.0;
    bool _3378 = _3376 && _3368;
    float _3380 = _2413 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3382 = _2413 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3384 = _2413 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3386 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3370);
    float _3388 = -_2411;
    float _3390 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3380);
    float _3392 = -_2411;
    float _3394 = fma(_3392, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3382);
    float _3396 = -_2411;
    float _3398 = fma(_3396, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3384);
    float _3400 = _2439 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3402 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3372);
    float _3404 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3374);
    float _3406 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3394);
    float _3408 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3400);
    float _3410 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3390);
    float _3412 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3398);
    float _3414 = _3342;
    float _3416 = _3344;
    float _3418 = _3346;
    if (!_3378)
    {
        float _3420 = fma(_2379, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3342);
        _3414 = _3420;
    }
    float _3422 = _3414;
    if (!_3378)
    {
        float _3424 = fma(_2381, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3344);
        _3416 = _3424;
    }
    float _3426 = _3416;
    float _3428 = abs(_2869);
    float _3430 = log2(_3428);
    if (!_3378)
    {
        float _3432 = fma(_2383, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3346);
        _3418 = _3432;
    }
    float _3434 = _3418;
    float _3436 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3408);
    float _3438 = _3410 * _3426;
    float _3440 = _3406 * _3426;
    float _3442 = _3412 * _3426;
    float _3444 = fma(_3386, _3422, _3438);
    float _3446 = fma(_3402, _3422, _3440);
    float _3448 = fma(_3404, _3422, _3442);
    float _3450 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3452 = fma(_3436, _3434, _3444);
    float _3454 = _2439 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3456 = _2439 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3458 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3460 = _3430 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3462 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3454);
    float _3464 = exp2(_3450);
    float _3466 = in.m_75.x;
    float _3468 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3456);
    float _3470 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3462);
    float _3472 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3458);
    bool _3474 = _2869 <= 8000.0;
    bool _3476 = isnan(_2869);
    bool _3478 = _3474 || _3476;
    bool _3480 = isnan(8000.0);
    bool _3482 = _3478 || _3480;
    float _3484 = float(_3482);
    float _3486 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3468);
    float _3488 = fma(_3470, _3434, _3446);
    float _3490 = exp2(_3460);
    float _3492 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3472);
    float _3494 = _3259 * 0.5;
    float _3496 = fma(_3486, _3434, _3448);
    float _3498 = fma(_3013, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3492);
    out.m_93.x = _2617;
    out.m_93.y = _2671;
    out.m_93.z = _2627;
    float _3500 = -_3464;
    float _3502 = _3500 + 1.0;
    bool _3504 = _3017 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3506 = isnan(_3017);
    bool _3508 = _3504 || _3506;
    bool _3510 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3512 = _3508 || _3510;
    out.gl_Position.x = _3277;
    out.gl_Position.y = _3287;
    out.gl_Position.z = _3498;
    out.gl_Position.w = _3259;
    out.m_95.x = _3452;
    out.m_95.y = _3488;
    out.m_95.z = _3496;
    float _3514 = fma(_3490, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3516 = precise::clamp(_3514, 0.0, 1.0);
    float _3518 = _3277 + _3259;
    out.m_97.x = _2861;
    out.m_97.y = _2859;
    out.m_97.z = _2863;
    float _3520 = fma(_3516, -2.0, 3.0);
    float _3522 = _3516 * _3516;
    float _3524 = _3518 * 0.5;
    float _3526 = _3259;
    if (!_3512)
    {
        _2677 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3528 = _2677;
    float _3530 = _3522 * _3520;
    float _3532 = -_3530;
    float _3534 = _3532 + 1.0;
    float _3536 = fma(_3534, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3530);
    float _3538 = fma(_3287, -0.5, _3494);
    float _3540 = _3498 + _3259;
    float _3542 = _3484 * _3536;
    float _3544 = _3540 * 0.5;
    float _3546 = _3542 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3548 = _3502 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_99.x = _3524;
    out.m_99.y = _3538;
    out.m_99.z = _3544;
    out.m_99.w = _3259;
    float _3550 = -_3548;
    float _3552 = _3550 + 1.0;
    float _3554 = _3544;
    float _3556 = _3538;
    float _3558 = _3528;
    float _3560 = _3528;
    if (!_3512)
    {
        _3526 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3562 = _3526;
    float _3564 = _3562;
    float _3566 = _3562;
    if (!_3512)
    {
        _3554 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3568 = _3554;
    float _3570 = _3568;
    float _3572 = _3568;
    if (!_3512)
    {
        _3556 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3574 = _3556;
    float _3576 = -_3297;
    float _3578 = _3576 + 1.0;
    float _3580 = _3578 * _3546;
    float _3582 = precise::clamp(_3580, 0.0, 1.0);
    float _3584 = -_3582;
    float _3586 = fma(_3584, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3588 = _3586 * _3466;
    float _3590 = _3548 * _3315;
    float _3592 = _3588 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3594 = _3330 * _3590;
    float _3596 = _3330 * _3552;
    out.m_101.x = _3592;
    float _3598 = _2925 * _2987;
    float _3600 = _3340 * _3590;
    float _3602 = fma(_3336, _3594, _3324);
    float _3604 = fma(_3338, _3594, _3326);
    float _3606 = _3598 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3608 = fma(_3330, _3600, _3328);
    float _3610 = _3594;
    float _3612 = _3598;
    float _3614 = _3574;
    float _3616 = _3574;
    if (!_3512)
    {
        _3610 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3618 = _3610;
    float _3620 = _3618;
    float _3622 = _3618;
    if (!_3512)
    {
        _3612 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3624 = _3612;
    out.m_103.x = _3602;
    out.m_103.y = _3604;
    out.m_103.z = _3608;
    out.m_103.w = _3596;
    bool _3626 = !_3512;
    float _3628 = _3624;
    float _3630 = _3624;
    if (!_3626)
    {
        bool _3632 = _3017 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3634 = isnan(_3017);
        bool _3636 = _3632 || _3634;
        bool _3638 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3640 = _3636 || _3638;
        if (!_3640)
        {
            float _3642 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3644 = _3017 + _3642;
            float _3646 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3648 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3646;
            float _3650 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3652 = _3650 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3654 = 1.0 / _3648;
            float _3656 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3658 = _3656 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3660 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3662 = _3660 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3664 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3666 = _3664 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3668 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3670 = _3668 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3672 = _3644 * _3654;
            float _3674 = precise::clamp(_3672, 0.0, 1.0);
            float _3676 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3678 = _3676 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3680 = fma(_3674, _3652, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3682 = fma(_3674, _3678, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3684 = fma(_3674, _3658, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3686 = fma(_3674, _3662, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3688 = fma(_3674, _3666, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3690 = fma(_3674, _3670, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3622 = _3684;
            _3616 = _3688;
            _3560 = _3680;
            _3572 = _3686;
            _3566 = _3682;
            _3630 = _3690;
            _3692 = true;
        }
        else
        {
            bool _3694 = _3017 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3696 = isnan(_3017);
            bool _3698 = _3694 || _3696;
            bool _3700 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3702 = _3698 || _3700;
            if (!_3702)
            {
                _3558 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3704 = _3558;
            _3560 = _3704;
            if (!_3702)
            {
                _3620 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3706 = _3620;
            _3622 = _3706;
            if (!_3702)
            {
                _3564 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3708 = _3564;
            _3566 = _3708;
            if (!_3702)
            {
                _3570 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3710 = _3570;
            _3572 = _3710;
            if (!_3702)
            {
                _3614 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3712 = _3614;
            _3616 = _3712;
            if (!_3702)
            {
                _3628 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3714 = _3628;
            bool _3716 = !_3702;
            _3630 = _3714;
            if (!_3716)
            {
                bool _3718 = _3017 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3720 = isnan(_3017);
                bool _3722 = _3718 || _3720;
                bool _3724 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3726 = _3722 || _3724;
                if (!_3726)
                {
                    float _3728 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3730 = _3017 + _3728;
                    float _3732 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3734 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3732;
                    float _3736 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3738 = _3736 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3740 = 1.0 / _3734;
                    float _3742 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3744 = _3742 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3748 = _3746 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3750 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3752 = _3750 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3754 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3756 = _3754 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3758 = _3730 * _3740;
                    float _3760 = precise::clamp(_3758, 0.0, 1.0);
                    float _3762 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3764 = _3762 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3766 = fma(_3760, _3738, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3768 = fma(_3760, _3764, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3770 = fma(_3760, _3744, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3772 = fma(_3760, _3748, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3774 = fma(_3760, _3752, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3776 = fma(_3760, _3756, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3622 = _3770;
                    _3616 = _3774;
                    _3560 = _3766;
                    _3572 = _3772;
                    _3566 = _3768;
                    _3630 = _3776;
                    _3692 = true;
                }
                else
                {
                    _3622 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3616 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3560 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3572 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3566 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3630 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3692 = false;
    float _3778 = _3622;
    float _3780 = _3616;
    float _3782 = _3560;
    float _3784 = _3572;
    float _3786 = _3566;
    float _3788 = _3630;
    float _3790 = _3606 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3792 = fma(_3488, -0.5, 0.5);
    float _3794 = precise::clamp(_3792, 0.0, 1.0);
    float _3796 = -_3778;
    float _3798 = _3796 + _3780;
    float _3800 = -_3782;
    float _3802 = _3800 + _3784;
    out.m_105.x = 0.0;
    float _3804 = fma(_3794, _3798, _3778);
    float _3806 = -_3786;
    float _3808 = _3806 + _3788;
    float _3810 = fma(_3794, _3802, _3782);
    float _3812 = _3804 * 0.586610972881317138671875;
    bool _3814 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3816 = fma(_3794, _3808, _3786);
    out.m_51.x = _3790;
    float _3818 = fma(_3810, 0.298911988735198974609375, _3812);
    bool _3820 = _2925 > 0.0;
    bool _3822 = isnan(_2925);
    bool _3824 = _3820 || _3822;
    bool _3826 = isnan(0.0);
    bool _3828 = _3824 || _3826;
    float _3830 = fma(_3816, 0.114477999508380889892578125, _3818);
    bool _3832 = _2987 <= 0.0;
    bool _3834 = !_3828;
    bool _3836 = _3832 || _3834;
    float _3838 = -_3830;
    float _3840 = _3810 + _3838;
    float _3842 = -_3830;
    float _3844 = _3804 + _3842;
    float _3846 = -_3830;
    float _3848 = _3816 + _3846;
    float _3850 = fma(_3840, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3830);
    float _3852 = fma(_3844, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3830);
    float _3854 = fma(_3848, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3830);
    bool _3856 = !_3814;
    if (!_3856)
    {
        float _3858 = -_2859;
        float _3860 = _3858 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3862 = -_2861;
        float _3864 = _3862 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3866 = -_2863;
        float _3868 = _3866 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3870 = _3860 * _3860;
        float _3872 = fma(_3864, _3864, _3870);
        float _3874 = fma(_3868, _3868, _3872);
        float _3876 = sqrt(_3874);
        float _3878 = rsqrt(_3874);
        float _3880 = -_3876;
        float _3882 = _3880 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3884 = _3882 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3886 = precise::clamp(_3884, 0.0, 1.0);
        float _3888 = _3864 * _3878;
        float _3890 = _3860 * _3878;
        float _3892 = abs(_3886);
        float _3894 = log2(_3892);
        float _3896 = _3868 * _3878;
        float _3898 = _3888 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3900 = _3488 * _3890;
        float _3902 = -_3890;
        float _3904 = -_3898;
        float _3906 = fma(_3902, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3904);
        float _3908 = fma(_3452, _3888, _3900);
        float _3910 = -_3896;
        float _3912 = fma(_3910, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3906);
        float _3914 = fma(_3496, _3896, _3908);
        float _3916 = precise::clamp(_3914, 0.0, 1.0);
        float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3920 = _3912 + _3918;
        float _3922 = _3894 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3924 = _3920 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3926 = precise::clamp(_3924, 0.0, 1.0);
        float _3928 = exp2(_3922);
        float _3930 = _3928 * _3926;
        float _3932 = _3916 * _3930;
        float _3934 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3936 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3938 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _3934;
        out.m_105.y = _3936;
        out.m_105.z = _3938;
    }
    out.m_77.x = _3850;
    out.m_77.y = _3852;
    out.m_77.z = _3854;
    if (!_3836)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3940 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3940;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3692 = false;
    bool _732 = false;
    bool _628 = false;
    bool _486 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_48.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    float _134 = _132;
    if (!_128)
    {
        out.m_51.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _132 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3997 = as_type<float>(_140);
        out.gl_Position.z = _3997;
    }
    if (!_128)
    {
        return out;
    }
    float _144 = in.m_53.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = 0.0;
    float _162 = _158;
    if (_154)
    {
        float _164 = float(_124);
        _160 = _164;
    }
    float _166 = _160;
    bool _168 = _158 >= _166;
    bool _170 = !_154;
    bool _172 = _168 || _170;
    if (_172)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _134;
    if (_172)
    {
        out.m_51.x = 0.0;
    }
    if (_172)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4066 = as_type<float>(_178);
        out.gl_Position.z = _4066;
    }
    if (_172)
    {
        return out;
    }
    float _180 = in.m_55.x;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = in.m_55.y;
    float _186 = in.m_57.x;
    float _188 = in.m_57.y;
    float _190 = in.m_57.z;
    float _192 = in.m_59.x;
    float _194 = in.m_59.y;
    float _196 = in.m_59.z;
    float _198 = in.m_61.x;
    float _200 = in.m_61.y;
    float _202 = in.m_61.z;
    float _204 = in.m_63.x;
    float _206 = in.m_63.y;
    float _208 = in.m_63.z;
    out.m_65.x = _180;
    out.m_65.y = _184;
    float _210 = _188 * _194;
    float _212 = _188 * _200;
    float _214 = fma(_186, _192, _210);
    float _216 = _188 * _206;
    float _218 = fma(_186, _198, _212);
    float _220 = fma(_190, _196, _214);
    float _222 = fma(_186, _204, _216);
    float _224 = fma(_190, _202, _218);
    float _226 = fma(_190, _208, _222);
    bool _228 = !_182;
    float _230 = _184;
    float _232 = _180;
    float _250;
    if (!_228)
    {
        float _234 = in.m_67.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_124);
        float _256 = 1.0 / _254;
        float _258 = _158 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _260 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = _260 + _282;
    float _286 = 1.0 / _276;
    bool _288 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _290 = isnan(_260);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    bool _300 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _302 = isnan(_260);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = 1.0 / _272;
    bool _314 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _316 = isnan(_260);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _328 = -_324;
    float _330 = _328 + 1.0;
    float _332 = 1.0 / _280;
    float _334 = _268 * _286;
    float _336 = _264 * _312;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _346;
    float _350 = fma(_340, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _352 = _298 * _330;
    float _354 = fma(_348, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = _284 * _332;
    bool _358 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _360 = isnan(_260);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = fma(_344, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _372 = -_298;
    float _374 = _372 + 1.0;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _388 = -_368;
    float _390 = _388 + 1.0;
    float _392 = _368 * _374;
    float _394 = fma(_378, _334, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _396 = fma(_382, _334, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _398 = fma(_386, _334, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _400 = _310 * _390;
    float _402 = in.m_69.x;
    float _404 = in.m_69.y;
    float _406 = in.m_69.z;
    float _408 = -_310;
    float _410 = _408 + 1.0;
    float _412 = _370 * _400;
    float _414 = _354 * _400;
    float _416 = _350 * _400;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    float _426 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[143].x, _412);
    float _428 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[143].y, _414);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _430;
    float _434 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[143].z, _416);
    float _436 = fma(_420, _356, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _438 = fma(_424, _356, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _440 = fma(_394, _392, _426);
    float _442 = fma(_396, _392, _428);
    float _444 = fma(_432, _356, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _446 = fma(_398, _392, _434);
    float _448 = fma(_436, _352, _440);
    float _450 = fma(_438, _352, _442);
    float _452 = fma(_444, _352, _446);
    float _454 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].x, _448);
    float _456 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].y, _450);
    float _458 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].z, _452);
    float _460 = _454 * _402;
    float _462 = _456 * _404;
    float _464 = _458 * _406;
    bool _466 = !_326;
    float _484;
    if (!_466)
    {
        float _468 = in.m_67.x;
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _472 = _468 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[11].y, _158);
        float _476 = _474 * _470;
        float _478 = floor(_476);
        float _480 = -_478;
        float _482 = _476 + _480;
        _484 = _482;
        _486 = true;
    }
    else
    {
        float _488 = float(_124);
        float _490 = 1.0 / _488;
        float _492 = _158 * _490;
        _484 = _492;
    }
    _486 = false;
    float _494 = _484;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _498 = _494 + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _504 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _506 = isnan(_494);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _520 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _522 = isnan(_494);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _532;
    bool _536 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _538 = isnan(_494);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = 1.0 / _502;
    float _550 = -_514;
    float _552 = _550 + 1.0;
    bool _554 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _556 = _530 * _552;
    float _558 = -_530;
    float _560 = _558 + 1.0;
    float _562 = 1.0 / _518;
    float _564 = _534 * _548;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _570 = fma(_564, _498, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _572 = _568 * _562;
    float _574 = _570 * _556;
    float _576 = -_546;
    float _578 = _576 + 1.0;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _582 = _494 + _580;
    float _584 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[115].x, _574);
    float _586 = _514 * _578;
    float _588 = fma(_572, _582, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _592 = fma(_588, _586, _584);
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _598 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[117].x, _592);
    float _600 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _598 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_71.x = _600;
    out.m_71.y = _602;
    out.m_71.z = _604;
    out.m_71.w = _606;
    bool _608 = !_554;
    float _626;
    if (!_608)
    {
        float _610 = in.m_67.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].w, _158);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_124);
        float _632 = 1.0 / _630;
        float _634 = _158 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    bool _638 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _640 = isnan(_636);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _654 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _656 = isnan(_636);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _672 = _636 + _670;
    float _674 = -_648;
    float _676 = _674 + 1.0;
    float _678 = 1.0 / _652;
    float _680 = _664 * _676;
    float _682 = -_664;
    float _684 = _682 + 1.0;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _688 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _692 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _668 * _678;
    float _698 = fma(_696, _672, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _700 = _698 * _680;
    float _702 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[131].x, _700);
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _706 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[132].x, _702);
    float _708 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _706 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_73.x = _692;
    out.m_73.y = _708;
    out.m_73.z = _694;
    out.m_73.w = _710;
    bool _712 = !_688;
    float _730;
    if (!_712)
    {
        float _714 = in.m_67.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[14].x, _158);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        float _734 = float(_124);
        float _736 = 1.0 / _734;
        float _738 = _158 * _736;
        _730 = _738;
    }
    _732 = false;
    float _740 = _730;
    float _742 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _744 = int(_742);
    float _746 = in.m_59.w;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _750 = _740 + _748;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _754 = _752 != 0;
    float _756 = in.m_61.w;
    float _758 = float(_124);
    float _760 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _762 = int(_760);
    bool _764 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _766 = isnan(_740);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = float(_744);
    float _778 = 1.0 / _758;
    float _780 = float(uint(_762));
    float _782 = 1.0 / _776;
    int _784 = ~_762;
    int _786 = _784 + 1;
    bool _788 = _762 == 0;
    float _790 = 1.0 / _780;
    float _792 = _782 * _158;
    float _794 = trunc(_792);
    int _796 = int(_794);
    int _798 = as_type<int>(_790) + (-2);
    float _800 = float(uint(_796));
    float _802 = as_type<float>(_798) * _800;
    int _804 = ~_762;
    int _806 = _804 + 1;
    float _808 = trunc(_802);
    float _810 = precise::max(_808, 0.0);
    uint _813 = uint(_810);
    int _815 = _806 * int(_813);
    int _817 = _815 + _796;
    float _819 = float(uint(_817));
    float _821 = as_type<float>(_798) * _819;
    float _823 = in.m_67.x;
    float _825 = trunc(_821);
    float _827 = precise::max(_825, 0.0);
    uint _829 = uint(_827);
    bool _831 = !_754;
    float _833 = _831 ? 7.345489978790283203125 : 1.0;
    int _835 = int(_813) + int(_829);
    float _837 = float(_762);
    float _839 = float(_796);
    float _841 = _833 * _823;
    bool _843 = _839 >= _837;
    bool _845 = isnan(_839);
    bool _847 = _843 || _845;
    bool _849 = isnan(_837);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    int _855 = _786 * _835;
    int _857 = _855 + _796;
    bool _859 = uint(_857) >= uint(_762);
    float _861 = trunc(_853);
    int _863 = int(_861);
    bool _865 = !_859;
    int _867 = _865 ? 0 : (-1);
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _871 = _869 != 0;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _879 = _877 != 0;
    int _881 = ~_835;
    int _883 = _881 + _867;
    int _885 = _883 + 1;
    float _887 = floor(_841);
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _891 = _889 != 0;
    int _893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _895 = _893 != 0;
    int _897 = _762 * _885;
    int _899 = _897 + _796;
    int _901 = ~_863;
    int _903 = _901 + 1;
    int _905 = _903 + 1;
    bool _907 = !_788;
    int _909 = _907 ? _899 : (-1);
    int _911 = _909 * _905;
    float _913 = -_887;
    float _915 = _841 + _913;
    int _917 = _762 + (-1);
    float _919 = _915 * _837;
    float _921 = _837 * _158;
    bool _923 = !_875;
    int _925 = _923 ? 0 : 1;
    int _927 = _863 * _917;
    int _929 = _927 + _911;
    float _931 = trunc(_919);
    int _933 = int(_931);
    float _935 = _921 * _778;
    bool _937 = !_891;
    int _939 = _937 ? 0 : 1;
    bool _941 = !_871;
    int _943 = _941 ? 0 : 1;
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _947 = _945 != 0;
    float _949 = trunc(_935);
    int _951 = int(_949);
    int _953 = abs(_925);
    bool _955 = !_879;
    int _957 = _955 ? 0 : 1;
    int _959 = abs(_939);
    int _961 = abs(_943);
    int _963 = abs(_957);
    int _965 = _929 * _953;
    bool _967 = !_947;
    int _969 = _967 ? 0 : 1;
    int _971 = _933 * _959;
    int _973 = _971 + _796;
    int _975 = _929;
    bool _977 = _947;
    float _979 = as_type<float>(_959);
    if (_895)
    {
        float _981 = -_180;
        float _983 = _981 + 1.0;
        _975 = as_type<int>(_983);
    }
    int _985 = _975;
    int _987 = abs(_969);
    int _989 = _951 * _961;
    int _991 = _989 + _965;
    float _993 = in.m_75.y;
    int _995 = ~_762;
    int _997 = _995 + 1;
    int _999 = _973 * _963;
    int _1001 = _999 + _991;
    if (_895)
    {
        bool _1003 = _823 > 0.5;
        _977 = _1003;
    }
    bool _1005 = _977;
    if (!_895)
    {
        _979 = _180;
    }
    float _1007 = _979;
    int _1009 = _933 * _987;
    int _1011 = _1009 + _1001;
    float _1013 = _1007;
    if (_895)
    {
        float _1015 = _1005 ? as_type<float>(_985) : _180;
        _1013 = _1015;
    }
    float _1017 = _1013;
    float _1019 = in.m_67.y;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1023 = _1021 != 0;
    float _1025 = float(uint(_1011));
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1029 = _1027 != 0;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1033 = _1031 != 0;
    float _1035 = as_type<float>(_798) * _1025;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1039 = _1037 != 0;
    float _1041 = in.m_48.x;
    float _1043 = in.m_48.y;
    float _1045 = in.m_48.z;
    float _1047 = trunc(_1035);
    float _1049 = precise::max(_1047, 0.0);
    uint _1051 = uint(_1049);
    float _1053 = 0.0;
    if (!_1033)
    {
        _1053 = _180;
    }
    float _1055 = _1053;
    float _1057 = 0.0;
    float _1059 = _1055;
    if (_754)
    {
        _1057 = _1019;
    }
    float _1061 = _1057;
    float _1063 = _1061;
    if (!_754)
    {
        _1063 = _823;
    }
    float _1065 = _1063;
    int _1067 = _997 * int(_1051);
    int _1069 = _1067 + _1011;
    float _1071 = _194 * _1043;
    float _1073 = float(uint(_1069));
    float _1075 = _200 * _1043;
    float _1077 = _206 * _1043;
    float _1079 = _1043 + _993;
    float _1081 = float(uint(_973));
    float _1083 = as_type<float>(_798) * _1073;
    float _1085 = fma(_192, _1041, _1071);
    float _1087 = fma(_204, _1041, _1077);
    float _1089 = trunc(_1083);
    float _1091 = precise::max(_1089, 0.0);
    uint _1093 = uint(_1091);
    float _1095 = as_type<float>(_798) * _1081;
    float _1097 = fma(_198, _1041, _1075);
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1101 = _823 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1103 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1105 = trunc(_1095);
    float _1107 = precise::max(_1105, 0.0);
    uint _1109 = uint(_1107);
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1113 = ~_762;
    int _1115 = _1113 + 1;
    float _1117 = fma(_1103, -2.0, _1099);
    float _1119 = fma(_196, _1045, _1085);
    float _1121 = -_1111;
    float _1123 = fma(_1101, 2.0, _1121);
    float _1125 = in.m_67.z;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1131 = int(_1051) + int(_1093);
    float _1133 = -_158;
    float _1135 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1123);
    int _1137 = ~_762;
    int _1139 = _1137 + 1;
    float _1141 = 1.0 / _1129;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1147 = _1115 * int(_1109);
    int _1149 = _1147 + _973;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1151;
    float _1155 = float(uint(_1149));
    int _1157 = _1139 * _1131;
    int _1159 = _1157 + _1011;
    float _1161 = 1.0 / _1145;
    float _1163 = fma(_202, _1045, _1097);
    float _1165 = fma(_208, _1045, _1087);
    float _1167 = as_type<float>(_798) * _1155;
    bool _1169 = uint(_1159) >= uint(_762);
    float _1171 = -_184;
    float _1173 = _1171 + 1.0;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1177 = _1175 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1179 = trunc(_1167);
    float _1181 = precise::max(_1179, 0.0);
    uint _1183 = uint(_1181);
    bool _1185 = !_1169;
    int _1187 = _1185 ? 0 : (-1);
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1191 = _1189 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1193 = _1019 > 0.5;
    float _1195 = _1177 * _1141;
    int _1197 = ~_1131;
    int _1199 = _1197 + _1187;
    int _1201 = _1199 + 1;
    float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1205 = _1203 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _1207 = _1193 ? as_type<int>(_1173) : as_type<int>(_184);
    float _1209 = 1.0 / _1191;
    bool _1211 = _1125 > 0.5;
    int _1213 = _762 * _1201;
    int _1215 = _1213 + _1011;
    float _1217 = _1029 ? as_type<float>(_1207) : _184;
    float _1219 = _1153 * _1161;
    if (_1039)
    {
        float _1221 = _1211 ? _1173 : _184;
        _230 = _1221;
    }
    float _1223 = _230;
    float _1225 = _1163 + _756;
    bool _1227 = !_788;
    int _1229 = _1227 ? _1215 : (-1);
    float _1231 = 1.0 / _1205;
    int _1233 = _1229 & 3;
    bool _1235 = _1233 != 0;
    int _1237 = int(_1109) + int(_1183);
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1239;
    bool _1243 = uint(_1233) > 1u;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1249 = _1241 * _1209;
    int _1251 = _1229 & 3;
    bool _1253 = _1251 != 0;
    int _1255 = ~_762;
    int _1257 = _1255 + 1;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1261 = _1259 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _1263 = _1253 ? 0 : 1;
    float _1265 = _1247 * _1231;
    int _1267 = _1257 * _1237;
    int _1269 = _1267 + _973;
    int _1271 = ~_1263;
    int _1273 = _1271 + 1;
    int _1275 = _1273 + 1;
    float _1277 = 1.0 / _1261;
    int _1279 = _1275;
    if (!_1243)
    {
        int _1281 = ~_1263;
        int _1283 = _1281 + 1;
        _1279 = _1283;
    }
    int _1285 = _1279;
    float _1287 = _1019 * 2.0;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1293 = uint(_1269) >= uint(_762);
    float _1295 = _823 * 2.0;
    bool _1297 = uint(_1233) >= 2u;
    float _1299 = 1.0 / _1291;
    bool _1301 = !_1293;
    int _1303 = _1301 ? 0 : (-1);
    int _1305 = _1297 ? 0 : 1;
    bool _1307 = _1019 > 0.5;
    bool _1309 = _1307 && _1033;
    int _1311 = ~_1237;
    int _1313 = _1311 + _1303;
    int _1315 = _1313 + 1;
    float _1317 = floor(_1287);
    bool _1319 = _1233 != 3;
    int _1321 = _762 * _1315;
    int _1323 = _1321 + _973;
    int _1325 = _1229 >> 31;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1329 = _740 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1331;
    bool _1335 = !_788;
    int _1337 = _1335 ? _1323 : (-1);
    float _1339 = as_type<float>(_1325);
    if (_1309)
    {
        float _1341 = -_180;
        float _1343 = _1341 + 1.0;
        _232 = _1343;
    }
    float _1345 = _232;
    float _1347 = floor(_1295);
    float _1349 = _1333 * _1299;
    int _1351 = ~_1305;
    int _1353 = _1351 + 1;
    int _1355 = _1353 + 1;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _1361 = _1355;
    if (_1319)
    {
        int _1363 = ~_1305;
        int _1365 = _1363 + 1;
        _1361 = _1365;
    }
    int _1367 = _1361;
    float _1369 = _1125 * 2.0;
    bool _1371 = _1317 > 0.0;
    float _1373 = fma(_1249, _1329, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1375 = _1317 >= 0.0;
    bool _1377 = isnan(_1317);
    bool _1379 = _1375 || _1377;
    bool _1381 = isnan(0.0);
    bool _1383 = _1379 || _1381;
    float _1385 = 1.0 / _1359;
    int _1387 = _1325 & 3;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1391 = _740 + _1389;
    if (_1033)
    {
        _1059 = _1345;
    }
    float _1393 = _1059;
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1397 = _1395 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _1399 = _1229 + _1387;
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1403 = _740 + _1401;
    bool _1405 = _1233 != 3;
    float _1407 = floor(_1369);
    int _1409 = _1399 >> 2;
    float _1411 = _823 + _1019;
    bool _1413 = !_1023;
    int _1415 = _1413 ? 0 : 1;
    float _1417 = fma(_1219, _1403, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _1419 = _1409 << 4;
    int _1421 = _1419 + 368;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1425 = _740 + _1423;
    bool _1427 = _1347 >= 0.0;
    bool _1429 = isnan(_1347);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan(0.0);
    bool _1435 = _1431 || _1433;
    float _1437 = _1411 + (-1.0);
    uint _1439 = uint(int(uint(_1421) >> uint(2)));
    uint _1441 = uint(int(uint(int(_1439)) >> uint(2)));
    int _1443 = int(_1439) & 3;
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[int(_1441)][_1443];
    int _1447 = int(_1439) + 1;
    uint _1449 = uint(int(uint(_1447) >> uint(2)));
    int _1451 = _1447 & 3;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[int(_1449)][_1451];
    if (_754)
    {
        _1339 = _823;
    }
    float _1455 = _1339;
    float _1457 = fma(_1265, _1391, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1459 = !_1235;
    int _1461 = _1459 ? 0 : 1;
    float _1463 = fma(_1349, _1425, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1465 = !_1405;
    int _1467 = _1465 ? 0 : (-1);
    float _1469 = _1397 * _1277;
    float _1471 = _1455;
    if (!_754)
    {
        _1471 = _1125;
    }
    float _1473 = _1471;
    int _1475 = _1421 + 8;
    uint _1477 = uint(int(uint(_1475) >> uint(2)));
    uint _1479 = uint(int(uint(int(_1477)) >> uint(2)));
    int _1481 = int(_1477) & 3;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[int(_1479)][_1481];
    int _1485 = int(_1477) + 1;
    uint _1487 = uint(int(uint(_1485) >> uint(2)));
    int _1489 = _1485 & 3;
    float _1491 = (*spvDescriptorSet0.vp_c9)._m0[int(_1487)][_1489];
    int _1493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1495 = _1493 != 0;
    int _1497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1499 = _1497 != 0;
    int _1501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1503 = _1501 != 0;
    int _1505 = _1435 ? 0 : 1;
    bool _1507 = _1407 > 0.0;
    bool _1509 = _1407 >= 0.0;
    bool _1511 = isnan(_1407);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan(0.0);
    bool _1517 = _1513 || _1515;
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1521 = _740 + _1519;
    bool _1523 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1525 = isnan(_740);
    bool _1527 = _1523 || _1525;
    bool _1529 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1531 = _1527 || _1529;
    float _1533 = float(_1531);
    float _1535 = fma(_1195, _1521, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1537 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1539 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1541 = isnan(_740);
    bool _1543 = _1539 || _1541;
    bool _1545 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1547 = _1543 || _1545;
    float _1549 = float(_1547);
    float _1551 = -_1533;
    float _1553 = _1551 + 1.0;
    bool _1555 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1557 = isnan(_740);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1569 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1567;
    int _1571 = abs(_1461);
    float _1573 = -_1549;
    float _1575 = _1573 + 1.0;
    float _1577 = _1549 * _1553;
    float _1579 = -_1565;
    float _1581 = _1579 + 1.0;
    float _1583 = _1569 * _1385;
    float _1585 = _1565 * _1575;
    float _1587 = in.m_63.w;
    bool _1589 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1591 = isnan(_740);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1597 = _1593 || _1595;
    float _1599 = float(_1597);
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1603 = _740 + _1601;
    float _1605 = _774 * _1581;
    float _1607 = -_774;
    float _1609 = _1607 + 1.0;
    float _1611 = fma(_1583, _750, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1613 = fma(_1469, _1603, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1615 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1617 = isnan(_740);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1623 = _1619 || _1621;
    float _1625 = float(_1623);
    float _1627 = _1599 * _1609;
    float _1629 = -_1599;
    float _1631 = _1629 + 1.0;
    float _1633 = _1119 + _746;
    int _1635 = abs(_1285);
    float _1637 = _1625 * _1631;
    float _1639 = -_1625;
    float _1641 = _1639 + 1.0;
    int _1643 = ~_1635;
    int _1645 = _1643 + 1;
    int _1647 = _1645 + 1;
    float _1649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1651 = ~_1571;
    int _1653 = _1651 + 1;
    int _1655 = _1653 + 1;
    float _1657 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1659 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1661 = isnan(_740);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1667 = _1663 || _1665;
    float _1669 = float(_1667);
    int _1671 = _1647 * as_type<int>(_1453);
    int _1673 = abs(_1367);
    bool _1675 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1677 = isnan(_740);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = _1165 + _1587;
    int _1689 = _1655 * as_type<int>(_1445);
    int _1691 = _1689 + _1671;
    int _1693 = _1383 ? 0 : 1;
    float _1695 = _1685 * _1641;
    float _1697 = -_1685;
    float _1699 = _1697 + 1.0;
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1703 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1705 = _1633 + _1703;
    float _1707 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1709 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1711 = int(_1709);
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1715 = _1225 + _1713;
    float _1717 = _1705 * _1705;
    int _1719 = ~_1673;
    int _1721 = _1719 + 1;
    int _1723 = _1721 + 1;
    float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1727 = _1687 + _1725;
    float _1729 = _1669 * _1699;
    float _1731 = fma(_1715, _1715, _1717);
    float _1733 = -_1669;
    float _1735 = _1733 + 1.0;
    int _1737 = _1723 * as_type<int>(_1483);
    int _1739 = _1737 + _1691;
    int _1741 = abs(_1467);
    float _1743 = fma(_1727, _1727, _1731);
    float _1745 = _1417 * _1729;
    int _1747 = ~_1741;
    int _1749 = _1747 + 1;
    int _1751 = _1749 + 1;
    float _1753 = -_1701;
    float _1755 = fma(_1657, 2.0, _1753);
    int _1757 = abs(_1415);
    float _1759 = fma(_1707, _1223, -0.5);
    float _1761 = sqrt(_1743);
    float _1763 = float(uint(_1711));
    float _1765 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1767 = _1751 * as_type<int>(_1491);
    int _1769 = _1767 + _1739;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1773 = ~_1757;
    int _1775 = _1773 + 1;
    int _1777 = _1775 + 1;
    float _1779 = fma(_1735, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1745);
    int _1781 = abs(_1711);
    float _1783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1785 = fma(_1765, -2.0, _1771);
    int _1787 = _1769 * _1777;
    float _1789 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1791 = _1347 > 0.0;
    int _1793 = _1337 * _1757;
    int _1795 = _1793 + _1787;
    float _1797 = float(uint(_1781));
    float _1799 = 1.0 / _1763;
    float _1801 = _1789 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1803 = _1761 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1805 = float(uint(_1795));
    float _1807 = fma(_1535, _1695, _1779);
    int _1809 = ~_1693;
    int _1811 = _1809 + 1;
    int _1813 = _1811 + 1;
    float _1815 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1817 = _1079 + _1815;
    float _1819 = precise::min(_1801, _1803);
    float _1821 = rsqrt(_1743);
    float _1823 = _1783 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1825 = _1813;
    if (!_1371)
    {
        int _1827 = ~_1693;
        int _1829 = _1827 + 1;
        _1825 = _1829;
    }
    int _1831 = _1825;
    float _1833 = fma(_1373, _1637, _1807);
    int _1835 = abs(_1795);
    float _1837 = fma(_1823, _1393, -0.5);
    int _1839 = ~_1505;
    int _1841 = _1839 + 1;
    int _1843 = _1841 + 1;
    float _1845 = fma(_1817, _1817, _1717);
    float _1847 = 1.0 / _1797;
    int _1849 = as_type<int>(_1799) + (-2);
    float _1851 = fma(_1457, _1627, _1833);
    int _1853 = _1843;
    if (!_1791)
    {
        int _1855 = ~_1505;
        int _1857 = _1855 + 1;
        _1853 = _1857;
    }
    int _1859 = _1853;
    float _1861 = fma(_1727, _1727, _1845);
    int _1863 = _1517 ? 0 : 1;
    float _1865 = as_type<float>(_1849) * _1805;
    float _1867 = float(uint(_1835));
    float _1869 = _1821 * _1819;
    int _1871 = ~_1863;
    int _1873 = _1871 + 1;
    int _1875 = _1873 + 1;
    float _1877 = rsqrt(_1861);
    int _1879 = _1875;
    if (!_1507)
    {
        int _1881 = ~_1863;
        int _1883 = _1881 + 1;
        _1879 = _1883;
    }
    int _1885 = _1879;
    float _1887 = _1715 * _1869;
    float _1889 = _1705 * _1869;
    int _1891 = ~_1711;
    int _1893 = _1891 + 1;
    float _1895 = fma(_1463, _1605, _1851);
    float _1897 = -_1887;
    float _1899 = _1715 + _1897;
    int _1901 = as_type<int>(_1847) + (-2);
    float _1903 = trunc(_1865);
    float _1905 = precise::max(_1903, 0.0);
    uint _1907 = uint(_1905);
    float _1909 = -_1889;
    float _1911 = _1705 + _1909;
    float _1913 = _1899 * _1899;
    float _1915 = _1727 * _1869;
    float _1917 = as_type<float>(_1901) * _1867;
    int _1919 = ~_1711;
    int _1921 = _1919 + 1;
    float _1923 = fma(_1911, _1911, _1913);
    float _1925 = -_1915;
    float _1927 = _1727 + _1925;
    float _1929 = fma(_1613, _1585, _1895);
    float _1931 = trunc(_1917);
    float _1933 = precise::max(_1931, 0.0);
    uint _1935 = uint(_1933);
    float _1937 = fma(_1927, _1927, _1923);
    int _1939 = ~_1781;
    int _1941 = _1939 + 1;
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1945 = ~_1781;
    int _1947 = _1945 + 1;
    float _1949 = fma(_1611, _1577, _1929);
    int _1951 = _1893 * int(_1907);
    int _1953 = _1951 + _1795;
    float _1955 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1943);
    float _1957 = sqrt(_1937);
    float _1959 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1955);
    float _1961 = float(uint(_1953));
    out.m_77.w = _1819;
    float _1963 = float(_1885);
    float _1965 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1967 = _1947 * int(_1935);
    int _1969 = _1967 + _1835;
    float _1971 = as_type<float>(_1849) * _1961;
    float _1973 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1975 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1965);
    float _1977 = -_158;
    float _1979 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1755);
    float _1981 = float(uint(_1969));
    float _1983 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1973);
    float _1985 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1785);
    float _1987 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1975);
    float _1989 = trunc(_1971);
    float _1991 = precise::max(_1989, 0.0);
    uint _1993 = uint(_1991);
    float _1995 = as_type<float>(_1901) * _1981;
    float _1997 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1983);
    float _1999 = _1821 * _1957;
    float _2001 = fma(_1987, _1837, _1979);
    float _2003 = -_1985;
    float _2005 = fma(_1959, _1759, _2003);
    bool _2007 = _1711 == 0;
    float _2009 = _1789 * _1999;
    float _2011 = trunc(_1995);
    float _2013 = precise::max(_2011, 0.0);
    uint _2015 = uint(_2013);
    bool _2017 = _1997 >= 0.0;
    bool _2019 = !_1495;
    int _2021 = _2019 ? 0 : 1;
    float _2023 = _2009 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _2025 = abs(_2021);
    float _2027 = _2005 + 0.5;
    int _2029 = int(_1907) + int(_1993);
    float _2031 = _2023 * _1877;
    float _2033 = float(_2025);
    float _2035 = _2001 + 0.5;
    int _2037 = _1921 * _2029;
    int _2039 = _2037 + _1795;
    float _2041 = _1929;
    int _2043 = as_type<int>(_2035);
    float _2045 = _1915;
    if (_2017)
    {
        _2041 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2047 = _2041;
    float _2049 = _1817 * _2031;
    int _2051 = int(_1935) + int(_2015);
    out.m_79.x = _2035;
    out.m_79.y = _2027;
    bool _2053 = uint(_2039) >= uint(_1711);
    float _2055 = _2033 * _1963;
    float _2057 = -_2049;
    float _2059 = _1817 + _2057;
    int _2061 = _1941 * _2051;
    int _2063 = _2061 + _1835;
    bool _2065 = !_2053;
    int _2067 = _2065 ? 0 : (-1);
    float _2069 = _2059 * _2059;
    bool _2071 = _1711 == 0;
    float _2073 = _2049;
    if (_2017)
    {
        out.m_51.x = 0.0;
    }
    float _2075 = _1705 * _2031;
    if (_2017)
    {
        float _2077 = _2047 * 5.0;
        _2043 = as_type<int>(_2077);
    }
    int _2079 = _2043;
    bool _2081 = uint(_2063) >= uint(_1781);
    float _2083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2085 = -_2075;
    float _2087 = _1705 + _2085;
    float _2089 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1949);
    int _2091 = ~_2029;
    int _2093 = _2091 + _2067;
    int _2095 = _2093 + 1;
    if (_2017)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6948 = as_type<float>(_2079);
        out.gl_Position.z = _6948;
    }
    int _2097 = _1795 ^ _1711;
    float _2099 = fma(_2087, _2087, _2069);
    float _2101 = _1727 * _2031;
    float _2103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _2105 = uint(int(uint(_2097) >> uint(31)));
    out.m_81.x = _2089;
    float _2107 = -_2101;
    float _2109 = _1727 + _2107;
    int _2111 = ~int(_2105);
    int _2113 = _2111 + 1;
    float _2115 = fma(_2109, _2109, _2099);
    bool _2117 = !_2081;
    int _2119 = _2117 ? 0 : (-1);
    int _2121 = _1711 * _2095;
    int _2123 = _2121 + _1795;
    float _2125 = _2083 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2127 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2129 = log2(_2127);
    int _2131 = ~_2119;
    int _2133 = _2051 + _2131;
    int _2135 = _2133 + 1;
    bool _2137 = !_2071;
    int _2139 = _2137 ? _2123 : (-1);
    int _2141 = _2135 ^ _2113;
    float _2143 = _2103 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2145 = float(_2139);
    float _2147 = sqrt(_2115);
    int _2149 = ~_2113;
    int _2151 = _2149 + _2141;
    int _2153 = _2151 + 1;
    float _2155 = fma(_2125, _1017, -0.5);
    float _2157 = fma(_2125, _2145, _1135);
    float _2159 = fma(_2143, _1217, -0.5);
    bool _2161 = !_2007;
    int _2163 = _2161 ? _2153 : (-1);
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2167 = _2129 * _158;
    float _2169 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2171 = float(_2163);
    float _2173 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1117);
    float _2175 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2165);
    float _2177 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2169);
    float _2179 = exp2(_2167);
    float _2181 = -_2173;
    float _2183 = fma(_2143, _2171, _2181);
    float _2185 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2175);
    float _2187 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2177);
    bool _2189 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2191 = isnan(0.0);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2197 = _2193 || _2195;
    float _2199 = fma(_2185, _2159, _2183);
    float _2201 = fma(_2187, _2155, _2157);
    float _2203 = _2199 + 0.5;
    float _2205 = _2201 + 0.5;
    float _2207 = in.m_83.x;
    float _2209 = in.m_83.y;
    float _2211 = in.m_83.z;
    bool _2213 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2215 = isnan(1.0);
    bool _2217 = _2213 || _2215;
    bool _2219 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2221 = _2217 || _2219;
    float _2223 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2225 = 1.0 + _2223;
    float _2227 = _1877 * _2147;
    out.m_85.x = _2205;
    out.m_85.y = _2203;
    float _2229 = -_2179;
    float _2231 = _2229 + 1.0;
    float _2233 = 1.0 / _2225;
    float _2235 = _2009 * _2227;
    bool _2237 = !_1499;
    int _2239 = _2237 ? 0 : 1;
    bool _2241 = !_1503;
    int _2243 = _2241 ? 0 : 1;
    out.m_87.x = _2235;
    float _2245 = _2211;
    float _2247 = _2101;
    if (_2017)
    {
        return out;
    }
    float _2249 = -_2049;
    float _2251 = _1079 + _2249;
    float _2253 = _2055 * (-2.0);
    float _2255 = _2197 ? _2231 : 0.0;
    float _2257 = -_2075;
    float _2259 = _1633 + _2257;
    float _2261 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2263 = _2251 + _2261;
    float _2265 = _823 + (-0.5);
    float _2267 = fma(_2253, _2207, _2207);
    if (_2221)
    {
        float _2269 = _2255 * _2233;
        _162 = _2269;
    }
    float _2271 = _162;
    int _2273 = abs(_2243);
    float _2275 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2277 = _2259 + _2275;
    float _2279 = fma(_2265, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2267);
    int _2281 = abs(_2239);
    float _2283 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2285 = float(_1859);
    float _2287 = fma(_1537, _2253, _1537);
    float _2289 = float(_2281);
    float _2291 = -_2101;
    float _2293 = _1687 + _2291;
    float _2295 = fma(_2277, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2283);
    float _2297 = _1019 + _1125;
    float _2299 = _2289 * _2285;
    float _2301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2303 = _2293 + _2301;
    float _2305 = fma(_2287, _2271, _2279);
    float _2307 = _2297 + (-1.0);
    float _2309 = _2299 * (-2.0);
    float _2311 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2295);
    float _2313 = _1019 + (-0.5);
    float _2315 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2317 = fma(_2309, _2209, _2209);
    float _2319 = float(_1831);
    float _2321 = _823 + _1125;
    float _2323 = float(_2273);
    float _2325 = fma(_2315, _2309, _2315);
    bool _2327 = _2311 >= 0.0;
    float _2329 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2317);
    float _2331 = _2323 * _2319;
    float _2333 = _2321 + (-1.0);
    float _2335 = fma(_2325, _2271, _2329);
    float _2337 = _2305 * 0.15915493667125701904296875;
    float _2339 = _2331 * (-2.0);
    float _2341 = fma(_2333, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2343 = _2335 * 0.15915493667125701904296875;
    float _2345 = _1125 + (-0.5);
    float _2347 = fma(_2339, _2211, _2211);
    float _2349 = fma(_2341, _2339, _2341);
    if (_2327)
    {
        _2245 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2351 = _2245;
    float _2353 = _2337 * 6.283185482025146484375;
    float _2355 = sin(_2353);
    float _2357 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2347);
    int _2359 = as_type<int>(_2351);
    if (_2327)
    {
        out.m_51.x = 0.0;
    }
    if (_2327)
    {
        float _2361 = _2351 * 5.0;
        _2359 = as_type<int>(_2361);
    }
    int _2363 = _2359;
    float _2365 = fma(_2349, _2271, _2357);
    float _2367 = _2337 * 6.283185482025146484375;
    float _2369 = cos(_2367);
    if (_2327)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7379 = as_type<float>(_2363);
        out.gl_Position.z = _7379;
    }
    float _2371 = _2343 * 6.283185482025146484375;
    float _2373 = sin(_2371);
    float _2375 = _2343 * 6.283185482025146484375;
    float _2377 = cos(_2375);
    if (_2327)
    {
        return out;
    }
    float _2379 = in.m_89.x;
    float _2381 = in.m_89.y;
    float _2383 = in.m_89.z;
    float _2385 = _2365 * 0.15915493667125701904296875;
    float _2387 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2389 = _1999 * _2227;
    float _2391 = _2385 * 6.283185482025146484375;
    float _2393 = cos(_2391);
    float _2395 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2397 = _2369 * _2377;
    float _2399 = _2387 * _2389;
    float _2401 = _2369 * _2373;
    float _2403 = _2355 * _2373;
    float _2405 = _2395 * _2389;
    float _2407 = _2355 * _2377;
    float _2409 = _2385 * 6.283185482025146484375;
    float _2411 = sin(_2409);
    float _2413 = _2369 * _2393;
    float _2415 = _2377 * _2393;
    float _2417 = _2355 * _2393;
    float _2419 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2381);
    float _2421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2379);
    float _2423 = _2373 * _2393;
    float _2425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2383);
    float _2427 = _2399 * _2419;
    float _2429 = _2235 * _2421;
    float _2431 = fma(_2411, _2397, _2403);
    float _2433 = _2405 * _2425;
    float _2435 = _2413 * _2427;
    float _2437 = -_2407;
    float _2439 = fma(_2411, _2401, _2437);
    float _2441 = -_2427;
    float _2443 = _2411 * _2441;
    float _2445 = -_2401;
    float _2447 = fma(_2411, _2407, _2445);
    float _2449 = fma(_2431, _2429, _2435);
    float _2451 = _2417 * _2427;
    float _2453 = fma(_2415, _2429, _2443);
    float _2455 = fma(_2411, _2403, _2397);
    float _2457 = fma(_2439, _2433, _2449);
    float _2459 = fma(_2447, _2429, _2451);
    float _2461 = fma(_2423, _2433, _2453);
    float _2463 = _2457 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2465 = fma(_2455, _2433, _2459);
    float _2467 = _2457 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2469 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2463);
    float _2471 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2467);
    float _2473 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2469);
    float _2475 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2471);
    float _2477 = _2473 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2479 = _2475 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2481 = _1687 + _2477;
    float _2483 = _1633 + _2479;
    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2487 = _2481 + _2485;
    float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2491 = _2483 + _2489;
    float _2493 = _2487 * _2487;
    float _2495 = fma(_2491, _2491, _2493);
    float _2497 = _2457 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2499 = sqrt(_2495);
    float _2501 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2497);
    float _2503 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2501);
    float _2505 = _2503 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2507 = _1079 + _2505;
    bool _2509 = _2499 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2511 = _2505;
    float _2513 = _2503;
    float _2515 = _2483;
    if (!_2509)
    {
        _2511 = _2481;
    }
    float _2517 = _2511;
    float _2519 = _2517;
    if (!_2509)
    {
        _2513 = _2507;
    }
    float _2521 = _2513;
    bool _2523 = !_2509;
    float _2525 = _2521;
    if (!_2523)
    {
        float _2527 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2529 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2531 = _2499 + _2529;
        float _2533 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2535 = rsqrt(_2495);
        float _2537 = _2531 * _2527;
        float _2539 = _2537 * 0.15915493667125701904296875;
        float _2541 = _2539 * 6.283185482025146484375;
        float _2543 = sin(_2541);
        float _2545 = _2539 * 6.283185482025146484375;
        float _2547 = cos(_2545);
        float _2549 = fma(_2543, _2533, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2551 = _2535 * _2549;
        float _2553 = _2547 + (-1.0);
        float _2555 = fma(_2491, _2551, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2557 = fma(_2487, _2551, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2559 = _2553 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2561 = fma(_2507, _2547, _2559);
        _2515 = _2555;
        _2519 = _2557;
        _2525 = _2561;
    }
    float _2563 = _2515;
    float _2565 = _2519;
    float _2567 = _2525;
    float _2569 = -_1889;
    float _2571 = _2569 + _2563;
    float _2573 = -_1915;
    float _2575 = _2573 + _2565;
    float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2579 = _2571 + _2577;
    float _2581 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2583 = _2575 + _2581;
    float _2585 = fma(_2579, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2587 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _7736 = float2(_2585, _2587);
    float _2589 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_7736, float2(0.0), isnan(_7736)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_7736, float2(0.0), isnan(_7736)), level(0.0)).x;
    float _2591 = -_1887;
    float _2593 = _2591 + _1079;
    float _2595 = -_1889;
    float _2597 = _1633 + _2595;
    float _2599 = -_1079;
    float _2601 = _2599 + _2567;
    float _2603 = -_1887;
    float _2605 = _2603 + _2567;
    float _2607 = -_1687;
    float _2609 = _2607 + _2565;
    float _2611 = -_1915;
    float _2613 = _1687 + _2611;
    float _2615 = -_2075;
    float _2617 = _2615 + _2597;
    float _2619 = -_1633;
    float _2621 = _2619 + _2563;
    float _2623 = _2601 * _2601;
    float _2625 = -_2101;
    float _2627 = _2625 + _2613;
    bool _2629 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2631 = isnan(0.5);
    bool _2633 = _2629 || _2631;
    bool _2635 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2637 = _2633 || _2635;
    float _2639 = fma(_2621, _2621, _2623);
    bool _2641 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2643 = isnan(0.5);
    bool _2645 = _2641 || _2643;
    bool _2647 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2649 = _2645 || _2647;
    float _2651 = fma(_2609, _2609, _2639);
    float _2653 = sqrt(_2651);
    bool _2655 = _2653 > 0.0;
    float _2657 = _2605;
    float _2659 = _2571;
    float _2661 = _2597;
    if (!_2655)
    {
        _2045 = _2575;
    }
    float _2663 = _2045;
    float _2665 = fma(_2589, 100.0, _2593);
    float _2667 = fma(_2589, 100.0, _2605);
    float _2669 = -_2049;
    float _2671 = _2669 + _2665;
    float _2673 = _2663;
    float _2675 = _2663;
    float _2677 = _2671;
    if (!_2655)
    {
        _2657 = _2667;
    }
    float _2679 = _2657;
    float _2681 = _2671 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2683 = fma(_2617, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2681);
    float _2685 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2683);
    float _2687 = _2685 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2689 = _2671 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2691 = 1.0 / _2687;
    float _2693 = fma(_2617, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2689);
    float _2695 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2693);
    float _2697 = _2695 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2699 = _2697 + _2687;
    float _2701 = _2699 * _2691;
    float _2703 = _2701 * 0.5;
    float _2705 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2707 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2705);
    float _2709 = 1.0 / _2707;
    bool _2711 = !_2655;
    float _2713 = _2679;
    float _2715 = _2687;
    if (!_2711)
    {
        float _2717 = _224 * _224;
        float _2719 = fma(_220, _220, _2717);
        float _2721 = fma(_226, _226, _2719);
        float _2723 = rsqrt(_2651);
        float _2725 = sqrt(_2721);
        float _2727 = _2621 * _2723;
        float _2729 = _2601 * _2723;
        float _2731 = _2609 * _2723;
        bool _2733 = _2725 > 0.0;
        float _2735 = _2725;
        _2715 = _2729;
        if (!_2733)
        {
            _2735 = _2667;
        }
        float _2737 = _2735;
        _2713 = _2737;
        if (!_2733)
        {
            _2673 = _2575;
        }
        float _2739 = _2673;
        bool _2741 = !_2733;
        _2675 = _2739;
        if (!_2741)
        {
            float _2743 = rsqrt(_2721);
            float _2745 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2747 = _224 * _2743;
            float _2749 = _220 * _2743;
            float _2751 = _226 * _2743;
            float _2753 = _2729 * _2747;
            float _2755 = fma(_2727, _2749, _2753);
            float _2757 = _2745 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2759 = fma(_2731, _2751, _2755);
            float _2761 = _2759 * _2757;
            float _2763 = fma(_220, _2761, _2571);
            float _2765 = fma(_224, _2761, _2667);
            float _2767 = fma(_226, _2761, _2575);
            _2675 = _2767;
            _2659 = _2763;
            _2713 = _2765;
        }
    }
    float _2769 = _2675;
    float _2771 = _2659;
    float _2773 = _2713;
    float _2775 = _2715;
    float _2777 = -_2101;
    float _2779 = _2777 + _2769;
    float _2781 = -_2075;
    float _2783 = _2781 + _2771;
    float _2785 = -_2049;
    float _2787 = _2785 + _2773;
    float _2789 = _2787;
    float _2791 = _2783;
    float _2793 = _2779;
    float _2795 = _2771;
    float _2797 = _2775;
    if (_2649)
    {
        _2247 = 1.0;
    }
    float _2799 = _2247;
    float _2801 = _2799;
    if (!_2637)
    {
        float _2803 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2805 = _2671 + _2803;
        float _2807 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2809 = _2617 + _2807;
        float _2811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2813 = -_2613;
        float _2815 = _2813 + _2769;
        float _2817 = _2805 * _2805;
        float _2819 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2821 = _2627 + _2819;
        float _2823 = -_2665;
        float _2825 = _2823 + _2773;
        float _2827 = fma(_2809, _2809, _2817);
        float _2829 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2831 = fma(_2821, _2821, _2827);
        float _2833 = sqrt(_2831);
        float _2835 = 1.0 / _2227;
        float _2837 = _2829 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2839 = precise::min(_2833, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2841 = _2839 * _2811;
        float _2843 = _2841 * _2835;
        float _2845 = -_2597;
        float _2847 = _2845 + _2771;
        float _2849 = _2837 * _2843;
        float _2851 = _2815 * _2843;
        float _2853 = fma(_2847, _2849, _2617);
        float _2855 = fma(_2825, _2849, _2671);
        float _2857 = fma(_2837, _2851, _2627);
        _2789 = _2855;
        _2791 = _2853;
        _2793 = _2857;
    }
    float _2859 = _2789;
    float _2861 = _2791;
    float _2863 = _2793;
    if (_2649)
    {
        _2073 = 1.0;
    }
    float _2865 = _2073;
    float _2867 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2869 = _2709 * _2867;
    float _2871 = _2865;
    if (!_2649)
    {
        float _2873 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2875 = _2873 * 0.15915493667125701904296875;
        float _2877 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2879 = _2875 * 6.283185482025146484375;
        float _2881 = cos(_2879);
        float _2883 = _2877 * 0.15915493667125701904296875;
        float _2885 = _2875 * 6.283185482025146484375;
        float _2887 = sin(_2885);
        float _2889 = 1.0 / _2881;
        float _2891 = _2883 * 6.283185482025146484375;
        float _2893 = cos(_2891);
        float _2895 = _2887 * _2889;
        float _2897 = _2883 * 6.283185482025146484375;
        float _2899 = sin(_2897);
        float _2901 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2903 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2901;
        float _2905 = _2893 * _2895;
        float _2907 = 1.0 / _2903;
        float _2909 = 1.0 / _2905;
        float _2911 = _2899 * _2909;
        float _2913 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2915 = fma(_2869, _2911, _2913);
        float _2917 = _2915 * _2907;
        float _2919 = precise::clamp(_2917, 0.0, 1.0);
        _2661 = _2895;
        _2795 = _2875;
        _2801 = _2919;
    }
    float _2921 = _2661;
    float _2923 = _2795;
    float _2925 = _2801;
    float _2927 = _2923;
    float _2929 = _2921;
    if (!_2649)
    {
        float _2931 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2933 = _2931 * 0.15915493667125701904296875;
        float _2935 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2937 = _2933 * 6.283185482025146484375;
        float _2939 = cos(_2937);
        float _2941 = _2935 * 0.15915493667125701904296875;
        float _2943 = _2933 * 6.283185482025146484375;
        float _2945 = sin(_2943);
        float _2947 = 1.0 / _2939;
        float _2949 = _2941 * 6.283185482025146484375;
        float _2951 = cos(_2949);
        float _2953 = _2945 * _2947;
        float _2955 = _2941 * 6.283185482025146484375;
        float _2957 = sin(_2955);
        float _2959 = _2951 * _2953;
        float _2961 = 1.0 / _2959;
        float _2963 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2965 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2963;
        float _2967 = 1.0 / _2965;
        float _2969 = _2957 * _2961;
        float _2971 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2973 = fma(_2869, _2969, _2971);
        float _2975 = _2973 * _2967;
        float _2977 = precise::clamp(_2975, 0.0, 1.0);
        float _2979 = -_2977;
        float _2981 = _2979 + 1.0;
        _2927 = _2959;
        _2929 = _2947;
        _2871 = _2981;
    }
    float _2983 = _2927;
    float _2985 = _2929;
    float _2987 = _2871;
    float _2989 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2991 = _2859 + _2989;
    float _2993 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2995 = _2861 + _2993;
    float _2997 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2999 = _2863 + _2997;
    float _3001 = _2859 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3003 = _2991 * _2991;
    float _3005 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3001);
    float _3007 = fma(_2995, _2995, _3003);
    float _3009 = fma(_2863, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3005);
    float _3011 = fma(_2999, _2999, _3007);
    float _3013 = _3009 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3015 = rsqrt(_3011);
    float _3017 = sqrt(_3011);
    float _3019 = _3015 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3021 = _2995 * _3019;
    float _3023 = _2999 * _3019;
    float _3025 = _3021 * _3021;
    float _3027 = _3023 * _3023;
    float _3029 = _3025 + _3027;
    float _3031 = sqrt(_3029);
    bool _3033 = _3031 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3037 = _3031 + _3035;
    float _3039 = _2999;
    float _3041 = _2985;
    float _3043 = _3037;
    float _3045 = _2983;
    float _3047 = _2991;
    if (_3033)
    {
        float _3049 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3039 = _3049;
    }
    float _3051 = _3039;
    if (_3033)
    {
        float _3053 = rsqrt(_3029);
        _3041 = _3053;
    }
    float _3055 = _3041;
    float _3057 = _3055;
    if (_3033)
    {
        float _3059 = _3037 * _3051;
        _3043 = _3059;
    }
    float _3061 = _3043;
    if (_3033)
    {
        float _3063 = _3061 * 0.15915493667125701904296875;
        _3045 = _3063;
    }
    float _3065 = _3045;
    float _3067 = _3015;
    float _3069 = _3065;
    if (_3033)
    {
        float _3071 = _3065 * 6.283185482025146484375;
        float _3073 = sin(_3071);
        _3067 = _3073;
    }
    float _3075 = _3067;
    float _3077 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3079 = precise::max(0.0, _3077);
    float _3081 = _3051;
    float _3083 = _3079;
    if (_3033)
    {
        float _3085 = _3065 * 6.283185482025146484375;
        float _3087 = cos(_3085);
        _3081 = _3087;
    }
    float _3089 = _3081;
    float _3091 = -_3019;
    float _3093 = -_3079;
    float _3095 = fma(_2991, _3091, _3093);
    float _3097 = _3095;
    if (_3033)
    {
        float _3099 = _3095 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3047 = _3099;
    }
    float _3101 = _3047;
    float _3103 = _3101;
    if (!_3033)
    {
        _3069 = _3027;
    }
    float _3105 = _3069;
    float _3107 = _3075;
    float _3109 = _3105;
    if (_3033)
    {
        float _3111 = fma(_3075, _3101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3103 = _3111;
    }
    float _3113 = _3103;
    if (!_3033)
    {
        _3107 = _3025;
    }
    float _3115 = _3107;
    float _3117 = _3089;
    float _3119 = _3115;
    if (_3033)
    {
        float _3121 = _3089 + (-1.0);
        _3083 = _3121;
    }
    float _3123 = _3083;
    float _3125 = _3123;
    if (_3033)
    {
        float _3127 = _3055 * _3113;
        _2797 = _3127;
    }
    float _3129 = _2797;
    if (!_3033)
    {
        _3057 = _3021;
    }
    float _3131 = _3057;
    float _3133 = _3131;
    if (_3033)
    {
        float _3135 = _3123 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3125 = _3135;
    }
    float _3137 = _3125;
    if (_3033)
    {
        float _3139 = _3021 * _3129;
        _3133 = _3139;
    }
    float _3141 = _3133;
    float _3143 = _2859 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_3033)
    {
        float _3145 = fma(_3095, _3089, _3137);
        _3097 = _3145;
    }
    float _3147 = _3097;
    if (!_3033)
    {
        _3117 = _3023;
    }
    float _3149 = _3117;
    float _3151 = _3149;
    if (_3033)
    {
        float _3153 = _3023 * _3129;
        _3151 = _3153;
    }
    float _3155 = _3151;
    if (_3033)
    {
        float _3157 = _3141 * _3141;
        _3119 = _3157;
    }
    float _3159 = _3119;
    float _3161 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3143);
    float _3163 = fma(_2617, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_3033)
    {
        float _3165 = _3155 * _3155;
        _3109 = _3165;
    }
    float _3167 = _3109;
    float _3169 = fma(_3147, _3147, _3159);
    float _3171 = fma(_2863, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3161);
    float _3173 = floor(_3163);
    float _3175 = _3169 + _3167;
    float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3179 = fma(_3017, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3177);
    float _3181 = precise::clamp(_3179, 0.0, 1.0);
    float _3183 = _3171 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3185 = -_3181;
    float _3187 = _3185 + 1.0;
    float _3189 = rsqrt(_3175);
    float _3191 = fma(_2627, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3193 = _2859 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3195 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3197 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3199 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3193);
    float _3201 = abs(_3187);
    float _3203 = log2(_3201);
    float _3205 = _2859 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3207 = fma(_2863, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3199);
    float _3209 = -_3197;
    float _3211 = fma(_3209, _3195, 1.0);
    float _3213 = -_3173;
    float _3215 = _3163 + _3213;
    float _3217 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3205);
    float _3219 = _3207 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3221 = _3189 * _3141;
    float _3223 = fma(_2863, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3217);
    float _3225 = _3189 * _3147;
    float _3227 = _3189 * _3155;
    float _3229 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3231 = _3223 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3233 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3235 = floor(_3191);
    float _3237 = -_3229;
    float _3239 = fma(_3225, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3237);
    float _3241 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3243 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3233);
    float _3245 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3247 = -_3227;
    float _3249 = fma(_3247, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3239);
    float _3251 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3253 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3243);
    float _3255 = log2(_3211);
    float _3257 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3245);
    float _3259 = fma(_3013, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3253);
    float _3261 = _3225 + 1.0;
    float _3263 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3257);
    float _3265 = exp2(_3241);
    float _3267 = fma(_3249, -0.5, 0.5);
    float _3269 = -_3235;
    float _3271 = _3191 + _3269;
    float _3273 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3251);
    float _3275 = fma(_3249, 0.5, 0.5);
    float _3277 = fma(_3013, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3263);
    float _3279 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3273);
    float _3281 = 1.0 / _3259;
    float _3283 = fma(_3275, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3285 = _3255 * 0.693147182464599609375;
    float _3287 = fma(_3013, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3279);
    float _3289 = fma(_3275, _3283, -0.212114393711090087890625);
    float _3291 = sqrt(_3267);
    float _3293 = -_3225;
    float _3295 = fma(_3265, _3261, _3293);
    float2 _8824 = float2(_3215, _3271);
    float _3297 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8824, float2(0.0), isnan(_8824)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8824, float2(0.0), isnan(_8824)), level(0.0)).x;
    float _3299 = fma(_3275, _3289, 1.570728778839111328125);
    float _3301 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3303 = fma(_3295, 0.5, 0.5);
    float _3305 = _3277 * _3281;
    float _3307 = _3287 * _3281;
    float _3309 = fma(_3305, 0.5, 0.5);
    float _3311 = fma(_3307, -0.5, 0.5);
    float _3313 = _3291 * 0.636619746685028076171875;
    float3 _8856 = float3(_3309, _3311, _3301);
    float _3315 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8856, float3(0.0), isnan(_8856)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8856, float3(0.0), isnan(_8856)), level(0.0)).x;
    float _3317 = -_3299;
    float _3319 = fma(_3313, _3317, 1.0);
    float3 _8872 = float3(_3309, _3311, _3301);
    float4 _3322 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8872, float3(0.0), isnan(_8872)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8872, float3(0.0), isnan(_8872)), level(0.0)).xyzw;
    float _3324 = _3322.x;
    float _3326 = _3322.y;
    float _3328 = _3322.z;
    float _3330 = _3322.w;
    float2 _8888 = float2(_3319, _3303);
    float3 _3334 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8888, float2(0.0), isnan(_8888)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8888, float2(0.0), isnan(_8888)), level(0.0)).xyz;
    float _3336 = _3334.x;
    float _3338 = _3334.y;
    float _3340 = _3334.z;
    float _3342 = in.m_91.x;
    float _3344 = in.m_91.y;
    float _3346 = in.m_91.z;
    bool _3348 = _2381 != 0.0;
    bool _3350 = isnan(_2381);
    bool _3352 = _3348 || _3350;
    bool _3354 = isnan(0.0);
    bool _3356 = _3352 || _3354;
    float _3358 = _2431 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3360 = _2431 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3362 = _2431 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3364 = _2379 == 0.0;
    bool _3366 = !_3356;
    bool _3368 = _3364 && _3366;
    float _3370 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3358);
    float _3372 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3360);
    float _3374 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3362);
    bool _3376 = _2383 == 0.0;
    bool _3378 = _3376 && _3368;
    float _3380 = _2413 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3382 = _2413 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3384 = _2413 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3386 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3370);
    float _3388 = -_2411;
    float _3390 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3380);
    float _3392 = -_2411;
    float _3394 = fma(_3392, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3382);
    float _3396 = -_2411;
    float _3398 = fma(_3396, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3384);
    float _3400 = _2439 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3402 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3372);
    float _3404 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3374);
    float _3406 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3394);
    float _3408 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3400);
    float _3410 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3390);
    float _3412 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3398);
    float _3414 = _3342;
    float _3416 = _3344;
    float _3418 = _3346;
    if (!_3378)
    {
        float _3420 = fma(_2379, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3342);
        _3414 = _3420;
    }
    float _3422 = _3414;
    if (!_3378)
    {
        float _3424 = fma(_2381, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3344);
        _3416 = _3424;
    }
    float _3426 = _3416;
    float _3428 = abs(_2869);
    float _3430 = log2(_3428);
    if (!_3378)
    {
        float _3432 = fma(_2383, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3346);
        _3418 = _3432;
    }
    float _3434 = _3418;
    float _3436 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3408);
    float _3438 = _3410 * _3426;
    float _3440 = _3406 * _3426;
    float _3442 = _3412 * _3426;
    float _3444 = fma(_3386, _3422, _3438);
    float _3446 = fma(_3402, _3422, _3440);
    float _3448 = fma(_3404, _3422, _3442);
    float _3450 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3452 = fma(_3436, _3434, _3444);
    float _3454 = _2439 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3456 = _2439 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3458 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3460 = _3430 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3462 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3454);
    float _3464 = exp2(_3450);
    float _3466 = in.m_75.x;
    float _3468 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3456);
    float _3470 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3462);
    float _3472 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3458);
    bool _3474 = _2869 <= 8000.0;
    bool _3476 = isnan(_2869);
    bool _3478 = _3474 || _3476;
    bool _3480 = isnan(8000.0);
    bool _3482 = _3478 || _3480;
    float _3484 = float(_3482);
    float _3486 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3468);
    float _3488 = fma(_3470, _3434, _3446);
    float _3490 = exp2(_3460);
    float _3492 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3472);
    float _3494 = _3259 * 0.5;
    float _3496 = fma(_3486, _3434, _3448);
    float _3498 = fma(_3013, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3492);
    out.m_93.x = _2617;
    out.m_93.y = _2671;
    out.m_93.z = _2627;
    float _3500 = -_3464;
    float _3502 = _3500 + 1.0;
    bool _3504 = _3017 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3506 = isnan(_3017);
    bool _3508 = _3504 || _3506;
    bool _3510 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3512 = _3508 || _3510;
    out.gl_Position.x = _3277;
    out.gl_Position.y = _3287;
    out.gl_Position.z = _3498;
    out.gl_Position.w = _3259;
    out.m_95.x = _3452;
    out.m_95.y = _3488;
    out.m_95.z = _3496;
    float _3514 = fma(_3490, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3516 = precise::clamp(_3514, 0.0, 1.0);
    float _3518 = _3277 + _3259;
    out.m_97.x = _2861;
    out.m_97.y = _2859;
    out.m_97.z = _2863;
    float _3520 = fma(_3516, -2.0, 3.0);
    float _3522 = _3516 * _3516;
    float _3524 = _3518 * 0.5;
    float _3526 = _3259;
    if (!_3512)
    {
        _2677 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3528 = _2677;
    float _3530 = _3522 * _3520;
    float _3532 = -_3530;
    float _3534 = _3532 + 1.0;
    float _3536 = fma(_3534, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3530);
    float _3538 = fma(_3287, -0.5, _3494);
    float _3540 = _3498 + _3259;
    float _3542 = _3484 * _3536;
    float _3544 = _3540 * 0.5;
    float _3546 = _3542 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3548 = _3502 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_99.x = _3524;
    out.m_99.y = _3538;
    out.m_99.z = _3544;
    out.m_99.w = _3259;
    float _3550 = -_3548;
    float _3552 = _3550 + 1.0;
    float _3554 = _3544;
    float _3556 = _3538;
    float _3558 = _3528;
    float _3560 = _3528;
    if (!_3512)
    {
        _3526 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3562 = _3526;
    float _3564 = _3562;
    float _3566 = _3562;
    if (!_3512)
    {
        _3554 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3568 = _3554;
    float _3570 = _3568;
    float _3572 = _3568;
    if (!_3512)
    {
        _3556 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3574 = _3556;
    float _3576 = -_3297;
    float _3578 = _3576 + 1.0;
    float _3580 = _3578 * _3546;
    float _3582 = precise::clamp(_3580, 0.0, 1.0);
    float _3584 = -_3582;
    float _3586 = fma(_3584, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3588 = _3586 * _3466;
    float _3590 = _3548 * _3315;
    float _3592 = _3588 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3594 = _3330 * _3590;
    float _3596 = _3330 * _3552;
    out.m_101.x = _3592;
    float _3598 = _2925 * _2987;
    float _3600 = _3340 * _3590;
    float _3602 = fma(_3336, _3594, _3324);
    float _3604 = fma(_3338, _3594, _3326);
    float _3606 = _3598 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3608 = fma(_3330, _3600, _3328);
    float _3610 = _3594;
    float _3612 = _3598;
    float _3614 = _3574;
    float _3616 = _3574;
    if (!_3512)
    {
        _3610 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3618 = _3610;
    float _3620 = _3618;
    float _3622 = _3618;
    if (!_3512)
    {
        _3612 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3624 = _3612;
    out.m_103.x = _3602;
    out.m_103.y = _3604;
    out.m_103.z = _3608;
    out.m_103.w = _3596;
    bool _3626 = !_3512;
    float _3628 = _3624;
    float _3630 = _3624;
    if (!_3626)
    {
        bool _3632 = _3017 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3634 = isnan(_3017);
        bool _3636 = _3632 || _3634;
        bool _3638 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3640 = _3636 || _3638;
        if (!_3640)
        {
            float _3642 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3644 = _3017 + _3642;
            float _3646 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3648 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3646;
            float _3650 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3652 = _3650 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3654 = 1.0 / _3648;
            float _3656 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3658 = _3656 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3660 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3662 = _3660 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3664 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3666 = _3664 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3668 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3670 = _3668 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3672 = _3644 * _3654;
            float _3674 = precise::clamp(_3672, 0.0, 1.0);
            float _3676 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3678 = _3676 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3680 = fma(_3674, _3652, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3682 = fma(_3674, _3678, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3684 = fma(_3674, _3658, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3686 = fma(_3674, _3662, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3688 = fma(_3674, _3666, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3690 = fma(_3674, _3670, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3622 = _3684;
            _3616 = _3688;
            _3560 = _3680;
            _3572 = _3686;
            _3566 = _3682;
            _3630 = _3690;
            _3692 = true;
        }
        else
        {
            bool _3694 = _3017 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3696 = isnan(_3017);
            bool _3698 = _3694 || _3696;
            bool _3700 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3702 = _3698 || _3700;
            if (!_3702)
            {
                _3558 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3704 = _3558;
            _3560 = _3704;
            if (!_3702)
            {
                _3620 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3706 = _3620;
            _3622 = _3706;
            if (!_3702)
            {
                _3564 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3708 = _3564;
            _3566 = _3708;
            if (!_3702)
            {
                _3570 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3710 = _3570;
            _3572 = _3710;
            if (!_3702)
            {
                _3614 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3712 = _3614;
            _3616 = _3712;
            if (!_3702)
            {
                _3628 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3714 = _3628;
            bool _3716 = !_3702;
            _3630 = _3714;
            if (!_3716)
            {
                bool _3718 = _3017 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3720 = isnan(_3017);
                bool _3722 = _3718 || _3720;
                bool _3724 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3726 = _3722 || _3724;
                if (!_3726)
                {
                    float _3728 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3730 = _3017 + _3728;
                    float _3732 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3734 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3732;
                    float _3736 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3738 = _3736 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3740 = 1.0 / _3734;
                    float _3742 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3744 = _3742 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3748 = _3746 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3750 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3752 = _3750 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3754 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3756 = _3754 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3758 = _3730 * _3740;
                    float _3760 = precise::clamp(_3758, 0.0, 1.0);
                    float _3762 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3764 = _3762 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3766 = fma(_3760, _3738, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3768 = fma(_3760, _3764, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3770 = fma(_3760, _3744, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3772 = fma(_3760, _3748, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3774 = fma(_3760, _3752, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3776 = fma(_3760, _3756, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3622 = _3770;
                    _3616 = _3774;
                    _3560 = _3766;
                    _3572 = _3772;
                    _3566 = _3768;
                    _3630 = _3776;
                    _3692 = true;
                }
                else
                {
                    _3622 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3616 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3560 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3572 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3566 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3630 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3692 = false;
    float _3778 = _3622;
    float _3780 = _3616;
    float _3782 = _3560;
    float _3784 = _3572;
    float _3786 = _3566;
    float _3788 = _3630;
    float _3790 = _3606 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3792 = fma(_3488, -0.5, 0.5);
    float _3794 = precise::clamp(_3792, 0.0, 1.0);
    float _3796 = -_3778;
    float _3798 = _3796 + _3780;
    float _3800 = -_3782;
    float _3802 = _3800 + _3784;
    out.m_105.x = 0.0;
    float _3804 = fma(_3794, _3798, _3778);
    float _3806 = -_3786;
    float _3808 = _3806 + _3788;
    float _3810 = fma(_3794, _3802, _3782);
    float _3812 = _3804 * 0.586610972881317138671875;
    bool _3814 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3816 = fma(_3794, _3808, _3786);
    out.m_51.x = _3790;
    float _3818 = fma(_3810, 0.298911988735198974609375, _3812);
    bool _3820 = _2925 > 0.0;
    bool _3822 = isnan(_2925);
    bool _3824 = _3820 || _3822;
    bool _3826 = isnan(0.0);
    bool _3828 = _3824 || _3826;
    float _3830 = fma(_3816, 0.114477999508380889892578125, _3818);
    bool _3832 = _2987 <= 0.0;
    bool _3834 = !_3828;
    bool _3836 = _3832 || _3834;
    float _3838 = -_3830;
    float _3840 = _3810 + _3838;
    float _3842 = -_3830;
    float _3844 = _3804 + _3842;
    float _3846 = -_3830;
    float _3848 = _3816 + _3846;
    float _3850 = fma(_3840, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3830);
    float _3852 = fma(_3844, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3830);
    float _3854 = fma(_3848, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3830);
    bool _3856 = !_3814;
    if (!_3856)
    {
        float _3858 = -_2859;
        float _3860 = _3858 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3862 = -_2861;
        float _3864 = _3862 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3866 = -_2863;
        float _3868 = _3866 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3870 = _3860 * _3860;
        float _3872 = fma(_3864, _3864, _3870);
        float _3874 = fma(_3868, _3868, _3872);
        float _3876 = sqrt(_3874);
        float _3878 = rsqrt(_3874);
        float _3880 = -_3876;
        float _3882 = _3880 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3884 = _3882 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3886 = precise::clamp(_3884, 0.0, 1.0);
        float _3888 = _3864 * _3878;
        float _3890 = _3860 * _3878;
        float _3892 = abs(_3886);
        float _3894 = log2(_3892);
        float _3896 = _3868 * _3878;
        float _3898 = _3888 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3900 = _3488 * _3890;
        float _3902 = -_3890;
        float _3904 = -_3898;
        float _3906 = fma(_3902, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3904);
        float _3908 = fma(_3452, _3888, _3900);
        float _3910 = -_3896;
        float _3912 = fma(_3910, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3906);
        float _3914 = fma(_3496, _3896, _3908);
        float _3916 = precise::clamp(_3914, 0.0, 1.0);
        float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3920 = _3912 + _3918;
        float _3922 = _3894 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3924 = _3920 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3926 = precise::clamp(_3924, 0.0, 1.0);
        float _3928 = exp2(_3922);
        float _3930 = _3928 * _3926;
        float _3932 = _3916 * _3930;
        float _3934 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3936 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3938 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _3934;
        out.m_105.y = _3936;
        out.m_105.z = _3938;
    }
    out.m_77.x = _3850;
    out.m_77.y = _3852;
    out.m_77.z = _3854;
    if (!_3836)
    {
        return out;
    }
    float _3940 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3940;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3692 = false;
    bool _732 = false;
    bool _628 = false;
    bool _486 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_48.w;
    float _121 = trunc(_119);
    int _124 = int(_121);
    bool _128 = _124 >= 1;
    float _130 = 0.0;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    float _134 = _132;
    if (!_128)
    {
        out.m_51.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _132 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3997 = as_type<float>(_140);
        out.gl_Position.z = _3997;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_53.w;
    bool _146 = _144 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_144);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = -_144;
    float _158 = _156 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _160 = 0.0;
    float _162 = _158;
    if (_154)
    {
        float _164 = float(_124);
        _160 = _164;
    }
    float _166 = _160;
    bool _168 = _158 >= _166;
    bool _170 = !_154;
    bool _172 = _168 || _170;
    if (_172)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _134;
    if (_172)
    {
        out.m_51.x = 0.0;
    }
    if (_172)
    {
        float _176 = _174 * 5.0;
        _142 = as_type<int>(_176);
    }
    int _178 = _142;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4066 = as_type<float>(_178);
        out.gl_Position.z = _4066;
    }
    if (_172)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _180 = in.m_55.x;
    bool _182 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _184 = in.m_55.y;
    float _186 = in.m_57.x;
    float _188 = in.m_57.y;
    float _190 = in.m_57.z;
    float _192 = in.m_59.x;
    float _194 = in.m_59.y;
    float _196 = in.m_59.z;
    float _198 = in.m_61.x;
    float _200 = in.m_61.y;
    float _202 = in.m_61.z;
    float _204 = in.m_63.x;
    float _206 = in.m_63.y;
    float _208 = in.m_63.z;
    out.m_65.x = _180;
    out.m_65.y = _184;
    float _210 = _188 * _194;
    float _212 = _188 * _200;
    float _214 = fma(_186, _192, _210);
    float _216 = _188 * _206;
    float _218 = fma(_186, _198, _212);
    float _220 = fma(_190, _196, _214);
    float _222 = fma(_186, _204, _216);
    float _224 = fma(_190, _202, _218);
    float _226 = fma(_190, _208, _222);
    bool _228 = !_182;
    float _230 = _184;
    float _232 = _180;
    float _250;
    if (!_228)
    {
        float _234 = in.m_67.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _158);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_124);
        float _256 = 1.0 / _254;
        float _258 = _158 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _260 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = _260 + _282;
    float _286 = 1.0 / _276;
    bool _288 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _290 = isnan(_260);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    bool _300 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _302 = isnan(_260);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = 1.0 / _272;
    bool _314 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _316 = isnan(_260);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _328 = -_324;
    float _330 = _328 + 1.0;
    float _332 = 1.0 / _280;
    float _334 = _268 * _286;
    float _336 = _264 * _312;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _346;
    float _350 = fma(_340, _336, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _352 = _298 * _330;
    float _354 = fma(_348, _336, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = _284 * _332;
    bool _358 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _360 = isnan(_260);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = fma(_344, _336, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _372 = -_298;
    float _374 = _372 + 1.0;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _388 = -_368;
    float _390 = _388 + 1.0;
    float _392 = _368 * _374;
    float _394 = fma(_378, _334, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _396 = fma(_382, _334, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _398 = fma(_386, _334, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _400 = _310 * _390;
    float _402 = in.m_69.x;
    float _404 = in.m_69.y;
    float _406 = in.m_69.z;
    float _408 = -_310;
    float _410 = _408 + 1.0;
    float _412 = _370 * _400;
    float _414 = _354 * _400;
    float _416 = _350 * _400;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    float _426 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[143].x, _412);
    float _428 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[143].y, _414);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _430;
    float _434 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[143].z, _416);
    float _436 = fma(_420, _356, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _438 = fma(_424, _356, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _440 = fma(_394, _392, _426);
    float _442 = fma(_396, _392, _428);
    float _444 = fma(_432, _356, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _446 = fma(_398, _392, _434);
    float _448 = fma(_436, _352, _440);
    float _450 = fma(_438, _352, _442);
    float _452 = fma(_444, _352, _446);
    float _454 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].x, _448);
    float _456 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].y, _450);
    float _458 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[146].z, _452);
    float _460 = _454 * _402;
    float _462 = _456 * _404;
    float _464 = _458 * _406;
    bool _466 = !_326;
    float _484;
    if (!_466)
    {
        float _468 = in.m_67.x;
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _472 = _468 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[11].y, _158);
        float _476 = _474 * _470;
        float _478 = floor(_476);
        float _480 = -_478;
        float _482 = _476 + _480;
        _484 = _482;
        _486 = true;
    }
    else
    {
        float _488 = float(_124);
        float _490 = 1.0 / _488;
        float _492 = _158 * _490;
        _484 = _492;
    }
    _486 = false;
    float _494 = _484;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _498 = _494 + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _504 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _506 = isnan(_494);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _520 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _522 = isnan(_494);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _532;
    bool _536 = _494 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _538 = isnan(_494);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = 1.0 / _502;
    float _550 = -_514;
    float _552 = _550 + 1.0;
    bool _554 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _556 = _530 * _552;
    float _558 = -_530;
    float _560 = _558 + 1.0;
    float _562 = 1.0 / _518;
    float _564 = _534 * _548;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _570 = fma(_564, _498, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _572 = _568 * _562;
    float _574 = _570 * _556;
    float _576 = -_546;
    float _578 = _576 + 1.0;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _582 = _494 + _580;
    float _584 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[115].x, _574);
    float _586 = _514 * _578;
    float _588 = fma(_572, _582, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _592 = fma(_588, _586, _584);
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _598 = fma(_546, (*spvDescriptorSet0.vp_c9)._m0[117].x, _592);
    float _600 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _606 = _598 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_71.x = _600;
    out.m_71.y = _602;
    out.m_71.z = _604;
    out.m_71.w = _606;
    bool _608 = !_554;
    float _626;
    if (!_608)
    {
        float _610 = in.m_67.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].w, _158);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        float _630 = float(_124);
        float _632 = 1.0 / _630;
        float _634 = _158 * _632;
        _626 = _634;
    }
    _628 = false;
    float _636 = _626;
    bool _638 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _640 = isnan(_636);
    bool _642 = _638 || _640;
    bool _644 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _654 = _636 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _656 = isnan(_636);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _672 = _636 + _670;
    float _674 = -_648;
    float _676 = _674 + 1.0;
    float _678 = 1.0 / _652;
    float _680 = _664 * _676;
    float _682 = -_664;
    float _684 = _682 + 1.0;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _688 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _692 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _668 * _678;
    float _698 = fma(_696, _672, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _700 = _698 * _680;
    float _702 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[131].x, _700);
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _706 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[132].x, _702);
    float _708 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _706 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_73.x = _692;
    out.m_73.y = _708;
    out.m_73.z = _694;
    out.m_73.w = _710;
    bool _712 = !_688;
    float _730;
    if (!_712)
    {
        float _714 = in.m_67.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[14].x, _158);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        float _734 = float(_124);
        float _736 = 1.0 / _734;
        float _738 = _158 * _736;
        _730 = _738;
    }
    _732 = false;
    float _740 = _730;
    float _742 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _744 = int(_742);
    float _746 = in.m_59.w;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _750 = _740 + _748;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _754 = _752 != 0;
    float _756 = in.m_61.w;
    float _758 = float(_124);
    float _760 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _762 = int(_760);
    bool _764 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _766 = isnan(_740);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = float(_744);
    float _778 = 1.0 / _758;
    float _780 = float(uint(_762));
    float _782 = 1.0 / _776;
    int _784 = ~_762;
    int _786 = _784 + 1;
    bool _788 = _762 == 0;
    float _790 = 1.0 / _780;
    float _792 = _782 * _158;
    float _794 = trunc(_792);
    int _796 = int(_794);
    int _798 = as_type<int>(_790) + (-2);
    float _800 = float(uint(_796));
    float _802 = as_type<float>(_798) * _800;
    int _804 = ~_762;
    int _806 = _804 + 1;
    float _808 = trunc(_802);
    float _810 = precise::max(_808, 0.0);
    uint _813 = uint(_810);
    int _815 = _806 * int(_813);
    int _817 = _815 + _796;
    float _819 = float(uint(_817));
    float _821 = as_type<float>(_798) * _819;
    float _823 = in.m_67.x;
    float _825 = trunc(_821);
    float _827 = precise::max(_825, 0.0);
    uint _829 = uint(_827);
    bool _831 = !_754;
    float _833 = _831 ? 7.345489978790283203125 : 1.0;
    int _835 = int(_813) + int(_829);
    float _837 = float(_762);
    float _839 = float(_796);
    float _841 = _833 * _823;
    bool _843 = _839 >= _837;
    bool _845 = isnan(_839);
    bool _847 = _843 || _845;
    bool _849 = isnan(_837);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    int _855 = _786 * _835;
    int _857 = _855 + _796;
    bool _859 = uint(_857) >= uint(_762);
    float _861 = trunc(_853);
    int _863 = int(_861);
    bool _865 = !_859;
    int _867 = _865 ? 0 : (-1);
    int _869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _871 = _869 != 0;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _879 = _877 != 0;
    int _881 = ~_835;
    int _883 = _881 + _867;
    int _885 = _883 + 1;
    float _887 = floor(_841);
    int _889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _891 = _889 != 0;
    int _893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _895 = _893 != 0;
    int _897 = _762 * _885;
    int _899 = _897 + _796;
    int _901 = ~_863;
    int _903 = _901 + 1;
    int _905 = _903 + 1;
    bool _907 = !_788;
    int _909 = _907 ? _899 : (-1);
    int _911 = _909 * _905;
    float _913 = -_887;
    float _915 = _841 + _913;
    int _917 = _762 + (-1);
    float _919 = _915 * _837;
    float _921 = _837 * _158;
    bool _923 = !_875;
    int _925 = _923 ? 0 : 1;
    int _927 = _863 * _917;
    int _929 = _927 + _911;
    float _931 = trunc(_919);
    int _933 = int(_931);
    float _935 = _921 * _778;
    bool _937 = !_891;
    int _939 = _937 ? 0 : 1;
    bool _941 = !_871;
    int _943 = _941 ? 0 : 1;
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _947 = _945 != 0;
    float _949 = trunc(_935);
    int _951 = int(_949);
    int _953 = abs(_925);
    bool _955 = !_879;
    int _957 = _955 ? 0 : 1;
    int _959 = abs(_939);
    int _961 = abs(_943);
    int _963 = abs(_957);
    int _965 = _929 * _953;
    bool _967 = !_947;
    int _969 = _967 ? 0 : 1;
    int _971 = _933 * _959;
    int _973 = _971 + _796;
    int _975 = _929;
    bool _977 = _947;
    float _979 = as_type<float>(_959);
    if (_895)
    {
        float _981 = -_180;
        float _983 = _981 + 1.0;
        _975 = as_type<int>(_983);
    }
    int _985 = _975;
    int _987 = abs(_969);
    int _989 = _951 * _961;
    int _991 = _989 + _965;
    float _993 = in.m_75.y;
    int _995 = ~_762;
    int _997 = _995 + 1;
    int _999 = _973 * _963;
    int _1001 = _999 + _991;
    if (_895)
    {
        bool _1003 = _823 > 0.5;
        _977 = _1003;
    }
    bool _1005 = _977;
    if (!_895)
    {
        _979 = _180;
    }
    float _1007 = _979;
    int _1009 = _933 * _987;
    int _1011 = _1009 + _1001;
    float _1013 = _1007;
    if (_895)
    {
        float _1015 = _1005 ? as_type<float>(_985) : _180;
        _1013 = _1015;
    }
    float _1017 = _1013;
    float _1019 = in.m_67.y;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1023 = _1021 != 0;
    float _1025 = float(uint(_1011));
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1029 = _1027 != 0;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1033 = _1031 != 0;
    float _1035 = as_type<float>(_798) * _1025;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1039 = _1037 != 0;
    float _1041 = in.m_48.x;
    float _1043 = in.m_48.y;
    float _1045 = in.m_48.z;
    float _1047 = trunc(_1035);
    float _1049 = precise::max(_1047, 0.0);
    uint _1051 = uint(_1049);
    float _1053 = 0.0;
    if (!_1033)
    {
        _1053 = _180;
    }
    float _1055 = _1053;
    float _1057 = 0.0;
    float _1059 = _1055;
    if (_754)
    {
        _1057 = _1019;
    }
    float _1061 = _1057;
    float _1063 = _1061;
    if (!_754)
    {
        _1063 = _823;
    }
    float _1065 = _1063;
    int _1067 = _997 * int(_1051);
    int _1069 = _1067 + _1011;
    float _1071 = _194 * _1043;
    float _1073 = float(uint(_1069));
    float _1075 = _200 * _1043;
    float _1077 = _206 * _1043;
    float _1079 = _1043 + _993;
    float _1081 = float(uint(_973));
    float _1083 = as_type<float>(_798) * _1073;
    float _1085 = fma(_192, _1041, _1071);
    float _1087 = fma(_204, _1041, _1077);
    float _1089 = trunc(_1083);
    float _1091 = precise::max(_1089, 0.0);
    uint _1093 = uint(_1091);
    float _1095 = as_type<float>(_798) * _1081;
    float _1097 = fma(_198, _1041, _1075);
    float _1099 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1101 = _823 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1103 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1105 = trunc(_1095);
    float _1107 = precise::max(_1105, 0.0);
    uint _1109 = uint(_1107);
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1113 = ~_762;
    int _1115 = _1113 + 1;
    float _1117 = fma(_1103, -2.0, _1099);
    float _1119 = fma(_196, _1045, _1085);
    float _1121 = -_1111;
    float _1123 = fma(_1101, 2.0, _1121);
    float _1125 = in.m_67.z;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _1131 = int(_1051) + int(_1093);
    float _1133 = -_158;
    float _1135 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1123);
    int _1137 = ~_762;
    int _1139 = _1137 + 1;
    float _1141 = 1.0 / _1129;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _1147 = _1115 * int(_1109);
    int _1149 = _1147 + _973;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1151;
    float _1155 = float(uint(_1149));
    int _1157 = _1139 * _1131;
    int _1159 = _1157 + _1011;
    float _1161 = 1.0 / _1145;
    float _1163 = fma(_202, _1045, _1097);
    float _1165 = fma(_208, _1045, _1087);
    float _1167 = as_type<float>(_798) * _1155;
    bool _1169 = uint(_1159) >= uint(_762);
    float _1171 = -_184;
    float _1173 = _1171 + 1.0;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1177 = _1175 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1179 = trunc(_1167);
    float _1181 = precise::max(_1179, 0.0);
    uint _1183 = uint(_1181);
    bool _1185 = !_1169;
    int _1187 = _1185 ? 0 : (-1);
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1191 = _1189 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1193 = _1019 > 0.5;
    float _1195 = _1177 * _1141;
    int _1197 = ~_1131;
    int _1199 = _1197 + _1187;
    int _1201 = _1199 + 1;
    float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1205 = _1203 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _1207 = _1193 ? as_type<int>(_1173) : as_type<int>(_184);
    float _1209 = 1.0 / _1191;
    bool _1211 = _1125 > 0.5;
    int _1213 = _762 * _1201;
    int _1215 = _1213 + _1011;
    float _1217 = _1029 ? as_type<float>(_1207) : _184;
    float _1219 = _1153 * _1161;
    if (_1039)
    {
        float _1221 = _1211 ? _1173 : _184;
        _230 = _1221;
    }
    float _1223 = _230;
    float _1225 = _1163 + _756;
    bool _1227 = !_788;
    int _1229 = _1227 ? _1215 : (-1);
    float _1231 = 1.0 / _1205;
    int _1233 = _1229 & 3;
    bool _1235 = _1233 != 0;
    int _1237 = int(_1109) + int(_1183);
    float _1239 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1241 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1239;
    bool _1243 = uint(_1233) > 1u;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1249 = _1241 * _1209;
    int _1251 = _1229 & 3;
    bool _1253 = _1251 != 0;
    int _1255 = ~_762;
    int _1257 = _1255 + 1;
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1261 = _1259 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _1263 = _1253 ? 0 : 1;
    float _1265 = _1247 * _1231;
    int _1267 = _1257 * _1237;
    int _1269 = _1267 + _973;
    int _1271 = ~_1263;
    int _1273 = _1271 + 1;
    int _1275 = _1273 + 1;
    float _1277 = 1.0 / _1261;
    int _1279 = _1275;
    if (!_1243)
    {
        int _1281 = ~_1263;
        int _1283 = _1281 + 1;
        _1279 = _1283;
    }
    int _1285 = _1279;
    float _1287 = _1019 * 2.0;
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1293 = uint(_1269) >= uint(_762);
    float _1295 = _823 * 2.0;
    bool _1297 = uint(_1233) >= 2u;
    float _1299 = 1.0 / _1291;
    bool _1301 = !_1293;
    int _1303 = _1301 ? 0 : (-1);
    int _1305 = _1297 ? 0 : 1;
    bool _1307 = _1019 > 0.5;
    bool _1309 = _1307 && _1033;
    int _1311 = ~_1237;
    int _1313 = _1311 + _1303;
    int _1315 = _1313 + 1;
    float _1317 = floor(_1287);
    bool _1319 = _1233 != 3;
    int _1321 = _762 * _1315;
    int _1323 = _1321 + _973;
    int _1325 = _1229 >> 31;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1329 = _740 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1331;
    bool _1335 = !_788;
    int _1337 = _1335 ? _1323 : (-1);
    float _1339 = as_type<float>(_1325);
    if (_1309)
    {
        float _1341 = -_180;
        float _1343 = _1341 + 1.0;
        _232 = _1343;
    }
    float _1345 = _232;
    float _1347 = floor(_1295);
    float _1349 = _1333 * _1299;
    int _1351 = ~_1305;
    int _1353 = _1351 + 1;
    int _1355 = _1353 + 1;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _1361 = _1355;
    if (_1319)
    {
        int _1363 = ~_1305;
        int _1365 = _1363 + 1;
        _1361 = _1365;
    }
    int _1367 = _1361;
    float _1369 = _1125 * 2.0;
    bool _1371 = _1317 > 0.0;
    float _1373 = fma(_1249, _1329, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1375 = _1317 >= 0.0;
    bool _1377 = isnan(_1317);
    bool _1379 = _1375 || _1377;
    bool _1381 = isnan(0.0);
    bool _1383 = _1379 || _1381;
    float _1385 = 1.0 / _1359;
    int _1387 = _1325 & 3;
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1391 = _740 + _1389;
    if (_1033)
    {
        _1059 = _1345;
    }
    float _1393 = _1059;
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1397 = _1395 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _1399 = _1229 + _1387;
    float _1401 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1403 = _740 + _1401;
    bool _1405 = _1233 != 3;
    float _1407 = floor(_1369);
    int _1409 = _1399 >> 2;
    float _1411 = _823 + _1019;
    bool _1413 = !_1023;
    int _1415 = _1413 ? 0 : 1;
    float _1417 = fma(_1219, _1403, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _1419 = _1409 << 4;
    int _1421 = _1419 + 368;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1425 = _740 + _1423;
    bool _1427 = _1347 >= 0.0;
    bool _1429 = isnan(_1347);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan(0.0);
    bool _1435 = _1431 || _1433;
    float _1437 = _1411 + (-1.0);
    uint _1439 = uint(int(uint(_1421) >> uint(2)));
    uint _1441 = uint(int(uint(int(_1439)) >> uint(2)));
    int _1443 = int(_1439) & 3;
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[int(_1441)][_1443];
    int _1447 = int(_1439) + 1;
    uint _1449 = uint(int(uint(_1447) >> uint(2)));
    int _1451 = _1447 & 3;
    float _1453 = (*spvDescriptorSet0.vp_c9)._m0[int(_1449)][_1451];
    if (_754)
    {
        _1339 = _823;
    }
    float _1455 = _1339;
    float _1457 = fma(_1265, _1391, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1459 = !_1235;
    int _1461 = _1459 ? 0 : 1;
    float _1463 = fma(_1349, _1425, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1465 = !_1405;
    int _1467 = _1465 ? 0 : (-1);
    float _1469 = _1397 * _1277;
    float _1471 = _1455;
    if (!_754)
    {
        _1471 = _1125;
    }
    float _1473 = _1471;
    int _1475 = _1421 + 8;
    uint _1477 = uint(int(uint(_1475) >> uint(2)));
    uint _1479 = uint(int(uint(int(_1477)) >> uint(2)));
    int _1481 = int(_1477) & 3;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[int(_1479)][_1481];
    int _1485 = int(_1477) + 1;
    uint _1487 = uint(int(uint(_1485) >> uint(2)));
    int _1489 = _1485 & 3;
    float _1491 = (*spvDescriptorSet0.vp_c9)._m0[int(_1487)][_1489];
    int _1493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1495 = _1493 != 0;
    int _1497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1499 = _1497 != 0;
    int _1501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1503 = _1501 != 0;
    int _1505 = _1435 ? 0 : 1;
    bool _1507 = _1407 > 0.0;
    bool _1509 = _1407 >= 0.0;
    bool _1511 = isnan(_1407);
    bool _1513 = _1509 || _1511;
    bool _1515 = isnan(0.0);
    bool _1517 = _1513 || _1515;
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1521 = _740 + _1519;
    bool _1523 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1525 = isnan(_740);
    bool _1527 = _1523 || _1525;
    bool _1529 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1531 = _1527 || _1529;
    float _1533 = float(_1531);
    float _1535 = fma(_1195, _1521, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1537 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1539 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1541 = isnan(_740);
    bool _1543 = _1539 || _1541;
    bool _1545 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1547 = _1543 || _1545;
    float _1549 = float(_1547);
    float _1551 = -_1533;
    float _1553 = _1551 + 1.0;
    bool _1555 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1557 = isnan(_740);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1569 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1567;
    int _1571 = abs(_1461);
    float _1573 = -_1549;
    float _1575 = _1573 + 1.0;
    float _1577 = _1549 * _1553;
    float _1579 = -_1565;
    float _1581 = _1579 + 1.0;
    float _1583 = _1569 * _1385;
    float _1585 = _1565 * _1575;
    float _1587 = in.m_63.w;
    bool _1589 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1591 = isnan(_740);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1597 = _1593 || _1595;
    float _1599 = float(_1597);
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1603 = _740 + _1601;
    float _1605 = _774 * _1581;
    float _1607 = -_774;
    float _1609 = _1607 + 1.0;
    float _1611 = fma(_1583, _750, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1613 = fma(_1469, _1603, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1615 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1617 = isnan(_740);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1623 = _1619 || _1621;
    float _1625 = float(_1623);
    float _1627 = _1599 * _1609;
    float _1629 = -_1599;
    float _1631 = _1629 + 1.0;
    float _1633 = _1119 + _746;
    int _1635 = abs(_1285);
    float _1637 = _1625 * _1631;
    float _1639 = -_1625;
    float _1641 = _1639 + 1.0;
    int _1643 = ~_1635;
    int _1645 = _1643 + 1;
    int _1647 = _1645 + 1;
    float _1649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1651 = ~_1571;
    int _1653 = _1651 + 1;
    int _1655 = _1653 + 1;
    float _1657 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1659 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1661 = isnan(_740);
    bool _1663 = _1659 || _1661;
    bool _1665 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1667 = _1663 || _1665;
    float _1669 = float(_1667);
    int _1671 = _1647 * as_type<int>(_1453);
    int _1673 = abs(_1367);
    bool _1675 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1677 = isnan(_740);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = _1165 + _1587;
    int _1689 = _1655 * as_type<int>(_1445);
    int _1691 = _1689 + _1671;
    int _1693 = _1383 ? 0 : 1;
    float _1695 = _1685 * _1641;
    float _1697 = -_1685;
    float _1699 = _1697 + 1.0;
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1703 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1705 = _1633 + _1703;
    float _1707 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1709 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1711 = int(_1709);
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1715 = _1225 + _1713;
    float _1717 = _1705 * _1705;
    int _1719 = ~_1673;
    int _1721 = _1719 + 1;
    int _1723 = _1721 + 1;
    float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1727 = _1687 + _1725;
    float _1729 = _1669 * _1699;
    float _1731 = fma(_1715, _1715, _1717);
    float _1733 = -_1669;
    float _1735 = _1733 + 1.0;
    int _1737 = _1723 * as_type<int>(_1483);
    int _1739 = _1737 + _1691;
    int _1741 = abs(_1467);
    float _1743 = fma(_1727, _1727, _1731);
    float _1745 = _1417 * _1729;
    int _1747 = ~_1741;
    int _1749 = _1747 + 1;
    int _1751 = _1749 + 1;
    float _1753 = -_1701;
    float _1755 = fma(_1657, 2.0, _1753);
    int _1757 = abs(_1415);
    float _1759 = fma(_1707, _1223, -0.5);
    float _1761 = sqrt(_1743);
    float _1763 = float(uint(_1711));
    float _1765 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1767 = _1751 * as_type<int>(_1491);
    int _1769 = _1767 + _1739;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _1773 = ~_1757;
    int _1775 = _1773 + 1;
    int _1777 = _1775 + 1;
    float _1779 = fma(_1735, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1745);
    int _1781 = abs(_1711);
    float _1783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1785 = fma(_1765, -2.0, _1771);
    int _1787 = _1769 * _1777;
    float _1789 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1791 = _1347 > 0.0;
    int _1793 = _1337 * _1757;
    int _1795 = _1793 + _1787;
    float _1797 = float(uint(_1781));
    float _1799 = 1.0 / _1763;
    float _1801 = _1789 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1803 = _1761 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1805 = float(uint(_1795));
    float _1807 = fma(_1535, _1695, _1779);
    int _1809 = ~_1693;
    int _1811 = _1809 + 1;
    int _1813 = _1811 + 1;
    float _1815 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1817 = _1079 + _1815;
    float _1819 = precise::min(_1801, _1803);
    float _1821 = rsqrt(_1743);
    float _1823 = _1783 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1825 = _1813;
    if (!_1371)
    {
        int _1827 = ~_1693;
        int _1829 = _1827 + 1;
        _1825 = _1829;
    }
    int _1831 = _1825;
    float _1833 = fma(_1373, _1637, _1807);
    int _1835 = abs(_1795);
    float _1837 = fma(_1823, _1393, -0.5);
    int _1839 = ~_1505;
    int _1841 = _1839 + 1;
    int _1843 = _1841 + 1;
    float _1845 = fma(_1817, _1817, _1717);
    float _1847 = 1.0 / _1797;
    int _1849 = as_type<int>(_1799) + (-2);
    float _1851 = fma(_1457, _1627, _1833);
    int _1853 = _1843;
    if (!_1791)
    {
        int _1855 = ~_1505;
        int _1857 = _1855 + 1;
        _1853 = _1857;
    }
    int _1859 = _1853;
    float _1861 = fma(_1727, _1727, _1845);
    int _1863 = _1517 ? 0 : 1;
    float _1865 = as_type<float>(_1849) * _1805;
    float _1867 = float(uint(_1835));
    float _1869 = _1821 * _1819;
    int _1871 = ~_1863;
    int _1873 = _1871 + 1;
    int _1875 = _1873 + 1;
    float _1877 = rsqrt(_1861);
    int _1879 = _1875;
    if (!_1507)
    {
        int _1881 = ~_1863;
        int _1883 = _1881 + 1;
        _1879 = _1883;
    }
    int _1885 = _1879;
    float _1887 = _1715 * _1869;
    float _1889 = _1705 * _1869;
    int _1891 = ~_1711;
    int _1893 = _1891 + 1;
    float _1895 = fma(_1463, _1605, _1851);
    float _1897 = -_1887;
    float _1899 = _1715 + _1897;
    int _1901 = as_type<int>(_1847) + (-2);
    float _1903 = trunc(_1865);
    float _1905 = precise::max(_1903, 0.0);
    uint _1907 = uint(_1905);
    float _1909 = -_1889;
    float _1911 = _1705 + _1909;
    float _1913 = _1899 * _1899;
    float _1915 = _1727 * _1869;
    float _1917 = as_type<float>(_1901) * _1867;
    int _1919 = ~_1711;
    int _1921 = _1919 + 1;
    float _1923 = fma(_1911, _1911, _1913);
    float _1925 = -_1915;
    float _1927 = _1727 + _1925;
    float _1929 = fma(_1613, _1585, _1895);
    float _1931 = trunc(_1917);
    float _1933 = precise::max(_1931, 0.0);
    uint _1935 = uint(_1933);
    float _1937 = fma(_1927, _1927, _1923);
    int _1939 = ~_1781;
    int _1941 = _1939 + 1;
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1945 = ~_1781;
    int _1947 = _1945 + 1;
    float _1949 = fma(_1611, _1577, _1929);
    int _1951 = _1893 * int(_1907);
    int _1953 = _1951 + _1795;
    float _1955 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1943);
    float _1957 = sqrt(_1937);
    float _1959 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1955);
    float _1961 = float(uint(_1953));
    out.m_77.w = _1819;
    float _1963 = float(_1885);
    float _1965 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1967 = _1947 * int(_1935);
    int _1969 = _1967 + _1835;
    float _1971 = as_type<float>(_1849) * _1961;
    float _1973 = _1817 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1975 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1965);
    float _1977 = -_158;
    float _1979 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1755);
    float _1981 = float(uint(_1969));
    float _1983 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1973);
    float _1985 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1785);
    float _1987 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1975);
    float _1989 = trunc(_1971);
    float _1991 = precise::max(_1989, 0.0);
    uint _1993 = uint(_1991);
    float _1995 = as_type<float>(_1901) * _1981;
    float _1997 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1983);
    float _1999 = _1821 * _1957;
    float _2001 = fma(_1987, _1837, _1979);
    float _2003 = -_1985;
    float _2005 = fma(_1959, _1759, _2003);
    bool _2007 = _1711 == 0;
    float _2009 = _1789 * _1999;
    float _2011 = trunc(_1995);
    float _2013 = precise::max(_2011, 0.0);
    uint _2015 = uint(_2013);
    bool _2017 = _1997 >= 0.0;
    bool _2019 = !_1495;
    int _2021 = _2019 ? 0 : 1;
    float _2023 = _2009 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _2025 = abs(_2021);
    float _2027 = _2005 + 0.5;
    int _2029 = int(_1907) + int(_1993);
    float _2031 = _2023 * _1877;
    float _2033 = float(_2025);
    float _2035 = _2001 + 0.5;
    int _2037 = _1921 * _2029;
    int _2039 = _2037 + _1795;
    float _2041 = _1929;
    int _2043 = as_type<int>(_2035);
    float _2045 = _1915;
    if (_2017)
    {
        _2041 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2047 = _2041;
    float _2049 = _1817 * _2031;
    int _2051 = int(_1935) + int(_2015);
    out.m_79.x = _2035;
    out.m_79.y = _2027;
    bool _2053 = uint(_2039) >= uint(_1711);
    float _2055 = _2033 * _1963;
    float _2057 = -_2049;
    float _2059 = _1817 + _2057;
    int _2061 = _1941 * _2051;
    int _2063 = _2061 + _1835;
    bool _2065 = !_2053;
    int _2067 = _2065 ? 0 : (-1);
    float _2069 = _2059 * _2059;
    bool _2071 = _1711 == 0;
    float _2073 = _2049;
    if (_2017)
    {
        out.m_51.x = 0.0;
    }
    float _2075 = _1705 * _2031;
    if (_2017)
    {
        float _2077 = _2047 * 5.0;
        _2043 = as_type<int>(_2077);
    }
    int _2079 = _2043;
    bool _2081 = uint(_2063) >= uint(_1781);
    float _2083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2085 = -_2075;
    float _2087 = _1705 + _2085;
    float _2089 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1949);
    int _2091 = ~_2029;
    int _2093 = _2091 + _2067;
    int _2095 = _2093 + 1;
    if (_2017)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6948 = as_type<float>(_2079);
        out.gl_Position.z = _6948;
    }
    int _2097 = _1795 ^ _1711;
    float _2099 = fma(_2087, _2087, _2069);
    float _2101 = _1727 * _2031;
    float _2103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _2105 = uint(int(uint(_2097) >> uint(31)));
    out.m_81.x = _2089;
    float _2107 = -_2101;
    float _2109 = _1727 + _2107;
    int _2111 = ~int(_2105);
    int _2113 = _2111 + 1;
    float _2115 = fma(_2109, _2109, _2099);
    bool _2117 = !_2081;
    int _2119 = _2117 ? 0 : (-1);
    int _2121 = _1711 * _2095;
    int _2123 = _2121 + _1795;
    float _2125 = _2083 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2127 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2129 = log2(_2127);
    int _2131 = ~_2119;
    int _2133 = _2051 + _2131;
    int _2135 = _2133 + 1;
    bool _2137 = !_2071;
    int _2139 = _2137 ? _2123 : (-1);
    int _2141 = _2135 ^ _2113;
    float _2143 = _2103 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2145 = float(_2139);
    float _2147 = sqrt(_2115);
    int _2149 = ~_2113;
    int _2151 = _2149 + _2141;
    int _2153 = _2151 + 1;
    float _2155 = fma(_2125, _1017, -0.5);
    float _2157 = fma(_2125, _2145, _1135);
    float _2159 = fma(_2143, _1217, -0.5);
    bool _2161 = !_2007;
    int _2163 = _2161 ? _2153 : (-1);
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2167 = _2129 * _158;
    float _2169 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2171 = float(_2163);
    float _2173 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1117);
    float _2175 = fma(_1019, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2165);
    float _2177 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2169);
    float _2179 = exp2(_2167);
    float _2181 = -_2173;
    float _2183 = fma(_2143, _2171, _2181);
    float _2185 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2175);
    float _2187 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2177);
    bool _2189 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2191 = isnan(0.0);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2197 = _2193 || _2195;
    float _2199 = fma(_2185, _2159, _2183);
    float _2201 = fma(_2187, _2155, _2157);
    float _2203 = _2199 + 0.5;
    float _2205 = _2201 + 0.5;
    float _2207 = in.m_83.x;
    float _2209 = in.m_83.y;
    float _2211 = in.m_83.z;
    bool _2213 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2215 = isnan(1.0);
    bool _2217 = _2213 || _2215;
    bool _2219 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2221 = _2217 || _2219;
    float _2223 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2225 = 1.0 + _2223;
    float _2227 = _1877 * _2147;
    out.m_85.x = _2205;
    out.m_85.y = _2203;
    float _2229 = -_2179;
    float _2231 = _2229 + 1.0;
    float _2233 = 1.0 / _2225;
    float _2235 = _2009 * _2227;
    bool _2237 = !_1499;
    int _2239 = _2237 ? 0 : 1;
    bool _2241 = !_1503;
    int _2243 = _2241 ? 0 : 1;
    out.m_87.x = _2235;
    float _2245 = _2211;
    float _2247 = _2101;
    if (_2017)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2249 = -_2049;
    float _2251 = _1079 + _2249;
    float _2253 = _2055 * (-2.0);
    float _2255 = _2197 ? _2231 : 0.0;
    float _2257 = -_2075;
    float _2259 = _1633 + _2257;
    float _2261 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2263 = _2251 + _2261;
    float _2265 = _823 + (-0.5);
    float _2267 = fma(_2253, _2207, _2207);
    if (_2221)
    {
        float _2269 = _2255 * _2233;
        _162 = _2269;
    }
    float _2271 = _162;
    int _2273 = abs(_2243);
    float _2275 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2277 = _2259 + _2275;
    float _2279 = fma(_2265, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2267);
    int _2281 = abs(_2239);
    float _2283 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2285 = float(_1859);
    float _2287 = fma(_1537, _2253, _1537);
    float _2289 = float(_2281);
    float _2291 = -_2101;
    float _2293 = _1687 + _2291;
    float _2295 = fma(_2277, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2283);
    float _2297 = _1019 + _1125;
    float _2299 = _2289 * _2285;
    float _2301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2303 = _2293 + _2301;
    float _2305 = fma(_2287, _2271, _2279);
    float _2307 = _2297 + (-1.0);
    float _2309 = _2299 * (-2.0);
    float _2311 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2295);
    float _2313 = _1019 + (-0.5);
    float _2315 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2317 = fma(_2309, _2209, _2209);
    float _2319 = float(_1831);
    float _2321 = _823 + _1125;
    float _2323 = float(_2273);
    float _2325 = fma(_2315, _2309, _2315);
    bool _2327 = _2311 >= 0.0;
    float _2329 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2317);
    float _2331 = _2323 * _2319;
    float _2333 = _2321 + (-1.0);
    float _2335 = fma(_2325, _2271, _2329);
    float _2337 = _2305 * 0.15915493667125701904296875;
    float _2339 = _2331 * (-2.0);
    float _2341 = fma(_2333, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2343 = _2335 * 0.15915493667125701904296875;
    float _2345 = _1125 + (-0.5);
    float _2347 = fma(_2339, _2211, _2211);
    float _2349 = fma(_2341, _2339, _2341);
    if (_2327)
    {
        _2245 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2351 = _2245;
    float _2353 = _2337 * 6.283185482025146484375;
    float _2355 = sin(_2353);
    float _2357 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2347);
    int _2359 = as_type<int>(_2351);
    if (_2327)
    {
        out.m_51.x = 0.0;
    }
    if (_2327)
    {
        float _2361 = _2351 * 5.0;
        _2359 = as_type<int>(_2361);
    }
    int _2363 = _2359;
    float _2365 = fma(_2349, _2271, _2357);
    float _2367 = _2337 * 6.283185482025146484375;
    float _2369 = cos(_2367);
    if (_2327)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7379 = as_type<float>(_2363);
        out.gl_Position.z = _7379;
    }
    float _2371 = _2343 * 6.283185482025146484375;
    float _2373 = sin(_2371);
    float _2375 = _2343 * 6.283185482025146484375;
    float _2377 = cos(_2375);
    if (_2327)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2379 = in.m_89.x;
    float _2381 = in.m_89.y;
    float _2383 = in.m_89.z;
    float _2385 = _2365 * 0.15915493667125701904296875;
    float _2387 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2389 = _1999 * _2227;
    float _2391 = _2385 * 6.283185482025146484375;
    float _2393 = cos(_2391);
    float _2395 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2397 = _2369 * _2377;
    float _2399 = _2387 * _2389;
    float _2401 = _2369 * _2373;
    float _2403 = _2355 * _2373;
    float _2405 = _2395 * _2389;
    float _2407 = _2355 * _2377;
    float _2409 = _2385 * 6.283185482025146484375;
    float _2411 = sin(_2409);
    float _2413 = _2369 * _2393;
    float _2415 = _2377 * _2393;
    float _2417 = _2355 * _2393;
    float _2419 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2381);
    float _2421 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2379);
    float _2423 = _2373 * _2393;
    float _2425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2383);
    float _2427 = _2399 * _2419;
    float _2429 = _2235 * _2421;
    float _2431 = fma(_2411, _2397, _2403);
    float _2433 = _2405 * _2425;
    float _2435 = _2413 * _2427;
    float _2437 = -_2407;
    float _2439 = fma(_2411, _2401, _2437);
    float _2441 = -_2427;
    float _2443 = _2411 * _2441;
    float _2445 = -_2401;
    float _2447 = fma(_2411, _2407, _2445);
    float _2449 = fma(_2431, _2429, _2435);
    float _2451 = _2417 * _2427;
    float _2453 = fma(_2415, _2429, _2443);
    float _2455 = fma(_2411, _2403, _2397);
    float _2457 = fma(_2439, _2433, _2449);
    float _2459 = fma(_2447, _2429, _2451);
    float _2461 = fma(_2423, _2433, _2453);
    float _2463 = _2457 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2465 = fma(_2455, _2433, _2459);
    float _2467 = _2457 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2469 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2463);
    float _2471 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2467);
    float _2473 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2469);
    float _2475 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2471);
    float _2477 = _2473 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2479 = _2475 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2481 = _1687 + _2477;
    float _2483 = _1633 + _2479;
    float _2485 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2487 = _2481 + _2485;
    float _2489 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2491 = _2483 + _2489;
    float _2493 = _2487 * _2487;
    float _2495 = fma(_2491, _2491, _2493);
    float _2497 = _2457 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2499 = sqrt(_2495);
    float _2501 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2497);
    float _2503 = fma(_2465, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2501);
    float _2505 = _2503 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2507 = _1079 + _2505;
    bool _2509 = _2499 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2511 = _2505;
    float _2513 = _2503;
    float _2515 = _2483;
    if (!_2509)
    {
        _2511 = _2481;
    }
    float _2517 = _2511;
    float _2519 = _2517;
    if (!_2509)
    {
        _2513 = _2507;
    }
    float _2521 = _2513;
    bool _2523 = !_2509;
    float _2525 = _2521;
    if (!_2523)
    {
        float _2527 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2529 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2531 = _2499 + _2529;
        float _2533 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2535 = rsqrt(_2495);
        float _2537 = _2531 * _2527;
        float _2539 = _2537 * 0.15915493667125701904296875;
        float _2541 = _2539 * 6.283185482025146484375;
        float _2543 = sin(_2541);
        float _2545 = _2539 * 6.283185482025146484375;
        float _2547 = cos(_2545);
        float _2549 = fma(_2543, _2533, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2551 = _2535 * _2549;
        float _2553 = _2547 + (-1.0);
        float _2555 = fma(_2491, _2551, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2557 = fma(_2487, _2551, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2559 = _2553 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2561 = fma(_2507, _2547, _2559);
        _2515 = _2555;
        _2519 = _2557;
        _2525 = _2561;
    }
    float _2563 = _2515;
    float _2565 = _2519;
    float _2567 = _2525;
    float _2569 = -_1889;
    float _2571 = _2569 + _2563;
    float _2573 = -_1915;
    float _2575 = _2573 + _2565;
    float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2579 = _2571 + _2577;
    float _2581 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2583 = _2575 + _2581;
    float _2585 = fma(_2579, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2587 = fma(_2583, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _7736 = float2(_2585, _2587);
    float _2589 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_7736, float2(0.0), isnan(_7736)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_7736, float2(0.0), isnan(_7736)), level(0.0)).x;
    float _2591 = -_1887;
    float _2593 = _2591 + _1079;
    float _2595 = -_1889;
    float _2597 = _1633 + _2595;
    float _2599 = -_1079;
    float _2601 = _2599 + _2567;
    float _2603 = -_1887;
    float _2605 = _2603 + _2567;
    float _2607 = -_1687;
    float _2609 = _2607 + _2565;
    float _2611 = -_1915;
    float _2613 = _1687 + _2611;
    float _2615 = -_2075;
    float _2617 = _2615 + _2597;
    float _2619 = -_1633;
    float _2621 = _2619 + _2563;
    float _2623 = _2601 * _2601;
    float _2625 = -_2101;
    float _2627 = _2625 + _2613;
    bool _2629 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2631 = isnan(0.5);
    bool _2633 = _2629 || _2631;
    bool _2635 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2637 = _2633 || _2635;
    float _2639 = fma(_2621, _2621, _2623);
    bool _2641 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2643 = isnan(0.5);
    bool _2645 = _2641 || _2643;
    bool _2647 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2649 = _2645 || _2647;
    float _2651 = fma(_2609, _2609, _2639);
    float _2653 = sqrt(_2651);
    bool _2655 = _2653 > 0.0;
    float _2657 = _2605;
    float _2659 = _2571;
    float _2661 = _2597;
    if (!_2655)
    {
        _2045 = _2575;
    }
    float _2663 = _2045;
    float _2665 = fma(_2589, 100.0, _2593);
    float _2667 = fma(_2589, 100.0, _2605);
    float _2669 = -_2049;
    float _2671 = _2669 + _2665;
    float _2673 = _2663;
    float _2675 = _2663;
    float _2677 = _2671;
    if (!_2655)
    {
        _2657 = _2667;
    }
    float _2679 = _2657;
    float _2681 = _2671 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2683 = fma(_2617, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2681);
    float _2685 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2683);
    float _2687 = _2685 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2689 = _2671 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2691 = 1.0 / _2687;
    float _2693 = fma(_2617, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2689);
    float _2695 = fma(_2627, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2693);
    float _2697 = _2695 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2699 = _2697 + _2687;
    float _2701 = _2699 * _2691;
    float _2703 = _2701 * 0.5;
    float _2705 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2707 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2705);
    float _2709 = 1.0 / _2707;
    bool _2711 = !_2655;
    float _2713 = _2679;
    float _2715 = _2687;
    if (!_2711)
    {
        float _2717 = _224 * _224;
        float _2719 = fma(_220, _220, _2717);
        float _2721 = fma(_226, _226, _2719);
        float _2723 = rsqrt(_2651);
        float _2725 = sqrt(_2721);
        float _2727 = _2621 * _2723;
        float _2729 = _2601 * _2723;
        float _2731 = _2609 * _2723;
        bool _2733 = _2725 > 0.0;
        float _2735 = _2725;
        _2715 = _2729;
        if (!_2733)
        {
            _2735 = _2667;
        }
        float _2737 = _2735;
        _2713 = _2737;
        if (!_2733)
        {
            _2673 = _2575;
        }
        float _2739 = _2673;
        bool _2741 = !_2733;
        _2675 = _2739;
        if (!_2741)
        {
            float _2743 = rsqrt(_2721);
            float _2745 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2747 = _224 * _2743;
            float _2749 = _220 * _2743;
            float _2751 = _226 * _2743;
            float _2753 = _2729 * _2747;
            float _2755 = fma(_2727, _2749, _2753);
            float _2757 = _2745 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2759 = fma(_2731, _2751, _2755);
            float _2761 = _2759 * _2757;
            float _2763 = fma(_220, _2761, _2571);
            float _2765 = fma(_224, _2761, _2667);
            float _2767 = fma(_226, _2761, _2575);
            _2675 = _2767;
            _2659 = _2763;
            _2713 = _2765;
        }
    }
    float _2769 = _2675;
    float _2771 = _2659;
    float _2773 = _2713;
    float _2775 = _2715;
    float _2777 = -_2101;
    float _2779 = _2777 + _2769;
    float _2781 = -_2075;
    float _2783 = _2781 + _2771;
    float _2785 = -_2049;
    float _2787 = _2785 + _2773;
    float _2789 = _2787;
    float _2791 = _2783;
    float _2793 = _2779;
    float _2795 = _2771;
    float _2797 = _2775;
    if (_2649)
    {
        _2247 = 1.0;
    }
    float _2799 = _2247;
    float _2801 = _2799;
    if (!_2637)
    {
        float _2803 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2805 = _2671 + _2803;
        float _2807 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2809 = _2617 + _2807;
        float _2811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2813 = -_2613;
        float _2815 = _2813 + _2769;
        float _2817 = _2805 * _2805;
        float _2819 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2821 = _2627 + _2819;
        float _2823 = -_2665;
        float _2825 = _2823 + _2773;
        float _2827 = fma(_2809, _2809, _2817);
        float _2829 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2831 = fma(_2821, _2821, _2827);
        float _2833 = sqrt(_2831);
        float _2835 = 1.0 / _2227;
        float _2837 = _2829 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2839 = precise::min(_2833, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2841 = _2839 * _2811;
        float _2843 = _2841 * _2835;
        float _2845 = -_2597;
        float _2847 = _2845 + _2771;
        float _2849 = _2837 * _2843;
        float _2851 = _2815 * _2843;
        float _2853 = fma(_2847, _2849, _2617);
        float _2855 = fma(_2825, _2849, _2671);
        float _2857 = fma(_2837, _2851, _2627);
        _2789 = _2855;
        _2791 = _2853;
        _2793 = _2857;
    }
    float _2859 = _2789;
    float _2861 = _2791;
    float _2863 = _2793;
    if (_2649)
    {
        _2073 = 1.0;
    }
    float _2865 = _2073;
    float _2867 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2869 = _2709 * _2867;
    float _2871 = _2865;
    if (!_2649)
    {
        float _2873 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2875 = _2873 * 0.15915493667125701904296875;
        float _2877 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2879 = _2875 * 6.283185482025146484375;
        float _2881 = cos(_2879);
        float _2883 = _2877 * 0.15915493667125701904296875;
        float _2885 = _2875 * 6.283185482025146484375;
        float _2887 = sin(_2885);
        float _2889 = 1.0 / _2881;
        float _2891 = _2883 * 6.283185482025146484375;
        float _2893 = cos(_2891);
        float _2895 = _2887 * _2889;
        float _2897 = _2883 * 6.283185482025146484375;
        float _2899 = sin(_2897);
        float _2901 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2903 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2901;
        float _2905 = _2893 * _2895;
        float _2907 = 1.0 / _2903;
        float _2909 = 1.0 / _2905;
        float _2911 = _2899 * _2909;
        float _2913 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2915 = fma(_2869, _2911, _2913);
        float _2917 = _2915 * _2907;
        float _2919 = precise::clamp(_2917, 0.0, 1.0);
        _2661 = _2895;
        _2795 = _2875;
        _2801 = _2919;
    }
    float _2921 = _2661;
    float _2923 = _2795;
    float _2925 = _2801;
    float _2927 = _2923;
    float _2929 = _2921;
    if (!_2649)
    {
        float _2931 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2933 = _2931 * 0.15915493667125701904296875;
        float _2935 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2937 = _2933 * 6.283185482025146484375;
        float _2939 = cos(_2937);
        float _2941 = _2935 * 0.15915493667125701904296875;
        float _2943 = _2933 * 6.283185482025146484375;
        float _2945 = sin(_2943);
        float _2947 = 1.0 / _2939;
        float _2949 = _2941 * 6.283185482025146484375;
        float _2951 = cos(_2949);
        float _2953 = _2945 * _2947;
        float _2955 = _2941 * 6.283185482025146484375;
        float _2957 = sin(_2955);
        float _2959 = _2951 * _2953;
        float _2961 = 1.0 / _2959;
        float _2963 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2965 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2963;
        float _2967 = 1.0 / _2965;
        float _2969 = _2957 * _2961;
        float _2971 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2973 = fma(_2869, _2969, _2971);
        float _2975 = _2973 * _2967;
        float _2977 = precise::clamp(_2975, 0.0, 1.0);
        float _2979 = -_2977;
        float _2981 = _2979 + 1.0;
        _2927 = _2959;
        _2929 = _2947;
        _2871 = _2981;
    }
    float _2983 = _2927;
    float _2985 = _2929;
    float _2987 = _2871;
    float _2989 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2991 = _2859 + _2989;
    float _2993 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2995 = _2861 + _2993;
    float _2997 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2999 = _2863 + _2997;
    float _3001 = _2859 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3003 = _2991 * _2991;
    float _3005 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3001);
    float _3007 = fma(_2995, _2995, _3003);
    float _3009 = fma(_2863, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3005);
    float _3011 = fma(_2999, _2999, _3007);
    float _3013 = _3009 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3015 = rsqrt(_3011);
    float _3017 = sqrt(_3011);
    float _3019 = _3015 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3021 = _2995 * _3019;
    float _3023 = _2999 * _3019;
    float _3025 = _3021 * _3021;
    float _3027 = _3023 * _3023;
    float _3029 = _3025 + _3027;
    float _3031 = sqrt(_3029);
    bool _3033 = _3031 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3037 = _3031 + _3035;
    float _3039 = _2999;
    float _3041 = _2985;
    float _3043 = _3037;
    float _3045 = _2983;
    float _3047 = _2991;
    if (_3033)
    {
        float _3049 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3039 = _3049;
    }
    float _3051 = _3039;
    if (_3033)
    {
        float _3053 = rsqrt(_3029);
        _3041 = _3053;
    }
    float _3055 = _3041;
    float _3057 = _3055;
    if (_3033)
    {
        float _3059 = _3037 * _3051;
        _3043 = _3059;
    }
    float _3061 = _3043;
    if (_3033)
    {
        float _3063 = _3061 * 0.15915493667125701904296875;
        _3045 = _3063;
    }
    float _3065 = _3045;
    float _3067 = _3015;
    float _3069 = _3065;
    if (_3033)
    {
        float _3071 = _3065 * 6.283185482025146484375;
        float _3073 = sin(_3071);
        _3067 = _3073;
    }
    float _3075 = _3067;
    float _3077 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3079 = precise::max(0.0, _3077);
    float _3081 = _3051;
    float _3083 = _3079;
    if (_3033)
    {
        float _3085 = _3065 * 6.283185482025146484375;
        float _3087 = cos(_3085);
        _3081 = _3087;
    }
    float _3089 = _3081;
    float _3091 = -_3019;
    float _3093 = -_3079;
    float _3095 = fma(_2991, _3091, _3093);
    float _3097 = _3095;
    if (_3033)
    {
        float _3099 = _3095 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3047 = _3099;
    }
    float _3101 = _3047;
    float _3103 = _3101;
    if (!_3033)
    {
        _3069 = _3027;
    }
    float _3105 = _3069;
    float _3107 = _3075;
    float _3109 = _3105;
    if (_3033)
    {
        float _3111 = fma(_3075, _3101, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3103 = _3111;
    }
    float _3113 = _3103;
    if (!_3033)
    {
        _3107 = _3025;
    }
    float _3115 = _3107;
    float _3117 = _3089;
    float _3119 = _3115;
    if (_3033)
    {
        float _3121 = _3089 + (-1.0);
        _3083 = _3121;
    }
    float _3123 = _3083;
    float _3125 = _3123;
    if (_3033)
    {
        float _3127 = _3055 * _3113;
        _2797 = _3127;
    }
    float _3129 = _2797;
    if (!_3033)
    {
        _3057 = _3021;
    }
    float _3131 = _3057;
    float _3133 = _3131;
    if (_3033)
    {
        float _3135 = _3123 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3125 = _3135;
    }
    float _3137 = _3125;
    if (_3033)
    {
        float _3139 = _3021 * _3129;
        _3133 = _3139;
    }
    float _3141 = _3133;
    float _3143 = _2859 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_3033)
    {
        float _3145 = fma(_3095, _3089, _3137);
        _3097 = _3145;
    }
    float _3147 = _3097;
    if (!_3033)
    {
        _3117 = _3023;
    }
    float _3149 = _3117;
    float _3151 = _3149;
    if (_3033)
    {
        float _3153 = _3023 * _3129;
        _3151 = _3153;
    }
    float _3155 = _3151;
    if (_3033)
    {
        float _3157 = _3141 * _3141;
        _3119 = _3157;
    }
    float _3159 = _3119;
    float _3161 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3143);
    float _3163 = fma(_2617, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_3033)
    {
        float _3165 = _3155 * _3155;
        _3109 = _3165;
    }
    float _3167 = _3109;
    float _3169 = fma(_3147, _3147, _3159);
    float _3171 = fma(_2863, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3161);
    float _3173 = floor(_3163);
    float _3175 = _3169 + _3167;
    float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3179 = fma(_3017, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3177);
    float _3181 = precise::clamp(_3179, 0.0, 1.0);
    float _3183 = _3171 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3185 = -_3181;
    float _3187 = _3185 + 1.0;
    float _3189 = rsqrt(_3175);
    float _3191 = fma(_2627, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3193 = _2859 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3195 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3197 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3199 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3193);
    float _3201 = abs(_3187);
    float _3203 = log2(_3201);
    float _3205 = _2859 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3207 = fma(_2863, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3199);
    float _3209 = -_3197;
    float _3211 = fma(_3209, _3195, 1.0);
    float _3213 = -_3173;
    float _3215 = _3163 + _3213;
    float _3217 = fma(_2861, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3205);
    float _3219 = _3207 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3221 = _3189 * _3141;
    float _3223 = fma(_2863, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3217);
    float _3225 = _3189 * _3147;
    float _3227 = _3189 * _3155;
    float _3229 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3231 = _3223 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3233 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3235 = floor(_3191);
    float _3237 = -_3229;
    float _3239 = fma(_3225, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3237);
    float _3241 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3243 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3233);
    float _3245 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3247 = -_3227;
    float _3249 = fma(_3247, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3239);
    float _3251 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3253 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3243);
    float _3255 = log2(_3211);
    float _3257 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3245);
    float _3259 = fma(_3013, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3253);
    float _3261 = _3225 + 1.0;
    float _3263 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3257);
    float _3265 = exp2(_3241);
    float _3267 = fma(_3249, -0.5, 0.5);
    float _3269 = -_3235;
    float _3271 = _3191 + _3269;
    float _3273 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3251);
    float _3275 = fma(_3249, 0.5, 0.5);
    float _3277 = fma(_3013, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3263);
    float _3279 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3273);
    float _3281 = 1.0 / _3259;
    float _3283 = fma(_3275, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3285 = _3255 * 0.693147182464599609375;
    float _3287 = fma(_3013, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3279);
    float _3289 = fma(_3275, _3283, -0.212114393711090087890625);
    float _3291 = sqrt(_3267);
    float _3293 = -_3225;
    float _3295 = fma(_3265, _3261, _3293);
    float2 _8824 = float2(_3215, _3271);
    float _3297 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8824, float2(0.0), isnan(_8824)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8824, float2(0.0), isnan(_8824)), level(0.0)).x;
    float _3299 = fma(_3275, _3289, 1.570728778839111328125);
    float _3301 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3303 = fma(_3295, 0.5, 0.5);
    float _3305 = _3277 * _3281;
    float _3307 = _3287 * _3281;
    float _3309 = fma(_3305, 0.5, 0.5);
    float _3311 = fma(_3307, -0.5, 0.5);
    float _3313 = _3291 * 0.636619746685028076171875;
    float3 _8856 = float3(_3309, _3311, _3301);
    float _3315 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8856, float3(0.0), isnan(_8856)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8856, float3(0.0), isnan(_8856)), level(0.0)).x;
    float _3317 = -_3299;
    float _3319 = fma(_3313, _3317, 1.0);
    float3 _8872 = float3(_3309, _3311, _3301);
    float4 _3322 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8872, float3(0.0), isnan(_8872)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8872, float3(0.0), isnan(_8872)), level(0.0)).xyzw;
    float _3324 = _3322.x;
    float _3326 = _3322.y;
    float _3328 = _3322.z;
    float _3330 = _3322.w;
    float2 _8888 = float2(_3319, _3303);
    float3 _3334 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8888, float2(0.0), isnan(_8888)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8888, float2(0.0), isnan(_8888)), level(0.0)).xyz;
    float _3336 = _3334.x;
    float _3338 = _3334.y;
    float _3340 = _3334.z;
    float _3342 = in.m_91.x;
    float _3344 = in.m_91.y;
    float _3346 = in.m_91.z;
    bool _3348 = _2381 != 0.0;
    bool _3350 = isnan(_2381);
    bool _3352 = _3348 || _3350;
    bool _3354 = isnan(0.0);
    bool _3356 = _3352 || _3354;
    float _3358 = _2431 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3360 = _2431 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3362 = _2431 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3364 = _2379 == 0.0;
    bool _3366 = !_3356;
    bool _3368 = _3364 && _3366;
    float _3370 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3358);
    float _3372 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3360);
    float _3374 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3362);
    bool _3376 = _2383 == 0.0;
    bool _3378 = _3376 && _3368;
    float _3380 = _2413 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3382 = _2413 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3384 = _2413 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3386 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3370);
    float _3388 = -_2411;
    float _3390 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3380);
    float _3392 = -_2411;
    float _3394 = fma(_3392, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3382);
    float _3396 = -_2411;
    float _3398 = fma(_3396, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3384);
    float _3400 = _2439 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3402 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3372);
    float _3404 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3374);
    float _3406 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3394);
    float _3408 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3400);
    float _3410 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3390);
    float _3412 = fma(_2417, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3398);
    float _3414 = _3342;
    float _3416 = _3344;
    float _3418 = _3346;
    if (!_3378)
    {
        float _3420 = fma(_2379, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3342);
        _3414 = _3420;
    }
    float _3422 = _3414;
    if (!_3378)
    {
        float _3424 = fma(_2381, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3344);
        _3416 = _3424;
    }
    float _3426 = _3416;
    float _3428 = abs(_2869);
    float _3430 = log2(_3428);
    if (!_3378)
    {
        float _3432 = fma(_2383, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3346);
        _3418 = _3432;
    }
    float _3434 = _3418;
    float _3436 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3408);
    float _3438 = _3410 * _3426;
    float _3440 = _3406 * _3426;
    float _3442 = _3412 * _3426;
    float _3444 = fma(_3386, _3422, _3438);
    float _3446 = fma(_3402, _3422, _3440);
    float _3448 = fma(_3404, _3422, _3442);
    float _3450 = _3203 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3452 = fma(_3436, _3434, _3444);
    float _3454 = _2439 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3456 = _2439 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3458 = _3219 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3460 = _3430 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3462 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3454);
    float _3464 = exp2(_3450);
    float _3466 = in.m_75.x;
    float _3468 = fma(_2423, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3456);
    float _3470 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3462);
    float _3472 = fma(_3231, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3458);
    bool _3474 = _2869 <= 8000.0;
    bool _3476 = isnan(_2869);
    bool _3478 = _3474 || _3476;
    bool _3480 = isnan(8000.0);
    bool _3482 = _3478 || _3480;
    float _3484 = float(_3482);
    float _3486 = fma(_2455, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3468);
    float _3488 = fma(_3470, _3434, _3446);
    float _3490 = exp2(_3460);
    float _3492 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3472);
    float _3494 = _3259 * 0.5;
    float _3496 = fma(_3486, _3434, _3448);
    float _3498 = fma(_3013, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3492);
    out.m_93.x = _2617;
    out.m_93.y = _2671;
    out.m_93.z = _2627;
    float _3500 = -_3464;
    float _3502 = _3500 + 1.0;
    bool _3504 = _3017 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3506 = isnan(_3017);
    bool _3508 = _3504 || _3506;
    bool _3510 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3512 = _3508 || _3510;
    out.gl_Position.x = _3277;
    out.gl_Position.y = _3287;
    out.gl_Position.z = _3498;
    out.gl_Position.w = _3259;
    out.m_95.x = _3452;
    out.m_95.y = _3488;
    out.m_95.z = _3496;
    float _3514 = fma(_3490, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3516 = precise::clamp(_3514, 0.0, 1.0);
    float _3518 = _3277 + _3259;
    out.m_97.x = _2861;
    out.m_97.y = _2859;
    out.m_97.z = _2863;
    float _3520 = fma(_3516, -2.0, 3.0);
    float _3522 = _3516 * _3516;
    float _3524 = _3518 * 0.5;
    float _3526 = _3259;
    if (!_3512)
    {
        _2677 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3528 = _2677;
    float _3530 = _3522 * _3520;
    float _3532 = -_3530;
    float _3534 = _3532 + 1.0;
    float _3536 = fma(_3534, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3530);
    float _3538 = fma(_3287, -0.5, _3494);
    float _3540 = _3498 + _3259;
    float _3542 = _3484 * _3536;
    float _3544 = _3540 * 0.5;
    float _3546 = _3542 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3548 = _3502 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_99.x = _3524;
    out.m_99.y = _3538;
    out.m_99.z = _3544;
    out.m_99.w = _3259;
    float _3550 = -_3548;
    float _3552 = _3550 + 1.0;
    float _3554 = _3544;
    float _3556 = _3538;
    float _3558 = _3528;
    float _3560 = _3528;
    if (!_3512)
    {
        _3526 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3562 = _3526;
    float _3564 = _3562;
    float _3566 = _3562;
    if (!_3512)
    {
        _3554 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3568 = _3554;
    float _3570 = _3568;
    float _3572 = _3568;
    if (!_3512)
    {
        _3556 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3574 = _3556;
    float _3576 = -_3297;
    float _3578 = _3576 + 1.0;
    float _3580 = _3578 * _3546;
    float _3582 = precise::clamp(_3580, 0.0, 1.0);
    float _3584 = -_3582;
    float _3586 = fma(_3584, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3588 = _3586 * _3466;
    float _3590 = _3548 * _3315;
    float _3592 = _3588 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3594 = _3330 * _3590;
    float _3596 = _3330 * _3552;
    out.m_101.x = _3592;
    float _3598 = _2925 * _2987;
    float _3600 = _3340 * _3590;
    float _3602 = fma(_3336, _3594, _3324);
    float _3604 = fma(_3338, _3594, _3326);
    float _3606 = _3598 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3608 = fma(_3330, _3600, _3328);
    float _3610 = _3594;
    float _3612 = _3598;
    float _3614 = _3574;
    float _3616 = _3574;
    if (!_3512)
    {
        _3610 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3618 = _3610;
    float _3620 = _3618;
    float _3622 = _3618;
    if (!_3512)
    {
        _3612 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3624 = _3612;
    out.m_103.x = _3602;
    out.m_103.y = _3604;
    out.m_103.z = _3608;
    out.m_103.w = _3596;
    bool _3626 = !_3512;
    float _3628 = _3624;
    float _3630 = _3624;
    if (!_3626)
    {
        bool _3632 = _3017 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3634 = isnan(_3017);
        bool _3636 = _3632 || _3634;
        bool _3638 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3640 = _3636 || _3638;
        if (!_3640)
        {
            float _3642 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3644 = _3017 + _3642;
            float _3646 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3648 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3646;
            float _3650 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3652 = _3650 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3654 = 1.0 / _3648;
            float _3656 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3658 = _3656 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3660 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3662 = _3660 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3664 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3666 = _3664 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3668 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3670 = _3668 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3672 = _3644 * _3654;
            float _3674 = precise::clamp(_3672, 0.0, 1.0);
            float _3676 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3678 = _3676 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3680 = fma(_3674, _3652, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3682 = fma(_3674, _3678, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3684 = fma(_3674, _3658, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3686 = fma(_3674, _3662, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3688 = fma(_3674, _3666, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3690 = fma(_3674, _3670, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3622 = _3684;
            _3616 = _3688;
            _3560 = _3680;
            _3572 = _3686;
            _3566 = _3682;
            _3630 = _3690;
            _3692 = true;
        }
        else
        {
            bool _3694 = _3017 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3696 = isnan(_3017);
            bool _3698 = _3694 || _3696;
            bool _3700 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3702 = _3698 || _3700;
            if (!_3702)
            {
                _3558 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3704 = _3558;
            _3560 = _3704;
            if (!_3702)
            {
                _3620 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3706 = _3620;
            _3622 = _3706;
            if (!_3702)
            {
                _3564 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3708 = _3564;
            _3566 = _3708;
            if (!_3702)
            {
                _3570 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3710 = _3570;
            _3572 = _3710;
            if (!_3702)
            {
                _3614 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3712 = _3614;
            _3616 = _3712;
            if (!_3702)
            {
                _3628 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3714 = _3628;
            bool _3716 = !_3702;
            _3630 = _3714;
            if (!_3716)
            {
                bool _3718 = _3017 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3720 = isnan(_3017);
                bool _3722 = _3718 || _3720;
                bool _3724 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3726 = _3722 || _3724;
                if (!_3726)
                {
                    float _3728 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3730 = _3017 + _3728;
                    float _3732 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3734 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3732;
                    float _3736 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3738 = _3736 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3740 = 1.0 / _3734;
                    float _3742 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3744 = _3742 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3748 = _3746 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3750 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3752 = _3750 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3754 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3756 = _3754 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3758 = _3730 * _3740;
                    float _3760 = precise::clamp(_3758, 0.0, 1.0);
                    float _3762 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3764 = _3762 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3766 = fma(_3760, _3738, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3768 = fma(_3760, _3764, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3770 = fma(_3760, _3744, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3772 = fma(_3760, _3748, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3774 = fma(_3760, _3752, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3776 = fma(_3760, _3756, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3622 = _3770;
                    _3616 = _3774;
                    _3560 = _3766;
                    _3572 = _3772;
                    _3566 = _3768;
                    _3630 = _3776;
                    _3692 = true;
                }
                else
                {
                    _3622 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3616 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3560 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3572 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3566 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3630 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3692 = false;
    float _3778 = _3622;
    float _3780 = _3616;
    float _3782 = _3560;
    float _3784 = _3572;
    float _3786 = _3566;
    float _3788 = _3630;
    float _3790 = _3606 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3792 = fma(_3488, -0.5, 0.5);
    float _3794 = precise::clamp(_3792, 0.0, 1.0);
    float _3796 = -_3778;
    float _3798 = _3796 + _3780;
    float _3800 = -_3782;
    float _3802 = _3800 + _3784;
    out.m_105.x = 0.0;
    float _3804 = fma(_3794, _3798, _3778);
    float _3806 = -_3786;
    float _3808 = _3806 + _3788;
    float _3810 = fma(_3794, _3802, _3782);
    float _3812 = _3804 * 0.586610972881317138671875;
    bool _3814 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3816 = fma(_3794, _3808, _3786);
    out.m_51.x = _3790;
    float _3818 = fma(_3810, 0.298911988735198974609375, _3812);
    bool _3820 = _2925 > 0.0;
    bool _3822 = isnan(_2925);
    bool _3824 = _3820 || _3822;
    bool _3826 = isnan(0.0);
    bool _3828 = _3824 || _3826;
    float _3830 = fma(_3816, 0.114477999508380889892578125, _3818);
    bool _3832 = _2987 <= 0.0;
    bool _3834 = !_3828;
    bool _3836 = _3832 || _3834;
    float _3838 = -_3830;
    float _3840 = _3810 + _3838;
    float _3842 = -_3830;
    float _3844 = _3804 + _3842;
    float _3846 = -_3830;
    float _3848 = _3816 + _3846;
    float _3850 = fma(_3840, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3830);
    float _3852 = fma(_3844, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3830);
    float _3854 = fma(_3848, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3830);
    bool _3856 = !_3814;
    if (!_3856)
    {
        float _3858 = -_2859;
        float _3860 = _3858 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3862 = -_2861;
        float _3864 = _3862 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3866 = -_2863;
        float _3868 = _3866 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3870 = _3860 * _3860;
        float _3872 = fma(_3864, _3864, _3870);
        float _3874 = fma(_3868, _3868, _3872);
        float _3876 = sqrt(_3874);
        float _3878 = rsqrt(_3874);
        float _3880 = -_3876;
        float _3882 = _3880 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3884 = _3882 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3886 = precise::clamp(_3884, 0.0, 1.0);
        float _3888 = _3864 * _3878;
        float _3890 = _3860 * _3878;
        float _3892 = abs(_3886);
        float _3894 = log2(_3892);
        float _3896 = _3868 * _3878;
        float _3898 = _3888 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3900 = _3488 * _3890;
        float _3902 = -_3890;
        float _3904 = -_3898;
        float _3906 = fma(_3902, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3904);
        float _3908 = fma(_3452, _3888, _3900);
        float _3910 = -_3896;
        float _3912 = fma(_3910, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3906);
        float _3914 = fma(_3496, _3896, _3908);
        float _3916 = precise::clamp(_3914, 0.0, 1.0);
        float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3920 = _3912 + _3918;
        float _3922 = _3894 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3924 = _3920 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3926 = precise::clamp(_3924, 0.0, 1.0);
        float _3928 = exp2(_3922);
        float _3930 = _3928 * _3926;
        float _3932 = _3916 * _3930;
        float _3934 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3936 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3938 = _3932 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_105.x = _3934;
        out.m_105.y = _3936;
        out.m_105.z = _3938;
    }
    out.m_77.x = _3850;
    out.m_77.y = _3852;
    out.m_77.z = _3854;
    if (!_3836)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3940 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3940;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

