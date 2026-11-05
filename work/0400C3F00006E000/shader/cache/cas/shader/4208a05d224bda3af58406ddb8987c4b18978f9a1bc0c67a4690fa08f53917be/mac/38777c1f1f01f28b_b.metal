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
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_73 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 m_85 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3884 = false;
    bool _822 = false;
    bool _590 = false;
    bool _476 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    float _120 = _118;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _122 = 0;
    if (!_112)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4139 = as_type<float>(_126);
        out.gl_Position.z = _4139;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_49.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_140)
    {
        float _146 = float(_108);
        _120 = _146;
    }
    float _148 = _120;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_47.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _128 = as_type<int>(_160);
    }
    int _162 = _128;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4208 = as_type<float>(_162);
        out.gl_Position.z = _4208;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = in.m_51.w;
    float _166 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = in.m_49.z;
    int _184 = int(_176);
    int _186 = false ? 2 : 0;
    int _188 = _184 | _186;
    int _190 = false ? 4 : 0;
    int _192 = _188 | _190;
    int _194 = false ? 8 : 0;
    int _196 = _192 | _194;
    int _198 = false ? 16 : 0;
    int _200 = _196 | _198;
    int _202 = false ? 32 : 0;
    int _204 = _200 | _202;
    int _206 = false ? 64 : 0;
    int _208 = _204 | _206;
    int _210 = _208 & 1;
    float _212 = in.m_44.x;
    float _214 = in.m_44.y;
    float _216 = in.m_44.z;
    float _218 = as_type<float>(_210);
    float _220 = _166;
    if (!_176)
    {
        float _222 = _166 * _166;
        float _224 = _222 * 0.5;
        _218 = _224;
    }
    float _226 = _218;
    float _228 = _226;
    if (!_176)
    {
        float _230 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _228 = _230;
    }
    float _232 = _228;
    bool _234 = !_176;
    float _236 = _232;
    float _238 = 0.0;
    float _240 = 0.0;
    if (!_234)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = _166 * _244;
        float _254 = 1.0 / _248;
        float _256 = _250 * 0.693147182464599609375;
        float _258 = exp2(_252);
        float _260 = 1.0 / _256;
        float _262 = _258 + (-1.0);
        float _264 = -_262;
        float _266 = fma(_264, _260, _166);
        float _268 = _266 * _254;
        float _270 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _270;
        _238 = _254;
        _240 = _260;
    }
    float _272 = _236;
    float _274 = _238;
    float _276 = _240;
    bool _278 = !_176;
    float _280 = _276;
    float _282 = _274;
    float _284 = _272;
    if (!_278)
    {
        float _286 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = log2(_286);
        float _290 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _292 = _290 + 1.0;
        float _294 = 1.0 / _292;
        float _296 = _166 * _288;
        float _298 = exp2(_296);
        float _300 = -_298;
        float _302 = _300 + 1.0;
        float _304 = _302 * _294;
        _220 = _304;
        _280 = _292;
    }
    float _306 = _220;
    float _308 = _280;
    float _310 = _308;
    if (!_176)
    {
        float _312 = _144 * _144;
        float _314 = _312 * 0.5;
        _282 = _314;
    }
    float _316 = _282;
    float _318 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _320 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _322 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_176)
    {
        _310 = _144;
    }
    float _324 = _310;
    float _326 = fma(_306, _178, _318);
    float _328 = fma(_306, _180, _320);
    float _330 = _324;
    if (!_176)
    {
        float _332 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _284 = _332;
    }
    float _334 = _284;
    bool _336 = !_176;
    float _338 = _334;
    if (!_336)
    {
        float _340 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _342 = log2(_340);
        float _344 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _346 = _344 + 1.0;
        float _348 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _350 = _144 * _342;
        float _352 = 1.0 / _346;
        float _354 = _348 * 0.693147182464599609375;
        float _356 = exp2(_350);
        float _358 = 1.0 / _354;
        float _360 = _356 + (-1.0);
        float _362 = -_360;
        float _364 = fma(_362, _358, _144);
        float _366 = _364 * _352;
        float _368 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _338 = _368;
    }
    float _370 = _338;
    bool _372 = !_176;
    if (!_372)
    {
        float _374 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _376 = log2(_374);
        float _378 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _380 = _378 + 1.0;
        float _382 = 1.0 / _380;
        float _384 = _144 * _376;
        float _386 = exp2(_384);
        float _388 = -_386;
        float _390 = _388 + 1.0;
        float _392 = _390 * _382;
        _330 = _392;
    }
    float _394 = _330;
    float _396 = _370 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _398 = _370 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _400 = _370 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _402 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _404 = fma(_394, _180, _396);
    float _406 = fma(_394, _178, _398);
    float _408 = fma(_394, _182, _400);
    float _410 = fma(_306, _182, _322);
    float _412 = -_404;
    float _414 = _328 + _412;
    float _416 = -_406;
    float _418 = _326 + _416;
    float _420 = fma(_326, _164, _212);
    float _422 = -_408;
    float _424 = _410 + _422;
    float _426 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _428 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _430 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _432 = fma(_328, _164, _214);
    float _434 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].x, _426);
    float _436 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].x, _428);
    float _438 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].x, _430);
    float _440 = fma(_410, _164, _216);
    float _442 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[4].z, _434);
    float _444 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
    float _446 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[6].z, _438);
    bool _448 = !_402;
    float _450 = _444;
    float _452 = _442;
    float _454 = _446;
    float _456 = _442;
    float _474;
    if (!_448)
    {
        float _458 = in.m_53.x;
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _462 = _458 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _466 = _464 * _460;
        float _468 = floor(_466);
        float _470 = -_468;
        float _472 = _466 + _470;
        _474 = _472;
        _476 = true;
    }
    else
    {
        float _478 = float(_108);
        float _480 = 1.0 / _478;
        float _482 = _144 * _480;
        _474 = _482;
    }
    _476 = false;
    float _484 = _474;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _488 = _484 + _486;
    bool _490 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _492 = isnan(_484);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _502;
    bool _506 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _508 = isnan(_484);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -_500;
    float _520 = _518 + 1.0;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _522;
    float _526 = 1.0 / _504;
    bool _528 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _530 = _516 * _520;
    float _532 = -_516;
    float _534 = _532 + 1.0;
    float _536 = _488 * _526;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _538;
    float _542 = fma(_524, _536, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _544;
    float _548 = fma(_540, _536, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _550 = _542 * _530;
    float _552 = fma(_546, _536, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _554 = _548 * _530;
    float _556 = _552 * _530;
    float _558 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].x, _550);
    float _560 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].y, _556);
    float _562 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].z, _554);
    float _564 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[144].x, _558);
    float _566 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[144].y, _560);
    float _568 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[144].z, _562);
    bool _570 = !_528;
    float _588;
    if (!_570)
    {
        float _572 = in.m_53.x;
        float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _576 = _572 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _580 = _578 * _574;
        float _582 = floor(_580);
        float _584 = -_582;
        float _586 = _580 + _584;
        _588 = _586;
        _590 = true;
    }
    else
    {
        float _592 = float(_108);
        float _594 = 1.0 / _592;
        float _596 = _144 * _594;
        _588 = _596;
    }
    _590 = false;
    float _598 = _588;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _602 = _598 + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _616 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _618 = isnan(_598);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = 1.0 / _606;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _634 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _636 = isnan(_598);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    bool _646 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _648 = 1.0 / _614;
    float _650 = _610 * _628;
    bool _652 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _654 = isnan(_598);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = 1.0 / _632;
    float _666 = -_626;
    float _668 = _666 + 1.0;
    float _670 = fma(_650, _602, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _676 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _678 = isnan(_598);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = -_662;
    float _690 = _688 + 1.0;
    float _692 = _662 * _668;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _698 = 1.0 / _674;
    float _700 = -_686;
    float _702 = _700 + 1.0;
    float _704 = _644 * _690;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _706;
    float _710 = _696 * _648;
    float _712 = _626 * _702;
    float _714 = _670 * _704;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _718 = _598 + _716;
    float _720 = -_644;
    float _722 = _720 + 1.0;
    float _724 = _708 * _664;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _728 = _598 + _726;
    bool _730 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _732 = isnan(_598);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _746 = fma(_710, _718, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _748 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[115].x, _714);
    float _750 = fma(_724, _728, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _752 = _744 * _698;
    float _754 = -_740;
    float _756 = _754 + 1.0;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _760 = _598 + _758;
    float _762 = fma(_746, _692, _748);
    float _764 = _686 * _756;
    float _766 = fma(_752, _760, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _768 = fma(_750, _712, _762);
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _772 = fma(_766, _764, _768);
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _776 = _770 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _778 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[119].x, _772);
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _782 = _774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _784 = _778 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _786 = in.m_51.x;
    float _788 = in.m_51.y;
    float _790 = in.m_51.z;
    float _792 = _780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _776;
    out.m_55.y = _782;
    out.m_55.z = _792;
    out.m_55.w = _784;
    float _794 = _568 * _790;
    float _796 = _566 * _788;
    float _798 = _564 * _786;
    bool _800 = !_646;
    float _802 = _794;
    float _820;
    if (!_800)
    {
        float _804 = in.m_53.x;
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _808 = _804 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[11].z, _144);
        float _812 = _810 * _806;
        float _814 = floor(_812);
        float _816 = -_814;
        float _818 = _812 + _816;
        _820 = _818;
        _822 = true;
    }
    else
    {
        float _824 = float(_108);
        float _826 = 1.0 / _824;
        float _828 = _144 * _826;
        _820 = _828;
    }
    _822 = false;
    float _830 = _820;
    float _832 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _834 = int(_832);
    float _836 = in.m_53.x;
    float _838 = float(_108);
    float _840 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _842 = in.m_57.x;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _846 = _830 + _844;
    float _848 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _850 = int(_848);
    float _852 = in.m_53.y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _858 = in.m_53.z;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _862 = _830 + _860;
    float _864 = float(_834);
    float _866 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _868 = int(_866);
    float _870 = in.m_57.y;
    float _872 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _874 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _876 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _878 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _880 = float(_850);
    float _882 = 1.0 / _864;
    float _884 = -_878;
    float _886 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _884);
    float _888 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _892 = _890 != 0;
    float _894 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _896 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _898 = int(_896);
    float _900 = float(uint(_868));
    float _902 = -_888;
    float _904 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _902);
    int _906 = ~_868;
    int _908 = _906 + 1;
    float _910 = -_894;
    float _912 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _910);
    bool _914 = _868 == 0;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _918 = 1.0 / _880;
    float _920 = _144 * _882;
    float _922 = _920;
    bool _924 = _892;
    float _926 = _830;
    if (_892)
    {
        _116 = 1.0;
    }
    float _928 = _116;
    float _930 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[78].w, _916);
    float _932 = _928;
    if (!_892)
    {
        _932 = 1.2345600128173828125;
    }
    float _934 = _932;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _936;
    float _940 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _942 = 1.0 / _900;
    float _944 = float(uint(_898));
    int _946 = ~_898;
    int _948 = _946 + 1;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _950;
    float _954 = trunc(_920);
    int _956 = int(_954);
    float _958 = _144 * _918;
    int _960 = ~_868;
    int _962 = _960 + 1;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _966 = 1.0 / _944;
    int _968 = as_type<int>(_942) + (-2);
    float _970 = as_type<float>(_948);
    if (_892)
    {
        _922 = 1.0;
    }
    float _972 = _922;
    float _974 = _972;
    if (!_892)
    {
        _974 = 7.345489978790283203125;
    }
    float _976 = _974;
    float _978 = trunc(_958);
    int _980 = int(_978);
    float _982 = float(uint(_956));
    float _984 = as_type<float>(_968) * _982;
    int _986 = as_type<int>(_966) + (-2);
    float _988 = 1.0 / _838;
    float _990 = float(uint(_980));
    float _992 = trunc(_984);
    float _994 = precise::max(_992, 0.0);
    uint _997 = uint(_994);
    float _999 = as_type<float>(_986) * _990;
    float _1001 = _976 * _836;
    float _1003 = trunc(_999);
    float _1005 = precise::max(_1003, 0.0);
    uint _1007 = uint(_1005);
    int _1009 = ~_898;
    int _1011 = _1009 + 1;
    float _1013 = _144 * _988;
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1017 = _1015 != 0;
    int _1019 = _962 * int(_997);
    int _1021 = _1019 + _956;
    float _1023 = float(uint(_1021));
    float _1025 = floor(_1001);
    int _1027 = _1011 * int(_1007);
    int _1029 = _1027 + _980;
    float _1031 = as_type<float>(_968) * _1023;
    float _1033 = float(uint(_1029));
    float _1035 = as_type<float>(_1029);
    float _1037 = _1001;
    if (!_1017)
    {
        _1035 = _842;
    }
    float _1039 = _1035;
    float _1041 = trunc(_1031);
    float _1043 = precise::max(_1041, 0.0);
    uint _1045 = uint(_1043);
    float _1047 = as_type<float>(_986) * _1033;
    float _1049 = 0.0;
    float _1051 = _1039;
    if (!_1017)
    {
        _1049 = _1039;
    }
    float _1053 = _1049;
    float _1055 = _1053;
    if (_1017)
    {
        _1051 = _842;
    }
    float _1057 = _1051;
    float _1059 = float(_868);
    float _1061 = trunc(_1047);
    float _1063 = precise::max(_1061, 0.0);
    uint _1065 = uint(_1063);
    float _1067 = -_1025;
    float _1069 = _1001 + _1067;
    float _1071 = _1057;
    if (_892)
    {
        _1037 = _836;
    }
    float _1073 = _1037;
    float _1075 = _1073;
    if (!_892)
    {
        _1075 = _852;
    }
    float _1077 = _1075;
    float _1079 = _1069 * _1059;
    if (_1017)
    {
        bool _1081 = _836 > 0.5;
        _924 = _1081;
    }
    bool _1083 = _924;
    int _1085 = int(_997) + int(_1045);
    int _1087 = int(_1045);
    if (_1017)
    {
        float _1089 = -_1057;
        float _1091 = _1089 + 1.0;
        _1087 = as_type<int>(_1091);
    }
    int _1093 = _1087;
    float _1095 = float(_956);
    float _1097 = _1077 * _934;
    int _1099 = _908 * _1085;
    int _1101 = _1099 + _956;
    bool _1103 = _1095 >= _1059;
    bool _1105 = isnan(_1095);
    bool _1107 = _1103 || _1105;
    bool _1109 = isnan(_1059);
    bool _1111 = _1107 || _1109;
    float _1113 = float(_1111);
    float _1115 = _1013 * _1059;
    if (_1017)
    {
        float _1117 = _1083 ? as_type<float>(_1093) : _1057;
        _1055 = _1117;
    }
    float _1119 = _1055;
    bool _1121 = uint(_1101) >= uint(_868);
    float _1123 = trunc(_1113);
    int _1125 = int(_1123);
    int _1127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1129 = _1127 != 0;
    bool _1131 = !_1121;
    int _1133 = _1131 ? 0 : (-1);
    int _1135 = int(_1007) + int(_1065);
    bool _1137 = !_1129;
    int _1139 = _1137 ? 0 : 1;
    float _1141 = trunc(_1079);
    int _1143 = int(_1141);
    int _1145 = ~_1085;
    int _1147 = _1145 + _1133;
    int _1149 = _1147 + 1;
    int _1151 = abs(_1139);
    int _1153 = ~_898;
    int _1155 = _1153 + 1;
    int _1157 = _868 * _1149;
    int _1159 = _1157 + _956;
    int _1161 = _1155 * _1135;
    int _1163 = _1161 + _980;
    int _1165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1167 = _1165 != 0;
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1171 = _1169 != 0;
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1175 = _1173 != 0;
    float _1177 = trunc(_1115);
    int _1179 = int(_1177);
    int _1181 = ~_1125;
    int _1183 = _1181 + 1;
    int _1185 = _1183 + 1;
    bool _1187 = !_914;
    int _1189 = _1187 ? _1159 : (-1);
    int _1191 = _1143 * _1151;
    int _1193 = _1191 + _956;
    bool _1195 = uint(_1163) >= uint(_898);
    bool _1197 = !_1171;
    int _1199 = _1197 ? 0 : 1;
    int _1201 = _1189 * _1185;
    bool _1203 = !_1167;
    int _1205 = _1203 ? 0 : 1;
    int _1207 = _868 + (-1);
    int _1209 = abs(_1199);
    int _1211 = abs(_1205);
    float _1213 = floor(_1097);
    int _1215 = _1125 * _1207;
    int _1217 = _1215 + _1201;
    float _1219 = float(_898);
    float _1221 = float(_980);
    int _1223 = _1217 * _1209;
    bool _1225 = !_1175;
    int _1227 = _1225 ? 0 : 1;
    bool _1229 = _1221 >= _1219;
    bool _1231 = isnan(_1221);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan(_1219);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    int _1241 = _1179 * _1211;
    int _1243 = _1241 + _1223;
    int _1245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1247 = _1245 != 0;
    bool _1249 = !_1195;
    int _1251 = _1249 ? 0 : (-1);
    int _1253 = abs(_1227);
    float _1255 = trunc(_1239);
    int _1257 = int(_1255);
    bool _1259 = !_1247;
    int _1261 = _1259 ? 0 : 1;
    float _1263 = -_1213;
    float _1265 = _1097 + _1263;
    int _1267 = ~_1135;
    int _1269 = _1267 + _1251;
    int _1271 = _1269 + 1;
    int _1273 = _1193 * _1253;
    int _1275 = _1273 + _1243;
    int _1277 = abs(_1261);
    int _1279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1281 = _1279 != 0;
    int _1283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1285 = _1283 != 0;
    int _1287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1289 = _1287 != 0;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1293 = _1291 != 0;
    int _1295 = _898 * _1271;
    int _1297 = _1295 + _980;
    float _1299 = _1013 * _1219;
    float _1301 = _1265 * _1219;
    int _1303 = _1143 * _1277;
    int _1305 = _1303 + _1275;
    bool _1307 = !_1285;
    int _1309 = _1307 ? 0 : 1;
    bool _1311 = !_1281;
    int _1313 = _1311 ? 0 : 1;
    float _1315 = trunc(_1299);
    int _1317 = int(_1315);
    bool _1319 = _898 == 0;
    int _1321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1323 = _1321 != 0;
    float _1325 = float(uint(_1305));
    int _1327 = ~_1257;
    int _1329 = _1327 + 1;
    int _1331 = _1329 + 1;
    float _1333 = trunc(_1301);
    int _1335 = int(_1333);
    bool _1337 = !_1319;
    int _1339 = _1337 ? _1297 : (-1);
    float _1341 = as_type<float>(_968) * _1325;
    bool _1343 = !_1323;
    int _1345 = _1343 ? 0 : 1;
    int _1347 = abs(_1309);
    int _1349 = _1339 * _1331;
    int _1351 = abs(_1345);
    float _1353 = trunc(_1341);
    float _1355 = precise::max(_1353, 0.0);
    uint _1357 = uint(_1355);
    int _1359 = _898 + (-1);
    int _1361 = abs(_1313);
    int _1363 = _1257 * _1359;
    int _1365 = _1363 + _1349;
    int _1367 = _1335 * _1351;
    int _1369 = _1367 + _980;
    int _1371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1373 = _1371 != 0;
    bool _1375 = !_1289;
    int _1377 = _1375 ? 0 : 1;
    int _1379 = _1365 * _1347;
    int _1381 = ~_868;
    int _1383 = _1381 + 1;
    float _1385 = in.m_53.w;
    int _1387 = abs(_1377);
    int _1389 = _1317 * _1361;
    int _1391 = _1389 + _1379;
    int _1393 = as_type<int>(_1341);
    int _1395 = _1347;
    if (_1373)
    {
        float _1397 = -_1057;
        float _1399 = _1397 + 1.0;
        _1393 = as_type<int>(_1399);
    }
    int _1401 = _1393;
    bool _1403 = _858 > 0.5;
    int _1405 = _1383 * int(_1357);
    int _1407 = _1405 + _1305;
    float _1409 = 0.0;
    if (!_1373)
    {
        _1409 = _1057;
    }
    float _1411 = _1409;
    int _1413 = _1369 * _1387;
    int _1415 = _1413 + _1391;
    float _1417 = _1411;
    if (_1373)
    {
        float _1419 = _1403 ? as_type<float>(_1401) : _1057;
        _1417 = _1419;
    }
    float _1421 = _1417;
    float _1423 = -_870;
    float _1425 = _1423 + 1.0;
    float _1427 = float(uint(_1407));
    bool _1429 = !_1293;
    int _1431 = _1429 ? 0 : 1;
    bool _1433 = _852 > 0.5;
    float _1435 = as_type<float>(_968) * _1427;
    int _1437 = abs(_1431);
    float _1439 = float(uint(_1193));
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1443 = _1441 != 0;
    float _1445 = trunc(_1435);
    float _1447 = precise::max(_1445, 0.0);
    uint _1449 = uint(_1447);
    int _1451 = _1433 ? as_type<int>(_1425) : as_type<int>(_870);
    float _1453 = as_type<float>(_968) * _1439;
    bool _1455 = _868 == 0;
    float _1457 = _1443 ? as_type<float>(_1451) : _870;
    int _1459 = _1335 * _1437;
    int _1461 = _1459 + _1415;
    bool _1463 = _1385 > 0.5;
    float _1465 = trunc(_1453);
    float _1467 = precise::max(_1465, 0.0);
    uint _1469 = uint(_1467);
    int _1471 = ~_868;
    int _1473 = _1471 + 1;
    int _1475 = _1463 ? as_type<int>(_1425) : as_type<int>(_870);
    float _1477 = float(uint(_1461));
    int _1479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1481 = _1479 != 0;
    int _1483 = int(_1357) + int(_1449);
    float _1485 = as_type<float>(_986) * _1477;
    float _1487 = _1481 ? as_type<float>(_1475) : _870;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1491 = _1489 != 0;
    float _1493 = trunc(_1485);
    float _1495 = precise::max(_1493, 0.0);
    uint _1497 = uint(_1495);
    int _1499 = ~_868;
    int _1501 = _1499 + 1;
    int _1503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1505 = _1503 != 0;
    int _1507 = _1473 * int(_1469);
    int _1509 = _1507 + _1193;
    int _1511 = ~_898;
    int _1513 = _1511 + 1;
    int _1515 = _1501 * _1483;
    int _1517 = _1515 + _1305;
    float _1519 = float(uint(_1509));
    float _1521 = _870;
    int _1523 = _1513;
    float _1525 = _1457;
    if (_1491)
    {
        float _1527 = _1403 ? _1425 : _870;
        _1521 = _1527;
    }
    float _1529 = _1521;
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1531;
    bool _1535 = uint(_1517) >= uint(_868);
    float _1537 = as_type<float>(_968) * _1519;
    float _1539 = 1.0 / _1533;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1543 = _1541 != 0;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1549 = !_1535;
    int _1551 = _1549 ? 0 : (-1);
    int _1553 = _1513 * int(_1497);
    int _1555 = _1553 + _1461;
    int _1557 = ~_898;
    int _1559 = _1557 + 1;
    int _1561 = ~_1483;
    int _1563 = _1561 + _1551;
    int _1565 = _1563 + 1;
    float _1567 = trunc(_1537);
    float _1569 = precise::max(_1567, 0.0);
    uint _1571 = uint(_1569);
    float _1573 = float(uint(_1555));
    if (_1505)
    {
        _1523 = 0;
    }
    int _1575 = _1523;
    int _1577 = _868 * _1565;
    int _1579 = _1577 + _1305;
    int _1581 = 0;
    int _1583 = _1575;
    if (_1505)
    {
        _1581 = 0;
    }
    int _1585 = _1581;
    float _1587 = as_type<float>(_986) * _1573;
    int _1589 = _1585;
    if (_1543)
    {
        float _1591 = -_1057;
        float _1593 = _1591 + 1.0;
        _1395 = as_type<int>(_1593);
    }
    int _1595 = _1395;
    if (!_1505)
    {
        _1583 = 1;
    }
    int _1597 = _1583;
    float _1599 = 1.0 / _1547;
    bool _1601 = !_1455;
    int _1603 = _1601 ? _1579 : (-1);
    float _1605 = _846 * _1539;
    if (_1543)
    {
        float _1607 = _1433 ? as_type<float>(_1595) : _1057;
        _1071 = _1607;
    }
    float _1609 = _1071;
    int _1611 = _1603 & 3;
    bool _1613 = _1611 != 0;
    int _1615 = _1603 & 3;
    bool _1617 = _1615 != 0;
    float _1619 = trunc(_1587);
    float _1621 = precise::max(_1619, 0.0);
    uint _1623 = uint(_1621);
    int _1625 = _1613 ? 0 : 1;
    bool _1627 = uint(_1615) > 1u;
    bool _1629 = uint(_1615) >= 2u;
    int _1631 = int(_1469) + int(_1571);
    float _1633 = _862 * _1599;
    int _1635 = ~_868;
    int _1637 = _1635 + 1;
    float _1639 = in.m_59.w;
    int _1641 = _1629 ? 0 : 1;
    bool _1643 = _1615 != 3;
    int _1645 = _1637 * _1631;
    int _1647 = _1645 + _1193;
    int _1649 = ~_1641;
    int _1651 = _1649 + 1;
    int _1653 = _1651 + 1;
    int _1655 = int(_1497) + int(_1623);
    float _1657 = float(uint(_1369));
    int _1659 = ~_1625;
    int _1661 = _1659 + 1;
    int _1663 = _1661 + 1;
    int _1665 = _1559 * _1655;
    int _1667 = _1665 + _1461;
    int _1669 = _1663;
    int _1671 = _1653;
    if (!_1627)
    {
        int _1673 = ~_1625;
        int _1675 = _1673 + 1;
        _1669 = _1675;
    }
    int _1677 = _1669;
    float _1679 = _432 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1681 = uint(_1647) >= uint(_868);
    float _1683 = as_type<float>(_986) * _1657;
    if (_1643)
    {
        int _1685 = ~_1641;
        int _1687 = _1685 + 1;
        _1671 = _1687;
    }
    int _1689 = _1671;
    float _1691 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1679);
    bool _1693 = uint(_1667) >= uint(_898);
    float _1695 = trunc(_1683);
    float _1697 = precise::max(_1695, 0.0);
    uint _1699 = uint(_1697);
    bool _1701 = !_1681;
    int _1703 = _1701 ? 0 : (-1);
    float _1705 = _432 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1707 = !_1693;
    int _1709 = _1707 ? 0 : (-1);
    float _1711 = _432 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1715 = _1713 != 0;
    float _1717 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1705);
    int _1719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1721 = _1719 != 0;
    float _1723 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1711);
    int _1725 = ~_898;
    int _1727 = _1725 + 1;
    float _1729 = _836 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1731 = ~_1655;
    int _1733 = _1731 + _1709;
    int _1735 = _1733 + 1;
    float _1737 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1717);
    float _1739 = -_854;
    float _1741 = fma(_1729, 2.0, _1739);
    float _1743 = _852 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1745 = _898 * _1735;
    int _1747 = _1745 + _1461;
    bool _1749 = !_1617;
    int _1751 = _1749 ? 0 : 1;
    int _1753 = _1727 * int(_1699);
    int _1755 = _1753 + _1369;
    float _1757 = fma(_1743, -2.0, _856);
    if (!_1505)
    {
        _1589 = 2;
    }
    int _1759 = _1589;
    float _1761 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1691);
    bool _1763 = !_1319;
    int _1765 = _1763 ? _1747 : (-1);
    float _1767 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1723);
    float _1769 = float(uint(_1755));
    out.m_61.w = _1639;
    int _1771 = _1765 & 3;
    bool _1773 = _1771 != 0;
    float _1775 = _1761 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1777 = _1765 & 3;
    bool _1779 = _1777 != 0;
    float _1781 = as_type<float>(_986) * _1769;
    int _1783 = _1773 ? 0 : 1;
    float _1785 = _1767 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1787 = uint(_1777) > 1u;
    float _1789 = trunc(_1781);
    float _1791 = precise::max(_1789, 0.0);
    uint _1793 = uint(_1791);
    int _1795 = ~_1783;
    int _1797 = _1795 + 1;
    int _1799 = _1797 + 1;
    float _1801 = -_1775;
    float _1803 = _1801 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1805 = -_1785;
    float _1807 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1809 = -_144;
    float _1811 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1741);
    float _1813 = -_872;
    float _1815 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1813);
    float _1817 = in.m_63.x;
    float _1819 = in.m_63.y;
    float _1821 = in.m_63.z;
    float _1823 = -_874;
    float _1825 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1823);
    float _1827 = -_876;
    float _1829 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1827);
    int _1831 = _1799;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    float _1835 = 0.5;
    if (!_1787)
    {
        int _1837 = ~_1783;
        int _1839 = _1837 + 1;
        _1831 = _1839;
    }
    int _1841 = _1831;
    float _1843 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1845 = uint(_1777) >= 2u;
    float _1847 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    int _1849 = int(_1699) + int(_1793);
    float _1851 = _798 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1853 = _1845 ? 0 : 1;
    float _1855 = in.m_65.x;
    float _1857 = in.m_65.y;
    float _1859 = in.m_65.z;
    bool _1861 = _1777 != 3;
    float _1863 = -_1847;
    float _1865 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1863);
    int _1867 = ~_1853;
    int _1869 = _1867 + 1;
    int _1871 = _1869 + 1;
    float _1873 = in.m_67.x;
    float _1875 = in.m_67.y;
    float _1877 = in.m_67.z;
    float _1879 = in.m_67.w;
    float _1881 = fma(_1421, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _1883 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1865);
    int _1885 = ~_1631;
    int _1887 = _1885 + _1703;
    int _1889 = _1887 + 1;
    int _1891 = abs(_1677);
    int _1893 = abs(_1689);
    int _1895 = _868 * _1889;
    int _1897 = _1895 + _1193;
    float _1899 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1819);
    float _1901 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1817);
    int _1903 = _1871;
    if (_1861)
    {
        int _1905 = ~_1853;
        int _1907 = _1905 + 1;
        _1903 = _1907;
    }
    int _1909 = _1903;
    float _1911 = _840 * _1899;
    float _1913 = _1737 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1915 = _1851 * _1901;
    int _1917 = _948 * _1849;
    int _1919 = _1917 + _1369;
    int _1921 = abs(_1909);
    float _1923 = -_1913;
    float _1925 = _1923 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _1927 = uint(_1919) >= uint(_898);
    float _1929 = _1925 * _1925;
    float _1931 = _1855 * _1877;
    float _1933 = _1857 * _1873;
    bool _1935 = !_1927;
    int _1937 = _1935 ? 0 : (-1);
    float _1939 = fma(_1803, _1803, _1929);
    bool _1941 = _1597 != 1;
    float _1943 = _1859 * _1875;
    float _1945 = -_1931;
    float _1947 = fma(_1859, _1873, _1945);
    float _1949 = fma(_1807, _1807, _1939);
    float _1951 = -_1933;
    float _1953 = fma(_1875, _1855, _1951);
    float _1955 = -_1943;
    float _1957 = fma(_1877, _1857, _1955);
    float _1959 = _1947 * _1879;
    float _1961 = rsqrt(_1949);
    float _1963 = _1953 * _1879;
    float _1965 = _1957 * _1879;
    float _1967 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1969 = _1931;
    float _1971 = _1947;
    if (!_1941)
    {
        _1969 = _852;
    }
    float _1973 = _1969;
    float _1975 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1967);
    float _1977 = _1973;
    if (!_1941)
    {
        _1833 = _858;
    }
    float _1979 = _1833;
    float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1983 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1981;
    float _1985 = 0.0;
    float _1987 = _1979;
    if (!_1941)
    {
        _1985 = _1973;
    }
    float _1989 = _1985;
    float _1991 = _1989;
    if (_1941)
    {
        _1977 = _852;
    }
    float _1993 = _1977;
    float _1995 = _1993;
    if (!_1941)
    {
        _970 = _1989;
    }
    float _1997 = _970;
    float _1999 = _1997;
    if (!_1941)
    {
        _1971 = _858;
    }
    float _2001 = _1971;
    float _2003 = _1807 * _1961;
    float _2005 = _2001;
    if (_1941)
    {
        _1999 = _836;
    }
    float _2007 = _1999;
    if (_1941)
    {
        _1991 = _836;
    }
    float _2009 = _1991;
    if (_1941)
    {
        _1987 = _1993;
    }
    float _2011 = _1987;
    if (_1941)
    {
        _2005 = _1993;
    }
    float _2013 = _2005;
    bool _2015 = _1759 != 2;
    float _2017 = _1803 * _1961;
    float _2019 = fma(_938, _1605, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2021 = fma(_952, _1605, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2023 = _2017 * _2017;
    float _2025 = fma(_1983, _1605, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2027 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _2029 = ~_1849;
    int _2031 = _2029 + _1937;
    int _2033 = _2031 + 1;
    float _2035 = fma(_2003, _2003, _2023);
    float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2039 = _2037 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2043 = _2041 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2047 = _2045 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2049 = _1925 * _1961;
    float _2051 = fma(_2039, _1633, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2053 = rsqrt(_2035);
    float _2055 = fma(_2043, _1633, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2057 = _2043;
    if (_2015)
    {
        _2057 = _836;
    }
    float _2059 = _2057;
    float _2061 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2063 = _2059;
    if (!_2015)
    {
        _2063 = _858;
    }
    float _2065 = _2063;
    float _2067 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[88].z, _964);
    float _2069 = fma(_2047, _1633, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2073 = -_2061;
    float _2075 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2073);
    if (!_2015)
    {
        _1995 = _836;
    }
    float _2077 = _1995;
    float _2079 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2081 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2071);
    float _2083 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2075);
    float _2085 = -_2027;
    float _2087 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2085);
    bool _2089 = _1819 != 0.0;
    bool _2091 = isnan(_1819);
    bool _2093 = _2089 || _2091;
    bool _2095 = isnan(0.0);
    bool _2097 = _2093 || _2095;
    float _2099 = _2065 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2101 = _2003 * _2053;
    float _2103 = _2017 * _2053;
    float _2105 = -_2079;
    float _2107 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2105);
    float _2109 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2111 = -_2101;
    float _2113 = _2003 * _2111;
    float _2115 = _2049 * _2103;
    float _2117 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2087);
    float _2119 = -_2109;
    float _2121 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2119);
    float _2123 = -_2113;
    float _2125 = fma(_2017, _2103, _2123);
    float _2127 = -_2101;
    float _2129 = _2049 * _2127;
    float _2131 = _904 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2133 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2107);
    float _2135 = _2125 * _2125;
    bool _2137 = _1817 == 0.0;
    bool _2139 = !_2097;
    bool _2141 = _2137 && _2139;
    float _2143 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2145 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2147 = fma(_2115, _2115, _2135);
    float _2149 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _2151 = _1821 == 0.0;
    bool _2153 = _2151 && _2141;
    float _2155 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2157 = fma(_2129, _2129, _2147);
    float _2159 = -_2149;
    float _2161 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2159);
    float _2163 = -_2131;
    float _2165 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2163);
    float _2167 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _930);
    float _2169 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1757);
    float _2171 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2161);
    float _2173 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2165);
    float _2175 = rsqrt(_2157);
    float _2177 = -_2155;
    float _2179 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2177);
    bool _2181 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2183 = isnan(_830);
    bool _2185 = _2181 || _2183;
    bool _2187 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2189 = _2185 || _2187;
    float _2191 = float(_2189);
    float _2193 = -_2173;
    float _2195 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2133);
    if (_2153)
    {
        _1525 = _1855;
    }
    float _2197 = _1525;
    float _2199 = -_2169;
    float _2201 = fma(_2167, _2143, _2199);
    float _2203 = _2197;
    if (!_2153)
    {
        float _2205 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1855);
        _2203 = _2205;
    }
    float _2207 = _2203;
    bool _2209 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2211 = isnan(_830);
    bool _2213 = _2209 || _2211;
    bool _2215 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2217 = _2213 || _2215;
    float _2219 = float(_2217);
    float _2221 = -_2191;
    float _2223 = _2221 + 1.0;
    float _2225 = 1.0 / _2195;
    bool _2227 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2229 = isnan(_830);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2235 = _2231 || _2233;
    float _2237 = float(_2235);
    float _2239 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2179);
    if (_2153)
    {
        _926 = _1857;
    }
    float _2241 = _926;
    float _2243 = _2241;
    if (!_2153)
    {
        float _2245 = fma(_1819, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1857);
        _2243 = _2245;
    }
    float _2247 = _2243;
    float _2249 = _2219 * _2223;
    float _2251 = -_2219;
    float _2253 = _2251 + 1.0;
    float _2255 = _2125 * _2175;
    float _2257 = precise::clamp(_2255, 0.0, 1.0);
    if (_2153)
    {
        _802 = _1859;
    }
    float _2259 = _802;
    float _2261 = _940 * _1821;
    float _2263 = _2259;
    if (!_2153)
    {
        float _2265 = fma(_1821, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1859);
        _2263 = _2265;
    }
    float _2267 = _2263;
    float _2269 = -_2257;
    float _2271 = _2269 + 1.0;
    float _2273 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2121);
    float _2275 = _2237 * _2253;
    float _2277 = -_2237;
    float _2279 = _2277 + 1.0;
    float _2281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2283 = fma(_2171, _2225, -1.0);
    float _2285 = _2271 * _2225;
    float _2287 = _2019 * _2275;
    float _2289 = _2021 * _2275;
    float _2291 = fma(_2271, _2283, 1.0);
    float _2293 = _2273 * _2285;
    float _2295 = _2239 * _2285;
    float _2297 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2287);
    float _2299 = _2291 * _2291;
    float _2301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2303 = _2025 * _2275;
    float _2305 = fma(_2051, _2249, _2297);
    float _2307 = fma(_2293, _2293, _2299);
    float _2309 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2289);
    float _2311 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2303);
    float _2313 = _2281 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2315 = fma(_2295, _2295, _2307);
    float _2317 = fma(_2055, _2249, _2309);
    float _2319 = fma(_2069, _2249, _2311);
    float _2321 = rsqrt(_2315);
    float _2323 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2081);
    float _2325 = fma(_2191, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2317);
    float _2327 = fma(_2313, _1529, -0.5);
    float _2329 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2067);
    float _2331 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2333 = fma(_2323, _1843, _1811);
    int _2335 = _898 * _2033;
    int _2337 = _2335 + _1369;
    bool _2339 = !_1779;
    int _2341 = _2339 ? 0 : 1;
    float _2343 = fma(_2331, _1609, -0.5);
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2347 = fma(_2191, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2305);
    float _2349 = fma(_2191, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2319);
    float _2351 = -_2345;
    float _2353 = fma(_2099, 2.0, _2351);
    float _2355 = _2347 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2357 = _2295 * _2321;
    float _2359 = _2291 * _2321;
    float _2361 = _2293 * _2321;
    float _2363 = -_2357;
    float _2365 = _2017 * _2363;
    float _2367 = _2003 * _2359;
    float _2369 = -_2361;
    float _2371 = _2049 * _2369;
    float _2373 = -_144;
    float _2375 = fma(_2373, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2353);
    float _2377 = -_2361;
    float _2379 = -_2365;
    float _2381 = fma(_2003, _2377, _2379);
    float _2383 = -_2357;
    float _2385 = -_2367;
    float _2387 = fma(_2049, _2383, _2385);
    float _2389 = -_2371;
    float _2391 = fma(_2017, _2359, _2389);
    float _2393 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2395 = _2381 * _2381;
    float _2397 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2399 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2401 = fma(_2329, _2343, _2375);
    float _2403 = fma(_2387, _2387, _2395);
    int _2405 = _1603 >> 31;
    float _2407 = fma(_2009, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2393);
    float _2409 = fma(_2391, _2391, _2403);
    float _2411 = fma(_2013, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2397);
    float _2413 = _2325 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2415 = _2349 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2417 = rsqrt(_2409);
    int _2419 = _2405 & 3;
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2423 = _2355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2425 = _2413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2427 = _2415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2429 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2431 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2433 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    out.m_69.x = _2423;
    out.m_69.y = _2425;
    out.m_69.z = _2427;
    out.m_69.w = _2421;
    int _2435 = _1603 + _2419;
    float _2437 = -_2429;
    float _2439 = fma(_2431, 2.0, _2437);
    float _2441 = fma(_2399, -2.0, _2433);
    float _2443 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2445 = abs(_2341);
    float _2447 = _2387 * _2417;
    float _2449 = _2391 * _2417;
    float _2451 = _2381 * _2417;
    float _2453 = -_144;
    float _2455 = fma(_2453, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2439);
    float _2457 = _2003 * _2447;
    float _2459 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2441);
    float _2461 = fma(_2145, -2.0, _2443);
    int _2463 = ~_2445;
    int _2465 = _2463 + 1;
    int _2467 = _2465 + 1;
    float _2469 = -_2457;
    float _2471 = fma(_2017, _2449, _2469);
    int _2473 = _1765 >> 31;
    float _2475 = _2049 * _2449;
    int _2477 = _2435 >> 2;
    float _2479 = _2017 * _2451;
    int _2481 = _2473 & 3;
    float _2483 = -_2475;
    float _2485 = fma(_2003, _2451, _2483);
    int _2487 = _2477 << 4;
    int _2489 = _2487 + 368;
    float _2491 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2407);
    int _2493 = _1765 + _2481;
    float _2495 = _2471 * _2471;
    uint _2497 = uint(int(uint(_2489) >> uint(2)));
    uint _2499 = uint(int(uint(int(_2497)) >> uint(2)));
    int _2501 = int(_2497) & 3;
    float _2503 = (*spvDescriptorSet0.vp_c9)._m0[int(_2499)][_2501];
    int _2505 = int(_2497) + 1;
    uint _2507 = uint(int(uint(_2505) >> uint(2)));
    int _2509 = _2505 & 3;
    float _2511 = (*spvDescriptorSet0.vp_c9)._m0[int(_2507)][_2509];
    float _2513 = -_2479;
    float _2515 = fma(_2049, _2447, _2513);
    int _2517 = _2493 >> 2;
    float _2519 = fma(_2485, _2485, _2495);
    float _2521 = fma(_1487, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _2523 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2411);
    int _2525 = _2517 << 4;
    int _2527 = _2525 + 512;
    float _2529 = fma(_2515, _2515, _2519);
    float _2531 = fma(_2491, _1881, _2455);
    float _2533 = -_2459;
    float _2535 = fma(_2523, _2521, _2533);
    uint _2537 = uint(int(uint(_2527) >> uint(2)));
    uint _2539 = uint(int(uint(int(_2537)) >> uint(2)));
    int _2541 = int(_2537) & 3;
    float _2543 = (*spvDescriptorSet0.vp_c9)._m0[int(_2539)][_2541];
    int _2545 = int(_2537) + 1;
    uint _2547 = uint(int(uint(_2545) >> uint(2)));
    int _2549 = _2545 & 3;
    float _2551 = (*spvDescriptorSet0.vp_c9)._m0[int(_2547)][_2549];
    float _2553 = rsqrt(_2529);
    float _2555 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1975);
    float _2557 = _2201 + 0.5;
    float _2559 = _2333 + 0.5;
    float _2561 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2461);
    float _2563 = _2531 + 0.5;
    float _2565 = _2535 + 0.5;
    int _2567 = _2489 + 8;
    uint _2569 = uint(int(uint(_2567) >> uint(2)));
    uint _2571 = uint(int(uint(int(_2569)) >> uint(2)));
    int _2573 = int(_2569) & 3;
    float _2575 = (*spvDescriptorSet0.vp_c9)._m0[int(_2571)][_2573];
    int _2577 = int(_2569) + 1;
    uint _2579 = uint(int(uint(_2577) >> uint(2)));
    int _2581 = _2577 & 3;
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[int(_2579)][_2581];
    float _2585 = -_2561;
    float _2587 = fma(_2555, _2327, _2585);
    bool _2589 = _1615 != 3;
    out.m_71.x = _2559;
    out.m_71.y = _2557;
    out.m_71.z = _2563;
    out.m_71.w = _2565;
    int _2591 = _2527 + 8;
    uint _2593 = uint(int(uint(_2591) >> uint(2)));
    uint _2595 = uint(int(uint(int(_2593)) >> uint(2)));
    int _2597 = int(_2593) & 3;
    float _2599 = (*spvDescriptorSet0.vp_c9)._m0[int(_2595)][_2597];
    int _2601 = int(_2593) + 1;
    uint _2603 = uint(int(uint(_2601) >> uint(2)));
    int _2605 = _2601 & 3;
    float _2607 = (*spvDescriptorSet0.vp_c9)._m0[int(_2603)][_2605];
    float _2609 = _2515 * _2553;
    float _2611 = _2485 * _2553;
    float _2613 = _2471 * _2553;
    float _2615 = _2017 * _2609;
    float _2617 = _1911 * _2609;
    float _2619 = _1959 * _2609;
    float _2621 = _1959 * _2611;
    float _2623 = _2003 * _2613;
    float _2625 = -_2615;
    float _2627 = fma(_2003, _2611, _2625);
    float _2629 = _2049 * _2611;
    float _2631 = -_2623;
    float _2633 = fma(_2049, _2609, _2631);
    float _2635 = _2627 * _2627;
    int _2637 = ~_1891;
    int _2639 = _2637 + 1;
    int _2641 = _2639 + 1;
    float _2643 = -_2629;
    float _2645 = fma(_2017, _2613, _2643);
    int _2647 = abs(_1841);
    float _2649 = fma(_2633, _2633, _2635);
    bool _2651 = !_2589;
    int _2653 = _2651 ? 0 : (-1);
    float _2655 = _2611 * _1875;
    int _2657 = _2641 * as_type<int>(_2511);
    float _2659 = fma(_2645, _2645, _2649);
    int _2661 = abs(_1751);
    float _2663 = _2613 * _2247;
    int _2665 = ~_2647;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    int _2671 = ~_2661;
    int _2673 = _2671 + 1;
    int _2675 = _2673 + 1;
    float _2677 = rsqrt(_2659);
    bool _2679 = _1777 != 3;
    int _2681 = _2669 * as_type<int>(_2551);
    int _2683 = ~_1893;
    int _2685 = _2683 + 1;
    int _2687 = _2685 + 1;
    int _2689 = _2675 * as_type<int>(_2503);
    int _2691 = _2689 + _2657;
    int _2693 = _2467 * as_type<int>(_2543);
    int _2695 = _2693 + _2681;
    float _2697 = _1911 * _2611;
    float _2699 = _2611 * _2247;
    int _2701 = ~_1921;
    int _2703 = _2701 + 1;
    int _2705 = _2703 + 1;
    int _2707 = _2687 * as_type<int>(_2575);
    int _2709 = _2707 + _2691;
    bool _2711 = !_2679;
    int _2713 = _2711 ? 0 : (-1);
    float _2715 = _2645 * _2677;
    float _2717 = _2633 * _2677;
    float _2719 = _2613 * _1875;
    int _2721 = _2705 * as_type<int>(_2599);
    int _2723 = _2721 + _2695;
    float _2725 = fma(_1915, _2715, _2617);
    float _2727 = fma(_1915, _2717, _2697);
    float _2729 = _2609 * _1875;
    int _2731 = abs(_2653);
    float _2733 = fma(_2261, _2003, _2725);
    float _2735 = fma(_2261, _2017, _2727);
    int _2737 = abs(_2713);
    float _2739 = _1959 * _2613;
    float _2741 = _1785 + _2733;
    float _2743 = _1775 + _2735;
    float _2745 = _2627 * _2677;
    float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2749 = _2741 + _2747;
    float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2753 = _2743 + _2751;
    float _2755 = _1911 * _2613;
    float _2757 = _2749 * _2749;
    float _2759 = fma(_2717, _1873, _2655);
    float _2761 = fma(_2745, _1873, _2719);
    float _2763 = fma(_2715, _1873, _2729);
    float _2765 = fma(_2753, _2753, _2757);
    float _2767 = fma(_1915, _2745, _2755);
    bool _2769 = !_1715;
    int _2771 = _2769 ? 0 : 1;
    float _2773 = _2609 * _2247;
    float _2775 = sqrt(_2765);
    int _2777 = ~_2731;
    int _2779 = _2777 + 1;
    int _2781 = _2779 + 1;
    float _2783 = fma(_2261, _2049, _2767);
    int _2785 = ~_2737;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    float _2791 = fma(_2745, _2207, _2663);
    bool _2793 = !_1721;
    int _2795 = _2793 ? 0 : 1;
    int _2797 = _2781 * as_type<int>(_2583);
    int _2799 = _2797 + _2709;
    int _2801 = abs(_2771);
    float _2803 = fma(_1965, _2745, _2739);
    float _2805 = _1913 + _2783;
    int _2807 = abs(_2795);
    int _2809 = _2789 * as_type<int>(_2607);
    int _2811 = _2809 + _2723;
    float _2813 = fma(_1965, _2715, _2619);
    float _2815 = fma(_2715, _2207, _2773);
    float _2817 = fma(_1965, _2717, _2621);
    bool _2819 = _2775 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2821 = fma(_2717, _2207, _2699);
    int _2823 = ~_2801;
    int _2825 = _2823 + 1;
    int _2827 = _2825 + 1;
    int _2829 = ~_2807;
    int _2831 = _2829 + 1;
    int _2833 = _2831 + 1;
    float _2835 = _2715;
    float _2837 = _2613;
    float _2839 = _2741;
    if (!_2819)
    {
        _2835 = _2741;
    }
    float _2841 = _2835;
    float _2843 = _2841;
    if (!_2819)
    {
        _2837 = _2743;
    }
    float _2845 = _2837;
    float _2847 = _2845;
    if (!_2819)
    {
        _2839 = _2805;
    }
    float _2849 = _2839;
    bool _2851 = !_2819;
    float _2853 = _2849;
    if (!_2851)
    {
        float _2855 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2857 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2859 = _2775 + _2857;
        float _2861 = _2805 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2863 = rsqrt(_2765);
        float _2865 = _2859 * _2855;
        float _2867 = _2865 * 0.15915493667125701904296875;
        float _2869 = _2867 * 6.283185482025146484375;
        float _2871 = cos(_2869);
        float _2873 = _2867 * 6.283185482025146484375;
        float _2875 = sin(_2873);
        float _2877 = _2871 + (-1.0);
        float _2879 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2881 = fma(_2875, _2861, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2883 = fma(_2805, _2871, _2879);
        float _2885 = _2863 * _2881;
        float _2887 = fma(_2753, _2885, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2889 = fma(_2749, _2885, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2853 = _2883;
        _2847 = _2887;
        _2843 = _2889;
    }
    float _2891 = _2853;
    float _2893 = _2847;
    float _2895 = _2843;
    float _2897 = -_1913;
    float _2899 = _2897 + _2891;
    int _2901 = _2799 * _2827;
    float _2903 = -_1775;
    float _2905 = _2903 + _2893;
    int _2907 = _2811 * _2833;
    float _2909 = _2899 * _2899;
    bool _2911 = !_1455;
    int _2913 = _2911 ? _1897 : (-1);
    float _2915 = fma(_2049, _1877, _2761);
    bool _2917 = !_1319;
    int _2919 = _2917 ? _2337 : (-1);
    float _2921 = -_1785;
    float _2923 = _2921 + _2895;
    float _2925 = fma(_2905, _2905, _2909);
    int _2927 = _2913 * _2801;
    int _2929 = _2927 + _2901;
    float _2931 = fma(_1963, _2049, _2803);
    int _2933 = _2919 * _2807;
    int _2935 = _2933 + _2907;
    float _2937 = fma(_2923, _2923, _2925);
    float _2939 = fma(_2017, _1877, _2759);
    float _2941 = fma(_1963, _2017, _2817);
    float _2943 = fma(_1963, _2003, _2813);
    float _2945 = sqrt(_2937);
    float _2947 = fma(_2017, _2267, _2821);
    float _2949 = float(_2929);
    float _2951 = fma(_2003, _1877, _2763);
    float _2953 = _2401 + 0.5;
    float _2955 = _2587 + 0.5;
    float _2957 = fma(_2049, _2267, _2791);
    float _2959 = float(_2935);
    float _2961 = fma(_2003, _2267, _2815);
    out.m_73.x = _2939;
    out.m_73.y = _2915;
    out.m_73.z = _2951;
    out.m_75.x = _2953;
    out.m_75.y = _2955;
    bool _2963 = _2945 > 0.0;
    out.m_77.x = _2941;
    out.m_77.y = _2931;
    out.m_77.z = _2943;
    out.m_79.x = _2949;
    out.m_79.y = _2959;
    out.m_81.x = _2947;
    out.m_81.y = _2957;
    out.m_81.z = _2961;
    bool _2965 = !_2963;
    float _2967 = _2915;
    float _2969 = _2951;
    float _2971 = _2939;
    float _2973 = _2893;
    float _2975 = _2891;
    float _2977 = _2895;
    float _2979 = _2915;
    float _2981 = _2939;
    float _2983 = _2951;
    float _2985 = _2941;
    float _2987 = _2943;
    if (!_2965)
    {
        bool _2989 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2991 = _2049;
        if (_2989)
        {
            float _2993 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2991 = _2993;
        }
        float _2995 = _2991;
        if (_2989)
        {
            float _2997 = _442 * _2995;
            _2967 = _2997;
        }
        float _2999 = _2967;
        float _3001 = _2999;
        if (_2989)
        {
            float _3003 = _444 * _2995;
            _2969 = _3003;
        }
        float _3005 = _2969;
        float _3007 = _3005;
        if (_2989)
        {
            float _3009 = _446 * _2995;
            _2971 = _3009;
        }
        float _3011 = _2971;
        float _3013 = _3011;
        float _3015 = _3011;
        if (!_2989)
        {
            bool _3017 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _3019 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _3021 = _3017 || _3019;
            bool _3023 = isnan(1.0);
            bool _3025 = _3021 || _3023;
            float _3027 = _144 + 1.0;
            float _3029 = _3027;
            if (!_3025)
            {
                float _3031 = _3027 * _3027;
                float _3033 = _3031 * 0.5;
                _3013 = _3033;
            }
            float _3035 = _3013;
            float _3037 = _3035;
            if (!_3025)
            {
                float _3039 = _3035 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3037 = _3039;
            }
            float _3041 = _3037;
            bool _3043 = !_3025;
            float _3045 = _3041;
            if (!_3043)
            {
                float _3047 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3049 = log2(_3047);
                float _3051 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3053 = _3051 + 1.0;
                float _3055 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3057 = _3049 * _3027;
                float _3059 = 1.0 / _3053;
                float _3061 = _3055 * 0.693147182464599609375;
                float _3063 = exp2(_3057);
                float _3065 = 1.0 / _3061;
                float _3067 = _3063 + (-1.0);
                float _3069 = -_3067;
                float _3071 = fma(_3069, _3065, _3027);
                float _3073 = _3071 * _3059;
                float _3075 = _3073 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3045 = _3075;
            }
            float _3077 = _3045;
            float _3079 = _3077 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3081 = _3077 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3083 = !_3025;
            if (!_3083)
            {
                float _3085 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3087 = log2(_3085);
                float _3089 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3091 = _3089 + 1.0;
                float _3093 = 1.0 / _3091;
                float _3095 = _3087 * _3027;
                float _3097 = exp2(_3095);
                float _3099 = -_3097;
                float _3101 = _3099 + 1.0;
                float _3103 = _3101 * _3093;
                _3029 = _3103;
            }
            float _3105 = _3029;
            float _3107 = fma(_3105, _180, _3081);
            float _3109 = fma(_3105, _178, _3079);
            float _3111 = _3077 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3113 = -_404;
            float _3115 = _3113 + _3107;
            float _3117 = -_406;
            float _3119 = _3117 + _3109;
            float _3121 = fma(_3105, _182, _3111);
            float _3123 = _3115 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3125 = _3115 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3127 = _3115 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3129 = -_408;
            float _3131 = _3129 + _3121;
            float _3133 = fma(_3119, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3123);
            float _3135 = fma(_3119, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3125);
            float _3137 = fma(_3119, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3127);
            float _3139 = fma(_3131, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3133);
            float _3141 = fma(_3131, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3135);
            float _3143 = fma(_3131, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3137);
            _450 = _3141;
            _452 = _3139;
            _454 = _3143;
            _3001 = _3139;
            _3007 = _3141;
            _3015 = _3143;
        }
        float _3145 = _450;
        float _3147 = _452;
        float _3149 = _454;
        float _3151 = _3001;
        float _3153 = _3007;
        float _3155 = _3015;
        float _3157 = _3145 * _3145;
        float _3159 = rsqrt(_2937);
        float _3161 = fma(_3147, _3147, _3157);
        float _3163 = fma(_3149, _3149, _3161);
        float _3165 = sqrt(_3163);
        float _3167 = _2905 * _3159;
        float _3169 = _2899 * _3159;
        float _3171 = _2923 * _3159;
        bool _3173 = _3165 > 0.0;
        bool _3175 = !_3173;
        _2979 = _3151;
        _2981 = _3155;
        _2983 = _3153;
        _2985 = _3167;
        _456 = _3147;
        if (!_3175)
        {
            float _3177 = rsqrt(_3163);
            float _3179 = _3177 * _3145;
            float _3181 = _3177 * _3147;
            float _3183 = _3177 * _3149;
            float _3185 = _3169 * _3179;
            float _3187 = fma(_3167, _3181, _3185);
            float _3189 = fma(_3171, _3183, _3187);
            float _3191 = _3189 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3193 = fma(_3151, _3191, _2893);
            float _3195 = fma(_3153, _3191, _2891);
            float _3197 = fma(_3155, _3191, _2895);
            _2973 = _3193;
            _2975 = _3195;
            _2977 = _3197;
        }
    }
    float _3199 = _2973;
    float _3201 = _2975;
    float _3203 = _2977;
    float _3205 = _2979;
    float _3207 = _2981;
    float _3209 = _2983;
    float _3211 = _2985;
    float _3213 = _456;
    bool _3215 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3217 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3219 = _3215 || _3217;
    bool _3221 = isnan(0.5);
    bool _3223 = _3219 || _3221;
    float _3225 = _3207;
    float _3227 = _3205;
    float _3229 = _3209;
    float _3231 = _3213;
    if (_3223)
    {
        _3225 = _3199;
    }
    float _3233 = _3225;
    float _3235 = _3233;
    if (_3223)
    {
        _3227 = _3201;
    }
    float _3237 = _3227;
    float _3239 = _3237;
    if (_3223)
    {
        _3229 = _3203;
    }
    float _3241 = _3229;
    float _3243 = _3241;
    if (!_3223)
    {
        float _3245 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3247 = _1913 + _3245;
        float _3249 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3251 = _1775 + _3249;
        float _3253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3255 = -_1775;
        float _3257 = _3255 + _3199;
        float _3259 = _3247 * _3247;
        float _3261 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3263 = _1785 + _3261;
        float _3265 = -_1913;
        float _3267 = _3265 + _3201;
        float _3269 = -_1785;
        float _3271 = _3269 + _3203;
        float _3273 = fma(_3251, _3251, _3259);
        float _3275 = fma(_3263, _3263, _3273);
        float _3277 = sqrt(_3275);
        float _3279 = precise::min(_3277, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3281 = _3279 * _3253;
        float _3283 = fma(_3257, _3281, _1775);
        float _3285 = fma(_3267, _3281, _1913);
        float _3287 = fma(_3271, _3281, _1785);
        _3239 = _3285;
        _3235 = _3283;
        _3243 = _3287;
    }
    float _3289 = _3239;
    float _3291 = _3235;
    float _3293 = _3243;
    float _3295 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3297 = _3289 + _3295;
    float _3299 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3301 = _3291 + _3299;
    float _3303 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3305 = _3293 + _3303;
    float _3307 = _3297 * _3297;
    float _3309 = fma(_3301, _3301, _3307);
    float _3311 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3313 = fma(_3305, _3305, _3309);
    float _3315 = rsqrt(_3313);
    float _3317 = sqrt(_3313);
    float _3319 = _3315 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3321 = _3301 * _3319;
    float _3323 = _3305 * _3319;
    float _3325 = _3321 * _3321;
    float _3327 = _3323 * _3323;
    float _3329 = _3325 + _3327;
    float _3331 = sqrt(_3329);
    bool _3333 = _3331 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3335 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3337 = _3331 + _3335;
    float _3339 = _2931;
    float _3341 = _3337;
    float _3343 = _3297;
    float _3345 = _3321;
    if (_3333)
    {
        float _3347 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3339 = _3347;
    }
    float _3349 = _3339;
    float _3351 = _3349;
    if (_3333)
    {
        float _3353 = _3337 * _3349;
        _3341 = _3353;
    }
    float _3355 = _3341;
    if (_3333)
    {
        float _3357 = rsqrt(_3329);
        _3351 = _3357;
    }
    float _3359 = _3351;
    float _3361 = _3359;
    if (_3333)
    {
        float _3363 = _3355 * 0.15915493667125701904296875;
        _2987 = _3363;
    }
    float _3365 = _2987;
    float _3367 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3369 = _3305;
    if (_3333)
    {
        float _3371 = _3365 * 6.283185482025146484375;
        float _3373 = sin(_3371);
        _3369 = _3373;
    }
    float _3375 = _3369;
    float _3377 = _3289 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3379 = precise::max(0.0, _3367);
    float _3381 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3377);
    float _3383 = _3211;
    float _3385 = _3379;
    if (_3333)
    {
        float _3387 = _3365 * 6.283185482025146484375;
        float _3389 = cos(_3387);
        _3383 = _3389;
    }
    float _3391 = _3383;
    float _3393 = -_3319;
    float _3395 = -_3379;
    float _3397 = fma(_3297, _3393, _3395);
    float _3399 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3381);
    if (_3333)
    {
        float _3401 = _3397 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3343 = _3401;
    }
    float _3403 = _3343;
    float _3405 = _3375;
    float _3407 = _3403;
    if (_3333)
    {
        float _3409 = fma(_3375, _3403, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3405 = _3409;
    }
    float _3411 = _3405;
    float _3413 = _3411;
    if (!_3333)
    {
        _3407 = _3397;
    }
    float _3415 = _3407;
    float _3417 = _3415;
    if (_3333)
    {
        float _3419 = _3359 * _3411;
        _3231 = _3419;
    }
    float _3421 = _3231;
    if (!_3333)
    {
        _3413 = _3325;
    }
    float _3423 = _3413;
    float _3425 = _3423;
    float _3427 = _3391;
    if (_3333)
    {
        float _3429 = _3391 + (-1.0);
        _3385 = _3429;
    }
    float _3431 = _3385;
    float _3433 = _3431;
    if (_3333)
    {
        float _3435 = _3321 * _3421;
        _3345 = _3435;
    }
    float _3437 = _3345;
    if (_3333)
    {
        float _3439 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3361 = _3439;
    }
    float _3441 = _3361;
    if (!_3333)
    {
        _3433 = _3323;
    }
    float _3443 = _3433;
    float _3445 = _3443;
    if (_3333)
    {
        float _3447 = _3323 * _3421;
        _3445 = _3447;
    }
    float _3449 = _3445;
    if (_3333)
    {
        float _3451 = _3437 * _3437;
        _3425 = _3451;
    }
    float _3453 = _3425;
    if (_3333)
    {
        float _3455 = fma(_3397, _3391, _3441);
        _3417 = _3455;
    }
    float _3457 = _3417;
    if (!_3333)
    {
        _3427 = _3327;
    }
    float _3459 = _3427;
    float _3461 = _3459;
    if (_3333)
    {
        float _3463 = _3449 * _3449;
        _3461 = _3463;
    }
    float _3465 = _3461;
    float _3467 = _3289 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3469 = fma(_3457, _3457, _3453);
    float _3471 = _3399 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3473 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3467);
    float _3475 = _3469 + _3465;
    float _3477 = _3289 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3481 = fma(_3317, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3479);
    float _3483 = precise::clamp(_3481, 0.0, 1.0);
    float _3485 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3473);
    float _3487 = rsqrt(_3475);
    float _3489 = _3289 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3491 = -_3483;
    float _3493 = _3491 + 1.0;
    float _3495 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3477);
    float _3497 = _3485 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3499 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3489);
    float _3501 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3495);
    float _3503 = abs(_3493);
    float _3505 = log2(_3503);
    float _3507 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3499);
    float _3509 = _3497 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3511 = _3501 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3513 = _3507 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3515 = -_3509;
    float _3517 = fma(_3515, _3311, 1.0);
    float _3519 = _3511 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3521 = _3487 * _3437;
    float _3523 = _3487 * _3457;
    float _3525 = _3487 * _3449;
    float _3527 = fma(_3513, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3519);
    float _3529 = _3521 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3531 = log2(_3517);
    float _3533 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3527);
    float _3535 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3537 = -_3529;
    float _3539 = fma(_3523, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3537);
    float _3541 = _3511 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3543 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3533);
    float _3545 = exp2(_3535);
    float _3547 = -_3525;
    float _3549 = fma(_3547, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3539);
    float _3551 = _3511 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3553 = fma(_3513, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3541);
    float _3555 = fma(_3549, -0.5, 0.5);
    float _3557 = fma(_3513, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3551);
    float _3559 = fma(_3549, 0.5, 0.5);
    float _3561 = 1.0 / _3543;
    float _3563 = _3523 + 1.0;
    float _3565 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3557);
    float _3567 = fma(_3559, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3569 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3553);
    float _3571 = fma(_3559, _3567, -0.212114393711090087890625);
    float _3573 = sqrt(_3555);
    float _3575 = -_3523;
    float _3577 = fma(_3545, _3563, _3575);
    float _3579 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3565);
    float _3581 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3569);
    float _3583 = _3531 * 0.693147182464599609375;
    float _3585 = fma(_3559, _3571, 1.570728778839111328125);
    float _3587 = _3579 * _3561;
    float _3589 = _3581 * _3561;
    float _3591 = _3583 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3593 = fma(_3587, 0.5, 0.5);
    float _3595 = fma(_3589, -0.5, 0.5);
    float _3597 = _3573 * 0.636619746685028076171875;
    float _3599 = fma(_3577, 0.5, 0.5);
    float3 _9483 = float3(_3593, _3595, _3591);
    float _3601 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9483, float3(0.0), isnan(_9483)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9483, float3(0.0), isnan(_9483)), level(0.0)).x;
    float _3603 = -_3585;
    float _3605 = fma(_3597, _3603, 1.0);
    float3 _9499 = float3(_3593, _3595, _3591);
    float4 _3608 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9499, float3(0.0), isnan(_9499)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9499, float3(0.0), isnan(_9499)), level(0.0)).xyzw;
    float _3610 = _3608.x;
    float _3612 = _3608.y;
    float _3614 = _3608.z;
    float _3616 = _3608.w;
    float2 _9516 = float2(_3605, _3599);
    float3 _3620 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9516, float2(0.0), isnan(_9516)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9516, float2(0.0), isnan(_9516)), level(0.0)).xyz;
    float _3622 = _3620.x;
    float _3624 = _3620.y;
    float _3626 = _3620.z;
    float _3628 = _1913 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3630 = _1913 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3632 = _3511 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3634 = _3317 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3636 = isnan(_3317);
    bool _3638 = _3634 || _3636;
    bool _3640 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3642 = _3638 || _3640;
    float _3644 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3628);
    float _3646 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3630);
    float _3648 = fma(_3513, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3632);
    float _3650 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3644);
    float _3652 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3646);
    float _3654 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3648);
    float _3656 = _3650 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3658 = _3652 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3660 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3654);
    float _3662 = 1.0 / _3656;
    bool _3664 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3666 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3668 = _3664 || _3666;
    bool _3670 = isnan(0.5);
    bool _3672 = _3668 || _3670;
    float _3674 = _3658 + _3656;
    float _3676 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3678 = _3579 + _3543;
    out.gl_Position.x = _3579;
    out.gl_Position.y = _3581;
    out.gl_Position.z = _3660;
    out.gl_Position.w = _3543;
    float _3680 = exp2(_3676);
    float _3682 = _3678 * 0.5;
    float _3684 = _3660 + _3543;
    float _3686 = _3513;
    float _3688 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _3690 = _3660;
    float _3692 = _3581;
    float _3694 = _3579;
    float _3696 = _3654;
    float _3698 = _3678;
    float _3700 = _3543;
    if (!_3672)
    {
        _1835 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3702 = _1835;
    float _3704 = _3684 * 0.5;
    float _3706 = _3674 * _3662;
    float _3708 = _3706 * 0.5;
    float _3710 = _3543 * 0.5;
    float _3712 = _3710;
    if (_3672)
    {
        _3686 = 1.0;
    }
    float _3714 = _3686;
    float _3716 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3718 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3716);
    float _3720 = _3714;
    if (!_3672)
    {
        float _3722 = -_3702;
        float _3724 = _3722 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3688 = _3724;
    }
    float _3726 = _3688;
    float _3728 = fma(_3581, -0.5, _3710);
    if (!_3672)
    {
        _3712 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _3730 = _3712;
    float _3732 = -_3680;
    float _3734 = _3732 + 1.0;
    if (!_3642)
    {
        _3690 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3736 = _3690;
    float _3738 = 1.0 / _3718;
    float _3740 = _3736;
    float _3742 = _3736;
    if (!_3642)
    {
        _3692 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3744 = _3692;
    float _3746 = _3734 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3748 = _3744;
    float _3750 = _3744;
    if (!_3642)
    {
        _3694 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3752 = _3694;
    float _3754 = _3726;
    float _3756 = _3752;
    float _3758 = _3752;
    if (!_3672)
    {
        float _3760 = 1.0 / _3726;
        _3754 = _3760;
    }
    float _3762 = _3754;
    if (!_3672)
    {
        float _3764 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3766 = -_3702;
        float _3768 = fma(_3738, _3764, _3766);
        _3696 = _3768;
    }
    float _3770 = _3696;
    float _3772 = _3770;
    if (!_3672)
    {
        float _3774 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3776 = -_3730;
        float _3778 = fma(_3738, _3774, _3776);
        _3698 = _3778;
    }
    float _3780 = _3698;
    float _3782 = _3780;
    if (_3672)
    {
        _3700 = 1.0;
    }
    float _3784 = _3700;
    out.m_83.x = _3682;
    out.m_83.y = _3728;
    out.m_83.z = _3704;
    out.m_83.w = _3543;
    float _3786 = _3784;
    if (!_3672)
    {
        float _3788 = _3770 * _3762;
        float _3790 = precise::clamp(_3788, 0.0, 1.0);
        _3720 = _3790;
    }
    float _3792 = _3720;
    if (!_3672)
    {
        float _3794 = -_3730;
        float _3796 = _3794 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _3772 = _3796;
    }
    float _3798 = _3772;
    float _3800 = _3730;
    if (!_3672)
    {
        float _3802 = 1.0 / _3798;
        _3800 = _3802;
    }
    float _3804 = _3800;
    if (!_3672)
    {
        float _3806 = _3780 * _3804;
        float _3808 = precise::clamp(_3806, 0.0, 1.0);
        _3782 = _3808;
    }
    float _3810 = _3782;
    if (!_3672)
    {
        float _3812 = -_3810;
        float _3814 = _3812 + 1.0;
        _3786 = _3814;
    }
    float _3816 = _3786;
    float _3818 = _3746 * _3601;
    float _3820 = -_3746;
    float _3822 = _3820 + 1.0;
    float _3824 = _3616 * _3818;
    float _3826 = _3616 * _3822;
    float _3828 = _3626 * _3818;
    float _3830 = fma(_3622, _3824, _3610);
    float _3832 = fma(_3624, _3824, _3612);
    float _3834 = fma(_3616, _3828, _3614);
    float _3836 = _3792 * _3816;
    out.m_85.x = _3830;
    out.m_85.y = _3832;
    out.m_85.z = _3834;
    out.m_85.w = _3826;
    float _3838 = _3836 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3840 = !_3642;
    if (!_3840)
    {
        bool _3842 = _3317 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3844 = isnan(_3317);
        bool _3846 = _3842 || _3844;
        bool _3848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3850 = _3846 || _3848;
        if (!_3850)
        {
            float _3852 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3854 = _3317 + _3852;
            float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3858 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3856;
            float _3860 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3862 = _3860 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3864 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3866 = _3864 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3868 = 1.0 / _3858;
            float _3870 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3872 = _3870 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3874 = _3854 * _3868;
            float _3876 = precise::clamp(_3874, 0.0, 1.0);
            float _3878 = fma(_3876, _3862, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3880 = fma(_3876, _3866, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3882 = fma(_3876, _3872, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _3750 = _3880;
            _3742 = _3878;
            _3758 = _3882;
            _3884 = true;
        }
        else
        {
            bool _3886 = _3317 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3888 = isnan(_3317);
            bool _3890 = _3886 || _3888;
            bool _3892 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3894 = _3890 || _3892;
            if (!_3894)
            {
                _3740 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3896 = _3740;
            _3742 = _3896;
            if (!_3894)
            {
                _3748 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3898 = _3748;
            _3750 = _3898;
            if (!_3894)
            {
                _3756 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3900 = _3756;
            bool _3902 = !_3894;
            _3758 = _3900;
            if (!_3902)
            {
                bool _3904 = _3317 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3906 = isnan(_3317);
                bool _3908 = _3904 || _3906;
                bool _3910 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3912 = _3908 || _3910;
                if (!_3912)
                {
                    float _3914 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3916 = _3317 + _3914;
                    float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3920 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3918;
                    float _3922 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3924 = _3922 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3926 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3928 = _3926 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3930 = 1.0 / _3920;
                    float _3932 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3934 = _3932 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3936 = _3916 * _3930;
                    float _3938 = precise::clamp(_3936, 0.0, 1.0);
                    float _3940 = fma(_3938, _3924, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3942 = fma(_3938, _3928, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3944 = fma(_3938, _3934, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _3750 = _3942;
                    _3742 = _3940;
                    _3758 = _3944;
                    _3884 = true;
                }
                else
                {
                    _3750 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3742 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3758 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3884 = false;
    float _3946 = _3750;
    float _3948 = _3742;
    float _3950 = _3758;
    float _3952 = _3838 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_87.x = 0.0;
    float _3954 = _3946 * 0.586610972881317138671875;
    bool _3956 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _3952;
    float _3958 = fma(_3948, 0.298911988735198974609375, _3954);
    bool _3960 = _3792 > 0.0;
    bool _3962 = isnan(_3792);
    bool _3964 = _3960 || _3962;
    bool _3966 = isnan(0.0);
    bool _3968 = _3964 || _3966;
    float _3970 = fma(_3950, 0.114477999508380889892578125, _3958);
    bool _3972 = _3816 <= 0.0;
    bool _3974 = !_3968;
    bool _3976 = _3972 || _3974;
    float _3978 = -_3970;
    float _3980 = _3978 + _3948;
    float _3982 = -_3970;
    float _3984 = _3982 + _3946;
    float _3986 = -_3970;
    float _3988 = _3986 + _3950;
    float _3990 = fma(_3980, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3970);
    float _3992 = fma(_3984, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3970);
    float _3994 = fma(_3988, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3970);
    bool _3996 = !_3956;
    if (!_3996)
    {
        float _3998 = -_3289;
        float _4000 = _3998 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4002 = -_3291;
        float _4004 = _4002 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4006 = -_3293;
        float _4008 = _4006 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4010 = _4000 * _4000;
        float _4012 = fma(_4004, _4004, _4010);
        float _4014 = fma(_4008, _4008, _4012);
        float _4016 = sqrt(_4014);
        float _4018 = rsqrt(_4014);
        float _4020 = -_4016;
        float _4022 = _4020 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4024 = _4022 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4026 = precise::clamp(_4024, 0.0, 1.0);
        float _4028 = _4004 * _4018;
        float _4030 = _4000 * _4018;
        float _4032 = abs(_4026);
        float _4034 = log2(_4032);
        float _4036 = _4008 * _4018;
        float _4038 = _4028 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4040 = _2957 * _4030;
        float _4042 = -_4030;
        float _4044 = -_4038;
        float _4046 = fma(_4042, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4044);
        float _4048 = fma(_2947, _4028, _4040);
        float _4050 = -_4036;
        float _4052 = fma(_4050, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4046);
        float _4054 = fma(_2961, _4036, _4048);
        float _4056 = precise::clamp(_4054, 0.0, 1.0);
        float _4058 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4060 = _4052 + _4058;
        float _4062 = _4034 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4064 = _4060 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4066 = precise::clamp(_4064, 0.0, 1.0);
        float _4068 = exp2(_4062);
        float _4070 = _4068 * _4066;
        float _4072 = _4056 * _4070;
        float _4074 = _4072 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4076 = _4072 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4078 = _4072 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _4074;
        out.m_87.y = _4076;
        out.m_87.z = _4078;
    }
    out.m_89.x = _3990;
    out.m_89.y = _3992;
    out.m_89.z = _3994;
    if (!_3976)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _4080 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4080;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3884 = false;
    bool _822 = false;
    bool _590 = false;
    bool _476 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    float _120 = _118;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _122 = 0;
    if (!_112)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4139 = as_type<float>(_126);
        out.gl_Position.z = _4139;
    }
    if (!_112)
    {
        return out;
    }
    float _130 = in.m_49.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_140)
    {
        float _146 = float(_108);
        _120 = _146;
    }
    float _148 = _120;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_47.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _128 = as_type<int>(_160);
    }
    int _162 = _128;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4208 = as_type<float>(_162);
        out.gl_Position.z = _4208;
    }
    if (_154)
    {
        return out;
    }
    float _164 = in.m_51.w;
    float _166 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = in.m_49.z;
    int _184 = int(_176);
    int _186 = false ? 2 : 0;
    int _188 = _184 | _186;
    int _190 = false ? 4 : 0;
    int _192 = _188 | _190;
    int _194 = false ? 8 : 0;
    int _196 = _192 | _194;
    int _198 = false ? 16 : 0;
    int _200 = _196 | _198;
    int _202 = false ? 32 : 0;
    int _204 = _200 | _202;
    int _206 = false ? 64 : 0;
    int _208 = _204 | _206;
    int _210 = _208 & 1;
    float _212 = in.m_44.x;
    float _214 = in.m_44.y;
    float _216 = in.m_44.z;
    float _218 = as_type<float>(_210);
    float _220 = _166;
    if (!_176)
    {
        float _222 = _166 * _166;
        float _224 = _222 * 0.5;
        _218 = _224;
    }
    float _226 = _218;
    float _228 = _226;
    if (!_176)
    {
        float _230 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _228 = _230;
    }
    float _232 = _228;
    bool _234 = !_176;
    float _236 = _232;
    float _238 = 0.0;
    float _240 = 0.0;
    if (!_234)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = _166 * _244;
        float _254 = 1.0 / _248;
        float _256 = _250 * 0.693147182464599609375;
        float _258 = exp2(_252);
        float _260 = 1.0 / _256;
        float _262 = _258 + (-1.0);
        float _264 = -_262;
        float _266 = fma(_264, _260, _166);
        float _268 = _266 * _254;
        float _270 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _270;
        _238 = _254;
        _240 = _260;
    }
    float _272 = _236;
    float _274 = _238;
    float _276 = _240;
    bool _278 = !_176;
    float _280 = _276;
    float _282 = _274;
    float _284 = _272;
    if (!_278)
    {
        float _286 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = log2(_286);
        float _290 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _292 = _290 + 1.0;
        float _294 = 1.0 / _292;
        float _296 = _166 * _288;
        float _298 = exp2(_296);
        float _300 = -_298;
        float _302 = _300 + 1.0;
        float _304 = _302 * _294;
        _220 = _304;
        _280 = _292;
    }
    float _306 = _220;
    float _308 = _280;
    float _310 = _308;
    if (!_176)
    {
        float _312 = _144 * _144;
        float _314 = _312 * 0.5;
        _282 = _314;
    }
    float _316 = _282;
    float _318 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _320 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _322 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_176)
    {
        _310 = _144;
    }
    float _324 = _310;
    float _326 = fma(_306, _178, _318);
    float _328 = fma(_306, _180, _320);
    float _330 = _324;
    if (!_176)
    {
        float _332 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _284 = _332;
    }
    float _334 = _284;
    bool _336 = !_176;
    float _338 = _334;
    if (!_336)
    {
        float _340 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _342 = log2(_340);
        float _344 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _346 = _344 + 1.0;
        float _348 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _350 = _144 * _342;
        float _352 = 1.0 / _346;
        float _354 = _348 * 0.693147182464599609375;
        float _356 = exp2(_350);
        float _358 = 1.0 / _354;
        float _360 = _356 + (-1.0);
        float _362 = -_360;
        float _364 = fma(_362, _358, _144);
        float _366 = _364 * _352;
        float _368 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _338 = _368;
    }
    float _370 = _338;
    bool _372 = !_176;
    if (!_372)
    {
        float _374 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _376 = log2(_374);
        float _378 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _380 = _378 + 1.0;
        float _382 = 1.0 / _380;
        float _384 = _144 * _376;
        float _386 = exp2(_384);
        float _388 = -_386;
        float _390 = _388 + 1.0;
        float _392 = _390 * _382;
        _330 = _392;
    }
    float _394 = _330;
    float _396 = _370 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _398 = _370 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _400 = _370 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _402 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _404 = fma(_394, _180, _396);
    float _406 = fma(_394, _178, _398);
    float _408 = fma(_394, _182, _400);
    float _410 = fma(_306, _182, _322);
    float _412 = -_404;
    float _414 = _328 + _412;
    float _416 = -_406;
    float _418 = _326 + _416;
    float _420 = fma(_326, _164, _212);
    float _422 = -_408;
    float _424 = _410 + _422;
    float _426 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _428 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _430 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _432 = fma(_328, _164, _214);
    float _434 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].x, _426);
    float _436 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].x, _428);
    float _438 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].x, _430);
    float _440 = fma(_410, _164, _216);
    float _442 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[4].z, _434);
    float _444 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
    float _446 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[6].z, _438);
    bool _448 = !_402;
    float _450 = _444;
    float _452 = _442;
    float _454 = _446;
    float _456 = _442;
    float _474;
    if (!_448)
    {
        float _458 = in.m_53.x;
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _462 = _458 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _466 = _464 * _460;
        float _468 = floor(_466);
        float _470 = -_468;
        float _472 = _466 + _470;
        _474 = _472;
        _476 = true;
    }
    else
    {
        float _478 = float(_108);
        float _480 = 1.0 / _478;
        float _482 = _144 * _480;
        _474 = _482;
    }
    _476 = false;
    float _484 = _474;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _488 = _484 + _486;
    bool _490 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _492 = isnan(_484);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _502;
    bool _506 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _508 = isnan(_484);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -_500;
    float _520 = _518 + 1.0;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _522;
    float _526 = 1.0 / _504;
    bool _528 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _530 = _516 * _520;
    float _532 = -_516;
    float _534 = _532 + 1.0;
    float _536 = _488 * _526;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _538;
    float _542 = fma(_524, _536, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _544;
    float _548 = fma(_540, _536, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _550 = _542 * _530;
    float _552 = fma(_546, _536, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _554 = _548 * _530;
    float _556 = _552 * _530;
    float _558 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].x, _550);
    float _560 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].y, _556);
    float _562 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].z, _554);
    float _564 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[144].x, _558);
    float _566 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[144].y, _560);
    float _568 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[144].z, _562);
    bool _570 = !_528;
    float _588;
    if (!_570)
    {
        float _572 = in.m_53.x;
        float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _576 = _572 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _580 = _578 * _574;
        float _582 = floor(_580);
        float _584 = -_582;
        float _586 = _580 + _584;
        _588 = _586;
        _590 = true;
    }
    else
    {
        float _592 = float(_108);
        float _594 = 1.0 / _592;
        float _596 = _144 * _594;
        _588 = _596;
    }
    _590 = false;
    float _598 = _588;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _602 = _598 + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _616 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _618 = isnan(_598);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = 1.0 / _606;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _634 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _636 = isnan(_598);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    bool _646 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _648 = 1.0 / _614;
    float _650 = _610 * _628;
    bool _652 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _654 = isnan(_598);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = 1.0 / _632;
    float _666 = -_626;
    float _668 = _666 + 1.0;
    float _670 = fma(_650, _602, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _676 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _678 = isnan(_598);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = -_662;
    float _690 = _688 + 1.0;
    float _692 = _662 * _668;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _698 = 1.0 / _674;
    float _700 = -_686;
    float _702 = _700 + 1.0;
    float _704 = _644 * _690;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _706;
    float _710 = _696 * _648;
    float _712 = _626 * _702;
    float _714 = _670 * _704;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _718 = _598 + _716;
    float _720 = -_644;
    float _722 = _720 + 1.0;
    float _724 = _708 * _664;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _728 = _598 + _726;
    bool _730 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _732 = isnan(_598);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _746 = fma(_710, _718, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _748 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[115].x, _714);
    float _750 = fma(_724, _728, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _752 = _744 * _698;
    float _754 = -_740;
    float _756 = _754 + 1.0;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _760 = _598 + _758;
    float _762 = fma(_746, _692, _748);
    float _764 = _686 * _756;
    float _766 = fma(_752, _760, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _768 = fma(_750, _712, _762);
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _772 = fma(_766, _764, _768);
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _776 = _770 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _778 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[119].x, _772);
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _782 = _774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _784 = _778 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _786 = in.m_51.x;
    float _788 = in.m_51.y;
    float _790 = in.m_51.z;
    float _792 = _780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _776;
    out.m_55.y = _782;
    out.m_55.z = _792;
    out.m_55.w = _784;
    float _794 = _568 * _790;
    float _796 = _566 * _788;
    float _798 = _564 * _786;
    bool _800 = !_646;
    float _802 = _794;
    float _820;
    if (!_800)
    {
        float _804 = in.m_53.x;
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _808 = _804 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[11].z, _144);
        float _812 = _810 * _806;
        float _814 = floor(_812);
        float _816 = -_814;
        float _818 = _812 + _816;
        _820 = _818;
        _822 = true;
    }
    else
    {
        float _824 = float(_108);
        float _826 = 1.0 / _824;
        float _828 = _144 * _826;
        _820 = _828;
    }
    _822 = false;
    float _830 = _820;
    float _832 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _834 = int(_832);
    float _836 = in.m_53.x;
    float _838 = float(_108);
    float _840 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _842 = in.m_57.x;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _846 = _830 + _844;
    float _848 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _850 = int(_848);
    float _852 = in.m_53.y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _858 = in.m_53.z;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _862 = _830 + _860;
    float _864 = float(_834);
    float _866 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _868 = int(_866);
    float _870 = in.m_57.y;
    float _872 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _874 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _876 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _878 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _880 = float(_850);
    float _882 = 1.0 / _864;
    float _884 = -_878;
    float _886 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _884);
    float _888 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _892 = _890 != 0;
    float _894 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _896 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _898 = int(_896);
    float _900 = float(uint(_868));
    float _902 = -_888;
    float _904 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _902);
    int _906 = ~_868;
    int _908 = _906 + 1;
    float _910 = -_894;
    float _912 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _910);
    bool _914 = _868 == 0;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _918 = 1.0 / _880;
    float _920 = _144 * _882;
    float _922 = _920;
    bool _924 = _892;
    float _926 = _830;
    if (_892)
    {
        _116 = 1.0;
    }
    float _928 = _116;
    float _930 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[78].w, _916);
    float _932 = _928;
    if (!_892)
    {
        _932 = 1.2345600128173828125;
    }
    float _934 = _932;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _936;
    float _940 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _942 = 1.0 / _900;
    float _944 = float(uint(_898));
    int _946 = ~_898;
    int _948 = _946 + 1;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _950;
    float _954 = trunc(_920);
    int _956 = int(_954);
    float _958 = _144 * _918;
    int _960 = ~_868;
    int _962 = _960 + 1;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _966 = 1.0 / _944;
    int _968 = as_type<int>(_942) + (-2);
    float _970 = as_type<float>(_948);
    if (_892)
    {
        _922 = 1.0;
    }
    float _972 = _922;
    float _974 = _972;
    if (!_892)
    {
        _974 = 7.345489978790283203125;
    }
    float _976 = _974;
    float _978 = trunc(_958);
    int _980 = int(_978);
    float _982 = float(uint(_956));
    float _984 = as_type<float>(_968) * _982;
    int _986 = as_type<int>(_966) + (-2);
    float _988 = 1.0 / _838;
    float _990 = float(uint(_980));
    float _992 = trunc(_984);
    float _994 = precise::max(_992, 0.0);
    uint _997 = uint(_994);
    float _999 = as_type<float>(_986) * _990;
    float _1001 = _976 * _836;
    float _1003 = trunc(_999);
    float _1005 = precise::max(_1003, 0.0);
    uint _1007 = uint(_1005);
    int _1009 = ~_898;
    int _1011 = _1009 + 1;
    float _1013 = _144 * _988;
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1017 = _1015 != 0;
    int _1019 = _962 * int(_997);
    int _1021 = _1019 + _956;
    float _1023 = float(uint(_1021));
    float _1025 = floor(_1001);
    int _1027 = _1011 * int(_1007);
    int _1029 = _1027 + _980;
    float _1031 = as_type<float>(_968) * _1023;
    float _1033 = float(uint(_1029));
    float _1035 = as_type<float>(_1029);
    float _1037 = _1001;
    if (!_1017)
    {
        _1035 = _842;
    }
    float _1039 = _1035;
    float _1041 = trunc(_1031);
    float _1043 = precise::max(_1041, 0.0);
    uint _1045 = uint(_1043);
    float _1047 = as_type<float>(_986) * _1033;
    float _1049 = 0.0;
    float _1051 = _1039;
    if (!_1017)
    {
        _1049 = _1039;
    }
    float _1053 = _1049;
    float _1055 = _1053;
    if (_1017)
    {
        _1051 = _842;
    }
    float _1057 = _1051;
    float _1059 = float(_868);
    float _1061 = trunc(_1047);
    float _1063 = precise::max(_1061, 0.0);
    uint _1065 = uint(_1063);
    float _1067 = -_1025;
    float _1069 = _1001 + _1067;
    float _1071 = _1057;
    if (_892)
    {
        _1037 = _836;
    }
    float _1073 = _1037;
    float _1075 = _1073;
    if (!_892)
    {
        _1075 = _852;
    }
    float _1077 = _1075;
    float _1079 = _1069 * _1059;
    if (_1017)
    {
        bool _1081 = _836 > 0.5;
        _924 = _1081;
    }
    bool _1083 = _924;
    int _1085 = int(_997) + int(_1045);
    int _1087 = int(_1045);
    if (_1017)
    {
        float _1089 = -_1057;
        float _1091 = _1089 + 1.0;
        _1087 = as_type<int>(_1091);
    }
    int _1093 = _1087;
    float _1095 = float(_956);
    float _1097 = _1077 * _934;
    int _1099 = _908 * _1085;
    int _1101 = _1099 + _956;
    bool _1103 = _1095 >= _1059;
    bool _1105 = isnan(_1095);
    bool _1107 = _1103 || _1105;
    bool _1109 = isnan(_1059);
    bool _1111 = _1107 || _1109;
    float _1113 = float(_1111);
    float _1115 = _1013 * _1059;
    if (_1017)
    {
        float _1117 = _1083 ? as_type<float>(_1093) : _1057;
        _1055 = _1117;
    }
    float _1119 = _1055;
    bool _1121 = uint(_1101) >= uint(_868);
    float _1123 = trunc(_1113);
    int _1125 = int(_1123);
    int _1127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1129 = _1127 != 0;
    bool _1131 = !_1121;
    int _1133 = _1131 ? 0 : (-1);
    int _1135 = int(_1007) + int(_1065);
    bool _1137 = !_1129;
    int _1139 = _1137 ? 0 : 1;
    float _1141 = trunc(_1079);
    int _1143 = int(_1141);
    int _1145 = ~_1085;
    int _1147 = _1145 + _1133;
    int _1149 = _1147 + 1;
    int _1151 = abs(_1139);
    int _1153 = ~_898;
    int _1155 = _1153 + 1;
    int _1157 = _868 * _1149;
    int _1159 = _1157 + _956;
    int _1161 = _1155 * _1135;
    int _1163 = _1161 + _980;
    int _1165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1167 = _1165 != 0;
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1171 = _1169 != 0;
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1175 = _1173 != 0;
    float _1177 = trunc(_1115);
    int _1179 = int(_1177);
    int _1181 = ~_1125;
    int _1183 = _1181 + 1;
    int _1185 = _1183 + 1;
    bool _1187 = !_914;
    int _1189 = _1187 ? _1159 : (-1);
    int _1191 = _1143 * _1151;
    int _1193 = _1191 + _956;
    bool _1195 = uint(_1163) >= uint(_898);
    bool _1197 = !_1171;
    int _1199 = _1197 ? 0 : 1;
    int _1201 = _1189 * _1185;
    bool _1203 = !_1167;
    int _1205 = _1203 ? 0 : 1;
    int _1207 = _868 + (-1);
    int _1209 = abs(_1199);
    int _1211 = abs(_1205);
    float _1213 = floor(_1097);
    int _1215 = _1125 * _1207;
    int _1217 = _1215 + _1201;
    float _1219 = float(_898);
    float _1221 = float(_980);
    int _1223 = _1217 * _1209;
    bool _1225 = !_1175;
    int _1227 = _1225 ? 0 : 1;
    bool _1229 = _1221 >= _1219;
    bool _1231 = isnan(_1221);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan(_1219);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    int _1241 = _1179 * _1211;
    int _1243 = _1241 + _1223;
    int _1245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1247 = _1245 != 0;
    bool _1249 = !_1195;
    int _1251 = _1249 ? 0 : (-1);
    int _1253 = abs(_1227);
    float _1255 = trunc(_1239);
    int _1257 = int(_1255);
    bool _1259 = !_1247;
    int _1261 = _1259 ? 0 : 1;
    float _1263 = -_1213;
    float _1265 = _1097 + _1263;
    int _1267 = ~_1135;
    int _1269 = _1267 + _1251;
    int _1271 = _1269 + 1;
    int _1273 = _1193 * _1253;
    int _1275 = _1273 + _1243;
    int _1277 = abs(_1261);
    int _1279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1281 = _1279 != 0;
    int _1283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1285 = _1283 != 0;
    int _1287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1289 = _1287 != 0;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1293 = _1291 != 0;
    int _1295 = _898 * _1271;
    int _1297 = _1295 + _980;
    float _1299 = _1013 * _1219;
    float _1301 = _1265 * _1219;
    int _1303 = _1143 * _1277;
    int _1305 = _1303 + _1275;
    bool _1307 = !_1285;
    int _1309 = _1307 ? 0 : 1;
    bool _1311 = !_1281;
    int _1313 = _1311 ? 0 : 1;
    float _1315 = trunc(_1299);
    int _1317 = int(_1315);
    bool _1319 = _898 == 0;
    int _1321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1323 = _1321 != 0;
    float _1325 = float(uint(_1305));
    int _1327 = ~_1257;
    int _1329 = _1327 + 1;
    int _1331 = _1329 + 1;
    float _1333 = trunc(_1301);
    int _1335 = int(_1333);
    bool _1337 = !_1319;
    int _1339 = _1337 ? _1297 : (-1);
    float _1341 = as_type<float>(_968) * _1325;
    bool _1343 = !_1323;
    int _1345 = _1343 ? 0 : 1;
    int _1347 = abs(_1309);
    int _1349 = _1339 * _1331;
    int _1351 = abs(_1345);
    float _1353 = trunc(_1341);
    float _1355 = precise::max(_1353, 0.0);
    uint _1357 = uint(_1355);
    int _1359 = _898 + (-1);
    int _1361 = abs(_1313);
    int _1363 = _1257 * _1359;
    int _1365 = _1363 + _1349;
    int _1367 = _1335 * _1351;
    int _1369 = _1367 + _980;
    int _1371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1373 = _1371 != 0;
    bool _1375 = !_1289;
    int _1377 = _1375 ? 0 : 1;
    int _1379 = _1365 * _1347;
    int _1381 = ~_868;
    int _1383 = _1381 + 1;
    float _1385 = in.m_53.w;
    int _1387 = abs(_1377);
    int _1389 = _1317 * _1361;
    int _1391 = _1389 + _1379;
    int _1393 = as_type<int>(_1341);
    int _1395 = _1347;
    if (_1373)
    {
        float _1397 = -_1057;
        float _1399 = _1397 + 1.0;
        _1393 = as_type<int>(_1399);
    }
    int _1401 = _1393;
    bool _1403 = _858 > 0.5;
    int _1405 = _1383 * int(_1357);
    int _1407 = _1405 + _1305;
    float _1409 = 0.0;
    if (!_1373)
    {
        _1409 = _1057;
    }
    float _1411 = _1409;
    int _1413 = _1369 * _1387;
    int _1415 = _1413 + _1391;
    float _1417 = _1411;
    if (_1373)
    {
        float _1419 = _1403 ? as_type<float>(_1401) : _1057;
        _1417 = _1419;
    }
    float _1421 = _1417;
    float _1423 = -_870;
    float _1425 = _1423 + 1.0;
    float _1427 = float(uint(_1407));
    bool _1429 = !_1293;
    int _1431 = _1429 ? 0 : 1;
    bool _1433 = _852 > 0.5;
    float _1435 = as_type<float>(_968) * _1427;
    int _1437 = abs(_1431);
    float _1439 = float(uint(_1193));
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1443 = _1441 != 0;
    float _1445 = trunc(_1435);
    float _1447 = precise::max(_1445, 0.0);
    uint _1449 = uint(_1447);
    int _1451 = _1433 ? as_type<int>(_1425) : as_type<int>(_870);
    float _1453 = as_type<float>(_968) * _1439;
    bool _1455 = _868 == 0;
    float _1457 = _1443 ? as_type<float>(_1451) : _870;
    int _1459 = _1335 * _1437;
    int _1461 = _1459 + _1415;
    bool _1463 = _1385 > 0.5;
    float _1465 = trunc(_1453);
    float _1467 = precise::max(_1465, 0.0);
    uint _1469 = uint(_1467);
    int _1471 = ~_868;
    int _1473 = _1471 + 1;
    int _1475 = _1463 ? as_type<int>(_1425) : as_type<int>(_870);
    float _1477 = float(uint(_1461));
    int _1479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1481 = _1479 != 0;
    int _1483 = int(_1357) + int(_1449);
    float _1485 = as_type<float>(_986) * _1477;
    float _1487 = _1481 ? as_type<float>(_1475) : _870;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1491 = _1489 != 0;
    float _1493 = trunc(_1485);
    float _1495 = precise::max(_1493, 0.0);
    uint _1497 = uint(_1495);
    int _1499 = ~_868;
    int _1501 = _1499 + 1;
    int _1503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1505 = _1503 != 0;
    int _1507 = _1473 * int(_1469);
    int _1509 = _1507 + _1193;
    int _1511 = ~_898;
    int _1513 = _1511 + 1;
    int _1515 = _1501 * _1483;
    int _1517 = _1515 + _1305;
    float _1519 = float(uint(_1509));
    float _1521 = _870;
    int _1523 = _1513;
    float _1525 = _1457;
    if (_1491)
    {
        float _1527 = _1403 ? _1425 : _870;
        _1521 = _1527;
    }
    float _1529 = _1521;
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1531;
    bool _1535 = uint(_1517) >= uint(_868);
    float _1537 = as_type<float>(_968) * _1519;
    float _1539 = 1.0 / _1533;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1543 = _1541 != 0;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1549 = !_1535;
    int _1551 = _1549 ? 0 : (-1);
    int _1553 = _1513 * int(_1497);
    int _1555 = _1553 + _1461;
    int _1557 = ~_898;
    int _1559 = _1557 + 1;
    int _1561 = ~_1483;
    int _1563 = _1561 + _1551;
    int _1565 = _1563 + 1;
    float _1567 = trunc(_1537);
    float _1569 = precise::max(_1567, 0.0);
    uint _1571 = uint(_1569);
    float _1573 = float(uint(_1555));
    if (_1505)
    {
        _1523 = 0;
    }
    int _1575 = _1523;
    int _1577 = _868 * _1565;
    int _1579 = _1577 + _1305;
    int _1581 = 0;
    int _1583 = _1575;
    if (_1505)
    {
        _1581 = 0;
    }
    int _1585 = _1581;
    float _1587 = as_type<float>(_986) * _1573;
    int _1589 = _1585;
    if (_1543)
    {
        float _1591 = -_1057;
        float _1593 = _1591 + 1.0;
        _1395 = as_type<int>(_1593);
    }
    int _1595 = _1395;
    if (!_1505)
    {
        _1583 = 1;
    }
    int _1597 = _1583;
    float _1599 = 1.0 / _1547;
    bool _1601 = !_1455;
    int _1603 = _1601 ? _1579 : (-1);
    float _1605 = _846 * _1539;
    if (_1543)
    {
        float _1607 = _1433 ? as_type<float>(_1595) : _1057;
        _1071 = _1607;
    }
    float _1609 = _1071;
    int _1611 = _1603 & 3;
    bool _1613 = _1611 != 0;
    int _1615 = _1603 & 3;
    bool _1617 = _1615 != 0;
    float _1619 = trunc(_1587);
    float _1621 = precise::max(_1619, 0.0);
    uint _1623 = uint(_1621);
    int _1625 = _1613 ? 0 : 1;
    bool _1627 = uint(_1615) > 1u;
    bool _1629 = uint(_1615) >= 2u;
    int _1631 = int(_1469) + int(_1571);
    float _1633 = _862 * _1599;
    int _1635 = ~_868;
    int _1637 = _1635 + 1;
    float _1639 = in.m_59.w;
    int _1641 = _1629 ? 0 : 1;
    bool _1643 = _1615 != 3;
    int _1645 = _1637 * _1631;
    int _1647 = _1645 + _1193;
    int _1649 = ~_1641;
    int _1651 = _1649 + 1;
    int _1653 = _1651 + 1;
    int _1655 = int(_1497) + int(_1623);
    float _1657 = float(uint(_1369));
    int _1659 = ~_1625;
    int _1661 = _1659 + 1;
    int _1663 = _1661 + 1;
    int _1665 = _1559 * _1655;
    int _1667 = _1665 + _1461;
    int _1669 = _1663;
    int _1671 = _1653;
    if (!_1627)
    {
        int _1673 = ~_1625;
        int _1675 = _1673 + 1;
        _1669 = _1675;
    }
    int _1677 = _1669;
    float _1679 = _432 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1681 = uint(_1647) >= uint(_868);
    float _1683 = as_type<float>(_986) * _1657;
    if (_1643)
    {
        int _1685 = ~_1641;
        int _1687 = _1685 + 1;
        _1671 = _1687;
    }
    int _1689 = _1671;
    float _1691 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1679);
    bool _1693 = uint(_1667) >= uint(_898);
    float _1695 = trunc(_1683);
    float _1697 = precise::max(_1695, 0.0);
    uint _1699 = uint(_1697);
    bool _1701 = !_1681;
    int _1703 = _1701 ? 0 : (-1);
    float _1705 = _432 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1707 = !_1693;
    int _1709 = _1707 ? 0 : (-1);
    float _1711 = _432 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1715 = _1713 != 0;
    float _1717 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1705);
    int _1719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1721 = _1719 != 0;
    float _1723 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1711);
    int _1725 = ~_898;
    int _1727 = _1725 + 1;
    float _1729 = _836 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1731 = ~_1655;
    int _1733 = _1731 + _1709;
    int _1735 = _1733 + 1;
    float _1737 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1717);
    float _1739 = -_854;
    float _1741 = fma(_1729, 2.0, _1739);
    float _1743 = _852 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1745 = _898 * _1735;
    int _1747 = _1745 + _1461;
    bool _1749 = !_1617;
    int _1751 = _1749 ? 0 : 1;
    int _1753 = _1727 * int(_1699);
    int _1755 = _1753 + _1369;
    float _1757 = fma(_1743, -2.0, _856);
    if (!_1505)
    {
        _1589 = 2;
    }
    int _1759 = _1589;
    float _1761 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1691);
    bool _1763 = !_1319;
    int _1765 = _1763 ? _1747 : (-1);
    float _1767 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1723);
    float _1769 = float(uint(_1755));
    out.m_61.w = _1639;
    int _1771 = _1765 & 3;
    bool _1773 = _1771 != 0;
    float _1775 = _1761 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1777 = _1765 & 3;
    bool _1779 = _1777 != 0;
    float _1781 = as_type<float>(_986) * _1769;
    int _1783 = _1773 ? 0 : 1;
    float _1785 = _1767 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1787 = uint(_1777) > 1u;
    float _1789 = trunc(_1781);
    float _1791 = precise::max(_1789, 0.0);
    uint _1793 = uint(_1791);
    int _1795 = ~_1783;
    int _1797 = _1795 + 1;
    int _1799 = _1797 + 1;
    float _1801 = -_1775;
    float _1803 = _1801 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1805 = -_1785;
    float _1807 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1809 = -_144;
    float _1811 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1741);
    float _1813 = -_872;
    float _1815 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1813);
    float _1817 = in.m_63.x;
    float _1819 = in.m_63.y;
    float _1821 = in.m_63.z;
    float _1823 = -_874;
    float _1825 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1823);
    float _1827 = -_876;
    float _1829 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1827);
    int _1831 = _1799;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    float _1835 = 0.5;
    if (!_1787)
    {
        int _1837 = ~_1783;
        int _1839 = _1837 + 1;
        _1831 = _1839;
    }
    int _1841 = _1831;
    float _1843 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1845 = uint(_1777) >= 2u;
    float _1847 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    int _1849 = int(_1699) + int(_1793);
    float _1851 = _798 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1853 = _1845 ? 0 : 1;
    float _1855 = in.m_65.x;
    float _1857 = in.m_65.y;
    float _1859 = in.m_65.z;
    bool _1861 = _1777 != 3;
    float _1863 = -_1847;
    float _1865 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1863);
    int _1867 = ~_1853;
    int _1869 = _1867 + 1;
    int _1871 = _1869 + 1;
    float _1873 = in.m_67.x;
    float _1875 = in.m_67.y;
    float _1877 = in.m_67.z;
    float _1879 = in.m_67.w;
    float _1881 = fma(_1421, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _1883 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1865);
    int _1885 = ~_1631;
    int _1887 = _1885 + _1703;
    int _1889 = _1887 + 1;
    int _1891 = abs(_1677);
    int _1893 = abs(_1689);
    int _1895 = _868 * _1889;
    int _1897 = _1895 + _1193;
    float _1899 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1819);
    float _1901 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1817);
    int _1903 = _1871;
    if (_1861)
    {
        int _1905 = ~_1853;
        int _1907 = _1905 + 1;
        _1903 = _1907;
    }
    int _1909 = _1903;
    float _1911 = _840 * _1899;
    float _1913 = _1737 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1915 = _1851 * _1901;
    int _1917 = _948 * _1849;
    int _1919 = _1917 + _1369;
    int _1921 = abs(_1909);
    float _1923 = -_1913;
    float _1925 = _1923 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _1927 = uint(_1919) >= uint(_898);
    float _1929 = _1925 * _1925;
    float _1931 = _1855 * _1877;
    float _1933 = _1857 * _1873;
    bool _1935 = !_1927;
    int _1937 = _1935 ? 0 : (-1);
    float _1939 = fma(_1803, _1803, _1929);
    bool _1941 = _1597 != 1;
    float _1943 = _1859 * _1875;
    float _1945 = -_1931;
    float _1947 = fma(_1859, _1873, _1945);
    float _1949 = fma(_1807, _1807, _1939);
    float _1951 = -_1933;
    float _1953 = fma(_1875, _1855, _1951);
    float _1955 = -_1943;
    float _1957 = fma(_1877, _1857, _1955);
    float _1959 = _1947 * _1879;
    float _1961 = rsqrt(_1949);
    float _1963 = _1953 * _1879;
    float _1965 = _1957 * _1879;
    float _1967 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1969 = _1931;
    float _1971 = _1947;
    if (!_1941)
    {
        _1969 = _852;
    }
    float _1973 = _1969;
    float _1975 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1967);
    float _1977 = _1973;
    if (!_1941)
    {
        _1833 = _858;
    }
    float _1979 = _1833;
    float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1983 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1981;
    float _1985 = 0.0;
    float _1987 = _1979;
    if (!_1941)
    {
        _1985 = _1973;
    }
    float _1989 = _1985;
    float _1991 = _1989;
    if (_1941)
    {
        _1977 = _852;
    }
    float _1993 = _1977;
    float _1995 = _1993;
    if (!_1941)
    {
        _970 = _1989;
    }
    float _1997 = _970;
    float _1999 = _1997;
    if (!_1941)
    {
        _1971 = _858;
    }
    float _2001 = _1971;
    float _2003 = _1807 * _1961;
    float _2005 = _2001;
    if (_1941)
    {
        _1999 = _836;
    }
    float _2007 = _1999;
    if (_1941)
    {
        _1991 = _836;
    }
    float _2009 = _1991;
    if (_1941)
    {
        _1987 = _1993;
    }
    float _2011 = _1987;
    if (_1941)
    {
        _2005 = _1993;
    }
    float _2013 = _2005;
    bool _2015 = _1759 != 2;
    float _2017 = _1803 * _1961;
    float _2019 = fma(_938, _1605, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2021 = fma(_952, _1605, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2023 = _2017 * _2017;
    float _2025 = fma(_1983, _1605, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2027 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _2029 = ~_1849;
    int _2031 = _2029 + _1937;
    int _2033 = _2031 + 1;
    float _2035 = fma(_2003, _2003, _2023);
    float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2039 = _2037 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2043 = _2041 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2047 = _2045 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2049 = _1925 * _1961;
    float _2051 = fma(_2039, _1633, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2053 = rsqrt(_2035);
    float _2055 = fma(_2043, _1633, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2057 = _2043;
    if (_2015)
    {
        _2057 = _836;
    }
    float _2059 = _2057;
    float _2061 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2063 = _2059;
    if (!_2015)
    {
        _2063 = _858;
    }
    float _2065 = _2063;
    float _2067 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[88].z, _964);
    float _2069 = fma(_2047, _1633, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2073 = -_2061;
    float _2075 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2073);
    if (!_2015)
    {
        _1995 = _836;
    }
    float _2077 = _1995;
    float _2079 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2081 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2071);
    float _2083 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2075);
    float _2085 = -_2027;
    float _2087 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2085);
    bool _2089 = _1819 != 0.0;
    bool _2091 = isnan(_1819);
    bool _2093 = _2089 || _2091;
    bool _2095 = isnan(0.0);
    bool _2097 = _2093 || _2095;
    float _2099 = _2065 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2101 = _2003 * _2053;
    float _2103 = _2017 * _2053;
    float _2105 = -_2079;
    float _2107 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2105);
    float _2109 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2111 = -_2101;
    float _2113 = _2003 * _2111;
    float _2115 = _2049 * _2103;
    float _2117 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2087);
    float _2119 = -_2109;
    float _2121 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2119);
    float _2123 = -_2113;
    float _2125 = fma(_2017, _2103, _2123);
    float _2127 = -_2101;
    float _2129 = _2049 * _2127;
    float _2131 = _904 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2133 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2107);
    float _2135 = _2125 * _2125;
    bool _2137 = _1817 == 0.0;
    bool _2139 = !_2097;
    bool _2141 = _2137 && _2139;
    float _2143 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2145 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2147 = fma(_2115, _2115, _2135);
    float _2149 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _2151 = _1821 == 0.0;
    bool _2153 = _2151 && _2141;
    float _2155 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2157 = fma(_2129, _2129, _2147);
    float _2159 = -_2149;
    float _2161 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2159);
    float _2163 = -_2131;
    float _2165 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2163);
    float _2167 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _930);
    float _2169 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1757);
    float _2171 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2161);
    float _2173 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2165);
    float _2175 = rsqrt(_2157);
    float _2177 = -_2155;
    float _2179 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2177);
    bool _2181 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2183 = isnan(_830);
    bool _2185 = _2181 || _2183;
    bool _2187 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2189 = _2185 || _2187;
    float _2191 = float(_2189);
    float _2193 = -_2173;
    float _2195 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2133);
    if (_2153)
    {
        _1525 = _1855;
    }
    float _2197 = _1525;
    float _2199 = -_2169;
    float _2201 = fma(_2167, _2143, _2199);
    float _2203 = _2197;
    if (!_2153)
    {
        float _2205 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1855);
        _2203 = _2205;
    }
    float _2207 = _2203;
    bool _2209 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2211 = isnan(_830);
    bool _2213 = _2209 || _2211;
    bool _2215 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2217 = _2213 || _2215;
    float _2219 = float(_2217);
    float _2221 = -_2191;
    float _2223 = _2221 + 1.0;
    float _2225 = 1.0 / _2195;
    bool _2227 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2229 = isnan(_830);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2235 = _2231 || _2233;
    float _2237 = float(_2235);
    float _2239 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2179);
    if (_2153)
    {
        _926 = _1857;
    }
    float _2241 = _926;
    float _2243 = _2241;
    if (!_2153)
    {
        float _2245 = fma(_1819, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1857);
        _2243 = _2245;
    }
    float _2247 = _2243;
    float _2249 = _2219 * _2223;
    float _2251 = -_2219;
    float _2253 = _2251 + 1.0;
    float _2255 = _2125 * _2175;
    float _2257 = precise::clamp(_2255, 0.0, 1.0);
    if (_2153)
    {
        _802 = _1859;
    }
    float _2259 = _802;
    float _2261 = _940 * _1821;
    float _2263 = _2259;
    if (!_2153)
    {
        float _2265 = fma(_1821, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1859);
        _2263 = _2265;
    }
    float _2267 = _2263;
    float _2269 = -_2257;
    float _2271 = _2269 + 1.0;
    float _2273 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2121);
    float _2275 = _2237 * _2253;
    float _2277 = -_2237;
    float _2279 = _2277 + 1.0;
    float _2281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2283 = fma(_2171, _2225, -1.0);
    float _2285 = _2271 * _2225;
    float _2287 = _2019 * _2275;
    float _2289 = _2021 * _2275;
    float _2291 = fma(_2271, _2283, 1.0);
    float _2293 = _2273 * _2285;
    float _2295 = _2239 * _2285;
    float _2297 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2287);
    float _2299 = _2291 * _2291;
    float _2301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2303 = _2025 * _2275;
    float _2305 = fma(_2051, _2249, _2297);
    float _2307 = fma(_2293, _2293, _2299);
    float _2309 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2289);
    float _2311 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2303);
    float _2313 = _2281 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2315 = fma(_2295, _2295, _2307);
    float _2317 = fma(_2055, _2249, _2309);
    float _2319 = fma(_2069, _2249, _2311);
    float _2321 = rsqrt(_2315);
    float _2323 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2081);
    float _2325 = fma(_2191, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2317);
    float _2327 = fma(_2313, _1529, -0.5);
    float _2329 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2067);
    float _2331 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2333 = fma(_2323, _1843, _1811);
    int _2335 = _898 * _2033;
    int _2337 = _2335 + _1369;
    bool _2339 = !_1779;
    int _2341 = _2339 ? 0 : 1;
    float _2343 = fma(_2331, _1609, -0.5);
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2347 = fma(_2191, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2305);
    float _2349 = fma(_2191, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2319);
    float _2351 = -_2345;
    float _2353 = fma(_2099, 2.0, _2351);
    float _2355 = _2347 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2357 = _2295 * _2321;
    float _2359 = _2291 * _2321;
    float _2361 = _2293 * _2321;
    float _2363 = -_2357;
    float _2365 = _2017 * _2363;
    float _2367 = _2003 * _2359;
    float _2369 = -_2361;
    float _2371 = _2049 * _2369;
    float _2373 = -_144;
    float _2375 = fma(_2373, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2353);
    float _2377 = -_2361;
    float _2379 = -_2365;
    float _2381 = fma(_2003, _2377, _2379);
    float _2383 = -_2357;
    float _2385 = -_2367;
    float _2387 = fma(_2049, _2383, _2385);
    float _2389 = -_2371;
    float _2391 = fma(_2017, _2359, _2389);
    float _2393 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2395 = _2381 * _2381;
    float _2397 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2399 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2401 = fma(_2329, _2343, _2375);
    float _2403 = fma(_2387, _2387, _2395);
    int _2405 = _1603 >> 31;
    float _2407 = fma(_2009, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2393);
    float _2409 = fma(_2391, _2391, _2403);
    float _2411 = fma(_2013, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2397);
    float _2413 = _2325 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2415 = _2349 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2417 = rsqrt(_2409);
    int _2419 = _2405 & 3;
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2423 = _2355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2425 = _2413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2427 = _2415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2429 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2431 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2433 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    out.m_69.x = _2423;
    out.m_69.y = _2425;
    out.m_69.z = _2427;
    out.m_69.w = _2421;
    int _2435 = _1603 + _2419;
    float _2437 = -_2429;
    float _2439 = fma(_2431, 2.0, _2437);
    float _2441 = fma(_2399, -2.0, _2433);
    float _2443 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2445 = abs(_2341);
    float _2447 = _2387 * _2417;
    float _2449 = _2391 * _2417;
    float _2451 = _2381 * _2417;
    float _2453 = -_144;
    float _2455 = fma(_2453, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2439);
    float _2457 = _2003 * _2447;
    float _2459 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2441);
    float _2461 = fma(_2145, -2.0, _2443);
    int _2463 = ~_2445;
    int _2465 = _2463 + 1;
    int _2467 = _2465 + 1;
    float _2469 = -_2457;
    float _2471 = fma(_2017, _2449, _2469);
    int _2473 = _1765 >> 31;
    float _2475 = _2049 * _2449;
    int _2477 = _2435 >> 2;
    float _2479 = _2017 * _2451;
    int _2481 = _2473 & 3;
    float _2483 = -_2475;
    float _2485 = fma(_2003, _2451, _2483);
    int _2487 = _2477 << 4;
    int _2489 = _2487 + 368;
    float _2491 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2407);
    int _2493 = _1765 + _2481;
    float _2495 = _2471 * _2471;
    uint _2497 = uint(int(uint(_2489) >> uint(2)));
    uint _2499 = uint(int(uint(int(_2497)) >> uint(2)));
    int _2501 = int(_2497) & 3;
    float _2503 = (*spvDescriptorSet0.vp_c9)._m0[int(_2499)][_2501];
    int _2505 = int(_2497) + 1;
    uint _2507 = uint(int(uint(_2505) >> uint(2)));
    int _2509 = _2505 & 3;
    float _2511 = (*spvDescriptorSet0.vp_c9)._m0[int(_2507)][_2509];
    float _2513 = -_2479;
    float _2515 = fma(_2049, _2447, _2513);
    int _2517 = _2493 >> 2;
    float _2519 = fma(_2485, _2485, _2495);
    float _2521 = fma(_1487, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _2523 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2411);
    int _2525 = _2517 << 4;
    int _2527 = _2525 + 512;
    float _2529 = fma(_2515, _2515, _2519);
    float _2531 = fma(_2491, _1881, _2455);
    float _2533 = -_2459;
    float _2535 = fma(_2523, _2521, _2533);
    uint _2537 = uint(int(uint(_2527) >> uint(2)));
    uint _2539 = uint(int(uint(int(_2537)) >> uint(2)));
    int _2541 = int(_2537) & 3;
    float _2543 = (*spvDescriptorSet0.vp_c9)._m0[int(_2539)][_2541];
    int _2545 = int(_2537) + 1;
    uint _2547 = uint(int(uint(_2545) >> uint(2)));
    int _2549 = _2545 & 3;
    float _2551 = (*spvDescriptorSet0.vp_c9)._m0[int(_2547)][_2549];
    float _2553 = rsqrt(_2529);
    float _2555 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1975);
    float _2557 = _2201 + 0.5;
    float _2559 = _2333 + 0.5;
    float _2561 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2461);
    float _2563 = _2531 + 0.5;
    float _2565 = _2535 + 0.5;
    int _2567 = _2489 + 8;
    uint _2569 = uint(int(uint(_2567) >> uint(2)));
    uint _2571 = uint(int(uint(int(_2569)) >> uint(2)));
    int _2573 = int(_2569) & 3;
    float _2575 = (*spvDescriptorSet0.vp_c9)._m0[int(_2571)][_2573];
    int _2577 = int(_2569) + 1;
    uint _2579 = uint(int(uint(_2577) >> uint(2)));
    int _2581 = _2577 & 3;
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[int(_2579)][_2581];
    float _2585 = -_2561;
    float _2587 = fma(_2555, _2327, _2585);
    bool _2589 = _1615 != 3;
    out.m_71.x = _2559;
    out.m_71.y = _2557;
    out.m_71.z = _2563;
    out.m_71.w = _2565;
    int _2591 = _2527 + 8;
    uint _2593 = uint(int(uint(_2591) >> uint(2)));
    uint _2595 = uint(int(uint(int(_2593)) >> uint(2)));
    int _2597 = int(_2593) & 3;
    float _2599 = (*spvDescriptorSet0.vp_c9)._m0[int(_2595)][_2597];
    int _2601 = int(_2593) + 1;
    uint _2603 = uint(int(uint(_2601) >> uint(2)));
    int _2605 = _2601 & 3;
    float _2607 = (*spvDescriptorSet0.vp_c9)._m0[int(_2603)][_2605];
    float _2609 = _2515 * _2553;
    float _2611 = _2485 * _2553;
    float _2613 = _2471 * _2553;
    float _2615 = _2017 * _2609;
    float _2617 = _1911 * _2609;
    float _2619 = _1959 * _2609;
    float _2621 = _1959 * _2611;
    float _2623 = _2003 * _2613;
    float _2625 = -_2615;
    float _2627 = fma(_2003, _2611, _2625);
    float _2629 = _2049 * _2611;
    float _2631 = -_2623;
    float _2633 = fma(_2049, _2609, _2631);
    float _2635 = _2627 * _2627;
    int _2637 = ~_1891;
    int _2639 = _2637 + 1;
    int _2641 = _2639 + 1;
    float _2643 = -_2629;
    float _2645 = fma(_2017, _2613, _2643);
    int _2647 = abs(_1841);
    float _2649 = fma(_2633, _2633, _2635);
    bool _2651 = !_2589;
    int _2653 = _2651 ? 0 : (-1);
    float _2655 = _2611 * _1875;
    int _2657 = _2641 * as_type<int>(_2511);
    float _2659 = fma(_2645, _2645, _2649);
    int _2661 = abs(_1751);
    float _2663 = _2613 * _2247;
    int _2665 = ~_2647;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    int _2671 = ~_2661;
    int _2673 = _2671 + 1;
    int _2675 = _2673 + 1;
    float _2677 = rsqrt(_2659);
    bool _2679 = _1777 != 3;
    int _2681 = _2669 * as_type<int>(_2551);
    int _2683 = ~_1893;
    int _2685 = _2683 + 1;
    int _2687 = _2685 + 1;
    int _2689 = _2675 * as_type<int>(_2503);
    int _2691 = _2689 + _2657;
    int _2693 = _2467 * as_type<int>(_2543);
    int _2695 = _2693 + _2681;
    float _2697 = _1911 * _2611;
    float _2699 = _2611 * _2247;
    int _2701 = ~_1921;
    int _2703 = _2701 + 1;
    int _2705 = _2703 + 1;
    int _2707 = _2687 * as_type<int>(_2575);
    int _2709 = _2707 + _2691;
    bool _2711 = !_2679;
    int _2713 = _2711 ? 0 : (-1);
    float _2715 = _2645 * _2677;
    float _2717 = _2633 * _2677;
    float _2719 = _2613 * _1875;
    int _2721 = _2705 * as_type<int>(_2599);
    int _2723 = _2721 + _2695;
    float _2725 = fma(_1915, _2715, _2617);
    float _2727 = fma(_1915, _2717, _2697);
    float _2729 = _2609 * _1875;
    int _2731 = abs(_2653);
    float _2733 = fma(_2261, _2003, _2725);
    float _2735 = fma(_2261, _2017, _2727);
    int _2737 = abs(_2713);
    float _2739 = _1959 * _2613;
    float _2741 = _1785 + _2733;
    float _2743 = _1775 + _2735;
    float _2745 = _2627 * _2677;
    float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2749 = _2741 + _2747;
    float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2753 = _2743 + _2751;
    float _2755 = _1911 * _2613;
    float _2757 = _2749 * _2749;
    float _2759 = fma(_2717, _1873, _2655);
    float _2761 = fma(_2745, _1873, _2719);
    float _2763 = fma(_2715, _1873, _2729);
    float _2765 = fma(_2753, _2753, _2757);
    float _2767 = fma(_1915, _2745, _2755);
    bool _2769 = !_1715;
    int _2771 = _2769 ? 0 : 1;
    float _2773 = _2609 * _2247;
    float _2775 = sqrt(_2765);
    int _2777 = ~_2731;
    int _2779 = _2777 + 1;
    int _2781 = _2779 + 1;
    float _2783 = fma(_2261, _2049, _2767);
    int _2785 = ~_2737;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    float _2791 = fma(_2745, _2207, _2663);
    bool _2793 = !_1721;
    int _2795 = _2793 ? 0 : 1;
    int _2797 = _2781 * as_type<int>(_2583);
    int _2799 = _2797 + _2709;
    int _2801 = abs(_2771);
    float _2803 = fma(_1965, _2745, _2739);
    float _2805 = _1913 + _2783;
    int _2807 = abs(_2795);
    int _2809 = _2789 * as_type<int>(_2607);
    int _2811 = _2809 + _2723;
    float _2813 = fma(_1965, _2715, _2619);
    float _2815 = fma(_2715, _2207, _2773);
    float _2817 = fma(_1965, _2717, _2621);
    bool _2819 = _2775 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2821 = fma(_2717, _2207, _2699);
    int _2823 = ~_2801;
    int _2825 = _2823 + 1;
    int _2827 = _2825 + 1;
    int _2829 = ~_2807;
    int _2831 = _2829 + 1;
    int _2833 = _2831 + 1;
    float _2835 = _2715;
    float _2837 = _2613;
    float _2839 = _2741;
    if (!_2819)
    {
        _2835 = _2741;
    }
    float _2841 = _2835;
    float _2843 = _2841;
    if (!_2819)
    {
        _2837 = _2743;
    }
    float _2845 = _2837;
    float _2847 = _2845;
    if (!_2819)
    {
        _2839 = _2805;
    }
    float _2849 = _2839;
    bool _2851 = !_2819;
    float _2853 = _2849;
    if (!_2851)
    {
        float _2855 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2857 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2859 = _2775 + _2857;
        float _2861 = _2805 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2863 = rsqrt(_2765);
        float _2865 = _2859 * _2855;
        float _2867 = _2865 * 0.15915493667125701904296875;
        float _2869 = _2867 * 6.283185482025146484375;
        float _2871 = cos(_2869);
        float _2873 = _2867 * 6.283185482025146484375;
        float _2875 = sin(_2873);
        float _2877 = _2871 + (-1.0);
        float _2879 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2881 = fma(_2875, _2861, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2883 = fma(_2805, _2871, _2879);
        float _2885 = _2863 * _2881;
        float _2887 = fma(_2753, _2885, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2889 = fma(_2749, _2885, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2853 = _2883;
        _2847 = _2887;
        _2843 = _2889;
    }
    float _2891 = _2853;
    float _2893 = _2847;
    float _2895 = _2843;
    float _2897 = -_1913;
    float _2899 = _2897 + _2891;
    int _2901 = _2799 * _2827;
    float _2903 = -_1775;
    float _2905 = _2903 + _2893;
    int _2907 = _2811 * _2833;
    float _2909 = _2899 * _2899;
    bool _2911 = !_1455;
    int _2913 = _2911 ? _1897 : (-1);
    float _2915 = fma(_2049, _1877, _2761);
    bool _2917 = !_1319;
    int _2919 = _2917 ? _2337 : (-1);
    float _2921 = -_1785;
    float _2923 = _2921 + _2895;
    float _2925 = fma(_2905, _2905, _2909);
    int _2927 = _2913 * _2801;
    int _2929 = _2927 + _2901;
    float _2931 = fma(_1963, _2049, _2803);
    int _2933 = _2919 * _2807;
    int _2935 = _2933 + _2907;
    float _2937 = fma(_2923, _2923, _2925);
    float _2939 = fma(_2017, _1877, _2759);
    float _2941 = fma(_1963, _2017, _2817);
    float _2943 = fma(_1963, _2003, _2813);
    float _2945 = sqrt(_2937);
    float _2947 = fma(_2017, _2267, _2821);
    float _2949 = float(_2929);
    float _2951 = fma(_2003, _1877, _2763);
    float _2953 = _2401 + 0.5;
    float _2955 = _2587 + 0.5;
    float _2957 = fma(_2049, _2267, _2791);
    float _2959 = float(_2935);
    float _2961 = fma(_2003, _2267, _2815);
    out.m_73.x = _2939;
    out.m_73.y = _2915;
    out.m_73.z = _2951;
    out.m_75.x = _2953;
    out.m_75.y = _2955;
    bool _2963 = _2945 > 0.0;
    out.m_77.x = _2941;
    out.m_77.y = _2931;
    out.m_77.z = _2943;
    out.m_79.x = _2949;
    out.m_79.y = _2959;
    out.m_81.x = _2947;
    out.m_81.y = _2957;
    out.m_81.z = _2961;
    bool _2965 = !_2963;
    float _2967 = _2915;
    float _2969 = _2951;
    float _2971 = _2939;
    float _2973 = _2893;
    float _2975 = _2891;
    float _2977 = _2895;
    float _2979 = _2915;
    float _2981 = _2939;
    float _2983 = _2951;
    float _2985 = _2941;
    float _2987 = _2943;
    if (!_2965)
    {
        bool _2989 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2991 = _2049;
        if (_2989)
        {
            float _2993 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2991 = _2993;
        }
        float _2995 = _2991;
        if (_2989)
        {
            float _2997 = _442 * _2995;
            _2967 = _2997;
        }
        float _2999 = _2967;
        float _3001 = _2999;
        if (_2989)
        {
            float _3003 = _444 * _2995;
            _2969 = _3003;
        }
        float _3005 = _2969;
        float _3007 = _3005;
        if (_2989)
        {
            float _3009 = _446 * _2995;
            _2971 = _3009;
        }
        float _3011 = _2971;
        float _3013 = _3011;
        float _3015 = _3011;
        if (!_2989)
        {
            bool _3017 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _3019 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _3021 = _3017 || _3019;
            bool _3023 = isnan(1.0);
            bool _3025 = _3021 || _3023;
            float _3027 = _144 + 1.0;
            float _3029 = _3027;
            if (!_3025)
            {
                float _3031 = _3027 * _3027;
                float _3033 = _3031 * 0.5;
                _3013 = _3033;
            }
            float _3035 = _3013;
            float _3037 = _3035;
            if (!_3025)
            {
                float _3039 = _3035 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3037 = _3039;
            }
            float _3041 = _3037;
            bool _3043 = !_3025;
            float _3045 = _3041;
            if (!_3043)
            {
                float _3047 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3049 = log2(_3047);
                float _3051 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3053 = _3051 + 1.0;
                float _3055 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3057 = _3049 * _3027;
                float _3059 = 1.0 / _3053;
                float _3061 = _3055 * 0.693147182464599609375;
                float _3063 = exp2(_3057);
                float _3065 = 1.0 / _3061;
                float _3067 = _3063 + (-1.0);
                float _3069 = -_3067;
                float _3071 = fma(_3069, _3065, _3027);
                float _3073 = _3071 * _3059;
                float _3075 = _3073 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3045 = _3075;
            }
            float _3077 = _3045;
            float _3079 = _3077 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3081 = _3077 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3083 = !_3025;
            if (!_3083)
            {
                float _3085 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3087 = log2(_3085);
                float _3089 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3091 = _3089 + 1.0;
                float _3093 = 1.0 / _3091;
                float _3095 = _3087 * _3027;
                float _3097 = exp2(_3095);
                float _3099 = -_3097;
                float _3101 = _3099 + 1.0;
                float _3103 = _3101 * _3093;
                _3029 = _3103;
            }
            float _3105 = _3029;
            float _3107 = fma(_3105, _180, _3081);
            float _3109 = fma(_3105, _178, _3079);
            float _3111 = _3077 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3113 = -_404;
            float _3115 = _3113 + _3107;
            float _3117 = -_406;
            float _3119 = _3117 + _3109;
            float _3121 = fma(_3105, _182, _3111);
            float _3123 = _3115 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3125 = _3115 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3127 = _3115 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3129 = -_408;
            float _3131 = _3129 + _3121;
            float _3133 = fma(_3119, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3123);
            float _3135 = fma(_3119, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3125);
            float _3137 = fma(_3119, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3127);
            float _3139 = fma(_3131, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3133);
            float _3141 = fma(_3131, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3135);
            float _3143 = fma(_3131, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3137);
            _450 = _3141;
            _452 = _3139;
            _454 = _3143;
            _3001 = _3139;
            _3007 = _3141;
            _3015 = _3143;
        }
        float _3145 = _450;
        float _3147 = _452;
        float _3149 = _454;
        float _3151 = _3001;
        float _3153 = _3007;
        float _3155 = _3015;
        float _3157 = _3145 * _3145;
        float _3159 = rsqrt(_2937);
        float _3161 = fma(_3147, _3147, _3157);
        float _3163 = fma(_3149, _3149, _3161);
        float _3165 = sqrt(_3163);
        float _3167 = _2905 * _3159;
        float _3169 = _2899 * _3159;
        float _3171 = _2923 * _3159;
        bool _3173 = _3165 > 0.0;
        bool _3175 = !_3173;
        _2979 = _3151;
        _2981 = _3155;
        _2983 = _3153;
        _2985 = _3167;
        _456 = _3147;
        if (!_3175)
        {
            float _3177 = rsqrt(_3163);
            float _3179 = _3177 * _3145;
            float _3181 = _3177 * _3147;
            float _3183 = _3177 * _3149;
            float _3185 = _3169 * _3179;
            float _3187 = fma(_3167, _3181, _3185);
            float _3189 = fma(_3171, _3183, _3187);
            float _3191 = _3189 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3193 = fma(_3151, _3191, _2893);
            float _3195 = fma(_3153, _3191, _2891);
            float _3197 = fma(_3155, _3191, _2895);
            _2973 = _3193;
            _2975 = _3195;
            _2977 = _3197;
        }
    }
    float _3199 = _2973;
    float _3201 = _2975;
    float _3203 = _2977;
    float _3205 = _2979;
    float _3207 = _2981;
    float _3209 = _2983;
    float _3211 = _2985;
    float _3213 = _456;
    bool _3215 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3217 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3219 = _3215 || _3217;
    bool _3221 = isnan(0.5);
    bool _3223 = _3219 || _3221;
    float _3225 = _3207;
    float _3227 = _3205;
    float _3229 = _3209;
    float _3231 = _3213;
    if (_3223)
    {
        _3225 = _3199;
    }
    float _3233 = _3225;
    float _3235 = _3233;
    if (_3223)
    {
        _3227 = _3201;
    }
    float _3237 = _3227;
    float _3239 = _3237;
    if (_3223)
    {
        _3229 = _3203;
    }
    float _3241 = _3229;
    float _3243 = _3241;
    if (!_3223)
    {
        float _3245 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3247 = _1913 + _3245;
        float _3249 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3251 = _1775 + _3249;
        float _3253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3255 = -_1775;
        float _3257 = _3255 + _3199;
        float _3259 = _3247 * _3247;
        float _3261 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3263 = _1785 + _3261;
        float _3265 = -_1913;
        float _3267 = _3265 + _3201;
        float _3269 = -_1785;
        float _3271 = _3269 + _3203;
        float _3273 = fma(_3251, _3251, _3259);
        float _3275 = fma(_3263, _3263, _3273);
        float _3277 = sqrt(_3275);
        float _3279 = precise::min(_3277, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3281 = _3279 * _3253;
        float _3283 = fma(_3257, _3281, _1775);
        float _3285 = fma(_3267, _3281, _1913);
        float _3287 = fma(_3271, _3281, _1785);
        _3239 = _3285;
        _3235 = _3283;
        _3243 = _3287;
    }
    float _3289 = _3239;
    float _3291 = _3235;
    float _3293 = _3243;
    float _3295 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3297 = _3289 + _3295;
    float _3299 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3301 = _3291 + _3299;
    float _3303 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3305 = _3293 + _3303;
    float _3307 = _3297 * _3297;
    float _3309 = fma(_3301, _3301, _3307);
    float _3311 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3313 = fma(_3305, _3305, _3309);
    float _3315 = rsqrt(_3313);
    float _3317 = sqrt(_3313);
    float _3319 = _3315 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3321 = _3301 * _3319;
    float _3323 = _3305 * _3319;
    float _3325 = _3321 * _3321;
    float _3327 = _3323 * _3323;
    float _3329 = _3325 + _3327;
    float _3331 = sqrt(_3329);
    bool _3333 = _3331 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3335 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3337 = _3331 + _3335;
    float _3339 = _2931;
    float _3341 = _3337;
    float _3343 = _3297;
    float _3345 = _3321;
    if (_3333)
    {
        float _3347 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3339 = _3347;
    }
    float _3349 = _3339;
    float _3351 = _3349;
    if (_3333)
    {
        float _3353 = _3337 * _3349;
        _3341 = _3353;
    }
    float _3355 = _3341;
    if (_3333)
    {
        float _3357 = rsqrt(_3329);
        _3351 = _3357;
    }
    float _3359 = _3351;
    float _3361 = _3359;
    if (_3333)
    {
        float _3363 = _3355 * 0.15915493667125701904296875;
        _2987 = _3363;
    }
    float _3365 = _2987;
    float _3367 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3369 = _3305;
    if (_3333)
    {
        float _3371 = _3365 * 6.283185482025146484375;
        float _3373 = sin(_3371);
        _3369 = _3373;
    }
    float _3375 = _3369;
    float _3377 = _3289 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3379 = precise::max(0.0, _3367);
    float _3381 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3377);
    float _3383 = _3211;
    float _3385 = _3379;
    if (_3333)
    {
        float _3387 = _3365 * 6.283185482025146484375;
        float _3389 = cos(_3387);
        _3383 = _3389;
    }
    float _3391 = _3383;
    float _3393 = -_3319;
    float _3395 = -_3379;
    float _3397 = fma(_3297, _3393, _3395);
    float _3399 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3381);
    if (_3333)
    {
        float _3401 = _3397 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3343 = _3401;
    }
    float _3403 = _3343;
    float _3405 = _3375;
    float _3407 = _3403;
    if (_3333)
    {
        float _3409 = fma(_3375, _3403, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3405 = _3409;
    }
    float _3411 = _3405;
    float _3413 = _3411;
    if (!_3333)
    {
        _3407 = _3397;
    }
    float _3415 = _3407;
    float _3417 = _3415;
    if (_3333)
    {
        float _3419 = _3359 * _3411;
        _3231 = _3419;
    }
    float _3421 = _3231;
    if (!_3333)
    {
        _3413 = _3325;
    }
    float _3423 = _3413;
    float _3425 = _3423;
    float _3427 = _3391;
    if (_3333)
    {
        float _3429 = _3391 + (-1.0);
        _3385 = _3429;
    }
    float _3431 = _3385;
    float _3433 = _3431;
    if (_3333)
    {
        float _3435 = _3321 * _3421;
        _3345 = _3435;
    }
    float _3437 = _3345;
    if (_3333)
    {
        float _3439 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3361 = _3439;
    }
    float _3441 = _3361;
    if (!_3333)
    {
        _3433 = _3323;
    }
    float _3443 = _3433;
    float _3445 = _3443;
    if (_3333)
    {
        float _3447 = _3323 * _3421;
        _3445 = _3447;
    }
    float _3449 = _3445;
    if (_3333)
    {
        float _3451 = _3437 * _3437;
        _3425 = _3451;
    }
    float _3453 = _3425;
    if (_3333)
    {
        float _3455 = fma(_3397, _3391, _3441);
        _3417 = _3455;
    }
    float _3457 = _3417;
    if (!_3333)
    {
        _3427 = _3327;
    }
    float _3459 = _3427;
    float _3461 = _3459;
    if (_3333)
    {
        float _3463 = _3449 * _3449;
        _3461 = _3463;
    }
    float _3465 = _3461;
    float _3467 = _3289 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3469 = fma(_3457, _3457, _3453);
    float _3471 = _3399 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3473 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3467);
    float _3475 = _3469 + _3465;
    float _3477 = _3289 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3481 = fma(_3317, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3479);
    float _3483 = precise::clamp(_3481, 0.0, 1.0);
    float _3485 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3473);
    float _3487 = rsqrt(_3475);
    float _3489 = _3289 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3491 = -_3483;
    float _3493 = _3491 + 1.0;
    float _3495 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3477);
    float _3497 = _3485 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3499 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3489);
    float _3501 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3495);
    float _3503 = abs(_3493);
    float _3505 = log2(_3503);
    float _3507 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3499);
    float _3509 = _3497 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3511 = _3501 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3513 = _3507 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3515 = -_3509;
    float _3517 = fma(_3515, _3311, 1.0);
    float _3519 = _3511 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3521 = _3487 * _3437;
    float _3523 = _3487 * _3457;
    float _3525 = _3487 * _3449;
    float _3527 = fma(_3513, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3519);
    float _3529 = _3521 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3531 = log2(_3517);
    float _3533 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3527);
    float _3535 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3537 = -_3529;
    float _3539 = fma(_3523, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3537);
    float _3541 = _3511 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3543 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3533);
    float _3545 = exp2(_3535);
    float _3547 = -_3525;
    float _3549 = fma(_3547, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3539);
    float _3551 = _3511 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3553 = fma(_3513, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3541);
    float _3555 = fma(_3549, -0.5, 0.5);
    float _3557 = fma(_3513, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3551);
    float _3559 = fma(_3549, 0.5, 0.5);
    float _3561 = 1.0 / _3543;
    float _3563 = _3523 + 1.0;
    float _3565 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3557);
    float _3567 = fma(_3559, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3569 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3553);
    float _3571 = fma(_3559, _3567, -0.212114393711090087890625);
    float _3573 = sqrt(_3555);
    float _3575 = -_3523;
    float _3577 = fma(_3545, _3563, _3575);
    float _3579 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3565);
    float _3581 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3569);
    float _3583 = _3531 * 0.693147182464599609375;
    float _3585 = fma(_3559, _3571, 1.570728778839111328125);
    float _3587 = _3579 * _3561;
    float _3589 = _3581 * _3561;
    float _3591 = _3583 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3593 = fma(_3587, 0.5, 0.5);
    float _3595 = fma(_3589, -0.5, 0.5);
    float _3597 = _3573 * 0.636619746685028076171875;
    float _3599 = fma(_3577, 0.5, 0.5);
    float3 _9483 = float3(_3593, _3595, _3591);
    float _3601 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9483, float3(0.0), isnan(_9483)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9483, float3(0.0), isnan(_9483)), level(0.0)).x;
    float _3603 = -_3585;
    float _3605 = fma(_3597, _3603, 1.0);
    float3 _9499 = float3(_3593, _3595, _3591);
    float4 _3608 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9499, float3(0.0), isnan(_9499)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9499, float3(0.0), isnan(_9499)), level(0.0)).xyzw;
    float _3610 = _3608.x;
    float _3612 = _3608.y;
    float _3614 = _3608.z;
    float _3616 = _3608.w;
    float2 _9516 = float2(_3605, _3599);
    float3 _3620 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9516, float2(0.0), isnan(_9516)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9516, float2(0.0), isnan(_9516)), level(0.0)).xyz;
    float _3622 = _3620.x;
    float _3624 = _3620.y;
    float _3626 = _3620.z;
    float _3628 = _1913 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3630 = _1913 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3632 = _3511 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3634 = _3317 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3636 = isnan(_3317);
    bool _3638 = _3634 || _3636;
    bool _3640 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3642 = _3638 || _3640;
    float _3644 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3628);
    float _3646 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3630);
    float _3648 = fma(_3513, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3632);
    float _3650 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3644);
    float _3652 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3646);
    float _3654 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3648);
    float _3656 = _3650 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3658 = _3652 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3660 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3654);
    float _3662 = 1.0 / _3656;
    bool _3664 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3666 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3668 = _3664 || _3666;
    bool _3670 = isnan(0.5);
    bool _3672 = _3668 || _3670;
    float _3674 = _3658 + _3656;
    float _3676 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3678 = _3579 + _3543;
    out.gl_Position.x = _3579;
    out.gl_Position.y = _3581;
    out.gl_Position.z = _3660;
    out.gl_Position.w = _3543;
    float _3680 = exp2(_3676);
    float _3682 = _3678 * 0.5;
    float _3684 = _3660 + _3543;
    float _3686 = _3513;
    float _3688 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _3690 = _3660;
    float _3692 = _3581;
    float _3694 = _3579;
    float _3696 = _3654;
    float _3698 = _3678;
    float _3700 = _3543;
    if (!_3672)
    {
        _1835 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3702 = _1835;
    float _3704 = _3684 * 0.5;
    float _3706 = _3674 * _3662;
    float _3708 = _3706 * 0.5;
    float _3710 = _3543 * 0.5;
    float _3712 = _3710;
    if (_3672)
    {
        _3686 = 1.0;
    }
    float _3714 = _3686;
    float _3716 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3718 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3716);
    float _3720 = _3714;
    if (!_3672)
    {
        float _3722 = -_3702;
        float _3724 = _3722 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3688 = _3724;
    }
    float _3726 = _3688;
    float _3728 = fma(_3581, -0.5, _3710);
    if (!_3672)
    {
        _3712 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _3730 = _3712;
    float _3732 = -_3680;
    float _3734 = _3732 + 1.0;
    if (!_3642)
    {
        _3690 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3736 = _3690;
    float _3738 = 1.0 / _3718;
    float _3740 = _3736;
    float _3742 = _3736;
    if (!_3642)
    {
        _3692 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3744 = _3692;
    float _3746 = _3734 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3748 = _3744;
    float _3750 = _3744;
    if (!_3642)
    {
        _3694 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3752 = _3694;
    float _3754 = _3726;
    float _3756 = _3752;
    float _3758 = _3752;
    if (!_3672)
    {
        float _3760 = 1.0 / _3726;
        _3754 = _3760;
    }
    float _3762 = _3754;
    if (!_3672)
    {
        float _3764 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3766 = -_3702;
        float _3768 = fma(_3738, _3764, _3766);
        _3696 = _3768;
    }
    float _3770 = _3696;
    float _3772 = _3770;
    if (!_3672)
    {
        float _3774 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3776 = -_3730;
        float _3778 = fma(_3738, _3774, _3776);
        _3698 = _3778;
    }
    float _3780 = _3698;
    float _3782 = _3780;
    if (_3672)
    {
        _3700 = 1.0;
    }
    float _3784 = _3700;
    out.m_83.x = _3682;
    out.m_83.y = _3728;
    out.m_83.z = _3704;
    out.m_83.w = _3543;
    float _3786 = _3784;
    if (!_3672)
    {
        float _3788 = _3770 * _3762;
        float _3790 = precise::clamp(_3788, 0.0, 1.0);
        _3720 = _3790;
    }
    float _3792 = _3720;
    if (!_3672)
    {
        float _3794 = -_3730;
        float _3796 = _3794 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _3772 = _3796;
    }
    float _3798 = _3772;
    float _3800 = _3730;
    if (!_3672)
    {
        float _3802 = 1.0 / _3798;
        _3800 = _3802;
    }
    float _3804 = _3800;
    if (!_3672)
    {
        float _3806 = _3780 * _3804;
        float _3808 = precise::clamp(_3806, 0.0, 1.0);
        _3782 = _3808;
    }
    float _3810 = _3782;
    if (!_3672)
    {
        float _3812 = -_3810;
        float _3814 = _3812 + 1.0;
        _3786 = _3814;
    }
    float _3816 = _3786;
    float _3818 = _3746 * _3601;
    float _3820 = -_3746;
    float _3822 = _3820 + 1.0;
    float _3824 = _3616 * _3818;
    float _3826 = _3616 * _3822;
    float _3828 = _3626 * _3818;
    float _3830 = fma(_3622, _3824, _3610);
    float _3832 = fma(_3624, _3824, _3612);
    float _3834 = fma(_3616, _3828, _3614);
    float _3836 = _3792 * _3816;
    out.m_85.x = _3830;
    out.m_85.y = _3832;
    out.m_85.z = _3834;
    out.m_85.w = _3826;
    float _3838 = _3836 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3840 = !_3642;
    if (!_3840)
    {
        bool _3842 = _3317 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3844 = isnan(_3317);
        bool _3846 = _3842 || _3844;
        bool _3848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3850 = _3846 || _3848;
        if (!_3850)
        {
            float _3852 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3854 = _3317 + _3852;
            float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3858 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3856;
            float _3860 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3862 = _3860 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3864 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3866 = _3864 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3868 = 1.0 / _3858;
            float _3870 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3872 = _3870 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3874 = _3854 * _3868;
            float _3876 = precise::clamp(_3874, 0.0, 1.0);
            float _3878 = fma(_3876, _3862, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3880 = fma(_3876, _3866, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3882 = fma(_3876, _3872, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _3750 = _3880;
            _3742 = _3878;
            _3758 = _3882;
            _3884 = true;
        }
        else
        {
            bool _3886 = _3317 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3888 = isnan(_3317);
            bool _3890 = _3886 || _3888;
            bool _3892 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3894 = _3890 || _3892;
            if (!_3894)
            {
                _3740 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3896 = _3740;
            _3742 = _3896;
            if (!_3894)
            {
                _3748 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3898 = _3748;
            _3750 = _3898;
            if (!_3894)
            {
                _3756 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3900 = _3756;
            bool _3902 = !_3894;
            _3758 = _3900;
            if (!_3902)
            {
                bool _3904 = _3317 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3906 = isnan(_3317);
                bool _3908 = _3904 || _3906;
                bool _3910 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3912 = _3908 || _3910;
                if (!_3912)
                {
                    float _3914 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3916 = _3317 + _3914;
                    float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3920 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3918;
                    float _3922 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3924 = _3922 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3926 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3928 = _3926 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3930 = 1.0 / _3920;
                    float _3932 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3934 = _3932 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3936 = _3916 * _3930;
                    float _3938 = precise::clamp(_3936, 0.0, 1.0);
                    float _3940 = fma(_3938, _3924, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3942 = fma(_3938, _3928, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3944 = fma(_3938, _3934, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _3750 = _3942;
                    _3742 = _3940;
                    _3758 = _3944;
                    _3884 = true;
                }
                else
                {
                    _3750 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3742 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3758 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3884 = false;
    float _3946 = _3750;
    float _3948 = _3742;
    float _3950 = _3758;
    float _3952 = _3838 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_87.x = 0.0;
    float _3954 = _3946 * 0.586610972881317138671875;
    bool _3956 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _3952;
    float _3958 = fma(_3948, 0.298911988735198974609375, _3954);
    bool _3960 = _3792 > 0.0;
    bool _3962 = isnan(_3792);
    bool _3964 = _3960 || _3962;
    bool _3966 = isnan(0.0);
    bool _3968 = _3964 || _3966;
    float _3970 = fma(_3950, 0.114477999508380889892578125, _3958);
    bool _3972 = _3816 <= 0.0;
    bool _3974 = !_3968;
    bool _3976 = _3972 || _3974;
    float _3978 = -_3970;
    float _3980 = _3978 + _3948;
    float _3982 = -_3970;
    float _3984 = _3982 + _3946;
    float _3986 = -_3970;
    float _3988 = _3986 + _3950;
    float _3990 = fma(_3980, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3970);
    float _3992 = fma(_3984, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3970);
    float _3994 = fma(_3988, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3970);
    bool _3996 = !_3956;
    if (!_3996)
    {
        float _3998 = -_3289;
        float _4000 = _3998 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4002 = -_3291;
        float _4004 = _4002 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4006 = -_3293;
        float _4008 = _4006 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4010 = _4000 * _4000;
        float _4012 = fma(_4004, _4004, _4010);
        float _4014 = fma(_4008, _4008, _4012);
        float _4016 = sqrt(_4014);
        float _4018 = rsqrt(_4014);
        float _4020 = -_4016;
        float _4022 = _4020 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4024 = _4022 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4026 = precise::clamp(_4024, 0.0, 1.0);
        float _4028 = _4004 * _4018;
        float _4030 = _4000 * _4018;
        float _4032 = abs(_4026);
        float _4034 = log2(_4032);
        float _4036 = _4008 * _4018;
        float _4038 = _4028 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4040 = _2957 * _4030;
        float _4042 = -_4030;
        float _4044 = -_4038;
        float _4046 = fma(_4042, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4044);
        float _4048 = fma(_2947, _4028, _4040);
        float _4050 = -_4036;
        float _4052 = fma(_4050, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4046);
        float _4054 = fma(_2961, _4036, _4048);
        float _4056 = precise::clamp(_4054, 0.0, 1.0);
        float _4058 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4060 = _4052 + _4058;
        float _4062 = _4034 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4064 = _4060 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4066 = precise::clamp(_4064, 0.0, 1.0);
        float _4068 = exp2(_4062);
        float _4070 = _4068 * _4066;
        float _4072 = _4056 * _4070;
        float _4074 = _4072 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4076 = _4072 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4078 = _4072 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _4074;
        out.m_87.y = _4076;
        out.m_87.z = _4078;
    }
    out.m_89.x = _3990;
    out.m_89.y = _3992;
    out.m_89.z = _3994;
    if (!_3976)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _4080 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4080;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3884 = false;
    bool _822 = false;
    bool _590 = false;
    bool _476 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    float _120 = _118;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _122 = 0;
    if (!_112)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4139 = as_type<float>(_126);
        out.gl_Position.z = _4139;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_49.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_140)
    {
        float _146 = float(_108);
        _120 = _146;
    }
    float _148 = _120;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_47.x = 0.0;
    }
    if (_154)
    {
        float _160 = _158 * 5.0;
        _128 = as_type<int>(_160);
    }
    int _162 = _128;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4208 = as_type<float>(_162);
        out.gl_Position.z = _4208;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = in.m_51.w;
    float _166 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_49.x;
    float _180 = in.m_49.y;
    float _182 = in.m_49.z;
    int _184 = int(_176);
    int _186 = false ? 2 : 0;
    int _188 = _184 | _186;
    int _190 = false ? 4 : 0;
    int _192 = _188 | _190;
    int _194 = false ? 8 : 0;
    int _196 = _192 | _194;
    int _198 = false ? 16 : 0;
    int _200 = _196 | _198;
    int _202 = false ? 32 : 0;
    int _204 = _200 | _202;
    int _206 = false ? 64 : 0;
    int _208 = _204 | _206;
    int _210 = _208 & 1;
    float _212 = in.m_44.x;
    float _214 = in.m_44.y;
    float _216 = in.m_44.z;
    float _218 = as_type<float>(_210);
    float _220 = _166;
    if (!_176)
    {
        float _222 = _166 * _166;
        float _224 = _222 * 0.5;
        _218 = _224;
    }
    float _226 = _218;
    float _228 = _226;
    if (!_176)
    {
        float _230 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _228 = _230;
    }
    float _232 = _228;
    bool _234 = !_176;
    float _236 = _232;
    float _238 = 0.0;
    float _240 = 0.0;
    if (!_234)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = _166 * _244;
        float _254 = 1.0 / _248;
        float _256 = _250 * 0.693147182464599609375;
        float _258 = exp2(_252);
        float _260 = 1.0 / _256;
        float _262 = _258 + (-1.0);
        float _264 = -_262;
        float _266 = fma(_264, _260, _166);
        float _268 = _266 * _254;
        float _270 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _270;
        _238 = _254;
        _240 = _260;
    }
    float _272 = _236;
    float _274 = _238;
    float _276 = _240;
    bool _278 = !_176;
    float _280 = _276;
    float _282 = _274;
    float _284 = _272;
    if (!_278)
    {
        float _286 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _288 = log2(_286);
        float _290 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _292 = _290 + 1.0;
        float _294 = 1.0 / _292;
        float _296 = _166 * _288;
        float _298 = exp2(_296);
        float _300 = -_298;
        float _302 = _300 + 1.0;
        float _304 = _302 * _294;
        _220 = _304;
        _280 = _292;
    }
    float _306 = _220;
    float _308 = _280;
    float _310 = _308;
    if (!_176)
    {
        float _312 = _144 * _144;
        float _314 = _312 * 0.5;
        _282 = _314;
    }
    float _316 = _282;
    float _318 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _320 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _322 = _272 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_176)
    {
        _310 = _144;
    }
    float _324 = _310;
    float _326 = fma(_306, _178, _318);
    float _328 = fma(_306, _180, _320);
    float _330 = _324;
    if (!_176)
    {
        float _332 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _284 = _332;
    }
    float _334 = _284;
    bool _336 = !_176;
    float _338 = _334;
    if (!_336)
    {
        float _340 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _342 = log2(_340);
        float _344 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _346 = _344 + 1.0;
        float _348 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _350 = _144 * _342;
        float _352 = 1.0 / _346;
        float _354 = _348 * 0.693147182464599609375;
        float _356 = exp2(_350);
        float _358 = 1.0 / _354;
        float _360 = _356 + (-1.0);
        float _362 = -_360;
        float _364 = fma(_362, _358, _144);
        float _366 = _364 * _352;
        float _368 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _338 = _368;
    }
    float _370 = _338;
    bool _372 = !_176;
    if (!_372)
    {
        float _374 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _376 = log2(_374);
        float _378 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _380 = _378 + 1.0;
        float _382 = 1.0 / _380;
        float _384 = _144 * _376;
        float _386 = exp2(_384);
        float _388 = -_386;
        float _390 = _388 + 1.0;
        float _392 = _390 * _382;
        _330 = _392;
    }
    float _394 = _330;
    float _396 = _370 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _398 = _370 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _400 = _370 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _402 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _404 = fma(_394, _180, _396);
    float _406 = fma(_394, _178, _398);
    float _408 = fma(_394, _182, _400);
    float _410 = fma(_306, _182, _322);
    float _412 = -_404;
    float _414 = _328 + _412;
    float _416 = -_406;
    float _418 = _326 + _416;
    float _420 = fma(_326, _164, _212);
    float _422 = -_408;
    float _424 = _410 + _422;
    float _426 = _414 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _428 = _414 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _430 = _414 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _432 = fma(_328, _164, _214);
    float _434 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[4].x, _426);
    float _436 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[5].x, _428);
    float _438 = fma(_418, (*spvDescriptorSet0.vp_c10)._m0[6].x, _430);
    float _440 = fma(_410, _164, _216);
    float _442 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[4].z, _434);
    float _444 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[5].z, _436);
    float _446 = fma(_424, (*spvDescriptorSet0.vp_c10)._m0[6].z, _438);
    bool _448 = !_402;
    float _450 = _444;
    float _452 = _442;
    float _454 = _446;
    float _456 = _442;
    float _474;
    if (!_448)
    {
        float _458 = in.m_53.x;
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _462 = _458 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _466 = _464 * _460;
        float _468 = floor(_466);
        float _470 = -_468;
        float _472 = _466 + _470;
        _474 = _472;
        _476 = true;
    }
    else
    {
        float _478 = float(_108);
        float _480 = 1.0 / _478;
        float _482 = _144 * _480;
        _474 = _482;
    }
    _476 = false;
    float _484 = _474;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _488 = _484 + _486;
    bool _490 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _492 = isnan(_484);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _502;
    bool _506 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _508 = isnan(_484);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -_500;
    float _520 = _518 + 1.0;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _522;
    float _526 = 1.0 / _504;
    bool _528 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _530 = _516 * _520;
    float _532 = -_516;
    float _534 = _532 + 1.0;
    float _536 = _488 * _526;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _538;
    float _542 = fma(_524, _536, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _544;
    float _548 = fma(_540, _536, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _550 = _542 * _530;
    float _552 = fma(_546, _536, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _554 = _548 * _530;
    float _556 = _552 * _530;
    float _558 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].x, _550);
    float _560 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].y, _556);
    float _562 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[143].z, _554);
    float _564 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[144].x, _558);
    float _566 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[144].y, _560);
    float _568 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[144].z, _562);
    bool _570 = !_528;
    float _588;
    if (!_570)
    {
        float _572 = in.m_53.x;
        float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _576 = _572 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _580 = _578 * _574;
        float _582 = floor(_580);
        float _584 = -_582;
        float _586 = _580 + _584;
        _588 = _586;
        _590 = true;
    }
    else
    {
        float _592 = float(_108);
        float _594 = 1.0 / _592;
        float _596 = _144 * _594;
        _588 = _596;
    }
    _590 = false;
    float _598 = _588;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _602 = _598 + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _616 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _618 = isnan(_598);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = 1.0 / _606;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _634 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _636 = isnan(_598);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    bool _646 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _648 = 1.0 / _614;
    float _650 = _610 * _628;
    bool _652 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _654 = isnan(_598);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = 1.0 / _632;
    float _666 = -_626;
    float _668 = _666 + 1.0;
    float _670 = fma(_650, _602, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _676 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _678 = isnan(_598);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = -_662;
    float _690 = _688 + 1.0;
    float _692 = _662 * _668;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _698 = 1.0 / _674;
    float _700 = -_686;
    float _702 = _700 + 1.0;
    float _704 = _644 * _690;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _706;
    float _710 = _696 * _648;
    float _712 = _626 * _702;
    float _714 = _670 * _704;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _718 = _598 + _716;
    float _720 = -_644;
    float _722 = _720 + 1.0;
    float _724 = _708 * _664;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _728 = _598 + _726;
    bool _730 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _732 = isnan(_598);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _746 = fma(_710, _718, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _748 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[115].x, _714);
    float _750 = fma(_724, _728, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _752 = _744 * _698;
    float _754 = -_740;
    float _756 = _754 + 1.0;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _760 = _598 + _758;
    float _762 = fma(_746, _692, _748);
    float _764 = _686 * _756;
    float _766 = fma(_752, _760, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _768 = fma(_750, _712, _762);
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _772 = fma(_766, _764, _768);
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _776 = _770 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _778 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[119].x, _772);
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _782 = _774 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _784 = _778 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _786 = in.m_51.x;
    float _788 = in.m_51.y;
    float _790 = in.m_51.z;
    float _792 = _780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _776;
    out.m_55.y = _782;
    out.m_55.z = _792;
    out.m_55.w = _784;
    float _794 = _568 * _790;
    float _796 = _566 * _788;
    float _798 = _564 * _786;
    bool _800 = !_646;
    float _802 = _794;
    float _820;
    if (!_800)
    {
        float _804 = in.m_53.x;
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _808 = _804 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[11].z, _144);
        float _812 = _810 * _806;
        float _814 = floor(_812);
        float _816 = -_814;
        float _818 = _812 + _816;
        _820 = _818;
        _822 = true;
    }
    else
    {
        float _824 = float(_108);
        float _826 = 1.0 / _824;
        float _828 = _144 * _826;
        _820 = _828;
    }
    _822 = false;
    float _830 = _820;
    float _832 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _834 = int(_832);
    float _836 = in.m_53.x;
    float _838 = float(_108);
    float _840 = _796 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _842 = in.m_57.x;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _846 = _830 + _844;
    float _848 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _850 = int(_848);
    float _852 = in.m_53.y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _858 = in.m_53.z;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _862 = _830 + _860;
    float _864 = float(_834);
    float _866 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _868 = int(_866);
    float _870 = in.m_57.y;
    float _872 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _874 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _876 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _878 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _880 = float(_850);
    float _882 = 1.0 / _864;
    float _884 = -_878;
    float _886 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _884);
    float _888 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _892 = _890 != 0;
    float _894 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _896 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _898 = int(_896);
    float _900 = float(uint(_868));
    float _902 = -_888;
    float _904 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _902);
    int _906 = ~_868;
    int _908 = _906 + 1;
    float _910 = -_894;
    float _912 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _910);
    bool _914 = _868 == 0;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _918 = 1.0 / _880;
    float _920 = _144 * _882;
    float _922 = _920;
    bool _924 = _892;
    float _926 = _830;
    if (_892)
    {
        _116 = 1.0;
    }
    float _928 = _116;
    float _930 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[78].w, _916);
    float _932 = _928;
    if (!_892)
    {
        _932 = 1.2345600128173828125;
    }
    float _934 = _932;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _936;
    float _940 = _794 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _942 = 1.0 / _900;
    float _944 = float(uint(_898));
    int _946 = ~_898;
    int _948 = _946 + 1;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _950;
    float _954 = trunc(_920);
    int _956 = int(_954);
    float _958 = _144 * _918;
    int _960 = ~_868;
    int _962 = _960 + 1;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _966 = 1.0 / _944;
    int _968 = as_type<int>(_942) + (-2);
    float _970 = as_type<float>(_948);
    if (_892)
    {
        _922 = 1.0;
    }
    float _972 = _922;
    float _974 = _972;
    if (!_892)
    {
        _974 = 7.345489978790283203125;
    }
    float _976 = _974;
    float _978 = trunc(_958);
    int _980 = int(_978);
    float _982 = float(uint(_956));
    float _984 = as_type<float>(_968) * _982;
    int _986 = as_type<int>(_966) + (-2);
    float _988 = 1.0 / _838;
    float _990 = float(uint(_980));
    float _992 = trunc(_984);
    float _994 = precise::max(_992, 0.0);
    uint _997 = uint(_994);
    float _999 = as_type<float>(_986) * _990;
    float _1001 = _976 * _836;
    float _1003 = trunc(_999);
    float _1005 = precise::max(_1003, 0.0);
    uint _1007 = uint(_1005);
    int _1009 = ~_898;
    int _1011 = _1009 + 1;
    float _1013 = _144 * _988;
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1017 = _1015 != 0;
    int _1019 = _962 * int(_997);
    int _1021 = _1019 + _956;
    float _1023 = float(uint(_1021));
    float _1025 = floor(_1001);
    int _1027 = _1011 * int(_1007);
    int _1029 = _1027 + _980;
    float _1031 = as_type<float>(_968) * _1023;
    float _1033 = float(uint(_1029));
    float _1035 = as_type<float>(_1029);
    float _1037 = _1001;
    if (!_1017)
    {
        _1035 = _842;
    }
    float _1039 = _1035;
    float _1041 = trunc(_1031);
    float _1043 = precise::max(_1041, 0.0);
    uint _1045 = uint(_1043);
    float _1047 = as_type<float>(_986) * _1033;
    float _1049 = 0.0;
    float _1051 = _1039;
    if (!_1017)
    {
        _1049 = _1039;
    }
    float _1053 = _1049;
    float _1055 = _1053;
    if (_1017)
    {
        _1051 = _842;
    }
    float _1057 = _1051;
    float _1059 = float(_868);
    float _1061 = trunc(_1047);
    float _1063 = precise::max(_1061, 0.0);
    uint _1065 = uint(_1063);
    float _1067 = -_1025;
    float _1069 = _1001 + _1067;
    float _1071 = _1057;
    if (_892)
    {
        _1037 = _836;
    }
    float _1073 = _1037;
    float _1075 = _1073;
    if (!_892)
    {
        _1075 = _852;
    }
    float _1077 = _1075;
    float _1079 = _1069 * _1059;
    if (_1017)
    {
        bool _1081 = _836 > 0.5;
        _924 = _1081;
    }
    bool _1083 = _924;
    int _1085 = int(_997) + int(_1045);
    int _1087 = int(_1045);
    if (_1017)
    {
        float _1089 = -_1057;
        float _1091 = _1089 + 1.0;
        _1087 = as_type<int>(_1091);
    }
    int _1093 = _1087;
    float _1095 = float(_956);
    float _1097 = _1077 * _934;
    int _1099 = _908 * _1085;
    int _1101 = _1099 + _956;
    bool _1103 = _1095 >= _1059;
    bool _1105 = isnan(_1095);
    bool _1107 = _1103 || _1105;
    bool _1109 = isnan(_1059);
    bool _1111 = _1107 || _1109;
    float _1113 = float(_1111);
    float _1115 = _1013 * _1059;
    if (_1017)
    {
        float _1117 = _1083 ? as_type<float>(_1093) : _1057;
        _1055 = _1117;
    }
    float _1119 = _1055;
    bool _1121 = uint(_1101) >= uint(_868);
    float _1123 = trunc(_1113);
    int _1125 = int(_1123);
    int _1127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1129 = _1127 != 0;
    bool _1131 = !_1121;
    int _1133 = _1131 ? 0 : (-1);
    int _1135 = int(_1007) + int(_1065);
    bool _1137 = !_1129;
    int _1139 = _1137 ? 0 : 1;
    float _1141 = trunc(_1079);
    int _1143 = int(_1141);
    int _1145 = ~_1085;
    int _1147 = _1145 + _1133;
    int _1149 = _1147 + 1;
    int _1151 = abs(_1139);
    int _1153 = ~_898;
    int _1155 = _1153 + 1;
    int _1157 = _868 * _1149;
    int _1159 = _1157 + _956;
    int _1161 = _1155 * _1135;
    int _1163 = _1161 + _980;
    int _1165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1167 = _1165 != 0;
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1171 = _1169 != 0;
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1175 = _1173 != 0;
    float _1177 = trunc(_1115);
    int _1179 = int(_1177);
    int _1181 = ~_1125;
    int _1183 = _1181 + 1;
    int _1185 = _1183 + 1;
    bool _1187 = !_914;
    int _1189 = _1187 ? _1159 : (-1);
    int _1191 = _1143 * _1151;
    int _1193 = _1191 + _956;
    bool _1195 = uint(_1163) >= uint(_898);
    bool _1197 = !_1171;
    int _1199 = _1197 ? 0 : 1;
    int _1201 = _1189 * _1185;
    bool _1203 = !_1167;
    int _1205 = _1203 ? 0 : 1;
    int _1207 = _868 + (-1);
    int _1209 = abs(_1199);
    int _1211 = abs(_1205);
    float _1213 = floor(_1097);
    int _1215 = _1125 * _1207;
    int _1217 = _1215 + _1201;
    float _1219 = float(_898);
    float _1221 = float(_980);
    int _1223 = _1217 * _1209;
    bool _1225 = !_1175;
    int _1227 = _1225 ? 0 : 1;
    bool _1229 = _1221 >= _1219;
    bool _1231 = isnan(_1221);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan(_1219);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    int _1241 = _1179 * _1211;
    int _1243 = _1241 + _1223;
    int _1245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1247 = _1245 != 0;
    bool _1249 = !_1195;
    int _1251 = _1249 ? 0 : (-1);
    int _1253 = abs(_1227);
    float _1255 = trunc(_1239);
    int _1257 = int(_1255);
    bool _1259 = !_1247;
    int _1261 = _1259 ? 0 : 1;
    float _1263 = -_1213;
    float _1265 = _1097 + _1263;
    int _1267 = ~_1135;
    int _1269 = _1267 + _1251;
    int _1271 = _1269 + 1;
    int _1273 = _1193 * _1253;
    int _1275 = _1273 + _1243;
    int _1277 = abs(_1261);
    int _1279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1281 = _1279 != 0;
    int _1283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1285 = _1283 != 0;
    int _1287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1289 = _1287 != 0;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1293 = _1291 != 0;
    int _1295 = _898 * _1271;
    int _1297 = _1295 + _980;
    float _1299 = _1013 * _1219;
    float _1301 = _1265 * _1219;
    int _1303 = _1143 * _1277;
    int _1305 = _1303 + _1275;
    bool _1307 = !_1285;
    int _1309 = _1307 ? 0 : 1;
    bool _1311 = !_1281;
    int _1313 = _1311 ? 0 : 1;
    float _1315 = trunc(_1299);
    int _1317 = int(_1315);
    bool _1319 = _898 == 0;
    int _1321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1323 = _1321 != 0;
    float _1325 = float(uint(_1305));
    int _1327 = ~_1257;
    int _1329 = _1327 + 1;
    int _1331 = _1329 + 1;
    float _1333 = trunc(_1301);
    int _1335 = int(_1333);
    bool _1337 = !_1319;
    int _1339 = _1337 ? _1297 : (-1);
    float _1341 = as_type<float>(_968) * _1325;
    bool _1343 = !_1323;
    int _1345 = _1343 ? 0 : 1;
    int _1347 = abs(_1309);
    int _1349 = _1339 * _1331;
    int _1351 = abs(_1345);
    float _1353 = trunc(_1341);
    float _1355 = precise::max(_1353, 0.0);
    uint _1357 = uint(_1355);
    int _1359 = _898 + (-1);
    int _1361 = abs(_1313);
    int _1363 = _1257 * _1359;
    int _1365 = _1363 + _1349;
    int _1367 = _1335 * _1351;
    int _1369 = _1367 + _980;
    int _1371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1373 = _1371 != 0;
    bool _1375 = !_1289;
    int _1377 = _1375 ? 0 : 1;
    int _1379 = _1365 * _1347;
    int _1381 = ~_868;
    int _1383 = _1381 + 1;
    float _1385 = in.m_53.w;
    int _1387 = abs(_1377);
    int _1389 = _1317 * _1361;
    int _1391 = _1389 + _1379;
    int _1393 = as_type<int>(_1341);
    int _1395 = _1347;
    if (_1373)
    {
        float _1397 = -_1057;
        float _1399 = _1397 + 1.0;
        _1393 = as_type<int>(_1399);
    }
    int _1401 = _1393;
    bool _1403 = _858 > 0.5;
    int _1405 = _1383 * int(_1357);
    int _1407 = _1405 + _1305;
    float _1409 = 0.0;
    if (!_1373)
    {
        _1409 = _1057;
    }
    float _1411 = _1409;
    int _1413 = _1369 * _1387;
    int _1415 = _1413 + _1391;
    float _1417 = _1411;
    if (_1373)
    {
        float _1419 = _1403 ? as_type<float>(_1401) : _1057;
        _1417 = _1419;
    }
    float _1421 = _1417;
    float _1423 = -_870;
    float _1425 = _1423 + 1.0;
    float _1427 = float(uint(_1407));
    bool _1429 = !_1293;
    int _1431 = _1429 ? 0 : 1;
    bool _1433 = _852 > 0.5;
    float _1435 = as_type<float>(_968) * _1427;
    int _1437 = abs(_1431);
    float _1439 = float(uint(_1193));
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1443 = _1441 != 0;
    float _1445 = trunc(_1435);
    float _1447 = precise::max(_1445, 0.0);
    uint _1449 = uint(_1447);
    int _1451 = _1433 ? as_type<int>(_1425) : as_type<int>(_870);
    float _1453 = as_type<float>(_968) * _1439;
    bool _1455 = _868 == 0;
    float _1457 = _1443 ? as_type<float>(_1451) : _870;
    int _1459 = _1335 * _1437;
    int _1461 = _1459 + _1415;
    bool _1463 = _1385 > 0.5;
    float _1465 = trunc(_1453);
    float _1467 = precise::max(_1465, 0.0);
    uint _1469 = uint(_1467);
    int _1471 = ~_868;
    int _1473 = _1471 + 1;
    int _1475 = _1463 ? as_type<int>(_1425) : as_type<int>(_870);
    float _1477 = float(uint(_1461));
    int _1479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1481 = _1479 != 0;
    int _1483 = int(_1357) + int(_1449);
    float _1485 = as_type<float>(_986) * _1477;
    float _1487 = _1481 ? as_type<float>(_1475) : _870;
    int _1489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1491 = _1489 != 0;
    float _1493 = trunc(_1485);
    float _1495 = precise::max(_1493, 0.0);
    uint _1497 = uint(_1495);
    int _1499 = ~_868;
    int _1501 = _1499 + 1;
    int _1503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1505 = _1503 != 0;
    int _1507 = _1473 * int(_1469);
    int _1509 = _1507 + _1193;
    int _1511 = ~_898;
    int _1513 = _1511 + 1;
    int _1515 = _1501 * _1483;
    int _1517 = _1515 + _1305;
    float _1519 = float(uint(_1509));
    float _1521 = _870;
    int _1523 = _1513;
    float _1525 = _1457;
    if (_1491)
    {
        float _1527 = _1403 ? _1425 : _870;
        _1521 = _1527;
    }
    float _1529 = _1521;
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1531;
    bool _1535 = uint(_1517) >= uint(_868);
    float _1537 = as_type<float>(_968) * _1519;
    float _1539 = 1.0 / _1533;
    int _1541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1543 = _1541 != 0;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1549 = !_1535;
    int _1551 = _1549 ? 0 : (-1);
    int _1553 = _1513 * int(_1497);
    int _1555 = _1553 + _1461;
    int _1557 = ~_898;
    int _1559 = _1557 + 1;
    int _1561 = ~_1483;
    int _1563 = _1561 + _1551;
    int _1565 = _1563 + 1;
    float _1567 = trunc(_1537);
    float _1569 = precise::max(_1567, 0.0);
    uint _1571 = uint(_1569);
    float _1573 = float(uint(_1555));
    if (_1505)
    {
        _1523 = 0;
    }
    int _1575 = _1523;
    int _1577 = _868 * _1565;
    int _1579 = _1577 + _1305;
    int _1581 = 0;
    int _1583 = _1575;
    if (_1505)
    {
        _1581 = 0;
    }
    int _1585 = _1581;
    float _1587 = as_type<float>(_986) * _1573;
    int _1589 = _1585;
    if (_1543)
    {
        float _1591 = -_1057;
        float _1593 = _1591 + 1.0;
        _1395 = as_type<int>(_1593);
    }
    int _1595 = _1395;
    if (!_1505)
    {
        _1583 = 1;
    }
    int _1597 = _1583;
    float _1599 = 1.0 / _1547;
    bool _1601 = !_1455;
    int _1603 = _1601 ? _1579 : (-1);
    float _1605 = _846 * _1539;
    if (_1543)
    {
        float _1607 = _1433 ? as_type<float>(_1595) : _1057;
        _1071 = _1607;
    }
    float _1609 = _1071;
    int _1611 = _1603 & 3;
    bool _1613 = _1611 != 0;
    int _1615 = _1603 & 3;
    bool _1617 = _1615 != 0;
    float _1619 = trunc(_1587);
    float _1621 = precise::max(_1619, 0.0);
    uint _1623 = uint(_1621);
    int _1625 = _1613 ? 0 : 1;
    bool _1627 = uint(_1615) > 1u;
    bool _1629 = uint(_1615) >= 2u;
    int _1631 = int(_1469) + int(_1571);
    float _1633 = _862 * _1599;
    int _1635 = ~_868;
    int _1637 = _1635 + 1;
    float _1639 = in.m_59.w;
    int _1641 = _1629 ? 0 : 1;
    bool _1643 = _1615 != 3;
    int _1645 = _1637 * _1631;
    int _1647 = _1645 + _1193;
    int _1649 = ~_1641;
    int _1651 = _1649 + 1;
    int _1653 = _1651 + 1;
    int _1655 = int(_1497) + int(_1623);
    float _1657 = float(uint(_1369));
    int _1659 = ~_1625;
    int _1661 = _1659 + 1;
    int _1663 = _1661 + 1;
    int _1665 = _1559 * _1655;
    int _1667 = _1665 + _1461;
    int _1669 = _1663;
    int _1671 = _1653;
    if (!_1627)
    {
        int _1673 = ~_1625;
        int _1675 = _1673 + 1;
        _1669 = _1675;
    }
    int _1677 = _1669;
    float _1679 = _432 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1681 = uint(_1647) >= uint(_868);
    float _1683 = as_type<float>(_986) * _1657;
    if (_1643)
    {
        int _1685 = ~_1641;
        int _1687 = _1685 + 1;
        _1671 = _1687;
    }
    int _1689 = _1671;
    float _1691 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1679);
    bool _1693 = uint(_1667) >= uint(_898);
    float _1695 = trunc(_1683);
    float _1697 = precise::max(_1695, 0.0);
    uint _1699 = uint(_1697);
    bool _1701 = !_1681;
    int _1703 = _1701 ? 0 : (-1);
    float _1705 = _432 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1707 = !_1693;
    int _1709 = _1707 ? 0 : (-1);
    float _1711 = _432 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1715 = _1713 != 0;
    float _1717 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1705);
    int _1719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1721 = _1719 != 0;
    float _1723 = fma(_420, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1711);
    int _1725 = ~_898;
    int _1727 = _1725 + 1;
    float _1729 = _836 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1731 = ~_1655;
    int _1733 = _1731 + _1709;
    int _1735 = _1733 + 1;
    float _1737 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1717);
    float _1739 = -_854;
    float _1741 = fma(_1729, 2.0, _1739);
    float _1743 = _852 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1745 = _898 * _1735;
    int _1747 = _1745 + _1461;
    bool _1749 = !_1617;
    int _1751 = _1749 ? 0 : 1;
    int _1753 = _1727 * int(_1699);
    int _1755 = _1753 + _1369;
    float _1757 = fma(_1743, -2.0, _856);
    if (!_1505)
    {
        _1589 = 2;
    }
    int _1759 = _1589;
    float _1761 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1691);
    bool _1763 = !_1319;
    int _1765 = _1763 ? _1747 : (-1);
    float _1767 = fma(_440, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1723);
    float _1769 = float(uint(_1755));
    out.m_61.w = _1639;
    int _1771 = _1765 & 3;
    bool _1773 = _1771 != 0;
    float _1775 = _1761 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1777 = _1765 & 3;
    bool _1779 = _1777 != 0;
    float _1781 = as_type<float>(_986) * _1769;
    int _1783 = _1773 ? 0 : 1;
    float _1785 = _1767 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1787 = uint(_1777) > 1u;
    float _1789 = trunc(_1781);
    float _1791 = precise::max(_1789, 0.0);
    uint _1793 = uint(_1791);
    int _1795 = ~_1783;
    int _1797 = _1795 + 1;
    int _1799 = _1797 + 1;
    float _1801 = -_1775;
    float _1803 = _1801 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1805 = -_1785;
    float _1807 = _1805 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1809 = -_144;
    float _1811 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1741);
    float _1813 = -_872;
    float _1815 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1813);
    float _1817 = in.m_63.x;
    float _1819 = in.m_63.y;
    float _1821 = in.m_63.z;
    float _1823 = -_874;
    float _1825 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1823);
    float _1827 = -_876;
    float _1829 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1827);
    int _1831 = _1799;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    float _1835 = 0.5;
    if (!_1787)
    {
        int _1837 = ~_1783;
        int _1839 = _1837 + 1;
        _1831 = _1839;
    }
    int _1841 = _1831;
    float _1843 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1845 = uint(_1777) >= 2u;
    float _1847 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    int _1849 = int(_1699) + int(_1793);
    float _1851 = _798 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1853 = _1845 ? 0 : 1;
    float _1855 = in.m_65.x;
    float _1857 = in.m_65.y;
    float _1859 = in.m_65.z;
    bool _1861 = _1777 != 3;
    float _1863 = -_1847;
    float _1865 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1863);
    int _1867 = ~_1853;
    int _1869 = _1867 + 1;
    int _1871 = _1869 + 1;
    float _1873 = in.m_67.x;
    float _1875 = in.m_67.y;
    float _1877 = in.m_67.z;
    float _1879 = in.m_67.w;
    float _1881 = fma(_1421, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _1883 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1865);
    int _1885 = ~_1631;
    int _1887 = _1885 + _1703;
    int _1889 = _1887 + 1;
    int _1891 = abs(_1677);
    int _1893 = abs(_1689);
    int _1895 = _868 * _1889;
    int _1897 = _1895 + _1193;
    float _1899 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1819);
    float _1901 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1817);
    int _1903 = _1871;
    if (_1861)
    {
        int _1905 = ~_1853;
        int _1907 = _1905 + 1;
        _1903 = _1907;
    }
    int _1909 = _1903;
    float _1911 = _840 * _1899;
    float _1913 = _1737 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1915 = _1851 * _1901;
    int _1917 = _948 * _1849;
    int _1919 = _1917 + _1369;
    int _1921 = abs(_1909);
    float _1923 = -_1913;
    float _1925 = _1923 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _1927 = uint(_1919) >= uint(_898);
    float _1929 = _1925 * _1925;
    float _1931 = _1855 * _1877;
    float _1933 = _1857 * _1873;
    bool _1935 = !_1927;
    int _1937 = _1935 ? 0 : (-1);
    float _1939 = fma(_1803, _1803, _1929);
    bool _1941 = _1597 != 1;
    float _1943 = _1859 * _1875;
    float _1945 = -_1931;
    float _1947 = fma(_1859, _1873, _1945);
    float _1949 = fma(_1807, _1807, _1939);
    float _1951 = -_1933;
    float _1953 = fma(_1875, _1855, _1951);
    float _1955 = -_1943;
    float _1957 = fma(_1877, _1857, _1955);
    float _1959 = _1947 * _1879;
    float _1961 = rsqrt(_1949);
    float _1963 = _1953 * _1879;
    float _1965 = _1957 * _1879;
    float _1967 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1969 = _1931;
    float _1971 = _1947;
    if (!_1941)
    {
        _1969 = _852;
    }
    float _1973 = _1969;
    float _1975 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1967);
    float _1977 = _1973;
    if (!_1941)
    {
        _1833 = _858;
    }
    float _1979 = _1833;
    float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1983 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1981;
    float _1985 = 0.0;
    float _1987 = _1979;
    if (!_1941)
    {
        _1985 = _1973;
    }
    float _1989 = _1985;
    float _1991 = _1989;
    if (_1941)
    {
        _1977 = _852;
    }
    float _1993 = _1977;
    float _1995 = _1993;
    if (!_1941)
    {
        _970 = _1989;
    }
    float _1997 = _970;
    float _1999 = _1997;
    if (!_1941)
    {
        _1971 = _858;
    }
    float _2001 = _1971;
    float _2003 = _1807 * _1961;
    float _2005 = _2001;
    if (_1941)
    {
        _1999 = _836;
    }
    float _2007 = _1999;
    if (_1941)
    {
        _1991 = _836;
    }
    float _2009 = _1991;
    if (_1941)
    {
        _1987 = _1993;
    }
    float _2011 = _1987;
    if (_1941)
    {
        _2005 = _1993;
    }
    float _2013 = _2005;
    bool _2015 = _1759 != 2;
    float _2017 = _1803 * _1961;
    float _2019 = fma(_938, _1605, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2021 = fma(_952, _1605, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2023 = _2017 * _2017;
    float _2025 = fma(_1983, _1605, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2027 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _2029 = ~_1849;
    int _2031 = _2029 + _1937;
    int _2033 = _2031 + 1;
    float _2035 = fma(_2003, _2003, _2023);
    float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2039 = _2037 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2043 = _2041 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2047 = _2045 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2049 = _1925 * _1961;
    float _2051 = fma(_2039, _1633, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2053 = rsqrt(_2035);
    float _2055 = fma(_2043, _1633, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2057 = _2043;
    if (_2015)
    {
        _2057 = _836;
    }
    float _2059 = _2057;
    float _2061 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2063 = _2059;
    if (!_2015)
    {
        _2063 = _858;
    }
    float _2065 = _2063;
    float _2067 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[88].z, _964);
    float _2069 = fma(_2047, _1633, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2073 = -_2061;
    float _2075 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2073);
    if (!_2015)
    {
        _1995 = _836;
    }
    float _2077 = _1995;
    float _2079 = _1883 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2081 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2071);
    float _2083 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2075);
    float _2085 = -_2027;
    float _2087 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2085);
    bool _2089 = _1819 != 0.0;
    bool _2091 = isnan(_1819);
    bool _2093 = _2089 || _2091;
    bool _2095 = isnan(0.0);
    bool _2097 = _2093 || _2095;
    float _2099 = _2065 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2101 = _2003 * _2053;
    float _2103 = _2017 * _2053;
    float _2105 = -_2079;
    float _2107 = fma(_2083, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2105);
    float _2109 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2111 = -_2101;
    float _2113 = _2003 * _2111;
    float _2115 = _2049 * _2103;
    float _2117 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2087);
    float _2119 = -_2109;
    float _2121 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2119);
    float _2123 = -_2113;
    float _2125 = fma(_2017, _2103, _2123);
    float _2127 = -_2101;
    float _2129 = _2049 * _2127;
    float _2131 = _904 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2133 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2107);
    float _2135 = _2125 * _2125;
    bool _2137 = _1817 == 0.0;
    bool _2139 = !_2097;
    bool _2141 = _2137 && _2139;
    float _2143 = fma(_1457, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2145 = _2077 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2147 = fma(_2115, _2115, _2135);
    float _2149 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _2151 = _1821 == 0.0;
    bool _2153 = _2151 && _2141;
    float _2155 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2157 = fma(_2129, _2129, _2147);
    float _2159 = -_2149;
    float _2161 = fma(_1815, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2159);
    float _2163 = -_2131;
    float _2165 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2163);
    float _2167 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _930);
    float _2169 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1757);
    float _2171 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2161);
    float _2173 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2165);
    float _2175 = rsqrt(_2157);
    float _2177 = -_2155;
    float _2179 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2177);
    bool _2181 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2183 = isnan(_830);
    bool _2185 = _2181 || _2183;
    bool _2187 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2189 = _2185 || _2187;
    float _2191 = float(_2189);
    float _2193 = -_2173;
    float _2195 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2133);
    if (_2153)
    {
        _1525 = _1855;
    }
    float _2197 = _1525;
    float _2199 = -_2169;
    float _2201 = fma(_2167, _2143, _2199);
    float _2203 = _2197;
    if (!_2153)
    {
        float _2205 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1855);
        _2203 = _2205;
    }
    float _2207 = _2203;
    bool _2209 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2211 = isnan(_830);
    bool _2213 = _2209 || _2211;
    bool _2215 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2217 = _2213 || _2215;
    float _2219 = float(_2217);
    float _2221 = -_2191;
    float _2223 = _2221 + 1.0;
    float _2225 = 1.0 / _2195;
    bool _2227 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2229 = isnan(_830);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2235 = _2231 || _2233;
    float _2237 = float(_2235);
    float _2239 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2179);
    if (_2153)
    {
        _926 = _1857;
    }
    float _2241 = _926;
    float _2243 = _2241;
    if (!_2153)
    {
        float _2245 = fma(_1819, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1857);
        _2243 = _2245;
    }
    float _2247 = _2243;
    float _2249 = _2219 * _2223;
    float _2251 = -_2219;
    float _2253 = _2251 + 1.0;
    float _2255 = _2125 * _2175;
    float _2257 = precise::clamp(_2255, 0.0, 1.0);
    if (_2153)
    {
        _802 = _1859;
    }
    float _2259 = _802;
    float _2261 = _940 * _1821;
    float _2263 = _2259;
    if (!_2153)
    {
        float _2265 = fma(_1821, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1859);
        _2263 = _2265;
    }
    float _2267 = _2263;
    float _2269 = -_2257;
    float _2271 = _2269 + 1.0;
    float _2273 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2121);
    float _2275 = _2237 * _2253;
    float _2277 = -_2237;
    float _2279 = _2277 + 1.0;
    float _2281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2283 = fma(_2171, _2225, -1.0);
    float _2285 = _2271 * _2225;
    float _2287 = _2019 * _2275;
    float _2289 = _2021 * _2275;
    float _2291 = fma(_2271, _2283, 1.0);
    float _2293 = _2273 * _2285;
    float _2295 = _2239 * _2285;
    float _2297 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2287);
    float _2299 = _2291 * _2291;
    float _2301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2303 = _2025 * _2275;
    float _2305 = fma(_2051, _2249, _2297);
    float _2307 = fma(_2293, _2293, _2299);
    float _2309 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2289);
    float _2311 = fma(_2279, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2303);
    float _2313 = _2281 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2315 = fma(_2295, _2295, _2307);
    float _2317 = fma(_2055, _2249, _2309);
    float _2319 = fma(_2069, _2249, _2311);
    float _2321 = rsqrt(_2315);
    float _2323 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2081);
    float _2325 = fma(_2191, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2317);
    float _2327 = fma(_2313, _1529, -0.5);
    float _2329 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2067);
    float _2331 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2333 = fma(_2323, _1843, _1811);
    int _2335 = _898 * _2033;
    int _2337 = _2335 + _1369;
    bool _2339 = !_1779;
    int _2341 = _2339 ? 0 : 1;
    float _2343 = fma(_2331, _1609, -0.5);
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2347 = fma(_2191, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2305);
    float _2349 = fma(_2191, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2319);
    float _2351 = -_2345;
    float _2353 = fma(_2099, 2.0, _2351);
    float _2355 = _2347 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2357 = _2295 * _2321;
    float _2359 = _2291 * _2321;
    float _2361 = _2293 * _2321;
    float _2363 = -_2357;
    float _2365 = _2017 * _2363;
    float _2367 = _2003 * _2359;
    float _2369 = -_2361;
    float _2371 = _2049 * _2369;
    float _2373 = -_144;
    float _2375 = fma(_2373, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2353);
    float _2377 = -_2361;
    float _2379 = -_2365;
    float _2381 = fma(_2003, _2377, _2379);
    float _2383 = -_2357;
    float _2385 = -_2367;
    float _2387 = fma(_2049, _2383, _2385);
    float _2389 = -_2371;
    float _2391 = fma(_2017, _2359, _2389);
    float _2393 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2395 = _2381 * _2381;
    float _2397 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2399 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2401 = fma(_2329, _2343, _2375);
    float _2403 = fma(_2387, _2387, _2395);
    int _2405 = _1603 >> 31;
    float _2407 = fma(_2009, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2393);
    float _2409 = fma(_2391, _2391, _2403);
    float _2411 = fma(_2013, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2397);
    float _2413 = _2325 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2415 = _2349 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2417 = rsqrt(_2409);
    int _2419 = _2405 & 3;
    float _2421 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2423 = _2355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2425 = _2413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2427 = _2415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2429 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2431 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2433 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    out.m_69.x = _2423;
    out.m_69.y = _2425;
    out.m_69.z = _2427;
    out.m_69.w = _2421;
    int _2435 = _1603 + _2419;
    float _2437 = -_2429;
    float _2439 = fma(_2431, 2.0, _2437);
    float _2441 = fma(_2399, -2.0, _2433);
    float _2443 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2445 = abs(_2341);
    float _2447 = _2387 * _2417;
    float _2449 = _2391 * _2417;
    float _2451 = _2381 * _2417;
    float _2453 = -_144;
    float _2455 = fma(_2453, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2439);
    float _2457 = _2003 * _2447;
    float _2459 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2441);
    float _2461 = fma(_2145, -2.0, _2443);
    int _2463 = ~_2445;
    int _2465 = _2463 + 1;
    int _2467 = _2465 + 1;
    float _2469 = -_2457;
    float _2471 = fma(_2017, _2449, _2469);
    int _2473 = _1765 >> 31;
    float _2475 = _2049 * _2449;
    int _2477 = _2435 >> 2;
    float _2479 = _2017 * _2451;
    int _2481 = _2473 & 3;
    float _2483 = -_2475;
    float _2485 = fma(_2003, _2451, _2483);
    int _2487 = _2477 << 4;
    int _2489 = _2487 + 368;
    float _2491 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2407);
    int _2493 = _1765 + _2481;
    float _2495 = _2471 * _2471;
    uint _2497 = uint(int(uint(_2489) >> uint(2)));
    uint _2499 = uint(int(uint(int(_2497)) >> uint(2)));
    int _2501 = int(_2497) & 3;
    float _2503 = (*spvDescriptorSet0.vp_c9)._m0[int(_2499)][_2501];
    int _2505 = int(_2497) + 1;
    uint _2507 = uint(int(uint(_2505) >> uint(2)));
    int _2509 = _2505 & 3;
    float _2511 = (*spvDescriptorSet0.vp_c9)._m0[int(_2507)][_2509];
    float _2513 = -_2479;
    float _2515 = fma(_2049, _2447, _2513);
    int _2517 = _2493 >> 2;
    float _2519 = fma(_2485, _2485, _2495);
    float _2521 = fma(_1487, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _2523 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2411);
    int _2525 = _2517 << 4;
    int _2527 = _2525 + 512;
    float _2529 = fma(_2515, _2515, _2519);
    float _2531 = fma(_2491, _1881, _2455);
    float _2533 = -_2459;
    float _2535 = fma(_2523, _2521, _2533);
    uint _2537 = uint(int(uint(_2527) >> uint(2)));
    uint _2539 = uint(int(uint(int(_2537)) >> uint(2)));
    int _2541 = int(_2537) & 3;
    float _2543 = (*spvDescriptorSet0.vp_c9)._m0[int(_2539)][_2541];
    int _2545 = int(_2537) + 1;
    uint _2547 = uint(int(uint(_2545) >> uint(2)));
    int _2549 = _2545 & 3;
    float _2551 = (*spvDescriptorSet0.vp_c9)._m0[int(_2547)][_2549];
    float _2553 = rsqrt(_2529);
    float _2555 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1975);
    float _2557 = _2201 + 0.5;
    float _2559 = _2333 + 0.5;
    float _2561 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2461);
    float _2563 = _2531 + 0.5;
    float _2565 = _2535 + 0.5;
    int _2567 = _2489 + 8;
    uint _2569 = uint(int(uint(_2567) >> uint(2)));
    uint _2571 = uint(int(uint(int(_2569)) >> uint(2)));
    int _2573 = int(_2569) & 3;
    float _2575 = (*spvDescriptorSet0.vp_c9)._m0[int(_2571)][_2573];
    int _2577 = int(_2569) + 1;
    uint _2579 = uint(int(uint(_2577) >> uint(2)));
    int _2581 = _2577 & 3;
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[int(_2579)][_2581];
    float _2585 = -_2561;
    float _2587 = fma(_2555, _2327, _2585);
    bool _2589 = _1615 != 3;
    out.m_71.x = _2559;
    out.m_71.y = _2557;
    out.m_71.z = _2563;
    out.m_71.w = _2565;
    int _2591 = _2527 + 8;
    uint _2593 = uint(int(uint(_2591) >> uint(2)));
    uint _2595 = uint(int(uint(int(_2593)) >> uint(2)));
    int _2597 = int(_2593) & 3;
    float _2599 = (*spvDescriptorSet0.vp_c9)._m0[int(_2595)][_2597];
    int _2601 = int(_2593) + 1;
    uint _2603 = uint(int(uint(_2601) >> uint(2)));
    int _2605 = _2601 & 3;
    float _2607 = (*spvDescriptorSet0.vp_c9)._m0[int(_2603)][_2605];
    float _2609 = _2515 * _2553;
    float _2611 = _2485 * _2553;
    float _2613 = _2471 * _2553;
    float _2615 = _2017 * _2609;
    float _2617 = _1911 * _2609;
    float _2619 = _1959 * _2609;
    float _2621 = _1959 * _2611;
    float _2623 = _2003 * _2613;
    float _2625 = -_2615;
    float _2627 = fma(_2003, _2611, _2625);
    float _2629 = _2049 * _2611;
    float _2631 = -_2623;
    float _2633 = fma(_2049, _2609, _2631);
    float _2635 = _2627 * _2627;
    int _2637 = ~_1891;
    int _2639 = _2637 + 1;
    int _2641 = _2639 + 1;
    float _2643 = -_2629;
    float _2645 = fma(_2017, _2613, _2643);
    int _2647 = abs(_1841);
    float _2649 = fma(_2633, _2633, _2635);
    bool _2651 = !_2589;
    int _2653 = _2651 ? 0 : (-1);
    float _2655 = _2611 * _1875;
    int _2657 = _2641 * as_type<int>(_2511);
    float _2659 = fma(_2645, _2645, _2649);
    int _2661 = abs(_1751);
    float _2663 = _2613 * _2247;
    int _2665 = ~_2647;
    int _2667 = _2665 + 1;
    int _2669 = _2667 + 1;
    int _2671 = ~_2661;
    int _2673 = _2671 + 1;
    int _2675 = _2673 + 1;
    float _2677 = rsqrt(_2659);
    bool _2679 = _1777 != 3;
    int _2681 = _2669 * as_type<int>(_2551);
    int _2683 = ~_1893;
    int _2685 = _2683 + 1;
    int _2687 = _2685 + 1;
    int _2689 = _2675 * as_type<int>(_2503);
    int _2691 = _2689 + _2657;
    int _2693 = _2467 * as_type<int>(_2543);
    int _2695 = _2693 + _2681;
    float _2697 = _1911 * _2611;
    float _2699 = _2611 * _2247;
    int _2701 = ~_1921;
    int _2703 = _2701 + 1;
    int _2705 = _2703 + 1;
    int _2707 = _2687 * as_type<int>(_2575);
    int _2709 = _2707 + _2691;
    bool _2711 = !_2679;
    int _2713 = _2711 ? 0 : (-1);
    float _2715 = _2645 * _2677;
    float _2717 = _2633 * _2677;
    float _2719 = _2613 * _1875;
    int _2721 = _2705 * as_type<int>(_2599);
    int _2723 = _2721 + _2695;
    float _2725 = fma(_1915, _2715, _2617);
    float _2727 = fma(_1915, _2717, _2697);
    float _2729 = _2609 * _1875;
    int _2731 = abs(_2653);
    float _2733 = fma(_2261, _2003, _2725);
    float _2735 = fma(_2261, _2017, _2727);
    int _2737 = abs(_2713);
    float _2739 = _1959 * _2613;
    float _2741 = _1785 + _2733;
    float _2743 = _1775 + _2735;
    float _2745 = _2627 * _2677;
    float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2749 = _2741 + _2747;
    float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2753 = _2743 + _2751;
    float _2755 = _1911 * _2613;
    float _2757 = _2749 * _2749;
    float _2759 = fma(_2717, _1873, _2655);
    float _2761 = fma(_2745, _1873, _2719);
    float _2763 = fma(_2715, _1873, _2729);
    float _2765 = fma(_2753, _2753, _2757);
    float _2767 = fma(_1915, _2745, _2755);
    bool _2769 = !_1715;
    int _2771 = _2769 ? 0 : 1;
    float _2773 = _2609 * _2247;
    float _2775 = sqrt(_2765);
    int _2777 = ~_2731;
    int _2779 = _2777 + 1;
    int _2781 = _2779 + 1;
    float _2783 = fma(_2261, _2049, _2767);
    int _2785 = ~_2737;
    int _2787 = _2785 + 1;
    int _2789 = _2787 + 1;
    float _2791 = fma(_2745, _2207, _2663);
    bool _2793 = !_1721;
    int _2795 = _2793 ? 0 : 1;
    int _2797 = _2781 * as_type<int>(_2583);
    int _2799 = _2797 + _2709;
    int _2801 = abs(_2771);
    float _2803 = fma(_1965, _2745, _2739);
    float _2805 = _1913 + _2783;
    int _2807 = abs(_2795);
    int _2809 = _2789 * as_type<int>(_2607);
    int _2811 = _2809 + _2723;
    float _2813 = fma(_1965, _2715, _2619);
    float _2815 = fma(_2715, _2207, _2773);
    float _2817 = fma(_1965, _2717, _2621);
    bool _2819 = _2775 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2821 = fma(_2717, _2207, _2699);
    int _2823 = ~_2801;
    int _2825 = _2823 + 1;
    int _2827 = _2825 + 1;
    int _2829 = ~_2807;
    int _2831 = _2829 + 1;
    int _2833 = _2831 + 1;
    float _2835 = _2715;
    float _2837 = _2613;
    float _2839 = _2741;
    if (!_2819)
    {
        _2835 = _2741;
    }
    float _2841 = _2835;
    float _2843 = _2841;
    if (!_2819)
    {
        _2837 = _2743;
    }
    float _2845 = _2837;
    float _2847 = _2845;
    if (!_2819)
    {
        _2839 = _2805;
    }
    float _2849 = _2839;
    bool _2851 = !_2819;
    float _2853 = _2849;
    if (!_2851)
    {
        float _2855 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2857 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2859 = _2775 + _2857;
        float _2861 = _2805 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2863 = rsqrt(_2765);
        float _2865 = _2859 * _2855;
        float _2867 = _2865 * 0.15915493667125701904296875;
        float _2869 = _2867 * 6.283185482025146484375;
        float _2871 = cos(_2869);
        float _2873 = _2867 * 6.283185482025146484375;
        float _2875 = sin(_2873);
        float _2877 = _2871 + (-1.0);
        float _2879 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2881 = fma(_2875, _2861, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2883 = fma(_2805, _2871, _2879);
        float _2885 = _2863 * _2881;
        float _2887 = fma(_2753, _2885, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2889 = fma(_2749, _2885, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2853 = _2883;
        _2847 = _2887;
        _2843 = _2889;
    }
    float _2891 = _2853;
    float _2893 = _2847;
    float _2895 = _2843;
    float _2897 = -_1913;
    float _2899 = _2897 + _2891;
    int _2901 = _2799 * _2827;
    float _2903 = -_1775;
    float _2905 = _2903 + _2893;
    int _2907 = _2811 * _2833;
    float _2909 = _2899 * _2899;
    bool _2911 = !_1455;
    int _2913 = _2911 ? _1897 : (-1);
    float _2915 = fma(_2049, _1877, _2761);
    bool _2917 = !_1319;
    int _2919 = _2917 ? _2337 : (-1);
    float _2921 = -_1785;
    float _2923 = _2921 + _2895;
    float _2925 = fma(_2905, _2905, _2909);
    int _2927 = _2913 * _2801;
    int _2929 = _2927 + _2901;
    float _2931 = fma(_1963, _2049, _2803);
    int _2933 = _2919 * _2807;
    int _2935 = _2933 + _2907;
    float _2937 = fma(_2923, _2923, _2925);
    float _2939 = fma(_2017, _1877, _2759);
    float _2941 = fma(_1963, _2017, _2817);
    float _2943 = fma(_1963, _2003, _2813);
    float _2945 = sqrt(_2937);
    float _2947 = fma(_2017, _2267, _2821);
    float _2949 = float(_2929);
    float _2951 = fma(_2003, _1877, _2763);
    float _2953 = _2401 + 0.5;
    float _2955 = _2587 + 0.5;
    float _2957 = fma(_2049, _2267, _2791);
    float _2959 = float(_2935);
    float _2961 = fma(_2003, _2267, _2815);
    out.m_73.x = _2939;
    out.m_73.y = _2915;
    out.m_73.z = _2951;
    out.m_75.x = _2953;
    out.m_75.y = _2955;
    bool _2963 = _2945 > 0.0;
    out.m_77.x = _2941;
    out.m_77.y = _2931;
    out.m_77.z = _2943;
    out.m_79.x = _2949;
    out.m_79.y = _2959;
    out.m_81.x = _2947;
    out.m_81.y = _2957;
    out.m_81.z = _2961;
    bool _2965 = !_2963;
    float _2967 = _2915;
    float _2969 = _2951;
    float _2971 = _2939;
    float _2973 = _2893;
    float _2975 = _2891;
    float _2977 = _2895;
    float _2979 = _2915;
    float _2981 = _2939;
    float _2983 = _2951;
    float _2985 = _2941;
    float _2987 = _2943;
    if (!_2965)
    {
        bool _2989 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2991 = _2049;
        if (_2989)
        {
            float _2993 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2991 = _2993;
        }
        float _2995 = _2991;
        if (_2989)
        {
            float _2997 = _442 * _2995;
            _2967 = _2997;
        }
        float _2999 = _2967;
        float _3001 = _2999;
        if (_2989)
        {
            float _3003 = _444 * _2995;
            _2969 = _3003;
        }
        float _3005 = _2969;
        float _3007 = _3005;
        if (_2989)
        {
            float _3009 = _446 * _2995;
            _2971 = _3009;
        }
        float _3011 = _2971;
        float _3013 = _3011;
        float _3015 = _3011;
        if (!_2989)
        {
            bool _3017 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _3019 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _3021 = _3017 || _3019;
            bool _3023 = isnan(1.0);
            bool _3025 = _3021 || _3023;
            float _3027 = _144 + 1.0;
            float _3029 = _3027;
            if (!_3025)
            {
                float _3031 = _3027 * _3027;
                float _3033 = _3031 * 0.5;
                _3013 = _3033;
            }
            float _3035 = _3013;
            float _3037 = _3035;
            if (!_3025)
            {
                float _3039 = _3035 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3037 = _3039;
            }
            float _3041 = _3037;
            bool _3043 = !_3025;
            float _3045 = _3041;
            if (!_3043)
            {
                float _3047 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3049 = log2(_3047);
                float _3051 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3053 = _3051 + 1.0;
                float _3055 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3057 = _3049 * _3027;
                float _3059 = 1.0 / _3053;
                float _3061 = _3055 * 0.693147182464599609375;
                float _3063 = exp2(_3057);
                float _3065 = 1.0 / _3061;
                float _3067 = _3063 + (-1.0);
                float _3069 = -_3067;
                float _3071 = fma(_3069, _3065, _3027);
                float _3073 = _3071 * _3059;
                float _3075 = _3073 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3045 = _3075;
            }
            float _3077 = _3045;
            float _3079 = _3077 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3081 = _3077 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3083 = !_3025;
            if (!_3083)
            {
                float _3085 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3087 = log2(_3085);
                float _3089 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3091 = _3089 + 1.0;
                float _3093 = 1.0 / _3091;
                float _3095 = _3087 * _3027;
                float _3097 = exp2(_3095);
                float _3099 = -_3097;
                float _3101 = _3099 + 1.0;
                float _3103 = _3101 * _3093;
                _3029 = _3103;
            }
            float _3105 = _3029;
            float _3107 = fma(_3105, _180, _3081);
            float _3109 = fma(_3105, _178, _3079);
            float _3111 = _3077 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3113 = -_404;
            float _3115 = _3113 + _3107;
            float _3117 = -_406;
            float _3119 = _3117 + _3109;
            float _3121 = fma(_3105, _182, _3111);
            float _3123 = _3115 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3125 = _3115 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3127 = _3115 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3129 = -_408;
            float _3131 = _3129 + _3121;
            float _3133 = fma(_3119, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3123);
            float _3135 = fma(_3119, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3125);
            float _3137 = fma(_3119, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3127);
            float _3139 = fma(_3131, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3133);
            float _3141 = fma(_3131, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3135);
            float _3143 = fma(_3131, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3137);
            _450 = _3141;
            _452 = _3139;
            _454 = _3143;
            _3001 = _3139;
            _3007 = _3141;
            _3015 = _3143;
        }
        float _3145 = _450;
        float _3147 = _452;
        float _3149 = _454;
        float _3151 = _3001;
        float _3153 = _3007;
        float _3155 = _3015;
        float _3157 = _3145 * _3145;
        float _3159 = rsqrt(_2937);
        float _3161 = fma(_3147, _3147, _3157);
        float _3163 = fma(_3149, _3149, _3161);
        float _3165 = sqrt(_3163);
        float _3167 = _2905 * _3159;
        float _3169 = _2899 * _3159;
        float _3171 = _2923 * _3159;
        bool _3173 = _3165 > 0.0;
        bool _3175 = !_3173;
        _2979 = _3151;
        _2981 = _3155;
        _2983 = _3153;
        _2985 = _3167;
        _456 = _3147;
        if (!_3175)
        {
            float _3177 = rsqrt(_3163);
            float _3179 = _3177 * _3145;
            float _3181 = _3177 * _3147;
            float _3183 = _3177 * _3149;
            float _3185 = _3169 * _3179;
            float _3187 = fma(_3167, _3181, _3185);
            float _3189 = fma(_3171, _3183, _3187);
            float _3191 = _3189 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3193 = fma(_3151, _3191, _2893);
            float _3195 = fma(_3153, _3191, _2891);
            float _3197 = fma(_3155, _3191, _2895);
            _2973 = _3193;
            _2975 = _3195;
            _2977 = _3197;
        }
    }
    float _3199 = _2973;
    float _3201 = _2975;
    float _3203 = _2977;
    float _3205 = _2979;
    float _3207 = _2981;
    float _3209 = _2983;
    float _3211 = _2985;
    float _3213 = _456;
    bool _3215 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3217 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3219 = _3215 || _3217;
    bool _3221 = isnan(0.5);
    bool _3223 = _3219 || _3221;
    float _3225 = _3207;
    float _3227 = _3205;
    float _3229 = _3209;
    float _3231 = _3213;
    if (_3223)
    {
        _3225 = _3199;
    }
    float _3233 = _3225;
    float _3235 = _3233;
    if (_3223)
    {
        _3227 = _3201;
    }
    float _3237 = _3227;
    float _3239 = _3237;
    if (_3223)
    {
        _3229 = _3203;
    }
    float _3241 = _3229;
    float _3243 = _3241;
    if (!_3223)
    {
        float _3245 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3247 = _1913 + _3245;
        float _3249 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3251 = _1775 + _3249;
        float _3253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3255 = -_1775;
        float _3257 = _3255 + _3199;
        float _3259 = _3247 * _3247;
        float _3261 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3263 = _1785 + _3261;
        float _3265 = -_1913;
        float _3267 = _3265 + _3201;
        float _3269 = -_1785;
        float _3271 = _3269 + _3203;
        float _3273 = fma(_3251, _3251, _3259);
        float _3275 = fma(_3263, _3263, _3273);
        float _3277 = sqrt(_3275);
        float _3279 = precise::min(_3277, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3281 = _3279 * _3253;
        float _3283 = fma(_3257, _3281, _1775);
        float _3285 = fma(_3267, _3281, _1913);
        float _3287 = fma(_3271, _3281, _1785);
        _3239 = _3285;
        _3235 = _3283;
        _3243 = _3287;
    }
    float _3289 = _3239;
    float _3291 = _3235;
    float _3293 = _3243;
    float _3295 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3297 = _3289 + _3295;
    float _3299 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3301 = _3291 + _3299;
    float _3303 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3305 = _3293 + _3303;
    float _3307 = _3297 * _3297;
    float _3309 = fma(_3301, _3301, _3307);
    float _3311 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3313 = fma(_3305, _3305, _3309);
    float _3315 = rsqrt(_3313);
    float _3317 = sqrt(_3313);
    float _3319 = _3315 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3321 = _3301 * _3319;
    float _3323 = _3305 * _3319;
    float _3325 = _3321 * _3321;
    float _3327 = _3323 * _3323;
    float _3329 = _3325 + _3327;
    float _3331 = sqrt(_3329);
    bool _3333 = _3331 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3335 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3337 = _3331 + _3335;
    float _3339 = _2931;
    float _3341 = _3337;
    float _3343 = _3297;
    float _3345 = _3321;
    if (_3333)
    {
        float _3347 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3339 = _3347;
    }
    float _3349 = _3339;
    float _3351 = _3349;
    if (_3333)
    {
        float _3353 = _3337 * _3349;
        _3341 = _3353;
    }
    float _3355 = _3341;
    if (_3333)
    {
        float _3357 = rsqrt(_3329);
        _3351 = _3357;
    }
    float _3359 = _3351;
    float _3361 = _3359;
    if (_3333)
    {
        float _3363 = _3355 * 0.15915493667125701904296875;
        _2987 = _3363;
    }
    float _3365 = _2987;
    float _3367 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3369 = _3305;
    if (_3333)
    {
        float _3371 = _3365 * 6.283185482025146484375;
        float _3373 = sin(_3371);
        _3369 = _3373;
    }
    float _3375 = _3369;
    float _3377 = _3289 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3379 = precise::max(0.0, _3367);
    float _3381 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3377);
    float _3383 = _3211;
    float _3385 = _3379;
    if (_3333)
    {
        float _3387 = _3365 * 6.283185482025146484375;
        float _3389 = cos(_3387);
        _3383 = _3389;
    }
    float _3391 = _3383;
    float _3393 = -_3319;
    float _3395 = -_3379;
    float _3397 = fma(_3297, _3393, _3395);
    float _3399 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3381);
    if (_3333)
    {
        float _3401 = _3397 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3343 = _3401;
    }
    float _3403 = _3343;
    float _3405 = _3375;
    float _3407 = _3403;
    if (_3333)
    {
        float _3409 = fma(_3375, _3403, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3405 = _3409;
    }
    float _3411 = _3405;
    float _3413 = _3411;
    if (!_3333)
    {
        _3407 = _3397;
    }
    float _3415 = _3407;
    float _3417 = _3415;
    if (_3333)
    {
        float _3419 = _3359 * _3411;
        _3231 = _3419;
    }
    float _3421 = _3231;
    if (!_3333)
    {
        _3413 = _3325;
    }
    float _3423 = _3413;
    float _3425 = _3423;
    float _3427 = _3391;
    if (_3333)
    {
        float _3429 = _3391 + (-1.0);
        _3385 = _3429;
    }
    float _3431 = _3385;
    float _3433 = _3431;
    if (_3333)
    {
        float _3435 = _3321 * _3421;
        _3345 = _3435;
    }
    float _3437 = _3345;
    if (_3333)
    {
        float _3439 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3361 = _3439;
    }
    float _3441 = _3361;
    if (!_3333)
    {
        _3433 = _3323;
    }
    float _3443 = _3433;
    float _3445 = _3443;
    if (_3333)
    {
        float _3447 = _3323 * _3421;
        _3445 = _3447;
    }
    float _3449 = _3445;
    if (_3333)
    {
        float _3451 = _3437 * _3437;
        _3425 = _3451;
    }
    float _3453 = _3425;
    if (_3333)
    {
        float _3455 = fma(_3397, _3391, _3441);
        _3417 = _3455;
    }
    float _3457 = _3417;
    if (!_3333)
    {
        _3427 = _3327;
    }
    float _3459 = _3427;
    float _3461 = _3459;
    if (_3333)
    {
        float _3463 = _3449 * _3449;
        _3461 = _3463;
    }
    float _3465 = _3461;
    float _3467 = _3289 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3469 = fma(_3457, _3457, _3453);
    float _3471 = _3399 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3473 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3467);
    float _3475 = _3469 + _3465;
    float _3477 = _3289 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3481 = fma(_3317, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3479);
    float _3483 = precise::clamp(_3481, 0.0, 1.0);
    float _3485 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3473);
    float _3487 = rsqrt(_3475);
    float _3489 = _3289 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3491 = -_3483;
    float _3493 = _3491 + 1.0;
    float _3495 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3477);
    float _3497 = _3485 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3499 = fma(_3291, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3489);
    float _3501 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3495);
    float _3503 = abs(_3493);
    float _3505 = log2(_3503);
    float _3507 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3499);
    float _3509 = _3497 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3511 = _3501 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3513 = _3507 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3515 = -_3509;
    float _3517 = fma(_3515, _3311, 1.0);
    float _3519 = _3511 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3521 = _3487 * _3437;
    float _3523 = _3487 * _3457;
    float _3525 = _3487 * _3449;
    float _3527 = fma(_3513, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3519);
    float _3529 = _3521 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3531 = log2(_3517);
    float _3533 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3527);
    float _3535 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3537 = -_3529;
    float _3539 = fma(_3523, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3537);
    float _3541 = _3511 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3543 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3533);
    float _3545 = exp2(_3535);
    float _3547 = -_3525;
    float _3549 = fma(_3547, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3539);
    float _3551 = _3511 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3553 = fma(_3513, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3541);
    float _3555 = fma(_3549, -0.5, 0.5);
    float _3557 = fma(_3513, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3551);
    float _3559 = fma(_3549, 0.5, 0.5);
    float _3561 = 1.0 / _3543;
    float _3563 = _3523 + 1.0;
    float _3565 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3557);
    float _3567 = fma(_3559, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3569 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3553);
    float _3571 = fma(_3559, _3567, -0.212114393711090087890625);
    float _3573 = sqrt(_3555);
    float _3575 = -_3523;
    float _3577 = fma(_3545, _3563, _3575);
    float _3579 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3565);
    float _3581 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3569);
    float _3583 = _3531 * 0.693147182464599609375;
    float _3585 = fma(_3559, _3571, 1.570728778839111328125);
    float _3587 = _3579 * _3561;
    float _3589 = _3581 * _3561;
    float _3591 = _3583 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3593 = fma(_3587, 0.5, 0.5);
    float _3595 = fma(_3589, -0.5, 0.5);
    float _3597 = _3573 * 0.636619746685028076171875;
    float _3599 = fma(_3577, 0.5, 0.5);
    float3 _9483 = float3(_3593, _3595, _3591);
    float _3601 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9483, float3(0.0), isnan(_9483)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9483, float3(0.0), isnan(_9483)), level(0.0)).x;
    float _3603 = -_3585;
    float _3605 = fma(_3597, _3603, 1.0);
    float3 _9499 = float3(_3593, _3595, _3591);
    float4 _3608 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9499, float3(0.0), isnan(_9499)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9499, float3(0.0), isnan(_9499)), level(0.0)).xyzw;
    float _3610 = _3608.x;
    float _3612 = _3608.y;
    float _3614 = _3608.z;
    float _3616 = _3608.w;
    float2 _9516 = float2(_3605, _3599);
    float3 _3620 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9516, float2(0.0), isnan(_9516)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9516, float2(0.0), isnan(_9516)), level(0.0)).xyz;
    float _3622 = _3620.x;
    float _3624 = _3620.y;
    float _3626 = _3620.z;
    float _3628 = _1913 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3630 = _1913 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3632 = _3511 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3634 = _3317 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3636 = isnan(_3317);
    bool _3638 = _3634 || _3636;
    bool _3640 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3642 = _3638 || _3640;
    float _3644 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3628);
    float _3646 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3630);
    float _3648 = fma(_3513, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3632);
    float _3650 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3644);
    float _3652 = fma(_1785, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3646);
    float _3654 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3648);
    float _3656 = _3650 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3658 = _3652 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3660 = fma(_3471, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3654);
    float _3662 = 1.0 / _3656;
    bool _3664 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3666 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3668 = _3664 || _3666;
    bool _3670 = isnan(0.5);
    bool _3672 = _3668 || _3670;
    float _3674 = _3658 + _3656;
    float _3676 = _3505 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3678 = _3579 + _3543;
    out.gl_Position.x = _3579;
    out.gl_Position.y = _3581;
    out.gl_Position.z = _3660;
    out.gl_Position.w = _3543;
    float _3680 = exp2(_3676);
    float _3682 = _3678 * 0.5;
    float _3684 = _3660 + _3543;
    float _3686 = _3513;
    float _3688 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _3690 = _3660;
    float _3692 = _3581;
    float _3694 = _3579;
    float _3696 = _3654;
    float _3698 = _3678;
    float _3700 = _3543;
    if (!_3672)
    {
        _1835 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3702 = _1835;
    float _3704 = _3684 * 0.5;
    float _3706 = _3674 * _3662;
    float _3708 = _3706 * 0.5;
    float _3710 = _3543 * 0.5;
    float _3712 = _3710;
    if (_3672)
    {
        _3686 = 1.0;
    }
    float _3714 = _3686;
    float _3716 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3718 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3716);
    float _3720 = _3714;
    if (!_3672)
    {
        float _3722 = -_3702;
        float _3724 = _3722 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3688 = _3724;
    }
    float _3726 = _3688;
    float _3728 = fma(_3581, -0.5, _3710);
    if (!_3672)
    {
        _3712 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _3730 = _3712;
    float _3732 = -_3680;
    float _3734 = _3732 + 1.0;
    if (!_3642)
    {
        _3690 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3736 = _3690;
    float _3738 = 1.0 / _3718;
    float _3740 = _3736;
    float _3742 = _3736;
    if (!_3642)
    {
        _3692 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3744 = _3692;
    float _3746 = _3734 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3748 = _3744;
    float _3750 = _3744;
    if (!_3642)
    {
        _3694 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3752 = _3694;
    float _3754 = _3726;
    float _3756 = _3752;
    float _3758 = _3752;
    if (!_3672)
    {
        float _3760 = 1.0 / _3726;
        _3754 = _3760;
    }
    float _3762 = _3754;
    if (!_3672)
    {
        float _3764 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3766 = -_3702;
        float _3768 = fma(_3738, _3764, _3766);
        _3696 = _3768;
    }
    float _3770 = _3696;
    float _3772 = _3770;
    if (!_3672)
    {
        float _3774 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3776 = -_3730;
        float _3778 = fma(_3738, _3774, _3776);
        _3698 = _3778;
    }
    float _3780 = _3698;
    float _3782 = _3780;
    if (_3672)
    {
        _3700 = 1.0;
    }
    float _3784 = _3700;
    out.m_83.x = _3682;
    out.m_83.y = _3728;
    out.m_83.z = _3704;
    out.m_83.w = _3543;
    float _3786 = _3784;
    if (!_3672)
    {
        float _3788 = _3770 * _3762;
        float _3790 = precise::clamp(_3788, 0.0, 1.0);
        _3720 = _3790;
    }
    float _3792 = _3720;
    if (!_3672)
    {
        float _3794 = -_3730;
        float _3796 = _3794 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _3772 = _3796;
    }
    float _3798 = _3772;
    float _3800 = _3730;
    if (!_3672)
    {
        float _3802 = 1.0 / _3798;
        _3800 = _3802;
    }
    float _3804 = _3800;
    if (!_3672)
    {
        float _3806 = _3780 * _3804;
        float _3808 = precise::clamp(_3806, 0.0, 1.0);
        _3782 = _3808;
    }
    float _3810 = _3782;
    if (!_3672)
    {
        float _3812 = -_3810;
        float _3814 = _3812 + 1.0;
        _3786 = _3814;
    }
    float _3816 = _3786;
    float _3818 = _3746 * _3601;
    float _3820 = -_3746;
    float _3822 = _3820 + 1.0;
    float _3824 = _3616 * _3818;
    float _3826 = _3616 * _3822;
    float _3828 = _3626 * _3818;
    float _3830 = fma(_3622, _3824, _3610);
    float _3832 = fma(_3624, _3824, _3612);
    float _3834 = fma(_3616, _3828, _3614);
    float _3836 = _3792 * _3816;
    out.m_85.x = _3830;
    out.m_85.y = _3832;
    out.m_85.z = _3834;
    out.m_85.w = _3826;
    float _3838 = _3836 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3840 = !_3642;
    if (!_3840)
    {
        bool _3842 = _3317 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3844 = isnan(_3317);
        bool _3846 = _3842 || _3844;
        bool _3848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3850 = _3846 || _3848;
        if (!_3850)
        {
            float _3852 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3854 = _3317 + _3852;
            float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3858 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3856;
            float _3860 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3862 = _3860 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3864 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3866 = _3864 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3868 = 1.0 / _3858;
            float _3870 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3872 = _3870 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3874 = _3854 * _3868;
            float _3876 = precise::clamp(_3874, 0.0, 1.0);
            float _3878 = fma(_3876, _3862, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3880 = fma(_3876, _3866, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3882 = fma(_3876, _3872, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _3750 = _3880;
            _3742 = _3878;
            _3758 = _3882;
            _3884 = true;
        }
        else
        {
            bool _3886 = _3317 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3888 = isnan(_3317);
            bool _3890 = _3886 || _3888;
            bool _3892 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3894 = _3890 || _3892;
            if (!_3894)
            {
                _3740 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3896 = _3740;
            _3742 = _3896;
            if (!_3894)
            {
                _3748 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3898 = _3748;
            _3750 = _3898;
            if (!_3894)
            {
                _3756 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3900 = _3756;
            bool _3902 = !_3894;
            _3758 = _3900;
            if (!_3902)
            {
                bool _3904 = _3317 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3906 = isnan(_3317);
                bool _3908 = _3904 || _3906;
                bool _3910 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3912 = _3908 || _3910;
                if (!_3912)
                {
                    float _3914 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3916 = _3317 + _3914;
                    float _3918 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3920 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3918;
                    float _3922 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3924 = _3922 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3926 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3928 = _3926 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3930 = 1.0 / _3920;
                    float _3932 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3934 = _3932 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3936 = _3916 * _3930;
                    float _3938 = precise::clamp(_3936, 0.0, 1.0);
                    float _3940 = fma(_3938, _3924, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3942 = fma(_3938, _3928, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3944 = fma(_3938, _3934, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _3750 = _3942;
                    _3742 = _3940;
                    _3758 = _3944;
                    _3884 = true;
                }
                else
                {
                    _3750 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3742 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3758 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3884 = false;
    float _3946 = _3750;
    float _3948 = _3742;
    float _3950 = _3758;
    float _3952 = _3838 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_87.x = 0.0;
    float _3954 = _3946 * 0.586610972881317138671875;
    bool _3956 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _3952;
    float _3958 = fma(_3948, 0.298911988735198974609375, _3954);
    bool _3960 = _3792 > 0.0;
    bool _3962 = isnan(_3792);
    bool _3964 = _3960 || _3962;
    bool _3966 = isnan(0.0);
    bool _3968 = _3964 || _3966;
    float _3970 = fma(_3950, 0.114477999508380889892578125, _3958);
    bool _3972 = _3816 <= 0.0;
    bool _3974 = !_3968;
    bool _3976 = _3972 || _3974;
    float _3978 = -_3970;
    float _3980 = _3978 + _3948;
    float _3982 = -_3970;
    float _3984 = _3982 + _3946;
    float _3986 = -_3970;
    float _3988 = _3986 + _3950;
    float _3990 = fma(_3980, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3970);
    float _3992 = fma(_3984, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3970);
    float _3994 = fma(_3988, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3970);
    bool _3996 = !_3956;
    if (!_3996)
    {
        float _3998 = -_3289;
        float _4000 = _3998 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4002 = -_3291;
        float _4004 = _4002 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4006 = -_3293;
        float _4008 = _4006 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4010 = _4000 * _4000;
        float _4012 = fma(_4004, _4004, _4010);
        float _4014 = fma(_4008, _4008, _4012);
        float _4016 = sqrt(_4014);
        float _4018 = rsqrt(_4014);
        float _4020 = -_4016;
        float _4022 = _4020 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4024 = _4022 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4026 = precise::clamp(_4024, 0.0, 1.0);
        float _4028 = _4004 * _4018;
        float _4030 = _4000 * _4018;
        float _4032 = abs(_4026);
        float _4034 = log2(_4032);
        float _4036 = _4008 * _4018;
        float _4038 = _4028 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4040 = _2957 * _4030;
        float _4042 = -_4030;
        float _4044 = -_4038;
        float _4046 = fma(_4042, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4044);
        float _4048 = fma(_2947, _4028, _4040);
        float _4050 = -_4036;
        float _4052 = fma(_4050, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4046);
        float _4054 = fma(_2961, _4036, _4048);
        float _4056 = precise::clamp(_4054, 0.0, 1.0);
        float _4058 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4060 = _4052 + _4058;
        float _4062 = _4034 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4064 = _4060 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4066 = precise::clamp(_4064, 0.0, 1.0);
        float _4068 = exp2(_4062);
        float _4070 = _4068 * _4066;
        float _4072 = _4056 * _4070;
        float _4074 = _4072 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4076 = _4072 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4078 = _4072 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _4074;
        out.m_87.y = _4076;
        out.m_87.z = _4078;
    }
    out.m_89.x = _3990;
    out.m_89.y = _3992;
    out.m_89.z = _3994;
    if (!_3976)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _4080 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4080;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

